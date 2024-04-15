; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116896 () Bool)

(assert start!116896)

(declare-fun b!1377442 () Bool)

(declare-fun res!920199 () Bool)

(declare-fun e!780261 () Bool)

(assert (=> b!1377442 (=> (not res!920199) (not e!780261))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93519 0))(
  ( (array!93520 (arr!45163 (Array (_ BitVec 32) (_ BitVec 64))) (size!45715 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93519)

(assert (=> b!1377442 (= res!920199 (and (bvslt (size!45715 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45715 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!920203 () Bool)

(assert (=> start!116896 (=> (not res!920203) (not e!780261))))

(assert (=> start!116896 (= res!920203 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45715 a!4032))))))

(assert (=> start!116896 e!780261))

(assert (=> start!116896 true))

(declare-fun array_inv!34396 (array!93519) Bool)

(assert (=> start!116896 (array_inv!34396 a!4032)))

(declare-fun lt!605897 () array!93519)

(declare-fun e!780262 () Bool)

(declare-fun b!1377443 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93519 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377443 (= e!780262 (not (= (arrayCountValidKeys!0 lt!605897 (bvadd #b00000000000000000000000000000001 i!1445) (size!45715 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45715 a!4032)))))))

(declare-fun b!1377444 () Bool)

(assert (=> b!1377444 (= e!780261 e!780262)))

(declare-fun res!920202 () Bool)

(assert (=> b!1377444 (=> (not res!920202) (not e!780262))))

(assert (=> b!1377444 (= res!920202 (= (arrayCountValidKeys!0 lt!605897 (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377444 (= lt!605897 (array!93520 (store (arr!45163 a!4032) i!1445 k0!2947) (size!45715 a!4032)))))

(declare-fun b!1377445 () Bool)

(declare-fun res!920204 () Bool)

(assert (=> b!1377445 (=> (not res!920204) (not e!780261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377445 (= res!920204 (validKeyInArray!0 (select (arr!45163 a!4032) i!1445)))))

(declare-fun b!1377446 () Bool)

(declare-fun res!920201 () Bool)

(assert (=> b!1377446 (=> (not res!920201) (not e!780262))))

(assert (=> b!1377446 (= res!920201 (= to!206 (size!45715 a!4032)))))

(declare-fun b!1377447 () Bool)

(declare-fun res!920200 () Bool)

(assert (=> b!1377447 (=> (not res!920200) (not e!780261))))

(assert (=> b!1377447 (= res!920200 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116896 res!920203) b!1377445))

(assert (= (and b!1377445 res!920204) b!1377447))

(assert (= (and b!1377447 res!920200) b!1377442))

(assert (= (and b!1377442 res!920199) b!1377444))

(assert (= (and b!1377444 res!920202) b!1377446))

(assert (= (and b!1377446 res!920201) b!1377443))

(declare-fun m!1261325 () Bool)

(assert (=> b!1377447 m!1261325))

(declare-fun m!1261327 () Bool)

(assert (=> start!116896 m!1261327))

(declare-fun m!1261329 () Bool)

(assert (=> b!1377444 m!1261329))

(declare-fun m!1261331 () Bool)

(assert (=> b!1377444 m!1261331))

(declare-fun m!1261333 () Bool)

(assert (=> b!1377444 m!1261333))

(declare-fun m!1261335 () Bool)

(assert (=> b!1377445 m!1261335))

(assert (=> b!1377445 m!1261335))

(declare-fun m!1261337 () Bool)

(assert (=> b!1377445 m!1261337))

(declare-fun m!1261339 () Bool)

(assert (=> b!1377443 m!1261339))

(declare-fun m!1261341 () Bool)

(assert (=> b!1377443 m!1261341))

(check-sat (not b!1377444) (not b!1377443) (not start!116896) (not b!1377445) (not b!1377447))
(check-sat)
