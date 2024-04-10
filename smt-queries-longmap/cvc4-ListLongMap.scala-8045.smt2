; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99114 () Bool)

(assert start!99114)

(declare-fun b_free!24719 () Bool)

(declare-fun b_next!24719 () Bool)

(assert (=> start!99114 (= b_free!24719 (not b_next!24719))))

(declare-fun tp!86867 () Bool)

(declare-fun b_and!40287 () Bool)

(assert (=> start!99114 (= tp!86867 b_and!40287)))

(declare-fun b!1165950 () Bool)

(declare-fun e!662787 () Bool)

(assert (=> b!1165950 (= e!662787 true)))

(declare-datatypes ((V!44125 0))(
  ( (V!44126 (val!14681 Int)) )
))
(declare-fun zeroValue!944 () V!44125)

(declare-datatypes ((array!75329 0))(
  ( (array!75330 (arr!36315 (Array (_ BitVec 32) (_ BitVec 64))) (size!36851 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13915 0))(
  ( (ValueCellFull!13915 (v!17318 V!44125)) (EmptyCell!13915) )
))
(declare-datatypes ((array!75331 0))(
  ( (array!75332 (arr!36316 (Array (_ BitVec 32) ValueCell!13915)) (size!36852 (_ BitVec 32))) )
))
(declare-fun lt!525064 () array!75331)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44125)

(declare-fun _values!996 () array!75331)

(declare-fun lt!525066 () array!75329)

(declare-datatypes ((tuple2!18722 0))(
  ( (tuple2!18723 (_1!9372 (_ BitVec 64)) (_2!9372 V!44125)) )
))
(declare-datatypes ((List!25460 0))(
  ( (Nil!25457) (Cons!25456 (h!26665 tuple2!18722) (t!37171 List!25460)) )
))
(declare-datatypes ((ListLongMap!16691 0))(
  ( (ListLongMap!16692 (toList!8361 List!25460)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4825 (array!75329 array!75331 (_ BitVec 32) (_ BitVec 32) V!44125 V!44125 (_ BitVec 32) Int) ListLongMap!16691)

(declare-fun -!1438 (ListLongMap!16691 (_ BitVec 64)) ListLongMap!16691)

(assert (=> b!1165950 (= (getCurrentListMapNoExtraKeys!4825 lt!525066 lt!525064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1438 (getCurrentListMapNoExtraKeys!4825 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38472 0))(
  ( (Unit!38473) )
))
(declare-fun lt!525065 () Unit!38472)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!665 (array!75329 array!75331 (_ BitVec 32) (_ BitVec 32) V!44125 V!44125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38472)

(assert (=> b!1165950 (= lt!525065 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1165951 () Bool)

(declare-fun res!773318 () Bool)

(declare-fun e!662790 () Bool)

(assert (=> b!1165951 (=> (not res!773318) (not e!662790))))

(assert (=> b!1165951 (= res!773318 (and (= (size!36852 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36851 _keys!1208) (size!36852 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165952 () Bool)

(declare-fun res!773316 () Bool)

(assert (=> b!1165952 (=> (not res!773316) (not e!662790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165952 (= res!773316 (validKeyInArray!0 k!934))))

(declare-fun b!1165953 () Bool)

(declare-fun res!773317 () Bool)

(assert (=> b!1165953 (=> (not res!773317) (not e!662790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75329 (_ BitVec 32)) Bool)

(assert (=> b!1165953 (= res!773317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45698 () Bool)

(declare-fun mapRes!45698 () Bool)

(declare-fun tp!86868 () Bool)

(declare-fun e!662788 () Bool)

(assert (=> mapNonEmpty!45698 (= mapRes!45698 (and tp!86868 e!662788))))

(declare-fun mapValue!45698 () ValueCell!13915)

(declare-fun mapRest!45698 () (Array (_ BitVec 32) ValueCell!13915))

(declare-fun mapKey!45698 () (_ BitVec 32))

(assert (=> mapNonEmpty!45698 (= (arr!36316 _values!996) (store mapRest!45698 mapKey!45698 mapValue!45698))))

(declare-fun b!1165954 () Bool)

(declare-fun res!773320 () Bool)

(assert (=> b!1165954 (=> (not res!773320) (not e!662790))))

(declare-datatypes ((List!25461 0))(
  ( (Nil!25458) (Cons!25457 (h!26666 (_ BitVec 64)) (t!37172 List!25461)) )
))
(declare-fun arrayNoDuplicates!0 (array!75329 (_ BitVec 32) List!25461) Bool)

(assert (=> b!1165954 (= res!773320 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25458))))

(declare-fun b!1165955 () Bool)

(declare-fun res!773323 () Bool)

(assert (=> b!1165955 (=> (not res!773323) (not e!662790))))

(assert (=> b!1165955 (= res!773323 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36851 _keys!1208))))))

(declare-fun b!1165956 () Bool)

(declare-fun res!773322 () Bool)

(assert (=> b!1165956 (=> (not res!773322) (not e!662790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165956 (= res!773322 (validMask!0 mask!1564))))

(declare-fun b!1165957 () Bool)

(declare-fun e!662791 () Bool)

(assert (=> b!1165957 (= e!662790 e!662791)))

(declare-fun res!773325 () Bool)

(assert (=> b!1165957 (=> (not res!773325) (not e!662791))))

(assert (=> b!1165957 (= res!773325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525066 mask!1564))))

(assert (=> b!1165957 (= lt!525066 (array!75330 (store (arr!36315 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36851 _keys!1208)))))

(declare-fun b!1165958 () Bool)

(declare-fun e!662789 () Bool)

(assert (=> b!1165958 (= e!662789 e!662787)))

(declare-fun res!773324 () Bool)

(assert (=> b!1165958 (=> res!773324 e!662787)))

(assert (=> b!1165958 (= res!773324 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525068 () ListLongMap!16691)

(assert (=> b!1165958 (= lt!525068 (getCurrentListMapNoExtraKeys!4825 lt!525066 lt!525064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2815 (Int (_ BitVec 64)) V!44125)

(assert (=> b!1165958 (= lt!525064 (array!75332 (store (arr!36316 _values!996) i!673 (ValueCellFull!13915 (dynLambda!2815 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36852 _values!996)))))

(declare-fun lt!525069 () ListLongMap!16691)

(assert (=> b!1165958 (= lt!525069 (getCurrentListMapNoExtraKeys!4825 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165959 () Bool)

(declare-fun res!773327 () Bool)

(assert (=> b!1165959 (=> (not res!773327) (not e!662791))))

(assert (=> b!1165959 (= res!773327 (arrayNoDuplicates!0 lt!525066 #b00000000000000000000000000000000 Nil!25458))))

(declare-fun b!1165960 () Bool)

(declare-fun e!662792 () Bool)

(declare-fun e!662793 () Bool)

(assert (=> b!1165960 (= e!662792 (and e!662793 mapRes!45698))))

(declare-fun condMapEmpty!45698 () Bool)

(declare-fun mapDefault!45698 () ValueCell!13915)

