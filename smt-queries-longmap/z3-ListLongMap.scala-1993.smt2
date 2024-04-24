; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34828 () Bool)

(assert start!34828)

(declare-fun b_free!7627 () Bool)

(declare-fun b_next!7627 () Bool)

(assert (=> start!34828 (= b_free!7627 (not b_next!7627))))

(declare-fun tp!26447 () Bool)

(declare-fun b_and!14863 () Bool)

(assert (=> start!34828 (= tp!26447 b_and!14863)))

(declare-fun b!348852 () Bool)

(declare-fun res!193350 () Bool)

(declare-fun e!213704 () Bool)

(assert (=> b!348852 (=> (not res!193350) (not e!213704))))

(declare-datatypes ((array!18728 0))(
  ( (array!18729 (arr!8873 (Array (_ BitVec 32) (_ BitVec 64))) (size!9225 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18728)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18728 (_ BitVec 32)) Bool)

(assert (=> b!348852 (= res!193350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12828 () Bool)

(declare-fun mapRes!12828 () Bool)

(declare-fun tp!26448 () Bool)

(declare-fun e!213702 () Bool)

(assert (=> mapNonEmpty!12828 (= mapRes!12828 (and tp!26448 e!213702))))

(declare-fun mapKey!12828 () (_ BitVec 32))

(declare-datatypes ((V!11083 0))(
  ( (V!11084 (val!3834 Int)) )
))
(declare-datatypes ((ValueCell!3446 0))(
  ( (ValueCellFull!3446 (v!6018 V!11083)) (EmptyCell!3446) )
))
(declare-fun mapRest!12828 () (Array (_ BitVec 32) ValueCell!3446))

(declare-fun mapValue!12828 () ValueCell!3446)

(declare-datatypes ((array!18730 0))(
  ( (array!18731 (arr!8874 (Array (_ BitVec 32) ValueCell!3446)) (size!9226 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18730)

(assert (=> mapNonEmpty!12828 (= (arr!8874 _values!1525) (store mapRest!12828 mapKey!12828 mapValue!12828))))

(declare-fun b!348853 () Bool)

(declare-fun e!213705 () Bool)

(assert (=> b!348853 (= e!213704 e!213705)))

(declare-fun res!193356 () Bool)

(assert (=> b!348853 (=> (not res!193356) (not e!213705))))

(declare-datatypes ((SeekEntryResult!3376 0))(
  ( (MissingZero!3376 (index!15683 (_ BitVec 32))) (Found!3376 (index!15684 (_ BitVec 32))) (Intermediate!3376 (undefined!4188 Bool) (index!15685 (_ BitVec 32)) (x!34709 (_ BitVec 32))) (Undefined!3376) (MissingVacant!3376 (index!15686 (_ BitVec 32))) )
))
(declare-fun lt!163980 () SeekEntryResult!3376)

(get-info :version)

(assert (=> b!348853 (= res!193356 (and (not ((_ is Found!3376) lt!163980)) ((_ is MissingZero!3376) lt!163980)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18728 (_ BitVec 32)) SeekEntryResult!3376)

(assert (=> b!348853 (= lt!163980 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348854 () Bool)

(declare-fun res!193351 () Bool)

(assert (=> b!348854 (=> (not res!193351) (not e!213704))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348854 (= res!193351 (and (= (size!9226 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9225 _keys!1895) (size!9226 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348855 () Bool)

(declare-fun tp_is_empty!7579 () Bool)

(assert (=> b!348855 (= e!213702 tp_is_empty!7579)))

(declare-fun mapIsEmpty!12828 () Bool)

(assert (=> mapIsEmpty!12828 mapRes!12828))

(declare-fun b!348856 () Bool)

(declare-fun e!213703 () Bool)

(assert (=> b!348856 (= e!213703 tp_is_empty!7579)))

(declare-fun res!193355 () Bool)

(assert (=> start!34828 (=> (not res!193355) (not e!213704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34828 (= res!193355 (validMask!0 mask!2385))))

(assert (=> start!34828 e!213704))

(assert (=> start!34828 true))

(assert (=> start!34828 tp_is_empty!7579))

(assert (=> start!34828 tp!26447))

(declare-fun e!213706 () Bool)

(declare-fun array_inv!6554 (array!18730) Bool)

(assert (=> start!34828 (and (array_inv!6554 _values!1525) e!213706)))

(declare-fun array_inv!6555 (array!18728) Bool)

(assert (=> start!34828 (array_inv!6555 _keys!1895)))

(declare-fun b!348857 () Bool)

(declare-fun res!193354 () Bool)

(assert (=> b!348857 (=> (not res!193354) (not e!213704))))

(declare-fun zeroValue!1467 () V!11083)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11083)

(declare-datatypes ((tuple2!5456 0))(
  ( (tuple2!5457 (_1!2739 (_ BitVec 64)) (_2!2739 V!11083)) )
))
(declare-datatypes ((List!5062 0))(
  ( (Nil!5059) (Cons!5058 (h!5914 tuple2!5456) (t!10184 List!5062)) )
))
(declare-datatypes ((ListLongMap!4371 0))(
  ( (ListLongMap!4372 (toList!2201 List!5062)) )
))
(declare-fun contains!2285 (ListLongMap!4371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1729 (array!18728 array!18730 (_ BitVec 32) (_ BitVec 32) V!11083 V!11083 (_ BitVec 32) Int) ListLongMap!4371)

(assert (=> b!348857 (= res!193354 (not (contains!2285 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348858 () Bool)

(assert (=> b!348858 (= e!213706 (and e!213703 mapRes!12828))))

(declare-fun condMapEmpty!12828 () Bool)

(declare-fun mapDefault!12828 () ValueCell!3446)

(assert (=> b!348858 (= condMapEmpty!12828 (= (arr!8874 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3446)) mapDefault!12828)))))

(declare-fun b!348859 () Bool)

(declare-fun res!193357 () Bool)

(assert (=> b!348859 (=> (not res!193357) (not e!213704))))

(declare-datatypes ((List!5063 0))(
  ( (Nil!5060) (Cons!5059 (h!5915 (_ BitVec 64)) (t!10185 List!5063)) )
))
(declare-fun arrayNoDuplicates!0 (array!18728 (_ BitVec 32) List!5063) Bool)

(assert (=> b!348859 (= res!193357 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5060))))

(declare-fun b!348860 () Bool)

(declare-fun res!193352 () Bool)

(assert (=> b!348860 (=> (not res!193352) (not e!213704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348860 (= res!193352 (validKeyInArray!0 k0!1348))))

(declare-fun b!348861 () Bool)

(assert (=> b!348861 (= e!213705 false)))

(declare-fun lt!163981 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18728 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348861 (= lt!163981 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348862 () Bool)

(declare-fun res!193353 () Bool)

(assert (=> b!348862 (=> (not res!193353) (not e!213705))))

(declare-fun arrayContainsKey!0 (array!18728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348862 (= res!193353 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34828 res!193355) b!348854))

(assert (= (and b!348854 res!193351) b!348852))

(assert (= (and b!348852 res!193350) b!348859))

(assert (= (and b!348859 res!193357) b!348860))

(assert (= (and b!348860 res!193352) b!348857))

(assert (= (and b!348857 res!193354) b!348853))

(assert (= (and b!348853 res!193356) b!348862))

(assert (= (and b!348862 res!193353) b!348861))

(assert (= (and b!348858 condMapEmpty!12828) mapIsEmpty!12828))

(assert (= (and b!348858 (not condMapEmpty!12828)) mapNonEmpty!12828))

(assert (= (and mapNonEmpty!12828 ((_ is ValueCellFull!3446) mapValue!12828)) b!348855))

(assert (= (and b!348858 ((_ is ValueCellFull!3446) mapDefault!12828)) b!348856))

(assert (= start!34828 b!348858))

(declare-fun m!349773 () Bool)

(assert (=> b!348859 m!349773))

(declare-fun m!349775 () Bool)

(assert (=> b!348853 m!349775))

(declare-fun m!349777 () Bool)

(assert (=> b!348862 m!349777))

(declare-fun m!349779 () Bool)

(assert (=> start!34828 m!349779))

(declare-fun m!349781 () Bool)

(assert (=> start!34828 m!349781))

(declare-fun m!349783 () Bool)

(assert (=> start!34828 m!349783))

(declare-fun m!349785 () Bool)

(assert (=> mapNonEmpty!12828 m!349785))

(declare-fun m!349787 () Bool)

(assert (=> b!348860 m!349787))

(declare-fun m!349789 () Bool)

(assert (=> b!348857 m!349789))

(assert (=> b!348857 m!349789))

(declare-fun m!349791 () Bool)

(assert (=> b!348857 m!349791))

(declare-fun m!349793 () Bool)

(assert (=> b!348852 m!349793))

(declare-fun m!349795 () Bool)

(assert (=> b!348861 m!349795))

(check-sat tp_is_empty!7579 (not mapNonEmpty!12828) (not b_next!7627) (not start!34828) (not b!348861) (not b!348852) (not b!348853) (not b!348862) (not b!348857) b_and!14863 (not b!348859) (not b!348860))
(check-sat b_and!14863 (not b_next!7627))
