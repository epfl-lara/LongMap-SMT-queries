; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117008 () Bool)

(assert start!117008)

(declare-fun res!920532 () Bool)

(declare-fun e!780558 () Bool)

(assert (=> start!117008 (=> (not res!920532) (not e!780558))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93650 0))(
  ( (array!93651 (arr!45227 (Array (_ BitVec 32) (_ BitVec 64))) (size!45777 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93650)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117008 (= res!920532 (and (bvslt (size!45777 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45777 a!4197))))))

(assert (=> start!117008 e!780558))

(declare-fun array_inv!34255 (array!93650) Bool)

(assert (=> start!117008 (array_inv!34255 a!4197)))

(assert (=> start!117008 true))

(declare-fun b!1377906 () Bool)

(declare-fun res!920533 () Bool)

(assert (=> b!1377906 (=> (not res!920533) (not e!780558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377906 (= res!920533 (validKeyInArray!0 (select (arr!45227 a!4197) to!360)))))

(declare-fun b!1377907 () Bool)

(assert (=> b!1377907 (= e!780558 (or (bvslt (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsgt to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(assert (= (and start!117008 res!920532) b!1377906))

(assert (= (and b!1377906 res!920533) b!1377907))

(declare-fun m!1262363 () Bool)

(assert (=> start!117008 m!1262363))

(declare-fun m!1262365 () Bool)

(assert (=> b!1377906 m!1262365))

(assert (=> b!1377906 m!1262365))

(declare-fun m!1262367 () Bool)

(assert (=> b!1377906 m!1262367))

(push 1)

(assert (not start!117008))

(assert (not b!1377906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

