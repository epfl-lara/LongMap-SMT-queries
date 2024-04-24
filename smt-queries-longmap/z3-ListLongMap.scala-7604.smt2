; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96180 () Bool)

(assert start!96180)

(declare-fun b_free!22597 () Bool)

(declare-fun b_next!22597 () Bool)

(assert (=> start!96180 (= b_free!22597 (not b_next!22597))))

(declare-fun tp!79639 () Bool)

(declare-fun b_and!35879 () Bool)

(assert (=> start!96180 (= tp!79639 b_and!35879)))

(declare-fun b!1088192 () Bool)

(declare-fun res!725296 () Bool)

(declare-fun e!621711 () Bool)

(assert (=> b!1088192 (=> (not res!725296) (not e!621711))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70163 0))(
  ( (array!70164 (arr!33749 (Array (_ BitVec 32) (_ BitVec 64))) (size!34286 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70163)

(assert (=> b!1088192 (= res!725296 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34286 _keys!1070))))))

(declare-fun b!1088193 () Bool)

(declare-fun e!621710 () Bool)

(declare-fun e!621708 () Bool)

(assert (=> b!1088193 (= e!621710 e!621708)))

(declare-fun res!725288 () Bool)

(assert (=> b!1088193 (=> res!725288 e!621708)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088193 (= res!725288 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40593 0))(
  ( (V!40594 (val!13356 Int)) )
))
(declare-datatypes ((tuple2!16952 0))(
  ( (tuple2!16953 (_1!8487 (_ BitVec 64)) (_2!8487 V!40593)) )
))
(declare-datatypes ((List!23547 0))(
  ( (Nil!23544) (Cons!23543 (h!24761 tuple2!16952) (t!33194 List!23547)) )
))
(declare-datatypes ((ListLongMap!14929 0))(
  ( (ListLongMap!14930 (toList!7480 List!23547)) )
))
(declare-fun lt!483855 () ListLongMap!14929)

(declare-fun lt!483856 () ListLongMap!14929)

(assert (=> b!1088193 (= lt!483855 lt!483856)))

(declare-fun lt!483851 () ListLongMap!14929)

(declare-fun -!792 (ListLongMap!14929 (_ BitVec 64)) ListLongMap!14929)

(assert (=> b!1088193 (= lt!483855 (-!792 lt!483851 k0!904))))

(declare-fun lt!483861 () ListLongMap!14929)

(declare-datatypes ((Unit!35751 0))(
  ( (Unit!35752) )
))
(declare-fun lt!483864 () Unit!35751)

(declare-fun zeroValue!831 () V!40593)

(declare-fun addRemoveCommutativeForDiffKeys!37 (ListLongMap!14929 (_ BitVec 64) V!40593 (_ BitVec 64)) Unit!35751)

(assert (=> b!1088193 (= lt!483864 (addRemoveCommutativeForDiffKeys!37 lt!483861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483865 () ListLongMap!14929)

(declare-fun lt!483866 () tuple2!16952)

(declare-fun +!3303 (ListLongMap!14929 tuple2!16952) ListLongMap!14929)

(assert (=> b!1088193 (= lt!483865 (+!3303 lt!483856 lt!483866))))

(declare-fun lt!483867 () ListLongMap!14929)

(declare-fun lt!483860 () tuple2!16952)

(assert (=> b!1088193 (= lt!483856 (+!3303 lt!483867 lt!483860))))

(declare-fun lt!483862 () ListLongMap!14929)

(declare-fun lt!483857 () ListLongMap!14929)

(assert (=> b!1088193 (= lt!483862 lt!483857)))

(assert (=> b!1088193 (= lt!483857 (+!3303 lt!483851 lt!483866))))

(assert (=> b!1088193 (= lt!483851 (+!3303 lt!483861 lt!483860))))

(declare-fun lt!483854 () ListLongMap!14929)

(assert (=> b!1088193 (= lt!483865 (+!3303 (+!3303 lt!483854 lt!483860) lt!483866))))

(declare-fun minValue!831 () V!40593)

(assert (=> b!1088193 (= lt!483866 (tuple2!16953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1088193 (= lt!483860 (tuple2!16953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088194 () Bool)

(declare-fun e!621709 () Bool)

(declare-fun tp_is_empty!26599 () Bool)

(assert (=> b!1088194 (= e!621709 tp_is_empty!26599)))

(declare-fun b!1088195 () Bool)

(declare-fun e!621707 () Bool)

(declare-fun e!621706 () Bool)

(declare-fun mapRes!41653 () Bool)

(assert (=> b!1088195 (= e!621707 (and e!621706 mapRes!41653))))

(declare-fun condMapEmpty!41653 () Bool)

(declare-datatypes ((ValueCell!12590 0))(
  ( (ValueCellFull!12590 (v!15973 V!40593)) (EmptyCell!12590) )
))
(declare-datatypes ((array!70165 0))(
  ( (array!70166 (arr!33750 (Array (_ BitVec 32) ValueCell!12590)) (size!34287 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70165)

(declare-fun mapDefault!41653 () ValueCell!12590)

(assert (=> b!1088195 (= condMapEmpty!41653 (= (arr!33750 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12590)) mapDefault!41653)))))

(declare-fun b!1088196 () Bool)

(declare-fun res!725292 () Bool)

(assert (=> b!1088196 (=> (not res!725292) (not e!621711))))

(declare-datatypes ((List!23548 0))(
  ( (Nil!23545) (Cons!23544 (h!24762 (_ BitVec 64)) (t!33195 List!23548)) )
))
(declare-fun arrayNoDuplicates!0 (array!70163 (_ BitVec 32) List!23548) Bool)

(assert (=> b!1088196 (= res!725292 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23545))))

(declare-fun b!1088197 () Bool)

(assert (=> b!1088197 (= e!621706 tp_is_empty!26599)))

(declare-fun b!1088198 () Bool)

(declare-fun res!725298 () Bool)

(assert (=> b!1088198 (=> (not res!725298) (not e!621711))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70163 (_ BitVec 32)) Bool)

(assert (=> b!1088198 (= res!725298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088199 () Bool)

(declare-fun e!621713 () Bool)

(assert (=> b!1088199 (= e!621713 (not e!621710))))

(declare-fun res!725295 () Bool)

(assert (=> b!1088199 (=> res!725295 e!621710)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088199 (= res!725295 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4245 (array!70163 array!70165 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) Int) ListLongMap!14929)

(assert (=> b!1088199 (= lt!483862 (getCurrentListMap!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483852 () array!70163)

(declare-fun lt!483863 () array!70165)

(assert (=> b!1088199 (= lt!483865 (getCurrentListMap!4245 lt!483852 lt!483863 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088199 (and (= lt!483854 lt!483867) (= lt!483867 lt!483854))))

(assert (=> b!1088199 (= lt!483867 (-!792 lt!483861 k0!904))))

(declare-fun lt!483859 () Unit!35751)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 (array!70163 array!70165 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35751)

(assert (=> b!1088199 (= lt!483859 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4050 (array!70163 array!70165 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) Int) ListLongMap!14929)

(assert (=> b!1088199 (= lt!483854 (getCurrentListMapNoExtraKeys!4050 lt!483852 lt!483863 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2171 (Int (_ BitVec 64)) V!40593)

(assert (=> b!1088199 (= lt!483863 (array!70166 (store (arr!33750 _values!874) i!650 (ValueCellFull!12590 (dynLambda!2171 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34287 _values!874)))))

(assert (=> b!1088199 (= lt!483861 (getCurrentListMapNoExtraKeys!4050 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088199 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483853 () Unit!35751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70163 (_ BitVec 64) (_ BitVec 32)) Unit!35751)

(assert (=> b!1088199 (= lt!483853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41653 () Bool)

(declare-fun tp!79640 () Bool)

(assert (=> mapNonEmpty!41653 (= mapRes!41653 (and tp!79640 e!621709))))

(declare-fun mapRest!41653 () (Array (_ BitVec 32) ValueCell!12590))

(declare-fun mapKey!41653 () (_ BitVec 32))

(declare-fun mapValue!41653 () ValueCell!12590)

(assert (=> mapNonEmpty!41653 (= (arr!33750 _values!874) (store mapRest!41653 mapKey!41653 mapValue!41653))))

(declare-fun b!1088200 () Bool)

(declare-fun res!725294 () Bool)

(assert (=> b!1088200 (=> (not res!725294) (not e!621713))))

(assert (=> b!1088200 (= res!725294 (arrayNoDuplicates!0 lt!483852 #b00000000000000000000000000000000 Nil!23545))))

(declare-fun b!1088201 () Bool)

(declare-fun res!725297 () Bool)

(assert (=> b!1088201 (=> (not res!725297) (not e!621711))))

(assert (=> b!1088201 (= res!725297 (= (select (arr!33749 _keys!1070) i!650) k0!904))))

(declare-fun res!725290 () Bool)

(assert (=> start!96180 (=> (not res!725290) (not e!621711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96180 (= res!725290 (validMask!0 mask!1414))))

(assert (=> start!96180 e!621711))

(assert (=> start!96180 tp!79639))

(assert (=> start!96180 true))

(assert (=> start!96180 tp_is_empty!26599))

(declare-fun array_inv!26084 (array!70163) Bool)

(assert (=> start!96180 (array_inv!26084 _keys!1070)))

(declare-fun array_inv!26085 (array!70165) Bool)

(assert (=> start!96180 (and (array_inv!26085 _values!874) e!621707)))

(declare-fun b!1088202 () Bool)

(declare-fun res!725293 () Bool)

(assert (=> b!1088202 (=> (not res!725293) (not e!621711))))

(assert (=> b!1088202 (= res!725293 (and (= (size!34287 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34286 _keys!1070) (size!34287 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088203 () Bool)

(assert (=> b!1088203 (= e!621708 true)))

(assert (=> b!1088203 (= (-!792 lt!483857 k0!904) (+!3303 lt!483855 lt!483866))))

(declare-fun lt!483858 () Unit!35751)

(assert (=> b!1088203 (= lt!483858 (addRemoveCommutativeForDiffKeys!37 lt!483851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41653 () Bool)

(assert (=> mapIsEmpty!41653 mapRes!41653))

(declare-fun b!1088204 () Bool)

(assert (=> b!1088204 (= e!621711 e!621713)))

(declare-fun res!725289 () Bool)

(assert (=> b!1088204 (=> (not res!725289) (not e!621713))))

(assert (=> b!1088204 (= res!725289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483852 mask!1414))))

(assert (=> b!1088204 (= lt!483852 (array!70164 (store (arr!33749 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34286 _keys!1070)))))

(declare-fun b!1088205 () Bool)

(declare-fun res!725291 () Bool)

(assert (=> b!1088205 (=> (not res!725291) (not e!621711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088205 (= res!725291 (validKeyInArray!0 k0!904))))

(assert (= (and start!96180 res!725290) b!1088202))

(assert (= (and b!1088202 res!725293) b!1088198))

(assert (= (and b!1088198 res!725298) b!1088196))

(assert (= (and b!1088196 res!725292) b!1088192))

(assert (= (and b!1088192 res!725296) b!1088205))

(assert (= (and b!1088205 res!725291) b!1088201))

(assert (= (and b!1088201 res!725297) b!1088204))

(assert (= (and b!1088204 res!725289) b!1088200))

(assert (= (and b!1088200 res!725294) b!1088199))

(assert (= (and b!1088199 (not res!725295)) b!1088193))

(assert (= (and b!1088193 (not res!725288)) b!1088203))

(assert (= (and b!1088195 condMapEmpty!41653) mapIsEmpty!41653))

(assert (= (and b!1088195 (not condMapEmpty!41653)) mapNonEmpty!41653))

(get-info :version)

(assert (= (and mapNonEmpty!41653 ((_ is ValueCellFull!12590) mapValue!41653)) b!1088194))

(assert (= (and b!1088195 ((_ is ValueCellFull!12590) mapDefault!41653)) b!1088197))

(assert (= start!96180 b!1088195))

(declare-fun b_lambda!17277 () Bool)

(assert (=> (not b_lambda!17277) (not b!1088199)))

(declare-fun t!33193 () Bool)

(declare-fun tb!7467 () Bool)

(assert (=> (and start!96180 (= defaultEntry!882 defaultEntry!882) t!33193) tb!7467))

(declare-fun result!15461 () Bool)

(assert (=> tb!7467 (= result!15461 tp_is_empty!26599)))

(assert (=> b!1088199 t!33193))

(declare-fun b_and!35881 () Bool)

(assert (= b_and!35879 (and (=> t!33193 result!15461) b_and!35881)))

(declare-fun m!1007231 () Bool)

(assert (=> b!1088203 m!1007231))

(declare-fun m!1007233 () Bool)

(assert (=> b!1088203 m!1007233))

(declare-fun m!1007235 () Bool)

(assert (=> b!1088203 m!1007235))

(declare-fun m!1007237 () Bool)

(assert (=> b!1088205 m!1007237))

(declare-fun m!1007239 () Bool)

(assert (=> mapNonEmpty!41653 m!1007239))

(declare-fun m!1007241 () Bool)

(assert (=> start!96180 m!1007241))

(declare-fun m!1007243 () Bool)

(assert (=> start!96180 m!1007243))

(declare-fun m!1007245 () Bool)

(assert (=> start!96180 m!1007245))

(declare-fun m!1007247 () Bool)

(assert (=> b!1088200 m!1007247))

(declare-fun m!1007249 () Bool)

(assert (=> b!1088196 m!1007249))

(declare-fun m!1007251 () Bool)

(assert (=> b!1088193 m!1007251))

(declare-fun m!1007253 () Bool)

(assert (=> b!1088193 m!1007253))

(declare-fun m!1007255 () Bool)

(assert (=> b!1088193 m!1007255))

(declare-fun m!1007257 () Bool)

(assert (=> b!1088193 m!1007257))

(declare-fun m!1007259 () Bool)

(assert (=> b!1088193 m!1007259))

(declare-fun m!1007261 () Bool)

(assert (=> b!1088193 m!1007261))

(declare-fun m!1007263 () Bool)

(assert (=> b!1088193 m!1007263))

(assert (=> b!1088193 m!1007257))

(declare-fun m!1007265 () Bool)

(assert (=> b!1088193 m!1007265))

(declare-fun m!1007267 () Bool)

(assert (=> b!1088198 m!1007267))

(declare-fun m!1007269 () Bool)

(assert (=> b!1088201 m!1007269))

(declare-fun m!1007271 () Bool)

(assert (=> b!1088199 m!1007271))

(declare-fun m!1007273 () Bool)

(assert (=> b!1088199 m!1007273))

(declare-fun m!1007275 () Bool)

(assert (=> b!1088199 m!1007275))

(declare-fun m!1007277 () Bool)

(assert (=> b!1088199 m!1007277))

(declare-fun m!1007279 () Bool)

(assert (=> b!1088199 m!1007279))

(declare-fun m!1007281 () Bool)

(assert (=> b!1088199 m!1007281))

(declare-fun m!1007283 () Bool)

(assert (=> b!1088199 m!1007283))

(declare-fun m!1007285 () Bool)

(assert (=> b!1088199 m!1007285))

(declare-fun m!1007287 () Bool)

(assert (=> b!1088199 m!1007287))

(declare-fun m!1007289 () Bool)

(assert (=> b!1088199 m!1007289))

(declare-fun m!1007291 () Bool)

(assert (=> b!1088204 m!1007291))

(declare-fun m!1007293 () Bool)

(assert (=> b!1088204 m!1007293))

(check-sat (not b!1088199) (not b!1088203) tp_is_empty!26599 (not b_lambda!17277) (not b!1088200) (not b!1088193) (not b!1088205) (not start!96180) (not b!1088196) (not b!1088198) (not mapNonEmpty!41653) (not b!1088204) (not b_next!22597) b_and!35881)
(check-sat b_and!35881 (not b_next!22597))
