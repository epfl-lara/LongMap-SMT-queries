; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132034 () Bool)

(assert start!132034)

(declare-fun b_free!31747 () Bool)

(declare-fun b_next!31747 () Bool)

(assert (=> start!132034 (= b_free!31747 (not b_next!31747))))

(declare-fun tp!111492 () Bool)

(declare-fun b_and!51157 () Bool)

(assert (=> start!132034 (= tp!111492 b_and!51157)))

(declare-fun b!1547369 () Bool)

(declare-fun res!1060650 () Bool)

(declare-fun e!861315 () Bool)

(assert (=> b!1547369 (=> (not res!1060650) (not e!861315))))

(declare-datatypes ((array!103246 0))(
  ( (array!103247 (arr!49825 (Array (_ BitVec 32) (_ BitVec 64))) (size!50375 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103246)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103246 (_ BitVec 32)) Bool)

(assert (=> b!1547369 (= res!1060650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547370 () Bool)

(declare-datatypes ((V!59141 0))(
  ( (V!59142 (val!19089 Int)) )
))
(declare-datatypes ((tuple2!24558 0))(
  ( (tuple2!24559 (_1!12290 (_ BitVec 64)) (_2!12290 V!59141)) )
))
(declare-datatypes ((List!36057 0))(
  ( (Nil!36054) (Cons!36053 (h!37498 tuple2!24558) (t!50751 List!36057)) )
))
(declare-datatypes ((ListLongMap!22167 0))(
  ( (ListLongMap!22168 (toList!11099 List!36057)) )
))
(declare-fun e!861313 () ListLongMap!22167)

(declare-fun call!69833 () ListLongMap!22167)

(declare-fun minValue!436 () V!59141)

(declare-fun +!4930 (ListLongMap!22167 tuple2!24558) ListLongMap!22167)

(assert (=> b!1547370 (= e!861313 (+!4930 call!69833 (tuple2!24559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58738 () Bool)

(declare-fun mapRes!58738 () Bool)

(declare-fun tp!111493 () Bool)

(declare-fun e!861310 () Bool)

(assert (=> mapNonEmpty!58738 (= mapRes!58738 (and tp!111493 e!861310))))

(declare-datatypes ((ValueCell!18101 0))(
  ( (ValueCellFull!18101 (v!21890 V!59141)) (EmptyCell!18101) )
))
(declare-fun mapValue!58738 () ValueCell!18101)

(declare-fun mapRest!58738 () (Array (_ BitVec 32) ValueCell!18101))

(declare-fun mapKey!58738 () (_ BitVec 32))

(declare-datatypes ((array!103248 0))(
  ( (array!103249 (arr!49826 (Array (_ BitVec 32) ValueCell!18101)) (size!50376 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103248)

(assert (=> mapNonEmpty!58738 (= (arr!49826 _values!470) (store mapRest!58738 mapKey!58738 mapValue!58738))))

(declare-fun b!1547371 () Bool)

(declare-fun res!1060652 () Bool)

(assert (=> b!1547371 (=> (not res!1060652) (not e!861315))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547371 (= res!1060652 (and (= (size!50376 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50375 _keys!618) (size!50376 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun call!69834 () ListLongMap!22167)

(declare-fun bm!69827 () Bool)

(declare-fun zeroValue!436 () V!59141)

(declare-fun call!69830 () ListLongMap!22167)

(declare-fun call!69831 () ListLongMap!22167)

(declare-fun c!141992 () Bool)

(declare-fun c!141991 () Bool)

(assert (=> bm!69827 (= call!69833 (+!4930 (ite c!141992 call!69831 (ite c!141991 call!69834 call!69830)) (ite (or c!141992 c!141991) (tuple2!24559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547372 () Bool)

(declare-fun res!1060654 () Bool)

(assert (=> b!1547372 (=> (not res!1060654) (not e!861315))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547372 (= res!1060654 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50375 _keys!618))))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69828 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6559 (array!103246 array!103248 (_ BitVec 32) (_ BitVec 32) V!59141 V!59141 (_ BitVec 32) Int) ListLongMap!22167)

(assert (=> bm!69828 (= call!69831 (getCurrentListMapNoExtraKeys!6559 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547373 () Bool)

(declare-fun e!861308 () Bool)

(declare-fun tp_is_empty!38023 () Bool)

(assert (=> b!1547373 (= e!861308 tp_is_empty!38023)))

(declare-fun b!1547374 () Bool)

(declare-fun e!861307 () Bool)

(assert (=> b!1547374 (= e!861307 (not true))))

(declare-fun lt!666857 () ListLongMap!22167)

(declare-fun apply!1051 (ListLongMap!22167 (_ BitVec 64)) V!59141)

(assert (=> b!1547374 (= (apply!1051 (+!4930 lt!666857 (tuple2!24559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49825 _keys!618) from!762)) (apply!1051 lt!666857 (select (arr!49825 _keys!618) from!762)))))

(declare-datatypes ((Unit!51552 0))(
  ( (Unit!51553) )
))
(declare-fun lt!666854 () Unit!51552)

(declare-fun addApplyDifferent!593 (ListLongMap!22167 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51552)

(assert (=> b!1547374 (= lt!666854 (addApplyDifferent!593 lt!666857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49825 _keys!618) from!762)))))

(declare-fun contains!10058 (ListLongMap!22167 (_ BitVec 64)) Bool)

(assert (=> b!1547374 (contains!10058 (+!4930 lt!666857 (tuple2!24559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49825 _keys!618) from!762))))

(declare-fun lt!666853 () Unit!51552)

(declare-fun addStillContains!1246 (ListLongMap!22167 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51552)

(assert (=> b!1547374 (= lt!666853 (addStillContains!1246 lt!666857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49825 _keys!618) from!762)))))

(assert (=> b!1547374 (= lt!666857 (getCurrentListMapNoExtraKeys!6559 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69829 () Bool)

(assert (=> bm!69829 (= call!69834 call!69831)))

(declare-fun b!1547375 () Bool)

(declare-fun res!1060655 () Bool)

(assert (=> b!1547375 (=> (not res!1060655) (not e!861307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547375 (= res!1060655 (validKeyInArray!0 (select (arr!49825 _keys!618) from!762)))))

(declare-fun bm!69830 () Bool)

(declare-fun call!69832 () ListLongMap!22167)

(assert (=> bm!69830 (= call!69832 call!69833)))

(declare-fun b!1547376 () Bool)

(declare-fun e!861314 () ListLongMap!22167)

(assert (=> b!1547376 (= e!861314 call!69830)))

(declare-fun b!1547377 () Bool)

(declare-fun c!141990 () Bool)

(declare-fun lt!666856 () Bool)

(assert (=> b!1547377 (= c!141990 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666856))))

(declare-fun e!861312 () ListLongMap!22167)

(assert (=> b!1547377 (= e!861312 e!861314)))

(declare-fun b!1547378 () Bool)

(assert (=> b!1547378 (= e!861312 call!69832)))

(declare-fun b!1547379 () Bool)

(declare-fun e!861309 () Bool)

(assert (=> b!1547379 (= e!861309 (and e!861308 mapRes!58738))))

(declare-fun condMapEmpty!58738 () Bool)

(declare-fun mapDefault!58738 () ValueCell!18101)

