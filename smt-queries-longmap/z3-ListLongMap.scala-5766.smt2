; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74666 () Bool)

(assert start!74666)

(declare-fun b_free!15187 () Bool)

(declare-fun b_next!15187 () Bool)

(assert (=> start!74666 (= b_free!15187 (not b_next!15187))))

(declare-fun tp!53243 () Bool)

(declare-fun b_and!25073 () Bool)

(assert (=> start!74666 (= tp!53243 b_and!25073)))

(declare-fun b!878324 () Bool)

(declare-fun res!596385 () Bool)

(declare-fun e!489019 () Bool)

(assert (=> b!878324 (=> (not res!596385) (not e!489019))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51033 0))(
  ( (array!51034 (arr!24538 (Array (_ BitVec 32) (_ BitVec 64))) (size!24979 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51033)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878324 (= res!596385 (and (= (select (arr!24538 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878325 () Bool)

(declare-fun res!596391 () Bool)

(assert (=> b!878325 (=> (not res!596391) (not e!489019))))

(assert (=> b!878325 (= res!596391 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24979 _keys!868))))))

(declare-fun b!878326 () Bool)

(declare-fun res!596387 () Bool)

(assert (=> b!878326 (=> (not res!596387) (not e!489019))))

(declare-datatypes ((List!17360 0))(
  ( (Nil!17357) (Cons!17356 (h!18493 (_ BitVec 64)) (t!24441 List!17360)) )
))
(declare-fun arrayNoDuplicates!0 (array!51033 (_ BitVec 32) List!17360) Bool)

(assert (=> b!878326 (= res!596387 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17357))))

(declare-fun b!878327 () Bool)

(declare-fun res!596392 () Bool)

(assert (=> b!878327 (=> (not res!596392) (not e!489019))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51033 (_ BitVec 32)) Bool)

(assert (=> b!878327 (= res!596392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!596386 () Bool)

(assert (=> start!74666 (=> (not res!596386) (not e!489019))))

(assert (=> start!74666 (= res!596386 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24979 _keys!868))))))

(assert (=> start!74666 e!489019))

(declare-fun tp_is_empty!17431 () Bool)

(assert (=> start!74666 tp_is_empty!17431))

(assert (=> start!74666 true))

(assert (=> start!74666 tp!53243))

(declare-fun array_inv!19392 (array!51033) Bool)

(assert (=> start!74666 (array_inv!19392 _keys!868)))

(declare-datatypes ((V!28289 0))(
  ( (V!28290 (val!8763 Int)) )
))
(declare-datatypes ((ValueCell!8276 0))(
  ( (ValueCellFull!8276 (v!11203 V!28289)) (EmptyCell!8276) )
))
(declare-datatypes ((array!51035 0))(
  ( (array!51036 (arr!24539 (Array (_ BitVec 32) ValueCell!8276)) (size!24980 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51035)

(declare-fun e!489021 () Bool)

(declare-fun array_inv!19393 (array!51035) Bool)

(assert (=> start!74666 (and (array_inv!19393 _values!688) e!489021)))

(declare-fun b!878328 () Bool)

(assert (=> b!878328 (= e!489019 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24979 _keys!868)))))))

(declare-fun v!557 () V!28289)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11524 0))(
  ( (tuple2!11525 (_1!5773 (_ BitVec 64)) (_2!5773 V!28289)) )
))
(declare-datatypes ((List!17361 0))(
  ( (Nil!17358) (Cons!17357 (h!18494 tuple2!11524) (t!24442 List!17361)) )
))
(declare-datatypes ((ListLongMap!10295 0))(
  ( (ListLongMap!10296 (toList!5163 List!17361)) )
))
(declare-fun lt!397432 () ListLongMap!10295)

(declare-fun minValue!654 () V!28289)

(declare-fun zeroValue!654 () V!28289)

(declare-fun getCurrentListMapNoExtraKeys!3205 (array!51033 array!51035 (_ BitVec 32) (_ BitVec 32) V!28289 V!28289 (_ BitVec 32) Int) ListLongMap!10295)

(assert (=> b!878328 (= lt!397432 (getCurrentListMapNoExtraKeys!3205 _keys!868 (array!51036 (store (arr!24539 _values!688) i!612 (ValueCellFull!8276 v!557)) (size!24980 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397431 () ListLongMap!10295)

(assert (=> b!878328 (= lt!397431 (getCurrentListMapNoExtraKeys!3205 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878329 () Bool)

(declare-fun res!596390 () Bool)

(assert (=> b!878329 (=> (not res!596390) (not e!489019))))

(assert (=> b!878329 (= res!596390 (and (= (size!24980 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24979 _keys!868) (size!24980 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878330 () Bool)

(declare-fun res!596388 () Bool)

(assert (=> b!878330 (=> (not res!596388) (not e!489019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878330 (= res!596388 (validKeyInArray!0 k0!854))))

(declare-fun b!878331 () Bool)

(declare-fun res!596389 () Bool)

(assert (=> b!878331 (=> (not res!596389) (not e!489019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878331 (= res!596389 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27762 () Bool)

(declare-fun mapRes!27762 () Bool)

(assert (=> mapIsEmpty!27762 mapRes!27762))

(declare-fun b!878332 () Bool)

(declare-fun e!489018 () Bool)

(assert (=> b!878332 (= e!489018 tp_is_empty!17431)))

(declare-fun b!878333 () Bool)

(assert (=> b!878333 (= e!489021 (and e!489018 mapRes!27762))))

(declare-fun condMapEmpty!27762 () Bool)

(declare-fun mapDefault!27762 () ValueCell!8276)

(assert (=> b!878333 (= condMapEmpty!27762 (= (arr!24539 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8276)) mapDefault!27762)))))

(declare-fun b!878334 () Bool)

(declare-fun e!489022 () Bool)

(assert (=> b!878334 (= e!489022 tp_is_empty!17431)))

(declare-fun mapNonEmpty!27762 () Bool)

(declare-fun tp!53244 () Bool)

(assert (=> mapNonEmpty!27762 (= mapRes!27762 (and tp!53244 e!489022))))

(declare-fun mapKey!27762 () (_ BitVec 32))

(declare-fun mapRest!27762 () (Array (_ BitVec 32) ValueCell!8276))

(declare-fun mapValue!27762 () ValueCell!8276)

(assert (=> mapNonEmpty!27762 (= (arr!24539 _values!688) (store mapRest!27762 mapKey!27762 mapValue!27762))))

(assert (= (and start!74666 res!596386) b!878331))

(assert (= (and b!878331 res!596389) b!878329))

(assert (= (and b!878329 res!596390) b!878327))

(assert (= (and b!878327 res!596392) b!878326))

(assert (= (and b!878326 res!596387) b!878325))

(assert (= (and b!878325 res!596391) b!878330))

(assert (= (and b!878330 res!596388) b!878324))

(assert (= (and b!878324 res!596385) b!878328))

(assert (= (and b!878333 condMapEmpty!27762) mapIsEmpty!27762))

(assert (= (and b!878333 (not condMapEmpty!27762)) mapNonEmpty!27762))

(get-info :version)

(assert (= (and mapNonEmpty!27762 ((_ is ValueCellFull!8276) mapValue!27762)) b!878334))

(assert (= (and b!878333 ((_ is ValueCellFull!8276) mapDefault!27762)) b!878332))

(assert (= start!74666 b!878333))

(declare-fun m!818925 () Bool)

(assert (=> start!74666 m!818925))

(declare-fun m!818927 () Bool)

(assert (=> start!74666 m!818927))

(declare-fun m!818929 () Bool)

(assert (=> b!878330 m!818929))

(declare-fun m!818931 () Bool)

(assert (=> b!878328 m!818931))

(declare-fun m!818933 () Bool)

(assert (=> b!878328 m!818933))

(declare-fun m!818935 () Bool)

(assert (=> b!878328 m!818935))

(declare-fun m!818937 () Bool)

(assert (=> b!878327 m!818937))

(declare-fun m!818939 () Bool)

(assert (=> mapNonEmpty!27762 m!818939))

(declare-fun m!818941 () Bool)

(assert (=> b!878331 m!818941))

(declare-fun m!818943 () Bool)

(assert (=> b!878326 m!818943))

(declare-fun m!818945 () Bool)

(assert (=> b!878324 m!818945))

(check-sat (not b!878330) (not b!878326) (not start!74666) (not b!878327) b_and!25073 (not b!878328) tp_is_empty!17431 (not mapNonEmpty!27762) (not b!878331) (not b_next!15187))
(check-sat b_and!25073 (not b_next!15187))
