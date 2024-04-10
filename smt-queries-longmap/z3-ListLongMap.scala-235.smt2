; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4094 () Bool)

(assert start!4094)

(declare-fun b_free!999 () Bool)

(declare-fun b_next!999 () Bool)

(assert (=> start!4094 (= b_free!999 (not b_next!999))))

(declare-fun tp!4417 () Bool)

(declare-fun b_and!1809 () Bool)

(assert (=> start!4094 (= tp!4417 b_and!1809)))

(declare-fun b!30375 () Bool)

(declare-fun e!19502 () Bool)

(declare-fun tp_is_empty!1353 () Bool)

(assert (=> b!30375 (= e!19502 tp_is_empty!1353)))

(declare-fun b!30376 () Bool)

(declare-fun e!19503 () Bool)

(assert (=> b!30376 (= e!19503 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!101 0))(
  ( (MissingZero!101 (index!2526 (_ BitVec 32))) (Found!101 (index!2527 (_ BitVec 32))) (Intermediate!101 (undefined!913 Bool) (index!2528 (_ BitVec 32)) (x!6523 (_ BitVec 32))) (Undefined!101) (MissingVacant!101 (index!2529 (_ BitVec 32))) )
))
(declare-fun lt!11414 () SeekEntryResult!101)

(declare-datatypes ((array!1935 0))(
  ( (array!1936 (arr!921 (Array (_ BitVec 32) (_ BitVec 64))) (size!1022 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1935)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1935 (_ BitVec 32)) SeekEntryResult!101)

(assert (=> b!30376 (= lt!11414 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30377 () Bool)

(declare-fun res!18301 () Bool)

(assert (=> b!30377 (=> (not res!18301) (not e!19503))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1629 0))(
  ( (V!1630 (val!703 Int)) )
))
(declare-datatypes ((ValueCell!477 0))(
  ( (ValueCellFull!477 (v!1792 V!1629)) (EmptyCell!477) )
))
(declare-datatypes ((array!1937 0))(
  ( (array!1938 (arr!922 (Array (_ BitVec 32) ValueCell!477)) (size!1023 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1937)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1629)

(declare-fun minValue!1443 () V!1629)

(declare-datatypes ((tuple2!1160 0))(
  ( (tuple2!1161 (_1!591 (_ BitVec 64)) (_2!591 V!1629)) )
))
(declare-datatypes ((List!755 0))(
  ( (Nil!752) (Cons!751 (h!1318 tuple2!1160) (t!3448 List!755)) )
))
(declare-datatypes ((ListLongMap!737 0))(
  ( (ListLongMap!738 (toList!384 List!755)) )
))
(declare-fun contains!324 (ListLongMap!737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!212 (array!1935 array!1937 (_ BitVec 32) (_ BitVec 32) V!1629 V!1629 (_ BitVec 32) Int) ListLongMap!737)

(assert (=> b!30377 (= res!18301 (not (contains!324 (getCurrentListMap!212 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30378 () Bool)

(declare-fun res!18300 () Bool)

(assert (=> b!30378 (=> (not res!18300) (not e!19503))))

(assert (=> b!30378 (= res!18300 (and (= (size!1023 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1022 _keys!1833) (size!1023 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30379 () Bool)

(declare-fun res!18303 () Bool)

(assert (=> b!30379 (=> (not res!18303) (not e!19503))))

(declare-fun arrayContainsKey!0 (array!1935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30379 (= res!18303 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1558 () Bool)

(declare-fun mapRes!1558 () Bool)

(assert (=> mapIsEmpty!1558 mapRes!1558))

(declare-fun mapNonEmpty!1558 () Bool)

(declare-fun tp!4416 () Bool)

(assert (=> mapNonEmpty!1558 (= mapRes!1558 (and tp!4416 e!19502))))

(declare-fun mapKey!1558 () (_ BitVec 32))

(declare-fun mapRest!1558 () (Array (_ BitVec 32) ValueCell!477))

(declare-fun mapValue!1558 () ValueCell!477)

(assert (=> mapNonEmpty!1558 (= (arr!922 _values!1501) (store mapRest!1558 mapKey!1558 mapValue!1558))))

(declare-fun b!30381 () Bool)

(declare-fun e!19505 () Bool)

(assert (=> b!30381 (= e!19505 tp_is_empty!1353)))

(declare-fun b!30382 () Bool)

(declare-fun e!19504 () Bool)

(assert (=> b!30382 (= e!19504 (and e!19505 mapRes!1558))))

(declare-fun condMapEmpty!1558 () Bool)

(declare-fun mapDefault!1558 () ValueCell!477)

(assert (=> b!30382 (= condMapEmpty!1558 (= (arr!922 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!477)) mapDefault!1558)))))

(declare-fun res!18302 () Bool)

(assert (=> start!4094 (=> (not res!18302) (not e!19503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4094 (= res!18302 (validMask!0 mask!2294))))

(assert (=> start!4094 e!19503))

(assert (=> start!4094 true))

(assert (=> start!4094 tp!4417))

(declare-fun array_inv!643 (array!1937) Bool)

(assert (=> start!4094 (and (array_inv!643 _values!1501) e!19504)))

(declare-fun array_inv!644 (array!1935) Bool)

(assert (=> start!4094 (array_inv!644 _keys!1833)))

(assert (=> start!4094 tp_is_empty!1353))

(declare-fun b!30380 () Bool)

(declare-fun res!18297 () Bool)

(assert (=> b!30380 (=> (not res!18297) (not e!19503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1935 (_ BitVec 32)) Bool)

(assert (=> b!30380 (= res!18297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30383 () Bool)

(declare-fun res!18298 () Bool)

(assert (=> b!30383 (=> (not res!18298) (not e!19503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30383 (= res!18298 (validKeyInArray!0 k0!1304))))

(declare-fun b!30384 () Bool)

(declare-fun res!18299 () Bool)

(assert (=> b!30384 (=> (not res!18299) (not e!19503))))

(declare-datatypes ((List!756 0))(
  ( (Nil!753) (Cons!752 (h!1319 (_ BitVec 64)) (t!3449 List!756)) )
))
(declare-fun arrayNoDuplicates!0 (array!1935 (_ BitVec 32) List!756) Bool)

(assert (=> b!30384 (= res!18299 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!753))))

(assert (= (and start!4094 res!18302) b!30378))

(assert (= (and b!30378 res!18300) b!30380))

(assert (= (and b!30380 res!18297) b!30384))

(assert (= (and b!30384 res!18299) b!30383))

(assert (= (and b!30383 res!18298) b!30377))

(assert (= (and b!30377 res!18301) b!30379))

(assert (= (and b!30379 res!18303) b!30376))

(assert (= (and b!30382 condMapEmpty!1558) mapIsEmpty!1558))

(assert (= (and b!30382 (not condMapEmpty!1558)) mapNonEmpty!1558))

(get-info :version)

(assert (= (and mapNonEmpty!1558 ((_ is ValueCellFull!477) mapValue!1558)) b!30375))

(assert (= (and b!30382 ((_ is ValueCellFull!477) mapDefault!1558)) b!30381))

(assert (= start!4094 b!30382))

(declare-fun m!24407 () Bool)

(assert (=> b!30379 m!24407))

(declare-fun m!24409 () Bool)

(assert (=> b!30377 m!24409))

(assert (=> b!30377 m!24409))

(declare-fun m!24411 () Bool)

(assert (=> b!30377 m!24411))

(declare-fun m!24413 () Bool)

(assert (=> start!4094 m!24413))

(declare-fun m!24415 () Bool)

(assert (=> start!4094 m!24415))

(declare-fun m!24417 () Bool)

(assert (=> start!4094 m!24417))

(declare-fun m!24419 () Bool)

(assert (=> mapNonEmpty!1558 m!24419))

(declare-fun m!24421 () Bool)

(assert (=> b!30384 m!24421))

(declare-fun m!24423 () Bool)

(assert (=> b!30380 m!24423))

(declare-fun m!24425 () Bool)

(assert (=> b!30376 m!24425))

(declare-fun m!24427 () Bool)

(assert (=> b!30383 m!24427))

(check-sat (not b_next!999) (not b!30377) (not b!30379) (not b!30380) b_and!1809 (not b!30376) (not b!30384) (not b!30383) (not mapNonEmpty!1558) tp_is_empty!1353 (not start!4094))
(check-sat b_and!1809 (not b_next!999))
