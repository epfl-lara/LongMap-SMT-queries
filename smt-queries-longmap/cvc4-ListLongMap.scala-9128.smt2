; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109556 () Bool)

(assert start!109556)

(declare-fun b_free!29045 () Bool)

(declare-fun b_next!29045 () Bool)

(assert (=> start!109556 (= b_free!29045 (not b_next!29045))))

(declare-fun tp!102253 () Bool)

(declare-fun b_and!47135 () Bool)

(assert (=> start!109556 (= tp!102253 b_and!47135)))

(declare-fun b!1297575 () Bool)

(declare-fun e!740312 () Bool)

(assert (=> b!1297575 (= e!740312 false)))

(declare-datatypes ((V!51349 0))(
  ( (V!51350 (val!17417 Int)) )
))
(declare-fun minValue!1387 () V!51349)

(declare-fun zeroValue!1387 () V!51349)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16444 0))(
  ( (ValueCellFull!16444 (v!20020 V!51349)) (EmptyCell!16444) )
))
(declare-datatypes ((array!86380 0))(
  ( (array!86381 (arr!41691 (Array (_ BitVec 32) ValueCell!16444)) (size!42241 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86380)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86382 0))(
  ( (array!86383 (arr!41692 (Array (_ BitVec 32) (_ BitVec 64))) (size!42242 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86382)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!580613 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22444 0))(
  ( (tuple2!22445 (_1!11233 (_ BitVec 64)) (_2!11233 V!51349)) )
))
(declare-datatypes ((List!29579 0))(
  ( (Nil!29576) (Cons!29575 (h!30784 tuple2!22444) (t!43143 List!29579)) )
))
(declare-datatypes ((ListLongMap!20101 0))(
  ( (ListLongMap!20102 (toList!10066 List!29579)) )
))
(declare-fun contains!8184 (ListLongMap!20101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5095 (array!86382 array!86380 (_ BitVec 32) (_ BitVec 32) V!51349 V!51349 (_ BitVec 32) Int) ListLongMap!20101)

(assert (=> b!1297575 (= lt!580613 (contains!8184 (getCurrentListMap!5095 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297576 () Bool)

(declare-fun e!740309 () Bool)

(declare-fun tp_is_empty!34685 () Bool)

(assert (=> b!1297576 (= e!740309 tp_is_empty!34685)))

(declare-fun b!1297577 () Bool)

(declare-fun res!862329 () Bool)

(assert (=> b!1297577 (=> (not res!862329) (not e!740312))))

(assert (=> b!1297577 (= res!862329 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42242 _keys!1741))))))

(declare-fun b!1297578 () Bool)

(declare-fun res!862330 () Bool)

(assert (=> b!1297578 (=> (not res!862330) (not e!740312))))

(assert (=> b!1297578 (= res!862330 (and (= (size!42241 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42242 _keys!1741) (size!42241 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53588 () Bool)

(declare-fun mapRes!53588 () Bool)

(declare-fun tp!102254 () Bool)

(declare-fun e!740310 () Bool)

(assert (=> mapNonEmpty!53588 (= mapRes!53588 (and tp!102254 e!740310))))

(declare-fun mapValue!53588 () ValueCell!16444)

(declare-fun mapKey!53588 () (_ BitVec 32))

(declare-fun mapRest!53588 () (Array (_ BitVec 32) ValueCell!16444))

(assert (=> mapNonEmpty!53588 (= (arr!41691 _values!1445) (store mapRest!53588 mapKey!53588 mapValue!53588))))

(declare-fun b!1297579 () Bool)

(assert (=> b!1297579 (= e!740310 tp_is_empty!34685)))

(declare-fun res!862332 () Bool)

(assert (=> start!109556 (=> (not res!862332) (not e!740312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109556 (= res!862332 (validMask!0 mask!2175))))

(assert (=> start!109556 e!740312))

(assert (=> start!109556 tp_is_empty!34685))

(assert (=> start!109556 true))

(declare-fun e!740311 () Bool)

(declare-fun array_inv!31555 (array!86380) Bool)

(assert (=> start!109556 (and (array_inv!31555 _values!1445) e!740311)))

(declare-fun array_inv!31556 (array!86382) Bool)

(assert (=> start!109556 (array_inv!31556 _keys!1741)))

(assert (=> start!109556 tp!102253))

(declare-fun mapIsEmpty!53588 () Bool)

(assert (=> mapIsEmpty!53588 mapRes!53588))

(declare-fun b!1297580 () Bool)

(declare-fun res!862328 () Bool)

(assert (=> b!1297580 (=> (not res!862328) (not e!740312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86382 (_ BitVec 32)) Bool)

(assert (=> b!1297580 (= res!862328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297581 () Bool)

(declare-fun res!862331 () Bool)

(assert (=> b!1297581 (=> (not res!862331) (not e!740312))))

(declare-datatypes ((List!29580 0))(
  ( (Nil!29577) (Cons!29576 (h!30785 (_ BitVec 64)) (t!43144 List!29580)) )
))
(declare-fun arrayNoDuplicates!0 (array!86382 (_ BitVec 32) List!29580) Bool)

(assert (=> b!1297581 (= res!862331 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29577))))

(declare-fun b!1297582 () Bool)

(assert (=> b!1297582 (= e!740311 (and e!740309 mapRes!53588))))

(declare-fun condMapEmpty!53588 () Bool)

(declare-fun mapDefault!53588 () ValueCell!16444)

