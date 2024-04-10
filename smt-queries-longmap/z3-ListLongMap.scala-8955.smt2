; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108458 () Bool)

(assert start!108458)

(declare-fun b_free!28005 () Bool)

(declare-fun b_next!28005 () Bool)

(assert (=> start!108458 (= b_free!28005 (not b_next!28005))))

(declare-fun tp!99125 () Bool)

(declare-fun b_and!46065 () Bool)

(assert (=> start!108458 (= tp!99125 b_and!46065)))

(declare-fun b!1280073 () Bool)

(declare-fun res!850310 () Bool)

(declare-fun e!731405 () Bool)

(assert (=> b!1280073 (=> (not res!850310) (not e!731405))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84370 0))(
  ( (array!84371 (arr!40689 (Array (_ BitVec 32) (_ BitVec 64))) (size!41239 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84370)

(declare-datatypes ((V!49963 0))(
  ( (V!49964 (val!16897 Int)) )
))
(declare-datatypes ((ValueCell!15924 0))(
  ( (ValueCellFull!15924 (v!19497 V!49963)) (EmptyCell!15924) )
))
(declare-datatypes ((array!84372 0))(
  ( (array!84373 (arr!40690 (Array (_ BitVec 32) ValueCell!15924)) (size!41240 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84372)

(assert (=> b!1280073 (= res!850310 (and (= (size!41240 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41239 _keys!1741) (size!41240 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280074 () Bool)

(declare-fun res!850308 () Bool)

(assert (=> b!1280074 (=> (not res!850308) (not e!731405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84370 (_ BitVec 32)) Bool)

(assert (=> b!1280074 (= res!850308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52019 () Bool)

(declare-fun mapRes!52019 () Bool)

(declare-fun tp!99124 () Bool)

(declare-fun e!731403 () Bool)

(assert (=> mapNonEmpty!52019 (= mapRes!52019 (and tp!99124 e!731403))))

(declare-fun mapRest!52019 () (Array (_ BitVec 32) ValueCell!15924))

(declare-fun mapKey!52019 () (_ BitVec 32))

(declare-fun mapValue!52019 () ValueCell!15924)

(assert (=> mapNonEmpty!52019 (= (arr!40690 _values!1445) (store mapRest!52019 mapKey!52019 mapValue!52019))))

(declare-fun b!1280075 () Bool)

(assert (=> b!1280075 (= e!731405 false)))

(declare-fun minValue!1387 () V!49963)

(declare-fun zeroValue!1387 () V!49963)

(declare-fun lt!576080 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21622 0))(
  ( (tuple2!21623 (_1!10822 (_ BitVec 64)) (_2!10822 V!49963)) )
))
(declare-datatypes ((List!28821 0))(
  ( (Nil!28818) (Cons!28817 (h!30026 tuple2!21622) (t!42361 List!28821)) )
))
(declare-datatypes ((ListLongMap!19279 0))(
  ( (ListLongMap!19280 (toList!9655 List!28821)) )
))
(declare-fun contains!7770 (ListLongMap!19279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4739 (array!84370 array!84372 (_ BitVec 32) (_ BitVec 32) V!49963 V!49963 (_ BitVec 32) Int) ListLongMap!19279)

(assert (=> b!1280075 (= lt!576080 (contains!7770 (getCurrentListMap!4739 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280076 () Bool)

(declare-fun res!850307 () Bool)

(assert (=> b!1280076 (=> (not res!850307) (not e!731405))))

(assert (=> b!1280076 (= res!850307 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41239 _keys!1741))))))

(declare-fun b!1280077 () Bool)

(declare-fun res!850309 () Bool)

(assert (=> b!1280077 (=> (not res!850309) (not e!731405))))

(declare-datatypes ((List!28822 0))(
  ( (Nil!28819) (Cons!28818 (h!30027 (_ BitVec 64)) (t!42362 List!28822)) )
))
(declare-fun arrayNoDuplicates!0 (array!84370 (_ BitVec 32) List!28822) Bool)

(assert (=> b!1280077 (= res!850309 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28819))))

(declare-fun res!850306 () Bool)

(assert (=> start!108458 (=> (not res!850306) (not e!731405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108458 (= res!850306 (validMask!0 mask!2175))))

(assert (=> start!108458 e!731405))

(declare-fun tp_is_empty!33645 () Bool)

(assert (=> start!108458 tp_is_empty!33645))

(assert (=> start!108458 true))

(declare-fun e!731404 () Bool)

(declare-fun array_inv!30883 (array!84372) Bool)

(assert (=> start!108458 (and (array_inv!30883 _values!1445) e!731404)))

(declare-fun array_inv!30884 (array!84370) Bool)

(assert (=> start!108458 (array_inv!30884 _keys!1741)))

(assert (=> start!108458 tp!99125))

(declare-fun b!1280078 () Bool)

(assert (=> b!1280078 (= e!731403 tp_is_empty!33645)))

(declare-fun mapIsEmpty!52019 () Bool)

(assert (=> mapIsEmpty!52019 mapRes!52019))

(declare-fun b!1280079 () Bool)

(declare-fun e!731401 () Bool)

(assert (=> b!1280079 (= e!731401 tp_is_empty!33645)))

(declare-fun b!1280080 () Bool)

(assert (=> b!1280080 (= e!731404 (and e!731401 mapRes!52019))))

(declare-fun condMapEmpty!52019 () Bool)

(declare-fun mapDefault!52019 () ValueCell!15924)

(assert (=> b!1280080 (= condMapEmpty!52019 (= (arr!40690 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15924)) mapDefault!52019)))))

(assert (= (and start!108458 res!850306) b!1280073))

(assert (= (and b!1280073 res!850310) b!1280074))

(assert (= (and b!1280074 res!850308) b!1280077))

(assert (= (and b!1280077 res!850309) b!1280076))

(assert (= (and b!1280076 res!850307) b!1280075))

(assert (= (and b!1280080 condMapEmpty!52019) mapIsEmpty!52019))

(assert (= (and b!1280080 (not condMapEmpty!52019)) mapNonEmpty!52019))

(get-info :version)

(assert (= (and mapNonEmpty!52019 ((_ is ValueCellFull!15924) mapValue!52019)) b!1280078))

(assert (= (and b!1280080 ((_ is ValueCellFull!15924) mapDefault!52019)) b!1280079))

(assert (= start!108458 b!1280080))

(declare-fun m!1174821 () Bool)

(assert (=> start!108458 m!1174821))

(declare-fun m!1174823 () Bool)

(assert (=> start!108458 m!1174823))

(declare-fun m!1174825 () Bool)

(assert (=> start!108458 m!1174825))

(declare-fun m!1174827 () Bool)

(assert (=> b!1280077 m!1174827))

(declare-fun m!1174829 () Bool)

(assert (=> mapNonEmpty!52019 m!1174829))

(declare-fun m!1174831 () Bool)

(assert (=> b!1280074 m!1174831))

(declare-fun m!1174833 () Bool)

(assert (=> b!1280075 m!1174833))

(assert (=> b!1280075 m!1174833))

(declare-fun m!1174835 () Bool)

(assert (=> b!1280075 m!1174835))

(check-sat tp_is_empty!33645 (not b_next!28005) (not start!108458) (not b!1280077) (not mapNonEmpty!52019) b_and!46065 (not b!1280075) (not b!1280074))
(check-sat b_and!46065 (not b_next!28005))
