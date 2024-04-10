; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40980 () Bool)

(assert start!40980)

(declare-fun b_free!10915 () Bool)

(declare-fun b_next!10915 () Bool)

(assert (=> start!40980 (= b_free!10915 (not b_next!10915))))

(declare-fun tp!38572 () Bool)

(declare-fun b_and!19057 () Bool)

(assert (=> start!40980 (= tp!38572 b_and!19057)))

(declare-fun b!456212 () Bool)

(declare-fun e!266592 () Bool)

(declare-fun tp_is_empty!12253 () Bool)

(assert (=> b!456212 (= e!266592 tp_is_empty!12253)))

(declare-fun mapNonEmpty!20020 () Bool)

(declare-fun mapRes!20020 () Bool)

(declare-fun tp!38571 () Bool)

(declare-fun e!266589 () Bool)

(assert (=> mapNonEmpty!20020 (= mapRes!20020 (and tp!38571 e!266589))))

(declare-datatypes ((V!17443 0))(
  ( (V!17444 (val!6171 Int)) )
))
(declare-datatypes ((ValueCell!5783 0))(
  ( (ValueCellFull!5783 (v!8437 V!17443)) (EmptyCell!5783) )
))
(declare-fun mapRest!20020 () (Array (_ BitVec 32) ValueCell!5783))

(declare-fun mapKey!20020 () (_ BitVec 32))

(declare-datatypes ((array!28309 0))(
  ( (array!28310 (arr!13598 (Array (_ BitVec 32) ValueCell!5783)) (size!13950 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28309)

(declare-fun mapValue!20020 () ValueCell!5783)

(assert (=> mapNonEmpty!20020 (= (arr!13598 _values!549) (store mapRest!20020 mapKey!20020 mapValue!20020))))

(declare-fun b!456213 () Bool)

(declare-fun res!272184 () Bool)

(declare-fun e!266593 () Bool)

(assert (=> b!456213 (=> (not res!272184) (not e!266593))))

(declare-datatypes ((array!28311 0))(
  ( (array!28312 (arr!13599 (Array (_ BitVec 32) (_ BitVec 64))) (size!13951 (_ BitVec 32))) )
))
(declare-fun lt!206492 () array!28311)

(declare-datatypes ((List!8203 0))(
  ( (Nil!8200) (Cons!8199 (h!9055 (_ BitVec 64)) (t!14031 List!8203)) )
))
(declare-fun arrayNoDuplicates!0 (array!28311 (_ BitVec 32) List!8203) Bool)

(assert (=> b!456213 (= res!272184 (arrayNoDuplicates!0 lt!206492 #b00000000000000000000000000000000 Nil!8200))))

(declare-fun b!456214 () Bool)

(declare-fun res!272187 () Bool)

(declare-fun e!266588 () Bool)

(assert (=> b!456214 (=> (not res!272187) (not e!266588))))

(declare-fun _keys!709 () array!28311)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456214 (= res!272187 (or (= (select (arr!13599 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13599 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456215 () Bool)

(declare-fun res!272186 () Bool)

(assert (=> b!456215 (=> (not res!272186) (not e!266588))))

(assert (=> b!456215 (= res!272186 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8200))))

(declare-fun b!456216 () Bool)

(declare-fun e!266590 () Bool)

(assert (=> b!456216 (= e!266590 (and e!266592 mapRes!20020))))

(declare-fun condMapEmpty!20020 () Bool)

(declare-fun mapDefault!20020 () ValueCell!5783)

