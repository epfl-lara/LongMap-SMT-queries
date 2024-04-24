; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34990 () Bool)

(assert start!34990)

(declare-fun b_free!7693 () Bool)

(declare-fun b_next!7693 () Bool)

(assert (=> start!34990 (= b_free!7693 (not b_next!7693))))

(declare-fun tp!26658 () Bool)

(declare-fun b_and!14937 () Bool)

(assert (=> start!34990 (= tp!26658 b_and!14937)))

(declare-fun res!194368 () Bool)

(declare-fun e!214758 () Bool)

(assert (=> start!34990 (=> (not res!194368) (not e!214758))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34990 (= res!194368 (validMask!0 mask!2385))))

(assert (=> start!34990 e!214758))

(assert (=> start!34990 true))

(declare-fun tp_is_empty!7645 () Bool)

(assert (=> start!34990 tp_is_empty!7645))

(assert (=> start!34990 tp!26658))

(declare-datatypes ((V!11171 0))(
  ( (V!11172 (val!3867 Int)) )
))
(declare-datatypes ((ValueCell!3479 0))(
  ( (ValueCellFull!3479 (v!6055 V!11171)) (EmptyCell!3479) )
))
(declare-datatypes ((array!18866 0))(
  ( (array!18867 (arr!8938 (Array (_ BitVec 32) ValueCell!3479)) (size!9290 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18866)

(declare-fun e!214756 () Bool)

(declare-fun array_inv!6602 (array!18866) Bool)

(assert (=> start!34990 (and (array_inv!6602 _values!1525) e!214756)))

(declare-datatypes ((array!18868 0))(
  ( (array!18869 (arr!8939 (Array (_ BitVec 32) (_ BitVec 64))) (size!9291 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18868)

(declare-fun array_inv!6603 (array!18868) Bool)

(assert (=> start!34990 (array_inv!6603 _keys!1895)))

(declare-fun b!350625 () Bool)

(declare-fun res!194369 () Bool)

(declare-fun e!214761 () Bool)

(assert (=> b!350625 (=> (not res!194369) (not e!214761))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350625 (= res!194369 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350626 () Bool)

(declare-fun e!214760 () Bool)

(assert (=> b!350626 (= e!214760 tp_is_empty!7645)))

(declare-fun b!350627 () Bool)

(declare-fun e!214757 () Bool)

(declare-fun mapRes!12939 () Bool)

(assert (=> b!350627 (= e!214756 (and e!214757 mapRes!12939))))

(declare-fun condMapEmpty!12939 () Bool)

(declare-fun mapDefault!12939 () ValueCell!3479)

(assert (=> b!350627 (= condMapEmpty!12939 (= (arr!8938 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3479)) mapDefault!12939)))))

(declare-fun mapNonEmpty!12939 () Bool)

(declare-fun tp!26657 () Bool)

(assert (=> mapNonEmpty!12939 (= mapRes!12939 (and tp!26657 e!214760))))

(declare-fun mapKey!12939 () (_ BitVec 32))

(declare-fun mapRest!12939 () (Array (_ BitVec 32) ValueCell!3479))

(declare-fun mapValue!12939 () ValueCell!3479)

(assert (=> mapNonEmpty!12939 (= (arr!8938 _values!1525) (store mapRest!12939 mapKey!12939 mapValue!12939))))

(declare-fun b!350628 () Bool)

(declare-fun res!194373 () Bool)

(assert (=> b!350628 (=> (not res!194373) (not e!214758))))

(declare-fun zeroValue!1467 () V!11171)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11171)

(declare-datatypes ((tuple2!5500 0))(
  ( (tuple2!5501 (_1!2761 (_ BitVec 64)) (_2!2761 V!11171)) )
))
(declare-datatypes ((List!5106 0))(
  ( (Nil!5103) (Cons!5102 (h!5958 tuple2!5500) (t!10236 List!5106)) )
))
(declare-datatypes ((ListLongMap!4415 0))(
  ( (ListLongMap!4416 (toList!2223 List!5106)) )
))
(declare-fun contains!2311 (ListLongMap!4415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1751 (array!18868 array!18866 (_ BitVec 32) (_ BitVec 32) V!11171 V!11171 (_ BitVec 32) Int) ListLongMap!4415)

(assert (=> b!350628 (= res!194373 (not (contains!2311 (getCurrentListMap!1751 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350629 () Bool)

(declare-fun res!194366 () Bool)

(assert (=> b!350629 (=> (not res!194366) (not e!214758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18868 (_ BitVec 32)) Bool)

(assert (=> b!350629 (= res!194366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350630 () Bool)

(assert (=> b!350630 (= e!214757 tp_is_empty!7645)))

(declare-fun b!350631 () Bool)

(assert (=> b!350631 (= e!214758 e!214761)))

(declare-fun res!194370 () Bool)

(assert (=> b!350631 (=> (not res!194370) (not e!214761))))

(declare-datatypes ((SeekEntryResult!3398 0))(
  ( (MissingZero!3398 (index!15771 (_ BitVec 32))) (Found!3398 (index!15772 (_ BitVec 32))) (Intermediate!3398 (undefined!4210 Bool) (index!15773 (_ BitVec 32)) (x!34859 (_ BitVec 32))) (Undefined!3398) (MissingVacant!3398 (index!15774 (_ BitVec 32))) )
))
(declare-fun lt!164643 () SeekEntryResult!3398)

(get-info :version)

(assert (=> b!350631 (= res!194370 (and (not ((_ is Found!3398) lt!164643)) (not ((_ is MissingZero!3398) lt!164643)) ((_ is MissingVacant!3398) lt!164643)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18868 (_ BitVec 32)) SeekEntryResult!3398)

(assert (=> b!350631 (= lt!164643 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350632 () Bool)

(declare-fun res!194367 () Bool)

(assert (=> b!350632 (=> (not res!194367) (not e!214758))))

(declare-datatypes ((List!5107 0))(
  ( (Nil!5104) (Cons!5103 (h!5959 (_ BitVec 64)) (t!10237 List!5107)) )
))
(declare-fun arrayNoDuplicates!0 (array!18868 (_ BitVec 32) List!5107) Bool)

(assert (=> b!350632 (= res!194367 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5104))))

(declare-fun b!350633 () Bool)

(declare-fun res!194372 () Bool)

(assert (=> b!350633 (=> (not res!194372) (not e!214758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350633 (= res!194372 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12939 () Bool)

(assert (=> mapIsEmpty!12939 mapRes!12939))

(declare-fun b!350634 () Bool)

(assert (=> b!350634 (= e!214761 false)))

(declare-fun lt!164644 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18868 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350634 (= lt!164644 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350635 () Bool)

(declare-fun res!194371 () Bool)

(assert (=> b!350635 (=> (not res!194371) (not e!214758))))

(assert (=> b!350635 (= res!194371 (and (= (size!9290 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9291 _keys!1895) (size!9290 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34990 res!194368) b!350635))

(assert (= (and b!350635 res!194371) b!350629))

(assert (= (and b!350629 res!194366) b!350632))

(assert (= (and b!350632 res!194367) b!350633))

(assert (= (and b!350633 res!194372) b!350628))

(assert (= (and b!350628 res!194373) b!350631))

(assert (= (and b!350631 res!194370) b!350625))

(assert (= (and b!350625 res!194369) b!350634))

(assert (= (and b!350627 condMapEmpty!12939) mapIsEmpty!12939))

(assert (= (and b!350627 (not condMapEmpty!12939)) mapNonEmpty!12939))

(assert (= (and mapNonEmpty!12939 ((_ is ValueCellFull!3479) mapValue!12939)) b!350626))

(assert (= (and b!350627 ((_ is ValueCellFull!3479) mapDefault!12939)) b!350630))

(assert (= start!34990 b!350627))

(declare-fun m!351033 () Bool)

(assert (=> start!34990 m!351033))

(declare-fun m!351035 () Bool)

(assert (=> start!34990 m!351035))

(declare-fun m!351037 () Bool)

(assert (=> start!34990 m!351037))

(declare-fun m!351039 () Bool)

(assert (=> b!350634 m!351039))

(declare-fun m!351041 () Bool)

(assert (=> mapNonEmpty!12939 m!351041))

(declare-fun m!351043 () Bool)

(assert (=> b!350633 m!351043))

(declare-fun m!351045 () Bool)

(assert (=> b!350629 m!351045))

(declare-fun m!351047 () Bool)

(assert (=> b!350625 m!351047))

(declare-fun m!351049 () Bool)

(assert (=> b!350631 m!351049))

(declare-fun m!351051 () Bool)

(assert (=> b!350632 m!351051))

(declare-fun m!351053 () Bool)

(assert (=> b!350628 m!351053))

(assert (=> b!350628 m!351053))

(declare-fun m!351055 () Bool)

(assert (=> b!350628 m!351055))

(check-sat (not b!350628) (not mapNonEmpty!12939) tp_is_empty!7645 (not b!350631) (not b!350632) (not b!350633) (not b!350634) b_and!14937 (not b!350625) (not start!34990) (not b!350629) (not b_next!7693))
(check-sat b_and!14937 (not b_next!7693))
