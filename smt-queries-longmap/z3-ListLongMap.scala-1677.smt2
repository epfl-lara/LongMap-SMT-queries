; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30952 () Bool)

(assert start!30952)

(declare-fun b!310817 () Bool)

(declare-fun res!167271 () Bool)

(declare-fun e!194008 () Bool)

(assert (=> b!310817 (=> (not res!167271) (not e!194008))))

(declare-datatypes ((array!15854 0))(
  ( (array!15855 (arr!7509 (Array (_ BitVec 32) (_ BitVec 64))) (size!7861 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15854)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2649 0))(
  ( (MissingZero!2649 (index!12772 (_ BitVec 32))) (Found!2649 (index!12773 (_ BitVec 32))) (Intermediate!2649 (undefined!3461 Bool) (index!12774 (_ BitVec 32)) (x!30998 (_ BitVec 32))) (Undefined!2649) (MissingVacant!2649 (index!12775 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15854 (_ BitVec 32)) SeekEntryResult!2649)

(assert (=> b!310817 (= res!167271 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2649 i!1240)))))

(declare-fun lt!152109 () (_ BitVec 32))

(declare-fun e!194010 () Bool)

(declare-fun b!310818 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152108 () array!15854)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15854 (_ BitVec 32)) SeekEntryResult!2649)

(assert (=> b!310818 (= e!194010 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152108 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152109 k0!2441 lt!152108 mask!3709)))))

(assert (=> b!310818 (= lt!152108 (array!15855 (store (arr!7509 a!3293) i!1240 k0!2441) (size!7861 a!3293)))))

(declare-fun b!310819 () Bool)

(declare-fun e!194007 () Bool)

(declare-fun e!194009 () Bool)

(assert (=> b!310819 (= e!194007 e!194009)))

(declare-fun res!167274 () Bool)

(assert (=> b!310819 (=> (not res!167274) (not e!194009))))

(declare-fun lt!152106 () SeekEntryResult!2649)

(declare-fun lt!152107 () SeekEntryResult!2649)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310819 (= res!167274 (and (= lt!152107 lt!152106) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7509 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310819 (= lt!152107 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310820 () Bool)

(declare-fun res!167275 () Bool)

(assert (=> b!310820 (=> (not res!167275) (not e!194007))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310820 (= res!167275 (and (= (select (arr!7509 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7861 a!3293))))))

(declare-fun b!310821 () Bool)

(assert (=> b!310821 (= e!194009 (not true))))

(assert (=> b!310821 e!194010))

(declare-fun res!167276 () Bool)

(assert (=> b!310821 (=> (not res!167276) (not e!194010))))

(assert (=> b!310821 (= res!167276 (= lt!152107 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152109 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310821 (= lt!152109 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!167272 () Bool)

(assert (=> start!30952 (=> (not res!167272) (not e!194008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30952 (= res!167272 (validMask!0 mask!3709))))

(assert (=> start!30952 e!194008))

(declare-fun array_inv!5472 (array!15854) Bool)

(assert (=> start!30952 (array_inv!5472 a!3293)))

(assert (=> start!30952 true))

(declare-fun b!310822 () Bool)

(assert (=> b!310822 (= e!194008 e!194007)))

(declare-fun res!167279 () Bool)

(assert (=> b!310822 (=> (not res!167279) (not e!194007))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310822 (= res!167279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152106))))

(assert (=> b!310822 (= lt!152106 (Intermediate!2649 false resIndex!52 resX!52))))

(declare-fun b!310823 () Bool)

(declare-fun res!167273 () Bool)

(assert (=> b!310823 (=> (not res!167273) (not e!194008))))

(assert (=> b!310823 (= res!167273 (and (= (size!7861 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7861 a!3293))))))

(declare-fun b!310824 () Bool)

(declare-fun res!167277 () Bool)

(assert (=> b!310824 (=> (not res!167277) (not e!194008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310824 (= res!167277 (validKeyInArray!0 k0!2441))))

(declare-fun b!310825 () Bool)

(declare-fun res!167280 () Bool)

(assert (=> b!310825 (=> (not res!167280) (not e!194008))))

(declare-fun arrayContainsKey!0 (array!15854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310825 (= res!167280 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310826 () Bool)

(declare-fun res!167278 () Bool)

(assert (=> b!310826 (=> (not res!167278) (not e!194008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15854 (_ BitVec 32)) Bool)

(assert (=> b!310826 (= res!167278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30952 res!167272) b!310823))

(assert (= (and b!310823 res!167273) b!310824))

(assert (= (and b!310824 res!167277) b!310825))

(assert (= (and b!310825 res!167280) b!310817))

(assert (= (and b!310817 res!167271) b!310826))

(assert (= (and b!310826 res!167278) b!310822))

(assert (= (and b!310822 res!167279) b!310820))

(assert (= (and b!310820 res!167275) b!310819))

(assert (= (and b!310819 res!167274) b!310821))

(assert (= (and b!310821 res!167276) b!310818))

(declare-fun m!320749 () Bool)

(assert (=> b!310824 m!320749))

(declare-fun m!320751 () Bool)

(assert (=> b!310822 m!320751))

(assert (=> b!310822 m!320751))

(declare-fun m!320753 () Bool)

(assert (=> b!310822 m!320753))

(declare-fun m!320755 () Bool)

(assert (=> b!310826 m!320755))

(declare-fun m!320757 () Bool)

(assert (=> b!310825 m!320757))

(declare-fun m!320759 () Bool)

(assert (=> start!30952 m!320759))

(declare-fun m!320761 () Bool)

(assert (=> start!30952 m!320761))

(declare-fun m!320763 () Bool)

(assert (=> b!310817 m!320763))

(declare-fun m!320765 () Bool)

(assert (=> b!310818 m!320765))

(declare-fun m!320767 () Bool)

(assert (=> b!310818 m!320767))

(declare-fun m!320769 () Bool)

(assert (=> b!310818 m!320769))

(declare-fun m!320771 () Bool)

(assert (=> b!310819 m!320771))

(declare-fun m!320773 () Bool)

(assert (=> b!310819 m!320773))

(declare-fun m!320775 () Bool)

(assert (=> b!310820 m!320775))

(declare-fun m!320777 () Bool)

(assert (=> b!310821 m!320777))

(declare-fun m!320779 () Bool)

(assert (=> b!310821 m!320779))

(check-sat (not b!310817) (not b!310821) (not b!310818) (not start!30952) (not b!310824) (not b!310822) (not b!310826) (not b!310825) (not b!310819))
(check-sat)
