; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127820 () Bool)

(assert start!127820)

(declare-fun b!1502093 () Bool)

(declare-fun res!1023171 () Bool)

(declare-fun e!840163 () Bool)

(assert (=> b!1502093 (=> (not res!1023171) (not e!840163))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100201 0))(
  ( (array!100202 (arr!48360 (Array (_ BitVec 32) (_ BitVec 64))) (size!48910 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100201)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502093 (= res!1023171 (and (= (size!48910 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48910 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48910 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502094 () Bool)

(assert (=> b!1502094 (= e!840163 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12558 0))(
  ( (MissingZero!12558 (index!52624 (_ BitVec 32))) (Found!12558 (index!52625 (_ BitVec 32))) (Intermediate!12558 (undefined!13370 Bool) (index!52626 (_ BitVec 32)) (x!134312 (_ BitVec 32))) (Undefined!12558) (MissingVacant!12558 (index!52627 (_ BitVec 32))) )
))
(declare-fun lt!653314 () SeekEntryResult!12558)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100201 (_ BitVec 32)) SeekEntryResult!12558)

(assert (=> b!1502094 (= lt!653314 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48360 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502095 () Bool)

(declare-fun res!1023173 () Bool)

(assert (=> b!1502095 (=> (not res!1023173) (not e!840163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100201 (_ BitVec 32)) Bool)

(assert (=> b!1502095 (= res!1023173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502096 () Bool)

(declare-fun res!1023174 () Bool)

(assert (=> b!1502096 (=> (not res!1023174) (not e!840163))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502096 (= res!1023174 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48910 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48910 a!2850)) (= (select (arr!48360 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48360 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48910 a!2850))))))

(declare-fun b!1502097 () Bool)

(declare-fun res!1023169 () Bool)

(assert (=> b!1502097 (=> (not res!1023169) (not e!840163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502097 (= res!1023169 (validKeyInArray!0 (select (arr!48360 a!2850) i!996)))))

(declare-fun b!1502098 () Bool)

(declare-fun res!1023172 () Bool)

(assert (=> b!1502098 (=> (not res!1023172) (not e!840163))))

(declare-datatypes ((List!34852 0))(
  ( (Nil!34849) (Cons!34848 (h!36245 (_ BitVec 64)) (t!49546 List!34852)) )
))
(declare-fun arrayNoDuplicates!0 (array!100201 (_ BitVec 32) List!34852) Bool)

(assert (=> b!1502098 (= res!1023172 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34849))))

(declare-fun res!1023175 () Bool)

(assert (=> start!127820 (=> (not res!1023175) (not e!840163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127820 (= res!1023175 (validMask!0 mask!2661))))

(assert (=> start!127820 e!840163))

(assert (=> start!127820 true))

(declare-fun array_inv!37388 (array!100201) Bool)

(assert (=> start!127820 (array_inv!37388 a!2850)))

(declare-fun b!1502099 () Bool)

(declare-fun res!1023170 () Bool)

(assert (=> b!1502099 (=> (not res!1023170) (not e!840163))))

(assert (=> b!1502099 (= res!1023170 (validKeyInArray!0 (select (arr!48360 a!2850) j!87)))))

(assert (= (and start!127820 res!1023175) b!1502093))

(assert (= (and b!1502093 res!1023171) b!1502097))

(assert (= (and b!1502097 res!1023169) b!1502099))

(assert (= (and b!1502099 res!1023170) b!1502095))

(assert (= (and b!1502095 res!1023173) b!1502098))

(assert (= (and b!1502098 res!1023172) b!1502096))

(assert (= (and b!1502096 res!1023174) b!1502094))

(declare-fun m!1385395 () Bool)

(assert (=> b!1502094 m!1385395))

(assert (=> b!1502094 m!1385395))

(declare-fun m!1385397 () Bool)

(assert (=> b!1502094 m!1385397))

(declare-fun m!1385399 () Bool)

(assert (=> b!1502096 m!1385399))

(declare-fun m!1385401 () Bool)

(assert (=> b!1502096 m!1385401))

(declare-fun m!1385403 () Bool)

(assert (=> b!1502096 m!1385403))

(declare-fun m!1385405 () Bool)

(assert (=> b!1502098 m!1385405))

(declare-fun m!1385407 () Bool)

(assert (=> start!127820 m!1385407))

(declare-fun m!1385409 () Bool)

(assert (=> start!127820 m!1385409))

(declare-fun m!1385411 () Bool)

(assert (=> b!1502095 m!1385411))

(assert (=> b!1502099 m!1385395))

(assert (=> b!1502099 m!1385395))

(declare-fun m!1385413 () Bool)

(assert (=> b!1502099 m!1385413))

(declare-fun m!1385415 () Bool)

(assert (=> b!1502097 m!1385415))

(assert (=> b!1502097 m!1385415))

(declare-fun m!1385417 () Bool)

(assert (=> b!1502097 m!1385417))

(check-sat (not b!1502097) (not b!1502099) (not b!1502098) (not start!127820) (not b!1502095) (not b!1502094))
