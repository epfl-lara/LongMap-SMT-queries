; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34448 () Bool)

(assert start!34448)

(declare-fun b_free!7371 () Bool)

(declare-fun b_next!7371 () Bool)

(assert (=> start!34448 (= b_free!7371 (not b_next!7371))))

(declare-fun tp!25659 () Bool)

(declare-fun b_and!14579 () Bool)

(assert (=> start!34448 (= tp!25659 b_and!14579)))

(declare-fun b!344056 () Bool)

(declare-fun e!210937 () Bool)

(declare-fun e!210938 () Bool)

(declare-fun mapRes!12423 () Bool)

(assert (=> b!344056 (= e!210937 (and e!210938 mapRes!12423))))

(declare-fun condMapEmpty!12423 () Bool)

(declare-datatypes ((V!10741 0))(
  ( (V!10742 (val!3706 Int)) )
))
(declare-datatypes ((ValueCell!3318 0))(
  ( (ValueCellFull!3318 (v!5882 V!10741)) (EmptyCell!3318) )
))
(declare-datatypes ((array!18237 0))(
  ( (array!18238 (arr!8635 (Array (_ BitVec 32) ValueCell!3318)) (size!8987 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18237)

(declare-fun mapDefault!12423 () ValueCell!3318)

(assert (=> b!344056 (= condMapEmpty!12423 (= (arr!8635 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3318)) mapDefault!12423)))))

(declare-fun b!344057 () Bool)

(declare-fun e!210939 () Bool)

(declare-fun tp_is_empty!7323 () Bool)

(assert (=> b!344057 (= e!210939 tp_is_empty!7323)))

(declare-fun b!344058 () Bool)

(declare-fun res!190235 () Bool)

(declare-fun e!210935 () Bool)

(assert (=> b!344058 (=> (not res!190235) (not e!210935))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10741)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10741)

(declare-datatypes ((array!18239 0))(
  ( (array!18240 (arr!8636 (Array (_ BitVec 32) (_ BitVec 64))) (size!8988 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18239)

(declare-datatypes ((tuple2!5364 0))(
  ( (tuple2!5365 (_1!2693 (_ BitVec 64)) (_2!2693 V!10741)) )
))
(declare-datatypes ((List!4986 0))(
  ( (Nil!4983) (Cons!4982 (h!5838 tuple2!5364) (t!10102 List!4986)) )
))
(declare-datatypes ((ListLongMap!4277 0))(
  ( (ListLongMap!4278 (toList!2154 List!4986)) )
))
(declare-fun contains!2212 (ListLongMap!4277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1675 (array!18239 array!18237 (_ BitVec 32) (_ BitVec 32) V!10741 V!10741 (_ BitVec 32) Int) ListLongMap!4277)

(assert (=> b!344058 (= res!190235 (not (contains!2212 (getCurrentListMap!1675 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344059 () Bool)

(declare-fun res!190232 () Bool)

(assert (=> b!344059 (=> (not res!190232) (not e!210935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18239 (_ BitVec 32)) Bool)

(assert (=> b!344059 (= res!190232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12423 () Bool)

(declare-fun tp!25658 () Bool)

(assert (=> mapNonEmpty!12423 (= mapRes!12423 (and tp!25658 e!210939))))

(declare-fun mapRest!12423 () (Array (_ BitVec 32) ValueCell!3318))

(declare-fun mapKey!12423 () (_ BitVec 32))

(declare-fun mapValue!12423 () ValueCell!3318)

(assert (=> mapNonEmpty!12423 (= (arr!8635 _values!1525) (store mapRest!12423 mapKey!12423 mapValue!12423))))

(declare-fun res!190230 () Bool)

(assert (=> start!34448 (=> (not res!190230) (not e!210935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34448 (= res!190230 (validMask!0 mask!2385))))

(assert (=> start!34448 e!210935))

(assert (=> start!34448 true))

(assert (=> start!34448 tp_is_empty!7323))

(assert (=> start!34448 tp!25659))

(declare-fun array_inv!6400 (array!18237) Bool)

(assert (=> start!34448 (and (array_inv!6400 _values!1525) e!210937)))

(declare-fun array_inv!6401 (array!18239) Bool)

(assert (=> start!34448 (array_inv!6401 _keys!1895)))

(declare-fun b!344060 () Bool)

(assert (=> b!344060 (= e!210938 tp_is_empty!7323)))

(declare-fun b!344061 () Bool)

(declare-fun res!190234 () Bool)

(assert (=> b!344061 (=> (not res!190234) (not e!210935))))

(declare-datatypes ((List!4987 0))(
  ( (Nil!4984) (Cons!4983 (h!5839 (_ BitVec 64)) (t!10103 List!4987)) )
))
(declare-fun arrayNoDuplicates!0 (array!18239 (_ BitVec 32) List!4987) Bool)

(assert (=> b!344061 (= res!190234 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4984))))

(declare-fun b!344062 () Bool)

(assert (=> b!344062 (= e!210935 false)))

(declare-datatypes ((SeekEntryResult!3333 0))(
  ( (MissingZero!3333 (index!15511 (_ BitVec 32))) (Found!3333 (index!15512 (_ BitVec 32))) (Intermediate!3333 (undefined!4145 Bool) (index!15513 (_ BitVec 32)) (x!34255 (_ BitVec 32))) (Undefined!3333) (MissingVacant!3333 (index!15514 (_ BitVec 32))) )
))
(declare-fun lt!162631 () SeekEntryResult!3333)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18239 (_ BitVec 32)) SeekEntryResult!3333)

(assert (=> b!344062 (= lt!162631 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344063 () Bool)

(declare-fun res!190231 () Bool)

(assert (=> b!344063 (=> (not res!190231) (not e!210935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344063 (= res!190231 (validKeyInArray!0 k0!1348))))

(declare-fun b!344064 () Bool)

(declare-fun res!190233 () Bool)

(assert (=> b!344064 (=> (not res!190233) (not e!210935))))

(assert (=> b!344064 (= res!190233 (and (= (size!8987 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8988 _keys!1895) (size!8987 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12423 () Bool)

(assert (=> mapIsEmpty!12423 mapRes!12423))

(assert (= (and start!34448 res!190230) b!344064))

(assert (= (and b!344064 res!190233) b!344059))

(assert (= (and b!344059 res!190232) b!344061))

(assert (= (and b!344061 res!190234) b!344063))

(assert (= (and b!344063 res!190231) b!344058))

(assert (= (and b!344058 res!190235) b!344062))

(assert (= (and b!344056 condMapEmpty!12423) mapIsEmpty!12423))

(assert (= (and b!344056 (not condMapEmpty!12423)) mapNonEmpty!12423))

(get-info :version)

(assert (= (and mapNonEmpty!12423 ((_ is ValueCellFull!3318) mapValue!12423)) b!344057))

(assert (= (and b!344056 ((_ is ValueCellFull!3318) mapDefault!12423)) b!344060))

(assert (= start!34448 b!344056))

(declare-fun m!345777 () Bool)

(assert (=> b!344061 m!345777))

(declare-fun m!345779 () Bool)

(assert (=> b!344062 m!345779))

(declare-fun m!345781 () Bool)

(assert (=> start!34448 m!345781))

(declare-fun m!345783 () Bool)

(assert (=> start!34448 m!345783))

(declare-fun m!345785 () Bool)

(assert (=> start!34448 m!345785))

(declare-fun m!345787 () Bool)

(assert (=> b!344058 m!345787))

(assert (=> b!344058 m!345787))

(declare-fun m!345789 () Bool)

(assert (=> b!344058 m!345789))

(declare-fun m!345791 () Bool)

(assert (=> b!344063 m!345791))

(declare-fun m!345793 () Bool)

(assert (=> b!344059 m!345793))

(declare-fun m!345795 () Bool)

(assert (=> mapNonEmpty!12423 m!345795))

(check-sat (not b_next!7371) (not mapNonEmpty!12423) (not b!344063) b_and!14579 (not b!344059) (not start!34448) (not b!344061) tp_is_empty!7323 (not b!344062) (not b!344058))
(check-sat b_and!14579 (not b_next!7371))
