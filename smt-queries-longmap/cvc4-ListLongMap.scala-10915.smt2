; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127756 () Bool)

(assert start!127756)

(declare-fun b!1501336 () Bool)

(declare-fun e!839890 () Bool)

(declare-fun e!839889 () Bool)

(assert (=> b!1501336 (= e!839890 e!839889)))

(declare-fun res!1022418 () Bool)

(assert (=> b!1501336 (=> (not res!1022418) (not e!839889))))

(declare-datatypes ((array!100137 0))(
  ( (array!100138 (arr!48328 (Array (_ BitVec 32) (_ BitVec 64))) (size!48878 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100137)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12538 0))(
  ( (MissingZero!12538 (index!52544 (_ BitVec 32))) (Found!12538 (index!52545 (_ BitVec 32))) (Intermediate!12538 (undefined!13350 Bool) (index!52546 (_ BitVec 32)) (x!134204 (_ BitVec 32))) (Undefined!12538) (MissingVacant!12538 (index!52547 (_ BitVec 32))) )
))
(declare-fun lt!653146 () SeekEntryResult!12538)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100137 (_ BitVec 32)) SeekEntryResult!12538)

(assert (=> b!1501336 (= res!1022418 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48328 a!2850) j!87) a!2850 mask!2661) lt!653146))))

(assert (=> b!1501336 (= lt!653146 (Found!12538 j!87))))

(declare-fun b!1501337 () Bool)

(declare-fun res!1022422 () Bool)

(assert (=> b!1501337 (=> (not res!1022422) (not e!839890))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501337 (= res!1022422 (and (= (size!48878 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48878 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48878 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501338 () Bool)

(declare-fun res!1022421 () Bool)

(assert (=> b!1501338 (=> (not res!1022421) (not e!839889))))

(assert (=> b!1501338 (= res!1022421 (not (= (select (arr!48328 a!2850) index!625) (select (arr!48328 a!2850) j!87))))))

(declare-fun b!1501339 () Bool)

(declare-fun e!839888 () Bool)

(assert (=> b!1501339 (= e!839889 e!839888)))

(declare-fun res!1022414 () Bool)

(assert (=> b!1501339 (=> (not res!1022414) (not e!839888))))

(declare-fun lt!653144 () (_ BitVec 32))

(assert (=> b!1501339 (= res!1022414 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653144 #b00000000000000000000000000000000) (bvslt lt!653144 (size!48878 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501339 (= lt!653144 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501340 () Bool)

(declare-fun res!1022419 () Bool)

(assert (=> b!1501340 (=> (not res!1022419) (not e!839890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100137 (_ BitVec 32)) Bool)

(assert (=> b!1501340 (= res!1022419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501341 () Bool)

(declare-fun res!1022420 () Bool)

(assert (=> b!1501341 (=> (not res!1022420) (not e!839890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501341 (= res!1022420 (validKeyInArray!0 (select (arr!48328 a!2850) i!996)))))

(declare-fun res!1022413 () Bool)

(assert (=> start!127756 (=> (not res!1022413) (not e!839890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127756 (= res!1022413 (validMask!0 mask!2661))))

(assert (=> start!127756 e!839890))

(assert (=> start!127756 true))

(declare-fun array_inv!37356 (array!100137) Bool)

(assert (=> start!127756 (array_inv!37356 a!2850)))

(declare-fun b!1501342 () Bool)

(assert (=> b!1501342 (= e!839888 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501342 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653144 vacantAfter!10 (select (store (arr!48328 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100138 (store (arr!48328 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48878 a!2850)) mask!2661) lt!653146)))

(declare-datatypes ((Unit!50230 0))(
  ( (Unit!50231) )
))
(declare-fun lt!653145 () Unit!50230)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50230)

(assert (=> b!1501342 (= lt!653145 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653144 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501343 () Bool)

(declare-fun res!1022412 () Bool)

(assert (=> b!1501343 (=> (not res!1022412) (not e!839890))))

(assert (=> b!1501343 (= res!1022412 (validKeyInArray!0 (select (arr!48328 a!2850) j!87)))))

(declare-fun b!1501344 () Bool)

(declare-fun res!1022415 () Bool)

(assert (=> b!1501344 (=> (not res!1022415) (not e!839890))))

(declare-datatypes ((List!34820 0))(
  ( (Nil!34817) (Cons!34816 (h!36213 (_ BitVec 64)) (t!49514 List!34820)) )
))
(declare-fun arrayNoDuplicates!0 (array!100137 (_ BitVec 32) List!34820) Bool)

(assert (=> b!1501344 (= res!1022415 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34817))))

(declare-fun b!1501345 () Bool)

(declare-fun res!1022416 () Bool)

(assert (=> b!1501345 (=> (not res!1022416) (not e!839890))))

(assert (=> b!1501345 (= res!1022416 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48878 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48878 a!2850)) (= (select (arr!48328 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48328 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48878 a!2850))))))

(declare-fun b!1501346 () Bool)

(declare-fun res!1022417 () Bool)

(assert (=> b!1501346 (=> (not res!1022417) (not e!839888))))

(assert (=> b!1501346 (= res!1022417 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653144 vacantBefore!10 (select (arr!48328 a!2850) j!87) a!2850 mask!2661) lt!653146))))

(assert (= (and start!127756 res!1022413) b!1501337))

(assert (= (and b!1501337 res!1022422) b!1501341))

(assert (= (and b!1501341 res!1022420) b!1501343))

(assert (= (and b!1501343 res!1022412) b!1501340))

(assert (= (and b!1501340 res!1022419) b!1501344))

(assert (= (and b!1501344 res!1022415) b!1501345))

(assert (= (and b!1501345 res!1022416) b!1501336))

(assert (= (and b!1501336 res!1022418) b!1501338))

(assert (= (and b!1501338 res!1022421) b!1501339))

(assert (= (and b!1501339 res!1022414) b!1501346))

(assert (= (and b!1501346 res!1022417) b!1501342))

(declare-fun m!1384561 () Bool)

(assert (=> b!1501344 m!1384561))

(declare-fun m!1384563 () Bool)

(assert (=> b!1501342 m!1384563))

(declare-fun m!1384565 () Bool)

(assert (=> b!1501342 m!1384565))

(assert (=> b!1501342 m!1384565))

(declare-fun m!1384567 () Bool)

(assert (=> b!1501342 m!1384567))

(declare-fun m!1384569 () Bool)

(assert (=> b!1501342 m!1384569))

(declare-fun m!1384571 () Bool)

(assert (=> b!1501343 m!1384571))

(assert (=> b!1501343 m!1384571))

(declare-fun m!1384573 () Bool)

(assert (=> b!1501343 m!1384573))

(declare-fun m!1384575 () Bool)

(assert (=> b!1501338 m!1384575))

(assert (=> b!1501338 m!1384571))

(assert (=> b!1501346 m!1384571))

(assert (=> b!1501346 m!1384571))

(declare-fun m!1384577 () Bool)

(assert (=> b!1501346 m!1384577))

(declare-fun m!1384579 () Bool)

(assert (=> b!1501340 m!1384579))

(declare-fun m!1384581 () Bool)

(assert (=> b!1501345 m!1384581))

(assert (=> b!1501345 m!1384563))

(declare-fun m!1384583 () Bool)

(assert (=> b!1501345 m!1384583))

(declare-fun m!1384585 () Bool)

(assert (=> b!1501339 m!1384585))

(declare-fun m!1384587 () Bool)

(assert (=> b!1501341 m!1384587))

(assert (=> b!1501341 m!1384587))

(declare-fun m!1384589 () Bool)

(assert (=> b!1501341 m!1384589))

(assert (=> b!1501336 m!1384571))

(assert (=> b!1501336 m!1384571))

(declare-fun m!1384591 () Bool)

(assert (=> b!1501336 m!1384591))

(declare-fun m!1384593 () Bool)

(assert (=> start!127756 m!1384593))

(declare-fun m!1384595 () Bool)

(assert (=> start!127756 m!1384595))

(push 1)

(assert (not b!1501341))

(assert (not b!1501340))

(assert (not b!1501336))

(assert (not b!1501339))

(assert (not start!127756))

(assert (not b!1501343))

(assert (not b!1501342))

(assert (not b!1501346))

(assert (not b!1501344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

