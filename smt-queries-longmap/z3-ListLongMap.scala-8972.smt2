; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108560 () Bool)

(assert start!108560)

(declare-fun b_free!28107 () Bool)

(declare-fun b_next!28107 () Bool)

(assert (=> start!108560 (= b_free!28107 (not b_next!28107))))

(declare-fun tp!99430 () Bool)

(declare-fun b_and!46167 () Bool)

(assert (=> start!108560 (= tp!99430 b_and!46167)))

(declare-fun mapIsEmpty!52172 () Bool)

(declare-fun mapRes!52172 () Bool)

(assert (=> mapIsEmpty!52172 mapRes!52172))

(declare-fun b!1281519 () Bool)

(declare-fun res!851297 () Bool)

(declare-fun e!732183 () Bool)

(assert (=> b!1281519 (=> (not res!851297) (not e!732183))))

(declare-datatypes ((array!84564 0))(
  ( (array!84565 (arr!40786 (Array (_ BitVec 32) (_ BitVec 64))) (size!41336 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84564)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84564 (_ BitVec 32)) Bool)

(assert (=> b!1281519 (= res!851297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281520 () Bool)

(declare-fun res!851294 () Bool)

(assert (=> b!1281520 (=> (not res!851294) (not e!732183))))

(declare-datatypes ((V!50099 0))(
  ( (V!50100 (val!16948 Int)) )
))
(declare-datatypes ((ValueCell!15975 0))(
  ( (ValueCellFull!15975 (v!19548 V!50099)) (EmptyCell!15975) )
))
(declare-datatypes ((array!84566 0))(
  ( (array!84567 (arr!40787 (Array (_ BitVec 32) ValueCell!15975)) (size!41337 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84566)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281520 (= res!851294 (and (= (size!41337 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41336 _keys!1741) (size!41337 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281521 () Bool)

(declare-fun res!851295 () Bool)

(assert (=> b!1281521 (=> (not res!851295) (not e!732183))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281521 (= res!851295 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41336 _keys!1741)) (not (= (select (arr!40786 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281522 () Bool)

(declare-fun e!732185 () Bool)

(assert (=> b!1281522 (= e!732183 (not e!732185))))

(declare-fun res!851296 () Bool)

(assert (=> b!1281522 (=> res!851296 e!732185)))

(assert (=> b!1281522 (= res!851296 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!50099)

(declare-fun zeroValue!1387 () V!50099)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21702 0))(
  ( (tuple2!21703 (_1!10862 (_ BitVec 64)) (_2!10862 V!50099)) )
))
(declare-datatypes ((List!28894 0))(
  ( (Nil!28891) (Cons!28890 (h!30099 tuple2!21702) (t!42434 List!28894)) )
))
(declare-datatypes ((ListLongMap!19359 0))(
  ( (ListLongMap!19360 (toList!9695 List!28894)) )
))
(declare-fun contains!7810 (ListLongMap!19359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4779 (array!84564 array!84566 (_ BitVec 32) (_ BitVec 32) V!50099 V!50099 (_ BitVec 32) Int) ListLongMap!19359)

(assert (=> b!1281522 (contains!7810 (getCurrentListMap!4779 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42447 0))(
  ( (Unit!42448) )
))
(declare-fun lt!576247 () Unit!42447)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!28 (array!84564 array!84566 (_ BitVec 32) (_ BitVec 32) V!50099 V!50099 (_ BitVec 64) (_ BitVec 32) Int) Unit!42447)

(assert (=> b!1281522 (= lt!576247 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!28 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281523 () Bool)

(declare-fun e!732181 () Bool)

(declare-fun tp_is_empty!33747 () Bool)

(assert (=> b!1281523 (= e!732181 tp_is_empty!33747)))

(declare-fun b!1281524 () Bool)

(declare-fun res!851298 () Bool)

(assert (=> b!1281524 (=> (not res!851298) (not e!732183))))

(assert (=> b!1281524 (= res!851298 (contains!7810 (getCurrentListMap!4779 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!851300 () Bool)

(assert (=> start!108560 (=> (not res!851300) (not e!732183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108560 (= res!851300 (validMask!0 mask!2175))))

(assert (=> start!108560 e!732183))

(assert (=> start!108560 tp_is_empty!33747))

(assert (=> start!108560 true))

(declare-fun e!732184 () Bool)

(declare-fun array_inv!30949 (array!84566) Bool)

(assert (=> start!108560 (and (array_inv!30949 _values!1445) e!732184)))

(declare-fun array_inv!30950 (array!84564) Bool)

(assert (=> start!108560 (array_inv!30950 _keys!1741)))

(assert (=> start!108560 tp!99430))

(declare-fun b!1281525 () Bool)

(assert (=> b!1281525 (= e!732184 (and e!732181 mapRes!52172))))

(declare-fun condMapEmpty!52172 () Bool)

(declare-fun mapDefault!52172 () ValueCell!15975)

(assert (=> b!1281525 (= condMapEmpty!52172 (= (arr!40787 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15975)) mapDefault!52172)))))

(declare-fun mapNonEmpty!52172 () Bool)

(declare-fun tp!99431 () Bool)

(declare-fun e!732182 () Bool)

(assert (=> mapNonEmpty!52172 (= mapRes!52172 (and tp!99431 e!732182))))

(declare-fun mapValue!52172 () ValueCell!15975)

(declare-fun mapKey!52172 () (_ BitVec 32))

(declare-fun mapRest!52172 () (Array (_ BitVec 32) ValueCell!15975))

(assert (=> mapNonEmpty!52172 (= (arr!40787 _values!1445) (store mapRest!52172 mapKey!52172 mapValue!52172))))

(declare-fun b!1281526 () Bool)

(declare-fun res!851293 () Bool)

(assert (=> b!1281526 (=> (not res!851293) (not e!732183))))

(declare-datatypes ((List!28895 0))(
  ( (Nil!28892) (Cons!28891 (h!30100 (_ BitVec 64)) (t!42435 List!28895)) )
))
(declare-fun arrayNoDuplicates!0 (array!84564 (_ BitVec 32) List!28895) Bool)

(assert (=> b!1281526 (= res!851293 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28892))))

(declare-fun b!1281527 () Bool)

(declare-fun res!851299 () Bool)

(assert (=> b!1281527 (=> (not res!851299) (not e!732183))))

(assert (=> b!1281527 (= res!851299 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41336 _keys!1741))))))

(declare-fun b!1281528 () Bool)

(assert (=> b!1281528 (= e!732185 true)))

(declare-fun arrayContainsKey!0 (array!84564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281528 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576248 () Unit!42447)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!635 (array!84564 array!84566 (_ BitVec 32) (_ BitVec 32) V!50099 V!50099 (_ BitVec 64) (_ BitVec 32) Int) Unit!42447)

(assert (=> b!1281528 (= lt!576248 (lemmaListMapContainsThenArrayContainsFrom!635 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281529 () Bool)

(assert (=> b!1281529 (= e!732182 tp_is_empty!33747)))

(assert (= (and start!108560 res!851300) b!1281520))

(assert (= (and b!1281520 res!851294) b!1281519))

(assert (= (and b!1281519 res!851297) b!1281526))

(assert (= (and b!1281526 res!851293) b!1281527))

(assert (= (and b!1281527 res!851299) b!1281524))

(assert (= (and b!1281524 res!851298) b!1281521))

(assert (= (and b!1281521 res!851295) b!1281522))

(assert (= (and b!1281522 (not res!851296)) b!1281528))

(assert (= (and b!1281525 condMapEmpty!52172) mapIsEmpty!52172))

(assert (= (and b!1281525 (not condMapEmpty!52172)) mapNonEmpty!52172))

(get-info :version)

(assert (= (and mapNonEmpty!52172 ((_ is ValueCellFull!15975) mapValue!52172)) b!1281529))

(assert (= (and b!1281525 ((_ is ValueCellFull!15975) mapDefault!52172)) b!1281523))

(assert (= start!108560 b!1281525))

(declare-fun m!1175925 () Bool)

(assert (=> start!108560 m!1175925))

(declare-fun m!1175927 () Bool)

(assert (=> start!108560 m!1175927))

(declare-fun m!1175929 () Bool)

(assert (=> start!108560 m!1175929))

(declare-fun m!1175931 () Bool)

(assert (=> b!1281524 m!1175931))

(assert (=> b!1281524 m!1175931))

(declare-fun m!1175933 () Bool)

(assert (=> b!1281524 m!1175933))

(declare-fun m!1175935 () Bool)

(assert (=> b!1281528 m!1175935))

(declare-fun m!1175937 () Bool)

(assert (=> b!1281528 m!1175937))

(declare-fun m!1175939 () Bool)

(assert (=> b!1281526 m!1175939))

(declare-fun m!1175941 () Bool)

(assert (=> mapNonEmpty!52172 m!1175941))

(declare-fun m!1175943 () Bool)

(assert (=> b!1281522 m!1175943))

(assert (=> b!1281522 m!1175943))

(declare-fun m!1175945 () Bool)

(assert (=> b!1281522 m!1175945))

(declare-fun m!1175947 () Bool)

(assert (=> b!1281522 m!1175947))

(declare-fun m!1175949 () Bool)

(assert (=> b!1281519 m!1175949))

(declare-fun m!1175951 () Bool)

(assert (=> b!1281521 m!1175951))

(check-sat tp_is_empty!33747 (not mapNonEmpty!52172) (not b!1281519) (not b!1281522) (not start!108560) (not b!1281526) (not b_next!28107) (not b!1281524) (not b!1281528) b_and!46167)
(check-sat b_and!46167 (not b_next!28107))
