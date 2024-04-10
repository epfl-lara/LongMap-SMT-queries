; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78516 () Bool)

(assert start!78516)

(declare-fun b!915336 () Bool)

(declare-fun e!513689 () Bool)

(declare-fun tp_is_empty!19237 () Bool)

(assert (=> b!915336 (= e!513689 tp_is_empty!19237)))

(declare-fun mapNonEmpty!30612 () Bool)

(declare-fun mapRes!30612 () Bool)

(declare-fun tp!58679 () Bool)

(assert (=> mapNonEmpty!30612 (= mapRes!30612 (and tp!58679 e!513689))))

(declare-datatypes ((V!30615 0))(
  ( (V!30616 (val!9669 Int)) )
))
(declare-datatypes ((ValueCell!9137 0))(
  ( (ValueCellFull!9137 (v!12187 V!30615)) (EmptyCell!9137) )
))
(declare-fun mapRest!30612 () (Array (_ BitVec 32) ValueCell!9137))

(declare-datatypes ((array!54472 0))(
  ( (array!54473 (arr!26181 (Array (_ BitVec 32) ValueCell!9137)) (size!26640 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54472)

(declare-fun mapKey!30612 () (_ BitVec 32))

(declare-fun mapValue!30612 () ValueCell!9137)

(assert (=> mapNonEmpty!30612 (= (arr!26181 _values!1231) (store mapRest!30612 mapKey!30612 mapValue!30612))))

(declare-fun b!915337 () Bool)

(declare-fun e!513691 () Bool)

(assert (=> b!915337 (= e!513691 false)))

(declare-fun lt!411655 () Bool)

(declare-datatypes ((array!54474 0))(
  ( (array!54475 (arr!26182 (Array (_ BitVec 32) (_ BitVec 64))) (size!26641 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54474)

(declare-datatypes ((List!18367 0))(
  ( (Nil!18364) (Cons!18363 (h!19509 (_ BitVec 64)) (t!25980 List!18367)) )
))
(declare-fun arrayNoDuplicates!0 (array!54474 (_ BitVec 32) List!18367) Bool)

(assert (=> b!915337 (= lt!411655 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18364))))

(declare-fun mapIsEmpty!30612 () Bool)

(assert (=> mapIsEmpty!30612 mapRes!30612))

(declare-fun b!915338 () Bool)

(declare-fun e!513690 () Bool)

(declare-fun e!513688 () Bool)

(assert (=> b!915338 (= e!513690 (and e!513688 mapRes!30612))))

(declare-fun condMapEmpty!30612 () Bool)

(declare-fun mapDefault!30612 () ValueCell!9137)

