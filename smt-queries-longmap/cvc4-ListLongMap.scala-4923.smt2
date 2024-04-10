; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67786 () Bool)

(assert start!67786)

(declare-fun b!787829 () Bool)

(declare-fun res!533651 () Bool)

(declare-fun e!437905 () Bool)

(assert (=> b!787829 (=> (not res!533651) (not e!437905))))

(declare-datatypes ((array!42826 0))(
  ( (array!42827 (arr!20501 (Array (_ BitVec 32) (_ BitVec 64))) (size!20922 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42826)

(declare-datatypes ((List!14503 0))(
  ( (Nil!14500) (Cons!14499 (h!15622 (_ BitVec 64)) (t!20818 List!14503)) )
))
(declare-fun arrayNoDuplicates!0 (array!42826 (_ BitVec 32) List!14503) Bool)

(assert (=> b!787829 (= res!533651 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14500))))

(declare-fun b!787830 () Bool)

(declare-fun res!533652 () Bool)

(declare-fun e!437901 () Bool)

(assert (=> b!787830 (=> (not res!533652) (not e!437901))))

(declare-fun e!437903 () Bool)

(assert (=> b!787830 (= res!533652 e!437903)))

(declare-fun c!87505 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787830 (= c!87505 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787831 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8101 0))(
  ( (MissingZero!8101 (index!34772 (_ BitVec 32))) (Found!8101 (index!34773 (_ BitVec 32))) (Intermediate!8101 (undefined!8913 Bool) (index!34774 (_ BitVec 32)) (x!65705 (_ BitVec 32))) (Undefined!8101) (MissingVacant!8101 (index!34775 (_ BitVec 32))) )
))
(declare-fun lt!351454 () SeekEntryResult!8101)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!787831 (= e!437903 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351454))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!787832 () Bool)

(declare-fun lt!351455 () SeekEntryResult!8101)

(declare-fun e!437910 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!787832 (= e!437910 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351455))))

(declare-fun b!787833 () Bool)

(declare-fun res!533645 () Bool)

(declare-fun e!437911 () Bool)

(assert (=> b!787833 (=> (not res!533645) (not e!437911))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787833 (= res!533645 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787834 () Bool)

(declare-fun res!533642 () Bool)

(assert (=> b!787834 (=> (not res!533642) (not e!437901))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787834 (= res!533642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20501 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787835 () Bool)

(declare-fun e!437904 () Bool)

(declare-fun e!437906 () Bool)

(assert (=> b!787835 (= e!437904 (not e!437906))))

(declare-fun res!533644 () Bool)

(assert (=> b!787835 (=> res!533644 e!437906)))

(declare-fun lt!351458 () SeekEntryResult!8101)

(assert (=> b!787835 (= res!533644 (or (not (is-Intermediate!8101 lt!351458)) (bvslt x!1131 (x!65705 lt!351458)) (not (= x!1131 (x!65705 lt!351458))) (not (= index!1321 (index!34774 lt!351458)))))))

(assert (=> b!787835 e!437910))

(declare-fun res!533636 () Bool)

(assert (=> b!787835 (=> (not res!533636) (not e!437910))))

(declare-fun lt!351457 () SeekEntryResult!8101)

(assert (=> b!787835 (= res!533636 (= lt!351457 lt!351455))))

(assert (=> b!787835 (= lt!351455 (Found!8101 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!787835 (= lt!351457 (seekEntryOrOpen!0 (select (arr!20501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42826 (_ BitVec 32)) Bool)

(assert (=> b!787835 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27292 0))(
  ( (Unit!27293) )
))
(declare-fun lt!351453 () Unit!27292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27292)

(assert (=> b!787835 (= lt!351453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787836 () Bool)

(declare-fun res!533638 () Bool)

(assert (=> b!787836 (=> (not res!533638) (not e!437911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787836 (= res!533638 (validKeyInArray!0 k!2102))))

(declare-fun b!787837 () Bool)

(declare-fun e!437908 () Unit!27292)

(declare-fun Unit!27294 () Unit!27292)

(assert (=> b!787837 (= e!437908 Unit!27294)))

(declare-fun b!787838 () Bool)

(declare-fun res!533650 () Bool)

(assert (=> b!787838 (=> (not res!533650) (not e!437905))))

(assert (=> b!787838 (= res!533650 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20922 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20922 a!3186))))))

(declare-fun b!787839 () Bool)

(declare-fun res!533637 () Bool)

(assert (=> b!787839 (=> (not res!533637) (not e!437905))))

(assert (=> b!787839 (= res!533637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787840 () Bool)

(assert (=> b!787840 (= e!437905 e!437901)))

(declare-fun res!533641 () Bool)

(assert (=> b!787840 (=> (not res!533641) (not e!437901))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787840 (= res!533641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20501 a!3186) j!159) mask!3328) (select (arr!20501 a!3186) j!159) a!3186 mask!3328) lt!351454))))

(assert (=> b!787840 (= lt!351454 (Intermediate!8101 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787841 () Bool)

(declare-fun res!533649 () Bool)

(assert (=> b!787841 (=> (not res!533649) (not e!437911))))

(assert (=> b!787841 (= res!533649 (and (= (size!20922 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20922 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20922 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787842 () Bool)

(assert (=> b!787842 (= e!437903 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328) (Found!8101 j!159)))))

(declare-fun b!787843 () Bool)

(declare-fun e!437907 () Bool)

(assert (=> b!787843 (= e!437907 true)))

(declare-fun e!437912 () Bool)

(assert (=> b!787843 e!437912))

(declare-fun res!533648 () Bool)

(assert (=> b!787843 (=> (not res!533648) (not e!437912))))

(declare-fun lt!351460 () (_ BitVec 64))

(assert (=> b!787843 (= res!533648 (= lt!351460 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351462 () Unit!27292)

(assert (=> b!787843 (= lt!351462 e!437908)))

(declare-fun c!87504 () Bool)

(assert (=> b!787843 (= c!87504 (= lt!351460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787844 () Bool)

(declare-fun Unit!27295 () Unit!27292)

(assert (=> b!787844 (= e!437908 Unit!27295)))

(assert (=> b!787844 false))

(declare-fun b!787845 () Bool)

(assert (=> b!787845 (= e!437911 e!437905)))

(declare-fun res!533654 () Bool)

(assert (=> b!787845 (=> (not res!533654) (not e!437905))))

(declare-fun lt!351461 () SeekEntryResult!8101)

(assert (=> b!787845 (= res!533654 (or (= lt!351461 (MissingZero!8101 i!1173)) (= lt!351461 (MissingVacant!8101 i!1173))))))

(assert (=> b!787845 (= lt!351461 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787846 () Bool)

(assert (=> b!787846 (= e!437901 e!437904)))

(declare-fun res!533639 () Bool)

(assert (=> b!787846 (=> (not res!533639) (not e!437904))))

(declare-fun lt!351463 () SeekEntryResult!8101)

(assert (=> b!787846 (= res!533639 (= lt!351463 lt!351458))))

(declare-fun lt!351464 () array!42826)

(declare-fun lt!351459 () (_ BitVec 64))

(assert (=> b!787846 (= lt!351458 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351459 lt!351464 mask!3328))))

(assert (=> b!787846 (= lt!351463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351459 mask!3328) lt!351459 lt!351464 mask!3328))))

(assert (=> b!787846 (= lt!351459 (select (store (arr!20501 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787846 (= lt!351464 (array!42827 (store (arr!20501 a!3186) i!1173 k!2102) (size!20922 a!3186)))))

(declare-fun b!787847 () Bool)

(declare-fun e!437909 () Bool)

(assert (=> b!787847 (= e!437909 e!437907)))

(declare-fun res!533643 () Bool)

(assert (=> b!787847 (=> res!533643 e!437907)))

(assert (=> b!787847 (= res!533643 (= lt!351460 lt!351459))))

(assert (=> b!787847 (= lt!351460 (select (store (arr!20501 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787848 () Bool)

(declare-fun lt!351456 () SeekEntryResult!8101)

(assert (=> b!787848 (= e!437912 (= lt!351457 lt!351456))))

(declare-fun b!787849 () Bool)

(assert (=> b!787849 (= e!437906 e!437909)))

(declare-fun res!533640 () Bool)

(assert (=> b!787849 (=> res!533640 e!437909)))

(assert (=> b!787849 (= res!533640 (not (= lt!351456 lt!351455)))))

(assert (=> b!787849 (= lt!351456 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!533646 () Bool)

(assert (=> start!67786 (=> (not res!533646) (not e!437911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67786 (= res!533646 (validMask!0 mask!3328))))

(assert (=> start!67786 e!437911))

(assert (=> start!67786 true))

(declare-fun array_inv!16297 (array!42826) Bool)

(assert (=> start!67786 (array_inv!16297 a!3186)))

(declare-fun b!787850 () Bool)

(declare-fun res!533653 () Bool)

(assert (=> b!787850 (=> (not res!533653) (not e!437912))))

(assert (=> b!787850 (= res!533653 (= (seekEntryOrOpen!0 lt!351459 lt!351464 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351459 lt!351464 mask!3328)))))

(declare-fun b!787851 () Bool)

(declare-fun res!533647 () Bool)

(assert (=> b!787851 (=> (not res!533647) (not e!437911))))

(assert (=> b!787851 (= res!533647 (validKeyInArray!0 (select (arr!20501 a!3186) j!159)))))

(assert (= (and start!67786 res!533646) b!787841))

(assert (= (and b!787841 res!533649) b!787851))

(assert (= (and b!787851 res!533647) b!787836))

(assert (= (and b!787836 res!533638) b!787833))

(assert (= (and b!787833 res!533645) b!787845))

(assert (= (and b!787845 res!533654) b!787839))

(assert (= (and b!787839 res!533637) b!787829))

(assert (= (and b!787829 res!533651) b!787838))

(assert (= (and b!787838 res!533650) b!787840))

(assert (= (and b!787840 res!533641) b!787834))

(assert (= (and b!787834 res!533642) b!787830))

(assert (= (and b!787830 c!87505) b!787831))

(assert (= (and b!787830 (not c!87505)) b!787842))

(assert (= (and b!787830 res!533652) b!787846))

(assert (= (and b!787846 res!533639) b!787835))

(assert (= (and b!787835 res!533636) b!787832))

(assert (= (and b!787835 (not res!533644)) b!787849))

(assert (= (and b!787849 (not res!533640)) b!787847))

(assert (= (and b!787847 (not res!533643)) b!787843))

(assert (= (and b!787843 c!87504) b!787844))

(assert (= (and b!787843 (not c!87504)) b!787837))

(assert (= (and b!787843 res!533648) b!787850))

(assert (= (and b!787850 res!533653) b!787848))

(declare-fun m!729313 () Bool)

(assert (=> b!787829 m!729313))

(declare-fun m!729315 () Bool)

(assert (=> b!787845 m!729315))

(declare-fun m!729317 () Bool)

(assert (=> b!787842 m!729317))

(assert (=> b!787842 m!729317))

(declare-fun m!729319 () Bool)

(assert (=> b!787842 m!729319))

(declare-fun m!729321 () Bool)

(assert (=> b!787833 m!729321))

(assert (=> b!787831 m!729317))

(assert (=> b!787831 m!729317))

(declare-fun m!729323 () Bool)

(assert (=> b!787831 m!729323))

(declare-fun m!729325 () Bool)

(assert (=> b!787834 m!729325))

(declare-fun m!729327 () Bool)

(assert (=> b!787847 m!729327))

(declare-fun m!729329 () Bool)

(assert (=> b!787847 m!729329))

(declare-fun m!729331 () Bool)

(assert (=> b!787850 m!729331))

(declare-fun m!729333 () Bool)

(assert (=> b!787850 m!729333))

(assert (=> b!787851 m!729317))

(assert (=> b!787851 m!729317))

(declare-fun m!729335 () Bool)

(assert (=> b!787851 m!729335))

(declare-fun m!729337 () Bool)

(assert (=> b!787836 m!729337))

(assert (=> b!787835 m!729317))

(assert (=> b!787835 m!729317))

(declare-fun m!729339 () Bool)

(assert (=> b!787835 m!729339))

(declare-fun m!729341 () Bool)

(assert (=> b!787835 m!729341))

(declare-fun m!729343 () Bool)

(assert (=> b!787835 m!729343))

(declare-fun m!729345 () Bool)

(assert (=> b!787839 m!729345))

(declare-fun m!729347 () Bool)

(assert (=> start!67786 m!729347))

(declare-fun m!729349 () Bool)

(assert (=> start!67786 m!729349))

(assert (=> b!787840 m!729317))

(assert (=> b!787840 m!729317))

(declare-fun m!729351 () Bool)

(assert (=> b!787840 m!729351))

(assert (=> b!787840 m!729351))

(assert (=> b!787840 m!729317))

(declare-fun m!729353 () Bool)

(assert (=> b!787840 m!729353))

(assert (=> b!787832 m!729317))

(assert (=> b!787832 m!729317))

(declare-fun m!729355 () Bool)

(assert (=> b!787832 m!729355))

(declare-fun m!729357 () Bool)

(assert (=> b!787846 m!729357))

(declare-fun m!729359 () Bool)

(assert (=> b!787846 m!729359))

(assert (=> b!787846 m!729327))

(declare-fun m!729361 () Bool)

(assert (=> b!787846 m!729361))

(assert (=> b!787846 m!729357))

(declare-fun m!729363 () Bool)

(assert (=> b!787846 m!729363))

(assert (=> b!787849 m!729317))

(assert (=> b!787849 m!729317))

(assert (=> b!787849 m!729319))

(push 1)

