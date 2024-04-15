; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73666 () Bool)

(assert start!73666)

(declare-fun b_free!14599 () Bool)

(declare-fun b_next!14599 () Bool)

(assert (=> start!73666 (= b_free!14599 (not b_next!14599))))

(declare-fun tp!51301 () Bool)

(declare-fun b_and!24151 () Bool)

(assert (=> start!73666 (= tp!51301 b_and!24151)))

(declare-fun b!862986 () Bool)

(declare-datatypes ((Unit!29418 0))(
  ( (Unit!29419) )
))
(declare-fun e!480768 () Unit!29418)

(declare-fun Unit!29420 () Unit!29418)

(assert (=> b!862986 (= e!480768 Unit!29420)))

(declare-fun lt!389798 () Unit!29418)

(declare-datatypes ((array!49623 0))(
  ( (array!49624 (arr!23843 (Array (_ BitVec 32) (_ BitVec 64))) (size!24285 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49623)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49623 (_ BitVec 32) (_ BitVec 32)) Unit!29418)

(assert (=> b!862986 (= lt!389798 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16942 0))(
  ( (Nil!16939) (Cons!16938 (h!18069 (_ BitVec 64)) (t!23798 List!16942)) )
))
(declare-fun arrayNoDuplicates!0 (array!49623 (_ BitVec 32) List!16942) Bool)

(assert (=> b!862986 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16939)))

(declare-fun lt!389795 () Unit!29418)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29418)

(assert (=> b!862986 (= lt!389795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862986 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389794 () Unit!29418)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49623 (_ BitVec 64) (_ BitVec 32) List!16942) Unit!29418)

(assert (=> b!862986 (= lt!389794 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16939))))

(assert (=> b!862986 false))

(declare-fun b!862987 () Bool)

(declare-fun e!480767 () Bool)

(declare-fun e!480770 () Bool)

(assert (=> b!862987 (= e!480767 e!480770)))

(declare-fun res!586480 () Bool)

(assert (=> b!862987 (=> (not res!586480) (not e!480770))))

(assert (=> b!862987 (= res!586480 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27361 0))(
  ( (V!27362 (val!8415 Int)) )
))
(declare-datatypes ((tuple2!11148 0))(
  ( (tuple2!11149 (_1!5585 (_ BitVec 64)) (_2!5585 V!27361)) )
))
(declare-datatypes ((List!16943 0))(
  ( (Nil!16940) (Cons!16939 (h!18070 tuple2!11148) (t!23799 List!16943)) )
))
(declare-datatypes ((ListLongMap!9907 0))(
  ( (ListLongMap!9908 (toList!4969 List!16943)) )
))
(declare-fun lt!389792 () ListLongMap!9907)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27361)

(declare-datatypes ((ValueCell!7928 0))(
  ( (ValueCellFull!7928 (v!10834 V!27361)) (EmptyCell!7928) )
))
(declare-datatypes ((array!49625 0))(
  ( (array!49626 (arr!23844 (Array (_ BitVec 32) ValueCell!7928)) (size!24286 (_ BitVec 32))) )
))
(declare-fun lt!389804 () array!49625)

(declare-fun zeroValue!654 () V!27361)

(declare-fun getCurrentListMapNoExtraKeys!2969 (array!49623 array!49625 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) Int) ListLongMap!9907)

(assert (=> b!862987 (= lt!389792 (getCurrentListMapNoExtraKeys!2969 _keys!868 lt!389804 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27361)

(declare-fun _values!688 () array!49625)

(assert (=> b!862987 (= lt!389804 (array!49626 (store (arr!23844 _values!688) i!612 (ValueCellFull!7928 v!557)) (size!24286 _values!688)))))

(declare-fun lt!389800 () ListLongMap!9907)

(assert (=> b!862987 (= lt!389800 (getCurrentListMapNoExtraKeys!2969 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862988 () Bool)

(declare-fun res!586472 () Bool)

(assert (=> b!862988 (=> (not res!586472) (not e!480767))))

(assert (=> b!862988 (= res!586472 (and (= (size!24286 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24285 _keys!868) (size!24286 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!586481 () Bool)

(assert (=> start!73666 (=> (not res!586481) (not e!480767))))

(assert (=> start!73666 (= res!586481 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24285 _keys!868))))))

(assert (=> start!73666 e!480767))

(declare-fun tp_is_empty!16735 () Bool)

(assert (=> start!73666 tp_is_empty!16735))

(assert (=> start!73666 true))

(assert (=> start!73666 tp!51301))

(declare-fun array_inv!18932 (array!49623) Bool)

(assert (=> start!73666 (array_inv!18932 _keys!868)))

(declare-fun e!480771 () Bool)

(declare-fun array_inv!18933 (array!49625) Bool)

(assert (=> start!73666 (and (array_inv!18933 _values!688) e!480771)))

(declare-fun b!862989 () Bool)

(declare-fun e!480763 () Bool)

(declare-fun e!480764 () Bool)

(assert (=> b!862989 (= e!480763 e!480764)))

(declare-fun res!586475 () Bool)

(assert (=> b!862989 (=> res!586475 e!480764)))

(assert (=> b!862989 (= res!586475 (= k0!854 (select (arr!23843 _keys!868) from!1053)))))

(assert (=> b!862989 (not (= (select (arr!23843 _keys!868) from!1053) k0!854))))

(declare-fun lt!389801 () Unit!29418)

(assert (=> b!862989 (= lt!389801 e!480768)))

(declare-fun c!92054 () Bool)

(assert (=> b!862989 (= c!92054 (= (select (arr!23843 _keys!868) from!1053) k0!854))))

(declare-fun lt!389802 () ListLongMap!9907)

(assert (=> b!862989 (= lt!389792 lt!389802)))

(declare-fun lt!389790 () ListLongMap!9907)

(declare-fun lt!389793 () tuple2!11148)

(declare-fun +!2338 (ListLongMap!9907 tuple2!11148) ListLongMap!9907)

(assert (=> b!862989 (= lt!389802 (+!2338 lt!389790 lt!389793))))

(declare-fun lt!389803 () V!27361)

(assert (=> b!862989 (= lt!389793 (tuple2!11149 (select (arr!23843 _keys!868) from!1053) lt!389803))))

(declare-fun get!12588 (ValueCell!7928 V!27361) V!27361)

(declare-fun dynLambda!1141 (Int (_ BitVec 64)) V!27361)

(assert (=> b!862989 (= lt!389803 (get!12588 (select (arr!23844 _values!688) from!1053) (dynLambda!1141 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862990 () Bool)

(declare-fun res!586476 () Bool)

(assert (=> b!862990 (=> (not res!586476) (not e!480767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862990 (= res!586476 (validKeyInArray!0 k0!854))))

(declare-fun b!862991 () Bool)

(declare-fun res!586482 () Bool)

(assert (=> b!862991 (=> (not res!586482) (not e!480767))))

(assert (=> b!862991 (= res!586482 (and (= (select (arr!23843 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862992 () Bool)

(declare-fun res!586477 () Bool)

(assert (=> b!862992 (=> (not res!586477) (not e!480767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862992 (= res!586477 (validMask!0 mask!1196))))

(declare-fun b!862993 () Bool)

(assert (=> b!862993 (= e!480770 (not e!480763))))

(declare-fun res!586479 () Bool)

(assert (=> b!862993 (=> res!586479 e!480763)))

(assert (=> b!862993 (= res!586479 (not (validKeyInArray!0 (select (arr!23843 _keys!868) from!1053))))))

(declare-fun lt!389789 () ListLongMap!9907)

(assert (=> b!862993 (= lt!389789 lt!389790)))

(declare-fun lt!389797 () ListLongMap!9907)

(declare-fun lt!389796 () tuple2!11148)

(assert (=> b!862993 (= lt!389790 (+!2338 lt!389797 lt!389796))))

(assert (=> b!862993 (= lt!389789 (getCurrentListMapNoExtraKeys!2969 _keys!868 lt!389804 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862993 (= lt!389796 (tuple2!11149 k0!854 v!557))))

(assert (=> b!862993 (= lt!389797 (getCurrentListMapNoExtraKeys!2969 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389799 () Unit!29418)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!521 (array!49623 array!49625 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) (_ BitVec 64) V!27361 (_ BitVec 32) Int) Unit!29418)

(assert (=> b!862993 (= lt!389799 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!521 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862994 () Bool)

(declare-fun e!480766 () Bool)

(declare-fun mapRes!26702 () Bool)

(assert (=> b!862994 (= e!480771 (and e!480766 mapRes!26702))))

(declare-fun condMapEmpty!26702 () Bool)

(declare-fun mapDefault!26702 () ValueCell!7928)

(assert (=> b!862994 (= condMapEmpty!26702 (= (arr!23844 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7928)) mapDefault!26702)))))

(declare-fun mapNonEmpty!26702 () Bool)

(declare-fun tp!51302 () Bool)

(declare-fun e!480765 () Bool)

(assert (=> mapNonEmpty!26702 (= mapRes!26702 (and tp!51302 e!480765))))

(declare-fun mapRest!26702 () (Array (_ BitVec 32) ValueCell!7928))

(declare-fun mapValue!26702 () ValueCell!7928)

(declare-fun mapKey!26702 () (_ BitVec 32))

(assert (=> mapNonEmpty!26702 (= (arr!23844 _values!688) (store mapRest!26702 mapKey!26702 mapValue!26702))))

(declare-fun b!862995 () Bool)

(declare-fun Unit!29421 () Unit!29418)

(assert (=> b!862995 (= e!480768 Unit!29421)))

(declare-fun b!862996 () Bool)

(declare-fun res!586474 () Bool)

(assert (=> b!862996 (=> (not res!586474) (not e!480767))))

(assert (=> b!862996 (= res!586474 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24285 _keys!868))))))

(declare-fun b!862997 () Bool)

(assert (=> b!862997 (= e!480766 tp_is_empty!16735)))

(declare-fun b!862998 () Bool)

(declare-fun res!586478 () Bool)

(assert (=> b!862998 (=> (not res!586478) (not e!480767))))

(assert (=> b!862998 (= res!586478 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16939))))

(declare-fun b!862999 () Bool)

(declare-fun res!586473 () Bool)

(assert (=> b!862999 (=> (not res!586473) (not e!480767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49623 (_ BitVec 32)) Bool)

(assert (=> b!862999 (= res!586473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863000 () Bool)

(assert (=> b!863000 (= e!480765 tp_is_empty!16735)))

(declare-fun b!863001 () Bool)

(assert (=> b!863001 (= e!480764 true)))

(assert (=> b!863001 (= lt!389802 (+!2338 (+!2338 lt!389797 lt!389793) lt!389796))))

(declare-fun lt!389791 () Unit!29418)

(declare-fun addCommutativeForDiffKeys!485 (ListLongMap!9907 (_ BitVec 64) V!27361 (_ BitVec 64) V!27361) Unit!29418)

(assert (=> b!863001 (= lt!389791 (addCommutativeForDiffKeys!485 lt!389797 k0!854 v!557 (select (arr!23843 _keys!868) from!1053) lt!389803))))

(declare-fun mapIsEmpty!26702 () Bool)

(assert (=> mapIsEmpty!26702 mapRes!26702))

(assert (= (and start!73666 res!586481) b!862992))

(assert (= (and b!862992 res!586477) b!862988))

(assert (= (and b!862988 res!586472) b!862999))

(assert (= (and b!862999 res!586473) b!862998))

(assert (= (and b!862998 res!586478) b!862996))

(assert (= (and b!862996 res!586474) b!862990))

(assert (= (and b!862990 res!586476) b!862991))

(assert (= (and b!862991 res!586482) b!862987))

(assert (= (and b!862987 res!586480) b!862993))

(assert (= (and b!862993 (not res!586479)) b!862989))

(assert (= (and b!862989 c!92054) b!862986))

(assert (= (and b!862989 (not c!92054)) b!862995))

(assert (= (and b!862989 (not res!586475)) b!863001))

(assert (= (and b!862994 condMapEmpty!26702) mapIsEmpty!26702))

(assert (= (and b!862994 (not condMapEmpty!26702)) mapNonEmpty!26702))

(get-info :version)

(assert (= (and mapNonEmpty!26702 ((_ is ValueCellFull!7928) mapValue!26702)) b!863000))

(assert (= (and b!862994 ((_ is ValueCellFull!7928) mapDefault!26702)) b!862997))

(assert (= start!73666 b!862994))

(declare-fun b_lambda!11933 () Bool)

(assert (=> (not b_lambda!11933) (not b!862989)))

(declare-fun t!23797 () Bool)

(declare-fun tb!4713 () Bool)

(assert (=> (and start!73666 (= defaultEntry!696 defaultEntry!696) t!23797) tb!4713))

(declare-fun result!9045 () Bool)

(assert (=> tb!4713 (= result!9045 tp_is_empty!16735)))

(assert (=> b!862989 t!23797))

(declare-fun b_and!24153 () Bool)

(assert (= b_and!24151 (and (=> t!23797 result!9045) b_and!24153)))

(declare-fun m!803613 () Bool)

(assert (=> b!862989 m!803613))

(declare-fun m!803615 () Bool)

(assert (=> b!862989 m!803615))

(declare-fun m!803617 () Bool)

(assert (=> b!862989 m!803617))

(declare-fun m!803619 () Bool)

(assert (=> b!862989 m!803619))

(assert (=> b!862989 m!803615))

(declare-fun m!803621 () Bool)

(assert (=> b!862989 m!803621))

(assert (=> b!862989 m!803617))

(declare-fun m!803623 () Bool)

(assert (=> b!862999 m!803623))

(declare-fun m!803625 () Bool)

(assert (=> b!862992 m!803625))

(declare-fun m!803627 () Bool)

(assert (=> mapNonEmpty!26702 m!803627))

(declare-fun m!803629 () Bool)

(assert (=> start!73666 m!803629))

(declare-fun m!803631 () Bool)

(assert (=> start!73666 m!803631))

(declare-fun m!803633 () Bool)

(assert (=> b!862993 m!803633))

(declare-fun m!803635 () Bool)

(assert (=> b!862993 m!803635))

(declare-fun m!803637 () Bool)

(assert (=> b!862993 m!803637))

(assert (=> b!862993 m!803621))

(declare-fun m!803639 () Bool)

(assert (=> b!862993 m!803639))

(assert (=> b!862993 m!803621))

(declare-fun m!803641 () Bool)

(assert (=> b!862993 m!803641))

(declare-fun m!803643 () Bool)

(assert (=> b!862987 m!803643))

(declare-fun m!803645 () Bool)

(assert (=> b!862987 m!803645))

(declare-fun m!803647 () Bool)

(assert (=> b!862987 m!803647))

(declare-fun m!803649 () Bool)

(assert (=> b!862998 m!803649))

(declare-fun m!803651 () Bool)

(assert (=> b!863001 m!803651))

(assert (=> b!863001 m!803651))

(declare-fun m!803653 () Bool)

(assert (=> b!863001 m!803653))

(assert (=> b!863001 m!803621))

(assert (=> b!863001 m!803621))

(declare-fun m!803655 () Bool)

(assert (=> b!863001 m!803655))

(declare-fun m!803657 () Bool)

(assert (=> b!862990 m!803657))

(declare-fun m!803659 () Bool)

(assert (=> b!862991 m!803659))

(declare-fun m!803661 () Bool)

(assert (=> b!862986 m!803661))

(declare-fun m!803663 () Bool)

(assert (=> b!862986 m!803663))

(declare-fun m!803665 () Bool)

(assert (=> b!862986 m!803665))

(declare-fun m!803667 () Bool)

(assert (=> b!862986 m!803667))

(declare-fun m!803669 () Bool)

(assert (=> b!862986 m!803669))

(check-sat (not b!862986) b_and!24153 (not b!862987) (not b!862990) (not b!862992) (not b!862998) tp_is_empty!16735 (not mapNonEmpty!26702) (not start!73666) (not b!862993) (not b!862999) (not b_lambda!11933) (not b_next!14599) (not b!863001) (not b!862989))
(check-sat b_and!24153 (not b_next!14599))
