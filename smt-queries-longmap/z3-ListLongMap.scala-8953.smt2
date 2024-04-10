; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108446 () Bool)

(assert start!108446)

(declare-fun b_free!27993 () Bool)

(declare-fun b_next!27993 () Bool)

(assert (=> start!108446 (= b_free!27993 (not b_next!27993))))

(declare-fun tp!99089 () Bool)

(declare-fun b_and!46053 () Bool)

(assert (=> start!108446 (= tp!99089 b_and!46053)))

(declare-fun b!1279929 () Bool)

(declare-fun res!850220 () Bool)

(declare-fun e!731315 () Bool)

(assert (=> b!1279929 (=> (not res!850220) (not e!731315))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84348 0))(
  ( (array!84349 (arr!40678 (Array (_ BitVec 32) (_ BitVec 64))) (size!41228 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84348)

(assert (=> b!1279929 (= res!850220 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41228 _keys!1741))))))

(declare-fun b!1279930 () Bool)

(declare-fun e!731312 () Bool)

(declare-fun tp_is_empty!33633 () Bool)

(assert (=> b!1279930 (= e!731312 tp_is_empty!33633)))

(declare-fun mapNonEmpty!52001 () Bool)

(declare-fun mapRes!52001 () Bool)

(declare-fun tp!99088 () Bool)

(assert (=> mapNonEmpty!52001 (= mapRes!52001 (and tp!99088 e!731312))))

(declare-datatypes ((V!49947 0))(
  ( (V!49948 (val!16891 Int)) )
))
(declare-datatypes ((ValueCell!15918 0))(
  ( (ValueCellFull!15918 (v!19491 V!49947)) (EmptyCell!15918) )
))
(declare-fun mapValue!52001 () ValueCell!15918)

(declare-fun mapKey!52001 () (_ BitVec 32))

(declare-fun mapRest!52001 () (Array (_ BitVec 32) ValueCell!15918))

(declare-datatypes ((array!84350 0))(
  ( (array!84351 (arr!40679 (Array (_ BitVec 32) ValueCell!15918)) (size!41229 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84350)

(assert (=> mapNonEmpty!52001 (= (arr!40679 _values!1445) (store mapRest!52001 mapKey!52001 mapValue!52001))))

(declare-fun mapIsEmpty!52001 () Bool)

(assert (=> mapIsEmpty!52001 mapRes!52001))

(declare-fun b!1279931 () Bool)

(declare-fun e!731314 () Bool)

(declare-fun e!731311 () Bool)

(assert (=> b!1279931 (= e!731314 (and e!731311 mapRes!52001))))

(declare-fun condMapEmpty!52001 () Bool)

(declare-fun mapDefault!52001 () ValueCell!15918)

(assert (=> b!1279931 (= condMapEmpty!52001 (= (arr!40679 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15918)) mapDefault!52001)))))

(declare-fun b!1279932 () Bool)

(declare-fun res!850219 () Bool)

(assert (=> b!1279932 (=> (not res!850219) (not e!731315))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279932 (= res!850219 (and (= (size!41229 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41228 _keys!1741) (size!41229 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279933 () Bool)

(declare-fun res!850217 () Bool)

(assert (=> b!1279933 (=> (not res!850217) (not e!731315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84348 (_ BitVec 32)) Bool)

(assert (=> b!1279933 (= res!850217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279934 () Bool)

(assert (=> b!1279934 (= e!731315 false)))

(declare-fun minValue!1387 () V!49947)

(declare-fun zeroValue!1387 () V!49947)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576062 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21612 0))(
  ( (tuple2!21613 (_1!10817 (_ BitVec 64)) (_2!10817 V!49947)) )
))
(declare-datatypes ((List!28812 0))(
  ( (Nil!28809) (Cons!28808 (h!30017 tuple2!21612) (t!42352 List!28812)) )
))
(declare-datatypes ((ListLongMap!19269 0))(
  ( (ListLongMap!19270 (toList!9650 List!28812)) )
))
(declare-fun contains!7765 (ListLongMap!19269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4734 (array!84348 array!84350 (_ BitVec 32) (_ BitVec 32) V!49947 V!49947 (_ BitVec 32) Int) ListLongMap!19269)

(assert (=> b!1279934 (= lt!576062 (contains!7765 (getCurrentListMap!4734 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!850216 () Bool)

(assert (=> start!108446 (=> (not res!850216) (not e!731315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108446 (= res!850216 (validMask!0 mask!2175))))

(assert (=> start!108446 e!731315))

(assert (=> start!108446 tp_is_empty!33633))

(assert (=> start!108446 true))

(declare-fun array_inv!30877 (array!84350) Bool)

(assert (=> start!108446 (and (array_inv!30877 _values!1445) e!731314)))

(declare-fun array_inv!30878 (array!84348) Bool)

(assert (=> start!108446 (array_inv!30878 _keys!1741)))

(assert (=> start!108446 tp!99089))

(declare-fun b!1279935 () Bool)

(declare-fun res!850218 () Bool)

(assert (=> b!1279935 (=> (not res!850218) (not e!731315))))

(declare-datatypes ((List!28813 0))(
  ( (Nil!28810) (Cons!28809 (h!30018 (_ BitVec 64)) (t!42353 List!28813)) )
))
(declare-fun arrayNoDuplicates!0 (array!84348 (_ BitVec 32) List!28813) Bool)

(assert (=> b!1279935 (= res!850218 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28810))))

(declare-fun b!1279936 () Bool)

(assert (=> b!1279936 (= e!731311 tp_is_empty!33633)))

(assert (= (and start!108446 res!850216) b!1279932))

(assert (= (and b!1279932 res!850219) b!1279933))

(assert (= (and b!1279933 res!850217) b!1279935))

(assert (= (and b!1279935 res!850218) b!1279929))

(assert (= (and b!1279929 res!850220) b!1279934))

(assert (= (and b!1279931 condMapEmpty!52001) mapIsEmpty!52001))

(assert (= (and b!1279931 (not condMapEmpty!52001)) mapNonEmpty!52001))

(get-info :version)

(assert (= (and mapNonEmpty!52001 ((_ is ValueCellFull!15918) mapValue!52001)) b!1279930))

(assert (= (and b!1279931 ((_ is ValueCellFull!15918) mapDefault!52001)) b!1279936))

(assert (= start!108446 b!1279931))

(declare-fun m!1174725 () Bool)

(assert (=> start!108446 m!1174725))

(declare-fun m!1174727 () Bool)

(assert (=> start!108446 m!1174727))

(declare-fun m!1174729 () Bool)

(assert (=> start!108446 m!1174729))

(declare-fun m!1174731 () Bool)

(assert (=> mapNonEmpty!52001 m!1174731))

(declare-fun m!1174733 () Bool)

(assert (=> b!1279934 m!1174733))

(assert (=> b!1279934 m!1174733))

(declare-fun m!1174735 () Bool)

(assert (=> b!1279934 m!1174735))

(declare-fun m!1174737 () Bool)

(assert (=> b!1279935 m!1174737))

(declare-fun m!1174739 () Bool)

(assert (=> b!1279933 m!1174739))

(check-sat (not b_next!27993) b_and!46053 (not mapNonEmpty!52001) (not b!1279933) (not start!108446) (not b!1279935) tp_is_empty!33633 (not b!1279934))
(check-sat b_and!46053 (not b_next!27993))
