; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74316 () Bool)

(assert start!74316)

(declare-fun b_free!15097 () Bool)

(declare-fun b_next!15097 () Bool)

(assert (=> start!74316 (= b_free!15097 (not b_next!15097))))

(declare-fun tp!52966 () Bool)

(declare-fun b_and!24847 () Bool)

(assert (=> start!74316 (= tp!52966 b_and!24847)))

(declare-fun b!874536 () Bool)

(declare-fun res!594387 () Bool)

(declare-fun e!486877 () Bool)

(assert (=> b!874536 (=> (not res!594387) (not e!486877))))

(declare-datatypes ((array!50791 0))(
  ( (array!50792 (arr!24424 (Array (_ BitVec 32) (_ BitVec 64))) (size!24866 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50791)

(declare-datatypes ((List!17339 0))(
  ( (Nil!17336) (Cons!17335 (h!18466 (_ BitVec 64)) (t!24371 List!17339)) )
))
(declare-fun arrayNoDuplicates!0 (array!50791 (_ BitVec 32) List!17339) Bool)

(assert (=> b!874536 (= res!594387 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17336))))

(declare-fun b!874537 () Bool)

(declare-fun e!486874 () Bool)

(declare-fun tp_is_empty!17341 () Bool)

(assert (=> b!874537 (= e!486874 tp_is_empty!17341)))

(declare-fun b!874538 () Bool)

(declare-fun res!594385 () Bool)

(assert (=> b!874538 (=> (not res!594385) (not e!486877))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874538 (= res!594385 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24866 _keys!868))))))

(declare-fun b!874539 () Bool)

(declare-fun e!486876 () Bool)

(declare-fun e!486875 () Bool)

(declare-fun mapRes!27620 () Bool)

(assert (=> b!874539 (= e!486876 (and e!486875 mapRes!27620))))

(declare-fun condMapEmpty!27620 () Bool)

(declare-datatypes ((V!28169 0))(
  ( (V!28170 (val!8718 Int)) )
))
(declare-datatypes ((ValueCell!8231 0))(
  ( (ValueCellFull!8231 (v!11141 V!28169)) (EmptyCell!8231) )
))
(declare-datatypes ((array!50793 0))(
  ( (array!50794 (arr!24425 (Array (_ BitVec 32) ValueCell!8231)) (size!24867 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50793)

(declare-fun mapDefault!27620 () ValueCell!8231)

(assert (=> b!874539 (= condMapEmpty!27620 (= (arr!24425 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8231)) mapDefault!27620)))))

(declare-fun res!594383 () Bool)

(assert (=> start!74316 (=> (not res!594383) (not e!486877))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74316 (= res!594383 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24866 _keys!868))))))

(assert (=> start!74316 e!486877))

(assert (=> start!74316 tp_is_empty!17341))

(assert (=> start!74316 true))

(assert (=> start!74316 tp!52966))

(declare-fun array_inv!19314 (array!50791) Bool)

(assert (=> start!74316 (array_inv!19314 _keys!868)))

(declare-fun array_inv!19315 (array!50793) Bool)

(assert (=> start!74316 (and (array_inv!19315 _values!688) e!486876)))

(declare-fun mapIsEmpty!27620 () Bool)

(assert (=> mapIsEmpty!27620 mapRes!27620))

(declare-fun b!874540 () Bool)

(declare-fun res!594388 () Bool)

(assert (=> b!874540 (=> (not res!594388) (not e!486877))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874540 (= res!594388 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27620 () Bool)

(declare-fun tp!52967 () Bool)

(assert (=> mapNonEmpty!27620 (= mapRes!27620 (and tp!52967 e!486874))))

(declare-fun mapValue!27620 () ValueCell!8231)

(declare-fun mapKey!27620 () (_ BitVec 32))

(declare-fun mapRest!27620 () (Array (_ BitVec 32) ValueCell!8231))

(assert (=> mapNonEmpty!27620 (= (arr!24425 _values!688) (store mapRest!27620 mapKey!27620 mapValue!27620))))

(declare-fun b!874541 () Bool)

(assert (=> b!874541 (= e!486877 false)))

(declare-datatypes ((tuple2!11526 0))(
  ( (tuple2!11527 (_1!5774 (_ BitVec 64)) (_2!5774 V!28169)) )
))
(declare-datatypes ((List!17340 0))(
  ( (Nil!17337) (Cons!17336 (h!18467 tuple2!11526) (t!24372 List!17340)) )
))
(declare-datatypes ((ListLongMap!10285 0))(
  ( (ListLongMap!10286 (toList!5158 List!17340)) )
))
(declare-fun lt!395768 () ListLongMap!10285)

(declare-fun v!557 () V!28169)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28169)

(declare-fun zeroValue!654 () V!28169)

(declare-fun getCurrentListMapNoExtraKeys!3151 (array!50791 array!50793 (_ BitVec 32) (_ BitVec 32) V!28169 V!28169 (_ BitVec 32) Int) ListLongMap!10285)

(assert (=> b!874541 (= lt!395768 (getCurrentListMapNoExtraKeys!3151 _keys!868 (array!50794 (store (arr!24425 _values!688) i!612 (ValueCellFull!8231 v!557)) (size!24867 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395769 () ListLongMap!10285)

(assert (=> b!874541 (= lt!395769 (getCurrentListMapNoExtraKeys!3151 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874542 () Bool)

(declare-fun res!594382 () Bool)

(assert (=> b!874542 (=> (not res!594382) (not e!486877))))

(assert (=> b!874542 (= res!594382 (and (= (size!24867 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24866 _keys!868) (size!24867 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874543 () Bool)

(assert (=> b!874543 (= e!486875 tp_is_empty!17341)))

(declare-fun b!874544 () Bool)

(declare-fun res!594386 () Bool)

(assert (=> b!874544 (=> (not res!594386) (not e!486877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50791 (_ BitVec 32)) Bool)

(assert (=> b!874544 (= res!594386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874545 () Bool)

(declare-fun res!594381 () Bool)

(assert (=> b!874545 (=> (not res!594381) (not e!486877))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874545 (= res!594381 (validKeyInArray!0 k0!854))))

(declare-fun b!874546 () Bool)

(declare-fun res!594384 () Bool)

(assert (=> b!874546 (=> (not res!594384) (not e!486877))))

(assert (=> b!874546 (= res!594384 (and (= (select (arr!24424 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74316 res!594383) b!874540))

(assert (= (and b!874540 res!594388) b!874542))

(assert (= (and b!874542 res!594382) b!874544))

(assert (= (and b!874544 res!594386) b!874536))

(assert (= (and b!874536 res!594387) b!874538))

(assert (= (and b!874538 res!594385) b!874545))

(assert (= (and b!874545 res!594381) b!874546))

(assert (= (and b!874546 res!594384) b!874541))

(assert (= (and b!874539 condMapEmpty!27620) mapIsEmpty!27620))

(assert (= (and b!874539 (not condMapEmpty!27620)) mapNonEmpty!27620))

(get-info :version)

(assert (= (and mapNonEmpty!27620 ((_ is ValueCellFull!8231) mapValue!27620)) b!874537))

(assert (= (and b!874539 ((_ is ValueCellFull!8231) mapDefault!27620)) b!874543))

(assert (= start!74316 b!874539))

(declare-fun m!814073 () Bool)

(assert (=> start!74316 m!814073))

(declare-fun m!814075 () Bool)

(assert (=> start!74316 m!814075))

(declare-fun m!814077 () Bool)

(assert (=> b!874541 m!814077))

(declare-fun m!814079 () Bool)

(assert (=> b!874541 m!814079))

(declare-fun m!814081 () Bool)

(assert (=> b!874541 m!814081))

(declare-fun m!814083 () Bool)

(assert (=> b!874540 m!814083))

(declare-fun m!814085 () Bool)

(assert (=> b!874546 m!814085))

(declare-fun m!814087 () Bool)

(assert (=> mapNonEmpty!27620 m!814087))

(declare-fun m!814089 () Bool)

(assert (=> b!874544 m!814089))

(declare-fun m!814091 () Bool)

(assert (=> b!874545 m!814091))

(declare-fun m!814093 () Bool)

(assert (=> b!874536 m!814093))

(check-sat b_and!24847 (not b!874541) (not b_next!15097) (not b!874536) tp_is_empty!17341 (not b!874545) (not b!874544) (not mapNonEmpty!27620) (not b!874540) (not start!74316))
(check-sat b_and!24847 (not b_next!15097))
