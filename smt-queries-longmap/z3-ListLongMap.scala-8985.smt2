; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108672 () Bool)

(assert start!108672)

(declare-fun b_free!28185 () Bool)

(declare-fun b_next!28185 () Bool)

(assert (=> start!108672 (= b_free!28185 (not b_next!28185))))

(declare-fun tp!99671 () Bool)

(declare-fun b_and!46251 () Bool)

(assert (=> start!108672 (= tp!99671 b_and!46251)))

(declare-fun b!1282772 () Bool)

(declare-fun e!732950 () Bool)

(declare-fun e!732946 () Bool)

(declare-fun mapRes!52295 () Bool)

(assert (=> b!1282772 (= e!732950 (and e!732946 mapRes!52295))))

(declare-fun condMapEmpty!52295 () Bool)

(declare-datatypes ((V!50203 0))(
  ( (V!50204 (val!16987 Int)) )
))
(declare-datatypes ((ValueCell!16014 0))(
  ( (ValueCellFull!16014 (v!19589 V!50203)) (EmptyCell!16014) )
))
(declare-datatypes ((array!84718 0))(
  ( (array!84719 (arr!40861 (Array (_ BitVec 32) ValueCell!16014)) (size!41411 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84718)

(declare-fun mapDefault!52295 () ValueCell!16014)

(assert (=> b!1282772 (= condMapEmpty!52295 (= (arr!40861 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16014)) mapDefault!52295)))))

(declare-fun b!1282773 () Bool)

(declare-fun res!852050 () Bool)

(declare-fun e!732949 () Bool)

(assert (=> b!1282773 (=> (not res!852050) (not e!732949))))

(declare-fun minValue!1387 () V!50203)

(declare-fun zeroValue!1387 () V!50203)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84720 0))(
  ( (array!84721 (arr!40862 (Array (_ BitVec 32) (_ BitVec 64))) (size!41412 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84720)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21754 0))(
  ( (tuple2!21755 (_1!10888 (_ BitVec 64)) (_2!10888 V!50203)) )
))
(declare-datatypes ((List!28950 0))(
  ( (Nil!28947) (Cons!28946 (h!30155 tuple2!21754) (t!42494 List!28950)) )
))
(declare-datatypes ((ListLongMap!19411 0))(
  ( (ListLongMap!19412 (toList!9721 List!28950)) )
))
(declare-fun contains!7838 (ListLongMap!19411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4805 (array!84720 array!84718 (_ BitVec 32) (_ BitVec 32) V!50203 V!50203 (_ BitVec 32) Int) ListLongMap!19411)

(assert (=> b!1282773 (= res!852050 (contains!7838 (getCurrentListMap!4805 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282774 () Bool)

(declare-fun res!852051 () Bool)

(assert (=> b!1282774 (=> (not res!852051) (not e!732949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282774 (= res!852051 (validKeyInArray!0 (select (arr!40862 _keys!1741) from!2144)))))

(declare-fun b!1282775 () Bool)

(declare-fun tp_is_empty!33825 () Bool)

(assert (=> b!1282775 (= e!732946 tp_is_empty!33825)))

(declare-fun b!1282776 () Bool)

(declare-fun e!732948 () Bool)

(assert (=> b!1282776 (= e!732948 tp_is_empty!33825)))

(declare-fun mapIsEmpty!52295 () Bool)

(assert (=> mapIsEmpty!52295 mapRes!52295))

(declare-fun mapNonEmpty!52295 () Bool)

(declare-fun tp!99670 () Bool)

(assert (=> mapNonEmpty!52295 (= mapRes!52295 (and tp!99670 e!732948))))

(declare-fun mapKey!52295 () (_ BitVec 32))

(declare-fun mapValue!52295 () ValueCell!16014)

(declare-fun mapRest!52295 () (Array (_ BitVec 32) ValueCell!16014))

(assert (=> mapNonEmpty!52295 (= (arr!40861 _values!1445) (store mapRest!52295 mapKey!52295 mapValue!52295))))

(declare-fun b!1282777 () Bool)

(declare-fun res!852049 () Bool)

(assert (=> b!1282777 (=> (not res!852049) (not e!732949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84720 (_ BitVec 32)) Bool)

(assert (=> b!1282777 (= res!852049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852052 () Bool)

(assert (=> start!108672 (=> (not res!852052) (not e!732949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108672 (= res!852052 (validMask!0 mask!2175))))

(assert (=> start!108672 e!732949))

(assert (=> start!108672 tp_is_empty!33825))

(assert (=> start!108672 true))

(declare-fun array_inv!30999 (array!84718) Bool)

(assert (=> start!108672 (and (array_inv!30999 _values!1445) e!732950)))

(declare-fun array_inv!31000 (array!84720) Bool)

(assert (=> start!108672 (array_inv!31000 _keys!1741)))

(assert (=> start!108672 tp!99671))

(declare-fun b!1282778 () Bool)

(declare-fun res!852054 () Bool)

(assert (=> b!1282778 (=> (not res!852054) (not e!732949))))

(declare-datatypes ((List!28951 0))(
  ( (Nil!28948) (Cons!28947 (h!30156 (_ BitVec 64)) (t!42495 List!28951)) )
))
(declare-fun arrayNoDuplicates!0 (array!84720 (_ BitVec 32) List!28951) Bool)

(assert (=> b!1282778 (= res!852054 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28948))))

(declare-fun b!1282779 () Bool)

(declare-fun res!852048 () Bool)

(assert (=> b!1282779 (=> (not res!852048) (not e!732949))))

(assert (=> b!1282779 (= res!852048 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41412 _keys!1741))))))

(declare-fun b!1282780 () Bool)

(assert (=> b!1282780 (= e!732949 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt from!2144 (size!41412 _keys!1741))))))

(declare-fun b!1282781 () Bool)

(declare-fun res!852053 () Bool)

(assert (=> b!1282781 (=> (not res!852053) (not e!732949))))

(assert (=> b!1282781 (= res!852053 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41412 _keys!1741))))))

(declare-fun b!1282782 () Bool)

(declare-fun res!852047 () Bool)

(assert (=> b!1282782 (=> (not res!852047) (not e!732949))))

(assert (=> b!1282782 (= res!852047 (and (= (size!41411 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41412 _keys!1741) (size!41411 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108672 res!852052) b!1282782))

(assert (= (and b!1282782 res!852047) b!1282777))

(assert (= (and b!1282777 res!852049) b!1282778))

(assert (= (and b!1282778 res!852054) b!1282781))

(assert (= (and b!1282781 res!852053) b!1282773))

(assert (= (and b!1282773 res!852050) b!1282779))

(assert (= (and b!1282779 res!852048) b!1282774))

(assert (= (and b!1282774 res!852051) b!1282780))

(assert (= (and b!1282772 condMapEmpty!52295) mapIsEmpty!52295))

(assert (= (and b!1282772 (not condMapEmpty!52295)) mapNonEmpty!52295))

(get-info :version)

(assert (= (and mapNonEmpty!52295 ((_ is ValueCellFull!16014) mapValue!52295)) b!1282776))

(assert (= (and b!1282772 ((_ is ValueCellFull!16014) mapDefault!52295)) b!1282775))

(assert (= start!108672 b!1282772))

(declare-fun m!1176857 () Bool)

(assert (=> mapNonEmpty!52295 m!1176857))

(declare-fun m!1176859 () Bool)

(assert (=> b!1282777 m!1176859))

(declare-fun m!1176861 () Bool)

(assert (=> start!108672 m!1176861))

(declare-fun m!1176863 () Bool)

(assert (=> start!108672 m!1176863))

(declare-fun m!1176865 () Bool)

(assert (=> start!108672 m!1176865))

(declare-fun m!1176867 () Bool)

(assert (=> b!1282773 m!1176867))

(assert (=> b!1282773 m!1176867))

(declare-fun m!1176869 () Bool)

(assert (=> b!1282773 m!1176869))

(declare-fun m!1176871 () Bool)

(assert (=> b!1282778 m!1176871))

(declare-fun m!1176873 () Bool)

(assert (=> b!1282774 m!1176873))

(assert (=> b!1282774 m!1176873))

(declare-fun m!1176875 () Bool)

(assert (=> b!1282774 m!1176875))

(check-sat (not start!108672) b_and!46251 tp_is_empty!33825 (not b!1282773) (not b_next!28185) (not b!1282778) (not b!1282777) (not mapNonEmpty!52295) (not b!1282774))
(check-sat b_and!46251 (not b_next!28185))
