; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108476 () Bool)

(assert start!108476)

(declare-fun b_free!28023 () Bool)

(declare-fun b_next!28023 () Bool)

(assert (=> start!108476 (= b_free!28023 (not b_next!28023))))

(declare-fun tp!99179 () Bool)

(declare-fun b_and!46083 () Bool)

(assert (=> start!108476 (= tp!99179 b_and!46083)))

(declare-fun b!1280289 () Bool)

(declare-fun res!850441 () Bool)

(declare-fun e!731539 () Bool)

(assert (=> b!1280289 (=> (not res!850441) (not e!731539))))

(declare-datatypes ((array!84404 0))(
  ( (array!84405 (arr!40706 (Array (_ BitVec 32) (_ BitVec 64))) (size!41256 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84404)

(declare-datatypes ((List!28835 0))(
  ( (Nil!28832) (Cons!28831 (h!30040 (_ BitVec 64)) (t!42375 List!28835)) )
))
(declare-fun arrayNoDuplicates!0 (array!84404 (_ BitVec 32) List!28835) Bool)

(assert (=> b!1280289 (= res!850441 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28832))))

(declare-fun b!1280290 () Bool)

(declare-fun e!731537 () Bool)

(declare-fun e!731538 () Bool)

(declare-fun mapRes!52046 () Bool)

(assert (=> b!1280290 (= e!731537 (and e!731538 mapRes!52046))))

(declare-fun condMapEmpty!52046 () Bool)

(declare-datatypes ((V!49987 0))(
  ( (V!49988 (val!16906 Int)) )
))
(declare-datatypes ((ValueCell!15933 0))(
  ( (ValueCellFull!15933 (v!19506 V!49987)) (EmptyCell!15933) )
))
(declare-datatypes ((array!84406 0))(
  ( (array!84407 (arr!40707 (Array (_ BitVec 32) ValueCell!15933)) (size!41257 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84406)

(declare-fun mapDefault!52046 () ValueCell!15933)

(assert (=> b!1280290 (= condMapEmpty!52046 (= (arr!40707 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15933)) mapDefault!52046)))))

(declare-fun b!1280291 () Bool)

(assert (=> b!1280291 (= e!731539 false)))

(declare-fun minValue!1387 () V!49987)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576107 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!49987)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21636 0))(
  ( (tuple2!21637 (_1!10829 (_ BitVec 64)) (_2!10829 V!49987)) )
))
(declare-datatypes ((List!28836 0))(
  ( (Nil!28833) (Cons!28832 (h!30041 tuple2!21636) (t!42376 List!28836)) )
))
(declare-datatypes ((ListLongMap!19293 0))(
  ( (ListLongMap!19294 (toList!9662 List!28836)) )
))
(declare-fun contains!7777 (ListLongMap!19293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4746 (array!84404 array!84406 (_ BitVec 32) (_ BitVec 32) V!49987 V!49987 (_ BitVec 32) Int) ListLongMap!19293)

(assert (=> b!1280291 (= lt!576107 (contains!7777 (getCurrentListMap!4746 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!850442 () Bool)

(assert (=> start!108476 (=> (not res!850442) (not e!731539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108476 (= res!850442 (validMask!0 mask!2175))))

(assert (=> start!108476 e!731539))

(declare-fun tp_is_empty!33663 () Bool)

(assert (=> start!108476 tp_is_empty!33663))

(assert (=> start!108476 true))

(declare-fun array_inv!30895 (array!84406) Bool)

(assert (=> start!108476 (and (array_inv!30895 _values!1445) e!731537)))

(declare-fun array_inv!30896 (array!84404) Bool)

(assert (=> start!108476 (array_inv!30896 _keys!1741)))

(assert (=> start!108476 tp!99179))

(declare-fun mapIsEmpty!52046 () Bool)

(assert (=> mapIsEmpty!52046 mapRes!52046))

(declare-fun b!1280292 () Bool)

(declare-fun res!850443 () Bool)

(assert (=> b!1280292 (=> (not res!850443) (not e!731539))))

(assert (=> b!1280292 (= res!850443 (and (= (size!41257 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41256 _keys!1741) (size!41257 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280293 () Bool)

(declare-fun e!731540 () Bool)

(assert (=> b!1280293 (= e!731540 tp_is_empty!33663)))

(declare-fun b!1280294 () Bool)

(declare-fun res!850445 () Bool)

(assert (=> b!1280294 (=> (not res!850445) (not e!731539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84404 (_ BitVec 32)) Bool)

(assert (=> b!1280294 (= res!850445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280295 () Bool)

(assert (=> b!1280295 (= e!731538 tp_is_empty!33663)))

(declare-fun b!1280296 () Bool)

(declare-fun res!850444 () Bool)

(assert (=> b!1280296 (=> (not res!850444) (not e!731539))))

(assert (=> b!1280296 (= res!850444 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41256 _keys!1741))))))

(declare-fun mapNonEmpty!52046 () Bool)

(declare-fun tp!99178 () Bool)

(assert (=> mapNonEmpty!52046 (= mapRes!52046 (and tp!99178 e!731540))))

(declare-fun mapValue!52046 () ValueCell!15933)

(declare-fun mapKey!52046 () (_ BitVec 32))

(declare-fun mapRest!52046 () (Array (_ BitVec 32) ValueCell!15933))

(assert (=> mapNonEmpty!52046 (= (arr!40707 _values!1445) (store mapRest!52046 mapKey!52046 mapValue!52046))))

(assert (= (and start!108476 res!850442) b!1280292))

(assert (= (and b!1280292 res!850443) b!1280294))

(assert (= (and b!1280294 res!850445) b!1280289))

(assert (= (and b!1280289 res!850441) b!1280296))

(assert (= (and b!1280296 res!850444) b!1280291))

(assert (= (and b!1280290 condMapEmpty!52046) mapIsEmpty!52046))

(assert (= (and b!1280290 (not condMapEmpty!52046)) mapNonEmpty!52046))

(get-info :version)

(assert (= (and mapNonEmpty!52046 ((_ is ValueCellFull!15933) mapValue!52046)) b!1280293))

(assert (= (and b!1280290 ((_ is ValueCellFull!15933) mapDefault!52046)) b!1280295))

(assert (= start!108476 b!1280290))

(declare-fun m!1174965 () Bool)

(assert (=> start!108476 m!1174965))

(declare-fun m!1174967 () Bool)

(assert (=> start!108476 m!1174967))

(declare-fun m!1174969 () Bool)

(assert (=> start!108476 m!1174969))

(declare-fun m!1174971 () Bool)

(assert (=> mapNonEmpty!52046 m!1174971))

(declare-fun m!1174973 () Bool)

(assert (=> b!1280289 m!1174973))

(declare-fun m!1174975 () Bool)

(assert (=> b!1280294 m!1174975))

(declare-fun m!1174977 () Bool)

(assert (=> b!1280291 m!1174977))

(assert (=> b!1280291 m!1174977))

(declare-fun m!1174979 () Bool)

(assert (=> b!1280291 m!1174979))

(check-sat (not b!1280294) (not b_next!28023) (not mapNonEmpty!52046) (not b!1280291) tp_is_empty!33663 (not start!108476) b_and!46083 (not b!1280289))
(check-sat b_and!46083 (not b_next!28023))
