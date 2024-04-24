; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127796 () Bool)

(assert start!127796)

(declare-fun b!1499979 () Bool)

(declare-fun res!1019960 () Bool)

(declare-fun e!840020 () Bool)

(assert (=> b!1499979 (=> (not res!1019960) (not e!840020))))

(declare-datatypes ((array!100022 0))(
  ( (array!100023 (arr!48267 (Array (_ BitVec 32) (_ BitVec 64))) (size!48818 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100022)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499979 (= res!1019960 (validKeyInArray!0 (select (arr!48267 a!2850) i!996)))))

(declare-fun b!1499980 () Bool)

(assert (=> b!1499980 (= e!840020 false)))

(declare-fun lt!653262 () Bool)

(declare-datatypes ((List!34746 0))(
  ( (Nil!34743) (Cons!34742 (h!36154 (_ BitVec 64)) (t!49432 List!34746)) )
))
(declare-fun arrayNoDuplicates!0 (array!100022 (_ BitVec 32) List!34746) Bool)

(assert (=> b!1499980 (= lt!653262 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34743))))

(declare-fun b!1499982 () Bool)

(declare-fun res!1019958 () Bool)

(assert (=> b!1499982 (=> (not res!1019958) (not e!840020))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100022 (_ BitVec 32)) Bool)

(assert (=> b!1499982 (= res!1019958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499983 () Bool)

(declare-fun res!1019956 () Bool)

(assert (=> b!1499983 (=> (not res!1019956) (not e!840020))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499983 (= res!1019956 (validKeyInArray!0 (select (arr!48267 a!2850) j!87)))))

(declare-fun res!1019959 () Bool)

(assert (=> start!127796 (=> (not res!1019959) (not e!840020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127796 (= res!1019959 (validMask!0 mask!2661))))

(assert (=> start!127796 e!840020))

(assert (=> start!127796 true))

(declare-fun array_inv!37548 (array!100022) Bool)

(assert (=> start!127796 (array_inv!37548 a!2850)))

(declare-fun b!1499981 () Bool)

(declare-fun res!1019957 () Bool)

(assert (=> b!1499981 (=> (not res!1019957) (not e!840020))))

(assert (=> b!1499981 (= res!1019957 (and (= (size!48818 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48818 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48818 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127796 res!1019959) b!1499981))

(assert (= (and b!1499981 res!1019957) b!1499979))

(assert (= (and b!1499979 res!1019960) b!1499983))

(assert (= (and b!1499983 res!1019956) b!1499982))

(assert (= (and b!1499982 res!1019958) b!1499980))

(declare-fun m!1383091 () Bool)

(assert (=> b!1499979 m!1383091))

(assert (=> b!1499979 m!1383091))

(declare-fun m!1383093 () Bool)

(assert (=> b!1499979 m!1383093))

(declare-fun m!1383095 () Bool)

(assert (=> start!127796 m!1383095))

(declare-fun m!1383097 () Bool)

(assert (=> start!127796 m!1383097))

(declare-fun m!1383099 () Bool)

(assert (=> b!1499982 m!1383099))

(declare-fun m!1383101 () Bool)

(assert (=> b!1499983 m!1383101))

(assert (=> b!1499983 m!1383101))

(declare-fun m!1383103 () Bool)

(assert (=> b!1499983 m!1383103))

(declare-fun m!1383105 () Bool)

(assert (=> b!1499980 m!1383105))

(push 1)

(assert (not start!127796))

(assert (not b!1499982))

(assert (not b!1499980))

(assert (not b!1499979))

(assert (not b!1499983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

