; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112442 () Bool)

(assert start!112442)

(declare-fun b_free!30613 () Bool)

(declare-fun b_next!30613 () Bool)

(assert (=> start!112442 (= b_free!30613 (not b_next!30613))))

(declare-fun tp!107475 () Bool)

(declare-fun b_and!49283 () Bool)

(assert (=> start!112442 (= tp!107475 b_and!49283)))

(declare-fun b!1330508 () Bool)

(declare-fun e!758640 () Bool)

(declare-fun tp_is_empty!36523 () Bool)

(assert (=> b!1330508 (= e!758640 tp_is_empty!36523)))

(declare-fun mapNonEmpty!56458 () Bool)

(declare-fun mapRes!56458 () Bool)

(declare-fun tp!107476 () Bool)

(declare-fun e!758644 () Bool)

(assert (=> mapNonEmpty!56458 (= mapRes!56458 (and tp!107476 e!758644))))

(declare-datatypes ((V!53801 0))(
  ( (V!53802 (val!18336 Int)) )
))
(declare-datatypes ((ValueCell!17363 0))(
  ( (ValueCellFull!17363 (v!20968 V!53801)) (EmptyCell!17363) )
))
(declare-datatypes ((array!90047 0))(
  ( (array!90048 (arr!43485 (Array (_ BitVec 32) ValueCell!17363)) (size!44036 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90047)

(declare-fun mapRest!56458 () (Array (_ BitVec 32) ValueCell!17363))

(declare-fun mapKey!56458 () (_ BitVec 32))

(declare-fun mapValue!56458 () ValueCell!17363)

(assert (=> mapNonEmpty!56458 (= (arr!43485 _values!1320) (store mapRest!56458 mapKey!56458 mapValue!56458))))

(declare-fun b!1330509 () Bool)

(declare-fun res!882452 () Bool)

(declare-fun e!758642 () Bool)

(assert (=> b!1330509 (=> (not res!882452) (not e!758642))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90049 0))(
  ( (array!90050 (arr!43486 (Array (_ BitVec 32) (_ BitVec 64))) (size!44037 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90049)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330509 (= res!882452 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44037 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330510 () Bool)

(declare-fun res!882453 () Bool)

(assert (=> b!1330510 (=> (not res!882453) (not e!758642))))

(assert (=> b!1330510 (= res!882453 (not (= (select (arr!43486 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330511 () Bool)

(declare-fun res!882451 () Bool)

(assert (=> b!1330511 (=> (not res!882451) (not e!758642))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53801)

(declare-fun zeroValue!1262 () V!53801)

(declare-datatypes ((tuple2!23636 0))(
  ( (tuple2!23637 (_1!11829 (_ BitVec 64)) (_2!11829 V!53801)) )
))
(declare-datatypes ((List!30810 0))(
  ( (Nil!30807) (Cons!30806 (h!32024 tuple2!23636) (t!44828 List!30810)) )
))
(declare-datatypes ((ListLongMap!21301 0))(
  ( (ListLongMap!21302 (toList!10666 List!30810)) )
))
(declare-fun contains!8842 (ListLongMap!21301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5642 (array!90049 array!90047 (_ BitVec 32) (_ BitVec 32) V!53801 V!53801 (_ BitVec 32) Int) ListLongMap!21301)

(assert (=> b!1330511 (= res!882451 (contains!8842 (getCurrentListMap!5642 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56458 () Bool)

(assert (=> mapIsEmpty!56458 mapRes!56458))

(declare-fun b!1330512 () Bool)

(declare-fun res!882458 () Bool)

(assert (=> b!1330512 (=> (not res!882458) (not e!758642))))

(assert (=> b!1330512 (= res!882458 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882454 () Bool)

(assert (=> start!112442 (=> (not res!882454) (not e!758642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112442 (= res!882454 (validMask!0 mask!1998))))

(assert (=> start!112442 e!758642))

(declare-fun e!758643 () Bool)

(declare-fun array_inv!33093 (array!90047) Bool)

(assert (=> start!112442 (and (array_inv!33093 _values!1320) e!758643)))

(assert (=> start!112442 true))

(declare-fun array_inv!33094 (array!90049) Bool)

(assert (=> start!112442 (array_inv!33094 _keys!1590)))

(assert (=> start!112442 tp!107475))

(assert (=> start!112442 tp_is_empty!36523))

(declare-fun b!1330513 () Bool)

(declare-fun res!882456 () Bool)

(assert (=> b!1330513 (=> (not res!882456) (not e!758642))))

(declare-datatypes ((List!30811 0))(
  ( (Nil!30808) (Cons!30807 (h!32025 (_ BitVec 64)) (t!44829 List!30811)) )
))
(declare-fun arrayNoDuplicates!0 (array!90049 (_ BitVec 32) List!30811) Bool)

(assert (=> b!1330513 (= res!882456 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30808))))

(declare-fun b!1330514 () Bool)

(declare-fun res!882450 () Bool)

(assert (=> b!1330514 (=> (not res!882450) (not e!758642))))

(assert (=> b!1330514 (= res!882450 (and (= (size!44036 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44037 _keys!1590) (size!44036 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330515 () Bool)

(assert (=> b!1330515 (= e!758642 (not true))))

(declare-fun lt!591396 () ListLongMap!21301)

(assert (=> b!1330515 (contains!8842 lt!591396 k0!1153)))

(declare-datatypes ((Unit!43686 0))(
  ( (Unit!43687) )
))
(declare-fun lt!591395 () Unit!43686)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!231 ((_ BitVec 64) (_ BitVec 64) V!53801 ListLongMap!21301) Unit!43686)

(assert (=> b!1330515 (= lt!591395 (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591396))))

(declare-fun +!4688 (ListLongMap!21301 tuple2!23636) ListLongMap!21301)

(declare-fun getCurrentListMapNoExtraKeys!6332 (array!90049 array!90047 (_ BitVec 32) (_ BitVec 32) V!53801 V!53801 (_ BitVec 32) Int) ListLongMap!21301)

(declare-fun get!21925 (ValueCell!17363 V!53801) V!53801)

(declare-fun dynLambda!3642 (Int (_ BitVec 64)) V!53801)

(assert (=> b!1330515 (= lt!591396 (+!4688 (getCurrentListMapNoExtraKeys!6332 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23637 (select (arr!43486 _keys!1590) from!1980) (get!21925 (select (arr!43485 _values!1320) from!1980) (dynLambda!3642 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330516 () Bool)

(assert (=> b!1330516 (= e!758643 (and e!758640 mapRes!56458))))

(declare-fun condMapEmpty!56458 () Bool)

(declare-fun mapDefault!56458 () ValueCell!17363)

(assert (=> b!1330516 (= condMapEmpty!56458 (= (arr!43485 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17363)) mapDefault!56458)))))

(declare-fun b!1330517 () Bool)

(assert (=> b!1330517 (= e!758644 tp_is_empty!36523)))

(declare-fun b!1330518 () Bool)

(declare-fun res!882457 () Bool)

(assert (=> b!1330518 (=> (not res!882457) (not e!758642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90049 (_ BitVec 32)) Bool)

(assert (=> b!1330518 (= res!882457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330519 () Bool)

(declare-fun res!882455 () Bool)

(assert (=> b!1330519 (=> (not res!882455) (not e!758642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330519 (= res!882455 (validKeyInArray!0 (select (arr!43486 _keys!1590) from!1980)))))

(assert (= (and start!112442 res!882454) b!1330514))

(assert (= (and b!1330514 res!882450) b!1330518))

(assert (= (and b!1330518 res!882457) b!1330513))

(assert (= (and b!1330513 res!882456) b!1330509))

(assert (= (and b!1330509 res!882452) b!1330511))

(assert (= (and b!1330511 res!882451) b!1330510))

(assert (= (and b!1330510 res!882453) b!1330519))

(assert (= (and b!1330519 res!882455) b!1330512))

(assert (= (and b!1330512 res!882458) b!1330515))

(assert (= (and b!1330516 condMapEmpty!56458) mapIsEmpty!56458))

(assert (= (and b!1330516 (not condMapEmpty!56458)) mapNonEmpty!56458))

(get-info :version)

(assert (= (and mapNonEmpty!56458 ((_ is ValueCellFull!17363) mapValue!56458)) b!1330517))

(assert (= (and b!1330516 ((_ is ValueCellFull!17363) mapDefault!56458)) b!1330508))

(assert (= start!112442 b!1330516))

(declare-fun b_lambda!23867 () Bool)

(assert (=> (not b_lambda!23867) (not b!1330515)))

(declare-fun t!44827 () Bool)

(declare-fun tb!11821 () Bool)

(assert (=> (and start!112442 (= defaultEntry!1323 defaultEntry!1323) t!44827) tb!11821))

(declare-fun result!24721 () Bool)

(assert (=> tb!11821 (= result!24721 tp_is_empty!36523)))

(assert (=> b!1330515 t!44827))

(declare-fun b_and!49285 () Bool)

(assert (= b_and!49283 (and (=> t!44827 result!24721) b_and!49285)))

(declare-fun m!1219589 () Bool)

(assert (=> start!112442 m!1219589))

(declare-fun m!1219591 () Bool)

(assert (=> start!112442 m!1219591))

(declare-fun m!1219593 () Bool)

(assert (=> start!112442 m!1219593))

(declare-fun m!1219595 () Bool)

(assert (=> mapNonEmpty!56458 m!1219595))

(declare-fun m!1219597 () Bool)

(assert (=> b!1330518 m!1219597))

(declare-fun m!1219599 () Bool)

(assert (=> b!1330513 m!1219599))

(declare-fun m!1219601 () Bool)

(assert (=> b!1330515 m!1219601))

(declare-fun m!1219603 () Bool)

(assert (=> b!1330515 m!1219603))

(declare-fun m!1219605 () Bool)

(assert (=> b!1330515 m!1219605))

(declare-fun m!1219607 () Bool)

(assert (=> b!1330515 m!1219607))

(declare-fun m!1219609 () Bool)

(assert (=> b!1330515 m!1219609))

(assert (=> b!1330515 m!1219603))

(declare-fun m!1219611 () Bool)

(assert (=> b!1330515 m!1219611))

(assert (=> b!1330515 m!1219605))

(declare-fun m!1219613 () Bool)

(assert (=> b!1330515 m!1219613))

(assert (=> b!1330515 m!1219609))

(declare-fun m!1219615 () Bool)

(assert (=> b!1330515 m!1219615))

(assert (=> b!1330510 m!1219615))

(declare-fun m!1219617 () Bool)

(assert (=> b!1330511 m!1219617))

(assert (=> b!1330511 m!1219617))

(declare-fun m!1219619 () Bool)

(assert (=> b!1330511 m!1219619))

(assert (=> b!1330519 m!1219615))

(assert (=> b!1330519 m!1219615))

(declare-fun m!1219621 () Bool)

(assert (=> b!1330519 m!1219621))

(check-sat (not b!1330518) (not start!112442) (not b!1330513) tp_is_empty!36523 (not b!1330515) (not b_lambda!23867) b_and!49285 (not mapNonEmpty!56458) (not b_next!30613) (not b!1330519) (not b!1330511))
(check-sat b_and!49285 (not b_next!30613))
