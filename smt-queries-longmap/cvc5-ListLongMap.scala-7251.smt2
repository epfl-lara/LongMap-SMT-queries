; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92570 () Bool)

(assert start!92570)

(declare-fun res!701965 () Bool)

(declare-fun e!597782 () Bool)

(assert (=> start!92570 (=> (not res!701965) (not e!597782))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66312 0))(
  ( (array!66313 (arr!31895 (Array (_ BitVec 32) (_ BitVec 64))) (size!32433 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66312)

(assert (=> start!92570 (= res!701965 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32433 a!3488)) (bvslt (size!32433 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92570 e!597782))

(assert (=> start!92570 true))

(declare-fun array_inv!24678 (array!66312) Bool)

(assert (=> start!92570 (array_inv!24678 a!3488)))

(declare-fun b!1052755 () Bool)

(assert (=> b!1052755 (= e!597782 false)))

(declare-fun lt!464809 () Bool)

(declare-datatypes ((List!22266 0))(
  ( (Nil!22263) (Cons!22262 (h!23471 (_ BitVec 64)) (t!31564 List!22266)) )
))
(declare-fun arrayNoDuplicates!0 (array!66312 (_ BitVec 32) List!22266) Bool)

(assert (=> b!1052755 (= lt!464809 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22263))))

(assert (= (and start!92570 res!701965) b!1052755))

(declare-fun m!972693 () Bool)

(assert (=> start!92570 m!972693))

(declare-fun m!972695 () Bool)

(assert (=> b!1052755 m!972695))

(push 1)

(assert (not b!1052755))

(assert (not start!92570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

