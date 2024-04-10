; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73512 () Bool)

(assert start!73512)

(declare-fun b_free!14427 () Bool)

(declare-fun b_next!14427 () Bool)

(assert (=> start!73512 (= b_free!14427 (not b_next!14427))))

(declare-fun tp!50785 () Bool)

(declare-fun b_and!23833 () Bool)

(assert (=> start!73512 (= tp!50785 b_and!23833)))

(declare-fun b!858978 () Bool)

(declare-fun res!583593 () Bool)

(declare-fun e!478706 () Bool)

(assert (=> b!858978 (=> (not res!583593) (not e!478706))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858978 (= res!583593 (validKeyInArray!0 k0!854))))

(declare-fun b!858979 () Bool)

(declare-fun e!478708 () Bool)

(declare-fun e!478704 () Bool)

(assert (=> b!858979 (= e!478708 e!478704)))

(declare-fun res!583600 () Bool)

(assert (=> b!858979 (=> res!583600 e!478704)))

(declare-datatypes ((array!49308 0))(
  ( (array!49309 (arr!23685 (Array (_ BitVec 32) (_ BitVec 64))) (size!24125 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49308)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858979 (= res!583600 (not (= (select (arr!23685 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!27131 0))(
  ( (V!27132 (val!8329 Int)) )
))
(declare-datatypes ((tuple2!10996 0))(
  ( (tuple2!10997 (_1!5509 (_ BitVec 64)) (_2!5509 V!27131)) )
))
(declare-datatypes ((List!16805 0))(
  ( (Nil!16802) (Cons!16801 (h!17932 tuple2!10996) (t!23498 List!16805)) )
))
(declare-datatypes ((ListLongMap!9765 0))(
  ( (ListLongMap!9766 (toList!4898 List!16805)) )
))
(declare-fun lt!387013 () ListLongMap!9765)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387011 () ListLongMap!9765)

(declare-datatypes ((ValueCell!7842 0))(
  ( (ValueCellFull!7842 (v!10754 V!27131)) (EmptyCell!7842) )
))
(declare-datatypes ((array!49310 0))(
  ( (array!49311 (arr!23686 (Array (_ BitVec 32) ValueCell!7842)) (size!24126 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49310)

(declare-fun +!2251 (ListLongMap!9765 tuple2!10996) ListLongMap!9765)

(declare-fun get!12477 (ValueCell!7842 V!27131) V!27131)

(declare-fun dynLambda!1091 (Int (_ BitVec 64)) V!27131)

(assert (=> b!858979 (= lt!387011 (+!2251 lt!387013 (tuple2!10997 (select (arr!23685 _keys!868) from!1053) (get!12477 (select (arr!23686 _values!688) from!1053) (dynLambda!1091 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858980 () Bool)

(declare-fun res!583594 () Bool)

(assert (=> b!858980 (=> (not res!583594) (not e!478706))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858980 (= res!583594 (and (= (select (arr!23685 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858981 () Bool)

(declare-fun e!478707 () Bool)

(declare-fun tp_is_empty!16563 () Bool)

(assert (=> b!858981 (= e!478707 tp_is_empty!16563)))

(declare-fun b!858982 () Bool)

(declare-fun res!583601 () Bool)

(assert (=> b!858982 (=> (not res!583601) (not e!478706))))

(declare-datatypes ((List!16806 0))(
  ( (Nil!16803) (Cons!16802 (h!17933 (_ BitVec 64)) (t!23499 List!16806)) )
))
(declare-fun arrayNoDuplicates!0 (array!49308 (_ BitVec 32) List!16806) Bool)

(assert (=> b!858982 (= res!583601 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16803))))

(declare-fun b!858983 () Bool)

(declare-fun e!478701 () Bool)

(declare-fun mapRes!26444 () Bool)

(assert (=> b!858983 (= e!478701 (and e!478707 mapRes!26444))))

(declare-fun condMapEmpty!26444 () Bool)

(declare-fun mapDefault!26444 () ValueCell!7842)

(assert (=> b!858983 (= condMapEmpty!26444 (= (arr!23686 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7842)) mapDefault!26444)))))

(declare-fun b!858984 () Bool)

(declare-fun e!478702 () Bool)

(assert (=> b!858984 (= e!478702 tp_is_empty!16563)))

(declare-fun b!858985 () Bool)

(declare-fun res!583596 () Bool)

(assert (=> b!858985 (=> (not res!583596) (not e!478706))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!858985 (= res!583596 (and (= (size!24126 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24125 _keys!868) (size!24126 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858986 () Bool)

(declare-fun res!583597 () Bool)

(assert (=> b!858986 (=> (not res!583597) (not e!478706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49308 (_ BitVec 32)) Bool)

(assert (=> b!858986 (= res!583597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26444 () Bool)

(declare-fun tp!50784 () Bool)

(assert (=> mapNonEmpty!26444 (= mapRes!26444 (and tp!50784 e!478702))))

(declare-fun mapKey!26444 () (_ BitVec 32))

(declare-fun mapValue!26444 () ValueCell!7842)

(declare-fun mapRest!26444 () (Array (_ BitVec 32) ValueCell!7842))

(assert (=> mapNonEmpty!26444 (= (arr!23686 _values!688) (store mapRest!26444 mapKey!26444 mapValue!26444))))

(declare-fun b!858988 () Bool)

(declare-fun e!478705 () Bool)

(assert (=> b!858988 (= e!478706 e!478705)))

(declare-fun res!583599 () Bool)

(assert (=> b!858988 (=> (not res!583599) (not e!478705))))

(assert (=> b!858988 (= res!583599 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387014 () array!49310)

(declare-fun minValue!654 () V!27131)

(declare-fun zeroValue!654 () V!27131)

(declare-fun getCurrentListMapNoExtraKeys!2877 (array!49308 array!49310 (_ BitVec 32) (_ BitVec 32) V!27131 V!27131 (_ BitVec 32) Int) ListLongMap!9765)

(assert (=> b!858988 (= lt!387011 (getCurrentListMapNoExtraKeys!2877 _keys!868 lt!387014 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27131)

(assert (=> b!858988 (= lt!387014 (array!49311 (store (arr!23686 _values!688) i!612 (ValueCellFull!7842 v!557)) (size!24126 _values!688)))))

(declare-fun lt!387016 () ListLongMap!9765)

(assert (=> b!858988 (= lt!387016 (getCurrentListMapNoExtraKeys!2877 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858989 () Bool)

(assert (=> b!858989 (= e!478705 (not e!478708))))

(declare-fun res!583595 () Bool)

(assert (=> b!858989 (=> res!583595 e!478708)))

(assert (=> b!858989 (= res!583595 (not (validKeyInArray!0 (select (arr!23685 _keys!868) from!1053))))))

(declare-fun lt!387010 () ListLongMap!9765)

(assert (=> b!858989 (= lt!387010 lt!387013)))

(declare-fun lt!387012 () ListLongMap!9765)

(assert (=> b!858989 (= lt!387013 (+!2251 lt!387012 (tuple2!10997 k0!854 v!557)))))

(assert (=> b!858989 (= lt!387010 (getCurrentListMapNoExtraKeys!2877 _keys!868 lt!387014 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858989 (= lt!387012 (getCurrentListMapNoExtraKeys!2877 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29287 0))(
  ( (Unit!29288) )
))
(declare-fun lt!387009 () Unit!29287)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 (array!49308 array!49310 (_ BitVec 32) (_ BitVec 32) V!27131 V!27131 (_ BitVec 32) (_ BitVec 64) V!27131 (_ BitVec 32) Int) Unit!29287)

(assert (=> b!858989 (= lt!387009 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858987 () Bool)

(declare-fun res!583592 () Bool)

(assert (=> b!858987 (=> (not res!583592) (not e!478706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858987 (= res!583592 (validMask!0 mask!1196))))

(declare-fun res!583591 () Bool)

(assert (=> start!73512 (=> (not res!583591) (not e!478706))))

(assert (=> start!73512 (= res!583591 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24125 _keys!868))))))

(assert (=> start!73512 e!478706))

(assert (=> start!73512 tp_is_empty!16563))

(assert (=> start!73512 true))

(assert (=> start!73512 tp!50785))

(declare-fun array_inv!18756 (array!49308) Bool)

(assert (=> start!73512 (array_inv!18756 _keys!868)))

(declare-fun array_inv!18757 (array!49310) Bool)

(assert (=> start!73512 (and (array_inv!18757 _values!688) e!478701)))

(declare-fun b!858990 () Bool)

(assert (=> b!858990 (= e!478704 true)))

(assert (=> b!858990 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16803)))

(declare-fun lt!387015 () Unit!29287)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49308 (_ BitVec 32) (_ BitVec 32)) Unit!29287)

(assert (=> b!858990 (= lt!387015 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858991 () Bool)

(declare-fun res!583598 () Bool)

(assert (=> b!858991 (=> (not res!583598) (not e!478706))))

(assert (=> b!858991 (= res!583598 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24125 _keys!868))))))

(declare-fun mapIsEmpty!26444 () Bool)

(assert (=> mapIsEmpty!26444 mapRes!26444))

(assert (= (and start!73512 res!583591) b!858987))

(assert (= (and b!858987 res!583592) b!858985))

(assert (= (and b!858985 res!583596) b!858986))

(assert (= (and b!858986 res!583597) b!858982))

(assert (= (and b!858982 res!583601) b!858991))

(assert (= (and b!858991 res!583598) b!858978))

(assert (= (and b!858978 res!583593) b!858980))

(assert (= (and b!858980 res!583594) b!858988))

(assert (= (and b!858988 res!583599) b!858989))

(assert (= (and b!858989 (not res!583595)) b!858979))

(assert (= (and b!858979 (not res!583600)) b!858990))

(assert (= (and b!858983 condMapEmpty!26444) mapIsEmpty!26444))

(assert (= (and b!858983 (not condMapEmpty!26444)) mapNonEmpty!26444))

(get-info :version)

(assert (= (and mapNonEmpty!26444 ((_ is ValueCellFull!7842) mapValue!26444)) b!858984))

(assert (= (and b!858983 ((_ is ValueCellFull!7842) mapDefault!26444)) b!858981))

(assert (= start!73512 b!858983))

(declare-fun b_lambda!11779 () Bool)

(assert (=> (not b_lambda!11779) (not b!858979)))

(declare-fun t!23497 () Bool)

(declare-fun tb!4549 () Bool)

(assert (=> (and start!73512 (= defaultEntry!696 defaultEntry!696) t!23497) tb!4549))

(declare-fun result!8709 () Bool)

(assert (=> tb!4549 (= result!8709 tp_is_empty!16563)))

(assert (=> b!858979 t!23497))

(declare-fun b_and!23835 () Bool)

(assert (= b_and!23833 (and (=> t!23497 result!8709) b_and!23835)))

(declare-fun m!799713 () Bool)

(assert (=> b!858987 m!799713))

(declare-fun m!799715 () Bool)

(assert (=> b!858988 m!799715))

(declare-fun m!799717 () Bool)

(assert (=> b!858988 m!799717))

(declare-fun m!799719 () Bool)

(assert (=> b!858988 m!799719))

(declare-fun m!799721 () Bool)

(assert (=> b!858990 m!799721))

(declare-fun m!799723 () Bool)

(assert (=> b!858990 m!799723))

(declare-fun m!799725 () Bool)

(assert (=> b!858982 m!799725))

(declare-fun m!799727 () Bool)

(assert (=> start!73512 m!799727))

(declare-fun m!799729 () Bool)

(assert (=> start!73512 m!799729))

(declare-fun m!799731 () Bool)

(assert (=> b!858986 m!799731))

(declare-fun m!799733 () Bool)

(assert (=> b!858989 m!799733))

(declare-fun m!799735 () Bool)

(assert (=> b!858989 m!799735))

(declare-fun m!799737 () Bool)

(assert (=> b!858989 m!799737))

(assert (=> b!858989 m!799735))

(declare-fun m!799739 () Bool)

(assert (=> b!858989 m!799739))

(declare-fun m!799741 () Bool)

(assert (=> b!858989 m!799741))

(declare-fun m!799743 () Bool)

(assert (=> b!858989 m!799743))

(declare-fun m!799745 () Bool)

(assert (=> b!858979 m!799745))

(declare-fun m!799747 () Bool)

(assert (=> b!858979 m!799747))

(declare-fun m!799749 () Bool)

(assert (=> b!858979 m!799749))

(declare-fun m!799751 () Bool)

(assert (=> b!858979 m!799751))

(assert (=> b!858979 m!799747))

(assert (=> b!858979 m!799735))

(assert (=> b!858979 m!799749))

(declare-fun m!799753 () Bool)

(assert (=> b!858980 m!799753))

(declare-fun m!799755 () Bool)

(assert (=> mapNonEmpty!26444 m!799755))

(declare-fun m!799757 () Bool)

(assert (=> b!858978 m!799757))

(check-sat (not start!73512) (not b!858987) (not b_lambda!11779) (not b!858988) (not b!858982) (not b!858989) (not mapNonEmpty!26444) (not b!858986) (not b!858978) b_and!23835 (not b!858979) tp_is_empty!16563 (not b!858990) (not b_next!14427))
(check-sat b_and!23835 (not b_next!14427))
