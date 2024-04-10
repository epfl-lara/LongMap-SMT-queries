; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34910 () Bool)

(assert start!34910)

(declare-fun b_free!7651 () Bool)

(declare-fun b_next!7651 () Bool)

(assert (=> start!34910 (= b_free!7651 (not b_next!7651))))

(declare-fun tp!26525 () Bool)

(declare-fun b_and!14877 () Bool)

(assert (=> start!34910 (= tp!26525 b_and!14877)))

(declare-fun b!349592 () Bool)

(declare-fun e!214146 () Bool)

(declare-fun tp_is_empty!7603 () Bool)

(assert (=> b!349592 (= e!214146 tp_is_empty!7603)))

(declare-fun b!349593 () Bool)

(declare-datatypes ((Unit!10819 0))(
  ( (Unit!10820) )
))
(declare-fun e!214148 () Unit!10819)

(declare-fun Unit!10821 () Unit!10819)

(assert (=> b!349593 (= e!214148 Unit!10821)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11115 0))(
  ( (V!11116 (val!3846 Int)) )
))
(declare-fun zeroValue!1467 () V!11115)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3458 0))(
  ( (ValueCellFull!3458 (v!6031 V!11115)) (EmptyCell!3458) )
))
(declare-datatypes ((array!18791 0))(
  ( (array!18792 (arr!8903 (Array (_ BitVec 32) ValueCell!3458)) (size!9255 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18791)

(declare-datatypes ((array!18793 0))(
  ( (array!18794 (arr!8904 (Array (_ BitVec 32) (_ BitVec 64))) (size!9256 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18793)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11115)

(declare-fun lt!164239 () Unit!10819)

(declare-fun lemmaArrayContainsKeyThenInListMap!318 (array!18793 array!18791 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 64) (_ BitVec 32) Int) Unit!10819)

(declare-fun arrayScanForKey!0 (array!18793 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349593 (= lt!164239 (lemmaArrayContainsKeyThenInListMap!318 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349593 false))

(declare-fun mapIsEmpty!12870 () Bool)

(declare-fun mapRes!12870 () Bool)

(assert (=> mapIsEmpty!12870 mapRes!12870))

(declare-fun b!349594 () Bool)

(declare-fun e!214144 () Bool)

(declare-fun e!214150 () Bool)

(assert (=> b!349594 (= e!214144 e!214150)))

(declare-fun res!193753 () Bool)

(assert (=> b!349594 (=> (not res!193753) (not e!214150))))

(declare-datatypes ((SeekEntryResult!3429 0))(
  ( (MissingZero!3429 (index!15895 (_ BitVec 32))) (Found!3429 (index!15896 (_ BitVec 32))) (Intermediate!3429 (undefined!4241 Bool) (index!15897 (_ BitVec 32)) (x!34817 (_ BitVec 32))) (Undefined!3429) (MissingVacant!3429 (index!15898 (_ BitVec 32))) )
))
(declare-fun lt!164236 () SeekEntryResult!3429)

(assert (=> b!349594 (= res!193753 (and (not (is-Found!3429 lt!164236)) (is-MissingZero!3429 lt!164236)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18793 (_ BitVec 32)) SeekEntryResult!3429)

(assert (=> b!349594 (= lt!164236 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!349595 () Bool)

(declare-fun lt!164237 () Bool)

(assert (=> b!349595 (= e!214150 lt!164237)))

(declare-fun lt!164238 () Unit!10819)

(assert (=> b!349595 (= lt!164238 e!214148)))

(declare-fun c!53289 () Bool)

(assert (=> b!349595 (= c!53289 lt!164237)))

(declare-fun arrayContainsKey!0 (array!18793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349595 (= lt!164237 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!349596 () Bool)

(declare-fun res!193756 () Bool)

(assert (=> b!349596 (=> (not res!193756) (not e!214144))))

(declare-datatypes ((tuple2!5554 0))(
  ( (tuple2!5555 (_1!2788 (_ BitVec 64)) (_2!2788 V!11115)) )
))
(declare-datatypes ((List!5175 0))(
  ( (Nil!5172) (Cons!5171 (h!6027 tuple2!5554) (t!10309 List!5175)) )
))
(declare-datatypes ((ListLongMap!4467 0))(
  ( (ListLongMap!4468 (toList!2249 List!5175)) )
))
(declare-fun contains!2316 (ListLongMap!4467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1770 (array!18793 array!18791 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 32) Int) ListLongMap!4467)

(assert (=> b!349596 (= res!193756 (not (contains!2316 (getCurrentListMap!1770 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!193758 () Bool)

(assert (=> start!34910 (=> (not res!193758) (not e!214144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34910 (= res!193758 (validMask!0 mask!2385))))

(assert (=> start!34910 e!214144))

(assert (=> start!34910 true))

(assert (=> start!34910 tp_is_empty!7603))

(assert (=> start!34910 tp!26525))

(declare-fun e!214145 () Bool)

(declare-fun array_inv!6580 (array!18791) Bool)

(assert (=> start!34910 (and (array_inv!6580 _values!1525) e!214145)))

(declare-fun array_inv!6581 (array!18793) Bool)

(assert (=> start!34910 (array_inv!6581 _keys!1895)))

(declare-fun b!349597 () Bool)

(declare-fun Unit!10822 () Unit!10819)

(assert (=> b!349597 (= e!214148 Unit!10822)))

(declare-fun b!349598 () Bool)

(declare-fun res!193754 () Bool)

(assert (=> b!349598 (=> (not res!193754) (not e!214144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349598 (= res!193754 (validKeyInArray!0 k!1348))))

(declare-fun b!349599 () Bool)

(declare-fun res!193757 () Bool)

(assert (=> b!349599 (=> (not res!193757) (not e!214144))))

(declare-datatypes ((List!5176 0))(
  ( (Nil!5173) (Cons!5172 (h!6028 (_ BitVec 64)) (t!10310 List!5176)) )
))
(declare-fun arrayNoDuplicates!0 (array!18793 (_ BitVec 32) List!5176) Bool)

(assert (=> b!349599 (= res!193757 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5173))))

(declare-fun mapNonEmpty!12870 () Bool)

(declare-fun tp!26526 () Bool)

(assert (=> mapNonEmpty!12870 (= mapRes!12870 (and tp!26526 e!214146))))

(declare-fun mapValue!12870 () ValueCell!3458)

(declare-fun mapRest!12870 () (Array (_ BitVec 32) ValueCell!3458))

(declare-fun mapKey!12870 () (_ BitVec 32))

(assert (=> mapNonEmpty!12870 (= (arr!8903 _values!1525) (store mapRest!12870 mapKey!12870 mapValue!12870))))

(declare-fun b!349600 () Bool)

(declare-fun res!193755 () Bool)

(assert (=> b!349600 (=> (not res!193755) (not e!214144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18793 (_ BitVec 32)) Bool)

(assert (=> b!349600 (= res!193755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349601 () Bool)

(declare-fun e!214149 () Bool)

(assert (=> b!349601 (= e!214149 tp_is_empty!7603)))

(declare-fun b!349602 () Bool)

(declare-fun res!193752 () Bool)

(assert (=> b!349602 (=> (not res!193752) (not e!214144))))

(assert (=> b!349602 (= res!193752 (and (= (size!9255 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9256 _keys!1895) (size!9255 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349603 () Bool)

(assert (=> b!349603 (= e!214145 (and e!214149 mapRes!12870))))

(declare-fun condMapEmpty!12870 () Bool)

(declare-fun mapDefault!12870 () ValueCell!3458)

