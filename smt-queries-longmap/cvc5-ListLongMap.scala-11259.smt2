; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131306 () Bool)

(assert start!131306)

(declare-fun b!1539767 () Bool)

(declare-fun e!856416 () Bool)

(declare-fun e!856417 () Bool)

(assert (=> b!1539767 (= e!856416 e!856417)))

(declare-fun res!1056571 () Bool)

(assert (=> b!1539767 (=> (not res!1056571) (not e!856417))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102293 0))(
  ( (array!102294 (arr!49358 (Array (_ BitVec 32) (_ BitVec 64))) (size!49908 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102293)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13484 0))(
  ( (MissingZero!13484 (index!56331 (_ BitVec 32))) (Found!13484 (index!56332 (_ BitVec 32))) (Intermediate!13484 (undefined!14296 Bool) (index!56333 (_ BitVec 32)) (x!138069 (_ BitVec 32))) (Undefined!13484) (MissingVacant!13484 (index!56334 (_ BitVec 32))) )
))
(declare-fun lt!665127 () SeekEntryResult!13484)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102293 (_ BitVec 32)) SeekEntryResult!13484)

(assert (=> b!1539767 (= res!1056571 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49358 a!2792) j!64) a!2792 mask!2480) lt!665127))))

(assert (=> b!1539767 (= lt!665127 (Found!13484 j!64))))

(declare-fun b!1539768 () Bool)

(declare-fun e!856415 () Bool)

(assert (=> b!1539768 (= e!856417 e!856415)))

(declare-fun res!1056569 () Bool)

(assert (=> b!1539768 (=> (not res!1056569) (not e!856415))))

(declare-fun lt!665128 () (_ BitVec 32))

(assert (=> b!1539768 (= res!1056569 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665128 #b00000000000000000000000000000000) (bvslt lt!665128 (size!49908 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539768 (= lt!665128 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539769 () Bool)

(declare-fun res!1056570 () Bool)

(assert (=> b!1539769 (=> (not res!1056570) (not e!856416))))

(assert (=> b!1539769 (= res!1056570 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49908 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49908 a!2792)) (= (select (arr!49358 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539770 () Bool)

(declare-fun res!1056566 () Bool)

(assert (=> b!1539770 (=> (not res!1056566) (not e!856416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102293 (_ BitVec 32)) Bool)

(assert (=> b!1539770 (= res!1056566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539771 () Bool)

(declare-fun res!1056565 () Bool)

(assert (=> b!1539771 (=> (not res!1056565) (not e!856416))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539771 (= res!1056565 (and (= (size!49908 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49908 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49908 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539772 () Bool)

(declare-fun res!1056573 () Bool)

(assert (=> b!1539772 (=> (not res!1056573) (not e!856416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539772 (= res!1056573 (validKeyInArray!0 (select (arr!49358 a!2792) i!951)))))

(declare-fun b!1539774 () Bool)

(declare-fun res!1056567 () Bool)

(assert (=> b!1539774 (=> (not res!1056567) (not e!856416))))

(assert (=> b!1539774 (= res!1056567 (validKeyInArray!0 (select (arr!49358 a!2792) j!64)))))

(declare-fun b!1539775 () Bool)

(declare-fun res!1056568 () Bool)

(assert (=> b!1539775 (=> (not res!1056568) (not e!856416))))

(declare-datatypes ((List!35832 0))(
  ( (Nil!35829) (Cons!35828 (h!37273 (_ BitVec 64)) (t!50526 List!35832)) )
))
(declare-fun arrayNoDuplicates!0 (array!102293 (_ BitVec 32) List!35832) Bool)

(assert (=> b!1539775 (= res!1056568 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35829))))

(declare-fun b!1539776 () Bool)

(assert (=> b!1539776 (= e!856415 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665128 vacantIndex!5 (select (arr!49358 a!2792) j!64) a!2792 mask!2480) lt!665127)))))

(declare-fun res!1056572 () Bool)

(assert (=> start!131306 (=> (not res!1056572) (not e!856416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131306 (= res!1056572 (validMask!0 mask!2480))))

(assert (=> start!131306 e!856416))

(assert (=> start!131306 true))

(declare-fun array_inv!38386 (array!102293) Bool)

(assert (=> start!131306 (array_inv!38386 a!2792)))

(declare-fun b!1539773 () Bool)

(declare-fun res!1056574 () Bool)

(assert (=> b!1539773 (=> (not res!1056574) (not e!856417))))

(assert (=> b!1539773 (= res!1056574 (not (= (select (arr!49358 a!2792) index!463) (select (arr!49358 a!2792) j!64))))))

(assert (= (and start!131306 res!1056572) b!1539771))

(assert (= (and b!1539771 res!1056565) b!1539772))

(assert (= (and b!1539772 res!1056573) b!1539774))

(assert (= (and b!1539774 res!1056567) b!1539770))

(assert (= (and b!1539770 res!1056566) b!1539775))

(assert (= (and b!1539775 res!1056568) b!1539769))

(assert (= (and b!1539769 res!1056570) b!1539767))

(assert (= (and b!1539767 res!1056571) b!1539773))

(assert (= (and b!1539773 res!1056574) b!1539768))

(assert (= (and b!1539768 res!1056569) b!1539776))

(declare-fun m!1421955 () Bool)

(assert (=> b!1539773 m!1421955))

(declare-fun m!1421957 () Bool)

(assert (=> b!1539773 m!1421957))

(assert (=> b!1539767 m!1421957))

(assert (=> b!1539767 m!1421957))

(declare-fun m!1421959 () Bool)

(assert (=> b!1539767 m!1421959))

(assert (=> b!1539776 m!1421957))

(assert (=> b!1539776 m!1421957))

(declare-fun m!1421961 () Bool)

(assert (=> b!1539776 m!1421961))

(declare-fun m!1421963 () Bool)

(assert (=> b!1539768 m!1421963))

(declare-fun m!1421965 () Bool)

(assert (=> b!1539769 m!1421965))

(declare-fun m!1421967 () Bool)

(assert (=> b!1539772 m!1421967))

(assert (=> b!1539772 m!1421967))

(declare-fun m!1421969 () Bool)

(assert (=> b!1539772 m!1421969))

(declare-fun m!1421971 () Bool)

(assert (=> b!1539770 m!1421971))

(declare-fun m!1421973 () Bool)

(assert (=> start!131306 m!1421973))

(declare-fun m!1421975 () Bool)

(assert (=> start!131306 m!1421975))

(declare-fun m!1421977 () Bool)

(assert (=> b!1539775 m!1421977))

(assert (=> b!1539774 m!1421957))

(assert (=> b!1539774 m!1421957))

(declare-fun m!1421979 () Bool)

(assert (=> b!1539774 m!1421979))

(push 1)

(assert (not b!1539772))

(assert (not start!131306))

(assert (not b!1539767))

(assert (not b!1539775))

(assert (not b!1539770))

(assert (not b!1539768))

(assert (not b!1539776))

(assert (not b!1539774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1539884 () Bool)

(declare-fun e!856473 () Bool)

(declare-fun call!68640 () Bool)

(assert (=> b!1539884 (= e!856473 call!68640)))

(declare-fun bm!68637 () Bool)

(assert (=> bm!68637 (= call!68640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539886 () Bool)

(declare-fun e!856472 () Bool)

(assert (=> b!1539886 (= e!856472 call!68640)))

(declare-fun b!1539887 () Bool)

(declare-fun e!856474 () Bool)

(assert (=> b!1539887 (= e!856474 e!856472)))

(declare-fun c!141176 () Bool)

(assert (=> b!1539887 (= c!141176 (validKeyInArray!0 (select (arr!49358 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160485 () Bool)

(declare-fun res!1056648 () Bool)

(assert (=> d!160485 (=> res!1056648 e!856474)))

(assert (=> d!160485 (= res!1056648 (bvsge #b00000000000000000000000000000000 (size!49908 a!2792)))))

(assert (=> d!160485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856474)))

(declare-fun b!1539885 () Bool)

(assert (=> b!1539885 (= e!856472 e!856473)))

(declare-fun lt!665156 () (_ BitVec 64))

(assert (=> b!1539885 (= lt!665156 (select (arr!49358 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51418 0))(
  ( (Unit!51419) )
))
(declare-fun lt!665155 () Unit!51418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102293 (_ BitVec 64) (_ BitVec 32)) Unit!51418)

(assert (=> b!1539885 (= lt!665155 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665156 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539885 (arrayContainsKey!0 a!2792 lt!665156 #b00000000000000000000000000000000)))

(declare-fun lt!665157 () Unit!51418)

(assert (=> b!1539885 (= lt!665157 lt!665155)))

(declare-fun res!1056649 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102293 (_ BitVec 32)) SeekEntryResult!13484)

(assert (=> b!1539885 (= res!1056649 (= (seekEntryOrOpen!0 (select (arr!49358 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13484 #b00000000000000000000000000000000)))))

(assert (=> b!1539885 (=> (not res!1056649) (not e!856473))))

(assert (= (and d!160485 (not res!1056648)) b!1539887))

(assert (= (and b!1539887 c!141176) b!1539885))

(assert (= (and b!1539887 (not c!141176)) b!1539886))

(assert (= (and b!1539885 res!1056649) b!1539884))

(assert (= (or b!1539884 b!1539886) bm!68637))

(declare-fun m!1422057 () Bool)

(assert (=> bm!68637 m!1422057))

(declare-fun m!1422059 () Bool)

(assert (=> b!1539887 m!1422059))

(assert (=> b!1539887 m!1422059))

(declare-fun m!1422061 () Bool)

(assert (=> b!1539887 m!1422061))

(assert (=> b!1539885 m!1422059))

(declare-fun m!1422063 () Bool)

(assert (=> b!1539885 m!1422063))

(declare-fun m!1422065 () Bool)

(assert (=> b!1539885 m!1422065))

(assert (=> b!1539885 m!1422059))

(declare-fun m!1422067 () Bool)

(assert (=> b!1539885 m!1422067))

(assert (=> b!1539770 d!160485))

(declare-fun b!1539910 () Bool)

(declare-fun e!856489 () Bool)

(declare-fun call!68643 () Bool)

(assert (=> b!1539910 (= e!856489 call!68643)))

(declare-fun d!160491 () Bool)

(declare-fun res!1056656 () Bool)

(declare-fun e!856492 () Bool)

(assert (=> d!160491 (=> res!1056656 e!856492)))

(assert (=> d!160491 (= res!1056656 (bvsge #b00000000000000000000000000000000 (size!49908 a!2792)))))

(assert (=> d!160491 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35829) e!856492)))

(declare-fun bm!68640 () Bool)

(declare-fun c!141185 () Bool)

(assert (=> bm!68640 (= call!68643 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141185 (Cons!35828 (select (arr!49358 a!2792) #b00000000000000000000000000000000) Nil!35829) Nil!35829)))))

(declare-fun b!1539911 () Bool)

(declare-fun e!856490 () Bool)

(declare-fun contains!10017 (List!35832 (_ BitVec 64)) Bool)

(assert (=> b!1539911 (= e!856490 (contains!10017 Nil!35829 (select (arr!49358 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539912 () Bool)

(declare-fun e!856491 () Bool)

(assert (=> b!1539912 (= e!856492 e!856491)))

(declare-fun res!1056657 () Bool)

(assert (=> b!1539912 (=> (not res!1056657) (not e!856491))))

(assert (=> b!1539912 (= res!1056657 (not e!856490))))

(declare-fun res!1056658 () Bool)

(assert (=> b!1539912 (=> (not res!1056658) (not e!856490))))

(assert (=> b!1539912 (= res!1056658 (validKeyInArray!0 (select (arr!49358 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539913 () Bool)

(assert (=> b!1539913 (= e!856491 e!856489)))

(assert (=> b!1539913 (= c!141185 (validKeyInArray!0 (select (arr!49358 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539914 () Bool)

(assert (=> b!1539914 (= e!856489 call!68643)))

(assert (= (and d!160491 (not res!1056656)) b!1539912))

(assert (= (and b!1539912 res!1056658) b!1539911))

(assert (= (and b!1539912 res!1056657) b!1539913))

(assert (= (and b!1539913 c!141185) b!1539914))

(assert (= (and b!1539913 (not c!141185)) b!1539910))

(assert (= (or b!1539914 b!1539910) bm!68640))

(assert (=> bm!68640 m!1422059))

(declare-fun m!1422069 () Bool)

(assert (=> bm!68640 m!1422069))

(assert (=> b!1539911 m!1422059))

(assert (=> b!1539911 m!1422059))

(declare-fun m!1422071 () Bool)

(assert (=> b!1539911 m!1422071))

(assert (=> b!1539912 m!1422059))

(assert (=> b!1539912 m!1422059))

(assert (=> b!1539912 m!1422061))

(assert (=> b!1539913 m!1422059))

(assert (=> b!1539913 m!1422059))

(assert (=> b!1539913 m!1422061))

(assert (=> b!1539775 d!160491))

(declare-fun d!160497 () Bool)

(assert (=> d!160497 (= (validKeyInArray!0 (select (arr!49358 a!2792) j!64)) (and (not (= (select (arr!49358 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49358 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539774 d!160497))

(declare-fun d!160501 () Bool)

(declare-fun lt!665180 () (_ BitVec 32))

(assert (=> d!160501 (and (bvsge lt!665180 #b00000000000000000000000000000000) (bvslt lt!665180 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160501 (= lt!665180 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160501 (validMask!0 mask!2480)))

(assert (=> d!160501 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665180)))

(declare-fun bs!44207 () Bool)

(assert (= bs!44207 d!160501))

(declare-fun m!1422083 () Bool)

(assert (=> bs!44207 m!1422083))

(assert (=> bs!44207 m!1421973))

(assert (=> b!1539768 d!160501))

(declare-fun d!160505 () Bool)

(assert (=> d!160505 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131306 d!160505))

(declare-fun d!160517 () Bool)

(assert (=> d!160517 (= (array_inv!38386 a!2792) (bvsge (size!49908 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131306 d!160517))

(declare-fun b!1539974 () Bool)

(declare-fun e!856533 () SeekEntryResult!13484)

(assert (=> b!1539974 (= e!856533 Undefined!13484)))

(declare-fun b!1539975 () Bool)

(declare-fun c!141206 () Bool)

(declare-fun lt!665194 () (_ BitVec 64))

(assert (=> b!1539975 (= c!141206 (= lt!665194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856534 () SeekEntryResult!13484)

(declare-fun e!856532 () SeekEntryResult!13484)

(assert (=> b!1539975 (= e!856534 e!856532)))

(declare-fun b!1539976 () Bool)

(assert (=> b!1539976 (= e!856533 e!856534)))

(declare-fun c!141208 () Bool)

(assert (=> b!1539976 (= c!141208 (= lt!665194 (select (arr!49358 a!2792) j!64)))))

(declare-fun b!1539977 () Bool)

(assert (=> b!1539977 (= e!856534 (Found!13484 index!463))))

(declare-fun b!1539978 () Bool)

(assert (=> b!1539978 (= e!856532 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49358 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539979 () Bool)

(assert (=> b!1539979 (= e!856532 (MissingVacant!13484 vacantIndex!5))))

(declare-fun d!160519 () Bool)

(declare-fun lt!665195 () SeekEntryResult!13484)

(assert (=> d!160519 (and (or (is-Undefined!13484 lt!665195) (not (is-Found!13484 lt!665195)) (and (bvsge (index!56332 lt!665195) #b00000000000000000000000000000000) (bvslt (index!56332 lt!665195) (size!49908 a!2792)))) (or (is-Undefined!13484 lt!665195) (is-Found!13484 lt!665195) (not (is-MissingVacant!13484 lt!665195)) (not (= (index!56334 lt!665195) vacantIndex!5)) (and (bvsge (index!56334 lt!665195) #b00000000000000000000000000000000) (bvslt (index!56334 lt!665195) (size!49908 a!2792)))) (or (is-Undefined!13484 lt!665195) (ite (is-Found!13484 lt!665195) (= (select (arr!49358 a!2792) (index!56332 lt!665195)) (select (arr!49358 a!2792) j!64)) (and (is-MissingVacant!13484 lt!665195) (= (index!56334 lt!665195) vacantIndex!5) (= (select (arr!49358 a!2792) (index!56334 lt!665195)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160519 (= lt!665195 e!856533)))

(declare-fun c!141207 () Bool)

(assert (=> d!160519 (= c!141207 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160519 (= lt!665194 (select (arr!49358 a!2792) index!463))))

(assert (=> d!160519 (validMask!0 mask!2480)))

(assert (=> d!160519 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49358 a!2792) j!64) a!2792 mask!2480) lt!665195)))

(assert (= (and d!160519 c!141207) b!1539974))

(assert (= (and d!160519 (not c!141207)) b!1539976))

(assert (= (and b!1539976 c!141208) b!1539977))

(assert (= (and b!1539976 (not c!141208)) b!1539975))

(assert (= (and b!1539975 c!141206) b!1539979))

(assert (= (and b!1539975 (not c!141206)) b!1539978))

