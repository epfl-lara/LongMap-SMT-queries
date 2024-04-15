; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115720 () Bool)

(assert start!115720)

(declare-fun res!912060 () Bool)

(declare-fun e!775336 () Bool)

(assert (=> start!115720 (=> (not res!912060) (not e!775336))))

(declare-datatypes ((array!92871 0))(
  ( (array!92872 (arr!44860 (Array (_ BitVec 32) (_ BitVec 64))) (size!45412 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92871)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115720 (= res!912060 (and (bvslt (size!45412 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45412 a!3861))))))

(assert (=> start!115720 e!775336))

(declare-fun array_inv!34093 (array!92871) Bool)

(assert (=> start!115720 (array_inv!34093 a!3861)))

(assert (=> start!115720 true))

(declare-fun b!1368506 () Bool)

(declare-fun res!912059 () Bool)

(assert (=> b!1368506 (=> (not res!912059) (not e!775336))))

(declare-datatypes ((List!32006 0))(
  ( (Nil!32003) (Cons!32002 (h!33211 (_ BitVec 64)) (t!46692 List!32006)) )
))
(declare-fun acc!866 () List!32006)

(declare-fun noDuplicate!2514 (List!32006) Bool)

(assert (=> b!1368506 (= res!912059 (noDuplicate!2514 acc!866))))

(declare-fun b!1368507 () Bool)

(declare-fun e!775338 () Bool)

(assert (=> b!1368507 (= e!775336 e!775338)))

(declare-fun res!912057 () Bool)

(assert (=> b!1368507 (=> (not res!912057) (not e!775338))))

(declare-fun arrayNoDuplicates!0 (array!92871 (_ BitVec 32) List!32006) Bool)

(assert (=> b!1368507 (= res!912057 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45048 0))(
  ( (Unit!45049) )
))
(declare-fun lt!601904 () Unit!45048)

(declare-fun newAcc!98 () List!32006)

(declare-fun noDuplicateSubseq!224 (List!32006 List!32006) Unit!45048)

(assert (=> b!1368507 (= lt!601904 (noDuplicateSubseq!224 newAcc!98 acc!866))))

(declare-fun b!1368508 () Bool)

(declare-fun res!912058 () Bool)

(assert (=> b!1368508 (=> (not res!912058) (not e!775338))))

(assert (=> b!1368508 (= res!912058 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368509 () Bool)

(assert (=> b!1368509 (= e!775338 (not true))))

(assert (=> b!1368509 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!601905 () Unit!45048)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92871 List!32006 List!32006 (_ BitVec 32)) Unit!45048)

(assert (=> b!1368509 (= lt!601905 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368510 () Bool)

(declare-fun res!912065 () Bool)

(assert (=> b!1368510 (=> (not res!912065) (not e!775336))))

(declare-fun contains!9599 (List!32006 (_ BitVec 64)) Bool)

(assert (=> b!1368510 (= res!912065 (not (contains!9599 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368511 () Bool)

(declare-fun res!912061 () Bool)

(assert (=> b!1368511 (=> (not res!912061) (not e!775338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368511 (= res!912061 (not (validKeyInArray!0 (select (arr!44860 a!3861) from!3239))))))

(declare-fun b!1368512 () Bool)

(declare-fun res!912067 () Bool)

(assert (=> b!1368512 (=> (not res!912067) (not e!775336))))

(assert (=> b!1368512 (= res!912067 (not (contains!9599 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368513 () Bool)

(declare-fun res!912066 () Bool)

(assert (=> b!1368513 (=> (not res!912066) (not e!775336))))

(assert (=> b!1368513 (= res!912066 (not (contains!9599 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368514 () Bool)

(declare-fun res!912068 () Bool)

(assert (=> b!1368514 (=> (not res!912068) (not e!775338))))

(assert (=> b!1368514 (= res!912068 (bvslt from!3239 (size!45412 a!3861)))))

(declare-fun b!1368515 () Bool)

(declare-fun res!912063 () Bool)

(assert (=> b!1368515 (=> (not res!912063) (not e!775336))))

(declare-fun subseq!1037 (List!32006 List!32006) Bool)

(assert (=> b!1368515 (= res!912063 (subseq!1037 newAcc!98 acc!866))))

(declare-fun b!1368516 () Bool)

(declare-fun res!912064 () Bool)

(assert (=> b!1368516 (=> (not res!912064) (not e!775338))))

(assert (=> b!1368516 (= res!912064 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368517 () Bool)

(declare-fun res!912062 () Bool)

(assert (=> b!1368517 (=> (not res!912062) (not e!775336))))

(assert (=> b!1368517 (= res!912062 (not (contains!9599 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115720 res!912060) b!1368506))

(assert (= (and b!1368506 res!912059) b!1368517))

(assert (= (and b!1368517 res!912062) b!1368513))

(assert (= (and b!1368513 res!912066) b!1368510))

(assert (= (and b!1368510 res!912065) b!1368512))

(assert (= (and b!1368512 res!912067) b!1368515))

(assert (= (and b!1368515 res!912063) b!1368507))

(assert (= (and b!1368507 res!912057) b!1368514))

(assert (= (and b!1368514 res!912068) b!1368511))

(assert (= (and b!1368511 res!912061) b!1368508))

(assert (= (and b!1368508 res!912058) b!1368516))

(assert (= (and b!1368516 res!912064) b!1368509))

(declare-fun m!1251981 () Bool)

(assert (=> b!1368512 m!1251981))

(declare-fun m!1251983 () Bool)

(assert (=> b!1368513 m!1251983))

(declare-fun m!1251985 () Bool)

(assert (=> b!1368515 m!1251985))

(declare-fun m!1251987 () Bool)

(assert (=> b!1368506 m!1251987))

(declare-fun m!1251989 () Bool)

(assert (=> b!1368509 m!1251989))

(declare-fun m!1251991 () Bool)

(assert (=> b!1368509 m!1251991))

(declare-fun m!1251993 () Bool)

(assert (=> b!1368510 m!1251993))

(declare-fun m!1251995 () Bool)

(assert (=> b!1368517 m!1251995))

(declare-fun m!1251997 () Bool)

(assert (=> b!1368507 m!1251997))

(declare-fun m!1251999 () Bool)

(assert (=> b!1368507 m!1251999))

(declare-fun m!1252001 () Bool)

(assert (=> start!115720 m!1252001))

(declare-fun m!1252003 () Bool)

(assert (=> b!1368516 m!1252003))

(declare-fun m!1252005 () Bool)

(assert (=> b!1368511 m!1252005))

(assert (=> b!1368511 m!1252005))

(declare-fun m!1252007 () Bool)

(assert (=> b!1368511 m!1252007))

(check-sat (not b!1368517) (not b!1368515) (not b!1368507) (not start!115720) (not b!1368512) (not b!1368516) (not b!1368510) (not b!1368513) (not b!1368511) (not b!1368506) (not b!1368509))
(check-sat)
