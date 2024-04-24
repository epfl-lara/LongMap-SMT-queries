; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130980 () Bool)

(assert start!130980)

(declare-fun b!1534773 () Bool)

(declare-fun e!855267 () Bool)

(declare-datatypes ((List!35611 0))(
  ( (Nil!35608) (Cons!35607 (h!37070 (_ BitVec 64)) (t!50297 List!35611)) )
))
(declare-fun noDuplicate!2647 (List!35611) Bool)

(assert (=> b!1534773 (= e!855267 (not (noDuplicate!2647 Nil!35608)))))

(declare-fun res!1050410 () Bool)

(assert (=> start!130980 (=> (not res!1050410) (not e!855267))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130980 (= res!1050410 (validMask!0 mask!2480))))

(assert (=> start!130980 e!855267))

(assert (=> start!130980 true))

(declare-datatypes ((array!101875 0))(
  ( (array!101876 (arr!49150 (Array (_ BitVec 32) (_ BitVec 64))) (size!49701 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101875)

(declare-fun array_inv!38431 (array!101875) Bool)

(assert (=> start!130980 (array_inv!38431 a!2792)))

(declare-fun b!1534774 () Bool)

(declare-fun res!1050409 () Bool)

(assert (=> b!1534774 (=> (not res!1050409) (not e!855267))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534774 (= res!1050409 (validKeyInArray!0 (select (arr!49150 a!2792) j!64)))))

(declare-fun b!1534775 () Bool)

(declare-fun res!1050414 () Bool)

(assert (=> b!1534775 (=> (not res!1050414) (not e!855267))))

(assert (=> b!1534775 (= res!1050414 (and (bvsle #b00000000000000000000000000000000 (size!49701 a!2792)) (bvslt (size!49701 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1534776 () Bool)

(declare-fun res!1050413 () Bool)

(assert (=> b!1534776 (=> (not res!1050413) (not e!855267))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534776 (= res!1050413 (validKeyInArray!0 (select (arr!49150 a!2792) i!951)))))

(declare-fun b!1534777 () Bool)

(declare-fun res!1050412 () Bool)

(assert (=> b!1534777 (=> (not res!1050412) (not e!855267))))

(assert (=> b!1534777 (= res!1050412 (and (= (size!49701 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49701 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49701 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534778 () Bool)

(declare-fun res!1050411 () Bool)

(assert (=> b!1534778 (=> (not res!1050411) (not e!855267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101875 (_ BitVec 32)) Bool)

(assert (=> b!1534778 (= res!1050411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130980 res!1050410) b!1534777))

(assert (= (and b!1534777 res!1050412) b!1534776))

(assert (= (and b!1534776 res!1050413) b!1534774))

(assert (= (and b!1534774 res!1050409) b!1534778))

(assert (= (and b!1534778 res!1050411) b!1534775))

(assert (= (and b!1534775 res!1050414) b!1534773))

(declare-fun m!1417363 () Bool)

(assert (=> b!1534774 m!1417363))

(assert (=> b!1534774 m!1417363))

(declare-fun m!1417365 () Bool)

(assert (=> b!1534774 m!1417365))

(declare-fun m!1417367 () Bool)

(assert (=> b!1534773 m!1417367))

(declare-fun m!1417369 () Bool)

(assert (=> start!130980 m!1417369))

(declare-fun m!1417371 () Bool)

(assert (=> start!130980 m!1417371))

(declare-fun m!1417373 () Bool)

(assert (=> b!1534776 m!1417373))

(assert (=> b!1534776 m!1417373))

(declare-fun m!1417375 () Bool)

(assert (=> b!1534776 m!1417375))

(declare-fun m!1417377 () Bool)

(assert (=> b!1534778 m!1417377))

(check-sat (not start!130980) (not b!1534773) (not b!1534774) (not b!1534776) (not b!1534778))
(check-sat)
(get-model)

(declare-fun d!160741 () Bool)

(assert (=> d!160741 (= (validKeyInArray!0 (select (arr!49150 a!2792) i!951)) (and (not (= (select (arr!49150 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49150 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534776 d!160741))

(declare-fun d!160743 () Bool)

(assert (=> d!160743 (= (validKeyInArray!0 (select (arr!49150 a!2792) j!64)) (and (not (= (select (arr!49150 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49150 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534774 d!160743))

(declare-fun d!160745 () Bool)

(assert (=> d!160745 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130980 d!160745))

(declare-fun d!160753 () Bool)

(assert (=> d!160753 (= (array_inv!38431 a!2792) (bvsge (size!49701 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130980 d!160753))

(declare-fun bm!68697 () Bool)

(declare-fun call!68700 () Bool)

(assert (=> bm!68697 (= call!68700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1534841 () Bool)

(declare-fun e!855302 () Bool)

(assert (=> b!1534841 (= e!855302 call!68700)))

(declare-fun d!160755 () Bool)

(declare-fun res!1050467 () Bool)

(declare-fun e!855303 () Bool)

(assert (=> d!160755 (=> res!1050467 e!855303)))

(assert (=> d!160755 (= res!1050467 (bvsge #b00000000000000000000000000000000 (size!49701 a!2792)))))

(assert (=> d!160755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855303)))

(declare-fun b!1534842 () Bool)

(declare-fun e!855304 () Bool)

(assert (=> b!1534842 (= e!855304 e!855302)))

(declare-fun lt!664557 () (_ BitVec 64))

(assert (=> b!1534842 (= lt!664557 (select (arr!49150 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51225 0))(
  ( (Unit!51226) )
))
(declare-fun lt!664556 () Unit!51225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101875 (_ BitVec 64) (_ BitVec 32)) Unit!51225)

(assert (=> b!1534842 (= lt!664556 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664557 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1534842 (arrayContainsKey!0 a!2792 lt!664557 #b00000000000000000000000000000000)))

(declare-fun lt!664555 () Unit!51225)

(assert (=> b!1534842 (= lt!664555 lt!664556)))

(declare-fun res!1050468 () Bool)

(declare-datatypes ((SeekEntryResult!13201 0))(
  ( (MissingZero!13201 (index!55199 (_ BitVec 32))) (Found!13201 (index!55200 (_ BitVec 32))) (Intermediate!13201 (undefined!14013 Bool) (index!55201 (_ BitVec 32)) (x!137122 (_ BitVec 32))) (Undefined!13201) (MissingVacant!13201 (index!55202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101875 (_ BitVec 32)) SeekEntryResult!13201)

(assert (=> b!1534842 (= res!1050468 (= (seekEntryOrOpen!0 (select (arr!49150 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13201 #b00000000000000000000000000000000)))))

(assert (=> b!1534842 (=> (not res!1050468) (not e!855302))))

(declare-fun b!1534843 () Bool)

(assert (=> b!1534843 (= e!855304 call!68700)))

(declare-fun b!1534844 () Bool)

(assert (=> b!1534844 (= e!855303 e!855304)))

(declare-fun c!141757 () Bool)

(assert (=> b!1534844 (= c!141757 (validKeyInArray!0 (select (arr!49150 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160755 (not res!1050467)) b!1534844))

(assert (= (and b!1534844 c!141757) b!1534842))

(assert (= (and b!1534844 (not c!141757)) b!1534843))

(assert (= (and b!1534842 res!1050468) b!1534841))

(assert (= (or b!1534841 b!1534843) bm!68697))

(declare-fun m!1417427 () Bool)

(assert (=> bm!68697 m!1417427))

(declare-fun m!1417429 () Bool)

(assert (=> b!1534842 m!1417429))

(declare-fun m!1417431 () Bool)

(assert (=> b!1534842 m!1417431))

(declare-fun m!1417433 () Bool)

(assert (=> b!1534842 m!1417433))

(assert (=> b!1534842 m!1417429))

(declare-fun m!1417435 () Bool)

(assert (=> b!1534842 m!1417435))

(assert (=> b!1534844 m!1417429))

(assert (=> b!1534844 m!1417429))

(declare-fun m!1417437 () Bool)

(assert (=> b!1534844 m!1417437))

(assert (=> b!1534778 d!160755))

(declare-fun d!160767 () Bool)

(declare-fun res!1050477 () Bool)

(declare-fun e!855315 () Bool)

(assert (=> d!160767 (=> res!1050477 e!855315)))

(get-info :version)

(assert (=> d!160767 (= res!1050477 ((_ is Nil!35608) Nil!35608))))

(assert (=> d!160767 (= (noDuplicate!2647 Nil!35608) e!855315)))

(declare-fun b!1534857 () Bool)

(declare-fun e!855316 () Bool)

(assert (=> b!1534857 (= e!855315 e!855316)))

(declare-fun res!1050478 () Bool)

(assert (=> b!1534857 (=> (not res!1050478) (not e!855316))))

(declare-fun contains!10054 (List!35611 (_ BitVec 64)) Bool)

(assert (=> b!1534857 (= res!1050478 (not (contains!10054 (t!50297 Nil!35608) (h!37070 Nil!35608))))))

(declare-fun b!1534858 () Bool)

(assert (=> b!1534858 (= e!855316 (noDuplicate!2647 (t!50297 Nil!35608)))))

(assert (= (and d!160767 (not res!1050477)) b!1534857))

(assert (= (and b!1534857 res!1050478) b!1534858))

(declare-fun m!1417439 () Bool)

(assert (=> b!1534857 m!1417439))

(declare-fun m!1417441 () Bool)

(assert (=> b!1534858 m!1417441))

(assert (=> b!1534773 d!160767))

(check-sat (not b!1534844) (not b!1534858) (not b!1534842) (not b!1534857) (not bm!68697))
(check-sat)
