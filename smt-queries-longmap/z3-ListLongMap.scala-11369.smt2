; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132068 () Bool)

(assert start!132068)

(declare-fun b_free!31831 () Bool)

(declare-fun b_next!31831 () Bool)

(assert (=> start!132068 (= b_free!31831 (not b_next!31831))))

(declare-fun tp!111745 () Bool)

(declare-fun b_and!51223 () Bool)

(assert (=> start!132068 (= tp!111745 b_and!51223)))

(declare-datatypes ((V!59253 0))(
  ( (V!59254 (val!19131 Int)) )
))
(declare-datatypes ((tuple2!24714 0))(
  ( (tuple2!24715 (_1!12368 (_ BitVec 64)) (_2!12368 V!59253)) )
))
(declare-datatypes ((List!36172 0))(
  ( (Nil!36169) (Cons!36168 (h!37614 tuple2!24714) (t!50858 List!36172)) )
))
(declare-datatypes ((ListLongMap!22323 0))(
  ( (ListLongMap!22324 (toList!11177 List!36172)) )
))
(declare-fun call!70429 () ListLongMap!22323)

(declare-fun zeroValue!436 () V!59253)

(declare-fun bm!70422 () Bool)

(declare-fun call!70428 () ListLongMap!22323)

(declare-fun call!70427 () ListLongMap!22323)

(declare-fun c!142280 () Bool)

(declare-fun minValue!436 () V!59253)

(declare-fun c!142279 () Bool)

(declare-fun call!70426 () ListLongMap!22323)

(declare-fun +!4995 (ListLongMap!22323 tuple2!24714) ListLongMap!22323)

(assert (=> bm!70422 (= call!70428 (+!4995 (ite c!142280 call!70427 (ite c!142279 call!70429 call!70426)) (ite (or c!142280 c!142279) (tuple2!24715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1061406 () Bool)

(declare-fun e!862247 () Bool)

(assert (=> start!132068 (=> (not res!1061406) (not e!862247))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132068 (= res!1061406 (validMask!0 mask!926))))

(assert (=> start!132068 e!862247))

(declare-datatypes ((array!103334 0))(
  ( (array!103335 (arr!49870 (Array (_ BitVec 32) (_ BitVec 64))) (size!50422 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103334)

(declare-fun array_inv!38979 (array!103334) Bool)

(assert (=> start!132068 (array_inv!38979 _keys!618)))

(declare-fun tp_is_empty!38107 () Bool)

(assert (=> start!132068 tp_is_empty!38107))

(assert (=> start!132068 true))

(assert (=> start!132068 tp!111745))

(declare-datatypes ((ValueCell!18143 0))(
  ( (ValueCellFull!18143 (v!21928 V!59253)) (EmptyCell!18143) )
))
(declare-datatypes ((array!103336 0))(
  ( (array!103337 (arr!49871 (Array (_ BitVec 32) ValueCell!18143)) (size!50423 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103336)

(declare-fun e!862248 () Bool)

(declare-fun array_inv!38980 (array!103336) Bool)

(assert (=> start!132068 (and (array_inv!38980 _values!470) e!862248)))

(declare-fun mapNonEmpty!58864 () Bool)

(declare-fun mapRes!58864 () Bool)

(declare-fun tp!111746 () Bool)

(declare-fun e!862244 () Bool)

(assert (=> mapNonEmpty!58864 (= mapRes!58864 (and tp!111746 e!862244))))

(declare-fun mapValue!58864 () ValueCell!18143)

(declare-fun mapKey!58864 () (_ BitVec 32))

(declare-fun mapRest!58864 () (Array (_ BitVec 32) ValueCell!18143))

(assert (=> mapNonEmpty!58864 (= (arr!49871 _values!470) (store mapRest!58864 mapKey!58864 mapValue!58864))))

(declare-fun bm!70423 () Bool)

(declare-fun call!70425 () ListLongMap!22323)

(assert (=> bm!70423 (= call!70425 call!70428)))

(declare-fun b!1549072 () Bool)

(declare-fun res!1061409 () Bool)

(declare-fun e!862249 () Bool)

(assert (=> b!1549072 (=> (not res!1061409) (not e!862249))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549072 (= res!1061409 (validKeyInArray!0 (select (arr!49870 _keys!618) from!762)))))

(declare-fun b!1549073 () Bool)

(declare-fun e!862245 () ListLongMap!22323)

(assert (=> b!1549073 (= e!862245 call!70426)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70424 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6622 (array!103334 array!103336 (_ BitVec 32) (_ BitVec 32) V!59253 V!59253 (_ BitVec 32) Int) ListLongMap!22323)

(assert (=> bm!70424 (= call!70427 (getCurrentListMapNoExtraKeys!6622 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549074 () Bool)

(assert (=> b!1549074 (= e!862249 (not true))))

(declare-fun lt!667548 () Bool)

(declare-fun lt!667545 () ListLongMap!22323)

(declare-fun contains!10047 (ListLongMap!22323 (_ BitVec 64)) Bool)

(assert (=> b!1549074 (= lt!667548 (contains!10047 lt!667545 (select (arr!49870 _keys!618) from!762)))))

(declare-fun lt!667544 () ListLongMap!22323)

(declare-fun lt!667546 () V!59253)

(declare-fun apply!1072 (ListLongMap!22323 (_ BitVec 64)) V!59253)

(assert (=> b!1549074 (= (apply!1072 lt!667544 (select (arr!49870 _keys!618) from!762)) lt!667546)))

(declare-datatypes ((Unit!51441 0))(
  ( (Unit!51442) )
))
(declare-fun lt!667540 () Unit!51441)

(declare-fun addApplyDifferent!610 (ListLongMap!22323 (_ BitVec 64) V!59253 (_ BitVec 64)) Unit!51441)

(assert (=> b!1549074 (= lt!667540 (addApplyDifferent!610 lt!667545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49870 _keys!618) from!762)))))

(declare-fun lt!667541 () V!59253)

(assert (=> b!1549074 (= lt!667541 lt!667546)))

(assert (=> b!1549074 (= lt!667546 (apply!1072 lt!667545 (select (arr!49870 _keys!618) from!762)))))

(assert (=> b!1549074 (= lt!667541 (apply!1072 (+!4995 lt!667545 (tuple2!24715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49870 _keys!618) from!762)))))

(declare-fun lt!667547 () Unit!51441)

(assert (=> b!1549074 (= lt!667547 (addApplyDifferent!610 lt!667545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49870 _keys!618) from!762)))))

(assert (=> b!1549074 (contains!10047 lt!667544 (select (arr!49870 _keys!618) from!762))))

(assert (=> b!1549074 (= lt!667544 (+!4995 lt!667545 (tuple2!24715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667543 () Unit!51441)

(declare-fun addStillContains!1270 (ListLongMap!22323 (_ BitVec 64) V!59253 (_ BitVec 64)) Unit!51441)

(assert (=> b!1549074 (= lt!667543 (addStillContains!1270 lt!667545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49870 _keys!618) from!762)))))

(assert (=> b!1549074 (= lt!667545 (getCurrentListMapNoExtraKeys!6622 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549075 () Bool)

(declare-fun e!862251 () ListLongMap!22323)

(assert (=> b!1549075 (= e!862251 (+!4995 call!70428 (tuple2!24715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549076 () Bool)

(declare-fun res!1061404 () Bool)

(assert (=> b!1549076 (=> (not res!1061404) (not e!862247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103334 (_ BitVec 32)) Bool)

(assert (=> b!1549076 (= res!1061404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549077 () Bool)

(declare-fun res!1061403 () Bool)

(assert (=> b!1549077 (=> (not res!1061403) (not e!862247))))

(assert (=> b!1549077 (= res!1061403 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50422 _keys!618))))))

(declare-fun b!1549078 () Bool)

(declare-fun e!862243 () Bool)

(assert (=> b!1549078 (= e!862243 tp_is_empty!38107)))

(declare-fun b!1549079 () Bool)

(declare-fun c!142281 () Bool)

(declare-fun lt!667542 () Bool)

(assert (=> b!1549079 (= c!142281 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667542))))

(declare-fun e!862250 () ListLongMap!22323)

(assert (=> b!1549079 (= e!862250 e!862245)))

(declare-fun b!1549080 () Bool)

(assert (=> b!1549080 (= e!862248 (and e!862243 mapRes!58864))))

(declare-fun condMapEmpty!58864 () Bool)

(declare-fun mapDefault!58864 () ValueCell!18143)

(assert (=> b!1549080 (= condMapEmpty!58864 (= (arr!49871 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18143)) mapDefault!58864)))))

(declare-fun bm!70425 () Bool)

(assert (=> bm!70425 (= call!70426 call!70429)))

(declare-fun b!1549081 () Bool)

(assert (=> b!1549081 (= e!862251 e!862250)))

(assert (=> b!1549081 (= c!142279 (and (not lt!667542) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549082 () Bool)

(assert (=> b!1549082 (= e!862250 call!70425)))

(declare-fun b!1549083 () Bool)

(assert (=> b!1549083 (= e!862247 e!862249)))

(declare-fun res!1061408 () Bool)

(assert (=> b!1549083 (=> (not res!1061408) (not e!862249))))

(assert (=> b!1549083 (= res!1061408 (bvslt from!762 (size!50422 _keys!618)))))

(declare-fun lt!667549 () ListLongMap!22323)

(assert (=> b!1549083 (= lt!667549 e!862251)))

(assert (=> b!1549083 (= c!142280 (and (not lt!667542) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549083 (= lt!667542 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58864 () Bool)

(assert (=> mapIsEmpty!58864 mapRes!58864))

(declare-fun b!1549084 () Bool)

(declare-fun res!1061405 () Bool)

(assert (=> b!1549084 (=> (not res!1061405) (not e!862247))))

(declare-datatypes ((List!36173 0))(
  ( (Nil!36170) (Cons!36169 (h!37615 (_ BitVec 64)) (t!50859 List!36173)) )
))
(declare-fun arrayNoDuplicates!0 (array!103334 (_ BitVec 32) List!36173) Bool)

(assert (=> b!1549084 (= res!1061405 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36170))))

(declare-fun b!1549085 () Bool)

(assert (=> b!1549085 (= e!862244 tp_is_empty!38107)))

(declare-fun b!1549086 () Bool)

(assert (=> b!1549086 (= e!862245 call!70425)))

(declare-fun bm!70426 () Bool)

(assert (=> bm!70426 (= call!70429 call!70427)))

(declare-fun b!1549087 () Bool)

(declare-fun res!1061407 () Bool)

(assert (=> b!1549087 (=> (not res!1061407) (not e!862247))))

(assert (=> b!1549087 (= res!1061407 (and (= (size!50423 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50422 _keys!618) (size!50423 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132068 res!1061406) b!1549087))

(assert (= (and b!1549087 res!1061407) b!1549076))

(assert (= (and b!1549076 res!1061404) b!1549084))

(assert (= (and b!1549084 res!1061405) b!1549077))

(assert (= (and b!1549077 res!1061403) b!1549083))

(assert (= (and b!1549083 c!142280) b!1549075))

(assert (= (and b!1549083 (not c!142280)) b!1549081))

(assert (= (and b!1549081 c!142279) b!1549082))

(assert (= (and b!1549081 (not c!142279)) b!1549079))

(assert (= (and b!1549079 c!142281) b!1549086))

(assert (= (and b!1549079 (not c!142281)) b!1549073))

(assert (= (or b!1549086 b!1549073) bm!70425))

(assert (= (or b!1549082 bm!70425) bm!70426))

(assert (= (or b!1549082 b!1549086) bm!70423))

(assert (= (or b!1549075 bm!70426) bm!70424))

(assert (= (or b!1549075 bm!70423) bm!70422))

(assert (= (and b!1549083 res!1061408) b!1549072))

(assert (= (and b!1549072 res!1061409) b!1549074))

(assert (= (and b!1549080 condMapEmpty!58864) mapIsEmpty!58864))

(assert (= (and b!1549080 (not condMapEmpty!58864)) mapNonEmpty!58864))

(get-info :version)

(assert (= (and mapNonEmpty!58864 ((_ is ValueCellFull!18143) mapValue!58864)) b!1549085))

(assert (= (and b!1549080 ((_ is ValueCellFull!18143) mapDefault!58864)) b!1549078))

(assert (= start!132068 b!1549080))

(declare-fun m!1427739 () Bool)

(assert (=> b!1549072 m!1427739))

(assert (=> b!1549072 m!1427739))

(declare-fun m!1427741 () Bool)

(assert (=> b!1549072 m!1427741))

(declare-fun m!1427743 () Bool)

(assert (=> b!1549074 m!1427743))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427745 () Bool)

(assert (=> b!1549074 m!1427745))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427747 () Bool)

(assert (=> b!1549074 m!1427747))

(declare-fun m!1427749 () Bool)

(assert (=> b!1549074 m!1427749))

(assert (=> b!1549074 m!1427739))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427751 () Bool)

(assert (=> b!1549074 m!1427751))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427753 () Bool)

(assert (=> b!1549074 m!1427753))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427755 () Bool)

(assert (=> b!1549074 m!1427755))

(declare-fun m!1427757 () Bool)

(assert (=> b!1549074 m!1427757))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427759 () Bool)

(assert (=> b!1549074 m!1427759))

(assert (=> b!1549074 m!1427743))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427761 () Bool)

(assert (=> b!1549074 m!1427761))

(assert (=> b!1549074 m!1427739))

(declare-fun m!1427763 () Bool)

(assert (=> b!1549074 m!1427763))

(declare-fun m!1427765 () Bool)

(assert (=> b!1549084 m!1427765))

(assert (=> bm!70424 m!1427749))

(declare-fun m!1427767 () Bool)

(assert (=> b!1549075 m!1427767))

(declare-fun m!1427769 () Bool)

(assert (=> b!1549076 m!1427769))

(declare-fun m!1427771 () Bool)

(assert (=> mapNonEmpty!58864 m!1427771))

(declare-fun m!1427773 () Bool)

(assert (=> bm!70422 m!1427773))

(declare-fun m!1427775 () Bool)

(assert (=> start!132068 m!1427775))

(declare-fun m!1427777 () Bool)

(assert (=> start!132068 m!1427777))

(declare-fun m!1427779 () Bool)

(assert (=> start!132068 m!1427779))

(check-sat (not bm!70424) (not start!132068) (not b!1549075) tp_is_empty!38107 (not b!1549084) (not b!1549072) (not mapNonEmpty!58864) (not b!1549074) b_and!51223 (not b!1549076) (not bm!70422) (not b_next!31831))
(check-sat b_and!51223 (not b_next!31831))
