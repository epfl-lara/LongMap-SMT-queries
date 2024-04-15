; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112110 () Bool)

(assert start!112110)

(declare-fun b!1327777 () Bool)

(declare-fun res!881047 () Bool)

(declare-fun e!756956 () Bool)

(assert (=> b!1327777 (=> (not res!881047) (not e!756956))))

(declare-datatypes ((V!53657 0))(
  ( (V!53658 (val!18282 Int)) )
))
(declare-datatypes ((ValueCell!17309 0))(
  ( (ValueCellFull!17309 (v!20918 V!53657)) (EmptyCell!17309) )
))
(declare-datatypes ((array!89667 0))(
  ( (array!89668 (arr!43300 (Array (_ BitVec 32) ValueCell!17309)) (size!43852 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89667)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89669 0))(
  ( (array!89670 (arr!43301 (Array (_ BitVec 32) (_ BitVec 64))) (size!43853 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89669)

(assert (=> b!1327777 (= res!881047 (and (= (size!43852 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43853 _keys!1590) (size!43852 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327778 () Bool)

(declare-fun e!756955 () Bool)

(declare-fun tp_is_empty!36415 () Bool)

(assert (=> b!1327778 (= e!756955 tp_is_empty!36415)))

(declare-fun b!1327779 () Bool)

(assert (=> b!1327779 (= e!756956 false)))

(declare-fun lt!590578 () Bool)

(declare-datatypes ((List!30754 0))(
  ( (Nil!30751) (Cons!30750 (h!31959 (_ BitVec 64)) (t!44752 List!30754)) )
))
(declare-fun arrayNoDuplicates!0 (array!89669 (_ BitVec 32) List!30754) Bool)

(assert (=> b!1327779 (= lt!590578 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30751))))

(declare-fun mapNonEmpty!56296 () Bool)

(declare-fun mapRes!56296 () Bool)

(declare-fun tp!107204 () Bool)

(declare-fun e!756954 () Bool)

(assert (=> mapNonEmpty!56296 (= mapRes!56296 (and tp!107204 e!756954))))

(declare-fun mapKey!56296 () (_ BitVec 32))

(declare-fun mapRest!56296 () (Array (_ BitVec 32) ValueCell!17309))

(declare-fun mapValue!56296 () ValueCell!17309)

(assert (=> mapNonEmpty!56296 (= (arr!43300 _values!1320) (store mapRest!56296 mapKey!56296 mapValue!56296))))

(declare-fun b!1327780 () Bool)

(declare-fun e!756957 () Bool)

(assert (=> b!1327780 (= e!756957 (and e!756955 mapRes!56296))))

(declare-fun condMapEmpty!56296 () Bool)

(declare-fun mapDefault!56296 () ValueCell!17309)

(assert (=> b!1327780 (= condMapEmpty!56296 (= (arr!43300 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17309)) mapDefault!56296)))))

(declare-fun mapIsEmpty!56296 () Bool)

(assert (=> mapIsEmpty!56296 mapRes!56296))

(declare-fun res!881045 () Bool)

(assert (=> start!112110 (=> (not res!881045) (not e!756956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112110 (= res!881045 (validMask!0 mask!1998))))

(assert (=> start!112110 e!756956))

(assert (=> start!112110 true))

(declare-fun array_inv!32847 (array!89667) Bool)

(assert (=> start!112110 (and (array_inv!32847 _values!1320) e!756957)))

(declare-fun array_inv!32848 (array!89669) Bool)

(assert (=> start!112110 (array_inv!32848 _keys!1590)))

(declare-fun b!1327781 () Bool)

(assert (=> b!1327781 (= e!756954 tp_is_empty!36415)))

(declare-fun b!1327782 () Bool)

(declare-fun res!881046 () Bool)

(assert (=> b!1327782 (=> (not res!881046) (not e!756956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89669 (_ BitVec 32)) Bool)

(assert (=> b!1327782 (= res!881046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112110 res!881045) b!1327777))

(assert (= (and b!1327777 res!881047) b!1327782))

(assert (= (and b!1327782 res!881046) b!1327779))

(assert (= (and b!1327780 condMapEmpty!56296) mapIsEmpty!56296))

(assert (= (and b!1327780 (not condMapEmpty!56296)) mapNonEmpty!56296))

(get-info :version)

(assert (= (and mapNonEmpty!56296 ((_ is ValueCellFull!17309) mapValue!56296)) b!1327781))

(assert (= (and b!1327780 ((_ is ValueCellFull!17309) mapDefault!56296)) b!1327778))

(assert (= start!112110 b!1327780))

(declare-fun m!1216509 () Bool)

(assert (=> b!1327779 m!1216509))

(declare-fun m!1216511 () Bool)

(assert (=> mapNonEmpty!56296 m!1216511))

(declare-fun m!1216513 () Bool)

(assert (=> start!112110 m!1216513))

(declare-fun m!1216515 () Bool)

(assert (=> start!112110 m!1216515))

(declare-fun m!1216517 () Bool)

(assert (=> start!112110 m!1216517))

(declare-fun m!1216519 () Bool)

(assert (=> b!1327782 m!1216519))

(check-sat (not start!112110) (not b!1327779) tp_is_empty!36415 (not mapNonEmpty!56296) (not b!1327782))
(check-sat)
