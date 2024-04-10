; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117304 () Bool)

(assert start!117304)

(declare-fun res!922165 () Bool)

(declare-fun e!781645 () Bool)

(assert (=> start!117304 (=> (not res!922165) (not e!781645))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93900 0))(
  ( (array!93901 (arr!45349 (Array (_ BitVec 32) (_ BitVec 64))) (size!45899 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93900)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117304 (= res!922165 (and (bvslt (size!45899 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45899 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117304 e!781645))

(declare-fun array_inv!34377 (array!93900) Bool)

(assert (=> start!117304 (array_inv!34377 a!4010)))

(assert (=> start!117304 true))

(declare-fun b!1379726 () Bool)

(declare-fun res!922164 () Bool)

(assert (=> b!1379726 (=> (not res!922164) (not e!781645))))

(declare-fun isPivot!0 (array!93900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379726 (= res!922164 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379727 () Bool)

(assert (=> b!1379727 (= e!781645 (not true))))

(assert (=> b!1379727 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45907 0))(
  ( (Unit!45908) )
))
(declare-fun lt!607734 () Unit!45907)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45907)

(assert (=> b!1379727 (= lt!607734 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117304 res!922165) b!1379726))

(assert (= (and b!1379726 res!922164) b!1379727))

(declare-fun m!1264921 () Bool)

(assert (=> start!117304 m!1264921))

(declare-fun m!1264923 () Bool)

(assert (=> b!1379726 m!1264923))

(declare-fun m!1264925 () Bool)

(assert (=> b!1379727 m!1264925))

(declare-fun m!1264927 () Bool)

(assert (=> b!1379727 m!1264927))

(push 1)

(assert (not start!117304))

(assert (not b!1379727))

(assert (not b!1379726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

