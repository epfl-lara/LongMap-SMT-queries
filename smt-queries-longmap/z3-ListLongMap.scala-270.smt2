; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4436 () Bool)

(assert start!4436)

(declare-fun b_free!1207 () Bool)

(declare-fun b_next!1207 () Bool)

(assert (=> start!4436 (= b_free!1207 (not b_next!1207))))

(declare-fun tp!5058 () Bool)

(declare-fun b_and!2023 () Bool)

(assert (=> start!4436 (= tp!5058 b_and!2023)))

(declare-fun b!34267 () Bool)

(declare-fun e!21743 () Bool)

(declare-fun e!21745 () Bool)

(declare-fun mapRes!1888 () Bool)

(assert (=> b!34267 (= e!21743 (and e!21745 mapRes!1888))))

(declare-fun condMapEmpty!1888 () Bool)

(declare-datatypes ((V!1907 0))(
  ( (V!1908 (val!807 Int)) )
))
(declare-datatypes ((ValueCell!581 0))(
  ( (ValueCellFull!581 (v!1901 V!1907)) (EmptyCell!581) )
))
(declare-datatypes ((array!2311 0))(
  ( (array!2312 (arr!1103 (Array (_ BitVec 32) ValueCell!581)) (size!1204 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2311)

(declare-fun mapDefault!1888 () ValueCell!581)

(assert (=> b!34267 (= condMapEmpty!1888 (= (arr!1103 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!581)) mapDefault!1888)))))

(declare-fun res!20778 () Bool)

(declare-fun e!21746 () Bool)

(assert (=> start!4436 (=> (not res!20778) (not e!21746))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4436 (= res!20778 (validMask!0 mask!2294))))

(assert (=> start!4436 e!21746))

(assert (=> start!4436 true))

(assert (=> start!4436 tp!5058))

(declare-fun array_inv!783 (array!2311) Bool)

(assert (=> start!4436 (and (array_inv!783 _values!1501) e!21743)))

(declare-datatypes ((array!2313 0))(
  ( (array!2314 (arr!1104 (Array (_ BitVec 32) (_ BitVec 64))) (size!1205 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2313)

(declare-fun array_inv!784 (array!2313) Bool)

(assert (=> start!4436 (array_inv!784 _keys!1833)))

(declare-fun tp_is_empty!1561 () Bool)

(assert (=> start!4436 tp_is_empty!1561))

(declare-fun b!34268 () Bool)

(declare-fun res!20776 () Bool)

(assert (=> b!34268 (=> (not res!20776) (not e!21746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2313 (_ BitVec 32)) Bool)

(assert (=> b!34268 (= res!20776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34269 () Bool)

(declare-fun res!20777 () Bool)

(assert (=> b!34269 (=> (not res!20777) (not e!21746))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34269 (= res!20777 (and (= (size!1204 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1205 _keys!1833) (size!1204 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1888 () Bool)

(assert (=> mapIsEmpty!1888 mapRes!1888))

(declare-fun b!34270 () Bool)

(declare-fun res!20779 () Bool)

(assert (=> b!34270 (=> (not res!20779) (not e!21746))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1907)

(declare-fun minValue!1443 () V!1907)

(declare-datatypes ((tuple2!1310 0))(
  ( (tuple2!1311 (_1!666 (_ BitVec 64)) (_2!666 V!1907)) )
))
(declare-datatypes ((List!893 0))(
  ( (Nil!890) (Cons!889 (h!1456 tuple2!1310) (t!3591 List!893)) )
))
(declare-datatypes ((ListLongMap!875 0))(
  ( (ListLongMap!876 (toList!453 List!893)) )
))
(declare-fun contains!400 (ListLongMap!875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!272 (array!2313 array!2311 (_ BitVec 32) (_ BitVec 32) V!1907 V!1907 (_ BitVec 32) Int) ListLongMap!875)

(assert (=> b!34270 (= res!20779 (not (contains!400 (getCurrentListMap!272 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34271 () Bool)

(declare-fun res!20773 () Bool)

(assert (=> b!34271 (=> (not res!20773) (not e!21746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34271 (= res!20773 (validKeyInArray!0 k0!1304))))

(declare-fun b!34272 () Bool)

(declare-fun res!20775 () Bool)

(assert (=> b!34272 (=> (not res!20775) (not e!21746))))

(declare-datatypes ((List!894 0))(
  ( (Nil!891) (Cons!890 (h!1457 (_ BitVec 64)) (t!3592 List!894)) )
))
(declare-fun arrayNoDuplicates!0 (array!2313 (_ BitVec 32) List!894) Bool)

(assert (=> b!34272 (= res!20775 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!891))))

(declare-fun b!34273 () Bool)

(assert (=> b!34273 (= e!21745 tp_is_empty!1561)))

(declare-fun b!34274 () Bool)

(declare-fun e!21747 () Bool)

(assert (=> b!34274 (= e!21747 tp_is_empty!1561)))

(declare-fun b!34275 () Bool)

(assert (=> b!34275 (= e!21746 false)))

(declare-datatypes ((SeekEntryResult!147 0))(
  ( (MissingZero!147 (index!2710 (_ BitVec 32))) (Found!147 (index!2711 (_ BitVec 32))) (Intermediate!147 (undefined!959 Bool) (index!2712 (_ BitVec 32)) (x!6909 (_ BitVec 32))) (Undefined!147) (MissingVacant!147 (index!2713 (_ BitVec 32))) )
))
(declare-fun lt!12764 () SeekEntryResult!147)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2313 (_ BitVec 32)) SeekEntryResult!147)

(assert (=> b!34275 (= lt!12764 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1888 () Bool)

(declare-fun tp!5059 () Bool)

(assert (=> mapNonEmpty!1888 (= mapRes!1888 (and tp!5059 e!21747))))

(declare-fun mapKey!1888 () (_ BitVec 32))

(declare-fun mapRest!1888 () (Array (_ BitVec 32) ValueCell!581))

(declare-fun mapValue!1888 () ValueCell!581)

(assert (=> mapNonEmpty!1888 (= (arr!1103 _values!1501) (store mapRest!1888 mapKey!1888 mapValue!1888))))

(declare-fun b!34276 () Bool)

(declare-fun res!20774 () Bool)

(assert (=> b!34276 (=> (not res!20774) (not e!21746))))

(declare-fun arrayContainsKey!0 (array!2313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34276 (= res!20774 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4436 res!20778) b!34269))

(assert (= (and b!34269 res!20777) b!34268))

(assert (= (and b!34268 res!20776) b!34272))

(assert (= (and b!34272 res!20775) b!34271))

(assert (= (and b!34271 res!20773) b!34270))

(assert (= (and b!34270 res!20779) b!34276))

(assert (= (and b!34276 res!20774) b!34275))

(assert (= (and b!34267 condMapEmpty!1888) mapIsEmpty!1888))

(assert (= (and b!34267 (not condMapEmpty!1888)) mapNonEmpty!1888))

(get-info :version)

(assert (= (and mapNonEmpty!1888 ((_ is ValueCellFull!581) mapValue!1888)) b!34274))

(assert (= (and b!34267 ((_ is ValueCellFull!581) mapDefault!1888)) b!34273))

(assert (= start!4436 b!34267))

(declare-fun m!27611 () Bool)

(assert (=> b!34272 m!27611))

(declare-fun m!27613 () Bool)

(assert (=> b!34275 m!27613))

(declare-fun m!27615 () Bool)

(assert (=> b!34270 m!27615))

(assert (=> b!34270 m!27615))

(declare-fun m!27617 () Bool)

(assert (=> b!34270 m!27617))

(declare-fun m!27619 () Bool)

(assert (=> start!4436 m!27619))

(declare-fun m!27621 () Bool)

(assert (=> start!4436 m!27621))

(declare-fun m!27623 () Bool)

(assert (=> start!4436 m!27623))

(declare-fun m!27625 () Bool)

(assert (=> b!34268 m!27625))

(declare-fun m!27627 () Bool)

(assert (=> mapNonEmpty!1888 m!27627))

(declare-fun m!27629 () Bool)

(assert (=> b!34276 m!27629))

(declare-fun m!27631 () Bool)

(assert (=> b!34271 m!27631))

(check-sat (not b!34268) tp_is_empty!1561 (not b!34271) b_and!2023 (not b!34276) (not mapNonEmpty!1888) (not b_next!1207) (not b!34270) (not b!34272) (not start!4436) (not b!34275))
(check-sat b_and!2023 (not b_next!1207))
