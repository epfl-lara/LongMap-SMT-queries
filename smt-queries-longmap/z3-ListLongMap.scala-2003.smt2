; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34984 () Bool)

(assert start!34984)

(declare-fun b_free!7687 () Bool)

(declare-fun b_next!7687 () Bool)

(assert (=> start!34984 (= b_free!7687 (not b_next!7687))))

(declare-fun tp!26640 () Bool)

(declare-fun b_and!14931 () Bool)

(assert (=> start!34984 (= tp!26640 b_and!14931)))

(declare-fun b!350526 () Bool)

(declare-fun res!194297 () Bool)

(declare-fun e!214707 () Bool)

(assert (=> b!350526 (=> (not res!194297) (not e!214707))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11163 0))(
  ( (V!11164 (val!3864 Int)) )
))
(declare-datatypes ((ValueCell!3476 0))(
  ( (ValueCellFull!3476 (v!6052 V!11163)) (EmptyCell!3476) )
))
(declare-datatypes ((array!18854 0))(
  ( (array!18855 (arr!8932 (Array (_ BitVec 32) ValueCell!3476)) (size!9284 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18854)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!18856 0))(
  ( (array!18857 (arr!8933 (Array (_ BitVec 32) (_ BitVec 64))) (size!9285 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18856)

(assert (=> b!350526 (= res!194297 (and (= (size!9284 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9285 _keys!1895) (size!9284 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350527 () Bool)

(declare-fun res!194300 () Bool)

(assert (=> b!350527 (=> (not res!194300) (not e!214707))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11163)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11163)

(declare-datatypes ((tuple2!5498 0))(
  ( (tuple2!5499 (_1!2760 (_ BitVec 64)) (_2!2760 V!11163)) )
))
(declare-datatypes ((List!5103 0))(
  ( (Nil!5100) (Cons!5099 (h!5955 tuple2!5498) (t!10233 List!5103)) )
))
(declare-datatypes ((ListLongMap!4413 0))(
  ( (ListLongMap!4414 (toList!2222 List!5103)) )
))
(declare-fun contains!2310 (ListLongMap!4413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1750 (array!18856 array!18854 (_ BitVec 32) (_ BitVec 32) V!11163 V!11163 (_ BitVec 32) Int) ListLongMap!4413)

(assert (=> b!350527 (= res!194300 (not (contains!2310 (getCurrentListMap!1750 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350528 () Bool)

(declare-fun e!214704 () Bool)

(declare-fun e!214706 () Bool)

(declare-fun mapRes!12930 () Bool)

(assert (=> b!350528 (= e!214704 (and e!214706 mapRes!12930))))

(declare-fun condMapEmpty!12930 () Bool)

(declare-fun mapDefault!12930 () ValueCell!3476)

(assert (=> b!350528 (= condMapEmpty!12930 (= (arr!8932 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3476)) mapDefault!12930)))))

(declare-fun b!350529 () Bool)

(declare-fun res!194296 () Bool)

(assert (=> b!350529 (=> (not res!194296) (not e!214707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350529 (= res!194296 (validKeyInArray!0 k0!1348))))

(declare-fun b!350531 () Bool)

(declare-fun res!194299 () Bool)

(declare-fun e!214705 () Bool)

(assert (=> b!350531 (=> (not res!194299) (not e!214705))))

(declare-fun arrayContainsKey!0 (array!18856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350531 (= res!194299 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350532 () Bool)

(declare-fun res!194294 () Bool)

(assert (=> b!350532 (=> (not res!194294) (not e!214707))))

(declare-datatypes ((List!5104 0))(
  ( (Nil!5101) (Cons!5100 (h!5956 (_ BitVec 64)) (t!10234 List!5104)) )
))
(declare-fun arrayNoDuplicates!0 (array!18856 (_ BitVec 32) List!5104) Bool)

(assert (=> b!350532 (= res!194294 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5101))))

(declare-fun b!350533 () Bool)

(assert (=> b!350533 (= e!214705 false)))

(declare-fun lt!164625 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18856 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350533 (= lt!164625 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350534 () Bool)

(declare-fun e!214702 () Bool)

(declare-fun tp_is_empty!7639 () Bool)

(assert (=> b!350534 (= e!214702 tp_is_empty!7639)))

(declare-fun mapNonEmpty!12930 () Bool)

(declare-fun tp!26639 () Bool)

(assert (=> mapNonEmpty!12930 (= mapRes!12930 (and tp!26639 e!214702))))

(declare-fun mapValue!12930 () ValueCell!3476)

(declare-fun mapRest!12930 () (Array (_ BitVec 32) ValueCell!3476))

(declare-fun mapKey!12930 () (_ BitVec 32))

(assert (=> mapNonEmpty!12930 (= (arr!8932 _values!1525) (store mapRest!12930 mapKey!12930 mapValue!12930))))

(declare-fun b!350535 () Bool)

(declare-fun res!194295 () Bool)

(assert (=> b!350535 (=> (not res!194295) (not e!214707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18856 (_ BitVec 32)) Bool)

(assert (=> b!350535 (= res!194295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!194301 () Bool)

(assert (=> start!34984 (=> (not res!194301) (not e!214707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34984 (= res!194301 (validMask!0 mask!2385))))

(assert (=> start!34984 e!214707))

(assert (=> start!34984 true))

(assert (=> start!34984 tp_is_empty!7639))

(assert (=> start!34984 tp!26640))

(declare-fun array_inv!6600 (array!18854) Bool)

(assert (=> start!34984 (and (array_inv!6600 _values!1525) e!214704)))

(declare-fun array_inv!6601 (array!18856) Bool)

(assert (=> start!34984 (array_inv!6601 _keys!1895)))

(declare-fun b!350530 () Bool)

(assert (=> b!350530 (= e!214707 e!214705)))

(declare-fun res!194298 () Bool)

(assert (=> b!350530 (=> (not res!194298) (not e!214705))))

(declare-datatypes ((SeekEntryResult!3397 0))(
  ( (MissingZero!3397 (index!15767 (_ BitVec 32))) (Found!3397 (index!15768 (_ BitVec 32))) (Intermediate!3397 (undefined!4209 Bool) (index!15769 (_ BitVec 32)) (x!34850 (_ BitVec 32))) (Undefined!3397) (MissingVacant!3397 (index!15770 (_ BitVec 32))) )
))
(declare-fun lt!164626 () SeekEntryResult!3397)

(get-info :version)

(assert (=> b!350530 (= res!194298 (and (not ((_ is Found!3397) lt!164626)) (not ((_ is MissingZero!3397) lt!164626)) ((_ is MissingVacant!3397) lt!164626)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18856 (_ BitVec 32)) SeekEntryResult!3397)

(assert (=> b!350530 (= lt!164626 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12930 () Bool)

(assert (=> mapIsEmpty!12930 mapRes!12930))

(declare-fun b!350536 () Bool)

(assert (=> b!350536 (= e!214706 tp_is_empty!7639)))

(assert (= (and start!34984 res!194301) b!350526))

(assert (= (and b!350526 res!194297) b!350535))

(assert (= (and b!350535 res!194295) b!350532))

(assert (= (and b!350532 res!194294) b!350529))

(assert (= (and b!350529 res!194296) b!350527))

(assert (= (and b!350527 res!194300) b!350530))

(assert (= (and b!350530 res!194298) b!350531))

(assert (= (and b!350531 res!194299) b!350533))

(assert (= (and b!350528 condMapEmpty!12930) mapIsEmpty!12930))

(assert (= (and b!350528 (not condMapEmpty!12930)) mapNonEmpty!12930))

(assert (= (and mapNonEmpty!12930 ((_ is ValueCellFull!3476) mapValue!12930)) b!350534))

(assert (= (and b!350528 ((_ is ValueCellFull!3476) mapDefault!12930)) b!350536))

(assert (= start!34984 b!350528))

(declare-fun m!350961 () Bool)

(assert (=> b!350532 m!350961))

(declare-fun m!350963 () Bool)

(assert (=> mapNonEmpty!12930 m!350963))

(declare-fun m!350965 () Bool)

(assert (=> start!34984 m!350965))

(declare-fun m!350967 () Bool)

(assert (=> start!34984 m!350967))

(declare-fun m!350969 () Bool)

(assert (=> start!34984 m!350969))

(declare-fun m!350971 () Bool)

(assert (=> b!350530 m!350971))

(declare-fun m!350973 () Bool)

(assert (=> b!350527 m!350973))

(assert (=> b!350527 m!350973))

(declare-fun m!350975 () Bool)

(assert (=> b!350527 m!350975))

(declare-fun m!350977 () Bool)

(assert (=> b!350535 m!350977))

(declare-fun m!350979 () Bool)

(assert (=> b!350529 m!350979))

(declare-fun m!350981 () Bool)

(assert (=> b!350531 m!350981))

(declare-fun m!350983 () Bool)

(assert (=> b!350533 m!350983))

(check-sat (not b!350527) (not b!350531) (not b!350529) (not start!34984) (not mapNonEmpty!12930) tp_is_empty!7639 (not b!350530) (not b!350533) (not b!350532) b_and!14931 (not b_next!7687) (not b!350535))
(check-sat b_and!14931 (not b_next!7687))
