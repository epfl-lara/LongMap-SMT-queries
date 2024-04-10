; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73464 () Bool)

(assert start!73464)

(declare-fun b_free!14379 () Bool)

(declare-fun b_next!14379 () Bool)

(assert (=> start!73464 (= b_free!14379 (not b_next!14379))))

(declare-fun tp!50641 () Bool)

(declare-fun b_and!23737 () Bool)

(assert (=> start!73464 (= tp!50641 b_and!23737)))

(declare-fun b!857962 () Bool)

(declare-fun e!478166 () Bool)

(declare-fun e!478167 () Bool)

(assert (=> b!857962 (= e!478166 (not e!478167))))

(declare-fun res!582840 () Bool)

(assert (=> b!857962 (=> res!582840 e!478167)))

(declare-datatypes ((array!49218 0))(
  ( (array!49219 (arr!23640 (Array (_ BitVec 32) (_ BitVec 64))) (size!24080 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49218)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857962 (= res!582840 (not (validKeyInArray!0 (select (arr!23640 _keys!868) from!1053))))))

(declare-datatypes ((V!27067 0))(
  ( (V!27068 (val!8305 Int)) )
))
(declare-datatypes ((tuple2!10960 0))(
  ( (tuple2!10961 (_1!5491 (_ BitVec 64)) (_2!5491 V!27067)) )
))
(declare-datatypes ((List!16767 0))(
  ( (Nil!16764) (Cons!16763 (h!17894 tuple2!10960) (t!23412 List!16767)) )
))
(declare-datatypes ((ListLongMap!9729 0))(
  ( (ListLongMap!9730 (toList!4880 List!16767)) )
))
(declare-fun lt!386475 () ListLongMap!9729)

(declare-fun lt!386477 () ListLongMap!9729)

(assert (=> b!857962 (= lt!386475 lt!386477)))

(declare-fun lt!386476 () ListLongMap!9729)

(declare-fun v!557 () V!27067)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2233 (ListLongMap!9729 tuple2!10960) ListLongMap!9729)

(assert (=> b!857962 (= lt!386477 (+!2233 lt!386476 (tuple2!10961 k0!854 v!557)))))

(declare-datatypes ((ValueCell!7818 0))(
  ( (ValueCellFull!7818 (v!10730 V!27067)) (EmptyCell!7818) )
))
(declare-datatypes ((array!49220 0))(
  ( (array!49221 (arr!23641 (Array (_ BitVec 32) ValueCell!7818)) (size!24081 (_ BitVec 32))) )
))
(declare-fun lt!386473 () array!49220)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27067)

(declare-fun zeroValue!654 () V!27067)

(declare-fun getCurrentListMapNoExtraKeys!2861 (array!49218 array!49220 (_ BitVec 32) (_ BitVec 32) V!27067 V!27067 (_ BitVec 32) Int) ListLongMap!9729)

(assert (=> b!857962 (= lt!386475 (getCurrentListMapNoExtraKeys!2861 _keys!868 lt!386473 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49220)

(assert (=> b!857962 (= lt!386476 (getCurrentListMapNoExtraKeys!2861 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29253 0))(
  ( (Unit!29254) )
))
(declare-fun lt!386474 () Unit!29253)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!454 (array!49218 array!49220 (_ BitVec 32) (_ BitVec 32) V!27067 V!27067 (_ BitVec 32) (_ BitVec 64) V!27067 (_ BitVec 32) Int) Unit!29253)

(assert (=> b!857962 (= lt!386474 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!454 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857963 () Bool)

(declare-fun e!478169 () Bool)

(declare-fun tp_is_empty!16515 () Bool)

(assert (=> b!857963 (= e!478169 tp_is_empty!16515)))

(declare-fun mapIsEmpty!26372 () Bool)

(declare-fun mapRes!26372 () Bool)

(assert (=> mapIsEmpty!26372 mapRes!26372))

(declare-fun b!857964 () Bool)

(declare-fun e!478168 () Bool)

(assert (=> b!857964 (= e!478168 (and e!478169 mapRes!26372))))

(declare-fun condMapEmpty!26372 () Bool)

(declare-fun mapDefault!26372 () ValueCell!7818)

(assert (=> b!857964 (= condMapEmpty!26372 (= (arr!23641 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7818)) mapDefault!26372)))))

(declare-fun b!857965 () Bool)

(declare-fun res!582842 () Bool)

(declare-fun e!478170 () Bool)

(assert (=> b!857965 (=> (not res!582842) (not e!478170))))

(assert (=> b!857965 (= res!582842 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26372 () Bool)

(declare-fun tp!50640 () Bool)

(declare-fun e!478165 () Bool)

(assert (=> mapNonEmpty!26372 (= mapRes!26372 (and tp!50640 e!478165))))

(declare-fun mapRest!26372 () (Array (_ BitVec 32) ValueCell!7818))

(declare-fun mapKey!26372 () (_ BitVec 32))

(declare-fun mapValue!26372 () ValueCell!7818)

(assert (=> mapNonEmpty!26372 (= (arr!23641 _values!688) (store mapRest!26372 mapKey!26372 mapValue!26372))))

(declare-fun b!857966 () Bool)

(declare-fun res!582848 () Bool)

(assert (=> b!857966 (=> (not res!582848) (not e!478170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49218 (_ BitVec 32)) Bool)

(assert (=> b!857966 (= res!582848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857967 () Bool)

(declare-fun res!582844 () Bool)

(assert (=> b!857967 (=> (not res!582844) (not e!478170))))

(assert (=> b!857967 (= res!582844 (and (= (size!24081 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24080 _keys!868) (size!24081 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857968 () Bool)

(declare-fun res!582845 () Bool)

(assert (=> b!857968 (=> (not res!582845) (not e!478170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857968 (= res!582845 (validMask!0 mask!1196))))

(declare-fun b!857969 () Bool)

(declare-fun res!582846 () Bool)

(assert (=> b!857969 (=> (not res!582846) (not e!478170))))

(declare-datatypes ((List!16768 0))(
  ( (Nil!16765) (Cons!16764 (h!17895 (_ BitVec 64)) (t!23413 List!16768)) )
))
(declare-fun arrayNoDuplicates!0 (array!49218 (_ BitVec 32) List!16768) Bool)

(assert (=> b!857969 (= res!582846 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16765))))

(declare-fun res!582847 () Bool)

(assert (=> start!73464 (=> (not res!582847) (not e!478170))))

(assert (=> start!73464 (= res!582847 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24080 _keys!868))))))

(assert (=> start!73464 e!478170))

(assert (=> start!73464 tp_is_empty!16515))

(assert (=> start!73464 true))

(assert (=> start!73464 tp!50641))

(declare-fun array_inv!18724 (array!49218) Bool)

(assert (=> start!73464 (array_inv!18724 _keys!868)))

(declare-fun array_inv!18725 (array!49220) Bool)

(assert (=> start!73464 (and (array_inv!18725 _values!688) e!478168)))

(declare-fun b!857970 () Bool)

(assert (=> b!857970 (= e!478170 e!478166)))

(declare-fun res!582843 () Bool)

(assert (=> b!857970 (=> (not res!582843) (not e!478166))))

(assert (=> b!857970 (= res!582843 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386479 () ListLongMap!9729)

(assert (=> b!857970 (= lt!386479 (getCurrentListMapNoExtraKeys!2861 _keys!868 lt!386473 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857970 (= lt!386473 (array!49221 (store (arr!23641 _values!688) i!612 (ValueCellFull!7818 v!557)) (size!24081 _values!688)))))

(declare-fun lt!386478 () ListLongMap!9729)

(assert (=> b!857970 (= lt!386478 (getCurrentListMapNoExtraKeys!2861 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857971 () Bool)

(declare-fun res!582841 () Bool)

(assert (=> b!857971 (=> (not res!582841) (not e!478170))))

(assert (=> b!857971 (= res!582841 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24080 _keys!868))))))

(declare-fun b!857972 () Bool)

(assert (=> b!857972 (= e!478165 tp_is_empty!16515)))

(declare-fun b!857973 () Bool)

(declare-fun res!582839 () Bool)

(assert (=> b!857973 (=> (not res!582839) (not e!478170))))

(assert (=> b!857973 (= res!582839 (and (= (select (arr!23640 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857974 () Bool)

(assert (=> b!857974 (= e!478167 true)))

(declare-fun get!12444 (ValueCell!7818 V!27067) V!27067)

(declare-fun dynLambda!1074 (Int (_ BitVec 64)) V!27067)

(assert (=> b!857974 (= lt!386479 (+!2233 lt!386477 (tuple2!10961 (select (arr!23640 _keys!868) from!1053) (get!12444 (select (arr!23641 _values!688) from!1053) (dynLambda!1074 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73464 res!582847) b!857968))

(assert (= (and b!857968 res!582845) b!857967))

(assert (= (and b!857967 res!582844) b!857966))

(assert (= (and b!857966 res!582848) b!857969))

(assert (= (and b!857969 res!582846) b!857971))

(assert (= (and b!857971 res!582841) b!857965))

(assert (= (and b!857965 res!582842) b!857973))

(assert (= (and b!857973 res!582839) b!857970))

(assert (= (and b!857970 res!582843) b!857962))

(assert (= (and b!857962 (not res!582840)) b!857974))

(assert (= (and b!857964 condMapEmpty!26372) mapIsEmpty!26372))

(assert (= (and b!857964 (not condMapEmpty!26372)) mapNonEmpty!26372))

(get-info :version)

(assert (= (and mapNonEmpty!26372 ((_ is ValueCellFull!7818) mapValue!26372)) b!857972))

(assert (= (and b!857964 ((_ is ValueCellFull!7818) mapDefault!26372)) b!857963))

(assert (= start!73464 b!857964))

(declare-fun b_lambda!11731 () Bool)

(assert (=> (not b_lambda!11731) (not b!857974)))

(declare-fun t!23411 () Bool)

(declare-fun tb!4501 () Bool)

(assert (=> (and start!73464 (= defaultEntry!696 defaultEntry!696) t!23411) tb!4501))

(declare-fun result!8613 () Bool)

(assert (=> tb!4501 (= result!8613 tp_is_empty!16515)))

(assert (=> b!857974 t!23411))

(declare-fun b_and!23739 () Bool)

(assert (= b_and!23737 (and (=> t!23411 result!8613) b_and!23739)))

(declare-fun m!798665 () Bool)

(assert (=> b!857970 m!798665))

(declare-fun m!798667 () Bool)

(assert (=> b!857970 m!798667))

(declare-fun m!798669 () Bool)

(assert (=> b!857970 m!798669))

(declare-fun m!798671 () Bool)

(assert (=> b!857969 m!798671))

(declare-fun m!798673 () Bool)

(assert (=> b!857962 m!798673))

(declare-fun m!798675 () Bool)

(assert (=> b!857962 m!798675))

(declare-fun m!798677 () Bool)

(assert (=> b!857962 m!798677))

(declare-fun m!798679 () Bool)

(assert (=> b!857962 m!798679))

(assert (=> b!857962 m!798677))

(declare-fun m!798681 () Bool)

(assert (=> b!857962 m!798681))

(declare-fun m!798683 () Bool)

(assert (=> b!857962 m!798683))

(declare-fun m!798685 () Bool)

(assert (=> b!857966 m!798685))

(declare-fun m!798687 () Bool)

(assert (=> b!857973 m!798687))

(declare-fun m!798689 () Bool)

(assert (=> mapNonEmpty!26372 m!798689))

(declare-fun m!798691 () Bool)

(assert (=> b!857965 m!798691))

(declare-fun m!798693 () Bool)

(assert (=> start!73464 m!798693))

(declare-fun m!798695 () Bool)

(assert (=> start!73464 m!798695))

(declare-fun m!798697 () Bool)

(assert (=> b!857968 m!798697))

(declare-fun m!798699 () Bool)

(assert (=> b!857974 m!798699))

(declare-fun m!798701 () Bool)

(assert (=> b!857974 m!798701))

(declare-fun m!798703 () Bool)

(assert (=> b!857974 m!798703))

(declare-fun m!798705 () Bool)

(assert (=> b!857974 m!798705))

(assert (=> b!857974 m!798701))

(assert (=> b!857974 m!798677))

(assert (=> b!857974 m!798703))

(check-sat (not b!857974) tp_is_empty!16515 (not b_next!14379) (not b!857970) (not b_lambda!11731) (not mapNonEmpty!26372) (not b!857968) b_and!23739 (not b!857962) (not b!857965) (not b!857966) (not b!857969) (not start!73464))
(check-sat b_and!23739 (not b_next!14379))
