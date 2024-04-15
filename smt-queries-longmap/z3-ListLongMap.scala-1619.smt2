; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30426 () Bool)

(assert start!30426)

(declare-fun b!304480 () Bool)

(declare-fun e!191301 () Bool)

(declare-fun e!191302 () Bool)

(assert (=> b!304480 (= e!191301 e!191302)))

(declare-fun res!161974 () Bool)

(assert (=> b!304480 (=> (not res!161974) (not e!191302))))

(declare-datatypes ((array!15485 0))(
  ( (array!15486 (arr!7329 (Array (_ BitVec 32) (_ BitVec 64))) (size!7682 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15485)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2468 0))(
  ( (MissingZero!2468 (index!12048 (_ BitVec 32))) (Found!2468 (index!12049 (_ BitVec 32))) (Intermediate!2468 (undefined!3280 Bool) (index!12050 (_ BitVec 32)) (x!30321 (_ BitVec 32))) (Undefined!2468) (MissingVacant!2468 (index!12051 (_ BitVec 32))) )
))
(declare-fun lt!150287 () SeekEntryResult!2468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15485 (_ BitVec 32)) SeekEntryResult!2468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304480 (= res!161974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150287))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304480 (= lt!150287 (Intermediate!2468 false resIndex!52 resX!52))))

(declare-fun b!304481 () Bool)

(declare-fun res!161972 () Bool)

(assert (=> b!304481 (=> (not res!161972) (not e!191301))))

(declare-fun arrayContainsKey!0 (array!15485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304481 (= res!161972 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304482 () Bool)

(declare-fun e!191300 () Bool)

(assert (=> b!304482 (= e!191302 e!191300)))

(declare-fun res!161971 () Bool)

(assert (=> b!304482 (=> (not res!161971) (not e!191300))))

(declare-fun lt!150286 () SeekEntryResult!2468)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304482 (= res!161971 (and (= lt!150286 lt!150287) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7329 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7329 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7329 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304482 (= lt!150286 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304483 () Bool)

(assert (=> b!304483 (= e!191300 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304483 (= lt!150286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304484 () Bool)

(declare-fun res!161979 () Bool)

(assert (=> b!304484 (=> (not res!161979) (not e!191301))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15485 (_ BitVec 32)) SeekEntryResult!2468)

(assert (=> b!304484 (= res!161979 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2468 i!1240)))))

(declare-fun b!304485 () Bool)

(declare-fun res!161976 () Bool)

(assert (=> b!304485 (=> (not res!161976) (not e!191301))))

(assert (=> b!304485 (= res!161976 (and (= (size!7682 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7682 a!3293))))))

(declare-fun b!304486 () Bool)

(declare-fun res!161975 () Bool)

(assert (=> b!304486 (=> (not res!161975) (not e!191301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304486 (= res!161975 (validKeyInArray!0 k0!2441))))

(declare-fun res!161977 () Bool)

(assert (=> start!30426 (=> (not res!161977) (not e!191301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30426 (= res!161977 (validMask!0 mask!3709))))

(assert (=> start!30426 e!191301))

(declare-fun array_inv!5301 (array!15485) Bool)

(assert (=> start!30426 (array_inv!5301 a!3293)))

(assert (=> start!30426 true))

(declare-fun b!304487 () Bool)

(declare-fun res!161973 () Bool)

(assert (=> b!304487 (=> (not res!161973) (not e!191301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15485 (_ BitVec 32)) Bool)

(assert (=> b!304487 (= res!161973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304488 () Bool)

(declare-fun res!161978 () Bool)

(assert (=> b!304488 (=> (not res!161978) (not e!191302))))

(assert (=> b!304488 (= res!161978 (and (= (select (arr!7329 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7682 a!3293))))))

(assert (= (and start!30426 res!161977) b!304485))

(assert (= (and b!304485 res!161976) b!304486))

(assert (= (and b!304486 res!161975) b!304481))

(assert (= (and b!304481 res!161972) b!304484))

(assert (= (and b!304484 res!161979) b!304487))

(assert (= (and b!304487 res!161973) b!304480))

(assert (= (and b!304480 res!161974) b!304488))

(assert (= (and b!304488 res!161978) b!304482))

(assert (= (and b!304482 res!161971) b!304483))

(declare-fun m!315109 () Bool)

(assert (=> b!304483 m!315109))

(assert (=> b!304483 m!315109))

(declare-fun m!315111 () Bool)

(assert (=> b!304483 m!315111))

(declare-fun m!315113 () Bool)

(assert (=> start!30426 m!315113))

(declare-fun m!315115 () Bool)

(assert (=> start!30426 m!315115))

(declare-fun m!315117 () Bool)

(assert (=> b!304481 m!315117))

(declare-fun m!315119 () Bool)

(assert (=> b!304487 m!315119))

(declare-fun m!315121 () Bool)

(assert (=> b!304484 m!315121))

(declare-fun m!315123 () Bool)

(assert (=> b!304482 m!315123))

(declare-fun m!315125 () Bool)

(assert (=> b!304482 m!315125))

(declare-fun m!315127 () Bool)

(assert (=> b!304486 m!315127))

(declare-fun m!315129 () Bool)

(assert (=> b!304488 m!315129))

(declare-fun m!315131 () Bool)

(assert (=> b!304480 m!315131))

(assert (=> b!304480 m!315131))

(declare-fun m!315133 () Bool)

(assert (=> b!304480 m!315133))

(check-sat (not b!304483) (not b!304481) (not b!304484) (not b!304480) (not b!304487) (not b!304482) (not start!30426) (not b!304486))
(check-sat)
