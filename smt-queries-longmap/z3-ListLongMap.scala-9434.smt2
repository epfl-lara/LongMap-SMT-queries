; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112212 () Bool)

(assert start!112212)

(declare-fun b_free!30607 () Bool)

(declare-fun b_next!30607 () Bool)

(assert (=> start!112212 (= b_free!30607 (not b_next!30607))))

(declare-fun tp!107459 () Bool)

(declare-fun b_and!49251 () Bool)

(assert (=> start!112212 (= tp!107459 b_and!49251)))

(declare-fun mapIsEmpty!56449 () Bool)

(declare-fun mapRes!56449 () Bool)

(assert (=> mapIsEmpty!56449 mapRes!56449))

(declare-fun res!881829 () Bool)

(declare-fun e!757719 () Bool)

(assert (=> start!112212 (=> (not res!881829) (not e!757719))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112212 (= res!881829 (validMask!0 mask!1998))))

(assert (=> start!112212 e!757719))

(declare-datatypes ((V!53793 0))(
  ( (V!53794 (val!18333 Int)) )
))
(declare-datatypes ((ValueCell!17360 0))(
  ( (ValueCellFull!17360 (v!20969 V!53793)) (EmptyCell!17360) )
))
(declare-datatypes ((array!89861 0))(
  ( (array!89862 (arr!43397 (Array (_ BitVec 32) ValueCell!17360)) (size!43949 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89861)

(declare-fun e!757722 () Bool)

(declare-fun array_inv!32919 (array!89861) Bool)

(assert (=> start!112212 (and (array_inv!32919 _values!1320) e!757722)))

(assert (=> start!112212 true))

(declare-datatypes ((array!89863 0))(
  ( (array!89864 (arr!43398 (Array (_ BitVec 32) (_ BitVec 64))) (size!43950 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89863)

(declare-fun array_inv!32920 (array!89863) Bool)

(assert (=> start!112212 (array_inv!32920 _keys!1590)))

(assert (=> start!112212 tp!107459))

(declare-fun tp_is_empty!36517 () Bool)

(assert (=> start!112212 tp_is_empty!36517))

(declare-fun b!1329025 () Bool)

(declare-fun e!757723 () Bool)

(assert (=> b!1329025 (= e!757722 (and e!757723 mapRes!56449))))

(declare-fun condMapEmpty!56449 () Bool)

(declare-fun mapDefault!56449 () ValueCell!17360)

(assert (=> b!1329025 (= condMapEmpty!56449 (= (arr!43397 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17360)) mapDefault!56449)))))

(declare-fun b!1329026 () Bool)

(declare-fun res!881828 () Bool)

(assert (=> b!1329026 (=> (not res!881828) (not e!757719))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53793)

(declare-fun zeroValue!1262 () V!53793)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23660 0))(
  ( (tuple2!23661 (_1!11841 (_ BitVec 64)) (_2!11841 V!53793)) )
))
(declare-datatypes ((List!30811 0))(
  ( (Nil!30808) (Cons!30807 (h!32016 tuple2!23660) (t!44823 List!30811)) )
))
(declare-datatypes ((ListLongMap!21317 0))(
  ( (ListLongMap!21318 (toList!10674 List!30811)) )
))
(declare-fun contains!8766 (ListLongMap!21317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5545 (array!89863 array!89861 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21317)

(assert (=> b!1329026 (= res!881828 (contains!8766 (getCurrentListMap!5545 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329027 () Bool)

(declare-fun e!757721 () Bool)

(assert (=> b!1329027 (= e!757721 tp_is_empty!36517)))

(declare-fun b!1329028 () Bool)

(declare-fun res!881826 () Bool)

(assert (=> b!1329028 (=> (not res!881826) (not e!757719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89863 (_ BitVec 32)) Bool)

(assert (=> b!1329028 (= res!881826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329029 () Bool)

(declare-fun res!881825 () Bool)

(assert (=> b!1329029 (=> (not res!881825) (not e!757719))))

(assert (=> b!1329029 (= res!881825 (and (= (size!43949 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43950 _keys!1590) (size!43949 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329030 () Bool)

(declare-fun res!881827 () Bool)

(assert (=> b!1329030 (=> (not res!881827) (not e!757719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329030 (= res!881827 (validKeyInArray!0 (select (arr!43398 _keys!1590) from!1980)))))

(declare-fun b!1329031 () Bool)

(assert (=> b!1329031 (= e!757723 tp_is_empty!36517)))

(declare-fun b!1329032 () Bool)

(declare-fun res!881823 () Bool)

(assert (=> b!1329032 (=> (not res!881823) (not e!757719))))

(assert (=> b!1329032 (= res!881823 (not (= (select (arr!43398 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329033 () Bool)

(assert (=> b!1329033 (= e!757719 (not true))))

(declare-fun lt!590715 () ListLongMap!21317)

(assert (=> b!1329033 (contains!8766 lt!590715 k0!1153)))

(declare-datatypes ((Unit!43534 0))(
  ( (Unit!43535) )
))
(declare-fun lt!590716 () Unit!43534)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!217 ((_ BitVec 64) (_ BitVec 64) V!53793 ListLongMap!21317) Unit!43534)

(assert (=> b!1329033 (= lt!590716 (lemmaInListMapAfterAddingDiffThenInBefore!217 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590715))))

(declare-fun +!4661 (ListLongMap!21317 tuple2!23660) ListLongMap!21317)

(declare-fun getCurrentListMapNoExtraKeys!6299 (array!89863 array!89861 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21317)

(declare-fun get!21860 (ValueCell!17360 V!53793) V!53793)

(declare-fun dynLambda!3591 (Int (_ BitVec 64)) V!53793)

(assert (=> b!1329033 (= lt!590715 (+!4661 (getCurrentListMapNoExtraKeys!6299 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23661 (select (arr!43398 _keys!1590) from!1980) (get!21860 (select (arr!43397 _values!1320) from!1980) (dynLambda!3591 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329034 () Bool)

(declare-fun res!881822 () Bool)

(assert (=> b!1329034 (=> (not res!881822) (not e!757719))))

(assert (=> b!1329034 (= res!881822 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43950 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329035 () Bool)

(declare-fun res!881830 () Bool)

(assert (=> b!1329035 (=> (not res!881830) (not e!757719))))

(declare-datatypes ((List!30812 0))(
  ( (Nil!30809) (Cons!30808 (h!32017 (_ BitVec 64)) (t!44824 List!30812)) )
))
(declare-fun arrayNoDuplicates!0 (array!89863 (_ BitVec 32) List!30812) Bool)

(assert (=> b!1329035 (= res!881830 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30809))))

(declare-fun mapNonEmpty!56449 () Bool)

(declare-fun tp!107458 () Bool)

(assert (=> mapNonEmpty!56449 (= mapRes!56449 (and tp!107458 e!757721))))

(declare-fun mapRest!56449 () (Array (_ BitVec 32) ValueCell!17360))

(declare-fun mapKey!56449 () (_ BitVec 32))

(declare-fun mapValue!56449 () ValueCell!17360)

(assert (=> mapNonEmpty!56449 (= (arr!43397 _values!1320) (store mapRest!56449 mapKey!56449 mapValue!56449))))

(declare-fun b!1329036 () Bool)

(declare-fun res!881824 () Bool)

(assert (=> b!1329036 (=> (not res!881824) (not e!757719))))

(assert (=> b!1329036 (= res!881824 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112212 res!881829) b!1329029))

(assert (= (and b!1329029 res!881825) b!1329028))

(assert (= (and b!1329028 res!881826) b!1329035))

(assert (= (and b!1329035 res!881830) b!1329034))

(assert (= (and b!1329034 res!881822) b!1329026))

(assert (= (and b!1329026 res!881828) b!1329032))

(assert (= (and b!1329032 res!881823) b!1329030))

(assert (= (and b!1329030 res!881827) b!1329036))

(assert (= (and b!1329036 res!881824) b!1329033))

(assert (= (and b!1329025 condMapEmpty!56449) mapIsEmpty!56449))

(assert (= (and b!1329025 (not condMapEmpty!56449)) mapNonEmpty!56449))

(get-info :version)

(assert (= (and mapNonEmpty!56449 ((_ is ValueCellFull!17360) mapValue!56449)) b!1329027))

(assert (= (and b!1329025 ((_ is ValueCellFull!17360) mapDefault!56449)) b!1329031))

(assert (= start!112212 b!1329025))

(declare-fun b_lambda!23857 () Bool)

(assert (=> (not b_lambda!23857) (not b!1329033)))

(declare-fun t!44822 () Bool)

(declare-fun tb!11815 () Bool)

(assert (=> (and start!112212 (= defaultEntry!1323 defaultEntry!1323) t!44822) tb!11815))

(declare-fun result!24709 () Bool)

(assert (=> tb!11815 (= result!24709 tp_is_empty!36517)))

(assert (=> b!1329033 t!44822))

(declare-fun b_and!49253 () Bool)

(assert (= b_and!49251 (and (=> t!44822 result!24709) b_and!49253)))

(declare-fun m!1217373 () Bool)

(assert (=> b!1329026 m!1217373))

(assert (=> b!1329026 m!1217373))

(declare-fun m!1217375 () Bool)

(assert (=> b!1329026 m!1217375))

(declare-fun m!1217377 () Bool)

(assert (=> start!112212 m!1217377))

(declare-fun m!1217379 () Bool)

(assert (=> start!112212 m!1217379))

(declare-fun m!1217381 () Bool)

(assert (=> start!112212 m!1217381))

(declare-fun m!1217383 () Bool)

(assert (=> mapNonEmpty!56449 m!1217383))

(declare-fun m!1217385 () Bool)

(assert (=> b!1329035 m!1217385))

(declare-fun m!1217387 () Bool)

(assert (=> b!1329032 m!1217387))

(declare-fun m!1217389 () Bool)

(assert (=> b!1329028 m!1217389))

(assert (=> b!1329030 m!1217387))

(assert (=> b!1329030 m!1217387))

(declare-fun m!1217391 () Bool)

(assert (=> b!1329030 m!1217391))

(declare-fun m!1217393 () Bool)

(assert (=> b!1329033 m!1217393))

(declare-fun m!1217395 () Bool)

(assert (=> b!1329033 m!1217395))

(declare-fun m!1217397 () Bool)

(assert (=> b!1329033 m!1217397))

(declare-fun m!1217399 () Bool)

(assert (=> b!1329033 m!1217399))

(assert (=> b!1329033 m!1217393))

(declare-fun m!1217401 () Bool)

(assert (=> b!1329033 m!1217401))

(assert (=> b!1329033 m!1217387))

(assert (=> b!1329033 m!1217395))

(declare-fun m!1217403 () Bool)

(assert (=> b!1329033 m!1217403))

(assert (=> b!1329033 m!1217399))

(declare-fun m!1217405 () Bool)

(assert (=> b!1329033 m!1217405))

(check-sat (not b!1329035) (not start!112212) (not b!1329028) tp_is_empty!36517 (not b!1329030) (not b!1329033) b_and!49253 (not mapNonEmpty!56449) (not b_next!30607) (not b!1329026) (not b_lambda!23857))
(check-sat b_and!49253 (not b_next!30607))
