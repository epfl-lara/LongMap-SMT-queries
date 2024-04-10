; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65454 () Bool)

(assert start!65454)

(declare-fun b!745717 () Bool)

(declare-fun e!416485 () Bool)

(declare-fun e!416483 () Bool)

(assert (=> b!745717 (= e!416485 (not e!416483))))

(declare-fun res!502562 () Bool)

(assert (=> b!745717 (=> res!502562 e!416483)))

(declare-datatypes ((SeekEntryResult!7527 0))(
  ( (MissingZero!7527 (index!32476 (_ BitVec 32))) (Found!7527 (index!32477 (_ BitVec 32))) (Intermediate!7527 (undefined!8339 Bool) (index!32478 (_ BitVec 32)) (x!63429 (_ BitVec 32))) (Undefined!7527) (MissingVacant!7527 (index!32479 (_ BitVec 32))) )
))
(declare-fun lt!331321 () SeekEntryResult!7527)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!745717 (= res!502562 (or (not ((_ is Intermediate!7527) lt!331321)) (bvslt x!1131 (x!63429 lt!331321)) (not (= x!1131 (x!63429 lt!331321))) (not (= index!1321 (index!32478 lt!331321)))))))

(declare-fun e!416484 () Bool)

(assert (=> b!745717 e!416484))

(declare-fun res!502575 () Bool)

(assert (=> b!745717 (=> (not res!502575) (not e!416484))))

(declare-fun lt!331319 () SeekEntryResult!7527)

(declare-fun lt!331320 () SeekEntryResult!7527)

(assert (=> b!745717 (= res!502575 (= lt!331319 lt!331320))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!745717 (= lt!331320 (Found!7527 j!159))))

(declare-datatypes ((array!41627 0))(
  ( (array!41628 (arr!19927 (Array (_ BitVec 32) (_ BitVec 64))) (size!20348 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41627)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41627 (_ BitVec 32)) SeekEntryResult!7527)

(assert (=> b!745717 (= lt!331319 (seekEntryOrOpen!0 (select (arr!19927 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41627 (_ BitVec 32)) Bool)

(assert (=> b!745717 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25534 0))(
  ( (Unit!25535) )
))
(declare-fun lt!331322 () Unit!25534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25534)

(assert (=> b!745717 (= lt!331322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745718 () Bool)

(declare-fun e!416486 () Bool)

(declare-fun e!416487 () Bool)

(assert (=> b!745718 (= e!416486 e!416487)))

(declare-fun res!502572 () Bool)

(assert (=> b!745718 (=> (not res!502572) (not e!416487))))

(declare-fun lt!331318 () SeekEntryResult!7527)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41627 (_ BitVec 32)) SeekEntryResult!7527)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745718 (= res!502572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19927 a!3186) j!159) mask!3328) (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331318))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745718 (= lt!331318 (Intermediate!7527 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745719 () Bool)

(declare-fun e!416488 () Bool)

(assert (=> b!745719 (= e!416488 e!416486)))

(declare-fun res!502569 () Bool)

(assert (=> b!745719 (=> (not res!502569) (not e!416486))))

(declare-fun lt!331316 () SeekEntryResult!7527)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745719 (= res!502569 (or (= lt!331316 (MissingZero!7527 i!1173)) (= lt!331316 (MissingVacant!7527 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!745719 (= lt!331316 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!502563 () Bool)

(assert (=> start!65454 (=> (not res!502563) (not e!416488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65454 (= res!502563 (validMask!0 mask!3328))))

(assert (=> start!65454 e!416488))

(assert (=> start!65454 true))

(declare-fun array_inv!15723 (array!41627) Bool)

(assert (=> start!65454 (array_inv!15723 a!3186)))

(declare-fun b!745720 () Bool)

(declare-fun e!416482 () Bool)

(assert (=> b!745720 (= e!416482 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331318))))

(declare-fun b!745721 () Bool)

(declare-fun e!416489 () Bool)

(assert (=> b!745721 (= e!416489 true)))

(declare-fun lt!331317 () SeekEntryResult!7527)

(assert (=> b!745721 (= lt!331319 lt!331317)))

(declare-fun b!745722 () Bool)

(declare-fun res!502573 () Bool)

(assert (=> b!745722 (=> (not res!502573) (not e!416488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745722 (= res!502573 (validKeyInArray!0 k0!2102))))

(declare-fun b!745723 () Bool)

(declare-fun res!502571 () Bool)

(assert (=> b!745723 (=> (not res!502571) (not e!416488))))

(assert (=> b!745723 (= res!502571 (validKeyInArray!0 (select (arr!19927 a!3186) j!159)))))

(declare-fun b!745724 () Bool)

(declare-fun res!502567 () Bool)

(assert (=> b!745724 (=> (not res!502567) (not e!416488))))

(assert (=> b!745724 (= res!502567 (and (= (size!20348 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20348 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20348 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745725 () Bool)

(declare-fun res!502570 () Bool)

(assert (=> b!745725 (=> (not res!502570) (not e!416486))))

(assert (=> b!745725 (= res!502570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20348 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20348 a!3186))))))

(declare-fun b!745726 () Bool)

(declare-fun res!502566 () Bool)

(assert (=> b!745726 (=> (not res!502566) (not e!416487))))

(assert (=> b!745726 (= res!502566 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19927 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745727 () Bool)

(declare-fun res!502574 () Bool)

(assert (=> b!745727 (=> (not res!502574) (not e!416488))))

(declare-fun arrayContainsKey!0 (array!41627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745727 (= res!502574 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745728 () Bool)

(assert (=> b!745728 (= e!416483 e!416489)))

(declare-fun res!502577 () Bool)

(assert (=> b!745728 (=> res!502577 e!416489)))

(declare-fun lt!331324 () (_ BitVec 64))

(assert (=> b!745728 (= res!502577 (or (not (= lt!331317 lt!331320)) (= (select (store (arr!19927 a!3186) i!1173 k0!2102) index!1321) lt!331324) (not (= (select (store (arr!19927 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41627 (_ BitVec 32)) SeekEntryResult!7527)

(assert (=> b!745728 (= lt!331317 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745729 () Bool)

(assert (=> b!745729 (= e!416487 e!416485)))

(declare-fun res!502565 () Bool)

(assert (=> b!745729 (=> (not res!502565) (not e!416485))))

(declare-fun lt!331323 () SeekEntryResult!7527)

(assert (=> b!745729 (= res!502565 (= lt!331323 lt!331321))))

(declare-fun lt!331325 () array!41627)

(assert (=> b!745729 (= lt!331321 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331324 lt!331325 mask!3328))))

(assert (=> b!745729 (= lt!331323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331324 mask!3328) lt!331324 lt!331325 mask!3328))))

(assert (=> b!745729 (= lt!331324 (select (store (arr!19927 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745729 (= lt!331325 (array!41628 (store (arr!19927 a!3186) i!1173 k0!2102) (size!20348 a!3186)))))

(declare-fun b!745730 () Bool)

(assert (=> b!745730 (= e!416482 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) (Found!7527 j!159)))))

(declare-fun b!745731 () Bool)

(assert (=> b!745731 (= e!416484 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331320))))

(declare-fun b!745732 () Bool)

(declare-fun res!502564 () Bool)

(assert (=> b!745732 (=> (not res!502564) (not e!416486))))

(assert (=> b!745732 (= res!502564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745733 () Bool)

(declare-fun res!502576 () Bool)

(assert (=> b!745733 (=> (not res!502576) (not e!416486))))

(declare-datatypes ((List!13929 0))(
  ( (Nil!13926) (Cons!13925 (h!14997 (_ BitVec 64)) (t!20244 List!13929)) )
))
(declare-fun arrayNoDuplicates!0 (array!41627 (_ BitVec 32) List!13929) Bool)

(assert (=> b!745733 (= res!502576 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13926))))

(declare-fun b!745734 () Bool)

(declare-fun res!502568 () Bool)

(assert (=> b!745734 (=> (not res!502568) (not e!416487))))

(assert (=> b!745734 (= res!502568 e!416482)))

(declare-fun c!81958 () Bool)

(assert (=> b!745734 (= c!81958 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65454 res!502563) b!745724))

(assert (= (and b!745724 res!502567) b!745723))

(assert (= (and b!745723 res!502571) b!745722))

(assert (= (and b!745722 res!502573) b!745727))

(assert (= (and b!745727 res!502574) b!745719))

(assert (= (and b!745719 res!502569) b!745732))

(assert (= (and b!745732 res!502564) b!745733))

(assert (= (and b!745733 res!502576) b!745725))

(assert (= (and b!745725 res!502570) b!745718))

(assert (= (and b!745718 res!502572) b!745726))

(assert (= (and b!745726 res!502566) b!745734))

(assert (= (and b!745734 c!81958) b!745720))

(assert (= (and b!745734 (not c!81958)) b!745730))

(assert (= (and b!745734 res!502568) b!745729))

(assert (= (and b!745729 res!502565) b!745717))

(assert (= (and b!745717 res!502575) b!745731))

(assert (= (and b!745717 (not res!502562)) b!745728))

(assert (= (and b!745728 (not res!502577)) b!745721))

(declare-fun m!696055 () Bool)

(assert (=> b!745723 m!696055))

(assert (=> b!745723 m!696055))

(declare-fun m!696057 () Bool)

(assert (=> b!745723 m!696057))

(assert (=> b!745730 m!696055))

(assert (=> b!745730 m!696055))

(declare-fun m!696059 () Bool)

(assert (=> b!745730 m!696059))

(declare-fun m!696061 () Bool)

(assert (=> b!745726 m!696061))

(declare-fun m!696063 () Bool)

(assert (=> b!745728 m!696063))

(declare-fun m!696065 () Bool)

(assert (=> b!745728 m!696065))

(assert (=> b!745728 m!696055))

(assert (=> b!745728 m!696055))

(assert (=> b!745728 m!696059))

(declare-fun m!696067 () Bool)

(assert (=> start!65454 m!696067))

(declare-fun m!696069 () Bool)

(assert (=> start!65454 m!696069))

(assert (=> b!745731 m!696055))

(assert (=> b!745731 m!696055))

(declare-fun m!696071 () Bool)

(assert (=> b!745731 m!696071))

(declare-fun m!696073 () Bool)

(assert (=> b!745729 m!696073))

(declare-fun m!696075 () Bool)

(assert (=> b!745729 m!696075))

(assert (=> b!745729 m!696073))

(assert (=> b!745729 m!696063))

(declare-fun m!696077 () Bool)

(assert (=> b!745729 m!696077))

(declare-fun m!696079 () Bool)

(assert (=> b!745729 m!696079))

(declare-fun m!696081 () Bool)

(assert (=> b!745732 m!696081))

(declare-fun m!696083 () Bool)

(assert (=> b!745727 m!696083))

(assert (=> b!745717 m!696055))

(assert (=> b!745717 m!696055))

(declare-fun m!696085 () Bool)

(assert (=> b!745717 m!696085))

(declare-fun m!696087 () Bool)

(assert (=> b!745717 m!696087))

(declare-fun m!696089 () Bool)

(assert (=> b!745717 m!696089))

(declare-fun m!696091 () Bool)

(assert (=> b!745719 m!696091))

(assert (=> b!745718 m!696055))

(assert (=> b!745718 m!696055))

(declare-fun m!696093 () Bool)

(assert (=> b!745718 m!696093))

(assert (=> b!745718 m!696093))

(assert (=> b!745718 m!696055))

(declare-fun m!696095 () Bool)

(assert (=> b!745718 m!696095))

(declare-fun m!696097 () Bool)

(assert (=> b!745722 m!696097))

(declare-fun m!696099 () Bool)

(assert (=> b!745733 m!696099))

(assert (=> b!745720 m!696055))

(assert (=> b!745720 m!696055))

(declare-fun m!696101 () Bool)

(assert (=> b!745720 m!696101))

(check-sat (not b!745727) (not b!745728) (not b!745731) (not b!745730) (not b!745732) (not b!745718) (not b!745722) (not b!745720) (not start!65454) (not b!745717) (not b!745723) (not b!745719) (not b!745729) (not b!745733))
(check-sat)
