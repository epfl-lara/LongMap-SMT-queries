; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64494 () Bool)

(assert start!64494)

(declare-fun b!725672 () Bool)

(declare-fun res!486756 () Bool)

(declare-fun e!406361 () Bool)

(assert (=> b!725672 (=> (not res!486756) (not e!406361))))

(declare-datatypes ((array!41012 0))(
  ( (array!41013 (arr!19627 (Array (_ BitVec 32) (_ BitVec 64))) (size!20048 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41012)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725672 (= res!486756 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725673 () Bool)

(declare-fun res!486753 () Bool)

(assert (=> b!725673 (=> (not res!486753) (not e!406361))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725673 (= res!486753 (validKeyInArray!0 (select (arr!19627 a!3186) j!159)))))

(declare-fun b!725674 () Bool)

(declare-fun res!486755 () Bool)

(assert (=> b!725674 (=> (not res!486755) (not e!406361))))

(assert (=> b!725674 (= res!486755 (validKeyInArray!0 k0!2102))))

(declare-fun b!725675 () Bool)

(declare-fun res!486754 () Bool)

(declare-fun e!406365 () Bool)

(assert (=> b!725675 (=> (not res!486754) (not e!406365))))

(declare-fun e!406367 () Bool)

(assert (=> b!725675 (= res!486754 e!406367)))

(declare-fun c!79837 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725675 (= c!79837 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725676 () Bool)

(declare-fun e!406362 () Bool)

(assert (=> b!725676 (= e!406361 e!406362)))

(declare-fun res!486750 () Bool)

(assert (=> b!725676 (=> (not res!486750) (not e!406362))))

(declare-datatypes ((SeekEntryResult!7227 0))(
  ( (MissingZero!7227 (index!31276 (_ BitVec 32))) (Found!7227 (index!31277 (_ BitVec 32))) (Intermediate!7227 (undefined!8039 Bool) (index!31278 (_ BitVec 32)) (x!62269 (_ BitVec 32))) (Undefined!7227) (MissingVacant!7227 (index!31279 (_ BitVec 32))) )
))
(declare-fun lt!321428 () SeekEntryResult!7227)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725676 (= res!486750 (or (= lt!321428 (MissingZero!7227 i!1173)) (= lt!321428 (MissingVacant!7227 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41012 (_ BitVec 32)) SeekEntryResult!7227)

(assert (=> b!725676 (= lt!321428 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!486752 () Bool)

(assert (=> start!64494 (=> (not res!486752) (not e!406361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64494 (= res!486752 (validMask!0 mask!3328))))

(assert (=> start!64494 e!406361))

(assert (=> start!64494 true))

(declare-fun array_inv!15423 (array!41012) Bool)

(assert (=> start!64494 (array_inv!15423 a!3186)))

(declare-fun b!725677 () Bool)

(declare-fun res!486747 () Bool)

(assert (=> b!725677 (=> (not res!486747) (not e!406365))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725677 (= res!486747 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19627 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725678 () Bool)

(declare-fun res!486746 () Bool)

(assert (=> b!725678 (=> (not res!486746) (not e!406362))))

(declare-datatypes ((List!13629 0))(
  ( (Nil!13626) (Cons!13625 (h!14682 (_ BitVec 64)) (t!19944 List!13629)) )
))
(declare-fun arrayNoDuplicates!0 (array!41012 (_ BitVec 32) List!13629) Bool)

(assert (=> b!725678 (= res!486746 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13626))))

(declare-fun b!725679 () Bool)

(declare-fun lt!321426 () SeekEntryResult!7227)

(declare-fun e!406363 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41012 (_ BitVec 32)) SeekEntryResult!7227)

(assert (=> b!725679 (= e!406363 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321426))))

(declare-fun b!725680 () Bool)

(declare-fun res!486745 () Bool)

(assert (=> b!725680 (=> (not res!486745) (not e!406362))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725680 (= res!486745 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20048 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20048 a!3186))))))

(declare-fun b!725681 () Bool)

(declare-fun res!486757 () Bool)

(assert (=> b!725681 (=> (not res!486757) (not e!406362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41012 (_ BitVec 32)) Bool)

(assert (=> b!725681 (= res!486757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725682 () Bool)

(declare-fun e!406364 () Bool)

(assert (=> b!725682 (= e!406364 e!406363)))

(declare-fun res!486758 () Bool)

(assert (=> b!725682 (=> (not res!486758) (not e!406363))))

(assert (=> b!725682 (= res!486758 (= (seekEntryOrOpen!0 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321426))))

(assert (=> b!725682 (= lt!321426 (Found!7227 j!159))))

(declare-fun b!725683 () Bool)

(assert (=> b!725683 (= e!406367 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) (Found!7227 j!159)))))

(declare-fun b!725684 () Bool)

(assert (=> b!725684 (= e!406362 e!406365)))

(declare-fun res!486744 () Bool)

(assert (=> b!725684 (=> (not res!486744) (not e!406365))))

(declare-fun lt!321431 () SeekEntryResult!7227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41012 (_ BitVec 32)) SeekEntryResult!7227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725684 (= res!486744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19627 a!3186) j!159) mask!3328) (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321431))))

(assert (=> b!725684 (= lt!321431 (Intermediate!7227 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725685 () Bool)

(declare-fun e!406366 () Bool)

(assert (=> b!725685 (= e!406366 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!725685 e!406364))

(declare-fun res!486751 () Bool)

(assert (=> b!725685 (=> (not res!486751) (not e!406364))))

(assert (=> b!725685 (= res!486751 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24772 0))(
  ( (Unit!24773) )
))
(declare-fun lt!321429 () Unit!24772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24772)

(assert (=> b!725685 (= lt!321429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725686 () Bool)

(declare-fun res!486749 () Bool)

(assert (=> b!725686 (=> (not res!486749) (not e!406361))))

(assert (=> b!725686 (= res!486749 (and (= (size!20048 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20048 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20048 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725687 () Bool)

(assert (=> b!725687 (= e!406367 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321431))))

(declare-fun b!725688 () Bool)

(assert (=> b!725688 (= e!406365 e!406366)))

(declare-fun res!486748 () Bool)

(assert (=> b!725688 (=> (not res!486748) (not e!406366))))

(declare-fun lt!321430 () (_ BitVec 64))

(declare-fun lt!321427 () array!41012)

(assert (=> b!725688 (= res!486748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321430 mask!3328) lt!321430 lt!321427 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321430 lt!321427 mask!3328)))))

(assert (=> b!725688 (= lt!321430 (select (store (arr!19627 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725688 (= lt!321427 (array!41013 (store (arr!19627 a!3186) i!1173 k0!2102) (size!20048 a!3186)))))

(assert (= (and start!64494 res!486752) b!725686))

(assert (= (and b!725686 res!486749) b!725673))

(assert (= (and b!725673 res!486753) b!725674))

(assert (= (and b!725674 res!486755) b!725672))

(assert (= (and b!725672 res!486756) b!725676))

(assert (= (and b!725676 res!486750) b!725681))

(assert (= (and b!725681 res!486757) b!725678))

(assert (= (and b!725678 res!486746) b!725680))

(assert (= (and b!725680 res!486745) b!725684))

(assert (= (and b!725684 res!486744) b!725677))

(assert (= (and b!725677 res!486747) b!725675))

(assert (= (and b!725675 c!79837) b!725687))

(assert (= (and b!725675 (not c!79837)) b!725683))

(assert (= (and b!725675 res!486754) b!725688))

(assert (= (and b!725688 res!486748) b!725685))

(assert (= (and b!725685 res!486751) b!725682))

(assert (= (and b!725682 res!486758) b!725679))

(declare-fun m!679811 () Bool)

(assert (=> b!725679 m!679811))

(assert (=> b!725679 m!679811))

(declare-fun m!679813 () Bool)

(assert (=> b!725679 m!679813))

(assert (=> b!725673 m!679811))

(assert (=> b!725673 m!679811))

(declare-fun m!679815 () Bool)

(assert (=> b!725673 m!679815))

(assert (=> b!725682 m!679811))

(assert (=> b!725682 m!679811))

(declare-fun m!679817 () Bool)

(assert (=> b!725682 m!679817))

(declare-fun m!679819 () Bool)

(assert (=> start!64494 m!679819))

(declare-fun m!679821 () Bool)

(assert (=> start!64494 m!679821))

(assert (=> b!725683 m!679811))

(assert (=> b!725683 m!679811))

(declare-fun m!679823 () Bool)

(assert (=> b!725683 m!679823))

(assert (=> b!725684 m!679811))

(assert (=> b!725684 m!679811))

(declare-fun m!679825 () Bool)

(assert (=> b!725684 m!679825))

(assert (=> b!725684 m!679825))

(assert (=> b!725684 m!679811))

(declare-fun m!679827 () Bool)

(assert (=> b!725684 m!679827))

(assert (=> b!725687 m!679811))

(assert (=> b!725687 m!679811))

(declare-fun m!679829 () Bool)

(assert (=> b!725687 m!679829))

(declare-fun m!679831 () Bool)

(assert (=> b!725674 m!679831))

(declare-fun m!679833 () Bool)

(assert (=> b!725688 m!679833))

(declare-fun m!679835 () Bool)

(assert (=> b!725688 m!679835))

(declare-fun m!679837 () Bool)

(assert (=> b!725688 m!679837))

(declare-fun m!679839 () Bool)

(assert (=> b!725688 m!679839))

(assert (=> b!725688 m!679833))

(declare-fun m!679841 () Bool)

(assert (=> b!725688 m!679841))

(declare-fun m!679843 () Bool)

(assert (=> b!725676 m!679843))

(declare-fun m!679845 () Bool)

(assert (=> b!725672 m!679845))

(declare-fun m!679847 () Bool)

(assert (=> b!725677 m!679847))

(declare-fun m!679849 () Bool)

(assert (=> b!725681 m!679849))

(declare-fun m!679851 () Bool)

(assert (=> b!725678 m!679851))

(declare-fun m!679853 () Bool)

(assert (=> b!725685 m!679853))

(declare-fun m!679855 () Bool)

(assert (=> b!725685 m!679855))

(check-sat (not b!725681) (not b!725672) (not start!64494) (not b!725673) (not b!725679) (not b!725674) (not b!725678) (not b!725688) (not b!725682) (not b!725676) (not b!725685) (not b!725687) (not b!725684) (not b!725683))
(check-sat)
