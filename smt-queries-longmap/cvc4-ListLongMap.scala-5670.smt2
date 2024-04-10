; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73808 () Bool)

(assert start!73808)

(declare-fun b_free!14723 () Bool)

(declare-fun b_next!14723 () Bool)

(assert (=> start!73808 (= b_free!14723 (not b_next!14723))))

(declare-fun tp!51672 () Bool)

(declare-fun b_and!24425 () Bool)

(assert (=> start!73808 (= tp!51672 b_and!24425)))

(declare-fun b!866325 () Bool)

(declare-fun e!482591 () Bool)

(declare-fun e!482592 () Bool)

(assert (=> b!866325 (= e!482591 (not e!482592))))

(declare-fun res!588628 () Bool)

(assert (=> b!866325 (=> res!588628 e!482592)))

(declare-datatypes ((array!49878 0))(
  ( (array!49879 (arr!23970 (Array (_ BitVec 32) (_ BitVec 64))) (size!24410 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49878)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866325 (= res!588628 (not (validKeyInArray!0 (select (arr!23970 _keys!868) from!1053))))))

(declare-datatypes ((V!27525 0))(
  ( (V!27526 (val!8477 Int)) )
))
(declare-datatypes ((tuple2!11240 0))(
  ( (tuple2!11241 (_1!5631 (_ BitVec 64)) (_2!5631 V!27525)) )
))
(declare-datatypes ((List!17041 0))(
  ( (Nil!17038) (Cons!17037 (h!18168 tuple2!11240) (t!24030 List!17041)) )
))
(declare-datatypes ((ListLongMap!10009 0))(
  ( (ListLongMap!10010 (toList!5020 List!17041)) )
))
(declare-fun lt!393016 () ListLongMap!10009)

(declare-fun lt!393004 () ListLongMap!10009)

(assert (=> b!866325 (= lt!393016 lt!393004)))

(declare-fun lt!393003 () ListLongMap!10009)

(declare-fun lt!393002 () tuple2!11240)

(declare-fun +!2367 (ListLongMap!10009 tuple2!11240) ListLongMap!10009)

(assert (=> b!866325 (= lt!393004 (+!2367 lt!393003 lt!393002))))

(declare-datatypes ((ValueCell!7990 0))(
  ( (ValueCellFull!7990 (v!10902 V!27525)) (EmptyCell!7990) )
))
(declare-datatypes ((array!49880 0))(
  ( (array!49881 (arr!23971 (Array (_ BitVec 32) ValueCell!7990)) (size!24411 (_ BitVec 32))) )
))
(declare-fun lt!393006 () array!49880)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27525)

(declare-fun zeroValue!654 () V!27525)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2991 (array!49878 array!49880 (_ BitVec 32) (_ BitVec 32) V!27525 V!27525 (_ BitVec 32) Int) ListLongMap!10009)

(assert (=> b!866325 (= lt!393016 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!393006 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27525)

(assert (=> b!866325 (= lt!393002 (tuple2!11241 k!854 v!557))))

(declare-fun _values!688 () array!49880)

(assert (=> b!866325 (= lt!393003 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29691 0))(
  ( (Unit!29692) )
))
(declare-fun lt!393005 () Unit!29691)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!566 (array!49878 array!49880 (_ BitVec 32) (_ BitVec 32) V!27525 V!27525 (_ BitVec 32) (_ BitVec 64) V!27525 (_ BitVec 32) Int) Unit!29691)

(assert (=> b!866325 (= lt!393005 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!566 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26888 () Bool)

(declare-fun mapRes!26888 () Bool)

(declare-fun tp!51673 () Bool)

(declare-fun e!482587 () Bool)

(assert (=> mapNonEmpty!26888 (= mapRes!26888 (and tp!51673 e!482587))))

(declare-fun mapKey!26888 () (_ BitVec 32))

(declare-fun mapRest!26888 () (Array (_ BitVec 32) ValueCell!7990))

(declare-fun mapValue!26888 () ValueCell!7990)

(assert (=> mapNonEmpty!26888 (= (arr!23971 _values!688) (store mapRest!26888 mapKey!26888 mapValue!26888))))

(declare-fun b!866326 () Bool)

(declare-fun res!588635 () Bool)

(declare-fun e!482586 () Bool)

(assert (=> b!866326 (=> (not res!588635) (not e!482586))))

(assert (=> b!866326 (= res!588635 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24410 _keys!868))))))

(declare-fun b!866327 () Bool)

(declare-fun tp_is_empty!16859 () Bool)

(assert (=> b!866327 (= e!482587 tp_is_empty!16859)))

(declare-fun b!866328 () Bool)

(declare-fun res!588637 () Bool)

(assert (=> b!866328 (=> (not res!588637) (not e!482586))))

(assert (=> b!866328 (= res!588637 (validKeyInArray!0 k!854))))

(declare-fun b!866330 () Bool)

(declare-fun res!588632 () Bool)

(assert (=> b!866330 (=> (not res!588632) (not e!482586))))

(declare-datatypes ((List!17042 0))(
  ( (Nil!17039) (Cons!17038 (h!18169 (_ BitVec 64)) (t!24031 List!17042)) )
))
(declare-fun arrayNoDuplicates!0 (array!49878 (_ BitVec 32) List!17042) Bool)

(assert (=> b!866330 (= res!588632 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17039))))

(declare-fun b!866331 () Bool)

(declare-fun res!588638 () Bool)

(assert (=> b!866331 (=> (not res!588638) (not e!482586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49878 (_ BitVec 32)) Bool)

(assert (=> b!866331 (= res!588638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866332 () Bool)

(declare-fun e!482585 () Bool)

(assert (=> b!866332 (= e!482592 e!482585)))

(declare-fun res!588634 () Bool)

(assert (=> b!866332 (=> res!588634 e!482585)))

(assert (=> b!866332 (= res!588634 (= k!854 (select (arr!23970 _keys!868) from!1053)))))

(assert (=> b!866332 (not (= (select (arr!23970 _keys!868) from!1053) k!854))))

(declare-fun lt!393011 () Unit!29691)

(declare-fun e!482588 () Unit!29691)

(assert (=> b!866332 (= lt!393011 e!482588)))

(declare-fun c!92305 () Bool)

(assert (=> b!866332 (= c!92305 (= (select (arr!23970 _keys!868) from!1053) k!854))))

(declare-fun lt!393013 () ListLongMap!10009)

(declare-fun lt!393014 () ListLongMap!10009)

(assert (=> b!866332 (= lt!393013 lt!393014)))

(declare-fun lt!393012 () tuple2!11240)

(assert (=> b!866332 (= lt!393014 (+!2367 lt!393004 lt!393012))))

(declare-fun lt!393015 () V!27525)

(assert (=> b!866332 (= lt!393012 (tuple2!11241 (select (arr!23970 _keys!868) from!1053) lt!393015))))

(declare-fun get!12671 (ValueCell!7990 V!27525) V!27525)

(declare-fun dynLambda!1187 (Int (_ BitVec 64)) V!27525)

(assert (=> b!866332 (= lt!393015 (get!12671 (select (arr!23971 _values!688) from!1053) (dynLambda!1187 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866333 () Bool)

(assert (=> b!866333 (= e!482586 e!482591)))

(declare-fun res!588631 () Bool)

(assert (=> b!866333 (=> (not res!588631) (not e!482591))))

(assert (=> b!866333 (= res!588631 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866333 (= lt!393013 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!393006 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866333 (= lt!393006 (array!49881 (store (arr!23971 _values!688) i!612 (ValueCellFull!7990 v!557)) (size!24411 _values!688)))))

(declare-fun lt!393007 () ListLongMap!10009)

(assert (=> b!866333 (= lt!393007 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866334 () Bool)

(assert (=> b!866334 (= e!482585 true)))

(assert (=> b!866334 (= lt!393014 (+!2367 (+!2367 lt!393003 lt!393012) lt!393002))))

(declare-fun lt!393009 () Unit!29691)

(declare-fun addCommutativeForDiffKeys!535 (ListLongMap!10009 (_ BitVec 64) V!27525 (_ BitVec 64) V!27525) Unit!29691)

(assert (=> b!866334 (= lt!393009 (addCommutativeForDiffKeys!535 lt!393003 k!854 v!557 (select (arr!23970 _keys!868) from!1053) lt!393015))))

(declare-fun mapIsEmpty!26888 () Bool)

(assert (=> mapIsEmpty!26888 mapRes!26888))

(declare-fun b!866335 () Bool)

(declare-fun e!482593 () Bool)

(assert (=> b!866335 (= e!482593 tp_is_empty!16859)))

(declare-fun b!866336 () Bool)

(declare-fun Unit!29693 () Unit!29691)

(assert (=> b!866336 (= e!482588 Unit!29693)))

(declare-fun lt!393008 () Unit!29691)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49878 (_ BitVec 32) (_ BitVec 32)) Unit!29691)

(assert (=> b!866336 (= lt!393008 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866336 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17039)))

(declare-fun lt!393001 () Unit!29691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29691)

(assert (=> b!866336 (= lt!393001 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866336 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393010 () Unit!29691)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49878 (_ BitVec 64) (_ BitVec 32) List!17042) Unit!29691)

(assert (=> b!866336 (= lt!393010 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17039))))

(assert (=> b!866336 false))

(declare-fun b!866337 () Bool)

(declare-fun e!482589 () Bool)

(assert (=> b!866337 (= e!482589 (and e!482593 mapRes!26888))))

(declare-fun condMapEmpty!26888 () Bool)

(declare-fun mapDefault!26888 () ValueCell!7990)

