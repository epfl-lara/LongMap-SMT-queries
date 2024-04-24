; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31836 () Bool)

(assert start!31836)

(declare-fun b!318339 () Bool)

(declare-fun res!172969 () Bool)

(declare-fun e!197808 () Bool)

(assert (=> b!318339 (=> (not res!172969) (not e!197808))))

(declare-datatypes ((array!16220 0))(
  ( (array!16221 (arr!7675 (Array (_ BitVec 32) (_ BitVec 64))) (size!8027 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16220)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318339 (= res!172969 (and (= (size!8027 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8027 a!3293))))))

(declare-fun b!318340 () Bool)

(declare-fun res!172970 () Bool)

(assert (=> b!318340 (=> (not res!172970) (not e!197808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16220 (_ BitVec 32)) Bool)

(assert (=> b!318340 (= res!172970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318341 () Bool)

(declare-fun res!172976 () Bool)

(assert (=> b!318341 (=> (not res!172976) (not e!197808))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318341 (= res!172976 (validKeyInArray!0 k0!2441))))

(declare-fun b!318343 () Bool)

(declare-fun e!197811 () Bool)

(declare-fun e!197809 () Bool)

(assert (=> b!318343 (= e!197811 e!197809)))

(declare-fun res!172975 () Bool)

(assert (=> b!318343 (=> (not res!172975) (not e!197809))))

(declare-datatypes ((SeekEntryResult!2780 0))(
  ( (MissingZero!2780 (index!13296 (_ BitVec 32))) (Found!2780 (index!13297 (_ BitVec 32))) (Intermediate!2780 (undefined!3592 Bool) (index!13298 (_ BitVec 32)) (x!31658 (_ BitVec 32))) (Undefined!2780) (MissingVacant!2780 (index!13299 (_ BitVec 32))) )
))
(declare-fun lt!155350 () SeekEntryResult!2780)

(declare-fun lt!155349 () SeekEntryResult!2780)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318343 (= res!172975 (and (= lt!155350 lt!155349) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7675 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16220 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!318343 (= lt!155350 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!155351 () (_ BitVec 32))

(declare-fun lt!155352 () array!16220)

(declare-fun b!318344 () Bool)

(declare-fun e!197807 () Bool)

(assert (=> b!318344 (= e!197807 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155352 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155351 k0!2441 lt!155352 mask!3709)))))

(assert (=> b!318344 (= lt!155352 (array!16221 (store (arr!7675 a!3293) i!1240 k0!2441) (size!8027 a!3293)))))

(declare-fun b!318345 () Bool)

(declare-fun res!172972 () Bool)

(assert (=> b!318345 (=> (not res!172972) (not e!197808))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16220 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!318345 (= res!172972 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2780 i!1240)))))

(declare-fun b!318346 () Bool)

(assert (=> b!318346 (= e!197808 e!197811)))

(declare-fun res!172977 () Bool)

(assert (=> b!318346 (=> (not res!172977) (not e!197811))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318346 (= res!172977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155349))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318346 (= lt!155349 (Intermediate!2780 false resIndex!52 resX!52))))

(declare-fun b!318342 () Bool)

(declare-fun res!172971 () Bool)

(assert (=> b!318342 (=> (not res!172971) (not e!197808))))

(declare-fun arrayContainsKey!0 (array!16220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318342 (= res!172971 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!172968 () Bool)

(assert (=> start!31836 (=> (not res!172968) (not e!197808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31836 (= res!172968 (validMask!0 mask!3709))))

(assert (=> start!31836 e!197808))

(declare-fun array_inv!5625 (array!16220) Bool)

(assert (=> start!31836 (array_inv!5625 a!3293)))

(assert (=> start!31836 true))

(declare-fun b!318347 () Bool)

(assert (=> b!318347 (= e!197809 (not (bvsle (bvadd #b00000000000000000000000000000001 x!1427) resX!52)))))

(assert (=> b!318347 e!197807))

(declare-fun res!172973 () Bool)

(assert (=> b!318347 (=> (not res!172973) (not e!197807))))

(assert (=> b!318347 (= res!172973 (= lt!155350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155351 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318347 (= lt!155351 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!318348 () Bool)

(declare-fun res!172974 () Bool)

(assert (=> b!318348 (=> (not res!172974) (not e!197811))))

(assert (=> b!318348 (= res!172974 (and (= (select (arr!7675 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8027 a!3293))))))

(assert (= (and start!31836 res!172968) b!318339))

(assert (= (and b!318339 res!172969) b!318341))

(assert (= (and b!318341 res!172976) b!318342))

(assert (= (and b!318342 res!172971) b!318345))

(assert (= (and b!318345 res!172972) b!318340))

(assert (= (and b!318340 res!172970) b!318346))

(assert (= (and b!318346 res!172977) b!318348))

(assert (= (and b!318348 res!172974) b!318343))

(assert (= (and b!318343 res!172975) b!318347))

(assert (= (and b!318347 res!172973) b!318344))

(declare-fun m!327259 () Bool)

(assert (=> b!318342 m!327259))

(declare-fun m!327261 () Bool)

(assert (=> b!318344 m!327261))

(declare-fun m!327263 () Bool)

(assert (=> b!318344 m!327263))

(declare-fun m!327265 () Bool)

(assert (=> b!318344 m!327265))

(declare-fun m!327267 () Bool)

(assert (=> b!318343 m!327267))

(declare-fun m!327269 () Bool)

(assert (=> b!318343 m!327269))

(declare-fun m!327271 () Bool)

(assert (=> b!318348 m!327271))

(declare-fun m!327273 () Bool)

(assert (=> b!318346 m!327273))

(assert (=> b!318346 m!327273))

(declare-fun m!327275 () Bool)

(assert (=> b!318346 m!327275))

(declare-fun m!327277 () Bool)

(assert (=> b!318345 m!327277))

(declare-fun m!327279 () Bool)

(assert (=> b!318341 m!327279))

(declare-fun m!327281 () Bool)

(assert (=> b!318340 m!327281))

(declare-fun m!327283 () Bool)

(assert (=> b!318347 m!327283))

(declare-fun m!327285 () Bool)

(assert (=> b!318347 m!327285))

(declare-fun m!327287 () Bool)

(assert (=> start!31836 m!327287))

(declare-fun m!327289 () Bool)

(assert (=> start!31836 m!327289))

(check-sat (not b!318340) (not start!31836) (not b!318344) (not b!318343) (not b!318342) (not b!318345) (not b!318347) (not b!318341) (not b!318346))
(check-sat)
