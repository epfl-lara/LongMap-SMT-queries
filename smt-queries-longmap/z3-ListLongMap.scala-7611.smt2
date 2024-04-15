; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95980 () Bool)

(assert start!95980)

(declare-fun b_free!22639 () Bool)

(declare-fun b_next!22639 () Bool)

(assert (=> start!95980 (= b_free!22639 (not b_next!22639))))

(declare-fun tp!79765 () Bool)

(declare-fun b_and!35927 () Bool)

(assert (=> start!95980 (= tp!79765 b_and!35927)))

(declare-fun b!1087645 () Bool)

(declare-fun e!621262 () Bool)

(declare-fun tp_is_empty!26641 () Bool)

(assert (=> b!1087645 (= e!621262 tp_is_empty!26641)))

(declare-fun b!1087646 () Bool)

(declare-fun res!725408 () Bool)

(declare-fun e!621269 () Bool)

(assert (=> b!1087646 (=> (not res!725408) (not e!621269))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70132 0))(
  ( (array!70133 (arr!33740 (Array (_ BitVec 32) (_ BitVec 64))) (size!34278 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70132)

(declare-datatypes ((V!40649 0))(
  ( (V!40650 (val!13377 Int)) )
))
(declare-datatypes ((ValueCell!12611 0))(
  ( (ValueCellFull!12611 (v!15997 V!40649)) (EmptyCell!12611) )
))
(declare-datatypes ((array!70134 0))(
  ( (array!70135 (arr!33741 (Array (_ BitVec 32) ValueCell!12611)) (size!34279 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70134)

(assert (=> b!1087646 (= res!725408 (and (= (size!34279 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34278 _keys!1070) (size!34279 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087648 () Bool)

(declare-fun res!725399 () Bool)

(assert (=> b!1087648 (=> (not res!725399) (not e!621269))))

(declare-datatypes ((List!23603 0))(
  ( (Nil!23600) (Cons!23599 (h!24808 (_ BitVec 64)) (t!33291 List!23603)) )
))
(declare-fun arrayNoDuplicates!0 (array!70132 (_ BitVec 32) List!23603) Bool)

(assert (=> b!1087648 (= res!725399 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23600))))

(declare-fun b!1087649 () Bool)

(declare-fun e!621265 () Bool)

(declare-fun mapRes!41716 () Bool)

(assert (=> b!1087649 (= e!621265 (and e!621262 mapRes!41716))))

(declare-fun condMapEmpty!41716 () Bool)

(declare-fun mapDefault!41716 () ValueCell!12611)

(assert (=> b!1087649 (= condMapEmpty!41716 (= (arr!33741 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12611)) mapDefault!41716)))))

(declare-fun b!1087650 () Bool)

(declare-fun res!725401 () Bool)

(assert (=> b!1087650 (=> (not res!725401) (not e!621269))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087650 (= res!725401 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34278 _keys!1070))))))

(declare-fun b!1087651 () Bool)

(declare-fun e!621268 () Bool)

(assert (=> b!1087651 (= e!621268 tp_is_empty!26641)))

(declare-fun b!1087652 () Bool)

(declare-fun e!621264 () Bool)

(declare-fun e!621266 () Bool)

(assert (=> b!1087652 (= e!621264 (not e!621266))))

(declare-fun res!725405 () Bool)

(assert (=> b!1087652 (=> res!725405 e!621266)))

(assert (=> b!1087652 (= res!725405 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!40649)

(declare-datatypes ((tuple2!17036 0))(
  ( (tuple2!17037 (_1!8529 (_ BitVec 64)) (_2!8529 V!40649)) )
))
(declare-datatypes ((List!23604 0))(
  ( (Nil!23601) (Cons!23600 (h!24809 tuple2!17036) (t!33292 List!23604)) )
))
(declare-datatypes ((ListLongMap!15005 0))(
  ( (ListLongMap!15006 (toList!7518 List!23604)) )
))
(declare-fun lt!484028 () ListLongMap!15005)

(declare-fun zeroValue!831 () V!40649)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4200 (array!70132 array!70134 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!15005)

(assert (=> b!1087652 (= lt!484028 (getCurrentListMap!4200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484029 () array!70132)

(declare-fun lt!484033 () ListLongMap!15005)

(declare-fun lt!484038 () array!70134)

(assert (=> b!1087652 (= lt!484033 (getCurrentListMap!4200 lt!484029 lt!484038 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484036 () ListLongMap!15005)

(declare-fun lt!484039 () ListLongMap!15005)

(assert (=> b!1087652 (and (= lt!484036 lt!484039) (= lt!484039 lt!484036))))

(declare-fun lt!484030 () ListLongMap!15005)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!796 (ListLongMap!15005 (_ BitVec 64)) ListLongMap!15005)

(assert (=> b!1087652 (= lt!484039 (-!796 lt!484030 k0!904))))

(declare-datatypes ((Unit!35627 0))(
  ( (Unit!35628) )
))
(declare-fun lt!484037 () Unit!35627)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 (array!70132 array!70134 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35627)

(assert (=> b!1087652 (= lt!484037 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4070 (array!70132 array!70134 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!15005)

(assert (=> b!1087652 (= lt!484036 (getCurrentListMapNoExtraKeys!4070 lt!484029 lt!484038 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2141 (Int (_ BitVec 64)) V!40649)

(assert (=> b!1087652 (= lt!484038 (array!70135 (store (arr!33741 _values!874) i!650 (ValueCellFull!12611 (dynLambda!2141 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34279 _values!874)))))

(assert (=> b!1087652 (= lt!484030 (getCurrentListMapNoExtraKeys!4070 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087652 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484032 () Unit!35627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70132 (_ BitVec 64) (_ BitVec 32)) Unit!35627)

(assert (=> b!1087652 (= lt!484032 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087653 () Bool)

(assert (=> b!1087653 (= e!621269 e!621264)))

(declare-fun res!725407 () Bool)

(assert (=> b!1087653 (=> (not res!725407) (not e!621264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70132 (_ BitVec 32)) Bool)

(assert (=> b!1087653 (= res!725407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484029 mask!1414))))

(assert (=> b!1087653 (= lt!484029 (array!70133 (store (arr!33740 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34278 _keys!1070)))))

(declare-fun b!1087654 () Bool)

(declare-fun e!621267 () Bool)

(assert (=> b!1087654 (= e!621267 true)))

(declare-fun lt!484035 () ListLongMap!15005)

(declare-fun lt!484031 () ListLongMap!15005)

(assert (=> b!1087654 (= (-!796 lt!484035 k0!904) lt!484031)))

(declare-fun lt!484040 () Unit!35627)

(declare-fun addRemoveCommutativeForDiffKeys!49 (ListLongMap!15005 (_ BitVec 64) V!40649 (_ BitVec 64)) Unit!35627)

(assert (=> b!1087654 (= lt!484040 (addRemoveCommutativeForDiffKeys!49 lt!484030 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087655 () Bool)

(declare-fun res!725400 () Bool)

(assert (=> b!1087655 (=> (not res!725400) (not e!621269))))

(assert (=> b!1087655 (= res!725400 (= (select (arr!33740 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41716 () Bool)

(declare-fun tp!79766 () Bool)

(assert (=> mapNonEmpty!41716 (= mapRes!41716 (and tp!79766 e!621268))))

(declare-fun mapRest!41716 () (Array (_ BitVec 32) ValueCell!12611))

(declare-fun mapValue!41716 () ValueCell!12611)

(declare-fun mapKey!41716 () (_ BitVec 32))

(assert (=> mapNonEmpty!41716 (= (arr!33741 _values!874) (store mapRest!41716 mapKey!41716 mapValue!41716))))

(declare-fun b!1087656 () Bool)

(declare-fun res!725409 () Bool)

(assert (=> b!1087656 (=> (not res!725409) (not e!621269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087656 (= res!725409 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41716 () Bool)

(assert (=> mapIsEmpty!41716 mapRes!41716))

(declare-fun b!1087647 () Bool)

(declare-fun res!725402 () Bool)

(assert (=> b!1087647 (=> (not res!725402) (not e!621264))))

(assert (=> b!1087647 (= res!725402 (arrayNoDuplicates!0 lt!484029 #b00000000000000000000000000000000 Nil!23600))))

(declare-fun res!725406 () Bool)

(assert (=> start!95980 (=> (not res!725406) (not e!621269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95980 (= res!725406 (validMask!0 mask!1414))))

(assert (=> start!95980 e!621269))

(assert (=> start!95980 tp!79765))

(assert (=> start!95980 true))

(assert (=> start!95980 tp_is_empty!26641))

(declare-fun array_inv!26072 (array!70132) Bool)

(assert (=> start!95980 (array_inv!26072 _keys!1070)))

(declare-fun array_inv!26073 (array!70134) Bool)

(assert (=> start!95980 (and (array_inv!26073 _values!874) e!621265)))

(declare-fun b!1087657 () Bool)

(assert (=> b!1087657 (= e!621266 e!621267)))

(declare-fun res!725403 () Bool)

(assert (=> b!1087657 (=> res!725403 e!621267)))

(assert (=> b!1087657 (= res!725403 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1087657 (= lt!484033 lt!484031)))

(declare-fun lt!484034 () tuple2!17036)

(declare-fun +!3323 (ListLongMap!15005 tuple2!17036) ListLongMap!15005)

(assert (=> b!1087657 (= lt!484031 (+!3323 lt!484039 lt!484034))))

(assert (=> b!1087657 (= lt!484028 lt!484035)))

(assert (=> b!1087657 (= lt!484035 (+!3323 lt!484030 lt!484034))))

(assert (=> b!1087657 (= lt!484033 (+!3323 lt!484036 lt!484034))))

(assert (=> b!1087657 (= lt!484034 (tuple2!17037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087658 () Bool)

(declare-fun res!725404 () Bool)

(assert (=> b!1087658 (=> (not res!725404) (not e!621269))))

(assert (=> b!1087658 (= res!725404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95980 res!725406) b!1087646))

(assert (= (and b!1087646 res!725408) b!1087658))

(assert (= (and b!1087658 res!725404) b!1087648))

(assert (= (and b!1087648 res!725399) b!1087650))

(assert (= (and b!1087650 res!725401) b!1087656))

(assert (= (and b!1087656 res!725409) b!1087655))

(assert (= (and b!1087655 res!725400) b!1087653))

(assert (= (and b!1087653 res!725407) b!1087647))

(assert (= (and b!1087647 res!725402) b!1087652))

(assert (= (and b!1087652 (not res!725405)) b!1087657))

(assert (= (and b!1087657 (not res!725403)) b!1087654))

(assert (= (and b!1087649 condMapEmpty!41716) mapIsEmpty!41716))

(assert (= (and b!1087649 (not condMapEmpty!41716)) mapNonEmpty!41716))

(get-info :version)

(assert (= (and mapNonEmpty!41716 ((_ is ValueCellFull!12611) mapValue!41716)) b!1087651))

(assert (= (and b!1087649 ((_ is ValueCellFull!12611) mapDefault!41716)) b!1087645))

(assert (= start!95980 b!1087649))

(declare-fun b_lambda!17287 () Bool)

(assert (=> (not b_lambda!17287) (not b!1087652)))

(declare-fun t!33290 () Bool)

(declare-fun tb!7509 () Bool)

(assert (=> (and start!95980 (= defaultEntry!882 defaultEntry!882) t!33290) tb!7509))

(declare-fun result!15545 () Bool)

(assert (=> tb!7509 (= result!15545 tp_is_empty!26641)))

(assert (=> b!1087652 t!33290))

(declare-fun b_and!35929 () Bool)

(assert (= b_and!35927 (and (=> t!33290 result!15545) b_and!35929)))

(declare-fun m!1006121 () Bool)

(assert (=> b!1087647 m!1006121))

(declare-fun m!1006123 () Bool)

(assert (=> mapNonEmpty!41716 m!1006123))

(declare-fun m!1006125 () Bool)

(assert (=> start!95980 m!1006125))

(declare-fun m!1006127 () Bool)

(assert (=> start!95980 m!1006127))

(declare-fun m!1006129 () Bool)

(assert (=> start!95980 m!1006129))

(declare-fun m!1006131 () Bool)

(assert (=> b!1087653 m!1006131))

(declare-fun m!1006133 () Bool)

(assert (=> b!1087653 m!1006133))

(declare-fun m!1006135 () Bool)

(assert (=> b!1087655 m!1006135))

(declare-fun m!1006137 () Bool)

(assert (=> b!1087652 m!1006137))

(declare-fun m!1006139 () Bool)

(assert (=> b!1087652 m!1006139))

(declare-fun m!1006141 () Bool)

(assert (=> b!1087652 m!1006141))

(declare-fun m!1006143 () Bool)

(assert (=> b!1087652 m!1006143))

(declare-fun m!1006145 () Bool)

(assert (=> b!1087652 m!1006145))

(declare-fun m!1006147 () Bool)

(assert (=> b!1087652 m!1006147))

(declare-fun m!1006149 () Bool)

(assert (=> b!1087652 m!1006149))

(declare-fun m!1006151 () Bool)

(assert (=> b!1087652 m!1006151))

(declare-fun m!1006153 () Bool)

(assert (=> b!1087652 m!1006153))

(declare-fun m!1006155 () Bool)

(assert (=> b!1087652 m!1006155))

(declare-fun m!1006157 () Bool)

(assert (=> b!1087657 m!1006157))

(declare-fun m!1006159 () Bool)

(assert (=> b!1087657 m!1006159))

(declare-fun m!1006161 () Bool)

(assert (=> b!1087657 m!1006161))

(declare-fun m!1006163 () Bool)

(assert (=> b!1087654 m!1006163))

(declare-fun m!1006165 () Bool)

(assert (=> b!1087654 m!1006165))

(declare-fun m!1006167 () Bool)

(assert (=> b!1087648 m!1006167))

(declare-fun m!1006169 () Bool)

(assert (=> b!1087656 m!1006169))

(declare-fun m!1006171 () Bool)

(assert (=> b!1087658 m!1006171))

(check-sat (not b_lambda!17287) (not b!1087647) (not mapNonEmpty!41716) b_and!35929 (not b!1087654) (not b!1087652) (not b!1087653) (not b!1087648) (not b!1087657) (not b!1087656) (not start!95980) tp_is_empty!26641 (not b_next!22639) (not b!1087658))
(check-sat b_and!35929 (not b_next!22639))
