; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34444 () Bool)

(assert start!34444)

(declare-fun b_free!7381 () Bool)

(declare-fun b_next!7381 () Bool)

(assert (=> start!34444 (= b_free!7381 (not b_next!7381))))

(declare-fun tp!25688 () Bool)

(declare-fun b_and!14603 () Bool)

(assert (=> start!34444 (= tp!25688 b_and!14603)))

(declare-fun mapIsEmpty!12438 () Bool)

(declare-fun mapRes!12438 () Bool)

(assert (=> mapIsEmpty!12438 mapRes!12438))

(declare-fun b!344138 () Bool)

(declare-fun e!210980 () Bool)

(declare-fun tp_is_empty!7333 () Bool)

(assert (=> b!344138 (= e!210980 tp_is_empty!7333)))

(declare-fun res!190322 () Bool)

(declare-fun e!210978 () Bool)

(assert (=> start!34444 (=> (not res!190322) (not e!210978))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34444 (= res!190322 (validMask!0 mask!2385))))

(assert (=> start!34444 e!210978))

(assert (=> start!34444 true))

(assert (=> start!34444 tp_is_empty!7333))

(assert (=> start!34444 tp!25688))

(declare-datatypes ((V!10755 0))(
  ( (V!10756 (val!3711 Int)) )
))
(declare-datatypes ((ValueCell!3323 0))(
  ( (ValueCellFull!3323 (v!5888 V!10755)) (EmptyCell!3323) )
))
(declare-datatypes ((array!18250 0))(
  ( (array!18251 (arr!8641 (Array (_ BitVec 32) ValueCell!3323)) (size!8993 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18250)

(declare-fun e!210979 () Bool)

(declare-fun array_inv!6384 (array!18250) Bool)

(assert (=> start!34444 (and (array_inv!6384 _values!1525) e!210979)))

(declare-datatypes ((array!18252 0))(
  ( (array!18253 (arr!8642 (Array (_ BitVec 32) (_ BitVec 64))) (size!8994 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18252)

(declare-fun array_inv!6385 (array!18252) Bool)

(assert (=> start!34444 (array_inv!6385 _keys!1895)))

(declare-fun b!344139 () Bool)

(declare-fun res!190320 () Bool)

(assert (=> b!344139 (=> (not res!190320) (not e!210978))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344139 (= res!190320 (and (= (size!8993 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8994 _keys!1895) (size!8993 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344140 () Bool)

(declare-fun res!190318 () Bool)

(assert (=> b!344140 (=> (not res!190318) (not e!210978))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344140 (= res!190318 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12438 () Bool)

(declare-fun tp!25689 () Bool)

(assert (=> mapNonEmpty!12438 (= mapRes!12438 (and tp!25689 e!210980))))

(declare-fun mapValue!12438 () ValueCell!3323)

(declare-fun mapRest!12438 () (Array (_ BitVec 32) ValueCell!3323))

(declare-fun mapKey!12438 () (_ BitVec 32))

(assert (=> mapNonEmpty!12438 (= (arr!8641 _values!1525) (store mapRest!12438 mapKey!12438 mapValue!12438))))

(declare-fun b!344141 () Bool)

(declare-fun res!190317 () Bool)

(assert (=> b!344141 (=> (not res!190317) (not e!210978))))

(declare-fun zeroValue!1467 () V!10755)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10755)

(declare-datatypes ((tuple2!5294 0))(
  ( (tuple2!5295 (_1!2658 (_ BitVec 64)) (_2!2658 V!10755)) )
))
(declare-datatypes ((List!4896 0))(
  ( (Nil!4893) (Cons!4892 (h!5748 tuple2!5294) (t!10004 List!4896)) )
))
(declare-datatypes ((ListLongMap!4209 0))(
  ( (ListLongMap!4210 (toList!2120 List!4896)) )
))
(declare-fun contains!2197 (ListLongMap!4209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1649 (array!18252 array!18250 (_ BitVec 32) (_ BitVec 32) V!10755 V!10755 (_ BitVec 32) Int) ListLongMap!4209)

(assert (=> b!344141 (= res!190317 (not (contains!2197 (getCurrentListMap!1649 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344142 () Bool)

(assert (=> b!344142 (= e!210978 false)))

(declare-datatypes ((SeekEntryResult!3285 0))(
  ( (MissingZero!3285 (index!15319 (_ BitVec 32))) (Found!3285 (index!15320 (_ BitVec 32))) (Intermediate!3285 (undefined!4097 Bool) (index!15321 (_ BitVec 32)) (x!34220 (_ BitVec 32))) (Undefined!3285) (MissingVacant!3285 (index!15322 (_ BitVec 32))) )
))
(declare-fun lt!162664 () SeekEntryResult!3285)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18252 (_ BitVec 32)) SeekEntryResult!3285)

(assert (=> b!344142 (= lt!162664 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344143 () Bool)

(declare-fun res!190319 () Bool)

(assert (=> b!344143 (=> (not res!190319) (not e!210978))))

(declare-datatypes ((List!4897 0))(
  ( (Nil!4894) (Cons!4893 (h!5749 (_ BitVec 64)) (t!10005 List!4897)) )
))
(declare-fun arrayNoDuplicates!0 (array!18252 (_ BitVec 32) List!4897) Bool)

(assert (=> b!344143 (= res!190319 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4894))))

(declare-fun b!344144 () Bool)

(declare-fun res!190321 () Bool)

(assert (=> b!344144 (=> (not res!190321) (not e!210978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18252 (_ BitVec 32)) Bool)

(assert (=> b!344144 (= res!190321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344145 () Bool)

(declare-fun e!210976 () Bool)

(assert (=> b!344145 (= e!210979 (and e!210976 mapRes!12438))))

(declare-fun condMapEmpty!12438 () Bool)

(declare-fun mapDefault!12438 () ValueCell!3323)

(assert (=> b!344145 (= condMapEmpty!12438 (= (arr!8641 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3323)) mapDefault!12438)))))

(declare-fun b!344146 () Bool)

(assert (=> b!344146 (= e!210976 tp_is_empty!7333)))

(assert (= (and start!34444 res!190322) b!344139))

(assert (= (and b!344139 res!190320) b!344144))

(assert (= (and b!344144 res!190321) b!344143))

(assert (= (and b!344143 res!190319) b!344140))

(assert (= (and b!344140 res!190318) b!344141))

(assert (= (and b!344141 res!190317) b!344142))

(assert (= (and b!344145 condMapEmpty!12438) mapIsEmpty!12438))

(assert (= (and b!344145 (not condMapEmpty!12438)) mapNonEmpty!12438))

(get-info :version)

(assert (= (and mapNonEmpty!12438 ((_ is ValueCellFull!3323) mapValue!12438)) b!344138))

(assert (= (and b!344145 ((_ is ValueCellFull!3323) mapDefault!12438)) b!344146))

(assert (= start!34444 b!344145))

(declare-fun m!346101 () Bool)

(assert (=> b!344140 m!346101))

(declare-fun m!346103 () Bool)

(assert (=> b!344142 m!346103))

(declare-fun m!346105 () Bool)

(assert (=> mapNonEmpty!12438 m!346105))

(declare-fun m!346107 () Bool)

(assert (=> b!344144 m!346107))

(declare-fun m!346109 () Bool)

(assert (=> b!344141 m!346109))

(assert (=> b!344141 m!346109))

(declare-fun m!346111 () Bool)

(assert (=> b!344141 m!346111))

(declare-fun m!346113 () Bool)

(assert (=> start!34444 m!346113))

(declare-fun m!346115 () Bool)

(assert (=> start!34444 m!346115))

(declare-fun m!346117 () Bool)

(assert (=> start!34444 m!346117))

(declare-fun m!346119 () Bool)

(assert (=> b!344143 m!346119))

(check-sat (not b!344143) (not b!344142) tp_is_empty!7333 b_and!14603 (not b!344140) (not mapNonEmpty!12438) (not b!344144) (not start!34444) (not b!344141) (not b_next!7381))
(check-sat b_and!14603 (not b_next!7381))
