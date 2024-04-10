; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114982 () Bool)

(assert start!114982)

(declare-fun res!906815 () Bool)

(declare-fun e!773010 () Bool)

(assert (=> start!114982 (=> (not res!906815) (not e!773010))))

(declare-datatypes ((array!92660 0))(
  ( (array!92661 (arr!44763 (Array (_ BitVec 32) (_ BitVec 64))) (size!45313 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92660)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114982 (= res!906815 (and (bvslt (size!45313 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45313 a!3742))))))

(assert (=> start!114982 e!773010))

(assert (=> start!114982 true))

(declare-fun array_inv!33791 (array!92660) Bool)

(assert (=> start!114982 (array_inv!33791 a!3742)))

(declare-fun b!1362903 () Bool)

(declare-datatypes ((Unit!44949 0))(
  ( (Unit!44950) )
))
(declare-fun e!773009 () Unit!44949)

(declare-fun lt!600620 () Unit!44949)

(assert (=> b!1362903 (= e!773009 lt!600620)))

(declare-fun lt!600622 () Unit!44949)

(declare-datatypes ((List!31804 0))(
  ( (Nil!31801) (Cons!31800 (h!33009 (_ BitVec 64)) (t!46492 List!31804)) )
))
(declare-fun acc!759 () List!31804)

(declare-fun lemmaListSubSeqRefl!0 (List!31804) Unit!44949)

(assert (=> b!1362903 (= lt!600622 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!915 (List!31804 List!31804) Bool)

(assert (=> b!1362903 (subseq!915 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92660 List!31804 List!31804 (_ BitVec 32)) Unit!44949)

(declare-fun $colon$colon!918 (List!31804 (_ BitVec 64)) List!31804)

(assert (=> b!1362903 (= lt!600620 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!918 acc!759 (select (arr!44763 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92660 (_ BitVec 32) List!31804) Bool)

(assert (=> b!1362903 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362904 () Bool)

(declare-fun res!906809 () Bool)

(assert (=> b!1362904 (=> (not res!906809) (not e!773010))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362904 (= res!906809 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45313 a!3742))))))

(declare-fun b!1362905 () Bool)

(declare-fun res!906816 () Bool)

(assert (=> b!1362905 (=> (not res!906816) (not e!773010))))

(declare-fun noDuplicate!2370 (List!31804) Bool)

(assert (=> b!1362905 (= res!906816 (noDuplicate!2370 acc!759))))

(declare-fun b!1362906 () Bool)

(declare-fun res!906817 () Bool)

(assert (=> b!1362906 (=> (not res!906817) (not e!773010))))

(declare-fun contains!9513 (List!31804 (_ BitVec 64)) Bool)

(assert (=> b!1362906 (= res!906817 (not (contains!9513 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362907 () Bool)

(declare-fun Unit!44951 () Unit!44949)

(assert (=> b!1362907 (= e!773009 Unit!44951)))

(declare-fun b!1362908 () Bool)

(declare-fun res!906814 () Bool)

(assert (=> b!1362908 (=> (not res!906814) (not e!773010))))

(assert (=> b!1362908 (= res!906814 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45313 a!3742)))))

(declare-fun b!1362909 () Bool)

(declare-fun res!906813 () Bool)

(assert (=> b!1362909 (=> (not res!906813) (not e!773010))))

(assert (=> b!1362909 (= res!906813 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31801))))

(declare-fun b!1362910 () Bool)

(declare-fun res!906811 () Bool)

(assert (=> b!1362910 (=> (not res!906811) (not e!773010))))

(assert (=> b!1362910 (= res!906811 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362911 () Bool)

(declare-fun res!906810 () Bool)

(assert (=> b!1362911 (=> (not res!906810) (not e!773010))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362911 (= res!906810 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362912 () Bool)

(assert (=> b!1362912 (= e!773010 false)))

(declare-fun lt!600621 () Unit!44949)

(assert (=> b!1362912 (= lt!600621 e!773009)))

(declare-fun c!127487 () Bool)

(assert (=> b!1362912 (= c!127487 (validKeyInArray!0 (select (arr!44763 a!3742) from!3120)))))

(declare-fun b!1362913 () Bool)

(declare-fun res!906812 () Bool)

(assert (=> b!1362913 (=> (not res!906812) (not e!773010))))

(assert (=> b!1362913 (= res!906812 (not (contains!9513 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114982 res!906815) b!1362905))

(assert (= (and b!1362905 res!906816) b!1362906))

(assert (= (and b!1362906 res!906817) b!1362913))

(assert (= (and b!1362913 res!906812) b!1362909))

(assert (= (and b!1362909 res!906813) b!1362910))

(assert (= (and b!1362910 res!906811) b!1362904))

(assert (= (and b!1362904 res!906809) b!1362911))

(assert (= (and b!1362911 res!906810) b!1362908))

(assert (= (and b!1362908 res!906814) b!1362912))

(assert (= (and b!1362912 c!127487) b!1362903))

(assert (= (and b!1362912 (not c!127487)) b!1362907))

(declare-fun m!1247807 () Bool)

(assert (=> b!1362909 m!1247807))

(declare-fun m!1247809 () Bool)

(assert (=> b!1362913 m!1247809))

(declare-fun m!1247811 () Bool)

(assert (=> start!114982 m!1247811))

(declare-fun m!1247813 () Bool)

(assert (=> b!1362912 m!1247813))

(assert (=> b!1362912 m!1247813))

(declare-fun m!1247815 () Bool)

(assert (=> b!1362912 m!1247815))

(declare-fun m!1247817 () Bool)

(assert (=> b!1362906 m!1247817))

(declare-fun m!1247819 () Bool)

(assert (=> b!1362911 m!1247819))

(declare-fun m!1247821 () Bool)

(assert (=> b!1362905 m!1247821))

(declare-fun m!1247823 () Bool)

(assert (=> b!1362903 m!1247823))

(assert (=> b!1362903 m!1247813))

(declare-fun m!1247825 () Bool)

(assert (=> b!1362903 m!1247825))

(declare-fun m!1247827 () Bool)

(assert (=> b!1362903 m!1247827))

(declare-fun m!1247829 () Bool)

(assert (=> b!1362903 m!1247829))

(assert (=> b!1362903 m!1247813))

(assert (=> b!1362903 m!1247825))

(declare-fun m!1247831 () Bool)

(assert (=> b!1362903 m!1247831))

(declare-fun m!1247833 () Bool)

(assert (=> b!1362910 m!1247833))

(check-sat (not b!1362913) (not b!1362912) (not b!1362911) (not start!114982) (not b!1362909) (not b!1362905) (not b!1362910) (not b!1362903) (not b!1362906))
