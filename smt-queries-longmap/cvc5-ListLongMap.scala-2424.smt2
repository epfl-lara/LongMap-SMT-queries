; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38290 () Bool)

(assert start!38290)

(declare-fun b!394950 () Bool)

(declare-fun res!226387 () Bool)

(declare-fun e!239119 () Bool)

(assert (=> b!394950 (=> (not res!226387) (not e!239119))))

(declare-datatypes ((array!23469 0))(
  ( (array!23470 (arr!11189 (Array (_ BitVec 32) (_ BitVec 64))) (size!11541 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23469)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14147 0))(
  ( (V!14148 (val!4935 Int)) )
))
(declare-datatypes ((ValueCell!4547 0))(
  ( (ValueCellFull!4547 (v!7180 V!14147)) (EmptyCell!4547) )
))
(declare-datatypes ((array!23471 0))(
  ( (array!23472 (arr!11190 (Array (_ BitVec 32) ValueCell!4547)) (size!11542 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23471)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394950 (= res!226387 (and (= (size!11542 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11541 _keys!709) (size!11542 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16278 () Bool)

(declare-fun mapRes!16278 () Bool)

(assert (=> mapIsEmpty!16278 mapRes!16278))

(declare-fun b!394951 () Bool)

(declare-fun res!226389 () Bool)

(assert (=> b!394951 (=> (not res!226389) (not e!239119))))

(assert (=> b!394951 (= res!226389 (and (bvsle #b00000000000000000000000000000000 (size!11541 _keys!709)) (bvslt (size!11541 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394952 () Bool)

(declare-fun e!239116 () Bool)

(declare-fun tp_is_empty!9781 () Bool)

(assert (=> b!394952 (= e!239116 tp_is_empty!9781)))

(declare-fun b!394953 () Bool)

(declare-fun e!239120 () Bool)

(assert (=> b!394953 (= e!239119 e!239120)))

(declare-fun res!226391 () Bool)

(assert (=> b!394953 (=> res!226391 e!239120)))

(declare-datatypes ((List!6500 0))(
  ( (Nil!6497) (Cons!6496 (h!7352 (_ BitVec 64)) (t!11674 List!6500)) )
))
(declare-fun contains!2477 (List!6500 (_ BitVec 64)) Bool)

(assert (=> b!394953 (= res!226391 (contains!2477 Nil!6497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394954 () Bool)

(assert (=> b!394954 (= e!239120 (contains!2477 Nil!6497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!16278 () Bool)

(declare-fun tp!32073 () Bool)

(assert (=> mapNonEmpty!16278 (= mapRes!16278 (and tp!32073 e!239116))))

(declare-fun mapRest!16278 () (Array (_ BitVec 32) ValueCell!4547))

(declare-fun mapValue!16278 () ValueCell!4547)

(declare-fun mapKey!16278 () (_ BitVec 32))

(assert (=> mapNonEmpty!16278 (= (arr!11190 _values!549) (store mapRest!16278 mapKey!16278 mapValue!16278))))

(declare-fun b!394955 () Bool)

(declare-fun e!239115 () Bool)

(declare-fun e!239117 () Bool)

(assert (=> b!394955 (= e!239115 (and e!239117 mapRes!16278))))

(declare-fun condMapEmpty!16278 () Bool)

(declare-fun mapDefault!16278 () ValueCell!4547)

