; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128056 () Bool)

(assert start!128056)

(declare-fun b!1504092 () Bool)

(declare-fun res!1024881 () Bool)

(declare-fun e!840817 () Bool)

(assert (=> b!1504092 (=> (not res!1024881) (not e!840817))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100332 0))(
  ( (array!100333 (arr!48421 (Array (_ BitVec 32) (_ BitVec 64))) (size!48971 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100332)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12619 0))(
  ( (MissingZero!12619 (index!52868 (_ BitVec 32))) (Found!12619 (index!52869 (_ BitVec 32))) (Intermediate!12619 (undefined!13431 Bool) (index!52870 (_ BitVec 32)) (x!134545 (_ BitVec 32))) (Undefined!12619) (MissingVacant!12619 (index!52871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100332 (_ BitVec 32)) SeekEntryResult!12619)

(assert (=> b!1504092 (= res!1024881 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48421 a!2850) j!87) a!2850 mask!2661) (Found!12619 j!87)))))

(declare-fun b!1504093 () Bool)

(declare-fun res!1024888 () Bool)

(assert (=> b!1504093 (=> (not res!1024888) (not e!840817))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504093 (= res!1024888 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48971 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48971 a!2850)) (= (select (arr!48421 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48421 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48971 a!2850))))))

(declare-fun b!1504094 () Bool)

(declare-fun res!1024882 () Bool)

(assert (=> b!1504094 (=> (not res!1024882) (not e!840817))))

(assert (=> b!1504094 (= res!1024882 (not (= (select (arr!48421 a!2850) index!625) (select (arr!48421 a!2850) j!87))))))

(declare-fun res!1024886 () Bool)

(assert (=> start!128056 (=> (not res!1024886) (not e!840817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128056 (= res!1024886 (validMask!0 mask!2661))))

(assert (=> start!128056 e!840817))

(assert (=> start!128056 true))

(declare-fun array_inv!37449 (array!100332) Bool)

(assert (=> start!128056 (array_inv!37449 a!2850)))

(declare-fun b!1504095 () Bool)

(declare-fun res!1024883 () Bool)

(assert (=> b!1504095 (=> (not res!1024883) (not e!840817))))

(declare-datatypes ((List!34913 0))(
  ( (Nil!34910) (Cons!34909 (h!36306 (_ BitVec 64)) (t!49607 List!34913)) )
))
(declare-fun arrayNoDuplicates!0 (array!100332 (_ BitVec 32) List!34913) Bool)

(assert (=> b!1504095 (= res!1024883 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34910))))

(declare-fun b!1504096 () Bool)

(declare-fun res!1024880 () Bool)

(assert (=> b!1504096 (=> (not res!1024880) (not e!840817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504096 (= res!1024880 (validKeyInArray!0 (select (arr!48421 a!2850) j!87)))))

(declare-fun b!1504097 () Bool)

(declare-fun res!1024887 () Bool)

(assert (=> b!1504097 (=> (not res!1024887) (not e!840817))))

(assert (=> b!1504097 (= res!1024887 (validKeyInArray!0 (select (arr!48421 a!2850) i!996)))))

(declare-fun b!1504098 () Bool)

(declare-fun res!1024885 () Bool)

(assert (=> b!1504098 (=> (not res!1024885) (not e!840817))))

(assert (=> b!1504098 (= res!1024885 (and (= (size!48971 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48971 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48971 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504099 () Bool)

(assert (=> b!1504099 (= e!840817 false)))

(declare-fun lt!653638 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504099 (= lt!653638 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504100 () Bool)

(declare-fun res!1024884 () Bool)

(assert (=> b!1504100 (=> (not res!1024884) (not e!840817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100332 (_ BitVec 32)) Bool)

(assert (=> b!1504100 (= res!1024884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128056 res!1024886) b!1504098))

(assert (= (and b!1504098 res!1024885) b!1504097))

(assert (= (and b!1504097 res!1024887) b!1504096))

(assert (= (and b!1504096 res!1024880) b!1504100))

(assert (= (and b!1504100 res!1024884) b!1504095))

(assert (= (and b!1504095 res!1024883) b!1504093))

(assert (= (and b!1504093 res!1024888) b!1504092))

(assert (= (and b!1504092 res!1024881) b!1504094))

(assert (= (and b!1504094 res!1024882) b!1504099))

(declare-fun m!1387299 () Bool)

(assert (=> b!1504093 m!1387299))

(declare-fun m!1387301 () Bool)

(assert (=> b!1504093 m!1387301))

(declare-fun m!1387303 () Bool)

(assert (=> b!1504093 m!1387303))

(declare-fun m!1387305 () Bool)

(assert (=> b!1504092 m!1387305))

(assert (=> b!1504092 m!1387305))

(declare-fun m!1387307 () Bool)

(assert (=> b!1504092 m!1387307))

(declare-fun m!1387309 () Bool)

(assert (=> b!1504099 m!1387309))

(declare-fun m!1387311 () Bool)

(assert (=> b!1504095 m!1387311))

(declare-fun m!1387313 () Bool)

(assert (=> b!1504094 m!1387313))

(assert (=> b!1504094 m!1387305))

(declare-fun m!1387315 () Bool)

(assert (=> start!128056 m!1387315))

(declare-fun m!1387317 () Bool)

(assert (=> start!128056 m!1387317))

(assert (=> b!1504096 m!1387305))

(assert (=> b!1504096 m!1387305))

(declare-fun m!1387319 () Bool)

(assert (=> b!1504096 m!1387319))

(declare-fun m!1387321 () Bool)

(assert (=> b!1504100 m!1387321))

(declare-fun m!1387323 () Bool)

(assert (=> b!1504097 m!1387323))

(assert (=> b!1504097 m!1387323))

(declare-fun m!1387325 () Bool)

(assert (=> b!1504097 m!1387325))

(push 1)

(assert (not b!1504092))

(assert (not b!1504097))

(assert (not b!1504095))

(assert (not b!1504100))

(assert (not b!1504099))

(assert (not start!128056))

(assert (not b!1504096))

(check-sat)

(pop 1)

