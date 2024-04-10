; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30920 () Bool)

(assert start!30920)

(declare-fun res!166797 () Bool)

(declare-fun e!193770 () Bool)

(assert (=> start!30920 (=> (not res!166797) (not e!193770))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30920 (= res!166797 (validMask!0 mask!3709))))

(assert (=> start!30920 e!193770))

(declare-datatypes ((array!15822 0))(
  ( (array!15823 (arr!7493 (Array (_ BitVec 32) (_ BitVec 64))) (size!7845 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15822)

(declare-fun array_inv!5456 (array!15822) Bool)

(assert (=> start!30920 (array_inv!5456 a!3293)))

(assert (=> start!30920 true))

(declare-fun b!310337 () Bool)

(declare-fun res!166792 () Bool)

(declare-fun e!193769 () Bool)

(assert (=> b!310337 (=> (not res!166792) (not e!193769))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310337 (= res!166792 (and (= (select (arr!7493 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7845 a!3293))))))

(declare-fun b!310338 () Bool)

(assert (=> b!310338 (= e!193770 e!193769)))

(declare-fun res!166793 () Bool)

(assert (=> b!310338 (=> (not res!166793) (not e!193769))))

(declare-datatypes ((SeekEntryResult!2633 0))(
  ( (MissingZero!2633 (index!12708 (_ BitVec 32))) (Found!2633 (index!12709 (_ BitVec 32))) (Intermediate!2633 (undefined!3445 Bool) (index!12710 (_ BitVec 32)) (x!30942 (_ BitVec 32))) (Undefined!2633) (MissingVacant!2633 (index!12711 (_ BitVec 32))) )
))
(declare-fun lt!151916 () SeekEntryResult!2633)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15822 (_ BitVec 32)) SeekEntryResult!2633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310338 (= res!166793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151916))))

(assert (=> b!310338 (= lt!151916 (Intermediate!2633 false resIndex!52 resX!52))))

(declare-fun b!310339 () Bool)

(declare-fun e!193768 () Bool)

(assert (=> b!310339 (= e!193769 e!193768)))

(declare-fun res!166798 () Bool)

(assert (=> b!310339 (=> (not res!166798) (not e!193768))))

(declare-fun lt!151914 () SeekEntryResult!2633)

(assert (=> b!310339 (= res!166798 (and (= lt!151914 lt!151916) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7493 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310339 (= lt!151914 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310340 () Bool)

(declare-fun lt!151917 () array!15822)

(declare-fun lt!151915 () (_ BitVec 32))

(declare-fun e!193771 () Bool)

(assert (=> b!310340 (= e!193771 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151917 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151915 k!2441 lt!151917 mask!3709)))))

(assert (=> b!310340 (= lt!151917 (array!15823 (store (arr!7493 a!3293) i!1240 k!2441) (size!7845 a!3293)))))

(declare-fun b!310341 () Bool)

(declare-fun res!166795 () Bool)

(assert (=> b!310341 (=> (not res!166795) (not e!193770))))

(assert (=> b!310341 (= res!166795 (and (= (size!7845 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7845 a!3293))))))

(declare-fun b!310342 () Bool)

(declare-fun res!166800 () Bool)

(assert (=> b!310342 (=> (not res!166800) (not e!193770))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15822 (_ BitVec 32)) SeekEntryResult!2633)

(assert (=> b!310342 (= res!166800 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2633 i!1240)))))

(declare-fun b!310343 () Bool)

(assert (=> b!310343 (= e!193768 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!310343 e!193771))

(declare-fun res!166799 () Bool)

(assert (=> b!310343 (=> (not res!166799) (not e!193771))))

(assert (=> b!310343 (= res!166799 (= lt!151914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151915 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310343 (= lt!151915 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310344 () Bool)

(declare-fun res!166791 () Bool)

(assert (=> b!310344 (=> (not res!166791) (not e!193770))))

(declare-fun arrayContainsKey!0 (array!15822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310344 (= res!166791 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310345 () Bool)

(declare-fun res!166794 () Bool)

(assert (=> b!310345 (=> (not res!166794) (not e!193770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310345 (= res!166794 (validKeyInArray!0 k!2441))))

(declare-fun b!310346 () Bool)

(declare-fun res!166796 () Bool)

(assert (=> b!310346 (=> (not res!166796) (not e!193770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15822 (_ BitVec 32)) Bool)

(assert (=> b!310346 (= res!166796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30920 res!166797) b!310341))

(assert (= (and b!310341 res!166795) b!310345))

(assert (= (and b!310345 res!166794) b!310344))

(assert (= (and b!310344 res!166791) b!310342))

(assert (= (and b!310342 res!166800) b!310346))

(assert (= (and b!310346 res!166796) b!310338))

(assert (= (and b!310338 res!166793) b!310337))

(assert (= (and b!310337 res!166792) b!310339))

(assert (= (and b!310339 res!166798) b!310343))

(assert (= (and b!310343 res!166799) b!310340))

(declare-fun m!320237 () Bool)

(assert (=> start!30920 m!320237))

(declare-fun m!320239 () Bool)

(assert (=> start!30920 m!320239))

(declare-fun m!320241 () Bool)

(assert (=> b!310346 m!320241))

(declare-fun m!320243 () Bool)

(assert (=> b!310342 m!320243))

(declare-fun m!320245 () Bool)

(assert (=> b!310345 m!320245))

(declare-fun m!320247 () Bool)

(assert (=> b!310339 m!320247))

(declare-fun m!320249 () Bool)

(assert (=> b!310339 m!320249))

(declare-fun m!320251 () Bool)

(assert (=> b!310340 m!320251))

(declare-fun m!320253 () Bool)

(assert (=> b!310340 m!320253))

(declare-fun m!320255 () Bool)

(assert (=> b!310340 m!320255))

(declare-fun m!320257 () Bool)

(assert (=> b!310338 m!320257))

(assert (=> b!310338 m!320257))

(declare-fun m!320259 () Bool)

(assert (=> b!310338 m!320259))

(declare-fun m!320261 () Bool)

(assert (=> b!310343 m!320261))

(declare-fun m!320263 () Bool)

(assert (=> b!310343 m!320263))

(declare-fun m!320265 () Bool)

(assert (=> b!310344 m!320265))

(declare-fun m!320267 () Bool)

(assert (=> b!310337 m!320267))

(push 1)

