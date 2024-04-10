; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38804 () Bool)

(assert start!38804)

(declare-fun b!404870 () Bool)

(declare-fun res!233574 () Bool)

(declare-fun e!243515 () Bool)

(assert (=> b!404870 (=> (not res!233574) (not e!243515))))

(declare-datatypes ((array!24341 0))(
  ( (array!24342 (arr!11620 (Array (_ BitVec 32) (_ BitVec 64))) (size!11972 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24341)

(declare-datatypes ((List!6763 0))(
  ( (Nil!6760) (Cons!6759 (h!7615 (_ BitVec 64)) (t!11937 List!6763)) )
))
(declare-fun arrayNoDuplicates!0 (array!24341 (_ BitVec 32) List!6763) Bool)

(assert (=> b!404870 (= res!233574 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6760))))

(declare-fun b!404871 () Bool)

(declare-fun e!243514 () Bool)

(declare-fun e!243513 () Bool)

(declare-fun mapRes!16956 () Bool)

(assert (=> b!404871 (= e!243514 (and e!243513 mapRes!16956))))

(declare-fun condMapEmpty!16956 () Bool)

(declare-datatypes ((V!14735 0))(
  ( (V!14736 (val!5156 Int)) )
))
(declare-datatypes ((ValueCell!4768 0))(
  ( (ValueCellFull!4768 (v!7403 V!14735)) (EmptyCell!4768) )
))
(declare-datatypes ((array!24343 0))(
  ( (array!24344 (arr!11621 (Array (_ BitVec 32) ValueCell!4768)) (size!11973 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24343)

(declare-fun mapDefault!16956 () ValueCell!4768)

