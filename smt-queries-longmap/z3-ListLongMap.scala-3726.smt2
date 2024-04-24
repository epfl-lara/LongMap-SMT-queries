; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51396 () Bool)

(assert start!51396)

(declare-fun b!560716 () Bool)

(declare-fun e!323086 () Bool)

(assert (=> b!560716 (= e!323086 (not true))))

(declare-fun e!323088 () Bool)

(assert (=> b!560716 e!323088))

(declare-fun res!351770 () Bool)

(assert (=> b!560716 (=> (not res!351770) (not e!323088))))

(declare-datatypes ((SeekEntryResult!5308 0))(
  ( (MissingZero!5308 (index!23459 (_ BitVec 32))) (Found!5308 (index!23460 (_ BitVec 32))) (Intermediate!5308 (undefined!6120 Bool) (index!23461 (_ BitVec 32)) (x!52526 (_ BitVec 32))) (Undefined!5308) (MissingVacant!5308 (index!23462 (_ BitVec 32))) )
))
(declare-fun lt!254987 () SeekEntryResult!5308)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560716 (= res!351770 (= lt!254987 (Found!5308 j!142)))))

(declare-datatypes ((array!35208 0))(
  ( (array!35209 (arr!16903 (Array (_ BitVec 32) (_ BitVec 64))) (size!17267 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35208)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35208 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!560716 (= lt!254987 (seekEntryOrOpen!0 (select (arr!16903 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35208 (_ BitVec 32)) Bool)

(assert (=> b!560716 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17461 0))(
  ( (Unit!17462) )
))
(declare-fun lt!254981 () Unit!17461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17461)

(assert (=> b!560716 (= lt!254981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560717 () Bool)

(declare-fun e!323084 () Bool)

(assert (=> b!560717 (= e!323088 e!323084)))

(declare-fun res!351772 () Bool)

(assert (=> b!560717 (=> res!351772 e!323084)))

(declare-fun lt!254983 () SeekEntryResult!5308)

(get-info :version)

(assert (=> b!560717 (= res!351772 (or (undefined!6120 lt!254983) (not ((_ is Intermediate!5308) lt!254983))))))

(declare-fun b!560718 () Bool)

(declare-fun res!351767 () Bool)

(declare-fun e!323085 () Bool)

(assert (=> b!560718 (=> (not res!351767) (not e!323085))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560718 (= res!351767 (and (= (size!17267 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17267 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17267 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560719 () Bool)

(declare-fun res!351763 () Bool)

(assert (=> b!560719 (=> (not res!351763) (not e!323085))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560719 (= res!351763 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560720 () Bool)

(declare-fun e!323082 () Bool)

(assert (=> b!560720 (= e!323082 e!323086)))

(declare-fun res!351771 () Bool)

(assert (=> b!560720 (=> (not res!351771) (not e!323086))))

(declare-fun lt!254985 () (_ BitVec 32))

(declare-fun lt!254984 () (_ BitVec 64))

(declare-fun lt!254988 () array!35208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35208 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!560720 (= res!351771 (= lt!254983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254985 lt!254984 lt!254988 mask!3119)))))

(declare-fun lt!254986 () (_ BitVec 32))

(assert (=> b!560720 (= lt!254983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254986 (select (arr!16903 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560720 (= lt!254985 (toIndex!0 lt!254984 mask!3119))))

(assert (=> b!560720 (= lt!254984 (select (store (arr!16903 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560720 (= lt!254986 (toIndex!0 (select (arr!16903 a!3118) j!142) mask!3119))))

(assert (=> b!560720 (= lt!254988 (array!35209 (store (arr!16903 a!3118) i!1132 k0!1914) (size!17267 a!3118)))))

(declare-fun b!560721 () Bool)

(assert (=> b!560721 (= e!323085 e!323082)))

(declare-fun res!351775 () Bool)

(assert (=> b!560721 (=> (not res!351775) (not e!323082))))

(declare-fun lt!254982 () SeekEntryResult!5308)

(assert (=> b!560721 (= res!351775 (or (= lt!254982 (MissingZero!5308 i!1132)) (= lt!254982 (MissingVacant!5308 i!1132))))))

(assert (=> b!560721 (= lt!254982 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560722 () Bool)

(declare-fun res!351768 () Bool)

(assert (=> b!560722 (=> (not res!351768) (not e!323082))))

(declare-datatypes ((List!10890 0))(
  ( (Nil!10887) (Cons!10886 (h!11892 (_ BitVec 64)) (t!17110 List!10890)) )
))
(declare-fun arrayNoDuplicates!0 (array!35208 (_ BitVec 32) List!10890) Bool)

(assert (=> b!560722 (= res!351768 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10887))))

(declare-fun e!323083 () Bool)

(declare-fun b!560724 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35208 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!560724 (= e!323083 (= (seekEntryOrOpen!0 lt!254984 lt!254988 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52526 lt!254983) (index!23461 lt!254983) (index!23461 lt!254983) lt!254984 lt!254988 mask!3119)))))

(declare-fun b!560725 () Bool)

(declare-fun e!323087 () Bool)

(assert (=> b!560725 (= e!323087 e!323083)))

(declare-fun res!351765 () Bool)

(assert (=> b!560725 (=> (not res!351765) (not e!323083))))

(assert (=> b!560725 (= res!351765 (= lt!254987 (seekKeyOrZeroReturnVacant!0 (x!52526 lt!254983) (index!23461 lt!254983) (index!23461 lt!254983) (select (arr!16903 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560726 () Bool)

(declare-fun res!351769 () Bool)

(assert (=> b!560726 (=> (not res!351769) (not e!323085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560726 (= res!351769 (validKeyInArray!0 k0!1914))))

(declare-fun b!560727 () Bool)

(declare-fun res!351774 () Bool)

(assert (=> b!560727 (=> (not res!351774) (not e!323082))))

(assert (=> b!560727 (= res!351774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560728 () Bool)

(declare-fun res!351764 () Bool)

(assert (=> b!560728 (=> (not res!351764) (not e!323085))))

(assert (=> b!560728 (= res!351764 (validKeyInArray!0 (select (arr!16903 a!3118) j!142)))))

(declare-fun res!351766 () Bool)

(assert (=> start!51396 (=> (not res!351766) (not e!323085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51396 (= res!351766 (validMask!0 mask!3119))))

(assert (=> start!51396 e!323085))

(assert (=> start!51396 true))

(declare-fun array_inv!12762 (array!35208) Bool)

(assert (=> start!51396 (array_inv!12762 a!3118)))

(declare-fun b!560723 () Bool)

(assert (=> b!560723 (= e!323084 e!323087)))

(declare-fun res!351773 () Bool)

(assert (=> b!560723 (=> res!351773 e!323087)))

(declare-fun lt!254989 () (_ BitVec 64))

(assert (=> b!560723 (= res!351773 (or (= lt!254989 (select (arr!16903 a!3118) j!142)) (= lt!254989 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560723 (= lt!254989 (select (arr!16903 a!3118) (index!23461 lt!254983)))))

(assert (= (and start!51396 res!351766) b!560718))

(assert (= (and b!560718 res!351767) b!560728))

(assert (= (and b!560728 res!351764) b!560726))

(assert (= (and b!560726 res!351769) b!560719))

(assert (= (and b!560719 res!351763) b!560721))

(assert (= (and b!560721 res!351775) b!560727))

(assert (= (and b!560727 res!351774) b!560722))

(assert (= (and b!560722 res!351768) b!560720))

(assert (= (and b!560720 res!351771) b!560716))

(assert (= (and b!560716 res!351770) b!560717))

(assert (= (and b!560717 (not res!351772)) b!560723))

(assert (= (and b!560723 (not res!351773)) b!560725))

(assert (= (and b!560725 res!351765) b!560724))

(declare-fun m!538631 () Bool)

(assert (=> b!560722 m!538631))

(declare-fun m!538633 () Bool)

(assert (=> b!560721 m!538633))

(declare-fun m!538635 () Bool)

(assert (=> b!560719 m!538635))

(declare-fun m!538637 () Bool)

(assert (=> b!560720 m!538637))

(declare-fun m!538639 () Bool)

(assert (=> b!560720 m!538639))

(declare-fun m!538641 () Bool)

(assert (=> b!560720 m!538641))

(assert (=> b!560720 m!538637))

(declare-fun m!538643 () Bool)

(assert (=> b!560720 m!538643))

(assert (=> b!560720 m!538637))

(declare-fun m!538645 () Bool)

(assert (=> b!560720 m!538645))

(declare-fun m!538647 () Bool)

(assert (=> b!560720 m!538647))

(declare-fun m!538649 () Bool)

(assert (=> b!560720 m!538649))

(assert (=> b!560728 m!538637))

(assert (=> b!560728 m!538637))

(declare-fun m!538651 () Bool)

(assert (=> b!560728 m!538651))

(assert (=> b!560716 m!538637))

(assert (=> b!560716 m!538637))

(declare-fun m!538653 () Bool)

(assert (=> b!560716 m!538653))

(declare-fun m!538655 () Bool)

(assert (=> b!560716 m!538655))

(declare-fun m!538657 () Bool)

(assert (=> b!560716 m!538657))

(assert (=> b!560723 m!538637))

(declare-fun m!538659 () Bool)

(assert (=> b!560723 m!538659))

(declare-fun m!538661 () Bool)

(assert (=> b!560724 m!538661))

(declare-fun m!538663 () Bool)

(assert (=> b!560724 m!538663))

(declare-fun m!538665 () Bool)

(assert (=> b!560727 m!538665))

(declare-fun m!538667 () Bool)

(assert (=> start!51396 m!538667))

(declare-fun m!538669 () Bool)

(assert (=> start!51396 m!538669))

(declare-fun m!538671 () Bool)

(assert (=> b!560726 m!538671))

(assert (=> b!560725 m!538637))

(assert (=> b!560725 m!538637))

(declare-fun m!538673 () Bool)

(assert (=> b!560725 m!538673))

(check-sat (not b!560724) (not b!560727) (not b!560726) (not b!560725) (not b!560728) (not b!560721) (not start!51396) (not b!560720) (not b!560719) (not b!560716) (not b!560722))
(check-sat)
