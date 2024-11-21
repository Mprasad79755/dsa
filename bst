#include <stdio.h>
#include <stdlib.h>

// Define the structure for a node
typedef struct BST {
    int data;
    struct BST *lchild, *rchild;
} node;

// Function declarations
node *get_node(int data);
void insert(node **root, int data);
void inorder(node *root);
void preorder(node *root);
void postorder(node *root);
node *search(node *root, int key);

int main() {
    int choice, n, i, key, value;
    node *root = NULL;

    printf("\nProgram For Binary Search Tree ");
    do {
        printf("\n\n--- MENU ---\n");
        printf("1. Create\n");
        printf("2. Recursive Traversals\n");
        printf("3. Search\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("\nHow many nodes do you want to enter? ");
                scanf("%d", &n);
                printf("Enter %d elements: ", n);
                for (i = 0; i < n; i++) {
                    scanf("%d", &value);
                    insert(&root, value);
                }
                break;

            case 2:
                if (root == NULL) {
                    printf("Tree is empty.\n");
                } else {
                    printf("\nInorder Traversal: ");
                    inorder(root);
                    printf("\nPreorder Traversal: ");
                    preorder(root);
                    printf("\nPostorder Traversal: ");
                    postorder(root);
                }
                break;

            case 3:
                printf("\nEnter element to search: ");
                scanf("%d", &key);
                node *result = search(root, key);
                if (result) {
                    printf("\nThe element %d is present in the BST.\n", result->data);
                } else {
                    printf("\nThe element %d is not present in the BST.\n", key);
                }
                break;

            case 4:
                printf("\nExiting...\n");
                exit(0);

            default:
                printf("\nInvalid choice! Please try again.\n");
        }
    } while (choice != 4);

    return 0;
}

// Function to create a new node
node *get_node(int data) {
    node *temp = (node *)malloc(sizeof(node));
    if (!temp) {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    temp->data = data;
    temp->lchild = temp->rchild = NULL;
    return temp;
}

// Function to insert a node into the BST
void insert(node **root, int data) {
    if (*root == NULL) {
        *root = get_node(data);
        return;
    }
    if (data < (*root)->data) {
        insert(&(*root)->lchild, data);
    } else if (data > (*root)->data) {
        insert(&(*root)->rchild, data);
    }
}

// Function for searching an element in the BST
node *search(node *root, int key) {
    if (root == NULL || root->data == key) {
        return root;
    }
    if (key < root->data) {
        return search(root->lchild, key);
    }
    return search(root->rchild, key);
}

// Function for inorder traversal
void inorder(node *root) {
    if (root != NULL) {
        inorder(root->lchild);
        printf("%d ", root->data);
        inorder(root->rchild);
    }
}

// Function for preorder traversal
void preorder(node *root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preorder(root->lchild);
        preorder(root->rchild);
    }
}

// Function for postorder traversal
void postorder(node *root) {
    if (root != NULL) {
        postorder(root->lchild);
        postorder(root->rchild);
        printf("%d ", root->data);
    }
}
