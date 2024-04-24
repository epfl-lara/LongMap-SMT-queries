; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109218 () Bool)

(assert start!109218)

(declare-fun b_free!28483 () Bool)

(declare-fun b_next!28483 () Bool)

(assert (=> start!109218 (= b_free!28483 (not b_next!28483))))

(declare-fun tp!100568 () Bool)

(declare-fun b_and!46575 () Bool)

(assert (=> start!109218 (= tp!100568 b_and!46575)))

(declare-fun b!1289298 () Bool)

(declare-fun res!855958 () Bool)

(declare-fun e!736347 () Bool)

(assert (=> b!1289298 (=> (not res!855958) (not e!736347))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50601 0))(
  ( (V!50602 (val!17136 Int)) )
))
(declare-datatypes ((ValueCell!16163 0))(
  ( (ValueCellFull!16163 (v!19734 V!50601)) (EmptyCell!16163) )
))
(declare-datatypes ((array!85329 0))(
  ( (array!85330 (arr!41161 (Array (_ BitVec 32) ValueCell!16163)) (size!41712 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85329)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85331 0))(
  ( (array!85332 (arr!41162 (Array (_ BitVec 32) (_ BitVec 64))) (size!41713 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85331)

(assert (=> b!1289298 (= res!855958 (and (= (size!41712 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41713 _keys!1741) (size!41712 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289299 () Bool)

(declare-fun res!855961 () Bool)

(assert (=> b!1289299 (=> (not res!855961) (not e!736347))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1289299 (= res!855961 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41713 _keys!1741))))))

(declare-fun res!855960 () Bool)

(assert (=> start!109218 (=> (not res!855960) (not e!736347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109218 (= res!855960 (validMask!0 mask!2175))))

(assert (=> start!109218 e!736347))

(declare-fun tp_is_empty!34123 () Bool)

(assert (=> start!109218 tp_is_empty!34123))

(assert (=> start!109218 true))

(declare-fun e!736346 () Bool)

(declare-fun array_inv!31419 (array!85329) Bool)

(assert (=> start!109218 (and (array_inv!31419 _values!1445) e!736346)))

(declare-fun array_inv!31420 (array!85331) Bool)

(assert (=> start!109218 (array_inv!31420 _keys!1741)))

(assert (=> start!109218 tp!100568))

(declare-fun b!1289300 () Bool)

(declare-fun res!855964 () Bool)

(assert (=> b!1289300 (=> (not res!855964) (not e!736347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85331 (_ BitVec 32)) Bool)

(assert (=> b!1289300 (= res!855964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289301 () Bool)

(declare-fun res!855962 () Bool)

(assert (=> b!1289301 (=> (not res!855962) (not e!736347))))

(declare-fun minValue!1387 () V!50601)

(declare-fun zeroValue!1387 () V!50601)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22008 0))(
  ( (tuple2!22009 (_1!11015 (_ BitVec 64)) (_2!11015 V!50601)) )
))
(declare-datatypes ((List!29197 0))(
  ( (Nil!29194) (Cons!29193 (h!30411 tuple2!22008) (t!42753 List!29197)) )
))
(declare-datatypes ((ListLongMap!19673 0))(
  ( (ListLongMap!19674 (toList!9852 List!29197)) )
))
(declare-fun contains!7983 (ListLongMap!19673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4903 (array!85331 array!85329 (_ BitVec 32) (_ BitVec 32) V!50601 V!50601 (_ BitVec 32) Int) ListLongMap!19673)

(assert (=> b!1289301 (= res!855962 (contains!7983 (getCurrentListMap!4903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289302 () Bool)

(declare-fun e!736349 () Bool)

(declare-fun mapRes!52745 () Bool)

(assert (=> b!1289302 (= e!736346 (and e!736349 mapRes!52745))))

(declare-fun condMapEmpty!52745 () Bool)

(declare-fun mapDefault!52745 () ValueCell!16163)

(assert (=> b!1289302 (= condMapEmpty!52745 (= (arr!41161 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16163)) mapDefault!52745)))))

(declare-fun b!1289303 () Bool)

(declare-fun res!855957 () Bool)

(assert (=> b!1289303 (=> (not res!855957) (not e!736347))))

(assert (=> b!1289303 (= res!855957 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41713 _keys!1741))))))

(declare-fun b!1289304 () Bool)

(assert (=> b!1289304 (= e!736347 (not true))))

(assert (=> b!1289304 (not (contains!7983 (ListLongMap!19674 Nil!29194) k0!1205))))

(declare-datatypes ((Unit!42557 0))(
  ( (Unit!42558) )
))
(declare-fun lt!578400 () Unit!42557)

(declare-fun emptyContainsNothing!32 ((_ BitVec 64)) Unit!42557)

(assert (=> b!1289304 (= lt!578400 (emptyContainsNothing!32 k0!1205))))

(declare-fun b!1289305 () Bool)

(declare-fun res!855959 () Bool)

(assert (=> b!1289305 (=> (not res!855959) (not e!736347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289305 (= res!855959 (not (validKeyInArray!0 (select (arr!41162 _keys!1741) from!2144))))))

(declare-fun b!1289306 () Bool)

(declare-fun res!855963 () Bool)

(assert (=> b!1289306 (=> (not res!855963) (not e!736347))))

(declare-datatypes ((List!29198 0))(
  ( (Nil!29195) (Cons!29194 (h!30412 (_ BitVec 64)) (t!42754 List!29198)) )
))
(declare-fun arrayNoDuplicates!0 (array!85331 (_ BitVec 32) List!29198) Bool)

(assert (=> b!1289306 (= res!855963 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29195))))

(declare-fun b!1289307 () Bool)

(declare-fun e!736348 () Bool)

(assert (=> b!1289307 (= e!736348 tp_is_empty!34123)))

(declare-fun b!1289308 () Bool)

(assert (=> b!1289308 (= e!736349 tp_is_empty!34123)))

(declare-fun mapIsEmpty!52745 () Bool)

(assert (=> mapIsEmpty!52745 mapRes!52745))

(declare-fun mapNonEmpty!52745 () Bool)

(declare-fun tp!100567 () Bool)

(assert (=> mapNonEmpty!52745 (= mapRes!52745 (and tp!100567 e!736348))))

(declare-fun mapRest!52745 () (Array (_ BitVec 32) ValueCell!16163))

(declare-fun mapKey!52745 () (_ BitVec 32))

(declare-fun mapValue!52745 () ValueCell!16163)

(assert (=> mapNonEmpty!52745 (= (arr!41161 _values!1445) (store mapRest!52745 mapKey!52745 mapValue!52745))))

(assert (= (and start!109218 res!855960) b!1289298))

(assert (= (and b!1289298 res!855958) b!1289300))

(assert (= (and b!1289300 res!855964) b!1289306))

(assert (= (and b!1289306 res!855963) b!1289299))

(assert (= (and b!1289299 res!855961) b!1289301))

(assert (= (and b!1289301 res!855962) b!1289303))

(assert (= (and b!1289303 res!855957) b!1289305))

(assert (= (and b!1289305 res!855959) b!1289304))

(assert (= (and b!1289302 condMapEmpty!52745) mapIsEmpty!52745))

(assert (= (and b!1289302 (not condMapEmpty!52745)) mapNonEmpty!52745))

(get-info :version)

(assert (= (and mapNonEmpty!52745 ((_ is ValueCellFull!16163) mapValue!52745)) b!1289307))

(assert (= (and b!1289302 ((_ is ValueCellFull!16163) mapDefault!52745)) b!1289308))

(assert (= start!109218 b!1289302))

(declare-fun m!1182321 () Bool)

(assert (=> b!1289300 m!1182321))

(declare-fun m!1182323 () Bool)

(assert (=> start!109218 m!1182323))

(declare-fun m!1182325 () Bool)

(assert (=> start!109218 m!1182325))

(declare-fun m!1182327 () Bool)

(assert (=> start!109218 m!1182327))

(declare-fun m!1182329 () Bool)

(assert (=> b!1289306 m!1182329))

(declare-fun m!1182331 () Bool)

(assert (=> mapNonEmpty!52745 m!1182331))

(declare-fun m!1182333 () Bool)

(assert (=> b!1289301 m!1182333))

(assert (=> b!1289301 m!1182333))

(declare-fun m!1182335 () Bool)

(assert (=> b!1289301 m!1182335))

(declare-fun m!1182337 () Bool)

(assert (=> b!1289304 m!1182337))

(declare-fun m!1182339 () Bool)

(assert (=> b!1289304 m!1182339))

(declare-fun m!1182341 () Bool)

(assert (=> b!1289305 m!1182341))

(assert (=> b!1289305 m!1182341))

(declare-fun m!1182343 () Bool)

(assert (=> b!1289305 m!1182343))

(check-sat tp_is_empty!34123 (not start!109218) (not b!1289300) (not b!1289306) (not b_next!28483) (not b!1289305) (not mapNonEmpty!52745) (not b!1289304) (not b!1289301) b_and!46575)
(check-sat b_and!46575 (not b_next!28483))
