; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4094 () Bool)

(assert start!4094)

(declare-fun b_free!1003 () Bool)

(declare-fun b_next!1003 () Bool)

(assert (=> start!4094 (= b_free!1003 (not b_next!1003))))

(declare-fun tp!4429 () Bool)

(declare-fun b_and!1803 () Bool)

(assert (=> start!4094 (= tp!4429 b_and!1803)))

(declare-fun b!30363 () Bool)

(declare-fun res!18300 () Bool)

(declare-fun e!19483 () Bool)

(assert (=> b!30363 (=> (not res!18300) (not e!19483))))

(declare-datatypes ((array!1923 0))(
  ( (array!1924 (arr!915 (Array (_ BitVec 32) (_ BitVec 64))) (size!1016 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1923)

(declare-datatypes ((List!754 0))(
  ( (Nil!751) (Cons!750 (h!1317 (_ BitVec 64)) (t!3441 List!754)) )
))
(declare-fun arrayNoDuplicates!0 (array!1923 (_ BitVec 32) List!754) Bool)

(assert (=> b!30363 (= res!18300 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!751))))

(declare-fun mapIsEmpty!1564 () Bool)

(declare-fun mapRes!1564 () Bool)

(assert (=> mapIsEmpty!1564 mapRes!1564))

(declare-fun b!30364 () Bool)

(assert (=> b!30364 (= e!19483 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!104 0))(
  ( (MissingZero!104 (index!2538 (_ BitVec 32))) (Found!104 (index!2539 (_ BitVec 32))) (Intermediate!104 (undefined!916 Bool) (index!2540 (_ BitVec 32)) (x!6534 (_ BitVec 32))) (Undefined!104) (MissingVacant!104 (index!2541 (_ BitVec 32))) )
))
(declare-fun lt!11376 () SeekEntryResult!104)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1923 (_ BitVec 32)) SeekEntryResult!104)

(assert (=> b!30364 (= lt!11376 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30365 () Bool)

(declare-fun e!19482 () Bool)

(declare-fun tp_is_empty!1357 () Bool)

(assert (=> b!30365 (= e!19482 tp_is_empty!1357)))

(declare-fun b!30366 () Bool)

(declare-fun res!18304 () Bool)

(assert (=> b!30366 (=> (not res!18304) (not e!19483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30366 (= res!18304 (validKeyInArray!0 k0!1304))))

(declare-fun b!30368 () Bool)

(declare-fun res!18303 () Bool)

(assert (=> b!30368 (=> (not res!18303) (not e!19483))))

(declare-fun arrayContainsKey!0 (array!1923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30368 (= res!18303 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30369 () Bool)

(declare-fun e!19479 () Bool)

(assert (=> b!30369 (= e!19479 tp_is_empty!1357)))

(declare-fun b!30370 () Bool)

(declare-fun e!19481 () Bool)

(assert (=> b!30370 (= e!19481 (and e!19482 mapRes!1564))))

(declare-fun condMapEmpty!1564 () Bool)

(declare-datatypes ((V!1635 0))(
  ( (V!1636 (val!705 Int)) )
))
(declare-datatypes ((ValueCell!479 0))(
  ( (ValueCellFull!479 (v!1794 V!1635)) (EmptyCell!479) )
))
(declare-datatypes ((array!1925 0))(
  ( (array!1926 (arr!916 (Array (_ BitVec 32) ValueCell!479)) (size!1017 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1925)

(declare-fun mapDefault!1564 () ValueCell!479)

(assert (=> b!30370 (= condMapEmpty!1564 (= (arr!916 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!479)) mapDefault!1564)))))

(declare-fun b!30371 () Bool)

(declare-fun res!18305 () Bool)

(assert (=> b!30371 (=> (not res!18305) (not e!19483))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1635)

(declare-fun minValue!1443 () V!1635)

(declare-datatypes ((tuple2!1162 0))(
  ( (tuple2!1163 (_1!592 (_ BitVec 64)) (_2!592 V!1635)) )
))
(declare-datatypes ((List!755 0))(
  ( (Nil!752) (Cons!751 (h!1318 tuple2!1162) (t!3442 List!755)) )
))
(declare-datatypes ((ListLongMap!733 0))(
  ( (ListLongMap!734 (toList!382 List!755)) )
))
(declare-fun contains!324 (ListLongMap!733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!207 (array!1923 array!1925 (_ BitVec 32) (_ BitVec 32) V!1635 V!1635 (_ BitVec 32) Int) ListLongMap!733)

(assert (=> b!30371 (= res!18305 (not (contains!324 (getCurrentListMap!207 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!18299 () Bool)

(assert (=> start!4094 (=> (not res!18299) (not e!19483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4094 (= res!18299 (validMask!0 mask!2294))))

(assert (=> start!4094 e!19483))

(assert (=> start!4094 true))

(assert (=> start!4094 tp!4429))

(declare-fun array_inv!633 (array!1925) Bool)

(assert (=> start!4094 (and (array_inv!633 _values!1501) e!19481)))

(declare-fun array_inv!634 (array!1923) Bool)

(assert (=> start!4094 (array_inv!634 _keys!1833)))

(assert (=> start!4094 tp_is_empty!1357))

(declare-fun b!30367 () Bool)

(declare-fun res!18302 () Bool)

(assert (=> b!30367 (=> (not res!18302) (not e!19483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1923 (_ BitVec 32)) Bool)

(assert (=> b!30367 (= res!18302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1564 () Bool)

(declare-fun tp!4428 () Bool)

(assert (=> mapNonEmpty!1564 (= mapRes!1564 (and tp!4428 e!19479))))

(declare-fun mapRest!1564 () (Array (_ BitVec 32) ValueCell!479))

(declare-fun mapValue!1564 () ValueCell!479)

(declare-fun mapKey!1564 () (_ BitVec 32))

(assert (=> mapNonEmpty!1564 (= (arr!916 _values!1501) (store mapRest!1564 mapKey!1564 mapValue!1564))))

(declare-fun b!30372 () Bool)

(declare-fun res!18301 () Bool)

(assert (=> b!30372 (=> (not res!18301) (not e!19483))))

(assert (=> b!30372 (= res!18301 (and (= (size!1017 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1016 _keys!1833) (size!1017 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4094 res!18299) b!30372))

(assert (= (and b!30372 res!18301) b!30367))

(assert (= (and b!30367 res!18302) b!30363))

(assert (= (and b!30363 res!18300) b!30366))

(assert (= (and b!30366 res!18304) b!30371))

(assert (= (and b!30371 res!18305) b!30368))

(assert (= (and b!30368 res!18303) b!30364))

(assert (= (and b!30370 condMapEmpty!1564) mapIsEmpty!1564))

(assert (= (and b!30370 (not condMapEmpty!1564)) mapNonEmpty!1564))

(get-info :version)

(assert (= (and mapNonEmpty!1564 ((_ is ValueCellFull!479) mapValue!1564)) b!30369))

(assert (= (and b!30370 ((_ is ValueCellFull!479) mapDefault!1564)) b!30365))

(assert (= start!4094 b!30370))

(declare-fun m!24299 () Bool)

(assert (=> start!4094 m!24299))

(declare-fun m!24301 () Bool)

(assert (=> start!4094 m!24301))

(declare-fun m!24303 () Bool)

(assert (=> start!4094 m!24303))

(declare-fun m!24305 () Bool)

(assert (=> b!30367 m!24305))

(declare-fun m!24307 () Bool)

(assert (=> b!30364 m!24307))

(declare-fun m!24309 () Bool)

(assert (=> mapNonEmpty!1564 m!24309))

(declare-fun m!24311 () Bool)

(assert (=> b!30366 m!24311))

(declare-fun m!24313 () Bool)

(assert (=> b!30363 m!24313))

(declare-fun m!24315 () Bool)

(assert (=> b!30368 m!24315))

(declare-fun m!24317 () Bool)

(assert (=> b!30371 m!24317))

(assert (=> b!30371 m!24317))

(declare-fun m!24319 () Bool)

(assert (=> b!30371 m!24319))

(check-sat (not b_next!1003) (not b!30367) (not start!4094) (not b!30371) tp_is_empty!1357 (not b!30366) b_and!1803 (not b!30363) (not mapNonEmpty!1564) (not b!30368) (not b!30364))
(check-sat b_and!1803 (not b_next!1003))
