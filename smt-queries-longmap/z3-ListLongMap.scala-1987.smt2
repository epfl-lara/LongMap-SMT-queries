; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34792 () Bool)

(assert start!34792)

(declare-fun b_free!7591 () Bool)

(declare-fun b_next!7591 () Bool)

(assert (=> start!34792 (= b_free!7591 (not b_next!7591))))

(declare-fun tp!26339 () Bool)

(declare-fun b_and!14827 () Bool)

(assert (=> start!34792 (= tp!26339 b_and!14827)))

(declare-fun b!348258 () Bool)

(declare-fun res!192923 () Bool)

(declare-fun e!213380 () Bool)

(assert (=> b!348258 (=> (not res!192923) (not e!213380))))

(declare-datatypes ((array!18664 0))(
  ( (array!18665 (arr!8841 (Array (_ BitVec 32) (_ BitVec 64))) (size!9193 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18664)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348258 (= res!192923 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12774 () Bool)

(declare-fun mapRes!12774 () Bool)

(assert (=> mapIsEmpty!12774 mapRes!12774))

(declare-fun b!348259 () Bool)

(declare-fun res!192922 () Bool)

(declare-fun e!213378 () Bool)

(assert (=> b!348259 (=> (not res!192922) (not e!213378))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11035 0))(
  ( (V!11036 (val!3816 Int)) )
))
(declare-fun zeroValue!1467 () V!11035)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3428 0))(
  ( (ValueCellFull!3428 (v!6000 V!11035)) (EmptyCell!3428) )
))
(declare-datatypes ((array!18666 0))(
  ( (array!18667 (arr!8842 (Array (_ BitVec 32) ValueCell!3428)) (size!9194 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18666)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11035)

(declare-datatypes ((tuple2!5430 0))(
  ( (tuple2!5431 (_1!2726 (_ BitVec 64)) (_2!2726 V!11035)) )
))
(declare-datatypes ((List!5039 0))(
  ( (Nil!5036) (Cons!5035 (h!5891 tuple2!5430) (t!10161 List!5039)) )
))
(declare-datatypes ((ListLongMap!4345 0))(
  ( (ListLongMap!4346 (toList!2188 List!5039)) )
))
(declare-fun contains!2272 (ListLongMap!4345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1716 (array!18664 array!18666 (_ BitVec 32) (_ BitVec 32) V!11035 V!11035 (_ BitVec 32) Int) ListLongMap!4345)

(assert (=> b!348259 (= res!192922 (not (contains!2272 (getCurrentListMap!1716 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348260 () Bool)

(declare-fun res!192924 () Bool)

(assert (=> b!348260 (=> (not res!192924) (not e!213378))))

(declare-datatypes ((List!5040 0))(
  ( (Nil!5037) (Cons!5036 (h!5892 (_ BitVec 64)) (t!10162 List!5040)) )
))
(declare-fun arrayNoDuplicates!0 (array!18664 (_ BitVec 32) List!5040) Bool)

(assert (=> b!348260 (= res!192924 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5037))))

(declare-fun b!348261 () Bool)

(declare-fun e!213382 () Bool)

(declare-fun tp_is_empty!7543 () Bool)

(assert (=> b!348261 (= e!213382 tp_is_empty!7543)))

(declare-fun b!348262 () Bool)

(assert (=> b!348262 (= e!213378 e!213380)))

(declare-fun res!192920 () Bool)

(assert (=> b!348262 (=> (not res!192920) (not e!213380))))

(declare-datatypes ((SeekEntryResult!3365 0))(
  ( (MissingZero!3365 (index!15639 (_ BitVec 32))) (Found!3365 (index!15640 (_ BitVec 32))) (Intermediate!3365 (undefined!4177 Bool) (index!15641 (_ BitVec 32)) (x!34650 (_ BitVec 32))) (Undefined!3365) (MissingVacant!3365 (index!15642 (_ BitVec 32))) )
))
(declare-fun lt!163873 () SeekEntryResult!3365)

(get-info :version)

(assert (=> b!348262 (= res!192920 (and (not ((_ is Found!3365) lt!163873)) ((_ is MissingZero!3365) lt!163873)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18664 (_ BitVec 32)) SeekEntryResult!3365)

(assert (=> b!348262 (= lt!163873 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348263 () Bool)

(declare-fun e!213377 () Bool)

(assert (=> b!348263 (= e!213377 tp_is_empty!7543)))

(declare-fun res!192918 () Bool)

(assert (=> start!34792 (=> (not res!192918) (not e!213378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34792 (= res!192918 (validMask!0 mask!2385))))

(assert (=> start!34792 e!213378))

(assert (=> start!34792 true))

(assert (=> start!34792 tp_is_empty!7543))

(assert (=> start!34792 tp!26339))

(declare-fun e!213381 () Bool)

(declare-fun array_inv!6532 (array!18666) Bool)

(assert (=> start!34792 (and (array_inv!6532 _values!1525) e!213381)))

(declare-fun array_inv!6533 (array!18664) Bool)

(assert (=> start!34792 (array_inv!6533 _keys!1895)))

(declare-fun mapNonEmpty!12774 () Bool)

(declare-fun tp!26340 () Bool)

(assert (=> mapNonEmpty!12774 (= mapRes!12774 (and tp!26340 e!213382))))

(declare-fun mapKey!12774 () (_ BitVec 32))

(declare-fun mapRest!12774 () (Array (_ BitVec 32) ValueCell!3428))

(declare-fun mapValue!12774 () ValueCell!3428)

(assert (=> mapNonEmpty!12774 (= (arr!8842 _values!1525) (store mapRest!12774 mapKey!12774 mapValue!12774))))

(declare-fun b!348264 () Bool)

(assert (=> b!348264 (= e!213381 (and e!213377 mapRes!12774))))

(declare-fun condMapEmpty!12774 () Bool)

(declare-fun mapDefault!12774 () ValueCell!3428)

(assert (=> b!348264 (= condMapEmpty!12774 (= (arr!8842 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3428)) mapDefault!12774)))))

(declare-fun b!348265 () Bool)

(assert (=> b!348265 (= e!213380 false)))

(declare-fun lt!163872 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18664 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348265 (= lt!163872 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348266 () Bool)

(declare-fun res!192921 () Bool)

(assert (=> b!348266 (=> (not res!192921) (not e!213378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18664 (_ BitVec 32)) Bool)

(assert (=> b!348266 (= res!192921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348267 () Bool)

(declare-fun res!192919 () Bool)

(assert (=> b!348267 (=> (not res!192919) (not e!213378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348267 (= res!192919 (validKeyInArray!0 k0!1348))))

(declare-fun b!348268 () Bool)

(declare-fun res!192925 () Bool)

(assert (=> b!348268 (=> (not res!192925) (not e!213378))))

(assert (=> b!348268 (= res!192925 (and (= (size!9194 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9193 _keys!1895) (size!9194 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34792 res!192918) b!348268))

(assert (= (and b!348268 res!192925) b!348266))

(assert (= (and b!348266 res!192921) b!348260))

(assert (= (and b!348260 res!192924) b!348267))

(assert (= (and b!348267 res!192919) b!348259))

(assert (= (and b!348259 res!192922) b!348262))

(assert (= (and b!348262 res!192920) b!348258))

(assert (= (and b!348258 res!192923) b!348265))

(assert (= (and b!348264 condMapEmpty!12774) mapIsEmpty!12774))

(assert (= (and b!348264 (not condMapEmpty!12774)) mapNonEmpty!12774))

(assert (= (and mapNonEmpty!12774 ((_ is ValueCellFull!3428) mapValue!12774)) b!348261))

(assert (= (and b!348264 ((_ is ValueCellFull!3428) mapDefault!12774)) b!348263))

(assert (= start!34792 b!348264))

(declare-fun m!349341 () Bool)

(assert (=> mapNonEmpty!12774 m!349341))

(declare-fun m!349343 () Bool)

(assert (=> b!348266 m!349343))

(declare-fun m!349345 () Bool)

(assert (=> b!348259 m!349345))

(assert (=> b!348259 m!349345))

(declare-fun m!349347 () Bool)

(assert (=> b!348259 m!349347))

(declare-fun m!349349 () Bool)

(assert (=> b!348265 m!349349))

(declare-fun m!349351 () Bool)

(assert (=> b!348262 m!349351))

(declare-fun m!349353 () Bool)

(assert (=> b!348260 m!349353))

(declare-fun m!349355 () Bool)

(assert (=> b!348258 m!349355))

(declare-fun m!349357 () Bool)

(assert (=> b!348267 m!349357))

(declare-fun m!349359 () Bool)

(assert (=> start!34792 m!349359))

(declare-fun m!349361 () Bool)

(assert (=> start!34792 m!349361))

(declare-fun m!349363 () Bool)

(assert (=> start!34792 m!349363))

(check-sat (not b_next!7591) (not b!348262) (not b!348266) b_and!14827 (not b!348267) (not mapNonEmpty!12774) tp_is_empty!7543 (not b!348258) (not start!34792) (not b!348259) (not b!348260) (not b!348265))
(check-sat b_and!14827 (not b_next!7591))
