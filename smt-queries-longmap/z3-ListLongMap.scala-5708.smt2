; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74200 () Bool)

(assert start!74200)

(declare-fun b_free!14947 () Bool)

(declare-fun b_next!14947 () Bool)

(assert (=> start!74200 (= b_free!14947 (not b_next!14947))))

(declare-fun tp!52346 () Bool)

(declare-fun b_and!24709 () Bool)

(assert (=> start!74200 (= tp!52346 b_and!24709)))

(declare-fun b!871602 () Bool)

(declare-fun res!592147 () Bool)

(declare-fun e!485406 () Bool)

(assert (=> b!871602 (=> (not res!592147) (not e!485406))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50369 0))(
  ( (array!50370 (arr!24211 (Array (_ BitVec 32) (_ BitVec 64))) (size!24652 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50369)

(declare-datatypes ((V!27825 0))(
  ( (V!27826 (val!8589 Int)) )
))
(declare-datatypes ((ValueCell!8102 0))(
  ( (ValueCellFull!8102 (v!11014 V!27825)) (EmptyCell!8102) )
))
(declare-datatypes ((array!50371 0))(
  ( (array!50372 (arr!24212 (Array (_ BitVec 32) ValueCell!8102)) (size!24653 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50371)

(assert (=> b!871602 (= res!592147 (and (= (size!24653 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24652 _keys!868) (size!24653 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871603 () Bool)

(declare-fun e!485405 () Bool)

(declare-fun e!485407 () Bool)

(declare-fun mapRes!27224 () Bool)

(assert (=> b!871603 (= e!485405 (and e!485407 mapRes!27224))))

(declare-fun condMapEmpty!27224 () Bool)

(declare-fun mapDefault!27224 () ValueCell!8102)

(assert (=> b!871603 (= condMapEmpty!27224 (= (arr!24212 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8102)) mapDefault!27224)))))

(declare-fun b!871604 () Bool)

(declare-fun res!592150 () Bool)

(assert (=> b!871604 (=> (not res!592150) (not e!485406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871604 (= res!592150 (validMask!0 mask!1196))))

(declare-fun res!592149 () Bool)

(assert (=> start!74200 (=> (not res!592149) (not e!485406))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74200 (= res!592149 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24652 _keys!868))))))

(assert (=> start!74200 e!485406))

(declare-fun tp_is_empty!17083 () Bool)

(assert (=> start!74200 tp_is_empty!17083))

(assert (=> start!74200 true))

(assert (=> start!74200 tp!52346))

(declare-fun array_inv!19176 (array!50369) Bool)

(assert (=> start!74200 (array_inv!19176 _keys!868)))

(declare-fun array_inv!19177 (array!50371) Bool)

(assert (=> start!74200 (and (array_inv!19177 _values!688) e!485405)))

(declare-fun b!871605 () Bool)

(declare-fun res!592146 () Bool)

(assert (=> b!871605 (=> (not res!592146) (not e!485406))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871605 (= res!592146 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24652 _keys!868))))))

(declare-fun b!871606 () Bool)

(declare-fun e!485402 () Bool)

(assert (=> b!871606 (= e!485402 tp_is_empty!17083)))

(declare-fun b!871607 () Bool)

(declare-fun e!485403 () Bool)

(assert (=> b!871607 (= e!485406 e!485403)))

(declare-fun res!592145 () Bool)

(assert (=> b!871607 (=> (not res!592145) (not e!485403))))

(assert (=> b!871607 (= res!592145 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27825)

(declare-fun zeroValue!654 () V!27825)

(declare-datatypes ((tuple2!11346 0))(
  ( (tuple2!11347 (_1!5684 (_ BitVec 64)) (_2!5684 V!27825)) )
))
(declare-datatypes ((List!17164 0))(
  ( (Nil!17161) (Cons!17160 (h!18297 tuple2!11346) (t!24193 List!17164)) )
))
(declare-datatypes ((ListLongMap!10117 0))(
  ( (ListLongMap!10118 (toList!5074 List!17164)) )
))
(declare-fun lt!395585 () ListLongMap!10117)

(declare-fun lt!395582 () array!50371)

(declare-fun getCurrentListMapNoExtraKeys!3118 (array!50369 array!50371 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) Int) ListLongMap!10117)

(assert (=> b!871607 (= lt!395585 (getCurrentListMapNoExtraKeys!3118 _keys!868 lt!395582 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27825)

(assert (=> b!871607 (= lt!395582 (array!50372 (store (arr!24212 _values!688) i!612 (ValueCellFull!8102 v!557)) (size!24653 _values!688)))))

(declare-fun lt!395583 () ListLongMap!10117)

(assert (=> b!871607 (= lt!395583 (getCurrentListMapNoExtraKeys!3118 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871608 () Bool)

(assert (=> b!871608 (= e!485407 tp_is_empty!17083)))

(declare-fun mapNonEmpty!27224 () Bool)

(declare-fun tp!52345 () Bool)

(assert (=> mapNonEmpty!27224 (= mapRes!27224 (and tp!52345 e!485402))))

(declare-fun mapRest!27224 () (Array (_ BitVec 32) ValueCell!8102))

(declare-fun mapKey!27224 () (_ BitVec 32))

(declare-fun mapValue!27224 () ValueCell!8102)

(assert (=> mapNonEmpty!27224 (= (arr!24212 _values!688) (store mapRest!27224 mapKey!27224 mapValue!27224))))

(declare-fun b!871609 () Bool)

(declare-fun res!592142 () Bool)

(assert (=> b!871609 (=> (not res!592142) (not e!485406))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871609 (= res!592142 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27224 () Bool)

(assert (=> mapIsEmpty!27224 mapRes!27224))

(declare-fun b!871610 () Bool)

(declare-fun res!592143 () Bool)

(assert (=> b!871610 (=> (not res!592143) (not e!485406))))

(assert (=> b!871610 (= res!592143 (and (= (select (arr!24211 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871611 () Bool)

(assert (=> b!871611 (= e!485403 (not true))))

(declare-fun +!2465 (ListLongMap!10117 tuple2!11346) ListLongMap!10117)

(assert (=> b!871611 (= (getCurrentListMapNoExtraKeys!3118 _keys!868 lt!395582 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2465 (getCurrentListMapNoExtraKeys!3118 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11347 k0!854 v!557)))))

(declare-datatypes ((Unit!29880 0))(
  ( (Unit!29881) )
))
(declare-fun lt!395584 () Unit!29880)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 (array!50369 array!50371 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) (_ BitVec 64) V!27825 (_ BitVec 32) Int) Unit!29880)

(assert (=> b!871611 (= lt!395584 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871612 () Bool)

(declare-fun res!592144 () Bool)

(assert (=> b!871612 (=> (not res!592144) (not e!485406))))

(declare-datatypes ((List!17165 0))(
  ( (Nil!17162) (Cons!17161 (h!18298 (_ BitVec 64)) (t!24194 List!17165)) )
))
(declare-fun arrayNoDuplicates!0 (array!50369 (_ BitVec 32) List!17165) Bool)

(assert (=> b!871612 (= res!592144 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17162))))

(declare-fun b!871613 () Bool)

(declare-fun res!592148 () Bool)

(assert (=> b!871613 (=> (not res!592148) (not e!485406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50369 (_ BitVec 32)) Bool)

(assert (=> b!871613 (= res!592148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74200 res!592149) b!871604))

(assert (= (and b!871604 res!592150) b!871602))

(assert (= (and b!871602 res!592147) b!871613))

(assert (= (and b!871613 res!592148) b!871612))

(assert (= (and b!871612 res!592144) b!871605))

(assert (= (and b!871605 res!592146) b!871609))

(assert (= (and b!871609 res!592142) b!871610))

(assert (= (and b!871610 res!592143) b!871607))

(assert (= (and b!871607 res!592145) b!871611))

(assert (= (and b!871603 condMapEmpty!27224) mapIsEmpty!27224))

(assert (= (and b!871603 (not condMapEmpty!27224)) mapNonEmpty!27224))

(get-info :version)

(assert (= (and mapNonEmpty!27224 ((_ is ValueCellFull!8102) mapValue!27224)) b!871606))

(assert (= (and b!871603 ((_ is ValueCellFull!8102) mapDefault!27224)) b!871608))

(assert (= start!74200 b!871603))

(declare-fun m!813317 () Bool)

(assert (=> mapNonEmpty!27224 m!813317))

(declare-fun m!813319 () Bool)

(assert (=> b!871613 m!813319))

(declare-fun m!813321 () Bool)

(assert (=> b!871611 m!813321))

(declare-fun m!813323 () Bool)

(assert (=> b!871611 m!813323))

(assert (=> b!871611 m!813323))

(declare-fun m!813325 () Bool)

(assert (=> b!871611 m!813325))

(declare-fun m!813327 () Bool)

(assert (=> b!871611 m!813327))

(declare-fun m!813329 () Bool)

(assert (=> b!871607 m!813329))

(declare-fun m!813331 () Bool)

(assert (=> b!871607 m!813331))

(declare-fun m!813333 () Bool)

(assert (=> b!871607 m!813333))

(declare-fun m!813335 () Bool)

(assert (=> b!871604 m!813335))

(declare-fun m!813337 () Bool)

(assert (=> b!871612 m!813337))

(declare-fun m!813339 () Bool)

(assert (=> b!871610 m!813339))

(declare-fun m!813341 () Bool)

(assert (=> start!74200 m!813341))

(declare-fun m!813343 () Bool)

(assert (=> start!74200 m!813343))

(declare-fun m!813345 () Bool)

(assert (=> b!871609 m!813345))

(check-sat (not b!871609) (not b_next!14947) (not mapNonEmpty!27224) (not b!871611) (not b!871613) (not start!74200) (not b!871612) b_and!24709 tp_is_empty!17083 (not b!871604) (not b!871607))
(check-sat b_and!24709 (not b_next!14947))
