; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112712 () Bool)

(assert start!112712)

(declare-fun b_free!30883 () Bool)

(declare-fun b_next!30883 () Bool)

(assert (=> start!112712 (= b_free!30883 (not b_next!30883))))

(declare-fun tp!108286 () Bool)

(declare-fun b_and!49769 () Bool)

(assert (=> start!112712 (= tp!108286 b_and!49769)))

(declare-fun b!1335382 () Bool)

(declare-fun res!885892 () Bool)

(declare-fun e!760717 () Bool)

(assert (=> b!1335382 (=> (not res!885892) (not e!760717))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90559 0))(
  ( (array!90560 (arr!43741 (Array (_ BitVec 32) (_ BitVec 64))) (size!44292 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90559)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335382 (= res!885892 (not (= k0!1153 (select (arr!43741 _keys!1590) from!1980))))))

(declare-fun b!1335383 () Bool)

(declare-fun res!885901 () Bool)

(declare-fun e!760712 () Bool)

(assert (=> b!1335383 (=> (not res!885901) (not e!760712))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335383 (= res!885901 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44292 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335384 () Bool)

(declare-fun res!885900 () Bool)

(assert (=> b!1335384 (=> (not res!885900) (not e!760712))))

(assert (=> b!1335384 (= res!885900 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1335385 () Bool)

(declare-fun res!885895 () Bool)

(assert (=> b!1335385 (=> (not res!885895) (not e!760712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335385 (= res!885895 (validKeyInArray!0 (select (arr!43741 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56863 () Bool)

(declare-fun mapRes!56863 () Bool)

(declare-fun tp!108285 () Bool)

(declare-fun e!760713 () Bool)

(assert (=> mapNonEmpty!56863 (= mapRes!56863 (and tp!108285 e!760713))))

(declare-datatypes ((V!54161 0))(
  ( (V!54162 (val!18471 Int)) )
))
(declare-datatypes ((ValueCell!17498 0))(
  ( (ValueCellFull!17498 (v!21103 V!54161)) (EmptyCell!17498) )
))
(declare-datatypes ((array!90561 0))(
  ( (array!90562 (arr!43742 (Array (_ BitVec 32) ValueCell!17498)) (size!44293 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90561)

(declare-fun mapValue!56863 () ValueCell!17498)

(declare-fun mapRest!56863 () (Array (_ BitVec 32) ValueCell!17498))

(declare-fun mapKey!56863 () (_ BitVec 32))

(assert (=> mapNonEmpty!56863 (= (arr!43742 _values!1320) (store mapRest!56863 mapKey!56863 mapValue!56863))))

(declare-fun b!1335386 () Bool)

(assert (=> b!1335386 (= e!760717 (not true))))

(declare-datatypes ((tuple2!23838 0))(
  ( (tuple2!23839 (_1!11930 (_ BitVec 64)) (_2!11930 V!54161)) )
))
(declare-datatypes ((List!30991 0))(
  ( (Nil!30988) (Cons!30987 (h!32205 tuple2!23838) (t!45225 List!30991)) )
))
(declare-datatypes ((ListLongMap!21503 0))(
  ( (ListLongMap!21504 (toList!10767 List!30991)) )
))
(declare-fun lt!592739 () ListLongMap!21503)

(declare-fun contains!8943 (ListLongMap!21503 (_ BitVec 64)) Bool)

(assert (=> b!1335386 (contains!8943 lt!592739 k0!1153)))

(declare-datatypes ((Unit!43814 0))(
  ( (Unit!43815) )
))
(declare-fun lt!592740 () Unit!43814)

(declare-fun lt!592738 () V!54161)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!295 ((_ BitVec 64) (_ BitVec 64) V!54161 ListLongMap!21503) Unit!43814)

(assert (=> b!1335386 (= lt!592740 (lemmaInListMapAfterAddingDiffThenInBefore!295 k0!1153 (select (arr!43741 _keys!1590) from!1980) lt!592738 lt!592739))))

(declare-fun res!885902 () Bool)

(assert (=> start!112712 (=> (not res!885902) (not e!760712))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112712 (= res!885902 (validMask!0 mask!1998))))

(assert (=> start!112712 e!760712))

(declare-fun e!760714 () Bool)

(declare-fun array_inv!33261 (array!90561) Bool)

(assert (=> start!112712 (and (array_inv!33261 _values!1320) e!760714)))

(assert (=> start!112712 true))

(declare-fun array_inv!33262 (array!90559) Bool)

(assert (=> start!112712 (array_inv!33262 _keys!1590)))

(assert (=> start!112712 tp!108286))

(declare-fun tp_is_empty!36793 () Bool)

(assert (=> start!112712 tp_is_empty!36793))

(declare-fun b!1335381 () Bool)

(declare-fun res!885893 () Bool)

(assert (=> b!1335381 (=> (not res!885893) (not e!760712))))

(assert (=> b!1335381 (= res!885893 (and (= (size!44293 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44292 _keys!1590) (size!44293 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335387 () Bool)

(declare-fun res!885899 () Bool)

(assert (=> b!1335387 (=> (not res!885899) (not e!760712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90559 (_ BitVec 32)) Bool)

(assert (=> b!1335387 (= res!885899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335388 () Bool)

(declare-fun e!760716 () Bool)

(assert (=> b!1335388 (= e!760716 tp_is_empty!36793)))

(declare-fun mapIsEmpty!56863 () Bool)

(assert (=> mapIsEmpty!56863 mapRes!56863))

(declare-fun b!1335389 () Bool)

(assert (=> b!1335389 (= e!760714 (and e!760716 mapRes!56863))))

(declare-fun condMapEmpty!56863 () Bool)

(declare-fun mapDefault!56863 () ValueCell!17498)

(assert (=> b!1335389 (= condMapEmpty!56863 (= (arr!43742 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17498)) mapDefault!56863)))))

(declare-fun b!1335390 () Bool)

(declare-fun res!885898 () Bool)

(assert (=> b!1335390 (=> (not res!885898) (not e!760712))))

(declare-fun minValue!1262 () V!54161)

(declare-fun zeroValue!1262 () V!54161)

(declare-fun defaultEntry!1323 () Int)

(declare-fun getCurrentListMap!5729 (array!90559 array!90561 (_ BitVec 32) (_ BitVec 32) V!54161 V!54161 (_ BitVec 32) Int) ListLongMap!21503)

(assert (=> b!1335390 (= res!885898 (contains!8943 (getCurrentListMap!5729 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335391 () Bool)

(assert (=> b!1335391 (= e!760712 e!760717)))

(declare-fun res!885896 () Bool)

(assert (=> b!1335391 (=> (not res!885896) (not e!760717))))

(declare-fun +!4756 (ListLongMap!21503 tuple2!23838) ListLongMap!21503)

(assert (=> b!1335391 (= res!885896 (contains!8943 (+!4756 lt!592739 (tuple2!23839 (select (arr!43741 _keys!1590) from!1980) lt!592738)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6400 (array!90559 array!90561 (_ BitVec 32) (_ BitVec 32) V!54161 V!54161 (_ BitVec 32) Int) ListLongMap!21503)

(assert (=> b!1335391 (= lt!592739 (getCurrentListMapNoExtraKeys!6400 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22083 (ValueCell!17498 V!54161) V!54161)

(declare-fun dynLambda!3710 (Int (_ BitVec 64)) V!54161)

(assert (=> b!1335391 (= lt!592738 (get!22083 (select (arr!43742 _values!1320) from!1980) (dynLambda!3710 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335392 () Bool)

(assert (=> b!1335392 (= e!760713 tp_is_empty!36793)))

(declare-fun b!1335393 () Bool)

(declare-fun res!885894 () Bool)

(assert (=> b!1335393 (=> (not res!885894) (not e!760712))))

(assert (=> b!1335393 (= res!885894 (not (= (select (arr!43741 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335394 () Bool)

(declare-fun res!885897 () Bool)

(assert (=> b!1335394 (=> (not res!885897) (not e!760712))))

(declare-datatypes ((List!30992 0))(
  ( (Nil!30989) (Cons!30988 (h!32206 (_ BitVec 64)) (t!45226 List!30992)) )
))
(declare-fun arrayNoDuplicates!0 (array!90559 (_ BitVec 32) List!30992) Bool)

(assert (=> b!1335394 (= res!885897 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30989))))

(assert (= (and start!112712 res!885902) b!1335381))

(assert (= (and b!1335381 res!885893) b!1335387))

(assert (= (and b!1335387 res!885899) b!1335394))

(assert (= (and b!1335394 res!885897) b!1335383))

(assert (= (and b!1335383 res!885901) b!1335390))

(assert (= (and b!1335390 res!885898) b!1335393))

(assert (= (and b!1335393 res!885894) b!1335385))

(assert (= (and b!1335385 res!885895) b!1335384))

(assert (= (and b!1335384 res!885900) b!1335391))

(assert (= (and b!1335391 res!885896) b!1335382))

(assert (= (and b!1335382 res!885892) b!1335386))

(assert (= (and b!1335389 condMapEmpty!56863) mapIsEmpty!56863))

(assert (= (and b!1335389 (not condMapEmpty!56863)) mapNonEmpty!56863))

(get-info :version)

(assert (= (and mapNonEmpty!56863 ((_ is ValueCellFull!17498) mapValue!56863)) b!1335392))

(assert (= (and b!1335389 ((_ is ValueCellFull!17498) mapDefault!56863)) b!1335388))

(assert (= start!112712 b!1335389))

(declare-fun b_lambda!24083 () Bool)

(assert (=> (not b_lambda!24083) (not b!1335391)))

(declare-fun t!45224 () Bool)

(declare-fun tb!12037 () Bool)

(assert (=> (and start!112712 (= defaultEntry!1323 defaultEntry!1323) t!45224) tb!12037))

(declare-fun result!25153 () Bool)

(assert (=> tb!12037 (= result!25153 tp_is_empty!36793)))

(assert (=> b!1335391 t!45224))

(declare-fun b_and!49771 () Bool)

(assert (= b_and!49769 (and (=> t!45224 result!25153) b_and!49771)))

(declare-fun m!1224113 () Bool)

(assert (=> b!1335382 m!1224113))

(declare-fun m!1224115 () Bool)

(assert (=> b!1335386 m!1224115))

(assert (=> b!1335386 m!1224113))

(assert (=> b!1335386 m!1224113))

(declare-fun m!1224117 () Bool)

(assert (=> b!1335386 m!1224117))

(declare-fun m!1224119 () Bool)

(assert (=> b!1335390 m!1224119))

(assert (=> b!1335390 m!1224119))

(declare-fun m!1224121 () Bool)

(assert (=> b!1335390 m!1224121))

(declare-fun m!1224123 () Bool)

(assert (=> b!1335394 m!1224123))

(declare-fun m!1224125 () Bool)

(assert (=> b!1335387 m!1224125))

(declare-fun m!1224127 () Bool)

(assert (=> b!1335391 m!1224127))

(declare-fun m!1224129 () Bool)

(assert (=> b!1335391 m!1224129))

(assert (=> b!1335391 m!1224127))

(declare-fun m!1224131 () Bool)

(assert (=> b!1335391 m!1224131))

(declare-fun m!1224133 () Bool)

(assert (=> b!1335391 m!1224133))

(assert (=> b!1335391 m!1224133))

(declare-fun m!1224135 () Bool)

(assert (=> b!1335391 m!1224135))

(declare-fun m!1224137 () Bool)

(assert (=> b!1335391 m!1224137))

(assert (=> b!1335391 m!1224129))

(assert (=> b!1335391 m!1224113))

(declare-fun m!1224139 () Bool)

(assert (=> mapNonEmpty!56863 m!1224139))

(assert (=> b!1335385 m!1224113))

(assert (=> b!1335385 m!1224113))

(declare-fun m!1224141 () Bool)

(assert (=> b!1335385 m!1224141))

(assert (=> b!1335393 m!1224113))

(declare-fun m!1224143 () Bool)

(assert (=> start!112712 m!1224143))

(declare-fun m!1224145 () Bool)

(assert (=> start!112712 m!1224145))

(declare-fun m!1224147 () Bool)

(assert (=> start!112712 m!1224147))

(check-sat b_and!49771 tp_is_empty!36793 (not b!1335386) (not b_lambda!24083) (not mapNonEmpty!56863) (not start!112712) (not b!1335390) (not b!1335385) (not b!1335394) (not b!1335387) (not b!1335391) (not b_next!30883))
(check-sat b_and!49771 (not b_next!30883))
