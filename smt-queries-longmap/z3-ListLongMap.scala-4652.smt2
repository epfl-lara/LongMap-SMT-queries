; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64686 () Bool)

(assert start!64686)

(declare-fun b!729280 () Bool)

(declare-fun e!408186 () Bool)

(declare-fun e!408183 () Bool)

(assert (=> b!729280 (= e!408186 e!408183)))

(declare-fun res!489707 () Bool)

(assert (=> b!729280 (=> (not res!489707) (not e!408183))))

(declare-datatypes ((array!41135 0))(
  ( (array!41136 (arr!19687 (Array (_ BitVec 32) (_ BitVec 64))) (size!20108 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41135)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7287 0))(
  ( (MissingZero!7287 (index!31516 (_ BitVec 32))) (Found!7287 (index!31517 (_ BitVec 32))) (Intermediate!7287 (undefined!8099 Bool) (index!31518 (_ BitVec 32)) (x!62501 (_ BitVec 32))) (Undefined!7287) (MissingVacant!7287 (index!31519 (_ BitVec 32))) )
))
(declare-fun lt!323088 () SeekEntryResult!7287)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41135 (_ BitVec 32)) SeekEntryResult!7287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729280 (= res!489707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19687 a!3186) j!159) mask!3328) (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323088))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729280 (= lt!323088 (Intermediate!7287 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729281 () Bool)

(declare-fun e!408184 () Bool)

(declare-fun lt!323084 () SeekEntryResult!7287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41135 (_ BitVec 32)) SeekEntryResult!7287)

(assert (=> b!729281 (= e!408184 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323084))))

(declare-fun b!729282 () Bool)

(declare-fun res!489710 () Bool)

(assert (=> b!729282 (=> (not res!489710) (not e!408186))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!729282 (= res!489710 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20108 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20108 a!3186))))))

(declare-fun b!729283 () Bool)

(declare-fun res!489705 () Bool)

(assert (=> b!729283 (=> (not res!489705) (not e!408186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41135 (_ BitVec 32)) Bool)

(assert (=> b!729283 (= res!489705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!408188 () Bool)

(declare-fun b!729284 () Bool)

(assert (=> b!729284 (= e!408188 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323088))))

(declare-fun b!729285 () Bool)

(declare-fun res!489704 () Bool)

(assert (=> b!729285 (=> (not res!489704) (not e!408186))))

(declare-datatypes ((List!13689 0))(
  ( (Nil!13686) (Cons!13685 (h!14745 (_ BitVec 64)) (t!20004 List!13689)) )
))
(declare-fun arrayNoDuplicates!0 (array!41135 (_ BitVec 32) List!13689) Bool)

(assert (=> b!729285 (= res!489704 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13686))))

(declare-fun b!729286 () Bool)

(declare-fun res!489711 () Bool)

(assert (=> b!729286 (=> (not res!489711) (not e!408183))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729286 (= res!489711 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19687 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729287 () Bool)

(declare-fun res!489708 () Bool)

(declare-fun e!408185 () Bool)

(assert (=> b!729287 (=> (not res!489708) (not e!408185))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729287 (= res!489708 (validKeyInArray!0 k0!2102))))

(declare-fun b!729288 () Bool)

(declare-fun e!408187 () Bool)

(assert (=> b!729288 (= e!408187 true)))

(declare-fun lt!323086 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729288 (= lt!323086 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!489714 () Bool)

(assert (=> start!64686 (=> (not res!489714) (not e!408185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64686 (= res!489714 (validMask!0 mask!3328))))

(assert (=> start!64686 e!408185))

(assert (=> start!64686 true))

(declare-fun array_inv!15483 (array!41135) Bool)

(assert (=> start!64686 (array_inv!15483 a!3186)))

(declare-fun b!729289 () Bool)

(declare-fun e!408189 () Bool)

(assert (=> b!729289 (= e!408189 (not e!408187))))

(declare-fun res!489706 () Bool)

(assert (=> b!729289 (=> res!489706 e!408187)))

(declare-fun lt!323090 () SeekEntryResult!7287)

(get-info :version)

(assert (=> b!729289 (= res!489706 (or (not ((_ is Intermediate!7287) lt!323090)) (bvsge x!1131 (x!62501 lt!323090))))))

(declare-fun e!408190 () Bool)

(assert (=> b!729289 e!408190))

(declare-fun res!489713 () Bool)

(assert (=> b!729289 (=> (not res!489713) (not e!408190))))

(assert (=> b!729289 (= res!489713 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24892 0))(
  ( (Unit!24893) )
))
(declare-fun lt!323082 () Unit!24892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24892)

(assert (=> b!729289 (= lt!323082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729290 () Bool)

(declare-fun res!489709 () Bool)

(assert (=> b!729290 (=> (not res!489709) (not e!408185))))

(declare-fun arrayContainsKey!0 (array!41135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729290 (= res!489709 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729291 () Bool)

(assert (=> b!729291 (= e!408190 e!408184)))

(declare-fun res!489703 () Bool)

(assert (=> b!729291 (=> (not res!489703) (not e!408184))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41135 (_ BitVec 32)) SeekEntryResult!7287)

(assert (=> b!729291 (= res!489703 (= (seekEntryOrOpen!0 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323084))))

(assert (=> b!729291 (= lt!323084 (Found!7287 j!159))))

(declare-fun b!729292 () Bool)

(assert (=> b!729292 (= e!408188 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) (Found!7287 j!159)))))

(declare-fun b!729293 () Bool)

(declare-fun res!489701 () Bool)

(assert (=> b!729293 (=> (not res!489701) (not e!408183))))

(assert (=> b!729293 (= res!489701 e!408188)))

(declare-fun c!80164 () Bool)

(assert (=> b!729293 (= c!80164 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729294 () Bool)

(assert (=> b!729294 (= e!408185 e!408186)))

(declare-fun res!489702 () Bool)

(assert (=> b!729294 (=> (not res!489702) (not e!408186))))

(declare-fun lt!323089 () SeekEntryResult!7287)

(assert (=> b!729294 (= res!489702 (or (= lt!323089 (MissingZero!7287 i!1173)) (= lt!323089 (MissingVacant!7287 i!1173))))))

(assert (=> b!729294 (= lt!323089 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729295 () Bool)

(assert (=> b!729295 (= e!408183 e!408189)))

(declare-fun res!489715 () Bool)

(assert (=> b!729295 (=> (not res!489715) (not e!408189))))

(declare-fun lt!323085 () SeekEntryResult!7287)

(assert (=> b!729295 (= res!489715 (= lt!323085 lt!323090))))

(declare-fun lt!323087 () array!41135)

(declare-fun lt!323083 () (_ BitVec 64))

(assert (=> b!729295 (= lt!323090 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323083 lt!323087 mask!3328))))

(assert (=> b!729295 (= lt!323085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323083 mask!3328) lt!323083 lt!323087 mask!3328))))

(assert (=> b!729295 (= lt!323083 (select (store (arr!19687 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729295 (= lt!323087 (array!41136 (store (arr!19687 a!3186) i!1173 k0!2102) (size!20108 a!3186)))))

(declare-fun b!729296 () Bool)

(declare-fun res!489716 () Bool)

(assert (=> b!729296 (=> (not res!489716) (not e!408185))))

(assert (=> b!729296 (= res!489716 (validKeyInArray!0 (select (arr!19687 a!3186) j!159)))))

(declare-fun b!729297 () Bool)

(declare-fun res!489712 () Bool)

(assert (=> b!729297 (=> (not res!489712) (not e!408185))))

(assert (=> b!729297 (= res!489712 (and (= (size!20108 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20108 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20108 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64686 res!489714) b!729297))

(assert (= (and b!729297 res!489712) b!729296))

(assert (= (and b!729296 res!489716) b!729287))

(assert (= (and b!729287 res!489708) b!729290))

(assert (= (and b!729290 res!489709) b!729294))

(assert (= (and b!729294 res!489702) b!729283))

(assert (= (and b!729283 res!489705) b!729285))

(assert (= (and b!729285 res!489704) b!729282))

(assert (= (and b!729282 res!489710) b!729280))

(assert (= (and b!729280 res!489707) b!729286))

(assert (= (and b!729286 res!489711) b!729293))

(assert (= (and b!729293 c!80164) b!729284))

(assert (= (and b!729293 (not c!80164)) b!729292))

(assert (= (and b!729293 res!489701) b!729295))

(assert (= (and b!729295 res!489715) b!729289))

(assert (= (and b!729289 res!489713) b!729291))

(assert (= (and b!729291 res!489703) b!729281))

(assert (= (and b!729289 (not res!489706)) b!729288))

(declare-fun m!682939 () Bool)

(assert (=> b!729288 m!682939))

(declare-fun m!682941 () Bool)

(assert (=> b!729280 m!682941))

(assert (=> b!729280 m!682941))

(declare-fun m!682943 () Bool)

(assert (=> b!729280 m!682943))

(assert (=> b!729280 m!682943))

(assert (=> b!729280 m!682941))

(declare-fun m!682945 () Bool)

(assert (=> b!729280 m!682945))

(declare-fun m!682947 () Bool)

(assert (=> b!729286 m!682947))

(assert (=> b!729291 m!682941))

(assert (=> b!729291 m!682941))

(declare-fun m!682949 () Bool)

(assert (=> b!729291 m!682949))

(declare-fun m!682951 () Bool)

(assert (=> b!729289 m!682951))

(declare-fun m!682953 () Bool)

(assert (=> b!729289 m!682953))

(assert (=> b!729284 m!682941))

(assert (=> b!729284 m!682941))

(declare-fun m!682955 () Bool)

(assert (=> b!729284 m!682955))

(declare-fun m!682957 () Bool)

(assert (=> start!64686 m!682957))

(declare-fun m!682959 () Bool)

(assert (=> start!64686 m!682959))

(declare-fun m!682961 () Bool)

(assert (=> b!729290 m!682961))

(declare-fun m!682963 () Bool)

(assert (=> b!729285 m!682963))

(assert (=> b!729296 m!682941))

(assert (=> b!729296 m!682941))

(declare-fun m!682965 () Bool)

(assert (=> b!729296 m!682965))

(declare-fun m!682967 () Bool)

(assert (=> b!729287 m!682967))

(declare-fun m!682969 () Bool)

(assert (=> b!729283 m!682969))

(declare-fun m!682971 () Bool)

(assert (=> b!729294 m!682971))

(assert (=> b!729281 m!682941))

(assert (=> b!729281 m!682941))

(declare-fun m!682973 () Bool)

(assert (=> b!729281 m!682973))

(declare-fun m!682975 () Bool)

(assert (=> b!729295 m!682975))

(declare-fun m!682977 () Bool)

(assert (=> b!729295 m!682977))

(declare-fun m!682979 () Bool)

(assert (=> b!729295 m!682979))

(declare-fun m!682981 () Bool)

(assert (=> b!729295 m!682981))

(declare-fun m!682983 () Bool)

(assert (=> b!729295 m!682983))

(assert (=> b!729295 m!682975))

(assert (=> b!729292 m!682941))

(assert (=> b!729292 m!682941))

(declare-fun m!682985 () Bool)

(assert (=> b!729292 m!682985))

(check-sat (not b!729289) (not b!729281) (not b!729295) (not b!729292) (not b!729290) (not b!729287) (not b!729294) (not b!729285) (not b!729280) (not b!729288) (not b!729284) (not start!64686) (not b!729296) (not b!729291) (not b!729283))
(check-sat)
