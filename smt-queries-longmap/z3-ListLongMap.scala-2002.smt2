; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34994 () Bool)

(assert start!34994)

(declare-fun b_free!7683 () Bool)

(declare-fun b_next!7683 () Bool)

(assert (=> start!34994 (= b_free!7683 (not b_next!7683))))

(declare-fun tp!26627 () Bool)

(declare-fun b_and!14913 () Bool)

(assert (=> start!34994 (= tp!26627 b_and!14913)))

(declare-fun mapIsEmpty!12924 () Bool)

(declare-fun mapRes!12924 () Bool)

(assert (=> mapIsEmpty!12924 mapRes!12924))

(declare-fun res!194255 () Bool)

(declare-fun e!214700 () Bool)

(assert (=> start!34994 (=> (not res!194255) (not e!214700))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34994 (= res!194255 (validMask!0 mask!2385))))

(assert (=> start!34994 e!214700))

(assert (=> start!34994 true))

(declare-fun tp_is_empty!7635 () Bool)

(assert (=> start!34994 tp_is_empty!7635))

(assert (=> start!34994 tp!26627))

(declare-datatypes ((V!11157 0))(
  ( (V!11158 (val!3862 Int)) )
))
(declare-datatypes ((ValueCell!3474 0))(
  ( (ValueCellFull!3474 (v!6049 V!11157)) (EmptyCell!3474) )
))
(declare-datatypes ((array!18857 0))(
  ( (array!18858 (arr!8934 (Array (_ BitVec 32) ValueCell!3474)) (size!9286 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18857)

(declare-fun e!214705 () Bool)

(declare-fun array_inv!6596 (array!18857) Bool)

(assert (=> start!34994 (and (array_inv!6596 _values!1525) e!214705)))

(declare-datatypes ((array!18859 0))(
  ( (array!18860 (arr!8935 (Array (_ BitVec 32) (_ BitVec 64))) (size!9287 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18859)

(declare-fun array_inv!6597 (array!18859) Bool)

(assert (=> start!34994 (array_inv!6597 _keys!1895)))

(declare-fun b!350513 () Bool)

(declare-fun res!194249 () Bool)

(assert (=> b!350513 (=> (not res!194249) (not e!214700))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350513 (= res!194249 (validKeyInArray!0 k0!1348))))

(declare-fun b!350514 () Bool)

(declare-fun e!214704 () Bool)

(assert (=> b!350514 (= e!214704 tp_is_empty!7635)))

(declare-fun b!350515 () Bool)

(declare-fun e!214703 () Bool)

(assert (=> b!350515 (= e!214703 false)))

(declare-fun lt!164595 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18859 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350515 (= lt!164595 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350516 () Bool)

(declare-fun res!194256 () Bool)

(assert (=> b!350516 (=> (not res!194256) (not e!214700))))

(declare-fun zeroValue!1467 () V!11157)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11157)

(declare-datatypes ((tuple2!5576 0))(
  ( (tuple2!5577 (_1!2799 (_ BitVec 64)) (_2!2799 V!11157)) )
))
(declare-datatypes ((List!5197 0))(
  ( (Nil!5194) (Cons!5193 (h!6049 tuple2!5576) (t!10335 List!5197)) )
))
(declare-datatypes ((ListLongMap!4489 0))(
  ( (ListLongMap!4490 (toList!2260 List!5197)) )
))
(declare-fun contains!2329 (ListLongMap!4489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1781 (array!18859 array!18857 (_ BitVec 32) (_ BitVec 32) V!11157 V!11157 (_ BitVec 32) Int) ListLongMap!4489)

(assert (=> b!350516 (= res!194256 (not (contains!2329 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350517 () Bool)

(declare-fun res!194252 () Bool)

(assert (=> b!350517 (=> (not res!194252) (not e!214703))))

(declare-fun arrayContainsKey!0 (array!18859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350517 (= res!194252 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350518 () Bool)

(declare-fun e!214701 () Bool)

(assert (=> b!350518 (= e!214705 (and e!214701 mapRes!12924))))

(declare-fun condMapEmpty!12924 () Bool)

(declare-fun mapDefault!12924 () ValueCell!3474)

(assert (=> b!350518 (= condMapEmpty!12924 (= (arr!8934 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3474)) mapDefault!12924)))))

(declare-fun b!350519 () Bool)

(assert (=> b!350519 (= e!214700 e!214703)))

(declare-fun res!194254 () Bool)

(assert (=> b!350519 (=> (not res!194254) (not e!214703))))

(declare-datatypes ((SeekEntryResult!3441 0))(
  ( (MissingZero!3441 (index!15943 (_ BitVec 32))) (Found!3441 (index!15944 (_ BitVec 32))) (Intermediate!3441 (undefined!4253 Bool) (index!15945 (_ BitVec 32)) (x!34889 (_ BitVec 32))) (Undefined!3441) (MissingVacant!3441 (index!15946 (_ BitVec 32))) )
))
(declare-fun lt!164596 () SeekEntryResult!3441)

(get-info :version)

(assert (=> b!350519 (= res!194254 (and (not ((_ is Found!3441) lt!164596)) (not ((_ is MissingZero!3441) lt!164596)) ((_ is MissingVacant!3441) lt!164596)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18859 (_ BitVec 32)) SeekEntryResult!3441)

(assert (=> b!350519 (= lt!164596 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12924 () Bool)

(declare-fun tp!26628 () Bool)

(assert (=> mapNonEmpty!12924 (= mapRes!12924 (and tp!26628 e!214704))))

(declare-fun mapKey!12924 () (_ BitVec 32))

(declare-fun mapValue!12924 () ValueCell!3474)

(declare-fun mapRest!12924 () (Array (_ BitVec 32) ValueCell!3474))

(assert (=> mapNonEmpty!12924 (= (arr!8934 _values!1525) (store mapRest!12924 mapKey!12924 mapValue!12924))))

(declare-fun b!350520 () Bool)

(declare-fun res!194253 () Bool)

(assert (=> b!350520 (=> (not res!194253) (not e!214700))))

(assert (=> b!350520 (= res!194253 (and (= (size!9286 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9287 _keys!1895) (size!9286 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350521 () Bool)

(declare-fun res!194251 () Bool)

(assert (=> b!350521 (=> (not res!194251) (not e!214700))))

(declare-datatypes ((List!5198 0))(
  ( (Nil!5195) (Cons!5194 (h!6050 (_ BitVec 64)) (t!10336 List!5198)) )
))
(declare-fun arrayNoDuplicates!0 (array!18859 (_ BitVec 32) List!5198) Bool)

(assert (=> b!350521 (= res!194251 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5195))))

(declare-fun b!350522 () Bool)

(assert (=> b!350522 (= e!214701 tp_is_empty!7635)))

(declare-fun b!350523 () Bool)

(declare-fun res!194250 () Bool)

(assert (=> b!350523 (=> (not res!194250) (not e!214700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18859 (_ BitVec 32)) Bool)

(assert (=> b!350523 (= res!194250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34994 res!194255) b!350520))

(assert (= (and b!350520 res!194253) b!350523))

(assert (= (and b!350523 res!194250) b!350521))

(assert (= (and b!350521 res!194251) b!350513))

(assert (= (and b!350513 res!194249) b!350516))

(assert (= (and b!350516 res!194256) b!350519))

(assert (= (and b!350519 res!194254) b!350517))

(assert (= (and b!350517 res!194252) b!350515))

(assert (= (and b!350518 condMapEmpty!12924) mapIsEmpty!12924))

(assert (= (and b!350518 (not condMapEmpty!12924)) mapNonEmpty!12924))

(assert (= (and mapNonEmpty!12924 ((_ is ValueCellFull!3474) mapValue!12924)) b!350514))

(assert (= (and b!350518 ((_ is ValueCellFull!3474) mapDefault!12924)) b!350522))

(assert (= start!34994 b!350518))

(declare-fun m!350689 () Bool)

(assert (=> mapNonEmpty!12924 m!350689))

(declare-fun m!350691 () Bool)

(assert (=> b!350515 m!350691))

(declare-fun m!350693 () Bool)

(assert (=> b!350517 m!350693))

(declare-fun m!350695 () Bool)

(assert (=> b!350513 m!350695))

(declare-fun m!350697 () Bool)

(assert (=> start!34994 m!350697))

(declare-fun m!350699 () Bool)

(assert (=> start!34994 m!350699))

(declare-fun m!350701 () Bool)

(assert (=> start!34994 m!350701))

(declare-fun m!350703 () Bool)

(assert (=> b!350516 m!350703))

(assert (=> b!350516 m!350703))

(declare-fun m!350705 () Bool)

(assert (=> b!350516 m!350705))

(declare-fun m!350707 () Bool)

(assert (=> b!350523 m!350707))

(declare-fun m!350709 () Bool)

(assert (=> b!350521 m!350709))

(declare-fun m!350711 () Bool)

(assert (=> b!350519 m!350711))

(check-sat (not b_next!7683) (not b!350516) tp_is_empty!7635 (not b!350523) b_and!14913 (not b!350517) (not mapNonEmpty!12924) (not b!350519) (not b!350521) (not b!350513) (not start!34994) (not b!350515))
(check-sat b_and!14913 (not b_next!7683))
