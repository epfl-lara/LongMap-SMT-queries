; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109520 () Bool)

(assert start!109520)

(declare-fun b_free!29009 () Bool)

(declare-fun b_next!29009 () Bool)

(assert (=> start!109520 (= b_free!29009 (not b_next!29009))))

(declare-fun tp!102145 () Bool)

(declare-fun b_and!47099 () Bool)

(assert (=> start!109520 (= tp!102145 b_and!47099)))

(declare-fun b!1297143 () Bool)

(declare-fun e!740039 () Bool)

(declare-fun e!740040 () Bool)

(declare-fun mapRes!53534 () Bool)

(assert (=> b!1297143 (= e!740039 (and e!740040 mapRes!53534))))

(declare-fun condMapEmpty!53534 () Bool)

(declare-datatypes ((V!51301 0))(
  ( (V!51302 (val!17399 Int)) )
))
(declare-datatypes ((ValueCell!16426 0))(
  ( (ValueCellFull!16426 (v!20002 V!51301)) (EmptyCell!16426) )
))
(declare-datatypes ((array!86310 0))(
  ( (array!86311 (arr!41656 (Array (_ BitVec 32) ValueCell!16426)) (size!42206 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86310)

(declare-fun mapDefault!53534 () ValueCell!16426)

