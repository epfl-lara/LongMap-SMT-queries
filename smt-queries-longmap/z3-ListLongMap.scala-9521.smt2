; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112988 () Bool)

(assert start!112988)

(declare-fun b!1339195 () Bool)

(declare-fun e!762736 () Bool)

(declare-fun tp_is_empty!37039 () Bool)

(assert (=> b!1339195 (= e!762736 tp_is_empty!37039)))

(declare-fun b!1339196 () Bool)

(declare-fun e!762738 () Bool)

(assert (=> b!1339196 (= e!762738 false)))

(declare-fun lt!593676 () Bool)

(declare-datatypes ((array!90883 0))(
  ( (array!90884 (arr!43898 (Array (_ BitVec 32) (_ BitVec 64))) (size!44450 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90883)

(declare-datatypes ((List!31147 0))(
  ( (Nil!31144) (Cons!31143 (h!32352 (_ BitVec 64)) (t!45471 List!31147)) )
))
(declare-fun arrayNoDuplicates!0 (array!90883 (_ BitVec 32) List!31147) Bool)

(assert (=> b!1339196 (= lt!593676 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31144))))

(declare-fun mapIsEmpty!57265 () Bool)

(declare-fun mapRes!57265 () Bool)

(assert (=> mapIsEmpty!57265 mapRes!57265))

(declare-fun res!888441 () Bool)

(assert (=> start!112988 (=> (not res!888441) (not e!762738))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112988 (= res!888441 (validMask!0 mask!1977))))

(assert (=> start!112988 e!762738))

(assert (=> start!112988 true))

(declare-datatypes ((V!54489 0))(
  ( (V!54490 (val!18594 Int)) )
))
(declare-datatypes ((ValueCell!17621 0))(
  ( (ValueCellFull!17621 (v!21241 V!54489)) (EmptyCell!17621) )
))
(declare-datatypes ((array!90885 0))(
  ( (array!90886 (arr!43899 (Array (_ BitVec 32) ValueCell!17621)) (size!44451 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90885)

(declare-fun e!762740 () Bool)

(declare-fun array_inv!33293 (array!90885) Bool)

(assert (=> start!112988 (and (array_inv!33293 _values!1303) e!762740)))

(declare-fun array_inv!33294 (array!90883) Bool)

(assert (=> start!112988 (array_inv!33294 _keys!1571)))

(declare-fun b!1339197 () Bool)

(assert (=> b!1339197 (= e!762740 (and e!762736 mapRes!57265))))

(declare-fun condMapEmpty!57265 () Bool)

(declare-fun mapDefault!57265 () ValueCell!17621)

(assert (=> b!1339197 (= condMapEmpty!57265 (= (arr!43899 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17621)) mapDefault!57265)))))

(declare-fun b!1339198 () Bool)

(declare-fun res!888442 () Bool)

(assert (=> b!1339198 (=> (not res!888442) (not e!762738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90883 (_ BitVec 32)) Bool)

(assert (=> b!1339198 (= res!888442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339199 () Bool)

(declare-fun e!762737 () Bool)

(assert (=> b!1339199 (= e!762737 tp_is_empty!37039)))

(declare-fun b!1339200 () Bool)

(declare-fun res!888440 () Bool)

(assert (=> b!1339200 (=> (not res!888440) (not e!762738))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339200 (= res!888440 (and (= (size!44451 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44450 _keys!1571) (size!44451 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57265 () Bool)

(declare-fun tp!108965 () Bool)

(assert (=> mapNonEmpty!57265 (= mapRes!57265 (and tp!108965 e!762737))))

(declare-fun mapKey!57265 () (_ BitVec 32))

(declare-fun mapValue!57265 () ValueCell!17621)

(declare-fun mapRest!57265 () (Array (_ BitVec 32) ValueCell!17621))

(assert (=> mapNonEmpty!57265 (= (arr!43899 _values!1303) (store mapRest!57265 mapKey!57265 mapValue!57265))))

(assert (= (and start!112988 res!888441) b!1339200))

(assert (= (and b!1339200 res!888440) b!1339198))

(assert (= (and b!1339198 res!888442) b!1339196))

(assert (= (and b!1339197 condMapEmpty!57265) mapIsEmpty!57265))

(assert (= (and b!1339197 (not condMapEmpty!57265)) mapNonEmpty!57265))

(get-info :version)

(assert (= (and mapNonEmpty!57265 ((_ is ValueCellFull!17621) mapValue!57265)) b!1339199))

(assert (= (and b!1339197 ((_ is ValueCellFull!17621) mapDefault!57265)) b!1339195))

(assert (= start!112988 b!1339197))

(declare-fun m!1226869 () Bool)

(assert (=> b!1339196 m!1226869))

(declare-fun m!1226871 () Bool)

(assert (=> start!112988 m!1226871))

(declare-fun m!1226873 () Bool)

(assert (=> start!112988 m!1226873))

(declare-fun m!1226875 () Bool)

(assert (=> start!112988 m!1226875))

(declare-fun m!1226877 () Bool)

(assert (=> b!1339198 m!1226877))

(declare-fun m!1226879 () Bool)

(assert (=> mapNonEmpty!57265 m!1226879))

(check-sat (not mapNonEmpty!57265) (not b!1339198) (not start!112988) (not b!1339196) tp_is_empty!37039)
(check-sat)
