; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108332 () Bool)

(assert start!108332)

(declare-fun mapIsEmpty!51830 () Bool)

(declare-fun mapRes!51830 () Bool)

(assert (=> mapIsEmpty!51830 mapRes!51830))

(declare-fun b!1278659 () Bool)

(declare-fun e!730460 () Bool)

(assert (=> b!1278659 (= e!730460 false)))

(declare-fun lt!575909 () Bool)

(declare-datatypes ((array!84130 0))(
  ( (array!84131 (arr!40569 (Array (_ BitVec 32) (_ BitVec 64))) (size!41119 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84130)

(declare-datatypes ((List!28745 0))(
  ( (Nil!28742) (Cons!28741 (h!29950 (_ BitVec 64)) (t!42285 List!28745)) )
))
(declare-fun arrayNoDuplicates!0 (array!84130 (_ BitVec 32) List!28745) Bool)

(assert (=> b!1278659 (= lt!575909 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28742))))

(declare-fun b!1278660 () Bool)

(declare-fun e!730459 () Bool)

(declare-fun tp_is_empty!33519 () Bool)

(assert (=> b!1278660 (= e!730459 tp_is_empty!33519)))

(declare-fun mapNonEmpty!51830 () Bool)

(declare-fun tp!98804 () Bool)

(declare-fun e!730458 () Bool)

(assert (=> mapNonEmpty!51830 (= mapRes!51830 (and tp!98804 e!730458))))

(declare-datatypes ((V!49795 0))(
  ( (V!49796 (val!16834 Int)) )
))
(declare-datatypes ((ValueCell!15861 0))(
  ( (ValueCellFull!15861 (v!19434 V!49795)) (EmptyCell!15861) )
))
(declare-fun mapRest!51830 () (Array (_ BitVec 32) ValueCell!15861))

(declare-datatypes ((array!84132 0))(
  ( (array!84133 (arr!40570 (Array (_ BitVec 32) ValueCell!15861)) (size!41120 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84132)

(declare-fun mapValue!51830 () ValueCell!15861)

(declare-fun mapKey!51830 () (_ BitVec 32))

(assert (=> mapNonEmpty!51830 (= (arr!40570 _values!1445) (store mapRest!51830 mapKey!51830 mapValue!51830))))

(declare-fun b!1278662 () Bool)

(declare-fun e!730456 () Bool)

(assert (=> b!1278662 (= e!730456 (and e!730459 mapRes!51830))))

(declare-fun condMapEmpty!51830 () Bool)

(declare-fun mapDefault!51830 () ValueCell!15861)

(assert (=> b!1278662 (= condMapEmpty!51830 (= (arr!40570 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15861)) mapDefault!51830)))))

(declare-fun res!849459 () Bool)

(assert (=> start!108332 (=> (not res!849459) (not e!730460))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108332 (= res!849459 (validMask!0 mask!2175))))

(assert (=> start!108332 e!730460))

(assert (=> start!108332 true))

(declare-fun array_inv!30811 (array!84132) Bool)

(assert (=> start!108332 (and (array_inv!30811 _values!1445) e!730456)))

(declare-fun array_inv!30812 (array!84130) Bool)

(assert (=> start!108332 (array_inv!30812 _keys!1741)))

(declare-fun b!1278661 () Bool)

(assert (=> b!1278661 (= e!730458 tp_is_empty!33519)))

(declare-fun b!1278663 () Bool)

(declare-fun res!849460 () Bool)

(assert (=> b!1278663 (=> (not res!849460) (not e!730460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84130 (_ BitVec 32)) Bool)

(assert (=> b!1278663 (= res!849460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278664 () Bool)

(declare-fun res!849461 () Bool)

(assert (=> b!1278664 (=> (not res!849461) (not e!730460))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278664 (= res!849461 (and (= (size!41120 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41119 _keys!1741) (size!41120 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108332 res!849459) b!1278664))

(assert (= (and b!1278664 res!849461) b!1278663))

(assert (= (and b!1278663 res!849460) b!1278659))

(assert (= (and b!1278662 condMapEmpty!51830) mapIsEmpty!51830))

(assert (= (and b!1278662 (not condMapEmpty!51830)) mapNonEmpty!51830))

(get-info :version)

(assert (= (and mapNonEmpty!51830 ((_ is ValueCellFull!15861) mapValue!51830)) b!1278661))

(assert (= (and b!1278662 ((_ is ValueCellFull!15861) mapDefault!51830)) b!1278660))

(assert (= start!108332 b!1278662))

(declare-fun m!1173893 () Bool)

(assert (=> b!1278659 m!1173893))

(declare-fun m!1173895 () Bool)

(assert (=> mapNonEmpty!51830 m!1173895))

(declare-fun m!1173897 () Bool)

(assert (=> start!108332 m!1173897))

(declare-fun m!1173899 () Bool)

(assert (=> start!108332 m!1173899))

(declare-fun m!1173901 () Bool)

(assert (=> start!108332 m!1173901))

(declare-fun m!1173903 () Bool)

(assert (=> b!1278663 m!1173903))

(check-sat (not b!1278659) tp_is_empty!33519 (not b!1278663) (not mapNonEmpty!51830) (not start!108332))
(check-sat)
