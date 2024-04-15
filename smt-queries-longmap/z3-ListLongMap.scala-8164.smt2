; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99844 () Bool)

(assert start!99844)

(declare-fun b_free!25429 () Bool)

(declare-fun b_next!25429 () Bool)

(assert (=> start!99844 (= b_free!25429 (not b_next!25429))))

(declare-fun tp!89000 () Bool)

(declare-fun b_and!41703 () Bool)

(assert (=> start!99844 (= tp!89000 b_and!41703)))

(declare-fun b!1187461 () Bool)

(declare-fun res!789488 () Bool)

(declare-fun e!675175 () Bool)

(assert (=> b!1187461 (=> (not res!789488) (not e!675175))))

(declare-datatypes ((array!76652 0))(
  ( (array!76653 (arr!36976 (Array (_ BitVec 32) (_ BitVec 64))) (size!37514 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76652)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76652 (_ BitVec 32)) Bool)

(assert (=> b!1187461 (= res!789488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187462 () Bool)

(declare-fun res!789490 () Bool)

(assert (=> b!1187462 (=> (not res!789490) (not e!675175))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187462 (= res!789490 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37514 _keys!1208))))))

(declare-fun b!1187463 () Bool)

(declare-datatypes ((Unit!39258 0))(
  ( (Unit!39259) )
))
(declare-fun e!675182 () Unit!39258)

(declare-fun Unit!39260 () Unit!39258)

(assert (=> b!1187463 (= e!675182 Unit!39260)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539798 () Unit!39258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39258)

(assert (=> b!1187463 (= lt!539798 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187463 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539791 () Unit!39258)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76652 (_ BitVec 32) (_ BitVec 32)) Unit!39258)

(assert (=> b!1187463 (= lt!539791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26130 0))(
  ( (Nil!26127) (Cons!26126 (h!27335 (_ BitVec 64)) (t!38542 List!26130)) )
))
(declare-fun arrayNoDuplicates!0 (array!76652 (_ BitVec 32) List!26130) Bool)

(assert (=> b!1187463 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26127)))

(declare-fun lt!539793 () Unit!39258)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76652 (_ BitVec 64) (_ BitVec 32) List!26130) Unit!39258)

(assert (=> b!1187463 (= lt!539793 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26127))))

(assert (=> b!1187463 false))

(declare-fun b!1187464 () Bool)

(declare-fun e!675178 () Bool)

(assert (=> b!1187464 (= e!675175 e!675178)))

(declare-fun res!789502 () Bool)

(assert (=> b!1187464 (=> (not res!789502) (not e!675178))))

(declare-fun lt!539805 () array!76652)

(assert (=> b!1187464 (= res!789502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539805 mask!1564))))

(assert (=> b!1187464 (= lt!539805 (array!76653 (store (arr!36976 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37514 _keys!1208)))))

(declare-fun e!675179 () Bool)

(declare-fun b!1187465 () Bool)

(assert (=> b!1187465 (= e!675179 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187466 () Bool)

(declare-fun Unit!39261 () Unit!39258)

(assert (=> b!1187466 (= e!675182 Unit!39261)))

(declare-fun b!1187467 () Bool)

(declare-fun res!789501 () Bool)

(assert (=> b!1187467 (=> (not res!789501) (not e!675175))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45073 0))(
  ( (V!45074 (val!15036 Int)) )
))
(declare-datatypes ((ValueCell!14270 0))(
  ( (ValueCellFull!14270 (v!17673 V!45073)) (EmptyCell!14270) )
))
(declare-datatypes ((array!76654 0))(
  ( (array!76655 (arr!36977 (Array (_ BitVec 32) ValueCell!14270)) (size!37515 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76654)

(assert (=> b!1187467 (= res!789501 (and (= (size!37515 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37514 _keys!1208) (size!37515 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!789494 () Bool)

(assert (=> start!99844 (=> (not res!789494) (not e!675175))))

(assert (=> start!99844 (= res!789494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37514 _keys!1208))))))

(assert (=> start!99844 e!675175))

(declare-fun tp_is_empty!29959 () Bool)

(assert (=> start!99844 tp_is_empty!29959))

(declare-fun array_inv!28322 (array!76652) Bool)

(assert (=> start!99844 (array_inv!28322 _keys!1208)))

(assert (=> start!99844 true))

(assert (=> start!99844 tp!89000))

(declare-fun e!675174 () Bool)

(declare-fun array_inv!28323 (array!76654) Bool)

(assert (=> start!99844 (and (array_inv!28323 _values!996) e!675174)))

(declare-fun b!1187468 () Bool)

(declare-fun e!675183 () Bool)

(declare-fun e!675181 () Bool)

(assert (=> b!1187468 (= e!675183 e!675181)))

(declare-fun res!789499 () Bool)

(assert (=> b!1187468 (=> res!789499 e!675181)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187468 (= res!789499 (not (validKeyInArray!0 (select (arr!36976 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19418 0))(
  ( (tuple2!19419 (_1!9720 (_ BitVec 64)) (_2!9720 V!45073)) )
))
(declare-datatypes ((List!26131 0))(
  ( (Nil!26128) (Cons!26127 (h!27336 tuple2!19418) (t!38543 List!26131)) )
))
(declare-datatypes ((ListLongMap!17387 0))(
  ( (ListLongMap!17388 (toList!8709 List!26131)) )
))
(declare-fun lt!539796 () ListLongMap!17387)

(declare-fun lt!539800 () ListLongMap!17387)

(assert (=> b!1187468 (= lt!539796 lt!539800)))

(declare-fun lt!539790 () ListLongMap!17387)

(declare-fun -!1658 (ListLongMap!17387 (_ BitVec 64)) ListLongMap!17387)

(assert (=> b!1187468 (= lt!539800 (-!1658 lt!539790 k0!934))))

(declare-fun zeroValue!944 () V!45073)

(declare-fun lt!539795 () array!76654)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45073)

(declare-fun getCurrentListMapNoExtraKeys!5159 (array!76652 array!76654 (_ BitVec 32) (_ BitVec 32) V!45073 V!45073 (_ BitVec 32) Int) ListLongMap!17387)

(assert (=> b!1187468 (= lt!539796 (getCurrentListMapNoExtraKeys!5159 lt!539805 lt!539795 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187468 (= lt!539790 (getCurrentListMapNoExtraKeys!5159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539804 () Unit!39258)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 (array!76652 array!76654 (_ BitVec 32) (_ BitVec 32) V!45073 V!45073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39258)

(assert (=> b!1187468 (= lt!539804 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187469 () Bool)

(declare-fun res!789489 () Bool)

(assert (=> b!1187469 (=> (not res!789489) (not e!675175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187469 (= res!789489 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46766 () Bool)

(declare-fun mapRes!46766 () Bool)

(declare-fun tp!89001 () Bool)

(declare-fun e!675173 () Bool)

(assert (=> mapNonEmpty!46766 (= mapRes!46766 (and tp!89001 e!675173))))

(declare-fun mapKey!46766 () (_ BitVec 32))

(declare-fun mapValue!46766 () ValueCell!14270)

(declare-fun mapRest!46766 () (Array (_ BitVec 32) ValueCell!14270))

(assert (=> mapNonEmpty!46766 (= (arr!36977 _values!996) (store mapRest!46766 mapKey!46766 mapValue!46766))))

(declare-fun b!1187470 () Bool)

(declare-fun e!675184 () Bool)

(assert (=> b!1187470 (= e!675184 e!675179)))

(declare-fun res!789495 () Bool)

(assert (=> b!1187470 (=> res!789495 e!675179)))

(assert (=> b!1187470 (= res!789495 (not (= (select (arr!36976 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187471 () Bool)

(declare-fun e!675180 () Bool)

(assert (=> b!1187471 (= e!675174 (and e!675180 mapRes!46766))))

(declare-fun condMapEmpty!46766 () Bool)

(declare-fun mapDefault!46766 () ValueCell!14270)

(assert (=> b!1187471 (= condMapEmpty!46766 (= (arr!36977 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14270)) mapDefault!46766)))))

(declare-fun b!1187472 () Bool)

(assert (=> b!1187472 (= e!675173 tp_is_empty!29959)))

(declare-fun b!1187473 () Bool)

(declare-fun res!789497 () Bool)

(assert (=> b!1187473 (=> (not res!789497) (not e!675178))))

(assert (=> b!1187473 (= res!789497 (arrayNoDuplicates!0 lt!539805 #b00000000000000000000000000000000 Nil!26127))))

(declare-fun b!1187474 () Bool)

(declare-fun res!789491 () Bool)

(assert (=> b!1187474 (=> (not res!789491) (not e!675175))))

(assert (=> b!1187474 (= res!789491 (validKeyInArray!0 k0!934))))

(declare-fun b!1187475 () Bool)

(declare-fun res!789500 () Bool)

(assert (=> b!1187475 (=> (not res!789500) (not e!675175))))

(assert (=> b!1187475 (= res!789500 (= (select (arr!36976 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46766 () Bool)

(assert (=> mapIsEmpty!46766 mapRes!46766))

(declare-fun b!1187476 () Bool)

(assert (=> b!1187476 (= e!675181 true)))

(declare-fun lt!539788 () ListLongMap!17387)

(declare-fun lt!539787 () ListLongMap!17387)

(assert (=> b!1187476 (= (-!1658 lt!539788 k0!934) lt!539787)))

(declare-fun lt!539797 () Unit!39258)

(declare-fun lt!539794 () V!45073)

(declare-fun addRemoveCommutativeForDiffKeys!201 (ListLongMap!17387 (_ BitVec 64) V!45073 (_ BitVec 64)) Unit!39258)

(assert (=> b!1187476 (= lt!539797 (addRemoveCommutativeForDiffKeys!201 lt!539790 (select (arr!36976 _keys!1208) from!1455) lt!539794 k0!934))))

(declare-fun lt!539803 () ListLongMap!17387)

(assert (=> b!1187476 (and (= lt!539803 lt!539788) (= lt!539800 lt!539796))))

(declare-fun lt!539802 () tuple2!19418)

(declare-fun +!3987 (ListLongMap!17387 tuple2!19418) ListLongMap!17387)

(assert (=> b!1187476 (= lt!539788 (+!3987 lt!539790 lt!539802))))

(assert (=> b!1187476 (not (= (select (arr!36976 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539789 () Unit!39258)

(assert (=> b!1187476 (= lt!539789 e!675182)))

(declare-fun c!117241 () Bool)

(assert (=> b!1187476 (= c!117241 (= (select (arr!36976 _keys!1208) from!1455) k0!934))))

(assert (=> b!1187476 e!675184))

(declare-fun res!789493 () Bool)

(assert (=> b!1187476 (=> (not res!789493) (not e!675184))))

(declare-fun lt!539801 () ListLongMap!17387)

(assert (=> b!1187476 (= res!789493 (= lt!539801 lt!539787))))

(assert (=> b!1187476 (= lt!539787 (+!3987 lt!539800 lt!539802))))

(assert (=> b!1187476 (= lt!539802 (tuple2!19419 (select (arr!36976 _keys!1208) from!1455) lt!539794))))

(declare-fun lt!539799 () V!45073)

(declare-fun get!18952 (ValueCell!14270 V!45073) V!45073)

(assert (=> b!1187476 (= lt!539794 (get!18952 (select (arr!36977 _values!996) from!1455) lt!539799))))

(declare-fun b!1187477 () Bool)

(assert (=> b!1187477 (= e!675180 tp_is_empty!29959)))

(declare-fun b!1187478 () Bool)

(declare-fun res!789492 () Bool)

(assert (=> b!1187478 (=> (not res!789492) (not e!675175))))

(assert (=> b!1187478 (= res!789492 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26127))))

(declare-fun b!1187479 () Bool)

(declare-fun e!675176 () Bool)

(assert (=> b!1187479 (= e!675178 (not e!675176))))

(declare-fun res!789498 () Bool)

(assert (=> b!1187479 (=> res!789498 e!675176)))

(assert (=> b!1187479 (= res!789498 (bvsgt from!1455 i!673))))

(assert (=> b!1187479 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539792 () Unit!39258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76652 (_ BitVec 64) (_ BitVec 32)) Unit!39258)

(assert (=> b!1187479 (= lt!539792 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187480 () Bool)

(assert (=> b!1187480 (= e!675176 e!675183)))

(declare-fun res!789496 () Bool)

(assert (=> b!1187480 (=> res!789496 e!675183)))

(assert (=> b!1187480 (= res!789496 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187480 (= lt!539801 (getCurrentListMapNoExtraKeys!5159 lt!539805 lt!539795 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187480 (= lt!539795 (array!76655 (store (arr!36977 _values!996) i!673 (ValueCellFull!14270 lt!539799)) (size!37515 _values!996)))))

(declare-fun dynLambda!3057 (Int (_ BitVec 64)) V!45073)

(assert (=> b!1187480 (= lt!539799 (dynLambda!3057 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187480 (= lt!539803 (getCurrentListMapNoExtraKeys!5159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99844 res!789494) b!1187469))

(assert (= (and b!1187469 res!789489) b!1187467))

(assert (= (and b!1187467 res!789501) b!1187461))

(assert (= (and b!1187461 res!789488) b!1187478))

(assert (= (and b!1187478 res!789492) b!1187462))

(assert (= (and b!1187462 res!789490) b!1187474))

(assert (= (and b!1187474 res!789491) b!1187475))

(assert (= (and b!1187475 res!789500) b!1187464))

(assert (= (and b!1187464 res!789502) b!1187473))

(assert (= (and b!1187473 res!789497) b!1187479))

(assert (= (and b!1187479 (not res!789498)) b!1187480))

(assert (= (and b!1187480 (not res!789496)) b!1187468))

(assert (= (and b!1187468 (not res!789499)) b!1187476))

(assert (= (and b!1187476 res!789493) b!1187470))

(assert (= (and b!1187470 (not res!789495)) b!1187465))

(assert (= (and b!1187476 c!117241) b!1187463))

(assert (= (and b!1187476 (not c!117241)) b!1187466))

(assert (= (and b!1187471 condMapEmpty!46766) mapIsEmpty!46766))

(assert (= (and b!1187471 (not condMapEmpty!46766)) mapNonEmpty!46766))

(get-info :version)

(assert (= (and mapNonEmpty!46766 ((_ is ValueCellFull!14270) mapValue!46766)) b!1187472))

(assert (= (and b!1187471 ((_ is ValueCellFull!14270) mapDefault!46766)) b!1187477))

(assert (= start!99844 b!1187471))

(declare-fun b_lambda!20555 () Bool)

(assert (=> (not b_lambda!20555) (not b!1187480)))

(declare-fun t!38541 () Bool)

(declare-fun tb!10233 () Bool)

(assert (=> (and start!99844 (= defaultEntry!1004 defaultEntry!1004) t!38541) tb!10233))

(declare-fun result!21041 () Bool)

(assert (=> tb!10233 (= result!21041 tp_is_empty!29959)))

(assert (=> b!1187480 t!38541))

(declare-fun b_and!41705 () Bool)

(assert (= b_and!41703 (and (=> t!38541 result!21041) b_and!41705)))

(declare-fun m!1095665 () Bool)

(assert (=> b!1187478 m!1095665))

(declare-fun m!1095667 () Bool)

(assert (=> b!1187461 m!1095667))

(declare-fun m!1095669 () Bool)

(assert (=> b!1187463 m!1095669))

(declare-fun m!1095671 () Bool)

(assert (=> b!1187463 m!1095671))

(declare-fun m!1095673 () Bool)

(assert (=> b!1187463 m!1095673))

(declare-fun m!1095675 () Bool)

(assert (=> b!1187463 m!1095675))

(declare-fun m!1095677 () Bool)

(assert (=> b!1187463 m!1095677))

(declare-fun m!1095679 () Bool)

(assert (=> start!99844 m!1095679))

(declare-fun m!1095681 () Bool)

(assert (=> start!99844 m!1095681))

(declare-fun m!1095683 () Bool)

(assert (=> b!1187475 m!1095683))

(declare-fun m!1095685 () Bool)

(assert (=> b!1187479 m!1095685))

(declare-fun m!1095687 () Bool)

(assert (=> b!1187479 m!1095687))

(declare-fun m!1095689 () Bool)

(assert (=> b!1187464 m!1095689))

(declare-fun m!1095691 () Bool)

(assert (=> b!1187464 m!1095691))

(declare-fun m!1095693 () Bool)

(assert (=> b!1187470 m!1095693))

(declare-fun m!1095695 () Bool)

(assert (=> b!1187469 m!1095695))

(declare-fun m!1095697 () Bool)

(assert (=> b!1187468 m!1095697))

(declare-fun m!1095699 () Bool)

(assert (=> b!1187468 m!1095699))

(declare-fun m!1095701 () Bool)

(assert (=> b!1187468 m!1095701))

(declare-fun m!1095703 () Bool)

(assert (=> b!1187468 m!1095703))

(assert (=> b!1187468 m!1095693))

(declare-fun m!1095705 () Bool)

(assert (=> b!1187468 m!1095705))

(assert (=> b!1187468 m!1095693))

(declare-fun m!1095707 () Bool)

(assert (=> b!1187476 m!1095707))

(declare-fun m!1095709 () Bool)

(assert (=> b!1187476 m!1095709))

(assert (=> b!1187476 m!1095693))

(declare-fun m!1095711 () Bool)

(assert (=> b!1187476 m!1095711))

(declare-fun m!1095713 () Bool)

(assert (=> b!1187476 m!1095713))

(declare-fun m!1095715 () Bool)

(assert (=> b!1187476 m!1095715))

(assert (=> b!1187476 m!1095693))

(assert (=> b!1187476 m!1095707))

(declare-fun m!1095717 () Bool)

(assert (=> b!1187476 m!1095717))

(declare-fun m!1095719 () Bool)

(assert (=> b!1187465 m!1095719))

(declare-fun m!1095721 () Bool)

(assert (=> b!1187473 m!1095721))

(declare-fun m!1095723 () Bool)

(assert (=> b!1187480 m!1095723))

(declare-fun m!1095725 () Bool)

(assert (=> b!1187480 m!1095725))

(declare-fun m!1095727 () Bool)

(assert (=> b!1187480 m!1095727))

(declare-fun m!1095729 () Bool)

(assert (=> b!1187480 m!1095729))

(declare-fun m!1095731 () Bool)

(assert (=> mapNonEmpty!46766 m!1095731))

(declare-fun m!1095733 () Bool)

(assert (=> b!1187474 m!1095733))

(check-sat (not mapNonEmpty!46766) tp_is_empty!29959 (not b!1187480) (not b!1187463) (not b!1187474) (not b!1187479) b_and!41705 (not b_next!25429) (not b!1187465) (not b_lambda!20555) (not b!1187478) (not b!1187468) (not start!99844) (not b!1187469) (not b!1187473) (not b!1187464) (not b!1187476) (not b!1187461))
(check-sat b_and!41705 (not b_next!25429))
