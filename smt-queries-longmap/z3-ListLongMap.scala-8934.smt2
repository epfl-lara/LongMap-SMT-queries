; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108330 () Bool)

(assert start!108330)

(declare-fun b!1278577 () Bool)

(declare-fun e!730414 () Bool)

(declare-fun e!730415 () Bool)

(declare-fun mapRes!51827 () Bool)

(assert (=> b!1278577 (= e!730414 (and e!730415 mapRes!51827))))

(declare-fun condMapEmpty!51827 () Bool)

(declare-datatypes ((V!49793 0))(
  ( (V!49794 (val!16833 Int)) )
))
(declare-datatypes ((ValueCell!15860 0))(
  ( (ValueCellFull!15860 (v!19432 V!49793)) (EmptyCell!15860) )
))
(declare-datatypes ((array!84019 0))(
  ( (array!84020 (arr!40514 (Array (_ BitVec 32) ValueCell!15860)) (size!41066 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84019)

(declare-fun mapDefault!51827 () ValueCell!15860)

(assert (=> b!1278577 (= condMapEmpty!51827 (= (arr!40514 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15860)) mapDefault!51827)))))

(declare-fun b!1278578 () Bool)

(declare-fun tp_is_empty!33517 () Bool)

(assert (=> b!1278578 (= e!730415 tp_is_empty!33517)))

(declare-fun res!849425 () Bool)

(declare-fun e!730416 () Bool)

(assert (=> start!108330 (=> (not res!849425) (not e!730416))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108330 (= res!849425 (validMask!0 mask!2175))))

(assert (=> start!108330 e!730416))

(assert (=> start!108330 true))

(declare-fun array_inv!30929 (array!84019) Bool)

(assert (=> start!108330 (and (array_inv!30929 _values!1445) e!730414)))

(declare-datatypes ((array!84021 0))(
  ( (array!84022 (arr!40515 (Array (_ BitVec 32) (_ BitVec 64))) (size!41067 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84021)

(declare-fun array_inv!30930 (array!84021) Bool)

(assert (=> start!108330 (array_inv!30930 _keys!1741)))

(declare-fun b!1278579 () Bool)

(assert (=> b!1278579 (= e!730416 false)))

(declare-fun lt!575728 () Bool)

(declare-datatypes ((List!28820 0))(
  ( (Nil!28817) (Cons!28816 (h!30025 (_ BitVec 64)) (t!42352 List!28820)) )
))
(declare-fun arrayNoDuplicates!0 (array!84021 (_ BitVec 32) List!28820) Bool)

(assert (=> b!1278579 (= lt!575728 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28817))))

(declare-fun b!1278580 () Bool)

(declare-fun e!730413 () Bool)

(assert (=> b!1278580 (= e!730413 tp_is_empty!33517)))

(declare-fun b!1278581 () Bool)

(declare-fun res!849423 () Bool)

(assert (=> b!1278581 (=> (not res!849423) (not e!730416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84021 (_ BitVec 32)) Bool)

(assert (=> b!1278581 (= res!849423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51827 () Bool)

(assert (=> mapIsEmpty!51827 mapRes!51827))

(declare-fun b!1278582 () Bool)

(declare-fun res!849424 () Bool)

(assert (=> b!1278582 (=> (not res!849424) (not e!730416))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278582 (= res!849424 (and (= (size!41066 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41067 _keys!1741) (size!41066 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51827 () Bool)

(declare-fun tp!98802 () Bool)

(assert (=> mapNonEmpty!51827 (= mapRes!51827 (and tp!98802 e!730413))))

(declare-fun mapValue!51827 () ValueCell!15860)

(declare-fun mapKey!51827 () (_ BitVec 32))

(declare-fun mapRest!51827 () (Array (_ BitVec 32) ValueCell!15860))

(assert (=> mapNonEmpty!51827 (= (arr!40514 _values!1445) (store mapRest!51827 mapKey!51827 mapValue!51827))))

(assert (= (and start!108330 res!849425) b!1278582))

(assert (= (and b!1278582 res!849424) b!1278581))

(assert (= (and b!1278581 res!849423) b!1278579))

(assert (= (and b!1278577 condMapEmpty!51827) mapIsEmpty!51827))

(assert (= (and b!1278577 (not condMapEmpty!51827)) mapNonEmpty!51827))

(get-info :version)

(assert (= (and mapNonEmpty!51827 ((_ is ValueCellFull!15860) mapValue!51827)) b!1278580))

(assert (= (and b!1278577 ((_ is ValueCellFull!15860) mapDefault!51827)) b!1278578))

(assert (= start!108330 b!1278577))

(declare-fun m!1173381 () Bool)

(assert (=> start!108330 m!1173381))

(declare-fun m!1173383 () Bool)

(assert (=> start!108330 m!1173383))

(declare-fun m!1173385 () Bool)

(assert (=> start!108330 m!1173385))

(declare-fun m!1173387 () Bool)

(assert (=> b!1278579 m!1173387))

(declare-fun m!1173389 () Bool)

(assert (=> b!1278581 m!1173389))

(declare-fun m!1173391 () Bool)

(assert (=> mapNonEmpty!51827 m!1173391))

(check-sat tp_is_empty!33517 (not mapNonEmpty!51827) (not start!108330) (not b!1278579) (not b!1278581))
(check-sat)
