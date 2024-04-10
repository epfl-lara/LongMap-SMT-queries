; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132046 () Bool)

(assert start!132046)

(declare-fun b_free!31759 () Bool)

(declare-fun b_next!31759 () Bool)

(assert (=> start!132046 (= b_free!31759 (not b_next!31759))))

(declare-fun tp!111529 () Bool)

(declare-fun b_and!51169 () Bool)

(assert (=> start!132046 (= tp!111529 b_and!51169)))

(declare-fun b!1547658 () Bool)

(declare-fun res!1060780 () Bool)

(declare-fun e!861469 () Bool)

(assert (=> b!1547658 (=> (not res!1060780) (not e!861469))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103270 0))(
  ( (array!103271 (arr!49837 (Array (_ BitVec 32) (_ BitVec 64))) (size!50387 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103270)

(assert (=> b!1547658 (= res!1060780 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50387 _keys!618))))))

(declare-fun b!1547659 () Bool)

(declare-datatypes ((V!59157 0))(
  ( (V!59158 (val!19095 Int)) )
))
(declare-datatypes ((tuple2!24570 0))(
  ( (tuple2!24571 (_1!12296 (_ BitVec 64)) (_2!12296 V!59157)) )
))
(declare-datatypes ((List!36066 0))(
  ( (Nil!36063) (Cons!36062 (h!37507 tuple2!24570) (t!50760 List!36066)) )
))
(declare-datatypes ((ListLongMap!22179 0))(
  ( (ListLongMap!22180 (toList!11105 List!36066)) )
))
(declare-fun e!861475 () ListLongMap!22179)

(declare-fun call!69922 () ListLongMap!22179)

(declare-fun minValue!436 () V!59157)

(declare-fun +!4936 (ListLongMap!22179 tuple2!24570) ListLongMap!22179)

(assert (=> b!1547659 (= e!861475 (+!4936 call!69922 (tuple2!24571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547660 () Bool)

(declare-fun c!142045 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666946 () Bool)

(assert (=> b!1547660 (= c!142045 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666946))))

(declare-fun e!861477 () ListLongMap!22179)

(declare-fun e!861476 () ListLongMap!22179)

(assert (=> b!1547660 (= e!861477 e!861476)))

(declare-fun mapIsEmpty!58756 () Bool)

(declare-fun mapRes!58756 () Bool)

(assert (=> mapIsEmpty!58756 mapRes!58756))

(declare-fun b!1547661 () Bool)

(declare-fun e!861472 () Bool)

(assert (=> b!1547661 (= e!861469 e!861472)))

(declare-fun res!1060776 () Bool)

(assert (=> b!1547661 (=> (not res!1060776) (not e!861472))))

(assert (=> b!1547661 (= res!1060776 (bvslt from!762 (size!50387 _keys!618)))))

(declare-fun lt!666947 () ListLongMap!22179)

(assert (=> b!1547661 (= lt!666947 e!861475)))

(declare-fun c!142046 () Bool)

(assert (=> b!1547661 (= c!142046 (and (not lt!666946) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547661 (= lt!666946 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547662 () Bool)

(declare-fun res!1060777 () Bool)

(assert (=> b!1547662 (=> (not res!1060777) (not e!861469))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18107 0))(
  ( (ValueCellFull!18107 (v!21896 V!59157)) (EmptyCell!18107) )
))
(declare-datatypes ((array!103272 0))(
  ( (array!103273 (arr!49838 (Array (_ BitVec 32) ValueCell!18107)) (size!50388 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103272)

(assert (=> b!1547662 (= res!1060777 (and (= (size!50388 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50387 _keys!618) (size!50388 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58756 () Bool)

(declare-fun tp!111528 () Bool)

(declare-fun e!861471 () Bool)

(assert (=> mapNonEmpty!58756 (= mapRes!58756 (and tp!111528 e!861471))))

(declare-fun mapKey!58756 () (_ BitVec 32))

(declare-fun mapValue!58756 () ValueCell!18107)

(declare-fun mapRest!58756 () (Array (_ BitVec 32) ValueCell!18107))

(assert (=> mapNonEmpty!58756 (= (arr!49838 _values!470) (store mapRest!58756 mapKey!58756 mapValue!58756))))

(declare-fun b!1547663 () Bool)

(declare-fun tp_is_empty!38035 () Bool)

(assert (=> b!1547663 (= e!861471 tp_is_empty!38035)))

(declare-fun bm!69917 () Bool)

(declare-fun call!69923 () ListLongMap!22179)

(declare-fun call!69924 () ListLongMap!22179)

(assert (=> bm!69917 (= call!69923 call!69924)))

(declare-fun bm!69918 () Bool)

(declare-fun call!69920 () ListLongMap!22179)

(assert (=> bm!69918 (= call!69920 call!69922)))

(declare-fun b!1547664 () Bool)

(declare-fun res!1060779 () Bool)

(assert (=> b!1547664 (=> (not res!1060779) (not e!861472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547664 (= res!1060779 (validKeyInArray!0 (select (arr!49837 _keys!618) from!762)))))

(declare-fun b!1547665 () Bool)

(declare-fun res!1060782 () Bool)

(assert (=> b!1547665 (=> (not res!1060782) (not e!861469))))

(declare-datatypes ((List!36067 0))(
  ( (Nil!36064) (Cons!36063 (h!37508 (_ BitVec 64)) (t!50761 List!36067)) )
))
(declare-fun arrayNoDuplicates!0 (array!103270 (_ BitVec 32) List!36067) Bool)

(assert (=> b!1547665 (= res!1060782 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36064))))

(declare-fun zeroValue!436 () V!59157)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69919 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6564 (array!103270 array!103272 (_ BitVec 32) (_ BitVec 32) V!59157 V!59157 (_ BitVec 32) Int) ListLongMap!22179)

(assert (=> bm!69919 (= call!69924 (getCurrentListMapNoExtraKeys!6564 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547666 () Bool)

(assert (=> b!1547666 (= e!861472 (not true))))

(declare-fun lt!666944 () ListLongMap!22179)

(declare-fun apply!1056 (ListLongMap!22179 (_ BitVec 64)) V!59157)

(assert (=> b!1547666 (= (apply!1056 (+!4936 lt!666944 (tuple2!24571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49837 _keys!618) from!762)) (apply!1056 lt!666944 (select (arr!49837 _keys!618) from!762)))))

(declare-datatypes ((Unit!51562 0))(
  ( (Unit!51563) )
))
(declare-fun lt!666945 () Unit!51562)

(declare-fun addApplyDifferent!598 (ListLongMap!22179 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51562)

(assert (=> b!1547666 (= lt!666945 (addApplyDifferent!598 lt!666944 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49837 _keys!618) from!762)))))

(declare-fun contains!10063 (ListLongMap!22179 (_ BitVec 64)) Bool)

(assert (=> b!1547666 (contains!10063 (+!4936 lt!666944 (tuple2!24571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49837 _keys!618) from!762))))

(declare-fun lt!666943 () Unit!51562)

(declare-fun addStillContains!1251 (ListLongMap!22179 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51562)

(assert (=> b!1547666 (= lt!666943 (addStillContains!1251 lt!666944 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49837 _keys!618) from!762)))))

(assert (=> b!1547666 (= lt!666944 (getCurrentListMapNoExtraKeys!6564 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69920 () Bool)

(declare-fun call!69921 () ListLongMap!22179)

(assert (=> bm!69920 (= call!69921 call!69923)))

(declare-fun b!1547667 () Bool)

(declare-fun e!861473 () Bool)

(declare-fun e!861470 () Bool)

(assert (=> b!1547667 (= e!861473 (and e!861470 mapRes!58756))))

(declare-fun condMapEmpty!58756 () Bool)

(declare-fun mapDefault!58756 () ValueCell!18107)

