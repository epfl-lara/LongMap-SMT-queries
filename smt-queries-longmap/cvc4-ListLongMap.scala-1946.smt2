; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34426 () Bool)

(assert start!34426)

(declare-fun b_free!7349 () Bool)

(declare-fun b_next!7349 () Bool)

(assert (=> start!34426 (= b_free!7349 (not b_next!7349))))

(declare-fun tp!25593 () Bool)

(declare-fun b_and!14557 () Bool)

(assert (=> start!34426 (= tp!25593 b_and!14557)))

(declare-fun b!343759 () Bool)

(declare-fun res!190034 () Bool)

(declare-fun e!210774 () Bool)

(assert (=> b!343759 (=> (not res!190034) (not e!210774))))

(declare-datatypes ((array!18195 0))(
  ( (array!18196 (arr!8614 (Array (_ BitVec 32) (_ BitVec 64))) (size!8966 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18195)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18195 (_ BitVec 32)) Bool)

(assert (=> b!343759 (= res!190034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343760 () Bool)

(declare-fun e!210772 () Bool)

(declare-fun tp_is_empty!7301 () Bool)

(assert (=> b!343760 (= e!210772 tp_is_empty!7301)))

(declare-fun b!343761 () Bool)

(declare-fun res!190032 () Bool)

(assert (=> b!343761 (=> (not res!190032) (not e!210774))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343761 (= res!190032 (validKeyInArray!0 k!1348))))

(declare-fun b!343762 () Bool)

(declare-fun res!190035 () Bool)

(assert (=> b!343762 (=> (not res!190035) (not e!210774))))

(declare-datatypes ((V!10711 0))(
  ( (V!10712 (val!3695 Int)) )
))
(declare-fun zeroValue!1467 () V!10711)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3307 0))(
  ( (ValueCellFull!3307 (v!5871 V!10711)) (EmptyCell!3307) )
))
(declare-datatypes ((array!18197 0))(
  ( (array!18198 (arr!8615 (Array (_ BitVec 32) ValueCell!3307)) (size!8967 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18197)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10711)

(declare-datatypes ((tuple2!5350 0))(
  ( (tuple2!5351 (_1!2686 (_ BitVec 64)) (_2!2686 V!10711)) )
))
(declare-datatypes ((List!4970 0))(
  ( (Nil!4967) (Cons!4966 (h!5822 tuple2!5350) (t!10086 List!4970)) )
))
(declare-datatypes ((ListLongMap!4263 0))(
  ( (ListLongMap!4264 (toList!2147 List!4970)) )
))
(declare-fun contains!2205 (ListLongMap!4263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1668 (array!18195 array!18197 (_ BitVec 32) (_ BitVec 32) V!10711 V!10711 (_ BitVec 32) Int) ListLongMap!4263)

(assert (=> b!343762 (= res!190035 (not (contains!2205 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12390 () Bool)

(declare-fun mapRes!12390 () Bool)

(declare-fun tp!25592 () Bool)

(assert (=> mapNonEmpty!12390 (= mapRes!12390 (and tp!25592 e!210772))))

(declare-fun mapKey!12390 () (_ BitVec 32))

(declare-fun mapValue!12390 () ValueCell!3307)

(declare-fun mapRest!12390 () (Array (_ BitVec 32) ValueCell!3307))

(assert (=> mapNonEmpty!12390 (= (arr!8615 _values!1525) (store mapRest!12390 mapKey!12390 mapValue!12390))))

(declare-fun res!190037 () Bool)

(assert (=> start!34426 (=> (not res!190037) (not e!210774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34426 (= res!190037 (validMask!0 mask!2385))))

(assert (=> start!34426 e!210774))

(assert (=> start!34426 true))

(assert (=> start!34426 tp_is_empty!7301))

(assert (=> start!34426 tp!25593))

(declare-fun e!210773 () Bool)

(declare-fun array_inv!6382 (array!18197) Bool)

(assert (=> start!34426 (and (array_inv!6382 _values!1525) e!210773)))

(declare-fun array_inv!6383 (array!18195) Bool)

(assert (=> start!34426 (array_inv!6383 _keys!1895)))

(declare-fun mapIsEmpty!12390 () Bool)

(assert (=> mapIsEmpty!12390 mapRes!12390))

(declare-fun b!343763 () Bool)

(declare-fun e!210771 () Bool)

(assert (=> b!343763 (= e!210771 tp_is_empty!7301)))

(declare-fun b!343764 () Bool)

(declare-datatypes ((SeekEntryResult!3325 0))(
  ( (MissingZero!3325 (index!15479 (_ BitVec 32))) (Found!3325 (index!15480 (_ BitVec 32))) (Intermediate!3325 (undefined!4137 Bool) (index!15481 (_ BitVec 32)) (x!34215 (_ BitVec 32))) (Undefined!3325) (MissingVacant!3325 (index!15482 (_ BitVec 32))) )
))
(declare-fun lt!162598 () SeekEntryResult!3325)

(assert (=> b!343764 (= e!210774 (and (not (is-Found!3325 lt!162598)) (not (is-MissingZero!3325 lt!162598)) (not (is-MissingVacant!3325 lt!162598)) (is-Undefined!3325 lt!162598) (not (= (size!8966 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18195 (_ BitVec 32)) SeekEntryResult!3325)

(assert (=> b!343764 (= lt!162598 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343765 () Bool)

(declare-fun res!190036 () Bool)

(assert (=> b!343765 (=> (not res!190036) (not e!210774))))

(declare-datatypes ((List!4971 0))(
  ( (Nil!4968) (Cons!4967 (h!5823 (_ BitVec 64)) (t!10087 List!4971)) )
))
(declare-fun arrayNoDuplicates!0 (array!18195 (_ BitVec 32) List!4971) Bool)

(assert (=> b!343765 (= res!190036 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4968))))

(declare-fun b!343766 () Bool)

(assert (=> b!343766 (= e!210773 (and e!210771 mapRes!12390))))

(declare-fun condMapEmpty!12390 () Bool)

(declare-fun mapDefault!12390 () ValueCell!3307)

