; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30984 () Bool)

(assert start!30984)

(declare-fun res!167760 () Bool)

(declare-fun e!194249 () Bool)

(assert (=> start!30984 (=> (not res!167760) (not e!194249))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30984 (= res!167760 (validMask!0 mask!3709))))

(assert (=> start!30984 e!194249))

(declare-datatypes ((array!15886 0))(
  ( (array!15887 (arr!7525 (Array (_ BitVec 32) (_ BitVec 64))) (size!7877 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15886)

(declare-fun array_inv!5488 (array!15886) Bool)

(assert (=> start!30984 (array_inv!5488 a!3293)))

(assert (=> start!30984 true))

(declare-fun b!311297 () Bool)

(declare-fun res!167753 () Bool)

(assert (=> b!311297 (=> (not res!167753) (not e!194249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15886 (_ BitVec 32)) Bool)

(assert (=> b!311297 (= res!167753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311298 () Bool)

(declare-fun res!167757 () Bool)

(assert (=> b!311298 (=> (not res!167757) (not e!194249))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311298 (= res!167757 (and (= (size!7877 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7877 a!3293))))))

(declare-fun b!311299 () Bool)

(declare-fun e!194251 () Bool)

(assert (=> b!311299 (= e!194251 (not true))))

(declare-fun e!194248 () Bool)

(assert (=> b!311299 e!194248))

(declare-fun res!167756 () Bool)

(assert (=> b!311299 (=> (not res!167756) (not e!194248))))

(declare-fun lt!152298 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2665 0))(
  ( (MissingZero!2665 (index!12836 (_ BitVec 32))) (Found!2665 (index!12837 (_ BitVec 32))) (Intermediate!2665 (undefined!3477 Bool) (index!12838 (_ BitVec 32)) (x!31054 (_ BitVec 32))) (Undefined!2665) (MissingVacant!2665 (index!12839 (_ BitVec 32))) )
))
(declare-fun lt!152300 () SeekEntryResult!2665)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15886 (_ BitVec 32)) SeekEntryResult!2665)

(assert (=> b!311299 (= res!167756 (= lt!152300 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152298 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311299 (= lt!152298 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311300 () Bool)

(declare-fun lt!152301 () array!15886)

(assert (=> b!311300 (= e!194248 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152301 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152298 k!2441 lt!152301 mask!3709)))))

(assert (=> b!311300 (= lt!152301 (array!15887 (store (arr!7525 a!3293) i!1240 k!2441) (size!7877 a!3293)))))

(declare-fun b!311301 () Bool)

(declare-fun res!167758 () Bool)

(assert (=> b!311301 (=> (not res!167758) (not e!194249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311301 (= res!167758 (validKeyInArray!0 k!2441))))

(declare-fun b!311302 () Bool)

(declare-fun e!194250 () Bool)

(assert (=> b!311302 (= e!194249 e!194250)))

(declare-fun res!167751 () Bool)

(assert (=> b!311302 (=> (not res!167751) (not e!194250))))

(declare-fun lt!152299 () SeekEntryResult!2665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311302 (= res!167751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152299))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311302 (= lt!152299 (Intermediate!2665 false resIndex!52 resX!52))))

(declare-fun b!311303 () Bool)

(declare-fun res!167754 () Bool)

(assert (=> b!311303 (=> (not res!167754) (not e!194249))))

(declare-fun arrayContainsKey!0 (array!15886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311303 (= res!167754 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311304 () Bool)

(declare-fun res!167752 () Bool)

(assert (=> b!311304 (=> (not res!167752) (not e!194249))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15886 (_ BitVec 32)) SeekEntryResult!2665)

(assert (=> b!311304 (= res!167752 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2665 i!1240)))))

(declare-fun b!311305 () Bool)

(assert (=> b!311305 (= e!194250 e!194251)))

(declare-fun res!167755 () Bool)

(assert (=> b!311305 (=> (not res!167755) (not e!194251))))

(assert (=> b!311305 (= res!167755 (and (= lt!152300 lt!152299) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7525 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311305 (= lt!152300 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311306 () Bool)

(declare-fun res!167759 () Bool)

(assert (=> b!311306 (=> (not res!167759) (not e!194250))))

(assert (=> b!311306 (= res!167759 (and (= (select (arr!7525 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7877 a!3293))))))

(assert (= (and start!30984 res!167760) b!311298))

(assert (= (and b!311298 res!167757) b!311301))

(assert (= (and b!311301 res!167758) b!311303))

(assert (= (and b!311303 res!167754) b!311304))

(assert (= (and b!311304 res!167752) b!311297))

(assert (= (and b!311297 res!167753) b!311302))

(assert (= (and b!311302 res!167751) b!311306))

(assert (= (and b!311306 res!167759) b!311305))

(assert (= (and b!311305 res!167755) b!311299))

(assert (= (and b!311299 res!167756) b!311300))

(declare-fun m!321261 () Bool)

(assert (=> b!311303 m!321261))

(declare-fun m!321263 () Bool)

(assert (=> b!311297 m!321263))

(declare-fun m!321265 () Bool)

(assert (=> b!311302 m!321265))

(assert (=> b!311302 m!321265))

(declare-fun m!321267 () Bool)

(assert (=> b!311302 m!321267))

(declare-fun m!321269 () Bool)

(assert (=> b!311306 m!321269))

(declare-fun m!321271 () Bool)

(assert (=> b!311300 m!321271))

(declare-fun m!321273 () Bool)

(assert (=> b!311300 m!321273))

(declare-fun m!321275 () Bool)

(assert (=> b!311300 m!321275))

(declare-fun m!321277 () Bool)

(assert (=> b!311304 m!321277))

(declare-fun m!321279 () Bool)

(assert (=> start!30984 m!321279))

(declare-fun m!321281 () Bool)

(assert (=> start!30984 m!321281))

(declare-fun m!321283 () Bool)

(assert (=> b!311305 m!321283))

(declare-fun m!321285 () Bool)

(assert (=> b!311305 m!321285))

(declare-fun m!321287 () Bool)

(assert (=> b!311299 m!321287))

(declare-fun m!321289 () Bool)

(assert (=> b!311299 m!321289))

(declare-fun m!321291 () Bool)

(assert (=> b!311301 m!321291))

(push 1)

(assert (not b!311299))

(assert (not b!311297))

(assert (not b!311300))

