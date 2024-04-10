; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30806 () Bool)

(assert start!30806)

(declare-fun res!165873 () Bool)

(declare-fun e!193234 () Bool)

(assert (=> start!30806 (=> (not res!165873) (not e!193234))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30806 (= res!165873 (validMask!0 mask!3709))))

(assert (=> start!30806 e!193234))

(declare-datatypes ((array!15759 0))(
  ( (array!15760 (arr!7463 (Array (_ BitVec 32) (_ BitVec 64))) (size!7815 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15759)

(declare-fun array_inv!5426 (array!15759) Bool)

(assert (=> start!30806 (array_inv!5426 a!3293)))

(assert (=> start!30806 true))

(declare-fun e!193232 () Bool)

(declare-fun b!309255 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309255 (= e!193232 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-datatypes ((SeekEntryResult!2603 0))(
  ( (MissingZero!2603 (index!12588 (_ BitVec 32))) (Found!2603 (index!12589 (_ BitVec 32))) (Intermediate!2603 (undefined!3415 Bool) (index!12590 (_ BitVec 32)) (x!30823 (_ BitVec 32))) (Undefined!2603) (MissingVacant!2603 (index!12591 (_ BitVec 32))) )
))
(declare-fun lt!151548 () SeekEntryResult!2603)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15759 (_ BitVec 32)) SeekEntryResult!2603)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309255 (= lt!151548 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309256 () Bool)

(declare-fun res!165870 () Bool)

(assert (=> b!309256 (=> (not res!165870) (not e!193234))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309256 (= res!165870 (and (= (size!7815 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7815 a!3293))))))

(declare-fun b!309257 () Bool)

(declare-fun res!165876 () Bool)

(assert (=> b!309257 (=> (not res!165876) (not e!193234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15759 (_ BitVec 32)) Bool)

(assert (=> b!309257 (= res!165876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309258 () Bool)

(declare-fun res!165871 () Bool)

(assert (=> b!309258 (=> (not res!165871) (not e!193234))))

(declare-fun arrayContainsKey!0 (array!15759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309258 (= res!165871 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309259 () Bool)

(declare-fun res!165872 () Bool)

(declare-fun e!193231 () Bool)

(assert (=> b!309259 (=> (not res!165872) (not e!193231))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309259 (= res!165872 (and (= (select (arr!7463 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7815 a!3293))))))

(declare-fun b!309260 () Bool)

(declare-fun res!165868 () Bool)

(assert (=> b!309260 (=> (not res!165868) (not e!193234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309260 (= res!165868 (validKeyInArray!0 k!2441))))

(declare-fun b!309261 () Bool)

(assert (=> b!309261 (= e!193234 e!193231)))

(declare-fun res!165869 () Bool)

(assert (=> b!309261 (=> (not res!165869) (not e!193231))))

(declare-fun lt!151547 () SeekEntryResult!2603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309261 (= res!165869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151547))))

(assert (=> b!309261 (= lt!151547 (Intermediate!2603 false resIndex!52 resX!52))))

(declare-fun b!309262 () Bool)

(declare-fun res!165874 () Bool)

(assert (=> b!309262 (=> (not res!165874) (not e!193234))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15759 (_ BitVec 32)) SeekEntryResult!2603)

(assert (=> b!309262 (= res!165874 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2603 i!1240)))))

(declare-fun b!309263 () Bool)

(assert (=> b!309263 (= e!193231 e!193232)))

(declare-fun res!165875 () Bool)

(assert (=> b!309263 (=> (not res!165875) (not e!193232))))

(assert (=> b!309263 (= res!165875 (and (= lt!151548 lt!151547) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7463 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309263 (= lt!151548 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30806 res!165873) b!309256))

(assert (= (and b!309256 res!165870) b!309260))

(assert (= (and b!309260 res!165868) b!309258))

(assert (= (and b!309258 res!165871) b!309262))

(assert (= (and b!309262 res!165874) b!309257))

(assert (= (and b!309257 res!165876) b!309261))

(assert (= (and b!309261 res!165869) b!309259))

(assert (= (and b!309259 res!165872) b!309263))

(assert (= (and b!309263 res!165875) b!309255))

(declare-fun m!319265 () Bool)

(assert (=> b!309255 m!319265))

(assert (=> b!309255 m!319265))

(declare-fun m!319267 () Bool)

(assert (=> b!309255 m!319267))

(declare-fun m!319269 () Bool)

(assert (=> b!309258 m!319269))

(declare-fun m!319271 () Bool)

(assert (=> b!309257 m!319271))

(declare-fun m!319273 () Bool)

(assert (=> b!309259 m!319273))

(declare-fun m!319275 () Bool)

(assert (=> b!309263 m!319275))

(declare-fun m!319277 () Bool)

(assert (=> b!309263 m!319277))

(declare-fun m!319279 () Bool)

(assert (=> b!309262 m!319279))

(declare-fun m!319281 () Bool)

(assert (=> start!30806 m!319281))

(declare-fun m!319283 () Bool)

(assert (=> start!30806 m!319283))

(declare-fun m!319285 () Bool)

(assert (=> b!309261 m!319285))

(assert (=> b!309261 m!319285))

(declare-fun m!319287 () Bool)

(assert (=> b!309261 m!319287))

(declare-fun m!319289 () Bool)

(assert (=> b!309260 m!319289))

(push 1)

