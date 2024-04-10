; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78528 () Bool)

(assert start!78528)

(declare-fun b!915444 () Bool)

(declare-fun res!617211 () Bool)

(declare-fun e!513781 () Bool)

(assert (=> b!915444 (=> (not res!617211) (not e!513781))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30631 0))(
  ( (V!30632 (val!9675 Int)) )
))
(declare-datatypes ((ValueCell!9143 0))(
  ( (ValueCellFull!9143 (v!12193 V!30631)) (EmptyCell!9143) )
))
(declare-datatypes ((array!54494 0))(
  ( (array!54495 (arr!26192 (Array (_ BitVec 32) ValueCell!9143)) (size!26651 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54494)

(declare-datatypes ((array!54496 0))(
  ( (array!54497 (arr!26193 (Array (_ BitVec 32) (_ BitVec 64))) (size!26652 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54496)

(assert (=> b!915444 (= res!617211 (and (= (size!26651 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26652 _keys!1487) (size!26651 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915445 () Bool)

(assert (=> b!915445 (= e!513781 false)))

(declare-fun lt!411673 () Bool)

(declare-datatypes ((List!18372 0))(
  ( (Nil!18369) (Cons!18368 (h!19514 (_ BitVec 64)) (t!25985 List!18372)) )
))
(declare-fun arrayNoDuplicates!0 (array!54496 (_ BitVec 32) List!18372) Bool)

(assert (=> b!915445 (= lt!411673 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18369))))

(declare-fun mapIsEmpty!30630 () Bool)

(declare-fun mapRes!30630 () Bool)

(assert (=> mapIsEmpty!30630 mapRes!30630))

(declare-fun b!915446 () Bool)

(declare-fun e!513778 () Bool)

(declare-fun tp_is_empty!19249 () Bool)

(assert (=> b!915446 (= e!513778 tp_is_empty!19249)))

(declare-fun b!915447 () Bool)

(declare-fun e!513780 () Bool)

(assert (=> b!915447 (= e!513780 tp_is_empty!19249)))

(declare-fun mapNonEmpty!30630 () Bool)

(declare-fun tp!58697 () Bool)

(assert (=> mapNonEmpty!30630 (= mapRes!30630 (and tp!58697 e!513780))))

(declare-fun mapKey!30630 () (_ BitVec 32))

(declare-fun mapRest!30630 () (Array (_ BitVec 32) ValueCell!9143))

(declare-fun mapValue!30630 () ValueCell!9143)

(assert (=> mapNonEmpty!30630 (= (arr!26192 _values!1231) (store mapRest!30630 mapKey!30630 mapValue!30630))))

(declare-fun b!915449 () Bool)

(declare-fun e!513777 () Bool)

(assert (=> b!915449 (= e!513777 (and e!513778 mapRes!30630))))

(declare-fun condMapEmpty!30630 () Bool)

(declare-fun mapDefault!30630 () ValueCell!9143)

