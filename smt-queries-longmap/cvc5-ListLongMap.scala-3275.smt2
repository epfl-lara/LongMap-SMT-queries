; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45594 () Bool)

(assert start!45594)

(declare-fun b!502075 () Bool)

(declare-fun e!294103 () Bool)

(declare-fun e!294101 () Bool)

(assert (=> b!502075 (= e!294103 e!294101)))

(declare-fun res!303542 () Bool)

(assert (=> b!502075 (=> res!303542 e!294101)))

(declare-datatypes ((SeekEntryResult!4022 0))(
  ( (MissingZero!4022 (index!18276 (_ BitVec 32))) (Found!4022 (index!18277 (_ BitVec 32))) (Intermediate!4022 (undefined!4834 Bool) (index!18278 (_ BitVec 32)) (x!47311 (_ BitVec 32))) (Undefined!4022) (MissingVacant!4022 (index!18279 (_ BitVec 32))) )
))
(declare-fun lt!228151 () SeekEntryResult!4022)

(declare-datatypes ((array!32350 0))(
  ( (array!32351 (arr!15555 (Array (_ BitVec 32) (_ BitVec 64))) (size!15919 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32350)

(declare-fun lt!228144 () (_ BitVec 32))

(assert (=> b!502075 (= res!303542 (or (bvsgt (x!47311 lt!228151) #b01111111111111111111111111111110) (bvslt lt!228144 #b00000000000000000000000000000000) (bvsge lt!228144 (size!15919 a!3235)) (bvslt (index!18278 lt!228151) #b00000000000000000000000000000000) (bvsge (index!18278 lt!228151) (size!15919 a!3235)) (not (= lt!228151 (Intermediate!4022 false (index!18278 lt!228151) (x!47311 lt!228151))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502075 (= (index!18278 lt!228151) i!1204)))

(declare-datatypes ((Unit!15164 0))(
  ( (Unit!15165) )
))
(declare-fun lt!228141 () Unit!15164)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32350 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15164)

(assert (=> b!502075 (= lt!228141 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228144 #b00000000000000000000000000000000 (index!18278 lt!228151) (x!47311 lt!228151) mask!3524))))

(assert (=> b!502075 (and (or (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228145 () Unit!15164)

(declare-fun e!294105 () Unit!15164)

(assert (=> b!502075 (= lt!228145 e!294105)))

(declare-fun c!59549 () Bool)

(assert (=> b!502075 (= c!59549 (= (select (arr!15555 a!3235) (index!18278 lt!228151)) (select (arr!15555 a!3235) j!176)))))

(assert (=> b!502075 (and (bvslt (x!47311 lt!228151) #b01111111111111111111111111111110) (or (= (select (arr!15555 a!3235) (index!18278 lt!228151)) (select (arr!15555 a!3235) j!176)) (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15555 a!3235) (index!18278 lt!228151)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502076 () Bool)

(declare-fun res!303536 () Bool)

(assert (=> b!502076 (=> res!303536 e!294101)))

(declare-fun e!294100 () Bool)

(assert (=> b!502076 (= res!303536 e!294100)))

(declare-fun res!303541 () Bool)

(assert (=> b!502076 (=> (not res!303541) (not e!294100))))

(assert (=> b!502076 (= res!303541 (bvsgt #b00000000000000000000000000000000 (x!47311 lt!228151)))))

(declare-fun b!502077 () Bool)

(declare-fun res!303540 () Bool)

(declare-fun e!294106 () Bool)

(assert (=> b!502077 (=> (not res!303540) (not e!294106))))

(assert (=> b!502077 (= res!303540 (and (= (size!15919 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15919 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15919 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502078 () Bool)

(declare-fun res!303538 () Bool)

(declare-fun e!294102 () Bool)

(assert (=> b!502078 (=> (not res!303538) (not e!294102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32350 (_ BitVec 32)) Bool)

(assert (=> b!502078 (= res!303538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502079 () Bool)

(declare-fun Unit!15166 () Unit!15164)

(assert (=> b!502079 (= e!294105 Unit!15166)))

(declare-fun b!502080 () Bool)

(declare-fun res!303539 () Bool)

(assert (=> b!502080 (=> res!303539 e!294103)))

(assert (=> b!502080 (= res!303539 (or (undefined!4834 lt!228151) (not (is-Intermediate!4022 lt!228151))))))

(declare-fun b!502081 () Bool)

(declare-fun res!303535 () Bool)

(assert (=> b!502081 (=> (not res!303535) (not e!294106))))

(declare-fun arrayContainsKey!0 (array!32350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502081 (= res!303535 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502082 () Bool)

(declare-fun res!303545 () Bool)

(assert (=> b!502082 (=> (not res!303545) (not e!294106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502082 (= res!303545 (validKeyInArray!0 k!2280))))

(declare-fun b!502083 () Bool)

(assert (=> b!502083 (= e!294101 true)))

(declare-fun lt!228148 () (_ BitVec 64))

(declare-fun lt!228146 () SeekEntryResult!4022)

(declare-fun lt!228143 () array!32350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32350 (_ BitVec 32)) SeekEntryResult!4022)

(assert (=> b!502083 (= lt!228146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228144 lt!228148 lt!228143 mask!3524))))

(declare-fun res!303546 () Bool)

(assert (=> start!45594 (=> (not res!303546) (not e!294106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45594 (= res!303546 (validMask!0 mask!3524))))

(assert (=> start!45594 e!294106))

(assert (=> start!45594 true))

(declare-fun array_inv!11351 (array!32350) Bool)

(assert (=> start!45594 (array_inv!11351 a!3235)))

(declare-fun b!502084 () Bool)

(declare-fun Unit!15167 () Unit!15164)

(assert (=> b!502084 (= e!294105 Unit!15167)))

(declare-fun lt!228147 () Unit!15164)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32350 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15164)

(assert (=> b!502084 (= lt!228147 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228144 #b00000000000000000000000000000000 (index!18278 lt!228151) (x!47311 lt!228151) mask!3524))))

(declare-fun res!303544 () Bool)

(assert (=> b!502084 (= res!303544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228144 lt!228148 lt!228143 mask!3524) (Intermediate!4022 false (index!18278 lt!228151) (x!47311 lt!228151))))))

(declare-fun e!294108 () Bool)

(assert (=> b!502084 (=> (not res!303544) (not e!294108))))

(assert (=> b!502084 e!294108))

(declare-fun b!502085 () Bool)

(assert (=> b!502085 (= e!294106 e!294102)))

(declare-fun res!303534 () Bool)

(assert (=> b!502085 (=> (not res!303534) (not e!294102))))

(declare-fun lt!228150 () SeekEntryResult!4022)

(assert (=> b!502085 (= res!303534 (or (= lt!228150 (MissingZero!4022 i!1204)) (= lt!228150 (MissingVacant!4022 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32350 (_ BitVec 32)) SeekEntryResult!4022)

(assert (=> b!502085 (= lt!228150 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502086 () Bool)

(declare-fun res!303537 () Bool)

(assert (=> b!502086 (=> (not res!303537) (not e!294106))))

(assert (=> b!502086 (= res!303537 (validKeyInArray!0 (select (arr!15555 a!3235) j!176)))))

(declare-fun b!502087 () Bool)

(declare-fun res!303547 () Bool)

(assert (=> b!502087 (=> (not res!303547) (not e!294102))))

(declare-datatypes ((List!9713 0))(
  ( (Nil!9710) (Cons!9709 (h!10586 (_ BitVec 64)) (t!15941 List!9713)) )
))
(declare-fun arrayNoDuplicates!0 (array!32350 (_ BitVec 32) List!9713) Bool)

(assert (=> b!502087 (= res!303547 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9710))))

(declare-fun b!502088 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32350 (_ BitVec 32)) SeekEntryResult!4022)

(assert (=> b!502088 (= e!294100 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228144 (index!18278 lt!228151) (select (arr!15555 a!3235) j!176) a!3235 mask!3524) (Found!4022 j!176))))))

(declare-fun b!502089 () Bool)

(declare-fun e!294104 () Bool)

(assert (=> b!502089 (= e!294104 (= (seekEntryOrOpen!0 (select (arr!15555 a!3235) j!176) a!3235 mask!3524) (Found!4022 j!176)))))

(declare-fun b!502090 () Bool)

(assert (=> b!502090 (= e!294102 (not e!294103))))

(declare-fun res!303548 () Bool)

(assert (=> b!502090 (=> res!303548 e!294103)))

(declare-fun lt!228142 () (_ BitVec 32))

(assert (=> b!502090 (= res!303548 (= lt!228151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228142 lt!228148 lt!228143 mask!3524)))))

(assert (=> b!502090 (= lt!228151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228144 (select (arr!15555 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502090 (= lt!228142 (toIndex!0 lt!228148 mask!3524))))

(assert (=> b!502090 (= lt!228148 (select (store (arr!15555 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502090 (= lt!228144 (toIndex!0 (select (arr!15555 a!3235) j!176) mask!3524))))

(assert (=> b!502090 (= lt!228143 (array!32351 (store (arr!15555 a!3235) i!1204 k!2280) (size!15919 a!3235)))))

(assert (=> b!502090 e!294104))

(declare-fun res!303543 () Bool)

(assert (=> b!502090 (=> (not res!303543) (not e!294104))))

(assert (=> b!502090 (= res!303543 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228149 () Unit!15164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15164)

(assert (=> b!502090 (= lt!228149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502091 () Bool)

(assert (=> b!502091 (= e!294108 false)))

(assert (= (and start!45594 res!303546) b!502077))

(assert (= (and b!502077 res!303540) b!502086))

(assert (= (and b!502086 res!303537) b!502082))

(assert (= (and b!502082 res!303545) b!502081))

(assert (= (and b!502081 res!303535) b!502085))

(assert (= (and b!502085 res!303534) b!502078))

(assert (= (and b!502078 res!303538) b!502087))

(assert (= (and b!502087 res!303547) b!502090))

(assert (= (and b!502090 res!303543) b!502089))

(assert (= (and b!502090 (not res!303548)) b!502080))

(assert (= (and b!502080 (not res!303539)) b!502075))

(assert (= (and b!502075 c!59549) b!502084))

(assert (= (and b!502075 (not c!59549)) b!502079))

(assert (= (and b!502084 res!303544) b!502091))

(assert (= (and b!502075 (not res!303542)) b!502076))

(assert (= (and b!502076 res!303541) b!502088))

(assert (= (and b!502076 (not res!303536)) b!502083))

(declare-fun m!483045 () Bool)

(assert (=> b!502075 m!483045))

(declare-fun m!483047 () Bool)

(assert (=> b!502075 m!483047))

(declare-fun m!483049 () Bool)

(assert (=> b!502075 m!483049))

(declare-fun m!483051 () Bool)

(assert (=> b!502083 m!483051))

(assert (=> b!502088 m!483049))

(assert (=> b!502088 m!483049))

(declare-fun m!483053 () Bool)

(assert (=> b!502088 m!483053))

(declare-fun m!483055 () Bool)

(assert (=> b!502084 m!483055))

(assert (=> b!502084 m!483051))

(declare-fun m!483057 () Bool)

(assert (=> start!45594 m!483057))

(declare-fun m!483059 () Bool)

(assert (=> start!45594 m!483059))

(declare-fun m!483061 () Bool)

(assert (=> b!502085 m!483061))

(assert (=> b!502086 m!483049))

(assert (=> b!502086 m!483049))

(declare-fun m!483063 () Bool)

(assert (=> b!502086 m!483063))

(declare-fun m!483065 () Bool)

(assert (=> b!502081 m!483065))

(assert (=> b!502090 m!483049))

(declare-fun m!483067 () Bool)

(assert (=> b!502090 m!483067))

(declare-fun m!483069 () Bool)

(assert (=> b!502090 m!483069))

(declare-fun m!483071 () Bool)

(assert (=> b!502090 m!483071))

(declare-fun m!483073 () Bool)

(assert (=> b!502090 m!483073))

(declare-fun m!483075 () Bool)

(assert (=> b!502090 m!483075))

(assert (=> b!502090 m!483049))

(declare-fun m!483077 () Bool)

(assert (=> b!502090 m!483077))

(assert (=> b!502090 m!483049))

(declare-fun m!483079 () Bool)

(assert (=> b!502090 m!483079))

(declare-fun m!483081 () Bool)

(assert (=> b!502090 m!483081))

(declare-fun m!483083 () Bool)

(assert (=> b!502078 m!483083))

(assert (=> b!502089 m!483049))

(assert (=> b!502089 m!483049))

(declare-fun m!483085 () Bool)

(assert (=> b!502089 m!483085))

(declare-fun m!483087 () Bool)

(assert (=> b!502082 m!483087))

(declare-fun m!483089 () Bool)

(assert (=> b!502087 m!483089))

(push 1)

