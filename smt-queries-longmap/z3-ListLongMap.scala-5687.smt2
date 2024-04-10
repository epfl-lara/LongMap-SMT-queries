; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73908 () Bool)

(assert start!73908)

(declare-fun b_free!14823 () Bool)

(declare-fun b_next!14823 () Bool)

(assert (=> start!73908 (= b_free!14823 (not b_next!14823))))

(declare-fun tp!51972 () Bool)

(declare-fun b_and!24575 () Bool)

(assert (=> start!73908 (= tp!51972 b_and!24575)))

(declare-fun b!868467 () Bool)

(declare-fun e!483706 () Bool)

(assert (=> b!868467 (= e!483706 (not true))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50072 0))(
  ( (array!50073 (arr!24067 (Array (_ BitVec 32) (_ BitVec 64))) (size!24507 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50072)

(declare-datatypes ((V!27659 0))(
  ( (V!27660 (val!8527 Int)) )
))
(declare-datatypes ((ValueCell!8040 0))(
  ( (ValueCellFull!8040 (v!10952 V!27659)) (EmptyCell!8040) )
))
(declare-datatypes ((array!50074 0))(
  ( (array!50075 (arr!24068 (Array (_ BitVec 32) ValueCell!8040)) (size!24508 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50074)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27659)

(declare-fun zeroValue!654 () V!27659)

(declare-fun v!557 () V!27659)

(declare-fun lt!394479 () array!50074)

(declare-datatypes ((tuple2!11320 0))(
  ( (tuple2!11321 (_1!5671 (_ BitVec 64)) (_2!5671 V!27659)) )
))
(declare-datatypes ((List!17115 0))(
  ( (Nil!17112) (Cons!17111 (h!18242 tuple2!11320) (t!24152 List!17115)) )
))
(declare-datatypes ((ListLongMap!10089 0))(
  ( (ListLongMap!10090 (toList!5060 List!17115)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3029 (array!50072 array!50074 (_ BitVec 32) (_ BitVec 32) V!27659 V!27659 (_ BitVec 32) Int) ListLongMap!10089)

(declare-fun +!2402 (ListLongMap!10089 tuple2!11320) ListLongMap!10089)

(assert (=> b!868467 (= (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!394479 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2402 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11321 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29802 0))(
  ( (Unit!29803) )
))
(declare-fun lt!394478 () Unit!29802)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 (array!50072 array!50074 (_ BitVec 32) (_ BitVec 32) V!27659 V!27659 (_ BitVec 32) (_ BitVec 64) V!27659 (_ BitVec 32) Int) Unit!29802)

(assert (=> b!868467 (= lt!394478 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868468 () Bool)

(declare-fun res!590132 () Bool)

(declare-fun e!483704 () Bool)

(assert (=> b!868468 (=> (not res!590132) (not e!483704))))

(assert (=> b!868468 (= res!590132 (and (= (select (arr!24067 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868469 () Bool)

(declare-fun e!483707 () Bool)

(declare-fun tp_is_empty!16959 () Bool)

(assert (=> b!868469 (= e!483707 tp_is_empty!16959)))

(declare-fun res!590126 () Bool)

(assert (=> start!73908 (=> (not res!590126) (not e!483704))))

(assert (=> start!73908 (= res!590126 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24507 _keys!868))))))

(assert (=> start!73908 e!483704))

(assert (=> start!73908 tp_is_empty!16959))

(assert (=> start!73908 true))

(assert (=> start!73908 tp!51972))

(declare-fun array_inv!19014 (array!50072) Bool)

(assert (=> start!73908 (array_inv!19014 _keys!868)))

(declare-fun e!483708 () Bool)

(declare-fun array_inv!19015 (array!50074) Bool)

(assert (=> start!73908 (and (array_inv!19015 _values!688) e!483708)))

(declare-fun b!868470 () Bool)

(declare-fun res!590128 () Bool)

(assert (=> b!868470 (=> (not res!590128) (not e!483704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868470 (= res!590128 (validMask!0 mask!1196))))

(declare-fun b!868471 () Bool)

(declare-fun res!590129 () Bool)

(assert (=> b!868471 (=> (not res!590129) (not e!483704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50072 (_ BitVec 32)) Bool)

(assert (=> b!868471 (= res!590129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868472 () Bool)

(declare-fun res!590124 () Bool)

(assert (=> b!868472 (=> (not res!590124) (not e!483704))))

(declare-datatypes ((List!17116 0))(
  ( (Nil!17113) (Cons!17112 (h!18243 (_ BitVec 64)) (t!24153 List!17116)) )
))
(declare-fun arrayNoDuplicates!0 (array!50072 (_ BitVec 32) List!17116) Bool)

(assert (=> b!868472 (= res!590124 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17113))))

(declare-fun b!868473 () Bool)

(declare-fun res!590131 () Bool)

(assert (=> b!868473 (=> (not res!590131) (not e!483704))))

(assert (=> b!868473 (= res!590131 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24507 _keys!868))))))

(declare-fun mapNonEmpty!27038 () Bool)

(declare-fun mapRes!27038 () Bool)

(declare-fun tp!51973 () Bool)

(assert (=> mapNonEmpty!27038 (= mapRes!27038 (and tp!51973 e!483707))))

(declare-fun mapRest!27038 () (Array (_ BitVec 32) ValueCell!8040))

(declare-fun mapKey!27038 () (_ BitVec 32))

(declare-fun mapValue!27038 () ValueCell!8040)

(assert (=> mapNonEmpty!27038 (= (arr!24068 _values!688) (store mapRest!27038 mapKey!27038 mapValue!27038))))

(declare-fun b!868474 () Bool)

(declare-fun res!590125 () Bool)

(assert (=> b!868474 (=> (not res!590125) (not e!483704))))

(assert (=> b!868474 (= res!590125 (and (= (size!24508 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24507 _keys!868) (size!24508 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868475 () Bool)

(declare-fun e!483709 () Bool)

(assert (=> b!868475 (= e!483708 (and e!483709 mapRes!27038))))

(declare-fun condMapEmpty!27038 () Bool)

(declare-fun mapDefault!27038 () ValueCell!8040)

(assert (=> b!868475 (= condMapEmpty!27038 (= (arr!24068 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8040)) mapDefault!27038)))))

(declare-fun b!868476 () Bool)

(assert (=> b!868476 (= e!483704 e!483706)))

(declare-fun res!590130 () Bool)

(assert (=> b!868476 (=> (not res!590130) (not e!483706))))

(assert (=> b!868476 (= res!590130 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394480 () ListLongMap!10089)

(assert (=> b!868476 (= lt!394480 (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!394479 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868476 (= lt!394479 (array!50075 (store (arr!24068 _values!688) i!612 (ValueCellFull!8040 v!557)) (size!24508 _values!688)))))

(declare-fun lt!394477 () ListLongMap!10089)

(assert (=> b!868476 (= lt!394477 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868477 () Bool)

(assert (=> b!868477 (= e!483709 tp_is_empty!16959)))

(declare-fun b!868478 () Bool)

(declare-fun res!590127 () Bool)

(assert (=> b!868478 (=> (not res!590127) (not e!483704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868478 (= res!590127 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27038 () Bool)

(assert (=> mapIsEmpty!27038 mapRes!27038))

(assert (= (and start!73908 res!590126) b!868470))

(assert (= (and b!868470 res!590128) b!868474))

(assert (= (and b!868474 res!590125) b!868471))

(assert (= (and b!868471 res!590129) b!868472))

(assert (= (and b!868472 res!590124) b!868473))

(assert (= (and b!868473 res!590131) b!868478))

(assert (= (and b!868478 res!590127) b!868468))

(assert (= (and b!868468 res!590132) b!868476))

(assert (= (and b!868476 res!590130) b!868467))

(assert (= (and b!868475 condMapEmpty!27038) mapIsEmpty!27038))

(assert (= (and b!868475 (not condMapEmpty!27038)) mapNonEmpty!27038))

(get-info :version)

(assert (= (and mapNonEmpty!27038 ((_ is ValueCellFull!8040) mapValue!27038)) b!868469))

(assert (= (and b!868475 ((_ is ValueCellFull!8040) mapDefault!27038)) b!868477))

(assert (= start!73908 b!868475))

(declare-fun m!810167 () Bool)

(assert (=> b!868472 m!810167))

(declare-fun m!810169 () Bool)

(assert (=> mapNonEmpty!27038 m!810169))

(declare-fun m!810171 () Bool)

(assert (=> b!868471 m!810171))

(declare-fun m!810173 () Bool)

(assert (=> b!868467 m!810173))

(declare-fun m!810175 () Bool)

(assert (=> b!868467 m!810175))

(assert (=> b!868467 m!810175))

(declare-fun m!810177 () Bool)

(assert (=> b!868467 m!810177))

(declare-fun m!810179 () Bool)

(assert (=> b!868467 m!810179))

(declare-fun m!810181 () Bool)

(assert (=> b!868470 m!810181))

(declare-fun m!810183 () Bool)

(assert (=> b!868476 m!810183))

(declare-fun m!810185 () Bool)

(assert (=> b!868476 m!810185))

(declare-fun m!810187 () Bool)

(assert (=> b!868476 m!810187))

(declare-fun m!810189 () Bool)

(assert (=> b!868478 m!810189))

(declare-fun m!810191 () Bool)

(assert (=> start!73908 m!810191))

(declare-fun m!810193 () Bool)

(assert (=> start!73908 m!810193))

(declare-fun m!810195 () Bool)

(assert (=> b!868468 m!810195))

(check-sat (not b!868470) (not b!868472) (not start!73908) (not b!868478) b_and!24575 (not mapNonEmpty!27038) (not b!868476) (not b_next!14823) tp_is_empty!16959 (not b!868467) (not b!868471))
(check-sat b_and!24575 (not b_next!14823))
