; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113762 () Bool)

(assert start!113762)

(declare-fun b!1350004 () Bool)

(declare-fun res!895543 () Bool)

(declare-fun e!767973 () Bool)

(assert (=> b!1350004 (=> (not res!895543) (not e!767973))))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun otherKey!123 () (_ BitVec 64))

(assert (=> b!1350004 (= res!895543 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350005 () Bool)

(declare-fun res!895541 () Bool)

(assert (=> b!1350005 (=> (not res!895541) (not e!767973))))

(declare-datatypes ((V!55241 0))(
  ( (V!55242 (val!18876 Int)) )
))
(declare-datatypes ((tuple2!24346 0))(
  ( (tuple2!24347 (_1!12184 (_ BitVec 64)) (_2!12184 V!55241)) )
))
(declare-datatypes ((List!31494 0))(
  ( (Nil!31491) (Cons!31490 (h!32699 tuple2!24346) (t!46152 List!31494)) )
))
(declare-datatypes ((ListLongMap!22003 0))(
  ( (ListLongMap!22004 (toList!11017 List!31494)) )
))
(declare-fun lm!1456 () ListLongMap!22003)

(declare-fun contains!9203 (ListLongMap!22003 (_ BitVec 64)) Bool)

(assert (=> b!1350005 (= res!895541 (not (contains!9203 lm!1456 k!1141)))))

(declare-fun res!895542 () Bool)

(assert (=> start!113762 (=> (not res!895542) (not e!767973))))

(declare-fun value!554 () V!55241)

(declare-fun +!4859 (ListLongMap!22003 tuple2!24346) ListLongMap!22003)

(assert (=> start!113762 (= res!895542 (contains!9203 (+!4859 lm!1456 (tuple2!24347 otherKey!123 value!554)) k!1141))))

(assert (=> start!113762 e!767973))

(declare-fun e!767974 () Bool)

(declare-fun inv!48418 (ListLongMap!22003) Bool)

(assert (=> start!113762 (and (inv!48418 lm!1456) e!767974)))

(assert (=> start!113762 true))

(declare-fun tp_is_empty!37603 () Bool)

(assert (=> start!113762 tp_is_empty!37603))

(declare-fun b!1350006 () Bool)

(assert (=> b!1350006 (= e!767973 (= otherKey!123 k!1141))))

(declare-fun b!1350007 () Bool)

(declare-fun tp!110620 () Bool)

(assert (=> b!1350007 (= e!767974 tp!110620)))

(assert (= (and start!113762 res!895542) b!1350004))

(assert (= (and b!1350004 res!895543) b!1350005))

(assert (= (and b!1350005 res!895541) b!1350006))

(assert (= start!113762 b!1350007))

(declare-fun m!1237321 () Bool)

(assert (=> b!1350005 m!1237321))

(declare-fun m!1237323 () Bool)

(assert (=> start!113762 m!1237323))

(assert (=> start!113762 m!1237323))

(declare-fun m!1237325 () Bool)

(assert (=> start!113762 m!1237325))

(declare-fun m!1237327 () Bool)

(assert (=> start!113762 m!1237327))

(push 1)

(assert (not start!113762))

(assert (not b!1350005))

(assert (not b!1350007))

(assert tp_is_empty!37603)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

