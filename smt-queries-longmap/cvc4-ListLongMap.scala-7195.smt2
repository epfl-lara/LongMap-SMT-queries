; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92206 () Bool)

(assert start!92206)

(declare-fun res!697370 () Bool)

(declare-fun e!594498 () Bool)

(assert (=> start!92206 (=> (not res!697370) (not e!594498))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66034 0))(
  ( (array!66035 (arr!31758 (Array (_ BitVec 32) (_ BitVec 64))) (size!32294 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66034)

(assert (=> start!92206 (= res!697370 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32294 a!3488)) (bvslt (size!32294 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92206 e!594498))

(assert (=> start!92206 true))

(declare-fun array_inv!24538 (array!66034) Bool)

(assert (=> start!92206 (array_inv!24538 a!3488)))

(declare-fun b!1048208 () Bool)

(assert (=> b!1048208 (= e!594498 false)))

(declare-fun lt!463137 () Bool)

(declare-datatypes ((List!22070 0))(
  ( (Nil!22067) (Cons!22066 (h!23275 (_ BitVec 64)) (t!31377 List!22070)) )
))
(declare-fun arrayNoDuplicates!0 (array!66034 (_ BitVec 32) List!22070) Bool)

(assert (=> b!1048208 (= lt!463137 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22067))))

(assert (= (and start!92206 res!697370) b!1048208))

(declare-fun m!969235 () Bool)

(assert (=> start!92206 m!969235))

(declare-fun m!969237 () Bool)

(assert (=> b!1048208 m!969237))

(push 1)

(assert (not start!92206))

