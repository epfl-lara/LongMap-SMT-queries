; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4190 () Bool)

(assert start!4190)

(declare-fun b_free!1099 () Bool)

(declare-fun b_next!1099 () Bool)

(assert (=> start!4190 (= b_free!1099 (not b_next!1099))))

(declare-fun tp!4716 () Bool)

(declare-fun b_and!1899 () Bool)

(assert (=> start!4190 (= tp!4716 b_and!1899)))

(declare-fun mapIsEmpty!1708 () Bool)

(declare-fun mapRes!1708 () Bool)

(assert (=> mapIsEmpty!1708 mapRes!1708))

(declare-fun b!31785 () Bool)

(declare-fun res!19293 () Bool)

(declare-fun e!20256 () Bool)

(assert (=> b!31785 (=> (not res!19293) (not e!20256))))

(declare-datatypes ((array!2105 0))(
  ( (array!2106 (arr!1006 (Array (_ BitVec 32) (_ BitVec 64))) (size!1107 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2105)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31785 (= res!19293 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31786 () Bool)

(declare-fun res!19291 () Bool)

(assert (=> b!31786 (=> (not res!19291) (not e!20256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31786 (= res!19291 (validKeyInArray!0 k0!1304))))

(declare-fun b!31787 () Bool)

(declare-fun res!19295 () Bool)

(assert (=> b!31787 (=> (not res!19295) (not e!20256))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2105 (_ BitVec 32)) Bool)

(assert (=> b!31787 (= res!19295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31788 () Bool)

(declare-fun e!20254 () Bool)

(declare-fun e!20253 () Bool)

(assert (=> b!31788 (= e!20254 (and e!20253 mapRes!1708))))

(declare-fun condMapEmpty!1708 () Bool)

(declare-datatypes ((V!1763 0))(
  ( (V!1764 (val!753 Int)) )
))
(declare-datatypes ((ValueCell!527 0))(
  ( (ValueCellFull!527 (v!1842 V!1763)) (EmptyCell!527) )
))
(declare-datatypes ((array!2107 0))(
  ( (array!2108 (arr!1007 (Array (_ BitVec 32) ValueCell!527)) (size!1108 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2107)

(declare-fun mapDefault!1708 () ValueCell!527)

(assert (=> b!31788 (= condMapEmpty!1708 (= (arr!1007 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!527)) mapDefault!1708)))))

(declare-fun b!31789 () Bool)

(declare-fun res!19289 () Bool)

(assert (=> b!31789 (=> (not res!19289) (not e!20256))))

(declare-datatypes ((List!815 0))(
  ( (Nil!812) (Cons!811 (h!1378 (_ BitVec 64)) (t!3502 List!815)) )
))
(declare-fun arrayNoDuplicates!0 (array!2105 (_ BitVec 32) List!815) Bool)

(assert (=> b!31789 (= res!19289 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!812))))

(declare-fun mapNonEmpty!1708 () Bool)

(declare-fun tp!4717 () Bool)

(declare-fun e!20257 () Bool)

(assert (=> mapNonEmpty!1708 (= mapRes!1708 (and tp!4717 e!20257))))

(declare-fun mapValue!1708 () ValueCell!527)

(declare-fun mapKey!1708 () (_ BitVec 32))

(declare-fun mapRest!1708 () (Array (_ BitVec 32) ValueCell!527))

(assert (=> mapNonEmpty!1708 (= (arr!1007 _values!1501) (store mapRest!1708 mapKey!1708 mapValue!1708))))

(declare-fun b!31791 () Bool)

(declare-fun tp_is_empty!1453 () Bool)

(assert (=> b!31791 (= e!20253 tp_is_empty!1453)))

(declare-fun b!31792 () Bool)

(assert (=> b!31792 (= e!20256 false)))

(declare-fun lt!11565 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2105 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31792 (= lt!11565 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31793 () Bool)

(declare-fun res!19292 () Bool)

(assert (=> b!31793 (=> (not res!19292) (not e!20256))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31793 (= res!19292 (and (= (size!1108 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1107 _keys!1833) (size!1108 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31794 () Bool)

(assert (=> b!31794 (= e!20257 tp_is_empty!1453)))

(declare-fun res!19290 () Bool)

(assert (=> start!4190 (=> (not res!19290) (not e!20256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4190 (= res!19290 (validMask!0 mask!2294))))

(assert (=> start!4190 e!20256))

(assert (=> start!4190 true))

(assert (=> start!4190 tp!4716))

(declare-fun array_inv!689 (array!2107) Bool)

(assert (=> start!4190 (and (array_inv!689 _values!1501) e!20254)))

(declare-fun array_inv!690 (array!2105) Bool)

(assert (=> start!4190 (array_inv!690 _keys!1833)))

(assert (=> start!4190 tp_is_empty!1453))

(declare-fun b!31790 () Bool)

(declare-fun res!19294 () Bool)

(assert (=> b!31790 (=> (not res!19294) (not e!20256))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1763)

(declare-fun minValue!1443 () V!1763)

(declare-datatypes ((tuple2!1220 0))(
  ( (tuple2!1221 (_1!621 (_ BitVec 64)) (_2!621 V!1763)) )
))
(declare-datatypes ((List!816 0))(
  ( (Nil!813) (Cons!812 (h!1379 tuple2!1220) (t!3503 List!816)) )
))
(declare-datatypes ((ListLongMap!791 0))(
  ( (ListLongMap!792 (toList!411 List!816)) )
))
(declare-fun contains!353 (ListLongMap!791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!236 (array!2105 array!2107 (_ BitVec 32) (_ BitVec 32) V!1763 V!1763 (_ BitVec 32) Int) ListLongMap!791)

(assert (=> b!31790 (= res!19294 (not (contains!353 (getCurrentListMap!236 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!4190 res!19290) b!31793))

(assert (= (and b!31793 res!19292) b!31787))

(assert (= (and b!31787 res!19295) b!31789))

(assert (= (and b!31789 res!19289) b!31786))

(assert (= (and b!31786 res!19291) b!31790))

(assert (= (and b!31790 res!19294) b!31785))

(assert (= (and b!31785 res!19293) b!31792))

(assert (= (and b!31788 condMapEmpty!1708) mapIsEmpty!1708))

(assert (= (and b!31788 (not condMapEmpty!1708)) mapNonEmpty!1708))

(get-info :version)

(assert (= (and mapNonEmpty!1708 ((_ is ValueCellFull!527) mapValue!1708)) b!31794))

(assert (= (and b!31788 ((_ is ValueCellFull!527) mapDefault!1708)) b!31791))

(assert (= start!4190 b!31788))

(declare-fun m!25373 () Bool)

(assert (=> b!31792 m!25373))

(declare-fun m!25375 () Bool)

(assert (=> b!31787 m!25375))

(declare-fun m!25377 () Bool)

(assert (=> mapNonEmpty!1708 m!25377))

(declare-fun m!25379 () Bool)

(assert (=> start!4190 m!25379))

(declare-fun m!25381 () Bool)

(assert (=> start!4190 m!25381))

(declare-fun m!25383 () Bool)

(assert (=> start!4190 m!25383))

(declare-fun m!25385 () Bool)

(assert (=> b!31789 m!25385))

(declare-fun m!25387 () Bool)

(assert (=> b!31790 m!25387))

(assert (=> b!31790 m!25387))

(declare-fun m!25389 () Bool)

(assert (=> b!31790 m!25389))

(declare-fun m!25391 () Bool)

(assert (=> b!31785 m!25391))

(declare-fun m!25393 () Bool)

(assert (=> b!31786 m!25393))

(check-sat (not b!31792) tp_is_empty!1453 (not b!31790) (not b_next!1099) (not b!31789) (not b!31787) (not b!31785) b_and!1899 (not mapNonEmpty!1708) (not b!31786) (not start!4190))
(check-sat b_and!1899 (not b_next!1099))
