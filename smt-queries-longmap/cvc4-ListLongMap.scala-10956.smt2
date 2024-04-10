; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128248 () Bool)

(assert start!128248)

(declare-fun b!1505457 () Bool)

(declare-fun res!1025902 () Bool)

(declare-fun e!841429 () Bool)

(assert (=> b!1505457 (=> (not res!1025902) (not e!841429))))

(declare-datatypes ((array!100401 0))(
  ( (array!100402 (arr!48451 (Array (_ BitVec 32) (_ BitVec 64))) (size!49001 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100401)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505457 (= res!1025902 (validKeyInArray!0 (select (arr!48451 a!2804) i!961)))))

(declare-fun b!1505459 () Bool)

(assert (=> b!1505459 (= e!841429 (bvsgt #b00000000000000000000000000000000 (size!49001 a!2804)))))

(declare-fun b!1505456 () Bool)

(declare-fun res!1025904 () Bool)

(assert (=> b!1505456 (=> (not res!1025904) (not e!841429))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505456 (= res!1025904 (and (= (size!49001 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49001 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49001 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1025905 () Bool)

(assert (=> start!128248 (=> (not res!1025905) (not e!841429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128248 (= res!1025905 (validMask!0 mask!2512))))

(assert (=> start!128248 e!841429))

(assert (=> start!128248 true))

(declare-fun array_inv!37479 (array!100401) Bool)

(assert (=> start!128248 (array_inv!37479 a!2804)))

(declare-fun b!1505458 () Bool)

(declare-fun res!1025903 () Bool)

(assert (=> b!1505458 (=> (not res!1025903) (not e!841429))))

(assert (=> b!1505458 (= res!1025903 (validKeyInArray!0 (select (arr!48451 a!2804) j!70)))))

(assert (= (and start!128248 res!1025905) b!1505456))

(assert (= (and b!1505456 res!1025904) b!1505457))

(assert (= (and b!1505457 res!1025902) b!1505458))

(assert (= (and b!1505458 res!1025903) b!1505459))

(declare-fun m!1388557 () Bool)

(assert (=> b!1505457 m!1388557))

(assert (=> b!1505457 m!1388557))

(declare-fun m!1388559 () Bool)

(assert (=> b!1505457 m!1388559))

(declare-fun m!1388561 () Bool)

(assert (=> start!128248 m!1388561))

(declare-fun m!1388563 () Bool)

(assert (=> start!128248 m!1388563))

(declare-fun m!1388565 () Bool)

(assert (=> b!1505458 m!1388565))

(assert (=> b!1505458 m!1388565))

(declare-fun m!1388567 () Bool)

(assert (=> b!1505458 m!1388567))

(push 1)

(assert (not b!1505458))

(assert (not b!1505457))

(assert (not start!128248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

