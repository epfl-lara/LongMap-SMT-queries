; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128122 () Bool)

(assert start!128122)

(declare-fun b!1503931 () Bool)

(declare-fun e!841301 () Bool)

(assert (=> b!1503931 (= e!841301 false)))

(declare-datatypes ((SeekEntryResult!12504 0))(
  ( (MissingZero!12504 (index!52408 (_ BitVec 32))) (Found!12504 (index!52409 (_ BitVec 32))) (Intermediate!12504 (undefined!13316 Bool) (index!52410 (_ BitVec 32)) (x!134295 (_ BitVec 32))) (Undefined!12504) (MissingVacant!12504 (index!52411 (_ BitVec 32))) )
))
(declare-fun lt!653979 () SeekEntryResult!12504)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100317 0))(
  ( (array!100318 (arr!48413 (Array (_ BitVec 32) (_ BitVec 64))) (size!48964 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100317)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100317 (_ BitVec 32)) SeekEntryResult!12504)

(assert (=> b!1503931 (= lt!653979 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48413 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503932 () Bool)

(declare-fun res!1023827 () Bool)

(assert (=> b!1503932 (=> (not res!1023827) (not e!841301))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503932 (= res!1023827 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48964 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48964 a!2850)) (= (select (arr!48413 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48413 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48964 a!2850))))))

(declare-fun b!1503933 () Bool)

(declare-fun res!1023828 () Bool)

(assert (=> b!1503933 (=> (not res!1023828) (not e!841301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503933 (= res!1023828 (validKeyInArray!0 (select (arr!48413 a!2850) j!87)))))

(declare-fun b!1503934 () Bool)

(declare-fun res!1023829 () Bool)

(assert (=> b!1503934 (=> (not res!1023829) (not e!841301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100317 (_ BitVec 32)) Bool)

(assert (=> b!1503934 (= res!1023829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1023826 () Bool)

(assert (=> start!128122 (=> (not res!1023826) (not e!841301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128122 (= res!1023826 (validMask!0 mask!2661))))

(assert (=> start!128122 e!841301))

(assert (=> start!128122 true))

(declare-fun array_inv!37694 (array!100317) Bool)

(assert (=> start!128122 (array_inv!37694 a!2850)))

(declare-fun b!1503935 () Bool)

(declare-fun res!1023824 () Bool)

(assert (=> b!1503935 (=> (not res!1023824) (not e!841301))))

(assert (=> b!1503935 (= res!1023824 (and (= (size!48964 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48964 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48964 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503936 () Bool)

(declare-fun res!1023825 () Bool)

(assert (=> b!1503936 (=> (not res!1023825) (not e!841301))))

(declare-datatypes ((List!34892 0))(
  ( (Nil!34889) (Cons!34888 (h!36300 (_ BitVec 64)) (t!49578 List!34892)) )
))
(declare-fun arrayNoDuplicates!0 (array!100317 (_ BitVec 32) List!34892) Bool)

(assert (=> b!1503936 (= res!1023825 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34889))))

(declare-fun b!1503937 () Bool)

(declare-fun res!1023830 () Bool)

(assert (=> b!1503937 (=> (not res!1023830) (not e!841301))))

(assert (=> b!1503937 (= res!1023830 (validKeyInArray!0 (select (arr!48413 a!2850) i!996)))))

(assert (= (and start!128122 res!1023826) b!1503935))

(assert (= (and b!1503935 res!1023824) b!1503937))

(assert (= (and b!1503937 res!1023830) b!1503933))

(assert (= (and b!1503933 res!1023828) b!1503934))

(assert (= (and b!1503934 res!1023829) b!1503936))

(assert (= (and b!1503936 res!1023825) b!1503932))

(assert (= (and b!1503932 res!1023827) b!1503931))

(declare-fun m!1387183 () Bool)

(assert (=> b!1503934 m!1387183))

(declare-fun m!1387185 () Bool)

(assert (=> b!1503932 m!1387185))

(declare-fun m!1387187 () Bool)

(assert (=> b!1503932 m!1387187))

(declare-fun m!1387189 () Bool)

(assert (=> b!1503932 m!1387189))

(declare-fun m!1387191 () Bool)

(assert (=> b!1503931 m!1387191))

(assert (=> b!1503931 m!1387191))

(declare-fun m!1387193 () Bool)

(assert (=> b!1503931 m!1387193))

(declare-fun m!1387195 () Bool)

(assert (=> start!128122 m!1387195))

(declare-fun m!1387197 () Bool)

(assert (=> start!128122 m!1387197))

(declare-fun m!1387199 () Bool)

(assert (=> b!1503937 m!1387199))

(assert (=> b!1503937 m!1387199))

(declare-fun m!1387201 () Bool)

(assert (=> b!1503937 m!1387201))

(declare-fun m!1387203 () Bool)

(assert (=> b!1503936 m!1387203))

(assert (=> b!1503933 m!1387191))

(assert (=> b!1503933 m!1387191))

(declare-fun m!1387205 () Bool)

(assert (=> b!1503933 m!1387205))

(push 1)

(assert (not start!128122))

(assert (not b!1503936))

(assert (not b!1503931))

(assert (not b!1503937))

(assert (not b!1503933))

(assert (not b!1503934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

