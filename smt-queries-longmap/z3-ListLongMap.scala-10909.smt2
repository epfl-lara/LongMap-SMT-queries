; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127670 () Bool)

(assert start!127670)

(declare-fun b!1500385 () Bool)

(declare-fun res!1021652 () Bool)

(declare-fun e!839475 () Bool)

(assert (=> b!1500385 (=> (not res!1021652) (not e!839475))))

(declare-datatypes ((array!100045 0))(
  ( (array!100046 (arr!48283 (Array (_ BitVec 32) (_ BitVec 64))) (size!48835 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100045)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500385 (= res!1021652 (not (= (select (arr!48283 a!2850) index!625) (select (arr!48283 a!2850) j!87))))))

(declare-fun b!1500386 () Bool)

(declare-fun res!1021656 () Bool)

(assert (=> b!1500386 (=> (not res!1021656) (not e!839475))))

(declare-datatypes ((List!34853 0))(
  ( (Nil!34850) (Cons!34849 (h!36247 (_ BitVec 64)) (t!49539 List!34853)) )
))
(declare-fun arrayNoDuplicates!0 (array!100045 (_ BitVec 32) List!34853) Bool)

(assert (=> b!1500386 (= res!1021656 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34850))))

(declare-fun b!1500387 () Bool)

(declare-fun e!839473 () Bool)

(assert (=> b!1500387 (= e!839473 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12514 0))(
  ( (MissingZero!12514 (index!52448 (_ BitVec 32))) (Found!12514 (index!52449 (_ BitVec 32))) (Intermediate!12514 (undefined!13326 Bool) (index!52450 (_ BitVec 32)) (x!134127 (_ BitVec 32))) (Undefined!12514) (MissingVacant!12514 (index!52451 (_ BitVec 32))) )
))
(declare-fun lt!652711 () SeekEntryResult!12514)

(declare-fun lt!652710 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100045 (_ BitVec 32)) SeekEntryResult!12514)

(assert (=> b!1500387 (= lt!652711 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652710 vacantBefore!10 (select (arr!48283 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500388 () Bool)

(declare-fun res!1021658 () Bool)

(assert (=> b!1500388 (=> (not res!1021658) (not e!839475))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500388 (= res!1021658 (validKeyInArray!0 (select (arr!48283 a!2850) i!996)))))

(declare-fun b!1500389 () Bool)

(declare-fun res!1021657 () Bool)

(assert (=> b!1500389 (=> (not res!1021657) (not e!839475))))

(assert (=> b!1500389 (= res!1021657 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48283 a!2850) j!87) a!2850 mask!2661) (Found!12514 j!87)))))

(declare-fun b!1500390 () Bool)

(declare-fun res!1021653 () Bool)

(assert (=> b!1500390 (=> (not res!1021653) (not e!839475))))

(assert (=> b!1500390 (= res!1021653 (validKeyInArray!0 (select (arr!48283 a!2850) j!87)))))

(declare-fun b!1500391 () Bool)

(declare-fun res!1021655 () Bool)

(assert (=> b!1500391 (=> (not res!1021655) (not e!839475))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500391 (= res!1021655 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48835 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48835 a!2850)) (= (select (arr!48283 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48283 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48835 a!2850))))))

(declare-fun res!1021651 () Bool)

(assert (=> start!127670 (=> (not res!1021651) (not e!839475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127670 (= res!1021651 (validMask!0 mask!2661))))

(assert (=> start!127670 e!839475))

(assert (=> start!127670 true))

(declare-fun array_inv!37516 (array!100045) Bool)

(assert (=> start!127670 (array_inv!37516 a!2850)))

(declare-fun b!1500392 () Bool)

(declare-fun res!1021649 () Bool)

(assert (=> b!1500392 (=> (not res!1021649) (not e!839475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100045 (_ BitVec 32)) Bool)

(assert (=> b!1500392 (= res!1021649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500393 () Bool)

(declare-fun res!1021654 () Bool)

(assert (=> b!1500393 (=> (not res!1021654) (not e!839475))))

(assert (=> b!1500393 (= res!1021654 (and (= (size!48835 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48835 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48835 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500394 () Bool)

(assert (=> b!1500394 (= e!839475 e!839473)))

(declare-fun res!1021650 () Bool)

(assert (=> b!1500394 (=> (not res!1021650) (not e!839473))))

(assert (=> b!1500394 (= res!1021650 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652710 #b00000000000000000000000000000000) (bvslt lt!652710 (size!48835 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500394 (= lt!652710 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127670 res!1021651) b!1500393))

(assert (= (and b!1500393 res!1021654) b!1500388))

(assert (= (and b!1500388 res!1021658) b!1500390))

(assert (= (and b!1500390 res!1021653) b!1500392))

(assert (= (and b!1500392 res!1021649) b!1500386))

(assert (= (and b!1500386 res!1021656) b!1500391))

(assert (= (and b!1500391 res!1021655) b!1500389))

(assert (= (and b!1500389 res!1021657) b!1500385))

(assert (= (and b!1500385 res!1021652) b!1500394))

(assert (= (and b!1500394 res!1021650) b!1500387))

(declare-fun m!1383025 () Bool)

(assert (=> b!1500392 m!1383025))

(declare-fun m!1383027 () Bool)

(assert (=> start!127670 m!1383027))

(declare-fun m!1383029 () Bool)

(assert (=> start!127670 m!1383029))

(declare-fun m!1383031 () Bool)

(assert (=> b!1500394 m!1383031))

(declare-fun m!1383033 () Bool)

(assert (=> b!1500391 m!1383033))

(declare-fun m!1383035 () Bool)

(assert (=> b!1500391 m!1383035))

(declare-fun m!1383037 () Bool)

(assert (=> b!1500391 m!1383037))

(declare-fun m!1383039 () Bool)

(assert (=> b!1500385 m!1383039))

(declare-fun m!1383041 () Bool)

(assert (=> b!1500385 m!1383041))

(assert (=> b!1500389 m!1383041))

(assert (=> b!1500389 m!1383041))

(declare-fun m!1383043 () Bool)

(assert (=> b!1500389 m!1383043))

(declare-fun m!1383045 () Bool)

(assert (=> b!1500388 m!1383045))

(assert (=> b!1500388 m!1383045))

(declare-fun m!1383047 () Bool)

(assert (=> b!1500388 m!1383047))

(assert (=> b!1500390 m!1383041))

(assert (=> b!1500390 m!1383041))

(declare-fun m!1383049 () Bool)

(assert (=> b!1500390 m!1383049))

(assert (=> b!1500387 m!1383041))

(assert (=> b!1500387 m!1383041))

(declare-fun m!1383051 () Bool)

(assert (=> b!1500387 m!1383051))

(declare-fun m!1383053 () Bool)

(assert (=> b!1500386 m!1383053))

(check-sat (not b!1500392) (not b!1500394) (not b!1500386) (not b!1500387) (not start!127670) (not b!1500389) (not b!1500390) (not b!1500388))
(check-sat)
