; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96210 () Bool)

(assert start!96210)

(declare-fun b_free!22627 () Bool)

(declare-fun b_next!22627 () Bool)

(assert (=> start!96210 (= b_free!22627 (not b_next!22627))))

(declare-fun tp!79729 () Bool)

(declare-fun b_and!35939 () Bool)

(assert (=> start!96210 (= tp!79729 b_and!35939)))

(declare-fun b!1088861 () Bool)

(declare-fun res!725792 () Bool)

(declare-fun e!622069 () Bool)

(assert (=> b!1088861 (=> (not res!725792) (not e!622069))))

(declare-datatypes ((array!70223 0))(
  ( (array!70224 (arr!33779 (Array (_ BitVec 32) (_ BitVec 64))) (size!34316 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70223)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70223 (_ BitVec 32)) Bool)

(assert (=> b!1088861 (= res!725792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41698 () Bool)

(declare-fun mapRes!41698 () Bool)

(declare-fun tp!79730 () Bool)

(declare-fun e!622067 () Bool)

(assert (=> mapNonEmpty!41698 (= mapRes!41698 (and tp!79730 e!622067))))

(declare-datatypes ((V!40633 0))(
  ( (V!40634 (val!13371 Int)) )
))
(declare-datatypes ((ValueCell!12605 0))(
  ( (ValueCellFull!12605 (v!15988 V!40633)) (EmptyCell!12605) )
))
(declare-datatypes ((array!70225 0))(
  ( (array!70226 (arr!33780 (Array (_ BitVec 32) ValueCell!12605)) (size!34317 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70225)

(declare-fun mapValue!41698 () ValueCell!12605)

(declare-fun mapRest!41698 () (Array (_ BitVec 32) ValueCell!12605))

(declare-fun mapKey!41698 () (_ BitVec 32))

(assert (=> mapNonEmpty!41698 (= (arr!33780 _values!874) (store mapRest!41698 mapKey!41698 mapValue!41698))))

(declare-fun b!1088862 () Bool)

(declare-fun res!725800 () Bool)

(declare-fun e!622071 () Bool)

(assert (=> b!1088862 (=> (not res!725800) (not e!622071))))

(declare-fun lt!484517 () array!70223)

(declare-datatypes ((List!23575 0))(
  ( (Nil!23572) (Cons!23571 (h!24789 (_ BitVec 64)) (t!33252 List!23575)) )
))
(declare-fun arrayNoDuplicates!0 (array!70223 (_ BitVec 32) List!23575) Bool)

(assert (=> b!1088862 (= res!725800 (arrayNoDuplicates!0 lt!484517 #b00000000000000000000000000000000 Nil!23572))))

(declare-fun b!1088863 () Bool)

(declare-fun res!725795 () Bool)

(assert (=> b!1088863 (=> (not res!725795) (not e!622069))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088863 (= res!725795 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34316 _keys!1070))))))

(declare-fun res!725797 () Bool)

(assert (=> start!96210 (=> (not res!725797) (not e!622069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96210 (= res!725797 (validMask!0 mask!1414))))

(assert (=> start!96210 e!622069))

(assert (=> start!96210 tp!79729))

(assert (=> start!96210 true))

(declare-fun tp_is_empty!26629 () Bool)

(assert (=> start!96210 tp_is_empty!26629))

(declare-fun array_inv!26108 (array!70223) Bool)

(assert (=> start!96210 (array_inv!26108 _keys!1070)))

(declare-fun e!622070 () Bool)

(declare-fun array_inv!26109 (array!70225) Bool)

(assert (=> start!96210 (and (array_inv!26109 _values!874) e!622070)))

(declare-fun b!1088864 () Bool)

(declare-fun e!622072 () Bool)

(declare-fun e!622066 () Bool)

(assert (=> b!1088864 (= e!622072 e!622066)))

(declare-fun res!725801 () Bool)

(assert (=> b!1088864 (=> res!725801 e!622066)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088864 (= res!725801 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16982 0))(
  ( (tuple2!16983 (_1!8502 (_ BitVec 64)) (_2!8502 V!40633)) )
))
(declare-datatypes ((List!23576 0))(
  ( (Nil!23573) (Cons!23572 (h!24790 tuple2!16982) (t!33253 List!23576)) )
))
(declare-datatypes ((ListLongMap!14959 0))(
  ( (ListLongMap!14960 (toList!7495 List!23576)) )
))
(declare-fun lt!484512 () ListLongMap!14959)

(declare-fun lt!484521 () ListLongMap!14959)

(assert (=> b!1088864 (= lt!484512 lt!484521)))

(declare-fun lt!484513 () ListLongMap!14959)

(declare-fun lt!484514 () tuple2!16982)

(declare-fun +!3318 (ListLongMap!14959 tuple2!16982) ListLongMap!14959)

(assert (=> b!1088864 (= lt!484521 (+!3318 lt!484513 lt!484514))))

(declare-fun lt!484518 () ListLongMap!14959)

(declare-fun lt!484511 () ListLongMap!14959)

(assert (=> b!1088864 (= lt!484518 lt!484511)))

(declare-fun lt!484520 () ListLongMap!14959)

(assert (=> b!1088864 (= lt!484511 (+!3318 lt!484520 lt!484514))))

(declare-fun lt!484509 () ListLongMap!14959)

(assert (=> b!1088864 (= lt!484512 (+!3318 lt!484509 lt!484514))))

(declare-fun zeroValue!831 () V!40633)

(assert (=> b!1088864 (= lt!484514 (tuple2!16983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088865 () Bool)

(assert (=> b!1088865 (= e!622069 e!622071)))

(declare-fun res!725802 () Bool)

(assert (=> b!1088865 (=> (not res!725802) (not e!622071))))

(assert (=> b!1088865 (= res!725802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484517 mask!1414))))

(assert (=> b!1088865 (= lt!484517 (array!70224 (store (arr!33779 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34316 _keys!1070)))))

(declare-fun b!1088866 () Bool)

(declare-fun e!622068 () Bool)

(assert (=> b!1088866 (= e!622070 (and e!622068 mapRes!41698))))

(declare-fun condMapEmpty!41698 () Bool)

(declare-fun mapDefault!41698 () ValueCell!12605)

(assert (=> b!1088866 (= condMapEmpty!41698 (= (arr!33780 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12605)) mapDefault!41698)))))

(declare-fun b!1088867 () Bool)

(declare-fun res!725793 () Bool)

(assert (=> b!1088867 (=> (not res!725793) (not e!622069))))

(assert (=> b!1088867 (= res!725793 (= (select (arr!33779 _keys!1070) i!650) k0!904))))

(declare-fun b!1088868 () Bool)

(assert (=> b!1088868 (= e!622071 (not e!622072))))

(declare-fun res!725798 () Bool)

(assert (=> b!1088868 (=> res!725798 e!622072)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088868 (= res!725798 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40633)

(declare-fun getCurrentListMap!4258 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1088868 (= lt!484518 (getCurrentListMap!4258 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484510 () array!70225)

(assert (=> b!1088868 (= lt!484512 (getCurrentListMap!4258 lt!484517 lt!484510 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088868 (and (= lt!484509 lt!484513) (= lt!484513 lt!484509))))

(declare-fun -!807 (ListLongMap!14959 (_ BitVec 64)) ListLongMap!14959)

(assert (=> b!1088868 (= lt!484513 (-!807 lt!484520 k0!904))))

(declare-datatypes ((Unit!35781 0))(
  ( (Unit!35782) )
))
(declare-fun lt!484516 () Unit!35781)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!87 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35781)

(assert (=> b!1088868 (= lt!484516 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!87 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4063 (array!70223 array!70225 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1088868 (= lt!484509 (getCurrentListMapNoExtraKeys!4063 lt!484517 lt!484510 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2184 (Int (_ BitVec 64)) V!40633)

(assert (=> b!1088868 (= lt!484510 (array!70226 (store (arr!33780 _values!874) i!650 (ValueCellFull!12605 (dynLambda!2184 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34317 _values!874)))))

(assert (=> b!1088868 (= lt!484520 (getCurrentListMapNoExtraKeys!4063 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088868 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484515 () Unit!35781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70223 (_ BitVec 64) (_ BitVec 32)) Unit!35781)

(assert (=> b!1088868 (= lt!484515 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088869 () Bool)

(declare-fun res!725799 () Bool)

(assert (=> b!1088869 (=> (not res!725799) (not e!622069))))

(assert (=> b!1088869 (= res!725799 (and (= (size!34317 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34316 _keys!1070) (size!34317 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088870 () Bool)

(assert (=> b!1088870 (= e!622068 tp_is_empty!26629)))

(declare-fun b!1088871 () Bool)

(assert (=> b!1088871 (= e!622067 tp_is_empty!26629)))

(declare-fun mapIsEmpty!41698 () Bool)

(assert (=> mapIsEmpty!41698 mapRes!41698))

(declare-fun b!1088872 () Bool)

(declare-fun res!725794 () Bool)

(assert (=> b!1088872 (=> (not res!725794) (not e!622069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088872 (= res!725794 (validKeyInArray!0 k0!904))))

(declare-fun b!1088873 () Bool)

(declare-fun res!725796 () Bool)

(assert (=> b!1088873 (=> (not res!725796) (not e!622069))))

(assert (=> b!1088873 (= res!725796 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23572))))

(declare-fun b!1088874 () Bool)

(assert (=> b!1088874 (= e!622066 true)))

(assert (=> b!1088874 (= (-!807 lt!484511 k0!904) lt!484521)))

(declare-fun lt!484519 () Unit!35781)

(declare-fun addRemoveCommutativeForDiffKeys!49 (ListLongMap!14959 (_ BitVec 64) V!40633 (_ BitVec 64)) Unit!35781)

(assert (=> b!1088874 (= lt!484519 (addRemoveCommutativeForDiffKeys!49 lt!484520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (= (and start!96210 res!725797) b!1088869))

(assert (= (and b!1088869 res!725799) b!1088861))

(assert (= (and b!1088861 res!725792) b!1088873))

(assert (= (and b!1088873 res!725796) b!1088863))

(assert (= (and b!1088863 res!725795) b!1088872))

(assert (= (and b!1088872 res!725794) b!1088867))

(assert (= (and b!1088867 res!725793) b!1088865))

(assert (= (and b!1088865 res!725802) b!1088862))

(assert (= (and b!1088862 res!725800) b!1088868))

(assert (= (and b!1088868 (not res!725798)) b!1088864))

(assert (= (and b!1088864 (not res!725801)) b!1088874))

(assert (= (and b!1088866 condMapEmpty!41698) mapIsEmpty!41698))

(assert (= (and b!1088866 (not condMapEmpty!41698)) mapNonEmpty!41698))

(get-info :version)

(assert (= (and mapNonEmpty!41698 ((_ is ValueCellFull!12605) mapValue!41698)) b!1088871))

(assert (= (and b!1088866 ((_ is ValueCellFull!12605) mapDefault!41698)) b!1088870))

(assert (= start!96210 b!1088866))

(declare-fun b_lambda!17307 () Bool)

(assert (=> (not b_lambda!17307) (not b!1088868)))

(declare-fun t!33251 () Bool)

(declare-fun tb!7497 () Bool)

(assert (=> (and start!96210 (= defaultEntry!882 defaultEntry!882) t!33251) tb!7497))

(declare-fun result!15521 () Bool)

(assert (=> tb!7497 (= result!15521 tp_is_empty!26629)))

(assert (=> b!1088868 t!33251))

(declare-fun b_and!35941 () Bool)

(assert (= b_and!35939 (and (=> t!33251 result!15521) b_and!35941)))

(declare-fun m!1008107 () Bool)

(assert (=> b!1088872 m!1008107))

(declare-fun m!1008109 () Bool)

(assert (=> b!1088874 m!1008109))

(declare-fun m!1008111 () Bool)

(assert (=> b!1088874 m!1008111))

(declare-fun m!1008113 () Bool)

(assert (=> b!1088864 m!1008113))

(declare-fun m!1008115 () Bool)

(assert (=> b!1088864 m!1008115))

(declare-fun m!1008117 () Bool)

(assert (=> b!1088864 m!1008117))

(declare-fun m!1008119 () Bool)

(assert (=> b!1088868 m!1008119))

(declare-fun m!1008121 () Bool)

(assert (=> b!1088868 m!1008121))

(declare-fun m!1008123 () Bool)

(assert (=> b!1088868 m!1008123))

(declare-fun m!1008125 () Bool)

(assert (=> b!1088868 m!1008125))

(declare-fun m!1008127 () Bool)

(assert (=> b!1088868 m!1008127))

(declare-fun m!1008129 () Bool)

(assert (=> b!1088868 m!1008129))

(declare-fun m!1008131 () Bool)

(assert (=> b!1088868 m!1008131))

(declare-fun m!1008133 () Bool)

(assert (=> b!1088868 m!1008133))

(declare-fun m!1008135 () Bool)

(assert (=> b!1088868 m!1008135))

(declare-fun m!1008137 () Bool)

(assert (=> b!1088868 m!1008137))

(declare-fun m!1008139 () Bool)

(assert (=> b!1088873 m!1008139))

(declare-fun m!1008141 () Bool)

(assert (=> b!1088862 m!1008141))

(declare-fun m!1008143 () Bool)

(assert (=> start!96210 m!1008143))

(declare-fun m!1008145 () Bool)

(assert (=> start!96210 m!1008145))

(declare-fun m!1008147 () Bool)

(assert (=> start!96210 m!1008147))

(declare-fun m!1008149 () Bool)

(assert (=> b!1088865 m!1008149))

(declare-fun m!1008151 () Bool)

(assert (=> b!1088865 m!1008151))

(declare-fun m!1008153 () Bool)

(assert (=> b!1088867 m!1008153))

(declare-fun m!1008155 () Bool)

(assert (=> b!1088861 m!1008155))

(declare-fun m!1008157 () Bool)

(assert (=> mapNonEmpty!41698 m!1008157))

(check-sat tp_is_empty!26629 (not b!1088868) (not start!96210) (not b!1088864) (not b!1088874) (not b_next!22627) (not b!1088865) (not b_lambda!17307) (not b!1088861) (not mapNonEmpty!41698) (not b!1088862) (not b!1088873) b_and!35941 (not b!1088872))
(check-sat b_and!35941 (not b_next!22627))
