; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103672 () Bool)

(assert start!103672)

(declare-fun res!828074 () Bool)

(declare-fun e!703807 () Bool)

(assert (=> start!103672 (=> (not res!828074) (not e!703807))))

(declare-datatypes ((array!79952 0))(
  ( (array!79953 (arr!38567 (Array (_ BitVec 32) (_ BitVec 64))) (size!39104 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79952)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103672 (= res!828074 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39104 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39104 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103672 e!703807))

(assert (=> start!103672 true))

(declare-fun array_inv!29505 (array!79952) Bool)

(assert (=> start!103672 (array_inv!29505 a!3575)))

(declare-fun b!1241579 () Bool)

(declare-fun res!828075 () Bool)

(assert (=> b!1241579 (=> (not res!828075) (not e!703807))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241579 (= res!828075 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1241580 () Bool)

(assert (=> b!1241580 (= e!703807 (and (bvsgt from!2953 newFrom!281) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!103672 res!828074) b!1241579))

(assert (= (and b!1241579 res!828075) b!1241580))

(declare-fun m!1145249 () Bool)

(assert (=> start!103672 m!1145249))

(declare-fun m!1145251 () Bool)

(assert (=> b!1241579 m!1145251))

(check-sat (not start!103672) (not b!1241579))
(check-sat)
