; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100764 () Bool)

(assert start!100764)

(declare-fun b_free!25935 () Bool)

(declare-fun b_next!25935 () Bool)

(assert (=> start!100764 (= b_free!25935 (not b_next!25935))))

(declare-fun tp!90807 () Bool)

(declare-fun b_and!42853 () Bool)

(assert (=> start!100764 (= tp!90807 b_and!42853)))

(declare-fun b!1205779 () Bool)

(declare-fun res!801973 () Bool)

(declare-fun e!684747 () Bool)

(assert (=> b!1205779 (=> (not res!801973) (not e!684747))))

(declare-datatypes ((array!78059 0))(
  ( (array!78060 (arr!37670 (Array (_ BitVec 32) (_ BitVec 64))) (size!38206 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78059)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1205779 (= res!801973 (= (select (arr!37670 _keys!1208) i!673) k0!934))))

(declare-fun b!1205780 () Bool)

(declare-fun e!684745 () Bool)

(declare-fun e!684758 () Bool)

(assert (=> b!1205780 (= e!684745 e!684758)))

(declare-fun res!801968 () Bool)

(assert (=> b!1205780 (=> res!801968 e!684758)))

(declare-datatypes ((V!45979 0))(
  ( (V!45980 (val!15376 Int)) )
))
(declare-datatypes ((tuple2!19724 0))(
  ( (tuple2!19725 (_1!9873 (_ BitVec 64)) (_2!9873 V!45979)) )
))
(declare-datatypes ((List!26529 0))(
  ( (Nil!26526) (Cons!26525 (h!27734 tuple2!19724) (t!39444 List!26529)) )
))
(declare-datatypes ((ListLongMap!17693 0))(
  ( (ListLongMap!17694 (toList!8862 List!26529)) )
))
(declare-fun lt!546932 () ListLongMap!17693)

(declare-fun contains!6922 (ListLongMap!17693 (_ BitVec 64)) Bool)

(assert (=> b!1205780 (= res!801968 (not (contains!6922 lt!546932 k0!934)))))

(declare-fun zeroValue!944 () V!45979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14610 0))(
  ( (ValueCellFull!14610 (v!18020 V!45979)) (EmptyCell!14610) )
))
(declare-datatypes ((array!78061 0))(
  ( (array!78062 (arr!37671 (Array (_ BitVec 32) ValueCell!14610)) (size!38207 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78061)

(declare-fun minValue!944 () V!45979)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5297 (array!78059 array!78061 (_ BitVec 32) (_ BitVec 32) V!45979 V!45979 (_ BitVec 32) Int) ListLongMap!17693)

(assert (=> b!1205780 (= lt!546932 (getCurrentListMapNoExtraKeys!5297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58553 () ListLongMap!17693)

(declare-fun b!1205781 () Bool)

(declare-fun e!684757 () Bool)

(declare-fun call!58549 () ListLongMap!17693)

(declare-fun -!1823 (ListLongMap!17693 (_ BitVec 64)) ListLongMap!17693)

(assert (=> b!1205781 (= e!684757 (= call!58553 (-!1823 call!58549 k0!934)))))

(declare-fun e!684743 () Bool)

(declare-fun lt!546921 () Bool)

(declare-fun b!1205782 () Bool)

(assert (=> b!1205782 (= e!684743 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546921) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205783 () Bool)

(declare-fun res!801979 () Bool)

(assert (=> b!1205783 (=> (not res!801979) (not e!684747))))

(assert (=> b!1205783 (= res!801979 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38206 _keys!1208))))))

(declare-fun b!1205784 () Bool)

(declare-fun call!58554 () Bool)

(assert (=> b!1205784 call!58554))

(declare-datatypes ((Unit!39975 0))(
  ( (Unit!39976) )
))
(declare-fun lt!546924 () Unit!39975)

(declare-fun call!58552 () Unit!39975)

(assert (=> b!1205784 (= lt!546924 call!58552)))

(declare-fun e!684756 () Unit!39975)

(assert (=> b!1205784 (= e!684756 lt!546924)))

(declare-fun bm!58545 () Bool)

(assert (=> bm!58545 (= call!58549 (getCurrentListMapNoExtraKeys!5297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118344 () Bool)

(declare-fun call!58551 () Unit!39975)

(declare-fun bm!58546 () Bool)

(declare-fun c!118342 () Bool)

(declare-fun addStillContains!1014 (ListLongMap!17693 (_ BitVec 64) V!45979 (_ BitVec 64)) Unit!39975)

(assert (=> bm!58546 (= call!58551 (addStillContains!1014 lt!546932 (ite (or c!118344 c!118342) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118344 c!118342) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!58547 () Bool)

(declare-fun lt!546934 () ListLongMap!17693)

(declare-fun call!58555 () ListLongMap!17693)

(declare-fun +!3985 (ListLongMap!17693 tuple2!19724) ListLongMap!17693)

(assert (=> bm!58547 (= call!58555 (+!3985 (ite c!118344 lt!546934 lt!546932) (ite c!118344 (tuple2!19725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118342 (tuple2!19725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!58550 () ListLongMap!17693)

(declare-fun call!58548 () Bool)

(declare-fun bm!58548 () Bool)

(assert (=> bm!58548 (= call!58548 (contains!6922 (ite c!118344 lt!546934 call!58550) k0!934))))

(declare-fun b!1205785 () Bool)

(declare-fun e!684754 () Bool)

(assert (=> b!1205785 (= e!684747 e!684754)))

(declare-fun res!801980 () Bool)

(assert (=> b!1205785 (=> (not res!801980) (not e!684754))))

(declare-fun lt!546927 () array!78059)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78059 (_ BitVec 32)) Bool)

(assert (=> b!1205785 (= res!801980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546927 mask!1564))))

(assert (=> b!1205785 (= lt!546927 (array!78060 (store (arr!37670 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38206 _keys!1208)))))

(declare-fun mapNonEmpty!47814 () Bool)

(declare-fun mapRes!47814 () Bool)

(declare-fun tp!90808 () Bool)

(declare-fun e!684749 () Bool)

(assert (=> mapNonEmpty!47814 (= mapRes!47814 (and tp!90808 e!684749))))

(declare-fun mapValue!47814 () ValueCell!14610)

(declare-fun mapKey!47814 () (_ BitVec 32))

(declare-fun mapRest!47814 () (Array (_ BitVec 32) ValueCell!14610))

(assert (=> mapNonEmpty!47814 (= (arr!37671 _values!996) (store mapRest!47814 mapKey!47814 mapValue!47814))))

(declare-fun b!1205786 () Bool)

(declare-fun e!684755 () Unit!39975)

(declare-fun lt!546920 () Unit!39975)

(assert (=> b!1205786 (= e!684755 lt!546920)))

(declare-fun lt!546926 () Unit!39975)

(assert (=> b!1205786 (= lt!546926 call!58551)))

(assert (=> b!1205786 (= lt!546934 (+!3985 lt!546932 (tuple2!19725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205786 call!58548))

(assert (=> b!1205786 (= lt!546920 (addStillContains!1014 lt!546934 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1205786 (contains!6922 call!58555 k0!934)))

(declare-fun b!1205787 () Bool)

(declare-fun e!684752 () Unit!39975)

(declare-fun Unit!39977 () Unit!39975)

(assert (=> b!1205787 (= e!684752 Unit!39977)))

(declare-fun mapIsEmpty!47814 () Bool)

(assert (=> mapIsEmpty!47814 mapRes!47814))

(declare-fun res!801977 () Bool)

(assert (=> start!100764 (=> (not res!801977) (not e!684747))))

(assert (=> start!100764 (= res!801977 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38206 _keys!1208))))))

(assert (=> start!100764 e!684747))

(declare-fun tp_is_empty!30639 () Bool)

(assert (=> start!100764 tp_is_empty!30639))

(declare-fun array_inv!28700 (array!78059) Bool)

(assert (=> start!100764 (array_inv!28700 _keys!1208)))

(assert (=> start!100764 true))

(assert (=> start!100764 tp!90807))

(declare-fun e!684753 () Bool)

(declare-fun array_inv!28701 (array!78061) Bool)

(assert (=> start!100764 (and (array_inv!28701 _values!996) e!684753)))

(declare-fun b!1205788 () Bool)

(declare-fun res!801974 () Bool)

(assert (=> b!1205788 (=> (not res!801974) (not e!684747))))

(declare-datatypes ((List!26530 0))(
  ( (Nil!26527) (Cons!26526 (h!27735 (_ BitVec 64)) (t!39445 List!26530)) )
))
(declare-fun arrayNoDuplicates!0 (array!78059 (_ BitVec 32) List!26530) Bool)

(assert (=> b!1205788 (= res!801974 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26527))))

(declare-fun b!1205789 () Bool)

(declare-fun e!684750 () Bool)

(assert (=> b!1205789 (= e!684753 (and e!684750 mapRes!47814))))

(declare-fun condMapEmpty!47814 () Bool)

(declare-fun mapDefault!47814 () ValueCell!14610)

(assert (=> b!1205789 (= condMapEmpty!47814 (= (arr!37671 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14610)) mapDefault!47814)))))

(declare-fun bm!58549 () Bool)

(assert (=> bm!58549 (= call!58552 call!58551)))

(declare-fun b!1205790 () Bool)

(assert (=> b!1205790 (= e!684757 (= call!58553 call!58549))))

(declare-fun b!1205791 () Bool)

(declare-fun e!684751 () Bool)

(assert (=> b!1205791 (= e!684754 (not e!684751))))

(declare-fun res!801978 () Bool)

(assert (=> b!1205791 (=> res!801978 e!684751)))

(assert (=> b!1205791 (= res!801978 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205791 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546933 () Unit!39975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78059 (_ BitVec 64) (_ BitVec 32)) Unit!39975)

(assert (=> b!1205791 (= lt!546933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1205792 () Bool)

(declare-fun res!801969 () Bool)

(assert (=> b!1205792 (=> (not res!801969) (not e!684747))))

(assert (=> b!1205792 (= res!801969 (and (= (size!38207 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38206 _keys!1208) (size!38207 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205793 () Bool)

(declare-fun res!801976 () Bool)

(assert (=> b!1205793 (=> (not res!801976) (not e!684747))))

(assert (=> b!1205793 (= res!801976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!546925 () array!78061)

(declare-fun bm!58550 () Bool)

(assert (=> bm!58550 (= call!58553 (getCurrentListMapNoExtraKeys!5297 lt!546927 lt!546925 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205794 () Bool)

(declare-fun res!801975 () Bool)

(assert (=> b!1205794 (=> (not res!801975) (not e!684754))))

(assert (=> b!1205794 (= res!801975 (arrayNoDuplicates!0 lt!546927 #b00000000000000000000000000000000 Nil!26527))))

(declare-fun e!684746 () Bool)

(declare-fun b!1205795 () Bool)

(assert (=> b!1205795 (= e!684746 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205796 () Bool)

(assert (=> b!1205796 (= e!684743 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58551 () Bool)

(assert (=> bm!58551 (= call!58550 call!58555)))

(declare-fun b!1205797 () Bool)

(declare-fun e!684744 () Bool)

(assert (=> b!1205797 (= e!684744 e!684745)))

(declare-fun res!801970 () Bool)

(assert (=> b!1205797 (=> res!801970 e!684745)))

(assert (=> b!1205797 (= res!801970 (not (= (select (arr!37670 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1205797 e!684757))

(declare-fun c!118340 () Bool)

(assert (=> b!1205797 (= c!118340 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546928 () Unit!39975)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 (array!78059 array!78061 (_ BitVec 32) (_ BitVec 32) V!45979 V!45979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39975)

(assert (=> b!1205797 (= lt!546928 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205798 () Bool)

(assert (=> b!1205798 (= e!684758 true)))

(assert (=> b!1205798 e!684746))

(declare-fun res!801971 () Bool)

(assert (=> b!1205798 (=> (not res!801971) (not e!684746))))

(assert (=> b!1205798 (= res!801971 e!684743)))

(declare-fun c!118341 () Bool)

(assert (=> b!1205798 (= c!118341 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546922 () Unit!39975)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!568 (array!78059 array!78061 (_ BitVec 32) (_ BitVec 32) V!45979 V!45979 (_ BitVec 64) (_ BitVec 32) Int) Unit!39975)

(assert (=> b!1205798 (= lt!546922 (lemmaListMapContainsThenArrayContainsFrom!568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546929 () Unit!39975)

(assert (=> b!1205798 (= lt!546929 e!684755)))

(assert (=> b!1205798 (= c!118344 (and (not lt!546921) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205798 (= lt!546921 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205799 () Bool)

(assert (=> b!1205799 (= e!684750 tp_is_empty!30639)))

(declare-fun bm!58552 () Bool)

(assert (=> bm!58552 (= call!58554 call!58548)))

(declare-fun b!1205800 () Bool)

(declare-fun c!118343 () Bool)

(assert (=> b!1205800 (= c!118343 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546921))))

(assert (=> b!1205800 (= e!684756 e!684752)))

(declare-fun b!1205801 () Bool)

(declare-fun res!801981 () Bool)

(assert (=> b!1205801 (=> (not res!801981) (not e!684747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205801 (= res!801981 (validMask!0 mask!1564))))

(declare-fun b!1205802 () Bool)

(assert (=> b!1205802 (= e!684751 e!684744)))

(declare-fun res!801972 () Bool)

(assert (=> b!1205802 (=> res!801972 e!684744)))

(assert (=> b!1205802 (= res!801972 (not (= from!1455 i!673)))))

(declare-fun lt!546923 () ListLongMap!17693)

(assert (=> b!1205802 (= lt!546923 (getCurrentListMapNoExtraKeys!5297 lt!546927 lt!546925 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3205 (Int (_ BitVec 64)) V!45979)

(assert (=> b!1205802 (= lt!546925 (array!78062 (store (arr!37671 _values!996) i!673 (ValueCellFull!14610 (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38207 _values!996)))))

(declare-fun lt!546930 () ListLongMap!17693)

(assert (=> b!1205802 (= lt!546930 (getCurrentListMapNoExtraKeys!5297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205803 () Bool)

(assert (=> b!1205803 (= e!684749 tp_is_empty!30639)))

(declare-fun b!1205804 () Bool)

(assert (=> b!1205804 (= e!684755 e!684756)))

(assert (=> b!1205804 (= c!118342 (and (not lt!546921) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205805 () Bool)

(declare-fun res!801982 () Bool)

(assert (=> b!1205805 (=> (not res!801982) (not e!684747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205805 (= res!801982 (validKeyInArray!0 k0!934))))

(declare-fun b!1205806 () Bool)

(declare-fun lt!546931 () Unit!39975)

(assert (=> b!1205806 (= e!684752 lt!546931)))

(assert (=> b!1205806 (= lt!546931 call!58552)))

(assert (=> b!1205806 call!58554))

(assert (= (and start!100764 res!801977) b!1205801))

(assert (= (and b!1205801 res!801981) b!1205792))

(assert (= (and b!1205792 res!801969) b!1205793))

(assert (= (and b!1205793 res!801976) b!1205788))

(assert (= (and b!1205788 res!801974) b!1205783))

(assert (= (and b!1205783 res!801979) b!1205805))

(assert (= (and b!1205805 res!801982) b!1205779))

(assert (= (and b!1205779 res!801973) b!1205785))

(assert (= (and b!1205785 res!801980) b!1205794))

(assert (= (and b!1205794 res!801975) b!1205791))

(assert (= (and b!1205791 (not res!801978)) b!1205802))

(assert (= (and b!1205802 (not res!801972)) b!1205797))

(assert (= (and b!1205797 c!118340) b!1205781))

(assert (= (and b!1205797 (not c!118340)) b!1205790))

(assert (= (or b!1205781 b!1205790) bm!58550))

(assert (= (or b!1205781 b!1205790) bm!58545))

(assert (= (and b!1205797 (not res!801970)) b!1205780))

(assert (= (and b!1205780 (not res!801968)) b!1205798))

(assert (= (and b!1205798 c!118344) b!1205786))

(assert (= (and b!1205798 (not c!118344)) b!1205804))

(assert (= (and b!1205804 c!118342) b!1205784))

(assert (= (and b!1205804 (not c!118342)) b!1205800))

(assert (= (and b!1205800 c!118343) b!1205806))

(assert (= (and b!1205800 (not c!118343)) b!1205787))

(assert (= (or b!1205784 b!1205806) bm!58549))

(assert (= (or b!1205784 b!1205806) bm!58551))

(assert (= (or b!1205784 b!1205806) bm!58552))

(assert (= (or b!1205786 bm!58552) bm!58548))

(assert (= (or b!1205786 bm!58549) bm!58546))

(assert (= (or b!1205786 bm!58551) bm!58547))

(assert (= (and b!1205798 c!118341) b!1205796))

(assert (= (and b!1205798 (not c!118341)) b!1205782))

(assert (= (and b!1205798 res!801971) b!1205795))

(assert (= (and b!1205789 condMapEmpty!47814) mapIsEmpty!47814))

(assert (= (and b!1205789 (not condMapEmpty!47814)) mapNonEmpty!47814))

(get-info :version)

(assert (= (and mapNonEmpty!47814 ((_ is ValueCellFull!14610) mapValue!47814)) b!1205803))

(assert (= (and b!1205789 ((_ is ValueCellFull!14610) mapDefault!47814)) b!1205799))

(assert (= start!100764 b!1205789))

(declare-fun b_lambda!21331 () Bool)

(assert (=> (not b_lambda!21331) (not b!1205802)))

(declare-fun t!39443 () Bool)

(declare-fun tb!10735 () Bool)

(assert (=> (and start!100764 (= defaultEntry!1004 defaultEntry!1004) t!39443) tb!10735))

(declare-fun result!22055 () Bool)

(assert (=> tb!10735 (= result!22055 tp_is_empty!30639)))

(assert (=> b!1205802 t!39443))

(declare-fun b_and!42855 () Bool)

(assert (= b_and!42853 (and (=> t!39443 result!22055) b_and!42855)))

(declare-fun m!1111591 () Bool)

(assert (=> b!1205795 m!1111591))

(assert (=> b!1205796 m!1111591))

(declare-fun m!1111593 () Bool)

(assert (=> b!1205780 m!1111593))

(declare-fun m!1111595 () Bool)

(assert (=> b!1205780 m!1111595))

(declare-fun m!1111597 () Bool)

(assert (=> bm!58547 m!1111597))

(declare-fun m!1111599 () Bool)

(assert (=> mapNonEmpty!47814 m!1111599))

(declare-fun m!1111601 () Bool)

(assert (=> b!1205786 m!1111601))

(declare-fun m!1111603 () Bool)

(assert (=> b!1205786 m!1111603))

(declare-fun m!1111605 () Bool)

(assert (=> b!1205786 m!1111605))

(declare-fun m!1111607 () Bool)

(assert (=> bm!58546 m!1111607))

(declare-fun m!1111609 () Bool)

(assert (=> bm!58548 m!1111609))

(declare-fun m!1111611 () Bool)

(assert (=> b!1205793 m!1111611))

(declare-fun m!1111613 () Bool)

(assert (=> b!1205791 m!1111613))

(declare-fun m!1111615 () Bool)

(assert (=> b!1205791 m!1111615))

(assert (=> bm!58545 m!1111595))

(declare-fun m!1111617 () Bool)

(assert (=> b!1205801 m!1111617))

(declare-fun m!1111619 () Bool)

(assert (=> b!1205788 m!1111619))

(declare-fun m!1111621 () Bool)

(assert (=> start!100764 m!1111621))

(declare-fun m!1111623 () Bool)

(assert (=> start!100764 m!1111623))

(declare-fun m!1111625 () Bool)

(assert (=> bm!58550 m!1111625))

(declare-fun m!1111627 () Bool)

(assert (=> b!1205785 m!1111627))

(declare-fun m!1111629 () Bool)

(assert (=> b!1205785 m!1111629))

(declare-fun m!1111631 () Bool)

(assert (=> b!1205802 m!1111631))

(declare-fun m!1111633 () Bool)

(assert (=> b!1205802 m!1111633))

(declare-fun m!1111635 () Bool)

(assert (=> b!1205802 m!1111635))

(declare-fun m!1111637 () Bool)

(assert (=> b!1205802 m!1111637))

(declare-fun m!1111639 () Bool)

(assert (=> b!1205798 m!1111639))

(declare-fun m!1111641 () Bool)

(assert (=> b!1205781 m!1111641))

(declare-fun m!1111643 () Bool)

(assert (=> b!1205779 m!1111643))

(declare-fun m!1111645 () Bool)

(assert (=> b!1205794 m!1111645))

(declare-fun m!1111647 () Bool)

(assert (=> b!1205805 m!1111647))

(declare-fun m!1111649 () Bool)

(assert (=> b!1205797 m!1111649))

(declare-fun m!1111651 () Bool)

(assert (=> b!1205797 m!1111651))

(check-sat (not b!1205795) (not b!1205805) (not b!1205793) (not bm!58550) (not b!1205797) (not b!1205794) (not b_lambda!21331) (not bm!58545) (not b!1205785) (not mapNonEmpty!47814) (not bm!58546) (not b!1205781) (not b!1205786) (not b!1205801) (not b_next!25935) (not b!1205780) (not b!1205788) (not b!1205802) tp_is_empty!30639 (not b!1205796) (not bm!58547) b_and!42855 (not bm!58548) (not b!1205798) (not b!1205791) (not start!100764))
(check-sat b_and!42855 (not b_next!25935))
