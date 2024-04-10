; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113962 () Bool)

(assert start!113962)

(declare-fun res!897401 () Bool)

(declare-fun e!768657 () Bool)

(assert (=> start!113962 (=> (not res!897401) (not e!768657))))

(declare-datatypes ((array!92144 0))(
  ( (array!92145 (arr!44520 (Array (_ BitVec 32) (_ BitVec 64))) (size!45070 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92144)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113962 (= res!897401 (and (bvslt (size!45070 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45070 a!3742))))))

(assert (=> start!113962 e!768657))

(assert (=> start!113962 true))

(declare-fun array_inv!33548 (array!92144) Bool)

(assert (=> start!113962 (array_inv!33548 a!3742)))

(declare-fun b!1351982 () Bool)

(declare-fun res!897402 () Bool)

(assert (=> b!1351982 (=> (not res!897402) (not e!768657))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351982 (= res!897402 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351983 () Bool)

(declare-fun res!897396 () Bool)

(assert (=> b!1351983 (=> (not res!897396) (not e!768657))))

(declare-datatypes ((List!31561 0))(
  ( (Nil!31558) (Cons!31557 (h!32766 (_ BitVec 64)) (t!46219 List!31561)) )
))
(declare-fun acc!759 () List!31561)

(declare-fun arrayNoDuplicates!0 (array!92144 (_ BitVec 32) List!31561) Bool)

(assert (=> b!1351983 (= res!897396 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351984 () Bool)

(declare-datatypes ((Unit!44301 0))(
  ( (Unit!44302) )
))
(declare-fun e!768658 () Unit!44301)

(declare-fun Unit!44303 () Unit!44301)

(assert (=> b!1351984 (= e!768658 Unit!44303)))

(declare-fun b!1351985 () Bool)

(declare-fun res!897399 () Bool)

(assert (=> b!1351985 (=> (not res!897399) (not e!768657))))

(assert (=> b!1351985 (= res!897399 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45070 a!3742)))))

(declare-fun b!1351986 () Bool)

(declare-fun res!897395 () Bool)

(assert (=> b!1351986 (=> (not res!897395) (not e!768657))))

(declare-fun contains!9270 (List!31561 (_ BitVec 64)) Bool)

(assert (=> b!1351986 (= res!897395 (not (contains!9270 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351987 () Bool)

(declare-fun e!768655 () Bool)

(assert (=> b!1351987 (= e!768655 false)))

(declare-fun lt!597393 () Bool)

(assert (=> b!1351987 (= lt!597393 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351988 () Bool)

(declare-fun res!897394 () Bool)

(assert (=> b!1351988 (=> (not res!897394) (not e!768657))))

(declare-fun noDuplicate!2127 (List!31561) Bool)

(assert (=> b!1351988 (= res!897394 (noDuplicate!2127 acc!759))))

(declare-fun b!1351989 () Bool)

(declare-fun res!897398 () Bool)

(assert (=> b!1351989 (=> (not res!897398) (not e!768657))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351989 (= res!897398 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45070 a!3742))))))

(declare-fun b!1351990 () Bool)

(assert (=> b!1351990 (= e!768657 e!768655)))

(declare-fun res!897397 () Bool)

(assert (=> b!1351990 (=> (not res!897397) (not e!768655))))

(assert (=> b!1351990 (= res!897397 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597392 () Unit!44301)

(assert (=> b!1351990 (= lt!597392 e!768658)))

(declare-fun c!126734 () Bool)

(assert (=> b!1351990 (= c!126734 (validKeyInArray!0 (select (arr!44520 a!3742) from!3120)))))

(declare-fun b!1351991 () Bool)

(declare-fun res!897400 () Bool)

(assert (=> b!1351991 (=> (not res!897400) (not e!768657))))

(assert (=> b!1351991 (= res!897400 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31558))))

(declare-fun b!1351992 () Bool)

(declare-fun res!897403 () Bool)

(assert (=> b!1351992 (=> (not res!897403) (not e!768657))))

(assert (=> b!1351992 (= res!897403 (not (contains!9270 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351993 () Bool)

(declare-fun lt!597391 () Unit!44301)

(assert (=> b!1351993 (= e!768658 lt!597391)))

(declare-fun lt!597394 () Unit!44301)

(declare-fun lemmaListSubSeqRefl!0 (List!31561) Unit!44301)

(assert (=> b!1351993 (= lt!597394 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!690 (List!31561 List!31561) Bool)

(assert (=> b!1351993 (subseq!690 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92144 List!31561 List!31561 (_ BitVec 32)) Unit!44301)

(declare-fun $colon$colon!705 (List!31561 (_ BitVec 64)) List!31561)

(assert (=> b!1351993 (= lt!597391 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!705 acc!759 (select (arr!44520 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351993 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113962 res!897401) b!1351988))

(assert (= (and b!1351988 res!897394) b!1351992))

(assert (= (and b!1351992 res!897403) b!1351986))

(assert (= (and b!1351986 res!897395) b!1351991))

(assert (= (and b!1351991 res!897400) b!1351983))

(assert (= (and b!1351983 res!897396) b!1351989))

(assert (= (and b!1351989 res!897398) b!1351982))

(assert (= (and b!1351982 res!897402) b!1351985))

(assert (= (and b!1351985 res!897399) b!1351990))

(assert (= (and b!1351990 c!126734) b!1351993))

(assert (= (and b!1351990 (not c!126734)) b!1351984))

(assert (= (and b!1351990 res!897397) b!1351987))

(declare-fun m!1238897 () Bool)

(assert (=> b!1351993 m!1238897))

(declare-fun m!1238899 () Bool)

(assert (=> b!1351993 m!1238899))

(declare-fun m!1238901 () Bool)

(assert (=> b!1351993 m!1238901))

(declare-fun m!1238903 () Bool)

(assert (=> b!1351993 m!1238903))

(declare-fun m!1238905 () Bool)

(assert (=> b!1351993 m!1238905))

(assert (=> b!1351993 m!1238899))

(assert (=> b!1351993 m!1238901))

(declare-fun m!1238907 () Bool)

(assert (=> b!1351993 m!1238907))

(assert (=> b!1351990 m!1238899))

(assert (=> b!1351990 m!1238899))

(declare-fun m!1238909 () Bool)

(assert (=> b!1351990 m!1238909))

(declare-fun m!1238911 () Bool)

(assert (=> start!113962 m!1238911))

(declare-fun m!1238913 () Bool)

(assert (=> b!1351991 m!1238913))

(declare-fun m!1238915 () Bool)

(assert (=> b!1351982 m!1238915))

(declare-fun m!1238917 () Bool)

(assert (=> b!1351992 m!1238917))

(declare-fun m!1238919 () Bool)

(assert (=> b!1351986 m!1238919))

(declare-fun m!1238921 () Bool)

(assert (=> b!1351988 m!1238921))

(declare-fun m!1238923 () Bool)

(assert (=> b!1351983 m!1238923))

(assert (=> b!1351987 m!1238905))

(check-sat (not b!1351991) (not b!1351987) (not b!1351993) (not b!1351988) (not start!113962) (not b!1351990) (not b!1351986) (not b!1351983) (not b!1351992) (not b!1351982))
(check-sat)
