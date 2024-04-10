; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64710 () Bool)

(assert start!64710)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41159 0))(
  ( (array!41160 (arr!19699 (Array (_ BitVec 32) (_ BitVec 64))) (size!20120 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41159)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7299 0))(
  ( (MissingZero!7299 (index!31564 (_ BitVec 32))) (Found!7299 (index!31565 (_ BitVec 32))) (Intermediate!7299 (undefined!8111 Bool) (index!31566 (_ BitVec 32)) (x!62545 (_ BitVec 32))) (Undefined!7299) (MissingVacant!7299 (index!31567 (_ BitVec 32))) )
))
(declare-fun lt!323406 () SeekEntryResult!7299)

(declare-fun e!408510 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!729928 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41159 (_ BitVec 32)) SeekEntryResult!7299)

(assert (=> b!729928 (= e!408510 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323406))))

(declare-fun b!729929 () Bool)

(declare-fun res!490282 () Bool)

(declare-fun e!408509 () Bool)

(assert (=> b!729929 (=> (not res!490282) (not e!408509))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729929 (= res!490282 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729930 () Bool)

(declare-fun res!490286 () Bool)

(declare-fun e!408515 () Bool)

(assert (=> b!729930 (=> (not res!490286) (not e!408515))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729930 (= res!490286 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19699 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729931 () Bool)

(declare-fun e!408514 () Bool)

(assert (=> b!729931 (= e!408514 e!408515)))

(declare-fun res!490279 () Bool)

(assert (=> b!729931 (=> (not res!490279) (not e!408515))))

(declare-fun lt!323408 () SeekEntryResult!7299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41159 (_ BitVec 32)) SeekEntryResult!7299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729931 (= res!490279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19699 a!3186) j!159) mask!3328) (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323408))))

(assert (=> b!729931 (= lt!323408 (Intermediate!7299 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729932 () Bool)

(declare-fun res!490283 () Bool)

(assert (=> b!729932 (=> (not res!490283) (not e!408515))))

(declare-fun e!408507 () Bool)

(assert (=> b!729932 (= res!490283 e!408507)))

(declare-fun c!80200 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!729932 (= c!80200 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729933 () Bool)

(declare-fun e!408511 () Bool)

(assert (=> b!729933 (= e!408511 e!408510)))

(declare-fun res!490280 () Bool)

(assert (=> b!729933 (=> (not res!490280) (not e!408510))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41159 (_ BitVec 32)) SeekEntryResult!7299)

(assert (=> b!729933 (= res!490280 (= (seekEntryOrOpen!0 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323406))))

(assert (=> b!729933 (= lt!323406 (Found!7299 j!159))))

(declare-fun b!729934 () Bool)

(declare-fun e!408513 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!729934 (= e!408513 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323411 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729934 (= lt!323411 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729935 () Bool)

(declare-fun e!408508 () Bool)

(assert (=> b!729935 (= e!408508 (not e!408513))))

(declare-fun res!490287 () Bool)

(assert (=> b!729935 (=> res!490287 e!408513)))

(declare-fun lt!323412 () SeekEntryResult!7299)

(get-info :version)

(assert (=> b!729935 (= res!490287 (or (not ((_ is Intermediate!7299) lt!323412)) (bvsge x!1131 (x!62545 lt!323412))))))

(assert (=> b!729935 e!408511))

(declare-fun res!490285 () Bool)

(assert (=> b!729935 (=> (not res!490285) (not e!408511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41159 (_ BitVec 32)) Bool)

(assert (=> b!729935 (= res!490285 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24916 0))(
  ( (Unit!24917) )
))
(declare-fun lt!323407 () Unit!24916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24916)

(assert (=> b!729935 (= lt!323407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729936 () Bool)

(declare-fun res!490278 () Bool)

(assert (=> b!729936 (=> (not res!490278) (not e!408509))))

(assert (=> b!729936 (= res!490278 (and (= (size!20120 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20120 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20120 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729937 () Bool)

(assert (=> b!729937 (= e!408507 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) lt!323408))))

(declare-fun b!729938 () Bool)

(assert (=> b!729938 (= e!408507 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19699 a!3186) j!159) a!3186 mask!3328) (Found!7299 j!159)))))

(declare-fun b!729939 () Bool)

(declare-fun res!490292 () Bool)

(assert (=> b!729939 (=> (not res!490292) (not e!408514))))

(declare-datatypes ((List!13701 0))(
  ( (Nil!13698) (Cons!13697 (h!14757 (_ BitVec 64)) (t!20016 List!13701)) )
))
(declare-fun arrayNoDuplicates!0 (array!41159 (_ BitVec 32) List!13701) Bool)

(assert (=> b!729939 (= res!490292 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13698))))

(declare-fun b!729940 () Bool)

(assert (=> b!729940 (= e!408509 e!408514)))

(declare-fun res!490288 () Bool)

(assert (=> b!729940 (=> (not res!490288) (not e!408514))))

(declare-fun lt!323409 () SeekEntryResult!7299)

(assert (=> b!729940 (= res!490288 (or (= lt!323409 (MissingZero!7299 i!1173)) (= lt!323409 (MissingVacant!7299 i!1173))))))

(assert (=> b!729940 (= lt!323409 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729941 () Bool)

(assert (=> b!729941 (= e!408515 e!408508)))

(declare-fun res!490291 () Bool)

(assert (=> b!729941 (=> (not res!490291) (not e!408508))))

(declare-fun lt!323413 () SeekEntryResult!7299)

(assert (=> b!729941 (= res!490291 (= lt!323413 lt!323412))))

(declare-fun lt!323410 () array!41159)

(declare-fun lt!323414 () (_ BitVec 64))

(assert (=> b!729941 (= lt!323412 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323414 lt!323410 mask!3328))))

(assert (=> b!729941 (= lt!323413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323414 mask!3328) lt!323414 lt!323410 mask!3328))))

(assert (=> b!729941 (= lt!323414 (select (store (arr!19699 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729941 (= lt!323410 (array!41160 (store (arr!19699 a!3186) i!1173 k0!2102) (size!20120 a!3186)))))

(declare-fun b!729942 () Bool)

(declare-fun res!490277 () Bool)

(assert (=> b!729942 (=> (not res!490277) (not e!408509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729942 (= res!490277 (validKeyInArray!0 k0!2102))))

(declare-fun b!729943 () Bool)

(declare-fun res!490284 () Bool)

(assert (=> b!729943 (=> (not res!490284) (not e!408509))))

(assert (=> b!729943 (= res!490284 (validKeyInArray!0 (select (arr!19699 a!3186) j!159)))))

(declare-fun res!490289 () Bool)

(assert (=> start!64710 (=> (not res!490289) (not e!408509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64710 (= res!490289 (validMask!0 mask!3328))))

(assert (=> start!64710 e!408509))

(assert (=> start!64710 true))

(declare-fun array_inv!15495 (array!41159) Bool)

(assert (=> start!64710 (array_inv!15495 a!3186)))

(declare-fun b!729944 () Bool)

(declare-fun res!490281 () Bool)

(assert (=> b!729944 (=> (not res!490281) (not e!408514))))

(assert (=> b!729944 (= res!490281 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20120 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20120 a!3186))))))

(declare-fun b!729945 () Bool)

(declare-fun res!490290 () Bool)

(assert (=> b!729945 (=> (not res!490290) (not e!408514))))

(assert (=> b!729945 (= res!490290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64710 res!490289) b!729936))

(assert (= (and b!729936 res!490278) b!729943))

(assert (= (and b!729943 res!490284) b!729942))

(assert (= (and b!729942 res!490277) b!729929))

(assert (= (and b!729929 res!490282) b!729940))

(assert (= (and b!729940 res!490288) b!729945))

(assert (= (and b!729945 res!490290) b!729939))

(assert (= (and b!729939 res!490292) b!729944))

(assert (= (and b!729944 res!490281) b!729931))

(assert (= (and b!729931 res!490279) b!729930))

(assert (= (and b!729930 res!490286) b!729932))

(assert (= (and b!729932 c!80200) b!729937))

(assert (= (and b!729932 (not c!80200)) b!729938))

(assert (= (and b!729932 res!490283) b!729941))

(assert (= (and b!729941 res!490291) b!729935))

(assert (= (and b!729935 res!490285) b!729933))

(assert (= (and b!729933 res!490280) b!729928))

(assert (= (and b!729935 (not res!490287)) b!729934))

(declare-fun m!683515 () Bool)

(assert (=> b!729940 m!683515))

(declare-fun m!683517 () Bool)

(assert (=> b!729929 m!683517))

(declare-fun m!683519 () Bool)

(assert (=> b!729935 m!683519))

(declare-fun m!683521 () Bool)

(assert (=> b!729935 m!683521))

(declare-fun m!683523 () Bool)

(assert (=> b!729938 m!683523))

(assert (=> b!729938 m!683523))

(declare-fun m!683525 () Bool)

(assert (=> b!729938 m!683525))

(assert (=> b!729931 m!683523))

(assert (=> b!729931 m!683523))

(declare-fun m!683527 () Bool)

(assert (=> b!729931 m!683527))

(assert (=> b!729931 m!683527))

(assert (=> b!729931 m!683523))

(declare-fun m!683529 () Bool)

(assert (=> b!729931 m!683529))

(assert (=> b!729943 m!683523))

(assert (=> b!729943 m!683523))

(declare-fun m!683531 () Bool)

(assert (=> b!729943 m!683531))

(declare-fun m!683533 () Bool)

(assert (=> start!64710 m!683533))

(declare-fun m!683535 () Bool)

(assert (=> start!64710 m!683535))

(assert (=> b!729928 m!683523))

(assert (=> b!729928 m!683523))

(declare-fun m!683537 () Bool)

(assert (=> b!729928 m!683537))

(declare-fun m!683539 () Bool)

(assert (=> b!729939 m!683539))

(declare-fun m!683541 () Bool)

(assert (=> b!729945 m!683541))

(declare-fun m!683543 () Bool)

(assert (=> b!729934 m!683543))

(assert (=> b!729933 m!683523))

(assert (=> b!729933 m!683523))

(declare-fun m!683545 () Bool)

(assert (=> b!729933 m!683545))

(declare-fun m!683547 () Bool)

(assert (=> b!729942 m!683547))

(declare-fun m!683549 () Bool)

(assert (=> b!729930 m!683549))

(declare-fun m!683551 () Bool)

(assert (=> b!729941 m!683551))

(declare-fun m!683553 () Bool)

(assert (=> b!729941 m!683553))

(declare-fun m!683555 () Bool)

(assert (=> b!729941 m!683555))

(declare-fun m!683557 () Bool)

(assert (=> b!729941 m!683557))

(declare-fun m!683559 () Bool)

(assert (=> b!729941 m!683559))

(assert (=> b!729941 m!683555))

(assert (=> b!729937 m!683523))

(assert (=> b!729937 m!683523))

(declare-fun m!683561 () Bool)

(assert (=> b!729937 m!683561))

(check-sat (not start!64710) (not b!729945) (not b!729937) (not b!729942) (not b!729931) (not b!729935) (not b!729938) (not b!729928) (not b!729929) (not b!729941) (not b!729934) (not b!729933) (not b!729943) (not b!729940) (not b!729939))
(check-sat)
