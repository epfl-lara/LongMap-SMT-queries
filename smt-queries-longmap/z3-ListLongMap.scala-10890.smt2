; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127556 () Bool)

(assert start!127556)

(declare-fun b!1498734 () Bool)

(declare-fun res!1020003 () Bool)

(declare-fun e!838985 () Bool)

(assert (=> b!1498734 (=> (not res!1020003) (not e!838985))))

(declare-datatypes ((array!99931 0))(
  ( (array!99932 (arr!48226 (Array (_ BitVec 32) (_ BitVec 64))) (size!48778 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99931)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498734 (= res!1020003 (validKeyInArray!0 (select (arr!48226 a!2850) i!996)))))

(declare-fun b!1498735 () Bool)

(declare-fun res!1020004 () Bool)

(assert (=> b!1498735 (=> (not res!1020004) (not e!838985))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498735 (= res!1020004 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48778 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48778 a!2850)) (= (select (arr!48226 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48226 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48778 a!2850))))))

(declare-fun res!1020002 () Bool)

(assert (=> start!127556 (=> (not res!1020002) (not e!838985))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127556 (= res!1020002 (validMask!0 mask!2661))))

(assert (=> start!127556 e!838985))

(assert (=> start!127556 true))

(declare-fun array_inv!37459 (array!99931) Bool)

(assert (=> start!127556 (array_inv!37459 a!2850)))

(declare-fun b!1498736 () Bool)

(declare-fun res!1019998 () Bool)

(assert (=> b!1498736 (=> (not res!1019998) (not e!838985))))

(declare-datatypes ((List!34796 0))(
  ( (Nil!34793) (Cons!34792 (h!36190 (_ BitVec 64)) (t!49482 List!34796)) )
))
(declare-fun arrayNoDuplicates!0 (array!99931 (_ BitVec 32) List!34796) Bool)

(assert (=> b!1498736 (= res!1019998 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34793))))

(declare-fun b!1498737 () Bool)

(declare-fun res!1019999 () Bool)

(assert (=> b!1498737 (=> (not res!1019999) (not e!838985))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498737 (= res!1019999 (and (= (size!48778 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48778 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48778 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498738 () Bool)

(declare-fun res!1020000 () Bool)

(assert (=> b!1498738 (=> (not res!1020000) (not e!838985))))

(declare-datatypes ((SeekEntryResult!12457 0))(
  ( (MissingZero!12457 (index!52220 (_ BitVec 32))) (Found!12457 (index!52221 (_ BitVec 32))) (Intermediate!12457 (undefined!13269 Bool) (index!52222 (_ BitVec 32)) (x!133918 (_ BitVec 32))) (Undefined!12457) (MissingVacant!12457 (index!52223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99931 (_ BitVec 32)) SeekEntryResult!12457)

(assert (=> b!1498738 (= res!1020000 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48226 a!2850) j!87) a!2850 mask!2661) (Found!12457 j!87)))))

(declare-fun b!1498739 () Bool)

(assert (=> b!1498739 (= e!838985 (and (not (= (select (arr!48226 a!2850) index!625) (select (arr!48226 a!2850) j!87))) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498740 () Bool)

(declare-fun res!1020005 () Bool)

(assert (=> b!1498740 (=> (not res!1020005) (not e!838985))))

(assert (=> b!1498740 (= res!1020005 (validKeyInArray!0 (select (arr!48226 a!2850) j!87)))))

(declare-fun b!1498741 () Bool)

(declare-fun res!1020001 () Bool)

(assert (=> b!1498741 (=> (not res!1020001) (not e!838985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99931 (_ BitVec 32)) Bool)

(assert (=> b!1498741 (= res!1020001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127556 res!1020002) b!1498737))

(assert (= (and b!1498737 res!1019999) b!1498734))

(assert (= (and b!1498734 res!1020003) b!1498740))

(assert (= (and b!1498740 res!1020005) b!1498741))

(assert (= (and b!1498741 res!1020001) b!1498736))

(assert (= (and b!1498736 res!1019998) b!1498735))

(assert (= (and b!1498735 res!1020004) b!1498738))

(assert (= (and b!1498738 res!1020000) b!1498739))

(declare-fun m!1381357 () Bool)

(assert (=> b!1498738 m!1381357))

(assert (=> b!1498738 m!1381357))

(declare-fun m!1381359 () Bool)

(assert (=> b!1498738 m!1381359))

(declare-fun m!1381361 () Bool)

(assert (=> b!1498736 m!1381361))

(declare-fun m!1381363 () Bool)

(assert (=> start!127556 m!1381363))

(declare-fun m!1381365 () Bool)

(assert (=> start!127556 m!1381365))

(declare-fun m!1381367 () Bool)

(assert (=> b!1498741 m!1381367))

(declare-fun m!1381369 () Bool)

(assert (=> b!1498734 m!1381369))

(assert (=> b!1498734 m!1381369))

(declare-fun m!1381371 () Bool)

(assert (=> b!1498734 m!1381371))

(declare-fun m!1381373 () Bool)

(assert (=> b!1498735 m!1381373))

(declare-fun m!1381375 () Bool)

(assert (=> b!1498735 m!1381375))

(declare-fun m!1381377 () Bool)

(assert (=> b!1498735 m!1381377))

(declare-fun m!1381379 () Bool)

(assert (=> b!1498739 m!1381379))

(assert (=> b!1498739 m!1381357))

(assert (=> b!1498740 m!1381357))

(assert (=> b!1498740 m!1381357))

(declare-fun m!1381381 () Bool)

(assert (=> b!1498740 m!1381381))

(check-sat (not b!1498738) (not b!1498736) (not b!1498741) (not start!127556) (not b!1498734) (not b!1498740))
(check-sat)
