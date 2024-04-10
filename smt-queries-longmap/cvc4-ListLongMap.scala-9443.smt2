; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112270 () Bool)

(assert start!112270)

(declare-fun b_free!30665 () Bool)

(declare-fun b_next!30665 () Bool)

(assert (=> start!112270 (= b_free!30665 (not b_next!30665))))

(declare-fun tp!107632 () Bool)

(declare-fun b_and!49385 () Bool)

(assert (=> start!112270 (= tp!107632 b_and!49385)))

(declare-fun b!1330197 () Bool)

(declare-fun res!882639 () Bool)

(declare-fun e!758187 () Bool)

(assert (=> b!1330197 (=> (not res!882639) (not e!758187))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90040 0))(
  ( (array!90041 (arr!43486 (Array (_ BitVec 32) (_ BitVec 64))) (size!44036 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90040)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330197 (= res!882639 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44036 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56536 () Bool)

(declare-fun mapRes!56536 () Bool)

(assert (=> mapIsEmpty!56536 mapRes!56536))

(declare-fun b!1330198 () Bool)

(assert (=> b!1330198 (= e!758187 (not true))))

(declare-datatypes ((V!53869 0))(
  ( (V!53870 (val!18362 Int)) )
))
(declare-datatypes ((tuple2!23646 0))(
  ( (tuple2!23647 (_1!11834 (_ BitVec 64)) (_2!11834 V!53869)) )
))
(declare-datatypes ((List!30798 0))(
  ( (Nil!30795) (Cons!30794 (h!32003 tuple2!23646) (t!44876 List!30798)) )
))
(declare-datatypes ((ListLongMap!21303 0))(
  ( (ListLongMap!21304 (toList!10667 List!30798)) )
))
(declare-fun lt!591075 () ListLongMap!21303)

(declare-fun contains!8831 (ListLongMap!21303 (_ BitVec 64)) Bool)

(assert (=> b!1330198 (contains!8831 lt!591075 k!1153)))

(declare-datatypes ((Unit!43779 0))(
  ( (Unit!43780) )
))
(declare-fun lt!591076 () Unit!43779)

(declare-fun minValue!1262 () V!53869)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!252 ((_ BitVec 64) (_ BitVec 64) V!53869 ListLongMap!21303) Unit!43779)

(assert (=> b!1330198 (= lt!591076 (lemmaInListMapAfterAddingDiffThenInBefore!252 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591075))))

(declare-datatypes ((ValueCell!17389 0))(
  ( (ValueCellFull!17389 (v!20999 V!53869)) (EmptyCell!17389) )
))
(declare-datatypes ((array!90042 0))(
  ( (array!90043 (arr!43487 (Array (_ BitVec 32) ValueCell!17389)) (size!44037 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90042)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53869)

(declare-fun +!4665 (ListLongMap!21303 tuple2!23646) ListLongMap!21303)

(declare-fun getCurrentListMapNoExtraKeys!6303 (array!90040 array!90042 (_ BitVec 32) (_ BitVec 32) V!53869 V!53869 (_ BitVec 32) Int) ListLongMap!21303)

(declare-fun get!21915 (ValueCell!17389 V!53869) V!53869)

(declare-fun dynLambda!3604 (Int (_ BitVec 64)) V!53869)

(assert (=> b!1330198 (= lt!591075 (+!4665 (getCurrentListMapNoExtraKeys!6303 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23647 (select (arr!43486 _keys!1590) from!1980) (get!21915 (select (arr!43487 _values!1320) from!1980) (dynLambda!3604 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330199 () Bool)

(declare-fun res!882640 () Bool)

(assert (=> b!1330199 (=> (not res!882640) (not e!758187))))

(declare-fun getCurrentListMap!5655 (array!90040 array!90042 (_ BitVec 32) (_ BitVec 32) V!53869 V!53869 (_ BitVec 32) Int) ListLongMap!21303)

(assert (=> b!1330199 (= res!882640 (contains!8831 (getCurrentListMap!5655 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330200 () Bool)

(declare-fun res!882635 () Bool)

(assert (=> b!1330200 (=> (not res!882635) (not e!758187))))

(assert (=> b!1330200 (= res!882635 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330202 () Bool)

(declare-fun res!882642 () Bool)

(assert (=> b!1330202 (=> (not res!882642) (not e!758187))))

(assert (=> b!1330202 (= res!882642 (and (= (size!44037 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44036 _keys!1590) (size!44037 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330203 () Bool)

(declare-fun e!758190 () Bool)

(declare-fun tp_is_empty!36575 () Bool)

(assert (=> b!1330203 (= e!758190 tp_is_empty!36575)))

(declare-fun b!1330204 () Bool)

(declare-fun e!758188 () Bool)

(assert (=> b!1330204 (= e!758188 tp_is_empty!36575)))

(declare-fun mapNonEmpty!56536 () Bool)

(declare-fun tp!107631 () Bool)

(assert (=> mapNonEmpty!56536 (= mapRes!56536 (and tp!107631 e!758188))))

(declare-fun mapKey!56536 () (_ BitVec 32))

(declare-fun mapRest!56536 () (Array (_ BitVec 32) ValueCell!17389))

(declare-fun mapValue!56536 () ValueCell!17389)

(assert (=> mapNonEmpty!56536 (= (arr!43487 _values!1320) (store mapRest!56536 mapKey!56536 mapValue!56536))))

(declare-fun b!1330205 () Bool)

(declare-fun e!758191 () Bool)

(assert (=> b!1330205 (= e!758191 (and e!758190 mapRes!56536))))

(declare-fun condMapEmpty!56536 () Bool)

(declare-fun mapDefault!56536 () ValueCell!17389)

