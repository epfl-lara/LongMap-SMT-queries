; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116912 () Bool)

(assert start!116912)

(declare-fun res!920300 () Bool)

(declare-fun e!780330 () Bool)

(assert (=> start!116912 (=> (not res!920300) (not e!780330))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93581 0))(
  ( (array!93582 (arr!45194 (Array (_ BitVec 32) (_ BitVec 64))) (size!45744 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93581)

(assert (=> start!116912 (= res!920300 (and (bvslt (size!45744 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45744 a!4212))))))

(assert (=> start!116912 e!780330))

(declare-fun array_inv!34222 (array!93581) Bool)

(assert (=> start!116912 (array_inv!34222 a!4212)))

(assert (=> start!116912 true))

(declare-fun b!1377578 () Bool)

(declare-fun res!920301 () Bool)

(assert (=> b!1377578 (=> (not res!920301) (not e!780330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377578 (= res!920301 (not (validKeyInArray!0 (select (arr!45194 a!4212) to!375))))))

(declare-fun b!1377579 () Bool)

(declare-fun res!920302 () Bool)

(assert (=> b!1377579 (=> (not res!920302) (not e!780330))))

(assert (=> b!1377579 (= res!920302 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377580 () Bool)

(assert (=> b!1377580 (= e!780330 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377580 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45693 0))(
  ( (Unit!45694) )
))
(declare-fun lt!606097 () Unit!45693)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45693)

(assert (=> b!1377580 (= lt!606097 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116912 res!920300) b!1377578))

(assert (= (and b!1377578 res!920301) b!1377579))

(assert (= (and b!1377579 res!920302) b!1377580))

(declare-fun m!1261919 () Bool)

(assert (=> start!116912 m!1261919))

(declare-fun m!1261921 () Bool)

(assert (=> b!1377578 m!1261921))

(assert (=> b!1377578 m!1261921))

(declare-fun m!1261923 () Bool)

(assert (=> b!1377578 m!1261923))

(declare-fun m!1261925 () Bool)

(assert (=> b!1377580 m!1261925))

(declare-fun m!1261927 () Bool)

(assert (=> b!1377580 m!1261927))

(declare-fun m!1261929 () Bool)

(assert (=> b!1377580 m!1261929))

(declare-fun m!1261931 () Bool)

(assert (=> b!1377580 m!1261931))

(push 1)

(assert (not b!1377580))

(assert (not start!116912))

(assert (not b!1377578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

