; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112228 () Bool)

(assert start!112228)

(declare-fun b_free!30623 () Bool)

(declare-fun b_next!30623 () Bool)

(assert (=> start!112228 (= b_free!30623 (not b_next!30623))))

(declare-fun tp!107506 () Bool)

(declare-fun b_and!49301 () Bool)

(assert (=> start!112228 (= tp!107506 b_and!49301)))

(declare-fun b!1329400 () Bool)

(declare-fun res!882070 () Bool)

(declare-fun e!757876 () Bool)

(assert (=> b!1329400 (=> (not res!882070) (not e!757876))))

(declare-datatypes ((V!53813 0))(
  ( (V!53814 (val!18341 Int)) )
))
(declare-datatypes ((ValueCell!17368 0))(
  ( (ValueCellFull!17368 (v!20978 V!53813)) (EmptyCell!17368) )
))
(declare-datatypes ((array!89958 0))(
  ( (array!89959 (arr!43445 (Array (_ BitVec 32) ValueCell!17368)) (size!43995 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89958)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89960 0))(
  ( (array!89961 (arr!43446 (Array (_ BitVec 32) (_ BitVec 64))) (size!43996 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89960)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53813)

(declare-fun zeroValue!1262 () V!53813)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23614 0))(
  ( (tuple2!23615 (_1!11818 (_ BitVec 64)) (_2!11818 V!53813)) )
))
(declare-datatypes ((List!30767 0))(
  ( (Nil!30764) (Cons!30763 (h!31972 tuple2!23614) (t!44803 List!30767)) )
))
(declare-datatypes ((ListLongMap!21271 0))(
  ( (ListLongMap!21272 (toList!10651 List!30767)) )
))
(declare-fun contains!8815 (ListLongMap!21271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5641 (array!89960 array!89958 (_ BitVec 32) (_ BitVec 32) V!53813 V!53813 (_ BitVec 32) Int) ListLongMap!21271)

(assert (=> b!1329400 (= res!882070 (contains!8815 (getCurrentListMap!5641 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329401 () Bool)

(declare-fun e!757873 () Bool)

(declare-fun e!757875 () Bool)

(declare-fun mapRes!56473 () Bool)

(assert (=> b!1329401 (= e!757873 (and e!757875 mapRes!56473))))

(declare-fun condMapEmpty!56473 () Bool)

(declare-fun mapDefault!56473 () ValueCell!17368)

