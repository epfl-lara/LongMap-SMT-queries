; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98238 () Bool)

(assert start!98238)

(declare-fun b_free!23939 () Bool)

(declare-fun b_next!23939 () Bool)

(assert (=> start!98238 (= b_free!23939 (not b_next!23939))))

(declare-fun tp!84520 () Bool)

(declare-fun b_and!38661 () Bool)

(assert (=> start!98238 (= tp!84520 b_and!38661)))

(declare-fun b!1131773 () Bool)

(declare-fun e!644084 () Bool)

(declare-fun e!644089 () Bool)

(assert (=> b!1131773 (= e!644084 e!644089)))

(declare-fun res!756027 () Bool)

(assert (=> b!1131773 (=> (not res!756027) (not e!644089))))

(declare-datatypes ((array!73795 0))(
  ( (array!73796 (arr!35550 (Array (_ BitVec 32) (_ BitVec 64))) (size!36086 (_ BitVec 32))) )
))
(declare-fun lt!502737 () array!73795)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73795 (_ BitVec 32)) Bool)

(assert (=> b!1131773 (= res!756027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502737 mask!1564))))

(declare-fun _keys!1208 () array!73795)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131773 (= lt!502737 (array!73796 (store (arr!35550 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36086 _keys!1208)))))

(declare-fun b!1131774 () Bool)

(declare-fun e!644091 () Bool)

(declare-fun tp_is_empty!28469 () Bool)

(assert (=> b!1131774 (= e!644091 tp_is_empty!28469)))

(declare-fun e!644096 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1131775 () Bool)

(declare-fun arrayContainsKey!0 (array!73795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131775 (= e!644096 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43085 0))(
  ( (V!43086 (val!14291 Int)) )
))
(declare-fun zeroValue!944 () V!43085)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13525 0))(
  ( (ValueCellFull!13525 (v!16924 V!43085)) (EmptyCell!13525) )
))
(declare-datatypes ((array!73797 0))(
  ( (array!73798 (arr!35551 (Array (_ BitVec 32) ValueCell!13525)) (size!36087 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73797)

(declare-fun bm!48738 () Bool)

(declare-fun minValue!944 () V!43085)

(declare-datatypes ((tuple2!18016 0))(
  ( (tuple2!18017 (_1!9019 (_ BitVec 64)) (_2!9019 V!43085)) )
))
(declare-datatypes ((List!24779 0))(
  ( (Nil!24776) (Cons!24775 (h!25984 tuple2!18016) (t!35710 List!24779)) )
))
(declare-datatypes ((ListLongMap!15985 0))(
  ( (ListLongMap!15986 (toList!8008 List!24779)) )
))
(declare-fun call!48744 () ListLongMap!15985)

(declare-fun getCurrentListMapNoExtraKeys!4495 (array!73795 array!73797 (_ BitVec 32) (_ BitVec 32) V!43085 V!43085 (_ BitVec 32) Int) ListLongMap!15985)

(assert (=> bm!48738 (= call!48744 (getCurrentListMapNoExtraKeys!4495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502740 () ListLongMap!15985)

(declare-fun call!48746 () ListLongMap!15985)

(declare-fun call!48743 () Bool)

(declare-fun bm!48739 () Bool)

(declare-fun c!110238 () Bool)

(declare-fun contains!6530 (ListLongMap!15985 (_ BitVec 64)) Bool)

(assert (=> bm!48739 (= call!48743 (contains!6530 (ite c!110238 lt!502740 call!48746) k!934))))

(declare-fun bm!48740 () Bool)

(declare-datatypes ((Unit!37076 0))(
  ( (Unit!37077) )
))
(declare-fun call!48741 () Unit!37076)

(declare-fun call!48748 () Unit!37076)

(assert (=> bm!48740 (= call!48741 call!48748)))

(declare-fun b!1131776 () Bool)

(declare-fun e!644086 () Bool)

(assert (=> b!1131776 (= e!644086 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36086 _keys!1208))))))

(assert (=> b!1131776 e!644096))

(declare-fun c!110237 () Bool)

(assert (=> b!1131776 (= c!110237 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502733 () Unit!37076)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!324 (array!73795 array!73797 (_ BitVec 32) (_ BitVec 32) V!43085 V!43085 (_ BitVec 64) (_ BitVec 32) Int) Unit!37076)

(assert (=> b!1131776 (= lt!502733 (lemmaListMapContainsThenArrayContainsFrom!324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502742 () Unit!37076)

(declare-fun e!644093 () Unit!37076)

(assert (=> b!1131776 (= lt!502742 e!644093)))

(declare-fun lt!502728 () Bool)

(assert (=> b!1131776 (= c!110238 (and (not lt!502728) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131776 (= lt!502728 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131777 () Bool)

(declare-fun e!644094 () Unit!37076)

(declare-fun Unit!37078 () Unit!37076)

(assert (=> b!1131777 (= e!644094 Unit!37078)))

(declare-fun b!1131778 () Bool)

(declare-fun e!644087 () Bool)

(declare-fun call!48747 () ListLongMap!15985)

(assert (=> b!1131778 (= e!644087 (= call!48747 call!48744))))

(declare-fun b!1131779 () Bool)

(assert (=> b!1131779 (= e!644096 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502728) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131780 () Bool)

(declare-fun res!756031 () Bool)

(assert (=> b!1131780 (=> (not res!756031) (not e!644084))))

(assert (=> b!1131780 (= res!756031 (= (select (arr!35550 _keys!1208) i!673) k!934))))

(declare-fun lt!502739 () array!73797)

(declare-fun bm!48741 () Bool)

(assert (=> bm!48741 (= call!48747 (getCurrentListMapNoExtraKeys!4495 lt!502737 lt!502739 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48742 () Bool)

(declare-fun call!48742 () ListLongMap!15985)

(assert (=> bm!48742 (= call!48746 call!48742)))

(declare-fun b!1131781 () Bool)

(declare-fun e!644095 () Bool)

(declare-fun e!644085 () Bool)

(assert (=> b!1131781 (= e!644095 e!644085)))

(declare-fun res!756033 () Bool)

(assert (=> b!1131781 (=> res!756033 e!644085)))

(assert (=> b!1131781 (= res!756033 (not (= from!1455 i!673)))))

(declare-fun lt!502736 () ListLongMap!15985)

(assert (=> b!1131781 (= lt!502736 (getCurrentListMapNoExtraKeys!4495 lt!502737 lt!502739 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2565 (Int (_ BitVec 64)) V!43085)

(assert (=> b!1131781 (= lt!502739 (array!73798 (store (arr!35551 _values!996) i!673 (ValueCellFull!13525 (dynLambda!2565 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36087 _values!996)))))

(declare-fun lt!502732 () ListLongMap!15985)

(assert (=> b!1131781 (= lt!502732 (getCurrentListMapNoExtraKeys!4495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131782 () Bool)

(declare-fun res!756040 () Bool)

(assert (=> b!1131782 (=> (not res!756040) (not e!644084))))

(assert (=> b!1131782 (= res!756040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131783 () Bool)

(declare-fun lt!502734 () Unit!37076)

(assert (=> b!1131783 (= e!644094 lt!502734)))

(assert (=> b!1131783 (= lt!502734 call!48741)))

(declare-fun call!48745 () Bool)

(assert (=> b!1131783 call!48745))

(declare-fun mapIsEmpty!44521 () Bool)

(declare-fun mapRes!44521 () Bool)

(assert (=> mapIsEmpty!44521 mapRes!44521))

(declare-fun b!1131784 () Bool)

(declare-fun -!1180 (ListLongMap!15985 (_ BitVec 64)) ListLongMap!15985)

(assert (=> b!1131784 (= e!644087 (= call!48747 (-!1180 call!48744 k!934)))))

(declare-fun b!1131785 () Bool)

(declare-fun c!110240 () Bool)

(assert (=> b!1131785 (= c!110240 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502728))))

(declare-fun e!644083 () Unit!37076)

(assert (=> b!1131785 (= e!644083 e!644094)))

(declare-fun b!1131786 () Bool)

(declare-fun e!644088 () Bool)

(assert (=> b!1131786 (= e!644085 e!644088)))

(declare-fun res!756030 () Bool)

(assert (=> b!1131786 (=> res!756030 e!644088)))

(assert (=> b!1131786 (= res!756030 (not (= (select (arr!35550 _keys!1208) from!1455) k!934)))))

(assert (=> b!1131786 e!644087))

(declare-fun c!110241 () Bool)

(assert (=> b!1131786 (= c!110241 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502738 () Unit!37076)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!434 (array!73795 array!73797 (_ BitVec 32) (_ BitVec 32) V!43085 V!43085 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37076)

(assert (=> b!1131786 (= lt!502738 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110239 () Bool)

(declare-fun bm!48743 () Bool)

(declare-fun lt!502731 () ListLongMap!15985)

(declare-fun +!3452 (ListLongMap!15985 tuple2!18016) ListLongMap!15985)

(assert (=> bm!48743 (= call!48742 (+!3452 lt!502731 (ite (or c!110238 c!110239) (tuple2!18017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18017 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131787 () Bool)

(declare-fun res!756037 () Bool)

(assert (=> b!1131787 (=> (not res!756037) (not e!644084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131787 (= res!756037 (validMask!0 mask!1564))))

(declare-fun b!1131788 () Bool)

(declare-fun res!756032 () Bool)

(assert (=> b!1131788 (=> (not res!756032) (not e!644089))))

(declare-datatypes ((List!24780 0))(
  ( (Nil!24777) (Cons!24776 (h!25985 (_ BitVec 64)) (t!35711 List!24780)) )
))
(declare-fun arrayNoDuplicates!0 (array!73795 (_ BitVec 32) List!24780) Bool)

(assert (=> b!1131788 (= res!756032 (arrayNoDuplicates!0 lt!502737 #b00000000000000000000000000000000 Nil!24777))))

(declare-fun b!1131789 () Bool)

(declare-fun e!644097 () Bool)

(declare-fun e!644092 () Bool)

(assert (=> b!1131789 (= e!644097 (and e!644092 mapRes!44521))))

(declare-fun condMapEmpty!44521 () Bool)

(declare-fun mapDefault!44521 () ValueCell!13525)

