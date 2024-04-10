; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100370 () Bool)

(assert start!100370)

(declare-fun b_free!25711 () Bool)

(declare-fun b_next!25711 () Bool)

(assert (=> start!100370 (= b_free!25711 (not b_next!25711))))

(declare-fun tp!90120 () Bool)

(declare-fun b_and!42313 () Bool)

(assert (=> start!100370 (= tp!90120 b_and!42313)))

(declare-fun b!1197958 () Bool)

(declare-fun res!797269 () Bool)

(declare-fun e!680510 () Bool)

(assert (=> b!1197958 (=> (not res!797269) (not e!680510))))

(declare-datatypes ((array!77607 0))(
  ( (array!77608 (arr!37449 (Array (_ BitVec 32) (_ BitVec 64))) (size!37985 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77607)

(declare-datatypes ((List!26343 0))(
  ( (Nil!26340) (Cons!26339 (h!27548 (_ BitVec 64)) (t!39046 List!26343)) )
))
(declare-fun arrayNoDuplicates!0 (array!77607 (_ BitVec 32) List!26343) Bool)

(assert (=> b!1197958 (= res!797269 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26340))))

(declare-fun b!1197959 () Bool)

(declare-fun res!797274 () Bool)

(assert (=> b!1197959 (=> (not res!797274) (not e!680510))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45681 0))(
  ( (V!45682 (val!15264 Int)) )
))
(declare-datatypes ((ValueCell!14498 0))(
  ( (ValueCellFull!14498 (v!17902 V!45681)) (EmptyCell!14498) )
))
(declare-datatypes ((array!77609 0))(
  ( (array!77610 (arr!37450 (Array (_ BitVec 32) ValueCell!14498)) (size!37986 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77609)

(assert (=> b!1197959 (= res!797274 (and (= (size!37986 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37985 _keys!1208) (size!37986 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197960 () Bool)

(declare-fun e!680512 () Bool)

(declare-fun e!680515 () Bool)

(assert (=> b!1197960 (= e!680512 (not e!680515))))

(declare-fun res!797267 () Bool)

(assert (=> b!1197960 (=> res!797267 e!680515)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1197960 (= res!797267 (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37985 _keys!1208))))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197960 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39720 0))(
  ( (Unit!39721) )
))
(declare-fun lt!543377 () Unit!39720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77607 (_ BitVec 64) (_ BitVec 32)) Unit!39720)

(assert (=> b!1197960 (= lt!543377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45681)

(declare-fun zeroValue!944 () V!45681)

(declare-fun lt!543378 () array!77607)

(declare-fun b!1197961 () Bool)

(declare-datatypes ((tuple2!19526 0))(
  ( (tuple2!19527 (_1!9774 (_ BitVec 64)) (_2!9774 V!45681)) )
))
(declare-datatypes ((List!26344 0))(
  ( (Nil!26341) (Cons!26340 (h!27549 tuple2!19526) (t!39047 List!26344)) )
))
(declare-datatypes ((ListLongMap!17495 0))(
  ( (ListLongMap!17496 (toList!8763 List!26344)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5202 (array!77607 array!77609 (_ BitVec 32) (_ BitVec 32) V!45681 V!45681 (_ BitVec 32) Int) ListLongMap!17495)

(declare-fun dynLambda!3126 (Int (_ BitVec 64)) V!45681)

(assert (=> b!1197961 (= e!680515 (= (getCurrentListMapNoExtraKeys!5202 lt!543378 (array!77610 (store (arr!37450 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3126 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37986 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5202 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun b!1197963 () Bool)

(declare-fun res!797275 () Bool)

(assert (=> b!1197963 (=> (not res!797275) (not e!680510))))

(assert (=> b!1197963 (= res!797275 (= (select (arr!37449 _keys!1208) i!673) k!934))))

(declare-fun b!1197964 () Bool)

(declare-fun res!797268 () Bool)

(assert (=> b!1197964 (=> (not res!797268) (not e!680510))))

(assert (=> b!1197964 (= res!797268 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37985 _keys!1208))))))

(declare-fun b!1197965 () Bool)

(declare-fun res!797272 () Bool)

(assert (=> b!1197965 (=> (not res!797272) (not e!680510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197965 (= res!797272 (validKeyInArray!0 k!934))))

(declare-fun b!1197966 () Bool)

(declare-fun e!680514 () Bool)

(declare-fun e!680513 () Bool)

(declare-fun mapRes!47462 () Bool)

(assert (=> b!1197966 (= e!680514 (and e!680513 mapRes!47462))))

(declare-fun condMapEmpty!47462 () Bool)

(declare-fun mapDefault!47462 () ValueCell!14498)

