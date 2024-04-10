; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127548 () Bool)

(assert start!127548)

(declare-fun b!1498436 () Bool)

(declare-fun res!1019514 () Bool)

(declare-fun e!839022 () Bool)

(assert (=> b!1498436 (=> (not res!1019514) (not e!839022))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99929 0))(
  ( (array!99930 (arr!48224 (Array (_ BitVec 32) (_ BitVec 64))) (size!48774 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99929)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498436 (= res!1019514 (and (= (size!48774 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48774 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48774 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019513 () Bool)

(assert (=> start!127548 (=> (not res!1019513) (not e!839022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127548 (= res!1019513 (validMask!0 mask!2661))))

(assert (=> start!127548 e!839022))

(assert (=> start!127548 true))

(declare-fun array_inv!37252 (array!99929) Bool)

(assert (=> start!127548 (array_inv!37252 a!2850)))

(declare-fun b!1498437 () Bool)

(declare-fun res!1019515 () Bool)

(assert (=> b!1498437 (=> (not res!1019515) (not e!839022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498437 (= res!1019515 (validKeyInArray!0 (select (arr!48224 a!2850) j!87)))))

(declare-fun b!1498438 () Bool)

(declare-fun res!1019516 () Bool)

(assert (=> b!1498438 (=> (not res!1019516) (not e!839022))))

(assert (=> b!1498438 (= res!1019516 (validKeyInArray!0 (select (arr!48224 a!2850) i!996)))))

(declare-fun b!1498439 () Bool)

(declare-fun res!1019512 () Bool)

(assert (=> b!1498439 (=> (not res!1019512) (not e!839022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99929 (_ BitVec 32)) Bool)

(assert (=> b!1498439 (= res!1019512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498440 () Bool)

(assert (=> b!1498440 (= e!839022 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12434 0))(
  ( (MissingZero!12434 (index!52128 (_ BitVec 32))) (Found!12434 (index!52129 (_ BitVec 32))) (Intermediate!12434 (undefined!13246 Bool) (index!52130 (_ BitVec 32)) (x!133828 (_ BitVec 32))) (Undefined!12434) (MissingVacant!12434 (index!52131 (_ BitVec 32))) )
))
(declare-fun lt!652645 () SeekEntryResult!12434)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99929 (_ BitVec 32)) SeekEntryResult!12434)

(assert (=> b!1498440 (= lt!652645 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48224 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498441 () Bool)

(declare-fun res!1019517 () Bool)

(assert (=> b!1498441 (=> (not res!1019517) (not e!839022))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498441 (= res!1019517 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48774 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48774 a!2850)) (= (select (arr!48224 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48224 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48774 a!2850))))))

(declare-fun b!1498442 () Bool)

(declare-fun res!1019518 () Bool)

(assert (=> b!1498442 (=> (not res!1019518) (not e!839022))))

(declare-datatypes ((List!34716 0))(
  ( (Nil!34713) (Cons!34712 (h!36109 (_ BitVec 64)) (t!49410 List!34716)) )
))
(declare-fun arrayNoDuplicates!0 (array!99929 (_ BitVec 32) List!34716) Bool)

(assert (=> b!1498442 (= res!1019518 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34713))))

(assert (= (and start!127548 res!1019513) b!1498436))

(assert (= (and b!1498436 res!1019514) b!1498438))

(assert (= (and b!1498438 res!1019516) b!1498437))

(assert (= (and b!1498437 res!1019515) b!1498439))

(assert (= (and b!1498439 res!1019512) b!1498442))

(assert (= (and b!1498442 res!1019518) b!1498441))

(assert (= (and b!1498441 res!1019517) b!1498440))

(declare-fun m!1381543 () Bool)

(assert (=> start!127548 m!1381543))

(declare-fun m!1381545 () Bool)

(assert (=> start!127548 m!1381545))

(declare-fun m!1381547 () Bool)

(assert (=> b!1498439 m!1381547))

(declare-fun m!1381549 () Bool)

(assert (=> b!1498440 m!1381549))

(assert (=> b!1498440 m!1381549))

(declare-fun m!1381551 () Bool)

(assert (=> b!1498440 m!1381551))

(assert (=> b!1498437 m!1381549))

(assert (=> b!1498437 m!1381549))

(declare-fun m!1381553 () Bool)

(assert (=> b!1498437 m!1381553))

(declare-fun m!1381555 () Bool)

(assert (=> b!1498441 m!1381555))

(declare-fun m!1381557 () Bool)

(assert (=> b!1498441 m!1381557))

(declare-fun m!1381559 () Bool)

(assert (=> b!1498441 m!1381559))

(declare-fun m!1381561 () Bool)

(assert (=> b!1498438 m!1381561))

(assert (=> b!1498438 m!1381561))

(declare-fun m!1381563 () Bool)

(assert (=> b!1498438 m!1381563))

(declare-fun m!1381565 () Bool)

(assert (=> b!1498442 m!1381565))

(push 1)

(assert (not start!127548))

(assert (not b!1498439))

(assert (not b!1498437))

(assert (not b!1498442))

(assert (not b!1498438))

(assert (not b!1498440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

