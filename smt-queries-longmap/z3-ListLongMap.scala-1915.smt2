; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34066 () Bool)

(assert start!34066)

(declare-fun b_free!7159 () Bool)

(declare-fun b_next!7159 () Bool)

(assert (=> start!34066 (= b_free!7159 (not b_next!7159))))

(declare-fun tp!25001 () Bool)

(declare-fun b_and!14327 () Bool)

(assert (=> start!34066 (= tp!25001 b_and!14327)))

(declare-fun b!339373 () Bool)

(declare-fun e!208201 () Bool)

(declare-fun tp_is_empty!7111 () Bool)

(assert (=> b!339373 (= e!208201 tp_is_empty!7111)))

(declare-fun b!339374 () Bool)

(declare-fun e!208204 () Bool)

(assert (=> b!339374 (= e!208204 tp_is_empty!7111)))

(declare-fun mapNonEmpty!12084 () Bool)

(declare-fun mapRes!12084 () Bool)

(declare-fun tp!25002 () Bool)

(assert (=> mapNonEmpty!12084 (= mapRes!12084 (and tp!25002 e!208204))))

(declare-datatypes ((V!10459 0))(
  ( (V!10460 (val!3600 Int)) )
))
(declare-datatypes ((ValueCell!3212 0))(
  ( (ValueCellFull!3212 (v!5763 V!10459)) (EmptyCell!3212) )
))
(declare-fun mapRest!12084 () (Array (_ BitVec 32) ValueCell!3212))

(declare-fun mapKey!12084 () (_ BitVec 32))

(declare-fun mapValue!12084 () ValueCell!3212)

(declare-datatypes ((array!17797 0))(
  ( (array!17798 (arr!8422 (Array (_ BitVec 32) ValueCell!3212)) (size!8775 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17797)

(assert (=> mapNonEmpty!12084 (= (arr!8422 _values!1525) (store mapRest!12084 mapKey!12084 mapValue!12084))))

(declare-fun b!339376 () Bool)

(declare-fun res!187484 () Bool)

(declare-fun e!208203 () Bool)

(assert (=> b!339376 (=> (not res!187484) (not e!208203))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10459)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17799 0))(
  ( (array!17800 (arr!8423 (Array (_ BitVec 32) (_ BitVec 64))) (size!8776 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17799)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10459)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((tuple2!5168 0))(
  ( (tuple2!5169 (_1!2595 (_ BitVec 64)) (_2!2595 V!10459)) )
))
(declare-datatypes ((List!4793 0))(
  ( (Nil!4790) (Cons!4789 (h!5645 tuple2!5168) (t!9886 List!4793)) )
))
(declare-datatypes ((ListLongMap!4071 0))(
  ( (ListLongMap!4072 (toList!2051 List!4793)) )
))
(declare-fun contains!2113 (ListLongMap!4071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1557 (array!17799 array!17797 (_ BitVec 32) (_ BitVec 32) V!10459 V!10459 (_ BitVec 32) Int) ListLongMap!4071)

(assert (=> b!339376 (= res!187484 (not (contains!2113 (getCurrentListMap!1557 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339377 () Bool)

(declare-fun res!187483 () Bool)

(assert (=> b!339377 (=> (not res!187483) (not e!208203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17799 (_ BitVec 32)) Bool)

(assert (=> b!339377 (= res!187483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339378 () Bool)

(declare-fun e!208202 () Bool)

(assert (=> b!339378 (= e!208202 (and e!208201 mapRes!12084))))

(declare-fun condMapEmpty!12084 () Bool)

(declare-fun mapDefault!12084 () ValueCell!3212)

(assert (=> b!339378 (= condMapEmpty!12084 (= (arr!8422 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3212)) mapDefault!12084)))))

(declare-fun b!339379 () Bool)

(declare-fun res!187481 () Bool)

(assert (=> b!339379 (=> (not res!187481) (not e!208203))))

(declare-datatypes ((List!4794 0))(
  ( (Nil!4791) (Cons!4790 (h!5646 (_ BitVec 64)) (t!9887 List!4794)) )
))
(declare-fun arrayNoDuplicates!0 (array!17799 (_ BitVec 32) List!4794) Bool)

(assert (=> b!339379 (= res!187481 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4791))))

(declare-fun mapIsEmpty!12084 () Bool)

(assert (=> mapIsEmpty!12084 mapRes!12084))

(declare-fun b!339380 () Bool)

(declare-fun res!187479 () Bool)

(assert (=> b!339380 (=> (not res!187479) (not e!208203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339380 (= res!187479 (validKeyInArray!0 k0!1348))))

(declare-fun b!339381 () Bool)

(assert (=> b!339381 (= e!208203 false)))

(declare-datatypes ((SeekEntryResult!3249 0))(
  ( (MissingZero!3249 (index!15175 (_ BitVec 32))) (Found!3249 (index!15176 (_ BitVec 32))) (Intermediate!3249 (undefined!4061 Bool) (index!15177 (_ BitVec 32)) (x!33816 (_ BitVec 32))) (Undefined!3249) (MissingVacant!3249 (index!15178 (_ BitVec 32))) )
))
(declare-fun lt!161022 () SeekEntryResult!3249)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17799 (_ BitVec 32)) SeekEntryResult!3249)

(assert (=> b!339381 (= lt!161022 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!187482 () Bool)

(assert (=> start!34066 (=> (not res!187482) (not e!208203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34066 (= res!187482 (validMask!0 mask!2385))))

(assert (=> start!34066 e!208203))

(assert (=> start!34066 true))

(assert (=> start!34066 tp_is_empty!7111))

(assert (=> start!34066 tp!25001))

(declare-fun array_inv!6272 (array!17797) Bool)

(assert (=> start!34066 (and (array_inv!6272 _values!1525) e!208202)))

(declare-fun array_inv!6273 (array!17799) Bool)

(assert (=> start!34066 (array_inv!6273 _keys!1895)))

(declare-fun b!339375 () Bool)

(declare-fun res!187480 () Bool)

(assert (=> b!339375 (=> (not res!187480) (not e!208203))))

(assert (=> b!339375 (= res!187480 (and (= (size!8775 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8776 _keys!1895) (size!8775 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34066 res!187482) b!339375))

(assert (= (and b!339375 res!187480) b!339377))

(assert (= (and b!339377 res!187483) b!339379))

(assert (= (and b!339379 res!187481) b!339380))

(assert (= (and b!339380 res!187479) b!339376))

(assert (= (and b!339376 res!187484) b!339381))

(assert (= (and b!339378 condMapEmpty!12084) mapIsEmpty!12084))

(assert (= (and b!339378 (not condMapEmpty!12084)) mapNonEmpty!12084))

(get-info :version)

(assert (= (and mapNonEmpty!12084 ((_ is ValueCellFull!3212) mapValue!12084)) b!339374))

(assert (= (and b!339378 ((_ is ValueCellFull!3212) mapDefault!12084)) b!339373))

(assert (= start!34066 b!339378))

(declare-fun m!341839 () Bool)

(assert (=> mapNonEmpty!12084 m!341839))

(declare-fun m!341841 () Bool)

(assert (=> b!339376 m!341841))

(assert (=> b!339376 m!341841))

(declare-fun m!341843 () Bool)

(assert (=> b!339376 m!341843))

(declare-fun m!341845 () Bool)

(assert (=> b!339377 m!341845))

(declare-fun m!341847 () Bool)

(assert (=> b!339381 m!341847))

(declare-fun m!341849 () Bool)

(assert (=> b!339379 m!341849))

(declare-fun m!341851 () Bool)

(assert (=> start!34066 m!341851))

(declare-fun m!341853 () Bool)

(assert (=> start!34066 m!341853))

(declare-fun m!341855 () Bool)

(assert (=> start!34066 m!341855))

(declare-fun m!341857 () Bool)

(assert (=> b!339380 m!341857))

(check-sat (not b_next!7159) (not b!339379) (not b!339376) (not b!339381) (not mapNonEmpty!12084) b_and!14327 (not b!339380) (not start!34066) (not b!339377) tp_is_empty!7111)
(check-sat b_and!14327 (not b_next!7159))
