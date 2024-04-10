; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64702 () Bool)

(assert start!64702)

(declare-fun b!729712 () Bool)

(declare-fun res!490092 () Bool)

(declare-fun e!408400 () Bool)

(assert (=> b!729712 (=> (not res!490092) (not e!408400))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41151 0))(
  ( (array!41152 (arr!19695 (Array (_ BitVec 32) (_ BitVec 64))) (size!20116 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41151)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729712 (= res!490092 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19695 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729713 () Bool)

(declare-fun e!408406 () Bool)

(declare-fun e!408402 () Bool)

(assert (=> b!729713 (= e!408406 e!408402)))

(declare-fun res!490100 () Bool)

(assert (=> b!729713 (=> (not res!490100) (not e!408402))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7295 0))(
  ( (MissingZero!7295 (index!31548 (_ BitVec 32))) (Found!7295 (index!31549 (_ BitVec 32))) (Intermediate!7295 (undefined!8107 Bool) (index!31550 (_ BitVec 32)) (x!62533 (_ BitVec 32))) (Undefined!7295) (MissingVacant!7295 (index!31551 (_ BitVec 32))) )
))
(declare-fun lt!323299 () SeekEntryResult!7295)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41151 (_ BitVec 32)) SeekEntryResult!7295)

(assert (=> b!729713 (= res!490100 (= (seekEntryOrOpen!0 (select (arr!19695 a!3186) j!159) a!3186 mask!3328) lt!323299))))

(assert (=> b!729713 (= lt!323299 (Found!7295 j!159))))

(declare-fun b!729714 () Bool)

(declare-fun e!408404 () Bool)

(assert (=> b!729714 (= e!408400 e!408404)))

(declare-fun res!490097 () Bool)

(assert (=> b!729714 (=> (not res!490097) (not e!408404))))

(declare-fun lt!323304 () SeekEntryResult!7295)

(declare-fun lt!323298 () SeekEntryResult!7295)

(assert (=> b!729714 (= res!490097 (= lt!323304 lt!323298))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!323302 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323301 () array!41151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41151 (_ BitVec 32)) SeekEntryResult!7295)

(assert (=> b!729714 (= lt!323298 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323302 lt!323301 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729714 (= lt!323304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323302 mask!3328) lt!323302 lt!323301 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!729714 (= lt!323302 (select (store (arr!19695 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729714 (= lt!323301 (array!41152 (store (arr!19695 a!3186) i!1173 k!2102) (size!20116 a!3186)))))

(declare-fun b!729715 () Bool)

(declare-fun e!408399 () Bool)

(declare-fun e!408403 () Bool)

(assert (=> b!729715 (= e!408399 e!408403)))

(declare-fun res!490094 () Bool)

(assert (=> b!729715 (=> (not res!490094) (not e!408403))))

(declare-fun lt!323305 () SeekEntryResult!7295)

(assert (=> b!729715 (= res!490094 (or (= lt!323305 (MissingZero!7295 i!1173)) (= lt!323305 (MissingVacant!7295 i!1173))))))

(assert (=> b!729715 (= lt!323305 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729716 () Bool)

(declare-fun res!490085 () Bool)

(assert (=> b!729716 (=> (not res!490085) (not e!408403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41151 (_ BitVec 32)) Bool)

(assert (=> b!729716 (= res!490085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729717 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41151 (_ BitVec 32)) SeekEntryResult!7295)

(assert (=> b!729717 (= e!408402 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19695 a!3186) j!159) a!3186 mask!3328) lt!323299))))

(declare-fun b!729718 () Bool)

(declare-fun res!490089 () Bool)

(assert (=> b!729718 (=> (not res!490089) (not e!408399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729718 (= res!490089 (validKeyInArray!0 k!2102))))

(declare-fun b!729719 () Bool)

(declare-fun res!490087 () Bool)

(assert (=> b!729719 (=> (not res!490087) (not e!408399))))

(assert (=> b!729719 (= res!490087 (validKeyInArray!0 (select (arr!19695 a!3186) j!159)))))

(declare-fun b!729720 () Bool)

(declare-fun e!408405 () Bool)

(assert (=> b!729720 (= e!408404 (not e!408405))))

(declare-fun res!490096 () Bool)

(assert (=> b!729720 (=> res!490096 e!408405)))

(assert (=> b!729720 (= res!490096 (or (not (is-Intermediate!7295 lt!323298)) (bvsge x!1131 (x!62533 lt!323298))))))

(assert (=> b!729720 e!408406))

(declare-fun res!490088 () Bool)

(assert (=> b!729720 (=> (not res!490088) (not e!408406))))

(assert (=> b!729720 (= res!490088 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24908 0))(
  ( (Unit!24909) )
))
(declare-fun lt!323303 () Unit!24908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24908)

(assert (=> b!729720 (= lt!323303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!408407 () Bool)

(declare-fun b!729721 () Bool)

(assert (=> b!729721 (= e!408407 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19695 a!3186) j!159) a!3186 mask!3328) (Found!7295 j!159)))))

(declare-fun b!729722 () Bool)

(declare-fun res!490099 () Bool)

(assert (=> b!729722 (=> (not res!490099) (not e!408399))))

(assert (=> b!729722 (= res!490099 (and (= (size!20116 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20116 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20116 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729723 () Bool)

(assert (=> b!729723 (= e!408403 e!408400)))

(declare-fun res!490091 () Bool)

(assert (=> b!729723 (=> (not res!490091) (not e!408400))))

(declare-fun lt!323300 () SeekEntryResult!7295)

(assert (=> b!729723 (= res!490091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19695 a!3186) j!159) mask!3328) (select (arr!19695 a!3186) j!159) a!3186 mask!3328) lt!323300))))

(assert (=> b!729723 (= lt!323300 (Intermediate!7295 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729725 () Bool)

(declare-fun res!490093 () Bool)

(assert (=> b!729725 (=> (not res!490093) (not e!408403))))

(declare-datatypes ((List!13697 0))(
  ( (Nil!13694) (Cons!13693 (h!14753 (_ BitVec 64)) (t!20012 List!13697)) )
))
(declare-fun arrayNoDuplicates!0 (array!41151 (_ BitVec 32) List!13697) Bool)

(assert (=> b!729725 (= res!490093 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13694))))

(declare-fun b!729726 () Bool)

(declare-fun res!490095 () Bool)

(assert (=> b!729726 (=> (not res!490095) (not e!408399))))

(declare-fun arrayContainsKey!0 (array!41151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729726 (= res!490095 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729727 () Bool)

(assert (=> b!729727 (= e!408407 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19695 a!3186) j!159) a!3186 mask!3328) lt!323300))))

(declare-fun b!729724 () Bool)

(declare-fun res!490090 () Bool)

(assert (=> b!729724 (=> (not res!490090) (not e!408400))))

(assert (=> b!729724 (= res!490090 e!408407)))

(declare-fun c!80188 () Bool)

(assert (=> b!729724 (= c!80188 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!490086 () Bool)

(assert (=> start!64702 (=> (not res!490086) (not e!408399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64702 (= res!490086 (validMask!0 mask!3328))))

(assert (=> start!64702 e!408399))

(assert (=> start!64702 true))

(declare-fun array_inv!15491 (array!41151) Bool)

(assert (=> start!64702 (array_inv!15491 a!3186)))

(declare-fun b!729728 () Bool)

(declare-fun res!490098 () Bool)

(assert (=> b!729728 (=> (not res!490098) (not e!408403))))

(assert (=> b!729728 (= res!490098 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20116 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20116 a!3186))))))

(declare-fun b!729729 () Bool)

(assert (=> b!729729 (= e!408405 true)))

(declare-fun lt!323306 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729729 (= lt!323306 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64702 res!490086) b!729722))

(assert (= (and b!729722 res!490099) b!729719))

(assert (= (and b!729719 res!490087) b!729718))

(assert (= (and b!729718 res!490089) b!729726))

(assert (= (and b!729726 res!490095) b!729715))

(assert (= (and b!729715 res!490094) b!729716))

(assert (= (and b!729716 res!490085) b!729725))

(assert (= (and b!729725 res!490093) b!729728))

(assert (= (and b!729728 res!490098) b!729723))

(assert (= (and b!729723 res!490091) b!729712))

(assert (= (and b!729712 res!490092) b!729724))

(assert (= (and b!729724 c!80188) b!729727))

(assert (= (and b!729724 (not c!80188)) b!729721))

(assert (= (and b!729724 res!490090) b!729714))

(assert (= (and b!729714 res!490097) b!729720))

(assert (= (and b!729720 res!490088) b!729713))

(assert (= (and b!729713 res!490100) b!729717))

(assert (= (and b!729720 (not res!490096)) b!729729))

(declare-fun m!683323 () Bool)

(assert (=> b!729717 m!683323))

(assert (=> b!729717 m!683323))

(declare-fun m!683325 () Bool)

(assert (=> b!729717 m!683325))

(assert (=> b!729713 m!683323))

(assert (=> b!729713 m!683323))

(declare-fun m!683327 () Bool)

(assert (=> b!729713 m!683327))

(declare-fun m!683329 () Bool)

(assert (=> b!729729 m!683329))

(assert (=> b!729719 m!683323))

(assert (=> b!729719 m!683323))

(declare-fun m!683331 () Bool)

(assert (=> b!729719 m!683331))

(declare-fun m!683333 () Bool)

(assert (=> b!729716 m!683333))

(declare-fun m!683335 () Bool)

(assert (=> b!729720 m!683335))

(declare-fun m!683337 () Bool)

(assert (=> b!729720 m!683337))

(declare-fun m!683339 () Bool)

(assert (=> b!729725 m!683339))

(assert (=> b!729723 m!683323))

(assert (=> b!729723 m!683323))

(declare-fun m!683341 () Bool)

(assert (=> b!729723 m!683341))

(assert (=> b!729723 m!683341))

(assert (=> b!729723 m!683323))

(declare-fun m!683343 () Bool)

(assert (=> b!729723 m!683343))

(declare-fun m!683345 () Bool)

(assert (=> b!729715 m!683345))

(declare-fun m!683347 () Bool)

(assert (=> b!729718 m!683347))

(declare-fun m!683349 () Bool)

(assert (=> b!729714 m!683349))

(declare-fun m!683351 () Bool)

(assert (=> b!729714 m!683351))

(declare-fun m!683353 () Bool)

(assert (=> b!729714 m!683353))

(declare-fun m!683355 () Bool)

(assert (=> b!729714 m!683355))

(assert (=> b!729714 m!683349))

(declare-fun m!683357 () Bool)

(assert (=> b!729714 m!683357))

(declare-fun m!683359 () Bool)

(assert (=> start!64702 m!683359))

(declare-fun m!683361 () Bool)

(assert (=> start!64702 m!683361))

(assert (=> b!729727 m!683323))

(assert (=> b!729727 m!683323))

(declare-fun m!683363 () Bool)

(assert (=> b!729727 m!683363))

(assert (=> b!729721 m!683323))

(assert (=> b!729721 m!683323))

(declare-fun m!683365 () Bool)

(assert (=> b!729721 m!683365))

(declare-fun m!683367 () Bool)

(assert (=> b!729712 m!683367))

(declare-fun m!683369 () Bool)

(assert (=> b!729726 m!683369))

(push 1)

