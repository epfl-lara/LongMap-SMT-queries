; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45436 () Bool)

(assert start!45436)

(declare-fun b!499773 () Bool)

(declare-fun res!301694 () Bool)

(declare-fun e!292847 () Bool)

(assert (=> b!499773 (=> res!301694 e!292847)))

(declare-datatypes ((SeekEntryResult!3979 0))(
  ( (MissingZero!3979 (index!18098 (_ BitVec 32))) (Found!3979 (index!18099 (_ BitVec 32))) (Intermediate!3979 (undefined!4791 Bool) (index!18100 (_ BitVec 32)) (x!47136 (_ BitVec 32))) (Undefined!3979) (MissingVacant!3979 (index!18101 (_ BitVec 32))) )
))
(declare-fun lt!226677 () SeekEntryResult!3979)

(assert (=> b!499773 (= res!301694 (or (undefined!4791 lt!226677) (not (is-Intermediate!3979 lt!226677))))))

(declare-fun b!499774 () Bool)

(declare-fun e!292848 () Bool)

(assert (=> b!499774 (= e!292848 (not e!292847))))

(declare-fun res!301696 () Bool)

(assert (=> b!499774 (=> res!301696 e!292847)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32261 0))(
  ( (array!32262 (arr!15512 (Array (_ BitVec 32) (_ BitVec 64))) (size!15876 (_ BitVec 32))) )
))
(declare-fun lt!226669 () array!32261)

(declare-fun lt!226671 () (_ BitVec 32))

(declare-fun lt!226673 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32261 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!499774 (= res!301696 (= lt!226677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226671 lt!226673 lt!226669 mask!3524)))))

(declare-fun a!3235 () array!32261)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226670 () (_ BitVec 32))

(assert (=> b!499774 (= lt!226677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226670 (select (arr!15512 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499774 (= lt!226671 (toIndex!0 lt!226673 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499774 (= lt!226673 (select (store (arr!15512 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499774 (= lt!226670 (toIndex!0 (select (arr!15512 a!3235) j!176) mask!3524))))

(assert (=> b!499774 (= lt!226669 (array!32262 (store (arr!15512 a!3235) i!1204 k!2280) (size!15876 a!3235)))))

(declare-fun e!292849 () Bool)

(assert (=> b!499774 e!292849))

(declare-fun res!301697 () Bool)

(assert (=> b!499774 (=> (not res!301697) (not e!292849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32261 (_ BitVec 32)) Bool)

(assert (=> b!499774 (= res!301697 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14992 0))(
  ( (Unit!14993) )
))
(declare-fun lt!226678 () Unit!14992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14992)

(assert (=> b!499774 (= lt!226678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499775 () Bool)

(declare-fun e!292851 () Unit!14992)

(declare-fun Unit!14994 () Unit!14992)

(assert (=> b!499775 (= e!292851 Unit!14994)))

(declare-fun lt!226675 () Unit!14992)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14992)

(assert (=> b!499775 (= lt!226675 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226670 #b00000000000000000000000000000000 (index!18100 lt!226677) (x!47136 lt!226677) mask!3524))))

(declare-fun res!301698 () Bool)

(assert (=> b!499775 (= res!301698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226670 lt!226673 lt!226669 mask!3524) (Intermediate!3979 false (index!18100 lt!226677) (x!47136 lt!226677))))))

(declare-fun e!292853 () Bool)

(assert (=> b!499775 (=> (not res!301698) (not e!292853))))

(assert (=> b!499775 e!292853))

(declare-fun b!499776 () Bool)

(declare-fun res!301692 () Bool)

(declare-fun e!292852 () Bool)

(assert (=> b!499776 (=> (not res!301692) (not e!292852))))

(assert (=> b!499776 (= res!301692 (and (= (size!15876 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15876 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15876 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499777 () Bool)

(declare-fun Unit!14995 () Unit!14992)

(assert (=> b!499777 (= e!292851 Unit!14995)))

(declare-fun b!499778 () Bool)

(declare-fun res!301703 () Bool)

(assert (=> b!499778 (=> (not res!301703) (not e!292852))))

(declare-fun arrayContainsKey!0 (array!32261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499778 (= res!301703 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499779 () Bool)

(declare-fun res!301691 () Bool)

(assert (=> b!499779 (=> (not res!301691) (not e!292852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499779 (= res!301691 (validKeyInArray!0 (select (arr!15512 a!3235) j!176)))))

(declare-fun b!499780 () Bool)

(assert (=> b!499780 (= e!292852 e!292848)))

(declare-fun res!301693 () Bool)

(assert (=> b!499780 (=> (not res!301693) (not e!292848))))

(declare-fun lt!226676 () SeekEntryResult!3979)

(assert (=> b!499780 (= res!301693 (or (= lt!226676 (MissingZero!3979 i!1204)) (= lt!226676 (MissingVacant!3979 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32261 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!499780 (= lt!226676 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499781 () Bool)

(declare-fun res!301700 () Bool)

(assert (=> b!499781 (=> (not res!301700) (not e!292852))))

(assert (=> b!499781 (= res!301700 (validKeyInArray!0 k!2280))))

(declare-fun b!499782 () Bool)

(assert (=> b!499782 (= e!292849 (= (seekEntryOrOpen!0 (select (arr!15512 a!3235) j!176) a!3235 mask!3524) (Found!3979 j!176)))))

(declare-fun res!301695 () Bool)

(assert (=> start!45436 (=> (not res!301695) (not e!292852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45436 (= res!301695 (validMask!0 mask!3524))))

(assert (=> start!45436 e!292852))

(assert (=> start!45436 true))

(declare-fun array_inv!11308 (array!32261) Bool)

(assert (=> start!45436 (array_inv!11308 a!3235)))

(declare-fun b!499783 () Bool)

(declare-fun res!301701 () Bool)

(assert (=> b!499783 (=> (not res!301701) (not e!292848))))

(declare-datatypes ((List!9670 0))(
  ( (Nil!9667) (Cons!9666 (h!10540 (_ BitVec 64)) (t!15898 List!9670)) )
))
(declare-fun arrayNoDuplicates!0 (array!32261 (_ BitVec 32) List!9670) Bool)

(assert (=> b!499783 (= res!301701 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9667))))

(declare-fun b!499784 () Bool)

(declare-fun e!292854 () Bool)

(assert (=> b!499784 (= e!292854 true)))

(declare-fun lt!226672 () SeekEntryResult!3979)

(assert (=> b!499784 (= lt!226672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226670 lt!226673 lt!226669 mask!3524))))

(declare-fun b!499785 () Bool)

(assert (=> b!499785 (= e!292853 false)))

(declare-fun b!499786 () Bool)

(assert (=> b!499786 (= e!292847 e!292854)))

(declare-fun res!301702 () Bool)

(assert (=> b!499786 (=> res!301702 e!292854)))

(assert (=> b!499786 (= res!301702 (or (bvsgt #b00000000000000000000000000000000 (x!47136 lt!226677)) (bvsgt (x!47136 lt!226677) #b01111111111111111111111111111110) (bvslt lt!226670 #b00000000000000000000000000000000) (bvsge lt!226670 (size!15876 a!3235)) (bvslt (index!18100 lt!226677) #b00000000000000000000000000000000) (bvsge (index!18100 lt!226677) (size!15876 a!3235)) (not (= lt!226677 (Intermediate!3979 false (index!18100 lt!226677) (x!47136 lt!226677))))))))

(assert (=> b!499786 (and (or (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226674 () Unit!14992)

(assert (=> b!499786 (= lt!226674 e!292851)))

(declare-fun c!59318 () Bool)

(assert (=> b!499786 (= c!59318 (= (select (arr!15512 a!3235) (index!18100 lt!226677)) (select (arr!15512 a!3235) j!176)))))

(assert (=> b!499786 (and (bvslt (x!47136 lt!226677) #b01111111111111111111111111111110) (or (= (select (arr!15512 a!3235) (index!18100 lt!226677)) (select (arr!15512 a!3235) j!176)) (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15512 a!3235) (index!18100 lt!226677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499787 () Bool)

(declare-fun res!301699 () Bool)

(assert (=> b!499787 (=> (not res!301699) (not e!292848))))

(assert (=> b!499787 (= res!301699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45436 res!301695) b!499776))

(assert (= (and b!499776 res!301692) b!499779))

(assert (= (and b!499779 res!301691) b!499781))

(assert (= (and b!499781 res!301700) b!499778))

(assert (= (and b!499778 res!301703) b!499780))

(assert (= (and b!499780 res!301693) b!499787))

(assert (= (and b!499787 res!301699) b!499783))

(assert (= (and b!499783 res!301701) b!499774))

(assert (= (and b!499774 res!301697) b!499782))

(assert (= (and b!499774 (not res!301696)) b!499773))

(assert (= (and b!499773 (not res!301694)) b!499786))

(assert (= (and b!499786 c!59318) b!499775))

(assert (= (and b!499786 (not c!59318)) b!499777))

(assert (= (and b!499775 res!301698) b!499785))

(assert (= (and b!499786 (not res!301702)) b!499784))

(declare-fun m!480951 () Bool)

(assert (=> b!499783 m!480951))

(declare-fun m!480953 () Bool)

(assert (=> b!499780 m!480953))

(declare-fun m!480955 () Bool)

(assert (=> b!499784 m!480955))

(declare-fun m!480957 () Bool)

(assert (=> b!499778 m!480957))

(declare-fun m!480959 () Bool)

(assert (=> b!499775 m!480959))

(assert (=> b!499775 m!480955))

(declare-fun m!480961 () Bool)

(assert (=> start!45436 m!480961))

(declare-fun m!480963 () Bool)

(assert (=> start!45436 m!480963))

(declare-fun m!480965 () Bool)

(assert (=> b!499781 m!480965))

(declare-fun m!480967 () Bool)

(assert (=> b!499782 m!480967))

(assert (=> b!499782 m!480967))

(declare-fun m!480969 () Bool)

(assert (=> b!499782 m!480969))

(declare-fun m!480971 () Bool)

(assert (=> b!499787 m!480971))

(assert (=> b!499779 m!480967))

(assert (=> b!499779 m!480967))

(declare-fun m!480973 () Bool)

(assert (=> b!499779 m!480973))

(declare-fun m!480975 () Bool)

(assert (=> b!499774 m!480975))

(declare-fun m!480977 () Bool)

(assert (=> b!499774 m!480977))

(declare-fun m!480979 () Bool)

(assert (=> b!499774 m!480979))

(assert (=> b!499774 m!480967))

(declare-fun m!480981 () Bool)

(assert (=> b!499774 m!480981))

(assert (=> b!499774 m!480967))

(declare-fun m!480983 () Bool)

(assert (=> b!499774 m!480983))

(declare-fun m!480985 () Bool)

(assert (=> b!499774 m!480985))

(declare-fun m!480987 () Bool)

(assert (=> b!499774 m!480987))

(assert (=> b!499774 m!480967))

(declare-fun m!480989 () Bool)

(assert (=> b!499774 m!480989))

(declare-fun m!480991 () Bool)

(assert (=> b!499786 m!480991))

(assert (=> b!499786 m!480967))

(push 1)

(assert (not b!499778))

(assert (not b!499780))

(assert (not b!499782))

(assert (not b!499781))

(assert (not b!499787))

(assert (not b!499775))

(assert (not b!499774))

(assert (not b!499784))

(assert (not b!499779))

(assert (not b!499783))

(assert (not start!45436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

