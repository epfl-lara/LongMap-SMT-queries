; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73936 () Bool)

(assert start!73936)

(declare-fun b_free!14869 () Bool)

(declare-fun b_next!14869 () Bool)

(assert (=> start!73936 (= b_free!14869 (not b_next!14869))))

(declare-fun tp!52112 () Bool)

(declare-fun b_and!24595 () Bool)

(assert (=> start!73936 (= tp!52112 b_and!24595)))

(declare-fun b!869056 () Bool)

(declare-fun res!590639 () Bool)

(declare-fun e!483974 () Bool)

(assert (=> b!869056 (=> (not res!590639) (not e!483974))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869056 (= res!590639 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27107 () Bool)

(declare-fun mapRes!27107 () Bool)

(assert (=> mapIsEmpty!27107 mapRes!27107))

(declare-fun b!869057 () Bool)

(declare-fun e!483973 () Bool)

(assert (=> b!869057 (= e!483973 (not true))))

(declare-datatypes ((V!27721 0))(
  ( (V!27722 (val!8550 Int)) )
))
(declare-fun v!557 () V!27721)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8063 0))(
  ( (ValueCellFull!8063 (v!10969 V!27721)) (EmptyCell!8063) )
))
(declare-datatypes ((array!50149 0))(
  ( (array!50150 (arr!24106 (Array (_ BitVec 32) ValueCell!8063)) (size!24548 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50149)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27721)

(declare-fun zeroValue!654 () V!27721)

(declare-datatypes ((array!50151 0))(
  ( (array!50152 (arr!24107 (Array (_ BitVec 32) (_ BitVec 64))) (size!24549 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50151)

(declare-fun lt!394518 () array!50149)

(declare-datatypes ((tuple2!11370 0))(
  ( (tuple2!11371 (_1!5696 (_ BitVec 64)) (_2!5696 V!27721)) )
))
(declare-datatypes ((List!17155 0))(
  ( (Nil!17152) (Cons!17151 (h!18282 tuple2!11370) (t!24183 List!17155)) )
))
(declare-datatypes ((ListLongMap!10129 0))(
  ( (ListLongMap!10130 (toList!5080 List!17155)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3073 (array!50151 array!50149 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) Int) ListLongMap!10129)

(declare-fun +!2442 (ListLongMap!10129 tuple2!11370) ListLongMap!10129)

(assert (=> b!869057 (= (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!394518 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2442 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11371 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29771 0))(
  ( (Unit!29772) )
))
(declare-fun lt!394519 () Unit!29771)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!610 (array!50151 array!50149 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) (_ BitVec 64) V!27721 (_ BitVec 32) Int) Unit!29771)

(assert (=> b!869057 (= lt!394519 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!610 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869058 () Bool)

(declare-fun e!483972 () Bool)

(declare-fun e!483970 () Bool)

(assert (=> b!869058 (= e!483972 (and e!483970 mapRes!27107))))

(declare-fun condMapEmpty!27107 () Bool)

(declare-fun mapDefault!27107 () ValueCell!8063)

(assert (=> b!869058 (= condMapEmpty!27107 (= (arr!24106 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8063)) mapDefault!27107)))))

(declare-fun b!869059 () Bool)

(declare-fun e!483971 () Bool)

(declare-fun tp_is_empty!17005 () Bool)

(assert (=> b!869059 (= e!483971 tp_is_empty!17005)))

(declare-fun res!590635 () Bool)

(assert (=> start!73936 (=> (not res!590635) (not e!483974))))

(assert (=> start!73936 (= res!590635 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24549 _keys!868))))))

(assert (=> start!73936 e!483974))

(assert (=> start!73936 tp_is_empty!17005))

(assert (=> start!73936 true))

(assert (=> start!73936 tp!52112))

(declare-fun array_inv!19106 (array!50151) Bool)

(assert (=> start!73936 (array_inv!19106 _keys!868)))

(declare-fun array_inv!19107 (array!50149) Bool)

(assert (=> start!73936 (and (array_inv!19107 _values!688) e!483972)))

(declare-fun b!869060 () Bool)

(declare-fun res!590642 () Bool)

(assert (=> b!869060 (=> (not res!590642) (not e!483974))))

(declare-datatypes ((List!17156 0))(
  ( (Nil!17153) (Cons!17152 (h!18283 (_ BitVec 64)) (t!24184 List!17156)) )
))
(declare-fun arrayNoDuplicates!0 (array!50151 (_ BitVec 32) List!17156) Bool)

(assert (=> b!869060 (= res!590642 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17153))))

(declare-fun b!869061 () Bool)

(declare-fun res!590636 () Bool)

(assert (=> b!869061 (=> (not res!590636) (not e!483974))))

(assert (=> b!869061 (= res!590636 (and (= (size!24548 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24549 _keys!868) (size!24548 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869062 () Bool)

(assert (=> b!869062 (= e!483970 tp_is_empty!17005)))

(declare-fun b!869063 () Bool)

(declare-fun res!590637 () Bool)

(assert (=> b!869063 (=> (not res!590637) (not e!483974))))

(assert (=> b!869063 (= res!590637 (and (= (select (arr!24107 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869064 () Bool)

(declare-fun res!590638 () Bool)

(assert (=> b!869064 (=> (not res!590638) (not e!483974))))

(assert (=> b!869064 (= res!590638 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24549 _keys!868))))))

(declare-fun b!869065 () Bool)

(assert (=> b!869065 (= e!483974 e!483973)))

(declare-fun res!590640 () Bool)

(assert (=> b!869065 (=> (not res!590640) (not e!483973))))

(assert (=> b!869065 (= res!590640 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394520 () ListLongMap!10129)

(assert (=> b!869065 (= lt!394520 (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!394518 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869065 (= lt!394518 (array!50150 (store (arr!24106 _values!688) i!612 (ValueCellFull!8063 v!557)) (size!24548 _values!688)))))

(declare-fun lt!394517 () ListLongMap!10129)

(assert (=> b!869065 (= lt!394517 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869066 () Bool)

(declare-fun res!590641 () Bool)

(assert (=> b!869066 (=> (not res!590641) (not e!483974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869066 (= res!590641 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27107 () Bool)

(declare-fun tp!52111 () Bool)

(assert (=> mapNonEmpty!27107 (= mapRes!27107 (and tp!52111 e!483971))))

(declare-fun mapKey!27107 () (_ BitVec 32))

(declare-fun mapRest!27107 () (Array (_ BitVec 32) ValueCell!8063))

(declare-fun mapValue!27107 () ValueCell!8063)

(assert (=> mapNonEmpty!27107 (= (arr!24106 _values!688) (store mapRest!27107 mapKey!27107 mapValue!27107))))

(declare-fun b!869067 () Bool)

(declare-fun res!590643 () Bool)

(assert (=> b!869067 (=> (not res!590643) (not e!483974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50151 (_ BitVec 32)) Bool)

(assert (=> b!869067 (= res!590643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73936 res!590635) b!869066))

(assert (= (and b!869066 res!590641) b!869061))

(assert (= (and b!869061 res!590636) b!869067))

(assert (= (and b!869067 res!590643) b!869060))

(assert (= (and b!869060 res!590642) b!869064))

(assert (= (and b!869064 res!590638) b!869056))

(assert (= (and b!869056 res!590639) b!869063))

(assert (= (and b!869063 res!590637) b!869065))

(assert (= (and b!869065 res!590640) b!869057))

(assert (= (and b!869058 condMapEmpty!27107) mapIsEmpty!27107))

(assert (= (and b!869058 (not condMapEmpty!27107)) mapNonEmpty!27107))

(get-info :version)

(assert (= (and mapNonEmpty!27107 ((_ is ValueCellFull!8063) mapValue!27107)) b!869059))

(assert (= (and b!869058 ((_ is ValueCellFull!8063) mapDefault!27107)) b!869062))

(assert (= start!73936 b!869058))

(declare-fun m!810099 () Bool)

(assert (=> b!869067 m!810099))

(declare-fun m!810101 () Bool)

(assert (=> start!73936 m!810101))

(declare-fun m!810103 () Bool)

(assert (=> start!73936 m!810103))

(declare-fun m!810105 () Bool)

(assert (=> b!869056 m!810105))

(declare-fun m!810107 () Bool)

(assert (=> b!869063 m!810107))

(declare-fun m!810109 () Bool)

(assert (=> b!869066 m!810109))

(declare-fun m!810111 () Bool)

(assert (=> b!869057 m!810111))

(declare-fun m!810113 () Bool)

(assert (=> b!869057 m!810113))

(assert (=> b!869057 m!810113))

(declare-fun m!810115 () Bool)

(assert (=> b!869057 m!810115))

(declare-fun m!810117 () Bool)

(assert (=> b!869057 m!810117))

(declare-fun m!810119 () Bool)

(assert (=> b!869060 m!810119))

(declare-fun m!810121 () Bool)

(assert (=> b!869065 m!810121))

(declare-fun m!810123 () Bool)

(assert (=> b!869065 m!810123))

(declare-fun m!810125 () Bool)

(assert (=> b!869065 m!810125))

(declare-fun m!810127 () Bool)

(assert (=> mapNonEmpty!27107 m!810127))

(check-sat (not b!869056) (not b!869066) (not start!73936) (not b!869067) (not mapNonEmpty!27107) b_and!24595 (not b!869060) tp_is_empty!17005 (not b!869065) (not b_next!14869) (not b!869057))
(check-sat b_and!24595 (not b_next!14869))
