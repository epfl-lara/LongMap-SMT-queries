; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98166 () Bool)

(assert start!98166)

(declare-fun b_free!23867 () Bool)

(declare-fun b_next!23867 () Bool)

(assert (=> start!98166 (= b_free!23867 (not b_next!23867))))

(declare-fun tp!84305 () Bool)

(declare-fun b_and!38517 () Bool)

(assert (=> start!98166 (= tp!84305 b_and!38517)))

(declare-fun b!1128884 () Bool)

(declare-fun res!754436 () Bool)

(declare-fun e!642474 () Bool)

(assert (=> b!1128884 (=> (not res!754436) (not e!642474))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128884 (= res!754436 (validMask!0 mask!1564))))

(declare-fun b!1128885 () Bool)

(declare-fun res!754427 () Bool)

(assert (=> b!1128885 (=> (not res!754427) (not e!642474))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!73651 0))(
  ( (array!73652 (arr!35478 (Array (_ BitVec 32) (_ BitVec 64))) (size!36014 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73651)

(assert (=> b!1128885 (= res!754427 (= (select (arr!35478 _keys!1208) i!673) k!934))))

(declare-datatypes ((V!42989 0))(
  ( (V!42990 (val!14255 Int)) )
))
(declare-datatypes ((tuple2!17944 0))(
  ( (tuple2!17945 (_1!8983 (_ BitVec 64)) (_2!8983 V!42989)) )
))
(declare-datatypes ((List!24712 0))(
  ( (Nil!24709) (Cons!24708 (h!25917 tuple2!17944) (t!35571 List!24712)) )
))
(declare-datatypes ((ListLongMap!15913 0))(
  ( (ListLongMap!15914 (toList!7972 List!24712)) )
))
(declare-fun call!47883 () ListLongMap!15913)

(declare-fun e!642473 () Bool)

(declare-fun b!1128886 () Bool)

(declare-fun call!47884 () ListLongMap!15913)

(declare-fun -!1154 (ListLongMap!15913 (_ BitVec 64)) ListLongMap!15913)

(assert (=> b!1128886 (= e!642473 (= call!47883 (-!1154 call!47884 k!934)))))

(declare-fun b!1128887 () Bool)

(declare-fun res!754429 () Bool)

(declare-fun e!642468 () Bool)

(assert (=> b!1128887 (=> (not res!754429) (not e!642468))))

(declare-fun lt!501117 () array!73651)

(declare-datatypes ((List!24713 0))(
  ( (Nil!24710) (Cons!24709 (h!25918 (_ BitVec 64)) (t!35572 List!24713)) )
))
(declare-fun arrayNoDuplicates!0 (array!73651 (_ BitVec 32) List!24713) Bool)

(assert (=> b!1128887 (= res!754429 (arrayNoDuplicates!0 lt!501117 #b00000000000000000000000000000000 Nil!24710))))

(declare-fun b!1128888 () Bool)

(declare-fun res!754432 () Bool)

(assert (=> b!1128888 (=> (not res!754432) (not e!642474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73651 (_ BitVec 32)) Bool)

(assert (=> b!1128888 (= res!754432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128889 () Bool)

(declare-fun e!642470 () Bool)

(assert (=> b!1128889 (= e!642468 (not e!642470))))

(declare-fun res!754435 () Bool)

(assert (=> b!1128889 (=> res!754435 e!642470)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128889 (= res!754435 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128889 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36982 0))(
  ( (Unit!36983) )
))
(declare-fun lt!501119 () Unit!36982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73651 (_ BitVec 64) (_ BitVec 32)) Unit!36982)

(assert (=> b!1128889 (= lt!501119 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128890 () Bool)

(declare-fun e!642472 () Bool)

(declare-fun e!642475 () Bool)

(assert (=> b!1128890 (= e!642472 e!642475)))

(declare-fun res!754437 () Bool)

(assert (=> b!1128890 (=> res!754437 e!642475)))

(assert (=> b!1128890 (= res!754437 (not (= (select (arr!35478 _keys!1208) from!1455) k!934)))))

(assert (=> b!1128890 e!642473))

(declare-fun c!109791 () Bool)

(assert (=> b!1128890 (= c!109791 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42989)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13489 0))(
  ( (ValueCellFull!13489 (v!16888 V!42989)) (EmptyCell!13489) )
))
(declare-datatypes ((array!73653 0))(
  ( (array!73654 (arr!35479 (Array (_ BitVec 32) ValueCell!13489)) (size!36015 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73653)

(declare-fun minValue!944 () V!42989)

(declare-fun lt!501121 () Unit!36982)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 (array!73651 array!73653 (_ BitVec 32) (_ BitVec 32) V!42989 V!42989 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36982)

(assert (=> b!1128890 (= lt!501121 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128891 () Bool)

(declare-fun e!642471 () Bool)

(declare-fun tp_is_empty!28397 () Bool)

(assert (=> b!1128891 (= e!642471 tp_is_empty!28397)))

(declare-fun lt!501122 () array!73653)

(declare-fun bm!47881 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4459 (array!73651 array!73653 (_ BitVec 32) (_ BitVec 32) V!42989 V!42989 (_ BitVec 32) Int) ListLongMap!15913)

(assert (=> bm!47881 (= call!47883 (getCurrentListMapNoExtraKeys!4459 lt!501117 lt!501122 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128892 () Bool)

(declare-fun e!642469 () Bool)

(declare-fun e!642476 () Bool)

(declare-fun mapRes!44413 () Bool)

(assert (=> b!1128892 (= e!642469 (and e!642476 mapRes!44413))))

(declare-fun condMapEmpty!44413 () Bool)

(declare-fun mapDefault!44413 () ValueCell!13489)

