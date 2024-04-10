; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114016 () Bool)

(assert start!114016)

(declare-fun b!1352977 () Bool)

(declare-fun res!898234 () Bool)

(declare-fun e!768979 () Bool)

(assert (=> b!1352977 (=> (not res!898234) (not e!768979))))

(declare-datatypes ((List!31588 0))(
  ( (Nil!31585) (Cons!31584 (h!32793 (_ BitVec 64)) (t!46246 List!31588)) )
))
(declare-fun acc!759 () List!31588)

(declare-datatypes ((array!92198 0))(
  ( (array!92199 (arr!44547 (Array (_ BitVec 32) (_ BitVec 64))) (size!45097 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92198)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92198 (_ BitVec 32) List!31588) Bool)

(assert (=> b!1352977 (= res!898234 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352978 () Bool)

(declare-fun e!768982 () Bool)

(assert (=> b!1352978 (= e!768979 e!768982)))

(declare-fun res!898232 () Bool)

(assert (=> b!1352978 (=> (not res!898232) (not e!768982))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352978 (= res!898232 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44382 0))(
  ( (Unit!44383) )
))
(declare-fun lt!597718 () Unit!44382)

(declare-fun e!768981 () Unit!44382)

(assert (=> b!1352978 (= lt!597718 e!768981)))

(declare-fun c!126815 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352978 (= c!126815 (validKeyInArray!0 (select (arr!44547 a!3742) from!3120)))))

(declare-fun b!1352979 () Bool)

(declare-fun res!898233 () Bool)

(assert (=> b!1352979 (=> (not res!898233) (not e!768982))))

(assert (=> b!1352979 (= res!898233 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352980 () Bool)

(declare-fun res!898236 () Bool)

(assert (=> b!1352980 (=> (not res!898236) (not e!768979))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352980 (= res!898236 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352981 () Bool)

(declare-fun res!898229 () Bool)

(assert (=> b!1352981 (=> (not res!898229) (not e!768979))))

(declare-fun noDuplicate!2154 (List!31588) Bool)

(assert (=> b!1352981 (= res!898229 (noDuplicate!2154 acc!759))))

(declare-fun b!1352982 () Bool)

(declare-fun lt!597716 () Unit!44382)

(assert (=> b!1352982 (= e!768981 lt!597716)))

(declare-fun lt!597715 () Unit!44382)

(declare-fun lemmaListSubSeqRefl!0 (List!31588) Unit!44382)

(assert (=> b!1352982 (= lt!597715 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!717 (List!31588 List!31588) Bool)

(assert (=> b!1352982 (subseq!717 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92198 List!31588 List!31588 (_ BitVec 32)) Unit!44382)

(declare-fun $colon$colon!732 (List!31588 (_ BitVec 64)) List!31588)

(assert (=> b!1352982 (= lt!597716 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!732 acc!759 (select (arr!44547 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352982 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352983 () Bool)

(declare-fun res!898231 () Bool)

(assert (=> b!1352983 (=> (not res!898231) (not e!768979))))

(declare-fun contains!9297 (List!31588 (_ BitVec 64)) Bool)

(assert (=> b!1352983 (= res!898231 (not (contains!9297 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898227 () Bool)

(assert (=> start!114016 (=> (not res!898227) (not e!768979))))

(assert (=> start!114016 (= res!898227 (and (bvslt (size!45097 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45097 a!3742))))))

(assert (=> start!114016 e!768979))

(assert (=> start!114016 true))

(declare-fun array_inv!33575 (array!92198) Bool)

(assert (=> start!114016 (array_inv!33575 a!3742)))

(declare-fun b!1352984 () Bool)

(declare-fun Unit!44384 () Unit!44382)

(assert (=> b!1352984 (= e!768981 Unit!44384)))

(declare-fun b!1352985 () Bool)

(declare-fun res!898235 () Bool)

(assert (=> b!1352985 (=> (not res!898235) (not e!768979))))

(assert (=> b!1352985 (= res!898235 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45097 a!3742))))))

(declare-fun b!1352986 () Bool)

(declare-fun res!898228 () Bool)

(assert (=> b!1352986 (=> (not res!898228) (not e!768979))))

(assert (=> b!1352986 (= res!898228 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31585))))

(declare-fun b!1352987 () Bool)

(assert (=> b!1352987 (= e!768982 (not true))))

(assert (=> b!1352987 (arrayNoDuplicates!0 (array!92199 (store (arr!44547 a!3742) i!1404 l!3587) (size!45097 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597717 () Unit!44382)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92198 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31588) Unit!44382)

(assert (=> b!1352987 (= lt!597717 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352988 () Bool)

(declare-fun res!898230 () Bool)

(assert (=> b!1352988 (=> (not res!898230) (not e!768979))))

(assert (=> b!1352988 (= res!898230 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45097 a!3742)))))

(declare-fun b!1352989 () Bool)

(declare-fun res!898237 () Bool)

(assert (=> b!1352989 (=> (not res!898237) (not e!768979))))

(assert (=> b!1352989 (= res!898237 (not (contains!9297 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114016 res!898227) b!1352981))

(assert (= (and b!1352981 res!898229) b!1352983))

(assert (= (and b!1352983 res!898231) b!1352989))

(assert (= (and b!1352989 res!898237) b!1352986))

(assert (= (and b!1352986 res!898228) b!1352977))

(assert (= (and b!1352977 res!898234) b!1352985))

(assert (= (and b!1352985 res!898235) b!1352980))

(assert (= (and b!1352980 res!898236) b!1352988))

(assert (= (and b!1352988 res!898230) b!1352978))

(assert (= (and b!1352978 c!126815) b!1352982))

(assert (= (and b!1352978 (not c!126815)) b!1352984))

(assert (= (and b!1352978 res!898232) b!1352979))

(assert (= (and b!1352979 res!898233) b!1352987))

(declare-fun m!1239695 () Bool)

(assert (=> b!1352987 m!1239695))

(declare-fun m!1239697 () Bool)

(assert (=> b!1352987 m!1239697))

(declare-fun m!1239699 () Bool)

(assert (=> b!1352987 m!1239699))

(declare-fun m!1239701 () Bool)

(assert (=> start!114016 m!1239701))

(declare-fun m!1239703 () Bool)

(assert (=> b!1352977 m!1239703))

(declare-fun m!1239705 () Bool)

(assert (=> b!1352989 m!1239705))

(declare-fun m!1239707 () Bool)

(assert (=> b!1352980 m!1239707))

(declare-fun m!1239709 () Bool)

(assert (=> b!1352979 m!1239709))

(declare-fun m!1239711 () Bool)

(assert (=> b!1352981 m!1239711))

(declare-fun m!1239713 () Bool)

(assert (=> b!1352978 m!1239713))

(assert (=> b!1352978 m!1239713))

(declare-fun m!1239715 () Bool)

(assert (=> b!1352978 m!1239715))

(declare-fun m!1239717 () Bool)

(assert (=> b!1352986 m!1239717))

(declare-fun m!1239719 () Bool)

(assert (=> b!1352983 m!1239719))

(declare-fun m!1239721 () Bool)

(assert (=> b!1352982 m!1239721))

(assert (=> b!1352982 m!1239713))

(declare-fun m!1239723 () Bool)

(assert (=> b!1352982 m!1239723))

(declare-fun m!1239725 () Bool)

(assert (=> b!1352982 m!1239725))

(assert (=> b!1352982 m!1239709))

(assert (=> b!1352982 m!1239713))

(assert (=> b!1352982 m!1239723))

(declare-fun m!1239727 () Bool)

(assert (=> b!1352982 m!1239727))

(check-sat (not b!1352980) (not b!1352981) (not b!1352986) (not b!1352977) (not b!1352987) (not b!1352989) (not b!1352979) (not b!1352982) (not b!1352983) (not b!1352978) (not start!114016))
(check-sat)
