; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114498 () Bool)

(assert start!114498)

(declare-fun b!1358847 () Bool)

(declare-fun res!903455 () Bool)

(declare-fun e!771117 () Bool)

(assert (=> b!1358847 (=> (not res!903455) (not e!771117))))

(declare-datatypes ((List!31783 0))(
  ( (Nil!31780) (Cons!31779 (h!32988 (_ BitVec 64)) (t!46445 List!31783)) )
))
(declare-fun acc!759 () List!31783)

(declare-datatypes ((array!92443 0))(
  ( (array!92444 (arr!44664 (Array (_ BitVec 32) (_ BitVec 64))) (size!45216 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92443)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92443 (_ BitVec 32) List!31783) Bool)

(assert (=> b!1358847 (= res!903455 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358848 () Bool)

(declare-fun res!903459 () Bool)

(assert (=> b!1358848 (=> (not res!903459) (not e!771117))))

(assert (=> b!1358848 (= res!903459 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45216 a!3742)))))

(declare-fun b!1358849 () Bool)

(declare-datatypes ((Unit!44568 0))(
  ( (Unit!44569) )
))
(declare-fun e!771118 () Unit!44568)

(declare-fun lt!599283 () Unit!44568)

(assert (=> b!1358849 (= e!771118 lt!599283)))

(declare-fun lt!599284 () Unit!44568)

(declare-fun lemmaListSubSeqRefl!0 (List!31783) Unit!44568)

(assert (=> b!1358849 (= lt!599284 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!841 (List!31783 List!31783) Bool)

(assert (=> b!1358849 (subseq!841 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92443 List!31783 List!31783 (_ BitVec 32)) Unit!44568)

(declare-fun $colon$colon!846 (List!31783 (_ BitVec 64)) List!31783)

(assert (=> b!1358849 (= lt!599283 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!846 acc!759 (select (arr!44664 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358849 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358850 () Bool)

(declare-fun res!903454 () Bool)

(assert (=> b!1358850 (=> (not res!903454) (not e!771117))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358850 (= res!903454 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358851 () Bool)

(declare-fun res!903453 () Bool)

(assert (=> b!1358851 (=> (not res!903453) (not e!771117))))

(declare-fun contains!9403 (List!31783 (_ BitVec 64)) Bool)

(assert (=> b!1358851 (= res!903453 (not (contains!9403 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358852 () Bool)

(declare-fun res!903456 () Bool)

(assert (=> b!1358852 (=> (not res!903456) (not e!771117))))

(declare-fun noDuplicate!2318 (List!31783) Bool)

(assert (=> b!1358852 (= res!903456 (noDuplicate!2318 acc!759))))

(declare-fun b!1358853 () Bool)

(declare-fun res!903458 () Bool)

(assert (=> b!1358853 (=> (not res!903458) (not e!771117))))

(assert (=> b!1358853 (= res!903458 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31780))))

(declare-fun b!1358846 () Bool)

(declare-fun res!903461 () Bool)

(assert (=> b!1358846 (=> (not res!903461) (not e!771117))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358846 (= res!903461 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45216 a!3742))))))

(declare-fun res!903457 () Bool)

(assert (=> start!114498 (=> (not res!903457) (not e!771117))))

(assert (=> start!114498 (= res!903457 (and (bvslt (size!45216 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45216 a!3742))))))

(assert (=> start!114498 e!771117))

(assert (=> start!114498 true))

(declare-fun array_inv!33897 (array!92443) Bool)

(assert (=> start!114498 (array_inv!33897 a!3742)))

(declare-fun b!1358854 () Bool)

(assert (=> b!1358854 (= e!771117 false)))

(declare-fun lt!599282 () Unit!44568)

(assert (=> b!1358854 (= lt!599282 e!771118)))

(declare-fun c!127139 () Bool)

(assert (=> b!1358854 (= c!127139 (validKeyInArray!0 (select (arr!44664 a!3742) from!3120)))))

(declare-fun b!1358855 () Bool)

(declare-fun Unit!44570 () Unit!44568)

(assert (=> b!1358855 (= e!771118 Unit!44570)))

(declare-fun b!1358856 () Bool)

(declare-fun res!903460 () Bool)

(assert (=> b!1358856 (=> (not res!903460) (not e!771117))))

(assert (=> b!1358856 (= res!903460 (not (contains!9403 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114498 res!903457) b!1358852))

(assert (= (and b!1358852 res!903456) b!1358856))

(assert (= (and b!1358856 res!903460) b!1358851))

(assert (= (and b!1358851 res!903453) b!1358853))

(assert (= (and b!1358853 res!903458) b!1358847))

(assert (= (and b!1358847 res!903455) b!1358846))

(assert (= (and b!1358846 res!903461) b!1358850))

(assert (= (and b!1358850 res!903454) b!1358848))

(assert (= (and b!1358848 res!903459) b!1358854))

(assert (= (and b!1358854 c!127139) b!1358849))

(assert (= (and b!1358854 (not c!127139)) b!1358855))

(declare-fun m!1243911 () Bool)

(assert (=> b!1358850 m!1243911))

(declare-fun m!1243913 () Bool)

(assert (=> b!1358854 m!1243913))

(assert (=> b!1358854 m!1243913))

(declare-fun m!1243915 () Bool)

(assert (=> b!1358854 m!1243915))

(declare-fun m!1243917 () Bool)

(assert (=> b!1358849 m!1243917))

(assert (=> b!1358849 m!1243913))

(declare-fun m!1243919 () Bool)

(assert (=> b!1358849 m!1243919))

(declare-fun m!1243921 () Bool)

(assert (=> b!1358849 m!1243921))

(declare-fun m!1243923 () Bool)

(assert (=> b!1358849 m!1243923))

(assert (=> b!1358849 m!1243913))

(assert (=> b!1358849 m!1243919))

(declare-fun m!1243925 () Bool)

(assert (=> b!1358849 m!1243925))

(declare-fun m!1243927 () Bool)

(assert (=> start!114498 m!1243927))

(declare-fun m!1243929 () Bool)

(assert (=> b!1358847 m!1243929))

(declare-fun m!1243931 () Bool)

(assert (=> b!1358851 m!1243931))

(declare-fun m!1243933 () Bool)

(assert (=> b!1358852 m!1243933))

(declare-fun m!1243935 () Bool)

(assert (=> b!1358856 m!1243935))

(declare-fun m!1243937 () Bool)

(assert (=> b!1358853 m!1243937))

(push 1)

(assert (not b!1358849))

(assert (not b!1358854))

(assert (not b!1358853))

(assert (not b!1358851))

(assert (not b!1358847))

(assert (not start!114498))

(assert (not b!1358852))

(assert (not b!1358850))

(assert (not b!1358856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

