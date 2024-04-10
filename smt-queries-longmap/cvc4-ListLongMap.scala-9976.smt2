; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117796 () Bool)

(assert start!117796)

(declare-fun res!922866 () Bool)

(declare-fun e!782942 () Bool)

(assert (=> start!117796 (=> (not res!922866) (not e!782942))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117796 (= res!922866 (validMask!0 mask!3034))))

(assert (=> start!117796 e!782942))

(assert (=> start!117796 true))

(declare-datatypes ((array!94248 0))(
  ( (array!94249 (arr!45511 (Array (_ BitVec 32) (_ BitVec 64))) (size!46061 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94248)

(declare-fun array_inv!34539 (array!94248) Bool)

(assert (=> start!117796 (array_inv!34539 a!2971)))

(declare-fun b!1381237 () Bool)

(declare-fun res!922867 () Bool)

(assert (=> b!1381237 (=> (not res!922867) (not e!782942))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381237 (= res!922867 (and (= (size!46061 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46061 a!2971))))))

(declare-fun b!1381238 () Bool)

(declare-fun res!922865 () Bool)

(assert (=> b!1381238 (=> (not res!922865) (not e!782942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381238 (= res!922865 (validKeyInArray!0 (select (arr!45511 a!2971) i!1094)))))

(declare-fun b!1381239 () Bool)

(assert (=> b!1381239 (= e!782942 (bvsgt #b00000000000000000000000000000000 (size!46061 a!2971)))))

(assert (= (and start!117796 res!922866) b!1381237))

(assert (= (and b!1381237 res!922867) b!1381238))

(assert (= (and b!1381238 res!922865) b!1381239))

(declare-fun m!1266445 () Bool)

(assert (=> start!117796 m!1266445))

(declare-fun m!1266447 () Bool)

(assert (=> start!117796 m!1266447))

(declare-fun m!1266449 () Bool)

(assert (=> b!1381238 m!1266449))

(assert (=> b!1381238 m!1266449))

(declare-fun m!1266451 () Bool)

(assert (=> b!1381238 m!1266451))

(push 1)

(assert (not start!117796))

(assert (not b!1381238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

