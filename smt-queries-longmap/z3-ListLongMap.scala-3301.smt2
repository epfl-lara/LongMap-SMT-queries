; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45752 () Bool)

(assert start!45752)

(declare-fun b!506104 () Bool)

(declare-fun res!307094 () Bool)

(declare-fun e!296238 () Bool)

(assert (=> b!506104 (=> res!307094 e!296238)))

(declare-fun e!296235 () Bool)

(assert (=> b!506104 (= res!307094 e!296235)))

(declare-fun res!307103 () Bool)

(assert (=> b!506104 (=> (not res!307103) (not e!296235))))

(declare-datatypes ((SeekEntryResult!4101 0))(
  ( (MissingZero!4101 (index!18592 (_ BitVec 32))) (Found!4101 (index!18593 (_ BitVec 32))) (Intermediate!4101 (undefined!4913 Bool) (index!18594 (_ BitVec 32)) (x!47598 (_ BitVec 32))) (Undefined!4101) (MissingVacant!4101 (index!18595 (_ BitVec 32))) )
))
(declare-fun lt!230875 () SeekEntryResult!4101)

(assert (=> b!506104 (= res!307103 (bvsgt #b00000000000000000000000000000000 (x!47598 lt!230875)))))

(declare-fun b!506105 () Bool)

(assert (=> b!506105 (= e!296238 true)))

(declare-fun lt!230866 () (_ BitVec 64))

(declare-fun lt!230872 () SeekEntryResult!4101)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32508 0))(
  ( (array!32509 (arr!15634 (Array (_ BitVec 32) (_ BitVec 64))) (size!15998 (_ BitVec 32))) )
))
(declare-fun lt!230877 () array!32508)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32508 (_ BitVec 32)) SeekEntryResult!4101)

(assert (=> b!506105 (= (seekEntryOrOpen!0 lt!230866 lt!230877 mask!3524) lt!230872)))

(declare-datatypes ((Unit!15480 0))(
  ( (Unit!15481) )
))
(declare-fun lt!230869 () Unit!15480)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun a!3235 () array!32508)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230870 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15480)

(assert (=> b!506105 (= lt!230869 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230870 #b00000000000000000000000000000000 (index!18594 lt!230875) (x!47598 lt!230875) mask!3524))))

(declare-fun b!506106 () Bool)

(declare-fun e!296234 () Bool)

(assert (=> b!506106 (= e!296234 false)))

(declare-fun b!506107 () Bool)

(declare-fun res!307098 () Bool)

(declare-fun e!296233 () Bool)

(assert (=> b!506107 (=> (not res!307098) (not e!296233))))

(assert (=> b!506107 (= res!307098 (and (= (size!15998 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15998 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15998 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506108 () Bool)

(declare-fun res!307091 () Bool)

(assert (=> b!506108 (=> res!307091 e!296238)))

(declare-fun lt!230868 () SeekEntryResult!4101)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32508 (_ BitVec 32)) SeekEntryResult!4101)

(assert (=> b!506108 (= res!307091 (not (= lt!230868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230870 lt!230866 lt!230877 mask!3524))))))

(declare-fun b!506109 () Bool)

(declare-fun e!296237 () Bool)

(declare-fun e!296240 () Bool)

(assert (=> b!506109 (= e!296237 (not e!296240))))

(declare-fun res!307102 () Bool)

(assert (=> b!506109 (=> res!307102 e!296240)))

(get-info :version)

(assert (=> b!506109 (= res!307102 (or (= lt!230875 lt!230868) (undefined!4913 lt!230875) (not ((_ is Intermediate!4101) lt!230875))))))

(declare-fun lt!230878 () (_ BitVec 32))

(assert (=> b!506109 (= lt!230868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230878 lt!230866 lt!230877 mask!3524))))

(assert (=> b!506109 (= lt!230875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230870 (select (arr!15634 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506109 (= lt!230878 (toIndex!0 lt!230866 mask!3524))))

(assert (=> b!506109 (= lt!230866 (select (store (arr!15634 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506109 (= lt!230870 (toIndex!0 (select (arr!15634 a!3235) j!176) mask!3524))))

(assert (=> b!506109 (= lt!230877 (array!32509 (store (arr!15634 a!3235) i!1204 k0!2280) (size!15998 a!3235)))))

(assert (=> b!506109 (= lt!230872 (Found!4101 j!176))))

(declare-fun e!296241 () Bool)

(assert (=> b!506109 e!296241))

(declare-fun res!307100 () Bool)

(assert (=> b!506109 (=> (not res!307100) (not e!296241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32508 (_ BitVec 32)) Bool)

(assert (=> b!506109 (= res!307100 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230876 () Unit!15480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15480)

(assert (=> b!506109 (= lt!230876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506110 () Bool)

(assert (=> b!506110 (= e!296233 e!296237)))

(declare-fun res!307090 () Bool)

(assert (=> b!506110 (=> (not res!307090) (not e!296237))))

(declare-fun lt!230867 () SeekEntryResult!4101)

(assert (=> b!506110 (= res!307090 (or (= lt!230867 (MissingZero!4101 i!1204)) (= lt!230867 (MissingVacant!4101 i!1204))))))

(assert (=> b!506110 (= lt!230867 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506111 () Bool)

(declare-fun e!296236 () Unit!15480)

(declare-fun Unit!15482 () Unit!15480)

(assert (=> b!506111 (= e!296236 Unit!15482)))

(declare-fun lt!230873 () Unit!15480)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15480)

(assert (=> b!506111 (= lt!230873 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230870 #b00000000000000000000000000000000 (index!18594 lt!230875) (x!47598 lt!230875) mask!3524))))

(declare-fun res!307095 () Bool)

(assert (=> b!506111 (= res!307095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230870 lt!230866 lt!230877 mask!3524) (Intermediate!4101 false (index!18594 lt!230875) (x!47598 lt!230875))))))

(assert (=> b!506111 (=> (not res!307095) (not e!296234))))

(assert (=> b!506111 e!296234))

(declare-fun b!506112 () Bool)

(declare-fun Unit!15483 () Unit!15480)

(assert (=> b!506112 (= e!296236 Unit!15483)))

(declare-fun b!506113 () Bool)

(declare-fun res!307092 () Bool)

(assert (=> b!506113 (=> (not res!307092) (not e!296233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506113 (= res!307092 (validKeyInArray!0 (select (arr!15634 a!3235) j!176)))))

(declare-fun b!506115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32508 (_ BitVec 32)) SeekEntryResult!4101)

(assert (=> b!506115 (= e!296235 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230870 (index!18594 lt!230875) (select (arr!15634 a!3235) j!176) a!3235 mask!3524) lt!230872)))))

(declare-fun b!506116 () Bool)

(declare-fun res!307096 () Bool)

(assert (=> b!506116 (=> (not res!307096) (not e!296237))))

(declare-datatypes ((List!9792 0))(
  ( (Nil!9789) (Cons!9788 (h!10665 (_ BitVec 64)) (t!16020 List!9792)) )
))
(declare-fun arrayNoDuplicates!0 (array!32508 (_ BitVec 32) List!9792) Bool)

(assert (=> b!506116 (= res!307096 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9789))))

(declare-fun b!506117 () Bool)

(assert (=> b!506117 (= e!296240 e!296238)))

(declare-fun res!307093 () Bool)

(assert (=> b!506117 (=> res!307093 e!296238)))

(assert (=> b!506117 (= res!307093 (or (bvsgt (x!47598 lt!230875) #b01111111111111111111111111111110) (bvslt lt!230870 #b00000000000000000000000000000000) (bvsge lt!230870 (size!15998 a!3235)) (bvslt (index!18594 lt!230875) #b00000000000000000000000000000000) (bvsge (index!18594 lt!230875) (size!15998 a!3235)) (not (= lt!230875 (Intermediate!4101 false (index!18594 lt!230875) (x!47598 lt!230875))))))))

(assert (=> b!506117 (= (index!18594 lt!230875) i!1204)))

(declare-fun lt!230874 () Unit!15480)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15480)

(assert (=> b!506117 (= lt!230874 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230870 #b00000000000000000000000000000000 (index!18594 lt!230875) (x!47598 lt!230875) mask!3524))))

(assert (=> b!506117 (and (or (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230871 () Unit!15480)

(assert (=> b!506117 (= lt!230871 e!296236)))

(declare-fun c!59786 () Bool)

(assert (=> b!506117 (= c!59786 (= (select (arr!15634 a!3235) (index!18594 lt!230875)) (select (arr!15634 a!3235) j!176)))))

(assert (=> b!506117 (and (bvslt (x!47598 lt!230875) #b01111111111111111111111111111110) (or (= (select (arr!15634 a!3235) (index!18594 lt!230875)) (select (arr!15634 a!3235) j!176)) (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15634 a!3235) (index!18594 lt!230875)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!307089 () Bool)

(assert (=> start!45752 (=> (not res!307089) (not e!296233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45752 (= res!307089 (validMask!0 mask!3524))))

(assert (=> start!45752 e!296233))

(assert (=> start!45752 true))

(declare-fun array_inv!11430 (array!32508) Bool)

(assert (=> start!45752 (array_inv!11430 a!3235)))

(declare-fun b!506114 () Bool)

(declare-fun res!307099 () Bool)

(assert (=> b!506114 (=> (not res!307099) (not e!296233))))

(assert (=> b!506114 (= res!307099 (validKeyInArray!0 k0!2280))))

(declare-fun b!506118 () Bool)

(declare-fun res!307101 () Bool)

(assert (=> b!506118 (=> (not res!307101) (not e!296233))))

(declare-fun arrayContainsKey!0 (array!32508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506118 (= res!307101 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506119 () Bool)

(declare-fun res!307097 () Bool)

(assert (=> b!506119 (=> (not res!307097) (not e!296237))))

(assert (=> b!506119 (= res!307097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506120 () Bool)

(assert (=> b!506120 (= e!296241 (= (seekEntryOrOpen!0 (select (arr!15634 a!3235) j!176) a!3235 mask!3524) (Found!4101 j!176)))))

(assert (= (and start!45752 res!307089) b!506107))

(assert (= (and b!506107 res!307098) b!506113))

(assert (= (and b!506113 res!307092) b!506114))

(assert (= (and b!506114 res!307099) b!506118))

(assert (= (and b!506118 res!307101) b!506110))

(assert (= (and b!506110 res!307090) b!506119))

(assert (= (and b!506119 res!307097) b!506116))

(assert (= (and b!506116 res!307096) b!506109))

(assert (= (and b!506109 res!307100) b!506120))

(assert (= (and b!506109 (not res!307102)) b!506117))

(assert (= (and b!506117 c!59786) b!506111))

(assert (= (and b!506117 (not c!59786)) b!506112))

(assert (= (and b!506111 res!307095) b!506106))

(assert (= (and b!506117 (not res!307093)) b!506104))

(assert (= (and b!506104 res!307103) b!506115))

(assert (= (and b!506104 (not res!307094)) b!506108))

(assert (= (and b!506108 (not res!307091)) b!506105))

(declare-fun m!486755 () Bool)

(assert (=> b!506109 m!486755))

(declare-fun m!486757 () Bool)

(assert (=> b!506109 m!486757))

(declare-fun m!486759 () Bool)

(assert (=> b!506109 m!486759))

(declare-fun m!486761 () Bool)

(assert (=> b!506109 m!486761))

(declare-fun m!486763 () Bool)

(assert (=> b!506109 m!486763))

(declare-fun m!486765 () Bool)

(assert (=> b!506109 m!486765))

(declare-fun m!486767 () Bool)

(assert (=> b!506109 m!486767))

(declare-fun m!486769 () Bool)

(assert (=> b!506109 m!486769))

(assert (=> b!506109 m!486765))

(assert (=> b!506109 m!486765))

(declare-fun m!486771 () Bool)

(assert (=> b!506109 m!486771))

(declare-fun m!486773 () Bool)

(assert (=> b!506114 m!486773))

(declare-fun m!486775 () Bool)

(assert (=> b!506105 m!486775))

(declare-fun m!486777 () Bool)

(assert (=> b!506105 m!486777))

(declare-fun m!486779 () Bool)

(assert (=> b!506108 m!486779))

(declare-fun m!486781 () Bool)

(assert (=> b!506116 m!486781))

(declare-fun m!486783 () Bool)

(assert (=> b!506110 m!486783))

(assert (=> b!506120 m!486765))

(assert (=> b!506120 m!486765))

(declare-fun m!486785 () Bool)

(assert (=> b!506120 m!486785))

(declare-fun m!486787 () Bool)

(assert (=> b!506119 m!486787))

(declare-fun m!486789 () Bool)

(assert (=> start!45752 m!486789))

(declare-fun m!486791 () Bool)

(assert (=> start!45752 m!486791))

(declare-fun m!486793 () Bool)

(assert (=> b!506118 m!486793))

(assert (=> b!506115 m!486765))

(assert (=> b!506115 m!486765))

(declare-fun m!486795 () Bool)

(assert (=> b!506115 m!486795))

(declare-fun m!486797 () Bool)

(assert (=> b!506111 m!486797))

(assert (=> b!506111 m!486779))

(declare-fun m!486799 () Bool)

(assert (=> b!506117 m!486799))

(declare-fun m!486801 () Bool)

(assert (=> b!506117 m!486801))

(assert (=> b!506117 m!486765))

(assert (=> b!506113 m!486765))

(assert (=> b!506113 m!486765))

(declare-fun m!486803 () Bool)

(assert (=> b!506113 m!486803))

(check-sat (not b!506118) (not b!506114) (not b!506119) (not b!506120) (not b!506111) (not b!506117) (not b!506110) (not b!506109) (not b!506105) (not b!506116) (not b!506115) (not b!506113) (not b!506108) (not start!45752))
(check-sat)
