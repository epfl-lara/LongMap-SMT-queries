; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4122 () Bool)

(assert start!4122)

(declare-fun b_free!1027 () Bool)

(declare-fun b_next!1027 () Bool)

(assert (=> start!4122 (= b_free!1027 (not b_next!1027))))

(declare-fun tp!4500 () Bool)

(declare-fun b_and!1837 () Bool)

(assert (=> start!4122 (= tp!4500 b_and!1837)))

(declare-fun mapNonEmpty!1600 () Bool)

(declare-fun mapRes!1600 () Bool)

(declare-fun tp!4501 () Bool)

(declare-fun e!19736 () Bool)

(assert (=> mapNonEmpty!1600 (= mapRes!1600 (and tp!4501 e!19736))))

(declare-datatypes ((V!1667 0))(
  ( (V!1668 (val!717 Int)) )
))
(declare-datatypes ((ValueCell!491 0))(
  ( (ValueCellFull!491 (v!1806 V!1667)) (EmptyCell!491) )
))
(declare-datatypes ((array!1989 0))(
  ( (array!1990 (arr!948 (Array (_ BitVec 32) ValueCell!491)) (size!1049 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1989)

(declare-fun mapKey!1600 () (_ BitVec 32))

(declare-fun mapRest!1600 () (Array (_ BitVec 32) ValueCell!491))

(declare-fun mapValue!1600 () ValueCell!491)

(assert (=> mapNonEmpty!1600 (= (arr!948 _values!1501) (store mapRest!1600 mapKey!1600 mapValue!1600))))

(declare-fun b!30806 () Bool)

(declare-fun e!19735 () Bool)

(declare-fun tp_is_empty!1381 () Bool)

(assert (=> b!30806 (= e!19735 tp_is_empty!1381)))

(declare-fun b!30807 () Bool)

(declare-fun e!19739 () Bool)

(assert (=> b!30807 (= e!19739 (and e!19735 mapRes!1600))))

(declare-fun condMapEmpty!1600 () Bool)

(declare-fun mapDefault!1600 () ValueCell!491)

