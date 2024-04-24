; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108228 () Bool)

(assert start!108228)

(declare-fun b!1277035 () Bool)

(declare-fun res!848430 () Bool)

(declare-fun e!729178 () Bool)

(assert (=> b!1277035 (=> (not res!848430) (not e!729178))))

(declare-datatypes ((array!83681 0))(
  ( (array!83682 (arr!40348 (Array (_ BitVec 32) (_ BitVec 64))) (size!40899 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83681)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83681 (_ BitVec 32)) Bool)

(assert (=> b!1277035 (= res!848430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51443 () Bool)

(declare-fun mapRes!51443 () Bool)

(assert (=> mapIsEmpty!51443 mapRes!51443))

(declare-fun res!848429 () Bool)

(assert (=> start!108228 (=> (not res!848429) (not e!729178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108228 (= res!848429 (validMask!0 mask!1805))))

(assert (=> start!108228 e!729178))

(assert (=> start!108228 true))

(declare-datatypes ((V!49473 0))(
  ( (V!49474 (val!16713 Int)) )
))
(declare-datatypes ((ValueCell!15740 0))(
  ( (ValueCellFull!15740 (v!19305 V!49473)) (EmptyCell!15740) )
))
(declare-datatypes ((array!83683 0))(
  ( (array!83684 (arr!40349 (Array (_ BitVec 32) ValueCell!15740)) (size!40900 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83683)

(declare-fun e!729180 () Bool)

(declare-fun array_inv!30855 (array!83683) Bool)

(assert (=> start!108228 (and (array_inv!30855 _values!1187) e!729180)))

(declare-fun array_inv!30856 (array!83681) Bool)

(assert (=> start!108228 (array_inv!30856 _keys!1427)))

(declare-fun mapNonEmpty!51443 () Bool)

(declare-fun tp!98201 () Bool)

(declare-fun e!729177 () Bool)

(assert (=> mapNonEmpty!51443 (= mapRes!51443 (and tp!98201 e!729177))))

(declare-fun mapValue!51443 () ValueCell!15740)

(declare-fun mapRest!51443 () (Array (_ BitVec 32) ValueCell!15740))

(declare-fun mapKey!51443 () (_ BitVec 32))

(assert (=> mapNonEmpty!51443 (= (arr!40349 _values!1187) (store mapRest!51443 mapKey!51443 mapValue!51443))))

(declare-fun b!1277036 () Bool)

(declare-fun res!848431 () Bool)

(assert (=> b!1277036 (=> (not res!848431) (not e!729178))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277036 (= res!848431 (and (= (size!40900 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40899 _keys!1427) (size!40900 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277037 () Bool)

(assert (=> b!1277037 (= e!729178 false)))

(declare-fun lt!575867 () Bool)

(declare-datatypes ((List!28651 0))(
  ( (Nil!28648) (Cons!28647 (h!29865 (_ BitVec 64)) (t!42179 List!28651)) )
))
(declare-fun arrayNoDuplicates!0 (array!83681 (_ BitVec 32) List!28651) Bool)

(assert (=> b!1277037 (= lt!575867 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28648))))

(declare-fun b!1277038 () Bool)

(declare-fun e!729179 () Bool)

(declare-fun tp_is_empty!33277 () Bool)

(assert (=> b!1277038 (= e!729179 tp_is_empty!33277)))

(declare-fun b!1277039 () Bool)

(assert (=> b!1277039 (= e!729180 (and e!729179 mapRes!51443))))

(declare-fun condMapEmpty!51443 () Bool)

(declare-fun mapDefault!51443 () ValueCell!15740)

(assert (=> b!1277039 (= condMapEmpty!51443 (= (arr!40349 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15740)) mapDefault!51443)))))

(declare-fun b!1277040 () Bool)

(assert (=> b!1277040 (= e!729177 tp_is_empty!33277)))

(assert (= (and start!108228 res!848429) b!1277036))

(assert (= (and b!1277036 res!848431) b!1277035))

(assert (= (and b!1277035 res!848430) b!1277037))

(assert (= (and b!1277039 condMapEmpty!51443) mapIsEmpty!51443))

(assert (= (and b!1277039 (not condMapEmpty!51443)) mapNonEmpty!51443))

(get-info :version)

(assert (= (and mapNonEmpty!51443 ((_ is ValueCellFull!15740) mapValue!51443)) b!1277040))

(assert (= (and b!1277039 ((_ is ValueCellFull!15740) mapDefault!51443)) b!1277038))

(assert (= start!108228 b!1277039))

(declare-fun m!1173483 () Bool)

(assert (=> b!1277035 m!1173483))

(declare-fun m!1173485 () Bool)

(assert (=> start!108228 m!1173485))

(declare-fun m!1173487 () Bool)

(assert (=> start!108228 m!1173487))

(declare-fun m!1173489 () Bool)

(assert (=> start!108228 m!1173489))

(declare-fun m!1173491 () Bool)

(assert (=> mapNonEmpty!51443 m!1173491))

(declare-fun m!1173493 () Bool)

(assert (=> b!1277037 m!1173493))

(check-sat (not b!1277035) (not b!1277037) (not mapNonEmpty!51443) tp_is_empty!33277 (not start!108228))
(check-sat)
