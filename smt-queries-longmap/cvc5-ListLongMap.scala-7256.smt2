; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92866 () Bool)

(assert start!92866)

(declare-fun res!702704 () Bool)

(declare-fun e!598878 () Bool)

(assert (=> start!92866 (=> (not res!702704) (not e!598878))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66455 0))(
  ( (array!66456 (arr!31959 (Array (_ BitVec 32) (_ BitVec 64))) (size!32496 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66455)

(assert (=> start!92866 (= res!702704 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32496 a!3488)) (bvslt (size!32496 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92866 e!598878))

(assert (=> start!92866 true))

(declare-fun array_inv!24741 (array!66455) Bool)

(assert (=> start!92866 (array_inv!24741 a!3488)))

(declare-fun b!1054419 () Bool)

(assert (=> b!1054419 (= e!598878 false)))

(declare-fun lt!465569 () Bool)

(declare-datatypes ((List!22241 0))(
  ( (Nil!22238) (Cons!22237 (h!23455 (_ BitVec 64)) (t!31540 List!22241)) )
))
(declare-fun arrayNoDuplicates!0 (array!66455 (_ BitVec 32) List!22241) Bool)

(assert (=> b!1054419 (= lt!465569 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22238))))

(assert (= (and start!92866 res!702704) b!1054419))

(declare-fun m!975139 () Bool)

(assert (=> start!92866 m!975139))

(declare-fun m!975141 () Bool)

(assert (=> b!1054419 m!975141))

(push 1)

(assert (not b!1054419))

(assert (not start!92866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

