; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132066 () Bool)

(assert start!132066)

(declare-fun b_free!31779 () Bool)

(declare-fun b_next!31779 () Bool)

(assert (=> start!132066 (= b_free!31779 (not b_next!31779))))

(declare-fun tp!111588 () Bool)

(declare-fun b_and!51189 () Bool)

(assert (=> start!132066 (= tp!111588 b_and!51189)))

(declare-datatypes ((V!59183 0))(
  ( (V!59184 (val!19105 Int)) )
))
(declare-fun zeroValue!436 () V!59183)

(declare-datatypes ((tuple2!24590 0))(
  ( (tuple2!24591 (_1!12306 (_ BitVec 64)) (_2!12306 V!59183)) )
))
(declare-datatypes ((List!36083 0))(
  ( (Nil!36080) (Cons!36079 (h!37524 tuple2!24590) (t!50777 List!36083)) )
))
(declare-datatypes ((ListLongMap!22199 0))(
  ( (ListLongMap!22200 (toList!11115 List!36083)) )
))
(declare-fun call!70073 () ListLongMap!22199)

(declare-fun call!70070 () ListLongMap!22199)

(declare-fun bm!70067 () Bool)

(declare-fun call!70072 () ListLongMap!22199)

(declare-fun c!142135 () Bool)

(declare-fun c!142134 () Bool)

(declare-fun minValue!436 () V!59183)

(declare-fun call!70071 () ListLongMap!22199)

(declare-fun +!4946 (ListLongMap!22199 tuple2!24590) ListLongMap!22199)

(assert (=> bm!70067 (= call!70070 (+!4946 (ite c!142135 call!70073 (ite c!142134 call!70071 call!70072)) (ite (or c!142135 c!142134) (tuple2!24591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548137 () Bool)

(declare-fun e!861746 () ListLongMap!22199)

(declare-fun e!861745 () ListLongMap!22199)

(assert (=> b!1548137 (= e!861746 e!861745)))

(declare-fun lt!667123 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548137 (= c!142134 (and (not lt!667123) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548138 () Bool)

(declare-fun res!1060989 () Bool)

(declare-fun e!861743 () Bool)

(assert (=> b!1548138 (=> (not res!1060989) (not e!861743))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18117 0))(
  ( (ValueCellFull!18117 (v!21906 V!59183)) (EmptyCell!18117) )
))
(declare-datatypes ((array!103310 0))(
  ( (array!103311 (arr!49857 (Array (_ BitVec 32) ValueCell!18117)) (size!50407 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103310)

(declare-datatypes ((array!103312 0))(
  ( (array!103313 (arr!49858 (Array (_ BitVec 32) (_ BitVec 64))) (size!50408 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103312)

(assert (=> b!1548138 (= res!1060989 (and (= (size!50407 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50408 _keys!618) (size!50407 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70068 () Bool)

(declare-fun call!70074 () ListLongMap!22199)

(assert (=> bm!70068 (= call!70074 call!70070)))

(declare-fun res!1060988 () Bool)

(assert (=> start!132066 (=> (not res!1060988) (not e!861743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132066 (= res!1060988 (validMask!0 mask!926))))

(assert (=> start!132066 e!861743))

(declare-fun array_inv!38769 (array!103312) Bool)

(assert (=> start!132066 (array_inv!38769 _keys!618)))

(declare-fun tp_is_empty!38055 () Bool)

(assert (=> start!132066 tp_is_empty!38055))

(assert (=> start!132066 true))

(assert (=> start!132066 tp!111588))

(declare-fun e!861739 () Bool)

(declare-fun array_inv!38770 (array!103310) Bool)

(assert (=> start!132066 (and (array_inv!38770 _values!470) e!861739)))

(declare-fun b!1548139 () Bool)

(declare-fun e!861741 () Bool)

(declare-fun mapRes!58786 () Bool)

(assert (=> b!1548139 (= e!861739 (and e!861741 mapRes!58786))))

(declare-fun condMapEmpty!58786 () Bool)

(declare-fun mapDefault!58786 () ValueCell!18117)

(assert (=> b!1548139 (= condMapEmpty!58786 (= (arr!49857 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18117)) mapDefault!58786)))))

(declare-fun mapNonEmpty!58786 () Bool)

(declare-fun tp!111589 () Bool)

(declare-fun e!861747 () Bool)

(assert (=> mapNonEmpty!58786 (= mapRes!58786 (and tp!111589 e!861747))))

(declare-fun mapKey!58786 () (_ BitVec 32))

(declare-fun mapRest!58786 () (Array (_ BitVec 32) ValueCell!18117))

(declare-fun mapValue!58786 () ValueCell!18117)

(assert (=> mapNonEmpty!58786 (= (arr!49857 _values!470) (store mapRest!58786 mapKey!58786 mapValue!58786))))

(declare-fun b!1548140 () Bool)

(declare-fun c!142136 () Bool)

(assert (=> b!1548140 (= c!142136 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667123))))

(declare-fun e!861742 () ListLongMap!22199)

(assert (=> b!1548140 (= e!861745 e!861742)))

(declare-fun b!1548141 () Bool)

(declare-fun e!861744 () Bool)

(assert (=> b!1548141 (= e!861744 (not true))))

(declare-fun lt!667126 () V!59183)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667122 () ListLongMap!22199)

(declare-fun apply!1064 (ListLongMap!22199 (_ BitVec 64)) V!59183)

(assert (=> b!1548141 (= (apply!1064 lt!667122 (select (arr!49858 _keys!618) from!762)) lt!667126)))

(declare-datatypes ((Unit!51578 0))(
  ( (Unit!51579) )
))
(declare-fun lt!667129 () Unit!51578)

(declare-fun lt!667125 () ListLongMap!22199)

(declare-fun addApplyDifferent!606 (ListLongMap!22199 (_ BitVec 64) V!59183 (_ BitVec 64)) Unit!51578)

(assert (=> b!1548141 (= lt!667129 (addApplyDifferent!606 lt!667125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49858 _keys!618) from!762)))))

(declare-fun lt!667124 () V!59183)

(assert (=> b!1548141 (= lt!667124 lt!667126)))

(assert (=> b!1548141 (= lt!667126 (apply!1064 lt!667125 (select (arr!49858 _keys!618) from!762)))))

(assert (=> b!1548141 (= lt!667124 (apply!1064 (+!4946 lt!667125 (tuple2!24591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49858 _keys!618) from!762)))))

(declare-fun lt!667127 () Unit!51578)

(assert (=> b!1548141 (= lt!667127 (addApplyDifferent!606 lt!667125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49858 _keys!618) from!762)))))

(declare-fun contains!10071 (ListLongMap!22199 (_ BitVec 64)) Bool)

(assert (=> b!1548141 (contains!10071 lt!667122 (select (arr!49858 _keys!618) from!762))))

(assert (=> b!1548141 (= lt!667122 (+!4946 lt!667125 (tuple2!24591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667130 () Unit!51578)

(declare-fun addStillContains!1259 (ListLongMap!22199 (_ BitVec 64) V!59183 (_ BitVec 64)) Unit!51578)

(assert (=> b!1548141 (= lt!667130 (addStillContains!1259 lt!667125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49858 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6572 (array!103312 array!103310 (_ BitVec 32) (_ BitVec 32) V!59183 V!59183 (_ BitVec 32) Int) ListLongMap!22199)

(assert (=> b!1548141 (= lt!667125 (getCurrentListMapNoExtraKeys!6572 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548142 () Bool)

(assert (=> b!1548142 (= e!861741 tp_is_empty!38055)))

(declare-fun bm!70069 () Bool)

(assert (=> bm!70069 (= call!70072 call!70071)))

(declare-fun b!1548143 () Bool)

(declare-fun res!1060992 () Bool)

(assert (=> b!1548143 (=> (not res!1060992) (not e!861743))))

(assert (=> b!1548143 (= res!1060992 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50408 _keys!618))))))

(declare-fun b!1548144 () Bool)

(assert (=> b!1548144 (= e!861745 call!70074)))

(declare-fun b!1548145 () Bool)

(assert (=> b!1548145 (= e!861742 call!70072)))

(declare-fun b!1548146 () Bool)

(declare-fun res!1060990 () Bool)

(assert (=> b!1548146 (=> (not res!1060990) (not e!861743))))

(declare-datatypes ((List!36084 0))(
  ( (Nil!36081) (Cons!36080 (h!37525 (_ BitVec 64)) (t!50778 List!36084)) )
))
(declare-fun arrayNoDuplicates!0 (array!103312 (_ BitVec 32) List!36084) Bool)

(assert (=> b!1548146 (= res!1060990 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36081))))

(declare-fun b!1548147 () Bool)

(declare-fun res!1060991 () Bool)

(assert (=> b!1548147 (=> (not res!1060991) (not e!861744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548147 (= res!1060991 (validKeyInArray!0 (select (arr!49858 _keys!618) from!762)))))

(declare-fun b!1548148 () Bool)

(declare-fun res!1060986 () Bool)

(assert (=> b!1548148 (=> (not res!1060986) (not e!861743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103312 (_ BitVec 32)) Bool)

(assert (=> b!1548148 (= res!1060986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58786 () Bool)

(assert (=> mapIsEmpty!58786 mapRes!58786))

(declare-fun b!1548149 () Bool)

(assert (=> b!1548149 (= e!861743 e!861744)))

(declare-fun res!1060987 () Bool)

(assert (=> b!1548149 (=> (not res!1060987) (not e!861744))))

(assert (=> b!1548149 (= res!1060987 (bvslt from!762 (size!50408 _keys!618)))))

(declare-fun lt!667128 () ListLongMap!22199)

(assert (=> b!1548149 (= lt!667128 e!861746)))

(assert (=> b!1548149 (= c!142135 (and (not lt!667123) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548149 (= lt!667123 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70070 () Bool)

(assert (=> bm!70070 (= call!70071 call!70073)))

(declare-fun b!1548150 () Bool)

(assert (=> b!1548150 (= e!861742 call!70074)))

(declare-fun bm!70071 () Bool)

(assert (=> bm!70071 (= call!70073 (getCurrentListMapNoExtraKeys!6572 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548151 () Bool)

(assert (=> b!1548151 (= e!861747 tp_is_empty!38055)))

(declare-fun b!1548152 () Bool)

(assert (=> b!1548152 (= e!861746 (+!4946 call!70070 (tuple2!24591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132066 res!1060988) b!1548138))

(assert (= (and b!1548138 res!1060989) b!1548148))

(assert (= (and b!1548148 res!1060986) b!1548146))

(assert (= (and b!1548146 res!1060990) b!1548143))

(assert (= (and b!1548143 res!1060992) b!1548149))

(assert (= (and b!1548149 c!142135) b!1548152))

(assert (= (and b!1548149 (not c!142135)) b!1548137))

(assert (= (and b!1548137 c!142134) b!1548144))

(assert (= (and b!1548137 (not c!142134)) b!1548140))

(assert (= (and b!1548140 c!142136) b!1548150))

(assert (= (and b!1548140 (not c!142136)) b!1548145))

(assert (= (or b!1548150 b!1548145) bm!70069))

(assert (= (or b!1548144 bm!70069) bm!70070))

(assert (= (or b!1548144 b!1548150) bm!70068))

(assert (= (or b!1548152 bm!70070) bm!70071))

(assert (= (or b!1548152 bm!70068) bm!70067))

(assert (= (and b!1548149 res!1060987) b!1548147))

(assert (= (and b!1548147 res!1060991) b!1548141))

(assert (= (and b!1548139 condMapEmpty!58786) mapIsEmpty!58786))

(assert (= (and b!1548139 (not condMapEmpty!58786)) mapNonEmpty!58786))

(get-info :version)

(assert (= (and mapNonEmpty!58786 ((_ is ValueCellFull!18117) mapValue!58786)) b!1548151))

(assert (= (and b!1548139 ((_ is ValueCellFull!18117) mapDefault!58786)) b!1548142))

(assert (= start!132066 b!1548139))

(declare-fun m!1427591 () Bool)

(assert (=> start!132066 m!1427591))

(declare-fun m!1427593 () Bool)

(assert (=> start!132066 m!1427593))

(declare-fun m!1427595 () Bool)

(assert (=> start!132066 m!1427595))

(declare-fun m!1427597 () Bool)

(assert (=> b!1548148 m!1427597))

(declare-fun m!1427599 () Bool)

(assert (=> bm!70071 m!1427599))

(declare-fun m!1427601 () Bool)

(assert (=> b!1548152 m!1427601))

(declare-fun m!1427603 () Bool)

(assert (=> mapNonEmpty!58786 m!1427603))

(declare-fun m!1427605 () Bool)

(assert (=> b!1548146 m!1427605))

(declare-fun m!1427607 () Bool)

(assert (=> b!1548147 m!1427607))

(assert (=> b!1548147 m!1427607))

(declare-fun m!1427609 () Bool)

(assert (=> b!1548147 m!1427609))

(declare-fun m!1427611 () Bool)

(assert (=> bm!70067 m!1427611))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427613 () Bool)

(assert (=> b!1548141 m!1427613))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427615 () Bool)

(assert (=> b!1548141 m!1427615))

(assert (=> b!1548141 m!1427599))

(declare-fun m!1427617 () Bool)

(assert (=> b!1548141 m!1427617))

(declare-fun m!1427619 () Bool)

(assert (=> b!1548141 m!1427619))

(assert (=> b!1548141 m!1427617))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427621 () Bool)

(assert (=> b!1548141 m!1427621))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427623 () Bool)

(assert (=> b!1548141 m!1427623))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427625 () Bool)

(assert (=> b!1548141 m!1427625))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427627 () Bool)

(assert (=> b!1548141 m!1427627))

(assert (=> b!1548141 m!1427607))

(assert (=> b!1548141 m!1427607))

(declare-fun m!1427629 () Bool)

(assert (=> b!1548141 m!1427629))

(check-sat (not b!1548148) b_and!51189 (not start!132066) (not bm!70067) (not b!1548141) (not b!1548152) (not b_next!31779) (not mapNonEmpty!58786) (not b!1548146) tp_is_empty!38055 (not bm!70071) (not b!1548147))
(check-sat b_and!51189 (not b_next!31779))
