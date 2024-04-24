; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96270 () Bool)

(assert start!96270)

(declare-fun b_free!22687 () Bool)

(declare-fun b_next!22687 () Bool)

(assert (=> start!96270 (= b_free!22687 (not b_next!22687))))

(declare-fun tp!79910 () Bool)

(declare-fun b_and!36059 () Bool)

(assert (=> start!96270 (= tp!79910 b_and!36059)))

(declare-fun b!1090181 () Bool)

(declare-fun res!726792 () Bool)

(declare-fun e!622791 () Bool)

(assert (=> b!1090181 (=> (not res!726792) (not e!622791))))

(declare-datatypes ((array!70341 0))(
  ( (array!70342 (arr!33838 (Array (_ BitVec 32) (_ BitVec 64))) (size!34375 (_ BitVec 32))) )
))
(declare-fun lt!485680 () array!70341)

(declare-datatypes ((List!23624 0))(
  ( (Nil!23621) (Cons!23620 (h!24838 (_ BitVec 64)) (t!33361 List!23624)) )
))
(declare-fun arrayNoDuplicates!0 (array!70341 (_ BitVec 32) List!23624) Bool)

(assert (=> b!1090181 (= res!726792 (arrayNoDuplicates!0 lt!485680 #b00000000000000000000000000000000 Nil!23621))))

(declare-fun b!1090182 () Bool)

(declare-fun e!622786 () Bool)

(assert (=> b!1090182 (= e!622786 true)))

(declare-datatypes ((V!40713 0))(
  ( (V!40714 (val!13401 Int)) )
))
(declare-datatypes ((tuple2!17030 0))(
  ( (tuple2!17031 (_1!8526 (_ BitVec 64)) (_2!8526 V!40713)) )
))
(declare-datatypes ((List!23625 0))(
  ( (Nil!23622) (Cons!23621 (h!24839 tuple2!17030) (t!33362 List!23625)) )
))
(declare-datatypes ((ListLongMap!15007 0))(
  ( (ListLongMap!15008 (toList!7519 List!23625)) )
))
(declare-fun lt!485687 () ListLongMap!15007)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!485690 () ListLongMap!15007)

(declare-fun -!830 (ListLongMap!15007 (_ BitVec 64)) ListLongMap!15007)

(assert (=> b!1090182 (= (-!830 lt!485687 k0!904) lt!485690)))

(declare-fun lt!485688 () ListLongMap!15007)

(declare-datatypes ((Unit!35827 0))(
  ( (Unit!35828) )
))
(declare-fun lt!485684 () Unit!35827)

(declare-fun zeroValue!831 () V!40713)

(declare-fun addRemoveCommutativeForDiffKeys!68 (ListLongMap!15007 (_ BitVec 64) V!40713 (_ BitVec 64)) Unit!35827)

(assert (=> b!1090182 (= lt!485684 (addRemoveCommutativeForDiffKeys!68 lt!485688 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1090183 () Bool)

(declare-fun e!622790 () Bool)

(assert (=> b!1090183 (= e!622790 e!622786)))

(declare-fun res!726784 () Bool)

(assert (=> b!1090183 (=> res!726784 e!622786)))

(assert (=> b!1090183 (= res!726784 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485686 () ListLongMap!15007)

(assert (=> b!1090183 (= lt!485686 lt!485690)))

(declare-fun lt!485679 () ListLongMap!15007)

(declare-fun lt!485682 () tuple2!17030)

(declare-fun +!3338 (ListLongMap!15007 tuple2!17030) ListLongMap!15007)

(assert (=> b!1090183 (= lt!485690 (+!3338 lt!485679 lt!485682))))

(declare-fun lt!485681 () ListLongMap!15007)

(assert (=> b!1090183 (= lt!485681 lt!485687)))

(assert (=> b!1090183 (= lt!485687 (+!3338 lt!485688 lt!485682))))

(declare-fun lt!485691 () ListLongMap!15007)

(assert (=> b!1090183 (= lt!485686 (+!3338 lt!485691 lt!485682))))

(assert (=> b!1090183 (= lt!485682 (tuple2!17031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090184 () Bool)

(declare-fun e!622788 () Bool)

(declare-fun e!622787 () Bool)

(declare-fun mapRes!41788 () Bool)

(assert (=> b!1090184 (= e!622788 (and e!622787 mapRes!41788))))

(declare-fun condMapEmpty!41788 () Bool)

(declare-datatypes ((ValueCell!12635 0))(
  ( (ValueCellFull!12635 (v!16018 V!40713)) (EmptyCell!12635) )
))
(declare-datatypes ((array!70343 0))(
  ( (array!70344 (arr!33839 (Array (_ BitVec 32) ValueCell!12635)) (size!34376 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70343)

(declare-fun mapDefault!41788 () ValueCell!12635)

(assert (=> b!1090184 (= condMapEmpty!41788 (= (arr!33839 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12635)) mapDefault!41788)))))

(declare-fun b!1090185 () Bool)

(declare-fun e!622789 () Bool)

(assert (=> b!1090185 (= e!622789 e!622791)))

(declare-fun res!726783 () Bool)

(assert (=> b!1090185 (=> (not res!726783) (not e!622791))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70341 (_ BitVec 32)) Bool)

(assert (=> b!1090185 (= res!726783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485680 mask!1414))))

(declare-fun _keys!1070 () array!70341)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090185 (= lt!485680 (array!70342 (store (arr!33838 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34375 _keys!1070)))))

(declare-fun res!726786 () Bool)

(assert (=> start!96270 (=> (not res!726786) (not e!622789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96270 (= res!726786 (validMask!0 mask!1414))))

(assert (=> start!96270 e!622789))

(assert (=> start!96270 tp!79910))

(assert (=> start!96270 true))

(declare-fun tp_is_empty!26689 () Bool)

(assert (=> start!96270 tp_is_empty!26689))

(declare-fun array_inv!26146 (array!70341) Bool)

(assert (=> start!96270 (array_inv!26146 _keys!1070)))

(declare-fun array_inv!26147 (array!70343) Bool)

(assert (=> start!96270 (and (array_inv!26147 _values!874) e!622788)))

(declare-fun mapNonEmpty!41788 () Bool)

(declare-fun tp!79909 () Bool)

(declare-fun e!622792 () Bool)

(assert (=> mapNonEmpty!41788 (= mapRes!41788 (and tp!79909 e!622792))))

(declare-fun mapRest!41788 () (Array (_ BitVec 32) ValueCell!12635))

(declare-fun mapValue!41788 () ValueCell!12635)

(declare-fun mapKey!41788 () (_ BitVec 32))

(assert (=> mapNonEmpty!41788 (= (arr!33839 _values!874) (store mapRest!41788 mapKey!41788 mapValue!41788))))

(declare-fun b!1090186 () Bool)

(declare-fun res!726791 () Bool)

(assert (=> b!1090186 (=> (not res!726791) (not e!622789))))

(assert (=> b!1090186 (= res!726791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090187 () Bool)

(declare-fun res!726782 () Bool)

(assert (=> b!1090187 (=> (not res!726782) (not e!622789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090187 (= res!726782 (validKeyInArray!0 k0!904))))

(declare-fun b!1090188 () Bool)

(declare-fun res!726789 () Bool)

(assert (=> b!1090188 (=> (not res!726789) (not e!622789))))

(assert (=> b!1090188 (= res!726789 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23621))))

(declare-fun b!1090189 () Bool)

(assert (=> b!1090189 (= e!622792 tp_is_empty!26689)))

(declare-fun b!1090190 () Bool)

(assert (=> b!1090190 (= e!622791 (not e!622790))))

(declare-fun res!726788 () Bool)

(assert (=> b!1090190 (=> res!726788 e!622790)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090190 (= res!726788 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40713)

(declare-fun getCurrentListMap!4278 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!15007)

(assert (=> b!1090190 (= lt!485681 (getCurrentListMap!4278 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485683 () array!70343)

(assert (=> b!1090190 (= lt!485686 (getCurrentListMap!4278 lt!485680 lt!485683 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090190 (and (= lt!485691 lt!485679) (= lt!485679 lt!485691))))

(assert (=> b!1090190 (= lt!485679 (-!830 lt!485688 k0!904))))

(declare-fun lt!485689 () Unit!35827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35827)

(assert (=> b!1090190 (= lt!485689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4083 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!15007)

(assert (=> b!1090190 (= lt!485691 (getCurrentListMapNoExtraKeys!4083 lt!485680 lt!485683 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2204 (Int (_ BitVec 64)) V!40713)

(assert (=> b!1090190 (= lt!485683 (array!70344 (store (arr!33839 _values!874) i!650 (ValueCellFull!12635 (dynLambda!2204 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34376 _values!874)))))

(assert (=> b!1090190 (= lt!485688 (getCurrentListMapNoExtraKeys!4083 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090190 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485685 () Unit!35827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70341 (_ BitVec 64) (_ BitVec 32)) Unit!35827)

(assert (=> b!1090190 (= lt!485685 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090191 () Bool)

(declare-fun res!726790 () Bool)

(assert (=> b!1090191 (=> (not res!726790) (not e!622789))))

(assert (=> b!1090191 (= res!726790 (and (= (size!34376 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34375 _keys!1070) (size!34376 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090192 () Bool)

(declare-fun res!726787 () Bool)

(assert (=> b!1090192 (=> (not res!726787) (not e!622789))))

(assert (=> b!1090192 (= res!726787 (= (select (arr!33838 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41788 () Bool)

(assert (=> mapIsEmpty!41788 mapRes!41788))

(declare-fun b!1090193 () Bool)

(assert (=> b!1090193 (= e!622787 tp_is_empty!26689)))

(declare-fun b!1090194 () Bool)

(declare-fun res!726785 () Bool)

(assert (=> b!1090194 (=> (not res!726785) (not e!622789))))

(assert (=> b!1090194 (= res!726785 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34375 _keys!1070))))))

(assert (= (and start!96270 res!726786) b!1090191))

(assert (= (and b!1090191 res!726790) b!1090186))

(assert (= (and b!1090186 res!726791) b!1090188))

(assert (= (and b!1090188 res!726789) b!1090194))

(assert (= (and b!1090194 res!726785) b!1090187))

(assert (= (and b!1090187 res!726782) b!1090192))

(assert (= (and b!1090192 res!726787) b!1090185))

(assert (= (and b!1090185 res!726783) b!1090181))

(assert (= (and b!1090181 res!726792) b!1090190))

(assert (= (and b!1090190 (not res!726788)) b!1090183))

(assert (= (and b!1090183 (not res!726784)) b!1090182))

(assert (= (and b!1090184 condMapEmpty!41788) mapIsEmpty!41788))

(assert (= (and b!1090184 (not condMapEmpty!41788)) mapNonEmpty!41788))

(get-info :version)

(assert (= (and mapNonEmpty!41788 ((_ is ValueCellFull!12635) mapValue!41788)) b!1090189))

(assert (= (and b!1090184 ((_ is ValueCellFull!12635) mapDefault!41788)) b!1090193))

(assert (= start!96270 b!1090184))

(declare-fun b_lambda!17367 () Bool)

(assert (=> (not b_lambda!17367) (not b!1090190)))

(declare-fun t!33360 () Bool)

(declare-fun tb!7557 () Bool)

(assert (=> (and start!96270 (= defaultEntry!882 defaultEntry!882) t!33360) tb!7557))

(declare-fun result!15641 () Bool)

(assert (=> tb!7557 (= result!15641 tp_is_empty!26689)))

(assert (=> b!1090190 t!33360))

(declare-fun b_and!36061 () Bool)

(assert (= b_and!36059 (and (=> t!33360 result!15641) b_and!36061)))

(declare-fun m!1009667 () Bool)

(assert (=> b!1090185 m!1009667))

(declare-fun m!1009669 () Bool)

(assert (=> b!1090185 m!1009669))

(declare-fun m!1009671 () Bool)

(assert (=> b!1090187 m!1009671))

(declare-fun m!1009673 () Bool)

(assert (=> b!1090190 m!1009673))

(declare-fun m!1009675 () Bool)

(assert (=> b!1090190 m!1009675))

(declare-fun m!1009677 () Bool)

(assert (=> b!1090190 m!1009677))

(declare-fun m!1009679 () Bool)

(assert (=> b!1090190 m!1009679))

(declare-fun m!1009681 () Bool)

(assert (=> b!1090190 m!1009681))

(declare-fun m!1009683 () Bool)

(assert (=> b!1090190 m!1009683))

(declare-fun m!1009685 () Bool)

(assert (=> b!1090190 m!1009685))

(declare-fun m!1009687 () Bool)

(assert (=> b!1090190 m!1009687))

(declare-fun m!1009689 () Bool)

(assert (=> b!1090190 m!1009689))

(declare-fun m!1009691 () Bool)

(assert (=> b!1090190 m!1009691))

(declare-fun m!1009693 () Bool)

(assert (=> mapNonEmpty!41788 m!1009693))

(declare-fun m!1009695 () Bool)

(assert (=> b!1090181 m!1009695))

(declare-fun m!1009697 () Bool)

(assert (=> b!1090186 m!1009697))

(declare-fun m!1009699 () Bool)

(assert (=> b!1090192 m!1009699))

(declare-fun m!1009701 () Bool)

(assert (=> b!1090188 m!1009701))

(declare-fun m!1009703 () Bool)

(assert (=> b!1090183 m!1009703))

(declare-fun m!1009705 () Bool)

(assert (=> b!1090183 m!1009705))

(declare-fun m!1009707 () Bool)

(assert (=> b!1090183 m!1009707))

(declare-fun m!1009709 () Bool)

(assert (=> b!1090182 m!1009709))

(declare-fun m!1009711 () Bool)

(assert (=> b!1090182 m!1009711))

(declare-fun m!1009713 () Bool)

(assert (=> start!96270 m!1009713))

(declare-fun m!1009715 () Bool)

(assert (=> start!96270 m!1009715))

(declare-fun m!1009717 () Bool)

(assert (=> start!96270 m!1009717))

(check-sat (not b_lambda!17367) (not b!1090185) (not b!1090190) (not mapNonEmpty!41788) (not b!1090186) (not b!1090188) tp_is_empty!26689 (not start!96270) b_and!36061 (not b!1090187) (not b!1090183) (not b!1090181) (not b_next!22687) (not b!1090182))
(check-sat b_and!36061 (not b_next!22687))
