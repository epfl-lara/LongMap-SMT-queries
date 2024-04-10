; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109662 () Bool)

(assert start!109662)

(declare-fun b_free!29131 () Bool)

(declare-fun b_next!29131 () Bool)

(assert (=> start!109662 (= b_free!29131 (not b_next!29131))))

(declare-fun tp!102515 () Bool)

(declare-fun b_and!47225 () Bool)

(assert (=> start!109662 (= tp!102515 b_and!47225)))

(declare-fun b!1298983 () Bool)

(declare-fun e!741063 () Bool)

(declare-fun e!741060 () Bool)

(declare-fun mapRes!53720 () Bool)

(assert (=> b!1298983 (= e!741063 (and e!741060 mapRes!53720))))

(declare-fun condMapEmpty!53720 () Bool)

(declare-datatypes ((V!51465 0))(
  ( (V!51466 (val!17460 Int)) )
))
(declare-datatypes ((ValueCell!16487 0))(
  ( (ValueCellFull!16487 (v!20064 V!51465)) (EmptyCell!16487) )
))
(declare-datatypes ((array!86550 0))(
  ( (array!86551 (arr!41775 (Array (_ BitVec 32) ValueCell!16487)) (size!42325 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86550)

(declare-fun mapDefault!53720 () ValueCell!16487)

