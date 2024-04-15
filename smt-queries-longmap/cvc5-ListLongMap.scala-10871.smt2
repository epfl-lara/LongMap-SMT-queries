; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127380 () Bool)

(assert start!127380)

(declare-fun b!1497511 () Bool)

(declare-fun res!1018812 () Bool)

(declare-fun e!838535 () Bool)

(assert (=> b!1497511 (=> (not res!1018812) (not e!838535))))

(declare-datatypes ((array!99815 0))(
  ( (array!99816 (arr!48171 (Array (_ BitVec 32) (_ BitVec 64))) (size!48723 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99815)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497511 (= res!1018812 (validKeyInArray!0 (select (arr!48171 a!2850) j!87)))))

(declare-fun b!1497512 () Bool)

(declare-fun res!1018815 () Bool)

(assert (=> b!1497512 (=> (not res!1018815) (not e!838535))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497512 (= res!1018815 (validKeyInArray!0 (select (arr!48171 a!2850) i!996)))))

(declare-fun res!1018814 () Bool)

(assert (=> start!127380 (=> (not res!1018814) (not e!838535))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127380 (= res!1018814 (validMask!0 mask!2661))))

(assert (=> start!127380 e!838535))

(assert (=> start!127380 true))

(declare-fun array_inv!37404 (array!99815) Bool)

(assert (=> start!127380 (array_inv!37404 a!2850)))

(declare-fun b!1497513 () Bool)

(declare-fun res!1018813 () Bool)

(assert (=> b!1497513 (=> (not res!1018813) (not e!838535))))

(assert (=> b!1497513 (= res!1018813 (and (= (size!48723 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48723 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48723 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497514 () Bool)

(declare-fun res!1018811 () Bool)

(assert (=> b!1497514 (=> (not res!1018811) (not e!838535))))

(assert (=> b!1497514 (= res!1018811 (and (bvsle #b00000000000000000000000000000000 (size!48723 a!2850)) (bvslt (size!48723 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1497515 () Bool)

(declare-fun res!1018816 () Bool)

(assert (=> b!1497515 (=> (not res!1018816) (not e!838535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99815 (_ BitVec 32)) Bool)

(assert (=> b!1497515 (= res!1018816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497516 () Bool)

(declare-datatypes ((List!34741 0))(
  ( (Nil!34738) (Cons!34737 (h!36135 (_ BitVec 64)) (t!49427 List!34741)) )
))
(declare-fun noDuplicate!2642 (List!34741) Bool)

(assert (=> b!1497516 (= e!838535 (not (noDuplicate!2642 Nil!34738)))))

(assert (= (and start!127380 res!1018814) b!1497513))

(assert (= (and b!1497513 res!1018813) b!1497512))

(assert (= (and b!1497512 res!1018815) b!1497511))

(assert (= (and b!1497511 res!1018812) b!1497515))

(assert (= (and b!1497515 res!1018816) b!1497514))

(assert (= (and b!1497514 res!1018811) b!1497516))

(declare-fun m!1380053 () Bool)

(assert (=> b!1497511 m!1380053))

(assert (=> b!1497511 m!1380053))

(declare-fun m!1380055 () Bool)

(assert (=> b!1497511 m!1380055))

(declare-fun m!1380057 () Bool)

(assert (=> start!127380 m!1380057))

(declare-fun m!1380059 () Bool)

(assert (=> start!127380 m!1380059))

(declare-fun m!1380061 () Bool)

(assert (=> b!1497515 m!1380061))

(declare-fun m!1380063 () Bool)

(assert (=> b!1497516 m!1380063))

(declare-fun m!1380065 () Bool)

(assert (=> b!1497512 m!1380065))

(assert (=> b!1497512 m!1380065))

(declare-fun m!1380067 () Bool)

(assert (=> b!1497512 m!1380067))

(push 1)

(assert (not b!1497511))

(assert (not b!1497516))

(assert (not start!127380))

(assert (not b!1497515))

(assert (not b!1497512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1497535 () Bool)

(declare-fun e!838554 () Bool)

(declare-fun e!838553 () Bool)

(assert (=> b!1497535 (= e!838554 e!838553)))

(declare-fun lt!652260 () (_ BitVec 64))

(assert (=> b!1497535 (= lt!652260 (select (arr!48171 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50035 0))(
  ( (Unit!50036) )
))
(declare-fun lt!652261 () Unit!50035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99815 (_ BitVec 64) (_ BitVec 32)) Unit!50035)

(assert (=> b!1497535 (= lt!652261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652260 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497535 (arrayContainsKey!0 a!2850 lt!652260 #b00000000000000000000000000000000)))

(declare-fun lt!652262 () Unit!50035)

(assert (=> b!1497535 (= lt!652262 lt!652261)))

(declare-fun res!1018832 () Bool)

(declare-datatypes ((SeekEntryResult!12427 0))(
  ( (MissingZero!12427 (index!52100 (_ BitVec 32))) (Found!12427 (index!52101 (_ BitVec 32))) (Intermediate!12427 (undefined!13239 Bool) (index!52102 (_ BitVec 32)) (x!133736 (_ BitVec 32))) (Undefined!12427) (MissingVacant!12427 (index!52103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99815 (_ BitVec 32)) SeekEntryResult!12427)

(assert (=> b!1497535 (= res!1018832 (= (seekEntryOrOpen!0 (select (arr!48171 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12427 #b00000000000000000000000000000000)))))

(assert (=> b!1497535 (=> (not res!1018832) (not e!838553))))

(declare-fun b!1497536 () Bool)

(declare-fun call!68018 () Bool)

(assert (=> b!1497536 (= e!838554 call!68018)))

(declare-fun bm!68015 () Bool)

(assert (=> bm!68015 (= call!68018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497537 () Bool)

(assert (=> b!1497537 (= e!838553 call!68018)))

(declare-fun b!1497538 () Bool)

(declare-fun e!838552 () Bool)

(assert (=> b!1497538 (= e!838552 e!838554)))

(declare-fun c!138889 () Bool)

(assert (=> b!1497538 (= c!138889 (validKeyInArray!0 (select (arr!48171 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157219 () Bool)

(declare-fun res!1018831 () Bool)

(assert (=> d!157219 (=> res!1018831 e!838552)))

(assert (=> d!157219 (= res!1018831 (bvsge #b00000000000000000000000000000000 (size!48723 a!2850)))))

(assert (=> d!157219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838552)))

(assert (= (and d!157219 (not res!1018831)) b!1497538))

(assert (= (and b!1497538 c!138889) b!1497535))

(assert (= (and b!1497538 (not c!138889)) b!1497536))

(assert (= (and b!1497535 res!1018832) b!1497537))

(assert (= (or b!1497537 b!1497536) bm!68015))

(declare-fun m!1380073 () Bool)

(assert (=> b!1497535 m!1380073))

(declare-fun m!1380075 () Bool)

(assert (=> b!1497535 m!1380075))

(declare-fun m!1380077 () Bool)

(assert (=> b!1497535 m!1380077))

(assert (=> b!1497535 m!1380073))

(declare-fun m!1380081 () Bool)

(assert (=> b!1497535 m!1380081))

(declare-fun m!1380085 () Bool)

(assert (=> bm!68015 m!1380085))

(assert (=> b!1497538 m!1380073))

(assert (=> b!1497538 m!1380073))

(declare-fun m!1380087 () Bool)

(assert (=> b!1497538 m!1380087))

(assert (=> b!1497515 d!157219))

(declare-fun d!157231 () Bool)

(assert (=> d!157231 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127380 d!157231))

(declare-fun d!157233 () Bool)

(assert (=> d!157233 (= (array_inv!37404 a!2850) (bvsge (size!48723 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127380 d!157233))

(declare-fun d!157235 () Bool)

(assert (=> d!157235 (= (validKeyInArray!0 (select (arr!48171 a!2850) j!87)) (and (not (= (select (arr!48171 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48171 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497511 d!157235))

(declare-fun d!157237 () Bool)

(declare-fun res!1018849 () Bool)

(declare-fun e!838576 () Bool)

(assert (=> d!157237 (=> res!1018849 e!838576)))

(assert (=> d!157237 (= res!1018849 (is-Nil!34738 Nil!34738))))

(assert (=> d!157237 (= (noDuplicate!2642 Nil!34738) e!838576)))

(declare-fun b!1497565 () Bool)

(declare-fun e!838577 () Bool)

(assert (=> b!1497565 (= e!838576 e!838577)))

(declare-fun res!1018850 () Bool)

(assert (=> b!1497565 (=> (not res!1018850) (not e!838577))))

(declare-fun contains!9904 (List!34741 (_ BitVec 64)) Bool)

(assert (=> b!1497565 (= res!1018850 (not (contains!9904 (t!49427 Nil!34738) (h!36135 Nil!34738))))))

(declare-fun b!1497566 () Bool)

(assert (=> b!1497566 (= e!838577 (noDuplicate!2642 (t!49427 Nil!34738)))))

(assert (= (and d!157237 (not res!1018849)) b!1497565))

(assert (= (and b!1497565 res!1018850) b!1497566))

(declare-fun m!1380101 () Bool)

(assert (=> b!1497565 m!1380101))

(declare-fun m!1380103 () Bool)

(assert (=> b!1497566 m!1380103))

(assert (=> b!1497516 d!157237))

(declare-fun d!157243 () Bool)

(assert (=> d!157243 (= (validKeyInArray!0 (select (arr!48171 a!2850) i!996)) (and (not (= (select (arr!48171 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48171 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497512 d!157243))

(push 1)

(assert (not b!1497565))

(assert (not b!1497566))

(assert (not b!1497535))

(assert (not b!1497538))

(assert (not bm!68015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

