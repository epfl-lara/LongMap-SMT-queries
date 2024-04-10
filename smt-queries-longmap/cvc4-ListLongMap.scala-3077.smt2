; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43358 () Bool)

(assert start!43358)

(declare-fun b_free!12185 () Bool)

(declare-fun b_next!12185 () Bool)

(assert (=> start!43358 (= b_free!12185 (not b_next!12185))))

(declare-fun tp!42831 () Bool)

(declare-fun b_and!20941 () Bool)

(assert (=> start!43358 (= tp!42831 b_and!20941)))

(declare-fun b!480264 () Bool)

(declare-fun e!282602 () Bool)

(declare-datatypes ((array!31063 0))(
  ( (array!31064 (arr!14936 (Array (_ BitVec 32) (_ BitVec 64))) (size!15294 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31063)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480264 (= e!282602 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22249 () Bool)

(declare-fun mapRes!22249 () Bool)

(assert (=> mapIsEmpty!22249 mapRes!22249))

(declare-fun b!480265 () Bool)

(declare-fun e!282601 () Bool)

(declare-fun e!282603 () Bool)

(assert (=> b!480265 (= e!282601 (and e!282603 mapRes!22249))))

(declare-fun condMapEmpty!22249 () Bool)

(declare-datatypes ((V!19333 0))(
  ( (V!19334 (val!6896 Int)) )
))
(declare-datatypes ((ValueCell!6487 0))(
  ( (ValueCellFull!6487 (v!9187 V!19333)) (EmptyCell!6487) )
))
(declare-datatypes ((array!31065 0))(
  ( (array!31066 (arr!14937 (Array (_ BitVec 32) ValueCell!6487)) (size!15295 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31065)

(declare-fun mapDefault!22249 () ValueCell!6487)

