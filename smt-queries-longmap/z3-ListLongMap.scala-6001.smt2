; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77840 () Bool)

(assert start!77840)

(declare-fun b_free!16417 () Bool)

(declare-fun b_next!16417 () Bool)

(assert (=> start!77840 (= b_free!16417 (not b_next!16417))))

(declare-fun tp!57517 () Bool)

(declare-fun b_and!26959 () Bool)

(assert (=> start!77840 (= tp!57517 b_and!26959)))

(declare-fun mapIsEmpty!29968 () Bool)

(declare-fun mapRes!29968 () Bool)

(assert (=> mapIsEmpty!29968 mapRes!29968))

(declare-fun b!908900 () Bool)

(declare-fun e!509420 () Bool)

(declare-fun tp_is_empty!18835 () Bool)

(assert (=> b!908900 (= e!509420 tp_is_empty!18835)))

(declare-fun b!908901 () Bool)

(declare-fun res!613531 () Bool)

(declare-fun e!509421 () Bool)

(assert (=> b!908901 (=> (not res!613531) (not e!509421))))

(declare-datatypes ((array!53679 0))(
  ( (array!53680 (arr!25798 (Array (_ BitVec 32) (_ BitVec 64))) (size!26259 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53679)

(declare-datatypes ((List!18150 0))(
  ( (Nil!18147) (Cons!18146 (h!19292 (_ BitVec 64)) (t!25722 List!18150)) )
))
(declare-fun arrayNoDuplicates!0 (array!53679 (_ BitVec 32) List!18150) Bool)

(assert (=> b!908901 (= res!613531 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18147))))

(declare-fun b!908902 () Bool)

(declare-fun res!613530 () Bool)

(assert (=> b!908902 (=> (not res!613530) (not e!509421))))

(declare-datatypes ((V!30079 0))(
  ( (V!30080 (val!9468 Int)) )
))
(declare-datatypes ((ValueCell!8936 0))(
  ( (ValueCellFull!8936 (v!11974 V!30079)) (EmptyCell!8936) )
))
(declare-datatypes ((array!53681 0))(
  ( (array!53682 (arr!25799 (Array (_ BitVec 32) ValueCell!8936)) (size!26260 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53681)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!908902 (= res!613530 (and (= (size!26260 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26259 _keys!1386) (size!26260 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29968 () Bool)

(declare-fun tp!57516 () Bool)

(declare-fun e!509422 () Bool)

(assert (=> mapNonEmpty!29968 (= mapRes!29968 (and tp!57516 e!509422))))

(declare-fun mapKey!29968 () (_ BitVec 32))

(declare-fun mapRest!29968 () (Array (_ BitVec 32) ValueCell!8936))

(declare-fun mapValue!29968 () ValueCell!8936)

(assert (=> mapNonEmpty!29968 (= (arr!25799 _values!1152) (store mapRest!29968 mapKey!29968 mapValue!29968))))

(declare-fun res!613528 () Bool)

(assert (=> start!77840 (=> (not res!613528) (not e!509421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77840 (= res!613528 (validMask!0 mask!1756))))

(assert (=> start!77840 e!509421))

(declare-fun e!509423 () Bool)

(declare-fun array_inv!20232 (array!53681) Bool)

(assert (=> start!77840 (and (array_inv!20232 _values!1152) e!509423)))

(assert (=> start!77840 tp!57517))

(assert (=> start!77840 true))

(assert (=> start!77840 tp_is_empty!18835))

(declare-fun array_inv!20233 (array!53679) Bool)

(assert (=> start!77840 (array_inv!20233 _keys!1386)))

(declare-fun b!908903 () Bool)

(assert (=> b!908903 (= e!509421 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409716 () Bool)

(declare-fun zeroValue!1094 () V!30079)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30079)

(declare-datatypes ((tuple2!12370 0))(
  ( (tuple2!12371 (_1!6196 (_ BitVec 64)) (_2!6196 V!30079)) )
))
(declare-datatypes ((List!18151 0))(
  ( (Nil!18148) (Cons!18147 (h!19293 tuple2!12370) (t!25723 List!18151)) )
))
(declare-datatypes ((ListLongMap!11057 0))(
  ( (ListLongMap!11058 (toList!5544 List!18151)) )
))
(declare-fun contains!4543 (ListLongMap!11057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2746 (array!53679 array!53681 (_ BitVec 32) (_ BitVec 32) V!30079 V!30079 (_ BitVec 32) Int) ListLongMap!11057)

(assert (=> b!908903 (= lt!409716 (contains!4543 (getCurrentListMap!2746 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!908904 () Bool)

(declare-fun res!613529 () Bool)

(assert (=> b!908904 (=> (not res!613529) (not e!509421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53679 (_ BitVec 32)) Bool)

(assert (=> b!908904 (= res!613529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908905 () Bool)

(assert (=> b!908905 (= e!509423 (and e!509420 mapRes!29968))))

(declare-fun condMapEmpty!29968 () Bool)

(declare-fun mapDefault!29968 () ValueCell!8936)

(assert (=> b!908905 (= condMapEmpty!29968 (= (arr!25799 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8936)) mapDefault!29968)))))

(declare-fun b!908906 () Bool)

(assert (=> b!908906 (= e!509422 tp_is_empty!18835)))

(assert (= (and start!77840 res!613528) b!908902))

(assert (= (and b!908902 res!613530) b!908904))

(assert (= (and b!908904 res!613529) b!908901))

(assert (= (and b!908901 res!613531) b!908903))

(assert (= (and b!908905 condMapEmpty!29968) mapIsEmpty!29968))

(assert (= (and b!908905 (not condMapEmpty!29968)) mapNonEmpty!29968))

(get-info :version)

(assert (= (and mapNonEmpty!29968 ((_ is ValueCellFull!8936) mapValue!29968)) b!908906))

(assert (= (and b!908905 ((_ is ValueCellFull!8936) mapDefault!29968)) b!908900))

(assert (= start!77840 b!908905))

(declare-fun m!843699 () Bool)

(assert (=> b!908904 m!843699))

(declare-fun m!843701 () Bool)

(assert (=> start!77840 m!843701))

(declare-fun m!843703 () Bool)

(assert (=> start!77840 m!843703))

(declare-fun m!843705 () Bool)

(assert (=> start!77840 m!843705))

(declare-fun m!843707 () Bool)

(assert (=> b!908901 m!843707))

(declare-fun m!843709 () Bool)

(assert (=> mapNonEmpty!29968 m!843709))

(declare-fun m!843711 () Bool)

(assert (=> b!908903 m!843711))

(assert (=> b!908903 m!843711))

(declare-fun m!843713 () Bool)

(assert (=> b!908903 m!843713))

(check-sat (not start!77840) (not b!908901) tp_is_empty!18835 (not b!908903) b_and!26959 (not b_next!16417) (not mapNonEmpty!29968) (not b!908904))
(check-sat b_and!26959 (not b_next!16417))
