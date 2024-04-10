; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132126 () Bool)

(assert start!132126)

(declare-fun b_free!31839 () Bool)

(declare-fun b_next!31839 () Bool)

(assert (=> start!132126 (= b_free!31839 (not b_next!31839))))

(declare-fun tp!111769 () Bool)

(declare-fun b_and!51249 () Bool)

(assert (=> start!132126 (= tp!111769 b_and!51249)))

(declare-fun res!1061620 () Bool)

(declare-fun e!862565 () Bool)

(assert (=> start!132126 (=> (not res!1061620) (not e!862565))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132126 (= res!1061620 (validMask!0 mask!926))))

(assert (=> start!132126 e!862565))

(declare-datatypes ((array!103426 0))(
  ( (array!103427 (arr!49915 (Array (_ BitVec 32) (_ BitVec 64))) (size!50465 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103426)

(declare-fun array_inv!38805 (array!103426) Bool)

(assert (=> start!132126 (array_inv!38805 _keys!618)))

(declare-fun tp_is_empty!38115 () Bool)

(assert (=> start!132126 tp_is_empty!38115))

(assert (=> start!132126 true))

(assert (=> start!132126 tp!111769))

(declare-datatypes ((V!59263 0))(
  ( (V!59264 (val!19135 Int)) )
))
(declare-datatypes ((ValueCell!18147 0))(
  ( (ValueCellFull!18147 (v!21936 V!59263)) (EmptyCell!18147) )
))
(declare-datatypes ((array!103428 0))(
  ( (array!103429 (arr!49916 (Array (_ BitVec 32) ValueCell!18147)) (size!50466 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103428)

(declare-fun e!862564 () Bool)

(declare-fun array_inv!38806 (array!103428) Bool)

(assert (=> start!132126 (and (array_inv!38806 _values!470) e!862564)))

(declare-fun b!1549587 () Bool)

(declare-datatypes ((tuple2!24648 0))(
  ( (tuple2!24649 (_1!12335 (_ BitVec 64)) (_2!12335 V!59263)) )
))
(declare-datatypes ((List!36132 0))(
  ( (Nil!36129) (Cons!36128 (h!37573 tuple2!24648) (t!50826 List!36132)) )
))
(declare-datatypes ((ListLongMap!22257 0))(
  ( (ListLongMap!22258 (toList!11144 List!36132)) )
))
(declare-fun e!862562 () ListLongMap!22257)

(declare-fun call!70524 () ListLongMap!22257)

(assert (=> b!1549587 (= e!862562 call!70524)))

(declare-fun bm!70517 () Bool)

(declare-fun call!70521 () ListLongMap!22257)

(declare-fun call!70523 () ListLongMap!22257)

(assert (=> bm!70517 (= call!70521 call!70523)))

(declare-fun zeroValue!436 () V!59263)

(declare-fun c!142410 () Bool)

(declare-fun bm!70518 () Bool)

(declare-fun minValue!436 () V!59263)

(declare-fun call!70520 () ListLongMap!22257)

(declare-fun c!142412 () Bool)

(declare-fun +!4970 (ListLongMap!22257 tuple2!24648) ListLongMap!22257)

(assert (=> bm!70518 (= call!70520 (+!4970 (ite c!142412 call!70523 (ite c!142410 call!70521 call!70524)) (ite (or c!142412 c!142410) (tuple2!24649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549588 () Bool)

(declare-fun c!142411 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667961 () Bool)

(assert (=> b!1549588 (= c!142411 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667961))))

(declare-fun e!862569 () ListLongMap!22257)

(assert (=> b!1549588 (= e!862569 e!862562)))

(declare-fun b!1549589 () Bool)

(declare-fun e!862567 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549589 (= e!862567 (not (validKeyInArray!0 (select (arr!49915 _keys!618) from!762))))))

(declare-fun mapNonEmpty!58876 () Bool)

(declare-fun mapRes!58876 () Bool)

(declare-fun tp!111768 () Bool)

(declare-fun e!862561 () Bool)

(assert (=> mapNonEmpty!58876 (= mapRes!58876 (and tp!111768 e!862561))))

(declare-fun mapValue!58876 () ValueCell!18147)

(declare-fun mapKey!58876 () (_ BitVec 32))

(declare-fun mapRest!58876 () (Array (_ BitVec 32) ValueCell!18147))

(assert (=> mapNonEmpty!58876 (= (arr!49916 _values!470) (store mapRest!58876 mapKey!58876 mapValue!58876))))

(declare-fun b!1549590 () Bool)

(declare-fun e!862559 () Bool)

(assert (=> b!1549590 (= e!862564 (and e!862559 mapRes!58876))))

(declare-fun condMapEmpty!58876 () Bool)

(declare-fun mapDefault!58876 () ValueCell!18147)

(assert (=> b!1549590 (= condMapEmpty!58876 (= (arr!49916 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18147)) mapDefault!58876)))))

(declare-fun b!1549591 () Bool)

(declare-fun e!862566 () ListLongMap!22257)

(assert (=> b!1549591 (= e!862566 e!862569)))

(assert (=> b!1549591 (= c!142410 (and (not lt!667961) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70519 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6595 (array!103426 array!103428 (_ BitVec 32) (_ BitVec 32) V!59263 V!59263 (_ BitVec 32) Int) ListLongMap!22257)

(assert (=> bm!70519 (= call!70523 (getCurrentListMapNoExtraKeys!6595 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58876 () Bool)

(assert (=> mapIsEmpty!58876 mapRes!58876))

(declare-fun bm!70520 () Bool)

(assert (=> bm!70520 (= call!70524 call!70521)))

(declare-fun b!1549592 () Bool)

(assert (=> b!1549592 (= e!862559 tp_is_empty!38115)))

(declare-fun b!1549593 () Bool)

(declare-fun e!862568 () Bool)

(assert (=> b!1549593 (= e!862568 false)))

(declare-fun lt!667963 () ListLongMap!22257)

(declare-fun lt!667959 () Bool)

(declare-fun contains!10090 (ListLongMap!22257 (_ BitVec 64)) Bool)

(assert (=> b!1549593 (= lt!667959 (contains!10090 lt!667963 (select (arr!49915 _keys!618) from!762)))))

(declare-fun b!1549594 () Bool)

(declare-fun res!1061616 () Bool)

(assert (=> b!1549594 (=> (not res!1061616) (not e!862565))))

(assert (=> b!1549594 (= res!1061616 (and (= (size!50466 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50465 _keys!618) (size!50466 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70521 () Bool)

(declare-fun call!70522 () ListLongMap!22257)

(assert (=> bm!70521 (= call!70522 call!70520)))

(declare-fun b!1549595 () Bool)

(declare-fun res!1061622 () Bool)

(assert (=> b!1549595 (=> (not res!1061622) (not e!862565))))

(assert (=> b!1549595 (= res!1061622 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50465 _keys!618))))))

(declare-fun b!1549596 () Bool)

(assert (=> b!1549596 (= e!862561 tp_is_empty!38115)))

(declare-fun b!1549597 () Bool)

(declare-fun res!1061617 () Bool)

(assert (=> b!1549597 (=> (not res!1061617) (not e!862565))))

(declare-datatypes ((List!36133 0))(
  ( (Nil!36130) (Cons!36129 (h!37574 (_ BitVec 64)) (t!50827 List!36133)) )
))
(declare-fun arrayNoDuplicates!0 (array!103426 (_ BitVec 32) List!36133) Bool)

(assert (=> b!1549597 (= res!1061617 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36130))))

(declare-fun b!1549598 () Bool)

(assert (=> b!1549598 (= e!862569 call!70522)))

(declare-fun b!1549599 () Bool)

(assert (=> b!1549599 (= e!862562 call!70522)))

(declare-fun b!1549600 () Bool)

(declare-fun res!1061619 () Bool)

(assert (=> b!1549600 (=> (not res!1061619) (not e!862565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103426 (_ BitVec 32)) Bool)

(assert (=> b!1549600 (= res!1061619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549601 () Bool)

(declare-datatypes ((Unit!51619 0))(
  ( (Unit!51620) )
))
(declare-fun e!862563 () Unit!51619)

(declare-fun lt!667966 () Unit!51619)

(assert (=> b!1549601 (= e!862563 lt!667966)))

(declare-fun lt!667962 () ListLongMap!22257)

(assert (=> b!1549601 (= lt!667962 (getCurrentListMapNoExtraKeys!6595 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!667956 () Unit!51619)

(declare-fun addStillContains!1278 (ListLongMap!22257 (_ BitVec 64) V!59263 (_ BitVec 64)) Unit!51619)

(assert (=> b!1549601 (= lt!667956 (addStillContains!1278 lt!667962 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49915 _keys!618) from!762)))))

(declare-fun lt!667958 () ListLongMap!22257)

(assert (=> b!1549601 (= lt!667958 (+!4970 lt!667962 (tuple2!24649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1549601 (contains!10090 lt!667958 (select (arr!49915 _keys!618) from!762))))

(declare-fun addApplyDifferent!625 (ListLongMap!22257 (_ BitVec 64) V!59263 (_ BitVec 64)) Unit!51619)

(assert (=> b!1549601 (= lt!667966 (addApplyDifferent!625 lt!667962 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49915 _keys!618) from!762)))))

(declare-fun lt!667967 () V!59263)

(declare-fun apply!1083 (ListLongMap!22257 (_ BitVec 64)) V!59263)

(assert (=> b!1549601 (= lt!667967 (apply!1083 (+!4970 lt!667962 (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49915 _keys!618) from!762)))))

(declare-fun lt!667965 () V!59263)

(assert (=> b!1549601 (= lt!667965 (apply!1083 lt!667962 (select (arr!49915 _keys!618) from!762)))))

(assert (=> b!1549601 (= lt!667967 lt!667965)))

(declare-fun lt!667960 () Unit!51619)

(assert (=> b!1549601 (= lt!667960 (addApplyDifferent!625 lt!667962 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49915 _keys!618) from!762)))))

(assert (=> b!1549601 (= (apply!1083 lt!667958 (select (arr!49915 _keys!618) from!762)) lt!667965)))

(declare-fun b!1549602 () Bool)

(assert (=> b!1549602 (= e!862566 (+!4970 call!70520 (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549603 () Bool)

(assert (=> b!1549603 (= e!862565 e!862568)))

(declare-fun res!1061618 () Bool)

(assert (=> b!1549603 (=> (not res!1061618) (not e!862568))))

(declare-fun lt!667964 () Bool)

(assert (=> b!1549603 (= res!1061618 (not lt!667964))))

(declare-fun lt!667957 () Unit!51619)

(assert (=> b!1549603 (= lt!667957 e!862563)))

(declare-fun c!142409 () Bool)

(assert (=> b!1549603 (= c!142409 (not lt!667964))))

(assert (=> b!1549603 (= lt!667964 e!862567)))

(declare-fun res!1061621 () Bool)

(assert (=> b!1549603 (=> res!1061621 e!862567)))

(assert (=> b!1549603 (= res!1061621 (bvsge from!762 (size!50465 _keys!618)))))

(assert (=> b!1549603 (= lt!667963 e!862566)))

(assert (=> b!1549603 (= c!142412 (and (not lt!667961) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549603 (= lt!667961 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549604 () Bool)

(declare-fun Unit!51621 () Unit!51619)

(assert (=> b!1549604 (= e!862563 Unit!51621)))

(assert (= (and start!132126 res!1061620) b!1549594))

(assert (= (and b!1549594 res!1061616) b!1549600))

(assert (= (and b!1549600 res!1061619) b!1549597))

(assert (= (and b!1549597 res!1061617) b!1549595))

(assert (= (and b!1549595 res!1061622) b!1549603))

(assert (= (and b!1549603 c!142412) b!1549602))

(assert (= (and b!1549603 (not c!142412)) b!1549591))

(assert (= (and b!1549591 c!142410) b!1549598))

(assert (= (and b!1549591 (not c!142410)) b!1549588))

(assert (= (and b!1549588 c!142411) b!1549599))

(assert (= (and b!1549588 (not c!142411)) b!1549587))

(assert (= (or b!1549599 b!1549587) bm!70520))

(assert (= (or b!1549598 bm!70520) bm!70517))

(assert (= (or b!1549598 b!1549599) bm!70521))

(assert (= (or b!1549602 bm!70517) bm!70519))

(assert (= (or b!1549602 bm!70521) bm!70518))

(assert (= (and b!1549603 (not res!1061621)) b!1549589))

(assert (= (and b!1549603 c!142409) b!1549601))

(assert (= (and b!1549603 (not c!142409)) b!1549604))

(assert (= (and b!1549603 res!1061618) b!1549593))

(assert (= (and b!1549590 condMapEmpty!58876) mapIsEmpty!58876))

(assert (= (and b!1549590 (not condMapEmpty!58876)) mapNonEmpty!58876))

(get-info :version)

(assert (= (and mapNonEmpty!58876 ((_ is ValueCellFull!18147) mapValue!58876)) b!1549596))

(assert (= (and b!1549590 ((_ is ValueCellFull!18147) mapDefault!58876)) b!1549592))

(assert (= start!132126 b!1549590))

(declare-fun m!1428799 () Bool)

(assert (=> b!1549597 m!1428799))

(declare-fun m!1428801 () Bool)

(assert (=> mapNonEmpty!58876 m!1428801))

(declare-fun m!1428803 () Bool)

(assert (=> b!1549593 m!1428803))

(assert (=> b!1549593 m!1428803))

(declare-fun m!1428805 () Bool)

(assert (=> b!1549593 m!1428805))

(declare-fun m!1428807 () Bool)

(assert (=> start!132126 m!1428807))

(declare-fun m!1428809 () Bool)

(assert (=> start!132126 m!1428809))

(declare-fun m!1428811 () Bool)

(assert (=> start!132126 m!1428811))

(declare-fun m!1428813 () Bool)

(assert (=> b!1549600 m!1428813))

(declare-fun m!1428815 () Bool)

(assert (=> b!1549602 m!1428815))

(declare-fun m!1428817 () Bool)

(assert (=> bm!70518 m!1428817))

(assert (=> b!1549589 m!1428803))

(assert (=> b!1549589 m!1428803))

(declare-fun m!1428819 () Bool)

(assert (=> b!1549589 m!1428819))

(declare-fun m!1428821 () Bool)

(assert (=> bm!70519 m!1428821))

(declare-fun m!1428823 () Bool)

(assert (=> b!1549601 m!1428823))

(assert (=> b!1549601 m!1428821))

(declare-fun m!1428825 () Bool)

(assert (=> b!1549601 m!1428825))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428827 () Bool)

(assert (=> b!1549601 m!1428827))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428829 () Bool)

(assert (=> b!1549601 m!1428829))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428831 () Bool)

(assert (=> b!1549601 m!1428831))

(assert (=> b!1549601 m!1428825))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428833 () Bool)

(assert (=> b!1549601 m!1428833))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428835 () Bool)

(assert (=> b!1549601 m!1428835))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428837 () Bool)

(assert (=> b!1549601 m!1428837))

(assert (=> b!1549601 m!1428803))

(assert (=> b!1549601 m!1428803))

(declare-fun m!1428839 () Bool)

(assert (=> b!1549601 m!1428839))

(check-sat (not b!1549601) (not start!132126) (not b!1549602) (not bm!70518) (not b!1549597) (not bm!70519) tp_is_empty!38115 (not b!1549589) (not b!1549600) (not b_next!31839) (not mapNonEmpty!58876) (not b!1549593) b_and!51249)
(check-sat b_and!51249 (not b_next!31839))
