; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114668 () Bool)

(assert start!114668)

(declare-fun b!1360266 () Bool)

(declare-fun res!904593 () Bool)

(declare-fun e!771766 () Bool)

(assert (=> b!1360266 (=> (not res!904593) (not e!771766))))

(declare-datatypes ((List!31758 0))(
  ( (Nil!31755) (Cons!31754 (h!32963 (_ BitVec 64)) (t!46434 List!31758)) )
))
(declare-fun acc!759 () List!31758)

(declare-datatypes ((array!92556 0))(
  ( (array!92557 (arr!44717 (Array (_ BitVec 32) (_ BitVec 64))) (size!45267 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92556)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92556 (_ BitVec 32) List!31758) Bool)

(assert (=> b!1360266 (= res!904593 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360267 () Bool)

(declare-fun res!904597 () Bool)

(assert (=> b!1360267 (=> (not res!904597) (not e!771766))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360267 (= res!904597 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45267 a!3742))))))

(declare-fun b!1360268 () Bool)

(declare-fun res!904595 () Bool)

(assert (=> b!1360268 (=> (not res!904595) (not e!771766))))

(declare-fun contains!9467 (List!31758 (_ BitVec 64)) Bool)

(assert (=> b!1360268 (= res!904595 (not (contains!9467 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360270 () Bool)

(declare-datatypes ((Unit!44811 0))(
  ( (Unit!44812) )
))
(declare-fun e!771765 () Unit!44811)

(declare-fun Unit!44813 () Unit!44811)

(assert (=> b!1360270 (= e!771765 Unit!44813)))

(declare-fun b!1360271 () Bool)

(declare-fun res!904592 () Bool)

(assert (=> b!1360271 (=> (not res!904592) (not e!771766))))

(assert (=> b!1360271 (= res!904592 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45267 a!3742)))))

(declare-fun b!1360272 () Bool)

(declare-fun res!904599 () Bool)

(assert (=> b!1360272 (=> (not res!904599) (not e!771766))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360272 (= res!904599 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360273 () Bool)

(declare-fun res!904594 () Bool)

(assert (=> b!1360273 (=> (not res!904594) (not e!771766))))

(assert (=> b!1360273 (= res!904594 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31755))))

(declare-fun b!1360274 () Bool)

(assert (=> b!1360274 (= e!771766 false)))

(declare-fun lt!599834 () Unit!44811)

(assert (=> b!1360274 (= lt!599834 e!771765)))

(declare-fun c!127277 () Bool)

(assert (=> b!1360274 (= c!127277 (validKeyInArray!0 (select (arr!44717 a!3742) from!3120)))))

(declare-fun b!1360275 () Bool)

(declare-fun res!904596 () Bool)

(assert (=> b!1360275 (=> (not res!904596) (not e!771766))))

(assert (=> b!1360275 (= res!904596 (not (contains!9467 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360276 () Bool)

(declare-fun lt!599836 () Unit!44811)

(assert (=> b!1360276 (= e!771765 lt!599836)))

(declare-fun lt!599835 () Unit!44811)

(declare-fun lemmaListSubSeqRefl!0 (List!31758) Unit!44811)

(assert (=> b!1360276 (= lt!599835 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!869 (List!31758 List!31758) Bool)

(assert (=> b!1360276 (subseq!869 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92556 List!31758 List!31758 (_ BitVec 32)) Unit!44811)

(declare-fun $colon$colon!872 (List!31758 (_ BitVec 64)) List!31758)

(assert (=> b!1360276 (= lt!599836 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!872 acc!759 (select (arr!44717 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360276 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360269 () Bool)

(declare-fun res!904600 () Bool)

(assert (=> b!1360269 (=> (not res!904600) (not e!771766))))

(declare-fun noDuplicate!2324 (List!31758) Bool)

(assert (=> b!1360269 (= res!904600 (noDuplicate!2324 acc!759))))

(declare-fun res!904598 () Bool)

(assert (=> start!114668 (=> (not res!904598) (not e!771766))))

(assert (=> start!114668 (= res!904598 (and (bvslt (size!45267 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45267 a!3742))))))

(assert (=> start!114668 e!771766))

(assert (=> start!114668 true))

(declare-fun array_inv!33745 (array!92556) Bool)

(assert (=> start!114668 (array_inv!33745 a!3742)))

(assert (= (and start!114668 res!904598) b!1360269))

(assert (= (and b!1360269 res!904600) b!1360268))

(assert (= (and b!1360268 res!904595) b!1360275))

(assert (= (and b!1360275 res!904596) b!1360273))

(assert (= (and b!1360273 res!904594) b!1360266))

(assert (= (and b!1360266 res!904593) b!1360267))

(assert (= (and b!1360267 res!904597) b!1360272))

(assert (= (and b!1360272 res!904599) b!1360271))

(assert (= (and b!1360271 res!904592) b!1360274))

(assert (= (and b!1360274 c!127277) b!1360276))

(assert (= (and b!1360274 (not c!127277)) b!1360270))

(declare-fun m!1245565 () Bool)

(assert (=> b!1360274 m!1245565))

(assert (=> b!1360274 m!1245565))

(declare-fun m!1245567 () Bool)

(assert (=> b!1360274 m!1245567))

(declare-fun m!1245569 () Bool)

(assert (=> b!1360266 m!1245569))

(declare-fun m!1245571 () Bool)

(assert (=> b!1360273 m!1245571))

(declare-fun m!1245573 () Bool)

(assert (=> b!1360275 m!1245573))

(declare-fun m!1245575 () Bool)

(assert (=> b!1360268 m!1245575))

(declare-fun m!1245577 () Bool)

(assert (=> b!1360276 m!1245577))

(assert (=> b!1360276 m!1245565))

(declare-fun m!1245579 () Bool)

(assert (=> b!1360276 m!1245579))

(declare-fun m!1245581 () Bool)

(assert (=> b!1360276 m!1245581))

(declare-fun m!1245583 () Bool)

(assert (=> b!1360276 m!1245583))

(assert (=> b!1360276 m!1245565))

(assert (=> b!1360276 m!1245579))

(declare-fun m!1245585 () Bool)

(assert (=> b!1360276 m!1245585))

(declare-fun m!1245587 () Bool)

(assert (=> b!1360269 m!1245587))

(declare-fun m!1245589 () Bool)

(assert (=> b!1360272 m!1245589))

(declare-fun m!1245591 () Bool)

(assert (=> start!114668 m!1245591))

(push 1)

(assert (not b!1360274))

(assert (not b!1360272))

(assert (not b!1360266))

(assert (not b!1360275))

(assert (not b!1360273))

(assert (not b!1360276))

(assert (not b!1360269))

(assert (not start!114668))

(assert (not b!1360268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

