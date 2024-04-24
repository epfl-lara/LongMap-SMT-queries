; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111736 () Bool)

(assert start!111736)

(declare-fun b_free!30169 () Bool)

(declare-fun b_next!30169 () Bool)

(assert (=> start!111736 (= b_free!30169 (not b_next!30169))))

(declare-fun tp!105982 () Bool)

(declare-fun b_and!48499 () Bool)

(assert (=> start!111736 (= tp!105982 b_and!48499)))

(declare-fun res!876730 () Bool)

(declare-fun e!753951 () Bool)

(assert (=> start!111736 (=> (not res!876730) (not e!753951))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111736 (= res!876730 (validMask!0 mask!2019))))

(assert (=> start!111736 e!753951))

(declare-datatypes ((array!88987 0))(
  ( (array!88988 (arr!42963 (Array (_ BitVec 32) (_ BitVec 64))) (size!43514 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88987)

(declare-fun array_inv!32715 (array!88987) Bool)

(assert (=> start!111736 (array_inv!32715 _keys!1609)))

(assert (=> start!111736 true))

(declare-fun tp_is_empty!35989 () Bool)

(assert (=> start!111736 tp_is_empty!35989))

(declare-datatypes ((V!53089 0))(
  ( (V!53090 (val!18069 Int)) )
))
(declare-datatypes ((ValueCell!17096 0))(
  ( (ValueCellFull!17096 (v!20694 V!53089)) (EmptyCell!17096) )
))
(declare-datatypes ((array!88989 0))(
  ( (array!88990 (arr!42964 (Array (_ BitVec 32) ValueCell!17096)) (size!43515 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88989)

(declare-fun e!753948 () Bool)

(declare-fun array_inv!32716 (array!88989) Bool)

(assert (=> start!111736 (and (array_inv!32716 _values!1337) e!753948)))

(assert (=> start!111736 tp!105982))

(declare-fun b!1321474 () Bool)

(declare-fun e!753950 () Bool)

(assert (=> b!1321474 (= e!753950 tp_is_empty!35989)))

(declare-fun b!1321475 () Bool)

(declare-fun e!753949 () Bool)

(assert (=> b!1321475 (= e!753949 tp_is_empty!35989)))

(declare-fun b!1321476 () Bool)

(declare-fun res!876728 () Bool)

(assert (=> b!1321476 (=> (not res!876728) (not e!753951))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321476 (= res!876728 (validKeyInArray!0 (select (arr!42963 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55631 () Bool)

(declare-fun mapRes!55631 () Bool)

(declare-fun tp!105983 () Bool)

(assert (=> mapNonEmpty!55631 (= mapRes!55631 (and tp!105983 e!753950))))

(declare-fun mapRest!55631 () (Array (_ BitVec 32) ValueCell!17096))

(declare-fun mapValue!55631 () ValueCell!17096)

(declare-fun mapKey!55631 () (_ BitVec 32))

(assert (=> mapNonEmpty!55631 (= (arr!42964 _values!1337) (store mapRest!55631 mapKey!55631 mapValue!55631))))

(declare-fun b!1321477 () Bool)

(declare-fun res!876726 () Bool)

(assert (=> b!1321477 (=> (not res!876726) (not e!753951))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321477 (= res!876726 (and (= (size!43515 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43514 _keys!1609) (size!43515 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321478 () Bool)

(declare-fun res!876725 () Bool)

(assert (=> b!1321478 (=> (not res!876725) (not e!753951))))

(declare-fun zeroValue!1279 () V!53089)

(declare-fun minValue!1279 () V!53089)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23302 0))(
  ( (tuple2!23303 (_1!11662 (_ BitVec 64)) (_2!11662 V!53089)) )
))
(declare-datatypes ((List!30457 0))(
  ( (Nil!30454) (Cons!30453 (h!31671 tuple2!23302) (t!44167 List!30457)) )
))
(declare-datatypes ((ListLongMap!20967 0))(
  ( (ListLongMap!20968 (toList!10499 List!30457)) )
))
(declare-fun contains!8666 (ListLongMap!20967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5495 (array!88987 array!88989 (_ BitVec 32) (_ BitVec 32) V!53089 V!53089 (_ BitVec 32) Int) ListLongMap!20967)

(assert (=> b!1321478 (= res!876725 (contains!8666 (getCurrentListMap!5495 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321479 () Bool)

(declare-fun res!876727 () Bool)

(assert (=> b!1321479 (=> (not res!876727) (not e!753951))))

(declare-datatypes ((List!30458 0))(
  ( (Nil!30455) (Cons!30454 (h!31672 (_ BitVec 64)) (t!44168 List!30458)) )
))
(declare-fun arrayNoDuplicates!0 (array!88987 (_ BitVec 32) List!30458) Bool)

(assert (=> b!1321479 (= res!876727 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30455))))

(declare-fun b!1321480 () Bool)

(declare-fun res!876723 () Bool)

(assert (=> b!1321480 (=> (not res!876723) (not e!753951))))

(assert (=> b!1321480 (= res!876723 (not (= (select (arr!42963 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321481 () Bool)

(assert (=> b!1321481 (= e!753951 (not true))))

(declare-fun lt!587337 () ListLongMap!20967)

(assert (=> b!1321481 (contains!8666 lt!587337 k0!1164)))

(declare-datatypes ((Unit!43453 0))(
  ( (Unit!43454) )
))
(declare-fun lt!587336 () Unit!43453)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!138 ((_ BitVec 64) (_ BitVec 64) V!53089 ListLongMap!20967) Unit!43453)

(assert (=> b!1321481 (= lt!587336 (lemmaInListMapAfterAddingDiffThenInBefore!138 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587337))))

(declare-fun lt!587339 () ListLongMap!20967)

(assert (=> b!1321481 (contains!8666 lt!587339 k0!1164)))

(declare-fun lt!587338 () Unit!43453)

(assert (=> b!1321481 (= lt!587338 (lemmaInListMapAfterAddingDiffThenInBefore!138 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587339))))

(declare-fun +!4583 (ListLongMap!20967 tuple2!23302) ListLongMap!20967)

(assert (=> b!1321481 (= lt!587339 (+!4583 lt!587337 (tuple2!23303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6222 (array!88987 array!88989 (_ BitVec 32) (_ BitVec 32) V!53089 V!53089 (_ BitVec 32) Int) ListLongMap!20967)

(declare-fun get!21634 (ValueCell!17096 V!53089) V!53089)

(declare-fun dynLambda!3537 (Int (_ BitVec 64)) V!53089)

(assert (=> b!1321481 (= lt!587337 (+!4583 (getCurrentListMapNoExtraKeys!6222 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23303 (select (arr!42963 _keys!1609) from!2000) (get!21634 (select (arr!42964 _values!1337) from!2000) (dynLambda!3537 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1321482 () Bool)

(declare-fun res!876724 () Bool)

(assert (=> b!1321482 (=> (not res!876724) (not e!753951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88987 (_ BitVec 32)) Bool)

(assert (=> b!1321482 (= res!876724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321483 () Bool)

(declare-fun res!876729 () Bool)

(assert (=> b!1321483 (=> (not res!876729) (not e!753951))))

(assert (=> b!1321483 (= res!876729 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43514 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321484 () Bool)

(assert (=> b!1321484 (= e!753948 (and e!753949 mapRes!55631))))

(declare-fun condMapEmpty!55631 () Bool)

(declare-fun mapDefault!55631 () ValueCell!17096)

(assert (=> b!1321484 (= condMapEmpty!55631 (= (arr!42964 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17096)) mapDefault!55631)))))

(declare-fun mapIsEmpty!55631 () Bool)

(assert (=> mapIsEmpty!55631 mapRes!55631))

(assert (= (and start!111736 res!876730) b!1321477))

(assert (= (and b!1321477 res!876726) b!1321482))

(assert (= (and b!1321482 res!876724) b!1321479))

(assert (= (and b!1321479 res!876727) b!1321483))

(assert (= (and b!1321483 res!876729) b!1321478))

(assert (= (and b!1321478 res!876725) b!1321480))

(assert (= (and b!1321480 res!876723) b!1321476))

(assert (= (and b!1321476 res!876728) b!1321481))

(assert (= (and b!1321484 condMapEmpty!55631) mapIsEmpty!55631))

(assert (= (and b!1321484 (not condMapEmpty!55631)) mapNonEmpty!55631))

(get-info :version)

(assert (= (and mapNonEmpty!55631 ((_ is ValueCellFull!17096) mapValue!55631)) b!1321474))

(assert (= (and b!1321484 ((_ is ValueCellFull!17096) mapDefault!55631)) b!1321475))

(assert (= start!111736 b!1321484))

(declare-fun b_lambda!23489 () Bool)

(assert (=> (not b_lambda!23489) (not b!1321481)))

(declare-fun t!44166 () Bool)

(declare-fun tb!11513 () Bool)

(assert (=> (and start!111736 (= defaultEntry!1340 defaultEntry!1340) t!44166) tb!11513))

(declare-fun result!24089 () Bool)

(assert (=> tb!11513 (= result!24089 tp_is_empty!35989)))

(assert (=> b!1321481 t!44166))

(declare-fun b_and!48501 () Bool)

(assert (= b_and!48499 (and (=> t!44166 result!24089) b_and!48501)))

(declare-fun m!1209449 () Bool)

(assert (=> b!1321482 m!1209449))

(declare-fun m!1209451 () Bool)

(assert (=> b!1321476 m!1209451))

(assert (=> b!1321476 m!1209451))

(declare-fun m!1209453 () Bool)

(assert (=> b!1321476 m!1209453))

(declare-fun m!1209455 () Bool)

(assert (=> mapNonEmpty!55631 m!1209455))

(declare-fun m!1209457 () Bool)

(assert (=> b!1321479 m!1209457))

(declare-fun m!1209459 () Bool)

(assert (=> b!1321481 m!1209459))

(declare-fun m!1209461 () Bool)

(assert (=> b!1321481 m!1209461))

(assert (=> b!1321481 m!1209459))

(declare-fun m!1209463 () Bool)

(assert (=> b!1321481 m!1209463))

(declare-fun m!1209465 () Bool)

(assert (=> b!1321481 m!1209465))

(assert (=> b!1321481 m!1209465))

(assert (=> b!1321481 m!1209461))

(declare-fun m!1209467 () Bool)

(assert (=> b!1321481 m!1209467))

(assert (=> b!1321481 m!1209451))

(declare-fun m!1209469 () Bool)

(assert (=> b!1321481 m!1209469))

(declare-fun m!1209471 () Bool)

(assert (=> b!1321481 m!1209471))

(declare-fun m!1209473 () Bool)

(assert (=> b!1321481 m!1209473))

(declare-fun m!1209475 () Bool)

(assert (=> b!1321481 m!1209475))

(declare-fun m!1209477 () Bool)

(assert (=> b!1321481 m!1209477))

(assert (=> b!1321480 m!1209451))

(declare-fun m!1209479 () Bool)

(assert (=> b!1321478 m!1209479))

(assert (=> b!1321478 m!1209479))

(declare-fun m!1209481 () Bool)

(assert (=> b!1321478 m!1209481))

(declare-fun m!1209483 () Bool)

(assert (=> start!111736 m!1209483))

(declare-fun m!1209485 () Bool)

(assert (=> start!111736 m!1209485))

(declare-fun m!1209487 () Bool)

(assert (=> start!111736 m!1209487))

(check-sat (not b!1321482) (not start!111736) (not b!1321478) (not b_next!30169) (not b!1321476) tp_is_empty!35989 (not b!1321479) b_and!48501 (not b_lambda!23489) (not b!1321481) (not mapNonEmpty!55631))
(check-sat b_and!48501 (not b_next!30169))
