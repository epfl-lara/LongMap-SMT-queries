; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95988 () Bool)

(assert start!95988)

(declare-fun b_free!22641 () Bool)

(declare-fun b_next!22641 () Bool)

(assert (=> start!95988 (= b_free!22641 (not b_next!22641))))

(declare-fun tp!79772 () Bool)

(declare-fun b_and!35957 () Bool)

(assert (=> start!95988 (= tp!79772 b_and!35957)))

(declare-fun mapIsEmpty!41719 () Bool)

(declare-fun mapRes!41719 () Bool)

(assert (=> mapIsEmpty!41719 mapRes!41719))

(declare-fun mapNonEmpty!41719 () Bool)

(declare-fun tp!79771 () Bool)

(declare-fun e!621382 () Bool)

(assert (=> mapNonEmpty!41719 (= mapRes!41719 (and tp!79771 e!621382))))

(declare-datatypes ((V!40651 0))(
  ( (V!40652 (val!13378 Int)) )
))
(declare-datatypes ((ValueCell!12612 0))(
  ( (ValueCellFull!12612 (v!15999 V!40651)) (EmptyCell!12612) )
))
(declare-fun mapRest!41719 () (Array (_ BitVec 32) ValueCell!12612))

(declare-fun mapKey!41719 () (_ BitVec 32))

(declare-datatypes ((array!70211 0))(
  ( (array!70212 (arr!33779 (Array (_ BitVec 32) ValueCell!12612)) (size!34315 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70211)

(declare-fun mapValue!41719 () ValueCell!12612)

(assert (=> mapNonEmpty!41719 (= (arr!33779 _values!874) (store mapRest!41719 mapKey!41719 mapValue!41719))))

(declare-fun b!1087842 () Bool)

(declare-fun e!621386 () Bool)

(declare-fun e!621380 () Bool)

(assert (=> b!1087842 (= e!621386 (not e!621380))))

(declare-fun res!725507 () Bool)

(assert (=> b!1087842 (=> res!725507 e!621380)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087842 (= res!725507 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40651)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16980 0))(
  ( (tuple2!16981 (_1!8501 (_ BitVec 64)) (_2!8501 V!40651)) )
))
(declare-datatypes ((List!23566 0))(
  ( (Nil!23563) (Cons!23562 (h!24771 tuple2!16980) (t!33265 List!23566)) )
))
(declare-datatypes ((ListLongMap!14949 0))(
  ( (ListLongMap!14950 (toList!7490 List!23566)) )
))
(declare-fun lt!484276 () ListLongMap!14949)

(declare-fun zeroValue!831 () V!40651)

(declare-datatypes ((array!70213 0))(
  ( (array!70214 (arr!33780 (Array (_ BitVec 32) (_ BitVec 64))) (size!34316 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70213)

(declare-fun getCurrentListMap!4264 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40651 V!40651 (_ BitVec 32) Int) ListLongMap!14949)

(assert (=> b!1087842 (= lt!484276 (getCurrentListMap!4264 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484270 () array!70213)

(declare-fun lt!484267 () array!70211)

(declare-fun lt!484277 () ListLongMap!14949)

(assert (=> b!1087842 (= lt!484277 (getCurrentListMap!4264 lt!484270 lt!484267 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484268 () ListLongMap!14949)

(declare-fun lt!484274 () ListLongMap!14949)

(assert (=> b!1087842 (and (= lt!484268 lt!484274) (= lt!484274 lt!484268))))

(declare-fun lt!484269 () ListLongMap!14949)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!815 (ListLongMap!14949 (_ BitVec 64)) ListLongMap!14949)

(assert (=> b!1087842 (= lt!484274 (-!815 lt!484269 k0!904))))

(declare-datatypes ((Unit!35796 0))(
  ( (Unit!35797) )
))
(declare-fun lt!484279 () Unit!35796)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!83 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40651 V!40651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35796)

(assert (=> b!1087842 (= lt!484279 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!83 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4024 (array!70213 array!70211 (_ BitVec 32) (_ BitVec 32) V!40651 V!40651 (_ BitVec 32) Int) ListLongMap!14949)

(assert (=> b!1087842 (= lt!484268 (getCurrentListMapNoExtraKeys!4024 lt!484270 lt!484267 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2161 (Int (_ BitVec 64)) V!40651)

(assert (=> b!1087842 (= lt!484267 (array!70212 (store (arr!33779 _values!874) i!650 (ValueCellFull!12612 (dynLambda!2161 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34315 _values!874)))))

(assert (=> b!1087842 (= lt!484269 (getCurrentListMapNoExtraKeys!4024 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087842 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484275 () Unit!35796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70213 (_ BitVec 64) (_ BitVec 32)) Unit!35796)

(assert (=> b!1087842 (= lt!484275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!725502 () Bool)

(declare-fun e!621385 () Bool)

(assert (=> start!95988 (=> (not res!725502) (not e!621385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95988 (= res!725502 (validMask!0 mask!1414))))

(assert (=> start!95988 e!621385))

(assert (=> start!95988 tp!79772))

(assert (=> start!95988 true))

(declare-fun tp_is_empty!26643 () Bool)

(assert (=> start!95988 tp_is_empty!26643))

(declare-fun array_inv!26052 (array!70213) Bool)

(assert (=> start!95988 (array_inv!26052 _keys!1070)))

(declare-fun e!621379 () Bool)

(declare-fun array_inv!26053 (array!70211) Bool)

(assert (=> start!95988 (and (array_inv!26053 _values!874) e!621379)))

(declare-fun b!1087843 () Bool)

(declare-fun res!725503 () Bool)

(assert (=> b!1087843 (=> (not res!725503) (not e!621386))))

(declare-datatypes ((List!23567 0))(
  ( (Nil!23564) (Cons!23563 (h!24772 (_ BitVec 64)) (t!33266 List!23567)) )
))
(declare-fun arrayNoDuplicates!0 (array!70213 (_ BitVec 32) List!23567) Bool)

(assert (=> b!1087843 (= res!725503 (arrayNoDuplicates!0 lt!484270 #b00000000000000000000000000000000 Nil!23564))))

(declare-fun b!1087844 () Bool)

(declare-fun res!725509 () Bool)

(assert (=> b!1087844 (=> (not res!725509) (not e!621385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70213 (_ BitVec 32)) Bool)

(assert (=> b!1087844 (= res!725509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087845 () Bool)

(declare-fun res!725511 () Bool)

(assert (=> b!1087845 (=> (not res!725511) (not e!621385))))

(assert (=> b!1087845 (= res!725511 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23564))))

(declare-fun b!1087846 () Bool)

(declare-fun e!621384 () Bool)

(assert (=> b!1087846 (= e!621384 tp_is_empty!26643)))

(declare-fun b!1087847 () Bool)

(assert (=> b!1087847 (= e!621385 e!621386)))

(declare-fun res!725510 () Bool)

(assert (=> b!1087847 (=> (not res!725510) (not e!621386))))

(assert (=> b!1087847 (= res!725510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484270 mask!1414))))

(assert (=> b!1087847 (= lt!484270 (array!70214 (store (arr!33780 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34316 _keys!1070)))))

(declare-fun b!1087848 () Bool)

(declare-fun res!725506 () Bool)

(assert (=> b!1087848 (=> (not res!725506) (not e!621385))))

(assert (=> b!1087848 (= res!725506 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34316 _keys!1070))))))

(declare-fun b!1087849 () Bool)

(declare-fun e!621383 () Bool)

(assert (=> b!1087849 (= e!621380 e!621383)))

(declare-fun res!725508 () Bool)

(assert (=> b!1087849 (=> res!725508 e!621383)))

(assert (=> b!1087849 (= res!725508 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484272 () ListLongMap!14949)

(assert (=> b!1087849 (= lt!484277 lt!484272)))

(declare-fun lt!484271 () tuple2!16980)

(declare-fun +!3291 (ListLongMap!14949 tuple2!16980) ListLongMap!14949)

(assert (=> b!1087849 (= lt!484272 (+!3291 lt!484274 lt!484271))))

(declare-fun lt!484278 () ListLongMap!14949)

(assert (=> b!1087849 (= lt!484276 lt!484278)))

(assert (=> b!1087849 (= lt!484278 (+!3291 lt!484269 lt!484271))))

(assert (=> b!1087849 (= lt!484277 (+!3291 lt!484268 lt!484271))))

(assert (=> b!1087849 (= lt!484271 (tuple2!16981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087850 () Bool)

(declare-fun res!725501 () Bool)

(assert (=> b!1087850 (=> (not res!725501) (not e!621385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087850 (= res!725501 (validKeyInArray!0 k0!904))))

(declare-fun b!1087851 () Bool)

(assert (=> b!1087851 (= e!621383 true)))

(assert (=> b!1087851 (= (-!815 lt!484278 k0!904) lt!484272)))

(declare-fun lt!484273 () Unit!35796)

(declare-fun addRemoveCommutativeForDiffKeys!46 (ListLongMap!14949 (_ BitVec 64) V!40651 (_ BitVec 64)) Unit!35796)

(assert (=> b!1087851 (= lt!484273 (addRemoveCommutativeForDiffKeys!46 lt!484269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087852 () Bool)

(assert (=> b!1087852 (= e!621379 (and e!621384 mapRes!41719))))

(declare-fun condMapEmpty!41719 () Bool)

(declare-fun mapDefault!41719 () ValueCell!12612)

(assert (=> b!1087852 (= condMapEmpty!41719 (= (arr!33779 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12612)) mapDefault!41719)))))

(declare-fun b!1087853 () Bool)

(declare-fun res!725505 () Bool)

(assert (=> b!1087853 (=> (not res!725505) (not e!621385))))

(assert (=> b!1087853 (= res!725505 (= (select (arr!33780 _keys!1070) i!650) k0!904))))

(declare-fun b!1087854 () Bool)

(assert (=> b!1087854 (= e!621382 tp_is_empty!26643)))

(declare-fun b!1087855 () Bool)

(declare-fun res!725504 () Bool)

(assert (=> b!1087855 (=> (not res!725504) (not e!621385))))

(assert (=> b!1087855 (= res!725504 (and (= (size!34315 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34316 _keys!1070) (size!34315 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95988 res!725502) b!1087855))

(assert (= (and b!1087855 res!725504) b!1087844))

(assert (= (and b!1087844 res!725509) b!1087845))

(assert (= (and b!1087845 res!725511) b!1087848))

(assert (= (and b!1087848 res!725506) b!1087850))

(assert (= (and b!1087850 res!725501) b!1087853))

(assert (= (and b!1087853 res!725505) b!1087847))

(assert (= (and b!1087847 res!725510) b!1087843))

(assert (= (and b!1087843 res!725503) b!1087842))

(assert (= (and b!1087842 (not res!725507)) b!1087849))

(assert (= (and b!1087849 (not res!725508)) b!1087851))

(assert (= (and b!1087852 condMapEmpty!41719) mapIsEmpty!41719))

(assert (= (and b!1087852 (not condMapEmpty!41719)) mapNonEmpty!41719))

(get-info :version)

(assert (= (and mapNonEmpty!41719 ((_ is ValueCellFull!12612) mapValue!41719)) b!1087854))

(assert (= (and b!1087852 ((_ is ValueCellFull!12612) mapDefault!41719)) b!1087846))

(assert (= start!95988 b!1087852))

(declare-fun b_lambda!17311 () Bool)

(assert (=> (not b_lambda!17311) (not b!1087842)))

(declare-fun t!33264 () Bool)

(declare-fun tb!7519 () Bool)

(assert (=> (and start!95988 (= defaultEntry!882 defaultEntry!882) t!33264) tb!7519))

(declare-fun result!15557 () Bool)

(assert (=> tb!7519 (= result!15557 tp_is_empty!26643)))

(assert (=> b!1087842 t!33264))

(declare-fun b_and!35959 () Bool)

(assert (= b_and!35957 (and (=> t!33264 result!15557) b_and!35959)))

(declare-fun m!1006799 () Bool)

(assert (=> start!95988 m!1006799))

(declare-fun m!1006801 () Bool)

(assert (=> start!95988 m!1006801))

(declare-fun m!1006803 () Bool)

(assert (=> start!95988 m!1006803))

(declare-fun m!1006805 () Bool)

(assert (=> b!1087850 m!1006805))

(declare-fun m!1006807 () Bool)

(assert (=> b!1087851 m!1006807))

(declare-fun m!1006809 () Bool)

(assert (=> b!1087851 m!1006809))

(declare-fun m!1006811 () Bool)

(assert (=> b!1087853 m!1006811))

(declare-fun m!1006813 () Bool)

(assert (=> b!1087843 m!1006813))

(declare-fun m!1006815 () Bool)

(assert (=> b!1087847 m!1006815))

(declare-fun m!1006817 () Bool)

(assert (=> b!1087847 m!1006817))

(declare-fun m!1006819 () Bool)

(assert (=> b!1087845 m!1006819))

(declare-fun m!1006821 () Bool)

(assert (=> b!1087842 m!1006821))

(declare-fun m!1006823 () Bool)

(assert (=> b!1087842 m!1006823))

(declare-fun m!1006825 () Bool)

(assert (=> b!1087842 m!1006825))

(declare-fun m!1006827 () Bool)

(assert (=> b!1087842 m!1006827))

(declare-fun m!1006829 () Bool)

(assert (=> b!1087842 m!1006829))

(declare-fun m!1006831 () Bool)

(assert (=> b!1087842 m!1006831))

(declare-fun m!1006833 () Bool)

(assert (=> b!1087842 m!1006833))

(declare-fun m!1006835 () Bool)

(assert (=> b!1087842 m!1006835))

(declare-fun m!1006837 () Bool)

(assert (=> b!1087842 m!1006837))

(declare-fun m!1006839 () Bool)

(assert (=> b!1087842 m!1006839))

(declare-fun m!1006841 () Bool)

(assert (=> b!1087849 m!1006841))

(declare-fun m!1006843 () Bool)

(assert (=> b!1087849 m!1006843))

(declare-fun m!1006845 () Bool)

(assert (=> b!1087849 m!1006845))

(declare-fun m!1006847 () Bool)

(assert (=> mapNonEmpty!41719 m!1006847))

(declare-fun m!1006849 () Bool)

(assert (=> b!1087844 m!1006849))

(check-sat (not b!1087844) (not start!95988) (not b_lambda!17311) b_and!35959 (not b!1087845) (not b!1087847) (not b!1087842) (not b!1087849) (not b!1087843) (not mapNonEmpty!41719) (not b!1087850) (not b!1087851) tp_is_empty!26643 (not b_next!22641))
(check-sat b_and!35959 (not b_next!22641))
