; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71750 () Bool)

(assert start!71750)

(declare-fun res!567086 () Bool)

(declare-fun e!465333 () Bool)

(assert (=> start!71750 (=> (not res!567086) (not e!465333))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46660 0))(
  ( (array!46661 (arr!22364 (Array (_ BitVec 32) (_ BitVec 64))) (size!22785 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46660)

(assert (=> start!71750 (= res!567086 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22785 a!4227))))))

(assert (=> start!71750 e!465333))

(assert (=> start!71750 true))

(declare-fun array_inv!17811 (array!46660) Bool)

(assert (=> start!71750 (array_inv!17811 a!4227)))

(declare-fun b!834051 () Bool)

(declare-fun res!567084 () Bool)

(assert (=> b!834051 (=> (not res!567084) (not e!465333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834051 (= res!567084 (not (validKeyInArray!0 (select (arr!22364 a!4227) i!1466))))))

(declare-fun b!834052 () Bool)

(declare-fun res!567085 () Bool)

(assert (=> b!834052 (=> (not res!567085) (not e!465333))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834052 (= res!567085 (validKeyInArray!0 k!2968))))

(declare-fun b!834053 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834053 (= e!465333 (and (bvslt (size!22785 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22785 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71750 res!567086) b!834051))

(assert (= (and b!834051 res!567084) b!834052))

(assert (= (and b!834052 res!567085) b!834053))

(declare-fun m!778979 () Bool)

(assert (=> start!71750 m!778979))

(declare-fun m!778981 () Bool)

(assert (=> b!834051 m!778981))

(assert (=> b!834051 m!778981))

(declare-fun m!778983 () Bool)

(assert (=> b!834051 m!778983))

(declare-fun m!778985 () Bool)

(assert (=> b!834052 m!778985))

(push 1)

(assert (not b!834052))

(assert (not start!71750))

(assert (not b!834051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

