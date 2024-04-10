; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65612 () Bool)

(assert start!65612)

(declare-fun b!750573 () Bool)

(declare-datatypes ((Unit!25804 0))(
  ( (Unit!25805) )
))
(declare-fun e!418766 () Unit!25804)

(declare-fun Unit!25806 () Unit!25804)

(assert (=> b!750573 (= e!418766 Unit!25806)))

(assert (=> b!750573 false))

(declare-fun b!750574 () Bool)

(declare-fun res!506619 () Bool)

(declare-fun e!418757 () Bool)

(assert (=> b!750574 (=> (not res!506619) (not e!418757))))

(declare-datatypes ((array!41785 0))(
  ( (array!41786 (arr!20006 (Array (_ BitVec 32) (_ BitVec 64))) (size!20427 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41785)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41785 (_ BitVec 32)) Bool)

(assert (=> b!750574 (= res!506619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750575 () Bool)

(declare-fun res!506610 () Bool)

(declare-fun e!418765 () Bool)

(assert (=> b!750575 (=> (not res!506610) (not e!418765))))

(declare-fun e!418760 () Bool)

(assert (=> b!750575 (= res!506610 e!418760)))

(declare-fun c!82365 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750575 (= c!82365 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750576 () Bool)

(declare-fun Unit!25807 () Unit!25804)

(assert (=> b!750576 (= e!418766 Unit!25807)))

(declare-fun b!750577 () Bool)

(declare-fun e!418758 () Bool)

(declare-fun e!418759 () Bool)

(assert (=> b!750577 (= e!418758 (not e!418759))))

(declare-fun res!506618 () Bool)

(assert (=> b!750577 (=> res!506618 e!418759)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7606 0))(
  ( (MissingZero!7606 (index!32792 (_ BitVec 32))) (Found!7606 (index!32793 (_ BitVec 32))) (Intermediate!7606 (undefined!8418 Bool) (index!32794 (_ BitVec 32)) (x!63716 (_ BitVec 32))) (Undefined!7606) (MissingVacant!7606 (index!32795 (_ BitVec 32))) )
))
(declare-fun lt!333755 () SeekEntryResult!7606)

(assert (=> b!750577 (= res!506618 (or (not (is-Intermediate!7606 lt!333755)) (bvslt x!1131 (x!63716 lt!333755)) (not (= x!1131 (x!63716 lt!333755))) (not (= index!1321 (index!32794 lt!333755)))))))

(declare-fun e!418763 () Bool)

(assert (=> b!750577 e!418763))

(declare-fun res!506621 () Bool)

(assert (=> b!750577 (=> (not res!506621) (not e!418763))))

(declare-fun lt!333752 () SeekEntryResult!7606)

(declare-fun lt!333751 () SeekEntryResult!7606)

(assert (=> b!750577 (= res!506621 (= lt!333752 lt!333751))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750577 (= lt!333751 (Found!7606 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!750577 (= lt!333752 (seekEntryOrOpen!0 (select (arr!20006 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750577 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333757 () Unit!25804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25804)

(assert (=> b!750577 (= lt!333757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!333753 () (_ BitVec 64))

(declare-fun b!750578 () Bool)

(declare-fun lt!333754 () array!41785)

(declare-fun e!418762 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!750578 (= e!418762 (= (seekEntryOrOpen!0 lt!333753 lt!333754 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333753 lt!333754 mask!3328)))))

(declare-fun b!750579 () Bool)

(declare-fun res!506604 () Bool)

(declare-fun e!418761 () Bool)

(assert (=> b!750579 (=> (not res!506604) (not e!418761))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750579 (= res!506604 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750580 () Bool)

(declare-fun res!506611 () Bool)

(assert (=> b!750580 (=> (not res!506611) (not e!418761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750580 (= res!506611 (validKeyInArray!0 (select (arr!20006 a!3186) j!159)))))

(declare-fun b!750581 () Bool)

(declare-fun e!418764 () Bool)

(assert (=> b!750581 (= e!418759 e!418764)))

(declare-fun res!506605 () Bool)

(assert (=> b!750581 (=> res!506605 e!418764)))

(declare-fun lt!333750 () (_ BitVec 64))

(assert (=> b!750581 (= res!506605 (= lt!333750 lt!333753))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750581 (= lt!333750 (select (store (arr!20006 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!333756 () SeekEntryResult!7606)

(declare-fun b!750582 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41785 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!750582 (= e!418760 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333756))))

(declare-fun res!506609 () Bool)

(assert (=> start!65612 (=> (not res!506609) (not e!418761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65612 (= res!506609 (validMask!0 mask!3328))))

(assert (=> start!65612 e!418761))

(assert (=> start!65612 true))

(declare-fun array_inv!15802 (array!41785) Bool)

(assert (=> start!65612 (array_inv!15802 a!3186)))

(declare-fun b!750583 () Bool)

(assert (=> b!750583 (= e!418764 true)))

(assert (=> b!750583 e!418762))

(declare-fun res!506612 () Bool)

(assert (=> b!750583 (=> (not res!506612) (not e!418762))))

(assert (=> b!750583 (= res!506612 (= lt!333750 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333749 () Unit!25804)

(assert (=> b!750583 (= lt!333749 e!418766)))

(declare-fun c!82366 () Bool)

(assert (=> b!750583 (= c!82366 (= lt!333750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!750584 () Bool)

(assert (=> b!750584 (= e!418760 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) (Found!7606 j!159)))))

(declare-fun b!750585 () Bool)

(declare-fun res!506615 () Bool)

(assert (=> b!750585 (=> (not res!506615) (not e!418757))))

(assert (=> b!750585 (= res!506615 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20427 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20427 a!3186))))))

(declare-fun b!750586 () Bool)

(declare-fun res!506613 () Bool)

(assert (=> b!750586 (=> res!506613 e!418759)))

(assert (=> b!750586 (= res!506613 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333751)))))

(declare-fun b!750587 () Bool)

(declare-fun res!506606 () Bool)

(assert (=> b!750587 (=> (not res!506606) (not e!418757))))

(declare-datatypes ((List!14008 0))(
  ( (Nil!14005) (Cons!14004 (h!15076 (_ BitVec 64)) (t!20323 List!14008)) )
))
(declare-fun arrayNoDuplicates!0 (array!41785 (_ BitVec 32) List!14008) Bool)

(assert (=> b!750587 (= res!506606 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14005))))

(declare-fun b!750588 () Bool)

(declare-fun res!506617 () Bool)

(assert (=> b!750588 (=> (not res!506617) (not e!418761))))

(assert (=> b!750588 (= res!506617 (validKeyInArray!0 k!2102))))

(declare-fun b!750589 () Bool)

(declare-fun res!506608 () Bool)

(assert (=> b!750589 (=> (not res!506608) (not e!418765))))

(assert (=> b!750589 (= res!506608 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20006 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750590 () Bool)

(assert (=> b!750590 (= e!418761 e!418757)))

(declare-fun res!506616 () Bool)

(assert (=> b!750590 (=> (not res!506616) (not e!418757))))

(declare-fun lt!333758 () SeekEntryResult!7606)

(assert (=> b!750590 (= res!506616 (or (= lt!333758 (MissingZero!7606 i!1173)) (= lt!333758 (MissingVacant!7606 i!1173))))))

(assert (=> b!750590 (= lt!333758 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750591 () Bool)

(assert (=> b!750591 (= e!418757 e!418765)))

(declare-fun res!506620 () Bool)

(assert (=> b!750591 (=> (not res!506620) (not e!418765))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750591 (= res!506620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20006 a!3186) j!159) mask!3328) (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333756))))

(assert (=> b!750591 (= lt!333756 (Intermediate!7606 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750592 () Bool)

(assert (=> b!750592 (= e!418763 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333751))))

(declare-fun b!750593 () Bool)

(assert (=> b!750593 (= e!418765 e!418758)))

(declare-fun res!506607 () Bool)

(assert (=> b!750593 (=> (not res!506607) (not e!418758))))

(declare-fun lt!333748 () SeekEntryResult!7606)

(assert (=> b!750593 (= res!506607 (= lt!333748 lt!333755))))

(assert (=> b!750593 (= lt!333755 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333753 lt!333754 mask!3328))))

(assert (=> b!750593 (= lt!333748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333753 mask!3328) lt!333753 lt!333754 mask!3328))))

(assert (=> b!750593 (= lt!333753 (select (store (arr!20006 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750593 (= lt!333754 (array!41786 (store (arr!20006 a!3186) i!1173 k!2102) (size!20427 a!3186)))))

(declare-fun b!750594 () Bool)

(declare-fun res!506614 () Bool)

(assert (=> b!750594 (=> (not res!506614) (not e!418761))))

(assert (=> b!750594 (= res!506614 (and (= (size!20427 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20427 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20427 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65612 res!506609) b!750594))

(assert (= (and b!750594 res!506614) b!750580))

(assert (= (and b!750580 res!506611) b!750588))

(assert (= (and b!750588 res!506617) b!750579))

(assert (= (and b!750579 res!506604) b!750590))

(assert (= (and b!750590 res!506616) b!750574))

(assert (= (and b!750574 res!506619) b!750587))

(assert (= (and b!750587 res!506606) b!750585))

(assert (= (and b!750585 res!506615) b!750591))

(assert (= (and b!750591 res!506620) b!750589))

(assert (= (and b!750589 res!506608) b!750575))

(assert (= (and b!750575 c!82365) b!750582))

(assert (= (and b!750575 (not c!82365)) b!750584))

(assert (= (and b!750575 res!506610) b!750593))

(assert (= (and b!750593 res!506607) b!750577))

(assert (= (and b!750577 res!506621) b!750592))

(assert (= (and b!750577 (not res!506618)) b!750586))

(assert (= (and b!750586 (not res!506613)) b!750581))

(assert (= (and b!750581 (not res!506605)) b!750583))

(assert (= (and b!750583 c!82366) b!750573))

(assert (= (and b!750583 (not c!82366)) b!750576))

(assert (= (and b!750583 res!506612) b!750578))

(declare-fun m!699939 () Bool)

(assert (=> b!750590 m!699939))

(declare-fun m!699941 () Bool)

(assert (=> start!65612 m!699941))

(declare-fun m!699943 () Bool)

(assert (=> start!65612 m!699943))

(declare-fun m!699945 () Bool)

(assert (=> b!750589 m!699945))

(declare-fun m!699947 () Bool)

(assert (=> b!750582 m!699947))

(assert (=> b!750582 m!699947))

(declare-fun m!699949 () Bool)

(assert (=> b!750582 m!699949))

(declare-fun m!699951 () Bool)

(assert (=> b!750578 m!699951))

(declare-fun m!699953 () Bool)

(assert (=> b!750578 m!699953))

(declare-fun m!699955 () Bool)

(assert (=> b!750574 m!699955))

(declare-fun m!699957 () Bool)

(assert (=> b!750579 m!699957))

(declare-fun m!699959 () Bool)

(assert (=> b!750587 m!699959))

(assert (=> b!750577 m!699947))

(assert (=> b!750577 m!699947))

(declare-fun m!699961 () Bool)

(assert (=> b!750577 m!699961))

(declare-fun m!699963 () Bool)

(assert (=> b!750577 m!699963))

(declare-fun m!699965 () Bool)

(assert (=> b!750577 m!699965))

(assert (=> b!750591 m!699947))

(assert (=> b!750591 m!699947))

(declare-fun m!699967 () Bool)

(assert (=> b!750591 m!699967))

(assert (=> b!750591 m!699967))

(assert (=> b!750591 m!699947))

(declare-fun m!699969 () Bool)

(assert (=> b!750591 m!699969))

(declare-fun m!699971 () Bool)

(assert (=> b!750581 m!699971))

(declare-fun m!699973 () Bool)

(assert (=> b!750581 m!699973))

(assert (=> b!750593 m!699971))

(declare-fun m!699975 () Bool)

(assert (=> b!750593 m!699975))

(declare-fun m!699977 () Bool)

(assert (=> b!750593 m!699977))

(assert (=> b!750593 m!699975))

(declare-fun m!699979 () Bool)

(assert (=> b!750593 m!699979))

(declare-fun m!699981 () Bool)

(assert (=> b!750593 m!699981))

(assert (=> b!750586 m!699947))

(assert (=> b!750586 m!699947))

(declare-fun m!699983 () Bool)

(assert (=> b!750586 m!699983))

(assert (=> b!750580 m!699947))

(assert (=> b!750580 m!699947))

(declare-fun m!699985 () Bool)

(assert (=> b!750580 m!699985))

(assert (=> b!750592 m!699947))

(assert (=> b!750592 m!699947))

(declare-fun m!699987 () Bool)

(assert (=> b!750592 m!699987))

(declare-fun m!699989 () Bool)

(assert (=> b!750588 m!699989))

(assert (=> b!750584 m!699947))

(assert (=> b!750584 m!699947))

(assert (=> b!750584 m!699983))

(push 1)

