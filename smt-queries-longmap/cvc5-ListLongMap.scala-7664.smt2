; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96304 () Bool)

(assert start!96304)

(declare-fun mapNonEmpty!42193 () Bool)

(declare-fun mapRes!42193 () Bool)

(declare-fun tp!80708 () Bool)

(declare-fun e!624823 () Bool)

(assert (=> mapNonEmpty!42193 (= mapRes!42193 (and tp!80708 e!624823))))

(declare-datatypes ((V!41073 0))(
  ( (V!41074 (val!13536 Int)) )
))
(declare-datatypes ((ValueCell!12770 0))(
  ( (ValueCellFull!12770 (v!16157 V!41073)) (EmptyCell!12770) )
))
(declare-fun mapRest!42193 () (Array (_ BitVec 32) ValueCell!12770))

(declare-datatypes ((array!70833 0))(
  ( (array!70834 (arr!34090 (Array (_ BitVec 32) ValueCell!12770)) (size!34626 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70833)

(declare-fun mapKey!42193 () (_ BitVec 32))

(declare-fun mapValue!42193 () ValueCell!12770)

(assert (=> mapNonEmpty!42193 (= (arr!34090 _values!874) (store mapRest!42193 mapKey!42193 mapValue!42193))))

(declare-fun res!730368 () Bool)

(declare-fun e!624824 () Bool)

(assert (=> start!96304 (=> (not res!730368) (not e!624824))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96304 (= res!730368 (validMask!0 mask!1414))))

(assert (=> start!96304 e!624824))

(assert (=> start!96304 true))

(declare-fun e!624826 () Bool)

(declare-fun array_inv!26270 (array!70833) Bool)

(assert (=> start!96304 (and (array_inv!26270 _values!874) e!624826)))

(declare-datatypes ((array!70835 0))(
  ( (array!70836 (arr!34091 (Array (_ BitVec 32) (_ BitVec 64))) (size!34627 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70835)

(declare-fun array_inv!26271 (array!70835) Bool)

(assert (=> start!96304 (array_inv!26271 _keys!1070)))

(declare-fun b!1094439 () Bool)

(declare-fun e!624827 () Bool)

(declare-fun tp_is_empty!26959 () Bool)

(assert (=> b!1094439 (= e!624827 tp_is_empty!26959)))

(declare-fun b!1094440 () Bool)

(assert (=> b!1094440 (= e!624826 (and e!624827 mapRes!42193))))

(declare-fun condMapEmpty!42193 () Bool)

(declare-fun mapDefault!42193 () ValueCell!12770)

