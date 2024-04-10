; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96338 () Bool)

(assert start!96338)

(declare-fun b!1094919 () Bool)

(declare-fun res!730696 () Bool)

(declare-fun e!625105 () Bool)

(assert (=> b!1094919 (=> (not res!730696) (not e!625105))))

(declare-datatypes ((array!70899 0))(
  ( (array!70900 (arr!34123 (Array (_ BitVec 32) (_ BitVec 64))) (size!34659 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70899)

(declare-datatypes ((List!23832 0))(
  ( (Nil!23829) (Cons!23828 (h!25037 (_ BitVec 64)) (t!33839 List!23832)) )
))
(declare-fun arrayNoDuplicates!0 (array!70899 (_ BitVec 32) List!23832) Bool)

(assert (=> b!1094919 (= res!730696 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23829))))

(declare-fun b!1094920 () Bool)

(declare-fun e!625109 () Bool)

(declare-fun tp_is_empty!26993 () Bool)

(assert (=> b!1094920 (= e!625109 tp_is_empty!26993)))

(declare-fun b!1094921 () Bool)

(declare-fun res!730698 () Bool)

(assert (=> b!1094921 (=> (not res!730698) (not e!625105))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094921 (= res!730698 (= (select (arr!34123 _keys!1070) i!650) k!904))))

(declare-fun b!1094922 () Bool)

(declare-fun res!730700 () Bool)

(assert (=> b!1094922 (=> (not res!730700) (not e!625105))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41117 0))(
  ( (V!41118 (val!13553 Int)) )
))
(declare-datatypes ((ValueCell!12787 0))(
  ( (ValueCellFull!12787 (v!16174 V!41117)) (EmptyCell!12787) )
))
(declare-datatypes ((array!70901 0))(
  ( (array!70902 (arr!34124 (Array (_ BitVec 32) ValueCell!12787)) (size!34660 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70901)

(assert (=> b!1094922 (= res!730700 (and (= (size!34660 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34659 _keys!1070) (size!34660 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094923 () Bool)

(declare-fun res!730701 () Bool)

(assert (=> b!1094923 (=> (not res!730701) (not e!625105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094923 (= res!730701 (validKeyInArray!0 k!904))))

(declare-fun b!1094924 () Bool)

(declare-fun e!625106 () Bool)

(assert (=> b!1094924 (= e!625106 (bvsge (size!34659 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1094925 () Bool)

(declare-fun res!730697 () Bool)

(assert (=> b!1094925 (=> (not res!730697) (not e!625105))))

(assert (=> b!1094925 (= res!730697 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34659 _keys!1070))))))

(declare-fun b!1094926 () Bool)

(declare-fun res!730693 () Bool)

(assert (=> b!1094926 (=> (not res!730693) (not e!625106))))

(declare-fun lt!489718 () array!70899)

(assert (=> b!1094926 (= res!730693 (arrayNoDuplicates!0 lt!489718 #b00000000000000000000000000000000 Nil!23829))))

(declare-fun mapIsEmpty!42244 () Bool)

(declare-fun mapRes!42244 () Bool)

(assert (=> mapIsEmpty!42244 mapRes!42244))

(declare-fun b!1094927 () Bool)

(declare-fun res!730699 () Bool)

(assert (=> b!1094927 (=> (not res!730699) (not e!625105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70899 (_ BitVec 32)) Bool)

(assert (=> b!1094927 (= res!730699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094928 () Bool)

(declare-fun e!625108 () Bool)

(assert (=> b!1094928 (= e!625108 tp_is_empty!26993)))

(declare-fun res!730695 () Bool)

(assert (=> start!96338 (=> (not res!730695) (not e!625105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96338 (= res!730695 (validMask!0 mask!1414))))

(assert (=> start!96338 e!625105))

(assert (=> start!96338 true))

(declare-fun array_inv!26296 (array!70899) Bool)

(assert (=> start!96338 (array_inv!26296 _keys!1070)))

(declare-fun e!625107 () Bool)

(declare-fun array_inv!26297 (array!70901) Bool)

(assert (=> start!96338 (and (array_inv!26297 _values!874) e!625107)))

(declare-fun mapNonEmpty!42244 () Bool)

(declare-fun tp!80759 () Bool)

(assert (=> mapNonEmpty!42244 (= mapRes!42244 (and tp!80759 e!625108))))

(declare-fun mapValue!42244 () ValueCell!12787)

(declare-fun mapRest!42244 () (Array (_ BitVec 32) ValueCell!12787))

(declare-fun mapKey!42244 () (_ BitVec 32))

(assert (=> mapNonEmpty!42244 (= (arr!34124 _values!874) (store mapRest!42244 mapKey!42244 mapValue!42244))))

(declare-fun b!1094929 () Bool)

(assert (=> b!1094929 (= e!625107 (and e!625109 mapRes!42244))))

(declare-fun condMapEmpty!42244 () Bool)

(declare-fun mapDefault!42244 () ValueCell!12787)

