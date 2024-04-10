; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103478 () Bool)

(assert start!103478)

(declare-fun res!827711 () Bool)

(declare-fun e!703065 () Bool)

(assert (=> start!103478 (=> (not res!827711) (not e!703065))))

(declare-datatypes ((array!79951 0))(
  ( (array!79952 (arr!38571 (Array (_ BitVec 32) (_ BitVec 64))) (size!39107 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79951)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103478 (= res!827711 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39107 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39107 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103478 e!703065))

(assert (=> start!103478 true))

(declare-fun array_inv!29419 (array!79951) Bool)

(assert (=> start!103478 (array_inv!29419 a!3575)))

(declare-fun b!1240425 () Bool)

(declare-fun res!827713 () Bool)

(assert (=> b!1240425 (=> (not res!827713) (not e!703065))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240425 (= res!827713 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240426 () Bool)

(declare-fun res!827712 () Bool)

(assert (=> b!1240426 (=> (not res!827712) (not e!703065))))

(assert (=> b!1240426 (= res!827712 (bvsle from!2953 newFrom!281))))

(declare-fun b!1240427 () Bool)

(assert (=> b!1240427 (= e!703065 (not (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))))

(assert (= (and start!103478 res!827711) b!1240425))

(assert (= (and b!1240425 res!827713) b!1240426))

(assert (= (and b!1240426 res!827712) b!1240427))

(declare-fun m!1143721 () Bool)

(assert (=> start!103478 m!1143721))

(declare-fun m!1143723 () Bool)

(assert (=> b!1240425 m!1143723))

(declare-fun m!1143725 () Bool)

(assert (=> b!1240427 m!1143725))

(check-sat (not b!1240427) (not b!1240425) (not start!103478))
(check-sat)
