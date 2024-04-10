; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74070 () Bool)

(assert start!74070)

(declare-fun b_free!14985 () Bool)

(declare-fun b_next!14985 () Bool)

(assert (=> start!74070 (= b_free!14985 (not b_next!14985))))

(declare-fun tp!52459 () Bool)

(declare-fun b_and!24737 () Bool)

(assert (=> start!74070 (= tp!52459 b_and!24737)))

(declare-fun mapNonEmpty!27281 () Bool)

(declare-fun mapRes!27281 () Bool)

(declare-fun tp!52458 () Bool)

(declare-fun e!485164 () Bool)

(assert (=> mapNonEmpty!27281 (= mapRes!27281 (and tp!52458 e!485164))))

(declare-datatypes ((V!27875 0))(
  ( (V!27876 (val!8608 Int)) )
))
(declare-datatypes ((ValueCell!8121 0))(
  ( (ValueCellFull!8121 (v!11033 V!27875)) (EmptyCell!8121) )
))
(declare-fun mapRest!27281 () (Array (_ BitVec 32) ValueCell!8121))

(declare-fun mapValue!27281 () ValueCell!8121)

(declare-fun mapKey!27281 () (_ BitVec 32))

(declare-datatypes ((array!50382 0))(
  ( (array!50383 (arr!24222 (Array (_ BitVec 32) ValueCell!8121)) (size!24662 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50382)

(assert (=> mapNonEmpty!27281 (= (arr!24222 _values!688) (store mapRest!27281 mapKey!27281 mapValue!27281))))

(declare-fun b!871383 () Bool)

(declare-fun res!592319 () Bool)

(declare-fun e!485165 () Bool)

(assert (=> b!871383 (=> (not res!592319) (not e!485165))))

(declare-datatypes ((array!50384 0))(
  ( (array!50385 (arr!24223 (Array (_ BitVec 32) (_ BitVec 64))) (size!24663 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50384)

(declare-datatypes ((List!17226 0))(
  ( (Nil!17223) (Cons!17222 (h!18353 (_ BitVec 64)) (t!24263 List!17226)) )
))
(declare-fun arrayNoDuplicates!0 (array!50384 (_ BitVec 32) List!17226) Bool)

(assert (=> b!871383 (= res!592319 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17223))))

(declare-fun b!871384 () Bool)

(declare-fun res!592311 () Bool)

(assert (=> b!871384 (=> (not res!592311) (not e!485165))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871384 (= res!592311 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24663 _keys!868))))))

(declare-fun b!871385 () Bool)

(declare-fun e!485167 () Bool)

(declare-fun tp_is_empty!17121 () Bool)

(assert (=> b!871385 (= e!485167 tp_is_empty!17121)))

(declare-fun b!871386 () Bool)

(declare-fun res!592314 () Bool)

(assert (=> b!871386 (=> (not res!592314) (not e!485165))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!871386 (= res!592314 (and (= (size!24662 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24663 _keys!868) (size!24662 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871387 () Bool)

(declare-fun res!592317 () Bool)

(assert (=> b!871387 (=> (not res!592317) (not e!485165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50384 (_ BitVec 32)) Bool)

(assert (=> b!871387 (= res!592317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871389 () Bool)

(declare-fun res!592312 () Bool)

(assert (=> b!871389 (=> (not res!592312) (not e!485165))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871389 (= res!592312 (and (= (select (arr!24223 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27281 () Bool)

(assert (=> mapIsEmpty!27281 mapRes!27281))

(declare-fun b!871390 () Bool)

(declare-fun e!485163 () Bool)

(assert (=> b!871390 (= e!485165 e!485163)))

(declare-fun res!592315 () Bool)

(assert (=> b!871390 (=> (not res!592315) (not e!485163))))

(assert (=> b!871390 (= res!592315 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27875)

(declare-fun zeroValue!654 () V!27875)

(declare-fun lt!395450 () array!50382)

(declare-datatypes ((tuple2!11440 0))(
  ( (tuple2!11441 (_1!5731 (_ BitVec 64)) (_2!5731 V!27875)) )
))
(declare-datatypes ((List!17227 0))(
  ( (Nil!17224) (Cons!17223 (h!18354 tuple2!11440) (t!24264 List!17227)) )
))
(declare-datatypes ((ListLongMap!10209 0))(
  ( (ListLongMap!10210 (toList!5120 List!17227)) )
))
(declare-fun lt!395452 () ListLongMap!10209)

(declare-fun getCurrentListMapNoExtraKeys!3089 (array!50384 array!50382 (_ BitVec 32) (_ BitVec 32) V!27875 V!27875 (_ BitVec 32) Int) ListLongMap!10209)

(assert (=> b!871390 (= lt!395452 (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!395450 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27875)

(assert (=> b!871390 (= lt!395450 (array!50383 (store (arr!24222 _values!688) i!612 (ValueCellFull!8121 v!557)) (size!24662 _values!688)))))

(declare-fun lt!395449 () ListLongMap!10209)

(assert (=> b!871390 (= lt!395449 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871391 () Bool)

(declare-fun res!592316 () Bool)

(assert (=> b!871391 (=> (not res!592316) (not e!485165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871391 (= res!592316 (validKeyInArray!0 k0!854))))

(declare-fun b!871392 () Bool)

(declare-fun e!485166 () Bool)

(assert (=> b!871392 (= e!485166 (and e!485167 mapRes!27281))))

(declare-fun condMapEmpty!27281 () Bool)

(declare-fun mapDefault!27281 () ValueCell!8121)

(assert (=> b!871392 (= condMapEmpty!27281 (= (arr!24222 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8121)) mapDefault!27281)))))

(declare-fun b!871393 () Bool)

(assert (=> b!871393 (= e!485164 tp_is_empty!17121)))

(declare-fun b!871394 () Bool)

(declare-fun res!592313 () Bool)

(assert (=> b!871394 (=> (not res!592313) (not e!485165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871394 (= res!592313 (validMask!0 mask!1196))))

(declare-fun b!871388 () Bool)

(assert (=> b!871388 (= e!485163 (not true))))

(declare-fun +!2455 (ListLongMap!10209 tuple2!11440) ListLongMap!10209)

(assert (=> b!871388 (= (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!395450 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2455 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11441 k0!854 v!557)))))

(declare-datatypes ((Unit!29908 0))(
  ( (Unit!29909) )
))
(declare-fun lt!395451 () Unit!29908)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!649 (array!50384 array!50382 (_ BitVec 32) (_ BitVec 32) V!27875 V!27875 (_ BitVec 32) (_ BitVec 64) V!27875 (_ BitVec 32) Int) Unit!29908)

(assert (=> b!871388 (= lt!395451 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!649 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!592318 () Bool)

(assert (=> start!74070 (=> (not res!592318) (not e!485165))))

(assert (=> start!74070 (= res!592318 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24663 _keys!868))))))

(assert (=> start!74070 e!485165))

(assert (=> start!74070 tp_is_empty!17121))

(assert (=> start!74070 true))

(assert (=> start!74070 tp!52459))

(declare-fun array_inv!19126 (array!50384) Bool)

(assert (=> start!74070 (array_inv!19126 _keys!868)))

(declare-fun array_inv!19127 (array!50382) Bool)

(assert (=> start!74070 (and (array_inv!19127 _values!688) e!485166)))

(assert (= (and start!74070 res!592318) b!871394))

(assert (= (and b!871394 res!592313) b!871386))

(assert (= (and b!871386 res!592314) b!871387))

(assert (= (and b!871387 res!592317) b!871383))

(assert (= (and b!871383 res!592319) b!871384))

(assert (= (and b!871384 res!592311) b!871391))

(assert (= (and b!871391 res!592316) b!871389))

(assert (= (and b!871389 res!592312) b!871390))

(assert (= (and b!871390 res!592315) b!871388))

(assert (= (and b!871392 condMapEmpty!27281) mapIsEmpty!27281))

(assert (= (and b!871392 (not condMapEmpty!27281)) mapNonEmpty!27281))

(get-info :version)

(assert (= (and mapNonEmpty!27281 ((_ is ValueCellFull!8121) mapValue!27281)) b!871393))

(assert (= (and b!871392 ((_ is ValueCellFull!8121) mapDefault!27281)) b!871385))

(assert (= start!74070 b!871392))

(declare-fun m!812597 () Bool)

(assert (=> b!871389 m!812597))

(declare-fun m!812599 () Bool)

(assert (=> b!871390 m!812599))

(declare-fun m!812601 () Bool)

(assert (=> b!871390 m!812601))

(declare-fun m!812603 () Bool)

(assert (=> b!871390 m!812603))

(declare-fun m!812605 () Bool)

(assert (=> mapNonEmpty!27281 m!812605))

(declare-fun m!812607 () Bool)

(assert (=> b!871388 m!812607))

(declare-fun m!812609 () Bool)

(assert (=> b!871388 m!812609))

(assert (=> b!871388 m!812609))

(declare-fun m!812611 () Bool)

(assert (=> b!871388 m!812611))

(declare-fun m!812613 () Bool)

(assert (=> b!871388 m!812613))

(declare-fun m!812615 () Bool)

(assert (=> b!871394 m!812615))

(declare-fun m!812617 () Bool)

(assert (=> b!871383 m!812617))

(declare-fun m!812619 () Bool)

(assert (=> b!871387 m!812619))

(declare-fun m!812621 () Bool)

(assert (=> b!871391 m!812621))

(declare-fun m!812623 () Bool)

(assert (=> start!74070 m!812623))

(declare-fun m!812625 () Bool)

(assert (=> start!74070 m!812625))

(check-sat (not b!871383) (not b!871391) (not b!871394) tp_is_empty!17121 (not start!74070) (not mapNonEmpty!27281) (not b!871387) (not b_next!14985) b_and!24737 (not b!871390) (not b!871388))
(check-sat b_and!24737 (not b_next!14985))
