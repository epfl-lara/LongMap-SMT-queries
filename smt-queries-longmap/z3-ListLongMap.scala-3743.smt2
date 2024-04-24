; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51498 () Bool)

(assert start!51498)

(declare-fun b!562694 () Bool)

(declare-fun res!353751 () Bool)

(declare-fun e!324297 () Bool)

(assert (=> b!562694 (=> (not res!353751) (not e!324297))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35310 0))(
  ( (array!35311 (arr!16954 (Array (_ BitVec 32) (_ BitVec 64))) (size!17318 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35310)

(assert (=> b!562694 (= res!353751 (and (= (size!17318 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17318 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17318 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562695 () Bool)

(declare-fun res!353748 () Bool)

(assert (=> b!562695 (=> (not res!353748) (not e!324297))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562695 (= res!353748 (validKeyInArray!0 k0!1914))))

(declare-fun b!562696 () Bool)

(declare-fun e!324298 () Bool)

(declare-fun e!324299 () Bool)

(assert (=> b!562696 (= e!324298 e!324299)))

(declare-fun res!353745 () Bool)

(assert (=> b!562696 (=> res!353745 e!324299)))

(declare-fun lt!256419 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5359 0))(
  ( (MissingZero!5359 (index!23663 (_ BitVec 32))) (Found!5359 (index!23664 (_ BitVec 32))) (Intermediate!5359 (undefined!6171 Bool) (index!23665 (_ BitVec 32)) (x!52713 (_ BitVec 32))) (Undefined!5359) (MissingVacant!5359 (index!23666 (_ BitVec 32))) )
))
(declare-fun lt!256418 () SeekEntryResult!5359)

(declare-fun lt!256421 () SeekEntryResult!5359)

(declare-fun lt!256424 () SeekEntryResult!5359)

(assert (=> b!562696 (= res!353745 (or (bvslt (index!23665 lt!256418) #b00000000000000000000000000000000) (bvsge (index!23665 lt!256418) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52713 lt!256418) #b01111111111111111111111111111110) (bvslt (x!52713 lt!256418) #b00000000000000000000000000000000) (not (= lt!256419 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16954 a!3118) i!1132 k0!1914) (index!23665 lt!256418)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256421 lt!256424))))))

(declare-fun lt!256423 () SeekEntryResult!5359)

(declare-fun lt!256416 () SeekEntryResult!5359)

(assert (=> b!562696 (= lt!256423 lt!256416)))

(declare-fun lt!256413 () (_ BitVec 64))

(declare-fun lt!256420 () array!35310)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35310 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!562696 (= lt!256416 (seekKeyOrZeroReturnVacant!0 (x!52713 lt!256418) (index!23665 lt!256418) (index!23665 lt!256418) lt!256413 lt!256420 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35310 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!562696 (= lt!256423 (seekEntryOrOpen!0 lt!256413 lt!256420 mask!3119))))

(declare-fun lt!256414 () SeekEntryResult!5359)

(assert (=> b!562696 (= lt!256414 lt!256421)))

(assert (=> b!562696 (= lt!256421 (seekKeyOrZeroReturnVacant!0 (x!52713 lt!256418) (index!23665 lt!256418) (index!23665 lt!256418) (select (arr!16954 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562697 () Bool)

(declare-fun e!324294 () Bool)

(declare-fun e!324300 () Bool)

(assert (=> b!562697 (= e!324294 e!324300)))

(declare-fun res!353744 () Bool)

(assert (=> b!562697 (=> (not res!353744) (not e!324300))))

(declare-fun lt!256415 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35310 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!562697 (= res!353744 (= lt!256418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256415 lt!256413 lt!256420 mask!3119)))))

(declare-fun lt!256426 () (_ BitVec 32))

(assert (=> b!562697 (= lt!256418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256426 (select (arr!16954 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562697 (= lt!256415 (toIndex!0 lt!256413 mask!3119))))

(assert (=> b!562697 (= lt!256413 (select (store (arr!16954 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562697 (= lt!256426 (toIndex!0 (select (arr!16954 a!3118) j!142) mask!3119))))

(assert (=> b!562697 (= lt!256420 (array!35311 (store (arr!16954 a!3118) i!1132 k0!1914) (size!17318 a!3118)))))

(declare-fun b!562698 () Bool)

(assert (=> b!562698 (= e!324299 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562698 (= lt!256421 lt!256416)))

(declare-datatypes ((Unit!17563 0))(
  ( (Unit!17564) )
))
(declare-fun lt!256425 () Unit!17563)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35310 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17563)

(assert (=> b!562698 (= lt!256425 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52713 lt!256418) (index!23665 lt!256418) (index!23665 lt!256418) mask!3119))))

(declare-fun b!562699 () Bool)

(declare-fun res!353741 () Bool)

(assert (=> b!562699 (=> (not res!353741) (not e!324297))))

(declare-fun arrayContainsKey!0 (array!35310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562699 (= res!353741 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562700 () Bool)

(declare-fun e!324295 () Bool)

(assert (=> b!562700 (= e!324300 (not e!324295))))

(declare-fun res!353750 () Bool)

(assert (=> b!562700 (=> res!353750 e!324295)))

(get-info :version)

(assert (=> b!562700 (= res!353750 (or (undefined!6171 lt!256418) (not ((_ is Intermediate!5359) lt!256418))))))

(assert (=> b!562700 (= lt!256414 lt!256424)))

(assert (=> b!562700 (= lt!256424 (Found!5359 j!142))))

(assert (=> b!562700 (= lt!256414 (seekEntryOrOpen!0 (select (arr!16954 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35310 (_ BitVec 32)) Bool)

(assert (=> b!562700 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256422 () Unit!17563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17563)

(assert (=> b!562700 (= lt!256422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!353749 () Bool)

(assert (=> start!51498 (=> (not res!353749) (not e!324297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51498 (= res!353749 (validMask!0 mask!3119))))

(assert (=> start!51498 e!324297))

(assert (=> start!51498 true))

(declare-fun array_inv!12813 (array!35310) Bool)

(assert (=> start!51498 (array_inv!12813 a!3118)))

(declare-fun b!562701 () Bool)

(assert (=> b!562701 (= e!324297 e!324294)))

(declare-fun res!353746 () Bool)

(assert (=> b!562701 (=> (not res!353746) (not e!324294))))

(declare-fun lt!256417 () SeekEntryResult!5359)

(assert (=> b!562701 (= res!353746 (or (= lt!256417 (MissingZero!5359 i!1132)) (= lt!256417 (MissingVacant!5359 i!1132))))))

(assert (=> b!562701 (= lt!256417 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562702 () Bool)

(assert (=> b!562702 (= e!324295 e!324298)))

(declare-fun res!353743 () Bool)

(assert (=> b!562702 (=> res!353743 e!324298)))

(assert (=> b!562702 (= res!353743 (or (= lt!256419 (select (arr!16954 a!3118) j!142)) (= lt!256419 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562702 (= lt!256419 (select (arr!16954 a!3118) (index!23665 lt!256418)))))

(declare-fun b!562703 () Bool)

(declare-fun res!353747 () Bool)

(assert (=> b!562703 (=> (not res!353747) (not e!324297))))

(assert (=> b!562703 (= res!353747 (validKeyInArray!0 (select (arr!16954 a!3118) j!142)))))

(declare-fun b!562704 () Bool)

(declare-fun res!353752 () Bool)

(assert (=> b!562704 (=> (not res!353752) (not e!324294))))

(assert (=> b!562704 (= res!353752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562705 () Bool)

(declare-fun res!353742 () Bool)

(assert (=> b!562705 (=> (not res!353742) (not e!324294))))

(declare-datatypes ((List!10941 0))(
  ( (Nil!10938) (Cons!10937 (h!11943 (_ BitVec 64)) (t!17161 List!10941)) )
))
(declare-fun arrayNoDuplicates!0 (array!35310 (_ BitVec 32) List!10941) Bool)

(assert (=> b!562705 (= res!353742 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10938))))

(assert (= (and start!51498 res!353749) b!562694))

(assert (= (and b!562694 res!353751) b!562703))

(assert (= (and b!562703 res!353747) b!562695))

(assert (= (and b!562695 res!353748) b!562699))

(assert (= (and b!562699 res!353741) b!562701))

(assert (= (and b!562701 res!353746) b!562704))

(assert (= (and b!562704 res!353752) b!562705))

(assert (= (and b!562705 res!353742) b!562697))

(assert (= (and b!562697 res!353744) b!562700))

(assert (= (and b!562700 (not res!353750)) b!562702))

(assert (= (and b!562702 (not res!353743)) b!562696))

(assert (= (and b!562696 (not res!353745)) b!562698))

(declare-fun m!540887 () Bool)

(assert (=> b!562696 m!540887))

(declare-fun m!540889 () Bool)

(assert (=> b!562696 m!540889))

(declare-fun m!540891 () Bool)

(assert (=> b!562696 m!540891))

(declare-fun m!540893 () Bool)

(assert (=> b!562696 m!540893))

(declare-fun m!540895 () Bool)

(assert (=> b!562696 m!540895))

(assert (=> b!562696 m!540895))

(declare-fun m!540897 () Bool)

(assert (=> b!562696 m!540897))

(declare-fun m!540899 () Bool)

(assert (=> b!562698 m!540899))

(declare-fun m!540901 () Bool)

(assert (=> b!562699 m!540901))

(declare-fun m!540903 () Bool)

(assert (=> b!562701 m!540903))

(assert (=> b!562703 m!540895))

(assert (=> b!562703 m!540895))

(declare-fun m!540905 () Bool)

(assert (=> b!562703 m!540905))

(assert (=> b!562702 m!540895))

(declare-fun m!540907 () Bool)

(assert (=> b!562702 m!540907))

(declare-fun m!540909 () Bool)

(assert (=> b!562695 m!540909))

(assert (=> b!562697 m!540895))

(declare-fun m!540911 () Bool)

(assert (=> b!562697 m!540911))

(declare-fun m!540913 () Bool)

(assert (=> b!562697 m!540913))

(declare-fun m!540915 () Bool)

(assert (=> b!562697 m!540915))

(declare-fun m!540917 () Bool)

(assert (=> b!562697 m!540917))

(assert (=> b!562697 m!540891))

(assert (=> b!562697 m!540895))

(declare-fun m!540919 () Bool)

(assert (=> b!562697 m!540919))

(assert (=> b!562697 m!540895))

(assert (=> b!562700 m!540895))

(assert (=> b!562700 m!540895))

(declare-fun m!540921 () Bool)

(assert (=> b!562700 m!540921))

(declare-fun m!540923 () Bool)

(assert (=> b!562700 m!540923))

(declare-fun m!540925 () Bool)

(assert (=> b!562700 m!540925))

(declare-fun m!540927 () Bool)

(assert (=> b!562705 m!540927))

(declare-fun m!540929 () Bool)

(assert (=> start!51498 m!540929))

(declare-fun m!540931 () Bool)

(assert (=> start!51498 m!540931))

(declare-fun m!540933 () Bool)

(assert (=> b!562704 m!540933))

(check-sat (not b!562698) (not b!562695) (not b!562697) (not b!562703) (not b!562699) (not b!562700) (not start!51498) (not b!562704) (not b!562705) (not b!562696) (not b!562701))
(check-sat)
