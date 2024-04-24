; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4706 () Bool)

(assert start!4706)

(declare-fun b_free!1297 () Bool)

(declare-fun b_next!1297 () Bool)

(assert (=> start!4706 (= b_free!1297 (not b_next!1297))))

(declare-fun tp!5354 () Bool)

(declare-fun b_and!2133 () Bool)

(assert (=> start!4706 (= tp!5354 b_and!2133)))

(declare-fun res!22028 () Bool)

(declare-fun e!23004 () Bool)

(assert (=> start!4706 (=> (not res!22028) (not e!23004))))

(declare-datatypes ((B!704 0))(
  ( (B!705 (val!852 Int)) )
))
(declare-datatypes ((tuple2!1346 0))(
  ( (tuple2!1347 (_1!684 (_ BitVec 64)) (_2!684 B!704)) )
))
(declare-datatypes ((List!942 0))(
  ( (Nil!939) (Cons!938 (h!1506 tuple2!1346) (t!3661 List!942)) )
))
(declare-datatypes ((ListLongMap!917 0))(
  ( (ListLongMap!918 (toList!474 List!942)) )
))
(declare-fun lm!252 () ListLongMap!917)

(declare-fun p!304 () Int)

(declare-fun forall!152 (List!942 Int) Bool)

(assert (=> start!4706 (= res!22028 (forall!152 (toList!474 lm!252) p!304))))

(assert (=> start!4706 e!23004))

(declare-fun e!23003 () Bool)

(declare-fun inv!1582 (ListLongMap!917) Bool)

(assert (=> start!4706 (and (inv!1582 lm!252) e!23003)))

(assert (=> start!4706 tp!5354))

(assert (=> start!4706 true))

(declare-fun b!36408 () Bool)

(assert (=> b!36408 (= e!23004 false)))

(declare-fun lt!13450 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!427 (ListLongMap!917 (_ BitVec 64)) Bool)

(assert (=> b!36408 (= lt!13450 (contains!427 lm!252 k0!388))))

(declare-fun b!36409 () Bool)

(declare-fun tp!5353 () Bool)

(assert (=> b!36409 (= e!23003 tp!5353)))

(assert (= (and start!4706 res!22028) b!36408))

(assert (= start!4706 b!36409))

(declare-fun m!29227 () Bool)

(assert (=> start!4706 m!29227))

(declare-fun m!29229 () Bool)

(assert (=> start!4706 m!29229))

(declare-fun m!29231 () Bool)

(assert (=> b!36408 m!29231))

(check-sat (not b!36408) (not b!36409) b_and!2133 (not start!4706) (not b_next!1297))
(check-sat b_and!2133 (not b_next!1297))
