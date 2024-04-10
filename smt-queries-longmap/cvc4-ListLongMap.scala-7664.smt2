; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96308 () Bool)

(assert start!96308)

(declare-fun b!1094475 () Bool)

(declare-fun res!730384 () Bool)

(declare-fun e!624854 () Bool)

(assert (=> b!1094475 (=> (not res!730384) (not e!624854))))

(declare-datatypes ((array!70841 0))(
  ( (array!70842 (arr!34094 (Array (_ BitVec 32) (_ BitVec 64))) (size!34630 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70841)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70841 (_ BitVec 32)) Bool)

(assert (=> b!1094475 (= res!730384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094476 () Bool)

(declare-fun e!624857 () Bool)

(declare-fun tp_is_empty!26963 () Bool)

(assert (=> b!1094476 (= e!624857 tp_is_empty!26963)))

(declare-fun b!1094477 () Bool)

(assert (=> b!1094477 (= e!624854 false)))

(declare-fun lt!489655 () Bool)

(declare-datatypes ((List!23818 0))(
  ( (Nil!23815) (Cons!23814 (h!25023 (_ BitVec 64)) (t!33825 List!23818)) )
))
(declare-fun arrayNoDuplicates!0 (array!70841 (_ BitVec 32) List!23818) Bool)

(assert (=> b!1094477 (= lt!489655 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23815))))

(declare-fun mapNonEmpty!42199 () Bool)

(declare-fun mapRes!42199 () Bool)

(declare-fun tp!80714 () Bool)

(assert (=> mapNonEmpty!42199 (= mapRes!42199 (and tp!80714 e!624857))))

(declare-datatypes ((V!41077 0))(
  ( (V!41078 (val!13538 Int)) )
))
(declare-datatypes ((ValueCell!12772 0))(
  ( (ValueCellFull!12772 (v!16159 V!41077)) (EmptyCell!12772) )
))
(declare-datatypes ((array!70843 0))(
  ( (array!70844 (arr!34095 (Array (_ BitVec 32) ValueCell!12772)) (size!34631 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70843)

(declare-fun mapValue!42199 () ValueCell!12772)

(declare-fun mapKey!42199 () (_ BitVec 32))

(declare-fun mapRest!42199 () (Array (_ BitVec 32) ValueCell!12772))

(assert (=> mapNonEmpty!42199 (= (arr!34095 _values!874) (store mapRest!42199 mapKey!42199 mapValue!42199))))

(declare-fun b!1094478 () Bool)

(declare-fun res!730386 () Bool)

(assert (=> b!1094478 (=> (not res!730386) (not e!624854))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094478 (= res!730386 (and (= (size!34631 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34630 _keys!1070) (size!34631 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094479 () Bool)

(declare-fun e!624853 () Bool)

(declare-fun e!624855 () Bool)

(assert (=> b!1094479 (= e!624853 (and e!624855 mapRes!42199))))

(declare-fun condMapEmpty!42199 () Bool)

(declare-fun mapDefault!42199 () ValueCell!12772)

