; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96266 () Bool)

(assert start!96266)

(declare-fun b_free!22919 () Bool)

(declare-fun b_next!22919 () Bool)

(assert (=> start!96266 (= b_free!22919 (not b_next!22919))))

(declare-fun tp!80606 () Bool)

(declare-fun b_and!36513 () Bool)

(assert (=> start!96266 (= tp!80606 b_and!36513)))

(declare-fun b!1093735 () Bool)

(declare-fun res!729869 () Bool)

(declare-fun e!624488 () Bool)

(assert (=> b!1093735 (=> (not res!729869) (not e!624488))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70759 0))(
  ( (array!70760 (arr!34053 (Array (_ BitVec 32) (_ BitVec 64))) (size!34589 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70759)

(declare-datatypes ((V!41021 0))(
  ( (V!41022 (val!13517 Int)) )
))
(declare-datatypes ((ValueCell!12751 0))(
  ( (ValueCellFull!12751 (v!16138 V!41021)) (EmptyCell!12751) )
))
(declare-datatypes ((array!70761 0))(
  ( (array!70762 (arr!34054 (Array (_ BitVec 32) ValueCell!12751)) (size!34590 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70761)

(assert (=> b!1093735 (= res!729869 (and (= (size!34590 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34589 _keys!1070) (size!34590 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093736 () Bool)

(declare-fun res!729872 () Bool)

(assert (=> b!1093736 (=> (not res!729872) (not e!624488))))

(declare-datatypes ((List!23791 0))(
  ( (Nil!23788) (Cons!23787 (h!24996 (_ BitVec 64)) (t!33768 List!23791)) )
))
(declare-fun arrayNoDuplicates!0 (array!70759 (_ BitVec 32) List!23791) Bool)

(assert (=> b!1093736 (= res!729872 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23788))))

(declare-fun b!1093737 () Bool)

(declare-fun e!624486 () Bool)

(declare-fun tp_is_empty!26921 () Bool)

(assert (=> b!1093737 (= e!624486 tp_is_empty!26921)))

(declare-fun mapNonEmpty!42136 () Bool)

(declare-fun mapRes!42136 () Bool)

(declare-fun tp!80605 () Bool)

(declare-fun e!624483 () Bool)

(assert (=> mapNonEmpty!42136 (= mapRes!42136 (and tp!80605 e!624483))))

(declare-fun mapRest!42136 () (Array (_ BitVec 32) ValueCell!12751))

(declare-fun mapKey!42136 () (_ BitVec 32))

(declare-fun mapValue!42136 () ValueCell!12751)

(assert (=> mapNonEmpty!42136 (= (arr!34054 _values!874) (store mapRest!42136 mapKey!42136 mapValue!42136))))

(declare-fun b!1093738 () Bool)

(declare-fun res!729873 () Bool)

(assert (=> b!1093738 (=> (not res!729873) (not e!624488))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093738 (= res!729873 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34589 _keys!1070))))))

(declare-fun res!729867 () Bool)

(assert (=> start!96266 (=> (not res!729867) (not e!624488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96266 (= res!729867 (validMask!0 mask!1414))))

(assert (=> start!96266 e!624488))

(assert (=> start!96266 tp!80606))

(assert (=> start!96266 true))

(assert (=> start!96266 tp_is_empty!26921))

(declare-fun array_inv!26242 (array!70759) Bool)

(assert (=> start!96266 (array_inv!26242 _keys!1070)))

(declare-fun e!624484 () Bool)

(declare-fun array_inv!26243 (array!70761) Bool)

(assert (=> start!96266 (and (array_inv!26243 _values!874) e!624484)))

(declare-fun b!1093739 () Bool)

(assert (=> b!1093739 (= e!624483 tp_is_empty!26921)))

(declare-fun b!1093740 () Bool)

(declare-fun e!624485 () Bool)

(assert (=> b!1093740 (= e!624488 e!624485)))

(declare-fun res!729871 () Bool)

(assert (=> b!1093740 (=> (not res!729871) (not e!624485))))

(declare-fun lt!489214 () array!70759)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70759 (_ BitVec 32)) Bool)

(assert (=> b!1093740 (= res!729871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489214 mask!1414))))

(assert (=> b!1093740 (= lt!489214 (array!70760 (store (arr!34053 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34589 _keys!1070)))))

(declare-fun b!1093741 () Bool)

(declare-fun res!729865 () Bool)

(assert (=> b!1093741 (=> (not res!729865) (not e!624488))))

(assert (=> b!1093741 (= res!729865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093742 () Bool)

(assert (=> b!1093742 (= e!624484 (and e!624486 mapRes!42136))))

(declare-fun condMapEmpty!42136 () Bool)

(declare-fun mapDefault!42136 () ValueCell!12751)

