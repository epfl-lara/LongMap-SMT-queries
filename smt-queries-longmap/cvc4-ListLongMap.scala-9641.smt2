; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114210 () Bool)

(assert start!114210)

(declare-fun b!1353713 () Bool)

(declare-fun res!898277 () Bool)

(declare-fun e!769644 () Bool)

(assert (=> b!1353713 (=> (not res!898277) (not e!769644))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353713 (= res!898277 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353714 () Bool)

(declare-fun res!898274 () Bool)

(assert (=> b!1353714 (=> (not res!898274) (not e!769644))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92283 0))(
  ( (array!92284 (arr!44585 (Array (_ BitVec 32) (_ BitVec 64))) (size!45136 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92283)

(assert (=> b!1353714 (= res!898274 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45136 a!3742)))))

(declare-fun b!1353715 () Bool)

(declare-datatypes ((Unit!44276 0))(
  ( (Unit!44277) )
))
(declare-fun e!769642 () Unit!44276)

(declare-fun Unit!44278 () Unit!44276)

(assert (=> b!1353715 (= e!769642 Unit!44278)))

(declare-fun b!1353716 () Bool)

(declare-fun res!898279 () Bool)

(assert (=> b!1353716 (=> (not res!898279) (not e!769644))))

(declare-datatypes ((List!31613 0))(
  ( (Nil!31610) (Cons!31609 (h!32827 (_ BitVec 64)) (t!46263 List!31613)) )
))
(declare-fun acc!759 () List!31613)

(declare-fun contains!9325 (List!31613 (_ BitVec 64)) Bool)

(assert (=> b!1353716 (= res!898279 (not (contains!9325 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353717 () Bool)

(declare-fun e!769643 () Bool)

(assert (=> b!1353717 (= e!769643 false)))

(declare-fun lt!598013 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92283 (_ BitVec 32) List!31613) Bool)

(assert (=> b!1353717 (= lt!598013 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353719 () Bool)

(declare-fun res!898276 () Bool)

(assert (=> b!1353719 (=> (not res!898276) (not e!769644))))

(assert (=> b!1353719 (= res!898276 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31610))))

(declare-fun b!1353720 () Bool)

(declare-fun res!898281 () Bool)

(assert (=> b!1353720 (=> (not res!898281) (not e!769644))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353720 (= res!898281 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45136 a!3742))))))

(declare-fun b!1353721 () Bool)

(declare-fun res!898280 () Bool)

(assert (=> b!1353721 (=> (not res!898280) (not e!769644))))

(assert (=> b!1353721 (= res!898280 (not (contains!9325 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353722 () Bool)

(assert (=> b!1353722 (= e!769644 e!769643)))

(declare-fun res!898272 () Bool)

(assert (=> b!1353722 (=> (not res!898272) (not e!769643))))

(assert (=> b!1353722 (= res!898272 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598014 () Unit!44276)

(assert (=> b!1353722 (= lt!598014 e!769642)))

(declare-fun c!127168 () Bool)

(assert (=> b!1353722 (= c!127168 (validKeyInArray!0 (select (arr!44585 a!3742) from!3120)))))

(declare-fun b!1353718 () Bool)

(declare-fun lt!598011 () Unit!44276)

(assert (=> b!1353718 (= e!769642 lt!598011)))

(declare-fun lt!598012 () Unit!44276)

(declare-fun lemmaListSubSeqRefl!0 (List!31613) Unit!44276)

(assert (=> b!1353718 (= lt!598012 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!702 (List!31613 List!31613) Bool)

(assert (=> b!1353718 (subseq!702 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92283 List!31613 List!31613 (_ BitVec 32)) Unit!44276)

(declare-fun $colon$colon!716 (List!31613 (_ BitVec 64)) List!31613)

(assert (=> b!1353718 (= lt!598011 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!716 acc!759 (select (arr!44585 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353718 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!898275 () Bool)

(assert (=> start!114210 (=> (not res!898275) (not e!769644))))

(assert (=> start!114210 (= res!898275 (and (bvslt (size!45136 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45136 a!3742))))))

(assert (=> start!114210 e!769644))

(assert (=> start!114210 true))

(declare-fun array_inv!33866 (array!92283) Bool)

(assert (=> start!114210 (array_inv!33866 a!3742)))

(declare-fun b!1353723 () Bool)

(declare-fun res!898273 () Bool)

(assert (=> b!1353723 (=> (not res!898273) (not e!769644))))

(declare-fun noDuplicate!2156 (List!31613) Bool)

(assert (=> b!1353723 (= res!898273 (noDuplicate!2156 acc!759))))

(declare-fun b!1353724 () Bool)

(declare-fun res!898278 () Bool)

(assert (=> b!1353724 (=> (not res!898278) (not e!769644))))

(assert (=> b!1353724 (= res!898278 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114210 res!898275) b!1353723))

(assert (= (and b!1353723 res!898273) b!1353716))

(assert (= (and b!1353716 res!898279) b!1353721))

(assert (= (and b!1353721 res!898280) b!1353719))

(assert (= (and b!1353719 res!898276) b!1353724))

(assert (= (and b!1353724 res!898278) b!1353720))

(assert (= (and b!1353720 res!898281) b!1353713))

(assert (= (and b!1353713 res!898277) b!1353714))

(assert (= (and b!1353714 res!898274) b!1353722))

(assert (= (and b!1353722 c!127168) b!1353718))

(assert (= (and b!1353722 (not c!127168)) b!1353715))

(assert (= (and b!1353722 res!898272) b!1353717))

(declare-fun m!1240829 () Bool)

(assert (=> b!1353723 m!1240829))

(declare-fun m!1240831 () Bool)

(assert (=> b!1353722 m!1240831))

(assert (=> b!1353722 m!1240831))

(declare-fun m!1240833 () Bool)

(assert (=> b!1353722 m!1240833))

(declare-fun m!1240835 () Bool)

(assert (=> b!1353719 m!1240835))

(declare-fun m!1240837 () Bool)

(assert (=> b!1353721 m!1240837))

(declare-fun m!1240839 () Bool)

(assert (=> b!1353717 m!1240839))

(declare-fun m!1240841 () Bool)

(assert (=> start!114210 m!1240841))

(declare-fun m!1240843 () Bool)

(assert (=> b!1353718 m!1240843))

(assert (=> b!1353718 m!1240831))

(declare-fun m!1240845 () Bool)

(assert (=> b!1353718 m!1240845))

(declare-fun m!1240847 () Bool)

(assert (=> b!1353718 m!1240847))

(assert (=> b!1353718 m!1240839))

(assert (=> b!1353718 m!1240831))

(assert (=> b!1353718 m!1240845))

(declare-fun m!1240849 () Bool)

(assert (=> b!1353718 m!1240849))

(declare-fun m!1240851 () Bool)

(assert (=> b!1353716 m!1240851))

(declare-fun m!1240853 () Bool)

(assert (=> b!1353713 m!1240853))

(declare-fun m!1240855 () Bool)

(assert (=> b!1353724 m!1240855))

(push 1)

(assert (not b!1353716))

(assert (not b!1353717))

(assert (not b!1353723))

(assert (not b!1353719))

(assert (not b!1353721))

(assert (not start!114210))

(assert (not b!1353713))

(assert (not b!1353722))

(assert (not b!1353718))

(assert (not b!1353724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

