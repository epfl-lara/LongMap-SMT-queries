; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109792 () Bool)

(assert start!109792)

(declare-fun b_free!29185 () Bool)

(declare-fun b_next!29185 () Bool)

(assert (=> start!109792 (= b_free!29185 (not b_next!29185))))

(declare-fun tp!102688 () Bool)

(declare-fun b_and!47299 () Bool)

(assert (=> start!109792 (= tp!102688 b_and!47299)))

(declare-fun b!1300484 () Bool)

(declare-fun res!864190 () Bool)

(declare-fun e!741842 () Bool)

(assert (=> b!1300484 (=> (not res!864190) (not e!741842))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86662 0))(
  ( (array!86663 (arr!41827 (Array (_ BitVec 32) (_ BitVec 64))) (size!42377 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86662)

(assert (=> b!1300484 (= res!864190 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42377 _keys!1741))))))

(declare-fun mapNonEmpty!53813 () Bool)

(declare-fun mapRes!53813 () Bool)

(declare-fun tp!102689 () Bool)

(declare-fun e!741838 () Bool)

(assert (=> mapNonEmpty!53813 (= mapRes!53813 (and tp!102689 e!741838))))

(declare-datatypes ((V!51537 0))(
  ( (V!51538 (val!17487 Int)) )
))
(declare-datatypes ((ValueCell!16514 0))(
  ( (ValueCellFull!16514 (v!20095 V!51537)) (EmptyCell!16514) )
))
(declare-fun mapValue!53813 () ValueCell!16514)

(declare-fun mapKey!53813 () (_ BitVec 32))

(declare-datatypes ((array!86664 0))(
  ( (array!86665 (arr!41828 (Array (_ BitVec 32) ValueCell!16514)) (size!42378 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86664)

(declare-fun mapRest!53813 () (Array (_ BitVec 32) ValueCell!16514))

(assert (=> mapNonEmpty!53813 (= (arr!41828 _values!1445) (store mapRest!53813 mapKey!53813 mapValue!53813))))

(declare-fun b!1300485 () Bool)

(declare-fun tp_is_empty!34825 () Bool)

(assert (=> b!1300485 (= e!741838 tp_is_empty!34825)))

(declare-fun res!864196 () Bool)

(assert (=> start!109792 (=> (not res!864196) (not e!741842))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109792 (= res!864196 (validMask!0 mask!2175))))

(assert (=> start!109792 e!741842))

(assert (=> start!109792 tp_is_empty!34825))

(assert (=> start!109792 true))

(declare-fun e!741841 () Bool)

(declare-fun array_inv!31647 (array!86664) Bool)

(assert (=> start!109792 (and (array_inv!31647 _values!1445) e!741841)))

(declare-fun array_inv!31648 (array!86662) Bool)

(assert (=> start!109792 (array_inv!31648 _keys!1741)))

(assert (=> start!109792 tp!102688))

(declare-fun b!1300486 () Bool)

(declare-fun res!864191 () Bool)

(assert (=> b!1300486 (=> (not res!864191) (not e!741842))))

(declare-fun minValue!1387 () V!51537)

(declare-fun zeroValue!1387 () V!51537)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22552 0))(
  ( (tuple2!22553 (_1!11287 (_ BitVec 64)) (_2!11287 V!51537)) )
))
(declare-datatypes ((List!29685 0))(
  ( (Nil!29682) (Cons!29681 (h!30890 tuple2!22552) (t!43259 List!29685)) )
))
(declare-datatypes ((ListLongMap!20209 0))(
  ( (ListLongMap!20210 (toList!10120 List!29685)) )
))
(declare-fun contains!8246 (ListLongMap!20209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5147 (array!86662 array!86664 (_ BitVec 32) (_ BitVec 32) V!51537 V!51537 (_ BitVec 32) Int) ListLongMap!20209)

(assert (=> b!1300486 (= res!864191 (contains!8246 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1300487 () Bool)

(declare-fun res!864193 () Bool)

(assert (=> b!1300487 (=> (not res!864193) (not e!741842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300487 (= res!864193 (validKeyInArray!0 (select (arr!41827 _keys!1741) from!2144)))))

(declare-fun b!1300488 () Bool)

(declare-fun res!864197 () Bool)

(assert (=> b!1300488 (=> (not res!864197) (not e!741842))))

(assert (=> b!1300488 (= res!864197 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300489 () Bool)

(declare-fun res!864195 () Bool)

(assert (=> b!1300489 (=> (not res!864195) (not e!741842))))

(assert (=> b!1300489 (= res!864195 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42377 _keys!1741))))))

(declare-fun b!1300490 () Bool)

(declare-fun e!741839 () Bool)

(assert (=> b!1300490 (= e!741839 tp_is_empty!34825)))

(declare-fun b!1300491 () Bool)

(declare-fun res!864192 () Bool)

(assert (=> b!1300491 (=> (not res!864192) (not e!741842))))

(declare-datatypes ((List!29686 0))(
  ( (Nil!29683) (Cons!29682 (h!30891 (_ BitVec 64)) (t!43260 List!29686)) )
))
(declare-fun arrayNoDuplicates!0 (array!86662 (_ BitVec 32) List!29686) Bool)

(assert (=> b!1300491 (= res!864192 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29683))))

(declare-fun b!1300492 () Bool)

(assert (=> b!1300492 (= e!741841 (and e!741839 mapRes!53813))))

(declare-fun condMapEmpty!53813 () Bool)

(declare-fun mapDefault!53813 () ValueCell!16514)

