; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92622 () Bool)

(assert start!92622)

(declare-fun res!702179 () Bool)

(declare-fun e!598005 () Bool)

(assert (=> start!92622 (=> (not res!702179) (not e!598005))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66396 0))(
  ( (array!66397 (arr!31936 (Array (_ BitVec 32) (_ BitVec 64))) (size!32472 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66396)

(assert (=> start!92622 (= res!702179 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32472 a!3488)) (bvslt (size!32472 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92622 e!598005))

(assert (=> start!92622 true))

(declare-fun array_inv!24716 (array!66396) Bool)

(assert (=> start!92622 (array_inv!24716 a!3488)))

(declare-fun b!1053089 () Bool)

(assert (=> b!1053089 (= e!598005 false)))

(declare-fun lt!465039 () Bool)

(declare-datatypes ((List!22248 0))(
  ( (Nil!22245) (Cons!22244 (h!23453 (_ BitVec 64)) (t!31555 List!22248)) )
))
(declare-fun arrayNoDuplicates!0 (array!66396 (_ BitVec 32) List!22248) Bool)

(assert (=> b!1053089 (= lt!465039 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22245))))

(assert (= (and start!92622 res!702179) b!1053089))

(declare-fun m!973451 () Bool)

(assert (=> start!92622 m!973451))

(declare-fun m!973453 () Bool)

(assert (=> b!1053089 m!973453))

(push 1)

(assert (not start!92622))

(assert (not b!1053089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

