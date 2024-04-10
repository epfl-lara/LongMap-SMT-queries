; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98476 () Bool)

(assert start!98476)

(declare-fun b_free!24081 () Bool)

(declare-fun b_next!24081 () Bool)

(assert (=> start!98476 (= b_free!24081 (not b_next!24081))))

(declare-fun tp!84954 () Bool)

(declare-fun b_and!39011 () Bool)

(assert (=> start!98476 (= tp!84954 b_and!39011)))

(declare-fun b!1138914 () Bool)

(declare-fun c!111592 () Bool)

(declare-fun lt!506790 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138914 (= c!111592 (and (not lt!506790) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37320 0))(
  ( (Unit!37321) )
))
(declare-fun e!648035 () Unit!37320)

(declare-fun e!648037 () Unit!37320)

(assert (=> b!1138914 (= e!648035 e!648037)))

(declare-fun b!1138915 () Bool)

(declare-fun e!648039 () Unit!37320)

(assert (=> b!1138915 (= e!648037 e!648039)))

(declare-fun c!111591 () Bool)

(assert (=> b!1138915 (= c!111591 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506790))))

(declare-fun b!1138916 () Bool)

(declare-fun res!759670 () Bool)

(declare-fun e!648029 () Bool)

(assert (=> b!1138916 (=> (not res!759670) (not e!648029))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74081 0))(
  ( (array!74082 (arr!35691 (Array (_ BitVec 32) (_ BitVec 64))) (size!36227 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74081)

(assert (=> b!1138916 (= res!759670 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36227 _keys!1208))))))

(declare-fun b!1138917 () Bool)

(declare-fun lt!506779 () Unit!37320)

(assert (=> b!1138917 (= e!648037 lt!506779)))

(declare-fun call!50519 () Unit!37320)

(assert (=> b!1138917 (= lt!506779 call!50519)))

(declare-fun call!50516 () Bool)

(assert (=> b!1138917 call!50516))

(declare-datatypes ((V!43275 0))(
  ( (V!43276 (val!14362 Int)) )
))
(declare-fun zeroValue!944 () V!43275)

(declare-datatypes ((tuple2!18150 0))(
  ( (tuple2!18151 (_1!9086 (_ BitVec 64)) (_2!9086 V!43275)) )
))
(declare-datatypes ((List!24906 0))(
  ( (Nil!24903) (Cons!24902 (h!26111 tuple2!18150) (t!35979 List!24906)) )
))
(declare-datatypes ((ListLongMap!16119 0))(
  ( (ListLongMap!16120 (toList!8075 List!24906)) )
))
(declare-fun lt!506776 () ListLongMap!16119)

(declare-fun lt!506785 () ListLongMap!16119)

(declare-fun minValue!944 () V!43275)

(declare-fun c!111587 () Bool)

(declare-fun call!50515 () ListLongMap!16119)

(declare-fun bm!50511 () Bool)

(declare-fun +!3507 (ListLongMap!16119 tuple2!18150) ListLongMap!16119)

(assert (=> bm!50511 (= call!50515 (+!3507 (ite c!111587 lt!506785 lt!506776) (ite c!111587 (tuple2!18151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111592 (tuple2!18151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1138918 () Bool)

(declare-fun e!648025 () Bool)

(declare-fun tp_is_empty!28611 () Bool)

(assert (=> b!1138918 (= e!648025 tp_is_empty!28611)))

(declare-fun bm!50512 () Bool)

(declare-fun call!50514 () Unit!37320)

(assert (=> bm!50512 (= call!50519 call!50514)))

(declare-fun mapNonEmpty!44741 () Bool)

(declare-fun mapRes!44741 () Bool)

(declare-fun tp!84953 () Bool)

(assert (=> mapNonEmpty!44741 (= mapRes!44741 (and tp!84953 e!648025))))

(declare-datatypes ((ValueCell!13596 0))(
  ( (ValueCellFull!13596 (v!16999 V!43275)) (EmptyCell!13596) )
))
(declare-fun mapValue!44741 () ValueCell!13596)

(declare-fun mapRest!44741 () (Array (_ BitVec 32) ValueCell!13596))

(declare-datatypes ((array!74083 0))(
  ( (array!74084 (arr!35692 (Array (_ BitVec 32) ValueCell!13596)) (size!36228 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74083)

(declare-fun mapKey!44741 () (_ BitVec 32))

(assert (=> mapNonEmpty!44741 (= (arr!35692 _values!996) (store mapRest!44741 mapKey!44741 mapValue!44741))))

(declare-fun bm!50513 () Bool)

(declare-fun call!50518 () ListLongMap!16119)

(assert (=> bm!50513 (= call!50518 call!50515)))

(declare-fun b!1138919 () Bool)

(declare-fun res!759669 () Bool)

(assert (=> b!1138919 (=> (not res!759669) (not e!648029))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1138919 (= res!759669 (= (select (arr!35691 _keys!1208) i!673) k0!934))))

(declare-fun b!1138920 () Bool)

(declare-fun call!50521 () ListLongMap!16119)

(declare-fun e!648036 () Bool)

(declare-fun call!50517 () ListLongMap!16119)

(declare-fun -!1226 (ListLongMap!16119 (_ BitVec 64)) ListLongMap!16119)

(assert (=> b!1138920 (= e!648036 (= call!50517 (-!1226 call!50521 k0!934)))))

(declare-fun b!1138921 () Bool)

(declare-fun e!648033 () Bool)

(assert (=> b!1138921 (= e!648033 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506790) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138922 () Bool)

(assert (=> b!1138922 call!50516))

(declare-fun lt!506789 () Unit!37320)

(assert (=> b!1138922 (= lt!506789 call!50519)))

(assert (=> b!1138922 (= e!648039 lt!506789)))

(declare-fun b!1138923 () Bool)

(declare-fun e!648027 () Bool)

(assert (=> b!1138923 (= e!648029 e!648027)))

(declare-fun res!759673 () Bool)

(assert (=> b!1138923 (=> (not res!759673) (not e!648027))))

(declare-fun lt!506784 () array!74081)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74081 (_ BitVec 32)) Bool)

(assert (=> b!1138923 (= res!759673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506784 mask!1564))))

(assert (=> b!1138923 (= lt!506784 (array!74082 (store (arr!35691 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36227 _keys!1208)))))

(declare-fun bm!50514 () Bool)

(declare-fun addStillContains!767 (ListLongMap!16119 (_ BitVec 64) V!43275 (_ BitVec 64)) Unit!37320)

(assert (=> bm!50514 (= call!50514 (addStillContains!767 (ite c!111587 lt!506785 lt!506776) (ite c!111587 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111592 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111587 minValue!944 (ite c!111592 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1138913 () Bool)

(declare-fun contains!6611 (ListLongMap!16119 (_ BitVec 64)) Bool)

(assert (=> b!1138913 (contains!6611 call!50515 k0!934)))

(declare-fun lt!506777 () Unit!37320)

(assert (=> b!1138913 (= lt!506777 call!50514)))

(declare-fun call!50520 () Bool)

(assert (=> b!1138913 call!50520))

(assert (=> b!1138913 (= lt!506785 (+!3507 lt!506776 (tuple2!18151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506774 () Unit!37320)

(assert (=> b!1138913 (= lt!506774 (addStillContains!767 lt!506776 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1138913 (= e!648035 lt!506777)))

(declare-fun res!759666 () Bool)

(assert (=> start!98476 (=> (not res!759666) (not e!648029))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98476 (= res!759666 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36227 _keys!1208))))))

(assert (=> start!98476 e!648029))

(assert (=> start!98476 tp_is_empty!28611))

(declare-fun array_inv!27358 (array!74081) Bool)

(assert (=> start!98476 (array_inv!27358 _keys!1208)))

(assert (=> start!98476 true))

(assert (=> start!98476 tp!84954))

(declare-fun e!648028 () Bool)

(declare-fun array_inv!27359 (array!74083) Bool)

(assert (=> start!98476 (and (array_inv!27359 _values!996) e!648028)))

(declare-fun b!1138924 () Bool)

(declare-fun res!759671 () Bool)

(assert (=> b!1138924 (=> (not res!759671) (not e!648029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138924 (= res!759671 (validMask!0 mask!1564))))

(declare-fun b!1138925 () Bool)

(declare-fun e!648031 () Bool)

(assert (=> b!1138925 (= e!648031 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36227 _keys!1208))))))

(declare-fun lt!506781 () Unit!37320)

(declare-fun e!648034 () Unit!37320)

(assert (=> b!1138925 (= lt!506781 e!648034)))

(declare-fun c!111590 () Bool)

(assert (=> b!1138925 (= c!111590 (contains!6611 lt!506776 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4559 (array!74081 array!74083 (_ BitVec 32) (_ BitVec 32) V!43275 V!43275 (_ BitVec 32) Int) ListLongMap!16119)

(assert (=> b!1138925 (= lt!506776 (getCurrentListMapNoExtraKeys!4559 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138926 () Bool)

(declare-fun arrayContainsKey!0 (array!74081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138926 (= e!648033 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138927 () Bool)

(declare-fun res!759667 () Bool)

(assert (=> b!1138927 (=> (not res!759667) (not e!648029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138927 (= res!759667 (validKeyInArray!0 k0!934))))

(declare-fun b!1138928 () Bool)

(declare-fun e!648038 () Bool)

(assert (=> b!1138928 (= e!648038 e!648031)))

(declare-fun res!759664 () Bool)

(assert (=> b!1138928 (=> res!759664 e!648031)))

(assert (=> b!1138928 (= res!759664 (not (= (select (arr!35691 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138928 e!648036))

(declare-fun c!111589 () Bool)

(assert (=> b!1138928 (= c!111589 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506780 () Unit!37320)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 (array!74081 array!74083 (_ BitVec 32) (_ BitVec 32) V!43275 V!43275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37320)

(assert (=> b!1138928 (= lt!506780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138929 () Bool)

(declare-fun res!759674 () Bool)

(assert (=> b!1138929 (=> (not res!759674) (not e!648029))))

(declare-datatypes ((List!24907 0))(
  ( (Nil!24904) (Cons!24903 (h!26112 (_ BitVec 64)) (t!35980 List!24907)) )
))
(declare-fun arrayNoDuplicates!0 (array!74081 (_ BitVec 32) List!24907) Bool)

(assert (=> b!1138929 (= res!759674 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun b!1138930 () Bool)

(declare-fun e!648032 () Bool)

(assert (=> b!1138930 (= e!648032 e!648038)))

(declare-fun res!759665 () Bool)

(assert (=> b!1138930 (=> res!759665 e!648038)))

(assert (=> b!1138930 (= res!759665 (not (= from!1455 i!673)))))

(declare-fun lt!506782 () ListLongMap!16119)

(declare-fun lt!506786 () array!74083)

(assert (=> b!1138930 (= lt!506782 (getCurrentListMapNoExtraKeys!4559 lt!506784 lt!506786 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2608 (Int (_ BitVec 64)) V!43275)

(assert (=> b!1138930 (= lt!506786 (array!74084 (store (arr!35692 _values!996) i!673 (ValueCellFull!13596 (dynLambda!2608 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36228 _values!996)))))

(declare-fun lt!506783 () ListLongMap!16119)

(assert (=> b!1138930 (= lt!506783 (getCurrentListMapNoExtraKeys!4559 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138931 () Bool)

(assert (=> b!1138931 (= e!648036 (= call!50517 call!50521))))

(declare-fun b!1138932 () Bool)

(declare-fun res!759675 () Bool)

(assert (=> b!1138932 (=> (not res!759675) (not e!648029))))

(assert (=> b!1138932 (= res!759675 (and (= (size!36228 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36227 _keys!1208) (size!36228 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138933 () Bool)

(declare-fun Unit!37322 () Unit!37320)

(assert (=> b!1138933 (= e!648034 Unit!37322)))

(assert (=> b!1138933 (= lt!506790 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138933 (= c!111587 (and (not lt!506790) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506787 () Unit!37320)

(assert (=> b!1138933 (= lt!506787 e!648035)))

(declare-fun lt!506773 () Unit!37320)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!369 (array!74081 array!74083 (_ BitVec 32) (_ BitVec 32) V!43275 V!43275 (_ BitVec 64) (_ BitVec 32) Int) Unit!37320)

(assert (=> b!1138933 (= lt!506773 (lemmaListMapContainsThenArrayContainsFrom!369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111588 () Bool)

(assert (=> b!1138933 (= c!111588 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759672 () Bool)

(assert (=> b!1138933 (= res!759672 e!648033)))

(declare-fun e!648024 () Bool)

(assert (=> b!1138933 (=> (not res!759672) (not e!648024))))

(assert (=> b!1138933 e!648024))

(declare-fun lt!506775 () Unit!37320)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74081 (_ BitVec 32) (_ BitVec 32)) Unit!37320)

(assert (=> b!1138933 (= lt!506775 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138933 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24904)))

(declare-fun lt!506778 () Unit!37320)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74081 (_ BitVec 64) (_ BitVec 32) List!24907) Unit!37320)

(assert (=> b!1138933 (= lt!506778 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24904))))

(assert (=> b!1138933 false))

(declare-fun bm!50515 () Bool)

(assert (=> bm!50515 (= call!50517 (getCurrentListMapNoExtraKeys!4559 lt!506784 lt!506786 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50516 () Bool)

(assert (=> bm!50516 (= call!50520 (contains!6611 (ite c!111587 lt!506785 call!50518) k0!934))))

(declare-fun b!1138934 () Bool)

(declare-fun e!648026 () Bool)

(assert (=> b!1138934 (= e!648026 tp_is_empty!28611)))

(declare-fun bm!50517 () Bool)

(assert (=> bm!50517 (= call!50516 call!50520)))

(declare-fun b!1138935 () Bool)

(assert (=> b!1138935 (= e!648028 (and e!648026 mapRes!44741))))

(declare-fun condMapEmpty!44741 () Bool)

(declare-fun mapDefault!44741 () ValueCell!13596)

(assert (=> b!1138935 (= condMapEmpty!44741 (= (arr!35692 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13596)) mapDefault!44741)))))

(declare-fun b!1138936 () Bool)

(assert (=> b!1138936 (= e!648027 (not e!648032))))

(declare-fun res!759677 () Bool)

(assert (=> b!1138936 (=> res!759677 e!648032)))

(assert (=> b!1138936 (= res!759677 (bvsgt from!1455 i!673))))

(assert (=> b!1138936 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506788 () Unit!37320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74081 (_ BitVec 64) (_ BitVec 32)) Unit!37320)

(assert (=> b!1138936 (= lt!506788 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138937 () Bool)

(declare-fun Unit!37323 () Unit!37320)

(assert (=> b!1138937 (= e!648039 Unit!37323)))

(declare-fun b!1138938 () Bool)

(declare-fun Unit!37324 () Unit!37320)

(assert (=> b!1138938 (= e!648034 Unit!37324)))

(declare-fun bm!50518 () Bool)

(assert (=> bm!50518 (= call!50521 (getCurrentListMapNoExtraKeys!4559 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138939 () Bool)

(declare-fun res!759676 () Bool)

(assert (=> b!1138939 (=> (not res!759676) (not e!648027))))

(assert (=> b!1138939 (= res!759676 (arrayNoDuplicates!0 lt!506784 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun mapIsEmpty!44741 () Bool)

(assert (=> mapIsEmpty!44741 mapRes!44741))

(declare-fun b!1138940 () Bool)

(declare-fun res!759668 () Bool)

(assert (=> b!1138940 (=> (not res!759668) (not e!648029))))

(assert (=> b!1138940 (= res!759668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138941 () Bool)

(assert (=> b!1138941 (= e!648024 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98476 res!759666) b!1138924))

(assert (= (and b!1138924 res!759671) b!1138932))

(assert (= (and b!1138932 res!759675) b!1138940))

(assert (= (and b!1138940 res!759668) b!1138929))

(assert (= (and b!1138929 res!759674) b!1138916))

(assert (= (and b!1138916 res!759670) b!1138927))

(assert (= (and b!1138927 res!759667) b!1138919))

(assert (= (and b!1138919 res!759669) b!1138923))

(assert (= (and b!1138923 res!759673) b!1138939))

(assert (= (and b!1138939 res!759676) b!1138936))

(assert (= (and b!1138936 (not res!759677)) b!1138930))

(assert (= (and b!1138930 (not res!759665)) b!1138928))

(assert (= (and b!1138928 c!111589) b!1138920))

(assert (= (and b!1138928 (not c!111589)) b!1138931))

(assert (= (or b!1138920 b!1138931) bm!50515))

(assert (= (or b!1138920 b!1138931) bm!50518))

(assert (= (and b!1138928 (not res!759664)) b!1138925))

(assert (= (and b!1138925 c!111590) b!1138933))

(assert (= (and b!1138925 (not c!111590)) b!1138938))

(assert (= (and b!1138933 c!111587) b!1138913))

(assert (= (and b!1138933 (not c!111587)) b!1138914))

(assert (= (and b!1138914 c!111592) b!1138917))

(assert (= (and b!1138914 (not c!111592)) b!1138915))

(assert (= (and b!1138915 c!111591) b!1138922))

(assert (= (and b!1138915 (not c!111591)) b!1138937))

(assert (= (or b!1138917 b!1138922) bm!50512))

(assert (= (or b!1138917 b!1138922) bm!50513))

(assert (= (or b!1138917 b!1138922) bm!50517))

(assert (= (or b!1138913 bm!50517) bm!50516))

(assert (= (or b!1138913 bm!50512) bm!50514))

(assert (= (or b!1138913 bm!50513) bm!50511))

(assert (= (and b!1138933 c!111588) b!1138926))

(assert (= (and b!1138933 (not c!111588)) b!1138921))

(assert (= (and b!1138933 res!759672) b!1138941))

(assert (= (and b!1138935 condMapEmpty!44741) mapIsEmpty!44741))

(assert (= (and b!1138935 (not condMapEmpty!44741)) mapNonEmpty!44741))

(get-info :version)

(assert (= (and mapNonEmpty!44741 ((_ is ValueCellFull!13596) mapValue!44741)) b!1138918))

(assert (= (and b!1138935 ((_ is ValueCellFull!13596) mapDefault!44741)) b!1138934))

(assert (= start!98476 b!1138935))

(declare-fun b_lambda!19187 () Bool)

(assert (=> (not b_lambda!19187) (not b!1138930)))

(declare-fun t!35978 () Bool)

(declare-fun tb!8893 () Bool)

(assert (=> (and start!98476 (= defaultEntry!1004 defaultEntry!1004) t!35978) tb!8893))

(declare-fun result!18351 () Bool)

(assert (=> tb!8893 (= result!18351 tp_is_empty!28611)))

(assert (=> b!1138930 t!35978))

(declare-fun b_and!39013 () Bool)

(assert (= b_and!39011 (and (=> t!35978 result!18351) b_and!39013)))

(declare-fun m!1050653 () Bool)

(assert (=> bm!50511 m!1050653))

(declare-fun m!1050655 () Bool)

(assert (=> b!1138913 m!1050655))

(declare-fun m!1050657 () Bool)

(assert (=> b!1138913 m!1050657))

(declare-fun m!1050659 () Bool)

(assert (=> b!1138913 m!1050659))

(declare-fun m!1050661 () Bool)

(assert (=> b!1138930 m!1050661))

(declare-fun m!1050663 () Bool)

(assert (=> b!1138930 m!1050663))

(declare-fun m!1050665 () Bool)

(assert (=> b!1138930 m!1050665))

(declare-fun m!1050667 () Bool)

(assert (=> b!1138930 m!1050667))

(declare-fun m!1050669 () Bool)

(assert (=> b!1138940 m!1050669))

(declare-fun m!1050671 () Bool)

(assert (=> b!1138926 m!1050671))

(declare-fun m!1050673 () Bool)

(assert (=> bm!50518 m!1050673))

(declare-fun m!1050675 () Bool)

(assert (=> bm!50514 m!1050675))

(declare-fun m!1050677 () Bool)

(assert (=> b!1138925 m!1050677))

(assert (=> b!1138925 m!1050673))

(declare-fun m!1050679 () Bool)

(assert (=> b!1138919 m!1050679))

(declare-fun m!1050681 () Bool)

(assert (=> b!1138923 m!1050681))

(declare-fun m!1050683 () Bool)

(assert (=> b!1138923 m!1050683))

(declare-fun m!1050685 () Bool)

(assert (=> b!1138939 m!1050685))

(declare-fun m!1050687 () Bool)

(assert (=> b!1138928 m!1050687))

(declare-fun m!1050689 () Bool)

(assert (=> b!1138928 m!1050689))

(declare-fun m!1050691 () Bool)

(assert (=> b!1138936 m!1050691))

(declare-fun m!1050693 () Bool)

(assert (=> b!1138936 m!1050693))

(declare-fun m!1050695 () Bool)

(assert (=> b!1138920 m!1050695))

(declare-fun m!1050697 () Bool)

(assert (=> mapNonEmpty!44741 m!1050697))

(declare-fun m!1050699 () Bool)

(assert (=> b!1138929 m!1050699))

(declare-fun m!1050701 () Bool)

(assert (=> b!1138924 m!1050701))

(declare-fun m!1050703 () Bool)

(assert (=> b!1138927 m!1050703))

(declare-fun m!1050705 () Bool)

(assert (=> bm!50515 m!1050705))

(declare-fun m!1050707 () Bool)

(assert (=> bm!50516 m!1050707))

(declare-fun m!1050709 () Bool)

(assert (=> start!98476 m!1050709))

(declare-fun m!1050711 () Bool)

(assert (=> start!98476 m!1050711))

(declare-fun m!1050713 () Bool)

(assert (=> b!1138933 m!1050713))

(declare-fun m!1050715 () Bool)

(assert (=> b!1138933 m!1050715))

(declare-fun m!1050717 () Bool)

(assert (=> b!1138933 m!1050717))

(declare-fun m!1050719 () Bool)

(assert (=> b!1138933 m!1050719))

(assert (=> b!1138941 m!1050671))

(check-sat (not bm!50516) (not b!1138939) (not b!1138926) tp_is_empty!28611 (not mapNonEmpty!44741) (not b!1138927) (not b!1138929) (not b!1138925) (not b!1138933) (not b_next!24081) (not b_lambda!19187) (not bm!50518) (not b!1138920) b_and!39013 (not b!1138924) (not b!1138940) (not b!1138930) (not bm!50511) (not bm!50515) (not b!1138941) (not b!1138936) (not bm!50514) (not b!1138928) (not b!1138923) (not start!98476) (not b!1138913))
(check-sat b_and!39013 (not b_next!24081))
