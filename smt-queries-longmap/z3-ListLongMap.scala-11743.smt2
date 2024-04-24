; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138152 () Bool)

(assert start!138152)

(declare-fun b!1585089 () Bool)

(declare-datatypes ((Unit!52171 0))(
  ( (Unit!52172) )
))
(declare-fun e!884827 () Unit!52171)

(declare-fun lt!678008 () Unit!52171)

(assert (=> b!1585089 (= e!884827 lt!678008)))

(declare-datatypes ((B!2786 0))(
  ( (B!2787 (val!19755 Int)) )
))
(declare-datatypes ((tuple2!25738 0))(
  ( (tuple2!25739 (_1!12880 (_ BitVec 64)) (_2!12880 B!2786)) )
))
(declare-datatypes ((List!36907 0))(
  ( (Nil!36904) (Cons!36903 (h!38464 tuple2!25738) (t!51813 List!36907)) )
))
(declare-datatypes ((ListLongMap!22857 0))(
  ( (ListLongMap!22858 (toList!11444 List!36907)) )
))
(declare-fun thiss!185 () ListLongMap!22857)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!547 (List!36907 (_ BitVec 64)) Unit!52171)

(assert (=> b!1585089 (= lt!678008 (lemmaContainsKeyImpliesGetValueByKeyDefined!547 (toList!11444 thiss!185) key!86))))

(declare-datatypes ((Option!930 0))(
  ( (Some!929 (v!22454 B!2786)) (None!928) )
))
(declare-fun isDefined!596 (Option!930) Bool)

(declare-fun getValueByKey!822 (List!36907 (_ BitVec 64)) Option!930)

(assert (=> b!1585089 (isDefined!596 (getValueByKey!822 (toList!11444 thiss!185) key!86))))

(declare-fun res!1082081 () Bool)

(declare-fun e!884826 () Bool)

(assert (=> start!138152 (=> (not res!1082081) (not e!884826))))

(declare-fun lt!678009 () Bool)

(assert (=> start!138152 (= res!1082081 lt!678009)))

(declare-fun lt!678007 () Unit!52171)

(assert (=> start!138152 (= lt!678007 e!884827)))

(declare-fun c!147461 () Bool)

(assert (=> start!138152 (= c!147461 lt!678009)))

(declare-fun containsKey!965 (List!36907 (_ BitVec 64)) Bool)

(assert (=> start!138152 (= lt!678009 (containsKey!965 (toList!11444 thiss!185) key!86))))

(assert (=> start!138152 e!884826))

(declare-fun e!884828 () Bool)

(declare-fun inv!59145 (ListLongMap!22857) Bool)

(assert (=> start!138152 (and (inv!59145 thiss!185) e!884828)))

(assert (=> start!138152 true))

(declare-fun b!1585091 () Bool)

(assert (=> b!1585091 (= e!884826 (not (isDefined!596 (getValueByKey!822 (toList!11444 thiss!185) key!86))))))

(declare-fun b!1585090 () Bool)

(declare-fun Unit!52173 () Unit!52171)

(assert (=> b!1585090 (= e!884827 Unit!52173)))

(declare-fun b!1585092 () Bool)

(declare-fun tp!114795 () Bool)

(assert (=> b!1585092 (= e!884828 tp!114795)))

(assert (= (and start!138152 c!147461) b!1585089))

(assert (= (and start!138152 (not c!147461)) b!1585090))

(assert (= (and start!138152 res!1082081) b!1585091))

(assert (= start!138152 b!1585092))

(declare-fun m!1455261 () Bool)

(assert (=> b!1585089 m!1455261))

(declare-fun m!1455263 () Bool)

(assert (=> b!1585089 m!1455263))

(assert (=> b!1585089 m!1455263))

(declare-fun m!1455265 () Bool)

(assert (=> b!1585089 m!1455265))

(declare-fun m!1455267 () Bool)

(assert (=> start!138152 m!1455267))

(declare-fun m!1455269 () Bool)

(assert (=> start!138152 m!1455269))

(assert (=> b!1585091 m!1455263))

(assert (=> b!1585091 m!1455263))

(assert (=> b!1585091 m!1455265))

(check-sat (not b!1585089) (not start!138152) (not b!1585091) (not b!1585092))
(check-sat)
