; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74146 () Bool)

(assert start!74146)

(declare-fun b_free!14893 () Bool)

(declare-fun b_next!14893 () Bool)

(assert (=> start!74146 (= b_free!14893 (not b_next!14893))))

(declare-fun tp!52183 () Bool)

(declare-fun b_and!24655 () Bool)

(assert (=> start!74146 (= tp!52183 b_and!24655)))

(declare-fun res!591417 () Bool)

(declare-fun e!484917 () Bool)

(assert (=> start!74146 (=> (not res!591417) (not e!484917))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50263 0))(
  ( (array!50264 (arr!24158 (Array (_ BitVec 32) (_ BitVec 64))) (size!24599 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50263)

(assert (=> start!74146 (= res!591417 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24599 _keys!868))))))

(assert (=> start!74146 e!484917))

(declare-fun tp_is_empty!17029 () Bool)

(assert (=> start!74146 tp_is_empty!17029))

(assert (=> start!74146 true))

(assert (=> start!74146 tp!52183))

(declare-fun array_inv!19136 (array!50263) Bool)

(assert (=> start!74146 (array_inv!19136 _keys!868)))

(declare-datatypes ((V!27753 0))(
  ( (V!27754 (val!8562 Int)) )
))
(declare-datatypes ((ValueCell!8075 0))(
  ( (ValueCellFull!8075 (v!10987 V!27753)) (EmptyCell!8075) )
))
(declare-datatypes ((array!50265 0))(
  ( (array!50266 (arr!24159 (Array (_ BitVec 32) ValueCell!8075)) (size!24600 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50265)

(declare-fun e!484919 () Bool)

(declare-fun array_inv!19137 (array!50265) Bool)

(assert (=> start!74146 (and (array_inv!19137 _values!688) e!484919)))

(declare-fun mapIsEmpty!27143 () Bool)

(declare-fun mapRes!27143 () Bool)

(assert (=> mapIsEmpty!27143 mapRes!27143))

(declare-fun b!870630 () Bool)

(declare-fun e!484920 () Bool)

(assert (=> b!870630 (= e!484920 (not true))))

(declare-fun v!557 () V!27753)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27753)

(declare-fun zeroValue!654 () V!27753)

(declare-fun lt!395259 () array!50265)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11300 0))(
  ( (tuple2!11301 (_1!5661 (_ BitVec 64)) (_2!5661 V!27753)) )
))
(declare-datatypes ((List!17121 0))(
  ( (Nil!17118) (Cons!17117 (h!18254 tuple2!11300) (t!24150 List!17121)) )
))
(declare-datatypes ((ListLongMap!10071 0))(
  ( (ListLongMap!10072 (toList!5051 List!17121)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3095 (array!50263 array!50265 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) Int) ListLongMap!10071)

(declare-fun +!2445 (ListLongMap!10071 tuple2!11300) ListLongMap!10071)

(assert (=> b!870630 (= (getCurrentListMapNoExtraKeys!3095 _keys!868 lt!395259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2445 (getCurrentListMapNoExtraKeys!3095 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11301 k0!854 v!557)))))

(declare-datatypes ((Unit!29840 0))(
  ( (Unit!29841) )
))
(declare-fun lt!395258 () Unit!29840)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!616 (array!50263 array!50265 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) (_ BitVec 64) V!27753 (_ BitVec 32) Int) Unit!29840)

(assert (=> b!870630 (= lt!395258 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!616 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870631 () Bool)

(declare-fun e!484918 () Bool)

(assert (=> b!870631 (= e!484918 tp_is_empty!17029)))

(declare-fun b!870632 () Bool)

(assert (=> b!870632 (= e!484917 e!484920)))

(declare-fun res!591415 () Bool)

(assert (=> b!870632 (=> (not res!591415) (not e!484920))))

(assert (=> b!870632 (= res!591415 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395260 () ListLongMap!10071)

(assert (=> b!870632 (= lt!395260 (getCurrentListMapNoExtraKeys!3095 _keys!868 lt!395259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870632 (= lt!395259 (array!50266 (store (arr!24159 _values!688) i!612 (ValueCellFull!8075 v!557)) (size!24600 _values!688)))))

(declare-fun lt!395261 () ListLongMap!10071)

(assert (=> b!870632 (= lt!395261 (getCurrentListMapNoExtraKeys!3095 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870633 () Bool)

(declare-fun e!484916 () Bool)

(assert (=> b!870633 (= e!484916 tp_is_empty!17029)))

(declare-fun b!870634 () Bool)

(declare-fun res!591418 () Bool)

(assert (=> b!870634 (=> (not res!591418) (not e!484917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50263 (_ BitVec 32)) Bool)

(assert (=> b!870634 (= res!591418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870635 () Bool)

(declare-fun res!591416 () Bool)

(assert (=> b!870635 (=> (not res!591416) (not e!484917))))

(declare-datatypes ((List!17122 0))(
  ( (Nil!17119) (Cons!17118 (h!18255 (_ BitVec 64)) (t!24151 List!17122)) )
))
(declare-fun arrayNoDuplicates!0 (array!50263 (_ BitVec 32) List!17122) Bool)

(assert (=> b!870635 (= res!591416 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17119))))

(declare-fun b!870636 () Bool)

(declare-fun res!591414 () Bool)

(assert (=> b!870636 (=> (not res!591414) (not e!484917))))

(assert (=> b!870636 (= res!591414 (and (= (select (arr!24158 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870637 () Bool)

(declare-fun res!591421 () Bool)

(assert (=> b!870637 (=> (not res!591421) (not e!484917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870637 (= res!591421 (validKeyInArray!0 k0!854))))

(declare-fun b!870638 () Bool)

(declare-fun res!591413 () Bool)

(assert (=> b!870638 (=> (not res!591413) (not e!484917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870638 (= res!591413 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27143 () Bool)

(declare-fun tp!52184 () Bool)

(assert (=> mapNonEmpty!27143 (= mapRes!27143 (and tp!52184 e!484918))))

(declare-fun mapKey!27143 () (_ BitVec 32))

(declare-fun mapRest!27143 () (Array (_ BitVec 32) ValueCell!8075))

(declare-fun mapValue!27143 () ValueCell!8075)

(assert (=> mapNonEmpty!27143 (= (arr!24159 _values!688) (store mapRest!27143 mapKey!27143 mapValue!27143))))

(declare-fun b!870639 () Bool)

(assert (=> b!870639 (= e!484919 (and e!484916 mapRes!27143))))

(declare-fun condMapEmpty!27143 () Bool)

(declare-fun mapDefault!27143 () ValueCell!8075)

(assert (=> b!870639 (= condMapEmpty!27143 (= (arr!24159 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8075)) mapDefault!27143)))))

(declare-fun b!870640 () Bool)

(declare-fun res!591420 () Bool)

(assert (=> b!870640 (=> (not res!591420) (not e!484917))))

(assert (=> b!870640 (= res!591420 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24599 _keys!868))))))

(declare-fun b!870641 () Bool)

(declare-fun res!591419 () Bool)

(assert (=> b!870641 (=> (not res!591419) (not e!484917))))

(assert (=> b!870641 (= res!591419 (and (= (size!24600 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24599 _keys!868) (size!24600 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74146 res!591417) b!870638))

(assert (= (and b!870638 res!591413) b!870641))

(assert (= (and b!870641 res!591419) b!870634))

(assert (= (and b!870634 res!591418) b!870635))

(assert (= (and b!870635 res!591416) b!870640))

(assert (= (and b!870640 res!591420) b!870637))

(assert (= (and b!870637 res!591421) b!870636))

(assert (= (and b!870636 res!591414) b!870632))

(assert (= (and b!870632 res!591415) b!870630))

(assert (= (and b!870639 condMapEmpty!27143) mapIsEmpty!27143))

(assert (= (and b!870639 (not condMapEmpty!27143)) mapNonEmpty!27143))

(get-info :version)

(assert (= (and mapNonEmpty!27143 ((_ is ValueCellFull!8075) mapValue!27143)) b!870631))

(assert (= (and b!870639 ((_ is ValueCellFull!8075) mapDefault!27143)) b!870633))

(assert (= start!74146 b!870639))

(declare-fun m!812507 () Bool)

(assert (=> b!870632 m!812507))

(declare-fun m!812509 () Bool)

(assert (=> b!870632 m!812509))

(declare-fun m!812511 () Bool)

(assert (=> b!870632 m!812511))

(declare-fun m!812513 () Bool)

(assert (=> b!870635 m!812513))

(declare-fun m!812515 () Bool)

(assert (=> start!74146 m!812515))

(declare-fun m!812517 () Bool)

(assert (=> start!74146 m!812517))

(declare-fun m!812519 () Bool)

(assert (=> b!870636 m!812519))

(declare-fun m!812521 () Bool)

(assert (=> b!870634 m!812521))

(declare-fun m!812523 () Bool)

(assert (=> b!870637 m!812523))

(declare-fun m!812525 () Bool)

(assert (=> b!870630 m!812525))

(declare-fun m!812527 () Bool)

(assert (=> b!870630 m!812527))

(assert (=> b!870630 m!812527))

(declare-fun m!812529 () Bool)

(assert (=> b!870630 m!812529))

(declare-fun m!812531 () Bool)

(assert (=> b!870630 m!812531))

(declare-fun m!812533 () Bool)

(assert (=> b!870638 m!812533))

(declare-fun m!812535 () Bool)

(assert (=> mapNonEmpty!27143 m!812535))

(check-sat (not b!870635) (not b!870637) (not b!870632) (not b!870630) (not mapNonEmpty!27143) (not b!870638) (not b_next!14893) (not start!74146) b_and!24655 (not b!870634) tp_is_empty!17029)
(check-sat b_and!24655 (not b_next!14893))
