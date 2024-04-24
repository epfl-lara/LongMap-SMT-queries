; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74050 () Bool)

(assert start!74050)

(declare-fun b_free!14797 () Bool)

(declare-fun b_next!14797 () Bool)

(assert (=> start!74050 (= b_free!14797 (not b_next!14797))))

(declare-fun tp!51895 () Bool)

(declare-fun b_and!24559 () Bool)

(assert (=> start!74050 (= tp!51895 b_and!24559)))

(declare-fun b!868902 () Bool)

(declare-fun res!590117 () Bool)

(declare-fun e!484055 () Bool)

(assert (=> b!868902 (=> (not res!590117) (not e!484055))))

(declare-datatypes ((array!50075 0))(
  ( (array!50076 (arr!24064 (Array (_ BitVec 32) (_ BitVec 64))) (size!24505 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50075)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50075 (_ BitVec 32)) Bool)

(assert (=> b!868902 (= res!590117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868903 () Bool)

(declare-fun res!590121 () Bool)

(assert (=> b!868903 (=> (not res!590121) (not e!484055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868903 (= res!590121 (validMask!0 mask!1196))))

(declare-fun b!868904 () Bool)

(declare-fun e!484057 () Bool)

(declare-fun e!484056 () Bool)

(declare-fun mapRes!26999 () Bool)

(assert (=> b!868904 (= e!484057 (and e!484056 mapRes!26999))))

(declare-fun condMapEmpty!26999 () Bool)

(declare-datatypes ((V!27625 0))(
  ( (V!27626 (val!8514 Int)) )
))
(declare-datatypes ((ValueCell!8027 0))(
  ( (ValueCellFull!8027 (v!10939 V!27625)) (EmptyCell!8027) )
))
(declare-datatypes ((array!50077 0))(
  ( (array!50078 (arr!24065 (Array (_ BitVec 32) ValueCell!8027)) (size!24506 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50077)

(declare-fun mapDefault!26999 () ValueCell!8027)

(assert (=> b!868904 (= condMapEmpty!26999 (= (arr!24065 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8027)) mapDefault!26999)))))

(declare-fun b!868905 () Bool)

(declare-fun res!590123 () Bool)

(assert (=> b!868905 (=> (not res!590123) (not e!484055))))

(declare-datatypes ((List!17052 0))(
  ( (Nil!17049) (Cons!17048 (h!18185 (_ BitVec 64)) (t!24081 List!17052)) )
))
(declare-fun arrayNoDuplicates!0 (array!50075 (_ BitVec 32) List!17052) Bool)

(assert (=> b!868905 (= res!590123 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17049))))

(declare-fun b!868906 () Bool)

(declare-fun e!484053 () Bool)

(assert (=> b!868906 (= e!484055 e!484053)))

(declare-fun res!590125 () Bool)

(assert (=> b!868906 (=> (not res!590125) (not e!484053))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868906 (= res!590125 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394684 () array!50077)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11224 0))(
  ( (tuple2!11225 (_1!5623 (_ BitVec 64)) (_2!5623 V!27625)) )
))
(declare-datatypes ((List!17053 0))(
  ( (Nil!17050) (Cons!17049 (h!18186 tuple2!11224) (t!24082 List!17053)) )
))
(declare-datatypes ((ListLongMap!9995 0))(
  ( (ListLongMap!9996 (toList!5013 List!17053)) )
))
(declare-fun lt!394683 () ListLongMap!9995)

(declare-fun minValue!654 () V!27625)

(declare-fun zeroValue!654 () V!27625)

(declare-fun getCurrentListMapNoExtraKeys!3057 (array!50075 array!50077 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) Int) ListLongMap!9995)

(assert (=> b!868906 (= lt!394683 (getCurrentListMapNoExtraKeys!3057 _keys!868 lt!394684 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27625)

(assert (=> b!868906 (= lt!394684 (array!50078 (store (arr!24065 _values!688) i!612 (ValueCellFull!8027 v!557)) (size!24506 _values!688)))))

(declare-fun lt!394682 () ListLongMap!9995)

(assert (=> b!868906 (= lt!394682 (getCurrentListMapNoExtraKeys!3057 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26999 () Bool)

(assert (=> mapIsEmpty!26999 mapRes!26999))

(declare-fun b!868908 () Bool)

(assert (=> b!868908 (= e!484053 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2414 (ListLongMap!9995 tuple2!11224) ListLongMap!9995)

(assert (=> b!868908 (= (getCurrentListMapNoExtraKeys!3057 _keys!868 lt!394684 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2414 (getCurrentListMapNoExtraKeys!3057 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11225 k0!854 v!557)))))

(declare-datatypes ((Unit!29778 0))(
  ( (Unit!29779) )
))
(declare-fun lt!394685 () Unit!29778)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 (array!50075 array!50077 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) (_ BitVec 64) V!27625 (_ BitVec 32) Int) Unit!29778)

(assert (=> b!868908 (= lt!394685 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868909 () Bool)

(declare-fun res!590120 () Bool)

(assert (=> b!868909 (=> (not res!590120) (not e!484055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868909 (= res!590120 (validKeyInArray!0 k0!854))))

(declare-fun b!868910 () Bool)

(declare-fun tp_is_empty!16933 () Bool)

(assert (=> b!868910 (= e!484056 tp_is_empty!16933)))

(declare-fun b!868911 () Bool)

(declare-fun res!590124 () Bool)

(assert (=> b!868911 (=> (not res!590124) (not e!484055))))

(assert (=> b!868911 (= res!590124 (and (= (size!24506 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24505 _keys!868) (size!24506 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868912 () Bool)

(declare-fun res!590119 () Bool)

(assert (=> b!868912 (=> (not res!590119) (not e!484055))))

(assert (=> b!868912 (= res!590119 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24505 _keys!868))))))

(declare-fun res!590118 () Bool)

(assert (=> start!74050 (=> (not res!590118) (not e!484055))))

(assert (=> start!74050 (= res!590118 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24505 _keys!868))))))

(assert (=> start!74050 e!484055))

(assert (=> start!74050 tp_is_empty!16933))

(assert (=> start!74050 true))

(assert (=> start!74050 tp!51895))

(declare-fun array_inv!19068 (array!50075) Bool)

(assert (=> start!74050 (array_inv!19068 _keys!868)))

(declare-fun array_inv!19069 (array!50077) Bool)

(assert (=> start!74050 (and (array_inv!19069 _values!688) e!484057)))

(declare-fun b!868907 () Bool)

(declare-fun e!484054 () Bool)

(assert (=> b!868907 (= e!484054 tp_is_empty!16933)))

(declare-fun b!868913 () Bool)

(declare-fun res!590122 () Bool)

(assert (=> b!868913 (=> (not res!590122) (not e!484055))))

(assert (=> b!868913 (= res!590122 (and (= (select (arr!24064 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26999 () Bool)

(declare-fun tp!51896 () Bool)

(assert (=> mapNonEmpty!26999 (= mapRes!26999 (and tp!51896 e!484054))))

(declare-fun mapRest!26999 () (Array (_ BitVec 32) ValueCell!8027))

(declare-fun mapValue!26999 () ValueCell!8027)

(declare-fun mapKey!26999 () (_ BitVec 32))

(assert (=> mapNonEmpty!26999 (= (arr!24065 _values!688) (store mapRest!26999 mapKey!26999 mapValue!26999))))

(assert (= (and start!74050 res!590118) b!868903))

(assert (= (and b!868903 res!590121) b!868911))

(assert (= (and b!868911 res!590124) b!868902))

(assert (= (and b!868902 res!590117) b!868905))

(assert (= (and b!868905 res!590123) b!868912))

(assert (= (and b!868912 res!590119) b!868909))

(assert (= (and b!868909 res!590120) b!868913))

(assert (= (and b!868913 res!590122) b!868906))

(assert (= (and b!868906 res!590125) b!868908))

(assert (= (and b!868904 condMapEmpty!26999) mapIsEmpty!26999))

(assert (= (and b!868904 (not condMapEmpty!26999)) mapNonEmpty!26999))

(get-info :version)

(assert (= (and mapNonEmpty!26999 ((_ is ValueCellFull!8027) mapValue!26999)) b!868907))

(assert (= (and b!868904 ((_ is ValueCellFull!8027) mapDefault!26999)) b!868910))

(assert (= start!74050 b!868904))

(declare-fun m!811067 () Bool)

(assert (=> b!868906 m!811067))

(declare-fun m!811069 () Bool)

(assert (=> b!868906 m!811069))

(declare-fun m!811071 () Bool)

(assert (=> b!868906 m!811071))

(declare-fun m!811073 () Bool)

(assert (=> b!868905 m!811073))

(declare-fun m!811075 () Bool)

(assert (=> b!868909 m!811075))

(declare-fun m!811077 () Bool)

(assert (=> mapNonEmpty!26999 m!811077))

(declare-fun m!811079 () Bool)

(assert (=> b!868913 m!811079))

(declare-fun m!811081 () Bool)

(assert (=> start!74050 m!811081))

(declare-fun m!811083 () Bool)

(assert (=> start!74050 m!811083))

(declare-fun m!811085 () Bool)

(assert (=> b!868902 m!811085))

(declare-fun m!811087 () Bool)

(assert (=> b!868903 m!811087))

(declare-fun m!811089 () Bool)

(assert (=> b!868908 m!811089))

(declare-fun m!811091 () Bool)

(assert (=> b!868908 m!811091))

(assert (=> b!868908 m!811091))

(declare-fun m!811093 () Bool)

(assert (=> b!868908 m!811093))

(declare-fun m!811095 () Bool)

(assert (=> b!868908 m!811095))

(check-sat (not b!868903) tp_is_empty!16933 (not b_next!14797) (not mapNonEmpty!26999) (not b!868902) (not b!868906) b_and!24559 (not b!868908) (not b!868905) (not b!868909) (not start!74050))
(check-sat b_and!24559 (not b_next!14797))
