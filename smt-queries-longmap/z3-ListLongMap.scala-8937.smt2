; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108350 () Bool)

(assert start!108350)

(declare-fun res!849540 () Bool)

(declare-fun e!730592 () Bool)

(assert (=> start!108350 (=> (not res!849540) (not e!730592))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108350 (= res!849540 (validMask!0 mask!2175))))

(assert (=> start!108350 e!730592))

(assert (=> start!108350 true))

(declare-datatypes ((V!49819 0))(
  ( (V!49820 (val!16843 Int)) )
))
(declare-datatypes ((ValueCell!15870 0))(
  ( (ValueCellFull!15870 (v!19443 V!49819)) (EmptyCell!15870) )
))
(declare-datatypes ((array!84166 0))(
  ( (array!84167 (arr!40587 (Array (_ BitVec 32) ValueCell!15870)) (size!41137 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84166)

(declare-fun e!730591 () Bool)

(declare-fun array_inv!30821 (array!84166) Bool)

(assert (=> start!108350 (and (array_inv!30821 _values!1445) e!730591)))

(declare-datatypes ((array!84168 0))(
  ( (array!84169 (arr!40588 (Array (_ BitVec 32) (_ BitVec 64))) (size!41138 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84168)

(declare-fun array_inv!30822 (array!84168) Bool)

(assert (=> start!108350 (array_inv!30822 _keys!1741)))

(declare-fun b!1278821 () Bool)

(declare-fun res!849541 () Bool)

(assert (=> b!1278821 (=> (not res!849541) (not e!730592))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278821 (= res!849541 (and (= (size!41137 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41138 _keys!1741) (size!41137 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278822 () Bool)

(assert (=> b!1278822 (= e!730592 false)))

(declare-fun lt!575936 () Bool)

(declare-datatypes ((List!28752 0))(
  ( (Nil!28749) (Cons!28748 (h!29957 (_ BitVec 64)) (t!42292 List!28752)) )
))
(declare-fun arrayNoDuplicates!0 (array!84168 (_ BitVec 32) List!28752) Bool)

(assert (=> b!1278822 (= lt!575936 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28749))))

(declare-fun b!1278823 () Bool)

(declare-fun e!730593 () Bool)

(declare-fun mapRes!51857 () Bool)

(assert (=> b!1278823 (= e!730591 (and e!730593 mapRes!51857))))

(declare-fun condMapEmpty!51857 () Bool)

(declare-fun mapDefault!51857 () ValueCell!15870)

(assert (=> b!1278823 (= condMapEmpty!51857 (= (arr!40587 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15870)) mapDefault!51857)))))

(declare-fun b!1278824 () Bool)

(declare-fun tp_is_empty!33537 () Bool)

(assert (=> b!1278824 (= e!730593 tp_is_empty!33537)))

(declare-fun b!1278825 () Bool)

(declare-fun res!849542 () Bool)

(assert (=> b!1278825 (=> (not res!849542) (not e!730592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84168 (_ BitVec 32)) Bool)

(assert (=> b!1278825 (= res!849542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51857 () Bool)

(assert (=> mapIsEmpty!51857 mapRes!51857))

(declare-fun b!1278826 () Bool)

(declare-fun e!730594 () Bool)

(assert (=> b!1278826 (= e!730594 tp_is_empty!33537)))

(declare-fun mapNonEmpty!51857 () Bool)

(declare-fun tp!98831 () Bool)

(assert (=> mapNonEmpty!51857 (= mapRes!51857 (and tp!98831 e!730594))))

(declare-fun mapValue!51857 () ValueCell!15870)

(declare-fun mapKey!51857 () (_ BitVec 32))

(declare-fun mapRest!51857 () (Array (_ BitVec 32) ValueCell!15870))

(assert (=> mapNonEmpty!51857 (= (arr!40587 _values!1445) (store mapRest!51857 mapKey!51857 mapValue!51857))))

(assert (= (and start!108350 res!849540) b!1278821))

(assert (= (and b!1278821 res!849541) b!1278825))

(assert (= (and b!1278825 res!849542) b!1278822))

(assert (= (and b!1278823 condMapEmpty!51857) mapIsEmpty!51857))

(assert (= (and b!1278823 (not condMapEmpty!51857)) mapNonEmpty!51857))

(get-info :version)

(assert (= (and mapNonEmpty!51857 ((_ is ValueCellFull!15870) mapValue!51857)) b!1278826))

(assert (= (and b!1278823 ((_ is ValueCellFull!15870) mapDefault!51857)) b!1278824))

(assert (= start!108350 b!1278823))

(declare-fun m!1174001 () Bool)

(assert (=> start!108350 m!1174001))

(declare-fun m!1174003 () Bool)

(assert (=> start!108350 m!1174003))

(declare-fun m!1174005 () Bool)

(assert (=> start!108350 m!1174005))

(declare-fun m!1174007 () Bool)

(assert (=> b!1278822 m!1174007))

(declare-fun m!1174009 () Bool)

(assert (=> b!1278825 m!1174009))

(declare-fun m!1174011 () Bool)

(assert (=> mapNonEmpty!51857 m!1174011))

(check-sat (not start!108350) (not mapNonEmpty!51857) (not b!1278822) (not b!1278825) tp_is_empty!33537)
(check-sat)
