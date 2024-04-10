; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101380 () Bool)

(assert start!101380)

(declare-fun b_free!26251 () Bool)

(declare-fun b_next!26251 () Bool)

(assert (=> start!101380 (= b_free!26251 (not b_next!26251))))

(declare-fun tp!91780 () Bool)

(declare-fun b_and!43655 () Bool)

(assert (=> start!101380 (= tp!91780 b_and!43655)))

(declare-fun b!1218335 () Bool)

(declare-fun e!691718 () Bool)

(declare-fun e!691714 () Bool)

(assert (=> b!1218335 (= e!691718 e!691714)))

(declare-fun res!809146 () Bool)

(assert (=> b!1218335 (=> res!809146 e!691714)))

(declare-datatypes ((array!78685 0))(
  ( (array!78686 (arr!37975 (Array (_ BitVec 32) (_ BitVec 64))) (size!38511 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78685)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218335 (= res!809146 (not (validKeyInArray!0 (select (arr!37975 _keys!1208) from!1455))))))

(declare-datatypes ((V!46401 0))(
  ( (V!46402 (val!15534 Int)) )
))
(declare-datatypes ((tuple2!19982 0))(
  ( (tuple2!19983 (_1!10002 (_ BitVec 64)) (_2!10002 V!46401)) )
))
(declare-datatypes ((List!26785 0))(
  ( (Nil!26782) (Cons!26781 (h!27990 tuple2!19982) (t!40016 List!26785)) )
))
(declare-datatypes ((ListLongMap!17951 0))(
  ( (ListLongMap!17952 (toList!8991 List!26785)) )
))
(declare-fun lt!553839 () ListLongMap!17951)

(declare-fun lt!553836 () ListLongMap!17951)

(assert (=> b!1218335 (= lt!553839 lt!553836)))

(declare-fun lt!553837 () ListLongMap!17951)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1906 (ListLongMap!17951 (_ BitVec 64)) ListLongMap!17951)

(assert (=> b!1218335 (= lt!553836 (-!1906 lt!553837 k!934))))

(declare-fun zeroValue!944 () V!46401)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14768 0))(
  ( (ValueCellFull!14768 (v!18189 V!46401)) (EmptyCell!14768) )
))
(declare-datatypes ((array!78687 0))(
  ( (array!78688 (arr!37976 (Array (_ BitVec 32) ValueCell!14768)) (size!38512 (_ BitVec 32))) )
))
(declare-fun lt!553833 () array!78687)

(declare-fun lt!553840 () array!78685)

(declare-fun minValue!944 () V!46401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5417 (array!78685 array!78687 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) Int) ListLongMap!17951)

(assert (=> b!1218335 (= lt!553839 (getCurrentListMapNoExtraKeys!5417 lt!553840 lt!553833 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78687)

(assert (=> b!1218335 (= lt!553837 (getCurrentListMapNoExtraKeys!5417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40386 0))(
  ( (Unit!40387) )
))
(declare-fun lt!553841 () Unit!40386)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 (array!78685 array!78687 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40386)

(assert (=> b!1218335 (= lt!553841 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218336 () Bool)

(declare-fun res!809151 () Bool)

(declare-fun e!691708 () Bool)

(assert (=> b!1218336 (=> (not res!809151) (not e!691708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78685 (_ BitVec 32)) Bool)

(assert (=> b!1218336 (= res!809151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48313 () Bool)

(declare-fun mapRes!48313 () Bool)

(declare-fun tp!91781 () Bool)

(declare-fun e!691715 () Bool)

(assert (=> mapNonEmpty!48313 (= mapRes!48313 (and tp!91781 e!691715))))

(declare-fun mapKey!48313 () (_ BitVec 32))

(declare-fun mapValue!48313 () ValueCell!14768)

(declare-fun mapRest!48313 () (Array (_ BitVec 32) ValueCell!14768))

(assert (=> mapNonEmpty!48313 (= (arr!37976 _values!996) (store mapRest!48313 mapKey!48313 mapValue!48313))))

(declare-fun b!1218337 () Bool)

(declare-fun e!691709 () Bool)

(assert (=> b!1218337 (= e!691708 e!691709)))

(declare-fun res!809142 () Bool)

(assert (=> b!1218337 (=> (not res!809142) (not e!691709))))

(assert (=> b!1218337 (= res!809142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553840 mask!1564))))

(assert (=> b!1218337 (= lt!553840 (array!78686 (store (arr!37975 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38511 _keys!1208)))))

(declare-fun b!1218338 () Bool)

(declare-fun e!691710 () Bool)

(declare-fun tp_is_empty!30955 () Bool)

(assert (=> b!1218338 (= e!691710 tp_is_empty!30955)))

(declare-fun b!1218339 () Bool)

(declare-fun e!691711 () Bool)

(assert (=> b!1218339 (= e!691711 (and e!691710 mapRes!48313))))

(declare-fun condMapEmpty!48313 () Bool)

(declare-fun mapDefault!48313 () ValueCell!14768)

