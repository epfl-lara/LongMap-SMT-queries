; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98510 () Bool)

(assert start!98510)

(declare-fun b_free!24121 () Bool)

(declare-fun b_next!24121 () Bool)

(assert (=> start!98510 (= b_free!24121 (not b_next!24121))))

(declare-fun tp!85074 () Bool)

(declare-fun b_and!39069 () Bool)

(assert (=> start!98510 (= tp!85074 b_and!39069)))

(declare-datatypes ((array!74084 0))(
  ( (array!74085 (arr!35693 (Array (_ BitVec 32) (_ BitVec 64))) (size!36231 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74084)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!648921 () Bool)

(declare-fun b!1140569 () Bool)

(declare-fun arrayContainsKey!0 (array!74084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140569 (= e!648921 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140570 () Bool)

(declare-datatypes ((Unit!37255 0))(
  ( (Unit!37256) )
))
(declare-fun e!648920 () Unit!37255)

(declare-fun Unit!37257 () Unit!37255)

(assert (=> b!1140570 (= e!648920 Unit!37257)))

(declare-datatypes ((V!43329 0))(
  ( (V!43330 (val!14382 Int)) )
))
(declare-fun zeroValue!944 () V!43329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18276 0))(
  ( (tuple2!18277 (_1!9149 (_ BitVec 64)) (_2!9149 V!43329)) )
))
(declare-datatypes ((List!25016 0))(
  ( (Nil!25013) (Cons!25012 (h!26221 tuple2!18276) (t!36120 List!25016)) )
))
(declare-datatypes ((ListLongMap!16245 0))(
  ( (ListLongMap!16246 (toList!8138 List!25016)) )
))
(declare-fun call!50972 () ListLongMap!16245)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13616 0))(
  ( (ValueCellFull!13616 (v!17018 V!43329)) (EmptyCell!13616) )
))
(declare-datatypes ((array!74086 0))(
  ( (array!74087 (arr!35694 (Array (_ BitVec 32) ValueCell!13616)) (size!36232 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74086)

(declare-fun minValue!944 () V!43329)

(declare-fun bm!50968 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4632 (array!74084 array!74086 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) Int) ListLongMap!16245)

(assert (=> bm!50968 (= call!50972 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140571 () Bool)

(declare-fun e!648916 () Bool)

(declare-fun call!50973 () ListLongMap!16245)

(assert (=> b!1140571 (= e!648916 (= call!50973 call!50972))))

(declare-fun bm!50969 () Bool)

(declare-fun lt!507821 () ListLongMap!16245)

(declare-fun c!111921 () Bool)

(declare-fun c!111922 () Bool)

(declare-fun call!50978 () ListLongMap!16245)

(declare-fun lt!507829 () ListLongMap!16245)

(declare-fun +!3565 (ListLongMap!16245 tuple2!18276) ListLongMap!16245)

(assert (=> bm!50969 (= call!50978 (+!3565 (ite c!111922 lt!507821 lt!507829) (ite c!111922 (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111921 (tuple2!18277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!44801 () Bool)

(declare-fun mapRes!44801 () Bool)

(assert (=> mapIsEmpty!44801 mapRes!44801))

(declare-fun b!1140572 () Bool)

(declare-fun res!760446 () Bool)

(declare-fun e!648919 () Bool)

(assert (=> b!1140572 (=> (not res!760446) (not e!648919))))

(assert (=> b!1140572 (= res!760446 (and (= (size!36232 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36231 _keys!1208) (size!36232 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140573 () Bool)

(declare-fun e!648914 () Bool)

(assert (=> b!1140573 (= e!648914 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140574 () Bool)

(declare-fun e!648911 () Unit!37255)

(declare-fun Unit!37258 () Unit!37255)

(assert (=> b!1140574 (= e!648911 Unit!37258)))

(declare-fun b!1140576 () Bool)

(declare-fun -!1225 (ListLongMap!16245 (_ BitVec 64)) ListLongMap!16245)

(assert (=> b!1140576 (= e!648916 (= call!50973 (-!1225 call!50972 k0!934)))))

(declare-fun b!1140577 () Bool)

(declare-fun e!648918 () Bool)

(declare-fun e!648910 () Bool)

(assert (=> b!1140577 (= e!648918 e!648910)))

(declare-fun res!760443 () Bool)

(assert (=> b!1140577 (=> res!760443 e!648910)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140577 (= res!760443 (not (= from!1455 i!673)))))

(declare-fun lt!507825 () array!74086)

(declare-fun lt!507812 () ListLongMap!16245)

(declare-fun lt!507831 () array!74084)

(assert (=> b!1140577 (= lt!507812 (getCurrentListMapNoExtraKeys!4632 lt!507831 lt!507825 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507818 () V!43329)

(assert (=> b!1140577 (= lt!507825 (array!74087 (store (arr!35694 _values!996) i!673 (ValueCellFull!13616 lt!507818)) (size!36232 _values!996)))))

(declare-fun dynLambda!2615 (Int (_ BitVec 64)) V!43329)

(assert (=> b!1140577 (= lt!507818 (dynLambda!2615 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507813 () ListLongMap!16245)

(assert (=> b!1140577 (= lt!507813 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140578 () Bool)

(declare-fun lt!507822 () Bool)

(assert (=> b!1140578 (= c!111921 (and (not lt!507822) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648912 () Unit!37255)

(declare-fun e!648908 () Unit!37255)

(assert (=> b!1140578 (= e!648912 e!648908)))

(declare-fun bm!50970 () Bool)

(declare-fun call!50975 () Bool)

(declare-fun call!50974 () Bool)

(assert (=> bm!50970 (= call!50975 call!50974)))

(declare-fun b!1140579 () Bool)

(declare-fun res!760450 () Bool)

(assert (=> b!1140579 (=> (not res!760450) (not e!648919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140579 (= res!760450 (validKeyInArray!0 k0!934))))

(declare-fun bm!50971 () Bool)

(declare-fun call!50977 () ListLongMap!16245)

(assert (=> bm!50971 (= call!50977 call!50978)))

(declare-fun b!1140580 () Bool)

(declare-fun e!648917 () Bool)

(assert (=> b!1140580 (= e!648919 e!648917)))

(declare-fun res!760445 () Bool)

(assert (=> b!1140580 (=> (not res!760445) (not e!648917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74084 (_ BitVec 32)) Bool)

(assert (=> b!1140580 (= res!760445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507831 mask!1564))))

(assert (=> b!1140580 (= lt!507831 (array!74085 (store (arr!35693 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36231 _keys!1208)))))

(declare-fun b!1140581 () Bool)

(declare-fun e!648906 () Bool)

(assert (=> b!1140581 (= e!648910 e!648906)))

(declare-fun res!760442 () Bool)

(assert (=> b!1140581 (=> res!760442 e!648906)))

(assert (=> b!1140581 (= res!760442 (not (= (select (arr!35693 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140581 e!648916))

(declare-fun c!111924 () Bool)

(assert (=> b!1140581 (= c!111924 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507819 () Unit!37255)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!506 (array!74084 array!74086 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37255)

(assert (=> b!1140581 (= lt!507819 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140582 () Bool)

(assert (=> b!1140582 (= e!648914 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507822) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!50976 () Unit!37255)

(declare-fun bm!50972 () Bool)

(declare-fun addStillContains!780 (ListLongMap!16245 (_ BitVec 64) V!43329 (_ BitVec 64)) Unit!37255)

(assert (=> bm!50972 (= call!50976 (addStillContains!780 (ite c!111922 lt!507821 lt!507829) (ite c!111922 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111921 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111922 minValue!944 (ite c!111921 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140583 () Bool)

(declare-fun e!648915 () Bool)

(declare-fun e!648907 () Bool)

(assert (=> b!1140583 (= e!648915 (and e!648907 mapRes!44801))))

(declare-fun condMapEmpty!44801 () Bool)

(declare-fun mapDefault!44801 () ValueCell!13616)

(assert (=> b!1140583 (= condMapEmpty!44801 (= (arr!35694 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13616)) mapDefault!44801)))))

(declare-fun mapNonEmpty!44801 () Bool)

(declare-fun tp!85073 () Bool)

(declare-fun e!648913 () Bool)

(assert (=> mapNonEmpty!44801 (= mapRes!44801 (and tp!85073 e!648913))))

(declare-fun mapRest!44801 () (Array (_ BitVec 32) ValueCell!13616))

(declare-fun mapKey!44801 () (_ BitVec 32))

(declare-fun mapValue!44801 () ValueCell!13616)

(assert (=> mapNonEmpty!44801 (= (arr!35694 _values!996) (store mapRest!44801 mapKey!44801 mapValue!44801))))

(declare-fun b!1140584 () Bool)

(declare-fun tp_is_empty!28651 () Bool)

(assert (=> b!1140584 (= e!648913 tp_is_empty!28651)))

(declare-fun b!1140585 () Bool)

(declare-fun Unit!37259 () Unit!37255)

(assert (=> b!1140585 (= e!648920 Unit!37259)))

(assert (=> b!1140585 (= lt!507822 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140585 (= c!111922 (and (not lt!507822) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507823 () Unit!37255)

(assert (=> b!1140585 (= lt!507823 e!648912)))

(declare-fun lt!507811 () Unit!37255)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!382 (array!74084 array!74086 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 64) (_ BitVec 32) Int) Unit!37255)

(assert (=> b!1140585 (= lt!507811 (lemmaListMapContainsThenArrayContainsFrom!382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111926 () Bool)

(assert (=> b!1140585 (= c!111926 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760440 () Bool)

(assert (=> b!1140585 (= res!760440 e!648914)))

(assert (=> b!1140585 (=> (not res!760440) (not e!648921))))

(assert (=> b!1140585 e!648921))

(declare-fun lt!507814 () Unit!37255)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74084 (_ BitVec 32) (_ BitVec 32)) Unit!37255)

(assert (=> b!1140585 (= lt!507814 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25017 0))(
  ( (Nil!25014) (Cons!25013 (h!26222 (_ BitVec 64)) (t!36121 List!25017)) )
))
(declare-fun arrayNoDuplicates!0 (array!74084 (_ BitVec 32) List!25017) Bool)

(assert (=> b!1140585 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25014)))

(declare-fun lt!507827 () Unit!37255)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74084 (_ BitVec 64) (_ BitVec 32) List!25017) Unit!37255)

(assert (=> b!1140585 (= lt!507827 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25014))))

(assert (=> b!1140585 false))

(declare-fun bm!50973 () Bool)

(assert (=> bm!50973 (= call!50973 (getCurrentListMapNoExtraKeys!4632 lt!507831 lt!507825 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140586 () Bool)

(declare-fun contains!6609 (ListLongMap!16245 (_ BitVec 64)) Bool)

(assert (=> b!1140586 (contains!6609 call!50978 k0!934)))

(declare-fun lt!507817 () Unit!37255)

(assert (=> b!1140586 (= lt!507817 call!50976)))

(assert (=> b!1140586 call!50974))

(assert (=> b!1140586 (= lt!507821 (+!3565 lt!507829 (tuple2!18277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507815 () Unit!37255)

(assert (=> b!1140586 (= lt!507815 (addStillContains!780 lt!507829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140586 (= e!648912 lt!507817)))

(declare-fun b!1140587 () Bool)

(declare-fun res!760447 () Bool)

(assert (=> b!1140587 (=> (not res!760447) (not e!648917))))

(assert (=> b!1140587 (= res!760447 (arrayNoDuplicates!0 lt!507831 #b00000000000000000000000000000000 Nil!25014))))

(declare-fun bm!50974 () Bool)

(assert (=> bm!50974 (= call!50974 (contains!6609 (ite c!111922 lt!507821 call!50977) k0!934))))

(declare-fun bm!50975 () Bool)

(declare-fun call!50971 () Unit!37255)

(assert (=> bm!50975 (= call!50971 call!50976)))

(declare-fun b!1140588 () Bool)

(assert (=> b!1140588 (= e!648907 tp_is_empty!28651)))

(declare-fun b!1140589 () Bool)

(assert (=> b!1140589 (= e!648908 e!648911)))

(declare-fun c!111925 () Bool)

(assert (=> b!1140589 (= c!111925 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507822))))

(declare-fun res!760438 () Bool)

(assert (=> start!98510 (=> (not res!760438) (not e!648919))))

(assert (=> start!98510 (= res!760438 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36231 _keys!1208))))))

(assert (=> start!98510 e!648919))

(assert (=> start!98510 tp_is_empty!28651))

(declare-fun array_inv!27432 (array!74084) Bool)

(assert (=> start!98510 (array_inv!27432 _keys!1208)))

(assert (=> start!98510 true))

(assert (=> start!98510 tp!85074))

(declare-fun array_inv!27433 (array!74086) Bool)

(assert (=> start!98510 (and (array_inv!27433 _values!996) e!648915)))

(declare-fun b!1140575 () Bool)

(assert (=> b!1140575 call!50975))

(declare-fun lt!507826 () Unit!37255)

(assert (=> b!1140575 (= lt!507826 call!50971)))

(assert (=> b!1140575 (= e!648911 lt!507826)))

(declare-fun b!1140590 () Bool)

(declare-fun res!760451 () Bool)

(assert (=> b!1140590 (=> (not res!760451) (not e!648919))))

(assert (=> b!1140590 (= res!760451 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36231 _keys!1208))))))

(declare-fun b!1140591 () Bool)

(assert (=> b!1140591 (= e!648917 (not e!648918))))

(declare-fun res!760441 () Bool)

(assert (=> b!1140591 (=> res!760441 e!648918)))

(assert (=> b!1140591 (= res!760441 (bvsgt from!1455 i!673))))

(assert (=> b!1140591 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507824 () Unit!37255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74084 (_ BitVec 64) (_ BitVec 32)) Unit!37255)

(assert (=> b!1140591 (= lt!507824 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140592 () Bool)

(declare-fun res!760444 () Bool)

(assert (=> b!1140592 (=> (not res!760444) (not e!648919))))

(assert (=> b!1140592 (= res!760444 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25014))))

(declare-fun b!1140593 () Bool)

(declare-fun res!760448 () Bool)

(assert (=> b!1140593 (=> (not res!760448) (not e!648919))))

(assert (=> b!1140593 (= res!760448 (= (select (arr!35693 _keys!1208) i!673) k0!934))))

(declare-fun b!1140594 () Bool)

(declare-fun res!760439 () Bool)

(assert (=> b!1140594 (=> (not res!760439) (not e!648919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140594 (= res!760439 (validMask!0 mask!1564))))

(declare-fun b!1140595 () Bool)

(declare-fun lt!507830 () Unit!37255)

(assert (=> b!1140595 (= e!648908 lt!507830)))

(assert (=> b!1140595 (= lt!507830 call!50971)))

(assert (=> b!1140595 call!50975))

(declare-fun b!1140596 () Bool)

(assert (=> b!1140596 (= e!648906 true)))

(declare-fun lt!507816 () V!43329)

(assert (=> b!1140596 (= (-!1225 (+!3565 lt!507829 (tuple2!18277 (select (arr!35693 _keys!1208) from!1455) lt!507816)) (select (arr!35693 _keys!1208) from!1455)) lt!507829)))

(declare-fun lt!507828 () Unit!37255)

(declare-fun addThenRemoveForNewKeyIsSame!91 (ListLongMap!16245 (_ BitVec 64) V!43329) Unit!37255)

(assert (=> b!1140596 (= lt!507828 (addThenRemoveForNewKeyIsSame!91 lt!507829 (select (arr!35693 _keys!1208) from!1455) lt!507816))))

(declare-fun get!18145 (ValueCell!13616 V!43329) V!43329)

(assert (=> b!1140596 (= lt!507816 (get!18145 (select (arr!35694 _values!996) from!1455) lt!507818))))

(declare-fun lt!507820 () Unit!37255)

(assert (=> b!1140596 (= lt!507820 e!648920)))

(declare-fun c!111923 () Bool)

(assert (=> b!1140596 (= c!111923 (contains!6609 lt!507829 k0!934))))

(assert (=> b!1140596 (= lt!507829 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140597 () Bool)

(declare-fun res!760449 () Bool)

(assert (=> b!1140597 (=> (not res!760449) (not e!648919))))

(assert (=> b!1140597 (= res!760449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98510 res!760438) b!1140594))

(assert (= (and b!1140594 res!760439) b!1140572))

(assert (= (and b!1140572 res!760446) b!1140597))

(assert (= (and b!1140597 res!760449) b!1140592))

(assert (= (and b!1140592 res!760444) b!1140590))

(assert (= (and b!1140590 res!760451) b!1140579))

(assert (= (and b!1140579 res!760450) b!1140593))

(assert (= (and b!1140593 res!760448) b!1140580))

(assert (= (and b!1140580 res!760445) b!1140587))

(assert (= (and b!1140587 res!760447) b!1140591))

(assert (= (and b!1140591 (not res!760441)) b!1140577))

(assert (= (and b!1140577 (not res!760443)) b!1140581))

(assert (= (and b!1140581 c!111924) b!1140576))

(assert (= (and b!1140581 (not c!111924)) b!1140571))

(assert (= (or b!1140576 b!1140571) bm!50968))

(assert (= (or b!1140576 b!1140571) bm!50973))

(assert (= (and b!1140581 (not res!760442)) b!1140596))

(assert (= (and b!1140596 c!111923) b!1140585))

(assert (= (and b!1140596 (not c!111923)) b!1140570))

(assert (= (and b!1140585 c!111922) b!1140586))

(assert (= (and b!1140585 (not c!111922)) b!1140578))

(assert (= (and b!1140578 c!111921) b!1140595))

(assert (= (and b!1140578 (not c!111921)) b!1140589))

(assert (= (and b!1140589 c!111925) b!1140575))

(assert (= (and b!1140589 (not c!111925)) b!1140574))

(assert (= (or b!1140595 b!1140575) bm!50975))

(assert (= (or b!1140595 b!1140575) bm!50971))

(assert (= (or b!1140595 b!1140575) bm!50970))

(assert (= (or b!1140586 bm!50970) bm!50974))

(assert (= (or b!1140586 bm!50975) bm!50972))

(assert (= (or b!1140586 bm!50971) bm!50969))

(assert (= (and b!1140585 c!111926) b!1140573))

(assert (= (and b!1140585 (not c!111926)) b!1140582))

(assert (= (and b!1140585 res!760440) b!1140569))

(assert (= (and b!1140583 condMapEmpty!44801) mapIsEmpty!44801))

(assert (= (and b!1140583 (not condMapEmpty!44801)) mapNonEmpty!44801))

(get-info :version)

(assert (= (and mapNonEmpty!44801 ((_ is ValueCellFull!13616) mapValue!44801)) b!1140584))

(assert (= (and b!1140583 ((_ is ValueCellFull!13616) mapDefault!44801)) b!1140588))

(assert (= start!98510 b!1140583))

(declare-fun b_lambda!19209 () Bool)

(assert (=> (not b_lambda!19209) (not b!1140577)))

(declare-fun t!36119 () Bool)

(declare-fun tb!8925 () Bool)

(assert (=> (and start!98510 (= defaultEntry!1004 defaultEntry!1004) t!36119) tb!8925))

(declare-fun result!18423 () Bool)

(assert (=> tb!8925 (= result!18423 tp_is_empty!28651)))

(assert (=> b!1140577 t!36119))

(declare-fun b_and!39071 () Bool)

(assert (= b_and!39069 (and (=> t!36119 result!18423) b_and!39071)))

(declare-fun m!1051573 () Bool)

(assert (=> start!98510 m!1051573))

(declare-fun m!1051575 () Bool)

(assert (=> start!98510 m!1051575))

(declare-fun m!1051577 () Bool)

(assert (=> bm!50974 m!1051577))

(declare-fun m!1051579 () Bool)

(assert (=> b!1140593 m!1051579))

(declare-fun m!1051581 () Bool)

(assert (=> b!1140586 m!1051581))

(declare-fun m!1051583 () Bool)

(assert (=> b!1140586 m!1051583))

(declare-fun m!1051585 () Bool)

(assert (=> b!1140586 m!1051585))

(declare-fun m!1051587 () Bool)

(assert (=> b!1140581 m!1051587))

(declare-fun m!1051589 () Bool)

(assert (=> b!1140581 m!1051589))

(declare-fun m!1051591 () Bool)

(assert (=> b!1140596 m!1051591))

(declare-fun m!1051593 () Bool)

(assert (=> b!1140596 m!1051593))

(assert (=> b!1140596 m!1051593))

(assert (=> b!1140596 m!1051587))

(declare-fun m!1051595 () Bool)

(assert (=> b!1140596 m!1051595))

(declare-fun m!1051597 () Bool)

(assert (=> b!1140596 m!1051597))

(declare-fun m!1051599 () Bool)

(assert (=> b!1140596 m!1051599))

(declare-fun m!1051601 () Bool)

(assert (=> b!1140596 m!1051601))

(assert (=> b!1140596 m!1051587))

(assert (=> b!1140596 m!1051597))

(assert (=> b!1140596 m!1051587))

(declare-fun m!1051603 () Bool)

(assert (=> b!1140596 m!1051603))

(declare-fun m!1051605 () Bool)

(assert (=> b!1140597 m!1051605))

(declare-fun m!1051607 () Bool)

(assert (=> bm!50973 m!1051607))

(declare-fun m!1051609 () Bool)

(assert (=> b!1140591 m!1051609))

(declare-fun m!1051611 () Bool)

(assert (=> b!1140591 m!1051611))

(declare-fun m!1051613 () Bool)

(assert (=> b!1140592 m!1051613))

(declare-fun m!1051615 () Bool)

(assert (=> b!1140577 m!1051615))

(declare-fun m!1051617 () Bool)

(assert (=> b!1140577 m!1051617))

(declare-fun m!1051619 () Bool)

(assert (=> b!1140577 m!1051619))

(declare-fun m!1051621 () Bool)

(assert (=> b!1140577 m!1051621))

(declare-fun m!1051623 () Bool)

(assert (=> mapNonEmpty!44801 m!1051623))

(declare-fun m!1051625 () Bool)

(assert (=> b!1140594 m!1051625))

(declare-fun m!1051627 () Bool)

(assert (=> b!1140579 m!1051627))

(declare-fun m!1051629 () Bool)

(assert (=> b!1140587 m!1051629))

(assert (=> bm!50968 m!1051591))

(declare-fun m!1051631 () Bool)

(assert (=> b!1140580 m!1051631))

(declare-fun m!1051633 () Bool)

(assert (=> b!1140580 m!1051633))

(declare-fun m!1051635 () Bool)

(assert (=> b!1140576 m!1051635))

(declare-fun m!1051637 () Bool)

(assert (=> bm!50972 m!1051637))

(declare-fun m!1051639 () Bool)

(assert (=> bm!50969 m!1051639))

(declare-fun m!1051641 () Bool)

(assert (=> b!1140569 m!1051641))

(assert (=> b!1140573 m!1051641))

(declare-fun m!1051643 () Bool)

(assert (=> b!1140585 m!1051643))

(declare-fun m!1051645 () Bool)

(assert (=> b!1140585 m!1051645))

(declare-fun m!1051647 () Bool)

(assert (=> b!1140585 m!1051647))

(declare-fun m!1051649 () Bool)

(assert (=> b!1140585 m!1051649))

(check-sat (not b!1140587) (not b!1140576) (not b!1140586) (not b!1140573) b_and!39071 (not start!98510) (not b!1140592) (not b!1140579) (not b!1140591) (not b!1140585) (not mapNonEmpty!44801) (not b!1140594) (not b!1140577) (not bm!50973) (not b_lambda!19209) (not b_next!24121) tp_is_empty!28651 (not bm!50972) (not bm!50974) (not b!1140580) (not b!1140569) (not b!1140597) (not bm!50968) (not bm!50969) (not b!1140596) (not b!1140581))
(check-sat b_and!39071 (not b_next!24121))
