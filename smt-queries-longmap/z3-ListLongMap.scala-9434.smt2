; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112436 () Bool)

(assert start!112436)

(declare-fun b_free!30607 () Bool)

(declare-fun b_next!30607 () Bool)

(assert (=> start!112436 (= b_free!30607 (not b_next!30607))))

(declare-fun tp!107457 () Bool)

(declare-fun b_and!49271 () Bool)

(assert (=> start!112436 (= tp!107457 b_and!49271)))

(declare-fun b!1330394 () Bool)

(declare-fun res!882371 () Bool)

(declare-fun e!758599 () Bool)

(assert (=> b!1330394 (=> (not res!882371) (not e!758599))))

(declare-datatypes ((array!90035 0))(
  ( (array!90036 (arr!43479 (Array (_ BitVec 32) (_ BitVec 64))) (size!44030 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90035)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90035 (_ BitVec 32)) Bool)

(assert (=> b!1330394 (= res!882371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330395 () Bool)

(assert (=> b!1330395 (= e!758599 (not true))))

(declare-datatypes ((V!53793 0))(
  ( (V!53794 (val!18333 Int)) )
))
(declare-datatypes ((tuple2!23630 0))(
  ( (tuple2!23631 (_1!11826 (_ BitVec 64)) (_2!11826 V!53793)) )
))
(declare-datatypes ((List!30805 0))(
  ( (Nil!30802) (Cons!30801 (h!32019 tuple2!23630) (t!44817 List!30805)) )
))
(declare-datatypes ((ListLongMap!21295 0))(
  ( (ListLongMap!21296 (toList!10663 List!30805)) )
))
(declare-fun lt!591378 () ListLongMap!21295)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8839 (ListLongMap!21295 (_ BitVec 64)) Bool)

(assert (=> b!1330395 (contains!8839 lt!591378 k0!1153)))

(declare-datatypes ((Unit!43682 0))(
  ( (Unit!43683) )
))
(declare-fun lt!591377 () Unit!43682)

(declare-fun minValue!1262 () V!53793)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!229 ((_ BitVec 64) (_ BitVec 64) V!53793 ListLongMap!21295) Unit!43682)

(assert (=> b!1330395 (= lt!591377 (lemmaInListMapAfterAddingDiffThenInBefore!229 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591378))))

(declare-datatypes ((ValueCell!17360 0))(
  ( (ValueCellFull!17360 (v!20965 V!53793)) (EmptyCell!17360) )
))
(declare-datatypes ((array!90037 0))(
  ( (array!90038 (arr!43480 (Array (_ BitVec 32) ValueCell!17360)) (size!44031 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90037)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53793)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4686 (ListLongMap!21295 tuple2!23630) ListLongMap!21295)

(declare-fun getCurrentListMapNoExtraKeys!6330 (array!90035 array!90037 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21295)

(declare-fun get!21921 (ValueCell!17360 V!53793) V!53793)

(declare-fun dynLambda!3640 (Int (_ BitVec 64)) V!53793)

(assert (=> b!1330395 (= lt!591378 (+!4686 (getCurrentListMapNoExtraKeys!6330 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23631 (select (arr!43479 _keys!1590) from!1980) (get!21921 (select (arr!43480 _values!1320) from!1980) (dynLambda!3640 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330396 () Bool)

(declare-fun e!758597 () Bool)

(declare-fun e!758596 () Bool)

(declare-fun mapRes!56449 () Bool)

(assert (=> b!1330396 (= e!758597 (and e!758596 mapRes!56449))))

(declare-fun condMapEmpty!56449 () Bool)

(declare-fun mapDefault!56449 () ValueCell!17360)

(assert (=> b!1330396 (= condMapEmpty!56449 (= (arr!43480 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17360)) mapDefault!56449)))))

(declare-fun b!1330397 () Bool)

(declare-fun res!882375 () Bool)

(assert (=> b!1330397 (=> (not res!882375) (not e!758599))))

(declare-datatypes ((List!30806 0))(
  ( (Nil!30803) (Cons!30802 (h!32020 (_ BitVec 64)) (t!44818 List!30806)) )
))
(declare-fun arrayNoDuplicates!0 (array!90035 (_ BitVec 32) List!30806) Bool)

(assert (=> b!1330397 (= res!882375 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30803))))

(declare-fun b!1330398 () Bool)

(declare-fun res!882377 () Bool)

(assert (=> b!1330398 (=> (not res!882377) (not e!758599))))

(assert (=> b!1330398 (= res!882377 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882373 () Bool)

(assert (=> start!112436 (=> (not res!882373) (not e!758599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112436 (= res!882373 (validMask!0 mask!1998))))

(assert (=> start!112436 e!758599))

(declare-fun array_inv!33089 (array!90037) Bool)

(assert (=> start!112436 (and (array_inv!33089 _values!1320) e!758597)))

(assert (=> start!112436 true))

(declare-fun array_inv!33090 (array!90035) Bool)

(assert (=> start!112436 (array_inv!33090 _keys!1590)))

(assert (=> start!112436 tp!107457))

(declare-fun tp_is_empty!36517 () Bool)

(assert (=> start!112436 tp_is_empty!36517))

(declare-fun b!1330399 () Bool)

(declare-fun res!882369 () Bool)

(assert (=> b!1330399 (=> (not res!882369) (not e!758599))))

(declare-fun getCurrentListMap!5639 (array!90035 array!90037 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21295)

(assert (=> b!1330399 (= res!882369 (contains!8839 (getCurrentListMap!5639 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330400 () Bool)

(declare-fun e!758598 () Bool)

(assert (=> b!1330400 (= e!758598 tp_is_empty!36517)))

(declare-fun b!1330401 () Bool)

(declare-fun res!882370 () Bool)

(assert (=> b!1330401 (=> (not res!882370) (not e!758599))))

(assert (=> b!1330401 (= res!882370 (and (= (size!44031 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44030 _keys!1590) (size!44031 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56449 () Bool)

(declare-fun tp!107458 () Bool)

(assert (=> mapNonEmpty!56449 (= mapRes!56449 (and tp!107458 e!758598))))

(declare-fun mapValue!56449 () ValueCell!17360)

(declare-fun mapRest!56449 () (Array (_ BitVec 32) ValueCell!17360))

(declare-fun mapKey!56449 () (_ BitVec 32))

(assert (=> mapNonEmpty!56449 (= (arr!43480 _values!1320) (store mapRest!56449 mapKey!56449 mapValue!56449))))

(declare-fun b!1330402 () Bool)

(declare-fun res!882376 () Bool)

(assert (=> b!1330402 (=> (not res!882376) (not e!758599))))

(assert (=> b!1330402 (= res!882376 (not (= (select (arr!43479 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56449 () Bool)

(assert (=> mapIsEmpty!56449 mapRes!56449))

(declare-fun b!1330403 () Bool)

(assert (=> b!1330403 (= e!758596 tp_is_empty!36517)))

(declare-fun b!1330404 () Bool)

(declare-fun res!882372 () Bool)

(assert (=> b!1330404 (=> (not res!882372) (not e!758599))))

(assert (=> b!1330404 (= res!882372 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44030 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330405 () Bool)

(declare-fun res!882374 () Bool)

(assert (=> b!1330405 (=> (not res!882374) (not e!758599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330405 (= res!882374 (validKeyInArray!0 (select (arr!43479 _keys!1590) from!1980)))))

(assert (= (and start!112436 res!882373) b!1330401))

(assert (= (and b!1330401 res!882370) b!1330394))

(assert (= (and b!1330394 res!882371) b!1330397))

(assert (= (and b!1330397 res!882375) b!1330404))

(assert (= (and b!1330404 res!882372) b!1330399))

(assert (= (and b!1330399 res!882369) b!1330402))

(assert (= (and b!1330402 res!882376) b!1330405))

(assert (= (and b!1330405 res!882374) b!1330398))

(assert (= (and b!1330398 res!882377) b!1330395))

(assert (= (and b!1330396 condMapEmpty!56449) mapIsEmpty!56449))

(assert (= (and b!1330396 (not condMapEmpty!56449)) mapNonEmpty!56449))

(get-info :version)

(assert (= (and mapNonEmpty!56449 ((_ is ValueCellFull!17360) mapValue!56449)) b!1330400))

(assert (= (and b!1330396 ((_ is ValueCellFull!17360) mapDefault!56449)) b!1330403))

(assert (= start!112436 b!1330396))

(declare-fun b_lambda!23861 () Bool)

(assert (=> (not b_lambda!23861) (not b!1330395)))

(declare-fun t!44816 () Bool)

(declare-fun tb!11815 () Bool)

(assert (=> (and start!112436 (= defaultEntry!1323 defaultEntry!1323) t!44816) tb!11815))

(declare-fun result!24709 () Bool)

(assert (=> tb!11815 (= result!24709 tp_is_empty!36517)))

(assert (=> b!1330395 t!44816))

(declare-fun b_and!49273 () Bool)

(assert (= b_and!49271 (and (=> t!44816 result!24709) b_and!49273)))

(declare-fun m!1219487 () Bool)

(assert (=> start!112436 m!1219487))

(declare-fun m!1219489 () Bool)

(assert (=> start!112436 m!1219489))

(declare-fun m!1219491 () Bool)

(assert (=> start!112436 m!1219491))

(declare-fun m!1219493 () Bool)

(assert (=> b!1330397 m!1219493))

(declare-fun m!1219495 () Bool)

(assert (=> b!1330395 m!1219495))

(declare-fun m!1219497 () Bool)

(assert (=> b!1330395 m!1219497))

(declare-fun m!1219499 () Bool)

(assert (=> b!1330395 m!1219499))

(declare-fun m!1219501 () Bool)

(assert (=> b!1330395 m!1219501))

(assert (=> b!1330395 m!1219497))

(declare-fun m!1219503 () Bool)

(assert (=> b!1330395 m!1219503))

(declare-fun m!1219505 () Bool)

(assert (=> b!1330395 m!1219505))

(declare-fun m!1219507 () Bool)

(assert (=> b!1330395 m!1219507))

(assert (=> b!1330395 m!1219503))

(assert (=> b!1330395 m!1219495))

(declare-fun m!1219509 () Bool)

(assert (=> b!1330395 m!1219509))

(assert (=> b!1330405 m!1219505))

(assert (=> b!1330405 m!1219505))

(declare-fun m!1219511 () Bool)

(assert (=> b!1330405 m!1219511))

(declare-fun m!1219513 () Bool)

(assert (=> b!1330394 m!1219513))

(assert (=> b!1330402 m!1219505))

(declare-fun m!1219515 () Bool)

(assert (=> b!1330399 m!1219515))

(assert (=> b!1330399 m!1219515))

(declare-fun m!1219517 () Bool)

(assert (=> b!1330399 m!1219517))

(declare-fun m!1219519 () Bool)

(assert (=> mapNonEmpty!56449 m!1219519))

(check-sat b_and!49273 (not start!112436) (not mapNonEmpty!56449) tp_is_empty!36517 (not b!1330397) (not b!1330405) (not b_next!30607) (not b!1330395) (not b!1330394) (not b!1330399) (not b_lambda!23861))
(check-sat b_and!49273 (not b_next!30607))
