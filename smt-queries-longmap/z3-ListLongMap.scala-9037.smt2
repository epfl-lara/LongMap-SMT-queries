; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109230 () Bool)

(assert start!109230)

(declare-fun b_free!28495 () Bool)

(declare-fun b_next!28495 () Bool)

(assert (=> start!109230 (= b_free!28495 (not b_next!28495))))

(declare-fun tp!100604 () Bool)

(declare-fun b_and!46587 () Bool)

(assert (=> start!109230 (= tp!100604 b_and!46587)))

(declare-fun mapNonEmpty!52763 () Bool)

(declare-fun mapRes!52763 () Bool)

(declare-fun tp!100603 () Bool)

(declare-fun e!736440 () Bool)

(assert (=> mapNonEmpty!52763 (= mapRes!52763 (and tp!100603 e!736440))))

(declare-datatypes ((V!50617 0))(
  ( (V!50618 (val!17142 Int)) )
))
(declare-datatypes ((ValueCell!16169 0))(
  ( (ValueCellFull!16169 (v!19740 V!50617)) (EmptyCell!16169) )
))
(declare-fun mapValue!52763 () ValueCell!16169)

(declare-fun mapRest!52763 () (Array (_ BitVec 32) ValueCell!16169))

(declare-fun mapKey!52763 () (_ BitVec 32))

(declare-datatypes ((array!85351 0))(
  ( (array!85352 (arr!41172 (Array (_ BitVec 32) ValueCell!16169)) (size!41723 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85351)

(assert (=> mapNonEmpty!52763 (= (arr!41172 _values!1445) (store mapRest!52763 mapKey!52763 mapValue!52763))))

(declare-fun b!1289498 () Bool)

(declare-fun res!856111 () Bool)

(declare-fun e!736439 () Bool)

(assert (=> b!1289498 (=> (not res!856111) (not e!736439))))

(declare-datatypes ((array!85353 0))(
  ( (array!85354 (arr!41173 (Array (_ BitVec 32) (_ BitVec 64))) (size!41724 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85353)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289498 (= res!856111 (not (validKeyInArray!0 (select (arr!41173 _keys!1741) from!2144))))))

(declare-fun res!856106 () Bool)

(assert (=> start!109230 (=> (not res!856106) (not e!736439))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109230 (= res!856106 (validMask!0 mask!2175))))

(assert (=> start!109230 e!736439))

(declare-fun tp_is_empty!34135 () Bool)

(assert (=> start!109230 tp_is_empty!34135))

(assert (=> start!109230 true))

(declare-fun e!736438 () Bool)

(declare-fun array_inv!31425 (array!85351) Bool)

(assert (=> start!109230 (and (array_inv!31425 _values!1445) e!736438)))

(declare-fun array_inv!31426 (array!85353) Bool)

(assert (=> start!109230 (array_inv!31426 _keys!1741)))

(assert (=> start!109230 tp!100604))

(declare-fun b!1289499 () Bool)

(declare-fun e!736442 () Bool)

(assert (=> b!1289499 (= e!736442 tp_is_empty!34135)))

(declare-fun b!1289500 () Bool)

(assert (=> b!1289500 (= e!736440 tp_is_empty!34135)))

(declare-fun b!1289501 () Bool)

(declare-fun res!856109 () Bool)

(assert (=> b!1289501 (=> (not res!856109) (not e!736439))))

(assert (=> b!1289501 (= res!856109 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41724 _keys!1741))))))

(declare-fun b!1289502 () Bool)

(declare-fun res!856110 () Bool)

(assert (=> b!1289502 (=> (not res!856110) (not e!736439))))

(declare-datatypes ((List!29204 0))(
  ( (Nil!29201) (Cons!29200 (h!30418 (_ BitVec 64)) (t!42760 List!29204)) )
))
(declare-fun arrayNoDuplicates!0 (array!85353 (_ BitVec 32) List!29204) Bool)

(assert (=> b!1289502 (= res!856110 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29201))))

(declare-fun mapIsEmpty!52763 () Bool)

(assert (=> mapIsEmpty!52763 mapRes!52763))

(declare-fun b!1289503 () Bool)

(declare-fun res!856103 () Bool)

(assert (=> b!1289503 (=> (not res!856103) (not e!736439))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289503 (= res!856103 (and (= (size!41723 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41724 _keys!1741) (size!41723 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289504 () Bool)

(declare-fun res!856108 () Bool)

(assert (=> b!1289504 (=> (not res!856108) (not e!736439))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1289504 (= res!856108 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41724 _keys!1741))))))

(declare-fun b!1289505 () Bool)

(declare-fun res!856105 () Bool)

(assert (=> b!1289505 (=> (not res!856105) (not e!736439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85353 (_ BitVec 32)) Bool)

(assert (=> b!1289505 (= res!856105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289506 () Bool)

(assert (=> b!1289506 (= e!736438 (and e!736442 mapRes!52763))))

(declare-fun condMapEmpty!52763 () Bool)

(declare-fun mapDefault!52763 () ValueCell!16169)

(assert (=> b!1289506 (= condMapEmpty!52763 (= (arr!41172 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16169)) mapDefault!52763)))))

(declare-fun b!1289507 () Bool)

(declare-fun e!736443 () Bool)

(assert (=> b!1289507 (= e!736439 (not e!736443))))

(declare-fun res!856107 () Bool)

(assert (=> b!1289507 (=> res!856107 e!736443)))

(assert (=> b!1289507 (= res!856107 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22016 0))(
  ( (tuple2!22017 (_1!11019 (_ BitVec 64)) (_2!11019 V!50617)) )
))
(declare-datatypes ((List!29205 0))(
  ( (Nil!29202) (Cons!29201 (h!30419 tuple2!22016) (t!42761 List!29205)) )
))
(declare-datatypes ((ListLongMap!19681 0))(
  ( (ListLongMap!19682 (toList!9856 List!29205)) )
))
(declare-fun contains!7987 (ListLongMap!19681 (_ BitVec 64)) Bool)

(assert (=> b!1289507 (not (contains!7987 (ListLongMap!19682 Nil!29202) k0!1205))))

(declare-datatypes ((Unit!42565 0))(
  ( (Unit!42566) )
))
(declare-fun lt!578420 () Unit!42565)

(declare-fun emptyContainsNothing!36 ((_ BitVec 64)) Unit!42565)

(assert (=> b!1289507 (= lt!578420 (emptyContainsNothing!36 k0!1205))))

(declare-fun b!1289508 () Bool)

(assert (=> b!1289508 (= e!736443 true)))

(declare-fun minValue!1387 () V!50617)

(declare-fun zeroValue!1387 () V!50617)

(declare-fun lt!578421 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6003 (array!85353 array!85351 (_ BitVec 32) (_ BitVec 32) V!50617 V!50617 (_ BitVec 32) Int) ListLongMap!19681)

(assert (=> b!1289508 (= lt!578421 (contains!7987 (getCurrentListMapNoExtraKeys!6003 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289509 () Bool)

(declare-fun res!856104 () Bool)

(assert (=> b!1289509 (=> (not res!856104) (not e!736439))))

(declare-fun getCurrentListMap!4906 (array!85353 array!85351 (_ BitVec 32) (_ BitVec 32) V!50617 V!50617 (_ BitVec 32) Int) ListLongMap!19681)

(assert (=> b!1289509 (= res!856104 (contains!7987 (getCurrentListMap!4906 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109230 res!856106) b!1289503))

(assert (= (and b!1289503 res!856103) b!1289505))

(assert (= (and b!1289505 res!856105) b!1289502))

(assert (= (and b!1289502 res!856110) b!1289501))

(assert (= (and b!1289501 res!856109) b!1289509))

(assert (= (and b!1289509 res!856104) b!1289504))

(assert (= (and b!1289504 res!856108) b!1289498))

(assert (= (and b!1289498 res!856111) b!1289507))

(assert (= (and b!1289507 (not res!856107)) b!1289508))

(assert (= (and b!1289506 condMapEmpty!52763) mapIsEmpty!52763))

(assert (= (and b!1289506 (not condMapEmpty!52763)) mapNonEmpty!52763))

(get-info :version)

(assert (= (and mapNonEmpty!52763 ((_ is ValueCellFull!16169) mapValue!52763)) b!1289500))

(assert (= (and b!1289506 ((_ is ValueCellFull!16169) mapDefault!52763)) b!1289499))

(assert (= start!109230 b!1289506))

(declare-fun m!1182465 () Bool)

(assert (=> mapNonEmpty!52763 m!1182465))

(declare-fun m!1182467 () Bool)

(assert (=> b!1289507 m!1182467))

(declare-fun m!1182469 () Bool)

(assert (=> b!1289507 m!1182469))

(declare-fun m!1182471 () Bool)

(assert (=> b!1289502 m!1182471))

(declare-fun m!1182473 () Bool)

(assert (=> b!1289505 m!1182473))

(declare-fun m!1182475 () Bool)

(assert (=> start!109230 m!1182475))

(declare-fun m!1182477 () Bool)

(assert (=> start!109230 m!1182477))

(declare-fun m!1182479 () Bool)

(assert (=> start!109230 m!1182479))

(declare-fun m!1182481 () Bool)

(assert (=> b!1289508 m!1182481))

(assert (=> b!1289508 m!1182481))

(declare-fun m!1182483 () Bool)

(assert (=> b!1289508 m!1182483))

(declare-fun m!1182485 () Bool)

(assert (=> b!1289509 m!1182485))

(assert (=> b!1289509 m!1182485))

(declare-fun m!1182487 () Bool)

(assert (=> b!1289509 m!1182487))

(declare-fun m!1182489 () Bool)

(assert (=> b!1289498 m!1182489))

(assert (=> b!1289498 m!1182489))

(declare-fun m!1182491 () Bool)

(assert (=> b!1289498 m!1182491))

(check-sat (not b_next!28495) (not b!1289498) (not b!1289505) b_and!46587 (not b!1289507) (not b!1289508) (not start!109230) tp_is_empty!34135 (not b!1289502) (not b!1289509) (not mapNonEmpty!52763))
(check-sat b_and!46587 (not b_next!28495))
