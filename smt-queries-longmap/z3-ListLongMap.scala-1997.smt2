; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34896 () Bool)

(assert start!34896)

(declare-fun b_free!7651 () Bool)

(declare-fun b_next!7651 () Bool)

(assert (=> start!34896 (= b_free!7651 (not b_next!7651))))

(declare-fun tp!26525 () Bool)

(declare-fun b_and!14891 () Bool)

(assert (=> start!34896 (= tp!26525 b_and!14891)))

(declare-fun b!349539 () Bool)

(declare-fun res!193752 () Bool)

(declare-fun e!214111 () Bool)

(assert (=> b!349539 (=> (not res!193752) (not e!214111))))

(declare-datatypes ((array!18780 0))(
  ( (array!18781 (arr!8897 (Array (_ BitVec 32) (_ BitVec 64))) (size!9249 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18780)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18780 (_ BitVec 32)) Bool)

(assert (=> b!349539 (= res!193752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!193755 () Bool)

(assert (=> start!34896 (=> (not res!193755) (not e!214111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34896 (= res!193755 (validMask!0 mask!2385))))

(assert (=> start!34896 e!214111))

(assert (=> start!34896 true))

(declare-fun tp_is_empty!7603 () Bool)

(assert (=> start!34896 tp_is_empty!7603))

(assert (=> start!34896 tp!26525))

(declare-datatypes ((V!11115 0))(
  ( (V!11116 (val!3846 Int)) )
))
(declare-datatypes ((ValueCell!3458 0))(
  ( (ValueCellFull!3458 (v!6032 V!11115)) (EmptyCell!3458) )
))
(declare-datatypes ((array!18782 0))(
  ( (array!18783 (arr!8898 (Array (_ BitVec 32) ValueCell!3458)) (size!9250 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18782)

(declare-fun e!214113 () Bool)

(declare-fun array_inv!6574 (array!18782) Bool)

(assert (=> start!34896 (and (array_inv!6574 _values!1525) e!214113)))

(declare-fun array_inv!6575 (array!18780) Bool)

(assert (=> start!34896 (array_inv!6575 _keys!1895)))

(declare-fun b!349540 () Bool)

(declare-fun e!214112 () Bool)

(assert (=> b!349540 (= e!214112 tp_is_empty!7603)))

(declare-fun b!349541 () Bool)

(declare-datatypes ((Unit!10789 0))(
  ( (Unit!10790) )
))
(declare-fun e!214114 () Unit!10789)

(declare-fun Unit!10791 () Unit!10789)

(assert (=> b!349541 (= e!214114 Unit!10791)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11115)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11115)

(declare-fun lt!164256 () Unit!10789)

(declare-fun lemmaArrayContainsKeyThenInListMap!325 (array!18780 array!18782 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 64) (_ BitVec 32) Int) Unit!10789)

(declare-fun arrayScanForKey!0 (array!18780 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349541 (= lt!164256 (lemmaArrayContainsKeyThenInListMap!325 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349541 false))

(declare-fun mapNonEmpty!12870 () Bool)

(declare-fun mapRes!12870 () Bool)

(declare-fun tp!26526 () Bool)

(assert (=> mapNonEmpty!12870 (= mapRes!12870 (and tp!26526 e!214112))))

(declare-fun mapValue!12870 () ValueCell!3458)

(declare-fun mapKey!12870 () (_ BitVec 32))

(declare-fun mapRest!12870 () (Array (_ BitVec 32) ValueCell!3458))

(assert (=> mapNonEmpty!12870 (= (arr!8898 _values!1525) (store mapRest!12870 mapKey!12870 mapValue!12870))))

(declare-fun mapIsEmpty!12870 () Bool)

(assert (=> mapIsEmpty!12870 mapRes!12870))

(declare-fun b!349542 () Bool)

(declare-fun Unit!10792 () Unit!10789)

(assert (=> b!349542 (= e!214114 Unit!10792)))

(declare-fun b!349543 () Bool)

(declare-fun res!193749 () Bool)

(assert (=> b!349543 (=> (not res!193749) (not e!214111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349543 (= res!193749 (validKeyInArray!0 k0!1348))))

(declare-fun b!349544 () Bool)

(declare-fun e!214116 () Bool)

(assert (=> b!349544 (= e!214113 (and e!214116 mapRes!12870))))

(declare-fun condMapEmpty!12870 () Bool)

(declare-fun mapDefault!12870 () ValueCell!3458)

(assert (=> b!349544 (= condMapEmpty!12870 (= (arr!8898 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3458)) mapDefault!12870)))))

(declare-fun b!349545 () Bool)

(declare-fun res!193750 () Bool)

(assert (=> b!349545 (=> (not res!193750) (not e!214111))))

(declare-datatypes ((List!5077 0))(
  ( (Nil!5074) (Cons!5073 (h!5929 (_ BitVec 64)) (t!10203 List!5077)) )
))
(declare-fun arrayNoDuplicates!0 (array!18780 (_ BitVec 32) List!5077) Bool)

(assert (=> b!349545 (= res!193750 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5074))))

(declare-fun b!349546 () Bool)

(declare-fun res!193751 () Bool)

(assert (=> b!349546 (=> (not res!193751) (not e!214111))))

(declare-datatypes ((tuple2!5470 0))(
  ( (tuple2!5471 (_1!2746 (_ BitVec 64)) (_2!2746 V!11115)) )
))
(declare-datatypes ((List!5078 0))(
  ( (Nil!5075) (Cons!5074 (h!5930 tuple2!5470) (t!10204 List!5078)) )
))
(declare-datatypes ((ListLongMap!4385 0))(
  ( (ListLongMap!4386 (toList!2208 List!5078)) )
))
(declare-fun contains!2294 (ListLongMap!4385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1736 (array!18780 array!18782 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 32) Int) ListLongMap!4385)

(assert (=> b!349546 (= res!193751 (not (contains!2294 (getCurrentListMap!1736 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349547 () Bool)

(declare-fun e!214115 () Bool)

(assert (=> b!349547 (= e!214111 e!214115)))

(declare-fun res!193753 () Bool)

(assert (=> b!349547 (=> (not res!193753) (not e!214115))))

(declare-datatypes ((SeekEntryResult!3382 0))(
  ( (MissingZero!3382 (index!15707 (_ BitVec 32))) (Found!3382 (index!15708 (_ BitVec 32))) (Intermediate!3382 (undefined!4194 Bool) (index!15709 (_ BitVec 32)) (x!34767 (_ BitVec 32))) (Undefined!3382) (MissingVacant!3382 (index!15710 (_ BitVec 32))) )
))
(declare-fun lt!164257 () SeekEntryResult!3382)

(get-info :version)

(assert (=> b!349547 (= res!193753 (and (not ((_ is Found!3382) lt!164257)) ((_ is MissingZero!3382) lt!164257)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18780 (_ BitVec 32)) SeekEntryResult!3382)

(assert (=> b!349547 (= lt!164257 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349548 () Bool)

(declare-fun lt!164254 () Bool)

(assert (=> b!349548 (= e!214115 lt!164254)))

(declare-fun lt!164255 () Unit!10789)

(assert (=> b!349548 (= lt!164255 e!214114)))

(declare-fun c!53264 () Bool)

(assert (=> b!349548 (= c!53264 lt!164254)))

(declare-fun arrayContainsKey!0 (array!18780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349548 (= lt!164254 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349549 () Bool)

(declare-fun res!193754 () Bool)

(assert (=> b!349549 (=> (not res!193754) (not e!214111))))

(assert (=> b!349549 (= res!193754 (and (= (size!9250 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9249 _keys!1895) (size!9250 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349550 () Bool)

(assert (=> b!349550 (= e!214116 tp_is_empty!7603)))

(assert (= (and start!34896 res!193755) b!349549))

(assert (= (and b!349549 res!193754) b!349539))

(assert (= (and b!349539 res!193752) b!349545))

(assert (= (and b!349545 res!193750) b!349543))

(assert (= (and b!349543 res!193749) b!349546))

(assert (= (and b!349546 res!193751) b!349547))

(assert (= (and b!349547 res!193753) b!349548))

(assert (= (and b!349548 c!53264) b!349541))

(assert (= (and b!349548 (not c!53264)) b!349542))

(assert (= (and b!349544 condMapEmpty!12870) mapIsEmpty!12870))

(assert (= (and b!349544 (not condMapEmpty!12870)) mapNonEmpty!12870))

(assert (= (and mapNonEmpty!12870 ((_ is ValueCellFull!3458) mapValue!12870)) b!349540))

(assert (= (and b!349544 ((_ is ValueCellFull!3458) mapDefault!12870)) b!349550))

(assert (= start!34896 b!349544))

(declare-fun m!350277 () Bool)

(assert (=> b!349539 m!350277))

(declare-fun m!350279 () Bool)

(assert (=> b!349543 m!350279))

(declare-fun m!350281 () Bool)

(assert (=> b!349545 m!350281))

(declare-fun m!350283 () Bool)

(assert (=> mapNonEmpty!12870 m!350283))

(declare-fun m!350285 () Bool)

(assert (=> b!349541 m!350285))

(assert (=> b!349541 m!350285))

(declare-fun m!350287 () Bool)

(assert (=> b!349541 m!350287))

(declare-fun m!350289 () Bool)

(assert (=> start!34896 m!350289))

(declare-fun m!350291 () Bool)

(assert (=> start!34896 m!350291))

(declare-fun m!350293 () Bool)

(assert (=> start!34896 m!350293))

(declare-fun m!350295 () Bool)

(assert (=> b!349547 m!350295))

(declare-fun m!350297 () Bool)

(assert (=> b!349546 m!350297))

(assert (=> b!349546 m!350297))

(declare-fun m!350299 () Bool)

(assert (=> b!349546 m!350299))

(declare-fun m!350301 () Bool)

(assert (=> b!349548 m!350301))

(check-sat tp_is_empty!7603 (not b!349541) (not mapNonEmpty!12870) (not b!349546) (not b!349547) (not b!349539) (not b!349548) (not b!349543) b_and!14891 (not b_next!7651) (not start!34896) (not b!349545))
(check-sat b_and!14891 (not b_next!7651))
