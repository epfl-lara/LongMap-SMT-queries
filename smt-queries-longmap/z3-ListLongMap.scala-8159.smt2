; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99814 () Bool)

(assert start!99814)

(declare-fun b_free!25399 () Bool)

(declare-fun b_next!25399 () Bool)

(assert (=> start!99814 (= b_free!25399 (not b_next!25399))))

(declare-fun tp!88910 () Bool)

(declare-fun b_and!41643 () Bool)

(assert (=> start!99814 (= tp!88910 b_and!41643)))

(declare-fun b!1186531 () Bool)

(declare-fun res!788817 () Bool)

(declare-fun e!674640 () Bool)

(assert (=> b!1186531 (=> (not res!788817) (not e!674640))))

(declare-datatypes ((array!76592 0))(
  ( (array!76593 (arr!36946 (Array (_ BitVec 32) (_ BitVec 64))) (size!37484 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76592)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76592 (_ BitVec 32)) Bool)

(assert (=> b!1186531 (= res!788817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186532 () Bool)

(declare-fun e!674643 () Bool)

(declare-fun e!674633 () Bool)

(assert (=> b!1186532 (= e!674643 (not e!674633))))

(declare-fun res!788819 () Bool)

(assert (=> b!1186532 (=> res!788819 e!674633)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186532 (= res!788819 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186532 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39209 0))(
  ( (Unit!39210) )
))
(declare-fun lt!538933 () Unit!39209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76592 (_ BitVec 64) (_ BitVec 32)) Unit!39209)

(assert (=> b!1186532 (= lt!538933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!788815 () Bool)

(assert (=> start!99814 (=> (not res!788815) (not e!674640))))

(assert (=> start!99814 (= res!788815 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37484 _keys!1208))))))

(assert (=> start!99814 e!674640))

(declare-fun tp_is_empty!29929 () Bool)

(assert (=> start!99814 tp_is_empty!29929))

(declare-fun array_inv!28306 (array!76592) Bool)

(assert (=> start!99814 (array_inv!28306 _keys!1208)))

(assert (=> start!99814 true))

(assert (=> start!99814 tp!88910))

(declare-datatypes ((V!45033 0))(
  ( (V!45034 (val!15021 Int)) )
))
(declare-datatypes ((ValueCell!14255 0))(
  ( (ValueCellFull!14255 (v!17658 V!45033)) (EmptyCell!14255) )
))
(declare-datatypes ((array!76594 0))(
  ( (array!76595 (arr!36947 (Array (_ BitVec 32) ValueCell!14255)) (size!37485 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76594)

(declare-fun e!674642 () Bool)

(declare-fun array_inv!28307 (array!76594) Bool)

(assert (=> start!99814 (and (array_inv!28307 _values!996) e!674642)))

(declare-fun b!1186533 () Bool)

(declare-fun e!674636 () Bool)

(declare-fun e!674644 () Bool)

(assert (=> b!1186533 (= e!674636 e!674644)))

(declare-fun res!788825 () Bool)

(assert (=> b!1186533 (=> res!788825 e!674644)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186533 (= res!788825 (not (validKeyInArray!0 (select (arr!36946 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19390 0))(
  ( (tuple2!19391 (_1!9706 (_ BitVec 64)) (_2!9706 V!45033)) )
))
(declare-datatypes ((List!26104 0))(
  ( (Nil!26101) (Cons!26100 (h!27309 tuple2!19390) (t!38486 List!26104)) )
))
(declare-datatypes ((ListLongMap!17359 0))(
  ( (ListLongMap!17360 (toList!8695 List!26104)) )
))
(declare-fun lt!538943 () ListLongMap!17359)

(declare-fun lt!538950 () ListLongMap!17359)

(assert (=> b!1186533 (= lt!538943 lt!538950)))

(declare-fun lt!538936 () ListLongMap!17359)

(declare-fun -!1646 (ListLongMap!17359 (_ BitVec 64)) ListLongMap!17359)

(assert (=> b!1186533 (= lt!538950 (-!1646 lt!538936 k0!934))))

(declare-fun zeroValue!944 () V!45033)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!538946 () array!76594)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538939 () array!76592)

(declare-fun minValue!944 () V!45033)

(declare-fun getCurrentListMapNoExtraKeys!5146 (array!76592 array!76594 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) Int) ListLongMap!17359)

(assert (=> b!1186533 (= lt!538943 (getCurrentListMapNoExtraKeys!5146 lt!538939 lt!538946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186533 (= lt!538936 (getCurrentListMapNoExtraKeys!5146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538941 () Unit!39209)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 (array!76592 array!76594 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39209)

(assert (=> b!1186533 (= lt!538941 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186534 () Bool)

(assert (=> b!1186534 (= e!674633 e!674636)))

(declare-fun res!788824 () Bool)

(assert (=> b!1186534 (=> res!788824 e!674636)))

(assert (=> b!1186534 (= res!788824 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!538938 () ListLongMap!17359)

(assert (=> b!1186534 (= lt!538938 (getCurrentListMapNoExtraKeys!5146 lt!538939 lt!538946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538949 () V!45033)

(assert (=> b!1186534 (= lt!538946 (array!76595 (store (arr!36947 _values!996) i!673 (ValueCellFull!14255 lt!538949)) (size!37485 _values!996)))))

(declare-fun dynLambda!3046 (Int (_ BitVec 64)) V!45033)

(assert (=> b!1186534 (= lt!538949 (dynLambda!3046 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538944 () ListLongMap!17359)

(assert (=> b!1186534 (= lt!538944 (getCurrentListMapNoExtraKeys!5146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186535 () Bool)

(declare-fun res!788818 () Bool)

(assert (=> b!1186535 (=> (not res!788818) (not e!674643))))

(declare-datatypes ((List!26105 0))(
  ( (Nil!26102) (Cons!26101 (h!27310 (_ BitVec 64)) (t!38487 List!26105)) )
))
(declare-fun arrayNoDuplicates!0 (array!76592 (_ BitVec 32) List!26105) Bool)

(assert (=> b!1186535 (= res!788818 (arrayNoDuplicates!0 lt!538939 #b00000000000000000000000000000000 Nil!26102))))

(declare-fun b!1186536 () Bool)

(declare-fun e!674637 () Bool)

(assert (=> b!1186536 (= e!674637 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186537 () Bool)

(declare-fun e!674639 () Bool)

(assert (=> b!1186537 (= e!674639 tp_is_empty!29929)))

(declare-fun b!1186538 () Bool)

(declare-fun e!674634 () Bool)

(assert (=> b!1186538 (= e!674634 e!674637)))

(declare-fun res!788813 () Bool)

(assert (=> b!1186538 (=> res!788813 e!674637)))

(assert (=> b!1186538 (= res!788813 (not (= (select (arr!36946 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186539 () Bool)

(declare-fun e!674638 () Unit!39209)

(declare-fun Unit!39211 () Unit!39209)

(assert (=> b!1186539 (= e!674638 Unit!39211)))

(declare-fun mapIsEmpty!46721 () Bool)

(declare-fun mapRes!46721 () Bool)

(assert (=> mapIsEmpty!46721 mapRes!46721))

(declare-fun b!1186540 () Bool)

(assert (=> b!1186540 (= e!674644 true)))

(declare-fun lt!538934 () ListLongMap!17359)

(declare-fun lt!538947 () ListLongMap!17359)

(assert (=> b!1186540 (= (-!1646 lt!538934 k0!934) lt!538947)))

(declare-fun lt!538937 () V!45033)

(declare-fun lt!538942 () Unit!39209)

(declare-fun addRemoveCommutativeForDiffKeys!189 (ListLongMap!17359 (_ BitVec 64) V!45033 (_ BitVec 64)) Unit!39209)

(assert (=> b!1186540 (= lt!538942 (addRemoveCommutativeForDiffKeys!189 lt!538936 (select (arr!36946 _keys!1208) from!1455) lt!538937 k0!934))))

(assert (=> b!1186540 (and (= lt!538944 lt!538934) (= lt!538950 lt!538943))))

(declare-fun lt!538940 () tuple2!19390)

(declare-fun +!3975 (ListLongMap!17359 tuple2!19390) ListLongMap!17359)

(assert (=> b!1186540 (= lt!538934 (+!3975 lt!538936 lt!538940))))

(assert (=> b!1186540 (not (= (select (arr!36946 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538932 () Unit!39209)

(assert (=> b!1186540 (= lt!538932 e!674638)))

(declare-fun c!117196 () Bool)

(assert (=> b!1186540 (= c!117196 (= (select (arr!36946 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186540 e!674634))

(declare-fun res!788820 () Bool)

(assert (=> b!1186540 (=> (not res!788820) (not e!674634))))

(assert (=> b!1186540 (= res!788820 (= lt!538938 lt!538947))))

(assert (=> b!1186540 (= lt!538947 (+!3975 lt!538950 lt!538940))))

(assert (=> b!1186540 (= lt!538940 (tuple2!19391 (select (arr!36946 _keys!1208) from!1455) lt!538937))))

(declare-fun get!18930 (ValueCell!14255 V!45033) V!45033)

(assert (=> b!1186540 (= lt!538937 (get!18930 (select (arr!36947 _values!996) from!1455) lt!538949))))

(declare-fun b!1186541 () Bool)

(declare-fun res!788827 () Bool)

(assert (=> b!1186541 (=> (not res!788827) (not e!674640))))

(assert (=> b!1186541 (= res!788827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26102))))

(declare-fun b!1186542 () Bool)

(declare-fun Unit!39212 () Unit!39209)

(assert (=> b!1186542 (= e!674638 Unit!39212)))

(declare-fun lt!538945 () Unit!39209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39209)

(assert (=> b!1186542 (= lt!538945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186542 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538935 () Unit!39209)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76592 (_ BitVec 32) (_ BitVec 32)) Unit!39209)

(assert (=> b!1186542 (= lt!538935 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186542 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26102)))

(declare-fun lt!538948 () Unit!39209)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76592 (_ BitVec 64) (_ BitVec 32) List!26105) Unit!39209)

(assert (=> b!1186542 (= lt!538948 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26102))))

(assert (=> b!1186542 false))

(declare-fun b!1186543 () Bool)

(declare-fun res!788826 () Bool)

(assert (=> b!1186543 (=> (not res!788826) (not e!674640))))

(assert (=> b!1186543 (= res!788826 (validKeyInArray!0 k0!934))))

(declare-fun b!1186544 () Bool)

(declare-fun res!788814 () Bool)

(assert (=> b!1186544 (=> (not res!788814) (not e!674640))))

(assert (=> b!1186544 (= res!788814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37484 _keys!1208))))))

(declare-fun b!1186545 () Bool)

(declare-fun e!674635 () Bool)

(assert (=> b!1186545 (= e!674635 tp_is_empty!29929)))

(declare-fun b!1186546 () Bool)

(declare-fun res!788823 () Bool)

(assert (=> b!1186546 (=> (not res!788823) (not e!674640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186546 (= res!788823 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46721 () Bool)

(declare-fun tp!88911 () Bool)

(assert (=> mapNonEmpty!46721 (= mapRes!46721 (and tp!88911 e!674639))))

(declare-fun mapValue!46721 () ValueCell!14255)

(declare-fun mapKey!46721 () (_ BitVec 32))

(declare-fun mapRest!46721 () (Array (_ BitVec 32) ValueCell!14255))

(assert (=> mapNonEmpty!46721 (= (arr!36947 _values!996) (store mapRest!46721 mapKey!46721 mapValue!46721))))

(declare-fun b!1186547 () Bool)

(assert (=> b!1186547 (= e!674642 (and e!674635 mapRes!46721))))

(declare-fun condMapEmpty!46721 () Bool)

(declare-fun mapDefault!46721 () ValueCell!14255)

(assert (=> b!1186547 (= condMapEmpty!46721 (= (arr!36947 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14255)) mapDefault!46721)))))

(declare-fun b!1186548 () Bool)

(assert (=> b!1186548 (= e!674640 e!674643)))

(declare-fun res!788821 () Bool)

(assert (=> b!1186548 (=> (not res!788821) (not e!674643))))

(assert (=> b!1186548 (= res!788821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538939 mask!1564))))

(assert (=> b!1186548 (= lt!538939 (array!76593 (store (arr!36946 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37484 _keys!1208)))))

(declare-fun b!1186549 () Bool)

(declare-fun res!788816 () Bool)

(assert (=> b!1186549 (=> (not res!788816) (not e!674640))))

(assert (=> b!1186549 (= res!788816 (and (= (size!37485 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37484 _keys!1208) (size!37485 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186550 () Bool)

(declare-fun res!788822 () Bool)

(assert (=> b!1186550 (=> (not res!788822) (not e!674640))))

(assert (=> b!1186550 (= res!788822 (= (select (arr!36946 _keys!1208) i!673) k0!934))))

(assert (= (and start!99814 res!788815) b!1186546))

(assert (= (and b!1186546 res!788823) b!1186549))

(assert (= (and b!1186549 res!788816) b!1186531))

(assert (= (and b!1186531 res!788817) b!1186541))

(assert (= (and b!1186541 res!788827) b!1186544))

(assert (= (and b!1186544 res!788814) b!1186543))

(assert (= (and b!1186543 res!788826) b!1186550))

(assert (= (and b!1186550 res!788822) b!1186548))

(assert (= (and b!1186548 res!788821) b!1186535))

(assert (= (and b!1186535 res!788818) b!1186532))

(assert (= (and b!1186532 (not res!788819)) b!1186534))

(assert (= (and b!1186534 (not res!788824)) b!1186533))

(assert (= (and b!1186533 (not res!788825)) b!1186540))

(assert (= (and b!1186540 res!788820) b!1186538))

(assert (= (and b!1186538 (not res!788813)) b!1186536))

(assert (= (and b!1186540 c!117196) b!1186542))

(assert (= (and b!1186540 (not c!117196)) b!1186539))

(assert (= (and b!1186547 condMapEmpty!46721) mapIsEmpty!46721))

(assert (= (and b!1186547 (not condMapEmpty!46721)) mapNonEmpty!46721))

(get-info :version)

(assert (= (and mapNonEmpty!46721 ((_ is ValueCellFull!14255) mapValue!46721)) b!1186537))

(assert (= (and b!1186547 ((_ is ValueCellFull!14255) mapDefault!46721)) b!1186545))

(assert (= start!99814 b!1186547))

(declare-fun b_lambda!20525 () Bool)

(assert (=> (not b_lambda!20525) (not b!1186534)))

(declare-fun t!38485 () Bool)

(declare-fun tb!10203 () Bool)

(assert (=> (and start!99814 (= defaultEntry!1004 defaultEntry!1004) t!38485) tb!10203))

(declare-fun result!20981 () Bool)

(assert (=> tb!10203 (= result!20981 tp_is_empty!29929)))

(assert (=> b!1186534 t!38485))

(declare-fun b_and!41645 () Bool)

(assert (= b_and!41643 (and (=> t!38485 result!20981) b_and!41645)))

(declare-fun m!1094615 () Bool)

(assert (=> b!1186531 m!1094615))

(declare-fun m!1094617 () Bool)

(assert (=> b!1186548 m!1094617))

(declare-fun m!1094619 () Bool)

(assert (=> b!1186548 m!1094619))

(declare-fun m!1094621 () Bool)

(assert (=> b!1186533 m!1094621))

(declare-fun m!1094623 () Bool)

(assert (=> b!1186533 m!1094623))

(declare-fun m!1094625 () Bool)

(assert (=> b!1186533 m!1094625))

(declare-fun m!1094627 () Bool)

(assert (=> b!1186533 m!1094627))

(declare-fun m!1094629 () Bool)

(assert (=> b!1186533 m!1094629))

(declare-fun m!1094631 () Bool)

(assert (=> b!1186533 m!1094631))

(assert (=> b!1186533 m!1094629))

(declare-fun m!1094633 () Bool)

(assert (=> b!1186543 m!1094633))

(declare-fun m!1094635 () Bool)

(assert (=> b!1186546 m!1094635))

(declare-fun m!1094637 () Bool)

(assert (=> b!1186542 m!1094637))

(declare-fun m!1094639 () Bool)

(assert (=> b!1186542 m!1094639))

(declare-fun m!1094641 () Bool)

(assert (=> b!1186542 m!1094641))

(declare-fun m!1094643 () Bool)

(assert (=> b!1186542 m!1094643))

(declare-fun m!1094645 () Bool)

(assert (=> b!1186542 m!1094645))

(declare-fun m!1094647 () Bool)

(assert (=> b!1186541 m!1094647))

(declare-fun m!1094649 () Bool)

(assert (=> b!1186535 m!1094649))

(declare-fun m!1094651 () Bool)

(assert (=> b!1186550 m!1094651))

(declare-fun m!1094653 () Bool)

(assert (=> b!1186540 m!1094653))

(declare-fun m!1094655 () Bool)

(assert (=> b!1186540 m!1094655))

(declare-fun m!1094657 () Bool)

(assert (=> b!1186540 m!1094657))

(assert (=> b!1186540 m!1094629))

(declare-fun m!1094659 () Bool)

(assert (=> b!1186540 m!1094659))

(assert (=> b!1186540 m!1094653))

(declare-fun m!1094661 () Bool)

(assert (=> b!1186540 m!1094661))

(declare-fun m!1094663 () Bool)

(assert (=> b!1186540 m!1094663))

(assert (=> b!1186540 m!1094629))

(assert (=> b!1186538 m!1094629))

(declare-fun m!1094665 () Bool)

(assert (=> mapNonEmpty!46721 m!1094665))

(declare-fun m!1094667 () Bool)

(assert (=> b!1186532 m!1094667))

(declare-fun m!1094669 () Bool)

(assert (=> b!1186532 m!1094669))

(declare-fun m!1094671 () Bool)

(assert (=> b!1186536 m!1094671))

(declare-fun m!1094673 () Bool)

(assert (=> start!99814 m!1094673))

(declare-fun m!1094675 () Bool)

(assert (=> start!99814 m!1094675))

(declare-fun m!1094677 () Bool)

(assert (=> b!1186534 m!1094677))

(declare-fun m!1094679 () Bool)

(assert (=> b!1186534 m!1094679))

(declare-fun m!1094681 () Bool)

(assert (=> b!1186534 m!1094681))

(declare-fun m!1094683 () Bool)

(assert (=> b!1186534 m!1094683))

(check-sat (not b!1186534) (not start!99814) (not b!1186536) (not b!1186542) (not b_next!25399) tp_is_empty!29929 (not b!1186548) (not b!1186543) (not mapNonEmpty!46721) (not b!1186532) (not b!1186533) (not b!1186540) (not b!1186531) (not b!1186535) (not b!1186546) (not b_lambda!20525) b_and!41645 (not b!1186541))
(check-sat b_and!41645 (not b_next!25399))
