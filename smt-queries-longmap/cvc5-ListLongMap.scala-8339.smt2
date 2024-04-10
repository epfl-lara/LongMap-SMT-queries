; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101518 () Bool)

(assert start!101518)

(declare-fun b_free!26305 () Bool)

(declare-fun b_next!26305 () Bool)

(assert (=> start!101518 (= b_free!26305 (not b_next!26305))))

(declare-fun tp!91952 () Bool)

(declare-fun b_and!43817 () Bool)

(assert (=> start!101518 (= tp!91952 b_and!43817)))

(declare-fun b!1220347 () Bool)

(declare-fun e!692951 () Bool)

(declare-fun tp_is_empty!31009 () Bool)

(assert (=> b!1220347 (= e!692951 tp_is_empty!31009)))

(declare-fun b!1220348 () Bool)

(declare-fun res!810617 () Bool)

(declare-fun e!692952 () Bool)

(assert (=> b!1220348 (=> (not res!810617) (not e!692952))))

(declare-datatypes ((array!78797 0))(
  ( (array!78798 (arr!38028 (Array (_ BitVec 32) (_ BitVec 64))) (size!38564 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78797)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78797 (_ BitVec 32)) Bool)

(assert (=> b!1220348 (= res!810617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220349 () Bool)

(declare-fun e!692954 () Bool)

(assert (=> b!1220349 (= e!692954 true)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((List!26832 0))(
  ( (Nil!26829) (Cons!26828 (h!28037 (_ BitVec 64)) (t!40117 List!26832)) )
))
(declare-fun arrayNoDuplicates!0 (array!78797 (_ BitVec 32) List!26832) Bool)

(assert (=> b!1220349 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26829)))

(declare-datatypes ((Unit!40434 0))(
  ( (Unit!40435) )
))
(declare-fun lt!554944 () Unit!40434)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78797 (_ BitVec 32) (_ BitVec 32)) Unit!40434)

(assert (=> b!1220349 (= lt!554944 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220349 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554950 () Unit!40434)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78797 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40434)

(assert (=> b!1220349 (= lt!554950 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220350 () Bool)

(declare-fun res!810603 () Bool)

(assert (=> b!1220350 (=> (not res!810603) (not e!692952))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46473 0))(
  ( (V!46474 (val!15561 Int)) )
))
(declare-datatypes ((ValueCell!14795 0))(
  ( (ValueCellFull!14795 (v!18219 V!46473)) (EmptyCell!14795) )
))
(declare-datatypes ((array!78799 0))(
  ( (array!78800 (arr!38029 (Array (_ BitVec 32) ValueCell!14795)) (size!38565 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78799)

(assert (=> b!1220350 (= res!810603 (and (= (size!38565 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38564 _keys!1208) (size!38565 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!692957 () Bool)

(declare-fun b!1220351 () Bool)

(assert (=> b!1220351 (= e!692957 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!48403 () Bool)

(declare-fun mapRes!48403 () Bool)

(declare-fun tp!91951 () Bool)

(assert (=> mapNonEmpty!48403 (= mapRes!48403 (and tp!91951 e!692951))))

(declare-fun mapValue!48403 () ValueCell!14795)

(declare-fun mapKey!48403 () (_ BitVec 32))

(declare-fun mapRest!48403 () (Array (_ BitVec 32) ValueCell!14795))

(assert (=> mapNonEmpty!48403 (= (arr!38029 _values!996) (store mapRest!48403 mapKey!48403 mapValue!48403))))

(declare-fun b!1220352 () Bool)

(declare-fun res!810609 () Bool)

(declare-fun e!692956 () Bool)

(assert (=> b!1220352 (=> (not res!810609) (not e!692956))))

(declare-fun lt!554948 () array!78797)

(assert (=> b!1220352 (= res!810609 (arrayNoDuplicates!0 lt!554948 #b00000000000000000000000000000000 Nil!26829))))

(declare-fun res!810618 () Bool)

(assert (=> start!101518 (=> (not res!810618) (not e!692952))))

(assert (=> start!101518 (= res!810618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38564 _keys!1208))))))

(assert (=> start!101518 e!692952))

(assert (=> start!101518 tp_is_empty!31009))

(declare-fun array_inv!28938 (array!78797) Bool)

(assert (=> start!101518 (array_inv!28938 _keys!1208)))

(assert (=> start!101518 true))

(assert (=> start!101518 tp!91952))

(declare-fun e!692961 () Bool)

(declare-fun array_inv!28939 (array!78799) Bool)

(assert (=> start!101518 (and (array_inv!28939 _values!996) e!692961)))

(declare-fun b!1220353 () Bool)

(declare-fun e!692958 () Bool)

(assert (=> b!1220353 (= e!692958 e!692957)))

(declare-fun res!810616 () Bool)

(assert (=> b!1220353 (=> res!810616 e!692957)))

(assert (=> b!1220353 (= res!810616 (not (= (select (arr!38028 _keys!1208) from!1455) k!934)))))

(declare-fun b!1220354 () Bool)

(declare-fun res!810612 () Bool)

(assert (=> b!1220354 (=> (not res!810612) (not e!692952))))

(assert (=> b!1220354 (= res!810612 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26829))))

(declare-fun mapIsEmpty!48403 () Bool)

(assert (=> mapIsEmpty!48403 mapRes!48403))

(declare-fun b!1220355 () Bool)

(declare-fun e!692953 () Bool)

(assert (=> b!1220355 (= e!692953 tp_is_empty!31009)))

(declare-fun b!1220356 () Bool)

(declare-fun res!810604 () Bool)

(assert (=> b!1220356 (=> (not res!810604) (not e!692952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220356 (= res!810604 (validMask!0 mask!1564))))

(declare-fun b!1220357 () Bool)

(declare-fun e!692960 () Bool)

(assert (=> b!1220357 (= e!692960 e!692954)))

(declare-fun res!810613 () Bool)

(assert (=> b!1220357 (=> res!810613 e!692954)))

(assert (=> b!1220357 (= res!810613 (not (= (select (arr!38028 _keys!1208) from!1455) k!934)))))

(assert (=> b!1220357 e!692958))

(declare-fun res!810610 () Bool)

(assert (=> b!1220357 (=> (not res!810610) (not e!692958))))

(declare-datatypes ((tuple2!20032 0))(
  ( (tuple2!20033 (_1!10027 (_ BitVec 64)) (_2!10027 V!46473)) )
))
(declare-datatypes ((List!26833 0))(
  ( (Nil!26830) (Cons!26829 (h!28038 tuple2!20032) (t!40118 List!26833)) )
))
(declare-datatypes ((ListLongMap!18001 0))(
  ( (ListLongMap!18002 (toList!9016 List!26833)) )
))
(declare-fun lt!554954 () ListLongMap!18001)

(declare-fun lt!554946 () ListLongMap!18001)

(declare-fun lt!554952 () V!46473)

(declare-fun +!4083 (ListLongMap!18001 tuple2!20032) ListLongMap!18001)

(declare-fun get!19402 (ValueCell!14795 V!46473) V!46473)

(assert (=> b!1220357 (= res!810610 (= lt!554954 (+!4083 lt!554946 (tuple2!20033 (select (arr!38028 _keys!1208) from!1455) (get!19402 (select (arr!38029 _values!996) from!1455) lt!554952)))))))

(declare-fun b!1220358 () Bool)

(declare-fun res!810611 () Bool)

(assert (=> b!1220358 (=> (not res!810611) (not e!692952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220358 (= res!810611 (validKeyInArray!0 k!934))))

(declare-fun b!1220359 () Bool)

(declare-fun res!810607 () Bool)

(assert (=> b!1220359 (=> (not res!810607) (not e!692952))))

(assert (=> b!1220359 (= res!810607 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38564 _keys!1208))))))

(declare-fun b!1220360 () Bool)

(declare-fun e!692955 () Bool)

(declare-fun e!692962 () Bool)

(assert (=> b!1220360 (= e!692955 e!692962)))

(declare-fun res!810605 () Bool)

(assert (=> b!1220360 (=> res!810605 e!692962)))

(assert (=> b!1220360 (= res!810605 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46473)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554947 () array!78799)

(declare-fun minValue!944 () V!46473)

(declare-fun getCurrentListMapNoExtraKeys!5439 (array!78797 array!78799 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) Int) ListLongMap!18001)

(assert (=> b!1220360 (= lt!554954 (getCurrentListMapNoExtraKeys!5439 lt!554948 lt!554947 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220360 (= lt!554947 (array!78800 (store (arr!38029 _values!996) i!673 (ValueCellFull!14795 lt!554952)) (size!38565 _values!996)))))

(declare-fun dynLambda!3320 (Int (_ BitVec 64)) V!46473)

(assert (=> b!1220360 (= lt!554952 (dynLambda!3320 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554949 () ListLongMap!18001)

(assert (=> b!1220360 (= lt!554949 (getCurrentListMapNoExtraKeys!5439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220361 () Bool)

(declare-fun res!810614 () Bool)

(assert (=> b!1220361 (=> (not res!810614) (not e!692952))))

(assert (=> b!1220361 (= res!810614 (= (select (arr!38028 _keys!1208) i!673) k!934))))

(declare-fun b!1220362 () Bool)

(assert (=> b!1220362 (= e!692956 (not e!692955))))

(declare-fun res!810615 () Bool)

(assert (=> b!1220362 (=> res!810615 e!692955)))

(assert (=> b!1220362 (= res!810615 (bvsgt from!1455 i!673))))

(assert (=> b!1220362 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!554953 () Unit!40434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78797 (_ BitVec 64) (_ BitVec 32)) Unit!40434)

(assert (=> b!1220362 (= lt!554953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220363 () Bool)

(assert (=> b!1220363 (= e!692962 e!692960)))

(declare-fun res!810608 () Bool)

(assert (=> b!1220363 (=> res!810608 e!692960)))

(assert (=> b!1220363 (= res!810608 (not (validKeyInArray!0 (select (arr!38028 _keys!1208) from!1455))))))

(declare-fun lt!554945 () ListLongMap!18001)

(assert (=> b!1220363 (= lt!554945 lt!554946)))

(declare-fun lt!554955 () ListLongMap!18001)

(declare-fun -!1925 (ListLongMap!18001 (_ BitVec 64)) ListLongMap!18001)

(assert (=> b!1220363 (= lt!554946 (-!1925 lt!554955 k!934))))

(assert (=> b!1220363 (= lt!554945 (getCurrentListMapNoExtraKeys!5439 lt!554948 lt!554947 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220363 (= lt!554955 (getCurrentListMapNoExtraKeys!5439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554951 () Unit!40434)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1132 (array!78797 array!78799 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40434)

(assert (=> b!1220363 (= lt!554951 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1132 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220364 () Bool)

(assert (=> b!1220364 (= e!692952 e!692956)))

(declare-fun res!810606 () Bool)

(assert (=> b!1220364 (=> (not res!810606) (not e!692956))))

(assert (=> b!1220364 (= res!810606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554948 mask!1564))))

(assert (=> b!1220364 (= lt!554948 (array!78798 (store (arr!38028 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38564 _keys!1208)))))

(declare-fun b!1220365 () Bool)

(assert (=> b!1220365 (= e!692961 (and e!692953 mapRes!48403))))

(declare-fun condMapEmpty!48403 () Bool)

(declare-fun mapDefault!48403 () ValueCell!14795)

