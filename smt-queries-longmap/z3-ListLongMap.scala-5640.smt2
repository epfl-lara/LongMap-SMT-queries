; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73626 () Bool)

(assert start!73626)

(declare-fun b_free!14541 () Bool)

(declare-fun b_next!14541 () Bool)

(assert (=> start!73626 (= b_free!14541 (not b_next!14541))))

(declare-fun tp!51127 () Bool)

(declare-fun b_and!24061 () Bool)

(assert (=> start!73626 (= tp!51127 b_and!24061)))

(declare-fun b!861797 () Bool)

(declare-fun e!480150 () Bool)

(assert (=> b!861797 (= e!480150 true)))

(declare-datatypes ((array!49518 0))(
  ( (array!49519 (arr!23790 (Array (_ BitVec 32) (_ BitVec 64))) (size!24230 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49518)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!861797 (not (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29405 0))(
  ( (Unit!29406) )
))
(declare-fun lt!388744 () Unit!29405)

(declare-fun e!480156 () Unit!29405)

(assert (=> b!861797 (= lt!388744 e!480156)))

(declare-fun c!92032 () Bool)

(assert (=> b!861797 (= c!92032 (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27283 0))(
  ( (V!27284 (val!8386 Int)) )
))
(declare-datatypes ((tuple2!11086 0))(
  ( (tuple2!11087 (_1!5554 (_ BitVec 64)) (_2!5554 V!27283)) )
))
(declare-datatypes ((List!16895 0))(
  ( (Nil!16892) (Cons!16891 (h!18022 tuple2!11086) (t!23702 List!16895)) )
))
(declare-datatypes ((ListLongMap!9855 0))(
  ( (ListLongMap!9856 (toList!4943 List!16895)) )
))
(declare-fun lt!388747 () ListLongMap!9855)

(declare-datatypes ((ValueCell!7899 0))(
  ( (ValueCellFull!7899 (v!10811 V!27283)) (EmptyCell!7899) )
))
(declare-datatypes ((array!49520 0))(
  ( (array!49521 (arr!23791 (Array (_ BitVec 32) ValueCell!7899)) (size!24231 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49520)

(declare-fun lt!388746 () ListLongMap!9855)

(declare-fun +!2293 (ListLongMap!9855 tuple2!11086) ListLongMap!9855)

(declare-fun get!12553 (ValueCell!7899 V!27283) V!27283)

(declare-fun dynLambda!1129 (Int (_ BitVec 64)) V!27283)

(assert (=> b!861797 (= lt!388746 (+!2293 lt!388747 (tuple2!11087 (select (arr!23790 _keys!868) from!1053) (get!12553 (select (arr!23791 _values!688) from!1053) (dynLambda!1129 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861798 () Bool)

(declare-fun res!585649 () Bool)

(declare-fun e!480154 () Bool)

(assert (=> b!861798 (=> (not res!585649) (not e!480154))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861798 (= res!585649 (and (= (select (arr!23790 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861799 () Bool)

(declare-fun res!585655 () Bool)

(assert (=> b!861799 (=> (not res!585655) (not e!480154))))

(assert (=> b!861799 (= res!585655 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24230 _keys!868))))))

(declare-fun mapIsEmpty!26615 () Bool)

(declare-fun mapRes!26615 () Bool)

(assert (=> mapIsEmpty!26615 mapRes!26615))

(declare-fun b!861800 () Bool)

(declare-fun e!480155 () Bool)

(declare-fun e!480152 () Bool)

(assert (=> b!861800 (= e!480155 (and e!480152 mapRes!26615))))

(declare-fun condMapEmpty!26615 () Bool)

(declare-fun mapDefault!26615 () ValueCell!7899)

(assert (=> b!861800 (= condMapEmpty!26615 (= (arr!23791 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7899)) mapDefault!26615)))))

(declare-fun b!861801 () Bool)

(declare-fun res!585650 () Bool)

(assert (=> b!861801 (=> (not res!585650) (not e!480154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861801 (= res!585650 (validKeyInArray!0 k0!854))))

(declare-fun b!861802 () Bool)

(declare-fun e!480153 () Bool)

(assert (=> b!861802 (= e!480153 (not e!480150))))

(declare-fun res!585652 () Bool)

(assert (=> b!861802 (=> res!585652 e!480150)))

(assert (=> b!861802 (= res!585652 (not (validKeyInArray!0 (select (arr!23790 _keys!868) from!1053))))))

(declare-fun lt!388748 () ListLongMap!9855)

(assert (=> b!861802 (= lt!388748 lt!388747)))

(declare-fun v!557 () V!27283)

(declare-fun lt!388743 () ListLongMap!9855)

(assert (=> b!861802 (= lt!388747 (+!2293 lt!388743 (tuple2!11087 k0!854 v!557)))))

(declare-fun lt!388751 () array!49520)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27283)

(declare-fun zeroValue!654 () V!27283)

(declare-fun getCurrentListMapNoExtraKeys!2919 (array!49518 array!49520 (_ BitVec 32) (_ BitVec 32) V!27283 V!27283 (_ BitVec 32) Int) ListLongMap!9855)

(assert (=> b!861802 (= lt!388748 (getCurrentListMapNoExtraKeys!2919 _keys!868 lt!388751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861802 (= lt!388743 (getCurrentListMapNoExtraKeys!2919 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388749 () Unit!29405)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!503 (array!49518 array!49520 (_ BitVec 32) (_ BitVec 32) V!27283 V!27283 (_ BitVec 32) (_ BitVec 64) V!27283 (_ BitVec 32) Int) Unit!29405)

(assert (=> b!861802 (= lt!388749 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!503 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861803 () Bool)

(declare-fun Unit!29407 () Unit!29405)

(assert (=> b!861803 (= e!480156 Unit!29407)))

(declare-fun b!861804 () Bool)

(declare-fun res!585648 () Bool)

(assert (=> b!861804 (=> (not res!585648) (not e!480154))))

(declare-datatypes ((List!16896 0))(
  ( (Nil!16893) (Cons!16892 (h!18023 (_ BitVec 64)) (t!23703 List!16896)) )
))
(declare-fun arrayNoDuplicates!0 (array!49518 (_ BitVec 32) List!16896) Bool)

(assert (=> b!861804 (= res!585648 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16893))))

(declare-fun b!861806 () Bool)

(declare-fun e!480157 () Bool)

(declare-fun tp_is_empty!16677 () Bool)

(assert (=> b!861806 (= e!480157 tp_is_empty!16677)))

(declare-fun mapNonEmpty!26615 () Bool)

(declare-fun tp!51126 () Bool)

(assert (=> mapNonEmpty!26615 (= mapRes!26615 (and tp!51126 e!480157))))

(declare-fun mapRest!26615 () (Array (_ BitVec 32) ValueCell!7899))

(declare-fun mapKey!26615 () (_ BitVec 32))

(declare-fun mapValue!26615 () ValueCell!7899)

(assert (=> mapNonEmpty!26615 (= (arr!23791 _values!688) (store mapRest!26615 mapKey!26615 mapValue!26615))))

(declare-fun b!861807 () Bool)

(assert (=> b!861807 (= e!480154 e!480153)))

(declare-fun res!585654 () Bool)

(assert (=> b!861807 (=> (not res!585654) (not e!480153))))

(assert (=> b!861807 (= res!585654 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861807 (= lt!388746 (getCurrentListMapNoExtraKeys!2919 _keys!868 lt!388751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861807 (= lt!388751 (array!49521 (store (arr!23791 _values!688) i!612 (ValueCellFull!7899 v!557)) (size!24231 _values!688)))))

(declare-fun lt!388745 () ListLongMap!9855)

(assert (=> b!861807 (= lt!388745 (getCurrentListMapNoExtraKeys!2919 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861808 () Bool)

(declare-fun res!585653 () Bool)

(assert (=> b!861808 (=> (not res!585653) (not e!480154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861808 (= res!585653 (validMask!0 mask!1196))))

(declare-fun b!861809 () Bool)

(declare-fun res!585656 () Bool)

(assert (=> b!861809 (=> (not res!585656) (not e!480154))))

(assert (=> b!861809 (= res!585656 (and (= (size!24231 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24230 _keys!868) (size!24231 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!585651 () Bool)

(assert (=> start!73626 (=> (not res!585651) (not e!480154))))

(assert (=> start!73626 (= res!585651 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24230 _keys!868))))))

(assert (=> start!73626 e!480154))

(assert (=> start!73626 tp_is_empty!16677))

(assert (=> start!73626 true))

(assert (=> start!73626 tp!51127))

(declare-fun array_inv!18824 (array!49518) Bool)

(assert (=> start!73626 (array_inv!18824 _keys!868)))

(declare-fun array_inv!18825 (array!49520) Bool)

(assert (=> start!73626 (and (array_inv!18825 _values!688) e!480155)))

(declare-fun b!861805 () Bool)

(declare-fun res!585647 () Bool)

(assert (=> b!861805 (=> (not res!585647) (not e!480154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49518 (_ BitVec 32)) Bool)

(assert (=> b!861805 (= res!585647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861810 () Bool)

(assert (=> b!861810 (= e!480152 tp_is_empty!16677)))

(declare-fun b!861811 () Bool)

(declare-fun Unit!29408 () Unit!29405)

(assert (=> b!861811 (= e!480156 Unit!29408)))

(declare-fun lt!388752 () Unit!29405)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49518 (_ BitVec 32) (_ BitVec 32)) Unit!29405)

(assert (=> b!861811 (= lt!388752 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861811 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16893)))

(declare-fun lt!388750 () Unit!29405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29405)

(assert (=> b!861811 (= lt!388750 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861811 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388753 () Unit!29405)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49518 (_ BitVec 64) (_ BitVec 32) List!16896) Unit!29405)

(assert (=> b!861811 (= lt!388753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16893))))

(assert (=> b!861811 false))

(assert (= (and start!73626 res!585651) b!861808))

(assert (= (and b!861808 res!585653) b!861809))

(assert (= (and b!861809 res!585656) b!861805))

(assert (= (and b!861805 res!585647) b!861804))

(assert (= (and b!861804 res!585648) b!861799))

(assert (= (and b!861799 res!585655) b!861801))

(assert (= (and b!861801 res!585650) b!861798))

(assert (= (and b!861798 res!585649) b!861807))

(assert (= (and b!861807 res!585654) b!861802))

(assert (= (and b!861802 (not res!585652)) b!861797))

(assert (= (and b!861797 c!92032) b!861811))

(assert (= (and b!861797 (not c!92032)) b!861803))

(assert (= (and b!861800 condMapEmpty!26615) mapIsEmpty!26615))

(assert (= (and b!861800 (not condMapEmpty!26615)) mapNonEmpty!26615))

(get-info :version)

(assert (= (and mapNonEmpty!26615 ((_ is ValueCellFull!7899) mapValue!26615)) b!861806))

(assert (= (and b!861800 ((_ is ValueCellFull!7899) mapDefault!26615)) b!861810))

(assert (= start!73626 b!861800))

(declare-fun b_lambda!11893 () Bool)

(assert (=> (not b_lambda!11893) (not b!861797)))

(declare-fun t!23701 () Bool)

(declare-fun tb!4663 () Bool)

(assert (=> (and start!73626 (= defaultEntry!696 defaultEntry!696) t!23701) tb!4663))

(declare-fun result!8937 () Bool)

(assert (=> tb!4663 (= result!8937 tp_is_empty!16677)))

(assert (=> b!861797 t!23701))

(declare-fun b_and!24063 () Bool)

(assert (= b_and!24061 (and (=> t!23701 result!8937) b_and!24063)))

(declare-fun m!802737 () Bool)

(assert (=> mapNonEmpty!26615 m!802737))

(declare-fun m!802739 () Bool)

(assert (=> b!861801 m!802739))

(declare-fun m!802741 () Bool)

(assert (=> b!861802 m!802741))

(declare-fun m!802743 () Bool)

(assert (=> b!861802 m!802743))

(declare-fun m!802745 () Bool)

(assert (=> b!861802 m!802745))

(assert (=> b!861802 m!802743))

(declare-fun m!802747 () Bool)

(assert (=> b!861802 m!802747))

(declare-fun m!802749 () Bool)

(assert (=> b!861802 m!802749))

(declare-fun m!802751 () Bool)

(assert (=> b!861802 m!802751))

(declare-fun m!802753 () Bool)

(assert (=> b!861811 m!802753))

(declare-fun m!802755 () Bool)

(assert (=> b!861811 m!802755))

(declare-fun m!802757 () Bool)

(assert (=> b!861811 m!802757))

(declare-fun m!802759 () Bool)

(assert (=> b!861811 m!802759))

(declare-fun m!802761 () Bool)

(assert (=> b!861811 m!802761))

(declare-fun m!802763 () Bool)

(assert (=> b!861805 m!802763))

(declare-fun m!802765 () Bool)

(assert (=> b!861798 m!802765))

(declare-fun m!802767 () Bool)

(assert (=> b!861804 m!802767))

(declare-fun m!802769 () Bool)

(assert (=> b!861807 m!802769))

(declare-fun m!802771 () Bool)

(assert (=> b!861807 m!802771))

(declare-fun m!802773 () Bool)

(assert (=> b!861807 m!802773))

(declare-fun m!802775 () Bool)

(assert (=> b!861797 m!802775))

(declare-fun m!802777 () Bool)

(assert (=> b!861797 m!802777))

(declare-fun m!802779 () Bool)

(assert (=> b!861797 m!802779))

(declare-fun m!802781 () Bool)

(assert (=> b!861797 m!802781))

(assert (=> b!861797 m!802777))

(assert (=> b!861797 m!802743))

(assert (=> b!861797 m!802779))

(declare-fun m!802783 () Bool)

(assert (=> b!861808 m!802783))

(declare-fun m!802785 () Bool)

(assert (=> start!73626 m!802785))

(declare-fun m!802787 () Bool)

(assert (=> start!73626 m!802787))

(check-sat (not b!861802) (not b!861801) (not mapNonEmpty!26615) (not start!73626) b_and!24063 tp_is_empty!16677 (not b_lambda!11893) (not b!861808) (not b!861807) (not b!861805) (not b!861797) (not b!861804) (not b_next!14541) (not b!861811))
(check-sat b_and!24063 (not b_next!14541))
