; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36316 () Bool)

(assert start!36316)

(declare-fun res!202591 () Bool)

(declare-fun e!222429 () Bool)

(assert (=> start!36316 (=> (not res!202591) (not e!222429))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20592 0))(
  ( (array!20593 (arr!9775 (Array (_ BitVec 32) (_ BitVec 64))) (size!10128 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20592)

(assert (=> start!36316 (= res!202591 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10128 a!4289))))))

(assert (=> start!36316 e!222429))

(assert (=> start!36316 true))

(declare-fun array_inv!7224 (array!20592) Bool)

(assert (=> start!36316 (array_inv!7224 a!4289)))

(declare-fun b!363286 () Bool)

(declare-fun res!202589 () Bool)

(assert (=> b!363286 (=> (not res!202589) (not e!222429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363286 (= res!202589 (not (validKeyInArray!0 (select (arr!9775 a!4289) i!1472))))))

(declare-fun b!363287 () Bool)

(declare-fun res!202590 () Bool)

(assert (=> b!363287 (=> (not res!202590) (not e!222429))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363287 (= res!202590 (validKeyInArray!0 k0!2974))))

(declare-fun b!363288 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363288 (= e!222429 (and (bvslt (size!10128 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10128 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36316 res!202591) b!363286))

(assert (= (and b!363286 res!202589) b!363287))

(assert (= (and b!363287 res!202590) b!363288))

(declare-fun m!359959 () Bool)

(assert (=> start!36316 m!359959))

(declare-fun m!359961 () Bool)

(assert (=> b!363286 m!359961))

(assert (=> b!363286 m!359961))

(declare-fun m!359963 () Bool)

(assert (=> b!363286 m!359963))

(declare-fun m!359965 () Bool)

(assert (=> b!363287 m!359965))

(check-sat (not b!363286) (not start!36316) (not b!363287))
(check-sat)
