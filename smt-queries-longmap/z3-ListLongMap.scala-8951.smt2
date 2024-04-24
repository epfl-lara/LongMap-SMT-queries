; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108656 () Bool)

(assert start!108656)

(declare-fun b_free!27979 () Bool)

(declare-fun b_next!27979 () Bool)

(assert (=> start!108656 (= b_free!27979 (not b_next!27979))))

(declare-fun tp!99046 () Bool)

(declare-fun b_and!46041 () Bool)

(assert (=> start!108656 (= tp!99046 b_and!46041)))

(declare-fun b!1281066 () Bool)

(declare-fun res!850635 () Bool)

(declare-fun e!732053 () Bool)

(assert (=> b!1281066 (=> (not res!850635) (not e!732053))))

(declare-datatypes ((array!84347 0))(
  ( (array!84348 (arr!40673 (Array (_ BitVec 32) (_ BitVec 64))) (size!41224 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84347)

(declare-datatypes ((List!28840 0))(
  ( (Nil!28837) (Cons!28836 (h!30054 (_ BitVec 64)) (t!42372 List!28840)) )
))
(declare-fun arrayNoDuplicates!0 (array!84347 (_ BitVec 32) List!28840) Bool)

(assert (=> b!1281066 (= res!850635 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28837))))

(declare-fun b!1281067 () Bool)

(declare-fun res!850634 () Bool)

(assert (=> b!1281067 (=> (not res!850634) (not e!732053))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49929 0))(
  ( (V!49930 (val!16884 Int)) )
))
(declare-datatypes ((ValueCell!15911 0))(
  ( (ValueCellFull!15911 (v!19479 V!49929)) (EmptyCell!15911) )
))
(declare-datatypes ((array!84349 0))(
  ( (array!84350 (arr!40674 (Array (_ BitVec 32) ValueCell!15911)) (size!41225 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84349)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281067 (= res!850634 (and (= (size!41225 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41224 _keys!1741) (size!41225 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281068 () Bool)

(declare-fun e!732056 () Bool)

(declare-fun tp_is_empty!33619 () Bool)

(assert (=> b!1281068 (= e!732056 tp_is_empty!33619)))

(declare-fun b!1281069 () Bool)

(declare-fun e!732054 () Bool)

(declare-fun mapRes!51980 () Bool)

(assert (=> b!1281069 (= e!732054 (and e!732056 mapRes!51980))))

(declare-fun condMapEmpty!51980 () Bool)

(declare-fun mapDefault!51980 () ValueCell!15911)

(assert (=> b!1281069 (= condMapEmpty!51980 (= (arr!40674 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15911)) mapDefault!51980)))))

(declare-fun mapNonEmpty!51980 () Bool)

(declare-fun tp!99047 () Bool)

(declare-fun e!732055 () Bool)

(assert (=> mapNonEmpty!51980 (= mapRes!51980 (and tp!99047 e!732055))))

(declare-fun mapRest!51980 () (Array (_ BitVec 32) ValueCell!15911))

(declare-fun mapKey!51980 () (_ BitVec 32))

(declare-fun mapValue!51980 () ValueCell!15911)

(assert (=> mapNonEmpty!51980 (= (arr!40674 _values!1445) (store mapRest!51980 mapKey!51980 mapValue!51980))))

(declare-fun b!1281070 () Bool)

(declare-fun res!850631 () Bool)

(assert (=> b!1281070 (=> (not res!850631) (not e!732053))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281070 (= res!850631 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41224 _keys!1741))))))

(declare-fun b!1281071 () Bool)

(declare-fun res!850632 () Bool)

(assert (=> b!1281071 (=> (not res!850632) (not e!732053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84347 (_ BitVec 32)) Bool)

(assert (=> b!1281071 (= res!850632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!850633 () Bool)

(assert (=> start!108656 (=> (not res!850633) (not e!732053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108656 (= res!850633 (validMask!0 mask!2175))))

(assert (=> start!108656 e!732053))

(assert (=> start!108656 tp_is_empty!33619))

(assert (=> start!108656 true))

(declare-fun array_inv!31075 (array!84349) Bool)

(assert (=> start!108656 (and (array_inv!31075 _values!1445) e!732054)))

(declare-fun array_inv!31076 (array!84347) Bool)

(assert (=> start!108656 (array_inv!31076 _keys!1741)))

(assert (=> start!108656 tp!99046))

(declare-fun mapIsEmpty!51980 () Bool)

(assert (=> mapIsEmpty!51980 mapRes!51980))

(declare-fun b!1281072 () Bool)

(assert (=> b!1281072 (= e!732053 false)))

(declare-fun minValue!1387 () V!49929)

(declare-fun zeroValue!1387 () V!49929)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576525 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21628 0))(
  ( (tuple2!21629 (_1!10825 (_ BitVec 64)) (_2!10825 V!49929)) )
))
(declare-datatypes ((List!28841 0))(
  ( (Nil!28838) (Cons!28837 (h!30055 tuple2!21628) (t!42373 List!28841)) )
))
(declare-datatypes ((ListLongMap!19293 0))(
  ( (ListLongMap!19294 (toList!9662 List!28841)) )
))
(declare-fun contains!7791 (ListLongMap!19293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4731 (array!84347 array!84349 (_ BitVec 32) (_ BitVec 32) V!49929 V!49929 (_ BitVec 32) Int) ListLongMap!19293)

(assert (=> b!1281072 (= lt!576525 (contains!7791 (getCurrentListMap!4731 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281073 () Bool)

(assert (=> b!1281073 (= e!732055 tp_is_empty!33619)))

(assert (= (and start!108656 res!850633) b!1281067))

(assert (= (and b!1281067 res!850634) b!1281071))

(assert (= (and b!1281071 res!850632) b!1281066))

(assert (= (and b!1281066 res!850635) b!1281070))

(assert (= (and b!1281070 res!850631) b!1281072))

(assert (= (and b!1281069 condMapEmpty!51980) mapIsEmpty!51980))

(assert (= (and b!1281069 (not condMapEmpty!51980)) mapNonEmpty!51980))

(get-info :version)

(assert (= (and mapNonEmpty!51980 ((_ is ValueCellFull!15911) mapValue!51980)) b!1281073))

(assert (= (and b!1281069 ((_ is ValueCellFull!15911) mapDefault!51980)) b!1281068))

(assert (= start!108656 b!1281069))

(declare-fun m!1176225 () Bool)

(assert (=> b!1281066 m!1176225))

(declare-fun m!1176227 () Bool)

(assert (=> b!1281072 m!1176227))

(assert (=> b!1281072 m!1176227))

(declare-fun m!1176229 () Bool)

(assert (=> b!1281072 m!1176229))

(declare-fun m!1176231 () Bool)

(assert (=> b!1281071 m!1176231))

(declare-fun m!1176233 () Bool)

(assert (=> mapNonEmpty!51980 m!1176233))

(declare-fun m!1176235 () Bool)

(assert (=> start!108656 m!1176235))

(declare-fun m!1176237 () Bool)

(assert (=> start!108656 m!1176237))

(declare-fun m!1176239 () Bool)

(assert (=> start!108656 m!1176239))

(check-sat (not b!1281066) tp_is_empty!33619 (not b!1281072) (not mapNonEmpty!51980) b_and!46041 (not start!108656) (not b_next!27979) (not b!1281071))
(check-sat b_and!46041 (not b_next!27979))
