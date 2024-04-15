; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31806 () Bool)

(assert start!31806)

(declare-fun b!317667 () Bool)

(declare-fun res!172393 () Bool)

(declare-fun e!197441 () Bool)

(assert (=> b!317667 (=> (not res!172393) (not e!197441))))

(declare-datatypes ((array!16181 0))(
  ( (array!16182 (arr!7656 (Array (_ BitVec 32) (_ BitVec 64))) (size!8009 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16181)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317667 (= res!172393 (and (= (select (arr!7656 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8009 a!3293))))))

(declare-fun b!317668 () Bool)

(declare-fun res!172395 () Bool)

(declare-fun e!197442 () Bool)

(assert (=> b!317668 (=> (not res!172395) (not e!197442))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317668 (= res!172395 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317669 () Bool)

(declare-fun e!197443 () Bool)

(assert (=> b!317669 (= e!197443 (not true))))

(declare-fun e!197444 () Bool)

(assert (=> b!317669 e!197444))

(declare-fun res!172392 () Bool)

(assert (=> b!317669 (=> (not res!172392) (not e!197444))))

(declare-fun lt!154919 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2795 0))(
  ( (MissingZero!2795 (index!13356 (_ BitVec 32))) (Found!2795 (index!13357 (_ BitVec 32))) (Intermediate!2795 (undefined!3607 Bool) (index!13358 (_ BitVec 32)) (x!31631 (_ BitVec 32))) (Undefined!2795) (MissingVacant!2795 (index!13359 (_ BitVec 32))) )
))
(declare-fun lt!154916 () SeekEntryResult!2795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16181 (_ BitVec 32)) SeekEntryResult!2795)

(assert (=> b!317669 (= res!172392 (= lt!154916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154919 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317669 (= lt!154919 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172400 () Bool)

(assert (=> start!31806 (=> (not res!172400) (not e!197442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31806 (= res!172400 (validMask!0 mask!3709))))

(assert (=> start!31806 e!197442))

(declare-fun array_inv!5628 (array!16181) Bool)

(assert (=> start!31806 (array_inv!5628 a!3293)))

(assert (=> start!31806 true))

(declare-fun b!317670 () Bool)

(declare-fun res!172394 () Bool)

(assert (=> b!317670 (=> (not res!172394) (not e!197442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16181 (_ BitVec 32)) Bool)

(assert (=> b!317670 (= res!172394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317671 () Bool)

(declare-fun lt!154917 () array!16181)

(assert (=> b!317671 (= e!197444 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154917 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154919 k0!2441 lt!154917 mask!3709)))))

(assert (=> b!317671 (= lt!154917 (array!16182 (store (arr!7656 a!3293) i!1240 k0!2441) (size!8009 a!3293)))))

(declare-fun b!317672 () Bool)

(declare-fun res!172396 () Bool)

(assert (=> b!317672 (=> (not res!172396) (not e!197442))))

(assert (=> b!317672 (= res!172396 (and (= (size!8009 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8009 a!3293))))))

(declare-fun b!317673 () Bool)

(assert (=> b!317673 (= e!197441 e!197443)))

(declare-fun res!172397 () Bool)

(assert (=> b!317673 (=> (not res!172397) (not e!197443))))

(declare-fun lt!154918 () SeekEntryResult!2795)

(assert (=> b!317673 (= res!172397 (and (= lt!154916 lt!154918) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7656 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317673 (= lt!154916 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317674 () Bool)

(assert (=> b!317674 (= e!197442 e!197441)))

(declare-fun res!172399 () Bool)

(assert (=> b!317674 (=> (not res!172399) (not e!197441))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317674 (= res!172399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154918))))

(assert (=> b!317674 (= lt!154918 (Intermediate!2795 false resIndex!52 resX!52))))

(declare-fun b!317675 () Bool)

(declare-fun res!172398 () Bool)

(assert (=> b!317675 (=> (not res!172398) (not e!197442))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16181 (_ BitVec 32)) SeekEntryResult!2795)

(assert (=> b!317675 (= res!172398 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2795 i!1240)))))

(declare-fun b!317676 () Bool)

(declare-fun res!172401 () Bool)

(assert (=> b!317676 (=> (not res!172401) (not e!197442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317676 (= res!172401 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31806 res!172400) b!317672))

(assert (= (and b!317672 res!172396) b!317676))

(assert (= (and b!317676 res!172401) b!317668))

(assert (= (and b!317668 res!172395) b!317675))

(assert (= (and b!317675 res!172398) b!317670))

(assert (= (and b!317670 res!172394) b!317674))

(assert (= (and b!317674 res!172399) b!317667))

(assert (= (and b!317667 res!172393) b!317673))

(assert (= (and b!317673 res!172397) b!317669))

(assert (= (and b!317669 res!172392) b!317671))

(declare-fun m!325879 () Bool)

(assert (=> b!317670 m!325879))

(declare-fun m!325881 () Bool)

(assert (=> b!317668 m!325881))

(declare-fun m!325883 () Bool)

(assert (=> b!317674 m!325883))

(assert (=> b!317674 m!325883))

(declare-fun m!325885 () Bool)

(assert (=> b!317674 m!325885))

(declare-fun m!325887 () Bool)

(assert (=> b!317669 m!325887))

(declare-fun m!325889 () Bool)

(assert (=> b!317669 m!325889))

(declare-fun m!325891 () Bool)

(assert (=> b!317667 m!325891))

(declare-fun m!325893 () Bool)

(assert (=> b!317671 m!325893))

(declare-fun m!325895 () Bool)

(assert (=> b!317671 m!325895))

(declare-fun m!325897 () Bool)

(assert (=> b!317671 m!325897))

(declare-fun m!325899 () Bool)

(assert (=> b!317675 m!325899))

(declare-fun m!325901 () Bool)

(assert (=> b!317676 m!325901))

(declare-fun m!325903 () Bool)

(assert (=> b!317673 m!325903))

(declare-fun m!325905 () Bool)

(assert (=> b!317673 m!325905))

(declare-fun m!325907 () Bool)

(assert (=> start!31806 m!325907))

(declare-fun m!325909 () Bool)

(assert (=> start!31806 m!325909))

(check-sat (not b!317675) (not b!317670) (not b!317671) (not start!31806) (not b!317668) (not b!317676) (not b!317669) (not b!317673) (not b!317674))
(check-sat)
