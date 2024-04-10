; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127804 () Bool)

(assert start!127804)

(declare-fun b!1501927 () Bool)

(declare-fun res!1023003 () Bool)

(declare-fun e!840114 () Bool)

(assert (=> b!1501927 (=> (not res!1023003) (not e!840114))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100185 0))(
  ( (array!100186 (arr!48352 (Array (_ BitVec 32) (_ BitVec 64))) (size!48902 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100185)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501927 (= res!1023003 (and (= (size!48902 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48902 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48902 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501929 () Bool)

(declare-fun res!1023007 () Bool)

(assert (=> b!1501929 (=> (not res!1023007) (not e!840114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100185 (_ BitVec 32)) Bool)

(assert (=> b!1501929 (= res!1023007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501930 () Bool)

(declare-fun res!1023004 () Bool)

(assert (=> b!1501930 (=> (not res!1023004) (not e!840114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501930 (= res!1023004 (validKeyInArray!0 (select (arr!48352 a!2850) j!87)))))

(declare-fun b!1501931 () Bool)

(assert (=> b!1501931 (= e!840114 false)))

(declare-fun lt!653290 () Bool)

(declare-datatypes ((List!34844 0))(
  ( (Nil!34841) (Cons!34840 (h!36237 (_ BitVec 64)) (t!49538 List!34844)) )
))
(declare-fun arrayNoDuplicates!0 (array!100185 (_ BitVec 32) List!34844) Bool)

(assert (=> b!1501931 (= lt!653290 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34841))))

(declare-fun b!1501928 () Bool)

(declare-fun res!1023006 () Bool)

(assert (=> b!1501928 (=> (not res!1023006) (not e!840114))))

(assert (=> b!1501928 (= res!1023006 (validKeyInArray!0 (select (arr!48352 a!2850) i!996)))))

(declare-fun res!1023005 () Bool)

(assert (=> start!127804 (=> (not res!1023005) (not e!840114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127804 (= res!1023005 (validMask!0 mask!2661))))

(assert (=> start!127804 e!840114))

(assert (=> start!127804 true))

(declare-fun array_inv!37380 (array!100185) Bool)

(assert (=> start!127804 (array_inv!37380 a!2850)))

(assert (= (and start!127804 res!1023005) b!1501927))

(assert (= (and b!1501927 res!1023003) b!1501928))

(assert (= (and b!1501928 res!1023006) b!1501930))

(assert (= (and b!1501930 res!1023004) b!1501929))

(assert (= (and b!1501929 res!1023007) b!1501931))

(declare-fun m!1385211 () Bool)

(assert (=> b!1501930 m!1385211))

(assert (=> b!1501930 m!1385211))

(declare-fun m!1385213 () Bool)

(assert (=> b!1501930 m!1385213))

(declare-fun m!1385215 () Bool)

(assert (=> b!1501929 m!1385215))

(declare-fun m!1385217 () Bool)

(assert (=> start!127804 m!1385217))

(declare-fun m!1385219 () Bool)

(assert (=> start!127804 m!1385219))

(declare-fun m!1385221 () Bool)

(assert (=> b!1501931 m!1385221))

(declare-fun m!1385223 () Bool)

(assert (=> b!1501928 m!1385223))

(assert (=> b!1501928 m!1385223))

(declare-fun m!1385225 () Bool)

(assert (=> b!1501928 m!1385225))

(push 1)

(assert (not b!1501930))

(assert (not start!127804))

(assert (not b!1501929))

(assert (not b!1501928))

(assert (not b!1501931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

