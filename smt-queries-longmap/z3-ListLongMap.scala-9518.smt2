; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112970 () Bool)

(assert start!112970)

(declare-fun b!1339033 () Bool)

(declare-fun e!762603 () Bool)

(declare-fun tp_is_empty!37021 () Bool)

(assert (=> b!1339033 (= e!762603 tp_is_empty!37021)))

(declare-fun res!888359 () Bool)

(declare-fun e!762605 () Bool)

(assert (=> start!112970 (=> (not res!888359) (not e!762605))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112970 (= res!888359 (validMask!0 mask!1977))))

(assert (=> start!112970 e!762605))

(assert (=> start!112970 true))

(declare-datatypes ((V!54465 0))(
  ( (V!54466 (val!18585 Int)) )
))
(declare-datatypes ((ValueCell!17612 0))(
  ( (ValueCellFull!17612 (v!21232 V!54465)) (EmptyCell!17612) )
))
(declare-datatypes ((array!90849 0))(
  ( (array!90850 (arr!43881 (Array (_ BitVec 32) ValueCell!17612)) (size!44433 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90849)

(declare-fun e!762601 () Bool)

(declare-fun array_inv!33281 (array!90849) Bool)

(assert (=> start!112970 (and (array_inv!33281 _values!1303) e!762601)))

(declare-datatypes ((array!90851 0))(
  ( (array!90852 (arr!43882 (Array (_ BitVec 32) (_ BitVec 64))) (size!44434 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90851)

(declare-fun array_inv!33282 (array!90851) Bool)

(assert (=> start!112970 (array_inv!33282 _keys!1571)))

(declare-fun b!1339034 () Bool)

(assert (=> b!1339034 (= e!762605 false)))

(declare-fun lt!593649 () Bool)

(declare-datatypes ((List!31141 0))(
  ( (Nil!31138) (Cons!31137 (h!32346 (_ BitVec 64)) (t!45465 List!31141)) )
))
(declare-fun arrayNoDuplicates!0 (array!90851 (_ BitVec 32) List!31141) Bool)

(assert (=> b!1339034 (= lt!593649 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31138))))

(declare-fun b!1339035 () Bool)

(declare-fun mapRes!57238 () Bool)

(assert (=> b!1339035 (= e!762601 (and e!762603 mapRes!57238))))

(declare-fun condMapEmpty!57238 () Bool)

(declare-fun mapDefault!57238 () ValueCell!17612)

(assert (=> b!1339035 (= condMapEmpty!57238 (= (arr!43881 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17612)) mapDefault!57238)))))

(declare-fun b!1339036 () Bool)

(declare-fun res!888360 () Bool)

(assert (=> b!1339036 (=> (not res!888360) (not e!762605))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339036 (= res!888360 (and (= (size!44433 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44434 _keys!1571) (size!44433 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57238 () Bool)

(declare-fun tp!108938 () Bool)

(declare-fun e!762602 () Bool)

(assert (=> mapNonEmpty!57238 (= mapRes!57238 (and tp!108938 e!762602))))

(declare-fun mapValue!57238 () ValueCell!17612)

(declare-fun mapRest!57238 () (Array (_ BitVec 32) ValueCell!17612))

(declare-fun mapKey!57238 () (_ BitVec 32))

(assert (=> mapNonEmpty!57238 (= (arr!43881 _values!1303) (store mapRest!57238 mapKey!57238 mapValue!57238))))

(declare-fun b!1339037 () Bool)

(assert (=> b!1339037 (= e!762602 tp_is_empty!37021)))

(declare-fun mapIsEmpty!57238 () Bool)

(assert (=> mapIsEmpty!57238 mapRes!57238))

(declare-fun b!1339038 () Bool)

(declare-fun res!888361 () Bool)

(assert (=> b!1339038 (=> (not res!888361) (not e!762605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90851 (_ BitVec 32)) Bool)

(assert (=> b!1339038 (= res!888361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!112970 res!888359) b!1339036))

(assert (= (and b!1339036 res!888360) b!1339038))

(assert (= (and b!1339038 res!888361) b!1339034))

(assert (= (and b!1339035 condMapEmpty!57238) mapIsEmpty!57238))

(assert (= (and b!1339035 (not condMapEmpty!57238)) mapNonEmpty!57238))

(get-info :version)

(assert (= (and mapNonEmpty!57238 ((_ is ValueCellFull!17612) mapValue!57238)) b!1339037))

(assert (= (and b!1339035 ((_ is ValueCellFull!17612) mapDefault!57238)) b!1339033))

(assert (= start!112970 b!1339035))

(declare-fun m!1226761 () Bool)

(assert (=> start!112970 m!1226761))

(declare-fun m!1226763 () Bool)

(assert (=> start!112970 m!1226763))

(declare-fun m!1226765 () Bool)

(assert (=> start!112970 m!1226765))

(declare-fun m!1226767 () Bool)

(assert (=> b!1339034 m!1226767))

(declare-fun m!1226769 () Bool)

(assert (=> mapNonEmpty!57238 m!1226769))

(declare-fun m!1226771 () Bool)

(assert (=> b!1339038 m!1226771))

(check-sat (not b!1339038) (not start!112970) tp_is_empty!37021 (not b!1339034) (not mapNonEmpty!57238))
(check-sat)
