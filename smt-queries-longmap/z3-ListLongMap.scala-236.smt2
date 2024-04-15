; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4088 () Bool)

(assert start!4088)

(declare-fun b_free!1003 () Bool)

(declare-fun b_next!1003 () Bool)

(assert (=> start!4088 (= b_free!1003 (not b_next!1003))))

(declare-fun tp!4429 () Bool)

(declare-fun b_and!1807 () Bool)

(assert (=> start!4088 (= tp!4429 b_and!1807)))

(declare-fun b!30381 () Bool)

(declare-fun res!18312 () Bool)

(declare-fun e!19489 () Bool)

(assert (=> b!30381 (=> (not res!18312) (not e!19489))))

(declare-datatypes ((V!1635 0))(
  ( (V!1636 (val!705 Int)) )
))
(declare-datatypes ((ValueCell!479 0))(
  ( (ValueCellFull!479 (v!1793 V!1635)) (EmptyCell!479) )
))
(declare-datatypes ((array!1915 0))(
  ( (array!1916 (arr!911 (Array (_ BitVec 32) ValueCell!479)) (size!1012 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1915)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1917 0))(
  ( (array!1918 (arr!912 (Array (_ BitVec 32) (_ BitVec 64))) (size!1013 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1917)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30381 (= res!18312 (and (= (size!1012 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1013 _keys!1833) (size!1012 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1564 () Bool)

(declare-fun mapRes!1564 () Bool)

(declare-fun tp!4428 () Bool)

(declare-fun e!19492 () Bool)

(assert (=> mapNonEmpty!1564 (= mapRes!1564 (and tp!4428 e!19492))))

(declare-fun mapKey!1564 () (_ BitVec 32))

(declare-fun mapRest!1564 () (Array (_ BitVec 32) ValueCell!479))

(declare-fun mapValue!1564 () ValueCell!479)

(assert (=> mapNonEmpty!1564 (= (arr!911 _values!1501) (store mapRest!1564 mapKey!1564 mapValue!1564))))

(declare-fun b!30382 () Bool)

(declare-fun e!19488 () Bool)

(declare-fun e!19490 () Bool)

(assert (=> b!30382 (= e!19488 (and e!19490 mapRes!1564))))

(declare-fun condMapEmpty!1564 () Bool)

(declare-fun mapDefault!1564 () ValueCell!479)

(assert (=> b!30382 (= condMapEmpty!1564 (= (arr!911 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!479)) mapDefault!1564)))))

(declare-fun b!30383 () Bool)

(declare-fun tp_is_empty!1357 () Bool)

(assert (=> b!30383 (= e!19490 tp_is_empty!1357)))

(declare-fun b!30384 () Bool)

(assert (=> b!30384 (= e!19489 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!109 0))(
  ( (MissingZero!109 (index!2558 (_ BitVec 32))) (Found!109 (index!2559 (_ BitVec 32))) (Intermediate!109 (undefined!921 Bool) (index!2560 (_ BitVec 32)) (x!6539 (_ BitVec 32))) (Undefined!109) (MissingVacant!109 (index!2561 (_ BitVec 32))) )
))
(declare-fun lt!11416 () SeekEntryResult!109)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1917 (_ BitVec 32)) SeekEntryResult!109)

(assert (=> b!30384 (= lt!11416 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30385 () Bool)

(declare-fun res!18308 () Bool)

(assert (=> b!30385 (=> (not res!18308) (not e!19489))))

(declare-fun arrayContainsKey!0 (array!1917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30385 (= res!18308 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30386 () Bool)

(declare-fun res!18309 () Bool)

(assert (=> b!30386 (=> (not res!18309) (not e!19489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30386 (= res!18309 (validKeyInArray!0 k0!1304))))

(declare-fun b!30387 () Bool)

(declare-fun res!18310 () Bool)

(assert (=> b!30387 (=> (not res!18310) (not e!19489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1917 (_ BitVec 32)) Bool)

(assert (=> b!30387 (= res!18310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18307 () Bool)

(assert (=> start!4088 (=> (not res!18307) (not e!19489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4088 (= res!18307 (validMask!0 mask!2294))))

(assert (=> start!4088 e!19489))

(assert (=> start!4088 true))

(assert (=> start!4088 tp!4429))

(declare-fun array_inv!637 (array!1915) Bool)

(assert (=> start!4088 (and (array_inv!637 _values!1501) e!19488)))

(declare-fun array_inv!638 (array!1917) Bool)

(assert (=> start!4088 (array_inv!638 _keys!1833)))

(assert (=> start!4088 tp_is_empty!1357))

(declare-fun b!30388 () Bool)

(assert (=> b!30388 (= e!19492 tp_is_empty!1357)))

(declare-fun mapIsEmpty!1564 () Bool)

(assert (=> mapIsEmpty!1564 mapRes!1564))

(declare-fun b!30389 () Bool)

(declare-fun res!18311 () Bool)

(assert (=> b!30389 (=> (not res!18311) (not e!19489))))

(declare-datatypes ((List!754 0))(
  ( (Nil!751) (Cons!750 (h!1317 (_ BitVec 64)) (t!3440 List!754)) )
))
(declare-fun arrayNoDuplicates!0 (array!1917 (_ BitVec 32) List!754) Bool)

(assert (=> b!30389 (= res!18311 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!751))))

(declare-fun b!30390 () Bool)

(declare-fun res!18313 () Bool)

(assert (=> b!30390 (=> (not res!18313) (not e!19489))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1635)

(declare-fun minValue!1443 () V!1635)

(declare-datatypes ((tuple2!1172 0))(
  ( (tuple2!1173 (_1!597 (_ BitVec 64)) (_2!597 V!1635)) )
))
(declare-datatypes ((List!755 0))(
  ( (Nil!752) (Cons!751 (h!1318 tuple2!1172) (t!3441 List!755)) )
))
(declare-datatypes ((ListLongMap!737 0))(
  ( (ListLongMap!738 (toList!384 List!755)) )
))
(declare-fun contains!325 (ListLongMap!737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!208 (array!1917 array!1915 (_ BitVec 32) (_ BitVec 32) V!1635 V!1635 (_ BitVec 32) Int) ListLongMap!737)

(assert (=> b!30390 (= res!18313 (not (contains!325 (getCurrentListMap!208 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!4088 res!18307) b!30381))

(assert (= (and b!30381 res!18312) b!30387))

(assert (= (and b!30387 res!18310) b!30389))

(assert (= (and b!30389 res!18311) b!30386))

(assert (= (and b!30386 res!18309) b!30390))

(assert (= (and b!30390 res!18313) b!30385))

(assert (= (and b!30385 res!18308) b!30384))

(assert (= (and b!30382 condMapEmpty!1564) mapIsEmpty!1564))

(assert (= (and b!30382 (not condMapEmpty!1564)) mapNonEmpty!1564))

(get-info :version)

(assert (= (and mapNonEmpty!1564 ((_ is ValueCellFull!479) mapValue!1564)) b!30388))

(assert (= (and b!30382 ((_ is ValueCellFull!479) mapDefault!1564)) b!30383))

(assert (= start!4088 b!30382))

(declare-fun m!24381 () Bool)

(assert (=> mapNonEmpty!1564 m!24381))

(declare-fun m!24383 () Bool)

(assert (=> b!30389 m!24383))

(declare-fun m!24385 () Bool)

(assert (=> start!4088 m!24385))

(declare-fun m!24387 () Bool)

(assert (=> start!4088 m!24387))

(declare-fun m!24389 () Bool)

(assert (=> start!4088 m!24389))

(declare-fun m!24391 () Bool)

(assert (=> b!30386 m!24391))

(declare-fun m!24393 () Bool)

(assert (=> b!30390 m!24393))

(assert (=> b!30390 m!24393))

(declare-fun m!24395 () Bool)

(assert (=> b!30390 m!24395))

(declare-fun m!24397 () Bool)

(assert (=> b!30384 m!24397))

(declare-fun m!24399 () Bool)

(assert (=> b!30387 m!24399))

(declare-fun m!24401 () Bool)

(assert (=> b!30385 m!24401))

(check-sat (not b!30384) (not b!30385) (not mapNonEmpty!1564) (not b!30390) (not start!4088) (not b_next!1003) (not b!30386) b_and!1807 (not b!30387) (not b!30389) tp_is_empty!1357)
(check-sat b_and!1807 (not b_next!1003))
