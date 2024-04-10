; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96020 () Bool)

(assert start!96020)

(declare-fun b_free!22673 () Bool)

(declare-fun b_next!22673 () Bool)

(assert (=> start!96020 (= b_free!22673 (not b_next!22673))))

(declare-fun tp!79867 () Bool)

(declare-fun b_and!36021 () Bool)

(assert (=> start!96020 (= tp!79867 b_and!36021)))

(declare-fun b!1088546 () Bool)

(declare-fun res!726034 () Bool)

(declare-fun e!621768 () Bool)

(assert (=> b!1088546 (=> (not res!726034) (not e!621768))))

(declare-datatypes ((array!70275 0))(
  ( (array!70276 (arr!33811 (Array (_ BitVec 32) (_ BitVec 64))) (size!34347 (_ BitVec 32))) )
))
(declare-fun lt!484901 () array!70275)

(declare-datatypes ((List!23593 0))(
  ( (Nil!23590) (Cons!23589 (h!24798 (_ BitVec 64)) (t!33324 List!23593)) )
))
(declare-fun arrayNoDuplicates!0 (array!70275 (_ BitVec 32) List!23593) Bool)

(assert (=> b!1088546 (= res!726034 (arrayNoDuplicates!0 lt!484901 #b00000000000000000000000000000000 Nil!23590))))

(declare-fun b!1088547 () Bool)

(declare-fun res!726036 () Bool)

(declare-fun e!621766 () Bool)

(assert (=> b!1088547 (=> (not res!726036) (not e!621766))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088547 (= res!726036 (validKeyInArray!0 k!904))))

(declare-fun b!1088548 () Bool)

(declare-fun e!621763 () Bool)

(declare-fun _keys!1070 () array!70275)

(assert (=> b!1088548 (= e!621763 (bvsle #b00000000000000000000000000000000 (size!34347 _keys!1070)))))

(declare-datatypes ((V!40693 0))(
  ( (V!40694 (val!13394 Int)) )
))
(declare-datatypes ((tuple2!17006 0))(
  ( (tuple2!17007 (_1!8514 (_ BitVec 64)) (_2!8514 V!40693)) )
))
(declare-datatypes ((List!23594 0))(
  ( (Nil!23591) (Cons!23590 (h!24799 tuple2!17006) (t!33325 List!23594)) )
))
(declare-datatypes ((ListLongMap!14975 0))(
  ( (ListLongMap!14976 (toList!7503 List!23594)) )
))
(declare-fun lt!484893 () ListLongMap!14975)

(declare-fun lt!484903 () ListLongMap!14975)

(declare-fun -!828 (ListLongMap!14975 (_ BitVec 64)) ListLongMap!14975)

(assert (=> b!1088548 (= (-!828 lt!484893 k!904) lt!484903)))

(declare-datatypes ((Unit!35822 0))(
  ( (Unit!35823) )
))
(declare-fun lt!484898 () Unit!35822)

(declare-fun zeroValue!831 () V!40693)

(declare-fun lt!484902 () ListLongMap!14975)

(declare-fun addRemoveCommutativeForDiffKeys!57 (ListLongMap!14975 (_ BitVec 64) V!40693 (_ BitVec 64)) Unit!35822)

(assert (=> b!1088548 (= lt!484898 (addRemoveCommutativeForDiffKeys!57 lt!484902 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088549 () Bool)

(declare-fun e!621769 () Bool)

(declare-fun tp_is_empty!26675 () Bool)

(assert (=> b!1088549 (= e!621769 tp_is_empty!26675)))

(declare-fun res!726029 () Bool)

(assert (=> start!96020 (=> (not res!726029) (not e!621766))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96020 (= res!726029 (validMask!0 mask!1414))))

(assert (=> start!96020 e!621766))

(assert (=> start!96020 tp!79867))

(assert (=> start!96020 true))

(assert (=> start!96020 tp_is_empty!26675))

(declare-fun array_inv!26076 (array!70275) Bool)

(assert (=> start!96020 (array_inv!26076 _keys!1070)))

(declare-datatypes ((ValueCell!12628 0))(
  ( (ValueCellFull!12628 (v!16015 V!40693)) (EmptyCell!12628) )
))
(declare-datatypes ((array!70277 0))(
  ( (array!70278 (arr!33812 (Array (_ BitVec 32) ValueCell!12628)) (size!34348 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70277)

(declare-fun e!621770 () Bool)

(declare-fun array_inv!26077 (array!70277) Bool)

(assert (=> start!96020 (and (array_inv!26077 _values!874) e!621770)))

(declare-fun b!1088550 () Bool)

(declare-fun e!621767 () Bool)

(assert (=> b!1088550 (= e!621767 e!621763)))

(declare-fun res!726039 () Bool)

(assert (=> b!1088550 (=> res!726039 e!621763)))

(assert (=> b!1088550 (= res!726039 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!484897 () ListLongMap!14975)

(assert (=> b!1088550 (= lt!484897 lt!484903)))

(declare-fun lt!484894 () ListLongMap!14975)

(declare-fun lt!484896 () tuple2!17006)

(declare-fun +!3302 (ListLongMap!14975 tuple2!17006) ListLongMap!14975)

(assert (=> b!1088550 (= lt!484903 (+!3302 lt!484894 lt!484896))))

(declare-fun lt!484900 () ListLongMap!14975)

(assert (=> b!1088550 (= lt!484900 lt!484893)))

(assert (=> b!1088550 (= lt!484893 (+!3302 lt!484902 lt!484896))))

(declare-fun lt!484892 () ListLongMap!14975)

(assert (=> b!1088550 (= lt!484897 (+!3302 lt!484892 lt!484896))))

(assert (=> b!1088550 (= lt!484896 (tuple2!17007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088551 () Bool)

(declare-fun e!621765 () Bool)

(assert (=> b!1088551 (= e!621765 tp_is_empty!26675)))

(declare-fun b!1088552 () Bool)

(declare-fun res!726038 () Bool)

(assert (=> b!1088552 (=> (not res!726038) (not e!621766))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088552 (= res!726038 (= (select (arr!33811 _keys!1070) i!650) k!904))))

(declare-fun b!1088553 () Bool)

(declare-fun res!726031 () Bool)

(assert (=> b!1088553 (=> (not res!726031) (not e!621766))))

(assert (=> b!1088553 (= res!726031 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34347 _keys!1070))))))

(declare-fun mapNonEmpty!41767 () Bool)

(declare-fun mapRes!41767 () Bool)

(declare-fun tp!79868 () Bool)

(assert (=> mapNonEmpty!41767 (= mapRes!41767 (and tp!79868 e!621765))))

(declare-fun mapKey!41767 () (_ BitVec 32))

(declare-fun mapRest!41767 () (Array (_ BitVec 32) ValueCell!12628))

(declare-fun mapValue!41767 () ValueCell!12628)

(assert (=> mapNonEmpty!41767 (= (arr!33812 _values!874) (store mapRest!41767 mapKey!41767 mapValue!41767))))

(declare-fun mapIsEmpty!41767 () Bool)

(assert (=> mapIsEmpty!41767 mapRes!41767))

(declare-fun b!1088554 () Bool)

(assert (=> b!1088554 (= e!621770 (and e!621769 mapRes!41767))))

(declare-fun condMapEmpty!41767 () Bool)

(declare-fun mapDefault!41767 () ValueCell!12628)

