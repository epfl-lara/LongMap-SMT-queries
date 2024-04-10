; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43288 () Bool)

(assert start!43288)

(declare-fun b_free!12155 () Bool)

(declare-fun b_next!12155 () Bool)

(assert (=> start!43288 (= b_free!12155 (not b_next!12155))))

(declare-fun tp!42736 () Bool)

(declare-fun b_and!20907 () Bool)

(assert (=> start!43288 (= tp!42736 b_and!20907)))

(declare-fun b!479594 () Bool)

(declare-fun e!282178 () Bool)

(declare-fun tp_is_empty!13667 () Bool)

(assert (=> b!479594 (= e!282178 tp_is_empty!13667)))

(declare-fun mapNonEmpty!22198 () Bool)

(declare-fun mapRes!22198 () Bool)

(declare-fun tp!42735 () Bool)

(declare-fun e!282180 () Bool)

(assert (=> mapNonEmpty!22198 (= mapRes!22198 (and tp!42735 e!282180))))

(declare-datatypes ((V!19293 0))(
  ( (V!19294 (val!6881 Int)) )
))
(declare-datatypes ((ValueCell!6472 0))(
  ( (ValueCellFull!6472 (v!9170 V!19293)) (EmptyCell!6472) )
))
(declare-fun mapRest!22198 () (Array (_ BitVec 32) ValueCell!6472))

(declare-fun mapKey!22198 () (_ BitVec 32))

(declare-fun mapValue!22198 () ValueCell!6472)

(declare-datatypes ((array!31005 0))(
  ( (array!31006 (arr!14909 (Array (_ BitVec 32) ValueCell!6472)) (size!15267 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31005)

(assert (=> mapNonEmpty!22198 (= (arr!14909 _values!1516) (store mapRest!22198 mapKey!22198 mapValue!22198))))

(declare-fun b!479595 () Bool)

(assert (=> b!479595 (= e!282180 tp_is_empty!13667)))

(declare-fun b!479596 () Bool)

(declare-fun e!282179 () Bool)

(assert (=> b!479596 (= e!282179 (and e!282178 mapRes!22198))))

(declare-fun condMapEmpty!22198 () Bool)

(declare-fun mapDefault!22198 () ValueCell!6472)

