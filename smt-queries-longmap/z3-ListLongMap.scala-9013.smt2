; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109062 () Bool)

(assert start!109062)

(declare-fun b_free!28351 () Bool)

(declare-fun b_next!28351 () Bool)

(assert (=> start!109062 (= b_free!28351 (not b_next!28351))))

(declare-fun tp!100168 () Bool)

(declare-fun b_and!46419 () Bool)

(assert (=> start!109062 (= tp!100168 b_and!46419)))

(declare-fun b!1286648 () Bool)

(declare-fun e!735042 () Bool)

(declare-fun tp_is_empty!33991 () Bool)

(assert (=> b!1286648 (= e!735042 tp_is_empty!33991)))

(declare-fun res!854395 () Bool)

(declare-fun e!735041 () Bool)

(assert (=> start!109062 (=> (not res!854395) (not e!735041))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109062 (= res!854395 (validMask!0 mask!2175))))

(assert (=> start!109062 e!735041))

(assert (=> start!109062 tp_is_empty!33991))

(assert (=> start!109062 true))

(declare-datatypes ((V!50425 0))(
  ( (V!50426 (val!17070 Int)) )
))
(declare-datatypes ((ValueCell!16097 0))(
  ( (ValueCellFull!16097 (v!19667 V!50425)) (EmptyCell!16097) )
))
(declare-datatypes ((array!85067 0))(
  ( (array!85068 (arr!41031 (Array (_ BitVec 32) ValueCell!16097)) (size!41582 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85067)

(declare-fun e!735039 () Bool)

(declare-fun array_inv!31331 (array!85067) Bool)

(assert (=> start!109062 (and (array_inv!31331 _values!1445) e!735039)))

(declare-datatypes ((array!85069 0))(
  ( (array!85070 (arr!41032 (Array (_ BitVec 32) (_ BitVec 64))) (size!41583 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85069)

(declare-fun array_inv!31332 (array!85069) Bool)

(assert (=> start!109062 (array_inv!31332 _keys!1741)))

(assert (=> start!109062 tp!100168))

(declare-fun b!1286649 () Bool)

(assert (=> b!1286649 (= e!735041 false)))

(declare-fun minValue!1387 () V!50425)

(declare-fun zeroValue!1387 () V!50425)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577388 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21902 0))(
  ( (tuple2!21903 (_1!10962 (_ BitVec 64)) (_2!10962 V!50425)) )
))
(declare-datatypes ((List!29102 0))(
  ( (Nil!29099) (Cons!29098 (h!30316 tuple2!21902) (t!42638 List!29102)) )
))
(declare-datatypes ((ListLongMap!19567 0))(
  ( (ListLongMap!19568 (toList!9799 List!29102)) )
))
(declare-fun contains!7930 (ListLongMap!19567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4863 (array!85069 array!85067 (_ BitVec 32) (_ BitVec 32) V!50425 V!50425 (_ BitVec 32) Int) ListLongMap!19567)

(assert (=> b!1286649 (= lt!577388 (contains!7930 (getCurrentListMap!4863 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286650 () Bool)

(declare-fun res!854392 () Bool)

(assert (=> b!1286650 (=> (not res!854392) (not e!735041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85069 (_ BitVec 32)) Bool)

(assert (=> b!1286650 (= res!854392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286651 () Bool)

(declare-fun res!854391 () Bool)

(assert (=> b!1286651 (=> (not res!854391) (not e!735041))))

(assert (=> b!1286651 (= res!854391 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41583 _keys!1741))))))

(declare-fun b!1286652 () Bool)

(declare-fun e!735040 () Bool)

(assert (=> b!1286652 (= e!735040 tp_is_empty!33991)))

(declare-fun b!1286653 () Bool)

(declare-fun mapRes!52544 () Bool)

(assert (=> b!1286653 (= e!735039 (and e!735042 mapRes!52544))))

(declare-fun condMapEmpty!52544 () Bool)

(declare-fun mapDefault!52544 () ValueCell!16097)

(assert (=> b!1286653 (= condMapEmpty!52544 (= (arr!41031 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16097)) mapDefault!52544)))))

(declare-fun mapNonEmpty!52544 () Bool)

(declare-fun tp!100169 () Bool)

(assert (=> mapNonEmpty!52544 (= mapRes!52544 (and tp!100169 e!735040))))

(declare-fun mapRest!52544 () (Array (_ BitVec 32) ValueCell!16097))

(declare-fun mapValue!52544 () ValueCell!16097)

(declare-fun mapKey!52544 () (_ BitVec 32))

(assert (=> mapNonEmpty!52544 (= (arr!41031 _values!1445) (store mapRest!52544 mapKey!52544 mapValue!52544))))

(declare-fun b!1286654 () Bool)

(declare-fun res!854394 () Bool)

(assert (=> b!1286654 (=> (not res!854394) (not e!735041))))

(declare-datatypes ((List!29103 0))(
  ( (Nil!29100) (Cons!29099 (h!30317 (_ BitVec 64)) (t!42639 List!29103)) )
))
(declare-fun arrayNoDuplicates!0 (array!85069 (_ BitVec 32) List!29103) Bool)

(assert (=> b!1286654 (= res!854394 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29100))))

(declare-fun mapIsEmpty!52544 () Bool)

(assert (=> mapIsEmpty!52544 mapRes!52544))

(declare-fun b!1286655 () Bool)

(declare-fun res!854393 () Bool)

(assert (=> b!1286655 (=> (not res!854393) (not e!735041))))

(assert (=> b!1286655 (= res!854393 (and (= (size!41582 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41583 _keys!1741) (size!41582 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109062 res!854395) b!1286655))

(assert (= (and b!1286655 res!854393) b!1286650))

(assert (= (and b!1286650 res!854392) b!1286654))

(assert (= (and b!1286654 res!854394) b!1286651))

(assert (= (and b!1286651 res!854391) b!1286649))

(assert (= (and b!1286653 condMapEmpty!52544) mapIsEmpty!52544))

(assert (= (and b!1286653 (not condMapEmpty!52544)) mapNonEmpty!52544))

(get-info :version)

(assert (= (and mapNonEmpty!52544 ((_ is ValueCellFull!16097) mapValue!52544)) b!1286652))

(assert (= (and b!1286653 ((_ is ValueCellFull!16097) mapDefault!52544)) b!1286648))

(assert (= start!109062 b!1286653))

(declare-fun m!1180345 () Bool)

(assert (=> b!1286654 m!1180345))

(declare-fun m!1180347 () Bool)

(assert (=> mapNonEmpty!52544 m!1180347))

(declare-fun m!1180349 () Bool)

(assert (=> b!1286649 m!1180349))

(assert (=> b!1286649 m!1180349))

(declare-fun m!1180351 () Bool)

(assert (=> b!1286649 m!1180351))

(declare-fun m!1180353 () Bool)

(assert (=> b!1286650 m!1180353))

(declare-fun m!1180355 () Bool)

(assert (=> start!109062 m!1180355))

(declare-fun m!1180357 () Bool)

(assert (=> start!109062 m!1180357))

(declare-fun m!1180359 () Bool)

(assert (=> start!109062 m!1180359))

(check-sat (not b!1286650) (not b!1286649) (not b!1286654) (not mapNonEmpty!52544) b_and!46419 (not b_next!28351) (not start!109062) tp_is_empty!33991)
(check-sat b_and!46419 (not b_next!28351))
