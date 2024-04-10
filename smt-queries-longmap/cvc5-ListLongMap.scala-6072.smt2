; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78540 () Bool)

(assert start!78540)

(declare-fun b!915552 () Bool)

(declare-fun res!617265 () Bool)

(declare-fun e!513868 () Bool)

(assert (=> b!915552 (=> (not res!617265) (not e!513868))))

(declare-datatypes ((array!54518 0))(
  ( (array!54519 (arr!26204 (Array (_ BitVec 32) (_ BitVec 64))) (size!26663 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54518)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54518 (_ BitVec 32)) Bool)

(assert (=> b!915552 (= res!617265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915553 () Bool)

(declare-fun e!513867 () Bool)

(declare-fun tp_is_empty!19261 () Bool)

(assert (=> b!915553 (= e!513867 tp_is_empty!19261)))

(declare-fun b!915554 () Bool)

(assert (=> b!915554 (= e!513868 false)))

(declare-fun lt!411691 () Bool)

(declare-datatypes ((List!18378 0))(
  ( (Nil!18375) (Cons!18374 (h!19520 (_ BitVec 64)) (t!25991 List!18378)) )
))
(declare-fun arrayNoDuplicates!0 (array!54518 (_ BitVec 32) List!18378) Bool)

(assert (=> b!915554 (= lt!411691 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18375))))

(declare-fun b!915555 () Bool)

(declare-fun e!513869 () Bool)

(assert (=> b!915555 (= e!513869 tp_is_empty!19261)))

(declare-fun b!915556 () Bool)

(declare-fun res!617266 () Bool)

(assert (=> b!915556 (=> (not res!617266) (not e!513868))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30647 0))(
  ( (V!30648 (val!9681 Int)) )
))
(declare-datatypes ((ValueCell!9149 0))(
  ( (ValueCellFull!9149 (v!12199 V!30647)) (EmptyCell!9149) )
))
(declare-datatypes ((array!54520 0))(
  ( (array!54521 (arr!26205 (Array (_ BitVec 32) ValueCell!9149)) (size!26664 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54520)

(assert (=> b!915556 (= res!617266 (and (= (size!26664 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26663 _keys!1487) (size!26664 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915557 () Bool)

(declare-fun e!513870 () Bool)

(declare-fun mapRes!30648 () Bool)

(assert (=> b!915557 (= e!513870 (and e!513869 mapRes!30648))))

(declare-fun condMapEmpty!30648 () Bool)

(declare-fun mapDefault!30648 () ValueCell!9149)

