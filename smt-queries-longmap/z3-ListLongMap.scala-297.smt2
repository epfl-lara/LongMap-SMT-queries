; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5166 () Bool)

(assert start!5166)

(declare-fun res!22818 () Bool)

(declare-fun e!23977 () Bool)

(assert (=> start!5166 (=> (not res!22818) (not e!23977))))

(declare-datatypes ((B!772 0))(
  ( (B!773 (val!886 Int)) )
))
(declare-fun b!99 () B!772)

(declare-datatypes ((tuple2!1432 0))(
  ( (tuple2!1433 (_1!727 (_ BitVec 64)) (_2!727 B!772)) )
))
(declare-datatypes ((List!996 0))(
  ( (Nil!993) (Cons!992 (h!1560 tuple2!1432) (t!3829 List!996)) )
))
(declare-datatypes ((ListLongMap!1009 0))(
  ( (ListLongMap!1010 (toList!520 List!996)) )
))
(declare-fun lm!264 () ListLongMap!1009)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!471 (List!996 tuple2!1432) Bool)

(assert (=> start!5166 (= res!22818 (contains!471 (toList!520 lm!264) (tuple2!1433 a!526 b!99)))))

(assert (=> start!5166 e!23977))

(declare-fun e!23976 () Bool)

(declare-fun inv!1676 (ListLongMap!1009) Bool)

(assert (=> start!5166 (and (inv!1676 lm!264) e!23976)))

(assert (=> start!5166 true))

(declare-fun tp_is_empty!1695 () Bool)

(assert (=> start!5166 tp_is_empty!1695))

(declare-fun b!37818 () Bool)

(assert (=> b!37818 (= e!23977 (not true))))

(declare-fun containsKey!58 (List!996 (_ BitVec 64)) Bool)

(assert (=> b!37818 (containsKey!58 (toList!520 lm!264) a!526)))

(declare-datatypes ((Unit!871 0))(
  ( (Unit!872) )
))
(declare-fun lt!13922 () Unit!871)

(declare-fun lemmaContainsTupleThenContainsKey!2 (List!996 (_ BitVec 64) B!772) Unit!871)

(assert (=> b!37818 (= lt!13922 (lemmaContainsTupleThenContainsKey!2 (toList!520 lm!264) a!526 b!99))))

(declare-fun b!37819 () Bool)

(declare-fun tp!5600 () Bool)

(assert (=> b!37819 (= e!23976 tp!5600)))

(assert (= (and start!5166 res!22818) b!37818))

(assert (= start!5166 b!37819))

(declare-fun m!30543 () Bool)

(assert (=> start!5166 m!30543))

(declare-fun m!30545 () Bool)

(assert (=> start!5166 m!30545))

(declare-fun m!30547 () Bool)

(assert (=> b!37818 m!30547))

(declare-fun m!30549 () Bool)

(assert (=> b!37818 m!30549))

(check-sat (not start!5166) (not b!37818) (not b!37819) tp_is_empty!1695)
(check-sat)
