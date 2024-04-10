; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4720 () Bool)

(assert start!4720)

(declare-fun b_free!1307 () Bool)

(declare-fun b_next!1307 () Bool)

(assert (=> start!4720 (= b_free!1307 (not b_next!1307))))

(declare-fun tp!5383 () Bool)

(declare-fun b_and!2153 () Bool)

(assert (=> start!4720 (= tp!5383 b_and!2153)))

(declare-fun b!36542 () Bool)

(declare-fun res!22118 () Bool)

(declare-fun e!23094 () Bool)

(assert (=> b!36542 (=> (not res!22118) (not e!23094))))

(declare-datatypes ((B!714 0))(
  ( (B!715 (val!857 Int)) )
))
(declare-datatypes ((tuple2!1374 0))(
  ( (tuple2!1375 (_1!698 (_ BitVec 64)) (_2!698 B!714)) )
))
(declare-datatypes ((List!961 0))(
  ( (Nil!958) (Cons!957 (h!1525 tuple2!1374) (t!3686 List!961)) )
))
(declare-datatypes ((ListLongMap!951 0))(
  ( (ListLongMap!952 (toList!491 List!961)) )
))
(declare-fun lm!252 () ListLongMap!951)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun head!835 (List!961) tuple2!1374)

(assert (=> b!36542 (= res!22118 (not (= (_1!698 (head!835 (toList!491 lm!252))) k!388)))))

(declare-fun res!22116 () Bool)

(assert (=> start!4720 (=> (not res!22116) (not e!23094))))

(declare-fun p!304 () Int)

(declare-fun forall!157 (List!961 Int) Bool)

(assert (=> start!4720 (= res!22116 (forall!157 (toList!491 lm!252) p!304))))

(assert (=> start!4720 e!23094))

(declare-fun e!23093 () Bool)

(declare-fun inv!1592 (ListLongMap!951) Bool)

(assert (=> start!4720 (and (inv!1592 lm!252) e!23093)))

(assert (=> start!4720 tp!5383))

(assert (=> start!4720 true))

(declare-fun b!36543 () Bool)

(declare-fun tp!5384 () Bool)

(assert (=> b!36543 (= e!23093 tp!5384)))

(declare-fun b!36544 () Bool)

(declare-fun res!22117 () Bool)

(assert (=> b!36544 (=> (not res!22117) (not e!23094))))

(declare-fun contains!442 (ListLongMap!951 (_ BitVec 64)) Bool)

(assert (=> b!36544 (= res!22117 (contains!442 lm!252 k!388))))

(declare-fun b!36545 () Bool)

(declare-fun e!23095 () Bool)

(assert (=> b!36545 (= e!23095 false)))

(declare-fun lt!13518 () Bool)

(declare-fun lt!13517 () ListLongMap!951)

(assert (=> b!36545 (= lt!13518 (contains!442 lt!13517 k!388))))

(declare-fun b!36546 () Bool)

(assert (=> b!36546 (= e!23094 e!23095)))

(declare-fun res!22115 () Bool)

(assert (=> b!36546 (=> (not res!22115) (not e!23095))))

(assert (=> b!36546 (= res!22115 (forall!157 (toList!491 lt!13517) p!304))))

(declare-fun tail!88 (ListLongMap!951) ListLongMap!951)

(assert (=> b!36546 (= lt!13517 (tail!88 lm!252))))

(declare-fun b!36547 () Bool)

(declare-fun res!22119 () Bool)

(assert (=> b!36547 (=> (not res!22119) (not e!23094))))

(declare-fun isEmpty!186 (ListLongMap!951) Bool)

(assert (=> b!36547 (= res!22119 (not (isEmpty!186 lm!252)))))

(assert (= (and start!4720 res!22116) b!36544))

(assert (= (and b!36544 res!22117) b!36547))

(assert (= (and b!36547 res!22119) b!36542))

(assert (= (and b!36542 res!22118) b!36546))

(assert (= (and b!36546 res!22115) b!36545))

(assert (= start!4720 b!36543))

(declare-fun m!29429 () Bool)

(assert (=> b!36547 m!29429))

(declare-fun m!29431 () Bool)

(assert (=> b!36546 m!29431))

(declare-fun m!29433 () Bool)

(assert (=> b!36546 m!29433))

(declare-fun m!29435 () Bool)

(assert (=> b!36544 m!29435))

(declare-fun m!29437 () Bool)

(assert (=> start!4720 m!29437))

(declare-fun m!29439 () Bool)

(assert (=> start!4720 m!29439))

(declare-fun m!29441 () Bool)

(assert (=> b!36542 m!29441))

(declare-fun m!29443 () Bool)

(assert (=> b!36545 m!29443))

(push 1)

(assert (not b!36547))

(assert (not b!36544))

(assert (not start!4720))

(assert (not b!36545))

(assert (not b!36542))

