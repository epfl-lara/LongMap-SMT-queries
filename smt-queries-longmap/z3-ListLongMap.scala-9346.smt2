; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111514 () Bool)

(assert start!111514)

(declare-fun b_free!30171 () Bool)

(declare-fun b_next!30171 () Bool)

(assert (=> start!111514 (= b_free!30171 (not b_next!30171))))

(declare-fun tp!105988 () Bool)

(declare-fun b_and!48501 () Bool)

(assert (=> start!111514 (= tp!105988 b_and!48501)))

(declare-fun b!1320210 () Bool)

(declare-fun res!876229 () Bool)

(declare-fun e!753121 () Bool)

(assert (=> b!1320210 (=> (not res!876229) (not e!753121))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((array!88912 0))(
  ( (array!88913 (arr!42930 (Array (_ BitVec 32) (_ BitVec 64))) (size!43480 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88912)

(assert (=> b!1320210 (= res!876229 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43480 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320211 () Bool)

(declare-fun e!753124 () Bool)

(declare-fun e!753120 () Bool)

(declare-fun mapRes!55634 () Bool)

(assert (=> b!1320211 (= e!753124 (and e!753120 mapRes!55634))))

(declare-fun condMapEmpty!55634 () Bool)

(declare-datatypes ((V!53091 0))(
  ( (V!53092 (val!18070 Int)) )
))
(declare-datatypes ((ValueCell!17097 0))(
  ( (ValueCellFull!17097 (v!20700 V!53091)) (EmptyCell!17097) )
))
(declare-datatypes ((array!88914 0))(
  ( (array!88915 (arr!42931 (Array (_ BitVec 32) ValueCell!17097)) (size!43481 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88914)

(declare-fun mapDefault!55634 () ValueCell!17097)

(assert (=> b!1320211 (= condMapEmpty!55634 (= (arr!42931 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17097)) mapDefault!55634)))))

(declare-fun b!1320212 () Bool)

(declare-fun e!753122 () Bool)

(declare-fun tp_is_empty!35991 () Bool)

(assert (=> b!1320212 (= e!753122 tp_is_empty!35991)))

(declare-fun mapNonEmpty!55634 () Bool)

(declare-fun tp!105989 () Bool)

(assert (=> mapNonEmpty!55634 (= mapRes!55634 (and tp!105989 e!753122))))

(declare-fun mapKey!55634 () (_ BitVec 32))

(declare-fun mapRest!55634 () (Array (_ BitVec 32) ValueCell!17097))

(declare-fun mapValue!55634 () ValueCell!17097)

(assert (=> mapNonEmpty!55634 (= (arr!42931 _values!1337) (store mapRest!55634 mapKey!55634 mapValue!55634))))

(declare-fun mapIsEmpty!55634 () Bool)

(assert (=> mapIsEmpty!55634 mapRes!55634))

(declare-fun b!1320213 () Bool)

(declare-fun res!876235 () Bool)

(assert (=> b!1320213 (=> (not res!876235) (not e!753121))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88912 (_ BitVec 32)) Bool)

(assert (=> b!1320213 (= res!876235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320214 () Bool)

(declare-fun res!876232 () Bool)

(assert (=> b!1320214 (=> (not res!876232) (not e!753121))))

(declare-datatypes ((List!30415 0))(
  ( (Nil!30412) (Cons!30411 (h!31620 (_ BitVec 64)) (t!44135 List!30415)) )
))
(declare-fun arrayNoDuplicates!0 (array!88912 (_ BitVec 32) List!30415) Bool)

(assert (=> b!1320214 (= res!876232 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30412))))

(declare-fun b!1320215 () Bool)

(declare-fun res!876231 () Bool)

(assert (=> b!1320215 (=> (not res!876231) (not e!753121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320215 (= res!876231 (validKeyInArray!0 (select (arr!42930 _keys!1609) from!2000)))))

(declare-fun res!876234 () Bool)

(assert (=> start!111514 (=> (not res!876234) (not e!753121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111514 (= res!876234 (validMask!0 mask!2019))))

(assert (=> start!111514 e!753121))

(declare-fun array_inv!32411 (array!88912) Bool)

(assert (=> start!111514 (array_inv!32411 _keys!1609)))

(assert (=> start!111514 true))

(assert (=> start!111514 tp_is_empty!35991))

(declare-fun array_inv!32412 (array!88914) Bool)

(assert (=> start!111514 (and (array_inv!32412 _values!1337) e!753124)))

(assert (=> start!111514 tp!105988))

(declare-fun b!1320216 () Bool)

(declare-fun res!876230 () Bool)

(assert (=> b!1320216 (=> (not res!876230) (not e!753121))))

(declare-fun zeroValue!1279 () V!53091)

(declare-fun minValue!1279 () V!53091)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23264 0))(
  ( (tuple2!23265 (_1!11643 (_ BitVec 64)) (_2!11643 V!53091)) )
))
(declare-datatypes ((List!30416 0))(
  ( (Nil!30413) (Cons!30412 (h!31621 tuple2!23264) (t!44136 List!30416)) )
))
(declare-datatypes ((ListLongMap!20921 0))(
  ( (ListLongMap!20922 (toList!10476 List!30416)) )
))
(declare-fun contains!8631 (ListLongMap!20921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5482 (array!88912 array!88914 (_ BitVec 32) (_ BitVec 32) V!53091 V!53091 (_ BitVec 32) Int) ListLongMap!20921)

(assert (=> b!1320216 (= res!876230 (contains!8631 (getCurrentListMap!5482 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320217 () Bool)

(assert (=> b!1320217 (= e!753121 (not true))))

(declare-fun lt!586872 () ListLongMap!20921)

(assert (=> b!1320217 (contains!8631 lt!586872 k0!1164)))

(declare-datatypes ((Unit!43490 0))(
  ( (Unit!43491) )
))
(declare-fun lt!586875 () Unit!43490)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!131 ((_ BitVec 64) (_ BitVec 64) V!53091 ListLongMap!20921) Unit!43490)

(assert (=> b!1320217 (= lt!586875 (lemmaInListMapAfterAddingDiffThenInBefore!131 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586872))))

(declare-fun lt!586873 () ListLongMap!20921)

(assert (=> b!1320217 (contains!8631 lt!586873 k0!1164)))

(declare-fun lt!586874 () Unit!43490)

(assert (=> b!1320217 (= lt!586874 (lemmaInListMapAfterAddingDiffThenInBefore!131 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586873))))

(declare-fun +!4535 (ListLongMap!20921 tuple2!23264) ListLongMap!20921)

(assert (=> b!1320217 (= lt!586873 (+!4535 lt!586872 (tuple2!23265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6170 (array!88912 array!88914 (_ BitVec 32) (_ BitVec 32) V!53091 V!53091 (_ BitVec 32) Int) ListLongMap!20921)

(declare-fun get!21583 (ValueCell!17097 V!53091) V!53091)

(declare-fun dynLambda!3474 (Int (_ BitVec 64)) V!53091)

(assert (=> b!1320217 (= lt!586872 (+!4535 (getCurrentListMapNoExtraKeys!6170 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23265 (select (arr!42930 _keys!1609) from!2000) (get!21583 (select (arr!42931 _values!1337) from!2000) (dynLambda!3474 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320218 () Bool)

(declare-fun res!876233 () Bool)

(assert (=> b!1320218 (=> (not res!876233) (not e!753121))))

(assert (=> b!1320218 (= res!876233 (not (= (select (arr!42930 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320219 () Bool)

(assert (=> b!1320219 (= e!753120 tp_is_empty!35991)))

(declare-fun b!1320220 () Bool)

(declare-fun res!876236 () Bool)

(assert (=> b!1320220 (=> (not res!876236) (not e!753121))))

(assert (=> b!1320220 (= res!876236 (and (= (size!43481 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43480 _keys!1609) (size!43481 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111514 res!876234) b!1320220))

(assert (= (and b!1320220 res!876236) b!1320213))

(assert (= (and b!1320213 res!876235) b!1320214))

(assert (= (and b!1320214 res!876232) b!1320210))

(assert (= (and b!1320210 res!876229) b!1320216))

(assert (= (and b!1320216 res!876230) b!1320218))

(assert (= (and b!1320218 res!876233) b!1320215))

(assert (= (and b!1320215 res!876231) b!1320217))

(assert (= (and b!1320211 condMapEmpty!55634) mapIsEmpty!55634))

(assert (= (and b!1320211 (not condMapEmpty!55634)) mapNonEmpty!55634))

(get-info :version)

(assert (= (and mapNonEmpty!55634 ((_ is ValueCellFull!17097) mapValue!55634)) b!1320212))

(assert (= (and b!1320211 ((_ is ValueCellFull!17097) mapDefault!55634)) b!1320219))

(assert (= start!111514 b!1320211))

(declare-fun b_lambda!23497 () Bool)

(assert (=> (not b_lambda!23497) (not b!1320217)))

(declare-fun t!44134 () Bool)

(declare-fun tb!11523 () Bool)

(assert (=> (and start!111514 (= defaultEntry!1340 defaultEntry!1340) t!44134) tb!11523))

(declare-fun result!24101 () Bool)

(assert (=> tb!11523 (= result!24101 tp_is_empty!35991)))

(assert (=> b!1320217 t!44134))

(declare-fun b_and!48503 () Bool)

(assert (= b_and!48501 (and (=> t!44134 result!24101) b_and!48503)))

(declare-fun m!1207891 () Bool)

(assert (=> mapNonEmpty!55634 m!1207891))

(declare-fun m!1207893 () Bool)

(assert (=> b!1320215 m!1207893))

(assert (=> b!1320215 m!1207893))

(declare-fun m!1207895 () Bool)

(assert (=> b!1320215 m!1207895))

(assert (=> b!1320218 m!1207893))

(declare-fun m!1207897 () Bool)

(assert (=> start!111514 m!1207897))

(declare-fun m!1207899 () Bool)

(assert (=> start!111514 m!1207899))

(declare-fun m!1207901 () Bool)

(assert (=> start!111514 m!1207901))

(declare-fun m!1207903 () Bool)

(assert (=> b!1320216 m!1207903))

(assert (=> b!1320216 m!1207903))

(declare-fun m!1207905 () Bool)

(assert (=> b!1320216 m!1207905))

(declare-fun m!1207907 () Bool)

(assert (=> b!1320213 m!1207907))

(declare-fun m!1207909 () Bool)

(assert (=> b!1320214 m!1207909))

(declare-fun m!1207911 () Bool)

(assert (=> b!1320217 m!1207911))

(declare-fun m!1207913 () Bool)

(assert (=> b!1320217 m!1207913))

(declare-fun m!1207915 () Bool)

(assert (=> b!1320217 m!1207915))

(declare-fun m!1207917 () Bool)

(assert (=> b!1320217 m!1207917))

(declare-fun m!1207919 () Bool)

(assert (=> b!1320217 m!1207919))

(declare-fun m!1207921 () Bool)

(assert (=> b!1320217 m!1207921))

(declare-fun m!1207923 () Bool)

(assert (=> b!1320217 m!1207923))

(declare-fun m!1207925 () Bool)

(assert (=> b!1320217 m!1207925))

(assert (=> b!1320217 m!1207917))

(assert (=> b!1320217 m!1207911))

(declare-fun m!1207927 () Bool)

(assert (=> b!1320217 m!1207927))

(assert (=> b!1320217 m!1207893))

(assert (=> b!1320217 m!1207913))

(declare-fun m!1207929 () Bool)

(assert (=> b!1320217 m!1207929))

(check-sat b_and!48503 (not b_lambda!23497) (not mapNonEmpty!55634) tp_is_empty!35991 (not b_next!30171) (not b!1320215) (not start!111514) (not b!1320214) (not b!1320213) (not b!1320216) (not b!1320217))
(check-sat b_and!48503 (not b_next!30171))
