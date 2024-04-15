; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40184 () Bool)

(assert start!40184)

(declare-fun b_free!10465 () Bool)

(declare-fun b_next!10465 () Bool)

(assert (=> start!40184 (= b_free!10465 (not b_next!10465))))

(declare-fun tp!36923 () Bool)

(declare-fun b_and!18407 () Bool)

(assert (=> start!40184 (= tp!36923 b_and!18407)))

(declare-fun mapIsEmpty!19047 () Bool)

(declare-fun mapRes!19047 () Bool)

(assert (=> mapIsEmpty!19047 mapRes!19047))

(declare-fun b!440245 () Bool)

(declare-fun e!259352 () Bool)

(declare-fun e!259355 () Bool)

(assert (=> b!440245 (= e!259352 (and e!259355 mapRes!19047))))

(declare-fun condMapEmpty!19047 () Bool)

(declare-datatypes ((V!16595 0))(
  ( (V!16596 (val!5853 Int)) )
))
(declare-datatypes ((ValueCell!5465 0))(
  ( (ValueCellFull!5465 (v!8094 V!16595)) (EmptyCell!5465) )
))
(declare-datatypes ((array!27051 0))(
  ( (array!27052 (arr!12975 (Array (_ BitVec 32) ValueCell!5465)) (size!13328 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27051)

(declare-fun mapDefault!19047 () ValueCell!5465)

(assert (=> b!440245 (= condMapEmpty!19047 (= (arr!12975 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5465)) mapDefault!19047)))))

(declare-fun b!440246 () Bool)

(declare-fun res!260441 () Bool)

(declare-fun e!259350 () Bool)

(assert (=> b!440246 (=> (not res!260441) (not e!259350))))

(declare-datatypes ((array!27053 0))(
  ( (array!27054 (arr!12976 (Array (_ BitVec 32) (_ BitVec 64))) (size!13329 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27053)

(declare-datatypes ((List!7783 0))(
  ( (Nil!7780) (Cons!7779 (h!8635 (_ BitVec 64)) (t!13530 List!7783)) )
))
(declare-fun arrayNoDuplicates!0 (array!27053 (_ BitVec 32) List!7783) Bool)

(assert (=> b!440246 (= res!260441 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun res!260430 () Bool)

(assert (=> start!40184 (=> (not res!260430) (not e!259350))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40184 (= res!260430 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13329 _keys!709))))))

(assert (=> start!40184 e!259350))

(declare-fun tp_is_empty!11617 () Bool)

(assert (=> start!40184 tp_is_empty!11617))

(assert (=> start!40184 tp!36923))

(assert (=> start!40184 true))

(declare-fun array_inv!9464 (array!27051) Bool)

(assert (=> start!40184 (and (array_inv!9464 _values!549) e!259352)))

(declare-fun array_inv!9465 (array!27053) Bool)

(assert (=> start!40184 (array_inv!9465 _keys!709)))

(declare-fun b!440247 () Bool)

(declare-fun e!259351 () Bool)

(assert (=> b!440247 (= e!259351 (not true))))

(declare-fun minValue!515 () V!16595)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202374 () array!27051)

(declare-fun zeroValue!515 () V!16595)

(declare-fun v!412 () V!16595)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202373 () array!27053)

(declare-datatypes ((tuple2!7796 0))(
  ( (tuple2!7797 (_1!3909 (_ BitVec 64)) (_2!3909 V!16595)) )
))
(declare-datatypes ((List!7784 0))(
  ( (Nil!7781) (Cons!7780 (h!8636 tuple2!7796) (t!13531 List!7784)) )
))
(declare-datatypes ((ListLongMap!6699 0))(
  ( (ListLongMap!6700 (toList!3365 List!7784)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1564 (array!27053 array!27051 (_ BitVec 32) (_ BitVec 32) V!16595 V!16595 (_ BitVec 32) Int) ListLongMap!6699)

(declare-fun +!1526 (ListLongMap!6699 tuple2!7796) ListLongMap!6699)

(assert (=> b!440247 (= (getCurrentListMapNoExtraKeys!1564 lt!202373 lt!202374 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1526 (getCurrentListMapNoExtraKeys!1564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7797 k0!794 v!412)))))

(declare-datatypes ((Unit!13069 0))(
  ( (Unit!13070) )
))
(declare-fun lt!202376 () Unit!13069)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 (array!27053 array!27051 (_ BitVec 32) (_ BitVec 32) V!16595 V!16595 (_ BitVec 32) (_ BitVec 64) V!16595 (_ BitVec 32) Int) Unit!13069)

(assert (=> b!440247 (= lt!202376 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440248 () Bool)

(assert (=> b!440248 (= e!259355 tp_is_empty!11617)))

(declare-fun b!440249 () Bool)

(declare-fun e!259353 () Bool)

(assert (=> b!440249 (= e!259350 e!259353)))

(declare-fun res!260437 () Bool)

(assert (=> b!440249 (=> (not res!260437) (not e!259353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27053 (_ BitVec 32)) Bool)

(assert (=> b!440249 (= res!260437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202373 mask!1025))))

(assert (=> b!440249 (= lt!202373 (array!27054 (store (arr!12976 _keys!709) i!563 k0!794) (size!13329 _keys!709)))))

(declare-fun b!440250 () Bool)

(declare-fun res!260442 () Bool)

(assert (=> b!440250 (=> (not res!260442) (not e!259350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440250 (= res!260442 (validMask!0 mask!1025))))

(declare-fun b!440251 () Bool)

(declare-fun res!260436 () Bool)

(assert (=> b!440251 (=> (not res!260436) (not e!259350))))

(assert (=> b!440251 (= res!260436 (or (= (select (arr!12976 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12976 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440252 () Bool)

(declare-fun res!260434 () Bool)

(assert (=> b!440252 (=> (not res!260434) (not e!259353))))

(assert (=> b!440252 (= res!260434 (bvsle from!863 i!563))))

(declare-fun b!440253 () Bool)

(declare-fun res!260440 () Bool)

(assert (=> b!440253 (=> (not res!260440) (not e!259350))))

(assert (=> b!440253 (= res!260440 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13329 _keys!709))))))

(declare-fun mapNonEmpty!19047 () Bool)

(declare-fun tp!36924 () Bool)

(declare-fun e!259356 () Bool)

(assert (=> mapNonEmpty!19047 (= mapRes!19047 (and tp!36924 e!259356))))

(declare-fun mapKey!19047 () (_ BitVec 32))

(declare-fun mapValue!19047 () ValueCell!5465)

(declare-fun mapRest!19047 () (Array (_ BitVec 32) ValueCell!5465))

(assert (=> mapNonEmpty!19047 (= (arr!12975 _values!549) (store mapRest!19047 mapKey!19047 mapValue!19047))))

(declare-fun b!440254 () Bool)

(declare-fun res!260431 () Bool)

(assert (=> b!440254 (=> (not res!260431) (not e!259350))))

(declare-fun arrayContainsKey!0 (array!27053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440254 (= res!260431 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440255 () Bool)

(declare-fun res!260439 () Bool)

(assert (=> b!440255 (=> (not res!260439) (not e!259350))))

(assert (=> b!440255 (= res!260439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440256 () Bool)

(assert (=> b!440256 (= e!259356 tp_is_empty!11617)))

(declare-fun b!440257 () Bool)

(declare-fun res!260438 () Bool)

(assert (=> b!440257 (=> (not res!260438) (not e!259350))))

(assert (=> b!440257 (= res!260438 (and (= (size!13328 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13329 _keys!709) (size!13328 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440258 () Bool)

(declare-fun res!260435 () Bool)

(assert (=> b!440258 (=> (not res!260435) (not e!259353))))

(assert (=> b!440258 (= res!260435 (arrayNoDuplicates!0 lt!202373 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun b!440259 () Bool)

(assert (=> b!440259 (= e!259353 e!259351)))

(declare-fun res!260433 () Bool)

(assert (=> b!440259 (=> (not res!260433) (not e!259351))))

(assert (=> b!440259 (= res!260433 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202372 () ListLongMap!6699)

(assert (=> b!440259 (= lt!202372 (getCurrentListMapNoExtraKeys!1564 lt!202373 lt!202374 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440259 (= lt!202374 (array!27052 (store (arr!12975 _values!549) i!563 (ValueCellFull!5465 v!412)) (size!13328 _values!549)))))

(declare-fun lt!202375 () ListLongMap!6699)

(assert (=> b!440259 (= lt!202375 (getCurrentListMapNoExtraKeys!1564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440260 () Bool)

(declare-fun res!260432 () Bool)

(assert (=> b!440260 (=> (not res!260432) (not e!259350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440260 (= res!260432 (validKeyInArray!0 k0!794))))

(assert (= (and start!40184 res!260430) b!440250))

(assert (= (and b!440250 res!260442) b!440257))

(assert (= (and b!440257 res!260438) b!440255))

(assert (= (and b!440255 res!260439) b!440246))

(assert (= (and b!440246 res!260441) b!440253))

(assert (= (and b!440253 res!260440) b!440260))

(assert (= (and b!440260 res!260432) b!440251))

(assert (= (and b!440251 res!260436) b!440254))

(assert (= (and b!440254 res!260431) b!440249))

(assert (= (and b!440249 res!260437) b!440258))

(assert (= (and b!440258 res!260435) b!440252))

(assert (= (and b!440252 res!260434) b!440259))

(assert (= (and b!440259 res!260433) b!440247))

(assert (= (and b!440245 condMapEmpty!19047) mapIsEmpty!19047))

(assert (= (and b!440245 (not condMapEmpty!19047)) mapNonEmpty!19047))

(get-info :version)

(assert (= (and mapNonEmpty!19047 ((_ is ValueCellFull!5465) mapValue!19047)) b!440256))

(assert (= (and b!440245 ((_ is ValueCellFull!5465) mapDefault!19047)) b!440248))

(assert (= start!40184 b!440245))

(declare-fun m!426813 () Bool)

(assert (=> b!440259 m!426813))

(declare-fun m!426815 () Bool)

(assert (=> b!440259 m!426815))

(declare-fun m!426817 () Bool)

(assert (=> b!440259 m!426817))

(declare-fun m!426819 () Bool)

(assert (=> mapNonEmpty!19047 m!426819))

(declare-fun m!426821 () Bool)

(assert (=> b!440250 m!426821))

(declare-fun m!426823 () Bool)

(assert (=> b!440246 m!426823))

(declare-fun m!426825 () Bool)

(assert (=> b!440254 m!426825))

(declare-fun m!426827 () Bool)

(assert (=> b!440260 m!426827))

(declare-fun m!426829 () Bool)

(assert (=> b!440249 m!426829))

(declare-fun m!426831 () Bool)

(assert (=> b!440249 m!426831))

(declare-fun m!426833 () Bool)

(assert (=> b!440251 m!426833))

(declare-fun m!426835 () Bool)

(assert (=> b!440247 m!426835))

(declare-fun m!426837 () Bool)

(assert (=> b!440247 m!426837))

(assert (=> b!440247 m!426837))

(declare-fun m!426839 () Bool)

(assert (=> b!440247 m!426839))

(declare-fun m!426841 () Bool)

(assert (=> b!440247 m!426841))

(declare-fun m!426843 () Bool)

(assert (=> start!40184 m!426843))

(declare-fun m!426845 () Bool)

(assert (=> start!40184 m!426845))

(declare-fun m!426847 () Bool)

(assert (=> b!440255 m!426847))

(declare-fun m!426849 () Bool)

(assert (=> b!440258 m!426849))

(check-sat (not b!440246) (not start!40184) (not b!440258) b_and!18407 (not b!440254) (not b!440247) (not b_next!10465) (not b!440260) tp_is_empty!11617 (not b!440249) (not b!440259) (not mapNonEmpty!19047) (not b!440250) (not b!440255))
(check-sat b_and!18407 (not b_next!10465))
