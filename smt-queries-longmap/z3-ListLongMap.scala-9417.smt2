; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112334 () Bool)

(assert start!112334)

(declare-fun mapNonEmpty!56296 () Bool)

(declare-fun mapRes!56296 () Bool)

(declare-fun tp!107203 () Bool)

(declare-fun e!757830 () Bool)

(assert (=> mapNonEmpty!56296 (= mapRes!56296 (and tp!107203 e!757830))))

(declare-datatypes ((V!53657 0))(
  ( (V!53658 (val!18282 Int)) )
))
(declare-datatypes ((ValueCell!17309 0))(
  ( (ValueCellFull!17309 (v!20914 V!53657)) (EmptyCell!17309) )
))
(declare-datatypes ((array!89837 0))(
  ( (array!89838 (arr!43380 (Array (_ BitVec 32) ValueCell!17309)) (size!43931 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89837)

(declare-fun mapValue!56296 () ValueCell!17309)

(declare-fun mapRest!56296 () (Array (_ BitVec 32) ValueCell!17309))

(declare-fun mapKey!56296 () (_ BitVec 32))

(assert (=> mapNonEmpty!56296 (= (arr!43380 _values!1320) (store mapRest!56296 mapKey!56296 mapValue!56296))))

(declare-fun b!1329146 () Bool)

(declare-fun tp_is_empty!36415 () Bool)

(assert (=> b!1329146 (= e!757830 tp_is_empty!36415)))

(declare-fun b!1329147 () Bool)

(declare-fun res!881594 () Bool)

(declare-fun e!757833 () Bool)

(assert (=> b!1329147 (=> (not res!881594) (not e!757833))))

(declare-datatypes ((array!89839 0))(
  ( (array!89840 (arr!43381 (Array (_ BitVec 32) (_ BitVec 64))) (size!43932 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89839)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89839 (_ BitVec 32)) Bool)

(assert (=> b!1329147 (= res!881594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881592 () Bool)

(assert (=> start!112334 (=> (not res!881592) (not e!757833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112334 (= res!881592 (validMask!0 mask!1998))))

(assert (=> start!112334 e!757833))

(assert (=> start!112334 true))

(declare-fun e!757831 () Bool)

(declare-fun array_inv!33005 (array!89837) Bool)

(assert (=> start!112334 (and (array_inv!33005 _values!1320) e!757831)))

(declare-fun array_inv!33006 (array!89839) Bool)

(assert (=> start!112334 (array_inv!33006 _keys!1590)))

(declare-fun b!1329148 () Bool)

(declare-fun res!881593 () Bool)

(assert (=> b!1329148 (=> (not res!881593) (not e!757833))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329148 (= res!881593 (and (= (size!43931 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43932 _keys!1590) (size!43931 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329149 () Bool)

(declare-fun e!757834 () Bool)

(assert (=> b!1329149 (= e!757831 (and e!757834 mapRes!56296))))

(declare-fun condMapEmpty!56296 () Bool)

(declare-fun mapDefault!56296 () ValueCell!17309)

(assert (=> b!1329149 (= condMapEmpty!56296 (= (arr!43380 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17309)) mapDefault!56296)))))

(declare-fun mapIsEmpty!56296 () Bool)

(assert (=> mapIsEmpty!56296 mapRes!56296))

(declare-fun b!1329150 () Bool)

(assert (=> b!1329150 (= e!757833 false)))

(declare-fun lt!591240 () Bool)

(declare-datatypes ((List!30744 0))(
  ( (Nil!30741) (Cons!30740 (h!31958 (_ BitVec 64)) (t!44742 List!30744)) )
))
(declare-fun arrayNoDuplicates!0 (array!89839 (_ BitVec 32) List!30744) Bool)

(assert (=> b!1329150 (= lt!591240 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30741))))

(declare-fun b!1329151 () Bool)

(assert (=> b!1329151 (= e!757834 tp_is_empty!36415)))

(assert (= (and start!112334 res!881592) b!1329148))

(assert (= (and b!1329148 res!881593) b!1329147))

(assert (= (and b!1329147 res!881594) b!1329150))

(assert (= (and b!1329149 condMapEmpty!56296) mapIsEmpty!56296))

(assert (= (and b!1329149 (not condMapEmpty!56296)) mapNonEmpty!56296))

(get-info :version)

(assert (= (and mapNonEmpty!56296 ((_ is ValueCellFull!17309) mapValue!56296)) b!1329146))

(assert (= (and b!1329149 ((_ is ValueCellFull!17309) mapDefault!56296)) b!1329151))

(assert (= start!112334 b!1329149))

(declare-fun m!1218623 () Bool)

(assert (=> mapNonEmpty!56296 m!1218623))

(declare-fun m!1218625 () Bool)

(assert (=> b!1329147 m!1218625))

(declare-fun m!1218627 () Bool)

(assert (=> start!112334 m!1218627))

(declare-fun m!1218629 () Bool)

(assert (=> start!112334 m!1218629))

(declare-fun m!1218631 () Bool)

(assert (=> start!112334 m!1218631))

(declare-fun m!1218633 () Bool)

(assert (=> b!1329150 m!1218633))

(check-sat tp_is_empty!36415 (not start!112334) (not mapNonEmpty!56296) (not b!1329147) (not b!1329150))
(check-sat)
