; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73518 () Bool)

(assert start!73518)

(declare-fun b_free!14433 () Bool)

(declare-fun b_next!14433 () Bool)

(assert (=> start!73518 (= b_free!14433 (not b_next!14433))))

(declare-fun tp!50802 () Bool)

(declare-fun b_and!23845 () Bool)

(assert (=> start!73518 (= tp!50802 b_and!23845)))

(declare-fun mapIsEmpty!26453 () Bool)

(declare-fun mapRes!26453 () Bool)

(assert (=> mapIsEmpty!26453 mapRes!26453))

(declare-fun b!859110 () Bool)

(declare-fun e!478774 () Bool)

(declare-fun e!478778 () Bool)

(assert (=> b!859110 (= e!478774 (not e!478778))))

(declare-fun res!583695 () Bool)

(assert (=> b!859110 (=> res!583695 e!478778)))

(declare-datatypes ((array!49318 0))(
  ( (array!49319 (arr!23690 (Array (_ BitVec 32) (_ BitVec 64))) (size!24130 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49318)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859110 (= res!583695 (not (validKeyInArray!0 (select (arr!23690 _keys!868) from!1053))))))

(declare-datatypes ((V!27139 0))(
  ( (V!27140 (val!8332 Int)) )
))
(declare-datatypes ((tuple2!11000 0))(
  ( (tuple2!11001 (_1!5511 (_ BitVec 64)) (_2!5511 V!27139)) )
))
(declare-datatypes ((List!16809 0))(
  ( (Nil!16806) (Cons!16805 (h!17936 tuple2!11000) (t!23508 List!16809)) )
))
(declare-datatypes ((ListLongMap!9769 0))(
  ( (ListLongMap!9770 (toList!4900 List!16809)) )
))
(declare-fun lt!387082 () ListLongMap!9769)

(declare-fun lt!387086 () ListLongMap!9769)

(assert (=> b!859110 (= lt!387082 lt!387086)))

(declare-fun lt!387084 () ListLongMap!9769)

(declare-fun v!557 () V!27139)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2253 (ListLongMap!9769 tuple2!11000) ListLongMap!9769)

(assert (=> b!859110 (= lt!387086 (+!2253 lt!387084 (tuple2!11001 k0!854 v!557)))))

(declare-datatypes ((ValueCell!7845 0))(
  ( (ValueCellFull!7845 (v!10757 V!27139)) (EmptyCell!7845) )
))
(declare-datatypes ((array!49320 0))(
  ( (array!49321 (arr!23691 (Array (_ BitVec 32) ValueCell!7845)) (size!24131 (_ BitVec 32))) )
))
(declare-fun lt!387083 () array!49320)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27139)

(declare-fun zeroValue!654 () V!27139)

(declare-fun getCurrentListMapNoExtraKeys!2879 (array!49318 array!49320 (_ BitVec 32) (_ BitVec 32) V!27139 V!27139 (_ BitVec 32) Int) ListLongMap!9769)

(assert (=> b!859110 (= lt!387082 (getCurrentListMapNoExtraKeys!2879 _keys!868 lt!387083 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49320)

(assert (=> b!859110 (= lt!387084 (getCurrentListMapNoExtraKeys!2879 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29291 0))(
  ( (Unit!29292) )
))
(declare-fun lt!387088 () Unit!29291)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!469 (array!49318 array!49320 (_ BitVec 32) (_ BitVec 32) V!27139 V!27139 (_ BitVec 32) (_ BitVec 64) V!27139 (_ BitVec 32) Int) Unit!29291)

(assert (=> b!859110 (= lt!387088 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!469 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859111 () Bool)

(declare-fun res!583690 () Bool)

(declare-fun e!478780 () Bool)

(assert (=> b!859111 (=> (not res!583690) (not e!478780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49318 (_ BitVec 32)) Bool)

(assert (=> b!859111 (= res!583690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!583699 () Bool)

(assert (=> start!73518 (=> (not res!583699) (not e!478780))))

(assert (=> start!73518 (= res!583699 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24130 _keys!868))))))

(assert (=> start!73518 e!478780))

(declare-fun tp_is_empty!16569 () Bool)

(assert (=> start!73518 tp_is_empty!16569))

(assert (=> start!73518 true))

(assert (=> start!73518 tp!50802))

(declare-fun array_inv!18758 (array!49318) Bool)

(assert (=> start!73518 (array_inv!18758 _keys!868)))

(declare-fun e!478775 () Bool)

(declare-fun array_inv!18759 (array!49320) Bool)

(assert (=> start!73518 (and (array_inv!18759 _values!688) e!478775)))

(declare-fun b!859112 () Bool)

(declare-fun res!583694 () Bool)

(assert (=> b!859112 (=> (not res!583694) (not e!478780))))

(assert (=> b!859112 (= res!583694 (and (= (size!24131 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24130 _keys!868) (size!24131 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859113 () Bool)

(declare-fun e!478779 () Bool)

(assert (=> b!859113 (= e!478779 true)))

(declare-datatypes ((List!16810 0))(
  ( (Nil!16807) (Cons!16806 (h!17937 (_ BitVec 64)) (t!23509 List!16810)) )
))
(declare-fun arrayNoDuplicates!0 (array!49318 (_ BitVec 32) List!16810) Bool)

(assert (=> b!859113 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16807)))

(declare-fun lt!387085 () Unit!29291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49318 (_ BitVec 32) (_ BitVec 32)) Unit!29291)

(assert (=> b!859113 (= lt!387085 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859114 () Bool)

(declare-fun res!583692 () Bool)

(assert (=> b!859114 (=> (not res!583692) (not e!478780))))

(assert (=> b!859114 (= res!583692 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16807))))

(declare-fun b!859115 () Bool)

(declare-fun e!478776 () Bool)

(assert (=> b!859115 (= e!478776 tp_is_empty!16569)))

(declare-fun b!859116 () Bool)

(declare-fun res!583691 () Bool)

(assert (=> b!859116 (=> (not res!583691) (not e!478780))))

(assert (=> b!859116 (= res!583691 (validKeyInArray!0 k0!854))))

(declare-fun b!859117 () Bool)

(assert (=> b!859117 (= e!478780 e!478774)))

(declare-fun res!583696 () Bool)

(assert (=> b!859117 (=> (not res!583696) (not e!478774))))

(assert (=> b!859117 (= res!583696 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387087 () ListLongMap!9769)

(assert (=> b!859117 (= lt!387087 (getCurrentListMapNoExtraKeys!2879 _keys!868 lt!387083 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859117 (= lt!387083 (array!49321 (store (arr!23691 _values!688) i!612 (ValueCellFull!7845 v!557)) (size!24131 _values!688)))))

(declare-fun lt!387081 () ListLongMap!9769)

(assert (=> b!859117 (= lt!387081 (getCurrentListMapNoExtraKeys!2879 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859118 () Bool)

(declare-fun res!583697 () Bool)

(assert (=> b!859118 (=> (not res!583697) (not e!478780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859118 (= res!583697 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26453 () Bool)

(declare-fun tp!50803 () Bool)

(assert (=> mapNonEmpty!26453 (= mapRes!26453 (and tp!50803 e!478776))))

(declare-fun mapValue!26453 () ValueCell!7845)

(declare-fun mapKey!26453 () (_ BitVec 32))

(declare-fun mapRest!26453 () (Array (_ BitVec 32) ValueCell!7845))

(assert (=> mapNonEmpty!26453 (= (arr!23691 _values!688) (store mapRest!26453 mapKey!26453 mapValue!26453))))

(declare-fun b!859119 () Bool)

(declare-fun res!583700 () Bool)

(assert (=> b!859119 (=> (not res!583700) (not e!478780))))

(assert (=> b!859119 (= res!583700 (and (= (select (arr!23690 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859120 () Bool)

(declare-fun e!478773 () Bool)

(assert (=> b!859120 (= e!478775 (and e!478773 mapRes!26453))))

(declare-fun condMapEmpty!26453 () Bool)

(declare-fun mapDefault!26453 () ValueCell!7845)

(assert (=> b!859120 (= condMapEmpty!26453 (= (arr!23691 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7845)) mapDefault!26453)))))

(declare-fun b!859121 () Bool)

(assert (=> b!859121 (= e!478773 tp_is_empty!16569)))

(declare-fun b!859122 () Bool)

(assert (=> b!859122 (= e!478778 e!478779)))

(declare-fun res!583693 () Bool)

(assert (=> b!859122 (=> res!583693 e!478779)))

(assert (=> b!859122 (= res!583693 (not (= (select (arr!23690 _keys!868) from!1053) k0!854)))))

(declare-fun get!12481 (ValueCell!7845 V!27139) V!27139)

(declare-fun dynLambda!1093 (Int (_ BitVec 64)) V!27139)

(assert (=> b!859122 (= lt!387087 (+!2253 lt!387086 (tuple2!11001 (select (arr!23690 _keys!868) from!1053) (get!12481 (select (arr!23691 _values!688) from!1053) (dynLambda!1093 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859123 () Bool)

(declare-fun res!583698 () Bool)

(assert (=> b!859123 (=> (not res!583698) (not e!478780))))

(assert (=> b!859123 (= res!583698 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24130 _keys!868))))))

(assert (= (and start!73518 res!583699) b!859118))

(assert (= (and b!859118 res!583697) b!859112))

(assert (= (and b!859112 res!583694) b!859111))

(assert (= (and b!859111 res!583690) b!859114))

(assert (= (and b!859114 res!583692) b!859123))

(assert (= (and b!859123 res!583698) b!859116))

(assert (= (and b!859116 res!583691) b!859119))

(assert (= (and b!859119 res!583700) b!859117))

(assert (= (and b!859117 res!583696) b!859110))

(assert (= (and b!859110 (not res!583695)) b!859122))

(assert (= (and b!859122 (not res!583693)) b!859113))

(assert (= (and b!859120 condMapEmpty!26453) mapIsEmpty!26453))

(assert (= (and b!859120 (not condMapEmpty!26453)) mapNonEmpty!26453))

(get-info :version)

(assert (= (and mapNonEmpty!26453 ((_ is ValueCellFull!7845) mapValue!26453)) b!859115))

(assert (= (and b!859120 ((_ is ValueCellFull!7845) mapDefault!26453)) b!859121))

(assert (= start!73518 b!859120))

(declare-fun b_lambda!11785 () Bool)

(assert (=> (not b_lambda!11785) (not b!859122)))

(declare-fun t!23507 () Bool)

(declare-fun tb!4555 () Bool)

(assert (=> (and start!73518 (= defaultEntry!696 defaultEntry!696) t!23507) tb!4555))

(declare-fun result!8721 () Bool)

(assert (=> tb!4555 (= result!8721 tp_is_empty!16569)))

(assert (=> b!859122 t!23507))

(declare-fun b_and!23847 () Bool)

(assert (= b_and!23845 (and (=> t!23507 result!8721) b_and!23847)))

(declare-fun m!799851 () Bool)

(assert (=> b!859111 m!799851))

(declare-fun m!799853 () Bool)

(assert (=> b!859113 m!799853))

(declare-fun m!799855 () Bool)

(assert (=> b!859113 m!799855))

(declare-fun m!799857 () Bool)

(assert (=> b!859122 m!799857))

(declare-fun m!799859 () Bool)

(assert (=> b!859122 m!799859))

(declare-fun m!799861 () Bool)

(assert (=> b!859122 m!799861))

(declare-fun m!799863 () Bool)

(assert (=> b!859122 m!799863))

(assert (=> b!859122 m!799859))

(declare-fun m!799865 () Bool)

(assert (=> b!859122 m!799865))

(assert (=> b!859122 m!799861))

(declare-fun m!799867 () Bool)

(assert (=> b!859116 m!799867))

(declare-fun m!799869 () Bool)

(assert (=> mapNonEmpty!26453 m!799869))

(declare-fun m!799871 () Bool)

(assert (=> b!859114 m!799871))

(declare-fun m!799873 () Bool)

(assert (=> b!859117 m!799873))

(declare-fun m!799875 () Bool)

(assert (=> b!859117 m!799875))

(declare-fun m!799877 () Bool)

(assert (=> b!859117 m!799877))

(declare-fun m!799879 () Bool)

(assert (=> b!859119 m!799879))

(declare-fun m!799881 () Bool)

(assert (=> b!859110 m!799881))

(declare-fun m!799883 () Bool)

(assert (=> b!859110 m!799883))

(assert (=> b!859110 m!799865))

(declare-fun m!799885 () Bool)

(assert (=> b!859110 m!799885))

(assert (=> b!859110 m!799865))

(declare-fun m!799887 () Bool)

(assert (=> b!859110 m!799887))

(declare-fun m!799889 () Bool)

(assert (=> b!859110 m!799889))

(declare-fun m!799891 () Bool)

(assert (=> b!859118 m!799891))

(declare-fun m!799893 () Bool)

(assert (=> start!73518 m!799893))

(declare-fun m!799895 () Bool)

(assert (=> start!73518 m!799895))

(check-sat (not b_lambda!11785) b_and!23847 (not b!859116) (not b!859110) (not start!73518) (not b!859114) (not mapNonEmpty!26453) (not b!859111) (not b!859122) (not b!859113) tp_is_empty!16569 (not b!859117) (not b!859118) (not b_next!14433))
(check-sat b_and!23847 (not b_next!14433))
