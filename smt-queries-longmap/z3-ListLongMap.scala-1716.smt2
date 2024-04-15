; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31572 () Bool)

(assert start!31572)

(declare-fun b!315749 () Bool)

(declare-datatypes ((Unit!9716 0))(
  ( (Unit!9717) )
))
(declare-fun e!196435 () Unit!9716)

(declare-fun e!196436 () Unit!9716)

(assert (=> b!315749 (= e!196435 e!196436)))

(declare-fun c!49958 () Bool)

(declare-datatypes ((array!16100 0))(
  ( (array!16101 (arr!7620 (Array (_ BitVec 32) (_ BitVec 64))) (size!7973 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16100)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315749 (= c!49958 (or (= (select (arr!7620 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7620 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!171078 () Bool)

(declare-fun e!196432 () Bool)

(assert (=> start!31572 (=> (not res!171078) (not e!196432))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31572 (= res!171078 (validMask!0 mask!3709))))

(assert (=> start!31572 e!196432))

(declare-fun array_inv!5592 (array!16100) Bool)

(assert (=> start!31572 (array_inv!5592 a!3293)))

(assert (=> start!31572 true))

(declare-fun b!315750 () Bool)

(assert (=> b!315750 false))

(declare-fun Unit!9718 () Unit!9716)

(assert (=> b!315750 (= e!196436 Unit!9718)))

(declare-fun b!315751 () Bool)

(declare-fun e!196433 () Bool)

(assert (=> b!315751 (= e!196432 e!196433)))

(declare-fun res!171072 () Bool)

(assert (=> b!315751 (=> (not res!171072) (not e!196433))))

(declare-datatypes ((SeekEntryResult!2759 0))(
  ( (MissingZero!2759 (index!13212 (_ BitVec 32))) (Found!2759 (index!13213 (_ BitVec 32))) (Intermediate!2759 (undefined!3571 Bool) (index!13214 (_ BitVec 32)) (x!31472 (_ BitVec 32))) (Undefined!2759) (MissingVacant!2759 (index!13215 (_ BitVec 32))) )
))
(declare-fun lt!154194 () SeekEntryResult!2759)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16100 (_ BitVec 32)) SeekEntryResult!2759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315751 (= res!171072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154194))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315751 (= lt!154194 (Intermediate!2759 false resIndex!52 resX!52))))

(declare-fun b!315752 () Bool)

(declare-fun res!171073 () Bool)

(assert (=> b!315752 (=> (not res!171073) (not e!196432))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16100 (_ BitVec 32)) SeekEntryResult!2759)

(assert (=> b!315752 (= res!171073 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2759 i!1240)))))

(declare-fun b!315753 () Bool)

(declare-fun res!171069 () Bool)

(assert (=> b!315753 (=> (not res!171069) (not e!196433))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!315753 (= res!171069 (and (= (select (arr!7620 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7973 a!3293))))))

(declare-fun b!315754 () Bool)

(assert (=> b!315754 false))

(declare-fun lt!154196 () SeekEntryResult!2759)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315754 (= lt!154196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9719 () Unit!9716)

(assert (=> b!315754 (= e!196436 Unit!9719)))

(declare-fun b!315755 () Bool)

(assert (=> b!315755 (= e!196433 (not true))))

(assert (=> b!315755 (= index!1781 resIndex!52)))

(declare-fun lt!154195 () Unit!9716)

(assert (=> b!315755 (= lt!154195 e!196435)))

(declare-fun c!49957 () Bool)

(assert (=> b!315755 (= c!49957 (not (= resIndex!52 index!1781)))))

(declare-fun b!315756 () Bool)

(declare-fun res!171076 () Bool)

(assert (=> b!315756 (=> (not res!171076) (not e!196433))))

(assert (=> b!315756 (= res!171076 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7620 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315757 () Bool)

(declare-fun res!171071 () Bool)

(assert (=> b!315757 (=> (not res!171071) (not e!196432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315757 (= res!171071 (validKeyInArray!0 k0!2441))))

(declare-fun b!315758 () Bool)

(declare-fun Unit!9720 () Unit!9716)

(assert (=> b!315758 (= e!196435 Unit!9720)))

(declare-fun b!315759 () Bool)

(declare-fun res!171077 () Bool)

(assert (=> b!315759 (=> (not res!171077) (not e!196432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16100 (_ BitVec 32)) Bool)

(assert (=> b!315759 (= res!171077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315760 () Bool)

(declare-fun res!171070 () Bool)

(assert (=> b!315760 (=> (not res!171070) (not e!196432))))

(declare-fun arrayContainsKey!0 (array!16100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315760 (= res!171070 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315761 () Bool)

(declare-fun res!171075 () Bool)

(assert (=> b!315761 (=> (not res!171075) (not e!196433))))

(assert (=> b!315761 (= res!171075 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154194))))

(declare-fun b!315762 () Bool)

(declare-fun res!171074 () Bool)

(assert (=> b!315762 (=> (not res!171074) (not e!196432))))

(assert (=> b!315762 (= res!171074 (and (= (size!7973 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7973 a!3293))))))

(assert (= (and start!31572 res!171078) b!315762))

(assert (= (and b!315762 res!171074) b!315757))

(assert (= (and b!315757 res!171071) b!315760))

(assert (= (and b!315760 res!171070) b!315752))

(assert (= (and b!315752 res!171073) b!315759))

(assert (= (and b!315759 res!171077) b!315751))

(assert (= (and b!315751 res!171072) b!315753))

(assert (= (and b!315753 res!171069) b!315761))

(assert (= (and b!315761 res!171075) b!315756))

(assert (= (and b!315756 res!171076) b!315755))

(assert (= (and b!315755 c!49957) b!315749))

(assert (= (and b!315755 (not c!49957)) b!315758))

(assert (= (and b!315749 c!49958) b!315750))

(assert (= (and b!315749 (not c!49958)) b!315754))

(declare-fun m!324337 () Bool)

(assert (=> b!315759 m!324337))

(declare-fun m!324339 () Bool)

(assert (=> b!315752 m!324339))

(declare-fun m!324341 () Bool)

(assert (=> start!31572 m!324341))

(declare-fun m!324343 () Bool)

(assert (=> start!31572 m!324343))

(declare-fun m!324345 () Bool)

(assert (=> b!315754 m!324345))

(assert (=> b!315754 m!324345))

(declare-fun m!324347 () Bool)

(assert (=> b!315754 m!324347))

(declare-fun m!324349 () Bool)

(assert (=> b!315753 m!324349))

(declare-fun m!324351 () Bool)

(assert (=> b!315757 m!324351))

(declare-fun m!324353 () Bool)

(assert (=> b!315751 m!324353))

(assert (=> b!315751 m!324353))

(declare-fun m!324355 () Bool)

(assert (=> b!315751 m!324355))

(declare-fun m!324357 () Bool)

(assert (=> b!315756 m!324357))

(assert (=> b!315749 m!324357))

(declare-fun m!324359 () Bool)

(assert (=> b!315761 m!324359))

(declare-fun m!324361 () Bool)

(assert (=> b!315760 m!324361))

(check-sat (not b!315759) (not b!315754) (not b!315752) (not start!31572) (not b!315761) (not b!315751) (not b!315757) (not b!315760))
(check-sat)
