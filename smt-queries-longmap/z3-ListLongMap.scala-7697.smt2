; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96628 () Bool)

(assert start!96628)

(declare-fun b_free!23107 () Bool)

(declare-fun b_next!23107 () Bool)

(assert (=> start!96628 (= b_free!23107 (not b_next!23107))))

(declare-fun tp!81260 () Bool)

(declare-fun b_and!36907 () Bool)

(assert (=> start!96628 (= tp!81260 b_and!36907)))

(declare-fun b!1098893 () Bool)

(declare-fun res!733389 () Bool)

(declare-fun e!627197 () Bool)

(assert (=> b!1098893 (=> (not res!733389) (not e!627197))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71134 0))(
  ( (array!71135 (arr!34235 (Array (_ BitVec 32) (_ BitVec 64))) (size!34773 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71134)

(declare-datatypes ((V!41337 0))(
  ( (V!41338 (val!13635 Int)) )
))
(declare-datatypes ((ValueCell!12869 0))(
  ( (ValueCellFull!12869 (v!16259 V!41337)) (EmptyCell!12869) )
))
(declare-datatypes ((array!71136 0))(
  ( (array!71137 (arr!34236 (Array (_ BitVec 32) ValueCell!12869)) (size!34774 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71136)

(assert (=> b!1098893 (= res!733389 (and (= (size!34774 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34773 _keys!1070) (size!34774 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098894 () Bool)

(declare-fun res!733385 () Bool)

(assert (=> b!1098894 (=> (not res!733385) (not e!627197))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098894 (= res!733385 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42508 () Bool)

(declare-fun mapRes!42508 () Bool)

(declare-fun tp!81259 () Bool)

(declare-fun e!627194 () Bool)

(assert (=> mapNonEmpty!42508 (= mapRes!42508 (and tp!81259 e!627194))))

(declare-fun mapRest!42508 () (Array (_ BitVec 32) ValueCell!12869))

(declare-fun mapValue!42508 () ValueCell!12869)

(declare-fun mapKey!42508 () (_ BitVec 32))

(assert (=> mapNonEmpty!42508 (= (arr!34236 _values!874) (store mapRest!42508 mapKey!42508 mapValue!42508))))

(declare-fun b!1098895 () Bool)

(declare-fun res!733388 () Bool)

(assert (=> b!1098895 (=> (not res!733388) (not e!627197))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098895 (= res!733388 (= (select (arr!34235 _keys!1070) i!650) k0!904))))

(declare-fun b!1098896 () Bool)

(declare-fun res!733390 () Bool)

(assert (=> b!1098896 (=> (not res!733390) (not e!627197))))

(declare-datatypes ((List!23981 0))(
  ( (Nil!23978) (Cons!23977 (h!25186 (_ BitVec 64)) (t!34125 List!23981)) )
))
(declare-fun arrayNoDuplicates!0 (array!71134 (_ BitVec 32) List!23981) Bool)

(assert (=> b!1098896 (= res!733390 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun b!1098897 () Bool)

(declare-fun res!733387 () Bool)

(assert (=> b!1098897 (=> (not res!733387) (not e!627197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71134 (_ BitVec 32)) Bool)

(assert (=> b!1098897 (= res!733387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-datatypes ((tuple2!17390 0))(
  ( (tuple2!17391 (_1!8706 (_ BitVec 64)) (_2!8706 V!41337)) )
))
(declare-datatypes ((List!23982 0))(
  ( (Nil!23979) (Cons!23978 (h!25187 tuple2!17390) (t!34126 List!23982)) )
))
(declare-datatypes ((ListLongMap!15359 0))(
  ( (ListLongMap!15360 (toList!7695 List!23982)) )
))
(declare-fun lt!491774 () ListLongMap!15359)

(declare-fun b!1098898 () Bool)

(declare-fun e!627195 () Bool)

(declare-fun lt!491787 () ListLongMap!15359)

(declare-fun -!930 (ListLongMap!15359 (_ BitVec 64)) ListLongMap!15359)

(assert (=> b!1098898 (= e!627195 (= (-!930 lt!491774 k0!904) lt!491787))))

(declare-fun lt!491779 () ListLongMap!15359)

(declare-fun lt!491781 () ListLongMap!15359)

(declare-fun lt!491777 () tuple2!17390)

(declare-fun +!3407 (ListLongMap!15359 tuple2!17390) ListLongMap!15359)

(assert (=> b!1098898 (= (-!930 lt!491779 k0!904) (+!3407 lt!491781 lt!491777))))

(declare-datatypes ((Unit!35975 0))(
  ( (Unit!35976) )
))
(declare-fun lt!491785 () Unit!35975)

(declare-fun minValue!831 () V!41337)

(declare-fun lt!491783 () ListLongMap!15359)

(declare-fun addRemoveCommutativeForDiffKeys!125 (ListLongMap!15359 (_ BitVec 64) V!41337 (_ BitVec 64)) Unit!35975)

(assert (=> b!1098898 (= lt!491785 (addRemoveCommutativeForDiffKeys!125 lt!491783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1098900 () Bool)

(declare-fun e!627201 () Bool)

(declare-fun e!627199 () Bool)

(assert (=> b!1098900 (= e!627201 (and e!627199 mapRes!42508))))

(declare-fun condMapEmpty!42508 () Bool)

(declare-fun mapDefault!42508 () ValueCell!12869)

(assert (=> b!1098900 (= condMapEmpty!42508 (= (arr!34236 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12869)) mapDefault!42508)))))

(declare-fun b!1098901 () Bool)

(declare-fun e!627200 () Bool)

(assert (=> b!1098901 (= e!627200 e!627195)))

(declare-fun res!733386 () Bool)

(assert (=> b!1098901 (=> res!733386 e!627195)))

(assert (=> b!1098901 (= res!733386 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!491784 () ListLongMap!15359)

(assert (=> b!1098901 (= lt!491781 lt!491784)))

(assert (=> b!1098901 (= lt!491781 (-!930 lt!491783 k0!904))))

(declare-fun lt!491776 () Unit!35975)

(declare-fun lt!491772 () ListLongMap!15359)

(declare-fun zeroValue!831 () V!41337)

(assert (=> b!1098901 (= lt!491776 (addRemoveCommutativeForDiffKeys!125 lt!491772 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1098901 (= lt!491787 (+!3407 lt!491784 lt!491777))))

(declare-fun lt!491780 () ListLongMap!15359)

(declare-fun lt!491773 () tuple2!17390)

(assert (=> b!1098901 (= lt!491784 (+!3407 lt!491780 lt!491773))))

(assert (=> b!1098901 (= lt!491774 lt!491779)))

(assert (=> b!1098901 (= lt!491779 (+!3407 lt!491783 lt!491777))))

(assert (=> b!1098901 (= lt!491783 (+!3407 lt!491772 lt!491773))))

(declare-fun lt!491788 () ListLongMap!15359)

(assert (=> b!1098901 (= lt!491787 (+!3407 (+!3407 lt!491788 lt!491773) lt!491777))))

(assert (=> b!1098901 (= lt!491777 (tuple2!17391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098901 (= lt!491773 (tuple2!17391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098902 () Bool)

(declare-fun e!627198 () Bool)

(assert (=> b!1098902 (= e!627197 e!627198)))

(declare-fun res!733383 () Bool)

(assert (=> b!1098902 (=> (not res!733383) (not e!627198))))

(declare-fun lt!491786 () array!71134)

(assert (=> b!1098902 (= res!733383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491786 mask!1414))))

(assert (=> b!1098902 (= lt!491786 (array!71135 (store (arr!34235 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34773 _keys!1070)))))

(declare-fun b!1098903 () Bool)

(declare-fun res!733384 () Bool)

(assert (=> b!1098903 (=> (not res!733384) (not e!627198))))

(assert (=> b!1098903 (= res!733384 (arrayNoDuplicates!0 lt!491786 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun b!1098904 () Bool)

(declare-fun tp_is_empty!27157 () Bool)

(assert (=> b!1098904 (= e!627194 tp_is_empty!27157)))

(declare-fun b!1098905 () Bool)

(assert (=> b!1098905 (= e!627199 tp_is_empty!27157)))

(declare-fun b!1098906 () Bool)

(declare-fun res!733382 () Bool)

(assert (=> b!1098906 (=> (not res!733382) (not e!627197))))

(assert (=> b!1098906 (= res!733382 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34773 _keys!1070))))))

(declare-fun mapIsEmpty!42508 () Bool)

(assert (=> mapIsEmpty!42508 mapRes!42508))

(declare-fun res!733391 () Bool)

(assert (=> start!96628 (=> (not res!733391) (not e!627197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96628 (= res!733391 (validMask!0 mask!1414))))

(assert (=> start!96628 e!627197))

(assert (=> start!96628 tp!81260))

(assert (=> start!96628 true))

(assert (=> start!96628 tp_is_empty!27157))

(declare-fun array_inv!26406 (array!71134) Bool)

(assert (=> start!96628 (array_inv!26406 _keys!1070)))

(declare-fun array_inv!26407 (array!71136) Bool)

(assert (=> start!96628 (and (array_inv!26407 _values!874) e!627201)))

(declare-fun b!1098899 () Bool)

(assert (=> b!1098899 (= e!627198 (not e!627200))))

(declare-fun res!733381 () Bool)

(assert (=> b!1098899 (=> res!733381 e!627200)))

(assert (=> b!1098899 (= res!733381 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4315 (array!71134 array!71136 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) Int) ListLongMap!15359)

(assert (=> b!1098899 (= lt!491774 (getCurrentListMap!4315 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491778 () array!71136)

(assert (=> b!1098899 (= lt!491787 (getCurrentListMap!4315 lt!491786 lt!491778 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098899 (and (= lt!491788 lt!491780) (= lt!491780 lt!491788))))

(assert (=> b!1098899 (= lt!491780 (-!930 lt!491772 k0!904))))

(declare-fun lt!491775 () Unit!35975)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 (array!71134 array!71136 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35975)

(assert (=> b!1098899 (= lt!491775 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4222 (array!71134 array!71136 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) Int) ListLongMap!15359)

(assert (=> b!1098899 (= lt!491788 (getCurrentListMapNoExtraKeys!4222 lt!491786 lt!491778 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2291 (Int (_ BitVec 64)) V!41337)

(assert (=> b!1098899 (= lt!491778 (array!71137 (store (arr!34236 _values!874) i!650 (ValueCellFull!12869 (dynLambda!2291 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34774 _values!874)))))

(assert (=> b!1098899 (= lt!491772 (getCurrentListMapNoExtraKeys!4222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098899 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491782 () Unit!35975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71134 (_ BitVec 64) (_ BitVec 32)) Unit!35975)

(assert (=> b!1098899 (= lt!491782 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96628 res!733391) b!1098893))

(assert (= (and b!1098893 res!733389) b!1098897))

(assert (= (and b!1098897 res!733387) b!1098896))

(assert (= (and b!1098896 res!733390) b!1098906))

(assert (= (and b!1098906 res!733382) b!1098894))

(assert (= (and b!1098894 res!733385) b!1098895))

(assert (= (and b!1098895 res!733388) b!1098902))

(assert (= (and b!1098902 res!733383) b!1098903))

(assert (= (and b!1098903 res!733384) b!1098899))

(assert (= (and b!1098899 (not res!733381)) b!1098901))

(assert (= (and b!1098901 (not res!733386)) b!1098898))

(assert (= (and b!1098900 condMapEmpty!42508) mapIsEmpty!42508))

(assert (= (and b!1098900 (not condMapEmpty!42508)) mapNonEmpty!42508))

(get-info :version)

(assert (= (and mapNonEmpty!42508 ((_ is ValueCellFull!12869) mapValue!42508)) b!1098904))

(assert (= (and b!1098900 ((_ is ValueCellFull!12869) mapDefault!42508)) b!1098905))

(assert (= start!96628 b!1098900))

(declare-fun b_lambda!17863 () Bool)

(assert (=> (not b_lambda!17863) (not b!1098899)))

(declare-fun t!34124 () Bool)

(declare-fun tb!7965 () Bool)

(assert (=> (and start!96628 (= defaultEntry!882 defaultEntry!882) t!34124) tb!7965))

(declare-fun result!16469 () Bool)

(assert (=> tb!7965 (= result!16469 tp_is_empty!27157)))

(assert (=> b!1098899 t!34124))

(declare-fun b_and!36909 () Bool)

(assert (= b_and!36907 (and (=> t!34124 result!16469) b_and!36909)))

(declare-fun m!1018319 () Bool)

(assert (=> b!1098896 m!1018319))

(declare-fun m!1018321 () Bool)

(assert (=> mapNonEmpty!42508 m!1018321))

(declare-fun m!1018323 () Bool)

(assert (=> b!1098895 m!1018323))

(declare-fun m!1018325 () Bool)

(assert (=> b!1098902 m!1018325))

(declare-fun m!1018327 () Bool)

(assert (=> b!1098902 m!1018327))

(declare-fun m!1018329 () Bool)

(assert (=> b!1098898 m!1018329))

(declare-fun m!1018331 () Bool)

(assert (=> b!1098898 m!1018331))

(declare-fun m!1018333 () Bool)

(assert (=> b!1098898 m!1018333))

(declare-fun m!1018335 () Bool)

(assert (=> b!1098898 m!1018335))

(declare-fun m!1018337 () Bool)

(assert (=> b!1098901 m!1018337))

(declare-fun m!1018339 () Bool)

(assert (=> b!1098901 m!1018339))

(declare-fun m!1018341 () Bool)

(assert (=> b!1098901 m!1018341))

(declare-fun m!1018343 () Bool)

(assert (=> b!1098901 m!1018343))

(assert (=> b!1098901 m!1018343))

(declare-fun m!1018345 () Bool)

(assert (=> b!1098901 m!1018345))

(declare-fun m!1018347 () Bool)

(assert (=> b!1098901 m!1018347))

(declare-fun m!1018349 () Bool)

(assert (=> b!1098901 m!1018349))

(declare-fun m!1018351 () Bool)

(assert (=> b!1098901 m!1018351))

(declare-fun m!1018353 () Bool)

(assert (=> start!96628 m!1018353))

(declare-fun m!1018355 () Bool)

(assert (=> start!96628 m!1018355))

(declare-fun m!1018357 () Bool)

(assert (=> start!96628 m!1018357))

(declare-fun m!1018359 () Bool)

(assert (=> b!1098897 m!1018359))

(declare-fun m!1018361 () Bool)

(assert (=> b!1098899 m!1018361))

(declare-fun m!1018363 () Bool)

(assert (=> b!1098899 m!1018363))

(declare-fun m!1018365 () Bool)

(assert (=> b!1098899 m!1018365))

(declare-fun m!1018367 () Bool)

(assert (=> b!1098899 m!1018367))

(declare-fun m!1018369 () Bool)

(assert (=> b!1098899 m!1018369))

(declare-fun m!1018371 () Bool)

(assert (=> b!1098899 m!1018371))

(declare-fun m!1018373 () Bool)

(assert (=> b!1098899 m!1018373))

(declare-fun m!1018375 () Bool)

(assert (=> b!1098899 m!1018375))

(declare-fun m!1018377 () Bool)

(assert (=> b!1098899 m!1018377))

(declare-fun m!1018379 () Bool)

(assert (=> b!1098899 m!1018379))

(declare-fun m!1018381 () Bool)

(assert (=> b!1098903 m!1018381))

(declare-fun m!1018383 () Bool)

(assert (=> b!1098894 m!1018383))

(check-sat (not b_next!23107) tp_is_empty!27157 b_and!36909 (not b!1098899) (not b_lambda!17863) (not b!1098897) (not b!1098898) (not start!96628) (not b!1098894) (not b!1098903) (not b!1098901) (not b!1098896) (not b!1098902) (not mapNonEmpty!42508))
(check-sat b_and!36909 (not b_next!23107))
