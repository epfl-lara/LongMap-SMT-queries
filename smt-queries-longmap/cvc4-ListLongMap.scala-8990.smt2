; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108704 () Bool)

(assert start!108704)

(declare-fun b_free!28217 () Bool)

(declare-fun b_next!28217 () Bool)

(assert (=> start!108704 (= b_free!28217 (not b_next!28217))))

(declare-fun tp!99767 () Bool)

(declare-fun b_and!46283 () Bool)

(assert (=> start!108704 (= tp!99767 b_and!46283)))

(declare-fun b!1283344 () Bool)

(declare-fun res!852479 () Bool)

(declare-fun e!733188 () Bool)

(assert (=> b!1283344 (=> (not res!852479) (not e!733188))))

(declare-datatypes ((array!84776 0))(
  ( (array!84777 (arr!40890 (Array (_ BitVec 32) (_ BitVec 64))) (size!41440 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84776)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84776 (_ BitVec 32)) Bool)

(assert (=> b!1283344 (= res!852479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283345 () Bool)

(declare-fun res!852483 () Bool)

(assert (=> b!1283345 (=> (not res!852483) (not e!733188))))

(declare-datatypes ((List!28971 0))(
  ( (Nil!28968) (Cons!28967 (h!30176 (_ BitVec 64)) (t!42515 List!28971)) )
))
(declare-fun arrayNoDuplicates!0 (array!84776 (_ BitVec 32) List!28971) Bool)

(assert (=> b!1283345 (= res!852483 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28968))))

(declare-fun res!852482 () Bool)

(assert (=> start!108704 (=> (not res!852482) (not e!733188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108704 (= res!852482 (validMask!0 mask!2175))))

(assert (=> start!108704 e!733188))

(declare-fun tp_is_empty!33857 () Bool)

(assert (=> start!108704 tp_is_empty!33857))

(assert (=> start!108704 true))

(declare-datatypes ((V!50245 0))(
  ( (V!50246 (val!17003 Int)) )
))
(declare-datatypes ((ValueCell!16030 0))(
  ( (ValueCellFull!16030 (v!19605 V!50245)) (EmptyCell!16030) )
))
(declare-datatypes ((array!84778 0))(
  ( (array!84779 (arr!40891 (Array (_ BitVec 32) ValueCell!16030)) (size!41441 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84778)

(declare-fun e!733189 () Bool)

(declare-fun array_inv!31019 (array!84778) Bool)

(assert (=> start!108704 (and (array_inv!31019 _values!1445) e!733189)))

(declare-fun array_inv!31020 (array!84776) Bool)

(assert (=> start!108704 (array_inv!31020 _keys!1741)))

(assert (=> start!108704 tp!99767))

(declare-fun mapIsEmpty!52343 () Bool)

(declare-fun mapRes!52343 () Bool)

(assert (=> mapIsEmpty!52343 mapRes!52343))

(declare-fun b!1283346 () Bool)

(declare-fun e!733190 () Bool)

(assert (=> b!1283346 (= e!733190 tp_is_empty!33857)))

(declare-fun b!1283347 () Bool)

(declare-fun res!852478 () Bool)

(assert (=> b!1283347 (=> (not res!852478) (not e!733188))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283347 (= res!852478 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41440 _keys!1741))))))

(declare-fun b!1283348 () Bool)

(declare-fun res!852476 () Bool)

(assert (=> b!1283348 (=> (not res!852476) (not e!733188))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283348 (= res!852476 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283349 () Bool)

(assert (=> b!1283349 (= e!733189 (and e!733190 mapRes!52343))))

(declare-fun condMapEmpty!52343 () Bool)

(declare-fun mapDefault!52343 () ValueCell!16030)

