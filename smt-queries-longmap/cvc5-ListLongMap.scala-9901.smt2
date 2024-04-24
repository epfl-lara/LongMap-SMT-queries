; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117386 () Bool)

(assert start!117386)

(declare-fun b!1380137 () Bool)

(declare-fun res!921885 () Bool)

(declare-fun e!781943 () Bool)

(assert (=> b!1380137 (=> (not res!921885) (not e!781943))))

(declare-datatypes ((array!93887 0))(
  ( (array!93888 (arr!45339 (Array (_ BitVec 32) (_ BitVec 64))) (size!45890 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93887)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380137 (= res!921885 (validKeyInArray!0 (select (arr!45339 a!4094) i!1451)))))

(declare-fun b!1380140 () Bool)

(assert (=> b!1380140 (= e!781943 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607476 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380140 (= lt!607476 (arrayCountValidKeys!0 (array!93888 (store (arr!45339 a!4094) i!1451 k!2953) (size!45890 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607477 () (_ BitVec 32))

(assert (=> b!1380140 (= lt!607477 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921883 () Bool)

(assert (=> start!117386 (=> (not res!921883) (not e!781943))))

(assert (=> start!117386 (= res!921883 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45890 a!4094))))))

(assert (=> start!117386 e!781943))

(assert (=> start!117386 true))

(declare-fun array_inv!34620 (array!93887) Bool)

(assert (=> start!117386 (array_inv!34620 a!4094)))

(declare-fun b!1380138 () Bool)

(declare-fun res!921882 () Bool)

(assert (=> b!1380138 (=> (not res!921882) (not e!781943))))

(assert (=> b!1380138 (= res!921882 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380139 () Bool)

(declare-fun res!921884 () Bool)

(assert (=> b!1380139 (=> (not res!921884) (not e!781943))))

(assert (=> b!1380139 (= res!921884 (and (bvslt (size!45890 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45890 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117386 res!921883) b!1380137))

(assert (= (and b!1380137 res!921885) b!1380138))

(assert (= (and b!1380138 res!921882) b!1380139))

(assert (= (and b!1380139 res!921884) b!1380140))

(declare-fun m!1265285 () Bool)

(assert (=> b!1380137 m!1265285))

(assert (=> b!1380137 m!1265285))

(declare-fun m!1265287 () Bool)

(assert (=> b!1380137 m!1265287))

(declare-fun m!1265289 () Bool)

(assert (=> b!1380140 m!1265289))

(declare-fun m!1265291 () Bool)

(assert (=> b!1380140 m!1265291))

(declare-fun m!1265293 () Bool)

(assert (=> b!1380140 m!1265293))

(declare-fun m!1265295 () Bool)

(assert (=> start!117386 m!1265295))

(declare-fun m!1265297 () Bool)

(assert (=> b!1380138 m!1265297))

(push 1)

(assert (not b!1380140))

(assert (not start!117386))

(assert (not b!1380137))

(assert (not b!1380138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

