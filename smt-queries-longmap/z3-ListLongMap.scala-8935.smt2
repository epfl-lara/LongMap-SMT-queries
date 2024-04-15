; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108336 () Bool)

(assert start!108336)

(declare-fun b!1278631 () Bool)

(declare-fun e!730460 () Bool)

(declare-fun tp_is_empty!33523 () Bool)

(assert (=> b!1278631 (= e!730460 tp_is_empty!33523)))

(declare-fun b!1278632 () Bool)

(declare-fun e!730458 () Bool)

(declare-fun e!730457 () Bool)

(declare-fun mapRes!51836 () Bool)

(assert (=> b!1278632 (= e!730458 (and e!730457 mapRes!51836))))

(declare-fun condMapEmpty!51836 () Bool)

(declare-datatypes ((V!49801 0))(
  ( (V!49802 (val!16836 Int)) )
))
(declare-datatypes ((ValueCell!15863 0))(
  ( (ValueCellFull!15863 (v!19435 V!49801)) (EmptyCell!15863) )
))
(declare-datatypes ((array!84029 0))(
  ( (array!84030 (arr!40519 (Array (_ BitVec 32) ValueCell!15863)) (size!41071 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84029)

(declare-fun mapDefault!51836 () ValueCell!15863)

(assert (=> b!1278632 (= condMapEmpty!51836 (= (arr!40519 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15863)) mapDefault!51836)))))

(declare-fun res!849452 () Bool)

(declare-fun e!730459 () Bool)

(assert (=> start!108336 (=> (not res!849452) (not e!730459))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108336 (= res!849452 (validMask!0 mask!2175))))

(assert (=> start!108336 e!730459))

(assert (=> start!108336 true))

(declare-fun array_inv!30933 (array!84029) Bool)

(assert (=> start!108336 (and (array_inv!30933 _values!1445) e!730458)))

(declare-datatypes ((array!84031 0))(
  ( (array!84032 (arr!40520 (Array (_ BitVec 32) (_ BitVec 64))) (size!41072 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84031)

(declare-fun array_inv!30934 (array!84031) Bool)

(assert (=> start!108336 (array_inv!30934 _keys!1741)))

(declare-fun b!1278633 () Bool)

(declare-fun res!849450 () Bool)

(assert (=> b!1278633 (=> (not res!849450) (not e!730459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84031 (_ BitVec 32)) Bool)

(assert (=> b!1278633 (= res!849450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51836 () Bool)

(declare-fun tp!98811 () Bool)

(assert (=> mapNonEmpty!51836 (= mapRes!51836 (and tp!98811 e!730460))))

(declare-fun mapRest!51836 () (Array (_ BitVec 32) ValueCell!15863))

(declare-fun mapValue!51836 () ValueCell!15863)

(declare-fun mapKey!51836 () (_ BitVec 32))

(assert (=> mapNonEmpty!51836 (= (arr!40519 _values!1445) (store mapRest!51836 mapKey!51836 mapValue!51836))))

(declare-fun b!1278634 () Bool)

(assert (=> b!1278634 (= e!730457 tp_is_empty!33523)))

(declare-fun mapIsEmpty!51836 () Bool)

(assert (=> mapIsEmpty!51836 mapRes!51836))

(declare-fun b!1278635 () Bool)

(assert (=> b!1278635 (= e!730459 false)))

(declare-fun lt!575737 () Bool)

(declare-datatypes ((List!28821 0))(
  ( (Nil!28818) (Cons!28817 (h!30026 (_ BitVec 64)) (t!42353 List!28821)) )
))
(declare-fun arrayNoDuplicates!0 (array!84031 (_ BitVec 32) List!28821) Bool)

(assert (=> b!1278635 (= lt!575737 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28818))))

(declare-fun b!1278636 () Bool)

(declare-fun res!849451 () Bool)

(assert (=> b!1278636 (=> (not res!849451) (not e!730459))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278636 (= res!849451 (and (= (size!41071 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41072 _keys!1741) (size!41071 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108336 res!849452) b!1278636))

(assert (= (and b!1278636 res!849451) b!1278633))

(assert (= (and b!1278633 res!849450) b!1278635))

(assert (= (and b!1278632 condMapEmpty!51836) mapIsEmpty!51836))

(assert (= (and b!1278632 (not condMapEmpty!51836)) mapNonEmpty!51836))

(get-info :version)

(assert (= (and mapNonEmpty!51836 ((_ is ValueCellFull!15863) mapValue!51836)) b!1278631))

(assert (= (and b!1278632 ((_ is ValueCellFull!15863) mapDefault!51836)) b!1278634))

(assert (= start!108336 b!1278632))

(declare-fun m!1173417 () Bool)

(assert (=> start!108336 m!1173417))

(declare-fun m!1173419 () Bool)

(assert (=> start!108336 m!1173419))

(declare-fun m!1173421 () Bool)

(assert (=> start!108336 m!1173421))

(declare-fun m!1173423 () Bool)

(assert (=> b!1278633 m!1173423))

(declare-fun m!1173425 () Bool)

(assert (=> mapNonEmpty!51836 m!1173425))

(declare-fun m!1173427 () Bool)

(assert (=> b!1278635 m!1173427))

(check-sat (not b!1278633) (not start!108336) (not b!1278635) (not mapNonEmpty!51836) tp_is_empty!33523)
(check-sat)
