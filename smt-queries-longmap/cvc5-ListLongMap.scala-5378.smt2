; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72036 () Bool)

(assert start!72036)

(declare-fun b!836090 () Bool)

(declare-fun res!568409 () Bool)

(declare-fun e!466534 () Bool)

(assert (=> b!836090 (=> (not res!568409) (not e!466534))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46783 0))(
  ( (array!46784 (arr!22421 (Array (_ BitVec 32) (_ BitVec 64))) (size!22841 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46783)

(assert (=> b!836090 (= res!568409 (and (bvslt (size!22841 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22841 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836091 () Bool)

(assert (=> b!836091 (= e!466534 (and (not (= to!390 (size!22841 a!4227))) (bvsge to!390 (size!22841 a!4227))))))

(declare-fun b!836092 () Bool)

(declare-fun res!568412 () Bool)

(assert (=> b!836092 (=> (not res!568412) (not e!466534))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836092 (= res!568412 (validKeyInArray!0 k!2968))))

(declare-fun b!836093 () Bool)

(declare-fun res!568410 () Bool)

(assert (=> b!836093 (=> (not res!568410) (not e!466534))))

(assert (=> b!836093 (= res!568410 (not (validKeyInArray!0 (select (arr!22421 a!4227) i!1466))))))

(declare-fun res!568411 () Bool)

(assert (=> start!72036 (=> (not res!568411) (not e!466534))))

(assert (=> start!72036 (= res!568411 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22841 a!4227))))))

(assert (=> start!72036 e!466534))

(assert (=> start!72036 true))

(declare-fun array_inv!17907 (array!46783) Bool)

(assert (=> start!72036 (array_inv!17907 a!4227)))

(declare-fun b!836094 () Bool)

(declare-fun res!568413 () Bool)

(assert (=> b!836094 (=> (not res!568413) (not e!466534))))

(declare-fun arrayCountValidKeys!0 (array!46783 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836094 (= res!568413 (= (arrayCountValidKeys!0 (array!46784 (store (arr!22421 a!4227) i!1466 k!2968) (size!22841 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!72036 res!568411) b!836093))

(assert (= (and b!836093 res!568410) b!836092))

(assert (= (and b!836092 res!568412) b!836090))

(assert (= (and b!836090 res!568409) b!836094))

(assert (= (and b!836094 res!568413) b!836091))

(declare-fun m!781649 () Bool)

(assert (=> b!836092 m!781649))

(declare-fun m!781651 () Bool)

(assert (=> b!836093 m!781651))

(assert (=> b!836093 m!781651))

(declare-fun m!781653 () Bool)

(assert (=> b!836093 m!781653))

(declare-fun m!781655 () Bool)

(assert (=> start!72036 m!781655))

(declare-fun m!781657 () Bool)

(assert (=> b!836094 m!781657))

(declare-fun m!781659 () Bool)

(assert (=> b!836094 m!781659))

(declare-fun m!781661 () Bool)

(assert (=> b!836094 m!781661))

(push 1)

(assert (not b!836092))

(assert (not b!836094))

(assert (not b!836093))

(assert (not start!72036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

