; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112240 () Bool)

(assert start!112240)

(declare-fun b_free!30635 () Bool)

(declare-fun b_next!30635 () Bool)

(assert (=> start!112240 (= b_free!30635 (not b_next!30635))))

(declare-fun tp!107541 () Bool)

(declare-fun b_and!49325 () Bool)

(assert (=> start!112240 (= tp!107541 b_and!49325)))

(declare-fun b!1329627 () Bool)

(declare-fun res!882230 () Bool)

(declare-fun e!757966 () Bool)

(assert (=> b!1329627 (=> (not res!882230) (not e!757966))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89982 0))(
  ( (array!89983 (arr!43457 (Array (_ BitVec 32) (_ BitVec 64))) (size!44007 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89982)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329627 (= res!882230 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44007 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329628 () Bool)

(assert (=> b!1329628 (= e!757966 (not true))))

(declare-datatypes ((V!53829 0))(
  ( (V!53830 (val!18347 Int)) )
))
(declare-datatypes ((tuple2!23622 0))(
  ( (tuple2!23623 (_1!11822 (_ BitVec 64)) (_2!11822 V!53829)) )
))
(declare-datatypes ((List!30774 0))(
  ( (Nil!30771) (Cons!30770 (h!31979 tuple2!23622) (t!44822 List!30774)) )
))
(declare-datatypes ((ListLongMap!21279 0))(
  ( (ListLongMap!21280 (toList!10655 List!30774)) )
))
(declare-fun lt!590985 () ListLongMap!21279)

(declare-fun contains!8819 (ListLongMap!21279 (_ BitVec 64)) Bool)

(assert (=> b!1329628 (contains!8819 lt!590985 k!1153)))

(declare-datatypes ((Unit!43757 0))(
  ( (Unit!43758) )
))
(declare-fun lt!590986 () Unit!43757)

(declare-fun minValue!1262 () V!53829)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!241 ((_ BitVec 64) (_ BitVec 64) V!53829 ListLongMap!21279) Unit!43757)

(assert (=> b!1329628 (= lt!590986 (lemmaInListMapAfterAddingDiffThenInBefore!241 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590985))))

(declare-datatypes ((ValueCell!17374 0))(
  ( (ValueCellFull!17374 (v!20984 V!53829)) (EmptyCell!17374) )
))
(declare-datatypes ((array!89984 0))(
  ( (array!89985 (arr!43458 (Array (_ BitVec 32) ValueCell!17374)) (size!44008 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89984)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53829)

(declare-fun defaultEntry!1323 () Int)

(declare-fun +!4654 (ListLongMap!21279 tuple2!23622) ListLongMap!21279)

(declare-fun getCurrentListMapNoExtraKeys!6292 (array!89982 array!89984 (_ BitVec 32) (_ BitVec 32) V!53829 V!53829 (_ BitVec 32) Int) ListLongMap!21279)

(declare-fun get!21894 (ValueCell!17374 V!53829) V!53829)

(declare-fun dynLambda!3593 (Int (_ BitVec 64)) V!53829)

(assert (=> b!1329628 (= lt!590985 (+!4654 (getCurrentListMapNoExtraKeys!6292 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23623 (select (arr!43457 _keys!1590) from!1980) (get!21894 (select (arr!43458 _values!1320) from!1980) (dynLambda!3593 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329629 () Bool)

(declare-fun res!882232 () Bool)

(assert (=> b!1329629 (=> (not res!882232) (not e!757966))))

(assert (=> b!1329629 (= res!882232 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329630 () Bool)

(declare-fun e!757962 () Bool)

(declare-fun e!757965 () Bool)

(declare-fun mapRes!56491 () Bool)

(assert (=> b!1329630 (= e!757962 (and e!757965 mapRes!56491))))

(declare-fun condMapEmpty!56491 () Bool)

(declare-fun mapDefault!56491 () ValueCell!17374)

