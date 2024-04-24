; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74520 () Bool)

(assert start!74520)

(declare-fun b_free!15115 () Bool)

(declare-fun b_next!15115 () Bool)

(assert (=> start!74520 (= b_free!15115 (not b_next!15115))))

(declare-fun tp!53021 () Bool)

(declare-fun b_and!24901 () Bool)

(assert (=> start!74520 (= tp!53021 b_and!24901)))

(declare-fun b!876010 () Bool)

(declare-fun e!487768 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28193 0))(
  ( (V!28194 (val!8727 Int)) )
))
(declare-datatypes ((ValueCell!8240 0))(
  ( (ValueCellFull!8240 (v!11156 V!28193)) (EmptyCell!8240) )
))
(declare-datatypes ((array!50897 0))(
  ( (array!50898 (arr!24472 (Array (_ BitVec 32) ValueCell!8240)) (size!24913 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50897)

(assert (=> b!876010 (= e!487768 (bvslt i!612 (size!24913 _values!688)))))

(declare-fun b!876011 () Bool)

(declare-fun e!487769 () Bool)

(declare-fun e!487766 () Bool)

(assert (=> b!876011 (= e!487769 e!487766)))

(declare-fun res!595069 () Bool)

(assert (=> b!876011 (=> (not res!595069) (not e!487766))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876011 (= res!595069 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11464 0))(
  ( (tuple2!11465 (_1!5743 (_ BitVec 64)) (_2!5743 V!28193)) )
))
(declare-datatypes ((List!17308 0))(
  ( (Nil!17305) (Cons!17304 (h!18441 tuple2!11464) (t!24341 List!17308)) )
))
(declare-datatypes ((ListLongMap!10235 0))(
  ( (ListLongMap!10236 (toList!5133 List!17308)) )
))
(declare-fun lt!396444 () ListLongMap!10235)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50899 0))(
  ( (array!50900 (arr!24473 (Array (_ BitVec 32) (_ BitVec 64))) (size!24914 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50899)

(declare-fun lt!396443 () array!50897)

(declare-fun minValue!654 () V!28193)

(declare-fun zeroValue!654 () V!28193)

(declare-fun getCurrentListMapNoExtraKeys!3176 (array!50899 array!50897 (_ BitVec 32) (_ BitVec 32) V!28193 V!28193 (_ BitVec 32) Int) ListLongMap!10235)

(assert (=> b!876011 (= lt!396444 (getCurrentListMapNoExtraKeys!3176 _keys!868 lt!396443 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28193)

(assert (=> b!876011 (= lt!396443 (array!50898 (store (arr!24472 _values!688) i!612 (ValueCellFull!8240 v!557)) (size!24913 _values!688)))))

(declare-fun lt!396442 () ListLongMap!10235)

(assert (=> b!876011 (= lt!396442 (getCurrentListMapNoExtraKeys!3176 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38615 () ListLongMap!10235)

(declare-fun b!876012 () Bool)

(declare-fun e!487765 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!38616 () ListLongMap!10235)

(declare-fun +!2482 (ListLongMap!10235 tuple2!11464) ListLongMap!10235)

(assert (=> b!876012 (= e!487765 (= call!38616 (+!2482 call!38615 (tuple2!11465 k0!854 v!557))))))

(declare-fun b!876013 () Bool)

(declare-fun res!595068 () Bool)

(assert (=> b!876013 (=> (not res!595068) (not e!487769))))

(assert (=> b!876013 (= res!595068 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24914 _keys!868))))))

(declare-fun b!876014 () Bool)

(declare-fun res!595066 () Bool)

(assert (=> b!876014 (=> (not res!595066) (not e!487769))))

(assert (=> b!876014 (= res!595066 (and (= (size!24913 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24914 _keys!868) (size!24913 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876015 () Bool)

(declare-fun res!595065 () Bool)

(assert (=> b!876015 (=> (not res!595065) (not e!487769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876015 (= res!595065 (validKeyInArray!0 k0!854))))

(declare-fun b!876016 () Bool)

(assert (=> b!876016 (= e!487765 (= call!38616 call!38615))))

(declare-fun b!876017 () Bool)

(declare-fun e!487763 () Bool)

(declare-fun e!487767 () Bool)

(declare-fun mapRes!27647 () Bool)

(assert (=> b!876017 (= e!487763 (and e!487767 mapRes!27647))))

(declare-fun condMapEmpty!27647 () Bool)

(declare-fun mapDefault!27647 () ValueCell!8240)

(assert (=> b!876017 (= condMapEmpty!27647 (= (arr!24472 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8240)) mapDefault!27647)))))

(declare-fun b!876018 () Bool)

(declare-fun res!595070 () Bool)

(assert (=> b!876018 (=> (not res!595070) (not e!487769))))

(declare-datatypes ((List!17309 0))(
  ( (Nil!17306) (Cons!17305 (h!18442 (_ BitVec 64)) (t!24342 List!17309)) )
))
(declare-fun arrayNoDuplicates!0 (array!50899 (_ BitVec 32) List!17309) Bool)

(assert (=> b!876018 (= res!595070 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17306))))

(declare-fun res!595067 () Bool)

(assert (=> start!74520 (=> (not res!595067) (not e!487769))))

(assert (=> start!74520 (= res!595067 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24914 _keys!868))))))

(assert (=> start!74520 e!487769))

(declare-fun tp_is_empty!17359 () Bool)

(assert (=> start!74520 tp_is_empty!17359))

(assert (=> start!74520 true))

(assert (=> start!74520 tp!53021))

(declare-fun array_inv!19350 (array!50899) Bool)

(assert (=> start!74520 (array_inv!19350 _keys!868)))

(declare-fun array_inv!19351 (array!50897) Bool)

(assert (=> start!74520 (and (array_inv!19351 _values!688) e!487763)))

(declare-fun b!876019 () Bool)

(assert (=> b!876019 (= e!487767 tp_is_empty!17359)))

(declare-fun bm!38612 () Bool)

(assert (=> bm!38612 (= call!38615 (getCurrentListMapNoExtraKeys!3176 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876020 () Bool)

(declare-fun e!487762 () Bool)

(assert (=> b!876020 (= e!487762 tp_is_empty!17359)))

(declare-fun b!876021 () Bool)

(declare-fun res!595073 () Bool)

(assert (=> b!876021 (=> (not res!595073) (not e!487769))))

(assert (=> b!876021 (= res!595073 (and (= (select (arr!24473 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27647 () Bool)

(assert (=> mapIsEmpty!27647 mapRes!27647))

(declare-fun b!876022 () Bool)

(assert (=> b!876022 (= e!487766 (not e!487768))))

(declare-fun res!595064 () Bool)

(assert (=> b!876022 (=> res!595064 e!487768)))

(assert (=> b!876022 (= res!595064 (not (validKeyInArray!0 (select (arr!24473 _keys!868) from!1053))))))

(assert (=> b!876022 e!487765))

(declare-fun c!92768 () Bool)

(assert (=> b!876022 (= c!92768 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29914 0))(
  ( (Unit!29915) )
))
(declare-fun lt!396441 () Unit!29914)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!651 (array!50899 array!50897 (_ BitVec 32) (_ BitVec 32) V!28193 V!28193 (_ BitVec 32) (_ BitVec 64) V!28193 (_ BitVec 32) Int) Unit!29914)

(assert (=> b!876022 (= lt!396441 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!651 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876023 () Bool)

(declare-fun res!595072 () Bool)

(assert (=> b!876023 (=> (not res!595072) (not e!487769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876023 (= res!595072 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27647 () Bool)

(declare-fun tp!53020 () Bool)

(assert (=> mapNonEmpty!27647 (= mapRes!27647 (and tp!53020 e!487762))))

(declare-fun mapValue!27647 () ValueCell!8240)

(declare-fun mapKey!27647 () (_ BitVec 32))

(declare-fun mapRest!27647 () (Array (_ BitVec 32) ValueCell!8240))

(assert (=> mapNonEmpty!27647 (= (arr!24472 _values!688) (store mapRest!27647 mapKey!27647 mapValue!27647))))

(declare-fun bm!38613 () Bool)

(assert (=> bm!38613 (= call!38616 (getCurrentListMapNoExtraKeys!3176 _keys!868 lt!396443 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876024 () Bool)

(declare-fun res!595071 () Bool)

(assert (=> b!876024 (=> (not res!595071) (not e!487769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50899 (_ BitVec 32)) Bool)

(assert (=> b!876024 (= res!595071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74520 res!595067) b!876023))

(assert (= (and b!876023 res!595072) b!876014))

(assert (= (and b!876014 res!595066) b!876024))

(assert (= (and b!876024 res!595071) b!876018))

(assert (= (and b!876018 res!595070) b!876013))

(assert (= (and b!876013 res!595068) b!876015))

(assert (= (and b!876015 res!595065) b!876021))

(assert (= (and b!876021 res!595073) b!876011))

(assert (= (and b!876011 res!595069) b!876022))

(assert (= (and b!876022 c!92768) b!876012))

(assert (= (and b!876022 (not c!92768)) b!876016))

(assert (= (or b!876012 b!876016) bm!38613))

(assert (= (or b!876012 b!876016) bm!38612))

(assert (= (and b!876022 (not res!595064)) b!876010))

(assert (= (and b!876017 condMapEmpty!27647) mapIsEmpty!27647))

(assert (= (and b!876017 (not condMapEmpty!27647)) mapNonEmpty!27647))

(get-info :version)

(assert (= (and mapNonEmpty!27647 ((_ is ValueCellFull!8240) mapValue!27647)) b!876020))

(assert (= (and b!876017 ((_ is ValueCellFull!8240) mapDefault!27647)) b!876019))

(assert (= start!74520 b!876017))

(declare-fun m!816343 () Bool)

(assert (=> b!876023 m!816343))

(declare-fun m!816345 () Bool)

(assert (=> b!876018 m!816345))

(declare-fun m!816347 () Bool)

(assert (=> bm!38612 m!816347))

(declare-fun m!816349 () Bool)

(assert (=> start!74520 m!816349))

(declare-fun m!816351 () Bool)

(assert (=> start!74520 m!816351))

(declare-fun m!816353 () Bool)

(assert (=> bm!38613 m!816353))

(declare-fun m!816355 () Bool)

(assert (=> b!876021 m!816355))

(declare-fun m!816357 () Bool)

(assert (=> b!876022 m!816357))

(assert (=> b!876022 m!816357))

(declare-fun m!816359 () Bool)

(assert (=> b!876022 m!816359))

(declare-fun m!816361 () Bool)

(assert (=> b!876022 m!816361))

(declare-fun m!816363 () Bool)

(assert (=> b!876012 m!816363))

(declare-fun m!816365 () Bool)

(assert (=> b!876024 m!816365))

(declare-fun m!816367 () Bool)

(assert (=> b!876015 m!816367))

(declare-fun m!816369 () Bool)

(assert (=> mapNonEmpty!27647 m!816369))

(declare-fun m!816371 () Bool)

(assert (=> b!876011 m!816371))

(declare-fun m!816373 () Bool)

(assert (=> b!876011 m!816373))

(declare-fun m!816375 () Bool)

(assert (=> b!876011 m!816375))

(check-sat (not b!876022) (not b!876011) (not bm!38613) (not b!876024) (not bm!38612) (not start!74520) (not b!876015) (not b!876023) tp_is_empty!17359 (not b_next!15115) (not b!876012) (not mapNonEmpty!27647) (not b!876018) b_and!24901)
(check-sat b_and!24901 (not b_next!15115))
