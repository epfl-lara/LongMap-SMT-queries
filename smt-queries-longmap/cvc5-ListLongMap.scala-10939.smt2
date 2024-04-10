; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127968 () Bool)

(assert start!127968)

(declare-fun b!1503336 () Bool)

(declare-fun res!1024216 () Bool)

(declare-fun e!840588 () Bool)

(assert (=> b!1503336 (=> (not res!1024216) (not e!840588))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100283 0))(
  ( (array!100284 (arr!48398 (Array (_ BitVec 32) (_ BitVec 64))) (size!48948 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100283)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12596 0))(
  ( (MissingZero!12596 (index!52776 (_ BitVec 32))) (Found!12596 (index!52777 (_ BitVec 32))) (Intermediate!12596 (undefined!13408 Bool) (index!52778 (_ BitVec 32)) (x!134460 (_ BitVec 32))) (Undefined!12596) (MissingVacant!12596 (index!52779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100283 (_ BitVec 32)) SeekEntryResult!12596)

(assert (=> b!1503336 (= res!1024216 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48398 a!2850) j!87) a!2850 mask!2661) (Found!12596 j!87)))))

(declare-fun b!1503337 () Bool)

(declare-fun res!1024222 () Bool)

(assert (=> b!1503337 (=> (not res!1024222) (not e!840588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100283 (_ BitVec 32)) Bool)

(assert (=> b!1503337 (= res!1024222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503338 () Bool)

(declare-fun res!1024214 () Bool)

(assert (=> b!1503338 (=> (not res!1024214) (not e!840588))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503338 (= res!1024214 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48948 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48948 a!2850)) (= (select (arr!48398 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48398 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48948 a!2850))))))

(declare-fun res!1024215 () Bool)

(assert (=> start!127968 (=> (not res!1024215) (not e!840588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127968 (= res!1024215 (validMask!0 mask!2661))))

(assert (=> start!127968 e!840588))

(assert (=> start!127968 true))

(declare-fun array_inv!37426 (array!100283) Bool)

(assert (=> start!127968 (array_inv!37426 a!2850)))

(declare-fun b!1503339 () Bool)

(assert (=> b!1503339 (= e!840588 false)))

(declare-fun lt!653515 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503339 (= lt!653515 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503340 () Bool)

(declare-fun res!1024217 () Bool)

(assert (=> b!1503340 (=> (not res!1024217) (not e!840588))))

(assert (=> b!1503340 (= res!1024217 (not (= (select (arr!48398 a!2850) index!625) (select (arr!48398 a!2850) j!87))))))

(declare-fun b!1503341 () Bool)

(declare-fun res!1024220 () Bool)

(assert (=> b!1503341 (=> (not res!1024220) (not e!840588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503341 (= res!1024220 (validKeyInArray!0 (select (arr!48398 a!2850) i!996)))))

(declare-fun b!1503342 () Bool)

(declare-fun res!1024221 () Bool)

(assert (=> b!1503342 (=> (not res!1024221) (not e!840588))))

(declare-datatypes ((List!34890 0))(
  ( (Nil!34887) (Cons!34886 (h!36283 (_ BitVec 64)) (t!49584 List!34890)) )
))
(declare-fun arrayNoDuplicates!0 (array!100283 (_ BitVec 32) List!34890) Bool)

(assert (=> b!1503342 (= res!1024221 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34887))))

(declare-fun b!1503343 () Bool)

(declare-fun res!1024219 () Bool)

(assert (=> b!1503343 (=> (not res!1024219) (not e!840588))))

(assert (=> b!1503343 (= res!1024219 (and (= (size!48948 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48948 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48948 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503344 () Bool)

(declare-fun res!1024218 () Bool)

(assert (=> b!1503344 (=> (not res!1024218) (not e!840588))))

(assert (=> b!1503344 (= res!1024218 (validKeyInArray!0 (select (arr!48398 a!2850) j!87)))))

(assert (= (and start!127968 res!1024215) b!1503343))

(assert (= (and b!1503343 res!1024219) b!1503341))

(assert (= (and b!1503341 res!1024220) b!1503344))

(assert (= (and b!1503344 res!1024218) b!1503337))

(assert (= (and b!1503337 res!1024222) b!1503342))

(assert (= (and b!1503342 res!1024221) b!1503338))

(assert (= (and b!1503338 res!1024214) b!1503336))

(assert (= (and b!1503336 res!1024216) b!1503340))

(assert (= (and b!1503340 res!1024217) b!1503339))

(declare-fun m!1386583 () Bool)

(assert (=> b!1503337 m!1386583))

(declare-fun m!1386585 () Bool)

(assert (=> b!1503338 m!1386585))

(declare-fun m!1386587 () Bool)

(assert (=> b!1503338 m!1386587))

(declare-fun m!1386589 () Bool)

(assert (=> b!1503338 m!1386589))

(declare-fun m!1386591 () Bool)

(assert (=> b!1503341 m!1386591))

(assert (=> b!1503341 m!1386591))

(declare-fun m!1386593 () Bool)

(assert (=> b!1503341 m!1386593))

(declare-fun m!1386595 () Bool)

(assert (=> b!1503340 m!1386595))

(declare-fun m!1386597 () Bool)

(assert (=> b!1503340 m!1386597))

(declare-fun m!1386599 () Bool)

(assert (=> b!1503339 m!1386599))

(assert (=> b!1503344 m!1386597))

(assert (=> b!1503344 m!1386597))

(declare-fun m!1386601 () Bool)

(assert (=> b!1503344 m!1386601))

(declare-fun m!1386603 () Bool)

(assert (=> start!127968 m!1386603))

(declare-fun m!1386605 () Bool)

(assert (=> start!127968 m!1386605))

(declare-fun m!1386607 () Bool)

(assert (=> b!1503342 m!1386607))

(assert (=> b!1503336 m!1386597))

(assert (=> b!1503336 m!1386597))

(declare-fun m!1386609 () Bool)

(assert (=> b!1503336 m!1386609))

(push 1)

(assert (not b!1503336))

(assert (not start!127968))

(assert (not b!1503339))

(assert (not b!1503344))

(assert (not b!1503337))

(assert (not b!1503342))

(assert (not b!1503341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

