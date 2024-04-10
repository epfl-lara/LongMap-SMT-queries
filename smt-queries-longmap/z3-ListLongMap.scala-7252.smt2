; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92576 () Bool)

(assert start!92576)

(declare-fun b!1052932 () Bool)

(declare-fun res!702059 () Bool)

(declare-fun e!597885 () Bool)

(assert (=> b!1052932 (=> (not res!702059) (not e!597885))))

(declare-datatypes ((array!66377 0))(
  ( (array!66378 (arr!31928 (Array (_ BitVec 32) (_ BitVec 64))) (size!32464 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66377)

(declare-datatypes ((List!22240 0))(
  ( (Nil!22237) (Cons!22236 (h!23445 (_ BitVec 64)) (t!31547 List!22240)) )
))
(declare-fun arrayNoDuplicates!0 (array!66377 (_ BitVec 32) List!22240) Bool)

(assert (=> b!1052932 (= res!702059 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22237))))

(declare-fun res!702061 () Bool)

(assert (=> start!92576 (=> (not res!702061) (not e!597885))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92576 (= res!702061 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32464 a!3488)) (bvslt (size!32464 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92576 e!597885))

(assert (=> start!92576 true))

(declare-fun array_inv!24708 (array!66377) Bool)

(assert (=> start!92576 (array_inv!24708 a!3488)))

(declare-fun b!1052933 () Bool)

(declare-fun res!702058 () Bool)

(assert (=> b!1052933 (=> (not res!702058) (not e!597885))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052933 (= res!702058 (= (select (arr!31928 a!3488) i!1381) k0!2747))))

(declare-fun b!1052934 () Bool)

(assert (=> b!1052934 (= e!597885 (bvsge #b00000000000000000000000000000000 (size!32464 a!3488)))))

(declare-fun b!1052935 () Bool)

(declare-fun res!702060 () Bool)

(assert (=> b!1052935 (=> (not res!702060) (not e!597885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052935 (= res!702060 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052936 () Bool)

(declare-fun res!702062 () Bool)

(assert (=> b!1052936 (=> (not res!702062) (not e!597885))))

(declare-fun arrayContainsKey!0 (array!66377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052936 (= res!702062 (not (arrayContainsKey!0 (array!66378 (store (arr!31928 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32464 a!3488)) k0!2747 #b00000000000000000000000000000000)))))

(assert (= (and start!92576 res!702061) b!1052932))

(assert (= (and b!1052932 res!702059) b!1052935))

(assert (= (and b!1052935 res!702060) b!1052933))

(assert (= (and b!1052933 res!702058) b!1052936))

(assert (= (and b!1052936 res!702062) b!1052934))

(declare-fun m!973325 () Bool)

(assert (=> b!1052932 m!973325))

(declare-fun m!973327 () Bool)

(assert (=> b!1052933 m!973327))

(declare-fun m!973329 () Bool)

(assert (=> start!92576 m!973329))

(declare-fun m!973331 () Bool)

(assert (=> b!1052936 m!973331))

(declare-fun m!973333 () Bool)

(assert (=> b!1052936 m!973333))

(declare-fun m!973335 () Bool)

(assert (=> b!1052935 m!973335))

(check-sat (not b!1052935) (not b!1052932) (not start!92576) (not b!1052936))
(check-sat)
