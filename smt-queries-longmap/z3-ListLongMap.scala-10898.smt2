; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127604 () Bool)

(assert start!127604)

(declare-fun b!1499395 () Bool)

(declare-fun e!839177 () Bool)

(assert (=> b!1499395 (= e!839177 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99979 0))(
  ( (array!99980 (arr!48250 (Array (_ BitVec 32) (_ BitVec 64))) (size!48802 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99979)

(declare-fun lt!652512 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12481 0))(
  ( (MissingZero!12481 (index!52316 (_ BitVec 32))) (Found!12481 (index!52317 (_ BitVec 32))) (Intermediate!12481 (undefined!13293 Bool) (index!52318 (_ BitVec 32)) (x!134006 (_ BitVec 32))) (Undefined!12481) (MissingVacant!12481 (index!52319 (_ BitVec 32))) )
))
(declare-fun lt!652513 () SeekEntryResult!12481)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99979 (_ BitVec 32)) SeekEntryResult!12481)

(assert (=> b!1499395 (= lt!652513 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652512 vacantBefore!10 (select (arr!48250 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499396 () Bool)

(declare-fun res!1020659 () Bool)

(declare-fun e!839176 () Bool)

(assert (=> b!1499396 (=> (not res!1020659) (not e!839176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499396 (= res!1020659 (validKeyInArray!0 (select (arr!48250 a!2850) j!87)))))

(declare-fun b!1499397 () Bool)

(declare-fun res!1020661 () Bool)

(assert (=> b!1499397 (=> (not res!1020661) (not e!839176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99979 (_ BitVec 32)) Bool)

(assert (=> b!1499397 (= res!1020661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499398 () Bool)

(declare-fun res!1020666 () Bool)

(assert (=> b!1499398 (=> (not res!1020666) (not e!839176))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499398 (= res!1020666 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48802 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48802 a!2850)) (= (select (arr!48250 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48250 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48802 a!2850))))))

(declare-fun b!1499399 () Bool)

(declare-fun res!1020668 () Bool)

(assert (=> b!1499399 (=> (not res!1020668) (not e!839176))))

(assert (=> b!1499399 (= res!1020668 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48250 a!2850) j!87) a!2850 mask!2661) (Found!12481 j!87)))))

(declare-fun b!1499400 () Bool)

(declare-fun res!1020663 () Bool)

(assert (=> b!1499400 (=> (not res!1020663) (not e!839176))))

(assert (=> b!1499400 (= res!1020663 (and (= (size!48802 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48802 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48802 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499402 () Bool)

(declare-fun res!1020662 () Bool)

(assert (=> b!1499402 (=> (not res!1020662) (not e!839176))))

(assert (=> b!1499402 (= res!1020662 (not (= (select (arr!48250 a!2850) index!625) (select (arr!48250 a!2850) j!87))))))

(declare-fun b!1499403 () Bool)

(declare-fun res!1020667 () Bool)

(assert (=> b!1499403 (=> (not res!1020667) (not e!839176))))

(assert (=> b!1499403 (= res!1020667 (validKeyInArray!0 (select (arr!48250 a!2850) i!996)))))

(declare-fun b!1499404 () Bool)

(declare-fun res!1020664 () Bool)

(assert (=> b!1499404 (=> (not res!1020664) (not e!839176))))

(declare-datatypes ((List!34820 0))(
  ( (Nil!34817) (Cons!34816 (h!36214 (_ BitVec 64)) (t!49506 List!34820)) )
))
(declare-fun arrayNoDuplicates!0 (array!99979 (_ BitVec 32) List!34820) Bool)

(assert (=> b!1499404 (= res!1020664 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34817))))

(declare-fun res!1020660 () Bool)

(assert (=> start!127604 (=> (not res!1020660) (not e!839176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127604 (= res!1020660 (validMask!0 mask!2661))))

(assert (=> start!127604 e!839176))

(assert (=> start!127604 true))

(declare-fun array_inv!37483 (array!99979) Bool)

(assert (=> start!127604 (array_inv!37483 a!2850)))

(declare-fun b!1499401 () Bool)

(assert (=> b!1499401 (= e!839176 e!839177)))

(declare-fun res!1020665 () Bool)

(assert (=> b!1499401 (=> (not res!1020665) (not e!839177))))

(assert (=> b!1499401 (= res!1020665 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652512 #b00000000000000000000000000000000) (bvslt lt!652512 (size!48802 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499401 (= lt!652512 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127604 res!1020660) b!1499400))

(assert (= (and b!1499400 res!1020663) b!1499403))

(assert (= (and b!1499403 res!1020667) b!1499396))

(assert (= (and b!1499396 res!1020659) b!1499397))

(assert (= (and b!1499397 res!1020661) b!1499404))

(assert (= (and b!1499404 res!1020664) b!1499398))

(assert (= (and b!1499398 res!1020666) b!1499399))

(assert (= (and b!1499399 res!1020668) b!1499402))

(assert (= (and b!1499402 res!1020662) b!1499401))

(assert (= (and b!1499401 res!1020665) b!1499395))

(declare-fun m!1382035 () Bool)

(assert (=> b!1499404 m!1382035))

(declare-fun m!1382037 () Bool)

(assert (=> b!1499402 m!1382037))

(declare-fun m!1382039 () Bool)

(assert (=> b!1499402 m!1382039))

(declare-fun m!1382041 () Bool)

(assert (=> b!1499398 m!1382041))

(declare-fun m!1382043 () Bool)

(assert (=> b!1499398 m!1382043))

(declare-fun m!1382045 () Bool)

(assert (=> b!1499398 m!1382045))

(declare-fun m!1382047 () Bool)

(assert (=> b!1499397 m!1382047))

(assert (=> b!1499395 m!1382039))

(assert (=> b!1499395 m!1382039))

(declare-fun m!1382049 () Bool)

(assert (=> b!1499395 m!1382049))

(declare-fun m!1382051 () Bool)

(assert (=> start!127604 m!1382051))

(declare-fun m!1382053 () Bool)

(assert (=> start!127604 m!1382053))

(assert (=> b!1499399 m!1382039))

(assert (=> b!1499399 m!1382039))

(declare-fun m!1382055 () Bool)

(assert (=> b!1499399 m!1382055))

(assert (=> b!1499396 m!1382039))

(assert (=> b!1499396 m!1382039))

(declare-fun m!1382057 () Bool)

(assert (=> b!1499396 m!1382057))

(declare-fun m!1382059 () Bool)

(assert (=> b!1499401 m!1382059))

(declare-fun m!1382061 () Bool)

(assert (=> b!1499403 m!1382061))

(assert (=> b!1499403 m!1382061))

(declare-fun m!1382063 () Bool)

(assert (=> b!1499403 m!1382063))

(check-sat (not b!1499397) (not b!1499404) (not b!1499396) (not b!1499399) (not b!1499395) (not b!1499401) (not b!1499403) (not start!127604))
(check-sat)
