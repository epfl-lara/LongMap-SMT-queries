; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114984 () Bool)

(assert start!114984)

(declare-fun b!1362866 () Bool)

(declare-fun res!906812 () Bool)

(declare-fun e!772985 () Bool)

(assert (=> b!1362866 (=> (not res!906812) (not e!772985))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362866 (= res!906812 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!906810 () Bool)

(assert (=> start!114984 (=> (not res!906810) (not e!772985))))

(declare-datatypes ((array!92611 0))(
  ( (array!92612 (arr!44739 (Array (_ BitVec 32) (_ BitVec 64))) (size!45291 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92611)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114984 (= res!906810 (and (bvslt (size!45291 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45291 a!3742))))))

(assert (=> start!114984 e!772985))

(assert (=> start!114984 true))

(declare-fun array_inv!33972 (array!92611) Bool)

(assert (=> start!114984 (array_inv!33972 a!3742)))

(declare-fun b!1362867 () Bool)

(declare-fun res!906813 () Bool)

(assert (=> b!1362867 (=> (not res!906813) (not e!772985))))

(declare-datatypes ((List!31858 0))(
  ( (Nil!31855) (Cons!31854 (h!33063 (_ BitVec 64)) (t!46538 List!31858)) )
))
(declare-fun acc!759 () List!31858)

(declare-fun noDuplicate!2393 (List!31858) Bool)

(assert (=> b!1362867 (= res!906813 (noDuplicate!2393 acc!759))))

(declare-fun b!1362868 () Bool)

(declare-fun res!906815 () Bool)

(assert (=> b!1362868 (=> (not res!906815) (not e!772985))))

(assert (=> b!1362868 (= res!906815 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45291 a!3742)))))

(declare-fun b!1362869 () Bool)

(assert (=> b!1362869 (= e!772985 false)))

(declare-datatypes ((Unit!44793 0))(
  ( (Unit!44794) )
))
(declare-fun lt!600443 () Unit!44793)

(declare-fun e!772986 () Unit!44793)

(assert (=> b!1362869 (= lt!600443 e!772986)))

(declare-fun c!127472 () Bool)

(assert (=> b!1362869 (= c!127472 (validKeyInArray!0 (select (arr!44739 a!3742) from!3120)))))

(declare-fun b!1362870 () Bool)

(declare-fun res!906811 () Bool)

(assert (=> b!1362870 (=> (not res!906811) (not e!772985))))

(declare-fun arrayNoDuplicates!0 (array!92611 (_ BitVec 32) List!31858) Bool)

(assert (=> b!1362870 (= res!906811 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362871 () Bool)

(declare-fun res!906808 () Bool)

(assert (=> b!1362871 (=> (not res!906808) (not e!772985))))

(assert (=> b!1362871 (= res!906808 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31855))))

(declare-fun b!1362872 () Bool)

(declare-fun res!906807 () Bool)

(assert (=> b!1362872 (=> (not res!906807) (not e!772985))))

(declare-fun contains!9478 (List!31858 (_ BitVec 64)) Bool)

(assert (=> b!1362872 (= res!906807 (not (contains!9478 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362873 () Bool)

(declare-fun Unit!44795 () Unit!44793)

(assert (=> b!1362873 (= e!772986 Unit!44795)))

(declare-fun b!1362874 () Bool)

(declare-fun lt!600445 () Unit!44793)

(assert (=> b!1362874 (= e!772986 lt!600445)))

(declare-fun lt!600444 () Unit!44793)

(declare-fun lemmaListSubSeqRefl!0 (List!31858) Unit!44793)

(assert (=> b!1362874 (= lt!600444 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!916 (List!31858 List!31858) Bool)

(assert (=> b!1362874 (subseq!916 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92611 List!31858 List!31858 (_ BitVec 32)) Unit!44793)

(declare-fun $colon$colon!921 (List!31858 (_ BitVec 64)) List!31858)

(assert (=> b!1362874 (= lt!600445 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!921 acc!759 (select (arr!44739 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362874 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362875 () Bool)

(declare-fun res!906809 () Bool)

(assert (=> b!1362875 (=> (not res!906809) (not e!772985))))

(assert (=> b!1362875 (= res!906809 (not (contains!9478 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362876 () Bool)

(declare-fun res!906814 () Bool)

(assert (=> b!1362876 (=> (not res!906814) (not e!772985))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362876 (= res!906814 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45291 a!3742))))))

(assert (= (and start!114984 res!906810) b!1362867))

(assert (= (and b!1362867 res!906813) b!1362875))

(assert (= (and b!1362875 res!906809) b!1362872))

(assert (= (and b!1362872 res!906807) b!1362871))

(assert (= (and b!1362871 res!906808) b!1362870))

(assert (= (and b!1362870 res!906811) b!1362876))

(assert (= (and b!1362876 res!906814) b!1362866))

(assert (= (and b!1362866 res!906812) b!1362868))

(assert (= (and b!1362868 res!906815) b!1362869))

(assert (= (and b!1362869 c!127472) b!1362874))

(assert (= (and b!1362869 (not c!127472)) b!1362873))

(declare-fun m!1247319 () Bool)

(assert (=> b!1362866 m!1247319))

(declare-fun m!1247321 () Bool)

(assert (=> b!1362875 m!1247321))

(declare-fun m!1247323 () Bool)

(assert (=> b!1362872 m!1247323))

(declare-fun m!1247325 () Bool)

(assert (=> start!114984 m!1247325))

(declare-fun m!1247327 () Bool)

(assert (=> b!1362874 m!1247327))

(declare-fun m!1247329 () Bool)

(assert (=> b!1362874 m!1247329))

(declare-fun m!1247331 () Bool)

(assert (=> b!1362874 m!1247331))

(declare-fun m!1247333 () Bool)

(assert (=> b!1362874 m!1247333))

(declare-fun m!1247335 () Bool)

(assert (=> b!1362874 m!1247335))

(assert (=> b!1362874 m!1247329))

(assert (=> b!1362874 m!1247331))

(declare-fun m!1247337 () Bool)

(assert (=> b!1362874 m!1247337))

(declare-fun m!1247339 () Bool)

(assert (=> b!1362870 m!1247339))

(declare-fun m!1247341 () Bool)

(assert (=> b!1362871 m!1247341))

(assert (=> b!1362869 m!1247329))

(assert (=> b!1362869 m!1247329))

(declare-fun m!1247343 () Bool)

(assert (=> b!1362869 m!1247343))

(declare-fun m!1247345 () Bool)

(assert (=> b!1362867 m!1247345))

(push 1)

(assert (not b!1362875))

(assert (not b!1362869))

(assert (not b!1362871))

(assert (not start!114984))

(assert (not b!1362867))

(assert (not b!1362870))

(assert (not b!1362872))

(assert (not b!1362874))

(assert (not b!1362866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

