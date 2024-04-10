; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96016 () Bool)

(assert start!96016)

(declare-fun b_free!22669 () Bool)

(declare-fun b_next!22669 () Bool)

(assert (=> start!96016 (= b_free!22669 (not b_next!22669))))

(declare-fun tp!79856 () Bool)

(declare-fun b_and!36013 () Bool)

(assert (=> start!96016 (= tp!79856 b_and!36013)))

(declare-fun b!1088458 () Bool)

(declare-fun res!725971 () Bool)

(declare-fun e!621719 () Bool)

(assert (=> b!1088458 (=> (not res!725971) (not e!621719))))

(declare-datatypes ((array!70267 0))(
  ( (array!70268 (arr!33807 (Array (_ BitVec 32) (_ BitVec 64))) (size!34343 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70267)

(declare-datatypes ((List!23589 0))(
  ( (Nil!23586) (Cons!23585 (h!24794 (_ BitVec 64)) (t!33316 List!23589)) )
))
(declare-fun arrayNoDuplicates!0 (array!70267 (_ BitVec 32) List!23589) Bool)

(assert (=> b!1088458 (= res!725971 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23586))))

(declare-fun b!1088459 () Bool)

(declare-fun res!725968 () Bool)

(assert (=> b!1088459 (=> (not res!725968) (not e!621719))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088459 (= res!725968 (= (select (arr!33807 _keys!1070) i!650) k!904))))

(declare-fun b!1088460 () Bool)

(declare-fun e!621722 () Bool)

(declare-fun tp_is_empty!26671 () Bool)

(assert (=> b!1088460 (= e!621722 tp_is_empty!26671)))

(declare-fun res!725963 () Bool)

(assert (=> start!96016 (=> (not res!725963) (not e!621719))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96016 (= res!725963 (validMask!0 mask!1414))))

(assert (=> start!96016 e!621719))

(assert (=> start!96016 tp!79856))

(assert (=> start!96016 true))

(assert (=> start!96016 tp_is_empty!26671))

(declare-fun array_inv!26072 (array!70267) Bool)

(assert (=> start!96016 (array_inv!26072 _keys!1070)))

(declare-datatypes ((V!40689 0))(
  ( (V!40690 (val!13392 Int)) )
))
(declare-datatypes ((ValueCell!12626 0))(
  ( (ValueCellFull!12626 (v!16013 V!40689)) (EmptyCell!12626) )
))
(declare-datatypes ((array!70269 0))(
  ( (array!70270 (arr!33808 (Array (_ BitVec 32) ValueCell!12626)) (size!34344 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70269)

(declare-fun e!621720 () Bool)

(declare-fun array_inv!26073 (array!70269) Bool)

(assert (=> start!96016 (and (array_inv!26073 _values!874) e!621720)))

(declare-fun b!1088461 () Bool)

(declare-fun res!725973 () Bool)

(assert (=> b!1088461 (=> (not res!725973) (not e!621719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088461 (= res!725973 (validKeyInArray!0 k!904))))

(declare-fun b!1088462 () Bool)

(declare-fun e!621716 () Bool)

(assert (=> b!1088462 (= e!621716 tp_is_empty!26671)))

(declare-fun mapNonEmpty!41761 () Bool)

(declare-fun mapRes!41761 () Bool)

(declare-fun tp!79855 () Bool)

(assert (=> mapNonEmpty!41761 (= mapRes!41761 (and tp!79855 e!621716))))

(declare-fun mapRest!41761 () (Array (_ BitVec 32) ValueCell!12626))

(declare-fun mapKey!41761 () (_ BitVec 32))

(declare-fun mapValue!41761 () ValueCell!12626)

(assert (=> mapNonEmpty!41761 (= (arr!33808 _values!874) (store mapRest!41761 mapKey!41761 mapValue!41761))))

(declare-fun b!1088463 () Bool)

(declare-fun e!621715 () Bool)

(declare-fun e!621718 () Bool)

(assert (=> b!1088463 (= e!621715 e!621718)))

(declare-fun res!725966 () Bool)

(assert (=> b!1088463 (=> res!725966 e!621718)))

(assert (=> b!1088463 (= res!725966 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17002 0))(
  ( (tuple2!17003 (_1!8512 (_ BitVec 64)) (_2!8512 V!40689)) )
))
(declare-datatypes ((List!23590 0))(
  ( (Nil!23587) (Cons!23586 (h!24795 tuple2!17002) (t!33317 List!23590)) )
))
(declare-datatypes ((ListLongMap!14971 0))(
  ( (ListLongMap!14972 (toList!7501 List!23590)) )
))
(declare-fun lt!484825 () ListLongMap!14971)

(declare-fun lt!484817 () ListLongMap!14971)

(assert (=> b!1088463 (= lt!484825 lt!484817)))

(declare-fun lt!484813 () ListLongMap!14971)

(declare-fun lt!484818 () tuple2!17002)

(declare-fun +!3300 (ListLongMap!14971 tuple2!17002) ListLongMap!14971)

(assert (=> b!1088463 (= lt!484817 (+!3300 lt!484813 lt!484818))))

(declare-fun lt!484816 () ListLongMap!14971)

(declare-fun lt!484824 () ListLongMap!14971)

(assert (=> b!1088463 (= lt!484816 lt!484824)))

(declare-fun lt!484814 () ListLongMap!14971)

(assert (=> b!1088463 (= lt!484824 (+!3300 lt!484814 lt!484818))))

(declare-fun lt!484819 () ListLongMap!14971)

(assert (=> b!1088463 (= lt!484825 (+!3300 lt!484819 lt!484818))))

(declare-fun zeroValue!831 () V!40689)

(assert (=> b!1088463 (= lt!484818 (tuple2!17003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088464 () Bool)

(assert (=> b!1088464 (= e!621718 (bvsle #b00000000000000000000000000000000 (size!34343 _keys!1070)))))

(declare-fun -!826 (ListLongMap!14971 (_ BitVec 64)) ListLongMap!14971)

(assert (=> b!1088464 (= (-!826 lt!484824 k!904) lt!484817)))

(declare-datatypes ((Unit!35818 0))(
  ( (Unit!35819) )
))
(declare-fun lt!484815 () Unit!35818)

(declare-fun addRemoveCommutativeForDiffKeys!55 (ListLongMap!14971 (_ BitVec 64) V!40689 (_ BitVec 64)) Unit!35818)

(assert (=> b!1088464 (= lt!484815 (addRemoveCommutativeForDiffKeys!55 lt!484814 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088465 () Bool)

(declare-fun res!725972 () Bool)

(assert (=> b!1088465 (=> (not res!725972) (not e!621719))))

(assert (=> b!1088465 (= res!725972 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34343 _keys!1070))))))

(declare-fun b!1088466 () Bool)

(declare-fun e!621721 () Bool)

(assert (=> b!1088466 (= e!621721 (not e!621715))))

(declare-fun res!725969 () Bool)

(assert (=> b!1088466 (=> res!725969 e!621715)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088466 (= res!725969 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40689)

(declare-fun getCurrentListMap!4275 (array!70267 array!70269 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!14971)

(assert (=> b!1088466 (= lt!484816 (getCurrentListMap!4275 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484822 () array!70269)

(declare-fun lt!484823 () array!70267)

(assert (=> b!1088466 (= lt!484825 (getCurrentListMap!4275 lt!484823 lt!484822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088466 (and (= lt!484819 lt!484813) (= lt!484813 lt!484819))))

(assert (=> b!1088466 (= lt!484813 (-!826 lt!484814 k!904))))

(declare-fun lt!484820 () Unit!35818)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!94 (array!70267 array!70269 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35818)

(assert (=> b!1088466 (= lt!484820 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!94 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4035 (array!70267 array!70269 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!14971)

(assert (=> b!1088466 (= lt!484819 (getCurrentListMapNoExtraKeys!4035 lt!484823 lt!484822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2172 (Int (_ BitVec 64)) V!40689)

(assert (=> b!1088466 (= lt!484822 (array!70270 (store (arr!33808 _values!874) i!650 (ValueCellFull!12626 (dynLambda!2172 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34344 _values!874)))))

(assert (=> b!1088466 (= lt!484814 (getCurrentListMapNoExtraKeys!4035 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088466 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484821 () Unit!35818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70267 (_ BitVec 64) (_ BitVec 32)) Unit!35818)

(assert (=> b!1088466 (= lt!484821 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41761 () Bool)

(assert (=> mapIsEmpty!41761 mapRes!41761))

(declare-fun b!1088467 () Bool)

(declare-fun res!725965 () Bool)

(assert (=> b!1088467 (=> (not res!725965) (not e!621719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70267 (_ BitVec 32)) Bool)

(assert (=> b!1088467 (= res!725965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088468 () Bool)

(declare-fun res!725964 () Bool)

(assert (=> b!1088468 (=> (not res!725964) (not e!621719))))

(assert (=> b!1088468 (= res!725964 (and (= (size!34344 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34343 _keys!1070) (size!34344 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088469 () Bool)

(declare-fun res!725970 () Bool)

(assert (=> b!1088469 (=> (not res!725970) (not e!621721))))

(assert (=> b!1088469 (= res!725970 (arrayNoDuplicates!0 lt!484823 #b00000000000000000000000000000000 Nil!23586))))

(declare-fun b!1088470 () Bool)

(assert (=> b!1088470 (= e!621719 e!621721)))

(declare-fun res!725967 () Bool)

(assert (=> b!1088470 (=> (not res!725967) (not e!621721))))

(assert (=> b!1088470 (= res!725967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484823 mask!1414))))

(assert (=> b!1088470 (= lt!484823 (array!70268 (store (arr!33807 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34343 _keys!1070)))))

(declare-fun b!1088471 () Bool)

(assert (=> b!1088471 (= e!621720 (and e!621722 mapRes!41761))))

(declare-fun condMapEmpty!41761 () Bool)

(declare-fun mapDefault!41761 () ValueCell!12626)

