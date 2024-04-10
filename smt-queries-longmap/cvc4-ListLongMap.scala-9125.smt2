; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109538 () Bool)

(assert start!109538)

(declare-fun b_free!29027 () Bool)

(declare-fun b_next!29027 () Bool)

(assert (=> start!109538 (= b_free!29027 (not b_next!29027))))

(declare-fun tp!102199 () Bool)

(declare-fun b_and!47117 () Bool)

(assert (=> start!109538 (= tp!102199 b_and!47117)))

(declare-fun b!1297359 () Bool)

(declare-fun e!740177 () Bool)

(declare-fun tp_is_empty!34667 () Bool)

(assert (=> b!1297359 (= e!740177 tp_is_empty!34667)))

(declare-fun mapNonEmpty!53561 () Bool)

(declare-fun mapRes!53561 () Bool)

(declare-fun tp!102200 () Bool)

(assert (=> mapNonEmpty!53561 (= mapRes!53561 (and tp!102200 e!740177))))

(declare-fun mapKey!53561 () (_ BitVec 32))

(declare-datatypes ((V!51325 0))(
  ( (V!51326 (val!17408 Int)) )
))
(declare-datatypes ((ValueCell!16435 0))(
  ( (ValueCellFull!16435 (v!20011 V!51325)) (EmptyCell!16435) )
))
(declare-datatypes ((array!86344 0))(
  ( (array!86345 (arr!41673 (Array (_ BitVec 32) ValueCell!16435)) (size!42223 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86344)

(declare-fun mapValue!53561 () ValueCell!16435)

(declare-fun mapRest!53561 () (Array (_ BitVec 32) ValueCell!16435))

(assert (=> mapNonEmpty!53561 (= (arr!41673 _values!1445) (store mapRest!53561 mapKey!53561 mapValue!53561))))

(declare-fun res!862194 () Bool)

(declare-fun e!740173 () Bool)

(assert (=> start!109538 (=> (not res!862194) (not e!740173))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109538 (= res!862194 (validMask!0 mask!2175))))

(assert (=> start!109538 e!740173))

(assert (=> start!109538 tp_is_empty!34667))

(assert (=> start!109538 true))

(declare-fun e!740175 () Bool)

(declare-fun array_inv!31539 (array!86344) Bool)

(assert (=> start!109538 (and (array_inv!31539 _values!1445) e!740175)))

(declare-datatypes ((array!86346 0))(
  ( (array!86347 (arr!41674 (Array (_ BitVec 32) (_ BitVec 64))) (size!42224 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86346)

(declare-fun array_inv!31540 (array!86346) Bool)

(assert (=> start!109538 (array_inv!31540 _keys!1741)))

(assert (=> start!109538 tp!102199))

(declare-fun b!1297360 () Bool)

(declare-fun res!862197 () Bool)

(assert (=> b!1297360 (=> (not res!862197) (not e!740173))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297360 (= res!862197 (and (= (size!42223 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42224 _keys!1741) (size!42223 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297361 () Bool)

(declare-fun e!740174 () Bool)

(assert (=> b!1297361 (= e!740175 (and e!740174 mapRes!53561))))

(declare-fun condMapEmpty!53561 () Bool)

(declare-fun mapDefault!53561 () ValueCell!16435)

