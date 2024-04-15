; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113174 () Bool)

(assert start!113174)

(declare-fun b_free!31225 () Bool)

(declare-fun b_next!31225 () Bool)

(assert (=> start!113174 (= b_free!31225 (not b_next!31225))))

(declare-fun tp!109480 () Bool)

(declare-fun b_and!50339 () Bool)

(assert (=> start!113174 (= tp!109480 b_and!50339)))

(declare-fun b!1342099 () Bool)

(declare-fun e!764134 () Bool)

(declare-fun tp_is_empty!37225 () Bool)

(assert (=> b!1342099 (= e!764134 tp_is_empty!37225)))

(declare-fun b!1342100 () Bool)

(declare-fun res!890410 () Bool)

(declare-fun e!764135 () Bool)

(assert (=> b!1342100 (=> (not res!890410) (not e!764135))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342100 (= res!890410 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342101 () Bool)

(declare-fun e!764131 () Bool)

(assert (=> b!1342101 (= e!764131 tp_is_empty!37225)))

(declare-fun b!1342102 () Bool)

(declare-fun res!890413 () Bool)

(assert (=> b!1342102 (=> (not res!890413) (not e!764135))))

(declare-datatypes ((V!54737 0))(
  ( (V!54738 (val!18687 Int)) )
))
(declare-fun minValue!1245 () V!54737)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91243 0))(
  ( (array!91244 (arr!44078 (Array (_ BitVec 32) (_ BitVec 64))) (size!44630 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91243)

(declare-fun zeroValue!1245 () V!54737)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17714 0))(
  ( (ValueCellFull!17714 (v!21334 V!54737)) (EmptyCell!17714) )
))
(declare-datatypes ((array!91245 0))(
  ( (array!91246 (arr!44079 (Array (_ BitVec 32) ValueCell!17714)) (size!44631 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91245)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24124 0))(
  ( (tuple2!24125 (_1!12073 (_ BitVec 64)) (_2!12073 V!54737)) )
))
(declare-datatypes ((List!31271 0))(
  ( (Nil!31268) (Cons!31267 (h!32476 tuple2!24124) (t!45699 List!31271)) )
))
(declare-datatypes ((ListLongMap!21781 0))(
  ( (ListLongMap!21782 (toList!10906 List!31271)) )
))
(declare-fun contains!9011 (ListLongMap!21781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5757 (array!91243 array!91245 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21781)

(assert (=> b!1342102 (= res!890413 (contains!9011 (getCurrentListMap!5757 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342103 () Bool)

(declare-fun res!890411 () Bool)

(assert (=> b!1342103 (=> (not res!890411) (not e!764135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342103 (= res!890411 (validKeyInArray!0 (select (arr!44078 _keys!1571) from!1960)))))

(declare-fun b!1342104 () Bool)

(assert (=> b!1342104 (= e!764135 (not true))))

(declare-fun lt!594191 () ListLongMap!21781)

(assert (=> b!1342104 (contains!9011 lt!594191 k0!1142)))

(declare-fun lt!594192 () V!54737)

(declare-datatypes ((Unit!43862 0))(
  ( (Unit!43863) )
))
(declare-fun lt!594189 () Unit!43862)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!349 ((_ BitVec 64) (_ BitVec 64) V!54737 ListLongMap!21781) Unit!43862)

(assert (=> b!1342104 (= lt!594189 (lemmaInListMapAfterAddingDiffThenInBefore!349 k0!1142 (select (arr!44078 _keys!1571) from!1960) lt!594192 lt!594191))))

(declare-fun lt!594188 () ListLongMap!21781)

(assert (=> b!1342104 (contains!9011 lt!594188 k0!1142)))

(declare-fun lt!594190 () Unit!43862)

(assert (=> b!1342104 (= lt!594190 (lemmaInListMapAfterAddingDiffThenInBefore!349 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594188))))

(declare-fun +!4810 (ListLongMap!21781 tuple2!24124) ListLongMap!21781)

(assert (=> b!1342104 (= lt!594188 (+!4810 lt!594191 (tuple2!24125 (select (arr!44078 _keys!1571) from!1960) lt!594192)))))

(declare-fun get!22258 (ValueCell!17714 V!54737) V!54737)

(declare-fun dynLambda!3740 (Int (_ BitVec 64)) V!54737)

(assert (=> b!1342104 (= lt!594192 (get!22258 (select (arr!44079 _values!1303) from!1960) (dynLambda!3740 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6453 (array!91243 array!91245 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21781)

(assert (=> b!1342104 (= lt!594191 (getCurrentListMapNoExtraKeys!6453 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342105 () Bool)

(declare-fun res!890407 () Bool)

(assert (=> b!1342105 (=> (not res!890407) (not e!764135))))

(assert (=> b!1342105 (= res!890407 (not (= (select (arr!44078 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!890409 () Bool)

(assert (=> start!113174 (=> (not res!890409) (not e!764135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113174 (= res!890409 (validMask!0 mask!1977))))

(assert (=> start!113174 e!764135))

(assert (=> start!113174 tp_is_empty!37225))

(assert (=> start!113174 true))

(declare-fun array_inv!33419 (array!91243) Bool)

(assert (=> start!113174 (array_inv!33419 _keys!1571)))

(declare-fun e!764132 () Bool)

(declare-fun array_inv!33420 (array!91245) Bool)

(assert (=> start!113174 (and (array_inv!33420 _values!1303) e!764132)))

(assert (=> start!113174 tp!109480))

(declare-fun b!1342106 () Bool)

(declare-fun res!890406 () Bool)

(assert (=> b!1342106 (=> (not res!890406) (not e!764135))))

(declare-datatypes ((List!31272 0))(
  ( (Nil!31269) (Cons!31268 (h!32477 (_ BitVec 64)) (t!45700 List!31272)) )
))
(declare-fun arrayNoDuplicates!0 (array!91243 (_ BitVec 32) List!31272) Bool)

(assert (=> b!1342106 (= res!890406 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31269))))

(declare-fun mapIsEmpty!57544 () Bool)

(declare-fun mapRes!57544 () Bool)

(assert (=> mapIsEmpty!57544 mapRes!57544))

(declare-fun b!1342107 () Bool)

(assert (=> b!1342107 (= e!764132 (and e!764131 mapRes!57544))))

(declare-fun condMapEmpty!57544 () Bool)

(declare-fun mapDefault!57544 () ValueCell!17714)

(assert (=> b!1342107 (= condMapEmpty!57544 (= (arr!44079 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17714)) mapDefault!57544)))))

(declare-fun b!1342108 () Bool)

(declare-fun res!890405 () Bool)

(assert (=> b!1342108 (=> (not res!890405) (not e!764135))))

(assert (=> b!1342108 (= res!890405 (and (= (size!44631 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44630 _keys!1571) (size!44631 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342109 () Bool)

(declare-fun res!890412 () Bool)

(assert (=> b!1342109 (=> (not res!890412) (not e!764135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91243 (_ BitVec 32)) Bool)

(assert (=> b!1342109 (= res!890412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342110 () Bool)

(declare-fun res!890408 () Bool)

(assert (=> b!1342110 (=> (not res!890408) (not e!764135))))

(assert (=> b!1342110 (= res!890408 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44630 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57544 () Bool)

(declare-fun tp!109481 () Bool)

(assert (=> mapNonEmpty!57544 (= mapRes!57544 (and tp!109481 e!764134))))

(declare-fun mapValue!57544 () ValueCell!17714)

(declare-fun mapRest!57544 () (Array (_ BitVec 32) ValueCell!17714))

(declare-fun mapKey!57544 () (_ BitVec 32))

(assert (=> mapNonEmpty!57544 (= (arr!44079 _values!1303) (store mapRest!57544 mapKey!57544 mapValue!57544))))

(assert (= (and start!113174 res!890409) b!1342108))

(assert (= (and b!1342108 res!890405) b!1342109))

(assert (= (and b!1342109 res!890412) b!1342106))

(assert (= (and b!1342106 res!890406) b!1342110))

(assert (= (and b!1342110 res!890408) b!1342102))

(assert (= (and b!1342102 res!890413) b!1342105))

(assert (= (and b!1342105 res!890407) b!1342103))

(assert (= (and b!1342103 res!890411) b!1342100))

(assert (= (and b!1342100 res!890410) b!1342104))

(assert (= (and b!1342107 condMapEmpty!57544) mapIsEmpty!57544))

(assert (= (and b!1342107 (not condMapEmpty!57544)) mapNonEmpty!57544))

(get-info :version)

(assert (= (and mapNonEmpty!57544 ((_ is ValueCellFull!17714) mapValue!57544)) b!1342099))

(assert (= (and b!1342107 ((_ is ValueCellFull!17714) mapDefault!57544)) b!1342101))

(assert (= start!113174 b!1342107))

(declare-fun b_lambda!24391 () Bool)

(assert (=> (not b_lambda!24391) (not b!1342104)))

(declare-fun t!45698 () Bool)

(declare-fun tb!12231 () Bool)

(assert (=> (and start!113174 (= defaultEntry!1306 defaultEntry!1306) t!45698) tb!12231))

(declare-fun result!25561 () Bool)

(assert (=> tb!12231 (= result!25561 tp_is_empty!37225)))

(assert (=> b!1342104 t!45698))

(declare-fun b_and!50341 () Bool)

(assert (= b_and!50339 (and (=> t!45698 result!25561) b_and!50341)))

(declare-fun m!1229275 () Bool)

(assert (=> b!1342109 m!1229275))

(declare-fun m!1229277 () Bool)

(assert (=> start!113174 m!1229277))

(declare-fun m!1229279 () Bool)

(assert (=> start!113174 m!1229279))

(declare-fun m!1229281 () Bool)

(assert (=> start!113174 m!1229281))

(declare-fun m!1229283 () Bool)

(assert (=> b!1342104 m!1229283))

(declare-fun m!1229285 () Bool)

(assert (=> b!1342104 m!1229285))

(declare-fun m!1229287 () Bool)

(assert (=> b!1342104 m!1229287))

(declare-fun m!1229289 () Bool)

(assert (=> b!1342104 m!1229289))

(declare-fun m!1229291 () Bool)

(assert (=> b!1342104 m!1229291))

(assert (=> b!1342104 m!1229287))

(assert (=> b!1342104 m!1229289))

(declare-fun m!1229293 () Bool)

(assert (=> b!1342104 m!1229293))

(declare-fun m!1229295 () Bool)

(assert (=> b!1342104 m!1229295))

(declare-fun m!1229297 () Bool)

(assert (=> b!1342104 m!1229297))

(assert (=> b!1342104 m!1229295))

(declare-fun m!1229299 () Bool)

(assert (=> b!1342104 m!1229299))

(declare-fun m!1229301 () Bool)

(assert (=> b!1342104 m!1229301))

(declare-fun m!1229303 () Bool)

(assert (=> b!1342102 m!1229303))

(assert (=> b!1342102 m!1229303))

(declare-fun m!1229305 () Bool)

(assert (=> b!1342102 m!1229305))

(declare-fun m!1229307 () Bool)

(assert (=> mapNonEmpty!57544 m!1229307))

(assert (=> b!1342103 m!1229295))

(assert (=> b!1342103 m!1229295))

(declare-fun m!1229309 () Bool)

(assert (=> b!1342103 m!1229309))

(assert (=> b!1342105 m!1229295))

(declare-fun m!1229311 () Bool)

(assert (=> b!1342106 m!1229311))

(check-sat (not b!1342104) (not b_next!31225) b_and!50341 (not start!113174) (not b!1342106) (not b!1342102) tp_is_empty!37225 (not b_lambda!24391) (not mapNonEmpty!57544) (not b!1342109) (not b!1342103))
(check-sat b_and!50341 (not b_next!31225))
