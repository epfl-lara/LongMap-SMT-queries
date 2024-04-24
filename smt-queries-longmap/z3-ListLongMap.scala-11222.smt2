; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131382 () Bool)

(assert start!131382)

(declare-fun b!1538767 () Bool)

(declare-fun res!1054282 () Bool)

(declare-fun e!856642 () Bool)

(assert (=> b!1538767 (=> (not res!1054282) (not e!856642))))

(declare-datatypes ((array!102184 0))(
  ( (array!102185 (arr!49300 (Array (_ BitVec 32) (_ BitVec 64))) (size!49851 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102184)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538767 (= res!1054282 (validKeyInArray!0 (select (arr!49300 a!2792) j!64)))))

(declare-fun b!1538768 () Bool)

(declare-fun e!856639 () Bool)

(assert (=> b!1538768 (= e!856642 e!856639)))

(declare-fun res!1054283 () Bool)

(assert (=> b!1538768 (=> (not res!1054283) (not e!856639))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13327 0))(
  ( (MissingZero!13327 (index!55703 (_ BitVec 32))) (Found!13327 (index!55704 (_ BitVec 32))) (Intermediate!13327 (undefined!14139 Bool) (index!55705 (_ BitVec 32)) (x!137651 (_ BitVec 32))) (Undefined!13327) (MissingVacant!13327 (index!55706 (_ BitVec 32))) )
))
(declare-fun lt!665218 () SeekEntryResult!13327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102184 (_ BitVec 32)) SeekEntryResult!13327)

(assert (=> b!1538768 (= res!1054283 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49300 a!2792) j!64) a!2792 mask!2480) lt!665218))))

(assert (=> b!1538768 (= lt!665218 (Found!13327 j!64))))

(declare-fun b!1538769 () Bool)

(declare-fun res!1054281 () Bool)

(assert (=> b!1538769 (=> (not res!1054281) (not e!856642))))

(declare-datatypes ((List!35761 0))(
  ( (Nil!35758) (Cons!35757 (h!37220 (_ BitVec 64)) (t!50447 List!35761)) )
))
(declare-fun arrayNoDuplicates!0 (array!102184 (_ BitVec 32) List!35761) Bool)

(assert (=> b!1538769 (= res!1054281 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35758))))

(declare-fun b!1538770 () Bool)

(declare-fun e!856641 () Bool)

(declare-fun e!856640 () Bool)

(assert (=> b!1538770 (= e!856641 e!856640)))

(declare-fun res!1054287 () Bool)

(assert (=> b!1538770 (=> (not res!1054287) (not e!856640))))

(declare-fun lt!665219 () SeekEntryResult!13327)

(assert (=> b!1538770 (= res!1054287 (= lt!665219 lt!665218))))

(declare-fun lt!665217 () (_ BitVec 32))

(assert (=> b!1538770 (= lt!665219 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665217 vacantIndex!5 (select (arr!49300 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538771 () Bool)

(declare-fun res!1054285 () Bool)

(assert (=> b!1538771 (=> (not res!1054285) (not e!856642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102184 (_ BitVec 32)) Bool)

(assert (=> b!1538771 (= res!1054285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538772 () Bool)

(declare-fun res!1054286 () Bool)

(assert (=> b!1538772 (=> (not res!1054286) (not e!856642))))

(assert (=> b!1538772 (= res!1054286 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49851 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49851 a!2792)) (= (select (arr!49300 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538773 () Bool)

(assert (=> b!1538773 (= e!856639 e!856641)))

(declare-fun res!1054284 () Bool)

(assert (=> b!1538773 (=> (not res!1054284) (not e!856641))))

(assert (=> b!1538773 (= res!1054284 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665217 #b00000000000000000000000000000000) (bvslt lt!665217 (size!49851 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538773 (= lt!665217 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun res!1054278 () Bool)

(assert (=> start!131382 (=> (not res!1054278) (not e!856642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131382 (= res!1054278 (validMask!0 mask!2480))))

(assert (=> start!131382 e!856642))

(assert (=> start!131382 true))

(declare-fun array_inv!38581 (array!102184) Bool)

(assert (=> start!131382 (array_inv!38581 a!2792)))

(declare-fun b!1538774 () Bool)

(declare-fun res!1054277 () Bool)

(assert (=> b!1538774 (=> (not res!1054277) (not e!856642))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538774 (= res!1054277 (and (= (size!49851 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49851 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49851 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538775 () Bool)

(declare-fun res!1054280 () Bool)

(assert (=> b!1538775 (=> (not res!1054280) (not e!856639))))

(assert (=> b!1538775 (= res!1054280 (not (= (select (arr!49300 a!2792) index!463) (select (arr!49300 a!2792) j!64))))))

(declare-fun b!1538776 () Bool)

(assert (=> b!1538776 (= e!856640 (not true))))

(assert (=> b!1538776 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665217 vacantIndex!5 (select (store (arr!49300 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102185 (store (arr!49300 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49851 a!2792)) mask!2480) lt!665219)))

(declare-datatypes ((Unit!51263 0))(
  ( (Unit!51264) )
))
(declare-fun lt!665220 () Unit!51263)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51263)

(assert (=> b!1538776 (= lt!665220 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665217 vacantIndex!5 mask!2480))))

(declare-fun b!1538777 () Bool)

(declare-fun res!1054279 () Bool)

(assert (=> b!1538777 (=> (not res!1054279) (not e!856642))))

(assert (=> b!1538777 (= res!1054279 (validKeyInArray!0 (select (arr!49300 a!2792) i!951)))))

(assert (= (and start!131382 res!1054278) b!1538774))

(assert (= (and b!1538774 res!1054277) b!1538777))

(assert (= (and b!1538777 res!1054279) b!1538767))

(assert (= (and b!1538767 res!1054282) b!1538771))

(assert (= (and b!1538771 res!1054285) b!1538769))

(assert (= (and b!1538769 res!1054281) b!1538772))

(assert (= (and b!1538772 res!1054286) b!1538768))

(assert (= (and b!1538768 res!1054283) b!1538775))

(assert (= (and b!1538775 res!1054280) b!1538773))

(assert (= (and b!1538773 res!1054284) b!1538770))

(assert (= (and b!1538770 res!1054287) b!1538776))

(declare-fun m!1421029 () Bool)

(assert (=> b!1538768 m!1421029))

(assert (=> b!1538768 m!1421029))

(declare-fun m!1421031 () Bool)

(assert (=> b!1538768 m!1421031))

(declare-fun m!1421033 () Bool)

(assert (=> b!1538777 m!1421033))

(assert (=> b!1538777 m!1421033))

(declare-fun m!1421035 () Bool)

(assert (=> b!1538777 m!1421035))

(declare-fun m!1421037 () Bool)

(assert (=> b!1538776 m!1421037))

(declare-fun m!1421039 () Bool)

(assert (=> b!1538776 m!1421039))

(assert (=> b!1538776 m!1421039))

(declare-fun m!1421041 () Bool)

(assert (=> b!1538776 m!1421041))

(declare-fun m!1421043 () Bool)

(assert (=> b!1538776 m!1421043))

(declare-fun m!1421045 () Bool)

(assert (=> b!1538775 m!1421045))

(assert (=> b!1538775 m!1421029))

(declare-fun m!1421047 () Bool)

(assert (=> b!1538769 m!1421047))

(declare-fun m!1421049 () Bool)

(assert (=> b!1538772 m!1421049))

(assert (=> b!1538770 m!1421029))

(assert (=> b!1538770 m!1421029))

(declare-fun m!1421051 () Bool)

(assert (=> b!1538770 m!1421051))

(declare-fun m!1421053 () Bool)

(assert (=> b!1538773 m!1421053))

(declare-fun m!1421055 () Bool)

(assert (=> start!131382 m!1421055))

(declare-fun m!1421057 () Bool)

(assert (=> start!131382 m!1421057))

(declare-fun m!1421059 () Bool)

(assert (=> b!1538771 m!1421059))

(assert (=> b!1538767 m!1421029))

(assert (=> b!1538767 m!1421029))

(declare-fun m!1421061 () Bool)

(assert (=> b!1538767 m!1421061))

(check-sat (not b!1538769) (not b!1538777) (not b!1538771) (not b!1538770) (not start!131382) (not b!1538776) (not b!1538773) (not b!1538768) (not b!1538767))
(check-sat)
