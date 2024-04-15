; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34822 () Bool)

(assert start!34822)

(declare-fun b_free!7621 () Bool)

(declare-fun b_next!7621 () Bool)

(assert (=> start!34822 (= b_free!7621 (not b_next!7621))))

(declare-fun tp!26429 () Bool)

(declare-fun b_and!14817 () Bool)

(assert (=> start!34822 (= tp!26429 b_and!14817)))

(declare-fun mapNonEmpty!12819 () Bool)

(declare-fun mapRes!12819 () Bool)

(declare-fun tp!26430 () Bool)

(declare-fun e!213507 () Bool)

(assert (=> mapNonEmpty!12819 (= mapRes!12819 (and tp!26430 e!213507))))

(declare-fun mapKey!12819 () (_ BitVec 32))

(declare-datatypes ((V!11075 0))(
  ( (V!11076 (val!3831 Int)) )
))
(declare-datatypes ((ValueCell!3443 0))(
  ( (ValueCellFull!3443 (v!6008 V!11075)) (EmptyCell!3443) )
))
(declare-fun mapValue!12819 () ValueCell!3443)

(declare-datatypes ((array!18713 0))(
  ( (array!18714 (arr!8866 (Array (_ BitVec 32) ValueCell!3443)) (size!9219 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18713)

(declare-fun mapRest!12819 () (Array (_ BitVec 32) ValueCell!3443))

(assert (=> mapNonEmpty!12819 (= (arr!8866 _values!1525) (store mapRest!12819 mapKey!12819 mapValue!12819))))

(declare-fun b!348532 () Bool)

(declare-fun res!193153 () Bool)

(declare-fun e!213510 () Bool)

(assert (=> b!348532 (=> (not res!193153) (not e!213510))))

(declare-datatypes ((array!18715 0))(
  ( (array!18716 (arr!8867 (Array (_ BitVec 32) (_ BitVec 64))) (size!9220 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18715)

(declare-datatypes ((List!5117 0))(
  ( (Nil!5114) (Cons!5113 (h!5969 (_ BitVec 64)) (t!10238 List!5117)) )
))
(declare-fun arrayNoDuplicates!0 (array!18715 (_ BitVec 32) List!5117) Bool)

(assert (=> b!348532 (= res!193153 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5114))))

(declare-fun b!348533 () Bool)

(declare-fun res!193154 () Bool)

(assert (=> b!348533 (=> (not res!193154) (not e!213510))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348533 (= res!193154 (and (= (size!9219 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9220 _keys!1895) (size!9219 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348534 () Bool)

(declare-fun e!213506 () Bool)

(assert (=> b!348534 (= e!213506 false)))

(declare-fun lt!163710 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18715 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348534 (= lt!163710 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348535 () Bool)

(declare-fun res!193157 () Bool)

(assert (=> b!348535 (=> (not res!193157) (not e!213510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18715 (_ BitVec 32)) Bool)

(assert (=> b!348535 (= res!193157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348536 () Bool)

(assert (=> b!348536 (= e!213510 e!213506)))

(declare-fun res!193152 () Bool)

(assert (=> b!348536 (=> (not res!193152) (not e!213506))))

(declare-datatypes ((SeekEntryResult!3417 0))(
  ( (MissingZero!3417 (index!15847 (_ BitVec 32))) (Found!3417 (index!15848 (_ BitVec 32))) (Intermediate!3417 (undefined!4229 Bool) (index!15849 (_ BitVec 32)) (x!34740 (_ BitVec 32))) (Undefined!3417) (MissingVacant!3417 (index!15850 (_ BitVec 32))) )
))
(declare-fun lt!163709 () SeekEntryResult!3417)

(get-info :version)

(assert (=> b!348536 (= res!193152 (and (not ((_ is Found!3417) lt!163709)) ((_ is MissingZero!3417) lt!163709)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18715 (_ BitVec 32)) SeekEntryResult!3417)

(assert (=> b!348536 (= lt!163709 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12819 () Bool)

(assert (=> mapIsEmpty!12819 mapRes!12819))

(declare-fun b!348537 () Bool)

(declare-fun res!193156 () Bool)

(assert (=> b!348537 (=> (not res!193156) (not e!213506))))

(declare-fun arrayContainsKey!0 (array!18715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348537 (= res!193156 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!193159 () Bool)

(assert (=> start!34822 (=> (not res!193159) (not e!213510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34822 (= res!193159 (validMask!0 mask!2385))))

(assert (=> start!34822 e!213510))

(assert (=> start!34822 true))

(declare-fun tp_is_empty!7573 () Bool)

(assert (=> start!34822 tp_is_empty!7573))

(assert (=> start!34822 tp!26429))

(declare-fun e!213508 () Bool)

(declare-fun array_inv!6580 (array!18713) Bool)

(assert (=> start!34822 (and (array_inv!6580 _values!1525) e!213508)))

(declare-fun array_inv!6581 (array!18715) Bool)

(assert (=> start!34822 (array_inv!6581 _keys!1895)))

(declare-fun b!348531 () Bool)

(declare-fun res!193158 () Bool)

(assert (=> b!348531 (=> (not res!193158) (not e!213510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348531 (= res!193158 (validKeyInArray!0 k0!1348))))

(declare-fun b!348538 () Bool)

(declare-fun res!193155 () Bool)

(assert (=> b!348538 (=> (not res!193155) (not e!213510))))

(declare-fun zeroValue!1467 () V!11075)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11075)

(declare-datatypes ((tuple2!5502 0))(
  ( (tuple2!5503 (_1!2762 (_ BitVec 64)) (_2!2762 V!11075)) )
))
(declare-datatypes ((List!5118 0))(
  ( (Nil!5115) (Cons!5114 (h!5970 tuple2!5502) (t!10239 List!5118)) )
))
(declare-datatypes ((ListLongMap!4405 0))(
  ( (ListLongMap!4406 (toList!2218 List!5118)) )
))
(declare-fun contains!2294 (ListLongMap!4405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1723 (array!18715 array!18713 (_ BitVec 32) (_ BitVec 32) V!11075 V!11075 (_ BitVec 32) Int) ListLongMap!4405)

(assert (=> b!348538 (= res!193155 (not (contains!2294 (getCurrentListMap!1723 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348539 () Bool)

(declare-fun e!213505 () Bool)

(assert (=> b!348539 (= e!213508 (and e!213505 mapRes!12819))))

(declare-fun condMapEmpty!12819 () Bool)

(declare-fun mapDefault!12819 () ValueCell!3443)

(assert (=> b!348539 (= condMapEmpty!12819 (= (arr!8866 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3443)) mapDefault!12819)))))

(declare-fun b!348540 () Bool)

(assert (=> b!348540 (= e!213505 tp_is_empty!7573)))

(declare-fun b!348541 () Bool)

(assert (=> b!348541 (= e!213507 tp_is_empty!7573)))

(assert (= (and start!34822 res!193159) b!348533))

(assert (= (and b!348533 res!193154) b!348535))

(assert (= (and b!348535 res!193157) b!348532))

(assert (= (and b!348532 res!193153) b!348531))

(assert (= (and b!348531 res!193158) b!348538))

(assert (= (and b!348538 res!193155) b!348536))

(assert (= (and b!348536 res!193152) b!348537))

(assert (= (and b!348537 res!193156) b!348534))

(assert (= (and b!348539 condMapEmpty!12819) mapIsEmpty!12819))

(assert (= (and b!348539 (not condMapEmpty!12819)) mapNonEmpty!12819))

(assert (= (and mapNonEmpty!12819 ((_ is ValueCellFull!3443) mapValue!12819)) b!348541))

(assert (= (and b!348539 ((_ is ValueCellFull!3443) mapDefault!12819)) b!348540))

(assert (= start!34822 b!348539))

(declare-fun m!348747 () Bool)

(assert (=> b!348535 m!348747))

(declare-fun m!348749 () Bool)

(assert (=> b!348532 m!348749))

(declare-fun m!348751 () Bool)

(assert (=> b!348536 m!348751))

(declare-fun m!348753 () Bool)

(assert (=> b!348534 m!348753))

(declare-fun m!348755 () Bool)

(assert (=> b!348537 m!348755))

(declare-fun m!348757 () Bool)

(assert (=> mapNonEmpty!12819 m!348757))

(declare-fun m!348759 () Bool)

(assert (=> b!348538 m!348759))

(assert (=> b!348538 m!348759))

(declare-fun m!348761 () Bool)

(assert (=> b!348538 m!348761))

(declare-fun m!348763 () Bool)

(assert (=> b!348531 m!348763))

(declare-fun m!348765 () Bool)

(assert (=> start!34822 m!348765))

(declare-fun m!348767 () Bool)

(assert (=> start!34822 m!348767))

(declare-fun m!348769 () Bool)

(assert (=> start!34822 m!348769))

(check-sat (not b!348532) (not b!348534) (not b_next!7621) (not mapNonEmpty!12819) (not b!348536) tp_is_empty!7573 (not b!348531) (not b!348538) b_and!14817 (not start!34822) (not b!348535) (not b!348537))
(check-sat b_and!14817 (not b_next!7621))
