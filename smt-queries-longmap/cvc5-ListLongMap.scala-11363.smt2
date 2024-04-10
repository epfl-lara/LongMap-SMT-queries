; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132082 () Bool)

(assert start!132082)

(declare-fun b_free!31795 () Bool)

(declare-fun b_next!31795 () Bool)

(assert (=> start!132082 (= b_free!31795 (not b_next!31795))))

(declare-fun tp!111636 () Bool)

(declare-fun b_and!51205 () Bool)

(assert (=> start!132082 (= tp!111636 b_and!51205)))

(declare-fun b!1548521 () Bool)

(declare-fun res!1061154 () Bool)

(declare-fun e!861960 () Bool)

(assert (=> b!1548521 (=> (not res!1061154) (not e!861960))))

(declare-datatypes ((array!103342 0))(
  ( (array!103343 (arr!49873 (Array (_ BitVec 32) (_ BitVec 64))) (size!50423 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103342)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548521 (= res!1061154 (validKeyInArray!0 (select (arr!49873 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58810 () Bool)

(declare-fun mapRes!58810 () Bool)

(declare-fun tp!111637 () Bool)

(declare-fun e!861956 () Bool)

(assert (=> mapNonEmpty!58810 (= mapRes!58810 (and tp!111637 e!861956))))

(declare-datatypes ((V!59205 0))(
  ( (V!59206 (val!19113 Int)) )
))
(declare-datatypes ((ValueCell!18125 0))(
  ( (ValueCellFull!18125 (v!21914 V!59205)) (EmptyCell!18125) )
))
(declare-fun mapRest!58810 () (Array (_ BitVec 32) ValueCell!18125))

(declare-datatypes ((array!103344 0))(
  ( (array!103345 (arr!49874 (Array (_ BitVec 32) ValueCell!18125)) (size!50424 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103344)

(declare-fun mapKey!58810 () (_ BitVec 32))

(declare-fun mapValue!58810 () ValueCell!18125)

(assert (=> mapNonEmpty!58810 (= (arr!49874 _values!470) (store mapRest!58810 mapKey!58810 mapValue!58810))))

(declare-fun b!1548522 () Bool)

(declare-fun res!1061160 () Bool)

(declare-fun e!861958 () Bool)

(assert (=> b!1548522 (=> (not res!1061160) (not e!861958))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103342 (_ BitVec 32)) Bool)

(assert (=> b!1548522 (= res!1061160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59205)

(declare-datatypes ((tuple2!24604 0))(
  ( (tuple2!24605 (_1!12313 (_ BitVec 64)) (_2!12313 V!59205)) )
))
(declare-datatypes ((List!36095 0))(
  ( (Nil!36092) (Cons!36091 (h!37536 tuple2!24604) (t!50789 List!36095)) )
))
(declare-datatypes ((ListLongMap!22213 0))(
  ( (ListLongMap!22214 (toList!11122 List!36095)) )
))
(declare-fun call!70192 () ListLongMap!22213)

(declare-fun call!70194 () ListLongMap!22213)

(declare-fun bm!70187 () Bool)

(declare-fun call!70191 () ListLongMap!22213)

(declare-fun minValue!436 () V!59205)

(declare-fun c!142207 () Bool)

(declare-fun c!142208 () Bool)

(declare-fun call!70193 () ListLongMap!22213)

(declare-fun +!4952 (ListLongMap!22213 tuple2!24604) ListLongMap!22213)

(assert (=> bm!70187 (= call!70191 (+!4952 (ite c!142207 call!70193 (ite c!142208 call!70194 call!70192)) (ite (or c!142207 c!142208) (tuple2!24605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58810 () Bool)

(assert (=> mapIsEmpty!58810 mapRes!58810))

(declare-fun bm!70188 () Bool)

(declare-fun call!70190 () ListLongMap!22213)

(assert (=> bm!70188 (= call!70190 call!70191)))

(declare-fun b!1548523 () Bool)

(declare-fun e!861955 () ListLongMap!22213)

(assert (=> b!1548523 (= e!861955 call!70190)))

(declare-fun b!1548524 () Bool)

(assert (=> b!1548524 (= e!861960 (not true))))

(declare-fun lt!667345 () V!59205)

(declare-fun lt!667343 () ListLongMap!22213)

(declare-fun apply!1069 (ListLongMap!22213 (_ BitVec 64)) V!59205)

(assert (=> b!1548524 (= (apply!1069 lt!667343 (select (arr!49873 _keys!618) from!762)) lt!667345)))

(declare-datatypes ((Unit!51588 0))(
  ( (Unit!51589) )
))
(declare-fun lt!667342 () Unit!51588)

(declare-fun lt!667340 () ListLongMap!22213)

(declare-fun addApplyDifferent!611 (ListLongMap!22213 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51588)

(assert (=> b!1548524 (= lt!667342 (addApplyDifferent!611 lt!667340 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49873 _keys!618) from!762)))))

(declare-fun lt!667344 () V!59205)

(assert (=> b!1548524 (= lt!667344 lt!667345)))

(assert (=> b!1548524 (= lt!667345 (apply!1069 lt!667340 (select (arr!49873 _keys!618) from!762)))))

(assert (=> b!1548524 (= lt!667344 (apply!1069 (+!4952 lt!667340 (tuple2!24605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49873 _keys!618) from!762)))))

(declare-fun lt!667341 () Unit!51588)

(assert (=> b!1548524 (= lt!667341 (addApplyDifferent!611 lt!667340 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49873 _keys!618) from!762)))))

(declare-fun contains!10076 (ListLongMap!22213 (_ BitVec 64)) Bool)

(assert (=> b!1548524 (contains!10076 lt!667343 (select (arr!49873 _keys!618) from!762))))

(assert (=> b!1548524 (= lt!667343 (+!4952 lt!667340 (tuple2!24605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667346 () Unit!51588)

(declare-fun addStillContains!1264 (ListLongMap!22213 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51588)

(assert (=> b!1548524 (= lt!667346 (addStillContains!1264 lt!667340 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49873 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6578 (array!103342 array!103344 (_ BitVec 32) (_ BitVec 32) V!59205 V!59205 (_ BitVec 32) Int) ListLongMap!22213)

(assert (=> b!1548524 (= lt!667340 (getCurrentListMapNoExtraKeys!6578 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70189 () Bool)

(assert (=> bm!70189 (= call!70194 call!70193)))

(declare-fun bm!70190 () Bool)

(assert (=> bm!70190 (= call!70193 (getCurrentListMapNoExtraKeys!6578 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548525 () Bool)

(declare-fun res!1061156 () Bool)

(assert (=> b!1548525 (=> (not res!1061156) (not e!861958))))

(declare-datatypes ((List!36096 0))(
  ( (Nil!36093) (Cons!36092 (h!37537 (_ BitVec 64)) (t!50790 List!36096)) )
))
(declare-fun arrayNoDuplicates!0 (array!103342 (_ BitVec 32) List!36096) Bool)

(assert (=> b!1548525 (= res!1061156 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36093))))

(declare-fun b!1548526 () Bool)

(declare-fun c!142206 () Bool)

(declare-fun lt!667339 () Bool)

(assert (=> b!1548526 (= c!142206 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667339))))

(declare-fun e!861962 () ListLongMap!22213)

(assert (=> b!1548526 (= e!861962 e!861955)))

(declare-fun b!1548527 () Bool)

(declare-fun e!861961 () ListLongMap!22213)

(assert (=> b!1548527 (= e!861961 e!861962)))

(assert (=> b!1548527 (= c!142208 (and (not lt!667339) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548528 () Bool)

(assert (=> b!1548528 (= e!861958 e!861960)))

(declare-fun res!1061158 () Bool)

(assert (=> b!1548528 (=> (not res!1061158) (not e!861960))))

(assert (=> b!1548528 (= res!1061158 (bvslt from!762 (size!50423 _keys!618)))))

(declare-fun lt!667338 () ListLongMap!22213)

(assert (=> b!1548528 (= lt!667338 e!861961)))

(assert (=> b!1548528 (= c!142207 (and (not lt!667339) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548528 (= lt!667339 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70191 () Bool)

(assert (=> bm!70191 (= call!70192 call!70194)))

(declare-fun b!1548529 () Bool)

(declare-fun e!861963 () Bool)

(declare-fun tp_is_empty!38071 () Bool)

(assert (=> b!1548529 (= e!861963 tp_is_empty!38071)))

(declare-fun b!1548530 () Bool)

(assert (=> b!1548530 (= e!861955 call!70192)))

(declare-fun b!1548531 () Bool)

(assert (=> b!1548531 (= e!861956 tp_is_empty!38071)))

(declare-fun b!1548532 () Bool)

(declare-fun res!1061159 () Bool)

(assert (=> b!1548532 (=> (not res!1061159) (not e!861958))))

(assert (=> b!1548532 (= res!1061159 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50423 _keys!618))))))

(declare-fun b!1548533 () Bool)

(assert (=> b!1548533 (= e!861961 (+!4952 call!70191 (tuple2!24605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548534 () Bool)

(assert (=> b!1548534 (= e!861962 call!70190)))

(declare-fun res!1061155 () Bool)

(assert (=> start!132082 (=> (not res!1061155) (not e!861958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132082 (= res!1061155 (validMask!0 mask!926))))

(assert (=> start!132082 e!861958))

(declare-fun array_inv!38777 (array!103342) Bool)

(assert (=> start!132082 (array_inv!38777 _keys!618)))

(assert (=> start!132082 tp_is_empty!38071))

(assert (=> start!132082 true))

(assert (=> start!132082 tp!111636))

(declare-fun e!861957 () Bool)

(declare-fun array_inv!38778 (array!103344) Bool)

(assert (=> start!132082 (and (array_inv!38778 _values!470) e!861957)))

(declare-fun b!1548535 () Bool)

(declare-fun res!1061157 () Bool)

(assert (=> b!1548535 (=> (not res!1061157) (not e!861958))))

(assert (=> b!1548535 (= res!1061157 (and (= (size!50424 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50423 _keys!618) (size!50424 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548536 () Bool)

(assert (=> b!1548536 (= e!861957 (and e!861963 mapRes!58810))))

(declare-fun condMapEmpty!58810 () Bool)

(declare-fun mapDefault!58810 () ValueCell!18125)

