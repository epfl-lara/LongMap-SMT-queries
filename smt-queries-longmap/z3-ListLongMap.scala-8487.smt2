; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103442 () Bool)

(assert start!103442)

(declare-fun res!827565 () Bool)

(declare-fun e!702968 () Bool)

(assert (=> start!103442 (=> (not res!827565) (not e!702968))))

(declare-datatypes ((array!79924 0))(
  ( (array!79925 (arr!38559 (Array (_ BitVec 32) (_ BitVec 64))) (size!39095 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79924)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103442 (= res!827565 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39095 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39095 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103442 e!702968))

(assert (=> start!103442 true))

(declare-fun array_inv!29407 (array!79924) Bool)

(assert (=> start!103442 (array_inv!29407 a!3575)))

(declare-fun b!1240279 () Bool)

(declare-fun res!827566 () Bool)

(assert (=> b!1240279 (=> (not res!827566) (not e!702968))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240279 (= res!827566 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240280 () Bool)

(assert (=> b!1240280 (= e!702968 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) (size!39095 a!3575))))))

(assert (= (and start!103442 res!827565) b!1240279))

(assert (= (and b!1240279 res!827566) b!1240280))

(declare-fun m!1143617 () Bool)

(assert (=> start!103442 m!1143617))

(declare-fun m!1143619 () Bool)

(assert (=> b!1240279 m!1143619))

(check-sat (not b!1240279) (not start!103442))
(check-sat)
