; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38924 () Bool)

(assert start!38924)

(declare-fun b!407210 () Bool)

(declare-fun res!235371 () Bool)

(declare-fun e!244592 () Bool)

(assert (=> b!407210 (=> (not res!235371) (not e!244592))))

(declare-datatypes ((array!24569 0))(
  ( (array!24570 (arr!11734 (Array (_ BitVec 32) (_ BitVec 64))) (size!12086 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24569)

(declare-datatypes ((List!6809 0))(
  ( (Nil!6806) (Cons!6805 (h!7661 (_ BitVec 64)) (t!11983 List!6809)) )
))
(declare-fun arrayNoDuplicates!0 (array!24569 (_ BitVec 32) List!6809) Bool)

(assert (=> b!407210 (= res!235371 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6806))))

(declare-fun b!407211 () Bool)

(declare-fun e!244593 () Bool)

(assert (=> b!407211 (= e!244593 false)))

(declare-fun lt!188609 () Bool)

(declare-fun lt!188608 () array!24569)

(assert (=> b!407211 (= lt!188609 (arrayNoDuplicates!0 lt!188608 #b00000000000000000000000000000000 Nil!6806))))

(declare-fun b!407212 () Bool)

(declare-fun res!235373 () Bool)

(assert (=> b!407212 (=> (not res!235373) (not e!244592))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407212 (= res!235373 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12086 _keys!709))))))

(declare-fun b!407213 () Bool)

(declare-fun e!244596 () Bool)

(declare-fun e!244595 () Bool)

(declare-fun mapRes!17136 () Bool)

(assert (=> b!407213 (= e!244596 (and e!244595 mapRes!17136))))

(declare-fun condMapEmpty!17136 () Bool)

(declare-datatypes ((V!14895 0))(
  ( (V!14896 (val!5216 Int)) )
))
(declare-datatypes ((ValueCell!4828 0))(
  ( (ValueCellFull!4828 (v!7463 V!14895)) (EmptyCell!4828) )
))
(declare-datatypes ((array!24571 0))(
  ( (array!24572 (arr!11735 (Array (_ BitVec 32) ValueCell!4828)) (size!12087 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24571)

(declare-fun mapDefault!17136 () ValueCell!4828)

