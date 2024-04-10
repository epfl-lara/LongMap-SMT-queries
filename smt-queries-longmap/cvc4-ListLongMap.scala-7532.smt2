; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95500 () Bool)

(assert start!95500)

(declare-fun b!1078517 () Bool)

(declare-fun res!718666 () Bool)

(declare-fun e!616662 () Bool)

(assert (=> b!1078517 (=> (not res!718666) (not e!616662))))

(declare-datatypes ((array!69297 0))(
  ( (array!69298 (arr!33323 (Array (_ BitVec 32) (_ BitVec 64))) (size!33859 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69297)

(declare-datatypes ((List!23241 0))(
  ( (Nil!23238) (Cons!23237 (h!24446 (_ BitVec 64)) (t!32600 List!23241)) )
))
(declare-fun arrayNoDuplicates!0 (array!69297 (_ BitVec 32) List!23241) Bool)

(assert (=> b!1078517 (= res!718666 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23238))))

(declare-fun b!1078519 () Bool)

(declare-fun res!718668 () Bool)

(assert (=> b!1078519 (=> (not res!718668) (not e!616662))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078519 (= res!718668 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33859 _keys!1070))))))

(declare-fun b!1078520 () Bool)

(declare-fun e!616663 () Bool)

(assert (=> b!1078520 (= e!616663 false)))

(declare-fun lt!478650 () Bool)

(declare-fun lt!478651 () array!69297)

(assert (=> b!1078520 (= lt!478650 (arrayNoDuplicates!0 lt!478651 #b00000000000000000000000000000000 Nil!23238))))

(declare-fun b!1078521 () Bool)

(declare-fun res!718663 () Bool)

(assert (=> b!1078521 (=> (not res!718663) (not e!616662))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078521 (= res!718663 (validKeyInArray!0 k!904))))

(declare-fun b!1078522 () Bool)

(declare-fun e!616658 () Bool)

(declare-fun tp_is_empty!26171 () Bool)

(assert (=> b!1078522 (= e!616658 tp_is_empty!26171)))

(declare-fun b!1078518 () Bool)

(declare-fun e!616661 () Bool)

(assert (=> b!1078518 (= e!616661 tp_is_empty!26171)))

(declare-fun res!718662 () Bool)

(assert (=> start!95500 (=> (not res!718662) (not e!616662))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95500 (= res!718662 (validMask!0 mask!1414))))

(assert (=> start!95500 e!616662))

(assert (=> start!95500 true))

(declare-fun array_inv!25740 (array!69297) Bool)

(assert (=> start!95500 (array_inv!25740 _keys!1070)))

(declare-datatypes ((V!40021 0))(
  ( (V!40022 (val!13142 Int)) )
))
(declare-datatypes ((ValueCell!12376 0))(
  ( (ValueCellFull!12376 (v!15763 V!40021)) (EmptyCell!12376) )
))
(declare-datatypes ((array!69299 0))(
  ( (array!69300 (arr!33324 (Array (_ BitVec 32) ValueCell!12376)) (size!33860 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69299)

(declare-fun e!616659 () Bool)

(declare-fun array_inv!25741 (array!69299) Bool)

(assert (=> start!95500 (and (array_inv!25741 _values!874) e!616659)))

(declare-fun b!1078523 () Bool)

(declare-fun res!718665 () Bool)

(assert (=> b!1078523 (=> (not res!718665) (not e!616662))))

(assert (=> b!1078523 (= res!718665 (= (select (arr!33323 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41008 () Bool)

(declare-fun mapRes!41008 () Bool)

(assert (=> mapIsEmpty!41008 mapRes!41008))

(declare-fun mapNonEmpty!41008 () Bool)

(declare-fun tp!78470 () Bool)

(assert (=> mapNonEmpty!41008 (= mapRes!41008 (and tp!78470 e!616658))))

(declare-fun mapKey!41008 () (_ BitVec 32))

(declare-fun mapValue!41008 () ValueCell!12376)

(declare-fun mapRest!41008 () (Array (_ BitVec 32) ValueCell!12376))

(assert (=> mapNonEmpty!41008 (= (arr!33324 _values!874) (store mapRest!41008 mapKey!41008 mapValue!41008))))

(declare-fun b!1078524 () Bool)

(declare-fun res!718667 () Bool)

(assert (=> b!1078524 (=> (not res!718667) (not e!616662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69297 (_ BitVec 32)) Bool)

(assert (=> b!1078524 (= res!718667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078525 () Bool)

(assert (=> b!1078525 (= e!616662 e!616663)))

(declare-fun res!718669 () Bool)

(assert (=> b!1078525 (=> (not res!718669) (not e!616663))))

(assert (=> b!1078525 (= res!718669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478651 mask!1414))))

(assert (=> b!1078525 (= lt!478651 (array!69298 (store (arr!33323 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33859 _keys!1070)))))

(declare-fun b!1078526 () Bool)

(assert (=> b!1078526 (= e!616659 (and e!616661 mapRes!41008))))

(declare-fun condMapEmpty!41008 () Bool)

(declare-fun mapDefault!41008 () ValueCell!12376)

