; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108422 () Bool)

(assert start!108422)

(declare-fun b_free!27969 () Bool)

(declare-fun b_next!27969 () Bool)

(assert (=> start!108422 (= b_free!27969 (not b_next!27969))))

(declare-fun tp!99016 () Bool)

(declare-fun b_and!46029 () Bool)

(assert (=> start!108422 (= tp!99016 b_and!46029)))

(declare-fun b!1279637 () Bool)

(declare-fun res!850033 () Bool)

(declare-fun e!731132 () Bool)

(assert (=> b!1279637 (=> (not res!850033) (not e!731132))))

(declare-datatypes ((array!84302 0))(
  ( (array!84303 (arr!40655 (Array (_ BitVec 32) (_ BitVec 64))) (size!41205 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84302)

(declare-datatypes ((List!28795 0))(
  ( (Nil!28792) (Cons!28791 (h!30000 (_ BitVec 64)) (t!42335 List!28795)) )
))
(declare-fun arrayNoDuplicates!0 (array!84302 (_ BitVec 32) List!28795) Bool)

(assert (=> b!1279637 (= res!850033 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28792))))

(declare-fun mapIsEmpty!51965 () Bool)

(declare-fun mapRes!51965 () Bool)

(assert (=> mapIsEmpty!51965 mapRes!51965))

(declare-fun b!1279638 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279638 (= e!731132 (bvsgt from!2144 (size!41205 _keys!1741)))))

(declare-fun res!850034 () Bool)

(assert (=> start!108422 (=> (not res!850034) (not e!731132))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108422 (= res!850034 (validMask!0 mask!2175))))

(assert (=> start!108422 e!731132))

(declare-fun tp_is_empty!33609 () Bool)

(assert (=> start!108422 tp_is_empty!33609))

(assert (=> start!108422 true))

(declare-datatypes ((V!49915 0))(
  ( (V!49916 (val!16879 Int)) )
))
(declare-datatypes ((ValueCell!15906 0))(
  ( (ValueCellFull!15906 (v!19479 V!49915)) (EmptyCell!15906) )
))
(declare-datatypes ((array!84304 0))(
  ( (array!84305 (arr!40656 (Array (_ BitVec 32) ValueCell!15906)) (size!41206 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84304)

(declare-fun e!731135 () Bool)

(declare-fun array_inv!30863 (array!84304) Bool)

(assert (=> start!108422 (and (array_inv!30863 _values!1445) e!731135)))

(declare-fun array_inv!30864 (array!84302) Bool)

(assert (=> start!108422 (array_inv!30864 _keys!1741)))

(assert (=> start!108422 tp!99016))

(declare-fun b!1279639 () Bool)

(declare-fun res!850036 () Bool)

(assert (=> b!1279639 (=> (not res!850036) (not e!731132))))

(assert (=> b!1279639 (= res!850036 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41205 _keys!1741))))))

(declare-fun b!1279640 () Bool)

(declare-fun res!850037 () Bool)

(assert (=> b!1279640 (=> (not res!850037) (not e!731132))))

(declare-fun minValue!1387 () V!49915)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!49915)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21596 0))(
  ( (tuple2!21597 (_1!10809 (_ BitVec 64)) (_2!10809 V!49915)) )
))
(declare-datatypes ((List!28796 0))(
  ( (Nil!28793) (Cons!28792 (h!30001 tuple2!21596) (t!42336 List!28796)) )
))
(declare-datatypes ((ListLongMap!19253 0))(
  ( (ListLongMap!19254 (toList!9642 List!28796)) )
))
(declare-fun contains!7757 (ListLongMap!19253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4726 (array!84302 array!84304 (_ BitVec 32) (_ BitVec 32) V!49915 V!49915 (_ BitVec 32) Int) ListLongMap!19253)

(assert (=> b!1279640 (= res!850037 (contains!7757 (getCurrentListMap!4726 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279641 () Bool)

(declare-fun res!850032 () Bool)

(assert (=> b!1279641 (=> (not res!850032) (not e!731132))))

(assert (=> b!1279641 (= res!850032 (and (= (size!41206 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41205 _keys!1741) (size!41206 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279642 () Bool)

(declare-fun e!731131 () Bool)

(assert (=> b!1279642 (= e!731131 tp_is_empty!33609)))

(declare-fun b!1279643 () Bool)

(declare-fun e!731134 () Bool)

(assert (=> b!1279643 (= e!731134 tp_is_empty!33609)))

(declare-fun b!1279644 () Bool)

(assert (=> b!1279644 (= e!731135 (and e!731131 mapRes!51965))))

(declare-fun condMapEmpty!51965 () Bool)

(declare-fun mapDefault!51965 () ValueCell!15906)

(assert (=> b!1279644 (= condMapEmpty!51965 (= (arr!40656 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15906)) mapDefault!51965)))))

(declare-fun b!1279645 () Bool)

(declare-fun res!850035 () Bool)

(assert (=> b!1279645 (=> (not res!850035) (not e!731132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84302 (_ BitVec 32)) Bool)

(assert (=> b!1279645 (= res!850035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51965 () Bool)

(declare-fun tp!99017 () Bool)

(assert (=> mapNonEmpty!51965 (= mapRes!51965 (and tp!99017 e!731134))))

(declare-fun mapKey!51965 () (_ BitVec 32))

(declare-fun mapRest!51965 () (Array (_ BitVec 32) ValueCell!15906))

(declare-fun mapValue!51965 () ValueCell!15906)

(assert (=> mapNonEmpty!51965 (= (arr!40656 _values!1445) (store mapRest!51965 mapKey!51965 mapValue!51965))))

(assert (= (and start!108422 res!850034) b!1279641))

(assert (= (and b!1279641 res!850032) b!1279645))

(assert (= (and b!1279645 res!850035) b!1279637))

(assert (= (and b!1279637 res!850033) b!1279639))

(assert (= (and b!1279639 res!850036) b!1279640))

(assert (= (and b!1279640 res!850037) b!1279638))

(assert (= (and b!1279644 condMapEmpty!51965) mapIsEmpty!51965))

(assert (= (and b!1279644 (not condMapEmpty!51965)) mapNonEmpty!51965))

(get-info :version)

(assert (= (and mapNonEmpty!51965 ((_ is ValueCellFull!15906) mapValue!51965)) b!1279643))

(assert (= (and b!1279644 ((_ is ValueCellFull!15906) mapDefault!51965)) b!1279642))

(assert (= start!108422 b!1279644))

(declare-fun m!1174533 () Bool)

(assert (=> b!1279640 m!1174533))

(assert (=> b!1279640 m!1174533))

(declare-fun m!1174535 () Bool)

(assert (=> b!1279640 m!1174535))

(declare-fun m!1174537 () Bool)

(assert (=> start!108422 m!1174537))

(declare-fun m!1174539 () Bool)

(assert (=> start!108422 m!1174539))

(declare-fun m!1174541 () Bool)

(assert (=> start!108422 m!1174541))

(declare-fun m!1174543 () Bool)

(assert (=> mapNonEmpty!51965 m!1174543))

(declare-fun m!1174545 () Bool)

(assert (=> b!1279637 m!1174545))

(declare-fun m!1174547 () Bool)

(assert (=> b!1279645 m!1174547))

(check-sat (not b!1279645) (not mapNonEmpty!51965) (not b_next!27969) (not start!108422) tp_is_empty!33609 b_and!46029 (not b!1279640) (not b!1279637))
(check-sat b_and!46029 (not b_next!27969))
