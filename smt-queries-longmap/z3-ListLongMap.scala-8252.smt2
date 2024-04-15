; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100454 () Bool)

(assert start!100454)

(declare-fun b_free!25783 () Bool)

(declare-fun b_next!25783 () Bool)

(assert (=> start!100454 (= b_free!25783 (not b_next!25783))))

(declare-fun tp!90338 () Bool)

(declare-fun b_and!42431 () Bool)

(assert (=> start!100454 (= tp!90338 b_and!42431)))

(declare-fun b!1199505 () Bool)

(declare-fun e!681257 () Bool)

(declare-fun e!681261 () Bool)

(declare-fun mapRes!47573 () Bool)

(assert (=> b!1199505 (= e!681257 (and e!681261 mapRes!47573))))

(declare-fun condMapEmpty!47573 () Bool)

(declare-datatypes ((V!45777 0))(
  ( (V!45778 (val!15300 Int)) )
))
(declare-datatypes ((ValueCell!14534 0))(
  ( (ValueCellFull!14534 (v!17937 V!45777)) (EmptyCell!14534) )
))
(declare-datatypes ((array!77678 0))(
  ( (array!77679 (arr!37484 (Array (_ BitVec 32) ValueCell!14534)) (size!38022 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77678)

(declare-fun mapDefault!47573 () ValueCell!14534)

(assert (=> b!1199505 (= condMapEmpty!47573 (= (arr!37484 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14534)) mapDefault!47573)))))

(declare-fun b!1199506 () Bool)

(declare-fun e!681260 () Bool)

(declare-fun tp_is_empty!30487 () Bool)

(assert (=> b!1199506 (= e!681260 tp_is_empty!30487)))

(declare-fun b!1199507 () Bool)

(declare-fun e!681262 () Bool)

(assert (=> b!1199507 (= e!681262 true)))

(declare-fun zeroValue!944 () V!45777)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19676 0))(
  ( (tuple2!19677 (_1!9849 (_ BitVec 64)) (_2!9849 V!45777)) )
))
(declare-datatypes ((List!26465 0))(
  ( (Nil!26462) (Cons!26461 (h!27670 tuple2!19676) (t!39219 List!26465)) )
))
(declare-datatypes ((ListLongMap!17645 0))(
  ( (ListLongMap!17646 (toList!8838 List!26465)) )
))
(declare-fun lt!543629 () ListLongMap!17645)

(declare-fun minValue!944 () V!45777)

(declare-datatypes ((array!77680 0))(
  ( (array!77681 (arr!37485 (Array (_ BitVec 32) (_ BitVec 64))) (size!38023 (_ BitVec 32))) )
))
(declare-fun lt!543628 () array!77680)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5287 (array!77680 array!77678 (_ BitVec 32) (_ BitVec 32) V!45777 V!45777 (_ BitVec 32) Int) ListLongMap!17645)

(declare-fun dynLambda!3167 (Int (_ BitVec 64)) V!45777)

(assert (=> b!1199507 (= lt!543629 (getCurrentListMapNoExtraKeys!5287 lt!543628 (array!77679 (store (arr!37484 _values!996) i!673 (ValueCellFull!14534 (dynLambda!3167 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38022 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77680)

(declare-fun lt!543630 () ListLongMap!17645)

(assert (=> b!1199507 (= lt!543630 (getCurrentListMapNoExtraKeys!5287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199508 () Bool)

(declare-fun e!681256 () Bool)

(declare-fun e!681258 () Bool)

(assert (=> b!1199508 (= e!681256 e!681258)))

(declare-fun res!798438 () Bool)

(assert (=> b!1199508 (=> (not res!798438) (not e!681258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77680 (_ BitVec 32)) Bool)

(assert (=> b!1199508 (= res!798438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543628 mask!1564))))

(assert (=> b!1199508 (= lt!543628 (array!77681 (store (arr!37485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38023 _keys!1208)))))

(declare-fun b!1199509 () Bool)

(declare-fun res!798439 () Bool)

(assert (=> b!1199509 (=> (not res!798439) (not e!681256))))

(assert (=> b!1199509 (= res!798439 (and (= (size!38022 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38023 _keys!1208) (size!38022 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199510 () Bool)

(assert (=> b!1199510 (= e!681258 (not e!681262))))

(declare-fun res!798437 () Bool)

(assert (=> b!1199510 (=> res!798437 e!681262)))

(assert (=> b!1199510 (= res!798437 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199510 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39631 0))(
  ( (Unit!39632) )
))
(declare-fun lt!543631 () Unit!39631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77680 (_ BitVec 64) (_ BitVec 32)) Unit!39631)

(assert (=> b!1199510 (= lt!543631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!798432 () Bool)

(assert (=> start!100454 (=> (not res!798432) (not e!681256))))

(assert (=> start!100454 (= res!798432 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38023 _keys!1208))))))

(assert (=> start!100454 e!681256))

(assert (=> start!100454 tp_is_empty!30487))

(declare-fun array_inv!28682 (array!77680) Bool)

(assert (=> start!100454 (array_inv!28682 _keys!1208)))

(assert (=> start!100454 true))

(assert (=> start!100454 tp!90338))

(declare-fun array_inv!28683 (array!77678) Bool)

(assert (=> start!100454 (and (array_inv!28683 _values!996) e!681257)))

(declare-fun b!1199504 () Bool)

(declare-fun res!798441 () Bool)

(assert (=> b!1199504 (=> (not res!798441) (not e!681256))))

(assert (=> b!1199504 (= res!798441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199511 () Bool)

(declare-fun res!798434 () Bool)

(assert (=> b!1199511 (=> (not res!798434) (not e!681256))))

(assert (=> b!1199511 (= res!798434 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38023 _keys!1208))))))

(declare-fun b!1199512 () Bool)

(declare-fun res!798433 () Bool)

(assert (=> b!1199512 (=> (not res!798433) (not e!681256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199512 (= res!798433 (validKeyInArray!0 k0!934))))

(declare-fun b!1199513 () Bool)

(declare-fun res!798435 () Bool)

(assert (=> b!1199513 (=> (not res!798435) (not e!681256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199513 (= res!798435 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47573 () Bool)

(declare-fun tp!90339 () Bool)

(assert (=> mapNonEmpty!47573 (= mapRes!47573 (and tp!90339 e!681260))))

(declare-fun mapKey!47573 () (_ BitVec 32))

(declare-fun mapValue!47573 () ValueCell!14534)

(declare-fun mapRest!47573 () (Array (_ BitVec 32) ValueCell!14534))

(assert (=> mapNonEmpty!47573 (= (arr!37484 _values!996) (store mapRest!47573 mapKey!47573 mapValue!47573))))

(declare-fun b!1199514 () Bool)

(declare-fun res!798440 () Bool)

(assert (=> b!1199514 (=> (not res!798440) (not e!681258))))

(declare-datatypes ((List!26466 0))(
  ( (Nil!26463) (Cons!26462 (h!27671 (_ BitVec 64)) (t!39220 List!26466)) )
))
(declare-fun arrayNoDuplicates!0 (array!77680 (_ BitVec 32) List!26466) Bool)

(assert (=> b!1199514 (= res!798440 (arrayNoDuplicates!0 lt!543628 #b00000000000000000000000000000000 Nil!26463))))

(declare-fun mapIsEmpty!47573 () Bool)

(assert (=> mapIsEmpty!47573 mapRes!47573))

(declare-fun b!1199515 () Bool)

(declare-fun res!798436 () Bool)

(assert (=> b!1199515 (=> (not res!798436) (not e!681256))))

(assert (=> b!1199515 (= res!798436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26463))))

(declare-fun b!1199516 () Bool)

(declare-fun res!798431 () Bool)

(assert (=> b!1199516 (=> (not res!798431) (not e!681256))))

(assert (=> b!1199516 (= res!798431 (= (select (arr!37485 _keys!1208) i!673) k0!934))))

(declare-fun b!1199517 () Bool)

(assert (=> b!1199517 (= e!681261 tp_is_empty!30487)))

(assert (= (and start!100454 res!798432) b!1199513))

(assert (= (and b!1199513 res!798435) b!1199509))

(assert (= (and b!1199509 res!798439) b!1199504))

(assert (= (and b!1199504 res!798441) b!1199515))

(assert (= (and b!1199515 res!798436) b!1199511))

(assert (= (and b!1199511 res!798434) b!1199512))

(assert (= (and b!1199512 res!798433) b!1199516))

(assert (= (and b!1199516 res!798431) b!1199508))

(assert (= (and b!1199508 res!798438) b!1199514))

(assert (= (and b!1199514 res!798440) b!1199510))

(assert (= (and b!1199510 (not res!798437)) b!1199507))

(assert (= (and b!1199505 condMapEmpty!47573) mapIsEmpty!47573))

(assert (= (and b!1199505 (not condMapEmpty!47573)) mapNonEmpty!47573))

(get-info :version)

(assert (= (and mapNonEmpty!47573 ((_ is ValueCellFull!14534) mapValue!47573)) b!1199506))

(assert (= (and b!1199505 ((_ is ValueCellFull!14534) mapDefault!47573)) b!1199517))

(assert (= start!100454 b!1199505))

(declare-fun b_lambda!20961 () Bool)

(assert (=> (not b_lambda!20961) (not b!1199507)))

(declare-fun t!39218 () Bool)

(declare-fun tb!10575 () Bool)

(assert (=> (and start!100454 (= defaultEntry!1004 defaultEntry!1004) t!39218) tb!10575))

(declare-fun result!21735 () Bool)

(assert (=> tb!10575 (= result!21735 tp_is_empty!30487)))

(assert (=> b!1199507 t!39218))

(declare-fun b_and!42433 () Bool)

(assert (= b_and!42431 (and (=> t!39218 result!21735) b_and!42433)))

(declare-fun m!1105513 () Bool)

(assert (=> b!1199508 m!1105513))

(declare-fun m!1105515 () Bool)

(assert (=> b!1199508 m!1105515))

(declare-fun m!1105517 () Bool)

(assert (=> b!1199514 m!1105517))

(declare-fun m!1105519 () Bool)

(assert (=> b!1199513 m!1105519))

(declare-fun m!1105521 () Bool)

(assert (=> b!1199510 m!1105521))

(declare-fun m!1105523 () Bool)

(assert (=> b!1199510 m!1105523))

(declare-fun m!1105525 () Bool)

(assert (=> b!1199515 m!1105525))

(declare-fun m!1105527 () Bool)

(assert (=> start!100454 m!1105527))

(declare-fun m!1105529 () Bool)

(assert (=> start!100454 m!1105529))

(declare-fun m!1105531 () Bool)

(assert (=> b!1199516 m!1105531))

(declare-fun m!1105533 () Bool)

(assert (=> mapNonEmpty!47573 m!1105533))

(declare-fun m!1105535 () Bool)

(assert (=> b!1199504 m!1105535))

(declare-fun m!1105537 () Bool)

(assert (=> b!1199507 m!1105537))

(declare-fun m!1105539 () Bool)

(assert (=> b!1199507 m!1105539))

(declare-fun m!1105541 () Bool)

(assert (=> b!1199507 m!1105541))

(declare-fun m!1105543 () Bool)

(assert (=> b!1199507 m!1105543))

(declare-fun m!1105545 () Bool)

(assert (=> b!1199512 m!1105545))

(check-sat b_and!42433 (not mapNonEmpty!47573) tp_is_empty!30487 (not b!1199513) (not start!100454) (not b!1199512) (not b!1199515) (not b_lambda!20961) (not b_next!25783) (not b!1199514) (not b!1199508) (not b!1199504) (not b!1199507) (not b!1199510))
(check-sat b_and!42433 (not b_next!25783))
