; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100008 () Bool)

(assert start!100008)

(declare-fun b_free!25587 () Bool)

(declare-fun b_next!25587 () Bool)

(assert (=> start!100008 (= b_free!25587 (not b_next!25587))))

(declare-fun tp!89474 () Bool)

(declare-fun b_and!42041 () Bool)

(assert (=> start!100008 (= tp!89474 b_and!42041)))

(declare-fun b!1191468 () Bool)

(declare-fun res!792507 () Bool)

(declare-fun e!677286 () Bool)

(assert (=> b!1191468 (=> (not res!792507) (not e!677286))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191468 (= res!792507 (validMask!0 mask!1564))))

(declare-fun b!1191469 () Bool)

(declare-fun e!677289 () Bool)

(declare-fun tp_is_empty!30117 () Bool)

(assert (=> b!1191469 (= e!677289 tp_is_empty!30117)))

(declare-fun mapIsEmpty!47003 () Bool)

(declare-fun mapRes!47003 () Bool)

(assert (=> mapIsEmpty!47003 mapRes!47003))

(declare-fun b!1191471 () Bool)

(declare-fun e!677288 () Bool)

(assert (=> b!1191471 (= e!677286 e!677288)))

(declare-fun res!792500 () Bool)

(assert (=> b!1191471 (=> (not res!792500) (not e!677288))))

(declare-datatypes ((array!77025 0))(
  ( (array!77026 (arr!37162 (Array (_ BitVec 32) (_ BitVec 64))) (size!37698 (_ BitVec 32))) )
))
(declare-fun lt!541847 () array!77025)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77025 (_ BitVec 32)) Bool)

(assert (=> b!1191471 (= res!792500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541847 mask!1564))))

(declare-fun _keys!1208 () array!77025)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191471 (= lt!541847 (array!77026 (store (arr!37162 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37698 _keys!1208)))))

(declare-fun mapNonEmpty!47003 () Bool)

(declare-fun tp!89475 () Bool)

(assert (=> mapNonEmpty!47003 (= mapRes!47003 (and tp!89475 e!677289))))

(declare-datatypes ((V!45283 0))(
  ( (V!45284 (val!15115 Int)) )
))
(declare-datatypes ((ValueCell!14349 0))(
  ( (ValueCellFull!14349 (v!17753 V!45283)) (EmptyCell!14349) )
))
(declare-fun mapValue!47003 () ValueCell!14349)

(declare-fun mapRest!47003 () (Array (_ BitVec 32) ValueCell!14349))

(declare-datatypes ((array!77027 0))(
  ( (array!77028 (arr!37163 (Array (_ BitVec 32) ValueCell!14349)) (size!37699 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77027)

(declare-fun mapKey!47003 () (_ BitVec 32))

(assert (=> mapNonEmpty!47003 (= (arr!37163 _values!996) (store mapRest!47003 mapKey!47003 mapValue!47003))))

(declare-fun b!1191472 () Bool)

(declare-fun res!792505 () Bool)

(assert (=> b!1191472 (=> (not res!792505) (not e!677286))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191472 (= res!792505 (validKeyInArray!0 k0!934))))

(declare-fun b!1191473 () Bool)

(declare-fun e!677285 () Bool)

(assert (=> b!1191473 (= e!677288 (not e!677285))))

(declare-fun res!792511 () Bool)

(assert (=> b!1191473 (=> res!792511 e!677285)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191473 (= res!792511 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191473 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39522 0))(
  ( (Unit!39523) )
))
(declare-fun lt!541848 () Unit!39522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77025 (_ BitVec 64) (_ BitVec 32)) Unit!39522)

(assert (=> b!1191473 (= lt!541848 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191474 () Bool)

(declare-fun e!677290 () Bool)

(assert (=> b!1191474 (= e!677285 e!677290)))

(declare-fun res!792506 () Bool)

(assert (=> b!1191474 (=> res!792506 e!677290)))

(assert (=> b!1191474 (= res!792506 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45283)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541846 () array!77027)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19426 0))(
  ( (tuple2!19427 (_1!9724 (_ BitVec 64)) (_2!9724 V!45283)) )
))
(declare-datatypes ((List!26170 0))(
  ( (Nil!26167) (Cons!26166 (h!27375 tuple2!19426) (t!38749 List!26170)) )
))
(declare-datatypes ((ListLongMap!17395 0))(
  ( (ListLongMap!17396 (toList!8713 List!26170)) )
))
(declare-fun lt!541845 () ListLongMap!17395)

(declare-fun minValue!944 () V!45283)

(declare-fun getCurrentListMapNoExtraKeys!5154 (array!77025 array!77027 (_ BitVec 32) (_ BitVec 32) V!45283 V!45283 (_ BitVec 32) Int) ListLongMap!17395)

(assert (=> b!1191474 (= lt!541845 (getCurrentListMapNoExtraKeys!5154 lt!541847 lt!541846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3088 (Int (_ BitVec 64)) V!45283)

(assert (=> b!1191474 (= lt!541846 (array!77028 (store (arr!37163 _values!996) i!673 (ValueCellFull!14349 (dynLambda!3088 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37699 _values!996)))))

(declare-fun lt!541844 () ListLongMap!17395)

(assert (=> b!1191474 (= lt!541844 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!792504 () Bool)

(assert (=> start!100008 (=> (not res!792504) (not e!677286))))

(assert (=> start!100008 (= res!792504 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37698 _keys!1208))))))

(assert (=> start!100008 e!677286))

(assert (=> start!100008 tp_is_empty!30117))

(declare-fun array_inv!28340 (array!77025) Bool)

(assert (=> start!100008 (array_inv!28340 _keys!1208)))

(assert (=> start!100008 true))

(assert (=> start!100008 tp!89474))

(declare-fun e!677283 () Bool)

(declare-fun array_inv!28341 (array!77027) Bool)

(assert (=> start!100008 (and (array_inv!28341 _values!996) e!677283)))

(declare-fun b!1191470 () Bool)

(declare-fun res!792502 () Bool)

(assert (=> b!1191470 (=> (not res!792502) (not e!677288))))

(declare-datatypes ((List!26171 0))(
  ( (Nil!26168) (Cons!26167 (h!27376 (_ BitVec 64)) (t!38750 List!26171)) )
))
(declare-fun arrayNoDuplicates!0 (array!77025 (_ BitVec 32) List!26171) Bool)

(assert (=> b!1191470 (= res!792502 (arrayNoDuplicates!0 lt!541847 #b00000000000000000000000000000000 Nil!26168))))

(declare-fun b!1191475 () Bool)

(declare-fun res!792510 () Bool)

(assert (=> b!1191475 (=> (not res!792510) (not e!677286))))

(assert (=> b!1191475 (= res!792510 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26168))))

(declare-fun b!1191476 () Bool)

(declare-fun e!677287 () Bool)

(assert (=> b!1191476 (= e!677283 (and e!677287 mapRes!47003))))

(declare-fun condMapEmpty!47003 () Bool)

(declare-fun mapDefault!47003 () ValueCell!14349)

(assert (=> b!1191476 (= condMapEmpty!47003 (= (arr!37163 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14349)) mapDefault!47003)))))

(declare-fun b!1191477 () Bool)

(declare-fun res!792501 () Bool)

(assert (=> b!1191477 (=> (not res!792501) (not e!677286))))

(assert (=> b!1191477 (= res!792501 (= (select (arr!37162 _keys!1208) i!673) k0!934))))

(declare-fun b!1191478 () Bool)

(declare-fun res!792503 () Bool)

(assert (=> b!1191478 (=> (not res!792503) (not e!677286))))

(assert (=> b!1191478 (= res!792503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191479 () Bool)

(assert (=> b!1191479 (= e!677287 tp_is_empty!30117)))

(declare-fun b!1191480 () Bool)

(assert (=> b!1191480 (= e!677290 true)))

(declare-fun -!1738 (ListLongMap!17395 (_ BitVec 64)) ListLongMap!17395)

(assert (=> b!1191480 (= (getCurrentListMapNoExtraKeys!5154 lt!541847 lt!541846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1738 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541843 () Unit!39522)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!947 (array!77025 array!77027 (_ BitVec 32) (_ BitVec 32) V!45283 V!45283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39522)

(assert (=> b!1191480 (= lt!541843 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191481 () Bool)

(declare-fun res!792508 () Bool)

(assert (=> b!1191481 (=> (not res!792508) (not e!677286))))

(assert (=> b!1191481 (= res!792508 (and (= (size!37699 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37698 _keys!1208) (size!37699 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191482 () Bool)

(declare-fun res!792509 () Bool)

(assert (=> b!1191482 (=> (not res!792509) (not e!677286))))

(assert (=> b!1191482 (= res!792509 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37698 _keys!1208))))))

(assert (= (and start!100008 res!792504) b!1191468))

(assert (= (and b!1191468 res!792507) b!1191481))

(assert (= (and b!1191481 res!792508) b!1191478))

(assert (= (and b!1191478 res!792503) b!1191475))

(assert (= (and b!1191475 res!792510) b!1191482))

(assert (= (and b!1191482 res!792509) b!1191472))

(assert (= (and b!1191472 res!792505) b!1191477))

(assert (= (and b!1191477 res!792501) b!1191471))

(assert (= (and b!1191471 res!792500) b!1191470))

(assert (= (and b!1191470 res!792502) b!1191473))

(assert (= (and b!1191473 (not res!792511)) b!1191474))

(assert (= (and b!1191474 (not res!792506)) b!1191480))

(assert (= (and b!1191476 condMapEmpty!47003) mapIsEmpty!47003))

(assert (= (and b!1191476 (not condMapEmpty!47003)) mapNonEmpty!47003))

(get-info :version)

(assert (= (and mapNonEmpty!47003 ((_ is ValueCellFull!14349) mapValue!47003)) b!1191469))

(assert (= (and b!1191476 ((_ is ValueCellFull!14349) mapDefault!47003)) b!1191479))

(assert (= start!100008 b!1191476))

(declare-fun b_lambda!20731 () Bool)

(assert (=> (not b_lambda!20731) (not b!1191474)))

(declare-fun t!38748 () Bool)

(declare-fun tb!10399 () Bool)

(assert (=> (and start!100008 (= defaultEntry!1004 defaultEntry!1004) t!38748) tb!10399))

(declare-fun result!21365 () Bool)

(assert (=> tb!10399 (= result!21365 tp_is_empty!30117)))

(assert (=> b!1191474 t!38748))

(declare-fun b_and!42043 () Bool)

(assert (= b_and!42041 (and (=> t!38748 result!21365) b_and!42043)))

(declare-fun m!1099929 () Bool)

(assert (=> b!1191472 m!1099929))

(declare-fun m!1099931 () Bool)

(assert (=> b!1191480 m!1099931))

(declare-fun m!1099933 () Bool)

(assert (=> b!1191480 m!1099933))

(assert (=> b!1191480 m!1099933))

(declare-fun m!1099935 () Bool)

(assert (=> b!1191480 m!1099935))

(declare-fun m!1099937 () Bool)

(assert (=> b!1191480 m!1099937))

(declare-fun m!1099939 () Bool)

(assert (=> b!1191475 m!1099939))

(declare-fun m!1099941 () Bool)

(assert (=> b!1191477 m!1099941))

(declare-fun m!1099943 () Bool)

(assert (=> b!1191474 m!1099943))

(declare-fun m!1099945 () Bool)

(assert (=> b!1191474 m!1099945))

(declare-fun m!1099947 () Bool)

(assert (=> b!1191474 m!1099947))

(declare-fun m!1099949 () Bool)

(assert (=> b!1191474 m!1099949))

(declare-fun m!1099951 () Bool)

(assert (=> b!1191468 m!1099951))

(declare-fun m!1099953 () Bool)

(assert (=> b!1191470 m!1099953))

(declare-fun m!1099955 () Bool)

(assert (=> mapNonEmpty!47003 m!1099955))

(declare-fun m!1099957 () Bool)

(assert (=> b!1191473 m!1099957))

(declare-fun m!1099959 () Bool)

(assert (=> b!1191473 m!1099959))

(declare-fun m!1099961 () Bool)

(assert (=> b!1191471 m!1099961))

(declare-fun m!1099963 () Bool)

(assert (=> b!1191471 m!1099963))

(declare-fun m!1099965 () Bool)

(assert (=> start!100008 m!1099965))

(declare-fun m!1099967 () Bool)

(assert (=> start!100008 m!1099967))

(declare-fun m!1099969 () Bool)

(assert (=> b!1191478 m!1099969))

(check-sat (not b_lambda!20731) (not b!1191474) (not b!1191471) (not start!100008) b_and!42043 (not b_next!25587) (not b!1191473) (not b!1191472) (not b!1191480) (not b!1191475) (not b!1191468) (not b!1191478) (not mapNonEmpty!47003) (not b!1191470) tp_is_empty!30117)
(check-sat b_and!42043 (not b_next!25587))
