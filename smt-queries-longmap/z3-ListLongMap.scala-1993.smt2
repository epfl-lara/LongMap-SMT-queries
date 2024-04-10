; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34844 () Bool)

(assert start!34844)

(declare-fun b_free!7629 () Bool)

(declare-fun b_next!7629 () Bool)

(assert (=> start!34844 (= b_free!7629 (not b_next!7629))))

(declare-fun tp!26454 () Bool)

(declare-fun b_and!14851 () Bool)

(assert (=> start!34844 (= tp!26454 b_and!14851)))

(declare-fun b!348939 () Bool)

(declare-fun e!213755 () Bool)

(assert (=> b!348939 (= e!213755 false)))

(declare-fun lt!163969 () (_ BitVec 32))

(declare-datatypes ((array!18747 0))(
  ( (array!18748 (arr!8883 (Array (_ BitVec 32) (_ BitVec 64))) (size!9235 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18747)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18747 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348939 (= lt!163969 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12831 () Bool)

(declare-fun mapRes!12831 () Bool)

(assert (=> mapIsEmpty!12831 mapRes!12831))

(declare-fun b!348940 () Bool)

(declare-fun e!213756 () Bool)

(declare-fun e!213757 () Bool)

(assert (=> b!348940 (= e!213756 (and e!213757 mapRes!12831))))

(declare-fun condMapEmpty!12831 () Bool)

(declare-datatypes ((V!11085 0))(
  ( (V!11086 (val!3835 Int)) )
))
(declare-datatypes ((ValueCell!3447 0))(
  ( (ValueCellFull!3447 (v!6018 V!11085)) (EmptyCell!3447) )
))
(declare-datatypes ((array!18749 0))(
  ( (array!18750 (arr!8884 (Array (_ BitVec 32) ValueCell!3447)) (size!9236 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18749)

(declare-fun mapDefault!12831 () ValueCell!3447)

(assert (=> b!348940 (= condMapEmpty!12831 (= (arr!8884 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3447)) mapDefault!12831)))))

(declare-fun b!348941 () Bool)

(declare-fun res!193382 () Bool)

(declare-fun e!213754 () Bool)

(assert (=> b!348941 (=> (not res!193382) (not e!213754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348941 (= res!193382 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12831 () Bool)

(declare-fun tp!26453 () Bool)

(declare-fun e!213758 () Bool)

(assert (=> mapNonEmpty!12831 (= mapRes!12831 (and tp!26453 e!213758))))

(declare-fun mapRest!12831 () (Array (_ BitVec 32) ValueCell!3447))

(declare-fun mapKey!12831 () (_ BitVec 32))

(declare-fun mapValue!12831 () ValueCell!3447)

(assert (=> mapNonEmpty!12831 (= (arr!8884 _values!1525) (store mapRest!12831 mapKey!12831 mapValue!12831))))

(declare-fun b!348942 () Bool)

(declare-fun res!193383 () Bool)

(assert (=> b!348942 (=> (not res!193383) (not e!213754))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18747 (_ BitVec 32)) Bool)

(assert (=> b!348942 (= res!193383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348943 () Bool)

(declare-fun res!193378 () Bool)

(assert (=> b!348943 (=> (not res!193378) (not e!213755))))

(declare-fun arrayContainsKey!0 (array!18747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348943 (= res!193378 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348938 () Bool)

(assert (=> b!348938 (= e!213754 e!213755)))

(declare-fun res!193380 () Bool)

(assert (=> b!348938 (=> (not res!193380) (not e!213755))))

(declare-datatypes ((SeekEntryResult!3424 0))(
  ( (MissingZero!3424 (index!15875 (_ BitVec 32))) (Found!3424 (index!15876 (_ BitVec 32))) (Intermediate!3424 (undefined!4236 Bool) (index!15877 (_ BitVec 32)) (x!34760 (_ BitVec 32))) (Undefined!3424) (MissingVacant!3424 (index!15878 (_ BitVec 32))) )
))
(declare-fun lt!163968 () SeekEntryResult!3424)

(get-info :version)

(assert (=> b!348938 (= res!193380 (and (not ((_ is Found!3424) lt!163968)) ((_ is MissingZero!3424) lt!163968)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18747 (_ BitVec 32)) SeekEntryResult!3424)

(assert (=> b!348938 (= lt!163968 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!193379 () Bool)

(assert (=> start!34844 (=> (not res!193379) (not e!213754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34844 (= res!193379 (validMask!0 mask!2385))))

(assert (=> start!34844 e!213754))

(assert (=> start!34844 true))

(declare-fun tp_is_empty!7581 () Bool)

(assert (=> start!34844 tp_is_empty!7581))

(assert (=> start!34844 tp!26454))

(declare-fun array_inv!6570 (array!18749) Bool)

(assert (=> start!34844 (and (array_inv!6570 _values!1525) e!213756)))

(declare-fun array_inv!6571 (array!18747) Bool)

(assert (=> start!34844 (array_inv!6571 _keys!1895)))

(declare-fun b!348944 () Bool)

(declare-fun res!193381 () Bool)

(assert (=> b!348944 (=> (not res!193381) (not e!213754))))

(declare-fun zeroValue!1467 () V!11085)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11085)

(declare-datatypes ((tuple2!5540 0))(
  ( (tuple2!5541 (_1!2781 (_ BitVec 64)) (_2!2781 V!11085)) )
))
(declare-datatypes ((List!5162 0))(
  ( (Nil!5159) (Cons!5158 (h!6014 tuple2!5540) (t!10292 List!5162)) )
))
(declare-datatypes ((ListLongMap!4453 0))(
  ( (ListLongMap!4454 (toList!2242 List!5162)) )
))
(declare-fun contains!2307 (ListLongMap!4453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1763 (array!18747 array!18749 (_ BitVec 32) (_ BitVec 32) V!11085 V!11085 (_ BitVec 32) Int) ListLongMap!4453)

(assert (=> b!348944 (= res!193381 (not (contains!2307 (getCurrentListMap!1763 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348945 () Bool)

(assert (=> b!348945 (= e!213758 tp_is_empty!7581)))

(declare-fun b!348946 () Bool)

(assert (=> b!348946 (= e!213757 tp_is_empty!7581)))

(declare-fun b!348947 () Bool)

(declare-fun res!193377 () Bool)

(assert (=> b!348947 (=> (not res!193377) (not e!213754))))

(declare-datatypes ((List!5163 0))(
  ( (Nil!5160) (Cons!5159 (h!6015 (_ BitVec 64)) (t!10293 List!5163)) )
))
(declare-fun arrayNoDuplicates!0 (array!18747 (_ BitVec 32) List!5163) Bool)

(assert (=> b!348947 (= res!193377 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5160))))

(declare-fun b!348948 () Bool)

(declare-fun res!193384 () Bool)

(assert (=> b!348948 (=> (not res!193384) (not e!213754))))

(assert (=> b!348948 (= res!193384 (and (= (size!9236 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9235 _keys!1895) (size!9236 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34844 res!193379) b!348948))

(assert (= (and b!348948 res!193384) b!348942))

(assert (= (and b!348942 res!193383) b!348947))

(assert (= (and b!348947 res!193377) b!348941))

(assert (= (and b!348941 res!193382) b!348944))

(assert (= (and b!348944 res!193381) b!348938))

(assert (= (and b!348938 res!193380) b!348943))

(assert (= (and b!348943 res!193378) b!348939))

(assert (= (and b!348940 condMapEmpty!12831) mapIsEmpty!12831))

(assert (= (and b!348940 (not condMapEmpty!12831)) mapNonEmpty!12831))

(assert (= (and mapNonEmpty!12831 ((_ is ValueCellFull!3447) mapValue!12831)) b!348945))

(assert (= (and b!348940 ((_ is ValueCellFull!3447) mapDefault!12831)) b!348946))

(assert (= start!34844 b!348940))

(declare-fun m!349573 () Bool)

(assert (=> mapNonEmpty!12831 m!349573))

(declare-fun m!349575 () Bool)

(assert (=> b!348942 m!349575))

(declare-fun m!349577 () Bool)

(assert (=> b!348939 m!349577))

(declare-fun m!349579 () Bool)

(assert (=> start!34844 m!349579))

(declare-fun m!349581 () Bool)

(assert (=> start!34844 m!349581))

(declare-fun m!349583 () Bool)

(assert (=> start!34844 m!349583))

(declare-fun m!349585 () Bool)

(assert (=> b!348944 m!349585))

(assert (=> b!348944 m!349585))

(declare-fun m!349587 () Bool)

(assert (=> b!348944 m!349587))

(declare-fun m!349589 () Bool)

(assert (=> b!348943 m!349589))

(declare-fun m!349591 () Bool)

(assert (=> b!348947 m!349591))

(declare-fun m!349593 () Bool)

(assert (=> b!348938 m!349593))

(declare-fun m!349595 () Bool)

(assert (=> b!348941 m!349595))

(check-sat (not b_next!7629) b_and!14851 (not start!34844) (not mapNonEmpty!12831) (not b!348947) (not b!348942) (not b!348943) (not b!348939) tp_is_empty!7581 (not b!348938) (not b!348941) (not b!348944))
(check-sat b_and!14851 (not b_next!7629))
