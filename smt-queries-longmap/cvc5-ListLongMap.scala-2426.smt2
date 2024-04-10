; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38314 () Bool)

(assert start!38314)

(declare-fun b!395137 () Bool)

(declare-fun res!226506 () Bool)

(declare-fun e!239241 () Bool)

(assert (=> b!395137 (=> (not res!226506) (not e!239241))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395137 (= res!226506 (validKeyInArray!0 k!794))))

(declare-fun res!226508 () Bool)

(assert (=> start!38314 (=> (not res!226508) (not e!239241))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23491 0))(
  ( (array!23492 (arr!11199 (Array (_ BitVec 32) (_ BitVec 64))) (size!11551 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23491)

(assert (=> start!38314 (= res!226508 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11551 _keys!709))))))

(assert (=> start!38314 e!239241))

(assert (=> start!38314 true))

(declare-datatypes ((V!14163 0))(
  ( (V!14164 (val!4941 Int)) )
))
(declare-datatypes ((ValueCell!4553 0))(
  ( (ValueCellFull!4553 (v!7187 V!14163)) (EmptyCell!4553) )
))
(declare-datatypes ((array!23493 0))(
  ( (array!23494 (arr!11200 (Array (_ BitVec 32) ValueCell!4553)) (size!11552 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23493)

(declare-fun e!239242 () Bool)

(declare-fun array_inv!8218 (array!23493) Bool)

(assert (=> start!38314 (and (array_inv!8218 _values!549) e!239242)))

(declare-fun array_inv!8219 (array!23491) Bool)

(assert (=> start!38314 (array_inv!8219 _keys!709)))

(declare-fun b!395138 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395138 (= e!239241 (and (or (= (select (arr!11199 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11199 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!11551 _keys!709))))))

(declare-fun b!395139 () Bool)

(declare-fun res!226505 () Bool)

(assert (=> b!395139 (=> (not res!226505) (not e!239241))))

(declare-datatypes ((List!6504 0))(
  ( (Nil!6501) (Cons!6500 (h!7356 (_ BitVec 64)) (t!11678 List!6504)) )
))
(declare-fun arrayNoDuplicates!0 (array!23491 (_ BitVec 32) List!6504) Bool)

(assert (=> b!395139 (= res!226505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6501))))

(declare-fun b!395140 () Bool)

(declare-fun e!239245 () Bool)

(declare-fun tp_is_empty!9793 () Bool)

(assert (=> b!395140 (= e!239245 tp_is_empty!9793)))

(declare-fun b!395141 () Bool)

(declare-fun e!239243 () Bool)

(declare-fun mapRes!16299 () Bool)

(assert (=> b!395141 (= e!239242 (and e!239243 mapRes!16299))))

(declare-fun condMapEmpty!16299 () Bool)

(declare-fun mapDefault!16299 () ValueCell!4553)

