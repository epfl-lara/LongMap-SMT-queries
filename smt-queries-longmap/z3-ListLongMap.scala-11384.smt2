; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132296 () Bool)

(assert start!132296)

(declare-fun b_free!31923 () Bool)

(declare-fun b_next!31923 () Bool)

(assert (=> start!132296 (= b_free!31923 (not b_next!31923))))

(declare-fun tp!112032 () Bool)

(declare-fun b_and!51361 () Bool)

(assert (=> start!132296 (= tp!112032 b_and!51361)))

(declare-fun b!1552177 () Bool)

(declare-datatypes ((V!59375 0))(
  ( (V!59376 (val!19177 Int)) )
))
(declare-datatypes ((tuple2!24730 0))(
  ( (tuple2!24731 (_1!12376 (_ BitVec 64)) (_2!12376 V!59375)) )
))
(declare-datatypes ((List!36205 0))(
  ( (Nil!36202) (Cons!36201 (h!37646 tuple2!24730) (t!50919 List!36205)) )
))
(declare-datatypes ((ListLongMap!22339 0))(
  ( (ListLongMap!22340 (toList!11185 List!36205)) )
))
(declare-fun e!864088 () ListLongMap!22339)

(declare-fun call!71197 () ListLongMap!22339)

(declare-fun minValue!436 () V!59375)

(declare-fun +!5005 (ListLongMap!22339 tuple2!24730) ListLongMap!22339)

(assert (=> b!1552177 (= e!864088 (+!5005 call!71197 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552178 () Bool)

(declare-fun e!864087 () Bool)

(declare-fun e!864091 () Bool)

(assert (=> b!1552178 (= e!864087 e!864091)))

(declare-fun res!1062738 () Bool)

(assert (=> b!1552178 (=> (not res!1062738) (not e!864091))))

(declare-fun lt!669134 () Bool)

(assert (=> b!1552178 (= res!1062738 (not lt!669134))))

(declare-datatypes ((Unit!51693 0))(
  ( (Unit!51694) )
))
(declare-fun lt!669135 () Unit!51693)

(declare-fun e!864089 () Unit!51693)

(assert (=> b!1552178 (= lt!669135 e!864089)))

(declare-fun c!142931 () Bool)

(assert (=> b!1552178 (= c!142931 (not lt!669134))))

(declare-fun e!864092 () Bool)

(assert (=> b!1552178 (= lt!669134 e!864092)))

(declare-fun res!1062735 () Bool)

(assert (=> b!1552178 (=> res!1062735 e!864092)))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103600 0))(
  ( (array!103601 (arr!49998 (Array (_ BitVec 32) (_ BitVec 64))) (size!50548 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103600)

(assert (=> b!1552178 (= res!1062735 (bvsge from!762 (size!50548 _keys!618)))))

(declare-fun lt!669127 () ListLongMap!22339)

(assert (=> b!1552178 (= lt!669127 e!864088)))

(declare-fun c!142930 () Bool)

(declare-fun lt!669137 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552178 (= c!142930 (and (not lt!669137) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552178 (= lt!669137 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552179 () Bool)

(declare-fun e!864097 () ListLongMap!22339)

(declare-fun call!71195 () ListLongMap!22339)

(assert (=> b!1552179 (= e!864097 call!71195)))

(declare-fun b!1552180 () Bool)

(declare-fun res!1062733 () Bool)

(assert (=> b!1552180 (=> (not res!1062733) (not e!864087))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18189 0))(
  ( (ValueCellFull!18189 (v!21982 V!59375)) (EmptyCell!18189) )
))
(declare-datatypes ((array!103602 0))(
  ( (array!103603 (arr!49999 (Array (_ BitVec 32) ValueCell!18189)) (size!50549 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103602)

(assert (=> b!1552180 (= res!1062733 (and (= (size!50549 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50548 _keys!618) (size!50549 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552181 () Bool)

(declare-fun res!1062736 () Bool)

(assert (=> b!1552181 (=> (not res!1062736) (not e!864087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103600 (_ BitVec 32)) Bool)

(assert (=> b!1552181 (= res!1062736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552182 () Bool)

(declare-fun e!864096 () ListLongMap!22339)

(assert (=> b!1552182 (= e!864088 e!864096)))

(declare-fun c!142928 () Bool)

(assert (=> b!1552182 (= c!142928 (and (not lt!669137) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552183 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552183 (= e!864092 (not (validKeyInArray!0 (select (arr!49998 _keys!618) from!762))))))

(declare-fun b!1552184 () Bool)

(declare-fun Unit!51695 () Unit!51693)

(assert (=> b!1552184 (= e!864089 Unit!51695)))

(declare-fun bm!71192 () Bool)

(declare-fun call!71198 () ListLongMap!22339)

(assert (=> bm!71192 (= call!71198 call!71197)))

(declare-fun res!1062739 () Bool)

(assert (=> start!132296 (=> (not res!1062739) (not e!864087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132296 (= res!1062739 (validMask!0 mask!926))))

(assert (=> start!132296 e!864087))

(declare-fun array_inv!38867 (array!103600) Bool)

(assert (=> start!132296 (array_inv!38867 _keys!618)))

(declare-fun tp_is_empty!38199 () Bool)

(assert (=> start!132296 tp_is_empty!38199))

(assert (=> start!132296 true))

(assert (=> start!132296 tp!112032))

(declare-fun e!864093 () Bool)

(declare-fun array_inv!38868 (array!103602) Bool)

(assert (=> start!132296 (and (array_inv!38868 _values!470) e!864093)))

(declare-fun mapIsEmpty!59014 () Bool)

(declare-fun mapRes!59014 () Bool)

(assert (=> mapIsEmpty!59014 mapRes!59014))

(declare-fun b!1552185 () Bool)

(declare-fun e!864095 () Bool)

(assert (=> b!1552185 (= e!864095 tp_is_empty!38199)))

(declare-fun b!1552186 () Bool)

(declare-fun lt!669131 () Unit!51693)

(assert (=> b!1552186 (= e!864089 lt!669131)))

(declare-fun lt!669130 () ListLongMap!22339)

(declare-fun zeroValue!436 () V!59375)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6630 (array!103600 array!103602 (_ BitVec 32) (_ BitVec 32) V!59375 V!59375 (_ BitVec 32) Int) ListLongMap!22339)

(assert (=> b!1552186 (= lt!669130 (getCurrentListMapNoExtraKeys!6630 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669132 () Unit!51693)

(declare-fun addStillContains!1301 (ListLongMap!22339 (_ BitVec 64) V!59375 (_ BitVec 64)) Unit!51693)

(assert (=> b!1552186 (= lt!669132 (addStillContains!1301 lt!669130 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49998 _keys!618) from!762)))))

(declare-fun lt!669129 () ListLongMap!22339)

(assert (=> b!1552186 (= lt!669129 (+!5005 lt!669130 (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10125 (ListLongMap!22339 (_ BitVec 64)) Bool)

(assert (=> b!1552186 (contains!10125 lt!669129 (select (arr!49998 _keys!618) from!762))))

(declare-fun addApplyDifferent!643 (ListLongMap!22339 (_ BitVec 64) V!59375 (_ BitVec 64)) Unit!51693)

(assert (=> b!1552186 (= lt!669131 (addApplyDifferent!643 lt!669130 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49998 _keys!618) from!762)))))

(declare-fun lt!669138 () V!59375)

(declare-fun apply!1105 (ListLongMap!22339 (_ BitVec 64)) V!59375)

(assert (=> b!1552186 (= lt!669138 (apply!1105 (+!5005 lt!669130 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49998 _keys!618) from!762)))))

(declare-fun lt!669133 () V!59375)

(assert (=> b!1552186 (= lt!669133 (apply!1105 lt!669130 (select (arr!49998 _keys!618) from!762)))))

(assert (=> b!1552186 (= lt!669138 lt!669133)))

(declare-fun lt!669128 () Unit!51693)

(assert (=> b!1552186 (= lt!669128 (addApplyDifferent!643 lt!669130 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49998 _keys!618) from!762)))))

(assert (=> b!1552186 (= (apply!1105 lt!669129 (select (arr!49998 _keys!618) from!762)) lt!669133)))

(declare-fun mapNonEmpty!59014 () Bool)

(declare-fun tp!112033 () Bool)

(declare-fun e!864090 () Bool)

(assert (=> mapNonEmpty!59014 (= mapRes!59014 (and tp!112033 e!864090))))

(declare-fun mapValue!59014 () ValueCell!18189)

(declare-fun mapKey!59014 () (_ BitVec 32))

(declare-fun mapRest!59014 () (Array (_ BitVec 32) ValueCell!18189))

(assert (=> mapNonEmpty!59014 (= (arr!49999 _values!470) (store mapRest!59014 mapKey!59014 mapValue!59014))))

(declare-fun bm!71193 () Bool)

(declare-fun call!71196 () ListLongMap!22339)

(assert (=> bm!71193 (= call!71195 call!71196)))

(declare-fun b!1552187 () Bool)

(declare-fun res!1062734 () Bool)

(assert (=> b!1552187 (=> (not res!1062734) (not e!864087))))

(declare-datatypes ((List!36206 0))(
  ( (Nil!36203) (Cons!36202 (h!37647 (_ BitVec 64)) (t!50920 List!36206)) )
))
(declare-fun arrayNoDuplicates!0 (array!103600 (_ BitVec 32) List!36206) Bool)

(assert (=> b!1552187 (= res!1062734 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36203))))

(declare-fun b!1552188 () Bool)

(assert (=> b!1552188 (= e!864097 call!71198)))

(declare-fun b!1552189 () Bool)

(assert (=> b!1552189 (= e!864091 false)))

(declare-fun lt!669136 () Bool)

(assert (=> b!1552189 (= lt!669136 (contains!10125 lt!669127 (select (arr!49998 _keys!618) from!762)))))

(declare-fun bm!71194 () Bool)

(declare-fun call!71199 () ListLongMap!22339)

(assert (=> bm!71194 (= call!71197 (+!5005 (ite c!142930 call!71199 (ite c!142928 call!71196 call!71195)) (ite (or c!142930 c!142928) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552190 () Bool)

(declare-fun c!142929 () Bool)

(assert (=> b!1552190 (= c!142929 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669137))))

(assert (=> b!1552190 (= e!864096 e!864097)))

(declare-fun b!1552191 () Bool)

(assert (=> b!1552191 (= e!864096 call!71198)))

(declare-fun b!1552192 () Bool)

(assert (=> b!1552192 (= e!864093 (and e!864095 mapRes!59014))))

(declare-fun condMapEmpty!59014 () Bool)

(declare-fun mapDefault!59014 () ValueCell!18189)

(assert (=> b!1552192 (= condMapEmpty!59014 (= (arr!49999 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18189)) mapDefault!59014)))))

(declare-fun bm!71195 () Bool)

(assert (=> bm!71195 (= call!71199 (getCurrentListMapNoExtraKeys!6630 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552193 () Bool)

(assert (=> b!1552193 (= e!864090 tp_is_empty!38199)))

(declare-fun b!1552194 () Bool)

(declare-fun res!1062737 () Bool)

(assert (=> b!1552194 (=> (not res!1062737) (not e!864087))))

(assert (=> b!1552194 (= res!1062737 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50548 _keys!618))))))

(declare-fun bm!71196 () Bool)

(assert (=> bm!71196 (= call!71196 call!71199)))

(assert (= (and start!132296 res!1062739) b!1552180))

(assert (= (and b!1552180 res!1062733) b!1552181))

(assert (= (and b!1552181 res!1062736) b!1552187))

(assert (= (and b!1552187 res!1062734) b!1552194))

(assert (= (and b!1552194 res!1062737) b!1552178))

(assert (= (and b!1552178 c!142930) b!1552177))

(assert (= (and b!1552178 (not c!142930)) b!1552182))

(assert (= (and b!1552182 c!142928) b!1552191))

(assert (= (and b!1552182 (not c!142928)) b!1552190))

(assert (= (and b!1552190 c!142929) b!1552188))

(assert (= (and b!1552190 (not c!142929)) b!1552179))

(assert (= (or b!1552188 b!1552179) bm!71193))

(assert (= (or b!1552191 bm!71193) bm!71196))

(assert (= (or b!1552191 b!1552188) bm!71192))

(assert (= (or b!1552177 bm!71196) bm!71195))

(assert (= (or b!1552177 bm!71192) bm!71194))

(assert (= (and b!1552178 (not res!1062735)) b!1552183))

(assert (= (and b!1552178 c!142931) b!1552186))

(assert (= (and b!1552178 (not c!142931)) b!1552184))

(assert (= (and b!1552178 res!1062738) b!1552189))

(assert (= (and b!1552192 condMapEmpty!59014) mapIsEmpty!59014))

(assert (= (and b!1552192 (not condMapEmpty!59014)) mapNonEmpty!59014))

(get-info :version)

(assert (= (and mapNonEmpty!59014 ((_ is ValueCellFull!18189) mapValue!59014)) b!1552193))

(assert (= (and b!1552192 ((_ is ValueCellFull!18189) mapDefault!59014)) b!1552185))

(assert (= start!132296 b!1552192))

(declare-fun m!1430741 () Bool)

(assert (=> mapNonEmpty!59014 m!1430741))

(declare-fun m!1430743 () Bool)

(assert (=> start!132296 m!1430743))

(declare-fun m!1430745 () Bool)

(assert (=> start!132296 m!1430745))

(declare-fun m!1430747 () Bool)

(assert (=> start!132296 m!1430747))

(declare-fun m!1430749 () Bool)

(assert (=> b!1552183 m!1430749))

(assert (=> b!1552183 m!1430749))

(declare-fun m!1430751 () Bool)

(assert (=> b!1552183 m!1430751))

(declare-fun m!1430753 () Bool)

(assert (=> b!1552181 m!1430753))

(declare-fun m!1430755 () Bool)

(assert (=> b!1552187 m!1430755))

(assert (=> b!1552189 m!1430749))

(assert (=> b!1552189 m!1430749))

(declare-fun m!1430757 () Bool)

(assert (=> b!1552189 m!1430757))

(declare-fun m!1430759 () Bool)

(assert (=> bm!71195 m!1430759))

(declare-fun m!1430761 () Bool)

(assert (=> b!1552177 m!1430761))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430763 () Bool)

(assert (=> b!1552186 m!1430763))

(declare-fun m!1430765 () Bool)

(assert (=> b!1552186 m!1430765))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430767 () Bool)

(assert (=> b!1552186 m!1430767))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430769 () Bool)

(assert (=> b!1552186 m!1430769))

(assert (=> b!1552186 m!1430759))

(assert (=> b!1552186 m!1430749))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430771 () Bool)

(assert (=> b!1552186 m!1430771))

(assert (=> b!1552186 m!1430765))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430773 () Bool)

(assert (=> b!1552186 m!1430773))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430775 () Bool)

(assert (=> b!1552186 m!1430775))

(assert (=> b!1552186 m!1430749))

(declare-fun m!1430777 () Bool)

(assert (=> b!1552186 m!1430777))

(declare-fun m!1430779 () Bool)

(assert (=> b!1552186 m!1430779))

(declare-fun m!1430781 () Bool)

(assert (=> bm!71194 m!1430781))

(check-sat (not b_next!31923) (not start!132296) (not b!1552186) (not b!1552187) (not bm!71195) (not b!1552189) (not bm!71194) (not b!1552183) (not b!1552177) b_and!51361 (not b!1552181) tp_is_empty!38199 (not mapNonEmpty!59014))
(check-sat b_and!51361 (not b_next!31923))
