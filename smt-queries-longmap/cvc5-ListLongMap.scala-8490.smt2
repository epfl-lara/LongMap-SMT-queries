; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103710 () Bool)

(assert start!103710)

(declare-fun b!1241732 () Bool)

(declare-fun res!828228 () Bool)

(declare-fun e!703916 () Bool)

(assert (=> b!1241732 (=> (not res!828228) (not e!703916))))

(declare-datatypes ((array!79982 0))(
  ( (array!79983 (arr!38581 (Array (_ BitVec 32) (_ BitVec 64))) (size!39118 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79982)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241732 (= res!828228 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1241733 () Bool)

(assert (=> b!1241733 (= e!703916 (not true))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1241733 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41202 0))(
  ( (Unit!41203) )
))
(declare-fun lt!562409 () Unit!41202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41202)

(assert (=> b!1241733 (= lt!562409 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1241731 () Bool)

(declare-fun res!828227 () Bool)

(assert (=> b!1241731 (=> (not res!828227) (not e!703916))))

(assert (=> b!1241731 (= res!828227 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39118 a!3575))))))

(declare-fun res!828226 () Bool)

(assert (=> start!103710 (=> (not res!828226) (not e!703916))))

(assert (=> start!103710 (= res!828226 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39118 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39118 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103710 e!703916))

(assert (=> start!103710 true))

(declare-fun array_inv!29519 (array!79982) Bool)

(assert (=> start!103710 (array_inv!29519 a!3575)))

(declare-fun b!1241730 () Bool)

(declare-fun res!828225 () Bool)

(assert (=> b!1241730 (=> (not res!828225) (not e!703916))))

(assert (=> b!1241730 (= res!828225 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(assert (= (and start!103710 res!828226) b!1241730))

(assert (= (and b!1241730 res!828225) b!1241731))

(assert (= (and b!1241731 res!828227) b!1241732))

(assert (= (and b!1241732 res!828228) b!1241733))

(declare-fun m!1145349 () Bool)

(assert (=> b!1241732 m!1145349))

(declare-fun m!1145351 () Bool)

(assert (=> b!1241733 m!1145351))

(declare-fun m!1145353 () Bool)

(assert (=> b!1241733 m!1145353))

(declare-fun m!1145355 () Bool)

(assert (=> start!103710 m!1145355))

(declare-fun m!1145357 () Bool)

(assert (=> b!1241730 m!1145357))

(push 1)

(assert (not start!103710))

(assert (not b!1241732))

(assert (not b!1241730))

(assert (not b!1241733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

