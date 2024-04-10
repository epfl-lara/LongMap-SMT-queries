; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92582 () Bool)

(assert start!92582)

(declare-fun res!702083 () Bool)

(declare-fun e!597903 () Bool)

(assert (=> start!92582 (=> (not res!702083) (not e!597903))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66383 0))(
  ( (array!66384 (arr!31931 (Array (_ BitVec 32) (_ BitVec 64))) (size!32467 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66383)

(assert (=> start!92582 (= res!702083 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32467 a!3488)) (bvslt (size!32467 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92582 e!597903))

(assert (=> start!92582 true))

(declare-fun array_inv!24711 (array!66383) Bool)

(assert (=> start!92582 (array_inv!24711 a!3488)))

(declare-fun b!1052957 () Bool)

(assert (=> b!1052957 (= e!597903 false)))

(declare-fun lt!465015 () Bool)

(declare-datatypes ((List!22243 0))(
  ( (Nil!22240) (Cons!22239 (h!23448 (_ BitVec 64)) (t!31550 List!22243)) )
))
(declare-fun arrayNoDuplicates!0 (array!66383 (_ BitVec 32) List!22243) Bool)

(assert (=> b!1052957 (= lt!465015 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22240))))

(assert (= (and start!92582 res!702083) b!1052957))

(declare-fun m!973353 () Bool)

(assert (=> start!92582 m!973353))

(declare-fun m!973355 () Bool)

(assert (=> b!1052957 m!973355))

(check-sat (not start!92582) (not b!1052957))
(check-sat)
