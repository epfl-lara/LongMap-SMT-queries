; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98582 () Bool)

(assert start!98582)

(declare-fun b_free!24193 () Bool)

(declare-fun b_next!24193 () Bool)

(assert (=> start!98582 (= b_free!24193 (not b_next!24193))))

(declare-fun tp!85290 () Bool)

(declare-fun b_and!39213 () Bool)

(assert (=> start!98582 (= tp!85290 b_and!39213)))

(declare-fun mapIsEmpty!44909 () Bool)

(declare-fun mapRes!44909 () Bool)

(assert (=> mapIsEmpty!44909 mapRes!44909))

(declare-fun b!1143773 () Bool)

(declare-fun e!650640 () Bool)

(declare-fun e!650636 () Bool)

(assert (=> b!1143773 (= e!650640 (not e!650636))))

(declare-fun res!761963 () Bool)

(assert (=> b!1143773 (=> res!761963 e!650636)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143773 (= res!761963 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74224 0))(
  ( (array!74225 (arr!35763 (Array (_ BitVec 32) (_ BitVec 64))) (size!36301 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74224)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143773 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37396 0))(
  ( (Unit!37397) )
))
(declare-fun lt!510095 () Unit!37396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74224 (_ BitVec 64) (_ BitVec 32)) Unit!37396)

(assert (=> b!1143773 (= lt!510095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!51832 () Bool)

(declare-fun call!51841 () Unit!37396)

(declare-fun call!51837 () Unit!37396)

(assert (=> bm!51832 (= call!51841 call!51837)))

(declare-fun b!1143774 () Bool)

(declare-fun res!761950 () Bool)

(declare-fun e!650638 () Bool)

(assert (=> b!1143774 (=> (not res!761950) (not e!650638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143774 (= res!761950 (validKeyInArray!0 k0!934))))

(declare-fun b!1143775 () Bool)

(declare-fun res!761958 () Bool)

(assert (=> b!1143775 (=> (not res!761958) (not e!650638))))

(assert (=> b!1143775 (= res!761958 (= (select (arr!35763 _keys!1208) i!673) k0!934))))

(declare-fun b!1143776 () Bool)

(declare-fun e!650646 () Bool)

(declare-datatypes ((V!43425 0))(
  ( (V!43426 (val!14418 Int)) )
))
(declare-datatypes ((tuple2!18344 0))(
  ( (tuple2!18345 (_1!9183 (_ BitVec 64)) (_2!9183 V!43425)) )
))
(declare-datatypes ((List!25081 0))(
  ( (Nil!25078) (Cons!25077 (h!26286 tuple2!18344) (t!36257 List!25081)) )
))
(declare-datatypes ((ListLongMap!16313 0))(
  ( (ListLongMap!16314 (toList!8172 List!25081)) )
))
(declare-fun call!51838 () ListLongMap!16313)

(declare-fun call!51840 () ListLongMap!16313)

(assert (=> b!1143776 (= e!650646 (= call!51838 call!51840))))

(declare-fun b!1143777 () Bool)

(declare-fun e!650641 () Unit!37396)

(declare-fun Unit!37398 () Unit!37396)

(assert (=> b!1143777 (= e!650641 Unit!37398)))

(declare-fun b!1143778 () Bool)

(declare-fun e!650648 () Bool)

(declare-fun e!650645 () Bool)

(assert (=> b!1143778 (= e!650648 (and e!650645 mapRes!44909))))

(declare-fun condMapEmpty!44909 () Bool)

(declare-datatypes ((ValueCell!13652 0))(
  ( (ValueCellFull!13652 (v!17054 V!43425)) (EmptyCell!13652) )
))
(declare-datatypes ((array!74226 0))(
  ( (array!74227 (arr!35764 (Array (_ BitVec 32) ValueCell!13652)) (size!36302 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74226)

(declare-fun mapDefault!44909 () ValueCell!13652)

(assert (=> b!1143778 (= condMapEmpty!44909 (= (arr!35764 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13652)) mapDefault!44909)))))

(declare-fun b!1143779 () Bool)

(declare-fun c!112573 () Bool)

(declare-fun lt!510089 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143779 (= c!112573 (and (not lt!510089) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650644 () Unit!37396)

(declare-fun e!650634 () Unit!37396)

(assert (=> b!1143779 (= e!650644 e!650634)))

(declare-fun zeroValue!944 () V!43425)

(declare-fun bm!51834 () Bool)

(declare-fun c!112574 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510083 () array!74224)

(declare-fun lt!510082 () array!74226)

(declare-fun minValue!944 () V!43425)

(declare-fun getCurrentListMapNoExtraKeys!4662 (array!74224 array!74226 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 32) Int) ListLongMap!16313)

(assert (=> bm!51834 (= call!51838 (getCurrentListMapNoExtraKeys!4662 (ite c!112574 _keys!1208 lt!510083) (ite c!112574 _values!996 lt!510082) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143780 () Bool)

(declare-fun res!761952 () Bool)

(assert (=> b!1143780 (=> (not res!761952) (not e!650638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143780 (= res!761952 (validMask!0 mask!1564))))

(declare-fun bm!51835 () Bool)

(declare-fun call!51835 () ListLongMap!16313)

(declare-fun call!51839 () ListLongMap!16313)

(assert (=> bm!51835 (= call!51835 call!51839)))

(declare-fun bm!51836 () Bool)

(assert (=> bm!51836 (= call!51840 (getCurrentListMapNoExtraKeys!4662 (ite c!112574 lt!510083 _keys!1208) (ite c!112574 lt!510082 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!650637 () Bool)

(declare-fun b!1143781 () Bool)

(assert (=> b!1143781 (= e!650637 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143782 () Bool)

(declare-fun tp_is_empty!28723 () Bool)

(assert (=> b!1143782 (= e!650645 tp_is_empty!28723)))

(declare-fun b!1143783 () Bool)

(declare-fun e!650643 () Unit!37396)

(declare-fun Unit!37399 () Unit!37396)

(assert (=> b!1143783 (= e!650643 Unit!37399)))

(declare-fun b!1143784 () Bool)

(declare-fun res!761961 () Bool)

(assert (=> b!1143784 (=> (not res!761961) (not e!650640))))

(declare-datatypes ((List!25082 0))(
  ( (Nil!25079) (Cons!25078 (h!26287 (_ BitVec 64)) (t!36258 List!25082)) )
))
(declare-fun arrayNoDuplicates!0 (array!74224 (_ BitVec 32) List!25082) Bool)

(assert (=> b!1143784 (= res!761961 (arrayNoDuplicates!0 lt!510083 #b00000000000000000000000000000000 Nil!25079))))

(declare-fun b!1143785 () Bool)

(assert (=> b!1143785 (= e!650634 e!650643)))

(declare-fun c!112569 () Bool)

(assert (=> b!1143785 (= c!112569 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510089))))

(declare-fun b!1143786 () Bool)

(declare-fun contains!6640 (ListLongMap!16313 (_ BitVec 64)) Bool)

(assert (=> b!1143786 (contains!6640 call!51839 k0!934)))

(declare-fun lt!510084 () ListLongMap!16313)

(declare-fun lt!510093 () Unit!37396)

(declare-fun addStillContains!809 (ListLongMap!16313 (_ BitVec 64) V!43425 (_ BitVec 64)) Unit!37396)

(assert (=> b!1143786 (= lt!510093 (addStillContains!809 lt!510084 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!51836 () Bool)

(assert (=> b!1143786 call!51836))

(declare-fun lt!510080 () ListLongMap!16313)

(declare-fun +!3595 (ListLongMap!16313 tuple2!18344) ListLongMap!16313)

(assert (=> b!1143786 (= lt!510084 (+!3595 lt!510080 (tuple2!18345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510085 () Unit!37396)

(assert (=> b!1143786 (= lt!510085 call!51837)))

(assert (=> b!1143786 (= e!650644 lt!510093)))

(declare-fun b!1143787 () Bool)

(declare-fun res!761951 () Bool)

(assert (=> b!1143787 (=> (not res!761951) (not e!650638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74224 (_ BitVec 32)) Bool)

(assert (=> b!1143787 (= res!761951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143788 () Bool)

(declare-fun res!761955 () Bool)

(assert (=> b!1143788 (=> (not res!761955) (not e!650638))))

(assert (=> b!1143788 (= res!761955 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36301 _keys!1208))))))

(declare-fun b!1143789 () Bool)

(declare-fun e!650649 () Bool)

(declare-fun e!650647 () Bool)

(assert (=> b!1143789 (= e!650649 e!650647)))

(declare-fun res!761962 () Bool)

(assert (=> b!1143789 (=> res!761962 e!650647)))

(assert (=> b!1143789 (= res!761962 (not (= (select (arr!35763 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143789 e!650646))

(assert (=> b!1143789 (= c!112574 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510086 () Unit!37396)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!530 (array!74224 array!74226 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37396)

(assert (=> b!1143789 (= lt!510086 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143790 () Bool)

(declare-fun call!51842 () Bool)

(assert (=> b!1143790 call!51842))

(declare-fun lt!510091 () Unit!37396)

(assert (=> b!1143790 (= lt!510091 call!51841)))

(assert (=> b!1143790 (= e!650643 lt!510091)))

(declare-fun b!1143791 () Bool)

(assert (=> b!1143791 (= e!650638 e!650640)))

(declare-fun res!761956 () Bool)

(assert (=> b!1143791 (=> (not res!761956) (not e!650640))))

(assert (=> b!1143791 (= res!761956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510083 mask!1564))))

(assert (=> b!1143791 (= lt!510083 (array!74225 (store (arr!35763 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36301 _keys!1208)))))

(declare-fun c!112572 () Bool)

(declare-fun bm!51833 () Bool)

(assert (=> bm!51833 (= call!51836 (contains!6640 (ite c!112572 lt!510084 call!51835) k0!934))))

(declare-fun res!761959 () Bool)

(assert (=> start!98582 (=> (not res!761959) (not e!650638))))

(assert (=> start!98582 (= res!761959 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36301 _keys!1208))))))

(assert (=> start!98582 e!650638))

(assert (=> start!98582 tp_is_empty!28723))

(declare-fun array_inv!27480 (array!74224) Bool)

(assert (=> start!98582 (array_inv!27480 _keys!1208)))

(assert (=> start!98582 true))

(assert (=> start!98582 tp!85290))

(declare-fun array_inv!27481 (array!74226) Bool)

(assert (=> start!98582 (and (array_inv!27481 _values!996) e!650648)))

(declare-fun b!1143792 () Bool)

(declare-fun Unit!37400 () Unit!37396)

(assert (=> b!1143792 (= e!650641 Unit!37400)))

(assert (=> b!1143792 (= lt!510089 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143792 (= c!112572 (and (not lt!510089) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510088 () Unit!37396)

(assert (=> b!1143792 (= lt!510088 e!650644)))

(declare-fun lt!510090 () Unit!37396)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!405 (array!74224 array!74226 (_ BitVec 32) (_ BitVec 32) V!43425 V!43425 (_ BitVec 64) (_ BitVec 32) Int) Unit!37396)

(assert (=> b!1143792 (= lt!510090 (lemmaListMapContainsThenArrayContainsFrom!405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112570 () Bool)

(assert (=> b!1143792 (= c!112570 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761960 () Bool)

(declare-fun e!650639 () Bool)

(assert (=> b!1143792 (= res!761960 e!650639)))

(assert (=> b!1143792 (=> (not res!761960) (not e!650637))))

(assert (=> b!1143792 e!650637))

(declare-fun lt!510079 () Unit!37396)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74224 (_ BitVec 32) (_ BitVec 32)) Unit!37396)

(assert (=> b!1143792 (= lt!510079 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143792 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25079)))

(declare-fun lt!510098 () Unit!37396)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74224 (_ BitVec 64) (_ BitVec 32) List!25082) Unit!37396)

(assert (=> b!1143792 (= lt!510098 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25079))))

(assert (=> b!1143792 false))

(declare-fun mapNonEmpty!44909 () Bool)

(declare-fun tp!85289 () Bool)

(declare-fun e!650642 () Bool)

(assert (=> mapNonEmpty!44909 (= mapRes!44909 (and tp!85289 e!650642))))

(declare-fun mapRest!44909 () (Array (_ BitVec 32) ValueCell!13652))

(declare-fun mapValue!44909 () ValueCell!13652)

(declare-fun mapKey!44909 () (_ BitVec 32))

(assert (=> mapNonEmpty!44909 (= (arr!35764 _values!996) (store mapRest!44909 mapKey!44909 mapValue!44909))))

(declare-fun b!1143793 () Bool)

(declare-fun -!1249 (ListLongMap!16313 (_ BitVec 64)) ListLongMap!16313)

(assert (=> b!1143793 (= e!650646 (= call!51840 (-!1249 call!51838 k0!934)))))

(declare-fun bm!51837 () Bool)

(assert (=> bm!51837 (= call!51837 (addStillContains!809 lt!510080 (ite (or c!112572 c!112573) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112572 c!112573) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!51838 () Bool)

(assert (=> bm!51838 (= call!51842 call!51836)))

(declare-fun b!1143794 () Bool)

(assert (=> b!1143794 (= e!650647 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36301 _keys!1208))))))

(declare-fun lt!510099 () V!43425)

(assert (=> b!1143794 (= (-!1249 (+!3595 lt!510080 (tuple2!18345 (select (arr!35763 _keys!1208) from!1455) lt!510099)) (select (arr!35763 _keys!1208) from!1455)) lt!510080)))

(declare-fun lt!510081 () Unit!37396)

(declare-fun addThenRemoveForNewKeyIsSame!115 (ListLongMap!16313 (_ BitVec 64) V!43425) Unit!37396)

(assert (=> b!1143794 (= lt!510081 (addThenRemoveForNewKeyIsSame!115 lt!510080 (select (arr!35763 _keys!1208) from!1455) lt!510099))))

(declare-fun lt!510097 () V!43425)

(declare-fun get!18193 (ValueCell!13652 V!43425) V!43425)

(assert (=> b!1143794 (= lt!510099 (get!18193 (select (arr!35764 _values!996) from!1455) lt!510097))))

(declare-fun lt!510096 () Unit!37396)

(assert (=> b!1143794 (= lt!510096 e!650641)))

(declare-fun c!112571 () Bool)

(assert (=> b!1143794 (= c!112571 (contains!6640 lt!510080 k0!934))))

(assert (=> b!1143794 (= lt!510080 (getCurrentListMapNoExtraKeys!4662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143795 () Bool)

(declare-fun res!761957 () Bool)

(assert (=> b!1143795 (=> (not res!761957) (not e!650638))))

(assert (=> b!1143795 (= res!761957 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25079))))

(declare-fun b!1143796 () Bool)

(assert (=> b!1143796 (= e!650639 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51839 () Bool)

(assert (=> bm!51839 (= call!51839 (+!3595 (ite c!112572 lt!510084 lt!510080) (ite c!112572 (tuple2!18345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112573 (tuple2!18345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1143797 () Bool)

(assert (=> b!1143797 (= e!650639 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510089) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143798 () Bool)

(assert (=> b!1143798 (= e!650636 e!650649)))

(declare-fun res!761953 () Bool)

(assert (=> b!1143798 (=> res!761953 e!650649)))

(assert (=> b!1143798 (= res!761953 (not (= from!1455 i!673)))))

(declare-fun lt!510092 () ListLongMap!16313)

(assert (=> b!1143798 (= lt!510092 (getCurrentListMapNoExtraKeys!4662 lt!510083 lt!510082 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1143798 (= lt!510082 (array!74227 (store (arr!35764 _values!996) i!673 (ValueCellFull!13652 lt!510097)) (size!36302 _values!996)))))

(declare-fun dynLambda!2637 (Int (_ BitVec 64)) V!43425)

(assert (=> b!1143798 (= lt!510097 (dynLambda!2637 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510094 () ListLongMap!16313)

(assert (=> b!1143798 (= lt!510094 (getCurrentListMapNoExtraKeys!4662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143799 () Bool)

(declare-fun res!761954 () Bool)

(assert (=> b!1143799 (=> (not res!761954) (not e!650638))))

(assert (=> b!1143799 (= res!761954 (and (= (size!36302 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36301 _keys!1208) (size!36302 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143800 () Bool)

(declare-fun lt!510087 () Unit!37396)

(assert (=> b!1143800 (= e!650634 lt!510087)))

(assert (=> b!1143800 (= lt!510087 call!51841)))

(assert (=> b!1143800 call!51842))

(declare-fun b!1143801 () Bool)

(assert (=> b!1143801 (= e!650642 tp_is_empty!28723)))

(assert (= (and start!98582 res!761959) b!1143780))

(assert (= (and b!1143780 res!761952) b!1143799))

(assert (= (and b!1143799 res!761954) b!1143787))

(assert (= (and b!1143787 res!761951) b!1143795))

(assert (= (and b!1143795 res!761957) b!1143788))

(assert (= (and b!1143788 res!761955) b!1143774))

(assert (= (and b!1143774 res!761950) b!1143775))

(assert (= (and b!1143775 res!761958) b!1143791))

(assert (= (and b!1143791 res!761956) b!1143784))

(assert (= (and b!1143784 res!761961) b!1143773))

(assert (= (and b!1143773 (not res!761963)) b!1143798))

(assert (= (and b!1143798 (not res!761953)) b!1143789))

(assert (= (and b!1143789 c!112574) b!1143793))

(assert (= (and b!1143789 (not c!112574)) b!1143776))

(assert (= (or b!1143793 b!1143776) bm!51834))

(assert (= (or b!1143793 b!1143776) bm!51836))

(assert (= (and b!1143789 (not res!761962)) b!1143794))

(assert (= (and b!1143794 c!112571) b!1143792))

(assert (= (and b!1143794 (not c!112571)) b!1143777))

(assert (= (and b!1143792 c!112572) b!1143786))

(assert (= (and b!1143792 (not c!112572)) b!1143779))

(assert (= (and b!1143779 c!112573) b!1143800))

(assert (= (and b!1143779 (not c!112573)) b!1143785))

(assert (= (and b!1143785 c!112569) b!1143790))

(assert (= (and b!1143785 (not c!112569)) b!1143783))

(assert (= (or b!1143800 b!1143790) bm!51832))

(assert (= (or b!1143800 b!1143790) bm!51835))

(assert (= (or b!1143800 b!1143790) bm!51838))

(assert (= (or b!1143786 bm!51838) bm!51833))

(assert (= (or b!1143786 bm!51832) bm!51837))

(assert (= (or b!1143786 bm!51835) bm!51839))

(assert (= (and b!1143792 c!112570) b!1143796))

(assert (= (and b!1143792 (not c!112570)) b!1143797))

(assert (= (and b!1143792 res!761960) b!1143781))

(assert (= (and b!1143778 condMapEmpty!44909) mapIsEmpty!44909))

(assert (= (and b!1143778 (not condMapEmpty!44909)) mapNonEmpty!44909))

(get-info :version)

(assert (= (and mapNonEmpty!44909 ((_ is ValueCellFull!13652) mapValue!44909)) b!1143801))

(assert (= (and b!1143778 ((_ is ValueCellFull!13652) mapDefault!44909)) b!1143782))

(assert (= start!98582 b!1143778))

(declare-fun b_lambda!19281 () Bool)

(assert (=> (not b_lambda!19281) (not b!1143798)))

(declare-fun t!36256 () Bool)

(declare-fun tb!8997 () Bool)

(assert (=> (and start!98582 (= defaultEntry!1004 defaultEntry!1004) t!36256) tb!8997))

(declare-fun result!18567 () Bool)

(assert (=> tb!8997 (= result!18567 tp_is_empty!28723)))

(assert (=> b!1143798 t!36256))

(declare-fun b_and!39215 () Bool)

(assert (= b_and!39213 (and (=> t!36256 result!18567) b_and!39215)))

(declare-fun m!1054383 () Bool)

(assert (=> b!1143780 m!1054383))

(declare-fun m!1054385 () Bool)

(assert (=> bm!51839 m!1054385))

(declare-fun m!1054387 () Bool)

(assert (=> start!98582 m!1054387))

(declare-fun m!1054389 () Bool)

(assert (=> start!98582 m!1054389))

(declare-fun m!1054391 () Bool)

(assert (=> b!1143773 m!1054391))

(declare-fun m!1054393 () Bool)

(assert (=> b!1143773 m!1054393))

(declare-fun m!1054395 () Bool)

(assert (=> bm!51836 m!1054395))

(declare-fun m!1054397 () Bool)

(assert (=> b!1143794 m!1054397))

(declare-fun m!1054399 () Bool)

(assert (=> b!1143794 m!1054399))

(declare-fun m!1054401 () Bool)

(assert (=> b!1143794 m!1054401))

(declare-fun m!1054403 () Bool)

(assert (=> b!1143794 m!1054403))

(assert (=> b!1143794 m!1054397))

(declare-fun m!1054405 () Bool)

(assert (=> b!1143794 m!1054405))

(assert (=> b!1143794 m!1054399))

(declare-fun m!1054407 () Bool)

(assert (=> b!1143794 m!1054407))

(declare-fun m!1054409 () Bool)

(assert (=> b!1143794 m!1054409))

(assert (=> b!1143794 m!1054405))

(declare-fun m!1054411 () Bool)

(assert (=> b!1143794 m!1054411))

(assert (=> b!1143794 m!1054399))

(declare-fun m!1054413 () Bool)

(assert (=> b!1143792 m!1054413))

(declare-fun m!1054415 () Bool)

(assert (=> b!1143792 m!1054415))

(declare-fun m!1054417 () Bool)

(assert (=> b!1143792 m!1054417))

(declare-fun m!1054419 () Bool)

(assert (=> b!1143792 m!1054419))

(declare-fun m!1054421 () Bool)

(assert (=> b!1143791 m!1054421))

(declare-fun m!1054423 () Bool)

(assert (=> b!1143791 m!1054423))

(declare-fun m!1054425 () Bool)

(assert (=> b!1143795 m!1054425))

(declare-fun m!1054427 () Bool)

(assert (=> b!1143798 m!1054427))

(declare-fun m!1054429 () Bool)

(assert (=> b!1143798 m!1054429))

(declare-fun m!1054431 () Bool)

(assert (=> b!1143798 m!1054431))

(declare-fun m!1054433 () Bool)

(assert (=> b!1143798 m!1054433))

(declare-fun m!1054435 () Bool)

(assert (=> b!1143786 m!1054435))

(declare-fun m!1054437 () Bool)

(assert (=> b!1143786 m!1054437))

(declare-fun m!1054439 () Bool)

(assert (=> b!1143786 m!1054439))

(declare-fun m!1054441 () Bool)

(assert (=> bm!51833 m!1054441))

(declare-fun m!1054443 () Bool)

(assert (=> b!1143781 m!1054443))

(declare-fun m!1054445 () Bool)

(assert (=> b!1143775 m!1054445))

(declare-fun m!1054447 () Bool)

(assert (=> mapNonEmpty!44909 m!1054447))

(declare-fun m!1054449 () Bool)

(assert (=> b!1143784 m!1054449))

(declare-fun m!1054451 () Bool)

(assert (=> bm!51837 m!1054451))

(declare-fun m!1054453 () Bool)

(assert (=> b!1143787 m!1054453))

(assert (=> b!1143796 m!1054443))

(declare-fun m!1054455 () Bool)

(assert (=> bm!51834 m!1054455))

(assert (=> b!1143789 m!1054399))

(declare-fun m!1054457 () Bool)

(assert (=> b!1143789 m!1054457))

(declare-fun m!1054459 () Bool)

(assert (=> b!1143774 m!1054459))

(declare-fun m!1054461 () Bool)

(assert (=> b!1143793 m!1054461))

(check-sat (not b!1143794) (not bm!51839) (not mapNonEmpty!44909) tp_is_empty!28723 (not b!1143791) (not b!1143789) (not b!1143774) (not bm!51833) (not b!1143796) (not b!1143787) (not b!1143780) b_and!39215 (not b!1143784) (not bm!51834) (not b!1143781) (not b!1143773) (not b!1143786) (not b_next!24193) (not b_lambda!19281) (not bm!51837) (not b!1143793) (not b!1143798) (not start!98582) (not b!1143795) (not b!1143792) (not bm!51836))
(check-sat b_and!39215 (not b_next!24193))
