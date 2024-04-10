; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98108 () Bool)

(assert start!98108)

(declare-fun b_free!23809 () Bool)

(declare-fun b_next!23809 () Bool)

(assert (=> start!98108 (= b_free!23809 (not b_next!23809))))

(declare-fun tp!84130 () Bool)

(declare-fun b_and!38401 () Bool)

(assert (=> start!98108 (= tp!84130 b_and!38401)))

(declare-fun b!1127251 () Bool)

(declare-fun res!753296 () Bool)

(declare-fun e!641603 () Bool)

(assert (=> b!1127251 (=> (not res!753296) (not e!641603))))

(declare-datatypes ((array!73539 0))(
  ( (array!73540 (arr!35422 (Array (_ BitVec 32) (_ BitVec 64))) (size!35958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73539)

(declare-datatypes ((List!24664 0))(
  ( (Nil!24661) (Cons!24660 (h!25869 (_ BitVec 64)) (t!35465 List!24664)) )
))
(declare-fun arrayNoDuplicates!0 (array!73539 (_ BitVec 32) List!24664) Bool)

(assert (=> b!1127251 (= res!753296 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24661))))

(declare-fun b!1127252 () Bool)

(declare-fun res!753287 () Bool)

(assert (=> b!1127252 (=> (not res!753287) (not e!641603))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73539 (_ BitVec 32)) Bool)

(assert (=> b!1127252 (= res!753287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!42913 0))(
  ( (V!42914 (val!14226 Int)) )
))
(declare-datatypes ((tuple2!17892 0))(
  ( (tuple2!17893 (_1!8957 (_ BitVec 64)) (_2!8957 V!42913)) )
))
(declare-datatypes ((List!24665 0))(
  ( (Nil!24662) (Cons!24661 (h!25870 tuple2!17892) (t!35466 List!24665)) )
))
(declare-datatypes ((ListLongMap!15861 0))(
  ( (ListLongMap!15862 (toList!7946 List!24665)) )
))
(declare-fun call!47710 () ListLongMap!15861)

(declare-fun call!47709 () ListLongMap!15861)

(declare-fun e!641599 () Bool)

(declare-fun b!1127253 () Bool)

(declare-fun -!1136 (ListLongMap!15861 (_ BitVec 64)) ListLongMap!15861)

(assert (=> b!1127253 (= e!641599 (= call!47709 (-!1136 call!47710 k!934)))))

(declare-fun b!1127254 () Bool)

(declare-fun res!753293 () Bool)

(declare-fun e!641600 () Bool)

(assert (=> b!1127254 (=> (not res!753293) (not e!641600))))

(declare-fun lt!500516 () array!73539)

(assert (=> b!1127254 (= res!753293 (arrayNoDuplicates!0 lt!500516 #b00000000000000000000000000000000 Nil!24661))))

(declare-fun b!1127255 () Bool)

(declare-fun res!753298 () Bool)

(assert (=> b!1127255 (=> (not res!753298) (not e!641603))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127255 (= res!753298 (= (select (arr!35422 _keys!1208) i!673) k!934))))

(declare-fun b!1127256 () Bool)

(declare-fun e!641605 () Bool)

(assert (=> b!1127256 (= e!641605 true)))

(declare-fun zeroValue!944 () V!42913)

(declare-fun lt!500521 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13460 0))(
  ( (ValueCellFull!13460 (v!16859 V!42913)) (EmptyCell!13460) )
))
(declare-datatypes ((array!73541 0))(
  ( (array!73542 (arr!35423 (Array (_ BitVec 32) ValueCell!13460)) (size!35959 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73541)

(declare-fun minValue!944 () V!42913)

(declare-fun contains!6476 (ListLongMap!15861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4434 (array!73539 array!73541 (_ BitVec 32) (_ BitVec 32) V!42913 V!42913 (_ BitVec 32) Int) ListLongMap!15861)

(assert (=> b!1127256 (= lt!500521 (contains!6476 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun mapNonEmpty!44326 () Bool)

(declare-fun mapRes!44326 () Bool)

(declare-fun tp!84131 () Bool)

(declare-fun e!641606 () Bool)

(assert (=> mapNonEmpty!44326 (= mapRes!44326 (and tp!84131 e!641606))))

(declare-fun mapKey!44326 () (_ BitVec 32))

(declare-fun mapValue!44326 () ValueCell!13460)

(declare-fun mapRest!44326 () (Array (_ BitVec 32) ValueCell!13460))

(assert (=> mapNonEmpty!44326 (= (arr!35423 _values!996) (store mapRest!44326 mapKey!44326 mapValue!44326))))

(declare-fun b!1127257 () Bool)

(declare-fun e!641601 () Bool)

(declare-fun e!641602 () Bool)

(assert (=> b!1127257 (= e!641601 e!641602)))

(declare-fun res!753295 () Bool)

(assert (=> b!1127257 (=> res!753295 e!641602)))

(assert (=> b!1127257 (= res!753295 (not (= from!1455 i!673)))))

(declare-fun lt!500517 () ListLongMap!15861)

(declare-fun lt!500519 () array!73541)

(assert (=> b!1127257 (= lt!500517 (getCurrentListMapNoExtraKeys!4434 lt!500516 lt!500519 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2521 (Int (_ BitVec 64)) V!42913)

(assert (=> b!1127257 (= lt!500519 (array!73542 (store (arr!35423 _values!996) i!673 (ValueCellFull!13460 (dynLambda!2521 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35959 _values!996)))))

(declare-fun lt!500520 () ListLongMap!15861)

(assert (=> b!1127257 (= lt!500520 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127258 () Bool)

(declare-fun e!641604 () Bool)

(declare-fun e!641607 () Bool)

(assert (=> b!1127258 (= e!641604 (and e!641607 mapRes!44326))))

(declare-fun condMapEmpty!44326 () Bool)

(declare-fun mapDefault!44326 () ValueCell!13460)

