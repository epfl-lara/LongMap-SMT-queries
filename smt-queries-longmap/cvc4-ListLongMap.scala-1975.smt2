; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34716 () Bool)

(assert start!34716)

(declare-fun b_free!7523 () Bool)

(declare-fun b_next!7523 () Bool)

(assert (=> start!34716 (= b_free!7523 (not b_next!7523))))

(declare-fun tp!26132 () Bool)

(declare-fun b_and!14743 () Bool)

(assert (=> start!34716 (= tp!26132 b_and!14743)))

(declare-fun mapIsEmpty!12669 () Bool)

(declare-fun mapRes!12669 () Bool)

(assert (=> mapIsEmpty!12669 mapRes!12669))

(declare-fun b!347045 () Bool)

(declare-fun res!192049 () Bool)

(declare-fun e!212666 () Bool)

(assert (=> b!347045 (=> (not res!192049) (not e!212666))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347045 (= res!192049 (validKeyInArray!0 k!1348))))

(declare-fun b!347046 () Bool)

(declare-fun e!212667 () Bool)

(assert (=> b!347046 (= e!212666 e!212667)))

(declare-fun res!192045 () Bool)

(assert (=> b!347046 (=> (not res!192045) (not e!212667))))

(declare-datatypes ((SeekEntryResult!3388 0))(
  ( (MissingZero!3388 (index!15731 (_ BitVec 32))) (Found!3388 (index!15732 (_ BitVec 32))) (Intermediate!3388 (undefined!4200 Bool) (index!15733 (_ BitVec 32)) (x!34570 (_ BitVec 32))) (Undefined!3388) (MissingVacant!3388 (index!15734 (_ BitVec 32))) )
))
(declare-fun lt!163479 () SeekEntryResult!3388)

(declare-datatypes ((array!18541 0))(
  ( (array!18542 (arr!8781 (Array (_ BitVec 32) (_ BitVec 64))) (size!9133 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18541)

(assert (=> b!347046 (= res!192045 (and (is-Found!3388 lt!163479) (= (select (arr!8781 _keys!1895) (index!15732 lt!163479)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18541 (_ BitVec 32)) SeekEntryResult!3388)

(assert (=> b!347046 (= lt!163479 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347047 () Bool)

(declare-fun res!192048 () Bool)

(assert (=> b!347047 (=> (not res!192048) (not e!212666))))

(declare-datatypes ((V!10943 0))(
  ( (V!10944 (val!3782 Int)) )
))
(declare-fun zeroValue!1467 () V!10943)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3394 0))(
  ( (ValueCellFull!3394 (v!5964 V!10943)) (EmptyCell!3394) )
))
(declare-datatypes ((array!18543 0))(
  ( (array!18544 (arr!8782 (Array (_ BitVec 32) ValueCell!3394)) (size!9134 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18543)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10943)

(declare-datatypes ((tuple2!5476 0))(
  ( (tuple2!5477 (_1!2749 (_ BitVec 64)) (_2!2749 V!10943)) )
))
(declare-datatypes ((List!5098 0))(
  ( (Nil!5095) (Cons!5094 (h!5950 tuple2!5476) (t!10226 List!5098)) )
))
(declare-datatypes ((ListLongMap!4389 0))(
  ( (ListLongMap!4390 (toList!2210 List!5098)) )
))
(declare-fun contains!2274 (ListLongMap!4389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1731 (array!18541 array!18543 (_ BitVec 32) (_ BitVec 32) V!10943 V!10943 (_ BitVec 32) Int) ListLongMap!4389)

(assert (=> b!347047 (= res!192048 (not (contains!2274 (getCurrentListMap!1731 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!347048 () Bool)

(declare-fun e!212670 () Bool)

(declare-fun tp_is_empty!7475 () Bool)

(assert (=> b!347048 (= e!212670 tp_is_empty!7475)))

(declare-fun mapNonEmpty!12669 () Bool)

(declare-fun tp!26133 () Bool)

(assert (=> mapNonEmpty!12669 (= mapRes!12669 (and tp!26133 e!212670))))

(declare-fun mapRest!12669 () (Array (_ BitVec 32) ValueCell!3394))

(declare-fun mapValue!12669 () ValueCell!3394)

(declare-fun mapKey!12669 () (_ BitVec 32))

(assert (=> mapNonEmpty!12669 (= (arr!8782 _values!1525) (store mapRest!12669 mapKey!12669 mapValue!12669))))

(declare-fun b!347049 () Bool)

(declare-fun res!192050 () Bool)

(assert (=> b!347049 (=> (not res!192050) (not e!212667))))

(declare-fun arrayContainsKey!0 (array!18541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347049 (= res!192050 (arrayContainsKey!0 _keys!1895 k!1348 (index!15732 lt!163479)))))

(declare-fun b!347050 () Bool)

(declare-fun e!212669 () Bool)

(declare-fun e!212668 () Bool)

(assert (=> b!347050 (= e!212669 (and e!212668 mapRes!12669))))

(declare-fun condMapEmpty!12669 () Bool)

(declare-fun mapDefault!12669 () ValueCell!3394)

