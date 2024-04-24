; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34750 () Bool)

(assert start!34750)

(declare-fun b_free!7549 () Bool)

(declare-fun b_next!7549 () Bool)

(assert (=> start!34750 (= b_free!7549 (not b_next!7549))))

(declare-fun tp!26213 () Bool)

(declare-fun b_and!14785 () Bool)

(assert (=> start!34750 (= tp!26213 b_and!14785)))

(declare-fun b!347558 () Bool)

(declare-fun res!192415 () Bool)

(declare-fun e!212957 () Bool)

(assert (=> b!347558 (=> (not res!192415) (not e!212957))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10979 0))(
  ( (V!10980 (val!3795 Int)) )
))
(declare-fun zeroValue!1467 () V!10979)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3407 0))(
  ( (ValueCellFull!3407 (v!5979 V!10979)) (EmptyCell!3407) )
))
(declare-datatypes ((array!18586 0))(
  ( (array!18587 (arr!8802 (Array (_ BitVec 32) ValueCell!3407)) (size!9154 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18586)

(declare-datatypes ((array!18588 0))(
  ( (array!18589 (arr!8803 (Array (_ BitVec 32) (_ BitVec 64))) (size!9155 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18588)

(declare-fun minValue!1467 () V!10979)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5406 0))(
  ( (tuple2!5407 (_1!2714 (_ BitVec 64)) (_2!2714 V!10979)) )
))
(declare-datatypes ((List!5012 0))(
  ( (Nil!5009) (Cons!5008 (h!5864 tuple2!5406) (t!10134 List!5012)) )
))
(declare-datatypes ((ListLongMap!4321 0))(
  ( (ListLongMap!4322 (toList!2176 List!5012)) )
))
(declare-fun contains!2260 (ListLongMap!4321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1705 (array!18588 array!18586 (_ BitVec 32) (_ BitVec 32) V!10979 V!10979 (_ BitVec 32) Int) ListLongMap!4321)

(assert (=> b!347558 (= res!192415 (not (contains!2260 (getCurrentListMap!1705 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347559 () Bool)

(declare-fun e!212956 () Bool)

(declare-fun e!212961 () Bool)

(declare-fun mapRes!12711 () Bool)

(assert (=> b!347559 (= e!212956 (and e!212961 mapRes!12711))))

(declare-fun condMapEmpty!12711 () Bool)

(declare-fun mapDefault!12711 () ValueCell!3407)

(assert (=> b!347559 (= condMapEmpty!12711 (= (arr!8802 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3407)) mapDefault!12711)))))

(declare-fun b!347560 () Bool)

(declare-fun res!192413 () Bool)

(assert (=> b!347560 (=> (not res!192413) (not e!212957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18588 (_ BitVec 32)) Bool)

(assert (=> b!347560 (= res!192413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347562 () Bool)

(declare-fun res!192408 () Bool)

(assert (=> b!347562 (=> (not res!192408) (not e!212957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347562 (= res!192408 (validKeyInArray!0 k0!1348))))

(declare-fun b!347563 () Bool)

(declare-fun e!212960 () Bool)

(declare-fun e!212958 () Bool)

(assert (=> b!347563 (= e!212960 (not e!212958))))

(declare-fun res!192409 () Bool)

(assert (=> b!347563 (=> res!192409 e!212958)))

(declare-datatypes ((SeekEntryResult!3350 0))(
  ( (MissingZero!3350 (index!15579 (_ BitVec 32))) (Found!3350 (index!15580 (_ BitVec 32))) (Intermediate!3350 (undefined!4162 Bool) (index!15581 (_ BitVec 32)) (x!34579 (_ BitVec 32))) (Undefined!3350) (MissingVacant!3350 (index!15582 (_ BitVec 32))) )
))
(declare-fun lt!163674 () SeekEntryResult!3350)

(assert (=> b!347563 (= res!192409 (or (bvslt (index!15580 lt!163674) #b00000000000000000000000000000000) (bvsge (index!15580 lt!163674) (size!9155 _keys!1895))))))

(declare-fun arrayContainsKey!0 (array!18588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347563 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10759 0))(
  ( (Unit!10760) )
))
(declare-fun lt!163675 () Unit!10759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18588 (_ BitVec 64) (_ BitVec 32)) Unit!10759)

(assert (=> b!347563 (= lt!163675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15580 lt!163674)))))

(declare-fun b!347564 () Bool)

(assert (=> b!347564 (= e!212958 (validKeyInArray!0 (select (arr!8803 _keys!1895) (index!15580 lt!163674))))))

(declare-fun b!347565 () Bool)

(assert (=> b!347565 (= e!212957 e!212960)))

(declare-fun res!192411 () Bool)

(assert (=> b!347565 (=> (not res!192411) (not e!212960))))

(get-info :version)

(assert (=> b!347565 (= res!192411 (and ((_ is Found!3350) lt!163674) (= (select (arr!8803 _keys!1895) (index!15580 lt!163674)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18588 (_ BitVec 32)) SeekEntryResult!3350)

(assert (=> b!347565 (= lt!163674 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12711 () Bool)

(declare-fun tp!26214 () Bool)

(declare-fun e!212962 () Bool)

(assert (=> mapNonEmpty!12711 (= mapRes!12711 (and tp!26214 e!212962))))

(declare-fun mapRest!12711 () (Array (_ BitVec 32) ValueCell!3407))

(declare-fun mapKey!12711 () (_ BitVec 32))

(declare-fun mapValue!12711 () ValueCell!3407)

(assert (=> mapNonEmpty!12711 (= (arr!8802 _values!1525) (store mapRest!12711 mapKey!12711 mapValue!12711))))

(declare-fun b!347566 () Bool)

(declare-fun tp_is_empty!7501 () Bool)

(assert (=> b!347566 (= e!212961 tp_is_empty!7501)))

(declare-fun b!347567 () Bool)

(assert (=> b!347567 (= e!212962 tp_is_empty!7501)))

(declare-fun mapIsEmpty!12711 () Bool)

(assert (=> mapIsEmpty!12711 mapRes!12711))

(declare-fun res!192412 () Bool)

(assert (=> start!34750 (=> (not res!192412) (not e!212957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34750 (= res!192412 (validMask!0 mask!2385))))

(assert (=> start!34750 e!212957))

(assert (=> start!34750 true))

(assert (=> start!34750 tp_is_empty!7501))

(assert (=> start!34750 tp!26213))

(declare-fun array_inv!6504 (array!18586) Bool)

(assert (=> start!34750 (and (array_inv!6504 _values!1525) e!212956)))

(declare-fun array_inv!6505 (array!18588) Bool)

(assert (=> start!34750 (array_inv!6505 _keys!1895)))

(declare-fun b!347561 () Bool)

(declare-fun res!192407 () Bool)

(assert (=> b!347561 (=> (not res!192407) (not e!212960))))

(assert (=> b!347561 (= res!192407 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15580 lt!163674)))))

(declare-fun b!347568 () Bool)

(declare-fun res!192410 () Bool)

(assert (=> b!347568 (=> (not res!192410) (not e!212957))))

(assert (=> b!347568 (= res!192410 (and (= (size!9154 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9155 _keys!1895) (size!9154 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347569 () Bool)

(declare-fun res!192414 () Bool)

(assert (=> b!347569 (=> (not res!192414) (not e!212957))))

(declare-datatypes ((List!5013 0))(
  ( (Nil!5010) (Cons!5009 (h!5865 (_ BitVec 64)) (t!10135 List!5013)) )
))
(declare-fun arrayNoDuplicates!0 (array!18588 (_ BitVec 32) List!5013) Bool)

(assert (=> b!347569 (= res!192414 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5010))))

(assert (= (and start!34750 res!192412) b!347568))

(assert (= (and b!347568 res!192410) b!347560))

(assert (= (and b!347560 res!192413) b!347569))

(assert (= (and b!347569 res!192414) b!347562))

(assert (= (and b!347562 res!192408) b!347558))

(assert (= (and b!347558 res!192415) b!347565))

(assert (= (and b!347565 res!192411) b!347561))

(assert (= (and b!347561 res!192407) b!347563))

(assert (= (and b!347563 (not res!192409)) b!347564))

(assert (= (and b!347559 condMapEmpty!12711) mapIsEmpty!12711))

(assert (= (and b!347559 (not condMapEmpty!12711)) mapNonEmpty!12711))

(assert (= (and mapNonEmpty!12711 ((_ is ValueCellFull!3407) mapValue!12711)) b!347567))

(assert (= (and b!347559 ((_ is ValueCellFull!3407) mapDefault!12711)) b!347566))

(assert (= start!34750 b!347559))

(declare-fun m!348723 () Bool)

(assert (=> b!347558 m!348723))

(assert (=> b!347558 m!348723))

(declare-fun m!348725 () Bool)

(assert (=> b!347558 m!348725))

(declare-fun m!348727 () Bool)

(assert (=> b!347565 m!348727))

(declare-fun m!348729 () Bool)

(assert (=> b!347565 m!348729))

(declare-fun m!348731 () Bool)

(assert (=> b!347563 m!348731))

(declare-fun m!348733 () Bool)

(assert (=> b!347563 m!348733))

(declare-fun m!348735 () Bool)

(assert (=> b!347562 m!348735))

(assert (=> b!347564 m!348727))

(assert (=> b!347564 m!348727))

(declare-fun m!348737 () Bool)

(assert (=> b!347564 m!348737))

(declare-fun m!348739 () Bool)

(assert (=> b!347569 m!348739))

(declare-fun m!348741 () Bool)

(assert (=> b!347561 m!348741))

(declare-fun m!348743 () Bool)

(assert (=> start!34750 m!348743))

(declare-fun m!348745 () Bool)

(assert (=> start!34750 m!348745))

(declare-fun m!348747 () Bool)

(assert (=> start!34750 m!348747))

(declare-fun m!348749 () Bool)

(assert (=> mapNonEmpty!12711 m!348749))

(declare-fun m!348751 () Bool)

(assert (=> b!347560 m!348751))

(check-sat (not b!347561) (not b!347564) b_and!14785 (not b!347560) (not mapNonEmpty!12711) (not start!34750) (not b!347569) (not b!347562) (not b!347558) (not b_next!7549) (not b!347563) tp_is_empty!7501 (not b!347565))
(check-sat b_and!14785 (not b_next!7549))
