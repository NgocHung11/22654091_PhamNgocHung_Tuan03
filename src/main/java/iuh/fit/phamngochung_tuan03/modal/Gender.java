package iuh.fit.phamngochung_tuan03.modal;

public enum Gender {
    MALE("Male"),
    FEMALE("Female");

    private final String displayName;
    Gender(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
