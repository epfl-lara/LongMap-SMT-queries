; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34774 () Bool)

(assert start!34774)

(declare-fun b_free!7573 () Bool)

(declare-fun b_next!7573 () Bool)

(assert (=> start!34774 (= b_free!7573 (not b_next!7573))))

(declare-fun tp!26286 () Bool)

(declare-fun b_and!14769 () Bool)

(assert (=> start!34774 (= tp!26286 b_and!14769)))

(declare-fun b!347739 () Bool)

(declare-fun e!213071 () Bool)

(declare-fun e!213066 () Bool)

(assert (=> b!347739 (= e!213071 e!213066)))

(declare-fun res!192579 () Bool)

(assert (=> b!347739 (=> (not res!192579) (not e!213066))))

(declare-datatypes ((V!11011 0))(
  ( (V!11012 (val!3807 Int)) )
))
(declare-datatypes ((tuple2!5464 0))(
  ( (tuple2!5465 (_1!2743 (_ BitVec 64)) (_2!2743 V!11011)) )
))
(declare-datatypes ((List!5080 0))(
  ( (Nil!5077) (Cons!5076 (h!5932 tuple2!5464) (t!10201 List!5080)) )
))
(declare-datatypes ((ListLongMap!4367 0))(
  ( (ListLongMap!4368 (toList!2199 List!5080)) )
))
(declare-fun lt!163553 () ListLongMap!4367)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2275 (ListLongMap!4367 (_ BitVec 64)) Bool)

(assert (=> b!347739 (= res!192579 (not (contains!2275 lt!163553 k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!11011)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3419 0))(
  ( (ValueCellFull!3419 (v!5984 V!11011)) (EmptyCell!3419) )
))
(declare-datatypes ((array!18621 0))(
  ( (array!18622 (arr!8820 (Array (_ BitVec 32) ValueCell!3419)) (size!9173 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18621)

(declare-datatypes ((array!18623 0))(
  ( (array!18624 (arr!8821 (Array (_ BitVec 32) (_ BitVec 64))) (size!9174 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18623)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11011)

(declare-fun getCurrentListMap!1704 (array!18623 array!18621 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) ListLongMap!4367)

(assert (=> b!347739 (= lt!163553 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347740 () Bool)

(declare-fun res!192580 () Bool)

(assert (=> b!347740 (=> (not res!192580) (not e!213071))))

(declare-datatypes ((List!5081 0))(
  ( (Nil!5078) (Cons!5077 (h!5933 (_ BitVec 64)) (t!10202 List!5081)) )
))
(declare-fun arrayNoDuplicates!0 (array!18623 (_ BitVec 32) List!5081) Bool)

(assert (=> b!347740 (= res!192580 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5078))))

(declare-fun mapNonEmpty!12747 () Bool)

(declare-fun mapRes!12747 () Bool)

(declare-fun tp!26285 () Bool)

(declare-fun e!213069 () Bool)

(assert (=> mapNonEmpty!12747 (= mapRes!12747 (and tp!26285 e!213069))))

(declare-fun mapKey!12747 () (_ BitVec 32))

(declare-fun mapRest!12747 () (Array (_ BitVec 32) ValueCell!3419))

(declare-fun mapValue!12747 () ValueCell!3419)

(assert (=> mapNonEmpty!12747 (= (arr!8820 _values!1525) (store mapRest!12747 mapKey!12747 mapValue!12747))))

(declare-fun b!347741 () Bool)

(declare-fun e!213070 () Bool)

(assert (=> b!347741 (= e!213070 (not true))))

(declare-datatypes ((SeekEntryResult!3399 0))(
  ( (MissingZero!3399 (index!15775 (_ BitVec 32))) (Found!3399 (index!15776 (_ BitVec 32))) (Intermediate!3399 (undefined!4211 Bool) (index!15777 (_ BitVec 32)) (x!34658 (_ BitVec 32))) (Undefined!3399) (MissingVacant!3399 (index!15778 (_ BitVec 32))) )
))
(declare-fun lt!163552 () SeekEntryResult!3399)

(assert (=> b!347741 (contains!2275 lt!163553 (select (arr!8821 _keys!1895) (index!15776 lt!163552)))))

(declare-datatypes ((Unit!10788 0))(
  ( (Unit!10789) )
))
(declare-fun lt!163554 () Unit!10788)

(declare-fun lemmaValidKeyInArrayIsInListMap!179 (array!18623 array!18621 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) Unit!10788)

(assert (=> b!347741 (= lt!163554 (lemmaValidKeyInArrayIsInListMap!179 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15776 lt!163552) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!18623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347741 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163551 () Unit!10788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18623 (_ BitVec 64) (_ BitVec 32)) Unit!10788)

(assert (=> b!347741 (= lt!163551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15776 lt!163552)))))

(declare-fun b!347742 () Bool)

(declare-fun e!213072 () Bool)

(declare-fun tp_is_empty!7525 () Bool)

(assert (=> b!347742 (= e!213072 tp_is_empty!7525)))

(declare-fun b!347743 () Bool)

(assert (=> b!347743 (= e!213069 tp_is_empty!7525)))

(declare-fun b!347744 () Bool)

(declare-fun res!192583 () Bool)

(assert (=> b!347744 (=> (not res!192583) (not e!213071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18623 (_ BitVec 32)) Bool)

(assert (=> b!347744 (= res!192583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!192578 () Bool)

(assert (=> start!34774 (=> (not res!192578) (not e!213071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34774 (= res!192578 (validMask!0 mask!2385))))

(assert (=> start!34774 e!213071))

(assert (=> start!34774 true))

(assert (=> start!34774 tp_is_empty!7525))

(assert (=> start!34774 tp!26286))

(declare-fun e!213068 () Bool)

(declare-fun array_inv!6546 (array!18621) Bool)

(assert (=> start!34774 (and (array_inv!6546 _values!1525) e!213068)))

(declare-fun array_inv!6547 (array!18623) Bool)

(assert (=> start!34774 (array_inv!6547 _keys!1895)))

(declare-fun b!347745 () Bool)

(assert (=> b!347745 (= e!213066 e!213070)))

(declare-fun res!192582 () Bool)

(assert (=> b!347745 (=> (not res!192582) (not e!213070))))

(get-info :version)

(assert (=> b!347745 (= res!192582 (and ((_ is Found!3399) lt!163552) (= (select (arr!8821 _keys!1895) (index!15776 lt!163552)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18623 (_ BitVec 32)) SeekEntryResult!3399)

(assert (=> b!347745 (= lt!163552 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12747 () Bool)

(assert (=> mapIsEmpty!12747 mapRes!12747))

(declare-fun b!347746 () Bool)

(assert (=> b!347746 (= e!213068 (and e!213072 mapRes!12747))))

(declare-fun condMapEmpty!12747 () Bool)

(declare-fun mapDefault!12747 () ValueCell!3419)

(assert (=> b!347746 (= condMapEmpty!12747 (= (arr!8820 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3419)) mapDefault!12747)))))

(declare-fun b!347747 () Bool)

(declare-fun res!192577 () Bool)

(assert (=> b!347747 (=> (not res!192577) (not e!213070))))

(assert (=> b!347747 (= res!192577 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15776 lt!163552)))))

(declare-fun b!347748 () Bool)

(declare-fun res!192576 () Bool)

(assert (=> b!347748 (=> (not res!192576) (not e!213071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347748 (= res!192576 (validKeyInArray!0 k0!1348))))

(declare-fun b!347749 () Bool)

(declare-fun res!192581 () Bool)

(assert (=> b!347749 (=> (not res!192581) (not e!213071))))

(assert (=> b!347749 (= res!192581 (and (= (size!9173 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9174 _keys!1895) (size!9173 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34774 res!192578) b!347749))

(assert (= (and b!347749 res!192581) b!347744))

(assert (= (and b!347744 res!192583) b!347740))

(assert (= (and b!347740 res!192580) b!347748))

(assert (= (and b!347748 res!192576) b!347739))

(assert (= (and b!347739 res!192579) b!347745))

(assert (= (and b!347745 res!192582) b!347747))

(assert (= (and b!347747 res!192577) b!347741))

(assert (= (and b!347746 condMapEmpty!12747) mapIsEmpty!12747))

(assert (= (and b!347746 (not condMapEmpty!12747)) mapNonEmpty!12747))

(assert (= (and mapNonEmpty!12747 ((_ is ValueCellFull!3419) mapValue!12747)) b!347743))

(assert (= (and b!347746 ((_ is ValueCellFull!3419) mapDefault!12747)) b!347742))

(assert (= start!34774 b!347746))

(declare-fun m!348147 () Bool)

(assert (=> start!34774 m!348147))

(declare-fun m!348149 () Bool)

(assert (=> start!34774 m!348149))

(declare-fun m!348151 () Bool)

(assert (=> start!34774 m!348151))

(declare-fun m!348153 () Bool)

(assert (=> b!347747 m!348153))

(declare-fun m!348155 () Bool)

(assert (=> b!347741 m!348155))

(declare-fun m!348157 () Bool)

(assert (=> b!347741 m!348157))

(declare-fun m!348159 () Bool)

(assert (=> b!347741 m!348159))

(declare-fun m!348161 () Bool)

(assert (=> b!347741 m!348161))

(declare-fun m!348163 () Bool)

(assert (=> b!347741 m!348163))

(assert (=> b!347741 m!348157))

(declare-fun m!348165 () Bool)

(assert (=> mapNonEmpty!12747 m!348165))

(assert (=> b!347745 m!348157))

(declare-fun m!348167 () Bool)

(assert (=> b!347745 m!348167))

(declare-fun m!348169 () Bool)

(assert (=> b!347739 m!348169))

(declare-fun m!348171 () Bool)

(assert (=> b!347739 m!348171))

(declare-fun m!348173 () Bool)

(assert (=> b!347748 m!348173))

(declare-fun m!348175 () Bool)

(assert (=> b!347744 m!348175))

(declare-fun m!348177 () Bool)

(assert (=> b!347740 m!348177))

(check-sat (not b!347741) tp_is_empty!7525 b_and!14769 (not b!347747) (not b!347739) (not mapNonEmpty!12747) (not b!347748) (not b!347740) (not b!347744) (not start!34774) (not b!347745) (not b_next!7573))
(check-sat b_and!14769 (not b_next!7573))
