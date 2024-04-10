; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78538 () Bool)

(assert start!78538)

(declare-fun res!617257 () Bool)

(declare-fun e!513853 () Bool)

(assert (=> start!78538 (=> (not res!617257) (not e!513853))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78538 (= res!617257 (validMask!0 mask!1881))))

(assert (=> start!78538 e!513853))

(assert (=> start!78538 true))

(declare-datatypes ((V!30643 0))(
  ( (V!30644 (val!9680 Int)) )
))
(declare-datatypes ((ValueCell!9148 0))(
  ( (ValueCellFull!9148 (v!12198 V!30643)) (EmptyCell!9148) )
))
(declare-datatypes ((array!54514 0))(
  ( (array!54515 (arr!26202 (Array (_ BitVec 32) ValueCell!9148)) (size!26661 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54514)

(declare-fun e!513854 () Bool)

(declare-fun array_inv!20452 (array!54514) Bool)

(assert (=> start!78538 (and (array_inv!20452 _values!1231) e!513854)))

(declare-datatypes ((array!54516 0))(
  ( (array!54517 (arr!26203 (Array (_ BitVec 32) (_ BitVec 64))) (size!26662 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54516)

(declare-fun array_inv!20453 (array!54516) Bool)

(assert (=> start!78538 (array_inv!20453 _keys!1487)))

(declare-fun b!915534 () Bool)

(declare-fun e!513852 () Bool)

(declare-fun tp_is_empty!19259 () Bool)

(assert (=> b!915534 (= e!513852 tp_is_empty!19259)))

(declare-fun b!915535 () Bool)

(declare-fun res!617255 () Bool)

(assert (=> b!915535 (=> (not res!617255) (not e!513853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54516 (_ BitVec 32)) Bool)

(assert (=> b!915535 (= res!617255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30645 () Bool)

(declare-fun mapRes!30645 () Bool)

(assert (=> mapIsEmpty!30645 mapRes!30645))

(declare-fun b!915536 () Bool)

(declare-fun res!617256 () Bool)

(assert (=> b!915536 (=> (not res!617256) (not e!513853))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915536 (= res!617256 (and (= (size!26661 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26662 _keys!1487) (size!26661 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30645 () Bool)

(declare-fun tp!58712 () Bool)

(assert (=> mapNonEmpty!30645 (= mapRes!30645 (and tp!58712 e!513852))))

(declare-fun mapRest!30645 () (Array (_ BitVec 32) ValueCell!9148))

(declare-fun mapValue!30645 () ValueCell!9148)

(declare-fun mapKey!30645 () (_ BitVec 32))

(assert (=> mapNonEmpty!30645 (= (arr!26202 _values!1231) (store mapRest!30645 mapKey!30645 mapValue!30645))))

(declare-fun b!915537 () Bool)

(assert (=> b!915537 (= e!513853 false)))

(declare-fun lt!411688 () Bool)

(declare-datatypes ((List!18377 0))(
  ( (Nil!18374) (Cons!18373 (h!19519 (_ BitVec 64)) (t!25990 List!18377)) )
))
(declare-fun arrayNoDuplicates!0 (array!54516 (_ BitVec 32) List!18377) Bool)

(assert (=> b!915537 (= lt!411688 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18374))))

(declare-fun b!915538 () Bool)

(declare-fun e!513855 () Bool)

(assert (=> b!915538 (= e!513855 tp_is_empty!19259)))

(declare-fun b!915539 () Bool)

(assert (=> b!915539 (= e!513854 (and e!513855 mapRes!30645))))

(declare-fun condMapEmpty!30645 () Bool)

(declare-fun mapDefault!30645 () ValueCell!9148)

