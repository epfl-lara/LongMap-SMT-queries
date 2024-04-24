; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100320 () Bool)

(assert start!100320)

(declare-fun b_free!25663 () Bool)

(declare-fun b_next!25663 () Bool)

(assert (=> start!100320 (= b_free!25663 (not b_next!25663))))

(declare-fun tp!89702 () Bool)

(declare-fun b_and!42195 () Bool)

(assert (=> start!100320 (= tp!89702 b_and!42195)))

(declare-fun b!1194543 () Bool)

(declare-fun e!679031 () Bool)

(declare-fun e!679030 () Bool)

(declare-fun mapRes!47117 () Bool)

(assert (=> b!1194543 (= e!679031 (and e!679030 mapRes!47117))))

(declare-fun condMapEmpty!47117 () Bool)

(declare-datatypes ((V!45385 0))(
  ( (V!45386 (val!15153 Int)) )
))
(declare-datatypes ((ValueCell!14387 0))(
  ( (ValueCellFull!14387 (v!17787 V!45385)) (EmptyCell!14387) )
))
(declare-datatypes ((array!77209 0))(
  ( (array!77210 (arr!37248 (Array (_ BitVec 32) ValueCell!14387)) (size!37785 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77209)

(declare-fun mapDefault!47117 () ValueCell!14387)

(assert (=> b!1194543 (= condMapEmpty!47117 (= (arr!37248 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14387)) mapDefault!47117)))))

(declare-fun b!1194544 () Bool)

(declare-fun res!794377 () Bool)

(declare-fun e!679027 () Bool)

(assert (=> b!1194544 (=> (not res!794377) (not e!679027))))

(declare-datatypes ((array!77211 0))(
  ( (array!77212 (arr!37249 (Array (_ BitVec 32) (_ BitVec 64))) (size!37786 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77211)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77211 (_ BitVec 32)) Bool)

(assert (=> b!1194544 (= res!794377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47117 () Bool)

(declare-fun tp!89703 () Bool)

(declare-fun e!679029 () Bool)

(assert (=> mapNonEmpty!47117 (= mapRes!47117 (and tp!89703 e!679029))))

(declare-fun mapKey!47117 () (_ BitVec 32))

(declare-fun mapValue!47117 () ValueCell!14387)

(declare-fun mapRest!47117 () (Array (_ BitVec 32) ValueCell!14387))

(assert (=> mapNonEmpty!47117 (= (arr!37248 _values!996) (store mapRest!47117 mapKey!47117 mapValue!47117))))

(declare-fun b!1194545 () Bool)

(declare-fun e!679034 () Bool)

(assert (=> b!1194545 (= e!679034 true)))

(declare-fun zeroValue!944 () V!45385)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!543011 () array!77209)

(declare-fun lt!543012 () array!77211)

(declare-fun minValue!944 () V!45385)

(declare-datatypes ((tuple2!19518 0))(
  ( (tuple2!19519 (_1!9770 (_ BitVec 64)) (_2!9770 V!45385)) )
))
(declare-datatypes ((List!26259 0))(
  ( (Nil!26256) (Cons!26255 (h!27473 tuple2!19518) (t!38906 List!26259)) )
))
(declare-datatypes ((ListLongMap!17495 0))(
  ( (ListLongMap!17496 (toList!8763 List!26259)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5231 (array!77211 array!77209 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) Int) ListLongMap!17495)

(declare-fun -!1766 (ListLongMap!17495 (_ BitVec 64)) ListLongMap!17495)

(assert (=> b!1194545 (= (getCurrentListMapNoExtraKeys!5231 lt!543012 lt!543011 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1766 (getCurrentListMapNoExtraKeys!5231 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39565 0))(
  ( (Unit!39566) )
))
(declare-fun lt!543015 () Unit!39565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 (array!77211 array!77209 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39565)

(assert (=> b!1194545 (= lt!543015 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194546 () Bool)

(declare-fun res!794385 () Bool)

(assert (=> b!1194546 (=> (not res!794385) (not e!679027))))

(assert (=> b!1194546 (= res!794385 (and (= (size!37785 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37786 _keys!1208) (size!37785 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47117 () Bool)

(assert (=> mapIsEmpty!47117 mapRes!47117))

(declare-fun b!1194547 () Bool)

(declare-fun res!794382 () Bool)

(assert (=> b!1194547 (=> (not res!794382) (not e!679027))))

(assert (=> b!1194547 (= res!794382 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37786 _keys!1208))))))

(declare-fun b!1194548 () Bool)

(declare-fun res!794386 () Bool)

(assert (=> b!1194548 (=> (not res!794386) (not e!679027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194548 (= res!794386 (validKeyInArray!0 k0!934))))

(declare-fun b!1194549 () Bool)

(declare-fun res!794380 () Bool)

(assert (=> b!1194549 (=> (not res!794380) (not e!679027))))

(declare-datatypes ((List!26260 0))(
  ( (Nil!26257) (Cons!26256 (h!27474 (_ BitVec 64)) (t!38907 List!26260)) )
))
(declare-fun arrayNoDuplicates!0 (array!77211 (_ BitVec 32) List!26260) Bool)

(assert (=> b!1194549 (= res!794380 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26257))))

(declare-fun b!1194550 () Bool)

(declare-fun res!794376 () Bool)

(declare-fun e!679028 () Bool)

(assert (=> b!1194550 (=> (not res!794376) (not e!679028))))

(assert (=> b!1194550 (= res!794376 (arrayNoDuplicates!0 lt!543012 #b00000000000000000000000000000000 Nil!26257))))

(declare-fun b!1194551 () Bool)

(declare-fun tp_is_empty!30193 () Bool)

(assert (=> b!1194551 (= e!679029 tp_is_empty!30193)))

(declare-fun res!794383 () Bool)

(assert (=> start!100320 (=> (not res!794383) (not e!679027))))

(assert (=> start!100320 (= res!794383 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37786 _keys!1208))))))

(assert (=> start!100320 e!679027))

(assert (=> start!100320 tp_is_empty!30193))

(declare-fun array_inv!28466 (array!77211) Bool)

(assert (=> start!100320 (array_inv!28466 _keys!1208)))

(assert (=> start!100320 true))

(assert (=> start!100320 tp!89702))

(declare-fun array_inv!28467 (array!77209) Bool)

(assert (=> start!100320 (and (array_inv!28467 _values!996) e!679031)))

(declare-fun b!1194552 () Bool)

(assert (=> b!1194552 (= e!679030 tp_is_empty!30193)))

(declare-fun b!1194553 () Bool)

(declare-fun e!679032 () Bool)

(assert (=> b!1194553 (= e!679032 e!679034)))

(declare-fun res!794387 () Bool)

(assert (=> b!1194553 (=> res!794387 e!679034)))

(assert (=> b!1194553 (= res!794387 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!543016 () ListLongMap!17495)

(assert (=> b!1194553 (= lt!543016 (getCurrentListMapNoExtraKeys!5231 lt!543012 lt!543011 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3180 (Int (_ BitVec 64)) V!45385)

(assert (=> b!1194553 (= lt!543011 (array!77210 (store (arr!37248 _values!996) i!673 (ValueCellFull!14387 (dynLambda!3180 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37785 _values!996)))))

(declare-fun lt!543013 () ListLongMap!17495)

(assert (=> b!1194553 (= lt!543013 (getCurrentListMapNoExtraKeys!5231 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194554 () Bool)

(declare-fun res!794379 () Bool)

(assert (=> b!1194554 (=> (not res!794379) (not e!679027))))

(assert (=> b!1194554 (= res!794379 (= (select (arr!37249 _keys!1208) i!673) k0!934))))

(declare-fun b!1194555 () Bool)

(declare-fun res!794381 () Bool)

(assert (=> b!1194555 (=> (not res!794381) (not e!679027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194555 (= res!794381 (validMask!0 mask!1564))))

(declare-fun b!1194556 () Bool)

(assert (=> b!1194556 (= e!679028 (not e!679032))))

(declare-fun res!794378 () Bool)

(assert (=> b!1194556 (=> res!794378 e!679032)))

(assert (=> b!1194556 (= res!794378 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194556 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543014 () Unit!39565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77211 (_ BitVec 64) (_ BitVec 32)) Unit!39565)

(assert (=> b!1194556 (= lt!543014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194557 () Bool)

(assert (=> b!1194557 (= e!679027 e!679028)))

(declare-fun res!794384 () Bool)

(assert (=> b!1194557 (=> (not res!794384) (not e!679028))))

(assert (=> b!1194557 (= res!794384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543012 mask!1564))))

(assert (=> b!1194557 (= lt!543012 (array!77212 (store (arr!37249 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37786 _keys!1208)))))

(assert (= (and start!100320 res!794383) b!1194555))

(assert (= (and b!1194555 res!794381) b!1194546))

(assert (= (and b!1194546 res!794385) b!1194544))

(assert (= (and b!1194544 res!794377) b!1194549))

(assert (= (and b!1194549 res!794380) b!1194547))

(assert (= (and b!1194547 res!794382) b!1194548))

(assert (= (and b!1194548 res!794386) b!1194554))

(assert (= (and b!1194554 res!794379) b!1194557))

(assert (= (and b!1194557 res!794384) b!1194550))

(assert (= (and b!1194550 res!794376) b!1194556))

(assert (= (and b!1194556 (not res!794378)) b!1194553))

(assert (= (and b!1194553 (not res!794387)) b!1194545))

(assert (= (and b!1194543 condMapEmpty!47117) mapIsEmpty!47117))

(assert (= (and b!1194543 (not condMapEmpty!47117)) mapNonEmpty!47117))

(get-info :version)

(assert (= (and mapNonEmpty!47117 ((_ is ValueCellFull!14387) mapValue!47117)) b!1194551))

(assert (= (and b!1194543 ((_ is ValueCellFull!14387) mapDefault!47117)) b!1194552))

(assert (= start!100320 b!1194543))

(declare-fun b_lambda!20801 () Bool)

(assert (=> (not b_lambda!20801) (not b!1194553)))

(declare-fun t!38905 () Bool)

(declare-fun tb!10467 () Bool)

(assert (=> (and start!100320 (= defaultEntry!1004 defaultEntry!1004) t!38905) tb!10467))

(declare-fun result!21509 () Bool)

(assert (=> tb!10467 (= result!21509 tp_is_empty!30193)))

(assert (=> b!1194553 t!38905))

(declare-fun b_and!42197 () Bool)

(assert (= b_and!42195 (and (=> t!38905 result!21509) b_and!42197)))

(declare-fun m!1103097 () Bool)

(assert (=> b!1194557 m!1103097))

(declare-fun m!1103099 () Bool)

(assert (=> b!1194557 m!1103099))

(declare-fun m!1103101 () Bool)

(assert (=> b!1194553 m!1103101))

(declare-fun m!1103103 () Bool)

(assert (=> b!1194553 m!1103103))

(declare-fun m!1103105 () Bool)

(assert (=> b!1194553 m!1103105))

(declare-fun m!1103107 () Bool)

(assert (=> b!1194553 m!1103107))

(declare-fun m!1103109 () Bool)

(assert (=> b!1194548 m!1103109))

(declare-fun m!1103111 () Bool)

(assert (=> b!1194544 m!1103111))

(declare-fun m!1103113 () Bool)

(assert (=> b!1194555 m!1103113))

(declare-fun m!1103115 () Bool)

(assert (=> b!1194545 m!1103115))

(declare-fun m!1103117 () Bool)

(assert (=> b!1194545 m!1103117))

(assert (=> b!1194545 m!1103117))

(declare-fun m!1103119 () Bool)

(assert (=> b!1194545 m!1103119))

(declare-fun m!1103121 () Bool)

(assert (=> b!1194545 m!1103121))

(declare-fun m!1103123 () Bool)

(assert (=> b!1194554 m!1103123))

(declare-fun m!1103125 () Bool)

(assert (=> b!1194556 m!1103125))

(declare-fun m!1103127 () Bool)

(assert (=> b!1194556 m!1103127))

(declare-fun m!1103129 () Bool)

(assert (=> b!1194550 m!1103129))

(declare-fun m!1103131 () Bool)

(assert (=> start!100320 m!1103131))

(declare-fun m!1103133 () Bool)

(assert (=> start!100320 m!1103133))

(declare-fun m!1103135 () Bool)

(assert (=> b!1194549 m!1103135))

(declare-fun m!1103137 () Bool)

(assert (=> mapNonEmpty!47117 m!1103137))

(check-sat (not b!1194544) (not b!1194545) (not b!1194549) (not mapNonEmpty!47117) (not b_next!25663) (not b!1194548) (not b!1194550) (not b_lambda!20801) tp_is_empty!30193 (not start!100320) (not b!1194553) (not b!1194555) (not b!1194557) b_and!42197 (not b!1194556))
(check-sat b_and!42197 (not b_next!25663))
