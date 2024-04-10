; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117154 () Bool)

(assert start!117154)

(declare-fun b!1378827 () Bool)

(declare-fun res!921361 () Bool)

(declare-fun e!781094 () Bool)

(assert (=> b!1378827 (=> (not res!921361) (not e!781094))))

(declare-datatypes ((array!93771 0))(
  ( (array!93772 (arr!45286 (Array (_ BitVec 32) (_ BitVec 64))) (size!45836 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93771)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378827 (= res!921361 (validKeyInArray!0 (select (arr!45286 a!4094) i!1451)))))

(declare-fun b!1378830 () Bool)

(assert (=> b!1378830 (= e!781094 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606996 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93771 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378830 (= lt!606996 (arrayCountValidKeys!0 (array!93772 (store (arr!45286 a!4094) i!1451 k!2953) (size!45836 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606995 () (_ BitVec 32))

(assert (=> b!1378830 (= lt!606995 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921362 () Bool)

(assert (=> start!117154 (=> (not res!921362) (not e!781094))))

(assert (=> start!117154 (= res!921362 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45836 a!4094))))))

(assert (=> start!117154 e!781094))

(assert (=> start!117154 true))

(declare-fun array_inv!34314 (array!93771) Bool)

(assert (=> start!117154 (array_inv!34314 a!4094)))

(declare-fun b!1378828 () Bool)

(declare-fun res!921363 () Bool)

(assert (=> b!1378828 (=> (not res!921363) (not e!781094))))

(assert (=> b!1378828 (= res!921363 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378829 () Bool)

(declare-fun res!921364 () Bool)

(assert (=> b!1378829 (=> (not res!921364) (not e!781094))))

(assert (=> b!1378829 (= res!921364 (and (bvslt (size!45836 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45836 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117154 res!921362) b!1378827))

(assert (= (and b!1378827 res!921361) b!1378828))

(assert (= (and b!1378828 res!921363) b!1378829))

(assert (= (and b!1378829 res!921364) b!1378830))

(declare-fun m!1263649 () Bool)

(assert (=> b!1378827 m!1263649))

(assert (=> b!1378827 m!1263649))

(declare-fun m!1263651 () Bool)

(assert (=> b!1378827 m!1263651))

(declare-fun m!1263653 () Bool)

(assert (=> b!1378830 m!1263653))

(declare-fun m!1263655 () Bool)

(assert (=> b!1378830 m!1263655))

(declare-fun m!1263657 () Bool)

(assert (=> b!1378830 m!1263657))

(declare-fun m!1263659 () Bool)

(assert (=> start!117154 m!1263659))

(declare-fun m!1263661 () Bool)

(assert (=> b!1378828 m!1263661))

(push 1)

(assert (not start!117154))

(assert (not b!1378830))

(assert (not b!1378828))

(assert (not b!1378827))

(check-sat)

