; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98728 () Bool)

(assert start!98728)

(declare-fun b_free!24097 () Bool)

(declare-fun b_next!24097 () Bool)

(assert (=> start!98728 (= b_free!24097 (not b_next!24097))))

(declare-fun tp!85002 () Bool)

(declare-fun b_and!39045 () Bool)

(assert (=> start!98728 (= tp!85002 b_and!39045)))

(declare-datatypes ((V!43297 0))(
  ( (V!43298 (val!14370 Int)) )
))
(declare-datatypes ((tuple2!18178 0))(
  ( (tuple2!18179 (_1!9100 (_ BitVec 64)) (_2!9100 V!43297)) )
))
(declare-datatypes ((List!24940 0))(
  ( (Nil!24937) (Cons!24936 (h!26154 tuple2!18178) (t!36021 List!24940)) )
))
(declare-datatypes ((ListLongMap!16155 0))(
  ( (ListLongMap!16156 (toList!8093 List!24940)) )
))
(declare-fun call!50776 () ListLongMap!16155)

(declare-fun e!649255 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1140914 () Bool)

(declare-fun call!50771 () ListLongMap!16155)

(declare-fun -!1227 (ListLongMap!16155 (_ BitVec 64)) ListLongMap!16155)

(assert (=> b!1140914 (= e!649255 (= call!50776 (-!1227 call!50771 k0!934)))))

(declare-fun res!760510 () Bool)

(declare-fun e!649248 () Bool)

(assert (=> start!98728 (=> (not res!760510) (not e!649248))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74155 0))(
  ( (array!74156 (arr!35722 (Array (_ BitVec 32) (_ BitVec 64))) (size!36259 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74155)

(assert (=> start!98728 (= res!760510 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36259 _keys!1208))))))

(assert (=> start!98728 e!649248))

(declare-fun tp_is_empty!28627 () Bool)

(assert (=> start!98728 tp_is_empty!28627))

(declare-fun array_inv!27428 (array!74155) Bool)

(assert (=> start!98728 (array_inv!27428 _keys!1208)))

(assert (=> start!98728 true))

(assert (=> start!98728 tp!85002))

(declare-datatypes ((ValueCell!13604 0))(
  ( (ValueCellFull!13604 (v!17003 V!43297)) (EmptyCell!13604) )
))
(declare-datatypes ((array!74157 0))(
  ( (array!74158 (arr!35723 (Array (_ BitVec 32) ValueCell!13604)) (size!36260 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74157)

(declare-fun e!649253 () Bool)

(declare-fun array_inv!27429 (array!74157) Bool)

(assert (=> start!98728 (and (array_inv!27429 _values!996) e!649253)))

(declare-fun b!1140915 () Bool)

(declare-fun res!760512 () Bool)

(assert (=> b!1140915 (=> (not res!760512) (not e!649248))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74155 (_ BitVec 32)) Bool)

(assert (=> b!1140915 (= res!760512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140916 () Bool)

(declare-fun lt!507736 () ListLongMap!16155)

(declare-fun minValue!944 () V!43297)

(declare-fun contains!6640 (ListLongMap!16155 (_ BitVec 64)) Bool)

(declare-fun +!3542 (ListLongMap!16155 tuple2!18178) ListLongMap!16155)

(assert (=> b!1140916 (contains!6640 (+!3542 lt!507736 (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37333 0))(
  ( (Unit!37334) )
))
(declare-fun lt!507745 () Unit!37333)

(declare-fun addStillContains!770 (ListLongMap!16155 (_ BitVec 64) V!43297 (_ BitVec 64)) Unit!37333)

(assert (=> b!1140916 (= lt!507745 (addStillContains!770 lt!507736 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50773 () Bool)

(assert (=> b!1140916 call!50773))

(declare-fun call!50775 () ListLongMap!16155)

(assert (=> b!1140916 (= lt!507736 call!50775)))

(declare-fun lt!507742 () Unit!37333)

(declare-fun call!50777 () Unit!37333)

(assert (=> b!1140916 (= lt!507742 call!50777)))

(declare-fun e!649250 () Unit!37333)

(assert (=> b!1140916 (= e!649250 lt!507745)))

(declare-fun b!1140917 () Bool)

(declare-fun e!649244 () Unit!37333)

(declare-fun Unit!37335 () Unit!37333)

(assert (=> b!1140917 (= e!649244 Unit!37335)))

(declare-fun zeroValue!944 () V!43297)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!507746 () array!74155)

(declare-fun lt!507744 () array!74157)

(declare-fun bm!50768 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4601 (array!74155 array!74157 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) Int) ListLongMap!16155)

(assert (=> bm!50768 (= call!50776 (getCurrentListMapNoExtraKeys!4601 lt!507746 lt!507744 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140918 () Bool)

(declare-fun res!760508 () Bool)

(assert (=> b!1140918 (=> (not res!760508) (not e!649248))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140918 (= res!760508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36259 _keys!1208))))))

(declare-fun b!1140919 () Bool)

(declare-fun e!649249 () Bool)

(assert (=> b!1140919 (= e!649248 e!649249)))

(declare-fun res!760520 () Bool)

(assert (=> b!1140919 (=> (not res!760520) (not e!649249))))

(assert (=> b!1140919 (= res!760520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507746 mask!1564))))

(assert (=> b!1140919 (= lt!507746 (array!74156 (store (arr!35722 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36259 _keys!1208)))))

(declare-fun b!1140920 () Bool)

(declare-fun e!649245 () Unit!37333)

(declare-fun lt!507749 () Unit!37333)

(assert (=> b!1140920 (= e!649245 lt!507749)))

(declare-fun call!50772 () Unit!37333)

(assert (=> b!1140920 (= lt!507749 call!50772)))

(declare-fun call!50774 () Bool)

(assert (=> b!1140920 call!50774))

(declare-fun b!1140921 () Bool)

(declare-fun e!649254 () Bool)

(assert (=> b!1140921 (= e!649254 true)))

(declare-fun lt!507740 () V!43297)

(declare-fun lt!507751 () ListLongMap!16155)

(assert (=> b!1140921 (= (-!1227 (+!3542 lt!507751 (tuple2!18179 (select (arr!35722 _keys!1208) from!1455) lt!507740)) (select (arr!35722 _keys!1208) from!1455)) lt!507751)))

(declare-fun lt!507741 () Unit!37333)

(declare-fun addThenRemoveForNewKeyIsSame!87 (ListLongMap!16155 (_ BitVec 64) V!43297) Unit!37333)

(assert (=> b!1140921 (= lt!507741 (addThenRemoveForNewKeyIsSame!87 lt!507751 (select (arr!35722 _keys!1208) from!1455) lt!507740))))

(declare-fun lt!507731 () V!43297)

(declare-fun get!18164 (ValueCell!13604 V!43297) V!43297)

(assert (=> b!1140921 (= lt!507740 (get!18164 (select (arr!35723 _values!996) from!1455) lt!507731))))

(declare-fun lt!507750 () Unit!37333)

(declare-fun e!649241 () Unit!37333)

(assert (=> b!1140921 (= lt!507750 e!649241)))

(declare-fun c!112131 () Bool)

(assert (=> b!1140921 (= c!112131 (contains!6640 lt!507751 k0!934))))

(assert (=> b!1140921 (= lt!507751 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140922 () Bool)

(declare-fun res!760521 () Bool)

(assert (=> b!1140922 (=> (not res!760521) (not e!649249))))

(declare-datatypes ((List!24941 0))(
  ( (Nil!24938) (Cons!24937 (h!26155 (_ BitVec 64)) (t!36022 List!24941)) )
))
(declare-fun arrayNoDuplicates!0 (array!74155 (_ BitVec 32) List!24941) Bool)

(assert (=> b!1140922 (= res!760521 (arrayNoDuplicates!0 lt!507746 #b00000000000000000000000000000000 Nil!24938))))

(declare-fun b!1140923 () Bool)

(declare-fun c!112132 () Bool)

(declare-fun lt!507739 () Bool)

(assert (=> b!1140923 (= c!112132 (and (not lt!507739) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140923 (= e!649250 e!649245)))

(declare-fun b!1140924 () Bool)

(declare-fun e!649252 () Bool)

(assert (=> b!1140924 (= e!649252 tp_is_empty!28627)))

(declare-fun b!1140925 () Bool)

(declare-fun e!649243 () Bool)

(assert (=> b!1140925 (= e!649243 e!649254)))

(declare-fun res!760517 () Bool)

(assert (=> b!1140925 (=> res!760517 e!649254)))

(assert (=> b!1140925 (= res!760517 (not (= (select (arr!35722 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140925 e!649255))

(declare-fun c!112129 () Bool)

(assert (=> b!1140925 (= c!112129 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507735 () Unit!37333)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!485 (array!74155 array!74157 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37333)

(assert (=> b!1140925 (= lt!507735 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140926 () Bool)

(declare-fun e!649240 () Bool)

(assert (=> b!1140926 (= e!649240 e!649243)))

(declare-fun res!760511 () Bool)

(assert (=> b!1140926 (=> res!760511 e!649243)))

(assert (=> b!1140926 (= res!760511 (not (= from!1455 i!673)))))

(declare-fun lt!507732 () ListLongMap!16155)

(assert (=> b!1140926 (= lt!507732 (getCurrentListMapNoExtraKeys!4601 lt!507746 lt!507744 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140926 (= lt!507744 (array!74158 (store (arr!35723 _values!996) i!673 (ValueCellFull!13604 lt!507731)) (size!36260 _values!996)))))

(declare-fun dynLambda!2645 (Int (_ BitVec 64)) V!43297)

(assert (=> b!1140926 (= lt!507731 (dynLambda!2645 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507738 () ListLongMap!16155)

(assert (=> b!1140926 (= lt!507738 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44765 () Bool)

(declare-fun mapRes!44765 () Bool)

(assert (=> mapIsEmpty!44765 mapRes!44765))

(declare-fun b!1140927 () Bool)

(declare-fun res!760509 () Bool)

(assert (=> b!1140927 (=> (not res!760509) (not e!649248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140927 (= res!760509 (validKeyInArray!0 k0!934))))

(declare-fun bm!50769 () Bool)

(declare-fun call!50778 () ListLongMap!16155)

(declare-fun c!112133 () Bool)

(assert (=> bm!50769 (= call!50773 (contains!6640 (ite c!112133 lt!507736 call!50778) k0!934))))

(declare-fun b!1140928 () Bool)

(declare-fun Unit!37336 () Unit!37333)

(assert (=> b!1140928 (= e!649241 Unit!37336)))

(assert (=> b!1140928 (= lt!507739 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140928 (= c!112133 (and (not lt!507739) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507748 () Unit!37333)

(assert (=> b!1140928 (= lt!507748 e!649250)))

(declare-fun lt!507743 () Unit!37333)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!376 (array!74155 array!74157 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 64) (_ BitVec 32) Int) Unit!37333)

(assert (=> b!1140928 (= lt!507743 (lemmaListMapContainsThenArrayContainsFrom!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112130 () Bool)

(assert (=> b!1140928 (= c!112130 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760514 () Bool)

(declare-fun e!649242 () Bool)

(assert (=> b!1140928 (= res!760514 e!649242)))

(declare-fun e!649246 () Bool)

(assert (=> b!1140928 (=> (not res!760514) (not e!649246))))

(assert (=> b!1140928 e!649246))

(declare-fun lt!507737 () Unit!37333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74155 (_ BitVec 32) (_ BitVec 32)) Unit!37333)

(assert (=> b!1140928 (= lt!507737 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140928 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24938)))

(declare-fun lt!507747 () Unit!37333)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74155 (_ BitVec 64) (_ BitVec 32) List!24941) Unit!37333)

(assert (=> b!1140928 (= lt!507747 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24938))))

(assert (=> b!1140928 false))

(declare-fun bm!50770 () Bool)

(assert (=> bm!50770 (= call!50772 call!50777)))

(declare-fun b!1140929 () Bool)

(assert (=> b!1140929 (= e!649249 (not e!649240))))

(declare-fun res!760516 () Bool)

(assert (=> b!1140929 (=> res!760516 e!649240)))

(assert (=> b!1140929 (= res!760516 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140929 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507734 () Unit!37333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74155 (_ BitVec 64) (_ BitVec 32)) Unit!37333)

(assert (=> b!1140929 (= lt!507734 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140930 () Bool)

(assert (=> b!1140930 (= e!649242 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507739) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140931 () Bool)

(declare-fun res!760519 () Bool)

(assert (=> b!1140931 (=> (not res!760519) (not e!649248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140931 (= res!760519 (validMask!0 mask!1564))))

(declare-fun bm!50771 () Bool)

(assert (=> bm!50771 (= call!50778 call!50775)))

(declare-fun b!1140932 () Bool)

(assert (=> b!1140932 (= e!649245 e!649244)))

(declare-fun c!112134 () Bool)

(assert (=> b!1140932 (= c!112134 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507739))))

(declare-fun b!1140933 () Bool)

(assert (=> b!1140933 (= e!649246 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140934 () Bool)

(assert (=> b!1140934 (= e!649255 (= call!50776 call!50771))))

(declare-fun b!1140935 () Bool)

(assert (=> b!1140935 call!50774))

(declare-fun lt!507733 () Unit!37333)

(assert (=> b!1140935 (= lt!507733 call!50772)))

(assert (=> b!1140935 (= e!649244 lt!507733)))

(declare-fun b!1140936 () Bool)

(declare-fun Unit!37337 () Unit!37333)

(assert (=> b!1140936 (= e!649241 Unit!37337)))

(declare-fun bm!50772 () Bool)

(assert (=> bm!50772 (= call!50774 call!50773)))

(declare-fun b!1140937 () Bool)

(declare-fun res!760513 () Bool)

(assert (=> b!1140937 (=> (not res!760513) (not e!649248))))

(assert (=> b!1140937 (= res!760513 (= (select (arr!35722 _keys!1208) i!673) k0!934))))

(declare-fun b!1140938 () Bool)

(assert (=> b!1140938 (= e!649242 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50773 () Bool)

(assert (=> bm!50773 (= call!50777 (addStillContains!770 lt!507751 (ite (or c!112133 c!112132) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112133 c!112132) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1140939 () Bool)

(declare-fun res!760515 () Bool)

(assert (=> b!1140939 (=> (not res!760515) (not e!649248))))

(assert (=> b!1140939 (= res!760515 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24938))))

(declare-fun bm!50774 () Bool)

(assert (=> bm!50774 (= call!50771 (getCurrentListMapNoExtraKeys!4601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140940 () Bool)

(declare-fun e!649247 () Bool)

(assert (=> b!1140940 (= e!649247 tp_is_empty!28627)))

(declare-fun b!1140941 () Bool)

(assert (=> b!1140941 (= e!649253 (and e!649247 mapRes!44765))))

(declare-fun condMapEmpty!44765 () Bool)

(declare-fun mapDefault!44765 () ValueCell!13604)

(assert (=> b!1140941 (= condMapEmpty!44765 (= (arr!35723 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13604)) mapDefault!44765)))))

(declare-fun mapNonEmpty!44765 () Bool)

(declare-fun tp!85001 () Bool)

(assert (=> mapNonEmpty!44765 (= mapRes!44765 (and tp!85001 e!649252))))

(declare-fun mapValue!44765 () ValueCell!13604)

(declare-fun mapRest!44765 () (Array (_ BitVec 32) ValueCell!13604))

(declare-fun mapKey!44765 () (_ BitVec 32))

(assert (=> mapNonEmpty!44765 (= (arr!35723 _values!996) (store mapRest!44765 mapKey!44765 mapValue!44765))))

(declare-fun bm!50775 () Bool)

(assert (=> bm!50775 (= call!50775 (+!3542 lt!507751 (ite (or c!112133 c!112132) (tuple2!18179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1140942 () Bool)

(declare-fun res!760518 () Bool)

(assert (=> b!1140942 (=> (not res!760518) (not e!649248))))

(assert (=> b!1140942 (= res!760518 (and (= (size!36260 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36259 _keys!1208) (size!36260 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98728 res!760510) b!1140931))

(assert (= (and b!1140931 res!760519) b!1140942))

(assert (= (and b!1140942 res!760518) b!1140915))

(assert (= (and b!1140915 res!760512) b!1140939))

(assert (= (and b!1140939 res!760515) b!1140918))

(assert (= (and b!1140918 res!760508) b!1140927))

(assert (= (and b!1140927 res!760509) b!1140937))

(assert (= (and b!1140937 res!760513) b!1140919))

(assert (= (and b!1140919 res!760520) b!1140922))

(assert (= (and b!1140922 res!760521) b!1140929))

(assert (= (and b!1140929 (not res!760516)) b!1140926))

(assert (= (and b!1140926 (not res!760511)) b!1140925))

(assert (= (and b!1140925 c!112129) b!1140914))

(assert (= (and b!1140925 (not c!112129)) b!1140934))

(assert (= (or b!1140914 b!1140934) bm!50768))

(assert (= (or b!1140914 b!1140934) bm!50774))

(assert (= (and b!1140925 (not res!760517)) b!1140921))

(assert (= (and b!1140921 c!112131) b!1140928))

(assert (= (and b!1140921 (not c!112131)) b!1140936))

(assert (= (and b!1140928 c!112133) b!1140916))

(assert (= (and b!1140928 (not c!112133)) b!1140923))

(assert (= (and b!1140923 c!112132) b!1140920))

(assert (= (and b!1140923 (not c!112132)) b!1140932))

(assert (= (and b!1140932 c!112134) b!1140935))

(assert (= (and b!1140932 (not c!112134)) b!1140917))

(assert (= (or b!1140920 b!1140935) bm!50770))

(assert (= (or b!1140920 b!1140935) bm!50771))

(assert (= (or b!1140920 b!1140935) bm!50772))

(assert (= (or b!1140916 bm!50772) bm!50769))

(assert (= (or b!1140916 bm!50770) bm!50773))

(assert (= (or b!1140916 bm!50771) bm!50775))

(assert (= (and b!1140928 c!112130) b!1140938))

(assert (= (and b!1140928 (not c!112130)) b!1140930))

(assert (= (and b!1140928 res!760514) b!1140933))

(assert (= (and b!1140941 condMapEmpty!44765) mapIsEmpty!44765))

(assert (= (and b!1140941 (not condMapEmpty!44765)) mapNonEmpty!44765))

(get-info :version)

(assert (= (and mapNonEmpty!44765 ((_ is ValueCellFull!13604) mapValue!44765)) b!1140924))

(assert (= (and b!1140941 ((_ is ValueCellFull!13604) mapDefault!44765)) b!1140940))

(assert (= start!98728 b!1140941))

(declare-fun b_lambda!19197 () Bool)

(assert (=> (not b_lambda!19197) (not b!1140926)))

(declare-fun t!36020 () Bool)

(declare-fun tb!8901 () Bool)

(assert (=> (and start!98728 (= defaultEntry!1004 defaultEntry!1004) t!36020) tb!8901))

(declare-fun result!18375 () Bool)

(assert (=> tb!8901 (= result!18375 tp_is_empty!28627)))

(assert (=> b!1140926 t!36020))

(declare-fun b_and!39047 () Bool)

(assert (= b_and!39045 (and (=> t!36020 result!18375) b_and!39047)))

(declare-fun m!1052811 () Bool)

(assert (=> mapNonEmpty!44765 m!1052811))

(declare-fun m!1052813 () Bool)

(assert (=> b!1140915 m!1052813))

(declare-fun m!1052815 () Bool)

(assert (=> b!1140929 m!1052815))

(declare-fun m!1052817 () Bool)

(assert (=> b!1140929 m!1052817))

(declare-fun m!1052819 () Bool)

(assert (=> b!1140925 m!1052819))

(declare-fun m!1052821 () Bool)

(assert (=> b!1140925 m!1052821))

(declare-fun m!1052823 () Bool)

(assert (=> bm!50774 m!1052823))

(declare-fun m!1052825 () Bool)

(assert (=> b!1140922 m!1052825))

(declare-fun m!1052827 () Bool)

(assert (=> bm!50775 m!1052827))

(declare-fun m!1052829 () Bool)

(assert (=> b!1140939 m!1052829))

(declare-fun m!1052831 () Bool)

(assert (=> b!1140927 m!1052831))

(declare-fun m!1052833 () Bool)

(assert (=> b!1140926 m!1052833))

(declare-fun m!1052835 () Bool)

(assert (=> b!1140926 m!1052835))

(declare-fun m!1052837 () Bool)

(assert (=> b!1140926 m!1052837))

(declare-fun m!1052839 () Bool)

(assert (=> b!1140926 m!1052839))

(declare-fun m!1052841 () Bool)

(assert (=> b!1140928 m!1052841))

(declare-fun m!1052843 () Bool)

(assert (=> b!1140928 m!1052843))

(declare-fun m!1052845 () Bool)

(assert (=> b!1140928 m!1052845))

(declare-fun m!1052847 () Bool)

(assert (=> b!1140928 m!1052847))

(declare-fun m!1052849 () Bool)

(assert (=> b!1140919 m!1052849))

(declare-fun m!1052851 () Bool)

(assert (=> b!1140919 m!1052851))

(declare-fun m!1052853 () Bool)

(assert (=> b!1140914 m!1052853))

(declare-fun m!1052855 () Bool)

(assert (=> bm!50769 m!1052855))

(declare-fun m!1052857 () Bool)

(assert (=> bm!50768 m!1052857))

(declare-fun m!1052859 () Bool)

(assert (=> start!98728 m!1052859))

(declare-fun m!1052861 () Bool)

(assert (=> start!98728 m!1052861))

(assert (=> b!1140921 m!1052823))

(declare-fun m!1052863 () Bool)

(assert (=> b!1140921 m!1052863))

(declare-fun m!1052865 () Bool)

(assert (=> b!1140921 m!1052865))

(assert (=> b!1140921 m!1052865))

(assert (=> b!1140921 m!1052819))

(declare-fun m!1052867 () Bool)

(assert (=> b!1140921 m!1052867))

(assert (=> b!1140921 m!1052863))

(declare-fun m!1052869 () Bool)

(assert (=> b!1140921 m!1052869))

(assert (=> b!1140921 m!1052819))

(declare-fun m!1052871 () Bool)

(assert (=> b!1140921 m!1052871))

(assert (=> b!1140921 m!1052819))

(declare-fun m!1052873 () Bool)

(assert (=> b!1140921 m!1052873))

(declare-fun m!1052875 () Bool)

(assert (=> b!1140931 m!1052875))

(declare-fun m!1052877 () Bool)

(assert (=> b!1140938 m!1052877))

(declare-fun m!1052879 () Bool)

(assert (=> b!1140937 m!1052879))

(declare-fun m!1052881 () Bool)

(assert (=> bm!50773 m!1052881))

(assert (=> b!1140933 m!1052877))

(declare-fun m!1052883 () Bool)

(assert (=> b!1140916 m!1052883))

(assert (=> b!1140916 m!1052883))

(declare-fun m!1052885 () Bool)

(assert (=> b!1140916 m!1052885))

(declare-fun m!1052887 () Bool)

(assert (=> b!1140916 m!1052887))

(check-sat (not bm!50769) (not b!1140921) (not start!98728) (not bm!50774) (not b!1140928) (not bm!50768) (not b!1140919) (not b!1140938) (not b_lambda!19197) (not mapNonEmpty!44765) (not b!1140929) (not b!1140925) (not bm!50773) (not b!1140914) (not b!1140933) (not b!1140915) (not b!1140939) b_and!39047 (not bm!50775) (not b!1140926) (not b!1140916) tp_is_empty!28627 (not b!1140927) (not b!1140931) (not b_next!24097) (not b!1140922))
(check-sat b_and!39047 (not b_next!24097))
