; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112284 () Bool)

(assert start!112284)

(declare-fun b_free!30679 () Bool)

(declare-fun b_next!30679 () Bool)

(assert (=> start!112284 (= b_free!30679 (not b_next!30679))))

(declare-fun tp!107674 () Bool)

(declare-fun b_and!49395 () Bool)

(assert (=> start!112284 (= tp!107674 b_and!49395)))

(declare-fun b!1330393 () Bool)

(declare-fun res!882798 () Bool)

(declare-fun e!758261 () Bool)

(assert (=> b!1330393 (=> (not res!882798) (not e!758261))))

(declare-datatypes ((V!53889 0))(
  ( (V!53890 (val!18369 Int)) )
))
(declare-datatypes ((ValueCell!17396 0))(
  ( (ValueCellFull!17396 (v!21005 V!53889)) (EmptyCell!17396) )
))
(declare-datatypes ((array!89999 0))(
  ( (array!90000 (arr!43466 (Array (_ BitVec 32) ValueCell!17396)) (size!44018 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89999)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90001 0))(
  ( (array!90002 (arr!43467 (Array (_ BitVec 32) (_ BitVec 64))) (size!44019 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90001)

(assert (=> b!1330393 (= res!882798 (and (= (size!44018 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44019 _keys!1590) (size!44018 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330394 () Bool)

(declare-fun res!882796 () Bool)

(assert (=> b!1330394 (=> (not res!882796) (not e!758261))))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1330394 (= res!882796 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44019 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330395 () Bool)

(declare-fun e!758259 () Bool)

(declare-fun e!758260 () Bool)

(declare-fun mapRes!56557 () Bool)

(assert (=> b!1330395 (= e!758259 (and e!758260 mapRes!56557))))

(declare-fun condMapEmpty!56557 () Bool)

(declare-fun mapDefault!56557 () ValueCell!17396)

(assert (=> b!1330395 (= condMapEmpty!56557 (= (arr!43466 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17396)) mapDefault!56557)))))

(declare-fun b!1330396 () Bool)

(declare-fun res!882800 () Bool)

(assert (=> b!1330396 (=> (not res!882800) (not e!758261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330396 (= res!882800 (validKeyInArray!0 (select (arr!43467 _keys!1590) from!1980)))))

(declare-fun b!1330397 () Bool)

(declare-fun res!882799 () Bool)

(assert (=> b!1330397 (=> (not res!882799) (not e!758261))))

(declare-datatypes ((List!30861 0))(
  ( (Nil!30858) (Cons!30857 (h!32066 (_ BitVec 64)) (t!44945 List!30861)) )
))
(declare-fun arrayNoDuplicates!0 (array!90001 (_ BitVec 32) List!30861) Bool)

(assert (=> b!1330397 (= res!882799 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30858))))

(declare-fun b!1330398 () Bool)

(declare-fun res!882795 () Bool)

(assert (=> b!1330398 (=> (not res!882795) (not e!758261))))

(assert (=> b!1330398 (= res!882795 (not (= (select (arr!43467 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!882797 () Bool)

(assert (=> start!112284 (=> (not res!882797) (not e!758261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112284 (= res!882797 (validMask!0 mask!1998))))

(assert (=> start!112284 e!758261))

(declare-fun array_inv!32967 (array!89999) Bool)

(assert (=> start!112284 (and (array_inv!32967 _values!1320) e!758259)))

(assert (=> start!112284 true))

(declare-fun array_inv!32968 (array!90001) Bool)

(assert (=> start!112284 (array_inv!32968 _keys!1590)))

(assert (=> start!112284 tp!107674))

(declare-fun tp_is_empty!36589 () Bool)

(assert (=> start!112284 tp_is_empty!36589))

(declare-fun b!1330399 () Bool)

(assert (=> b!1330399 (= e!758260 tp_is_empty!36589)))

(declare-fun mapIsEmpty!56557 () Bool)

(assert (=> mapIsEmpty!56557 mapRes!56557))

(declare-fun b!1330400 () Bool)

(declare-fun res!882801 () Bool)

(assert (=> b!1330400 (=> (not res!882801) (not e!758261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90001 (_ BitVec 32)) Bool)

(assert (=> b!1330400 (= res!882801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330401 () Bool)

(declare-fun e!758263 () Bool)

(assert (=> b!1330401 (= e!758263 tp_is_empty!36589)))

(declare-fun mapNonEmpty!56557 () Bool)

(declare-fun tp!107675 () Bool)

(assert (=> mapNonEmpty!56557 (= mapRes!56557 (and tp!107675 e!758263))))

(declare-fun mapValue!56557 () ValueCell!17396)

(declare-fun mapRest!56557 () (Array (_ BitVec 32) ValueCell!17396))

(declare-fun mapKey!56557 () (_ BitVec 32))

(assert (=> mapNonEmpty!56557 (= (arr!43466 _values!1320) (store mapRest!56557 mapKey!56557 mapValue!56557))))

(declare-fun b!1330402 () Bool)

(declare-fun res!882794 () Bool)

(assert (=> b!1330402 (=> (not res!882794) (not e!758261))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53889)

(declare-fun zeroValue!1262 () V!53889)

(declare-datatypes ((tuple2!23718 0))(
  ( (tuple2!23719 (_1!11870 (_ BitVec 64)) (_2!11870 V!53889)) )
))
(declare-datatypes ((List!30862 0))(
  ( (Nil!30859) (Cons!30858 (h!32067 tuple2!23718) (t!44946 List!30862)) )
))
(declare-datatypes ((ListLongMap!21375 0))(
  ( (ListLongMap!21376 (toList!10703 List!30862)) )
))
(declare-fun contains!8795 (ListLongMap!21375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5567 (array!90001 array!89999 (_ BitVec 32) (_ BitVec 32) V!53889 V!53889 (_ BitVec 32) Int) ListLongMap!21375)

(assert (=> b!1330402 (= res!882794 (contains!8795 (getCurrentListMap!5567 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330403 () Bool)

(declare-fun res!882802 () Bool)

(assert (=> b!1330403 (=> (not res!882802) (not e!758261))))

(assert (=> b!1330403 (= res!882802 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330404 () Bool)

(assert (=> b!1330404 (= e!758261 (not true))))

(declare-fun lt!590967 () ListLongMap!21375)

(assert (=> b!1330404 (contains!8795 lt!590967 k0!1153)))

(declare-fun lt!590965 () V!53889)

(declare-datatypes ((Unit!43586 0))(
  ( (Unit!43587) )
))
(declare-fun lt!590964 () Unit!43586)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!243 ((_ BitVec 64) (_ BitVec 64) V!53889 ListLongMap!21375) Unit!43586)

(assert (=> b!1330404 (= lt!590964 (lemmaInListMapAfterAddingDiffThenInBefore!243 k0!1153 (select (arr!43467 _keys!1590) from!1980) lt!590965 lt!590967))))

(declare-fun lt!590966 () ListLongMap!21375)

(assert (=> b!1330404 (contains!8795 lt!590966 k0!1153)))

(declare-fun lt!590968 () Unit!43586)

(assert (=> b!1330404 (= lt!590968 (lemmaInListMapAfterAddingDiffThenInBefore!243 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590966))))

(declare-fun +!4687 (ListLongMap!21375 tuple2!23718) ListLongMap!21375)

(assert (=> b!1330404 (= lt!590966 (+!4687 lt!590967 (tuple2!23719 (select (arr!43467 _keys!1590) from!1980) lt!590965)))))

(declare-fun get!21910 (ValueCell!17396 V!53889) V!53889)

(declare-fun dynLambda!3617 (Int (_ BitVec 64)) V!53889)

(assert (=> b!1330404 (= lt!590965 (get!21910 (select (arr!43466 _values!1320) from!1980) (dynLambda!3617 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6325 (array!90001 array!89999 (_ BitVec 32) (_ BitVec 32) V!53889 V!53889 (_ BitVec 32) Int) ListLongMap!21375)

(assert (=> b!1330404 (= lt!590967 (getCurrentListMapNoExtraKeys!6325 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(assert (= (and start!112284 res!882797) b!1330393))

(assert (= (and b!1330393 res!882798) b!1330400))

(assert (= (and b!1330400 res!882801) b!1330397))

(assert (= (and b!1330397 res!882799) b!1330394))

(assert (= (and b!1330394 res!882796) b!1330402))

(assert (= (and b!1330402 res!882794) b!1330398))

(assert (= (and b!1330398 res!882795) b!1330396))

(assert (= (and b!1330396 res!882800) b!1330403))

(assert (= (and b!1330403 res!882802) b!1330404))

(assert (= (and b!1330395 condMapEmpty!56557) mapIsEmpty!56557))

(assert (= (and b!1330395 (not condMapEmpty!56557)) mapNonEmpty!56557))

(get-info :version)

(assert (= (and mapNonEmpty!56557 ((_ is ValueCellFull!17396) mapValue!56557)) b!1330401))

(assert (= (and b!1330395 ((_ is ValueCellFull!17396) mapDefault!56557)) b!1330399))

(assert (= start!112284 b!1330395))

(declare-fun b_lambda!23929 () Bool)

(assert (=> (not b_lambda!23929) (not b!1330404)))

(declare-fun t!44944 () Bool)

(declare-fun tb!11887 () Bool)

(assert (=> (and start!112284 (= defaultEntry!1323 defaultEntry!1323) t!44944) tb!11887))

(declare-fun result!24853 () Bool)

(assert (=> tb!11887 (= result!24853 tp_is_empty!36589)))

(assert (=> b!1330404 t!44944))

(declare-fun b_and!49397 () Bool)

(assert (= b_and!49395 (and (=> t!44944 result!24853) b_and!49397)))

(declare-fun m!1218609 () Bool)

(assert (=> mapNonEmpty!56557 m!1218609))

(declare-fun m!1218611 () Bool)

(assert (=> b!1330404 m!1218611))

(declare-fun m!1218613 () Bool)

(assert (=> b!1330404 m!1218613))

(declare-fun m!1218615 () Bool)

(assert (=> b!1330404 m!1218615))

(declare-fun m!1218617 () Bool)

(assert (=> b!1330404 m!1218617))

(declare-fun m!1218619 () Bool)

(assert (=> b!1330404 m!1218619))

(declare-fun m!1218621 () Bool)

(assert (=> b!1330404 m!1218621))

(declare-fun m!1218623 () Bool)

(assert (=> b!1330404 m!1218623))

(declare-fun m!1218625 () Bool)

(assert (=> b!1330404 m!1218625))

(assert (=> b!1330404 m!1218611))

(declare-fun m!1218627 () Bool)

(assert (=> b!1330404 m!1218627))

(assert (=> b!1330404 m!1218613))

(assert (=> b!1330404 m!1218627))

(declare-fun m!1218629 () Bool)

(assert (=> b!1330404 m!1218629))

(assert (=> b!1330398 m!1218627))

(declare-fun m!1218631 () Bool)

(assert (=> b!1330397 m!1218631))

(declare-fun m!1218633 () Bool)

(assert (=> b!1330400 m!1218633))

(declare-fun m!1218635 () Bool)

(assert (=> start!112284 m!1218635))

(declare-fun m!1218637 () Bool)

(assert (=> start!112284 m!1218637))

(declare-fun m!1218639 () Bool)

(assert (=> start!112284 m!1218639))

(assert (=> b!1330396 m!1218627))

(assert (=> b!1330396 m!1218627))

(declare-fun m!1218641 () Bool)

(assert (=> b!1330396 m!1218641))

(declare-fun m!1218643 () Bool)

(assert (=> b!1330402 m!1218643))

(assert (=> b!1330402 m!1218643))

(declare-fun m!1218645 () Bool)

(assert (=> b!1330402 m!1218645))

(check-sat (not b_lambda!23929) (not b!1330402) (not b!1330397) (not b!1330404) (not b_next!30679) (not b!1330400) tp_is_empty!36589 b_and!49397 (not mapNonEmpty!56557) (not start!112284) (not b!1330396))
(check-sat b_and!49397 (not b_next!30679))
