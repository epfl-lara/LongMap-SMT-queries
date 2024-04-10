; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109222 () Bool)

(assert start!109222)

(declare-fun b_free!28711 () Bool)

(declare-fun b_next!28711 () Bool)

(assert (=> start!109222 (= b_free!28711 (not b_next!28711))))

(declare-fun tp!101251 () Bool)

(declare-fun b_and!46801 () Bool)

(assert (=> start!109222 (= tp!101251 b_and!46801)))

(declare-fun b!1292052 () Bool)

(declare-fun res!858470 () Bool)

(declare-fun e!737506 () Bool)

(assert (=> b!1292052 (=> (not res!858470) (not e!737506))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50905 0))(
  ( (V!50906 (val!17250 Int)) )
))
(declare-datatypes ((ValueCell!16277 0))(
  ( (ValueCellFull!16277 (v!19853 V!50905)) (EmptyCell!16277) )
))
(declare-datatypes ((array!85736 0))(
  ( (array!85737 (arr!41369 (Array (_ BitVec 32) ValueCell!16277)) (size!41919 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85736)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85738 0))(
  ( (array!85739 (arr!41370 (Array (_ BitVec 32) (_ BitVec 64))) (size!41920 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85738)

(assert (=> b!1292052 (= res!858470 (and (= (size!41919 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41920 _keys!1741) (size!41919 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292053 () Bool)

(declare-fun res!858473 () Bool)

(assert (=> b!1292053 (=> (not res!858473) (not e!737506))))

(declare-datatypes ((List!29342 0))(
  ( (Nil!29339) (Cons!29338 (h!30547 (_ BitVec 64)) (t!42906 List!29342)) )
))
(declare-fun arrayNoDuplicates!0 (array!85738 (_ BitVec 32) List!29342) Bool)

(assert (=> b!1292053 (= res!858473 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29339))))

(declare-fun b!1292054 () Bool)

(declare-fun res!858477 () Bool)

(assert (=> b!1292054 (=> (not res!858477) (not e!737506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85738 (_ BitVec 32)) Bool)

(assert (=> b!1292054 (= res!858477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292055 () Bool)

(declare-fun res!858472 () Bool)

(assert (=> b!1292055 (=> (not res!858472) (not e!737506))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292055 (= res!858472 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41920 _keys!1741))))))

(declare-fun b!1292056 () Bool)

(declare-fun e!737509 () Bool)

(declare-fun tp_is_empty!34351 () Bool)

(assert (=> b!1292056 (= e!737509 tp_is_empty!34351)))

(declare-fun b!1292057 () Bool)

(declare-fun e!737510 () Bool)

(declare-fun e!737507 () Bool)

(declare-fun mapRes!53087 () Bool)

(assert (=> b!1292057 (= e!737510 (and e!737507 mapRes!53087))))

(declare-fun condMapEmpty!53087 () Bool)

(declare-fun mapDefault!53087 () ValueCell!16277)

