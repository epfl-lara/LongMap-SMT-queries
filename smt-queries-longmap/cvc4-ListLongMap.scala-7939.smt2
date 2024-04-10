; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98478 () Bool)

(assert start!98478)

(declare-fun b_free!24083 () Bool)

(declare-fun b_next!24083 () Bool)

(assert (=> start!98478 (= b_free!24083 (not b_next!24083))))

(declare-fun tp!84960 () Bool)

(declare-fun b_and!39015 () Bool)

(assert (=> start!98478 (= tp!84960 b_and!39015)))

(declare-fun b!1139002 () Bool)

(declare-datatypes ((Unit!37325 0))(
  ( (Unit!37326) )
))
(declare-fun e!648076 () Unit!37325)

(declare-fun Unit!37327 () Unit!37325)

(assert (=> b!1139002 (= e!648076 Unit!37327)))

(declare-fun b!1139003 () Bool)

(declare-fun res!759714 () Bool)

(declare-fun e!648086 () Bool)

(assert (=> b!1139003 (=> (not res!759714) (not e!648086))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74085 0))(
  ( (array!74086 (arr!35693 (Array (_ BitVec 32) (_ BitVec 64))) (size!36229 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74085)

(assert (=> b!1139003 (= res!759714 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36229 _keys!1208))))))

(declare-datatypes ((V!43277 0))(
  ( (V!43278 (val!14363 Int)) )
))
(declare-fun zeroValue!944 () V!43277)

(declare-fun c!111610 () Bool)

(declare-fun minValue!944 () V!43277)

(declare-fun bm!50535 () Bool)

(declare-fun call!50540 () Unit!37325)

(declare-datatypes ((tuple2!18152 0))(
  ( (tuple2!18153 (_1!9087 (_ BitVec 64)) (_2!9087 V!43277)) )
))
(declare-datatypes ((List!24908 0))(
  ( (Nil!24905) (Cons!24904 (h!26113 tuple2!18152) (t!35983 List!24908)) )
))
(declare-datatypes ((ListLongMap!16121 0))(
  ( (ListLongMap!16122 (toList!8076 List!24908)) )
))
(declare-fun lt!506835 () ListLongMap!16121)

(declare-fun lt!506828 () ListLongMap!16121)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!111606 () Bool)

(declare-fun addStillContains!768 (ListLongMap!16121 (_ BitVec 64) V!43277 (_ BitVec 64)) Unit!37325)

(assert (=> bm!50535 (= call!50540 (addStillContains!768 (ite c!111610 lt!506828 lt!506835) (ite c!111610 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111606 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111610 minValue!944 (ite c!111606 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1139004 () Bool)

(declare-fun call!50544 () ListLongMap!16121)

(declare-fun e!648074 () Bool)

(declare-fun call!50539 () ListLongMap!16121)

(declare-fun -!1227 (ListLongMap!16121 (_ BitVec 64)) ListLongMap!16121)

(assert (=> b!1139004 (= e!648074 (= call!50544 (-!1227 call!50539 k!934)))))

(declare-fun mapNonEmpty!44744 () Bool)

(declare-fun mapRes!44744 () Bool)

(declare-fun tp!84959 () Bool)

(declare-fun e!648087 () Bool)

(assert (=> mapNonEmpty!44744 (= mapRes!44744 (and tp!84959 e!648087))))

(declare-datatypes ((ValueCell!13597 0))(
  ( (ValueCellFull!13597 (v!17000 V!43277)) (EmptyCell!13597) )
))
(declare-fun mapValue!44744 () ValueCell!13597)

(declare-fun mapRest!44744 () (Array (_ BitVec 32) ValueCell!13597))

(declare-fun mapKey!44744 () (_ BitVec 32))

(declare-datatypes ((array!74087 0))(
  ( (array!74088 (arr!35694 (Array (_ BitVec 32) ValueCell!13597)) (size!36230 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74087)

(assert (=> mapNonEmpty!44744 (= (arr!35694 _values!996) (store mapRest!44744 mapKey!44744 mapValue!44744))))

(declare-fun call!50545 () Bool)

(declare-fun bm!50536 () Bool)

(declare-fun call!50538 () ListLongMap!16121)

(declare-fun contains!6612 (ListLongMap!16121 (_ BitVec 64)) Bool)

(assert (=> bm!50536 (= call!50545 (contains!6612 (ite c!111610 lt!506828 call!50538) k!934))))

(declare-fun bm!50537 () Bool)

(declare-fun call!50542 () ListLongMap!16121)

(assert (=> bm!50537 (= call!50538 call!50542)))

(declare-fun b!1139005 () Bool)

(declare-fun e!648080 () Unit!37325)

(declare-fun lt!506831 () Unit!37325)

(assert (=> b!1139005 (= e!648080 lt!506831)))

(declare-fun call!50543 () Unit!37325)

(assert (=> b!1139005 (= lt!506831 call!50543)))

(declare-fun call!50541 () Bool)

(assert (=> b!1139005 call!50541))

(declare-fun b!1139006 () Bool)

(declare-fun res!759716 () Bool)

(assert (=> b!1139006 (=> (not res!759716) (not e!648086))))

(declare-datatypes ((List!24909 0))(
  ( (Nil!24906) (Cons!24905 (h!26114 (_ BitVec 64)) (t!35984 List!24909)) )
))
(declare-fun arrayNoDuplicates!0 (array!74085 (_ BitVec 32) List!24909) Bool)

(assert (=> b!1139006 (= res!759716 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24906))))

(declare-fun bm!50538 () Bool)

(assert (=> bm!50538 (= call!50543 call!50540)))

(declare-fun b!1139007 () Bool)

(declare-fun e!648084 () Bool)

(declare-fun e!648077 () Bool)

(assert (=> b!1139007 (= e!648084 (not e!648077))))

(declare-fun res!759706 () Bool)

(assert (=> b!1139007 (=> res!759706 e!648077)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139007 (= res!759706 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139007 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506836 () Unit!37325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74085 (_ BitVec 64) (_ BitVec 32)) Unit!37325)

(assert (=> b!1139007 (= lt!506836 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun e!648079 () Bool)

(declare-fun b!1139008 () Bool)

(assert (=> b!1139008 (= e!648079 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44744 () Bool)

(assert (=> mapIsEmpty!44744 mapRes!44744))

(declare-fun res!759713 () Bool)

(assert (=> start!98478 (=> (not res!759713) (not e!648086))))

(assert (=> start!98478 (= res!759713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36229 _keys!1208))))))

(assert (=> start!98478 e!648086))

(declare-fun tp_is_empty!28613 () Bool)

(assert (=> start!98478 tp_is_empty!28613))

(declare-fun array_inv!27360 (array!74085) Bool)

(assert (=> start!98478 (array_inv!27360 _keys!1208)))

(assert (=> start!98478 true))

(assert (=> start!98478 tp!84960))

(declare-fun e!648083 () Bool)

(declare-fun array_inv!27361 (array!74087) Bool)

(assert (=> start!98478 (and (array_inv!27361 _values!996) e!648083)))

(declare-fun b!1139009 () Bool)

(declare-fun e!648075 () Unit!37325)

(declare-fun Unit!37328 () Unit!37325)

(assert (=> b!1139009 (= e!648075 Unit!37328)))

(declare-fun bm!50539 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!506839 () array!74087)

(declare-fun lt!506829 () array!74085)

(declare-fun getCurrentListMapNoExtraKeys!4560 (array!74085 array!74087 (_ BitVec 32) (_ BitVec 32) V!43277 V!43277 (_ BitVec 32) Int) ListLongMap!16121)

(assert (=> bm!50539 (= call!50544 (getCurrentListMapNoExtraKeys!4560 lt!506829 lt!506839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139010 () Bool)

(declare-fun res!759715 () Bool)

(assert (=> b!1139010 (=> (not res!759715) (not e!648086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74085 (_ BitVec 32)) Bool)

(assert (=> b!1139010 (= res!759715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139011 () Bool)

(assert (=> b!1139011 (= e!648080 e!648076)))

(declare-fun c!111607 () Bool)

(declare-fun lt!506843 () Bool)

(assert (=> b!1139011 (= c!111607 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506843))))

(declare-fun e!648073 () Bool)

(declare-fun b!1139012 () Bool)

(assert (=> b!1139012 (= e!648073 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506843) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139013 () Bool)

(declare-fun +!3508 (ListLongMap!16121 tuple2!18152) ListLongMap!16121)

(assert (=> b!1139013 (contains!6612 (+!3508 lt!506828 (tuple2!18153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!506827 () Unit!37325)

(assert (=> b!1139013 (= lt!506827 call!50540)))

(assert (=> b!1139013 call!50545))

(assert (=> b!1139013 (= lt!506828 call!50542)))

(declare-fun lt!506832 () Unit!37325)

(assert (=> b!1139013 (= lt!506832 (addStillContains!768 lt!506835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!648085 () Unit!37325)

(assert (=> b!1139013 (= e!648085 lt!506827)))

(declare-fun bm!50540 () Bool)

(assert (=> bm!50540 (= call!50539 (getCurrentListMapNoExtraKeys!4560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139014 () Bool)

(declare-fun res!759708 () Bool)

(assert (=> b!1139014 (=> (not res!759708) (not e!648086))))

(assert (=> b!1139014 (= res!759708 (= (select (arr!35693 _keys!1208) i!673) k!934))))

(declare-fun b!1139015 () Bool)

(declare-fun e!648078 () Bool)

(assert (=> b!1139015 (= e!648077 e!648078)))

(declare-fun res!759717 () Bool)

(assert (=> b!1139015 (=> res!759717 e!648078)))

(assert (=> b!1139015 (= res!759717 (not (= from!1455 i!673)))))

(declare-fun lt!506840 () ListLongMap!16121)

(assert (=> b!1139015 (= lt!506840 (getCurrentListMapNoExtraKeys!4560 lt!506829 lt!506839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2609 (Int (_ BitVec 64)) V!43277)

(assert (=> b!1139015 (= lt!506839 (array!74088 (store (arr!35694 _values!996) i!673 (ValueCellFull!13597 (dynLambda!2609 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36230 _values!996)))))

(declare-fun lt!506833 () ListLongMap!16121)

(assert (=> b!1139015 (= lt!506833 (getCurrentListMapNoExtraKeys!4560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139016 () Bool)

(declare-fun res!759718 () Bool)

(assert (=> b!1139016 (=> (not res!759718) (not e!648086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139016 (= res!759718 (validMask!0 mask!1564))))

(declare-fun b!1139017 () Bool)

(assert (=> b!1139017 (= c!111606 (and (not lt!506843) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139017 (= e!648085 e!648080)))

(declare-fun bm!50541 () Bool)

(assert (=> bm!50541 (= call!50542 (+!3508 lt!506835 (ite (or c!111610 c!111606) (tuple2!18153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139018 () Bool)

(assert (=> b!1139018 call!50541))

(declare-fun lt!506838 () Unit!37325)

(assert (=> b!1139018 (= lt!506838 call!50543)))

(assert (=> b!1139018 (= e!648076 lt!506838)))

(declare-fun b!1139019 () Bool)

(assert (=> b!1139019 (= e!648074 (= call!50544 call!50539))))

(declare-fun b!1139020 () Bool)

(declare-fun e!648072 () Bool)

(assert (=> b!1139020 (= e!648072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36229 _keys!1208))))))

(declare-fun lt!506834 () Unit!37325)

(assert (=> b!1139020 (= lt!506834 e!648075)))

(declare-fun c!111605 () Bool)

(assert (=> b!1139020 (= c!111605 (contains!6612 lt!506835 k!934))))

(assert (=> b!1139020 (= lt!506835 (getCurrentListMapNoExtraKeys!4560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139021 () Bool)

(assert (=> b!1139021 (= e!648086 e!648084)))

(declare-fun res!759711 () Bool)

(assert (=> b!1139021 (=> (not res!759711) (not e!648084))))

(assert (=> b!1139021 (= res!759711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506829 mask!1564))))

(assert (=> b!1139021 (= lt!506829 (array!74086 (store (arr!35693 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36229 _keys!1208)))))

(declare-fun b!1139022 () Bool)

(declare-fun res!759710 () Bool)

(assert (=> b!1139022 (=> (not res!759710) (not e!648086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139022 (= res!759710 (validKeyInArray!0 k!934))))

(declare-fun b!1139023 () Bool)

(declare-fun res!759709 () Bool)

(assert (=> b!1139023 (=> (not res!759709) (not e!648084))))

(assert (=> b!1139023 (= res!759709 (arrayNoDuplicates!0 lt!506829 #b00000000000000000000000000000000 Nil!24906))))

(declare-fun bm!50542 () Bool)

(assert (=> bm!50542 (= call!50541 call!50545)))

(declare-fun b!1139024 () Bool)

(declare-fun e!648082 () Bool)

(assert (=> b!1139024 (= e!648083 (and e!648082 mapRes!44744))))

(declare-fun condMapEmpty!44744 () Bool)

(declare-fun mapDefault!44744 () ValueCell!13597)

