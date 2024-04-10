; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78546 () Bool)

(assert start!78546)

(declare-fun b!915608 () Bool)

(declare-fun e!513913 () Bool)

(declare-fun tp_is_empty!19267 () Bool)

(assert (=> b!915608 (= e!513913 tp_is_empty!19267)))

(declare-fun mapNonEmpty!30657 () Bool)

(declare-fun mapRes!30657 () Bool)

(declare-fun tp!58724 () Bool)

(declare-fun e!513915 () Bool)

(assert (=> mapNonEmpty!30657 (= mapRes!30657 (and tp!58724 e!513915))))

(declare-datatypes ((V!30655 0))(
  ( (V!30656 (val!9684 Int)) )
))
(declare-datatypes ((ValueCell!9152 0))(
  ( (ValueCellFull!9152 (v!12202 V!30655)) (EmptyCell!9152) )
))
(declare-fun mapValue!30657 () ValueCell!9152)

(declare-fun mapKey!30657 () (_ BitVec 32))

(declare-datatypes ((array!54530 0))(
  ( (array!54531 (arr!26210 (Array (_ BitVec 32) ValueCell!9152)) (size!26669 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54530)

(declare-fun mapRest!30657 () (Array (_ BitVec 32) ValueCell!9152))

(assert (=> mapNonEmpty!30657 (= (arr!26210 _values!1231) (store mapRest!30657 mapKey!30657 mapValue!30657))))

(declare-fun b!915610 () Bool)

(declare-fun e!513914 () Bool)

(assert (=> b!915610 (= e!513914 (and e!513913 mapRes!30657))))

(declare-fun condMapEmpty!30657 () Bool)

(declare-fun mapDefault!30657 () ValueCell!9152)

