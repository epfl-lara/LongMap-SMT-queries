; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131020 () Bool)

(assert start!131020)

(declare-fun b!1534933 () Bool)

(declare-fun e!855352 () Bool)

(declare-fun e!855350 () Bool)

(assert (=> b!1534933 (= e!855352 e!855350)))

(declare-fun res!1050551 () Bool)

(assert (=> b!1534933 (=> res!1050551 e!855350)))

(declare-datatypes ((List!35616 0))(
  ( (Nil!35613) (Cons!35612 (h!37075 (_ BitVec 64)) (t!50302 List!35616)) )
))
(declare-fun contains!10057 (List!35616 (_ BitVec 64)) Bool)

(assert (=> b!1534933 (= res!1050551 (contains!10057 Nil!35613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1534934 () Bool)

(declare-fun res!1050558 () Bool)

(assert (=> b!1534934 (=> (not res!1050558) (not e!855352))))

(declare-datatypes ((array!101888 0))(
  ( (array!101889 (arr!49155 (Array (_ BitVec 32) (_ BitVec 64))) (size!49706 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101888)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101888 (_ BitVec 32)) Bool)

(assert (=> b!1534934 (= res!1050558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050552 () Bool)

(assert (=> start!131020 (=> (not res!1050552) (not e!855352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131020 (= res!1050552 (validMask!0 mask!2480))))

(assert (=> start!131020 e!855352))

(assert (=> start!131020 true))

(declare-fun array_inv!38436 (array!101888) Bool)

(assert (=> start!131020 (array_inv!38436 a!2792)))

(declare-fun b!1534935 () Bool)

(declare-fun res!1050557 () Bool)

(assert (=> b!1534935 (=> (not res!1050557) (not e!855352))))

(declare-fun noDuplicate!2652 (List!35616) Bool)

(assert (=> b!1534935 (= res!1050557 (noDuplicate!2652 Nil!35613))))

(declare-fun b!1534936 () Bool)

(declare-fun res!1050554 () Bool)

(assert (=> b!1534936 (=> (not res!1050554) (not e!855352))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534936 (= res!1050554 (validKeyInArray!0 (select (arr!49155 a!2792) j!64)))))

(declare-fun b!1534937 () Bool)

(assert (=> b!1534937 (= e!855350 (contains!10057 Nil!35613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1534938 () Bool)

(declare-fun res!1050555 () Bool)

(assert (=> b!1534938 (=> (not res!1050555) (not e!855352))))

(assert (=> b!1534938 (= res!1050555 (and (bvsle #b00000000000000000000000000000000 (size!49706 a!2792)) (bvslt (size!49706 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1534939 () Bool)

(declare-fun res!1050553 () Bool)

(assert (=> b!1534939 (=> (not res!1050553) (not e!855352))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534939 (= res!1050553 (and (= (size!49706 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49706 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49706 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534940 () Bool)

(declare-fun res!1050556 () Bool)

(assert (=> b!1534940 (=> (not res!1050556) (not e!855352))))

(assert (=> b!1534940 (= res!1050556 (validKeyInArray!0 (select (arr!49155 a!2792) i!951)))))

(assert (= (and start!131020 res!1050552) b!1534939))

(assert (= (and b!1534939 res!1050553) b!1534940))

(assert (= (and b!1534940 res!1050556) b!1534936))

(assert (= (and b!1534936 res!1050554) b!1534934))

(assert (= (and b!1534934 res!1050558) b!1534938))

(assert (= (and b!1534938 res!1050555) b!1534935))

(assert (= (and b!1534935 res!1050557) b!1534933))

(assert (= (and b!1534933 (not res!1050551)) b!1534937))

(declare-fun m!1417499 () Bool)

(assert (=> b!1534935 m!1417499))

(declare-fun m!1417501 () Bool)

(assert (=> b!1534933 m!1417501))

(declare-fun m!1417503 () Bool)

(assert (=> b!1534934 m!1417503))

(declare-fun m!1417505 () Bool)

(assert (=> b!1534936 m!1417505))

(assert (=> b!1534936 m!1417505))

(declare-fun m!1417507 () Bool)

(assert (=> b!1534936 m!1417507))

(declare-fun m!1417509 () Bool)

(assert (=> b!1534937 m!1417509))

(declare-fun m!1417511 () Bool)

(assert (=> b!1534940 m!1417511))

(assert (=> b!1534940 m!1417511))

(declare-fun m!1417513 () Bool)

(assert (=> b!1534940 m!1417513))

(declare-fun m!1417515 () Bool)

(assert (=> start!131020 m!1417515))

(declare-fun m!1417517 () Bool)

(assert (=> start!131020 m!1417517))

(push 1)

(assert (not b!1534933))

(assert (not b!1534935))

(assert (not b!1534940))

(assert (not start!131020))

(assert (not b!1534937))

(assert (not b!1534934))

(assert (not b!1534936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160783 () Bool)

(assert (=> d!160783 (= (validKeyInArray!0 (select (arr!49155 a!2792) i!951)) (and (not (= (select (arr!49155 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49155 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534940 d!160783))

(declare-fun d!160785 () Bool)

(declare-fun res!1050563 () Bool)

(declare-fun e!855357 () Bool)

(assert (=> d!160785 (=> res!1050563 e!855357)))

(assert (=> d!160785 (= res!1050563 (is-Nil!35613 Nil!35613))))

(assert (=> d!160785 (= (noDuplicate!2652 Nil!35613) e!855357)))

(declare-fun b!1534945 () Bool)

(declare-fun e!855358 () Bool)

(assert (=> b!1534945 (= e!855357 e!855358)))

(declare-fun res!1050564 () Bool)

(assert (=> b!1534945 (=> (not res!1050564) (not e!855358))))

(assert (=> b!1534945 (= res!1050564 (not (contains!10057 (t!50302 Nil!35613) (h!37075 Nil!35613))))))

(declare-fun b!1534946 () Bool)

(assert (=> b!1534946 (= e!855358 (noDuplicate!2652 (t!50302 Nil!35613)))))

(assert (= (and d!160785 (not res!1050563)) b!1534945))

(assert (= (and b!1534945 res!1050564) b!1534946))

(declare-fun m!1417519 () Bool)

(assert (=> b!1534945 m!1417519))

(declare-fun m!1417521 () Bool)

(assert (=> b!1534946 m!1417521))

(assert (=> b!1534935 d!160785))

(declare-fun d!160789 () Bool)

(declare-fun res!1050575 () Bool)

(declare-fun e!855373 () Bool)

(assert (=> d!160789 (=> res!1050575 e!855373)))

(assert (=> d!160789 (= res!1050575 (bvsge #b00000000000000000000000000000000 (size!49706 a!2792)))))

(assert (=> d!160789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855373)))

(declare-fun b!1534961 () Bool)

(declare-fun e!855372 () Bool)

(assert (=> b!1534961 (= e!855373 e!855372)))

(declare-fun c!141763 () Bool)

(assert (=> b!1534961 (= c!141763 (validKeyInArray!0 (select (arr!49155 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1534962 () Bool)

(declare-fun call!68706 () Bool)

(assert (=> b!1534962 (= e!855372 call!68706)))

(declare-fun bm!68703 () Bool)

(assert (=> bm!68703 (= call!68706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1534963 () Bool)

(declare-fun e!855371 () Bool)

(assert (=> b!1534963 (= e!855371 call!68706)))

(declare-fun b!1534964 () Bool)

(assert (=> b!1534964 (= e!855372 e!855371)))

(declare-fun lt!664573 () (_ BitVec 64))

(assert (=> b!1534964 (= lt!664573 (select (arr!49155 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51229 0))(
  ( (Unit!51230) )
))
(declare-fun lt!664575 () Unit!51229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101888 (_ BitVec 64) (_ BitVec 32)) Unit!51229)

(assert (=> b!1534964 (= lt!664575 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664573 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1534964 (arrayContainsKey!0 a!2792 lt!664573 #b00000000000000000000000000000000)))

(declare-fun lt!664574 () Unit!51229)

(assert (=> b!1534964 (= lt!664574 lt!664575)))

(declare-fun res!1050576 () Bool)

(declare-datatypes ((SeekEntryResult!13204 0))(
  ( (MissingZero!13204 (index!55211 (_ BitVec 32))) (Found!13204 (index!55212 (_ BitVec 32))) (Intermediate!13204 (undefined!14016 Bool) (index!55213 (_ BitVec 32)) (x!137133 (_ BitVec 32))) (Undefined!13204) (MissingVacant!13204 (index!55214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101888 (_ BitVec 32)) SeekEntryResult!13204)

(assert (=> b!1534964 (= res!1050576 (= (seekEntryOrOpen!0 (select (arr!49155 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13204 #b00000000000000000000000000000000)))))

(assert (=> b!1534964 (=> (not res!1050576) (not e!855371))))

(assert (= (and d!160789 (not res!1050575)) b!1534961))

(assert (= (and b!1534961 c!141763) b!1534964))

(assert (= (and b!1534961 (not c!141763)) b!1534962))

(assert (= (and b!1534964 res!1050576) b!1534963))

(assert (= (or b!1534963 b!1534962) bm!68703))

(declare-fun m!1417527 () Bool)

(assert (=> b!1534961 m!1417527))

(assert (=> b!1534961 m!1417527))

(declare-fun m!1417529 () Bool)

(assert (=> b!1534961 m!1417529))

(declare-fun m!1417531 () Bool)

(assert (=> bm!68703 m!1417531))

(assert (=> b!1534964 m!1417527))

(declare-fun m!1417533 () Bool)

(assert (=> b!1534964 m!1417533))

(declare-fun m!1417535 () Bool)

(assert (=> b!1534964 m!1417535))

(assert (=> b!1534964 m!1417527))

(declare-fun m!1417537 () Bool)

(assert (=> b!1534964 m!1417537))

(assert (=> b!1534934 d!160789))

(declare-fun d!160793 () Bool)

(declare-fun lt!664584 () Bool)

(declare-fun content!780 (List!35616) (Set (_ BitVec 64)))

(assert (=> d!160793 (= lt!664584 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!780 Nil!35613)))))

(declare-fun e!855384 () Bool)

(assert (=> d!160793 (= lt!664584 e!855384)))

(declare-fun res!1050585 () Bool)

(assert (=> d!160793 (=> (not res!1050585) (not e!855384))))

(assert (=> d!160793 (= res!1050585 (is-Cons!35612 Nil!35613))))

(assert (=> d!160793 (= (contains!10057 Nil!35613 #b0000000000000000000000000000000000000000000000000000000000000000) lt!664584)))

(declare-fun b!1534977 () Bool)

(declare-fun e!855385 () Bool)

(assert (=> b!1534977 (= e!855384 e!855385)))

(declare-fun res!1050586 () Bool)

(assert (=> b!1534977 (=> res!1050586 e!855385)))

(assert (=> b!1534977 (= res!1050586 (= (h!37075 Nil!35613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1534978 () Bool)

(assert (=> b!1534978 (= e!855385 (contains!10057 (t!50302 Nil!35613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160793 res!1050585) b!1534977))

(assert (= (and b!1534977 (not res!1050586)) b!1534978))

(declare-fun m!1417539 () Bool)

(assert (=> d!160793 m!1417539))

(declare-fun m!1417541 () Bool)

(assert (=> d!160793 m!1417541))

(declare-fun m!1417543 () Bool)

(assert (=> b!1534978 m!1417543))

(assert (=> b!1534933 d!160793))

(declare-fun d!160799 () Bool)

(declare-fun lt!664585 () Bool)

(assert (=> d!160799 (= lt!664585 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!780 Nil!35613)))))

(declare-fun e!855386 () Bool)

(assert (=> d!160799 (= lt!664585 e!855386)))

(declare-fun res!1050587 () Bool)

(assert (=> d!160799 (=> (not res!1050587) (not e!855386))))

(assert (=> d!160799 (= res!1050587 (is-Cons!35612 Nil!35613))))

(assert (=> d!160799 (= (contains!10057 Nil!35613 #b1000000000000000000000000000000000000000000000000000000000000000) lt!664585)))

(declare-fun b!1534979 () Bool)

(declare-fun e!855387 () Bool)

(assert (=> b!1534979 (= e!855386 e!855387)))

(declare-fun res!1050588 () Bool)

(assert (=> b!1534979 (=> res!1050588 e!855387)))

(assert (=> b!1534979 (= res!1050588 (= (h!37075 Nil!35613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1534980 () Bool)

(assert (=> b!1534980 (= e!855387 (contains!10057 (t!50302 Nil!35613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160799 res!1050587) b!1534979))

(assert (= (and b!1534979 (not res!1050588)) b!1534980))

(assert (=> d!160799 m!1417539))

(declare-fun m!1417545 () Bool)

(assert (=> d!160799 m!1417545))

(declare-fun m!1417547 () Bool)

(assert (=> b!1534980 m!1417547))

(assert (=> b!1534937 d!160799))

(declare-fun d!160801 () Bool)

(assert (=> d!160801 (= (validKeyInArray!0 (select (arr!49155 a!2792) j!64)) (and (not (= (select (arr!49155 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49155 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534936 d!160801))

(declare-fun d!160803 () Bool)

(assert (=> d!160803 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131020 d!160803))

(declare-fun d!160815 () Bool)

(assert (=> d!160815 (= (array_inv!38436 a!2792) (bvsge (size!49706 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131020 d!160815))

(push 1)

(assert (not d!160793))

(assert (not b!1534978))

(assert (not b!1534946))

(assert (not b!1534961))

(assert (not bm!68703))

(assert (not b!1534945))

(assert (not b!1534980))

(assert (not b!1534964))

(assert (not d!160799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

