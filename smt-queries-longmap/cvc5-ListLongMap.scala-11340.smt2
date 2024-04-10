; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131944 () Bool)

(assert start!131944)

(declare-fun b_free!31657 () Bool)

(declare-fun b_next!31657 () Bool)

(assert (=> start!131944 (= b_free!31657 (not b_next!31657))))

(declare-fun tp!111222 () Bool)

(declare-fun b_and!51067 () Bool)

(assert (=> start!131944 (= tp!111222 b_and!51067)))

(declare-fun b!1545209 () Bool)

(declare-fun e!860092 () Bool)

(declare-fun tp_is_empty!37933 () Bool)

(assert (=> b!1545209 (= e!860092 tp_is_empty!37933)))

(declare-fun b!1545210 () Bool)

(declare-datatypes ((V!59021 0))(
  ( (V!59022 (val!19044 Int)) )
))
(declare-datatypes ((tuple2!24472 0))(
  ( (tuple2!24473 (_1!12247 (_ BitVec 64)) (_2!12247 V!59021)) )
))
(declare-datatypes ((List!35983 0))(
  ( (Nil!35980) (Cons!35979 (h!37424 tuple2!24472) (t!50677 List!35983)) )
))
(declare-datatypes ((ListLongMap!22081 0))(
  ( (ListLongMap!22082 (toList!11056 List!35983)) )
))
(declare-fun e!860097 () ListLongMap!22081)

(declare-fun call!69157 () ListLongMap!22081)

(assert (=> b!1545210 (= e!860097 call!69157)))

(declare-fun b!1545211 () Bool)

(declare-fun e!860095 () Bool)

(declare-fun e!860100 () Bool)

(assert (=> b!1545211 (= e!860095 e!860100)))

(declare-fun res!1059708 () Bool)

(assert (=> b!1545211 (=> (not res!1059708) (not e!860100))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103074 0))(
  ( (array!103075 (arr!49739 (Array (_ BitVec 32) (_ BitVec 64))) (size!50289 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103074)

(assert (=> b!1545211 (= res!1059708 (bvslt from!762 (size!50289 _keys!618)))))

(declare-fun lt!666258 () ListLongMap!22081)

(declare-fun e!860096 () ListLongMap!22081)

(assert (=> b!1545211 (= lt!666258 e!860096)))

(declare-fun c!141587 () Bool)

(declare-fun lt!666257 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545211 (= c!141587 (and (not lt!666257) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545211 (= lt!666257 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545212 () Bool)

(declare-fun call!69155 () ListLongMap!22081)

(declare-fun minValue!436 () V!59021)

(declare-fun +!4892 (ListLongMap!22081 tuple2!24472) ListLongMap!22081)

(assert (=> b!1545212 (= e!860096 (+!4892 call!69155 (tuple2!24473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545213 () Bool)

(declare-fun c!141585 () Bool)

(assert (=> b!1545213 (= c!141585 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666257))))

(declare-fun e!860099 () ListLongMap!22081)

(assert (=> b!1545213 (= e!860099 e!860097)))

(declare-fun call!69156 () ListLongMap!22081)

(declare-fun zeroValue!436 () V!59021)

(declare-fun call!69159 () ListLongMap!22081)

(declare-fun bm!69152 () Bool)

(declare-fun c!141586 () Bool)

(assert (=> bm!69152 (= call!69155 (+!4892 (ite c!141587 call!69156 (ite c!141586 call!69159 call!69157)) (ite (or c!141587 c!141586) (tuple2!24473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545214 () Bool)

(declare-fun res!1059707 () Bool)

(assert (=> b!1545214 (=> (not res!1059707) (not e!860095))))

(declare-datatypes ((List!35984 0))(
  ( (Nil!35981) (Cons!35980 (h!37425 (_ BitVec 64)) (t!50678 List!35984)) )
))
(declare-fun arrayNoDuplicates!0 (array!103074 (_ BitVec 32) List!35984) Bool)

(assert (=> b!1545214 (= res!1059707 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35981))))

(declare-fun res!1059710 () Bool)

(assert (=> start!131944 (=> (not res!1059710) (not e!860095))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131944 (= res!1059710 (validMask!0 mask!926))))

(assert (=> start!131944 e!860095))

(declare-fun array_inv!38689 (array!103074) Bool)

(assert (=> start!131944 (array_inv!38689 _keys!618)))

(assert (=> start!131944 tp_is_empty!37933))

(assert (=> start!131944 true))

(assert (=> start!131944 tp!111222))

(declare-datatypes ((ValueCell!18056 0))(
  ( (ValueCellFull!18056 (v!21845 V!59021)) (EmptyCell!18056) )
))
(declare-datatypes ((array!103076 0))(
  ( (array!103077 (arr!49740 (Array (_ BitVec 32) ValueCell!18056)) (size!50290 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103076)

(declare-fun e!860093 () Bool)

(declare-fun array_inv!38690 (array!103076) Bool)

(assert (=> start!131944 (and (array_inv!38690 _values!470) e!860093)))

(declare-fun b!1545215 () Bool)

(declare-fun call!69158 () ListLongMap!22081)

(assert (=> b!1545215 (= e!860099 call!69158)))

(declare-fun b!1545216 () Bool)

(assert (=> b!1545216 (= e!860096 e!860099)))

(assert (=> b!1545216 (= c!141586 (and (not lt!666257) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58603 () Bool)

(declare-fun mapRes!58603 () Bool)

(assert (=> mapIsEmpty!58603 mapRes!58603))

(declare-fun bm!69153 () Bool)

(assert (=> bm!69153 (= call!69159 call!69156)))

(declare-fun bm!69154 () Bool)

(assert (=> bm!69154 (= call!69158 call!69155)))

(declare-fun b!1545217 () Bool)

(declare-fun res!1059709 () Bool)

(assert (=> b!1545217 (=> (not res!1059709) (not e!860095))))

(assert (=> b!1545217 (= res!1059709 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50289 _keys!618))))))

(declare-fun b!1545218 () Bool)

(declare-fun res!1059705 () Bool)

(assert (=> b!1545218 (=> (not res!1059705) (not e!860095))))

(assert (=> b!1545218 (= res!1059705 (and (= (size!50290 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50289 _keys!618) (size!50290 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69155 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6525 (array!103074 array!103076 (_ BitVec 32) (_ BitVec 32) V!59021 V!59021 (_ BitVec 32) Int) ListLongMap!22081)

(assert (=> bm!69155 (= call!69156 (getCurrentListMapNoExtraKeys!6525 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545219 () Bool)

(declare-fun res!1059711 () Bool)

(assert (=> b!1545219 (=> (not res!1059711) (not e!860100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545219 (= res!1059711 (validKeyInArray!0 (select (arr!49739 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58603 () Bool)

(declare-fun tp!111223 () Bool)

(assert (=> mapNonEmpty!58603 (= mapRes!58603 (and tp!111223 e!860092))))

(declare-fun mapValue!58603 () ValueCell!18056)

(declare-fun mapKey!58603 () (_ BitVec 32))

(declare-fun mapRest!58603 () (Array (_ BitVec 32) ValueCell!18056))

(assert (=> mapNonEmpty!58603 (= (arr!49740 _values!470) (store mapRest!58603 mapKey!58603 mapValue!58603))))

(declare-fun bm!69156 () Bool)

(assert (=> bm!69156 (= call!69157 call!69159)))

(declare-fun b!1545220 () Bool)

(assert (=> b!1545220 (= e!860097 call!69158)))

(declare-fun b!1545221 () Bool)

(declare-fun res!1059706 () Bool)

(assert (=> b!1545221 (=> (not res!1059706) (not e!860095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103074 (_ BitVec 32)) Bool)

(assert (=> b!1545221 (= res!1059706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545222 () Bool)

(declare-fun e!860098 () Bool)

(assert (=> b!1545222 (= e!860093 (and e!860098 mapRes!58603))))

(declare-fun condMapEmpty!58603 () Bool)

(declare-fun mapDefault!58603 () ValueCell!18056)

