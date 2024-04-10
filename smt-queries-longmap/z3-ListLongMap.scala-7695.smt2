; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96624 () Bool)

(assert start!96624)

(declare-fun b_free!23097 () Bool)

(declare-fun b_next!23097 () Bool)

(assert (=> start!96624 (= b_free!23097 (not b_next!23097))))

(declare-fun tp!81229 () Bool)

(declare-fun b_and!36913 () Bool)

(assert (=> start!96624 (= tp!81229 b_and!36913)))

(declare-fun mapIsEmpty!42493 () Bool)

(declare-fun mapRes!42493 () Bool)

(assert (=> mapIsEmpty!42493 mapRes!42493))

(declare-fun res!733292 () Bool)

(declare-fun e!627173 () Bool)

(assert (=> start!96624 (=> (not res!733292) (not e!627173))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96624 (= res!733292 (validMask!0 mask!1414))))

(assert (=> start!96624 e!627173))

(assert (=> start!96624 tp!81229))

(assert (=> start!96624 true))

(declare-fun tp_is_empty!27147 () Bool)

(assert (=> start!96624 tp_is_empty!27147))

(declare-datatypes ((array!71209 0))(
  ( (array!71210 (arr!34272 (Array (_ BitVec 32) (_ BitVec 64))) (size!34808 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71209)

(declare-fun array_inv!26400 (array!71209) Bool)

(assert (=> start!96624 (array_inv!26400 _keys!1070)))

(declare-datatypes ((V!41323 0))(
  ( (V!41324 (val!13630 Int)) )
))
(declare-datatypes ((ValueCell!12864 0))(
  ( (ValueCellFull!12864 (v!16255 V!41323)) (EmptyCell!12864) )
))
(declare-datatypes ((array!71211 0))(
  ( (array!71212 (arr!34273 (Array (_ BitVec 32) ValueCell!12864)) (size!34809 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71211)

(declare-fun e!627170 () Bool)

(declare-fun array_inv!26401 (array!71211) Bool)

(assert (=> start!96624 (and (array_inv!26401 _values!874) e!627170)))

(declare-fun b!1098826 () Bool)

(declare-fun res!733288 () Bool)

(assert (=> b!1098826 (=> (not res!733288) (not e!627173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71209 (_ BitVec 32)) Bool)

(assert (=> b!1098826 (= res!733288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098827 () Bool)

(declare-fun e!627169 () Bool)

(declare-fun e!627167 () Bool)

(assert (=> b!1098827 (= e!627169 (not e!627167))))

(declare-fun res!733285 () Bool)

(assert (=> b!1098827 (=> res!733285 e!627167)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098827 (= res!733285 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41323)

(declare-datatypes ((tuple2!17314 0))(
  ( (tuple2!17315 (_1!8668 (_ BitVec 64)) (_2!8668 V!41323)) )
))
(declare-datatypes ((List!23933 0))(
  ( (Nil!23930) (Cons!23929 (h!25138 tuple2!17314) (t!34076 List!23933)) )
))
(declare-datatypes ((ListLongMap!15283 0))(
  ( (ListLongMap!15284 (toList!7657 List!23933)) )
))
(declare-fun lt!491727 () ListLongMap!15283)

(declare-fun zeroValue!831 () V!41323)

(declare-fun getCurrentListMap!4374 (array!71209 array!71211 (_ BitVec 32) (_ BitVec 32) V!41323 V!41323 (_ BitVec 32) Int) ListLongMap!15283)

(assert (=> b!1098827 (= lt!491727 (getCurrentListMap!4374 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491730 () array!71209)

(declare-fun lt!491720 () array!71211)

(declare-fun lt!491731 () ListLongMap!15283)

(assert (=> b!1098827 (= lt!491731 (getCurrentListMap!4374 lt!491730 lt!491720 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491728 () ListLongMap!15283)

(declare-fun lt!491726 () ListLongMap!15283)

(assert (=> b!1098827 (and (= lt!491728 lt!491726) (= lt!491726 lt!491728))))

(declare-fun lt!491719 () ListLongMap!15283)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!946 (ListLongMap!15283 (_ BitVec 64)) ListLongMap!15283)

(assert (=> b!1098827 (= lt!491726 (-!946 lt!491719 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36132 0))(
  ( (Unit!36133) )
))
(declare-fun lt!491722 () Unit!36132)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 (array!71209 array!71211 (_ BitVec 32) (_ BitVec 32) V!41323 V!41323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36132)

(assert (=> b!1098827 (= lt!491722 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4170 (array!71209 array!71211 (_ BitVec 32) (_ BitVec 32) V!41323 V!41323 (_ BitVec 32) Int) ListLongMap!15283)

(assert (=> b!1098827 (= lt!491728 (getCurrentListMapNoExtraKeys!4170 lt!491730 lt!491720 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2305 (Int (_ BitVec 64)) V!41323)

(assert (=> b!1098827 (= lt!491720 (array!71212 (store (arr!34273 _values!874) i!650 (ValueCellFull!12864 (dynLambda!2305 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34809 _values!874)))))

(assert (=> b!1098827 (= lt!491719 (getCurrentListMapNoExtraKeys!4170 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098827 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491732 () Unit!36132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71209 (_ BitVec 64) (_ BitVec 32)) Unit!36132)

(assert (=> b!1098827 (= lt!491732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098828 () Bool)

(declare-fun e!627172 () Bool)

(assert (=> b!1098828 (= e!627170 (and e!627172 mapRes!42493))))

(declare-fun condMapEmpty!42493 () Bool)

(declare-fun mapDefault!42493 () ValueCell!12864)

(assert (=> b!1098828 (= condMapEmpty!42493 (= (arr!34273 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12864)) mapDefault!42493)))))

(declare-fun b!1098829 () Bool)

(declare-fun e!627171 () Bool)

(assert (=> b!1098829 (= e!627171 true)))

(declare-fun lt!491733 () ListLongMap!15283)

(declare-fun lt!491724 () ListLongMap!15283)

(declare-fun lt!491721 () tuple2!17314)

(declare-fun +!3366 (ListLongMap!15283 tuple2!17314) ListLongMap!15283)

(assert (=> b!1098829 (= (-!946 lt!491724 k0!904) (+!3366 lt!491733 lt!491721))))

(declare-fun lt!491723 () ListLongMap!15283)

(declare-fun lt!491717 () Unit!36132)

(declare-fun addRemoveCommutativeForDiffKeys!118 (ListLongMap!15283 (_ BitVec 64) V!41323 (_ BitVec 64)) Unit!36132)

(assert (=> b!1098829 (= lt!491717 (addRemoveCommutativeForDiffKeys!118 lt!491723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1098830 () Bool)

(assert (=> b!1098830 (= e!627173 e!627169)))

(declare-fun res!733291 () Bool)

(assert (=> b!1098830 (=> (not res!733291) (not e!627169))))

(assert (=> b!1098830 (= res!733291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491730 mask!1414))))

(assert (=> b!1098830 (= lt!491730 (array!71210 (store (arr!34272 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34808 _keys!1070)))))

(declare-fun b!1098831 () Bool)

(declare-fun res!733293 () Bool)

(assert (=> b!1098831 (=> (not res!733293) (not e!627173))))

(assert (=> b!1098831 (= res!733293 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34808 _keys!1070))))))

(declare-fun mapNonEmpty!42493 () Bool)

(declare-fun tp!81230 () Bool)

(declare-fun e!627174 () Bool)

(assert (=> mapNonEmpty!42493 (= mapRes!42493 (and tp!81230 e!627174))))

(declare-fun mapRest!42493 () (Array (_ BitVec 32) ValueCell!12864))

(declare-fun mapValue!42493 () ValueCell!12864)

(declare-fun mapKey!42493 () (_ BitVec 32))

(assert (=> mapNonEmpty!42493 (= (arr!34273 _values!874) (store mapRest!42493 mapKey!42493 mapValue!42493))))

(declare-fun b!1098832 () Bool)

(assert (=> b!1098832 (= e!627172 tp_is_empty!27147)))

(declare-fun b!1098833 () Bool)

(declare-fun res!733290 () Bool)

(assert (=> b!1098833 (=> (not res!733290) (not e!627169))))

(declare-datatypes ((List!23934 0))(
  ( (Nil!23931) (Cons!23930 (h!25139 (_ BitVec 64)) (t!34077 List!23934)) )
))
(declare-fun arrayNoDuplicates!0 (array!71209 (_ BitVec 32) List!23934) Bool)

(assert (=> b!1098833 (= res!733290 (arrayNoDuplicates!0 lt!491730 #b00000000000000000000000000000000 Nil!23931))))

(declare-fun b!1098834 () Bool)

(assert (=> b!1098834 (= e!627174 tp_is_empty!27147)))

(declare-fun b!1098835 () Bool)

(declare-fun res!733295 () Bool)

(assert (=> b!1098835 (=> (not res!733295) (not e!627173))))

(assert (=> b!1098835 (= res!733295 (and (= (size!34809 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34808 _keys!1070) (size!34809 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098836 () Bool)

(declare-fun res!733287 () Bool)

(assert (=> b!1098836 (=> (not res!733287) (not e!627173))))

(assert (=> b!1098836 (= res!733287 (= (select (arr!34272 _keys!1070) i!650) k0!904))))

(declare-fun b!1098837 () Bool)

(declare-fun res!733289 () Bool)

(assert (=> b!1098837 (=> (not res!733289) (not e!627173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098837 (= res!733289 (validKeyInArray!0 k0!904))))

(declare-fun b!1098838 () Bool)

(declare-fun res!733286 () Bool)

(assert (=> b!1098838 (=> (not res!733286) (not e!627173))))

(assert (=> b!1098838 (= res!733286 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23931))))

(declare-fun b!1098839 () Bool)

(assert (=> b!1098839 (= e!627167 e!627171)))

(declare-fun res!733294 () Bool)

(assert (=> b!1098839 (=> res!733294 e!627171)))

(assert (=> b!1098839 (= res!733294 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!491725 () ListLongMap!15283)

(assert (=> b!1098839 (= lt!491733 lt!491725)))

(assert (=> b!1098839 (= lt!491733 (-!946 lt!491723 k0!904))))

(declare-fun lt!491718 () Unit!36132)

(assert (=> b!1098839 (= lt!491718 (addRemoveCommutativeForDiffKeys!118 lt!491719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1098839 (= lt!491731 (+!3366 lt!491725 lt!491721))))

(declare-fun lt!491729 () tuple2!17314)

(assert (=> b!1098839 (= lt!491725 (+!3366 lt!491726 lt!491729))))

(assert (=> b!1098839 (= lt!491727 lt!491724)))

(assert (=> b!1098839 (= lt!491724 (+!3366 lt!491723 lt!491721))))

(assert (=> b!1098839 (= lt!491723 (+!3366 lt!491719 lt!491729))))

(assert (=> b!1098839 (= lt!491731 (+!3366 (+!3366 lt!491728 lt!491729) lt!491721))))

(assert (=> b!1098839 (= lt!491721 (tuple2!17315 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098839 (= lt!491729 (tuple2!17315 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!96624 res!733292) b!1098835))

(assert (= (and b!1098835 res!733295) b!1098826))

(assert (= (and b!1098826 res!733288) b!1098838))

(assert (= (and b!1098838 res!733286) b!1098831))

(assert (= (and b!1098831 res!733293) b!1098837))

(assert (= (and b!1098837 res!733289) b!1098836))

(assert (= (and b!1098836 res!733287) b!1098830))

(assert (= (and b!1098830 res!733291) b!1098833))

(assert (= (and b!1098833 res!733290) b!1098827))

(assert (= (and b!1098827 (not res!733285)) b!1098839))

(assert (= (and b!1098839 (not res!733294)) b!1098829))

(assert (= (and b!1098828 condMapEmpty!42493) mapIsEmpty!42493))

(assert (= (and b!1098828 (not condMapEmpty!42493)) mapNonEmpty!42493))

(get-info :version)

(assert (= (and mapNonEmpty!42493 ((_ is ValueCellFull!12864) mapValue!42493)) b!1098834))

(assert (= (and b!1098828 ((_ is ValueCellFull!12864) mapDefault!42493)) b!1098832))

(assert (= start!96624 b!1098828))

(declare-fun b_lambda!17875 () Bool)

(assert (=> (not b_lambda!17875) (not b!1098827)))

(declare-fun t!34075 () Bool)

(declare-fun tb!7963 () Bool)

(assert (=> (and start!96624 (= defaultEntry!882 defaultEntry!882) t!34075) tb!7963))

(declare-fun result!16457 () Bool)

(assert (=> tb!7963 (= result!16457 tp_is_empty!27147)))

(assert (=> b!1098827 t!34075))

(declare-fun b_and!36915 () Bool)

(assert (= b_and!36913 (and (=> t!34075 result!16457) b_and!36915)))

(declare-fun m!1018625 () Bool)

(assert (=> mapNonEmpty!42493 m!1018625))

(declare-fun m!1018627 () Bool)

(assert (=> b!1098829 m!1018627))

(declare-fun m!1018629 () Bool)

(assert (=> b!1098829 m!1018629))

(declare-fun m!1018631 () Bool)

(assert (=> b!1098829 m!1018631))

(declare-fun m!1018633 () Bool)

(assert (=> b!1098833 m!1018633))

(declare-fun m!1018635 () Bool)

(assert (=> b!1098839 m!1018635))

(declare-fun m!1018637 () Bool)

(assert (=> b!1098839 m!1018637))

(declare-fun m!1018639 () Bool)

(assert (=> b!1098839 m!1018639))

(declare-fun m!1018641 () Bool)

(assert (=> b!1098839 m!1018641))

(declare-fun m!1018643 () Bool)

(assert (=> b!1098839 m!1018643))

(assert (=> b!1098839 m!1018643))

(declare-fun m!1018645 () Bool)

(assert (=> b!1098839 m!1018645))

(declare-fun m!1018647 () Bool)

(assert (=> b!1098839 m!1018647))

(declare-fun m!1018649 () Bool)

(assert (=> b!1098839 m!1018649))

(declare-fun m!1018651 () Bool)

(assert (=> b!1098836 m!1018651))

(declare-fun m!1018653 () Bool)

(assert (=> b!1098830 m!1018653))

(declare-fun m!1018655 () Bool)

(assert (=> b!1098830 m!1018655))

(declare-fun m!1018657 () Bool)

(assert (=> b!1098837 m!1018657))

(declare-fun m!1018659 () Bool)

(assert (=> b!1098838 m!1018659))

(declare-fun m!1018661 () Bool)

(assert (=> start!96624 m!1018661))

(declare-fun m!1018663 () Bool)

(assert (=> start!96624 m!1018663))

(declare-fun m!1018665 () Bool)

(assert (=> start!96624 m!1018665))

(declare-fun m!1018667 () Bool)

(assert (=> b!1098827 m!1018667))

(declare-fun m!1018669 () Bool)

(assert (=> b!1098827 m!1018669))

(declare-fun m!1018671 () Bool)

(assert (=> b!1098827 m!1018671))

(declare-fun m!1018673 () Bool)

(assert (=> b!1098827 m!1018673))

(declare-fun m!1018675 () Bool)

(assert (=> b!1098827 m!1018675))

(declare-fun m!1018677 () Bool)

(assert (=> b!1098827 m!1018677))

(declare-fun m!1018679 () Bool)

(assert (=> b!1098827 m!1018679))

(declare-fun m!1018681 () Bool)

(assert (=> b!1098827 m!1018681))

(declare-fun m!1018683 () Bool)

(assert (=> b!1098827 m!1018683))

(declare-fun m!1018685 () Bool)

(assert (=> b!1098827 m!1018685))

(declare-fun m!1018687 () Bool)

(assert (=> b!1098826 m!1018687))

(check-sat (not b!1098838) b_and!36915 (not b!1098837) (not b_lambda!17875) (not b!1098826) (not b!1098830) (not start!96624) (not b!1098829) (not b!1098839) tp_is_empty!27147 (not b!1098827) (not b!1098833) (not b_next!23097) (not mapNonEmpty!42493))
(check-sat b_and!36915 (not b_next!23097))
