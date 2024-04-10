; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95832 () Bool)

(assert start!95832)

(declare-fun b_free!22485 () Bool)

(declare-fun b_next!22485 () Bool)

(assert (=> start!95832 (= b_free!22485 (not b_next!22485))))

(declare-fun tp!79303 () Bool)

(declare-fun b_and!35645 () Bool)

(assert (=> start!95832 (= tp!79303 b_and!35645)))

(declare-fun b!1084427 () Bool)

(declare-fun res!722949 () Bool)

(declare-fun e!619542 () Bool)

(assert (=> b!1084427 (=> (not res!722949) (not e!619542))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69913 0))(
  ( (array!69914 (arr!33630 (Array (_ BitVec 32) (_ BitVec 64))) (size!34166 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69913)

(declare-datatypes ((V!40443 0))(
  ( (V!40444 (val!13300 Int)) )
))
(declare-datatypes ((ValueCell!12534 0))(
  ( (ValueCellFull!12534 (v!15921 V!40443)) (EmptyCell!12534) )
))
(declare-datatypes ((array!69915 0))(
  ( (array!69916 (arr!33631 (Array (_ BitVec 32) ValueCell!12534)) (size!34167 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69915)

(assert (=> b!1084427 (= res!722949 (and (= (size!34167 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34166 _keys!1070) (size!34167 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084429 () Bool)

(declare-fun e!619546 () Bool)

(declare-fun tp_is_empty!26487 () Bool)

(assert (=> b!1084429 (= e!619546 tp_is_empty!26487)))

(declare-fun b!1084430 () Bool)

(declare-fun e!619543 () Bool)

(assert (=> b!1084430 (= e!619542 e!619543)))

(declare-fun res!722952 () Bool)

(assert (=> b!1084430 (=> (not res!722952) (not e!619543))))

(declare-fun lt!480681 () array!69913)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69913 (_ BitVec 32)) Bool)

(assert (=> b!1084430 (= res!722952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480681 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084430 (= lt!480681 (array!69914 (store (arr!33630 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34166 _keys!1070)))))

(declare-fun b!1084431 () Bool)

(declare-fun e!619547 () Bool)

(declare-fun e!619545 () Bool)

(declare-fun mapRes!41485 () Bool)

(assert (=> b!1084431 (= e!619547 (and e!619545 mapRes!41485))))

(declare-fun condMapEmpty!41485 () Bool)

(declare-fun mapDefault!41485 () ValueCell!12534)

(assert (=> b!1084431 (= condMapEmpty!41485 (= (arr!33631 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12534)) mapDefault!41485)))))

(declare-fun b!1084432 () Bool)

(assert (=> b!1084432 (= e!619543 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40443)

(declare-datatypes ((tuple2!16858 0))(
  ( (tuple2!16859 (_1!8440 (_ BitVec 64)) (_2!8440 V!40443)) )
))
(declare-datatypes ((List!23447 0))(
  ( (Nil!23444) (Cons!23443 (h!24652 tuple2!16858) (t!32990 List!23447)) )
))
(declare-datatypes ((ListLongMap!14827 0))(
  ( (ListLongMap!14828 (toList!7429 List!23447)) )
))
(declare-fun lt!480682 () ListLongMap!14827)

(declare-fun zeroValue!831 () V!40443)

(declare-fun lt!480683 () array!69915)

(declare-fun getCurrentListMap!4217 (array!69913 array!69915 (_ BitVec 32) (_ BitVec 32) V!40443 V!40443 (_ BitVec 32) Int) ListLongMap!14827)

(assert (=> b!1084432 (= lt!480682 (getCurrentListMap!4217 lt!480681 lt!480683 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480678 () ListLongMap!14827)

(declare-fun lt!480680 () ListLongMap!14827)

(assert (=> b!1084432 (and (= lt!480678 lt!480680) (= lt!480680 lt!480678))))

(declare-fun lt!480685 () ListLongMap!14827)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!756 (ListLongMap!14827 (_ BitVec 64)) ListLongMap!14827)

(assert (=> b!1084432 (= lt!480680 (-!756 lt!480685 k0!904))))

(declare-datatypes ((Unit!35678 0))(
  ( (Unit!35679) )
))
(declare-fun lt!480684 () Unit!35678)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 (array!69913 array!69915 (_ BitVec 32) (_ BitVec 32) V!40443 V!40443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35678)

(assert (=> b!1084432 (= lt!480684 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3977 (array!69913 array!69915 (_ BitVec 32) (_ BitVec 32) V!40443 V!40443 (_ BitVec 32) Int) ListLongMap!14827)

(assert (=> b!1084432 (= lt!480678 (getCurrentListMapNoExtraKeys!3977 lt!480681 lt!480683 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2114 (Int (_ BitVec 64)) V!40443)

(assert (=> b!1084432 (= lt!480683 (array!69916 (store (arr!33631 _values!874) i!650 (ValueCellFull!12534 (dynLambda!2114 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34167 _values!874)))))

(assert (=> b!1084432 (= lt!480685 (getCurrentListMapNoExtraKeys!3977 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084432 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480679 () Unit!35678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69913 (_ BitVec 64) (_ BitVec 32)) Unit!35678)

(assert (=> b!1084432 (= lt!480679 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084433 () Bool)

(declare-fun res!722951 () Bool)

(assert (=> b!1084433 (=> (not res!722951) (not e!619542))))

(assert (=> b!1084433 (= res!722951 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34166 _keys!1070))))))

(declare-fun b!1084434 () Bool)

(assert (=> b!1084434 (= e!619545 tp_is_empty!26487)))

(declare-fun b!1084435 () Bool)

(declare-fun res!722945 () Bool)

(assert (=> b!1084435 (=> (not res!722945) (not e!619543))))

(declare-datatypes ((List!23448 0))(
  ( (Nil!23445) (Cons!23444 (h!24653 (_ BitVec 64)) (t!32991 List!23448)) )
))
(declare-fun arrayNoDuplicates!0 (array!69913 (_ BitVec 32) List!23448) Bool)

(assert (=> b!1084435 (= res!722945 (arrayNoDuplicates!0 lt!480681 #b00000000000000000000000000000000 Nil!23445))))

(declare-fun b!1084436 () Bool)

(declare-fun res!722944 () Bool)

(assert (=> b!1084436 (=> (not res!722944) (not e!619542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084436 (= res!722944 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41485 () Bool)

(declare-fun tp!79304 () Bool)

(assert (=> mapNonEmpty!41485 (= mapRes!41485 (and tp!79304 e!619546))))

(declare-fun mapKey!41485 () (_ BitVec 32))

(declare-fun mapValue!41485 () ValueCell!12534)

(declare-fun mapRest!41485 () (Array (_ BitVec 32) ValueCell!12534))

(assert (=> mapNonEmpty!41485 (= (arr!33631 _values!874) (store mapRest!41485 mapKey!41485 mapValue!41485))))

(declare-fun b!1084437 () Bool)

(declare-fun res!722950 () Bool)

(assert (=> b!1084437 (=> (not res!722950) (not e!619542))))

(assert (=> b!1084437 (= res!722950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084438 () Bool)

(declare-fun res!722948 () Bool)

(assert (=> b!1084438 (=> (not res!722948) (not e!619542))))

(assert (=> b!1084438 (= res!722948 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23445))))

(declare-fun mapIsEmpty!41485 () Bool)

(assert (=> mapIsEmpty!41485 mapRes!41485))

(declare-fun res!722947 () Bool)

(assert (=> start!95832 (=> (not res!722947) (not e!619542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95832 (= res!722947 (validMask!0 mask!1414))))

(assert (=> start!95832 e!619542))

(assert (=> start!95832 tp!79303))

(assert (=> start!95832 true))

(assert (=> start!95832 tp_is_empty!26487))

(declare-fun array_inv!25954 (array!69913) Bool)

(assert (=> start!95832 (array_inv!25954 _keys!1070)))

(declare-fun array_inv!25955 (array!69915) Bool)

(assert (=> start!95832 (and (array_inv!25955 _values!874) e!619547)))

(declare-fun b!1084428 () Bool)

(declare-fun res!722946 () Bool)

(assert (=> b!1084428 (=> (not res!722946) (not e!619542))))

(assert (=> b!1084428 (= res!722946 (= (select (arr!33630 _keys!1070) i!650) k0!904))))

(assert (= (and start!95832 res!722947) b!1084427))

(assert (= (and b!1084427 res!722949) b!1084437))

(assert (= (and b!1084437 res!722950) b!1084438))

(assert (= (and b!1084438 res!722948) b!1084433))

(assert (= (and b!1084433 res!722951) b!1084436))

(assert (= (and b!1084436 res!722944) b!1084428))

(assert (= (and b!1084428 res!722946) b!1084430))

(assert (= (and b!1084430 res!722952) b!1084435))

(assert (= (and b!1084435 res!722945) b!1084432))

(assert (= (and b!1084431 condMapEmpty!41485) mapIsEmpty!41485))

(assert (= (and b!1084431 (not condMapEmpty!41485)) mapNonEmpty!41485))

(get-info :version)

(assert (= (and mapNonEmpty!41485 ((_ is ValueCellFull!12534) mapValue!41485)) b!1084429))

(assert (= (and b!1084431 ((_ is ValueCellFull!12534) mapDefault!41485)) b!1084434))

(assert (= start!95832 b!1084431))

(declare-fun b_lambda!17155 () Bool)

(assert (=> (not b_lambda!17155) (not b!1084432)))

(declare-fun t!32989 () Bool)

(declare-fun tb!7363 () Bool)

(assert (=> (and start!95832 (= defaultEntry!882 defaultEntry!882) t!32989) tb!7363))

(declare-fun result!15245 () Bool)

(assert (=> tb!7363 (= result!15245 tp_is_empty!26487)))

(assert (=> b!1084432 t!32989))

(declare-fun b_and!35647 () Bool)

(assert (= b_and!35645 (and (=> t!32989 result!15245) b_and!35647)))

(declare-fun m!1002143 () Bool)

(assert (=> b!1084438 m!1002143))

(declare-fun m!1002145 () Bool)

(assert (=> b!1084435 m!1002145))

(declare-fun m!1002147 () Bool)

(assert (=> b!1084437 m!1002147))

(declare-fun m!1002149 () Bool)

(assert (=> b!1084432 m!1002149))

(declare-fun m!1002151 () Bool)

(assert (=> b!1084432 m!1002151))

(declare-fun m!1002153 () Bool)

(assert (=> b!1084432 m!1002153))

(declare-fun m!1002155 () Bool)

(assert (=> b!1084432 m!1002155))

(declare-fun m!1002157 () Bool)

(assert (=> b!1084432 m!1002157))

(declare-fun m!1002159 () Bool)

(assert (=> b!1084432 m!1002159))

(declare-fun m!1002161 () Bool)

(assert (=> b!1084432 m!1002161))

(declare-fun m!1002163 () Bool)

(assert (=> b!1084432 m!1002163))

(declare-fun m!1002165 () Bool)

(assert (=> b!1084432 m!1002165))

(declare-fun m!1002167 () Bool)

(assert (=> b!1084436 m!1002167))

(declare-fun m!1002169 () Bool)

(assert (=> start!95832 m!1002169))

(declare-fun m!1002171 () Bool)

(assert (=> start!95832 m!1002171))

(declare-fun m!1002173 () Bool)

(assert (=> start!95832 m!1002173))

(declare-fun m!1002175 () Bool)

(assert (=> b!1084430 m!1002175))

(declare-fun m!1002177 () Bool)

(assert (=> b!1084430 m!1002177))

(declare-fun m!1002179 () Bool)

(assert (=> mapNonEmpty!41485 m!1002179))

(declare-fun m!1002181 () Bool)

(assert (=> b!1084428 m!1002181))

(check-sat (not b!1084438) (not b_next!22485) (not b!1084432) (not b_lambda!17155) (not b!1084430) (not b!1084435) (not b!1084436) (not mapNonEmpty!41485) (not b!1084437) tp_is_empty!26487 b_and!35647 (not start!95832))
(check-sat b_and!35647 (not b_next!22485))
