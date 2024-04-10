; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109382 () Bool)

(assert start!109382)

(declare-fun b_free!28871 () Bool)

(declare-fun b_next!28871 () Bool)

(assert (=> start!109382 (= b_free!28871 (not b_next!28871))))

(declare-fun tp!101732 () Bool)

(declare-fun b_and!46961 () Bool)

(assert (=> start!109382 (= tp!101732 b_and!46961)))

(declare-fun b!1294800 () Bool)

(declare-fun res!860502 () Bool)

(declare-fun e!738814 () Bool)

(assert (=> b!1294800 (=> (not res!860502) (not e!738814))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86042 0))(
  ( (array!86043 (arr!41522 (Array (_ BitVec 32) (_ BitVec 64))) (size!42072 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86042)

(declare-datatypes ((V!51117 0))(
  ( (V!51118 (val!17330 Int)) )
))
(declare-datatypes ((ValueCell!16357 0))(
  ( (ValueCellFull!16357 (v!19933 V!51117)) (EmptyCell!16357) )
))
(declare-datatypes ((array!86044 0))(
  ( (array!86045 (arr!41523 (Array (_ BitVec 32) ValueCell!16357)) (size!42073 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86044)

(assert (=> b!1294800 (= res!860502 (and (= (size!42073 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42072 _keys!1741) (size!42073 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294801 () Bool)

(declare-fun res!860501 () Bool)

(assert (=> b!1294801 (=> (not res!860501) (not e!738814))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1294801 (= res!860501 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42072 _keys!1741))))))

(declare-fun b!1294802 () Bool)

(declare-fun res!860500 () Bool)

(assert (=> b!1294802 (=> (not res!860500) (not e!738814))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1294802 (= res!860500 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42072 _keys!1741))))))

(declare-fun mapIsEmpty!53327 () Bool)

(declare-fun mapRes!53327 () Bool)

(assert (=> mapIsEmpty!53327 mapRes!53327))

(declare-fun b!1294803 () Bool)

(declare-fun res!860503 () Bool)

(assert (=> b!1294803 (=> (not res!860503) (not e!738814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86042 (_ BitVec 32)) Bool)

(assert (=> b!1294803 (= res!860503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294804 () Bool)

(declare-fun e!738815 () Bool)

(declare-fun tp_is_empty!34511 () Bool)

(assert (=> b!1294804 (= e!738815 tp_is_empty!34511)))

(declare-fun b!1294805 () Bool)

(declare-fun e!738817 () Bool)

(assert (=> b!1294805 (= e!738817 (and e!738815 mapRes!53327))))

(declare-fun condMapEmpty!53327 () Bool)

(declare-fun mapDefault!53327 () ValueCell!16357)

