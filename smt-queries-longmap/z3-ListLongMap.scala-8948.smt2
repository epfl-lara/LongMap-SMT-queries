; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108414 () Bool)

(assert start!108414)

(declare-fun b_free!27961 () Bool)

(declare-fun b_next!27961 () Bool)

(assert (=> start!108414 (= b_free!27961 (not b_next!27961))))

(declare-fun tp!98993 () Bool)

(declare-fun b_and!46003 () Bool)

(assert (=> start!108414 (= tp!98993 b_and!46003)))

(declare-fun b!1279472 () Bool)

(declare-fun e!731044 () Bool)

(declare-fun tp_is_empty!33601 () Bool)

(assert (=> b!1279472 (= e!731044 tp_is_empty!33601)))

(declare-fun mapNonEmpty!51953 () Bool)

(declare-fun mapRes!51953 () Bool)

(declare-fun tp!98994 () Bool)

(declare-fun e!731043 () Bool)

(assert (=> mapNonEmpty!51953 (= mapRes!51953 (and tp!98994 e!731043))))

(declare-datatypes ((V!49905 0))(
  ( (V!49906 (val!16875 Int)) )
))
(declare-datatypes ((ValueCell!15902 0))(
  ( (ValueCellFull!15902 (v!19474 V!49905)) (EmptyCell!15902) )
))
(declare-fun mapRest!51953 () (Array (_ BitVec 32) ValueCell!15902))

(declare-datatypes ((array!84179 0))(
  ( (array!84180 (arr!40594 (Array (_ BitVec 32) ValueCell!15902)) (size!41146 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84179)

(declare-fun mapValue!51953 () ValueCell!15902)

(declare-fun mapKey!51953 () (_ BitVec 32))

(assert (=> mapNonEmpty!51953 (= (arr!40594 _values!1445) (store mapRest!51953 mapKey!51953 mapValue!51953))))

(declare-fun res!849943 () Bool)

(declare-fun e!731045 () Bool)

(assert (=> start!108414 (=> (not res!849943) (not e!731045))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108414 (= res!849943 (validMask!0 mask!2175))))

(assert (=> start!108414 e!731045))

(assert (=> start!108414 tp_is_empty!33601))

(assert (=> start!108414 true))

(declare-fun e!731046 () Bool)

(declare-fun array_inv!30983 (array!84179) Bool)

(assert (=> start!108414 (and (array_inv!30983 _values!1445) e!731046)))

(declare-datatypes ((array!84181 0))(
  ( (array!84182 (arr!40595 (Array (_ BitVec 32) (_ BitVec 64))) (size!41147 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84181)

(declare-fun array_inv!30984 (array!84181) Bool)

(assert (=> start!108414 (array_inv!30984 _keys!1741)))

(assert (=> start!108414 tp!98993))

(declare-fun b!1279473 () Bool)

(declare-fun res!849942 () Bool)

(assert (=> b!1279473 (=> (not res!849942) (not e!731045))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279473 (= res!849942 (and (= (size!41146 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41147 _keys!1741) (size!41146 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279474 () Bool)

(assert (=> b!1279474 (= e!731045 false)))

(declare-fun minValue!1387 () V!49905)

(declare-fun zeroValue!1387 () V!49905)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575845 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21670 0))(
  ( (tuple2!21671 (_1!10846 (_ BitVec 64)) (_2!10846 V!49905)) )
))
(declare-datatypes ((List!28860 0))(
  ( (Nil!28857) (Cons!28856 (h!30065 tuple2!21670) (t!42392 List!28860)) )
))
(declare-datatypes ((ListLongMap!19327 0))(
  ( (ListLongMap!19328 (toList!9679 List!28860)) )
))
(declare-fun contains!7724 (ListLongMap!19327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4653 (array!84181 array!84179 (_ BitVec 32) (_ BitVec 32) V!49905 V!49905 (_ BitVec 32) Int) ListLongMap!19327)

(assert (=> b!1279474 (= lt!575845 (contains!7724 (getCurrentListMap!4653 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279475 () Bool)

(declare-fun res!849940 () Bool)

(assert (=> b!1279475 (=> (not res!849940) (not e!731045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84181 (_ BitVec 32)) Bool)

(assert (=> b!1279475 (= res!849940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279476 () Bool)

(declare-fun res!849944 () Bool)

(assert (=> b!1279476 (=> (not res!849944) (not e!731045))))

(assert (=> b!1279476 (= res!849944 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41147 _keys!1741))))))

(declare-fun mapIsEmpty!51953 () Bool)

(assert (=> mapIsEmpty!51953 mapRes!51953))

(declare-fun b!1279477 () Bool)

(assert (=> b!1279477 (= e!731046 (and e!731044 mapRes!51953))))

(declare-fun condMapEmpty!51953 () Bool)

(declare-fun mapDefault!51953 () ValueCell!15902)

(assert (=> b!1279477 (= condMapEmpty!51953 (= (arr!40594 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15902)) mapDefault!51953)))))

(declare-fun b!1279478 () Bool)

(assert (=> b!1279478 (= e!731043 tp_is_empty!33601)))

(declare-fun b!1279479 () Bool)

(declare-fun res!849941 () Bool)

(assert (=> b!1279479 (=> (not res!849941) (not e!731045))))

(declare-datatypes ((List!28861 0))(
  ( (Nil!28858) (Cons!28857 (h!30066 (_ BitVec 64)) (t!42393 List!28861)) )
))
(declare-fun arrayNoDuplicates!0 (array!84181 (_ BitVec 32) List!28861) Bool)

(assert (=> b!1279479 (= res!849941 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28858))))

(assert (= (and start!108414 res!849943) b!1279473))

(assert (= (and b!1279473 res!849942) b!1279475))

(assert (= (and b!1279475 res!849940) b!1279479))

(assert (= (and b!1279479 res!849941) b!1279476))

(assert (= (and b!1279476 res!849944) b!1279474))

(assert (= (and b!1279477 condMapEmpty!51953) mapIsEmpty!51953))

(assert (= (and b!1279477 (not condMapEmpty!51953)) mapNonEmpty!51953))

(get-info :version)

(assert (= (and mapNonEmpty!51953 ((_ is ValueCellFull!15902) mapValue!51953)) b!1279478))

(assert (= (and b!1279477 ((_ is ValueCellFull!15902) mapDefault!51953)) b!1279472))

(assert (= start!108414 b!1279477))

(declare-fun m!1173969 () Bool)

(assert (=> b!1279475 m!1173969))

(declare-fun m!1173971 () Bool)

(assert (=> start!108414 m!1173971))

(declare-fun m!1173973 () Bool)

(assert (=> start!108414 m!1173973))

(declare-fun m!1173975 () Bool)

(assert (=> start!108414 m!1173975))

(declare-fun m!1173977 () Bool)

(assert (=> mapNonEmpty!51953 m!1173977))

(declare-fun m!1173979 () Bool)

(assert (=> b!1279479 m!1173979))

(declare-fun m!1173981 () Bool)

(assert (=> b!1279474 m!1173981))

(assert (=> b!1279474 m!1173981))

(declare-fun m!1173983 () Bool)

(assert (=> b!1279474 m!1173983))

(check-sat tp_is_empty!33601 b_and!46003 (not b!1279474) (not start!108414) (not b!1279479) (not mapNonEmpty!51953) (not b_next!27961) (not b!1279475))
(check-sat b_and!46003 (not b_next!27961))
