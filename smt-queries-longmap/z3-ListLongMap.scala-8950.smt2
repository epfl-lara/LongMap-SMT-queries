; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108650 () Bool)

(assert start!108650)

(declare-fun b_free!27973 () Bool)

(declare-fun b_next!27973 () Bool)

(assert (=> start!108650 (= b_free!27973 (not b_next!27973))))

(declare-fun tp!99028 () Bool)

(declare-fun b_and!46035 () Bool)

(assert (=> start!108650 (= tp!99028 b_and!46035)))

(declare-fun b!1280994 () Bool)

(declare-fun res!850588 () Bool)

(declare-fun e!732008 () Bool)

(assert (=> b!1280994 (=> (not res!850588) (not e!732008))))

(declare-datatypes ((array!84339 0))(
  ( (array!84340 (arr!40669 (Array (_ BitVec 32) (_ BitVec 64))) (size!41220 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84339)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84339 (_ BitVec 32)) Bool)

(assert (=> b!1280994 (= res!850588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280995 () Bool)

(assert (=> b!1280995 (= e!732008 false)))

(declare-datatypes ((V!49921 0))(
  ( (V!49922 (val!16881 Int)) )
))
(declare-fun minValue!1387 () V!49921)

(declare-fun zeroValue!1387 () V!49921)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576516 () Bool)

(declare-datatypes ((ValueCell!15908 0))(
  ( (ValueCellFull!15908 (v!19476 V!49921)) (EmptyCell!15908) )
))
(declare-datatypes ((array!84341 0))(
  ( (array!84342 (arr!40670 (Array (_ BitVec 32) ValueCell!15908)) (size!41221 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84341)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21626 0))(
  ( (tuple2!21627 (_1!10824 (_ BitVec 64)) (_2!10824 V!49921)) )
))
(declare-datatypes ((List!28838 0))(
  ( (Nil!28835) (Cons!28834 (h!30052 tuple2!21626) (t!42370 List!28838)) )
))
(declare-datatypes ((ListLongMap!19291 0))(
  ( (ListLongMap!19292 (toList!9661 List!28838)) )
))
(declare-fun contains!7790 (ListLongMap!19291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4730 (array!84339 array!84341 (_ BitVec 32) (_ BitVec 32) V!49921 V!49921 (_ BitVec 32) Int) ListLongMap!19291)

(assert (=> b!1280995 (= lt!576516 (contains!7790 (getCurrentListMap!4730 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280996 () Bool)

(declare-fun e!732009 () Bool)

(declare-fun tp_is_empty!33613 () Bool)

(assert (=> b!1280996 (= e!732009 tp_is_empty!33613)))

(declare-fun b!1280998 () Bool)

(declare-fun res!850589 () Bool)

(assert (=> b!1280998 (=> (not res!850589) (not e!732008))))

(assert (=> b!1280998 (= res!850589 (and (= (size!41221 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41220 _keys!1741) (size!41221 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51971 () Bool)

(declare-fun mapRes!51971 () Bool)

(assert (=> mapIsEmpty!51971 mapRes!51971))

(declare-fun b!1280999 () Bool)

(declare-fun res!850586 () Bool)

(assert (=> b!1280999 (=> (not res!850586) (not e!732008))))

(declare-datatypes ((List!28839 0))(
  ( (Nil!28836) (Cons!28835 (h!30053 (_ BitVec 64)) (t!42371 List!28839)) )
))
(declare-fun arrayNoDuplicates!0 (array!84339 (_ BitVec 32) List!28839) Bool)

(assert (=> b!1280999 (= res!850586 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28836))))

(declare-fun b!1280997 () Bool)

(declare-fun e!732011 () Bool)

(declare-fun e!732010 () Bool)

(assert (=> b!1280997 (= e!732011 (and e!732010 mapRes!51971))))

(declare-fun condMapEmpty!51971 () Bool)

(declare-fun mapDefault!51971 () ValueCell!15908)

(assert (=> b!1280997 (= condMapEmpty!51971 (= (arr!40670 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15908)) mapDefault!51971)))))

(declare-fun res!850587 () Bool)

(assert (=> start!108650 (=> (not res!850587) (not e!732008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108650 (= res!850587 (validMask!0 mask!2175))))

(assert (=> start!108650 e!732008))

(assert (=> start!108650 tp_is_empty!33613))

(assert (=> start!108650 true))

(declare-fun array_inv!31073 (array!84341) Bool)

(assert (=> start!108650 (and (array_inv!31073 _values!1445) e!732011)))

(declare-fun array_inv!31074 (array!84339) Bool)

(assert (=> start!108650 (array_inv!31074 _keys!1741)))

(assert (=> start!108650 tp!99028))

(declare-fun mapNonEmpty!51971 () Bool)

(declare-fun tp!99029 () Bool)

(assert (=> mapNonEmpty!51971 (= mapRes!51971 (and tp!99029 e!732009))))

(declare-fun mapKey!51971 () (_ BitVec 32))

(declare-fun mapRest!51971 () (Array (_ BitVec 32) ValueCell!15908))

(declare-fun mapValue!51971 () ValueCell!15908)

(assert (=> mapNonEmpty!51971 (= (arr!40670 _values!1445) (store mapRest!51971 mapKey!51971 mapValue!51971))))

(declare-fun b!1281000 () Bool)

(declare-fun res!850590 () Bool)

(assert (=> b!1281000 (=> (not res!850590) (not e!732008))))

(assert (=> b!1281000 (= res!850590 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41220 _keys!1741))))))

(declare-fun b!1281001 () Bool)

(assert (=> b!1281001 (= e!732010 tp_is_empty!33613)))

(assert (= (and start!108650 res!850587) b!1280998))

(assert (= (and b!1280998 res!850589) b!1280994))

(assert (= (and b!1280994 res!850588) b!1280999))

(assert (= (and b!1280999 res!850586) b!1281000))

(assert (= (and b!1281000 res!850590) b!1280995))

(assert (= (and b!1280997 condMapEmpty!51971) mapIsEmpty!51971))

(assert (= (and b!1280997 (not condMapEmpty!51971)) mapNonEmpty!51971))

(get-info :version)

(assert (= (and mapNonEmpty!51971 ((_ is ValueCellFull!15908) mapValue!51971)) b!1280996))

(assert (= (and b!1280997 ((_ is ValueCellFull!15908) mapDefault!51971)) b!1281001))

(assert (= start!108650 b!1280997))

(declare-fun m!1176177 () Bool)

(assert (=> b!1280999 m!1176177))

(declare-fun m!1176179 () Bool)

(assert (=> b!1280995 m!1176179))

(assert (=> b!1280995 m!1176179))

(declare-fun m!1176181 () Bool)

(assert (=> b!1280995 m!1176181))

(declare-fun m!1176183 () Bool)

(assert (=> start!108650 m!1176183))

(declare-fun m!1176185 () Bool)

(assert (=> start!108650 m!1176185))

(declare-fun m!1176187 () Bool)

(assert (=> start!108650 m!1176187))

(declare-fun m!1176189 () Bool)

(assert (=> b!1280994 m!1176189))

(declare-fun m!1176191 () Bool)

(assert (=> mapNonEmpty!51971 m!1176191))

(check-sat tp_is_empty!33613 (not b!1280994) b_and!46035 (not mapNonEmpty!51971) (not start!108650) (not b!1280999) (not b!1280995) (not b_next!27973))
(check-sat b_and!46035 (not b_next!27973))
