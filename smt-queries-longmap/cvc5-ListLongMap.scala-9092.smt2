; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109336 () Bool)

(assert start!109336)

(declare-fun b_free!28825 () Bool)

(declare-fun b_next!28825 () Bool)

(assert (=> start!109336 (= b_free!28825 (not b_next!28825))))

(declare-fun tp!101594 () Bool)

(declare-fun b_and!46915 () Bool)

(assert (=> start!109336 (= tp!101594 b_and!46915)))

(declare-fun res!859946 () Bool)

(declare-fun e!738472 () Bool)

(assert (=> start!109336 (=> (not res!859946) (not e!738472))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109336 (= res!859946 (validMask!0 mask!2175))))

(assert (=> start!109336 e!738472))

(declare-fun tp_is_empty!34465 () Bool)

(assert (=> start!109336 tp_is_empty!34465))

(assert (=> start!109336 true))

(declare-datatypes ((V!51057 0))(
  ( (V!51058 (val!17307 Int)) )
))
(declare-datatypes ((ValueCell!16334 0))(
  ( (ValueCellFull!16334 (v!19910 V!51057)) (EmptyCell!16334) )
))
(declare-datatypes ((array!85952 0))(
  ( (array!85953 (arr!41477 (Array (_ BitVec 32) ValueCell!16334)) (size!42027 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85952)

(declare-fun e!738470 () Bool)

(declare-fun array_inv!31415 (array!85952) Bool)

(assert (=> start!109336 (and (array_inv!31415 _values!1445) e!738470)))

(declare-datatypes ((array!85954 0))(
  ( (array!85955 (arr!41478 (Array (_ BitVec 32) (_ BitVec 64))) (size!42028 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85954)

(declare-fun array_inv!31416 (array!85954) Bool)

(assert (=> start!109336 (array_inv!31416 _keys!1741)))

(assert (=> start!109336 tp!101594))

(declare-fun b!1294041 () Bool)

(declare-fun e!738473 () Bool)

(assert (=> b!1294041 (= e!738473 tp_is_empty!34465)))

(declare-fun b!1294042 () Bool)

(declare-fun e!738471 () Bool)

(declare-fun mapRes!53258 () Bool)

(assert (=> b!1294042 (= e!738470 (and e!738471 mapRes!53258))))

(declare-fun condMapEmpty!53258 () Bool)

(declare-fun mapDefault!53258 () ValueCell!16334)

