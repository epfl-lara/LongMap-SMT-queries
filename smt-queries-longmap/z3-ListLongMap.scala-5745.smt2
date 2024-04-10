; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74300 () Bool)

(assert start!74300)

(declare-fun b_free!15063 () Bool)

(declare-fun b_next!15063 () Bool)

(assert (=> start!74300 (= b_free!15063 (not b_next!15063))))

(declare-fun tp!52863 () Bool)

(declare-fun b_and!24839 () Bool)

(assert (=> start!74300 (= tp!52863 b_and!24839)))

(declare-fun b!874214 () Bool)

(declare-fun e!486767 () Bool)

(declare-fun e!486768 () Bool)

(declare-fun mapRes!27569 () Bool)

(assert (=> b!874214 (= e!486767 (and e!486768 mapRes!27569))))

(declare-fun condMapEmpty!27569 () Bool)

(declare-datatypes ((V!28123 0))(
  ( (V!28124 (val!8701 Int)) )
))
(declare-datatypes ((ValueCell!8214 0))(
  ( (ValueCellFull!8214 (v!11130 V!28123)) (EmptyCell!8214) )
))
(declare-datatypes ((array!50742 0))(
  ( (array!50743 (arr!24399 (Array (_ BitVec 32) ValueCell!8214)) (size!24839 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50742)

(declare-fun mapDefault!27569 () ValueCell!8214)

(assert (=> b!874214 (= condMapEmpty!27569 (= (arr!24399 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8214)) mapDefault!27569)))))

(declare-fun mapNonEmpty!27569 () Bool)

(declare-fun tp!52864 () Bool)

(declare-fun e!486766 () Bool)

(assert (=> mapNonEmpty!27569 (= mapRes!27569 (and tp!52864 e!486766))))

(declare-fun mapValue!27569 () ValueCell!8214)

(declare-fun mapKey!27569 () (_ BitVec 32))

(declare-fun mapRest!27569 () (Array (_ BitVec 32) ValueCell!8214))

(assert (=> mapNonEmpty!27569 (= (arr!24399 _values!688) (store mapRest!27569 mapKey!27569 mapValue!27569))))

(declare-fun res!594087 () Bool)

(declare-fun e!486769 () Bool)

(assert (=> start!74300 (=> (not res!594087) (not e!486769))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50744 0))(
  ( (array!50745 (arr!24400 (Array (_ BitVec 32) (_ BitVec 64))) (size!24840 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50744)

(assert (=> start!74300 (= res!594087 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24840 _keys!868))))))

(assert (=> start!74300 e!486769))

(declare-fun tp_is_empty!17307 () Bool)

(assert (=> start!74300 tp_is_empty!17307))

(assert (=> start!74300 true))

(assert (=> start!74300 tp!52863))

(declare-fun array_inv!19246 (array!50744) Bool)

(assert (=> start!74300 (array_inv!19246 _keys!868)))

(declare-fun array_inv!19247 (array!50742) Bool)

(assert (=> start!74300 (and (array_inv!19247 _values!688) e!486767)))

(declare-fun mapIsEmpty!27569 () Bool)

(assert (=> mapIsEmpty!27569 mapRes!27569))

(declare-fun b!874215 () Bool)

(declare-fun res!594085 () Bool)

(assert (=> b!874215 (=> (not res!594085) (not e!486769))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!874215 (= res!594085 (and (= (size!24839 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24840 _keys!868) (size!24839 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874216 () Bool)

(declare-fun res!594084 () Bool)

(assert (=> b!874216 (=> (not res!594084) (not e!486769))))

(declare-datatypes ((List!17320 0))(
  ( (Nil!17317) (Cons!17316 (h!18447 (_ BitVec 64)) (t!24361 List!17320)) )
))
(declare-fun arrayNoDuplicates!0 (array!50744 (_ BitVec 32) List!17320) Bool)

(assert (=> b!874216 (= res!594084 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17317))))

(declare-fun b!874217 () Bool)

(declare-fun res!594086 () Bool)

(assert (=> b!874217 (=> (not res!594086) (not e!486769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874217 (= res!594086 (validMask!0 mask!1196))))

(declare-fun b!874218 () Bool)

(declare-fun res!594088 () Bool)

(assert (=> b!874218 (=> (not res!594088) (not e!486769))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874218 (= res!594088 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24840 _keys!868))))))

(declare-fun b!874219 () Bool)

(declare-fun res!594090 () Bool)

(assert (=> b!874219 (=> (not res!594090) (not e!486769))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874219 (= res!594090 (and (= (select (arr!24400 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874220 () Bool)

(assert (=> b!874220 (= e!486769 false)))

(declare-fun v!557 () V!28123)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28123)

(declare-fun zeroValue!654 () V!28123)

(declare-datatypes ((tuple2!11500 0))(
  ( (tuple2!11501 (_1!5761 (_ BitVec 64)) (_2!5761 V!28123)) )
))
(declare-datatypes ((List!17321 0))(
  ( (Nil!17318) (Cons!17317 (h!18448 tuple2!11500) (t!24362 List!17321)) )
))
(declare-datatypes ((ListLongMap!10269 0))(
  ( (ListLongMap!10270 (toList!5150 List!17321)) )
))
(declare-fun lt!395903 () ListLongMap!10269)

(declare-fun getCurrentListMapNoExtraKeys!3117 (array!50744 array!50742 (_ BitVec 32) (_ BitVec 32) V!28123 V!28123 (_ BitVec 32) Int) ListLongMap!10269)

(assert (=> b!874220 (= lt!395903 (getCurrentListMapNoExtraKeys!3117 _keys!868 (array!50743 (store (arr!24399 _values!688) i!612 (ValueCellFull!8214 v!557)) (size!24839 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395902 () ListLongMap!10269)

(assert (=> b!874220 (= lt!395902 (getCurrentListMapNoExtraKeys!3117 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874221 () Bool)

(assert (=> b!874221 (= e!486768 tp_is_empty!17307)))

(declare-fun b!874222 () Bool)

(declare-fun res!594089 () Bool)

(assert (=> b!874222 (=> (not res!594089) (not e!486769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50744 (_ BitVec 32)) Bool)

(assert (=> b!874222 (= res!594089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874223 () Bool)

(declare-fun res!594083 () Bool)

(assert (=> b!874223 (=> (not res!594083) (not e!486769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874223 (= res!594083 (validKeyInArray!0 k0!854))))

(declare-fun b!874224 () Bool)

(assert (=> b!874224 (= e!486766 tp_is_empty!17307)))

(assert (= (and start!74300 res!594087) b!874217))

(assert (= (and b!874217 res!594086) b!874215))

(assert (= (and b!874215 res!594085) b!874222))

(assert (= (and b!874222 res!594089) b!874216))

(assert (= (and b!874216 res!594084) b!874218))

(assert (= (and b!874218 res!594088) b!874223))

(assert (= (and b!874223 res!594083) b!874219))

(assert (= (and b!874219 res!594090) b!874220))

(assert (= (and b!874214 condMapEmpty!27569) mapIsEmpty!27569))

(assert (= (and b!874214 (not condMapEmpty!27569)) mapNonEmpty!27569))

(get-info :version)

(assert (= (and mapNonEmpty!27569 ((_ is ValueCellFull!8214) mapValue!27569)) b!874224))

(assert (= (and b!874214 ((_ is ValueCellFull!8214) mapDefault!27569)) b!874221))

(assert (= start!74300 b!874214))

(declare-fun m!814457 () Bool)

(assert (=> b!874216 m!814457))

(declare-fun m!814459 () Bool)

(assert (=> b!874220 m!814459))

(declare-fun m!814461 () Bool)

(assert (=> b!874220 m!814461))

(declare-fun m!814463 () Bool)

(assert (=> b!874220 m!814463))

(declare-fun m!814465 () Bool)

(assert (=> start!74300 m!814465))

(declare-fun m!814467 () Bool)

(assert (=> start!74300 m!814467))

(declare-fun m!814469 () Bool)

(assert (=> b!874219 m!814469))

(declare-fun m!814471 () Bool)

(assert (=> b!874223 m!814471))

(declare-fun m!814473 () Bool)

(assert (=> b!874217 m!814473))

(declare-fun m!814475 () Bool)

(assert (=> mapNonEmpty!27569 m!814475))

(declare-fun m!814477 () Bool)

(assert (=> b!874222 m!814477))

(check-sat tp_is_empty!17307 (not mapNonEmpty!27569) (not b!874220) b_and!24839 (not b!874216) (not start!74300) (not b!874222) (not b!874223) (not b!874217) (not b_next!15063))
(check-sat b_and!24839 (not b_next!15063))
