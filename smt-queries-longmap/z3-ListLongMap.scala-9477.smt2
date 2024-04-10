; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112472 () Bool)

(assert start!112472)

(declare-fun b_free!30867 () Bool)

(declare-fun b_next!30867 () Bool)

(assert (=> start!112472 (= b_free!30867 (not b_next!30867))))

(declare-fun tp!108238 () Bool)

(declare-fun b_and!49735 () Bool)

(assert (=> start!112472 (= tp!108238 b_and!49735)))

(declare-fun b!1333730 () Bool)

(declare-fun res!885111 () Bool)

(declare-fun e!759729 () Bool)

(assert (=> b!1333730 (=> (not res!885111) (not e!759729))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90424 0))(
  ( (array!90425 (arr!43678 (Array (_ BitVec 32) (_ BitVec 64))) (size!44228 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90424)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333730 (= res!885111 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44228 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56839 () Bool)

(declare-fun mapRes!56839 () Bool)

(assert (=> mapIsEmpty!56839 mapRes!56839))

(declare-fun b!1333731 () Bool)

(declare-fun e!759730 () Bool)

(declare-fun tp_is_empty!36777 () Bool)

(assert (=> b!1333731 (= e!759730 tp_is_empty!36777)))

(declare-fun b!1333732 () Bool)

(declare-fun res!885118 () Bool)

(declare-fun e!759725 () Bool)

(assert (=> b!1333732 (=> (not res!885118) (not e!759725))))

(assert (=> b!1333732 (= res!885118 (not (= k0!1153 (select (arr!43678 _keys!1590) from!1980))))))

(declare-fun b!1333733 () Bool)

(assert (=> b!1333733 (= e!759725 (not true))))

(declare-datatypes ((V!54139 0))(
  ( (V!54140 (val!18463 Int)) )
))
(declare-datatypes ((tuple2!23800 0))(
  ( (tuple2!23801 (_1!11911 (_ BitVec 64)) (_2!11911 V!54139)) )
))
(declare-datatypes ((List!30944 0))(
  ( (Nil!30941) (Cons!30940 (h!32149 tuple2!23800) (t!45170 List!30944)) )
))
(declare-datatypes ((ListLongMap!21457 0))(
  ( (ListLongMap!21458 (toList!10744 List!30944)) )
))
(declare-fun lt!592190 () ListLongMap!21457)

(declare-fun contains!8908 (ListLongMap!21457 (_ BitVec 64)) Bool)

(assert (=> b!1333733 (contains!8908 lt!592190 k0!1153)))

(declare-datatypes ((Unit!43873 0))(
  ( (Unit!43874) )
))
(declare-fun lt!592192 () Unit!43873)

(declare-fun lt!592191 () V!54139)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!299 ((_ BitVec 64) (_ BitVec 64) V!54139 ListLongMap!21457) Unit!43873)

(assert (=> b!1333733 (= lt!592192 (lemmaInListMapAfterAddingDiffThenInBefore!299 k0!1153 (select (arr!43678 _keys!1590) from!1980) lt!592191 lt!592190))))

(declare-fun b!1333734 () Bool)

(declare-fun res!885119 () Bool)

(assert (=> b!1333734 (=> (not res!885119) (not e!759729))))

(assert (=> b!1333734 (= res!885119 (not (= (select (arr!43678 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333735 () Bool)

(declare-fun res!885112 () Bool)

(assert (=> b!1333735 (=> (not res!885112) (not e!759729))))

(declare-datatypes ((List!30945 0))(
  ( (Nil!30942) (Cons!30941 (h!32150 (_ BitVec 64)) (t!45171 List!30945)) )
))
(declare-fun arrayNoDuplicates!0 (array!90424 (_ BitVec 32) List!30945) Bool)

(assert (=> b!1333735 (= res!885112 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30942))))

(declare-fun b!1333736 () Bool)

(assert (=> b!1333736 (= e!759729 e!759725)))

(declare-fun res!885110 () Bool)

(assert (=> b!1333736 (=> (not res!885110) (not e!759725))))

(declare-fun +!4716 (ListLongMap!21457 tuple2!23800) ListLongMap!21457)

(assert (=> b!1333736 (= res!885110 (contains!8908 (+!4716 lt!592190 (tuple2!23801 (select (arr!43678 _keys!1590) from!1980) lt!592191)) k0!1153))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54139)

(declare-fun zeroValue!1262 () V!54139)

(declare-datatypes ((ValueCell!17490 0))(
  ( (ValueCellFull!17490 (v!21100 V!54139)) (EmptyCell!17490) )
))
(declare-datatypes ((array!90426 0))(
  ( (array!90427 (arr!43679 (Array (_ BitVec 32) ValueCell!17490)) (size!44229 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90426)

(declare-fun getCurrentListMapNoExtraKeys!6354 (array!90424 array!90426 (_ BitVec 32) (_ BitVec 32) V!54139 V!54139 (_ BitVec 32) Int) ListLongMap!21457)

(assert (=> b!1333736 (= lt!592190 (getCurrentListMapNoExtraKeys!6354 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22034 (ValueCell!17490 V!54139) V!54139)

(declare-fun dynLambda!3655 (Int (_ BitVec 64)) V!54139)

(assert (=> b!1333736 (= lt!592191 (get!22034 (select (arr!43679 _values!1320) from!1980) (dynLambda!3655 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!885120 () Bool)

(assert (=> start!112472 (=> (not res!885120) (not e!759729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112472 (= res!885120 (validMask!0 mask!1998))))

(assert (=> start!112472 e!759729))

(declare-fun e!759726 () Bool)

(declare-fun array_inv!32943 (array!90426) Bool)

(assert (=> start!112472 (and (array_inv!32943 _values!1320) e!759726)))

(assert (=> start!112472 true))

(declare-fun array_inv!32944 (array!90424) Bool)

(assert (=> start!112472 (array_inv!32944 _keys!1590)))

(assert (=> start!112472 tp!108238))

(assert (=> start!112472 tp_is_empty!36777))

(declare-fun mapNonEmpty!56839 () Bool)

(declare-fun tp!108237 () Bool)

(assert (=> mapNonEmpty!56839 (= mapRes!56839 (and tp!108237 e!759730))))

(declare-fun mapValue!56839 () ValueCell!17490)

(declare-fun mapRest!56839 () (Array (_ BitVec 32) ValueCell!17490))

(declare-fun mapKey!56839 () (_ BitVec 32))

(assert (=> mapNonEmpty!56839 (= (arr!43679 _values!1320) (store mapRest!56839 mapKey!56839 mapValue!56839))))

(declare-fun b!1333737 () Bool)

(declare-fun res!885117 () Bool)

(assert (=> b!1333737 (=> (not res!885117) (not e!759729))))

(assert (=> b!1333737 (= res!885117 (and (= (size!44229 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44228 _keys!1590) (size!44229 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333738 () Bool)

(declare-fun res!885114 () Bool)

(assert (=> b!1333738 (=> (not res!885114) (not e!759729))))

(assert (=> b!1333738 (= res!885114 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333739 () Bool)

(declare-fun res!885113 () Bool)

(assert (=> b!1333739 (=> (not res!885113) (not e!759729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333739 (= res!885113 (validKeyInArray!0 (select (arr!43678 _keys!1590) from!1980)))))

(declare-fun b!1333740 () Bool)

(declare-fun e!759728 () Bool)

(assert (=> b!1333740 (= e!759728 tp_is_empty!36777)))

(declare-fun b!1333741 () Bool)

(assert (=> b!1333741 (= e!759726 (and e!759728 mapRes!56839))))

(declare-fun condMapEmpty!56839 () Bool)

(declare-fun mapDefault!56839 () ValueCell!17490)

(assert (=> b!1333741 (= condMapEmpty!56839 (= (arr!43679 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17490)) mapDefault!56839)))))

(declare-fun b!1333742 () Bool)

(declare-fun res!885116 () Bool)

(assert (=> b!1333742 (=> (not res!885116) (not e!759729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90424 (_ BitVec 32)) Bool)

(assert (=> b!1333742 (= res!885116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333743 () Bool)

(declare-fun res!885115 () Bool)

(assert (=> b!1333743 (=> (not res!885115) (not e!759729))))

(declare-fun getCurrentListMap!5723 (array!90424 array!90426 (_ BitVec 32) (_ BitVec 32) V!54139 V!54139 (_ BitVec 32) Int) ListLongMap!21457)

(assert (=> b!1333743 (= res!885115 (contains!8908 (getCurrentListMap!5723 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112472 res!885120) b!1333737))

(assert (= (and b!1333737 res!885117) b!1333742))

(assert (= (and b!1333742 res!885116) b!1333735))

(assert (= (and b!1333735 res!885112) b!1333730))

(assert (= (and b!1333730 res!885111) b!1333743))

(assert (= (and b!1333743 res!885115) b!1333734))

(assert (= (and b!1333734 res!885119) b!1333739))

(assert (= (and b!1333739 res!885113) b!1333738))

(assert (= (and b!1333738 res!885114) b!1333736))

(assert (= (and b!1333736 res!885110) b!1333732))

(assert (= (and b!1333732 res!885118) b!1333733))

(assert (= (and b!1333741 condMapEmpty!56839) mapIsEmpty!56839))

(assert (= (and b!1333741 (not condMapEmpty!56839)) mapNonEmpty!56839))

(get-info :version)

(assert (= (and mapNonEmpty!56839 ((_ is ValueCellFull!17490) mapValue!56839)) b!1333731))

(assert (= (and b!1333741 ((_ is ValueCellFull!17490) mapDefault!56839)) b!1333740))

(assert (= start!112472 b!1333741))

(declare-fun b_lambda!24073 () Bool)

(assert (=> (not b_lambda!24073) (not b!1333736)))

(declare-fun t!45169 () Bool)

(declare-fun tb!12029 () Bool)

(assert (=> (and start!112472 (= defaultEntry!1323 defaultEntry!1323) t!45169) tb!12029))

(declare-fun result!25129 () Bool)

(assert (=> tb!12029 (= result!25129 tp_is_empty!36777)))

(assert (=> b!1333736 t!45169))

(declare-fun b_and!49737 () Bool)

(assert (= b_and!49735 (and (=> t!45169 result!25129) b_and!49737)))

(declare-fun m!1222227 () Bool)

(assert (=> b!1333735 m!1222227))

(declare-fun m!1222229 () Bool)

(assert (=> b!1333732 m!1222229))

(declare-fun m!1222231 () Bool)

(assert (=> b!1333742 m!1222231))

(declare-fun m!1222233 () Bool)

(assert (=> mapNonEmpty!56839 m!1222233))

(assert (=> b!1333734 m!1222229))

(assert (=> b!1333739 m!1222229))

(assert (=> b!1333739 m!1222229))

(declare-fun m!1222235 () Bool)

(assert (=> b!1333739 m!1222235))

(declare-fun m!1222237 () Bool)

(assert (=> b!1333733 m!1222237))

(assert (=> b!1333733 m!1222229))

(assert (=> b!1333733 m!1222229))

(declare-fun m!1222239 () Bool)

(assert (=> b!1333733 m!1222239))

(declare-fun m!1222241 () Bool)

(assert (=> b!1333743 m!1222241))

(assert (=> b!1333743 m!1222241))

(declare-fun m!1222243 () Bool)

(assert (=> b!1333743 m!1222243))

(declare-fun m!1222245 () Bool)

(assert (=> b!1333736 m!1222245))

(declare-fun m!1222247 () Bool)

(assert (=> b!1333736 m!1222247))

(assert (=> b!1333736 m!1222245))

(declare-fun m!1222249 () Bool)

(assert (=> b!1333736 m!1222249))

(declare-fun m!1222251 () Bool)

(assert (=> b!1333736 m!1222251))

(declare-fun m!1222253 () Bool)

(assert (=> b!1333736 m!1222253))

(declare-fun m!1222255 () Bool)

(assert (=> b!1333736 m!1222255))

(assert (=> b!1333736 m!1222229))

(assert (=> b!1333736 m!1222247))

(assert (=> b!1333736 m!1222253))

(declare-fun m!1222257 () Bool)

(assert (=> start!112472 m!1222257))

(declare-fun m!1222259 () Bool)

(assert (=> start!112472 m!1222259))

(declare-fun m!1222261 () Bool)

(assert (=> start!112472 m!1222261))

(check-sat (not b!1333736) (not b!1333742) (not start!112472) (not b!1333743) (not mapNonEmpty!56839) b_and!49737 tp_is_empty!36777 (not b!1333733) (not b_next!30867) (not b!1333735) (not b_lambda!24073) (not b!1333739))
(check-sat b_and!49737 (not b_next!30867))
