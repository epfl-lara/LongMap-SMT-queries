; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110504 () Bool)

(assert start!110504)

(declare-fun b_free!29339 () Bool)

(declare-fun b_next!29339 () Bool)

(assert (=> start!110504 (= b_free!29339 (not b_next!29339))))

(declare-fun tp!103339 () Bool)

(declare-fun b_and!47547 () Bool)

(assert (=> start!110504 (= tp!103339 b_and!47547)))

(declare-fun b!1307207 () Bool)

(declare-fun res!867729 () Bool)

(declare-fun e!745904 () Bool)

(assert (=> b!1307207 (=> (not res!867729) (not e!745904))))

(declare-datatypes ((array!87142 0))(
  ( (array!87143 (arr!42051 (Array (_ BitVec 32) (_ BitVec 64))) (size!42601 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87142)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51861 0))(
  ( (V!51862 (val!17609 Int)) )
))
(declare-datatypes ((ValueCell!16636 0))(
  ( (ValueCellFull!16636 (v!20236 V!51861)) (EmptyCell!16636) )
))
(declare-datatypes ((array!87144 0))(
  ( (array!87145 (arr!42052 (Array (_ BitVec 32) ValueCell!16636)) (size!42602 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87144)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307207 (= res!867729 (and (= (size!42602 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42601 _keys!1628) (size!42602 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307208 () Bool)

(declare-fun res!867728 () Bool)

(assert (=> b!1307208 (=> (not res!867728) (not e!745904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87142 (_ BitVec 32)) Bool)

(assert (=> b!1307208 (= res!867728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307209 () Bool)

(declare-fun e!745907 () Bool)

(declare-fun e!745903 () Bool)

(declare-fun mapRes!54232 () Bool)

(assert (=> b!1307209 (= e!745907 (and e!745903 mapRes!54232))))

(declare-fun condMapEmpty!54232 () Bool)

(declare-fun mapDefault!54232 () ValueCell!16636)

