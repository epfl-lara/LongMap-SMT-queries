; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35212 () Bool)

(assert start!35212)

(declare-fun b_free!7801 () Bool)

(declare-fun b_next!7801 () Bool)

(assert (=> start!35212 (= b_free!7801 (not b_next!7801))))

(declare-fun tp!26996 () Bool)

(declare-fun b_and!15055 () Bool)

(assert (=> start!35212 (= tp!26996 b_and!15055)))

(declare-fun mapIsEmpty!13116 () Bool)

(declare-fun mapRes!13116 () Bool)

(assert (=> mapIsEmpty!13116 mapRes!13116))

(declare-fun b!353097 () Bool)

(declare-fun e!216207 () Bool)

(declare-fun tp_is_empty!7753 () Bool)

(assert (=> b!353097 (= e!216207 tp_is_empty!7753)))

(declare-fun res!195831 () Bool)

(declare-fun e!216205 () Bool)

(assert (=> start!35212 (=> (not res!195831) (not e!216205))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35212 (= res!195831 (validMask!0 mask!2385))))

(assert (=> start!35212 e!216205))

(assert (=> start!35212 true))

(assert (=> start!35212 tp_is_empty!7753))

(assert (=> start!35212 tp!26996))

(declare-datatypes ((V!11315 0))(
  ( (V!11316 (val!3921 Int)) )
))
(declare-datatypes ((ValueCell!3533 0))(
  ( (ValueCellFull!3533 (v!6114 V!11315)) (EmptyCell!3533) )
))
(declare-datatypes ((array!19086 0))(
  ( (array!19087 (arr!9043 (Array (_ BitVec 32) ValueCell!3533)) (size!9395 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19086)

(declare-fun e!216208 () Bool)

(declare-fun array_inv!6680 (array!19086) Bool)

(assert (=> start!35212 (and (array_inv!6680 _values!1525) e!216208)))

(declare-datatypes ((array!19088 0))(
  ( (array!19089 (arr!9044 (Array (_ BitVec 32) (_ BitVec 64))) (size!9396 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19088)

(declare-fun array_inv!6681 (array!19088) Bool)

(assert (=> start!35212 (array_inv!6681 _keys!1895)))

(declare-fun b!353098 () Bool)

(declare-fun res!195832 () Bool)

(assert (=> b!353098 (=> (not res!195832) (not e!216205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19088 (_ BitVec 32)) Bool)

(assert (=> b!353098 (= res!195832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353099 () Bool)

(declare-fun res!195833 () Bool)

(assert (=> b!353099 (=> (not res!195833) (not e!216205))))

(declare-datatypes ((List!5173 0))(
  ( (Nil!5170) (Cons!5169 (h!6025 (_ BitVec 64)) (t!10313 List!5173)) )
))
(declare-fun arrayNoDuplicates!0 (array!19088 (_ BitVec 32) List!5173) Bool)

(assert (=> b!353099 (= res!195833 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5170))))

(declare-fun b!353100 () Bool)

(declare-fun res!195830 () Bool)

(assert (=> b!353100 (=> (not res!195830) (not e!216205))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353100 (= res!195830 (validKeyInArray!0 k0!1348))))

(declare-fun b!353101 () Bool)

(assert (=> b!353101 (= e!216208 (and e!216207 mapRes!13116))))

(declare-fun condMapEmpty!13116 () Bool)

(declare-fun mapDefault!13116 () ValueCell!3533)

(assert (=> b!353101 (= condMapEmpty!13116 (= (arr!9043 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3533)) mapDefault!13116)))))

(declare-fun b!353102 () Bool)

(declare-fun res!195829 () Bool)

(assert (=> b!353102 (=> (not res!195829) (not e!216205))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11315)

(declare-fun zeroValue!1467 () V!11315)

(declare-datatypes ((tuple2!5566 0))(
  ( (tuple2!5567 (_1!2794 (_ BitVec 64)) (_2!2794 V!11315)) )
))
(declare-datatypes ((List!5174 0))(
  ( (Nil!5171) (Cons!5170 (h!6026 tuple2!5566) (t!10314 List!5174)) )
))
(declare-datatypes ((ListLongMap!4481 0))(
  ( (ListLongMap!4482 (toList!2256 List!5174)) )
))
(declare-fun contains!2349 (ListLongMap!4481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1784 (array!19088 array!19086 (_ BitVec 32) (_ BitVec 32) V!11315 V!11315 (_ BitVec 32) Int) ListLongMap!4481)

(assert (=> b!353102 (= res!195829 (not (contains!2349 (getCurrentListMap!1784 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!353103 () Bool)

(declare-fun e!216206 () Bool)

(assert (=> b!353103 (= e!216206 tp_is_empty!7753)))

(declare-fun b!353104 () Bool)

(assert (=> b!353104 (= e!216205 false)))

(declare-datatypes ((SeekEntryResult!3431 0))(
  ( (MissingZero!3431 (index!15903 (_ BitVec 32))) (Found!3431 (index!15904 (_ BitVec 32))) (Intermediate!3431 (undefined!4243 Bool) (index!15905 (_ BitVec 32)) (x!35086 (_ BitVec 32))) (Undefined!3431) (MissingVacant!3431 (index!15906 (_ BitVec 32))) )
))
(declare-fun lt!165481 () SeekEntryResult!3431)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19088 (_ BitVec 32)) SeekEntryResult!3431)

(assert (=> b!353104 (= lt!165481 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353105 () Bool)

(declare-fun res!195828 () Bool)

(assert (=> b!353105 (=> (not res!195828) (not e!216205))))

(assert (=> b!353105 (= res!195828 (and (= (size!9395 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9396 _keys!1895) (size!9395 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13116 () Bool)

(declare-fun tp!26997 () Bool)

(assert (=> mapNonEmpty!13116 (= mapRes!13116 (and tp!26997 e!216206))))

(declare-fun mapRest!13116 () (Array (_ BitVec 32) ValueCell!3533))

(declare-fun mapValue!13116 () ValueCell!3533)

(declare-fun mapKey!13116 () (_ BitVec 32))

(assert (=> mapNonEmpty!13116 (= (arr!9043 _values!1525) (store mapRest!13116 mapKey!13116 mapValue!13116))))

(assert (= (and start!35212 res!195831) b!353105))

(assert (= (and b!353105 res!195828) b!353098))

(assert (= (and b!353098 res!195832) b!353099))

(assert (= (and b!353099 res!195833) b!353100))

(assert (= (and b!353100 res!195830) b!353102))

(assert (= (and b!353102 res!195829) b!353104))

(assert (= (and b!353101 condMapEmpty!13116) mapIsEmpty!13116))

(assert (= (and b!353101 (not condMapEmpty!13116)) mapNonEmpty!13116))

(get-info :version)

(assert (= (and mapNonEmpty!13116 ((_ is ValueCellFull!3533) mapValue!13116)) b!353103))

(assert (= (and b!353101 ((_ is ValueCellFull!3533) mapDefault!13116)) b!353097))

(assert (= start!35212 b!353101))

(declare-fun m!352825 () Bool)

(assert (=> b!353098 m!352825))

(declare-fun m!352827 () Bool)

(assert (=> b!353102 m!352827))

(assert (=> b!353102 m!352827))

(declare-fun m!352829 () Bool)

(assert (=> b!353102 m!352829))

(declare-fun m!352831 () Bool)

(assert (=> start!35212 m!352831))

(declare-fun m!352833 () Bool)

(assert (=> start!35212 m!352833))

(declare-fun m!352835 () Bool)

(assert (=> start!35212 m!352835))

(declare-fun m!352837 () Bool)

(assert (=> b!353099 m!352837))

(declare-fun m!352839 () Bool)

(assert (=> b!353104 m!352839))

(declare-fun m!352841 () Bool)

(assert (=> mapNonEmpty!13116 m!352841))

(declare-fun m!352843 () Bool)

(assert (=> b!353100 m!352843))

(check-sat (not b!353102) (not b!353100) (not start!35212) (not b!353104) (not b!353099) b_and!15055 (not b_next!7801) (not b!353098) tp_is_empty!7753 (not mapNonEmpty!13116))
(check-sat b_and!15055 (not b_next!7801))
