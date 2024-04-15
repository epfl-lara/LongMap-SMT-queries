; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30222 () Bool)

(assert start!30222)

(declare-fun b!302239 () Bool)

(declare-fun res!159874 () Bool)

(declare-fun e!190510 () Bool)

(assert (=> b!302239 (=> (not res!159874) (not e!190510))))

(declare-datatypes ((array!15332 0))(
  ( (array!15333 (arr!7254 (Array (_ BitVec 32) (_ BitVec 64))) (size!7607 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15332)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15332 (_ BitVec 32)) Bool)

(assert (=> b!302239 (= res!159874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!190509 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!302240 () Bool)

(assert (=> b!302240 (= e!190509 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7254 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7254 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7254 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302241 () Bool)

(declare-fun res!159872 () Bool)

(assert (=> b!302241 (=> (not res!159872) (not e!190509))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302241 (= res!159872 (and (= (select (arr!7254 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7607 a!3293))))))

(declare-fun b!302242 () Bool)

(declare-fun res!159877 () Bool)

(assert (=> b!302242 (=> (not res!159877) (not e!190510))))

(assert (=> b!302242 (= res!159877 (and (= (size!7607 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7607 a!3293))))))

(declare-fun b!302243 () Bool)

(declare-fun res!159873 () Bool)

(assert (=> b!302243 (=> (not res!159873) (not e!190509))))

(declare-datatypes ((SeekEntryResult!2393 0))(
  ( (MissingZero!2393 (index!11748 (_ BitVec 32))) (Found!2393 (index!11749 (_ BitVec 32))) (Intermediate!2393 (undefined!3205 Bool) (index!11750 (_ BitVec 32)) (x!30037 (_ BitVec 32))) (Undefined!2393) (MissingVacant!2393 (index!11751 (_ BitVec 32))) )
))
(declare-fun lt!149864 () SeekEntryResult!2393)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15332 (_ BitVec 32)) SeekEntryResult!2393)

(assert (=> b!302243 (= res!159873 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149864))))

(declare-fun b!302244 () Bool)

(declare-fun res!159876 () Bool)

(assert (=> b!302244 (=> (not res!159876) (not e!190510))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15332 (_ BitVec 32)) SeekEntryResult!2393)

(assert (=> b!302244 (= res!159876 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2393 i!1240)))))

(declare-fun res!159879 () Bool)

(assert (=> start!30222 (=> (not res!159879) (not e!190510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30222 (= res!159879 (validMask!0 mask!3709))))

(assert (=> start!30222 e!190510))

(declare-fun array_inv!5226 (array!15332) Bool)

(assert (=> start!30222 (array_inv!5226 a!3293)))

(assert (=> start!30222 true))

(declare-fun b!302245 () Bool)

(declare-fun res!159871 () Bool)

(assert (=> b!302245 (=> (not res!159871) (not e!190510))))

(declare-fun arrayContainsKey!0 (array!15332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302245 (= res!159871 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302246 () Bool)

(assert (=> b!302246 (= e!190510 e!190509)))

(declare-fun res!159875 () Bool)

(assert (=> b!302246 (=> (not res!159875) (not e!190509))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302246 (= res!159875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149864))))

(assert (=> b!302246 (= lt!149864 (Intermediate!2393 false resIndex!52 resX!52))))

(declare-fun b!302247 () Bool)

(declare-fun res!159878 () Bool)

(assert (=> b!302247 (=> (not res!159878) (not e!190510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302247 (= res!159878 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30222 res!159879) b!302242))

(assert (= (and b!302242 res!159877) b!302247))

(assert (= (and b!302247 res!159878) b!302245))

(assert (= (and b!302245 res!159871) b!302244))

(assert (= (and b!302244 res!159876) b!302239))

(assert (= (and b!302239 res!159874) b!302246))

(assert (= (and b!302246 res!159875) b!302241))

(assert (= (and b!302241 res!159872) b!302243))

(assert (= (and b!302243 res!159873) b!302240))

(declare-fun m!313297 () Bool)

(assert (=> b!302246 m!313297))

(assert (=> b!302246 m!313297))

(declare-fun m!313299 () Bool)

(assert (=> b!302246 m!313299))

(declare-fun m!313301 () Bool)

(assert (=> b!302247 m!313301))

(declare-fun m!313303 () Bool)

(assert (=> b!302240 m!313303))

(declare-fun m!313305 () Bool)

(assert (=> b!302244 m!313305))

(declare-fun m!313307 () Bool)

(assert (=> b!302239 m!313307))

(declare-fun m!313309 () Bool)

(assert (=> b!302245 m!313309))

(declare-fun m!313311 () Bool)

(assert (=> b!302243 m!313311))

(declare-fun m!313313 () Bool)

(assert (=> b!302241 m!313313))

(declare-fun m!313315 () Bool)

(assert (=> start!30222 m!313315))

(declare-fun m!313317 () Bool)

(assert (=> start!30222 m!313317))

(check-sat (not b!302247) (not b!302245) (not b!302246) (not start!30222) (not b!302239) (not b!302244) (not b!302243))
(check-sat)
