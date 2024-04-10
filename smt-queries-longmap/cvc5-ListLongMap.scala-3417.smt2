; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47424 () Bool)

(assert start!47424)

(declare-fun b!521872 () Bool)

(declare-fun e!304433 () Bool)

(assert (=> b!521872 (= e!304433 true)))

(declare-datatypes ((array!33250 0))(
  ( (array!33251 (arr!15981 (Array (_ BitVec 32) (_ BitVec 64))) (size!16345 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33250)

(declare-datatypes ((SeekEntryResult!4448 0))(
  ( (MissingZero!4448 (index!19995 (_ BitVec 32))) (Found!4448 (index!19996 (_ BitVec 32))) (Intermediate!4448 (undefined!5260 Bool) (index!19997 (_ BitVec 32)) (x!48978 (_ BitVec 32))) (Undefined!4448) (MissingVacant!4448 (index!19998 (_ BitVec 32))) )
))
(declare-fun lt!239239 () SeekEntryResult!4448)

(assert (=> b!521872 (and (or (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16244 0))(
  ( (Unit!16245) )
))
(declare-fun lt!239245 () Unit!16244)

(declare-fun e!304436 () Unit!16244)

(assert (=> b!521872 (= lt!239245 e!304436)))

(declare-fun c!61433 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521872 (= c!61433 (= (select (arr!15981 a!3235) (index!19997 lt!239239)) (select (arr!15981 a!3235) j!176)))))

(assert (=> b!521872 (and (bvslt (x!48978 lt!239239) #b01111111111111111111111111111110) (or (= (select (arr!15981 a!3235) (index!19997 lt!239239)) (select (arr!15981 a!3235) j!176)) (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15981 a!3235) (index!19997 lt!239239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521873 () Bool)

(declare-fun res!319614 () Bool)

(declare-fun e!304434 () Bool)

(assert (=> b!521873 (=> (not res!319614) (not e!304434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521873 (= res!319614 (validKeyInArray!0 (select (arr!15981 a!3235) j!176)))))

(declare-fun b!521874 () Bool)

(declare-fun res!319615 () Bool)

(assert (=> b!521874 (=> (not res!319615) (not e!304434))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521874 (= res!319615 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319609 () Bool)

(assert (=> start!47424 (=> (not res!319609) (not e!304434))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47424 (= res!319609 (validMask!0 mask!3524))))

(assert (=> start!47424 e!304434))

(assert (=> start!47424 true))

(declare-fun array_inv!11777 (array!33250) Bool)

(assert (=> start!47424 (array_inv!11777 a!3235)))

(declare-fun b!521875 () Bool)

(declare-fun e!304431 () Bool)

(assert (=> b!521875 (= e!304434 e!304431)))

(declare-fun res!319617 () Bool)

(assert (=> b!521875 (=> (not res!319617) (not e!304431))))

(declare-fun lt!239243 () SeekEntryResult!4448)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521875 (= res!319617 (or (= lt!239243 (MissingZero!4448 i!1204)) (= lt!239243 (MissingVacant!4448 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33250 (_ BitVec 32)) SeekEntryResult!4448)

(assert (=> b!521875 (= lt!239243 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521876 () Bool)

(declare-fun e!304437 () Bool)

(assert (=> b!521876 (= e!304437 (= (seekEntryOrOpen!0 (select (arr!15981 a!3235) j!176) a!3235 mask!3524) (Found!4448 j!176)))))

(declare-fun b!521877 () Bool)

(declare-fun res!319610 () Bool)

(assert (=> b!521877 (=> (not res!319610) (not e!304434))))

(assert (=> b!521877 (= res!319610 (validKeyInArray!0 k!2280))))

(declare-fun b!521878 () Bool)

(assert (=> b!521878 (= e!304431 (not e!304433))))

(declare-fun res!319613 () Bool)

(assert (=> b!521878 (=> res!319613 e!304433)))

(declare-fun lt!239241 () (_ BitVec 64))

(declare-fun lt!239240 () array!33250)

(declare-fun lt!239242 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33250 (_ BitVec 32)) SeekEntryResult!4448)

(assert (=> b!521878 (= res!319613 (= lt!239239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239242 lt!239241 lt!239240 mask!3524)))))

(declare-fun lt!239238 () (_ BitVec 32))

(assert (=> b!521878 (= lt!239239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239238 (select (arr!15981 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521878 (= lt!239242 (toIndex!0 lt!239241 mask!3524))))

(assert (=> b!521878 (= lt!239241 (select (store (arr!15981 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521878 (= lt!239238 (toIndex!0 (select (arr!15981 a!3235) j!176) mask!3524))))

(assert (=> b!521878 (= lt!239240 (array!33251 (store (arr!15981 a!3235) i!1204 k!2280) (size!16345 a!3235)))))

(assert (=> b!521878 e!304437))

(declare-fun res!319608 () Bool)

(assert (=> b!521878 (=> (not res!319608) (not e!304437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33250 (_ BitVec 32)) Bool)

(assert (=> b!521878 (= res!319608 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239244 () Unit!16244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16244)

(assert (=> b!521878 (= lt!239244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521879 () Bool)

(declare-fun Unit!16246 () Unit!16244)

(assert (=> b!521879 (= e!304436 Unit!16246)))

(declare-fun b!521880 () Bool)

(declare-fun res!319612 () Bool)

(assert (=> b!521880 (=> (not res!319612) (not e!304431))))

(assert (=> b!521880 (= res!319612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521881 () Bool)

(declare-fun Unit!16247 () Unit!16244)

(assert (=> b!521881 (= e!304436 Unit!16247)))

(declare-fun lt!239237 () Unit!16244)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16244)

(assert (=> b!521881 (= lt!239237 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239238 #b00000000000000000000000000000000 (index!19997 lt!239239) (x!48978 lt!239239) mask!3524))))

(declare-fun res!319618 () Bool)

(assert (=> b!521881 (= res!319618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239238 lt!239241 lt!239240 mask!3524) (Intermediate!4448 false (index!19997 lt!239239) (x!48978 lt!239239))))))

(declare-fun e!304435 () Bool)

(assert (=> b!521881 (=> (not res!319618) (not e!304435))))

(assert (=> b!521881 e!304435))

(declare-fun b!521882 () Bool)

(declare-fun res!319616 () Bool)

(assert (=> b!521882 (=> res!319616 e!304433)))

(assert (=> b!521882 (= res!319616 (or (undefined!5260 lt!239239) (not (is-Intermediate!4448 lt!239239))))))

(declare-fun b!521883 () Bool)

(assert (=> b!521883 (= e!304435 false)))

(declare-fun b!521884 () Bool)

(declare-fun res!319611 () Bool)

(assert (=> b!521884 (=> (not res!319611) (not e!304434))))

(assert (=> b!521884 (= res!319611 (and (= (size!16345 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16345 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16345 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521885 () Bool)

(declare-fun res!319619 () Bool)

(assert (=> b!521885 (=> (not res!319619) (not e!304431))))

(declare-datatypes ((List!10139 0))(
  ( (Nil!10136) (Cons!10135 (h!11057 (_ BitVec 64)) (t!16367 List!10139)) )
))
(declare-fun arrayNoDuplicates!0 (array!33250 (_ BitVec 32) List!10139) Bool)

(assert (=> b!521885 (= res!319619 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10136))))

(assert (= (and start!47424 res!319609) b!521884))

(assert (= (and b!521884 res!319611) b!521873))

(assert (= (and b!521873 res!319614) b!521877))

(assert (= (and b!521877 res!319610) b!521874))

(assert (= (and b!521874 res!319615) b!521875))

(assert (= (and b!521875 res!319617) b!521880))

(assert (= (and b!521880 res!319612) b!521885))

(assert (= (and b!521885 res!319619) b!521878))

(assert (= (and b!521878 res!319608) b!521876))

(assert (= (and b!521878 (not res!319613)) b!521882))

(assert (= (and b!521882 (not res!319616)) b!521872))

(assert (= (and b!521872 c!61433) b!521881))

(assert (= (and b!521872 (not c!61433)) b!521879))

(assert (= (and b!521881 res!319618) b!521883))

(declare-fun m!502785 () Bool)

(assert (=> b!521878 m!502785))

(declare-fun m!502787 () Bool)

(assert (=> b!521878 m!502787))

(declare-fun m!502789 () Bool)

(assert (=> b!521878 m!502789))

(declare-fun m!502791 () Bool)

(assert (=> b!521878 m!502791))

(declare-fun m!502793 () Bool)

(assert (=> b!521878 m!502793))

(assert (=> b!521878 m!502785))

(declare-fun m!502795 () Bool)

(assert (=> b!521878 m!502795))

(assert (=> b!521878 m!502785))

(declare-fun m!502797 () Bool)

(assert (=> b!521878 m!502797))

(declare-fun m!502799 () Bool)

(assert (=> b!521878 m!502799))

(declare-fun m!502801 () Bool)

(assert (=> b!521878 m!502801))

(declare-fun m!502803 () Bool)

(assert (=> b!521881 m!502803))

(declare-fun m!502805 () Bool)

(assert (=> b!521881 m!502805))

(declare-fun m!502807 () Bool)

(assert (=> b!521880 m!502807))

(declare-fun m!502809 () Bool)

(assert (=> b!521872 m!502809))

(assert (=> b!521872 m!502785))

(assert (=> b!521873 m!502785))

(assert (=> b!521873 m!502785))

(declare-fun m!502811 () Bool)

(assert (=> b!521873 m!502811))

(declare-fun m!502813 () Bool)

(assert (=> b!521877 m!502813))

(declare-fun m!502815 () Bool)

(assert (=> start!47424 m!502815))

(declare-fun m!502817 () Bool)

(assert (=> start!47424 m!502817))

(declare-fun m!502819 () Bool)

(assert (=> b!521875 m!502819))

(assert (=> b!521876 m!502785))

(assert (=> b!521876 m!502785))

(declare-fun m!502821 () Bool)

(assert (=> b!521876 m!502821))

(declare-fun m!502823 () Bool)

(assert (=> b!521885 m!502823))

(declare-fun m!502825 () Bool)

(assert (=> b!521874 m!502825))

(push 1)

