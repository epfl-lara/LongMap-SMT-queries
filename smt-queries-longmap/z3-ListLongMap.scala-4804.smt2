; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66012 () Bool)

(assert start!66012)

(declare-fun b!760401 () Bool)

(declare-fun e!423945 () Bool)

(declare-fun e!423942 () Bool)

(assert (=> b!760401 (= e!423945 e!423942)))

(declare-fun res!514442 () Bool)

(assert (=> b!760401 (=> (not res!514442) (not e!423942))))

(declare-datatypes ((SeekEntryResult!7693 0))(
  ( (MissingZero!7693 (index!33140 (_ BitVec 32))) (Found!7693 (index!33141 (_ BitVec 32))) (Intermediate!7693 (undefined!8505 Bool) (index!33142 (_ BitVec 32)) (x!64183 (_ BitVec 32))) (Undefined!7693) (MissingVacant!7693 (index!33143 (_ BitVec 32))) )
))
(declare-fun lt!338802 () SeekEntryResult!7693)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!760401 (= res!514442 (or (= lt!338802 (MissingZero!7693 i!1173)) (= lt!338802 (MissingVacant!7693 i!1173))))))

(declare-datatypes ((array!42055 0))(
  ( (array!42056 (arr!20137 (Array (_ BitVec 32) (_ BitVec 64))) (size!20557 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42055)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!760401 (= lt!338802 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!760402 () Bool)

(declare-fun e!423947 () Bool)

(declare-fun e!423943 () Bool)

(assert (=> b!760402 (= e!423947 e!423943)))

(declare-fun res!514448 () Bool)

(assert (=> b!760402 (=> (not res!514448) (not e!423943))))

(declare-fun lt!338797 () SeekEntryResult!7693)

(declare-fun lt!338796 () SeekEntryResult!7693)

(assert (=> b!760402 (= res!514448 (= lt!338797 lt!338796))))

(declare-fun lt!338798 () array!42055)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!338800 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!760402 (= lt!338796 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338800 lt!338798 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760402 (= lt!338797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338800 mask!3328) lt!338800 lt!338798 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!760402 (= lt!338800 (select (store (arr!20137 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760402 (= lt!338798 (array!42056 (store (arr!20137 a!3186) i!1173 k0!2102) (size!20557 a!3186)))))

(declare-fun b!760403 () Bool)

(declare-fun res!514441 () Bool)

(assert (=> b!760403 (=> (not res!514441) (not e!423942))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760403 (= res!514441 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20557 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20557 a!3186))))))

(declare-fun b!760404 () Bool)

(declare-fun res!514438 () Bool)

(assert (=> b!760404 (=> (not res!514438) (not e!423945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760404 (= res!514438 (validKeyInArray!0 (select (arr!20137 a!3186) j!159)))))

(declare-fun e!423944 () Bool)

(declare-fun lt!338795 () SeekEntryResult!7693)

(declare-fun b!760405 () Bool)

(assert (=> b!760405 (= e!423944 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338795))))

(declare-fun b!760406 () Bool)

(declare-fun res!514446 () Bool)

(assert (=> b!760406 (=> (not res!514446) (not e!423947))))

(assert (=> b!760406 (= res!514446 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20137 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760407 () Bool)

(declare-fun lt!338799 () SeekEntryResult!7693)

(declare-fun e!423946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!760407 (= e!423946 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338799))))

(declare-fun b!760408 () Bool)

(declare-fun res!514450 () Bool)

(assert (=> b!760408 (=> (not res!514450) (not e!423942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42055 (_ BitVec 32)) Bool)

(assert (=> b!760408 (= res!514450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760409 () Bool)

(assert (=> b!760409 (= e!423942 e!423947)))

(declare-fun res!514449 () Bool)

(assert (=> b!760409 (=> (not res!514449) (not e!423947))))

(assert (=> b!760409 (= res!514449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338795))))

(assert (=> b!760409 (= lt!338795 (Intermediate!7693 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!760410 () Bool)

(declare-fun res!514444 () Bool)

(assert (=> b!760410 (=> (not res!514444) (not e!423942))))

(declare-datatypes ((List!14046 0))(
  ( (Nil!14043) (Cons!14042 (h!15120 (_ BitVec 64)) (t!20353 List!14046)) )
))
(declare-fun arrayNoDuplicates!0 (array!42055 (_ BitVec 32) List!14046) Bool)

(assert (=> b!760410 (= res!514444 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14043))))

(declare-fun b!760412 () Bool)

(assert (=> b!760412 (= e!423944 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) (Found!7693 j!159)))))

(declare-fun b!760413 () Bool)

(declare-fun res!514437 () Bool)

(assert (=> b!760413 (=> (not res!514437) (not e!423945))))

(assert (=> b!760413 (= res!514437 (validKeyInArray!0 k0!2102))))

(declare-fun b!760414 () Bool)

(declare-fun res!514445 () Bool)

(assert (=> b!760414 (=> (not res!514445) (not e!423945))))

(declare-fun arrayContainsKey!0 (array!42055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760414 (= res!514445 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760415 () Bool)

(declare-fun res!514447 () Bool)

(assert (=> b!760415 (=> (not res!514447) (not e!423945))))

(assert (=> b!760415 (= res!514447 (and (= (size!20557 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20557 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20557 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!514440 () Bool)

(assert (=> start!66012 (=> (not res!514440) (not e!423945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66012 (= res!514440 (validMask!0 mask!3328))))

(assert (=> start!66012 e!423945))

(assert (=> start!66012 true))

(declare-fun array_inv!15996 (array!42055) Bool)

(assert (=> start!66012 (array_inv!15996 a!3186)))

(declare-fun b!760411 () Bool)

(declare-fun res!514443 () Bool)

(assert (=> b!760411 (=> (not res!514443) (not e!423947))))

(assert (=> b!760411 (= res!514443 e!423944)))

(declare-fun c!83366 () Bool)

(assert (=> b!760411 (= c!83366 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760416 () Bool)

(get-info :version)

(assert (=> b!760416 (= e!423943 (not (or (not ((_ is Intermediate!7693) lt!338796)) (bvslt x!1131 (x!64183 lt!338796)) (= x!1131 (x!64183 lt!338796)))))))

(declare-fun e!423948 () Bool)

(assert (=> b!760416 e!423948))

(declare-fun res!514439 () Bool)

(assert (=> b!760416 (=> (not res!514439) (not e!423948))))

(assert (=> b!760416 (= res!514439 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26305 0))(
  ( (Unit!26306) )
))
(declare-fun lt!338801 () Unit!26305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26305)

(assert (=> b!760416 (= lt!338801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760417 () Bool)

(assert (=> b!760417 (= e!423948 e!423946)))

(declare-fun res!514436 () Bool)

(assert (=> b!760417 (=> (not res!514436) (not e!423946))))

(assert (=> b!760417 (= res!514436 (= (seekEntryOrOpen!0 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338799))))

(assert (=> b!760417 (= lt!338799 (Found!7693 j!159))))

(assert (= (and start!66012 res!514440) b!760415))

(assert (= (and b!760415 res!514447) b!760404))

(assert (= (and b!760404 res!514438) b!760413))

(assert (= (and b!760413 res!514437) b!760414))

(assert (= (and b!760414 res!514445) b!760401))

(assert (= (and b!760401 res!514442) b!760408))

(assert (= (and b!760408 res!514450) b!760410))

(assert (= (and b!760410 res!514444) b!760403))

(assert (= (and b!760403 res!514441) b!760409))

(assert (= (and b!760409 res!514449) b!760406))

(assert (= (and b!760406 res!514446) b!760411))

(assert (= (and b!760411 c!83366) b!760405))

(assert (= (and b!760411 (not c!83366)) b!760412))

(assert (= (and b!760411 res!514443) b!760402))

(assert (= (and b!760402 res!514448) b!760416))

(assert (= (and b!760416 res!514439) b!760417))

(assert (= (and b!760417 res!514436) b!760407))

(declare-fun m!708153 () Bool)

(assert (=> b!760414 m!708153))

(declare-fun m!708155 () Bool)

(assert (=> b!760401 m!708155))

(declare-fun m!708157 () Bool)

(assert (=> b!760410 m!708157))

(declare-fun m!708159 () Bool)

(assert (=> b!760413 m!708159))

(declare-fun m!708161 () Bool)

(assert (=> b!760407 m!708161))

(assert (=> b!760407 m!708161))

(declare-fun m!708163 () Bool)

(assert (=> b!760407 m!708163))

(assert (=> b!760404 m!708161))

(assert (=> b!760404 m!708161))

(declare-fun m!708165 () Bool)

(assert (=> b!760404 m!708165))

(assert (=> b!760409 m!708161))

(assert (=> b!760409 m!708161))

(declare-fun m!708167 () Bool)

(assert (=> b!760409 m!708167))

(assert (=> b!760409 m!708167))

(assert (=> b!760409 m!708161))

(declare-fun m!708169 () Bool)

(assert (=> b!760409 m!708169))

(assert (=> b!760405 m!708161))

(assert (=> b!760405 m!708161))

(declare-fun m!708171 () Bool)

(assert (=> b!760405 m!708171))

(assert (=> b!760417 m!708161))

(assert (=> b!760417 m!708161))

(declare-fun m!708173 () Bool)

(assert (=> b!760417 m!708173))

(declare-fun m!708175 () Bool)

(assert (=> b!760408 m!708175))

(declare-fun m!708177 () Bool)

(assert (=> b!760406 m!708177))

(declare-fun m!708179 () Bool)

(assert (=> b!760402 m!708179))

(declare-fun m!708181 () Bool)

(assert (=> b!760402 m!708181))

(declare-fun m!708183 () Bool)

(assert (=> b!760402 m!708183))

(declare-fun m!708185 () Bool)

(assert (=> b!760402 m!708185))

(assert (=> b!760402 m!708179))

(declare-fun m!708187 () Bool)

(assert (=> b!760402 m!708187))

(declare-fun m!708189 () Bool)

(assert (=> start!66012 m!708189))

(declare-fun m!708191 () Bool)

(assert (=> start!66012 m!708191))

(declare-fun m!708193 () Bool)

(assert (=> b!760416 m!708193))

(declare-fun m!708195 () Bool)

(assert (=> b!760416 m!708195))

(assert (=> b!760412 m!708161))

(assert (=> b!760412 m!708161))

(declare-fun m!708197 () Bool)

(assert (=> b!760412 m!708197))

(check-sat (not b!760412) (not b!760416) (not b!760405) (not b!760407) (not b!760404) (not b!760417) (not b!760413) (not b!760401) (not b!760408) (not b!760402) (not b!760410) (not b!760414) (not start!66012) (not b!760409))
(check-sat)
(get-model)

(declare-fun b!760531 () Bool)

(declare-fun e!424008 () Bool)

(declare-fun contains!4043 (List!14046 (_ BitVec 64)) Bool)

(assert (=> b!760531 (= e!424008 (contains!4043 Nil!14043 (select (arr!20137 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760532 () Bool)

(declare-fun e!424006 () Bool)

(declare-fun e!424007 () Bool)

(assert (=> b!760532 (= e!424006 e!424007)))

(declare-fun res!514548 () Bool)

(assert (=> b!760532 (=> (not res!514548) (not e!424007))))

(assert (=> b!760532 (= res!514548 (not e!424008))))

(declare-fun res!514547 () Bool)

(assert (=> b!760532 (=> (not res!514547) (not e!424008))))

(assert (=> b!760532 (= res!514547 (validKeyInArray!0 (select (arr!20137 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760533 () Bool)

(declare-fun e!424005 () Bool)

(assert (=> b!760533 (= e!424007 e!424005)))

(declare-fun c!83375 () Bool)

(assert (=> b!760533 (= c!83375 (validKeyInArray!0 (select (arr!20137 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34941 () Bool)

(declare-fun call!34944 () Bool)

(assert (=> bm!34941 (= call!34944 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83375 (Cons!14042 (select (arr!20137 a!3186) #b00000000000000000000000000000000) Nil!14043) Nil!14043)))))

(declare-fun b!760534 () Bool)

(assert (=> b!760534 (= e!424005 call!34944)))

(declare-fun b!760530 () Bool)

(assert (=> b!760530 (= e!424005 call!34944)))

(declare-fun d!100677 () Bool)

(declare-fun res!514549 () Bool)

(assert (=> d!100677 (=> res!514549 e!424006)))

(assert (=> d!100677 (= res!514549 (bvsge #b00000000000000000000000000000000 (size!20557 a!3186)))))

(assert (=> d!100677 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14043) e!424006)))

(assert (= (and d!100677 (not res!514549)) b!760532))

(assert (= (and b!760532 res!514547) b!760531))

(assert (= (and b!760532 res!514548) b!760533))

(assert (= (and b!760533 c!83375) b!760534))

(assert (= (and b!760533 (not c!83375)) b!760530))

(assert (= (or b!760534 b!760530) bm!34941))

(declare-fun m!708291 () Bool)

(assert (=> b!760531 m!708291))

(assert (=> b!760531 m!708291))

(declare-fun m!708293 () Bool)

(assert (=> b!760531 m!708293))

(assert (=> b!760532 m!708291))

(assert (=> b!760532 m!708291))

(declare-fun m!708295 () Bool)

(assert (=> b!760532 m!708295))

(assert (=> b!760533 m!708291))

(assert (=> b!760533 m!708291))

(assert (=> b!760533 m!708295))

(assert (=> bm!34941 m!708291))

(declare-fun m!708297 () Bool)

(assert (=> bm!34941 m!708297))

(assert (=> b!760410 d!100677))

(declare-fun b!760553 () Bool)

(declare-fun e!424020 () SeekEntryResult!7693)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760553 (= e!424020 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760554 () Bool)

(declare-fun lt!338856 () SeekEntryResult!7693)

(assert (=> b!760554 (and (bvsge (index!33142 lt!338856) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338856) (size!20557 a!3186)))))

(declare-fun res!514556 () Bool)

(assert (=> b!760554 (= res!514556 (= (select (arr!20137 a!3186) (index!33142 lt!338856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424021 () Bool)

(assert (=> b!760554 (=> res!514556 e!424021)))

(declare-fun b!760555 () Bool)

(assert (=> b!760555 (= e!424020 (Intermediate!7693 false (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!100679 () Bool)

(declare-fun e!424019 () Bool)

(assert (=> d!100679 e!424019))

(declare-fun c!83382 () Bool)

(assert (=> d!100679 (= c!83382 (and ((_ is Intermediate!7693) lt!338856) (undefined!8505 lt!338856)))))

(declare-fun e!424023 () SeekEntryResult!7693)

(assert (=> d!100679 (= lt!338856 e!424023)))

(declare-fun c!83383 () Bool)

(assert (=> d!100679 (= c!83383 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338855 () (_ BitVec 64))

(assert (=> d!100679 (= lt!338855 (select (arr!20137 a!3186) (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328)))))

(assert (=> d!100679 (validMask!0 mask!3328)))

(assert (=> d!100679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338856)))

(declare-fun b!760556 () Bool)

(declare-fun e!424022 () Bool)

(assert (=> b!760556 (= e!424019 e!424022)))

(declare-fun res!514558 () Bool)

(assert (=> b!760556 (= res!514558 (and ((_ is Intermediate!7693) lt!338856) (not (undefined!8505 lt!338856)) (bvslt (x!64183 lt!338856) #b01111111111111111111111111111110) (bvsge (x!64183 lt!338856) #b00000000000000000000000000000000) (bvsge (x!64183 lt!338856) #b00000000000000000000000000000000)))))

(assert (=> b!760556 (=> (not res!514558) (not e!424022))))

(declare-fun b!760557 () Bool)

(assert (=> b!760557 (= e!424023 e!424020)))

(declare-fun c!83384 () Bool)

(assert (=> b!760557 (= c!83384 (or (= lt!338855 (select (arr!20137 a!3186) j!159)) (= (bvadd lt!338855 lt!338855) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760558 () Bool)

(assert (=> b!760558 (and (bvsge (index!33142 lt!338856) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338856) (size!20557 a!3186)))))

(declare-fun res!514557 () Bool)

(assert (=> b!760558 (= res!514557 (= (select (arr!20137 a!3186) (index!33142 lt!338856)) (select (arr!20137 a!3186) j!159)))))

(assert (=> b!760558 (=> res!514557 e!424021)))

(assert (=> b!760558 (= e!424022 e!424021)))

(declare-fun b!760559 () Bool)

(assert (=> b!760559 (= e!424019 (bvsge (x!64183 lt!338856) #b01111111111111111111111111111110))))

(declare-fun b!760560 () Bool)

(assert (=> b!760560 (= e!424023 (Intermediate!7693 true (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760561 () Bool)

(assert (=> b!760561 (and (bvsge (index!33142 lt!338856) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338856) (size!20557 a!3186)))))

(assert (=> b!760561 (= e!424021 (= (select (arr!20137 a!3186) (index!33142 lt!338856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100679 c!83383) b!760560))

(assert (= (and d!100679 (not c!83383)) b!760557))

(assert (= (and b!760557 c!83384) b!760555))

(assert (= (and b!760557 (not c!83384)) b!760553))

(assert (= (and d!100679 c!83382) b!760559))

(assert (= (and d!100679 (not c!83382)) b!760556))

(assert (= (and b!760556 res!514558) b!760558))

(assert (= (and b!760558 (not res!514557)) b!760554))

(assert (= (and b!760554 (not res!514556)) b!760561))

(declare-fun m!708299 () Bool)

(assert (=> b!760558 m!708299))

(assert (=> b!760554 m!708299))

(assert (=> b!760553 m!708167))

(declare-fun m!708301 () Bool)

(assert (=> b!760553 m!708301))

(assert (=> b!760553 m!708301))

(assert (=> b!760553 m!708161))

(declare-fun m!708303 () Bool)

(assert (=> b!760553 m!708303))

(assert (=> b!760561 m!708299))

(assert (=> d!100679 m!708167))

(declare-fun m!708305 () Bool)

(assert (=> d!100679 m!708305))

(assert (=> d!100679 m!708189))

(assert (=> b!760409 d!100679))

(declare-fun d!100681 () Bool)

(declare-fun lt!338862 () (_ BitVec 32))

(declare-fun lt!338861 () (_ BitVec 32))

(assert (=> d!100681 (= lt!338862 (bvmul (bvxor lt!338861 (bvlshr lt!338861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100681 (= lt!338861 ((_ extract 31 0) (bvand (bvxor (select (arr!20137 a!3186) j!159) (bvlshr (select (arr!20137 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100681 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514559 (let ((h!15123 ((_ extract 31 0) (bvand (bvxor (select (arr!20137 a!3186) j!159) (bvlshr (select (arr!20137 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64187 (bvmul (bvxor h!15123 (bvlshr h!15123 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64187 (bvlshr x!64187 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514559 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514559 #b00000000000000000000000000000000))))))

(assert (=> d!100681 (= (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (bvand (bvxor lt!338862 (bvlshr lt!338862 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760409 d!100681))

(declare-fun b!760570 () Bool)

(declare-fun e!424030 () Bool)

(declare-fun e!424031 () Bool)

(assert (=> b!760570 (= e!424030 e!424031)))

(declare-fun c!83387 () Bool)

(assert (=> b!760570 (= c!83387 (validKeyInArray!0 (select (arr!20137 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760571 () Bool)

(declare-fun e!424032 () Bool)

(assert (=> b!760571 (= e!424031 e!424032)))

(declare-fun lt!338869 () (_ BitVec 64))

(assert (=> b!760571 (= lt!338869 (select (arr!20137 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338871 () Unit!26305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42055 (_ BitVec 64) (_ BitVec 32)) Unit!26305)

(assert (=> b!760571 (= lt!338871 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338869 #b00000000000000000000000000000000))))

(assert (=> b!760571 (arrayContainsKey!0 a!3186 lt!338869 #b00000000000000000000000000000000)))

(declare-fun lt!338870 () Unit!26305)

(assert (=> b!760571 (= lt!338870 lt!338871)))

(declare-fun res!514565 () Bool)

(assert (=> b!760571 (= res!514565 (= (seekEntryOrOpen!0 (select (arr!20137 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7693 #b00000000000000000000000000000000)))))

(assert (=> b!760571 (=> (not res!514565) (not e!424032))))

(declare-fun b!760572 () Bool)

(declare-fun call!34947 () Bool)

(assert (=> b!760572 (= e!424032 call!34947)))

(declare-fun d!100685 () Bool)

(declare-fun res!514564 () Bool)

(assert (=> d!100685 (=> res!514564 e!424030)))

(assert (=> d!100685 (= res!514564 (bvsge #b00000000000000000000000000000000 (size!20557 a!3186)))))

(assert (=> d!100685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424030)))

(declare-fun b!760573 () Bool)

(assert (=> b!760573 (= e!424031 call!34947)))

(declare-fun bm!34944 () Bool)

(assert (=> bm!34944 (= call!34947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100685 (not res!514564)) b!760570))

(assert (= (and b!760570 c!83387) b!760571))

(assert (= (and b!760570 (not c!83387)) b!760573))

(assert (= (and b!760571 res!514565) b!760572))

(assert (= (or b!760572 b!760573) bm!34944))

(assert (=> b!760570 m!708291))

(assert (=> b!760570 m!708291))

(assert (=> b!760570 m!708295))

(assert (=> b!760571 m!708291))

(declare-fun m!708307 () Bool)

(assert (=> b!760571 m!708307))

(declare-fun m!708309 () Bool)

(assert (=> b!760571 m!708309))

(assert (=> b!760571 m!708291))

(declare-fun m!708311 () Bool)

(assert (=> b!760571 m!708311))

(declare-fun m!708313 () Bool)

(assert (=> bm!34944 m!708313))

(assert (=> b!760408 d!100685))

(declare-fun b!760574 () Bool)

(declare-fun e!424034 () SeekEntryResult!7693)

(assert (=> b!760574 (= e!424034 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!338800 lt!338798 mask!3328))))

(declare-fun b!760575 () Bool)

(declare-fun lt!338873 () SeekEntryResult!7693)

(assert (=> b!760575 (and (bvsge (index!33142 lt!338873) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338873) (size!20557 lt!338798)))))

(declare-fun res!514566 () Bool)

(assert (=> b!760575 (= res!514566 (= (select (arr!20137 lt!338798) (index!33142 lt!338873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424035 () Bool)

(assert (=> b!760575 (=> res!514566 e!424035)))

(declare-fun b!760576 () Bool)

(assert (=> b!760576 (= e!424034 (Intermediate!7693 false index!1321 x!1131))))

(declare-fun d!100693 () Bool)

(declare-fun e!424033 () Bool)

(assert (=> d!100693 e!424033))

(declare-fun c!83388 () Bool)

(assert (=> d!100693 (= c!83388 (and ((_ is Intermediate!7693) lt!338873) (undefined!8505 lt!338873)))))

(declare-fun e!424037 () SeekEntryResult!7693)

(assert (=> d!100693 (= lt!338873 e!424037)))

(declare-fun c!83389 () Bool)

(assert (=> d!100693 (= c!83389 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338872 () (_ BitVec 64))

(assert (=> d!100693 (= lt!338872 (select (arr!20137 lt!338798) index!1321))))

(assert (=> d!100693 (validMask!0 mask!3328)))

(assert (=> d!100693 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338800 lt!338798 mask!3328) lt!338873)))

(declare-fun b!760577 () Bool)

(declare-fun e!424036 () Bool)

(assert (=> b!760577 (= e!424033 e!424036)))

(declare-fun res!514568 () Bool)

(assert (=> b!760577 (= res!514568 (and ((_ is Intermediate!7693) lt!338873) (not (undefined!8505 lt!338873)) (bvslt (x!64183 lt!338873) #b01111111111111111111111111111110) (bvsge (x!64183 lt!338873) #b00000000000000000000000000000000) (bvsge (x!64183 lt!338873) x!1131)))))

(assert (=> b!760577 (=> (not res!514568) (not e!424036))))

(declare-fun b!760578 () Bool)

(assert (=> b!760578 (= e!424037 e!424034)))

(declare-fun c!83390 () Bool)

(assert (=> b!760578 (= c!83390 (or (= lt!338872 lt!338800) (= (bvadd lt!338872 lt!338872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760579 () Bool)

(assert (=> b!760579 (and (bvsge (index!33142 lt!338873) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338873) (size!20557 lt!338798)))))

(declare-fun res!514567 () Bool)

(assert (=> b!760579 (= res!514567 (= (select (arr!20137 lt!338798) (index!33142 lt!338873)) lt!338800))))

(assert (=> b!760579 (=> res!514567 e!424035)))

(assert (=> b!760579 (= e!424036 e!424035)))

(declare-fun b!760580 () Bool)

(assert (=> b!760580 (= e!424033 (bvsge (x!64183 lt!338873) #b01111111111111111111111111111110))))

(declare-fun b!760581 () Bool)

(assert (=> b!760581 (= e!424037 (Intermediate!7693 true index!1321 x!1131))))

(declare-fun b!760582 () Bool)

(assert (=> b!760582 (and (bvsge (index!33142 lt!338873) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338873) (size!20557 lt!338798)))))

(assert (=> b!760582 (= e!424035 (= (select (arr!20137 lt!338798) (index!33142 lt!338873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100693 c!83389) b!760581))

(assert (= (and d!100693 (not c!83389)) b!760578))

(assert (= (and b!760578 c!83390) b!760576))

(assert (= (and b!760578 (not c!83390)) b!760574))

(assert (= (and d!100693 c!83388) b!760580))

(assert (= (and d!100693 (not c!83388)) b!760577))

(assert (= (and b!760577 res!514568) b!760579))

(assert (= (and b!760579 (not res!514567)) b!760575))

(assert (= (and b!760575 (not res!514566)) b!760582))

(declare-fun m!708315 () Bool)

(assert (=> b!760579 m!708315))

(assert (=> b!760575 m!708315))

(declare-fun m!708317 () Bool)

(assert (=> b!760574 m!708317))

(assert (=> b!760574 m!708317))

(declare-fun m!708319 () Bool)

(assert (=> b!760574 m!708319))

(assert (=> b!760582 m!708315))

(declare-fun m!708321 () Bool)

(assert (=> d!100693 m!708321))

(assert (=> d!100693 m!708189))

(assert (=> b!760402 d!100693))

(declare-fun b!760583 () Bool)

(declare-fun e!424039 () SeekEntryResult!7693)

(assert (=> b!760583 (= e!424039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338800 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!338800 lt!338798 mask!3328))))

(declare-fun b!760584 () Bool)

(declare-fun lt!338875 () SeekEntryResult!7693)

(assert (=> b!760584 (and (bvsge (index!33142 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338875) (size!20557 lt!338798)))))

(declare-fun res!514569 () Bool)

(assert (=> b!760584 (= res!514569 (= (select (arr!20137 lt!338798) (index!33142 lt!338875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424040 () Bool)

(assert (=> b!760584 (=> res!514569 e!424040)))

(declare-fun b!760585 () Bool)

(assert (=> b!760585 (= e!424039 (Intermediate!7693 false (toIndex!0 lt!338800 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!100695 () Bool)

(declare-fun e!424038 () Bool)

(assert (=> d!100695 e!424038))

(declare-fun c!83391 () Bool)

(assert (=> d!100695 (= c!83391 (and ((_ is Intermediate!7693) lt!338875) (undefined!8505 lt!338875)))))

(declare-fun e!424042 () SeekEntryResult!7693)

(assert (=> d!100695 (= lt!338875 e!424042)))

(declare-fun c!83392 () Bool)

(assert (=> d!100695 (= c!83392 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338874 () (_ BitVec 64))

(assert (=> d!100695 (= lt!338874 (select (arr!20137 lt!338798) (toIndex!0 lt!338800 mask!3328)))))

(assert (=> d!100695 (validMask!0 mask!3328)))

(assert (=> d!100695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338800 mask!3328) lt!338800 lt!338798 mask!3328) lt!338875)))

(declare-fun b!760586 () Bool)

(declare-fun e!424041 () Bool)

(assert (=> b!760586 (= e!424038 e!424041)))

(declare-fun res!514571 () Bool)

(assert (=> b!760586 (= res!514571 (and ((_ is Intermediate!7693) lt!338875) (not (undefined!8505 lt!338875)) (bvslt (x!64183 lt!338875) #b01111111111111111111111111111110) (bvsge (x!64183 lt!338875) #b00000000000000000000000000000000) (bvsge (x!64183 lt!338875) #b00000000000000000000000000000000)))))

(assert (=> b!760586 (=> (not res!514571) (not e!424041))))

(declare-fun b!760587 () Bool)

(assert (=> b!760587 (= e!424042 e!424039)))

(declare-fun c!83393 () Bool)

(assert (=> b!760587 (= c!83393 (or (= lt!338874 lt!338800) (= (bvadd lt!338874 lt!338874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760588 () Bool)

(assert (=> b!760588 (and (bvsge (index!33142 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338875) (size!20557 lt!338798)))))

(declare-fun res!514570 () Bool)

(assert (=> b!760588 (= res!514570 (= (select (arr!20137 lt!338798) (index!33142 lt!338875)) lt!338800))))

(assert (=> b!760588 (=> res!514570 e!424040)))

(assert (=> b!760588 (= e!424041 e!424040)))

(declare-fun b!760589 () Bool)

(assert (=> b!760589 (= e!424038 (bvsge (x!64183 lt!338875) #b01111111111111111111111111111110))))

(declare-fun b!760590 () Bool)

(assert (=> b!760590 (= e!424042 (Intermediate!7693 true (toIndex!0 lt!338800 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760591 () Bool)

(assert (=> b!760591 (and (bvsge (index!33142 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338875) (size!20557 lt!338798)))))

(assert (=> b!760591 (= e!424040 (= (select (arr!20137 lt!338798) (index!33142 lt!338875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100695 c!83392) b!760590))

(assert (= (and d!100695 (not c!83392)) b!760587))

(assert (= (and b!760587 c!83393) b!760585))

(assert (= (and b!760587 (not c!83393)) b!760583))

(assert (= (and d!100695 c!83391) b!760589))

(assert (= (and d!100695 (not c!83391)) b!760586))

(assert (= (and b!760586 res!514571) b!760588))

(assert (= (and b!760588 (not res!514570)) b!760584))

(assert (= (and b!760584 (not res!514569)) b!760591))

(declare-fun m!708323 () Bool)

(assert (=> b!760588 m!708323))

(assert (=> b!760584 m!708323))

(assert (=> b!760583 m!708179))

(declare-fun m!708325 () Bool)

(assert (=> b!760583 m!708325))

(assert (=> b!760583 m!708325))

(declare-fun m!708327 () Bool)

(assert (=> b!760583 m!708327))

(assert (=> b!760591 m!708323))

(assert (=> d!100695 m!708179))

(declare-fun m!708329 () Bool)

(assert (=> d!100695 m!708329))

(assert (=> d!100695 m!708189))

(assert (=> b!760402 d!100695))

(declare-fun d!100697 () Bool)

(declare-fun lt!338877 () (_ BitVec 32))

(declare-fun lt!338876 () (_ BitVec 32))

(assert (=> d!100697 (= lt!338877 (bvmul (bvxor lt!338876 (bvlshr lt!338876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100697 (= lt!338876 ((_ extract 31 0) (bvand (bvxor lt!338800 (bvlshr lt!338800 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100697 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514559 (let ((h!15123 ((_ extract 31 0) (bvand (bvxor lt!338800 (bvlshr lt!338800 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64187 (bvmul (bvxor h!15123 (bvlshr h!15123 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64187 (bvlshr x!64187 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514559 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514559 #b00000000000000000000000000000000))))))

(assert (=> d!100697 (= (toIndex!0 lt!338800 mask!3328) (bvand (bvxor lt!338877 (bvlshr lt!338877 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760402 d!100697))

(declare-fun d!100699 () Bool)

(assert (=> d!100699 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760413 d!100699))

(declare-fun b!760634 () Bool)

(declare-fun e!424068 () SeekEntryResult!7693)

(declare-fun e!424069 () SeekEntryResult!7693)

(assert (=> b!760634 (= e!424068 e!424069)))

(declare-fun c!83413 () Bool)

(declare-fun lt!338898 () (_ BitVec 64))

(assert (=> b!760634 (= c!83413 (= lt!338898 (select (arr!20137 a!3186) j!159)))))

(declare-fun b!760635 () Bool)

(assert (=> b!760635 (= e!424069 (Found!7693 index!1321))))

(declare-fun b!760636 () Bool)

(declare-fun e!424067 () SeekEntryResult!7693)

(assert (=> b!760636 (= e!424067 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100701 () Bool)

(declare-fun lt!338897 () SeekEntryResult!7693)

(assert (=> d!100701 (and (or ((_ is Undefined!7693) lt!338897) (not ((_ is Found!7693) lt!338897)) (and (bvsge (index!33141 lt!338897) #b00000000000000000000000000000000) (bvslt (index!33141 lt!338897) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338897) ((_ is Found!7693) lt!338897) (not ((_ is MissingVacant!7693) lt!338897)) (not (= (index!33143 lt!338897) resIntermediateIndex!5)) (and (bvsge (index!33143 lt!338897) #b00000000000000000000000000000000) (bvslt (index!33143 lt!338897) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338897) (ite ((_ is Found!7693) lt!338897) (= (select (arr!20137 a!3186) (index!33141 lt!338897)) (select (arr!20137 a!3186) j!159)) (and ((_ is MissingVacant!7693) lt!338897) (= (index!33143 lt!338897) resIntermediateIndex!5) (= (select (arr!20137 a!3186) (index!33143 lt!338897)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100701 (= lt!338897 e!424068)))

(declare-fun c!83414 () Bool)

(assert (=> d!100701 (= c!83414 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100701 (= lt!338898 (select (arr!20137 a!3186) index!1321))))

(assert (=> d!100701 (validMask!0 mask!3328)))

(assert (=> d!100701 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338897)))

(declare-fun b!760637 () Bool)

(assert (=> b!760637 (= e!424068 Undefined!7693)))

(declare-fun b!760638 () Bool)

(assert (=> b!760638 (= e!424067 (MissingVacant!7693 resIntermediateIndex!5))))

(declare-fun b!760639 () Bool)

(declare-fun c!83412 () Bool)

(assert (=> b!760639 (= c!83412 (= lt!338898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760639 (= e!424069 e!424067)))

(assert (= (and d!100701 c!83414) b!760637))

(assert (= (and d!100701 (not c!83414)) b!760634))

(assert (= (and b!760634 c!83413) b!760635))

(assert (= (and b!760634 (not c!83413)) b!760639))

(assert (= (and b!760639 c!83412) b!760638))

(assert (= (and b!760639 (not c!83412)) b!760636))

(assert (=> b!760636 m!708317))

(assert (=> b!760636 m!708317))

(assert (=> b!760636 m!708161))

(declare-fun m!708351 () Bool)

(assert (=> b!760636 m!708351))

(declare-fun m!708353 () Bool)

(assert (=> d!100701 m!708353))

(declare-fun m!708355 () Bool)

(assert (=> d!100701 m!708355))

(declare-fun m!708357 () Bool)

(assert (=> d!100701 m!708357))

(assert (=> d!100701 m!708189))

(assert (=> b!760412 d!100701))

(declare-fun b!760688 () Bool)

(declare-fun e!424101 () SeekEntryResult!7693)

(assert (=> b!760688 (= e!424101 Undefined!7693)))

(declare-fun b!760689 () Bool)

(declare-fun e!424102 () SeekEntryResult!7693)

(declare-fun lt!338927 () SeekEntryResult!7693)

(assert (=> b!760689 (= e!424102 (MissingZero!7693 (index!33142 lt!338927)))))

(declare-fun b!760690 () Bool)

(declare-fun c!83433 () Bool)

(declare-fun lt!338926 () (_ BitVec 64))

(assert (=> b!760690 (= c!83433 (= lt!338926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424100 () SeekEntryResult!7693)

(assert (=> b!760690 (= e!424100 e!424102)))

(declare-fun b!760691 () Bool)

(assert (=> b!760691 (= e!424102 (seekKeyOrZeroReturnVacant!0 (x!64183 lt!338927) (index!33142 lt!338927) (index!33142 lt!338927) k0!2102 a!3186 mask!3328))))

(declare-fun d!100707 () Bool)

(declare-fun lt!338928 () SeekEntryResult!7693)

(assert (=> d!100707 (and (or ((_ is Undefined!7693) lt!338928) (not ((_ is Found!7693) lt!338928)) (and (bvsge (index!33141 lt!338928) #b00000000000000000000000000000000) (bvslt (index!33141 lt!338928) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338928) ((_ is Found!7693) lt!338928) (not ((_ is MissingZero!7693) lt!338928)) (and (bvsge (index!33140 lt!338928) #b00000000000000000000000000000000) (bvslt (index!33140 lt!338928) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338928) ((_ is Found!7693) lt!338928) ((_ is MissingZero!7693) lt!338928) (not ((_ is MissingVacant!7693) lt!338928)) (and (bvsge (index!33143 lt!338928) #b00000000000000000000000000000000) (bvslt (index!33143 lt!338928) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338928) (ite ((_ is Found!7693) lt!338928) (= (select (arr!20137 a!3186) (index!33141 lt!338928)) k0!2102) (ite ((_ is MissingZero!7693) lt!338928) (= (select (arr!20137 a!3186) (index!33140 lt!338928)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7693) lt!338928) (= (select (arr!20137 a!3186) (index!33143 lt!338928)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100707 (= lt!338928 e!424101)))

(declare-fun c!83434 () Bool)

(assert (=> d!100707 (= c!83434 (and ((_ is Intermediate!7693) lt!338927) (undefined!8505 lt!338927)))))

(assert (=> d!100707 (= lt!338927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100707 (validMask!0 mask!3328)))

(assert (=> d!100707 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!338928)))

(declare-fun b!760692 () Bool)

(assert (=> b!760692 (= e!424100 (Found!7693 (index!33142 lt!338927)))))

(declare-fun b!760693 () Bool)

(assert (=> b!760693 (= e!424101 e!424100)))

(assert (=> b!760693 (= lt!338926 (select (arr!20137 a!3186) (index!33142 lt!338927)))))

(declare-fun c!83435 () Bool)

(assert (=> b!760693 (= c!83435 (= lt!338926 k0!2102))))

(assert (= (and d!100707 c!83434) b!760688))

(assert (= (and d!100707 (not c!83434)) b!760693))

(assert (= (and b!760693 c!83435) b!760692))

(assert (= (and b!760693 (not c!83435)) b!760690))

(assert (= (and b!760690 c!83433) b!760689))

(assert (= (and b!760690 (not c!83433)) b!760691))

(declare-fun m!708379 () Bool)

(assert (=> b!760691 m!708379))

(declare-fun m!708381 () Bool)

(assert (=> d!100707 m!708381))

(declare-fun m!708383 () Bool)

(assert (=> d!100707 m!708383))

(declare-fun m!708385 () Bool)

(assert (=> d!100707 m!708385))

(declare-fun m!708387 () Bool)

(assert (=> d!100707 m!708387))

(assert (=> d!100707 m!708381))

(assert (=> d!100707 m!708189))

(declare-fun m!708389 () Bool)

(assert (=> d!100707 m!708389))

(declare-fun m!708391 () Bool)

(assert (=> b!760693 m!708391))

(assert (=> b!760401 d!100707))

(declare-fun b!760694 () Bool)

(declare-fun e!424104 () SeekEntryResult!7693)

(assert (=> b!760694 (= e!424104 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760695 () Bool)

(declare-fun lt!338930 () SeekEntryResult!7693)

(assert (=> b!760695 (and (bvsge (index!33142 lt!338930) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338930) (size!20557 a!3186)))))

(declare-fun res!514590 () Bool)

(assert (=> b!760695 (= res!514590 (= (select (arr!20137 a!3186) (index!33142 lt!338930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424105 () Bool)

(assert (=> b!760695 (=> res!514590 e!424105)))

(declare-fun b!760696 () Bool)

(assert (=> b!760696 (= e!424104 (Intermediate!7693 false index!1321 x!1131))))

(declare-fun d!100717 () Bool)

(declare-fun e!424103 () Bool)

(assert (=> d!100717 e!424103))

(declare-fun c!83436 () Bool)

(assert (=> d!100717 (= c!83436 (and ((_ is Intermediate!7693) lt!338930) (undefined!8505 lt!338930)))))

(declare-fun e!424107 () SeekEntryResult!7693)

(assert (=> d!100717 (= lt!338930 e!424107)))

(declare-fun c!83437 () Bool)

(assert (=> d!100717 (= c!83437 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338929 () (_ BitVec 64))

(assert (=> d!100717 (= lt!338929 (select (arr!20137 a!3186) index!1321))))

(assert (=> d!100717 (validMask!0 mask!3328)))

(assert (=> d!100717 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338930)))

(declare-fun b!760697 () Bool)

(declare-fun e!424106 () Bool)

(assert (=> b!760697 (= e!424103 e!424106)))

(declare-fun res!514592 () Bool)

(assert (=> b!760697 (= res!514592 (and ((_ is Intermediate!7693) lt!338930) (not (undefined!8505 lt!338930)) (bvslt (x!64183 lt!338930) #b01111111111111111111111111111110) (bvsge (x!64183 lt!338930) #b00000000000000000000000000000000) (bvsge (x!64183 lt!338930) x!1131)))))

(assert (=> b!760697 (=> (not res!514592) (not e!424106))))

(declare-fun b!760698 () Bool)

(assert (=> b!760698 (= e!424107 e!424104)))

(declare-fun c!83438 () Bool)

(assert (=> b!760698 (= c!83438 (or (= lt!338929 (select (arr!20137 a!3186) j!159)) (= (bvadd lt!338929 lt!338929) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760699 () Bool)

(assert (=> b!760699 (and (bvsge (index!33142 lt!338930) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338930) (size!20557 a!3186)))))

(declare-fun res!514591 () Bool)

(assert (=> b!760699 (= res!514591 (= (select (arr!20137 a!3186) (index!33142 lt!338930)) (select (arr!20137 a!3186) j!159)))))

(assert (=> b!760699 (=> res!514591 e!424105)))

(assert (=> b!760699 (= e!424106 e!424105)))

(declare-fun b!760700 () Bool)

(assert (=> b!760700 (= e!424103 (bvsge (x!64183 lt!338930) #b01111111111111111111111111111110))))

(declare-fun b!760701 () Bool)

(assert (=> b!760701 (= e!424107 (Intermediate!7693 true index!1321 x!1131))))

(declare-fun b!760702 () Bool)

(assert (=> b!760702 (and (bvsge (index!33142 lt!338930) #b00000000000000000000000000000000) (bvslt (index!33142 lt!338930) (size!20557 a!3186)))))

(assert (=> b!760702 (= e!424105 (= (select (arr!20137 a!3186) (index!33142 lt!338930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100717 c!83437) b!760701))

(assert (= (and d!100717 (not c!83437)) b!760698))

(assert (= (and b!760698 c!83438) b!760696))

(assert (= (and b!760698 (not c!83438)) b!760694))

(assert (= (and d!100717 c!83436) b!760700))

(assert (= (and d!100717 (not c!83436)) b!760697))

(assert (= (and b!760697 res!514592) b!760699))

(assert (= (and b!760699 (not res!514591)) b!760695))

(assert (= (and b!760695 (not res!514590)) b!760702))

(declare-fun m!708393 () Bool)

(assert (=> b!760699 m!708393))

(assert (=> b!760695 m!708393))

(assert (=> b!760694 m!708317))

(assert (=> b!760694 m!708317))

(assert (=> b!760694 m!708161))

(declare-fun m!708395 () Bool)

(assert (=> b!760694 m!708395))

(assert (=> b!760702 m!708393))

(assert (=> d!100717 m!708357))

(assert (=> d!100717 m!708189))

(assert (=> b!760405 d!100717))

(declare-fun d!100719 () Bool)

(assert (=> d!100719 (= (validKeyInArray!0 (select (arr!20137 a!3186) j!159)) (and (not (= (select (arr!20137 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20137 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760404 d!100719))

(declare-fun d!100721 () Bool)

(declare-fun res!514597 () Bool)

(declare-fun e!424112 () Bool)

(assert (=> d!100721 (=> res!514597 e!424112)))

(assert (=> d!100721 (= res!514597 (= (select (arr!20137 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100721 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!424112)))

(declare-fun b!760707 () Bool)

(declare-fun e!424113 () Bool)

(assert (=> b!760707 (= e!424112 e!424113)))

(declare-fun res!514598 () Bool)

(assert (=> b!760707 (=> (not res!514598) (not e!424113))))

(assert (=> b!760707 (= res!514598 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20557 a!3186)))))

(declare-fun b!760708 () Bool)

(assert (=> b!760708 (= e!424113 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100721 (not res!514597)) b!760707))

(assert (= (and b!760707 res!514598) b!760708))

(assert (=> d!100721 m!708291))

(declare-fun m!708397 () Bool)

(assert (=> b!760708 m!708397))

(assert (=> b!760414 d!100721))

(declare-fun d!100723 () Bool)

(assert (=> d!100723 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66012 d!100723))

(declare-fun d!100727 () Bool)

(assert (=> d!100727 (= (array_inv!15996 a!3186) (bvsge (size!20557 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66012 d!100727))

(declare-fun b!760749 () Bool)

(declare-fun e!424137 () SeekEntryResult!7693)

(declare-fun e!424138 () SeekEntryResult!7693)

(assert (=> b!760749 (= e!424137 e!424138)))

(declare-fun lt!338948 () (_ BitVec 64))

(declare-fun c!83456 () Bool)

(assert (=> b!760749 (= c!83456 (= lt!338948 (select (arr!20137 a!3186) j!159)))))

(declare-fun b!760750 () Bool)

(assert (=> b!760750 (= e!424138 (Found!7693 resIntermediateIndex!5))))

(declare-fun b!760751 () Bool)

(declare-fun e!424136 () SeekEntryResult!7693)

(assert (=> b!760751 (= e!424136 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100729 () Bool)

(declare-fun lt!338947 () SeekEntryResult!7693)

(assert (=> d!100729 (and (or ((_ is Undefined!7693) lt!338947) (not ((_ is Found!7693) lt!338947)) (and (bvsge (index!33141 lt!338947) #b00000000000000000000000000000000) (bvslt (index!33141 lt!338947) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338947) ((_ is Found!7693) lt!338947) (not ((_ is MissingVacant!7693) lt!338947)) (not (= (index!33143 lt!338947) resIntermediateIndex!5)) (and (bvsge (index!33143 lt!338947) #b00000000000000000000000000000000) (bvslt (index!33143 lt!338947) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338947) (ite ((_ is Found!7693) lt!338947) (= (select (arr!20137 a!3186) (index!33141 lt!338947)) (select (arr!20137 a!3186) j!159)) (and ((_ is MissingVacant!7693) lt!338947) (= (index!33143 lt!338947) resIntermediateIndex!5) (= (select (arr!20137 a!3186) (index!33143 lt!338947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100729 (= lt!338947 e!424137)))

(declare-fun c!83457 () Bool)

(assert (=> d!100729 (= c!83457 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100729 (= lt!338948 (select (arr!20137 a!3186) resIntermediateIndex!5))))

(assert (=> d!100729 (validMask!0 mask!3328)))

(assert (=> d!100729 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338947)))

(declare-fun b!760752 () Bool)

(assert (=> b!760752 (= e!424137 Undefined!7693)))

(declare-fun b!760753 () Bool)

(assert (=> b!760753 (= e!424136 (MissingVacant!7693 resIntermediateIndex!5))))

(declare-fun b!760754 () Bool)

(declare-fun c!83455 () Bool)

(assert (=> b!760754 (= c!83455 (= lt!338948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760754 (= e!424138 e!424136)))

(assert (= (and d!100729 c!83457) b!760752))

(assert (= (and d!100729 (not c!83457)) b!760749))

(assert (= (and b!760749 c!83456) b!760750))

(assert (= (and b!760749 (not c!83456)) b!760754))

(assert (= (and b!760754 c!83455) b!760753))

(assert (= (and b!760754 (not c!83455)) b!760751))

(declare-fun m!708421 () Bool)

(assert (=> b!760751 m!708421))

(assert (=> b!760751 m!708421))

(assert (=> b!760751 m!708161))

(declare-fun m!708423 () Bool)

(assert (=> b!760751 m!708423))

(declare-fun m!708425 () Bool)

(assert (=> d!100729 m!708425))

(declare-fun m!708427 () Bool)

(assert (=> d!100729 m!708427))

(assert (=> d!100729 m!708177))

(assert (=> d!100729 m!708189))

(assert (=> b!760407 d!100729))

(declare-fun b!760755 () Bool)

(declare-fun e!424140 () SeekEntryResult!7693)

(assert (=> b!760755 (= e!424140 Undefined!7693)))

(declare-fun b!760756 () Bool)

(declare-fun e!424141 () SeekEntryResult!7693)

(declare-fun lt!338950 () SeekEntryResult!7693)

(assert (=> b!760756 (= e!424141 (MissingZero!7693 (index!33142 lt!338950)))))

(declare-fun b!760757 () Bool)

(declare-fun c!83458 () Bool)

(declare-fun lt!338949 () (_ BitVec 64))

(assert (=> b!760757 (= c!83458 (= lt!338949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424139 () SeekEntryResult!7693)

(assert (=> b!760757 (= e!424139 e!424141)))

(declare-fun b!760758 () Bool)

(assert (=> b!760758 (= e!424141 (seekKeyOrZeroReturnVacant!0 (x!64183 lt!338950) (index!33142 lt!338950) (index!33142 lt!338950) (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100733 () Bool)

(declare-fun lt!338951 () SeekEntryResult!7693)

(assert (=> d!100733 (and (or ((_ is Undefined!7693) lt!338951) (not ((_ is Found!7693) lt!338951)) (and (bvsge (index!33141 lt!338951) #b00000000000000000000000000000000) (bvslt (index!33141 lt!338951) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338951) ((_ is Found!7693) lt!338951) (not ((_ is MissingZero!7693) lt!338951)) (and (bvsge (index!33140 lt!338951) #b00000000000000000000000000000000) (bvslt (index!33140 lt!338951) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338951) ((_ is Found!7693) lt!338951) ((_ is MissingZero!7693) lt!338951) (not ((_ is MissingVacant!7693) lt!338951)) (and (bvsge (index!33143 lt!338951) #b00000000000000000000000000000000) (bvslt (index!33143 lt!338951) (size!20557 a!3186)))) (or ((_ is Undefined!7693) lt!338951) (ite ((_ is Found!7693) lt!338951) (= (select (arr!20137 a!3186) (index!33141 lt!338951)) (select (arr!20137 a!3186) j!159)) (ite ((_ is MissingZero!7693) lt!338951) (= (select (arr!20137 a!3186) (index!33140 lt!338951)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7693) lt!338951) (= (select (arr!20137 a!3186) (index!33143 lt!338951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100733 (= lt!338951 e!424140)))

(declare-fun c!83459 () Bool)

(assert (=> d!100733 (= c!83459 (and ((_ is Intermediate!7693) lt!338950) (undefined!8505 lt!338950)))))

(assert (=> d!100733 (= lt!338950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100733 (validMask!0 mask!3328)))

(assert (=> d!100733 (= (seekEntryOrOpen!0 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338951)))

(declare-fun b!760759 () Bool)

(assert (=> b!760759 (= e!424139 (Found!7693 (index!33142 lt!338950)))))

(declare-fun b!760760 () Bool)

(assert (=> b!760760 (= e!424140 e!424139)))

(assert (=> b!760760 (= lt!338949 (select (arr!20137 a!3186) (index!33142 lt!338950)))))

(declare-fun c!83460 () Bool)

(assert (=> b!760760 (= c!83460 (= lt!338949 (select (arr!20137 a!3186) j!159)))))

(assert (= (and d!100733 c!83459) b!760755))

(assert (= (and d!100733 (not c!83459)) b!760760))

(assert (= (and b!760760 c!83460) b!760759))

(assert (= (and b!760760 (not c!83460)) b!760757))

(assert (= (and b!760757 c!83458) b!760756))

(assert (= (and b!760757 (not c!83458)) b!760758))

(assert (=> b!760758 m!708161))

(declare-fun m!708429 () Bool)

(assert (=> b!760758 m!708429))

(assert (=> d!100733 m!708167))

(assert (=> d!100733 m!708161))

(assert (=> d!100733 m!708169))

(declare-fun m!708431 () Bool)

(assert (=> d!100733 m!708431))

(declare-fun m!708433 () Bool)

(assert (=> d!100733 m!708433))

(assert (=> d!100733 m!708161))

(assert (=> d!100733 m!708167))

(assert (=> d!100733 m!708189))

(declare-fun m!708435 () Bool)

(assert (=> d!100733 m!708435))

(declare-fun m!708437 () Bool)

(assert (=> b!760760 m!708437))

(assert (=> b!760417 d!100733))

(declare-fun b!760770 () Bool)

(declare-fun e!424147 () Bool)

(declare-fun e!424148 () Bool)

(assert (=> b!760770 (= e!424147 e!424148)))

(declare-fun c!83464 () Bool)

(assert (=> b!760770 (= c!83464 (validKeyInArray!0 (select (arr!20137 a!3186) j!159)))))

(declare-fun b!760771 () Bool)

(declare-fun e!424149 () Bool)

(assert (=> b!760771 (= e!424148 e!424149)))

(declare-fun lt!338954 () (_ BitVec 64))

(assert (=> b!760771 (= lt!338954 (select (arr!20137 a!3186) j!159))))

(declare-fun lt!338956 () Unit!26305)

(assert (=> b!760771 (= lt!338956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338954 j!159))))

(assert (=> b!760771 (arrayContainsKey!0 a!3186 lt!338954 #b00000000000000000000000000000000)))

(declare-fun lt!338955 () Unit!26305)

(assert (=> b!760771 (= lt!338955 lt!338956)))

(declare-fun res!514611 () Bool)

(assert (=> b!760771 (= res!514611 (= (seekEntryOrOpen!0 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) (Found!7693 j!159)))))

(assert (=> b!760771 (=> (not res!514611) (not e!424149))))

(declare-fun b!760772 () Bool)

(declare-fun call!34955 () Bool)

(assert (=> b!760772 (= e!424149 call!34955)))

(declare-fun d!100735 () Bool)

(declare-fun res!514610 () Bool)

(assert (=> d!100735 (=> res!514610 e!424147)))

(assert (=> d!100735 (= res!514610 (bvsge j!159 (size!20557 a!3186)))))

(assert (=> d!100735 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424147)))

(declare-fun b!760773 () Bool)

(assert (=> b!760773 (= e!424148 call!34955)))

(declare-fun bm!34952 () Bool)

(assert (=> bm!34952 (= call!34955 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100735 (not res!514610)) b!760770))

(assert (= (and b!760770 c!83464) b!760771))

(assert (= (and b!760770 (not c!83464)) b!760773))

(assert (= (and b!760771 res!514611) b!760772))

(assert (= (or b!760772 b!760773) bm!34952))

(assert (=> b!760770 m!708161))

(assert (=> b!760770 m!708161))

(assert (=> b!760770 m!708165))

(assert (=> b!760771 m!708161))

(declare-fun m!708447 () Bool)

(assert (=> b!760771 m!708447))

(declare-fun m!708449 () Bool)

(assert (=> b!760771 m!708449))

(assert (=> b!760771 m!708161))

(assert (=> b!760771 m!708173))

(declare-fun m!708451 () Bool)

(assert (=> bm!34952 m!708451))

(assert (=> b!760416 d!100735))

(declare-fun d!100739 () Bool)

(assert (=> d!100739 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338961 () Unit!26305)

(declare-fun choose!38 (array!42055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26305)

(assert (=> d!100739 (= lt!338961 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100739 (validMask!0 mask!3328)))

(assert (=> d!100739 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338961)))

(declare-fun bs!21402 () Bool)

(assert (= bs!21402 d!100739))

(assert (=> bs!21402 m!708193))

(declare-fun m!708461 () Bool)

(assert (=> bs!21402 m!708461))

(assert (=> bs!21402 m!708189))

(assert (=> b!760416 d!100739))

(check-sat (not d!100679) (not d!100693) (not bm!34941) (not b!760574) (not b!760532) (not b!760770) (not d!100695) (not b!760771) (not b!760531) (not d!100733) (not b!760708) (not d!100739) (not b!760570) (not b!760571) (not b!760694) (not b!760758) (not b!760751) (not d!100707) (not bm!34952) (not b!760553) (not bm!34944) (not b!760583) (not b!760691) (not b!760636) (not d!100717) (not d!100701) (not d!100729) (not b!760533))
(check-sat)
