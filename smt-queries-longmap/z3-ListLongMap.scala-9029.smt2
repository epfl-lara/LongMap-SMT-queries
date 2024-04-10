; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108960 () Bool)

(assert start!108960)

(declare-fun b_free!28449 () Bool)

(declare-fun b_next!28449 () Bool)

(assert (=> start!108960 (= b_free!28449 (not b_next!28449))))

(declare-fun tp!100466 () Bool)

(declare-fun b_and!46539 () Bool)

(assert (=> start!108960 (= tp!100466 b_and!46539)))

(declare-fun b!1287432 () Bool)

(declare-fun res!855036 () Bool)

(declare-fun e!735245 () Bool)

(assert (=> b!1287432 (=> (not res!855036) (not e!735245))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85228 0))(
  ( (array!85229 (arr!41115 (Array (_ BitVec 32) (_ BitVec 64))) (size!41665 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85228)

(assert (=> b!1287432 (= res!855036 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41665 _keys!1741))))))

(declare-fun b!1287433 () Bool)

(declare-fun res!855034 () Bool)

(assert (=> b!1287433 (=> (not res!855034) (not e!735245))))

(declare-datatypes ((V!50555 0))(
  ( (V!50556 (val!17119 Int)) )
))
(declare-fun minValue!1387 () V!50555)

(declare-fun zeroValue!1387 () V!50555)

(declare-datatypes ((ValueCell!16146 0))(
  ( (ValueCellFull!16146 (v!19722 V!50555)) (EmptyCell!16146) )
))
(declare-datatypes ((array!85230 0))(
  ( (array!85231 (arr!41116 (Array (_ BitVec 32) ValueCell!16146)) (size!41666 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85230)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21962 0))(
  ( (tuple2!21963 (_1!10992 (_ BitVec 64)) (_2!10992 V!50555)) )
))
(declare-datatypes ((List!29142 0))(
  ( (Nil!29139) (Cons!29138 (h!30347 tuple2!21962) (t!42706 List!29142)) )
))
(declare-datatypes ((ListLongMap!19619 0))(
  ( (ListLongMap!19620 (toList!9825 List!29142)) )
))
(declare-fun contains!7943 (ListLongMap!19619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4899 (array!85228 array!85230 (_ BitVec 32) (_ BitVec 32) V!50555 V!50555 (_ BitVec 32) Int) ListLongMap!19619)

(assert (=> b!1287433 (= res!855034 (contains!7943 (getCurrentListMap!4899 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287434 () Bool)

(declare-fun res!855035 () Bool)

(assert (=> b!1287434 (=> (not res!855035) (not e!735245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85228 (_ BitVec 32)) Bool)

(assert (=> b!1287434 (= res!855035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287435 () Bool)

(declare-fun e!735247 () Bool)

(declare-fun e!735246 () Bool)

(declare-fun mapRes!52694 () Bool)

(assert (=> b!1287435 (= e!735247 (and e!735246 mapRes!52694))))

(declare-fun condMapEmpty!52694 () Bool)

(declare-fun mapDefault!52694 () ValueCell!16146)

(assert (=> b!1287435 (= condMapEmpty!52694 (= (arr!41116 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16146)) mapDefault!52694)))))

(declare-fun b!1287436 () Bool)

(declare-fun tp_is_empty!34089 () Bool)

(assert (=> b!1287436 (= e!735246 tp_is_empty!34089)))

(declare-fun b!1287437 () Bool)

(declare-fun e!735244 () Bool)

(assert (=> b!1287437 (= e!735244 tp_is_empty!34089)))

(declare-fun res!855030 () Bool)

(assert (=> start!108960 (=> (not res!855030) (not e!735245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108960 (= res!855030 (validMask!0 mask!2175))))

(assert (=> start!108960 e!735245))

(assert (=> start!108960 tp_is_empty!34089))

(assert (=> start!108960 true))

(declare-fun array_inv!31179 (array!85230) Bool)

(assert (=> start!108960 (and (array_inv!31179 _values!1445) e!735247)))

(declare-fun array_inv!31180 (array!85228) Bool)

(assert (=> start!108960 (array_inv!31180 _keys!1741)))

(assert (=> start!108960 tp!100466))

(declare-fun b!1287438 () Bool)

(declare-fun res!855031 () Bool)

(assert (=> b!1287438 (=> (not res!855031) (not e!735245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287438 (= res!855031 (not (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52694 () Bool)

(assert (=> mapIsEmpty!52694 mapRes!52694))

(declare-fun b!1287439 () Bool)

(declare-fun res!855032 () Bool)

(assert (=> b!1287439 (=> (not res!855032) (not e!735245))))

(assert (=> b!1287439 (= res!855032 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41665 _keys!1741))))))

(declare-fun b!1287440 () Bool)

(assert (=> b!1287440 (= e!735245 (not true))))

(assert (=> b!1287440 (not (contains!7943 (ListLongMap!19620 Nil!29139) k0!1205))))

(declare-datatypes ((Unit!42574 0))(
  ( (Unit!42575) )
))
(declare-fun lt!577865 () Unit!42574)

(declare-fun emptyContainsNothing!16 ((_ BitVec 64)) Unit!42574)

(assert (=> b!1287440 (= lt!577865 (emptyContainsNothing!16 k0!1205))))

(declare-fun b!1287441 () Bool)

(declare-fun res!855033 () Bool)

(assert (=> b!1287441 (=> (not res!855033) (not e!735245))))

(declare-datatypes ((List!29143 0))(
  ( (Nil!29140) (Cons!29139 (h!30348 (_ BitVec 64)) (t!42707 List!29143)) )
))
(declare-fun arrayNoDuplicates!0 (array!85228 (_ BitVec 32) List!29143) Bool)

(assert (=> b!1287441 (= res!855033 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29140))))

(declare-fun mapNonEmpty!52694 () Bool)

(declare-fun tp!100465 () Bool)

(assert (=> mapNonEmpty!52694 (= mapRes!52694 (and tp!100465 e!735244))))

(declare-fun mapValue!52694 () ValueCell!16146)

(declare-fun mapRest!52694 () (Array (_ BitVec 32) ValueCell!16146))

(declare-fun mapKey!52694 () (_ BitVec 32))

(assert (=> mapNonEmpty!52694 (= (arr!41116 _values!1445) (store mapRest!52694 mapKey!52694 mapValue!52694))))

(declare-fun b!1287442 () Bool)

(declare-fun res!855029 () Bool)

(assert (=> b!1287442 (=> (not res!855029) (not e!735245))))

(assert (=> b!1287442 (= res!855029 (and (= (size!41666 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41665 _keys!1741) (size!41666 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108960 res!855030) b!1287442))

(assert (= (and b!1287442 res!855029) b!1287434))

(assert (= (and b!1287434 res!855035) b!1287441))

(assert (= (and b!1287441 res!855033) b!1287439))

(assert (= (and b!1287439 res!855032) b!1287433))

(assert (= (and b!1287433 res!855034) b!1287432))

(assert (= (and b!1287432 res!855036) b!1287438))

(assert (= (and b!1287438 res!855031) b!1287440))

(assert (= (and b!1287435 condMapEmpty!52694) mapIsEmpty!52694))

(assert (= (and b!1287435 (not condMapEmpty!52694)) mapNonEmpty!52694))

(get-info :version)

(assert (= (and mapNonEmpty!52694 ((_ is ValueCellFull!16146) mapValue!52694)) b!1287437))

(assert (= (and b!1287435 ((_ is ValueCellFull!16146) mapDefault!52694)) b!1287436))

(assert (= start!108960 b!1287435))

(declare-fun m!1180295 () Bool)

(assert (=> start!108960 m!1180295))

(declare-fun m!1180297 () Bool)

(assert (=> start!108960 m!1180297))

(declare-fun m!1180299 () Bool)

(assert (=> start!108960 m!1180299))

(declare-fun m!1180301 () Bool)

(assert (=> b!1287433 m!1180301))

(assert (=> b!1287433 m!1180301))

(declare-fun m!1180303 () Bool)

(assert (=> b!1287433 m!1180303))

(declare-fun m!1180305 () Bool)

(assert (=> b!1287441 m!1180305))

(declare-fun m!1180307 () Bool)

(assert (=> b!1287438 m!1180307))

(assert (=> b!1287438 m!1180307))

(declare-fun m!1180309 () Bool)

(assert (=> b!1287438 m!1180309))

(declare-fun m!1180311 () Bool)

(assert (=> mapNonEmpty!52694 m!1180311))

(declare-fun m!1180313 () Bool)

(assert (=> b!1287434 m!1180313))

(declare-fun m!1180315 () Bool)

(assert (=> b!1287440 m!1180315))

(declare-fun m!1180317 () Bool)

(assert (=> b!1287440 m!1180317))

(check-sat (not start!108960) (not b!1287433) (not b!1287434) (not b!1287440) (not b_next!28449) tp_is_empty!34089 (not b!1287441) (not b!1287438) b_and!46539 (not mapNonEmpty!52694))
(check-sat b_and!46539 (not b_next!28449))
