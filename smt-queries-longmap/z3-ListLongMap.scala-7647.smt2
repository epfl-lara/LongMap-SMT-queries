; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96196 () Bool)

(assert start!96196)

(declare-fun b_free!22855 () Bool)

(declare-fun b_next!22855 () Bool)

(assert (=> start!96196 (= b_free!22855 (not b_next!22855))))

(declare-fun tp!80413 () Bool)

(declare-fun b_and!36359 () Bool)

(assert (=> start!96196 (= tp!80413 b_and!36359)))

(declare-fun mapIsEmpty!42040 () Bool)

(declare-fun mapRes!42040 () Bool)

(assert (=> mapIsEmpty!42040 mapRes!42040))

(declare-fun mapNonEmpty!42040 () Bool)

(declare-fun tp!80414 () Bool)

(declare-fun e!623816 () Bool)

(assert (=> mapNonEmpty!42040 (= mapRes!42040 (and tp!80414 e!623816))))

(declare-datatypes ((V!40937 0))(
  ( (V!40938 (val!13485 Int)) )
))
(declare-datatypes ((ValueCell!12719 0))(
  ( (ValueCellFull!12719 (v!16105 V!40937)) (EmptyCell!12719) )
))
(declare-datatypes ((array!70548 0))(
  ( (array!70549 (arr!33948 (Array (_ BitVec 32) ValueCell!12719)) (size!34486 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70548)

(declare-fun mapRest!42040 () (Array (_ BitVec 32) ValueCell!12719))

(declare-fun mapValue!42040 () ValueCell!12719)

(declare-fun mapKey!42040 () (_ BitVec 32))

(assert (=> mapNonEmpty!42040 (= (arr!33948 _values!874) (store mapRest!42040 mapKey!42040 mapValue!42040))))

(declare-fun b!1092367 () Bool)

(declare-fun e!623815 () Bool)

(declare-fun e!623819 () Bool)

(assert (=> b!1092367 (= e!623815 (and e!623819 mapRes!42040))))

(declare-fun condMapEmpty!42040 () Bool)

(declare-fun mapDefault!42040 () ValueCell!12719)

(assert (=> b!1092367 (= condMapEmpty!42040 (= (arr!33948 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12719)) mapDefault!42040)))))

(declare-fun b!1092368 () Bool)

(declare-fun res!728936 () Bool)

(declare-fun e!623818 () Bool)

(assert (=> b!1092368 (=> (not res!728936) (not e!623818))))

(declare-datatypes ((array!70550 0))(
  ( (array!70551 (arr!33949 (Array (_ BitVec 32) (_ BitVec 64))) (size!34487 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70550)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70550 (_ BitVec 32)) Bool)

(assert (=> b!1092368 (= res!728936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092369 () Bool)

(declare-fun e!623817 () Bool)

(assert (=> b!1092369 (= e!623817 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40937)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17212 0))(
  ( (tuple2!17213 (_1!8617 (_ BitVec 64)) (_2!8617 V!40937)) )
))
(declare-datatypes ((List!23776 0))(
  ( (Nil!23773) (Cons!23772 (h!24981 tuple2!17212) (t!33680 List!23776)) )
))
(declare-datatypes ((ListLongMap!15181 0))(
  ( (ListLongMap!15182 (toList!7606 List!23776)) )
))
(declare-fun lt!488133 () ListLongMap!15181)

(declare-fun zeroValue!831 () V!40937)

(declare-fun getCurrentListMap!4269 (array!70550 array!70548 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1092369 (= lt!488133 (getCurrentListMap!4269 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488135 () array!70550)

(declare-fun lt!488141 () ListLongMap!15181)

(declare-fun lt!488134 () array!70548)

(assert (=> b!1092369 (= lt!488141 (getCurrentListMap!4269 lt!488135 lt!488134 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488136 () ListLongMap!15181)

(declare-fun lt!488140 () ListLongMap!15181)

(assert (=> b!1092369 (and (= lt!488136 lt!488140) (= lt!488140 lt!488136))))

(declare-fun lt!488138 () ListLongMap!15181)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!878 (ListLongMap!15181 (_ BitVec 64)) ListLongMap!15181)

(assert (=> b!1092369 (= lt!488140 (-!878 lt!488138 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35791 0))(
  ( (Unit!35792) )
))
(declare-fun lt!488137 () Unit!35791)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!153 (array!70550 array!70548 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35791)

(assert (=> b!1092369 (= lt!488137 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!153 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4139 (array!70550 array!70548 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1092369 (= lt!488136 (getCurrentListMapNoExtraKeys!4139 lt!488135 lt!488134 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2210 (Int (_ BitVec 64)) V!40937)

(assert (=> b!1092369 (= lt!488134 (array!70549 (store (arr!33948 _values!874) i!650 (ValueCellFull!12719 (dynLambda!2210 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34486 _values!874)))))

(assert (=> b!1092369 (= lt!488138 (getCurrentListMapNoExtraKeys!4139 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092369 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488139 () Unit!35791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70550 (_ BitVec 64) (_ BitVec 32)) Unit!35791)

(assert (=> b!1092369 (= lt!488139 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092370 () Bool)

(declare-fun res!728932 () Bool)

(assert (=> b!1092370 (=> (not res!728932) (not e!623818))))

(assert (=> b!1092370 (= res!728932 (and (= (size!34486 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34487 _keys!1070) (size!34486 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092371 () Bool)

(declare-fun res!728935 () Bool)

(assert (=> b!1092371 (=> (not res!728935) (not e!623817))))

(declare-datatypes ((List!23777 0))(
  ( (Nil!23774) (Cons!23773 (h!24982 (_ BitVec 64)) (t!33681 List!23777)) )
))
(declare-fun arrayNoDuplicates!0 (array!70550 (_ BitVec 32) List!23777) Bool)

(assert (=> b!1092371 (= res!728935 (arrayNoDuplicates!0 lt!488135 #b00000000000000000000000000000000 Nil!23774))))

(declare-fun b!1092372 () Bool)

(declare-fun res!728933 () Bool)

(assert (=> b!1092372 (=> (not res!728933) (not e!623818))))

(assert (=> b!1092372 (= res!728933 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23774))))

(declare-fun b!1092373 () Bool)

(declare-fun tp_is_empty!26857 () Bool)

(assert (=> b!1092373 (= e!623819 tp_is_empty!26857)))

(declare-fun b!1092374 () Bool)

(declare-fun res!728937 () Bool)

(assert (=> b!1092374 (=> (not res!728937) (not e!623818))))

(assert (=> b!1092374 (= res!728937 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34487 _keys!1070))))))

(declare-fun b!1092375 () Bool)

(declare-fun res!728939 () Bool)

(assert (=> b!1092375 (=> (not res!728939) (not e!623818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092375 (= res!728939 (validKeyInArray!0 k0!904))))

(declare-fun b!1092376 () Bool)

(assert (=> b!1092376 (= e!623816 tp_is_empty!26857)))

(declare-fun b!1092377 () Bool)

(assert (=> b!1092377 (= e!623818 e!623817)))

(declare-fun res!728938 () Bool)

(assert (=> b!1092377 (=> (not res!728938) (not e!623817))))

(assert (=> b!1092377 (= res!728938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488135 mask!1414))))

(assert (=> b!1092377 (= lt!488135 (array!70551 (store (arr!33949 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34487 _keys!1070)))))

(declare-fun res!728934 () Bool)

(assert (=> start!96196 (=> (not res!728934) (not e!623818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96196 (= res!728934 (validMask!0 mask!1414))))

(assert (=> start!96196 e!623818))

(assert (=> start!96196 tp!80413))

(assert (=> start!96196 true))

(assert (=> start!96196 tp_is_empty!26857))

(declare-fun array_inv!26206 (array!70550) Bool)

(assert (=> start!96196 (array_inv!26206 _keys!1070)))

(declare-fun array_inv!26207 (array!70548) Bool)

(assert (=> start!96196 (and (array_inv!26207 _values!874) e!623815)))

(declare-fun b!1092366 () Bool)

(declare-fun res!728940 () Bool)

(assert (=> b!1092366 (=> (not res!728940) (not e!623818))))

(assert (=> b!1092366 (= res!728940 (= (select (arr!33949 _keys!1070) i!650) k0!904))))

(assert (= (and start!96196 res!728934) b!1092370))

(assert (= (and b!1092370 res!728932) b!1092368))

(assert (= (and b!1092368 res!728936) b!1092372))

(assert (= (and b!1092372 res!728933) b!1092374))

(assert (= (and b!1092374 res!728937) b!1092375))

(assert (= (and b!1092375 res!728939) b!1092366))

(assert (= (and b!1092366 res!728940) b!1092377))

(assert (= (and b!1092377 res!728938) b!1092371))

(assert (= (and b!1092371 res!728935) b!1092369))

(assert (= (and b!1092367 condMapEmpty!42040) mapIsEmpty!42040))

(assert (= (and b!1092367 (not condMapEmpty!42040)) mapNonEmpty!42040))

(get-info :version)

(assert (= (and mapNonEmpty!42040 ((_ is ValueCellFull!12719) mapValue!42040)) b!1092376))

(assert (= (and b!1092367 ((_ is ValueCellFull!12719) mapDefault!42040)) b!1092373))

(assert (= start!96196 b!1092367))

(declare-fun b_lambda!17503 () Bool)

(assert (=> (not b_lambda!17503) (not b!1092369)))

(declare-fun t!33679 () Bool)

(declare-fun tb!7725 () Bool)

(assert (=> (and start!96196 (= defaultEntry!882 defaultEntry!882) t!33679) tb!7725))

(declare-fun result!15977 () Bool)

(assert (=> tb!7725 (= result!15977 tp_is_empty!26857)))

(assert (=> b!1092369 t!33679))

(declare-fun b_and!36361 () Bool)

(assert (= b_and!36359 (and (=> t!33679 result!15977) b_and!36361)))

(declare-fun m!1011665 () Bool)

(assert (=> start!96196 m!1011665))

(declare-fun m!1011667 () Bool)

(assert (=> start!96196 m!1011667))

(declare-fun m!1011669 () Bool)

(assert (=> start!96196 m!1011669))

(declare-fun m!1011671 () Bool)

(assert (=> b!1092371 m!1011671))

(declare-fun m!1011673 () Bool)

(assert (=> b!1092369 m!1011673))

(declare-fun m!1011675 () Bool)

(assert (=> b!1092369 m!1011675))

(declare-fun m!1011677 () Bool)

(assert (=> b!1092369 m!1011677))

(declare-fun m!1011679 () Bool)

(assert (=> b!1092369 m!1011679))

(declare-fun m!1011681 () Bool)

(assert (=> b!1092369 m!1011681))

(declare-fun m!1011683 () Bool)

(assert (=> b!1092369 m!1011683))

(declare-fun m!1011685 () Bool)

(assert (=> b!1092369 m!1011685))

(declare-fun m!1011687 () Bool)

(assert (=> b!1092369 m!1011687))

(declare-fun m!1011689 () Bool)

(assert (=> b!1092369 m!1011689))

(declare-fun m!1011691 () Bool)

(assert (=> b!1092369 m!1011691))

(declare-fun m!1011693 () Bool)

(assert (=> b!1092372 m!1011693))

(declare-fun m!1011695 () Bool)

(assert (=> b!1092375 m!1011695))

(declare-fun m!1011697 () Bool)

(assert (=> b!1092377 m!1011697))

(declare-fun m!1011699 () Bool)

(assert (=> b!1092377 m!1011699))

(declare-fun m!1011701 () Bool)

(assert (=> b!1092366 m!1011701))

(declare-fun m!1011703 () Bool)

(assert (=> mapNonEmpty!42040 m!1011703))

(declare-fun m!1011705 () Bool)

(assert (=> b!1092368 m!1011705))

(check-sat (not b_lambda!17503) (not start!96196) (not mapNonEmpty!42040) (not b!1092372) (not b_next!22855) tp_is_empty!26857 (not b!1092375) (not b!1092369) (not b!1092377) (not b!1092368) (not b!1092371) b_and!36361)
(check-sat b_and!36361 (not b_next!22855))
