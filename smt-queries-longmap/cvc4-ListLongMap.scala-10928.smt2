; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128170 () Bool)

(assert start!128170)

(declare-fun b!1504201 () Bool)

(declare-fun res!1024010 () Bool)

(declare-fun e!841427 () Bool)

(assert (=> b!1504201 (=> (not res!1024010) (not e!841427))))

(declare-datatypes ((array!100332 0))(
  ( (array!100333 (arr!48419 (Array (_ BitVec 32) (_ BitVec 64))) (size!48970 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100332)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504201 (= res!1024010 (validKeyInArray!0 (select (arr!48419 a!2850) i!996)))))

(declare-fun b!1504202 () Bool)

(declare-fun res!1024007 () Bool)

(assert (=> b!1504202 (=> (not res!1024007) (not e!841427))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504202 (= res!1024007 (validKeyInArray!0 (select (arr!48419 a!2850) j!87)))))

(declare-fun b!1504203 () Bool)

(declare-fun res!1024008 () Bool)

(assert (=> b!1504203 (=> (not res!1024008) (not e!841427))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100332 (_ BitVec 32)) Bool)

(assert (=> b!1504203 (= res!1024008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504204 () Bool)

(declare-fun res!1024006 () Bool)

(assert (=> b!1504204 (=> (not res!1024006) (not e!841427))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504204 (= res!1024006 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48970 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48970 a!2850)) (= (select (arr!48419 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48419 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48970 a!2850))))))

(declare-fun res!1024009 () Bool)

(assert (=> start!128170 (=> (not res!1024009) (not e!841427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128170 (= res!1024009 (validMask!0 mask!2661))))

(assert (=> start!128170 e!841427))

(assert (=> start!128170 true))

(declare-fun array_inv!37700 (array!100332) Bool)

(assert (=> start!128170 (array_inv!37700 a!2850)))

(declare-fun b!1504205 () Bool)

(declare-fun res!1024005 () Bool)

(assert (=> b!1504205 (=> (not res!1024005) (not e!841427))))

(declare-datatypes ((List!34898 0))(
  ( (Nil!34895) (Cons!34894 (h!36306 (_ BitVec 64)) (t!49584 List!34898)) )
))
(declare-fun arrayNoDuplicates!0 (array!100332 (_ BitVec 32) List!34898) Bool)

(assert (=> b!1504205 (= res!1024005 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34895))))

(declare-fun b!1504206 () Bool)

(assert (=> b!1504206 (= e!841427 false)))

(declare-datatypes ((SeekEntryResult!12510 0))(
  ( (MissingZero!12510 (index!52432 (_ BitVec 32))) (Found!12510 (index!52433 (_ BitVec 32))) (Intermediate!12510 (undefined!13322 Bool) (index!52434 (_ BitVec 32)) (x!134320 (_ BitVec 32))) (Undefined!12510) (MissingVacant!12510 (index!52435 (_ BitVec 32))) )
))
(declare-fun lt!654033 () SeekEntryResult!12510)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100332 (_ BitVec 32)) SeekEntryResult!12510)

(assert (=> b!1504206 (= lt!654033 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48419 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504207 () Bool)

(declare-fun res!1024004 () Bool)

(assert (=> b!1504207 (=> (not res!1024004) (not e!841427))))

(assert (=> b!1504207 (= res!1024004 (and (= (size!48970 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48970 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48970 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128170 res!1024009) b!1504207))

(assert (= (and b!1504207 res!1024004) b!1504201))

(assert (= (and b!1504201 res!1024010) b!1504202))

(assert (= (and b!1504202 res!1024007) b!1504203))

(assert (= (and b!1504203 res!1024008) b!1504205))

(assert (= (and b!1504205 res!1024005) b!1504204))

(assert (= (and b!1504204 res!1024006) b!1504206))

(declare-fun m!1387401 () Bool)

(assert (=> b!1504206 m!1387401))

(assert (=> b!1504206 m!1387401))

(declare-fun m!1387403 () Bool)

(assert (=> b!1504206 m!1387403))

(declare-fun m!1387405 () Bool)

(assert (=> start!128170 m!1387405))

(declare-fun m!1387407 () Bool)

(assert (=> start!128170 m!1387407))

(declare-fun m!1387409 () Bool)

(assert (=> b!1504201 m!1387409))

(assert (=> b!1504201 m!1387409))

(declare-fun m!1387411 () Bool)

(assert (=> b!1504201 m!1387411))

(assert (=> b!1504202 m!1387401))

(assert (=> b!1504202 m!1387401))

(declare-fun m!1387413 () Bool)

(assert (=> b!1504202 m!1387413))

(declare-fun m!1387415 () Bool)

(assert (=> b!1504204 m!1387415))

(declare-fun m!1387417 () Bool)

(assert (=> b!1504204 m!1387417))

(declare-fun m!1387419 () Bool)

(assert (=> b!1504204 m!1387419))

(declare-fun m!1387421 () Bool)

(assert (=> b!1504203 m!1387421))

(declare-fun m!1387423 () Bool)

(assert (=> b!1504205 m!1387423))

(push 1)

(assert (not b!1504202))

(assert (not b!1504205))

(assert (not b!1504201))

(assert (not b!1504206))

(assert (not b!1504203))

(assert (not start!128170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

