; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131934 () Bool)

(assert start!131934)

(declare-fun b_free!31647 () Bool)

(declare-fun b_next!31647 () Bool)

(assert (=> start!131934 (= b_free!31647 (not b_next!31647))))

(declare-fun tp!111192 () Bool)

(declare-fun b_and!51057 () Bool)

(assert (=> start!131934 (= tp!111192 b_and!51057)))

(declare-fun b!1544977 () Bool)

(declare-fun e!859967 () Bool)

(assert (=> b!1544977 (= e!859967 false)))

(declare-datatypes ((V!59007 0))(
  ( (V!59008 (val!19039 Int)) )
))
(declare-datatypes ((tuple2!24462 0))(
  ( (tuple2!24463 (_1!12242 (_ BitVec 64)) (_2!12242 V!59007)) )
))
(declare-datatypes ((List!35974 0))(
  ( (Nil!35971) (Cons!35970 (h!37415 tuple2!24462) (t!50668 List!35974)) )
))
(declare-datatypes ((ListLongMap!22071 0))(
  ( (ListLongMap!22072 (toList!11051 List!35974)) )
))
(declare-fun lt!666214 () ListLongMap!22071)

(declare-fun e!859965 () ListLongMap!22071)

(assert (=> b!1544977 (= lt!666214 e!859965)))

(declare-fun c!141540 () Bool)

(declare-fun lt!666215 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544977 (= c!141540 (and (not lt!666215) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544977 (= lt!666215 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!141542 () Bool)

(declare-fun zeroValue!436 () V!59007)

(declare-fun call!69080 () ListLongMap!22071)

(declare-fun call!69082 () ListLongMap!22071)

(declare-fun call!69083 () ListLongMap!22071)

(declare-fun call!69084 () ListLongMap!22071)

(declare-fun minValue!436 () V!59007)

(declare-fun bm!69077 () Bool)

(declare-fun +!4887 (ListLongMap!22071 tuple2!24462) ListLongMap!22071)

(assert (=> bm!69077 (= call!69084 (+!4887 (ite c!141540 call!69080 (ite c!141542 call!69082 call!69083)) (ite (or c!141540 c!141542) (tuple2!24463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69078 () Bool)

(assert (=> bm!69078 (= call!69083 call!69082)))

(declare-fun b!1544978 () Bool)

(declare-fun res!1059610 () Bool)

(assert (=> b!1544978 (=> (not res!1059610) (not e!859967))))

(declare-datatypes ((array!103054 0))(
  ( (array!103055 (arr!49729 (Array (_ BitVec 32) (_ BitVec 64))) (size!50279 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103054)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18051 0))(
  ( (ValueCellFull!18051 (v!21840 V!59007)) (EmptyCell!18051) )
))
(declare-datatypes ((array!103056 0))(
  ( (array!103057 (arr!49730 (Array (_ BitVec 32) ValueCell!18051)) (size!50280 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103056)

(assert (=> b!1544978 (= res!1059610 (and (= (size!50280 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50279 _keys!618) (size!50280 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69079 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6521 (array!103054 array!103056 (_ BitVec 32) (_ BitVec 32) V!59007 V!59007 (_ BitVec 32) Int) ListLongMap!22071)

(assert (=> bm!69079 (= call!69080 (getCurrentListMapNoExtraKeys!6521 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69080 () Bool)

(declare-fun call!69081 () ListLongMap!22071)

(assert (=> bm!69080 (= call!69081 call!69084)))

(declare-fun b!1544979 () Bool)

(declare-fun e!859963 () ListLongMap!22071)

(assert (=> b!1544979 (= e!859965 e!859963)))

(assert (=> b!1544979 (= c!141542 (and (not lt!666215) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544980 () Bool)

(declare-fun res!1059612 () Bool)

(assert (=> b!1544980 (=> (not res!1059612) (not e!859967))))

(assert (=> b!1544980 (= res!1059612 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50279 _keys!618))))))

(declare-fun b!1544981 () Bool)

(declare-fun res!1059611 () Bool)

(assert (=> b!1544981 (=> (not res!1059611) (not e!859967))))

(declare-datatypes ((List!35975 0))(
  ( (Nil!35972) (Cons!35971 (h!37416 (_ BitVec 64)) (t!50669 List!35975)) )
))
(declare-fun arrayNoDuplicates!0 (array!103054 (_ BitVec 32) List!35975) Bool)

(assert (=> b!1544981 (= res!1059611 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35972))))

(declare-fun res!1059608 () Bool)

(assert (=> start!131934 (=> (not res!1059608) (not e!859967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131934 (= res!1059608 (validMask!0 mask!926))))

(assert (=> start!131934 e!859967))

(declare-fun array_inv!38681 (array!103054) Bool)

(assert (=> start!131934 (array_inv!38681 _keys!618)))

(declare-fun tp_is_empty!37923 () Bool)

(assert (=> start!131934 tp_is_empty!37923))

(assert (=> start!131934 true))

(assert (=> start!131934 tp!111192))

(declare-fun e!859968 () Bool)

(declare-fun array_inv!38682 (array!103056) Bool)

(assert (=> start!131934 (and (array_inv!38682 _values!470) e!859968)))

(declare-fun b!1544982 () Bool)

(assert (=> b!1544982 (= e!859965 (+!4887 call!69084 (tuple2!24463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58588 () Bool)

(declare-fun mapRes!58588 () Bool)

(assert (=> mapIsEmpty!58588 mapRes!58588))

(declare-fun b!1544983 () Bool)

(declare-fun res!1059609 () Bool)

(assert (=> b!1544983 (=> (not res!1059609) (not e!859967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103054 (_ BitVec 32)) Bool)

(assert (=> b!1544983 (= res!1059609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544984 () Bool)

(assert (=> b!1544984 (= e!859963 call!69081)))

(declare-fun b!1544985 () Bool)

(declare-fun e!859966 () ListLongMap!22071)

(assert (=> b!1544985 (= e!859966 call!69083)))

(declare-fun b!1544986 () Bool)

(assert (=> b!1544986 (= e!859966 call!69081)))

(declare-fun b!1544987 () Bool)

(declare-fun e!859961 () Bool)

(assert (=> b!1544987 (= e!859968 (and e!859961 mapRes!58588))))

(declare-fun condMapEmpty!58588 () Bool)

(declare-fun mapDefault!58588 () ValueCell!18051)

(assert (=> b!1544987 (= condMapEmpty!58588 (= (arr!49730 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18051)) mapDefault!58588)))))

(declare-fun bm!69081 () Bool)

(assert (=> bm!69081 (= call!69082 call!69080)))

(declare-fun mapNonEmpty!58588 () Bool)

(declare-fun tp!111193 () Bool)

(declare-fun e!859964 () Bool)

(assert (=> mapNonEmpty!58588 (= mapRes!58588 (and tp!111193 e!859964))))

(declare-fun mapRest!58588 () (Array (_ BitVec 32) ValueCell!18051))

(declare-fun mapValue!58588 () ValueCell!18051)

(declare-fun mapKey!58588 () (_ BitVec 32))

(assert (=> mapNonEmpty!58588 (= (arr!49730 _values!470) (store mapRest!58588 mapKey!58588 mapValue!58588))))

(declare-fun b!1544988 () Bool)

(assert (=> b!1544988 (= e!859961 tp_is_empty!37923)))

(declare-fun b!1544989 () Bool)

(assert (=> b!1544989 (= e!859964 tp_is_empty!37923)))

(declare-fun b!1544990 () Bool)

(declare-fun c!141541 () Bool)

(assert (=> b!1544990 (= c!141541 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666215))))

(assert (=> b!1544990 (= e!859963 e!859966)))

(assert (= (and start!131934 res!1059608) b!1544978))

(assert (= (and b!1544978 res!1059610) b!1544983))

(assert (= (and b!1544983 res!1059609) b!1544981))

(assert (= (and b!1544981 res!1059611) b!1544980))

(assert (= (and b!1544980 res!1059612) b!1544977))

(assert (= (and b!1544977 c!141540) b!1544982))

(assert (= (and b!1544977 (not c!141540)) b!1544979))

(assert (= (and b!1544979 c!141542) b!1544984))

(assert (= (and b!1544979 (not c!141542)) b!1544990))

(assert (= (and b!1544990 c!141541) b!1544986))

(assert (= (and b!1544990 (not c!141541)) b!1544985))

(assert (= (or b!1544986 b!1544985) bm!69078))

(assert (= (or b!1544984 bm!69078) bm!69081))

(assert (= (or b!1544984 b!1544986) bm!69080))

(assert (= (or b!1544982 bm!69081) bm!69079))

(assert (= (or b!1544982 bm!69080) bm!69077))

(assert (= (and b!1544987 condMapEmpty!58588) mapIsEmpty!58588))

(assert (= (and b!1544987 (not condMapEmpty!58588)) mapNonEmpty!58588))

(get-info :version)

(assert (= (and mapNonEmpty!58588 ((_ is ValueCellFull!18051) mapValue!58588)) b!1544989))

(assert (= (and b!1544987 ((_ is ValueCellFull!18051) mapDefault!58588)) b!1544988))

(assert (= start!131934 b!1544987))

(declare-fun m!1425511 () Bool)

(assert (=> b!1544983 m!1425511))

(declare-fun m!1425513 () Bool)

(assert (=> bm!69079 m!1425513))

(declare-fun m!1425515 () Bool)

(assert (=> start!131934 m!1425515))

(declare-fun m!1425517 () Bool)

(assert (=> start!131934 m!1425517))

(declare-fun m!1425519 () Bool)

(assert (=> start!131934 m!1425519))

(declare-fun m!1425521 () Bool)

(assert (=> mapNonEmpty!58588 m!1425521))

(declare-fun m!1425523 () Bool)

(assert (=> b!1544981 m!1425523))

(declare-fun m!1425525 () Bool)

(assert (=> b!1544982 m!1425525))

(declare-fun m!1425527 () Bool)

(assert (=> bm!69077 m!1425527))

(check-sat (not b!1544981) b_and!51057 (not start!131934) tp_is_empty!37923 (not bm!69079) (not mapNonEmpty!58588) (not b!1544982) (not b!1544983) (not bm!69077) (not b_next!31647))
(check-sat b_and!51057 (not b_next!31647))
