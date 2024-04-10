; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109582 () Bool)

(assert start!109582)

(declare-fun b_free!29071 () Bool)

(declare-fun b_next!29071 () Bool)

(assert (=> start!109582 (= b_free!29071 (not b_next!29071))))

(declare-fun tp!102331 () Bool)

(declare-fun b_and!47161 () Bool)

(assert (=> start!109582 (= tp!102331 b_and!47161)))

(declare-fun mapIsEmpty!53627 () Bool)

(declare-fun mapRes!53627 () Bool)

(assert (=> mapIsEmpty!53627 mapRes!53627))

(declare-fun b!1297928 () Bool)

(declare-fun e!740506 () Bool)

(declare-fun e!740504 () Bool)

(assert (=> b!1297928 (= e!740506 (and e!740504 mapRes!53627))))

(declare-fun condMapEmpty!53627 () Bool)

(declare-datatypes ((V!51385 0))(
  ( (V!51386 (val!17430 Int)) )
))
(declare-datatypes ((ValueCell!16457 0))(
  ( (ValueCellFull!16457 (v!20033 V!51385)) (EmptyCell!16457) )
))
(declare-datatypes ((array!86430 0))(
  ( (array!86431 (arr!41716 (Array (_ BitVec 32) ValueCell!16457)) (size!42266 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86430)

(declare-fun mapDefault!53627 () ValueCell!16457)

