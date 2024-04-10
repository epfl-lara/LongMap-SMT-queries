; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34208 () Bool)

(assert start!34208)

(declare-fun b_free!7231 () Bool)

(declare-fun b_next!7231 () Bool)

(assert (=> start!34208 (= b_free!7231 (not b_next!7231))))

(declare-fun tp!25226 () Bool)

(declare-fun b_and!14431 () Bool)

(assert (=> start!34208 (= tp!25226 b_and!14431)))

(declare-fun mapIsEmpty!12201 () Bool)

(declare-fun mapRes!12201 () Bool)

(assert (=> mapIsEmpty!12201 mapRes!12201))

(declare-fun res!188549 () Bool)

(declare-fun e!209240 () Bool)

(assert (=> start!34208 (=> (not res!188549) (not e!209240))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34208 (= res!188549 (validMask!0 mask!2385))))

(assert (=> start!34208 e!209240))

(assert (=> start!34208 true))

(declare-fun tp_is_empty!7183 () Bool)

(assert (=> start!34208 tp_is_empty!7183))

(assert (=> start!34208 tp!25226))

(declare-datatypes ((V!10555 0))(
  ( (V!10556 (val!3636 Int)) )
))
(declare-datatypes ((ValueCell!3248 0))(
  ( (ValueCellFull!3248 (v!5808 V!10555)) (EmptyCell!3248) )
))
(declare-datatypes ((array!17961 0))(
  ( (array!17962 (arr!8501 (Array (_ BitVec 32) ValueCell!3248)) (size!8853 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17961)

(declare-fun e!209243 () Bool)

(declare-fun array_inv!6298 (array!17961) Bool)

(assert (=> start!34208 (and (array_inv!6298 _values!1525) e!209243)))

(declare-datatypes ((array!17963 0))(
  ( (array!17964 (arr!8502 (Array (_ BitVec 32) (_ BitVec 64))) (size!8854 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17963)

(declare-fun array_inv!6299 (array!17963) Bool)

(assert (=> start!34208 (array_inv!6299 _keys!1895)))

(declare-fun b!341155 () Bool)

(declare-fun res!188548 () Bool)

(assert (=> b!341155 (=> (not res!188548) (not e!209240))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341155 (= res!188548 (and (= (size!8853 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8854 _keys!1895) (size!8853 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341156 () Bool)

(declare-fun e!209239 () Bool)

(assert (=> b!341156 (= e!209239 tp_is_empty!7183)))

(declare-fun b!341157 () Bool)

(declare-fun e!209242 () Bool)

(assert (=> b!341157 (= e!209242 false)))

(declare-fun lt!161718 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17963 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341157 (= lt!161718 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341158 () Bool)

(declare-fun res!188552 () Bool)

(assert (=> b!341158 (=> (not res!188552) (not e!209240))))

(declare-fun zeroValue!1467 () V!10555)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10555)

(declare-datatypes ((tuple2!5272 0))(
  ( (tuple2!5273 (_1!2647 (_ BitVec 64)) (_2!2647 V!10555)) )
))
(declare-datatypes ((List!4891 0))(
  ( (Nil!4888) (Cons!4887 (h!5743 tuple2!5272) (t!9999 List!4891)) )
))
(declare-datatypes ((ListLongMap!4185 0))(
  ( (ListLongMap!4186 (toList!2108 List!4891)) )
))
(declare-fun contains!2162 (ListLongMap!4185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1629 (array!17963 array!17961 (_ BitVec 32) (_ BitVec 32) V!10555 V!10555 (_ BitVec 32) Int) ListLongMap!4185)

(assert (=> b!341158 (= res!188552 (not (contains!2162 (getCurrentListMap!1629 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!341159 () Bool)

(assert (=> b!341159 (= e!209240 e!209242)))

(declare-fun res!188546 () Bool)

(assert (=> b!341159 (=> (not res!188546) (not e!209242))))

(declare-datatypes ((SeekEntryResult!3284 0))(
  ( (MissingZero!3284 (index!15315 (_ BitVec 32))) (Found!3284 (index!15316 (_ BitVec 32))) (Intermediate!3284 (undefined!4096 Bool) (index!15317 (_ BitVec 32)) (x!33982 (_ BitVec 32))) (Undefined!3284) (MissingVacant!3284 (index!15318 (_ BitVec 32))) )
))
(declare-fun lt!161719 () SeekEntryResult!3284)

(assert (=> b!341159 (= res!188546 (and (not (is-Found!3284 lt!161719)) (not (is-MissingZero!3284 lt!161719)) (is-MissingVacant!3284 lt!161719)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17963 (_ BitVec 32)) SeekEntryResult!3284)

(assert (=> b!341159 (= lt!161719 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341160 () Bool)

(declare-fun e!209244 () Bool)

(assert (=> b!341160 (= e!209243 (and e!209244 mapRes!12201))))

(declare-fun condMapEmpty!12201 () Bool)

(declare-fun mapDefault!12201 () ValueCell!3248)

