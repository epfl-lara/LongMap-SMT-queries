; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108806 () Bool)

(assert start!108806)

(declare-fun b_free!28319 () Bool)

(declare-fun b_next!28319 () Bool)

(assert (=> start!108806 (= b_free!28319 (not b_next!28319))))

(declare-fun tp!100072 () Bool)

(declare-fun b_and!46385 () Bool)

(assert (=> start!108806 (= tp!100072 b_and!46385)))

(declare-fun b!1284884 () Bool)

(declare-fun res!853558 () Bool)

(declare-fun e!733951 () Bool)

(assert (=> b!1284884 (=> (not res!853558) (not e!733951))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50381 0))(
  ( (V!50382 (val!17054 Int)) )
))
(declare-datatypes ((ValueCell!16081 0))(
  ( (ValueCellFull!16081 (v!19656 V!50381)) (EmptyCell!16081) )
))
(declare-datatypes ((array!84976 0))(
  ( (array!84977 (arr!40990 (Array (_ BitVec 32) ValueCell!16081)) (size!41540 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84976)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84978 0))(
  ( (array!84979 (arr!40991 (Array (_ BitVec 32) (_ BitVec 64))) (size!41541 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84978)

(assert (=> b!1284884 (= res!853558 (and (= (size!41540 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41541 _keys!1741) (size!41540 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284885 () Bool)

(declare-fun res!853556 () Bool)

(assert (=> b!1284885 (=> (not res!853556) (not e!733951))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1284885 (= res!853556 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41541 _keys!1741))))))

(declare-fun b!1284886 () Bool)

(declare-fun res!853560 () Bool)

(assert (=> b!1284886 (=> (not res!853560) (not e!733951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284886 (= res!853560 (validKeyInArray!0 (select (arr!40991 _keys!1741) from!2144)))))

(declare-fun b!1284887 () Bool)

(declare-fun res!853559 () Bool)

(assert (=> b!1284887 (=> (not res!853559) (not e!733951))))

(assert (=> b!1284887 (= res!853559 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41541 _keys!1741))))))

(declare-fun b!1284888 () Bool)

(declare-fun e!733954 () Bool)

(declare-fun e!733955 () Bool)

(declare-fun mapRes!52496 () Bool)

(assert (=> b!1284888 (= e!733954 (and e!733955 mapRes!52496))))

(declare-fun condMapEmpty!52496 () Bool)

(declare-fun mapDefault!52496 () ValueCell!16081)

