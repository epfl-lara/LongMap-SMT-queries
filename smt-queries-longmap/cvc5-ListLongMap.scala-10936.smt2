; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127950 () Bool)

(assert start!127950)

(declare-fun b!1503093 () Bool)

(declare-fun e!840535 () Bool)

(assert (=> b!1503093 (= e!840535 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653488 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503093 (= lt!653488 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503094 () Bool)

(declare-fun res!1023977 () Bool)

(assert (=> b!1503094 (=> (not res!1023977) (not e!840535))))

(declare-datatypes ((array!100265 0))(
  ( (array!100266 (arr!48389 (Array (_ BitVec 32) (_ BitVec 64))) (size!48939 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100265)

(declare-datatypes ((List!34881 0))(
  ( (Nil!34878) (Cons!34877 (h!36274 (_ BitVec 64)) (t!49575 List!34881)) )
))
(declare-fun arrayNoDuplicates!0 (array!100265 (_ BitVec 32) List!34881) Bool)

(assert (=> b!1503094 (= res!1023977 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34878))))

(declare-fun b!1503095 () Bool)

(declare-fun res!1023973 () Bool)

(assert (=> b!1503095 (=> (not res!1023973) (not e!840535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100265 (_ BitVec 32)) Bool)

(assert (=> b!1503095 (= res!1023973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503096 () Bool)

(declare-fun res!1023976 () Bool)

(assert (=> b!1503096 (=> (not res!1023976) (not e!840535))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503096 (= res!1023976 (and (= (size!48939 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48939 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48939 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1023979 () Bool)

(assert (=> start!127950 (=> (not res!1023979) (not e!840535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127950 (= res!1023979 (validMask!0 mask!2661))))

(assert (=> start!127950 e!840535))

(assert (=> start!127950 true))

(declare-fun array_inv!37417 (array!100265) Bool)

(assert (=> start!127950 (array_inv!37417 a!2850)))

(declare-fun b!1503097 () Bool)

(declare-fun res!1023975 () Bool)

(assert (=> b!1503097 (=> (not res!1023975) (not e!840535))))

(assert (=> b!1503097 (= res!1023975 (not (= (select (arr!48389 a!2850) index!625) (select (arr!48389 a!2850) j!87))))))

(declare-fun b!1503098 () Bool)

(declare-fun res!1023971 () Bool)

(assert (=> b!1503098 (=> (not res!1023971) (not e!840535))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503098 (= res!1023971 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48939 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48939 a!2850)) (= (select (arr!48389 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48389 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48939 a!2850))))))

(declare-fun b!1503099 () Bool)

(declare-fun res!1023974 () Bool)

(assert (=> b!1503099 (=> (not res!1023974) (not e!840535))))

(declare-datatypes ((SeekEntryResult!12587 0))(
  ( (MissingZero!12587 (index!52740 (_ BitVec 32))) (Found!12587 (index!52741 (_ BitVec 32))) (Intermediate!12587 (undefined!13399 Bool) (index!52742 (_ BitVec 32)) (x!134427 (_ BitVec 32))) (Undefined!12587) (MissingVacant!12587 (index!52743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100265 (_ BitVec 32)) SeekEntryResult!12587)

(assert (=> b!1503099 (= res!1023974 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48389 a!2850) j!87) a!2850 mask!2661) (Found!12587 j!87)))))

(declare-fun b!1503100 () Bool)

(declare-fun res!1023972 () Bool)

(assert (=> b!1503100 (=> (not res!1023972) (not e!840535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503100 (= res!1023972 (validKeyInArray!0 (select (arr!48389 a!2850) j!87)))))

(declare-fun b!1503101 () Bool)

(declare-fun res!1023978 () Bool)

(assert (=> b!1503101 (=> (not res!1023978) (not e!840535))))

(assert (=> b!1503101 (= res!1023978 (validKeyInArray!0 (select (arr!48389 a!2850) i!996)))))

(assert (= (and start!127950 res!1023979) b!1503096))

(assert (= (and b!1503096 res!1023976) b!1503101))

(assert (= (and b!1503101 res!1023978) b!1503100))

(assert (= (and b!1503100 res!1023972) b!1503095))

(assert (= (and b!1503095 res!1023973) b!1503094))

(assert (= (and b!1503094 res!1023977) b!1503098))

(assert (= (and b!1503098 res!1023971) b!1503099))

(assert (= (and b!1503099 res!1023974) b!1503097))

(assert (= (and b!1503097 res!1023975) b!1503093))

(declare-fun m!1386331 () Bool)

(assert (=> b!1503098 m!1386331))

(declare-fun m!1386333 () Bool)

(assert (=> b!1503098 m!1386333))

(declare-fun m!1386335 () Bool)

(assert (=> b!1503098 m!1386335))

(declare-fun m!1386337 () Bool)

(assert (=> b!1503101 m!1386337))

(assert (=> b!1503101 m!1386337))

(declare-fun m!1386339 () Bool)

(assert (=> b!1503101 m!1386339))

(declare-fun m!1386341 () Bool)

(assert (=> b!1503100 m!1386341))

(assert (=> b!1503100 m!1386341))

(declare-fun m!1386343 () Bool)

(assert (=> b!1503100 m!1386343))

(assert (=> b!1503099 m!1386341))

(assert (=> b!1503099 m!1386341))

(declare-fun m!1386345 () Bool)

(assert (=> b!1503099 m!1386345))

(declare-fun m!1386347 () Bool)

(assert (=> b!1503094 m!1386347))

(declare-fun m!1386349 () Bool)

(assert (=> start!127950 m!1386349))

(declare-fun m!1386351 () Bool)

(assert (=> start!127950 m!1386351))

(declare-fun m!1386353 () Bool)

(assert (=> b!1503093 m!1386353))

(declare-fun m!1386355 () Bool)

(assert (=> b!1503097 m!1386355))

(assert (=> b!1503097 m!1386341))

(declare-fun m!1386357 () Bool)

(assert (=> b!1503095 m!1386357))

(push 1)

(assert (not b!1503101))

(assert (not start!127950))

(assert (not b!1503099))

(assert (not b!1503094))

(assert (not b!1503095))

(assert (not b!1503100))

(assert (not b!1503093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

