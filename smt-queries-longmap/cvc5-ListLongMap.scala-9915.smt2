; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117494 () Bool)

(assert start!117494)

(declare-fun b!1380882 () Bool)

(declare-fun res!922530 () Bool)

(declare-fun e!782361 () Bool)

(assert (=> b!1380882 (=> (not res!922530) (not e!782361))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380882 (= res!922530 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380884 () Bool)

(assert (=> b!1380884 (= e!782361 false)))

(declare-datatypes ((array!93974 0))(
  ( (array!93975 (arr!45381 (Array (_ BitVec 32) (_ BitVec 64))) (size!45932 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93974)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!608152 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93974 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380884 (= lt!608152 (arrayCountValidKeys!0 (array!93975 (store (arr!45381 a!4094) i!1451 k!2953) (size!45932 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!608151 () (_ BitVec 32))

(assert (=> b!1380884 (= lt!608151 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380881 () Bool)

(declare-fun res!922532 () Bool)

(assert (=> b!1380881 (=> (not res!922532) (not e!782361))))

(assert (=> b!1380881 (= res!922532 (validKeyInArray!0 (select (arr!45381 a!4094) i!1451)))))

(declare-fun res!922531 () Bool)

(assert (=> start!117494 (=> (not res!922531) (not e!782361))))

(assert (=> start!117494 (= res!922531 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45932 a!4094))))))

(assert (=> start!117494 e!782361))

(assert (=> start!117494 true))

(declare-fun array_inv!34662 (array!93974) Bool)

(assert (=> start!117494 (array_inv!34662 a!4094)))

(declare-fun b!1380883 () Bool)

(declare-fun res!922533 () Bool)

(assert (=> b!1380883 (=> (not res!922533) (not e!782361))))

(assert (=> b!1380883 (= res!922533 (and (bvslt (size!45932 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45932 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117494 res!922531) b!1380881))

(assert (= (and b!1380881 res!922532) b!1380882))

(assert (= (and b!1380882 res!922530) b!1380883))

(assert (= (and b!1380883 res!922533) b!1380884))

(declare-fun m!1266365 () Bool)

(assert (=> b!1380882 m!1266365))

(declare-fun m!1266367 () Bool)

(assert (=> b!1380884 m!1266367))

(declare-fun m!1266369 () Bool)

(assert (=> b!1380884 m!1266369))

(declare-fun m!1266371 () Bool)

(assert (=> b!1380884 m!1266371))

(declare-fun m!1266373 () Bool)

(assert (=> b!1380881 m!1266373))

(assert (=> b!1380881 m!1266373))

(declare-fun m!1266375 () Bool)

(assert (=> b!1380881 m!1266375))

(declare-fun m!1266377 () Bool)

(assert (=> start!117494 m!1266377))

(push 1)

(assert (not b!1380884))

(assert (not start!117494))

(assert (not b!1380881))

(assert (not b!1380882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

