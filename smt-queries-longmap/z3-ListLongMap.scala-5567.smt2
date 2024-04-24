; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73354 () Bool)

(assert start!73354)

(declare-fun b_free!14101 () Bool)

(declare-fun b_next!14101 () Bool)

(assert (=> start!73354 (= b_free!14101 (not b_next!14101))))

(declare-fun tp!49807 () Bool)

(declare-fun b_and!23371 () Bool)

(assert (=> start!73354 (= tp!49807 b_and!23371)))

(declare-fun b!853431 () Bool)

(declare-fun e!476059 () Bool)

(declare-datatypes ((V!26697 0))(
  ( (V!26698 (val!8166 Int)) )
))
(declare-datatypes ((tuple2!10650 0))(
  ( (tuple2!10651 (_1!5336 (_ BitVec 64)) (_2!5336 V!26697)) )
))
(declare-datatypes ((List!16504 0))(
  ( (Nil!16501) (Cons!16500 (h!17637 tuple2!10650) (t!23043 List!16504)) )
))
(declare-datatypes ((ListLongMap!9421 0))(
  ( (ListLongMap!9422 (toList!4726 List!16504)) )
))
(declare-fun call!38203 () ListLongMap!9421)

(declare-fun call!38204 () ListLongMap!9421)

(assert (=> b!853431 (= e!476059 (= call!38203 call!38204))))

(declare-fun b!853432 () Bool)

(declare-fun res!579383 () Bool)

(declare-fun e!476057 () Bool)

(assert (=> b!853432 (=> (not res!579383) (not e!476057))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48723 0))(
  ( (array!48724 (arr!23388 (Array (_ BitVec 32) (_ BitVec 64))) (size!23829 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48723)

(declare-datatypes ((ValueCell!7679 0))(
  ( (ValueCellFull!7679 (v!10591 V!26697)) (EmptyCell!7679) )
))
(declare-datatypes ((array!48725 0))(
  ( (array!48726 (arr!23389 (Array (_ BitVec 32) ValueCell!7679)) (size!23830 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48725)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!853432 (= res!579383 (and (= (size!23830 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23829 _keys!868) (size!23830 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853433 () Bool)

(declare-fun res!579389 () Bool)

(assert (=> b!853433 (=> (not res!579389) (not e!476057))))

(declare-datatypes ((List!16505 0))(
  ( (Nil!16502) (Cons!16501 (h!17638 (_ BitVec 64)) (t!23044 List!16505)) )
))
(declare-fun arrayNoDuplicates!0 (array!48723 (_ BitVec 32) List!16505) Bool)

(assert (=> b!853433 (= res!579389 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16502))))

(declare-fun b!853434 () Bool)

(declare-fun res!579387 () Bool)

(assert (=> b!853434 (=> (not res!579387) (not e!476057))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853434 (= res!579387 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23829 _keys!868))))))

(declare-fun mapNonEmpty!25955 () Bool)

(declare-fun mapRes!25955 () Bool)

(declare-fun tp!49808 () Bool)

(declare-fun e!476058 () Bool)

(assert (=> mapNonEmpty!25955 (= mapRes!25955 (and tp!49808 e!476058))))

(declare-fun mapValue!25955 () ValueCell!7679)

(declare-fun mapRest!25955 () (Array (_ BitVec 32) ValueCell!7679))

(declare-fun mapKey!25955 () (_ BitVec 32))

(assert (=> mapNonEmpty!25955 (= (arr!23389 _values!688) (store mapRest!25955 mapKey!25955 mapValue!25955))))

(declare-fun b!853435 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!26697)

(declare-fun +!2173 (ListLongMap!9421 tuple2!10650) ListLongMap!9421)

(assert (=> b!853435 (= e!476059 (= call!38203 (+!2173 call!38204 (tuple2!10651 k0!854 v!557))))))

(declare-fun b!853436 () Bool)

(declare-fun res!579384 () Bool)

(assert (=> b!853436 (=> (not res!579384) (not e!476057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853436 (= res!579384 (validMask!0 mask!1196))))

(declare-fun b!853437 () Bool)

(declare-fun res!579388 () Bool)

(assert (=> b!853437 (=> (not res!579388) (not e!476057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853437 (= res!579388 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25955 () Bool)

(assert (=> mapIsEmpty!25955 mapRes!25955))

(declare-fun b!853438 () Bool)

(declare-fun e!476062 () Bool)

(assert (=> b!853438 (= e!476057 e!476062)))

(declare-fun res!579386 () Bool)

(assert (=> b!853438 (=> (not res!579386) (not e!476062))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!853438 (= res!579386 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384522 () array!48725)

(declare-fun lt!384519 () ListLongMap!9421)

(declare-fun minValue!654 () V!26697)

(declare-fun zeroValue!654 () V!26697)

(declare-fun getCurrentListMapNoExtraKeys!2783 (array!48723 array!48725 (_ BitVec 32) (_ BitVec 32) V!26697 V!26697 (_ BitVec 32) Int) ListLongMap!9421)

(assert (=> b!853438 (= lt!384519 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384522 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853438 (= lt!384522 (array!48726 (store (arr!23389 _values!688) i!612 (ValueCellFull!7679 v!557)) (size!23830 _values!688)))))

(declare-fun lt!384515 () ListLongMap!9421)

(assert (=> b!853438 (= lt!384515 (getCurrentListMapNoExtraKeys!2783 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!579390 () Bool)

(assert (=> start!73354 (=> (not res!579390) (not e!476057))))

(assert (=> start!73354 (= res!579390 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23829 _keys!868))))))

(assert (=> start!73354 e!476057))

(declare-fun tp_is_empty!16237 () Bool)

(assert (=> start!73354 tp_is_empty!16237))

(assert (=> start!73354 true))

(assert (=> start!73354 tp!49807))

(declare-fun array_inv!18602 (array!48723) Bool)

(assert (=> start!73354 (array_inv!18602 _keys!868)))

(declare-fun e!476055 () Bool)

(declare-fun array_inv!18603 (array!48725) Bool)

(assert (=> start!73354 (and (array_inv!18603 _values!688) e!476055)))

(declare-fun bm!38200 () Bool)

(assert (=> bm!38200 (= call!38204 (getCurrentListMapNoExtraKeys!2783 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853439 () Bool)

(declare-fun e!476061 () Bool)

(assert (=> b!853439 (= e!476061 tp_is_empty!16237)))

(declare-fun b!853440 () Bool)

(assert (=> b!853440 (= e!476058 tp_is_empty!16237)))

(declare-fun b!853441 () Bool)

(assert (=> b!853441 (= e!476055 (and e!476061 mapRes!25955))))

(declare-fun condMapEmpty!25955 () Bool)

(declare-fun mapDefault!25955 () ValueCell!7679)

(assert (=> b!853441 (= condMapEmpty!25955 (= (arr!23389 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7679)) mapDefault!25955)))))

(declare-fun bm!38201 () Bool)

(assert (=> bm!38201 (= call!38203 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384522 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853442 () Bool)

(declare-fun res!579385 () Bool)

(assert (=> b!853442 (=> (not res!579385) (not e!476057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48723 (_ BitVec 32)) Bool)

(assert (=> b!853442 (= res!579385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853443 () Bool)

(declare-fun e!476056 () Bool)

(assert (=> b!853443 (= e!476062 (not e!476056))))

(declare-fun res!579391 () Bool)

(assert (=> b!853443 (=> res!579391 e!476056)))

(assert (=> b!853443 (= res!579391 (not (validKeyInArray!0 (select (arr!23388 _keys!868) from!1053))))))

(assert (=> b!853443 e!476059))

(declare-fun c!92104 () Bool)

(assert (=> b!853443 (= c!92104 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29104 0))(
  ( (Unit!29105) )
))
(declare-fun lt!384516 () Unit!29104)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 (array!48723 array!48725 (_ BitVec 32) (_ BitVec 32) V!26697 V!26697 (_ BitVec 32) (_ BitVec 64) V!26697 (_ BitVec 32) Int) Unit!29104)

(assert (=> b!853443 (= lt!384516 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853444 () Bool)

(declare-fun res!579382 () Bool)

(assert (=> b!853444 (=> (not res!579382) (not e!476057))))

(assert (=> b!853444 (= res!579382 (and (= (select (arr!23388 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853445 () Bool)

(assert (=> b!853445 (= e!476056 true)))

(declare-fun lt!384521 () tuple2!10650)

(declare-fun lt!384520 () V!26697)

(declare-fun lt!384517 () ListLongMap!9421)

(assert (=> b!853445 (= (+!2173 lt!384517 lt!384521) (+!2173 (+!2173 lt!384517 (tuple2!10651 k0!854 lt!384520)) lt!384521))))

(declare-fun lt!384524 () V!26697)

(assert (=> b!853445 (= lt!384521 (tuple2!10651 k0!854 lt!384524))))

(declare-fun lt!384518 () Unit!29104)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!300 (ListLongMap!9421 (_ BitVec 64) V!26697 V!26697) Unit!29104)

(assert (=> b!853445 (= lt!384518 (addSameAsAddTwiceSameKeyDiffValues!300 lt!384517 k0!854 lt!384520 lt!384524))))

(declare-fun lt!384523 () V!26697)

(declare-fun get!12331 (ValueCell!7679 V!26697) V!26697)

(assert (=> b!853445 (= lt!384520 (get!12331 (select (arr!23389 _values!688) from!1053) lt!384523))))

(assert (=> b!853445 (= lt!384519 (+!2173 lt!384517 (tuple2!10651 (select (arr!23388 _keys!868) from!1053) lt!384524)))))

(assert (=> b!853445 (= lt!384524 (get!12331 (select (store (arr!23389 _values!688) i!612 (ValueCellFull!7679 v!557)) from!1053) lt!384523))))

(declare-fun dynLambda!1047 (Int (_ BitVec 64)) V!26697)

(assert (=> b!853445 (= lt!384523 (dynLambda!1047 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853445 (= lt!384517 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384522 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73354 res!579390) b!853436))

(assert (= (and b!853436 res!579384) b!853432))

(assert (= (and b!853432 res!579383) b!853442))

(assert (= (and b!853442 res!579385) b!853433))

(assert (= (and b!853433 res!579389) b!853434))

(assert (= (and b!853434 res!579387) b!853437))

(assert (= (and b!853437 res!579388) b!853444))

(assert (= (and b!853444 res!579382) b!853438))

(assert (= (and b!853438 res!579386) b!853443))

(assert (= (and b!853443 c!92104) b!853435))

(assert (= (and b!853443 (not c!92104)) b!853431))

(assert (= (or b!853435 b!853431) bm!38201))

(assert (= (or b!853435 b!853431) bm!38200))

(assert (= (and b!853443 (not res!579391)) b!853445))

(assert (= (and b!853441 condMapEmpty!25955) mapIsEmpty!25955))

(assert (= (and b!853441 (not condMapEmpty!25955)) mapNonEmpty!25955))

(get-info :version)

(assert (= (and mapNonEmpty!25955 ((_ is ValueCellFull!7679) mapValue!25955)) b!853440))

(assert (= (and b!853441 ((_ is ValueCellFull!7679) mapDefault!25955)) b!853439))

(assert (= start!73354 b!853441))

(declare-fun b_lambda!11647 () Bool)

(assert (=> (not b_lambda!11647) (not b!853445)))

(declare-fun t!23042 () Bool)

(declare-fun tb!4395 () Bool)

(assert (=> (and start!73354 (= defaultEntry!696 defaultEntry!696) t!23042) tb!4395))

(declare-fun result!8409 () Bool)

(assert (=> tb!4395 (= result!8409 tp_is_empty!16237)))

(assert (=> b!853445 t!23042))

(declare-fun b_and!23373 () Bool)

(assert (= b_and!23371 (and (=> t!23042 result!8409) b_and!23373)))

(declare-fun m!794893 () Bool)

(assert (=> start!73354 m!794893))

(declare-fun m!794895 () Bool)

(assert (=> start!73354 m!794895))

(declare-fun m!794897 () Bool)

(assert (=> b!853436 m!794897))

(declare-fun m!794899 () Bool)

(assert (=> b!853443 m!794899))

(assert (=> b!853443 m!794899))

(declare-fun m!794901 () Bool)

(assert (=> b!853443 m!794901))

(declare-fun m!794903 () Bool)

(assert (=> b!853443 m!794903))

(declare-fun m!794905 () Bool)

(assert (=> b!853437 m!794905))

(declare-fun m!794907 () Bool)

(assert (=> b!853444 m!794907))

(declare-fun m!794909 () Bool)

(assert (=> b!853433 m!794909))

(declare-fun m!794911 () Bool)

(assert (=> b!853442 m!794911))

(declare-fun m!794913 () Bool)

(assert (=> bm!38201 m!794913))

(declare-fun m!794915 () Bool)

(assert (=> mapNonEmpty!25955 m!794915))

(declare-fun m!794917 () Bool)

(assert (=> bm!38200 m!794917))

(declare-fun m!794919 () Bool)

(assert (=> b!853445 m!794919))

(declare-fun m!794921 () Bool)

(assert (=> b!853445 m!794921))

(declare-fun m!794923 () Bool)

(assert (=> b!853445 m!794923))

(declare-fun m!794925 () Bool)

(assert (=> b!853445 m!794925))

(declare-fun m!794927 () Bool)

(assert (=> b!853445 m!794927))

(declare-fun m!794929 () Bool)

(assert (=> b!853445 m!794929))

(declare-fun m!794931 () Bool)

(assert (=> b!853445 m!794931))

(assert (=> b!853445 m!794899))

(declare-fun m!794933 () Bool)

(assert (=> b!853445 m!794933))

(assert (=> b!853445 m!794921))

(declare-fun m!794935 () Bool)

(assert (=> b!853445 m!794935))

(declare-fun m!794937 () Bool)

(assert (=> b!853445 m!794937))

(assert (=> b!853445 m!794923))

(declare-fun m!794939 () Bool)

(assert (=> b!853445 m!794939))

(assert (=> b!853445 m!794929))

(assert (=> b!853445 m!794913))

(declare-fun m!794941 () Bool)

(assert (=> b!853435 m!794941))

(declare-fun m!794943 () Bool)

(assert (=> b!853438 m!794943))

(assert (=> b!853438 m!794925))

(declare-fun m!794945 () Bool)

(assert (=> b!853438 m!794945))

(check-sat (not bm!38200) (not b!853433) tp_is_empty!16237 b_and!23373 (not b!853443) (not b!853437) (not start!73354) (not b!853442) (not b!853435) (not b!853436) (not b_next!14101) (not b_lambda!11647) (not bm!38201) (not b!853438) (not b!853445) (not mapNonEmpty!25955))
(check-sat b_and!23373 (not b_next!14101))
