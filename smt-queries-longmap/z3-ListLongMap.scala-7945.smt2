; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98512 () Bool)

(assert start!98512)

(declare-fun b_free!24117 () Bool)

(declare-fun b_next!24117 () Bool)

(assert (=> start!98512 (= b_free!24117 (not b_next!24117))))

(declare-fun tp!85061 () Bool)

(declare-fun b_and!39083 () Bool)

(assert (=> start!98512 (= tp!85061 b_and!39083)))

(declare-fun b!1140515 () Bool)

(declare-datatypes ((Unit!37395 0))(
  ( (Unit!37396) )
))
(declare-fun e!648899 () Unit!37395)

(declare-fun e!648901 () Unit!37395)

(assert (=> b!1140515 (= e!648899 e!648901)))

(declare-fun c!111916 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!507880 () Bool)

(assert (=> b!1140515 (= c!111916 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507880))))

(declare-datatypes ((V!43323 0))(
  ( (V!43324 (val!14380 Int)) )
))
(declare-datatypes ((tuple2!18184 0))(
  ( (tuple2!18185 (_1!9103 (_ BitVec 64)) (_2!9103 V!43323)) )
))
(declare-datatypes ((List!24939 0))(
  ( (Nil!24936) (Cons!24935 (h!26144 tuple2!18184) (t!36048 List!24939)) )
))
(declare-datatypes ((ListLongMap!16153 0))(
  ( (ListLongMap!16154 (toList!8092 List!24939)) )
))
(declare-fun lt!507885 () ListLongMap!16153)

(declare-fun c!111915 () Bool)

(declare-fun bm!50943 () Bool)

(declare-fun call!50948 () ListLongMap!16153)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!50949 () Bool)

(declare-fun contains!6627 (ListLongMap!16153 (_ BitVec 64)) Bool)

(assert (=> bm!50943 (= call!50949 (contains!6627 (ite c!111915 lt!507885 call!50948) k0!934))))

(declare-fun b!1140516 () Bool)

(declare-fun Unit!37397 () Unit!37395)

(assert (=> b!1140516 (= e!648901 Unit!37397)))

(declare-fun e!648897 () Bool)

(declare-datatypes ((array!74151 0))(
  ( (array!74152 (arr!35726 (Array (_ BitVec 32) (_ BitVec 64))) (size!36262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74151)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1140517 () Bool)

(declare-fun arrayContainsKey!0 (array!74151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140517 (= e!648897 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140518 () Bool)

(declare-fun e!648889 () Unit!37395)

(declare-fun Unit!37398 () Unit!37395)

(assert (=> b!1140518 (= e!648889 Unit!37398)))

(declare-fun b!1140519 () Bool)

(declare-fun res!760433 () Bool)

(declare-fun e!648895 () Bool)

(assert (=> b!1140519 (=> (not res!760433) (not e!648895))))

(declare-datatypes ((List!24940 0))(
  ( (Nil!24937) (Cons!24936 (h!26145 (_ BitVec 64)) (t!36049 List!24940)) )
))
(declare-fun arrayNoDuplicates!0 (array!74151 (_ BitVec 32) List!24940) Bool)

(assert (=> b!1140519 (= res!760433 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24937))))

(declare-fun mapNonEmpty!44795 () Bool)

(declare-fun mapRes!44795 () Bool)

(declare-fun tp!85062 () Bool)

(declare-fun e!648898 () Bool)

(assert (=> mapNonEmpty!44795 (= mapRes!44795 (and tp!85062 e!648898))))

(declare-datatypes ((ValueCell!13614 0))(
  ( (ValueCellFull!13614 (v!17017 V!43323)) (EmptyCell!13614) )
))
(declare-fun mapRest!44795 () (Array (_ BitVec 32) ValueCell!13614))

(declare-fun mapKey!44795 () (_ BitVec 32))

(declare-datatypes ((array!74153 0))(
  ( (array!74154 (arr!35727 (Array (_ BitVec 32) ValueCell!13614)) (size!36263 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74153)

(declare-fun mapValue!44795 () ValueCell!13614)

(assert (=> mapNonEmpty!44795 (= (arr!35727 _values!996) (store mapRest!44795 mapKey!44795 mapValue!44795))))

(declare-fun b!1140520 () Bool)

(declare-fun e!648902 () Bool)

(assert (=> b!1140520 (= e!648902 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140521 () Bool)

(declare-fun e!648903 () Bool)

(declare-fun tp_is_empty!28647 () Bool)

(assert (=> b!1140521 (= e!648903 tp_is_empty!28647)))

(declare-fun b!1140522 () Bool)

(declare-fun e!648893 () Bool)

(declare-fun e!648896 () Bool)

(assert (=> b!1140522 (= e!648893 e!648896)))

(declare-fun res!760431 () Bool)

(assert (=> b!1140522 (=> res!760431 e!648896)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140522 (= res!760431 (not (= from!1455 i!673)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!507878 () ListLongMap!16153)

(declare-fun minValue!944 () V!43323)

(declare-fun lt!507893 () array!74151)

(declare-fun zeroValue!944 () V!43323)

(declare-fun lt!507892 () array!74153)

(declare-fun getCurrentListMapNoExtraKeys!4574 (array!74151 array!74153 (_ BitVec 32) (_ BitVec 32) V!43323 V!43323 (_ BitVec 32) Int) ListLongMap!16153)

(assert (=> b!1140522 (= lt!507878 (getCurrentListMapNoExtraKeys!4574 lt!507893 lt!507892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507879 () V!43323)

(assert (=> b!1140522 (= lt!507892 (array!74154 (store (arr!35727 _values!996) i!673 (ValueCellFull!13614 lt!507879)) (size!36263 _values!996)))))

(declare-fun dynLambda!2622 (Int (_ BitVec 64)) V!43323)

(assert (=> b!1140522 (= lt!507879 (dynLambda!2622 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507877 () ListLongMap!16153)

(assert (=> b!1140522 (= lt!507877 (getCurrentListMapNoExtraKeys!4574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50944 () Bool)

(declare-fun call!50953 () Unit!37395)

(declare-fun call!50950 () Unit!37395)

(assert (=> bm!50944 (= call!50953 call!50950)))

(declare-fun b!1140523 () Bool)

(declare-fun e!648890 () Bool)

(assert (=> b!1140523 (= e!648896 e!648890)))

(declare-fun res!760422 () Bool)

(assert (=> b!1140523 (=> res!760422 e!648890)))

(assert (=> b!1140523 (= res!760422 (not (= (select (arr!35726 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648891 () Bool)

(assert (=> b!1140523 e!648891))

(declare-fun c!111913 () Bool)

(assert (=> b!1140523 (= c!111913 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507894 () Unit!37395)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!488 (array!74151 array!74153 (_ BitVec 32) (_ BitVec 32) V!43323 V!43323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37395)

(assert (=> b!1140523 (= lt!507894 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140524 () Bool)

(declare-fun res!760429 () Bool)

(assert (=> b!1140524 (=> (not res!760429) (not e!648895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140524 (= res!760429 (validKeyInArray!0 k0!934))))

(declare-fun bm!50945 () Bool)

(declare-fun call!50946 () ListLongMap!16153)

(assert (=> bm!50945 (= call!50948 call!50946)))

(declare-fun b!1140525 () Bool)

(declare-fun c!111912 () Bool)

(assert (=> b!1140525 (= c!111912 (and (not lt!507880) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648894 () Unit!37395)

(assert (=> b!1140525 (= e!648894 e!648899)))

(declare-fun b!1140526 () Bool)

(declare-fun res!760424 () Bool)

(assert (=> b!1140526 (=> (not res!760424) (not e!648895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140526 (= res!760424 (validMask!0 mask!1564))))

(declare-fun call!50951 () ListLongMap!16153)

(declare-fun call!50952 () ListLongMap!16153)

(declare-fun b!1140527 () Bool)

(declare-fun -!1242 (ListLongMap!16153 (_ BitVec 64)) ListLongMap!16153)

(assert (=> b!1140527 (= e!648891 (= call!50951 (-!1242 call!50952 k0!934)))))

(declare-fun bm!50946 () Bool)

(assert (=> bm!50946 (= call!50952 (getCurrentListMapNoExtraKeys!4574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140528 () Bool)

(declare-fun Unit!37399 () Unit!37395)

(assert (=> b!1140528 (= e!648889 Unit!37399)))

(assert (=> b!1140528 (= lt!507880 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140528 (= c!111915 (and (not lt!507880) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507882 () Unit!37395)

(assert (=> b!1140528 (= lt!507882 e!648894)))

(declare-fun lt!507895 () Unit!37395)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!381 (array!74151 array!74153 (_ BitVec 32) (_ BitVec 32) V!43323 V!43323 (_ BitVec 64) (_ BitVec 32) Int) Unit!37395)

(assert (=> b!1140528 (= lt!507895 (lemmaListMapContainsThenArrayContainsFrom!381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111914 () Bool)

(assert (=> b!1140528 (= c!111914 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760430 () Bool)

(assert (=> b!1140528 (= res!760430 e!648897)))

(assert (=> b!1140528 (=> (not res!760430) (not e!648902))))

(assert (=> b!1140528 e!648902))

(declare-fun lt!507896 () Unit!37395)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74151 (_ BitVec 32) (_ BitVec 32)) Unit!37395)

(assert (=> b!1140528 (= lt!507896 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140528 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24937)))

(declare-fun lt!507884 () Unit!37395)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74151 (_ BitVec 64) (_ BitVec 32) List!24940) Unit!37395)

(assert (=> b!1140528 (= lt!507884 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24937))))

(assert (=> b!1140528 false))

(declare-fun b!1140529 () Bool)

(declare-fun call!50947 () Bool)

(assert (=> b!1140529 call!50947))

(declare-fun lt!507883 () Unit!37395)

(assert (=> b!1140529 (= lt!507883 call!50953)))

(assert (=> b!1140529 (= e!648901 lt!507883)))

(declare-fun b!1140530 () Bool)

(assert (=> b!1140530 (= e!648898 tp_is_empty!28647)))

(declare-fun b!1140531 () Bool)

(assert (=> b!1140531 (contains!6627 call!50946 k0!934)))

(declare-fun lt!507886 () Unit!37395)

(assert (=> b!1140531 (= lt!507886 call!50950)))

(assert (=> b!1140531 call!50949))

(declare-fun lt!507897 () ListLongMap!16153)

(declare-fun +!3524 (ListLongMap!16153 tuple2!18184) ListLongMap!16153)

(assert (=> b!1140531 (= lt!507885 (+!3524 lt!507897 (tuple2!18185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507889 () Unit!37395)

(declare-fun addStillContains!781 (ListLongMap!16153 (_ BitVec 64) V!43323 (_ BitVec 64)) Unit!37395)

(assert (=> b!1140531 (= lt!507889 (addStillContains!781 lt!507897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140531 (= e!648894 lt!507886)))

(declare-fun b!1140532 () Bool)

(declare-fun res!760420 () Bool)

(assert (=> b!1140532 (=> (not res!760420) (not e!648895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74151 (_ BitVec 32)) Bool)

(assert (=> b!1140532 (= res!760420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140533 () Bool)

(declare-fun res!760425 () Bool)

(assert (=> b!1140533 (=> (not res!760425) (not e!648895))))

(assert (=> b!1140533 (= res!760425 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36262 _keys!1208))))))

(declare-fun b!1140534 () Bool)

(declare-fun res!760421 () Bool)

(assert (=> b!1140534 (=> (not res!760421) (not e!648895))))

(assert (=> b!1140534 (= res!760421 (= (select (arr!35726 _keys!1208) i!673) k0!934))))

(declare-fun bm!50947 () Bool)

(assert (=> bm!50947 (= call!50947 call!50949)))

(declare-fun b!1140535 () Bool)

(declare-fun res!760432 () Bool)

(declare-fun e!648888 () Bool)

(assert (=> b!1140535 (=> (not res!760432) (not e!648888))))

(assert (=> b!1140535 (= res!760432 (arrayNoDuplicates!0 lt!507893 #b00000000000000000000000000000000 Nil!24937))))

(declare-fun b!1140536 () Bool)

(assert (=> b!1140536 (= e!648895 e!648888)))

(declare-fun res!760423 () Bool)

(assert (=> b!1140536 (=> (not res!760423) (not e!648888))))

(assert (=> b!1140536 (= res!760423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507893 mask!1564))))

(assert (=> b!1140536 (= lt!507893 (array!74152 (store (arr!35726 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36262 _keys!1208)))))

(declare-fun b!1140537 () Bool)

(declare-fun lt!507881 () Unit!37395)

(assert (=> b!1140537 (= e!648899 lt!507881)))

(assert (=> b!1140537 (= lt!507881 call!50953)))

(assert (=> b!1140537 call!50947))

(declare-fun bm!50948 () Bool)

(assert (=> bm!50948 (= call!50950 (addStillContains!781 (ite c!111915 lt!507885 lt!507897) (ite c!111915 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111912 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111915 minValue!944 (ite c!111912 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140538 () Bool)

(assert (=> b!1140538 (= e!648890 true)))

(declare-fun lt!507888 () V!43323)

(assert (=> b!1140538 (= (-!1242 (+!3524 lt!507897 (tuple2!18185 (select (arr!35726 _keys!1208) from!1455) lt!507888)) (select (arr!35726 _keys!1208) from!1455)) lt!507897)))

(declare-fun lt!507890 () Unit!37395)

(declare-fun addThenRemoveForNewKeyIsSame!96 (ListLongMap!16153 (_ BitVec 64) V!43323) Unit!37395)

(assert (=> b!1140538 (= lt!507890 (addThenRemoveForNewKeyIsSame!96 lt!507897 (select (arr!35726 _keys!1208) from!1455) lt!507888))))

(declare-fun get!18148 (ValueCell!13614 V!43323) V!43323)

(assert (=> b!1140538 (= lt!507888 (get!18148 (select (arr!35727 _values!996) from!1455) lt!507879))))

(declare-fun lt!507891 () Unit!37395)

(assert (=> b!1140538 (= lt!507891 e!648889)))

(declare-fun c!111911 () Bool)

(assert (=> b!1140538 (= c!111911 (contains!6627 lt!507897 k0!934))))

(assert (=> b!1140538 (= lt!507897 (getCurrentListMapNoExtraKeys!4574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140539 () Bool)

(assert (=> b!1140539 (= e!648888 (not e!648893))))

(declare-fun res!760427 () Bool)

(assert (=> b!1140539 (=> res!760427 e!648893)))

(assert (=> b!1140539 (= res!760427 (bvsgt from!1455 i!673))))

(assert (=> b!1140539 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507887 () Unit!37395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74151 (_ BitVec 64) (_ BitVec 32)) Unit!37395)

(assert (=> b!1140539 (= lt!507887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140540 () Bool)

(assert (=> b!1140540 (= e!648897 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507880) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140541 () Bool)

(declare-fun res!760426 () Bool)

(assert (=> b!1140541 (=> (not res!760426) (not e!648895))))

(assert (=> b!1140541 (= res!760426 (and (= (size!36263 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36262 _keys!1208) (size!36263 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50949 () Bool)

(assert (=> bm!50949 (= call!50946 (+!3524 (ite c!111915 lt!507885 lt!507897) (ite c!111915 (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111912 (tuple2!18185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!760428 () Bool)

(assert (=> start!98512 (=> (not res!760428) (not e!648895))))

(assert (=> start!98512 (= res!760428 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36262 _keys!1208))))))

(assert (=> start!98512 e!648895))

(assert (=> start!98512 tp_is_empty!28647))

(declare-fun array_inv!27384 (array!74151) Bool)

(assert (=> start!98512 (array_inv!27384 _keys!1208)))

(assert (=> start!98512 true))

(assert (=> start!98512 tp!85061))

(declare-fun e!648900 () Bool)

(declare-fun array_inv!27385 (array!74153) Bool)

(assert (=> start!98512 (and (array_inv!27385 _values!996) e!648900)))

(declare-fun mapIsEmpty!44795 () Bool)

(assert (=> mapIsEmpty!44795 mapRes!44795))

(declare-fun b!1140542 () Bool)

(assert (=> b!1140542 (= e!648891 (= call!50951 call!50952))))

(declare-fun b!1140543 () Bool)

(assert (=> b!1140543 (= e!648900 (and e!648903 mapRes!44795))))

(declare-fun condMapEmpty!44795 () Bool)

(declare-fun mapDefault!44795 () ValueCell!13614)

(assert (=> b!1140543 (= condMapEmpty!44795 (= (arr!35727 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13614)) mapDefault!44795)))))

(declare-fun bm!50950 () Bool)

(assert (=> bm!50950 (= call!50951 (getCurrentListMapNoExtraKeys!4574 lt!507893 lt!507892 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98512 res!760428) b!1140526))

(assert (= (and b!1140526 res!760424) b!1140541))

(assert (= (and b!1140541 res!760426) b!1140532))

(assert (= (and b!1140532 res!760420) b!1140519))

(assert (= (and b!1140519 res!760433) b!1140533))

(assert (= (and b!1140533 res!760425) b!1140524))

(assert (= (and b!1140524 res!760429) b!1140534))

(assert (= (and b!1140534 res!760421) b!1140536))

(assert (= (and b!1140536 res!760423) b!1140535))

(assert (= (and b!1140535 res!760432) b!1140539))

(assert (= (and b!1140539 (not res!760427)) b!1140522))

(assert (= (and b!1140522 (not res!760431)) b!1140523))

(assert (= (and b!1140523 c!111913) b!1140527))

(assert (= (and b!1140523 (not c!111913)) b!1140542))

(assert (= (or b!1140527 b!1140542) bm!50950))

(assert (= (or b!1140527 b!1140542) bm!50946))

(assert (= (and b!1140523 (not res!760422)) b!1140538))

(assert (= (and b!1140538 c!111911) b!1140528))

(assert (= (and b!1140538 (not c!111911)) b!1140518))

(assert (= (and b!1140528 c!111915) b!1140531))

(assert (= (and b!1140528 (not c!111915)) b!1140525))

(assert (= (and b!1140525 c!111912) b!1140537))

(assert (= (and b!1140525 (not c!111912)) b!1140515))

(assert (= (and b!1140515 c!111916) b!1140529))

(assert (= (and b!1140515 (not c!111916)) b!1140516))

(assert (= (or b!1140537 b!1140529) bm!50944))

(assert (= (or b!1140537 b!1140529) bm!50945))

(assert (= (or b!1140537 b!1140529) bm!50947))

(assert (= (or b!1140531 bm!50947) bm!50943))

(assert (= (or b!1140531 bm!50944) bm!50948))

(assert (= (or b!1140531 bm!50945) bm!50949))

(assert (= (and b!1140528 c!111914) b!1140517))

(assert (= (and b!1140528 (not c!111914)) b!1140540))

(assert (= (and b!1140528 res!760430) b!1140520))

(assert (= (and b!1140543 condMapEmpty!44795) mapIsEmpty!44795))

(assert (= (and b!1140543 (not condMapEmpty!44795)) mapNonEmpty!44795))

(get-info :version)

(assert (= (and mapNonEmpty!44795 ((_ is ValueCellFull!13614) mapValue!44795)) b!1140530))

(assert (= (and b!1140543 ((_ is ValueCellFull!13614) mapDefault!44795)) b!1140521))

(assert (= start!98512 b!1140543))

(declare-fun b_lambda!19223 () Bool)

(assert (=> (not b_lambda!19223) (not b!1140522)))

(declare-fun t!36047 () Bool)

(declare-fun tb!8929 () Bool)

(assert (=> (and start!98512 (= defaultEntry!1004 defaultEntry!1004) t!36047) tb!8929))

(declare-fun result!18423 () Bool)

(assert (=> tb!8929 (= result!18423 tp_is_empty!28647)))

(assert (=> b!1140522 t!36047))

(declare-fun b_and!39085 () Bool)

(assert (= b_and!39083 (and (=> t!36047 result!18423) b_and!39085)))

(declare-fun m!1052017 () Bool)

(assert (=> b!1140517 m!1052017))

(declare-fun m!1052019 () Bool)

(assert (=> bm!50943 m!1052019))

(declare-fun m!1052021 () Bool)

(assert (=> b!1140527 m!1052021))

(assert (=> b!1140520 m!1052017))

(declare-fun m!1052023 () Bool)

(assert (=> b!1140523 m!1052023))

(declare-fun m!1052025 () Bool)

(assert (=> b!1140523 m!1052025))

(declare-fun m!1052027 () Bool)

(assert (=> b!1140536 m!1052027))

(declare-fun m!1052029 () Bool)

(assert (=> b!1140536 m!1052029))

(declare-fun m!1052031 () Bool)

(assert (=> bm!50949 m!1052031))

(declare-fun m!1052033 () Bool)

(assert (=> b!1140534 m!1052033))

(declare-fun m!1052035 () Bool)

(assert (=> b!1140519 m!1052035))

(declare-fun m!1052037 () Bool)

(assert (=> b!1140528 m!1052037))

(declare-fun m!1052039 () Bool)

(assert (=> b!1140528 m!1052039))

(declare-fun m!1052041 () Bool)

(assert (=> b!1140528 m!1052041))

(declare-fun m!1052043 () Bool)

(assert (=> b!1140528 m!1052043))

(declare-fun m!1052045 () Bool)

(assert (=> mapNonEmpty!44795 m!1052045))

(declare-fun m!1052047 () Bool)

(assert (=> b!1140535 m!1052047))

(declare-fun m!1052049 () Bool)

(assert (=> bm!50950 m!1052049))

(declare-fun m!1052051 () Bool)

(assert (=> b!1140522 m!1052051))

(declare-fun m!1052053 () Bool)

(assert (=> b!1140522 m!1052053))

(declare-fun m!1052055 () Bool)

(assert (=> b!1140522 m!1052055))

(declare-fun m!1052057 () Bool)

(assert (=> b!1140522 m!1052057))

(declare-fun m!1052059 () Bool)

(assert (=> b!1140526 m!1052059))

(declare-fun m!1052061 () Bool)

(assert (=> b!1140524 m!1052061))

(declare-fun m!1052063 () Bool)

(assert (=> b!1140539 m!1052063))

(declare-fun m!1052065 () Bool)

(assert (=> b!1140539 m!1052065))

(declare-fun m!1052067 () Bool)

(assert (=> b!1140538 m!1052067))

(declare-fun m!1052069 () Bool)

(assert (=> b!1140538 m!1052069))

(declare-fun m!1052071 () Bool)

(assert (=> b!1140538 m!1052071))

(assert (=> b!1140538 m!1052071))

(assert (=> b!1140538 m!1052023))

(declare-fun m!1052073 () Bool)

(assert (=> b!1140538 m!1052073))

(assert (=> b!1140538 m!1052023))

(declare-fun m!1052075 () Bool)

(assert (=> b!1140538 m!1052075))

(assert (=> b!1140538 m!1052023))

(declare-fun m!1052077 () Bool)

(assert (=> b!1140538 m!1052077))

(assert (=> b!1140538 m!1052067))

(declare-fun m!1052079 () Bool)

(assert (=> b!1140538 m!1052079))

(declare-fun m!1052081 () Bool)

(assert (=> bm!50948 m!1052081))

(declare-fun m!1052083 () Bool)

(assert (=> b!1140531 m!1052083))

(declare-fun m!1052085 () Bool)

(assert (=> b!1140531 m!1052085))

(declare-fun m!1052087 () Bool)

(assert (=> b!1140531 m!1052087))

(declare-fun m!1052089 () Bool)

(assert (=> start!98512 m!1052089))

(declare-fun m!1052091 () Bool)

(assert (=> start!98512 m!1052091))

(declare-fun m!1052093 () Bool)

(assert (=> b!1140532 m!1052093))

(assert (=> bm!50946 m!1052077))

(check-sat (not bm!50943) (not b!1140539) (not bm!50949) (not b!1140520) (not b!1140527) (not bm!50948) (not mapNonEmpty!44795) (not b!1140531) (not b!1140536) (not b!1140522) (not b_lambda!19223) (not b!1140519) (not b!1140538) (not b!1140528) (not b!1140524) (not b!1140526) (not b_next!24117) tp_is_empty!28647 (not b!1140535) (not start!98512) (not bm!50946) (not b!1140523) (not bm!50950) (not b!1140517) b_and!39085 (not b!1140532))
(check-sat b_and!39085 (not b_next!24117))
