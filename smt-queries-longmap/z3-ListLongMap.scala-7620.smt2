; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96034 () Bool)

(assert start!96034)

(declare-fun b_free!22693 () Bool)

(declare-fun b_next!22693 () Bool)

(assert (=> start!96034 (= b_free!22693 (not b_next!22693))))

(declare-fun tp!79928 () Bool)

(declare-fun b_and!36035 () Bool)

(assert (=> start!96034 (= tp!79928 b_and!36035)))

(declare-fun b!1088833 () Bool)

(declare-fun e!621916 () Bool)

(declare-fun e!621915 () Bool)

(assert (=> b!1088833 (= e!621916 e!621915)))

(declare-fun res!726298 () Bool)

(assert (=> b!1088833 (=> (not res!726298) (not e!621915))))

(declare-datatypes ((array!70236 0))(
  ( (array!70237 (arr!33792 (Array (_ BitVec 32) (_ BitVec 64))) (size!34330 (_ BitVec 32))) )
))
(declare-fun lt!485087 () array!70236)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70236 (_ BitVec 32)) Bool)

(assert (=> b!1088833 (= res!726298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485087 mask!1414))))

(declare-fun _keys!1070 () array!70236)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088833 (= lt!485087 (array!70237 (store (arr!33792 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34330 _keys!1070)))))

(declare-fun b!1088834 () Bool)

(declare-fun res!726294 () Bool)

(assert (=> b!1088834 (=> (not res!726294) (not e!621916))))

(assert (=> b!1088834 (= res!726294 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34330 _keys!1070))))))

(declare-fun mapNonEmpty!41797 () Bool)

(declare-fun mapRes!41797 () Bool)

(declare-fun tp!79927 () Bool)

(declare-fun e!621913 () Bool)

(assert (=> mapNonEmpty!41797 (= mapRes!41797 (and tp!79927 e!621913))))

(declare-datatypes ((V!40721 0))(
  ( (V!40722 (val!13404 Int)) )
))
(declare-datatypes ((ValueCell!12638 0))(
  ( (ValueCellFull!12638 (v!16024 V!40721)) (EmptyCell!12638) )
))
(declare-fun mapValue!41797 () ValueCell!12638)

(declare-fun mapRest!41797 () (Array (_ BitVec 32) ValueCell!12638))

(declare-datatypes ((array!70238 0))(
  ( (array!70239 (arr!33793 (Array (_ BitVec 32) ValueCell!12638)) (size!34331 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70238)

(declare-fun mapKey!41797 () (_ BitVec 32))

(assert (=> mapNonEmpty!41797 (= (arr!33793 _values!874) (store mapRest!41797 mapKey!41797 mapValue!41797))))

(declare-fun b!1088835 () Bool)

(declare-fun e!621912 () Bool)

(declare-fun e!621914 () Bool)

(assert (=> b!1088835 (= e!621912 (and e!621914 mapRes!41797))))

(declare-fun condMapEmpty!41797 () Bool)

(declare-fun mapDefault!41797 () ValueCell!12638)

(assert (=> b!1088835 (= condMapEmpty!41797 (= (arr!33793 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12638)) mapDefault!41797)))))

(declare-fun b!1088836 () Bool)

(declare-fun res!726293 () Bool)

(assert (=> b!1088836 (=> (not res!726293) (not e!621916))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088836 (= res!726293 (and (= (size!34331 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34330 _keys!1070) (size!34331 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088837 () Bool)

(declare-fun e!621910 () Bool)

(assert (=> b!1088837 (= e!621910 true)))

(declare-datatypes ((tuple2!17078 0))(
  ( (tuple2!17079 (_1!8550 (_ BitVec 64)) (_2!8550 V!40721)) )
))
(declare-datatypes ((List!23646 0))(
  ( (Nil!23643) (Cons!23642 (h!24851 tuple2!17078) (t!33388 List!23646)) )
))
(declare-datatypes ((ListLongMap!15047 0))(
  ( (ListLongMap!15048 (toList!7539 List!23646)) )
))
(declare-fun lt!485082 () ListLongMap!15047)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!485091 () ListLongMap!15047)

(declare-fun -!817 (ListLongMap!15047 (_ BitVec 64)) ListLongMap!15047)

(assert (=> b!1088837 (= (-!817 lt!485082 k0!904) lt!485091)))

(declare-datatypes ((Unit!35669 0))(
  ( (Unit!35670) )
))
(declare-fun lt!485089 () Unit!35669)

(declare-fun zeroValue!831 () V!40721)

(declare-fun lt!485090 () ListLongMap!15047)

(declare-fun addRemoveCommutativeForDiffKeys!68 (ListLongMap!15047 (_ BitVec 64) V!40721 (_ BitVec 64)) Unit!35669)

(assert (=> b!1088837 (= lt!485089 (addRemoveCommutativeForDiffKeys!68 lt!485090 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088838 () Bool)

(declare-fun res!726300 () Bool)

(assert (=> b!1088838 (=> (not res!726300) (not e!621916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088838 (= res!726300 (validKeyInArray!0 k0!904))))

(declare-fun b!1088839 () Bool)

(declare-fun tp_is_empty!26695 () Bool)

(assert (=> b!1088839 (= e!621914 tp_is_empty!26695)))

(declare-fun b!1088840 () Bool)

(assert (=> b!1088840 (= e!621913 tp_is_empty!26695)))

(declare-fun b!1088841 () Bool)

(declare-fun res!726295 () Bool)

(assert (=> b!1088841 (=> (not res!726295) (not e!621916))))

(assert (=> b!1088841 (= res!726295 (= (select (arr!33792 _keys!1070) i!650) k0!904))))

(declare-fun b!1088842 () Bool)

(declare-fun res!726290 () Bool)

(assert (=> b!1088842 (=> (not res!726290) (not e!621916))))

(assert (=> b!1088842 (= res!726290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088843 () Bool)

(declare-fun res!726291 () Bool)

(assert (=> b!1088843 (=> (not res!726291) (not e!621915))))

(declare-datatypes ((List!23647 0))(
  ( (Nil!23644) (Cons!23643 (h!24852 (_ BitVec 64)) (t!33389 List!23647)) )
))
(declare-fun arrayNoDuplicates!0 (array!70236 (_ BitVec 32) List!23647) Bool)

(assert (=> b!1088843 (= res!726291 (arrayNoDuplicates!0 lt!485087 #b00000000000000000000000000000000 Nil!23644))))

(declare-fun b!1088844 () Bool)

(declare-fun res!726299 () Bool)

(assert (=> b!1088844 (=> (not res!726299) (not e!621916))))

(assert (=> b!1088844 (= res!726299 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23644))))

(declare-fun b!1088845 () Bool)

(declare-fun e!621911 () Bool)

(assert (=> b!1088845 (= e!621915 (not e!621911))))

(declare-fun res!726292 () Bool)

(assert (=> b!1088845 (=> res!726292 e!621911)))

(assert (=> b!1088845 (= res!726292 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40721)

(declare-fun lt!485086 () ListLongMap!15047)

(declare-fun getCurrentListMap!4218 (array!70236 array!70238 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!15047)

(assert (=> b!1088845 (= lt!485086 (getCurrentListMap!4218 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485093 () ListLongMap!15047)

(declare-fun lt!485084 () array!70238)

(assert (=> b!1088845 (= lt!485093 (getCurrentListMap!4218 lt!485087 lt!485084 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485081 () ListLongMap!15047)

(declare-fun lt!485085 () ListLongMap!15047)

(assert (=> b!1088845 (and (= lt!485081 lt!485085) (= lt!485085 lt!485081))))

(assert (=> b!1088845 (= lt!485085 (-!817 lt!485090 k0!904))))

(declare-fun lt!485088 () Unit!35669)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!102 (array!70236 array!70238 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35669)

(assert (=> b!1088845 (= lt!485088 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!102 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4088 (array!70236 array!70238 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!15047)

(assert (=> b!1088845 (= lt!485081 (getCurrentListMapNoExtraKeys!4088 lt!485087 lt!485084 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2159 (Int (_ BitVec 64)) V!40721)

(assert (=> b!1088845 (= lt!485084 (array!70239 (store (arr!33793 _values!874) i!650 (ValueCellFull!12638 (dynLambda!2159 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34331 _values!874)))))

(assert (=> b!1088845 (= lt!485090 (getCurrentListMapNoExtraKeys!4088 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088845 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485092 () Unit!35669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70236 (_ BitVec 64) (_ BitVec 32)) Unit!35669)

(assert (=> b!1088845 (= lt!485092 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088846 () Bool)

(assert (=> b!1088846 (= e!621911 e!621910)))

(declare-fun res!726297 () Bool)

(assert (=> b!1088846 (=> res!726297 e!621910)))

(assert (=> b!1088846 (= res!726297 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1088846 (= lt!485093 lt!485091)))

(declare-fun lt!485083 () tuple2!17078)

(declare-fun +!3340 (ListLongMap!15047 tuple2!17078) ListLongMap!15047)

(assert (=> b!1088846 (= lt!485091 (+!3340 lt!485085 lt!485083))))

(assert (=> b!1088846 (= lt!485086 lt!485082)))

(assert (=> b!1088846 (= lt!485082 (+!3340 lt!485090 lt!485083))))

(assert (=> b!1088846 (= lt!485093 (+!3340 lt!485081 lt!485083))))

(assert (=> b!1088846 (= lt!485083 (tuple2!17079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41797 () Bool)

(assert (=> mapIsEmpty!41797 mapRes!41797))

(declare-fun res!726296 () Bool)

(assert (=> start!96034 (=> (not res!726296) (not e!621916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96034 (= res!726296 (validMask!0 mask!1414))))

(assert (=> start!96034 e!621916))

(assert (=> start!96034 tp!79928))

(assert (=> start!96034 true))

(assert (=> start!96034 tp_is_empty!26695))

(declare-fun array_inv!26108 (array!70236) Bool)

(assert (=> start!96034 (array_inv!26108 _keys!1070)))

(declare-fun array_inv!26109 (array!70238) Bool)

(assert (=> start!96034 (and (array_inv!26109 _values!874) e!621912)))

(assert (= (and start!96034 res!726296) b!1088836))

(assert (= (and b!1088836 res!726293) b!1088842))

(assert (= (and b!1088842 res!726290) b!1088844))

(assert (= (and b!1088844 res!726299) b!1088834))

(assert (= (and b!1088834 res!726294) b!1088838))

(assert (= (and b!1088838 res!726300) b!1088841))

(assert (= (and b!1088841 res!726295) b!1088833))

(assert (= (and b!1088833 res!726298) b!1088843))

(assert (= (and b!1088843 res!726291) b!1088845))

(assert (= (and b!1088845 (not res!726292)) b!1088846))

(assert (= (and b!1088846 (not res!726297)) b!1088837))

(assert (= (and b!1088835 condMapEmpty!41797) mapIsEmpty!41797))

(assert (= (and b!1088835 (not condMapEmpty!41797)) mapNonEmpty!41797))

(get-info :version)

(assert (= (and mapNonEmpty!41797 ((_ is ValueCellFull!12638) mapValue!41797)) b!1088840))

(assert (= (and b!1088835 ((_ is ValueCellFull!12638) mapDefault!41797)) b!1088839))

(assert (= start!96034 b!1088835))

(declare-fun b_lambda!17341 () Bool)

(assert (=> (not b_lambda!17341) (not b!1088845)))

(declare-fun t!33387 () Bool)

(declare-fun tb!7563 () Bool)

(assert (=> (and start!96034 (= defaultEntry!882 defaultEntry!882) t!33387) tb!7563))

(declare-fun result!15653 () Bool)

(assert (=> tb!7563 (= result!15653 tp_is_empty!26695)))

(assert (=> b!1088845 t!33387))

(declare-fun b_and!36037 () Bool)

(assert (= b_and!36035 (and (=> t!33387 result!15653) b_and!36037)))

(declare-fun m!1007525 () Bool)

(assert (=> b!1088841 m!1007525))

(declare-fun m!1007527 () Bool)

(assert (=> b!1088845 m!1007527))

(declare-fun m!1007529 () Bool)

(assert (=> b!1088845 m!1007529))

(declare-fun m!1007531 () Bool)

(assert (=> b!1088845 m!1007531))

(declare-fun m!1007533 () Bool)

(assert (=> b!1088845 m!1007533))

(declare-fun m!1007535 () Bool)

(assert (=> b!1088845 m!1007535))

(declare-fun m!1007537 () Bool)

(assert (=> b!1088845 m!1007537))

(declare-fun m!1007539 () Bool)

(assert (=> b!1088845 m!1007539))

(declare-fun m!1007541 () Bool)

(assert (=> b!1088845 m!1007541))

(declare-fun m!1007543 () Bool)

(assert (=> b!1088845 m!1007543))

(declare-fun m!1007545 () Bool)

(assert (=> b!1088845 m!1007545))

(declare-fun m!1007547 () Bool)

(assert (=> b!1088838 m!1007547))

(declare-fun m!1007549 () Bool)

(assert (=> b!1088843 m!1007549))

(declare-fun m!1007551 () Bool)

(assert (=> b!1088842 m!1007551))

(declare-fun m!1007553 () Bool)

(assert (=> b!1088833 m!1007553))

(declare-fun m!1007555 () Bool)

(assert (=> b!1088833 m!1007555))

(declare-fun m!1007557 () Bool)

(assert (=> b!1088846 m!1007557))

(declare-fun m!1007559 () Bool)

(assert (=> b!1088846 m!1007559))

(declare-fun m!1007561 () Bool)

(assert (=> b!1088846 m!1007561))

(declare-fun m!1007563 () Bool)

(assert (=> b!1088844 m!1007563))

(declare-fun m!1007565 () Bool)

(assert (=> start!96034 m!1007565))

(declare-fun m!1007567 () Bool)

(assert (=> start!96034 m!1007567))

(declare-fun m!1007569 () Bool)

(assert (=> start!96034 m!1007569))

(declare-fun m!1007571 () Bool)

(assert (=> mapNonEmpty!41797 m!1007571))

(declare-fun m!1007573 () Bool)

(assert (=> b!1088837 m!1007573))

(declare-fun m!1007575 () Bool)

(assert (=> b!1088837 m!1007575))

(check-sat b_and!36037 (not start!96034) (not b!1088838) (not b!1088843) (not b_lambda!17341) (not b_next!22693) (not b!1088846) (not b!1088833) (not b!1088845) (not b!1088837) (not b!1088842) (not b!1088844) (not mapNonEmpty!41797) tp_is_empty!26695)
(check-sat b_and!36037 (not b_next!22693))
