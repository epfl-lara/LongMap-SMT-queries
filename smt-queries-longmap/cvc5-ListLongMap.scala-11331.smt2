; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131890 () Bool)

(assert start!131890)

(declare-fun b_free!31603 () Bool)

(declare-fun b_next!31603 () Bool)

(assert (=> start!131890 (= b_free!31603 (not b_next!31603))))

(declare-fun tp!111060 () Bool)

(declare-fun b_and!51013 () Bool)

(assert (=> start!131890 (= tp!111060 b_and!51013)))

(declare-fun mapNonEmpty!58522 () Bool)

(declare-fun mapRes!58522 () Bool)

(declare-fun tp!111061 () Bool)

(declare-fun e!859439 () Bool)

(assert (=> mapNonEmpty!58522 (= mapRes!58522 (and tp!111061 e!859439))))

(declare-datatypes ((V!58949 0))(
  ( (V!58950 (val!19017 Int)) )
))
(declare-datatypes ((ValueCell!18029 0))(
  ( (ValueCellFull!18029 (v!21818 V!58949)) (EmptyCell!18029) )
))
(declare-fun mapValue!58522 () ValueCell!18029)

(declare-fun mapKey!58522 () (_ BitVec 32))

(declare-datatypes ((array!102972 0))(
  ( (array!102973 (arr!49688 (Array (_ BitVec 32) ValueCell!18029)) (size!50238 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102972)

(declare-fun mapRest!58522 () (Array (_ BitVec 32) ValueCell!18029))

(assert (=> mapNonEmpty!58522 (= (arr!49688 _values!470) (store mapRest!58522 mapKey!58522 mapValue!58522))))

(declare-datatypes ((tuple2!24424 0))(
  ( (tuple2!24425 (_1!12223 (_ BitVec 64)) (_2!12223 V!58949)) )
))
(declare-datatypes ((List!35941 0))(
  ( (Nil!35938) (Cons!35937 (h!37382 tuple2!24424) (t!50635 List!35941)) )
))
(declare-datatypes ((ListLongMap!22033 0))(
  ( (ListLongMap!22034 (toList!11032 List!35941)) )
))
(declare-fun call!68750 () ListLongMap!22033)

(declare-fun c!141342 () Bool)

(declare-fun zeroValue!436 () V!58949)

(declare-fun bm!68747 () Bool)

(declare-fun minValue!436 () V!58949)

(declare-fun call!68751 () ListLongMap!22033)

(declare-fun call!68754 () ListLongMap!22033)

(declare-fun c!141343 () Bool)

(declare-fun call!68752 () ListLongMap!22033)

(declare-fun +!4871 (ListLongMap!22033 tuple2!24424) ListLongMap!22033)

(assert (=> bm!68747 (= call!68754 (+!4871 (ite c!141343 call!68752 (ite c!141342 call!68751 call!68750)) (ite (or c!141343 c!141342) (tuple2!24425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-datatypes ((array!102974 0))(
  ( (array!102975 (arr!49689 (Array (_ BitVec 32) (_ BitVec 64))) (size!50239 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102974)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68748 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6504 (array!102974 array!102972 (_ BitVec 32) (_ BitVec 32) V!58949 V!58949 (_ BitVec 32) Int) ListLongMap!22033)

(assert (=> bm!68748 (= call!68752 (getCurrentListMapNoExtraKeys!6504 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544053 () Bool)

(declare-fun res!1059279 () Bool)

(declare-fun e!859436 () Bool)

(assert (=> b!1544053 (=> (not res!1059279) (not e!859436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102974 (_ BitVec 32)) Bool)

(assert (=> b!1544053 (= res!1059279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059281 () Bool)

(assert (=> start!131890 (=> (not res!1059281) (not e!859436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131890 (= res!1059281 (validMask!0 mask!926))))

(assert (=> start!131890 e!859436))

(declare-fun array_inv!38653 (array!102974) Bool)

(assert (=> start!131890 (array_inv!38653 _keys!618)))

(declare-fun tp_is_empty!37879 () Bool)

(assert (=> start!131890 tp_is_empty!37879))

(assert (=> start!131890 true))

(assert (=> start!131890 tp!111060))

(declare-fun e!859435 () Bool)

(declare-fun array_inv!38654 (array!102972) Bool)

(assert (=> start!131890 (and (array_inv!38654 _values!470) e!859435)))

(declare-fun bm!68749 () Bool)

(assert (=> bm!68749 (= call!68751 call!68752)))

(declare-fun b!1544054 () Bool)

(declare-fun c!141344 () Bool)

(declare-fun lt!666083 () Bool)

(assert (=> b!1544054 (= c!141344 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666083))))

(declare-fun e!859437 () ListLongMap!22033)

(declare-fun e!859433 () ListLongMap!22033)

(assert (=> b!1544054 (= e!859437 e!859433)))

(declare-fun b!1544055 () Bool)

(declare-fun e!859440 () ListLongMap!22033)

(assert (=> b!1544055 (= e!859440 (+!4871 call!68754 (tuple2!24425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544056 () Bool)

(declare-fun res!1059282 () Bool)

(assert (=> b!1544056 (=> (not res!1059282) (not e!859436))))

(assert (=> b!1544056 (= res!1059282 (and (= (size!50238 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50239 _keys!618) (size!50238 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544057 () Bool)

(declare-fun e!859434 () Bool)

(assert (=> b!1544057 (= e!859434 tp_is_empty!37879)))

(declare-fun bm!68750 () Bool)

(declare-fun call!68753 () ListLongMap!22033)

(assert (=> bm!68750 (= call!68753 call!68754)))

(declare-fun b!1544058 () Bool)

(declare-fun res!1059278 () Bool)

(assert (=> b!1544058 (=> (not res!1059278) (not e!859436))))

(declare-datatypes ((List!35942 0))(
  ( (Nil!35939) (Cons!35938 (h!37383 (_ BitVec 64)) (t!50636 List!35942)) )
))
(declare-fun arrayNoDuplicates!0 (array!102974 (_ BitVec 32) List!35942) Bool)

(assert (=> b!1544058 (= res!1059278 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35939))))

(declare-fun b!1544059 () Bool)

(assert (=> b!1544059 (= e!859440 e!859437)))

(assert (=> b!1544059 (= c!141342 (and (not lt!666083) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544060 () Bool)

(assert (=> b!1544060 (= e!859435 (and e!859434 mapRes!58522))))

(declare-fun condMapEmpty!58522 () Bool)

(declare-fun mapDefault!58522 () ValueCell!18029)

