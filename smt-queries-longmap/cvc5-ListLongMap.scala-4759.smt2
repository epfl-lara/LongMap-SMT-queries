; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65614 () Bool)

(assert start!65614)

(declare-fun b!750639 () Bool)

(declare-fun res!506658 () Bool)

(declare-fun e!418797 () Bool)

(assert (=> b!750639 (=> (not res!506658) (not e!418797))))

(declare-datatypes ((array!41787 0))(
  ( (array!41788 (arr!20007 (Array (_ BitVec 32) (_ BitVec 64))) (size!20428 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41787)

(declare-datatypes ((List!14009 0))(
  ( (Nil!14006) (Cons!14005 (h!15077 (_ BitVec 64)) (t!20324 List!14009)) )
))
(declare-fun arrayNoDuplicates!0 (array!41787 (_ BitVec 32) List!14009) Bool)

(assert (=> b!750639 (= res!506658 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14006))))

(declare-fun res!506662 () Bool)

(declare-fun e!418793 () Bool)

(assert (=> start!65614 (=> (not res!506662) (not e!418793))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65614 (= res!506662 (validMask!0 mask!3328))))

(assert (=> start!65614 e!418793))

(assert (=> start!65614 true))

(declare-fun array_inv!15803 (array!41787) Bool)

(assert (=> start!65614 (array_inv!15803 a!3186)))

(declare-fun b!750640 () Bool)

(declare-fun e!418799 () Bool)

(declare-fun e!418795 () Bool)

(assert (=> b!750640 (= e!418799 e!418795)))

(declare-fun res!506673 () Bool)

(assert (=> b!750640 (=> res!506673 e!418795)))

(declare-fun lt!333785 () (_ BitVec 64))

(declare-fun lt!333783 () (_ BitVec 64))

(assert (=> b!750640 (= res!506673 (= lt!333785 lt!333783))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!750640 (= lt!333785 (select (store (arr!20007 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750641 () Bool)

(declare-fun res!506666 () Bool)

(declare-fun e!418798 () Bool)

(assert (=> b!750641 (=> (not res!506666) (not e!418798))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750641 (= res!506666 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20007 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750642 () Bool)

(declare-fun res!506663 () Bool)

(assert (=> b!750642 (=> res!506663 e!418799)))

(declare-datatypes ((SeekEntryResult!7607 0))(
  ( (MissingZero!7607 (index!32796 (_ BitVec 32))) (Found!7607 (index!32797 (_ BitVec 32))) (Intermediate!7607 (undefined!8419 Bool) (index!32798 (_ BitVec 32)) (x!63725 (_ BitVec 32))) (Undefined!7607) (MissingVacant!7607 (index!32799 (_ BitVec 32))) )
))
(declare-fun lt!333786 () SeekEntryResult!7607)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41787 (_ BitVec 32)) SeekEntryResult!7607)

(assert (=> b!750642 (= res!506663 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20007 a!3186) j!159) a!3186 mask!3328) lt!333786)))))

(declare-fun b!750643 () Bool)

(assert (=> b!750643 (= e!418795 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!418789 () Bool)

(assert (=> b!750643 e!418789))

(declare-fun res!506669 () Bool)

(assert (=> b!750643 (=> (not res!506669) (not e!418789))))

(assert (=> b!750643 (= res!506669 (= lt!333785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25808 0))(
  ( (Unit!25809) )
))
(declare-fun lt!333782 () Unit!25808)

(declare-fun e!418791 () Unit!25808)

(assert (=> b!750643 (= lt!333782 e!418791)))

(declare-fun c!82372 () Bool)

(assert (=> b!750643 (= c!82372 (= lt!333785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!418790 () Bool)

(declare-fun b!750644 () Bool)

(assert (=> b!750644 (= e!418790 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20007 a!3186) j!159) a!3186 mask!3328) (Found!7607 j!159)))))

(declare-fun b!750645 () Bool)

(declare-fun res!506668 () Bool)

(assert (=> b!750645 (=> (not res!506668) (not e!418797))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750645 (= res!506668 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20428 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20428 a!3186))))))

(declare-fun lt!333788 () SeekEntryResult!7607)

(declare-fun b!750646 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41787 (_ BitVec 32)) SeekEntryResult!7607)

(assert (=> b!750646 (= e!418790 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20007 a!3186) j!159) a!3186 mask!3328) lt!333788))))

(declare-fun b!750647 () Bool)

(declare-fun res!506671 () Bool)

(assert (=> b!750647 (=> (not res!506671) (not e!418793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750647 (= res!506671 (validKeyInArray!0 (select (arr!20007 a!3186) j!159)))))

(declare-fun b!750648 () Bool)

(declare-fun e!418792 () Bool)

(assert (=> b!750648 (= e!418792 (not e!418799))))

(declare-fun res!506675 () Bool)

(assert (=> b!750648 (=> res!506675 e!418799)))

(declare-fun lt!333791 () SeekEntryResult!7607)

(assert (=> b!750648 (= res!506675 (or (not (is-Intermediate!7607 lt!333791)) (bvslt x!1131 (x!63725 lt!333791)) (not (= x!1131 (x!63725 lt!333791))) (not (= index!1321 (index!32798 lt!333791)))))))

(declare-fun e!418796 () Bool)

(assert (=> b!750648 e!418796))

(declare-fun res!506664 () Bool)

(assert (=> b!750648 (=> (not res!506664) (not e!418796))))

(declare-fun lt!333787 () SeekEntryResult!7607)

(assert (=> b!750648 (= res!506664 (= lt!333787 lt!333786))))

(assert (=> b!750648 (= lt!333786 (Found!7607 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41787 (_ BitVec 32)) SeekEntryResult!7607)

(assert (=> b!750648 (= lt!333787 (seekEntryOrOpen!0 (select (arr!20007 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41787 (_ BitVec 32)) Bool)

(assert (=> b!750648 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333784 () Unit!25808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25808)

(assert (=> b!750648 (= lt!333784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750649 () Bool)

(declare-fun Unit!25810 () Unit!25808)

(assert (=> b!750649 (= e!418791 Unit!25810)))

(assert (=> b!750649 false))

(declare-fun b!750650 () Bool)

(assert (=> b!750650 (= e!418798 e!418792)))

(declare-fun res!506660 () Bool)

(assert (=> b!750650 (=> (not res!506660) (not e!418792))))

(declare-fun lt!333789 () SeekEntryResult!7607)

(assert (=> b!750650 (= res!506660 (= lt!333789 lt!333791))))

(declare-fun lt!333790 () array!41787)

(assert (=> b!750650 (= lt!333791 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333783 lt!333790 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750650 (= lt!333789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333783 mask!3328) lt!333783 lt!333790 mask!3328))))

(assert (=> b!750650 (= lt!333783 (select (store (arr!20007 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750650 (= lt!333790 (array!41788 (store (arr!20007 a!3186) i!1173 k!2102) (size!20428 a!3186)))))

(declare-fun b!750651 () Bool)

(assert (=> b!750651 (= e!418796 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20007 a!3186) j!159) a!3186 mask!3328) lt!333786))))

(declare-fun b!750652 () Bool)

(declare-fun res!506670 () Bool)

(assert (=> b!750652 (=> (not res!506670) (not e!418793))))

(assert (=> b!750652 (= res!506670 (and (= (size!20428 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20428 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20428 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750653 () Bool)

(declare-fun res!506659 () Bool)

(assert (=> b!750653 (=> (not res!506659) (not e!418797))))

(assert (=> b!750653 (= res!506659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750654 () Bool)

(assert (=> b!750654 (= e!418797 e!418798)))

(declare-fun res!506674 () Bool)

(assert (=> b!750654 (=> (not res!506674) (not e!418798))))

(assert (=> b!750654 (= res!506674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20007 a!3186) j!159) mask!3328) (select (arr!20007 a!3186) j!159) a!3186 mask!3328) lt!333788))))

(assert (=> b!750654 (= lt!333788 (Intermediate!7607 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750655 () Bool)

(assert (=> b!750655 (= e!418789 (= (seekEntryOrOpen!0 lt!333783 lt!333790 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333783 lt!333790 mask!3328)))))

(declare-fun b!750656 () Bool)

(declare-fun Unit!25811 () Unit!25808)

(assert (=> b!750656 (= e!418791 Unit!25811)))

(declare-fun b!750657 () Bool)

(declare-fun res!506661 () Bool)

(assert (=> b!750657 (=> (not res!506661) (not e!418793))))

(declare-fun arrayContainsKey!0 (array!41787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750657 (= res!506661 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750658 () Bool)

(declare-fun res!506672 () Bool)

(assert (=> b!750658 (=> (not res!506672) (not e!418798))))

(assert (=> b!750658 (= res!506672 e!418790)))

(declare-fun c!82371 () Bool)

(assert (=> b!750658 (= c!82371 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750659 () Bool)

(assert (=> b!750659 (= e!418793 e!418797)))

(declare-fun res!506665 () Bool)

(assert (=> b!750659 (=> (not res!506665) (not e!418797))))

(declare-fun lt!333781 () SeekEntryResult!7607)

(assert (=> b!750659 (= res!506665 (or (= lt!333781 (MissingZero!7607 i!1173)) (= lt!333781 (MissingVacant!7607 i!1173))))))

(assert (=> b!750659 (= lt!333781 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750660 () Bool)

(declare-fun res!506667 () Bool)

(assert (=> b!750660 (=> (not res!506667) (not e!418793))))

(assert (=> b!750660 (= res!506667 (validKeyInArray!0 k!2102))))

(assert (= (and start!65614 res!506662) b!750652))

(assert (= (and b!750652 res!506670) b!750647))

(assert (= (and b!750647 res!506671) b!750660))

(assert (= (and b!750660 res!506667) b!750657))

(assert (= (and b!750657 res!506661) b!750659))

(assert (= (and b!750659 res!506665) b!750653))

(assert (= (and b!750653 res!506659) b!750639))

(assert (= (and b!750639 res!506658) b!750645))

(assert (= (and b!750645 res!506668) b!750654))

(assert (= (and b!750654 res!506674) b!750641))

(assert (= (and b!750641 res!506666) b!750658))

(assert (= (and b!750658 c!82371) b!750646))

(assert (= (and b!750658 (not c!82371)) b!750644))

(assert (= (and b!750658 res!506672) b!750650))

(assert (= (and b!750650 res!506660) b!750648))

(assert (= (and b!750648 res!506664) b!750651))

(assert (= (and b!750648 (not res!506675)) b!750642))

(assert (= (and b!750642 (not res!506663)) b!750640))

(assert (= (and b!750640 (not res!506673)) b!750643))

(assert (= (and b!750643 c!82372) b!750649))

(assert (= (and b!750643 (not c!82372)) b!750656))

(assert (= (and b!750643 res!506669) b!750655))

(declare-fun m!699991 () Bool)

(assert (=> b!750641 m!699991))

(declare-fun m!699993 () Bool)

(assert (=> b!750653 m!699993))

(declare-fun m!699995 () Bool)

(assert (=> b!750655 m!699995))

(declare-fun m!699997 () Bool)

(assert (=> b!750655 m!699997))

(declare-fun m!699999 () Bool)

(assert (=> b!750654 m!699999))

(assert (=> b!750654 m!699999))

(declare-fun m!700001 () Bool)

(assert (=> b!750654 m!700001))

(assert (=> b!750654 m!700001))

(assert (=> b!750654 m!699999))

(declare-fun m!700003 () Bool)

(assert (=> b!750654 m!700003))

(declare-fun m!700005 () Bool)

(assert (=> b!750659 m!700005))

(declare-fun m!700007 () Bool)

(assert (=> b!750660 m!700007))

(assert (=> b!750646 m!699999))

(assert (=> b!750646 m!699999))

(declare-fun m!700009 () Bool)

(assert (=> b!750646 m!700009))

(declare-fun m!700011 () Bool)

(assert (=> b!750640 m!700011))

(declare-fun m!700013 () Bool)

(assert (=> b!750640 m!700013))

(assert (=> b!750651 m!699999))

(assert (=> b!750651 m!699999))

(declare-fun m!700015 () Bool)

(assert (=> b!750651 m!700015))

(declare-fun m!700017 () Bool)

(assert (=> start!65614 m!700017))

(declare-fun m!700019 () Bool)

(assert (=> start!65614 m!700019))

(assert (=> b!750647 m!699999))

(assert (=> b!750647 m!699999))

(declare-fun m!700021 () Bool)

(assert (=> b!750647 m!700021))

(assert (=> b!750644 m!699999))

(assert (=> b!750644 m!699999))

(declare-fun m!700023 () Bool)

(assert (=> b!750644 m!700023))

(declare-fun m!700025 () Bool)

(assert (=> b!750657 m!700025))

(declare-fun m!700027 () Bool)

(assert (=> b!750639 m!700027))

(assert (=> b!750650 m!700011))

(declare-fun m!700029 () Bool)

(assert (=> b!750650 m!700029))

(declare-fun m!700031 () Bool)

(assert (=> b!750650 m!700031))

(declare-fun m!700033 () Bool)

(assert (=> b!750650 m!700033))

(declare-fun m!700035 () Bool)

(assert (=> b!750650 m!700035))

(assert (=> b!750650 m!700033))

(assert (=> b!750642 m!699999))

(assert (=> b!750642 m!699999))

(assert (=> b!750642 m!700023))

(assert (=> b!750648 m!699999))

(assert (=> b!750648 m!699999))

(declare-fun m!700037 () Bool)

(assert (=> b!750648 m!700037))

(declare-fun m!700039 () Bool)

(assert (=> b!750648 m!700039))

(declare-fun m!700041 () Bool)

(assert (=> b!750648 m!700041))

(push 1)

(assert (not b!750660))

(assert (not start!65614))

(assert (not b!750647))

(assert (not b!750659))

(assert (not b!750642))

(assert (not b!750653))

(assert (not b!750639))

(assert (not b!750655))

(assert (not b!750646))

(assert (not b!750654))

(assert (not b!750657))

(assert (not b!750644))

(assert (not b!750650))

(assert (not b!750651))

(assert (not b!750648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

