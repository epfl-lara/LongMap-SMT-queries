; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99146 () Bool)

(assert start!99146)

(declare-fun b_free!24751 () Bool)

(declare-fun b_next!24751 () Bool)

(assert (=> start!99146 (= b_free!24751 (not b_next!24751))))

(declare-fun tp!86963 () Bool)

(declare-fun b_and!40351 () Bool)

(assert (=> start!99146 (= tp!86963 b_and!40351)))

(declare-fun b!1166702 () Bool)

(declare-fun res!773902 () Bool)

(declare-fun e!663172 () Bool)

(assert (=> b!1166702 (=> (not res!773902) (not e!663172))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166702 (= res!773902 (validMask!0 mask!1564))))

(declare-fun b!1166703 () Bool)

(declare-fun e!663173 () Bool)

(declare-fun tp_is_empty!29281 () Bool)

(assert (=> b!1166703 (= e!663173 tp_is_empty!29281)))

(declare-fun b!1166704 () Bool)

(declare-fun res!773901 () Bool)

(assert (=> b!1166704 (=> (not res!773901) (not e!663172))))

(declare-datatypes ((array!75393 0))(
  ( (array!75394 (arr!36347 (Array (_ BitVec 32) (_ BitVec 64))) (size!36883 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75393)

(declare-datatypes ((V!44169 0))(
  ( (V!44170 (val!14697 Int)) )
))
(declare-datatypes ((ValueCell!13931 0))(
  ( (ValueCellFull!13931 (v!17334 V!44169)) (EmptyCell!13931) )
))
(declare-datatypes ((array!75395 0))(
  ( (array!75396 (arr!36348 (Array (_ BitVec 32) ValueCell!13931)) (size!36884 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75395)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166704 (= res!773901 (and (= (size!36884 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36883 _keys!1208) (size!36884 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45746 () Bool)

(declare-fun mapRes!45746 () Bool)

(assert (=> mapIsEmpty!45746 mapRes!45746))

(declare-fun mapNonEmpty!45746 () Bool)

(declare-fun tp!86964 () Bool)

(assert (=> mapNonEmpty!45746 (= mapRes!45746 (and tp!86964 e!663173))))

(declare-fun mapRest!45746 () (Array (_ BitVec 32) ValueCell!13931))

(declare-fun mapValue!45746 () ValueCell!13931)

(declare-fun mapKey!45746 () (_ BitVec 32))

(assert (=> mapNonEmpty!45746 (= (arr!36348 _values!996) (store mapRest!45746 mapKey!45746 mapValue!45746))))

(declare-fun b!1166705 () Bool)

(declare-fun e!663175 () Bool)

(assert (=> b!1166705 (= e!663175 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525355 () array!75393)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44169)

(declare-fun lt!525356 () array!75395)

(declare-fun zeroValue!944 () V!44169)

(declare-datatypes ((tuple2!18744 0))(
  ( (tuple2!18745 (_1!9383 (_ BitVec 64)) (_2!9383 V!44169)) )
))
(declare-datatypes ((List!25485 0))(
  ( (Nil!25482) (Cons!25481 (h!26690 tuple2!18744) (t!37228 List!25485)) )
))
(declare-datatypes ((ListLongMap!16713 0))(
  ( (ListLongMap!16714 (toList!8372 List!25485)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4836 (array!75393 array!75395 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) Int) ListLongMap!16713)

(declare-fun -!1448 (ListLongMap!16713 (_ BitVec 64)) ListLongMap!16713)

(assert (=> b!1166705 (= (getCurrentListMapNoExtraKeys!4836 lt!525355 lt!525356 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1448 (getCurrentListMapNoExtraKeys!4836 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38498 0))(
  ( (Unit!38499) )
))
(declare-fun lt!525354 () Unit!38498)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!675 (array!75393 array!75395 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38498)

(assert (=> b!1166705 (= lt!525354 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166706 () Bool)

(declare-fun res!773895 () Bool)

(assert (=> b!1166706 (=> (not res!773895) (not e!663172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166706 (= res!773895 (validKeyInArray!0 k!934))))

(declare-fun b!1166707 () Bool)

(declare-fun e!663170 () Bool)

(assert (=> b!1166707 (= e!663172 e!663170)))

(declare-fun res!773897 () Bool)

(assert (=> b!1166707 (=> (not res!773897) (not e!663170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75393 (_ BitVec 32)) Bool)

(assert (=> b!1166707 (= res!773897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525355 mask!1564))))

(assert (=> b!1166707 (= lt!525355 (array!75394 (store (arr!36347 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36883 _keys!1208)))))

(declare-fun b!1166708 () Bool)

(declare-fun res!773894 () Bool)

(assert (=> b!1166708 (=> (not res!773894) (not e!663172))))

(assert (=> b!1166708 (= res!773894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36883 _keys!1208))))))

(declare-fun b!1166710 () Bool)

(declare-fun res!773893 () Bool)

(assert (=> b!1166710 (=> (not res!773893) (not e!663172))))

(assert (=> b!1166710 (= res!773893 (= (select (arr!36347 _keys!1208) i!673) k!934))))

(declare-fun b!1166711 () Bool)

(declare-fun res!773900 () Bool)

(assert (=> b!1166711 (=> (not res!773900) (not e!663170))))

(declare-datatypes ((List!25486 0))(
  ( (Nil!25483) (Cons!25482 (h!26691 (_ BitVec 64)) (t!37229 List!25486)) )
))
(declare-fun arrayNoDuplicates!0 (array!75393 (_ BitVec 32) List!25486) Bool)

(assert (=> b!1166711 (= res!773900 (arrayNoDuplicates!0 lt!525355 #b00000000000000000000000000000000 Nil!25483))))

(declare-fun b!1166712 () Bool)

(declare-fun res!773892 () Bool)

(assert (=> b!1166712 (=> (not res!773892) (not e!663172))))

(assert (=> b!1166712 (= res!773892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166713 () Bool)

(declare-fun res!773896 () Bool)

(assert (=> b!1166713 (=> (not res!773896) (not e!663172))))

(assert (=> b!1166713 (= res!773896 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25483))))

(declare-fun b!1166714 () Bool)

(declare-fun e!663177 () Bool)

(assert (=> b!1166714 (= e!663177 tp_is_empty!29281)))

(declare-fun b!1166715 () Bool)

(declare-fun e!663176 () Bool)

(assert (=> b!1166715 (= e!663176 (and e!663177 mapRes!45746))))

(declare-fun condMapEmpty!45746 () Bool)

(declare-fun mapDefault!45746 () ValueCell!13931)

