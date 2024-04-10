; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84622 () Bool)

(assert start!84622)

(declare-fun b_free!20047 () Bool)

(declare-fun b_next!20047 () Bool)

(assert (=> start!84622 (= b_free!20047 (not b_next!20047))))

(declare-fun tp!69932 () Bool)

(declare-fun b_and!32179 () Bool)

(assert (=> start!84622 (= tp!69932 b_and!32179)))

(declare-fun b!989645 () Bool)

(declare-fun e!558047 () Bool)

(declare-fun e!558051 () Bool)

(declare-fun mapRes!36940 () Bool)

(assert (=> b!989645 (= e!558047 (and e!558051 mapRes!36940))))

(declare-fun condMapEmpty!36940 () Bool)

(declare-datatypes ((V!36001 0))(
  ( (V!36002 (val!11682 Int)) )
))
(declare-datatypes ((ValueCell!11150 0))(
  ( (ValueCellFull!11150 (v!14252 V!36001)) (EmptyCell!11150) )
))
(declare-datatypes ((array!62487 0))(
  ( (array!62488 (arr!30096 (Array (_ BitVec 32) ValueCell!11150)) (size!30575 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62487)

(declare-fun mapDefault!36940 () ValueCell!11150)

