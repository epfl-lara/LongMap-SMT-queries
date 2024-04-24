; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112112 () Bool)

(assert start!112112)

(declare-fun b_free!30487 () Bool)

(declare-fun b_next!30487 () Bool)

(assert (=> start!112112 (= b_free!30487 (not b_next!30487))))

(declare-fun tp!106941 () Bool)

(declare-fun b_and!49071 () Bool)

(assert (=> start!112112 (= tp!106941 b_and!49071)))

(declare-fun b!1327102 () Bool)

(declare-fun res!880443 () Bool)

(declare-fun e!756592 () Bool)

(assert (=> b!1327102 (=> (not res!880443) (not e!756592))))

(declare-datatypes ((array!89615 0))(
  ( (array!89616 (arr!43276 (Array (_ BitVec 32) (_ BitVec 64))) (size!43827 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89615)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53513 0))(
  ( (V!53514 (val!18228 Int)) )
))
(declare-datatypes ((ValueCell!17255 0))(
  ( (ValueCellFull!17255 (v!20856 V!53513)) (EmptyCell!17255) )
))
(declare-datatypes ((array!89617 0))(
  ( (array!89618 (arr!43277 (Array (_ BitVec 32) ValueCell!17255)) (size!43828 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89617)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1327102 (= res!880443 (and (= (size!43828 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43827 _keys!1609) (size!43828 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327103 () Bool)

(assert (=> b!1327103 (= e!756592 (not true))))

(declare-datatypes ((tuple2!23548 0))(
  ( (tuple2!23549 (_1!11785 (_ BitVec 64)) (_2!11785 V!53513)) )
))
(declare-datatypes ((List!30698 0))(
  ( (Nil!30695) (Cons!30694 (h!31912 tuple2!23548) (t!44648 List!30698)) )
))
(declare-datatypes ((ListLongMap!21213 0))(
  ( (ListLongMap!21214 (toList!10622 List!30698)) )
))
(declare-fun lt!590320 () ListLongMap!21213)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8790 (ListLongMap!21213 (_ BitVec 64)) Bool)

(assert (=> b!1327103 (contains!8790 lt!590320 k0!1164)))

(declare-fun minValue!1279 () V!53513)

(declare-datatypes ((Unit!43627 0))(
  ( (Unit!43628) )
))
(declare-fun lt!590321 () Unit!43627)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!217 ((_ BitVec 64) (_ BitVec 64) V!53513 ListLongMap!21213) Unit!43627)

(assert (=> b!1327103 (= lt!590321 (lemmaInListMapAfterAddingDiffThenInBefore!217 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590320))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53513)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4667 (ListLongMap!21213 tuple2!23548) ListLongMap!21213)

(declare-fun getCurrentListMapNoExtraKeys!6311 (array!89615 array!89617 (_ BitVec 32) (_ BitVec 32) V!53513 V!53513 (_ BitVec 32) Int) ListLongMap!21213)

(declare-fun get!21827 (ValueCell!17255 V!53513) V!53513)

(declare-fun dynLambda!3621 (Int (_ BitVec 64)) V!53513)

(assert (=> b!1327103 (= lt!590320 (+!4667 (+!4667 (getCurrentListMapNoExtraKeys!6311 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23549 (select (arr!43276 _keys!1609) from!2000) (get!21827 (select (arr!43277 _values!1337) from!2000) (dynLambda!3621 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1327104 () Bool)

(declare-fun res!880442 () Bool)

(assert (=> b!1327104 (=> (not res!880442) (not e!756592))))

(assert (=> b!1327104 (= res!880442 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43827 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327105 () Bool)

(declare-fun res!880444 () Bool)

(assert (=> b!1327105 (=> (not res!880444) (not e!756592))))

(assert (=> b!1327105 (= res!880444 (not (= (select (arr!43276 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1327106 () Bool)

(declare-fun e!756591 () Bool)

(declare-fun tp_is_empty!36307 () Bool)

(assert (=> b!1327106 (= e!756591 tp_is_empty!36307)))

(declare-fun b!1327107 () Bool)

(declare-fun res!880445 () Bool)

(assert (=> b!1327107 (=> (not res!880445) (not e!756592))))

(declare-datatypes ((List!30699 0))(
  ( (Nil!30696) (Cons!30695 (h!31913 (_ BitVec 64)) (t!44649 List!30699)) )
))
(declare-fun arrayNoDuplicates!0 (array!89615 (_ BitVec 32) List!30699) Bool)

(assert (=> b!1327107 (= res!880445 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30696))))

(declare-fun b!1327108 () Bool)

(declare-fun res!880441 () Bool)

(assert (=> b!1327108 (=> (not res!880441) (not e!756592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327108 (= res!880441 (validKeyInArray!0 (select (arr!43276 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!56112 () Bool)

(declare-fun mapRes!56112 () Bool)

(declare-fun tp!106940 () Bool)

(declare-fun e!756595 () Bool)

(assert (=> mapNonEmpty!56112 (= mapRes!56112 (and tp!106940 e!756595))))

(declare-fun mapKey!56112 () (_ BitVec 32))

(declare-fun mapValue!56112 () ValueCell!17255)

(declare-fun mapRest!56112 () (Array (_ BitVec 32) ValueCell!17255))

(assert (=> mapNonEmpty!56112 (= (arr!43277 _values!1337) (store mapRest!56112 mapKey!56112 mapValue!56112))))

(declare-fun b!1327109 () Bool)

(declare-fun e!756594 () Bool)

(assert (=> b!1327109 (= e!756594 (and e!756591 mapRes!56112))))

(declare-fun condMapEmpty!56112 () Bool)

(declare-fun mapDefault!56112 () ValueCell!17255)

(assert (=> b!1327109 (= condMapEmpty!56112 (= (arr!43277 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17255)) mapDefault!56112)))))

(declare-fun b!1327110 () Bool)

(declare-fun res!880439 () Bool)

(assert (=> b!1327110 (=> (not res!880439) (not e!756592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89615 (_ BitVec 32)) Bool)

(assert (=> b!1327110 (= res!880439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327111 () Bool)

(assert (=> b!1327111 (= e!756595 tp_is_empty!36307)))

(declare-fun mapIsEmpty!56112 () Bool)

(assert (=> mapIsEmpty!56112 mapRes!56112))

(declare-fun b!1327112 () Bool)

(declare-fun res!880446 () Bool)

(assert (=> b!1327112 (=> (not res!880446) (not e!756592))))

(declare-fun getCurrentListMap!5601 (array!89615 array!89617 (_ BitVec 32) (_ BitVec 32) V!53513 V!53513 (_ BitVec 32) Int) ListLongMap!21213)

(assert (=> b!1327112 (= res!880446 (contains!8790 (getCurrentListMap!5601 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!880440 () Bool)

(assert (=> start!112112 (=> (not res!880440) (not e!756592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112112 (= res!880440 (validMask!0 mask!2019))))

(assert (=> start!112112 e!756592))

(declare-fun array_inv!32931 (array!89615) Bool)

(assert (=> start!112112 (array_inv!32931 _keys!1609)))

(assert (=> start!112112 true))

(assert (=> start!112112 tp_is_empty!36307))

(declare-fun array_inv!32932 (array!89617) Bool)

(assert (=> start!112112 (and (array_inv!32932 _values!1337) e!756594)))

(assert (=> start!112112 tp!106941))

(assert (= (and start!112112 res!880440) b!1327102))

(assert (= (and b!1327102 res!880443) b!1327110))

(assert (= (and b!1327110 res!880439) b!1327107))

(assert (= (and b!1327107 res!880445) b!1327104))

(assert (= (and b!1327104 res!880442) b!1327112))

(assert (= (and b!1327112 res!880446) b!1327105))

(assert (= (and b!1327105 res!880444) b!1327108))

(assert (= (and b!1327108 res!880441) b!1327103))

(assert (= (and b!1327109 condMapEmpty!56112) mapIsEmpty!56112))

(assert (= (and b!1327109 (not condMapEmpty!56112)) mapNonEmpty!56112))

(get-info :version)

(assert (= (and mapNonEmpty!56112 ((_ is ValueCellFull!17255) mapValue!56112)) b!1327111))

(assert (= (and b!1327109 ((_ is ValueCellFull!17255) mapDefault!56112)) b!1327106))

(assert (= start!112112 b!1327109))

(declare-fun b_lambda!23759 () Bool)

(assert (=> (not b_lambda!23759) (not b!1327103)))

(declare-fun t!44647 () Bool)

(declare-fun tb!11753 () Bool)

(assert (=> (and start!112112 (= defaultEntry!1340 defaultEntry!1340) t!44647) tb!11753))

(declare-fun result!24571 () Bool)

(assert (=> tb!11753 (= result!24571 tp_is_empty!36307)))

(assert (=> b!1327103 t!44647))

(declare-fun b_and!49073 () Bool)

(assert (= b_and!49071 (and (=> t!44647 result!24571) b_and!49073)))

(declare-fun m!1216299 () Bool)

(assert (=> mapNonEmpty!56112 m!1216299))

(declare-fun m!1216301 () Bool)

(assert (=> b!1327107 m!1216301))

(declare-fun m!1216303 () Bool)

(assert (=> start!112112 m!1216303))

(declare-fun m!1216305 () Bool)

(assert (=> start!112112 m!1216305))

(declare-fun m!1216307 () Bool)

(assert (=> start!112112 m!1216307))

(declare-fun m!1216309 () Bool)

(assert (=> b!1327110 m!1216309))

(declare-fun m!1216311 () Bool)

(assert (=> b!1327103 m!1216311))

(declare-fun m!1216313 () Bool)

(assert (=> b!1327103 m!1216313))

(declare-fun m!1216315 () Bool)

(assert (=> b!1327103 m!1216315))

(declare-fun m!1216317 () Bool)

(assert (=> b!1327103 m!1216317))

(assert (=> b!1327103 m!1216313))

(declare-fun m!1216319 () Bool)

(assert (=> b!1327103 m!1216319))

(declare-fun m!1216321 () Bool)

(assert (=> b!1327103 m!1216321))

(assert (=> b!1327103 m!1216319))

(declare-fun m!1216323 () Bool)

(assert (=> b!1327103 m!1216323))

(assert (=> b!1327103 m!1216321))

(assert (=> b!1327103 m!1216317))

(declare-fun m!1216325 () Bool)

(assert (=> b!1327103 m!1216325))

(declare-fun m!1216327 () Bool)

(assert (=> b!1327103 m!1216327))

(declare-fun m!1216329 () Bool)

(assert (=> b!1327112 m!1216329))

(assert (=> b!1327112 m!1216329))

(declare-fun m!1216331 () Bool)

(assert (=> b!1327112 m!1216331))

(assert (=> b!1327105 m!1216327))

(assert (=> b!1327108 m!1216327))

(assert (=> b!1327108 m!1216327))

(declare-fun m!1216333 () Bool)

(assert (=> b!1327108 m!1216333))

(check-sat (not b!1327110) (not start!112112) (not b!1327103) b_and!49073 (not b!1327112) tp_is_empty!36307 (not b_lambda!23759) (not b_next!30487) (not b!1327107) (not mapNonEmpty!56112) (not b!1327108))
(check-sat b_and!49073 (not b_next!30487))
