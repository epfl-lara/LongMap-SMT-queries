; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73830 () Bool)

(assert start!73830)

(declare-fun b_free!14745 () Bool)

(declare-fun b_next!14745 () Bool)

(assert (=> start!73830 (= b_free!14745 (not b_next!14745))))

(declare-fun tp!51739 () Bool)

(declare-fun b_and!24469 () Bool)

(assert (=> start!73830 (= tp!51739 b_and!24469)))

(declare-fun b!866875 () Bool)

(declare-fun res!588994 () Bool)

(declare-fun e!482885 () Bool)

(assert (=> b!866875 (=> (not res!588994) (not e!482885))))

(declare-datatypes ((array!49922 0))(
  ( (array!49923 (arr!23992 (Array (_ BitVec 32) (_ BitVec 64))) (size!24432 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49922)

(declare-datatypes ((List!17057 0))(
  ( (Nil!17054) (Cons!17053 (h!18184 (_ BitVec 64)) (t!24068 List!17057)) )
))
(declare-fun arrayNoDuplicates!0 (array!49922 (_ BitVec 32) List!17057) Bool)

(assert (=> b!866875 (= res!588994 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17054))))

(declare-fun b!866876 () Bool)

(declare-fun e!482887 () Bool)

(assert (=> b!866876 (= e!482887 true)))

(declare-datatypes ((V!27555 0))(
  ( (V!27556 (val!8488 Int)) )
))
(declare-datatypes ((tuple2!11258 0))(
  ( (tuple2!11259 (_1!5640 (_ BitVec 64)) (_2!5640 V!27555)) )
))
(declare-datatypes ((List!17058 0))(
  ( (Nil!17055) (Cons!17054 (h!18185 tuple2!11258) (t!24069 List!17058)) )
))
(declare-datatypes ((ListLongMap!10027 0))(
  ( (ListLongMap!10028 (toList!5029 List!17058)) )
))
(declare-fun lt!393544 () ListLongMap!10027)

(declare-fun lt!393532 () ListLongMap!10027)

(declare-fun lt!393541 () tuple2!11258)

(declare-fun lt!393536 () tuple2!11258)

(declare-fun +!2375 (ListLongMap!10027 tuple2!11258) ListLongMap!10027)

(assert (=> b!866876 (= lt!393544 (+!2375 (+!2375 lt!393532 lt!393541) lt!393536))))

(declare-fun v!557 () V!27555)

(declare-fun lt!393535 () V!27555)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29719 0))(
  ( (Unit!29720) )
))
(declare-fun lt!393537 () Unit!29719)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!542 (ListLongMap!10027 (_ BitVec 64) V!27555 (_ BitVec 64) V!27555) Unit!29719)

(assert (=> b!866876 (= lt!393537 (addCommutativeForDiffKeys!542 lt!393532 k0!854 v!557 (select (arr!23992 _keys!868) from!1053) lt!393535))))

(declare-fun b!866877 () Bool)

(declare-fun e!482890 () Bool)

(assert (=> b!866877 (= e!482890 e!482887)))

(declare-fun res!589000 () Bool)

(assert (=> b!866877 (=> res!589000 e!482887)))

(assert (=> b!866877 (= res!589000 (= k0!854 (select (arr!23992 _keys!868) from!1053)))))

(assert (=> b!866877 (not (= (select (arr!23992 _keys!868) from!1053) k0!854))))

(declare-fun lt!393534 () Unit!29719)

(declare-fun e!482886 () Unit!29719)

(assert (=> b!866877 (= lt!393534 e!482886)))

(declare-fun c!92338 () Bool)

(assert (=> b!866877 (= c!92338 (= (select (arr!23992 _keys!868) from!1053) k0!854))))

(declare-fun lt!393531 () ListLongMap!10027)

(assert (=> b!866877 (= lt!393531 lt!393544)))

(declare-fun lt!393542 () ListLongMap!10027)

(assert (=> b!866877 (= lt!393544 (+!2375 lt!393542 lt!393541))))

(assert (=> b!866877 (= lt!393541 (tuple2!11259 (select (arr!23992 _keys!868) from!1053) lt!393535))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8001 0))(
  ( (ValueCellFull!8001 (v!10913 V!27555)) (EmptyCell!8001) )
))
(declare-datatypes ((array!49924 0))(
  ( (array!49925 (arr!23993 (Array (_ BitVec 32) ValueCell!8001)) (size!24433 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49924)

(declare-fun get!12685 (ValueCell!8001 V!27555) V!27555)

(declare-fun dynLambda!1193 (Int (_ BitVec 64)) V!27555)

(assert (=> b!866877 (= lt!393535 (get!12685 (select (arr!23993 _values!688) from!1053) (dynLambda!1193 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866878 () Bool)

(declare-fun e!482889 () Bool)

(assert (=> b!866878 (= e!482889 (not e!482890))))

(declare-fun res!588991 () Bool)

(assert (=> b!866878 (=> res!588991 e!482890)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866878 (= res!588991 (not (validKeyInArray!0 (select (arr!23992 _keys!868) from!1053))))))

(declare-fun lt!393529 () ListLongMap!10027)

(assert (=> b!866878 (= lt!393529 lt!393542)))

(assert (=> b!866878 (= lt!393542 (+!2375 lt!393532 lt!393536))))

(declare-fun lt!393538 () array!49924)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27555)

(declare-fun zeroValue!654 () V!27555)

(declare-fun getCurrentListMapNoExtraKeys!2999 (array!49922 array!49924 (_ BitVec 32) (_ BitVec 32) V!27555 V!27555 (_ BitVec 32) Int) ListLongMap!10027)

(assert (=> b!866878 (= lt!393529 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!393538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866878 (= lt!393536 (tuple2!11259 k0!854 v!557))))

(assert (=> b!866878 (= lt!393532 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393530 () Unit!29719)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!573 (array!49922 array!49924 (_ BitVec 32) (_ BitVec 32) V!27555 V!27555 (_ BitVec 32) (_ BitVec 64) V!27555 (_ BitVec 32) Int) Unit!29719)

(assert (=> b!866878 (= lt!393530 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!573 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866879 () Bool)

(declare-fun e!482884 () Bool)

(declare-fun tp_is_empty!16881 () Bool)

(assert (=> b!866879 (= e!482884 tp_is_empty!16881)))

(declare-fun b!866880 () Bool)

(declare-fun res!589001 () Bool)

(assert (=> b!866880 (=> (not res!589001) (not e!482885))))

(assert (=> b!866880 (= res!589001 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24432 _keys!868))))))

(declare-fun mapNonEmpty!26921 () Bool)

(declare-fun mapRes!26921 () Bool)

(declare-fun tp!51738 () Bool)

(assert (=> mapNonEmpty!26921 (= mapRes!26921 (and tp!51738 e!482884))))

(declare-fun mapRest!26921 () (Array (_ BitVec 32) ValueCell!8001))

(declare-fun mapKey!26921 () (_ BitVec 32))

(declare-fun mapValue!26921 () ValueCell!8001)

(assert (=> mapNonEmpty!26921 (= (arr!23993 _values!688) (store mapRest!26921 mapKey!26921 mapValue!26921))))

(declare-fun b!866881 () Bool)

(declare-fun Unit!29721 () Unit!29719)

(assert (=> b!866881 (= e!482886 Unit!29721)))

(declare-fun b!866882 () Bool)

(declare-fun e!482883 () Bool)

(assert (=> b!866882 (= e!482883 tp_is_empty!16881)))

(declare-fun b!866883 () Bool)

(declare-fun e!482882 () Bool)

(assert (=> b!866883 (= e!482882 (and e!482883 mapRes!26921))))

(declare-fun condMapEmpty!26921 () Bool)

(declare-fun mapDefault!26921 () ValueCell!8001)

(assert (=> b!866883 (= condMapEmpty!26921 (= (arr!23993 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8001)) mapDefault!26921)))))

(declare-fun b!866884 () Bool)

(declare-fun res!588992 () Bool)

(assert (=> b!866884 (=> (not res!588992) (not e!482885))))

(assert (=> b!866884 (= res!588992 (validKeyInArray!0 k0!854))))

(declare-fun res!588993 () Bool)

(assert (=> start!73830 (=> (not res!588993) (not e!482885))))

(assert (=> start!73830 (= res!588993 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24432 _keys!868))))))

(assert (=> start!73830 e!482885))

(assert (=> start!73830 tp_is_empty!16881))

(assert (=> start!73830 true))

(assert (=> start!73830 tp!51739))

(declare-fun array_inv!18960 (array!49922) Bool)

(assert (=> start!73830 (array_inv!18960 _keys!868)))

(declare-fun array_inv!18961 (array!49924) Bool)

(assert (=> start!73830 (and (array_inv!18961 _values!688) e!482882)))

(declare-fun b!866885 () Bool)

(declare-fun res!588999 () Bool)

(assert (=> b!866885 (=> (not res!588999) (not e!482885))))

(assert (=> b!866885 (= res!588999 (and (= (select (arr!23992 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866886 () Bool)

(declare-fun res!588998 () Bool)

(assert (=> b!866886 (=> (not res!588998) (not e!482885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49922 (_ BitVec 32)) Bool)

(assert (=> b!866886 (= res!588998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26921 () Bool)

(assert (=> mapIsEmpty!26921 mapRes!26921))

(declare-fun b!866887 () Bool)

(assert (=> b!866887 (= e!482885 e!482889)))

(declare-fun res!588997 () Bool)

(assert (=> b!866887 (=> (not res!588997) (not e!482889))))

(assert (=> b!866887 (= res!588997 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866887 (= lt!393531 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!393538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866887 (= lt!393538 (array!49925 (store (arr!23993 _values!688) i!612 (ValueCellFull!8001 v!557)) (size!24433 _values!688)))))

(declare-fun lt!393543 () ListLongMap!10027)

(assert (=> b!866887 (= lt!393543 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866888 () Bool)

(declare-fun res!588996 () Bool)

(assert (=> b!866888 (=> (not res!588996) (not e!482885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866888 (= res!588996 (validMask!0 mask!1196))))

(declare-fun b!866889 () Bool)

(declare-fun Unit!29722 () Unit!29719)

(assert (=> b!866889 (= e!482886 Unit!29722)))

(declare-fun lt!393533 () Unit!29719)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49922 (_ BitVec 32) (_ BitVec 32)) Unit!29719)

(assert (=> b!866889 (= lt!393533 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866889 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17054)))

(declare-fun lt!393539 () Unit!29719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49922 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29719)

(assert (=> b!866889 (= lt!393539 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866889 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393540 () Unit!29719)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49922 (_ BitVec 64) (_ BitVec 32) List!17057) Unit!29719)

(assert (=> b!866889 (= lt!393540 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17054))))

(assert (=> b!866889 false))

(declare-fun b!866890 () Bool)

(declare-fun res!588995 () Bool)

(assert (=> b!866890 (=> (not res!588995) (not e!482885))))

(assert (=> b!866890 (= res!588995 (and (= (size!24433 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24432 _keys!868) (size!24433 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73830 res!588993) b!866888))

(assert (= (and b!866888 res!588996) b!866890))

(assert (= (and b!866890 res!588995) b!866886))

(assert (= (and b!866886 res!588998) b!866875))

(assert (= (and b!866875 res!588994) b!866880))

(assert (= (and b!866880 res!589001) b!866884))

(assert (= (and b!866884 res!588992) b!866885))

(assert (= (and b!866885 res!588999) b!866887))

(assert (= (and b!866887 res!588997) b!866878))

(assert (= (and b!866878 (not res!588991)) b!866877))

(assert (= (and b!866877 c!92338) b!866889))

(assert (= (and b!866877 (not c!92338)) b!866881))

(assert (= (and b!866877 (not res!589000)) b!866876))

(assert (= (and b!866883 condMapEmpty!26921) mapIsEmpty!26921))

(assert (= (and b!866883 (not condMapEmpty!26921)) mapNonEmpty!26921))

(get-info :version)

(assert (= (and mapNonEmpty!26921 ((_ is ValueCellFull!8001) mapValue!26921)) b!866879))

(assert (= (and b!866883 ((_ is ValueCellFull!8001) mapDefault!26921)) b!866882))

(assert (= start!73830 b!866883))

(declare-fun b_lambda!12097 () Bool)

(assert (=> (not b_lambda!12097) (not b!866877)))

(declare-fun t!24067 () Bool)

(declare-fun tb!4867 () Bool)

(assert (=> (and start!73830 (= defaultEntry!696 defaultEntry!696) t!24067) tb!4867))

(declare-fun result!9345 () Bool)

(assert (=> tb!4867 (= result!9345 tp_is_empty!16881)))

(assert (=> b!866877 t!24067))

(declare-fun b_and!24471 () Bool)

(assert (= b_and!24469 (and (=> t!24067 result!9345) b_and!24471)))

(declare-fun m!808605 () Bool)

(assert (=> b!866878 m!808605))

(declare-fun m!808607 () Bool)

(assert (=> b!866878 m!808607))

(declare-fun m!808609 () Bool)

(assert (=> b!866878 m!808609))

(declare-fun m!808611 () Bool)

(assert (=> b!866878 m!808611))

(assert (=> b!866878 m!808609))

(declare-fun m!808613 () Bool)

(assert (=> b!866878 m!808613))

(declare-fun m!808615 () Bool)

(assert (=> b!866878 m!808615))

(declare-fun m!808617 () Bool)

(assert (=> b!866876 m!808617))

(assert (=> b!866876 m!808617))

(declare-fun m!808619 () Bool)

(assert (=> b!866876 m!808619))

(assert (=> b!866876 m!808609))

(assert (=> b!866876 m!808609))

(declare-fun m!808621 () Bool)

(assert (=> b!866876 m!808621))

(declare-fun m!808623 () Bool)

(assert (=> b!866886 m!808623))

(declare-fun m!808625 () Bool)

(assert (=> start!73830 m!808625))

(declare-fun m!808627 () Bool)

(assert (=> start!73830 m!808627))

(declare-fun m!808629 () Bool)

(assert (=> b!866885 m!808629))

(declare-fun m!808631 () Bool)

(assert (=> mapNonEmpty!26921 m!808631))

(declare-fun m!808633 () Bool)

(assert (=> b!866884 m!808633))

(declare-fun m!808635 () Bool)

(assert (=> b!866887 m!808635))

(declare-fun m!808637 () Bool)

(assert (=> b!866887 m!808637))

(declare-fun m!808639 () Bool)

(assert (=> b!866887 m!808639))

(declare-fun m!808641 () Bool)

(assert (=> b!866889 m!808641))

(declare-fun m!808643 () Bool)

(assert (=> b!866889 m!808643))

(declare-fun m!808645 () Bool)

(assert (=> b!866889 m!808645))

(declare-fun m!808647 () Bool)

(assert (=> b!866889 m!808647))

(declare-fun m!808649 () Bool)

(assert (=> b!866889 m!808649))

(declare-fun m!808651 () Bool)

(assert (=> b!866875 m!808651))

(declare-fun m!808653 () Bool)

(assert (=> b!866877 m!808653))

(declare-fun m!808655 () Bool)

(assert (=> b!866877 m!808655))

(declare-fun m!808657 () Bool)

(assert (=> b!866877 m!808657))

(declare-fun m!808659 () Bool)

(assert (=> b!866877 m!808659))

(assert (=> b!866877 m!808655))

(assert (=> b!866877 m!808609))

(assert (=> b!866877 m!808657))

(declare-fun m!808661 () Bool)

(assert (=> b!866888 m!808661))

(check-sat (not b!866877) (not b!866878) (not b!866886) tp_is_empty!16881 b_and!24471 (not b!866888) (not b!866876) (not b!866887) (not b_lambda!12097) (not b!866884) (not b!866889) (not mapNonEmpty!26921) (not b!866875) (not start!73830) (not b_next!14745))
(check-sat b_and!24471 (not b_next!14745))
