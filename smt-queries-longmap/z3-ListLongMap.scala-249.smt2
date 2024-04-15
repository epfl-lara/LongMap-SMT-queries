; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4166 () Bool)

(assert start!4166)

(declare-fun b_free!1081 () Bool)

(declare-fun b_next!1081 () Bool)

(assert (=> start!4166 (= b_free!1081 (not b_next!1081))))

(declare-fun tp!4663 () Bool)

(declare-fun b_and!1885 () Bool)

(assert (=> start!4166 (= tp!4663 b_and!1885)))

(declare-fun b!31533 () Bool)

(declare-fun res!19113 () Bool)

(declare-fun e!20131 () Bool)

(assert (=> b!31533 (=> (not res!19113) (not e!20131))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1739 0))(
  ( (V!1740 (val!744 Int)) )
))
(declare-datatypes ((ValueCell!518 0))(
  ( (ValueCellFull!518 (v!1832 V!1739)) (EmptyCell!518) )
))
(declare-datatypes ((array!2061 0))(
  ( (array!2062 (arr!984 (Array (_ BitVec 32) ValueCell!518)) (size!1085 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2061)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2063 0))(
  ( (array!2064 (arr!985 (Array (_ BitVec 32) (_ BitVec 64))) (size!1086 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2063)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1739)

(declare-fun minValue!1443 () V!1739)

(declare-datatypes ((tuple2!1218 0))(
  ( (tuple2!1219 (_1!620 (_ BitVec 64)) (_2!620 V!1739)) )
))
(declare-datatypes ((List!801 0))(
  ( (Nil!798) (Cons!797 (h!1364 tuple2!1218) (t!3487 List!801)) )
))
(declare-datatypes ((ListLongMap!783 0))(
  ( (ListLongMap!784 (toList!407 List!801)) )
))
(declare-fun contains!348 (ListLongMap!783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!230 (array!2063 array!2061 (_ BitVec 32) (_ BitVec 32) V!1739 V!1739 (_ BitVec 32) Int) ListLongMap!783)

(assert (=> b!31533 (= res!19113 (not (contains!348 (getCurrentListMap!230 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31534 () Bool)

(declare-fun res!19108 () Bool)

(assert (=> b!31534 (=> (not res!19108) (not e!20131))))

(declare-datatypes ((List!802 0))(
  ( (Nil!799) (Cons!798 (h!1365 (_ BitVec 64)) (t!3488 List!802)) )
))
(declare-fun arrayNoDuplicates!0 (array!2063 (_ BitVec 32) List!802) Bool)

(assert (=> b!31534 (= res!19108 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!799))))

(declare-fun b!31535 () Bool)

(declare-fun res!19111 () Bool)

(assert (=> b!31535 (=> (not res!19111) (not e!20131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2063 (_ BitVec 32)) Bool)

(assert (=> b!31535 (= res!19111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31536 () Bool)

(declare-fun res!19112 () Bool)

(assert (=> b!31536 (=> (not res!19112) (not e!20131))))

(declare-fun arrayContainsKey!0 (array!2063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31536 (= res!19112 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1681 () Bool)

(declare-fun mapRes!1681 () Bool)

(declare-fun tp!4662 () Bool)

(declare-fun e!20127 () Bool)

(assert (=> mapNonEmpty!1681 (= mapRes!1681 (and tp!4662 e!20127))))

(declare-fun mapValue!1681 () ValueCell!518)

(declare-fun mapRest!1681 () (Array (_ BitVec 32) ValueCell!518))

(declare-fun mapKey!1681 () (_ BitVec 32))

(assert (=> mapNonEmpty!1681 (= (arr!984 _values!1501) (store mapRest!1681 mapKey!1681 mapValue!1681))))

(declare-fun b!31537 () Bool)

(declare-fun e!20129 () Bool)

(declare-fun tp_is_empty!1435 () Bool)

(assert (=> b!31537 (= e!20129 tp_is_empty!1435)))

(declare-fun b!31538 () Bool)

(declare-fun res!19110 () Bool)

(assert (=> b!31538 (=> (not res!19110) (not e!20131))))

(assert (=> b!31538 (= res!19110 (and (= (size!1085 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1086 _keys!1833) (size!1085 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19114 () Bool)

(assert (=> start!4166 (=> (not res!19114) (not e!20131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4166 (= res!19114 (validMask!0 mask!2294))))

(assert (=> start!4166 e!20131))

(assert (=> start!4166 true))

(assert (=> start!4166 tp!4663))

(declare-fun e!20128 () Bool)

(declare-fun array_inv!693 (array!2061) Bool)

(assert (=> start!4166 (and (array_inv!693 _values!1501) e!20128)))

(declare-fun array_inv!694 (array!2063) Bool)

(assert (=> start!4166 (array_inv!694 _keys!1833)))

(assert (=> start!4166 tp_is_empty!1435))

(declare-fun b!31539 () Bool)

(declare-fun res!19109 () Bool)

(assert (=> b!31539 (=> (not res!19109) (not e!20131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31539 (= res!19109 (validKeyInArray!0 k0!1304))))

(declare-fun b!31540 () Bool)

(assert (=> b!31540 (= e!20131 false)))

(declare-fun lt!11578 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2063 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31540 (= lt!11578 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1681 () Bool)

(assert (=> mapIsEmpty!1681 mapRes!1681))

(declare-fun b!31541 () Bool)

(assert (=> b!31541 (= e!20128 (and e!20129 mapRes!1681))))

(declare-fun condMapEmpty!1681 () Bool)

(declare-fun mapDefault!1681 () ValueCell!518)

(assert (=> b!31541 (= condMapEmpty!1681 (= (arr!984 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!518)) mapDefault!1681)))))

(declare-fun b!31542 () Bool)

(assert (=> b!31542 (= e!20127 tp_is_empty!1435)))

(assert (= (and start!4166 res!19114) b!31538))

(assert (= (and b!31538 res!19110) b!31535))

(assert (= (and b!31535 res!19111) b!31534))

(assert (= (and b!31534 res!19108) b!31539))

(assert (= (and b!31539 res!19109) b!31533))

(assert (= (and b!31533 res!19113) b!31536))

(assert (= (and b!31536 res!19112) b!31540))

(assert (= (and b!31541 condMapEmpty!1681) mapIsEmpty!1681))

(assert (= (and b!31541 (not condMapEmpty!1681)) mapNonEmpty!1681))

(get-info :version)

(assert (= (and mapNonEmpty!1681 ((_ is ValueCellFull!518) mapValue!1681)) b!31542))

(assert (= (and b!31541 ((_ is ValueCellFull!518) mapDefault!1681)) b!31537))

(assert (= start!4166 b!31541))

(declare-fun m!25257 () Bool)

(assert (=> b!31535 m!25257))

(declare-fun m!25259 () Bool)

(assert (=> b!31533 m!25259))

(assert (=> b!31533 m!25259))

(declare-fun m!25261 () Bool)

(assert (=> b!31533 m!25261))

(declare-fun m!25263 () Bool)

(assert (=> start!4166 m!25263))

(declare-fun m!25265 () Bool)

(assert (=> start!4166 m!25265))

(declare-fun m!25267 () Bool)

(assert (=> start!4166 m!25267))

(declare-fun m!25269 () Bool)

(assert (=> b!31536 m!25269))

(declare-fun m!25271 () Bool)

(assert (=> b!31534 m!25271))

(declare-fun m!25273 () Bool)

(assert (=> b!31539 m!25273))

(declare-fun m!25275 () Bool)

(assert (=> mapNonEmpty!1681 m!25275))

(declare-fun m!25277 () Bool)

(assert (=> b!31540 m!25277))

(check-sat (not b!31540) (not b!31534) (not start!4166) (not b!31539) tp_is_empty!1435 (not b!31533) (not mapNonEmpty!1681) (not b!31535) (not b_next!1081) (not b!31536) b_and!1885)
(check-sat b_and!1885 (not b_next!1081))
