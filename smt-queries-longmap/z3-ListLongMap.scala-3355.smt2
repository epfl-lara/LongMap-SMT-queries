; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46110 () Bool)

(assert start!46110)

(declare-fun b!510674 () Bool)

(declare-fun res!311664 () Bool)

(declare-fun e!298417 () Bool)

(assert (=> b!510674 (=> (not res!311664) (not e!298417))))

(declare-datatypes ((array!32831 0))(
  ( (array!32832 (arr!15794 (Array (_ BitVec 32) (_ BitVec 64))) (size!16159 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32831)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510674 (= res!311664 (validKeyInArray!0 (select (arr!15794 a!3235) j!176)))))

(declare-fun res!311667 () Bool)

(assert (=> start!46110 (=> (not res!311667) (not e!298417))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46110 (= res!311667 (validMask!0 mask!3524))))

(assert (=> start!46110 e!298417))

(assert (=> start!46110 true))

(declare-fun array_inv!11677 (array!32831) Bool)

(assert (=> start!46110 (array_inv!11677 a!3235)))

(declare-fun b!510675 () Bool)

(declare-fun res!311661 () Bool)

(declare-fun e!298416 () Bool)

(assert (=> b!510675 (=> (not res!311661) (not e!298416))))

(declare-datatypes ((List!9991 0))(
  ( (Nil!9988) (Cons!9987 (h!10864 (_ BitVec 64)) (t!16210 List!9991)) )
))
(declare-fun arrayNoDuplicates!0 (array!32831 (_ BitVec 32) List!9991) Bool)

(assert (=> b!510675 (= res!311661 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9988))))

(declare-fun b!510676 () Bool)

(declare-fun res!311668 () Bool)

(assert (=> b!510676 (=> (not res!311668) (not e!298417))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!510676 (= res!311668 (validKeyInArray!0 k0!2280))))

(declare-fun b!510677 () Bool)

(declare-fun res!311666 () Bool)

(assert (=> b!510677 (=> (not res!311666) (not e!298417))))

(declare-fun arrayContainsKey!0 (array!32831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510677 (= res!311666 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510678 () Bool)

(assert (=> b!510678 (= e!298417 e!298416)))

(declare-fun res!311669 () Bool)

(assert (=> b!510678 (=> (not res!311669) (not e!298416))))

(declare-datatypes ((SeekEntryResult!4258 0))(
  ( (MissingZero!4258 (index!19220 (_ BitVec 32))) (Found!4258 (index!19221 (_ BitVec 32))) (Intermediate!4258 (undefined!5070 Bool) (index!19222 (_ BitVec 32)) (x!48182 (_ BitVec 32))) (Undefined!4258) (MissingVacant!4258 (index!19223 (_ BitVec 32))) )
))
(declare-fun lt!233491 () SeekEntryResult!4258)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510678 (= res!311669 (or (= lt!233491 (MissingZero!4258 i!1204)) (= lt!233491 (MissingVacant!4258 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32831 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!510678 (= lt!233491 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510679 () Bool)

(declare-fun res!311665 () Bool)

(assert (=> b!510679 (=> (not res!311665) (not e!298417))))

(assert (=> b!510679 (= res!311665 (and (= (size!16159 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16159 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16159 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510680 () Bool)

(declare-fun res!311662 () Bool)

(assert (=> b!510680 (=> (not res!311662) (not e!298416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32831 (_ BitVec 32)) Bool)

(assert (=> b!510680 (= res!311662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510681 () Bool)

(assert (=> b!510681 (= e!298416 (not true))))

(declare-fun lt!233488 () SeekEntryResult!4258)

(declare-fun lt!233490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32831 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!510681 (= lt!233488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233490 (select (store (arr!15794 a!3235) i!1204 k0!2280) j!176) (array!32832 (store (arr!15794 a!3235) i!1204 k0!2280) (size!16159 a!3235)) mask!3524))))

(declare-fun lt!233489 () SeekEntryResult!4258)

(declare-fun lt!233487 () (_ BitVec 32))

(assert (=> b!510681 (= lt!233489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233487 (select (arr!15794 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510681 (= lt!233490 (toIndex!0 (select (store (arr!15794 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510681 (= lt!233487 (toIndex!0 (select (arr!15794 a!3235) j!176) mask!3524))))

(declare-fun e!298418 () Bool)

(assert (=> b!510681 e!298418))

(declare-fun res!311663 () Bool)

(assert (=> b!510681 (=> (not res!311663) (not e!298418))))

(assert (=> b!510681 (= res!311663 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15760 0))(
  ( (Unit!15761) )
))
(declare-fun lt!233486 () Unit!15760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15760)

(assert (=> b!510681 (= lt!233486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510682 () Bool)

(assert (=> b!510682 (= e!298418 (= (seekEntryOrOpen!0 (select (arr!15794 a!3235) j!176) a!3235 mask!3524) (Found!4258 j!176)))))

(assert (= (and start!46110 res!311667) b!510679))

(assert (= (and b!510679 res!311665) b!510674))

(assert (= (and b!510674 res!311664) b!510676))

(assert (= (and b!510676 res!311668) b!510677))

(assert (= (and b!510677 res!311666) b!510678))

(assert (= (and b!510678 res!311669) b!510680))

(assert (= (and b!510680 res!311662) b!510675))

(assert (= (and b!510675 res!311661) b!510681))

(assert (= (and b!510681 res!311663) b!510682))

(declare-fun m!491677 () Bool)

(assert (=> b!510674 m!491677))

(assert (=> b!510674 m!491677))

(declare-fun m!491679 () Bool)

(assert (=> b!510674 m!491679))

(declare-fun m!491681 () Bool)

(assert (=> b!510678 m!491681))

(assert (=> b!510682 m!491677))

(assert (=> b!510682 m!491677))

(declare-fun m!491683 () Bool)

(assert (=> b!510682 m!491683))

(declare-fun m!491685 () Bool)

(assert (=> b!510675 m!491685))

(declare-fun m!491687 () Bool)

(assert (=> b!510680 m!491687))

(declare-fun m!491689 () Bool)

(assert (=> b!510677 m!491689))

(declare-fun m!491691 () Bool)

(assert (=> b!510676 m!491691))

(declare-fun m!491693 () Bool)

(assert (=> b!510681 m!491693))

(declare-fun m!491695 () Bool)

(assert (=> b!510681 m!491695))

(declare-fun m!491697 () Bool)

(assert (=> b!510681 m!491697))

(assert (=> b!510681 m!491677))

(declare-fun m!491699 () Bool)

(assert (=> b!510681 m!491699))

(assert (=> b!510681 m!491677))

(declare-fun m!491701 () Bool)

(assert (=> b!510681 m!491701))

(assert (=> b!510681 m!491677))

(declare-fun m!491703 () Bool)

(assert (=> b!510681 m!491703))

(assert (=> b!510681 m!491697))

(declare-fun m!491705 () Bool)

(assert (=> b!510681 m!491705))

(assert (=> b!510681 m!491697))

(declare-fun m!491707 () Bool)

(assert (=> b!510681 m!491707))

(declare-fun m!491709 () Bool)

(assert (=> start!46110 m!491709))

(declare-fun m!491711 () Bool)

(assert (=> start!46110 m!491711))

(check-sat (not b!510682) (not b!510676) (not start!46110) (not b!510681) (not b!510680) (not b!510675) (not b!510678) (not b!510677) (not b!510674))
(check-sat)
