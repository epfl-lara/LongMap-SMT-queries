; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73822 () Bool)

(assert start!73822)

(declare-fun b_free!14569 () Bool)

(declare-fun b_next!14569 () Bool)

(assert (=> start!73822 (= b_free!14569 (not b_next!14569))))

(declare-fun tp!51212 () Bool)

(declare-fun b_and!24127 () Bool)

(assert (=> start!73822 (= tp!51212 b_and!24127)))

(declare-fun b!863379 () Bool)

(declare-fun res!586436 () Bool)

(declare-fun e!481092 () Bool)

(assert (=> b!863379 (=> (not res!586436) (not e!481092))))

(declare-datatypes ((array!49629 0))(
  ( (array!49630 (arr!23841 (Array (_ BitVec 32) (_ BitVec 64))) (size!24282 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49629)

(declare-datatypes ((List!16873 0))(
  ( (Nil!16870) (Cons!16869 (h!18006 (_ BitVec 64)) (t!23700 List!16873)) )
))
(declare-fun arrayNoDuplicates!0 (array!49629 (_ BitVec 32) List!16873) Bool)

(assert (=> b!863379 (= res!586436 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16870))))

(declare-fun b!863380 () Bool)

(declare-fun res!586435 () Bool)

(assert (=> b!863380 (=> (not res!586435) (not e!481092))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27321 0))(
  ( (V!27322 (val!8400 Int)) )
))
(declare-datatypes ((ValueCell!7913 0))(
  ( (ValueCellFull!7913 (v!10825 V!27321)) (EmptyCell!7913) )
))
(declare-datatypes ((array!49631 0))(
  ( (array!49632 (arr!23842 (Array (_ BitVec 32) ValueCell!7913)) (size!24283 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49631)

(assert (=> b!863380 (= res!586435 (and (= (size!24283 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24282 _keys!868) (size!24283 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863381 () Bool)

(declare-fun e!481096 () Bool)

(assert (=> b!863381 (= e!481092 e!481096)))

(declare-fun res!586432 () Bool)

(assert (=> b!863381 (=> (not res!586432) (not e!481096))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863381 (= res!586432 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389668 () array!49631)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11036 0))(
  ( (tuple2!11037 (_1!5529 (_ BitVec 64)) (_2!5529 V!27321)) )
))
(declare-datatypes ((List!16874 0))(
  ( (Nil!16871) (Cons!16870 (h!18007 tuple2!11036) (t!23701 List!16874)) )
))
(declare-datatypes ((ListLongMap!9807 0))(
  ( (ListLongMap!9808 (toList!4919 List!16874)) )
))
(declare-fun lt!389677 () ListLongMap!9807)

(declare-fun minValue!654 () V!27321)

(declare-fun zeroValue!654 () V!27321)

(declare-fun getCurrentListMapNoExtraKeys!2970 (array!49629 array!49631 (_ BitVec 32) (_ BitVec 32) V!27321 V!27321 (_ BitVec 32) Int) ListLongMap!9807)

(assert (=> b!863381 (= lt!389677 (getCurrentListMapNoExtraKeys!2970 _keys!868 lt!389668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27321)

(assert (=> b!863381 (= lt!389668 (array!49632 (store (arr!23842 _values!688) i!612 (ValueCellFull!7913 v!557)) (size!24283 _values!688)))))

(declare-fun lt!389667 () ListLongMap!9807)

(assert (=> b!863381 (= lt!389667 (getCurrentListMapNoExtraKeys!2970 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863382 () Bool)

(declare-fun e!481094 () Bool)

(assert (=> b!863382 (= e!481094 true)))

(declare-fun lt!389675 () ListLongMap!9807)

(declare-fun lt!389680 () tuple2!11036)

(declare-fun lt!389678 () tuple2!11036)

(declare-fun lt!389681 () ListLongMap!9807)

(declare-fun +!2323 (ListLongMap!9807 tuple2!11036) ListLongMap!9807)

(assert (=> b!863382 (= lt!389681 (+!2323 (+!2323 lt!389675 lt!389680) lt!389678))))

(declare-datatypes ((Unit!29450 0))(
  ( (Unit!29451) )
))
(declare-fun lt!389679 () Unit!29450)

(declare-fun lt!389673 () V!27321)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!477 (ListLongMap!9807 (_ BitVec 64) V!27321 (_ BitVec 64) V!27321) Unit!29450)

(assert (=> b!863382 (= lt!389679 (addCommutativeForDiffKeys!477 lt!389675 k0!854 v!557 (select (arr!23841 _keys!868) from!1053) lt!389673))))

(declare-fun b!863383 () Bool)

(declare-fun e!481089 () Unit!29450)

(declare-fun Unit!29452 () Unit!29450)

(assert (=> b!863383 (= e!481089 Unit!29452)))

(declare-fun b!863384 () Bool)

(declare-fun e!481093 () Bool)

(declare-fun e!481088 () Bool)

(declare-fun mapRes!26657 () Bool)

(assert (=> b!863384 (= e!481093 (and e!481088 mapRes!26657))))

(declare-fun condMapEmpty!26657 () Bool)

(declare-fun mapDefault!26657 () ValueCell!7913)

(assert (=> b!863384 (= condMapEmpty!26657 (= (arr!23842 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7913)) mapDefault!26657)))))

(declare-fun b!863385 () Bool)

(declare-fun res!586434 () Bool)

(assert (=> b!863385 (=> (not res!586434) (not e!481092))))

(assert (=> b!863385 (= res!586434 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24282 _keys!868))))))

(declare-fun b!863386 () Bool)

(declare-fun res!586439 () Bool)

(assert (=> b!863386 (=> (not res!586439) (not e!481092))))

(assert (=> b!863386 (= res!586439 (and (= (select (arr!23841 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863387 () Bool)

(declare-fun res!586441 () Bool)

(assert (=> b!863387 (=> (not res!586441) (not e!481092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863387 (= res!586441 (validMask!0 mask!1196))))

(declare-fun b!863388 () Bool)

(declare-fun e!481091 () Bool)

(declare-fun tp_is_empty!16705 () Bool)

(assert (=> b!863388 (= e!481091 tp_is_empty!16705)))

(declare-fun res!586438 () Bool)

(assert (=> start!73822 (=> (not res!586438) (not e!481092))))

(assert (=> start!73822 (= res!586438 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24282 _keys!868))))))

(assert (=> start!73822 e!481092))

(assert (=> start!73822 tp_is_empty!16705))

(assert (=> start!73822 true))

(assert (=> start!73822 tp!51212))

(declare-fun array_inv!18912 (array!49629) Bool)

(assert (=> start!73822 (array_inv!18912 _keys!868)))

(declare-fun array_inv!18913 (array!49631) Bool)

(assert (=> start!73822 (and (array_inv!18913 _values!688) e!481093)))

(declare-fun b!863378 () Bool)

(declare-fun e!481090 () Bool)

(assert (=> b!863378 (= e!481096 (not e!481090))))

(declare-fun res!586437 () Bool)

(assert (=> b!863378 (=> res!586437 e!481090)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863378 (= res!586437 (not (validKeyInArray!0 (select (arr!23841 _keys!868) from!1053))))))

(declare-fun lt!389674 () ListLongMap!9807)

(declare-fun lt!389666 () ListLongMap!9807)

(assert (=> b!863378 (= lt!389674 lt!389666)))

(assert (=> b!863378 (= lt!389666 (+!2323 lt!389675 lt!389678))))

(assert (=> b!863378 (= lt!389674 (getCurrentListMapNoExtraKeys!2970 _keys!868 lt!389668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863378 (= lt!389678 (tuple2!11037 k0!854 v!557))))

(assert (=> b!863378 (= lt!389675 (getCurrentListMapNoExtraKeys!2970 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389670 () Unit!29450)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 (array!49629 array!49631 (_ BitVec 32) (_ BitVec 32) V!27321 V!27321 (_ BitVec 32) (_ BitVec 64) V!27321 (_ BitVec 32) Int) Unit!29450)

(assert (=> b!863378 (= lt!389670 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863389 () Bool)

(declare-fun Unit!29453 () Unit!29450)

(assert (=> b!863389 (= e!481089 Unit!29453)))

(declare-fun lt!389672 () Unit!29450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49629 (_ BitVec 32) (_ BitVec 32)) Unit!29450)

(assert (=> b!863389 (= lt!389672 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863389 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16870)))

(declare-fun lt!389669 () Unit!29450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29450)

(assert (=> b!863389 (= lt!389669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863389 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389676 () Unit!29450)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49629 (_ BitVec 64) (_ BitVec 32) List!16873) Unit!29450)

(assert (=> b!863389 (= lt!389676 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16870))))

(assert (=> b!863389 false))

(declare-fun mapIsEmpty!26657 () Bool)

(assert (=> mapIsEmpty!26657 mapRes!26657))

(declare-fun b!863390 () Bool)

(assert (=> b!863390 (= e!481088 tp_is_empty!16705)))

(declare-fun b!863391 () Bool)

(assert (=> b!863391 (= e!481090 e!481094)))

(declare-fun res!586431 () Bool)

(assert (=> b!863391 (=> res!586431 e!481094)))

(assert (=> b!863391 (= res!586431 (= k0!854 (select (arr!23841 _keys!868) from!1053)))))

(assert (=> b!863391 (not (= (select (arr!23841 _keys!868) from!1053) k0!854))))

(declare-fun lt!389671 () Unit!29450)

(assert (=> b!863391 (= lt!389671 e!481089)))

(declare-fun c!92356 () Bool)

(assert (=> b!863391 (= c!92356 (= (select (arr!23841 _keys!868) from!1053) k0!854))))

(assert (=> b!863391 (= lt!389677 lt!389681)))

(assert (=> b!863391 (= lt!389681 (+!2323 lt!389666 lt!389680))))

(assert (=> b!863391 (= lt!389680 (tuple2!11037 (select (arr!23841 _keys!868) from!1053) lt!389673))))

(declare-fun get!12590 (ValueCell!7913 V!27321) V!27321)

(declare-fun dynLambda!1150 (Int (_ BitVec 64)) V!27321)

(assert (=> b!863391 (= lt!389673 (get!12590 (select (arr!23842 _values!688) from!1053) (dynLambda!1150 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26657 () Bool)

(declare-fun tp!51211 () Bool)

(assert (=> mapNonEmpty!26657 (= mapRes!26657 (and tp!51211 e!481091))))

(declare-fun mapValue!26657 () ValueCell!7913)

(declare-fun mapRest!26657 () (Array (_ BitVec 32) ValueCell!7913))

(declare-fun mapKey!26657 () (_ BitVec 32))

(assert (=> mapNonEmpty!26657 (= (arr!23842 _values!688) (store mapRest!26657 mapKey!26657 mapValue!26657))))

(declare-fun b!863392 () Bool)

(declare-fun res!586440 () Bool)

(assert (=> b!863392 (=> (not res!586440) (not e!481092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49629 (_ BitVec 32)) Bool)

(assert (=> b!863392 (= res!586440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863393 () Bool)

(declare-fun res!586433 () Bool)

(assert (=> b!863393 (=> (not res!586433) (not e!481092))))

(assert (=> b!863393 (= res!586433 (validKeyInArray!0 k0!854))))

(assert (= (and start!73822 res!586438) b!863387))

(assert (= (and b!863387 res!586441) b!863380))

(assert (= (and b!863380 res!586435) b!863392))

(assert (= (and b!863392 res!586440) b!863379))

(assert (= (and b!863379 res!586436) b!863385))

(assert (= (and b!863385 res!586434) b!863393))

(assert (= (and b!863393 res!586433) b!863386))

(assert (= (and b!863386 res!586439) b!863381))

(assert (= (and b!863381 res!586432) b!863378))

(assert (= (and b!863378 (not res!586437)) b!863391))

(assert (= (and b!863391 c!92356) b!863389))

(assert (= (and b!863391 (not c!92356)) b!863383))

(assert (= (and b!863391 (not res!586431)) b!863382))

(assert (= (and b!863384 condMapEmpty!26657) mapIsEmpty!26657))

(assert (= (and b!863384 (not condMapEmpty!26657)) mapNonEmpty!26657))

(get-info :version)

(assert (= (and mapNonEmpty!26657 ((_ is ValueCellFull!7913) mapValue!26657)) b!863388))

(assert (= (and b!863384 ((_ is ValueCellFull!7913) mapDefault!26657)) b!863390))

(assert (= start!73822 b!863384))

(declare-fun b_lambda!11935 () Bool)

(assert (=> (not b_lambda!11935) (not b!863391)))

(declare-fun t!23699 () Bool)

(declare-fun tb!4683 () Bool)

(assert (=> (and start!73822 (= defaultEntry!696 defaultEntry!696) t!23699) tb!4683))

(declare-fun result!8985 () Bool)

(assert (=> tb!4683 (= result!8985 tp_is_empty!16705)))

(assert (=> b!863391 t!23699))

(declare-fun b_and!24129 () Bool)

(assert (= b_and!24127 (and (=> t!23699 result!8985) b_and!24129)))

(declare-fun m!804791 () Bool)

(assert (=> start!73822 m!804791))

(declare-fun m!804793 () Bool)

(assert (=> start!73822 m!804793))

(declare-fun m!804795 () Bool)

(assert (=> b!863387 m!804795))

(declare-fun m!804797 () Bool)

(assert (=> b!863392 m!804797))

(declare-fun m!804799 () Bool)

(assert (=> b!863378 m!804799))

(declare-fun m!804801 () Bool)

(assert (=> b!863378 m!804801))

(assert (=> b!863378 m!804799))

(declare-fun m!804803 () Bool)

(assert (=> b!863378 m!804803))

(declare-fun m!804805 () Bool)

(assert (=> b!863378 m!804805))

(declare-fun m!804807 () Bool)

(assert (=> b!863378 m!804807))

(declare-fun m!804809 () Bool)

(assert (=> b!863378 m!804809))

(declare-fun m!804811 () Bool)

(assert (=> b!863382 m!804811))

(assert (=> b!863382 m!804811))

(declare-fun m!804813 () Bool)

(assert (=> b!863382 m!804813))

(assert (=> b!863382 m!804799))

(assert (=> b!863382 m!804799))

(declare-fun m!804815 () Bool)

(assert (=> b!863382 m!804815))

(declare-fun m!804817 () Bool)

(assert (=> b!863391 m!804817))

(declare-fun m!804819 () Bool)

(assert (=> b!863391 m!804819))

(declare-fun m!804821 () Bool)

(assert (=> b!863391 m!804821))

(declare-fun m!804823 () Bool)

(assert (=> b!863391 m!804823))

(assert (=> b!863391 m!804819))

(assert (=> b!863391 m!804799))

(assert (=> b!863391 m!804821))

(declare-fun m!804825 () Bool)

(assert (=> b!863379 m!804825))

(declare-fun m!804827 () Bool)

(assert (=> b!863389 m!804827))

(declare-fun m!804829 () Bool)

(assert (=> b!863389 m!804829))

(declare-fun m!804831 () Bool)

(assert (=> b!863389 m!804831))

(declare-fun m!804833 () Bool)

(assert (=> b!863389 m!804833))

(declare-fun m!804835 () Bool)

(assert (=> b!863389 m!804835))

(declare-fun m!804837 () Bool)

(assert (=> b!863381 m!804837))

(declare-fun m!804839 () Bool)

(assert (=> b!863381 m!804839))

(declare-fun m!804841 () Bool)

(assert (=> b!863381 m!804841))

(declare-fun m!804843 () Bool)

(assert (=> b!863386 m!804843))

(declare-fun m!804845 () Bool)

(assert (=> mapNonEmpty!26657 m!804845))

(declare-fun m!804847 () Bool)

(assert (=> b!863393 m!804847))

(check-sat (not b!863389) (not b!863393) (not b!863378) (not b_lambda!11935) (not start!73822) (not mapNonEmpty!26657) (not b!863379) (not b!863382) tp_is_empty!16705 (not b!863391) (not b_next!14569) (not b!863381) b_and!24129 (not b!863387) (not b!863392))
(check-sat b_and!24129 (not b_next!14569))
