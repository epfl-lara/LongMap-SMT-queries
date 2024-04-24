; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64410 () Bool)

(assert start!64410)

(declare-fun b!723665 () Bool)

(declare-fun res!485107 () Bool)

(declare-fun e!405490 () Bool)

(assert (=> b!723665 (=> (not res!485107) (not e!405490))))

(declare-datatypes ((array!40924 0))(
  ( (array!40925 (arr!19582 (Array (_ BitVec 32) (_ BitVec 64))) (size!20002 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40924)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!723665 (= res!485107 (and (= (size!20002 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20002 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20002 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7138 0))(
  ( (MissingZero!7138 (index!30920 (_ BitVec 32))) (Found!7138 (index!30921 (_ BitVec 32))) (Intermediate!7138 (undefined!7950 Bool) (index!30922 (_ BitVec 32)) (x!62070 (_ BitVec 32))) (Undefined!7138) (MissingVacant!7138 (index!30923 (_ BitVec 32))) )
))
(declare-fun lt!320765 () SeekEntryResult!7138)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!723666 () Bool)

(declare-fun e!405488 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40924 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!723666 (= e!405488 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19582 a!3186) j!159) a!3186 mask!3328) lt!320765))))

(declare-fun res!485113 () Bool)

(assert (=> start!64410 (=> (not res!485113) (not e!405490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64410 (= res!485113 (validMask!0 mask!3328))))

(assert (=> start!64410 e!405490))

(assert (=> start!64410 true))

(declare-fun array_inv!15441 (array!40924) Bool)

(assert (=> start!64410 (array_inv!15441 a!3186)))

(declare-fun b!723667 () Bool)

(declare-fun res!485108 () Bool)

(declare-fun e!405489 () Bool)

(assert (=> b!723667 (=> (not res!485108) (not e!405489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40924 (_ BitVec 32)) Bool)

(assert (=> b!723667 (= res!485108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723668 () Bool)

(declare-fun e!405487 () Bool)

(assert (=> b!723668 (= e!405489 e!405487)))

(declare-fun res!485102 () Bool)

(assert (=> b!723668 (=> (not res!485102) (not e!405487))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723668 (= res!485102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19582 a!3186) j!159) mask!3328) (select (arr!19582 a!3186) j!159) a!3186 mask!3328) lt!320765))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723668 (= lt!320765 (Intermediate!7138 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723669 () Bool)

(declare-fun res!485110 () Bool)

(assert (=> b!723669 (=> (not res!485110) (not e!405489))))

(declare-datatypes ((List!13491 0))(
  ( (Nil!13488) (Cons!13487 (h!14544 (_ BitVec 64)) (t!19798 List!13491)) )
))
(declare-fun arrayNoDuplicates!0 (array!40924 (_ BitVec 32) List!13491) Bool)

(assert (=> b!723669 (= res!485110 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13488))))

(declare-fun b!723670 () Bool)

(assert (=> b!723670 (= e!405490 e!405489)))

(declare-fun res!485106 () Bool)

(assert (=> b!723670 (=> (not res!485106) (not e!405489))))

(declare-fun lt!320767 () SeekEntryResult!7138)

(assert (=> b!723670 (= res!485106 (or (= lt!320767 (MissingZero!7138 i!1173)) (= lt!320767 (MissingVacant!7138 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40924 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!723670 (= lt!320767 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723671 () Bool)

(declare-fun res!485112 () Bool)

(assert (=> b!723671 (=> (not res!485112) (not e!405490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723671 (= res!485112 (validKeyInArray!0 k0!2102))))

(declare-fun b!723672 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40924 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!723672 (= e!405488 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19582 a!3186) j!159) a!3186 mask!3328) (Found!7138 j!159)))))

(declare-fun b!723673 () Bool)

(declare-fun e!405491 () Bool)

(assert (=> b!723673 (= e!405491 (not true))))

(assert (=> b!723673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24673 0))(
  ( (Unit!24674) )
))
(declare-fun lt!320768 () Unit!24673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24673)

(assert (=> b!723673 (= lt!320768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723674 () Bool)

(declare-fun res!485109 () Bool)

(assert (=> b!723674 (=> (not res!485109) (not e!405489))))

(assert (=> b!723674 (= res!485109 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20002 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20002 a!3186))))))

(declare-fun b!723675 () Bool)

(declare-fun res!485101 () Bool)

(assert (=> b!723675 (=> (not res!485101) (not e!405487))))

(assert (=> b!723675 (= res!485101 e!405488)))

(declare-fun c!79655 () Bool)

(assert (=> b!723675 (= c!79655 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723676 () Bool)

(declare-fun res!485103 () Bool)

(assert (=> b!723676 (=> (not res!485103) (not e!405487))))

(assert (=> b!723676 (= res!485103 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19582 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723677 () Bool)

(assert (=> b!723677 (= e!405487 e!405491)))

(declare-fun res!485111 () Bool)

(assert (=> b!723677 (=> (not res!485111) (not e!405491))))

(declare-fun lt!320766 () (_ BitVec 64))

(declare-fun lt!320769 () array!40924)

(assert (=> b!723677 (= res!485111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320766 mask!3328) lt!320766 lt!320769 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320766 lt!320769 mask!3328)))))

(assert (=> b!723677 (= lt!320766 (select (store (arr!19582 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723677 (= lt!320769 (array!40925 (store (arr!19582 a!3186) i!1173 k0!2102) (size!20002 a!3186)))))

(declare-fun b!723678 () Bool)

(declare-fun res!485105 () Bool)

(assert (=> b!723678 (=> (not res!485105) (not e!405490))))

(assert (=> b!723678 (= res!485105 (validKeyInArray!0 (select (arr!19582 a!3186) j!159)))))

(declare-fun b!723679 () Bool)

(declare-fun res!485104 () Bool)

(assert (=> b!723679 (=> (not res!485104) (not e!405490))))

(declare-fun arrayContainsKey!0 (array!40924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723679 (= res!485104 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64410 res!485113) b!723665))

(assert (= (and b!723665 res!485107) b!723678))

(assert (= (and b!723678 res!485105) b!723671))

(assert (= (and b!723671 res!485112) b!723679))

(assert (= (and b!723679 res!485104) b!723670))

(assert (= (and b!723670 res!485106) b!723667))

(assert (= (and b!723667 res!485108) b!723669))

(assert (= (and b!723669 res!485110) b!723674))

(assert (= (and b!723674 res!485109) b!723668))

(assert (= (and b!723668 res!485102) b!723676))

(assert (= (and b!723676 res!485103) b!723675))

(assert (= (and b!723675 c!79655) b!723666))

(assert (= (and b!723675 (not c!79655)) b!723672))

(assert (= (and b!723675 res!485101) b!723677))

(assert (= (and b!723677 res!485111) b!723673))

(declare-fun m!678633 () Bool)

(assert (=> b!723668 m!678633))

(assert (=> b!723668 m!678633))

(declare-fun m!678635 () Bool)

(assert (=> b!723668 m!678635))

(assert (=> b!723668 m!678635))

(assert (=> b!723668 m!678633))

(declare-fun m!678637 () Bool)

(assert (=> b!723668 m!678637))

(declare-fun m!678639 () Bool)

(assert (=> b!723667 m!678639))

(declare-fun m!678641 () Bool)

(assert (=> b!723676 m!678641))

(assert (=> b!723672 m!678633))

(assert (=> b!723672 m!678633))

(declare-fun m!678643 () Bool)

(assert (=> b!723672 m!678643))

(assert (=> b!723678 m!678633))

(assert (=> b!723678 m!678633))

(declare-fun m!678645 () Bool)

(assert (=> b!723678 m!678645))

(declare-fun m!678647 () Bool)

(assert (=> b!723673 m!678647))

(declare-fun m!678649 () Bool)

(assert (=> b!723673 m!678649))

(declare-fun m!678651 () Bool)

(assert (=> b!723677 m!678651))

(declare-fun m!678653 () Bool)

(assert (=> b!723677 m!678653))

(declare-fun m!678655 () Bool)

(assert (=> b!723677 m!678655))

(declare-fun m!678657 () Bool)

(assert (=> b!723677 m!678657))

(assert (=> b!723677 m!678655))

(declare-fun m!678659 () Bool)

(assert (=> b!723677 m!678659))

(assert (=> b!723666 m!678633))

(assert (=> b!723666 m!678633))

(declare-fun m!678661 () Bool)

(assert (=> b!723666 m!678661))

(declare-fun m!678663 () Bool)

(assert (=> b!723671 m!678663))

(declare-fun m!678665 () Bool)

(assert (=> b!723679 m!678665))

(declare-fun m!678667 () Bool)

(assert (=> b!723670 m!678667))

(declare-fun m!678669 () Bool)

(assert (=> start!64410 m!678669))

(declare-fun m!678671 () Bool)

(assert (=> start!64410 m!678671))

(declare-fun m!678673 () Bool)

(assert (=> b!723669 m!678673))

(check-sat (not start!64410) (not b!723679) (not b!723670) (not b!723671) (not b!723677) (not b!723672) (not b!723669) (not b!723673) (not b!723668) (not b!723678) (not b!723666) (not b!723667))
(check-sat)
