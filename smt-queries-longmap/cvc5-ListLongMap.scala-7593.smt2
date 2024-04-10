; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95878 () Bool)

(assert start!95878)

(declare-fun b_free!22531 () Bool)

(declare-fun b_next!22531 () Bool)

(assert (=> start!95878 (= b_free!22531 (not b_next!22531))))

(declare-fun tp!79442 () Bool)

(declare-fun b_and!35737 () Bool)

(assert (=> start!95878 (= tp!79442 b_and!35737)))

(declare-fun b!1085413 () Bool)

(declare-fun e!620059 () Bool)

(declare-fun tp_is_empty!26533 () Bool)

(assert (=> b!1085413 (= e!620059 tp_is_empty!26533)))

(declare-fun b!1085414 () Bool)

(declare-fun res!723684 () Bool)

(declare-fun e!620062 () Bool)

(assert (=> b!1085414 (=> (not res!723684) (not e!620062))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085414 (= res!723684 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41554 () Bool)

(declare-fun mapRes!41554 () Bool)

(declare-fun tp!79441 () Bool)

(declare-fun e!620061 () Bool)

(assert (=> mapNonEmpty!41554 (= mapRes!41554 (and tp!79441 e!620061))))

(declare-datatypes ((V!40505 0))(
  ( (V!40506 (val!13323 Int)) )
))
(declare-datatypes ((ValueCell!12557 0))(
  ( (ValueCellFull!12557 (v!15944 V!40505)) (EmptyCell!12557) )
))
(declare-datatypes ((array!70001 0))(
  ( (array!70002 (arr!33674 (Array (_ BitVec 32) ValueCell!12557)) (size!34210 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70001)

(declare-fun mapValue!41554 () ValueCell!12557)

(declare-fun mapKey!41554 () (_ BitVec 32))

(declare-fun mapRest!41554 () (Array (_ BitVec 32) ValueCell!12557))

(assert (=> mapNonEmpty!41554 (= (arr!33674 _values!874) (store mapRest!41554 mapKey!41554 mapValue!41554))))

(declare-fun mapIsEmpty!41554 () Bool)

(assert (=> mapIsEmpty!41554 mapRes!41554))

(declare-fun b!1085415 () Bool)

(declare-fun res!723681 () Bool)

(assert (=> b!1085415 (=> (not res!723681) (not e!620062))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!70003 0))(
  ( (array!70004 (arr!33675 (Array (_ BitVec 32) (_ BitVec 64))) (size!34211 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70003)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085415 (= res!723681 (and (= (size!34210 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34211 _keys!1070) (size!34210 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085416 () Bool)

(declare-fun e!620065 () Bool)

(declare-fun e!620063 () Bool)

(assert (=> b!1085416 (= e!620065 e!620063)))

(declare-fun res!723686 () Bool)

(assert (=> b!1085416 (=> res!723686 e!620063)))

(assert (=> b!1085416 (= res!723686 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16892 0))(
  ( (tuple2!16893 (_1!8457 (_ BitVec 64)) (_2!8457 V!40505)) )
))
(declare-datatypes ((List!23481 0))(
  ( (Nil!23478) (Cons!23477 (h!24686 tuple2!16892) (t!33070 List!23481)) )
))
(declare-datatypes ((ListLongMap!14861 0))(
  ( (ListLongMap!14862 (toList!7446 List!23481)) )
))
(declare-fun lt!481666 () ListLongMap!14861)

(declare-fun lt!481664 () ListLongMap!14861)

(assert (=> b!1085416 (= lt!481666 lt!481664)))

(declare-fun lt!481655 () ListLongMap!14861)

(declare-fun -!772 (ListLongMap!14861 (_ BitVec 64)) ListLongMap!14861)

(assert (=> b!1085416 (= lt!481666 (-!772 lt!481655 k!904))))

(declare-datatypes ((Unit!35710 0))(
  ( (Unit!35711) )
))
(declare-fun lt!481662 () Unit!35710)

(declare-fun lt!481665 () ListLongMap!14861)

(declare-fun zeroValue!831 () V!40505)

(declare-fun addRemoveCommutativeForDiffKeys!10 (ListLongMap!14861 (_ BitVec 64) V!40505 (_ BitVec 64)) Unit!35710)

(assert (=> b!1085416 (= lt!481662 (addRemoveCommutativeForDiffKeys!10 lt!481665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!481668 () ListLongMap!14861)

(declare-fun lt!481656 () tuple2!16892)

(declare-fun +!3254 (ListLongMap!14861 tuple2!16892) ListLongMap!14861)

(assert (=> b!1085416 (= lt!481668 (+!3254 lt!481664 lt!481656))))

(declare-fun lt!481653 () ListLongMap!14861)

(declare-fun lt!481661 () tuple2!16892)

(assert (=> b!1085416 (= lt!481664 (+!3254 lt!481653 lt!481661))))

(declare-fun lt!481654 () ListLongMap!14861)

(declare-fun lt!481658 () ListLongMap!14861)

(assert (=> b!1085416 (= lt!481654 lt!481658)))

(assert (=> b!1085416 (= lt!481658 (+!3254 lt!481655 lt!481656))))

(assert (=> b!1085416 (= lt!481655 (+!3254 lt!481665 lt!481661))))

(declare-fun lt!481657 () ListLongMap!14861)

(assert (=> b!1085416 (= lt!481668 (+!3254 (+!3254 lt!481657 lt!481661) lt!481656))))

(declare-fun minValue!831 () V!40505)

(assert (=> b!1085416 (= lt!481656 (tuple2!16893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085416 (= lt!481661 (tuple2!16893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085417 () Bool)

(declare-fun res!723680 () Bool)

(assert (=> b!1085417 (=> (not res!723680) (not e!620062))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085417 (= res!723680 (= (select (arr!33675 _keys!1070) i!650) k!904))))

(declare-fun b!1085418 () Bool)

(declare-fun e!620064 () Bool)

(assert (=> b!1085418 (= e!620064 (not e!620065))))

(declare-fun res!723677 () Bool)

(assert (=> b!1085418 (=> res!723677 e!620065)))

(assert (=> b!1085418 (= res!723677 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4231 (array!70003 array!70001 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14861)

(assert (=> b!1085418 (= lt!481654 (getCurrentListMap!4231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481660 () array!70001)

(declare-fun lt!481669 () array!70003)

(assert (=> b!1085418 (= lt!481668 (getCurrentListMap!4231 lt!481669 lt!481660 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085418 (and (= lt!481657 lt!481653) (= lt!481653 lt!481657))))

(assert (=> b!1085418 (= lt!481653 (-!772 lt!481665 k!904))))

(declare-fun lt!481663 () Unit!35710)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 (array!70003 array!70001 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35710)

(assert (=> b!1085418 (= lt!481663 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!50 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3991 (array!70003 array!70001 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14861)

(assert (=> b!1085418 (= lt!481657 (getCurrentListMapNoExtraKeys!3991 lt!481669 lt!481660 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2128 (Int (_ BitVec 64)) V!40505)

(assert (=> b!1085418 (= lt!481660 (array!70002 (store (arr!33674 _values!874) i!650 (ValueCellFull!12557 (dynLambda!2128 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34210 _values!874)))))

(assert (=> b!1085418 (= lt!481665 (getCurrentListMapNoExtraKeys!3991 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085418 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481667 () Unit!35710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70003 (_ BitVec 64) (_ BitVec 32)) Unit!35710)

(assert (=> b!1085418 (= lt!481667 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1085419 () Bool)

(assert (=> b!1085419 (= e!620063 true)))

(assert (=> b!1085419 (= (-!772 lt!481658 k!904) (+!3254 lt!481666 lt!481656))))

(declare-fun lt!481659 () Unit!35710)

(assert (=> b!1085419 (= lt!481659 (addRemoveCommutativeForDiffKeys!10 lt!481655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1085420 () Bool)

(declare-fun res!723687 () Bool)

(assert (=> b!1085420 (=> (not res!723687) (not e!620064))))

(declare-datatypes ((List!23482 0))(
  ( (Nil!23479) (Cons!23478 (h!24687 (_ BitVec 64)) (t!33071 List!23482)) )
))
(declare-fun arrayNoDuplicates!0 (array!70003 (_ BitVec 32) List!23482) Bool)

(assert (=> b!1085420 (= res!723687 (arrayNoDuplicates!0 lt!481669 #b00000000000000000000000000000000 Nil!23479))))

(declare-fun res!723678 () Bool)

(assert (=> start!95878 (=> (not res!723678) (not e!620062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95878 (= res!723678 (validMask!0 mask!1414))))

(assert (=> start!95878 e!620062))

(assert (=> start!95878 tp!79442))

(assert (=> start!95878 true))

(assert (=> start!95878 tp_is_empty!26533))

(declare-fun array_inv!25986 (array!70003) Bool)

(assert (=> start!95878 (array_inv!25986 _keys!1070)))

(declare-fun e!620066 () Bool)

(declare-fun array_inv!25987 (array!70001) Bool)

(assert (=> start!95878 (and (array_inv!25987 _values!874) e!620066)))

(declare-fun b!1085421 () Bool)

(declare-fun res!723685 () Bool)

(assert (=> b!1085421 (=> (not res!723685) (not e!620062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70003 (_ BitVec 32)) Bool)

(assert (=> b!1085421 (= res!723685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085422 () Bool)

(declare-fun res!723679 () Bool)

(assert (=> b!1085422 (=> (not res!723679) (not e!620062))))

(assert (=> b!1085422 (= res!723679 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34211 _keys!1070))))))

(declare-fun b!1085423 () Bool)

(assert (=> b!1085423 (= e!620066 (and e!620059 mapRes!41554))))

(declare-fun condMapEmpty!41554 () Bool)

(declare-fun mapDefault!41554 () ValueCell!12557)

