; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30452 () Bool)

(assert start!30452)

(declare-fun b!304918 () Bool)

(declare-fun e!191550 () Bool)

(declare-fun e!191551 () Bool)

(assert (=> b!304918 (= e!191550 e!191551)))

(declare-fun res!162267 () Bool)

(assert (=> b!304918 (=> (not res!162267) (not e!191551))))

(declare-datatypes ((array!15507 0))(
  ( (array!15508 (arr!7340 (Array (_ BitVec 32) (_ BitVec 64))) (size!7692 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15507)

(declare-datatypes ((SeekEntryResult!2480 0))(
  ( (MissingZero!2480 (index!12096 (_ BitVec 32))) (Found!2480 (index!12097 (_ BitVec 32))) (Intermediate!2480 (undefined!3292 Bool) (index!12098 (_ BitVec 32)) (x!30354 (_ BitVec 32))) (Undefined!2480) (MissingVacant!2480 (index!12099 (_ BitVec 32))) )
))
(declare-fun lt!150558 () SeekEntryResult!2480)

(declare-fun lt!150557 () SeekEntryResult!2480)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304918 (= res!162267 (and (= lt!150557 lt!150558) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7340 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7340 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7340 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15507 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!304918 (= lt!150557 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304919 () Bool)

(declare-fun res!162265 () Bool)

(assert (=> b!304919 (=> (not res!162265) (not e!191550))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304919 (= res!162265 (and (= (select (arr!7340 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7692 a!3293))))))

(declare-fun b!304920 () Bool)

(declare-fun res!162263 () Bool)

(declare-fun e!191549 () Bool)

(assert (=> b!304920 (=> (not res!162263) (not e!191549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15507 (_ BitVec 32)) Bool)

(assert (=> b!304920 (= res!162263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304921 () Bool)

(declare-fun res!162270 () Bool)

(assert (=> b!304921 (=> (not res!162270) (not e!191549))))

(declare-fun arrayContainsKey!0 (array!15507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304921 (= res!162270 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304922 () Bool)

(declare-fun res!162264 () Bool)

(assert (=> b!304922 (=> (not res!162264) (not e!191549))))

(assert (=> b!304922 (= res!162264 (and (= (size!7692 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7692 a!3293))))))

(declare-fun b!304923 () Bool)

(declare-fun res!162266 () Bool)

(assert (=> b!304923 (=> (not res!162266) (not e!191549))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15507 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!304923 (= res!162266 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2480 i!1240)))))

(declare-fun res!162269 () Bool)

(assert (=> start!30452 (=> (not res!162269) (not e!191549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30452 (= res!162269 (validMask!0 mask!3709))))

(assert (=> start!30452 e!191549))

(declare-fun array_inv!5303 (array!15507) Bool)

(assert (=> start!30452 (array_inv!5303 a!3293)))

(assert (=> start!30452 true))

(declare-fun b!304917 () Bool)

(declare-fun res!162268 () Bool)

(assert (=> b!304917 (=> (not res!162268) (not e!191549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304917 (= res!162268 (validKeyInArray!0 k!2441))))

(declare-fun b!304924 () Bool)

(assert (=> b!304924 (= e!191549 e!191550)))

(declare-fun res!162262 () Bool)

(assert (=> b!304924 (=> (not res!162262) (not e!191550))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304924 (= res!162262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150558))))

(assert (=> b!304924 (= lt!150558 (Intermediate!2480 false resIndex!52 resX!52))))

(declare-fun b!304925 () Bool)

(assert (=> b!304925 (= e!191551 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304925 (= lt!150557 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30452 res!162269) b!304922))

(assert (= (and b!304922 res!162264) b!304917))

(assert (= (and b!304917 res!162268) b!304921))

(assert (= (and b!304921 res!162270) b!304923))

(assert (= (and b!304923 res!162266) b!304920))

(assert (= (and b!304920 res!162263) b!304924))

(assert (= (and b!304924 res!162262) b!304919))

(assert (= (and b!304919 res!162265) b!304918))

(assert (= (and b!304918 res!162267) b!304925))

(declare-fun m!315995 () Bool)

(assert (=> start!30452 m!315995))

(declare-fun m!315997 () Bool)

(assert (=> start!30452 m!315997))

(declare-fun m!315999 () Bool)

(assert (=> b!304925 m!315999))

(assert (=> b!304925 m!315999))

(declare-fun m!316001 () Bool)

(assert (=> b!304925 m!316001))

(declare-fun m!316003 () Bool)

(assert (=> b!304924 m!316003))

(assert (=> b!304924 m!316003))

(declare-fun m!316005 () Bool)

(assert (=> b!304924 m!316005))

(declare-fun m!316007 () Bool)

(assert (=> b!304919 m!316007))

(declare-fun m!316009 () Bool)

(assert (=> b!304918 m!316009))

(declare-fun m!316011 () Bool)

(assert (=> b!304918 m!316011))

(declare-fun m!316013 () Bool)

(assert (=> b!304917 m!316013))

(declare-fun m!316015 () Bool)

(assert (=> b!304920 m!316015))

(declare-fun m!316017 () Bool)

(assert (=> b!304921 m!316017))

(declare-fun m!316019 () Bool)

(assert (=> b!304923 m!316019))

(push 1)

