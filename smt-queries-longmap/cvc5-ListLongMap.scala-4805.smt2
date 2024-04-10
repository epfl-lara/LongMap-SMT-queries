; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65956 () Bool)

(assert start!65956)

(declare-fun b!760226 () Bool)

(declare-fun res!514394 () Bool)

(declare-fun e!423793 () Bool)

(assert (=> b!760226 (=> (not res!514394) (not e!423793))))

(declare-datatypes ((array!42066 0))(
  ( (array!42067 (arr!20145 (Array (_ BitVec 32) (_ BitVec 64))) (size!20566 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42066)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760226 (= res!514394 (validKeyInArray!0 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760227 () Bool)

(declare-fun e!423794 () Bool)

(assert (=> b!760227 (= e!423793 e!423794)))

(declare-fun res!514402 () Bool)

(assert (=> b!760227 (=> (not res!514402) (not e!423794))))

(declare-datatypes ((SeekEntryResult!7745 0))(
  ( (MissingZero!7745 (index!33348 (_ BitVec 32))) (Found!7745 (index!33349 (_ BitVec 32))) (Intermediate!7745 (undefined!8557 Bool) (index!33350 (_ BitVec 32)) (x!64240 (_ BitVec 32))) (Undefined!7745) (MissingVacant!7745 (index!33351 (_ BitVec 32))) )
))
(declare-fun lt!338725 () SeekEntryResult!7745)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!760227 (= res!514402 (or (= lt!338725 (MissingZero!7745 i!1173)) (= lt!338725 (MissingVacant!7745 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42066 (_ BitVec 32)) SeekEntryResult!7745)

(assert (=> b!760227 (= lt!338725 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!760228 () Bool)

(declare-fun res!514406 () Bool)

(assert (=> b!760228 (=> (not res!514406) (not e!423793))))

(assert (=> b!760228 (= res!514406 (validKeyInArray!0 k!2102))))

(declare-fun b!760229 () Bool)

(declare-fun res!514405 () Bool)

(assert (=> b!760229 (=> (not res!514405) (not e!423793))))

(assert (=> b!760229 (= res!514405 (and (= (size!20566 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20566 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20566 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!423790 () Bool)

(declare-fun lt!338723 () SeekEntryResult!7745)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!760230 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42066 (_ BitVec 32)) SeekEntryResult!7745)

(assert (=> b!760230 (= e!423790 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338723))))

(declare-fun b!760231 () Bool)

(declare-fun e!423792 () Bool)

(declare-fun e!423788 () Bool)

(assert (=> b!760231 (= e!423792 e!423788)))

(declare-fun res!514395 () Bool)

(assert (=> b!760231 (=> (not res!514395) (not e!423788))))

(declare-fun lt!338726 () SeekEntryResult!7745)

(declare-fun lt!338724 () SeekEntryResult!7745)

(assert (=> b!760231 (= res!514395 (= lt!338726 lt!338724))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!338720 () array!42066)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!338719 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42066 (_ BitVec 32)) SeekEntryResult!7745)

(assert (=> b!760231 (= lt!338724 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338719 lt!338720 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760231 (= lt!338726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338719 mask!3328) lt!338719 lt!338720 mask!3328))))

(assert (=> b!760231 (= lt!338719 (select (store (arr!20145 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!760231 (= lt!338720 (array!42067 (store (arr!20145 a!3186) i!1173 k!2102) (size!20566 a!3186)))))

(declare-fun b!760232 () Bool)

(declare-fun res!514396 () Bool)

(assert (=> b!760232 (=> (not res!514396) (not e!423792))))

(assert (=> b!760232 (= res!514396 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20145 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!514399 () Bool)

(assert (=> start!65956 (=> (not res!514399) (not e!423793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65956 (= res!514399 (validMask!0 mask!3328))))

(assert (=> start!65956 e!423793))

(assert (=> start!65956 true))

(declare-fun array_inv!15941 (array!42066) Bool)

(assert (=> start!65956 (array_inv!15941 a!3186)))

(declare-fun b!760233 () Bool)

(declare-fun res!514404 () Bool)

(assert (=> b!760233 (=> (not res!514404) (not e!423792))))

(declare-fun e!423787 () Bool)

(assert (=> b!760233 (= res!514404 e!423787)))

(declare-fun c!83299 () Bool)

(assert (=> b!760233 (= c!83299 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760234 () Bool)

(declare-fun res!514400 () Bool)

(assert (=> b!760234 (=> (not res!514400) (not e!423794))))

(assert (=> b!760234 (= res!514400 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20566 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20566 a!3186))))))

(declare-fun b!760235 () Bool)

(declare-fun e!423789 () Bool)

(assert (=> b!760235 (= e!423789 e!423790)))

(declare-fun res!514393 () Bool)

(assert (=> b!760235 (=> (not res!514393) (not e!423790))))

(assert (=> b!760235 (= res!514393 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338723))))

(assert (=> b!760235 (= lt!338723 (Found!7745 j!159))))

(declare-fun lt!338721 () SeekEntryResult!7745)

(declare-fun b!760236 () Bool)

(assert (=> b!760236 (= e!423787 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338721))))

(declare-fun b!760237 () Bool)

(assert (=> b!760237 (= e!423788 (not (or (not (is-Intermediate!7745 lt!338724)) (not (= x!1131 (x!64240 lt!338724))) (= index!1321 (index!33350 lt!338724)))))))

(assert (=> b!760237 e!423789))

(declare-fun res!514401 () Bool)

(assert (=> b!760237 (=> (not res!514401) (not e!423789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42066 (_ BitVec 32)) Bool)

(assert (=> b!760237 (= res!514401 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26330 0))(
  ( (Unit!26331) )
))
(declare-fun lt!338722 () Unit!26330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26330)

(assert (=> b!760237 (= lt!338722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760238 () Bool)

(declare-fun res!514397 () Bool)

(assert (=> b!760238 (=> (not res!514397) (not e!423793))))

(declare-fun arrayContainsKey!0 (array!42066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760238 (= res!514397 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760239 () Bool)

(declare-fun res!514403 () Bool)

(assert (=> b!760239 (=> (not res!514403) (not e!423794))))

(assert (=> b!760239 (= res!514403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760240 () Bool)

(assert (=> b!760240 (= e!423787 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) (Found!7745 j!159)))))

(declare-fun b!760241 () Bool)

(declare-fun res!514398 () Bool)

(assert (=> b!760241 (=> (not res!514398) (not e!423794))))

(declare-datatypes ((List!14147 0))(
  ( (Nil!14144) (Cons!14143 (h!15218 (_ BitVec 64)) (t!20462 List!14147)) )
))
(declare-fun arrayNoDuplicates!0 (array!42066 (_ BitVec 32) List!14147) Bool)

(assert (=> b!760241 (= res!514398 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14144))))

(declare-fun b!760242 () Bool)

(assert (=> b!760242 (= e!423794 e!423792)))

(declare-fun res!514392 () Bool)

(assert (=> b!760242 (=> (not res!514392) (not e!423792))))

(assert (=> b!760242 (= res!514392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338721))))

(assert (=> b!760242 (= lt!338721 (Intermediate!7745 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65956 res!514399) b!760229))

(assert (= (and b!760229 res!514405) b!760226))

(assert (= (and b!760226 res!514394) b!760228))

(assert (= (and b!760228 res!514406) b!760238))

(assert (= (and b!760238 res!514397) b!760227))

(assert (= (and b!760227 res!514402) b!760239))

(assert (= (and b!760239 res!514403) b!760241))

(assert (= (and b!760241 res!514398) b!760234))

(assert (= (and b!760234 res!514400) b!760242))

(assert (= (and b!760242 res!514392) b!760232))

(assert (= (and b!760232 res!514396) b!760233))

(assert (= (and b!760233 c!83299) b!760236))

(assert (= (and b!760233 (not c!83299)) b!760240))

(assert (= (and b!760233 res!514404) b!760231))

(assert (= (and b!760231 res!514395) b!760237))

(assert (= (and b!760237 res!514401) b!760235))

(assert (= (and b!760235 res!514393) b!760230))

(declare-fun m!707413 () Bool)

(assert (=> b!760227 m!707413))

(declare-fun m!707415 () Bool)

(assert (=> b!760237 m!707415))

(declare-fun m!707417 () Bool)

(assert (=> b!760237 m!707417))

(declare-fun m!707419 () Bool)

(assert (=> b!760232 m!707419))

(declare-fun m!707421 () Bool)

(assert (=> b!760226 m!707421))

(assert (=> b!760226 m!707421))

(declare-fun m!707423 () Bool)

(assert (=> b!760226 m!707423))

(declare-fun m!707425 () Bool)

(assert (=> b!760231 m!707425))

(declare-fun m!707427 () Bool)

(assert (=> b!760231 m!707427))

(declare-fun m!707429 () Bool)

(assert (=> b!760231 m!707429))

(declare-fun m!707431 () Bool)

(assert (=> b!760231 m!707431))

(assert (=> b!760231 m!707431))

(declare-fun m!707433 () Bool)

(assert (=> b!760231 m!707433))

(assert (=> b!760236 m!707421))

(assert (=> b!760236 m!707421))

(declare-fun m!707435 () Bool)

(assert (=> b!760236 m!707435))

(declare-fun m!707437 () Bool)

(assert (=> start!65956 m!707437))

(declare-fun m!707439 () Bool)

(assert (=> start!65956 m!707439))

(declare-fun m!707441 () Bool)

(assert (=> b!760238 m!707441))

(declare-fun m!707443 () Bool)

(assert (=> b!760239 m!707443))

(assert (=> b!760240 m!707421))

(assert (=> b!760240 m!707421))

(declare-fun m!707445 () Bool)

(assert (=> b!760240 m!707445))

(assert (=> b!760235 m!707421))

(assert (=> b!760235 m!707421))

(declare-fun m!707447 () Bool)

(assert (=> b!760235 m!707447))

(declare-fun m!707449 () Bool)

(assert (=> b!760228 m!707449))

(assert (=> b!760230 m!707421))

(assert (=> b!760230 m!707421))

(declare-fun m!707451 () Bool)

(assert (=> b!760230 m!707451))

(assert (=> b!760242 m!707421))

(assert (=> b!760242 m!707421))

(declare-fun m!707453 () Bool)

(assert (=> b!760242 m!707453))

(assert (=> b!760242 m!707453))

(assert (=> b!760242 m!707421))

(declare-fun m!707455 () Bool)

(assert (=> b!760242 m!707455))

(declare-fun m!707457 () Bool)

(assert (=> b!760241 m!707457))

(push 1)

(assert (not start!65956))

(assert (not b!760231))

(assert (not b!760228))

(assert (not b!760230))

(assert (not b!760237))

(assert (not b!760235))

(assert (not b!760238))

(assert (not b!760227))

(assert (not b!760241))

(assert (not b!760240))

(assert (not b!760226))

(assert (not b!760236))

(assert (not b!760242))

(assert (not b!760239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!760417 () Bool)

(declare-fun lt!338807 () SeekEntryResult!7745)

(assert (=> b!760417 (and (bvsge (index!33350 lt!338807) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338807) (size!20566 lt!338720)))))

(declare-fun res!514511 () Bool)

(assert (=> b!760417 (= res!514511 (= (select (arr!20145 lt!338720) (index!33350 lt!338807)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423887 () Bool)

(assert (=> b!760417 (=> res!514511 e!423887)))

(declare-fun b!760418 () Bool)

(declare-fun e!423884 () SeekEntryResult!7745)

(assert (=> b!760418 (= e!423884 (Intermediate!7745 true index!1321 x!1131))))

(declare-fun b!760419 () Bool)

(declare-fun e!423885 () Bool)

(declare-fun e!423886 () Bool)

(assert (=> b!760419 (= e!423885 e!423886)))

(declare-fun res!514510 () Bool)

(assert (=> b!760419 (= res!514510 (and (is-Intermediate!7745 lt!338807) (not (undefined!8557 lt!338807)) (bvslt (x!64240 lt!338807) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338807) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338807) x!1131)))))

(assert (=> b!760419 (=> (not res!514510) (not e!423886))))

(declare-fun b!760420 () Bool)

(declare-fun e!423883 () SeekEntryResult!7745)

(assert (=> b!760420 (= e!423883 (Intermediate!7745 false index!1321 x!1131))))

(declare-fun b!760421 () Bool)

(assert (=> b!760421 (and (bvsge (index!33350 lt!338807) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338807) (size!20566 lt!338720)))))

(assert (=> b!760421 (= e!423887 (= (select (arr!20145 lt!338720) (index!33350 lt!338807)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760422 () Bool)

(assert (=> b!760422 (= e!423884 e!423883)))

(declare-fun c!83336 () Bool)

(declare-fun lt!338806 () (_ BitVec 64))

(assert (=> b!760422 (= c!83336 (or (= lt!338806 lt!338719) (= (bvadd lt!338806 lt!338806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100497 () Bool)

(assert (=> d!100497 e!423885))

(declare-fun c!83338 () Bool)

(assert (=> d!100497 (= c!83338 (and (is-Intermediate!7745 lt!338807) (undefined!8557 lt!338807)))))

(assert (=> d!100497 (= lt!338807 e!423884)))

(declare-fun c!83337 () Bool)

(assert (=> d!100497 (= c!83337 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100497 (= lt!338806 (select (arr!20145 lt!338720) index!1321))))

(assert (=> d!100497 (validMask!0 mask!3328)))

(assert (=> d!100497 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338719 lt!338720 mask!3328) lt!338807)))

(declare-fun b!760423 () Bool)

(assert (=> b!760423 (and (bvsge (index!33350 lt!338807) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338807) (size!20566 lt!338720)))))

(declare-fun res!514509 () Bool)

(assert (=> b!760423 (= res!514509 (= (select (arr!20145 lt!338720) (index!33350 lt!338807)) lt!338719))))

(assert (=> b!760423 (=> res!514509 e!423887)))

(assert (=> b!760423 (= e!423886 e!423887)))

(declare-fun b!760424 () Bool)

(assert (=> b!760424 (= e!423885 (bvsge (x!64240 lt!338807) #b01111111111111111111111111111110))))

(declare-fun b!760425 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760425 (= e!423883 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338719 lt!338720 mask!3328))))

(assert (= (and d!100497 c!83337) b!760418))

(assert (= (and d!100497 (not c!83337)) b!760422))

(assert (= (and b!760422 c!83336) b!760420))

(assert (= (and b!760422 (not c!83336)) b!760425))

(assert (= (and d!100497 c!83338) b!760424))

(assert (= (and d!100497 (not c!83338)) b!760419))

(assert (= (and b!760419 res!514510) b!760423))

(assert (= (and b!760423 (not res!514509)) b!760417))

(assert (= (and b!760417 (not res!514511)) b!760421))

(declare-fun m!707597 () Bool)

(assert (=> b!760425 m!707597))

(assert (=> b!760425 m!707597))

(declare-fun m!707599 () Bool)

(assert (=> b!760425 m!707599))

(declare-fun m!707601 () Bool)

(assert (=> b!760423 m!707601))

(assert (=> b!760421 m!707601))

(declare-fun m!707603 () Bool)

(assert (=> d!100497 m!707603))

(assert (=> d!100497 m!707437))

(assert (=> b!760417 m!707601))

(assert (=> b!760231 d!100497))

(declare-fun b!760426 () Bool)

(declare-fun lt!338809 () SeekEntryResult!7745)

(assert (=> b!760426 (and (bvsge (index!33350 lt!338809) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338809) (size!20566 lt!338720)))))

(declare-fun res!514514 () Bool)

(assert (=> b!760426 (= res!514514 (= (select (arr!20145 lt!338720) (index!33350 lt!338809)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423892 () Bool)

(assert (=> b!760426 (=> res!514514 e!423892)))

(declare-fun b!760427 () Bool)

(declare-fun e!423889 () SeekEntryResult!7745)

(assert (=> b!760427 (= e!423889 (Intermediate!7745 true (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760428 () Bool)

(declare-fun e!423890 () Bool)

(declare-fun e!423891 () Bool)

(assert (=> b!760428 (= e!423890 e!423891)))

(declare-fun res!514513 () Bool)

(assert (=> b!760428 (= res!514513 (and (is-Intermediate!7745 lt!338809) (not (undefined!8557 lt!338809)) (bvslt (x!64240 lt!338809) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338809) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338809) #b00000000000000000000000000000000)))))

(assert (=> b!760428 (=> (not res!514513) (not e!423891))))

(declare-fun b!760429 () Bool)

(declare-fun e!423888 () SeekEntryResult!7745)

(assert (=> b!760429 (= e!423888 (Intermediate!7745 false (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760430 () Bool)

(assert (=> b!760430 (and (bvsge (index!33350 lt!338809) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338809) (size!20566 lt!338720)))))

(assert (=> b!760430 (= e!423892 (= (select (arr!20145 lt!338720) (index!33350 lt!338809)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760431 () Bool)

(assert (=> b!760431 (= e!423889 e!423888)))

(declare-fun c!83339 () Bool)

(declare-fun lt!338808 () (_ BitVec 64))

(assert (=> b!760431 (= c!83339 (or (= lt!338808 lt!338719) (= (bvadd lt!338808 lt!338808) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100505 () Bool)

(assert (=> d!100505 e!423890))

(declare-fun c!83341 () Bool)

(assert (=> d!100505 (= c!83341 (and (is-Intermediate!7745 lt!338809) (undefined!8557 lt!338809)))))

(assert (=> d!100505 (= lt!338809 e!423889)))

(declare-fun c!83340 () Bool)

(assert (=> d!100505 (= c!83340 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100505 (= lt!338808 (select (arr!20145 lt!338720) (toIndex!0 lt!338719 mask!3328)))))

(assert (=> d!100505 (validMask!0 mask!3328)))

(assert (=> d!100505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338719 mask!3328) lt!338719 lt!338720 mask!3328) lt!338809)))

(declare-fun b!760432 () Bool)

(assert (=> b!760432 (and (bvsge (index!33350 lt!338809) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338809) (size!20566 lt!338720)))))

(declare-fun res!514512 () Bool)

(assert (=> b!760432 (= res!514512 (= (select (arr!20145 lt!338720) (index!33350 lt!338809)) lt!338719))))

(assert (=> b!760432 (=> res!514512 e!423892)))

(assert (=> b!760432 (= e!423891 e!423892)))

(declare-fun b!760433 () Bool)

(assert (=> b!760433 (= e!423890 (bvsge (x!64240 lt!338809) #b01111111111111111111111111111110))))

(declare-fun b!760434 () Bool)

(assert (=> b!760434 (= e!423888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338719 lt!338720 mask!3328))))

(assert (= (and d!100505 c!83340) b!760427))

(assert (= (and d!100505 (not c!83340)) b!760431))

(assert (= (and b!760431 c!83339) b!760429))

(assert (= (and b!760431 (not c!83339)) b!760434))

(assert (= (and d!100505 c!83341) b!760433))

(assert (= (and d!100505 (not c!83341)) b!760428))

(assert (= (and b!760428 res!514513) b!760432))

(assert (= (and b!760432 (not res!514512)) b!760426))

(assert (= (and b!760426 (not res!514514)) b!760430))

(assert (=> b!760434 m!707431))

(declare-fun m!707605 () Bool)

(assert (=> b!760434 m!707605))

(assert (=> b!760434 m!707605))

(declare-fun m!707607 () Bool)

(assert (=> b!760434 m!707607))

(declare-fun m!707609 () Bool)

(assert (=> b!760432 m!707609))

(assert (=> b!760430 m!707609))

(assert (=> d!100505 m!707431))

(declare-fun m!707611 () Bool)

(assert (=> d!100505 m!707611))

(assert (=> d!100505 m!707437))

(assert (=> b!760426 m!707609))

(assert (=> b!760231 d!100505))

(declare-fun d!100507 () Bool)

(declare-fun lt!338821 () (_ BitVec 32))

(declare-fun lt!338820 () (_ BitVec 32))

(assert (=> d!100507 (= lt!338821 (bvmul (bvxor lt!338820 (bvlshr lt!338820 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100507 (= lt!338820 ((_ extract 31 0) (bvand (bvxor lt!338719 (bvlshr lt!338719 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100507 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514515 (let ((h!15221 ((_ extract 31 0) (bvand (bvxor lt!338719 (bvlshr lt!338719 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64245 (bvmul (bvxor h!15221 (bvlshr h!15221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64245 (bvlshr x!64245 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514515 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514515 #b00000000000000000000000000000000))))))

(assert (=> d!100507 (= (toIndex!0 lt!338719 mask!3328) (bvand (bvxor lt!338821 (bvlshr lt!338821 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760231 d!100507))

(declare-fun b!760447 () Bool)

(declare-fun lt!338823 () SeekEntryResult!7745)

(assert (=> b!760447 (and (bvsge (index!33350 lt!338823) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338823) (size!20566 a!3186)))))

(declare-fun res!514518 () Bool)

(assert (=> b!760447 (= res!514518 (= (select (arr!20145 a!3186) (index!33350 lt!338823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423903 () Bool)

(assert (=> b!760447 (=> res!514518 e!423903)))

(declare-fun e!423900 () SeekEntryResult!7745)

(declare-fun b!760448 () Bool)

(assert (=> b!760448 (= e!423900 (Intermediate!7745 true (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760449 () Bool)

(declare-fun e!423901 () Bool)

(declare-fun e!423902 () Bool)

(assert (=> b!760449 (= e!423901 e!423902)))

(declare-fun res!514517 () Bool)

(assert (=> b!760449 (= res!514517 (and (is-Intermediate!7745 lt!338823) (not (undefined!8557 lt!338823)) (bvslt (x!64240 lt!338823) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338823) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338823) #b00000000000000000000000000000000)))))

(assert (=> b!760449 (=> (not res!514517) (not e!423902))))

(declare-fun e!423899 () SeekEntryResult!7745)

(declare-fun b!760450 () Bool)

(assert (=> b!760450 (= e!423899 (Intermediate!7745 false (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760451 () Bool)

(assert (=> b!760451 (and (bvsge (index!33350 lt!338823) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338823) (size!20566 a!3186)))))

(assert (=> b!760451 (= e!423903 (= (select (arr!20145 a!3186) (index!33350 lt!338823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760452 () Bool)

(assert (=> b!760452 (= e!423900 e!423899)))

(declare-fun c!83348 () Bool)

(declare-fun lt!338822 () (_ BitVec 64))

(assert (=> b!760452 (= c!83348 (or (= lt!338822 (select (arr!20145 a!3186) j!159)) (= (bvadd lt!338822 lt!338822) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100509 () Bool)

(assert (=> d!100509 e!423901))

(declare-fun c!83350 () Bool)

(assert (=> d!100509 (= c!83350 (and (is-Intermediate!7745 lt!338823) (undefined!8557 lt!338823)))))

(assert (=> d!100509 (= lt!338823 e!423900)))

(declare-fun c!83349 () Bool)

(assert (=> d!100509 (= c!83349 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100509 (= lt!338822 (select (arr!20145 a!3186) (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328)))))

(assert (=> d!100509 (validMask!0 mask!3328)))

(assert (=> d!100509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338823)))

(declare-fun b!760453 () Bool)

(assert (=> b!760453 (and (bvsge (index!33350 lt!338823) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338823) (size!20566 a!3186)))))

(declare-fun res!514516 () Bool)

(assert (=> b!760453 (= res!514516 (= (select (arr!20145 a!3186) (index!33350 lt!338823)) (select (arr!20145 a!3186) j!159)))))

(assert (=> b!760453 (=> res!514516 e!423903)))

(assert (=> b!760453 (= e!423902 e!423903)))

(declare-fun b!760454 () Bool)

(assert (=> b!760454 (= e!423901 (bvsge (x!64240 lt!338823) #b01111111111111111111111111111110))))

(declare-fun b!760455 () Bool)

(assert (=> b!760455 (= e!423899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100509 c!83349) b!760448))

(assert (= (and d!100509 (not c!83349)) b!760452))

(assert (= (and b!760452 c!83348) b!760450))

(assert (= (and b!760452 (not c!83348)) b!760455))

(assert (= (and d!100509 c!83350) b!760454))

(assert (= (and d!100509 (not c!83350)) b!760449))

(assert (= (and b!760449 res!514517) b!760453))

(assert (= (and b!760453 (not res!514516)) b!760447))

(assert (= (and b!760447 (not res!514518)) b!760451))

(assert (=> b!760455 m!707453))

(declare-fun m!707613 () Bool)

(assert (=> b!760455 m!707613))

(assert (=> b!760455 m!707613))

(assert (=> b!760455 m!707421))

(declare-fun m!707615 () Bool)

(assert (=> b!760455 m!707615))

(declare-fun m!707619 () Bool)

(assert (=> b!760453 m!707619))

(assert (=> b!760451 m!707619))

(assert (=> d!100509 m!707453))

(declare-fun m!707623 () Bool)

(assert (=> d!100509 m!707623))

(assert (=> d!100509 m!707437))

(assert (=> b!760447 m!707619))

(assert (=> b!760242 d!100509))

(declare-fun d!100511 () Bool)

(declare-fun lt!338828 () (_ BitVec 32))

(declare-fun lt!338827 () (_ BitVec 32))

(assert (=> d!100511 (= lt!338828 (bvmul (bvxor lt!338827 (bvlshr lt!338827 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100511 (= lt!338827 ((_ extract 31 0) (bvand (bvxor (select (arr!20145 a!3186) j!159) (bvlshr (select (arr!20145 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100511 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514515 (let ((h!15221 ((_ extract 31 0) (bvand (bvxor (select (arr!20145 a!3186) j!159) (bvlshr (select (arr!20145 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64245 (bvmul (bvxor h!15221 (bvlshr h!15221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64245 (bvlshr x!64245 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514515 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514515 #b00000000000000000000000000000000))))))

(assert (=> d!100511 (= (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) (bvand (bvxor lt!338828 (bvlshr lt!338828 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760242 d!100511))

(declare-fun bm!34935 () Bool)

(declare-fun call!34938 () Bool)

(declare-fun c!83362 () Bool)

(assert (=> bm!34935 (= call!34938 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83362 (Cons!14143 (select (arr!20145 a!3186) #b00000000000000000000000000000000) Nil!14144) Nil!14144)))))

(declare-fun b!760484 () Bool)

(declare-fun e!423926 () Bool)

(declare-fun contains!4066 (List!14147 (_ BitVec 64)) Bool)

(assert (=> b!760484 (= e!423926 (contains!4066 Nil!14144 (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760485 () Bool)

(declare-fun e!423924 () Bool)

(assert (=> b!760485 (= e!423924 call!34938)))

(declare-fun b!760486 () Bool)

(declare-fun e!423922 () Bool)

(assert (=> b!760486 (= e!423922 e!423924)))

(assert (=> b!760486 (= c!83362 (validKeyInArray!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760487 () Bool)

(declare-fun e!423921 () Bool)

(assert (=> b!760487 (= e!423921 e!423922)))

(declare-fun res!514525 () Bool)

(assert (=> b!760487 (=> (not res!514525) (not e!423922))))

(assert (=> b!760487 (= res!514525 (not e!423926))))

(declare-fun res!514528 () Bool)

(assert (=> b!760487 (=> (not res!514528) (not e!423926))))

(assert (=> b!760487 (= res!514528 (validKeyInArray!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760488 () Bool)

(assert (=> b!760488 (= e!423924 call!34938)))

(declare-fun d!100515 () Bool)

(declare-fun res!514529 () Bool)

(assert (=> d!100515 (=> res!514529 e!423921)))

(assert (=> d!100515 (= res!514529 (bvsge #b00000000000000000000000000000000 (size!20566 a!3186)))))

(assert (=> d!100515 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14144) e!423921)))

(assert (= (and d!100515 (not res!514529)) b!760487))

(assert (= (and b!760487 res!514528) b!760484))

(assert (= (and b!760487 res!514525) b!760486))

(assert (= (and b!760486 c!83362) b!760485))

(assert (= (and b!760486 (not c!83362)) b!760488))

(assert (= (or b!760485 b!760488) bm!34935))

(declare-fun m!707635 () Bool)

(assert (=> bm!34935 m!707635))

(declare-fun m!707637 () Bool)

(assert (=> bm!34935 m!707637))

(assert (=> b!760484 m!707635))

(assert (=> b!760484 m!707635))

(declare-fun m!707639 () Bool)

(assert (=> b!760484 m!707639))

(assert (=> b!760486 m!707635))

(assert (=> b!760486 m!707635))

(declare-fun m!707641 () Bool)

(assert (=> b!760486 m!707641))

(assert (=> b!760487 m!707635))

(assert (=> b!760487 m!707635))

(assert (=> b!760487 m!707641))

(assert (=> b!760241 d!100515))

(declare-fun d!100517 () Bool)

(declare-fun lt!338861 () SeekEntryResult!7745)

(assert (=> d!100517 (and (or (is-Undefined!7745 lt!338861) (not (is-Found!7745 lt!338861)) (and (bvsge (index!33349 lt!338861) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338861) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338861) (is-Found!7745 lt!338861) (not (is-MissingVacant!7745 lt!338861)) (not (= (index!33351 lt!338861) resIntermediateIndex!5)) (and (bvsge (index!33351 lt!338861) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338861) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338861) (ite (is-Found!7745 lt!338861) (= (select (arr!20145 a!3186) (index!33349 lt!338861)) (select (arr!20145 a!3186) j!159)) (and (is-MissingVacant!7745 lt!338861) (= (index!33351 lt!338861) resIntermediateIndex!5) (= (select (arr!20145 a!3186) (index!33351 lt!338861)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!423981 () SeekEntryResult!7745)

(assert (=> d!100517 (= lt!338861 e!423981)))

(declare-fun c!83394 () Bool)

(assert (=> d!100517 (= c!83394 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!338862 () (_ BitVec 64))

(assert (=> d!100517 (= lt!338862 (select (arr!20145 a!3186) resIntermediateIndex!5))))

(assert (=> d!100517 (validMask!0 mask!3328)))

(assert (=> d!100517 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338861)))

(declare-fun e!423979 () SeekEntryResult!7745)

(declare-fun b!760583 () Bool)

(assert (=> b!760583 (= e!423979 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760584 () Bool)

(declare-fun e!423980 () SeekEntryResult!7745)

(assert (=> b!760584 (= e!423980 (Found!7745 resIntermediateIndex!5))))

(declare-fun b!760585 () Bool)

(assert (=> b!760585 (= e!423981 e!423980)))

(declare-fun c!83395 () Bool)

(assert (=> b!760585 (= c!83395 (= lt!338862 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760586 () Bool)

(declare-fun c!83393 () Bool)

(assert (=> b!760586 (= c!83393 (= lt!338862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760586 (= e!423980 e!423979)))

(declare-fun b!760587 () Bool)

(assert (=> b!760587 (= e!423981 Undefined!7745)))

(declare-fun b!760588 () Bool)

(assert (=> b!760588 (= e!423979 (MissingVacant!7745 resIntermediateIndex!5))))

(assert (= (and d!100517 c!83394) b!760587))

(assert (= (and d!100517 (not c!83394)) b!760585))

(assert (= (and b!760585 c!83395) b!760584))

(assert (= (and b!760585 (not c!83395)) b!760586))

(assert (= (and b!760586 c!83393) b!760588))

(assert (= (and b!760586 (not c!83393)) b!760583))

(declare-fun m!707687 () Bool)

(assert (=> d!100517 m!707687))

(declare-fun m!707689 () Bool)

(assert (=> d!100517 m!707689))

(assert (=> d!100517 m!707419))

(assert (=> d!100517 m!707437))

(declare-fun m!707691 () Bool)

(assert (=> b!760583 m!707691))

(assert (=> b!760583 m!707691))

(assert (=> b!760583 m!707421))

(declare-fun m!707693 () Bool)

(assert (=> b!760583 m!707693))

(assert (=> b!760230 d!100517))

(declare-fun d!100537 () Bool)

(assert (=> d!100537 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65956 d!100537))

(declare-fun d!100553 () Bool)

(assert (=> d!100553 (= (array_inv!15941 a!3186) (bvsge (size!20566 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65956 d!100553))

(declare-fun b!760660 () Bool)

(declare-fun e!424032 () Bool)

(declare-fun e!424030 () Bool)

(assert (=> b!760660 (= e!424032 e!424030)))

(declare-fun lt!338899 () (_ BitVec 64))

(assert (=> b!760660 (= lt!338899 (select (arr!20145 a!3186) j!159))))

(declare-fun lt!338898 () Unit!26330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42066 (_ BitVec 64) (_ BitVec 32)) Unit!26330)

(assert (=> b!760660 (= lt!338898 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338899 j!159))))

(assert (=> b!760660 (arrayContainsKey!0 a!3186 lt!338899 #b00000000000000000000000000000000)))

(declare-fun lt!338900 () Unit!26330)

(assert (=> b!760660 (= lt!338900 lt!338898)))

(declare-fun res!514593 () Bool)

(assert (=> b!760660 (= res!514593 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) (Found!7745 j!159)))))

(assert (=> b!760660 (=> (not res!514593) (not e!424030))))

(declare-fun call!34948 () Bool)

(declare-fun bm!34945 () Bool)

(assert (=> bm!34945 (= call!34948 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760661 () Bool)

(declare-fun e!424031 () Bool)

(assert (=> b!760661 (= e!424031 e!424032)))

(declare-fun c!83417 () Bool)

(assert (=> b!760661 (= c!83417 (validKeyInArray!0 (select (arr!20145 a!3186) j!159)))))

(declare-fun d!100557 () Bool)

(declare-fun res!514594 () Bool)

(assert (=> d!100557 (=> res!514594 e!424031)))

(assert (=> d!100557 (= res!514594 (bvsge j!159 (size!20566 a!3186)))))

(assert (=> d!100557 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424031)))

(declare-fun b!760662 () Bool)

(assert (=> b!760662 (= e!424032 call!34948)))

(declare-fun b!760663 () Bool)

(assert (=> b!760663 (= e!424030 call!34948)))

(assert (= (and d!100557 (not res!514594)) b!760661))

(assert (= (and b!760661 c!83417) b!760660))

(assert (= (and b!760661 (not c!83417)) b!760662))

(assert (= (and b!760660 res!514593) b!760663))

(assert (= (or b!760663 b!760662) bm!34945))

(assert (=> b!760660 m!707421))

(declare-fun m!707743 () Bool)

(assert (=> b!760660 m!707743))

(declare-fun m!707745 () Bool)

(assert (=> b!760660 m!707745))

(assert (=> b!760660 m!707421))

(assert (=> b!760660 m!707447))

(declare-fun m!707747 () Bool)

(assert (=> bm!34945 m!707747))

(assert (=> b!760661 m!707421))

(assert (=> b!760661 m!707421))

(assert (=> b!760661 m!707423))

(assert (=> b!760237 d!100557))

(declare-fun d!100567 () Bool)

(assert (=> d!100567 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338912 () Unit!26330)

(declare-fun choose!38 (array!42066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26330)

(assert (=> d!100567 (= lt!338912 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100567 (validMask!0 mask!3328)))

(assert (=> d!100567 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338912)))

(declare-fun bs!21387 () Bool)

(assert (= bs!21387 d!100567))

(assert (=> bs!21387 m!707415))

(declare-fun m!707765 () Bool)

(assert (=> bs!21387 m!707765))

(assert (=> bs!21387 m!707437))

(assert (=> b!760237 d!100567))

(declare-fun d!100573 () Bool)

(assert (=> d!100573 (= (validKeyInArray!0 (select (arr!20145 a!3186) j!159)) (and (not (= (select (arr!20145 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20145 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760226 d!100573))

(declare-fun b!760668 () Bool)

(declare-fun lt!338914 () SeekEntryResult!7745)

(assert (=> b!760668 (and (bvsge (index!33350 lt!338914) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338914) (size!20566 a!3186)))))

(declare-fun res!514599 () Bool)

(assert (=> b!760668 (= res!514599 (= (select (arr!20145 a!3186) (index!33350 lt!338914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424040 () Bool)

(assert (=> b!760668 (=> res!514599 e!424040)))

(declare-fun b!760669 () Bool)

(declare-fun e!424037 () SeekEntryResult!7745)

(assert (=> b!760669 (= e!424037 (Intermediate!7745 true index!1321 x!1131))))

(declare-fun b!760670 () Bool)

(declare-fun e!424038 () Bool)

(declare-fun e!424039 () Bool)

(assert (=> b!760670 (= e!424038 e!424039)))

(declare-fun res!514598 () Bool)

(assert (=> b!760670 (= res!514598 (and (is-Intermediate!7745 lt!338914) (not (undefined!8557 lt!338914)) (bvslt (x!64240 lt!338914) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338914) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338914) x!1131)))))

(assert (=> b!760670 (=> (not res!514598) (not e!424039))))

(declare-fun b!760671 () Bool)

(declare-fun e!424036 () SeekEntryResult!7745)

(assert (=> b!760671 (= e!424036 (Intermediate!7745 false index!1321 x!1131))))

(declare-fun b!760672 () Bool)

(assert (=> b!760672 (and (bvsge (index!33350 lt!338914) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338914) (size!20566 a!3186)))))

(assert (=> b!760672 (= e!424040 (= (select (arr!20145 a!3186) (index!33350 lt!338914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760673 () Bool)

(assert (=> b!760673 (= e!424037 e!424036)))

(declare-fun c!83419 () Bool)

(declare-fun lt!338913 () (_ BitVec 64))

(assert (=> b!760673 (= c!83419 (or (= lt!338913 (select (arr!20145 a!3186) j!159)) (= (bvadd lt!338913 lt!338913) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100575 () Bool)

(assert (=> d!100575 e!424038))

(declare-fun c!83421 () Bool)

(assert (=> d!100575 (= c!83421 (and (is-Intermediate!7745 lt!338914) (undefined!8557 lt!338914)))))

(assert (=> d!100575 (= lt!338914 e!424037)))

(declare-fun c!83420 () Bool)

(assert (=> d!100575 (= c!83420 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100575 (= lt!338913 (select (arr!20145 a!3186) index!1321))))

(assert (=> d!100575 (validMask!0 mask!3328)))

(assert (=> d!100575 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338914)))

(declare-fun b!760674 () Bool)

(assert (=> b!760674 (and (bvsge (index!33350 lt!338914) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338914) (size!20566 a!3186)))))

(declare-fun res!514597 () Bool)

(assert (=> b!760674 (= res!514597 (= (select (arr!20145 a!3186) (index!33350 lt!338914)) (select (arr!20145 a!3186) j!159)))))

(assert (=> b!760674 (=> res!514597 e!424040)))

(assert (=> b!760674 (= e!424039 e!424040)))

(declare-fun b!760675 () Bool)

(assert (=> b!760675 (= e!424038 (bvsge (x!64240 lt!338914) #b01111111111111111111111111111110))))

(declare-fun b!760676 () Bool)

(assert (=> b!760676 (= e!424036 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100575 c!83420) b!760669))

(assert (= (and d!100575 (not c!83420)) b!760673))

(assert (= (and b!760673 c!83419) b!760671))

(assert (= (and b!760673 (not c!83419)) b!760676))

(assert (= (and d!100575 c!83421) b!760675))

(assert (= (and d!100575 (not c!83421)) b!760670))

(assert (= (and b!760670 res!514598) b!760674))

(assert (= (and b!760674 (not res!514597)) b!760668))

(assert (= (and b!760668 (not res!514599)) b!760672))

(assert (=> b!760676 m!707597))

(assert (=> b!760676 m!707597))

(assert (=> b!760676 m!707421))

(declare-fun m!707767 () Bool)

(assert (=> b!760676 m!707767))

(declare-fun m!707769 () Bool)

(assert (=> b!760674 m!707769))

(assert (=> b!760672 m!707769))

(declare-fun m!707771 () Bool)

(assert (=> d!100575 m!707771))

(assert (=> d!100575 m!707437))

(assert (=> b!760668 m!707769))

(assert (=> b!760236 d!100575))

(declare-fun b!760707 () Bool)

(declare-fun e!424058 () SeekEntryResult!7745)

(assert (=> b!760707 (= e!424058 Undefined!7745)))

(declare-fun b!760708 () Bool)

(declare-fun e!424056 () SeekEntryResult!7745)

(assert (=> b!760708 (= e!424058 e!424056)))

(declare-fun lt!338927 () (_ BitVec 64))

(declare-fun lt!338928 () SeekEntryResult!7745)

(assert (=> b!760708 (= lt!338927 (select (arr!20145 a!3186) (index!33350 lt!338928)))))

(declare-fun c!83437 () Bool)

(assert (=> b!760708 (= c!83437 (= lt!338927 (select (arr!20145 a!3186) j!159)))))

(declare-fun e!424057 () SeekEntryResult!7745)

(declare-fun b!760709 () Bool)

(assert (=> b!760709 (= e!424057 (seekKeyOrZeroReturnVacant!0 (x!64240 lt!338928) (index!33350 lt!338928) (index!33350 lt!338928) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760711 () Bool)

(assert (=> b!760711 (= e!424056 (Found!7745 (index!33350 lt!338928)))))

(declare-fun b!760712 () Bool)

(assert (=> b!760712 (= e!424057 (MissingZero!7745 (index!33350 lt!338928)))))

(declare-fun b!760710 () Bool)

(declare-fun c!83439 () Bool)

(assert (=> b!760710 (= c!83439 (= lt!338927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760710 (= e!424056 e!424057)))

(declare-fun d!100577 () Bool)

(declare-fun lt!338929 () SeekEntryResult!7745)

(assert (=> d!100577 (and (or (is-Undefined!7745 lt!338929) (not (is-Found!7745 lt!338929)) (and (bvsge (index!33349 lt!338929) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338929) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338929) (is-Found!7745 lt!338929) (not (is-MissingZero!7745 lt!338929)) (and (bvsge (index!33348 lt!338929) #b00000000000000000000000000000000) (bvslt (index!33348 lt!338929) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338929) (is-Found!7745 lt!338929) (is-MissingZero!7745 lt!338929) (not (is-MissingVacant!7745 lt!338929)) (and (bvsge (index!33351 lt!338929) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338929) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338929) (ite (is-Found!7745 lt!338929) (= (select (arr!20145 a!3186) (index!33349 lt!338929)) (select (arr!20145 a!3186) j!159)) (ite (is-MissingZero!7745 lt!338929) (= (select (arr!20145 a!3186) (index!33348 lt!338929)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7745 lt!338929) (= (select (arr!20145 a!3186) (index!33351 lt!338929)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100577 (= lt!338929 e!424058)))

(declare-fun c!83438 () Bool)

(assert (=> d!100577 (= c!83438 (and (is-Intermediate!7745 lt!338928) (undefined!8557 lt!338928)))))

(assert (=> d!100577 (= lt!338928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100577 (validMask!0 mask!3328)))

(assert (=> d!100577 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338929)))

(assert (= (and d!100577 c!83438) b!760707))

(assert (= (and d!100577 (not c!83438)) b!760708))

(assert (= (and b!760708 c!83437) b!760711))

(assert (= (and b!760708 (not c!83437)) b!760710))

(assert (= (and b!760710 c!83439) b!760712))

(assert (= (and b!760710 (not c!83439)) b!760709))

(declare-fun m!707779 () Bool)

(assert (=> b!760708 m!707779))

(assert (=> b!760709 m!707421))

(declare-fun m!707781 () Bool)

(assert (=> b!760709 m!707781))

(declare-fun m!707783 () Bool)

(assert (=> d!100577 m!707783))

(declare-fun m!707785 () Bool)

(assert (=> d!100577 m!707785))

(assert (=> d!100577 m!707453))

(assert (=> d!100577 m!707421))

(assert (=> d!100577 m!707455))

(declare-fun m!707787 () Bool)

(assert (=> d!100577 m!707787))

(assert (=> d!100577 m!707421))

(assert (=> d!100577 m!707453))

(assert (=> d!100577 m!707437))

(assert (=> b!760235 d!100577))

(declare-fun d!100581 () Bool)

(declare-fun lt!338930 () SeekEntryResult!7745)

(assert (=> d!100581 (and (or (is-Undefined!7745 lt!338930) (not (is-Found!7745 lt!338930)) (and (bvsge (index!33349 lt!338930) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338930) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338930) (is-Found!7745 lt!338930) (not (is-MissingVacant!7745 lt!338930)) (not (= (index!33351 lt!338930) resIntermediateIndex!5)) (and (bvsge (index!33351 lt!338930) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338930) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338930) (ite (is-Found!7745 lt!338930) (= (select (arr!20145 a!3186) (index!33349 lt!338930)) (select (arr!20145 a!3186) j!159)) (and (is-MissingVacant!7745 lt!338930) (= (index!33351 lt!338930) resIntermediateIndex!5) (= (select (arr!20145 a!3186) (index!33351 lt!338930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424061 () SeekEntryResult!7745)

(assert (=> d!100581 (= lt!338930 e!424061)))

(declare-fun c!83441 () Bool)

(assert (=> d!100581 (= c!83441 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338931 () (_ BitVec 64))

(assert (=> d!100581 (= lt!338931 (select (arr!20145 a!3186) index!1321))))

(assert (=> d!100581 (validMask!0 mask!3328)))

(assert (=> d!100581 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338930)))

(declare-fun e!424059 () SeekEntryResult!7745)

(declare-fun b!760713 () Bool)

(assert (=> b!760713 (= e!424059 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760714 () Bool)

(declare-fun e!424060 () SeekEntryResult!7745)

(assert (=> b!760714 (= e!424060 (Found!7745 index!1321))))

(declare-fun b!760715 () Bool)

(assert (=> b!760715 (= e!424061 e!424060)))

(declare-fun c!83442 () Bool)

(assert (=> b!760715 (= c!83442 (= lt!338931 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760716 () Bool)

(declare-fun c!83440 () Bool)

(assert (=> b!760716 (= c!83440 (= lt!338931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760716 (= e!424060 e!424059)))

(declare-fun b!760717 () Bool)

(assert (=> b!760717 (= e!424061 Undefined!7745)))

(declare-fun b!760718 () Bool)

(assert (=> b!760718 (= e!424059 (MissingVacant!7745 resIntermediateIndex!5))))

(assert (= (and d!100581 c!83441) b!760717))

(assert (= (and d!100581 (not c!83441)) b!760715))

(assert (= (and b!760715 c!83442) b!760714))

(assert (= (and b!760715 (not c!83442)) b!760716))

(assert (= (and b!760716 c!83440) b!760718))

(assert (= (and b!760716 (not c!83440)) b!760713))

(declare-fun m!707789 () Bool)

(assert (=> d!100581 m!707789))

(declare-fun m!707791 () Bool)

(assert (=> d!100581 m!707791))

(assert (=> d!100581 m!707771))

(assert (=> d!100581 m!707437))

(assert (=> b!760713 m!707597))

(assert (=> b!760713 m!707597))

(assert (=> b!760713 m!707421))

(declare-fun m!707793 () Bool)

(assert (=> b!760713 m!707793))

(assert (=> b!760240 d!100581))

(declare-fun b!760719 () Bool)

(declare-fun e!424064 () Bool)

(declare-fun e!424062 () Bool)

(assert (=> b!760719 (= e!424064 e!424062)))

(declare-fun lt!338933 () (_ BitVec 64))

(assert (=> b!760719 (= lt!338933 (select (arr!20145 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338932 () Unit!26330)

(assert (=> b!760719 (= lt!338932 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338933 #b00000000000000000000000000000000))))

(assert (=> b!760719 (arrayContainsKey!0 a!3186 lt!338933 #b00000000000000000000000000000000)))

(declare-fun lt!338934 () Unit!26330)

(assert (=> b!760719 (= lt!338934 lt!338932)))

(declare-fun res!514600 () Bool)

(assert (=> b!760719 (= res!514600 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7745 #b00000000000000000000000000000000)))))

(assert (=> b!760719 (=> (not res!514600) (not e!424062))))

(declare-fun bm!34947 () Bool)

(declare-fun call!34950 () Bool)

(assert (=> bm!34947 (= call!34950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760720 () Bool)

(declare-fun e!424063 () Bool)

(assert (=> b!760720 (= e!424063 e!424064)))

(declare-fun c!83443 () Bool)

(assert (=> b!760720 (= c!83443 (validKeyInArray!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100583 () Bool)

(declare-fun res!514601 () Bool)

(assert (=> d!100583 (=> res!514601 e!424063)))

(assert (=> d!100583 (= res!514601 (bvsge #b00000000000000000000000000000000 (size!20566 a!3186)))))

(assert (=> d!100583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424063)))

(declare-fun b!760721 () Bool)

(assert (=> b!760721 (= e!424064 call!34950)))

(declare-fun b!760722 () Bool)

(assert (=> b!760722 (= e!424062 call!34950)))

(assert (= (and d!100583 (not res!514601)) b!760720))

(assert (= (and b!760720 c!83443) b!760719))

(assert (= (and b!760720 (not c!83443)) b!760721))

(assert (= (and b!760719 res!514600) b!760722))

(assert (= (or b!760722 b!760721) bm!34947))

(assert (=> b!760719 m!707635))

(declare-fun m!707795 () Bool)

(assert (=> b!760719 m!707795))

(declare-fun m!707797 () Bool)

(assert (=> b!760719 m!707797))

(assert (=> b!760719 m!707635))

(declare-fun m!707799 () Bool)

(assert (=> b!760719 m!707799))

(declare-fun m!707801 () Bool)

(assert (=> bm!34947 m!707801))

(assert (=> b!760720 m!707635))

(assert (=> b!760720 m!707635))

(assert (=> b!760720 m!707641))

(assert (=> b!760239 d!100583))

(declare-fun d!100585 () Bool)

(assert (=> d!100585 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760228 d!100585))

(declare-fun b!760723 () Bool)

(declare-fun e!424067 () SeekEntryResult!7745)

(assert (=> b!760723 (= e!424067 Undefined!7745)))

(declare-fun b!760724 () Bool)

(declare-fun e!424065 () SeekEntryResult!7745)

(assert (=> b!760724 (= e!424067 e!424065)))

(declare-fun lt!338935 () (_ BitVec 64))

(declare-fun lt!338936 () SeekEntryResult!7745)

(assert (=> b!760724 (= lt!338935 (select (arr!20145 a!3186) (index!33350 lt!338936)))))

(declare-fun c!83444 () Bool)

(assert (=> b!760724 (= c!83444 (= lt!338935 k!2102))))

(declare-fun b!760725 () Bool)

(declare-fun e!424066 () SeekEntryResult!7745)

(assert (=> b!760725 (= e!424066 (seekKeyOrZeroReturnVacant!0 (x!64240 lt!338936) (index!33350 lt!338936) (index!33350 lt!338936) k!2102 a!3186 mask!3328))))

(declare-fun b!760727 () Bool)

(assert (=> b!760727 (= e!424065 (Found!7745 (index!33350 lt!338936)))))

(declare-fun b!760728 () Bool)

(assert (=> b!760728 (= e!424066 (MissingZero!7745 (index!33350 lt!338936)))))

(declare-fun b!760726 () Bool)

(declare-fun c!83446 () Bool)

(assert (=> b!760726 (= c!83446 (= lt!338935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760726 (= e!424065 e!424066)))

(declare-fun d!100587 () Bool)

(declare-fun lt!338937 () SeekEntryResult!7745)

(assert (=> d!100587 (and (or (is-Undefined!7745 lt!338937) (not (is-Found!7745 lt!338937)) (and (bvsge (index!33349 lt!338937) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338937) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338937) (is-Found!7745 lt!338937) (not (is-MissingZero!7745 lt!338937)) (and (bvsge (index!33348 lt!338937) #b00000000000000000000000000000000) (bvslt (index!33348 lt!338937) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338937) (is-Found!7745 lt!338937) (is-MissingZero!7745 lt!338937) (not (is-MissingVacant!7745 lt!338937)) (and (bvsge (index!33351 lt!338937) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338937) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338937) (ite (is-Found!7745 lt!338937) (= (select (arr!20145 a!3186) (index!33349 lt!338937)) k!2102) (ite (is-MissingZero!7745 lt!338937) (= (select (arr!20145 a!3186) (index!33348 lt!338937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7745 lt!338937) (= (select (arr!20145 a!3186) (index!33351 lt!338937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100587 (= lt!338937 e!424067)))

(declare-fun c!83445 () Bool)

(assert (=> d!100587 (= c!83445 (and (is-Intermediate!7745 lt!338936) (undefined!8557 lt!338936)))))

(assert (=> d!100587 (= lt!338936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100587 (validMask!0 mask!3328)))

(assert (=> d!100587 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!338937)))

(assert (= (and d!100587 c!83445) b!760723))

(assert (= (and d!100587 (not c!83445)) b!760724))

(assert (= (and b!760724 c!83444) b!760727))

(assert (= (and b!760724 (not c!83444)) b!760726))

(assert (= (and b!760726 c!83446) b!760728))

(assert (= (and b!760726 (not c!83446)) b!760725))

(declare-fun m!707803 () Bool)

(assert (=> b!760724 m!707803))

(declare-fun m!707805 () Bool)

(assert (=> b!760725 m!707805))

(declare-fun m!707807 () Bool)

(assert (=> d!100587 m!707807))

(declare-fun m!707809 () Bool)

(assert (=> d!100587 m!707809))

(declare-fun m!707811 () Bool)

(assert (=> d!100587 m!707811))

(declare-fun m!707813 () Bool)

(assert (=> d!100587 m!707813))

(declare-fun m!707815 () Bool)

(assert (=> d!100587 m!707815))

(assert (=> d!100587 m!707811))

(assert (=> d!100587 m!707437))

(assert (=> b!760227 d!100587))

(declare-fun d!100589 () Bool)

(declare-fun res!514606 () Bool)

(declare-fun e!424072 () Bool)

(assert (=> d!100589 (=> res!514606 e!424072)))

(assert (=> d!100589 (= res!514606 (= (select (arr!20145 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100589 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!424072)))

(declare-fun b!760733 () Bool)

(declare-fun e!424073 () Bool)

(assert (=> b!760733 (= e!424072 e!424073)))

(declare-fun res!514607 () Bool)

(assert (=> b!760733 (=> (not res!514607) (not e!424073))))

(assert (=> b!760733 (= res!514607 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(declare-fun b!760734 () Bool)

(assert (=> b!760734 (= e!424073 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100589 (not res!514606)) b!760733))

(assert (= (and b!760733 res!514607) b!760734))

(assert (=> d!100589 m!707635))

(declare-fun m!707817 () Bool)

(assert (=> b!760734 m!707817))

(assert (=> b!760238 d!100589))

(push 1)

(assert (not d!100587))

(assert (not d!100567))

(assert (not b!760660))

(assert (not b!760720))

(assert (not d!100517))

(assert (not b!760661))

(assert (not b!760425))

(assert (not b!760676))

(assert (not d!100577))

(assert (not d!100581))

(assert (not d!100497))

(assert (not b!760734))

(assert (not b!760484))

(assert (not b!760719))

(assert (not b!760487))

(assert (not d!100575))

(assert (not b!760725))

(assert (not d!100505))

(assert (not bm!34945))

(assert (not bm!34935))

(assert (not b!760583))

(assert (not b!760434))

(assert (not b!760486))

(assert (not d!100509))

(assert (not b!760713))

(assert (not bm!34947))

(assert (not b!760709))

(assert (not b!760455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100653 () Bool)

(declare-fun lt!338984 () Bool)

(declare-fun content!380 (List!14147) (Set (_ BitVec 64)))

(assert (=> d!100653 (= lt!338984 (set.member (select (arr!20145 a!3186) #b00000000000000000000000000000000) (content!380 Nil!14144)))))

(declare-fun e!424161 () Bool)

(assert (=> d!100653 (= lt!338984 e!424161)))

(declare-fun res!514662 () Bool)

(assert (=> d!100653 (=> (not res!514662) (not e!424161))))

(assert (=> d!100653 (= res!514662 (is-Cons!14143 Nil!14144))))

(assert (=> d!100653 (= (contains!4066 Nil!14144 (select (arr!20145 a!3186) #b00000000000000000000000000000000)) lt!338984)))

(declare-fun b!760866 () Bool)

(declare-fun e!424162 () Bool)

(assert (=> b!760866 (= e!424161 e!424162)))

(declare-fun res!514661 () Bool)

(assert (=> b!760866 (=> res!514661 e!424162)))

(assert (=> b!760866 (= res!514661 (= (h!15218 Nil!14144) (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760867 () Bool)

(assert (=> b!760867 (= e!424162 (contains!4066 (t!20462 Nil!14144) (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100653 res!514662) b!760866))

(assert (= (and b!760866 (not res!514661)) b!760867))

(declare-fun m!707969 () Bool)

(assert (=> d!100653 m!707969))

(assert (=> d!100653 m!707635))

(declare-fun m!707971 () Bool)

(assert (=> d!100653 m!707971))

(assert (=> b!760867 m!707635))

(declare-fun m!707973 () Bool)

(assert (=> b!760867 m!707973))

(assert (=> b!760484 d!100653))

(declare-fun b!760868 () Bool)

(declare-fun lt!338986 () SeekEntryResult!7745)

(assert (=> b!760868 (and (bvsge (index!33350 lt!338986) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338986) (size!20566 a!3186)))))

(declare-fun res!514665 () Bool)

(assert (=> b!760868 (= res!514665 (= (select (arr!20145 a!3186) (index!33350 lt!338986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424167 () Bool)

(assert (=> b!760868 (=> res!514665 e!424167)))

(declare-fun b!760869 () Bool)

(declare-fun e!424164 () SeekEntryResult!7745)

(assert (=> b!760869 (= e!424164 (Intermediate!7745 true (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760870 () Bool)

(declare-fun e!424165 () Bool)

(declare-fun e!424166 () Bool)

(assert (=> b!760870 (= e!424165 e!424166)))

(declare-fun res!514664 () Bool)

(assert (=> b!760870 (= res!514664 (and (is-Intermediate!7745 lt!338986) (not (undefined!8557 lt!338986)) (bvslt (x!64240 lt!338986) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338986) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338986) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760870 (=> (not res!514664) (not e!424166))))

(declare-fun b!760871 () Bool)

(declare-fun e!424163 () SeekEntryResult!7745)

(assert (=> b!760871 (= e!424163 (Intermediate!7745 false (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760872 () Bool)

(assert (=> b!760872 (and (bvsge (index!33350 lt!338986) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338986) (size!20566 a!3186)))))

(assert (=> b!760872 (= e!424167 (= (select (arr!20145 a!3186) (index!33350 lt!338986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760873 () Bool)

(assert (=> b!760873 (= e!424164 e!424163)))

(declare-fun lt!338985 () (_ BitVec 64))

(declare-fun c!83486 () Bool)

(assert (=> b!760873 (= c!83486 (or (= lt!338985 (select (arr!20145 a!3186) j!159)) (= (bvadd lt!338985 lt!338985) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100655 () Bool)

(assert (=> d!100655 e!424165))

(declare-fun c!83488 () Bool)

(assert (=> d!100655 (= c!83488 (and (is-Intermediate!7745 lt!338986) (undefined!8557 lt!338986)))))

(assert (=> d!100655 (= lt!338986 e!424164)))

(declare-fun c!83487 () Bool)

(assert (=> d!100655 (= c!83487 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100655 (= lt!338985 (select (arr!20145 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100655 (validMask!0 mask!3328)))

(assert (=> d!100655 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338986)))

(declare-fun b!760874 () Bool)

(assert (=> b!760874 (and (bvsge (index!33350 lt!338986) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338986) (size!20566 a!3186)))))

(declare-fun res!514663 () Bool)

(assert (=> b!760874 (= res!514663 (= (select (arr!20145 a!3186) (index!33350 lt!338986)) (select (arr!20145 a!3186) j!159)))))

(assert (=> b!760874 (=> res!514663 e!424167)))

(assert (=> b!760874 (= e!424166 e!424167)))

(declare-fun b!760875 () Bool)

(assert (=> b!760875 (= e!424165 (bvsge (x!64240 lt!338986) #b01111111111111111111111111111110))))

(declare-fun b!760876 () Bool)

(assert (=> b!760876 (= e!424163 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100655 c!83487) b!760869))

(assert (= (and d!100655 (not c!83487)) b!760873))

(assert (= (and b!760873 c!83486) b!760871))

(assert (= (and b!760873 (not c!83486)) b!760876))

(assert (= (and d!100655 c!83488) b!760875))

(assert (= (and d!100655 (not c!83488)) b!760870))

(assert (= (and b!760870 res!514664) b!760874))

(assert (= (and b!760874 (not res!514663)) b!760868))

(assert (= (and b!760868 (not res!514665)) b!760872))

(assert (=> b!760876 m!707613))

(declare-fun m!707975 () Bool)

(assert (=> b!760876 m!707975))

(assert (=> b!760876 m!707975))

(assert (=> b!760876 m!707421))

(declare-fun m!707977 () Bool)

(assert (=> b!760876 m!707977))

(declare-fun m!707979 () Bool)

(assert (=> b!760874 m!707979))

(assert (=> b!760872 m!707979))

(assert (=> d!100655 m!707613))

(declare-fun m!707981 () Bool)

(assert (=> d!100655 m!707981))

(assert (=> d!100655 m!707437))

(assert (=> b!760868 m!707979))

(assert (=> b!760455 d!100655))

(declare-fun d!100657 () Bool)

(declare-fun lt!338989 () (_ BitVec 32))

(assert (=> d!100657 (and (bvsge lt!338989 #b00000000000000000000000000000000) (bvslt lt!338989 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100657 (= lt!338989 (choose!52 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100657 (validMask!0 mask!3328)))

(assert (=> d!100657 (= (nextIndex!0 (toIndex!0 (select (arr!20145 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338989)))

(declare-fun bs!21395 () Bool)

(assert (= bs!21395 d!100657))

(assert (=> bs!21395 m!707453))

(declare-fun m!707983 () Bool)

(assert (=> bs!21395 m!707983))

(assert (=> bs!21395 m!707437))

(assert (=> b!760455 d!100657))

(declare-fun d!100659 () Bool)

(declare-fun res!514666 () Bool)

(declare-fun e!424168 () Bool)

(assert (=> d!100659 (=> res!514666 e!424168)))

(assert (=> d!100659 (= res!514666 (= (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2102))))

(assert (=> d!100659 (= (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!424168)))

(declare-fun b!760877 () Bool)

(declare-fun e!424169 () Bool)

(assert (=> b!760877 (= e!424168 e!424169)))

(declare-fun res!514667 () Bool)

(assert (=> b!760877 (=> (not res!514667) (not e!424169))))

(assert (=> b!760877 (= res!514667 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(declare-fun b!760878 () Bool)

(assert (=> b!760878 (= e!424169 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!100659 (not res!514666)) b!760877))

(assert (= (and b!760877 res!514667) b!760878))

(declare-fun m!707985 () Bool)

(assert (=> d!100659 m!707985))

(declare-fun m!707987 () Bool)

(assert (=> b!760878 m!707987))

(assert (=> b!760734 d!100659))

(declare-fun b!760879 () Bool)

(declare-fun lt!338991 () SeekEntryResult!7745)

(assert (=> b!760879 (and (bvsge (index!33350 lt!338991) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338991) (size!20566 a!3186)))))

(declare-fun res!514670 () Bool)

(assert (=> b!760879 (= res!514670 (= (select (arr!20145 a!3186) (index!33350 lt!338991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424174 () Bool)

(assert (=> b!760879 (=> res!514670 e!424174)))

(declare-fun b!760880 () Bool)

(declare-fun e!424171 () SeekEntryResult!7745)

(assert (=> b!760880 (= e!424171 (Intermediate!7745 true (toIndex!0 k!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760881 () Bool)

(declare-fun e!424172 () Bool)

(declare-fun e!424173 () Bool)

(assert (=> b!760881 (= e!424172 e!424173)))

(declare-fun res!514669 () Bool)

(assert (=> b!760881 (= res!514669 (and (is-Intermediate!7745 lt!338991) (not (undefined!8557 lt!338991)) (bvslt (x!64240 lt!338991) #b01111111111111111111111111111110) (bvsge (x!64240 lt!338991) #b00000000000000000000000000000000) (bvsge (x!64240 lt!338991) #b00000000000000000000000000000000)))))

(assert (=> b!760881 (=> (not res!514669) (not e!424173))))

(declare-fun b!760882 () Bool)

(declare-fun e!424170 () SeekEntryResult!7745)

(assert (=> b!760882 (= e!424170 (Intermediate!7745 false (toIndex!0 k!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760883 () Bool)

(assert (=> b!760883 (and (bvsge (index!33350 lt!338991) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338991) (size!20566 a!3186)))))

(assert (=> b!760883 (= e!424174 (= (select (arr!20145 a!3186) (index!33350 lt!338991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760884 () Bool)

(assert (=> b!760884 (= e!424171 e!424170)))

(declare-fun c!83489 () Bool)

(declare-fun lt!338990 () (_ BitVec 64))

(assert (=> b!760884 (= c!83489 (or (= lt!338990 k!2102) (= (bvadd lt!338990 lt!338990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100661 () Bool)

(assert (=> d!100661 e!424172))

(declare-fun c!83491 () Bool)

(assert (=> d!100661 (= c!83491 (and (is-Intermediate!7745 lt!338991) (undefined!8557 lt!338991)))))

(assert (=> d!100661 (= lt!338991 e!424171)))

(declare-fun c!83490 () Bool)

(assert (=> d!100661 (= c!83490 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100661 (= lt!338990 (select (arr!20145 a!3186) (toIndex!0 k!2102 mask!3328)))))

(assert (=> d!100661 (validMask!0 mask!3328)))

(assert (=> d!100661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328) lt!338991)))

(declare-fun b!760885 () Bool)

(assert (=> b!760885 (and (bvsge (index!33350 lt!338991) #b00000000000000000000000000000000) (bvslt (index!33350 lt!338991) (size!20566 a!3186)))))

(declare-fun res!514668 () Bool)

(assert (=> b!760885 (= res!514668 (= (select (arr!20145 a!3186) (index!33350 lt!338991)) k!2102))))

(assert (=> b!760885 (=> res!514668 e!424174)))

(assert (=> b!760885 (= e!424173 e!424174)))

(declare-fun b!760886 () Bool)

(assert (=> b!760886 (= e!424172 (bvsge (x!64240 lt!338991) #b01111111111111111111111111111110))))

(declare-fun b!760887 () Bool)

(assert (=> b!760887 (= e!424170 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2102 mask!3328) #b00000000000000000000000000000000 mask!3328) k!2102 a!3186 mask!3328))))

(assert (= (and d!100661 c!83490) b!760880))

(assert (= (and d!100661 (not c!83490)) b!760884))

(assert (= (and b!760884 c!83489) b!760882))

(assert (= (and b!760884 (not c!83489)) b!760887))

(assert (= (and d!100661 c!83491) b!760886))

(assert (= (and d!100661 (not c!83491)) b!760881))

(assert (= (and b!760881 res!514669) b!760885))

(assert (= (and b!760885 (not res!514668)) b!760879))

(assert (= (and b!760879 (not res!514670)) b!760883))

(assert (=> b!760887 m!707811))

(declare-fun m!707989 () Bool)

(assert (=> b!760887 m!707989))

(assert (=> b!760887 m!707989))

(declare-fun m!707991 () Bool)

(assert (=> b!760887 m!707991))

(declare-fun m!707993 () Bool)

(assert (=> b!760885 m!707993))

(assert (=> b!760883 m!707993))

(assert (=> d!100661 m!707811))

(declare-fun m!707995 () Bool)

(assert (=> d!100661 m!707995))

(assert (=> d!100661 m!707437))

(assert (=> b!760879 m!707993))

(assert (=> d!100587 d!100661))

(declare-fun d!100663 () Bool)

(declare-fun lt!338993 () (_ BitVec 32))

(declare-fun lt!338992 () (_ BitVec 32))

(assert (=> d!100663 (= lt!338993 (bvmul (bvxor lt!338992 (bvlshr lt!338992 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100663 (= lt!338992 ((_ extract 31 0) (bvand (bvxor k!2102 (bvlshr k!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100663 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514515 (let ((h!15221 ((_ extract 31 0) (bvand (bvxor k!2102 (bvlshr k!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64245 (bvmul (bvxor h!15221 (bvlshr h!15221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64245 (bvlshr x!64245 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514515 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514515 #b00000000000000000000000000000000))))))

(assert (=> d!100663 (= (toIndex!0 k!2102 mask!3328) (bvand (bvxor lt!338993 (bvlshr lt!338993 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!100587 d!100663))

(assert (=> d!100587 d!100537))

(declare-fun lt!338994 () SeekEntryResult!7745)

(declare-fun d!100665 () Bool)

(assert (=> d!100665 (and (or (is-Undefined!7745 lt!338994) (not (is-Found!7745 lt!338994)) (and (bvsge (index!33349 lt!338994) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338994) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338994) (is-Found!7745 lt!338994) (not (is-MissingVacant!7745 lt!338994)) (not (= (index!33351 lt!338994) (index!33350 lt!338928))) (and (bvsge (index!33351 lt!338994) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338994) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338994) (ite (is-Found!7745 lt!338994) (= (select (arr!20145 a!3186) (index!33349 lt!338994)) (select (arr!20145 a!3186) j!159)) (and (is-MissingVacant!7745 lt!338994) (= (index!33351 lt!338994) (index!33350 lt!338928)) (= (select (arr!20145 a!3186) (index!33351 lt!338994)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424177 () SeekEntryResult!7745)

(assert (=> d!100665 (= lt!338994 e!424177)))

(declare-fun c!83493 () Bool)

(assert (=> d!100665 (= c!83493 (bvsge (x!64240 lt!338928) #b01111111111111111111111111111110))))

(declare-fun lt!338995 () (_ BitVec 64))

(assert (=> d!100665 (= lt!338995 (select (arr!20145 a!3186) (index!33350 lt!338928)))))

(assert (=> d!100665 (validMask!0 mask!3328)))

(assert (=> d!100665 (= (seekKeyOrZeroReturnVacant!0 (x!64240 lt!338928) (index!33350 lt!338928) (index!33350 lt!338928) (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338994)))

(declare-fun e!424175 () SeekEntryResult!7745)

(declare-fun b!760888 () Bool)

(assert (=> b!760888 (= e!424175 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64240 lt!338928) #b00000000000000000000000000000001) (nextIndex!0 (index!33350 lt!338928) (x!64240 lt!338928) mask!3328) (index!33350 lt!338928) (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760889 () Bool)

(declare-fun e!424176 () SeekEntryResult!7745)

(assert (=> b!760889 (= e!424176 (Found!7745 (index!33350 lt!338928)))))

(declare-fun b!760890 () Bool)

(assert (=> b!760890 (= e!424177 e!424176)))

(declare-fun c!83494 () Bool)

(assert (=> b!760890 (= c!83494 (= lt!338995 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760891 () Bool)

(declare-fun c!83492 () Bool)

(assert (=> b!760891 (= c!83492 (= lt!338995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760891 (= e!424176 e!424175)))

(declare-fun b!760892 () Bool)

(assert (=> b!760892 (= e!424177 Undefined!7745)))

(declare-fun b!760893 () Bool)

(assert (=> b!760893 (= e!424175 (MissingVacant!7745 (index!33350 lt!338928)))))

(assert (= (and d!100665 c!83493) b!760892))

(assert (= (and d!100665 (not c!83493)) b!760890))

(assert (= (and b!760890 c!83494) b!760889))

(assert (= (and b!760890 (not c!83494)) b!760891))

(assert (= (and b!760891 c!83492) b!760893))

(assert (= (and b!760891 (not c!83492)) b!760888))

(declare-fun m!707997 () Bool)

(assert (=> d!100665 m!707997))

(declare-fun m!707999 () Bool)

(assert (=> d!100665 m!707999))

(assert (=> d!100665 m!707779))

(assert (=> d!100665 m!707437))

(declare-fun m!708001 () Bool)

(assert (=> b!760888 m!708001))

(assert (=> b!760888 m!708001))

(assert (=> b!760888 m!707421))

(declare-fun m!708003 () Bool)

(assert (=> b!760888 m!708003))

(assert (=> b!760709 d!100665))

(declare-fun bm!34954 () Bool)

(declare-fun call!34957 () Bool)

(declare-fun c!83495 () Bool)

(assert (=> bm!34954 (= call!34957 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!83495 (Cons!14143 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!83362 (Cons!14143 (select (arr!20145 a!3186) #b00000000000000000000000000000000) Nil!14144) Nil!14144)) (ite c!83362 (Cons!14143 (select (arr!20145 a!3186) #b00000000000000000000000000000000) Nil!14144) Nil!14144))))))

(declare-fun b!760894 () Bool)

(declare-fun e!424181 () Bool)

(assert (=> b!760894 (= e!424181 (contains!4066 (ite c!83362 (Cons!14143 (select (arr!20145 a!3186) #b00000000000000000000000000000000) Nil!14144) Nil!14144) (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760895 () Bool)

(declare-fun e!424180 () Bool)

(assert (=> b!760895 (= e!424180 call!34957)))

(declare-fun b!760896 () Bool)

(declare-fun e!424179 () Bool)

(assert (=> b!760896 (= e!424179 e!424180)))

(assert (=> b!760896 (= c!83495 (validKeyInArray!0 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760897 () Bool)

(declare-fun e!424178 () Bool)

(assert (=> b!760897 (= e!424178 e!424179)))

(declare-fun res!514671 () Bool)

(assert (=> b!760897 (=> (not res!514671) (not e!424179))))

(assert (=> b!760897 (= res!514671 (not e!424181))))

(declare-fun res!514672 () Bool)

(assert (=> b!760897 (=> (not res!514672) (not e!424181))))

(assert (=> b!760897 (= res!514672 (validKeyInArray!0 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760898 () Bool)

(assert (=> b!760898 (= e!424180 call!34957)))

(declare-fun d!100667 () Bool)

(declare-fun res!514673 () Bool)

(assert (=> d!100667 (=> res!514673 e!424178)))

(assert (=> d!100667 (= res!514673 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(assert (=> d!100667 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83362 (Cons!14143 (select (arr!20145 a!3186) #b00000000000000000000000000000000) Nil!14144) Nil!14144)) e!424178)))

(assert (= (and d!100667 (not res!514673)) b!760897))

(assert (= (and b!760897 res!514672) b!760894))

(assert (= (and b!760897 res!514671) b!760896))

(assert (= (and b!760896 c!83495) b!760895))

(assert (= (and b!760896 (not c!83495)) b!760898))

(assert (= (or b!760895 b!760898) bm!34954))

(assert (=> bm!34954 m!707985))

(declare-fun m!708005 () Bool)

(assert (=> bm!34954 m!708005))

(assert (=> b!760894 m!707985))

(assert (=> b!760894 m!707985))

(declare-fun m!708007 () Bool)

(assert (=> b!760894 m!708007))

(assert (=> b!760896 m!707985))

(assert (=> b!760896 m!707985))

(declare-fun m!708009 () Bool)

(assert (=> b!760896 m!708009))

(assert (=> b!760897 m!707985))

(assert (=> b!760897 m!707985))

(assert (=> b!760897 m!708009))

(assert (=> bm!34935 d!100667))

(declare-fun b!760899 () Bool)

(declare-fun e!424184 () Bool)

(declare-fun e!424182 () Bool)

(assert (=> b!760899 (= e!424184 e!424182)))

(declare-fun lt!338997 () (_ BitVec 64))

(assert (=> b!760899 (= lt!338997 (select (arr!20145 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!338996 () Unit!26330)

(assert (=> b!760899 (= lt!338996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338997 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!760899 (arrayContainsKey!0 a!3186 lt!338997 #b00000000000000000000000000000000)))

(declare-fun lt!338998 () Unit!26330)

(assert (=> b!760899 (= lt!338998 lt!338996)))

(declare-fun res!514674 () Bool)

(assert (=> b!760899 (= res!514674 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7745 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!760899 (=> (not res!514674) (not e!424182))))

(declare-fun call!34958 () Bool)

(declare-fun bm!34955 () Bool)

(assert (=> bm!34955 (= call!34958 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760900 () Bool)

(declare-fun e!424183 () Bool)

(assert (=> b!760900 (= e!424183 e!424184)))

(declare-fun c!83496 () Bool)

(assert (=> b!760900 (= c!83496 (validKeyInArray!0 (select (arr!20145 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun d!100669 () Bool)

(declare-fun res!514675 () Bool)

(assert (=> d!100669 (=> res!514675 e!424183)))

(assert (=> d!100669 (= res!514675 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(assert (=> d!100669 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!424183)))

(declare-fun b!760901 () Bool)

(assert (=> b!760901 (= e!424184 call!34958)))

(declare-fun b!760902 () Bool)

(assert (=> b!760902 (= e!424182 call!34958)))

(assert (= (and d!100669 (not res!514675)) b!760900))

(assert (= (and b!760900 c!83496) b!760899))

(assert (= (and b!760900 (not c!83496)) b!760901))

(assert (= (and b!760899 res!514674) b!760902))

(assert (= (or b!760902 b!760901) bm!34955))

(declare-fun m!708011 () Bool)

(assert (=> b!760899 m!708011))

(declare-fun m!708013 () Bool)

(assert (=> b!760899 m!708013))

(declare-fun m!708015 () Bool)

(assert (=> b!760899 m!708015))

(assert (=> b!760899 m!708011))

(declare-fun m!708017 () Bool)

(assert (=> b!760899 m!708017))

(declare-fun m!708019 () Bool)

(assert (=> bm!34955 m!708019))

(assert (=> b!760900 m!708011))

(assert (=> b!760900 m!708011))

(declare-fun m!708021 () Bool)

(assert (=> b!760900 m!708021))

(assert (=> bm!34945 d!100669))

(declare-fun d!100671 () Bool)

(assert (=> d!100671 (= (validKeyInArray!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20145 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20145 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760486 d!100671))

(assert (=> b!760487 d!100671))

(assert (=> b!760661 d!100573))

(assert (=> d!100505 d!100537))

(declare-fun lt!338999 () SeekEntryResult!7745)

(declare-fun d!100673 () Bool)

(assert (=> d!100673 (and (or (is-Undefined!7745 lt!338999) (not (is-Found!7745 lt!338999)) (and (bvsge (index!33349 lt!338999) #b00000000000000000000000000000000) (bvslt (index!33349 lt!338999) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338999) (is-Found!7745 lt!338999) (not (is-MissingVacant!7745 lt!338999)) (not (= (index!33351 lt!338999) resIntermediateIndex!5)) (and (bvsge (index!33351 lt!338999) #b00000000000000000000000000000000) (bvslt (index!33351 lt!338999) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!338999) (ite (is-Found!7745 lt!338999) (= (select (arr!20145 a!3186) (index!33349 lt!338999)) (select (arr!20145 a!3186) j!159)) (and (is-MissingVacant!7745 lt!338999) (= (index!33351 lt!338999) resIntermediateIndex!5) (= (select (arr!20145 a!3186) (index!33351 lt!338999)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424187 () SeekEntryResult!7745)

(assert (=> d!100673 (= lt!338999 e!424187)))

(declare-fun c!83498 () Bool)

(assert (=> d!100673 (= c!83498 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339000 () (_ BitVec 64))

(assert (=> d!100673 (= lt!339000 (select (arr!20145 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100673 (validMask!0 mask!3328)))

(assert (=> d!100673 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!338999)))

(declare-fun b!760903 () Bool)

(declare-fun e!424185 () SeekEntryResult!7745)

(assert (=> b!760903 (= e!424185 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!424186 () SeekEntryResult!7745)

(declare-fun b!760904 () Bool)

(assert (=> b!760904 (= e!424186 (Found!7745 (nextIndex!0 index!1321 x!1131 mask!3328)))))

(declare-fun b!760905 () Bool)

(assert (=> b!760905 (= e!424187 e!424186)))

(declare-fun c!83499 () Bool)

(assert (=> b!760905 (= c!83499 (= lt!339000 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760906 () Bool)

(declare-fun c!83497 () Bool)

(assert (=> b!760906 (= c!83497 (= lt!339000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760906 (= e!424186 e!424185)))

(declare-fun b!760907 () Bool)

(assert (=> b!760907 (= e!424187 Undefined!7745)))

(declare-fun b!760908 () Bool)

(assert (=> b!760908 (= e!424185 (MissingVacant!7745 resIntermediateIndex!5))))

(assert (= (and d!100673 c!83498) b!760907))

(assert (= (and d!100673 (not c!83498)) b!760905))

(assert (= (and b!760905 c!83499) b!760904))

(assert (= (and b!760905 (not c!83499)) b!760906))

(assert (= (and b!760906 c!83497) b!760908))

(assert (= (and b!760906 (not c!83497)) b!760903))

(declare-fun m!708023 () Bool)

(assert (=> d!100673 m!708023))

(declare-fun m!708025 () Bool)

(assert (=> d!100673 m!708025))

(assert (=> d!100673 m!707597))

(declare-fun m!708027 () Bool)

(assert (=> d!100673 m!708027))

(assert (=> d!100673 m!707437))

(assert (=> b!760903 m!707597))

(declare-fun m!708029 () Bool)

(assert (=> b!760903 m!708029))

(assert (=> b!760903 m!708029))

(assert (=> b!760903 m!707421))

(declare-fun m!708031 () Bool)

(assert (=> b!760903 m!708031))

(assert (=> b!760713 d!100673))

(declare-fun d!100675 () Bool)

(declare-fun lt!339001 () (_ BitVec 32))

(assert (=> d!100675 (and (bvsge lt!339001 #b00000000000000000000000000000000) (bvslt lt!339001 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100675 (= lt!339001 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!100675 (validMask!0 mask!3328)))

(assert (=> d!100675 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!339001)))

(declare-fun bs!21396 () Bool)

(assert (= bs!21396 d!100675))

(declare-fun m!708033 () Bool)

(assert (=> bs!21396 m!708033))

(assert (=> bs!21396 m!707437))

(assert (=> b!760713 d!100675))

(declare-fun d!100677 () Bool)

(assert (=> d!100677 (arrayContainsKey!0 a!3186 lt!338899 #b00000000000000000000000000000000)))

(declare-fun lt!339004 () Unit!26330)

(declare-fun choose!13 (array!42066 (_ BitVec 64) (_ BitVec 32)) Unit!26330)

(assert (=> d!100677 (= lt!339004 (choose!13 a!3186 lt!338899 j!159))))

(assert (=> d!100677 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!100677 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338899 j!159) lt!339004)))

(declare-fun bs!21397 () Bool)

(assert (= bs!21397 d!100677))

(assert (=> bs!21397 m!707745))

(declare-fun m!708035 () Bool)

(assert (=> bs!21397 m!708035))

(assert (=> b!760660 d!100677))

(declare-fun d!100679 () Bool)

(declare-fun res!514676 () Bool)

(declare-fun e!424188 () Bool)

(assert (=> d!100679 (=> res!514676 e!424188)))

(assert (=> d!100679 (= res!514676 (= (select (arr!20145 a!3186) #b00000000000000000000000000000000) lt!338899))))

(assert (=> d!100679 (= (arrayContainsKey!0 a!3186 lt!338899 #b00000000000000000000000000000000) e!424188)))

(declare-fun b!760909 () Bool)

(declare-fun e!424189 () Bool)

(assert (=> b!760909 (= e!424188 e!424189)))

(declare-fun res!514677 () Bool)

(assert (=> b!760909 (=> (not res!514677) (not e!424189))))

(assert (=> b!760909 (= res!514677 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(declare-fun b!760910 () Bool)

(assert (=> b!760910 (= e!424189 (arrayContainsKey!0 a!3186 lt!338899 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100679 (not res!514676)) b!760909))

(assert (= (and b!760909 res!514677) b!760910))

(assert (=> d!100679 m!707635))

(declare-fun m!708037 () Bool)

(assert (=> b!760910 m!708037))

(assert (=> b!760660 d!100679))

(assert (=> b!760660 d!100577))

(declare-fun b!760911 () Bool)

(declare-fun lt!339006 () SeekEntryResult!7745)

(assert (=> b!760911 (and (bvsge (index!33350 lt!339006) #b00000000000000000000000000000000) (bvslt (index!33350 lt!339006) (size!20566 lt!338720)))))

(declare-fun res!514680 () Bool)

(assert (=> b!760911 (= res!514680 (= (select (arr!20145 lt!338720) (index!33350 lt!339006)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424194 () Bool)

(assert (=> b!760911 (=> res!514680 e!424194)))

(declare-fun b!760912 () Bool)

(declare-fun e!424191 () SeekEntryResult!7745)

(assert (=> b!760912 (= e!424191 (Intermediate!7745 true (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760913 () Bool)

(declare-fun e!424192 () Bool)

(declare-fun e!424193 () Bool)

(assert (=> b!760913 (= e!424192 e!424193)))

(declare-fun res!514679 () Bool)

(assert (=> b!760913 (= res!514679 (and (is-Intermediate!7745 lt!339006) (not (undefined!8557 lt!339006)) (bvslt (x!64240 lt!339006) #b01111111111111111111111111111110) (bvsge (x!64240 lt!339006) #b00000000000000000000000000000000) (bvsge (x!64240 lt!339006) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760913 (=> (not res!514679) (not e!424193))))

(declare-fun b!760914 () Bool)

(declare-fun e!424190 () SeekEntryResult!7745)

(assert (=> b!760914 (= e!424190 (Intermediate!7745 false (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760915 () Bool)

(assert (=> b!760915 (and (bvsge (index!33350 lt!339006) #b00000000000000000000000000000000) (bvslt (index!33350 lt!339006) (size!20566 lt!338720)))))

(assert (=> b!760915 (= e!424194 (= (select (arr!20145 lt!338720) (index!33350 lt!339006)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760916 () Bool)

(assert (=> b!760916 (= e!424191 e!424190)))

(declare-fun c!83500 () Bool)

(declare-fun lt!339005 () (_ BitVec 64))

(assert (=> b!760916 (= c!83500 (or (= lt!339005 lt!338719) (= (bvadd lt!339005 lt!339005) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100681 () Bool)

(assert (=> d!100681 e!424192))

(declare-fun c!83502 () Bool)

(assert (=> d!100681 (= c!83502 (and (is-Intermediate!7745 lt!339006) (undefined!8557 lt!339006)))))

(assert (=> d!100681 (= lt!339006 e!424191)))

(declare-fun c!83501 () Bool)

(assert (=> d!100681 (= c!83501 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100681 (= lt!339005 (select (arr!20145 lt!338720) (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100681 (validMask!0 mask!3328)))

(assert (=> d!100681 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338719 lt!338720 mask!3328) lt!339006)))

(declare-fun b!760917 () Bool)

(assert (=> b!760917 (and (bvsge (index!33350 lt!339006) #b00000000000000000000000000000000) (bvslt (index!33350 lt!339006) (size!20566 lt!338720)))))

(declare-fun res!514678 () Bool)

(assert (=> b!760917 (= res!514678 (= (select (arr!20145 lt!338720) (index!33350 lt!339006)) lt!338719))))

(assert (=> b!760917 (=> res!514678 e!424194)))

(assert (=> b!760917 (= e!424193 e!424194)))

(declare-fun b!760918 () Bool)

(assert (=> b!760918 (= e!424192 (bvsge (x!64240 lt!339006) #b01111111111111111111111111111110))))

(declare-fun b!760919 () Bool)

(assert (=> b!760919 (= e!424190 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!338719 lt!338720 mask!3328))))

(assert (= (and d!100681 c!83501) b!760912))

(assert (= (and d!100681 (not c!83501)) b!760916))

(assert (= (and b!760916 c!83500) b!760914))

(assert (= (and b!760916 (not c!83500)) b!760919))

(assert (= (and d!100681 c!83502) b!760918))

(assert (= (and d!100681 (not c!83502)) b!760913))

(assert (= (and b!760913 res!514679) b!760917))

(assert (= (and b!760917 (not res!514678)) b!760911))

(assert (= (and b!760911 (not res!514680)) b!760915))

(assert (=> b!760919 m!707605))

(declare-fun m!708039 () Bool)

(assert (=> b!760919 m!708039))

(assert (=> b!760919 m!708039))

(declare-fun m!708041 () Bool)

(assert (=> b!760919 m!708041))

(declare-fun m!708043 () Bool)

(assert (=> b!760917 m!708043))

(assert (=> b!760915 m!708043))

(assert (=> d!100681 m!707605))

(declare-fun m!708045 () Bool)

(assert (=> d!100681 m!708045))

(assert (=> d!100681 m!707437))

(assert (=> b!760911 m!708043))

(assert (=> b!760434 d!100681))

(declare-fun d!100683 () Bool)

(declare-fun lt!339007 () (_ BitVec 32))

(assert (=> d!100683 (and (bvsge lt!339007 #b00000000000000000000000000000000) (bvslt lt!339007 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100683 (= lt!339007 (choose!52 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100683 (validMask!0 mask!3328)))

(assert (=> d!100683 (= (nextIndex!0 (toIndex!0 lt!338719 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!339007)))

(declare-fun bs!21398 () Bool)

(assert (= bs!21398 d!100683))

(assert (=> bs!21398 m!707431))

(declare-fun m!708047 () Bool)

(assert (=> bs!21398 m!708047))

(assert (=> bs!21398 m!707437))

(assert (=> b!760434 d!100683))

(declare-fun b!760920 () Bool)

(declare-fun e!424197 () Bool)

(declare-fun e!424195 () Bool)

(assert (=> b!760920 (= e!424197 e!424195)))

(declare-fun lt!339009 () (_ BitVec 64))

(assert (=> b!760920 (= lt!339009 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!339008 () Unit!26330)

(assert (=> b!760920 (= lt!339008 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339009 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!760920 (arrayContainsKey!0 a!3186 lt!339009 #b00000000000000000000000000000000)))

(declare-fun lt!339010 () Unit!26330)

(assert (=> b!760920 (= lt!339010 lt!339008)))

(declare-fun res!514681 () Bool)

(assert (=> b!760920 (= res!514681 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7745 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760920 (=> (not res!514681) (not e!424195))))

(declare-fun bm!34956 () Bool)

(declare-fun call!34959 () Bool)

(assert (=> bm!34956 (= call!34959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760921 () Bool)

(declare-fun e!424196 () Bool)

(assert (=> b!760921 (= e!424196 e!424197)))

(declare-fun c!83503 () Bool)

(assert (=> b!760921 (= c!83503 (validKeyInArray!0 (select (arr!20145 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!100685 () Bool)

(declare-fun res!514682 () Bool)

(assert (=> d!100685 (=> res!514682 e!424196)))

(assert (=> d!100685 (= res!514682 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(assert (=> d!100685 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!424196)))

(declare-fun b!760922 () Bool)

(assert (=> b!760922 (= e!424197 call!34959)))

(declare-fun b!760923 () Bool)

(assert (=> b!760923 (= e!424195 call!34959)))

(assert (= (and d!100685 (not res!514682)) b!760921))

(assert (= (and b!760921 c!83503) b!760920))

(assert (= (and b!760921 (not c!83503)) b!760922))

(assert (= (and b!760920 res!514681) b!760923))

(assert (= (or b!760923 b!760922) bm!34956))

(assert (=> b!760920 m!707985))

(declare-fun m!708049 () Bool)

(assert (=> b!760920 m!708049))

(declare-fun m!708051 () Bool)

(assert (=> b!760920 m!708051))

(assert (=> b!760920 m!707985))

(declare-fun m!708053 () Bool)

(assert (=> b!760920 m!708053))

(declare-fun m!708055 () Bool)

(assert (=> bm!34956 m!708055))

(assert (=> b!760921 m!707985))

(assert (=> b!760921 m!707985))

(assert (=> b!760921 m!708009))

(assert (=> bm!34947 d!100685))

(declare-fun lt!339011 () SeekEntryResult!7745)

(declare-fun d!100687 () Bool)

(assert (=> d!100687 (and (or (is-Undefined!7745 lt!339011) (not (is-Found!7745 lt!339011)) (and (bvsge (index!33349 lt!339011) #b00000000000000000000000000000000) (bvslt (index!33349 lt!339011) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339011) (is-Found!7745 lt!339011) (not (is-MissingVacant!7745 lt!339011)) (not (= (index!33351 lt!339011) resIntermediateIndex!5)) (and (bvsge (index!33351 lt!339011) #b00000000000000000000000000000000) (bvslt (index!33351 lt!339011) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339011) (ite (is-Found!7745 lt!339011) (= (select (arr!20145 a!3186) (index!33349 lt!339011)) (select (arr!20145 a!3186) j!159)) (and (is-MissingVacant!7745 lt!339011) (= (index!33351 lt!339011) resIntermediateIndex!5) (= (select (arr!20145 a!3186) (index!33351 lt!339011)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424200 () SeekEntryResult!7745)

(assert (=> d!100687 (= lt!339011 e!424200)))

(declare-fun c!83505 () Bool)

(assert (=> d!100687 (= c!83505 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339012 () (_ BitVec 64))

(assert (=> d!100687 (= lt!339012 (select (arr!20145 a!3186) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (=> d!100687 (validMask!0 mask!3328)))

(assert (=> d!100687 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328) lt!339011)))

(declare-fun b!760924 () Bool)

(declare-fun e!424198 () SeekEntryResult!7745)

(assert (=> b!760924 (= e!424198 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20145 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!424199 () SeekEntryResult!7745)

(declare-fun b!760925 () Bool)

(assert (=> b!760925 (= e!424199 (Found!7745 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(declare-fun b!760926 () Bool)

(assert (=> b!760926 (= e!424200 e!424199)))

(declare-fun c!83506 () Bool)

(assert (=> b!760926 (= c!83506 (= lt!339012 (select (arr!20145 a!3186) j!159)))))

(declare-fun b!760927 () Bool)

(declare-fun c!83504 () Bool)

(assert (=> b!760927 (= c!83504 (= lt!339012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760927 (= e!424199 e!424198)))

(declare-fun b!760928 () Bool)

(assert (=> b!760928 (= e!424200 Undefined!7745)))

(declare-fun b!760929 () Bool)

(assert (=> b!760929 (= e!424198 (MissingVacant!7745 resIntermediateIndex!5))))

(assert (= (and d!100687 c!83505) b!760928))

(assert (= (and d!100687 (not c!83505)) b!760926))

(assert (= (and b!760926 c!83506) b!760925))

(assert (= (and b!760926 (not c!83506)) b!760927))

(assert (= (and b!760927 c!83504) b!760929))

(assert (= (and b!760927 (not c!83504)) b!760924))

(declare-fun m!708057 () Bool)

(assert (=> d!100687 m!708057))

(declare-fun m!708059 () Bool)

(assert (=> d!100687 m!708059))

(assert (=> d!100687 m!707691))

(declare-fun m!708061 () Bool)

(assert (=> d!100687 m!708061))

(assert (=> d!100687 m!707437))

(assert (=> b!760924 m!707691))

(declare-fun m!708063 () Bool)

(assert (=> b!760924 m!708063))

(assert (=> b!760924 m!708063))

(assert (=> b!760924 m!707421))

(declare-fun m!708065 () Bool)

(assert (=> b!760924 m!708065))

(assert (=> b!760583 d!100687))

(declare-fun d!100689 () Bool)

(declare-fun lt!339013 () (_ BitVec 32))

(assert (=> d!100689 (and (bvsge lt!339013 #b00000000000000000000000000000000) (bvslt lt!339013 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100689 (= lt!339013 (choose!52 resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(assert (=> d!100689 (validMask!0 mask!3328)))

(assert (=> d!100689 (= (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) lt!339013)))

(declare-fun bs!21399 () Bool)

(assert (= bs!21399 d!100689))

(declare-fun m!708067 () Bool)

(assert (=> bs!21399 m!708067))

(assert (=> bs!21399 m!707437))

(assert (=> b!760583 d!100689))

(assert (=> d!100517 d!100537))

(assert (=> b!760720 d!100671))

(declare-fun d!100691 () Bool)

(assert (=> d!100691 (arrayContainsKey!0 a!3186 lt!338933 #b00000000000000000000000000000000)))

(declare-fun lt!339014 () Unit!26330)

(assert (=> d!100691 (= lt!339014 (choose!13 a!3186 lt!338933 #b00000000000000000000000000000000))))

(assert (=> d!100691 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!100691 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338933 #b00000000000000000000000000000000) lt!339014)))

(declare-fun bs!21400 () Bool)

(assert (= bs!21400 d!100691))

(assert (=> bs!21400 m!707797))

(declare-fun m!708069 () Bool)

(assert (=> bs!21400 m!708069))

(assert (=> b!760719 d!100691))

(declare-fun d!100693 () Bool)

(declare-fun res!514683 () Bool)

(declare-fun e!424201 () Bool)

(assert (=> d!100693 (=> res!514683 e!424201)))

(assert (=> d!100693 (= res!514683 (= (select (arr!20145 a!3186) #b00000000000000000000000000000000) lt!338933))))

(assert (=> d!100693 (= (arrayContainsKey!0 a!3186 lt!338933 #b00000000000000000000000000000000) e!424201)))

(declare-fun b!760930 () Bool)

(declare-fun e!424202 () Bool)

(assert (=> b!760930 (= e!424201 e!424202)))

(declare-fun res!514684 () Bool)

(assert (=> b!760930 (=> (not res!514684) (not e!424202))))

(assert (=> b!760930 (= res!514684 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(declare-fun b!760931 () Bool)

(assert (=> b!760931 (= e!424202 (arrayContainsKey!0 a!3186 lt!338933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100693 (not res!514683)) b!760930))

(assert (= (and b!760930 res!514684) b!760931))

(assert (=> d!100693 m!707635))

(declare-fun m!708071 () Bool)

(assert (=> b!760931 m!708071))

(assert (=> b!760719 d!100693))

(declare-fun b!760932 () Bool)

(declare-fun e!424205 () SeekEntryResult!7745)

(assert (=> b!760932 (= e!424205 Undefined!7745)))

(declare-fun b!760933 () Bool)

(declare-fun e!424203 () SeekEntryResult!7745)

(assert (=> b!760933 (= e!424205 e!424203)))

(declare-fun lt!339015 () (_ BitVec 64))

(declare-fun lt!339016 () SeekEntryResult!7745)

(assert (=> b!760933 (= lt!339015 (select (arr!20145 a!3186) (index!33350 lt!339016)))))

(declare-fun c!83507 () Bool)

(assert (=> b!760933 (= c!83507 (= lt!339015 (select (arr!20145 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!424204 () SeekEntryResult!7745)

(declare-fun b!760934 () Bool)

(assert (=> b!760934 (= e!424204 (seekKeyOrZeroReturnVacant!0 (x!64240 lt!339016) (index!33350 lt!339016) (index!33350 lt!339016) (select (arr!20145 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!760936 () Bool)

(assert (=> b!760936 (= e!424203 (Found!7745 (index!33350 lt!339016)))))

(declare-fun b!760937 () Bool)

(assert (=> b!760937 (= e!424204 (MissingZero!7745 (index!33350 lt!339016)))))

(declare-fun b!760935 () Bool)

(declare-fun c!83509 () Bool)

(assert (=> b!760935 (= c!83509 (= lt!339015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760935 (= e!424203 e!424204)))

(declare-fun d!100695 () Bool)

(declare-fun lt!339017 () SeekEntryResult!7745)

(assert (=> d!100695 (and (or (is-Undefined!7745 lt!339017) (not (is-Found!7745 lt!339017)) (and (bvsge (index!33349 lt!339017) #b00000000000000000000000000000000) (bvslt (index!33349 lt!339017) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339017) (is-Found!7745 lt!339017) (not (is-MissingZero!7745 lt!339017)) (and (bvsge (index!33348 lt!339017) #b00000000000000000000000000000000) (bvslt (index!33348 lt!339017) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339017) (is-Found!7745 lt!339017) (is-MissingZero!7745 lt!339017) (not (is-MissingVacant!7745 lt!339017)) (and (bvsge (index!33351 lt!339017) #b00000000000000000000000000000000) (bvslt (index!33351 lt!339017) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339017) (ite (is-Found!7745 lt!339017) (= (select (arr!20145 a!3186) (index!33349 lt!339017)) (select (arr!20145 a!3186) #b00000000000000000000000000000000)) (ite (is-MissingZero!7745 lt!339017) (= (select (arr!20145 a!3186) (index!33348 lt!339017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7745 lt!339017) (= (select (arr!20145 a!3186) (index!33351 lt!339017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100695 (= lt!339017 e!424205)))

(declare-fun c!83508 () Bool)

(assert (=> d!100695 (= c!83508 (and (is-Intermediate!7745 lt!339016) (undefined!8557 lt!339016)))))

(assert (=> d!100695 (= lt!339016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20145 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!100695 (validMask!0 mask!3328)))

(assert (=> d!100695 (= (seekEntryOrOpen!0 (select (arr!20145 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!339017)))

(assert (= (and d!100695 c!83508) b!760932))

(assert (= (and d!100695 (not c!83508)) b!760933))

(assert (= (and b!760933 c!83507) b!760936))

(assert (= (and b!760933 (not c!83507)) b!760935))

(assert (= (and b!760935 c!83509) b!760937))

(assert (= (and b!760935 (not c!83509)) b!760934))

(declare-fun m!708073 () Bool)

(assert (=> b!760933 m!708073))

(assert (=> b!760934 m!707635))

(declare-fun m!708075 () Bool)

(assert (=> b!760934 m!708075))

(declare-fun m!708077 () Bool)

(assert (=> d!100695 m!708077))

(declare-fun m!708079 () Bool)

(assert (=> d!100695 m!708079))

(declare-fun m!708081 () Bool)

(assert (=> d!100695 m!708081))

(assert (=> d!100695 m!707635))

(declare-fun m!708083 () Bool)

(assert (=> d!100695 m!708083))

(declare-fun m!708085 () Bool)

(assert (=> d!100695 m!708085))

(assert (=> d!100695 m!707635))

(assert (=> d!100695 m!708081))

(assert (=> d!100695 m!707437))

(assert (=> b!760719 d!100695))

(declare-fun lt!339018 () SeekEntryResult!7745)

(declare-fun d!100697 () Bool)

(assert (=> d!100697 (and (or (is-Undefined!7745 lt!339018) (not (is-Found!7745 lt!339018)) (and (bvsge (index!33349 lt!339018) #b00000000000000000000000000000000) (bvslt (index!33349 lt!339018) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339018) (is-Found!7745 lt!339018) (not (is-MissingVacant!7745 lt!339018)) (not (= (index!33351 lt!339018) (index!33350 lt!338936))) (and (bvsge (index!33351 lt!339018) #b00000000000000000000000000000000) (bvslt (index!33351 lt!339018) (size!20566 a!3186)))) (or (is-Undefined!7745 lt!339018) (ite (is-Found!7745 lt!339018) (= (select (arr!20145 a!3186) (index!33349 lt!339018)) k!2102) (and (is-MissingVacant!7745 lt!339018) (= (index!33351 lt!339018) (index!33350 lt!338936)) (= (select (arr!20145 a!3186) (index!33351 lt!339018)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424208 () SeekEntryResult!7745)

(assert (=> d!100697 (= lt!339018 e!424208)))

(declare-fun c!83511 () Bool)

(assert (=> d!100697 (= c!83511 (bvsge (x!64240 lt!338936) #b01111111111111111111111111111110))))

(declare-fun lt!339019 () (_ BitVec 64))

(assert (=> d!100697 (= lt!339019 (select (arr!20145 a!3186) (index!33350 lt!338936)))))

(assert (=> d!100697 (validMask!0 mask!3328)))

(assert (=> d!100697 (= (seekKeyOrZeroReturnVacant!0 (x!64240 lt!338936) (index!33350 lt!338936) (index!33350 lt!338936) k!2102 a!3186 mask!3328) lt!339018)))

(declare-fun b!760938 () Bool)

(declare-fun e!424206 () SeekEntryResult!7745)

(assert (=> b!760938 (= e!424206 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64240 lt!338936) #b00000000000000000000000000000001) (nextIndex!0 (index!33350 lt!338936) (x!64240 lt!338936) mask!3328) (index!33350 lt!338936) k!2102 a!3186 mask!3328))))

(declare-fun b!760939 () Bool)

(declare-fun e!424207 () SeekEntryResult!7745)

