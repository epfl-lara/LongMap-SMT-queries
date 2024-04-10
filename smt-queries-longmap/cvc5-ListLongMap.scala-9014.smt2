; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108844 () Bool)

(assert start!108844)

(declare-fun b_free!28357 () Bool)

(declare-fun b_next!28357 () Bool)

(assert (=> start!108844 (= b_free!28357 (not b_next!28357))))

(declare-fun tp!100187 () Bool)

(declare-fun b_and!46423 () Bool)

(assert (=> start!108844 (= tp!100187 b_and!46423)))

(declare-fun b!1285415 () Bool)

(declare-fun e!734239 () Bool)

(declare-fun e!734238 () Bool)

(declare-fun mapRes!52553 () Bool)

(assert (=> b!1285415 (= e!734239 (and e!734238 mapRes!52553))))

(declare-fun condMapEmpty!52553 () Bool)

(declare-datatypes ((V!50433 0))(
  ( (V!50434 (val!17073 Int)) )
))
(declare-datatypes ((ValueCell!16100 0))(
  ( (ValueCellFull!16100 (v!19675 V!50433)) (EmptyCell!16100) )
))
(declare-datatypes ((array!85052 0))(
  ( (array!85053 (arr!41028 (Array (_ BitVec 32) ValueCell!16100)) (size!41578 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85052)

(declare-fun mapDefault!52553 () ValueCell!16100)

