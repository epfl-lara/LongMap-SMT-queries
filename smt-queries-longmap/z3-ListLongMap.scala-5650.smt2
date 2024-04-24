; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73852 () Bool)

(assert start!73852)

(declare-fun b_free!14599 () Bool)

(declare-fun b_next!14599 () Bool)

(assert (=> start!73852 (= b_free!14599 (not b_next!14599))))

(declare-fun tp!51301 () Bool)

(declare-fun b_and!24187 () Bool)

(assert (=> start!73852 (= tp!51301 b_and!24187)))

(declare-fun b!864128 () Bool)

(declare-datatypes ((Unit!29492 0))(
  ( (Unit!29493) )
))
(declare-fun e!481499 () Unit!29492)

(declare-fun Unit!29494 () Unit!29492)

(assert (=> b!864128 (= e!481499 Unit!29494)))

(declare-fun lt!390386 () Unit!29492)

(declare-datatypes ((array!49685 0))(
  ( (array!49686 (arr!23869 (Array (_ BitVec 32) (_ BitVec 64))) (size!24310 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49685)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49685 (_ BitVec 32) (_ BitVec 32)) Unit!29492)

(assert (=> b!864128 (= lt!390386 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16894 0))(
  ( (Nil!16891) (Cons!16890 (h!18027 (_ BitVec 64)) (t!23751 List!16894)) )
))
(declare-fun arrayNoDuplicates!0 (array!49685 (_ BitVec 32) List!16894) Bool)

(assert (=> b!864128 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16891)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!390394 () Unit!29492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29492)

(assert (=> b!864128 (= lt!390394 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864128 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390391 () Unit!29492)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49685 (_ BitVec 64) (_ BitVec 32) List!16894) Unit!29492)

(assert (=> b!864128 (= lt!390391 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16891))))

(assert (=> b!864128 false))

(declare-fun b!864129 () Bool)

(declare-fun e!481496 () Bool)

(assert (=> b!864129 (= e!481496 true)))

(declare-datatypes ((V!27361 0))(
  ( (V!27362 (val!8415 Int)) )
))
(declare-datatypes ((tuple2!11060 0))(
  ( (tuple2!11061 (_1!5541 (_ BitVec 64)) (_2!5541 V!27361)) )
))
(declare-datatypes ((List!16895 0))(
  ( (Nil!16892) (Cons!16891 (h!18028 tuple2!11060) (t!23752 List!16895)) )
))
(declare-datatypes ((ListLongMap!9831 0))(
  ( (ListLongMap!9832 (toList!4931 List!16895)) )
))
(declare-fun lt!390393 () ListLongMap!9831)

(declare-fun lt!390389 () tuple2!11060)

(declare-fun lt!390398 () ListLongMap!9831)

(declare-fun lt!390401 () tuple2!11060)

(declare-fun +!2334 (ListLongMap!9831 tuple2!11060) ListLongMap!9831)

(assert (=> b!864129 (= lt!390393 (+!2334 (+!2334 lt!390398 lt!390401) lt!390389))))

(declare-fun lt!390387 () V!27361)

(declare-fun v!557 () V!27361)

(declare-fun lt!390395 () Unit!29492)

(declare-fun addCommutativeForDiffKeys!487 (ListLongMap!9831 (_ BitVec 64) V!27361 (_ BitVec 64) V!27361) Unit!29492)

(assert (=> b!864129 (= lt!390395 (addCommutativeForDiffKeys!487 lt!390398 k0!854 v!557 (select (arr!23869 _keys!868) from!1053) lt!390387))))

(declare-fun b!864130 () Bool)

(declare-fun res!586936 () Bool)

(declare-fun e!481494 () Bool)

(assert (=> b!864130 (=> (not res!586936) (not e!481494))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864130 (= res!586936 (validMask!0 mask!1196))))

(declare-fun b!864131 () Bool)

(declare-fun e!481500 () Bool)

(assert (=> b!864131 (= e!481494 e!481500)))

(declare-fun res!586932 () Bool)

(assert (=> b!864131 (=> (not res!586932) (not e!481500))))

(assert (=> b!864131 (= res!586932 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((ValueCell!7928 0))(
  ( (ValueCellFull!7928 (v!10840 V!27361)) (EmptyCell!7928) )
))
(declare-datatypes ((array!49687 0))(
  ( (array!49688 (arr!23870 (Array (_ BitVec 32) ValueCell!7928)) (size!24311 (_ BitVec 32))) )
))
(declare-fun lt!390397 () array!49687)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27361)

(declare-fun zeroValue!654 () V!27361)

(declare-fun lt!390396 () ListLongMap!9831)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2982 (array!49685 array!49687 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) Int) ListLongMap!9831)

(assert (=> b!864131 (= lt!390396 (getCurrentListMapNoExtraKeys!2982 _keys!868 lt!390397 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49687)

(assert (=> b!864131 (= lt!390397 (array!49688 (store (arr!23870 _values!688) i!612 (ValueCellFull!7928 v!557)) (size!24311 _values!688)))))

(declare-fun lt!390399 () ListLongMap!9831)

(assert (=> b!864131 (= lt!390399 (getCurrentListMapNoExtraKeys!2982 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864132 () Bool)

(declare-fun res!586929 () Bool)

(assert (=> b!864132 (=> (not res!586929) (not e!481494))))

(assert (=> b!864132 (= res!586929 (and (= (select (arr!23869 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26702 () Bool)

(declare-fun mapRes!26702 () Bool)

(assert (=> mapIsEmpty!26702 mapRes!26702))

(declare-fun b!864134 () Bool)

(declare-fun res!586927 () Bool)

(assert (=> b!864134 (=> (not res!586927) (not e!481494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49685 (_ BitVec 32)) Bool)

(assert (=> b!864134 (= res!586927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864135 () Bool)

(declare-fun e!481501 () Bool)

(declare-fun tp_is_empty!16735 () Bool)

(assert (=> b!864135 (= e!481501 tp_is_empty!16735)))

(declare-fun b!864136 () Bool)

(declare-fun Unit!29495 () Unit!29492)

(assert (=> b!864136 (= e!481499 Unit!29495)))

(declare-fun b!864137 () Bool)

(declare-fun e!481498 () Bool)

(assert (=> b!864137 (= e!481500 (not e!481498))))

(declare-fun res!586933 () Bool)

(assert (=> b!864137 (=> res!586933 e!481498)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864137 (= res!586933 (not (validKeyInArray!0 (select (arr!23869 _keys!868) from!1053))))))

(declare-fun lt!390390 () ListLongMap!9831)

(declare-fun lt!390392 () ListLongMap!9831)

(assert (=> b!864137 (= lt!390390 lt!390392)))

(assert (=> b!864137 (= lt!390392 (+!2334 lt!390398 lt!390389))))

(assert (=> b!864137 (= lt!390390 (getCurrentListMapNoExtraKeys!2982 _keys!868 lt!390397 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864137 (= lt!390389 (tuple2!11061 k0!854 v!557))))

(assert (=> b!864137 (= lt!390398 (getCurrentListMapNoExtraKeys!2982 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390388 () Unit!29492)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 (array!49685 array!49687 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) (_ BitVec 64) V!27361 (_ BitVec 32) Int) Unit!29492)

(assert (=> b!864137 (= lt!390388 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26702 () Bool)

(declare-fun tp!51302 () Bool)

(assert (=> mapNonEmpty!26702 (= mapRes!26702 (and tp!51302 e!481501))))

(declare-fun mapValue!26702 () ValueCell!7928)

(declare-fun mapRest!26702 () (Array (_ BitVec 32) ValueCell!7928))

(declare-fun mapKey!26702 () (_ BitVec 32))

(assert (=> mapNonEmpty!26702 (= (arr!23870 _values!688) (store mapRest!26702 mapKey!26702 mapValue!26702))))

(declare-fun b!864138 () Bool)

(assert (=> b!864138 (= e!481498 e!481496)))

(declare-fun res!586930 () Bool)

(assert (=> b!864138 (=> res!586930 e!481496)))

(assert (=> b!864138 (= res!586930 (= k0!854 (select (arr!23869 _keys!868) from!1053)))))

(assert (=> b!864138 (not (= (select (arr!23869 _keys!868) from!1053) k0!854))))

(declare-fun lt!390400 () Unit!29492)

(assert (=> b!864138 (= lt!390400 e!481499)))

(declare-fun c!92401 () Bool)

(assert (=> b!864138 (= c!92401 (= (select (arr!23869 _keys!868) from!1053) k0!854))))

(assert (=> b!864138 (= lt!390396 lt!390393)))

(assert (=> b!864138 (= lt!390393 (+!2334 lt!390392 lt!390401))))

(assert (=> b!864138 (= lt!390401 (tuple2!11061 (select (arr!23869 _keys!868) from!1053) lt!390387))))

(declare-fun get!12610 (ValueCell!7928 V!27361) V!27361)

(declare-fun dynLambda!1160 (Int (_ BitVec 64)) V!27361)

(assert (=> b!864138 (= lt!390387 (get!12610 (select (arr!23870 _values!688) from!1053) (dynLambda!1160 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864139 () Bool)

(declare-fun e!481493 () Bool)

(assert (=> b!864139 (= e!481493 tp_is_empty!16735)))

(declare-fun b!864140 () Bool)

(declare-fun res!586926 () Bool)

(assert (=> b!864140 (=> (not res!586926) (not e!481494))))

(assert (=> b!864140 (= res!586926 (and (= (size!24311 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24310 _keys!868) (size!24311 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864141 () Bool)

(declare-fun e!481497 () Bool)

(assert (=> b!864141 (= e!481497 (and e!481493 mapRes!26702))))

(declare-fun condMapEmpty!26702 () Bool)

(declare-fun mapDefault!26702 () ValueCell!7928)

(assert (=> b!864141 (= condMapEmpty!26702 (= (arr!23870 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7928)) mapDefault!26702)))))

(declare-fun b!864142 () Bool)

(declare-fun res!586931 () Bool)

(assert (=> b!864142 (=> (not res!586931) (not e!481494))))

(assert (=> b!864142 (= res!586931 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24310 _keys!868))))))

(declare-fun b!864143 () Bool)

(declare-fun res!586934 () Bool)

(assert (=> b!864143 (=> (not res!586934) (not e!481494))))

(assert (=> b!864143 (= res!586934 (validKeyInArray!0 k0!854))))

(declare-fun res!586935 () Bool)

(assert (=> start!73852 (=> (not res!586935) (not e!481494))))

(assert (=> start!73852 (= res!586935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24310 _keys!868))))))

(assert (=> start!73852 e!481494))

(assert (=> start!73852 tp_is_empty!16735))

(assert (=> start!73852 true))

(assert (=> start!73852 tp!51301))

(declare-fun array_inv!18936 (array!49685) Bool)

(assert (=> start!73852 (array_inv!18936 _keys!868)))

(declare-fun array_inv!18937 (array!49687) Bool)

(assert (=> start!73852 (and (array_inv!18937 _values!688) e!481497)))

(declare-fun b!864133 () Bool)

(declare-fun res!586928 () Bool)

(assert (=> b!864133 (=> (not res!586928) (not e!481494))))

(assert (=> b!864133 (= res!586928 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16891))))

(assert (= (and start!73852 res!586935) b!864130))

(assert (= (and b!864130 res!586936) b!864140))

(assert (= (and b!864140 res!586926) b!864134))

(assert (= (and b!864134 res!586927) b!864133))

(assert (= (and b!864133 res!586928) b!864142))

(assert (= (and b!864142 res!586931) b!864143))

(assert (= (and b!864143 res!586934) b!864132))

(assert (= (and b!864132 res!586929) b!864131))

(assert (= (and b!864131 res!586932) b!864137))

(assert (= (and b!864137 (not res!586933)) b!864138))

(assert (= (and b!864138 c!92401) b!864128))

(assert (= (and b!864138 (not c!92401)) b!864136))

(assert (= (and b!864138 (not res!586930)) b!864129))

(assert (= (and b!864141 condMapEmpty!26702) mapIsEmpty!26702))

(assert (= (and b!864141 (not condMapEmpty!26702)) mapNonEmpty!26702))

(get-info :version)

(assert (= (and mapNonEmpty!26702 ((_ is ValueCellFull!7928) mapValue!26702)) b!864135))

(assert (= (and b!864141 ((_ is ValueCellFull!7928) mapDefault!26702)) b!864139))

(assert (= start!73852 b!864141))

(declare-fun b_lambda!11965 () Bool)

(assert (=> (not b_lambda!11965) (not b!864138)))

(declare-fun t!23750 () Bool)

(declare-fun tb!4713 () Bool)

(assert (=> (and start!73852 (= defaultEntry!696 defaultEntry!696) t!23750) tb!4713))

(declare-fun result!9045 () Bool)

(assert (=> tb!4713 (= result!9045 tp_is_empty!16735)))

(assert (=> b!864138 t!23750))

(declare-fun b_and!24189 () Bool)

(assert (= b_and!24187 (and (=> t!23750 result!9045) b_and!24189)))

(declare-fun m!805661 () Bool)

(assert (=> mapNonEmpty!26702 m!805661))

(declare-fun m!805663 () Bool)

(assert (=> start!73852 m!805663))

(declare-fun m!805665 () Bool)

(assert (=> start!73852 m!805665))

(declare-fun m!805667 () Bool)

(assert (=> b!864130 m!805667))

(declare-fun m!805669 () Bool)

(assert (=> b!864133 m!805669))

(declare-fun m!805671 () Bool)

(assert (=> b!864132 m!805671))

(declare-fun m!805673 () Bool)

(assert (=> b!864134 m!805673))

(declare-fun m!805675 () Bool)

(assert (=> b!864138 m!805675))

(declare-fun m!805677 () Bool)

(assert (=> b!864138 m!805677))

(declare-fun m!805679 () Bool)

(assert (=> b!864138 m!805679))

(declare-fun m!805681 () Bool)

(assert (=> b!864138 m!805681))

(assert (=> b!864138 m!805677))

(declare-fun m!805683 () Bool)

(assert (=> b!864138 m!805683))

(assert (=> b!864138 m!805679))

(declare-fun m!805685 () Bool)

(assert (=> b!864131 m!805685))

(declare-fun m!805687 () Bool)

(assert (=> b!864131 m!805687))

(declare-fun m!805689 () Bool)

(assert (=> b!864131 m!805689))

(declare-fun m!805691 () Bool)

(assert (=> b!864137 m!805691))

(declare-fun m!805693 () Bool)

(assert (=> b!864137 m!805693))

(assert (=> b!864137 m!805683))

(declare-fun m!805695 () Bool)

(assert (=> b!864137 m!805695))

(assert (=> b!864137 m!805683))

(declare-fun m!805697 () Bool)

(assert (=> b!864137 m!805697))

(declare-fun m!805699 () Bool)

(assert (=> b!864137 m!805699))

(declare-fun m!805701 () Bool)

(assert (=> b!864128 m!805701))

(declare-fun m!805703 () Bool)

(assert (=> b!864128 m!805703))

(declare-fun m!805705 () Bool)

(assert (=> b!864128 m!805705))

(declare-fun m!805707 () Bool)

(assert (=> b!864128 m!805707))

(declare-fun m!805709 () Bool)

(assert (=> b!864128 m!805709))

(declare-fun m!805711 () Bool)

(assert (=> b!864143 m!805711))

(declare-fun m!805713 () Bool)

(assert (=> b!864129 m!805713))

(assert (=> b!864129 m!805713))

(declare-fun m!805715 () Bool)

(assert (=> b!864129 m!805715))

(assert (=> b!864129 m!805683))

(assert (=> b!864129 m!805683))

(declare-fun m!805717 () Bool)

(assert (=> b!864129 m!805717))

(check-sat (not b!864137) (not b!864134) (not b!864128) tp_is_empty!16735 b_and!24189 (not b!864138) (not start!73852) (not b!864133) (not mapNonEmpty!26702) (not b!864130) (not b!864143) (not b!864129) (not b_next!14599) (not b!864131) (not b_lambda!11965))
(check-sat b_and!24189 (not b_next!14599))
