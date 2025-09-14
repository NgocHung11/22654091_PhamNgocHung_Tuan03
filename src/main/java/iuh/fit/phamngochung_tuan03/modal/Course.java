package iuh.fit.phamngochung_tuan03.modal;

public enum Course {
    BCA("BCA"),
    BCOM("B.Com"),
    BSC("B.Sc"),
    BA("B.A");

    private final String displayName;

    Course(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
