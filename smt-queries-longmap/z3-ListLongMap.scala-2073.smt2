; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35608 () Bool)

(assert start!35608)

(declare-fun mapIsEmpty!13599 () Bool)

(declare-fun mapRes!13599 () Bool)

(assert (=> mapIsEmpty!13599 mapRes!13599))

(declare-fun b!357219 () Bool)

(declare-fun res!198352 () Bool)

(declare-fun e!218753 () Bool)

(assert (=> b!357219 (=> (not res!198352) (not e!218753))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19689 0))(
  ( (array!19690 (arr!9338 (Array (_ BitVec 32) (_ BitVec 64))) (size!9690 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19689)

(assert (=> b!357219 (= res!198352 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9690 _keys!1456))))))

(declare-fun b!357220 () Bool)

(declare-fun res!198354 () Bool)

(assert (=> b!357220 (=> (not res!198354) (not e!218753))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11725 0))(
  ( (V!11726 (val!4075 Int)) )
))
(declare-datatypes ((ValueCell!3687 0))(
  ( (ValueCellFull!3687 (v!6269 V!11725)) (EmptyCell!3687) )
))
(declare-datatypes ((array!19691 0))(
  ( (array!19692 (arr!9339 (Array (_ BitVec 32) ValueCell!3687)) (size!9691 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19691)

(assert (=> b!357220 (= res!198354 (and (= (size!9691 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9690 _keys!1456) (size!9691 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!198355 () Bool)

(assert (=> start!35608 (=> (not res!198355) (not e!218753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35608 (= res!198355 (validMask!0 mask!1842))))

(assert (=> start!35608 e!218753))

(declare-fun tp_is_empty!8061 () Bool)

(assert (=> start!35608 tp_is_empty!8061))

(assert (=> start!35608 true))

(declare-fun array_inv!6862 (array!19689) Bool)

(assert (=> start!35608 (array_inv!6862 _keys!1456)))

(declare-fun e!218755 () Bool)

(declare-fun array_inv!6863 (array!19691) Bool)

(assert (=> start!35608 (and (array_inv!6863 _values!1208) e!218755)))

(declare-fun b!357221 () Bool)

(declare-fun res!198348 () Bool)

(assert (=> b!357221 (=> (not res!198348) (not e!218753))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357221 (= res!198348 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357222 () Bool)

(declare-fun e!218752 () Bool)

(assert (=> b!357222 (= e!218755 (and e!218752 mapRes!13599))))

(declare-fun condMapEmpty!13599 () Bool)

(declare-fun mapDefault!13599 () ValueCell!3687)

(assert (=> b!357222 (= condMapEmpty!13599 (= (arr!9339 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3687)) mapDefault!13599)))))

(declare-fun b!357223 () Bool)

(declare-fun e!218756 () Bool)

(assert (=> b!357223 (= e!218756 tp_is_empty!8061)))

(declare-fun b!357224 () Bool)

(assert (=> b!357224 (= e!218753 (not true))))

(assert (=> b!357224 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11725)

(declare-datatypes ((Unit!11006 0))(
  ( (Unit!11007) )
))
(declare-fun lt!166007 () Unit!11006)

(declare-fun zeroValue!1150 () V!11725)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 (array!19689 array!19691 (_ BitVec 32) (_ BitVec 32) V!11725 V!11725 (_ BitVec 64) (_ BitVec 32)) Unit!11006)

(assert (=> b!357224 (= lt!166007 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357225 () Bool)

(declare-fun res!198350 () Bool)

(assert (=> b!357225 (=> (not res!198350) (not e!218753))))

(assert (=> b!357225 (= res!198350 (not (= (select (arr!9338 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357226 () Bool)

(declare-fun res!198353 () Bool)

(assert (=> b!357226 (=> (not res!198353) (not e!218753))))

(declare-datatypes ((List!5387 0))(
  ( (Nil!5384) (Cons!5383 (h!6239 (_ BitVec 64)) (t!10537 List!5387)) )
))
(declare-fun arrayNoDuplicates!0 (array!19689 (_ BitVec 32) List!5387) Bool)

(assert (=> b!357226 (= res!198353 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5384))))

(declare-fun mapNonEmpty!13599 () Bool)

(declare-fun tp!27576 () Bool)

(assert (=> mapNonEmpty!13599 (= mapRes!13599 (and tp!27576 e!218756))))

(declare-fun mapKey!13599 () (_ BitVec 32))

(declare-fun mapValue!13599 () ValueCell!3687)

(declare-fun mapRest!13599 () (Array (_ BitVec 32) ValueCell!3687))

(assert (=> mapNonEmpty!13599 (= (arr!9339 _values!1208) (store mapRest!13599 mapKey!13599 mapValue!13599))))

(declare-fun b!357227 () Bool)

(declare-fun res!198351 () Bool)

(assert (=> b!357227 (=> (not res!198351) (not e!218753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19689 (_ BitVec 32)) Bool)

(assert (=> b!357227 (= res!198351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357228 () Bool)

(declare-fun res!198349 () Bool)

(assert (=> b!357228 (=> (not res!198349) (not e!218753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357228 (= res!198349 (validKeyInArray!0 k0!1077))))

(declare-fun b!357229 () Bool)

(assert (=> b!357229 (= e!218752 tp_is_empty!8061)))

(assert (= (and start!35608 res!198355) b!357220))

(assert (= (and b!357220 res!198354) b!357227))

(assert (= (and b!357227 res!198351) b!357226))

(assert (= (and b!357226 res!198353) b!357228))

(assert (= (and b!357228 res!198349) b!357219))

(assert (= (and b!357219 res!198352) b!357221))

(assert (= (and b!357221 res!198348) b!357225))

(assert (= (and b!357225 res!198350) b!357224))

(assert (= (and b!357222 condMapEmpty!13599) mapIsEmpty!13599))

(assert (= (and b!357222 (not condMapEmpty!13599)) mapNonEmpty!13599))

(get-info :version)

(assert (= (and mapNonEmpty!13599 ((_ is ValueCellFull!3687) mapValue!13599)) b!357223))

(assert (= (and b!357222 ((_ is ValueCellFull!3687) mapDefault!13599)) b!357229))

(assert (= start!35608 b!357222))

(declare-fun m!355355 () Bool)

(assert (=> b!357227 m!355355))

(declare-fun m!355357 () Bool)

(assert (=> mapNonEmpty!13599 m!355357))

(declare-fun m!355359 () Bool)

(assert (=> b!357224 m!355359))

(declare-fun m!355361 () Bool)

(assert (=> b!357224 m!355361))

(declare-fun m!355363 () Bool)

(assert (=> start!35608 m!355363))

(declare-fun m!355365 () Bool)

(assert (=> start!35608 m!355365))

(declare-fun m!355367 () Bool)

(assert (=> start!35608 m!355367))

(declare-fun m!355369 () Bool)

(assert (=> b!357226 m!355369))

(declare-fun m!355371 () Bool)

(assert (=> b!357225 m!355371))

(declare-fun m!355373 () Bool)

(assert (=> b!357228 m!355373))

(declare-fun m!355375 () Bool)

(assert (=> b!357221 m!355375))

(check-sat (not b!357221) (not b!357227) (not b!357226) (not mapNonEmpty!13599) tp_is_empty!8061 (not start!35608) (not b!357228) (not b!357224))
(check-sat)
