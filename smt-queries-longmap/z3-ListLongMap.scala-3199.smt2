; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44870 () Bool)

(assert start!44870)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31873 0))(
  ( (array!31874 (arr!15322 (Array (_ BitVec 32) (_ BitVec 64))) (size!15686 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31873)

(declare-fun b!492439 () Bool)

(declare-fun e!289269 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3745 0))(
  ( (MissingZero!3745 (index!17159 (_ BitVec 32))) (Found!3745 (index!17160 (_ BitVec 32))) (Intermediate!3745 (undefined!4557 Bool) (index!17161 (_ BitVec 32)) (x!46390 (_ BitVec 32))) (Undefined!3745) (MissingVacant!3745 (index!17162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31873 (_ BitVec 32)) SeekEntryResult!3745)

(assert (=> b!492439 (= e!289269 (= (seekEntryOrOpen!0 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) (Found!3745 j!176)))))

(declare-fun b!492440 () Bool)

(declare-fun res!295251 () Bool)

(declare-fun e!289265 () Bool)

(assert (=> b!492440 (=> (not res!295251) (not e!289265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31873 (_ BitVec 32)) Bool)

(assert (=> b!492440 (= res!295251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492441 () Bool)

(declare-fun e!289267 () Bool)

(assert (=> b!492441 (= e!289267 e!289265)))

(declare-fun res!295253 () Bool)

(assert (=> b!492441 (=> (not res!295253) (not e!289265))))

(declare-fun lt!222668 () SeekEntryResult!3745)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492441 (= res!295253 (or (= lt!222668 (MissingZero!3745 i!1204)) (= lt!222668 (MissingVacant!3745 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!492441 (= lt!222668 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492442 () Bool)

(declare-fun res!295254 () Bool)

(assert (=> b!492442 (=> (not res!295254) (not e!289267))))

(assert (=> b!492442 (= res!295254 (and (= (size!15686 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15686 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15686 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492443 () Bool)

(declare-fun res!295249 () Bool)

(assert (=> b!492443 (=> (not res!295249) (not e!289267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492443 (= res!295249 (validKeyInArray!0 (select (arr!15322 a!3235) j!176)))))

(declare-fun res!295248 () Bool)

(assert (=> start!44870 (=> (not res!295248) (not e!289267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44870 (= res!295248 (validMask!0 mask!3524))))

(assert (=> start!44870 e!289267))

(assert (=> start!44870 true))

(declare-fun array_inv!11181 (array!31873) Bool)

(assert (=> start!44870 (array_inv!11181 a!3235)))

(declare-fun b!492444 () Bool)

(declare-fun res!295246 () Bool)

(assert (=> b!492444 (=> (not res!295246) (not e!289267))))

(declare-fun arrayContainsKey!0 (array!31873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492444 (= res!295246 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492445 () Bool)

(declare-fun e!289266 () Bool)

(assert (=> b!492445 (= e!289265 (not e!289266))))

(declare-fun res!295255 () Bool)

(assert (=> b!492445 (=> res!295255 e!289266)))

(declare-fun lt!222670 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31873 (_ BitVec 32)) SeekEntryResult!3745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492445 (= res!295255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222670 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)) mask!3524)))))

(assert (=> b!492445 (= lt!222670 (toIndex!0 (select (arr!15322 a!3235) j!176) mask!3524))))

(assert (=> b!492445 e!289269))

(declare-fun res!295252 () Bool)

(assert (=> b!492445 (=> (not res!295252) (not e!289269))))

(assert (=> b!492445 (= res!295252 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14497 0))(
  ( (Unit!14498) )
))
(declare-fun lt!222669 () Unit!14497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14497)

(assert (=> b!492445 (= lt!222669 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492446 () Bool)

(assert (=> b!492446 (= e!289266 (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!222670 #b00000000000000000000000000000000) (bvslt lt!222670 (bvadd #b00000000000000000000000000000001 mask!3524)))))))

(declare-fun b!492447 () Bool)

(declare-fun res!295250 () Bool)

(assert (=> b!492447 (=> (not res!295250) (not e!289265))))

(declare-datatypes ((List!9387 0))(
  ( (Nil!9384) (Cons!9383 (h!10248 (_ BitVec 64)) (t!15607 List!9387)) )
))
(declare-fun arrayNoDuplicates!0 (array!31873 (_ BitVec 32) List!9387) Bool)

(assert (=> b!492447 (= res!295250 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9384))))

(declare-fun b!492448 () Bool)

(declare-fun res!295247 () Bool)

(assert (=> b!492448 (=> (not res!295247) (not e!289267))))

(assert (=> b!492448 (= res!295247 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44870 res!295248) b!492442))

(assert (= (and b!492442 res!295254) b!492443))

(assert (= (and b!492443 res!295249) b!492448))

(assert (= (and b!492448 res!295247) b!492444))

(assert (= (and b!492444 res!295246) b!492441))

(assert (= (and b!492441 res!295253) b!492440))

(assert (= (and b!492440 res!295251) b!492447))

(assert (= (and b!492447 res!295250) b!492445))

(assert (= (and b!492445 res!295252) b!492439))

(assert (= (and b!492445 (not res!295255)) b!492446))

(declare-fun m!473431 () Bool)

(assert (=> b!492440 m!473431))

(declare-fun m!473433 () Bool)

(assert (=> b!492441 m!473433))

(declare-fun m!473435 () Bool)

(assert (=> b!492445 m!473435))

(declare-fun m!473437 () Bool)

(assert (=> b!492445 m!473437))

(declare-fun m!473439 () Bool)

(assert (=> b!492445 m!473439))

(declare-fun m!473441 () Bool)

(assert (=> b!492445 m!473441))

(declare-fun m!473443 () Bool)

(assert (=> b!492445 m!473443))

(declare-fun m!473445 () Bool)

(assert (=> b!492445 m!473445))

(declare-fun m!473447 () Bool)

(assert (=> b!492445 m!473447))

(assert (=> b!492445 m!473439))

(declare-fun m!473449 () Bool)

(assert (=> b!492445 m!473449))

(assert (=> b!492445 m!473445))

(assert (=> b!492445 m!473443))

(assert (=> b!492445 m!473445))

(assert (=> b!492445 m!473439))

(declare-fun m!473451 () Bool)

(assert (=> b!492445 m!473451))

(assert (=> b!492439 m!473439))

(assert (=> b!492439 m!473439))

(declare-fun m!473453 () Bool)

(assert (=> b!492439 m!473453))

(declare-fun m!473455 () Bool)

(assert (=> b!492447 m!473455))

(declare-fun m!473457 () Bool)

(assert (=> start!44870 m!473457))

(declare-fun m!473459 () Bool)

(assert (=> start!44870 m!473459))

(assert (=> b!492443 m!473439))

(assert (=> b!492443 m!473439))

(declare-fun m!473461 () Bool)

(assert (=> b!492443 m!473461))

(declare-fun m!473463 () Bool)

(assert (=> b!492448 m!473463))

(declare-fun m!473465 () Bool)

(assert (=> b!492444 m!473465))

(check-sat (not b!492440) (not b!492439) (not b!492447) (not b!492445) (not start!44870) (not b!492444) (not b!492441) (not b!492448) (not b!492443))
(check-sat)
(get-model)

(declare-fun d!78133 () Bool)

(assert (=> d!78133 (= (validKeyInArray!0 (select (arr!15322 a!3235) j!176)) (and (not (= (select (arr!15322 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15322 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492443 d!78133))

(declare-fun d!78135 () Bool)

(assert (=> d!78135 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492448 d!78135))

(declare-fun b!492519 () Bool)

(declare-fun e!289311 () Bool)

(declare-fun call!31377 () Bool)

(assert (=> b!492519 (= e!289311 call!31377)))

(declare-fun b!492520 () Bool)

(declare-fun e!289310 () Bool)

(declare-fun e!289309 () Bool)

(assert (=> b!492520 (= e!289310 e!289309)))

(declare-fun res!295324 () Bool)

(assert (=> b!492520 (=> (not res!295324) (not e!289309))))

(declare-fun e!289308 () Bool)

(assert (=> b!492520 (= res!295324 (not e!289308))))

(declare-fun res!295323 () Bool)

(assert (=> b!492520 (=> (not res!295323) (not e!289308))))

(assert (=> b!492520 (= res!295323 (validKeyInArray!0 (select (arr!15322 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78137 () Bool)

(declare-fun res!295322 () Bool)

(assert (=> d!78137 (=> res!295322 e!289310)))

(assert (=> d!78137 (= res!295322 (bvsge #b00000000000000000000000000000000 (size!15686 a!3235)))))

(assert (=> d!78137 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9384) e!289310)))

(declare-fun bm!31374 () Bool)

(declare-fun c!58871 () Bool)

(assert (=> bm!31374 (= call!31377 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58871 (Cons!9383 (select (arr!15322 a!3235) #b00000000000000000000000000000000) Nil!9384) Nil!9384)))))

(declare-fun b!492521 () Bool)

(assert (=> b!492521 (= e!289311 call!31377)))

(declare-fun b!492522 () Bool)

(declare-fun contains!2689 (List!9387 (_ BitVec 64)) Bool)

(assert (=> b!492522 (= e!289308 (contains!2689 Nil!9384 (select (arr!15322 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492523 () Bool)

(assert (=> b!492523 (= e!289309 e!289311)))

(assert (=> b!492523 (= c!58871 (validKeyInArray!0 (select (arr!15322 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78137 (not res!295322)) b!492520))

(assert (= (and b!492520 res!295323) b!492522))

(assert (= (and b!492520 res!295324) b!492523))

(assert (= (and b!492523 c!58871) b!492519))

(assert (= (and b!492523 (not c!58871)) b!492521))

(assert (= (or b!492519 b!492521) bm!31374))

(declare-fun m!473539 () Bool)

(assert (=> b!492520 m!473539))

(assert (=> b!492520 m!473539))

(declare-fun m!473541 () Bool)

(assert (=> b!492520 m!473541))

(assert (=> bm!31374 m!473539))

(declare-fun m!473543 () Bool)

(assert (=> bm!31374 m!473543))

(assert (=> b!492522 m!473539))

(assert (=> b!492522 m!473539))

(declare-fun m!473545 () Bool)

(assert (=> b!492522 m!473545))

(assert (=> b!492523 m!473539))

(assert (=> b!492523 m!473539))

(assert (=> b!492523 m!473541))

(assert (=> b!492447 d!78137))

(declare-fun b!492532 () Bool)

(declare-fun e!289319 () Bool)

(declare-fun e!289318 () Bool)

(assert (=> b!492532 (= e!289319 e!289318)))

(declare-fun lt!222696 () (_ BitVec 64))

(assert (=> b!492532 (= lt!222696 (select (arr!15322 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222697 () Unit!14497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31873 (_ BitVec 64) (_ BitVec 32)) Unit!14497)

(assert (=> b!492532 (= lt!222697 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222696 #b00000000000000000000000000000000))))

(assert (=> b!492532 (arrayContainsKey!0 a!3235 lt!222696 #b00000000000000000000000000000000)))

(declare-fun lt!222695 () Unit!14497)

(assert (=> b!492532 (= lt!222695 lt!222697)))

(declare-fun res!295330 () Bool)

(assert (=> b!492532 (= res!295330 (= (seekEntryOrOpen!0 (select (arr!15322 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3745 #b00000000000000000000000000000000)))))

(assert (=> b!492532 (=> (not res!295330) (not e!289318))))

(declare-fun b!492533 () Bool)

(declare-fun call!31380 () Bool)

(assert (=> b!492533 (= e!289318 call!31380)))

(declare-fun b!492534 () Bool)

(declare-fun e!289320 () Bool)

(assert (=> b!492534 (= e!289320 e!289319)))

(declare-fun c!58874 () Bool)

(assert (=> b!492534 (= c!58874 (validKeyInArray!0 (select (arr!15322 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78139 () Bool)

(declare-fun res!295329 () Bool)

(assert (=> d!78139 (=> res!295329 e!289320)))

(assert (=> d!78139 (= res!295329 (bvsge #b00000000000000000000000000000000 (size!15686 a!3235)))))

(assert (=> d!78139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289320)))

(declare-fun b!492535 () Bool)

(assert (=> b!492535 (= e!289319 call!31380)))

(declare-fun bm!31377 () Bool)

(assert (=> bm!31377 (= call!31380 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78139 (not res!295329)) b!492534))

(assert (= (and b!492534 c!58874) b!492532))

(assert (= (and b!492534 (not c!58874)) b!492535))

(assert (= (and b!492532 res!295330) b!492533))

(assert (= (or b!492533 b!492535) bm!31377))

(assert (=> b!492532 m!473539))

(declare-fun m!473547 () Bool)

(assert (=> b!492532 m!473547))

(declare-fun m!473549 () Bool)

(assert (=> b!492532 m!473549))

(assert (=> b!492532 m!473539))

(declare-fun m!473551 () Bool)

(assert (=> b!492532 m!473551))

(assert (=> b!492534 m!473539))

(assert (=> b!492534 m!473539))

(assert (=> b!492534 m!473541))

(declare-fun m!473553 () Bool)

(assert (=> bm!31377 m!473553))

(assert (=> b!492440 d!78139))

(declare-fun lt!222704 () SeekEntryResult!3745)

(declare-fun e!289327 () SeekEntryResult!3745)

(declare-fun b!492548 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31873 (_ BitVec 32)) SeekEntryResult!3745)

(assert (=> b!492548 (= e!289327 (seekKeyOrZeroReturnVacant!0 (x!46390 lt!222704) (index!17161 lt!222704) (index!17161 lt!222704) k0!2280 a!3235 mask!3524))))

(declare-fun b!492549 () Bool)

(declare-fun c!58881 () Bool)

(declare-fun lt!222705 () (_ BitVec 64))

(assert (=> b!492549 (= c!58881 (= lt!222705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289328 () SeekEntryResult!3745)

(assert (=> b!492549 (= e!289328 e!289327)))

(declare-fun d!78141 () Bool)

(declare-fun lt!222706 () SeekEntryResult!3745)

(get-info :version)

(assert (=> d!78141 (and (or ((_ is Undefined!3745) lt!222706) (not ((_ is Found!3745) lt!222706)) (and (bvsge (index!17160 lt!222706) #b00000000000000000000000000000000) (bvslt (index!17160 lt!222706) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222706) ((_ is Found!3745) lt!222706) (not ((_ is MissingZero!3745) lt!222706)) (and (bvsge (index!17159 lt!222706) #b00000000000000000000000000000000) (bvslt (index!17159 lt!222706) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222706) ((_ is Found!3745) lt!222706) ((_ is MissingZero!3745) lt!222706) (not ((_ is MissingVacant!3745) lt!222706)) (and (bvsge (index!17162 lt!222706) #b00000000000000000000000000000000) (bvslt (index!17162 lt!222706) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222706) (ite ((_ is Found!3745) lt!222706) (= (select (arr!15322 a!3235) (index!17160 lt!222706)) k0!2280) (ite ((_ is MissingZero!3745) lt!222706) (= (select (arr!15322 a!3235) (index!17159 lt!222706)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3745) lt!222706) (= (select (arr!15322 a!3235) (index!17162 lt!222706)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289329 () SeekEntryResult!3745)

(assert (=> d!78141 (= lt!222706 e!289329)))

(declare-fun c!58883 () Bool)

(assert (=> d!78141 (= c!58883 (and ((_ is Intermediate!3745) lt!222704) (undefined!4557 lt!222704)))))

(assert (=> d!78141 (= lt!222704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78141 (validMask!0 mask!3524)))

(assert (=> d!78141 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222706)))

(declare-fun b!492550 () Bool)

(assert (=> b!492550 (= e!289328 (Found!3745 (index!17161 lt!222704)))))

(declare-fun b!492551 () Bool)

(assert (=> b!492551 (= e!289327 (MissingZero!3745 (index!17161 lt!222704)))))

(declare-fun b!492552 () Bool)

(assert (=> b!492552 (= e!289329 Undefined!3745)))

(declare-fun b!492553 () Bool)

(assert (=> b!492553 (= e!289329 e!289328)))

(assert (=> b!492553 (= lt!222705 (select (arr!15322 a!3235) (index!17161 lt!222704)))))

(declare-fun c!58882 () Bool)

(assert (=> b!492553 (= c!58882 (= lt!222705 k0!2280))))

(assert (= (and d!78141 c!58883) b!492552))

(assert (= (and d!78141 (not c!58883)) b!492553))

(assert (= (and b!492553 c!58882) b!492550))

(assert (= (and b!492553 (not c!58882)) b!492549))

(assert (= (and b!492549 c!58881) b!492551))

(assert (= (and b!492549 (not c!58881)) b!492548))

(declare-fun m!473555 () Bool)

(assert (=> b!492548 m!473555))

(declare-fun m!473557 () Bool)

(assert (=> d!78141 m!473557))

(declare-fun m!473559 () Bool)

(assert (=> d!78141 m!473559))

(declare-fun m!473561 () Bool)

(assert (=> d!78141 m!473561))

(declare-fun m!473563 () Bool)

(assert (=> d!78141 m!473563))

(assert (=> d!78141 m!473457))

(assert (=> d!78141 m!473559))

(declare-fun m!473565 () Bool)

(assert (=> d!78141 m!473565))

(declare-fun m!473567 () Bool)

(assert (=> b!492553 m!473567))

(assert (=> b!492441 d!78141))

(declare-fun b!492554 () Bool)

(declare-fun lt!222707 () SeekEntryResult!3745)

(declare-fun e!289330 () SeekEntryResult!3745)

(assert (=> b!492554 (= e!289330 (seekKeyOrZeroReturnVacant!0 (x!46390 lt!222707) (index!17161 lt!222707) (index!17161 lt!222707) (select (arr!15322 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492555 () Bool)

(declare-fun c!58884 () Bool)

(declare-fun lt!222708 () (_ BitVec 64))

(assert (=> b!492555 (= c!58884 (= lt!222708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289331 () SeekEntryResult!3745)

(assert (=> b!492555 (= e!289331 e!289330)))

(declare-fun d!78145 () Bool)

(declare-fun lt!222709 () SeekEntryResult!3745)

(assert (=> d!78145 (and (or ((_ is Undefined!3745) lt!222709) (not ((_ is Found!3745) lt!222709)) (and (bvsge (index!17160 lt!222709) #b00000000000000000000000000000000) (bvslt (index!17160 lt!222709) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222709) ((_ is Found!3745) lt!222709) (not ((_ is MissingZero!3745) lt!222709)) (and (bvsge (index!17159 lt!222709) #b00000000000000000000000000000000) (bvslt (index!17159 lt!222709) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222709) ((_ is Found!3745) lt!222709) ((_ is MissingZero!3745) lt!222709) (not ((_ is MissingVacant!3745) lt!222709)) (and (bvsge (index!17162 lt!222709) #b00000000000000000000000000000000) (bvslt (index!17162 lt!222709) (size!15686 a!3235)))) (or ((_ is Undefined!3745) lt!222709) (ite ((_ is Found!3745) lt!222709) (= (select (arr!15322 a!3235) (index!17160 lt!222709)) (select (arr!15322 a!3235) j!176)) (ite ((_ is MissingZero!3745) lt!222709) (= (select (arr!15322 a!3235) (index!17159 lt!222709)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3745) lt!222709) (= (select (arr!15322 a!3235) (index!17162 lt!222709)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289332 () SeekEntryResult!3745)

(assert (=> d!78145 (= lt!222709 e!289332)))

(declare-fun c!58886 () Bool)

(assert (=> d!78145 (= c!58886 (and ((_ is Intermediate!3745) lt!222707) (undefined!4557 lt!222707)))))

(assert (=> d!78145 (= lt!222707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15322 a!3235) j!176) mask!3524) (select (arr!15322 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78145 (validMask!0 mask!3524)))

(assert (=> d!78145 (= (seekEntryOrOpen!0 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) lt!222709)))

(declare-fun b!492556 () Bool)

(assert (=> b!492556 (= e!289331 (Found!3745 (index!17161 lt!222707)))))

(declare-fun b!492557 () Bool)

(assert (=> b!492557 (= e!289330 (MissingZero!3745 (index!17161 lt!222707)))))

(declare-fun b!492558 () Bool)

(assert (=> b!492558 (= e!289332 Undefined!3745)))

(declare-fun b!492559 () Bool)

(assert (=> b!492559 (= e!289332 e!289331)))

(assert (=> b!492559 (= lt!222708 (select (arr!15322 a!3235) (index!17161 lt!222707)))))

(declare-fun c!58885 () Bool)

(assert (=> b!492559 (= c!58885 (= lt!222708 (select (arr!15322 a!3235) j!176)))))

(assert (= (and d!78145 c!58886) b!492558))

(assert (= (and d!78145 (not c!58886)) b!492559))

(assert (= (and b!492559 c!58885) b!492556))

(assert (= (and b!492559 (not c!58885)) b!492555))

(assert (= (and b!492555 c!58884) b!492557))

(assert (= (and b!492555 (not c!58884)) b!492554))

(assert (=> b!492554 m!473439))

(declare-fun m!473569 () Bool)

(assert (=> b!492554 m!473569))

(declare-fun m!473571 () Bool)

(assert (=> d!78145 m!473571))

(assert (=> d!78145 m!473439))

(assert (=> d!78145 m!473441))

(declare-fun m!473573 () Bool)

(assert (=> d!78145 m!473573))

(declare-fun m!473575 () Bool)

(assert (=> d!78145 m!473575))

(assert (=> d!78145 m!473457))

(assert (=> d!78145 m!473441))

(assert (=> d!78145 m!473439))

(declare-fun m!473577 () Bool)

(assert (=> d!78145 m!473577))

(declare-fun m!473579 () Bool)

(assert (=> b!492559 m!473579))

(assert (=> b!492439 d!78145))

(declare-fun d!78147 () Bool)

(declare-fun res!295335 () Bool)

(declare-fun e!289337 () Bool)

(assert (=> d!78147 (=> res!295335 e!289337)))

(assert (=> d!78147 (= res!295335 (= (select (arr!15322 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78147 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!289337)))

(declare-fun b!492564 () Bool)

(declare-fun e!289338 () Bool)

(assert (=> b!492564 (= e!289337 e!289338)))

(declare-fun res!295336 () Bool)

(assert (=> b!492564 (=> (not res!295336) (not e!289338))))

(assert (=> b!492564 (= res!295336 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15686 a!3235)))))

(declare-fun b!492565 () Bool)

(assert (=> b!492565 (= e!289338 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78147 (not res!295335)) b!492564))

(assert (= (and b!492564 res!295336) b!492565))

(assert (=> d!78147 m!473539))

(declare-fun m!473581 () Bool)

(assert (=> b!492565 m!473581))

(assert (=> b!492444 d!78147))

(declare-fun d!78149 () Bool)

(assert (=> d!78149 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44870 d!78149))

(declare-fun d!78155 () Bool)

(assert (=> d!78155 (= (array_inv!11181 a!3235) (bvsge (size!15686 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44870 d!78155))

(declare-fun d!78157 () Bool)

(declare-fun lt!222731 () (_ BitVec 32))

(declare-fun lt!222729 () (_ BitVec 32))

(assert (=> d!78157 (= lt!222731 (bvmul (bvxor lt!222729 (bvlshr lt!222729 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78157 (= lt!222729 ((_ extract 31 0) (bvand (bvxor (select (arr!15322 a!3235) j!176) (bvlshr (select (arr!15322 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78157 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295337 (let ((h!10251 ((_ extract 31 0) (bvand (bvxor (select (arr!15322 a!3235) j!176) (bvlshr (select (arr!15322 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46393 (bvmul (bvxor h!10251 (bvlshr h!10251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46393 (bvlshr x!46393 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295337 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295337 #b00000000000000000000000000000000))))))

(assert (=> d!78157 (= (toIndex!0 (select (arr!15322 a!3235) j!176) mask!3524) (bvand (bvxor lt!222731 (bvlshr lt!222731 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492445 d!78157))

(declare-fun b!492611 () Bool)

(declare-fun e!289370 () Bool)

(declare-fun e!289369 () Bool)

(assert (=> b!492611 (= e!289370 e!289369)))

(declare-fun lt!222735 () (_ BitVec 64))

(assert (=> b!492611 (= lt!222735 (select (arr!15322 a!3235) j!176))))

(declare-fun lt!222736 () Unit!14497)

(assert (=> b!492611 (= lt!222736 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222735 j!176))))

(assert (=> b!492611 (arrayContainsKey!0 a!3235 lt!222735 #b00000000000000000000000000000000)))

(declare-fun lt!222734 () Unit!14497)

(assert (=> b!492611 (= lt!222734 lt!222736)))

(declare-fun res!295354 () Bool)

(assert (=> b!492611 (= res!295354 (= (seekEntryOrOpen!0 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) (Found!3745 j!176)))))

(assert (=> b!492611 (=> (not res!295354) (not e!289369))))

(declare-fun b!492612 () Bool)

(declare-fun call!31387 () Bool)

(assert (=> b!492612 (= e!289369 call!31387)))

(declare-fun b!492613 () Bool)

(declare-fun e!289371 () Bool)

(assert (=> b!492613 (= e!289371 e!289370)))

(declare-fun c!58902 () Bool)

(assert (=> b!492613 (= c!58902 (validKeyInArray!0 (select (arr!15322 a!3235) j!176)))))

(declare-fun d!78161 () Bool)

(declare-fun res!295353 () Bool)

(assert (=> d!78161 (=> res!295353 e!289371)))

(assert (=> d!78161 (= res!295353 (bvsge j!176 (size!15686 a!3235)))))

(assert (=> d!78161 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289371)))

(declare-fun b!492614 () Bool)

(assert (=> b!492614 (= e!289370 call!31387)))

(declare-fun bm!31384 () Bool)

(assert (=> bm!31384 (= call!31387 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78161 (not res!295353)) b!492613))

(assert (= (and b!492613 c!58902) b!492611))

(assert (= (and b!492613 (not c!58902)) b!492614))

(assert (= (and b!492611 res!295354) b!492612))

(assert (= (or b!492612 b!492614) bm!31384))

(assert (=> b!492611 m!473439))

(declare-fun m!473617 () Bool)

(assert (=> b!492611 m!473617))

(declare-fun m!473619 () Bool)

(assert (=> b!492611 m!473619))

(assert (=> b!492611 m!473439))

(assert (=> b!492611 m!473453))

(assert (=> b!492613 m!473439))

(assert (=> b!492613 m!473439))

(assert (=> b!492613 m!473461))

(declare-fun m!473621 () Bool)

(assert (=> bm!31384 m!473621))

(assert (=> b!492445 d!78161))

(declare-fun b!492673 () Bool)

(declare-fun e!289409 () Bool)

(declare-fun e!289410 () Bool)

(assert (=> b!492673 (= e!289409 e!289410)))

(declare-fun res!295372 () Bool)

(declare-fun lt!222766 () SeekEntryResult!3745)

(assert (=> b!492673 (= res!295372 (and ((_ is Intermediate!3745) lt!222766) (not (undefined!4557 lt!222766)) (bvslt (x!46390 lt!222766) #b01111111111111111111111111111110) (bvsge (x!46390 lt!222766) #b00000000000000000000000000000000) (bvsge (x!46390 lt!222766) #b00000000000000000000000000000000)))))

(assert (=> b!492673 (=> (not res!295372) (not e!289410))))

(declare-fun b!492674 () Bool)

(assert (=> b!492674 (and (bvsge (index!17161 lt!222766) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222766) (size!15686 a!3235)))))

(declare-fun res!295370 () Bool)

(assert (=> b!492674 (= res!295370 (= (select (arr!15322 a!3235) (index!17161 lt!222766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289407 () Bool)

(assert (=> b!492674 (=> res!295370 e!289407)))

(declare-fun b!492675 () Bool)

(declare-fun e!289408 () SeekEntryResult!3745)

(assert (=> b!492675 (= e!289408 (Intermediate!3745 false lt!222670 #b00000000000000000000000000000000))))

(declare-fun b!492676 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492676 (= e!289408 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!222670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15322 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492677 () Bool)

(declare-fun e!289406 () SeekEntryResult!3745)

(assert (=> b!492677 (= e!289406 e!289408)))

(declare-fun lt!222765 () (_ BitVec 64))

(declare-fun c!58927 () Bool)

(assert (=> b!492677 (= c!58927 (or (= lt!222765 (select (arr!15322 a!3235) j!176)) (= (bvadd lt!222765 lt!222765) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492678 () Bool)

(assert (=> b!492678 (= e!289409 (bvsge (x!46390 lt!222766) #b01111111111111111111111111111110))))

(declare-fun b!492679 () Bool)

(assert (=> b!492679 (and (bvsge (index!17161 lt!222766) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222766) (size!15686 a!3235)))))

(declare-fun res!295371 () Bool)

(assert (=> b!492679 (= res!295371 (= (select (arr!15322 a!3235) (index!17161 lt!222766)) (select (arr!15322 a!3235) j!176)))))

(assert (=> b!492679 (=> res!295371 e!289407)))

(assert (=> b!492679 (= e!289410 e!289407)))

(declare-fun b!492680 () Bool)

(assert (=> b!492680 (and (bvsge (index!17161 lt!222766) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222766) (size!15686 a!3235)))))

(assert (=> b!492680 (= e!289407 (= (select (arr!15322 a!3235) (index!17161 lt!222766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!78165 () Bool)

(assert (=> d!78165 e!289409))

(declare-fun c!58925 () Bool)

(assert (=> d!78165 (= c!58925 (and ((_ is Intermediate!3745) lt!222766) (undefined!4557 lt!222766)))))

(assert (=> d!78165 (= lt!222766 e!289406)))

(declare-fun c!58926 () Bool)

(assert (=> d!78165 (= c!58926 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78165 (= lt!222765 (select (arr!15322 a!3235) lt!222670))))

(assert (=> d!78165 (validMask!0 mask!3524)))

(assert (=> d!78165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222670 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) lt!222766)))

(declare-fun b!492681 () Bool)

(assert (=> b!492681 (= e!289406 (Intermediate!3745 true lt!222670 #b00000000000000000000000000000000))))

(assert (= (and d!78165 c!58926) b!492681))

(assert (= (and d!78165 (not c!58926)) b!492677))

(assert (= (and b!492677 c!58927) b!492675))

(assert (= (and b!492677 (not c!58927)) b!492676))

(assert (= (and d!78165 c!58925) b!492678))

(assert (= (and d!78165 (not c!58925)) b!492673))

(assert (= (and b!492673 res!295372) b!492679))

(assert (= (and b!492679 (not res!295371)) b!492674))

(assert (= (and b!492674 (not res!295370)) b!492680))

(declare-fun m!473663 () Bool)

(assert (=> b!492679 m!473663))

(declare-fun m!473665 () Bool)

(assert (=> d!78165 m!473665))

(assert (=> d!78165 m!473457))

(declare-fun m!473669 () Bool)

(assert (=> b!492676 m!473669))

(assert (=> b!492676 m!473669))

(assert (=> b!492676 m!473439))

(declare-fun m!473675 () Bool)

(assert (=> b!492676 m!473675))

(assert (=> b!492674 m!473663))

(assert (=> b!492680 m!473663))

(assert (=> b!492445 d!78165))

(declare-fun d!78189 () Bool)

(assert (=> d!78189 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222778 () Unit!14497)

(declare-fun choose!38 (array!31873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14497)

(assert (=> d!78189 (= lt!222778 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78189 (validMask!0 mask!3524)))

(assert (=> d!78189 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222778)))

(declare-fun bs!15720 () Bool)

(assert (= bs!15720 d!78189))

(assert (=> bs!15720 m!473449))

(declare-fun m!473679 () Bool)

(assert (=> bs!15720 m!473679))

(assert (=> bs!15720 m!473457))

(assert (=> b!492445 d!78189))

(declare-fun d!78197 () Bool)

(declare-fun lt!222780 () (_ BitVec 32))

(declare-fun lt!222779 () (_ BitVec 32))

(assert (=> d!78197 (= lt!222780 (bvmul (bvxor lt!222779 (bvlshr lt!222779 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78197 (= lt!222779 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78197 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295337 (let ((h!10251 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46393 (bvmul (bvxor h!10251 (bvlshr h!10251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46393 (bvlshr x!46393 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295337 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295337 #b00000000000000000000000000000000))))))

(assert (=> d!78197 (= (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222780 (bvlshr lt!222780 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492445 d!78197))

(declare-fun b!492682 () Bool)

(declare-fun e!289414 () Bool)

(declare-fun e!289415 () Bool)

(assert (=> b!492682 (= e!289414 e!289415)))

(declare-fun res!295376 () Bool)

(declare-fun lt!222784 () SeekEntryResult!3745)

(assert (=> b!492682 (= res!295376 (and ((_ is Intermediate!3745) lt!222784) (not (undefined!4557 lt!222784)) (bvslt (x!46390 lt!222784) #b01111111111111111111111111111110) (bvsge (x!46390 lt!222784) #b00000000000000000000000000000000) (bvsge (x!46390 lt!222784) #b00000000000000000000000000000000)))))

(assert (=> b!492682 (=> (not res!295376) (not e!289415))))

(declare-fun b!492683 () Bool)

(assert (=> b!492683 (and (bvsge (index!17161 lt!222784) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222784) (size!15686 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)))))))

(declare-fun res!295374 () Bool)

(assert (=> b!492683 (= res!295374 (= (select (arr!15322 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235))) (index!17161 lt!222784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289412 () Bool)

(assert (=> b!492683 (=> res!295374 e!289412)))

(declare-fun e!289413 () SeekEntryResult!3745)

(declare-fun b!492684 () Bool)

(assert (=> b!492684 (= e!289413 (Intermediate!3745 false (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492685 () Bool)

(assert (=> b!492685 (= e!289413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)) mask!3524))))

(declare-fun b!492686 () Bool)

(declare-fun e!289411 () SeekEntryResult!3745)

(assert (=> b!492686 (= e!289411 e!289413)))

(declare-fun c!58930 () Bool)

(declare-fun lt!222783 () (_ BitVec 64))

(assert (=> b!492686 (= c!58930 (or (= lt!222783 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222783 lt!222783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492687 () Bool)

(assert (=> b!492687 (= e!289414 (bvsge (x!46390 lt!222784) #b01111111111111111111111111111110))))

(declare-fun b!492688 () Bool)

(assert (=> b!492688 (and (bvsge (index!17161 lt!222784) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222784) (size!15686 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)))))))

(declare-fun res!295375 () Bool)

(assert (=> b!492688 (= res!295375 (= (select (arr!15322 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235))) (index!17161 lt!222784)) (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!492688 (=> res!295375 e!289412)))

(assert (=> b!492688 (= e!289415 e!289412)))

(declare-fun b!492689 () Bool)

(assert (=> b!492689 (and (bvsge (index!17161 lt!222784) #b00000000000000000000000000000000) (bvslt (index!17161 lt!222784) (size!15686 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)))))))

(assert (=> b!492689 (= e!289412 (= (select (arr!15322 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235))) (index!17161 lt!222784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!78199 () Bool)

(assert (=> d!78199 e!289414))

(declare-fun c!58928 () Bool)

(assert (=> d!78199 (= c!58928 (and ((_ is Intermediate!3745) lt!222784) (undefined!4557 lt!222784)))))

(assert (=> d!78199 (= lt!222784 e!289411)))

(declare-fun c!58929 () Bool)

(assert (=> d!78199 (= c!58929 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78199 (= lt!222783 (select (arr!15322 (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235))) (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!78199 (validMask!0 mask!3524)))

(assert (=> d!78199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (array!31874 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)) mask!3524) lt!222784)))

(declare-fun b!492690 () Bool)

(assert (=> b!492690 (= e!289411 (Intermediate!3745 true (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!78199 c!58929) b!492690))

(assert (= (and d!78199 (not c!58929)) b!492686))

(assert (= (and b!492686 c!58930) b!492684))

(assert (= (and b!492686 (not c!58930)) b!492685))

(assert (= (and d!78199 c!58928) b!492687))

(assert (= (and d!78199 (not c!58928)) b!492682))

(assert (= (and b!492682 res!295376) b!492688))

(assert (= (and b!492688 (not res!295375)) b!492683))

(assert (= (and b!492683 (not res!295374)) b!492689))

(declare-fun m!473681 () Bool)

(assert (=> b!492688 m!473681))

(assert (=> d!78199 m!473443))

(declare-fun m!473683 () Bool)

(assert (=> d!78199 m!473683))

(assert (=> d!78199 m!473457))

(assert (=> b!492685 m!473443))

(declare-fun m!473685 () Bool)

(assert (=> b!492685 m!473685))

(assert (=> b!492685 m!473685))

(assert (=> b!492685 m!473445))

(declare-fun m!473687 () Bool)

(assert (=> b!492685 m!473687))

(assert (=> b!492683 m!473681))

(assert (=> b!492689 m!473681))

(assert (=> b!492445 d!78199))

(check-sat (not d!78189) (not b!492611) (not d!78199) (not b!492685) (not b!492565) (not b!492522) (not bm!31377) (not b!492532) (not b!492676) (not bm!31374) (not d!78145) (not b!492548) (not b!492613) (not b!492523) (not b!492554) (not b!492520) (not d!78165) (not bm!31384) (not b!492534) (not d!78141))
(check-sat)
