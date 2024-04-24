; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96858 () Bool)

(assert start!96858)

(declare-fun b_free!23095 () Bool)

(declare-fun b_next!23095 () Bool)

(assert (=> start!96858 (= b_free!23095 (not b_next!23095))))

(declare-fun tp!81224 () Bool)

(declare-fun b_and!36919 () Bool)

(assert (=> start!96858 (= tp!81224 b_and!36919)))

(declare-fun b!1100109 () Bool)

(declare-fun res!733775 () Bool)

(declare-fun e!628005 () Bool)

(assert (=> b!1100109 (=> (not res!733775) (not e!628005))))

(declare-datatypes ((array!71239 0))(
  ( (array!71240 (arr!34281 (Array (_ BitVec 32) (_ BitVec 64))) (size!34818 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71239)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71239 (_ BitVec 32)) Bool)

(assert (=> b!1100109 (= res!733775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100110 () Bool)

(declare-fun e!628003 () Bool)

(assert (=> b!1100110 (= e!628005 e!628003)))

(declare-fun res!733778 () Bool)

(assert (=> b!1100110 (=> (not res!733778) (not e!628003))))

(declare-fun lt!492192 () array!71239)

(assert (=> b!1100110 (= res!733778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492192 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100110 (= lt!492192 (array!71240 (store (arr!34281 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34818 _keys!1070)))))

(declare-fun b!1100111 () Bool)

(declare-fun e!628002 () Bool)

(assert (=> b!1100111 (= e!628002 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((V!41321 0))(
  ( (V!41322 (val!13629 Int)) )
))
(declare-datatypes ((tuple2!17328 0))(
  ( (tuple2!17329 (_1!8675 (_ BitVec 64)) (_2!8675 V!41321)) )
))
(declare-datatypes ((List!23950 0))(
  ( (Nil!23947) (Cons!23946 (h!25164 tuple2!17328) (t!34083 List!23950)) )
))
(declare-datatypes ((ListLongMap!15305 0))(
  ( (ListLongMap!15306 (toList!7668 List!23950)) )
))
(declare-fun lt!492195 () ListLongMap!15305)

(declare-fun lt!492196 () ListLongMap!15305)

(declare-fun lt!492188 () tuple2!17328)

(declare-fun -!940 (ListLongMap!15305 (_ BitVec 64)) ListLongMap!15305)

(declare-fun +!3402 (ListLongMap!15305 tuple2!17328) ListLongMap!15305)

(assert (=> b!1100111 (= (-!940 lt!492195 k0!904) (+!3402 lt!492196 lt!492188))))

(declare-fun minValue!831 () V!41321)

(declare-fun lt!492197 () ListLongMap!15305)

(declare-datatypes ((Unit!36127 0))(
  ( (Unit!36128) )
))
(declare-fun lt!492185 () Unit!36127)

(declare-fun addRemoveCommutativeForDiffKeys!119 (ListLongMap!15305 (_ BitVec 64) V!41321 (_ BitVec 64)) Unit!36127)

(assert (=> b!1100111 (= lt!492185 (addRemoveCommutativeForDiffKeys!119 lt!492197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1100112 () Bool)

(declare-fun e!627999 () Bool)

(assert (=> b!1100112 (= e!628003 (not e!627999))))

(declare-fun res!733783 () Bool)

(assert (=> b!1100112 (=> res!733783 e!627999)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100112 (= res!733783 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!492194 () ListLongMap!15305)

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41321)

(declare-datatypes ((ValueCell!12863 0))(
  ( (ValueCellFull!12863 (v!16250 V!41321)) (EmptyCell!12863) )
))
(declare-datatypes ((array!71241 0))(
  ( (array!71242 (arr!34282 (Array (_ BitVec 32) ValueCell!12863)) (size!34819 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71241)

(declare-fun getCurrentListMap!4378 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) Int) ListLongMap!15305)

(assert (=> b!1100112 (= lt!492194 (getCurrentListMap!4378 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492190 () ListLongMap!15305)

(declare-fun lt!492191 () array!71241)

(assert (=> b!1100112 (= lt!492190 (getCurrentListMap!4378 lt!492192 lt!492191 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492184 () ListLongMap!15305)

(declare-fun lt!492193 () ListLongMap!15305)

(assert (=> b!1100112 (and (= lt!492184 lt!492193) (= lt!492193 lt!492184))))

(declare-fun lt!492187 () ListLongMap!15305)

(assert (=> b!1100112 (= lt!492193 (-!940 lt!492187 k0!904))))

(declare-fun lt!492189 () Unit!36127)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!212 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36127)

(assert (=> b!1100112 (= lt!492189 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!212 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4219 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) Int) ListLongMap!15305)

(assert (=> b!1100112 (= lt!492184 (getCurrentListMapNoExtraKeys!4219 lt!492192 lt!492191 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2337 (Int (_ BitVec 64)) V!41321)

(assert (=> b!1100112 (= lt!492191 (array!71242 (store (arr!34282 _values!874) i!650 (ValueCellFull!12863 (dynLambda!2337 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34819 _values!874)))))

(assert (=> b!1100112 (= lt!492187 (getCurrentListMapNoExtraKeys!4219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100112 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492183 () Unit!36127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71239 (_ BitVec 64) (_ BitVec 32)) Unit!36127)

(assert (=> b!1100112 (= lt!492183 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100113 () Bool)

(declare-fun res!733774 () Bool)

(assert (=> b!1100113 (=> (not res!733774) (not e!628005))))

(assert (=> b!1100113 (= res!733774 (= (select (arr!34281 _keys!1070) i!650) k0!904))))

(declare-fun b!1100114 () Bool)

(declare-fun res!733779 () Bool)

(assert (=> b!1100114 (=> (not res!733779) (not e!628003))))

(declare-datatypes ((List!23951 0))(
  ( (Nil!23948) (Cons!23947 (h!25165 (_ BitVec 64)) (t!34084 List!23951)) )
))
(declare-fun arrayNoDuplicates!0 (array!71239 (_ BitVec 32) List!23951) Bool)

(assert (=> b!1100114 (= res!733779 (arrayNoDuplicates!0 lt!492192 #b00000000000000000000000000000000 Nil!23948))))

(declare-fun b!1100115 () Bool)

(assert (=> b!1100115 (= e!627999 e!628002)))

(declare-fun res!733782 () Bool)

(assert (=> b!1100115 (=> res!733782 e!628002)))

(assert (=> b!1100115 (= res!733782 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!492182 () ListLongMap!15305)

(assert (=> b!1100115 (= lt!492196 lt!492182)))

(assert (=> b!1100115 (= lt!492196 (-!940 lt!492197 k0!904))))

(declare-fun lt!492186 () Unit!36127)

(assert (=> b!1100115 (= lt!492186 (addRemoveCommutativeForDiffKeys!119 lt!492187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1100115 (= lt!492190 (+!3402 lt!492182 lt!492188))))

(declare-fun lt!492181 () tuple2!17328)

(assert (=> b!1100115 (= lt!492182 (+!3402 lt!492193 lt!492181))))

(assert (=> b!1100115 (= lt!492194 lt!492195)))

(assert (=> b!1100115 (= lt!492195 (+!3402 lt!492197 lt!492188))))

(assert (=> b!1100115 (= lt!492197 (+!3402 lt!492187 lt!492181))))

(assert (=> b!1100115 (= lt!492190 (+!3402 (+!3402 lt!492184 lt!492181) lt!492188))))

(assert (=> b!1100115 (= lt!492188 (tuple2!17329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1100115 (= lt!492181 (tuple2!17329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100116 () Bool)

(declare-fun res!733776 () Bool)

(assert (=> b!1100116 (=> (not res!733776) (not e!628005))))

(assert (=> b!1100116 (= res!733776 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23948))))

(declare-fun b!1100117 () Bool)

(declare-fun res!733781 () Bool)

(assert (=> b!1100117 (=> (not res!733781) (not e!628005))))

(assert (=> b!1100117 (= res!733781 (and (= (size!34819 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34818 _keys!1070) (size!34819 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42490 () Bool)

(declare-fun mapRes!42490 () Bool)

(declare-fun tp!81223 () Bool)

(declare-fun e!628001 () Bool)

(assert (=> mapNonEmpty!42490 (= mapRes!42490 (and tp!81223 e!628001))))

(declare-fun mapKey!42490 () (_ BitVec 32))

(declare-fun mapRest!42490 () (Array (_ BitVec 32) ValueCell!12863))

(declare-fun mapValue!42490 () ValueCell!12863)

(assert (=> mapNonEmpty!42490 (= (arr!34282 _values!874) (store mapRest!42490 mapKey!42490 mapValue!42490))))

(declare-fun res!733780 () Bool)

(assert (=> start!96858 (=> (not res!733780) (not e!628005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96858 (= res!733780 (validMask!0 mask!1414))))

(assert (=> start!96858 e!628005))

(assert (=> start!96858 tp!81224))

(assert (=> start!96858 true))

(declare-fun tp_is_empty!27145 () Bool)

(assert (=> start!96858 tp_is_empty!27145))

(declare-fun array_inv!26434 (array!71239) Bool)

(assert (=> start!96858 (array_inv!26434 _keys!1070)))

(declare-fun e!628004 () Bool)

(declare-fun array_inv!26435 (array!71241) Bool)

(assert (=> start!96858 (and (array_inv!26435 _values!874) e!628004)))

(declare-fun b!1100118 () Bool)

(assert (=> b!1100118 (= e!628001 tp_is_empty!27145)))

(declare-fun b!1100119 () Bool)

(declare-fun res!733784 () Bool)

(assert (=> b!1100119 (=> (not res!733784) (not e!628005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100119 (= res!733784 (validKeyInArray!0 k0!904))))

(declare-fun b!1100120 () Bool)

(declare-fun res!733777 () Bool)

(assert (=> b!1100120 (=> (not res!733777) (not e!628005))))

(assert (=> b!1100120 (= res!733777 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34818 _keys!1070))))))

(declare-fun b!1100121 () Bool)

(declare-fun e!627998 () Bool)

(assert (=> b!1100121 (= e!627998 tp_is_empty!27145)))

(declare-fun b!1100122 () Bool)

(assert (=> b!1100122 (= e!628004 (and e!627998 mapRes!42490))))

(declare-fun condMapEmpty!42490 () Bool)

(declare-fun mapDefault!42490 () ValueCell!12863)

(assert (=> b!1100122 (= condMapEmpty!42490 (= (arr!34282 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12863)) mapDefault!42490)))))

(declare-fun mapIsEmpty!42490 () Bool)

(assert (=> mapIsEmpty!42490 mapRes!42490))

(assert (= (and start!96858 res!733780) b!1100117))

(assert (= (and b!1100117 res!733781) b!1100109))

(assert (= (and b!1100109 res!733775) b!1100116))

(assert (= (and b!1100116 res!733776) b!1100120))

(assert (= (and b!1100120 res!733777) b!1100119))

(assert (= (and b!1100119 res!733784) b!1100113))

(assert (= (and b!1100113 res!733774) b!1100110))

(assert (= (and b!1100110 res!733778) b!1100114))

(assert (= (and b!1100114 res!733779) b!1100112))

(assert (= (and b!1100112 (not res!733783)) b!1100115))

(assert (= (and b!1100115 (not res!733782)) b!1100111))

(assert (= (and b!1100122 condMapEmpty!42490) mapIsEmpty!42490))

(assert (= (and b!1100122 (not condMapEmpty!42490)) mapNonEmpty!42490))

(get-info :version)

(assert (= (and mapNonEmpty!42490 ((_ is ValueCellFull!12863) mapValue!42490)) b!1100118))

(assert (= (and b!1100122 ((_ is ValueCellFull!12863) mapDefault!42490)) b!1100121))

(assert (= start!96858 b!1100122))

(declare-fun b_lambda!17883 () Bool)

(assert (=> (not b_lambda!17883) (not b!1100112)))

(declare-fun t!34082 () Bool)

(declare-fun tb!7953 () Bool)

(assert (=> (and start!96858 (= defaultEntry!882 defaultEntry!882) t!34082) tb!7953))

(declare-fun result!16445 () Bool)

(assert (=> tb!7953 (= result!16445 tp_is_empty!27145)))

(assert (=> b!1100112 t!34082))

(declare-fun b_and!36921 () Bool)

(assert (= b_and!36919 (and (=> t!34082 result!16445) b_and!36921)))

(declare-fun m!1020233 () Bool)

(assert (=> b!1100114 m!1020233))

(declare-fun m!1020235 () Bool)

(assert (=> b!1100116 m!1020235))

(declare-fun m!1020237 () Bool)

(assert (=> start!96858 m!1020237))

(declare-fun m!1020239 () Bool)

(assert (=> start!96858 m!1020239))

(declare-fun m!1020241 () Bool)

(assert (=> start!96858 m!1020241))

(declare-fun m!1020243 () Bool)

(assert (=> b!1100111 m!1020243))

(declare-fun m!1020245 () Bool)

(assert (=> b!1100111 m!1020245))

(declare-fun m!1020247 () Bool)

(assert (=> b!1100111 m!1020247))

(declare-fun m!1020249 () Bool)

(assert (=> b!1100115 m!1020249))

(declare-fun m!1020251 () Bool)

(assert (=> b!1100115 m!1020251))

(declare-fun m!1020253 () Bool)

(assert (=> b!1100115 m!1020253))

(declare-fun m!1020255 () Bool)

(assert (=> b!1100115 m!1020255))

(assert (=> b!1100115 m!1020255))

(declare-fun m!1020257 () Bool)

(assert (=> b!1100115 m!1020257))

(declare-fun m!1020259 () Bool)

(assert (=> b!1100115 m!1020259))

(declare-fun m!1020261 () Bool)

(assert (=> b!1100115 m!1020261))

(declare-fun m!1020263 () Bool)

(assert (=> b!1100115 m!1020263))

(declare-fun m!1020265 () Bool)

(assert (=> b!1100113 m!1020265))

(declare-fun m!1020267 () Bool)

(assert (=> mapNonEmpty!42490 m!1020267))

(declare-fun m!1020269 () Bool)

(assert (=> b!1100110 m!1020269))

(declare-fun m!1020271 () Bool)

(assert (=> b!1100110 m!1020271))

(declare-fun m!1020273 () Bool)

(assert (=> b!1100119 m!1020273))

(declare-fun m!1020275 () Bool)

(assert (=> b!1100109 m!1020275))

(declare-fun m!1020277 () Bool)

(assert (=> b!1100112 m!1020277))

(declare-fun m!1020279 () Bool)

(assert (=> b!1100112 m!1020279))

(declare-fun m!1020281 () Bool)

(assert (=> b!1100112 m!1020281))

(declare-fun m!1020283 () Bool)

(assert (=> b!1100112 m!1020283))

(declare-fun m!1020285 () Bool)

(assert (=> b!1100112 m!1020285))

(declare-fun m!1020287 () Bool)

(assert (=> b!1100112 m!1020287))

(declare-fun m!1020289 () Bool)

(assert (=> b!1100112 m!1020289))

(declare-fun m!1020291 () Bool)

(assert (=> b!1100112 m!1020291))

(declare-fun m!1020293 () Bool)

(assert (=> b!1100112 m!1020293))

(declare-fun m!1020295 () Bool)

(assert (=> b!1100112 m!1020295))

(check-sat (not b!1100115) (not b!1100119) (not b!1100112) (not b_next!23095) (not start!96858) (not mapNonEmpty!42490) (not b!1100116) (not b!1100109) (not b!1100110) b_and!36921 (not b!1100111) tp_is_empty!27145 (not b!1100114) (not b_lambda!17883))
(check-sat b_and!36921 (not b_next!23095))
