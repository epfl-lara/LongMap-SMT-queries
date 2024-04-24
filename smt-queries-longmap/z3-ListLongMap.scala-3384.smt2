; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46706 () Bool)

(assert start!46706)

(declare-fun b!515616 () Bool)

(declare-fun res!315238 () Bool)

(declare-fun e!301019 () Bool)

(assert (=> b!515616 (=> (not res!315238) (not e!301019))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515616 (= res!315238 (validKeyInArray!0 k0!2280))))

(declare-fun res!315239 () Bool)

(assert (=> start!46706 (=> (not res!315239) (not e!301019))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46706 (= res!315239 (validMask!0 mask!3524))))

(assert (=> start!46706 e!301019))

(assert (=> start!46706 true))

(declare-datatypes ((array!33019 0))(
  ( (array!33020 (arr!15877 (Array (_ BitVec 32) (_ BitVec 64))) (size!16241 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33019)

(declare-fun array_inv!11736 (array!33019) Bool)

(assert (=> start!46706 (array_inv!11736 a!3235)))

(declare-fun b!515617 () Bool)

(declare-fun res!315235 () Bool)

(declare-fun e!301016 () Bool)

(assert (=> b!515617 (=> res!315235 e!301016)))

(declare-datatypes ((SeekEntryResult!4300 0))(
  ( (MissingZero!4300 (index!19388 (_ BitVec 32))) (Found!4300 (index!19389 (_ BitVec 32))) (Intermediate!4300 (undefined!5112 Bool) (index!19390 (_ BitVec 32)) (x!48500 (_ BitVec 32))) (Undefined!4300) (MissingVacant!4300 (index!19391 (_ BitVec 32))) )
))
(declare-fun lt!236084 () SeekEntryResult!4300)

(get-info :version)

(assert (=> b!515617 (= res!315235 (or (undefined!5112 lt!236084) (not ((_ is Intermediate!4300) lt!236084))))))

(declare-fun b!515618 () Bool)

(declare-fun res!315244 () Bool)

(declare-fun e!301018 () Bool)

(assert (=> b!515618 (=> (not res!315244) (not e!301018))))

(declare-datatypes ((List!9942 0))(
  ( (Nil!9939) (Cons!9938 (h!10836 (_ BitVec 64)) (t!16162 List!9942)) )
))
(declare-fun arrayNoDuplicates!0 (array!33019 (_ BitVec 32) List!9942) Bool)

(assert (=> b!515618 (= res!315244 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9939))))

(declare-fun b!515619 () Bool)

(assert (=> b!515619 (= e!301016 true)))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515619 (and (bvslt (x!48500 lt!236084) #b01111111111111111111111111111110) (or (= (select (arr!15877 a!3235) (index!19390 lt!236084)) (select (arr!15877 a!3235) j!176)) (= (select (arr!15877 a!3235) (index!19390 lt!236084)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15877 a!3235) (index!19390 lt!236084)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515620 () Bool)

(declare-fun res!315243 () Bool)

(assert (=> b!515620 (=> (not res!315243) (not e!301019))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515620 (= res!315243 (and (= (size!16241 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16241 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16241 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515621 () Bool)

(declare-fun res!315237 () Bool)

(assert (=> b!515621 (=> (not res!315237) (not e!301019))))

(assert (=> b!515621 (= res!315237 (validKeyInArray!0 (select (arr!15877 a!3235) j!176)))))

(declare-fun b!515622 () Bool)

(declare-fun res!315234 () Bool)

(assert (=> b!515622 (=> (not res!315234) (not e!301019))))

(declare-fun arrayContainsKey!0 (array!33019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515622 (= res!315234 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515623 () Bool)

(declare-fun res!315242 () Bool)

(assert (=> b!515623 (=> (not res!315242) (not e!301018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33019 (_ BitVec 32)) Bool)

(assert (=> b!515623 (= res!315242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515624 () Bool)

(declare-fun e!301020 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33019 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!515624 (= e!301020 (= (seekEntryOrOpen!0 (select (arr!15877 a!3235) j!176) a!3235 mask!3524) (Found!4300 j!176)))))

(declare-fun b!515625 () Bool)

(assert (=> b!515625 (= e!301018 (not e!301016))))

(declare-fun res!315236 () Bool)

(assert (=> b!515625 (=> res!315236 e!301016)))

(declare-fun lt!236086 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33019 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!515625 (= res!315236 (= lt!236084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236086 (select (store (arr!15877 a!3235) i!1204 k0!2280) j!176) (array!33020 (store (arr!15877 a!3235) i!1204 k0!2280) (size!16241 a!3235)) mask!3524)))))

(declare-fun lt!236085 () (_ BitVec 32))

(assert (=> b!515625 (= lt!236084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236085 (select (arr!15877 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515625 (= lt!236086 (toIndex!0 (select (store (arr!15877 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515625 (= lt!236085 (toIndex!0 (select (arr!15877 a!3235) j!176) mask!3524))))

(assert (=> b!515625 e!301020))

(declare-fun res!315240 () Bool)

(assert (=> b!515625 (=> (not res!315240) (not e!301020))))

(assert (=> b!515625 (= res!315240 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15919 0))(
  ( (Unit!15920) )
))
(declare-fun lt!236082 () Unit!15919)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15919)

(assert (=> b!515625 (= lt!236082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515626 () Bool)

(assert (=> b!515626 (= e!301019 e!301018)))

(declare-fun res!315241 () Bool)

(assert (=> b!515626 (=> (not res!315241) (not e!301018))))

(declare-fun lt!236083 () SeekEntryResult!4300)

(assert (=> b!515626 (= res!315241 (or (= lt!236083 (MissingZero!4300 i!1204)) (= lt!236083 (MissingVacant!4300 i!1204))))))

(assert (=> b!515626 (= lt!236083 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46706 res!315239) b!515620))

(assert (= (and b!515620 res!315243) b!515621))

(assert (= (and b!515621 res!315237) b!515616))

(assert (= (and b!515616 res!315238) b!515622))

(assert (= (and b!515622 res!315234) b!515626))

(assert (= (and b!515626 res!315241) b!515623))

(assert (= (and b!515623 res!315242) b!515618))

(assert (= (and b!515618 res!315244) b!515625))

(assert (= (and b!515625 res!315240) b!515624))

(assert (= (and b!515625 (not res!315236)) b!515617))

(assert (= (and b!515617 (not res!315235)) b!515619))

(declare-fun m!497233 () Bool)

(assert (=> b!515624 m!497233))

(assert (=> b!515624 m!497233))

(declare-fun m!497235 () Bool)

(assert (=> b!515624 m!497235))

(assert (=> b!515621 m!497233))

(assert (=> b!515621 m!497233))

(declare-fun m!497237 () Bool)

(assert (=> b!515621 m!497237))

(declare-fun m!497239 () Bool)

(assert (=> b!515623 m!497239))

(declare-fun m!497241 () Bool)

(assert (=> b!515622 m!497241))

(declare-fun m!497243 () Bool)

(assert (=> b!515618 m!497243))

(declare-fun m!497245 () Bool)

(assert (=> start!46706 m!497245))

(declare-fun m!497247 () Bool)

(assert (=> start!46706 m!497247))

(declare-fun m!497249 () Bool)

(assert (=> b!515625 m!497249))

(declare-fun m!497251 () Bool)

(assert (=> b!515625 m!497251))

(declare-fun m!497253 () Bool)

(assert (=> b!515625 m!497253))

(declare-fun m!497255 () Bool)

(assert (=> b!515625 m!497255))

(assert (=> b!515625 m!497249))

(assert (=> b!515625 m!497233))

(declare-fun m!497257 () Bool)

(assert (=> b!515625 m!497257))

(assert (=> b!515625 m!497233))

(assert (=> b!515625 m!497249))

(declare-fun m!497259 () Bool)

(assert (=> b!515625 m!497259))

(assert (=> b!515625 m!497233))

(declare-fun m!497261 () Bool)

(assert (=> b!515625 m!497261))

(declare-fun m!497263 () Bool)

(assert (=> b!515625 m!497263))

(declare-fun m!497265 () Bool)

(assert (=> b!515616 m!497265))

(declare-fun m!497267 () Bool)

(assert (=> b!515619 m!497267))

(assert (=> b!515619 m!497233))

(declare-fun m!497269 () Bool)

(assert (=> b!515626 m!497269))

(check-sat (not b!515623) (not b!515622) (not b!515626) (not b!515621) (not b!515624) (not b!515616) (not start!46706) (not b!515618) (not b!515625))
(check-sat)
