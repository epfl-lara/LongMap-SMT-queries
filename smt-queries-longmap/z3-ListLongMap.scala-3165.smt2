; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44604 () Bool)

(assert start!44604)

(declare-fun b!489137 () Bool)

(declare-fun res!292222 () Bool)

(declare-fun e!287674 () Bool)

(assert (=> b!489137 (=> (not res!292222) (not e!287674))))

(declare-datatypes ((array!31673 0))(
  ( (array!31674 (arr!15224 (Array (_ BitVec 32) (_ BitVec 64))) (size!15589 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31673)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489137 (= res!292222 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!292221 () Bool)

(assert (=> start!44604 (=> (not res!292221) (not e!287674))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44604 (= res!292221 (validMask!0 mask!3524))))

(assert (=> start!44604 e!287674))

(assert (=> start!44604 true))

(declare-fun array_inv!11107 (array!31673) Bool)

(assert (=> start!44604 (array_inv!11107 a!3235)))

(declare-fun b!489138 () Bool)

(declare-fun res!292218 () Bool)

(assert (=> b!489138 (=> (not res!292218) (not e!287674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489138 (= res!292218 (validKeyInArray!0 k0!2280))))

(declare-fun b!489139 () Bool)

(declare-fun e!287673 () Bool)

(assert (=> b!489139 (= e!287673 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3688 0))(
  ( (MissingZero!3688 (index!16931 (_ BitVec 32))) (Found!3688 (index!16932 (_ BitVec 32))) (Intermediate!3688 (undefined!4500 Bool) (index!16933 (_ BitVec 32)) (x!46053 (_ BitVec 32))) (Undefined!3688) (MissingVacant!3688 (index!16934 (_ BitVec 32))) )
))
(declare-fun lt!220574 () SeekEntryResult!3688)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!220572 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31673 (_ BitVec 32)) SeekEntryResult!3688)

(assert (=> b!489139 (= lt!220574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220572 (select (store (arr!15224 a!3235) i!1204 k0!2280) j!176) (array!31674 (store (arr!15224 a!3235) i!1204 k0!2280) (size!15589 a!3235)) mask!3524))))

(declare-fun lt!220576 () (_ BitVec 32))

(declare-fun lt!220571 () SeekEntryResult!3688)

(assert (=> b!489139 (= lt!220571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220576 (select (arr!15224 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489139 (= lt!220572 (toIndex!0 (select (store (arr!15224 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489139 (= lt!220576 (toIndex!0 (select (arr!15224 a!3235) j!176) mask!3524))))

(declare-fun e!287675 () Bool)

(assert (=> b!489139 e!287675))

(declare-fun res!292215 () Bool)

(assert (=> b!489139 (=> (not res!292215) (not e!287675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31673 (_ BitVec 32)) Bool)

(assert (=> b!489139 (= res!292215 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14308 0))(
  ( (Unit!14309) )
))
(declare-fun lt!220575 () Unit!14308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14308)

(assert (=> b!489139 (= lt!220575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489140 () Bool)

(declare-fun res!292219 () Bool)

(assert (=> b!489140 (=> (not res!292219) (not e!287674))))

(assert (=> b!489140 (= res!292219 (and (= (size!15589 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15589 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15589 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489141 () Bool)

(assert (=> b!489141 (= e!287674 e!287673)))

(declare-fun res!292217 () Bool)

(assert (=> b!489141 (=> (not res!292217) (not e!287673))))

(declare-fun lt!220573 () SeekEntryResult!3688)

(assert (=> b!489141 (= res!292217 (or (= lt!220573 (MissingZero!3688 i!1204)) (= lt!220573 (MissingVacant!3688 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31673 (_ BitVec 32)) SeekEntryResult!3688)

(assert (=> b!489141 (= lt!220573 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489142 () Bool)

(declare-fun res!292223 () Bool)

(assert (=> b!489142 (=> (not res!292223) (not e!287673))))

(assert (=> b!489142 (= res!292223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489143 () Bool)

(declare-fun res!292220 () Bool)

(assert (=> b!489143 (=> (not res!292220) (not e!287674))))

(assert (=> b!489143 (= res!292220 (validKeyInArray!0 (select (arr!15224 a!3235) j!176)))))

(declare-fun b!489144 () Bool)

(declare-fun res!292216 () Bool)

(assert (=> b!489144 (=> (not res!292216) (not e!287673))))

(declare-datatypes ((List!9421 0))(
  ( (Nil!9418) (Cons!9417 (h!10279 (_ BitVec 64)) (t!15640 List!9421)) )
))
(declare-fun arrayNoDuplicates!0 (array!31673 (_ BitVec 32) List!9421) Bool)

(assert (=> b!489144 (= res!292216 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9418))))

(declare-fun b!489145 () Bool)

(assert (=> b!489145 (= e!287675 (= (seekEntryOrOpen!0 (select (arr!15224 a!3235) j!176) a!3235 mask!3524) (Found!3688 j!176)))))

(assert (= (and start!44604 res!292221) b!489140))

(assert (= (and b!489140 res!292219) b!489143))

(assert (= (and b!489143 res!292220) b!489138))

(assert (= (and b!489138 res!292218) b!489137))

(assert (= (and b!489137 res!292222) b!489141))

(assert (= (and b!489141 res!292217) b!489142))

(assert (= (and b!489142 res!292223) b!489144))

(assert (= (and b!489144 res!292216) b!489139))

(assert (= (and b!489139 res!292215) b!489145))

(declare-fun m!468421 () Bool)

(assert (=> b!489139 m!468421))

(declare-fun m!468423 () Bool)

(assert (=> b!489139 m!468423))

(declare-fun m!468425 () Bool)

(assert (=> b!489139 m!468425))

(declare-fun m!468427 () Bool)

(assert (=> b!489139 m!468427))

(declare-fun m!468429 () Bool)

(assert (=> b!489139 m!468429))

(assert (=> b!489139 m!468427))

(declare-fun m!468431 () Bool)

(assert (=> b!489139 m!468431))

(assert (=> b!489139 m!468425))

(declare-fun m!468433 () Bool)

(assert (=> b!489139 m!468433))

(assert (=> b!489139 m!468425))

(declare-fun m!468435 () Bool)

(assert (=> b!489139 m!468435))

(assert (=> b!489139 m!468427))

(declare-fun m!468437 () Bool)

(assert (=> b!489139 m!468437))

(declare-fun m!468439 () Bool)

(assert (=> b!489144 m!468439))

(declare-fun m!468441 () Bool)

(assert (=> b!489137 m!468441))

(declare-fun m!468443 () Bool)

(assert (=> b!489141 m!468443))

(assert (=> b!489143 m!468427))

(assert (=> b!489143 m!468427))

(declare-fun m!468445 () Bool)

(assert (=> b!489143 m!468445))

(declare-fun m!468447 () Bool)

(assert (=> b!489142 m!468447))

(declare-fun m!468449 () Bool)

(assert (=> start!44604 m!468449))

(declare-fun m!468451 () Bool)

(assert (=> start!44604 m!468451))

(declare-fun m!468453 () Bool)

(assert (=> b!489138 m!468453))

(assert (=> b!489145 m!468427))

(assert (=> b!489145 m!468427))

(declare-fun m!468455 () Bool)

(assert (=> b!489145 m!468455))

(check-sat (not b!489138) (not b!489143) (not b!489139) (not b!489137) (not b!489145) (not b!489144) (not b!489141) (not start!44604) (not b!489142))
(check-sat)
