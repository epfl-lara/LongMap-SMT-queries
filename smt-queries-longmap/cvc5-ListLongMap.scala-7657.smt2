; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96262 () Bool)

(assert start!96262)

(declare-fun b_free!22915 () Bool)

(declare-fun b_next!22915 () Bool)

(assert (=> start!96262 (= b_free!22915 (not b_next!22915))))

(declare-fun tp!80594 () Bool)

(declare-fun b_and!36505 () Bool)

(assert (=> start!96262 (= tp!80594 b_and!36505)))

(declare-fun res!729815 () Bool)

(declare-fun e!624451 () Bool)

(assert (=> start!96262 (=> (not res!729815) (not e!624451))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96262 (= res!729815 (validMask!0 mask!1414))))

(assert (=> start!96262 e!624451))

(assert (=> start!96262 tp!80594))

(assert (=> start!96262 true))

(declare-fun tp_is_empty!26917 () Bool)

(assert (=> start!96262 tp_is_empty!26917))

(declare-datatypes ((array!70751 0))(
  ( (array!70752 (arr!34049 (Array (_ BitVec 32) (_ BitVec 64))) (size!34585 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70751)

(declare-fun array_inv!26238 (array!70751) Bool)

(assert (=> start!96262 (array_inv!26238 _keys!1070)))

(declare-datatypes ((V!41017 0))(
  ( (V!41018 (val!13515 Int)) )
))
(declare-datatypes ((ValueCell!12749 0))(
  ( (ValueCellFull!12749 (v!16136 V!41017)) (EmptyCell!12749) )
))
(declare-datatypes ((array!70753 0))(
  ( (array!70754 (arr!34050 (Array (_ BitVec 32) ValueCell!12749)) (size!34586 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70753)

(declare-fun e!624449 () Bool)

(declare-fun array_inv!26239 (array!70753) Bool)

(assert (=> start!96262 (and (array_inv!26239 _values!874) e!624449)))

(declare-fun b!1093659 () Bool)

(declare-fun res!729817 () Bool)

(assert (=> b!1093659 (=> (not res!729817) (not e!624451))))

(declare-datatypes ((List!23788 0))(
  ( (Nil!23785) (Cons!23784 (h!24993 (_ BitVec 64)) (t!33761 List!23788)) )
))
(declare-fun arrayNoDuplicates!0 (array!70751 (_ BitVec 32) List!23788) Bool)

(assert (=> b!1093659 (= res!729817 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23785))))

(declare-fun b!1093660 () Bool)

(declare-fun res!729819 () Bool)

(assert (=> b!1093660 (=> (not res!729819) (not e!624451))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093660 (= res!729819 (= (select (arr!34049 _keys!1070) i!650) k!904))))

(declare-fun b!1093661 () Bool)

(declare-fun res!729818 () Bool)

(assert (=> b!1093661 (=> (not res!729818) (not e!624451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093661 (= res!729818 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!42130 () Bool)

(declare-fun mapRes!42130 () Bool)

(declare-fun tp!80593 () Bool)

(declare-fun e!624452 () Bool)

(assert (=> mapNonEmpty!42130 (= mapRes!42130 (and tp!80593 e!624452))))

(declare-fun mapRest!42130 () (Array (_ BitVec 32) ValueCell!12749))

(declare-fun mapKey!42130 () (_ BitVec 32))

(declare-fun mapValue!42130 () ValueCell!12749)

(assert (=> mapNonEmpty!42130 (= (arr!34050 _values!874) (store mapRest!42130 mapKey!42130 mapValue!42130))))

(declare-fun b!1093662 () Bool)

(declare-fun res!729811 () Bool)

(declare-fun e!624450 () Bool)

(assert (=> b!1093662 (=> (not res!729811) (not e!624450))))

(declare-fun lt!489153 () array!70751)

(assert (=> b!1093662 (= res!729811 (arrayNoDuplicates!0 lt!489153 #b00000000000000000000000000000000 Nil!23785))))

(declare-fun b!1093663 () Bool)

(declare-fun res!729813 () Bool)

(assert (=> b!1093663 (=> (not res!729813) (not e!624451))))

(assert (=> b!1093663 (= res!729813 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34585 _keys!1070))))))

(declare-fun b!1093664 () Bool)

(assert (=> b!1093664 (= e!624451 e!624450)))

(declare-fun res!729812 () Bool)

(assert (=> b!1093664 (=> (not res!729812) (not e!624450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70751 (_ BitVec 32)) Bool)

(assert (=> b!1093664 (= res!729812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489153 mask!1414))))

(assert (=> b!1093664 (= lt!489153 (array!70752 (store (arr!34049 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34585 _keys!1070)))))

(declare-fun b!1093665 () Bool)

(declare-fun res!729816 () Bool)

(assert (=> b!1093665 (=> (not res!729816) (not e!624451))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093665 (= res!729816 (and (= (size!34586 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34585 _keys!1070) (size!34586 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42130 () Bool)

(assert (=> mapIsEmpty!42130 mapRes!42130))

(declare-fun b!1093666 () Bool)

(declare-fun e!624447 () Bool)

(assert (=> b!1093666 (= e!624449 (and e!624447 mapRes!42130))))

(declare-fun condMapEmpty!42130 () Bool)

(declare-fun mapDefault!42130 () ValueCell!12749)

