; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52488 () Bool)

(assert start!52488)

(declare-fun b!572782 () Bool)

(declare-fun res!362185 () Bool)

(declare-fun e!329497 () Bool)

(assert (=> b!572782 (=> (not res!362185) (not e!329497))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35832 0))(
  ( (array!35833 (arr!17203 (Array (_ BitVec 32) (_ BitVec 64))) (size!17567 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35832)

(assert (=> b!572782 (= res!362185 (and (= (size!17567 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17567 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17567 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!362196 () Bool)

(assert (=> start!52488 (=> (not res!362196) (not e!329497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52488 (= res!362196 (validMask!0 mask!3119))))

(assert (=> start!52488 e!329497))

(assert (=> start!52488 true))

(declare-fun array_inv!13062 (array!35832) Bool)

(assert (=> start!52488 (array_inv!13062 a!3118)))

(declare-fun b!572783 () Bool)

(declare-fun res!362193 () Bool)

(assert (=> b!572783 (=> (not res!362193) (not e!329497))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572783 (= res!362193 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572784 () Bool)

(declare-fun res!362195 () Bool)

(declare-fun e!329493 () Bool)

(assert (=> b!572784 (=> (not res!362195) (not e!329493))))

(declare-datatypes ((List!11190 0))(
  ( (Nil!11187) (Cons!11186 (h!12216 (_ BitVec 64)) (t!17410 List!11190)) )
))
(declare-fun arrayNoDuplicates!0 (array!35832 (_ BitVec 32) List!11190) Bool)

(assert (=> b!572784 (= res!362195 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11187))))

(declare-fun b!572785 () Bool)

(declare-fun e!329492 () Bool)

(declare-fun e!329499 () Bool)

(assert (=> b!572785 (= e!329492 e!329499)))

(declare-fun res!362190 () Bool)

(assert (=> b!572785 (=> res!362190 e!329499)))

(declare-fun lt!261453 () (_ BitVec 64))

(assert (=> b!572785 (= res!362190 (or (= lt!261453 (select (arr!17203 a!3118) j!142)) (= lt!261453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5608 0))(
  ( (MissingZero!5608 (index!24659 (_ BitVec 32))) (Found!5608 (index!24660 (_ BitVec 32))) (Intermediate!5608 (undefined!6420 Bool) (index!24661 (_ BitVec 32)) (x!53680 (_ BitVec 32))) (Undefined!5608) (MissingVacant!5608 (index!24662 (_ BitVec 32))) )
))
(declare-fun lt!261446 () SeekEntryResult!5608)

(assert (=> b!572785 (= lt!261453 (select (arr!17203 a!3118) (index!24661 lt!261446)))))

(declare-fun b!572786 () Bool)

(declare-fun res!362197 () Bool)

(assert (=> b!572786 (=> (not res!362197) (not e!329497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572786 (= res!362197 (validKeyInArray!0 k0!1914))))

(declare-fun b!572787 () Bool)

(declare-fun e!329496 () Bool)

(assert (=> b!572787 (= e!329496 (not true))))

(declare-fun e!329495 () Bool)

(assert (=> b!572787 e!329495))

(declare-fun res!362194 () Bool)

(assert (=> b!572787 (=> (not res!362194) (not e!329495))))

(declare-fun lt!261451 () SeekEntryResult!5608)

(assert (=> b!572787 (= res!362194 (= lt!261451 (Found!5608 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35832 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!572787 (= lt!261451 (seekEntryOrOpen!0 (select (arr!17203 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35832 (_ BitVec 32)) Bool)

(assert (=> b!572787 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17989 0))(
  ( (Unit!17990) )
))
(declare-fun lt!261449 () Unit!17989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17989)

(assert (=> b!572787 (= lt!261449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572788 () Bool)

(assert (=> b!572788 (= e!329493 e!329496)))

(declare-fun res!362187 () Bool)

(assert (=> b!572788 (=> (not res!362187) (not e!329496))))

(declare-fun lt!261452 () array!35832)

(declare-fun lt!261447 () (_ BitVec 64))

(declare-fun lt!261448 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35832 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!572788 (= res!362187 (= lt!261446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261448 lt!261447 lt!261452 mask!3119)))))

(declare-fun lt!261450 () (_ BitVec 32))

(assert (=> b!572788 (= lt!261446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261450 (select (arr!17203 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572788 (= lt!261448 (toIndex!0 lt!261447 mask!3119))))

(assert (=> b!572788 (= lt!261447 (select (store (arr!17203 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572788 (= lt!261450 (toIndex!0 (select (arr!17203 a!3118) j!142) mask!3119))))

(assert (=> b!572788 (= lt!261452 (array!35833 (store (arr!17203 a!3118) i!1132 k0!1914) (size!17567 a!3118)))))

(declare-fun b!572789 () Bool)

(assert (=> b!572789 (= e!329497 e!329493)))

(declare-fun res!362192 () Bool)

(assert (=> b!572789 (=> (not res!362192) (not e!329493))))

(declare-fun lt!261454 () SeekEntryResult!5608)

(assert (=> b!572789 (= res!362192 (or (= lt!261454 (MissingZero!5608 i!1132)) (= lt!261454 (MissingVacant!5608 i!1132))))))

(assert (=> b!572789 (= lt!261454 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572790 () Bool)

(assert (=> b!572790 (= e!329495 e!329492)))

(declare-fun res!362188 () Bool)

(assert (=> b!572790 (=> res!362188 e!329492)))

(get-info :version)

(assert (=> b!572790 (= res!362188 (or (undefined!6420 lt!261446) (not ((_ is Intermediate!5608) lt!261446))))))

(declare-fun b!572791 () Bool)

(declare-fun e!329494 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35832 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!572791 (= e!329494 (= (seekEntryOrOpen!0 lt!261447 lt!261452 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53680 lt!261446) (index!24661 lt!261446) (index!24661 lt!261446) lt!261447 lt!261452 mask!3119)))))

(declare-fun b!572792 () Bool)

(declare-fun res!362189 () Bool)

(assert (=> b!572792 (=> (not res!362189) (not e!329493))))

(assert (=> b!572792 (= res!362189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572793 () Bool)

(assert (=> b!572793 (= e!329499 e!329494)))

(declare-fun res!362186 () Bool)

(assert (=> b!572793 (=> (not res!362186) (not e!329494))))

(assert (=> b!572793 (= res!362186 (= lt!261451 (seekKeyOrZeroReturnVacant!0 (x!53680 lt!261446) (index!24661 lt!261446) (index!24661 lt!261446) (select (arr!17203 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572794 () Bool)

(declare-fun res!362191 () Bool)

(assert (=> b!572794 (=> (not res!362191) (not e!329497))))

(assert (=> b!572794 (= res!362191 (validKeyInArray!0 (select (arr!17203 a!3118) j!142)))))

(assert (= (and start!52488 res!362196) b!572782))

(assert (= (and b!572782 res!362185) b!572794))

(assert (= (and b!572794 res!362191) b!572786))

(assert (= (and b!572786 res!362197) b!572783))

(assert (= (and b!572783 res!362193) b!572789))

(assert (= (and b!572789 res!362192) b!572792))

(assert (= (and b!572792 res!362189) b!572784))

(assert (= (and b!572784 res!362195) b!572788))

(assert (= (and b!572788 res!362187) b!572787))

(assert (= (and b!572787 res!362194) b!572790))

(assert (= (and b!572790 (not res!362188)) b!572785))

(assert (= (and b!572785 (not res!362190)) b!572793))

(assert (= (and b!572793 res!362186) b!572791))

(declare-fun m!551915 () Bool)

(assert (=> b!572786 m!551915))

(declare-fun m!551917 () Bool)

(assert (=> b!572785 m!551917))

(declare-fun m!551919 () Bool)

(assert (=> b!572785 m!551919))

(declare-fun m!551921 () Bool)

(assert (=> b!572783 m!551921))

(assert (=> b!572788 m!551917))

(declare-fun m!551923 () Bool)

(assert (=> b!572788 m!551923))

(declare-fun m!551925 () Bool)

(assert (=> b!572788 m!551925))

(assert (=> b!572788 m!551917))

(declare-fun m!551927 () Bool)

(assert (=> b!572788 m!551927))

(assert (=> b!572788 m!551917))

(declare-fun m!551929 () Bool)

(assert (=> b!572788 m!551929))

(declare-fun m!551931 () Bool)

(assert (=> b!572788 m!551931))

(declare-fun m!551933 () Bool)

(assert (=> b!572788 m!551933))

(declare-fun m!551935 () Bool)

(assert (=> start!52488 m!551935))

(declare-fun m!551937 () Bool)

(assert (=> start!52488 m!551937))

(declare-fun m!551939 () Bool)

(assert (=> b!572789 m!551939))

(assert (=> b!572787 m!551917))

(assert (=> b!572787 m!551917))

(declare-fun m!551941 () Bool)

(assert (=> b!572787 m!551941))

(declare-fun m!551943 () Bool)

(assert (=> b!572787 m!551943))

(declare-fun m!551945 () Bool)

(assert (=> b!572787 m!551945))

(declare-fun m!551947 () Bool)

(assert (=> b!572791 m!551947))

(declare-fun m!551949 () Bool)

(assert (=> b!572791 m!551949))

(declare-fun m!551951 () Bool)

(assert (=> b!572792 m!551951))

(declare-fun m!551953 () Bool)

(assert (=> b!572784 m!551953))

(assert (=> b!572793 m!551917))

(assert (=> b!572793 m!551917))

(declare-fun m!551955 () Bool)

(assert (=> b!572793 m!551955))

(assert (=> b!572794 m!551917))

(assert (=> b!572794 m!551917))

(declare-fun m!551957 () Bool)

(assert (=> b!572794 m!551957))

(check-sat (not b!572792) (not b!572791) (not b!572787) (not b!572786) (not start!52488) (not b!572793) (not b!572788) (not b!572784) (not b!572789) (not b!572783) (not b!572794))
(check-sat)
