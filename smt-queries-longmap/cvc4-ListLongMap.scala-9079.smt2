; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109262 () Bool)

(assert start!109262)

(declare-fun b_free!28751 () Bool)

(declare-fun b_next!28751 () Bool)

(assert (=> start!109262 (= b_free!28751 (not b_next!28751))))

(declare-fun tp!101372 () Bool)

(declare-fun b_and!46841 () Bool)

(assert (=> start!109262 (= tp!101372 b_and!46841)))

(declare-fun res!858960 () Bool)

(declare-fun e!737818 () Bool)

(assert (=> start!109262 (=> (not res!858960) (not e!737818))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109262 (= res!858960 (validMask!0 mask!2175))))

(assert (=> start!109262 e!737818))

(declare-fun tp_is_empty!34391 () Bool)

(assert (=> start!109262 tp_is_empty!34391))

(assert (=> start!109262 true))

(declare-datatypes ((V!50957 0))(
  ( (V!50958 (val!17270 Int)) )
))
(declare-datatypes ((ValueCell!16297 0))(
  ( (ValueCellFull!16297 (v!19873 V!50957)) (EmptyCell!16297) )
))
(declare-datatypes ((array!85814 0))(
  ( (array!85815 (arr!41408 (Array (_ BitVec 32) ValueCell!16297)) (size!41958 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85814)

(declare-fun e!737815 () Bool)

(declare-fun array_inv!31373 (array!85814) Bool)

(assert (=> start!109262 (and (array_inv!31373 _values!1445) e!737815)))

(declare-datatypes ((array!85816 0))(
  ( (array!85817 (arr!41409 (Array (_ BitVec 32) (_ BitVec 64))) (size!41959 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85816)

(declare-fun array_inv!31374 (array!85816) Bool)

(assert (=> start!109262 (array_inv!31374 _keys!1741)))

(assert (=> start!109262 tp!101372))

(declare-fun mapNonEmpty!53147 () Bool)

(declare-fun mapRes!53147 () Bool)

(declare-fun tp!101371 () Bool)

(declare-fun e!737817 () Bool)

(assert (=> mapNonEmpty!53147 (= mapRes!53147 (and tp!101371 e!737817))))

(declare-fun mapValue!53147 () ValueCell!16297)

(declare-fun mapKey!53147 () (_ BitVec 32))

(declare-fun mapRest!53147 () (Array (_ BitVec 32) ValueCell!16297))

(assert (=> mapNonEmpty!53147 (= (arr!41408 _values!1445) (store mapRest!53147 mapKey!53147 mapValue!53147))))

(declare-fun b!1292720 () Bool)

(declare-fun res!858963 () Bool)

(assert (=> b!1292720 (=> (not res!858963) (not e!737818))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292720 (= res!858963 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41959 _keys!1741))))))

(declare-fun b!1292721 () Bool)

(declare-fun e!737816 () Bool)

(assert (=> b!1292721 (= e!737815 (and e!737816 mapRes!53147))))

(declare-fun condMapEmpty!53147 () Bool)

(declare-fun mapDefault!53147 () ValueCell!16297)

