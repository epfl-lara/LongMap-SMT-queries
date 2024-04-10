; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73618 () Bool)

(assert start!73618)

(declare-fun b_free!14533 () Bool)

(declare-fun b_next!14533 () Bool)

(assert (=> start!73618 (= b_free!14533 (not b_next!14533))))

(declare-fun tp!51103 () Bool)

(declare-fun b_and!24045 () Bool)

(assert (=> start!73618 (= tp!51103 b_and!24045)))

(declare-fun b!861609 () Bool)

(declare-fun res!585528 () Bool)

(declare-fun e!480059 () Bool)

(assert (=> b!861609 (=> (not res!585528) (not e!480059))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49502 0))(
  ( (array!49503 (arr!23782 (Array (_ BitVec 32) (_ BitVec 64))) (size!24222 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49502)

(declare-datatypes ((V!27273 0))(
  ( (V!27274 (val!8382 Int)) )
))
(declare-datatypes ((ValueCell!7895 0))(
  ( (ValueCellFull!7895 (v!10807 V!27273)) (EmptyCell!7895) )
))
(declare-datatypes ((array!49504 0))(
  ( (array!49505 (arr!23783 (Array (_ BitVec 32) ValueCell!7895)) (size!24223 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49504)

(assert (=> b!861609 (= res!585528 (and (= (size!24223 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24222 _keys!868) (size!24223 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861610 () Bool)

(declare-fun e!480058 () Bool)

(assert (=> b!861610 (= e!480058 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!861610 (not (= (select (arr!23782 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29390 0))(
  ( (Unit!29391) )
))
(declare-fun lt!388618 () Unit!29390)

(declare-fun e!480056 () Unit!29390)

(assert (=> b!861610 (= lt!388618 e!480056)))

(declare-fun c!92020 () Bool)

(assert (=> b!861610 (= c!92020 (= (select (arr!23782 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11078 0))(
  ( (tuple2!11079 (_1!5550 (_ BitVec 64)) (_2!5550 V!27273)) )
))
(declare-datatypes ((List!16887 0))(
  ( (Nil!16884) (Cons!16883 (h!18014 tuple2!11078) (t!23686 List!16887)) )
))
(declare-datatypes ((ListLongMap!9847 0))(
  ( (ListLongMap!9848 (toList!4939 List!16887)) )
))
(declare-fun lt!388617 () ListLongMap!9847)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388611 () ListLongMap!9847)

(declare-fun +!2289 (ListLongMap!9847 tuple2!11078) ListLongMap!9847)

(declare-fun get!12547 (ValueCell!7895 V!27273) V!27273)

(declare-fun dynLambda!1125 (Int (_ BitVec 64)) V!27273)

(assert (=> b!861610 (= lt!388611 (+!2289 lt!388617 (tuple2!11079 (select (arr!23782 _keys!868) from!1053) (get!12547 (select (arr!23783 _values!688) from!1053) (dynLambda!1125 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861611 () Bool)

(declare-fun res!585532 () Bool)

(assert (=> b!861611 (=> (not res!585532) (not e!480059))))

(declare-datatypes ((List!16888 0))(
  ( (Nil!16885) (Cons!16884 (h!18015 (_ BitVec 64)) (t!23687 List!16888)) )
))
(declare-fun arrayNoDuplicates!0 (array!49502 (_ BitVec 32) List!16888) Bool)

(assert (=> b!861611 (= res!585532 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16885))))

(declare-fun mapIsEmpty!26603 () Bool)

(declare-fun mapRes!26603 () Bool)

(assert (=> mapIsEmpty!26603 mapRes!26603))

(declare-fun b!861612 () Bool)

(declare-fun Unit!29392 () Unit!29390)

(assert (=> b!861612 (= e!480056 Unit!29392)))

(declare-fun b!861613 () Bool)

(declare-fun res!585533 () Bool)

(assert (=> b!861613 (=> (not res!585533) (not e!480059))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861613 (= res!585533 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24222 _keys!868))))))

(declare-fun b!861614 () Bool)

(declare-fun res!585536 () Bool)

(assert (=> b!861614 (=> (not res!585536) (not e!480059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861614 (= res!585536 (validKeyInArray!0 k!854))))

(declare-fun b!861615 () Bool)

(declare-fun res!585531 () Bool)

(assert (=> b!861615 (=> (not res!585531) (not e!480059))))

(assert (=> b!861615 (= res!585531 (and (= (select (arr!23782 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861616 () Bool)

(declare-fun e!480061 () Bool)

(declare-fun tp_is_empty!16669 () Bool)

(assert (=> b!861616 (= e!480061 tp_is_empty!16669)))

(declare-fun res!585534 () Bool)

(assert (=> start!73618 (=> (not res!585534) (not e!480059))))

(assert (=> start!73618 (= res!585534 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24222 _keys!868))))))

(assert (=> start!73618 e!480059))

(assert (=> start!73618 tp_is_empty!16669))

(assert (=> start!73618 true))

(assert (=> start!73618 tp!51103))

(declare-fun array_inv!18820 (array!49502) Bool)

(assert (=> start!73618 (array_inv!18820 _keys!868)))

(declare-fun e!480060 () Bool)

(declare-fun array_inv!18821 (array!49504) Bool)

(assert (=> start!73618 (and (array_inv!18821 _values!688) e!480060)))

(declare-fun b!861617 () Bool)

(declare-fun res!585535 () Bool)

(assert (=> b!861617 (=> (not res!585535) (not e!480059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861617 (= res!585535 (validMask!0 mask!1196))))

(declare-fun b!861618 () Bool)

(declare-fun e!480057 () Bool)

(assert (=> b!861618 (= e!480057 tp_is_empty!16669)))

(declare-fun b!861619 () Bool)

(declare-fun Unit!29393 () Unit!29390)

(assert (=> b!861619 (= e!480056 Unit!29393)))

(declare-fun lt!388619 () Unit!29390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49502 (_ BitVec 32) (_ BitVec 32)) Unit!29390)

(assert (=> b!861619 (= lt!388619 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861619 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16885)))

(declare-fun lt!388616 () Unit!29390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29390)

(assert (=> b!861619 (= lt!388616 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861619 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388612 () Unit!29390)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49502 (_ BitVec 64) (_ BitVec 32) List!16888) Unit!29390)

(assert (=> b!861619 (= lt!388612 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16885))))

(assert (=> b!861619 false))

(declare-fun b!861620 () Bool)

(assert (=> b!861620 (= e!480060 (and e!480057 mapRes!26603))))

(declare-fun condMapEmpty!26603 () Bool)

(declare-fun mapDefault!26603 () ValueCell!7895)

