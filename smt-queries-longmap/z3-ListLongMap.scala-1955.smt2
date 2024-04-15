; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34462 () Bool)

(assert start!34462)

(declare-fun b_free!7399 () Bool)

(declare-fun b_next!7399 () Bool)

(assert (=> start!34462 (= b_free!7399 (not b_next!7399))))

(declare-fun tp!25742 () Bool)

(declare-fun b_and!14581 () Bool)

(assert (=> start!34462 (= tp!25742 b_and!14581)))

(declare-fun b!344159 () Bool)

(declare-fun res!190353 () Bool)

(declare-fun e!210971 () Bool)

(assert (=> b!344159 (=> (not res!190353) (not e!210971))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10779 0))(
  ( (V!10780 (val!3720 Int)) )
))
(declare-datatypes ((ValueCell!3332 0))(
  ( (ValueCellFull!3332 (v!5890 V!10779)) (EmptyCell!3332) )
))
(declare-datatypes ((array!18277 0))(
  ( (array!18278 (arr!8655 (Array (_ BitVec 32) ValueCell!3332)) (size!9008 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18277)

(declare-datatypes ((array!18279 0))(
  ( (array!18280 (arr!8656 (Array (_ BitVec 32) (_ BitVec 64))) (size!9009 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18279)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344159 (= res!190353 (and (= (size!9008 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9009 _keys!1895) (size!9008 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12465 () Bool)

(declare-fun mapRes!12465 () Bool)

(declare-fun tp!25743 () Bool)

(declare-fun e!210970 () Bool)

(assert (=> mapNonEmpty!12465 (= mapRes!12465 (and tp!25743 e!210970))))

(declare-fun mapValue!12465 () ValueCell!3332)

(declare-fun mapKey!12465 () (_ BitVec 32))

(declare-fun mapRest!12465 () (Array (_ BitVec 32) ValueCell!3332))

(assert (=> mapNonEmpty!12465 (= (arr!8655 _values!1525) (store mapRest!12465 mapKey!12465 mapValue!12465))))

(declare-fun b!344160 () Bool)

(declare-fun e!210969 () Bool)

(declare-fun tp_is_empty!7351 () Bool)

(assert (=> b!344160 (= e!210969 tp_is_empty!7351)))

(declare-fun b!344161 () Bool)

(declare-fun res!190358 () Bool)

(assert (=> b!344161 (=> (not res!190358) (not e!210971))))

(declare-datatypes ((List!4957 0))(
  ( (Nil!4954) (Cons!4953 (h!5809 (_ BitVec 64)) (t!10064 List!4957)) )
))
(declare-fun arrayNoDuplicates!0 (array!18279 (_ BitVec 32) List!4957) Bool)

(assert (=> b!344161 (= res!190358 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4954))))

(declare-fun b!344162 () Bool)

(declare-fun res!190355 () Bool)

(assert (=> b!344162 (=> (not res!190355) (not e!210971))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10779)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10779)

(declare-datatypes ((tuple2!5334 0))(
  ( (tuple2!5335 (_1!2678 (_ BitVec 64)) (_2!2678 V!10779)) )
))
(declare-datatypes ((List!4958 0))(
  ( (Nil!4955) (Cons!4954 (h!5810 tuple2!5334) (t!10065 List!4958)) )
))
(declare-datatypes ((ListLongMap!4237 0))(
  ( (ListLongMap!4238 (toList!2134 List!4958)) )
))
(declare-fun contains!2203 (ListLongMap!4237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1640 (array!18279 array!18277 (_ BitVec 32) (_ BitVec 32) V!10779 V!10779 (_ BitVec 32) Int) ListLongMap!4237)

(assert (=> b!344162 (= res!190355 (not (contains!2203 (getCurrentListMap!1640 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12465 () Bool)

(assert (=> mapIsEmpty!12465 mapRes!12465))

(declare-fun b!344163 () Bool)

(assert (=> b!344163 (= e!210971 false)))

(declare-datatypes ((SeekEntryResult!3335 0))(
  ( (MissingZero!3335 (index!15519 (_ BitVec 32))) (Found!3335 (index!15520 (_ BitVec 32))) (Intermediate!3335 (undefined!4147 Bool) (index!15521 (_ BitVec 32)) (x!34292 (_ BitVec 32))) (Undefined!3335) (MissingVacant!3335 (index!15522 (_ BitVec 32))) )
))
(declare-fun lt!162438 () SeekEntryResult!3335)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18279 (_ BitVec 32)) SeekEntryResult!3335)

(assert (=> b!344163 (= lt!162438 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344164 () Bool)

(declare-fun res!190357 () Bool)

(assert (=> b!344164 (=> (not res!190357) (not e!210971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18279 (_ BitVec 32)) Bool)

(assert (=> b!344164 (= res!190357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344165 () Bool)

(assert (=> b!344165 (= e!210970 tp_is_empty!7351)))

(declare-fun b!344166 () Bool)

(declare-fun e!210972 () Bool)

(assert (=> b!344166 (= e!210972 (and e!210969 mapRes!12465))))

(declare-fun condMapEmpty!12465 () Bool)

(declare-fun mapDefault!12465 () ValueCell!3332)

(assert (=> b!344166 (= condMapEmpty!12465 (= (arr!8655 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3332)) mapDefault!12465)))))

(declare-fun res!190356 () Bool)

(assert (=> start!34462 (=> (not res!190356) (not e!210971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34462 (= res!190356 (validMask!0 mask!2385))))

(assert (=> start!34462 e!210971))

(assert (=> start!34462 true))

(assert (=> start!34462 tp_is_empty!7351))

(assert (=> start!34462 tp!25742))

(declare-fun array_inv!6434 (array!18277) Bool)

(assert (=> start!34462 (and (array_inv!6434 _values!1525) e!210972)))

(declare-fun array_inv!6435 (array!18279) Bool)

(assert (=> start!34462 (array_inv!6435 _keys!1895)))

(declare-fun b!344167 () Bool)

(declare-fun res!190354 () Bool)

(assert (=> b!344167 (=> (not res!190354) (not e!210971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344167 (= res!190354 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34462 res!190356) b!344159))

(assert (= (and b!344159 res!190353) b!344164))

(assert (= (and b!344164 res!190357) b!344161))

(assert (= (and b!344161 res!190358) b!344167))

(assert (= (and b!344167 res!190354) b!344162))

(assert (= (and b!344162 res!190355) b!344163))

(assert (= (and b!344166 condMapEmpty!12465) mapIsEmpty!12465))

(assert (= (and b!344166 (not condMapEmpty!12465)) mapNonEmpty!12465))

(get-info :version)

(assert (= (and mapNonEmpty!12465 ((_ is ValueCellFull!3332) mapValue!12465)) b!344165))

(assert (= (and b!344166 ((_ is ValueCellFull!3332) mapDefault!12465)) b!344160))

(assert (= start!34462 b!344166))

(declare-fun m!345327 () Bool)

(assert (=> mapNonEmpty!12465 m!345327))

(declare-fun m!345329 () Bool)

(assert (=> b!344167 m!345329))

(declare-fun m!345331 () Bool)

(assert (=> b!344163 m!345331))

(declare-fun m!345333 () Bool)

(assert (=> b!344162 m!345333))

(assert (=> b!344162 m!345333))

(declare-fun m!345335 () Bool)

(assert (=> b!344162 m!345335))

(declare-fun m!345337 () Bool)

(assert (=> b!344161 m!345337))

(declare-fun m!345339 () Bool)

(assert (=> b!344164 m!345339))

(declare-fun m!345341 () Bool)

(assert (=> start!34462 m!345341))

(declare-fun m!345343 () Bool)

(assert (=> start!34462 m!345343))

(declare-fun m!345345 () Bool)

(assert (=> start!34462 m!345345))

(check-sat b_and!14581 (not start!34462) tp_is_empty!7351 (not mapNonEmpty!12465) (not b!344161) (not b!344163) (not b!344167) (not b!344162) (not b_next!7399) (not b!344164))
(check-sat b_and!14581 (not b_next!7399))
