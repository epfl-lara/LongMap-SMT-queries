; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30972 () Bool)

(assert start!30972)

(declare-fun b!311052 () Bool)

(declare-fun res!167652 () Bool)

(declare-fun e!194087 () Bool)

(assert (=> b!311052 (=> (not res!167652) (not e!194087))))

(declare-datatypes ((array!15878 0))(
  ( (array!15879 (arr!7521 (Array (_ BitVec 32) (_ BitVec 64))) (size!7874 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15878)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311052 (= res!167652 (and (= (size!7874 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7874 a!3293))))))

(declare-fun b!311053 () Bool)

(declare-fun res!167658 () Bool)

(declare-fun e!194090 () Bool)

(assert (=> b!311053 (=> (not res!167658) (not e!194090))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!311053 (= res!167658 (and (= (select (arr!7521 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7874 a!3293))))))

(declare-fun b!311054 () Bool)

(declare-fun e!194088 () Bool)

(assert (=> b!311054 (= e!194088 (not true))))

(declare-fun e!194086 () Bool)

(assert (=> b!311054 e!194086))

(declare-fun res!167657 () Bool)

(assert (=> b!311054 (=> (not res!167657) (not e!194086))))

(declare-datatypes ((SeekEntryResult!2660 0))(
  ( (MissingZero!2660 (index!12816 (_ BitVec 32))) (Found!2660 (index!12817 (_ BitVec 32))) (Intermediate!2660 (undefined!3472 Bool) (index!12818 (_ BitVec 32)) (x!31052 (_ BitVec 32))) (Undefined!2660) (MissingVacant!2660 (index!12819 (_ BitVec 32))) )
))
(declare-fun lt!152075 () SeekEntryResult!2660)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!152076 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15878 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!311054 (= res!167657 (= lt!152075 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152076 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311054 (= lt!152076 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311055 () Bool)

(assert (=> b!311055 (= e!194087 e!194090)))

(declare-fun res!167659 () Bool)

(assert (=> b!311055 (=> (not res!167659) (not e!194090))))

(declare-fun lt!152078 () SeekEntryResult!2660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311055 (= res!167659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152078))))

(assert (=> b!311055 (= lt!152078 (Intermediate!2660 false resIndex!52 resX!52))))

(declare-fun b!311056 () Bool)

(declare-fun lt!152077 () array!15878)

(assert (=> b!311056 (= e!194086 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152077 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152076 k0!2441 lt!152077 mask!3709)))))

(assert (=> b!311056 (= lt!152077 (array!15879 (store (arr!7521 a!3293) i!1240 k0!2441) (size!7874 a!3293)))))

(declare-fun b!311057 () Bool)

(assert (=> b!311057 (= e!194090 e!194088)))

(declare-fun res!167653 () Bool)

(assert (=> b!311057 (=> (not res!167653) (not e!194088))))

(assert (=> b!311057 (= res!167653 (and (= lt!152075 lt!152078) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7521 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311057 (= lt!152075 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311058 () Bool)

(declare-fun res!167655 () Bool)

(assert (=> b!311058 (=> (not res!167655) (not e!194087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15878 (_ BitVec 32)) Bool)

(assert (=> b!311058 (= res!167655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311059 () Bool)

(declare-fun res!167654 () Bool)

(assert (=> b!311059 (=> (not res!167654) (not e!194087))))

(declare-fun arrayContainsKey!0 (array!15878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311059 (= res!167654 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311060 () Bool)

(declare-fun res!167660 () Bool)

(assert (=> b!311060 (=> (not res!167660) (not e!194087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311060 (= res!167660 (validKeyInArray!0 k0!2441))))

(declare-fun b!311061 () Bool)

(declare-fun res!167661 () Bool)

(assert (=> b!311061 (=> (not res!167661) (not e!194087))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15878 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!311061 (= res!167661 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2660 i!1240)))))

(declare-fun res!167656 () Bool)

(assert (=> start!30972 (=> (not res!167656) (not e!194087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30972 (= res!167656 (validMask!0 mask!3709))))

(assert (=> start!30972 e!194087))

(declare-fun array_inv!5493 (array!15878) Bool)

(assert (=> start!30972 (array_inv!5493 a!3293)))

(assert (=> start!30972 true))

(assert (= (and start!30972 res!167656) b!311052))

(assert (= (and b!311052 res!167652) b!311060))

(assert (= (and b!311060 res!167660) b!311059))

(assert (= (and b!311059 res!167654) b!311061))

(assert (= (and b!311061 res!167661) b!311058))

(assert (= (and b!311058 res!167655) b!311055))

(assert (= (and b!311055 res!167659) b!311053))

(assert (= (and b!311053 res!167658) b!311057))

(assert (= (and b!311057 res!167653) b!311054))

(assert (= (and b!311054 res!167657) b!311056))

(declare-fun m!320563 () Bool)

(assert (=> b!311059 m!320563))

(declare-fun m!320565 () Bool)

(assert (=> b!311053 m!320565))

(declare-fun m!320567 () Bool)

(assert (=> b!311061 m!320567))

(declare-fun m!320569 () Bool)

(assert (=> b!311058 m!320569))

(declare-fun m!320571 () Bool)

(assert (=> b!311060 m!320571))

(declare-fun m!320573 () Bool)

(assert (=> b!311055 m!320573))

(assert (=> b!311055 m!320573))

(declare-fun m!320575 () Bool)

(assert (=> b!311055 m!320575))

(declare-fun m!320577 () Bool)

(assert (=> b!311056 m!320577))

(declare-fun m!320579 () Bool)

(assert (=> b!311056 m!320579))

(declare-fun m!320581 () Bool)

(assert (=> b!311056 m!320581))

(declare-fun m!320583 () Bool)

(assert (=> start!30972 m!320583))

(declare-fun m!320585 () Bool)

(assert (=> start!30972 m!320585))

(declare-fun m!320587 () Bool)

(assert (=> b!311057 m!320587))

(declare-fun m!320589 () Bool)

(assert (=> b!311057 m!320589))

(declare-fun m!320591 () Bool)

(assert (=> b!311054 m!320591))

(declare-fun m!320593 () Bool)

(assert (=> b!311054 m!320593))

(check-sat (not start!30972) (not b!311061) (not b!311057) (not b!311056) (not b!311058) (not b!311055) (not b!311059) (not b!311054) (not b!311060))
(check-sat)
