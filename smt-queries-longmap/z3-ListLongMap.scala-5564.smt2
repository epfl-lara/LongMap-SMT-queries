; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73150 () Bool)

(assert start!73150)

(declare-fun b_free!14083 () Bool)

(declare-fun b_next!14083 () Bool)

(assert (=> start!73150 (= b_free!14083 (not b_next!14083))))

(declare-fun tp!49754 () Bool)

(declare-fun b_and!23299 () Bool)

(assert (=> start!73150 (= tp!49754 b_and!23299)))

(declare-fun b!851866 () Bool)

(declare-fun res!578662 () Bool)

(declare-fun e!475113 () Bool)

(assert (=> b!851866 (=> (not res!578662) (not e!475113))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851866 (= res!578662 (validKeyInArray!0 k0!854))))

(declare-fun b!851867 () Bool)

(declare-fun e!475112 () Bool)

(declare-datatypes ((V!26673 0))(
  ( (V!26674 (val!8157 Int)) )
))
(declare-datatypes ((tuple2!10726 0))(
  ( (tuple2!10727 (_1!5374 (_ BitVec 64)) (_2!5374 V!26673)) )
))
(declare-datatypes ((List!16556 0))(
  ( (Nil!16553) (Cons!16552 (h!17683 tuple2!10726) (t!23076 List!16556)) )
))
(declare-datatypes ((ListLongMap!9485 0))(
  ( (ListLongMap!9486 (toList!4758 List!16556)) )
))
(declare-fun call!38079 () ListLongMap!9485)

(declare-fun call!38078 () ListLongMap!9485)

(assert (=> b!851867 (= e!475112 (= call!38079 call!38078))))

(declare-fun b!851868 () Bool)

(declare-fun e!475109 () Bool)

(assert (=> b!851868 (= e!475113 e!475109)))

(declare-fun res!578661 () Bool)

(assert (=> b!851868 (=> (not res!578661) (not e!475109))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851868 (= res!578661 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48625 0))(
  ( (array!48626 (arr!23344 (Array (_ BitVec 32) (_ BitVec 64))) (size!23786 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48625)

(declare-fun minValue!654 () V!26673)

(declare-fun zeroValue!654 () V!26673)

(declare-fun lt!383651 () ListLongMap!9485)

(declare-datatypes ((ValueCell!7670 0))(
  ( (ValueCellFull!7670 (v!10576 V!26673)) (EmptyCell!7670) )
))
(declare-datatypes ((array!48627 0))(
  ( (array!48628 (arr!23345 (Array (_ BitVec 32) ValueCell!7670)) (size!23787 (_ BitVec 32))) )
))
(declare-fun lt!383650 () array!48627)

(declare-fun getCurrentListMapNoExtraKeys!2766 (array!48625 array!48627 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) Int) ListLongMap!9485)

(assert (=> b!851868 (= lt!383651 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383650 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26673)

(declare-fun _values!688 () array!48627)

(assert (=> b!851868 (= lt!383650 (array!48628 (store (arr!23345 _values!688) i!612 (ValueCellFull!7670 v!557)) (size!23787 _values!688)))))

(declare-fun lt!383649 () ListLongMap!9485)

(assert (=> b!851868 (= lt!383649 (getCurrentListMapNoExtraKeys!2766 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!578660 () Bool)

(assert (=> start!73150 (=> (not res!578660) (not e!475113))))

(assert (=> start!73150 (= res!578660 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23786 _keys!868))))))

(assert (=> start!73150 e!475113))

(declare-fun tp_is_empty!16219 () Bool)

(assert (=> start!73150 tp_is_empty!16219))

(assert (=> start!73150 true))

(assert (=> start!73150 tp!49754))

(declare-fun array_inv!18596 (array!48625) Bool)

(assert (=> start!73150 (array_inv!18596 _keys!868)))

(declare-fun e!475110 () Bool)

(declare-fun array_inv!18597 (array!48627) Bool)

(assert (=> start!73150 (and (array_inv!18597 _values!688) e!475110)))

(declare-fun b!851869 () Bool)

(declare-fun res!578667 () Bool)

(assert (=> b!851869 (=> (not res!578667) (not e!475113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851869 (= res!578667 (validMask!0 mask!1196))))

(declare-fun b!851870 () Bool)

(declare-fun res!578659 () Bool)

(assert (=> b!851870 (=> (not res!578659) (not e!475113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48625 (_ BitVec 32)) Bool)

(assert (=> b!851870 (= res!578659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851871 () Bool)

(declare-fun res!578664 () Bool)

(assert (=> b!851871 (=> (not res!578664) (not e!475113))))

(declare-datatypes ((List!16557 0))(
  ( (Nil!16554) (Cons!16553 (h!17684 (_ BitVec 64)) (t!23077 List!16557)) )
))
(declare-fun arrayNoDuplicates!0 (array!48625 (_ BitVec 32) List!16557) Bool)

(assert (=> b!851871 (= res!578664 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16554))))

(declare-fun b!851872 () Bool)

(declare-fun res!578663 () Bool)

(assert (=> b!851872 (=> (not res!578663) (not e!475113))))

(assert (=> b!851872 (= res!578663 (and (= (select (arr!23344 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851873 () Bool)

(declare-fun e!475114 () Bool)

(assert (=> b!851873 (= e!475114 tp_is_empty!16219)))

(declare-fun b!851874 () Bool)

(declare-fun res!578665 () Bool)

(assert (=> b!851874 (=> (not res!578665) (not e!475113))))

(assert (=> b!851874 (= res!578665 (and (= (size!23787 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23786 _keys!868) (size!23787 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38075 () Bool)

(assert (=> bm!38075 (= call!38078 (getCurrentListMapNoExtraKeys!2766 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851875 () Bool)

(declare-fun +!2174 (ListLongMap!9485 tuple2!10726) ListLongMap!9485)

(assert (=> b!851875 (= e!475112 (= call!38079 (+!2174 call!38078 (tuple2!10727 k0!854 v!557))))))

(declare-fun mapIsEmpty!25928 () Bool)

(declare-fun mapRes!25928 () Bool)

(assert (=> mapIsEmpty!25928 mapRes!25928))

(declare-fun b!851876 () Bool)

(declare-fun e!475116 () Bool)

(assert (=> b!851876 (= e!475116 true)))

(declare-fun lt!383653 () tuple2!10726)

(declare-fun lt!383657 () V!26673)

(declare-fun lt!383656 () ListLongMap!9485)

(assert (=> b!851876 (= (+!2174 lt!383656 lt!383653) (+!2174 (+!2174 lt!383656 (tuple2!10727 k0!854 lt!383657)) lt!383653))))

(declare-fun lt!383648 () V!26673)

(assert (=> b!851876 (= lt!383653 (tuple2!10727 k0!854 lt!383648))))

(declare-datatypes ((Unit!29021 0))(
  ( (Unit!29022) )
))
(declare-fun lt!383652 () Unit!29021)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!287 (ListLongMap!9485 (_ BitVec 64) V!26673 V!26673) Unit!29021)

(assert (=> b!851876 (= lt!383652 (addSameAsAddTwiceSameKeyDiffValues!287 lt!383656 k0!854 lt!383657 lt!383648))))

(declare-fun lt!383655 () V!26673)

(declare-fun get!12312 (ValueCell!7670 V!26673) V!26673)

(assert (=> b!851876 (= lt!383657 (get!12312 (select (arr!23345 _values!688) from!1053) lt!383655))))

(assert (=> b!851876 (= lt!383651 (+!2174 lt!383656 (tuple2!10727 (select (arr!23344 _keys!868) from!1053) lt!383648)))))

(assert (=> b!851876 (= lt!383648 (get!12312 (select (store (arr!23345 _values!688) i!612 (ValueCellFull!7670 v!557)) from!1053) lt!383655))))

(declare-fun dynLambda!1037 (Int (_ BitVec 64)) V!26673)

(assert (=> b!851876 (= lt!383655 (dynLambda!1037 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851876 (= lt!383656 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383650 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25928 () Bool)

(declare-fun tp!49753 () Bool)

(declare-fun e!475115 () Bool)

(assert (=> mapNonEmpty!25928 (= mapRes!25928 (and tp!49753 e!475115))))

(declare-fun mapValue!25928 () ValueCell!7670)

(declare-fun mapRest!25928 () (Array (_ BitVec 32) ValueCell!7670))

(declare-fun mapKey!25928 () (_ BitVec 32))

(assert (=> mapNonEmpty!25928 (= (arr!23345 _values!688) (store mapRest!25928 mapKey!25928 mapValue!25928))))

(declare-fun bm!38076 () Bool)

(assert (=> bm!38076 (= call!38079 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383650 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851877 () Bool)

(assert (=> b!851877 (= e!475109 (not e!475116))))

(declare-fun res!578658 () Bool)

(assert (=> b!851877 (=> res!578658 e!475116)))

(assert (=> b!851877 (= res!578658 (not (validKeyInArray!0 (select (arr!23344 _keys!868) from!1053))))))

(assert (=> b!851877 e!475112))

(declare-fun c!91730 () Bool)

(assert (=> b!851877 (= c!91730 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383654 () Unit!29021)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 (array!48625 array!48627 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) (_ BitVec 64) V!26673 (_ BitVec 32) Int) Unit!29021)

(assert (=> b!851877 (= lt!383654 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851878 () Bool)

(assert (=> b!851878 (= e!475115 tp_is_empty!16219)))

(declare-fun b!851879 () Bool)

(declare-fun res!578666 () Bool)

(assert (=> b!851879 (=> (not res!578666) (not e!475113))))

(assert (=> b!851879 (= res!578666 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23786 _keys!868))))))

(declare-fun b!851880 () Bool)

(assert (=> b!851880 (= e!475110 (and e!475114 mapRes!25928))))

(declare-fun condMapEmpty!25928 () Bool)

(declare-fun mapDefault!25928 () ValueCell!7670)

(assert (=> b!851880 (= condMapEmpty!25928 (= (arr!23345 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7670)) mapDefault!25928)))))

(assert (= (and start!73150 res!578660) b!851869))

(assert (= (and b!851869 res!578667) b!851874))

(assert (= (and b!851874 res!578665) b!851870))

(assert (= (and b!851870 res!578659) b!851871))

(assert (= (and b!851871 res!578664) b!851879))

(assert (= (and b!851879 res!578666) b!851866))

(assert (= (and b!851866 res!578662) b!851872))

(assert (= (and b!851872 res!578663) b!851868))

(assert (= (and b!851868 res!578661) b!851877))

(assert (= (and b!851877 c!91730) b!851875))

(assert (= (and b!851877 (not c!91730)) b!851867))

(assert (= (or b!851875 b!851867) bm!38076))

(assert (= (or b!851875 b!851867) bm!38075))

(assert (= (and b!851877 (not res!578658)) b!851876))

(assert (= (and b!851880 condMapEmpty!25928) mapIsEmpty!25928))

(assert (= (and b!851880 (not condMapEmpty!25928)) mapNonEmpty!25928))

(get-info :version)

(assert (= (and mapNonEmpty!25928 ((_ is ValueCellFull!7670) mapValue!25928)) b!851878))

(assert (= (and b!851880 ((_ is ValueCellFull!7670) mapDefault!25928)) b!851873))

(assert (= start!73150 b!851880))

(declare-fun b_lambda!11597 () Bool)

(assert (=> (not b_lambda!11597) (not b!851876)))

(declare-fun t!23075 () Bool)

(declare-fun tb!4377 () Bool)

(assert (=> (and start!73150 (= defaultEntry!696 defaultEntry!696) t!23075) tb!4377))

(declare-fun result!8373 () Bool)

(assert (=> tb!4377 (= result!8373 tp_is_empty!16219)))

(assert (=> b!851876 t!23075))

(declare-fun b_and!23301 () Bool)

(assert (= b_and!23299 (and (=> t!23075 result!8373) b_and!23301)))

(declare-fun m!792361 () Bool)

(assert (=> mapNonEmpty!25928 m!792361))

(declare-fun m!792363 () Bool)

(assert (=> b!851876 m!792363))

(declare-fun m!792365 () Bool)

(assert (=> b!851876 m!792365))

(declare-fun m!792367 () Bool)

(assert (=> b!851876 m!792367))

(declare-fun m!792369 () Bool)

(assert (=> b!851876 m!792369))

(declare-fun m!792371 () Bool)

(assert (=> b!851876 m!792371))

(assert (=> b!851876 m!792367))

(declare-fun m!792373 () Bool)

(assert (=> b!851876 m!792373))

(declare-fun m!792375 () Bool)

(assert (=> b!851876 m!792375))

(declare-fun m!792377 () Bool)

(assert (=> b!851876 m!792377))

(declare-fun m!792379 () Bool)

(assert (=> b!851876 m!792379))

(declare-fun m!792381 () Bool)

(assert (=> b!851876 m!792381))

(declare-fun m!792383 () Bool)

(assert (=> b!851876 m!792383))

(declare-fun m!792385 () Bool)

(assert (=> b!851876 m!792385))

(assert (=> b!851876 m!792371))

(declare-fun m!792387 () Bool)

(assert (=> b!851876 m!792387))

(assert (=> b!851876 m!792375))

(declare-fun m!792389 () Bool)

(assert (=> b!851866 m!792389))

(declare-fun m!792391 () Bool)

(assert (=> b!851869 m!792391))

(declare-fun m!792393 () Bool)

(assert (=> b!851875 m!792393))

(declare-fun m!792395 () Bool)

(assert (=> bm!38075 m!792395))

(declare-fun m!792397 () Bool)

(assert (=> start!73150 m!792397))

(declare-fun m!792399 () Bool)

(assert (=> start!73150 m!792399))

(declare-fun m!792401 () Bool)

(assert (=> b!851870 m!792401))

(declare-fun m!792403 () Bool)

(assert (=> b!851871 m!792403))

(declare-fun m!792405 () Bool)

(assert (=> b!851868 m!792405))

(assert (=> b!851868 m!792381))

(declare-fun m!792407 () Bool)

(assert (=> b!851868 m!792407))

(declare-fun m!792409 () Bool)

(assert (=> b!851872 m!792409))

(assert (=> bm!38076 m!792369))

(assert (=> b!851877 m!792383))

(assert (=> b!851877 m!792383))

(declare-fun m!792411 () Bool)

(assert (=> b!851877 m!792411))

(declare-fun m!792413 () Bool)

(assert (=> b!851877 m!792413))

(check-sat (not b!851869) (not b!851875) (not b!851866) (not bm!38075) tp_is_empty!16219 (not b!851870) (not b!851871) (not b!851868) (not bm!38076) (not b_next!14083) (not b!851876) b_and!23301 (not b!851877) (not mapNonEmpty!25928) (not b_lambda!11597) (not start!73150))
(check-sat b_and!23301 (not b_next!14083))
