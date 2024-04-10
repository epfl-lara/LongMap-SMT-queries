; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71848 () Bool)

(assert start!71848)

(declare-fun res!567909 () Bool)

(declare-fun e!465887 () Bool)

(assert (=> start!71848 (=> (not res!567909) (not e!465887))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46758 0))(
  ( (array!46759 (arr!22413 (Array (_ BitVec 32) (_ BitVec 64))) (size!22834 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46758)

(assert (=> start!71848 (= res!567909 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22834 a!4227))))))

(assert (=> start!71848 e!465887))

(assert (=> start!71848 true))

(declare-fun array_inv!17860 (array!46758) Bool)

(assert (=> start!71848 (array_inv!17860 a!4227)))

(declare-fun b!835036 () Bool)

(declare-fun res!567910 () Bool)

(assert (=> b!835036 (=> (not res!567910) (not e!465887))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835036 (= res!567910 (and (bvslt (size!22834 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22834 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835037 () Bool)

(declare-fun res!567908 () Bool)

(assert (=> b!835037 (=> (not res!567908) (not e!465887))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46758 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835037 (= res!567908 (= (arrayCountValidKeys!0 (array!46759 (store (arr!22413 a!4227) i!1466 k!2968) (size!22834 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835038 () Bool)

(declare-fun res!567911 () Bool)

(assert (=> b!835038 (=> (not res!567911) (not e!465887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835038 (= res!567911 (not (validKeyInArray!0 (select (arr!22413 a!4227) i!1466))))))

(declare-fun b!835039 () Bool)

(assert (=> b!835039 (= e!465887 (and (= to!390 (size!22834 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!835040 () Bool)

(declare-fun res!567907 () Bool)

(assert (=> b!835040 (=> (not res!567907) (not e!465887))))

(assert (=> b!835040 (= res!567907 (validKeyInArray!0 k!2968))))

(assert (= (and start!71848 res!567909) b!835038))

(assert (= (and b!835038 res!567911) b!835040))

(assert (= (and b!835040 res!567907) b!835036))

(assert (= (and b!835036 res!567910) b!835037))

(assert (= (and b!835037 res!567908) b!835039))

(declare-fun m!780201 () Bool)

(assert (=> start!71848 m!780201))

(declare-fun m!780203 () Bool)

(assert (=> b!835037 m!780203))

(declare-fun m!780205 () Bool)

(assert (=> b!835037 m!780205))

(declare-fun m!780207 () Bool)

(assert (=> b!835037 m!780207))

(declare-fun m!780209 () Bool)

(assert (=> b!835038 m!780209))

(assert (=> b!835038 m!780209))

(declare-fun m!780211 () Bool)

(assert (=> b!835038 m!780211))

(declare-fun m!780213 () Bool)

(assert (=> b!835040 m!780213))

(push 1)

(assert (not b!835038))

(assert (not b!835037))

(assert (not start!71848))

(assert (not b!835040))

(check-sat)

