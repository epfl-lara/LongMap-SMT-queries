; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64526 () Bool)

(assert start!64526)

(declare-fun b!726777 () Bool)

(declare-fun res!487838 () Bool)

(declare-fun e!406865 () Bool)

(assert (=> b!726777 (=> (not res!487838) (not e!406865))))

(declare-datatypes ((array!41061 0))(
  ( (array!41062 (arr!19652 (Array (_ BitVec 32) (_ BitVec 64))) (size!20073 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41061)

(declare-datatypes ((List!13693 0))(
  ( (Nil!13690) (Cons!13689 (h!14746 (_ BitVec 64)) (t!19999 List!13693)) )
))
(declare-fun arrayNoDuplicates!0 (array!41061 (_ BitVec 32) List!13693) Bool)

(assert (=> b!726777 (= res!487838 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13690))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7249 0))(
  ( (MissingZero!7249 (index!31364 (_ BitVec 32))) (Found!7249 (index!31365 (_ BitVec 32))) (Intermediate!7249 (undefined!8061 Bool) (index!31366 (_ BitVec 32)) (x!62358 (_ BitVec 32))) (Undefined!7249) (MissingVacant!7249 (index!31367 (_ BitVec 32))) )
))
(declare-fun lt!321758 () SeekEntryResult!7249)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!726778 () Bool)

(declare-fun e!406861 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41061 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726778 (= e!406861 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321758))))

(declare-fun b!726779 () Bool)

(declare-fun e!406867 () Bool)

(declare-fun e!406862 () Bool)

(assert (=> b!726779 (= e!406867 e!406862)))

(declare-fun res!487845 () Bool)

(assert (=> b!726779 (=> (not res!487845) (not e!406862))))

(declare-fun lt!321750 () SeekEntryResult!7249)

(declare-fun lt!321754 () SeekEntryResult!7249)

(assert (=> b!726779 (= res!487845 (= lt!321750 lt!321754))))

(declare-fun lt!321755 () array!41061)

(declare-fun lt!321752 () (_ BitVec 64))

(assert (=> b!726779 (= lt!321754 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321752 lt!321755 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726779 (= lt!321750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321752 mask!3328) lt!321752 lt!321755 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726779 (= lt!321752 (select (store (arr!19652 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726779 (= lt!321755 (array!41062 (store (arr!19652 a!3186) i!1173 k0!2102) (size!20073 a!3186)))))

(declare-fun b!726780 () Bool)

(declare-fun e!406864 () Bool)

(assert (=> b!726780 (= e!406864 true)))

(declare-fun lt!321756 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726780 (= lt!321756 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!487848 () Bool)

(declare-fun e!406859 () Bool)

(assert (=> start!64526 (=> (not res!487848) (not e!406859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64526 (= res!487848 (validMask!0 mask!3328))))

(assert (=> start!64526 e!406859))

(assert (=> start!64526 true))

(declare-fun array_inv!15535 (array!41061) Bool)

(assert (=> start!64526 (array_inv!15535 a!3186)))

(declare-fun b!726781 () Bool)

(assert (=> b!726781 (= e!406862 (not e!406864))))

(declare-fun res!487847 () Bool)

(assert (=> b!726781 (=> res!487847 e!406864)))

(get-info :version)

(assert (=> b!726781 (= res!487847 (or (not ((_ is Intermediate!7249) lt!321754)) (bvsge x!1131 (x!62358 lt!321754))))))

(declare-fun e!406860 () Bool)

(assert (=> b!726781 e!406860))

(declare-fun res!487836 () Bool)

(assert (=> b!726781 (=> (not res!487836) (not e!406860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41061 (_ BitVec 32)) Bool)

(assert (=> b!726781 (= res!487836 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24788 0))(
  ( (Unit!24789) )
))
(declare-fun lt!321757 () Unit!24788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24788)

(assert (=> b!726781 (= lt!321757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726782 () Bool)

(declare-fun res!487842 () Bool)

(assert (=> b!726782 (=> (not res!487842) (not e!406867))))

(assert (=> b!726782 (= res!487842 e!406861)))

(declare-fun c!79845 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726782 (= c!79845 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726783 () Bool)

(declare-fun res!487835 () Bool)

(assert (=> b!726783 (=> (not res!487835) (not e!406865))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!726783 (= res!487835 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20073 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20073 a!3186))))))

(declare-fun b!726784 () Bool)

(assert (=> b!726784 (= e!406865 e!406867)))

(declare-fun res!487841 () Bool)

(assert (=> b!726784 (=> (not res!487841) (not e!406867))))

(assert (=> b!726784 (= res!487841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19652 a!3186) j!159) mask!3328) (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321758))))

(assert (=> b!726784 (= lt!321758 (Intermediate!7249 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726785 () Bool)

(declare-fun res!487839 () Bool)

(assert (=> b!726785 (=> (not res!487839) (not e!406859))))

(assert (=> b!726785 (= res!487839 (and (= (size!20073 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20073 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20073 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726786 () Bool)

(declare-fun e!406863 () Bool)

(assert (=> b!726786 (= e!406860 e!406863)))

(declare-fun res!487840 () Bool)

(assert (=> b!726786 (=> (not res!487840) (not e!406863))))

(declare-fun lt!321751 () SeekEntryResult!7249)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41061 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726786 (= res!487840 (= (seekEntryOrOpen!0 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321751))))

(assert (=> b!726786 (= lt!321751 (Found!7249 j!159))))

(declare-fun b!726787 () Bool)

(declare-fun res!487834 () Bool)

(assert (=> b!726787 (=> (not res!487834) (not e!406859))))

(declare-fun arrayContainsKey!0 (array!41061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726787 (= res!487834 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726788 () Bool)

(declare-fun res!487833 () Bool)

(assert (=> b!726788 (=> (not res!487833) (not e!406859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726788 (= res!487833 (validKeyInArray!0 k0!2102))))

(declare-fun b!726789 () Bool)

(declare-fun res!487837 () Bool)

(assert (=> b!726789 (=> (not res!487837) (not e!406867))))

(assert (=> b!726789 (= res!487837 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19652 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726790 () Bool)

(declare-fun res!487843 () Bool)

(assert (=> b!726790 (=> (not res!487843) (not e!406865))))

(assert (=> b!726790 (= res!487843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41061 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726791 (= e!406863 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321751))))

(declare-fun b!726792 () Bool)

(assert (=> b!726792 (= e!406859 e!406865)))

(declare-fun res!487846 () Bool)

(assert (=> b!726792 (=> (not res!487846) (not e!406865))))

(declare-fun lt!321753 () SeekEntryResult!7249)

(assert (=> b!726792 (= res!487846 (or (= lt!321753 (MissingZero!7249 i!1173)) (= lt!321753 (MissingVacant!7249 i!1173))))))

(assert (=> b!726792 (= lt!321753 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726793 () Bool)

(declare-fun res!487844 () Bool)

(assert (=> b!726793 (=> (not res!487844) (not e!406859))))

(assert (=> b!726793 (= res!487844 (validKeyInArray!0 (select (arr!19652 a!3186) j!159)))))

(declare-fun b!726794 () Bool)

(assert (=> b!726794 (= e!406861 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) (Found!7249 j!159)))))

(assert (= (and start!64526 res!487848) b!726785))

(assert (= (and b!726785 res!487839) b!726793))

(assert (= (and b!726793 res!487844) b!726788))

(assert (= (and b!726788 res!487833) b!726787))

(assert (= (and b!726787 res!487834) b!726792))

(assert (= (and b!726792 res!487846) b!726790))

(assert (= (and b!726790 res!487843) b!726777))

(assert (= (and b!726777 res!487838) b!726783))

(assert (= (and b!726783 res!487835) b!726784))

(assert (= (and b!726784 res!487841) b!726789))

(assert (= (and b!726789 res!487837) b!726782))

(assert (= (and b!726782 c!79845) b!726778))

(assert (= (and b!726782 (not c!79845)) b!726794))

(assert (= (and b!726782 res!487842) b!726779))

(assert (= (and b!726779 res!487845) b!726781))

(assert (= (and b!726781 res!487836) b!726786))

(assert (= (and b!726786 res!487840) b!726791))

(assert (= (and b!726781 (not res!487847)) b!726780))

(declare-fun m!680267 () Bool)

(assert (=> b!726780 m!680267))

(declare-fun m!680269 () Bool)

(assert (=> b!726778 m!680269))

(assert (=> b!726778 m!680269))

(declare-fun m!680271 () Bool)

(assert (=> b!726778 m!680271))

(declare-fun m!680273 () Bool)

(assert (=> b!726777 m!680273))

(declare-fun m!680275 () Bool)

(assert (=> b!726787 m!680275))

(declare-fun m!680277 () Bool)

(assert (=> b!726788 m!680277))

(assert (=> b!726793 m!680269))

(assert (=> b!726793 m!680269))

(declare-fun m!680279 () Bool)

(assert (=> b!726793 m!680279))

(assert (=> b!726794 m!680269))

(assert (=> b!726794 m!680269))

(declare-fun m!680281 () Bool)

(assert (=> b!726794 m!680281))

(assert (=> b!726786 m!680269))

(assert (=> b!726786 m!680269))

(declare-fun m!680283 () Bool)

(assert (=> b!726786 m!680283))

(declare-fun m!680285 () Bool)

(assert (=> start!64526 m!680285))

(declare-fun m!680287 () Bool)

(assert (=> start!64526 m!680287))

(declare-fun m!680289 () Bool)

(assert (=> b!726779 m!680289))

(declare-fun m!680291 () Bool)

(assert (=> b!726779 m!680291))

(declare-fun m!680293 () Bool)

(assert (=> b!726779 m!680293))

(assert (=> b!726779 m!680293))

(declare-fun m!680295 () Bool)

(assert (=> b!726779 m!680295))

(declare-fun m!680297 () Bool)

(assert (=> b!726779 m!680297))

(assert (=> b!726791 m!680269))

(assert (=> b!726791 m!680269))

(declare-fun m!680299 () Bool)

(assert (=> b!726791 m!680299))

(declare-fun m!680301 () Bool)

(assert (=> b!726792 m!680301))

(declare-fun m!680303 () Bool)

(assert (=> b!726790 m!680303))

(declare-fun m!680305 () Bool)

(assert (=> b!726789 m!680305))

(declare-fun m!680307 () Bool)

(assert (=> b!726781 m!680307))

(declare-fun m!680309 () Bool)

(assert (=> b!726781 m!680309))

(assert (=> b!726784 m!680269))

(assert (=> b!726784 m!680269))

(declare-fun m!680311 () Bool)

(assert (=> b!726784 m!680311))

(assert (=> b!726784 m!680311))

(assert (=> b!726784 m!680269))

(declare-fun m!680313 () Bool)

(assert (=> b!726784 m!680313))

(check-sat (not b!726788) (not b!726784) (not start!64526) (not b!726781) (not b!726778) (not b!726786) (not b!726794) (not b!726779) (not b!726792) (not b!726793) (not b!726790) (not b!726780) (not b!726777) (not b!726787) (not b!726791))
(check-sat)
