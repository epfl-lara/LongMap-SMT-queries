; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112478 () Bool)

(assert start!112478)

(declare-fun b_free!30873 () Bool)

(declare-fun b_next!30873 () Bool)

(assert (=> start!112478 (= b_free!30873 (not b_next!30873))))

(declare-fun tp!108255 () Bool)

(declare-fun b_and!49747 () Bool)

(assert (=> start!112478 (= tp!108255 b_and!49747)))

(declare-fun b!1333862 () Bool)

(declare-fun res!885216 () Bool)

(declare-fun e!759779 () Bool)

(assert (=> b!1333862 (=> (not res!885216) (not e!759779))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90432 0))(
  ( (array!90433 (arr!43682 (Array (_ BitVec 32) (_ BitVec 64))) (size!44232 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90432)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333862 (= res!885216 (not (= k0!1153 (select (arr!43682 _keys!1590) from!1980))))))

(declare-fun b!1333863 () Bool)

(declare-fun e!759782 () Bool)

(declare-fun e!759784 () Bool)

(declare-fun mapRes!56848 () Bool)

(assert (=> b!1333863 (= e!759782 (and e!759784 mapRes!56848))))

(declare-fun condMapEmpty!56848 () Bool)

(declare-datatypes ((V!54147 0))(
  ( (V!54148 (val!18466 Int)) )
))
(declare-datatypes ((ValueCell!17493 0))(
  ( (ValueCellFull!17493 (v!21103 V!54147)) (EmptyCell!17493) )
))
(declare-datatypes ((array!90434 0))(
  ( (array!90435 (arr!43683 (Array (_ BitVec 32) ValueCell!17493)) (size!44233 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90434)

(declare-fun mapDefault!56848 () ValueCell!17493)

(assert (=> b!1333863 (= condMapEmpty!56848 (= (arr!43683 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17493)) mapDefault!56848)))))

(declare-fun b!1333864 () Bool)

(declare-fun res!885209 () Bool)

(declare-fun e!759783 () Bool)

(assert (=> b!1333864 (=> (not res!885209) (not e!759783))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54147)

(declare-fun zeroValue!1262 () V!54147)

(declare-datatypes ((tuple2!23802 0))(
  ( (tuple2!23803 (_1!11912 (_ BitVec 64)) (_2!11912 V!54147)) )
))
(declare-datatypes ((List!30946 0))(
  ( (Nil!30943) (Cons!30942 (h!32151 tuple2!23802) (t!45178 List!30946)) )
))
(declare-datatypes ((ListLongMap!21459 0))(
  ( (ListLongMap!21460 (toList!10745 List!30946)) )
))
(declare-fun contains!8909 (ListLongMap!21459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5724 (array!90432 array!90434 (_ BitVec 32) (_ BitVec 32) V!54147 V!54147 (_ BitVec 32) Int) ListLongMap!21459)

(assert (=> b!1333864 (= res!885209 (contains!8909 (getCurrentListMap!5724 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333865 () Bool)

(declare-fun res!885214 () Bool)

(assert (=> b!1333865 (=> (not res!885214) (not e!759783))))

(declare-datatypes ((List!30947 0))(
  ( (Nil!30944) (Cons!30943 (h!32152 (_ BitVec 64)) (t!45179 List!30947)) )
))
(declare-fun arrayNoDuplicates!0 (array!90432 (_ BitVec 32) List!30947) Bool)

(assert (=> b!1333865 (= res!885214 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30944))))

(declare-fun res!885211 () Bool)

(assert (=> start!112478 (=> (not res!885211) (not e!759783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112478 (= res!885211 (validMask!0 mask!1998))))

(assert (=> start!112478 e!759783))

(declare-fun array_inv!32945 (array!90434) Bool)

(assert (=> start!112478 (and (array_inv!32945 _values!1320) e!759782)))

(assert (=> start!112478 true))

(declare-fun array_inv!32946 (array!90432) Bool)

(assert (=> start!112478 (array_inv!32946 _keys!1590)))

(assert (=> start!112478 tp!108255))

(declare-fun tp_is_empty!36783 () Bool)

(assert (=> start!112478 tp_is_empty!36783))

(declare-fun b!1333866 () Bool)

(assert (=> b!1333866 (= e!759784 tp_is_empty!36783)))

(declare-fun mapIsEmpty!56848 () Bool)

(assert (=> mapIsEmpty!56848 mapRes!56848))

(declare-fun b!1333867 () Bool)

(declare-fun res!885212 () Bool)

(assert (=> b!1333867 (=> (not res!885212) (not e!759783))))

(assert (=> b!1333867 (= res!885212 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44232 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333868 () Bool)

(assert (=> b!1333868 (= e!759783 e!759779)))

(declare-fun res!885218 () Bool)

(assert (=> b!1333868 (=> (not res!885218) (not e!759779))))

(declare-fun lt!592219 () V!54147)

(declare-fun lt!592217 () ListLongMap!21459)

(declare-fun +!4717 (ListLongMap!21459 tuple2!23802) ListLongMap!21459)

(assert (=> b!1333868 (= res!885218 (contains!8909 (+!4717 lt!592217 (tuple2!23803 (select (arr!43682 _keys!1590) from!1980) lt!592219)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6355 (array!90432 array!90434 (_ BitVec 32) (_ BitVec 32) V!54147 V!54147 (_ BitVec 32) Int) ListLongMap!21459)

(assert (=> b!1333868 (= lt!592217 (getCurrentListMapNoExtraKeys!6355 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22037 (ValueCell!17493 V!54147) V!54147)

(declare-fun dynLambda!3656 (Int (_ BitVec 64)) V!54147)

(assert (=> b!1333868 (= lt!592219 (get!22037 (select (arr!43683 _values!1320) from!1980) (dynLambda!3656 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333869 () Bool)

(declare-fun res!885219 () Bool)

(assert (=> b!1333869 (=> (not res!885219) (not e!759783))))

(assert (=> b!1333869 (= res!885219 (not (= (select (arr!43682 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333870 () Bool)

(declare-fun e!759781 () Bool)

(assert (=> b!1333870 (= e!759781 tp_is_empty!36783)))

(declare-fun b!1333871 () Bool)

(declare-fun res!885215 () Bool)

(assert (=> b!1333871 (=> (not res!885215) (not e!759783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333871 (= res!885215 (validKeyInArray!0 (select (arr!43682 _keys!1590) from!1980)))))

(declare-fun b!1333872 () Bool)

(declare-fun res!885210 () Bool)

(assert (=> b!1333872 (=> (not res!885210) (not e!759783))))

(assert (=> b!1333872 (= res!885210 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333873 () Bool)

(declare-fun res!885217 () Bool)

(assert (=> b!1333873 (=> (not res!885217) (not e!759783))))

(assert (=> b!1333873 (= res!885217 (and (= (size!44233 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44232 _keys!1590) (size!44233 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333874 () Bool)

(assert (=> b!1333874 (= e!759779 (not true))))

(assert (=> b!1333874 (contains!8909 lt!592217 k0!1153)))

(declare-datatypes ((Unit!43875 0))(
  ( (Unit!43876) )
))
(declare-fun lt!592218 () Unit!43875)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!300 ((_ BitVec 64) (_ BitVec 64) V!54147 ListLongMap!21459) Unit!43875)

(assert (=> b!1333874 (= lt!592218 (lemmaInListMapAfterAddingDiffThenInBefore!300 k0!1153 (select (arr!43682 _keys!1590) from!1980) lt!592219 lt!592217))))

(declare-fun mapNonEmpty!56848 () Bool)

(declare-fun tp!108256 () Bool)

(assert (=> mapNonEmpty!56848 (= mapRes!56848 (and tp!108256 e!759781))))

(declare-fun mapKey!56848 () (_ BitVec 32))

(declare-fun mapValue!56848 () ValueCell!17493)

(declare-fun mapRest!56848 () (Array (_ BitVec 32) ValueCell!17493))

(assert (=> mapNonEmpty!56848 (= (arr!43683 _values!1320) (store mapRest!56848 mapKey!56848 mapValue!56848))))

(declare-fun b!1333875 () Bool)

(declare-fun res!885213 () Bool)

(assert (=> b!1333875 (=> (not res!885213) (not e!759783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90432 (_ BitVec 32)) Bool)

(assert (=> b!1333875 (= res!885213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112478 res!885211) b!1333873))

(assert (= (and b!1333873 res!885217) b!1333875))

(assert (= (and b!1333875 res!885213) b!1333865))

(assert (= (and b!1333865 res!885214) b!1333867))

(assert (= (and b!1333867 res!885212) b!1333864))

(assert (= (and b!1333864 res!885209) b!1333869))

(assert (= (and b!1333869 res!885219) b!1333871))

(assert (= (and b!1333871 res!885215) b!1333872))

(assert (= (and b!1333872 res!885210) b!1333868))

(assert (= (and b!1333868 res!885218) b!1333862))

(assert (= (and b!1333862 res!885216) b!1333874))

(assert (= (and b!1333863 condMapEmpty!56848) mapIsEmpty!56848))

(assert (= (and b!1333863 (not condMapEmpty!56848)) mapNonEmpty!56848))

(get-info :version)

(assert (= (and mapNonEmpty!56848 ((_ is ValueCellFull!17493) mapValue!56848)) b!1333870))

(assert (= (and b!1333863 ((_ is ValueCellFull!17493) mapDefault!56848)) b!1333866))

(assert (= start!112478 b!1333863))

(declare-fun b_lambda!24079 () Bool)

(assert (=> (not b_lambda!24079) (not b!1333868)))

(declare-fun t!45177 () Bool)

(declare-fun tb!12035 () Bool)

(assert (=> (and start!112478 (= defaultEntry!1323 defaultEntry!1323) t!45177) tb!12035))

(declare-fun result!25141 () Bool)

(assert (=> tb!12035 (= result!25141 tp_is_empty!36783)))

(assert (=> b!1333868 t!45177))

(declare-fun b_and!49749 () Bool)

(assert (= b_and!49747 (and (=> t!45177 result!25141) b_and!49749)))

(declare-fun m!1222335 () Bool)

(assert (=> b!1333869 m!1222335))

(declare-fun m!1222337 () Bool)

(assert (=> mapNonEmpty!56848 m!1222337))

(declare-fun m!1222339 () Bool)

(assert (=> b!1333874 m!1222339))

(assert (=> b!1333874 m!1222335))

(assert (=> b!1333874 m!1222335))

(declare-fun m!1222341 () Bool)

(assert (=> b!1333874 m!1222341))

(declare-fun m!1222343 () Bool)

(assert (=> start!112478 m!1222343))

(declare-fun m!1222345 () Bool)

(assert (=> start!112478 m!1222345))

(declare-fun m!1222347 () Bool)

(assert (=> start!112478 m!1222347))

(declare-fun m!1222349 () Bool)

(assert (=> b!1333865 m!1222349))

(declare-fun m!1222351 () Bool)

(assert (=> b!1333868 m!1222351))

(declare-fun m!1222353 () Bool)

(assert (=> b!1333868 m!1222353))

(assert (=> b!1333868 m!1222351))

(declare-fun m!1222355 () Bool)

(assert (=> b!1333868 m!1222355))

(declare-fun m!1222357 () Bool)

(assert (=> b!1333868 m!1222357))

(declare-fun m!1222359 () Bool)

(assert (=> b!1333868 m!1222359))

(assert (=> b!1333868 m!1222357))

(declare-fun m!1222361 () Bool)

(assert (=> b!1333868 m!1222361))

(assert (=> b!1333868 m!1222353))

(assert (=> b!1333868 m!1222335))

(assert (=> b!1333862 m!1222335))

(declare-fun m!1222363 () Bool)

(assert (=> b!1333864 m!1222363))

(assert (=> b!1333864 m!1222363))

(declare-fun m!1222365 () Bool)

(assert (=> b!1333864 m!1222365))

(declare-fun m!1222367 () Bool)

(assert (=> b!1333875 m!1222367))

(assert (=> b!1333871 m!1222335))

(assert (=> b!1333871 m!1222335))

(declare-fun m!1222369 () Bool)

(assert (=> b!1333871 m!1222369))

(check-sat (not b!1333875) (not b!1333865) (not b!1333868) (not mapNonEmpty!56848) (not start!112478) (not b!1333871) (not b_next!30873) b_and!49749 (not b!1333874) tp_is_empty!36783 (not b_lambda!24079) (not b!1333864))
(check-sat b_and!49749 (not b_next!30873))
