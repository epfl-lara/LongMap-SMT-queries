; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36680 () Bool)

(assert start!36680)

(declare-fun b!366127 () Bool)

(declare-fun e!224205 () Bool)

(declare-fun tp_is_empty!8503 () Bool)

(assert (=> b!366127 (= e!224205 tp_is_empty!8503)))

(declare-fun b!366129 () Bool)

(declare-fun res!204757 () Bool)

(declare-fun e!224203 () Bool)

(assert (=> b!366129 (=> (not res!204757) (not e!224203))))

(declare-datatypes ((array!20959 0))(
  ( (array!20960 (arr!9951 (Array (_ BitVec 32) (_ BitVec 64))) (size!10303 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20959)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366129 (= res!204757 (or (= (select (arr!9951 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9951 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14310 () Bool)

(declare-fun mapRes!14310 () Bool)

(declare-fun tp!28386 () Bool)

(declare-fun e!224201 () Bool)

(assert (=> mapNonEmpty!14310 (= mapRes!14310 (and tp!28386 e!224201))))

(declare-datatypes ((V!12443 0))(
  ( (V!12444 (val!4296 Int)) )
))
(declare-datatypes ((ValueCell!3908 0))(
  ( (ValueCellFull!3908 (v!6492 V!12443)) (EmptyCell!3908) )
))
(declare-fun mapRest!14310 () (Array (_ BitVec 32) ValueCell!3908))

(declare-fun mapValue!14310 () ValueCell!3908)

(declare-datatypes ((array!20961 0))(
  ( (array!20962 (arr!9952 (Array (_ BitVec 32) ValueCell!3908)) (size!10304 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20961)

(declare-fun mapKey!14310 () (_ BitVec 32))

(assert (=> mapNonEmpty!14310 (= (arr!9952 _values!506) (store mapRest!14310 mapKey!14310 mapValue!14310))))

(declare-fun b!366130 () Bool)

(declare-fun e!224202 () Bool)

(assert (=> b!366130 (= e!224202 (and e!224205 mapRes!14310))))

(declare-fun condMapEmpty!14310 () Bool)

(declare-fun mapDefault!14310 () ValueCell!3908)

