; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!728 () Bool)

(assert start!728)

(declare-fun b_free!161 () Bool)

(declare-fun b_next!161 () Bool)

(assert (=> start!728 (= b_free!161 (not b_next!161))))

(declare-fun tp!707 () Bool)

(declare-fun b_and!303 () Bool)

(assert (=> start!728 (= tp!707 b_and!303)))

(declare-fun b!5131 () Bool)

(declare-fun e!2752 () Bool)

(declare-datatypes ((array!411 0))(
  ( (array!412 (arr!196 (Array (_ BitVec 32) (_ BitVec 64))) (size!258 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!411)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5131 (= e!2752 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5132 () Bool)

(declare-fun e!2753 () Bool)

(declare-fun e!2751 () Bool)

(declare-fun mapRes!323 () Bool)

(assert (=> b!5132 (= e!2753 (and e!2751 mapRes!323))))

(declare-fun condMapEmpty!323 () Bool)

(declare-datatypes ((V!495 0))(
  ( (V!496 (val!125 Int)) )
))
(declare-datatypes ((ValueCell!103 0))(
  ( (ValueCellFull!103 (v!1214 V!495)) (EmptyCell!103) )
))
(declare-datatypes ((array!413 0))(
  ( (array!414 (arr!197 (Array (_ BitVec 32) ValueCell!103)) (size!259 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!413)

(declare-fun mapDefault!323 () ValueCell!103)

