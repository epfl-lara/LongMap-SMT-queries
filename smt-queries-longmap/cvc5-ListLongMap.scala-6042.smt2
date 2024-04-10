; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78152 () Bool)

(assert start!78152)

(declare-fun b_free!16663 () Bool)

(declare-fun b_next!16663 () Bool)

(assert (=> start!78152 (= b_free!16663 (not b_next!16663))))

(declare-fun tp!58262 () Bool)

(declare-fun b_and!27237 () Bool)

(assert (=> start!78152 (= tp!58262 b_and!27237)))

(declare-fun b!912104 () Bool)

(declare-fun e!511631 () Bool)

(declare-fun tp_is_empty!19081 () Bool)

(assert (=> b!912104 (= e!511631 tp_is_empty!19081)))

(declare-fun b!912105 () Bool)

(declare-fun e!511629 () Bool)

(assert (=> b!912105 (= e!511629 tp_is_empty!19081)))

(declare-fun b!912106 () Bool)

(declare-fun res!615303 () Bool)

(declare-fun e!511632 () Bool)

(assert (=> b!912106 (=> (not res!615303) (not e!511632))))

(declare-datatypes ((array!54158 0))(
  ( (array!54159 (arr!26034 (Array (_ BitVec 32) (_ BitVec 64))) (size!26493 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54158)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54158 (_ BitVec 32)) Bool)

(assert (=> b!912106 (= res!615303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912107 () Bool)

(declare-fun res!615304 () Bool)

(assert (=> b!912107 (=> (not res!615304) (not e!511632))))

(declare-datatypes ((List!18286 0))(
  ( (Nil!18283) (Cons!18282 (h!19428 (_ BitVec 64)) (t!25873 List!18286)) )
))
(declare-fun arrayNoDuplicates!0 (array!54158 (_ BitVec 32) List!18286) Bool)

(assert (=> b!912107 (= res!615304 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18283))))

(declare-fun b!912108 () Bool)

(declare-fun res!615305 () Bool)

(assert (=> b!912108 (=> (not res!615305) (not e!511632))))

(declare-datatypes ((V!30407 0))(
  ( (V!30408 (val!9591 Int)) )
))
(declare-datatypes ((ValueCell!9059 0))(
  ( (ValueCellFull!9059 (v!12101 V!30407)) (EmptyCell!9059) )
))
(declare-datatypes ((array!54160 0))(
  ( (array!54161 (arr!26035 (Array (_ BitVec 32) ValueCell!9059)) (size!26494 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54160)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912108 (= res!615305 (and (= (size!26494 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26493 _keys!1386) (size!26494 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912109 () Bool)

(assert (=> b!912109 (= e!511632 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30407)

(declare-fun lt!410555 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30407)

(declare-datatypes ((tuple2!12496 0))(
  ( (tuple2!12497 (_1!6259 (_ BitVec 64)) (_2!6259 V!30407)) )
))
(declare-datatypes ((List!18287 0))(
  ( (Nil!18284) (Cons!18283 (h!19429 tuple2!12496) (t!25874 List!18287)) )
))
(declare-datatypes ((ListLongMap!11193 0))(
  ( (ListLongMap!11194 (toList!5612 List!18287)) )
))
(declare-fun contains!4657 (ListLongMap!11193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2874 (array!54158 array!54160 (_ BitVec 32) (_ BitVec 32) V!30407 V!30407 (_ BitVec 32) Int) ListLongMap!11193)

(assert (=> b!912109 (= lt!410555 (contains!4657 (getCurrentListMap!2874 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30346 () Bool)

(declare-fun mapRes!30346 () Bool)

(declare-fun tp!58263 () Bool)

(assert (=> mapNonEmpty!30346 (= mapRes!30346 (and tp!58263 e!511631))))

(declare-fun mapKey!30346 () (_ BitVec 32))

(declare-fun mapRest!30346 () (Array (_ BitVec 32) ValueCell!9059))

(declare-fun mapValue!30346 () ValueCell!9059)

(assert (=> mapNonEmpty!30346 (= (arr!26035 _values!1152) (store mapRest!30346 mapKey!30346 mapValue!30346))))

(declare-fun mapIsEmpty!30346 () Bool)

(assert (=> mapIsEmpty!30346 mapRes!30346))

(declare-fun b!912103 () Bool)

(declare-fun e!511630 () Bool)

(assert (=> b!912103 (= e!511630 (and e!511629 mapRes!30346))))

(declare-fun condMapEmpty!30346 () Bool)

(declare-fun mapDefault!30346 () ValueCell!9059)

