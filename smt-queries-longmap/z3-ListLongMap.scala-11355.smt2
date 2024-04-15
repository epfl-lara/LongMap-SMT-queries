; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131984 () Bool)

(assert start!131984)

(declare-fun b_free!31747 () Bool)

(declare-fun b_next!31747 () Bool)

(assert (=> start!131984 (= b_free!31747 (not b_next!31747))))

(declare-fun tp!111494 () Bool)

(declare-fun b_and!51139 () Bool)

(assert (=> start!131984 (= tp!111494 b_and!51139)))

(declare-fun b!1547056 () Bool)

(declare-fun e!861114 () Bool)

(declare-fun e!861110 () Bool)

(declare-fun mapRes!58738 () Bool)

(assert (=> b!1547056 (= e!861114 (and e!861110 mapRes!58738))))

(declare-fun condMapEmpty!58738 () Bool)

(declare-datatypes ((V!59141 0))(
  ( (V!59142 (val!19089 Int)) )
))
(declare-datatypes ((ValueCell!18101 0))(
  ( (ValueCellFull!18101 (v!21886 V!59141)) (EmptyCell!18101) )
))
(declare-datatypes ((array!103176 0))(
  ( (array!103177 (arr!49791 (Array (_ BitVec 32) ValueCell!18101)) (size!50343 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103176)

(declare-fun mapDefault!58738 () ValueCell!18101)

(assert (=> b!1547056 (= condMapEmpty!58738 (= (arr!49791 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18101)) mapDefault!58738)))))

(declare-fun bm!69792 () Bool)

(declare-datatypes ((tuple2!24634 0))(
  ( (tuple2!24635 (_1!12328 (_ BitVec 64)) (_2!12328 V!59141)) )
))
(declare-datatypes ((List!36104 0))(
  ( (Nil!36101) (Cons!36100 (h!37546 tuple2!24634) (t!50790 List!36104)) )
))
(declare-datatypes ((ListLongMap!22243 0))(
  ( (ListLongMap!22244 (toList!11137 List!36104)) )
))
(declare-fun call!69796 () ListLongMap!22243)

(declare-fun call!69799 () ListLongMap!22243)

(assert (=> bm!69792 (= call!69796 call!69799)))

(declare-fun bm!69793 () Bool)

(declare-fun call!69798 () ListLongMap!22243)

(declare-fun call!69795 () ListLongMap!22243)

(assert (=> bm!69793 (= call!69798 call!69795)))

(declare-fun zeroValue!436 () V!59141)

(declare-fun c!141902 () Bool)

(declare-fun c!141901 () Bool)

(declare-fun minValue!436 () V!59141)

(declare-fun call!69797 () ListLongMap!22243)

(declare-fun bm!69794 () Bool)

(declare-fun +!4963 (ListLongMap!22243 tuple2!24634) ListLongMap!22243)

(assert (=> bm!69794 (= call!69795 (+!4963 (ite c!141902 call!69797 (ite c!141901 call!69799 call!69796)) (ite (or c!141902 c!141901) (tuple2!24635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547057 () Bool)

(declare-fun c!141903 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666568 () Bool)

(assert (=> b!1547057 (= c!141903 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666568))))

(declare-fun e!861115 () ListLongMap!22243)

(declare-fun e!861113 () ListLongMap!22243)

(assert (=> b!1547057 (= e!861115 e!861113)))

(declare-datatypes ((array!103178 0))(
  ( (array!103179 (arr!49792 (Array (_ BitVec 32) (_ BitVec 64))) (size!50344 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103178)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!69795 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6591 (array!103178 array!103176 (_ BitVec 32) (_ BitVec 32) V!59141 V!59141 (_ BitVec 32) Int) ListLongMap!22243)

(assert (=> bm!69795 (= call!69797 (getCurrentListMapNoExtraKeys!6591 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547058 () Bool)

(declare-fun res!1060526 () Bool)

(declare-fun e!861116 () Bool)

(assert (=> b!1547058 (=> (not res!1060526) (not e!861116))))

(assert (=> b!1547058 (= res!1060526 (and (= (size!50343 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50344 _keys!618) (size!50343 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547059 () Bool)

(declare-fun res!1060524 () Bool)

(assert (=> b!1547059 (=> (not res!1060524) (not e!861116))))

(declare-datatypes ((List!36105 0))(
  ( (Nil!36102) (Cons!36101 (h!37547 (_ BitVec 64)) (t!50791 List!36105)) )
))
(declare-fun arrayNoDuplicates!0 (array!103178 (_ BitVec 32) List!36105) Bool)

(assert (=> b!1547059 (= res!1060524 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36102))))

(declare-fun b!1547060 () Bool)

(declare-fun res!1060527 () Bool)

(assert (=> b!1547060 (=> (not res!1060527) (not e!861116))))

(assert (=> b!1547060 (= res!1060527 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50344 _keys!618))))))

(declare-fun b!1547061 () Bool)

(declare-fun res!1060522 () Bool)

(declare-fun e!861111 () Bool)

(assert (=> b!1547061 (=> (not res!1060522) (not e!861111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547061 (= res!1060522 (validKeyInArray!0 (select (arr!49792 _keys!618) from!762)))))

(declare-fun b!1547062 () Bool)

(declare-fun e!861117 () ListLongMap!22243)

(assert (=> b!1547062 (= e!861117 (+!4963 call!69795 (tuple2!24635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547063 () Bool)

(declare-fun e!861112 () Bool)

(declare-fun tp_is_empty!38023 () Bool)

(assert (=> b!1547063 (= e!861112 tp_is_empty!38023)))

(declare-fun b!1547064 () Bool)

(declare-fun res!1060523 () Bool)

(assert (=> b!1547064 (=> (not res!1060523) (not e!861116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103178 (_ BitVec 32)) Bool)

(assert (=> b!1547064 (= res!1060523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547065 () Bool)

(assert (=> b!1547065 (= e!861115 call!69798)))

(declare-fun b!1547066 () Bool)

(assert (=> b!1547066 (= e!861116 e!861111)))

(declare-fun res!1060521 () Bool)

(assert (=> b!1547066 (=> (not res!1060521) (not e!861111))))

(assert (=> b!1547066 (= res!1060521 (bvslt from!762 (size!50344 _keys!618)))))

(declare-fun lt!666571 () ListLongMap!22243)

(assert (=> b!1547066 (= lt!666571 e!861117)))

(assert (=> b!1547066 (= c!141902 (and (not lt!666568) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547066 (= lt!666568 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547067 () Bool)

(assert (=> b!1547067 (= e!861117 e!861115)))

(assert (=> b!1547067 (= c!141901 (and (not lt!666568) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547068 () Bool)

(assert (=> b!1547068 (= e!861110 tp_is_empty!38023)))

(declare-fun bm!69796 () Bool)

(assert (=> bm!69796 (= call!69799 call!69797)))

(declare-fun b!1547069 () Bool)

(assert (=> b!1547069 (= e!861113 call!69798)))

(declare-fun mapIsEmpty!58738 () Bool)

(assert (=> mapIsEmpty!58738 mapRes!58738))

(declare-fun res!1060525 () Bool)

(assert (=> start!131984 (=> (not res!1060525) (not e!861116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131984 (= res!1060525 (validMask!0 mask!926))))

(assert (=> start!131984 e!861116))

(declare-fun array_inv!38925 (array!103178) Bool)

(assert (=> start!131984 (array_inv!38925 _keys!618)))

(assert (=> start!131984 tp_is_empty!38023))

(assert (=> start!131984 true))

(assert (=> start!131984 tp!111494))

(declare-fun array_inv!38926 (array!103176) Bool)

(assert (=> start!131984 (and (array_inv!38926 _values!470) e!861114)))

(declare-fun mapNonEmpty!58738 () Bool)

(declare-fun tp!111493 () Bool)

(assert (=> mapNonEmpty!58738 (= mapRes!58738 (and tp!111493 e!861112))))

(declare-fun mapKey!58738 () (_ BitVec 32))

(declare-fun mapRest!58738 () (Array (_ BitVec 32) ValueCell!18101))

(declare-fun mapValue!58738 () ValueCell!18101)

(assert (=> mapNonEmpty!58738 (= (arr!49791 _values!470) (store mapRest!58738 mapKey!58738 mapValue!58738))))

(declare-fun b!1547070 () Bool)

(assert (=> b!1547070 (= e!861111 (not true))))

(declare-fun lt!666570 () ListLongMap!22243)

(declare-fun apply!1048 (ListLongMap!22243 (_ BitVec 64)) V!59141)

(assert (=> b!1547070 (= (apply!1048 (+!4963 lt!666570 (tuple2!24635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49792 _keys!618) from!762)) (apply!1048 lt!666570 (select (arr!49792 _keys!618) from!762)))))

(declare-datatypes ((Unit!51393 0))(
  ( (Unit!51394) )
))
(declare-fun lt!666567 () Unit!51393)

(declare-fun addApplyDifferent!586 (ListLongMap!22243 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51393)

(assert (=> b!1547070 (= lt!666567 (addApplyDifferent!586 lt!666570 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49792 _keys!618) from!762)))))

(declare-fun contains!10023 (ListLongMap!22243 (_ BitVec 64)) Bool)

(assert (=> b!1547070 (contains!10023 (+!4963 lt!666570 (tuple2!24635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49792 _keys!618) from!762))))

(declare-fun lt!666569 () Unit!51393)

(declare-fun addStillContains!1246 (ListLongMap!22243 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51393)

(assert (=> b!1547070 (= lt!666569 (addStillContains!1246 lt!666570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49792 _keys!618) from!762)))))

(assert (=> b!1547070 (= lt!666570 (getCurrentListMapNoExtraKeys!6591 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547071 () Bool)

(assert (=> b!1547071 (= e!861113 call!69796)))

(assert (= (and start!131984 res!1060525) b!1547058))

(assert (= (and b!1547058 res!1060526) b!1547064))

(assert (= (and b!1547064 res!1060523) b!1547059))

(assert (= (and b!1547059 res!1060524) b!1547060))

(assert (= (and b!1547060 res!1060527) b!1547066))

(assert (= (and b!1547066 c!141902) b!1547062))

(assert (= (and b!1547066 (not c!141902)) b!1547067))

(assert (= (and b!1547067 c!141901) b!1547065))

(assert (= (and b!1547067 (not c!141901)) b!1547057))

(assert (= (and b!1547057 c!141903) b!1547069))

(assert (= (and b!1547057 (not c!141903)) b!1547071))

(assert (= (or b!1547069 b!1547071) bm!69792))

(assert (= (or b!1547065 bm!69792) bm!69796))

(assert (= (or b!1547065 b!1547069) bm!69793))

(assert (= (or b!1547062 bm!69796) bm!69795))

(assert (= (or b!1547062 bm!69793) bm!69794))

(assert (= (and b!1547066 res!1060521) b!1547061))

(assert (= (and b!1547061 res!1060522) b!1547070))

(assert (= (and b!1547056 condMapEmpty!58738) mapIsEmpty!58738))

(assert (= (and b!1547056 (not condMapEmpty!58738)) mapNonEmpty!58738))

(get-info :version)

(assert (= (and mapNonEmpty!58738 ((_ is ValueCellFull!18101) mapValue!58738)) b!1547063))

(assert (= (and b!1547056 ((_ is ValueCellFull!18101) mapDefault!58738)) b!1547068))

(assert (= start!131984 b!1547056))

(declare-fun m!1426113 () Bool)

(assert (=> b!1547064 m!1426113))

(declare-fun m!1426115 () Bool)

(assert (=> b!1547070 m!1426115))

(declare-fun m!1426117 () Bool)

(assert (=> b!1547070 m!1426117))

(declare-fun m!1426119 () Bool)

(assert (=> b!1547070 m!1426119))

(declare-fun m!1426121 () Bool)

(assert (=> b!1547070 m!1426121))

(declare-fun m!1426123 () Bool)

(assert (=> b!1547070 m!1426123))

(assert (=> b!1547070 m!1426117))

(declare-fun m!1426125 () Bool)

(assert (=> b!1547070 m!1426125))

(assert (=> b!1547070 m!1426117))

(declare-fun m!1426127 () Bool)

(assert (=> b!1547070 m!1426127))

(assert (=> b!1547070 m!1426123))

(assert (=> b!1547070 m!1426117))

(assert (=> b!1547070 m!1426117))

(declare-fun m!1426129 () Bool)

(assert (=> b!1547070 m!1426129))

(assert (=> b!1547070 m!1426115))

(assert (=> b!1547070 m!1426117))

(declare-fun m!1426131 () Bool)

(assert (=> b!1547070 m!1426131))

(declare-fun m!1426133 () Bool)

(assert (=> bm!69794 m!1426133))

(assert (=> b!1547061 m!1426117))

(assert (=> b!1547061 m!1426117))

(declare-fun m!1426135 () Bool)

(assert (=> b!1547061 m!1426135))

(declare-fun m!1426137 () Bool)

(assert (=> b!1547062 m!1426137))

(assert (=> bm!69795 m!1426121))

(declare-fun m!1426139 () Bool)

(assert (=> b!1547059 m!1426139))

(declare-fun m!1426141 () Bool)

(assert (=> start!131984 m!1426141))

(declare-fun m!1426143 () Bool)

(assert (=> start!131984 m!1426143))

(declare-fun m!1426145 () Bool)

(assert (=> start!131984 m!1426145))

(declare-fun m!1426147 () Bool)

(assert (=> mapNonEmpty!58738 m!1426147))

(check-sat (not bm!69794) tp_is_empty!38023 (not bm!69795) (not b!1547064) (not b!1547070) (not b!1547062) b_and!51139 (not mapNonEmpty!58738) (not b!1547061) (not start!131984) (not b!1547059) (not b_next!31747))
(check-sat b_and!51139 (not b_next!31747))
