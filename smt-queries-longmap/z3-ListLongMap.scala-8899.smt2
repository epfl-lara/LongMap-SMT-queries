; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108036 () Bool)

(assert start!108036)

(declare-fun b!1276019 () Bool)

(declare-fun e!728572 () Bool)

(declare-fun tp_is_empty!33309 () Bool)

(assert (=> b!1276019 (= e!728572 tp_is_empty!33309)))

(declare-fun mapNonEmpty!51491 () Bool)

(declare-fun mapRes!51491 () Bool)

(declare-fun tp!98249 () Bool)

(declare-fun e!728573 () Bool)

(assert (=> mapNonEmpty!51491 (= mapRes!51491 (and tp!98249 e!728573))))

(declare-datatypes ((V!49515 0))(
  ( (V!49516 (val!16729 Int)) )
))
(declare-datatypes ((ValueCell!15756 0))(
  ( (ValueCellFull!15756 (v!19326 V!49515)) (EmptyCell!15756) )
))
(declare-fun mapRest!51491 () (Array (_ BitVec 32) ValueCell!15756))

(declare-fun mapKey!51491 () (_ BitVec 32))

(declare-datatypes ((array!83712 0))(
  ( (array!83713 (arr!40368 (Array (_ BitVec 32) ValueCell!15756)) (size!40918 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83712)

(declare-fun mapValue!51491 () ValueCell!15756)

(assert (=> mapNonEmpty!51491 (= (arr!40368 _values!1187) (store mapRest!51491 mapKey!51491 mapValue!51491))))

(declare-fun b!1276020 () Bool)

(declare-fun res!848054 () Bool)

(declare-fun e!728574 () Bool)

(assert (=> b!1276020 (=> (not res!848054) (not e!728574))))

(declare-datatypes ((array!83714 0))(
  ( (array!83715 (arr!40369 (Array (_ BitVec 32) (_ BitVec 64))) (size!40919 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83714)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83714 (_ BitVec 32)) Bool)

(assert (=> b!1276020 (= res!848054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276021 () Bool)

(assert (=> b!1276021 (= e!728574 false)))

(declare-fun lt!575431 () Bool)

(declare-datatypes ((List!28632 0))(
  ( (Nil!28629) (Cons!28628 (h!29837 (_ BitVec 64)) (t!42168 List!28632)) )
))
(declare-fun arrayNoDuplicates!0 (array!83714 (_ BitVec 32) List!28632) Bool)

(assert (=> b!1276021 (= lt!575431 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28629))))

(declare-fun mapIsEmpty!51491 () Bool)

(assert (=> mapIsEmpty!51491 mapRes!51491))

(declare-fun b!1276018 () Bool)

(declare-fun res!848055 () Bool)

(assert (=> b!1276018 (=> (not res!848055) (not e!728574))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276018 (= res!848055 (and (= (size!40918 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40919 _keys!1427) (size!40918 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848053 () Bool)

(assert (=> start!108036 (=> (not res!848053) (not e!728574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108036 (= res!848053 (validMask!0 mask!1805))))

(assert (=> start!108036 e!728574))

(assert (=> start!108036 true))

(declare-fun e!728570 () Bool)

(declare-fun array_inv!30681 (array!83712) Bool)

(assert (=> start!108036 (and (array_inv!30681 _values!1187) e!728570)))

(declare-fun array_inv!30682 (array!83714) Bool)

(assert (=> start!108036 (array_inv!30682 _keys!1427)))

(declare-fun b!1276022 () Bool)

(assert (=> b!1276022 (= e!728573 tp_is_empty!33309)))

(declare-fun b!1276023 () Bool)

(assert (=> b!1276023 (= e!728570 (and e!728572 mapRes!51491))))

(declare-fun condMapEmpty!51491 () Bool)

(declare-fun mapDefault!51491 () ValueCell!15756)

(assert (=> b!1276023 (= condMapEmpty!51491 (= (arr!40368 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15756)) mapDefault!51491)))))

(assert (= (and start!108036 res!848053) b!1276018))

(assert (= (and b!1276018 res!848055) b!1276020))

(assert (= (and b!1276020 res!848054) b!1276021))

(assert (= (and b!1276023 condMapEmpty!51491) mapIsEmpty!51491))

(assert (= (and b!1276023 (not condMapEmpty!51491)) mapNonEmpty!51491))

(get-info :version)

(assert (= (and mapNonEmpty!51491 ((_ is ValueCellFull!15756) mapValue!51491)) b!1276022))

(assert (= (and b!1276023 ((_ is ValueCellFull!15756) mapDefault!51491)) b!1276019))

(assert (= start!108036 b!1276023))

(declare-fun m!1172063 () Bool)

(assert (=> mapNonEmpty!51491 m!1172063))

(declare-fun m!1172065 () Bool)

(assert (=> b!1276020 m!1172065))

(declare-fun m!1172067 () Bool)

(assert (=> b!1276021 m!1172067))

(declare-fun m!1172069 () Bool)

(assert (=> start!108036 m!1172069))

(declare-fun m!1172071 () Bool)

(assert (=> start!108036 m!1172071))

(declare-fun m!1172073 () Bool)

(assert (=> start!108036 m!1172073))

(check-sat (not mapNonEmpty!51491) (not b!1276020) (not b!1276021) tp_is_empty!33309 (not start!108036))
(check-sat)
