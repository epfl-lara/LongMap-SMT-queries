; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95650 () Bool)

(assert start!95650)

(declare-fun b_free!22309 () Bool)

(declare-fun b_next!22309 () Bool)

(assert (=> start!95650 (= b_free!22309 (not b_next!22309))))

(declare-fun tp!78775 () Bool)

(declare-fun b_and!35267 () Bool)

(assert (=> start!95650 (= tp!78775 b_and!35267)))

(declare-fun b!1080930 () Bool)

(declare-fun res!720506 () Bool)

(declare-fun e!617868 () Bool)

(assert (=> b!1080930 (=> (not res!720506) (not e!617868))))

(declare-datatypes ((array!69502 0))(
  ( (array!69503 (arr!33425 (Array (_ BitVec 32) (_ BitVec 64))) (size!33963 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69502)

(declare-datatypes ((List!23366 0))(
  ( (Nil!23363) (Cons!23362 (h!24571 (_ BitVec 64)) (t!32724 List!23366)) )
))
(declare-fun arrayNoDuplicates!0 (array!69502 (_ BitVec 32) List!23366) Bool)

(assert (=> b!1080930 (= res!720506 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun b!1080931 () Bool)

(declare-fun res!720500 () Bool)

(declare-fun e!617870 () Bool)

(assert (=> b!1080931 (=> (not res!720500) (not e!617870))))

(declare-fun lt!478991 () array!69502)

(assert (=> b!1080931 (= res!720500 (arrayNoDuplicates!0 lt!478991 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun b!1080932 () Bool)

(declare-fun res!720504 () Bool)

(assert (=> b!1080932 (=> (not res!720504) (not e!617868))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080932 (= res!720504 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41221 () Bool)

(declare-fun mapRes!41221 () Bool)

(assert (=> mapIsEmpty!41221 mapRes!41221))

(declare-fun res!720501 () Bool)

(assert (=> start!95650 (=> (not res!720501) (not e!617868))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95650 (= res!720501 (validMask!0 mask!1414))))

(assert (=> start!95650 e!617868))

(assert (=> start!95650 tp!78775))

(assert (=> start!95650 true))

(declare-fun tp_is_empty!26311 () Bool)

(assert (=> start!95650 tp_is_empty!26311))

(declare-fun array_inv!25838 (array!69502) Bool)

(assert (=> start!95650 (array_inv!25838 _keys!1070)))

(declare-datatypes ((V!40209 0))(
  ( (V!40210 (val!13212 Int)) )
))
(declare-datatypes ((ValueCell!12446 0))(
  ( (ValueCellFull!12446 (v!15832 V!40209)) (EmptyCell!12446) )
))
(declare-datatypes ((array!69504 0))(
  ( (array!69505 (arr!33426 (Array (_ BitVec 32) ValueCell!12446)) (size!33964 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69504)

(declare-fun e!617869 () Bool)

(declare-fun array_inv!25839 (array!69504) Bool)

(assert (=> start!95650 (and (array_inv!25839 _values!874) e!617869)))

(declare-fun b!1080933 () Bool)

(declare-fun res!720499 () Bool)

(assert (=> b!1080933 (=> (not res!720499) (not e!617868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69502 (_ BitVec 32)) Bool)

(assert (=> b!1080933 (= res!720499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080934 () Bool)

(declare-fun res!720505 () Bool)

(assert (=> b!1080934 (=> (not res!720505) (not e!617868))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080934 (= res!720505 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33963 _keys!1070))))))

(declare-fun b!1080935 () Bool)

(assert (=> b!1080935 (= e!617870 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40209)

(declare-datatypes ((tuple2!16804 0))(
  ( (tuple2!16805 (_1!8413 (_ BitVec 64)) (_2!8413 V!40209)) )
))
(declare-datatypes ((List!23367 0))(
  ( (Nil!23364) (Cons!23363 (h!24572 tuple2!16804) (t!32725 List!23367)) )
))
(declare-datatypes ((ListLongMap!14773 0))(
  ( (ListLongMap!14774 (toList!7402 List!23367)) )
))
(declare-fun lt!478989 () ListLongMap!14773)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40209)

(declare-fun getCurrentListMapNoExtraKeys!3965 (array!69502 array!69504 (_ BitVec 32) (_ BitVec 32) V!40209 V!40209 (_ BitVec 32) Int) ListLongMap!14773)

(declare-fun dynLambda!2036 (Int (_ BitVec 64)) V!40209)

(assert (=> b!1080935 (= lt!478989 (getCurrentListMapNoExtraKeys!3965 lt!478991 (array!69505 (store (arr!33426 _values!874) i!650 (ValueCellFull!12446 (dynLambda!2036 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33964 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!478988 () ListLongMap!14773)

(assert (=> b!1080935 (= lt!478988 (getCurrentListMapNoExtraKeys!3965 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080935 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35397 0))(
  ( (Unit!35398) )
))
(declare-fun lt!478990 () Unit!35397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69502 (_ BitVec 64) (_ BitVec 32)) Unit!35397)

(assert (=> b!1080935 (= lt!478990 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080936 () Bool)

(declare-fun e!617867 () Bool)

(assert (=> b!1080936 (= e!617869 (and e!617867 mapRes!41221))))

(declare-fun condMapEmpty!41221 () Bool)

(declare-fun mapDefault!41221 () ValueCell!12446)

(assert (=> b!1080936 (= condMapEmpty!41221 (= (arr!33426 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12446)) mapDefault!41221)))))

(declare-fun b!1080937 () Bool)

(assert (=> b!1080937 (= e!617868 e!617870)))

(declare-fun res!720502 () Bool)

(assert (=> b!1080937 (=> (not res!720502) (not e!617870))))

(assert (=> b!1080937 (= res!720502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478991 mask!1414))))

(assert (=> b!1080937 (= lt!478991 (array!69503 (store (arr!33425 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33963 _keys!1070)))))

(declare-fun b!1080938 () Bool)

(declare-fun e!617865 () Bool)

(assert (=> b!1080938 (= e!617865 tp_is_empty!26311)))

(declare-fun mapNonEmpty!41221 () Bool)

(declare-fun tp!78776 () Bool)

(assert (=> mapNonEmpty!41221 (= mapRes!41221 (and tp!78776 e!617865))))

(declare-fun mapRest!41221 () (Array (_ BitVec 32) ValueCell!12446))

(declare-fun mapValue!41221 () ValueCell!12446)

(declare-fun mapKey!41221 () (_ BitVec 32))

(assert (=> mapNonEmpty!41221 (= (arr!33426 _values!874) (store mapRest!41221 mapKey!41221 mapValue!41221))))

(declare-fun b!1080939 () Bool)

(declare-fun res!720503 () Bool)

(assert (=> b!1080939 (=> (not res!720503) (not e!617868))))

(assert (=> b!1080939 (= res!720503 (= (select (arr!33425 _keys!1070) i!650) k0!904))))

(declare-fun b!1080940 () Bool)

(declare-fun res!720507 () Bool)

(assert (=> b!1080940 (=> (not res!720507) (not e!617868))))

(assert (=> b!1080940 (= res!720507 (and (= (size!33964 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33963 _keys!1070) (size!33964 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080941 () Bool)

(assert (=> b!1080941 (= e!617867 tp_is_empty!26311)))

(assert (= (and start!95650 res!720501) b!1080940))

(assert (= (and b!1080940 res!720507) b!1080933))

(assert (= (and b!1080933 res!720499) b!1080930))

(assert (= (and b!1080930 res!720506) b!1080934))

(assert (= (and b!1080934 res!720505) b!1080932))

(assert (= (and b!1080932 res!720504) b!1080939))

(assert (= (and b!1080939 res!720503) b!1080937))

(assert (= (and b!1080937 res!720502) b!1080931))

(assert (= (and b!1080931 res!720500) b!1080935))

(assert (= (and b!1080936 condMapEmpty!41221) mapIsEmpty!41221))

(assert (= (and b!1080936 (not condMapEmpty!41221)) mapNonEmpty!41221))

(get-info :version)

(assert (= (and mapNonEmpty!41221 ((_ is ValueCellFull!12446) mapValue!41221)) b!1080938))

(assert (= (and b!1080936 ((_ is ValueCellFull!12446) mapDefault!41221)) b!1080941))

(assert (= start!95650 b!1080936))

(declare-fun b_lambda!16957 () Bool)

(assert (=> (not b_lambda!16957) (not b!1080935)))

(declare-fun t!32723 () Bool)

(declare-fun tb!7179 () Bool)

(assert (=> (and start!95650 (= defaultEntry!882 defaultEntry!882) t!32723) tb!7179))

(declare-fun result!14885 () Bool)

(assert (=> tb!7179 (= result!14885 tp_is_empty!26311)))

(assert (=> b!1080935 t!32723))

(declare-fun b_and!35269 () Bool)

(assert (= b_and!35267 (and (=> t!32723 result!14885) b_and!35269)))

(declare-fun m!998285 () Bool)

(assert (=> start!95650 m!998285))

(declare-fun m!998287 () Bool)

(assert (=> start!95650 m!998287))

(declare-fun m!998289 () Bool)

(assert (=> start!95650 m!998289))

(declare-fun m!998291 () Bool)

(assert (=> b!1080931 m!998291))

(declare-fun m!998293 () Bool)

(assert (=> b!1080932 m!998293))

(declare-fun m!998295 () Bool)

(assert (=> b!1080939 m!998295))

(declare-fun m!998297 () Bool)

(assert (=> b!1080937 m!998297))

(declare-fun m!998299 () Bool)

(assert (=> b!1080937 m!998299))

(declare-fun m!998301 () Bool)

(assert (=> mapNonEmpty!41221 m!998301))

(declare-fun m!998303 () Bool)

(assert (=> b!1080930 m!998303))

(declare-fun m!998305 () Bool)

(assert (=> b!1080933 m!998305))

(declare-fun m!998307 () Bool)

(assert (=> b!1080935 m!998307))

(declare-fun m!998309 () Bool)

(assert (=> b!1080935 m!998309))

(declare-fun m!998311 () Bool)

(assert (=> b!1080935 m!998311))

(declare-fun m!998313 () Bool)

(assert (=> b!1080935 m!998313))

(declare-fun m!998315 () Bool)

(assert (=> b!1080935 m!998315))

(declare-fun m!998317 () Bool)

(assert (=> b!1080935 m!998317))

(check-sat (not b!1080937) (not b!1080930) (not b!1080933) b_and!35269 (not b_next!22309) (not mapNonEmpty!41221) tp_is_empty!26311 (not b_lambda!16957) (not start!95650) (not b!1080931) (not b!1080935) (not b!1080932))
(check-sat b_and!35269 (not b_next!22309))
