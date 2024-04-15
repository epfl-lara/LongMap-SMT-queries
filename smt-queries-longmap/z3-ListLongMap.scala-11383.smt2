; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132238 () Bool)

(assert start!132238)

(declare-fun b_free!31915 () Bool)

(declare-fun b_next!31915 () Bool)

(assert (=> start!132238 (= b_free!31915 (not b_next!31915))))

(declare-fun tp!112010 () Bool)

(declare-fun b_and!51335 () Bool)

(assert (=> start!132238 (= tp!112010 b_and!51335)))

(declare-fun b!1551655 () Bool)

(declare-fun res!1062532 () Bool)

(declare-fun e!863771 () Bool)

(assert (=> b!1551655 (=> (not res!1062532) (not e!863771))))

(declare-datatypes ((array!103508 0))(
  ( (array!103509 (arr!49953 (Array (_ BitVec 32) (_ BitVec 64))) (size!50505 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103508)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103508 (_ BitVec 32)) Bool)

(assert (=> b!1551655 (= res!1062532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551656 () Bool)

(declare-datatypes ((V!59365 0))(
  ( (V!59366 (val!19173 Int)) )
))
(declare-datatypes ((tuple2!24796 0))(
  ( (tuple2!24797 (_1!12409 (_ BitVec 64)) (_2!12409 V!59365)) )
))
(declare-datatypes ((List!36244 0))(
  ( (Nil!36241) (Cons!36240 (h!37686 tuple2!24796) (t!50950 List!36244)) )
))
(declare-datatypes ((ListLongMap!22405 0))(
  ( (ListLongMap!22406 (toList!11218 List!36244)) )
))
(declare-fun e!863773 () ListLongMap!22405)

(declare-fun call!71101 () ListLongMap!22405)

(assert (=> b!1551656 (= e!863773 call!71101)))

(declare-fun b!1551657 () Bool)

(declare-fun res!1062528 () Bool)

(assert (=> b!1551657 (=> (not res!1062528) (not e!863771))))

(declare-datatypes ((List!36245 0))(
  ( (Nil!36242) (Cons!36241 (h!37687 (_ BitVec 64)) (t!50951 List!36245)) )
))
(declare-fun arrayNoDuplicates!0 (array!103508 (_ BitVec 32) List!36245) Bool)

(assert (=> b!1551657 (= res!1062528 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36242))))

(declare-fun b!1551658 () Bool)

(declare-fun e!863766 () ListLongMap!22405)

(assert (=> b!1551658 (= e!863766 call!71101)))

(declare-fun b!1551659 () Bool)

(declare-fun e!863765 () ListLongMap!22405)

(assert (=> b!1551659 (= e!863765 e!863773)))

(declare-fun c!142791 () Bool)

(declare-fun lt!668714 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551659 (= c!142791 (and (not lt!668714) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!436 () V!59365)

(declare-fun call!71103 () ListLongMap!22405)

(declare-fun bm!71097 () Bool)

(declare-fun c!142794 () Bool)

(declare-fun call!71104 () ListLongMap!22405)

(declare-fun call!71100 () ListLongMap!22405)

(declare-fun minValue!436 () V!59365)

(declare-fun call!71102 () ListLongMap!22405)

(declare-fun +!5033 (ListLongMap!22405 tuple2!24796) ListLongMap!22405)

(assert (=> bm!71097 (= call!71104 (+!5033 (ite c!142794 call!71102 (ite c!142791 call!71100 call!71103)) (ite (or c!142794 c!142791) (tuple2!24797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551660 () Bool)

(declare-fun e!863772 () Bool)

(declare-fun e!863767 () Bool)

(declare-fun mapRes!59002 () Bool)

(assert (=> b!1551660 (= e!863772 (and e!863767 mapRes!59002))))

(declare-fun condMapEmpty!59002 () Bool)

(declare-datatypes ((ValueCell!18185 0))(
  ( (ValueCellFull!18185 (v!21974 V!59365)) (EmptyCell!18185) )
))
(declare-datatypes ((array!103510 0))(
  ( (array!103511 (arr!49954 (Array (_ BitVec 32) ValueCell!18185)) (size!50506 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103510)

(declare-fun mapDefault!59002 () ValueCell!18185)

(assert (=> b!1551660 (= condMapEmpty!59002 (= (arr!49954 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18185)) mapDefault!59002)))))

(declare-fun bm!71098 () Bool)

(assert (=> bm!71098 (= call!71103 call!71100)))

(declare-fun b!1551661 () Bool)

(assert (=> b!1551661 (= e!863771 false)))

(declare-datatypes ((Unit!51503 0))(
  ( (Unit!51504) )
))
(declare-fun lt!668712 () Unit!51503)

(declare-fun e!863770 () Unit!51503)

(assert (=> b!1551661 (= lt!668712 e!863770)))

(declare-fun c!142792 () Bool)

(declare-fun e!863769 () Bool)

(assert (=> b!1551661 (= c!142792 e!863769)))

(declare-fun res!1062529 () Bool)

(assert (=> b!1551661 (=> (not res!1062529) (not e!863769))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1551661 (= res!1062529 (bvslt from!762 (size!50505 _keys!618)))))

(declare-fun lt!668715 () ListLongMap!22405)

(assert (=> b!1551661 (= lt!668715 e!863765)))

(assert (=> b!1551661 (= c!142794 (and (not lt!668714) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551661 (= lt!668714 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!71099 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6653 (array!103508 array!103510 (_ BitVec 32) (_ BitVec 32) V!59365 V!59365 (_ BitVec 32) Int) ListLongMap!22405)

(assert (=> bm!71099 (= call!71102 (getCurrentListMapNoExtraKeys!6653 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71100 () Bool)

(assert (=> bm!71100 (= call!71101 call!71104)))

(declare-fun b!1551662 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551662 (= e!863769 (validKeyInArray!0 (select (arr!49953 _keys!618) from!762)))))

(declare-fun b!1551664 () Bool)

(declare-fun Unit!51505 () Unit!51503)

(assert (=> b!1551664 (= e!863770 Unit!51505)))

(declare-fun mapNonEmpty!59002 () Bool)

(declare-fun tp!112009 () Bool)

(declare-fun e!863768 () Bool)

(assert (=> mapNonEmpty!59002 (= mapRes!59002 (and tp!112009 e!863768))))

(declare-fun mapKey!59002 () (_ BitVec 32))

(declare-fun mapRest!59002 () (Array (_ BitVec 32) ValueCell!18185))

(declare-fun mapValue!59002 () ValueCell!18185)

(assert (=> mapNonEmpty!59002 (= (arr!49954 _values!470) (store mapRest!59002 mapKey!59002 mapValue!59002))))

(declare-fun b!1551665 () Bool)

(declare-fun res!1062531 () Bool)

(assert (=> b!1551665 (=> (not res!1062531) (not e!863771))))

(assert (=> b!1551665 (= res!1062531 (and (= (size!50506 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50505 _keys!618) (size!50506 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!71101 () Bool)

(assert (=> bm!71101 (= call!71100 call!71102)))

(declare-fun mapIsEmpty!59002 () Bool)

(assert (=> mapIsEmpty!59002 mapRes!59002))

(declare-fun b!1551666 () Bool)

(assert (=> b!1551666 (= e!863766 call!71103)))

(declare-fun b!1551667 () Bool)

(declare-fun c!142793 () Bool)

(assert (=> b!1551667 (= c!142793 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668714))))

(assert (=> b!1551667 (= e!863773 e!863766)))

(declare-fun b!1551668 () Bool)

(declare-fun tp_is_empty!38191 () Bool)

(assert (=> b!1551668 (= e!863768 tp_is_empty!38191)))

(declare-fun b!1551669 () Bool)

(assert (=> b!1551669 (= e!863765 (+!5033 call!71104 (tuple2!24797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551670 () Bool)

(assert (=> b!1551670 (= e!863767 tp_is_empty!38191)))

(declare-fun b!1551671 () Bool)

(declare-fun res!1062530 () Bool)

(assert (=> b!1551671 (=> (not res!1062530) (not e!863771))))

(assert (=> b!1551671 (= res!1062530 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50505 _keys!618))))))

(declare-fun res!1062527 () Bool)

(assert (=> start!132238 (=> (not res!1062527) (not e!863771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132238 (= res!1062527 (validMask!0 mask!926))))

(assert (=> start!132238 e!863771))

(declare-fun array_inv!39033 (array!103508) Bool)

(assert (=> start!132238 (array_inv!39033 _keys!618)))

(assert (=> start!132238 tp_is_empty!38191))

(assert (=> start!132238 true))

(assert (=> start!132238 tp!112010))

(declare-fun array_inv!39034 (array!103510) Bool)

(assert (=> start!132238 (and (array_inv!39034 _values!470) e!863772)))

(declare-fun b!1551663 () Bool)

(declare-fun lt!668713 () Unit!51503)

(assert (=> b!1551663 (= e!863770 lt!668713)))

(declare-fun lt!668716 () ListLongMap!22405)

(assert (=> b!1551663 (= lt!668716 (getCurrentListMapNoExtraKeys!6653 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668717 () Unit!51503)

(declare-fun addStillContains!1292 (ListLongMap!22405 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51503)

(assert (=> b!1551663 (= lt!668717 (addStillContains!1292 lt!668716 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49953 _keys!618) from!762)))))

(declare-fun lt!668711 () ListLongMap!22405)

(assert (=> b!1551663 (= lt!668711 (+!5033 lt!668716 (tuple2!24797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10081 (ListLongMap!22405 (_ BitVec 64)) Bool)

(assert (=> b!1551663 (contains!10081 lt!668711 (select (arr!49953 _keys!618) from!762))))

(declare-fun addApplyDifferent!627 (ListLongMap!22405 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51503)

(assert (=> b!1551663 (= lt!668713 (addApplyDifferent!627 lt!668716 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49953 _keys!618) from!762)))))

(declare-fun lt!668719 () V!59365)

(declare-fun apply!1091 (ListLongMap!22405 (_ BitVec 64)) V!59365)

(assert (=> b!1551663 (= lt!668719 (apply!1091 (+!5033 lt!668716 (tuple2!24797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49953 _keys!618) from!762)))))

(declare-fun lt!668718 () V!59365)

(assert (=> b!1551663 (= lt!668718 (apply!1091 lt!668716 (select (arr!49953 _keys!618) from!762)))))

(assert (=> b!1551663 (= lt!668719 lt!668718)))

(declare-fun lt!668720 () Unit!51503)

(assert (=> b!1551663 (= lt!668720 (addApplyDifferent!627 lt!668716 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49953 _keys!618) from!762)))))

(assert (=> b!1551663 (= (apply!1091 lt!668711 (select (arr!49953 _keys!618) from!762)) lt!668718)))

(assert (= (and start!132238 res!1062527) b!1551665))

(assert (= (and b!1551665 res!1062531) b!1551655))

(assert (= (and b!1551655 res!1062532) b!1551657))

(assert (= (and b!1551657 res!1062528) b!1551671))

(assert (= (and b!1551671 res!1062530) b!1551661))

(assert (= (and b!1551661 c!142794) b!1551669))

(assert (= (and b!1551661 (not c!142794)) b!1551659))

(assert (= (and b!1551659 c!142791) b!1551656))

(assert (= (and b!1551659 (not c!142791)) b!1551667))

(assert (= (and b!1551667 c!142793) b!1551658))

(assert (= (and b!1551667 (not c!142793)) b!1551666))

(assert (= (or b!1551658 b!1551666) bm!71098))

(assert (= (or b!1551656 bm!71098) bm!71101))

(assert (= (or b!1551656 b!1551658) bm!71100))

(assert (= (or b!1551669 bm!71101) bm!71099))

(assert (= (or b!1551669 bm!71100) bm!71097))

(assert (= (and b!1551661 res!1062529) b!1551662))

(assert (= (and b!1551661 c!142792) b!1551663))

(assert (= (and b!1551661 (not c!142792)) b!1551664))

(assert (= (and b!1551660 condMapEmpty!59002) mapIsEmpty!59002))

(assert (= (and b!1551660 (not condMapEmpty!59002)) mapNonEmpty!59002))

(get-info :version)

(assert (= (and mapNonEmpty!59002 ((_ is ValueCellFull!18185) mapValue!59002)) b!1551668))

(assert (= (and b!1551660 ((_ is ValueCellFull!18185) mapDefault!59002)) b!1551670))

(assert (= start!132238 b!1551660))

(declare-fun m!1429687 () Bool)

(assert (=> b!1551662 m!1429687))

(assert (=> b!1551662 m!1429687))

(declare-fun m!1429689 () Bool)

(assert (=> b!1551662 m!1429689))

(declare-fun m!1429691 () Bool)

(assert (=> start!132238 m!1429691))

(declare-fun m!1429693 () Bool)

(assert (=> start!132238 m!1429693))

(declare-fun m!1429695 () Bool)

(assert (=> start!132238 m!1429695))

(declare-fun m!1429697 () Bool)

(assert (=> b!1551657 m!1429697))

(declare-fun m!1429699 () Bool)

(assert (=> b!1551655 m!1429699))

(declare-fun m!1429701 () Bool)

(assert (=> b!1551669 m!1429701))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429703 () Bool)

(assert (=> b!1551663 m!1429703))

(declare-fun m!1429705 () Bool)

(assert (=> b!1551663 m!1429705))

(assert (=> b!1551663 m!1429687))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429707 () Bool)

(assert (=> b!1551663 m!1429707))

(declare-fun m!1429709 () Bool)

(assert (=> b!1551663 m!1429709))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429711 () Bool)

(assert (=> b!1551663 m!1429711))

(assert (=> b!1551663 m!1429709))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429713 () Bool)

(assert (=> b!1551663 m!1429713))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429715 () Bool)

(assert (=> b!1551663 m!1429715))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429717 () Bool)

(assert (=> b!1551663 m!1429717))

(declare-fun m!1429719 () Bool)

(assert (=> b!1551663 m!1429719))

(assert (=> b!1551663 m!1429687))

(declare-fun m!1429721 () Bool)

(assert (=> b!1551663 m!1429721))

(assert (=> bm!71099 m!1429705))

(declare-fun m!1429723 () Bool)

(assert (=> mapNonEmpty!59002 m!1429723))

(declare-fun m!1429725 () Bool)

(assert (=> bm!71097 m!1429725))

(check-sat (not b!1551662) (not b!1551655) (not bm!71099) (not bm!71097) (not mapNonEmpty!59002) (not b!1551663) (not b_next!31915) b_and!51335 tp_is_empty!38191 (not b!1551669) (not b!1551657) (not start!132238))
(check-sat b_and!51335 (not b_next!31915))
