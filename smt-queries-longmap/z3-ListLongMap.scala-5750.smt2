; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74310 () Bool)

(assert start!74310)

(declare-fun b_free!15091 () Bool)

(declare-fun b_next!15091 () Bool)

(assert (=> start!74310 (= b_free!15091 (not b_next!15091))))

(declare-fun tp!52948 () Bool)

(declare-fun b_and!24841 () Bool)

(assert (=> start!74310 (= tp!52948 b_and!24841)))

(declare-fun b!874437 () Bool)

(declare-fun e!486829 () Bool)

(assert (=> b!874437 (= e!486829 false)))

(declare-datatypes ((V!28161 0))(
  ( (V!28162 (val!8715 Int)) )
))
(declare-datatypes ((tuple2!11524 0))(
  ( (tuple2!11525 (_1!5773 (_ BitVec 64)) (_2!5773 V!28161)) )
))
(declare-datatypes ((List!17337 0))(
  ( (Nil!17334) (Cons!17333 (h!18464 tuple2!11524) (t!24369 List!17337)) )
))
(declare-datatypes ((ListLongMap!10283 0))(
  ( (ListLongMap!10284 (toList!5157 List!17337)) )
))
(declare-fun lt!395750 () ListLongMap!10283)

(declare-fun v!557 () V!28161)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50779 0))(
  ( (array!50780 (arr!24418 (Array (_ BitVec 32) (_ BitVec 64))) (size!24860 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50779)

(declare-datatypes ((ValueCell!8228 0))(
  ( (ValueCellFull!8228 (v!11138 V!28161)) (EmptyCell!8228) )
))
(declare-datatypes ((array!50781 0))(
  ( (array!50782 (arr!24419 (Array (_ BitVec 32) ValueCell!8228)) (size!24861 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50781)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28161)

(declare-fun zeroValue!654 () V!28161)

(declare-fun getCurrentListMapNoExtraKeys!3150 (array!50779 array!50781 (_ BitVec 32) (_ BitVec 32) V!28161 V!28161 (_ BitVec 32) Int) ListLongMap!10283)

(assert (=> b!874437 (= lt!395750 (getCurrentListMapNoExtraKeys!3150 _keys!868 (array!50782 (store (arr!24419 _values!688) i!612 (ValueCellFull!8228 v!557)) (size!24861 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395751 () ListLongMap!10283)

(assert (=> b!874437 (= lt!395751 (getCurrentListMapNoExtraKeys!3150 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874438 () Bool)

(declare-fun res!594310 () Bool)

(assert (=> b!874438 (=> (not res!594310) (not e!486829))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874438 (= res!594310 (validKeyInArray!0 k0!854))))

(declare-fun b!874440 () Bool)

(declare-fun res!594311 () Bool)

(assert (=> b!874440 (=> (not res!594311) (not e!486829))))

(declare-datatypes ((List!17338 0))(
  ( (Nil!17335) (Cons!17334 (h!18465 (_ BitVec 64)) (t!24370 List!17338)) )
))
(declare-fun arrayNoDuplicates!0 (array!50779 (_ BitVec 32) List!17338) Bool)

(assert (=> b!874440 (= res!594311 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17335))))

(declare-fun b!874441 () Bool)

(declare-fun res!594313 () Bool)

(assert (=> b!874441 (=> (not res!594313) (not e!486829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50779 (_ BitVec 32)) Bool)

(assert (=> b!874441 (= res!594313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874442 () Bool)

(declare-fun e!486828 () Bool)

(declare-fun e!486830 () Bool)

(declare-fun mapRes!27611 () Bool)

(assert (=> b!874442 (= e!486828 (and e!486830 mapRes!27611))))

(declare-fun condMapEmpty!27611 () Bool)

(declare-fun mapDefault!27611 () ValueCell!8228)

(assert (=> b!874442 (= condMapEmpty!27611 (= (arr!24419 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8228)) mapDefault!27611)))))

(declare-fun b!874443 () Bool)

(declare-fun res!594309 () Bool)

(assert (=> b!874443 (=> (not res!594309) (not e!486829))))

(assert (=> b!874443 (= res!594309 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24860 _keys!868))))))

(declare-fun mapNonEmpty!27611 () Bool)

(declare-fun tp!52949 () Bool)

(declare-fun e!486832 () Bool)

(assert (=> mapNonEmpty!27611 (= mapRes!27611 (and tp!52949 e!486832))))

(declare-fun mapValue!27611 () ValueCell!8228)

(declare-fun mapRest!27611 () (Array (_ BitVec 32) ValueCell!8228))

(declare-fun mapKey!27611 () (_ BitVec 32))

(assert (=> mapNonEmpty!27611 (= (arr!24419 _values!688) (store mapRest!27611 mapKey!27611 mapValue!27611))))

(declare-fun b!874444 () Bool)

(declare-fun res!594315 () Bool)

(assert (=> b!874444 (=> (not res!594315) (not e!486829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874444 (= res!594315 (validMask!0 mask!1196))))

(declare-fun b!874445 () Bool)

(declare-fun res!594312 () Bool)

(assert (=> b!874445 (=> (not res!594312) (not e!486829))))

(assert (=> b!874445 (= res!594312 (and (= (size!24861 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24860 _keys!868) (size!24861 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874446 () Bool)

(declare-fun tp_is_empty!17335 () Bool)

(assert (=> b!874446 (= e!486832 tp_is_empty!17335)))

(declare-fun b!874439 () Bool)

(declare-fun res!594316 () Bool)

(assert (=> b!874439 (=> (not res!594316) (not e!486829))))

(assert (=> b!874439 (= res!594316 (and (= (select (arr!24418 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594314 () Bool)

(assert (=> start!74310 (=> (not res!594314) (not e!486829))))

(assert (=> start!74310 (= res!594314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24860 _keys!868))))))

(assert (=> start!74310 e!486829))

(assert (=> start!74310 tp_is_empty!17335))

(assert (=> start!74310 true))

(assert (=> start!74310 tp!52948))

(declare-fun array_inv!19312 (array!50779) Bool)

(assert (=> start!74310 (array_inv!19312 _keys!868)))

(declare-fun array_inv!19313 (array!50781) Bool)

(assert (=> start!74310 (and (array_inv!19313 _values!688) e!486828)))

(declare-fun b!874447 () Bool)

(assert (=> b!874447 (= e!486830 tp_is_empty!17335)))

(declare-fun mapIsEmpty!27611 () Bool)

(assert (=> mapIsEmpty!27611 mapRes!27611))

(assert (= (and start!74310 res!594314) b!874444))

(assert (= (and b!874444 res!594315) b!874445))

(assert (= (and b!874445 res!594312) b!874441))

(assert (= (and b!874441 res!594313) b!874440))

(assert (= (and b!874440 res!594311) b!874443))

(assert (= (and b!874443 res!594309) b!874438))

(assert (= (and b!874438 res!594310) b!874439))

(assert (= (and b!874439 res!594316) b!874437))

(assert (= (and b!874442 condMapEmpty!27611) mapIsEmpty!27611))

(assert (= (and b!874442 (not condMapEmpty!27611)) mapNonEmpty!27611))

(get-info :version)

(assert (= (and mapNonEmpty!27611 ((_ is ValueCellFull!8228) mapValue!27611)) b!874446))

(assert (= (and b!874442 ((_ is ValueCellFull!8228) mapDefault!27611)) b!874447))

(assert (= start!74310 b!874442))

(declare-fun m!814007 () Bool)

(assert (=> mapNonEmpty!27611 m!814007))

(declare-fun m!814009 () Bool)

(assert (=> b!874437 m!814009))

(declare-fun m!814011 () Bool)

(assert (=> b!874437 m!814011))

(declare-fun m!814013 () Bool)

(assert (=> b!874437 m!814013))

(declare-fun m!814015 () Bool)

(assert (=> b!874439 m!814015))

(declare-fun m!814017 () Bool)

(assert (=> b!874438 m!814017))

(declare-fun m!814019 () Bool)

(assert (=> b!874441 m!814019))

(declare-fun m!814021 () Bool)

(assert (=> b!874444 m!814021))

(declare-fun m!814023 () Bool)

(assert (=> start!74310 m!814023))

(declare-fun m!814025 () Bool)

(assert (=> start!74310 m!814025))

(declare-fun m!814027 () Bool)

(assert (=> b!874440 m!814027))

(check-sat (not b!874437) (not b_next!15091) (not b!874440) (not b!874438) (not mapNonEmpty!27611) (not start!74310) (not b!874441) tp_is_empty!17335 (not b!874444) b_and!24841)
(check-sat b_and!24841 (not b_next!15091))
