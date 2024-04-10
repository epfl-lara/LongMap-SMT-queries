; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110666 () Bool)

(assert start!110666)

(declare-fun b_free!29501 () Bool)

(declare-fun b_next!29501 () Bool)

(assert (=> start!110666 (= b_free!29501 (not b_next!29501))))

(declare-fun tp!103824 () Bool)

(declare-fun b_and!47709 () Bool)

(assert (=> start!110666 (= tp!103824 b_and!47709)))

(declare-fun b!1309475 () Bool)

(declare-fun e!747121 () Bool)

(declare-fun e!747120 () Bool)

(declare-fun mapRes!54475 () Bool)

(assert (=> b!1309475 (= e!747121 (and e!747120 mapRes!54475))))

(declare-fun condMapEmpty!54475 () Bool)

(declare-datatypes ((V!52077 0))(
  ( (V!52078 (val!17690 Int)) )
))
(declare-datatypes ((ValueCell!16717 0))(
  ( (ValueCellFull!16717 (v!20317 V!52077)) (EmptyCell!16717) )
))
(declare-datatypes ((array!87454 0))(
  ( (array!87455 (arr!42207 (Array (_ BitVec 32) ValueCell!16717)) (size!42757 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87454)

(declare-fun mapDefault!54475 () ValueCell!16717)

