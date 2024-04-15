; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116668 () Bool)

(assert start!116668)

(declare-fun res!918269 () Bool)

(declare-fun e!779034 () Bool)

(assert (=> start!116668 (=> (not res!918269) (not e!779034))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93291 0))(
  ( (array!93292 (arr!45049 (Array (_ BitVec 32) (_ BitVec 64))) (size!45601 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93291)

(assert (=> start!116668 (= res!918269 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45601 a!4032))))))

(assert (=> start!116668 e!779034))

(assert (=> start!116668 true))

(declare-fun array_inv!34282 (array!93291) Bool)

(assert (=> start!116668 (array_inv!34282 a!4032)))

(declare-fun b!1375168 () Bool)

(declare-fun res!918268 () Bool)

(assert (=> b!1375168 (=> (not res!918268) (not e!779034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375168 (= res!918268 (validKeyInArray!0 (select (arr!45049 a!4032) i!1445)))))

(declare-fun b!1375169 () Bool)

(declare-fun res!918267 () Bool)

(assert (=> b!1375169 (=> (not res!918267) (not e!779034))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375169 (= res!918267 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375170 () Bool)

(assert (=> b!1375170 (= e!779034 (and (bvslt (size!45601 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45601 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116668 res!918269) b!1375168))

(assert (= (and b!1375168 res!918268) b!1375169))

(assert (= (and b!1375169 res!918267) b!1375170))

(declare-fun m!1258545 () Bool)

(assert (=> start!116668 m!1258545))

(declare-fun m!1258547 () Bool)

(assert (=> b!1375168 m!1258547))

(assert (=> b!1375168 m!1258547))

(declare-fun m!1258549 () Bool)

(assert (=> b!1375168 m!1258549))

(declare-fun m!1258551 () Bool)

(assert (=> b!1375169 m!1258551))

(check-sat (not start!116668) (not b!1375169) (not b!1375168))
(check-sat)
