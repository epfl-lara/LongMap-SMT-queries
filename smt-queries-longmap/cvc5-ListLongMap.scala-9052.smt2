; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109096 () Bool)

(assert start!109096)

(declare-fun b_free!28585 () Bool)

(declare-fun b_next!28585 () Bool)

(assert (=> start!109096 (= b_free!28585 (not b_next!28585))))

(declare-fun tp!100873 () Bool)

(declare-fun b_and!46675 () Bool)

(assert (=> start!109096 (= tp!100873 b_and!46675)))

(declare-fun b!1289813 () Bool)

(declare-fun res!856805 () Bool)

(declare-fun e!736406 () Bool)

(assert (=> b!1289813 (=> (not res!856805) (not e!736406))))

(declare-datatypes ((array!85492 0))(
  ( (array!85493 (arr!41247 (Array (_ BitVec 32) (_ BitVec 64))) (size!41797 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85492)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85492 (_ BitVec 32)) Bool)

(assert (=> b!1289813 (= res!856805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289814 () Bool)

(declare-fun res!856802 () Bool)

(assert (=> b!1289814 (=> (not res!856802) (not e!736406))))

(declare-datatypes ((V!50737 0))(
  ( (V!50738 (val!17187 Int)) )
))
(declare-fun minValue!1387 () V!50737)

(declare-fun zeroValue!1387 () V!50737)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16214 0))(
  ( (ValueCellFull!16214 (v!19790 V!50737)) (EmptyCell!16214) )
))
(declare-datatypes ((array!85494 0))(
  ( (array!85495 (arr!41248 (Array (_ BitVec 32) ValueCell!16214)) (size!41798 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85494)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22078 0))(
  ( (tuple2!22079 (_1!11050 (_ BitVec 64)) (_2!11050 V!50737)) )
))
(declare-datatypes ((List!29247 0))(
  ( (Nil!29244) (Cons!29243 (h!30452 tuple2!22078) (t!42811 List!29247)) )
))
(declare-datatypes ((ListLongMap!19735 0))(
  ( (ListLongMap!19736 (toList!9883 List!29247)) )
))
(declare-fun contains!8001 (ListLongMap!19735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4943 (array!85492 array!85494 (_ BitVec 32) (_ BitVec 32) V!50737 V!50737 (_ BitVec 32) Int) ListLongMap!19735)

(assert (=> b!1289814 (= res!856802 (contains!8001 (getCurrentListMap!4943 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289815 () Bool)

(declare-fun e!736402 () Bool)

(declare-fun e!736405 () Bool)

(declare-fun mapRes!52898 () Bool)

(assert (=> b!1289815 (= e!736402 (and e!736405 mapRes!52898))))

(declare-fun condMapEmpty!52898 () Bool)

(declare-fun mapDefault!52898 () ValueCell!16214)

