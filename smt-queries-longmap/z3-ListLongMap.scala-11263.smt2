; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131322 () Bool)

(assert start!131322)

(declare-fun b!1539996 () Bool)

(declare-fun res!1056879 () Bool)

(declare-fun e!856480 () Bool)

(assert (=> b!1539996 (=> (not res!1056879) (not e!856480))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102268 0))(
  ( (array!102269 (arr!49345 (Array (_ BitVec 32) (_ BitVec 64))) (size!49897 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102268)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539996 (= res!1056879 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49897 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49897 a!2792)) (= (select (arr!49345 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539997 () Bool)

(declare-fun res!1056878 () Bool)

(declare-fun e!856479 () Bool)

(assert (=> b!1539997 (=> (not res!1056878) (not e!856479))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539997 (= res!1056878 (not (= (select (arr!49345 a!2792) index!463) (select (arr!49345 a!2792) j!64))))))

(declare-fun b!1539998 () Bool)

(assert (=> b!1539998 (= e!856480 e!856479)))

(declare-fun res!1056874 () Bool)

(assert (=> b!1539998 (=> (not res!1056874) (not e!856479))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13496 0))(
  ( (MissingZero!13496 (index!56379 (_ BitVec 32))) (Found!13496 (index!56380 (_ BitVec 32))) (Intermediate!13496 (undefined!14308 Bool) (index!56381 (_ BitVec 32)) (x!138114 (_ BitVec 32))) (Undefined!13496) (MissingVacant!13496 (index!56382 (_ BitVec 32))) )
))
(declare-fun lt!665013 () SeekEntryResult!13496)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102268 (_ BitVec 32)) SeekEntryResult!13496)

(assert (=> b!1539998 (= res!1056874 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49345 a!2792) j!64) a!2792 mask!2480) lt!665013))))

(assert (=> b!1539998 (= lt!665013 (Found!13496 j!64))))

(declare-fun b!1539999 () Bool)

(declare-fun e!856482 () Bool)

(assert (=> b!1539999 (= e!856479 e!856482)))

(declare-fun res!1056877 () Bool)

(assert (=> b!1539999 (=> (not res!1056877) (not e!856482))))

(declare-fun lt!665014 () (_ BitVec 32))

(assert (=> b!1539999 (= res!1056877 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665014 #b00000000000000000000000000000000) (bvslt lt!665014 (size!49897 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539999 (= lt!665014 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540000 () Bool)

(declare-fun e!856483 () Bool)

(assert (=> b!1540000 (= e!856482 e!856483)))

(declare-fun res!1056872 () Bool)

(assert (=> b!1540000 (=> (not res!1056872) (not e!856483))))

(declare-fun lt!665015 () SeekEntryResult!13496)

(assert (=> b!1540000 (= res!1056872 (= lt!665015 lt!665013))))

(assert (=> b!1540000 (= lt!665015 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665014 vacantIndex!5 (select (arr!49345 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1056873 () Bool)

(assert (=> start!131322 (=> (not res!1056873) (not e!856480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131322 (= res!1056873 (validMask!0 mask!2480))))

(assert (=> start!131322 e!856480))

(assert (=> start!131322 true))

(declare-fun array_inv!38578 (array!102268) Bool)

(assert (=> start!131322 (array_inv!38578 a!2792)))

(declare-fun b!1540001 () Bool)

(assert (=> b!1540001 (= e!856483 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540001 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665014 vacantIndex!5 (select (store (arr!49345 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102269 (store (arr!49345 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49897 a!2792)) mask!2480) lt!665015)))

(declare-datatypes ((Unit!51263 0))(
  ( (Unit!51264) )
))
(declare-fun lt!665016 () Unit!51263)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51263)

(assert (=> b!1540001 (= lt!665016 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665014 vacantIndex!5 mask!2480))))

(declare-fun b!1540002 () Bool)

(declare-fun res!1056880 () Bool)

(assert (=> b!1540002 (=> (not res!1056880) (not e!856480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540002 (= res!1056880 (validKeyInArray!0 (select (arr!49345 a!2792) j!64)))))

(declare-fun b!1540003 () Bool)

(declare-fun res!1056876 () Bool)

(assert (=> b!1540003 (=> (not res!1056876) (not e!856480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102268 (_ BitVec 32)) Bool)

(assert (=> b!1540003 (= res!1056876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540004 () Bool)

(declare-fun res!1056870 () Bool)

(assert (=> b!1540004 (=> (not res!1056870) (not e!856480))))

(assert (=> b!1540004 (= res!1056870 (and (= (size!49897 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49897 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49897 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540005 () Bool)

(declare-fun res!1056871 () Bool)

(assert (=> b!1540005 (=> (not res!1056871) (not e!856480))))

(declare-datatypes ((List!35897 0))(
  ( (Nil!35894) (Cons!35893 (h!37339 (_ BitVec 64)) (t!50583 List!35897)) )
))
(declare-fun arrayNoDuplicates!0 (array!102268 (_ BitVec 32) List!35897) Bool)

(assert (=> b!1540005 (= res!1056871 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35894))))

(declare-fun b!1540006 () Bool)

(declare-fun res!1056875 () Bool)

(assert (=> b!1540006 (=> (not res!1056875) (not e!856480))))

(assert (=> b!1540006 (= res!1056875 (validKeyInArray!0 (select (arr!49345 a!2792) i!951)))))

(assert (= (and start!131322 res!1056873) b!1540004))

(assert (= (and b!1540004 res!1056870) b!1540006))

(assert (= (and b!1540006 res!1056875) b!1540002))

(assert (= (and b!1540002 res!1056880) b!1540003))

(assert (= (and b!1540003 res!1056876) b!1540005))

(assert (= (and b!1540005 res!1056871) b!1539996))

(assert (= (and b!1539996 res!1056879) b!1539998))

(assert (= (and b!1539998 res!1056874) b!1539997))

(assert (= (and b!1539997 res!1056878) b!1539999))

(assert (= (and b!1539999 res!1056877) b!1540000))

(assert (= (and b!1540000 res!1056872) b!1540001))

(declare-fun m!1421525 () Bool)

(assert (=> b!1540006 m!1421525))

(assert (=> b!1540006 m!1421525))

(declare-fun m!1421527 () Bool)

(assert (=> b!1540006 m!1421527))

(declare-fun m!1421529 () Bool)

(assert (=> b!1540002 m!1421529))

(assert (=> b!1540002 m!1421529))

(declare-fun m!1421531 () Bool)

(assert (=> b!1540002 m!1421531))

(assert (=> b!1539998 m!1421529))

(assert (=> b!1539998 m!1421529))

(declare-fun m!1421533 () Bool)

(assert (=> b!1539998 m!1421533))

(declare-fun m!1421535 () Bool)

(assert (=> b!1540001 m!1421535))

(declare-fun m!1421537 () Bool)

(assert (=> b!1540001 m!1421537))

(assert (=> b!1540001 m!1421537))

(declare-fun m!1421539 () Bool)

(assert (=> b!1540001 m!1421539))

(declare-fun m!1421541 () Bool)

(assert (=> b!1540001 m!1421541))

(declare-fun m!1421543 () Bool)

(assert (=> start!131322 m!1421543))

(declare-fun m!1421545 () Bool)

(assert (=> start!131322 m!1421545))

(declare-fun m!1421547 () Bool)

(assert (=> b!1540003 m!1421547))

(declare-fun m!1421549 () Bool)

(assert (=> b!1539997 m!1421549))

(assert (=> b!1539997 m!1421529))

(declare-fun m!1421551 () Bool)

(assert (=> b!1539996 m!1421551))

(declare-fun m!1421553 () Bool)

(assert (=> b!1540005 m!1421553))

(assert (=> b!1540000 m!1421529))

(assert (=> b!1540000 m!1421529))

(declare-fun m!1421555 () Bool)

(assert (=> b!1540000 m!1421555))

(declare-fun m!1421557 () Bool)

(assert (=> b!1539999 m!1421557))

(check-sat (not b!1540002) (not b!1540003) (not b!1540006) (not b!1540001) (not b!1540005) (not start!131322) (not b!1540000) (not b!1539999) (not b!1539998))
(check-sat)
