; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98828 () Bool)

(assert start!98828)

(declare-fun b_free!24439 () Bool)

(declare-fun b_next!24439 () Bool)

(assert (=> start!98828 (= b_free!24439 (not b_next!24439))))

(declare-fun tp!86027 () Bool)

(declare-fun b_and!39705 () Bool)

(assert (=> start!98828 (= tp!86027 b_and!39705)))

(declare-datatypes ((V!43753 0))(
  ( (V!43754 (val!14541 Int)) )
))
(declare-fun zeroValue!944 () V!43753)

(declare-fun c!114783 () Bool)

(declare-datatypes ((tuple2!18566 0))(
  ( (tuple2!18567 (_1!9294 (_ BitVec 64)) (_2!9294 V!43753)) )
))
(declare-datatypes ((List!25296 0))(
  ( (Nil!25293) (Cons!25292 (h!26501 tuple2!18566) (t!36718 List!25296)) )
))
(declare-datatypes ((ListLongMap!16535 0))(
  ( (ListLongMap!16536 (toList!8283 List!25296)) )
))
(declare-fun lt!518029 () ListLongMap!16535)

(declare-fun bm!54784 () Bool)

(declare-fun minValue!944 () V!43753)

(declare-fun c!114786 () Bool)

(declare-fun call!54793 () ListLongMap!16535)

(declare-fun lt!518034 () ListLongMap!16535)

(declare-fun +!3694 (ListLongMap!16535 tuple2!18566) ListLongMap!16535)

(assert (=> bm!54784 (= call!54793 (+!3694 (ite c!114786 lt!518029 lt!518034) (ite c!114786 (tuple2!18567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114783 (tuple2!18567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!767492 () Bool)

(declare-fun e!656910 () Bool)

(assert (=> start!98828 (=> (not res!767492) (not e!656910))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74702 0))(
  ( (array!74703 (arr!36002 (Array (_ BitVec 32) (_ BitVec 64))) (size!36540 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74702)

(assert (=> start!98828 (= res!767492 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36540 _keys!1208))))))

(assert (=> start!98828 e!656910))

(declare-fun tp_is_empty!28969 () Bool)

(assert (=> start!98828 tp_is_empty!28969))

(declare-fun array_inv!27666 (array!74702) Bool)

(assert (=> start!98828 (array_inv!27666 _keys!1208)))

(assert (=> start!98828 true))

(assert (=> start!98828 tp!86027))

(declare-datatypes ((ValueCell!13775 0))(
  ( (ValueCellFull!13775 (v!17177 V!43753)) (EmptyCell!13775) )
))
(declare-datatypes ((array!74704 0))(
  ( (array!74705 (arr!36003 (Array (_ BitVec 32) ValueCell!13775)) (size!36541 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74704)

(declare-fun e!656913 () Bool)

(declare-fun array_inv!27667 (array!74704) Bool)

(assert (=> start!98828 (and (array_inv!27667 _values!996) e!656913)))

(declare-fun b!1155082 () Bool)

(declare-fun e!656911 () Bool)

(assert (=> b!1155082 (= e!656911 tp_is_empty!28969)))

(declare-fun b!1155083 () Bool)

(declare-fun e!656901 () Bool)

(assert (=> b!1155083 (= e!656901 true)))

(declare-fun e!656916 () Bool)

(assert (=> b!1155083 e!656916))

(declare-fun res!767488 () Bool)

(assert (=> b!1155083 (=> (not res!767488) (not e!656916))))

(declare-fun lt!518028 () ListLongMap!16535)

(assert (=> b!1155083 (= res!767488 (= lt!518028 lt!518034))))

(declare-fun lt!518046 () ListLongMap!16535)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1342 (ListLongMap!16535 (_ BitVec 64)) ListLongMap!16535)

(assert (=> b!1155083 (= lt!518028 (-!1342 lt!518046 k0!934))))

(declare-fun lt!518035 () V!43753)

(assert (=> b!1155083 (= (-!1342 (+!3694 lt!518034 (tuple2!18567 (select (arr!36002 _keys!1208) from!1455) lt!518035)) (select (arr!36002 _keys!1208) from!1455)) lt!518034)))

(declare-datatypes ((Unit!37876 0))(
  ( (Unit!37877) )
))
(declare-fun lt!518044 () Unit!37876)

(declare-fun addThenRemoveForNewKeyIsSame!195 (ListLongMap!16535 (_ BitVec 64) V!43753) Unit!37876)

(assert (=> b!1155083 (= lt!518044 (addThenRemoveForNewKeyIsSame!195 lt!518034 (select (arr!36002 _keys!1208) from!1455) lt!518035))))

(declare-fun lt!518048 () V!43753)

(declare-fun get!18355 (ValueCell!13775 V!43753) V!43753)

(assert (=> b!1155083 (= lt!518035 (get!18355 (select (arr!36003 _values!996) from!1455) lt!518048))))

(declare-fun lt!518041 () Unit!37876)

(declare-fun e!656900 () Unit!37876)

(assert (=> b!1155083 (= lt!518041 e!656900)))

(declare-fun c!114785 () Bool)

(declare-fun contains!6735 (ListLongMap!16535 (_ BitVec 64)) Bool)

(assert (=> b!1155083 (= c!114785 (contains!6735 lt!518034 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4764 (array!74702 array!74704 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 32) Int) ListLongMap!16535)

(assert (=> b!1155083 (= lt!518034 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155084 () Bool)

(declare-fun e!656903 () Bool)

(assert (=> b!1155084 (= e!656903 e!656901)))

(declare-fun res!767482 () Bool)

(assert (=> b!1155084 (=> res!767482 e!656901)))

(assert (=> b!1155084 (= res!767482 (not (= (select (arr!36002 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656907 () Bool)

(assert (=> b!1155084 e!656907))

(declare-fun c!114787 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155084 (= c!114787 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518032 () Unit!37876)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!614 (array!74702 array!74704 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37876)

(assert (=> b!1155084 (= lt!518032 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155085 () Bool)

(declare-fun res!767484 () Bool)

(assert (=> b!1155085 (=> (not res!767484) (not e!656910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74702 (_ BitVec 32)) Bool)

(assert (=> b!1155085 (= res!767484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155086 () Bool)

(declare-fun Unit!37878 () Unit!37876)

(assert (=> b!1155086 (= e!656900 Unit!37878)))

(declare-fun bm!54785 () Bool)

(declare-fun call!54790 () Bool)

(declare-fun call!54791 () Bool)

(assert (=> bm!54785 (= call!54790 call!54791)))

(declare-fun b!1155087 () Bool)

(declare-fun e!656902 () Bool)

(declare-fun mapRes!45278 () Bool)

(assert (=> b!1155087 (= e!656913 (and e!656902 mapRes!45278))))

(declare-fun condMapEmpty!45278 () Bool)

(declare-fun mapDefault!45278 () ValueCell!13775)

(assert (=> b!1155087 (= condMapEmpty!45278 (= (arr!36003 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13775)) mapDefault!45278)))))

(declare-fun b!1155088 () Bool)

(assert (=> b!1155088 (contains!6735 call!54793 k0!934)))

(declare-fun lt!518047 () Unit!37876)

(declare-fun call!54794 () Unit!37876)

(assert (=> b!1155088 (= lt!518047 call!54794)))

(assert (=> b!1155088 call!54791))

(assert (=> b!1155088 (= lt!518029 (+!3694 lt!518034 (tuple2!18567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518040 () Unit!37876)

(declare-fun addStillContains!906 (ListLongMap!16535 (_ BitVec 64) V!43753 (_ BitVec 64)) Unit!37876)

(assert (=> b!1155088 (= lt!518040 (addStillContains!906 lt!518034 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!656905 () Unit!37876)

(assert (=> b!1155088 (= e!656905 lt!518047)))

(declare-fun mapNonEmpty!45278 () Bool)

(declare-fun tp!86028 () Bool)

(assert (=> mapNonEmpty!45278 (= mapRes!45278 (and tp!86028 e!656911))))

(declare-fun mapKey!45278 () (_ BitVec 32))

(declare-fun mapValue!45278 () ValueCell!13775)

(declare-fun mapRest!45278 () (Array (_ BitVec 32) ValueCell!13775))

(assert (=> mapNonEmpty!45278 (= (arr!36003 _values!996) (store mapRest!45278 mapKey!45278 mapValue!45278))))

(declare-fun b!1155089 () Bool)

(declare-fun e!656906 () Unit!37876)

(declare-fun lt!518049 () Unit!37876)

(assert (=> b!1155089 (= e!656906 lt!518049)))

(declare-fun call!54788 () Unit!37876)

(assert (=> b!1155089 (= lt!518049 call!54788)))

(assert (=> b!1155089 call!54790))

(declare-fun b!1155090 () Bool)

(declare-fun res!767483 () Bool)

(assert (=> b!1155090 (=> (not res!767483) (not e!656910))))

(assert (=> b!1155090 (= res!767483 (and (= (size!36541 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36540 _keys!1208) (size!36541 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54786 () Bool)

(declare-fun call!54789 () ListLongMap!16535)

(assert (=> bm!54786 (= call!54791 (contains!6735 (ite c!114786 lt!518029 call!54789) k0!934))))

(declare-fun bm!54787 () Bool)

(assert (=> bm!54787 (= call!54788 call!54794)))

(declare-fun mapIsEmpty!45278 () Bool)

(assert (=> mapIsEmpty!45278 mapRes!45278))

(declare-fun b!1155091 () Bool)

(assert (=> b!1155091 call!54790))

(declare-fun lt!518033 () Unit!37876)

(assert (=> b!1155091 (= lt!518033 call!54788)))

(declare-fun e!656908 () Unit!37876)

(assert (=> b!1155091 (= e!656908 lt!518033)))

(declare-fun b!1155092 () Bool)

(assert (=> b!1155092 (= e!656906 e!656908)))

(declare-fun c!114788 () Bool)

(declare-fun lt!518036 () Bool)

(assert (=> b!1155092 (= c!114788 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518036))))

(declare-fun b!1155093 () Bool)

(declare-fun Unit!37879 () Unit!37876)

(assert (=> b!1155093 (= e!656908 Unit!37879)))

(declare-fun b!1155094 () Bool)

(declare-fun call!54787 () ListLongMap!16535)

(declare-fun call!54792 () ListLongMap!16535)

(assert (=> b!1155094 (= e!656907 (= call!54787 call!54792))))

(declare-fun b!1155095 () Bool)

(declare-fun res!767490 () Bool)

(assert (=> b!1155095 (=> (not res!767490) (not e!656910))))

(assert (=> b!1155095 (= res!767490 (= (select (arr!36002 _keys!1208) i!673) k0!934))))

(declare-fun e!656912 () Bool)

(declare-fun b!1155096 () Bool)

(assert (=> b!1155096 (= e!656912 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518036) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155097 () Bool)

(declare-fun arrayContainsKey!0 (array!74702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155097 (= e!656912 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155098 () Bool)

(declare-fun res!767489 () Bool)

(declare-fun e!656915 () Bool)

(assert (=> b!1155098 (=> (not res!767489) (not e!656915))))

(declare-fun lt!518045 () array!74702)

(declare-datatypes ((List!25297 0))(
  ( (Nil!25294) (Cons!25293 (h!26502 (_ BitVec 64)) (t!36719 List!25297)) )
))
(declare-fun arrayNoDuplicates!0 (array!74702 (_ BitVec 32) List!25297) Bool)

(assert (=> b!1155098 (= res!767489 (arrayNoDuplicates!0 lt!518045 #b00000000000000000000000000000000 Nil!25294))))

(declare-fun bm!54788 () Bool)

(declare-fun lt!518038 () array!74704)

(assert (=> bm!54788 (= call!54787 (getCurrentListMapNoExtraKeys!4764 lt!518045 lt!518038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155099 () Bool)

(assert (=> b!1155099 (= e!656902 tp_is_empty!28969)))

(declare-fun b!1155100 () Bool)

(declare-fun e!656914 () Bool)

(assert (=> b!1155100 (= e!656914 e!656903)))

(declare-fun res!767479 () Bool)

(assert (=> b!1155100 (=> res!767479 e!656903)))

(assert (=> b!1155100 (= res!767479 (not (= from!1455 i!673)))))

(declare-fun lt!518031 () ListLongMap!16535)

(assert (=> b!1155100 (= lt!518031 (getCurrentListMapNoExtraKeys!4764 lt!518045 lt!518038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155100 (= lt!518038 (array!74705 (store (arr!36003 _values!996) i!673 (ValueCellFull!13775 lt!518048)) (size!36541 _values!996)))))

(declare-fun dynLambda!2723 (Int (_ BitVec 64)) V!43753)

(assert (=> b!1155100 (= lt!518048 (dynLambda!2723 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155100 (= lt!518046 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155101 () Bool)

(assert (=> b!1155101 (= e!656915 (not e!656914))))

(declare-fun res!767480 () Bool)

(assert (=> b!1155101 (=> res!767480 e!656914)))

(assert (=> b!1155101 (= res!767480 (bvsgt from!1455 i!673))))

(assert (=> b!1155101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518039 () Unit!37876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74702 (_ BitVec 64) (_ BitVec 32)) Unit!37876)

(assert (=> b!1155101 (= lt!518039 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54789 () Bool)

(assert (=> bm!54789 (= call!54792 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54790 () Bool)

(assert (=> bm!54790 (= call!54789 call!54793)))

(declare-fun b!1155102 () Bool)

(assert (=> b!1155102 (= e!656910 e!656915)))

(declare-fun res!767491 () Bool)

(assert (=> b!1155102 (=> (not res!767491) (not e!656915))))

(assert (=> b!1155102 (= res!767491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518045 mask!1564))))

(assert (=> b!1155102 (= lt!518045 (array!74703 (store (arr!36002 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36540 _keys!1208)))))

(declare-fun b!1155103 () Bool)

(assert (=> b!1155103 (= e!656916 (= lt!518028 (getCurrentListMapNoExtraKeys!4764 lt!518045 lt!518038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun e!656904 () Bool)

(declare-fun b!1155104 () Bool)

(assert (=> b!1155104 (= e!656904 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155105 () Bool)

(declare-fun res!767481 () Bool)

(assert (=> b!1155105 (=> (not res!767481) (not e!656910))))

(assert (=> b!1155105 (= res!767481 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36540 _keys!1208))))))

(declare-fun b!1155106 () Bool)

(declare-fun res!767486 () Bool)

(assert (=> b!1155106 (=> (not res!767486) (not e!656910))))

(assert (=> b!1155106 (= res!767486 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25294))))

(declare-fun b!1155107 () Bool)

(assert (=> b!1155107 (= e!656907 (= call!54787 (-!1342 call!54792 k0!934)))))

(declare-fun b!1155108 () Bool)

(declare-fun res!767485 () Bool)

(assert (=> b!1155108 (=> (not res!767485) (not e!656910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155108 (= res!767485 (validMask!0 mask!1564))))

(declare-fun b!1155109 () Bool)

(assert (=> b!1155109 (= c!114783 (and (not lt!518036) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155109 (= e!656905 e!656906)))

(declare-fun bm!54791 () Bool)

(assert (=> bm!54791 (= call!54794 (addStillContains!906 (ite c!114786 lt!518029 lt!518034) (ite c!114786 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114783 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114786 minValue!944 (ite c!114783 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155110 () Bool)

(declare-fun res!767487 () Bool)

(assert (=> b!1155110 (=> (not res!767487) (not e!656910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155110 (= res!767487 (validKeyInArray!0 k0!934))))

(declare-fun b!1155111 () Bool)

(declare-fun Unit!37880 () Unit!37876)

(assert (=> b!1155111 (= e!656900 Unit!37880)))

(assert (=> b!1155111 (= lt!518036 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155111 (= c!114786 (and (not lt!518036) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518043 () Unit!37876)

(assert (=> b!1155111 (= lt!518043 e!656905)))

(declare-fun lt!518030 () Unit!37876)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!492 (array!74702 array!74704 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 64) (_ BitVec 32) Int) Unit!37876)

(assert (=> b!1155111 (= lt!518030 (lemmaListMapContainsThenArrayContainsFrom!492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114784 () Bool)

(assert (=> b!1155111 (= c!114784 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767478 () Bool)

(assert (=> b!1155111 (= res!767478 e!656912)))

(assert (=> b!1155111 (=> (not res!767478) (not e!656904))))

(assert (=> b!1155111 e!656904))

(declare-fun lt!518042 () Unit!37876)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74702 (_ BitVec 32) (_ BitVec 32)) Unit!37876)

(assert (=> b!1155111 (= lt!518042 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155111 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25294)))

(declare-fun lt!518037 () Unit!37876)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74702 (_ BitVec 64) (_ BitVec 32) List!25297) Unit!37876)

(assert (=> b!1155111 (= lt!518037 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25294))))

(assert (=> b!1155111 false))

(assert (= (and start!98828 res!767492) b!1155108))

(assert (= (and b!1155108 res!767485) b!1155090))

(assert (= (and b!1155090 res!767483) b!1155085))

(assert (= (and b!1155085 res!767484) b!1155106))

(assert (= (and b!1155106 res!767486) b!1155105))

(assert (= (and b!1155105 res!767481) b!1155110))

(assert (= (and b!1155110 res!767487) b!1155095))

(assert (= (and b!1155095 res!767490) b!1155102))

(assert (= (and b!1155102 res!767491) b!1155098))

(assert (= (and b!1155098 res!767489) b!1155101))

(assert (= (and b!1155101 (not res!767480)) b!1155100))

(assert (= (and b!1155100 (not res!767479)) b!1155084))

(assert (= (and b!1155084 c!114787) b!1155107))

(assert (= (and b!1155084 (not c!114787)) b!1155094))

(assert (= (or b!1155107 b!1155094) bm!54789))

(assert (= (or b!1155107 b!1155094) bm!54788))

(assert (= (and b!1155084 (not res!767482)) b!1155083))

(assert (= (and b!1155083 c!114785) b!1155111))

(assert (= (and b!1155083 (not c!114785)) b!1155086))

(assert (= (and b!1155111 c!114786) b!1155088))

(assert (= (and b!1155111 (not c!114786)) b!1155109))

(assert (= (and b!1155109 c!114783) b!1155089))

(assert (= (and b!1155109 (not c!114783)) b!1155092))

(assert (= (and b!1155092 c!114788) b!1155091))

(assert (= (and b!1155092 (not c!114788)) b!1155093))

(assert (= (or b!1155089 b!1155091) bm!54787))

(assert (= (or b!1155089 b!1155091) bm!54790))

(assert (= (or b!1155089 b!1155091) bm!54785))

(assert (= (or b!1155088 bm!54785) bm!54786))

(assert (= (or b!1155088 bm!54787) bm!54791))

(assert (= (or b!1155088 bm!54790) bm!54784))

(assert (= (and b!1155111 c!114784) b!1155097))

(assert (= (and b!1155111 (not c!114784)) b!1155096))

(assert (= (and b!1155111 res!767478) b!1155104))

(assert (= (and b!1155083 res!767488) b!1155103))

(assert (= (and b!1155087 condMapEmpty!45278) mapIsEmpty!45278))

(assert (= (and b!1155087 (not condMapEmpty!45278)) mapNonEmpty!45278))

(get-info :version)

(assert (= (and mapNonEmpty!45278 ((_ is ValueCellFull!13775) mapValue!45278)) b!1155082))

(assert (= (and b!1155087 ((_ is ValueCellFull!13775) mapDefault!45278)) b!1155099))

(assert (= start!98828 b!1155087))

(declare-fun b_lambda!19527 () Bool)

(assert (=> (not b_lambda!19527) (not b!1155100)))

(declare-fun t!36717 () Bool)

(declare-fun tb!9243 () Bool)

(assert (=> (and start!98828 (= defaultEntry!1004 defaultEntry!1004) t!36717) tb!9243))

(declare-fun result!19059 () Bool)

(assert (=> tb!9243 (= result!19059 tp_is_empty!28969)))

(assert (=> b!1155100 t!36717))

(declare-fun b_and!39707 () Bool)

(assert (= b_and!39705 (and (=> t!36717 result!19059) b_and!39707)))

(declare-fun m!1064231 () Bool)

(assert (=> bm!54784 m!1064231))

(declare-fun m!1064233 () Bool)

(assert (=> b!1155111 m!1064233))

(declare-fun m!1064235 () Bool)

(assert (=> b!1155111 m!1064235))

(declare-fun m!1064237 () Bool)

(assert (=> b!1155111 m!1064237))

(declare-fun m!1064239 () Bool)

(assert (=> b!1155111 m!1064239))

(declare-fun m!1064241 () Bool)

(assert (=> b!1155104 m!1064241))

(declare-fun m!1064243 () Bool)

(assert (=> bm!54791 m!1064243))

(declare-fun m!1064245 () Bool)

(assert (=> b!1155106 m!1064245))

(declare-fun m!1064247 () Bool)

(assert (=> b!1155108 m!1064247))

(declare-fun m!1064249 () Bool)

(assert (=> b!1155100 m!1064249))

(declare-fun m!1064251 () Bool)

(assert (=> b!1155100 m!1064251))

(declare-fun m!1064253 () Bool)

(assert (=> b!1155100 m!1064253))

(declare-fun m!1064255 () Bool)

(assert (=> b!1155100 m!1064255))

(declare-fun m!1064257 () Bool)

(assert (=> b!1155110 m!1064257))

(declare-fun m!1064259 () Bool)

(assert (=> b!1155098 m!1064259))

(declare-fun m!1064261 () Bool)

(assert (=> bm!54786 m!1064261))

(assert (=> b!1155097 m!1064241))

(declare-fun m!1064263 () Bool)

(assert (=> b!1155103 m!1064263))

(declare-fun m!1064265 () Bool)

(assert (=> b!1155095 m!1064265))

(assert (=> bm!54788 m!1064263))

(declare-fun m!1064267 () Bool)

(assert (=> start!98828 m!1064267))

(declare-fun m!1064269 () Bool)

(assert (=> start!98828 m!1064269))

(declare-fun m!1064271 () Bool)

(assert (=> b!1155088 m!1064271))

(declare-fun m!1064273 () Bool)

(assert (=> b!1155088 m!1064273))

(declare-fun m!1064275 () Bool)

(assert (=> b!1155088 m!1064275))

(declare-fun m!1064277 () Bool)

(assert (=> b!1155101 m!1064277))

(declare-fun m!1064279 () Bool)

(assert (=> b!1155101 m!1064279))

(declare-fun m!1064281 () Bool)

(assert (=> b!1155083 m!1064281))

(declare-fun m!1064283 () Bool)

(assert (=> b!1155083 m!1064283))

(declare-fun m!1064285 () Bool)

(assert (=> b!1155083 m!1064285))

(declare-fun m!1064287 () Bool)

(assert (=> b!1155083 m!1064287))

(declare-fun m!1064289 () Bool)

(assert (=> b!1155083 m!1064289))

(declare-fun m!1064291 () Bool)

(assert (=> b!1155083 m!1064291))

(assert (=> b!1155083 m!1064287))

(assert (=> b!1155083 m!1064289))

(declare-fun m!1064293 () Bool)

(assert (=> b!1155083 m!1064293))

(assert (=> b!1155083 m!1064283))

(declare-fun m!1064295 () Bool)

(assert (=> b!1155083 m!1064295))

(declare-fun m!1064297 () Bool)

(assert (=> b!1155083 m!1064297))

(assert (=> b!1155083 m!1064289))

(declare-fun m!1064299 () Bool)

(assert (=> b!1155085 m!1064299))

(assert (=> bm!54789 m!1064281))

(declare-fun m!1064301 () Bool)

(assert (=> b!1155102 m!1064301))

(declare-fun m!1064303 () Bool)

(assert (=> b!1155102 m!1064303))

(declare-fun m!1064305 () Bool)

(assert (=> mapNonEmpty!45278 m!1064305))

(assert (=> b!1155084 m!1064289))

(declare-fun m!1064307 () Bool)

(assert (=> b!1155084 m!1064307))

(declare-fun m!1064309 () Bool)

(assert (=> b!1155107 m!1064309))

(check-sat (not bm!54788) (not b!1155088) (not b!1155084) tp_is_empty!28969 (not b!1155101) (not b_lambda!19527) (not b!1155085) (not b!1155107) (not b!1155102) (not b!1155100) (not bm!54791) (not start!98828) (not mapNonEmpty!45278) (not b_next!24439) b_and!39707 (not b!1155083) (not b!1155098) (not bm!54786) (not bm!54784) (not b!1155110) (not b!1155103) (not b!1155104) (not b!1155106) (not bm!54789) (not b!1155097) (not b!1155111) (not b!1155108))
(check-sat b_and!39707 (not b_next!24439))
