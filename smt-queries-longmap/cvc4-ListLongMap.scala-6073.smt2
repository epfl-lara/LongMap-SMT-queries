; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78550 () Bool)

(assert start!78550)

(declare-fun b!915650 () Bool)

(declare-fun res!617319 () Bool)

(declare-fun e!513944 () Bool)

(assert (=> b!915650 (=> (not res!617319) (not e!513944))))

(declare-datatypes ((array!54536 0))(
  ( (array!54537 (arr!26213 (Array (_ BitVec 32) (_ BitVec 64))) (size!26672 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54536)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30659 0))(
  ( (V!30660 (val!9686 Int)) )
))
(declare-datatypes ((ValueCell!9154 0))(
  ( (ValueCellFull!9154 (v!12204 V!30659)) (EmptyCell!9154) )
))
(declare-datatypes ((array!54538 0))(
  ( (array!54539 (arr!26214 (Array (_ BitVec 32) ValueCell!9154)) (size!26673 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54538)

(assert (=> b!915650 (= res!617319 (and (= (size!26673 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26672 _keys!1487) (size!26673 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30663 () Bool)

(declare-fun mapRes!30663 () Bool)

(declare-fun tp!58730 () Bool)

(declare-fun e!513945 () Bool)

(assert (=> mapNonEmpty!30663 (= mapRes!30663 (and tp!58730 e!513945))))

(declare-fun mapValue!30663 () ValueCell!9154)

(declare-fun mapKey!30663 () (_ BitVec 32))

(declare-fun mapRest!30663 () (Array (_ BitVec 32) ValueCell!9154))

(assert (=> mapNonEmpty!30663 (= (arr!26214 _values!1231) (store mapRest!30663 mapKey!30663 mapValue!30663))))

(declare-fun mapIsEmpty!30663 () Bool)

(assert (=> mapIsEmpty!30663 mapRes!30663))

(declare-fun b!915651 () Bool)

(declare-fun e!513943 () Bool)

(declare-fun e!513946 () Bool)

(assert (=> b!915651 (= e!513943 (and e!513946 mapRes!30663))))

(declare-fun condMapEmpty!30663 () Bool)

(declare-fun mapDefault!30663 () ValueCell!9154)

