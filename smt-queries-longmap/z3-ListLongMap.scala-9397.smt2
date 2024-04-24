; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112100 () Bool)

(assert start!112100)

(declare-fun b_free!30475 () Bool)

(declare-fun b_next!30475 () Bool)

(assert (=> start!112100 (= b_free!30475 (not b_next!30475))))

(declare-fun tp!106904 () Bool)

(declare-fun b_and!49047 () Bool)

(assert (=> start!112100 (= tp!106904 b_and!49047)))

(declare-fun b!1326892 () Bool)

(declare-fun e!756505 () Bool)

(declare-fun tp_is_empty!36295 () Bool)

(assert (=> b!1326892 (= e!756505 tp_is_empty!36295)))

(declare-fun b!1326893 () Bool)

(declare-fun e!756503 () Bool)

(declare-fun mapRes!56094 () Bool)

(assert (=> b!1326893 (= e!756503 (and e!756505 mapRes!56094))))

(declare-fun condMapEmpty!56094 () Bool)

(declare-datatypes ((V!53497 0))(
  ( (V!53498 (val!18222 Int)) )
))
(declare-datatypes ((ValueCell!17249 0))(
  ( (ValueCellFull!17249 (v!20850 V!53497)) (EmptyCell!17249) )
))
(declare-datatypes ((array!89591 0))(
  ( (array!89592 (arr!43264 (Array (_ BitVec 32) ValueCell!17249)) (size!43815 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89591)

(declare-fun mapDefault!56094 () ValueCell!17249)

(assert (=> b!1326893 (= condMapEmpty!56094 (= (arr!43264 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17249)) mapDefault!56094)))))

(declare-fun mapNonEmpty!56094 () Bool)

(declare-fun tp!106905 () Bool)

(declare-fun e!756502 () Bool)

(assert (=> mapNonEmpty!56094 (= mapRes!56094 (and tp!106905 e!756502))))

(declare-fun mapRest!56094 () (Array (_ BitVec 32) ValueCell!17249))

(declare-fun mapValue!56094 () ValueCell!17249)

(declare-fun mapKey!56094 () (_ BitVec 32))

(assert (=> mapNonEmpty!56094 (= (arr!43264 _values!1337) (store mapRest!56094 mapKey!56094 mapValue!56094))))

(declare-fun b!1326894 () Bool)

(declare-fun e!756504 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1326894 (= e!756504 (not (bvslt from!2000 (size!43815 _values!1337))))))

(declare-datatypes ((tuple2!23538 0))(
  ( (tuple2!23539 (_1!11780 (_ BitVec 64)) (_2!11780 V!53497)) )
))
(declare-datatypes ((List!30688 0))(
  ( (Nil!30685) (Cons!30684 (h!31902 tuple2!23538) (t!44626 List!30688)) )
))
(declare-datatypes ((ListLongMap!21203 0))(
  ( (ListLongMap!21204 (toList!10617 List!30688)) )
))
(declare-fun lt!590284 () ListLongMap!21203)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8785 (ListLongMap!21203 (_ BitVec 64)) Bool)

(assert (=> b!1326894 (contains!8785 lt!590284 k0!1164)))

(declare-datatypes ((Unit!43617 0))(
  ( (Unit!43618) )
))
(declare-fun lt!590285 () Unit!43617)

(declare-fun minValue!1279 () V!53497)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!212 ((_ BitVec 64) (_ BitVec 64) V!53497 ListLongMap!21203) Unit!43617)

(assert (=> b!1326894 (= lt!590285 (lemmaInListMapAfterAddingDiffThenInBefore!212 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590284))))

(declare-datatypes ((array!89593 0))(
  ( (array!89594 (arr!43265 (Array (_ BitVec 32) (_ BitVec 64))) (size!43816 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89593)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53497)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4662 (ListLongMap!21203 tuple2!23538) ListLongMap!21203)

(declare-fun getCurrentListMapNoExtraKeys!6306 (array!89593 array!89591 (_ BitVec 32) (_ BitVec 32) V!53497 V!53497 (_ BitVec 32) Int) ListLongMap!21203)

(declare-fun get!21818 (ValueCell!17249 V!53497) V!53497)

(declare-fun dynLambda!3616 (Int (_ BitVec 64)) V!53497)

(assert (=> b!1326894 (= lt!590284 (+!4662 (+!4662 (getCurrentListMapNoExtraKeys!6306 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23539 (select (arr!43265 _keys!1609) from!2000) (get!21818 (select (arr!43264 _values!1337) from!2000) (dynLambda!3616 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun res!880295 () Bool)

(assert (=> start!112100 (=> (not res!880295) (not e!756504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112100 (= res!880295 (validMask!0 mask!2019))))

(assert (=> start!112100 e!756504))

(declare-fun array_inv!32923 (array!89593) Bool)

(assert (=> start!112100 (array_inv!32923 _keys!1609)))

(assert (=> start!112100 true))

(assert (=> start!112100 tp_is_empty!36295))

(declare-fun array_inv!32924 (array!89591) Bool)

(assert (=> start!112100 (and (array_inv!32924 _values!1337) e!756503)))

(assert (=> start!112100 tp!106904))

(declare-fun b!1326895 () Bool)

(declare-fun res!880296 () Bool)

(assert (=> b!1326895 (=> (not res!880296) (not e!756504))))

(assert (=> b!1326895 (= res!880296 (and (= (size!43815 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43816 _keys!1609) (size!43815 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326896 () Bool)

(declare-fun res!880299 () Bool)

(assert (=> b!1326896 (=> (not res!880299) (not e!756504))))

(assert (=> b!1326896 (= res!880299 (not (= (select (arr!43265 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326897 () Bool)

(declare-fun res!880298 () Bool)

(assert (=> b!1326897 (=> (not res!880298) (not e!756504))))

(declare-fun getCurrentListMap!5596 (array!89593 array!89591 (_ BitVec 32) (_ BitVec 32) V!53497 V!53497 (_ BitVec 32) Int) ListLongMap!21203)

(assert (=> b!1326897 (= res!880298 (contains!8785 (getCurrentListMap!5596 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56094 () Bool)

(assert (=> mapIsEmpty!56094 mapRes!56094))

(declare-fun b!1326898 () Bool)

(assert (=> b!1326898 (= e!756502 tp_is_empty!36295)))

(declare-fun b!1326899 () Bool)

(declare-fun res!880300 () Bool)

(assert (=> b!1326899 (=> (not res!880300) (not e!756504))))

(declare-datatypes ((List!30689 0))(
  ( (Nil!30686) (Cons!30685 (h!31903 (_ BitVec 64)) (t!44627 List!30689)) )
))
(declare-fun arrayNoDuplicates!0 (array!89593 (_ BitVec 32) List!30689) Bool)

(assert (=> b!1326899 (= res!880300 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30686))))

(declare-fun b!1326900 () Bool)

(declare-fun res!880297 () Bool)

(assert (=> b!1326900 (=> (not res!880297) (not e!756504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89593 (_ BitVec 32)) Bool)

(assert (=> b!1326900 (= res!880297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326901 () Bool)

(declare-fun res!880302 () Bool)

(assert (=> b!1326901 (=> (not res!880302) (not e!756504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326901 (= res!880302 (validKeyInArray!0 (select (arr!43265 _keys!1609) from!2000)))))

(declare-fun b!1326902 () Bool)

(declare-fun res!880301 () Bool)

(assert (=> b!1326902 (=> (not res!880301) (not e!756504))))

(assert (=> b!1326902 (= res!880301 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43816 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112100 res!880295) b!1326895))

(assert (= (and b!1326895 res!880296) b!1326900))

(assert (= (and b!1326900 res!880297) b!1326899))

(assert (= (and b!1326899 res!880300) b!1326902))

(assert (= (and b!1326902 res!880301) b!1326897))

(assert (= (and b!1326897 res!880298) b!1326896))

(assert (= (and b!1326896 res!880299) b!1326901))

(assert (= (and b!1326901 res!880302) b!1326894))

(assert (= (and b!1326893 condMapEmpty!56094) mapIsEmpty!56094))

(assert (= (and b!1326893 (not condMapEmpty!56094)) mapNonEmpty!56094))

(get-info :version)

(assert (= (and mapNonEmpty!56094 ((_ is ValueCellFull!17249) mapValue!56094)) b!1326898))

(assert (= (and b!1326893 ((_ is ValueCellFull!17249) mapDefault!56094)) b!1326892))

(assert (= start!112100 b!1326893))

(declare-fun b_lambda!23747 () Bool)

(assert (=> (not b_lambda!23747) (not b!1326894)))

(declare-fun t!44625 () Bool)

(declare-fun tb!11741 () Bool)

(assert (=> (and start!112100 (= defaultEntry!1340 defaultEntry!1340) t!44625) tb!11741))

(declare-fun result!24547 () Bool)

(assert (=> tb!11741 (= result!24547 tp_is_empty!36295)))

(assert (=> b!1326894 t!44625))

(declare-fun b_and!49049 () Bool)

(assert (= b_and!49047 (and (=> t!44625 result!24547) b_and!49049)))

(declare-fun m!1216083 () Bool)

(assert (=> b!1326896 m!1216083))

(declare-fun m!1216085 () Bool)

(assert (=> b!1326900 m!1216085))

(declare-fun m!1216087 () Bool)

(assert (=> b!1326894 m!1216087))

(declare-fun m!1216089 () Bool)

(assert (=> b!1326894 m!1216089))

(declare-fun m!1216091 () Bool)

(assert (=> b!1326894 m!1216091))

(assert (=> b!1326894 m!1216089))

(declare-fun m!1216093 () Bool)

(assert (=> b!1326894 m!1216093))

(declare-fun m!1216095 () Bool)

(assert (=> b!1326894 m!1216095))

(declare-fun m!1216097 () Bool)

(assert (=> b!1326894 m!1216097))

(assert (=> b!1326894 m!1216093))

(declare-fun m!1216099 () Bool)

(assert (=> b!1326894 m!1216099))

(assert (=> b!1326894 m!1216097))

(assert (=> b!1326894 m!1216091))

(declare-fun m!1216101 () Bool)

(assert (=> b!1326894 m!1216101))

(assert (=> b!1326894 m!1216083))

(assert (=> b!1326901 m!1216083))

(assert (=> b!1326901 m!1216083))

(declare-fun m!1216103 () Bool)

(assert (=> b!1326901 m!1216103))

(declare-fun m!1216105 () Bool)

(assert (=> mapNonEmpty!56094 m!1216105))

(declare-fun m!1216107 () Bool)

(assert (=> start!112100 m!1216107))

(declare-fun m!1216109 () Bool)

(assert (=> start!112100 m!1216109))

(declare-fun m!1216111 () Bool)

(assert (=> start!112100 m!1216111))

(declare-fun m!1216113 () Bool)

(assert (=> b!1326897 m!1216113))

(assert (=> b!1326897 m!1216113))

(declare-fun m!1216115 () Bool)

(assert (=> b!1326897 m!1216115))

(declare-fun m!1216117 () Bool)

(assert (=> b!1326899 m!1216117))

(check-sat (not start!112100) (not mapNonEmpty!56094) (not b!1326900) (not b_lambda!23747) (not b!1326899) (not b!1326897) (not b!1326901) (not b_next!30475) b_and!49049 (not b!1326894) tp_is_empty!36295)
(check-sat b_and!49049 (not b_next!30475))
