; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64484 () Bool)

(assert start!64484)

(declare-fun b!725680 () Bool)

(declare-fun res!486868 () Bool)

(declare-fun e!406331 () Bool)

(assert (=> b!725680 (=> (not res!486868) (not e!406331))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41019 0))(
  ( (array!41020 (arr!19631 (Array (_ BitVec 32) (_ BitVec 64))) (size!20052 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41019)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725680 (= res!486868 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19631 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725681 () Bool)

(declare-fun e!406332 () Bool)

(assert (=> b!725681 (= e!406332 e!406331)))

(declare-fun res!486873 () Bool)

(assert (=> b!725681 (=> (not res!486873) (not e!406331))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7228 0))(
  ( (MissingZero!7228 (index!31280 (_ BitVec 32))) (Found!7228 (index!31281 (_ BitVec 32))) (Intermediate!7228 (undefined!8040 Bool) (index!31282 (_ BitVec 32)) (x!62281 (_ BitVec 32))) (Undefined!7228) (MissingVacant!7228 (index!31283 (_ BitVec 32))) )
))
(declare-fun lt!321278 () SeekEntryResult!7228)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41019 (_ BitVec 32)) SeekEntryResult!7228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725681 (= res!486873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19631 a!3186) j!159) mask!3328) (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321278))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725681 (= lt!321278 (Intermediate!7228 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725682 () Bool)

(declare-fun e!406336 () Bool)

(declare-fun lt!321280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725682 (= e!406336 (validKeyInArray!0 lt!321280))))

(declare-fun b!725683 () Bool)

(declare-fun res!486876 () Bool)

(declare-fun e!406334 () Bool)

(assert (=> b!725683 (=> (not res!486876) (not e!406334))))

(assert (=> b!725683 (= res!486876 (validKeyInArray!0 (select (arr!19631 a!3186) j!159)))))

(declare-fun b!725684 () Bool)

(declare-fun res!486874 () Bool)

(assert (=> b!725684 (=> (not res!486874) (not e!406332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41019 (_ BitVec 32)) Bool)

(assert (=> b!725684 (= res!486874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725685 () Bool)

(declare-fun e!406329 () Bool)

(assert (=> b!725685 (= e!406331 e!406329)))

(declare-fun res!486867 () Bool)

(assert (=> b!725685 (=> (not res!486867) (not e!406329))))

(declare-fun lt!321276 () array!41019)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725685 (= res!486867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321280 mask!3328) lt!321280 lt!321276 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321280 lt!321276 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725685 (= lt!321280 (select (store (arr!19631 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725685 (= lt!321276 (array!41020 (store (arr!19631 a!3186) i!1173 k0!2102) (size!20052 a!3186)))))

(declare-fun b!725686 () Bool)

(declare-fun res!486869 () Bool)

(assert (=> b!725686 (=> (not res!486869) (not e!406332))))

(declare-datatypes ((List!13672 0))(
  ( (Nil!13669) (Cons!13668 (h!14725 (_ BitVec 64)) (t!19978 List!13672)) )
))
(declare-fun arrayNoDuplicates!0 (array!41019 (_ BitVec 32) List!13672) Bool)

(assert (=> b!725686 (= res!486869 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13669))))

(declare-fun b!725687 () Bool)

(declare-fun res!486862 () Bool)

(assert (=> b!725687 (=> (not res!486862) (not e!406334))))

(assert (=> b!725687 (= res!486862 (and (= (size!20052 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20052 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20052 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!486871 () Bool)

(assert (=> start!64484 (=> (not res!486871) (not e!406334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64484 (= res!486871 (validMask!0 mask!3328))))

(assert (=> start!64484 e!406334))

(assert (=> start!64484 true))

(declare-fun array_inv!15514 (array!41019) Bool)

(assert (=> start!64484 (array_inv!15514 a!3186)))

(declare-fun b!725679 () Bool)

(assert (=> b!725679 (= e!406329 (not e!406336))))

(declare-fun res!486870 () Bool)

(assert (=> b!725679 (=> res!486870 e!406336)))

(assert (=> b!725679 (= res!486870 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!406335 () Bool)

(assert (=> b!725679 e!406335))

(declare-fun res!486863 () Bool)

(assert (=> b!725679 (=> (not res!486863) (not e!406335))))

(assert (=> b!725679 (= res!486863 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24746 0))(
  ( (Unit!24747) )
))
(declare-fun lt!321277 () Unit!24746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24746)

(assert (=> b!725679 (= lt!321277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725688 () Bool)

(declare-fun res!486861 () Bool)

(assert (=> b!725688 (=> (not res!486861) (not e!406331))))

(declare-fun e!406328 () Bool)

(assert (=> b!725688 (= res!486861 e!406328)))

(declare-fun c!79782 () Bool)

(assert (=> b!725688 (= c!79782 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725689 () Bool)

(declare-fun e!406333 () Bool)

(assert (=> b!725689 (= e!406335 e!406333)))

(declare-fun res!486866 () Bool)

(assert (=> b!725689 (=> (not res!486866) (not e!406333))))

(declare-fun lt!321281 () SeekEntryResult!7228)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41019 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!725689 (= res!486866 (= (seekEntryOrOpen!0 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321281))))

(assert (=> b!725689 (= lt!321281 (Found!7228 j!159))))

(declare-fun b!725690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41019 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!725690 (= e!406328 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) (Found!7228 j!159)))))

(declare-fun b!725691 () Bool)

(declare-fun res!486864 () Bool)

(assert (=> b!725691 (=> (not res!486864) (not e!406334))))

(declare-fun arrayContainsKey!0 (array!41019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725691 (= res!486864 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725692 () Bool)

(assert (=> b!725692 (= e!406333 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321281))))

(declare-fun b!725693 () Bool)

(assert (=> b!725693 (= e!406334 e!406332)))

(declare-fun res!486865 () Bool)

(assert (=> b!725693 (=> (not res!486865) (not e!406332))))

(declare-fun lt!321279 () SeekEntryResult!7228)

(assert (=> b!725693 (= res!486865 (or (= lt!321279 (MissingZero!7228 i!1173)) (= lt!321279 (MissingVacant!7228 i!1173))))))

(assert (=> b!725693 (= lt!321279 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725694 () Bool)

(assert (=> b!725694 (= e!406328 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321278))))

(declare-fun b!725695 () Bool)

(declare-fun res!486875 () Bool)

(assert (=> b!725695 (=> (not res!486875) (not e!406332))))

(assert (=> b!725695 (= res!486875 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20052 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20052 a!3186))))))

(declare-fun b!725696 () Bool)

(declare-fun res!486872 () Bool)

(assert (=> b!725696 (=> (not res!486872) (not e!406334))))

(assert (=> b!725696 (= res!486872 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64484 res!486871) b!725687))

(assert (= (and b!725687 res!486862) b!725683))

(assert (= (and b!725683 res!486876) b!725696))

(assert (= (and b!725696 res!486872) b!725691))

(assert (= (and b!725691 res!486864) b!725693))

(assert (= (and b!725693 res!486865) b!725684))

(assert (= (and b!725684 res!486874) b!725686))

(assert (= (and b!725686 res!486869) b!725695))

(assert (= (and b!725695 res!486875) b!725681))

(assert (= (and b!725681 res!486873) b!725680))

(assert (= (and b!725680 res!486868) b!725688))

(assert (= (and b!725688 c!79782) b!725694))

(assert (= (and b!725688 (not c!79782)) b!725690))

(assert (= (and b!725688 res!486861) b!725685))

(assert (= (and b!725685 res!486867) b!725679))

(assert (= (and b!725679 res!486863) b!725689))

(assert (= (and b!725689 res!486866) b!725692))

(assert (= (and b!725679 (not res!486870)) b!725682))

(declare-fun m!679283 () Bool)

(assert (=> b!725691 m!679283))

(declare-fun m!679285 () Bool)

(assert (=> start!64484 m!679285))

(declare-fun m!679287 () Bool)

(assert (=> start!64484 m!679287))

(declare-fun m!679289 () Bool)

(assert (=> b!725686 m!679289))

(declare-fun m!679291 () Bool)

(assert (=> b!725682 m!679291))

(declare-fun m!679293 () Bool)

(assert (=> b!725689 m!679293))

(assert (=> b!725689 m!679293))

(declare-fun m!679295 () Bool)

(assert (=> b!725689 m!679295))

(declare-fun m!679297 () Bool)

(assert (=> b!725684 m!679297))

(declare-fun m!679299 () Bool)

(assert (=> b!725680 m!679299))

(declare-fun m!679301 () Bool)

(assert (=> b!725685 m!679301))

(declare-fun m!679303 () Bool)

(assert (=> b!725685 m!679303))

(declare-fun m!679305 () Bool)

(assert (=> b!725685 m!679305))

(declare-fun m!679307 () Bool)

(assert (=> b!725685 m!679307))

(assert (=> b!725685 m!679301))

(declare-fun m!679309 () Bool)

(assert (=> b!725685 m!679309))

(declare-fun m!679311 () Bool)

(assert (=> b!725696 m!679311))

(assert (=> b!725681 m!679293))

(assert (=> b!725681 m!679293))

(declare-fun m!679313 () Bool)

(assert (=> b!725681 m!679313))

(assert (=> b!725681 m!679313))

(assert (=> b!725681 m!679293))

(declare-fun m!679315 () Bool)

(assert (=> b!725681 m!679315))

(assert (=> b!725690 m!679293))

(assert (=> b!725690 m!679293))

(declare-fun m!679317 () Bool)

(assert (=> b!725690 m!679317))

(assert (=> b!725683 m!679293))

(assert (=> b!725683 m!679293))

(declare-fun m!679319 () Bool)

(assert (=> b!725683 m!679319))

(assert (=> b!725692 m!679293))

(assert (=> b!725692 m!679293))

(declare-fun m!679321 () Bool)

(assert (=> b!725692 m!679321))

(declare-fun m!679323 () Bool)

(assert (=> b!725679 m!679323))

(declare-fun m!679325 () Bool)

(assert (=> b!725679 m!679325))

(declare-fun m!679327 () Bool)

(assert (=> b!725693 m!679327))

(assert (=> b!725694 m!679293))

(assert (=> b!725694 m!679293))

(declare-fun m!679329 () Bool)

(assert (=> b!725694 m!679329))

(check-sat (not start!64484) (not b!725681) (not b!725692) (not b!725686) (not b!725683) (not b!725696) (not b!725694) (not b!725691) (not b!725693) (not b!725689) (not b!725685) (not b!725684) (not b!725682) (not b!725690) (not b!725679))
(check-sat)
