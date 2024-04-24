; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131406 () Bool)

(assert start!131406)

(declare-fun b!1539172 () Bool)

(declare-fun e!856830 () Bool)

(assert (=> b!1539172 (= e!856830 (not true))))

(declare-fun lt!665373 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102208 0))(
  ( (array!102209 (arr!49312 (Array (_ BitVec 32) (_ BitVec 64))) (size!49863 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102208)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13339 0))(
  ( (MissingZero!13339 (index!55751 (_ BitVec 32))) (Found!13339 (index!55752 (_ BitVec 32))) (Intermediate!13339 (undefined!14151 Bool) (index!55753 (_ BitVec 32)) (x!137695 (_ BitVec 32))) (Undefined!13339) (MissingVacant!13339 (index!55754 (_ BitVec 32))) )
))
(declare-fun lt!665371 () SeekEntryResult!13339)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102208 (_ BitVec 32)) SeekEntryResult!13339)

(assert (=> b!1539172 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665373 vacantIndex!5 (select (store (arr!49312 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102209 (store (arr!49312 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49863 a!2792)) mask!2480) lt!665371)))

(declare-datatypes ((Unit!51287 0))(
  ( (Unit!51288) )
))
(declare-fun lt!665372 () Unit!51287)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51287)

(assert (=> b!1539172 (= lt!665372 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665373 vacantIndex!5 mask!2480))))

(declare-fun res!1054691 () Bool)

(declare-fun e!856829 () Bool)

(assert (=> start!131406 (=> (not res!1054691) (not e!856829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131406 (= res!1054691 (validMask!0 mask!2480))))

(assert (=> start!131406 e!856829))

(assert (=> start!131406 true))

(declare-fun array_inv!38593 (array!102208) Bool)

(assert (=> start!131406 (array_inv!38593 a!2792)))

(declare-fun b!1539173 () Bool)

(declare-fun res!1054692 () Bool)

(assert (=> b!1539173 (=> (not res!1054692) (not e!856829))))

(assert (=> b!1539173 (= res!1054692 (and (= (size!49863 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49863 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49863 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539174 () Bool)

(declare-fun e!856828 () Bool)

(declare-fun e!856831 () Bool)

(assert (=> b!1539174 (= e!856828 e!856831)))

(declare-fun res!1054689 () Bool)

(assert (=> b!1539174 (=> (not res!1054689) (not e!856831))))

(assert (=> b!1539174 (= res!1054689 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665373 #b00000000000000000000000000000000) (bvslt lt!665373 (size!49863 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539174 (= lt!665373 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539175 () Bool)

(declare-fun res!1054690 () Bool)

(assert (=> b!1539175 (=> (not res!1054690) (not e!856829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539175 (= res!1054690 (validKeyInArray!0 (select (arr!49312 a!2792) j!64)))))

(declare-fun b!1539176 () Bool)

(assert (=> b!1539176 (= e!856831 e!856830)))

(declare-fun res!1054683 () Bool)

(assert (=> b!1539176 (=> (not res!1054683) (not e!856830))))

(declare-fun lt!665370 () SeekEntryResult!13339)

(assert (=> b!1539176 (= res!1054683 (= lt!665371 lt!665370))))

(assert (=> b!1539176 (= lt!665371 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665373 vacantIndex!5 (select (arr!49312 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539177 () Bool)

(declare-fun res!1054682 () Bool)

(assert (=> b!1539177 (=> (not res!1054682) (not e!856828))))

(assert (=> b!1539177 (= res!1054682 (not (= (select (arr!49312 a!2792) index!463) (select (arr!49312 a!2792) j!64))))))

(declare-fun b!1539178 () Bool)

(assert (=> b!1539178 (= e!856829 e!856828)))

(declare-fun res!1054686 () Bool)

(assert (=> b!1539178 (=> (not res!1054686) (not e!856828))))

(assert (=> b!1539178 (= res!1054686 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49312 a!2792) j!64) a!2792 mask!2480) lt!665370))))

(assert (=> b!1539178 (= lt!665370 (Found!13339 j!64))))

(declare-fun b!1539179 () Bool)

(declare-fun res!1054688 () Bool)

(assert (=> b!1539179 (=> (not res!1054688) (not e!856829))))

(assert (=> b!1539179 (= res!1054688 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49863 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49863 a!2792)) (= (select (arr!49312 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539180 () Bool)

(declare-fun res!1054687 () Bool)

(assert (=> b!1539180 (=> (not res!1054687) (not e!856829))))

(declare-datatypes ((List!35773 0))(
  ( (Nil!35770) (Cons!35769 (h!37232 (_ BitVec 64)) (t!50459 List!35773)) )
))
(declare-fun arrayNoDuplicates!0 (array!102208 (_ BitVec 32) List!35773) Bool)

(assert (=> b!1539180 (= res!1054687 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35770))))

(declare-fun b!1539181 () Bool)

(declare-fun res!1054684 () Bool)

(assert (=> b!1539181 (=> (not res!1054684) (not e!856829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102208 (_ BitVec 32)) Bool)

(assert (=> b!1539181 (= res!1054684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539182 () Bool)

(declare-fun res!1054685 () Bool)

(assert (=> b!1539182 (=> (not res!1054685) (not e!856829))))

(assert (=> b!1539182 (= res!1054685 (validKeyInArray!0 (select (arr!49312 a!2792) i!951)))))

(assert (= (and start!131406 res!1054691) b!1539173))

(assert (= (and b!1539173 res!1054692) b!1539182))

(assert (= (and b!1539182 res!1054685) b!1539175))

(assert (= (and b!1539175 res!1054690) b!1539181))

(assert (= (and b!1539181 res!1054684) b!1539180))

(assert (= (and b!1539180 res!1054687) b!1539179))

(assert (= (and b!1539179 res!1054688) b!1539178))

(assert (= (and b!1539178 res!1054686) b!1539177))

(assert (= (and b!1539177 res!1054682) b!1539174))

(assert (= (and b!1539174 res!1054689) b!1539176))

(assert (= (and b!1539176 res!1054683) b!1539172))

(declare-fun m!1421455 () Bool)

(assert (=> b!1539180 m!1421455))

(declare-fun m!1421457 () Bool)

(assert (=> b!1539181 m!1421457))

(declare-fun m!1421459 () Bool)

(assert (=> b!1539172 m!1421459))

(declare-fun m!1421461 () Bool)

(assert (=> b!1539172 m!1421461))

(assert (=> b!1539172 m!1421461))

(declare-fun m!1421463 () Bool)

(assert (=> b!1539172 m!1421463))

(declare-fun m!1421465 () Bool)

(assert (=> b!1539172 m!1421465))

(declare-fun m!1421467 () Bool)

(assert (=> b!1539179 m!1421467))

(declare-fun m!1421469 () Bool)

(assert (=> b!1539182 m!1421469))

(assert (=> b!1539182 m!1421469))

(declare-fun m!1421471 () Bool)

(assert (=> b!1539182 m!1421471))

(declare-fun m!1421473 () Bool)

(assert (=> b!1539176 m!1421473))

(assert (=> b!1539176 m!1421473))

(declare-fun m!1421475 () Bool)

(assert (=> b!1539176 m!1421475))

(assert (=> b!1539175 m!1421473))

(assert (=> b!1539175 m!1421473))

(declare-fun m!1421477 () Bool)

(assert (=> b!1539175 m!1421477))

(declare-fun m!1421479 () Bool)

(assert (=> b!1539177 m!1421479))

(assert (=> b!1539177 m!1421473))

(assert (=> b!1539178 m!1421473))

(assert (=> b!1539178 m!1421473))

(declare-fun m!1421481 () Bool)

(assert (=> b!1539178 m!1421481))

(declare-fun m!1421483 () Bool)

(assert (=> start!131406 m!1421483))

(declare-fun m!1421485 () Bool)

(assert (=> start!131406 m!1421485))

(declare-fun m!1421487 () Bool)

(assert (=> b!1539174 m!1421487))

(check-sat (not b!1539176) (not b!1539182) (not b!1539180) (not b!1539174) (not b!1539175) (not start!131406) (not b!1539178) (not b!1539181) (not b!1539172))
(check-sat)
