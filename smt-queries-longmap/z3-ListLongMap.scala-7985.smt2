; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98986 () Bool)

(assert start!98986)

(declare-fun b_free!24355 () Bool)

(declare-fun b_next!24355 () Bool)

(assert (=> start!98986 (= b_free!24355 (not b_next!24355))))

(declare-fun tp!85776 () Bool)

(declare-fun b_and!39561 () Bool)

(assert (=> start!98986 (= tp!85776 b_and!39561)))

(declare-fun b!1152631 () Bool)

(declare-fun e!655674 () Bool)

(declare-fun e!655680 () Bool)

(assert (=> b!1152631 (= e!655674 e!655680)))

(declare-fun res!766167 () Bool)

(assert (=> b!1152631 (=> (not res!766167) (not e!655680))))

(declare-datatypes ((array!74663 0))(
  ( (array!74664 (arr!35976 (Array (_ BitVec 32) (_ BitVec 64))) (size!36513 (_ BitVec 32))) )
))
(declare-fun lt!515946 () array!74663)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74663 (_ BitVec 32)) Bool)

(assert (=> b!1152631 (= res!766167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515946 mask!1564))))

(declare-fun _keys!1208 () array!74663)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152631 (= lt!515946 (array!74664 (store (arr!35976 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36513 _keys!1208)))))

(declare-fun bm!53864 () Bool)

(declare-datatypes ((Unit!37852 0))(
  ( (Unit!37853) )
))
(declare-fun call!53868 () Unit!37852)

(declare-fun call!53871 () Unit!37852)

(assert (=> bm!53864 (= call!53868 call!53871)))

(declare-fun bm!53865 () Bool)

(declare-datatypes ((V!43641 0))(
  ( (V!43642 (val!14499 Int)) )
))
(declare-datatypes ((tuple2!18424 0))(
  ( (tuple2!18425 (_1!9223 (_ BitVec 64)) (_2!9223 V!43641)) )
))
(declare-datatypes ((List!25177 0))(
  ( (Nil!25174) (Cons!25173 (h!26391 tuple2!18424) (t!36516 List!25177)) )
))
(declare-datatypes ((ListLongMap!16401 0))(
  ( (ListLongMap!16402 (toList!8216 List!25177)) )
))
(declare-fun call!53873 () ListLongMap!16401)

(declare-fun call!53874 () ListLongMap!16401)

(assert (=> bm!53865 (= call!53873 call!53874)))

(declare-fun b!1152632 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6751 (ListLongMap!16401 (_ BitVec 64)) Bool)

(assert (=> b!1152632 (contains!6751 call!53874 k0!934)))

(declare-fun lt!515932 () ListLongMap!16401)

(declare-fun lt!515938 () Unit!37852)

(declare-fun minValue!944 () V!43641)

(declare-fun addStillContains!877 (ListLongMap!16401 (_ BitVec 64) V!43641 (_ BitVec 64)) Unit!37852)

(assert (=> b!1152632 (= lt!515938 (addStillContains!877 lt!515932 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53869 () Bool)

(assert (=> b!1152632 call!53869))

(declare-fun lt!515950 () ListLongMap!16401)

(declare-fun zeroValue!944 () V!43641)

(declare-fun +!3652 (ListLongMap!16401 tuple2!18424) ListLongMap!16401)

(assert (=> b!1152632 (= lt!515932 (+!3652 lt!515950 (tuple2!18425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515947 () Unit!37852)

(assert (=> b!1152632 (= lt!515947 call!53871)))

(declare-fun e!655675 () Unit!37852)

(assert (=> b!1152632 (= e!655675 lt!515938)))

(declare-fun c!114451 () Bool)

(declare-fun bm!53866 () Bool)

(assert (=> bm!53866 (= call!53869 (contains!6751 (ite c!114451 lt!515932 call!53873) k0!934))))

(declare-datatypes ((ValueCell!13733 0))(
  ( (ValueCellFull!13733 (v!17132 V!43641)) (EmptyCell!13733) )
))
(declare-datatypes ((array!74665 0))(
  ( (array!74666 (arr!35977 (Array (_ BitVec 32) ValueCell!13733)) (size!36514 (_ BitVec 32))) )
))
(declare-fun lt!515951 () array!74665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1152633 () Bool)

(declare-fun e!655679 () Bool)

(declare-fun lt!515944 () ListLongMap!16401)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4716 (array!74663 array!74665 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) Int) ListLongMap!16401)

(assert (=> b!1152633 (= e!655679 (= lt!515944 (getCurrentListMapNoExtraKeys!4716 lt!515946 lt!515951 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152634 () Bool)

(declare-fun e!655681 () Bool)

(declare-fun e!655676 () Bool)

(declare-fun mapRes!45152 () Bool)

(assert (=> b!1152634 (= e!655681 (and e!655676 mapRes!45152))))

(declare-fun condMapEmpty!45152 () Bool)

(declare-fun _values!996 () array!74665)

(declare-fun mapDefault!45152 () ValueCell!13733)

(assert (=> b!1152634 (= condMapEmpty!45152 (= (arr!35977 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13733)) mapDefault!45152)))))

(declare-fun b!1152635 () Bool)

(declare-fun c!114453 () Bool)

(declare-fun lt!515939 () Bool)

(assert (=> b!1152635 (= c!114453 (and (not lt!515939) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655678 () Unit!37852)

(assert (=> b!1152635 (= e!655675 e!655678)))

(declare-fun res!766164 () Bool)

(assert (=> start!98986 (=> (not res!766164) (not e!655674))))

(assert (=> start!98986 (= res!766164 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36513 _keys!1208))))))

(assert (=> start!98986 e!655674))

(declare-fun tp_is_empty!28885 () Bool)

(assert (=> start!98986 tp_is_empty!28885))

(declare-fun array_inv!27604 (array!74663) Bool)

(assert (=> start!98986 (array_inv!27604 _keys!1208)))

(assert (=> start!98986 true))

(assert (=> start!98986 tp!85776))

(declare-fun array_inv!27605 (array!74665) Bool)

(assert (=> start!98986 (and (array_inv!27605 _values!996) e!655681)))

(declare-fun call!53867 () ListLongMap!16401)

(declare-fun bm!53867 () Bool)

(assert (=> bm!53867 (= call!53867 (getCurrentListMapNoExtraKeys!4716 lt!515946 lt!515951 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53868 () Bool)

(assert (=> bm!53868 (= call!53871 (addStillContains!877 lt!515950 (ite (or c!114451 c!114453) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114451 c!114453) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!53870 () ListLongMap!16401)

(declare-fun e!655671 () Bool)

(declare-fun b!1152636 () Bool)

(declare-fun -!1335 (ListLongMap!16401 (_ BitVec 64)) ListLongMap!16401)

(assert (=> b!1152636 (= e!655671 (= call!53867 (-!1335 call!53870 k0!934)))))

(declare-fun b!1152637 () Bool)

(declare-fun e!655672 () Unit!37852)

(declare-fun Unit!37854 () Unit!37852)

(assert (=> b!1152637 (= e!655672 Unit!37854)))

(declare-fun mapNonEmpty!45152 () Bool)

(declare-fun tp!85775 () Bool)

(declare-fun e!655684 () Bool)

(assert (=> mapNonEmpty!45152 (= mapRes!45152 (and tp!85775 e!655684))))

(declare-fun mapKey!45152 () (_ BitVec 32))

(declare-fun mapValue!45152 () ValueCell!13733)

(declare-fun mapRest!45152 () (Array (_ BitVec 32) ValueCell!13733))

(assert (=> mapNonEmpty!45152 (= (arr!35977 _values!996) (store mapRest!45152 mapKey!45152 mapValue!45152))))

(declare-fun b!1152638 () Bool)

(declare-fun Unit!37855 () Unit!37852)

(assert (=> b!1152638 (= e!655672 Unit!37855)))

(assert (=> b!1152638 (= lt!515939 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152638 (= c!114451 (and (not lt!515939) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515949 () Unit!37852)

(assert (=> b!1152638 (= lt!515949 e!655675)))

(declare-fun lt!515941 () Unit!37852)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!471 (array!74663 array!74665 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 64) (_ BitVec 32) Int) Unit!37852)

(assert (=> b!1152638 (= lt!515941 (lemmaListMapContainsThenArrayContainsFrom!471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114454 () Bool)

(assert (=> b!1152638 (= c!114454 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766169 () Bool)

(declare-fun e!655669 () Bool)

(assert (=> b!1152638 (= res!766169 e!655669)))

(declare-fun e!655673 () Bool)

(assert (=> b!1152638 (=> (not res!766169) (not e!655673))))

(assert (=> b!1152638 e!655673))

(declare-fun lt!515943 () Unit!37852)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74663 (_ BitVec 32) (_ BitVec 32)) Unit!37852)

(assert (=> b!1152638 (= lt!515943 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25178 0))(
  ( (Nil!25175) (Cons!25174 (h!26392 (_ BitVec 64)) (t!36517 List!25178)) )
))
(declare-fun arrayNoDuplicates!0 (array!74663 (_ BitVec 32) List!25178) Bool)

(assert (=> b!1152638 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25175)))

(declare-fun lt!515935 () Unit!37852)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74663 (_ BitVec 64) (_ BitVec 32) List!25178) Unit!37852)

(assert (=> b!1152638 (= lt!515935 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25175))))

(assert (=> b!1152638 false))

(declare-fun b!1152639 () Bool)

(declare-fun res!766176 () Bool)

(assert (=> b!1152639 (=> (not res!766176) (not e!655674))))

(assert (=> b!1152639 (= res!766176 (and (= (size!36514 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36513 _keys!1208) (size!36514 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152640 () Bool)

(declare-fun res!766171 () Bool)

(assert (=> b!1152640 (=> (not res!766171) (not e!655674))))

(assert (=> b!1152640 (= res!766171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152641 () Bool)

(declare-fun e!655677 () Bool)

(declare-fun e!655668 () Bool)

(assert (=> b!1152641 (= e!655677 e!655668)))

(declare-fun res!766163 () Bool)

(assert (=> b!1152641 (=> res!766163 e!655668)))

(assert (=> b!1152641 (= res!766163 (not (= (select (arr!35976 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152641 e!655671))

(declare-fun c!114452 () Bool)

(assert (=> b!1152641 (= c!114452 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515952 () Unit!37852)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!579 (array!74663 array!74665 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37852)

(assert (=> b!1152641 (= lt!515952 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152642 () Bool)

(assert (=> b!1152642 (= e!655669 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515939) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152643 () Bool)

(declare-fun lt!515953 () Unit!37852)

(assert (=> b!1152643 (= e!655678 lt!515953)))

(assert (=> b!1152643 (= lt!515953 call!53868)))

(declare-fun call!53872 () Bool)

(assert (=> b!1152643 call!53872))

(declare-fun b!1152644 () Bool)

(assert (=> b!1152644 (= e!655671 (= call!53867 call!53870))))

(declare-fun b!1152645 () Bool)

(declare-fun res!766166 () Bool)

(assert (=> b!1152645 (=> (not res!766166) (not e!655674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152645 (= res!766166 (validKeyInArray!0 k0!934))))

(declare-fun b!1152646 () Bool)

(declare-fun e!655670 () Unit!37852)

(declare-fun Unit!37856 () Unit!37852)

(assert (=> b!1152646 (= e!655670 Unit!37856)))

(declare-fun b!1152647 () Bool)

(assert (=> b!1152647 (= e!655684 tp_is_empty!28885)))

(declare-fun b!1152648 () Bool)

(declare-fun e!655682 () Bool)

(assert (=> b!1152648 (= e!655682 e!655677)))

(declare-fun res!766172 () Bool)

(assert (=> b!1152648 (=> res!766172 e!655677)))

(assert (=> b!1152648 (= res!766172 (not (= from!1455 i!673)))))

(declare-fun lt!515933 () ListLongMap!16401)

(assert (=> b!1152648 (= lt!515933 (getCurrentListMapNoExtraKeys!4716 lt!515946 lt!515951 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515940 () V!43641)

(assert (=> b!1152648 (= lt!515951 (array!74666 (store (arr!35977 _values!996) i!673 (ValueCellFull!13733 lt!515940)) (size!36514 _values!996)))))

(declare-fun dynLambda!2739 (Int (_ BitVec 64)) V!43641)

(assert (=> b!1152648 (= lt!515940 (dynLambda!2739 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515936 () ListLongMap!16401)

(assert (=> b!1152648 (= lt!515936 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152649 () Bool)

(declare-fun res!766170 () Bool)

(assert (=> b!1152649 (=> (not res!766170) (not e!655680))))

(assert (=> b!1152649 (= res!766170 (arrayNoDuplicates!0 lt!515946 #b00000000000000000000000000000000 Nil!25175))))

(declare-fun b!1152650 () Bool)

(assert (=> b!1152650 (= e!655676 tp_is_empty!28885)))

(declare-fun bm!53869 () Bool)

(assert (=> bm!53869 (= call!53872 call!53869)))

(declare-fun bm!53870 () Bool)

(assert (=> bm!53870 (= call!53874 (+!3652 (ite c!114451 lt!515932 lt!515950) (ite c!114451 (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114453 (tuple2!18425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152651 () Bool)

(declare-fun arrayContainsKey!0 (array!74663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152651 (= e!655673 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152652 () Bool)

(declare-fun res!766174 () Bool)

(assert (=> b!1152652 (=> (not res!766174) (not e!655674))))

(assert (=> b!1152652 (= res!766174 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36513 _keys!1208))))))

(declare-fun b!1152653 () Bool)

(assert (=> b!1152653 (= e!655669 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152654 () Bool)

(assert (=> b!1152654 call!53872))

(declare-fun lt!515942 () Unit!37852)

(assert (=> b!1152654 (= lt!515942 call!53868)))

(assert (=> b!1152654 (= e!655670 lt!515942)))

(declare-fun b!1152655 () Bool)

(assert (=> b!1152655 (= e!655678 e!655670)))

(declare-fun c!114455 () Bool)

(assert (=> b!1152655 (= c!114455 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515939))))

(declare-fun mapIsEmpty!45152 () Bool)

(assert (=> mapIsEmpty!45152 mapRes!45152))

(declare-fun b!1152656 () Bool)

(declare-fun res!766162 () Bool)

(assert (=> b!1152656 (=> (not res!766162) (not e!655674))))

(assert (=> b!1152656 (= res!766162 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25175))))

(declare-fun b!1152657 () Bool)

(declare-fun res!766168 () Bool)

(assert (=> b!1152657 (=> (not res!766168) (not e!655674))))

(assert (=> b!1152657 (= res!766168 (= (select (arr!35976 _keys!1208) i!673) k0!934))))

(declare-fun bm!53871 () Bool)

(assert (=> bm!53871 (= call!53870 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152658 () Bool)

(assert (=> b!1152658 (= e!655668 true)))

(assert (=> b!1152658 e!655679))

(declare-fun res!766175 () Bool)

(assert (=> b!1152658 (=> (not res!766175) (not e!655679))))

(assert (=> b!1152658 (= res!766175 (= lt!515944 lt!515950))))

(assert (=> b!1152658 (= lt!515944 (-!1335 lt!515936 k0!934))))

(declare-fun lt!515948 () V!43641)

(assert (=> b!1152658 (= (-!1335 (+!3652 lt!515950 (tuple2!18425 (select (arr!35976 _keys!1208) from!1455) lt!515948)) (select (arr!35976 _keys!1208) from!1455)) lt!515950)))

(declare-fun lt!515937 () Unit!37852)

(declare-fun addThenRemoveForNewKeyIsSame!181 (ListLongMap!16401 (_ BitVec 64) V!43641) Unit!37852)

(assert (=> b!1152658 (= lt!515937 (addThenRemoveForNewKeyIsSame!181 lt!515950 (select (arr!35976 _keys!1208) from!1455) lt!515948))))

(declare-fun get!18344 (ValueCell!13733 V!43641) V!43641)

(assert (=> b!1152658 (= lt!515948 (get!18344 (select (arr!35977 _values!996) from!1455) lt!515940))))

(declare-fun lt!515945 () Unit!37852)

(assert (=> b!1152658 (= lt!515945 e!655672)))

(declare-fun c!114456 () Bool)

(assert (=> b!1152658 (= c!114456 (contains!6751 lt!515950 k0!934))))

(assert (=> b!1152658 (= lt!515950 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152659 () Bool)

(declare-fun res!766173 () Bool)

(assert (=> b!1152659 (=> (not res!766173) (not e!655674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152659 (= res!766173 (validMask!0 mask!1564))))

(declare-fun b!1152660 () Bool)

(assert (=> b!1152660 (= e!655680 (not e!655682))))

(declare-fun res!766165 () Bool)

(assert (=> b!1152660 (=> res!766165 e!655682)))

(assert (=> b!1152660 (= res!766165 (bvsgt from!1455 i!673))))

(assert (=> b!1152660 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515934 () Unit!37852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74663 (_ BitVec 64) (_ BitVec 32)) Unit!37852)

(assert (=> b!1152660 (= lt!515934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98986 res!766164) b!1152659))

(assert (= (and b!1152659 res!766173) b!1152639))

(assert (= (and b!1152639 res!766176) b!1152640))

(assert (= (and b!1152640 res!766171) b!1152656))

(assert (= (and b!1152656 res!766162) b!1152652))

(assert (= (and b!1152652 res!766174) b!1152645))

(assert (= (and b!1152645 res!766166) b!1152657))

(assert (= (and b!1152657 res!766168) b!1152631))

(assert (= (and b!1152631 res!766167) b!1152649))

(assert (= (and b!1152649 res!766170) b!1152660))

(assert (= (and b!1152660 (not res!766165)) b!1152648))

(assert (= (and b!1152648 (not res!766172)) b!1152641))

(assert (= (and b!1152641 c!114452) b!1152636))

(assert (= (and b!1152641 (not c!114452)) b!1152644))

(assert (= (or b!1152636 b!1152644) bm!53867))

(assert (= (or b!1152636 b!1152644) bm!53871))

(assert (= (and b!1152641 (not res!766163)) b!1152658))

(assert (= (and b!1152658 c!114456) b!1152638))

(assert (= (and b!1152658 (not c!114456)) b!1152637))

(assert (= (and b!1152638 c!114451) b!1152632))

(assert (= (and b!1152638 (not c!114451)) b!1152635))

(assert (= (and b!1152635 c!114453) b!1152643))

(assert (= (and b!1152635 (not c!114453)) b!1152655))

(assert (= (and b!1152655 c!114455) b!1152654))

(assert (= (and b!1152655 (not c!114455)) b!1152646))

(assert (= (or b!1152643 b!1152654) bm!53864))

(assert (= (or b!1152643 b!1152654) bm!53865))

(assert (= (or b!1152643 b!1152654) bm!53869))

(assert (= (or b!1152632 bm!53869) bm!53866))

(assert (= (or b!1152632 bm!53864) bm!53868))

(assert (= (or b!1152632 bm!53865) bm!53870))

(assert (= (and b!1152638 c!114454) b!1152653))

(assert (= (and b!1152638 (not c!114454)) b!1152642))

(assert (= (and b!1152638 res!766169) b!1152651))

(assert (= (and b!1152658 res!766175) b!1152633))

(assert (= (and b!1152634 condMapEmpty!45152) mapIsEmpty!45152))

(assert (= (and b!1152634 (not condMapEmpty!45152)) mapNonEmpty!45152))

(get-info :version)

(assert (= (and mapNonEmpty!45152 ((_ is ValueCellFull!13733) mapValue!45152)) b!1152647))

(assert (= (and b!1152634 ((_ is ValueCellFull!13733) mapDefault!45152)) b!1152650))

(assert (= start!98986 b!1152634))

(declare-fun b_lambda!19455 () Bool)

(assert (=> (not b_lambda!19455) (not b!1152648)))

(declare-fun t!36515 () Bool)

(declare-fun tb!9159 () Bool)

(assert (=> (and start!98986 (= defaultEntry!1004 defaultEntry!1004) t!36515) tb!9159))

(declare-fun result!18891 () Bool)

(assert (=> tb!9159 (= result!18891 tp_is_empty!28885)))

(assert (=> b!1152648 t!36515))

(declare-fun b_and!39563 () Bool)

(assert (= b_and!39561 (and (=> t!36515 result!18891) b_and!39563)))

(declare-fun m!1063033 () Bool)

(assert (=> bm!53867 m!1063033))

(declare-fun m!1063035 () Bool)

(assert (=> b!1152631 m!1063035))

(declare-fun m!1063037 () Bool)

(assert (=> b!1152631 m!1063037))

(declare-fun m!1063039 () Bool)

(assert (=> b!1152640 m!1063039))

(declare-fun m!1063041 () Bool)

(assert (=> b!1152657 m!1063041))

(declare-fun m!1063043 () Bool)

(assert (=> b!1152632 m!1063043))

(declare-fun m!1063045 () Bool)

(assert (=> b!1152632 m!1063045))

(declare-fun m!1063047 () Bool)

(assert (=> b!1152632 m!1063047))

(declare-fun m!1063049 () Bool)

(assert (=> b!1152651 m!1063049))

(declare-fun m!1063051 () Bool)

(assert (=> bm!53871 m!1063051))

(declare-fun m!1063053 () Bool)

(assert (=> bm!53868 m!1063053))

(declare-fun m!1063055 () Bool)

(assert (=> bm!53870 m!1063055))

(declare-fun m!1063057 () Bool)

(assert (=> b!1152660 m!1063057))

(declare-fun m!1063059 () Bool)

(assert (=> b!1152660 m!1063059))

(declare-fun m!1063061 () Bool)

(assert (=> bm!53866 m!1063061))

(declare-fun m!1063063 () Bool)

(assert (=> b!1152648 m!1063063))

(declare-fun m!1063065 () Bool)

(assert (=> b!1152648 m!1063065))

(declare-fun m!1063067 () Bool)

(assert (=> b!1152648 m!1063067))

(declare-fun m!1063069 () Bool)

(assert (=> b!1152648 m!1063069))

(declare-fun m!1063071 () Bool)

(assert (=> b!1152641 m!1063071))

(declare-fun m!1063073 () Bool)

(assert (=> b!1152641 m!1063073))

(declare-fun m!1063075 () Bool)

(assert (=> mapNonEmpty!45152 m!1063075))

(declare-fun m!1063077 () Bool)

(assert (=> b!1152645 m!1063077))

(assert (=> b!1152633 m!1063033))

(declare-fun m!1063079 () Bool)

(assert (=> b!1152649 m!1063079))

(assert (=> b!1152653 m!1063049))

(declare-fun m!1063081 () Bool)

(assert (=> start!98986 m!1063081))

(declare-fun m!1063083 () Bool)

(assert (=> start!98986 m!1063083))

(declare-fun m!1063085 () Bool)

(assert (=> b!1152638 m!1063085))

(declare-fun m!1063087 () Bool)

(assert (=> b!1152638 m!1063087))

(declare-fun m!1063089 () Bool)

(assert (=> b!1152638 m!1063089))

(declare-fun m!1063091 () Bool)

(assert (=> b!1152638 m!1063091))

(declare-fun m!1063093 () Bool)

(assert (=> b!1152659 m!1063093))

(declare-fun m!1063095 () Bool)

(assert (=> b!1152636 m!1063095))

(declare-fun m!1063097 () Bool)

(assert (=> b!1152658 m!1063097))

(assert (=> b!1152658 m!1063097))

(declare-fun m!1063099 () Bool)

(assert (=> b!1152658 m!1063099))

(declare-fun m!1063101 () Bool)

(assert (=> b!1152658 m!1063101))

(declare-fun m!1063103 () Bool)

(assert (=> b!1152658 m!1063103))

(declare-fun m!1063105 () Bool)

(assert (=> b!1152658 m!1063105))

(assert (=> b!1152658 m!1063071))

(assert (=> b!1152658 m!1063071))

(declare-fun m!1063107 () Bool)

(assert (=> b!1152658 m!1063107))

(assert (=> b!1152658 m!1063051))

(assert (=> b!1152658 m!1063103))

(assert (=> b!1152658 m!1063071))

(declare-fun m!1063109 () Bool)

(assert (=> b!1152658 m!1063109))

(declare-fun m!1063111 () Bool)

(assert (=> b!1152656 m!1063111))

(check-sat (not bm!53870) (not bm!53868) (not b!1152659) (not b!1152638) tp_is_empty!28885 (not bm!53866) (not mapNonEmpty!45152) (not b!1152651) (not b!1152660) (not b!1152645) (not b!1152649) (not b!1152641) (not start!98986) (not b_lambda!19455) (not b!1152653) (not b!1152640) b_and!39563 (not b_next!24355) (not b!1152648) (not b!1152636) (not b!1152658) (not bm!53867) (not b!1152633) (not bm!53871) (not b!1152656) (not b!1152632) (not b!1152631))
(check-sat b_and!39563 (not b_next!24355))
