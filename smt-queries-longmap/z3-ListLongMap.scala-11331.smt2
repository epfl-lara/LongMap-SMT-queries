; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132302 () Bool)

(assert start!132302)

(declare-fun b_free!31603 () Bool)

(declare-fun b_next!31603 () Bool)

(assert (=> start!132302 (= b_free!31603 (not b_next!31603))))

(declare-fun tp!111060 () Bool)

(declare-fun b_and!51015 () Bool)

(assert (=> start!132302 (= tp!111060 b_and!51015)))

(declare-fun bm!68897 () Bool)

(declare-datatypes ((V!58949 0))(
  ( (V!58950 (val!19017 Int)) )
))
(declare-datatypes ((tuple2!24480 0))(
  ( (tuple2!24481 (_1!12251 (_ BitVec 64)) (_2!12251 V!58949)) )
))
(declare-datatypes ((List!35977 0))(
  ( (Nil!35974) (Cons!35973 (h!37436 tuple2!24480) (t!50663 List!35977)) )
))
(declare-datatypes ((ListLongMap!22097 0))(
  ( (ListLongMap!22098 (toList!11064 List!35977)) )
))
(declare-fun call!68900 () ListLongMap!22097)

(declare-fun call!68903 () ListLongMap!22097)

(assert (=> bm!68897 (= call!68900 call!68903)))

(declare-fun b!1546489 () Bool)

(declare-fun e!860942 () ListLongMap!22097)

(declare-fun call!68901 () ListLongMap!22097)

(declare-fun minValue!436 () V!58949)

(declare-fun +!4912 (ListLongMap!22097 tuple2!24480) ListLongMap!22097)

(assert (=> b!1546489 (= e!860942 (+!4912 call!68901 (tuple2!24481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546490 () Bool)

(declare-fun e!860949 () ListLongMap!22097)

(assert (=> b!1546490 (= e!860942 e!860949)))

(declare-fun c!142143 () Bool)

(declare-fun lt!666990 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546490 (= c!142143 (and (not lt!666990) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68898 () Bool)

(declare-fun call!68902 () ListLongMap!22097)

(assert (=> bm!68898 (= call!68903 call!68902)))

(declare-fun zeroValue!436 () V!58949)

(declare-fun bm!68899 () Bool)

(declare-fun c!142144 () Bool)

(assert (=> bm!68899 (= call!68901 (+!4912 (ite c!142144 call!68902 (ite c!142143 call!68903 call!68900)) (ite (or c!142144 c!142143) (tuple2!24481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546491 () Bool)

(declare-fun e!860945 () Bool)

(declare-fun tp_is_empty!37879 () Bool)

(assert (=> b!1546491 (= e!860945 tp_is_empty!37879)))

(declare-fun b!1546492 () Bool)

(declare-fun e!860948 () Bool)

(declare-fun mapRes!58522 () Bool)

(assert (=> b!1546492 (= e!860948 (and e!860945 mapRes!58522))))

(declare-fun condMapEmpty!58522 () Bool)

(declare-datatypes ((ValueCell!18029 0))(
  ( (ValueCellFull!18029 (v!21810 V!58949)) (EmptyCell!18029) )
))
(declare-datatypes ((array!103090 0))(
  ( (array!103091 (arr!49740 (Array (_ BitVec 32) ValueCell!18029)) (size!50291 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103090)

(declare-fun mapDefault!58522 () ValueCell!18029)

(assert (=> b!1546492 (= condMapEmpty!58522 (= (arr!49740 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18029)) mapDefault!58522)))))

(declare-fun bm!68900 () Bool)

(declare-fun call!68904 () ListLongMap!22097)

(assert (=> bm!68900 (= call!68904 call!68901)))

(declare-fun b!1546493 () Bool)

(declare-fun e!860943 () Bool)

(assert (=> b!1546493 (= e!860943 false)))

(declare-fun lt!666991 () ListLongMap!22097)

(assert (=> b!1546493 (= lt!666991 e!860942)))

(assert (=> b!1546493 (= c!142144 (and (not lt!666990) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546493 (= lt!666990 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546494 () Bool)

(declare-fun e!860946 () Bool)

(assert (=> b!1546494 (= e!860946 tp_is_empty!37879)))

(declare-fun b!1546495 () Bool)

(assert (=> b!1546495 (= e!860949 call!68904)))

(declare-fun b!1546496 () Bool)

(declare-fun res!1060141 () Bool)

(assert (=> b!1546496 (=> (not res!1060141) (not e!860943))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103092 0))(
  ( (array!103093 (arr!49741 (Array (_ BitVec 32) (_ BitVec 64))) (size!50292 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103092)

(assert (=> b!1546496 (= res!1060141 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50292 _keys!618))))))

(declare-fun b!1546497 () Bool)

(declare-fun res!1060140 () Bool)

(assert (=> b!1546497 (=> (not res!1060140) (not e!860943))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103092 (_ BitVec 32)) Bool)

(assert (=> b!1546497 (= res!1060140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58522 () Bool)

(assert (=> mapIsEmpty!58522 mapRes!58522))

(declare-fun b!1546498 () Bool)

(declare-fun res!1060139 () Bool)

(assert (=> b!1546498 (=> (not res!1060139) (not e!860943))))

(declare-datatypes ((List!35978 0))(
  ( (Nil!35975) (Cons!35974 (h!37437 (_ BitVec 64)) (t!50664 List!35978)) )
))
(declare-fun arrayNoDuplicates!0 (array!103092 (_ BitVec 32) List!35978) Bool)

(assert (=> b!1546498 (= res!1060139 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35975))))

(declare-fun b!1546499 () Bool)

(declare-fun e!860944 () ListLongMap!22097)

(assert (=> b!1546499 (= e!860944 call!68900)))

(declare-fun b!1546500 () Bool)

(assert (=> b!1546500 (= e!860944 call!68904)))

(declare-fun mapNonEmpty!58522 () Bool)

(declare-fun tp!111061 () Bool)

(assert (=> mapNonEmpty!58522 (= mapRes!58522 (and tp!111061 e!860946))))

(declare-fun mapKey!58522 () (_ BitVec 32))

(declare-fun mapValue!58522 () ValueCell!18029)

(declare-fun mapRest!58522 () (Array (_ BitVec 32) ValueCell!18029))

(assert (=> mapNonEmpty!58522 (= (arr!49740 _values!470) (store mapRest!58522 mapKey!58522 mapValue!58522))))

(declare-fun bm!68901 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6553 (array!103092 array!103090 (_ BitVec 32) (_ BitVec 32) V!58949 V!58949 (_ BitVec 32) Int) ListLongMap!22097)

(assert (=> bm!68901 (= call!68902 (getCurrentListMapNoExtraKeys!6553 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060142 () Bool)

(assert (=> start!132302 (=> (not res!1060142) (not e!860943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132302 (= res!1060142 (validMask!0 mask!926))))

(assert (=> start!132302 e!860943))

(declare-fun array_inv!38957 (array!103092) Bool)

(assert (=> start!132302 (array_inv!38957 _keys!618)))

(assert (=> start!132302 tp_is_empty!37879))

(assert (=> start!132302 true))

(assert (=> start!132302 tp!111060))

(declare-fun array_inv!38958 (array!103090) Bool)

(assert (=> start!132302 (and (array_inv!38958 _values!470) e!860948)))

(declare-fun b!1546501 () Bool)

(declare-fun res!1060138 () Bool)

(assert (=> b!1546501 (=> (not res!1060138) (not e!860943))))

(assert (=> b!1546501 (= res!1060138 (and (= (size!50291 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50292 _keys!618) (size!50291 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546502 () Bool)

(declare-fun c!142142 () Bool)

(assert (=> b!1546502 (= c!142142 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666990))))

(assert (=> b!1546502 (= e!860949 e!860944)))

(assert (= (and start!132302 res!1060142) b!1546501))

(assert (= (and b!1546501 res!1060138) b!1546497))

(assert (= (and b!1546497 res!1060140) b!1546498))

(assert (= (and b!1546498 res!1060139) b!1546496))

(assert (= (and b!1546496 res!1060141) b!1546493))

(assert (= (and b!1546493 c!142144) b!1546489))

(assert (= (and b!1546493 (not c!142144)) b!1546490))

(assert (= (and b!1546490 c!142143) b!1546495))

(assert (= (and b!1546490 (not c!142143)) b!1546502))

(assert (= (and b!1546502 c!142142) b!1546500))

(assert (= (and b!1546502 (not c!142142)) b!1546499))

(assert (= (or b!1546500 b!1546499) bm!68897))

(assert (= (or b!1546495 bm!68897) bm!68898))

(assert (= (or b!1546495 b!1546500) bm!68900))

(assert (= (or b!1546489 bm!68898) bm!68901))

(assert (= (or b!1546489 bm!68900) bm!68899))

(assert (= (and b!1546492 condMapEmpty!58522) mapIsEmpty!58522))

(assert (= (and b!1546492 (not condMapEmpty!58522)) mapNonEmpty!58522))

(get-info :version)

(assert (= (and mapNonEmpty!58522 ((_ is ValueCellFull!18029) mapValue!58522)) b!1546494))

(assert (= (and b!1546492 ((_ is ValueCellFull!18029) mapDefault!58522)) b!1546491))

(assert (= start!132302 b!1546492))

(declare-fun m!1427373 () Bool)

(assert (=> mapNonEmpty!58522 m!1427373))

(declare-fun m!1427375 () Bool)

(assert (=> b!1546489 m!1427375))

(declare-fun m!1427377 () Bool)

(assert (=> start!132302 m!1427377))

(declare-fun m!1427379 () Bool)

(assert (=> start!132302 m!1427379))

(declare-fun m!1427381 () Bool)

(assert (=> start!132302 m!1427381))

(declare-fun m!1427383 () Bool)

(assert (=> b!1546498 m!1427383))

(declare-fun m!1427385 () Bool)

(assert (=> bm!68899 m!1427385))

(declare-fun m!1427387 () Bool)

(assert (=> bm!68901 m!1427387))

(declare-fun m!1427389 () Bool)

(assert (=> b!1546497 m!1427389))

(check-sat b_and!51015 (not bm!68899) (not b!1546498) (not b_next!31603) (not b!1546497) (not bm!68901) (not mapNonEmpty!58522) tp_is_empty!37879 (not start!132302) (not b!1546489))
(check-sat b_and!51015 (not b_next!31603))
