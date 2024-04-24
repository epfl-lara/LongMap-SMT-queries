; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132464 () Bool)

(assert start!132464)

(declare-fun b_free!31765 () Bool)

(declare-fun b_next!31765 () Bool)

(assert (=> start!132464 (= b_free!31765 (not b_next!31765))))

(declare-fun tp!111546 () Bool)

(declare-fun b_and!51177 () Bool)

(assert (=> start!132464 (= tp!111546 b_and!51177)))

(declare-fun b!1550237 () Bool)

(declare-datatypes ((V!59165 0))(
  ( (V!59166 (val!19098 Int)) )
))
(declare-datatypes ((tuple2!24636 0))(
  ( (tuple2!24637 (_1!12329 (_ BitVec 64)) (_2!12329 V!59165)) )
))
(declare-datatypes ((List!36112 0))(
  ( (Nil!36109) (Cons!36108 (h!37571 tuple2!24636) (t!50798 List!36112)) )
))
(declare-datatypes ((ListLongMap!22253 0))(
  ( (ListLongMap!22254 (toList!11142 List!36112)) )
))
(declare-fun e!863060 () ListLongMap!22253)

(declare-fun call!70116 () ListLongMap!22253)

(declare-fun minValue!436 () V!59165)

(declare-fun +!4985 (ListLongMap!22253 tuple2!24636) ListLongMap!22253)

(assert (=> b!1550237 (= e!863060 (+!4985 call!70116 (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550238 () Bool)

(declare-fun e!863061 () ListLongMap!22253)

(declare-fun call!70115 () ListLongMap!22253)

(assert (=> b!1550238 (= e!863061 call!70115)))

(declare-fun b!1550239 () Bool)

(declare-fun res!1061705 () Bool)

(declare-fun e!863064 () Bool)

(assert (=> b!1550239 (=> (not res!1061705) (not e!863064))))

(declare-datatypes ((array!103408 0))(
  ( (array!103409 (arr!49899 (Array (_ BitVec 32) (_ BitVec 64))) (size!50450 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103408)

(declare-datatypes ((List!36113 0))(
  ( (Nil!36110) (Cons!36109 (h!37572 (_ BitVec 64)) (t!50799 List!36113)) )
))
(declare-fun arrayNoDuplicates!0 (array!103408 (_ BitVec 32) List!36113) Bool)

(assert (=> b!1550239 (= res!1061705 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36110))))

(declare-fun bm!70112 () Bool)

(declare-fun call!70118 () ListLongMap!22253)

(declare-fun call!70119 () ListLongMap!22253)

(assert (=> bm!70112 (= call!70118 call!70119)))

(declare-fun bm!70113 () Bool)

(assert (=> bm!70113 (= call!70115 call!70118)))

(declare-fun bm!70114 () Bool)

(declare-fun call!70117 () ListLongMap!22253)

(assert (=> bm!70114 (= call!70117 call!70116)))

(declare-fun b!1550240 () Bool)

(declare-fun e!863067 () Bool)

(assert (=> b!1550240 (= e!863067 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667899 () ListLongMap!22253)

(declare-fun apply!1067 (ListLongMap!22253 (_ BitVec 64)) V!59165)

(assert (=> b!1550240 (= (apply!1067 (+!4985 lt!667899 (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49899 _keys!618) from!762)) (apply!1067 lt!667899 (select (arr!49899 _keys!618) from!762)))))

(declare-datatypes ((Unit!51499 0))(
  ( (Unit!51500) )
))
(declare-fun lt!667897 () Unit!51499)

(declare-fun addApplyDifferent!596 (ListLongMap!22253 (_ BitVec 64) V!59165 (_ BitVec 64)) Unit!51499)

(assert (=> b!1550240 (= lt!667897 (addApplyDifferent!596 lt!667899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49899 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59165)

(declare-fun contains!10115 (ListLongMap!22253 (_ BitVec 64)) Bool)

(assert (=> b!1550240 (contains!10115 (+!4985 lt!667899 (tuple2!24637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49899 _keys!618) from!762))))

(declare-fun lt!667896 () Unit!51499)

(declare-fun addStillContains!1257 (ListLongMap!22253 (_ BitVec 64) V!59165 (_ BitVec 64)) Unit!51499)

(assert (=> b!1550240 (= lt!667896 (addStillContains!1257 lt!667899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49899 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18110 0))(
  ( (ValueCellFull!18110 (v!21891 V!59165)) (EmptyCell!18110) )
))
(declare-datatypes ((array!103410 0))(
  ( (array!103411 (arr!49900 (Array (_ BitVec 32) ValueCell!18110)) (size!50451 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103410)

(declare-fun getCurrentListMapNoExtraKeys!6616 (array!103408 array!103410 (_ BitVec 32) (_ BitVec 32) V!59165 V!59165 (_ BitVec 32) Int) ListLongMap!22253)

(assert (=> b!1550240 (= lt!667899 (getCurrentListMapNoExtraKeys!6616 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!142873 () Bool)

(declare-fun c!142872 () Bool)

(declare-fun bm!70115 () Bool)

(assert (=> bm!70115 (= call!70116 (+!4985 (ite c!142872 call!70119 (ite c!142873 call!70118 call!70115)) (ite (or c!142872 c!142873) (tuple2!24637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550241 () Bool)

(assert (=> b!1550241 (= e!863061 call!70117)))

(declare-fun b!1550242 () Bool)

(declare-fun e!863066 () ListLongMap!22253)

(assert (=> b!1550242 (= e!863060 e!863066)))

(declare-fun lt!667898 () Bool)

(assert (=> b!1550242 (= c!142873 (and (not lt!667898) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58765 () Bool)

(declare-fun mapRes!58765 () Bool)

(assert (=> mapIsEmpty!58765 mapRes!58765))

(declare-fun b!1550243 () Bool)

(declare-fun res!1061701 () Bool)

(assert (=> b!1550243 (=> (not res!1061701) (not e!863067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550243 (= res!1061701 (validKeyInArray!0 (select (arr!49899 _keys!618) from!762)))))

(declare-fun b!1550244 () Bool)

(declare-fun e!863065 () Bool)

(declare-fun e!863059 () Bool)

(assert (=> b!1550244 (= e!863065 (and e!863059 mapRes!58765))))

(declare-fun condMapEmpty!58765 () Bool)

(declare-fun mapDefault!58765 () ValueCell!18110)

(assert (=> b!1550244 (= condMapEmpty!58765 (= (arr!49900 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18110)) mapDefault!58765)))))

(declare-fun b!1550245 () Bool)

(declare-fun c!142871 () Bool)

(assert (=> b!1550245 (= c!142871 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667898))))

(assert (=> b!1550245 (= e!863066 e!863061)))

(declare-fun bm!70116 () Bool)

(assert (=> bm!70116 (= call!70119 (getCurrentListMapNoExtraKeys!6616 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550246 () Bool)

(declare-fun res!1061699 () Bool)

(assert (=> b!1550246 (=> (not res!1061699) (not e!863064))))

(assert (=> b!1550246 (= res!1061699 (and (= (size!50451 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50450 _keys!618) (size!50451 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550247 () Bool)

(declare-fun e!863063 () Bool)

(declare-fun tp_is_empty!38041 () Bool)

(assert (=> b!1550247 (= e!863063 tp_is_empty!38041)))

(declare-fun b!1550248 () Bool)

(assert (=> b!1550248 (= e!863059 tp_is_empty!38041)))

(declare-fun b!1550249 () Bool)

(declare-fun res!1061703 () Bool)

(assert (=> b!1550249 (=> (not res!1061703) (not e!863064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103408 (_ BitVec 32)) Bool)

(assert (=> b!1550249 (= res!1061703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550250 () Bool)

(assert (=> b!1550250 (= e!863066 call!70117)))

(declare-fun mapNonEmpty!58765 () Bool)

(declare-fun tp!111547 () Bool)

(assert (=> mapNonEmpty!58765 (= mapRes!58765 (and tp!111547 e!863063))))

(declare-fun mapKey!58765 () (_ BitVec 32))

(declare-fun mapValue!58765 () ValueCell!18110)

(declare-fun mapRest!58765 () (Array (_ BitVec 32) ValueCell!18110))

(assert (=> mapNonEmpty!58765 (= (arr!49900 _values!470) (store mapRest!58765 mapKey!58765 mapValue!58765))))

(declare-fun b!1550251 () Bool)

(declare-fun res!1061704 () Bool)

(assert (=> b!1550251 (=> (not res!1061704) (not e!863064))))

(assert (=> b!1550251 (= res!1061704 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50450 _keys!618))))))

(declare-fun b!1550252 () Bool)

(assert (=> b!1550252 (= e!863064 e!863067)))

(declare-fun res!1061702 () Bool)

(assert (=> b!1550252 (=> (not res!1061702) (not e!863067))))

(assert (=> b!1550252 (= res!1061702 (bvslt from!762 (size!50450 _keys!618)))))

(declare-fun lt!667900 () ListLongMap!22253)

(assert (=> b!1550252 (= lt!667900 e!863060)))

(assert (=> b!1550252 (= c!142872 (and (not lt!667898) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550252 (= lt!667898 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1061700 () Bool)

(assert (=> start!132464 (=> (not res!1061700) (not e!863064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132464 (= res!1061700 (validMask!0 mask!926))))

(assert (=> start!132464 e!863064))

(declare-fun array_inv!39069 (array!103408) Bool)

(assert (=> start!132464 (array_inv!39069 _keys!618)))

(assert (=> start!132464 tp_is_empty!38041))

(assert (=> start!132464 true))

(assert (=> start!132464 tp!111546))

(declare-fun array_inv!39070 (array!103410) Bool)

(assert (=> start!132464 (and (array_inv!39070 _values!470) e!863065)))

(assert (= (and start!132464 res!1061700) b!1550246))

(assert (= (and b!1550246 res!1061699) b!1550249))

(assert (= (and b!1550249 res!1061703) b!1550239))

(assert (= (and b!1550239 res!1061705) b!1550251))

(assert (= (and b!1550251 res!1061704) b!1550252))

(assert (= (and b!1550252 c!142872) b!1550237))

(assert (= (and b!1550252 (not c!142872)) b!1550242))

(assert (= (and b!1550242 c!142873) b!1550250))

(assert (= (and b!1550242 (not c!142873)) b!1550245))

(assert (= (and b!1550245 c!142871) b!1550241))

(assert (= (and b!1550245 (not c!142871)) b!1550238))

(assert (= (or b!1550241 b!1550238) bm!70113))

(assert (= (or b!1550250 bm!70113) bm!70112))

(assert (= (or b!1550250 b!1550241) bm!70114))

(assert (= (or b!1550237 bm!70112) bm!70116))

(assert (= (or b!1550237 bm!70114) bm!70115))

(assert (= (and b!1550252 res!1061702) b!1550243))

(assert (= (and b!1550243 res!1061701) b!1550240))

(assert (= (and b!1550244 condMapEmpty!58765) mapIsEmpty!58765))

(assert (= (and b!1550244 (not condMapEmpty!58765)) mapNonEmpty!58765))

(get-info :version)

(assert (= (and mapNonEmpty!58765 ((_ is ValueCellFull!18110) mapValue!58765)) b!1550247))

(assert (= (and b!1550244 ((_ is ValueCellFull!18110) mapDefault!58765)) b!1550248))

(assert (= start!132464 b!1550244))

(declare-fun m!1429587 () Bool)

(assert (=> b!1550243 m!1429587))

(assert (=> b!1550243 m!1429587))

(declare-fun m!1429589 () Bool)

(assert (=> b!1550243 m!1429589))

(declare-fun m!1429591 () Bool)

(assert (=> start!132464 m!1429591))

(declare-fun m!1429593 () Bool)

(assert (=> start!132464 m!1429593))

(declare-fun m!1429595 () Bool)

(assert (=> start!132464 m!1429595))

(declare-fun m!1429597 () Bool)

(assert (=> bm!70115 m!1429597))

(declare-fun m!1429599 () Bool)

(assert (=> b!1550249 m!1429599))

(declare-fun m!1429601 () Bool)

(assert (=> b!1550239 m!1429601))

(assert (=> b!1550240 m!1429587))

(declare-fun m!1429603 () Bool)

(assert (=> b!1550240 m!1429603))

(declare-fun m!1429605 () Bool)

(assert (=> b!1550240 m!1429605))

(assert (=> b!1550240 m!1429587))

(assert (=> b!1550240 m!1429587))

(declare-fun m!1429607 () Bool)

(assert (=> b!1550240 m!1429607))

(declare-fun m!1429609 () Bool)

(assert (=> b!1550240 m!1429609))

(assert (=> b!1550240 m!1429609))

(assert (=> b!1550240 m!1429587))

(declare-fun m!1429611 () Bool)

(assert (=> b!1550240 m!1429611))

(declare-fun m!1429613 () Bool)

(assert (=> b!1550240 m!1429613))

(assert (=> b!1550240 m!1429587))

(declare-fun m!1429615 () Bool)

(assert (=> b!1550240 m!1429615))

(assert (=> b!1550240 m!1429613))

(assert (=> b!1550240 m!1429587))

(declare-fun m!1429617 () Bool)

(assert (=> b!1550240 m!1429617))

(assert (=> bm!70116 m!1429605))

(declare-fun m!1429619 () Bool)

(assert (=> b!1550237 m!1429619))

(declare-fun m!1429621 () Bool)

(assert (=> mapNonEmpty!58765 m!1429621))

(check-sat (not b_next!31765) (not start!132464) tp_is_empty!38041 (not b!1550239) (not b!1550243) (not b!1550249) (not b!1550240) (not bm!70116) (not b!1550237) (not mapNonEmpty!58765) (not bm!70115) b_and!51177)
(check-sat b_and!51177 (not b_next!31765))
