; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98186 () Bool)

(assert start!98186)

(declare-fun b_free!23887 () Bool)

(declare-fun b_next!23887 () Bool)

(assert (=> start!98186 (= b_free!23887 (not b_next!23887))))

(declare-fun tp!84365 () Bool)

(declare-fun b_and!38557 () Bool)

(assert (=> start!98186 (= tp!84365 b_and!38557)))

(declare-fun b!1129676 () Bool)

(declare-fun res!754881 () Bool)

(declare-fun e!642922 () Bool)

(assert (=> b!1129676 (=> (not res!754881) (not e!642922))))

(declare-datatypes ((array!73691 0))(
  ( (array!73692 (arr!35498 (Array (_ BitVec 32) (_ BitVec 64))) (size!36034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73691)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73691 (_ BitVec 32)) Bool)

(assert (=> b!1129676 (= res!754881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129677 () Bool)

(declare-fun res!754887 () Bool)

(assert (=> b!1129677 (=> (not res!754887) (not e!642922))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1129677 (= res!754887 (= (select (arr!35498 _keys!1208) i!673) k!934))))

(declare-fun b!1129678 () Bool)

(declare-fun res!754882 () Bool)

(declare-fun e!642920 () Bool)

(assert (=> b!1129678 (=> (not res!754882) (not e!642920))))

(declare-fun lt!501569 () array!73691)

(declare-datatypes ((List!24730 0))(
  ( (Nil!24727) (Cons!24726 (h!25935 (_ BitVec 64)) (t!35609 List!24730)) )
))
(declare-fun arrayNoDuplicates!0 (array!73691 (_ BitVec 32) List!24730) Bool)

(assert (=> b!1129678 (= res!754882 (arrayNoDuplicates!0 lt!501569 #b00000000000000000000000000000000 Nil!24727))))

(declare-fun b!1129679 () Bool)

(declare-fun e!642925 () Bool)

(declare-fun e!642923 () Bool)

(assert (=> b!1129679 (= e!642925 e!642923)))

(declare-fun res!754876 () Bool)

(assert (=> b!1129679 (=> res!754876 e!642923)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129679 (= res!754876 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43017 0))(
  ( (V!43018 (val!14265 Int)) )
))
(declare-fun zeroValue!944 () V!43017)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13499 0))(
  ( (ValueCellFull!13499 (v!16898 V!43017)) (EmptyCell!13499) )
))
(declare-datatypes ((array!73693 0))(
  ( (array!73694 (arr!35499 (Array (_ BitVec 32) ValueCell!13499)) (size!36035 (_ BitVec 32))) )
))
(declare-fun lt!501571 () array!73693)

(declare-datatypes ((tuple2!17964 0))(
  ( (tuple2!17965 (_1!8993 (_ BitVec 64)) (_2!8993 V!43017)) )
))
(declare-datatypes ((List!24731 0))(
  ( (Nil!24728) (Cons!24727 (h!25936 tuple2!17964) (t!35610 List!24731)) )
))
(declare-datatypes ((ListLongMap!15933 0))(
  ( (ListLongMap!15934 (toList!7982 List!24731)) )
))
(declare-fun lt!501566 () ListLongMap!15933)

(declare-fun minValue!944 () V!43017)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4469 (array!73691 array!73693 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) Int) ListLongMap!15933)

(assert (=> b!1129679 (= lt!501566 (getCurrentListMapNoExtraKeys!4469 lt!501569 lt!501571 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73693)

(declare-fun dynLambda!2547 (Int (_ BitVec 64)) V!43017)

(assert (=> b!1129679 (= lt!501571 (array!73694 (store (arr!35499 _values!996) i!673 (ValueCellFull!13499 (dynLambda!2547 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36035 _values!996)))))

(declare-fun lt!501567 () ListLongMap!15933)

(assert (=> b!1129679 (= lt!501567 (getCurrentListMapNoExtraKeys!4469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129680 () Bool)

(declare-fun res!754886 () Bool)

(assert (=> b!1129680 (=> (not res!754886) (not e!642922))))

(assert (=> b!1129680 (= res!754886 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24727))))

(declare-fun bm!48114 () Bool)

(declare-datatypes ((Unit!37009 0))(
  ( (Unit!37010) )
))
(declare-fun call!48119 () Unit!37009)

(declare-fun call!48121 () Unit!37009)

(assert (=> bm!48114 (= call!48119 call!48121)))

(declare-fun b!1129681 () Bool)

(declare-fun e!642916 () Bool)

(assert (=> b!1129681 (= e!642923 e!642916)))

(declare-fun res!754879 () Bool)

(assert (=> b!1129681 (=> res!754879 e!642916)))

(assert (=> b!1129681 (= res!754879 (not (= (select (arr!35498 _keys!1208) from!1455) k!934)))))

(declare-fun e!642924 () Bool)

(assert (=> b!1129681 e!642924))

(declare-fun c!109911 () Bool)

(assert (=> b!1129681 (= c!109911 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501559 () Unit!37009)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 (array!73691 array!73693 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37009)

(assert (=> b!1129681 (= lt!501559 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48117 () ListLongMap!15933)

(declare-fun c!109908 () Bool)

(declare-fun c!109910 () Bool)

(declare-fun bm!48115 () Bool)

(declare-fun lt!501564 () ListLongMap!15933)

(declare-fun +!3433 (ListLongMap!15933 tuple2!17964) ListLongMap!15933)

(assert (=> bm!48115 (= call!48117 (+!3433 lt!501564 (ite (or c!109910 c!109908) (tuple2!17965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129682 () Bool)

(declare-fun e!642927 () Unit!37009)

(declare-fun e!642915 () Unit!37009)

(assert (=> b!1129682 (= e!642927 e!642915)))

(declare-fun lt!501562 () Bool)

(assert (=> b!1129682 (= c!109908 (and (not lt!501562) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44443 () Bool)

(declare-fun mapRes!44443 () Bool)

(declare-fun tp!84364 () Bool)

(declare-fun e!642913 () Bool)

(assert (=> mapNonEmpty!44443 (= mapRes!44443 (and tp!84364 e!642913))))

(declare-fun mapValue!44443 () ValueCell!13499)

(declare-fun mapRest!44443 () (Array (_ BitVec 32) ValueCell!13499))

(declare-fun mapKey!44443 () (_ BitVec 32))

(assert (=> mapNonEmpty!44443 (= (arr!35499 _values!996) (store mapRest!44443 mapKey!44443 mapValue!44443))))

(declare-fun res!754884 () Bool)

(assert (=> start!98186 (=> (not res!754884) (not e!642922))))

(assert (=> start!98186 (= res!754884 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36034 _keys!1208))))))

(assert (=> start!98186 e!642922))

(declare-fun tp_is_empty!28417 () Bool)

(assert (=> start!98186 tp_is_empty!28417))

(declare-fun array_inv!27232 (array!73691) Bool)

(assert (=> start!98186 (array_inv!27232 _keys!1208)))

(assert (=> start!98186 true))

(assert (=> start!98186 tp!84365))

(declare-fun e!642914 () Bool)

(declare-fun array_inv!27233 (array!73693) Bool)

(assert (=> start!98186 (and (array_inv!27233 _values!996) e!642914)))

(declare-fun b!1129683 () Bool)

(assert (=> b!1129683 (= e!642913 tp_is_empty!28417)))

(declare-fun b!1129684 () Bool)

(declare-fun e!642926 () Bool)

(assert (=> b!1129684 (= e!642916 e!642926)))

(declare-fun res!754877 () Bool)

(assert (=> b!1129684 (=> res!754877 e!642926)))

(declare-fun contains!6505 (ListLongMap!15933 (_ BitVec 64)) Bool)

(assert (=> b!1129684 (= res!754877 (not (contains!6505 lt!501564 k!934)))))

(assert (=> b!1129684 (= lt!501564 (getCurrentListMapNoExtraKeys!4469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48122 () Bool)

(declare-fun bm!48116 () Bool)

(declare-fun lt!501563 () ListLongMap!15933)

(declare-fun call!48120 () ListLongMap!15933)

(assert (=> bm!48116 (= call!48122 (contains!6505 (ite c!109910 lt!501563 call!48120) k!934))))

(declare-fun bm!48117 () Bool)

(declare-fun addStillContains!696 (ListLongMap!15933 (_ BitVec 64) V!43017 (_ BitVec 64)) Unit!37009)

(assert (=> bm!48117 (= call!48121 (addStillContains!696 (ite c!109910 lt!501563 lt!501564) (ite c!109910 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109908 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109910 minValue!944 (ite c!109908 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1129685 () Bool)

(assert (=> b!1129685 (= e!642922 e!642920)))

(declare-fun res!754888 () Bool)

(assert (=> b!1129685 (=> (not res!754888) (not e!642920))))

(assert (=> b!1129685 (= res!754888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501569 mask!1564))))

(assert (=> b!1129685 (= lt!501569 (array!73692 (store (arr!35498 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36034 _keys!1208)))))

(declare-fun b!1129686 () Bool)

(declare-fun e!642921 () Unit!37009)

(declare-fun Unit!37011 () Unit!37009)

(assert (=> b!1129686 (= e!642921 Unit!37011)))

(declare-fun bm!48118 () Bool)

(assert (=> bm!48118 (= call!48120 call!48117)))

(declare-fun b!1129687 () Bool)

(declare-fun lt!501560 () Unit!37009)

(assert (=> b!1129687 (= e!642927 lt!501560)))

(declare-fun lt!501561 () Unit!37009)

(assert (=> b!1129687 (= lt!501561 (addStillContains!696 lt!501564 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1129687 (= lt!501563 call!48117)))

(assert (=> b!1129687 call!48122))

(assert (=> b!1129687 (= lt!501560 call!48121)))

(assert (=> b!1129687 (contains!6505 (+!3433 lt!501563 (tuple2!17965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1129688 () Bool)

(declare-fun res!754880 () Bool)

(assert (=> b!1129688 (=> (not res!754880) (not e!642922))))

(assert (=> b!1129688 (= res!754880 (and (= (size!36035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36034 _keys!1208) (size!36035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48119 () Bool)

(declare-fun call!48118 () Bool)

(assert (=> bm!48119 (= call!48118 call!48122)))

(declare-fun b!1129689 () Bool)

(declare-fun res!754878 () Bool)

(assert (=> b!1129689 (=> (not res!754878) (not e!642922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129689 (= res!754878 (validKeyInArray!0 k!934))))

(declare-fun b!1129690 () Bool)

(declare-fun call!48123 () ListLongMap!15933)

(declare-fun call!48124 () ListLongMap!15933)

(declare-fun -!1163 (ListLongMap!15933 (_ BitVec 64)) ListLongMap!15933)

(assert (=> b!1129690 (= e!642924 (= call!48124 (-!1163 call!48123 k!934)))))

(declare-fun b!1129691 () Bool)

(declare-fun lt!501568 () Unit!37009)

(assert (=> b!1129691 (= e!642921 lt!501568)))

(assert (=> b!1129691 (= lt!501568 call!48119)))

(assert (=> b!1129691 call!48118))

(declare-fun b!1129692 () Bool)

(assert (=> b!1129692 (= e!642920 (not e!642925))))

(declare-fun res!754875 () Bool)

(assert (=> b!1129692 (=> res!754875 e!642925)))

(assert (=> b!1129692 (= res!754875 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129692 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501565 () Unit!37009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73691 (_ BitVec 64) (_ BitVec 32)) Unit!37009)

(assert (=> b!1129692 (= lt!501565 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!44443 () Bool)

(assert (=> mapIsEmpty!44443 mapRes!44443))

(declare-fun b!1129693 () Bool)

(declare-fun e!642917 () Bool)

(assert (=> b!1129693 (= e!642917 tp_is_empty!28417)))

(declare-fun b!1129694 () Bool)

(declare-fun c!109909 () Bool)

(assert (=> b!1129694 (= c!109909 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501562))))

(assert (=> b!1129694 (= e!642915 e!642921)))

(declare-fun b!1129695 () Bool)

(declare-fun res!754874 () Bool)

(assert (=> b!1129695 (=> (not res!754874) (not e!642922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129695 (= res!754874 (validMask!0 mask!1564))))

(declare-fun b!1129696 () Bool)

(declare-fun e!642919 () Bool)

(assert (=> b!1129696 (= e!642926 e!642919)))

(declare-fun res!754885 () Bool)

(assert (=> b!1129696 (=> res!754885 e!642919)))

(assert (=> b!1129696 (= res!754885 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36034 _keys!1208))))))

(declare-fun lt!501572 () Unit!37009)

(assert (=> b!1129696 (= lt!501572 e!642927)))

(assert (=> b!1129696 (= c!109910 (and (not lt!501562) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129696 (= lt!501562 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129697 () Bool)

(declare-fun res!754883 () Bool)

(assert (=> b!1129697 (=> (not res!754883) (not e!642922))))

(assert (=> b!1129697 (= res!754883 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36034 _keys!1208))))))

(declare-fun b!1129698 () Bool)

(assert (=> b!1129698 (= e!642914 (and e!642917 mapRes!44443))))

(declare-fun condMapEmpty!44443 () Bool)

(declare-fun mapDefault!44443 () ValueCell!13499)

