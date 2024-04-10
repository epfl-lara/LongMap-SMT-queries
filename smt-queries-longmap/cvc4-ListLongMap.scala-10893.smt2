; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127624 () Bool)

(assert start!127624)

(declare-fun b!1499321 () Bool)

(declare-fun res!1020406 () Bool)

(declare-fun e!839260 () Bool)

(assert (=> b!1499321 (=> (not res!1020406) (not e!839260))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100005 0))(
  ( (array!100006 (arr!48262 (Array (_ BitVec 32) (_ BitVec 64))) (size!48812 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100005)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12472 0))(
  ( (MissingZero!12472 (index!52280 (_ BitVec 32))) (Found!12472 (index!52281 (_ BitVec 32))) (Intermediate!12472 (undefined!13284 Bool) (index!52282 (_ BitVec 32)) (x!133962 (_ BitVec 32))) (Undefined!12472) (MissingVacant!12472 (index!52283 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100005 (_ BitVec 32)) SeekEntryResult!12472)

(assert (=> b!1499321 (= res!1020406 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48262 a!2850) j!87) a!2850 mask!2661) (Found!12472 j!87)))))

(declare-fun b!1499322 () Bool)

(declare-fun e!839258 () Bool)

(assert (=> b!1499322 (= e!839258 false)))

(declare-fun lt!652713 () SeekEntryResult!12472)

(declare-fun lt!652714 () (_ BitVec 32))

(assert (=> b!1499322 (= lt!652713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652714 vacantBefore!10 (select (arr!48262 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499323 () Bool)

(declare-fun res!1020398 () Bool)

(assert (=> b!1499323 (=> (not res!1020398) (not e!839260))))

(assert (=> b!1499323 (= res!1020398 (not (= (select (arr!48262 a!2850) index!625) (select (arr!48262 a!2850) j!87))))))

(declare-fun b!1499324 () Bool)

(declare-fun res!1020403 () Bool)

(assert (=> b!1499324 (=> (not res!1020403) (not e!839260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499324 (= res!1020403 (validKeyInArray!0 (select (arr!48262 a!2850) j!87)))))

(declare-fun res!1020397 () Bool)

(assert (=> start!127624 (=> (not res!1020397) (not e!839260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127624 (= res!1020397 (validMask!0 mask!2661))))

(assert (=> start!127624 e!839260))

(assert (=> start!127624 true))

(declare-fun array_inv!37290 (array!100005) Bool)

(assert (=> start!127624 (array_inv!37290 a!2850)))

(declare-fun b!1499325 () Bool)

(declare-fun res!1020401 () Bool)

(assert (=> b!1499325 (=> (not res!1020401) (not e!839260))))

(declare-datatypes ((List!34754 0))(
  ( (Nil!34751) (Cons!34750 (h!36147 (_ BitVec 64)) (t!49448 List!34754)) )
))
(declare-fun arrayNoDuplicates!0 (array!100005 (_ BitVec 32) List!34754) Bool)

(assert (=> b!1499325 (= res!1020401 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34751))))

(declare-fun b!1499326 () Bool)

(assert (=> b!1499326 (= e!839260 e!839258)))

(declare-fun res!1020402 () Bool)

(assert (=> b!1499326 (=> (not res!1020402) (not e!839258))))

(assert (=> b!1499326 (= res!1020402 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652714 #b00000000000000000000000000000000) (bvslt lt!652714 (size!48812 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499326 (= lt!652714 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499327 () Bool)

(declare-fun res!1020400 () Bool)

(assert (=> b!1499327 (=> (not res!1020400) (not e!839260))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499327 (= res!1020400 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48812 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48812 a!2850)) (= (select (arr!48262 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48262 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48812 a!2850))))))

(declare-fun b!1499328 () Bool)

(declare-fun res!1020404 () Bool)

(assert (=> b!1499328 (=> (not res!1020404) (not e!839260))))

(assert (=> b!1499328 (= res!1020404 (validKeyInArray!0 (select (arr!48262 a!2850) i!996)))))

(declare-fun b!1499329 () Bool)

(declare-fun res!1020405 () Bool)

(assert (=> b!1499329 (=> (not res!1020405) (not e!839260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100005 (_ BitVec 32)) Bool)

(assert (=> b!1499329 (= res!1020405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499330 () Bool)

(declare-fun res!1020399 () Bool)

(assert (=> b!1499330 (=> (not res!1020399) (not e!839260))))

(assert (=> b!1499330 (= res!1020399 (and (= (size!48812 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48812 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48812 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127624 res!1020397) b!1499330))

(assert (= (and b!1499330 res!1020399) b!1499328))

(assert (= (and b!1499328 res!1020404) b!1499324))

(assert (= (and b!1499324 res!1020403) b!1499329))

(assert (= (and b!1499329 res!1020405) b!1499325))

(assert (= (and b!1499325 res!1020401) b!1499327))

(assert (= (and b!1499327 res!1020400) b!1499321))

(assert (= (and b!1499321 res!1020406) b!1499323))

(assert (= (and b!1499323 res!1020398) b!1499326))

(assert (= (and b!1499326 res!1020402) b!1499322))

(declare-fun m!1382515 () Bool)

(assert (=> b!1499328 m!1382515))

(assert (=> b!1499328 m!1382515))

(declare-fun m!1382517 () Bool)

(assert (=> b!1499328 m!1382517))

(declare-fun m!1382519 () Bool)

(assert (=> b!1499327 m!1382519))

(declare-fun m!1382521 () Bool)

(assert (=> b!1499327 m!1382521))

(declare-fun m!1382523 () Bool)

(assert (=> b!1499327 m!1382523))

(declare-fun m!1382525 () Bool)

(assert (=> b!1499322 m!1382525))

(assert (=> b!1499322 m!1382525))

(declare-fun m!1382527 () Bool)

(assert (=> b!1499322 m!1382527))

(declare-fun m!1382529 () Bool)

(assert (=> start!127624 m!1382529))

(declare-fun m!1382531 () Bool)

(assert (=> start!127624 m!1382531))

(declare-fun m!1382533 () Bool)

(assert (=> b!1499329 m!1382533))

(declare-fun m!1382535 () Bool)

(assert (=> b!1499325 m!1382535))

(assert (=> b!1499321 m!1382525))

(assert (=> b!1499321 m!1382525))

(declare-fun m!1382537 () Bool)

(assert (=> b!1499321 m!1382537))

(assert (=> b!1499324 m!1382525))

(assert (=> b!1499324 m!1382525))

(declare-fun m!1382539 () Bool)

(assert (=> b!1499324 m!1382539))

(declare-fun m!1382541 () Bool)

(assert (=> b!1499323 m!1382541))

(assert (=> b!1499323 m!1382525))

(declare-fun m!1382543 () Bool)

(assert (=> b!1499326 m!1382543))

(push 1)

(assert (not b!1499324))

(assert (not b!1499329))

(assert (not b!1499326))

(assert (not start!127624))

(assert (not b!1499325))

(assert (not b!1499321))

(assert (not b!1499328))

(assert (not b!1499322))

(check-sat)

(pop 1)

