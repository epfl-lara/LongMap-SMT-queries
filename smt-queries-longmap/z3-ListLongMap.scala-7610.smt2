; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96216 () Bool)

(assert start!96216)

(declare-fun b_free!22633 () Bool)

(declare-fun b_next!22633 () Bool)

(assert (=> start!96216 (= b_free!22633 (not b_next!22633))))

(declare-fun tp!79748 () Bool)

(declare-fun b_and!35951 () Bool)

(assert (=> start!96216 (= tp!79748 b_and!35951)))

(declare-fun b!1088993 () Bool)

(declare-fun e!622144 () Bool)

(declare-fun tp_is_empty!26635 () Bool)

(assert (=> b!1088993 (= e!622144 tp_is_empty!26635)))

(declare-fun b!1088994 () Bool)

(declare-fun e!622145 () Bool)

(assert (=> b!1088994 (= e!622145 true)))

(declare-datatypes ((V!40641 0))(
  ( (V!40642 (val!13374 Int)) )
))
(declare-datatypes ((tuple2!16986 0))(
  ( (tuple2!16987 (_1!8504 (_ BitVec 64)) (_2!8504 V!40641)) )
))
(declare-datatypes ((List!23580 0))(
  ( (Nil!23577) (Cons!23576 (h!24794 tuple2!16986) (t!33263 List!23580)) )
))
(declare-datatypes ((ListLongMap!14963 0))(
  ( (ListLongMap!14964 (toList!7497 List!23580)) )
))
(declare-fun lt!484635 () ListLongMap!14963)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484632 () ListLongMap!14963)

(declare-fun -!809 (ListLongMap!14963 (_ BitVec 64)) ListLongMap!14963)

(assert (=> b!1088994 (= (-!809 lt!484635 k0!904) lt!484632)))

(declare-fun lt!484631 () ListLongMap!14963)

(declare-datatypes ((Unit!35785 0))(
  ( (Unit!35786) )
))
(declare-fun lt!484638 () Unit!35785)

(declare-fun zeroValue!831 () V!40641)

(declare-fun addRemoveCommutativeForDiffKeys!51 (ListLongMap!14963 (_ BitVec 64) V!40641 (_ BitVec 64)) Unit!35785)

(assert (=> b!1088994 (= lt!484638 (addRemoveCommutativeForDiffKeys!51 lt!484631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088995 () Bool)

(declare-fun e!622138 () Bool)

(assert (=> b!1088995 (= e!622138 e!622145)))

(declare-fun res!725891 () Bool)

(assert (=> b!1088995 (=> res!725891 e!622145)))

(assert (=> b!1088995 (= res!725891 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484630 () ListLongMap!14963)

(assert (=> b!1088995 (= lt!484630 lt!484632)))

(declare-fun lt!484627 () ListLongMap!14963)

(declare-fun lt!484628 () tuple2!16986)

(declare-fun +!3319 (ListLongMap!14963 tuple2!16986) ListLongMap!14963)

(assert (=> b!1088995 (= lt!484632 (+!3319 lt!484627 lt!484628))))

(declare-fun lt!484633 () ListLongMap!14963)

(assert (=> b!1088995 (= lt!484633 lt!484635)))

(assert (=> b!1088995 (= lt!484635 (+!3319 lt!484631 lt!484628))))

(declare-fun lt!484629 () ListLongMap!14963)

(assert (=> b!1088995 (= lt!484630 (+!3319 lt!484629 lt!484628))))

(assert (=> b!1088995 (= lt!484628 (tuple2!16987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088996 () Bool)

(declare-fun res!725900 () Bool)

(declare-fun e!622141 () Bool)

(assert (=> b!1088996 (=> (not res!725900) (not e!622141))))

(declare-datatypes ((array!70235 0))(
  ( (array!70236 (arr!33785 (Array (_ BitVec 32) (_ BitVec 64))) (size!34322 (_ BitVec 32))) )
))
(declare-fun lt!484634 () array!70235)

(declare-datatypes ((List!23581 0))(
  ( (Nil!23578) (Cons!23577 (h!24795 (_ BitVec 64)) (t!33264 List!23581)) )
))
(declare-fun arrayNoDuplicates!0 (array!70235 (_ BitVec 32) List!23581) Bool)

(assert (=> b!1088996 (= res!725900 (arrayNoDuplicates!0 lt!484634 #b00000000000000000000000000000000 Nil!23578))))

(declare-fun b!1088997 () Bool)

(declare-fun res!725901 () Bool)

(declare-fun e!622143 () Bool)

(assert (=> b!1088997 (=> (not res!725901) (not e!622143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088997 (= res!725901 (validKeyInArray!0 k0!904))))

(declare-fun b!1088999 () Bool)

(declare-fun res!725892 () Bool)

(assert (=> b!1088999 (=> (not res!725892) (not e!622143))))

(declare-fun _keys!1070 () array!70235)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088999 (= res!725892 (= (select (arr!33785 _keys!1070) i!650) k0!904))))

(declare-fun b!1089000 () Bool)

(declare-fun e!622142 () Bool)

(assert (=> b!1089000 (= e!622142 tp_is_empty!26635)))

(declare-fun b!1089001 () Bool)

(declare-fun res!725893 () Bool)

(assert (=> b!1089001 (=> (not res!725893) (not e!622143))))

(assert (=> b!1089001 (= res!725893 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23578))))

(declare-fun mapIsEmpty!41707 () Bool)

(declare-fun mapRes!41707 () Bool)

(assert (=> mapIsEmpty!41707 mapRes!41707))

(declare-fun b!1089002 () Bool)

(declare-fun res!725899 () Bool)

(assert (=> b!1089002 (=> (not res!725899) (not e!622143))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12608 0))(
  ( (ValueCellFull!12608 (v!15991 V!40641)) (EmptyCell!12608) )
))
(declare-datatypes ((array!70237 0))(
  ( (array!70238 (arr!33786 (Array (_ BitVec 32) ValueCell!12608)) (size!34323 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70237)

(assert (=> b!1089002 (= res!725899 (and (= (size!34323 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34322 _keys!1070) (size!34323 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089003 () Bool)

(assert (=> b!1089003 (= e!622141 (not e!622138))))

(declare-fun res!725895 () Bool)

(assert (=> b!1089003 (=> res!725895 e!622138)))

(assert (=> b!1089003 (= res!725895 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40641)

(declare-fun getCurrentListMap!4259 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) Int) ListLongMap!14963)

(assert (=> b!1089003 (= lt!484633 (getCurrentListMap!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484637 () array!70237)

(assert (=> b!1089003 (= lt!484630 (getCurrentListMap!4259 lt!484634 lt!484637 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089003 (and (= lt!484629 lt!484627) (= lt!484627 lt!484629))))

(assert (=> b!1089003 (= lt!484627 (-!809 lt!484631 k0!904))))

(declare-fun lt!484626 () Unit!35785)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35785)

(assert (=> b!1089003 (= lt!484626 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4064 (array!70235 array!70237 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) Int) ListLongMap!14963)

(assert (=> b!1089003 (= lt!484629 (getCurrentListMapNoExtraKeys!4064 lt!484634 lt!484637 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2185 (Int (_ BitVec 64)) V!40641)

(assert (=> b!1089003 (= lt!484637 (array!70238 (store (arr!33786 _values!874) i!650 (ValueCellFull!12608 (dynLambda!2185 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34323 _values!874)))))

(assert (=> b!1089003 (= lt!484631 (getCurrentListMapNoExtraKeys!4064 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089003 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484636 () Unit!35785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70235 (_ BitVec 64) (_ BitVec 32)) Unit!35785)

(assert (=> b!1089003 (= lt!484636 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41707 () Bool)

(declare-fun tp!79747 () Bool)

(assert (=> mapNonEmpty!41707 (= mapRes!41707 (and tp!79747 e!622144))))

(declare-fun mapKey!41707 () (_ BitVec 32))

(declare-fun mapValue!41707 () ValueCell!12608)

(declare-fun mapRest!41707 () (Array (_ BitVec 32) ValueCell!12608))

(assert (=> mapNonEmpty!41707 (= (arr!33786 _values!874) (store mapRest!41707 mapKey!41707 mapValue!41707))))

(declare-fun b!1089004 () Bool)

(assert (=> b!1089004 (= e!622143 e!622141)))

(declare-fun res!725897 () Bool)

(assert (=> b!1089004 (=> (not res!725897) (not e!622141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70235 (_ BitVec 32)) Bool)

(assert (=> b!1089004 (= res!725897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484634 mask!1414))))

(assert (=> b!1089004 (= lt!484634 (array!70236 (store (arr!33785 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34322 _keys!1070)))))

(declare-fun b!1089005 () Bool)

(declare-fun res!725894 () Bool)

(assert (=> b!1089005 (=> (not res!725894) (not e!622143))))

(assert (=> b!1089005 (= res!725894 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34322 _keys!1070))))))

(declare-fun b!1089006 () Bool)

(declare-fun e!622140 () Bool)

(assert (=> b!1089006 (= e!622140 (and e!622142 mapRes!41707))))

(declare-fun condMapEmpty!41707 () Bool)

(declare-fun mapDefault!41707 () ValueCell!12608)

(assert (=> b!1089006 (= condMapEmpty!41707 (= (arr!33786 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12608)) mapDefault!41707)))))

(declare-fun res!725898 () Bool)

(assert (=> start!96216 (=> (not res!725898) (not e!622143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96216 (= res!725898 (validMask!0 mask!1414))))

(assert (=> start!96216 e!622143))

(assert (=> start!96216 tp!79748))

(assert (=> start!96216 true))

(assert (=> start!96216 tp_is_empty!26635))

(declare-fun array_inv!26112 (array!70235) Bool)

(assert (=> start!96216 (array_inv!26112 _keys!1070)))

(declare-fun array_inv!26113 (array!70237) Bool)

(assert (=> start!96216 (and (array_inv!26113 _values!874) e!622140)))

(declare-fun b!1088998 () Bool)

(declare-fun res!725896 () Bool)

(assert (=> b!1088998 (=> (not res!725896) (not e!622143))))

(assert (=> b!1088998 (= res!725896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96216 res!725898) b!1089002))

(assert (= (and b!1089002 res!725899) b!1088998))

(assert (= (and b!1088998 res!725896) b!1089001))

(assert (= (and b!1089001 res!725893) b!1089005))

(assert (= (and b!1089005 res!725894) b!1088997))

(assert (= (and b!1088997 res!725901) b!1088999))

(assert (= (and b!1088999 res!725892) b!1089004))

(assert (= (and b!1089004 res!725897) b!1088996))

(assert (= (and b!1088996 res!725900) b!1089003))

(assert (= (and b!1089003 (not res!725895)) b!1088995))

(assert (= (and b!1088995 (not res!725891)) b!1088994))

(assert (= (and b!1089006 condMapEmpty!41707) mapIsEmpty!41707))

(assert (= (and b!1089006 (not condMapEmpty!41707)) mapNonEmpty!41707))

(get-info :version)

(assert (= (and mapNonEmpty!41707 ((_ is ValueCellFull!12608) mapValue!41707)) b!1088993))

(assert (= (and b!1089006 ((_ is ValueCellFull!12608) mapDefault!41707)) b!1089000))

(assert (= start!96216 b!1089006))

(declare-fun b_lambda!17313 () Bool)

(assert (=> (not b_lambda!17313) (not b!1089003)))

(declare-fun t!33262 () Bool)

(declare-fun tb!7503 () Bool)

(assert (=> (and start!96216 (= defaultEntry!882 defaultEntry!882) t!33262) tb!7503))

(declare-fun result!15533 () Bool)

(assert (=> tb!7503 (= result!15533 tp_is_empty!26635)))

(assert (=> b!1089003 t!33262))

(declare-fun b_and!35953 () Bool)

(assert (= b_and!35951 (and (=> t!33262 result!15533) b_and!35953)))

(declare-fun m!1008263 () Bool)

(assert (=> b!1089004 m!1008263))

(declare-fun m!1008265 () Bool)

(assert (=> b!1089004 m!1008265))

(declare-fun m!1008267 () Bool)

(assert (=> b!1088999 m!1008267))

(declare-fun m!1008269 () Bool)

(assert (=> b!1088996 m!1008269))

(declare-fun m!1008271 () Bool)

(assert (=> b!1088998 m!1008271))

(declare-fun m!1008273 () Bool)

(assert (=> start!96216 m!1008273))

(declare-fun m!1008275 () Bool)

(assert (=> start!96216 m!1008275))

(declare-fun m!1008277 () Bool)

(assert (=> start!96216 m!1008277))

(declare-fun m!1008279 () Bool)

(assert (=> b!1088994 m!1008279))

(declare-fun m!1008281 () Bool)

(assert (=> b!1088994 m!1008281))

(declare-fun m!1008283 () Bool)

(assert (=> b!1088997 m!1008283))

(declare-fun m!1008285 () Bool)

(assert (=> mapNonEmpty!41707 m!1008285))

(declare-fun m!1008287 () Bool)

(assert (=> b!1089001 m!1008287))

(declare-fun m!1008289 () Bool)

(assert (=> b!1089003 m!1008289))

(declare-fun m!1008291 () Bool)

(assert (=> b!1089003 m!1008291))

(declare-fun m!1008293 () Bool)

(assert (=> b!1089003 m!1008293))

(declare-fun m!1008295 () Bool)

(assert (=> b!1089003 m!1008295))

(declare-fun m!1008297 () Bool)

(assert (=> b!1089003 m!1008297))

(declare-fun m!1008299 () Bool)

(assert (=> b!1089003 m!1008299))

(declare-fun m!1008301 () Bool)

(assert (=> b!1089003 m!1008301))

(declare-fun m!1008303 () Bool)

(assert (=> b!1089003 m!1008303))

(declare-fun m!1008305 () Bool)

(assert (=> b!1089003 m!1008305))

(declare-fun m!1008307 () Bool)

(assert (=> b!1089003 m!1008307))

(declare-fun m!1008309 () Bool)

(assert (=> b!1088995 m!1008309))

(declare-fun m!1008311 () Bool)

(assert (=> b!1088995 m!1008311))

(declare-fun m!1008313 () Bool)

(assert (=> b!1088995 m!1008313))

(check-sat (not b!1089004) tp_is_empty!26635 (not b!1089001) (not start!96216) (not b!1088997) (not b!1088998) (not b!1088994) (not b_lambda!17313) (not b!1089003) (not mapNonEmpty!41707) (not b!1088996) (not b_next!22633) b_and!35953 (not b!1088995))
(check-sat b_and!35953 (not b_next!22633))
