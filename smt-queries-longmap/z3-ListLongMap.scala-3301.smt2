; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45738 () Bool)

(assert start!45738)

(declare-fun b!505782 () Bool)

(declare-fun res!306926 () Bool)

(declare-fun e!296037 () Bool)

(assert (=> b!505782 (=> (not res!306926) (not e!296037))))

(declare-datatypes ((array!32504 0))(
  ( (array!32505 (arr!15632 (Array (_ BitVec 32) (_ BitVec 64))) (size!15997 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32504)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505782 (= res!306926 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505783 () Bool)

(declare-fun res!306923 () Bool)

(assert (=> b!505783 (=> (not res!306923) (not e!296037))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505783 (= res!306923 (and (= (size!15997 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15997 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15997 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505784 () Bool)

(declare-datatypes ((Unit!15454 0))(
  ( (Unit!15455) )
))
(declare-fun e!296034 () Unit!15454)

(declare-fun Unit!15456 () Unit!15454)

(assert (=> b!505784 (= e!296034 Unit!15456)))

(declare-fun b!505785 () Bool)

(declare-fun e!296038 () Bool)

(assert (=> b!505785 (= e!296037 e!296038)))

(declare-fun res!306915 () Bool)

(assert (=> b!505785 (=> (not res!306915) (not e!296038))))

(declare-datatypes ((SeekEntryResult!4096 0))(
  ( (MissingZero!4096 (index!18572 (_ BitVec 32))) (Found!4096 (index!18573 (_ BitVec 32))) (Intermediate!4096 (undefined!4908 Bool) (index!18574 (_ BitVec 32)) (x!47588 (_ BitVec 32))) (Undefined!4096) (MissingVacant!4096 (index!18575 (_ BitVec 32))) )
))
(declare-fun lt!230598 () SeekEntryResult!4096)

(assert (=> b!505785 (= res!306915 (or (= lt!230598 (MissingZero!4096 i!1204)) (= lt!230598 (MissingVacant!4096 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505785 (= lt!230598 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505786 () Bool)

(declare-fun res!306920 () Bool)

(declare-fun e!296033 () Bool)

(assert (=> b!505786 (=> res!306920 e!296033)))

(declare-fun e!296040 () Bool)

(assert (=> b!505786 (= res!306920 e!296040)))

(declare-fun res!306919 () Bool)

(assert (=> b!505786 (=> (not res!306919) (not e!296040))))

(declare-fun lt!230594 () SeekEntryResult!4096)

(assert (=> b!505786 (= res!306919 (bvsgt #b00000000000000000000000000000000 (x!47588 lt!230594)))))

(declare-fun b!505787 () Bool)

(declare-fun e!296036 () Bool)

(assert (=> b!505787 (= e!296036 e!296033)))

(declare-fun res!306928 () Bool)

(assert (=> b!505787 (=> res!306928 e!296033)))

(declare-fun lt!230593 () (_ BitVec 32))

(assert (=> b!505787 (= res!306928 (or (bvsgt (x!47588 lt!230594) #b01111111111111111111111111111110) (bvslt lt!230593 #b00000000000000000000000000000000) (bvsge lt!230593 (size!15997 a!3235)) (bvslt (index!18574 lt!230594) #b00000000000000000000000000000000) (bvsge (index!18574 lt!230594) (size!15997 a!3235)) (not (= lt!230594 (Intermediate!4096 false (index!18574 lt!230594) (x!47588 lt!230594))))))))

(assert (=> b!505787 (= (index!18574 lt!230594) i!1204)))

(declare-fun lt!230595 () Unit!15454)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15454)

(assert (=> b!505787 (= lt!230595 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230593 #b00000000000000000000000000000000 (index!18574 lt!230594) (x!47588 lt!230594) mask!3524))))

(assert (=> b!505787 (and (or (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230604 () Unit!15454)

(assert (=> b!505787 (= lt!230604 e!296034)))

(declare-fun c!59712 () Bool)

(assert (=> b!505787 (= c!59712 (= (select (arr!15632 a!3235) (index!18574 lt!230594)) (select (arr!15632 a!3235) j!176)))))

(assert (=> b!505787 (and (bvslt (x!47588 lt!230594) #b01111111111111111111111111111110) (or (= (select (arr!15632 a!3235) (index!18574 lt!230594)) (select (arr!15632 a!3235) j!176)) (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15632 a!3235) (index!18574 lt!230594)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505788 () Bool)

(declare-fun lt!230601 () SeekEntryResult!4096)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505788 (= e!296040 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230593 (index!18574 lt!230594) (select (arr!15632 a!3235) j!176) a!3235 mask!3524) lt!230601)))))

(declare-fun b!505789 () Bool)

(declare-fun Unit!15457 () Unit!15454)

(assert (=> b!505789 (= e!296034 Unit!15457)))

(declare-fun lt!230602 () Unit!15454)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15454)

(assert (=> b!505789 (= lt!230602 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230593 #b00000000000000000000000000000000 (index!18574 lt!230594) (x!47588 lt!230594) mask!3524))))

(declare-fun lt!230605 () (_ BitVec 64))

(declare-fun lt!230596 () array!32504)

(declare-fun res!306925 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505789 (= res!306925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230593 lt!230605 lt!230596 mask!3524) (Intermediate!4096 false (index!18574 lt!230594) (x!47588 lt!230594))))))

(declare-fun e!296039 () Bool)

(assert (=> b!505789 (=> (not res!306925) (not e!296039))))

(assert (=> b!505789 e!296039))

(declare-fun b!505790 () Bool)

(assert (=> b!505790 (= e!296033 true)))

(assert (=> b!505790 (= (seekEntryOrOpen!0 lt!230605 lt!230596 mask!3524) lt!230601)))

(declare-fun lt!230603 () Unit!15454)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15454)

(assert (=> b!505790 (= lt!230603 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230593 #b00000000000000000000000000000000 (index!18574 lt!230594) (x!47588 lt!230594) mask!3524))))

(declare-fun res!306922 () Bool)

(assert (=> start!45738 (=> (not res!306922) (not e!296037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45738 (= res!306922 (validMask!0 mask!3524))))

(assert (=> start!45738 e!296037))

(assert (=> start!45738 true))

(declare-fun array_inv!11515 (array!32504) Bool)

(assert (=> start!45738 (array_inv!11515 a!3235)))

(declare-fun b!505791 () Bool)

(assert (=> b!505791 (= e!296038 (not e!296036))))

(declare-fun res!306917 () Bool)

(assert (=> b!505791 (=> res!306917 e!296036)))

(declare-fun lt!230597 () SeekEntryResult!4096)

(get-info :version)

(assert (=> b!505791 (= res!306917 (or (= lt!230594 lt!230597) (undefined!4908 lt!230594) (not ((_ is Intermediate!4096) lt!230594))))))

(declare-fun lt!230599 () (_ BitVec 32))

(assert (=> b!505791 (= lt!230597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230599 lt!230605 lt!230596 mask!3524))))

(assert (=> b!505791 (= lt!230594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230593 (select (arr!15632 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505791 (= lt!230599 (toIndex!0 lt!230605 mask!3524))))

(assert (=> b!505791 (= lt!230605 (select (store (arr!15632 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505791 (= lt!230593 (toIndex!0 (select (arr!15632 a!3235) j!176) mask!3524))))

(assert (=> b!505791 (= lt!230596 (array!32505 (store (arr!15632 a!3235) i!1204 k0!2280) (size!15997 a!3235)))))

(assert (=> b!505791 (= lt!230601 (Found!4096 j!176))))

(declare-fun e!296035 () Bool)

(assert (=> b!505791 e!296035))

(declare-fun res!306918 () Bool)

(assert (=> b!505791 (=> (not res!306918) (not e!296035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32504 (_ BitVec 32)) Bool)

(assert (=> b!505791 (= res!306918 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230600 () Unit!15454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15454)

(assert (=> b!505791 (= lt!230600 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505792 () Bool)

(declare-fun res!306924 () Bool)

(assert (=> b!505792 (=> (not res!306924) (not e!296038))))

(declare-datatypes ((List!9829 0))(
  ( (Nil!9826) (Cons!9825 (h!10702 (_ BitVec 64)) (t!16048 List!9829)) )
))
(declare-fun arrayNoDuplicates!0 (array!32504 (_ BitVec 32) List!9829) Bool)

(assert (=> b!505792 (= res!306924 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9826))))

(declare-fun b!505793 () Bool)

(declare-fun res!306916 () Bool)

(assert (=> b!505793 (=> (not res!306916) (not e!296037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505793 (= res!306916 (validKeyInArray!0 k0!2280))))

(declare-fun b!505794 () Bool)

(assert (=> b!505794 (= e!296035 (= (seekEntryOrOpen!0 (select (arr!15632 a!3235) j!176) a!3235 mask!3524) (Found!4096 j!176)))))

(declare-fun b!505795 () Bool)

(declare-fun res!306921 () Bool)

(assert (=> b!505795 (=> res!306921 e!296033)))

(assert (=> b!505795 (= res!306921 (not (= lt!230597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230593 lt!230605 lt!230596 mask!3524))))))

(declare-fun b!505796 () Bool)

(declare-fun res!306929 () Bool)

(assert (=> b!505796 (=> (not res!306929) (not e!296037))))

(assert (=> b!505796 (= res!306929 (validKeyInArray!0 (select (arr!15632 a!3235) j!176)))))

(declare-fun b!505797 () Bool)

(assert (=> b!505797 (= e!296039 false)))

(declare-fun b!505798 () Bool)

(declare-fun res!306927 () Bool)

(assert (=> b!505798 (=> (not res!306927) (not e!296038))))

(assert (=> b!505798 (= res!306927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45738 res!306922) b!505783))

(assert (= (and b!505783 res!306923) b!505796))

(assert (= (and b!505796 res!306929) b!505793))

(assert (= (and b!505793 res!306916) b!505782))

(assert (= (and b!505782 res!306926) b!505785))

(assert (= (and b!505785 res!306915) b!505798))

(assert (= (and b!505798 res!306927) b!505792))

(assert (= (and b!505792 res!306924) b!505791))

(assert (= (and b!505791 res!306918) b!505794))

(assert (= (and b!505791 (not res!306917)) b!505787))

(assert (= (and b!505787 c!59712) b!505789))

(assert (= (and b!505787 (not c!59712)) b!505784))

(assert (= (and b!505789 res!306925) b!505797))

(assert (= (and b!505787 (not res!306928)) b!505786))

(assert (= (and b!505786 res!306919) b!505788))

(assert (= (and b!505786 (not res!306920)) b!505795))

(assert (= (and b!505795 (not res!306921)) b!505790))

(declare-fun m!485953 () Bool)

(assert (=> b!505785 m!485953))

(declare-fun m!485955 () Bool)

(assert (=> b!505792 m!485955))

(declare-fun m!485957 () Bool)

(assert (=> b!505795 m!485957))

(declare-fun m!485959 () Bool)

(assert (=> start!45738 m!485959))

(declare-fun m!485961 () Bool)

(assert (=> start!45738 m!485961))

(declare-fun m!485963 () Bool)

(assert (=> b!505794 m!485963))

(assert (=> b!505794 m!485963))

(declare-fun m!485965 () Bool)

(assert (=> b!505794 m!485965))

(declare-fun m!485967 () Bool)

(assert (=> b!505782 m!485967))

(declare-fun m!485969 () Bool)

(assert (=> b!505793 m!485969))

(assert (=> b!505796 m!485963))

(assert (=> b!505796 m!485963))

(declare-fun m!485971 () Bool)

(assert (=> b!505796 m!485971))

(declare-fun m!485973 () Bool)

(assert (=> b!505798 m!485973))

(declare-fun m!485975 () Bool)

(assert (=> b!505787 m!485975))

(declare-fun m!485977 () Bool)

(assert (=> b!505787 m!485977))

(assert (=> b!505787 m!485963))

(declare-fun m!485979 () Bool)

(assert (=> b!505790 m!485979))

(declare-fun m!485981 () Bool)

(assert (=> b!505790 m!485981))

(declare-fun m!485983 () Bool)

(assert (=> b!505791 m!485983))

(declare-fun m!485985 () Bool)

(assert (=> b!505791 m!485985))

(declare-fun m!485987 () Bool)

(assert (=> b!505791 m!485987))

(declare-fun m!485989 () Bool)

(assert (=> b!505791 m!485989))

(assert (=> b!505791 m!485963))

(declare-fun m!485991 () Bool)

(assert (=> b!505791 m!485991))

(assert (=> b!505791 m!485963))

(declare-fun m!485993 () Bool)

(assert (=> b!505791 m!485993))

(assert (=> b!505791 m!485963))

(declare-fun m!485995 () Bool)

(assert (=> b!505791 m!485995))

(declare-fun m!485997 () Bool)

(assert (=> b!505791 m!485997))

(assert (=> b!505788 m!485963))

(assert (=> b!505788 m!485963))

(declare-fun m!485999 () Bool)

(assert (=> b!505788 m!485999))

(declare-fun m!486001 () Bool)

(assert (=> b!505789 m!486001))

(assert (=> b!505789 m!485957))

(check-sat (not b!505798) (not b!505794) (not start!45738) (not b!505789) (not b!505787) (not b!505791) (not b!505793) (not b!505795) (not b!505790) (not b!505782) (not b!505785) (not b!505792) (not b!505788) (not b!505796))
(check-sat)
