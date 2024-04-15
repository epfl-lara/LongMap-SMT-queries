; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112380 () Bool)

(assert start!112380)

(declare-fun b_free!30775 () Bool)

(declare-fun b_next!30775 () Bool)

(assert (=> start!112380 (= b_free!30775 (not b_next!30775))))

(declare-fun tp!107963 () Bool)

(declare-fun b_and!49587 () Bool)

(assert (=> start!112380 (= tp!107963 b_and!49587)))

(declare-fun b!1332218 () Bool)

(declare-fun e!758982 () Bool)

(declare-fun tp_is_empty!36685 () Bool)

(assert (=> b!1332218 (= e!758982 tp_is_empty!36685)))

(declare-fun b!1332219 () Bool)

(declare-fun res!884090 () Bool)

(declare-fun e!758983 () Bool)

(assert (=> b!1332219 (=> (not res!884090) (not e!758983))))

(declare-datatypes ((V!54017 0))(
  ( (V!54018 (val!18417 Int)) )
))
(declare-datatypes ((ValueCell!17444 0))(
  ( (ValueCellFull!17444 (v!21053 V!54017)) (EmptyCell!17444) )
))
(declare-datatypes ((array!90189 0))(
  ( (array!90190 (arr!43561 (Array (_ BitVec 32) ValueCell!17444)) (size!44113 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90189)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90191 0))(
  ( (array!90192 (arr!43562 (Array (_ BitVec 32) (_ BitVec 64))) (size!44114 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90191)

(assert (=> b!1332219 (= res!884090 (and (= (size!44113 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44114 _keys!1590) (size!44113 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56701 () Bool)

(declare-fun mapRes!56701 () Bool)

(assert (=> mapIsEmpty!56701 mapRes!56701))

(declare-fun b!1332220 () Bool)

(declare-fun res!884097 () Bool)

(assert (=> b!1332220 (=> (not res!884097) (not e!758983))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54017)

(declare-fun zeroValue!1262 () V!54017)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23804 0))(
  ( (tuple2!23805 (_1!11913 (_ BitVec 64)) (_2!11913 V!54017)) )
))
(declare-datatypes ((List!30938 0))(
  ( (Nil!30935) (Cons!30934 (h!32143 tuple2!23804) (t!45118 List!30938)) )
))
(declare-datatypes ((ListLongMap!21461 0))(
  ( (ListLongMap!21462 (toList!10746 List!30938)) )
))
(declare-fun contains!8838 (ListLongMap!21461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5606 (array!90191 array!90189 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21461)

(assert (=> b!1332220 (= res!884097 (contains!8838 (getCurrentListMap!5606 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56701 () Bool)

(declare-fun tp!107962 () Bool)

(declare-fun e!758980 () Bool)

(assert (=> mapNonEmpty!56701 (= mapRes!56701 (and tp!107962 e!758980))))

(declare-fun mapRest!56701 () (Array (_ BitVec 32) ValueCell!17444))

(declare-fun mapKey!56701 () (_ BitVec 32))

(declare-fun mapValue!56701 () ValueCell!17444)

(assert (=> mapNonEmpty!56701 (= (arr!43561 _values!1320) (store mapRest!56701 mapKey!56701 mapValue!56701))))

(declare-fun b!1332221 () Bool)

(assert (=> b!1332221 (= e!758983 (not true))))

(declare-fun lt!591753 () ListLongMap!21461)

(declare-fun +!4725 (ListLongMap!21461 tuple2!23804) ListLongMap!21461)

(assert (=> b!1332221 (contains!8838 (+!4725 lt!591753 (tuple2!23805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43662 0))(
  ( (Unit!43663) )
))
(declare-fun lt!591751 () Unit!43662)

(declare-fun addStillContains!1179 (ListLongMap!21461 (_ BitVec 64) V!54017 (_ BitVec 64)) Unit!43662)

(assert (=> b!1332221 (= lt!591751 (addStillContains!1179 lt!591753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332221 (contains!8838 lt!591753 k0!1153)))

(declare-fun lt!591752 () Unit!43662)

(declare-fun lt!591754 () V!54017)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!281 ((_ BitVec 64) (_ BitVec 64) V!54017 ListLongMap!21461) Unit!43662)

(assert (=> b!1332221 (= lt!591752 (lemmaInListMapAfterAddingDiffThenInBefore!281 k0!1153 (select (arr!43562 _keys!1590) from!1980) lt!591754 lt!591753))))

(declare-fun lt!591749 () ListLongMap!21461)

(assert (=> b!1332221 (contains!8838 lt!591749 k0!1153)))

(declare-fun lt!591750 () Unit!43662)

(assert (=> b!1332221 (= lt!591750 (lemmaInListMapAfterAddingDiffThenInBefore!281 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591749))))

(assert (=> b!1332221 (= lt!591749 (+!4725 lt!591753 (tuple2!23805 (select (arr!43562 _keys!1590) from!1980) lt!591754)))))

(declare-fun get!21980 (ValueCell!17444 V!54017) V!54017)

(declare-fun dynLambda!3655 (Int (_ BitVec 64)) V!54017)

(assert (=> b!1332221 (= lt!591754 (get!21980 (select (arr!43561 _values!1320) from!1980) (dynLambda!3655 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6363 (array!90191 array!90189 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21461)

(assert (=> b!1332221 (= lt!591753 (getCurrentListMapNoExtraKeys!6363 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332222 () Bool)

(declare-fun res!884096 () Bool)

(assert (=> b!1332222 (=> (not res!884096) (not e!758983))))

(assert (=> b!1332222 (= res!884096 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332223 () Bool)

(declare-fun res!884094 () Bool)

(assert (=> b!1332223 (=> (not res!884094) (not e!758983))))

(assert (=> b!1332223 (= res!884094 (not (= (select (arr!43562 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332224 () Bool)

(declare-fun res!884098 () Bool)

(assert (=> b!1332224 (=> (not res!884098) (not e!758983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332224 (= res!884098 (validKeyInArray!0 (select (arr!43562 _keys!1590) from!1980)))))

(declare-fun b!1332225 () Bool)

(declare-fun res!884091 () Bool)

(assert (=> b!1332225 (=> (not res!884091) (not e!758983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90191 (_ BitVec 32)) Bool)

(assert (=> b!1332225 (= res!884091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332226 () Bool)

(declare-fun res!884093 () Bool)

(assert (=> b!1332226 (=> (not res!884093) (not e!758983))))

(declare-datatypes ((List!30939 0))(
  ( (Nil!30936) (Cons!30935 (h!32144 (_ BitVec 64)) (t!45119 List!30939)) )
))
(declare-fun arrayNoDuplicates!0 (array!90191 (_ BitVec 32) List!30939) Bool)

(assert (=> b!1332226 (= res!884093 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30936))))

(declare-fun b!1332227 () Bool)

(assert (=> b!1332227 (= e!758980 tp_is_empty!36685)))

(declare-fun b!1332228 () Bool)

(declare-fun res!884092 () Bool)

(assert (=> b!1332228 (=> (not res!884092) (not e!758983))))

(assert (=> b!1332228 (= res!884092 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44114 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!884095 () Bool)

(assert (=> start!112380 (=> (not res!884095) (not e!758983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112380 (= res!884095 (validMask!0 mask!1998))))

(assert (=> start!112380 e!758983))

(declare-fun e!758979 () Bool)

(declare-fun array_inv!33041 (array!90189) Bool)

(assert (=> start!112380 (and (array_inv!33041 _values!1320) e!758979)))

(assert (=> start!112380 true))

(declare-fun array_inv!33042 (array!90191) Bool)

(assert (=> start!112380 (array_inv!33042 _keys!1590)))

(assert (=> start!112380 tp!107963))

(assert (=> start!112380 tp_is_empty!36685))

(declare-fun b!1332217 () Bool)

(assert (=> b!1332217 (= e!758979 (and e!758982 mapRes!56701))))

(declare-fun condMapEmpty!56701 () Bool)

(declare-fun mapDefault!56701 () ValueCell!17444)

(assert (=> b!1332217 (= condMapEmpty!56701 (= (arr!43561 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17444)) mapDefault!56701)))))

(assert (= (and start!112380 res!884095) b!1332219))

(assert (= (and b!1332219 res!884090) b!1332225))

(assert (= (and b!1332225 res!884091) b!1332226))

(assert (= (and b!1332226 res!884093) b!1332228))

(assert (= (and b!1332228 res!884092) b!1332220))

(assert (= (and b!1332220 res!884097) b!1332223))

(assert (= (and b!1332223 res!884094) b!1332224))

(assert (= (and b!1332224 res!884098) b!1332222))

(assert (= (and b!1332222 res!884096) b!1332221))

(assert (= (and b!1332217 condMapEmpty!56701) mapIsEmpty!56701))

(assert (= (and b!1332217 (not condMapEmpty!56701)) mapNonEmpty!56701))

(get-info :version)

(assert (= (and mapNonEmpty!56701 ((_ is ValueCellFull!17444) mapValue!56701)) b!1332227))

(assert (= (and b!1332217 ((_ is ValueCellFull!17444) mapDefault!56701)) b!1332218))

(assert (= start!112380 b!1332217))

(declare-fun b_lambda!24025 () Bool)

(assert (=> (not b_lambda!24025) (not b!1332221)))

(declare-fun t!45117 () Bool)

(declare-fun tb!11983 () Bool)

(assert (=> (and start!112380 (= defaultEntry!1323 defaultEntry!1323) t!45117) tb!11983))

(declare-fun result!25045 () Bool)

(assert (=> tb!11983 (= result!25045 tp_is_empty!36685)))

(assert (=> b!1332221 t!45117))

(declare-fun b_and!49589 () Bool)

(assert (= b_and!49587 (and (=> t!45117 result!25045) b_and!49589)))

(declare-fun m!1220559 () Bool)

(assert (=> start!112380 m!1220559))

(declare-fun m!1220561 () Bool)

(assert (=> start!112380 m!1220561))

(declare-fun m!1220563 () Bool)

(assert (=> start!112380 m!1220563))

(declare-fun m!1220565 () Bool)

(assert (=> b!1332221 m!1220565))

(declare-fun m!1220567 () Bool)

(assert (=> b!1332221 m!1220567))

(declare-fun m!1220569 () Bool)

(assert (=> b!1332221 m!1220569))

(declare-fun m!1220571 () Bool)

(assert (=> b!1332221 m!1220571))

(declare-fun m!1220573 () Bool)

(assert (=> b!1332221 m!1220573))

(declare-fun m!1220575 () Bool)

(assert (=> b!1332221 m!1220575))

(declare-fun m!1220577 () Bool)

(assert (=> b!1332221 m!1220577))

(declare-fun m!1220579 () Bool)

(assert (=> b!1332221 m!1220579))

(declare-fun m!1220581 () Bool)

(assert (=> b!1332221 m!1220581))

(assert (=> b!1332221 m!1220565))

(assert (=> b!1332221 m!1220575))

(declare-fun m!1220583 () Bool)

(assert (=> b!1332221 m!1220583))

(declare-fun m!1220585 () Bool)

(assert (=> b!1332221 m!1220585))

(declare-fun m!1220587 () Bool)

(assert (=> b!1332221 m!1220587))

(assert (=> b!1332221 m!1220583))

(assert (=> b!1332221 m!1220567))

(declare-fun m!1220589 () Bool)

(assert (=> b!1332221 m!1220589))

(declare-fun m!1220591 () Bool)

(assert (=> b!1332225 m!1220591))

(assert (=> b!1332223 m!1220583))

(assert (=> b!1332224 m!1220583))

(assert (=> b!1332224 m!1220583))

(declare-fun m!1220593 () Bool)

(assert (=> b!1332224 m!1220593))

(declare-fun m!1220595 () Bool)

(assert (=> b!1332226 m!1220595))

(declare-fun m!1220597 () Bool)

(assert (=> mapNonEmpty!56701 m!1220597))

(declare-fun m!1220599 () Bool)

(assert (=> b!1332220 m!1220599))

(assert (=> b!1332220 m!1220599))

(declare-fun m!1220601 () Bool)

(assert (=> b!1332220 m!1220601))

(check-sat (not start!112380) (not b_lambda!24025) tp_is_empty!36685 b_and!49589 (not b!1332224) (not b!1332225) (not b!1332221) (not mapNonEmpty!56701) (not b!1332220) (not b!1332226) (not b_next!30775))
(check-sat b_and!49589 (not b_next!30775))
