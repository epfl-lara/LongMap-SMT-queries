; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110074 () Bool)

(assert start!110074)

(declare-fun b_free!29273 () Bool)

(declare-fun b_next!29273 () Bool)

(assert (=> start!110074 (= b_free!29273 (not b_next!29273))))

(declare-fun tp!102969 () Bool)

(declare-fun b_and!47437 () Bool)

(assert (=> start!110074 (= tp!102969 b_and!47437)))

(declare-fun b!1303666 () Bool)

(declare-fun res!865897 () Bool)

(declare-fun e!743591 () Bool)

(assert (=> b!1303666 (=> (not res!865897) (not e!743591))))

(declare-datatypes ((array!86836 0))(
  ( (array!86837 (arr!41909 (Array (_ BitVec 32) (_ BitVec 64))) (size!42459 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86836)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86836 (_ BitVec 32)) Bool)

(assert (=> b!1303666 (= res!865897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53962 () Bool)

(declare-fun mapRes!53962 () Bool)

(assert (=> mapIsEmpty!53962 mapRes!53962))

(declare-fun b!1303667 () Bool)

(declare-fun e!743593 () Bool)

(declare-fun tp_is_empty!34913 () Bool)

(assert (=> b!1303667 (= e!743593 tp_is_empty!34913)))

(declare-fun b!1303668 () Bool)

(declare-fun e!743590 () Bool)

(declare-fun e!743589 () Bool)

(assert (=> b!1303668 (= e!743590 e!743589)))

(declare-fun res!865898 () Bool)

(assert (=> b!1303668 (=> (not res!865898) (not e!743589))))

(declare-datatypes ((V!51653 0))(
  ( (V!51654 (val!17531 Int)) )
))
(declare-fun minValue!1387 () V!51653)

(declare-fun zeroValue!1387 () V!51653)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16558 0))(
  ( (ValueCellFull!16558 (v!20147 V!51653)) (EmptyCell!16558) )
))
(declare-datatypes ((array!86838 0))(
  ( (array!86839 (arr!41910 (Array (_ BitVec 32) ValueCell!16558)) (size!42460 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86838)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22624 0))(
  ( (tuple2!22625 (_1!11323 (_ BitVec 64)) (_2!11323 V!51653)) )
))
(declare-datatypes ((List!29748 0))(
  ( (Nil!29745) (Cons!29744 (h!30953 tuple2!22624) (t!43342 List!29748)) )
))
(declare-datatypes ((ListLongMap!20281 0))(
  ( (ListLongMap!20282 (toList!10156 List!29748)) )
))
(declare-fun contains!8292 (ListLongMap!20281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6114 (array!86836 array!86838 (_ BitVec 32) (_ BitVec 32) V!51653 V!51653 (_ BitVec 32) Int) ListLongMap!20281)

(assert (=> b!1303668 (= res!865898 (not (contains!8292 (getCurrentListMapNoExtraKeys!6114 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205)))))

(declare-fun b!1303669 () Bool)

(declare-fun res!865896 () Bool)

(assert (=> b!1303669 (=> (not res!865896) (not e!743591))))

(assert (=> b!1303669 (= res!865896 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42459 _keys!1741))))))

(declare-fun b!1303670 () Bool)

(declare-fun e!743587 () Bool)

(declare-fun e!743592 () Bool)

(assert (=> b!1303670 (= e!743587 (and e!743592 mapRes!53962))))

(declare-fun condMapEmpty!53962 () Bool)

(declare-fun mapDefault!53962 () ValueCell!16558)

