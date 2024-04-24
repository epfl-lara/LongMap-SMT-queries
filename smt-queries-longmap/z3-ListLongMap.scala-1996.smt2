; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34890 () Bool)

(assert start!34890)

(declare-fun b_free!7645 () Bool)

(declare-fun b_next!7645 () Bool)

(assert (=> start!34890 (= b_free!7645 (not b_next!7645))))

(declare-fun tp!26508 () Bool)

(declare-fun b_and!14885 () Bool)

(assert (=> start!34890 (= tp!26508 b_and!14885)))

(declare-fun b!349438 () Bool)

(declare-fun e!214054 () Bool)

(declare-fun tp_is_empty!7597 () Bool)

(assert (=> b!349438 (= e!214054 tp_is_empty!7597)))

(declare-fun b!349439 () Bool)

(declare-fun res!193679 () Bool)

(declare-fun e!214056 () Bool)

(assert (=> b!349439 (=> (not res!193679) (not e!214056))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11107 0))(
  ( (V!11108 (val!3843 Int)) )
))
(declare-fun zeroValue!1467 () V!11107)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3455 0))(
  ( (ValueCellFull!3455 (v!6029 V!11107)) (EmptyCell!3455) )
))
(declare-datatypes ((array!18768 0))(
  ( (array!18769 (arr!8891 (Array (_ BitVec 32) ValueCell!3455)) (size!9243 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18768)

(declare-datatypes ((array!18770 0))(
  ( (array!18771 (arr!8892 (Array (_ BitVec 32) (_ BitVec 64))) (size!9244 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18770)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11107)

(declare-datatypes ((tuple2!5468 0))(
  ( (tuple2!5469 (_1!2745 (_ BitVec 64)) (_2!2745 V!11107)) )
))
(declare-datatypes ((List!5074 0))(
  ( (Nil!5071) (Cons!5070 (h!5926 tuple2!5468) (t!10200 List!5074)) )
))
(declare-datatypes ((ListLongMap!4383 0))(
  ( (ListLongMap!4384 (toList!2207 List!5074)) )
))
(declare-fun contains!2293 (ListLongMap!4383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1735 (array!18770 array!18768 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 32) Int) ListLongMap!4383)

(assert (=> b!349439 (= res!193679 (not (contains!2293 (getCurrentListMap!1735 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12861 () Bool)

(declare-fun mapRes!12861 () Bool)

(declare-fun tp!26507 () Bool)

(declare-fun e!214058 () Bool)

(assert (=> mapNonEmpty!12861 (= mapRes!12861 (and tp!26507 e!214058))))

(declare-fun mapKey!12861 () (_ BitVec 32))

(declare-fun mapValue!12861 () ValueCell!3455)

(declare-fun mapRest!12861 () (Array (_ BitVec 32) ValueCell!3455))

(assert (=> mapNonEmpty!12861 (= (arr!8891 _values!1525) (store mapRest!12861 mapKey!12861 mapValue!12861))))

(declare-fun b!349440 () Bool)

(declare-fun res!193684 () Bool)

(assert (=> b!349440 (=> (not res!193684) (not e!214056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349440 (= res!193684 (validKeyInArray!0 k0!1348))))

(declare-fun b!349441 () Bool)

(declare-fun res!193681 () Bool)

(declare-fun e!214059 () Bool)

(assert (=> b!349441 (=> (not res!193681) (not e!214059))))

(declare-fun arrayContainsKey!0 (array!18770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349441 (= res!193681 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349442 () Bool)

(declare-fun res!193685 () Bool)

(assert (=> b!349442 (=> (not res!193685) (not e!214056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18770 (_ BitVec 32)) Bool)

(assert (=> b!349442 (= res!193685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349444 () Bool)

(assert (=> b!349444 (= e!214056 e!214059)))

(declare-fun res!193682 () Bool)

(assert (=> b!349444 (=> (not res!193682) (not e!214059))))

(declare-datatypes ((SeekEntryResult!3380 0))(
  ( (MissingZero!3380 (index!15699 (_ BitVec 32))) (Found!3380 (index!15700 (_ BitVec 32))) (Intermediate!3380 (undefined!4192 Bool) (index!15701 (_ BitVec 32)) (x!34757 (_ BitVec 32))) (Undefined!3380) (MissingVacant!3380 (index!15702 (_ BitVec 32))) )
))
(declare-fun lt!164233 () SeekEntryResult!3380)

(get-info :version)

(assert (=> b!349444 (= res!193682 (and (not ((_ is Found!3380) lt!164233)) ((_ is MissingZero!3380) lt!164233)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18770 (_ BitVec 32)) SeekEntryResult!3380)

(assert (=> b!349444 (= lt!164233 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349445 () Bool)

(assert (=> b!349445 (= e!214059 (not true))))

(assert (=> b!349445 false))

(declare-datatypes ((Unit!10785 0))(
  ( (Unit!10786) )
))
(declare-fun lt!164232 () Unit!10785)

(declare-fun lemmaArrayContainsKeyThenInListMap!323 (array!18770 array!18768 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 64) (_ BitVec 32) Int) Unit!10785)

(declare-fun arrayScanForKey!0 (array!18770 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349445 (= lt!164232 (lemmaArrayContainsKeyThenInListMap!323 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!349446 () Bool)

(assert (=> b!349446 (= e!214058 tp_is_empty!7597)))

(declare-fun mapIsEmpty!12861 () Bool)

(assert (=> mapIsEmpty!12861 mapRes!12861))

(declare-fun b!349447 () Bool)

(declare-fun res!193686 () Bool)

(assert (=> b!349447 (=> (not res!193686) (not e!214056))))

(declare-datatypes ((List!5075 0))(
  ( (Nil!5072) (Cons!5071 (h!5927 (_ BitVec 64)) (t!10201 List!5075)) )
))
(declare-fun arrayNoDuplicates!0 (array!18770 (_ BitVec 32) List!5075) Bool)

(assert (=> b!349447 (= res!193686 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5072))))

(declare-fun b!349448 () Bool)

(declare-fun res!193680 () Bool)

(assert (=> b!349448 (=> (not res!193680) (not e!214056))))

(assert (=> b!349448 (= res!193680 (and (= (size!9243 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9244 _keys!1895) (size!9243 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!193683 () Bool)

(assert (=> start!34890 (=> (not res!193683) (not e!214056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34890 (= res!193683 (validMask!0 mask!2385))))

(assert (=> start!34890 e!214056))

(assert (=> start!34890 true))

(assert (=> start!34890 tp_is_empty!7597))

(assert (=> start!34890 tp!26508))

(declare-fun e!214055 () Bool)

(declare-fun array_inv!6570 (array!18768) Bool)

(assert (=> start!34890 (and (array_inv!6570 _values!1525) e!214055)))

(declare-fun array_inv!6571 (array!18770) Bool)

(assert (=> start!34890 (array_inv!6571 _keys!1895)))

(declare-fun b!349443 () Bool)

(assert (=> b!349443 (= e!214055 (and e!214054 mapRes!12861))))

(declare-fun condMapEmpty!12861 () Bool)

(declare-fun mapDefault!12861 () ValueCell!3455)

(assert (=> b!349443 (= condMapEmpty!12861 (= (arr!8891 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3455)) mapDefault!12861)))))

(assert (= (and start!34890 res!193683) b!349448))

(assert (= (and b!349448 res!193680) b!349442))

(assert (= (and b!349442 res!193685) b!349447))

(assert (= (and b!349447 res!193686) b!349440))

(assert (= (and b!349440 res!193684) b!349439))

(assert (= (and b!349439 res!193679) b!349444))

(assert (= (and b!349444 res!193682) b!349441))

(assert (= (and b!349441 res!193681) b!349445))

(assert (= (and b!349443 condMapEmpty!12861) mapIsEmpty!12861))

(assert (= (and b!349443 (not condMapEmpty!12861)) mapNonEmpty!12861))

(assert (= (and mapNonEmpty!12861 ((_ is ValueCellFull!3455) mapValue!12861)) b!349446))

(assert (= (and b!349443 ((_ is ValueCellFull!3455) mapDefault!12861)) b!349438))

(assert (= start!34890 b!349443))

(declare-fun m!350199 () Bool)

(assert (=> b!349445 m!350199))

(assert (=> b!349445 m!350199))

(declare-fun m!350201 () Bool)

(assert (=> b!349445 m!350201))

(declare-fun m!350203 () Bool)

(assert (=> b!349440 m!350203))

(declare-fun m!350205 () Bool)

(assert (=> b!349447 m!350205))

(declare-fun m!350207 () Bool)

(assert (=> mapNonEmpty!12861 m!350207))

(declare-fun m!350209 () Bool)

(assert (=> b!349444 m!350209))

(declare-fun m!350211 () Bool)

(assert (=> b!349442 m!350211))

(declare-fun m!350213 () Bool)

(assert (=> b!349439 m!350213))

(assert (=> b!349439 m!350213))

(declare-fun m!350215 () Bool)

(assert (=> b!349439 m!350215))

(declare-fun m!350217 () Bool)

(assert (=> start!34890 m!350217))

(declare-fun m!350219 () Bool)

(assert (=> start!34890 m!350219))

(declare-fun m!350221 () Bool)

(assert (=> start!34890 m!350221))

(declare-fun m!350223 () Bool)

(assert (=> b!349441 m!350223))

(check-sat (not b!349447) (not b!349440) (not start!34890) (not b!349442) b_and!14885 tp_is_empty!7597 (not b!349439) (not b!349444) (not b!349441) (not mapNonEmpty!12861) (not b!349445) (not b_next!7645))
(check-sat b_and!14885 (not b_next!7645))
