; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38254 () Bool)

(assert start!38254)

(declare-fun b!394700 () Bool)

(declare-fun res!226245 () Bool)

(declare-fun e!238942 () Bool)

(assert (=> b!394700 (=> (not res!226245) (not e!238942))))

(declare-datatypes ((array!23431 0))(
  ( (array!23432 (arr!11172 (Array (_ BitVec 32) (_ BitVec 64))) (size!11524 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23431)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14123 0))(
  ( (V!14124 (val!4926 Int)) )
))
(declare-datatypes ((ValueCell!4538 0))(
  ( (ValueCellFull!4538 (v!7171 V!14123)) (EmptyCell!4538) )
))
(declare-datatypes ((array!23433 0))(
  ( (array!23434 (arr!11173 (Array (_ BitVec 32) ValueCell!4538)) (size!11525 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23433)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394700 (= res!226245 (and (= (size!11525 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11524 _keys!709) (size!11525 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394701 () Bool)

(declare-fun e!238944 () Bool)

(declare-fun tp_is_empty!9763 () Bool)

(assert (=> b!394701 (= e!238944 tp_is_empty!9763)))

(declare-fun mapIsEmpty!16245 () Bool)

(declare-fun mapRes!16245 () Bool)

(assert (=> mapIsEmpty!16245 mapRes!16245))

(declare-fun b!394702 () Bool)

(declare-fun res!226246 () Bool)

(assert (=> b!394702 (=> (not res!226246) (not e!238942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23431 (_ BitVec 32)) Bool)

(assert (=> b!394702 (= res!226246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394704 () Bool)

(declare-fun e!238945 () Bool)

(declare-fun e!238943 () Bool)

(assert (=> b!394704 (= e!238945 (and e!238943 mapRes!16245))))

(declare-fun condMapEmpty!16245 () Bool)

(declare-fun mapDefault!16245 () ValueCell!4538)

