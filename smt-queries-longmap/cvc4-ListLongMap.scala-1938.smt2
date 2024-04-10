; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34326 () Bool)

(assert start!34326)

(declare-fun b_free!7301 () Bool)

(declare-fun b_next!7301 () Bool)

(assert (=> start!34326 (= b_free!7301 (not b_next!7301))))

(declare-fun tp!25443 () Bool)

(declare-fun b_and!14505 () Bool)

(assert (=> start!34326 (= tp!25443 b_and!14505)))

(declare-fun res!189417 () Bool)

(declare-fun e!210121 () Bool)

(assert (=> start!34326 (=> (not res!189417) (not e!210121))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34326 (= res!189417 (validMask!0 mask!2385))))

(assert (=> start!34326 e!210121))

(assert (=> start!34326 true))

(declare-fun tp_is_empty!7253 () Bool)

(assert (=> start!34326 tp_is_empty!7253))

(assert (=> start!34326 tp!25443))

(declare-datatypes ((V!10647 0))(
  ( (V!10648 (val!3671 Int)) )
))
(declare-datatypes ((ValueCell!3283 0))(
  ( (ValueCellFull!3283 (v!5845 V!10647)) (EmptyCell!3283) )
))
(declare-datatypes ((array!18099 0))(
  ( (array!18100 (arr!8568 (Array (_ BitVec 32) ValueCell!3283)) (size!8920 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18099)

(declare-fun e!210125 () Bool)

(declare-fun array_inv!6344 (array!18099) Bool)

(assert (=> start!34326 (and (array_inv!6344 _values!1525) e!210125)))

(declare-datatypes ((array!18101 0))(
  ( (array!18102 (arr!8569 (Array (_ BitVec 32) (_ BitVec 64))) (size!8921 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18101)

(declare-fun array_inv!6345 (array!18101) Bool)

(assert (=> start!34326 (array_inv!6345 _keys!1895)))

(declare-fun b!342659 () Bool)

(declare-fun e!210120 () Bool)

(assert (=> b!342659 (= e!210120 false)))

(declare-datatypes ((Unit!10681 0))(
  ( (Unit!10682) )
))
(declare-fun lt!162212 () Unit!10681)

(declare-fun e!210126 () Unit!10681)

(assert (=> b!342659 (= lt!162212 e!210126)))

(declare-fun c!52833 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342659 (= c!52833 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342660 () Bool)

(declare-fun Unit!10683 () Unit!10681)

(assert (=> b!342660 (= e!210126 Unit!10683)))

(declare-fun mapNonEmpty!12312 () Bool)

(declare-fun mapRes!12312 () Bool)

(declare-fun tp!25442 () Bool)

(declare-fun e!210122 () Bool)

(assert (=> mapNonEmpty!12312 (= mapRes!12312 (and tp!25442 e!210122))))

(declare-fun mapRest!12312 () (Array (_ BitVec 32) ValueCell!3283))

(declare-fun mapKey!12312 () (_ BitVec 32))

(declare-fun mapValue!12312 () ValueCell!3283)

(assert (=> mapNonEmpty!12312 (= (arr!8568 _values!1525) (store mapRest!12312 mapKey!12312 mapValue!12312))))

(declare-fun b!342661 () Bool)

(declare-fun Unit!10684 () Unit!10681)

(assert (=> b!342661 (= e!210126 Unit!10684)))

(declare-fun zeroValue!1467 () V!10647)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10647)

(declare-fun lt!162213 () Unit!10681)

(declare-fun lemmaArrayContainsKeyThenInListMap!305 (array!18101 array!18099 (_ BitVec 32) (_ BitVec 32) V!10647 V!10647 (_ BitVec 64) (_ BitVec 32) Int) Unit!10681)

(declare-fun arrayScanForKey!0 (array!18101 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342661 (= lt!162213 (lemmaArrayContainsKeyThenInListMap!305 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342661 false))

(declare-fun b!342662 () Bool)

(declare-fun res!189422 () Bool)

(assert (=> b!342662 (=> (not res!189422) (not e!210121))))

(declare-datatypes ((tuple2!5320 0))(
  ( (tuple2!5321 (_1!2671 (_ BitVec 64)) (_2!2671 V!10647)) )
))
(declare-datatypes ((List!4939 0))(
  ( (Nil!4936) (Cons!4935 (h!5791 tuple2!5320) (t!10051 List!4939)) )
))
(declare-datatypes ((ListLongMap!4233 0))(
  ( (ListLongMap!4234 (toList!2132 List!4939)) )
))
(declare-fun contains!2188 (ListLongMap!4233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1653 (array!18101 array!18099 (_ BitVec 32) (_ BitVec 32) V!10647 V!10647 (_ BitVec 32) Int) ListLongMap!4233)

(assert (=> b!342662 (= res!189422 (not (contains!2188 (getCurrentListMap!1653 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342663 () Bool)

(assert (=> b!342663 (= e!210121 e!210120)))

(declare-fun res!189419 () Bool)

(assert (=> b!342663 (=> (not res!189419) (not e!210120))))

(declare-datatypes ((SeekEntryResult!3306 0))(
  ( (MissingZero!3306 (index!15403 (_ BitVec 32))) (Found!3306 (index!15404 (_ BitVec 32))) (Intermediate!3306 (undefined!4118 Bool) (index!15405 (_ BitVec 32)) (x!34112 (_ BitVec 32))) (Undefined!3306) (MissingVacant!3306 (index!15406 (_ BitVec 32))) )
))
(declare-fun lt!162214 () SeekEntryResult!3306)

(assert (=> b!342663 (= res!189419 (and (not (is-Found!3306 lt!162214)) (not (is-MissingZero!3306 lt!162214)) (is-MissingVacant!3306 lt!162214)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18101 (_ BitVec 32)) SeekEntryResult!3306)

(assert (=> b!342663 (= lt!162214 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12312 () Bool)

(assert (=> mapIsEmpty!12312 mapRes!12312))

(declare-fun b!342664 () Bool)

(declare-fun res!189421 () Bool)

(assert (=> b!342664 (=> (not res!189421) (not e!210121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18101 (_ BitVec 32)) Bool)

(assert (=> b!342664 (= res!189421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342665 () Bool)

(declare-fun res!189416 () Bool)

(assert (=> b!342665 (=> (not res!189416) (not e!210121))))

(declare-datatypes ((List!4940 0))(
  ( (Nil!4937) (Cons!4936 (h!5792 (_ BitVec 64)) (t!10052 List!4940)) )
))
(declare-fun arrayNoDuplicates!0 (array!18101 (_ BitVec 32) List!4940) Bool)

(assert (=> b!342665 (= res!189416 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4937))))

(declare-fun b!342666 () Bool)

(assert (=> b!342666 (= e!210122 tp_is_empty!7253)))

(declare-fun b!342667 () Bool)

(declare-fun res!189418 () Bool)

(assert (=> b!342667 (=> (not res!189418) (not e!210121))))

(assert (=> b!342667 (= res!189418 (and (= (size!8920 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8921 _keys!1895) (size!8920 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342668 () Bool)

(declare-fun e!210124 () Bool)

(assert (=> b!342668 (= e!210125 (and e!210124 mapRes!12312))))

(declare-fun condMapEmpty!12312 () Bool)

(declare-fun mapDefault!12312 () ValueCell!3283)

