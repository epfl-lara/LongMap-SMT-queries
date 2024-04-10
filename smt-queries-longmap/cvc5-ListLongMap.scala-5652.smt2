; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73696 () Bool)

(assert start!73696)

(declare-fun b_free!14611 () Bool)

(declare-fun b_next!14611 () Bool)

(assert (=> start!73696 (= b_free!14611 (not b_next!14611))))

(declare-fun tp!51337 () Bool)

(declare-fun b_and!24201 () Bool)

(assert (=> start!73696 (= tp!51337 b_and!24201)))

(declare-fun b!863525 () Bool)

(declare-fun res!586789 () Bool)

(declare-fun e!481074 () Bool)

(assert (=> b!863525 (=> (not res!586789) (not e!481074))))

(declare-datatypes ((array!49656 0))(
  ( (array!49657 (arr!23859 (Array (_ BitVec 32) (_ BitVec 64))) (size!24299 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49656)

(declare-datatypes ((List!16953 0))(
  ( (Nil!16950) (Cons!16949 (h!18080 (_ BitVec 64)) (t!23830 List!16953)) )
))
(declare-fun arrayNoDuplicates!0 (array!49656 (_ BitVec 32) List!16953) Bool)

(assert (=> b!863525 (= res!586789 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16950))))

(declare-fun b!863527 () Bool)

(declare-fun e!481076 () Bool)

(assert (=> b!863527 (= e!481074 e!481076)))

(declare-fun res!586790 () Bool)

(assert (=> b!863527 (=> (not res!586790) (not e!481076))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863527 (= res!586790 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27377 0))(
  ( (V!27378 (val!8421 Int)) )
))
(declare-datatypes ((ValueCell!7934 0))(
  ( (ValueCellFull!7934 (v!10846 V!27377)) (EmptyCell!7934) )
))
(declare-datatypes ((array!49658 0))(
  ( (array!49659 (arr!23860 (Array (_ BitVec 32) ValueCell!7934)) (size!24300 (_ BitVec 32))) )
))
(declare-fun lt!390314 () array!49658)

(declare-fun minValue!654 () V!27377)

(declare-fun zeroValue!654 () V!27377)

(declare-datatypes ((tuple2!11146 0))(
  ( (tuple2!11147 (_1!5584 (_ BitVec 64)) (_2!5584 V!27377)) )
))
(declare-datatypes ((List!16954 0))(
  ( (Nil!16951) (Cons!16950 (h!18081 tuple2!11146) (t!23831 List!16954)) )
))
(declare-datatypes ((ListLongMap!9915 0))(
  ( (ListLongMap!9916 (toList!4973 List!16954)) )
))
(declare-fun lt!390326 () ListLongMap!9915)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2948 (array!49656 array!49658 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) Int) ListLongMap!9915)

(assert (=> b!863527 (= lt!390326 (getCurrentListMapNoExtraKeys!2948 _keys!868 lt!390314 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27377)

(declare-fun _values!688 () array!49658)

(assert (=> b!863527 (= lt!390314 (array!49659 (store (arr!23860 _values!688) i!612 (ValueCellFull!7934 v!557)) (size!24300 _values!688)))))

(declare-fun lt!390316 () ListLongMap!9915)

(assert (=> b!863527 (= lt!390316 (getCurrentListMapNoExtraKeys!2948 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863528 () Bool)

(declare-fun res!586783 () Bool)

(assert (=> b!863528 (=> (not res!586783) (not e!481074))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!863528 (= res!586783 (and (= (select (arr!23859 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863529 () Bool)

(declare-fun e!481079 () Bool)

(assert (=> b!863529 (= e!481079 true)))

(declare-fun lt!390327 () ListLongMap!9915)

(declare-fun lt!390320 () tuple2!11146)

(declare-fun lt!390323 () ListLongMap!9915)

(declare-fun lt!390313 () tuple2!11146)

(declare-fun +!2322 (ListLongMap!9915 tuple2!11146) ListLongMap!9915)

(assert (=> b!863529 (= lt!390323 (+!2322 (+!2322 lt!390327 lt!390313) lt!390320))))

(declare-fun lt!390315 () V!27377)

(declare-datatypes ((Unit!29519 0))(
  ( (Unit!29520) )
))
(declare-fun lt!390328 () Unit!29519)

(declare-fun addCommutativeForDiffKeys!495 (ListLongMap!9915 (_ BitVec 64) V!27377 (_ BitVec 64) V!27377) Unit!29519)

(assert (=> b!863529 (= lt!390328 (addCommutativeForDiffKeys!495 lt!390327 k!854 v!557 (select (arr!23859 _keys!868) from!1053) lt!390315))))

(declare-fun mapIsEmpty!26720 () Bool)

(declare-fun mapRes!26720 () Bool)

(assert (=> mapIsEmpty!26720 mapRes!26720))

(declare-fun b!863530 () Bool)

(declare-fun res!586781 () Bool)

(assert (=> b!863530 (=> (not res!586781) (not e!481074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49656 (_ BitVec 32)) Bool)

(assert (=> b!863530 (= res!586781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863531 () Bool)

(declare-fun e!481073 () Unit!29519)

(declare-fun Unit!29521 () Unit!29519)

(assert (=> b!863531 (= e!481073 Unit!29521)))

(declare-fun lt!390324 () Unit!29519)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49656 (_ BitVec 32) (_ BitVec 32)) Unit!29519)

(assert (=> b!863531 (= lt!390324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863531 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16950)))

(declare-fun lt!390317 () Unit!29519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29519)

(assert (=> b!863531 (= lt!390317 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863531 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390325 () Unit!29519)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49656 (_ BitVec 64) (_ BitVec 32) List!16953) Unit!29519)

(assert (=> b!863531 (= lt!390325 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16950))))

(assert (=> b!863531 false))

(declare-fun b!863532 () Bool)

(declare-fun res!586780 () Bool)

(assert (=> b!863532 (=> (not res!586780) (not e!481074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863532 (= res!586780 (validMask!0 mask!1196))))

(declare-fun b!863533 () Bool)

(declare-fun e!481077 () Bool)

(assert (=> b!863533 (= e!481076 (not e!481077))))

(declare-fun res!586787 () Bool)

(assert (=> b!863533 (=> res!586787 e!481077)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863533 (= res!586787 (not (validKeyInArray!0 (select (arr!23859 _keys!868) from!1053))))))

(declare-fun lt!390322 () ListLongMap!9915)

(declare-fun lt!390319 () ListLongMap!9915)

(assert (=> b!863533 (= lt!390322 lt!390319)))

(assert (=> b!863533 (= lt!390319 (+!2322 lt!390327 lt!390320))))

(assert (=> b!863533 (= lt!390322 (getCurrentListMapNoExtraKeys!2948 _keys!868 lt!390314 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863533 (= lt!390320 (tuple2!11147 k!854 v!557))))

(assert (=> b!863533 (= lt!390327 (getCurrentListMapNoExtraKeys!2948 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390321 () Unit!29519)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 (array!49656 array!49658 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) (_ BitVec 64) V!27377 (_ BitVec 32) Int) Unit!29519)

(assert (=> b!863533 (= lt!390321 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863534 () Bool)

(declare-fun res!586788 () Bool)

(assert (=> b!863534 (=> (not res!586788) (not e!481074))))

(assert (=> b!863534 (= res!586788 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24299 _keys!868))))))

(declare-fun b!863535 () Bool)

(declare-fun res!586785 () Bool)

(assert (=> b!863535 (=> (not res!586785) (not e!481074))))

(assert (=> b!863535 (= res!586785 (and (= (size!24300 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24299 _keys!868) (size!24300 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863536 () Bool)

(declare-fun Unit!29522 () Unit!29519)

(assert (=> b!863536 (= e!481073 Unit!29522)))

(declare-fun b!863537 () Bool)

(declare-fun e!481078 () Bool)

(declare-fun tp_is_empty!16747 () Bool)

(assert (=> b!863537 (= e!481078 tp_is_empty!16747)))

(declare-fun mapNonEmpty!26720 () Bool)

(declare-fun tp!51336 () Bool)

(assert (=> mapNonEmpty!26720 (= mapRes!26720 (and tp!51336 e!481078))))

(declare-fun mapRest!26720 () (Array (_ BitVec 32) ValueCell!7934))

(declare-fun mapValue!26720 () ValueCell!7934)

(declare-fun mapKey!26720 () (_ BitVec 32))

(assert (=> mapNonEmpty!26720 (= (arr!23860 _values!688) (store mapRest!26720 mapKey!26720 mapValue!26720))))

(declare-fun b!863538 () Bool)

(declare-fun e!481075 () Bool)

(assert (=> b!863538 (= e!481075 tp_is_empty!16747)))

(declare-fun b!863539 () Bool)

(declare-fun res!586782 () Bool)

(assert (=> b!863539 (=> (not res!586782) (not e!481074))))

(assert (=> b!863539 (= res!586782 (validKeyInArray!0 k!854))))

(declare-fun b!863540 () Bool)

(declare-fun e!481081 () Bool)

(assert (=> b!863540 (= e!481081 (and e!481075 mapRes!26720))))

(declare-fun condMapEmpty!26720 () Bool)

(declare-fun mapDefault!26720 () ValueCell!7934)

