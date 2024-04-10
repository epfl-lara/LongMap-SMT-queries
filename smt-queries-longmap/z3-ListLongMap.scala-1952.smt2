; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34460 () Bool)

(assert start!34460)

(declare-fun b_free!7383 () Bool)

(declare-fun b_next!7383 () Bool)

(assert (=> start!34460 (= b_free!7383 (not b_next!7383))))

(declare-fun tp!25695 () Bool)

(declare-fun b_and!14591 () Bool)

(assert (=> start!34460 (= tp!25695 b_and!14591)))

(declare-fun mapIsEmpty!12441 () Bool)

(declare-fun mapRes!12441 () Bool)

(assert (=> mapIsEmpty!12441 mapRes!12441))

(declare-fun b!344218 () Bool)

(declare-fun res!190343 () Bool)

(declare-fun e!211028 () Bool)

(assert (=> b!344218 (=> (not res!190343) (not e!211028))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344218 (= res!190343 (validKeyInArray!0 k0!1348))))

(declare-fun res!190338 () Bool)

(assert (=> start!34460 (=> (not res!190338) (not e!211028))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34460 (= res!190338 (validMask!0 mask!2385))))

(assert (=> start!34460 e!211028))

(assert (=> start!34460 true))

(declare-fun tp_is_empty!7335 () Bool)

(assert (=> start!34460 tp_is_empty!7335))

(assert (=> start!34460 tp!25695))

(declare-datatypes ((V!10757 0))(
  ( (V!10758 (val!3712 Int)) )
))
(declare-datatypes ((ValueCell!3324 0))(
  ( (ValueCellFull!3324 (v!5888 V!10757)) (EmptyCell!3324) )
))
(declare-datatypes ((array!18261 0))(
  ( (array!18262 (arr!8647 (Array (_ BitVec 32) ValueCell!3324)) (size!8999 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18261)

(declare-fun e!211025 () Bool)

(declare-fun array_inv!6404 (array!18261) Bool)

(assert (=> start!34460 (and (array_inv!6404 _values!1525) e!211025)))

(declare-datatypes ((array!18263 0))(
  ( (array!18264 (arr!8648 (Array (_ BitVec 32) (_ BitVec 64))) (size!9000 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18263)

(declare-fun array_inv!6405 (array!18263) Bool)

(assert (=> start!34460 (array_inv!6405 _keys!1895)))

(declare-fun b!344219 () Bool)

(declare-fun res!190341 () Bool)

(assert (=> b!344219 (=> (not res!190341) (not e!211028))))

(declare-datatypes ((List!4994 0))(
  ( (Nil!4991) (Cons!4990 (h!5846 (_ BitVec 64)) (t!10110 List!4994)) )
))
(declare-fun arrayNoDuplicates!0 (array!18263 (_ BitVec 32) List!4994) Bool)

(assert (=> b!344219 (= res!190341 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4991))))

(declare-fun b!344220 () Bool)

(declare-fun res!190340 () Bool)

(assert (=> b!344220 (=> (not res!190340) (not e!211028))))

(declare-fun zeroValue!1467 () V!10757)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10757)

(declare-datatypes ((tuple2!5374 0))(
  ( (tuple2!5375 (_1!2698 (_ BitVec 64)) (_2!2698 V!10757)) )
))
(declare-datatypes ((List!4995 0))(
  ( (Nil!4992) (Cons!4991 (h!5847 tuple2!5374) (t!10111 List!4995)) )
))
(declare-datatypes ((ListLongMap!4287 0))(
  ( (ListLongMap!4288 (toList!2159 List!4995)) )
))
(declare-fun contains!2217 (ListLongMap!4287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1680 (array!18263 array!18261 (_ BitVec 32) (_ BitVec 32) V!10757 V!10757 (_ BitVec 32) Int) ListLongMap!4287)

(assert (=> b!344220 (= res!190340 (not (contains!2217 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344221 () Bool)

(declare-fun e!211029 () Bool)

(assert (=> b!344221 (= e!211029 tp_is_empty!7335)))

(declare-fun b!344222 () Bool)

(assert (=> b!344222 (= e!211028 false)))

(declare-datatypes ((SeekEntryResult!3336 0))(
  ( (MissingZero!3336 (index!15523 (_ BitVec 32))) (Found!3336 (index!15524 (_ BitVec 32))) (Intermediate!3336 (undefined!4148 Bool) (index!15525 (_ BitVec 32)) (x!34274 (_ BitVec 32))) (Undefined!3336) (MissingVacant!3336 (index!15526 (_ BitVec 32))) )
))
(declare-fun lt!162649 () SeekEntryResult!3336)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18263 (_ BitVec 32)) SeekEntryResult!3336)

(assert (=> b!344222 (= lt!162649 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344223 () Bool)

(declare-fun res!190339 () Bool)

(assert (=> b!344223 (=> (not res!190339) (not e!211028))))

(assert (=> b!344223 (= res!190339 (and (= (size!8999 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9000 _keys!1895) (size!8999 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344224 () Bool)

(declare-fun e!211027 () Bool)

(assert (=> b!344224 (= e!211025 (and e!211027 mapRes!12441))))

(declare-fun condMapEmpty!12441 () Bool)

(declare-fun mapDefault!12441 () ValueCell!3324)

(assert (=> b!344224 (= condMapEmpty!12441 (= (arr!8647 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3324)) mapDefault!12441)))))

(declare-fun b!344225 () Bool)

(declare-fun res!190342 () Bool)

(assert (=> b!344225 (=> (not res!190342) (not e!211028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18263 (_ BitVec 32)) Bool)

(assert (=> b!344225 (= res!190342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344226 () Bool)

(assert (=> b!344226 (= e!211027 tp_is_empty!7335)))

(declare-fun mapNonEmpty!12441 () Bool)

(declare-fun tp!25694 () Bool)

(assert (=> mapNonEmpty!12441 (= mapRes!12441 (and tp!25694 e!211029))))

(declare-fun mapRest!12441 () (Array (_ BitVec 32) ValueCell!3324))

(declare-fun mapKey!12441 () (_ BitVec 32))

(declare-fun mapValue!12441 () ValueCell!3324)

(assert (=> mapNonEmpty!12441 (= (arr!8647 _values!1525) (store mapRest!12441 mapKey!12441 mapValue!12441))))

(assert (= (and start!34460 res!190338) b!344223))

(assert (= (and b!344223 res!190339) b!344225))

(assert (= (and b!344225 res!190342) b!344219))

(assert (= (and b!344219 res!190341) b!344218))

(assert (= (and b!344218 res!190343) b!344220))

(assert (= (and b!344220 res!190340) b!344222))

(assert (= (and b!344224 condMapEmpty!12441) mapIsEmpty!12441))

(assert (= (and b!344224 (not condMapEmpty!12441)) mapNonEmpty!12441))

(get-info :version)

(assert (= (and mapNonEmpty!12441 ((_ is ValueCellFull!3324) mapValue!12441)) b!344221))

(assert (= (and b!344224 ((_ is ValueCellFull!3324) mapDefault!12441)) b!344226))

(assert (= start!34460 b!344224))

(declare-fun m!345897 () Bool)

(assert (=> start!34460 m!345897))

(declare-fun m!345899 () Bool)

(assert (=> start!34460 m!345899))

(declare-fun m!345901 () Bool)

(assert (=> start!34460 m!345901))

(declare-fun m!345903 () Bool)

(assert (=> b!344218 m!345903))

(declare-fun m!345905 () Bool)

(assert (=> b!344222 m!345905))

(declare-fun m!345907 () Bool)

(assert (=> b!344219 m!345907))

(declare-fun m!345909 () Bool)

(assert (=> b!344220 m!345909))

(assert (=> b!344220 m!345909))

(declare-fun m!345911 () Bool)

(assert (=> b!344220 m!345911))

(declare-fun m!345913 () Bool)

(assert (=> b!344225 m!345913))

(declare-fun m!345915 () Bool)

(assert (=> mapNonEmpty!12441 m!345915))

(check-sat (not b!344218) (not b!344222) (not b!344219) (not start!34460) (not b_next!7383) (not b!344225) b_and!14591 (not mapNonEmpty!12441) (not b!344220) tp_is_empty!7335)
(check-sat b_and!14591 (not b_next!7383))
