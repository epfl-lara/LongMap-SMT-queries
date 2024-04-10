; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45750 () Bool)

(assert start!45750)

(declare-fun b!506053 () Bool)

(declare-datatypes ((Unit!15476 0))(
  ( (Unit!15477) )
))
(declare-fun e!296208 () Unit!15476)

(declare-fun Unit!15478 () Unit!15476)

(assert (=> b!506053 (= e!296208 Unit!15478)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32506 0))(
  ( (array!32507 (arr!15633 (Array (_ BitVec 32) (_ BitVec 64))) (size!15997 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32506)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230838 () (_ BitVec 32))

(declare-fun lt!230836 () Unit!15476)

(declare-datatypes ((SeekEntryResult!4100 0))(
  ( (MissingZero!4100 (index!18588 (_ BitVec 32))) (Found!4100 (index!18589 (_ BitVec 32))) (Intermediate!4100 (undefined!4912 Bool) (index!18590 (_ BitVec 32)) (x!47597 (_ BitVec 32))) (Undefined!4100) (MissingVacant!4100 (index!18591 (_ BitVec 32))) )
))
(declare-fun lt!230829 () SeekEntryResult!4100)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15476)

(assert (=> b!506053 (= lt!230836 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230838 #b00000000000000000000000000000000 (index!18590 lt!230829) (x!47597 lt!230829) mask!3524))))

(declare-fun lt!230831 () array!32506)

(declare-fun res!307049 () Bool)

(declare-fun lt!230834 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32506 (_ BitVec 32)) SeekEntryResult!4100)

(assert (=> b!506053 (= res!307049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230838 lt!230834 lt!230831 mask!3524) (Intermediate!4100 false (index!18590 lt!230829) (x!47597 lt!230829))))))

(declare-fun e!296211 () Bool)

(assert (=> b!506053 (=> (not res!307049) (not e!296211))))

(assert (=> b!506053 e!296211))

(declare-fun b!506054 () Bool)

(declare-fun e!296213 () Bool)

(declare-fun e!296212 () Bool)

(assert (=> b!506054 (= e!296213 (not e!296212))))

(declare-fun res!307054 () Bool)

(assert (=> b!506054 (=> res!307054 e!296212)))

(declare-fun lt!230837 () SeekEntryResult!4100)

(assert (=> b!506054 (= res!307054 (or (= lt!230829 lt!230837) (undefined!4912 lt!230829) (not (is-Intermediate!4100 lt!230829))))))

(declare-fun lt!230830 () (_ BitVec 32))

(assert (=> b!506054 (= lt!230837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230830 lt!230834 lt!230831 mask!3524))))

(assert (=> b!506054 (= lt!230829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230838 (select (arr!15633 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506054 (= lt!230830 (toIndex!0 lt!230834 mask!3524))))

(assert (=> b!506054 (= lt!230834 (select (store (arr!15633 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!506054 (= lt!230838 (toIndex!0 (select (arr!15633 a!3235) j!176) mask!3524))))

(assert (=> b!506054 (= lt!230831 (array!32507 (store (arr!15633 a!3235) i!1204 k!2280) (size!15997 a!3235)))))

(declare-fun lt!230839 () SeekEntryResult!4100)

(assert (=> b!506054 (= lt!230839 (Found!4100 j!176))))

(declare-fun e!296210 () Bool)

(assert (=> b!506054 e!296210))

(declare-fun res!307044 () Bool)

(assert (=> b!506054 (=> (not res!307044) (not e!296210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32506 (_ BitVec 32)) Bool)

(assert (=> b!506054 (= res!307044 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230828 () Unit!15476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15476)

(assert (=> b!506054 (= lt!230828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506055 () Bool)

(declare-fun res!307052 () Bool)

(declare-fun e!296207 () Bool)

(assert (=> b!506055 (=> (not res!307052) (not e!296207))))

(assert (=> b!506055 (= res!307052 (and (= (size!15997 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15997 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15997 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506056 () Bool)

(declare-fun res!307058 () Bool)

(declare-fun e!296214 () Bool)

(assert (=> b!506056 (=> res!307058 e!296214)))

(assert (=> b!506056 (= res!307058 (not (= lt!230837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230838 lt!230834 lt!230831 mask!3524))))))

(declare-fun b!506057 () Bool)

(assert (=> b!506057 (= e!296212 e!296214)))

(declare-fun res!307046 () Bool)

(assert (=> b!506057 (=> res!307046 e!296214)))

(assert (=> b!506057 (= res!307046 (or (bvsgt (x!47597 lt!230829) #b01111111111111111111111111111110) (bvslt lt!230838 #b00000000000000000000000000000000) (bvsge lt!230838 (size!15997 a!3235)) (bvslt (index!18590 lt!230829) #b00000000000000000000000000000000) (bvsge (index!18590 lt!230829) (size!15997 a!3235)) (not (= lt!230829 (Intermediate!4100 false (index!18590 lt!230829) (x!47597 lt!230829))))))))

(assert (=> b!506057 (= (index!18590 lt!230829) i!1204)))

(declare-fun lt!230827 () Unit!15476)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15476)

(assert (=> b!506057 (= lt!230827 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230838 #b00000000000000000000000000000000 (index!18590 lt!230829) (x!47597 lt!230829) mask!3524))))

(assert (=> b!506057 (and (or (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230832 () Unit!15476)

(assert (=> b!506057 (= lt!230832 e!296208)))

(declare-fun c!59783 () Bool)

(assert (=> b!506057 (= c!59783 (= (select (arr!15633 a!3235) (index!18590 lt!230829)) (select (arr!15633 a!3235) j!176)))))

(assert (=> b!506057 (and (bvslt (x!47597 lt!230829) #b01111111111111111111111111111110) (or (= (select (arr!15633 a!3235) (index!18590 lt!230829)) (select (arr!15633 a!3235) j!176)) (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15633 a!3235) (index!18590 lt!230829)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506058 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32506 (_ BitVec 32)) SeekEntryResult!4100)

(assert (=> b!506058 (= e!296210 (= (seekEntryOrOpen!0 (select (arr!15633 a!3235) j!176) a!3235 mask!3524) (Found!4100 j!176)))))

(declare-fun b!506059 () Bool)

(declare-fun res!307057 () Bool)

(assert (=> b!506059 (=> (not res!307057) (not e!296207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506059 (= res!307057 (validKeyInArray!0 (select (arr!15633 a!3235) j!176)))))

(declare-fun b!506060 () Bool)

(declare-fun res!307047 () Bool)

(assert (=> b!506060 (=> (not res!307047) (not e!296207))))

(declare-fun arrayContainsKey!0 (array!32506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506060 (= res!307047 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!307048 () Bool)

(assert (=> start!45750 (=> (not res!307048) (not e!296207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45750 (= res!307048 (validMask!0 mask!3524))))

(assert (=> start!45750 e!296207))

(assert (=> start!45750 true))

(declare-fun array_inv!11429 (array!32506) Bool)

(assert (=> start!45750 (array_inv!11429 a!3235)))

(declare-fun b!506061 () Bool)

(declare-fun res!307056 () Bool)

(assert (=> b!506061 (=> (not res!307056) (not e!296213))))

(assert (=> b!506061 (= res!307056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!296209 () Bool)

(declare-fun b!506062 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32506 (_ BitVec 32)) SeekEntryResult!4100)

(assert (=> b!506062 (= e!296209 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230838 (index!18590 lt!230829) (select (arr!15633 a!3235) j!176) a!3235 mask!3524) lt!230839)))))

(declare-fun b!506063 () Bool)

(assert (=> b!506063 (= e!296211 false)))

(declare-fun b!506064 () Bool)

(assert (=> b!506064 (= e!296207 e!296213)))

(declare-fun res!307050 () Bool)

(assert (=> b!506064 (=> (not res!307050) (not e!296213))))

(declare-fun lt!230835 () SeekEntryResult!4100)

(assert (=> b!506064 (= res!307050 (or (= lt!230835 (MissingZero!4100 i!1204)) (= lt!230835 (MissingVacant!4100 i!1204))))))

(assert (=> b!506064 (= lt!230835 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506065 () Bool)

(assert (=> b!506065 (= e!296214 true)))

(assert (=> b!506065 (= (seekEntryOrOpen!0 lt!230834 lt!230831 mask!3524) lt!230839)))

(declare-fun lt!230833 () Unit!15476)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15476)

(assert (=> b!506065 (= lt!230833 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230838 #b00000000000000000000000000000000 (index!18590 lt!230829) (x!47597 lt!230829) mask!3524))))

(declare-fun b!506066 () Bool)

(declare-fun res!307053 () Bool)

(assert (=> b!506066 (=> res!307053 e!296214)))

(assert (=> b!506066 (= res!307053 e!296209)))

(declare-fun res!307051 () Bool)

(assert (=> b!506066 (=> (not res!307051) (not e!296209))))

(assert (=> b!506066 (= res!307051 (bvsgt #b00000000000000000000000000000000 (x!47597 lt!230829)))))

(declare-fun b!506067 () Bool)

(declare-fun res!307045 () Bool)

(assert (=> b!506067 (=> (not res!307045) (not e!296207))))

(assert (=> b!506067 (= res!307045 (validKeyInArray!0 k!2280))))

(declare-fun b!506068 () Bool)

(declare-fun res!307055 () Bool)

(assert (=> b!506068 (=> (not res!307055) (not e!296213))))

(declare-datatypes ((List!9791 0))(
  ( (Nil!9788) (Cons!9787 (h!10664 (_ BitVec 64)) (t!16019 List!9791)) )
))
(declare-fun arrayNoDuplicates!0 (array!32506 (_ BitVec 32) List!9791) Bool)

(assert (=> b!506068 (= res!307055 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9788))))

(declare-fun b!506069 () Bool)

(declare-fun Unit!15479 () Unit!15476)

(assert (=> b!506069 (= e!296208 Unit!15479)))

(assert (= (and start!45750 res!307048) b!506055))

(assert (= (and b!506055 res!307052) b!506059))

(assert (= (and b!506059 res!307057) b!506067))

(assert (= (and b!506067 res!307045) b!506060))

(assert (= (and b!506060 res!307047) b!506064))

(assert (= (and b!506064 res!307050) b!506061))

(assert (= (and b!506061 res!307056) b!506068))

(assert (= (and b!506068 res!307055) b!506054))

(assert (= (and b!506054 res!307044) b!506058))

(assert (= (and b!506054 (not res!307054)) b!506057))

(assert (= (and b!506057 c!59783) b!506053))

(assert (= (and b!506057 (not c!59783)) b!506069))

(assert (= (and b!506053 res!307049) b!506063))

(assert (= (and b!506057 (not res!307046)) b!506066))

(assert (= (and b!506066 res!307051) b!506062))

(assert (= (and b!506066 (not res!307053)) b!506056))

(assert (= (and b!506056 (not res!307058)) b!506065))

(declare-fun m!486705 () Bool)

(assert (=> start!45750 m!486705))

(declare-fun m!486707 () Bool)

(assert (=> start!45750 m!486707))

(declare-fun m!486709 () Bool)

(assert (=> b!506054 m!486709))

(declare-fun m!486711 () Bool)

(assert (=> b!506054 m!486711))

(declare-fun m!486713 () Bool)

(assert (=> b!506054 m!486713))

(declare-fun m!486715 () Bool)

(assert (=> b!506054 m!486715))

(declare-fun m!486717 () Bool)

(assert (=> b!506054 m!486717))

(assert (=> b!506054 m!486715))

(declare-fun m!486719 () Bool)

(assert (=> b!506054 m!486719))

(assert (=> b!506054 m!486715))

(declare-fun m!486721 () Bool)

(assert (=> b!506054 m!486721))

(declare-fun m!486723 () Bool)

(assert (=> b!506054 m!486723))

(declare-fun m!486725 () Bool)

(assert (=> b!506054 m!486725))

(declare-fun m!486727 () Bool)

(assert (=> b!506067 m!486727))

(declare-fun m!486729 () Bool)

(assert (=> b!506056 m!486729))

(assert (=> b!506058 m!486715))

(assert (=> b!506058 m!486715))

(declare-fun m!486731 () Bool)

(assert (=> b!506058 m!486731))

(declare-fun m!486733 () Bool)

(assert (=> b!506060 m!486733))

(declare-fun m!486735 () Bool)

(assert (=> b!506061 m!486735))

(declare-fun m!486737 () Bool)

(assert (=> b!506068 m!486737))

(declare-fun m!486739 () Bool)

(assert (=> b!506057 m!486739))

(declare-fun m!486741 () Bool)

(assert (=> b!506057 m!486741))

(assert (=> b!506057 m!486715))

(declare-fun m!486743 () Bool)

(assert (=> b!506065 m!486743))

(declare-fun m!486745 () Bool)

(assert (=> b!506065 m!486745))

(declare-fun m!486747 () Bool)

(assert (=> b!506064 m!486747))

(declare-fun m!486749 () Bool)

(assert (=> b!506053 m!486749))

(assert (=> b!506053 m!486729))

(assert (=> b!506059 m!486715))

(assert (=> b!506059 m!486715))

(declare-fun m!486751 () Bool)

(assert (=> b!506059 m!486751))

(assert (=> b!506062 m!486715))

(assert (=> b!506062 m!486715))

(declare-fun m!486753 () Bool)

(assert (=> b!506062 m!486753))

(push 1)

