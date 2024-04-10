; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131922 () Bool)

(assert start!131922)

(declare-fun b_free!31635 () Bool)

(declare-fun b_next!31635 () Bool)

(assert (=> start!131922 (= b_free!31635 (not b_next!31635))))

(declare-fun tp!111156 () Bool)

(declare-fun b_and!51045 () Bool)

(assert (=> start!131922 (= tp!111156 b_and!51045)))

(declare-fun mapNonEmpty!58570 () Bool)

(declare-fun mapRes!58570 () Bool)

(declare-fun tp!111157 () Bool)

(declare-fun e!859820 () Bool)

(assert (=> mapNonEmpty!58570 (= mapRes!58570 (and tp!111157 e!859820))))

(declare-datatypes ((V!58991 0))(
  ( (V!58992 (val!19033 Int)) )
))
(declare-datatypes ((ValueCell!18045 0))(
  ( (ValueCellFull!18045 (v!21834 V!58991)) (EmptyCell!18045) )
))
(declare-fun mapValue!58570 () ValueCell!18045)

(declare-fun mapKey!58570 () (_ BitVec 32))

(declare-fun mapRest!58570 () (Array (_ BitVec 32) ValueCell!18045))

(declare-datatypes ((array!103030 0))(
  ( (array!103031 (arr!49717 (Array (_ BitVec 32) ValueCell!18045)) (size!50267 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103030)

(assert (=> mapNonEmpty!58570 (= (arr!49717 _values!470) (store mapRest!58570 mapKey!58570 mapValue!58570))))

(declare-fun b!1544725 () Bool)

(declare-datatypes ((tuple2!24452 0))(
  ( (tuple2!24453 (_1!12237 (_ BitVec 64)) (_2!12237 V!58991)) )
))
(declare-datatypes ((List!35967 0))(
  ( (Nil!35964) (Cons!35963 (h!37408 tuple2!24452) (t!50661 List!35967)) )
))
(declare-datatypes ((ListLongMap!22061 0))(
  ( (ListLongMap!22062 (toList!11046 List!35967)) )
))
(declare-fun e!859824 () ListLongMap!22061)

(declare-fun call!68991 () ListLongMap!22061)

(declare-fun minValue!436 () V!58991)

(declare-fun +!4882 (ListLongMap!22061 tuple2!24452) ListLongMap!22061)

(assert (=> b!1544725 (= e!859824 (+!4882 call!68991 (tuple2!24453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544726 () Bool)

(declare-fun e!859819 () Bool)

(assert (=> b!1544726 (= e!859819 false)))

(declare-fun lt!666178 () ListLongMap!22061)

(assert (=> b!1544726 (= lt!666178 e!859824)))

(declare-fun c!141486 () Bool)

(declare-fun lt!666179 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544726 (= c!141486 (and (not lt!666179) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544726 (= lt!666179 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544727 () Bool)

(declare-fun e!859821 () Bool)

(declare-fun e!859818 () Bool)

(assert (=> b!1544727 (= e!859821 (and e!859818 mapRes!58570))))

(declare-fun condMapEmpty!58570 () Bool)

(declare-fun mapDefault!58570 () ValueCell!18045)

(assert (=> b!1544727 (= condMapEmpty!58570 (= (arr!49717 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18045)) mapDefault!58570)))))

(declare-fun b!1544728 () Bool)

(declare-fun res!1059522 () Bool)

(assert (=> b!1544728 (=> (not res!1059522) (not e!859819))))

(declare-datatypes ((array!103032 0))(
  ( (array!103033 (arr!49718 (Array (_ BitVec 32) (_ BitVec 64))) (size!50268 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103032)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103032 (_ BitVec 32)) Bool)

(assert (=> b!1544728 (= res!1059522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68987 () Bool)

(declare-fun call!68993 () ListLongMap!22061)

(assert (=> bm!68987 (= call!68993 call!68991)))

(declare-fun mapIsEmpty!58570 () Bool)

(assert (=> mapIsEmpty!58570 mapRes!58570))

(declare-fun res!1059520 () Bool)

(assert (=> start!131922 (=> (not res!1059520) (not e!859819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131922 (= res!1059520 (validMask!0 mask!926))))

(assert (=> start!131922 e!859819))

(declare-fun array_inv!38671 (array!103032) Bool)

(assert (=> start!131922 (array_inv!38671 _keys!618)))

(declare-fun tp_is_empty!37911 () Bool)

(assert (=> start!131922 tp_is_empty!37911))

(assert (=> start!131922 true))

(assert (=> start!131922 tp!111156))

(declare-fun array_inv!38672 (array!103030) Bool)

(assert (=> start!131922 (and (array_inv!38672 _values!470) e!859821)))

(declare-fun b!1544729 () Bool)

(declare-fun e!859822 () ListLongMap!22061)

(assert (=> b!1544729 (= e!859824 e!859822)))

(declare-fun c!141488 () Bool)

(assert (=> b!1544729 (= c!141488 (and (not lt!666179) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544730 () Bool)

(assert (=> b!1544730 (= e!859818 tp_is_empty!37911)))

(declare-fun b!1544731 () Bool)

(declare-fun res!1059519 () Bool)

(assert (=> b!1544731 (=> (not res!1059519) (not e!859819))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544731 (= res!1059519 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50268 _keys!618))))))

(declare-fun b!1544732 () Bool)

(declare-fun e!859823 () ListLongMap!22061)

(assert (=> b!1544732 (= e!859823 call!68993)))

(declare-fun b!1544733 () Bool)

(declare-fun res!1059518 () Bool)

(assert (=> b!1544733 (=> (not res!1059518) (not e!859819))))

(declare-datatypes ((List!35968 0))(
  ( (Nil!35965) (Cons!35964 (h!37409 (_ BitVec 64)) (t!50662 List!35968)) )
))
(declare-fun arrayNoDuplicates!0 (array!103032 (_ BitVec 32) List!35968) Bool)

(assert (=> b!1544733 (= res!1059518 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35965))))

(declare-fun b!1544734 () Bool)

(declare-fun res!1059521 () Bool)

(assert (=> b!1544734 (=> (not res!1059521) (not e!859819))))

(assert (=> b!1544734 (= res!1059521 (and (= (size!50267 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50268 _keys!618) (size!50267 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!68988 () Bool)

(declare-fun call!68992 () ListLongMap!22061)

(declare-fun call!68990 () ListLongMap!22061)

(assert (=> bm!68988 (= call!68992 call!68990)))

(declare-fun b!1544735 () Bool)

(declare-fun c!141487 () Bool)

(assert (=> b!1544735 (= c!141487 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666179))))

(assert (=> b!1544735 (= e!859822 e!859823)))

(declare-fun b!1544736 () Bool)

(assert (=> b!1544736 (= e!859822 call!68993)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68989 () Bool)

(declare-fun zeroValue!436 () V!58991)

(declare-fun getCurrentListMapNoExtraKeys!6516 (array!103032 array!103030 (_ BitVec 32) (_ BitVec 32) V!58991 V!58991 (_ BitVec 32) Int) ListLongMap!22061)

(assert (=> bm!68989 (= call!68990 (getCurrentListMapNoExtraKeys!6516 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544737 () Bool)

(declare-fun call!68994 () ListLongMap!22061)

(assert (=> b!1544737 (= e!859823 call!68994)))

(declare-fun b!1544738 () Bool)

(assert (=> b!1544738 (= e!859820 tp_is_empty!37911)))

(declare-fun bm!68990 () Bool)

(assert (=> bm!68990 (= call!68991 (+!4882 (ite c!141486 call!68990 (ite c!141488 call!68992 call!68994)) (ite (or c!141486 c!141488) (tuple2!24453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68991 () Bool)

(assert (=> bm!68991 (= call!68994 call!68992)))

(assert (= (and start!131922 res!1059520) b!1544734))

(assert (= (and b!1544734 res!1059521) b!1544728))

(assert (= (and b!1544728 res!1059522) b!1544733))

(assert (= (and b!1544733 res!1059518) b!1544731))

(assert (= (and b!1544731 res!1059519) b!1544726))

(assert (= (and b!1544726 c!141486) b!1544725))

(assert (= (and b!1544726 (not c!141486)) b!1544729))

(assert (= (and b!1544729 c!141488) b!1544736))

(assert (= (and b!1544729 (not c!141488)) b!1544735))

(assert (= (and b!1544735 c!141487) b!1544732))

(assert (= (and b!1544735 (not c!141487)) b!1544737))

(assert (= (or b!1544732 b!1544737) bm!68991))

(assert (= (or b!1544736 bm!68991) bm!68988))

(assert (= (or b!1544736 b!1544732) bm!68987))

(assert (= (or b!1544725 bm!68988) bm!68989))

(assert (= (or b!1544725 bm!68987) bm!68990))

(assert (= (and b!1544727 condMapEmpty!58570) mapIsEmpty!58570))

(assert (= (and b!1544727 (not condMapEmpty!58570)) mapNonEmpty!58570))

(get-info :version)

(assert (= (and mapNonEmpty!58570 ((_ is ValueCellFull!18045) mapValue!58570)) b!1544738))

(assert (= (and b!1544727 ((_ is ValueCellFull!18045) mapDefault!58570)) b!1544730))

(assert (= start!131922 b!1544727))

(declare-fun m!1425403 () Bool)

(assert (=> mapNonEmpty!58570 m!1425403))

(declare-fun m!1425405 () Bool)

(assert (=> start!131922 m!1425405))

(declare-fun m!1425407 () Bool)

(assert (=> start!131922 m!1425407))

(declare-fun m!1425409 () Bool)

(assert (=> start!131922 m!1425409))

(declare-fun m!1425411 () Bool)

(assert (=> b!1544725 m!1425411))

(declare-fun m!1425413 () Bool)

(assert (=> bm!68990 m!1425413))

(declare-fun m!1425415 () Bool)

(assert (=> bm!68989 m!1425415))

(declare-fun m!1425417 () Bool)

(assert (=> b!1544728 m!1425417))

(declare-fun m!1425419 () Bool)

(assert (=> b!1544733 m!1425419))

(check-sat (not b!1544733) (not start!131922) (not b!1544728) (not b!1544725) (not b_next!31635) (not bm!68989) tp_is_empty!37911 (not mapNonEmpty!58570) b_and!51045 (not bm!68990))
(check-sat b_and!51045 (not b_next!31635))
