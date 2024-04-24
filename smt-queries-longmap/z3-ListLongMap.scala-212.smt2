; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3950 () Bool)

(assert start!3950)

(declare-fun b_free!859 () Bool)

(declare-fun b_next!859 () Bool)

(assert (=> start!3950 (= b_free!859 (not b_next!859))))

(declare-fun tp!3996 () Bool)

(declare-fun b_and!1659 () Bool)

(assert (=> start!3950 (= tp!3996 b_and!1659)))

(declare-fun b!28194 () Bool)

(declare-fun res!16784 () Bool)

(declare-fun e!18241 () Bool)

(assert (=> b!28194 (=> (not res!16784) (not e!18241))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28194 (= res!16784 (validKeyInArray!0 k0!1304))))

(declare-fun b!28195 () Bool)

(declare-fun res!16782 () Bool)

(assert (=> b!28195 (=> (not res!16782) (not e!18241))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1443 0))(
  ( (V!1444 (val!633 Int)) )
))
(declare-datatypes ((ValueCell!407 0))(
  ( (ValueCellFull!407 (v!1722 V!1443)) (EmptyCell!407) )
))
(declare-datatypes ((array!1643 0))(
  ( (array!1644 (arr!775 (Array (_ BitVec 32) ValueCell!407)) (size!876 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1643)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1645 0))(
  ( (array!1646 (arr!776 (Array (_ BitVec 32) (_ BitVec 64))) (size!877 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1645)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1443)

(declare-fun minValue!1443 () V!1443)

(declare-datatypes ((tuple2!1050 0))(
  ( (tuple2!1051 (_1!536 (_ BitVec 64)) (_2!536 V!1443)) )
))
(declare-datatypes ((List!645 0))(
  ( (Nil!642) (Cons!641 (h!1208 tuple2!1050) (t!3332 List!645)) )
))
(declare-datatypes ((ListLongMap!621 0))(
  ( (ListLongMap!622 (toList!326 List!645)) )
))
(declare-fun contains!268 (ListLongMap!621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!156 (array!1645 array!1643 (_ BitVec 32) (_ BitVec 32) V!1443 V!1443 (_ BitVec 32) Int) ListLongMap!621)

(assert (=> b!28195 (= res!16782 (not (contains!268 (getCurrentListMap!156 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!28196 () Bool)

(assert (=> b!28196 (= e!18241 false)))

(declare-fun lt!10719 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1645 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28196 (= lt!10719 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16781 () Bool)

(assert (=> start!3950 (=> (not res!16781) (not e!18241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3950 (= res!16781 (validMask!0 mask!2294))))

(assert (=> start!3950 e!18241))

(assert (=> start!3950 true))

(assert (=> start!3950 tp!3996))

(declare-fun e!18238 () Bool)

(declare-fun array_inv!537 (array!1643) Bool)

(assert (=> start!3950 (and (array_inv!537 _values!1501) e!18238)))

(declare-fun array_inv!538 (array!1645) Bool)

(assert (=> start!3950 (array_inv!538 _keys!1833)))

(declare-fun tp_is_empty!1213 () Bool)

(assert (=> start!3950 tp_is_empty!1213))

(declare-fun b!28197 () Bool)

(declare-fun e!18237 () Bool)

(declare-fun mapRes!1348 () Bool)

(assert (=> b!28197 (= e!18238 (and e!18237 mapRes!1348))))

(declare-fun condMapEmpty!1348 () Bool)

(declare-fun mapDefault!1348 () ValueCell!407)

(assert (=> b!28197 (= condMapEmpty!1348 (= (arr!775 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!407)) mapDefault!1348)))))

(declare-fun b!28198 () Bool)

(declare-fun res!16779 () Bool)

(assert (=> b!28198 (=> (not res!16779) (not e!18241))))

(assert (=> b!28198 (= res!16779 (and (= (size!876 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!877 _keys!1833) (size!876 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1348 () Bool)

(assert (=> mapIsEmpty!1348 mapRes!1348))

(declare-fun b!28199 () Bool)

(declare-fun res!16780 () Bool)

(assert (=> b!28199 (=> (not res!16780) (not e!18241))))

(declare-datatypes ((List!646 0))(
  ( (Nil!643) (Cons!642 (h!1209 (_ BitVec 64)) (t!3333 List!646)) )
))
(declare-fun arrayNoDuplicates!0 (array!1645 (_ BitVec 32) List!646) Bool)

(assert (=> b!28199 (= res!16780 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!643))))

(declare-fun b!28200 () Bool)

(assert (=> b!28200 (= e!18237 tp_is_empty!1213)))

(declare-fun b!28201 () Bool)

(declare-fun res!16783 () Bool)

(assert (=> b!28201 (=> (not res!16783) (not e!18241))))

(declare-fun arrayContainsKey!0 (array!1645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28201 (= res!16783 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28202 () Bool)

(declare-fun e!18240 () Bool)

(assert (=> b!28202 (= e!18240 tp_is_empty!1213)))

(declare-fun mapNonEmpty!1348 () Bool)

(declare-fun tp!3997 () Bool)

(assert (=> mapNonEmpty!1348 (= mapRes!1348 (and tp!3997 e!18240))))

(declare-fun mapRest!1348 () (Array (_ BitVec 32) ValueCell!407))

(declare-fun mapValue!1348 () ValueCell!407)

(declare-fun mapKey!1348 () (_ BitVec 32))

(assert (=> mapNonEmpty!1348 (= (arr!775 _values!1501) (store mapRest!1348 mapKey!1348 mapValue!1348))))

(declare-fun b!28203 () Bool)

(declare-fun res!16778 () Bool)

(assert (=> b!28203 (=> (not res!16778) (not e!18241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1645 (_ BitVec 32)) Bool)

(assert (=> b!28203 (= res!16778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3950 res!16781) b!28198))

(assert (= (and b!28198 res!16779) b!28203))

(assert (= (and b!28203 res!16778) b!28199))

(assert (= (and b!28199 res!16780) b!28194))

(assert (= (and b!28194 res!16784) b!28195))

(assert (= (and b!28195 res!16782) b!28201))

(assert (= (and b!28201 res!16783) b!28196))

(assert (= (and b!28197 condMapEmpty!1348) mapIsEmpty!1348))

(assert (= (and b!28197 (not condMapEmpty!1348)) mapNonEmpty!1348))

(get-info :version)

(assert (= (and mapNonEmpty!1348 ((_ is ValueCellFull!407) mapValue!1348)) b!28202))

(assert (= (and b!28197 ((_ is ValueCellFull!407) mapDefault!1348)) b!28200))

(assert (= start!3950 b!28197))

(declare-fun m!22349 () Bool)

(assert (=> b!28203 m!22349))

(declare-fun m!22351 () Bool)

(assert (=> b!28195 m!22351))

(assert (=> b!28195 m!22351))

(declare-fun m!22353 () Bool)

(assert (=> b!28195 m!22353))

(declare-fun m!22355 () Bool)

(assert (=> mapNonEmpty!1348 m!22355))

(declare-fun m!22357 () Bool)

(assert (=> b!28194 m!22357))

(declare-fun m!22359 () Bool)

(assert (=> start!3950 m!22359))

(declare-fun m!22361 () Bool)

(assert (=> start!3950 m!22361))

(declare-fun m!22363 () Bool)

(assert (=> start!3950 m!22363))

(declare-fun m!22365 () Bool)

(assert (=> b!28199 m!22365))

(declare-fun m!22367 () Bool)

(assert (=> b!28201 m!22367))

(declare-fun m!22369 () Bool)

(assert (=> b!28196 m!22369))

(check-sat (not b!28194) (not b!28195) b_and!1659 (not b_next!859) (not b!28203) (not b!28196) (not b!28199) tp_is_empty!1213 (not start!3950) (not b!28201) (not mapNonEmpty!1348))
(check-sat b_and!1659 (not b_next!859))
