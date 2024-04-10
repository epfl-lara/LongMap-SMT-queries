; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103466 () Bool)

(assert start!103466)

(declare-fun b!1240360 () Bool)

(declare-fun res!827644 () Bool)

(declare-fun e!703028 () Bool)

(assert (=> b!1240360 (=> (not res!827644) (not e!703028))))

(declare-datatypes ((array!79939 0))(
  ( (array!79940 (arr!38565 (Array (_ BitVec 32) (_ BitVec 64))) (size!39101 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79939)

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240360 (= res!827644 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240359 () Bool)

(declare-fun res!827645 () Bool)

(assert (=> b!1240359 (=> (not res!827645) (not e!703028))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240359 (= res!827645 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39101 a!3575))))))

(declare-fun b!1240361 () Bool)

(assert (=> b!1240361 (= e!703028 (bvsge (bvsub from!2953 #b00000000000000000000000000000001) from!2953))))

(declare-fun res!827647 () Bool)

(assert (=> start!103466 (=> (not res!827647) (not e!703028))))

(assert (=> start!103466 (= res!827647 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39101 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39101 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103466 e!703028))

(assert (=> start!103466 true))

(declare-fun array_inv!29413 (array!79939) Bool)

(assert (=> start!103466 (array_inv!29413 a!3575)))

(declare-fun b!1240358 () Bool)

(declare-fun res!827646 () Bool)

(assert (=> b!1240358 (=> (not res!827646) (not e!703028))))

(assert (=> b!1240358 (= res!827646 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(assert (= (and start!103466 res!827647) b!1240358))

(assert (= (and b!1240358 res!827646) b!1240359))

(assert (= (and b!1240359 res!827645) b!1240360))

(assert (= (and b!1240360 res!827644) b!1240361))

(declare-fun m!1143673 () Bool)

(assert (=> b!1240360 m!1143673))

(declare-fun m!1143675 () Bool)

(assert (=> start!103466 m!1143675))

(declare-fun m!1143677 () Bool)

(assert (=> b!1240358 m!1143677))

(check-sat (not b!1240358) (not start!103466) (not b!1240360))
(check-sat)
