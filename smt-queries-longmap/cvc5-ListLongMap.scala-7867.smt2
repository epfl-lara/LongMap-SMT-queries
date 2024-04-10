; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97946 () Bool)

(assert start!97946)

(declare-fun b_free!23647 () Bool)

(declare-fun b_next!23647 () Bool)

(assert (=> start!97946 (= b_free!23647 (not b_next!23647))))

(declare-fun tp!83644 () Bool)

(declare-fun b_and!38077 () Bool)

(assert (=> start!97946 (= tp!83644 b_and!38077)))

(declare-fun b!1122517 () Bool)

(declare-fun e!639084 () Bool)

(declare-fun e!639078 () Bool)

(assert (=> b!1122517 (= e!639084 e!639078)))

(declare-fun res!749937 () Bool)

(assert (=> b!1122517 (=> res!749937 e!639078)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122517 (= res!749937 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42697 0))(
  ( (V!42698 (val!14145 Int)) )
))
(declare-fun zeroValue!944 () V!42697)

(declare-datatypes ((tuple2!17762 0))(
  ( (tuple2!17763 (_1!8892 (_ BitVec 64)) (_2!8892 V!42697)) )
))
(declare-datatypes ((List!24542 0))(
  ( (Nil!24539) (Cons!24538 (h!25747 tuple2!17762) (t!35181 List!24542)) )
))
(declare-datatypes ((ListLongMap!15731 0))(
  ( (ListLongMap!15732 (toList!7881 List!24542)) )
))
(declare-fun lt!498748 () ListLongMap!15731)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13379 0))(
  ( (ValueCellFull!13379 (v!16778 V!42697)) (EmptyCell!13379) )
))
(declare-datatypes ((array!73231 0))(
  ( (array!73232 (arr!35268 (Array (_ BitVec 32) ValueCell!13379)) (size!35804 (_ BitVec 32))) )
))
(declare-fun lt!498745 () array!73231)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42697)

(declare-datatypes ((array!73233 0))(
  ( (array!73234 (arr!35269 (Array (_ BitVec 32) (_ BitVec 64))) (size!35805 (_ BitVec 32))) )
))
(declare-fun lt!498746 () array!73233)

(declare-fun getCurrentListMapNoExtraKeys!4370 (array!73233 array!73231 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) Int) ListLongMap!15731)

(assert (=> b!1122517 (= lt!498748 (getCurrentListMapNoExtraKeys!4370 lt!498746 lt!498745 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73231)

(declare-fun dynLambda!2466 (Int (_ BitVec 64)) V!42697)

(assert (=> b!1122517 (= lt!498745 (array!73232 (store (arr!35268 _values!996) i!673 (ValueCellFull!13379 (dynLambda!2466 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35804 _values!996)))))

(declare-fun _keys!1208 () array!73233)

(declare-fun lt!498743 () ListLongMap!15731)

(assert (=> b!1122517 (= lt!498743 (getCurrentListMapNoExtraKeys!4370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47224 () ListLongMap!15731)

(declare-fun b!1122518 () Bool)

(declare-fun e!639079 () Bool)

(declare-fun call!47223 () ListLongMap!15731)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1087 (ListLongMap!15731 (_ BitVec 64)) ListLongMap!15731)

(assert (=> b!1122518 (= e!639079 (= call!47223 (-!1087 call!47224 k!934)))))

(declare-fun b!1122519 () Bool)

(declare-fun res!749933 () Bool)

(declare-fun e!639080 () Bool)

(assert (=> b!1122519 (=> (not res!749933) (not e!639080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122519 (= res!749933 (validKeyInArray!0 k!934))))

(declare-fun bm!47220 () Bool)

(assert (=> bm!47220 (= call!47224 (getCurrentListMapNoExtraKeys!4370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122520 () Bool)

(declare-fun e!639082 () Bool)

(assert (=> b!1122520 (= e!639080 e!639082)))

(declare-fun res!749939 () Bool)

(assert (=> b!1122520 (=> (not res!749939) (not e!639082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73233 (_ BitVec 32)) Bool)

(assert (=> b!1122520 (= res!749939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498746 mask!1564))))

(assert (=> b!1122520 (= lt!498746 (array!73234 (store (arr!35269 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35805 _keys!1208)))))

(declare-fun b!1122521 () Bool)

(declare-fun res!749934 () Bool)

(assert (=> b!1122521 (=> (not res!749934) (not e!639080))))

(assert (=> b!1122521 (= res!749934 (= (select (arr!35269 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!44083 () Bool)

(declare-fun mapRes!44083 () Bool)

(assert (=> mapIsEmpty!44083 mapRes!44083))

(declare-fun b!1122522 () Bool)

(declare-fun e!639083 () Bool)

(assert (=> b!1122522 (= e!639083 true)))

(declare-fun lt!498749 () Bool)

(declare-fun contains!6424 (ListLongMap!15731 (_ BitVec 64)) Bool)

(assert (=> b!1122522 (= lt!498749 (contains!6424 (getCurrentListMapNoExtraKeys!4370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1122523 () Bool)

(declare-fun res!749940 () Bool)

(assert (=> b!1122523 (=> (not res!749940) (not e!639080))))

(assert (=> b!1122523 (= res!749940 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35805 _keys!1208))))))

(declare-fun b!1122524 () Bool)

(declare-fun res!749932 () Bool)

(assert (=> b!1122524 (=> (not res!749932) (not e!639080))))

(declare-datatypes ((List!24543 0))(
  ( (Nil!24540) (Cons!24539 (h!25748 (_ BitVec 64)) (t!35182 List!24543)) )
))
(declare-fun arrayNoDuplicates!0 (array!73233 (_ BitVec 32) List!24543) Bool)

(assert (=> b!1122524 (= res!749932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24540))))

(declare-fun mapNonEmpty!44083 () Bool)

(declare-fun tp!83645 () Bool)

(declare-fun e!639087 () Bool)

(assert (=> mapNonEmpty!44083 (= mapRes!44083 (and tp!83645 e!639087))))

(declare-fun mapRest!44083 () (Array (_ BitVec 32) ValueCell!13379))

(declare-fun mapKey!44083 () (_ BitVec 32))

(declare-fun mapValue!44083 () ValueCell!13379)

(assert (=> mapNonEmpty!44083 (= (arr!35268 _values!996) (store mapRest!44083 mapKey!44083 mapValue!44083))))

(declare-fun b!1122525 () Bool)

(declare-fun tp_is_empty!28177 () Bool)

(assert (=> b!1122525 (= e!639087 tp_is_empty!28177)))

(declare-fun b!1122526 () Bool)

(assert (=> b!1122526 (= e!639078 e!639083)))

(declare-fun res!749929 () Bool)

(assert (=> b!1122526 (=> res!749929 e!639083)))

(assert (=> b!1122526 (= res!749929 (not (= (select (arr!35269 _keys!1208) from!1455) k!934)))))

(assert (=> b!1122526 e!639079))

(declare-fun c!109461 () Bool)

(assert (=> b!1122526 (= c!109461 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36818 0))(
  ( (Unit!36819) )
))
(declare-fun lt!498744 () Unit!36818)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 (array!73233 array!73231 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36818)

(assert (=> b!1122526 (= lt!498744 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122527 () Bool)

(declare-fun res!749930 () Bool)

(assert (=> b!1122527 (=> (not res!749930) (not e!639080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122527 (= res!749930 (validMask!0 mask!1564))))

(declare-fun bm!47221 () Bool)

(assert (=> bm!47221 (= call!47223 (getCurrentListMapNoExtraKeys!4370 lt!498746 lt!498745 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!749931 () Bool)

(assert (=> start!97946 (=> (not res!749931) (not e!639080))))

(assert (=> start!97946 (= res!749931 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35805 _keys!1208))))))

(assert (=> start!97946 e!639080))

(assert (=> start!97946 tp_is_empty!28177))

(declare-fun array_inv!27078 (array!73233) Bool)

(assert (=> start!97946 (array_inv!27078 _keys!1208)))

(assert (=> start!97946 true))

(assert (=> start!97946 tp!83644))

(declare-fun e!639085 () Bool)

(declare-fun array_inv!27079 (array!73231) Bool)

(assert (=> start!97946 (and (array_inv!27079 _values!996) e!639085)))

(declare-fun b!1122528 () Bool)

(declare-fun e!639086 () Bool)

(assert (=> b!1122528 (= e!639085 (and e!639086 mapRes!44083))))

(declare-fun condMapEmpty!44083 () Bool)

(declare-fun mapDefault!44083 () ValueCell!13379)

