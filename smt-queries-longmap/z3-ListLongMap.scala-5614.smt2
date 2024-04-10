; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73470 () Bool)

(assert start!73470)

(declare-fun b_free!14385 () Bool)

(declare-fun b_next!14385 () Bool)

(assert (=> start!73470 (= b_free!14385 (not b_next!14385))))

(declare-fun tp!50659 () Bool)

(declare-fun b_and!23749 () Bool)

(assert (=> start!73470 (= tp!50659 b_and!23749)))

(declare-fun b!858085 () Bool)

(declare-fun e!478231 () Bool)

(declare-fun tp_is_empty!16521 () Bool)

(assert (=> b!858085 (= e!478231 tp_is_empty!16521)))

(declare-fun b!858086 () Bool)

(declare-fun e!478233 () Bool)

(declare-fun e!478229 () Bool)

(assert (=> b!858086 (= e!478233 (not e!478229))))

(declare-fun res!582932 () Bool)

(assert (=> b!858086 (=> res!582932 e!478229)))

(declare-datatypes ((array!49230 0))(
  ( (array!49231 (arr!23646 (Array (_ BitVec 32) (_ BitVec 64))) (size!24086 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49230)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858086 (= res!582932 (not (validKeyInArray!0 (select (arr!23646 _keys!868) from!1053))))))

(declare-datatypes ((V!27075 0))(
  ( (V!27076 (val!8308 Int)) )
))
(declare-datatypes ((tuple2!10966 0))(
  ( (tuple2!10967 (_1!5494 (_ BitVec 64)) (_2!5494 V!27075)) )
))
(declare-datatypes ((List!16773 0))(
  ( (Nil!16770) (Cons!16769 (h!17900 tuple2!10966) (t!23424 List!16773)) )
))
(declare-datatypes ((ListLongMap!9735 0))(
  ( (ListLongMap!9736 (toList!4883 List!16773)) )
))
(declare-fun lt!386536 () ListLongMap!9735)

(declare-fun lt!386537 () ListLongMap!9735)

(assert (=> b!858086 (= lt!386536 lt!386537)))

(declare-fun v!557 () V!27075)

(declare-fun lt!386541 () ListLongMap!9735)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2236 (ListLongMap!9735 tuple2!10966) ListLongMap!9735)

(assert (=> b!858086 (= lt!386537 (+!2236 lt!386541 (tuple2!10967 k0!854 v!557)))))

(declare-datatypes ((ValueCell!7821 0))(
  ( (ValueCellFull!7821 (v!10733 V!27075)) (EmptyCell!7821) )
))
(declare-datatypes ((array!49232 0))(
  ( (array!49233 (arr!23647 (Array (_ BitVec 32) ValueCell!7821)) (size!24087 (_ BitVec 32))) )
))
(declare-fun lt!386542 () array!49232)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27075)

(declare-fun zeroValue!654 () V!27075)

(declare-fun getCurrentListMapNoExtraKeys!2864 (array!49230 array!49232 (_ BitVec 32) (_ BitVec 32) V!27075 V!27075 (_ BitVec 32) Int) ListLongMap!9735)

(assert (=> b!858086 (= lt!386536 (getCurrentListMapNoExtraKeys!2864 _keys!868 lt!386542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49232)

(assert (=> b!858086 (= lt!386541 (getCurrentListMapNoExtraKeys!2864 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29259 0))(
  ( (Unit!29260) )
))
(declare-fun lt!386540 () Unit!29259)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!457 (array!49230 array!49232 (_ BitVec 32) (_ BitVec 32) V!27075 V!27075 (_ BitVec 32) (_ BitVec 64) V!27075 (_ BitVec 32) Int) Unit!29259)

(assert (=> b!858086 (= lt!386540 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!457 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858087 () Bool)

(declare-fun res!582936 () Bool)

(declare-fun e!478232 () Bool)

(assert (=> b!858087 (=> (not res!582936) (not e!478232))))

(assert (=> b!858087 (= res!582936 (validKeyInArray!0 k0!854))))

(declare-fun b!858088 () Bool)

(declare-fun e!478230 () Bool)

(declare-fun mapRes!26381 () Bool)

(assert (=> b!858088 (= e!478230 (and e!478231 mapRes!26381))))

(declare-fun condMapEmpty!26381 () Bool)

(declare-fun mapDefault!26381 () ValueCell!7821)

(assert (=> b!858088 (= condMapEmpty!26381 (= (arr!23647 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7821)) mapDefault!26381)))))

(declare-fun b!858089 () Bool)

(assert (=> b!858089 (= e!478229 true)))

(declare-fun lt!386539 () ListLongMap!9735)

(declare-fun get!12448 (ValueCell!7821 V!27075) V!27075)

(declare-fun dynLambda!1076 (Int (_ BitVec 64)) V!27075)

(assert (=> b!858089 (= lt!386539 (+!2236 lt!386537 (tuple2!10967 (select (arr!23646 _keys!868) from!1053) (get!12448 (select (arr!23647 _values!688) from!1053) (dynLambda!1076 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!582937 () Bool)

(assert (=> start!73470 (=> (not res!582937) (not e!478232))))

(assert (=> start!73470 (= res!582937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24086 _keys!868))))))

(assert (=> start!73470 e!478232))

(assert (=> start!73470 tp_is_empty!16521))

(assert (=> start!73470 true))

(assert (=> start!73470 tp!50659))

(declare-fun array_inv!18728 (array!49230) Bool)

(assert (=> start!73470 (array_inv!18728 _keys!868)))

(declare-fun array_inv!18729 (array!49232) Bool)

(assert (=> start!73470 (and (array_inv!18729 _values!688) e!478230)))

(declare-fun b!858090 () Bool)

(declare-fun res!582930 () Bool)

(assert (=> b!858090 (=> (not res!582930) (not e!478232))))

(assert (=> b!858090 (= res!582930 (and (= (size!24087 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24086 _keys!868) (size!24087 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26381 () Bool)

(declare-fun tp!50658 () Bool)

(declare-fun e!478234 () Bool)

(assert (=> mapNonEmpty!26381 (= mapRes!26381 (and tp!50658 e!478234))))

(declare-fun mapRest!26381 () (Array (_ BitVec 32) ValueCell!7821))

(declare-fun mapValue!26381 () ValueCell!7821)

(declare-fun mapKey!26381 () (_ BitVec 32))

(assert (=> mapNonEmpty!26381 (= (arr!23647 _values!688) (store mapRest!26381 mapKey!26381 mapValue!26381))))

(declare-fun b!858091 () Bool)

(declare-fun res!582933 () Bool)

(assert (=> b!858091 (=> (not res!582933) (not e!478232))))

(assert (=> b!858091 (= res!582933 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24086 _keys!868))))))

(declare-fun b!858092 () Bool)

(declare-fun res!582934 () Bool)

(assert (=> b!858092 (=> (not res!582934) (not e!478232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858092 (= res!582934 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26381 () Bool)

(assert (=> mapIsEmpty!26381 mapRes!26381))

(declare-fun b!858093 () Bool)

(declare-fun res!582938 () Bool)

(assert (=> b!858093 (=> (not res!582938) (not e!478232))))

(assert (=> b!858093 (= res!582938 (and (= (select (arr!23646 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858094 () Bool)

(declare-fun res!582935 () Bool)

(assert (=> b!858094 (=> (not res!582935) (not e!478232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49230 (_ BitVec 32)) Bool)

(assert (=> b!858094 (= res!582935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858095 () Bool)

(assert (=> b!858095 (= e!478234 tp_is_empty!16521)))

(declare-fun b!858096 () Bool)

(assert (=> b!858096 (= e!478232 e!478233)))

(declare-fun res!582931 () Bool)

(assert (=> b!858096 (=> (not res!582931) (not e!478233))))

(assert (=> b!858096 (= res!582931 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858096 (= lt!386539 (getCurrentListMapNoExtraKeys!2864 _keys!868 lt!386542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858096 (= lt!386542 (array!49233 (store (arr!23647 _values!688) i!612 (ValueCellFull!7821 v!557)) (size!24087 _values!688)))))

(declare-fun lt!386538 () ListLongMap!9735)

(assert (=> b!858096 (= lt!386538 (getCurrentListMapNoExtraKeys!2864 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858097 () Bool)

(declare-fun res!582929 () Bool)

(assert (=> b!858097 (=> (not res!582929) (not e!478232))))

(declare-datatypes ((List!16774 0))(
  ( (Nil!16771) (Cons!16770 (h!17901 (_ BitVec 64)) (t!23425 List!16774)) )
))
(declare-fun arrayNoDuplicates!0 (array!49230 (_ BitVec 32) List!16774) Bool)

(assert (=> b!858097 (= res!582929 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16771))))

(assert (= (and start!73470 res!582937) b!858092))

(assert (= (and b!858092 res!582934) b!858090))

(assert (= (and b!858090 res!582930) b!858094))

(assert (= (and b!858094 res!582935) b!858097))

(assert (= (and b!858097 res!582929) b!858091))

(assert (= (and b!858091 res!582933) b!858087))

(assert (= (and b!858087 res!582936) b!858093))

(assert (= (and b!858093 res!582938) b!858096))

(assert (= (and b!858096 res!582931) b!858086))

(assert (= (and b!858086 (not res!582932)) b!858089))

(assert (= (and b!858088 condMapEmpty!26381) mapIsEmpty!26381))

(assert (= (and b!858088 (not condMapEmpty!26381)) mapNonEmpty!26381))

(get-info :version)

(assert (= (and mapNonEmpty!26381 ((_ is ValueCellFull!7821) mapValue!26381)) b!858095))

(assert (= (and b!858088 ((_ is ValueCellFull!7821) mapDefault!26381)) b!858085))

(assert (= start!73470 b!858088))

(declare-fun b_lambda!11737 () Bool)

(assert (=> (not b_lambda!11737) (not b!858089)))

(declare-fun t!23423 () Bool)

(declare-fun tb!4507 () Bool)

(assert (=> (and start!73470 (= defaultEntry!696 defaultEntry!696) t!23423) tb!4507))

(declare-fun result!8625 () Bool)

(assert (=> tb!4507 (= result!8625 tp_is_empty!16521)))

(assert (=> b!858089 t!23423))

(declare-fun b_and!23751 () Bool)

(assert (= b_and!23749 (and (=> t!23423 result!8625) b_and!23751)))

(declare-fun m!798791 () Bool)

(assert (=> b!858089 m!798791))

(declare-fun m!798793 () Bool)

(assert (=> b!858089 m!798793))

(declare-fun m!798795 () Bool)

(assert (=> b!858089 m!798795))

(declare-fun m!798797 () Bool)

(assert (=> b!858089 m!798797))

(assert (=> b!858089 m!798793))

(declare-fun m!798799 () Bool)

(assert (=> b!858089 m!798799))

(assert (=> b!858089 m!798795))

(declare-fun m!798801 () Bool)

(assert (=> b!858094 m!798801))

(declare-fun m!798803 () Bool)

(assert (=> b!858086 m!798803))

(declare-fun m!798805 () Bool)

(assert (=> b!858086 m!798805))

(declare-fun m!798807 () Bool)

(assert (=> b!858086 m!798807))

(assert (=> b!858086 m!798799))

(declare-fun m!798809 () Bool)

(assert (=> b!858086 m!798809))

(assert (=> b!858086 m!798799))

(declare-fun m!798811 () Bool)

(assert (=> b!858086 m!798811))

(declare-fun m!798813 () Bool)

(assert (=> b!858093 m!798813))

(declare-fun m!798815 () Bool)

(assert (=> b!858087 m!798815))

(declare-fun m!798817 () Bool)

(assert (=> b!858096 m!798817))

(declare-fun m!798819 () Bool)

(assert (=> b!858096 m!798819))

(declare-fun m!798821 () Bool)

(assert (=> b!858096 m!798821))

(declare-fun m!798823 () Bool)

(assert (=> mapNonEmpty!26381 m!798823))

(declare-fun m!798825 () Bool)

(assert (=> start!73470 m!798825))

(declare-fun m!798827 () Bool)

(assert (=> start!73470 m!798827))

(declare-fun m!798829 () Bool)

(assert (=> b!858097 m!798829))

(declare-fun m!798831 () Bool)

(assert (=> b!858092 m!798831))

(check-sat (not b_next!14385) (not start!73470) b_and!23751 (not b!858087) tp_is_empty!16521 (not b!858097) (not b!858086) (not mapNonEmpty!26381) (not b!858094) (not b!858096) (not b_lambda!11737) (not b!858089) (not b!858092))
(check-sat b_and!23751 (not b_next!14385))
