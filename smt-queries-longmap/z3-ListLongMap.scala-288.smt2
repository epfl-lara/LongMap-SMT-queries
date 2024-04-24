; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4724 () Bool)

(assert start!4724)

(declare-fun b_free!1315 () Bool)

(declare-fun b_next!1315 () Bool)

(assert (=> start!4724 (= b_free!1315 (not b_next!1315))))

(declare-fun tp!5408 () Bool)

(declare-fun b_and!2157 () Bool)

(assert (=> start!4724 (= tp!5408 b_and!2157)))

(declare-fun res!22136 () Bool)

(declare-fun e!23076 () Bool)

(assert (=> start!4724 (=> (not res!22136) (not e!23076))))

(declare-datatypes ((B!722 0))(
  ( (B!723 (val!861 Int)) )
))
(declare-datatypes ((tuple2!1364 0))(
  ( (tuple2!1365 (_1!693 (_ BitVec 64)) (_2!693 B!722)) )
))
(declare-datatypes ((List!951 0))(
  ( (Nil!948) (Cons!947 (h!1515 tuple2!1364) (t!3676 List!951)) )
))
(declare-datatypes ((ListLongMap!935 0))(
  ( (ListLongMap!936 (toList!483 List!951)) )
))
(declare-fun lm!252 () ListLongMap!935)

(declare-fun p!304 () Int)

(declare-fun forall!161 (List!951 Int) Bool)

(assert (=> start!4724 (= res!22136 (forall!161 (toList!483 lm!252) p!304))))

(assert (=> start!4724 e!23076))

(declare-fun e!23075 () Bool)

(declare-fun inv!1606 (ListLongMap!935) Bool)

(assert (=> start!4724 (and (inv!1606 lm!252) e!23075)))

(assert (=> start!4724 tp!5408))

(assert (=> start!4724 true))

(declare-fun b!36543 () Bool)

(assert (=> b!36543 (= e!23076 false)))

(declare-fun lt!13495 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!436 (ListLongMap!935 (_ BitVec 64)) Bool)

(assert (=> b!36543 (= lt!13495 (contains!436 lm!252 k0!388))))

(declare-fun b!36544 () Bool)

(declare-fun tp!5407 () Bool)

(assert (=> b!36544 (= e!23075 tp!5407)))

(assert (= (and start!4724 res!22136) b!36543))

(assert (= start!4724 b!36544))

(declare-fun m!29359 () Bool)

(assert (=> start!4724 m!29359))

(declare-fun m!29361 () Bool)

(assert (=> start!4724 m!29361))

(declare-fun m!29363 () Bool)

(assert (=> b!36543 m!29363))

(check-sat (not b!36544) b_and!2157 (not b_next!1315) (not b!36543) (not start!4724))
(check-sat b_and!2157 (not b_next!1315))
