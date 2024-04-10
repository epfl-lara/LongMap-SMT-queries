; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108320 () Bool)

(assert start!108320)

(declare-fun res!849407 () Bool)

(declare-fun e!730368 () Bool)

(assert (=> start!108320 (=> (not res!849407) (not e!730368))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108320 (= res!849407 (validMask!0 mask!2175))))

(assert (=> start!108320 e!730368))

(assert (=> start!108320 true))

(declare-datatypes ((V!49779 0))(
  ( (V!49780 (val!16828 Int)) )
))
(declare-datatypes ((ValueCell!15855 0))(
  ( (ValueCellFull!15855 (v!19428 V!49779)) (EmptyCell!15855) )
))
(declare-datatypes ((array!84108 0))(
  ( (array!84109 (arr!40558 (Array (_ BitVec 32) ValueCell!15855)) (size!41108 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84108)

(declare-fun e!730369 () Bool)

(declare-fun array_inv!30805 (array!84108) Bool)

(assert (=> start!108320 (and (array_inv!30805 _values!1445) e!730369)))

(declare-datatypes ((array!84110 0))(
  ( (array!84111 (arr!40559 (Array (_ BitVec 32) (_ BitVec 64))) (size!41109 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84110)

(declare-fun array_inv!30806 (array!84110) Bool)

(assert (=> start!108320 (array_inv!30806 _keys!1741)))

(declare-fun b!1278551 () Bool)

(declare-fun e!730366 () Bool)

(declare-fun mapRes!51812 () Bool)

(assert (=> b!1278551 (= e!730369 (and e!730366 mapRes!51812))))

(declare-fun condMapEmpty!51812 () Bool)

(declare-fun mapDefault!51812 () ValueCell!15855)

(assert (=> b!1278551 (= condMapEmpty!51812 (= (arr!40558 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15855)) mapDefault!51812)))))

(declare-fun b!1278552 () Bool)

(declare-fun res!849406 () Bool)

(assert (=> b!1278552 (=> (not res!849406) (not e!730368))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278552 (= res!849406 (and (= (size!41108 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41109 _keys!1741) (size!41108 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51812 () Bool)

(assert (=> mapIsEmpty!51812 mapRes!51812))

(declare-fun b!1278553 () Bool)

(declare-fun res!849405 () Bool)

(assert (=> b!1278553 (=> (not res!849405) (not e!730368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84110 (_ BitVec 32)) Bool)

(assert (=> b!1278553 (= res!849405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278554 () Bool)

(assert (=> b!1278554 (= e!730368 false)))

(declare-fun lt!575891 () Bool)

(declare-datatypes ((List!28742 0))(
  ( (Nil!28739) (Cons!28738 (h!29947 (_ BitVec 64)) (t!42282 List!28742)) )
))
(declare-fun arrayNoDuplicates!0 (array!84110 (_ BitVec 32) List!28742) Bool)

(assert (=> b!1278554 (= lt!575891 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28739))))

(declare-fun b!1278555 () Bool)

(declare-fun e!730367 () Bool)

(declare-fun tp_is_empty!33507 () Bool)

(assert (=> b!1278555 (= e!730367 tp_is_empty!33507)))

(declare-fun mapNonEmpty!51812 () Bool)

(declare-fun tp!98786 () Bool)

(assert (=> mapNonEmpty!51812 (= mapRes!51812 (and tp!98786 e!730367))))

(declare-fun mapRest!51812 () (Array (_ BitVec 32) ValueCell!15855))

(declare-fun mapKey!51812 () (_ BitVec 32))

(declare-fun mapValue!51812 () ValueCell!15855)

(assert (=> mapNonEmpty!51812 (= (arr!40558 _values!1445) (store mapRest!51812 mapKey!51812 mapValue!51812))))

(declare-fun b!1278556 () Bool)

(assert (=> b!1278556 (= e!730366 tp_is_empty!33507)))

(assert (= (and start!108320 res!849407) b!1278552))

(assert (= (and b!1278552 res!849406) b!1278553))

(assert (= (and b!1278553 res!849405) b!1278554))

(assert (= (and b!1278551 condMapEmpty!51812) mapIsEmpty!51812))

(assert (= (and b!1278551 (not condMapEmpty!51812)) mapNonEmpty!51812))

(get-info :version)

(assert (= (and mapNonEmpty!51812 ((_ is ValueCellFull!15855) mapValue!51812)) b!1278555))

(assert (= (and b!1278551 ((_ is ValueCellFull!15855) mapDefault!51812)) b!1278556))

(assert (= start!108320 b!1278551))

(declare-fun m!1173821 () Bool)

(assert (=> start!108320 m!1173821))

(declare-fun m!1173823 () Bool)

(assert (=> start!108320 m!1173823))

(declare-fun m!1173825 () Bool)

(assert (=> start!108320 m!1173825))

(declare-fun m!1173827 () Bool)

(assert (=> b!1278553 m!1173827))

(declare-fun m!1173829 () Bool)

(assert (=> b!1278554 m!1173829))

(declare-fun m!1173831 () Bool)

(assert (=> mapNonEmpty!51812 m!1173831))

(check-sat (not start!108320) (not b!1278554) tp_is_empty!33507 (not mapNonEmpty!51812) (not b!1278553))
(check-sat)
