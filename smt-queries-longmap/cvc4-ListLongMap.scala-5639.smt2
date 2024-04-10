; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73622 () Bool)

(assert start!73622)

(declare-fun b_free!14537 () Bool)

(declare-fun b_next!14537 () Bool)

(assert (=> start!73622 (= b_free!14537 (not b_next!14537))))

(declare-fun tp!51115 () Bool)

(declare-fun b_and!24053 () Bool)

(assert (=> start!73622 (= tp!51115 b_and!24053)))

(declare-fun b!861703 () Bool)

(declare-fun res!585590 () Bool)

(declare-fun e!480103 () Bool)

(assert (=> b!861703 (=> (not res!585590) (not e!480103))))

(declare-datatypes ((array!49510 0))(
  ( (array!49511 (arr!23786 (Array (_ BitVec 32) (_ BitVec 64))) (size!24226 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49510)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49510 (_ BitVec 32)) Bool)

(assert (=> b!861703 (= res!585590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861704 () Bool)

(declare-fun res!585593 () Bool)

(assert (=> b!861704 (=> (not res!585593) (not e!480103))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861704 (= res!585593 (validKeyInArray!0 k!854))))

(declare-fun b!861705 () Bool)

(declare-fun e!480109 () Bool)

(assert (=> b!861705 (= e!480109 true)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861705 (not (= (select (arr!23786 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29398 0))(
  ( (Unit!29399) )
))
(declare-fun lt!388680 () Unit!29398)

(declare-fun e!480106 () Unit!29398)

(assert (=> b!861705 (= lt!388680 e!480106)))

(declare-fun c!92026 () Bool)

(assert (=> b!861705 (= c!92026 (= (select (arr!23786 _keys!868) from!1053) k!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27277 0))(
  ( (V!27278 (val!8384 Int)) )
))
(declare-datatypes ((tuple2!11082 0))(
  ( (tuple2!11083 (_1!5552 (_ BitVec 64)) (_2!5552 V!27277)) )
))
(declare-datatypes ((List!16891 0))(
  ( (Nil!16888) (Cons!16887 (h!18018 tuple2!11082) (t!23694 List!16891)) )
))
(declare-datatypes ((ListLongMap!9851 0))(
  ( (ListLongMap!9852 (toList!4941 List!16891)) )
))
(declare-fun lt!388682 () ListLongMap!9851)

(declare-datatypes ((ValueCell!7897 0))(
  ( (ValueCellFull!7897 (v!10809 V!27277)) (EmptyCell!7897) )
))
(declare-datatypes ((array!49512 0))(
  ( (array!49513 (arr!23787 (Array (_ BitVec 32) ValueCell!7897)) (size!24227 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49512)

(declare-fun lt!388678 () ListLongMap!9851)

(declare-fun +!2291 (ListLongMap!9851 tuple2!11082) ListLongMap!9851)

(declare-fun get!12549 (ValueCell!7897 V!27277) V!27277)

(declare-fun dynLambda!1127 (Int (_ BitVec 64)) V!27277)

(assert (=> b!861705 (= lt!388678 (+!2291 lt!388682 (tuple2!11083 (select (arr!23786 _keys!868) from!1053) (get!12549 (select (arr!23787 _values!688) from!1053) (dynLambda!1127 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861706 () Bool)

(declare-fun e!480104 () Bool)

(declare-fun tp_is_empty!16673 () Bool)

(assert (=> b!861706 (= e!480104 tp_is_empty!16673)))

(declare-fun b!861707 () Bool)

(declare-fun res!585587 () Bool)

(assert (=> b!861707 (=> (not res!585587) (not e!480103))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861707 (= res!585587 (and (= (select (arr!23786 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861708 () Bool)

(declare-fun Unit!29400 () Unit!29398)

(assert (=> b!861708 (= e!480106 Unit!29400)))

(declare-fun lt!388686 () Unit!29398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49510 (_ BitVec 32) (_ BitVec 32)) Unit!29398)

(assert (=> b!861708 (= lt!388686 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16892 0))(
  ( (Nil!16889) (Cons!16888 (h!18019 (_ BitVec 64)) (t!23695 List!16892)) )
))
(declare-fun arrayNoDuplicates!0 (array!49510 (_ BitVec 32) List!16892) Bool)

(assert (=> b!861708 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16889)))

(declare-fun lt!388677 () Unit!29398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29398)

(assert (=> b!861708 (= lt!388677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861708 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388681 () Unit!29398)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49510 (_ BitVec 64) (_ BitVec 32) List!16892) Unit!29398)

(assert (=> b!861708 (= lt!388681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16889))))

(assert (=> b!861708 false))

(declare-fun b!861710 () Bool)

(declare-fun e!480107 () Bool)

(assert (=> b!861710 (= e!480107 (not e!480109))))

(declare-fun res!585588 () Bool)

(assert (=> b!861710 (=> res!585588 e!480109)))

(assert (=> b!861710 (= res!585588 (not (validKeyInArray!0 (select (arr!23786 _keys!868) from!1053))))))

(declare-fun lt!388687 () ListLongMap!9851)

(assert (=> b!861710 (= lt!388687 lt!388682)))

(declare-fun lt!388684 () ListLongMap!9851)

(declare-fun v!557 () V!27277)

(assert (=> b!861710 (= lt!388682 (+!2291 lt!388684 (tuple2!11083 k!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!388685 () array!49512)

(declare-fun minValue!654 () V!27277)

(declare-fun zeroValue!654 () V!27277)

(declare-fun getCurrentListMapNoExtraKeys!2917 (array!49510 array!49512 (_ BitVec 32) (_ BitVec 32) V!27277 V!27277 (_ BitVec 32) Int) ListLongMap!9851)

(assert (=> b!861710 (= lt!388687 (getCurrentListMapNoExtraKeys!2917 _keys!868 lt!388685 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861710 (= lt!388684 (getCurrentListMapNoExtraKeys!2917 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388683 () Unit!29398)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!501 (array!49510 array!49512 (_ BitVec 32) (_ BitVec 32) V!27277 V!27277 (_ BitVec 32) (_ BitVec 64) V!27277 (_ BitVec 32) Int) Unit!29398)

(assert (=> b!861710 (= lt!388683 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!501 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861711 () Bool)

(declare-fun e!480105 () Bool)

(declare-fun mapRes!26609 () Bool)

(assert (=> b!861711 (= e!480105 (and e!480104 mapRes!26609))))

(declare-fun condMapEmpty!26609 () Bool)

(declare-fun mapDefault!26609 () ValueCell!7897)

