; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78126 () Bool)

(assert start!78126)

(declare-fun b_free!16637 () Bool)

(declare-fun b_next!16637 () Bool)

(assert (=> start!78126 (= b_free!16637 (not b_next!16637))))

(declare-fun tp!58184 () Bool)

(declare-fun b_and!27211 () Bool)

(assert (=> start!78126 (= tp!58184 b_and!27211)))

(declare-fun mapIsEmpty!30307 () Bool)

(declare-fun mapRes!30307 () Bool)

(assert (=> mapIsEmpty!30307 mapRes!30307))

(declare-fun b!911830 () Bool)

(declare-fun res!615148 () Bool)

(declare-fun e!511435 () Bool)

(assert (=> b!911830 (=> (not res!615148) (not e!511435))))

(declare-datatypes ((array!54110 0))(
  ( (array!54111 (arr!26010 (Array (_ BitVec 32) (_ BitVec 64))) (size!26469 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54110)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54110 (_ BitVec 32)) Bool)

(assert (=> b!911830 (= res!615148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911831 () Bool)

(assert (=> b!911831 (= e!511435 false)))

(declare-datatypes ((V!30371 0))(
  ( (V!30372 (val!9578 Int)) )
))
(declare-datatypes ((ValueCell!9046 0))(
  ( (ValueCellFull!9046 (v!12088 V!30371)) (EmptyCell!9046) )
))
(declare-datatypes ((array!54112 0))(
  ( (array!54113 (arr!26011 (Array (_ BitVec 32) ValueCell!9046)) (size!26470 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54112)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30371)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30371)

(declare-fun lt!410516 () Bool)

(declare-datatypes ((tuple2!12476 0))(
  ( (tuple2!12477 (_1!6249 (_ BitVec 64)) (_2!6249 V!30371)) )
))
(declare-datatypes ((List!18269 0))(
  ( (Nil!18266) (Cons!18265 (h!19411 tuple2!12476) (t!25856 List!18269)) )
))
(declare-datatypes ((ListLongMap!11173 0))(
  ( (ListLongMap!11174 (toList!5602 List!18269)) )
))
(declare-fun contains!4647 (ListLongMap!11173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2864 (array!54110 array!54112 (_ BitVec 32) (_ BitVec 32) V!30371 V!30371 (_ BitVec 32) Int) ListLongMap!11173)

(assert (=> b!911831 (= lt!410516 (contains!4647 (getCurrentListMap!2864 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911832 () Bool)

(declare-fun res!615150 () Bool)

(assert (=> b!911832 (=> (not res!615150) (not e!511435))))

(assert (=> b!911832 (= res!615150 (and (= (size!26470 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26469 _keys!1386) (size!26470 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615147 () Bool)

(assert (=> start!78126 (=> (not res!615147) (not e!511435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78126 (= res!615147 (validMask!0 mask!1756))))

(assert (=> start!78126 e!511435))

(declare-fun e!511434 () Bool)

(declare-fun array_inv!20330 (array!54112) Bool)

(assert (=> start!78126 (and (array_inv!20330 _values!1152) e!511434)))

(assert (=> start!78126 tp!58184))

(assert (=> start!78126 true))

(declare-fun tp_is_empty!19055 () Bool)

(assert (=> start!78126 tp_is_empty!19055))

(declare-fun array_inv!20331 (array!54110) Bool)

(assert (=> start!78126 (array_inv!20331 _keys!1386)))

(declare-fun b!911833 () Bool)

(declare-fun e!511437 () Bool)

(assert (=> b!911833 (= e!511434 (and e!511437 mapRes!30307))))

(declare-fun condMapEmpty!30307 () Bool)

(declare-fun mapDefault!30307 () ValueCell!9046)

