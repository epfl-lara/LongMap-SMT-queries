; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38938 () Bool)

(assert start!38938)

(declare-fun b!407483 () Bool)

(declare-fun res!235579 () Bool)

(declare-fun e!244719 () Bool)

(assert (=> b!407483 (=> (not res!235579) (not e!244719))))

(declare-datatypes ((array!24595 0))(
  ( (array!24596 (arr!11747 (Array (_ BitVec 32) (_ BitVec 64))) (size!12099 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24595)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407483 (= res!235579 (or (= (select (arr!11747 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11747 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!235578 () Bool)

(assert (=> start!38938 (=> (not res!235578) (not e!244719))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38938 (= res!235578 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12099 _keys!709))))))

(assert (=> start!38938 e!244719))

(assert (=> start!38938 true))

(declare-datatypes ((V!14915 0))(
  ( (V!14916 (val!5223 Int)) )
))
(declare-datatypes ((ValueCell!4835 0))(
  ( (ValueCellFull!4835 (v!7470 V!14915)) (EmptyCell!4835) )
))
(declare-datatypes ((array!24597 0))(
  ( (array!24598 (arr!11748 (Array (_ BitVec 32) ValueCell!4835)) (size!12100 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24597)

(declare-fun e!244718 () Bool)

(declare-fun array_inv!8570 (array!24597) Bool)

(assert (=> start!38938 (and (array_inv!8570 _values!549) e!244718)))

(declare-fun array_inv!8571 (array!24595) Bool)

(assert (=> start!38938 (array_inv!8571 _keys!709)))

(declare-fun b!407484 () Bool)

(declare-fun res!235584 () Bool)

(assert (=> b!407484 (=> (not res!235584) (not e!244719))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407484 (= res!235584 (validMask!0 mask!1025))))

(declare-fun b!407485 () Bool)

(declare-fun e!244717 () Bool)

(declare-fun tp_is_empty!10357 () Bool)

(assert (=> b!407485 (= e!244717 tp_is_empty!10357)))

(declare-fun b!407486 () Bool)

(declare-fun res!235585 () Bool)

(assert (=> b!407486 (=> (not res!235585) (not e!244719))))

(declare-datatypes ((List!6814 0))(
  ( (Nil!6811) (Cons!6810 (h!7666 (_ BitVec 64)) (t!11988 List!6814)) )
))
(declare-fun arrayNoDuplicates!0 (array!24595 (_ BitVec 32) List!6814) Bool)

(assert (=> b!407486 (= res!235585 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6811))))

(declare-fun b!407487 () Bool)

(declare-fun res!235582 () Bool)

(assert (=> b!407487 (=> (not res!235582) (not e!244719))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407487 (= res!235582 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!407488 () Bool)

(declare-fun e!244722 () Bool)

(assert (=> b!407488 (= e!244719 e!244722)))

(declare-fun res!235586 () Bool)

(assert (=> b!407488 (=> (not res!235586) (not e!244722))))

(declare-fun lt!188651 () array!24595)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24595 (_ BitVec 32)) Bool)

(assert (=> b!407488 (= res!235586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188651 mask!1025))))

(assert (=> b!407488 (= lt!188651 (array!24596 (store (arr!11747 _keys!709) i!563 k!794) (size!12099 _keys!709)))))

(declare-fun b!407489 () Bool)

(declare-fun res!235581 () Bool)

(assert (=> b!407489 (=> (not res!235581) (not e!244719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407489 (= res!235581 (validKeyInArray!0 k!794))))

(declare-fun b!407490 () Bool)

(declare-fun e!244720 () Bool)

(declare-fun mapRes!17157 () Bool)

(assert (=> b!407490 (= e!244718 (and e!244720 mapRes!17157))))

(declare-fun condMapEmpty!17157 () Bool)

(declare-fun mapDefault!17157 () ValueCell!4835)

