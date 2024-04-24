; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31026 () Bool)

(assert start!31026)

(declare-fun b!312084 () Bool)

(declare-fun res!168592 () Bool)

(declare-fun e!194636 () Bool)

(assert (=> b!312084 (=> (not res!168592) (not e!194636))))

(declare-datatypes ((array!15941 0))(
  ( (array!15942 (arr!7552 (Array (_ BitVec 32) (_ BitVec 64))) (size!7904 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15941)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312084 (= res!168592 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168588 () Bool)

(assert (=> start!31026 (=> (not res!168588) (not e!194636))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31026 (= res!168588 (validMask!0 mask!3709))))

(assert (=> start!31026 e!194636))

(declare-fun array_inv!5502 (array!15941) Bool)

(assert (=> start!31026 (array_inv!5502 a!3293)))

(assert (=> start!31026 true))

(declare-fun b!312085 () Bool)

(declare-fun e!194637 () Bool)

(declare-fun e!194633 () Bool)

(assert (=> b!312085 (= e!194637 e!194633)))

(declare-fun res!168593 () Bool)

(assert (=> b!312085 (=> (not res!168593) (not e!194633))))

(declare-datatypes ((SeekEntryResult!2657 0))(
  ( (MissingZero!2657 (index!12804 (_ BitVec 32))) (Found!2657 (index!12805 (_ BitVec 32))) (Intermediate!2657 (undefined!3469 Bool) (index!12806 (_ BitVec 32)) (x!31123 (_ BitVec 32))) (Undefined!2657) (MissingVacant!2657 (index!12807 (_ BitVec 32))) )
))
(declare-fun lt!152811 () SeekEntryResult!2657)

(declare-fun lt!152808 () SeekEntryResult!2657)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312085 (= res!168593 (and (= lt!152811 lt!152808) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7552 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15941 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!312085 (= lt!152811 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312086 () Bool)

(declare-fun res!168591 () Bool)

(assert (=> b!312086 (=> (not res!168591) (not e!194636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312086 (= res!168591 (validKeyInArray!0 k0!2441))))

(declare-fun b!312087 () Bool)

(declare-fun res!168597 () Bool)

(assert (=> b!312087 (=> (not res!168597) (not e!194636))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15941 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!312087 (= res!168597 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2657 i!1240)))))

(declare-fun b!312088 () Bool)

(declare-fun res!168594 () Bool)

(assert (=> b!312088 (=> (not res!168594) (not e!194636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15941 (_ BitVec 32)) Bool)

(assert (=> b!312088 (= res!168594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312089 () Bool)

(assert (=> b!312089 (= e!194636 e!194637)))

(declare-fun res!168596 () Bool)

(assert (=> b!312089 (=> (not res!168596) (not e!194637))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312089 (= res!168596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152808))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312089 (= lt!152808 (Intermediate!2657 false resIndex!52 resX!52))))

(declare-fun b!312090 () Bool)

(declare-fun e!194634 () Bool)

(assert (=> b!312090 (= e!194634 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(declare-fun lt!152809 () SeekEntryResult!2657)

(declare-fun lt!152806 () SeekEntryResult!2657)

(assert (=> b!312090 (= lt!152809 lt!152806)))

(declare-datatypes ((Unit!9575 0))(
  ( (Unit!9576) )
))
(declare-fun lt!152810 () Unit!9575)

(declare-fun lt!152807 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15941 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9575)

(assert (=> b!312090 (= lt!152810 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152807 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312091 () Bool)

(declare-fun res!168590 () Bool)

(assert (=> b!312091 (=> (not res!168590) (not e!194636))))

(assert (=> b!312091 (= res!168590 (and (= (size!7904 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7904 a!3293))))))

(declare-fun b!312092 () Bool)

(declare-fun res!168589 () Bool)

(assert (=> b!312092 (=> (not res!168589) (not e!194637))))

(assert (=> b!312092 (= res!168589 (and (= (select (arr!7552 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7904 a!3293))))))

(declare-fun b!312093 () Bool)

(assert (=> b!312093 (= e!194633 (not e!194634))))

(declare-fun res!168595 () Bool)

(assert (=> b!312093 (=> res!168595 e!194634)))

(assert (=> b!312093 (= res!168595 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152807 #b00000000000000000000000000000000) (bvsge lt!152807 (size!7904 a!3293)) (not (= lt!152806 lt!152808))))))

(declare-fun lt!152804 () SeekEntryResult!2657)

(assert (=> b!312093 (= lt!152804 lt!152809)))

(declare-fun lt!152805 () array!15941)

(assert (=> b!312093 (= lt!152809 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152807 k0!2441 lt!152805 mask!3709))))

(assert (=> b!312093 (= lt!152804 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152805 mask!3709))))

(assert (=> b!312093 (= lt!152805 (array!15942 (store (arr!7552 a!3293) i!1240 k0!2441) (size!7904 a!3293)))))

(assert (=> b!312093 (= lt!152811 lt!152806)))

(assert (=> b!312093 (= lt!152806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152807 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312093 (= lt!152807 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!31026 res!168588) b!312091))

(assert (= (and b!312091 res!168590) b!312086))

(assert (= (and b!312086 res!168591) b!312084))

(assert (= (and b!312084 res!168592) b!312087))

(assert (= (and b!312087 res!168597) b!312088))

(assert (= (and b!312088 res!168594) b!312089))

(assert (= (and b!312089 res!168596) b!312092))

(assert (= (and b!312092 res!168589) b!312085))

(assert (= (and b!312085 res!168593) b!312093))

(assert (= (and b!312093 (not res!168595)) b!312090))

(declare-fun m!322315 () Bool)

(assert (=> b!312084 m!322315))

(declare-fun m!322317 () Bool)

(assert (=> b!312085 m!322317))

(declare-fun m!322319 () Bool)

(assert (=> b!312085 m!322319))

(declare-fun m!322321 () Bool)

(assert (=> b!312087 m!322321))

(declare-fun m!322323 () Bool)

(assert (=> b!312086 m!322323))

(declare-fun m!322325 () Bool)

(assert (=> start!31026 m!322325))

(declare-fun m!322327 () Bool)

(assert (=> start!31026 m!322327))

(declare-fun m!322329 () Bool)

(assert (=> b!312089 m!322329))

(assert (=> b!312089 m!322329))

(declare-fun m!322331 () Bool)

(assert (=> b!312089 m!322331))

(declare-fun m!322333 () Bool)

(assert (=> b!312090 m!322333))

(declare-fun m!322335 () Bool)

(assert (=> b!312092 m!322335))

(declare-fun m!322337 () Bool)

(assert (=> b!312093 m!322337))

(declare-fun m!322339 () Bool)

(assert (=> b!312093 m!322339))

(declare-fun m!322341 () Bool)

(assert (=> b!312093 m!322341))

(declare-fun m!322343 () Bool)

(assert (=> b!312093 m!322343))

(declare-fun m!322345 () Bool)

(assert (=> b!312093 m!322345))

(declare-fun m!322347 () Bool)

(assert (=> b!312088 m!322347))

(check-sat (not b!312086) (not b!312088) (not b!312087) (not b!312084) (not b!312085) (not start!31026) (not b!312093) (not b!312089) (not b!312090))
(check-sat)
