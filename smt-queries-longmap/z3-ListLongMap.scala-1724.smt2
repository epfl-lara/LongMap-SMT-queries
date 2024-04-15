; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31782 () Bool)

(assert start!31782)

(declare-fun b!317307 () Bool)

(declare-fun res!172039 () Bool)

(declare-fun e!197264 () Bool)

(assert (=> b!317307 (=> (not res!172039) (not e!197264))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317307 (= res!172039 (validKeyInArray!0 k0!2441))))

(declare-fun b!317308 () Bool)

(declare-fun res!172037 () Bool)

(assert (=> b!317308 (=> (not res!172037) (not e!197264))))

(declare-datatypes ((array!16157 0))(
  ( (array!16158 (arr!7644 (Array (_ BitVec 32) (_ BitVec 64))) (size!7997 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16157)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317308 (= res!172037 (and (= (size!7997 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7997 a!3293))))))

(declare-fun e!197263 () Bool)

(declare-fun lt!154774 () array!16157)

(declare-fun lt!154772 () (_ BitVec 32))

(declare-fun b!317309 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2783 0))(
  ( (MissingZero!2783 (index!13308 (_ BitVec 32))) (Found!2783 (index!13309 (_ BitVec 32))) (Intermediate!2783 (undefined!3595 Bool) (index!13310 (_ BitVec 32)) (x!31587 (_ BitVec 32))) (Undefined!2783) (MissingVacant!2783 (index!13311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16157 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!317309 (= e!197263 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154774 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154772 k0!2441 lt!154774 mask!3709)))))

(assert (=> b!317309 (= lt!154774 (array!16158 (store (arr!7644 a!3293) i!1240 k0!2441) (size!7997 a!3293)))))

(declare-fun b!317310 () Bool)

(declare-fun res!172033 () Bool)

(assert (=> b!317310 (=> (not res!172033) (not e!197264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16157 (_ BitVec 32)) Bool)

(assert (=> b!317310 (= res!172033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317311 () Bool)

(declare-fun e!197260 () Bool)

(assert (=> b!317311 (= e!197260 (not true))))

(assert (=> b!317311 e!197263))

(declare-fun res!172035 () Bool)

(assert (=> b!317311 (=> (not res!172035) (not e!197263))))

(declare-fun lt!154775 () SeekEntryResult!2783)

(assert (=> b!317311 (= res!172035 (= lt!154775 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154772 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317311 (= lt!154772 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172036 () Bool)

(assert (=> start!31782 (=> (not res!172036) (not e!197264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31782 (= res!172036 (validMask!0 mask!3709))))

(assert (=> start!31782 e!197264))

(declare-fun array_inv!5616 (array!16157) Bool)

(assert (=> start!31782 (array_inv!5616 a!3293)))

(assert (=> start!31782 true))

(declare-fun b!317312 () Bool)

(declare-fun res!172034 () Bool)

(assert (=> b!317312 (=> (not res!172034) (not e!197264))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16157 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!317312 (= res!172034 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2783 i!1240)))))

(declare-fun b!317313 () Bool)

(declare-fun e!197261 () Bool)

(assert (=> b!317313 (= e!197261 e!197260)))

(declare-fun res!172041 () Bool)

(assert (=> b!317313 (=> (not res!172041) (not e!197260))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154773 () SeekEntryResult!2783)

(assert (=> b!317313 (= res!172041 (and (= lt!154775 lt!154773) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7644 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317313 (= lt!154775 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317314 () Bool)

(declare-fun res!172040 () Bool)

(assert (=> b!317314 (=> (not res!172040) (not e!197264))))

(declare-fun arrayContainsKey!0 (array!16157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317314 (= res!172040 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317315 () Bool)

(declare-fun res!172032 () Bool)

(assert (=> b!317315 (=> (not res!172032) (not e!197261))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317315 (= res!172032 (and (= (select (arr!7644 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7997 a!3293))))))

(declare-fun b!317316 () Bool)

(assert (=> b!317316 (= e!197264 e!197261)))

(declare-fun res!172038 () Bool)

(assert (=> b!317316 (=> (not res!172038) (not e!197261))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317316 (= res!172038 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154773))))

(assert (=> b!317316 (= lt!154773 (Intermediate!2783 false resIndex!52 resX!52))))

(assert (= (and start!31782 res!172036) b!317308))

(assert (= (and b!317308 res!172037) b!317307))

(assert (= (and b!317307 res!172039) b!317314))

(assert (= (and b!317314 res!172040) b!317312))

(assert (= (and b!317312 res!172034) b!317310))

(assert (= (and b!317310 res!172033) b!317316))

(assert (= (and b!317316 res!172038) b!317315))

(assert (= (and b!317315 res!172032) b!317313))

(assert (= (and b!317313 res!172041) b!317311))

(assert (= (and b!317311 res!172035) b!317309))

(declare-fun m!325495 () Bool)

(assert (=> b!317310 m!325495))

(declare-fun m!325497 () Bool)

(assert (=> b!317311 m!325497))

(declare-fun m!325499 () Bool)

(assert (=> b!317311 m!325499))

(declare-fun m!325501 () Bool)

(assert (=> b!317315 m!325501))

(declare-fun m!325503 () Bool)

(assert (=> start!31782 m!325503))

(declare-fun m!325505 () Bool)

(assert (=> start!31782 m!325505))

(declare-fun m!325507 () Bool)

(assert (=> b!317309 m!325507))

(declare-fun m!325509 () Bool)

(assert (=> b!317309 m!325509))

(declare-fun m!325511 () Bool)

(assert (=> b!317309 m!325511))

(declare-fun m!325513 () Bool)

(assert (=> b!317314 m!325513))

(declare-fun m!325515 () Bool)

(assert (=> b!317312 m!325515))

(declare-fun m!325517 () Bool)

(assert (=> b!317313 m!325517))

(declare-fun m!325519 () Bool)

(assert (=> b!317313 m!325519))

(declare-fun m!325521 () Bool)

(assert (=> b!317316 m!325521))

(assert (=> b!317316 m!325521))

(declare-fun m!325523 () Bool)

(assert (=> b!317316 m!325523))

(declare-fun m!325525 () Bool)

(assert (=> b!317307 m!325525))

(check-sat (not b!317311) (not b!317309) (not start!31782) (not b!317310) (not b!317307) (not b!317312) (not b!317313) (not b!317316) (not b!317314))
(check-sat)
