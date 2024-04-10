; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31036 () Bool)

(assert start!31036)

(declare-fun b!312077 () Bool)

(declare-fun res!168533 () Bool)

(declare-fun e!194637 () Bool)

(assert (=> b!312077 (=> (not res!168533) (not e!194637))))

(declare-datatypes ((array!15938 0))(
  ( (array!15939 (arr!7551 (Array (_ BitVec 32) (_ BitVec 64))) (size!7903 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15938)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312077 (= res!168533 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312078 () Bool)

(declare-fun res!168537 () Bool)

(assert (=> b!312078 (=> (not res!168537) (not e!194637))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15938 (_ BitVec 32)) Bool)

(assert (=> b!312078 (= res!168537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312079 () Bool)

(declare-fun res!168536 () Bool)

(assert (=> b!312079 (=> (not res!168536) (not e!194637))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312079 (= res!168536 (and (= (size!7903 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7903 a!3293))))))

(declare-fun b!312081 () Bool)

(declare-fun e!194641 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312081 (= e!194641 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-datatypes ((SeekEntryResult!2691 0))(
  ( (MissingZero!2691 (index!12940 (_ BitVec 32))) (Found!2691 (index!12941 (_ BitVec 32))) (Intermediate!2691 (undefined!3503 Bool) (index!12942 (_ BitVec 32)) (x!31152 (_ BitVec 32))) (Undefined!2691) (MissingVacant!2691 (index!12943 (_ BitVec 32))) )
))
(declare-fun lt!152743 () SeekEntryResult!2691)

(declare-fun lt!152740 () SeekEntryResult!2691)

(assert (=> b!312081 (= lt!152743 lt!152740)))

(declare-fun lt!152739 () (_ BitVec 32))

(declare-datatypes ((Unit!9613 0))(
  ( (Unit!9614) )
))
(declare-fun lt!152738 () Unit!9613)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15938 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9613)

(assert (=> b!312081 (= lt!152738 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152739 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312082 () Bool)

(declare-fun e!194639 () Bool)

(assert (=> b!312082 (= e!194637 e!194639)))

(declare-fun res!168538 () Bool)

(assert (=> b!312082 (=> (not res!168538) (not e!194639))))

(declare-fun lt!152745 () SeekEntryResult!2691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15938 (_ BitVec 32)) SeekEntryResult!2691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312082 (= res!168538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152745))))

(assert (=> b!312082 (= lt!152745 (Intermediate!2691 false resIndex!52 resX!52))))

(declare-fun res!168534 () Bool)

(assert (=> start!31036 (=> (not res!168534) (not e!194637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31036 (= res!168534 (validMask!0 mask!3709))))

(assert (=> start!31036 e!194637))

(declare-fun array_inv!5514 (array!15938) Bool)

(assert (=> start!31036 (array_inv!5514 a!3293)))

(assert (=> start!31036 true))

(declare-fun b!312080 () Bool)

(declare-fun res!168540 () Bool)

(assert (=> b!312080 (=> (not res!168540) (not e!194639))))

(assert (=> b!312080 (= res!168540 (and (= (select (arr!7551 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7903 a!3293))))))

(declare-fun b!312083 () Bool)

(declare-fun e!194638 () Bool)

(assert (=> b!312083 (= e!194639 e!194638)))

(declare-fun res!168531 () Bool)

(assert (=> b!312083 (=> (not res!168531) (not e!194638))))

(declare-fun lt!152741 () SeekEntryResult!2691)

(assert (=> b!312083 (= res!168531 (and (= lt!152741 lt!152745) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7551 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312083 (= lt!152741 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312084 () Bool)

(assert (=> b!312084 (= e!194638 (not e!194641))))

(declare-fun res!168532 () Bool)

(assert (=> b!312084 (=> res!168532 e!194641)))

(assert (=> b!312084 (= res!168532 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152739 #b00000000000000000000000000000000) (bvsge lt!152739 (size!7903 a!3293)) (not (= lt!152740 lt!152745))))))

(declare-fun lt!152742 () SeekEntryResult!2691)

(assert (=> b!312084 (= lt!152742 lt!152743)))

(declare-fun lt!152744 () array!15938)

(assert (=> b!312084 (= lt!152743 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152739 k0!2441 lt!152744 mask!3709))))

(assert (=> b!312084 (= lt!152742 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152744 mask!3709))))

(assert (=> b!312084 (= lt!152744 (array!15939 (store (arr!7551 a!3293) i!1240 k0!2441) (size!7903 a!3293)))))

(assert (=> b!312084 (= lt!152741 lt!152740)))

(assert (=> b!312084 (= lt!152740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152739 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312084 (= lt!152739 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312085 () Bool)

(declare-fun res!168535 () Bool)

(assert (=> b!312085 (=> (not res!168535) (not e!194637))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15938 (_ BitVec 32)) SeekEntryResult!2691)

(assert (=> b!312085 (= res!168535 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2691 i!1240)))))

(declare-fun b!312086 () Bool)

(declare-fun res!168539 () Bool)

(assert (=> b!312086 (=> (not res!168539) (not e!194637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312086 (= res!168539 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31036 res!168534) b!312079))

(assert (= (and b!312079 res!168536) b!312086))

(assert (= (and b!312086 res!168539) b!312077))

(assert (= (and b!312077 res!168533) b!312085))

(assert (= (and b!312085 res!168535) b!312078))

(assert (= (and b!312078 res!168537) b!312082))

(assert (= (and b!312082 res!168538) b!312080))

(assert (= (and b!312080 res!168540) b!312083))

(assert (= (and b!312083 res!168531) b!312084))

(assert (= (and b!312084 (not res!168532)) b!312081))

(declare-fun m!322113 () Bool)

(assert (=> b!312081 m!322113))

(declare-fun m!322115 () Bool)

(assert (=> b!312080 m!322115))

(declare-fun m!322117 () Bool)

(assert (=> b!312077 m!322117))

(declare-fun m!322119 () Bool)

(assert (=> b!312084 m!322119))

(declare-fun m!322121 () Bool)

(assert (=> b!312084 m!322121))

(declare-fun m!322123 () Bool)

(assert (=> b!312084 m!322123))

(declare-fun m!322125 () Bool)

(assert (=> b!312084 m!322125))

(declare-fun m!322127 () Bool)

(assert (=> b!312084 m!322127))

(declare-fun m!322129 () Bool)

(assert (=> start!31036 m!322129))

(declare-fun m!322131 () Bool)

(assert (=> start!31036 m!322131))

(declare-fun m!322133 () Bool)

(assert (=> b!312078 m!322133))

(declare-fun m!322135 () Bool)

(assert (=> b!312085 m!322135))

(declare-fun m!322137 () Bool)

(assert (=> b!312086 m!322137))

(declare-fun m!322139 () Bool)

(assert (=> b!312083 m!322139))

(declare-fun m!322141 () Bool)

(assert (=> b!312083 m!322141))

(declare-fun m!322143 () Bool)

(assert (=> b!312082 m!322143))

(assert (=> b!312082 m!322143))

(declare-fun m!322145 () Bool)

(assert (=> b!312082 m!322145))

(check-sat (not start!31036) (not b!312084) (not b!312085) (not b!312086) (not b!312083) (not b!312078) (not b!312081) (not b!312077) (not b!312082))
(check-sat)
