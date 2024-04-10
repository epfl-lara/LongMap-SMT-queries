; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130876 () Bool)

(assert start!130876)

(declare-fun b!1534973 () Bool)

(declare-fun e!854657 () Bool)

(declare-fun e!854659 () Bool)

(assert (=> b!1534973 (= e!854657 e!854659)))

(declare-fun res!1052068 () Bool)

(assert (=> b!1534973 (=> (not res!1052068) (not e!854659))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663967 () (_ BitVec 32))

(declare-datatypes ((array!101974 0))(
  ( (array!101975 (arr!49203 (Array (_ BitVec 32) (_ BitVec 64))) (size!49753 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101974)

(assert (=> b!1534973 (= res!1052068 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663967 #b00000000000000000000000000000000) (bvslt lt!663967 (size!49753 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534973 (= lt!663967 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534975 () Bool)

(declare-fun res!1052063 () Bool)

(assert (=> b!1534975 (=> (not res!1052063) (not e!854657))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13335 0))(
  ( (MissingZero!13335 (index!55735 (_ BitVec 32))) (Found!13335 (index!55736 (_ BitVec 32))) (Intermediate!13335 (undefined!14147 Bool) (index!55737 (_ BitVec 32)) (x!137489 (_ BitVec 32))) (Undefined!13335) (MissingVacant!13335 (index!55738 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101974 (_ BitVec 32)) SeekEntryResult!13335)

(assert (=> b!1534975 (= res!1052063 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49203 a!2792) j!64) a!2792 mask!2480) (Found!13335 j!64)))))

(declare-fun b!1534976 () Bool)

(declare-fun res!1052059 () Bool)

(assert (=> b!1534976 (=> (not res!1052059) (not e!854657))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534976 (= res!1052059 (validKeyInArray!0 (select (arr!49203 a!2792) i!951)))))

(declare-fun b!1534977 () Bool)

(declare-fun res!1052061 () Bool)

(assert (=> b!1534977 (=> (not res!1052061) (not e!854657))))

(assert (=> b!1534977 (= res!1052061 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49753 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49753 a!2792)) (= (select (arr!49203 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534978 () Bool)

(declare-fun res!1052065 () Bool)

(assert (=> b!1534978 (=> (not res!1052065) (not e!854657))))

(declare-datatypes ((List!35677 0))(
  ( (Nil!35674) (Cons!35673 (h!37118 (_ BitVec 64)) (t!50371 List!35677)) )
))
(declare-fun arrayNoDuplicates!0 (array!101974 (_ BitVec 32) List!35677) Bool)

(assert (=> b!1534978 (= res!1052065 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35674))))

(declare-fun res!1052067 () Bool)

(assert (=> start!130876 (=> (not res!1052067) (not e!854657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130876 (= res!1052067 (validMask!0 mask!2480))))

(assert (=> start!130876 e!854657))

(assert (=> start!130876 true))

(declare-fun array_inv!38231 (array!101974) Bool)

(assert (=> start!130876 (array_inv!38231 a!2792)))

(declare-fun b!1534974 () Bool)

(assert (=> b!1534974 (= e!854659 false)))

(declare-fun lt!663966 () SeekEntryResult!13335)

(assert (=> b!1534974 (= lt!663966 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663967 vacantIndex!5 (select (arr!49203 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534979 () Bool)

(declare-fun res!1052062 () Bool)

(assert (=> b!1534979 (=> (not res!1052062) (not e!854657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101974 (_ BitVec 32)) Bool)

(assert (=> b!1534979 (= res!1052062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534980 () Bool)

(declare-fun res!1052066 () Bool)

(assert (=> b!1534980 (=> (not res!1052066) (not e!854657))))

(assert (=> b!1534980 (= res!1052066 (not (= (select (arr!49203 a!2792) index!463) (select (arr!49203 a!2792) j!64))))))

(declare-fun b!1534981 () Bool)

(declare-fun res!1052060 () Bool)

(assert (=> b!1534981 (=> (not res!1052060) (not e!854657))))

(assert (=> b!1534981 (= res!1052060 (validKeyInArray!0 (select (arr!49203 a!2792) j!64)))))

(declare-fun b!1534982 () Bool)

(declare-fun res!1052064 () Bool)

(assert (=> b!1534982 (=> (not res!1052064) (not e!854657))))

(assert (=> b!1534982 (= res!1052064 (and (= (size!49753 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49753 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49753 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130876 res!1052067) b!1534982))

(assert (= (and b!1534982 res!1052064) b!1534976))

(assert (= (and b!1534976 res!1052059) b!1534981))

(assert (= (and b!1534981 res!1052060) b!1534979))

(assert (= (and b!1534979 res!1052062) b!1534978))

(assert (= (and b!1534978 res!1052065) b!1534977))

(assert (= (and b!1534977 res!1052061) b!1534975))

(assert (= (and b!1534975 res!1052063) b!1534980))

(assert (= (and b!1534980 res!1052066) b!1534973))

(assert (= (and b!1534973 res!1052068) b!1534974))

(declare-fun m!1417553 () Bool)

(assert (=> b!1534979 m!1417553))

(declare-fun m!1417555 () Bool)

(assert (=> b!1534974 m!1417555))

(assert (=> b!1534974 m!1417555))

(declare-fun m!1417557 () Bool)

(assert (=> b!1534974 m!1417557))

(declare-fun m!1417559 () Bool)

(assert (=> b!1534977 m!1417559))

(assert (=> b!1534981 m!1417555))

(assert (=> b!1534981 m!1417555))

(declare-fun m!1417561 () Bool)

(assert (=> b!1534981 m!1417561))

(declare-fun m!1417563 () Bool)

(assert (=> start!130876 m!1417563))

(declare-fun m!1417565 () Bool)

(assert (=> start!130876 m!1417565))

(declare-fun m!1417567 () Bool)

(assert (=> b!1534976 m!1417567))

(assert (=> b!1534976 m!1417567))

(declare-fun m!1417569 () Bool)

(assert (=> b!1534976 m!1417569))

(declare-fun m!1417571 () Bool)

(assert (=> b!1534978 m!1417571))

(declare-fun m!1417573 () Bool)

(assert (=> b!1534973 m!1417573))

(assert (=> b!1534975 m!1417555))

(assert (=> b!1534975 m!1417555))

(declare-fun m!1417575 () Bool)

(assert (=> b!1534975 m!1417575))

(declare-fun m!1417577 () Bool)

(assert (=> b!1534980 m!1417577))

(assert (=> b!1534980 m!1417555))

(check-sat (not b!1534979) (not start!130876) (not b!1534978) (not b!1534976) (not b!1534973) (not b!1534975) (not b!1534974) (not b!1534981))
(check-sat)
