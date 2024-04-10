; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38324 () Bool)

(assert start!38324)

(declare-fun b!395287 () Bool)

(declare-fun e!239318 () Bool)

(declare-fun tp_is_empty!9803 () Bool)

(assert (=> b!395287 (= e!239318 tp_is_empty!9803)))

(declare-fun mapIsEmpty!16314 () Bool)

(declare-fun mapRes!16314 () Bool)

(assert (=> mapIsEmpty!16314 mapRes!16314))

(declare-fun b!395288 () Bool)

(declare-fun res!226610 () Bool)

(declare-fun e!239317 () Bool)

(assert (=> b!395288 (=> (not res!226610) (not e!239317))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395288 (= res!226610 (validKeyInArray!0 k!794))))

(declare-fun res!226614 () Bool)

(assert (=> start!38324 (=> (not res!226614) (not e!239317))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23511 0))(
  ( (array!23512 (arr!11209 (Array (_ BitVec 32) (_ BitVec 64))) (size!11561 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23511)

(assert (=> start!38324 (= res!226614 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11561 _keys!709))))))

(assert (=> start!38324 e!239317))

(assert (=> start!38324 true))

(declare-datatypes ((V!14175 0))(
  ( (V!14176 (val!4946 Int)) )
))
(declare-datatypes ((ValueCell!4558 0))(
  ( (ValueCellFull!4558 (v!7192 V!14175)) (EmptyCell!4558) )
))
(declare-datatypes ((array!23513 0))(
  ( (array!23514 (arr!11210 (Array (_ BitVec 32) ValueCell!4558)) (size!11562 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23513)

(declare-fun e!239320 () Bool)

(declare-fun array_inv!8228 (array!23513) Bool)

(assert (=> start!38324 (and (array_inv!8228 _values!549) e!239320)))

(declare-fun array_inv!8229 (array!23511) Bool)

(assert (=> start!38324 (array_inv!8229 _keys!709)))

(declare-fun mapNonEmpty!16314 () Bool)

(declare-fun tp!32109 () Bool)

(declare-fun e!239316 () Bool)

(assert (=> mapNonEmpty!16314 (= mapRes!16314 (and tp!32109 e!239316))))

(declare-fun mapRest!16314 () (Array (_ BitVec 32) ValueCell!4558))

(declare-fun mapKey!16314 () (_ BitVec 32))

(declare-fun mapValue!16314 () ValueCell!4558)

(assert (=> mapNonEmpty!16314 (= (arr!11210 _values!549) (store mapRest!16314 mapKey!16314 mapValue!16314))))

(declare-fun b!395289 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395289 (= e!239317 (and (or (= (select (arr!11209 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11209 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!11561 _keys!709)) (bvsge (size!11561 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395290 () Bool)

(assert (=> b!395290 (= e!239320 (and e!239318 mapRes!16314))))

(declare-fun condMapEmpty!16314 () Bool)

(declare-fun mapDefault!16314 () ValueCell!4558)

