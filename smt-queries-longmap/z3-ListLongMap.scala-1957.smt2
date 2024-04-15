; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34474 () Bool)

(assert start!34474)

(declare-fun b_free!7411 () Bool)

(declare-fun b_next!7411 () Bool)

(assert (=> start!34474 (= b_free!7411 (not b_next!7411))))

(declare-fun tp!25779 () Bool)

(declare-fun b_and!14593 () Bool)

(assert (=> start!34474 (= tp!25779 b_and!14593)))

(declare-fun b!344321 () Bool)

(declare-fun res!190466 () Bool)

(declare-fun e!211059 () Bool)

(assert (=> b!344321 (=> (not res!190466) (not e!211059))))

(declare-datatypes ((array!18299 0))(
  ( (array!18300 (arr!8666 (Array (_ BitVec 32) (_ BitVec 64))) (size!9019 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18299)

(declare-datatypes ((List!4966 0))(
  ( (Nil!4963) (Cons!4962 (h!5818 (_ BitVec 64)) (t!10073 List!4966)) )
))
(declare-fun arrayNoDuplicates!0 (array!18299 (_ BitVec 32) List!4966) Bool)

(assert (=> b!344321 (= res!190466 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4963))))

(declare-fun b!344322 () Bool)

(declare-fun e!211063 () Bool)

(declare-fun tp_is_empty!7363 () Bool)

(assert (=> b!344322 (= e!211063 tp_is_empty!7363)))

(declare-fun res!190462 () Bool)

(assert (=> start!34474 (=> (not res!190462) (not e!211059))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34474 (= res!190462 (validMask!0 mask!2385))))

(assert (=> start!34474 e!211059))

(assert (=> start!34474 true))

(assert (=> start!34474 tp_is_empty!7363))

(assert (=> start!34474 tp!25779))

(declare-datatypes ((V!10795 0))(
  ( (V!10796 (val!3726 Int)) )
))
(declare-datatypes ((ValueCell!3338 0))(
  ( (ValueCellFull!3338 (v!5896 V!10795)) (EmptyCell!3338) )
))
(declare-datatypes ((array!18301 0))(
  ( (array!18302 (arr!8667 (Array (_ BitVec 32) ValueCell!3338)) (size!9020 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18301)

(declare-fun e!211062 () Bool)

(declare-fun array_inv!6444 (array!18301) Bool)

(assert (=> start!34474 (and (array_inv!6444 _values!1525) e!211062)))

(declare-fun array_inv!6445 (array!18299) Bool)

(assert (=> start!34474 (array_inv!6445 _keys!1895)))

(declare-fun b!344323 () Bool)

(declare-fun res!190461 () Bool)

(assert (=> b!344323 (=> (not res!190461) (not e!211059))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344323 (= res!190461 (validKeyInArray!0 k0!1348))))

(declare-fun b!344324 () Bool)

(declare-fun res!190463 () Bool)

(assert (=> b!344324 (=> (not res!190463) (not e!211059))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344324 (= res!190463 (and (= (size!9020 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9019 _keys!1895) (size!9020 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12483 () Bool)

(declare-fun mapRes!12483 () Bool)

(declare-fun tp!25778 () Bool)

(assert (=> mapNonEmpty!12483 (= mapRes!12483 (and tp!25778 e!211063))))

(declare-fun mapValue!12483 () ValueCell!3338)

(declare-fun mapKey!12483 () (_ BitVec 32))

(declare-fun mapRest!12483 () (Array (_ BitVec 32) ValueCell!3338))

(assert (=> mapNonEmpty!12483 (= (arr!8667 _values!1525) (store mapRest!12483 mapKey!12483 mapValue!12483))))

(declare-fun mapIsEmpty!12483 () Bool)

(assert (=> mapIsEmpty!12483 mapRes!12483))

(declare-fun b!344325 () Bool)

(assert (=> b!344325 (= e!211059 false)))

(declare-datatypes ((SeekEntryResult!3338 0))(
  ( (MissingZero!3338 (index!15531 (_ BitVec 32))) (Found!3338 (index!15532 (_ BitVec 32))) (Intermediate!3338 (undefined!4150 Bool) (index!15533 (_ BitVec 32)) (x!34311 (_ BitVec 32))) (Undefined!3338) (MissingVacant!3338 (index!15534 (_ BitVec 32))) )
))
(declare-fun lt!162456 () SeekEntryResult!3338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18299 (_ BitVec 32)) SeekEntryResult!3338)

(assert (=> b!344325 (= lt!162456 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344326 () Bool)

(declare-fun res!190464 () Bool)

(assert (=> b!344326 (=> (not res!190464) (not e!211059))))

(declare-fun zeroValue!1467 () V!10795)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10795)

(declare-datatypes ((tuple2!5344 0))(
  ( (tuple2!5345 (_1!2683 (_ BitVec 64)) (_2!2683 V!10795)) )
))
(declare-datatypes ((List!4967 0))(
  ( (Nil!4964) (Cons!4963 (h!5819 tuple2!5344) (t!10074 List!4967)) )
))
(declare-datatypes ((ListLongMap!4247 0))(
  ( (ListLongMap!4248 (toList!2139 List!4967)) )
))
(declare-fun contains!2208 (ListLongMap!4247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1645 (array!18299 array!18301 (_ BitVec 32) (_ BitVec 32) V!10795 V!10795 (_ BitVec 32) Int) ListLongMap!4247)

(assert (=> b!344326 (= res!190464 (not (contains!2208 (getCurrentListMap!1645 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344327 () Bool)

(declare-fun e!211060 () Bool)

(assert (=> b!344327 (= e!211060 tp_is_empty!7363)))

(declare-fun b!344328 () Bool)

(assert (=> b!344328 (= e!211062 (and e!211060 mapRes!12483))))

(declare-fun condMapEmpty!12483 () Bool)

(declare-fun mapDefault!12483 () ValueCell!3338)

(assert (=> b!344328 (= condMapEmpty!12483 (= (arr!8667 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3338)) mapDefault!12483)))))

(declare-fun b!344329 () Bool)

(declare-fun res!190465 () Bool)

(assert (=> b!344329 (=> (not res!190465) (not e!211059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18299 (_ BitVec 32)) Bool)

(assert (=> b!344329 (= res!190465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34474 res!190462) b!344324))

(assert (= (and b!344324 res!190463) b!344329))

(assert (= (and b!344329 res!190465) b!344321))

(assert (= (and b!344321 res!190466) b!344323))

(assert (= (and b!344323 res!190461) b!344326))

(assert (= (and b!344326 res!190464) b!344325))

(assert (= (and b!344328 condMapEmpty!12483) mapIsEmpty!12483))

(assert (= (and b!344328 (not condMapEmpty!12483)) mapNonEmpty!12483))

(get-info :version)

(assert (= (and mapNonEmpty!12483 ((_ is ValueCellFull!3338) mapValue!12483)) b!344322))

(assert (= (and b!344328 ((_ is ValueCellFull!3338) mapDefault!12483)) b!344327))

(assert (= start!34474 b!344328))

(declare-fun m!345447 () Bool)

(assert (=> b!344321 m!345447))

(declare-fun m!345449 () Bool)

(assert (=> b!344329 m!345449))

(declare-fun m!345451 () Bool)

(assert (=> b!344323 m!345451))

(declare-fun m!345453 () Bool)

(assert (=> b!344325 m!345453))

(declare-fun m!345455 () Bool)

(assert (=> start!34474 m!345455))

(declare-fun m!345457 () Bool)

(assert (=> start!34474 m!345457))

(declare-fun m!345459 () Bool)

(assert (=> start!34474 m!345459))

(declare-fun m!345461 () Bool)

(assert (=> b!344326 m!345461))

(assert (=> b!344326 m!345461))

(declare-fun m!345463 () Bool)

(assert (=> b!344326 m!345463))

(declare-fun m!345465 () Bool)

(assert (=> mapNonEmpty!12483 m!345465))

(check-sat (not b!344321) (not start!34474) (not b!344329) (not b_next!7411) (not mapNonEmpty!12483) b_and!14593 (not b!344325) tp_is_empty!7363 (not b!344323) (not b!344326))
(check-sat b_and!14593 (not b_next!7411))
