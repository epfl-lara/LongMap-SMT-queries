; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96310 () Bool)

(assert start!96310)

(declare-fun b!1094493 () Bool)

(declare-fun res!730394 () Bool)

(declare-fun e!624871 () Bool)

(assert (=> b!1094493 (=> (not res!730394) (not e!624871))))

(declare-datatypes ((array!70845 0))(
  ( (array!70846 (arr!34096 (Array (_ BitVec 32) (_ BitVec 64))) (size!34632 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70845)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70845 (_ BitVec 32)) Bool)

(assert (=> b!1094493 (= res!730394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42202 () Bool)

(declare-fun mapRes!42202 () Bool)

(assert (=> mapIsEmpty!42202 mapRes!42202))

(declare-fun res!730395 () Bool)

(assert (=> start!96310 (=> (not res!730395) (not e!624871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96310 (= res!730395 (validMask!0 mask!1414))))

(assert (=> start!96310 e!624871))

(assert (=> start!96310 true))

(declare-datatypes ((V!41081 0))(
  ( (V!41082 (val!13539 Int)) )
))
(declare-datatypes ((ValueCell!12773 0))(
  ( (ValueCellFull!12773 (v!16160 V!41081)) (EmptyCell!12773) )
))
(declare-datatypes ((array!70847 0))(
  ( (array!70848 (arr!34097 (Array (_ BitVec 32) ValueCell!12773)) (size!34633 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70847)

(declare-fun e!624872 () Bool)

(declare-fun array_inv!26274 (array!70847) Bool)

(assert (=> start!96310 (and (array_inv!26274 _values!874) e!624872)))

(declare-fun array_inv!26275 (array!70845) Bool)

(assert (=> start!96310 (array_inv!26275 _keys!1070)))

(declare-fun b!1094494 () Bool)

(declare-fun e!624868 () Bool)

(declare-fun tp_is_empty!26965 () Bool)

(assert (=> b!1094494 (= e!624868 tp_is_empty!26965)))

(declare-fun b!1094495 () Bool)

(declare-fun e!624869 () Bool)

(assert (=> b!1094495 (= e!624869 tp_is_empty!26965)))

(declare-fun mapNonEmpty!42202 () Bool)

(declare-fun tp!80717 () Bool)

(assert (=> mapNonEmpty!42202 (= mapRes!42202 (and tp!80717 e!624868))))

(declare-fun mapRest!42202 () (Array (_ BitVec 32) ValueCell!12773))

(declare-fun mapKey!42202 () (_ BitVec 32))

(declare-fun mapValue!42202 () ValueCell!12773)

(assert (=> mapNonEmpty!42202 (= (arr!34097 _values!874) (store mapRest!42202 mapKey!42202 mapValue!42202))))

(declare-fun b!1094496 () Bool)

(assert (=> b!1094496 (= e!624871 false)))

(declare-fun lt!489658 () Bool)

(declare-datatypes ((List!23819 0))(
  ( (Nil!23816) (Cons!23815 (h!25024 (_ BitVec 64)) (t!33826 List!23819)) )
))
(declare-fun arrayNoDuplicates!0 (array!70845 (_ BitVec 32) List!23819) Bool)

(assert (=> b!1094496 (= lt!489658 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23816))))

(declare-fun b!1094497 () Bool)

(declare-fun res!730393 () Bool)

(assert (=> b!1094497 (=> (not res!730393) (not e!624871))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094497 (= res!730393 (and (= (size!34633 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34632 _keys!1070) (size!34633 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094498 () Bool)

(assert (=> b!1094498 (= e!624872 (and e!624869 mapRes!42202))))

(declare-fun condMapEmpty!42202 () Bool)

(declare-fun mapDefault!42202 () ValueCell!12773)

