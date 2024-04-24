; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132706 () Bool)

(assert start!132706)

(declare-fun b_free!31921 () Bool)

(declare-fun b_next!31921 () Bool)

(assert (=> start!132706 (= b_free!31921 (not b_next!31921))))

(declare-fun tp!112026 () Bool)

(declare-fun b_and!51361 () Bool)

(assert (=> start!132706 (= tp!112026 b_and!51361)))

(declare-fun b!1554560 () Bool)

(declare-datatypes ((Unit!51607 0))(
  ( (Unit!51608) )
))
(declare-fun e!865564 () Unit!51607)

(declare-fun lt!670006 () Unit!51607)

(assert (=> b!1554560 (= e!865564 lt!670006)))

(declare-datatypes ((array!103722 0))(
  ( (array!103723 (arr!50052 (Array (_ BitVec 32) (_ BitVec 64))) (size!50603 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103722)

(declare-datatypes ((V!59373 0))(
  ( (V!59374 (val!19176 Int)) )
))
(declare-fun zeroValue!436 () V!59373)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18188 0))(
  ( (ValueCellFull!18188 (v!21973 V!59373)) (EmptyCell!18188) )
))
(declare-datatypes ((array!103724 0))(
  ( (array!103725 (arr!50053 (Array (_ BitVec 32) ValueCell!18188)) (size!50604 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103724)

(declare-fun minValue!436 () V!59373)

(declare-datatypes ((tuple2!24782 0))(
  ( (tuple2!24783 (_1!12402 (_ BitVec 64)) (_2!12402 V!59373)) )
))
(declare-datatypes ((List!36232 0))(
  ( (Nil!36229) (Cons!36228 (h!37691 tuple2!24782) (t!50938 List!36232)) )
))
(declare-datatypes ((ListLongMap!22399 0))(
  ( (ListLongMap!22400 (toList!11215 List!36232)) )
))
(declare-fun lt!670009 () ListLongMap!22399)

(declare-fun getCurrentListMapNoExtraKeys!6676 (array!103722 array!103724 (_ BitVec 32) (_ BitVec 32) V!59373 V!59373 (_ BitVec 32) Int) ListLongMap!22399)

(assert (=> b!1554560 (= lt!670009 (getCurrentListMapNoExtraKeys!6676 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669999 () Unit!51607)

(declare-fun addStillContains!1301 (ListLongMap!22399 (_ BitVec 64) V!59373 (_ BitVec 64)) Unit!51607)

(assert (=> b!1554560 (= lt!669999 (addStillContains!1301 lt!670009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50052 _keys!618) from!762)))))

(declare-fun lt!670002 () ListLongMap!22399)

(declare-fun +!5044 (ListLongMap!22399 tuple2!24782) ListLongMap!22399)

(assert (=> b!1554560 (= lt!670002 (+!5044 lt!670009 (tuple2!24783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10170 (ListLongMap!22399 (_ BitVec 64)) Bool)

(assert (=> b!1554560 (contains!10170 lt!670002 (select (arr!50052 _keys!618) from!762))))

(declare-fun addApplyDifferent!636 (ListLongMap!22399 (_ BitVec 64) V!59373 (_ BitVec 64)) Unit!51607)

(assert (=> b!1554560 (= lt!670006 (addApplyDifferent!636 lt!670009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50052 _keys!618) from!762)))))

(declare-fun lt!670008 () V!59373)

(declare-fun apply!1109 (ListLongMap!22399 (_ BitVec 64)) V!59373)

(assert (=> b!1554560 (= lt!670008 (apply!1109 (+!5044 lt!670009 (tuple2!24783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50052 _keys!618) from!762)))))

(declare-fun lt!670007 () V!59373)

(assert (=> b!1554560 (= lt!670007 (apply!1109 lt!670009 (select (arr!50052 _keys!618) from!762)))))

(assert (=> b!1554560 (= lt!670008 lt!670007)))

(declare-fun lt!670010 () Unit!51607)

(assert (=> b!1554560 (= lt!670010 (addApplyDifferent!636 lt!670009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50052 _keys!618) from!762)))))

(assert (=> b!1554560 (= (apply!1109 lt!670002 (select (arr!50052 _keys!618) from!762)) lt!670007)))

(declare-fun b!1554561 () Bool)

(declare-fun e!865568 () ListLongMap!22399)

(declare-fun call!71334 () ListLongMap!22399)

(assert (=> b!1554561 (= e!865568 call!71334)))

(declare-fun b!1554562 () Bool)

(declare-fun call!71331 () ListLongMap!22399)

(assert (=> b!1554562 (= e!865568 call!71331)))

(declare-fun mapNonEmpty!59011 () Bool)

(declare-fun mapRes!59011 () Bool)

(declare-fun tp!112027 () Bool)

(declare-fun e!865569 () Bool)

(assert (=> mapNonEmpty!59011 (= mapRes!59011 (and tp!112027 e!865569))))

(declare-fun mapValue!59011 () ValueCell!18188)

(declare-fun mapRest!59011 () (Array (_ BitVec 32) ValueCell!18188))

(declare-fun mapKey!59011 () (_ BitVec 32))

(assert (=> mapNonEmpty!59011 (= (arr!50053 _values!470) (store mapRest!59011 mapKey!59011 mapValue!59011))))

(declare-fun b!1554563 () Bool)

(declare-fun res!1063572 () Bool)

(declare-fun e!865572 () Bool)

(assert (=> b!1554563 (=> (not res!1063572) (not e!865572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103722 (_ BitVec 32)) Bool)

(assert (=> b!1554563 (= res!1063572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1554564 () Bool)

(declare-fun e!865570 () Bool)

(assert (=> b!1554564 (= e!865572 e!865570)))

(declare-fun res!1063575 () Bool)

(assert (=> b!1554564 (=> (not res!1063575) (not e!865570))))

(declare-fun lt!670004 () Bool)

(assert (=> b!1554564 (= res!1063575 (not lt!670004))))

(declare-fun lt!670001 () Unit!51607)

(assert (=> b!1554564 (= lt!670001 e!865564)))

(declare-fun c!143717 () Bool)

(assert (=> b!1554564 (= c!143717 (not lt!670004))))

(declare-fun e!865566 () Bool)

(assert (=> b!1554564 (= lt!670004 e!865566)))

(declare-fun res!1063577 () Bool)

(assert (=> b!1554564 (=> res!1063577 e!865566)))

(assert (=> b!1554564 (= res!1063577 (bvsge from!762 (size!50603 _keys!618)))))

(declare-fun lt!670003 () ListLongMap!22399)

(declare-fun e!865565 () ListLongMap!22399)

(assert (=> b!1554564 (= lt!670003 e!865565)))

(declare-fun c!143719 () Bool)

(declare-fun lt!670005 () Bool)

(assert (=> b!1554564 (= c!143719 (and (not lt!670005) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554564 (= lt!670005 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554565 () Bool)

(assert (=> b!1554565 (= e!865570 false)))

(declare-fun lt!670000 () Bool)

(assert (=> b!1554565 (= lt!670000 (contains!10170 lt!670003 (select (arr!50052 _keys!618) from!762)))))

(declare-fun bm!71327 () Bool)

(declare-fun call!71332 () ListLongMap!22399)

(declare-fun call!71330 () ListLongMap!22399)

(assert (=> bm!71327 (= call!71332 call!71330)))

(declare-fun mapIsEmpty!59011 () Bool)

(assert (=> mapIsEmpty!59011 mapRes!59011))

(declare-fun b!1554566 () Bool)

(declare-fun e!865563 () ListLongMap!22399)

(assert (=> b!1554566 (= e!865565 e!865563)))

(declare-fun c!143718 () Bool)

(assert (=> b!1554566 (= c!143718 (and (not lt!670005) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!71328 () Bool)

(declare-fun call!71333 () ListLongMap!22399)

(assert (=> bm!71328 (= call!71334 call!71333)))

(declare-fun b!1554567 () Bool)

(declare-fun e!865567 () Bool)

(declare-fun e!865571 () Bool)

(assert (=> b!1554567 (= e!865567 (and e!865571 mapRes!59011))))

(declare-fun condMapEmpty!59011 () Bool)

(declare-fun mapDefault!59011 () ValueCell!18188)

(assert (=> b!1554567 (= condMapEmpty!59011 (= (arr!50053 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18188)) mapDefault!59011)))))

(declare-fun res!1063574 () Bool)

(assert (=> start!132706 (=> (not res!1063574) (not e!865572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132706 (= res!1063574 (validMask!0 mask!926))))

(assert (=> start!132706 e!865572))

(declare-fun array_inv!39171 (array!103722) Bool)

(assert (=> start!132706 (array_inv!39171 _keys!618)))

(declare-fun tp_is_empty!38197 () Bool)

(assert (=> start!132706 tp_is_empty!38197))

(assert (=> start!132706 true))

(assert (=> start!132706 tp!112026))

(declare-fun array_inv!39172 (array!103724) Bool)

(assert (=> start!132706 (and (array_inv!39172 _values!470) e!865567)))

(declare-fun b!1554559 () Bool)

(assert (=> b!1554559 (= e!865569 tp_is_empty!38197)))

(declare-fun b!1554568 () Bool)

(assert (=> b!1554568 (= e!865565 (+!5044 call!71333 (tuple2!24783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1554569 () Bool)

(declare-fun res!1063576 () Bool)

(assert (=> b!1554569 (=> (not res!1063576) (not e!865572))))

(assert (=> b!1554569 (= res!1063576 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50603 _keys!618))))))

(declare-fun bm!71329 () Bool)

(assert (=> bm!71329 (= call!71331 call!71332)))

(declare-fun b!1554570 () Bool)

(declare-fun res!1063578 () Bool)

(assert (=> b!1554570 (=> (not res!1063578) (not e!865572))))

(assert (=> b!1554570 (= res!1063578 (and (= (size!50604 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50603 _keys!618) (size!50604 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1554571 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554571 (= e!865566 (not (validKeyInArray!0 (select (arr!50052 _keys!618) from!762))))))

(declare-fun b!1554572 () Bool)

(assert (=> b!1554572 (= e!865563 call!71334)))

(declare-fun bm!71330 () Bool)

(assert (=> bm!71330 (= call!71330 (getCurrentListMapNoExtraKeys!6676 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1554573 () Bool)

(declare-fun Unit!51609 () Unit!51607)

(assert (=> b!1554573 (= e!865564 Unit!51609)))

(declare-fun b!1554574 () Bool)

(declare-fun c!143716 () Bool)

(assert (=> b!1554574 (= c!143716 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!670005))))

(assert (=> b!1554574 (= e!865563 e!865568)))

(declare-fun bm!71331 () Bool)

(assert (=> bm!71331 (= call!71333 (+!5044 (ite c!143719 call!71330 (ite c!143718 call!71332 call!71331)) (ite (or c!143719 c!143718) (tuple2!24783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1554575 () Bool)

(declare-fun res!1063573 () Bool)

(assert (=> b!1554575 (=> (not res!1063573) (not e!865572))))

(declare-datatypes ((List!36233 0))(
  ( (Nil!36230) (Cons!36229 (h!37692 (_ BitVec 64)) (t!50939 List!36233)) )
))
(declare-fun arrayNoDuplicates!0 (array!103722 (_ BitVec 32) List!36233) Bool)

(assert (=> b!1554575 (= res!1063573 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36230))))

(declare-fun b!1554576 () Bool)

(assert (=> b!1554576 (= e!865571 tp_is_empty!38197)))

(assert (= (and start!132706 res!1063574) b!1554570))

(assert (= (and b!1554570 res!1063578) b!1554563))

(assert (= (and b!1554563 res!1063572) b!1554575))

(assert (= (and b!1554575 res!1063573) b!1554569))

(assert (= (and b!1554569 res!1063576) b!1554564))

(assert (= (and b!1554564 c!143719) b!1554568))

(assert (= (and b!1554564 (not c!143719)) b!1554566))

(assert (= (and b!1554566 c!143718) b!1554572))

(assert (= (and b!1554566 (not c!143718)) b!1554574))

(assert (= (and b!1554574 c!143716) b!1554561))

(assert (= (and b!1554574 (not c!143716)) b!1554562))

(assert (= (or b!1554561 b!1554562) bm!71329))

(assert (= (or b!1554572 bm!71329) bm!71327))

(assert (= (or b!1554572 b!1554561) bm!71328))

(assert (= (or b!1554568 bm!71327) bm!71330))

(assert (= (or b!1554568 bm!71328) bm!71331))

(assert (= (and b!1554564 (not res!1063577)) b!1554571))

(assert (= (and b!1554564 c!143717) b!1554560))

(assert (= (and b!1554564 (not c!143717)) b!1554573))

(assert (= (and b!1554564 res!1063575) b!1554565))

(assert (= (and b!1554567 condMapEmpty!59011) mapIsEmpty!59011))

(assert (= (and b!1554567 (not condMapEmpty!59011)) mapNonEmpty!59011))

(get-info :version)

(assert (= (and mapNonEmpty!59011 ((_ is ValueCellFull!18188) mapValue!59011)) b!1554559))

(assert (= (and b!1554567 ((_ is ValueCellFull!18188) mapDefault!59011)) b!1554576))

(assert (= start!132706 b!1554567))

(declare-fun m!1432957 () Bool)

(assert (=> b!1554568 m!1432957))

(declare-fun m!1432959 () Bool)

(assert (=> bm!71330 m!1432959))

(declare-fun m!1432961 () Bool)

(assert (=> bm!71331 m!1432961))

(declare-fun m!1432963 () Bool)

(assert (=> mapNonEmpty!59011 m!1432963))

(declare-fun m!1432965 () Bool)

(assert (=> b!1554565 m!1432965))

(assert (=> b!1554565 m!1432965))

(declare-fun m!1432967 () Bool)

(assert (=> b!1554565 m!1432967))

(declare-fun m!1432969 () Bool)

(assert (=> start!132706 m!1432969))

(declare-fun m!1432971 () Bool)

(assert (=> start!132706 m!1432971))

(declare-fun m!1432973 () Bool)

(assert (=> start!132706 m!1432973))

(declare-fun m!1432975 () Bool)

(assert (=> b!1554560 m!1432975))

(assert (=> b!1554560 m!1432959))

(assert (=> b!1554560 m!1432965))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432977 () Bool)

(assert (=> b!1554560 m!1432977))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432979 () Bool)

(assert (=> b!1554560 m!1432979))

(assert (=> b!1554560 m!1432975))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432981 () Bool)

(assert (=> b!1554560 m!1432981))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432983 () Bool)

(assert (=> b!1554560 m!1432983))

(declare-fun m!1432985 () Bool)

(assert (=> b!1554560 m!1432985))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432987 () Bool)

(assert (=> b!1554560 m!1432987))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432989 () Bool)

(assert (=> b!1554560 m!1432989))

(assert (=> b!1554560 m!1432965))

(declare-fun m!1432991 () Bool)

(assert (=> b!1554560 m!1432991))

(declare-fun m!1432993 () Bool)

(assert (=> b!1554575 m!1432993))

(declare-fun m!1432995 () Bool)

(assert (=> b!1554563 m!1432995))

(assert (=> b!1554571 m!1432965))

(assert (=> b!1554571 m!1432965))

(declare-fun m!1432997 () Bool)

(assert (=> b!1554571 m!1432997))

(check-sat (not bm!71330) (not b!1554565) (not b!1554568) (not b!1554575) (not b_next!31921) (not b!1554560) (not b!1554563) b_and!51361 (not start!132706) (not mapNonEmpty!59011) (not b!1554571) (not bm!71331) tp_is_empty!38197)
(check-sat b_and!51361 (not b_next!31921))
