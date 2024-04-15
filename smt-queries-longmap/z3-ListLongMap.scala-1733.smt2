; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31836 () Bool)

(assert start!31836)

(declare-fun b!318117 () Bool)

(declare-fun res!172850 () Bool)

(declare-fun e!197667 () Bool)

(assert (=> b!318117 (=> (not res!172850) (not e!197667))))

(declare-datatypes ((array!16211 0))(
  ( (array!16212 (arr!7671 (Array (_ BitVec 32) (_ BitVec 64))) (size!8024 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16211)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2810 0))(
  ( (MissingZero!2810 (index!13416 (_ BitVec 32))) (Found!2810 (index!13417 (_ BitVec 32))) (Intermediate!2810 (undefined!3622 Bool) (index!13418 (_ BitVec 32)) (x!31686 (_ BitVec 32))) (Undefined!2810) (MissingVacant!2810 (index!13419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16211 (_ BitVec 32)) SeekEntryResult!2810)

(assert (=> b!318117 (= res!172850 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2810 i!1240)))))

(declare-fun b!318118 () Bool)

(declare-fun res!172842 () Bool)

(assert (=> b!318118 (=> (not res!172842) (not e!197667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318118 (= res!172842 (validKeyInArray!0 k0!2441))))

(declare-fun b!318119 () Bool)

(declare-fun e!197669 () Bool)

(declare-fun e!197665 () Bool)

(assert (=> b!318119 (= e!197669 e!197665)))

(declare-fun res!172847 () Bool)

(assert (=> b!318119 (=> (not res!172847) (not e!197665))))

(declare-fun lt!155098 () SeekEntryResult!2810)

(declare-fun lt!155096 () SeekEntryResult!2810)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318119 (= res!172847 (and (= lt!155096 lt!155098) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7671 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16211 (_ BitVec 32)) SeekEntryResult!2810)

(assert (=> b!318119 (= lt!155096 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318120 () Bool)

(declare-fun res!172848 () Bool)

(assert (=> b!318120 (=> (not res!172848) (not e!197667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16211 (_ BitVec 32)) Bool)

(assert (=> b!318120 (= res!172848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318121 () Bool)

(declare-fun res!172846 () Bool)

(assert (=> b!318121 (=> (not res!172846) (not e!197669))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318121 (= res!172846 (and (= (select (arr!7671 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8024 a!3293))))))

(declare-fun lt!155099 () array!16211)

(declare-fun b!318122 () Bool)

(declare-fun e!197668 () Bool)

(declare-fun lt!155097 () (_ BitVec 32))

(assert (=> b!318122 (= e!197668 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155099 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155097 k0!2441 lt!155099 mask!3709)))))

(assert (=> b!318122 (= lt!155099 (array!16212 (store (arr!7671 a!3293) i!1240 k0!2441) (size!8024 a!3293)))))

(declare-fun b!318123 () Bool)

(declare-fun res!172843 () Bool)

(assert (=> b!318123 (=> (not res!172843) (not e!197667))))

(declare-fun arrayContainsKey!0 (array!16211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318123 (= res!172843 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318125 () Bool)

(declare-fun res!172844 () Bool)

(assert (=> b!318125 (=> (not res!172844) (not e!197667))))

(assert (=> b!318125 (= res!172844 (and (= (size!8024 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8024 a!3293))))))

(declare-fun b!318126 () Bool)

(assert (=> b!318126 (= e!197665 (not (bvsle (bvadd #b00000000000000000000000000000001 x!1427) resX!52)))))

(assert (=> b!318126 e!197668))

(declare-fun res!172849 () Bool)

(assert (=> b!318126 (=> (not res!172849) (not e!197668))))

(assert (=> b!318126 (= res!172849 (= lt!155096 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155097 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318126 (= lt!155097 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172851 () Bool)

(assert (=> start!31836 (=> (not res!172851) (not e!197667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31836 (= res!172851 (validMask!0 mask!3709))))

(assert (=> start!31836 e!197667))

(declare-fun array_inv!5643 (array!16211) Bool)

(assert (=> start!31836 (array_inv!5643 a!3293)))

(assert (=> start!31836 true))

(declare-fun b!318124 () Bool)

(assert (=> b!318124 (= e!197667 e!197669)))

(declare-fun res!172845 () Bool)

(assert (=> b!318124 (=> (not res!172845) (not e!197669))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318124 (= res!172845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155098))))

(assert (=> b!318124 (= lt!155098 (Intermediate!2810 false resIndex!52 resX!52))))

(assert (= (and start!31836 res!172851) b!318125))

(assert (= (and b!318125 res!172844) b!318118))

(assert (= (and b!318118 res!172842) b!318123))

(assert (= (and b!318123 res!172843) b!318117))

(assert (= (and b!318117 res!172850) b!318120))

(assert (= (and b!318120 res!172848) b!318124))

(assert (= (and b!318124 res!172845) b!318121))

(assert (= (and b!318121 res!172846) b!318119))

(assert (= (and b!318119 res!172847) b!318126))

(assert (= (and b!318126 res!172849) b!318122))

(declare-fun m!326359 () Bool)

(assert (=> b!318123 m!326359))

(declare-fun m!326361 () Bool)

(assert (=> b!318121 m!326361))

(declare-fun m!326363 () Bool)

(assert (=> b!318117 m!326363))

(declare-fun m!326365 () Bool)

(assert (=> b!318119 m!326365))

(declare-fun m!326367 () Bool)

(assert (=> b!318119 m!326367))

(declare-fun m!326369 () Bool)

(assert (=> b!318122 m!326369))

(declare-fun m!326371 () Bool)

(assert (=> b!318122 m!326371))

(declare-fun m!326373 () Bool)

(assert (=> b!318122 m!326373))

(declare-fun m!326375 () Bool)

(assert (=> b!318126 m!326375))

(declare-fun m!326377 () Bool)

(assert (=> b!318126 m!326377))

(declare-fun m!326379 () Bool)

(assert (=> b!318124 m!326379))

(assert (=> b!318124 m!326379))

(declare-fun m!326381 () Bool)

(assert (=> b!318124 m!326381))

(declare-fun m!326383 () Bool)

(assert (=> b!318118 m!326383))

(declare-fun m!326385 () Bool)

(assert (=> b!318120 m!326385))

(declare-fun m!326387 () Bool)

(assert (=> start!31836 m!326387))

(declare-fun m!326389 () Bool)

(assert (=> start!31836 m!326389))

(check-sat (not b!318124) (not b!318123) (not b!318122) (not b!318118) (not b!318120) (not start!31836) (not b!318117) (not b!318119) (not b!318126))
(check-sat)
