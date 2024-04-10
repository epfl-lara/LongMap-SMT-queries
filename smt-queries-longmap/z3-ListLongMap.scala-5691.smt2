; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73932 () Bool)

(assert start!73932)

(declare-fun b_free!14847 () Bool)

(declare-fun b_next!14847 () Bool)

(assert (=> start!73932 (= b_free!14847 (not b_next!14847))))

(declare-fun tp!52044 () Bool)

(declare-fun b_and!24599 () Bool)

(assert (=> start!73932 (= tp!52044 b_and!24599)))

(declare-fun b!868899 () Bool)

(declare-fun e!483921 () Bool)

(declare-fun e!483922 () Bool)

(assert (=> b!868899 (= e!483921 e!483922)))

(declare-fun res!590449 () Bool)

(assert (=> b!868899 (=> (not res!590449) (not e!483922))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868899 (= res!590449 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27691 0))(
  ( (V!27692 (val!8539 Int)) )
))
(declare-datatypes ((tuple2!11338 0))(
  ( (tuple2!11339 (_1!5680 (_ BitVec 64)) (_2!5680 V!27691)) )
))
(declare-datatypes ((List!17132 0))(
  ( (Nil!17129) (Cons!17128 (h!18259 tuple2!11338) (t!24169 List!17132)) )
))
(declare-datatypes ((ListLongMap!10107 0))(
  ( (ListLongMap!10108 (toList!5069 List!17132)) )
))
(declare-fun lt!394623 () ListLongMap!10107)

(declare-datatypes ((ValueCell!8052 0))(
  ( (ValueCellFull!8052 (v!10964 V!27691)) (EmptyCell!8052) )
))
(declare-datatypes ((array!50116 0))(
  ( (array!50117 (arr!24089 (Array (_ BitVec 32) ValueCell!8052)) (size!24529 (_ BitVec 32))) )
))
(declare-fun lt!394622 () array!50116)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50118 0))(
  ( (array!50119 (arr!24090 (Array (_ BitVec 32) (_ BitVec 64))) (size!24530 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50118)

(declare-fun minValue!654 () V!27691)

(declare-fun zeroValue!654 () V!27691)

(declare-fun getCurrentListMapNoExtraKeys!3038 (array!50118 array!50116 (_ BitVec 32) (_ BitVec 32) V!27691 V!27691 (_ BitVec 32) Int) ListLongMap!10107)

(assert (=> b!868899 (= lt!394623 (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!394622 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27691)

(declare-fun _values!688 () array!50116)

(assert (=> b!868899 (= lt!394622 (array!50117 (store (arr!24089 _values!688) i!612 (ValueCellFull!8052 v!557)) (size!24529 _values!688)))))

(declare-fun lt!394621 () ListLongMap!10107)

(assert (=> b!868899 (= lt!394621 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868900 () Bool)

(assert (=> b!868900 (= e!483922 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2410 (ListLongMap!10107 tuple2!11338) ListLongMap!10107)

(assert (=> b!868900 (= (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!394622 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2410 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11339 k0!854 v!557)))))

(declare-datatypes ((Unit!29818 0))(
  ( (Unit!29819) )
))
(declare-fun lt!394624 () Unit!29818)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!604 (array!50118 array!50116 (_ BitVec 32) (_ BitVec 32) V!27691 V!27691 (_ BitVec 32) (_ BitVec 64) V!27691 (_ BitVec 32) Int) Unit!29818)

(assert (=> b!868900 (= lt!394624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!604 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868901 () Bool)

(declare-fun res!590456 () Bool)

(assert (=> b!868901 (=> (not res!590456) (not e!483921))))

(assert (=> b!868901 (= res!590456 (and (= (select (arr!24090 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868902 () Bool)

(declare-fun e!483920 () Bool)

(declare-fun tp_is_empty!16983 () Bool)

(assert (=> b!868902 (= e!483920 tp_is_empty!16983)))

(declare-fun b!868903 () Bool)

(declare-fun res!590448 () Bool)

(assert (=> b!868903 (=> (not res!590448) (not e!483921))))

(assert (=> b!868903 (= res!590448 (and (= (size!24529 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24530 _keys!868) (size!24529 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27074 () Bool)

(declare-fun mapRes!27074 () Bool)

(assert (=> mapIsEmpty!27074 mapRes!27074))

(declare-fun b!868904 () Bool)

(declare-fun e!483925 () Bool)

(declare-fun e!483924 () Bool)

(assert (=> b!868904 (= e!483925 (and e!483924 mapRes!27074))))

(declare-fun condMapEmpty!27074 () Bool)

(declare-fun mapDefault!27074 () ValueCell!8052)

(assert (=> b!868904 (= condMapEmpty!27074 (= (arr!24089 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8052)) mapDefault!27074)))))

(declare-fun b!868905 () Bool)

(declare-fun res!590455 () Bool)

(assert (=> b!868905 (=> (not res!590455) (not e!483921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868905 (= res!590455 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27074 () Bool)

(declare-fun tp!52045 () Bool)

(assert (=> mapNonEmpty!27074 (= mapRes!27074 (and tp!52045 e!483920))))

(declare-fun mapValue!27074 () ValueCell!8052)

(declare-fun mapKey!27074 () (_ BitVec 32))

(declare-fun mapRest!27074 () (Array (_ BitVec 32) ValueCell!8052))

(assert (=> mapNonEmpty!27074 (= (arr!24089 _values!688) (store mapRest!27074 mapKey!27074 mapValue!27074))))

(declare-fun b!868907 () Bool)

(declare-fun res!590452 () Bool)

(assert (=> b!868907 (=> (not res!590452) (not e!483921))))

(declare-datatypes ((List!17133 0))(
  ( (Nil!17130) (Cons!17129 (h!18260 (_ BitVec 64)) (t!24170 List!17133)) )
))
(declare-fun arrayNoDuplicates!0 (array!50118 (_ BitVec 32) List!17133) Bool)

(assert (=> b!868907 (= res!590452 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17130))))

(declare-fun b!868908 () Bool)

(declare-fun res!590453 () Bool)

(assert (=> b!868908 (=> (not res!590453) (not e!483921))))

(assert (=> b!868908 (= res!590453 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24530 _keys!868))))))

(declare-fun res!590454 () Bool)

(assert (=> start!73932 (=> (not res!590454) (not e!483921))))

(assert (=> start!73932 (= res!590454 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24530 _keys!868))))))

(assert (=> start!73932 e!483921))

(assert (=> start!73932 tp_is_empty!16983))

(assert (=> start!73932 true))

(assert (=> start!73932 tp!52044))

(declare-fun array_inv!19028 (array!50118) Bool)

(assert (=> start!73932 (array_inv!19028 _keys!868)))

(declare-fun array_inv!19029 (array!50116) Bool)

(assert (=> start!73932 (and (array_inv!19029 _values!688) e!483925)))

(declare-fun b!868906 () Bool)

(declare-fun res!590450 () Bool)

(assert (=> b!868906 (=> (not res!590450) (not e!483921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868906 (= res!590450 (validKeyInArray!0 k0!854))))

(declare-fun b!868909 () Bool)

(declare-fun res!590451 () Bool)

(assert (=> b!868909 (=> (not res!590451) (not e!483921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50118 (_ BitVec 32)) Bool)

(assert (=> b!868909 (= res!590451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868910 () Bool)

(assert (=> b!868910 (= e!483924 tp_is_empty!16983)))

(assert (= (and start!73932 res!590454) b!868905))

(assert (= (and b!868905 res!590455) b!868903))

(assert (= (and b!868903 res!590448) b!868909))

(assert (= (and b!868909 res!590451) b!868907))

(assert (= (and b!868907 res!590452) b!868908))

(assert (= (and b!868908 res!590453) b!868906))

(assert (= (and b!868906 res!590450) b!868901))

(assert (= (and b!868901 res!590456) b!868899))

(assert (= (and b!868899 res!590449) b!868900))

(assert (= (and b!868904 condMapEmpty!27074) mapIsEmpty!27074))

(assert (= (and b!868904 (not condMapEmpty!27074)) mapNonEmpty!27074))

(get-info :version)

(assert (= (and mapNonEmpty!27074 ((_ is ValueCellFull!8052) mapValue!27074)) b!868902))

(assert (= (and b!868904 ((_ is ValueCellFull!8052) mapDefault!27074)) b!868910))

(assert (= start!73932 b!868904))

(declare-fun m!810527 () Bool)

(assert (=> b!868901 m!810527))

(declare-fun m!810529 () Bool)

(assert (=> b!868909 m!810529))

(declare-fun m!810531 () Bool)

(assert (=> b!868907 m!810531))

(declare-fun m!810533 () Bool)

(assert (=> start!73932 m!810533))

(declare-fun m!810535 () Bool)

(assert (=> start!73932 m!810535))

(declare-fun m!810537 () Bool)

(assert (=> b!868899 m!810537))

(declare-fun m!810539 () Bool)

(assert (=> b!868899 m!810539))

(declare-fun m!810541 () Bool)

(assert (=> b!868899 m!810541))

(declare-fun m!810543 () Bool)

(assert (=> b!868905 m!810543))

(declare-fun m!810545 () Bool)

(assert (=> b!868906 m!810545))

(declare-fun m!810547 () Bool)

(assert (=> mapNonEmpty!27074 m!810547))

(declare-fun m!810549 () Bool)

(assert (=> b!868900 m!810549))

(declare-fun m!810551 () Bool)

(assert (=> b!868900 m!810551))

(assert (=> b!868900 m!810551))

(declare-fun m!810553 () Bool)

(assert (=> b!868900 m!810553))

(declare-fun m!810555 () Bool)

(assert (=> b!868900 m!810555))

(check-sat (not b!868900) (not b!868909) (not b!868907) (not b!868906) (not start!73932) b_and!24599 (not mapNonEmpty!27074) (not b!868905) (not b_next!14847) tp_is_empty!16983 (not b!868899))
(check-sat b_and!24599 (not b_next!14847))
