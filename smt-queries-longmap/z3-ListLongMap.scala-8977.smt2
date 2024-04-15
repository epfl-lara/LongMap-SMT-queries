; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108622 () Bool)

(assert start!108622)

(declare-fun b_free!28135 () Bool)

(declare-fun b_next!28135 () Bool)

(assert (=> start!108622 (= b_free!28135 (not b_next!28135))))

(declare-fun tp!99521 () Bool)

(declare-fun b_and!46183 () Bool)

(assert (=> start!108622 (= tp!99521 b_and!46183)))

(declare-fun b!1282093 () Bool)

(declare-fun res!851631 () Bool)

(declare-fun e!732543 () Bool)

(assert (=> b!1282093 (=> (not res!851631) (not e!732543))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84517 0))(
  ( (array!84518 (arr!40761 (Array (_ BitVec 32) (_ BitVec 64))) (size!41313 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84517)

(assert (=> b!1282093 (= res!851631 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41313 _keys!1741))))))

(declare-fun b!1282094 () Bool)

(declare-fun res!851634 () Bool)

(assert (=> b!1282094 (=> (not res!851634) (not e!732543))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84517 (_ BitVec 32)) Bool)

(assert (=> b!1282094 (= res!851634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52220 () Bool)

(declare-fun mapRes!52220 () Bool)

(assert (=> mapIsEmpty!52220 mapRes!52220))

(declare-fun res!851630 () Bool)

(assert (=> start!108622 (=> (not res!851630) (not e!732543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108622 (= res!851630 (validMask!0 mask!2175))))

(assert (=> start!108622 e!732543))

(declare-fun tp_is_empty!33775 () Bool)

(assert (=> start!108622 tp_is_empty!33775))

(assert (=> start!108622 true))

(declare-datatypes ((V!50137 0))(
  ( (V!50138 (val!16962 Int)) )
))
(declare-datatypes ((ValueCell!15989 0))(
  ( (ValueCellFull!15989 (v!19563 V!50137)) (EmptyCell!15989) )
))
(declare-datatypes ((array!84519 0))(
  ( (array!84520 (arr!40762 (Array (_ BitVec 32) ValueCell!15989)) (size!41314 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84519)

(declare-fun e!732545 () Bool)

(declare-fun array_inv!31087 (array!84519) Bool)

(assert (=> start!108622 (and (array_inv!31087 _values!1445) e!732545)))

(declare-fun array_inv!31088 (array!84517) Bool)

(assert (=> start!108622 (array_inv!31088 _keys!1741)))

(assert (=> start!108622 tp!99521))

(declare-fun b!1282095 () Bool)

(declare-fun res!851633 () Bool)

(assert (=> b!1282095 (=> (not res!851633) (not e!732543))))

(declare-datatypes ((List!28979 0))(
  ( (Nil!28976) (Cons!28975 (h!30184 (_ BitVec 64)) (t!42515 List!28979)) )
))
(declare-fun arrayNoDuplicates!0 (array!84517 (_ BitVec 32) List!28979) Bool)

(assert (=> b!1282095 (= res!851633 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28976))))

(declare-fun b!1282096 () Bool)

(declare-fun e!732542 () Bool)

(assert (=> b!1282096 (= e!732542 tp_is_empty!33775)))

(declare-fun mapNonEmpty!52220 () Bool)

(declare-fun tp!99522 () Bool)

(declare-fun e!732544 () Bool)

(assert (=> mapNonEmpty!52220 (= mapRes!52220 (and tp!99522 e!732544))))

(declare-fun mapKey!52220 () (_ BitVec 32))

(declare-fun mapRest!52220 () (Array (_ BitVec 32) ValueCell!15989))

(declare-fun mapValue!52220 () ValueCell!15989)

(assert (=> mapNonEmpty!52220 (= (arr!40762 _values!1445) (store mapRest!52220 mapKey!52220 mapValue!52220))))

(declare-fun b!1282097 () Bool)

(assert (=> b!1282097 (= e!732543 false)))

(declare-fun minValue!1387 () V!50137)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!576321 () Bool)

(declare-fun zeroValue!1387 () V!50137)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21792 0))(
  ( (tuple2!21793 (_1!10907 (_ BitVec 64)) (_2!10907 V!50137)) )
))
(declare-datatypes ((List!28980 0))(
  ( (Nil!28977) (Cons!28976 (h!30185 tuple2!21792) (t!42516 List!28980)) )
))
(declare-datatypes ((ListLongMap!19449 0))(
  ( (ListLongMap!19450 (toList!9740 List!28980)) )
))
(declare-fun contains!7787 (ListLongMap!19449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4714 (array!84517 array!84519 (_ BitVec 32) (_ BitVec 32) V!50137 V!50137 (_ BitVec 32) Int) ListLongMap!19449)

(assert (=> b!1282097 (= lt!576321 (contains!7787 (getCurrentListMap!4714 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282098 () Bool)

(declare-fun res!851632 () Bool)

(assert (=> b!1282098 (=> (not res!851632) (not e!732543))))

(assert (=> b!1282098 (= res!851632 (and (= (size!41314 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41313 _keys!1741) (size!41314 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282099 () Bool)

(assert (=> b!1282099 (= e!732544 tp_is_empty!33775)))

(declare-fun b!1282100 () Bool)

(assert (=> b!1282100 (= e!732545 (and e!732542 mapRes!52220))))

(declare-fun condMapEmpty!52220 () Bool)

(declare-fun mapDefault!52220 () ValueCell!15989)

(assert (=> b!1282100 (= condMapEmpty!52220 (= (arr!40762 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15989)) mapDefault!52220)))))

(assert (= (and start!108622 res!851630) b!1282098))

(assert (= (and b!1282098 res!851632) b!1282094))

(assert (= (and b!1282094 res!851634) b!1282095))

(assert (= (and b!1282095 res!851633) b!1282093))

(assert (= (and b!1282093 res!851631) b!1282097))

(assert (= (and b!1282100 condMapEmpty!52220) mapIsEmpty!52220))

(assert (= (and b!1282100 (not condMapEmpty!52220)) mapNonEmpty!52220))

(get-info :version)

(assert (= (and mapNonEmpty!52220 ((_ is ValueCellFull!15989) mapValue!52220)) b!1282099))

(assert (= (and b!1282100 ((_ is ValueCellFull!15989) mapDefault!52220)) b!1282096))

(assert (= start!108622 b!1282100))

(declare-fun m!1175953 () Bool)

(assert (=> b!1282095 m!1175953))

(declare-fun m!1175955 () Bool)

(assert (=> b!1282097 m!1175955))

(assert (=> b!1282097 m!1175955))

(declare-fun m!1175957 () Bool)

(assert (=> b!1282097 m!1175957))

(declare-fun m!1175959 () Bool)

(assert (=> start!108622 m!1175959))

(declare-fun m!1175961 () Bool)

(assert (=> start!108622 m!1175961))

(declare-fun m!1175963 () Bool)

(assert (=> start!108622 m!1175963))

(declare-fun m!1175965 () Bool)

(assert (=> mapNonEmpty!52220 m!1175965))

(declare-fun m!1175967 () Bool)

(assert (=> b!1282094 m!1175967))

(check-sat (not b_next!28135) b_and!46183 (not b!1282094) tp_is_empty!33775 (not b!1282095) (not b!1282097) (not start!108622) (not mapNonEmpty!52220))
(check-sat b_and!46183 (not b_next!28135))
