; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96018 () Bool)

(assert start!96018)

(declare-fun b_free!22671 () Bool)

(declare-fun b_next!22671 () Bool)

(assert (=> start!96018 (= b_free!22671 (not b_next!22671))))

(declare-fun tp!79861 () Bool)

(declare-fun b_and!36017 () Bool)

(assert (=> start!96018 (= tp!79861 b_and!36017)))

(declare-fun b!1088502 () Bool)

(declare-fun e!621740 () Bool)

(declare-fun e!621746 () Bool)

(declare-fun mapRes!41764 () Bool)

(assert (=> b!1088502 (= e!621740 (and e!621746 mapRes!41764))))

(declare-fun condMapEmpty!41764 () Bool)

(declare-datatypes ((V!40691 0))(
  ( (V!40692 (val!13393 Int)) )
))
(declare-datatypes ((ValueCell!12627 0))(
  ( (ValueCellFull!12627 (v!16014 V!40691)) (EmptyCell!12627) )
))
(declare-datatypes ((array!70271 0))(
  ( (array!70272 (arr!33809 (Array (_ BitVec 32) ValueCell!12627)) (size!34345 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70271)

(declare-fun mapDefault!41764 () ValueCell!12627)

(assert (=> b!1088502 (= condMapEmpty!41764 (= (arr!33809 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12627)) mapDefault!41764)))))

(declare-fun b!1088503 () Bool)

(declare-fun res!726002 () Bool)

(declare-fun e!621743 () Bool)

(assert (=> b!1088503 (=> (not res!726002) (not e!621743))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088503 (= res!726002 (validKeyInArray!0 k0!904))))

(declare-fun b!1088504 () Bool)

(declare-fun e!621739 () Bool)

(declare-fun e!621744 () Bool)

(assert (=> b!1088504 (= e!621739 e!621744)))

(declare-fun res!726005 () Bool)

(assert (=> b!1088504 (=> res!726005 e!621744)))

(assert (=> b!1088504 (= res!726005 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17004 0))(
  ( (tuple2!17005 (_1!8513 (_ BitVec 64)) (_2!8513 V!40691)) )
))
(declare-datatypes ((List!23591 0))(
  ( (Nil!23588) (Cons!23587 (h!24796 tuple2!17004) (t!33320 List!23591)) )
))
(declare-datatypes ((ListLongMap!14973 0))(
  ( (ListLongMap!14974 (toList!7502 List!23591)) )
))
(declare-fun lt!484861 () ListLongMap!14973)

(declare-fun lt!484863 () ListLongMap!14973)

(assert (=> b!1088504 (= lt!484861 lt!484863)))

(declare-fun lt!484854 () ListLongMap!14973)

(declare-fun lt!484855 () tuple2!17004)

(declare-fun +!3301 (ListLongMap!14973 tuple2!17004) ListLongMap!14973)

(assert (=> b!1088504 (= lt!484863 (+!3301 lt!484854 lt!484855))))

(declare-fun lt!484857 () ListLongMap!14973)

(declare-fun lt!484862 () ListLongMap!14973)

(assert (=> b!1088504 (= lt!484857 lt!484862)))

(declare-fun lt!484864 () ListLongMap!14973)

(assert (=> b!1088504 (= lt!484862 (+!3301 lt!484864 lt!484855))))

(declare-fun lt!484860 () ListLongMap!14973)

(assert (=> b!1088504 (= lt!484861 (+!3301 lt!484860 lt!484855))))

(declare-fun zeroValue!831 () V!40691)

(assert (=> b!1088504 (= lt!484855 (tuple2!17005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088505 () Bool)

(declare-fun tp_is_empty!26673 () Bool)

(assert (=> b!1088505 (= e!621746 tp_is_empty!26673)))

(declare-fun b!1088506 () Bool)

(declare-fun res!726004 () Bool)

(assert (=> b!1088506 (=> (not res!726004) (not e!621743))))

(declare-datatypes ((array!70273 0))(
  ( (array!70274 (arr!33810 (Array (_ BitVec 32) (_ BitVec 64))) (size!34346 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70273)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70273 (_ BitVec 32)) Bool)

(assert (=> b!1088506 (= res!726004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088507 () Bool)

(declare-fun res!725998 () Bool)

(assert (=> b!1088507 (=> (not res!725998) (not e!621743))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088507 (= res!725998 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34346 _keys!1070))))))

(declare-fun res!725996 () Bool)

(assert (=> start!96018 (=> (not res!725996) (not e!621743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96018 (= res!725996 (validMask!0 mask!1414))))

(assert (=> start!96018 e!621743))

(assert (=> start!96018 tp!79861))

(assert (=> start!96018 true))

(assert (=> start!96018 tp_is_empty!26673))

(declare-fun array_inv!26074 (array!70273) Bool)

(assert (=> start!96018 (array_inv!26074 _keys!1070)))

(declare-fun array_inv!26075 (array!70271) Bool)

(assert (=> start!96018 (and (array_inv!26075 _values!874) e!621740)))

(declare-fun b!1088508 () Bool)

(declare-fun e!621745 () Bool)

(assert (=> b!1088508 (= e!621745 tp_is_empty!26673)))

(declare-fun b!1088509 () Bool)

(assert (=> b!1088509 (= e!621744 (bvsle #b00000000000000000000000000000000 (size!34346 _keys!1070)))))

(declare-fun -!827 (ListLongMap!14973 (_ BitVec 64)) ListLongMap!14973)

(assert (=> b!1088509 (= (-!827 lt!484862 k0!904) lt!484863)))

(declare-datatypes ((Unit!35820 0))(
  ( (Unit!35821) )
))
(declare-fun lt!484853 () Unit!35820)

(declare-fun addRemoveCommutativeForDiffKeys!56 (ListLongMap!14973 (_ BitVec 64) V!40691 (_ BitVec 64)) Unit!35820)

(assert (=> b!1088509 (= lt!484853 (addRemoveCommutativeForDiffKeys!56 lt!484864 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun mapIsEmpty!41764 () Bool)

(assert (=> mapIsEmpty!41764 mapRes!41764))

(declare-fun b!1088510 () Bool)

(declare-fun res!725997 () Bool)

(declare-fun e!621741 () Bool)

(assert (=> b!1088510 (=> (not res!725997) (not e!621741))))

(declare-fun lt!484852 () array!70273)

(declare-datatypes ((List!23592 0))(
  ( (Nil!23589) (Cons!23588 (h!24797 (_ BitVec 64)) (t!33321 List!23592)) )
))
(declare-fun arrayNoDuplicates!0 (array!70273 (_ BitVec 32) List!23592) Bool)

(assert (=> b!1088510 (= res!725997 (arrayNoDuplicates!0 lt!484852 #b00000000000000000000000000000000 Nil!23589))))

(declare-fun b!1088511 () Bool)

(declare-fun res!726001 () Bool)

(assert (=> b!1088511 (=> (not res!726001) (not e!621743))))

(assert (=> b!1088511 (= res!726001 (= (select (arr!33810 _keys!1070) i!650) k0!904))))

(declare-fun b!1088512 () Bool)

(declare-fun res!726006 () Bool)

(assert (=> b!1088512 (=> (not res!726006) (not e!621743))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088512 (= res!726006 (and (= (size!34345 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34346 _keys!1070) (size!34345 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088513 () Bool)

(assert (=> b!1088513 (= e!621743 e!621741)))

(declare-fun res!725999 () Bool)

(assert (=> b!1088513 (=> (not res!725999) (not e!621741))))

(assert (=> b!1088513 (= res!725999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484852 mask!1414))))

(assert (=> b!1088513 (= lt!484852 (array!70274 (store (arr!33810 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34346 _keys!1070)))))

(declare-fun b!1088514 () Bool)

(assert (=> b!1088514 (= e!621741 (not e!621739))))

(declare-fun res!726000 () Bool)

(assert (=> b!1088514 (=> res!726000 e!621739)))

(assert (=> b!1088514 (= res!726000 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40691)

(declare-fun getCurrentListMap!4276 (array!70273 array!70271 (_ BitVec 32) (_ BitVec 32) V!40691 V!40691 (_ BitVec 32) Int) ListLongMap!14973)

(assert (=> b!1088514 (= lt!484857 (getCurrentListMap!4276 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484859 () array!70271)

(assert (=> b!1088514 (= lt!484861 (getCurrentListMap!4276 lt!484852 lt!484859 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088514 (and (= lt!484860 lt!484854) (= lt!484854 lt!484860))))

(assert (=> b!1088514 (= lt!484854 (-!827 lt!484864 k0!904))))

(declare-fun lt!484858 () Unit!35820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!95 (array!70273 array!70271 (_ BitVec 32) (_ BitVec 32) V!40691 V!40691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35820)

(assert (=> b!1088514 (= lt!484858 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!95 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4036 (array!70273 array!70271 (_ BitVec 32) (_ BitVec 32) V!40691 V!40691 (_ BitVec 32) Int) ListLongMap!14973)

(assert (=> b!1088514 (= lt!484860 (getCurrentListMapNoExtraKeys!4036 lt!484852 lt!484859 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2173 (Int (_ BitVec 64)) V!40691)

(assert (=> b!1088514 (= lt!484859 (array!70272 (store (arr!33809 _values!874) i!650 (ValueCellFull!12627 (dynLambda!2173 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34345 _values!874)))))

(assert (=> b!1088514 (= lt!484864 (getCurrentListMapNoExtraKeys!4036 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088514 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484856 () Unit!35820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70273 (_ BitVec 64) (_ BitVec 32)) Unit!35820)

(assert (=> b!1088514 (= lt!484856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088515 () Bool)

(declare-fun res!726003 () Bool)

(assert (=> b!1088515 (=> (not res!726003) (not e!621743))))

(assert (=> b!1088515 (= res!726003 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23589))))

(declare-fun mapNonEmpty!41764 () Bool)

(declare-fun tp!79862 () Bool)

(assert (=> mapNonEmpty!41764 (= mapRes!41764 (and tp!79862 e!621745))))

(declare-fun mapRest!41764 () (Array (_ BitVec 32) ValueCell!12627))

(declare-fun mapValue!41764 () ValueCell!12627)

(declare-fun mapKey!41764 () (_ BitVec 32))

(assert (=> mapNonEmpty!41764 (= (arr!33809 _values!874) (store mapRest!41764 mapKey!41764 mapValue!41764))))

(assert (= (and start!96018 res!725996) b!1088512))

(assert (= (and b!1088512 res!726006) b!1088506))

(assert (= (and b!1088506 res!726004) b!1088515))

(assert (= (and b!1088515 res!726003) b!1088507))

(assert (= (and b!1088507 res!725998) b!1088503))

(assert (= (and b!1088503 res!726002) b!1088511))

(assert (= (and b!1088511 res!726001) b!1088513))

(assert (= (and b!1088513 res!725999) b!1088510))

(assert (= (and b!1088510 res!725997) b!1088514))

(assert (= (and b!1088514 (not res!726000)) b!1088504))

(assert (= (and b!1088504 (not res!726005)) b!1088509))

(assert (= (and b!1088502 condMapEmpty!41764) mapIsEmpty!41764))

(assert (= (and b!1088502 (not condMapEmpty!41764)) mapNonEmpty!41764))

(get-info :version)

(assert (= (and mapNonEmpty!41764 ((_ is ValueCellFull!12627) mapValue!41764)) b!1088508))

(assert (= (and b!1088502 ((_ is ValueCellFull!12627) mapDefault!41764)) b!1088505))

(assert (= start!96018 b!1088502))

(declare-fun b_lambda!17341 () Bool)

(assert (=> (not b_lambda!17341) (not b!1088514)))

(declare-fun t!33319 () Bool)

(declare-fun tb!7549 () Bool)

(assert (=> (and start!96018 (= defaultEntry!882 defaultEntry!882) t!33319) tb!7549))

(declare-fun result!15617 () Bool)

(assert (=> tb!7549 (= result!15617 tp_is_empty!26673)))

(assert (=> b!1088514 t!33319))

(declare-fun b_and!36019 () Bool)

(assert (= b_and!36017 (and (=> t!33319 result!15617) b_and!36019)))

(declare-fun m!1007579 () Bool)

(assert (=> mapNonEmpty!41764 m!1007579))

(declare-fun m!1007581 () Bool)

(assert (=> b!1088515 m!1007581))

(declare-fun m!1007583 () Bool)

(assert (=> b!1088506 m!1007583))

(declare-fun m!1007585 () Bool)

(assert (=> b!1088511 m!1007585))

(declare-fun m!1007587 () Bool)

(assert (=> b!1088514 m!1007587))

(declare-fun m!1007589 () Bool)

(assert (=> b!1088514 m!1007589))

(declare-fun m!1007591 () Bool)

(assert (=> b!1088514 m!1007591))

(declare-fun m!1007593 () Bool)

(assert (=> b!1088514 m!1007593))

(declare-fun m!1007595 () Bool)

(assert (=> b!1088514 m!1007595))

(declare-fun m!1007597 () Bool)

(assert (=> b!1088514 m!1007597))

(declare-fun m!1007599 () Bool)

(assert (=> b!1088514 m!1007599))

(declare-fun m!1007601 () Bool)

(assert (=> b!1088514 m!1007601))

(declare-fun m!1007603 () Bool)

(assert (=> b!1088514 m!1007603))

(declare-fun m!1007605 () Bool)

(assert (=> b!1088514 m!1007605))

(declare-fun m!1007607 () Bool)

(assert (=> start!96018 m!1007607))

(declare-fun m!1007609 () Bool)

(assert (=> start!96018 m!1007609))

(declare-fun m!1007611 () Bool)

(assert (=> start!96018 m!1007611))

(declare-fun m!1007613 () Bool)

(assert (=> b!1088510 m!1007613))

(declare-fun m!1007615 () Bool)

(assert (=> b!1088509 m!1007615))

(declare-fun m!1007617 () Bool)

(assert (=> b!1088509 m!1007617))

(declare-fun m!1007619 () Bool)

(assert (=> b!1088513 m!1007619))

(declare-fun m!1007621 () Bool)

(assert (=> b!1088513 m!1007621))

(declare-fun m!1007623 () Bool)

(assert (=> b!1088504 m!1007623))

(declare-fun m!1007625 () Bool)

(assert (=> b!1088504 m!1007625))

(declare-fun m!1007627 () Bool)

(assert (=> b!1088504 m!1007627))

(declare-fun m!1007629 () Bool)

(assert (=> b!1088503 m!1007629))

(check-sat (not b!1088510) (not b!1088506) b_and!36019 (not b_next!22671) (not b!1088514) (not b_lambda!17341) (not b!1088513) (not b!1088515) (not b!1088503) tp_is_empty!26673 (not mapNonEmpty!41764) (not start!96018) (not b!1088504) (not b!1088509))
(check-sat b_and!36019 (not b_next!22671))
