; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74004 () Bool)

(assert start!74004)

(declare-fun b_free!14919 () Bool)

(declare-fun b_next!14919 () Bool)

(assert (=> start!74004 (= b_free!14919 (not b_next!14919))))

(declare-fun tp!52260 () Bool)

(declare-fun b_and!24671 () Bool)

(assert (=> start!74004 (= tp!52260 b_and!24671)))

(declare-fun b!870195 () Bool)

(declare-fun res!591424 () Bool)

(declare-fun e!484569 () Bool)

(assert (=> b!870195 (=> (not res!591424) (not e!484569))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870195 (= res!591424 (validMask!0 mask!1196))))

(declare-fun b!870196 () Bool)

(declare-fun res!591423 () Bool)

(assert (=> b!870196 (=> (not res!591423) (not e!484569))))

(declare-datatypes ((array!50256 0))(
  ( (array!50257 (arr!24159 (Array (_ BitVec 32) (_ BitVec 64))) (size!24599 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50256)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50256 (_ BitVec 32)) Bool)

(assert (=> b!870196 (= res!591423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870197 () Bool)

(declare-fun res!591420 () Bool)

(assert (=> b!870197 (=> (not res!591420) (not e!484569))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870197 (= res!591420 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24599 _keys!868))))))

(declare-fun b!870198 () Bool)

(declare-fun res!591426 () Bool)

(assert (=> b!870198 (=> (not res!591426) (not e!484569))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870198 (= res!591426 (and (= (select (arr!24159 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870199 () Bool)

(declare-fun res!591428 () Bool)

(assert (=> b!870199 (=> (not res!591428) (not e!484569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870199 (= res!591428 (validKeyInArray!0 k0!854))))

(declare-fun b!870200 () Bool)

(declare-fun e!484572 () Bool)

(declare-fun e!484573 () Bool)

(declare-fun mapRes!27182 () Bool)

(assert (=> b!870200 (= e!484572 (and e!484573 mapRes!27182))))

(declare-fun condMapEmpty!27182 () Bool)

(declare-datatypes ((V!27787 0))(
  ( (V!27788 (val!8575 Int)) )
))
(declare-datatypes ((ValueCell!8088 0))(
  ( (ValueCellFull!8088 (v!11000 V!27787)) (EmptyCell!8088) )
))
(declare-datatypes ((array!50258 0))(
  ( (array!50259 (arr!24160 (Array (_ BitVec 32) ValueCell!8088)) (size!24600 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50258)

(declare-fun mapDefault!27182 () ValueCell!8088)

(assert (=> b!870200 (= condMapEmpty!27182 (= (arr!24160 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8088)) mapDefault!27182)))))

(declare-fun mapNonEmpty!27182 () Bool)

(declare-fun tp!52261 () Bool)

(declare-fun e!484571 () Bool)

(assert (=> mapNonEmpty!27182 (= mapRes!27182 (and tp!52261 e!484571))))

(declare-fun mapKey!27182 () (_ BitVec 32))

(declare-fun mapValue!27182 () ValueCell!8088)

(declare-fun mapRest!27182 () (Array (_ BitVec 32) ValueCell!8088))

(assert (=> mapNonEmpty!27182 (= (arr!24160 _values!688) (store mapRest!27182 mapKey!27182 mapValue!27182))))

(declare-fun b!870201 () Bool)

(declare-fun tp_is_empty!17055 () Bool)

(assert (=> b!870201 (= e!484571 tp_is_empty!17055)))

(declare-fun res!591425 () Bool)

(assert (=> start!74004 (=> (not res!591425) (not e!484569))))

(assert (=> start!74004 (= res!591425 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24599 _keys!868))))))

(assert (=> start!74004 e!484569))

(assert (=> start!74004 tp_is_empty!17055))

(assert (=> start!74004 true))

(assert (=> start!74004 tp!52260))

(declare-fun array_inv!19080 (array!50256) Bool)

(assert (=> start!74004 (array_inv!19080 _keys!868)))

(declare-fun array_inv!19081 (array!50258) Bool)

(assert (=> start!74004 (and (array_inv!19081 _values!688) e!484572)))

(declare-fun b!870202 () Bool)

(declare-fun res!591421 () Bool)

(assert (=> b!870202 (=> (not res!591421) (not e!484569))))

(declare-datatypes ((List!17184 0))(
  ( (Nil!17181) (Cons!17180 (h!18311 (_ BitVec 64)) (t!24221 List!17184)) )
))
(declare-fun arrayNoDuplicates!0 (array!50256 (_ BitVec 32) List!17184) Bool)

(assert (=> b!870202 (= res!591421 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17181))))

(declare-fun mapIsEmpty!27182 () Bool)

(assert (=> mapIsEmpty!27182 mapRes!27182))

(declare-fun b!870203 () Bool)

(declare-fun res!591422 () Bool)

(assert (=> b!870203 (=> (not res!591422) (not e!484569))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!870203 (= res!591422 (and (= (size!24600 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24599 _keys!868) (size!24600 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870204 () Bool)

(declare-fun e!484570 () Bool)

(assert (=> b!870204 (= e!484570 (not true))))

(declare-fun v!557 () V!27787)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395056 () array!50258)

(declare-fun minValue!654 () V!27787)

(declare-fun zeroValue!654 () V!27787)

(declare-datatypes ((tuple2!11392 0))(
  ( (tuple2!11393 (_1!5707 (_ BitVec 64)) (_2!5707 V!27787)) )
))
(declare-datatypes ((List!17185 0))(
  ( (Nil!17182) (Cons!17181 (h!18312 tuple2!11392) (t!24222 List!17185)) )
))
(declare-datatypes ((ListLongMap!10161 0))(
  ( (ListLongMap!10162 (toList!5096 List!17185)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3065 (array!50256 array!50258 (_ BitVec 32) (_ BitVec 32) V!27787 V!27787 (_ BitVec 32) Int) ListLongMap!10161)

(declare-fun +!2436 (ListLongMap!10161 tuple2!11392) ListLongMap!10161)

(assert (=> b!870204 (= (getCurrentListMapNoExtraKeys!3065 _keys!868 lt!395056 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2436 (getCurrentListMapNoExtraKeys!3065 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11393 k0!854 v!557)))))

(declare-datatypes ((Unit!29870 0))(
  ( (Unit!29871) )
))
(declare-fun lt!395053 () Unit!29870)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!630 (array!50256 array!50258 (_ BitVec 32) (_ BitVec 32) V!27787 V!27787 (_ BitVec 32) (_ BitVec 64) V!27787 (_ BitVec 32) Int) Unit!29870)

(assert (=> b!870204 (= lt!395053 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!630 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870205 () Bool)

(assert (=> b!870205 (= e!484573 tp_is_empty!17055)))

(declare-fun b!870206 () Bool)

(assert (=> b!870206 (= e!484569 e!484570)))

(declare-fun res!591427 () Bool)

(assert (=> b!870206 (=> (not res!591427) (not e!484570))))

(assert (=> b!870206 (= res!591427 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395055 () ListLongMap!10161)

(assert (=> b!870206 (= lt!395055 (getCurrentListMapNoExtraKeys!3065 _keys!868 lt!395056 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870206 (= lt!395056 (array!50259 (store (arr!24160 _values!688) i!612 (ValueCellFull!8088 v!557)) (size!24600 _values!688)))))

(declare-fun lt!395054 () ListLongMap!10161)

(assert (=> b!870206 (= lt!395054 (getCurrentListMapNoExtraKeys!3065 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74004 res!591425) b!870195))

(assert (= (and b!870195 res!591424) b!870203))

(assert (= (and b!870203 res!591422) b!870196))

(assert (= (and b!870196 res!591423) b!870202))

(assert (= (and b!870202 res!591421) b!870197))

(assert (= (and b!870197 res!591420) b!870199))

(assert (= (and b!870199 res!591428) b!870198))

(assert (= (and b!870198 res!591426) b!870206))

(assert (= (and b!870206 res!591427) b!870204))

(assert (= (and b!870200 condMapEmpty!27182) mapIsEmpty!27182))

(assert (= (and b!870200 (not condMapEmpty!27182)) mapNonEmpty!27182))

(get-info :version)

(assert (= (and mapNonEmpty!27182 ((_ is ValueCellFull!8088) mapValue!27182)) b!870201))

(assert (= (and b!870200 ((_ is ValueCellFull!8088) mapDefault!27182)) b!870205))

(assert (= start!74004 b!870200))

(declare-fun m!811607 () Bool)

(assert (=> mapNonEmpty!27182 m!811607))

(declare-fun m!811609 () Bool)

(assert (=> b!870204 m!811609))

(declare-fun m!811611 () Bool)

(assert (=> b!870204 m!811611))

(assert (=> b!870204 m!811611))

(declare-fun m!811613 () Bool)

(assert (=> b!870204 m!811613))

(declare-fun m!811615 () Bool)

(assert (=> b!870204 m!811615))

(declare-fun m!811617 () Bool)

(assert (=> b!870206 m!811617))

(declare-fun m!811619 () Bool)

(assert (=> b!870206 m!811619))

(declare-fun m!811621 () Bool)

(assert (=> b!870206 m!811621))

(declare-fun m!811623 () Bool)

(assert (=> b!870199 m!811623))

(declare-fun m!811625 () Bool)

(assert (=> b!870202 m!811625))

(declare-fun m!811627 () Bool)

(assert (=> b!870198 m!811627))

(declare-fun m!811629 () Bool)

(assert (=> b!870195 m!811629))

(declare-fun m!811631 () Bool)

(assert (=> b!870196 m!811631))

(declare-fun m!811633 () Bool)

(assert (=> start!74004 m!811633))

(declare-fun m!811635 () Bool)

(assert (=> start!74004 m!811635))

(check-sat b_and!24671 (not mapNonEmpty!27182) tp_is_empty!17055 (not b!870206) (not b!870199) (not start!74004) (not b_next!14919) (not b!870195) (not b!870202) (not b!870196) (not b!870204))
(check-sat b_and!24671 (not b_next!14919))
