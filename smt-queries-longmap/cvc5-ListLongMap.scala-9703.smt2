; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114672 () Bool)

(assert start!114672)

(declare-fun b!1360262 () Bool)

(declare-fun res!904617 () Bool)

(declare-fun e!771750 () Bool)

(assert (=> b!1360262 (=> (not res!904617) (not e!771750))))

(declare-datatypes ((List!31813 0))(
  ( (Nil!31810) (Cons!31809 (h!33018 (_ BitVec 64)) (t!46481 List!31813)) )
))
(declare-fun acc!759 () List!31813)

(declare-datatypes ((array!92509 0))(
  ( (array!92510 (arr!44694 (Array (_ BitVec 32) (_ BitVec 64))) (size!45246 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92509)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92509 (_ BitVec 32) List!31813) Bool)

(assert (=> b!1360262 (= res!904617 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360263 () Bool)

(declare-fun res!904623 () Bool)

(assert (=> b!1360263 (=> (not res!904623) (not e!771750))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360263 (= res!904623 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45246 a!3742))))))

(declare-fun res!904621 () Bool)

(assert (=> start!114672 (=> (not res!904621) (not e!771750))))

(assert (=> start!114672 (= res!904621 (and (bvslt (size!45246 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45246 a!3742))))))

(assert (=> start!114672 e!771750))

(assert (=> start!114672 true))

(declare-fun array_inv!33927 (array!92509) Bool)

(assert (=> start!114672 (array_inv!33927 a!3742)))

(declare-fun b!1360264 () Bool)

(assert (=> b!1360264 (= e!771750 false)))

(declare-datatypes ((Unit!44658 0))(
  ( (Unit!44659) )
))
(declare-fun lt!599668 () Unit!44658)

(declare-fun e!771751 () Unit!44658)

(assert (=> b!1360264 (= lt!599668 e!771751)))

(declare-fun c!127265 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360264 (= c!127265 (validKeyInArray!0 (select (arr!44694 a!3742) from!3120)))))

(declare-fun b!1360265 () Bool)

(declare-fun res!904625 () Bool)

(assert (=> b!1360265 (=> (not res!904625) (not e!771750))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360265 (= res!904625 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360266 () Bool)

(declare-fun res!904620 () Bool)

(assert (=> b!1360266 (=> (not res!904620) (not e!771750))))

(assert (=> b!1360266 (= res!904620 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31810))))

(declare-fun b!1360267 () Bool)

(declare-fun Unit!44660 () Unit!44658)

(assert (=> b!1360267 (= e!771751 Unit!44660)))

(declare-fun b!1360268 () Bool)

(declare-fun res!904618 () Bool)

(assert (=> b!1360268 (=> (not res!904618) (not e!771750))))

(declare-fun contains!9433 (List!31813 (_ BitVec 64)) Bool)

(assert (=> b!1360268 (= res!904618 (not (contains!9433 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360269 () Bool)

(declare-fun res!904624 () Bool)

(assert (=> b!1360269 (=> (not res!904624) (not e!771750))))

(declare-fun noDuplicate!2348 (List!31813) Bool)

(assert (=> b!1360269 (= res!904624 (noDuplicate!2348 acc!759))))

(declare-fun b!1360270 () Bool)

(declare-fun lt!599667 () Unit!44658)

(assert (=> b!1360270 (= e!771751 lt!599667)))

(declare-fun lt!599666 () Unit!44658)

(declare-fun lemmaListSubSeqRefl!0 (List!31813) Unit!44658)

(assert (=> b!1360270 (= lt!599666 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!871 (List!31813 List!31813) Bool)

(assert (=> b!1360270 (subseq!871 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92509 List!31813 List!31813 (_ BitVec 32)) Unit!44658)

(declare-fun $colon$colon!876 (List!31813 (_ BitVec 64)) List!31813)

(assert (=> b!1360270 (= lt!599667 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!876 acc!759 (select (arr!44694 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360270 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360271 () Bool)

(declare-fun res!904619 () Bool)

(assert (=> b!1360271 (=> (not res!904619) (not e!771750))))

(assert (=> b!1360271 (= res!904619 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45246 a!3742)))))

(declare-fun b!1360272 () Bool)

(declare-fun res!904622 () Bool)

(assert (=> b!1360272 (=> (not res!904622) (not e!771750))))

(assert (=> b!1360272 (= res!904622 (not (contains!9433 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114672 res!904621) b!1360269))

(assert (= (and b!1360269 res!904624) b!1360268))

(assert (= (and b!1360268 res!904618) b!1360272))

(assert (= (and b!1360272 res!904622) b!1360266))

(assert (= (and b!1360266 res!904620) b!1360262))

(assert (= (and b!1360262 res!904617) b!1360263))

(assert (= (and b!1360263 res!904623) b!1360265))

(assert (= (and b!1360265 res!904625) b!1360271))

(assert (= (and b!1360271 res!904619) b!1360264))

(assert (= (and b!1360264 c!127265) b!1360270))

(assert (= (and b!1360264 (not c!127265)) b!1360267))

(declare-fun m!1245105 () Bool)

(assert (=> b!1360264 m!1245105))

(assert (=> b!1360264 m!1245105))

(declare-fun m!1245107 () Bool)

(assert (=> b!1360264 m!1245107))

(declare-fun m!1245109 () Bool)

(assert (=> b!1360266 m!1245109))

(declare-fun m!1245111 () Bool)

(assert (=> start!114672 m!1245111))

(declare-fun m!1245113 () Bool)

(assert (=> b!1360268 m!1245113))

(declare-fun m!1245115 () Bool)

(assert (=> b!1360272 m!1245115))

(declare-fun m!1245117 () Bool)

(assert (=> b!1360265 m!1245117))

(declare-fun m!1245119 () Bool)

(assert (=> b!1360262 m!1245119))

(declare-fun m!1245121 () Bool)

(assert (=> b!1360270 m!1245121))

(assert (=> b!1360270 m!1245105))

(declare-fun m!1245123 () Bool)

(assert (=> b!1360270 m!1245123))

(declare-fun m!1245125 () Bool)

(assert (=> b!1360270 m!1245125))

(declare-fun m!1245127 () Bool)

(assert (=> b!1360270 m!1245127))

(assert (=> b!1360270 m!1245105))

(assert (=> b!1360270 m!1245123))

(declare-fun m!1245129 () Bool)

(assert (=> b!1360270 m!1245129))

(declare-fun m!1245131 () Bool)

(assert (=> b!1360269 m!1245131))

(push 1)

(assert (not b!1360262))

(assert (not b!1360272))

(assert (not b!1360268))

(assert (not b!1360270))

(assert (not start!114672))

(assert (not b!1360269))

(assert (not b!1360266))

(assert (not b!1360265))

(assert (not b!1360264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

