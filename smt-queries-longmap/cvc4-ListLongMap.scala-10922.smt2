; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127798 () Bool)

(assert start!127798)

(declare-fun b!1501882 () Bool)

(declare-fun res!1022962 () Bool)

(declare-fun e!840097 () Bool)

(assert (=> b!1501882 (=> (not res!1022962) (not e!840097))))

(declare-datatypes ((array!100179 0))(
  ( (array!100180 (arr!48349 (Array (_ BitVec 32) (_ BitVec 64))) (size!48899 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100179)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100179 (_ BitVec 32)) Bool)

(assert (=> b!1501882 (= res!1022962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501884 () Bool)

(declare-fun res!1022958 () Bool)

(assert (=> b!1501884 (=> (not res!1022958) (not e!840097))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501884 (= res!1022958 (validKeyInArray!0 (select (arr!48349 a!2850) i!996)))))

(declare-fun b!1501885 () Bool)

(declare-fun res!1022961 () Bool)

(assert (=> b!1501885 (=> (not res!1022961) (not e!840097))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501885 (= res!1022961 (and (= (size!48899 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48899 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48899 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501886 () Bool)

(declare-fun res!1022959 () Bool)

(assert (=> b!1501886 (=> (not res!1022959) (not e!840097))))

(assert (=> b!1501886 (= res!1022959 (validKeyInArray!0 (select (arr!48349 a!2850) j!87)))))

(declare-fun res!1022960 () Bool)

(assert (=> start!127798 (=> (not res!1022960) (not e!840097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127798 (= res!1022960 (validMask!0 mask!2661))))

(assert (=> start!127798 e!840097))

(assert (=> start!127798 true))

(declare-fun array_inv!37377 (array!100179) Bool)

(assert (=> start!127798 (array_inv!37377 a!2850)))

(declare-fun b!1501883 () Bool)

(assert (=> b!1501883 (= e!840097 false)))

(declare-fun lt!653281 () Bool)

(declare-datatypes ((List!34841 0))(
  ( (Nil!34838) (Cons!34837 (h!36234 (_ BitVec 64)) (t!49535 List!34841)) )
))
(declare-fun arrayNoDuplicates!0 (array!100179 (_ BitVec 32) List!34841) Bool)

(assert (=> b!1501883 (= lt!653281 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34838))))

(assert (= (and start!127798 res!1022960) b!1501885))

(assert (= (and b!1501885 res!1022961) b!1501884))

(assert (= (and b!1501884 res!1022958) b!1501886))

(assert (= (and b!1501886 res!1022959) b!1501882))

(assert (= (and b!1501882 res!1022962) b!1501883))

(declare-fun m!1385163 () Bool)

(assert (=> b!1501884 m!1385163))

(assert (=> b!1501884 m!1385163))

(declare-fun m!1385165 () Bool)

(assert (=> b!1501884 m!1385165))

(declare-fun m!1385167 () Bool)

(assert (=> b!1501886 m!1385167))

(assert (=> b!1501886 m!1385167))

(declare-fun m!1385169 () Bool)

(assert (=> b!1501886 m!1385169))

(declare-fun m!1385171 () Bool)

(assert (=> start!127798 m!1385171))

(declare-fun m!1385173 () Bool)

(assert (=> start!127798 m!1385173))

(declare-fun m!1385175 () Bool)

(assert (=> b!1501883 m!1385175))

(declare-fun m!1385177 () Bool)

(assert (=> b!1501882 m!1385177))

(push 1)

(assert (not start!127798))

(assert (not b!1501883))

(assert (not b!1501882))

(assert (not b!1501886))

(assert (not b!1501884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

