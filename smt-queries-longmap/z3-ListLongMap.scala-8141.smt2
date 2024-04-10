; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99714 () Bool)

(assert start!99714)

(declare-fun b_free!25293 () Bool)

(declare-fun b_next!25293 () Bool)

(assert (=> start!99714 (= b_free!25293 (not b_next!25293))))

(declare-fun tp!88592 () Bool)

(declare-fun b_and!41453 () Bool)

(assert (=> start!99714 (= tp!88592 b_and!41453)))

(declare-fun mapIsEmpty!46562 () Bool)

(declare-fun mapRes!46562 () Bool)

(assert (=> mapIsEmpty!46562 mapRes!46562))

(declare-fun b!1183369 () Bool)

(declare-datatypes ((Unit!39163 0))(
  ( (Unit!39164) )
))
(declare-fun e!672810 () Unit!39163)

(declare-fun Unit!39165 () Unit!39163)

(assert (=> b!1183369 (= e!672810 Unit!39165)))

(declare-datatypes ((array!76447 0))(
  ( (array!76448 (arr!36873 (Array (_ BitVec 32) (_ BitVec 64))) (size!37409 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76447)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536120 () Unit!39163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39163)

(assert (=> b!1183369 (= lt!536120 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183369 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536116 () Unit!39163)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76447 (_ BitVec 32) (_ BitVec 32)) Unit!39163)

(assert (=> b!1183369 (= lt!536116 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25929 0))(
  ( (Nil!25926) (Cons!25925 (h!27134 (_ BitVec 64)) (t!38214 List!25929)) )
))
(declare-fun arrayNoDuplicates!0 (array!76447 (_ BitVec 32) List!25929) Bool)

(assert (=> b!1183369 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25926)))

(declare-fun lt!536110 () Unit!39163)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76447 (_ BitVec 64) (_ BitVec 32) List!25929) Unit!39163)

(assert (=> b!1183369 (= lt!536110 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25926))))

(assert (=> b!1183369 false))

(declare-fun b!1183370 () Bool)

(declare-fun res!786498 () Bool)

(declare-fun e!672811 () Bool)

(assert (=> b!1183370 (=> (not res!786498) (not e!672811))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183370 (= res!786498 (validMask!0 mask!1564))))

(declare-fun b!1183371 () Bool)

(declare-fun Unit!39166 () Unit!39163)

(assert (=> b!1183371 (= e!672810 Unit!39166)))

(declare-fun b!1183372 () Bool)

(declare-fun res!786496 () Bool)

(assert (=> b!1183372 (=> (not res!786496) (not e!672811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76447 (_ BitVec 32)) Bool)

(assert (=> b!1183372 (= res!786496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183373 () Bool)

(declare-fun e!672803 () Bool)

(declare-fun e!672814 () Bool)

(assert (=> b!1183373 (= e!672803 e!672814)))

(declare-fun res!786502 () Bool)

(assert (=> b!1183373 (=> res!786502 e!672814)))

(assert (=> b!1183373 (= res!786502 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44891 0))(
  ( (V!44892 (val!14968 Int)) )
))
(declare-fun zeroValue!944 () V!44891)

(declare-fun lt!536105 () array!76447)

(declare-datatypes ((ValueCell!14202 0))(
  ( (ValueCellFull!14202 (v!17606 V!44891)) (EmptyCell!14202) )
))
(declare-datatypes ((array!76449 0))(
  ( (array!76450 (arr!36874 (Array (_ BitVec 32) ValueCell!14202)) (size!37410 (_ BitVec 32))) )
))
(declare-fun lt!536104 () array!76449)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44891)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19190 0))(
  ( (tuple2!19191 (_1!9606 (_ BitVec 64)) (_2!9606 V!44891)) )
))
(declare-datatypes ((List!25930 0))(
  ( (Nil!25927) (Cons!25926 (h!27135 tuple2!19190) (t!38215 List!25930)) )
))
(declare-datatypes ((ListLongMap!17159 0))(
  ( (ListLongMap!17160 (toList!8595 List!25930)) )
))
(declare-fun lt!536119 () ListLongMap!17159)

(declare-fun getCurrentListMapNoExtraKeys!5046 (array!76447 array!76449 (_ BitVec 32) (_ BitVec 32) V!44891 V!44891 (_ BitVec 32) Int) ListLongMap!17159)

(assert (=> b!1183373 (= lt!536119 (getCurrentListMapNoExtraKeys!5046 lt!536105 lt!536104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76449)

(declare-fun lt!536108 () V!44891)

(assert (=> b!1183373 (= lt!536104 (array!76450 (store (arr!36874 _values!996) i!673 (ValueCellFull!14202 lt!536108)) (size!37410 _values!996)))))

(declare-fun dynLambda!2997 (Int (_ BitVec 64)) V!44891)

(assert (=> b!1183373 (= lt!536108 (dynLambda!2997 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536107 () ListLongMap!17159)

(assert (=> b!1183373 (= lt!536107 (getCurrentListMapNoExtraKeys!5046 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183374 () Bool)

(declare-fun e!672812 () Bool)

(declare-fun e!672804 () Bool)

(assert (=> b!1183374 (= e!672812 e!672804)))

(declare-fun res!786500 () Bool)

(assert (=> b!1183374 (=> res!786500 e!672804)))

(assert (=> b!1183374 (= res!786500 (not (= (select (arr!36873 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183375 () Bool)

(declare-fun res!786495 () Bool)

(assert (=> b!1183375 (=> (not res!786495) (not e!672811))))

(assert (=> b!1183375 (= res!786495 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25926))))

(declare-fun b!1183376 () Bool)

(declare-fun res!786504 () Bool)

(assert (=> b!1183376 (=> (not res!786504) (not e!672811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183376 (= res!786504 (validKeyInArray!0 k0!934))))

(declare-fun b!1183377 () Bool)

(declare-fun e!672813 () Bool)

(assert (=> b!1183377 (= e!672811 e!672813)))

(declare-fun res!786503 () Bool)

(assert (=> b!1183377 (=> (not res!786503) (not e!672813))))

(assert (=> b!1183377 (= res!786503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536105 mask!1564))))

(assert (=> b!1183377 (= lt!536105 (array!76448 (store (arr!36873 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37409 _keys!1208)))))

(declare-fun b!1183378 () Bool)

(declare-fun e!672807 () Bool)

(declare-fun tp_is_empty!29823 () Bool)

(assert (=> b!1183378 (= e!672807 tp_is_empty!29823)))

(declare-fun b!1183379 () Bool)

(declare-fun e!672808 () Bool)

(assert (=> b!1183379 (= e!672814 e!672808)))

(declare-fun res!786506 () Bool)

(assert (=> b!1183379 (=> res!786506 e!672808)))

(assert (=> b!1183379 (= res!786506 (not (validKeyInArray!0 (select (arr!36873 _keys!1208) from!1455))))))

(declare-fun lt!536117 () ListLongMap!17159)

(declare-fun lt!536114 () ListLongMap!17159)

(assert (=> b!1183379 (= lt!536117 lt!536114)))

(declare-fun lt!536103 () ListLongMap!17159)

(declare-fun -!1630 (ListLongMap!17159 (_ BitVec 64)) ListLongMap!17159)

(assert (=> b!1183379 (= lt!536114 (-!1630 lt!536103 k0!934))))

(assert (=> b!1183379 (= lt!536117 (getCurrentListMapNoExtraKeys!5046 lt!536105 lt!536104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183379 (= lt!536103 (getCurrentListMapNoExtraKeys!5046 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536113 () Unit!39163)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!852 (array!76447 array!76449 (_ BitVec 32) (_ BitVec 32) V!44891 V!44891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39163)

(assert (=> b!1183379 (= lt!536113 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!852 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183381 () Bool)

(declare-fun res!786505 () Bool)

(assert (=> b!1183381 (=> (not res!786505) (not e!672811))))

(assert (=> b!1183381 (= res!786505 (and (= (size!37410 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37409 _keys!1208) (size!37410 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183382 () Bool)

(declare-fun res!786507 () Bool)

(assert (=> b!1183382 (=> (not res!786507) (not e!672813))))

(assert (=> b!1183382 (= res!786507 (arrayNoDuplicates!0 lt!536105 #b00000000000000000000000000000000 Nil!25926))))

(declare-fun b!1183383 () Bool)

(declare-fun res!786494 () Bool)

(assert (=> b!1183383 (=> (not res!786494) (not e!672811))))

(assert (=> b!1183383 (= res!786494 (= (select (arr!36873 _keys!1208) i!673) k0!934))))

(declare-fun b!1183384 () Bool)

(assert (=> b!1183384 (= e!672813 (not e!672803))))

(declare-fun res!786499 () Bool)

(assert (=> b!1183384 (=> res!786499 e!672803)))

(assert (=> b!1183384 (= res!786499 (bvsgt from!1455 i!673))))

(assert (=> b!1183384 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536111 () Unit!39163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76447 (_ BitVec 64) (_ BitVec 32)) Unit!39163)

(assert (=> b!1183384 (= lt!536111 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183385 () Bool)

(declare-fun e!672805 () Bool)

(assert (=> b!1183385 (= e!672805 tp_is_empty!29823)))

(declare-fun b!1183386 () Bool)

(declare-fun res!786508 () Bool)

(assert (=> b!1183386 (=> (not res!786508) (not e!672811))))

(assert (=> b!1183386 (= res!786508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37409 _keys!1208))))))

(declare-fun b!1183387 () Bool)

(assert (=> b!1183387 (= e!672808 true)))

(declare-fun lt!536121 () ListLongMap!17159)

(declare-fun lt!536109 () ListLongMap!17159)

(assert (=> b!1183387 (= (-!1630 lt!536121 k0!934) lt!536109)))

(declare-fun lt!536106 () V!44891)

(declare-fun lt!536118 () Unit!39163)

(declare-fun addRemoveCommutativeForDiffKeys!156 (ListLongMap!17159 (_ BitVec 64) V!44891 (_ BitVec 64)) Unit!39163)

(assert (=> b!1183387 (= lt!536118 (addRemoveCommutativeForDiffKeys!156 lt!536103 (select (arr!36873 _keys!1208) from!1455) lt!536106 k0!934))))

(assert (=> b!1183387 (and (= lt!536107 lt!536121) (= lt!536114 lt!536117))))

(declare-fun lt!536115 () tuple2!19190)

(declare-fun +!3893 (ListLongMap!17159 tuple2!19190) ListLongMap!17159)

(assert (=> b!1183387 (= lt!536121 (+!3893 lt!536103 lt!536115))))

(assert (=> b!1183387 (not (= (select (arr!36873 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536112 () Unit!39163)

(assert (=> b!1183387 (= lt!536112 e!672810)))

(declare-fun c!117063 () Bool)

(assert (=> b!1183387 (= c!117063 (= (select (arr!36873 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183387 e!672812))

(declare-fun res!786497 () Bool)

(assert (=> b!1183387 (=> (not res!786497) (not e!672812))))

(assert (=> b!1183387 (= res!786497 (= lt!536119 lt!536109))))

(assert (=> b!1183387 (= lt!536109 (+!3893 lt!536114 lt!536115))))

(assert (=> b!1183387 (= lt!536115 (tuple2!19191 (select (arr!36873 _keys!1208) from!1455) lt!536106))))

(declare-fun get!18864 (ValueCell!14202 V!44891) V!44891)

(assert (=> b!1183387 (= lt!536106 (get!18864 (select (arr!36874 _values!996) from!1455) lt!536108))))

(declare-fun mapNonEmpty!46562 () Bool)

(declare-fun tp!88593 () Bool)

(assert (=> mapNonEmpty!46562 (= mapRes!46562 (and tp!88593 e!672805))))

(declare-fun mapValue!46562 () ValueCell!14202)

(declare-fun mapRest!46562 () (Array (_ BitVec 32) ValueCell!14202))

(declare-fun mapKey!46562 () (_ BitVec 32))

(assert (=> mapNonEmpty!46562 (= (arr!36874 _values!996) (store mapRest!46562 mapKey!46562 mapValue!46562))))

(declare-fun b!1183388 () Bool)

(declare-fun e!672806 () Bool)

(assert (=> b!1183388 (= e!672806 (and e!672807 mapRes!46562))))

(declare-fun condMapEmpty!46562 () Bool)

(declare-fun mapDefault!46562 () ValueCell!14202)

(assert (=> b!1183388 (= condMapEmpty!46562 (= (arr!36874 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14202)) mapDefault!46562)))))

(declare-fun b!1183380 () Bool)

(assert (=> b!1183380 (= e!672804 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!786501 () Bool)

(assert (=> start!99714 (=> (not res!786501) (not e!672811))))

(assert (=> start!99714 (= res!786501 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37409 _keys!1208))))))

(assert (=> start!99714 e!672811))

(assert (=> start!99714 tp_is_empty!29823))

(declare-fun array_inv!28146 (array!76447) Bool)

(assert (=> start!99714 (array_inv!28146 _keys!1208)))

(assert (=> start!99714 true))

(assert (=> start!99714 tp!88592))

(declare-fun array_inv!28147 (array!76449) Bool)

(assert (=> start!99714 (and (array_inv!28147 _values!996) e!672806)))

(assert (= (and start!99714 res!786501) b!1183370))

(assert (= (and b!1183370 res!786498) b!1183381))

(assert (= (and b!1183381 res!786505) b!1183372))

(assert (= (and b!1183372 res!786496) b!1183375))

(assert (= (and b!1183375 res!786495) b!1183386))

(assert (= (and b!1183386 res!786508) b!1183376))

(assert (= (and b!1183376 res!786504) b!1183383))

(assert (= (and b!1183383 res!786494) b!1183377))

(assert (= (and b!1183377 res!786503) b!1183382))

(assert (= (and b!1183382 res!786507) b!1183384))

(assert (= (and b!1183384 (not res!786499)) b!1183373))

(assert (= (and b!1183373 (not res!786502)) b!1183379))

(assert (= (and b!1183379 (not res!786506)) b!1183387))

(assert (= (and b!1183387 res!786497) b!1183374))

(assert (= (and b!1183374 (not res!786500)) b!1183380))

(assert (= (and b!1183387 c!117063) b!1183369))

(assert (= (and b!1183387 (not c!117063)) b!1183371))

(assert (= (and b!1183388 condMapEmpty!46562) mapIsEmpty!46562))

(assert (= (and b!1183388 (not condMapEmpty!46562)) mapNonEmpty!46562))

(get-info :version)

(assert (= (and mapNonEmpty!46562 ((_ is ValueCellFull!14202) mapValue!46562)) b!1183385))

(assert (= (and b!1183388 ((_ is ValueCellFull!14202) mapDefault!46562)) b!1183378))

(assert (= start!99714 b!1183388))

(declare-fun b_lambda!20437 () Bool)

(assert (=> (not b_lambda!20437) (not b!1183373)))

(declare-fun t!38213 () Bool)

(declare-fun tb!10105 () Bool)

(assert (=> (and start!99714 (= defaultEntry!1004 defaultEntry!1004) t!38213) tb!10105))

(declare-fun result!20777 () Bool)

(assert (=> tb!10105 (= result!20777 tp_is_empty!29823)))

(assert (=> b!1183373 t!38213))

(declare-fun b_and!41455 () Bool)

(assert (= b_and!41453 (and (=> t!38213 result!20777) b_and!41455)))

(declare-fun m!1091515 () Bool)

(assert (=> b!1183379 m!1091515))

(declare-fun m!1091517 () Bool)

(assert (=> b!1183379 m!1091517))

(declare-fun m!1091519 () Bool)

(assert (=> b!1183379 m!1091519))

(declare-fun m!1091521 () Bool)

(assert (=> b!1183379 m!1091521))

(declare-fun m!1091523 () Bool)

(assert (=> b!1183379 m!1091523))

(declare-fun m!1091525 () Bool)

(assert (=> b!1183379 m!1091525))

(assert (=> b!1183379 m!1091523))

(declare-fun m!1091527 () Bool)

(assert (=> b!1183376 m!1091527))

(declare-fun m!1091529 () Bool)

(assert (=> b!1183377 m!1091529))

(declare-fun m!1091531 () Bool)

(assert (=> b!1183377 m!1091531))

(declare-fun m!1091533 () Bool)

(assert (=> b!1183380 m!1091533))

(declare-fun m!1091535 () Bool)

(assert (=> start!99714 m!1091535))

(declare-fun m!1091537 () Bool)

(assert (=> start!99714 m!1091537))

(declare-fun m!1091539 () Bool)

(assert (=> b!1183375 m!1091539))

(declare-fun m!1091541 () Bool)

(assert (=> b!1183384 m!1091541))

(declare-fun m!1091543 () Bool)

(assert (=> b!1183384 m!1091543))

(declare-fun m!1091545 () Bool)

(assert (=> b!1183382 m!1091545))

(assert (=> b!1183374 m!1091523))

(declare-fun m!1091547 () Bool)

(assert (=> b!1183372 m!1091547))

(declare-fun m!1091549 () Bool)

(assert (=> b!1183383 m!1091549))

(declare-fun m!1091551 () Bool)

(assert (=> b!1183387 m!1091551))

(declare-fun m!1091553 () Bool)

(assert (=> b!1183387 m!1091553))

(assert (=> b!1183387 m!1091523))

(declare-fun m!1091555 () Bool)

(assert (=> b!1183387 m!1091555))

(assert (=> b!1183387 m!1091551))

(declare-fun m!1091557 () Bool)

(assert (=> b!1183387 m!1091557))

(declare-fun m!1091559 () Bool)

(assert (=> b!1183387 m!1091559))

(declare-fun m!1091561 () Bool)

(assert (=> b!1183387 m!1091561))

(assert (=> b!1183387 m!1091523))

(declare-fun m!1091563 () Bool)

(assert (=> b!1183370 m!1091563))

(declare-fun m!1091565 () Bool)

(assert (=> b!1183373 m!1091565))

(declare-fun m!1091567 () Bool)

(assert (=> b!1183373 m!1091567))

(declare-fun m!1091569 () Bool)

(assert (=> b!1183373 m!1091569))

(declare-fun m!1091571 () Bool)

(assert (=> b!1183373 m!1091571))

(declare-fun m!1091573 () Bool)

(assert (=> mapNonEmpty!46562 m!1091573))

(declare-fun m!1091575 () Bool)

(assert (=> b!1183369 m!1091575))

(declare-fun m!1091577 () Bool)

(assert (=> b!1183369 m!1091577))

(declare-fun m!1091579 () Bool)

(assert (=> b!1183369 m!1091579))

(declare-fun m!1091581 () Bool)

(assert (=> b!1183369 m!1091581))

(declare-fun m!1091583 () Bool)

(assert (=> b!1183369 m!1091583))

(check-sat (not b!1183377) (not b!1183379) (not b!1183382) (not b_next!25293) b_and!41455 (not b!1183373) (not b!1183372) tp_is_empty!29823 (not b!1183387) (not b!1183376) (not b!1183370) (not start!99714) (not b!1183375) (not b_lambda!20437) (not b!1183380) (not b!1183384) (not mapNonEmpty!46562) (not b!1183369))
(check-sat b_and!41455 (not b_next!25293))
