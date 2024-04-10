; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132062 () Bool)

(assert start!132062)

(declare-fun b_free!31775 () Bool)

(declare-fun b_next!31775 () Bool)

(assert (=> start!132062 (= b_free!31775 (not b_next!31775))))

(declare-fun tp!111577 () Bool)

(declare-fun b_and!51185 () Bool)

(assert (=> start!132062 (= tp!111577 b_and!51185)))

(declare-fun b!1548041 () Bool)

(declare-datatypes ((V!59177 0))(
  ( (V!59178 (val!19103 Int)) )
))
(declare-datatypes ((tuple2!24586 0))(
  ( (tuple2!24587 (_1!12304 (_ BitVec 64)) (_2!12304 V!59177)) )
))
(declare-datatypes ((List!36080 0))(
  ( (Nil!36077) (Cons!36076 (h!37521 tuple2!24586) (t!50774 List!36080)) )
))
(declare-datatypes ((ListLongMap!22195 0))(
  ( (ListLongMap!22196 (toList!11113 List!36080)) )
))
(declare-fun e!861692 () ListLongMap!22195)

(declare-fun call!70041 () ListLongMap!22195)

(declare-fun minValue!436 () V!59177)

(declare-fun +!4944 (ListLongMap!22195 tuple2!24586) ListLongMap!22195)

(assert (=> b!1548041 (= e!861692 (+!4944 call!70041 (tuple2!24587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58780 () Bool)

(declare-fun mapRes!58780 () Bool)

(assert (=> mapIsEmpty!58780 mapRes!58780))

(declare-fun b!1548042 () Bool)

(declare-fun res!1060946 () Bool)

(declare-fun e!861687 () Bool)

(assert (=> b!1548042 (=> (not res!1060946) (not e!861687))))

(declare-datatypes ((array!103302 0))(
  ( (array!103303 (arr!49853 (Array (_ BitVec 32) (_ BitVec 64))) (size!50403 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103302)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548042 (= res!1060946 (validKeyInArray!0 (select (arr!49853 _keys!618) from!762)))))

(declare-fun b!1548043 () Bool)

(declare-fun e!861689 () Bool)

(declare-fun tp_is_empty!38051 () Bool)

(assert (=> b!1548043 (= e!861689 tp_is_empty!38051)))

(declare-fun b!1548044 () Bool)

(declare-fun res!1060949 () Bool)

(declare-fun e!861690 () Bool)

(assert (=> b!1548044 (=> (not res!1060949) (not e!861690))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103302 (_ BitVec 32)) Bool)

(assert (=> b!1548044 (= res!1060949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70037 () Bool)

(declare-fun call!70043 () ListLongMap!22195)

(assert (=> bm!70037 (= call!70043 call!70041)))

(declare-fun zeroValue!436 () V!59177)

(declare-fun call!70044 () ListLongMap!22195)

(declare-fun c!142116 () Bool)

(declare-fun call!70042 () ListLongMap!22195)

(declare-fun bm!70038 () Bool)

(declare-fun c!142117 () Bool)

(declare-fun call!70040 () ListLongMap!22195)

(assert (=> bm!70038 (= call!70041 (+!4944 (ite c!142116 call!70040 (ite c!142117 call!70044 call!70042)) (ite (or c!142116 c!142117) (tuple2!24587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548045 () Bool)

(assert (=> b!1548045 (= e!861690 e!861687)))

(declare-fun res!1060945 () Bool)

(assert (=> b!1548045 (=> (not res!1060945) (not e!861687))))

(assert (=> b!1548045 (= res!1060945 (bvslt from!762 (size!50403 _keys!618)))))

(declare-fun lt!667075 () ListLongMap!22195)

(assert (=> b!1548045 (= lt!667075 e!861692)))

(declare-fun lt!667076 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548045 (= c!142116 (and (not lt!667076) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548045 (= lt!667076 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70039 () Bool)

(declare-datatypes ((ValueCell!18115 0))(
  ( (ValueCellFull!18115 (v!21904 V!59177)) (EmptyCell!18115) )
))
(declare-datatypes ((array!103304 0))(
  ( (array!103305 (arr!49854 (Array (_ BitVec 32) ValueCell!18115)) (size!50404 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103304)

(declare-fun getCurrentListMapNoExtraKeys!6570 (array!103302 array!103304 (_ BitVec 32) (_ BitVec 32) V!59177 V!59177 (_ BitVec 32) Int) ListLongMap!22195)

(assert (=> bm!70039 (= call!70040 (getCurrentListMapNoExtraKeys!6570 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060950 () Bool)

(assert (=> start!132062 (=> (not res!1060950) (not e!861690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132062 (= res!1060950 (validMask!0 mask!926))))

(assert (=> start!132062 e!861690))

(declare-fun array_inv!38767 (array!103302) Bool)

(assert (=> start!132062 (array_inv!38767 _keys!618)))

(assert (=> start!132062 tp_is_empty!38051))

(assert (=> start!132062 true))

(assert (=> start!132062 tp!111577))

(declare-fun e!861691 () Bool)

(declare-fun array_inv!38768 (array!103304) Bool)

(assert (=> start!132062 (and (array_inv!38768 _values!470) e!861691)))

(declare-fun b!1548046 () Bool)

(declare-fun e!861685 () ListLongMap!22195)

(assert (=> b!1548046 (= e!861685 call!70043)))

(declare-fun b!1548047 () Bool)

(declare-fun res!1060947 () Bool)

(assert (=> b!1548047 (=> (not res!1060947) (not e!861690))))

(declare-datatypes ((List!36081 0))(
  ( (Nil!36078) (Cons!36077 (h!37522 (_ BitVec 64)) (t!50775 List!36081)) )
))
(declare-fun arrayNoDuplicates!0 (array!103302 (_ BitVec 32) List!36081) Bool)

(assert (=> b!1548047 (= res!1060947 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36078))))

(declare-fun b!1548048 () Bool)

(assert (=> b!1548048 (= e!861687 (not true))))

(declare-fun lt!667071 () Bool)

(declare-fun lt!667073 () ListLongMap!22195)

(declare-fun contains!10069 (ListLongMap!22195 (_ BitVec 64)) Bool)

(assert (=> b!1548048 (= lt!667071 (contains!10069 lt!667073 (select (arr!49853 _keys!618) from!762)))))

(declare-fun apply!1062 (ListLongMap!22195 (_ BitVec 64)) V!59177)

(assert (=> b!1548048 (= (apply!1062 (+!4944 lt!667073 (tuple2!24587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49853 _keys!618) from!762)) (apply!1062 lt!667073 (select (arr!49853 _keys!618) from!762)))))

(declare-datatypes ((Unit!51574 0))(
  ( (Unit!51575) )
))
(declare-fun lt!667074 () Unit!51574)

(declare-fun addApplyDifferent!604 (ListLongMap!22195 (_ BitVec 64) V!59177 (_ BitVec 64)) Unit!51574)

(assert (=> b!1548048 (= lt!667074 (addApplyDifferent!604 lt!667073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49853 _keys!618) from!762)))))

(assert (=> b!1548048 (contains!10069 (+!4944 lt!667073 (tuple2!24587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49853 _keys!618) from!762))))

(declare-fun lt!667072 () Unit!51574)

(declare-fun addStillContains!1257 (ListLongMap!22195 (_ BitVec 64) V!59177 (_ BitVec 64)) Unit!51574)

(assert (=> b!1548048 (= lt!667072 (addStillContains!1257 lt!667073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49853 _keys!618) from!762)))))

(assert (=> b!1548048 (= lt!667073 (getCurrentListMapNoExtraKeys!6570 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548049 () Bool)

(declare-fun e!861693 () ListLongMap!22195)

(assert (=> b!1548049 (= e!861693 call!70043)))

(declare-fun b!1548050 () Bool)

(declare-fun c!142118 () Bool)

(assert (=> b!1548050 (= c!142118 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667076))))

(assert (=> b!1548050 (= e!861685 e!861693)))

(declare-fun bm!70040 () Bool)

(assert (=> bm!70040 (= call!70042 call!70044)))

(declare-fun bm!70041 () Bool)

(assert (=> bm!70041 (= call!70044 call!70040)))

(declare-fun b!1548051 () Bool)

(assert (=> b!1548051 (= e!861692 e!861685)))

(assert (=> b!1548051 (= c!142117 (and (not lt!667076) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548052 () Bool)

(assert (=> b!1548052 (= e!861693 call!70042)))

(declare-fun b!1548053 () Bool)

(declare-fun e!861688 () Bool)

(assert (=> b!1548053 (= e!861688 tp_is_empty!38051)))

(declare-fun mapNonEmpty!58780 () Bool)

(declare-fun tp!111576 () Bool)

(assert (=> mapNonEmpty!58780 (= mapRes!58780 (and tp!111576 e!861689))))

(declare-fun mapKey!58780 () (_ BitVec 32))

(declare-fun mapValue!58780 () ValueCell!18115)

(declare-fun mapRest!58780 () (Array (_ BitVec 32) ValueCell!18115))

(assert (=> mapNonEmpty!58780 (= (arr!49854 _values!470) (store mapRest!58780 mapKey!58780 mapValue!58780))))

(declare-fun b!1548054 () Bool)

(assert (=> b!1548054 (= e!861691 (and e!861688 mapRes!58780))))

(declare-fun condMapEmpty!58780 () Bool)

(declare-fun mapDefault!58780 () ValueCell!18115)

