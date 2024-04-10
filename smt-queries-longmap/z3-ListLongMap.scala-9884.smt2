; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117050 () Bool)

(assert start!117050)

(declare-fun res!920590 () Bool)

(declare-fun e!780646 () Bool)

(assert (=> start!117050 (=> (not res!920590) (not e!780646))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93667 0))(
  ( (array!93668 (arr!45234 (Array (_ BitVec 32) (_ BitVec 64))) (size!45784 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93667)

(assert (=> start!117050 (= res!920590 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45784 a!4094))))))

(assert (=> start!117050 e!780646))

(assert (=> start!117050 true))

(declare-fun array_inv!34262 (array!93667) Bool)

(assert (=> start!117050 (array_inv!34262 a!4094)))

(declare-fun b!1378054 () Bool)

(declare-fun res!920588 () Bool)

(assert (=> b!1378054 (=> (not res!920588) (not e!780646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378054 (= res!920588 (validKeyInArray!0 (select (arr!45234 a!4094) i!1451)))))

(declare-fun b!1378055 () Bool)

(declare-fun res!920589 () Bool)

(assert (=> b!1378055 (=> (not res!920589) (not e!780646))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378055 (= res!920589 (not (validKeyInArray!0 k0!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378056 () Bool)

(assert (=> b!1378056 (= e!780646 (and (bvslt (size!45784 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45784 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117050 res!920590) b!1378054))

(assert (= (and b!1378054 res!920588) b!1378055))

(assert (= (and b!1378055 res!920589) b!1378056))

(declare-fun m!1262501 () Bool)

(assert (=> start!117050 m!1262501))

(declare-fun m!1262503 () Bool)

(assert (=> b!1378054 m!1262503))

(assert (=> b!1378054 m!1262503))

(declare-fun m!1262505 () Bool)

(assert (=> b!1378054 m!1262505))

(declare-fun m!1262507 () Bool)

(assert (=> b!1378055 m!1262507))

(check-sat (not b!1378054) (not b!1378055) (not start!117050))
(check-sat)
