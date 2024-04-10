; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117168 () Bool)

(assert start!117168)

(declare-fun b!1378924 () Bool)

(declare-fun e!781137 () Bool)

(assert (=> b!1378924 (= e!781137 (not true))))

(declare-fun lt!607019 () (_ BitVec 32))

(declare-datatypes ((array!93785 0))(
  ( (array!93786 (arr!45293 (Array (_ BitVec 32) (_ BitVec 64))) (size!45843 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93785)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378924 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607019) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45813 0))(
  ( (Unit!45814) )
))
(declare-fun lt!607020 () Unit!45813)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45813)

(assert (=> b!1378924 (= lt!607020 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378925 () Bool)

(declare-fun e!781139 () Bool)

(assert (=> b!1378925 (= e!781139 e!781137)))

(declare-fun res!921460 () Bool)

(assert (=> b!1378925 (=> (not res!921460) (not e!781137))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378925 (= res!921460 (= (arrayCountValidKeys!0 (array!93786 (store (arr!45293 a!4094) i!1451 k!2953) (size!45843 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607019 #b00000000000000000000000000000001)))))

(assert (=> b!1378925 (= lt!607019 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378926 () Bool)

(declare-fun res!921461 () Bool)

(assert (=> b!1378926 (=> (not res!921461) (not e!781139))))

(assert (=> b!1378926 (= res!921461 (and (bvslt (size!45843 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45843 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378927 () Bool)

(declare-fun res!921458 () Bool)

(assert (=> b!1378927 (=> (not res!921458) (not e!781139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378927 (= res!921458 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921463 () Bool)

(assert (=> start!117168 (=> (not res!921463) (not e!781139))))

(assert (=> start!117168 (= res!921463 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45843 a!4094))))))

(assert (=> start!117168 e!781139))

(assert (=> start!117168 true))

(declare-fun array_inv!34321 (array!93785) Bool)

(assert (=> start!117168 (array_inv!34321 a!4094)))

(declare-fun b!1378928 () Bool)

(declare-fun res!921462 () Bool)

(assert (=> b!1378928 (=> (not res!921462) (not e!781137))))

(assert (=> b!1378928 (= res!921462 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378929 () Bool)

(declare-fun res!921459 () Bool)

(assert (=> b!1378929 (=> (not res!921459) (not e!781139))))

(assert (=> b!1378929 (= res!921459 (validKeyInArray!0 (select (arr!45293 a!4094) i!1451)))))

(assert (= (and start!117168 res!921463) b!1378929))

(assert (= (and b!1378929 res!921459) b!1378927))

(assert (= (and b!1378927 res!921458) b!1378926))

(assert (= (and b!1378926 res!921461) b!1378925))

(assert (= (and b!1378925 res!921460) b!1378928))

(assert (= (and b!1378928 res!921462) b!1378924))

(declare-fun m!1263747 () Bool)

(assert (=> b!1378927 m!1263747))

(declare-fun m!1263749 () Bool)

(assert (=> b!1378924 m!1263749))

(declare-fun m!1263751 () Bool)

(assert (=> b!1378924 m!1263751))

(declare-fun m!1263753 () Bool)

(assert (=> b!1378924 m!1263753))

(declare-fun m!1263755 () Bool)

(assert (=> b!1378925 m!1263755))

(declare-fun m!1263757 () Bool)

(assert (=> b!1378925 m!1263757))

(declare-fun m!1263759 () Bool)

(assert (=> b!1378925 m!1263759))

(declare-fun m!1263761 () Bool)

(assert (=> start!117168 m!1263761))

(declare-fun m!1263763 () Bool)

(assert (=> b!1378929 m!1263763))

(assert (=> b!1378929 m!1263763))

(declare-fun m!1263765 () Bool)

(assert (=> b!1378929 m!1263765))

(push 1)

(assert (not b!1378924))

(assert (not b!1378927))

(assert (not b!1378925))

(assert (not b!1378929))

(assert (not start!117168))

(check-sat)

