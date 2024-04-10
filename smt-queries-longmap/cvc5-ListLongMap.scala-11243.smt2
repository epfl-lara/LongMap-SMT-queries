; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131090 () Bool)

(assert start!131090)

(declare-fun b!1538053 () Bool)

(declare-fun e!855837 () Bool)

(declare-fun e!855836 () Bool)

(assert (=> b!1538053 (= e!855837 e!855836)))

(declare-fun res!1055143 () Bool)

(assert (=> b!1538053 (=> (not res!1055143) (not e!855836))))

(declare-datatypes ((array!102188 0))(
  ( (array!102189 (arr!49310 (Array (_ BitVec 32) (_ BitVec 64))) (size!49860 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102188)

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13436 0))(
  ( (MissingZero!13436 (index!56139 (_ BitVec 32))) (Found!13436 (index!56140 (_ BitVec 32))) (Intermediate!13436 (undefined!14248 Bool) (index!56141 (_ BitVec 32)) (x!137878 (_ BitVec 32))) (Undefined!13436) (MissingVacant!13436 (index!56142 (_ BitVec 32))) )
))
(declare-fun lt!664822 () SeekEntryResult!13436)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538053 (= res!1055143 (and (= lt!664822 (Found!13436 j!64)) (= (select (arr!49310 a!2792) index!463) (select (arr!49310 a!2792) j!64))))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102188 (_ BitVec 32)) SeekEntryResult!13436)

(assert (=> b!1538053 (= lt!664822 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49310 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538054 () Bool)

(declare-fun res!1055145 () Bool)

(assert (=> b!1538054 (=> (not res!1055145) (not e!855837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538054 (= res!1055145 (validKeyInArray!0 (select (arr!49310 a!2792) j!64)))))

(declare-fun b!1538055 () Bool)

(declare-fun res!1055142 () Bool)

(assert (=> b!1538055 (=> (not res!1055142) (not e!855837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102188 (_ BitVec 32)) Bool)

(assert (=> b!1538055 (= res!1055142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538056 () Bool)

(declare-fun res!1055139 () Bool)

(assert (=> b!1538056 (=> (not res!1055139) (not e!855837))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538056 (= res!1055139 (and (= (size!49860 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49860 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49860 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538057 () Bool)

(declare-fun res!1055144 () Bool)

(assert (=> b!1538057 (=> (not res!1055144) (not e!855837))))

(assert (=> b!1538057 (= res!1055144 (validKeyInArray!0 (select (arr!49310 a!2792) i!951)))))

(declare-fun res!1055140 () Bool)

(assert (=> start!131090 (=> (not res!1055140) (not e!855837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131090 (= res!1055140 (validMask!0 mask!2480))))

(assert (=> start!131090 e!855837))

(assert (=> start!131090 true))

(declare-fun array_inv!38338 (array!102188) Bool)

(assert (=> start!131090 (array_inv!38338 a!2792)))

(declare-fun b!1538058 () Bool)

(assert (=> b!1538058 (= e!855836 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49310 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102189 (store (arr!49310 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49860 a!2792)) mask!2480) lt!664822)))))

(declare-fun b!1538059 () Bool)

(declare-fun res!1055146 () Bool)

(assert (=> b!1538059 (=> (not res!1055146) (not e!855837))))

(assert (=> b!1538059 (= res!1055146 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49860 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49860 a!2792)) (= (select (arr!49310 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538060 () Bool)

(declare-fun res!1055141 () Bool)

(assert (=> b!1538060 (=> (not res!1055141) (not e!855837))))

(declare-datatypes ((List!35784 0))(
  ( (Nil!35781) (Cons!35780 (h!37225 (_ BitVec 64)) (t!50478 List!35784)) )
))
(declare-fun arrayNoDuplicates!0 (array!102188 (_ BitVec 32) List!35784) Bool)

(assert (=> b!1538060 (= res!1055141 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35781))))

(assert (= (and start!131090 res!1055140) b!1538056))

(assert (= (and b!1538056 res!1055139) b!1538057))

(assert (= (and b!1538057 res!1055144) b!1538054))

(assert (= (and b!1538054 res!1055145) b!1538055))

(assert (= (and b!1538055 res!1055142) b!1538060))

(assert (= (and b!1538060 res!1055141) b!1538059))

(assert (= (and b!1538059 res!1055146) b!1538053))

(assert (= (and b!1538053 res!1055143) b!1538058))

(declare-fun m!1420551 () Bool)

(assert (=> b!1538058 m!1420551))

(declare-fun m!1420553 () Bool)

(assert (=> b!1538058 m!1420553))

(assert (=> b!1538058 m!1420553))

(declare-fun m!1420555 () Bool)

(assert (=> b!1538058 m!1420555))

(declare-fun m!1420557 () Bool)

(assert (=> b!1538060 m!1420557))

(declare-fun m!1420559 () Bool)

(assert (=> b!1538055 m!1420559))

(declare-fun m!1420561 () Bool)

(assert (=> b!1538059 m!1420561))

(declare-fun m!1420563 () Bool)

(assert (=> b!1538054 m!1420563))

(assert (=> b!1538054 m!1420563))

(declare-fun m!1420565 () Bool)

(assert (=> b!1538054 m!1420565))

(declare-fun m!1420567 () Bool)

(assert (=> b!1538053 m!1420567))

(assert (=> b!1538053 m!1420563))

(assert (=> b!1538053 m!1420563))

(declare-fun m!1420569 () Bool)

(assert (=> b!1538053 m!1420569))

(declare-fun m!1420571 () Bool)

(assert (=> start!131090 m!1420571))

(declare-fun m!1420573 () Bool)

(assert (=> start!131090 m!1420573))

(declare-fun m!1420575 () Bool)

(assert (=> b!1538057 m!1420575))

(assert (=> b!1538057 m!1420575))

(declare-fun m!1420577 () Bool)

(assert (=> b!1538057 m!1420577))

(push 1)

(assert (not b!1538057))

(assert (not b!1538058))

(assert (not b!1538054))

(assert (not b!1538060))

(assert (not start!131090))

(assert (not b!1538055))

(assert (not b!1538053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1538163 () Bool)

(declare-fun e!855892 () Bool)

(declare-fun call!68586 () Bool)

(assert (=> b!1538163 (= e!855892 call!68586)))

(declare-fun b!1538164 () Bool)

(declare-fun e!855893 () Bool)

(declare-fun contains!10011 (List!35784 (_ BitVec 64)) Bool)

(assert (=> b!1538164 (= e!855893 (contains!10011 Nil!35781 (select (arr!49310 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160313 () Bool)

(declare-fun res!1055214 () Bool)

(declare-fun e!855894 () Bool)

(assert (=> d!160313 (=> res!1055214 e!855894)))

(assert (=> d!160313 (= res!1055214 (bvsge #b00000000000000000000000000000000 (size!49860 a!2792)))))

(assert (=> d!160313 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35781) e!855894)))

(declare-fun bm!68583 () Bool)

(declare-fun c!141032 () Bool)

(assert (=> bm!68583 (= call!68586 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141032 (Cons!35780 (select (arr!49310 a!2792) #b00000000000000000000000000000000) Nil!35781) Nil!35781)))))

(declare-fun b!1538165 () Bool)

(declare-fun e!855895 () Bool)

(assert (=> b!1538165 (= e!855894 e!855895)))

(declare-fun res!1055213 () Bool)

(assert (=> b!1538165 (=> (not res!1055213) (not e!855895))))

(assert (=> b!1538165 (= res!1055213 (not e!855893))))

(declare-fun res!1055215 () Bool)

(assert (=> b!1538165 (=> (not res!1055215) (not e!855893))))

(assert (=> b!1538165 (= res!1055215 (validKeyInArray!0 (select (arr!49310 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1538166 () Bool)

(assert (=> b!1538166 (= e!855892 call!68586)))

(declare-fun b!1538167 () Bool)

(assert (=> b!1538167 (= e!855895 e!855892)))

(assert (=> b!1538167 (= c!141032 (validKeyInArray!0 (select (arr!49310 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160313 (not res!1055214)) b!1538165))

(assert (= (and b!1538165 res!1055215) b!1538164))

(assert (= (and b!1538165 res!1055213) b!1538167))

(assert (= (and b!1538167 c!141032) b!1538166))

(assert (= (and b!1538167 (not c!141032)) b!1538163))

(assert (= (or b!1538166 b!1538163) bm!68583))

(declare-fun m!1420663 () Bool)

(assert (=> b!1538164 m!1420663))

(assert (=> b!1538164 m!1420663))

(declare-fun m!1420665 () Bool)

(assert (=> b!1538164 m!1420665))

(assert (=> bm!68583 m!1420663))

(declare-fun m!1420667 () Bool)

(assert (=> bm!68583 m!1420667))

(assert (=> b!1538165 m!1420663))

(assert (=> b!1538165 m!1420663))

(declare-fun m!1420669 () Bool)

(assert (=> b!1538165 m!1420669))

(assert (=> b!1538167 m!1420663))

(assert (=> b!1538167 m!1420663))

(assert (=> b!1538167 m!1420669))

(assert (=> b!1538060 d!160313))

(declare-fun b!1538195 () Bool)

(declare-fun e!855916 () Bool)

(declare-fun e!855914 () Bool)

(assert (=> b!1538195 (= e!855916 e!855914)))

(declare-fun c!141044 () Bool)

(assert (=> b!1538195 (= c!141044 (validKeyInArray!0 (select (arr!49310 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1538196 () Bool)

(declare-fun e!855915 () Bool)

(assert (=> b!1538196 (= e!855914 e!855915)))

(declare-fun lt!664857 () (_ BitVec 64))

(assert (=> b!1538196 (= lt!664857 (select (arr!49310 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51404 0))(
  ( (Unit!51405) )
))
(declare-fun lt!664856 () Unit!51404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102188 (_ BitVec 64) (_ BitVec 32)) Unit!51404)

