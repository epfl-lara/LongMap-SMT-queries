; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74356 () Bool)

(assert start!74356)

(declare-fun b_free!15119 () Bool)

(declare-fun b_next!15119 () Bool)

(assert (=> start!74356 (= b_free!15119 (not b_next!15119))))

(declare-fun tp!53032 () Bool)

(declare-fun b_and!24895 () Bool)

(assert (=> start!74356 (= tp!53032 b_and!24895)))

(declare-fun b!875197 () Bool)

(declare-fun res!594789 () Bool)

(declare-fun e!487228 () Bool)

(assert (=> b!875197 (=> (not res!594789) (not e!487228))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50852 0))(
  ( (array!50853 (arr!24454 (Array (_ BitVec 32) (_ BitVec 64))) (size!24894 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50852)

(assert (=> b!875197 (= res!594789 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24894 _keys!868))))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28197 0))(
  ( (V!28198 (val!8729 Int)) )
))
(declare-datatypes ((tuple2!11528 0))(
  ( (tuple2!11529 (_1!5775 (_ BitVec 64)) (_2!5775 V!28197)) )
))
(declare-datatypes ((List!17353 0))(
  ( (Nil!17350) (Cons!17349 (h!18480 tuple2!11528) (t!24394 List!17353)) )
))
(declare-datatypes ((ListLongMap!10297 0))(
  ( (ListLongMap!10298 (toList!5164 List!17353)) )
))
(declare-fun call!38583 () ListLongMap!10297)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38579 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28197)

(declare-fun zeroValue!654 () V!28197)

(declare-datatypes ((ValueCell!8242 0))(
  ( (ValueCellFull!8242 (v!11158 V!28197)) (EmptyCell!8242) )
))
(declare-datatypes ((array!50854 0))(
  ( (array!50855 (arr!24455 (Array (_ BitVec 32) ValueCell!8242)) (size!24895 (_ BitVec 32))) )
))
(declare-fun lt!396105 () array!50854)

(declare-fun getCurrentListMapNoExtraKeys!3131 (array!50852 array!50854 (_ BitVec 32) (_ BitVec 32) V!28197 V!28197 (_ BitVec 32) Int) ListLongMap!10297)

(assert (=> bm!38579 (= call!38583 (getCurrentListMapNoExtraKeys!3131 _keys!868 lt!396105 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875198 () Bool)

(declare-fun res!594782 () Bool)

(assert (=> b!875198 (=> (not res!594782) (not e!487228))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875198 (= res!594782 (validKeyInArray!0 k!854))))

(declare-fun b!875199 () Bool)

(declare-fun res!594783 () Bool)

(assert (=> b!875199 (=> (not res!594783) (not e!487228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875199 (= res!594783 (validMask!0 mask!1196))))

(declare-fun call!38582 () ListLongMap!10297)

(declare-fun _values!688 () array!50854)

(declare-fun bm!38580 () Bool)

(assert (=> bm!38580 (= call!38582 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27653 () Bool)

(declare-fun mapRes!27653 () Bool)

(declare-fun tp!53031 () Bool)

(declare-fun e!487234 () Bool)

(assert (=> mapNonEmpty!27653 (= mapRes!27653 (and tp!53031 e!487234))))

(declare-fun mapRest!27653 () (Array (_ BitVec 32) ValueCell!8242))

(declare-fun mapKey!27653 () (_ BitVec 32))

(declare-fun mapValue!27653 () ValueCell!8242)

(assert (=> mapNonEmpty!27653 (= (arr!24455 _values!688) (store mapRest!27653 mapKey!27653 mapValue!27653))))

(declare-fun b!875200 () Bool)

(declare-fun e!487230 () Bool)

(declare-fun tp_is_empty!17363 () Bool)

(assert (=> b!875200 (= e!487230 tp_is_empty!17363)))

(declare-fun v!557 () V!28197)

(declare-fun b!875201 () Bool)

(declare-fun e!487231 () Bool)

(declare-fun +!2468 (ListLongMap!10297 tuple2!11528) ListLongMap!10297)

(assert (=> b!875201 (= e!487231 (= call!38583 (+!2468 call!38582 (tuple2!11529 k!854 v!557))))))

(declare-fun b!875202 () Bool)

(declare-fun e!487235 () Bool)

(assert (=> b!875202 (= e!487228 e!487235)))

(declare-fun res!594786 () Bool)

(assert (=> b!875202 (=> (not res!594786) (not e!487235))))

(assert (=> b!875202 (= res!594786 (= from!1053 i!612))))

(declare-fun lt!396106 () ListLongMap!10297)

(assert (=> b!875202 (= lt!396106 (getCurrentListMapNoExtraKeys!3131 _keys!868 lt!396105 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875202 (= lt!396105 (array!50855 (store (arr!24455 _values!688) i!612 (ValueCellFull!8242 v!557)) (size!24895 _values!688)))))

(declare-fun lt!396107 () ListLongMap!10297)

(assert (=> b!875202 (= lt!396107 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875203 () Bool)

(declare-fun e!487233 () Bool)

(assert (=> b!875203 (= e!487235 (not e!487233))))

(declare-fun res!594781 () Bool)

(assert (=> b!875203 (=> res!594781 e!487233)))

(assert (=> b!875203 (= res!594781 (not (validKeyInArray!0 (select (arr!24454 _keys!868) from!1053))))))

(assert (=> b!875203 e!487231))

(declare-fun c!92492 () Bool)

(assert (=> b!875203 (= c!92492 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29934 0))(
  ( (Unit!29935) )
))
(declare-fun lt!396104 () Unit!29934)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!660 (array!50852 array!50854 (_ BitVec 32) (_ BitVec 32) V!28197 V!28197 (_ BitVec 32) (_ BitVec 64) V!28197 (_ BitVec 32) Int) Unit!29934)

(assert (=> b!875203 (= lt!396104 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!660 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875204 () Bool)

(declare-fun res!594785 () Bool)

(assert (=> b!875204 (=> (not res!594785) (not e!487228))))

(assert (=> b!875204 (= res!594785 (and (= (size!24895 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24894 _keys!868) (size!24895 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875205 () Bool)

(assert (=> b!875205 (= e!487233 (bvslt i!612 (size!24895 _values!688)))))

(declare-fun res!594788 () Bool)

(assert (=> start!74356 (=> (not res!594788) (not e!487228))))

(assert (=> start!74356 (= res!594788 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24894 _keys!868))))))

(assert (=> start!74356 e!487228))

(assert (=> start!74356 tp_is_empty!17363))

(assert (=> start!74356 true))

(assert (=> start!74356 tp!53032))

(declare-fun array_inv!19278 (array!50852) Bool)

(assert (=> start!74356 (array_inv!19278 _keys!868)))

(declare-fun e!487229 () Bool)

(declare-fun array_inv!19279 (array!50854) Bool)

(assert (=> start!74356 (and (array_inv!19279 _values!688) e!487229)))

(declare-fun b!875206 () Bool)

(declare-fun res!594787 () Bool)

(assert (=> b!875206 (=> (not res!594787) (not e!487228))))

(assert (=> b!875206 (= res!594787 (and (= (select (arr!24454 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!875207 () Bool)

(assert (=> b!875207 (= e!487229 (and e!487230 mapRes!27653))))

(declare-fun condMapEmpty!27653 () Bool)

(declare-fun mapDefault!27653 () ValueCell!8242)

