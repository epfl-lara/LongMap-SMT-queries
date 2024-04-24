; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30942 () Bool)

(assert start!30942)

(declare-fun b!310824 () Bool)

(declare-fun res!167335 () Bool)

(declare-fun e!194005 () Bool)

(assert (=> b!310824 (=> (not res!167335) (not e!194005))))

(declare-datatypes ((array!15857 0))(
  ( (array!15858 (arr!7510 (Array (_ BitVec 32) (_ BitVec 64))) (size!7862 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15857)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310824 (= res!167335 (and (= (select (arr!7510 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7862 a!3293))))))

(declare-fun b!310825 () Bool)

(declare-fun e!194003 () Bool)

(assert (=> b!310825 (= e!194003 (not true))))

(declare-fun e!194007 () Bool)

(assert (=> b!310825 e!194007))

(declare-fun res!167331 () Bool)

(assert (=> b!310825 (=> (not res!167331) (not e!194007))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152151 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2615 0))(
  ( (MissingZero!2615 (index!12636 (_ BitVec 32))) (Found!2615 (index!12637 (_ BitVec 32))) (Intermediate!2615 (undefined!3427 Bool) (index!12638 (_ BitVec 32)) (x!30969 (_ BitVec 32))) (Undefined!2615) (MissingVacant!2615 (index!12639 (_ BitVec 32))) )
))
(declare-fun lt!152150 () SeekEntryResult!2615)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15857 (_ BitVec 32)) SeekEntryResult!2615)

(assert (=> b!310825 (= res!167331 (= lt!152150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152151 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310825 (= lt!152151 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310826 () Bool)

(declare-fun res!167334 () Bool)

(declare-fun e!194004 () Bool)

(assert (=> b!310826 (=> (not res!167334) (not e!194004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310826 (= res!167334 (validKeyInArray!0 k0!2441))))

(declare-fun res!167330 () Bool)

(assert (=> start!30942 (=> (not res!167330) (not e!194004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30942 (= res!167330 (validMask!0 mask!3709))))

(assert (=> start!30942 e!194004))

(declare-fun array_inv!5460 (array!15857) Bool)

(assert (=> start!30942 (array_inv!5460 a!3293)))

(assert (=> start!30942 true))

(declare-fun b!310827 () Bool)

(declare-fun res!167336 () Bool)

(assert (=> b!310827 (=> (not res!167336) (not e!194004))))

(assert (=> b!310827 (= res!167336 (and (= (size!7862 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7862 a!3293))))))

(declare-fun b!310828 () Bool)

(assert (=> b!310828 (= e!194004 e!194005)))

(declare-fun res!167333 () Bool)

(assert (=> b!310828 (=> (not res!167333) (not e!194005))))

(declare-fun lt!152149 () SeekEntryResult!2615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310828 (= res!167333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152149))))

(assert (=> b!310828 (= lt!152149 (Intermediate!2615 false resIndex!52 resX!52))))

(declare-fun b!310829 () Bool)

(declare-fun res!167337 () Bool)

(assert (=> b!310829 (=> (not res!167337) (not e!194004))))

(declare-fun arrayContainsKey!0 (array!15857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310829 (= res!167337 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310830 () Bool)

(declare-fun res!167332 () Bool)

(assert (=> b!310830 (=> (not res!167332) (not e!194004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15857 (_ BitVec 32)) Bool)

(assert (=> b!310830 (= res!167332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310831 () Bool)

(declare-fun res!167328 () Bool)

(assert (=> b!310831 (=> (not res!167328) (not e!194004))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15857 (_ BitVec 32)) SeekEntryResult!2615)

(assert (=> b!310831 (= res!167328 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2615 i!1240)))))

(declare-fun b!310832 () Bool)

(assert (=> b!310832 (= e!194005 e!194003)))

(declare-fun res!167329 () Bool)

(assert (=> b!310832 (=> (not res!167329) (not e!194003))))

(assert (=> b!310832 (= res!167329 (and (= lt!152150 lt!152149) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7510 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310832 (= lt!152150 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!152148 () array!15857)

(declare-fun b!310833 () Bool)

(assert (=> b!310833 (= e!194007 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152148 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152151 k0!2441 lt!152148 mask!3709)))))

(assert (=> b!310833 (= lt!152148 (array!15858 (store (arr!7510 a!3293) i!1240 k0!2441) (size!7862 a!3293)))))

(assert (= (and start!30942 res!167330) b!310827))

(assert (= (and b!310827 res!167336) b!310826))

(assert (= (and b!310826 res!167334) b!310829))

(assert (= (and b!310829 res!167337) b!310831))

(assert (= (and b!310831 res!167328) b!310830))

(assert (= (and b!310830 res!167332) b!310828))

(assert (= (and b!310828 res!167333) b!310824))

(assert (= (and b!310824 res!167335) b!310832))

(assert (= (and b!310832 res!167329) b!310825))

(assert (= (and b!310825 res!167331) b!310833))

(declare-fun m!320947 () Bool)

(assert (=> b!310824 m!320947))

(declare-fun m!320949 () Bool)

(assert (=> b!310829 m!320949))

(declare-fun m!320951 () Bool)

(assert (=> b!310832 m!320951))

(declare-fun m!320953 () Bool)

(assert (=> b!310832 m!320953))

(declare-fun m!320955 () Bool)

(assert (=> start!30942 m!320955))

(declare-fun m!320957 () Bool)

(assert (=> start!30942 m!320957))

(declare-fun m!320959 () Bool)

(assert (=> b!310830 m!320959))

(declare-fun m!320961 () Bool)

(assert (=> b!310825 m!320961))

(declare-fun m!320963 () Bool)

(assert (=> b!310825 m!320963))

(declare-fun m!320965 () Bool)

(assert (=> b!310826 m!320965))

(declare-fun m!320967 () Bool)

(assert (=> b!310833 m!320967))

(declare-fun m!320969 () Bool)

(assert (=> b!310833 m!320969))

(declare-fun m!320971 () Bool)

(assert (=> b!310833 m!320971))

(declare-fun m!320973 () Bool)

(assert (=> b!310828 m!320973))

(assert (=> b!310828 m!320973))

(declare-fun m!320975 () Bool)

(assert (=> b!310828 m!320975))

(declare-fun m!320977 () Bool)

(assert (=> b!310831 m!320977))

(check-sat (not start!30942) (not b!310829) (not b!310830) (not b!310828) (not b!310832) (not b!310831) (not b!310833) (not b!310826) (not b!310825))
(check-sat)
