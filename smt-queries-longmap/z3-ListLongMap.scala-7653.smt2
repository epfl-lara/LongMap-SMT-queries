; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96474 () Bool)

(assert start!96474)

(declare-fun b_free!22891 () Bool)

(declare-fun b_next!22891 () Bool)

(assert (=> start!96474 (= b_free!22891 (not b_next!22891))))

(declare-fun tp!80522 () Bool)

(declare-fun b_and!36467 () Bool)

(assert (=> start!96474 (= tp!80522 b_and!36467)))

(declare-fun b!1094530 () Bool)

(declare-fun res!730016 () Bool)

(declare-fun e!625089 () Bool)

(assert (=> b!1094530 (=> (not res!730016) (not e!625089))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70731 0))(
  ( (array!70732 (arr!34033 (Array (_ BitVec 32) (_ BitVec 64))) (size!34570 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70731)

(assert (=> b!1094530 (= res!730016 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34570 _keys!1070))))))

(declare-datatypes ((V!40985 0))(
  ( (V!40986 (val!13503 Int)) )
))
(declare-datatypes ((tuple2!17182 0))(
  ( (tuple2!17183 (_1!8602 (_ BitVec 64)) (_2!8602 V!40985)) )
))
(declare-datatypes ((List!23776 0))(
  ( (Nil!23773) (Cons!23772 (h!24990 tuple2!17182) (t!33717 List!23776)) )
))
(declare-datatypes ((ListLongMap!15159 0))(
  ( (ListLongMap!15160 (toList!7595 List!23776)) )
))
(declare-fun lt!489345 () ListLongMap!15159)

(declare-fun lt!489339 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun e!625086 () Bool)

(declare-fun lt!489340 () ListLongMap!15159)

(declare-fun b!1094531 () Bool)

(assert (=> b!1094531 (= e!625086 (not (or (and (not lt!489339) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!489339) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!489339) (not (= lt!489340 lt!489345)) (bvsle #b00000000000000000000000000000000 (size!34570 _keys!1070)))))))

(assert (=> b!1094531 (= lt!489339 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40985)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40985)

(declare-fun lt!489341 () ListLongMap!15159)

(declare-datatypes ((ValueCell!12737 0))(
  ( (ValueCellFull!12737 (v!16120 V!40985)) (EmptyCell!12737) )
))
(declare-datatypes ((array!70733 0))(
  ( (array!70734 (arr!34034 (Array (_ BitVec 32) ValueCell!12737)) (size!34571 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70733)

(declare-fun getCurrentListMap!4343 (array!70731 array!70733 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) Int) ListLongMap!15159)

(assert (=> b!1094531 (= lt!489341 (getCurrentListMap!4343 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489336 () array!70731)

(declare-fun lt!489337 () array!70733)

(assert (=> b!1094531 (= lt!489340 (getCurrentListMap!4343 lt!489336 lt!489337 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489344 () ListLongMap!15159)

(assert (=> b!1094531 (and (= lt!489345 lt!489344) (= lt!489344 lt!489345))))

(declare-fun lt!489342 () ListLongMap!15159)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!900 (ListLongMap!15159 (_ BitVec 64)) ListLongMap!15159)

(assert (=> b!1094531 (= lt!489344 (-!900 lt!489342 k0!904))))

(declare-datatypes ((Unit!35967 0))(
  ( (Unit!35968) )
))
(declare-fun lt!489338 () Unit!35967)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 (array!70731 array!70733 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35967)

(assert (=> b!1094531 (= lt!489338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4148 (array!70731 array!70733 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) Int) ListLongMap!15159)

(assert (=> b!1094531 (= lt!489345 (getCurrentListMapNoExtraKeys!4148 lt!489336 lt!489337 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2269 (Int (_ BitVec 64)) V!40985)

(assert (=> b!1094531 (= lt!489337 (array!70734 (store (arr!34034 _values!874) i!650 (ValueCellFull!12737 (dynLambda!2269 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34571 _values!874)))))

(assert (=> b!1094531 (= lt!489342 (getCurrentListMapNoExtraKeys!4148 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094531 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489343 () Unit!35967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70731 (_ BitVec 64) (_ BitVec 32)) Unit!35967)

(assert (=> b!1094531 (= lt!489343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094532 () Bool)

(declare-fun res!730012 () Bool)

(assert (=> b!1094532 (=> (not res!730012) (not e!625089))))

(assert (=> b!1094532 (= res!730012 (= (select (arr!34033 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42094 () Bool)

(declare-fun mapRes!42094 () Bool)

(declare-fun tp!80521 () Bool)

(declare-fun e!625091 () Bool)

(assert (=> mapNonEmpty!42094 (= mapRes!42094 (and tp!80521 e!625091))))

(declare-fun mapKey!42094 () (_ BitVec 32))

(declare-fun mapRest!42094 () (Array (_ BitVec 32) ValueCell!12737))

(declare-fun mapValue!42094 () ValueCell!12737)

(assert (=> mapNonEmpty!42094 (= (arr!34034 _values!874) (store mapRest!42094 mapKey!42094 mapValue!42094))))

(declare-fun b!1094533 () Bool)

(assert (=> b!1094533 (= e!625089 e!625086)))

(declare-fun res!730011 () Bool)

(assert (=> b!1094533 (=> (not res!730011) (not e!625086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70731 (_ BitVec 32)) Bool)

(assert (=> b!1094533 (= res!730011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489336 mask!1414))))

(assert (=> b!1094533 (= lt!489336 (array!70732 (store (arr!34033 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34570 _keys!1070)))))

(declare-fun b!1094534 () Bool)

(declare-fun res!730017 () Bool)

(assert (=> b!1094534 (=> (not res!730017) (not e!625089))))

(assert (=> b!1094534 (= res!730017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42094 () Bool)

(assert (=> mapIsEmpty!42094 mapRes!42094))

(declare-fun b!1094535 () Bool)

(declare-fun e!625090 () Bool)

(declare-fun e!625087 () Bool)

(assert (=> b!1094535 (= e!625090 (and e!625087 mapRes!42094))))

(declare-fun condMapEmpty!42094 () Bool)

(declare-fun mapDefault!42094 () ValueCell!12737)

(assert (=> b!1094535 (= condMapEmpty!42094 (= (arr!34034 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12737)) mapDefault!42094)))))

(declare-fun b!1094536 () Bool)

(declare-fun tp_is_empty!26893 () Bool)

(assert (=> b!1094536 (= e!625087 tp_is_empty!26893)))

(declare-fun b!1094537 () Bool)

(declare-fun res!730009 () Bool)

(assert (=> b!1094537 (=> (not res!730009) (not e!625086))))

(declare-datatypes ((List!23777 0))(
  ( (Nil!23774) (Cons!23773 (h!24991 (_ BitVec 64)) (t!33718 List!23777)) )
))
(declare-fun arrayNoDuplicates!0 (array!70731 (_ BitVec 32) List!23777) Bool)

(assert (=> b!1094537 (= res!730009 (arrayNoDuplicates!0 lt!489336 #b00000000000000000000000000000000 Nil!23774))))

(declare-fun b!1094538 () Bool)

(assert (=> b!1094538 (= e!625091 tp_is_empty!26893)))

(declare-fun b!1094539 () Bool)

(declare-fun res!730015 () Bool)

(assert (=> b!1094539 (=> (not res!730015) (not e!625089))))

(assert (=> b!1094539 (= res!730015 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23774))))

(declare-fun b!1094540 () Bool)

(declare-fun res!730010 () Bool)

(assert (=> b!1094540 (=> (not res!730010) (not e!625089))))

(assert (=> b!1094540 (= res!730010 (and (= (size!34571 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34570 _keys!1070) (size!34571 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094541 () Bool)

(declare-fun res!730014 () Bool)

(assert (=> b!1094541 (=> (not res!730014) (not e!625089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094541 (= res!730014 (validKeyInArray!0 k0!904))))

(declare-fun res!730013 () Bool)

(assert (=> start!96474 (=> (not res!730013) (not e!625089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96474 (= res!730013 (validMask!0 mask!1414))))

(assert (=> start!96474 e!625089))

(assert (=> start!96474 tp!80522))

(assert (=> start!96474 true))

(assert (=> start!96474 tp_is_empty!26893))

(declare-fun array_inv!26270 (array!70731) Bool)

(assert (=> start!96474 (array_inv!26270 _keys!1070)))

(declare-fun array_inv!26271 (array!70733) Bool)

(assert (=> start!96474 (and (array_inv!26271 _values!874) e!625090)))

(assert (= (and start!96474 res!730013) b!1094540))

(assert (= (and b!1094540 res!730010) b!1094534))

(assert (= (and b!1094534 res!730017) b!1094539))

(assert (= (and b!1094539 res!730015) b!1094530))

(assert (= (and b!1094530 res!730016) b!1094541))

(assert (= (and b!1094541 res!730014) b!1094532))

(assert (= (and b!1094532 res!730012) b!1094533))

(assert (= (and b!1094533 res!730011) b!1094537))

(assert (= (and b!1094537 res!730009) b!1094531))

(assert (= (and b!1094535 condMapEmpty!42094) mapIsEmpty!42094))

(assert (= (and b!1094535 (not condMapEmpty!42094)) mapNonEmpty!42094))

(get-info :version)

(assert (= (and mapNonEmpty!42094 ((_ is ValueCellFull!12737) mapValue!42094)) b!1094538))

(assert (= (and b!1094535 ((_ is ValueCellFull!12737) mapDefault!42094)) b!1094536))

(assert (= start!96474 b!1094535))

(declare-fun b_lambda!17571 () Bool)

(assert (=> (not b_lambda!17571) (not b!1094531)))

(declare-fun t!33716 () Bool)

(declare-fun tb!7761 () Bool)

(assert (=> (and start!96474 (= defaultEntry!882 defaultEntry!882) t!33716) tb!7761))

(declare-fun result!16049 () Bool)

(assert (=> tb!7761 (= result!16049 tp_is_empty!26893)))

(assert (=> b!1094531 t!33716))

(declare-fun b_and!36469 () Bool)

(assert (= b_and!36467 (and (=> t!33716 result!16049) b_and!36469)))

(declare-fun m!1014719 () Bool)

(assert (=> b!1094541 m!1014719))

(declare-fun m!1014721 () Bool)

(assert (=> b!1094532 m!1014721))

(declare-fun m!1014723 () Bool)

(assert (=> b!1094539 m!1014723))

(declare-fun m!1014725 () Bool)

(assert (=> b!1094534 m!1014725))

(declare-fun m!1014727 () Bool)

(assert (=> b!1094531 m!1014727))

(declare-fun m!1014729 () Bool)

(assert (=> b!1094531 m!1014729))

(declare-fun m!1014731 () Bool)

(assert (=> b!1094531 m!1014731))

(declare-fun m!1014733 () Bool)

(assert (=> b!1094531 m!1014733))

(declare-fun m!1014735 () Bool)

(assert (=> b!1094531 m!1014735))

(declare-fun m!1014737 () Bool)

(assert (=> b!1094531 m!1014737))

(declare-fun m!1014739 () Bool)

(assert (=> b!1094531 m!1014739))

(declare-fun m!1014741 () Bool)

(assert (=> b!1094531 m!1014741))

(declare-fun m!1014743 () Bool)

(assert (=> b!1094531 m!1014743))

(declare-fun m!1014745 () Bool)

(assert (=> b!1094531 m!1014745))

(declare-fun m!1014747 () Bool)

(assert (=> b!1094537 m!1014747))

(declare-fun m!1014749 () Bool)

(assert (=> mapNonEmpty!42094 m!1014749))

(declare-fun m!1014751 () Bool)

(assert (=> start!96474 m!1014751))

(declare-fun m!1014753 () Bool)

(assert (=> start!96474 m!1014753))

(declare-fun m!1014755 () Bool)

(assert (=> start!96474 m!1014755))

(declare-fun m!1014757 () Bool)

(assert (=> b!1094533 m!1014757))

(declare-fun m!1014759 () Bool)

(assert (=> b!1094533 m!1014759))

(check-sat (not b!1094541) (not start!96474) (not b!1094539) (not b_next!22891) b_and!36469 (not b_lambda!17571) (not b!1094531) (not b!1094537) (not b!1094533) tp_is_empty!26893 (not mapNonEmpty!42094) (not b!1094534))
(check-sat b_and!36469 (not b_next!22891))
