; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41334 () Bool)

(assert start!41334)

(declare-fun b!462130 () Bool)

(declare-fun e!269602 () Bool)

(declare-fun tp_is_empty!12463 () Bool)

(assert (=> b!462130 (= e!269602 tp_is_empty!12463)))

(declare-fun b!462131 () Bool)

(declare-fun res!276398 () Bool)

(declare-fun e!269598 () Bool)

(assert (=> b!462131 (=> (not res!276398) (not e!269598))))

(declare-datatypes ((array!28727 0))(
  ( (array!28728 (arr!13798 (Array (_ BitVec 32) (_ BitVec 64))) (size!14150 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28727)

(assert (=> b!462131 (= res!276398 (and (bvsle #b00000000000000000000000000000000 (size!14150 _keys!1025)) (bvslt (size!14150 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!20362 () Bool)

(declare-fun mapRes!20362 () Bool)

(assert (=> mapIsEmpty!20362 mapRes!20362))

(declare-fun b!462132 () Bool)

(declare-fun e!269597 () Bool)

(assert (=> b!462132 (= e!269597 (and e!269602 mapRes!20362))))

(declare-fun condMapEmpty!20362 () Bool)

(declare-datatypes ((V!17723 0))(
  ( (V!17724 (val!6276 Int)) )
))
(declare-datatypes ((ValueCell!5888 0))(
  ( (ValueCellFull!5888 (v!8562 V!17723)) (EmptyCell!5888) )
))
(declare-datatypes ((array!28729 0))(
  ( (array!28730 (arr!13799 (Array (_ BitVec 32) ValueCell!5888)) (size!14151 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28729)

(declare-fun mapDefault!20362 () ValueCell!5888)

