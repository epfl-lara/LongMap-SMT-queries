; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38786 () Bool)

(assert start!38786)

(declare-fun b!404519 () Bool)

(declare-fun e!243353 () Bool)

(declare-fun tp_is_empty!10205 () Bool)

(assert (=> b!404519 (= e!243353 tp_is_empty!10205)))

(declare-fun b!404520 () Bool)

(declare-fun res!233306 () Bool)

(declare-fun e!243352 () Bool)

(assert (=> b!404520 (=> (not res!233306) (not e!243352))))

(declare-datatypes ((array!24305 0))(
  ( (array!24306 (arr!11602 (Array (_ BitVec 32) (_ BitVec 64))) (size!11954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24305)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14711 0))(
  ( (V!14712 (val!5147 Int)) )
))
(declare-datatypes ((ValueCell!4759 0))(
  ( (ValueCellFull!4759 (v!7394 V!14711)) (EmptyCell!4759) )
))
(declare-datatypes ((array!24307 0))(
  ( (array!24308 (arr!11603 (Array (_ BitVec 32) ValueCell!4759)) (size!11955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24307)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404520 (= res!233306 (and (= (size!11955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11954 _keys!709) (size!11955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404521 () Bool)

(declare-fun e!243349 () Bool)

(assert (=> b!404521 (= e!243352 e!243349)))

(declare-fun res!233300 () Bool)

(assert (=> b!404521 (=> (not res!233300) (not e!243349))))

(declare-fun lt!188195 () array!24305)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24305 (_ BitVec 32)) Bool)

(assert (=> b!404521 (= res!233300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188195 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!404521 (= lt!188195 (array!24306 (store (arr!11602 _keys!709) i!563 k!794) (size!11954 _keys!709)))))

(declare-fun b!404522 () Bool)

(declare-fun e!243351 () Bool)

(assert (=> b!404522 (= e!243351 tp_is_empty!10205)))

(declare-fun mapNonEmpty!16929 () Bool)

(declare-fun mapRes!16929 () Bool)

(declare-fun tp!33048 () Bool)

(assert (=> mapNonEmpty!16929 (= mapRes!16929 (and tp!33048 e!243353))))

(declare-fun mapValue!16929 () ValueCell!4759)

(declare-fun mapKey!16929 () (_ BitVec 32))

(declare-fun mapRest!16929 () (Array (_ BitVec 32) ValueCell!4759))

(assert (=> mapNonEmpty!16929 (= (arr!11603 _values!549) (store mapRest!16929 mapKey!16929 mapValue!16929))))

(declare-fun b!404523 () Bool)

(declare-fun res!233305 () Bool)

(assert (=> b!404523 (=> (not res!233305) (not e!243352))))

(assert (=> b!404523 (= res!233305 (or (= (select (arr!11602 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11602 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404524 () Bool)

(declare-fun res!233301 () Bool)

(assert (=> b!404524 (=> (not res!233301) (not e!243352))))

(assert (=> b!404524 (= res!233301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404525 () Bool)

(declare-fun res!233303 () Bool)

(assert (=> b!404525 (=> (not res!233303) (not e!243352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404525 (= res!233303 (validMask!0 mask!1025))))

(declare-fun b!404526 () Bool)

(declare-fun res!233304 () Bool)

(assert (=> b!404526 (=> (not res!233304) (not e!243352))))

(declare-fun arrayContainsKey!0 (array!24305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404526 (= res!233304 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404527 () Bool)

(declare-fun res!233302 () Bool)

(assert (=> b!404527 (=> (not res!233302) (not e!243352))))

(declare-datatypes ((List!6754 0))(
  ( (Nil!6751) (Cons!6750 (h!7606 (_ BitVec 64)) (t!11928 List!6754)) )
))
(declare-fun arrayNoDuplicates!0 (array!24305 (_ BitVec 32) List!6754) Bool)

(assert (=> b!404527 (= res!233302 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6751))))

(declare-fun b!404528 () Bool)

(declare-fun e!243350 () Bool)

(assert (=> b!404528 (= e!243350 (and e!243351 mapRes!16929))))

(declare-fun condMapEmpty!16929 () Bool)

(declare-fun mapDefault!16929 () ValueCell!4759)

