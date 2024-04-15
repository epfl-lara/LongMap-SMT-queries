; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127640 () Bool)

(assert start!127640)

(declare-fun b!1499935 () Bool)

(declare-fun res!1021208 () Bool)

(declare-fun e!839340 () Bool)

(assert (=> b!1499935 (=> (not res!1021208) (not e!839340))))

(declare-datatypes ((array!100015 0))(
  ( (array!100016 (arr!48268 (Array (_ BitVec 32) (_ BitVec 64))) (size!48820 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100015)

(declare-datatypes ((List!34838 0))(
  ( (Nil!34835) (Cons!34834 (h!36232 (_ BitVec 64)) (t!49524 List!34838)) )
))
(declare-fun arrayNoDuplicates!0 (array!100015 (_ BitVec 32) List!34838) Bool)

(assert (=> b!1499935 (= res!1021208 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34835))))

(declare-fun res!1021200 () Bool)

(assert (=> start!127640 (=> (not res!1021200) (not e!839340))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127640 (= res!1021200 (validMask!0 mask!2661))))

(assert (=> start!127640 e!839340))

(assert (=> start!127640 true))

(declare-fun array_inv!37501 (array!100015) Bool)

(assert (=> start!127640 (array_inv!37501 a!2850)))

(declare-fun b!1499936 () Bool)

(declare-fun res!1021206 () Bool)

(assert (=> b!1499936 (=> (not res!1021206) (not e!839340))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499936 (= res!1021206 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48820 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48820 a!2850)) (= (select (arr!48268 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48268 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48820 a!2850))))))

(declare-fun b!1499937 () Bool)

(declare-fun res!1021205 () Bool)

(assert (=> b!1499937 (=> (not res!1021205) (not e!839340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499937 (= res!1021205 (validKeyInArray!0 (select (arr!48268 a!2850) i!996)))))

(declare-fun b!1499938 () Bool)

(declare-fun res!1021203 () Bool)

(assert (=> b!1499938 (=> (not res!1021203) (not e!839340))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499938 (= res!1021203 (not (= (select (arr!48268 a!2850) index!625) (select (arr!48268 a!2850) j!87))))))

(declare-fun b!1499939 () Bool)

(declare-fun e!839339 () Bool)

(assert (=> b!1499939 (= e!839339 false)))

(declare-datatypes ((SeekEntryResult!12499 0))(
  ( (MissingZero!12499 (index!52388 (_ BitVec 32))) (Found!12499 (index!52389 (_ BitVec 32))) (Intermediate!12499 (undefined!13311 Bool) (index!52390 (_ BitVec 32)) (x!134072 (_ BitVec 32))) (Undefined!12499) (MissingVacant!12499 (index!52391 (_ BitVec 32))) )
))
(declare-fun lt!652620 () SeekEntryResult!12499)

(declare-fun lt!652621 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100015 (_ BitVec 32)) SeekEntryResult!12499)

(assert (=> b!1499939 (= lt!652620 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652621 vacantBefore!10 (select (arr!48268 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499940 () Bool)

(declare-fun res!1021207 () Bool)

(assert (=> b!1499940 (=> (not res!1021207) (not e!839340))))

(assert (=> b!1499940 (= res!1021207 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48268 a!2850) j!87) a!2850 mask!2661) (Found!12499 j!87)))))

(declare-fun b!1499941 () Bool)

(declare-fun res!1021202 () Bool)

(assert (=> b!1499941 (=> (not res!1021202) (not e!839340))))

(assert (=> b!1499941 (= res!1021202 (and (= (size!48820 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48820 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48820 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499942 () Bool)

(declare-fun res!1021199 () Bool)

(assert (=> b!1499942 (=> (not res!1021199) (not e!839340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100015 (_ BitVec 32)) Bool)

(assert (=> b!1499942 (= res!1021199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499943 () Bool)

(assert (=> b!1499943 (= e!839340 e!839339)))

(declare-fun res!1021201 () Bool)

(assert (=> b!1499943 (=> (not res!1021201) (not e!839339))))

(assert (=> b!1499943 (= res!1021201 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652621 #b00000000000000000000000000000000) (bvslt lt!652621 (size!48820 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499943 (= lt!652621 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499944 () Bool)

(declare-fun res!1021204 () Bool)

(assert (=> b!1499944 (=> (not res!1021204) (not e!839340))))

(assert (=> b!1499944 (= res!1021204 (validKeyInArray!0 (select (arr!48268 a!2850) j!87)))))

(assert (= (and start!127640 res!1021200) b!1499941))

(assert (= (and b!1499941 res!1021202) b!1499937))

(assert (= (and b!1499937 res!1021205) b!1499944))

(assert (= (and b!1499944 res!1021204) b!1499942))

(assert (= (and b!1499942 res!1021199) b!1499935))

(assert (= (and b!1499935 res!1021208) b!1499936))

(assert (= (and b!1499936 res!1021206) b!1499940))

(assert (= (and b!1499940 res!1021207) b!1499938))

(assert (= (and b!1499938 res!1021203) b!1499943))

(assert (= (and b!1499943 res!1021201) b!1499939))

(declare-fun m!1382575 () Bool)

(assert (=> b!1499944 m!1382575))

(assert (=> b!1499944 m!1382575))

(declare-fun m!1382577 () Bool)

(assert (=> b!1499944 m!1382577))

(assert (=> b!1499939 m!1382575))

(assert (=> b!1499939 m!1382575))

(declare-fun m!1382579 () Bool)

(assert (=> b!1499939 m!1382579))

(declare-fun m!1382581 () Bool)

(assert (=> b!1499937 m!1382581))

(assert (=> b!1499937 m!1382581))

(declare-fun m!1382583 () Bool)

(assert (=> b!1499937 m!1382583))

(declare-fun m!1382585 () Bool)

(assert (=> b!1499942 m!1382585))

(declare-fun m!1382587 () Bool)

(assert (=> b!1499935 m!1382587))

(assert (=> b!1499940 m!1382575))

(assert (=> b!1499940 m!1382575))

(declare-fun m!1382589 () Bool)

(assert (=> b!1499940 m!1382589))

(declare-fun m!1382591 () Bool)

(assert (=> b!1499936 m!1382591))

(declare-fun m!1382593 () Bool)

(assert (=> b!1499936 m!1382593))

(declare-fun m!1382595 () Bool)

(assert (=> b!1499936 m!1382595))

(declare-fun m!1382597 () Bool)

(assert (=> start!127640 m!1382597))

(declare-fun m!1382599 () Bool)

(assert (=> start!127640 m!1382599))

(declare-fun m!1382601 () Bool)

(assert (=> b!1499943 m!1382601))

(declare-fun m!1382603 () Bool)

(assert (=> b!1499938 m!1382603))

(assert (=> b!1499938 m!1382575))

(check-sat (not start!127640) (not b!1499935) (not b!1499944) (not b!1499937) (not b!1499939) (not b!1499943) (not b!1499940) (not b!1499942))
(check-sat)
