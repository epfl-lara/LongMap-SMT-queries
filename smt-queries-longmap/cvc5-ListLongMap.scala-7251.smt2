; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92568 () Bool)

(assert start!92568)

(declare-fun res!702026 () Bool)

(declare-fun e!597861 () Bool)

(assert (=> start!92568 (=> (not res!702026) (not e!597861))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66369 0))(
  ( (array!66370 (arr!31924 (Array (_ BitVec 32) (_ BitVec 64))) (size!32460 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66369)

(assert (=> start!92568 (= res!702026 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32460 a!3488)) (bvslt (size!32460 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92568 e!597861))

(assert (=> start!92568 true))

(declare-fun array_inv!24704 (array!66369) Bool)

(assert (=> start!92568 (array_inv!24704 a!3488)))

(declare-fun b!1052900 () Bool)

(assert (=> b!1052900 (= e!597861 false)))

(declare-fun lt!465003 () Bool)

(declare-datatypes ((List!22236 0))(
  ( (Nil!22233) (Cons!22232 (h!23441 (_ BitVec 64)) (t!31543 List!22236)) )
))
(declare-fun arrayNoDuplicates!0 (array!66369 (_ BitVec 32) List!22236) Bool)

(assert (=> b!1052900 (= lt!465003 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22233))))

(assert (= (and start!92568 res!702026) b!1052900))

(declare-fun m!973301 () Bool)

(assert (=> start!92568 m!973301))

(declare-fun m!973303 () Bool)

(assert (=> b!1052900 m!973303))

(push 1)

(assert (not start!92568))

(assert (not b!1052900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

