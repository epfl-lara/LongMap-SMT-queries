; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4088 () Bool)

(assert start!4088)

(declare-fun b_free!993 () Bool)

(declare-fun b_next!993 () Bool)

(assert (=> start!4088 (= b_free!993 (not b_next!993))))

(declare-fun tp!4398 () Bool)

(declare-fun b_and!1803 () Bool)

(assert (=> start!4088 (= tp!4398 b_and!1803)))

(declare-fun b!30285 () Bool)

(declare-fun e!19457 () Bool)

(assert (=> b!30285 (= e!19457 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!100 0))(
  ( (MissingZero!100 (index!2522 (_ BitVec 32))) (Found!100 (index!2523 (_ BitVec 32))) (Intermediate!100 (undefined!912 Bool) (index!2524 (_ BitVec 32)) (x!6514 (_ BitVec 32))) (Undefined!100) (MissingVacant!100 (index!2525 (_ BitVec 32))) )
))
(declare-fun lt!11405 () SeekEntryResult!100)

(declare-datatypes ((array!1923 0))(
  ( (array!1924 (arr!915 (Array (_ BitVec 32) (_ BitVec 64))) (size!1016 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1923)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1923 (_ BitVec 32)) SeekEntryResult!100)

(assert (=> b!30285 (= lt!11405 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30286 () Bool)

(declare-fun e!19460 () Bool)

(declare-fun e!19456 () Bool)

(declare-fun mapRes!1549 () Bool)

(assert (=> b!30286 (= e!19460 (and e!19456 mapRes!1549))))

(declare-fun condMapEmpty!1549 () Bool)

(declare-datatypes ((V!1621 0))(
  ( (V!1622 (val!700 Int)) )
))
(declare-datatypes ((ValueCell!474 0))(
  ( (ValueCellFull!474 (v!1789 V!1621)) (EmptyCell!474) )
))
(declare-datatypes ((array!1925 0))(
  ( (array!1926 (arr!916 (Array (_ BitVec 32) ValueCell!474)) (size!1017 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1925)

(declare-fun mapDefault!1549 () ValueCell!474)

(assert (=> b!30286 (= condMapEmpty!1549 (= (arr!916 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!474)) mapDefault!1549)))))

(declare-fun b!30287 () Bool)

(declare-fun res!18234 () Bool)

(assert (=> b!30287 (=> (not res!18234) (not e!19457))))

(declare-datatypes ((List!752 0))(
  ( (Nil!749) (Cons!748 (h!1315 (_ BitVec 64)) (t!3445 List!752)) )
))
(declare-fun arrayNoDuplicates!0 (array!1923 (_ BitVec 32) List!752) Bool)

(assert (=> b!30287 (= res!18234 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!749))))

(declare-fun b!30288 () Bool)

(declare-fun res!18240 () Bool)

(assert (=> b!30288 (=> (not res!18240) (not e!19457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1923 (_ BitVec 32)) Bool)

(assert (=> b!30288 (= res!18240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1549 () Bool)

(declare-fun tp!4399 () Bool)

(declare-fun e!19458 () Bool)

(assert (=> mapNonEmpty!1549 (= mapRes!1549 (and tp!4399 e!19458))))

(declare-fun mapKey!1549 () (_ BitVec 32))

(declare-fun mapRest!1549 () (Array (_ BitVec 32) ValueCell!474))

(declare-fun mapValue!1549 () ValueCell!474)

(assert (=> mapNonEmpty!1549 (= (arr!916 _values!1501) (store mapRest!1549 mapKey!1549 mapValue!1549))))

(declare-fun res!18237 () Bool)

(assert (=> start!4088 (=> (not res!18237) (not e!19457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4088 (= res!18237 (validMask!0 mask!2294))))

(assert (=> start!4088 e!19457))

(assert (=> start!4088 true))

(assert (=> start!4088 tp!4398))

(declare-fun array_inv!639 (array!1925) Bool)

(assert (=> start!4088 (and (array_inv!639 _values!1501) e!19460)))

(declare-fun array_inv!640 (array!1923) Bool)

(assert (=> start!4088 (array_inv!640 _keys!1833)))

(declare-fun tp_is_empty!1347 () Bool)

(assert (=> start!4088 tp_is_empty!1347))

(declare-fun b!30289 () Bool)

(declare-fun res!18239 () Bool)

(assert (=> b!30289 (=> (not res!18239) (not e!19457))))

(declare-fun arrayContainsKey!0 (array!1923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30289 (= res!18239 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30290 () Bool)

(assert (=> b!30290 (= e!19458 tp_is_empty!1347)))

(declare-fun b!30291 () Bool)

(declare-fun res!18238 () Bool)

(assert (=> b!30291 (=> (not res!18238) (not e!19457))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30291 (= res!18238 (and (= (size!1017 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1016 _keys!1833) (size!1017 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30292 () Bool)

(declare-fun res!18236 () Bool)

(assert (=> b!30292 (=> (not res!18236) (not e!19457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30292 (= res!18236 (validKeyInArray!0 k0!1304))))

(declare-fun b!30293 () Bool)

(declare-fun res!18235 () Bool)

(assert (=> b!30293 (=> (not res!18235) (not e!19457))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1621)

(declare-fun minValue!1443 () V!1621)

(declare-datatypes ((tuple2!1158 0))(
  ( (tuple2!1159 (_1!590 (_ BitVec 64)) (_2!590 V!1621)) )
))
(declare-datatypes ((List!753 0))(
  ( (Nil!750) (Cons!749 (h!1316 tuple2!1158) (t!3446 List!753)) )
))
(declare-datatypes ((ListLongMap!735 0))(
  ( (ListLongMap!736 (toList!383 List!753)) )
))
(declare-fun contains!323 (ListLongMap!735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!211 (array!1923 array!1925 (_ BitVec 32) (_ BitVec 32) V!1621 V!1621 (_ BitVec 32) Int) ListLongMap!735)

(assert (=> b!30293 (= res!18235 (not (contains!323 (getCurrentListMap!211 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30294 () Bool)

(assert (=> b!30294 (= e!19456 tp_is_empty!1347)))

(declare-fun mapIsEmpty!1549 () Bool)

(assert (=> mapIsEmpty!1549 mapRes!1549))

(assert (= (and start!4088 res!18237) b!30291))

(assert (= (and b!30291 res!18238) b!30288))

(assert (= (and b!30288 res!18240) b!30287))

(assert (= (and b!30287 res!18234) b!30292))

(assert (= (and b!30292 res!18236) b!30293))

(assert (= (and b!30293 res!18235) b!30289))

(assert (= (and b!30289 res!18239) b!30285))

(assert (= (and b!30286 condMapEmpty!1549) mapIsEmpty!1549))

(assert (= (and b!30286 (not condMapEmpty!1549)) mapNonEmpty!1549))

(get-info :version)

(assert (= (and mapNonEmpty!1549 ((_ is ValueCellFull!474) mapValue!1549)) b!30290))

(assert (= (and b!30286 ((_ is ValueCellFull!474) mapDefault!1549)) b!30294))

(assert (= start!4088 b!30286))

(declare-fun m!24341 () Bool)

(assert (=> b!30288 m!24341))

(declare-fun m!24343 () Bool)

(assert (=> b!30285 m!24343))

(declare-fun m!24345 () Bool)

(assert (=> b!30293 m!24345))

(assert (=> b!30293 m!24345))

(declare-fun m!24347 () Bool)

(assert (=> b!30293 m!24347))

(declare-fun m!24349 () Bool)

(assert (=> start!4088 m!24349))

(declare-fun m!24351 () Bool)

(assert (=> start!4088 m!24351))

(declare-fun m!24353 () Bool)

(assert (=> start!4088 m!24353))

(declare-fun m!24355 () Bool)

(assert (=> b!30287 m!24355))

(declare-fun m!24357 () Bool)

(assert (=> mapNonEmpty!1549 m!24357))

(declare-fun m!24359 () Bool)

(assert (=> b!30292 m!24359))

(declare-fun m!24361 () Bool)

(assert (=> b!30289 m!24361))

(check-sat (not b!30289) (not start!4088) (not b!30292) b_and!1803 (not mapNonEmpty!1549) (not b_next!993) (not b!30287) (not b!30285) (not b!30288) tp_is_empty!1347 (not b!30293))
(check-sat b_and!1803 (not b_next!993))
