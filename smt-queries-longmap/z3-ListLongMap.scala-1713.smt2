; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31554 () Bool)

(assert start!31554)

(declare-fun res!170800 () Bool)

(declare-fun e!196297 () Bool)

(assert (=> start!31554 (=> (not res!170800) (not e!196297))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31554 (= res!170800 (validMask!0 mask!3709))))

(assert (=> start!31554 e!196297))

(declare-datatypes ((array!16082 0))(
  ( (array!16083 (arr!7611 (Array (_ BitVec 32) (_ BitVec 64))) (size!7964 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16082)

(declare-fun array_inv!5583 (array!16082) Bool)

(assert (=> start!31554 (array_inv!5583 a!3293)))

(assert (=> start!31554 true))

(declare-fun b!315371 () Bool)

(assert (=> b!315371 false))

(declare-datatypes ((SeekEntryResult!2750 0))(
  ( (MissingZero!2750 (index!13176 (_ BitVec 32))) (Found!2750 (index!13177 (_ BitVec 32))) (Intermediate!2750 (undefined!3562 Bool) (index!13178 (_ BitVec 32)) (x!31439 (_ BitVec 32))) (Undefined!2750) (MissingVacant!2750 (index!13179 (_ BitVec 32))) )
))
(declare-fun lt!154114 () SeekEntryResult!2750)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16082 (_ BitVec 32)) SeekEntryResult!2750)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315371 (= lt!154114 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9671 0))(
  ( (Unit!9672) )
))
(declare-fun e!196299 () Unit!9671)

(declare-fun Unit!9673 () Unit!9671)

(assert (=> b!315371 (= e!196299 Unit!9673)))

(declare-fun b!315372 () Bool)

(declare-fun e!196301 () Unit!9671)

(declare-fun Unit!9674 () Unit!9671)

(assert (=> b!315372 (= e!196301 Unit!9674)))

(declare-fun b!315373 () Bool)

(declare-fun res!170803 () Bool)

(assert (=> b!315373 (=> (not res!170803) (not e!196297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315373 (= res!170803 (validKeyInArray!0 k0!2441))))

(declare-fun b!315374 () Bool)

(declare-fun res!170806 () Bool)

(assert (=> b!315374 (=> (not res!170806) (not e!196297))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315374 (= res!170806 (and (= (size!7964 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7964 a!3293))))))

(declare-fun b!315375 () Bool)

(declare-fun res!170807 () Bool)

(assert (=> b!315375 (=> (not res!170807) (not e!196297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16082 (_ BitVec 32)) Bool)

(assert (=> b!315375 (= res!170807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315376 () Bool)

(declare-fun res!170808 () Bool)

(assert (=> b!315376 (=> (not res!170808) (not e!196297))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16082 (_ BitVec 32)) SeekEntryResult!2750)

(assert (=> b!315376 (= res!170808 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2750 i!1240)))))

(declare-fun b!315377 () Bool)

(assert (=> b!315377 (= e!196301 e!196299)))

(declare-fun c!49904 () Bool)

(assert (=> b!315377 (= c!49904 (or (= (select (arr!7611 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7611 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315378 () Bool)

(assert (=> b!315378 false))

(declare-fun Unit!9675 () Unit!9671)

(assert (=> b!315378 (= e!196299 Unit!9675)))

(declare-fun b!315379 () Bool)

(declare-fun res!170799 () Bool)

(assert (=> b!315379 (=> (not res!170799) (not e!196297))))

(declare-fun arrayContainsKey!0 (array!16082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315379 (= res!170799 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315380 () Bool)

(declare-fun res!170805 () Bool)

(declare-fun e!196300 () Bool)

(assert (=> b!315380 (=> (not res!170805) (not e!196300))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315380 (= res!170805 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7611 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315381 () Bool)

(declare-fun res!170802 () Bool)

(assert (=> b!315381 (=> (not res!170802) (not e!196300))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!315381 (= res!170802 (and (= (select (arr!7611 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7964 a!3293))))))

(declare-fun b!315382 () Bool)

(assert (=> b!315382 (= e!196297 e!196300)))

(declare-fun res!170804 () Bool)

(assert (=> b!315382 (=> (not res!170804) (not e!196300))))

(declare-fun lt!154113 () SeekEntryResult!2750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315382 (= res!170804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154113))))

(assert (=> b!315382 (= lt!154113 (Intermediate!2750 false resIndex!52 resX!52))))

(declare-fun b!315383 () Bool)

(declare-fun res!170801 () Bool)

(assert (=> b!315383 (=> (not res!170801) (not e!196300))))

(assert (=> b!315383 (= res!170801 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154113))))

(declare-fun b!315384 () Bool)

(assert (=> b!315384 (= e!196300 (not (= index!1781 resIndex!52)))))

(declare-fun lt!154115 () Unit!9671)

(assert (=> b!315384 (= lt!154115 e!196301)))

(declare-fun c!49903 () Bool)

(assert (=> b!315384 (= c!49903 (not (= resIndex!52 index!1781)))))

(assert (= (and start!31554 res!170800) b!315374))

(assert (= (and b!315374 res!170806) b!315373))

(assert (= (and b!315373 res!170803) b!315379))

(assert (= (and b!315379 res!170799) b!315376))

(assert (= (and b!315376 res!170808) b!315375))

(assert (= (and b!315375 res!170807) b!315382))

(assert (= (and b!315382 res!170804) b!315381))

(assert (= (and b!315381 res!170802) b!315383))

(assert (= (and b!315383 res!170801) b!315380))

(assert (= (and b!315380 res!170805) b!315384))

(assert (= (and b!315384 c!49903) b!315377))

(assert (= (and b!315384 (not c!49903)) b!315372))

(assert (= (and b!315377 c!49904) b!315378))

(assert (= (and b!315377 (not c!49904)) b!315371))

(declare-fun m!324103 () Bool)

(assert (=> b!315381 m!324103))

(declare-fun m!324105 () Bool)

(assert (=> b!315377 m!324105))

(declare-fun m!324107 () Bool)

(assert (=> b!315371 m!324107))

(assert (=> b!315371 m!324107))

(declare-fun m!324109 () Bool)

(assert (=> b!315371 m!324109))

(declare-fun m!324111 () Bool)

(assert (=> b!315383 m!324111))

(assert (=> b!315380 m!324105))

(declare-fun m!324113 () Bool)

(assert (=> start!31554 m!324113))

(declare-fun m!324115 () Bool)

(assert (=> start!31554 m!324115))

(declare-fun m!324117 () Bool)

(assert (=> b!315373 m!324117))

(declare-fun m!324119 () Bool)

(assert (=> b!315376 m!324119))

(declare-fun m!324121 () Bool)

(assert (=> b!315382 m!324121))

(assert (=> b!315382 m!324121))

(declare-fun m!324123 () Bool)

(assert (=> b!315382 m!324123))

(declare-fun m!324125 () Bool)

(assert (=> b!315379 m!324125))

(declare-fun m!324127 () Bool)

(assert (=> b!315375 m!324127))

(check-sat (not b!315375) (not b!315376) (not start!31554) (not b!315383) (not b!315371) (not b!315373) (not b!315382) (not b!315379))
(check-sat)
