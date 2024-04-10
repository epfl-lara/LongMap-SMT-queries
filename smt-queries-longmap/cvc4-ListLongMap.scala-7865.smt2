; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97938 () Bool)

(assert start!97938)

(declare-fun b_free!23639 () Bool)

(declare-fun b_next!23639 () Bool)

(assert (=> start!97938 (= b_free!23639 (not b_next!23639))))

(declare-fun tp!83620 () Bool)

(declare-fun b_and!38061 () Bool)

(assert (=> start!97938 (= tp!83620 b_and!38061)))

(declare-fun b!1122293 () Bool)

(declare-fun res!749782 () Bool)

(declare-fun e!638964 () Bool)

(assert (=> b!1122293 (=> (not res!749782) (not e!638964))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122293 (= res!749782 (validKeyInArray!0 k!934))))

(declare-fun b!1122294 () Bool)

(declare-fun res!749781 () Bool)

(assert (=> b!1122294 (=> (not res!749781) (not e!638964))))

(declare-datatypes ((array!73217 0))(
  ( (array!73218 (arr!35261 (Array (_ BitVec 32) (_ BitVec 64))) (size!35797 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73217)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122294 (= res!749781 (= (select (arr!35261 _keys!1208) i!673) k!934))))

(declare-fun b!1122295 () Bool)

(declare-fun res!749777 () Bool)

(assert (=> b!1122295 (=> (not res!749777) (not e!638964))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42685 0))(
  ( (V!42686 (val!14141 Int)) )
))
(declare-datatypes ((ValueCell!13375 0))(
  ( (ValueCellFull!13375 (v!16774 V!42685)) (EmptyCell!13375) )
))
(declare-datatypes ((array!73219 0))(
  ( (array!73220 (arr!35262 (Array (_ BitVec 32) ValueCell!13375)) (size!35798 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73219)

(assert (=> b!1122295 (= res!749777 (and (= (size!35798 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35797 _keys!1208) (size!35798 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122296 () Bool)

(declare-fun e!638960 () Bool)

(declare-fun tp_is_empty!28169 () Bool)

(assert (=> b!1122296 (= e!638960 tp_is_empty!28169)))

(declare-fun b!1122297 () Bool)

(declare-fun res!749773 () Bool)

(assert (=> b!1122297 (=> (not res!749773) (not e!638964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122297 (= res!749773 (validMask!0 mask!1564))))

(declare-fun b!1122298 () Bool)

(declare-fun e!638962 () Bool)

(declare-fun e!638959 () Bool)

(assert (=> b!1122298 (= e!638962 (not e!638959))))

(declare-fun res!749775 () Bool)

(assert (=> b!1122298 (=> res!749775 e!638959)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122298 (= res!749775 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122298 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36812 0))(
  ( (Unit!36813) )
))
(declare-fun lt!498664 () Unit!36812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73217 (_ BitVec 64) (_ BitVec 32)) Unit!36812)

(assert (=> b!1122298 (= lt!498664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!44071 () Bool)

(declare-fun mapRes!44071 () Bool)

(assert (=> mapIsEmpty!44071 mapRes!44071))

(declare-fun b!1122299 () Bool)

(declare-fun res!749783 () Bool)

(assert (=> b!1122299 (=> (not res!749783) (not e!638964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73217 (_ BitVec 32)) Bool)

(assert (=> b!1122299 (= res!749783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122301 () Bool)

(declare-fun e!638965 () Bool)

(assert (=> b!1122301 (= e!638965 tp_is_empty!28169)))

(declare-fun b!1122302 () Bool)

(declare-fun res!749778 () Bool)

(assert (=> b!1122302 (=> (not res!749778) (not e!638964))))

(assert (=> b!1122302 (= res!749778 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35797 _keys!1208))))))

(declare-fun mapNonEmpty!44071 () Bool)

(declare-fun tp!83621 () Bool)

(assert (=> mapNonEmpty!44071 (= mapRes!44071 (and tp!83621 e!638965))))

(declare-fun mapValue!44071 () ValueCell!13375)

(declare-fun mapKey!44071 () (_ BitVec 32))

(declare-fun mapRest!44071 () (Array (_ BitVec 32) ValueCell!13375))

(assert (=> mapNonEmpty!44071 (= (arr!35262 _values!996) (store mapRest!44071 mapKey!44071 mapValue!44071))))

(declare-fun zeroValue!944 () V!42685)

(declare-datatypes ((tuple2!17756 0))(
  ( (tuple2!17757 (_1!8889 (_ BitVec 64)) (_2!8889 V!42685)) )
))
(declare-datatypes ((List!24536 0))(
  ( (Nil!24533) (Cons!24532 (h!25741 tuple2!17756) (t!35167 List!24536)) )
))
(declare-datatypes ((ListLongMap!15725 0))(
  ( (ListLongMap!15726 (toList!7878 List!24536)) )
))
(declare-fun call!47200 () ListLongMap!15725)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47196 () Bool)

(declare-fun lt!498663 () array!73219)

(declare-fun minValue!944 () V!42685)

(declare-fun lt!498661 () array!73217)

(declare-fun getCurrentListMapNoExtraKeys!4367 (array!73217 array!73219 (_ BitVec 32) (_ BitVec 32) V!42685 V!42685 (_ BitVec 32) Int) ListLongMap!15725)

(assert (=> bm!47196 (= call!47200 (getCurrentListMapNoExtraKeys!4367 lt!498661 lt!498663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122303 () Bool)

(declare-fun e!638958 () Bool)

(assert (=> b!1122303 (= e!638958 true)))

(declare-fun lt!498665 () Bool)

(declare-fun contains!6422 (ListLongMap!15725 (_ BitVec 64)) Bool)

(assert (=> b!1122303 (= lt!498665 (contains!6422 (getCurrentListMapNoExtraKeys!4367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1122304 () Bool)

(declare-fun e!638961 () Bool)

(assert (=> b!1122304 (= e!638959 e!638961)))

(declare-fun res!749785 () Bool)

(assert (=> b!1122304 (=> res!749785 e!638961)))

(assert (=> b!1122304 (= res!749785 (not (= from!1455 i!673)))))

(declare-fun lt!498660 () ListLongMap!15725)

(assert (=> b!1122304 (= lt!498660 (getCurrentListMapNoExtraKeys!4367 lt!498661 lt!498663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2463 (Int (_ BitVec 64)) V!42685)

(assert (=> b!1122304 (= lt!498663 (array!73220 (store (arr!35262 _values!996) i!673 (ValueCellFull!13375 (dynLambda!2463 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35798 _values!996)))))

(declare-fun lt!498659 () ListLongMap!15725)

(assert (=> b!1122304 (= lt!498659 (getCurrentListMapNoExtraKeys!4367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122305 () Bool)

(declare-fun e!638963 () Bool)

(declare-fun call!47199 () ListLongMap!15725)

(assert (=> b!1122305 (= e!638963 (= call!47200 call!47199))))

(declare-fun b!1122306 () Bool)

(declare-fun res!749779 () Bool)

(assert (=> b!1122306 (=> (not res!749779) (not e!638962))))

(declare-datatypes ((List!24537 0))(
  ( (Nil!24534) (Cons!24533 (h!25742 (_ BitVec 64)) (t!35168 List!24537)) )
))
(declare-fun arrayNoDuplicates!0 (array!73217 (_ BitVec 32) List!24537) Bool)

(assert (=> b!1122306 (= res!749779 (arrayNoDuplicates!0 lt!498661 #b00000000000000000000000000000000 Nil!24534))))

(declare-fun bm!47197 () Bool)

(assert (=> bm!47197 (= call!47199 (getCurrentListMapNoExtraKeys!4367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122307 () Bool)

(assert (=> b!1122307 (= e!638964 e!638962)))

(declare-fun res!749784 () Bool)

(assert (=> b!1122307 (=> (not res!749784) (not e!638962))))

(assert (=> b!1122307 (= res!749784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498661 mask!1564))))

(assert (=> b!1122307 (= lt!498661 (array!73218 (store (arr!35261 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35797 _keys!1208)))))

(declare-fun b!1122308 () Bool)

(declare-fun res!749780 () Bool)

(assert (=> b!1122308 (=> (not res!749780) (not e!638964))))

(assert (=> b!1122308 (= res!749780 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24534))))

(declare-fun b!1122300 () Bool)

(declare-fun -!1085 (ListLongMap!15725 (_ BitVec 64)) ListLongMap!15725)

(assert (=> b!1122300 (= e!638963 (= call!47200 (-!1085 call!47199 k!934)))))

(declare-fun res!749774 () Bool)

(assert (=> start!97938 (=> (not res!749774) (not e!638964))))

(assert (=> start!97938 (= res!749774 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35797 _keys!1208))))))

(assert (=> start!97938 e!638964))

(assert (=> start!97938 tp_is_empty!28169))

(declare-fun array_inv!27072 (array!73217) Bool)

(assert (=> start!97938 (array_inv!27072 _keys!1208)))

(assert (=> start!97938 true))

(assert (=> start!97938 tp!83620))

(declare-fun e!638967 () Bool)

(declare-fun array_inv!27073 (array!73219) Bool)

(assert (=> start!97938 (and (array_inv!27073 _values!996) e!638967)))

(declare-fun b!1122309 () Bool)

(assert (=> b!1122309 (= e!638961 e!638958)))

(declare-fun res!749776 () Bool)

(assert (=> b!1122309 (=> res!749776 e!638958)))

(assert (=> b!1122309 (= res!749776 (not (= (select (arr!35261 _keys!1208) from!1455) k!934)))))

(assert (=> b!1122309 e!638963))

(declare-fun c!109449 () Bool)

(assert (=> b!1122309 (= c!109449 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498662 () Unit!36812)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!333 (array!73217 array!73219 (_ BitVec 32) (_ BitVec 32) V!42685 V!42685 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36812)

(assert (=> b!1122309 (= lt!498662 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122310 () Bool)

(assert (=> b!1122310 (= e!638967 (and e!638960 mapRes!44071))))

(declare-fun condMapEmpty!44071 () Bool)

(declare-fun mapDefault!44071 () ValueCell!13375)

