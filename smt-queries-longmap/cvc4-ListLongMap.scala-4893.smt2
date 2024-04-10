; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67474 () Bool)

(assert start!67474)

(declare-fun b!780904 () Bool)

(declare-fun e!434348 () Bool)

(declare-fun e!434344 () Bool)

(assert (=> b!780904 (= e!434348 (not e!434344))))

(declare-fun res!528422 () Bool)

(assert (=> b!780904 (=> res!528422 e!434344)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8011 0))(
  ( (MissingZero!8011 (index!34412 (_ BitVec 32))) (Found!8011 (index!34413 (_ BitVec 32))) (Intermediate!8011 (undefined!8823 Bool) (index!34414 (_ BitVec 32)) (x!65357 (_ BitVec 32))) (Undefined!8011) (MissingVacant!8011 (index!34415 (_ BitVec 32))) )
))
(declare-fun lt!348009 () SeekEntryResult!8011)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!780904 (= res!528422 (or (not (is-Intermediate!8011 lt!348009)) (bvslt x!1131 (x!65357 lt!348009)) (not (= x!1131 (x!65357 lt!348009))) (not (= index!1321 (index!34414 lt!348009)))))))

(declare-fun e!434345 () Bool)

(assert (=> b!780904 e!434345))

(declare-fun res!528412 () Bool)

(assert (=> b!780904 (=> (not res!528412) (not e!434345))))

(declare-fun lt!348008 () SeekEntryResult!8011)

(declare-fun lt!348005 () SeekEntryResult!8011)

(assert (=> b!780904 (= res!528412 (= lt!348008 lt!348005))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!780904 (= lt!348005 (Found!8011 j!159))))

(declare-datatypes ((array!42640 0))(
  ( (array!42641 (arr!20411 (Array (_ BitVec 32) (_ BitVec 64))) (size!20832 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42640)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42640 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!780904 (= lt!348008 (seekEntryOrOpen!0 (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42640 (_ BitVec 32)) Bool)

(assert (=> b!780904 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26932 0))(
  ( (Unit!26933) )
))
(declare-fun lt!348011 () Unit!26932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26932)

(assert (=> b!780904 (= lt!348011 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780905 () Bool)

(declare-fun e!434342 () Bool)

(declare-fun e!434347 () Bool)

(assert (=> b!780905 (= e!434342 e!434347)))

(declare-fun res!528416 () Bool)

(assert (=> b!780905 (=> (not res!528416) (not e!434347))))

(declare-fun lt!348012 () SeekEntryResult!8011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42640 (_ BitVec 32)) SeekEntryResult!8011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780905 (= res!528416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348012))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780905 (= lt!348012 (Intermediate!8011 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780907 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42640 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!780907 (= e!434345 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348005))))

(declare-fun b!780908 () Bool)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!780908 (= e!434344 (= (select (store (arr!20411 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!348007 () Unit!26932)

(declare-fun e!434340 () Unit!26932)

(assert (=> b!780908 (= lt!348007 e!434340)))

(declare-fun c!86653 () Bool)

(assert (=> b!780908 (= c!86653 (= (select (store (arr!20411 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780909 () Bool)

(declare-fun res!528425 () Bool)

(assert (=> b!780909 (=> res!528425 e!434344)))

(assert (=> b!780909 (= res!528425 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348005)))))

(declare-fun b!780910 () Bool)

(declare-fun res!528419 () Bool)

(assert (=> b!780910 (=> (not res!528419) (not e!434342))))

(assert (=> b!780910 (= res!528419 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20832 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20832 a!3186))))))

(declare-fun b!780911 () Bool)

(assert (=> b!780911 (= e!434347 e!434348)))

(declare-fun res!528415 () Bool)

(assert (=> b!780911 (=> (not res!528415) (not e!434348))))

(declare-fun lt!348006 () SeekEntryResult!8011)

(assert (=> b!780911 (= res!528415 (= lt!348006 lt!348009))))

(declare-fun lt!348010 () array!42640)

(declare-fun lt!348014 () (_ BitVec 64))

(assert (=> b!780911 (= lt!348009 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348014 lt!348010 mask!3328))))

(assert (=> b!780911 (= lt!348006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348014 mask!3328) lt!348014 lt!348010 mask!3328))))

(assert (=> b!780911 (= lt!348014 (select (store (arr!20411 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780911 (= lt!348010 (array!42641 (store (arr!20411 a!3186) i!1173 k!2102) (size!20832 a!3186)))))

(declare-fun b!780912 () Bool)

(declare-fun res!528417 () Bool)

(assert (=> b!780912 (=> (not res!528417) (not e!434347))))

(assert (=> b!780912 (= res!528417 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20411 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780913 () Bool)

(declare-fun res!528421 () Bool)

(assert (=> b!780913 (=> (not res!528421) (not e!434342))))

(declare-datatypes ((List!14413 0))(
  ( (Nil!14410) (Cons!14409 (h!15526 (_ BitVec 64)) (t!20728 List!14413)) )
))
(declare-fun arrayNoDuplicates!0 (array!42640 (_ BitVec 32) List!14413) Bool)

(assert (=> b!780913 (= res!528421 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14410))))

(declare-fun b!780914 () Bool)

(declare-fun Unit!26934 () Unit!26932)

(assert (=> b!780914 (= e!434340 Unit!26934)))

(assert (=> b!780914 false))

(declare-fun b!780915 () Bool)

(declare-fun res!528411 () Bool)

(declare-fun e!434346 () Bool)

(assert (=> b!780915 (=> (not res!528411) (not e!434346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780915 (= res!528411 (validKeyInArray!0 (select (arr!20411 a!3186) j!159)))))

(declare-fun b!780916 () Bool)

(assert (=> b!780916 (= e!434346 e!434342)))

(declare-fun res!528424 () Bool)

(assert (=> b!780916 (=> (not res!528424) (not e!434342))))

(declare-fun lt!348013 () SeekEntryResult!8011)

(assert (=> b!780916 (= res!528424 (or (= lt!348013 (MissingZero!8011 i!1173)) (= lt!348013 (MissingVacant!8011 i!1173))))))

(assert (=> b!780916 (= lt!348013 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780917 () Bool)

(declare-fun res!528418 () Bool)

(assert (=> b!780917 (=> (not res!528418) (not e!434346))))

(declare-fun arrayContainsKey!0 (array!42640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780917 (= res!528418 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780906 () Bool)

(declare-fun res!528410 () Bool)

(assert (=> b!780906 (=> (not res!528410) (not e!434346))))

(assert (=> b!780906 (= res!528410 (and (= (size!20832 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20832 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20832 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!528409 () Bool)

(assert (=> start!67474 (=> (not res!528409) (not e!434346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67474 (= res!528409 (validMask!0 mask!3328))))

(assert (=> start!67474 e!434346))

(assert (=> start!67474 true))

(declare-fun array_inv!16207 (array!42640) Bool)

(assert (=> start!67474 (array_inv!16207 a!3186)))

(declare-fun b!780918 () Bool)

(declare-fun res!528423 () Bool)

(assert (=> b!780918 (=> (not res!528423) (not e!434347))))

(declare-fun e!434341 () Bool)

(assert (=> b!780918 (= res!528423 e!434341)))

(declare-fun c!86652 () Bool)

(assert (=> b!780918 (= c!86652 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780919 () Bool)

(declare-fun Unit!26935 () Unit!26932)

(assert (=> b!780919 (= e!434340 Unit!26935)))

(declare-fun b!780920 () Bool)

(assert (=> b!780920 (= e!434341 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348012))))

(declare-fun b!780921 () Bool)

(assert (=> b!780921 (= e!434341 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) (Found!8011 j!159)))))

(declare-fun b!780922 () Bool)

(declare-fun res!528413 () Bool)

(assert (=> b!780922 (=> (not res!528413) (not e!434342))))

(assert (=> b!780922 (= res!528413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780923 () Bool)

(declare-fun res!528414 () Bool)

(assert (=> b!780923 (=> (not res!528414) (not e!434346))))

(assert (=> b!780923 (= res!528414 (validKeyInArray!0 k!2102))))

(declare-fun b!780924 () Bool)

(declare-fun res!528420 () Bool)

(assert (=> b!780924 (=> res!528420 e!434344)))

(assert (=> b!780924 (= res!528420 (= (select (store (arr!20411 a!3186) i!1173 k!2102) index!1321) lt!348014))))

(assert (= (and start!67474 res!528409) b!780906))

(assert (= (and b!780906 res!528410) b!780915))

(assert (= (and b!780915 res!528411) b!780923))

(assert (= (and b!780923 res!528414) b!780917))

(assert (= (and b!780917 res!528418) b!780916))

(assert (= (and b!780916 res!528424) b!780922))

(assert (= (and b!780922 res!528413) b!780913))

(assert (= (and b!780913 res!528421) b!780910))

(assert (= (and b!780910 res!528419) b!780905))

(assert (= (and b!780905 res!528416) b!780912))

(assert (= (and b!780912 res!528417) b!780918))

(assert (= (and b!780918 c!86652) b!780920))

(assert (= (and b!780918 (not c!86652)) b!780921))

(assert (= (and b!780918 res!528423) b!780911))

(assert (= (and b!780911 res!528415) b!780904))

(assert (= (and b!780904 res!528412) b!780907))

(assert (= (and b!780904 (not res!528422)) b!780909))

(assert (= (and b!780909 (not res!528425)) b!780924))

(assert (= (and b!780924 (not res!528420)) b!780908))

(assert (= (and b!780908 c!86653) b!780914))

(assert (= (and b!780908 (not c!86653)) b!780919))

(declare-fun m!724097 () Bool)

(assert (=> b!780916 m!724097))

(declare-fun m!724099 () Bool)

(assert (=> b!780908 m!724099))

(declare-fun m!724101 () Bool)

(assert (=> b!780908 m!724101))

(declare-fun m!724103 () Bool)

(assert (=> b!780917 m!724103))

(declare-fun m!724105 () Bool)

(assert (=> b!780905 m!724105))

(assert (=> b!780905 m!724105))

(declare-fun m!724107 () Bool)

(assert (=> b!780905 m!724107))

(assert (=> b!780905 m!724107))

(assert (=> b!780905 m!724105))

(declare-fun m!724109 () Bool)

(assert (=> b!780905 m!724109))

(declare-fun m!724111 () Bool)

(assert (=> b!780922 m!724111))

(assert (=> b!780924 m!724099))

(assert (=> b!780924 m!724101))

(assert (=> b!780907 m!724105))

(assert (=> b!780907 m!724105))

(declare-fun m!724113 () Bool)

(assert (=> b!780907 m!724113))

(assert (=> b!780921 m!724105))

(assert (=> b!780921 m!724105))

(declare-fun m!724115 () Bool)

(assert (=> b!780921 m!724115))

(assert (=> b!780911 m!724099))

(declare-fun m!724117 () Bool)

(assert (=> b!780911 m!724117))

(declare-fun m!724119 () Bool)

(assert (=> b!780911 m!724119))

(declare-fun m!724121 () Bool)

(assert (=> b!780911 m!724121))

(declare-fun m!724123 () Bool)

(assert (=> b!780911 m!724123))

(assert (=> b!780911 m!724121))

(declare-fun m!724125 () Bool)

(assert (=> b!780913 m!724125))

(declare-fun m!724127 () Bool)

(assert (=> b!780923 m!724127))

(declare-fun m!724129 () Bool)

(assert (=> b!780912 m!724129))

(assert (=> b!780904 m!724105))

(assert (=> b!780904 m!724105))

(declare-fun m!724131 () Bool)

(assert (=> b!780904 m!724131))

(declare-fun m!724133 () Bool)

(assert (=> b!780904 m!724133))

(declare-fun m!724135 () Bool)

(assert (=> b!780904 m!724135))

(declare-fun m!724137 () Bool)

(assert (=> start!67474 m!724137))

(declare-fun m!724139 () Bool)

(assert (=> start!67474 m!724139))

(assert (=> b!780920 m!724105))

(assert (=> b!780920 m!724105))

(declare-fun m!724141 () Bool)

(assert (=> b!780920 m!724141))

(assert (=> b!780909 m!724105))

(assert (=> b!780909 m!724105))

(assert (=> b!780909 m!724115))

(assert (=> b!780915 m!724105))

(assert (=> b!780915 m!724105))

(declare-fun m!724143 () Bool)

(assert (=> b!780915 m!724143))

(push 1)

(assert (not start!67474))

(assert (not b!780915))

(assert (not b!780916))

(assert (not b!780921))

(assert (not b!780922))

(assert (not b!780905))

(assert (not b!780920))

(assert (not b!780909))

(assert (not b!780911))

(assert (not b!780923))

(assert (not b!780917))

(assert (not b!780913))

(assert (not b!780907))

(assert (not b!780904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102535 () Bool)

(declare-fun lt!348037 () SeekEntryResult!8011)

(assert (=> d!102535 (and (or (is-Undefined!8011 lt!348037) (not (is-Found!8011 lt!348037)) (and (bvsge (index!34413 lt!348037) #b00000000000000000000000000000000) (bvslt (index!34413 lt!348037) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348037) (is-Found!8011 lt!348037) (not (is-MissingVacant!8011 lt!348037)) (not (= (index!34415 lt!348037) resIntermediateIndex!5)) (and (bvsge (index!34415 lt!348037) #b00000000000000000000000000000000) (bvslt (index!34415 lt!348037) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348037) (ite (is-Found!8011 lt!348037) (= (select (arr!20411 a!3186) (index!34413 lt!348037)) (select (arr!20411 a!3186) j!159)) (and (is-MissingVacant!8011 lt!348037) (= (index!34415 lt!348037) resIntermediateIndex!5) (= (select (arr!20411 a!3186) (index!34415 lt!348037)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!434393 () SeekEntryResult!8011)

(assert (=> d!102535 (= lt!348037 e!434393)))

(declare-fun c!86689 () Bool)

(assert (=> d!102535 (= c!86689 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!348038 () (_ BitVec 64))

(assert (=> d!102535 (= lt!348038 (select (arr!20411 a!3186) index!1321))))

(assert (=> d!102535 (validMask!0 mask!3328)))

(assert (=> d!102535 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348037)))

(declare-fun b!781006 () Bool)

(declare-fun e!434394 () SeekEntryResult!8011)

(assert (=> b!781006 (= e!434394 (Found!8011 index!1321))))

(declare-fun b!781007 () Bool)

(assert (=> b!781007 (= e!434393 e!434394)))

(declare-fun c!86687 () Bool)

(assert (=> b!781007 (= c!86687 (= lt!348038 (select (arr!20411 a!3186) j!159)))))

(declare-fun b!781008 () Bool)

(declare-fun c!86688 () Bool)

(assert (=> b!781008 (= c!86688 (= lt!348038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434392 () SeekEntryResult!8011)

(assert (=> b!781008 (= e!434394 e!434392)))

(declare-fun b!781009 () Bool)

(assert (=> b!781009 (= e!434393 Undefined!8011)))

(declare-fun b!781010 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781010 (= e!434392 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781011 () Bool)

(assert (=> b!781011 (= e!434392 (MissingVacant!8011 resIntermediateIndex!5))))

(assert (= (and d!102535 c!86689) b!781009))

(assert (= (and d!102535 (not c!86689)) b!781007))

(assert (= (and b!781007 c!86687) b!781006))

(assert (= (and b!781007 (not c!86687)) b!781008))

(assert (= (and b!781008 c!86688) b!781011))

(assert (= (and b!781008 (not c!86688)) b!781010))

(declare-fun m!724167 () Bool)

(assert (=> d!102535 m!724167))

(declare-fun m!724169 () Bool)

(assert (=> d!102535 m!724169))

(declare-fun m!724171 () Bool)

(assert (=> d!102535 m!724171))

(assert (=> d!102535 m!724137))

(declare-fun m!724173 () Bool)

(assert (=> b!781010 m!724173))

(assert (=> b!781010 m!724173))

(assert (=> b!781010 m!724105))

(declare-fun m!724175 () Bool)

(assert (=> b!781010 m!724175))

(assert (=> b!780921 d!102535))

(declare-fun b!781100 () Bool)

(declare-fun lt!348082 () SeekEntryResult!8011)

(assert (=> b!781100 (and (bvsge (index!34414 lt!348082) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348082) (size!20832 lt!348010)))))

(declare-fun res!528463 () Bool)

(assert (=> b!781100 (= res!528463 (= (select (arr!20411 lt!348010) (index!34414 lt!348082)) lt!348014))))

(declare-fun e!434442 () Bool)

(assert (=> b!781100 (=> res!528463 e!434442)))

(declare-fun e!434447 () Bool)

(assert (=> b!781100 (= e!434447 e!434442)))

(declare-fun b!781101 () Bool)

(assert (=> b!781101 (and (bvsge (index!34414 lt!348082) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348082) (size!20832 lt!348010)))))

(declare-fun res!528465 () Bool)

(assert (=> b!781101 (= res!528465 (= (select (arr!20411 lt!348010) (index!34414 lt!348082)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781101 (=> res!528465 e!434442)))

(declare-fun b!781102 () Bool)

(declare-fun e!434446 () SeekEntryResult!8011)

(declare-fun e!434445 () SeekEntryResult!8011)

(assert (=> b!781102 (= e!434446 e!434445)))

(declare-fun c!86722 () Bool)

(declare-fun lt!348079 () (_ BitVec 64))

(assert (=> b!781102 (= c!86722 (or (= lt!348079 lt!348014) (= (bvadd lt!348079 lt!348079) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781103 () Bool)

(assert (=> b!781103 (= e!434446 (Intermediate!8011 true index!1321 x!1131))))

(declare-fun b!781104 () Bool)

(declare-fun e!434448 () Bool)

(assert (=> b!781104 (= e!434448 e!434447)))

(declare-fun res!528461 () Bool)

(assert (=> b!781104 (= res!528461 (and (is-Intermediate!8011 lt!348082) (not (undefined!8823 lt!348082)) (bvslt (x!65357 lt!348082) #b01111111111111111111111111111110) (bvsge (x!65357 lt!348082) #b00000000000000000000000000000000) (bvsge (x!65357 lt!348082) x!1131)))))

(assert (=> b!781104 (=> (not res!528461) (not e!434447))))

(declare-fun b!781105 () Bool)

(assert (=> b!781105 (= e!434448 (bvsge (x!65357 lt!348082) #b01111111111111111111111111111110))))

(declare-fun d!102543 () Bool)

(assert (=> d!102543 e!434448))

(declare-fun c!86725 () Bool)

(assert (=> d!102543 (= c!86725 (and (is-Intermediate!8011 lt!348082) (undefined!8823 lt!348082)))))

(assert (=> d!102543 (= lt!348082 e!434446)))

(declare-fun c!86724 () Bool)

(assert (=> d!102543 (= c!86724 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102543 (= lt!348079 (select (arr!20411 lt!348010) index!1321))))

(assert (=> d!102543 (validMask!0 mask!3328)))

(assert (=> d!102543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348014 lt!348010 mask!3328) lt!348082)))

(declare-fun b!781098 () Bool)

(assert (=> b!781098 (= e!434445 (Intermediate!8011 false index!1321 x!1131))))

(declare-fun b!781106 () Bool)

(assert (=> b!781106 (and (bvsge (index!34414 lt!348082) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348082) (size!20832 lt!348010)))))

(assert (=> b!781106 (= e!434442 (= (select (arr!20411 lt!348010) (index!34414 lt!348082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781107 () Bool)

(assert (=> b!781107 (= e!434445 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!348014 lt!348010 mask!3328))))

(assert (= (and d!102543 c!86724) b!781103))

(assert (= (and d!102543 (not c!86724)) b!781102))

(assert (= (and b!781102 c!86722) b!781098))

(assert (= (and b!781102 (not c!86722)) b!781107))

(assert (= (and d!102543 c!86725) b!781105))

(assert (= (and d!102543 (not c!86725)) b!781104))

(assert (= (and b!781104 res!528461) b!781100))

(assert (= (and b!781100 (not res!528463)) b!781101))

(assert (= (and b!781101 (not res!528465)) b!781106))

(declare-fun m!724217 () Bool)

(assert (=> d!102543 m!724217))

(assert (=> d!102543 m!724137))

(declare-fun m!724219 () Bool)

(assert (=> b!781100 m!724219))

(assert (=> b!781106 m!724219))

(assert (=> b!781101 m!724219))

(assert (=> b!781107 m!724173))

(assert (=> b!781107 m!724173))

(declare-fun m!724221 () Bool)

(assert (=> b!781107 m!724221))

(assert (=> b!780911 d!102543))

(declare-fun b!781109 () Bool)

(declare-fun lt!348084 () SeekEntryResult!8011)

(assert (=> b!781109 (and (bvsge (index!34414 lt!348084) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348084) (size!20832 lt!348010)))))

(declare-fun res!528467 () Bool)

(assert (=> b!781109 (= res!528467 (= (select (arr!20411 lt!348010) (index!34414 lt!348084)) lt!348014))))

(declare-fun e!434449 () Bool)

(assert (=> b!781109 (=> res!528467 e!434449)))

(declare-fun e!434452 () Bool)

(assert (=> b!781109 (= e!434452 e!434449)))

(declare-fun b!781110 () Bool)

(assert (=> b!781110 (and (bvsge (index!34414 lt!348084) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348084) (size!20832 lt!348010)))))

(declare-fun res!528468 () Bool)

(assert (=> b!781110 (= res!528468 (= (select (arr!20411 lt!348010) (index!34414 lt!348084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781110 (=> res!528468 e!434449)))

(declare-fun b!781111 () Bool)

(declare-fun e!434451 () SeekEntryResult!8011)

(declare-fun e!434450 () SeekEntryResult!8011)

(assert (=> b!781111 (= e!434451 e!434450)))

(declare-fun c!86726 () Bool)

(declare-fun lt!348083 () (_ BitVec 64))

(assert (=> b!781111 (= c!86726 (or (= lt!348083 lt!348014) (= (bvadd lt!348083 lt!348083) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781112 () Bool)

(assert (=> b!781112 (= e!434451 (Intermediate!8011 true (toIndex!0 lt!348014 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781113 () Bool)

(declare-fun e!434453 () Bool)

(assert (=> b!781113 (= e!434453 e!434452)))

(declare-fun res!528466 () Bool)

(assert (=> b!781113 (= res!528466 (and (is-Intermediate!8011 lt!348084) (not (undefined!8823 lt!348084)) (bvslt (x!65357 lt!348084) #b01111111111111111111111111111110) (bvsge (x!65357 lt!348084) #b00000000000000000000000000000000) (bvsge (x!65357 lt!348084) #b00000000000000000000000000000000)))))

(assert (=> b!781113 (=> (not res!528466) (not e!434452))))

(declare-fun b!781114 () Bool)

(assert (=> b!781114 (= e!434453 (bvsge (x!65357 lt!348084) #b01111111111111111111111111111110))))

(declare-fun d!102559 () Bool)

(assert (=> d!102559 e!434453))

(declare-fun c!86728 () Bool)

(assert (=> d!102559 (= c!86728 (and (is-Intermediate!8011 lt!348084) (undefined!8823 lt!348084)))))

(assert (=> d!102559 (= lt!348084 e!434451)))

(declare-fun c!86727 () Bool)

(assert (=> d!102559 (= c!86727 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102559 (= lt!348083 (select (arr!20411 lt!348010) (toIndex!0 lt!348014 mask!3328)))))

(assert (=> d!102559 (validMask!0 mask!3328)))

(assert (=> d!102559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348014 mask!3328) lt!348014 lt!348010 mask!3328) lt!348084)))

(declare-fun b!781108 () Bool)

(assert (=> b!781108 (= e!434450 (Intermediate!8011 false (toIndex!0 lt!348014 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781115 () Bool)

(assert (=> b!781115 (and (bvsge (index!34414 lt!348084) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348084) (size!20832 lt!348010)))))

(assert (=> b!781115 (= e!434449 (= (select (arr!20411 lt!348010) (index!34414 lt!348084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781116 () Bool)

(assert (=> b!781116 (= e!434450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!348014 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!348014 lt!348010 mask!3328))))

(assert (= (and d!102559 c!86727) b!781112))

(assert (= (and d!102559 (not c!86727)) b!781111))

(assert (= (and b!781111 c!86726) b!781108))

(assert (= (and b!781111 (not c!86726)) b!781116))

(assert (= (and d!102559 c!86728) b!781114))

(assert (= (and d!102559 (not c!86728)) b!781113))

(assert (= (and b!781113 res!528466) b!781109))

(assert (= (and b!781109 (not res!528467)) b!781110))

(assert (= (and b!781110 (not res!528468)) b!781115))

(assert (=> d!102559 m!724121))

(declare-fun m!724223 () Bool)

(assert (=> d!102559 m!724223))

(assert (=> d!102559 m!724137))

(declare-fun m!724225 () Bool)

(assert (=> b!781109 m!724225))

(assert (=> b!781115 m!724225))

(assert (=> b!781110 m!724225))

(assert (=> b!781116 m!724121))

(declare-fun m!724227 () Bool)

(assert (=> b!781116 m!724227))

(assert (=> b!781116 m!724227))

(declare-fun m!724229 () Bool)

(assert (=> b!781116 m!724229))

(assert (=> b!780911 d!102559))

(declare-fun d!102561 () Bool)

(declare-fun lt!348104 () (_ BitVec 32))

(declare-fun lt!348103 () (_ BitVec 32))

(assert (=> d!102561 (= lt!348104 (bvmul (bvxor lt!348103 (bvlshr lt!348103 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102561 (= lt!348103 ((_ extract 31 0) (bvand (bvxor lt!348014 (bvlshr lt!348014 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102561 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528469 (let ((h!15528 ((_ extract 31 0) (bvand (bvxor lt!348014 (bvlshr lt!348014 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65364 (bvmul (bvxor h!15528 (bvlshr h!15528 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65364 (bvlshr x!65364 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528469 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528469 #b00000000000000000000000000000000))))))

(assert (=> d!102561 (= (toIndex!0 lt!348014 mask!3328) (bvand (bvxor lt!348104 (bvlshr lt!348104 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780911 d!102561))

(declare-fun b!781195 () Bool)

(declare-fun e!434510 () Bool)

(declare-fun call!35245 () Bool)

(assert (=> b!781195 (= e!434510 call!35245)))

(declare-fun b!781196 () Bool)

(declare-fun e!434509 () Bool)

(assert (=> b!781196 (= e!434509 call!35245)))

(declare-fun d!102577 () Bool)

(declare-fun res!528508 () Bool)

(declare-fun e!434508 () Bool)

(assert (=> d!102577 (=> res!528508 e!434508)))

(assert (=> d!102577 (= res!528508 (bvsge #b00000000000000000000000000000000 (size!20832 a!3186)))))

(assert (=> d!102577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!434508)))

(declare-fun b!781197 () Bool)

(assert (=> b!781197 (= e!434508 e!434510)))

(declare-fun c!86750 () Bool)

(assert (=> b!781197 (= c!86750 (validKeyInArray!0 (select (arr!20411 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781198 () Bool)

(assert (=> b!781198 (= e!434510 e!434509)))

(declare-fun lt!348117 () (_ BitVec 64))

(assert (=> b!781198 (= lt!348117 (select (arr!20411 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348116 () Unit!26932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42640 (_ BitVec 64) (_ BitVec 32)) Unit!26932)

(assert (=> b!781198 (= lt!348116 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348117 #b00000000000000000000000000000000))))

(assert (=> b!781198 (arrayContainsKey!0 a!3186 lt!348117 #b00000000000000000000000000000000)))

(declare-fun lt!348115 () Unit!26932)

(assert (=> b!781198 (= lt!348115 lt!348116)))

(declare-fun res!528507 () Bool)

(assert (=> b!781198 (= res!528507 (= (seekEntryOrOpen!0 (select (arr!20411 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8011 #b00000000000000000000000000000000)))))

(assert (=> b!781198 (=> (not res!528507) (not e!434509))))

(declare-fun bm!35242 () Bool)

(assert (=> bm!35242 (= call!35245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102577 (not res!528508)) b!781197))

(assert (= (and b!781197 c!86750) b!781198))

(assert (= (and b!781197 (not c!86750)) b!781195))

(assert (= (and b!781198 res!528507) b!781196))

(assert (= (or b!781196 b!781195) bm!35242))

(declare-fun m!724305 () Bool)

(assert (=> b!781197 m!724305))

(assert (=> b!781197 m!724305))

(declare-fun m!724307 () Bool)

(assert (=> b!781197 m!724307))

(assert (=> b!781198 m!724305))

(declare-fun m!724309 () Bool)

(assert (=> b!781198 m!724309))

(declare-fun m!724311 () Bool)

(assert (=> b!781198 m!724311))

(assert (=> b!781198 m!724305))

(declare-fun m!724313 () Bool)

(assert (=> b!781198 m!724313))

(declare-fun m!724315 () Bool)

(assert (=> bm!35242 m!724315))

(assert (=> b!780922 d!102577))

(declare-fun d!102589 () Bool)

(assert (=> d!102589 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780923 d!102589))

(assert (=> b!780909 d!102535))

(declare-fun b!781200 () Bool)

(declare-fun lt!348125 () SeekEntryResult!8011)

(assert (=> b!781200 (and (bvsge (index!34414 lt!348125) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348125) (size!20832 a!3186)))))

(declare-fun res!528510 () Bool)

(assert (=> b!781200 (= res!528510 (= (select (arr!20411 a!3186) (index!34414 lt!348125)) (select (arr!20411 a!3186) j!159)))))

(declare-fun e!434511 () Bool)

(assert (=> b!781200 (=> res!528510 e!434511)))

(declare-fun e!434514 () Bool)

(assert (=> b!781200 (= e!434514 e!434511)))

(declare-fun b!781201 () Bool)

(assert (=> b!781201 (and (bvsge (index!34414 lt!348125) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348125) (size!20832 a!3186)))))

(declare-fun res!528511 () Bool)

(assert (=> b!781201 (= res!528511 (= (select (arr!20411 a!3186) (index!34414 lt!348125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781201 (=> res!528511 e!434511)))

(declare-fun b!781202 () Bool)

(declare-fun e!434513 () SeekEntryResult!8011)

(declare-fun e!434512 () SeekEntryResult!8011)

(assert (=> b!781202 (= e!434513 e!434512)))

(declare-fun c!86751 () Bool)

(declare-fun lt!348124 () (_ BitVec 64))

(assert (=> b!781202 (= c!86751 (or (= lt!348124 (select (arr!20411 a!3186) j!159)) (= (bvadd lt!348124 lt!348124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781203 () Bool)

(assert (=> b!781203 (= e!434513 (Intermediate!8011 true index!1321 x!1131))))

(declare-fun b!781204 () Bool)

(declare-fun e!434515 () Bool)

(assert (=> b!781204 (= e!434515 e!434514)))

(declare-fun res!528509 () Bool)

(assert (=> b!781204 (= res!528509 (and (is-Intermediate!8011 lt!348125) (not (undefined!8823 lt!348125)) (bvslt (x!65357 lt!348125) #b01111111111111111111111111111110) (bvsge (x!65357 lt!348125) #b00000000000000000000000000000000) (bvsge (x!65357 lt!348125) x!1131)))))

(assert (=> b!781204 (=> (not res!528509) (not e!434514))))

(declare-fun b!781205 () Bool)

(assert (=> b!781205 (= e!434515 (bvsge (x!65357 lt!348125) #b01111111111111111111111111111110))))

(declare-fun d!102593 () Bool)

(assert (=> d!102593 e!434515))

(declare-fun c!86753 () Bool)

(assert (=> d!102593 (= c!86753 (and (is-Intermediate!8011 lt!348125) (undefined!8823 lt!348125)))))

(assert (=> d!102593 (= lt!348125 e!434513)))

(declare-fun c!86752 () Bool)

(assert (=> d!102593 (= c!86752 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102593 (= lt!348124 (select (arr!20411 a!3186) index!1321))))

(assert (=> d!102593 (validMask!0 mask!3328)))

(assert (=> d!102593 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348125)))

(declare-fun b!781199 () Bool)

(assert (=> b!781199 (= e!434512 (Intermediate!8011 false index!1321 x!1131))))

(declare-fun b!781206 () Bool)

(assert (=> b!781206 (and (bvsge (index!34414 lt!348125) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348125) (size!20832 a!3186)))))

(assert (=> b!781206 (= e!434511 (= (select (arr!20411 a!3186) (index!34414 lt!348125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781207 () Bool)

(assert (=> b!781207 (= e!434512 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102593 c!86752) b!781203))

(assert (= (and d!102593 (not c!86752)) b!781202))

(assert (= (and b!781202 c!86751) b!781199))

(assert (= (and b!781202 (not c!86751)) b!781207))

(assert (= (and d!102593 c!86753) b!781205))

(assert (= (and d!102593 (not c!86753)) b!781204))

(assert (= (and b!781204 res!528509) b!781200))

(assert (= (and b!781200 (not res!528510)) b!781201))

(assert (= (and b!781201 (not res!528511)) b!781206))

(assert (=> d!102593 m!724171))

(assert (=> d!102593 m!724137))

(declare-fun m!724317 () Bool)

(assert (=> b!781200 m!724317))

(assert (=> b!781206 m!724317))

(assert (=> b!781201 m!724317))

(assert (=> b!781207 m!724173))

(assert (=> b!781207 m!724173))

(assert (=> b!781207 m!724105))

(declare-fun m!724319 () Bool)

(assert (=> b!781207 m!724319))

(assert (=> b!780920 d!102593))

(declare-fun b!781209 () Bool)

(declare-fun lt!348127 () SeekEntryResult!8011)

(assert (=> b!781209 (and (bvsge (index!34414 lt!348127) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348127) (size!20832 a!3186)))))

(declare-fun res!528513 () Bool)

(assert (=> b!781209 (= res!528513 (= (select (arr!20411 a!3186) (index!34414 lt!348127)) (select (arr!20411 a!3186) j!159)))))

(declare-fun e!434516 () Bool)

(assert (=> b!781209 (=> res!528513 e!434516)))

(declare-fun e!434519 () Bool)

(assert (=> b!781209 (= e!434519 e!434516)))

(declare-fun b!781210 () Bool)

(assert (=> b!781210 (and (bvsge (index!34414 lt!348127) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348127) (size!20832 a!3186)))))

(declare-fun res!528514 () Bool)

(assert (=> b!781210 (= res!528514 (= (select (arr!20411 a!3186) (index!34414 lt!348127)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781210 (=> res!528514 e!434516)))

(declare-fun b!781211 () Bool)

(declare-fun e!434518 () SeekEntryResult!8011)

(declare-fun e!434517 () SeekEntryResult!8011)

(assert (=> b!781211 (= e!434518 e!434517)))

(declare-fun c!86754 () Bool)

(declare-fun lt!348126 () (_ BitVec 64))

(assert (=> b!781211 (= c!86754 (or (= lt!348126 (select (arr!20411 a!3186) j!159)) (= (bvadd lt!348126 lt!348126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781212 () Bool)

(assert (=> b!781212 (= e!434518 (Intermediate!8011 true (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781213 () Bool)

(declare-fun e!434520 () Bool)

(assert (=> b!781213 (= e!434520 e!434519)))

(declare-fun res!528512 () Bool)

(assert (=> b!781213 (= res!528512 (and (is-Intermediate!8011 lt!348127) (not (undefined!8823 lt!348127)) (bvslt (x!65357 lt!348127) #b01111111111111111111111111111110) (bvsge (x!65357 lt!348127) #b00000000000000000000000000000000) (bvsge (x!65357 lt!348127) #b00000000000000000000000000000000)))))

(assert (=> b!781213 (=> (not res!528512) (not e!434519))))

(declare-fun b!781214 () Bool)

(assert (=> b!781214 (= e!434520 (bvsge (x!65357 lt!348127) #b01111111111111111111111111111110))))

(declare-fun d!102595 () Bool)

(assert (=> d!102595 e!434520))

(declare-fun c!86756 () Bool)

(assert (=> d!102595 (= c!86756 (and (is-Intermediate!8011 lt!348127) (undefined!8823 lt!348127)))))

(assert (=> d!102595 (= lt!348127 e!434518)))

(declare-fun c!86755 () Bool)

(assert (=> d!102595 (= c!86755 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102595 (= lt!348126 (select (arr!20411 a!3186) (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328)))))

(assert (=> d!102595 (validMask!0 mask!3328)))

(assert (=> d!102595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348127)))

(declare-fun b!781208 () Bool)

(assert (=> b!781208 (= e!434517 (Intermediate!8011 false (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!781215 () Bool)

(assert (=> b!781215 (and (bvsge (index!34414 lt!348127) #b00000000000000000000000000000000) (bvslt (index!34414 lt!348127) (size!20832 a!3186)))))

(assert (=> b!781215 (= e!434516 (= (select (arr!20411 a!3186) (index!34414 lt!348127)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781216 () Bool)

(assert (=> b!781216 (= e!434517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102595 c!86755) b!781212))

(assert (= (and d!102595 (not c!86755)) b!781211))

(assert (= (and b!781211 c!86754) b!781208))

(assert (= (and b!781211 (not c!86754)) b!781216))

(assert (= (and d!102595 c!86756) b!781214))

(assert (= (and d!102595 (not c!86756)) b!781213))

(assert (= (and b!781213 res!528512) b!781209))

(assert (= (and b!781209 (not res!528513)) b!781210))

(assert (= (and b!781210 (not res!528514)) b!781215))

(assert (=> d!102595 m!724107))

(declare-fun m!724321 () Bool)

(assert (=> d!102595 m!724321))

(assert (=> d!102595 m!724137))

(declare-fun m!724323 () Bool)

(assert (=> b!781209 m!724323))

(assert (=> b!781215 m!724323))

(assert (=> b!781210 m!724323))

(assert (=> b!781216 m!724107))

(declare-fun m!724325 () Bool)

(assert (=> b!781216 m!724325))

(assert (=> b!781216 m!724325))

(assert (=> b!781216 m!724105))

(declare-fun m!724327 () Bool)

(assert (=> b!781216 m!724327))

(assert (=> b!780905 d!102595))

(declare-fun d!102597 () Bool)

(declare-fun lt!348129 () (_ BitVec 32))

(declare-fun lt!348128 () (_ BitVec 32))

(assert (=> d!102597 (= lt!348129 (bvmul (bvxor lt!348128 (bvlshr lt!348128 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102597 (= lt!348128 ((_ extract 31 0) (bvand (bvxor (select (arr!20411 a!3186) j!159) (bvlshr (select (arr!20411 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102597 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528469 (let ((h!15528 ((_ extract 31 0) (bvand (bvxor (select (arr!20411 a!3186) j!159) (bvlshr (select (arr!20411 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65364 (bvmul (bvxor h!15528 (bvlshr h!15528 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65364 (bvlshr x!65364 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528469 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528469 #b00000000000000000000000000000000))))))

(assert (=> d!102597 (= (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) (bvand (bvxor lt!348129 (bvlshr lt!348129 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780905 d!102597))

(declare-fun b!781289 () Bool)

(declare-fun e!434567 () SeekEntryResult!8011)

(declare-fun lt!348157 () SeekEntryResult!8011)

(assert (=> b!781289 (= e!434567 (MissingZero!8011 (index!34414 lt!348157)))))

(declare-fun b!781290 () Bool)

(declare-fun e!434566 () SeekEntryResult!8011)

(declare-fun e!434565 () SeekEntryResult!8011)

(assert (=> b!781290 (= e!434566 e!434565)))

(declare-fun lt!348159 () (_ BitVec 64))

(assert (=> b!781290 (= lt!348159 (select (arr!20411 a!3186) (index!34414 lt!348157)))))

(declare-fun c!86784 () Bool)

(assert (=> b!781290 (= c!86784 (= lt!348159 k!2102))))

(declare-fun b!781291 () Bool)

(assert (=> b!781291 (= e!434565 (Found!8011 (index!34414 lt!348157)))))

(declare-fun b!781292 () Bool)

(declare-fun c!86786 () Bool)

(assert (=> b!781292 (= c!86786 (= lt!348159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781292 (= e!434565 e!434567)))

(declare-fun d!102599 () Bool)

(declare-fun lt!348158 () SeekEntryResult!8011)

(assert (=> d!102599 (and (or (is-Undefined!8011 lt!348158) (not (is-Found!8011 lt!348158)) (and (bvsge (index!34413 lt!348158) #b00000000000000000000000000000000) (bvslt (index!34413 lt!348158) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348158) (is-Found!8011 lt!348158) (not (is-MissingZero!8011 lt!348158)) (and (bvsge (index!34412 lt!348158) #b00000000000000000000000000000000) (bvslt (index!34412 lt!348158) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348158) (is-Found!8011 lt!348158) (is-MissingZero!8011 lt!348158) (not (is-MissingVacant!8011 lt!348158)) (and (bvsge (index!34415 lt!348158) #b00000000000000000000000000000000) (bvslt (index!34415 lt!348158) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348158) (ite (is-Found!8011 lt!348158) (= (select (arr!20411 a!3186) (index!34413 lt!348158)) k!2102) (ite (is-MissingZero!8011 lt!348158) (= (select (arr!20411 a!3186) (index!34412 lt!348158)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8011 lt!348158) (= (select (arr!20411 a!3186) (index!34415 lt!348158)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102599 (= lt!348158 e!434566)))

(declare-fun c!86785 () Bool)

(assert (=> d!102599 (= c!86785 (and (is-Intermediate!8011 lt!348157) (undefined!8823 lt!348157)))))

(assert (=> d!102599 (= lt!348157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102599 (validMask!0 mask!3328)))

(assert (=> d!102599 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!348158)))

(declare-fun b!781293 () Bool)

(assert (=> b!781293 (= e!434566 Undefined!8011)))

(declare-fun b!781294 () Bool)

(assert (=> b!781294 (= e!434567 (seekKeyOrZeroReturnVacant!0 (x!65357 lt!348157) (index!34414 lt!348157) (index!34414 lt!348157) k!2102 a!3186 mask!3328))))

(assert (= (and d!102599 c!86785) b!781293))

(assert (= (and d!102599 (not c!86785)) b!781290))

(assert (= (and b!781290 c!86784) b!781291))

(assert (= (and b!781290 (not c!86784)) b!781292))

(assert (= (and b!781292 c!86786) b!781289))

(assert (= (and b!781292 (not c!86786)) b!781294))

(declare-fun m!724363 () Bool)

(assert (=> b!781290 m!724363))

(declare-fun m!724365 () Bool)

(assert (=> d!102599 m!724365))

(declare-fun m!724367 () Bool)

(assert (=> d!102599 m!724367))

(declare-fun m!724369 () Bool)

(assert (=> d!102599 m!724369))

(declare-fun m!724371 () Bool)

(assert (=> d!102599 m!724371))

(assert (=> d!102599 m!724137))

(assert (=> d!102599 m!724371))

(declare-fun m!724373 () Bool)

(assert (=> d!102599 m!724373))

(declare-fun m!724375 () Bool)

(assert (=> b!781294 m!724375))

(assert (=> b!780916 d!102599))

(declare-fun d!102611 () Bool)

(declare-fun res!528537 () Bool)

(declare-fun e!434575 () Bool)

(assert (=> d!102611 (=> res!528537 e!434575)))

(assert (=> d!102611 (= res!528537 (= (select (arr!20411 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102611 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!434575)))

(declare-fun b!781305 () Bool)

(declare-fun e!434576 () Bool)

(assert (=> b!781305 (= e!434575 e!434576)))

(declare-fun res!528538 () Bool)

(assert (=> b!781305 (=> (not res!528538) (not e!434576))))

(assert (=> b!781305 (= res!528538 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20832 a!3186)))))

(declare-fun b!781306 () Bool)

(assert (=> b!781306 (= e!434576 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102611 (not res!528537)) b!781305))

(assert (= (and b!781305 res!528538) b!781306))

(assert (=> d!102611 m!724305))

(declare-fun m!724377 () Bool)

(assert (=> b!781306 m!724377))

(assert (=> b!780917 d!102611))

(declare-fun d!102617 () Bool)

(declare-fun lt!348163 () SeekEntryResult!8011)

(assert (=> d!102617 (and (or (is-Undefined!8011 lt!348163) (not (is-Found!8011 lt!348163)) (and (bvsge (index!34413 lt!348163) #b00000000000000000000000000000000) (bvslt (index!34413 lt!348163) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348163) (is-Found!8011 lt!348163) (not (is-MissingVacant!8011 lt!348163)) (not (= (index!34415 lt!348163) resIntermediateIndex!5)) (and (bvsge (index!34415 lt!348163) #b00000000000000000000000000000000) (bvslt (index!34415 lt!348163) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348163) (ite (is-Found!8011 lt!348163) (= (select (arr!20411 a!3186) (index!34413 lt!348163)) (select (arr!20411 a!3186) j!159)) (and (is-MissingVacant!8011 lt!348163) (= (index!34415 lt!348163) resIntermediateIndex!5) (= (select (arr!20411 a!3186) (index!34415 lt!348163)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!434578 () SeekEntryResult!8011)

(assert (=> d!102617 (= lt!348163 e!434578)))

(declare-fun c!86792 () Bool)

(assert (=> d!102617 (= c!86792 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!348164 () (_ BitVec 64))

(assert (=> d!102617 (= lt!348164 (select (arr!20411 a!3186) resIntermediateIndex!5))))

(assert (=> d!102617 (validMask!0 mask!3328)))

(assert (=> d!102617 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!348163)))

(declare-fun b!781307 () Bool)

(declare-fun e!434579 () SeekEntryResult!8011)

(assert (=> b!781307 (= e!434579 (Found!8011 resIntermediateIndex!5))))

(declare-fun b!781308 () Bool)

(assert (=> b!781308 (= e!434578 e!434579)))

(declare-fun c!86790 () Bool)

(assert (=> b!781308 (= c!86790 (= lt!348164 (select (arr!20411 a!3186) j!159)))))

(declare-fun b!781309 () Bool)

(declare-fun c!86791 () Bool)

(assert (=> b!781309 (= c!86791 (= lt!348164 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434577 () SeekEntryResult!8011)

(assert (=> b!781309 (= e!434579 e!434577)))

(declare-fun b!781310 () Bool)

(assert (=> b!781310 (= e!434578 Undefined!8011)))

(declare-fun b!781311 () Bool)

(assert (=> b!781311 (= e!434577 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!781312 () Bool)

(assert (=> b!781312 (= e!434577 (MissingVacant!8011 resIntermediateIndex!5))))

(assert (= (and d!102617 c!86792) b!781310))

(assert (= (and d!102617 (not c!86792)) b!781308))

(assert (= (and b!781308 c!86790) b!781307))

(assert (= (and b!781308 (not c!86790)) b!781309))

(assert (= (and b!781309 c!86791) b!781312))

(assert (= (and b!781309 (not c!86791)) b!781311))

(declare-fun m!724389 () Bool)

(assert (=> d!102617 m!724389))

(declare-fun m!724391 () Bool)

(assert (=> d!102617 m!724391))

(assert (=> d!102617 m!724129))

(assert (=> d!102617 m!724137))

(declare-fun m!724393 () Bool)

(assert (=> b!781311 m!724393))

(assert (=> b!781311 m!724393))

(assert (=> b!781311 m!724105))

(declare-fun m!724395 () Bool)

(assert (=> b!781311 m!724395))

(assert (=> b!780907 d!102617))

(declare-fun d!102621 () Bool)

(assert (=> d!102621 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67474 d!102621))

(declare-fun d!102625 () Bool)

(assert (=> d!102625 (= (array_inv!16207 a!3186) (bvsge (size!20832 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67474 d!102625))

(declare-fun b!781328 () Bool)

(declare-fun e!434593 () Bool)

(declare-fun e!434594 () Bool)

(assert (=> b!781328 (= e!434593 e!434594)))

(declare-fun res!528548 () Bool)

(assert (=> b!781328 (=> (not res!528548) (not e!434594))))

(declare-fun e!434591 () Bool)

(assert (=> b!781328 (= res!528548 (not e!434591))))

(declare-fun res!528549 () Bool)

(assert (=> b!781328 (=> (not res!528549) (not e!434591))))

(assert (=> b!781328 (= res!528549 (validKeyInArray!0 (select (arr!20411 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781329 () Bool)

(declare-fun e!434592 () Bool)

(assert (=> b!781329 (= e!434594 e!434592)))

(declare-fun c!86796 () Bool)

(assert (=> b!781329 (= c!86796 (validKeyInArray!0 (select (arr!20411 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35252 () Bool)

(declare-fun call!35255 () Bool)

(assert (=> bm!35252 (= call!35255 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86796 (Cons!14409 (select (arr!20411 a!3186) #b00000000000000000000000000000000) Nil!14410) Nil!14410)))))

(declare-fun b!781330 () Bool)

(declare-fun contains!4107 (List!14413 (_ BitVec 64)) Bool)

(assert (=> b!781330 (= e!434591 (contains!4107 Nil!14410 (select (arr!20411 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!781331 () Bool)

(assert (=> b!781331 (= e!434592 call!35255)))

(declare-fun d!102627 () Bool)

(declare-fun res!528547 () Bool)

(assert (=> d!102627 (=> res!528547 e!434593)))

(assert (=> d!102627 (= res!528547 (bvsge #b00000000000000000000000000000000 (size!20832 a!3186)))))

(assert (=> d!102627 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14410) e!434593)))

(declare-fun b!781327 () Bool)

(assert (=> b!781327 (= e!434592 call!35255)))

(assert (= (and d!102627 (not res!528547)) b!781328))

(assert (= (and b!781328 res!528549) b!781330))

(assert (= (and b!781328 res!528548) b!781329))

(assert (= (and b!781329 c!86796) b!781331))

(assert (= (and b!781329 (not c!86796)) b!781327))

(assert (= (or b!781331 b!781327) bm!35252))

(assert (=> b!781328 m!724305))

(assert (=> b!781328 m!724305))

(assert (=> b!781328 m!724307))

(assert (=> b!781329 m!724305))

(assert (=> b!781329 m!724305))

(assert (=> b!781329 m!724307))

(assert (=> bm!35252 m!724305))

(declare-fun m!724405 () Bool)

(assert (=> bm!35252 m!724405))

(assert (=> b!781330 m!724305))

(assert (=> b!781330 m!724305))

(declare-fun m!724407 () Bool)

(assert (=> b!781330 m!724407))

(assert (=> b!780913 d!102627))

(declare-fun d!102629 () Bool)

(assert (=> d!102629 (= (validKeyInArray!0 (select (arr!20411 a!3186) j!159)) (and (not (= (select (arr!20411 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20411 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780915 d!102629))

(declare-fun b!781332 () Bool)

(declare-fun e!434597 () SeekEntryResult!8011)

(declare-fun lt!348171 () SeekEntryResult!8011)

(assert (=> b!781332 (= e!434597 (MissingZero!8011 (index!34414 lt!348171)))))

(declare-fun b!781333 () Bool)

(declare-fun e!434596 () SeekEntryResult!8011)

(declare-fun e!434595 () SeekEntryResult!8011)

(assert (=> b!781333 (= e!434596 e!434595)))

(declare-fun lt!348173 () (_ BitVec 64))

(assert (=> b!781333 (= lt!348173 (select (arr!20411 a!3186) (index!34414 lt!348171)))))

(declare-fun c!86797 () Bool)

(assert (=> b!781333 (= c!86797 (= lt!348173 (select (arr!20411 a!3186) j!159)))))

(declare-fun b!781334 () Bool)

(assert (=> b!781334 (= e!434595 (Found!8011 (index!34414 lt!348171)))))

(declare-fun b!781335 () Bool)

(declare-fun c!86799 () Bool)

(assert (=> b!781335 (= c!86799 (= lt!348173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!781335 (= e!434595 e!434597)))

(declare-fun d!102631 () Bool)

(declare-fun lt!348172 () SeekEntryResult!8011)

(assert (=> d!102631 (and (or (is-Undefined!8011 lt!348172) (not (is-Found!8011 lt!348172)) (and (bvsge (index!34413 lt!348172) #b00000000000000000000000000000000) (bvslt (index!34413 lt!348172) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348172) (is-Found!8011 lt!348172) (not (is-MissingZero!8011 lt!348172)) (and (bvsge (index!34412 lt!348172) #b00000000000000000000000000000000) (bvslt (index!34412 lt!348172) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348172) (is-Found!8011 lt!348172) (is-MissingZero!8011 lt!348172) (not (is-MissingVacant!8011 lt!348172)) (and (bvsge (index!34415 lt!348172) #b00000000000000000000000000000000) (bvslt (index!34415 lt!348172) (size!20832 a!3186)))) (or (is-Undefined!8011 lt!348172) (ite (is-Found!8011 lt!348172) (= (select (arr!20411 a!3186) (index!34413 lt!348172)) (select (arr!20411 a!3186) j!159)) (ite (is-MissingZero!8011 lt!348172) (= (select (arr!20411 a!3186) (index!34412 lt!348172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8011 lt!348172) (= (select (arr!20411 a!3186) (index!34415 lt!348172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

