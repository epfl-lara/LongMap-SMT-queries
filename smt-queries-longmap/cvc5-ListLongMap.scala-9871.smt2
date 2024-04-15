; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116912 () Bool)

(assert start!116912)

(declare-fun res!920294 () Bool)

(declare-fun e!780316 () Bool)

(assert (=> start!116912 (=> (not res!920294) (not e!780316))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93535 0))(
  ( (array!93536 (arr!45171 (Array (_ BitVec 32) (_ BitVec 64))) (size!45723 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93535)

(assert (=> start!116912 (= res!920294 (and (bvslt (size!45723 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45723 a!4212))))))

(assert (=> start!116912 e!780316))

(declare-fun array_inv!34404 (array!93535) Bool)

(assert (=> start!116912 (array_inv!34404 a!4212)))

(assert (=> start!116912 true))

(declare-fun b!1377535 () Bool)

(declare-fun res!920292 () Bool)

(assert (=> b!1377535 (=> (not res!920292) (not e!780316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377535 (= res!920292 (not (validKeyInArray!0 (select (arr!45171 a!4212) to!375))))))

(declare-fun b!1377536 () Bool)

(declare-fun res!920293 () Bool)

(assert (=> b!1377536 (=> (not res!920293) (not e!780316))))

(assert (=> b!1377536 (= res!920293 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377537 () Bool)

(assert (=> b!1377537 (= e!780316 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377537 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45538 0))(
  ( (Unit!45539) )
))
(declare-fun lt!605921 () Unit!45538)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45538)

(assert (=> b!1377537 (= lt!605921 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116912 res!920294) b!1377535))

(assert (= (and b!1377535 res!920292) b!1377536))

(assert (= (and b!1377536 res!920293) b!1377537))

(declare-fun m!1261449 () Bool)

(assert (=> start!116912 m!1261449))

(declare-fun m!1261451 () Bool)

(assert (=> b!1377535 m!1261451))

(assert (=> b!1377535 m!1261451))

(declare-fun m!1261453 () Bool)

(assert (=> b!1377535 m!1261453))

(declare-fun m!1261455 () Bool)

(assert (=> b!1377537 m!1261455))

(declare-fun m!1261457 () Bool)

(assert (=> b!1377537 m!1261457))

(declare-fun m!1261459 () Bool)

(assert (=> b!1377537 m!1261459))

(declare-fun m!1261461 () Bool)

(assert (=> b!1377537 m!1261461))

(push 1)

(assert (not b!1377535))

(assert (not start!116912))

(assert (not b!1377537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

