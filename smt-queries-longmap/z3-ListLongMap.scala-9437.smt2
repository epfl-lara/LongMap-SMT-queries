; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112232 () Bool)

(assert start!112232)

(declare-fun b_free!30627 () Bool)

(declare-fun b_next!30627 () Bool)

(assert (=> start!112232 (= b_free!30627 (not b_next!30627))))

(declare-fun tp!107517 () Bool)

(declare-fun b_and!49309 () Bool)

(assert (=> start!112232 (= tp!107517 b_and!49309)))

(declare-fun mapNonEmpty!56479 () Bool)

(declare-fun mapRes!56479 () Bool)

(declare-fun tp!107518 () Bool)

(declare-fun e!757903 () Bool)

(assert (=> mapNonEmpty!56479 (= mapRes!56479 (and tp!107518 e!757903))))

(declare-datatypes ((V!53819 0))(
  ( (V!53820 (val!18343 Int)) )
))
(declare-datatypes ((ValueCell!17370 0))(
  ( (ValueCellFull!17370 (v!20980 V!53819)) (EmptyCell!17370) )
))
(declare-datatypes ((array!89966 0))(
  ( (array!89967 (arr!43449 (Array (_ BitVec 32) ValueCell!17370)) (size!43999 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89966)

(declare-fun mapKey!56479 () (_ BitVec 32))

(declare-fun mapRest!56479 () (Array (_ BitVec 32) ValueCell!17370))

(declare-fun mapValue!56479 () ValueCell!17370)

(assert (=> mapNonEmpty!56479 (= (arr!43449 _values!1320) (store mapRest!56479 mapKey!56479 mapValue!56479))))

(declare-fun res!882125 () Bool)

(declare-fun e!757905 () Bool)

(assert (=> start!112232 (=> (not res!882125) (not e!757905))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112232 (= res!882125 (validMask!0 mask!1998))))

(assert (=> start!112232 e!757905))

(declare-fun e!757904 () Bool)

(declare-fun array_inv!32783 (array!89966) Bool)

(assert (=> start!112232 (and (array_inv!32783 _values!1320) e!757904)))

(assert (=> start!112232 true))

(declare-datatypes ((array!89968 0))(
  ( (array!89969 (arr!43450 (Array (_ BitVec 32) (_ BitVec 64))) (size!44000 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89968)

(declare-fun array_inv!32784 (array!89968) Bool)

(assert (=> start!112232 (array_inv!32784 _keys!1590)))

(assert (=> start!112232 tp!107517))

(declare-fun tp_is_empty!36537 () Bool)

(assert (=> start!112232 tp_is_empty!36537))

(declare-fun b!1329475 () Bool)

(declare-fun res!882126 () Bool)

(assert (=> b!1329475 (=> (not res!882126) (not e!757905))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329475 (= res!882126 (and (= (size!43999 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44000 _keys!1590) (size!43999 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329476 () Bool)

(declare-fun e!757902 () Bool)

(assert (=> b!1329476 (= e!757904 (and e!757902 mapRes!56479))))

(declare-fun condMapEmpty!56479 () Bool)

(declare-fun mapDefault!56479 () ValueCell!17370)

(assert (=> b!1329476 (= condMapEmpty!56479 (= (arr!43449 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17370)) mapDefault!56479)))))

(declare-fun b!1329477 () Bool)

(assert (=> b!1329477 (= e!757905 (not true))))

(declare-datatypes ((tuple2!23616 0))(
  ( (tuple2!23617 (_1!11819 (_ BitVec 64)) (_2!11819 V!53819)) )
))
(declare-datatypes ((List!30768 0))(
  ( (Nil!30765) (Cons!30764 (h!31973 tuple2!23616) (t!44808 List!30768)) )
))
(declare-datatypes ((ListLongMap!21273 0))(
  ( (ListLongMap!21274 (toList!10652 List!30768)) )
))
(declare-fun lt!590961 () ListLongMap!21273)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8816 (ListLongMap!21273 (_ BitVec 64)) Bool)

(assert (=> b!1329477 (contains!8816 lt!590961 k0!1153)))

(declare-datatypes ((Unit!43751 0))(
  ( (Unit!43752) )
))
(declare-fun lt!590962 () Unit!43751)

(declare-fun minValue!1262 () V!53819)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!238 ((_ BitVec 64) (_ BitVec 64) V!53819 ListLongMap!21273) Unit!43751)

(assert (=> b!1329477 (= lt!590962 (lemmaInListMapAfterAddingDiffThenInBefore!238 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590961))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53819)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4651 (ListLongMap!21273 tuple2!23616) ListLongMap!21273)

(declare-fun getCurrentListMapNoExtraKeys!6289 (array!89968 array!89966 (_ BitVec 32) (_ BitVec 32) V!53819 V!53819 (_ BitVec 32) Int) ListLongMap!21273)

(declare-fun get!21889 (ValueCell!17370 V!53819) V!53819)

(declare-fun dynLambda!3590 (Int (_ BitVec 64)) V!53819)

(assert (=> b!1329477 (= lt!590961 (+!4651 (getCurrentListMapNoExtraKeys!6289 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23617 (select (arr!43450 _keys!1590) from!1980) (get!21889 (select (arr!43449 _values!1320) from!1980) (dynLambda!3590 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329478 () Bool)

(declare-fun res!882123 () Bool)

(assert (=> b!1329478 (=> (not res!882123) (not e!757905))))

(assert (=> b!1329478 (= res!882123 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329479 () Bool)

(declare-fun res!882129 () Bool)

(assert (=> b!1329479 (=> (not res!882129) (not e!757905))))

(declare-datatypes ((List!30769 0))(
  ( (Nil!30766) (Cons!30765 (h!31974 (_ BitVec 64)) (t!44809 List!30769)) )
))
(declare-fun arrayNoDuplicates!0 (array!89968 (_ BitVec 32) List!30769) Bool)

(assert (=> b!1329479 (= res!882129 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30766))))

(declare-fun b!1329480 () Bool)

(declare-fun res!882127 () Bool)

(assert (=> b!1329480 (=> (not res!882127) (not e!757905))))

(assert (=> b!1329480 (= res!882127 (not (= (select (arr!43450 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329481 () Bool)

(assert (=> b!1329481 (= e!757902 tp_is_empty!36537)))

(declare-fun b!1329482 () Bool)

(declare-fun res!882122 () Bool)

(assert (=> b!1329482 (=> (not res!882122) (not e!757905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329482 (= res!882122 (validKeyInArray!0 (select (arr!43450 _keys!1590) from!1980)))))

(declare-fun b!1329483 () Bool)

(declare-fun res!882128 () Bool)

(assert (=> b!1329483 (=> (not res!882128) (not e!757905))))

(assert (=> b!1329483 (= res!882128 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44000 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329484 () Bool)

(declare-fun res!882124 () Bool)

(assert (=> b!1329484 (=> (not res!882124) (not e!757905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89968 (_ BitVec 32)) Bool)

(assert (=> b!1329484 (= res!882124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56479 () Bool)

(assert (=> mapIsEmpty!56479 mapRes!56479))

(declare-fun b!1329485 () Bool)

(assert (=> b!1329485 (= e!757903 tp_is_empty!36537)))

(declare-fun b!1329486 () Bool)

(declare-fun res!882121 () Bool)

(assert (=> b!1329486 (=> (not res!882121) (not e!757905))))

(declare-fun getCurrentListMap!5642 (array!89968 array!89966 (_ BitVec 32) (_ BitVec 32) V!53819 V!53819 (_ BitVec 32) Int) ListLongMap!21273)

(assert (=> b!1329486 (= res!882121 (contains!8816 (getCurrentListMap!5642 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112232 res!882125) b!1329475))

(assert (= (and b!1329475 res!882126) b!1329484))

(assert (= (and b!1329484 res!882124) b!1329479))

(assert (= (and b!1329479 res!882129) b!1329483))

(assert (= (and b!1329483 res!882128) b!1329486))

(assert (= (and b!1329486 res!882121) b!1329480))

(assert (= (and b!1329480 res!882127) b!1329482))

(assert (= (and b!1329482 res!882122) b!1329478))

(assert (= (and b!1329478 res!882123) b!1329477))

(assert (= (and b!1329476 condMapEmpty!56479) mapIsEmpty!56479))

(assert (= (and b!1329476 (not condMapEmpty!56479)) mapNonEmpty!56479))

(get-info :version)

(assert (= (and mapNonEmpty!56479 ((_ is ValueCellFull!17370) mapValue!56479)) b!1329485))

(assert (= (and b!1329476 ((_ is ValueCellFull!17370) mapDefault!56479)) b!1329481))

(assert (= start!112232 b!1329476))

(declare-fun b_lambda!23887 () Bool)

(assert (=> (not b_lambda!23887) (not b!1329477)))

(declare-fun t!44807 () Bool)

(declare-fun tb!11843 () Bool)

(assert (=> (and start!112232 (= defaultEntry!1323 defaultEntry!1323) t!44807) tb!11843))

(declare-fun result!24757 () Bool)

(assert (=> tb!11843 (= result!24757 tp_is_empty!36537)))

(assert (=> b!1329477 t!44807))

(declare-fun b_and!49311 () Bool)

(assert (= b_and!49309 (and (=> t!44807 result!24757) b_and!49311)))

(declare-fun m!1218229 () Bool)

(assert (=> b!1329479 m!1218229))

(declare-fun m!1218231 () Bool)

(assert (=> b!1329484 m!1218231))

(declare-fun m!1218233 () Bool)

(assert (=> start!112232 m!1218233))

(declare-fun m!1218235 () Bool)

(assert (=> start!112232 m!1218235))

(declare-fun m!1218237 () Bool)

(assert (=> start!112232 m!1218237))

(declare-fun m!1218239 () Bool)

(assert (=> b!1329486 m!1218239))

(assert (=> b!1329486 m!1218239))

(declare-fun m!1218241 () Bool)

(assert (=> b!1329486 m!1218241))

(declare-fun m!1218243 () Bool)

(assert (=> mapNonEmpty!56479 m!1218243))

(declare-fun m!1218245 () Bool)

(assert (=> b!1329482 m!1218245))

(assert (=> b!1329482 m!1218245))

(declare-fun m!1218247 () Bool)

(assert (=> b!1329482 m!1218247))

(assert (=> b!1329480 m!1218245))

(declare-fun m!1218249 () Bool)

(assert (=> b!1329477 m!1218249))

(declare-fun m!1218251 () Bool)

(assert (=> b!1329477 m!1218251))

(declare-fun m!1218253 () Bool)

(assert (=> b!1329477 m!1218253))

(declare-fun m!1218255 () Bool)

(assert (=> b!1329477 m!1218255))

(assert (=> b!1329477 m!1218249))

(declare-fun m!1218257 () Bool)

(assert (=> b!1329477 m!1218257))

(assert (=> b!1329477 m!1218251))

(declare-fun m!1218259 () Bool)

(assert (=> b!1329477 m!1218259))

(assert (=> b!1329477 m!1218255))

(declare-fun m!1218261 () Bool)

(assert (=> b!1329477 m!1218261))

(assert (=> b!1329477 m!1218245))

(check-sat (not b_next!30627) (not b!1329482) (not b!1329477) b_and!49311 (not b!1329486) (not start!112232) (not b_lambda!23887) tp_is_empty!36537 (not b!1329479) (not mapNonEmpty!56479) (not b!1329484))
(check-sat b_and!49311 (not b_next!30627))
