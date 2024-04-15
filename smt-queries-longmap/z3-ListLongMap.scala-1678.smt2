; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30942 () Bool)

(assert start!30942)

(declare-fun b!310603 () Bool)

(declare-fun res!167204 () Bool)

(declare-fun e!193864 () Bool)

(assert (=> b!310603 (=> (not res!167204) (not e!193864))))

(declare-datatypes ((array!15848 0))(
  ( (array!15849 (arr!7506 (Array (_ BitVec 32) (_ BitVec 64))) (size!7859 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15848)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2645 0))(
  ( (MissingZero!2645 (index!12756 (_ BitVec 32))) (Found!2645 (index!12757 (_ BitVec 32))) (Intermediate!2645 (undefined!3457 Bool) (index!12758 (_ BitVec 32)) (x!30997 (_ BitVec 32))) (Undefined!2645) (MissingVacant!2645 (index!12759 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15848 (_ BitVec 32)) SeekEntryResult!2645)

(assert (=> b!310603 (= res!167204 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2645 i!1240)))))

(declare-fun b!310604 () Bool)

(declare-fun e!193863 () Bool)

(assert (=> b!310604 (= e!193863 (not true))))

(declare-fun e!193865 () Bool)

(assert (=> b!310604 e!193865))

(declare-fun res!167211 () Bool)

(assert (=> b!310604 (=> (not res!167211) (not e!193865))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151898 () (_ BitVec 32))

(declare-fun lt!151896 () SeekEntryResult!2645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15848 (_ BitVec 32)) SeekEntryResult!2645)

(assert (=> b!310604 (= res!167211 (= lt!151896 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151898 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310604 (= lt!151898 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310605 () Bool)

(declare-fun res!167210 () Bool)

(declare-fun e!193861 () Bool)

(assert (=> b!310605 (=> (not res!167210) (not e!193861))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310605 (= res!167210 (and (= (select (arr!7506 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7859 a!3293))))))

(declare-fun b!310606 () Bool)

(declare-fun res!167208 () Bool)

(assert (=> b!310606 (=> (not res!167208) (not e!193864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15848 (_ BitVec 32)) Bool)

(assert (=> b!310606 (= res!167208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310607 () Bool)

(assert (=> b!310607 (= e!193864 e!193861)))

(declare-fun res!167207 () Bool)

(assert (=> b!310607 (=> (not res!167207) (not e!193861))))

(declare-fun lt!151895 () SeekEntryResult!2645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310607 (= res!167207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151895))))

(assert (=> b!310607 (= lt!151895 (Intermediate!2645 false resIndex!52 resX!52))))

(declare-fun b!310608 () Bool)

(declare-fun res!167203 () Bool)

(assert (=> b!310608 (=> (not res!167203) (not e!193864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310608 (= res!167203 (validKeyInArray!0 k0!2441))))

(declare-fun lt!151897 () array!15848)

(declare-fun b!310609 () Bool)

(assert (=> b!310609 (= e!193865 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151897 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151898 k0!2441 lt!151897 mask!3709)))))

(assert (=> b!310609 (= lt!151897 (array!15849 (store (arr!7506 a!3293) i!1240 k0!2441) (size!7859 a!3293)))))

(declare-fun b!310610 () Bool)

(declare-fun res!167202 () Bool)

(assert (=> b!310610 (=> (not res!167202) (not e!193864))))

(assert (=> b!310610 (= res!167202 (and (= (size!7859 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7859 a!3293))))))

(declare-fun b!310611 () Bool)

(declare-fun res!167205 () Bool)

(assert (=> b!310611 (=> (not res!167205) (not e!193864))))

(declare-fun arrayContainsKey!0 (array!15848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310611 (= res!167205 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310602 () Bool)

(assert (=> b!310602 (= e!193861 e!193863)))

(declare-fun res!167206 () Bool)

(assert (=> b!310602 (=> (not res!167206) (not e!193863))))

(assert (=> b!310602 (= res!167206 (and (= lt!151896 lt!151895) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7506 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310602 (= lt!151896 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!167209 () Bool)

(assert (=> start!30942 (=> (not res!167209) (not e!193864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30942 (= res!167209 (validMask!0 mask!3709))))

(assert (=> start!30942 e!193864))

(declare-fun array_inv!5478 (array!15848) Bool)

(assert (=> start!30942 (array_inv!5478 a!3293)))

(assert (=> start!30942 true))

(assert (= (and start!30942 res!167209) b!310610))

(assert (= (and b!310610 res!167202) b!310608))

(assert (= (and b!310608 res!167203) b!310611))

(assert (= (and b!310611 res!167205) b!310603))

(assert (= (and b!310603 res!167204) b!310606))

(assert (= (and b!310606 res!167208) b!310607))

(assert (= (and b!310607 res!167207) b!310605))

(assert (= (and b!310605 res!167210) b!310602))

(assert (= (and b!310602 res!167206) b!310604))

(assert (= (and b!310604 res!167211) b!310609))

(declare-fun m!320083 () Bool)

(assert (=> b!310608 m!320083))

(declare-fun m!320085 () Bool)

(assert (=> b!310607 m!320085))

(assert (=> b!310607 m!320085))

(declare-fun m!320087 () Bool)

(assert (=> b!310607 m!320087))

(declare-fun m!320089 () Bool)

(assert (=> b!310606 m!320089))

(declare-fun m!320091 () Bool)

(assert (=> b!310604 m!320091))

(declare-fun m!320093 () Bool)

(assert (=> b!310604 m!320093))

(declare-fun m!320095 () Bool)

(assert (=> b!310602 m!320095))

(declare-fun m!320097 () Bool)

(assert (=> b!310602 m!320097))

(declare-fun m!320099 () Bool)

(assert (=> b!310611 m!320099))

(declare-fun m!320101 () Bool)

(assert (=> b!310605 m!320101))

(declare-fun m!320103 () Bool)

(assert (=> b!310609 m!320103))

(declare-fun m!320105 () Bool)

(assert (=> b!310609 m!320105))

(declare-fun m!320107 () Bool)

(assert (=> b!310609 m!320107))

(declare-fun m!320109 () Bool)

(assert (=> start!30942 m!320109))

(declare-fun m!320111 () Bool)

(assert (=> start!30942 m!320111))

(declare-fun m!320113 () Bool)

(assert (=> b!310603 m!320113))

(check-sat (not b!310607) (not start!30942) (not b!310604) (not b!310602) (not b!310608) (not b!310606) (not b!310611) (not b!310609) (not b!310603))
(check-sat)
