; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!802 () Bool)

(assert start!802)

(declare-fun b_free!195 () Bool)

(declare-fun b_next!195 () Bool)

(assert (=> start!802 (= b_free!195 (not b_next!195))))

(declare-fun tp!814 () Bool)

(declare-fun b_and!341 () Bool)

(assert (=> start!802 (= tp!814 b_and!341)))

(declare-fun b!5976 () Bool)

(declare-fun e!3261 () Bool)

(declare-fun e!3257 () Bool)

(declare-fun mapRes!380 () Bool)

(assert (=> b!5976 (= e!3261 (and e!3257 mapRes!380))))

(declare-fun condMapEmpty!380 () Bool)

(declare-datatypes ((V!541 0))(
  ( (V!542 (val!142 Int)) )
))
(declare-datatypes ((ValueCell!120 0))(
  ( (ValueCellFull!120 (v!1233 V!541)) (EmptyCell!120) )
))
(declare-datatypes ((array!479 0))(
  ( (array!480 (arr!228 (Array (_ BitVec 32) ValueCell!120)) (size!290 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!479)

(declare-fun mapDefault!380 () ValueCell!120)

(assert (=> b!5976 (= condMapEmpty!380 (= (arr!228 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!120)) mapDefault!380)))))

(declare-fun b!5977 () Bool)

(declare-fun e!3258 () Bool)

(declare-datatypes ((array!481 0))(
  ( (array!482 (arr!229 (Array (_ BitVec 32) (_ BitVec 64))) (size!291 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!481)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5977 (= e!3258 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5978 () Bool)

(declare-fun res!6539 () Bool)

(declare-fun e!3263 () Bool)

(assert (=> b!5978 (=> (not res!6539) (not e!3263))))

(declare-datatypes ((List!153 0))(
  ( (Nil!150) (Cons!149 (h!715 (_ BitVec 64)) (t!2288 List!153)) )
))
(declare-fun arrayNoDuplicates!0 (array!481 (_ BitVec 32) List!153) Bool)

(assert (=> b!5978 (= res!6539 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!150))))

(declare-fun b!5979 () Bool)

(declare-fun res!6538 () Bool)

(assert (=> b!5979 (=> (not res!6538) (not e!3263))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!541)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!541)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((tuple2!142 0))(
  ( (tuple2!143 (_1!71 (_ BitVec 64)) (_2!71 V!541)) )
))
(declare-datatypes ((List!154 0))(
  ( (Nil!151) (Cons!150 (h!716 tuple2!142) (t!2289 List!154)) )
))
(declare-datatypes ((ListLongMap!147 0))(
  ( (ListLongMap!148 (toList!89 List!154)) )
))
(declare-fun contains!63 (ListLongMap!147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!48 (array!481 array!479 (_ BitVec 32) (_ BitVec 32) V!541 V!541 (_ BitVec 32) Int) ListLongMap!147)

(assert (=> b!5979 (= res!6538 (contains!63 (getCurrentListMap!48 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!380 () Bool)

(declare-fun tp!815 () Bool)

(declare-fun e!3260 () Bool)

(assert (=> mapNonEmpty!380 (= mapRes!380 (and tp!815 e!3260))))

(declare-fun mapRest!380 () (Array (_ BitVec 32) ValueCell!120))

(declare-fun mapKey!380 () (_ BitVec 32))

(declare-fun mapValue!380 () ValueCell!120)

(assert (=> mapNonEmpty!380 (= (arr!228 _values!1492) (store mapRest!380 mapKey!380 mapValue!380))))

(declare-fun b!5980 () Bool)

(declare-fun e!3262 () Bool)

(assert (=> b!5980 (= e!3262 true)))

(declare-fun lt!1086 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!481 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5980 (= lt!1086 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5981 () Bool)

(declare-fun tp_is_empty!273 () Bool)

(assert (=> b!5981 (= e!3257 tp_is_empty!273)))

(declare-fun b!5982 () Bool)

(declare-fun res!6543 () Bool)

(assert (=> b!5982 (=> (not res!6543) (not e!3263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5982 (= res!6543 (validKeyInArray!0 k0!1278))))

(declare-fun mapIsEmpty!380 () Bool)

(assert (=> mapIsEmpty!380 mapRes!380))

(declare-fun b!5983 () Bool)

(declare-fun res!6541 () Bool)

(assert (=> b!5983 (=> (not res!6541) (not e!3263))))

(assert (=> b!5983 (= res!6541 (and (= (size!290 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!291 _keys!1806) (size!290 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5984 () Bool)

(assert (=> b!5984 (= e!3258 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5985 () Bool)

(declare-fun res!6542 () Bool)

(assert (=> b!5985 (=> (not res!6542) (not e!3263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!481 (_ BitVec 32)) Bool)

(assert (=> b!5985 (= res!6542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5986 () Bool)

(assert (=> b!5986 (= e!3260 tp_is_empty!273)))

(declare-fun b!5987 () Bool)

(assert (=> b!5987 (= e!3263 (not e!3262))))

(declare-fun res!6544 () Bool)

(assert (=> b!5987 (=> res!6544 e!3262)))

(assert (=> b!5987 (= res!6544 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5987 e!3258))

(declare-fun c!425 () Bool)

(assert (=> b!5987 (= c!425 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!91 0))(
  ( (Unit!92) )
))
(declare-fun lt!1085 () Unit!91)

(declare-fun lemmaKeyInListMapIsInArray!31 (array!481 array!479 (_ BitVec 32) (_ BitVec 32) V!541 V!541 (_ BitVec 64) Int) Unit!91)

(assert (=> b!5987 (= lt!1085 (lemmaKeyInListMapIsInArray!31 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun res!6540 () Bool)

(assert (=> start!802 (=> (not res!6540) (not e!3263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!802 (= res!6540 (validMask!0 mask!2250))))

(assert (=> start!802 e!3263))

(assert (=> start!802 tp!814))

(assert (=> start!802 true))

(declare-fun array_inv!167 (array!479) Bool)

(assert (=> start!802 (and (array_inv!167 _values!1492) e!3261)))

(assert (=> start!802 tp_is_empty!273))

(declare-fun array_inv!168 (array!481) Bool)

(assert (=> start!802 (array_inv!168 _keys!1806)))

(assert (= (and start!802 res!6540) b!5983))

(assert (= (and b!5983 res!6541) b!5985))

(assert (= (and b!5985 res!6542) b!5978))

(assert (= (and b!5978 res!6539) b!5979))

(assert (= (and b!5979 res!6538) b!5982))

(assert (= (and b!5982 res!6543) b!5987))

(assert (= (and b!5987 c!425) b!5977))

(assert (= (and b!5987 (not c!425)) b!5984))

(assert (= (and b!5987 (not res!6544)) b!5980))

(assert (= (and b!5976 condMapEmpty!380) mapIsEmpty!380))

(assert (= (and b!5976 (not condMapEmpty!380)) mapNonEmpty!380))

(get-info :version)

(assert (= (and mapNonEmpty!380 ((_ is ValueCellFull!120) mapValue!380)) b!5986))

(assert (= (and b!5976 ((_ is ValueCellFull!120) mapDefault!380)) b!5981))

(assert (= start!802 b!5976))

(declare-fun m!3377 () Bool)

(assert (=> mapNonEmpty!380 m!3377))

(declare-fun m!3379 () Bool)

(assert (=> b!5987 m!3379))

(declare-fun m!3381 () Bool)

(assert (=> b!5987 m!3381))

(declare-fun m!3383 () Bool)

(assert (=> b!5979 m!3383))

(assert (=> b!5979 m!3383))

(declare-fun m!3385 () Bool)

(assert (=> b!5979 m!3385))

(declare-fun m!3387 () Bool)

(assert (=> b!5985 m!3387))

(declare-fun m!3389 () Bool)

(assert (=> b!5980 m!3389))

(declare-fun m!3391 () Bool)

(assert (=> start!802 m!3391))

(declare-fun m!3393 () Bool)

(assert (=> start!802 m!3393))

(declare-fun m!3395 () Bool)

(assert (=> start!802 m!3395))

(declare-fun m!3397 () Bool)

(assert (=> b!5982 m!3397))

(declare-fun m!3399 () Bool)

(assert (=> b!5978 m!3399))

(assert (=> b!5977 m!3379))

(check-sat (not b!5978) (not start!802) tp_is_empty!273 (not b!5977) (not mapNonEmpty!380) b_and!341 (not b!5979) (not b!5982) (not b!5987) (not b!5980) (not b!5985) (not b_next!195))
(check-sat b_and!341 (not b_next!195))