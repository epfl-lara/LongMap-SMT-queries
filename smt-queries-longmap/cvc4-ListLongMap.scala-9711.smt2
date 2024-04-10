; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114882 () Bool)

(assert start!114882)

(declare-fun b!1361851 () Bool)

(declare-fun res!905938 () Bool)

(declare-fun e!772573 () Bool)

(assert (=> b!1361851 (=> (not res!905938) (not e!772573))))

(declare-datatypes ((List!31784 0))(
  ( (Nil!31781) (Cons!31780 (h!32989 (_ BitVec 64)) (t!46469 List!31784)) )
))
(declare-fun acc!759 () List!31784)

(declare-fun noDuplicate!2350 (List!31784) Bool)

(assert (=> b!1361851 (= res!905938 (noDuplicate!2350 acc!759))))

(declare-fun b!1361852 () Bool)

(declare-fun res!905926 () Bool)

(assert (=> b!1361852 (=> (not res!905926) (not e!772573))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92617 0))(
  ( (array!92618 (arr!44743 (Array (_ BitVec 32) (_ BitVec 64))) (size!45293 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92617)

(assert (=> b!1361852 (= res!905926 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45293 a!3742))))))

(declare-fun b!1361853 () Bool)

(declare-fun res!905925 () Bool)

(assert (=> b!1361853 (=> (not res!905925) (not e!772573))))

(declare-fun arrayNoDuplicates!0 (array!92617 (_ BitVec 32) List!31784) Bool)

(assert (=> b!1361853 (= res!905925 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31781))))

(declare-fun b!1361854 () Bool)

(declare-datatypes ((Unit!44889 0))(
  ( (Unit!44890) )
))
(declare-fun e!772572 () Unit!44889)

(declare-fun Unit!44891 () Unit!44889)

(assert (=> b!1361854 (= e!772572 Unit!44891)))

(declare-fun b!1361855 () Bool)

(declare-fun res!905937 () Bool)

(assert (=> b!1361855 (=> (not res!905937) (not e!772573))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361855 (= res!905937 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361856 () Bool)

(declare-fun res!905935 () Bool)

(declare-fun e!772574 () Bool)

(assert (=> b!1361856 (=> (not res!905935) (not e!772574))))

(declare-fun lt!600306 () List!31784)

(declare-fun contains!9493 (List!31784 (_ BitVec 64)) Bool)

(assert (=> b!1361856 (= res!905935 (not (contains!9493 lt!600306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905931 () Bool)

(assert (=> start!114882 (=> (not res!905931) (not e!772573))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114882 (= res!905931 (and (bvslt (size!45293 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45293 a!3742))))))

(assert (=> start!114882 e!772573))

(assert (=> start!114882 true))

(declare-fun array_inv!33771 (array!92617) Bool)

(assert (=> start!114882 (array_inv!33771 a!3742)))

(declare-fun b!1361857 () Bool)

(declare-fun res!905928 () Bool)

(assert (=> b!1361857 (=> (not res!905928) (not e!772574))))

(assert (=> b!1361857 (= res!905928 (not (contains!9493 lt!600306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361858 () Bool)

(declare-fun e!772575 () Bool)

(assert (=> b!1361858 (= e!772575 e!772574)))

(declare-fun res!905930 () Bool)

(assert (=> b!1361858 (=> (not res!905930) (not e!772574))))

(assert (=> b!1361858 (= res!905930 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!898 (List!31784 (_ BitVec 64)) List!31784)

(assert (=> b!1361858 (= lt!600306 ($colon$colon!898 acc!759 (select (arr!44743 a!3742) from!3120)))))

(declare-fun b!1361859 () Bool)

(declare-fun lt!600302 () Unit!44889)

(assert (=> b!1361859 (= e!772572 lt!600302)))

(declare-fun lt!600304 () Unit!44889)

(declare-fun lemmaListSubSeqRefl!0 (List!31784) Unit!44889)

(assert (=> b!1361859 (= lt!600304 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!895 (List!31784 List!31784) Bool)

(assert (=> b!1361859 (subseq!895 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92617 List!31784 List!31784 (_ BitVec 32)) Unit!44889)

(assert (=> b!1361859 (= lt!600302 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!898 acc!759 (select (arr!44743 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361859 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361860 () Bool)

(declare-fun res!905929 () Bool)

(assert (=> b!1361860 (=> (not res!905929) (not e!772573))))

(assert (=> b!1361860 (= res!905929 (not (contains!9493 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361861 () Bool)

(declare-fun res!905934 () Bool)

(assert (=> b!1361861 (=> (not res!905934) (not e!772573))))

(assert (=> b!1361861 (= res!905934 (not (contains!9493 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361862 () Bool)

(assert (=> b!1361862 (= e!772574 false)))

(declare-fun lt!600307 () Bool)

(assert (=> b!1361862 (= lt!600307 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600306))))

(declare-fun b!1361863 () Bool)

(declare-fun res!905927 () Bool)

(assert (=> b!1361863 (=> (not res!905927) (not e!772574))))

(assert (=> b!1361863 (= res!905927 (noDuplicate!2350 lt!600306))))

(declare-fun b!1361864 () Bool)

(declare-fun res!905936 () Bool)

(assert (=> b!1361864 (=> (not res!905936) (not e!772573))))

(assert (=> b!1361864 (= res!905936 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361865 () Bool)

(declare-fun res!905932 () Bool)

(assert (=> b!1361865 (=> (not res!905932) (not e!772573))))

(assert (=> b!1361865 (= res!905932 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45293 a!3742)))))

(declare-fun b!1361866 () Bool)

(assert (=> b!1361866 (= e!772573 e!772575)))

(declare-fun res!905933 () Bool)

(assert (=> b!1361866 (=> (not res!905933) (not e!772575))))

(declare-fun lt!600305 () Bool)

(assert (=> b!1361866 (= res!905933 (and (not (= from!3120 i!1404)) lt!600305))))

(declare-fun lt!600303 () Unit!44889)

(assert (=> b!1361866 (= lt!600303 e!772572)))

(declare-fun c!127403 () Bool)

(assert (=> b!1361866 (= c!127403 lt!600305)))

(assert (=> b!1361866 (= lt!600305 (validKeyInArray!0 (select (arr!44743 a!3742) from!3120)))))

(assert (= (and start!114882 res!905931) b!1361851))

(assert (= (and b!1361851 res!905938) b!1361861))

(assert (= (and b!1361861 res!905934) b!1361860))

(assert (= (and b!1361860 res!905929) b!1361853))

(assert (= (and b!1361853 res!905925) b!1361864))

(assert (= (and b!1361864 res!905936) b!1361852))

(assert (= (and b!1361852 res!905926) b!1361855))

(assert (= (and b!1361855 res!905937) b!1361865))

(assert (= (and b!1361865 res!905932) b!1361866))

(assert (= (and b!1361866 c!127403) b!1361859))

(assert (= (and b!1361866 (not c!127403)) b!1361854))

(assert (= (and b!1361866 res!905933) b!1361858))

(assert (= (and b!1361858 res!905930) b!1361863))

(assert (= (and b!1361863 res!905927) b!1361857))

(assert (= (and b!1361857 res!905928) b!1361856))

(assert (= (and b!1361856 res!905935) b!1361862))

(declare-fun m!1246885 () Bool)

(assert (=> b!1361858 m!1246885))

(assert (=> b!1361858 m!1246885))

(declare-fun m!1246887 () Bool)

(assert (=> b!1361858 m!1246887))

(declare-fun m!1246889 () Bool)

(assert (=> b!1361861 m!1246889))

(declare-fun m!1246891 () Bool)

(assert (=> b!1361864 m!1246891))

(declare-fun m!1246893 () Bool)

(assert (=> b!1361856 m!1246893))

(declare-fun m!1246895 () Bool)

(assert (=> b!1361853 m!1246895))

(declare-fun m!1246897 () Bool)

(assert (=> start!114882 m!1246897))

(declare-fun m!1246899 () Bool)

(assert (=> b!1361860 m!1246899))

(assert (=> b!1361866 m!1246885))

(assert (=> b!1361866 m!1246885))

(declare-fun m!1246901 () Bool)

(assert (=> b!1361866 m!1246901))

(declare-fun m!1246903 () Bool)

(assert (=> b!1361859 m!1246903))

(assert (=> b!1361859 m!1246885))

(assert (=> b!1361859 m!1246887))

(declare-fun m!1246905 () Bool)

(assert (=> b!1361859 m!1246905))

(declare-fun m!1246907 () Bool)

(assert (=> b!1361859 m!1246907))

(assert (=> b!1361859 m!1246885))

(assert (=> b!1361859 m!1246887))

(declare-fun m!1246909 () Bool)

(assert (=> b!1361859 m!1246909))

(declare-fun m!1246911 () Bool)

(assert (=> b!1361855 m!1246911))

(declare-fun m!1246913 () Bool)

(assert (=> b!1361857 m!1246913))

(declare-fun m!1246915 () Bool)

(assert (=> b!1361862 m!1246915))

(declare-fun m!1246917 () Bool)

(assert (=> b!1361863 m!1246917))

(declare-fun m!1246919 () Bool)

(assert (=> b!1361851 m!1246919))

(push 1)

