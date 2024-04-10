; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78534 () Bool)

(assert start!78534)

(declare-fun b!915498 () Bool)

(declare-fun e!513824 () Bool)

(assert (=> b!915498 (= e!513824 false)))

(declare-fun lt!411682 () Bool)

(declare-datatypes ((array!54506 0))(
  ( (array!54507 (arr!26198 (Array (_ BitVec 32) (_ BitVec 64))) (size!26657 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54506)

(declare-datatypes ((List!18375 0))(
  ( (Nil!18372) (Cons!18371 (h!19517 (_ BitVec 64)) (t!25988 List!18375)) )
))
(declare-fun arrayNoDuplicates!0 (array!54506 (_ BitVec 32) List!18375) Bool)

(assert (=> b!915498 (= lt!411682 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18372))))

(declare-fun b!915499 () Bool)

(declare-fun e!513826 () Bool)

(declare-fun tp_is_empty!19255 () Bool)

(assert (=> b!915499 (= e!513826 tp_is_empty!19255)))

(declare-fun b!915500 () Bool)

(declare-fun e!513822 () Bool)

(assert (=> b!915500 (= e!513822 tp_is_empty!19255)))

(declare-fun b!915501 () Bool)

(declare-fun res!617239 () Bool)

(assert (=> b!915501 (=> (not res!617239) (not e!513824))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30639 0))(
  ( (V!30640 (val!9678 Int)) )
))
(declare-datatypes ((ValueCell!9146 0))(
  ( (ValueCellFull!9146 (v!12196 V!30639)) (EmptyCell!9146) )
))
(declare-datatypes ((array!54508 0))(
  ( (array!54509 (arr!26199 (Array (_ BitVec 32) ValueCell!9146)) (size!26658 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54508)

(assert (=> b!915501 (= res!617239 (and (= (size!26658 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26657 _keys!1487) (size!26658 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30639 () Bool)

(declare-fun mapRes!30639 () Bool)

(assert (=> mapIsEmpty!30639 mapRes!30639))

(declare-fun mapNonEmpty!30639 () Bool)

(declare-fun tp!58706 () Bool)

(assert (=> mapNonEmpty!30639 (= mapRes!30639 (and tp!58706 e!513822))))

(declare-fun mapRest!30639 () (Array (_ BitVec 32) ValueCell!9146))

(declare-fun mapValue!30639 () ValueCell!9146)

(declare-fun mapKey!30639 () (_ BitVec 32))

(assert (=> mapNonEmpty!30639 (= (arr!26199 _values!1231) (store mapRest!30639 mapKey!30639 mapValue!30639))))

(declare-fun b!915503 () Bool)

(declare-fun res!617237 () Bool)

(assert (=> b!915503 (=> (not res!617237) (not e!513824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54506 (_ BitVec 32)) Bool)

(assert (=> b!915503 (= res!617237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915502 () Bool)

(declare-fun e!513825 () Bool)

(assert (=> b!915502 (= e!513825 (and e!513826 mapRes!30639))))

(declare-fun condMapEmpty!30639 () Bool)

(declare-fun mapDefault!30639 () ValueCell!9146)

