; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5234 () Bool)

(assert start!5234)

(declare-fun res!22918 () Bool)

(declare-fun e!24107 () Bool)

(assert (=> start!5234 (=> (not res!22918) (not e!24107))))

(declare-datatypes ((B!788 0))(
  ( (B!789 (val!894 Int)) )
))
(declare-fun b!99 () B!788)

(declare-datatypes ((tuple2!1430 0))(
  ( (tuple2!1431 (_1!726 (_ BitVec 64)) (_2!726 B!788)) )
))
(declare-datatypes ((List!990 0))(
  ( (Nil!987) (Cons!986 (h!1554 tuple2!1430) (t!3823 List!990)) )
))
(declare-datatypes ((ListLongMap!1001 0))(
  ( (ListLongMap!1002 (toList!516 List!990)) )
))
(declare-fun lm!264 () ListLongMap!1001)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!469 (List!990 tuple2!1430) Bool)

(assert (=> start!5234 (= res!22918 (contains!469 (toList!516 lm!264) (tuple2!1431 a!526 b!99)))))

(assert (=> start!5234 e!24107))

(declare-fun e!24108 () Bool)

(declare-fun inv!1699 (ListLongMap!1001) Bool)

(assert (=> start!5234 (and (inv!1699 lm!264) e!24108)))

(assert (=> start!5234 true))

(declare-fun tp_is_empty!1711 () Bool)

(assert (=> start!5234 tp_is_empty!1711))

(declare-fun b!37940 () Bool)

(declare-fun e!24106 () Bool)

(assert (=> b!37940 (= e!24107 (not e!24106))))

(declare-fun res!22919 () Bool)

(assert (=> b!37940 (=> res!22919 e!24106)))

(declare-fun isStrictlySorted!187 (List!990) Bool)

(assert (=> b!37940 (= res!22919 (not (isStrictlySorted!187 (toList!516 lm!264))))))

(declare-fun containsKey!63 (List!990 (_ BitVec 64)) Bool)

(assert (=> b!37940 (containsKey!63 (toList!516 lm!264) a!526)))

(declare-datatypes ((Unit!887 0))(
  ( (Unit!888) )
))
(declare-fun lt!13924 () Unit!887)

(declare-fun lemmaContainsTupleThenContainsKey!7 (List!990 (_ BitVec 64) B!788) Unit!887)

(assert (=> b!37940 (= lt!13924 (lemmaContainsTupleThenContainsKey!7 (toList!516 lm!264) a!526 b!99))))

(declare-fun b!37941 () Bool)

(assert (=> b!37941 (= e!24106 true)))

(declare-datatypes ((Option!99 0))(
  ( (Some!98 (v!1973 B!788)) (None!97) )
))
(declare-fun getValueByKey!93 (List!990 (_ BitVec 64)) Option!99)

(assert (=> b!37941 (= (getValueByKey!93 (toList!516 lm!264) a!526) (Some!98 b!99))))

(declare-fun lt!13923 () Unit!887)

(declare-fun lemmaContainsTupThenGetReturnValue!20 (List!990 (_ BitVec 64) B!788) Unit!887)

(assert (=> b!37941 (= lt!13923 (lemmaContainsTupThenGetReturnValue!20 (toList!516 lm!264) a!526 b!99))))

(declare-fun b!37942 () Bool)

(declare-fun tp!5642 () Bool)

(assert (=> b!37942 (= e!24108 tp!5642)))

(assert (= (and start!5234 res!22918) b!37940))

(assert (= (and b!37940 (not res!22919)) b!37941))

(assert (= start!5234 b!37942))

(declare-fun m!30541 () Bool)

(assert (=> start!5234 m!30541))

(declare-fun m!30543 () Bool)

(assert (=> start!5234 m!30543))

(declare-fun m!30545 () Bool)

(assert (=> b!37940 m!30545))

(declare-fun m!30547 () Bool)

(assert (=> b!37940 m!30547))

(declare-fun m!30549 () Bool)

(assert (=> b!37940 m!30549))

(declare-fun m!30551 () Bool)

(assert (=> b!37941 m!30551))

(declare-fun m!30553 () Bool)

(assert (=> b!37941 m!30553))

(check-sat (not b!37942) (not start!5234) (not b!37940) (not b!37941) tp_is_empty!1711)
(check-sat)
