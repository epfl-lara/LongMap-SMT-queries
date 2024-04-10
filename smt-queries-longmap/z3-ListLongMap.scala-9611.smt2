; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113672 () Bool)

(assert start!113672)

(declare-fun b_free!31581 () Bool)

(declare-fun b_next!31581 () Bool)

(assert (=> start!113672 (= b_free!31581 (not b_next!31581))))

(declare-fun tp!110558 () Bool)

(declare-fun b_and!50961 () Bool)

(assert (=> start!113672 (= tp!110558 b_and!50961)))

(declare-fun b!1349177 () Bool)

(declare-fun res!895094 () Bool)

(declare-fun e!767507 () Bool)

(assert (=> b!1349177 (=> (not res!895094) (not e!767507))))

(declare-datatypes ((array!91992 0))(
  ( (array!91993 (arr!44449 (Array (_ BitVec 32) (_ BitVec 64))) (size!44999 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91992)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91992 (_ BitVec 32)) Bool)

(assert (=> b!1349177 (= res!895094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349178 () Bool)

(declare-fun res!895088 () Bool)

(assert (=> b!1349178 (=> (not res!895088) (not e!767507))))

(declare-datatypes ((V!55211 0))(
  ( (V!55212 (val!18865 Int)) )
))
(declare-fun minValue!1245 () V!55211)

(declare-fun zeroValue!1245 () V!55211)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17892 0))(
  ( (ValueCellFull!17892 (v!21520 V!55211)) (EmptyCell!17892) )
))
(declare-datatypes ((array!91994 0))(
  ( (array!91995 (arr!44450 (Array (_ BitVec 32) ValueCell!17892)) (size!45000 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91994)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24330 0))(
  ( (tuple2!24331 (_1!12176 (_ BitVec 64)) (_2!12176 V!55211)) )
))
(declare-datatypes ((List!31481 0))(
  ( (Nil!31478) (Cons!31477 (h!32686 tuple2!24330) (t!46129 List!31481)) )
))
(declare-datatypes ((ListLongMap!21987 0))(
  ( (ListLongMap!21988 (toList!11009 List!31481)) )
))
(declare-fun contains!9191 (ListLongMap!21987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5958 (array!91992 array!91994 (_ BitVec 32) (_ BitVec 32) V!55211 V!55211 (_ BitVec 32) Int) ListLongMap!21987)

(assert (=> b!1349178 (= res!895088 (contains!9191 (getCurrentListMap!5958 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349179 () Bool)

(declare-fun res!895087 () Bool)

(assert (=> b!1349179 (=> (not res!895087) (not e!767507))))

(assert (=> b!1349179 (= res!895087 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44999 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!58089 () Bool)

(declare-fun mapRes!58089 () Bool)

(assert (=> mapIsEmpty!58089 mapRes!58089))

(declare-fun b!1349180 () Bool)

(declare-fun res!895090 () Bool)

(assert (=> b!1349180 (=> (not res!895090) (not e!767507))))

(assert (=> b!1349180 (= res!895090 (not (= (select (arr!44449 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349181 () Bool)

(declare-fun res!895091 () Bool)

(assert (=> b!1349181 (=> (not res!895091) (not e!767507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349181 (= res!895091 (validKeyInArray!0 (select (arr!44449 _keys!1571) from!1960)))))

(declare-fun b!1349182 () Bool)

(assert (=> b!1349182 (= e!767507 (= k0!1142 (select (arr!44449 _keys!1571) from!1960)))))

(declare-fun res!895093 () Bool)

(assert (=> start!113672 (=> (not res!895093) (not e!767507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113672 (= res!895093 (validMask!0 mask!1977))))

(assert (=> start!113672 e!767507))

(declare-fun tp_is_empty!37581 () Bool)

(assert (=> start!113672 tp_is_empty!37581))

(assert (=> start!113672 true))

(declare-fun array_inv!33483 (array!91992) Bool)

(assert (=> start!113672 (array_inv!33483 _keys!1571)))

(declare-fun e!767510 () Bool)

(declare-fun array_inv!33484 (array!91994) Bool)

(assert (=> start!113672 (and (array_inv!33484 _values!1303) e!767510)))

(assert (=> start!113672 tp!110558))

(declare-fun b!1349183 () Bool)

(declare-fun e!767508 () Bool)

(assert (=> b!1349183 (= e!767508 tp_is_empty!37581)))

(declare-fun b!1349184 () Bool)

(declare-fun res!895096 () Bool)

(assert (=> b!1349184 (=> (not res!895096) (not e!767507))))

(declare-datatypes ((List!31482 0))(
  ( (Nil!31479) (Cons!31478 (h!32687 (_ BitVec 64)) (t!46130 List!31482)) )
))
(declare-fun arrayNoDuplicates!0 (array!91992 (_ BitVec 32) List!31482) Bool)

(assert (=> b!1349184 (= res!895096 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31479))))

(declare-fun b!1349185 () Bool)

(declare-fun res!895092 () Bool)

(assert (=> b!1349185 (=> (not res!895092) (not e!767507))))

(assert (=> b!1349185 (= res!895092 (and (= (size!45000 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44999 _keys!1571) (size!45000 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58089 () Bool)

(declare-fun tp!110559 () Bool)

(assert (=> mapNonEmpty!58089 (= mapRes!58089 (and tp!110559 e!767508))))

(declare-fun mapValue!58089 () ValueCell!17892)

(declare-fun mapRest!58089 () (Array (_ BitVec 32) ValueCell!17892))

(declare-fun mapKey!58089 () (_ BitVec 32))

(assert (=> mapNonEmpty!58089 (= (arr!44450 _values!1303) (store mapRest!58089 mapKey!58089 mapValue!58089))))

(declare-fun b!1349186 () Bool)

(declare-fun e!767509 () Bool)

(assert (=> b!1349186 (= e!767509 tp_is_empty!37581)))

(declare-fun b!1349187 () Bool)

(declare-fun res!895089 () Bool)

(assert (=> b!1349187 (=> (not res!895089) (not e!767507))))

(declare-fun +!4852 (ListLongMap!21987 tuple2!24330) ListLongMap!21987)

(declare-fun getCurrentListMapNoExtraKeys!6498 (array!91992 array!91994 (_ BitVec 32) (_ BitVec 32) V!55211 V!55211 (_ BitVec 32) Int) ListLongMap!21987)

(declare-fun get!22459 (ValueCell!17892 V!55211) V!55211)

(declare-fun dynLambda!3791 (Int (_ BitVec 64)) V!55211)

(assert (=> b!1349187 (= res!895089 (contains!9191 (+!4852 (getCurrentListMapNoExtraKeys!6498 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24331 (select (arr!44449 _keys!1571) from!1960) (get!22459 (select (arr!44450 _values!1303) from!1960) (dynLambda!3791 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1349188 () Bool)

(assert (=> b!1349188 (= e!767510 (and e!767509 mapRes!58089))))

(declare-fun condMapEmpty!58089 () Bool)

(declare-fun mapDefault!58089 () ValueCell!17892)

(assert (=> b!1349188 (= condMapEmpty!58089 (= (arr!44450 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17892)) mapDefault!58089)))))

(declare-fun b!1349189 () Bool)

(declare-fun res!895095 () Bool)

(assert (=> b!1349189 (=> (not res!895095) (not e!767507))))

(assert (=> b!1349189 (= res!895095 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113672 res!895093) b!1349185))

(assert (= (and b!1349185 res!895092) b!1349177))

(assert (= (and b!1349177 res!895094) b!1349184))

(assert (= (and b!1349184 res!895096) b!1349179))

(assert (= (and b!1349179 res!895087) b!1349178))

(assert (= (and b!1349178 res!895088) b!1349180))

(assert (= (and b!1349180 res!895090) b!1349181))

(assert (= (and b!1349181 res!895091) b!1349189))

(assert (= (and b!1349189 res!895095) b!1349187))

(assert (= (and b!1349187 res!895089) b!1349182))

(assert (= (and b!1349188 condMapEmpty!58089) mapIsEmpty!58089))

(assert (= (and b!1349188 (not condMapEmpty!58089)) mapNonEmpty!58089))

(get-info :version)

(assert (= (and mapNonEmpty!58089 ((_ is ValueCellFull!17892) mapValue!58089)) b!1349183))

(assert (= (and b!1349188 ((_ is ValueCellFull!17892) mapDefault!58089)) b!1349186))

(assert (= start!113672 b!1349188))

(declare-fun b_lambda!24691 () Bool)

(assert (=> (not b_lambda!24691) (not b!1349187)))

(declare-fun t!46128 () Bool)

(declare-fun tb!12451 () Bool)

(assert (=> (and start!113672 (= defaultEntry!1306 defaultEntry!1306) t!46128) tb!12451))

(declare-fun result!25999 () Bool)

(assert (=> tb!12451 (= result!25999 tp_is_empty!37581)))

(assert (=> b!1349187 t!46128))

(declare-fun b_and!50963 () Bool)

(assert (= b_and!50961 (and (=> t!46128 result!25999) b_and!50963)))

(declare-fun m!1236297 () Bool)

(assert (=> b!1349182 m!1236297))

(declare-fun m!1236299 () Bool)

(assert (=> mapNonEmpty!58089 m!1236299))

(declare-fun m!1236301 () Bool)

(assert (=> b!1349178 m!1236301))

(assert (=> b!1349178 m!1236301))

(declare-fun m!1236303 () Bool)

(assert (=> b!1349178 m!1236303))

(declare-fun m!1236305 () Bool)

(assert (=> b!1349177 m!1236305))

(declare-fun m!1236307 () Bool)

(assert (=> b!1349184 m!1236307))

(declare-fun m!1236309 () Bool)

(assert (=> b!1349187 m!1236309))

(declare-fun m!1236311 () Bool)

(assert (=> b!1349187 m!1236311))

(declare-fun m!1236313 () Bool)

(assert (=> b!1349187 m!1236313))

(declare-fun m!1236315 () Bool)

(assert (=> b!1349187 m!1236315))

(assert (=> b!1349187 m!1236309))

(declare-fun m!1236317 () Bool)

(assert (=> b!1349187 m!1236317))

(assert (=> b!1349187 m!1236311))

(assert (=> b!1349187 m!1236313))

(assert (=> b!1349187 m!1236317))

(declare-fun m!1236319 () Bool)

(assert (=> b!1349187 m!1236319))

(assert (=> b!1349187 m!1236297))

(declare-fun m!1236321 () Bool)

(assert (=> start!113672 m!1236321))

(declare-fun m!1236323 () Bool)

(assert (=> start!113672 m!1236323))

(declare-fun m!1236325 () Bool)

(assert (=> start!113672 m!1236325))

(assert (=> b!1349181 m!1236297))

(assert (=> b!1349181 m!1236297))

(declare-fun m!1236327 () Bool)

(assert (=> b!1349181 m!1236327))

(assert (=> b!1349180 m!1236297))

(check-sat (not b!1349187) (not mapNonEmpty!58089) (not b!1349177) (not b_next!31581) tp_is_empty!37581 (not b!1349184) b_and!50963 (not b!1349181) (not b_lambda!24691) (not b!1349178) (not start!113672))
(check-sat b_and!50963 (not b_next!31581))
