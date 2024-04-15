; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43532 () Bool)

(assert start!43532)

(declare-fun b_free!12325 () Bool)

(declare-fun b_next!12325 () Bool)

(assert (=> start!43532 (= b_free!12325 (not b_next!12325))))

(declare-fun tp!43257 () Bool)

(declare-fun b_and!21059 () Bool)

(assert (=> start!43532 (= tp!43257 b_and!21059)))

(declare-fun b!482241 () Bool)

(declare-fun res!287496 () Bool)

(declare-fun e!283778 () Bool)

(assert (=> b!482241 (=> (not res!287496) (not e!283778))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19521 0))(
  ( (V!19522 (val!6966 Int)) )
))
(declare-fun minValue!1458 () V!19521)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19521)

(declare-datatypes ((ValueCell!6557 0))(
  ( (ValueCellFull!6557 (v!9253 V!19521)) (EmptyCell!6557) )
))
(declare-datatypes ((array!31325 0))(
  ( (array!31326 (arr!15065 (Array (_ BitVec 32) ValueCell!6557)) (size!15424 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31325)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31327 0))(
  ( (array!31328 (arr!15066 (Array (_ BitVec 32) (_ BitVec 64))) (size!15425 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31327)

(declare-datatypes ((tuple2!9194 0))(
  ( (tuple2!9195 (_1!4608 (_ BitVec 64)) (_2!4608 V!19521)) )
))
(declare-datatypes ((List!9260 0))(
  ( (Nil!9257) (Cons!9256 (h!10112 tuple2!9194) (t!15465 List!9260)) )
))
(declare-datatypes ((ListLongMap!8097 0))(
  ( (ListLongMap!8098 (toList!4064 List!9260)) )
))
(declare-fun contains!2643 (ListLongMap!8097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2317 (array!31327 array!31325 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 32) Int) ListLongMap!8097)

(assert (=> b!482241 (= res!287496 (contains!2643 (getCurrentListMap!2317 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482242 () Bool)

(declare-fun res!287497 () Bool)

(assert (=> b!482242 (=> (not res!287497) (not e!283778))))

(assert (=> b!482242 (= res!287497 (and (= (size!15424 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15425 _keys!1874) (size!15424 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482243 () Bool)

(declare-fun res!287495 () Bool)

(assert (=> b!482243 (=> (not res!287495) (not e!283778))))

(declare-datatypes ((List!9261 0))(
  ( (Nil!9258) (Cons!9257 (h!10113 (_ BitVec 64)) (t!15466 List!9261)) )
))
(declare-fun arrayNoDuplicates!0 (array!31327 (_ BitVec 32) List!9261) Bool)

(assert (=> b!482243 (= res!287495 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9258))))

(declare-fun res!287500 () Bool)

(assert (=> start!43532 (=> (not res!287500) (not e!283778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43532 (= res!287500 (validMask!0 mask!2352))))

(assert (=> start!43532 e!283778))

(assert (=> start!43532 true))

(declare-fun tp_is_empty!13837 () Bool)

(assert (=> start!43532 tp_is_empty!13837))

(declare-fun e!283779 () Bool)

(declare-fun array_inv!10956 (array!31325) Bool)

(assert (=> start!43532 (and (array_inv!10956 _values!1516) e!283779)))

(assert (=> start!43532 tp!43257))

(declare-fun array_inv!10957 (array!31327) Bool)

(assert (=> start!43532 (array_inv!10957 _keys!1874)))

(declare-fun b!482244 () Bool)

(declare-fun e!283782 () Bool)

(assert (=> b!482244 (= e!283782 tp_is_empty!13837)))

(declare-fun b!482245 () Bool)

(declare-fun res!287499 () Bool)

(assert (=> b!482245 (=> (not res!287499) (not e!283778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482245 (= res!287499 (validKeyInArray!0 k0!1332))))

(declare-fun b!482246 () Bool)

(declare-fun mapRes!22465 () Bool)

(assert (=> b!482246 (= e!283779 (and e!283782 mapRes!22465))))

(declare-fun condMapEmpty!22465 () Bool)

(declare-fun mapDefault!22465 () ValueCell!6557)

(assert (=> b!482246 (= condMapEmpty!22465 (= (arr!15065 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6557)) mapDefault!22465)))))

(declare-fun b!482247 () Bool)

(assert (=> b!482247 (= e!283778 (not (= (size!15425 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218503 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31327 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482247 (= lt!218503 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283781 () Bool)

(assert (=> b!482247 e!283781))

(declare-fun c!57889 () Bool)

(assert (=> b!482247 (= c!57889 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14126 0))(
  ( (Unit!14127) )
))
(declare-fun lt!218502 () Unit!14126)

(declare-fun lemmaKeyInListMapIsInArray!150 (array!31327 array!31325 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 64) Int) Unit!14126)

(assert (=> b!482247 (= lt!218502 (lemmaKeyInListMapIsInArray!150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482248 () Bool)

(declare-fun arrayContainsKey!0 (array!31327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482248 (= e!283781 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22465 () Bool)

(assert (=> mapIsEmpty!22465 mapRes!22465))

(declare-fun mapNonEmpty!22465 () Bool)

(declare-fun tp!43258 () Bool)

(declare-fun e!283777 () Bool)

(assert (=> mapNonEmpty!22465 (= mapRes!22465 (and tp!43258 e!283777))))

(declare-fun mapValue!22465 () ValueCell!6557)

(declare-fun mapRest!22465 () (Array (_ BitVec 32) ValueCell!6557))

(declare-fun mapKey!22465 () (_ BitVec 32))

(assert (=> mapNonEmpty!22465 (= (arr!15065 _values!1516) (store mapRest!22465 mapKey!22465 mapValue!22465))))

(declare-fun b!482249 () Bool)

(assert (=> b!482249 (= e!283777 tp_is_empty!13837)))

(declare-fun b!482250 () Bool)

(declare-fun res!287498 () Bool)

(assert (=> b!482250 (=> (not res!287498) (not e!283778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31327 (_ BitVec 32)) Bool)

(assert (=> b!482250 (= res!287498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482251 () Bool)

(assert (=> b!482251 (= e!283781 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!43532 res!287500) b!482242))

(assert (= (and b!482242 res!287497) b!482250))

(assert (= (and b!482250 res!287498) b!482243))

(assert (= (and b!482243 res!287495) b!482241))

(assert (= (and b!482241 res!287496) b!482245))

(assert (= (and b!482245 res!287499) b!482247))

(assert (= (and b!482247 c!57889) b!482248))

(assert (= (and b!482247 (not c!57889)) b!482251))

(assert (= (and b!482246 condMapEmpty!22465) mapIsEmpty!22465))

(assert (= (and b!482246 (not condMapEmpty!22465)) mapNonEmpty!22465))

(get-info :version)

(assert (= (and mapNonEmpty!22465 ((_ is ValueCellFull!6557) mapValue!22465)) b!482249))

(assert (= (and b!482246 ((_ is ValueCellFull!6557) mapDefault!22465)) b!482244))

(assert (= start!43532 b!482246))

(declare-fun m!463005 () Bool)

(assert (=> mapNonEmpty!22465 m!463005))

(declare-fun m!463007 () Bool)

(assert (=> b!482241 m!463007))

(assert (=> b!482241 m!463007))

(declare-fun m!463009 () Bool)

(assert (=> b!482241 m!463009))

(declare-fun m!463011 () Bool)

(assert (=> b!482250 m!463011))

(declare-fun m!463013 () Bool)

(assert (=> b!482243 m!463013))

(declare-fun m!463015 () Bool)

(assert (=> b!482248 m!463015))

(declare-fun m!463017 () Bool)

(assert (=> b!482245 m!463017))

(declare-fun m!463019 () Bool)

(assert (=> b!482247 m!463019))

(declare-fun m!463021 () Bool)

(assert (=> b!482247 m!463021))

(declare-fun m!463023 () Bool)

(assert (=> start!43532 m!463023))

(declare-fun m!463025 () Bool)

(assert (=> start!43532 m!463025))

(declare-fun m!463027 () Bool)

(assert (=> start!43532 m!463027))

(check-sat tp_is_empty!13837 (not start!43532) b_and!21059 (not b_next!12325) (not b!482250) (not b!482241) (not b!482247) (not mapNonEmpty!22465) (not b!482245) (not b!482248) (not b!482243))
(check-sat b_and!21059 (not b_next!12325))
