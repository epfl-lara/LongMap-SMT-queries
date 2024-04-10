; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117056 () Bool)

(assert start!117056)

(declare-fun res!920616 () Bool)

(declare-fun e!780665 () Bool)

(assert (=> start!117056 (=> (not res!920616) (not e!780665))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93673 0))(
  ( (array!93674 (arr!45237 (Array (_ BitVec 32) (_ BitVec 64))) (size!45787 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93673)

(assert (=> start!117056 (= res!920616 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45787 a!4094))))))

(assert (=> start!117056 e!780665))

(assert (=> start!117056 true))

(declare-fun array_inv!34265 (array!93673) Bool)

(assert (=> start!117056 (array_inv!34265 a!4094)))

(declare-fun b!1378081 () Bool)

(declare-fun res!920615 () Bool)

(assert (=> b!1378081 (=> (not res!920615) (not e!780665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378081 (= res!920615 (validKeyInArray!0 (select (arr!45237 a!4094) i!1451)))))

(declare-fun b!1378082 () Bool)

(declare-fun res!920617 () Bool)

(assert (=> b!1378082 (=> (not res!920617) (not e!780665))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378082 (= res!920617 (not (validKeyInArray!0 k0!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378083 () Bool)

(assert (=> b!1378083 (= e!780665 (and (bvslt (size!45787 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45787 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117056 res!920616) b!1378081))

(assert (= (and b!1378081 res!920615) b!1378082))

(assert (= (and b!1378082 res!920617) b!1378083))

(declare-fun m!1262525 () Bool)

(assert (=> start!117056 m!1262525))

(declare-fun m!1262527 () Bool)

(assert (=> b!1378081 m!1262527))

(assert (=> b!1378081 m!1262527))

(declare-fun m!1262529 () Bool)

(assert (=> b!1378081 m!1262529))

(declare-fun m!1262531 () Bool)

(assert (=> b!1378082 m!1262531))

(check-sat (not b!1378082) (not b!1378081) (not start!117056))
(check-sat)
