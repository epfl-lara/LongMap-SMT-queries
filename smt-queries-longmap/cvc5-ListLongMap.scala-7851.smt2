; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97850 () Bool)

(assert start!97850)

(declare-fun b_free!23551 () Bool)

(declare-fun b_next!23551 () Bool)

(assert (=> start!97850 (= b_free!23551 (not b_next!23551))))

(declare-fun tp!83357 () Bool)

(declare-fun b_and!37885 () Bool)

(assert (=> start!97850 (= tp!83357 b_and!37885)))

(declare-fun b!1120046 () Bool)

(declare-fun res!748207 () Bool)

(declare-fun e!637827 () Bool)

(assert (=> b!1120046 (=> (not res!748207) (not e!637827))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73043 0))(
  ( (array!73044 (arr!35174 (Array (_ BitVec 32) (_ BitVec 64))) (size!35710 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73043)

(assert (=> b!1120046 (= res!748207 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35710 _keys!1208))))))

(declare-fun b!1120047 () Bool)

(declare-fun res!748209 () Bool)

(assert (=> b!1120047 (=> (not res!748209) (not e!637827))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120047 (= res!748209 (validMask!0 mask!1564))))

(declare-fun b!1120048 () Bool)

(declare-fun e!637825 () Bool)

(declare-fun tp_is_empty!28081 () Bool)

(assert (=> b!1120048 (= e!637825 tp_is_empty!28081)))

(declare-fun b!1120049 () Bool)

(declare-fun e!637826 () Bool)

(assert (=> b!1120049 (= e!637826 true)))

(declare-datatypes ((V!42569 0))(
  ( (V!42570 (val!14097 Int)) )
))
(declare-fun zeroValue!944 () V!42569)

(declare-fun lt!497919 () array!73043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13331 0))(
  ( (ValueCellFull!13331 (v!16730 V!42569)) (EmptyCell!13331) )
))
(declare-datatypes ((array!73045 0))(
  ( (array!73046 (arr!35175 (Array (_ BitVec 32) ValueCell!13331)) (size!35711 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73045)

(declare-fun minValue!944 () V!42569)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17686 0))(
  ( (tuple2!17687 (_1!8854 (_ BitVec 64)) (_2!8854 V!42569)) )
))
(declare-datatypes ((List!24471 0))(
  ( (Nil!24468) (Cons!24467 (h!25676 tuple2!17686) (t!35014 List!24471)) )
))
(declare-datatypes ((ListLongMap!15655 0))(
  ( (ListLongMap!15656 (toList!7843 List!24471)) )
))
(declare-fun lt!497921 () ListLongMap!15655)

(declare-fun getCurrentListMapNoExtraKeys!4333 (array!73043 array!73045 (_ BitVec 32) (_ BitVec 32) V!42569 V!42569 (_ BitVec 32) Int) ListLongMap!15655)

(declare-fun dynLambda!2437 (Int (_ BitVec 64)) V!42569)

(assert (=> b!1120049 (= lt!497921 (getCurrentListMapNoExtraKeys!4333 lt!497919 (array!73046 (store (arr!35175 _values!996) i!673 (ValueCellFull!13331 (dynLambda!2437 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35711 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497920 () ListLongMap!15655)

(assert (=> b!1120049 (= lt!497920 (getCurrentListMapNoExtraKeys!4333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120050 () Bool)

(declare-fun e!637823 () Bool)

(assert (=> b!1120050 (= e!637823 (not e!637826))))

(declare-fun res!748206 () Bool)

(assert (=> b!1120050 (=> res!748206 e!637826)))

(assert (=> b!1120050 (= res!748206 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120050 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36754 0))(
  ( (Unit!36755) )
))
(declare-fun lt!497918 () Unit!36754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73043 (_ BitVec 64) (_ BitVec 32)) Unit!36754)

(assert (=> b!1120050 (= lt!497918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43939 () Bool)

(declare-fun mapRes!43939 () Bool)

(assert (=> mapIsEmpty!43939 mapRes!43939))

(declare-fun res!748214 () Bool)

(assert (=> start!97850 (=> (not res!748214) (not e!637827))))

(assert (=> start!97850 (= res!748214 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35710 _keys!1208))))))

(assert (=> start!97850 e!637827))

(assert (=> start!97850 tp_is_empty!28081))

(declare-fun array_inv!27018 (array!73043) Bool)

(assert (=> start!97850 (array_inv!27018 _keys!1208)))

(assert (=> start!97850 true))

(assert (=> start!97850 tp!83357))

(declare-fun e!637824 () Bool)

(declare-fun array_inv!27019 (array!73045) Bool)

(assert (=> start!97850 (and (array_inv!27019 _values!996) e!637824)))

(declare-fun b!1120051 () Bool)

(declare-fun res!748212 () Bool)

(assert (=> b!1120051 (=> (not res!748212) (not e!637827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120051 (= res!748212 (validKeyInArray!0 k!934))))

(declare-fun b!1120052 () Bool)

(declare-fun e!637821 () Bool)

(assert (=> b!1120052 (= e!637821 tp_is_empty!28081)))

(declare-fun b!1120053 () Bool)

(declare-fun res!748215 () Bool)

(assert (=> b!1120053 (=> (not res!748215) (not e!637823))))

(declare-datatypes ((List!24472 0))(
  ( (Nil!24469) (Cons!24468 (h!25677 (_ BitVec 64)) (t!35015 List!24472)) )
))
(declare-fun arrayNoDuplicates!0 (array!73043 (_ BitVec 32) List!24472) Bool)

(assert (=> b!1120053 (= res!748215 (arrayNoDuplicates!0 lt!497919 #b00000000000000000000000000000000 Nil!24469))))

(declare-fun b!1120054 () Bool)

(declare-fun res!748210 () Bool)

(assert (=> b!1120054 (=> (not res!748210) (not e!637827))))

(assert (=> b!1120054 (= res!748210 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24469))))

(declare-fun mapNonEmpty!43939 () Bool)

(declare-fun tp!83356 () Bool)

(assert (=> mapNonEmpty!43939 (= mapRes!43939 (and tp!83356 e!637825))))

(declare-fun mapKey!43939 () (_ BitVec 32))

(declare-fun mapValue!43939 () ValueCell!13331)

(declare-fun mapRest!43939 () (Array (_ BitVec 32) ValueCell!13331))

(assert (=> mapNonEmpty!43939 (= (arr!35175 _values!996) (store mapRest!43939 mapKey!43939 mapValue!43939))))

(declare-fun b!1120055 () Bool)

(assert (=> b!1120055 (= e!637827 e!637823)))

(declare-fun res!748208 () Bool)

(assert (=> b!1120055 (=> (not res!748208) (not e!637823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73043 (_ BitVec 32)) Bool)

(assert (=> b!1120055 (= res!748208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497919 mask!1564))))

(assert (=> b!1120055 (= lt!497919 (array!73044 (store (arr!35174 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35710 _keys!1208)))))

(declare-fun b!1120056 () Bool)

(declare-fun res!748213 () Bool)

(assert (=> b!1120056 (=> (not res!748213) (not e!637827))))

(assert (=> b!1120056 (= res!748213 (= (select (arr!35174 _keys!1208) i!673) k!934))))

(declare-fun b!1120057 () Bool)

(declare-fun res!748211 () Bool)

(assert (=> b!1120057 (=> (not res!748211) (not e!637827))))

(assert (=> b!1120057 (= res!748211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120058 () Bool)

(assert (=> b!1120058 (= e!637824 (and e!637821 mapRes!43939))))

(declare-fun condMapEmpty!43939 () Bool)

(declare-fun mapDefault!43939 () ValueCell!13331)

