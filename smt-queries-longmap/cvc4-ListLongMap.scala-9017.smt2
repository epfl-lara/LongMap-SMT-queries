; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108866 () Bool)

(assert start!108866)

(declare-fun b_free!28379 () Bool)

(declare-fun b_next!28379 () Bool)

(assert (=> start!108866 (= b_free!28379 (not b_next!28379))))

(declare-fun tp!100252 () Bool)

(declare-fun b_and!46445 () Bool)

(assert (=> start!108866 (= tp!100252 b_and!46445)))

(declare-fun b!1285679 () Bool)

(declare-fun e!734405 () Bool)

(declare-fun tp_is_empty!34019 () Bool)

(assert (=> b!1285679 (= e!734405 tp_is_empty!34019)))

(declare-fun mapNonEmpty!52586 () Bool)

(declare-fun mapRes!52586 () Bool)

(declare-fun tp!100253 () Bool)

(declare-fun e!734404 () Bool)

(assert (=> mapNonEmpty!52586 (= mapRes!52586 (and tp!100253 e!734404))))

(declare-datatypes ((V!50461 0))(
  ( (V!50462 (val!17084 Int)) )
))
(declare-datatypes ((ValueCell!16111 0))(
  ( (ValueCellFull!16111 (v!19686 V!50461)) (EmptyCell!16111) )
))
(declare-fun mapValue!52586 () ValueCell!16111)

(declare-fun mapRest!52586 () (Array (_ BitVec 32) ValueCell!16111))

(declare-fun mapKey!52586 () (_ BitVec 32))

(declare-datatypes ((array!85092 0))(
  ( (array!85093 (arr!41048 (Array (_ BitVec 32) ValueCell!16111)) (size!41598 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85092)

(assert (=> mapNonEmpty!52586 (= (arr!41048 _values!1445) (store mapRest!52586 mapKey!52586 mapValue!52586))))

(declare-fun b!1285680 () Bool)

(declare-fun res!854082 () Bool)

(declare-fun e!734403 () Bool)

(assert (=> b!1285680 (=> (not res!854082) (not e!734403))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85094 0))(
  ( (array!85095 (arr!41049 (Array (_ BitVec 32) (_ BitVec 64))) (size!41599 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85094)

(assert (=> b!1285680 (= res!854082 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41599 _keys!1741))))))

(declare-fun b!1285681 () Bool)

(assert (=> b!1285681 (= e!734403 false)))

(declare-fun minValue!1387 () V!50461)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!50461)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!576946 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21900 0))(
  ( (tuple2!21901 (_1!10961 (_ BitVec 64)) (_2!10961 V!50461)) )
))
(declare-datatypes ((List!29088 0))(
  ( (Nil!29085) (Cons!29084 (h!30293 tuple2!21900) (t!42632 List!29088)) )
))
(declare-datatypes ((ListLongMap!19557 0))(
  ( (ListLongMap!19558 (toList!9794 List!29088)) )
))
(declare-fun contains!7911 (ListLongMap!19557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4872 (array!85094 array!85092 (_ BitVec 32) (_ BitVec 32) V!50461 V!50461 (_ BitVec 32) Int) ListLongMap!19557)

(assert (=> b!1285681 (= lt!576946 (contains!7911 (getCurrentListMap!4872 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285682 () Bool)

(declare-fun res!854081 () Bool)

(assert (=> b!1285682 (=> (not res!854081) (not e!734403))))

(declare-datatypes ((List!29089 0))(
  ( (Nil!29086) (Cons!29085 (h!30294 (_ BitVec 64)) (t!42633 List!29089)) )
))
(declare-fun arrayNoDuplicates!0 (array!85094 (_ BitVec 32) List!29089) Bool)

(assert (=> b!1285682 (= res!854081 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29086))))

(declare-fun b!1285683 () Bool)

(assert (=> b!1285683 (= e!734404 tp_is_empty!34019)))

(declare-fun b!1285684 () Bool)

(declare-fun e!734402 () Bool)

(assert (=> b!1285684 (= e!734402 (and e!734405 mapRes!52586))))

(declare-fun condMapEmpty!52586 () Bool)

(declare-fun mapDefault!52586 () ValueCell!16111)

