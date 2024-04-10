; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67784 () Bool)

(assert start!67784)

(declare-fun b!787760 () Bool)

(declare-fun e!437871 () Bool)

(assert (=> b!787760 (= e!437871 true)))

(declare-fun e!437869 () Bool)

(assert (=> b!787760 e!437869))

(declare-fun res!533583 () Bool)

(assert (=> b!787760 (=> (not res!533583) (not e!437869))))

(declare-fun lt!351426 () (_ BitVec 64))

(assert (=> b!787760 (= res!533583 (= lt!351426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27288 0))(
  ( (Unit!27289) )
))
(declare-fun lt!351418 () Unit!27288)

(declare-fun e!437867 () Unit!27288)

(assert (=> b!787760 (= lt!351418 e!437867)))

(declare-fun c!87498 () Bool)

(assert (=> b!787760 (= c!87498 (= lt!351426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787761 () Bool)

(declare-fun e!437876 () Bool)

(declare-fun e!437873 () Bool)

(assert (=> b!787761 (= e!437876 e!437873)))

(declare-fun res!533595 () Bool)

(assert (=> b!787761 (=> res!533595 e!437873)))

(declare-datatypes ((SeekEntryResult!8100 0))(
  ( (MissingZero!8100 (index!34768 (_ BitVec 32))) (Found!8100 (index!34769 (_ BitVec 32))) (Intermediate!8100 (undefined!8912 Bool) (index!34770 (_ BitVec 32)) (x!65704 (_ BitVec 32))) (Undefined!8100) (MissingVacant!8100 (index!34771 (_ BitVec 32))) )
))
(declare-fun lt!351421 () SeekEntryResult!8100)

(declare-fun lt!351420 () SeekEntryResult!8100)

(assert (=> b!787761 (= res!533595 (not (= lt!351421 lt!351420)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42824 0))(
  ( (array!42825 (arr!20500 (Array (_ BitVec 32) (_ BitVec 64))) (size!20921 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42824)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42824 (_ BitVec 32)) SeekEntryResult!8100)

(assert (=> b!787761 (= lt!351421 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787762 () Bool)

(assert (=> b!787762 (= e!437873 e!437871)))

(declare-fun res!533589 () Bool)

(assert (=> b!787762 (=> res!533589 e!437871)))

(declare-fun lt!351428 () (_ BitVec 64))

(assert (=> b!787762 (= res!533589 (= lt!351426 lt!351428))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787762 (= lt!351426 (select (store (arr!20500 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787763 () Bool)

(declare-fun e!437866 () Bool)

(assert (=> b!787763 (= e!437866 (not e!437876))))

(declare-fun res!533590 () Bool)

(assert (=> b!787763 (=> res!533590 e!437876)))

(declare-fun lt!351423 () SeekEntryResult!8100)

(get-info :version)

(assert (=> b!787763 (= res!533590 (or (not ((_ is Intermediate!8100) lt!351423)) (bvslt x!1131 (x!65704 lt!351423)) (not (= x!1131 (x!65704 lt!351423))) (not (= index!1321 (index!34770 lt!351423)))))))

(declare-fun e!437872 () Bool)

(assert (=> b!787763 e!437872))

(declare-fun res!533591 () Bool)

(assert (=> b!787763 (=> (not res!533591) (not e!437872))))

(declare-fun lt!351425 () SeekEntryResult!8100)

(assert (=> b!787763 (= res!533591 (= lt!351425 lt!351420))))

(assert (=> b!787763 (= lt!351420 (Found!8100 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42824 (_ BitVec 32)) SeekEntryResult!8100)

(assert (=> b!787763 (= lt!351425 (seekEntryOrOpen!0 (select (arr!20500 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42824 (_ BitVec 32)) Bool)

(assert (=> b!787763 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351419 () Unit!27288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27288)

(assert (=> b!787763 (= lt!351419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787764 () Bool)

(declare-fun res!533597 () Bool)

(declare-fun e!437868 () Bool)

(assert (=> b!787764 (=> (not res!533597) (not e!437868))))

(assert (=> b!787764 (= res!533597 (and (= (size!20921 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20921 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20921 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787765 () Bool)

(declare-fun res!533592 () Bool)

(declare-fun e!437875 () Bool)

(assert (=> b!787765 (=> (not res!533592) (not e!437875))))

(declare-fun e!437865 () Bool)

(assert (=> b!787765 (= res!533592 e!437865)))

(declare-fun c!87499 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787765 (= c!87499 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787766 () Bool)

(declare-fun res!533582 () Bool)

(assert (=> b!787766 (=> (not res!533582) (not e!437875))))

(assert (=> b!787766 (= res!533582 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20500 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787767 () Bool)

(assert (=> b!787767 (= e!437865 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) (Found!8100 j!159)))))

(declare-fun b!787768 () Bool)

(assert (=> b!787768 (= e!437875 e!437866)))

(declare-fun res!533596 () Bool)

(assert (=> b!787768 (=> (not res!533596) (not e!437866))))

(declare-fun lt!351422 () SeekEntryResult!8100)

(assert (=> b!787768 (= res!533596 (= lt!351422 lt!351423))))

(declare-fun lt!351424 () array!42824)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42824 (_ BitVec 32)) SeekEntryResult!8100)

(assert (=> b!787768 (= lt!351423 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351428 lt!351424 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787768 (= lt!351422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351428 mask!3328) lt!351428 lt!351424 mask!3328))))

(assert (=> b!787768 (= lt!351428 (select (store (arr!20500 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787768 (= lt!351424 (array!42825 (store (arr!20500 a!3186) i!1173 k0!2102) (size!20921 a!3186)))))

(declare-fun b!787769 () Bool)

(declare-fun res!533581 () Bool)

(declare-fun e!437874 () Bool)

(assert (=> b!787769 (=> (not res!533581) (not e!437874))))

(assert (=> b!787769 (= res!533581 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20921 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20921 a!3186))))))

(declare-fun b!787770 () Bool)

(declare-fun res!533585 () Bool)

(assert (=> b!787770 (=> (not res!533585) (not e!437869))))

(assert (=> b!787770 (= res!533585 (= (seekEntryOrOpen!0 lt!351428 lt!351424 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351428 lt!351424 mask!3328)))))

(declare-fun b!787771 () Bool)

(assert (=> b!787771 (= e!437874 e!437875)))

(declare-fun res!533593 () Bool)

(assert (=> b!787771 (=> (not res!533593) (not e!437875))))

(declare-fun lt!351427 () SeekEntryResult!8100)

(assert (=> b!787771 (= res!533593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20500 a!3186) j!159) mask!3328) (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351427))))

(assert (=> b!787771 (= lt!351427 (Intermediate!8100 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!533594 () Bool)

(assert (=> start!67784 (=> (not res!533594) (not e!437868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67784 (= res!533594 (validMask!0 mask!3328))))

(assert (=> start!67784 e!437868))

(assert (=> start!67784 true))

(declare-fun array_inv!16296 (array!42824) Bool)

(assert (=> start!67784 (array_inv!16296 a!3186)))

(declare-fun b!787772 () Bool)

(declare-fun Unit!27290 () Unit!27288)

(assert (=> b!787772 (= e!437867 Unit!27290)))

(assert (=> b!787772 false))

(declare-fun b!787773 () Bool)

(assert (=> b!787773 (= e!437869 (= lt!351425 lt!351421))))

(declare-fun b!787774 () Bool)

(declare-fun res!533579 () Bool)

(assert (=> b!787774 (=> (not res!533579) (not e!437868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787774 (= res!533579 (validKeyInArray!0 k0!2102))))

(declare-fun b!787775 () Bool)

(declare-fun res!533588 () Bool)

(assert (=> b!787775 (=> (not res!533588) (not e!437868))))

(declare-fun arrayContainsKey!0 (array!42824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787775 (= res!533588 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787776 () Bool)

(assert (=> b!787776 (= e!437868 e!437874)))

(declare-fun res!533587 () Bool)

(assert (=> b!787776 (=> (not res!533587) (not e!437874))))

(declare-fun lt!351417 () SeekEntryResult!8100)

(assert (=> b!787776 (= res!533587 (or (= lt!351417 (MissingZero!8100 i!1173)) (= lt!351417 (MissingVacant!8100 i!1173))))))

(assert (=> b!787776 (= lt!351417 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787777 () Bool)

(assert (=> b!787777 (= e!437865 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351427))))

(declare-fun b!787778 () Bool)

(declare-fun res!533584 () Bool)

(assert (=> b!787778 (=> (not res!533584) (not e!437868))))

(assert (=> b!787778 (= res!533584 (validKeyInArray!0 (select (arr!20500 a!3186) j!159)))))

(declare-fun b!787779 () Bool)

(assert (=> b!787779 (= e!437872 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20500 a!3186) j!159) a!3186 mask!3328) lt!351420))))

(declare-fun b!787780 () Bool)

(declare-fun res!533580 () Bool)

(assert (=> b!787780 (=> (not res!533580) (not e!437874))))

(declare-datatypes ((List!14502 0))(
  ( (Nil!14499) (Cons!14498 (h!15621 (_ BitVec 64)) (t!20817 List!14502)) )
))
(declare-fun arrayNoDuplicates!0 (array!42824 (_ BitVec 32) List!14502) Bool)

(assert (=> b!787780 (= res!533580 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14499))))

(declare-fun b!787781 () Bool)

(declare-fun res!533586 () Bool)

(assert (=> b!787781 (=> (not res!533586) (not e!437874))))

(assert (=> b!787781 (= res!533586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787782 () Bool)

(declare-fun Unit!27291 () Unit!27288)

(assert (=> b!787782 (= e!437867 Unit!27291)))

(assert (= (and start!67784 res!533594) b!787764))

(assert (= (and b!787764 res!533597) b!787778))

(assert (= (and b!787778 res!533584) b!787774))

(assert (= (and b!787774 res!533579) b!787775))

(assert (= (and b!787775 res!533588) b!787776))

(assert (= (and b!787776 res!533587) b!787781))

(assert (= (and b!787781 res!533586) b!787780))

(assert (= (and b!787780 res!533580) b!787769))

(assert (= (and b!787769 res!533581) b!787771))

(assert (= (and b!787771 res!533593) b!787766))

(assert (= (and b!787766 res!533582) b!787765))

(assert (= (and b!787765 c!87499) b!787777))

(assert (= (and b!787765 (not c!87499)) b!787767))

(assert (= (and b!787765 res!533592) b!787768))

(assert (= (and b!787768 res!533596) b!787763))

(assert (= (and b!787763 res!533591) b!787779))

(assert (= (and b!787763 (not res!533590)) b!787761))

(assert (= (and b!787761 (not res!533595)) b!787762))

(assert (= (and b!787762 (not res!533589)) b!787760))

(assert (= (and b!787760 c!87498) b!787772))

(assert (= (and b!787760 (not c!87498)) b!787782))

(assert (= (and b!787760 res!533583) b!787770))

(assert (= (and b!787770 res!533585) b!787773))

(declare-fun m!729261 () Bool)

(assert (=> b!787771 m!729261))

(assert (=> b!787771 m!729261))

(declare-fun m!729263 () Bool)

(assert (=> b!787771 m!729263))

(assert (=> b!787771 m!729263))

(assert (=> b!787771 m!729261))

(declare-fun m!729265 () Bool)

(assert (=> b!787771 m!729265))

(assert (=> b!787761 m!729261))

(assert (=> b!787761 m!729261))

(declare-fun m!729267 () Bool)

(assert (=> b!787761 m!729267))

(declare-fun m!729269 () Bool)

(assert (=> b!787776 m!729269))

(assert (=> b!787778 m!729261))

(assert (=> b!787778 m!729261))

(declare-fun m!729271 () Bool)

(assert (=> b!787778 m!729271))

(assert (=> b!787767 m!729261))

(assert (=> b!787767 m!729261))

(assert (=> b!787767 m!729267))

(declare-fun m!729273 () Bool)

(assert (=> b!787781 m!729273))

(declare-fun m!729275 () Bool)

(assert (=> b!787780 m!729275))

(declare-fun m!729277 () Bool)

(assert (=> b!787768 m!729277))

(declare-fun m!729279 () Bool)

(assert (=> b!787768 m!729279))

(declare-fun m!729281 () Bool)

(assert (=> b!787768 m!729281))

(declare-fun m!729283 () Bool)

(assert (=> b!787768 m!729283))

(assert (=> b!787768 m!729279))

(declare-fun m!729285 () Bool)

(assert (=> b!787768 m!729285))

(declare-fun m!729287 () Bool)

(assert (=> b!787774 m!729287))

(assert (=> b!787762 m!729283))

(declare-fun m!729289 () Bool)

(assert (=> b!787762 m!729289))

(assert (=> b!787763 m!729261))

(assert (=> b!787763 m!729261))

(declare-fun m!729291 () Bool)

(assert (=> b!787763 m!729291))

(declare-fun m!729293 () Bool)

(assert (=> b!787763 m!729293))

(declare-fun m!729295 () Bool)

(assert (=> b!787763 m!729295))

(declare-fun m!729297 () Bool)

(assert (=> b!787775 m!729297))

(assert (=> b!787777 m!729261))

(assert (=> b!787777 m!729261))

(declare-fun m!729299 () Bool)

(assert (=> b!787777 m!729299))

(declare-fun m!729301 () Bool)

(assert (=> b!787770 m!729301))

(declare-fun m!729303 () Bool)

(assert (=> b!787770 m!729303))

(declare-fun m!729305 () Bool)

(assert (=> b!787766 m!729305))

(assert (=> b!787779 m!729261))

(assert (=> b!787779 m!729261))

(declare-fun m!729307 () Bool)

(assert (=> b!787779 m!729307))

(declare-fun m!729309 () Bool)

(assert (=> start!67784 m!729309))

(declare-fun m!729311 () Bool)

(assert (=> start!67784 m!729311))

(check-sat (not b!787770) (not b!787780) (not b!787771) (not b!787779) (not b!787781) (not b!787768) (not start!67784) (not b!787767) (not b!787763) (not b!787777) (not b!787778) (not b!787761) (not b!787776) (not b!787775) (not b!787774))
(check-sat)
