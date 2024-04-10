; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110962 () Bool)

(assert start!110962)

(declare-fun b_free!29797 () Bool)

(declare-fun b_next!29797 () Bool)

(assert (=> start!110962 (= b_free!29797 (not b_next!29797))))

(declare-fun tp!104713 () Bool)

(declare-fun b_and!48005 () Bool)

(assert (=> start!110962 (= tp!104713 b_and!48005)))

(declare-fun b!1313702 () Bool)

(declare-fun e!749340 () Bool)

(declare-fun e!749338 () Bool)

(declare-fun mapRes!54919 () Bool)

(assert (=> b!1313702 (= e!749340 (and e!749338 mapRes!54919))))

(declare-fun condMapEmpty!54919 () Bool)

(declare-datatypes ((V!52473 0))(
  ( (V!52474 (val!17838 Int)) )
))
(declare-datatypes ((ValueCell!16865 0))(
  ( (ValueCellFull!16865 (v!20465 V!52473)) (EmptyCell!16865) )
))
(declare-datatypes ((array!88030 0))(
  ( (array!88031 (arr!42495 (Array (_ BitVec 32) ValueCell!16865)) (size!43045 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88030)

(declare-fun mapDefault!54919 () ValueCell!16865)

