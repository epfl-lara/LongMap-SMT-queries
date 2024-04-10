; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109726 () Bool)

(assert start!109726)

(declare-fun b_free!29159 () Bool)

(declare-fun b_next!29159 () Bool)

(assert (=> start!109726 (= b_free!29159 (not b_next!29159))))

(declare-fun tp!102605 () Bool)

(declare-fun b_and!47261 () Bool)

(assert (=> start!109726 (= tp!102605 b_and!47261)))

(declare-fun b!1299708 () Bool)

(declare-fun res!863712 () Bool)

(declare-fun e!741448 () Bool)

(assert (=> b!1299708 (=> (not res!863712) (not e!741448))))

(declare-datatypes ((array!86606 0))(
  ( (array!86607 (arr!41801 (Array (_ BitVec 32) (_ BitVec 64))) (size!42351 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86606)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86606 (_ BitVec 32)) Bool)

(assert (=> b!1299708 (= res!863712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299709 () Bool)

(declare-fun res!863711 () Bool)

(assert (=> b!1299709 (=> (not res!863711) (not e!741448))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1299709 (= res!863711 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42351 _keys!1741))))))

(declare-fun b!1299710 () Bool)

(declare-fun e!741450 () Bool)

(declare-fun e!741449 () Bool)

(declare-fun mapRes!53768 () Bool)

(assert (=> b!1299710 (= e!741450 (and e!741449 mapRes!53768))))

(declare-fun condMapEmpty!53768 () Bool)

(declare-datatypes ((V!51501 0))(
  ( (V!51502 (val!17474 Int)) )
))
(declare-datatypes ((ValueCell!16501 0))(
  ( (ValueCellFull!16501 (v!20080 V!51501)) (EmptyCell!16501) )
))
(declare-datatypes ((array!86608 0))(
  ( (array!86609 (arr!41802 (Array (_ BitVec 32) ValueCell!16501)) (size!42352 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86608)

(declare-fun mapDefault!53768 () ValueCell!16501)

