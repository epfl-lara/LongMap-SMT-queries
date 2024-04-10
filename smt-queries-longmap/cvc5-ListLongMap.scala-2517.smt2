; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38920 () Bool)

(assert start!38920)

(declare-fun b!407132 () Bool)

(declare-fun e!244560 () Bool)

(declare-fun tp_is_empty!10339 () Bool)

(assert (=> b!407132 (= e!244560 tp_is_empty!10339)))

(declare-fun b!407133 () Bool)

(declare-fun res!235309 () Bool)

(declare-fun e!244558 () Bool)

(assert (=> b!407133 (=> (not res!235309) (not e!244558))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24561 0))(
  ( (array!24562 (arr!11730 (Array (_ BitVec 32) (_ BitVec 64))) (size!12082 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24561)

(assert (=> b!407133 (= res!235309 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12082 _keys!709))))))

(declare-fun mapIsEmpty!17130 () Bool)

(declare-fun mapRes!17130 () Bool)

(assert (=> mapIsEmpty!17130 mapRes!17130))

(declare-fun b!407134 () Bool)

(declare-fun res!235315 () Bool)

(assert (=> b!407134 (=> (not res!235315) (not e!244558))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407134 (= res!235315 (validMask!0 mask!1025))))

(declare-fun b!407135 () Bool)

(declare-fun res!235312 () Bool)

(assert (=> b!407135 (=> (not res!235312) (not e!244558))))

(declare-datatypes ((List!6807 0))(
  ( (Nil!6804) (Cons!6803 (h!7659 (_ BitVec 64)) (t!11981 List!6807)) )
))
(declare-fun arrayNoDuplicates!0 (array!24561 (_ BitVec 32) List!6807) Bool)

(assert (=> b!407135 (= res!235312 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6804))))

(declare-fun b!407136 () Bool)

(declare-fun e!244557 () Bool)

(assert (=> b!407136 (= e!244558 e!244557)))

(declare-fun res!235313 () Bool)

(assert (=> b!407136 (=> (not res!235313) (not e!244557))))

(declare-fun lt!188597 () array!24561)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24561 (_ BitVec 32)) Bool)

(assert (=> b!407136 (= res!235313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188597 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!407136 (= lt!188597 (array!24562 (store (arr!11730 _keys!709) i!563 k!794) (size!12082 _keys!709)))))

(declare-fun b!407137 () Bool)

(declare-fun res!235317 () Bool)

(assert (=> b!407137 (=> (not res!235317) (not e!244558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407137 (= res!235317 (validKeyInArray!0 k!794))))

(declare-fun b!407138 () Bool)

(declare-fun res!235314 () Bool)

(assert (=> b!407138 (=> (not res!235314) (not e!244558))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14891 0))(
  ( (V!14892 (val!5214 Int)) )
))
(declare-datatypes ((ValueCell!4826 0))(
  ( (ValueCellFull!4826 (v!7461 V!14891)) (EmptyCell!4826) )
))
(declare-datatypes ((array!24563 0))(
  ( (array!24564 (arr!11731 (Array (_ BitVec 32) ValueCell!4826)) (size!12083 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24563)

(assert (=> b!407138 (= res!235314 (and (= (size!12083 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12082 _keys!709) (size!12083 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407139 () Bool)

(assert (=> b!407139 (= e!244557 false)))

(declare-fun lt!188596 () Bool)

(assert (=> b!407139 (= lt!188596 (arrayNoDuplicates!0 lt!188597 #b00000000000000000000000000000000 Nil!6804))))

(declare-fun b!407140 () Bool)

(declare-fun e!244556 () Bool)

(assert (=> b!407140 (= e!244556 (and e!244560 mapRes!17130))))

(declare-fun condMapEmpty!17130 () Bool)

(declare-fun mapDefault!17130 () ValueCell!4826)

