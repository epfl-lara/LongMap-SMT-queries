; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131016 () Bool)

(assert start!131016)

(declare-fun b!1537198 () Bool)

(declare-fun res!1054284 () Bool)

(declare-fun e!855530 () Bool)

(assert (=> b!1537198 (=> (not res!1054284) (not e!855530))))

(declare-datatypes ((array!102114 0))(
  ( (array!102115 (arr!49273 (Array (_ BitVec 32) (_ BitVec 64))) (size!49823 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102114)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537198 (= res!1054284 (not (= (select (arr!49273 a!2792) index!463) (select (arr!49273 a!2792) j!64))))))

(declare-fun b!1537199 () Bool)

(declare-fun res!1054294 () Bool)

(declare-fun e!855528 () Bool)

(assert (=> b!1537199 (=> (not res!1054294) (not e!855528))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537199 (= res!1054294 (validKeyInArray!0 (select (arr!49273 a!2792) i!951)))))

(declare-fun b!1537200 () Bool)

(declare-fun e!855532 () Bool)

(declare-fun e!855531 () Bool)

(assert (=> b!1537200 (= e!855532 e!855531)))

(declare-fun res!1054293 () Bool)

(assert (=> b!1537200 (=> (not res!1054293) (not e!855531))))

(declare-datatypes ((SeekEntryResult!13405 0))(
  ( (MissingZero!13405 (index!56015 (_ BitVec 32))) (Found!13405 (index!56016 (_ BitVec 32))) (Intermediate!13405 (undefined!14217 Bool) (index!56017 (_ BitVec 32)) (x!137743 (_ BitVec 32))) (Undefined!13405) (MissingVacant!13405 (index!56018 (_ BitVec 32))) )
))
(declare-fun lt!664627 () SeekEntryResult!13405)

(declare-fun lt!664628 () SeekEntryResult!13405)

(assert (=> b!1537200 (= res!1054293 (= lt!664627 lt!664628))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664629 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102114 (_ BitVec 32)) SeekEntryResult!13405)

(assert (=> b!1537200 (= lt!664627 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664629 vacantIndex!5 (select (arr!49273 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537201 () Bool)

(declare-fun res!1054287 () Bool)

(assert (=> b!1537201 (=> (not res!1054287) (not e!855528))))

(assert (=> b!1537201 (= res!1054287 (validKeyInArray!0 (select (arr!49273 a!2792) j!64)))))

(declare-fun b!1537202 () Bool)

(assert (=> b!1537202 (= e!855528 e!855530)))

(declare-fun res!1054291 () Bool)

(assert (=> b!1537202 (=> (not res!1054291) (not e!855530))))

(assert (=> b!1537202 (= res!1054291 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49273 a!2792) j!64) a!2792 mask!2480) lt!664628))))

(assert (=> b!1537202 (= lt!664628 (Found!13405 j!64))))

(declare-fun b!1537203 () Bool)

(declare-fun res!1054285 () Bool)

(assert (=> b!1537203 (=> (not res!1054285) (not e!855528))))

(assert (=> b!1537203 (= res!1054285 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49823 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49823 a!2792)) (= (select (arr!49273 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537204 () Bool)

(declare-fun res!1054288 () Bool)

(assert (=> b!1537204 (=> (not res!1054288) (not e!855528))))

(assert (=> b!1537204 (= res!1054288 (and (= (size!49823 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49823 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49823 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537206 () Bool)

(assert (=> b!1537206 (= e!855531 (not true))))

(assert (=> b!1537206 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664629 vacantIndex!5 (select (store (arr!49273 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102115 (store (arr!49273 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49823 a!2792)) mask!2480) lt!664627)))

(declare-datatypes ((Unit!51382 0))(
  ( (Unit!51383) )
))
(declare-fun lt!664630 () Unit!51382)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51382)

(assert (=> b!1537206 (= lt!664630 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664629 vacantIndex!5 mask!2480))))

(declare-fun b!1537207 () Bool)

(declare-fun res!1054289 () Bool)

(assert (=> b!1537207 (=> (not res!1054289) (not e!855528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102114 (_ BitVec 32)) Bool)

(assert (=> b!1537207 (= res!1054289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537208 () Bool)

(assert (=> b!1537208 (= e!855530 e!855532)))

(declare-fun res!1054290 () Bool)

(assert (=> b!1537208 (=> (not res!1054290) (not e!855532))))

(assert (=> b!1537208 (= res!1054290 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664629 #b00000000000000000000000000000000) (bvslt lt!664629 (size!49823 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537208 (= lt!664629 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1054292 () Bool)

(assert (=> start!131016 (=> (not res!1054292) (not e!855528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131016 (= res!1054292 (validMask!0 mask!2480))))

(assert (=> start!131016 e!855528))

(assert (=> start!131016 true))

(declare-fun array_inv!38301 (array!102114) Bool)

(assert (=> start!131016 (array_inv!38301 a!2792)))

(declare-fun b!1537205 () Bool)

(declare-fun res!1054286 () Bool)

(assert (=> b!1537205 (=> (not res!1054286) (not e!855528))))

(declare-datatypes ((List!35747 0))(
  ( (Nil!35744) (Cons!35743 (h!37188 (_ BitVec 64)) (t!50441 List!35747)) )
))
(declare-fun arrayNoDuplicates!0 (array!102114 (_ BitVec 32) List!35747) Bool)

(assert (=> b!1537205 (= res!1054286 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35744))))

(assert (= (and start!131016 res!1054292) b!1537204))

(assert (= (and b!1537204 res!1054288) b!1537199))

(assert (= (and b!1537199 res!1054294) b!1537201))

(assert (= (and b!1537201 res!1054287) b!1537207))

(assert (= (and b!1537207 res!1054289) b!1537205))

(assert (= (and b!1537205 res!1054286) b!1537203))

(assert (= (and b!1537203 res!1054285) b!1537202))

(assert (= (and b!1537202 res!1054291) b!1537198))

(assert (= (and b!1537198 res!1054284) b!1537208))

(assert (= (and b!1537208 res!1054290) b!1537200))

(assert (= (and b!1537200 res!1054293) b!1537206))

(declare-fun m!1419695 () Bool)

(assert (=> b!1537205 m!1419695))

(declare-fun m!1419697 () Bool)

(assert (=> b!1537199 m!1419697))

(assert (=> b!1537199 m!1419697))

(declare-fun m!1419699 () Bool)

(assert (=> b!1537199 m!1419699))

(declare-fun m!1419701 () Bool)

(assert (=> b!1537201 m!1419701))

(assert (=> b!1537201 m!1419701))

(declare-fun m!1419703 () Bool)

(assert (=> b!1537201 m!1419703))

(assert (=> b!1537200 m!1419701))

(assert (=> b!1537200 m!1419701))

(declare-fun m!1419705 () Bool)

(assert (=> b!1537200 m!1419705))

(declare-fun m!1419707 () Bool)

(assert (=> b!1537208 m!1419707))

(declare-fun m!1419709 () Bool)

(assert (=> b!1537198 m!1419709))

(assert (=> b!1537198 m!1419701))

(assert (=> b!1537202 m!1419701))

(assert (=> b!1537202 m!1419701))

(declare-fun m!1419711 () Bool)

(assert (=> b!1537202 m!1419711))

(declare-fun m!1419713 () Bool)

(assert (=> b!1537206 m!1419713))

(declare-fun m!1419715 () Bool)

(assert (=> b!1537206 m!1419715))

(assert (=> b!1537206 m!1419715))

(declare-fun m!1419717 () Bool)

(assert (=> b!1537206 m!1419717))

(declare-fun m!1419719 () Bool)

(assert (=> b!1537206 m!1419719))

(declare-fun m!1419721 () Bool)

(assert (=> b!1537203 m!1419721))

(declare-fun m!1419723 () Bool)

(assert (=> start!131016 m!1419723))

(declare-fun m!1419725 () Bool)

(assert (=> start!131016 m!1419725))

(declare-fun m!1419727 () Bool)

(assert (=> b!1537207 m!1419727))

(push 1)

(assert (not start!131016))

(assert (not b!1537201))

(assert (not b!1537208))

