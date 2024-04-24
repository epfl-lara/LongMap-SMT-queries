; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34468 () Bool)

(assert start!34468)

(declare-fun b_free!7405 () Bool)

(declare-fun b_next!7405 () Bool)

(assert (=> start!34468 (= b_free!7405 (not b_next!7405))))

(declare-fun tp!25761 () Bool)

(declare-fun b_and!14627 () Bool)

(assert (=> start!34468 (= tp!25761 b_and!14627)))

(declare-datatypes ((SeekEntryResult!3294 0))(
  ( (MissingZero!3294 (index!15355 (_ BitVec 32))) (Found!3294 (index!15356 (_ BitVec 32))) (Intermediate!3294 (undefined!4106 Bool) (index!15357 (_ BitVec 32)) (x!34261 (_ BitVec 32))) (Undefined!3294) (MissingVacant!3294 (index!15358 (_ BitVec 32))) )
))
(declare-fun lt!162700 () SeekEntryResult!3294)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!344462 () Bool)

(declare-fun e!211157 () Bool)

(declare-datatypes ((array!18296 0))(
  ( (array!18297 (arr!8664 (Array (_ BitVec 32) (_ BitVec 64))) (size!9016 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18296)

(get-info :version)

(assert (=> b!344462 (= e!211157 (and (not ((_ is Found!3294) lt!162700)) (not ((_ is MissingZero!3294) lt!162700)) (not ((_ is MissingVacant!3294) lt!162700)) (not ((_ is Undefined!3294) lt!162700)) (not (= (size!9016 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18296 (_ BitVec 32)) SeekEntryResult!3294)

(assert (=> b!344462 (= lt!162700 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344463 () Bool)

(declare-fun res!190538 () Bool)

(assert (=> b!344463 (=> (not res!190538) (not e!211157))))

(declare-datatypes ((V!10787 0))(
  ( (V!10788 (val!3723 Int)) )
))
(declare-datatypes ((ValueCell!3335 0))(
  ( (ValueCellFull!3335 (v!5900 V!10787)) (EmptyCell!3335) )
))
(declare-datatypes ((array!18298 0))(
  ( (array!18299 (arr!8665 (Array (_ BitVec 32) ValueCell!3335)) (size!9017 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18298)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344463 (= res!190538 (and (= (size!9017 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9016 _keys!1895) (size!9017 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344464 () Bool)

(declare-fun e!211158 () Bool)

(declare-fun e!211156 () Bool)

(declare-fun mapRes!12474 () Bool)

(assert (=> b!344464 (= e!211158 (and e!211156 mapRes!12474))))

(declare-fun condMapEmpty!12474 () Bool)

(declare-fun mapDefault!12474 () ValueCell!3335)

(assert (=> b!344464 (= condMapEmpty!12474 (= (arr!8665 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3335)) mapDefault!12474)))))

(declare-fun b!344465 () Bool)

(declare-fun res!190536 () Bool)

(assert (=> b!344465 (=> (not res!190536) (not e!211157))))

(declare-fun zeroValue!1467 () V!10787)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10787)

(declare-datatypes ((tuple2!5308 0))(
  ( (tuple2!5309 (_1!2665 (_ BitVec 64)) (_2!2665 V!10787)) )
))
(declare-datatypes ((List!4910 0))(
  ( (Nil!4907) (Cons!4906 (h!5762 tuple2!5308) (t!10018 List!4910)) )
))
(declare-datatypes ((ListLongMap!4223 0))(
  ( (ListLongMap!4224 (toList!2127 List!4910)) )
))
(declare-fun contains!2204 (ListLongMap!4223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1656 (array!18296 array!18298 (_ BitVec 32) (_ BitVec 32) V!10787 V!10787 (_ BitVec 32) Int) ListLongMap!4223)

(assert (=> b!344465 (= res!190536 (not (contains!2204 (getCurrentListMap!1656 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12474 () Bool)

(assert (=> mapIsEmpty!12474 mapRes!12474))

(declare-fun mapNonEmpty!12474 () Bool)

(declare-fun tp!25760 () Bool)

(declare-fun e!211160 () Bool)

(assert (=> mapNonEmpty!12474 (= mapRes!12474 (and tp!25760 e!211160))))

(declare-fun mapRest!12474 () (Array (_ BitVec 32) ValueCell!3335))

(declare-fun mapValue!12474 () ValueCell!3335)

(declare-fun mapKey!12474 () (_ BitVec 32))

(assert (=> mapNonEmpty!12474 (= (arr!8665 _values!1525) (store mapRest!12474 mapKey!12474 mapValue!12474))))

(declare-fun b!344466 () Bool)

(declare-fun tp_is_empty!7357 () Bool)

(assert (=> b!344466 (= e!211160 tp_is_empty!7357)))

(declare-fun b!344467 () Bool)

(declare-fun res!190533 () Bool)

(assert (=> b!344467 (=> (not res!190533) (not e!211157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18296 (_ BitVec 32)) Bool)

(assert (=> b!344467 (= res!190533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344468 () Bool)

(declare-fun res!190535 () Bool)

(assert (=> b!344468 (=> (not res!190535) (not e!211157))))

(declare-datatypes ((List!4911 0))(
  ( (Nil!4908) (Cons!4907 (h!5763 (_ BitVec 64)) (t!10019 List!4911)) )
))
(declare-fun arrayNoDuplicates!0 (array!18296 (_ BitVec 32) List!4911) Bool)

(assert (=> b!344468 (= res!190535 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4908))))

(declare-fun res!190537 () Bool)

(assert (=> start!34468 (=> (not res!190537) (not e!211157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34468 (= res!190537 (validMask!0 mask!2385))))

(assert (=> start!34468 e!211157))

(assert (=> start!34468 true))

(assert (=> start!34468 tp_is_empty!7357))

(assert (=> start!34468 tp!25761))

(declare-fun array_inv!6402 (array!18298) Bool)

(assert (=> start!34468 (and (array_inv!6402 _values!1525) e!211158)))

(declare-fun array_inv!6403 (array!18296) Bool)

(assert (=> start!34468 (array_inv!6403 _keys!1895)))

(declare-fun b!344469 () Bool)

(assert (=> b!344469 (= e!211156 tp_is_empty!7357)))

(declare-fun b!344470 () Bool)

(declare-fun res!190534 () Bool)

(assert (=> b!344470 (=> (not res!190534) (not e!211157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344470 (= res!190534 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34468 res!190537) b!344463))

(assert (= (and b!344463 res!190538) b!344467))

(assert (= (and b!344467 res!190533) b!344468))

(assert (= (and b!344468 res!190535) b!344470))

(assert (= (and b!344470 res!190534) b!344465))

(assert (= (and b!344465 res!190536) b!344462))

(assert (= (and b!344464 condMapEmpty!12474) mapIsEmpty!12474))

(assert (= (and b!344464 (not condMapEmpty!12474)) mapNonEmpty!12474))

(assert (= (and mapNonEmpty!12474 ((_ is ValueCellFull!3335) mapValue!12474)) b!344466))

(assert (= (and b!344464 ((_ is ValueCellFull!3335) mapDefault!12474)) b!344469))

(assert (= start!34468 b!344464))

(declare-fun m!346341 () Bool)

(assert (=> b!344462 m!346341))

(declare-fun m!346343 () Bool)

(assert (=> start!34468 m!346343))

(declare-fun m!346345 () Bool)

(assert (=> start!34468 m!346345))

(declare-fun m!346347 () Bool)

(assert (=> start!34468 m!346347))

(declare-fun m!346349 () Bool)

(assert (=> b!344468 m!346349))

(declare-fun m!346351 () Bool)

(assert (=> b!344465 m!346351))

(assert (=> b!344465 m!346351))

(declare-fun m!346353 () Bool)

(assert (=> b!344465 m!346353))

(declare-fun m!346355 () Bool)

(assert (=> b!344467 m!346355))

(declare-fun m!346357 () Bool)

(assert (=> b!344470 m!346357))

(declare-fun m!346359 () Bool)

(assert (=> mapNonEmpty!12474 m!346359))

(check-sat (not b!344470) (not b!344467) (not start!34468) (not b_next!7405) (not b!344465) b_and!14627 (not b!344468) tp_is_empty!7357 (not b!344462) (not mapNonEmpty!12474))
(check-sat b_and!14627 (not b_next!7405))
