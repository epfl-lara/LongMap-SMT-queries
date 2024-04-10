; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46100 () Bool)

(assert start!46100)

(declare-fun b!510648 () Bool)

(declare-fun res!311496 () Bool)

(declare-fun e!298459 () Bool)

(assert (=> b!510648 (=> (not res!311496) (not e!298459))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510648 (= res!311496 (validKeyInArray!0 k0!2280))))

(declare-fun b!510649 () Bool)

(declare-fun res!311499 () Bool)

(assert (=> b!510649 (=> (not res!311499) (not e!298459))))

(declare-datatypes ((array!32811 0))(
  ( (array!32812 (arr!15784 (Array (_ BitVec 32) (_ BitVec 64))) (size!16148 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32811)

(declare-fun arrayContainsKey!0 (array!32811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510649 (= res!311499 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311494 () Bool)

(assert (=> start!46100 (=> (not res!311494) (not e!298459))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46100 (= res!311494 (validMask!0 mask!3524))))

(assert (=> start!46100 e!298459))

(assert (=> start!46100 true))

(declare-fun array_inv!11580 (array!32811) Bool)

(assert (=> start!46100 (array_inv!11580 a!3235)))

(declare-fun b!510650 () Bool)

(declare-fun res!311498 () Bool)

(declare-fun e!298460 () Bool)

(assert (=> b!510650 (=> (not res!311498) (not e!298460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32811 (_ BitVec 32)) Bool)

(assert (=> b!510650 (= res!311498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510651 () Bool)

(declare-fun res!311495 () Bool)

(assert (=> b!510651 (=> (not res!311495) (not e!298460))))

(declare-datatypes ((List!9942 0))(
  ( (Nil!9939) (Cons!9938 (h!10815 (_ BitVec 64)) (t!16170 List!9942)) )
))
(declare-fun arrayNoDuplicates!0 (array!32811 (_ BitVec 32) List!9942) Bool)

(assert (=> b!510651 (= res!311495 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9939))))

(declare-fun b!510652 () Bool)

(declare-fun res!311500 () Bool)

(assert (=> b!510652 (=> (not res!311500) (not e!298459))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510652 (= res!311500 (validKeyInArray!0 (select (arr!15784 a!3235) j!176)))))

(declare-fun b!510653 () Bool)

(declare-fun e!298461 () Bool)

(assert (=> b!510653 (= e!298461 true)))

(declare-fun lt!233524 () array!32811)

(declare-datatypes ((SeekEntryResult!4251 0))(
  ( (MissingZero!4251 (index!19192 (_ BitVec 32))) (Found!4251 (index!19193 (_ BitVec 32))) (Intermediate!4251 (undefined!5063 Bool) (index!19194 (_ BitVec 32)) (x!48148 (_ BitVec 32))) (Undefined!4251) (MissingVacant!4251 (index!19195 (_ BitVec 32))) )
))
(declare-fun lt!233522 () SeekEntryResult!4251)

(declare-fun lt!233525 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32811 (_ BitVec 32)) SeekEntryResult!4251)

(assert (=> b!510653 (= lt!233522 (seekEntryOrOpen!0 lt!233525 lt!233524 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!15760 0))(
  ( (Unit!15761) )
))
(declare-fun lt!233527 () Unit!15760)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15760)

(assert (=> b!510653 (= lt!233527 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510654 () Bool)

(declare-fun res!311497 () Bool)

(assert (=> b!510654 (=> (not res!311497) (not e!298459))))

(assert (=> b!510654 (= res!311497 (and (= (size!16148 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16148 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16148 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510655 () Bool)

(assert (=> b!510655 (= e!298460 (not e!298461))))

(declare-fun res!311501 () Bool)

(assert (=> b!510655 (=> res!311501 e!298461)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32811 (_ BitVec 32)) SeekEntryResult!4251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510655 (= res!311501 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15784 a!3235) j!176) mask!3524) (select (arr!15784 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233525 mask!3524) lt!233525 lt!233524 mask!3524))))))

(assert (=> b!510655 (= lt!233525 (select (store (arr!15784 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510655 (= lt!233524 (array!32812 (store (arr!15784 a!3235) i!1204 k0!2280) (size!16148 a!3235)))))

(assert (=> b!510655 (= lt!233522 (Found!4251 j!176))))

(assert (=> b!510655 (= lt!233522 (seekEntryOrOpen!0 (select (arr!15784 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510655 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233523 () Unit!15760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15760)

(assert (=> b!510655 (= lt!233523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510656 () Bool)

(assert (=> b!510656 (= e!298459 e!298460)))

(declare-fun res!311493 () Bool)

(assert (=> b!510656 (=> (not res!311493) (not e!298460))))

(declare-fun lt!233526 () SeekEntryResult!4251)

(assert (=> b!510656 (= res!311493 (or (= lt!233526 (MissingZero!4251 i!1204)) (= lt!233526 (MissingVacant!4251 i!1204))))))

(assert (=> b!510656 (= lt!233526 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46100 res!311494) b!510654))

(assert (= (and b!510654 res!311497) b!510652))

(assert (= (and b!510652 res!311500) b!510648))

(assert (= (and b!510648 res!311496) b!510649))

(assert (= (and b!510649 res!311499) b!510656))

(assert (= (and b!510656 res!311493) b!510650))

(assert (= (and b!510650 res!311498) b!510651))

(assert (= (and b!510651 res!311495) b!510655))

(assert (= (and b!510655 (not res!311501)) b!510653))

(declare-fun m!492013 () Bool)

(assert (=> b!510648 m!492013))

(declare-fun m!492015 () Bool)

(assert (=> b!510655 m!492015))

(declare-fun m!492017 () Bool)

(assert (=> b!510655 m!492017))

(declare-fun m!492019 () Bool)

(assert (=> b!510655 m!492019))

(declare-fun m!492021 () Bool)

(assert (=> b!510655 m!492021))

(declare-fun m!492023 () Bool)

(assert (=> b!510655 m!492023))

(declare-fun m!492025 () Bool)

(assert (=> b!510655 m!492025))

(declare-fun m!492027 () Bool)

(assert (=> b!510655 m!492027))

(assert (=> b!510655 m!492023))

(assert (=> b!510655 m!492021))

(assert (=> b!510655 m!492023))

(declare-fun m!492029 () Bool)

(assert (=> b!510655 m!492029))

(assert (=> b!510655 m!492023))

(declare-fun m!492031 () Bool)

(assert (=> b!510655 m!492031))

(assert (=> b!510655 m!492027))

(declare-fun m!492033 () Bool)

(assert (=> b!510655 m!492033))

(declare-fun m!492035 () Bool)

(assert (=> b!510651 m!492035))

(declare-fun m!492037 () Bool)

(assert (=> start!46100 m!492037))

(declare-fun m!492039 () Bool)

(assert (=> start!46100 m!492039))

(declare-fun m!492041 () Bool)

(assert (=> b!510653 m!492041))

(declare-fun m!492043 () Bool)

(assert (=> b!510653 m!492043))

(assert (=> b!510652 m!492023))

(assert (=> b!510652 m!492023))

(declare-fun m!492045 () Bool)

(assert (=> b!510652 m!492045))

(declare-fun m!492047 () Bool)

(assert (=> b!510656 m!492047))

(declare-fun m!492049 () Bool)

(assert (=> b!510649 m!492049))

(declare-fun m!492051 () Bool)

(assert (=> b!510650 m!492051))

(check-sat (not b!510649) (not b!510650) (not b!510652) (not b!510653) (not b!510656) (not b!510655) (not b!510651) (not b!510648) (not start!46100))
(check-sat)
