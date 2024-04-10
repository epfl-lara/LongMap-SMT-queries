; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92638 () Bool)

(assert start!92638)

(declare-fun res!702203 () Bool)

(declare-fun e!598053 () Bool)

(assert (=> start!92638 (=> (not res!702203) (not e!598053))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66412 0))(
  ( (array!66413 (arr!31944 (Array (_ BitVec 32) (_ BitVec 64))) (size!32480 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66412)

(assert (=> start!92638 (= res!702203 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32480 a!3488)) (bvslt (size!32480 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92638 e!598053))

(assert (=> start!92638 true))

(declare-fun array_inv!24724 (array!66412) Bool)

(assert (=> start!92638 (array_inv!24724 a!3488)))

(declare-fun b!1053113 () Bool)

(assert (=> b!1053113 (= e!598053 false)))

(declare-fun lt!465063 () Bool)

(declare-datatypes ((List!22256 0))(
  ( (Nil!22253) (Cons!22252 (h!23461 (_ BitVec 64)) (t!31563 List!22256)) )
))
(declare-fun arrayNoDuplicates!0 (array!66412 (_ BitVec 32) List!22256) Bool)

(assert (=> b!1053113 (= lt!465063 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22253))))

(assert (= (and start!92638 res!702203) b!1053113))

(declare-fun m!973483 () Bool)

(assert (=> start!92638 m!973483))

(declare-fun m!973485 () Bool)

(assert (=> b!1053113 m!973485))

(push 1)

(assert (not b!1053113))

(assert (not start!92638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

