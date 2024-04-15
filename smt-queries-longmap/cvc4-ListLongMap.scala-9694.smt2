; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114502 () Bool)

(assert start!114502)

(declare-fun res!903510 () Bool)

(declare-fun e!771134 () Bool)

(assert (=> start!114502 (=> (not res!903510) (not e!771134))))

(declare-datatypes ((array!92447 0))(
  ( (array!92448 (arr!44666 (Array (_ BitVec 32) (_ BitVec 64))) (size!45218 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92447)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114502 (= res!903510 (and (bvslt (size!45218 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45218 a!3742))))))

(assert (=> start!114502 e!771134))

(assert (=> start!114502 true))

(declare-fun array_inv!33899 (array!92447) Bool)

(assert (=> start!114502 (array_inv!33899 a!3742)))

(declare-fun b!1358912 () Bool)

(declare-fun res!903511 () Bool)

(assert (=> b!1358912 (=> (not res!903511) (not e!771134))))

(assert (=> b!1358912 (= res!903511 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45218 a!3742)))))

(declare-fun b!1358913 () Bool)

(declare-datatypes ((Unit!44574 0))(
  ( (Unit!44575) )
))
(declare-fun e!771135 () Unit!44574)

(declare-fun Unit!44576 () Unit!44574)

(assert (=> b!1358913 (= e!771135 Unit!44576)))

(declare-fun b!1358914 () Bool)

(declare-fun res!903512 () Bool)

(assert (=> b!1358914 (=> (not res!903512) (not e!771134))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358914 (= res!903512 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358915 () Bool)

(declare-fun res!903509 () Bool)

(assert (=> b!1358915 (=> (not res!903509) (not e!771134))))

(declare-datatypes ((List!31785 0))(
  ( (Nil!31782) (Cons!31781 (h!32990 (_ BitVec 64)) (t!46447 List!31785)) )
))
(declare-fun acc!759 () List!31785)

(declare-fun noDuplicate!2320 (List!31785) Bool)

(assert (=> b!1358915 (= res!903509 (noDuplicate!2320 acc!759))))

(declare-fun b!1358916 () Bool)

(declare-fun res!903514 () Bool)

(assert (=> b!1358916 (=> (not res!903514) (not e!771134))))

(declare-fun contains!9405 (List!31785 (_ BitVec 64)) Bool)

(assert (=> b!1358916 (= res!903514 (not (contains!9405 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358917 () Bool)

(declare-fun lt!599302 () Unit!44574)

(assert (=> b!1358917 (= e!771135 lt!599302)))

(declare-fun lt!599300 () Unit!44574)

(declare-fun lemmaListSubSeqRefl!0 (List!31785) Unit!44574)

(assert (=> b!1358917 (= lt!599300 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!843 (List!31785 List!31785) Bool)

(assert (=> b!1358917 (subseq!843 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92447 List!31785 List!31785 (_ BitVec 32)) Unit!44574)

(declare-fun $colon$colon!848 (List!31785 (_ BitVec 64)) List!31785)

(assert (=> b!1358917 (= lt!599302 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!848 acc!759 (select (arr!44666 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92447 (_ BitVec 32) List!31785) Bool)

(assert (=> b!1358917 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358918 () Bool)

(declare-fun res!903507 () Bool)

(assert (=> b!1358918 (=> (not res!903507) (not e!771134))))

(assert (=> b!1358918 (= res!903507 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31782))))

(declare-fun b!1358919 () Bool)

(declare-fun res!903515 () Bool)

(assert (=> b!1358919 (=> (not res!903515) (not e!771134))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358919 (= res!903515 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45218 a!3742))))))

(declare-fun b!1358920 () Bool)

(declare-fun res!903513 () Bool)

(assert (=> b!1358920 (=> (not res!903513) (not e!771134))))

(assert (=> b!1358920 (= res!903513 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358921 () Bool)

(assert (=> b!1358921 (= e!771134 false)))

(declare-fun lt!599301 () Unit!44574)

(assert (=> b!1358921 (= lt!599301 e!771135)))

(declare-fun c!127145 () Bool)

(assert (=> b!1358921 (= c!127145 (validKeyInArray!0 (select (arr!44666 a!3742) from!3120)))))

(declare-fun b!1358922 () Bool)

(declare-fun res!903508 () Bool)

(assert (=> b!1358922 (=> (not res!903508) (not e!771134))))

(assert (=> b!1358922 (= res!903508 (not (contains!9405 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114502 res!903510) b!1358915))

(assert (= (and b!1358915 res!903509) b!1358922))

(assert (= (and b!1358922 res!903508) b!1358916))

(assert (= (and b!1358916 res!903514) b!1358918))

(assert (= (and b!1358918 res!903507) b!1358920))

(assert (= (and b!1358920 res!903513) b!1358919))

(assert (= (and b!1358919 res!903515) b!1358914))

(assert (= (and b!1358914 res!903512) b!1358912))

(assert (= (and b!1358912 res!903511) b!1358921))

(assert (= (and b!1358921 c!127145) b!1358917))

(assert (= (and b!1358921 (not c!127145)) b!1358913))

(declare-fun m!1243967 () Bool)

(assert (=> b!1358921 m!1243967))

(assert (=> b!1358921 m!1243967))

(declare-fun m!1243969 () Bool)

(assert (=> b!1358921 m!1243969))

(declare-fun m!1243971 () Bool)

(assert (=> b!1358920 m!1243971))

(declare-fun m!1243973 () Bool)

(assert (=> b!1358917 m!1243973))

(assert (=> b!1358917 m!1243967))

(declare-fun m!1243975 () Bool)

(assert (=> b!1358917 m!1243975))

(declare-fun m!1243977 () Bool)

(assert (=> b!1358917 m!1243977))

(declare-fun m!1243979 () Bool)

(assert (=> b!1358917 m!1243979))

(assert (=> b!1358917 m!1243967))

(assert (=> b!1358917 m!1243975))

(declare-fun m!1243981 () Bool)

(assert (=> b!1358917 m!1243981))

(declare-fun m!1243983 () Bool)

(assert (=> b!1358918 m!1243983))

(declare-fun m!1243985 () Bool)

(assert (=> start!114502 m!1243985))

(declare-fun m!1243987 () Bool)

(assert (=> b!1358922 m!1243987))

(declare-fun m!1243989 () Bool)

(assert (=> b!1358914 m!1243989))

(declare-fun m!1243991 () Bool)

(assert (=> b!1358916 m!1243991))

(declare-fun m!1243993 () Bool)

(assert (=> b!1358915 m!1243993))

(push 1)

(assert (not b!1358920))

(assert (not b!1358916))

(assert (not b!1358915))

(assert (not b!1358914))

(assert (not start!114502))

(assert (not b!1358918))

(assert (not b!1358917))

(assert (not b!1358921))

(assert (not b!1358922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

