; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108464 () Bool)

(assert start!108464)

(declare-fun b_free!28011 () Bool)

(declare-fun b_next!28011 () Bool)

(assert (=> start!108464 (= b_free!28011 (not b_next!28011))))

(declare-fun tp!99143 () Bool)

(declare-fun b_and!46071 () Bool)

(assert (=> start!108464 (= tp!99143 b_and!46071)))

(declare-fun mapIsEmpty!52028 () Bool)

(declare-fun mapRes!52028 () Bool)

(assert (=> mapIsEmpty!52028 mapRes!52028))

(declare-fun b!1280145 () Bool)

(declare-fun res!850352 () Bool)

(declare-fun e!731449 () Bool)

(assert (=> b!1280145 (=> (not res!850352) (not e!731449))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84382 0))(
  ( (array!84383 (arr!40695 (Array (_ BitVec 32) (_ BitVec 64))) (size!41245 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84382)

(assert (=> b!1280145 (= res!850352 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41245 _keys!1741))))))

(declare-fun b!1280146 () Bool)

(assert (=> b!1280146 (= e!731449 false)))

(declare-datatypes ((V!49971 0))(
  ( (V!49972 (val!16900 Int)) )
))
(declare-fun minValue!1387 () V!49971)

(declare-fun zeroValue!1387 () V!49971)

(declare-fun lt!576089 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15927 0))(
  ( (ValueCellFull!15927 (v!19500 V!49971)) (EmptyCell!15927) )
))
(declare-datatypes ((array!84384 0))(
  ( (array!84385 (arr!40696 (Array (_ BitVec 32) ValueCell!15927)) (size!41246 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84384)

(declare-datatypes ((tuple2!21628 0))(
  ( (tuple2!21629 (_1!10825 (_ BitVec 64)) (_2!10825 V!49971)) )
))
(declare-datatypes ((List!28827 0))(
  ( (Nil!28824) (Cons!28823 (h!30032 tuple2!21628) (t!42367 List!28827)) )
))
(declare-datatypes ((ListLongMap!19285 0))(
  ( (ListLongMap!19286 (toList!9658 List!28827)) )
))
(declare-fun contains!7773 (ListLongMap!19285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4742 (array!84382 array!84384 (_ BitVec 32) (_ BitVec 32) V!49971 V!49971 (_ BitVec 32) Int) ListLongMap!19285)

(assert (=> b!1280146 (= lt!576089 (contains!7773 (getCurrentListMap!4742 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!850351 () Bool)

(assert (=> start!108464 (=> (not res!850351) (not e!731449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108464 (= res!850351 (validMask!0 mask!2175))))

(assert (=> start!108464 e!731449))

(declare-fun tp_is_empty!33651 () Bool)

(assert (=> start!108464 tp_is_empty!33651))

(assert (=> start!108464 true))

(declare-fun e!731448 () Bool)

(declare-fun array_inv!30889 (array!84384) Bool)

(assert (=> start!108464 (and (array_inv!30889 _values!1445) e!731448)))

(declare-fun array_inv!30890 (array!84382) Bool)

(assert (=> start!108464 (array_inv!30890 _keys!1741)))

(assert (=> start!108464 tp!99143))

(declare-fun b!1280147 () Bool)

(declare-fun e!731446 () Bool)

(assert (=> b!1280147 (= e!731448 (and e!731446 mapRes!52028))))

(declare-fun condMapEmpty!52028 () Bool)

(declare-fun mapDefault!52028 () ValueCell!15927)

(assert (=> b!1280147 (= condMapEmpty!52028 (= (arr!40696 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15927)) mapDefault!52028)))))

(declare-fun b!1280148 () Bool)

(declare-fun res!850354 () Bool)

(assert (=> b!1280148 (=> (not res!850354) (not e!731449))))

(assert (=> b!1280148 (= res!850354 (and (= (size!41246 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41245 _keys!1741) (size!41246 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280149 () Bool)

(declare-fun res!850353 () Bool)

(assert (=> b!1280149 (=> (not res!850353) (not e!731449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84382 (_ BitVec 32)) Bool)

(assert (=> b!1280149 (= res!850353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280150 () Bool)

(declare-fun res!850355 () Bool)

(assert (=> b!1280150 (=> (not res!850355) (not e!731449))))

(declare-datatypes ((List!28828 0))(
  ( (Nil!28825) (Cons!28824 (h!30033 (_ BitVec 64)) (t!42368 List!28828)) )
))
(declare-fun arrayNoDuplicates!0 (array!84382 (_ BitVec 32) List!28828) Bool)

(assert (=> b!1280150 (= res!850355 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28825))))

(declare-fun mapNonEmpty!52028 () Bool)

(declare-fun tp!99142 () Bool)

(declare-fun e!731447 () Bool)

(assert (=> mapNonEmpty!52028 (= mapRes!52028 (and tp!99142 e!731447))))

(declare-fun mapValue!52028 () ValueCell!15927)

(declare-fun mapRest!52028 () (Array (_ BitVec 32) ValueCell!15927))

(declare-fun mapKey!52028 () (_ BitVec 32))

(assert (=> mapNonEmpty!52028 (= (arr!40696 _values!1445) (store mapRest!52028 mapKey!52028 mapValue!52028))))

(declare-fun b!1280151 () Bool)

(assert (=> b!1280151 (= e!731447 tp_is_empty!33651)))

(declare-fun b!1280152 () Bool)

(assert (=> b!1280152 (= e!731446 tp_is_empty!33651)))

(assert (= (and start!108464 res!850351) b!1280148))

(assert (= (and b!1280148 res!850354) b!1280149))

(assert (= (and b!1280149 res!850353) b!1280150))

(assert (= (and b!1280150 res!850355) b!1280145))

(assert (= (and b!1280145 res!850352) b!1280146))

(assert (= (and b!1280147 condMapEmpty!52028) mapIsEmpty!52028))

(assert (= (and b!1280147 (not condMapEmpty!52028)) mapNonEmpty!52028))

(get-info :version)

(assert (= (and mapNonEmpty!52028 ((_ is ValueCellFull!15927) mapValue!52028)) b!1280151))

(assert (= (and b!1280147 ((_ is ValueCellFull!15927) mapDefault!52028)) b!1280152))

(assert (= start!108464 b!1280147))

(declare-fun m!1174869 () Bool)

(assert (=> mapNonEmpty!52028 m!1174869))

(declare-fun m!1174871 () Bool)

(assert (=> b!1280150 m!1174871))

(declare-fun m!1174873 () Bool)

(assert (=> b!1280149 m!1174873))

(declare-fun m!1174875 () Bool)

(assert (=> start!108464 m!1174875))

(declare-fun m!1174877 () Bool)

(assert (=> start!108464 m!1174877))

(declare-fun m!1174879 () Bool)

(assert (=> start!108464 m!1174879))

(declare-fun m!1174881 () Bool)

(assert (=> b!1280146 m!1174881))

(assert (=> b!1280146 m!1174881))

(declare-fun m!1174883 () Bool)

(assert (=> b!1280146 m!1174883))

(check-sat (not b_next!28011) tp_is_empty!33651 (not b!1280149) (not start!108464) (not b!1280146) b_and!46071 (not mapNonEmpty!52028) (not b!1280150))
(check-sat b_and!46071 (not b_next!28011))
