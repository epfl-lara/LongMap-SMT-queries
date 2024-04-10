; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130602 () Bool)

(assert start!130602)

(declare-fun b!1532517 () Bool)

(declare-fun res!1049641 () Bool)

(declare-fun e!853860 () Bool)

(assert (=> b!1532517 (=> (not res!1049641) (not e!853860))))

(declare-datatypes ((array!101760 0))(
  ( (array!101761 (arr!49099 (Array (_ BitVec 32) (_ BitVec 64))) (size!49649 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101760)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101760 (_ BitVec 32)) Bool)

(assert (=> b!1532517 (= res!1049641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532518 () Bool)

(declare-fun res!1049639 () Bool)

(assert (=> b!1532518 (=> (not res!1049639) (not e!853860))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532518 (= res!1049639 (validKeyInArray!0 (select (arr!49099 a!2792) j!64)))))

(declare-fun res!1049640 () Bool)

(assert (=> start!130602 (=> (not res!1049640) (not e!853860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130602 (= res!1049640 (validMask!0 mask!2480))))

(assert (=> start!130602 e!853860))

(assert (=> start!130602 true))

(declare-fun array_inv!38127 (array!101760) Bool)

(assert (=> start!130602 (array_inv!38127 a!2792)))

(declare-fun b!1532519 () Bool)

(declare-fun res!1049642 () Bool)

(assert (=> b!1532519 (=> (not res!1049642) (not e!853860))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532519 (= res!1049642 (validKeyInArray!0 (select (arr!49099 a!2792) i!951)))))

(declare-fun b!1532520 () Bool)

(declare-fun res!1049643 () Bool)

(assert (=> b!1532520 (=> (not res!1049643) (not e!853860))))

(assert (=> b!1532520 (= res!1049643 (and (= (size!49649 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49649 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49649 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532521 () Bool)

(declare-datatypes ((List!35573 0))(
  ( (Nil!35570) (Cons!35569 (h!37014 (_ BitVec 64)) (t!50267 List!35573)) )
))
(declare-fun noDuplicate!2632 (List!35573) Bool)

(assert (=> b!1532521 (= e!853860 (not (noDuplicate!2632 Nil!35570)))))

(declare-fun b!1532522 () Bool)

(declare-fun res!1049644 () Bool)

(assert (=> b!1532522 (=> (not res!1049644) (not e!853860))))

(assert (=> b!1532522 (= res!1049644 (and (bvsle #b00000000000000000000000000000000 (size!49649 a!2792)) (bvslt (size!49649 a!2792) #b01111111111111111111111111111111)))))

(assert (= (and start!130602 res!1049640) b!1532520))

(assert (= (and b!1532520 res!1049643) b!1532519))

(assert (= (and b!1532519 res!1049642) b!1532518))

(assert (= (and b!1532518 res!1049639) b!1532517))

(assert (= (and b!1532517 res!1049641) b!1532522))

(assert (= (and b!1532522 res!1049644) b!1532521))

(declare-fun m!1415237 () Bool)

(assert (=> b!1532518 m!1415237))

(assert (=> b!1532518 m!1415237))

(declare-fun m!1415239 () Bool)

(assert (=> b!1532518 m!1415239))

(declare-fun m!1415241 () Bool)

(assert (=> b!1532521 m!1415241))

(declare-fun m!1415243 () Bool)

(assert (=> b!1532519 m!1415243))

(assert (=> b!1532519 m!1415243))

(declare-fun m!1415245 () Bool)

(assert (=> b!1532519 m!1415245))

(declare-fun m!1415247 () Bool)

(assert (=> b!1532517 m!1415247))

(declare-fun m!1415249 () Bool)

(assert (=> start!130602 m!1415249))

(declare-fun m!1415251 () Bool)

(assert (=> start!130602 m!1415251))

(push 1)

(assert (not start!130602))

(assert (not b!1532519))

(assert (not b!1532521))

(assert (not b!1532517))

(assert (not b!1532518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160081 () Bool)

(assert (=> d!160081 (= (validKeyInArray!0 (select (arr!49099 a!2792) i!951)) (and (not (= (select (arr!49099 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49099 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532519 d!160081))

(declare-fun d!160085 () Bool)

(declare-fun res!1049661 () Bool)

(declare-fun e!853878 () Bool)

(assert (=> d!160085 (=> res!1049661 e!853878)))

(assert (=> d!160085 (= res!1049661 (is-Nil!35570 Nil!35570))))

(assert (=> d!160085 (= (noDuplicate!2632 Nil!35570) e!853878)))

(declare-fun b!1532539 () Bool)

(declare-fun e!853879 () Bool)

(assert (=> b!1532539 (= e!853878 e!853879)))

(declare-fun res!1049662 () Bool)

(assert (=> b!1532539 (=> (not res!1049662) (not e!853879))))

(declare-fun contains!10004 (List!35573 (_ BitVec 64)) Bool)

(assert (=> b!1532539 (= res!1049662 (not (contains!10004 (t!50267 Nil!35570) (h!37014 Nil!35570))))))

(declare-fun b!1532540 () Bool)

(assert (=> b!1532540 (= e!853879 (noDuplicate!2632 (t!50267 Nil!35570)))))

(assert (= (and d!160085 (not res!1049661)) b!1532539))

(assert (= (and b!1532539 res!1049662) b!1532540))

(declare-fun m!1415261 () Bool)

(assert (=> b!1532539 m!1415261))

(declare-fun m!1415263 () Bool)

(assert (=> b!1532540 m!1415263))

(assert (=> b!1532521 d!160085))

(declare-fun bm!68562 () Bool)

(declare-fun call!68565 () Bool)

(assert (=> bm!68562 (= call!68565 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532549 () Bool)

(declare-fun e!853886 () Bool)

(declare-fun e!853887 () Bool)

(assert (=> b!1532549 (= e!853886 e!853887)))

(declare-fun lt!663671 () (_ BitVec 64))

(assert (=> b!1532549 (= lt!663671 (select (arr!49099 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51296 0))(
  ( (Unit!51297) )
))
(declare-fun lt!663673 () Unit!51296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101760 (_ BitVec 64) (_ BitVec 32)) Unit!51296)

(assert (=> b!1532549 (= lt!663673 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663671 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532549 (arrayContainsKey!0 a!2792 lt!663671 #b00000000000000000000000000000000)))

(declare-fun lt!663672 () Unit!51296)

(assert (=> b!1532549 (= lt!663672 lt!663673)))

(declare-fun res!1049667 () Bool)

(declare-datatypes ((SeekEntryResult!13254 0))(
  ( (MissingZero!13254 (index!55411 (_ BitVec 32))) (Found!13254 (index!55412 (_ BitVec 32))) (Intermediate!13254 (undefined!14066 Bool) (index!55413 (_ BitVec 32)) (x!137128 (_ BitVec 32))) (Undefined!13254) (MissingVacant!13254 (index!55414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101760 (_ BitVec 32)) SeekEntryResult!13254)

(assert (=> b!1532549 (= res!1049667 (= (seekEntryOrOpen!0 (select (arr!49099 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13254 #b00000000000000000000000000000000)))))

(assert (=> b!1532549 (=> (not res!1049667) (not e!853887))))

(declare-fun b!1532550 () Bool)

(assert (=> b!1532550 (= e!853886 call!68565)))

(declare-fun d!160087 () Bool)

(declare-fun res!1049668 () Bool)

(declare-fun e!853888 () Bool)

(assert (=> d!160087 (=> res!1049668 e!853888)))

(assert (=> d!160087 (= res!1049668 (bvsge #b00000000000000000000000000000000 (size!49649 a!2792)))))

(assert (=> d!160087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853888)))

(declare-fun b!1532551 () Bool)

(assert (=> b!1532551 (= e!853888 e!853886)))

(declare-fun c!140999 () Bool)

(assert (=> b!1532551 (= c!140999 (validKeyInArray!0 (select (arr!49099 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532552 () Bool)

(assert (=> b!1532552 (= e!853887 call!68565)))

(assert (= (and d!160087 (not res!1049668)) b!1532551))

(assert (= (and b!1532551 c!140999) b!1532549))

(assert (= (and b!1532551 (not c!140999)) b!1532550))

(assert (= (and b!1532549 res!1049667) b!1532552))

(assert (= (or b!1532552 b!1532550) bm!68562))

(declare-fun m!1415265 () Bool)

(assert (=> bm!68562 m!1415265))

(declare-fun m!1415267 () Bool)

(assert (=> b!1532549 m!1415267))

(declare-fun m!1415269 () Bool)

(assert (=> b!1532549 m!1415269))

(declare-fun m!1415271 () Bool)

(assert (=> b!1532549 m!1415271))

(assert (=> b!1532549 m!1415267))

(declare-fun m!1415273 () Bool)

(assert (=> b!1532549 m!1415273))

(assert (=> b!1532551 m!1415267))

(assert (=> b!1532551 m!1415267))

(declare-fun m!1415275 () Bool)

(assert (=> b!1532551 m!1415275))

(assert (=> b!1532517 d!160087))

(declare-fun d!160093 () Bool)

(assert (=> d!160093 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130602 d!160093))

(declare-fun d!160101 () Bool)

(assert (=> d!160101 (= (array_inv!38127 a!2792) (bvsge (size!49649 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130602 d!160101))

(declare-fun d!160103 () Bool)

(assert (=> d!160103 (= (validKeyInArray!0 (select (arr!49099 a!2792) j!64)) (and (not (= (select (arr!49099 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49099 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532518 d!160103))

(push 1)

