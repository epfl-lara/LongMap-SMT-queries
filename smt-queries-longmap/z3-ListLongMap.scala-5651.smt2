; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73692 () Bool)

(assert start!73692)

(declare-fun b_free!14607 () Bool)

(declare-fun b_next!14607 () Bool)

(assert (=> start!73692 (= b_free!14607 (not b_next!14607))))

(declare-fun tp!51324 () Bool)

(declare-fun b_and!24193 () Bool)

(assert (=> start!73692 (= tp!51324 b_and!24193)))

(declare-fun b!863425 () Bool)

(declare-datatypes ((Unit!29513 0))(
  ( (Unit!29514) )
))
(declare-fun e!481025 () Unit!29513)

(declare-fun Unit!29515 () Unit!29513)

(assert (=> b!863425 (= e!481025 Unit!29515)))

(declare-fun lt!390218 () Unit!29513)

(declare-datatypes ((array!49648 0))(
  ( (array!49649 (arr!23855 (Array (_ BitVec 32) (_ BitVec 64))) (size!24295 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49648)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49648 (_ BitVec 32) (_ BitVec 32)) Unit!29513)

(assert (=> b!863425 (= lt!390218 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16950 0))(
  ( (Nil!16947) (Cons!16946 (h!18077 (_ BitVec 64)) (t!23823 List!16950)) )
))
(declare-fun arrayNoDuplicates!0 (array!49648 (_ BitVec 32) List!16950) Bool)

(assert (=> b!863425 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16947)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390227 () Unit!29513)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29513)

(assert (=> b!863425 (= lt!390227 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863425 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390223 () Unit!29513)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49648 (_ BitVec 64) (_ BitVec 32) List!16950) Unit!29513)

(assert (=> b!863425 (= lt!390223 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16947))))

(assert (=> b!863425 false))

(declare-fun b!863426 () Bool)

(declare-fun e!481019 () Bool)

(declare-fun tp_is_empty!16743 () Bool)

(assert (=> b!863426 (= e!481019 tp_is_empty!16743)))

(declare-fun b!863427 () Bool)

(declare-fun e!481023 () Bool)

(declare-fun e!481024 () Bool)

(assert (=> b!863427 (= e!481023 e!481024)))

(declare-fun res!586714 () Bool)

(assert (=> b!863427 (=> (not res!586714) (not e!481024))))

(assert (=> b!863427 (= res!586714 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27371 0))(
  ( (V!27372 (val!8419 Int)) )
))
(declare-datatypes ((ValueCell!7932 0))(
  ( (ValueCellFull!7932 (v!10844 V!27371)) (EmptyCell!7932) )
))
(declare-datatypes ((array!49650 0))(
  ( (array!49651 (arr!23856 (Array (_ BitVec 32) ValueCell!7932)) (size!24296 (_ BitVec 32))) )
))
(declare-fun lt!390217 () array!49650)

(declare-fun minValue!654 () V!27371)

(declare-fun zeroValue!654 () V!27371)

(declare-datatypes ((tuple2!11142 0))(
  ( (tuple2!11143 (_1!5582 (_ BitVec 64)) (_2!5582 V!27371)) )
))
(declare-datatypes ((List!16951 0))(
  ( (Nil!16948) (Cons!16947 (h!18078 tuple2!11142) (t!23824 List!16951)) )
))
(declare-datatypes ((ListLongMap!9911 0))(
  ( (ListLongMap!9912 (toList!4971 List!16951)) )
))
(declare-fun lt!390228 () ListLongMap!9911)

(declare-fun getCurrentListMapNoExtraKeys!2946 (array!49648 array!49650 (_ BitVec 32) (_ BitVec 32) V!27371 V!27371 (_ BitVec 32) Int) ListLongMap!9911)

(assert (=> b!863427 (= lt!390228 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!390217 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27371)

(declare-fun _values!688 () array!49650)

(assert (=> b!863427 (= lt!390217 (array!49651 (store (arr!23856 _values!688) i!612 (ValueCellFull!7932 v!557)) (size!24296 _values!688)))))

(declare-fun lt!390219 () ListLongMap!9911)

(assert (=> b!863427 (= lt!390219 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863428 () Bool)

(declare-fun Unit!29516 () Unit!29513)

(assert (=> b!863428 (= e!481025 Unit!29516)))

(declare-fun b!863429 () Bool)

(declare-fun res!586719 () Bool)

(assert (=> b!863429 (=> (not res!586719) (not e!481023))))

(assert (=> b!863429 (= res!586719 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16947))))

(declare-fun b!863431 () Bool)

(declare-fun res!586724 () Bool)

(assert (=> b!863431 (=> (not res!586724) (not e!481023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863431 (= res!586724 (validMask!0 mask!1196))))

(declare-fun b!863432 () Bool)

(declare-fun res!586721 () Bool)

(assert (=> b!863432 (=> (not res!586721) (not e!481023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49648 (_ BitVec 32)) Bool)

(assert (=> b!863432 (= res!586721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863433 () Bool)

(declare-fun res!586722 () Bool)

(assert (=> b!863433 (=> (not res!586722) (not e!481023))))

(assert (=> b!863433 (= res!586722 (and (= (size!24296 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24295 _keys!868) (size!24296 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863434 () Bool)

(declare-fun res!586715 () Bool)

(assert (=> b!863434 (=> (not res!586715) (not e!481023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863434 (= res!586715 (validKeyInArray!0 k0!854))))

(declare-fun b!863435 () Bool)

(declare-fun e!481022 () Bool)

(declare-fun mapRes!26714 () Bool)

(assert (=> b!863435 (= e!481022 (and e!481019 mapRes!26714))))

(declare-fun condMapEmpty!26714 () Bool)

(declare-fun mapDefault!26714 () ValueCell!7932)

(assert (=> b!863435 (= condMapEmpty!26714 (= (arr!23856 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7932)) mapDefault!26714)))))

(declare-fun b!863436 () Bool)

(declare-fun e!481027 () Bool)

(assert (=> b!863436 (= e!481024 (not e!481027))))

(declare-fun res!586718 () Bool)

(assert (=> b!863436 (=> res!586718 e!481027)))

(assert (=> b!863436 (= res!586718 (not (validKeyInArray!0 (select (arr!23855 _keys!868) from!1053))))))

(declare-fun lt!390225 () ListLongMap!9911)

(declare-fun lt!390231 () ListLongMap!9911)

(assert (=> b!863436 (= lt!390225 lt!390231)))

(declare-fun lt!390222 () ListLongMap!9911)

(declare-fun lt!390229 () tuple2!11142)

(declare-fun +!2320 (ListLongMap!9911 tuple2!11142) ListLongMap!9911)

(assert (=> b!863436 (= lt!390231 (+!2320 lt!390222 lt!390229))))

(assert (=> b!863436 (= lt!390225 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!390217 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863436 (= lt!390229 (tuple2!11143 k0!854 v!557))))

(assert (=> b!863436 (= lt!390222 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390221 () Unit!29513)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!528 (array!49648 array!49650 (_ BitVec 32) (_ BitVec 32) V!27371 V!27371 (_ BitVec 32) (_ BitVec 64) V!27371 (_ BitVec 32) Int) Unit!29513)

(assert (=> b!863436 (= lt!390221 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!528 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26714 () Bool)

(declare-fun tp!51325 () Bool)

(declare-fun e!481026 () Bool)

(assert (=> mapNonEmpty!26714 (= mapRes!26714 (and tp!51325 e!481026))))

(declare-fun mapValue!26714 () ValueCell!7932)

(declare-fun mapKey!26714 () (_ BitVec 32))

(declare-fun mapRest!26714 () (Array (_ BitVec 32) ValueCell!7932))

(assert (=> mapNonEmpty!26714 (= (arr!23856 _values!688) (store mapRest!26714 mapKey!26714 mapValue!26714))))

(declare-fun b!863437 () Bool)

(declare-fun e!481020 () Bool)

(assert (=> b!863437 (= e!481027 e!481020)))

(declare-fun res!586716 () Bool)

(assert (=> b!863437 (=> res!586716 e!481020)))

(assert (=> b!863437 (= res!586716 (= k0!854 (select (arr!23855 _keys!868) from!1053)))))

(assert (=> b!863437 (not (= (select (arr!23855 _keys!868) from!1053) k0!854))))

(declare-fun lt!390226 () Unit!29513)

(assert (=> b!863437 (= lt!390226 e!481025)))

(declare-fun c!92131 () Bool)

(assert (=> b!863437 (= c!92131 (= (select (arr!23855 _keys!868) from!1053) k0!854))))

(declare-fun lt!390220 () ListLongMap!9911)

(assert (=> b!863437 (= lt!390228 lt!390220)))

(declare-fun lt!390224 () tuple2!11142)

(assert (=> b!863437 (= lt!390220 (+!2320 lt!390231 lt!390224))))

(declare-fun lt!390232 () V!27371)

(assert (=> b!863437 (= lt!390224 (tuple2!11143 (select (arr!23855 _keys!868) from!1053) lt!390232))))

(declare-fun get!12596 (ValueCell!7932 V!27371) V!27371)

(declare-fun dynLambda!1150 (Int (_ BitVec 64)) V!27371)

(assert (=> b!863437 (= lt!390232 (get!12596 (select (arr!23856 _values!688) from!1053) (dynLambda!1150 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863438 () Bool)

(declare-fun res!586717 () Bool)

(assert (=> b!863438 (=> (not res!586717) (not e!481023))))

(assert (=> b!863438 (= res!586717 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24295 _keys!868))))))

(declare-fun b!863439 () Bool)

(assert (=> b!863439 (= e!481020 true)))

(assert (=> b!863439 (= lt!390220 (+!2320 (+!2320 lt!390222 lt!390224) lt!390229))))

(declare-fun lt!390230 () Unit!29513)

(declare-fun addCommutativeForDiffKeys!494 (ListLongMap!9911 (_ BitVec 64) V!27371 (_ BitVec 64) V!27371) Unit!29513)

(assert (=> b!863439 (= lt!390230 (addCommutativeForDiffKeys!494 lt!390222 k0!854 v!557 (select (arr!23855 _keys!868) from!1053) lt!390232))))

(declare-fun b!863430 () Bool)

(declare-fun res!586723 () Bool)

(assert (=> b!863430 (=> (not res!586723) (not e!481023))))

(assert (=> b!863430 (= res!586723 (and (= (select (arr!23855 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!586720 () Bool)

(assert (=> start!73692 (=> (not res!586720) (not e!481023))))

(assert (=> start!73692 (= res!586720 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24295 _keys!868))))))

(assert (=> start!73692 e!481023))

(assert (=> start!73692 tp_is_empty!16743))

(assert (=> start!73692 true))

(assert (=> start!73692 tp!51324))

(declare-fun array_inv!18872 (array!49648) Bool)

(assert (=> start!73692 (array_inv!18872 _keys!868)))

(declare-fun array_inv!18873 (array!49650) Bool)

(assert (=> start!73692 (and (array_inv!18873 _values!688) e!481022)))

(declare-fun b!863440 () Bool)

(assert (=> b!863440 (= e!481026 tp_is_empty!16743)))

(declare-fun mapIsEmpty!26714 () Bool)

(assert (=> mapIsEmpty!26714 mapRes!26714))

(assert (= (and start!73692 res!586720) b!863431))

(assert (= (and b!863431 res!586724) b!863433))

(assert (= (and b!863433 res!586722) b!863432))

(assert (= (and b!863432 res!586721) b!863429))

(assert (= (and b!863429 res!586719) b!863438))

(assert (= (and b!863438 res!586717) b!863434))

(assert (= (and b!863434 res!586715) b!863430))

(assert (= (and b!863430 res!586723) b!863427))

(assert (= (and b!863427 res!586714) b!863436))

(assert (= (and b!863436 (not res!586718)) b!863437))

(assert (= (and b!863437 c!92131) b!863425))

(assert (= (and b!863437 (not c!92131)) b!863428))

(assert (= (and b!863437 (not res!586716)) b!863439))

(assert (= (and b!863435 condMapEmpty!26714) mapIsEmpty!26714))

(assert (= (and b!863435 (not condMapEmpty!26714)) mapNonEmpty!26714))

(get-info :version)

(assert (= (and mapNonEmpty!26714 ((_ is ValueCellFull!7932) mapValue!26714)) b!863440))

(assert (= (and b!863435 ((_ is ValueCellFull!7932) mapDefault!26714)) b!863426))

(assert (= start!73692 b!863435))

(declare-fun b_lambda!11959 () Bool)

(assert (=> (not b_lambda!11959) (not b!863437)))

(declare-fun t!23822 () Bool)

(declare-fun tb!4729 () Bool)

(assert (=> (and start!73692 (= defaultEntry!696 defaultEntry!696) t!23822) tb!4729))

(declare-fun result!9069 () Bool)

(assert (=> tb!4729 (= result!9069 tp_is_empty!16743)))

(assert (=> b!863437 t!23822))

(declare-fun b_and!24195 () Bool)

(assert (= b_and!24193 (and (=> t!23822 result!9069) b_and!24195)))

(declare-fun m!804603 () Bool)

(assert (=> b!863427 m!804603))

(declare-fun m!804605 () Bool)

(assert (=> b!863427 m!804605))

(declare-fun m!804607 () Bool)

(assert (=> b!863427 m!804607))

(declare-fun m!804609 () Bool)

(assert (=> b!863436 m!804609))

(declare-fun m!804611 () Bool)

(assert (=> b!863436 m!804611))

(declare-fun m!804613 () Bool)

(assert (=> b!863436 m!804613))

(declare-fun m!804615 () Bool)

(assert (=> b!863436 m!804615))

(assert (=> b!863436 m!804613))

(declare-fun m!804617 () Bool)

(assert (=> b!863436 m!804617))

(declare-fun m!804619 () Bool)

(assert (=> b!863436 m!804619))

(declare-fun m!804621 () Bool)

(assert (=> b!863437 m!804621))

(assert (=> b!863437 m!804613))

(declare-fun m!804623 () Bool)

(assert (=> b!863437 m!804623))

(assert (=> b!863437 m!804621))

(assert (=> b!863437 m!804623))

(declare-fun m!804625 () Bool)

(assert (=> b!863437 m!804625))

(declare-fun m!804627 () Bool)

(assert (=> b!863437 m!804627))

(declare-fun m!804629 () Bool)

(assert (=> b!863430 m!804629))

(declare-fun m!804631 () Bool)

(assert (=> b!863425 m!804631))

(declare-fun m!804633 () Bool)

(assert (=> b!863425 m!804633))

(declare-fun m!804635 () Bool)

(assert (=> b!863425 m!804635))

(declare-fun m!804637 () Bool)

(assert (=> b!863425 m!804637))

(declare-fun m!804639 () Bool)

(assert (=> b!863425 m!804639))

(declare-fun m!804641 () Bool)

(assert (=> start!73692 m!804641))

(declare-fun m!804643 () Bool)

(assert (=> start!73692 m!804643))

(declare-fun m!804645 () Bool)

(assert (=> mapNonEmpty!26714 m!804645))

(declare-fun m!804647 () Bool)

(assert (=> b!863439 m!804647))

(assert (=> b!863439 m!804647))

(declare-fun m!804649 () Bool)

(assert (=> b!863439 m!804649))

(assert (=> b!863439 m!804613))

(assert (=> b!863439 m!804613))

(declare-fun m!804651 () Bool)

(assert (=> b!863439 m!804651))

(declare-fun m!804653 () Bool)

(assert (=> b!863434 m!804653))

(declare-fun m!804655 () Bool)

(assert (=> b!863429 m!804655))

(declare-fun m!804657 () Bool)

(assert (=> b!863431 m!804657))

(declare-fun m!804659 () Bool)

(assert (=> b!863432 m!804659))

(check-sat (not b_next!14607) tp_is_empty!16743 (not b!863425) b_and!24195 (not b!863434) (not b!863436) (not mapNonEmpty!26714) (not b!863437) (not start!73692) (not b!863429) (not b_lambda!11959) (not b!863431) (not b!863432) (not b!863439) (not b!863427))
(check-sat b_and!24195 (not b_next!14607))
