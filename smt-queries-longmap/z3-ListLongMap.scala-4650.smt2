; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64800 () Bool)

(assert start!64800)

(declare-fun b!729647 () Bool)

(declare-fun e!408479 () Bool)

(declare-fun e!408476 () Bool)

(assert (=> b!729647 (= e!408479 e!408476)))

(declare-fun res!489680 () Bool)

(assert (=> b!729647 (=> (not res!489680) (not e!408476))))

(declare-datatypes ((array!41119 0))(
  ( (array!41120 (arr!19675 (Array (_ BitVec 32) (_ BitVec 64))) (size!20095 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41119)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7231 0))(
  ( (MissingZero!7231 (index!31292 (_ BitVec 32))) (Found!7231 (index!31293 (_ BitVec 32))) (Intermediate!7231 (undefined!8043 Bool) (index!31294 (_ BitVec 32)) (x!62441 (_ BitVec 32))) (Undefined!7231) (MissingVacant!7231 (index!31295 (_ BitVec 32))) )
))
(declare-fun lt!323212 () SeekEntryResult!7231)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729647 (= res!489680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19675 a!3186) j!159) mask!3328) (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!323212))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729647 (= lt!323212 (Intermediate!7231 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729649 () Bool)

(declare-fun res!489673 () Bool)

(assert (=> b!729649 (=> (not res!489673) (not e!408476))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729649 (= res!489673 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19675 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729650 () Bool)

(declare-fun res!489672 () Bool)

(assert (=> b!729650 (=> (not res!489672) (not e!408479))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!729650 (= res!489672 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20095 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20095 a!3186))))))

(declare-fun b!729651 () Bool)

(declare-fun e!408480 () Bool)

(assert (=> b!729651 (= e!408480 e!408479)))

(declare-fun res!489675 () Bool)

(assert (=> b!729651 (=> (not res!489675) (not e!408479))))

(declare-fun lt!323211 () SeekEntryResult!7231)

(assert (=> b!729651 (= res!489675 (or (= lt!323211 (MissingZero!7231 i!1173)) (= lt!323211 (MissingVacant!7231 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!729651 (= lt!323211 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729652 () Bool)

(declare-fun e!408475 () Bool)

(assert (=> b!729652 (= e!408476 e!408475)))

(declare-fun res!489678 () Bool)

(assert (=> b!729652 (=> (not res!489678) (not e!408475))))

(declare-fun lt!323214 () SeekEntryResult!7231)

(declare-fun lt!323207 () SeekEntryResult!7231)

(assert (=> b!729652 (= res!489678 (= lt!323214 lt!323207))))

(declare-fun lt!323209 () array!41119)

(declare-fun lt!323213 () (_ BitVec 64))

(assert (=> b!729652 (= lt!323207 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323213 lt!323209 mask!3328))))

(assert (=> b!729652 (= lt!323214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323213 mask!3328) lt!323213 lt!323209 mask!3328))))

(assert (=> b!729652 (= lt!323213 (select (store (arr!19675 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729652 (= lt!323209 (array!41120 (store (arr!19675 a!3186) i!1173 k0!2102) (size!20095 a!3186)))))

(declare-fun b!729653 () Bool)

(declare-fun res!489679 () Bool)

(assert (=> b!729653 (=> (not res!489679) (not e!408480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729653 (= res!489679 (validKeyInArray!0 k0!2102))))

(declare-fun e!408473 () Bool)

(declare-fun b!729654 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!729654 (= e!408473 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) (Found!7231 j!159)))))

(declare-fun b!729655 () Bool)

(declare-fun res!489684 () Bool)

(assert (=> b!729655 (=> (not res!489684) (not e!408480))))

(declare-fun arrayContainsKey!0 (array!41119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729655 (= res!489684 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729656 () Bool)

(declare-fun res!489685 () Bool)

(assert (=> b!729656 (=> (not res!489685) (not e!408479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41119 (_ BitVec 32)) Bool)

(assert (=> b!729656 (= res!489685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729657 () Bool)

(declare-fun e!408477 () Bool)

(declare-fun e!408474 () Bool)

(assert (=> b!729657 (= e!408477 e!408474)))

(declare-fun res!489682 () Bool)

(assert (=> b!729657 (=> (not res!489682) (not e!408474))))

(declare-fun lt!323208 () SeekEntryResult!7231)

(assert (=> b!729657 (= res!489682 (= (seekEntryOrOpen!0 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!323208))))

(assert (=> b!729657 (= lt!323208 (Found!7231 j!159))))

(declare-fun b!729658 () Bool)

(declare-fun e!408478 () Bool)

(assert (=> b!729658 (= e!408475 (not e!408478))))

(declare-fun res!489674 () Bool)

(assert (=> b!729658 (=> res!489674 e!408478)))

(get-info :version)

(assert (=> b!729658 (= res!489674 (or (not ((_ is Intermediate!7231) lt!323207)) (bvsge x!1131 (x!62441 lt!323207))))))

(assert (=> b!729658 e!408477))

(declare-fun res!489676 () Bool)

(assert (=> b!729658 (=> (not res!489676) (not e!408477))))

(assert (=> b!729658 (= res!489676 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24859 0))(
  ( (Unit!24860) )
))
(declare-fun lt!323206 () Unit!24859)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24859)

(assert (=> b!729658 (= lt!323206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729659 () Bool)

(declare-fun res!489683 () Bool)

(assert (=> b!729659 (=> (not res!489683) (not e!408476))))

(assert (=> b!729659 (= res!489683 e!408473)))

(declare-fun c!80366 () Bool)

(assert (=> b!729659 (= c!80366 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729660 () Bool)

(declare-fun res!489681 () Bool)

(assert (=> b!729660 (=> (not res!489681) (not e!408479))))

(declare-datatypes ((List!13584 0))(
  ( (Nil!13581) (Cons!13580 (h!14646 (_ BitVec 64)) (t!19891 List!13584)) )
))
(declare-fun arrayNoDuplicates!0 (array!41119 (_ BitVec 32) List!13584) Bool)

(assert (=> b!729660 (= res!489681 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13581))))

(declare-fun b!729648 () Bool)

(assert (=> b!729648 (= e!408478 true)))

(declare-fun lt!323210 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729648 (= lt!323210 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun res!489671 () Bool)

(assert (=> start!64800 (=> (not res!489671) (not e!408480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64800 (= res!489671 (validMask!0 mask!3328))))

(assert (=> start!64800 e!408480))

(assert (=> start!64800 true))

(declare-fun array_inv!15534 (array!41119) Bool)

(assert (=> start!64800 (array_inv!15534 a!3186)))

(declare-fun b!729661 () Bool)

(assert (=> b!729661 (= e!408474 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!323208))))

(declare-fun b!729662 () Bool)

(declare-fun res!489677 () Bool)

(assert (=> b!729662 (=> (not res!489677) (not e!408480))))

(assert (=> b!729662 (= res!489677 (validKeyInArray!0 (select (arr!19675 a!3186) j!159)))))

(declare-fun b!729663 () Bool)

(declare-fun res!489670 () Bool)

(assert (=> b!729663 (=> (not res!489670) (not e!408480))))

(assert (=> b!729663 (= res!489670 (and (= (size!20095 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20095 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20095 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729664 () Bool)

(assert (=> b!729664 (= e!408473 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!323212))))

(assert (= (and start!64800 res!489671) b!729663))

(assert (= (and b!729663 res!489670) b!729662))

(assert (= (and b!729662 res!489677) b!729653))

(assert (= (and b!729653 res!489679) b!729655))

(assert (= (and b!729655 res!489684) b!729651))

(assert (= (and b!729651 res!489675) b!729656))

(assert (= (and b!729656 res!489685) b!729660))

(assert (= (and b!729660 res!489681) b!729650))

(assert (= (and b!729650 res!489672) b!729647))

(assert (= (and b!729647 res!489680) b!729649))

(assert (= (and b!729649 res!489673) b!729659))

(assert (= (and b!729659 c!80366) b!729664))

(assert (= (and b!729659 (not c!80366)) b!729654))

(assert (= (and b!729659 res!489683) b!729652))

(assert (= (and b!729652 res!489678) b!729658))

(assert (= (and b!729658 res!489676) b!729657))

(assert (= (and b!729657 res!489682) b!729661))

(assert (= (and b!729658 (not res!489674)) b!729648))

(declare-fun m!683739 () Bool)

(assert (=> b!729655 m!683739))

(declare-fun m!683741 () Bool)

(assert (=> b!729647 m!683741))

(assert (=> b!729647 m!683741))

(declare-fun m!683743 () Bool)

(assert (=> b!729647 m!683743))

(assert (=> b!729647 m!683743))

(assert (=> b!729647 m!683741))

(declare-fun m!683745 () Bool)

(assert (=> b!729647 m!683745))

(declare-fun m!683747 () Bool)

(assert (=> b!729649 m!683747))

(declare-fun m!683749 () Bool)

(assert (=> b!729658 m!683749))

(declare-fun m!683751 () Bool)

(assert (=> b!729658 m!683751))

(declare-fun m!683753 () Bool)

(assert (=> b!729656 m!683753))

(assert (=> b!729654 m!683741))

(assert (=> b!729654 m!683741))

(declare-fun m!683755 () Bool)

(assert (=> b!729654 m!683755))

(assert (=> b!729661 m!683741))

(assert (=> b!729661 m!683741))

(declare-fun m!683757 () Bool)

(assert (=> b!729661 m!683757))

(declare-fun m!683759 () Bool)

(assert (=> start!64800 m!683759))

(declare-fun m!683761 () Bool)

(assert (=> start!64800 m!683761))

(declare-fun m!683763 () Bool)

(assert (=> b!729653 m!683763))

(declare-fun m!683765 () Bool)

(assert (=> b!729651 m!683765))

(declare-fun m!683767 () Bool)

(assert (=> b!729648 m!683767))

(assert (=> b!729664 m!683741))

(assert (=> b!729664 m!683741))

(declare-fun m!683769 () Bool)

(assert (=> b!729664 m!683769))

(declare-fun m!683771 () Bool)

(assert (=> b!729660 m!683771))

(assert (=> b!729662 m!683741))

(assert (=> b!729662 m!683741))

(declare-fun m!683773 () Bool)

(assert (=> b!729662 m!683773))

(assert (=> b!729657 m!683741))

(assert (=> b!729657 m!683741))

(declare-fun m!683775 () Bool)

(assert (=> b!729657 m!683775))

(declare-fun m!683777 () Bool)

(assert (=> b!729652 m!683777))

(declare-fun m!683779 () Bool)

(assert (=> b!729652 m!683779))

(declare-fun m!683781 () Bool)

(assert (=> b!729652 m!683781))

(declare-fun m!683783 () Bool)

(assert (=> b!729652 m!683783))

(declare-fun m!683785 () Bool)

(assert (=> b!729652 m!683785))

(assert (=> b!729652 m!683779))

(check-sat (not b!729653) (not b!729657) (not start!64800) (not b!729654) (not b!729652) (not b!729660) (not b!729662) (not b!729647) (not b!729651) (not b!729656) (not b!729664) (not b!729658) (not b!729655) (not b!729661) (not b!729648))
(check-sat)
