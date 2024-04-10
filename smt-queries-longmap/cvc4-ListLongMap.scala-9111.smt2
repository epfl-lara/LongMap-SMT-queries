; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109454 () Bool)

(assert start!109454)

(declare-fun b_free!28943 () Bool)

(declare-fun b_next!28943 () Bool)

(assert (=> start!109454 (= b_free!28943 (not b_next!28943))))

(declare-fun tp!101947 () Bool)

(declare-fun b_and!47033 () Bool)

(assert (=> start!109454 (= tp!101947 b_and!47033)))

(declare-fun b!1296096 () Bool)

(declare-fun res!861474 () Bool)

(declare-fun e!739466 () Bool)

(assert (=> b!1296096 (=> (not res!861474) (not e!739466))))

(declare-datatypes ((array!86184 0))(
  ( (array!86185 (arr!41593 (Array (_ BitVec 32) (_ BitVec 64))) (size!42143 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86184)

(declare-datatypes ((List!29507 0))(
  ( (Nil!29504) (Cons!29503 (h!30712 (_ BitVec 64)) (t!43071 List!29507)) )
))
(declare-fun arrayNoDuplicates!0 (array!86184 (_ BitVec 32) List!29507) Bool)

(assert (=> b!1296096 (= res!861474 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29504))))

(declare-fun b!1296097 () Bool)

(declare-fun e!739461 () Bool)

(declare-fun tp_is_empty!34583 () Bool)

(assert (=> b!1296097 (= e!739461 tp_is_empty!34583)))

(declare-fun b!1296098 () Bool)

(declare-fun e!739465 () Bool)

(declare-fun mapRes!53435 () Bool)

(assert (=> b!1296098 (= e!739465 (and e!739461 mapRes!53435))))

(declare-fun condMapEmpty!53435 () Bool)

(declare-datatypes ((V!51213 0))(
  ( (V!51214 (val!17366 Int)) )
))
(declare-datatypes ((ValueCell!16393 0))(
  ( (ValueCellFull!16393 (v!19969 V!51213)) (EmptyCell!16393) )
))
(declare-datatypes ((array!86186 0))(
  ( (array!86187 (arr!41594 (Array (_ BitVec 32) ValueCell!16393)) (size!42144 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86186)

(declare-fun mapDefault!53435 () ValueCell!16393)

