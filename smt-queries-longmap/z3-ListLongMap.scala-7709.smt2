; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96864 () Bool)

(assert start!96864)

(declare-fun b_free!23181 () Bool)

(declare-fun b_next!23181 () Bool)

(assert (=> start!96864 (= b_free!23181 (not b_next!23181))))

(declare-fun tp!81500 () Bool)

(declare-fun b_and!37165 () Bool)

(assert (=> start!96864 (= tp!81500 b_and!37165)))

(declare-fun b!1101852 () Bool)

(declare-fun res!735197 () Bool)

(declare-fun e!628927 () Bool)

(assert (=> b!1101852 (=> (not res!735197) (not e!628927))))

(declare-datatypes ((array!71383 0))(
  ( (array!71384 (arr!34353 (Array (_ BitVec 32) (_ BitVec 64))) (size!34889 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71383)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71383 (_ BitVec 32)) Bool)

(assert (=> b!1101852 (= res!735197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101853 () Bool)

(declare-fun e!628925 () Bool)

(declare-fun e!628924 () Bool)

(assert (=> b!1101853 (= e!628925 e!628924)))

(declare-fun res!735194 () Bool)

(assert (=> b!1101853 (=> res!735194 e!628924)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1101853 (= res!735194 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!41435 0))(
  ( (V!41436 (val!13672 Int)) )
))
(declare-datatypes ((tuple2!17386 0))(
  ( (tuple2!17387 (_1!8704 (_ BitVec 64)) (_2!8704 V!41435)) )
))
(declare-datatypes ((List!24001 0))(
  ( (Nil!23998) (Cons!23997 (h!25206 tuple2!17386) (t!34228 List!24001)) )
))
(declare-datatypes ((ListLongMap!15355 0))(
  ( (ListLongMap!15356 (toList!7693 List!24001)) )
))
(declare-fun lt!494136 () ListLongMap!15355)

(declare-fun lt!494134 () ListLongMap!15355)

(assert (=> b!1101853 (= lt!494136 lt!494134)))

(declare-fun lt!494132 () ListLongMap!15355)

(declare-fun lt!494142 () tuple2!17386)

(declare-fun +!3398 (ListLongMap!15355 tuple2!17386) ListLongMap!15355)

(assert (=> b!1101853 (= lt!494134 (+!3398 lt!494132 lt!494142))))

(declare-fun lt!494133 () ListLongMap!15355)

(declare-fun lt!494143 () ListLongMap!15355)

(assert (=> b!1101853 (= lt!494133 lt!494143)))

(declare-fun lt!494137 () ListLongMap!15355)

(assert (=> b!1101853 (= lt!494143 (+!3398 lt!494137 lt!494142))))

(declare-fun lt!494138 () ListLongMap!15355)

(assert (=> b!1101853 (= lt!494133 (+!3398 lt!494138 lt!494142))))

(declare-fun minValue!831 () V!41435)

(assert (=> b!1101853 (= lt!494142 (tuple2!17387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!42637 () Bool)

(declare-fun mapRes!42637 () Bool)

(declare-fun tp!81499 () Bool)

(declare-fun e!628926 () Bool)

(assert (=> mapNonEmpty!42637 (= mapRes!42637 (and tp!81499 e!628926))))

(declare-datatypes ((ValueCell!12906 0))(
  ( (ValueCellFull!12906 (v!16303 V!41435)) (EmptyCell!12906) )
))
(declare-datatypes ((array!71385 0))(
  ( (array!71386 (arr!34354 (Array (_ BitVec 32) ValueCell!12906)) (size!34890 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71385)

(declare-fun mapValue!42637 () ValueCell!12906)

(declare-fun mapKey!42637 () (_ BitVec 32))

(declare-fun mapRest!42637 () (Array (_ BitVec 32) ValueCell!12906))

(assert (=> mapNonEmpty!42637 (= (arr!34354 _values!874) (store mapRest!42637 mapKey!42637 mapValue!42637))))

(declare-fun b!1101854 () Bool)

(declare-fun res!735192 () Bool)

(assert (=> b!1101854 (=> (not res!735192) (not e!628927))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101854 (= res!735192 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34889 _keys!1070))))))

(declare-fun b!1101855 () Bool)

(declare-fun res!735198 () Bool)

(assert (=> b!1101855 (=> (not res!735198) (not e!628927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101855 (= res!735198 (validKeyInArray!0 k0!904))))

(declare-fun b!1101856 () Bool)

(declare-fun e!628922 () Bool)

(assert (=> b!1101856 (= e!628922 (not e!628925))))

(declare-fun res!735199 () Bool)

(assert (=> b!1101856 (=> res!735199 e!628925)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101856 (= res!735199 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41435)

(declare-fun getCurrentListMap!4398 (array!71383 array!71385 (_ BitVec 32) (_ BitVec 32) V!41435 V!41435 (_ BitVec 32) Int) ListLongMap!15355)

(assert (=> b!1101856 (= lt!494136 (getCurrentListMap!4398 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494131 () array!71385)

(declare-fun lt!494135 () array!71383)

(assert (=> b!1101856 (= lt!494133 (getCurrentListMap!4398 lt!494135 lt!494131 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101856 (and (= lt!494138 lt!494137) (= lt!494137 lt!494138))))

(declare-fun -!976 (ListLongMap!15355 (_ BitVec 64)) ListLongMap!15355)

(assert (=> b!1101856 (= lt!494137 (-!976 lt!494132 k0!904))))

(declare-datatypes ((Unit!36204 0))(
  ( (Unit!36205) )
))
(declare-fun lt!494139 () Unit!36204)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!224 (array!71383 array!71385 (_ BitVec 32) (_ BitVec 32) V!41435 V!41435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36204)

(assert (=> b!1101856 (= lt!494139 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4194 (array!71383 array!71385 (_ BitVec 32) (_ BitVec 32) V!41435 V!41435 (_ BitVec 32) Int) ListLongMap!15355)

(assert (=> b!1101856 (= lt!494138 (getCurrentListMapNoExtraKeys!4194 lt!494135 lt!494131 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2329 (Int (_ BitVec 64)) V!41435)

(assert (=> b!1101856 (= lt!494131 (array!71386 (store (arr!34354 _values!874) i!650 (ValueCellFull!12906 (dynLambda!2329 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34890 _values!874)))))

(assert (=> b!1101856 (= lt!494132 (getCurrentListMapNoExtraKeys!4194 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101856 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494141 () Unit!36204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71383 (_ BitVec 64) (_ BitVec 32)) Unit!36204)

(assert (=> b!1101856 (= lt!494141 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101857 () Bool)

(declare-fun res!735189 () Bool)

(assert (=> b!1101857 (=> (not res!735189) (not e!628927))))

(declare-datatypes ((List!24002 0))(
  ( (Nil!23999) (Cons!23998 (h!25207 (_ BitVec 64)) (t!34229 List!24002)) )
))
(declare-fun arrayNoDuplicates!0 (array!71383 (_ BitVec 32) List!24002) Bool)

(assert (=> b!1101857 (= res!735189 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23999))))

(declare-fun b!1101858 () Bool)

(assert (=> b!1101858 (= e!628924 true)))

(assert (=> b!1101858 (= (-!976 lt!494134 k0!904) lt!494143)))

(declare-fun lt!494140 () Unit!36204)

(declare-fun addRemoveCommutativeForDiffKeys!133 (ListLongMap!15355 (_ BitVec 64) V!41435 (_ BitVec 64)) Unit!36204)

(assert (=> b!1101858 (= lt!494140 (addRemoveCommutativeForDiffKeys!133 lt!494132 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1101859 () Bool)

(assert (=> b!1101859 (= e!628927 e!628922)))

(declare-fun res!735193 () Bool)

(assert (=> b!1101859 (=> (not res!735193) (not e!628922))))

(assert (=> b!1101859 (= res!735193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494135 mask!1414))))

(assert (=> b!1101859 (= lt!494135 (array!71384 (store (arr!34353 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34889 _keys!1070)))))

(declare-fun b!1101860 () Bool)

(declare-fun tp_is_empty!27231 () Bool)

(assert (=> b!1101860 (= e!628926 tp_is_empty!27231)))

(declare-fun mapIsEmpty!42637 () Bool)

(assert (=> mapIsEmpty!42637 mapRes!42637))

(declare-fun b!1101861 () Bool)

(declare-fun res!735195 () Bool)

(assert (=> b!1101861 (=> (not res!735195) (not e!628922))))

(assert (=> b!1101861 (= res!735195 (arrayNoDuplicates!0 lt!494135 #b00000000000000000000000000000000 Nil!23999))))

(declare-fun b!1101862 () Bool)

(declare-fun res!735190 () Bool)

(assert (=> b!1101862 (=> (not res!735190) (not e!628927))))

(assert (=> b!1101862 (= res!735190 (= (select (arr!34353 _keys!1070) i!650) k0!904))))

(declare-fun b!1101863 () Bool)

(declare-fun res!735196 () Bool)

(assert (=> b!1101863 (=> (not res!735196) (not e!628927))))

(assert (=> b!1101863 (= res!735196 (and (= (size!34890 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34889 _keys!1070) (size!34890 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!735191 () Bool)

(assert (=> start!96864 (=> (not res!735191) (not e!628927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96864 (= res!735191 (validMask!0 mask!1414))))

(assert (=> start!96864 e!628927))

(assert (=> start!96864 tp!81500))

(assert (=> start!96864 true))

(assert (=> start!96864 tp_is_empty!27231))

(declare-fun array_inv!26458 (array!71383) Bool)

(assert (=> start!96864 (array_inv!26458 _keys!1070)))

(declare-fun e!628921 () Bool)

(declare-fun array_inv!26459 (array!71385) Bool)

(assert (=> start!96864 (and (array_inv!26459 _values!874) e!628921)))

(declare-fun b!1101864 () Bool)

(declare-fun e!628923 () Bool)

(assert (=> b!1101864 (= e!628923 tp_is_empty!27231)))

(declare-fun b!1101865 () Bool)

(assert (=> b!1101865 (= e!628921 (and e!628923 mapRes!42637))))

(declare-fun condMapEmpty!42637 () Bool)

(declare-fun mapDefault!42637 () ValueCell!12906)

(assert (=> b!1101865 (= condMapEmpty!42637 (= (arr!34354 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12906)) mapDefault!42637)))))

(assert (= (and start!96864 res!735191) b!1101863))

(assert (= (and b!1101863 res!735196) b!1101852))

(assert (= (and b!1101852 res!735197) b!1101857))

(assert (= (and b!1101857 res!735189) b!1101854))

(assert (= (and b!1101854 res!735192) b!1101855))

(assert (= (and b!1101855 res!735198) b!1101862))

(assert (= (and b!1101862 res!735190) b!1101859))

(assert (= (and b!1101859 res!735193) b!1101861))

(assert (= (and b!1101861 res!735195) b!1101856))

(assert (= (and b!1101856 (not res!735199)) b!1101853))

(assert (= (and b!1101853 (not res!735194)) b!1101858))

(assert (= (and b!1101865 condMapEmpty!42637) mapIsEmpty!42637))

(assert (= (and b!1101865 (not condMapEmpty!42637)) mapNonEmpty!42637))

(get-info :version)

(assert (= (and mapNonEmpty!42637 ((_ is ValueCellFull!12906) mapValue!42637)) b!1101860))

(assert (= (and b!1101865 ((_ is ValueCellFull!12906) mapDefault!42637)) b!1101864))

(assert (= start!96864 b!1101865))

(declare-fun b_lambda!18139 () Bool)

(assert (=> (not b_lambda!18139) (not b!1101856)))

(declare-fun t!34227 () Bool)

(declare-fun tb!8047 () Bool)

(assert (=> (and start!96864 (= defaultEntry!882 defaultEntry!882) t!34227) tb!8047))

(declare-fun result!16637 () Bool)

(assert (=> tb!8047 (= result!16637 tp_is_empty!27231)))

(assert (=> b!1101856 t!34227))

(declare-fun b_and!37167 () Bool)

(assert (= b_and!37165 (and (=> t!34227 result!16637) b_and!37167)))

(declare-fun m!1022069 () Bool)

(assert (=> b!1101856 m!1022069))

(declare-fun m!1022071 () Bool)

(assert (=> b!1101856 m!1022071))

(declare-fun m!1022073 () Bool)

(assert (=> b!1101856 m!1022073))

(declare-fun m!1022075 () Bool)

(assert (=> b!1101856 m!1022075))

(declare-fun m!1022077 () Bool)

(assert (=> b!1101856 m!1022077))

(declare-fun m!1022079 () Bool)

(assert (=> b!1101856 m!1022079))

(declare-fun m!1022081 () Bool)

(assert (=> b!1101856 m!1022081))

(declare-fun m!1022083 () Bool)

(assert (=> b!1101856 m!1022083))

(declare-fun m!1022085 () Bool)

(assert (=> b!1101856 m!1022085))

(declare-fun m!1022087 () Bool)

(assert (=> b!1101856 m!1022087))

(declare-fun m!1022089 () Bool)

(assert (=> b!1101852 m!1022089))

(declare-fun m!1022091 () Bool)

(assert (=> b!1101862 m!1022091))

(declare-fun m!1022093 () Bool)

(assert (=> start!96864 m!1022093))

(declare-fun m!1022095 () Bool)

(assert (=> start!96864 m!1022095))

(declare-fun m!1022097 () Bool)

(assert (=> start!96864 m!1022097))

(declare-fun m!1022099 () Bool)

(assert (=> b!1101853 m!1022099))

(declare-fun m!1022101 () Bool)

(assert (=> b!1101853 m!1022101))

(declare-fun m!1022103 () Bool)

(assert (=> b!1101853 m!1022103))

(declare-fun m!1022105 () Bool)

(assert (=> b!1101859 m!1022105))

(declare-fun m!1022107 () Bool)

(assert (=> b!1101859 m!1022107))

(declare-fun m!1022109 () Bool)

(assert (=> b!1101855 m!1022109))

(declare-fun m!1022111 () Bool)

(assert (=> b!1101858 m!1022111))

(declare-fun m!1022113 () Bool)

(assert (=> b!1101858 m!1022113))

(declare-fun m!1022115 () Bool)

(assert (=> mapNonEmpty!42637 m!1022115))

(declare-fun m!1022117 () Bool)

(assert (=> b!1101861 m!1022117))

(declare-fun m!1022119 () Bool)

(assert (=> b!1101857 m!1022119))

(check-sat (not b!1101858) (not b!1101853) b_and!37167 (not b!1101852) (not b!1101861) (not b!1101855) (not mapNonEmpty!42637) (not b!1101856) (not b_next!23181) (not b_lambda!18139) (not b!1101859) (not start!96864) tp_is_empty!27231 (not b!1101857))
(check-sat b_and!37167 (not b_next!23181))
