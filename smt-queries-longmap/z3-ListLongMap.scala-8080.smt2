; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99348 () Bool)

(assert start!99348)

(declare-fun b_free!24927 () Bool)

(declare-fun b_next!24927 () Bool)

(assert (=> start!99348 (= b_free!24927 (not b_next!24927))))

(declare-fun tp!87494 () Bool)

(declare-fun b_and!40721 () Bool)

(assert (=> start!99348 (= tp!87494 b_and!40721)))

(declare-fun b!1171583 () Bool)

(declare-fun e!665915 () Bool)

(assert (=> b!1171583 (= e!665915 true)))

(declare-fun lt!527792 () Bool)

(declare-datatypes ((List!25624 0))(
  ( (Nil!25621) (Cons!25620 (h!26829 (_ BitVec 64)) (t!37543 List!25624)) )
))
(declare-fun contains!6849 (List!25624 (_ BitVec 64)) Bool)

(assert (=> b!1171583 (= lt!527792 (contains!6849 Nil!25621 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171584 () Bool)

(declare-fun res!777733 () Bool)

(declare-fun e!665924 () Bool)

(assert (=> b!1171584 (=> (not res!777733) (not e!665924))))

(declare-datatypes ((array!75731 0))(
  ( (array!75732 (arr!36515 (Array (_ BitVec 32) (_ BitVec 64))) (size!37051 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75731)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44403 0))(
  ( (V!44404 (val!14785 Int)) )
))
(declare-datatypes ((ValueCell!14019 0))(
  ( (ValueCellFull!14019 (v!17423 V!44403)) (EmptyCell!14019) )
))
(declare-datatypes ((array!75733 0))(
  ( (array!75734 (arr!36516 (Array (_ BitVec 32) ValueCell!14019)) (size!37052 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75733)

(assert (=> b!1171584 (= res!777733 (and (= (size!37052 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37051 _keys!1208) (size!37052 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171585 () Bool)

(declare-fun res!777722 () Bool)

(assert (=> b!1171585 (=> (not res!777722) (not e!665924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171585 (= res!777722 (validMask!0 mask!1564))))

(declare-fun res!777721 () Bool)

(assert (=> start!99348 (=> (not res!777721) (not e!665924))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99348 (= res!777721 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37051 _keys!1208))))))

(assert (=> start!99348 e!665924))

(declare-fun tp_is_empty!29457 () Bool)

(assert (=> start!99348 tp_is_empty!29457))

(declare-fun array_inv!27906 (array!75731) Bool)

(assert (=> start!99348 (array_inv!27906 _keys!1208)))

(assert (=> start!99348 true))

(assert (=> start!99348 tp!87494))

(declare-fun e!665914 () Bool)

(declare-fun array_inv!27907 (array!75733) Bool)

(assert (=> start!99348 (and (array_inv!27907 _values!996) e!665914)))

(declare-fun b!1171586 () Bool)

(declare-fun e!665918 () Bool)

(assert (=> b!1171586 (= e!665924 e!665918)))

(declare-fun res!777729 () Bool)

(assert (=> b!1171586 (=> (not res!777729) (not e!665918))))

(declare-fun lt!527784 () array!75731)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75731 (_ BitVec 32)) Bool)

(assert (=> b!1171586 (= res!777729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527784 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171586 (= lt!527784 (array!75732 (store (arr!36515 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37051 _keys!1208)))))

(declare-fun b!1171587 () Bool)

(declare-fun e!665922 () Bool)

(declare-fun e!665917 () Bool)

(assert (=> b!1171587 (= e!665922 e!665917)))

(declare-fun res!777730 () Bool)

(assert (=> b!1171587 (=> res!777730 e!665917)))

(assert (=> b!1171587 (= res!777730 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527790 () array!75733)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44403)

(declare-fun zeroValue!944 () V!44403)

(declare-datatypes ((tuple2!18888 0))(
  ( (tuple2!18889 (_1!9455 (_ BitVec 64)) (_2!9455 V!44403)) )
))
(declare-datatypes ((List!25625 0))(
  ( (Nil!25622) (Cons!25621 (h!26830 tuple2!18888) (t!37544 List!25625)) )
))
(declare-datatypes ((ListLongMap!16857 0))(
  ( (ListLongMap!16858 (toList!8444 List!25625)) )
))
(declare-fun lt!527787 () ListLongMap!16857)

(declare-fun getCurrentListMapNoExtraKeys!4908 (array!75731 array!75733 (_ BitVec 32) (_ BitVec 32) V!44403 V!44403 (_ BitVec 32) Int) ListLongMap!16857)

(assert (=> b!1171587 (= lt!527787 (getCurrentListMapNoExtraKeys!4908 lt!527784 lt!527790 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527793 () V!44403)

(assert (=> b!1171587 (= lt!527790 (array!75734 (store (arr!36516 _values!996) i!673 (ValueCellFull!14019 lt!527793)) (size!37052 _values!996)))))

(declare-fun dynLambda!2881 (Int (_ BitVec 64)) V!44403)

(assert (=> b!1171587 (= lt!527793 (dynLambda!2881 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527785 () ListLongMap!16857)

(assert (=> b!1171587 (= lt!527785 (getCurrentListMapNoExtraKeys!4908 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171588 () Bool)

(declare-fun e!665923 () Bool)

(declare-fun mapRes!46013 () Bool)

(assert (=> b!1171588 (= e!665914 (and e!665923 mapRes!46013))))

(declare-fun condMapEmpty!46013 () Bool)

(declare-fun mapDefault!46013 () ValueCell!14019)

(assert (=> b!1171588 (= condMapEmpty!46013 (= (arr!36516 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14019)) mapDefault!46013)))))

(declare-fun b!1171589 () Bool)

(declare-fun res!777737 () Bool)

(assert (=> b!1171589 (=> (not res!777737) (not e!665924))))

(assert (=> b!1171589 (= res!777737 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37051 _keys!1208))))))

(declare-fun b!1171590 () Bool)

(declare-fun e!665916 () Bool)

(declare-fun e!665926 () Bool)

(assert (=> b!1171590 (= e!665916 e!665926)))

(declare-fun res!777739 () Bool)

(assert (=> b!1171590 (=> res!777739 e!665926)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1171590 (= res!777739 (not (= (select (arr!36515 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171591 () Bool)

(declare-fun e!665925 () Bool)

(declare-fun e!665919 () Bool)

(assert (=> b!1171591 (= e!665925 e!665919)))

(declare-fun res!777731 () Bool)

(assert (=> b!1171591 (=> res!777731 e!665919)))

(assert (=> b!1171591 (= res!777731 (not (= (select (arr!36515 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171591 e!665916))

(declare-fun res!777736 () Bool)

(assert (=> b!1171591 (=> (not res!777736) (not e!665916))))

(declare-fun lt!527789 () ListLongMap!16857)

(declare-fun +!3769 (ListLongMap!16857 tuple2!18888) ListLongMap!16857)

(declare-fun get!18625 (ValueCell!14019 V!44403) V!44403)

(assert (=> b!1171591 (= res!777736 (= lt!527787 (+!3769 lt!527789 (tuple2!18889 (select (arr!36515 _keys!1208) from!1455) (get!18625 (select (arr!36516 _values!996) from!1455) lt!527793)))))))

(declare-fun b!1171592 () Bool)

(assert (=> b!1171592 (= e!665919 e!665915)))

(declare-fun res!777725 () Bool)

(assert (=> b!1171592 (=> res!777725 e!665915)))

(assert (=> b!1171592 (= res!777725 (or (bvsge (size!37051 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37051 _keys!1208)) (bvsge from!1455 (size!37051 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75731 (_ BitVec 32) List!25624) Bool)

(assert (=> b!1171592 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25621)))

(declare-datatypes ((Unit!38640 0))(
  ( (Unit!38641) )
))
(declare-fun lt!527794 () Unit!38640)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75731 (_ BitVec 32) (_ BitVec 32)) Unit!38640)

(assert (=> b!1171592 (= lt!527794 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171592 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527788 () Unit!38640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75731 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38640)

(assert (=> b!1171592 (= lt!527788 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!46013 () Bool)

(declare-fun tp!87495 () Bool)

(declare-fun e!665921 () Bool)

(assert (=> mapNonEmpty!46013 (= mapRes!46013 (and tp!87495 e!665921))))

(declare-fun mapKey!46013 () (_ BitVec 32))

(declare-fun mapRest!46013 () (Array (_ BitVec 32) ValueCell!14019))

(declare-fun mapValue!46013 () ValueCell!14019)

(assert (=> mapNonEmpty!46013 (= (arr!36516 _values!996) (store mapRest!46013 mapKey!46013 mapValue!46013))))

(declare-fun mapIsEmpty!46013 () Bool)

(assert (=> mapIsEmpty!46013 mapRes!46013))

(declare-fun b!1171593 () Bool)

(assert (=> b!1171593 (= e!665917 e!665925)))

(declare-fun res!777738 () Bool)

(assert (=> b!1171593 (=> res!777738 e!665925)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171593 (= res!777738 (not (validKeyInArray!0 (select (arr!36515 _keys!1208) from!1455))))))

(declare-fun lt!527786 () ListLongMap!16857)

(assert (=> b!1171593 (= lt!527786 lt!527789)))

(declare-fun lt!527791 () ListLongMap!16857)

(declare-fun -!1512 (ListLongMap!16857 (_ BitVec 64)) ListLongMap!16857)

(assert (=> b!1171593 (= lt!527789 (-!1512 lt!527791 k0!934))))

(assert (=> b!1171593 (= lt!527786 (getCurrentListMapNoExtraKeys!4908 lt!527784 lt!527790 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171593 (= lt!527791 (getCurrentListMapNoExtraKeys!4908 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527796 () Unit!38640)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 (array!75731 array!75733 (_ BitVec 32) (_ BitVec 32) V!44403 V!44403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38640)

(assert (=> b!1171593 (= lt!527796 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171594 () Bool)

(declare-fun res!777735 () Bool)

(assert (=> b!1171594 (=> (not res!777735) (not e!665924))))

(assert (=> b!1171594 (= res!777735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25621))))

(declare-fun b!1171595 () Bool)

(assert (=> b!1171595 (= e!665918 (not e!665922))))

(declare-fun res!777726 () Bool)

(assert (=> b!1171595 (=> res!777726 e!665922)))

(assert (=> b!1171595 (= res!777726 (bvsgt from!1455 i!673))))

(assert (=> b!1171595 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527795 () Unit!38640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75731 (_ BitVec 64) (_ BitVec 32)) Unit!38640)

(assert (=> b!1171595 (= lt!527795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171596 () Bool)

(declare-fun res!777723 () Bool)

(assert (=> b!1171596 (=> (not res!777723) (not e!665924))))

(assert (=> b!1171596 (= res!777723 (= (select (arr!36515 _keys!1208) i!673) k0!934))))

(declare-fun b!1171597 () Bool)

(assert (=> b!1171597 (= e!665921 tp_is_empty!29457)))

(declare-fun b!1171598 () Bool)

(declare-fun res!777727 () Bool)

(assert (=> b!1171598 (=> res!777727 e!665915)))

(declare-fun noDuplicate!1610 (List!25624) Bool)

(assert (=> b!1171598 (= res!777727 (not (noDuplicate!1610 Nil!25621)))))

(declare-fun b!1171599 () Bool)

(declare-fun res!777734 () Bool)

(assert (=> b!1171599 (=> (not res!777734) (not e!665918))))

(assert (=> b!1171599 (= res!777734 (arrayNoDuplicates!0 lt!527784 #b00000000000000000000000000000000 Nil!25621))))

(declare-fun b!1171600 () Bool)

(assert (=> b!1171600 (= e!665923 tp_is_empty!29457)))

(declare-fun b!1171601 () Bool)

(declare-fun res!777728 () Bool)

(assert (=> b!1171601 (=> res!777728 e!665915)))

(assert (=> b!1171601 (= res!777728 (contains!6849 Nil!25621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171602 () Bool)

(declare-fun res!777724 () Bool)

(assert (=> b!1171602 (=> (not res!777724) (not e!665924))))

(assert (=> b!1171602 (= res!777724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171603 () Bool)

(assert (=> b!1171603 (= e!665926 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171604 () Bool)

(declare-fun res!777732 () Bool)

(assert (=> b!1171604 (=> (not res!777732) (not e!665924))))

(assert (=> b!1171604 (= res!777732 (validKeyInArray!0 k0!934))))

(assert (= (and start!99348 res!777721) b!1171585))

(assert (= (and b!1171585 res!777722) b!1171584))

(assert (= (and b!1171584 res!777733) b!1171602))

(assert (= (and b!1171602 res!777724) b!1171594))

(assert (= (and b!1171594 res!777735) b!1171589))

(assert (= (and b!1171589 res!777737) b!1171604))

(assert (= (and b!1171604 res!777732) b!1171596))

(assert (= (and b!1171596 res!777723) b!1171586))

(assert (= (and b!1171586 res!777729) b!1171599))

(assert (= (and b!1171599 res!777734) b!1171595))

(assert (= (and b!1171595 (not res!777726)) b!1171587))

(assert (= (and b!1171587 (not res!777730)) b!1171593))

(assert (= (and b!1171593 (not res!777738)) b!1171591))

(assert (= (and b!1171591 res!777736) b!1171590))

(assert (= (and b!1171590 (not res!777739)) b!1171603))

(assert (= (and b!1171591 (not res!777731)) b!1171592))

(assert (= (and b!1171592 (not res!777725)) b!1171598))

(assert (= (and b!1171598 (not res!777727)) b!1171601))

(assert (= (and b!1171601 (not res!777728)) b!1171583))

(assert (= (and b!1171588 condMapEmpty!46013) mapIsEmpty!46013))

(assert (= (and b!1171588 (not condMapEmpty!46013)) mapNonEmpty!46013))

(get-info :version)

(assert (= (and mapNonEmpty!46013 ((_ is ValueCellFull!14019) mapValue!46013)) b!1171597))

(assert (= (and b!1171588 ((_ is ValueCellFull!14019) mapDefault!46013)) b!1171600))

(assert (= start!99348 b!1171588))

(declare-fun b_lambda!20071 () Bool)

(assert (=> (not b_lambda!20071) (not b!1171587)))

(declare-fun t!37542 () Bool)

(declare-fun tb!9739 () Bool)

(assert (=> (and start!99348 (= defaultEntry!1004 defaultEntry!1004) t!37542) tb!9739))

(declare-fun result!20045 () Bool)

(assert (=> tb!9739 (= result!20045 tp_is_empty!29457)))

(assert (=> b!1171587 t!37542))

(declare-fun b_and!40723 () Bool)

(assert (= b_and!40721 (and (=> t!37542 result!20045) b_and!40723)))

(declare-fun m!1079399 () Bool)

(assert (=> b!1171595 m!1079399))

(declare-fun m!1079401 () Bool)

(assert (=> b!1171595 m!1079401))

(declare-fun m!1079403 () Bool)

(assert (=> b!1171591 m!1079403))

(declare-fun m!1079405 () Bool)

(assert (=> b!1171591 m!1079405))

(assert (=> b!1171591 m!1079405))

(declare-fun m!1079407 () Bool)

(assert (=> b!1171591 m!1079407))

(declare-fun m!1079409 () Bool)

(assert (=> b!1171591 m!1079409))

(declare-fun m!1079411 () Bool)

(assert (=> b!1171587 m!1079411))

(declare-fun m!1079413 () Bool)

(assert (=> b!1171587 m!1079413))

(declare-fun m!1079415 () Bool)

(assert (=> b!1171587 m!1079415))

(declare-fun m!1079417 () Bool)

(assert (=> b!1171587 m!1079417))

(declare-fun m!1079419 () Bool)

(assert (=> b!1171593 m!1079419))

(declare-fun m!1079421 () Bool)

(assert (=> b!1171593 m!1079421))

(declare-fun m!1079423 () Bool)

(assert (=> b!1171593 m!1079423))

(declare-fun m!1079425 () Bool)

(assert (=> b!1171593 m!1079425))

(assert (=> b!1171593 m!1079403))

(declare-fun m!1079427 () Bool)

(assert (=> b!1171593 m!1079427))

(assert (=> b!1171593 m!1079403))

(declare-fun m!1079429 () Bool)

(assert (=> b!1171598 m!1079429))

(declare-fun m!1079431 () Bool)

(assert (=> b!1171601 m!1079431))

(declare-fun m!1079433 () Bool)

(assert (=> b!1171604 m!1079433))

(declare-fun m!1079435 () Bool)

(assert (=> b!1171594 m!1079435))

(declare-fun m!1079437 () Bool)

(assert (=> start!99348 m!1079437))

(declare-fun m!1079439 () Bool)

(assert (=> start!99348 m!1079439))

(declare-fun m!1079441 () Bool)

(assert (=> mapNonEmpty!46013 m!1079441))

(declare-fun m!1079443 () Bool)

(assert (=> b!1171596 m!1079443))

(declare-fun m!1079445 () Bool)

(assert (=> b!1171586 m!1079445))

(declare-fun m!1079447 () Bool)

(assert (=> b!1171586 m!1079447))

(declare-fun m!1079449 () Bool)

(assert (=> b!1171603 m!1079449))

(declare-fun m!1079451 () Bool)

(assert (=> b!1171602 m!1079451))

(declare-fun m!1079453 () Bool)

(assert (=> b!1171585 m!1079453))

(declare-fun m!1079455 () Bool)

(assert (=> b!1171599 m!1079455))

(assert (=> b!1171590 m!1079403))

(declare-fun m!1079457 () Bool)

(assert (=> b!1171592 m!1079457))

(declare-fun m!1079459 () Bool)

(assert (=> b!1171592 m!1079459))

(declare-fun m!1079461 () Bool)

(assert (=> b!1171592 m!1079461))

(declare-fun m!1079463 () Bool)

(assert (=> b!1171592 m!1079463))

(declare-fun m!1079465 () Bool)

(assert (=> b!1171583 m!1079465))

(check-sat (not b!1171604) (not b!1171599) (not b!1171592) (not b!1171585) (not mapNonEmpty!46013) (not b_next!24927) (not start!99348) (not b!1171587) tp_is_empty!29457 (not b!1171593) (not b!1171598) (not b!1171602) (not b!1171583) (not b!1171601) (not b!1171586) (not b!1171595) (not b!1171594) (not b!1171603) b_and!40723 (not b_lambda!20071) (not b!1171591))
(check-sat b_and!40723 (not b_next!24927))
