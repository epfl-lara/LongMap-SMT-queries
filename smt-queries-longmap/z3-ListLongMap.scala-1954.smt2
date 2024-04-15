; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34456 () Bool)

(assert start!34456)

(declare-fun b_free!7393 () Bool)

(declare-fun b_next!7393 () Bool)

(assert (=> start!34456 (= b_free!7393 (not b_next!7393))))

(declare-fun tp!25724 () Bool)

(declare-fun b_and!14575 () Bool)

(assert (=> start!34456 (= tp!25724 b_and!14575)))

(declare-fun b!344078 () Bool)

(declare-fun res!190303 () Bool)

(declare-fun e!210926 () Bool)

(assert (=> b!344078 (=> (not res!190303) (not e!210926))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344078 (= res!190303 (validKeyInArray!0 k0!1348))))

(declare-fun b!344079 () Bool)

(declare-fun res!190299 () Bool)

(assert (=> b!344079 (=> (not res!190299) (not e!210926))))

(declare-datatypes ((array!18267 0))(
  ( (array!18268 (arr!8650 (Array (_ BitVec 32) (_ BitVec 64))) (size!9003 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18267)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18267 (_ BitVec 32)) Bool)

(assert (=> b!344079 (= res!190299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344080 () Bool)

(declare-fun res!190302 () Bool)

(assert (=> b!344080 (=> (not res!190302) (not e!210926))))

(declare-datatypes ((List!4955 0))(
  ( (Nil!4952) (Cons!4951 (h!5807 (_ BitVec 64)) (t!10062 List!4955)) )
))
(declare-fun arrayNoDuplicates!0 (array!18267 (_ BitVec 32) List!4955) Bool)

(assert (=> b!344080 (= res!190302 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4952))))

(declare-fun res!190300 () Bool)

(assert (=> start!34456 (=> (not res!190300) (not e!210926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34456 (= res!190300 (validMask!0 mask!2385))))

(assert (=> start!34456 e!210926))

(assert (=> start!34456 true))

(declare-fun tp_is_empty!7345 () Bool)

(assert (=> start!34456 tp_is_empty!7345))

(assert (=> start!34456 tp!25724))

(declare-datatypes ((V!10771 0))(
  ( (V!10772 (val!3717 Int)) )
))
(declare-datatypes ((ValueCell!3329 0))(
  ( (ValueCellFull!3329 (v!5887 V!10771)) (EmptyCell!3329) )
))
(declare-datatypes ((array!18269 0))(
  ( (array!18270 (arr!8651 (Array (_ BitVec 32) ValueCell!3329)) (size!9004 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18269)

(declare-fun e!210927 () Bool)

(declare-fun array_inv!6430 (array!18269) Bool)

(assert (=> start!34456 (and (array_inv!6430 _values!1525) e!210927)))

(declare-fun array_inv!6431 (array!18267) Bool)

(assert (=> start!34456 (array_inv!6431 _keys!1895)))

(declare-fun b!344081 () Bool)

(declare-fun e!210925 () Bool)

(assert (=> b!344081 (= e!210925 tp_is_empty!7345)))

(declare-fun mapNonEmpty!12456 () Bool)

(declare-fun mapRes!12456 () Bool)

(declare-fun tp!25725 () Bool)

(declare-fun e!210928 () Bool)

(assert (=> mapNonEmpty!12456 (= mapRes!12456 (and tp!25725 e!210928))))

(declare-fun mapRest!12456 () (Array (_ BitVec 32) ValueCell!3329))

(declare-fun mapValue!12456 () ValueCell!3329)

(declare-fun mapKey!12456 () (_ BitVec 32))

(assert (=> mapNonEmpty!12456 (= (arr!8651 _values!1525) (store mapRest!12456 mapKey!12456 mapValue!12456))))

(declare-fun b!344082 () Bool)

(assert (=> b!344082 (= e!210928 tp_is_empty!7345)))

(declare-fun mapIsEmpty!12456 () Bool)

(assert (=> mapIsEmpty!12456 mapRes!12456))

(declare-fun b!344083 () Bool)

(assert (=> b!344083 (= e!210927 (and e!210925 mapRes!12456))))

(declare-fun condMapEmpty!12456 () Bool)

(declare-fun mapDefault!12456 () ValueCell!3329)

(assert (=> b!344083 (= condMapEmpty!12456 (= (arr!8651 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3329)) mapDefault!12456)))))

(declare-fun b!344084 () Bool)

(assert (=> b!344084 (= e!210926 false)))

(declare-datatypes ((SeekEntryResult!3333 0))(
  ( (MissingZero!3333 (index!15511 (_ BitVec 32))) (Found!3333 (index!15512 (_ BitVec 32))) (Intermediate!3333 (undefined!4145 Bool) (index!15513 (_ BitVec 32)) (x!34282 (_ BitVec 32))) (Undefined!3333) (MissingVacant!3333 (index!15514 (_ BitVec 32))) )
))
(declare-fun lt!162429 () SeekEntryResult!3333)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18267 (_ BitVec 32)) SeekEntryResult!3333)

(assert (=> b!344084 (= lt!162429 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344085 () Bool)

(declare-fun res!190301 () Bool)

(assert (=> b!344085 (=> (not res!190301) (not e!210926))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344085 (= res!190301 (and (= (size!9004 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9003 _keys!1895) (size!9004 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344086 () Bool)

(declare-fun res!190304 () Bool)

(assert (=> b!344086 (=> (not res!190304) (not e!210926))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10771)

(declare-fun zeroValue!1467 () V!10771)

(declare-datatypes ((tuple2!5332 0))(
  ( (tuple2!5333 (_1!2677 (_ BitVec 64)) (_2!2677 V!10771)) )
))
(declare-datatypes ((List!4956 0))(
  ( (Nil!4953) (Cons!4952 (h!5808 tuple2!5332) (t!10063 List!4956)) )
))
(declare-datatypes ((ListLongMap!4235 0))(
  ( (ListLongMap!4236 (toList!2133 List!4956)) )
))
(declare-fun contains!2202 (ListLongMap!4235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1639 (array!18267 array!18269 (_ BitVec 32) (_ BitVec 32) V!10771 V!10771 (_ BitVec 32) Int) ListLongMap!4235)

(assert (=> b!344086 (= res!190304 (not (contains!2202 (getCurrentListMap!1639 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34456 res!190300) b!344085))

(assert (= (and b!344085 res!190301) b!344079))

(assert (= (and b!344079 res!190299) b!344080))

(assert (= (and b!344080 res!190302) b!344078))

(assert (= (and b!344078 res!190303) b!344086))

(assert (= (and b!344086 res!190304) b!344084))

(assert (= (and b!344083 condMapEmpty!12456) mapIsEmpty!12456))

(assert (= (and b!344083 (not condMapEmpty!12456)) mapNonEmpty!12456))

(get-info :version)

(assert (= (and mapNonEmpty!12456 ((_ is ValueCellFull!3329) mapValue!12456)) b!344082))

(assert (= (and b!344083 ((_ is ValueCellFull!3329) mapDefault!12456)) b!344081))

(assert (= start!34456 b!344083))

(declare-fun m!345267 () Bool)

(assert (=> mapNonEmpty!12456 m!345267))

(declare-fun m!345269 () Bool)

(assert (=> b!344080 m!345269))

(declare-fun m!345271 () Bool)

(assert (=> b!344086 m!345271))

(assert (=> b!344086 m!345271))

(declare-fun m!345273 () Bool)

(assert (=> b!344086 m!345273))

(declare-fun m!345275 () Bool)

(assert (=> b!344084 m!345275))

(declare-fun m!345277 () Bool)

(assert (=> b!344078 m!345277))

(declare-fun m!345279 () Bool)

(assert (=> b!344079 m!345279))

(declare-fun m!345281 () Bool)

(assert (=> start!34456 m!345281))

(declare-fun m!345283 () Bool)

(assert (=> start!34456 m!345283))

(declare-fun m!345285 () Bool)

(assert (=> start!34456 m!345285))

(check-sat (not b!344078) (not mapNonEmpty!12456) (not b!344079) b_and!14575 (not b!344084) (not b_next!7393) (not start!34456) tp_is_empty!7345 (not b!344080) (not b!344086))
(check-sat b_and!14575 (not b_next!7393))
