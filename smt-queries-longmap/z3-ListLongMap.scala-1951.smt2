; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34454 () Bool)

(assert start!34454)

(declare-fun b_free!7377 () Bool)

(declare-fun b_next!7377 () Bool)

(assert (=> start!34454 (= b_free!7377 (not b_next!7377))))

(declare-fun tp!25676 () Bool)

(declare-fun b_and!14585 () Bool)

(assert (=> start!34454 (= tp!25676 b_and!14585)))

(declare-fun b!344137 () Bool)

(declare-fun e!210981 () Bool)

(declare-fun e!210980 () Bool)

(declare-fun mapRes!12432 () Bool)

(assert (=> b!344137 (= e!210981 (and e!210980 mapRes!12432))))

(declare-fun condMapEmpty!12432 () Bool)

(declare-datatypes ((V!10749 0))(
  ( (V!10750 (val!3709 Int)) )
))
(declare-datatypes ((ValueCell!3321 0))(
  ( (ValueCellFull!3321 (v!5885 V!10749)) (EmptyCell!3321) )
))
(declare-datatypes ((array!18249 0))(
  ( (array!18250 (arr!8641 (Array (_ BitVec 32) ValueCell!3321)) (size!8993 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18249)

(declare-fun mapDefault!12432 () ValueCell!3321)

(assert (=> b!344137 (= condMapEmpty!12432 (= (arr!8641 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3321)) mapDefault!12432)))))

(declare-fun b!344138 () Bool)

(declare-fun res!190286 () Bool)

(declare-fun e!210982 () Bool)

(assert (=> b!344138 (=> (not res!190286) (not e!210982))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10749)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18251 0))(
  ( (array!18252 (arr!8642 (Array (_ BitVec 32) (_ BitVec 64))) (size!8994 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18251)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10749)

(declare-datatypes ((tuple2!5368 0))(
  ( (tuple2!5369 (_1!2695 (_ BitVec 64)) (_2!2695 V!10749)) )
))
(declare-datatypes ((List!4990 0))(
  ( (Nil!4987) (Cons!4986 (h!5842 tuple2!5368) (t!10106 List!4990)) )
))
(declare-datatypes ((ListLongMap!4281 0))(
  ( (ListLongMap!4282 (toList!2156 List!4990)) )
))
(declare-fun contains!2214 (ListLongMap!4281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1677 (array!18251 array!18249 (_ BitVec 32) (_ BitVec 32) V!10749 V!10749 (_ BitVec 32) Int) ListLongMap!4281)

(assert (=> b!344138 (= res!190286 (not (contains!2214 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344139 () Bool)

(declare-fun res!190288 () Bool)

(assert (=> b!344139 (=> (not res!190288) (not e!210982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18251 (_ BitVec 32)) Bool)

(assert (=> b!344139 (= res!190288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344140 () Bool)

(assert (=> b!344140 (= e!210982 false)))

(declare-datatypes ((SeekEntryResult!3335 0))(
  ( (MissingZero!3335 (index!15519 (_ BitVec 32))) (Found!3335 (index!15520 (_ BitVec 32))) (Intermediate!3335 (undefined!4147 Bool) (index!15521 (_ BitVec 32)) (x!34265 (_ BitVec 32))) (Undefined!3335) (MissingVacant!3335 (index!15522 (_ BitVec 32))) )
))
(declare-fun lt!162640 () SeekEntryResult!3335)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18251 (_ BitVec 32)) SeekEntryResult!3335)

(assert (=> b!344140 (= lt!162640 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344141 () Bool)

(declare-fun tp_is_empty!7329 () Bool)

(assert (=> b!344141 (= e!210980 tp_is_empty!7329)))

(declare-fun b!344142 () Bool)

(declare-fun res!190289 () Bool)

(assert (=> b!344142 (=> (not res!190289) (not e!210982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344142 (= res!190289 (validKeyInArray!0 k0!1348))))

(declare-fun res!190285 () Bool)

(assert (=> start!34454 (=> (not res!190285) (not e!210982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34454 (= res!190285 (validMask!0 mask!2385))))

(assert (=> start!34454 e!210982))

(assert (=> start!34454 true))

(assert (=> start!34454 tp_is_empty!7329))

(assert (=> start!34454 tp!25676))

(declare-fun array_inv!6402 (array!18249) Bool)

(assert (=> start!34454 (and (array_inv!6402 _values!1525) e!210981)))

(declare-fun array_inv!6403 (array!18251) Bool)

(assert (=> start!34454 (array_inv!6403 _keys!1895)))

(declare-fun b!344143 () Bool)

(declare-fun e!210984 () Bool)

(assert (=> b!344143 (= e!210984 tp_is_empty!7329)))

(declare-fun mapNonEmpty!12432 () Bool)

(declare-fun tp!25677 () Bool)

(assert (=> mapNonEmpty!12432 (= mapRes!12432 (and tp!25677 e!210984))))

(declare-fun mapValue!12432 () ValueCell!3321)

(declare-fun mapKey!12432 () (_ BitVec 32))

(declare-fun mapRest!12432 () (Array (_ BitVec 32) ValueCell!3321))

(assert (=> mapNonEmpty!12432 (= (arr!8641 _values!1525) (store mapRest!12432 mapKey!12432 mapValue!12432))))

(declare-fun mapIsEmpty!12432 () Bool)

(assert (=> mapIsEmpty!12432 mapRes!12432))

(declare-fun b!344144 () Bool)

(declare-fun res!190284 () Bool)

(assert (=> b!344144 (=> (not res!190284) (not e!210982))))

(declare-datatypes ((List!4991 0))(
  ( (Nil!4988) (Cons!4987 (h!5843 (_ BitVec 64)) (t!10107 List!4991)) )
))
(declare-fun arrayNoDuplicates!0 (array!18251 (_ BitVec 32) List!4991) Bool)

(assert (=> b!344144 (= res!190284 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4988))))

(declare-fun b!344145 () Bool)

(declare-fun res!190287 () Bool)

(assert (=> b!344145 (=> (not res!190287) (not e!210982))))

(assert (=> b!344145 (= res!190287 (and (= (size!8993 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8994 _keys!1895) (size!8993 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34454 res!190285) b!344145))

(assert (= (and b!344145 res!190287) b!344139))

(assert (= (and b!344139 res!190288) b!344144))

(assert (= (and b!344144 res!190284) b!344142))

(assert (= (and b!344142 res!190289) b!344138))

(assert (= (and b!344138 res!190286) b!344140))

(assert (= (and b!344137 condMapEmpty!12432) mapIsEmpty!12432))

(assert (= (and b!344137 (not condMapEmpty!12432)) mapNonEmpty!12432))

(get-info :version)

(assert (= (and mapNonEmpty!12432 ((_ is ValueCellFull!3321) mapValue!12432)) b!344143))

(assert (= (and b!344137 ((_ is ValueCellFull!3321) mapDefault!12432)) b!344141))

(assert (= start!34454 b!344137))

(declare-fun m!345837 () Bool)

(assert (=> mapNonEmpty!12432 m!345837))

(declare-fun m!345839 () Bool)

(assert (=> b!344144 m!345839))

(declare-fun m!345841 () Bool)

(assert (=> b!344142 m!345841))

(declare-fun m!345843 () Bool)

(assert (=> b!344140 m!345843))

(declare-fun m!345845 () Bool)

(assert (=> start!34454 m!345845))

(declare-fun m!345847 () Bool)

(assert (=> start!34454 m!345847))

(declare-fun m!345849 () Bool)

(assert (=> start!34454 m!345849))

(declare-fun m!345851 () Bool)

(assert (=> b!344139 m!345851))

(declare-fun m!345853 () Bool)

(assert (=> b!344138 m!345853))

(assert (=> b!344138 m!345853))

(declare-fun m!345855 () Bool)

(assert (=> b!344138 m!345855))

(check-sat (not b!344140) (not b!344142) (not start!34454) (not b!344144) (not b_next!7377) (not b!344139) tp_is_empty!7329 (not b!344138) (not mapNonEmpty!12432) b_and!14585)
(check-sat b_and!14585 (not b_next!7377))
