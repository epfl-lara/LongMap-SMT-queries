; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73750 () Bool)

(assert start!73750)

(declare-fun b_free!14497 () Bool)

(declare-fun b_next!14497 () Bool)

(assert (=> start!73750 (= b_free!14497 (not b_next!14497))))

(declare-fun tp!50996 () Bool)

(declare-fun b_and!23983 () Bool)

(assert (=> start!73750 (= tp!50996 b_and!23983)))

(declare-fun b!861666 () Bool)

(declare-fun res!585336 () Bool)

(declare-fun e!480209 () Bool)

(assert (=> b!861666 (=> (not res!585336) (not e!480209))))

(declare-datatypes ((array!49491 0))(
  ( (array!49492 (arr!23772 (Array (_ BitVec 32) (_ BitVec 64))) (size!24213 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49491)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49491 (_ BitVec 32)) Bool)

(assert (=> b!861666 (= res!585336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861667 () Bool)

(declare-fun res!585332 () Bool)

(assert (=> b!861667 (=> (not res!585332) (not e!480209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861667 (= res!585332 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26549 () Bool)

(declare-fun mapRes!26549 () Bool)

(assert (=> mapIsEmpty!26549 mapRes!26549))

(declare-fun res!585331 () Bool)

(assert (=> start!73750 (=> (not res!585331) (not e!480209))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73750 (= res!585331 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24213 _keys!868))))))

(assert (=> start!73750 e!480209))

(declare-fun tp_is_empty!16633 () Bool)

(assert (=> start!73750 tp_is_empty!16633))

(assert (=> start!73750 true))

(assert (=> start!73750 tp!50996))

(declare-fun array_inv!18864 (array!49491) Bool)

(assert (=> start!73750 (array_inv!18864 _keys!868)))

(declare-datatypes ((V!27225 0))(
  ( (V!27226 (val!8364 Int)) )
))
(declare-datatypes ((ValueCell!7877 0))(
  ( (ValueCellFull!7877 (v!10789 V!27225)) (EmptyCell!7877) )
))
(declare-datatypes ((array!49493 0))(
  ( (array!49494 (arr!23773 (Array (_ BitVec 32) ValueCell!7877)) (size!24214 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49493)

(declare-fun e!480210 () Bool)

(declare-fun array_inv!18865 (array!49493) Bool)

(assert (=> start!73750 (and (array_inv!18865 _values!688) e!480210)))

(declare-fun b!861668 () Bool)

(declare-fun e!480204 () Bool)

(assert (=> b!861668 (= e!480210 (and e!480204 mapRes!26549))))

(declare-fun condMapEmpty!26549 () Bool)

(declare-fun mapDefault!26549 () ValueCell!7877)

(assert (=> b!861668 (= condMapEmpty!26549 (= (arr!23773 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7877)) mapDefault!26549)))))

(declare-fun b!861669 () Bool)

(declare-fun res!585333 () Bool)

(assert (=> b!861669 (=> (not res!585333) (not e!480209))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861669 (= res!585333 (validKeyInArray!0 k0!854))))

(declare-fun b!861670 () Bool)

(declare-fun res!585339 () Bool)

(assert (=> b!861670 (=> (not res!585339) (not e!480209))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861670 (= res!585339 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24213 _keys!868))))))

(declare-fun b!861671 () Bool)

(declare-fun e!480207 () Bool)

(assert (=> b!861671 (= e!480207 true)))

(assert (=> b!861671 (not (= (select (arr!23772 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29342 0))(
  ( (Unit!29343) )
))
(declare-fun lt!388386 () Unit!29342)

(declare-fun e!480208 () Unit!29342)

(assert (=> b!861671 (= lt!388386 e!480208)))

(declare-fun c!92248 () Bool)

(assert (=> b!861671 (= c!92248 (= (select (arr!23772 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!10980 0))(
  ( (tuple2!10981 (_1!5501 (_ BitVec 64)) (_2!5501 V!27225)) )
))
(declare-datatypes ((List!16820 0))(
  ( (Nil!16817) (Cons!16816 (h!17953 tuple2!10980) (t!23575 List!16820)) )
))
(declare-datatypes ((ListLongMap!9751 0))(
  ( (ListLongMap!9752 (toList!4891 List!16820)) )
))
(declare-fun lt!388381 () ListLongMap!9751)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388382 () ListLongMap!9751)

(declare-fun +!2295 (ListLongMap!9751 tuple2!10980) ListLongMap!9751)

(declare-fun get!12540 (ValueCell!7877 V!27225) V!27225)

(declare-fun dynLambda!1124 (Int (_ BitVec 64)) V!27225)

(assert (=> b!861671 (= lt!388382 (+!2295 lt!388381 (tuple2!10981 (select (arr!23772 _keys!868) from!1053) (get!12540 (select (arr!23773 _values!688) from!1053) (dynLambda!1124 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861672 () Bool)

(declare-fun e!480211 () Bool)

(assert (=> b!861672 (= e!480209 e!480211)))

(declare-fun res!585335 () Bool)

(assert (=> b!861672 (=> (not res!585335) (not e!480211))))

(assert (=> b!861672 (= res!585335 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27225)

(declare-fun zeroValue!654 () V!27225)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!388383 () array!49493)

(declare-fun getCurrentListMapNoExtraKeys!2944 (array!49491 array!49493 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) Int) ListLongMap!9751)

(assert (=> b!861672 (= lt!388382 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!388383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27225)

(assert (=> b!861672 (= lt!388383 (array!49494 (store (arr!23773 _values!688) i!612 (ValueCellFull!7877 v!557)) (size!24214 _values!688)))))

(declare-fun lt!388385 () ListLongMap!9751)

(assert (=> b!861672 (= lt!388385 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861673 () Bool)

(declare-fun Unit!29344 () Unit!29342)

(assert (=> b!861673 (= e!480208 Unit!29344)))

(declare-fun b!861674 () Bool)

(declare-fun res!585334 () Bool)

(assert (=> b!861674 (=> (not res!585334) (not e!480209))))

(assert (=> b!861674 (= res!585334 (and (= (size!24214 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24213 _keys!868) (size!24214 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861675 () Bool)

(declare-fun Unit!29345 () Unit!29342)

(assert (=> b!861675 (= e!480208 Unit!29345)))

(declare-fun lt!388379 () Unit!29342)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49491 (_ BitVec 32) (_ BitVec 32)) Unit!29342)

(assert (=> b!861675 (= lt!388379 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16821 0))(
  ( (Nil!16818) (Cons!16817 (h!17954 (_ BitVec 64)) (t!23576 List!16821)) )
))
(declare-fun arrayNoDuplicates!0 (array!49491 (_ BitVec 32) List!16821) Bool)

(assert (=> b!861675 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16818)))

(declare-fun lt!388378 () Unit!29342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29342)

(assert (=> b!861675 (= lt!388378 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861675 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388384 () Unit!29342)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49491 (_ BitVec 64) (_ BitVec 32) List!16821) Unit!29342)

(assert (=> b!861675 (= lt!388384 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16818))))

(assert (=> b!861675 false))

(declare-fun b!861676 () Bool)

(declare-fun e!480205 () Bool)

(assert (=> b!861676 (= e!480205 tp_is_empty!16633)))

(declare-fun b!861677 () Bool)

(declare-fun res!585340 () Bool)

(assert (=> b!861677 (=> (not res!585340) (not e!480209))))

(assert (=> b!861677 (= res!585340 (and (= (select (arr!23772 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861678 () Bool)

(assert (=> b!861678 (= e!480204 tp_is_empty!16633)))

(declare-fun b!861679 () Bool)

(assert (=> b!861679 (= e!480211 (not e!480207))))

(declare-fun res!585337 () Bool)

(assert (=> b!861679 (=> res!585337 e!480207)))

(assert (=> b!861679 (= res!585337 (not (validKeyInArray!0 (select (arr!23772 _keys!868) from!1053))))))

(declare-fun lt!388388 () ListLongMap!9751)

(assert (=> b!861679 (= lt!388388 lt!388381)))

(declare-fun lt!388380 () ListLongMap!9751)

(assert (=> b!861679 (= lt!388381 (+!2295 lt!388380 (tuple2!10981 k0!854 v!557)))))

(assert (=> b!861679 (= lt!388388 (getCurrentListMapNoExtraKeys!2944 _keys!868 lt!388383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861679 (= lt!388380 (getCurrentListMapNoExtraKeys!2944 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388387 () Unit!29342)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!486 (array!49491 array!49493 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) (_ BitVec 64) V!27225 (_ BitVec 32) Int) Unit!29342)

(assert (=> b!861679 (= lt!388387 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!486 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26549 () Bool)

(declare-fun tp!50995 () Bool)

(assert (=> mapNonEmpty!26549 (= mapRes!26549 (and tp!50995 e!480205))))

(declare-fun mapValue!26549 () ValueCell!7877)

(declare-fun mapKey!26549 () (_ BitVec 32))

(declare-fun mapRest!26549 () (Array (_ BitVec 32) ValueCell!7877))

(assert (=> mapNonEmpty!26549 (= (arr!23773 _values!688) (store mapRest!26549 mapKey!26549 mapValue!26549))))

(declare-fun b!861680 () Bool)

(declare-fun res!585338 () Bool)

(assert (=> b!861680 (=> (not res!585338) (not e!480209))))

(assert (=> b!861680 (= res!585338 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16818))))

(assert (= (and start!73750 res!585331) b!861667))

(assert (= (and b!861667 res!585332) b!861674))

(assert (= (and b!861674 res!585334) b!861666))

(assert (= (and b!861666 res!585336) b!861680))

(assert (= (and b!861680 res!585338) b!861670))

(assert (= (and b!861670 res!585339) b!861669))

(assert (= (and b!861669 res!585333) b!861677))

(assert (= (and b!861677 res!585340) b!861672))

(assert (= (and b!861672 res!585335) b!861679))

(assert (= (and b!861679 (not res!585337)) b!861671))

(assert (= (and b!861671 c!92248) b!861675))

(assert (= (and b!861671 (not c!92248)) b!861673))

(assert (= (and b!861668 condMapEmpty!26549) mapIsEmpty!26549))

(assert (= (and b!861668 (not condMapEmpty!26549)) mapNonEmpty!26549))

(get-info :version)

(assert (= (and mapNonEmpty!26549 ((_ is ValueCellFull!7877) mapValue!26549)) b!861676))

(assert (= (and b!861668 ((_ is ValueCellFull!7877) mapDefault!26549)) b!861678))

(assert (= start!73750 b!861668))

(declare-fun b_lambda!11863 () Bool)

(assert (=> (not b_lambda!11863) (not b!861671)))

(declare-fun t!23574 () Bool)

(declare-fun tb!4611 () Bool)

(assert (=> (and start!73750 (= defaultEntry!696 defaultEntry!696) t!23574) tb!4611))

(declare-fun result!8841 () Bool)

(assert (=> tb!4611 (= result!8841 tp_is_empty!16633)))

(assert (=> b!861671 t!23574))

(declare-fun b_and!23985 () Bool)

(assert (= b_and!23983 (and (=> t!23574 result!8841) b_and!23985)))

(declare-fun m!802883 () Bool)

(assert (=> mapNonEmpty!26549 m!802883))

(declare-fun m!802885 () Bool)

(assert (=> b!861667 m!802885))

(declare-fun m!802887 () Bool)

(assert (=> b!861669 m!802887))

(declare-fun m!802889 () Bool)

(assert (=> b!861666 m!802889))

(declare-fun m!802891 () Bool)

(assert (=> b!861677 m!802891))

(declare-fun m!802893 () Bool)

(assert (=> b!861672 m!802893))

(declare-fun m!802895 () Bool)

(assert (=> b!861672 m!802895))

(declare-fun m!802897 () Bool)

(assert (=> b!861672 m!802897))

(declare-fun m!802899 () Bool)

(assert (=> b!861675 m!802899))

(declare-fun m!802901 () Bool)

(assert (=> b!861675 m!802901))

(declare-fun m!802903 () Bool)

(assert (=> b!861675 m!802903))

(declare-fun m!802905 () Bool)

(assert (=> b!861675 m!802905))

(declare-fun m!802907 () Bool)

(assert (=> b!861675 m!802907))

(declare-fun m!802909 () Bool)

(assert (=> b!861671 m!802909))

(declare-fun m!802911 () Bool)

(assert (=> b!861671 m!802911))

(declare-fun m!802913 () Bool)

(assert (=> b!861671 m!802913))

(declare-fun m!802915 () Bool)

(assert (=> b!861671 m!802915))

(assert (=> b!861671 m!802911))

(declare-fun m!802917 () Bool)

(assert (=> b!861671 m!802917))

(assert (=> b!861671 m!802913))

(declare-fun m!802919 () Bool)

(assert (=> start!73750 m!802919))

(declare-fun m!802921 () Bool)

(assert (=> start!73750 m!802921))

(declare-fun m!802923 () Bool)

(assert (=> b!861680 m!802923))

(declare-fun m!802925 () Bool)

(assert (=> b!861679 m!802925))

(declare-fun m!802927 () Bool)

(assert (=> b!861679 m!802927))

(declare-fun m!802929 () Bool)

(assert (=> b!861679 m!802929))

(assert (=> b!861679 m!802917))

(declare-fun m!802931 () Bool)

(assert (=> b!861679 m!802931))

(assert (=> b!861679 m!802917))

(declare-fun m!802933 () Bool)

(assert (=> b!861679 m!802933))

(check-sat b_and!23985 (not b!861669) (not b!861680) (not b_next!14497) (not mapNonEmpty!26549) (not b!861671) (not b!861667) (not b!861675) (not b_lambda!11863) tp_is_empty!16633 (not start!73750) (not b!861672) (not b!861679) (not b!861666))
(check-sat b_and!23985 (not b_next!14497))
