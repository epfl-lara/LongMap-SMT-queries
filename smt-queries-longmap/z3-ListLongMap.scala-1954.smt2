; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34472 () Bool)

(assert start!34472)

(declare-fun b_free!7395 () Bool)

(declare-fun b_next!7395 () Bool)

(assert (=> start!34472 (= b_free!7395 (not b_next!7395))))

(declare-fun tp!25731 () Bool)

(declare-fun b_and!14603 () Bool)

(assert (=> start!34472 (= tp!25731 b_and!14603)))

(declare-fun b!344380 () Bool)

(declare-fun e!211116 () Bool)

(assert (=> b!344380 (= e!211116 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3339 0))(
  ( (MissingZero!3339 (index!15535 (_ BitVec 32))) (Found!3339 (index!15536 (_ BitVec 32))) (Intermediate!3339 (undefined!4151 Bool) (index!15537 (_ BitVec 32)) (x!34293 (_ BitVec 32))) (Undefined!3339) (MissingVacant!3339 (index!15538 (_ BitVec 32))) )
))
(declare-fun lt!162667 () SeekEntryResult!3339)

(declare-datatypes ((array!18283 0))(
  ( (array!18284 (arr!8658 (Array (_ BitVec 32) (_ BitVec 64))) (size!9010 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18283)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18283 (_ BitVec 32)) SeekEntryResult!3339)

(assert (=> b!344380 (= lt!162667 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12459 () Bool)

(declare-fun mapRes!12459 () Bool)

(assert (=> mapIsEmpty!12459 mapRes!12459))

(declare-fun b!344381 () Bool)

(declare-fun res!190448 () Bool)

(assert (=> b!344381 (=> (not res!190448) (not e!211116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344381 (= res!190448 (validKeyInArray!0 k0!1348))))

(declare-fun b!344382 () Bool)

(declare-fun e!211117 () Bool)

(declare-fun tp_is_empty!7347 () Bool)

(assert (=> b!344382 (= e!211117 tp_is_empty!7347)))

(declare-fun b!344383 () Bool)

(declare-fun e!211115 () Bool)

(declare-fun e!211119 () Bool)

(assert (=> b!344383 (= e!211115 (and e!211119 mapRes!12459))))

(declare-fun condMapEmpty!12459 () Bool)

(declare-datatypes ((V!10773 0))(
  ( (V!10774 (val!3718 Int)) )
))
(declare-datatypes ((ValueCell!3330 0))(
  ( (ValueCellFull!3330 (v!5894 V!10773)) (EmptyCell!3330) )
))
(declare-datatypes ((array!18285 0))(
  ( (array!18286 (arr!8659 (Array (_ BitVec 32) ValueCell!3330)) (size!9011 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18285)

(declare-fun mapDefault!12459 () ValueCell!3330)

(assert (=> b!344383 (= condMapEmpty!12459 (= (arr!8659 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3330)) mapDefault!12459)))))

(declare-fun res!190450 () Bool)

(assert (=> start!34472 (=> (not res!190450) (not e!211116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34472 (= res!190450 (validMask!0 mask!2385))))

(assert (=> start!34472 e!211116))

(assert (=> start!34472 true))

(assert (=> start!34472 tp_is_empty!7347))

(assert (=> start!34472 tp!25731))

(declare-fun array_inv!6410 (array!18285) Bool)

(assert (=> start!34472 (and (array_inv!6410 _values!1525) e!211115)))

(declare-fun array_inv!6411 (array!18283) Bool)

(assert (=> start!34472 (array_inv!6411 _keys!1895)))

(declare-fun b!344384 () Bool)

(declare-fun res!190449 () Bool)

(assert (=> b!344384 (=> (not res!190449) (not e!211116))))

(declare-datatypes ((List!5004 0))(
  ( (Nil!5001) (Cons!5000 (h!5856 (_ BitVec 64)) (t!10120 List!5004)) )
))
(declare-fun arrayNoDuplicates!0 (array!18283 (_ BitVec 32) List!5004) Bool)

(assert (=> b!344384 (= res!190449 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5001))))

(declare-fun mapNonEmpty!12459 () Bool)

(declare-fun tp!25730 () Bool)

(assert (=> mapNonEmpty!12459 (= mapRes!12459 (and tp!25730 e!211117))))

(declare-fun mapKey!12459 () (_ BitVec 32))

(declare-fun mapValue!12459 () ValueCell!3330)

(declare-fun mapRest!12459 () (Array (_ BitVec 32) ValueCell!3330))

(assert (=> mapNonEmpty!12459 (= (arr!8659 _values!1525) (store mapRest!12459 mapKey!12459 mapValue!12459))))

(declare-fun b!344385 () Bool)

(declare-fun res!190446 () Bool)

(assert (=> b!344385 (=> (not res!190446) (not e!211116))))

(declare-fun zeroValue!1467 () V!10773)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10773)

(declare-datatypes ((tuple2!5384 0))(
  ( (tuple2!5385 (_1!2703 (_ BitVec 64)) (_2!2703 V!10773)) )
))
(declare-datatypes ((List!5005 0))(
  ( (Nil!5002) (Cons!5001 (h!5857 tuple2!5384) (t!10121 List!5005)) )
))
(declare-datatypes ((ListLongMap!4297 0))(
  ( (ListLongMap!4298 (toList!2164 List!5005)) )
))
(declare-fun contains!2222 (ListLongMap!4297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1685 (array!18283 array!18285 (_ BitVec 32) (_ BitVec 32) V!10773 V!10773 (_ BitVec 32) Int) ListLongMap!4297)

(assert (=> b!344385 (= res!190446 (not (contains!2222 (getCurrentListMap!1685 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344386 () Bool)

(declare-fun res!190451 () Bool)

(assert (=> b!344386 (=> (not res!190451) (not e!211116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18283 (_ BitVec 32)) Bool)

(assert (=> b!344386 (= res!190451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344387 () Bool)

(declare-fun res!190447 () Bool)

(assert (=> b!344387 (=> (not res!190447) (not e!211116))))

(assert (=> b!344387 (= res!190447 (and (= (size!9011 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9010 _keys!1895) (size!9011 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344388 () Bool)

(assert (=> b!344388 (= e!211119 tp_is_empty!7347)))

(assert (= (and start!34472 res!190450) b!344387))

(assert (= (and b!344387 res!190447) b!344386))

(assert (= (and b!344386 res!190451) b!344384))

(assert (= (and b!344384 res!190449) b!344381))

(assert (= (and b!344381 res!190448) b!344385))

(assert (= (and b!344385 res!190446) b!344380))

(assert (= (and b!344383 condMapEmpty!12459) mapIsEmpty!12459))

(assert (= (and b!344383 (not condMapEmpty!12459)) mapNonEmpty!12459))

(get-info :version)

(assert (= (and mapNonEmpty!12459 ((_ is ValueCellFull!3330) mapValue!12459)) b!344382))

(assert (= (and b!344383 ((_ is ValueCellFull!3330) mapDefault!12459)) b!344388))

(assert (= start!34472 b!344383))

(declare-fun m!346017 () Bool)

(assert (=> b!344385 m!346017))

(assert (=> b!344385 m!346017))

(declare-fun m!346019 () Bool)

(assert (=> b!344385 m!346019))

(declare-fun m!346021 () Bool)

(assert (=> b!344384 m!346021))

(declare-fun m!346023 () Bool)

(assert (=> b!344386 m!346023))

(declare-fun m!346025 () Bool)

(assert (=> mapNonEmpty!12459 m!346025))

(declare-fun m!346027 () Bool)

(assert (=> b!344381 m!346027))

(declare-fun m!346029 () Bool)

(assert (=> start!34472 m!346029))

(declare-fun m!346031 () Bool)

(assert (=> start!34472 m!346031))

(declare-fun m!346033 () Bool)

(assert (=> start!34472 m!346033))

(declare-fun m!346035 () Bool)

(assert (=> b!344380 m!346035))

(check-sat (not b_next!7395) (not b!344384) (not start!34472) b_and!14603 (not b!344381) (not mapNonEmpty!12459) (not b!344385) (not b!344386) (not b!344380) tp_is_empty!7347)
(check-sat b_and!14603 (not b_next!7395))
