; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98360 () Bool)

(assert start!98360)

(declare-fun b_free!23965 () Bool)

(declare-fun b_next!23965 () Bool)

(assert (=> start!98360 (= b_free!23965 (not b_next!23965))))

(declare-fun tp!84605 () Bool)

(declare-fun b_and!38779 () Bool)

(assert (=> start!98360 (= tp!84605 b_and!38779)))

(declare-fun b!1133605 () Bool)

(declare-datatypes ((Unit!37145 0))(
  ( (Unit!37146) )
))
(declare-fun e!645168 () Unit!37145)

(declare-fun Unit!37147 () Unit!37145)

(assert (=> b!1133605 (= e!645168 Unit!37147)))

(declare-fun b!1133606 () Bool)

(declare-fun e!645165 () Bool)

(assert (=> b!1133606 (= e!645165 true)))

(declare-fun e!645163 () Bool)

(assert (=> b!1133606 e!645163))

(declare-fun res!756899 () Bool)

(assert (=> b!1133606 (=> (not res!756899) (not e!645163))))

(declare-fun e!645160 () Bool)

(assert (=> b!1133606 (= res!756899 e!645160)))

(declare-fun c!110641 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1133606 (= c!110641 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!43121 0))(
  ( (V!43122 (val!14304 Int)) )
))
(declare-fun zeroValue!944 () V!43121)

(declare-datatypes ((array!73851 0))(
  ( (array!73852 (arr!35576 (Array (_ BitVec 32) (_ BitVec 64))) (size!36112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73851)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!503773 () Unit!37145)

(declare-datatypes ((ValueCell!13538 0))(
  ( (ValueCellFull!13538 (v!16941 V!43121)) (EmptyCell!13538) )
))
(declare-datatypes ((array!73853 0))(
  ( (array!73854 (arr!35577 (Array (_ BitVec 32) ValueCell!13538)) (size!36113 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73853)

(declare-fun minValue!944 () V!43121)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!332 (array!73851 array!73853 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 64) (_ BitVec 32) Int) Unit!37145)

(assert (=> b!1133606 (= lt!503773 (lemmaListMapContainsThenArrayContainsFrom!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503770 () Unit!37145)

(declare-fun e!645161 () Unit!37145)

(assert (=> b!1133606 (= lt!503770 e!645161)))

(declare-fun c!110643 () Bool)

(declare-fun lt!503772 () Bool)

(assert (=> b!1133606 (= c!110643 (and (not lt!503772) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133606 (= lt!503772 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133607 () Bool)

(declare-fun e!645167 () Bool)

(declare-fun e!645174 () Bool)

(assert (=> b!1133607 (= e!645167 e!645174)))

(declare-fun res!756897 () Bool)

(assert (=> b!1133607 (=> (not res!756897) (not e!645174))))

(declare-fun lt!503779 () array!73851)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73851 (_ BitVec 32)) Bool)

(assert (=> b!1133607 (= res!756897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503779 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133607 (= lt!503779 (array!73852 (store (arr!35576 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36112 _keys!1208)))))

(declare-fun b!1133608 () Bool)

(declare-fun lt!503781 () Unit!37145)

(assert (=> b!1133608 (= e!645168 lt!503781)))

(declare-fun call!49124 () Unit!37145)

(assert (=> b!1133608 (= lt!503781 call!49124)))

(declare-fun call!49126 () Bool)

(assert (=> b!1133608 call!49126))

(declare-fun b!1133609 () Bool)

(declare-fun e!645162 () Bool)

(declare-fun tp_is_empty!28495 () Bool)

(assert (=> b!1133609 (= e!645162 tp_is_empty!28495)))

(declare-fun c!110642 () Bool)

(declare-fun bm!49119 () Bool)

(declare-datatypes ((tuple2!18040 0))(
  ( (tuple2!18041 (_1!9031 (_ BitVec 64)) (_2!9031 V!43121)) )
))
(declare-datatypes ((List!24801 0))(
  ( (Nil!24798) (Cons!24797 (h!26006 tuple2!18040) (t!35758 List!24801)) )
))
(declare-datatypes ((ListLongMap!16009 0))(
  ( (ListLongMap!16010 (toList!8020 List!24801)) )
))
(declare-fun lt!503782 () ListLongMap!16009)

(declare-fun call!49128 () Unit!37145)

(declare-fun lt!503776 () ListLongMap!16009)

(declare-fun addStillContains!725 (ListLongMap!16009 (_ BitVec 64) V!43121 (_ BitVec 64)) Unit!37145)

(assert (=> bm!49119 (= call!49128 (addStillContains!725 (ite c!110643 lt!503776 lt!503782) (ite c!110643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110642 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110643 minValue!944 (ite c!110642 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1133610 () Bool)

(declare-fun arrayContainsKey!0 (array!73851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133610 (= e!645160 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133611 () Bool)

(declare-fun c!110644 () Bool)

(assert (=> b!1133611 (= c!110644 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503772))))

(declare-fun e!645166 () Unit!37145)

(assert (=> b!1133611 (= e!645166 e!645168)))

(declare-fun b!1133612 () Bool)

(declare-fun e!645169 () Bool)

(declare-fun e!645173 () Bool)

(assert (=> b!1133612 (= e!645169 e!645173)))

(declare-fun res!756888 () Bool)

(assert (=> b!1133612 (=> res!756888 e!645173)))

(assert (=> b!1133612 (= res!756888 (not (= from!1455 i!673)))))

(declare-fun lt!503783 () array!73853)

(declare-fun lt!503774 () ListLongMap!16009)

(declare-fun getCurrentListMapNoExtraKeys!4507 (array!73851 array!73853 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 32) Int) ListLongMap!16009)

(assert (=> b!1133612 (= lt!503774 (getCurrentListMapNoExtraKeys!4507 lt!503779 lt!503783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2575 (Int (_ BitVec 64)) V!43121)

(assert (=> b!1133612 (= lt!503783 (array!73854 (store (arr!35577 _values!996) i!673 (ValueCellFull!13538 (dynLambda!2575 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36113 _values!996)))))

(declare-fun lt!503771 () ListLongMap!16009)

(assert (=> b!1133612 (= lt!503771 (getCurrentListMapNoExtraKeys!4507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133613 () Bool)

(declare-fun res!756890 () Bool)

(assert (=> b!1133613 (=> (not res!756890) (not e!645174))))

(declare-datatypes ((List!24802 0))(
  ( (Nil!24799) (Cons!24798 (h!26007 (_ BitVec 64)) (t!35759 List!24802)) )
))
(declare-fun arrayNoDuplicates!0 (array!73851 (_ BitVec 32) List!24802) Bool)

(assert (=> b!1133613 (= res!756890 (arrayNoDuplicates!0 lt!503779 #b00000000000000000000000000000000 Nil!24799))))

(declare-fun b!1133614 () Bool)

(declare-fun e!645172 () Bool)

(declare-fun call!49127 () ListLongMap!16009)

(declare-fun call!49122 () ListLongMap!16009)

(assert (=> b!1133614 (= e!645172 (= call!49127 call!49122))))

(declare-fun b!1133615 () Bool)

(declare-fun res!756902 () Bool)

(assert (=> b!1133615 (=> (not res!756902) (not e!645167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133615 (= res!756902 (validMask!0 mask!1564))))

(declare-fun bm!49120 () Bool)

(assert (=> bm!49120 (= call!49122 (getCurrentListMapNoExtraKeys!4507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133616 () Bool)

(declare-fun res!756889 () Bool)

(assert (=> b!1133616 (=> (not res!756889) (not e!645167))))

(assert (=> b!1133616 (= res!756889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!49125 () ListLongMap!16009)

(declare-fun call!49123 () Bool)

(declare-fun bm!49121 () Bool)

(declare-fun contains!6545 (ListLongMap!16009 (_ BitVec 64)) Bool)

(assert (=> bm!49121 (= call!49123 (contains!6545 (ite c!110643 lt!503776 call!49125) k!934))))

(declare-fun b!1133618 () Bool)

(declare-fun lt!503775 () Unit!37145)

(assert (=> b!1133618 (= e!645161 lt!503775)))

(declare-fun lt!503777 () Unit!37145)

(assert (=> b!1133618 (= lt!503777 (addStillContains!725 lt!503782 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!49129 () ListLongMap!16009)

(assert (=> b!1133618 (= lt!503776 call!49129)))

(assert (=> b!1133618 call!49123))

(assert (=> b!1133618 (= lt!503775 call!49128)))

(declare-fun +!3462 (ListLongMap!16009 tuple2!18040) ListLongMap!16009)

(assert (=> b!1133618 (contains!6545 (+!3462 lt!503776 (tuple2!18041 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun bm!49122 () Bool)

(assert (=> bm!49122 (= call!49124 call!49128)))

(declare-fun b!1133619 () Bool)

(declare-fun e!645159 () Bool)

(declare-fun mapRes!44567 () Bool)

(assert (=> b!1133619 (= e!645159 (and e!645162 mapRes!44567))))

(declare-fun condMapEmpty!44567 () Bool)

(declare-fun mapDefault!44567 () ValueCell!13538)

