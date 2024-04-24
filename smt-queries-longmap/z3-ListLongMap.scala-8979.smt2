; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108858 () Bool)

(assert start!108858)

(declare-fun b_free!28147 () Bool)

(declare-fun b_next!28147 () Bool)

(assert (=> start!108858 (= b_free!28147 (not b_next!28147))))

(declare-fun tp!99557 () Bool)

(declare-fun b_and!46215 () Bool)

(assert (=> start!108858 (= tp!99557 b_and!46215)))

(declare-fun res!852268 () Bool)

(declare-fun e!733511 () Bool)

(assert (=> start!108858 (=> (not res!852268) (not e!733511))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108858 (= res!852268 (validMask!0 mask!2175))))

(assert (=> start!108858 e!733511))

(declare-fun tp_is_empty!33787 () Bool)

(assert (=> start!108858 tp_is_empty!33787))

(assert (=> start!108858 true))

(declare-datatypes ((V!50153 0))(
  ( (V!50154 (val!16968 Int)) )
))
(declare-datatypes ((ValueCell!15995 0))(
  ( (ValueCellFull!15995 (v!19565 V!50153)) (EmptyCell!15995) )
))
(declare-datatypes ((array!84677 0))(
  ( (array!84678 (arr!40836 (Array (_ BitVec 32) ValueCell!15995)) (size!41387 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84677)

(declare-fun e!733509 () Bool)

(declare-fun array_inv!31191 (array!84677) Bool)

(assert (=> start!108858 (and (array_inv!31191 _values!1445) e!733509)))

(declare-datatypes ((array!84679 0))(
  ( (array!84680 (arr!40837 (Array (_ BitVec 32) (_ BitVec 64))) (size!41388 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84679)

(declare-fun array_inv!31192 (array!84679) Bool)

(assert (=> start!108858 (array_inv!31192 _keys!1741)))

(assert (=> start!108858 tp!99557))

(declare-fun b!1283606 () Bool)

(declare-fun res!852271 () Bool)

(assert (=> b!1283606 (=> (not res!852271) (not e!733511))))

(declare-datatypes ((List!28959 0))(
  ( (Nil!28956) (Cons!28955 (h!30173 (_ BitVec 64)) (t!42495 List!28959)) )
))
(declare-fun arrayNoDuplicates!0 (array!84679 (_ BitVec 32) List!28959) Bool)

(assert (=> b!1283606 (= res!852271 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28956))))

(declare-fun mapIsEmpty!52238 () Bool)

(declare-fun mapRes!52238 () Bool)

(assert (=> mapIsEmpty!52238 mapRes!52238))

(declare-fun b!1283607 () Bool)

(declare-fun e!733512 () Bool)

(assert (=> b!1283607 (= e!733512 tp_is_empty!33787)))

(declare-fun b!1283608 () Bool)

(assert (=> b!1283608 (= e!733511 false)))

(declare-fun minValue!1387 () V!50153)

(declare-fun zeroValue!1387 () V!50153)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577001 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21744 0))(
  ( (tuple2!21745 (_1!10883 (_ BitVec 64)) (_2!10883 V!50153)) )
))
(declare-datatypes ((List!28960 0))(
  ( (Nil!28957) (Cons!28956 (h!30174 tuple2!21744) (t!42496 List!28960)) )
))
(declare-datatypes ((ListLongMap!19409 0))(
  ( (ListLongMap!19410 (toList!9720 List!28960)) )
))
(declare-fun contains!7851 (ListLongMap!19409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4789 (array!84679 array!84677 (_ BitVec 32) (_ BitVec 32) V!50153 V!50153 (_ BitVec 32) Int) ListLongMap!19409)

(assert (=> b!1283608 (= lt!577001 (contains!7851 (getCurrentListMap!4789 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283609 () Bool)

(declare-fun res!852267 () Bool)

(assert (=> b!1283609 (=> (not res!852267) (not e!733511))))

(assert (=> b!1283609 (= res!852267 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41388 _keys!1741))))))

(declare-fun b!1283610 () Bool)

(declare-fun e!733508 () Bool)

(assert (=> b!1283610 (= e!733508 tp_is_empty!33787)))

(declare-fun b!1283611 () Bool)

(declare-fun res!852270 () Bool)

(assert (=> b!1283611 (=> (not res!852270) (not e!733511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84679 (_ BitVec 32)) Bool)

(assert (=> b!1283611 (= res!852270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52238 () Bool)

(declare-fun tp!99556 () Bool)

(assert (=> mapNonEmpty!52238 (= mapRes!52238 (and tp!99556 e!733508))))

(declare-fun mapKey!52238 () (_ BitVec 32))

(declare-fun mapValue!52238 () ValueCell!15995)

(declare-fun mapRest!52238 () (Array (_ BitVec 32) ValueCell!15995))

(assert (=> mapNonEmpty!52238 (= (arr!40836 _values!1445) (store mapRest!52238 mapKey!52238 mapValue!52238))))

(declare-fun b!1283612 () Bool)

(declare-fun res!852269 () Bool)

(assert (=> b!1283612 (=> (not res!852269) (not e!733511))))

(assert (=> b!1283612 (= res!852269 (and (= (size!41387 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41388 _keys!1741) (size!41387 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283613 () Bool)

(assert (=> b!1283613 (= e!733509 (and e!733512 mapRes!52238))))

(declare-fun condMapEmpty!52238 () Bool)

(declare-fun mapDefault!52238 () ValueCell!15995)

(assert (=> b!1283613 (= condMapEmpty!52238 (= (arr!40836 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15995)) mapDefault!52238)))))

(assert (= (and start!108858 res!852268) b!1283612))

(assert (= (and b!1283612 res!852269) b!1283611))

(assert (= (and b!1283611 res!852270) b!1283606))

(assert (= (and b!1283606 res!852271) b!1283609))

(assert (= (and b!1283609 res!852267) b!1283608))

(assert (= (and b!1283613 condMapEmpty!52238) mapIsEmpty!52238))

(assert (= (and b!1283613 (not condMapEmpty!52238)) mapNonEmpty!52238))

(get-info :version)

(assert (= (and mapNonEmpty!52238 ((_ is ValueCellFull!15995) mapValue!52238)) b!1283610))

(assert (= (and b!1283613 ((_ is ValueCellFull!15995) mapDefault!52238)) b!1283607))

(assert (= start!108858 b!1283613))

(declare-fun m!1178161 () Bool)

(assert (=> start!108858 m!1178161))

(declare-fun m!1178163 () Bool)

(assert (=> start!108858 m!1178163))

(declare-fun m!1178165 () Bool)

(assert (=> start!108858 m!1178165))

(declare-fun m!1178167 () Bool)

(assert (=> mapNonEmpty!52238 m!1178167))

(declare-fun m!1178169 () Bool)

(assert (=> b!1283606 m!1178169))

(declare-fun m!1178171 () Bool)

(assert (=> b!1283611 m!1178171))

(declare-fun m!1178173 () Bool)

(assert (=> b!1283608 m!1178173))

(assert (=> b!1283608 m!1178173))

(declare-fun m!1178175 () Bool)

(assert (=> b!1283608 m!1178175))

(check-sat b_and!46215 (not b!1283606) (not b_next!28147) tp_is_empty!33787 (not mapNonEmpty!52238) (not b!1283608) (not b!1283611) (not start!108858))
(check-sat b_and!46215 (not b_next!28147))
