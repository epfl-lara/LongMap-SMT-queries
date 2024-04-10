; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109438 () Bool)

(assert start!109438)

(declare-fun b_free!28927 () Bool)

(declare-fun b_next!28927 () Bool)

(assert (=> start!109438 (= b_free!28927 (not b_next!28927))))

(declare-fun tp!101900 () Bool)

(declare-fun b_and!47017 () Bool)

(assert (=> start!109438 (= tp!101900 b_and!47017)))

(declare-fun b!1295807 () Bool)

(declare-fun res!861261 () Bool)

(declare-fun e!739317 () Bool)

(assert (=> b!1295807 (=> (not res!861261) (not e!739317))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86154 0))(
  ( (array!86155 (arr!41578 (Array (_ BitVec 32) (_ BitVec 64))) (size!42128 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86154)

(assert (=> b!1295807 (= res!861261 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42128 _keys!1741))))))

(declare-fun b!1295808 () Bool)

(declare-fun e!739321 () Bool)

(declare-fun tp_is_empty!34567 () Bool)

(assert (=> b!1295808 (= e!739321 tp_is_empty!34567)))

(declare-fun b!1295809 () Bool)

(declare-fun e!739318 () Bool)

(declare-fun e!739322 () Bool)

(declare-fun mapRes!53411 () Bool)

(assert (=> b!1295809 (= e!739318 (and e!739322 mapRes!53411))))

(declare-fun condMapEmpty!53411 () Bool)

(declare-datatypes ((V!51193 0))(
  ( (V!51194 (val!17358 Int)) )
))
(declare-datatypes ((ValueCell!16385 0))(
  ( (ValueCellFull!16385 (v!19961 V!51193)) (EmptyCell!16385) )
))
(declare-datatypes ((array!86156 0))(
  ( (array!86157 (arr!41579 (Array (_ BitVec 32) ValueCell!16385)) (size!42129 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86156)

(declare-fun mapDefault!53411 () ValueCell!16385)

