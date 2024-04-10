; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132252 () Bool)

(assert start!132252)

(declare-fun b_free!31903 () Bool)

(declare-fun b_next!31903 () Bool)

(assert (=> start!132252 (= b_free!31903 (not b_next!31903))))

(declare-fun tp!111970 () Bool)

(declare-fun b_and!51337 () Bool)

(assert (=> start!132252 (= tp!111970 b_and!51337)))

(declare-fun b!1551559 () Bool)

(declare-fun res!1062494 () Bool)

(declare-fun e!863717 () Bool)

(assert (=> b!1551559 (=> (not res!1062494) (not e!863717))))

(declare-datatypes ((array!103560 0))(
  ( (array!103561 (arr!49979 (Array (_ BitVec 32) (_ BitVec 64))) (size!50529 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103560)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551559 (= res!1062494 (validKeyInArray!0 (select (arr!49979 _keys!618) from!762)))))

(declare-fun b!1551560 () Bool)

(declare-datatypes ((V!59349 0))(
  ( (V!59350 (val!19167 Int)) )
))
(declare-datatypes ((tuple2!24710 0))(
  ( (tuple2!24711 (_1!12366 (_ BitVec 64)) (_2!12366 V!59349)) )
))
(declare-datatypes ((List!36188 0))(
  ( (Nil!36185) (Cons!36184 (h!37629 tuple2!24710) (t!50900 List!36188)) )
))
(declare-datatypes ((ListLongMap!22319 0))(
  ( (ListLongMap!22320 (toList!11175 List!36188)) )
))
(declare-fun e!863723 () ListLongMap!22319)

(declare-fun call!71036 () ListLongMap!22319)

(assert (=> b!1551560 (= e!863723 call!71036)))

(declare-fun b!1551561 () Bool)

(declare-fun e!863718 () ListLongMap!22319)

(assert (=> b!1551561 (= e!863718 call!71036)))

(declare-fun mapNonEmpty!58981 () Bool)

(declare-fun mapRes!58981 () Bool)

(declare-fun tp!111969 () Bool)

(declare-fun e!863722 () Bool)

(assert (=> mapNonEmpty!58981 (= mapRes!58981 (and tp!111969 e!863722))))

(declare-fun mapKey!58981 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18179 0))(
  ( (ValueCellFull!18179 (v!21971 V!59349)) (EmptyCell!18179) )
))
(declare-datatypes ((array!103562 0))(
  ( (array!103563 (arr!49980 (Array (_ BitVec 32) ValueCell!18179)) (size!50530 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103562)

(declare-fun mapValue!58981 () ValueCell!18179)

(declare-fun mapRest!58981 () (Array (_ BitVec 32) ValueCell!18179))

(assert (=> mapNonEmpty!58981 (= (arr!49980 _values!470) (store mapRest!58981 mapKey!58981 mapValue!58981))))

(declare-fun b!1551562 () Bool)

(declare-fun e!863721 () Bool)

(declare-fun tp_is_empty!38179 () Bool)

(assert (=> b!1551562 (= e!863721 tp_is_empty!38179)))

(declare-fun zeroValue!436 () V!59349)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun call!71039 () ListLongMap!22319)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59349)

(declare-fun bm!71033 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6622 (array!103560 array!103562 (_ BitVec 32) (_ BitVec 32) V!59349 V!59349 (_ BitVec 32) Int) ListLongMap!22319)

(assert (=> bm!71033 (= call!71039 (getCurrentListMapNoExtraKeys!6622 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551564 () Bool)

(declare-fun res!1062491 () Bool)

(declare-fun e!863720 () Bool)

(assert (=> b!1551564 (=> (not res!1062491) (not e!863720))))

(assert (=> b!1551564 (= res!1062491 (and (= (size!50530 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50529 _keys!618) (size!50530 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551565 () Bool)

(declare-fun e!863725 () ListLongMap!22319)

(assert (=> b!1551565 (= e!863725 e!863718)))

(declare-fun c!142795 () Bool)

(declare-fun lt!668755 () Bool)

(assert (=> b!1551565 (= c!142795 (and (not lt!668755) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!71037 () ListLongMap!22319)

(declare-fun call!71038 () ListLongMap!22319)

(declare-fun c!142794 () Bool)

(declare-fun call!71040 () ListLongMap!22319)

(declare-fun bm!71034 () Bool)

(declare-fun +!4996 (ListLongMap!22319 tuple2!24710) ListLongMap!22319)

(assert (=> bm!71034 (= call!71038 (+!4996 (ite c!142794 call!71039 (ite c!142795 call!71040 call!71037)) (ite (or c!142794 c!142795) (tuple2!24711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551566 () Bool)

(declare-fun res!1062493 () Bool)

(assert (=> b!1551566 (=> (not res!1062493) (not e!863720))))

(assert (=> b!1551566 (= res!1062493 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50529 _keys!618))))))

(declare-fun b!1551567 () Bool)

(assert (=> b!1551567 (= e!863723 call!71037)))

(declare-fun b!1551568 () Bool)

(declare-fun res!1062490 () Bool)

(assert (=> b!1551568 (=> (not res!1062490) (not e!863720))))

(declare-datatypes ((List!36189 0))(
  ( (Nil!36186) (Cons!36185 (h!37630 (_ BitVec 64)) (t!50901 List!36189)) )
))
(declare-fun arrayNoDuplicates!0 (array!103560 (_ BitVec 32) List!36189) Bool)

(assert (=> b!1551568 (= res!1062490 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36186))))

(declare-fun mapIsEmpty!58981 () Bool)

(assert (=> mapIsEmpty!58981 mapRes!58981))

(declare-fun b!1551569 () Bool)

(declare-fun e!863716 () Bool)

(assert (=> b!1551569 (= e!863716 (and e!863721 mapRes!58981))))

(declare-fun condMapEmpty!58981 () Bool)

(declare-fun mapDefault!58981 () ValueCell!18179)

