; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109376 () Bool)

(assert start!109376)

(declare-fun b_free!28865 () Bool)

(declare-fun b_next!28865 () Bool)

(assert (=> start!109376 (= b_free!28865 (not b_next!28865))))

(declare-fun tp!101714 () Bool)

(declare-fun b_and!46955 () Bool)

(assert (=> start!109376 (= tp!101714 b_and!46955)))

(declare-fun b!1294701 () Bool)

(declare-fun res!860428 () Bool)

(declare-fun e!738772 () Bool)

(assert (=> b!1294701 (=> (not res!860428) (not e!738772))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86030 0))(
  ( (array!86031 (arr!41516 (Array (_ BitVec 32) (_ BitVec 64))) (size!42066 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86030)

(assert (=> b!1294701 (= res!860428 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42066 _keys!1741))))))

(declare-fun b!1294702 () Bool)

(declare-fun res!860430 () Bool)

(assert (=> b!1294702 (=> (not res!860430) (not e!738772))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1294702 (= res!860430 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42066 _keys!1741))))))

(declare-fun b!1294703 () Bool)

(declare-fun res!860427 () Bool)

(assert (=> b!1294703 (=> (not res!860427) (not e!738772))))

(declare-datatypes ((List!29451 0))(
  ( (Nil!29448) (Cons!29447 (h!30656 (_ BitVec 64)) (t!43015 List!29451)) )
))
(declare-fun arrayNoDuplicates!0 (array!86030 (_ BitVec 32) List!29451) Bool)

(assert (=> b!1294703 (= res!860427 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29448))))

(declare-fun b!1294704 () Bool)

(declare-fun e!738769 () Bool)

(declare-fun tp_is_empty!34505 () Bool)

(assert (=> b!1294704 (= e!738769 tp_is_empty!34505)))

(declare-fun b!1294705 () Bool)

(declare-fun res!860426 () Bool)

(assert (=> b!1294705 (=> (not res!860426) (not e!738772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294705 (= res!860426 (not (validKeyInArray!0 (select (arr!41516 _keys!1741) from!2144))))))

(declare-fun b!1294706 () Bool)

(declare-fun e!738770 () Bool)

(declare-fun mapRes!53318 () Bool)

(assert (=> b!1294706 (= e!738770 (and e!738769 mapRes!53318))))

(declare-fun condMapEmpty!53318 () Bool)

(declare-datatypes ((V!51109 0))(
  ( (V!51110 (val!17327 Int)) )
))
(declare-datatypes ((ValueCell!16354 0))(
  ( (ValueCellFull!16354 (v!19930 V!51109)) (EmptyCell!16354) )
))
(declare-datatypes ((array!86032 0))(
  ( (array!86033 (arr!41517 (Array (_ BitVec 32) ValueCell!16354)) (size!42067 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86032)

(declare-fun mapDefault!53318 () ValueCell!16354)

