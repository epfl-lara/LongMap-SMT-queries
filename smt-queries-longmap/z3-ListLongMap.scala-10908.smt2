; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127664 () Bool)

(assert start!127664)

(declare-fun b!1500295 () Bool)

(declare-fun res!1021568 () Bool)

(declare-fun e!839447 () Bool)

(assert (=> b!1500295 (=> (not res!1021568) (not e!839447))))

(declare-datatypes ((array!100039 0))(
  ( (array!100040 (arr!48280 (Array (_ BitVec 32) (_ BitVec 64))) (size!48832 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100039)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500295 (= res!1021568 (validKeyInArray!0 (select (arr!48280 a!2850) i!996)))))

(declare-fun b!1500297 () Bool)

(declare-fun res!1021561 () Bool)

(assert (=> b!1500297 (=> (not res!1021561) (not e!839447))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1500297 (= res!1021561 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48832 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48832 a!2850)) (= (select (arr!48280 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48280 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48832 a!2850))))))

(declare-fun b!1500298 () Bool)

(declare-fun res!1021560 () Bool)

(assert (=> b!1500298 (=> (not res!1021560) (not e!839447))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100039 (_ BitVec 32)) Bool)

(assert (=> b!1500298 (= res!1021560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500299 () Bool)

(declare-fun res!1021562 () Bool)

(assert (=> b!1500299 (=> (not res!1021562) (not e!839447))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500299 (= res!1021562 (not (= (select (arr!48280 a!2850) index!625) (select (arr!48280 a!2850) j!87))))))

(declare-fun b!1500300 () Bool)

(declare-fun e!839446 () Bool)

(assert (=> b!1500300 (= e!839447 e!839446)))

(declare-fun res!1021564 () Bool)

(assert (=> b!1500300 (=> (not res!1021564) (not e!839446))))

(declare-fun lt!652693 () (_ BitVec 32))

(assert (=> b!1500300 (= res!1021564 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652693 #b00000000000000000000000000000000) (bvslt lt!652693 (size!48832 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500300 (= lt!652693 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500301 () Bool)

(declare-fun res!1021563 () Bool)

(assert (=> b!1500301 (=> (not res!1021563) (not e!839447))))

(declare-datatypes ((SeekEntryResult!12511 0))(
  ( (MissingZero!12511 (index!52436 (_ BitVec 32))) (Found!12511 (index!52437 (_ BitVec 32))) (Intermediate!12511 (undefined!13323 Bool) (index!52438 (_ BitVec 32)) (x!134116 (_ BitVec 32))) (Undefined!12511) (MissingVacant!12511 (index!52439 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100039 (_ BitVec 32)) SeekEntryResult!12511)

(assert (=> b!1500301 (= res!1021563 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48280 a!2850) j!87) a!2850 mask!2661) (Found!12511 j!87)))))

(declare-fun b!1500302 () Bool)

(declare-fun res!1021565 () Bool)

(assert (=> b!1500302 (=> (not res!1021565) (not e!839447))))

(assert (=> b!1500302 (= res!1021565 (validKeyInArray!0 (select (arr!48280 a!2850) j!87)))))

(declare-fun b!1500303 () Bool)

(assert (=> b!1500303 (= e!839446 false)))

(declare-fun lt!652692 () SeekEntryResult!12511)

(assert (=> b!1500303 (= lt!652692 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652693 vacantBefore!10 (select (arr!48280 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500304 () Bool)

(declare-fun res!1021567 () Bool)

(assert (=> b!1500304 (=> (not res!1021567) (not e!839447))))

(declare-datatypes ((List!34850 0))(
  ( (Nil!34847) (Cons!34846 (h!36244 (_ BitVec 64)) (t!49536 List!34850)) )
))
(declare-fun arrayNoDuplicates!0 (array!100039 (_ BitVec 32) List!34850) Bool)

(assert (=> b!1500304 (= res!1021567 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34847))))

(declare-fun res!1021566 () Bool)

(assert (=> start!127664 (=> (not res!1021566) (not e!839447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127664 (= res!1021566 (validMask!0 mask!2661))))

(assert (=> start!127664 e!839447))

(assert (=> start!127664 true))

(declare-fun array_inv!37513 (array!100039) Bool)

(assert (=> start!127664 (array_inv!37513 a!2850)))

(declare-fun b!1500296 () Bool)

(declare-fun res!1021559 () Bool)

(assert (=> b!1500296 (=> (not res!1021559) (not e!839447))))

(assert (=> b!1500296 (= res!1021559 (and (= (size!48832 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48832 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48832 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127664 res!1021566) b!1500296))

(assert (= (and b!1500296 res!1021559) b!1500295))

(assert (= (and b!1500295 res!1021568) b!1500302))

(assert (= (and b!1500302 res!1021565) b!1500298))

(assert (= (and b!1500298 res!1021560) b!1500304))

(assert (= (and b!1500304 res!1021567) b!1500297))

(assert (= (and b!1500297 res!1021561) b!1500301))

(assert (= (and b!1500301 res!1021563) b!1500299))

(assert (= (and b!1500299 res!1021562) b!1500300))

(assert (= (and b!1500300 res!1021564) b!1500303))

(declare-fun m!1382935 () Bool)

(assert (=> b!1500295 m!1382935))

(assert (=> b!1500295 m!1382935))

(declare-fun m!1382937 () Bool)

(assert (=> b!1500295 m!1382937))

(declare-fun m!1382939 () Bool)

(assert (=> b!1500301 m!1382939))

(assert (=> b!1500301 m!1382939))

(declare-fun m!1382941 () Bool)

(assert (=> b!1500301 m!1382941))

(assert (=> b!1500303 m!1382939))

(assert (=> b!1500303 m!1382939))

(declare-fun m!1382943 () Bool)

(assert (=> b!1500303 m!1382943))

(declare-fun m!1382945 () Bool)

(assert (=> b!1500300 m!1382945))

(declare-fun m!1382947 () Bool)

(assert (=> b!1500299 m!1382947))

(assert (=> b!1500299 m!1382939))

(declare-fun m!1382949 () Bool)

(assert (=> b!1500304 m!1382949))

(assert (=> b!1500302 m!1382939))

(assert (=> b!1500302 m!1382939))

(declare-fun m!1382951 () Bool)

(assert (=> b!1500302 m!1382951))

(declare-fun m!1382953 () Bool)

(assert (=> b!1500298 m!1382953))

(declare-fun m!1382955 () Bool)

(assert (=> start!127664 m!1382955))

(declare-fun m!1382957 () Bool)

(assert (=> start!127664 m!1382957))

(declare-fun m!1382959 () Bool)

(assert (=> b!1500297 m!1382959))

(declare-fun m!1382961 () Bool)

(assert (=> b!1500297 m!1382961))

(declare-fun m!1382963 () Bool)

(assert (=> b!1500297 m!1382963))

(check-sat (not b!1500298) (not b!1500303) (not b!1500295) (not b!1500300) (not b!1500304) (not b!1500302) (not b!1500301) (not start!127664))
(check-sat)
