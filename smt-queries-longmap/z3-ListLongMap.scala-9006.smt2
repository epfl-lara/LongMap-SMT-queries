; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108798 () Bool)

(assert start!108798)

(declare-fun b_free!28311 () Bool)

(declare-fun b_next!28311 () Bool)

(assert (=> start!108798 (= b_free!28311 (not b_next!28311))))

(declare-fun tp!100048 () Bool)

(declare-fun b_and!46377 () Bool)

(assert (=> start!108798 (= tp!100048 b_and!46377)))

(declare-fun b!1284764 () Bool)

(declare-fun res!853474 () Bool)

(declare-fun e!733895 () Bool)

(assert (=> b!1284764 (=> (not res!853474) (not e!733895))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50371 0))(
  ( (V!50372 (val!17050 Int)) )
))
(declare-datatypes ((ValueCell!16077 0))(
  ( (ValueCellFull!16077 (v!19652 V!50371)) (EmptyCell!16077) )
))
(declare-datatypes ((array!84960 0))(
  ( (array!84961 (arr!40982 (Array (_ BitVec 32) ValueCell!16077)) (size!41532 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84960)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84962 0))(
  ( (array!84963 (arr!40983 (Array (_ BitVec 32) (_ BitVec 64))) (size!41533 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84962)

(assert (=> b!1284764 (= res!853474 (and (= (size!41532 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41533 _keys!1741) (size!41532 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284765 () Bool)

(assert (=> b!1284765 (= e!733895 false)))

(declare-fun minValue!1387 () V!50371)

(declare-fun zeroValue!1387 () V!50371)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576853 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21846 0))(
  ( (tuple2!21847 (_1!10934 (_ BitVec 64)) (_2!10934 V!50371)) )
))
(declare-datatypes ((List!29040 0))(
  ( (Nil!29037) (Cons!29036 (h!30245 tuple2!21846) (t!42584 List!29040)) )
))
(declare-datatypes ((ListLongMap!19503 0))(
  ( (ListLongMap!19504 (toList!9767 List!29040)) )
))
(declare-fun contains!7884 (ListLongMap!19503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4846 (array!84962 array!84960 (_ BitVec 32) (_ BitVec 32) V!50371 V!50371 (_ BitVec 32) Int) ListLongMap!19503)

(assert (=> b!1284765 (= lt!576853 (contains!7884 (getCurrentListMap!4846 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52484 () Bool)

(declare-fun mapRes!52484 () Bool)

(declare-fun tp!100049 () Bool)

(declare-fun e!733892 () Bool)

(assert (=> mapNonEmpty!52484 (= mapRes!52484 (and tp!100049 e!733892))))

(declare-fun mapKey!52484 () (_ BitVec 32))

(declare-fun mapRest!52484 () (Array (_ BitVec 32) ValueCell!16077))

(declare-fun mapValue!52484 () ValueCell!16077)

(assert (=> mapNonEmpty!52484 (= (arr!40982 _values!1445) (store mapRest!52484 mapKey!52484 mapValue!52484))))

(declare-fun b!1284766 () Bool)

(declare-fun res!853475 () Bool)

(assert (=> b!1284766 (=> (not res!853475) (not e!733895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84962 (_ BitVec 32)) Bool)

(assert (=> b!1284766 (= res!853475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284767 () Bool)

(declare-fun e!733891 () Bool)

(declare-fun tp_is_empty!33951 () Bool)

(assert (=> b!1284767 (= e!733891 tp_is_empty!33951)))

(declare-fun b!1284768 () Bool)

(assert (=> b!1284768 (= e!733892 tp_is_empty!33951)))

(declare-fun mapIsEmpty!52484 () Bool)

(assert (=> mapIsEmpty!52484 mapRes!52484))

(declare-fun res!853472 () Bool)

(assert (=> start!108798 (=> (not res!853472) (not e!733895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108798 (= res!853472 (validMask!0 mask!2175))))

(assert (=> start!108798 e!733895))

(assert (=> start!108798 tp_is_empty!33951))

(assert (=> start!108798 true))

(declare-fun e!733894 () Bool)

(declare-fun array_inv!31083 (array!84960) Bool)

(assert (=> start!108798 (and (array_inv!31083 _values!1445) e!733894)))

(declare-fun array_inv!31084 (array!84962) Bool)

(assert (=> start!108798 (array_inv!31084 _keys!1741)))

(assert (=> start!108798 tp!100048))

(declare-fun b!1284769 () Bool)

(declare-fun res!853473 () Bool)

(assert (=> b!1284769 (=> (not res!853473) (not e!733895))))

(assert (=> b!1284769 (= res!853473 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41533 _keys!1741))))))

(declare-fun b!1284770 () Bool)

(assert (=> b!1284770 (= e!733894 (and e!733891 mapRes!52484))))

(declare-fun condMapEmpty!52484 () Bool)

(declare-fun mapDefault!52484 () ValueCell!16077)

(assert (=> b!1284770 (= condMapEmpty!52484 (= (arr!40982 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16077)) mapDefault!52484)))))

(declare-fun b!1284771 () Bool)

(declare-fun res!853476 () Bool)

(assert (=> b!1284771 (=> (not res!853476) (not e!733895))))

(declare-datatypes ((List!29041 0))(
  ( (Nil!29038) (Cons!29037 (h!30246 (_ BitVec 64)) (t!42585 List!29041)) )
))
(declare-fun arrayNoDuplicates!0 (array!84962 (_ BitVec 32) List!29041) Bool)

(assert (=> b!1284771 (= res!853476 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29038))))

(assert (= (and start!108798 res!853472) b!1284764))

(assert (= (and b!1284764 res!853474) b!1284766))

(assert (= (and b!1284766 res!853475) b!1284771))

(assert (= (and b!1284771 res!853476) b!1284769))

(assert (= (and b!1284769 res!853473) b!1284765))

(assert (= (and b!1284770 condMapEmpty!52484) mapIsEmpty!52484))

(assert (= (and b!1284770 (not condMapEmpty!52484)) mapNonEmpty!52484))

(get-info :version)

(assert (= (and mapNonEmpty!52484 ((_ is ValueCellFull!16077) mapValue!52484)) b!1284768))

(assert (= (and b!1284770 ((_ is ValueCellFull!16077) mapDefault!52484)) b!1284767))

(assert (= start!108798 b!1284770))

(declare-fun m!1178341 () Bool)

(assert (=> b!1284771 m!1178341))

(declare-fun m!1178343 () Bool)

(assert (=> start!108798 m!1178343))

(declare-fun m!1178345 () Bool)

(assert (=> start!108798 m!1178345))

(declare-fun m!1178347 () Bool)

(assert (=> start!108798 m!1178347))

(declare-fun m!1178349 () Bool)

(assert (=> mapNonEmpty!52484 m!1178349))

(declare-fun m!1178351 () Bool)

(assert (=> b!1284765 m!1178351))

(assert (=> b!1284765 m!1178351))

(declare-fun m!1178353 () Bool)

(assert (=> b!1284765 m!1178353))

(declare-fun m!1178355 () Bool)

(assert (=> b!1284766 m!1178355))

(check-sat tp_is_empty!33951 b_and!46377 (not b!1284765) (not b!1284766) (not b!1284771) (not start!108798) (not mapNonEmpty!52484) (not b_next!28311))
(check-sat b_and!46377 (not b_next!28311))
