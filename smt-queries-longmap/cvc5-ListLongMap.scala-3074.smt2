; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43296 () Bool)

(assert start!43296)

(declare-fun b_free!12163 () Bool)

(declare-fun b_next!12163 () Bool)

(assert (=> start!43296 (= b_free!12163 (not b_next!12163))))

(declare-fun tp!42759 () Bool)

(declare-fun b_and!20915 () Bool)

(assert (=> start!43296 (= tp!42759 b_and!20915)))

(declare-fun mapNonEmpty!22210 () Bool)

(declare-fun mapRes!22210 () Bool)

(declare-fun tp!42760 () Bool)

(declare-fun e!282238 () Bool)

(assert (=> mapNonEmpty!22210 (= mapRes!22210 (and tp!42760 e!282238))))

(declare-datatypes ((V!19305 0))(
  ( (V!19306 (val!6885 Int)) )
))
(declare-datatypes ((ValueCell!6476 0))(
  ( (ValueCellFull!6476 (v!9174 V!19305)) (EmptyCell!6476) )
))
(declare-fun mapRest!22210 () (Array (_ BitVec 32) ValueCell!6476))

(declare-fun mapKey!22210 () (_ BitVec 32))

(declare-fun mapValue!22210 () ValueCell!6476)

(declare-datatypes ((array!31019 0))(
  ( (array!31020 (arr!14916 (Array (_ BitVec 32) ValueCell!6476)) (size!15274 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31019)

(assert (=> mapNonEmpty!22210 (= (arr!14916 _values!1516) (store mapRest!22210 mapKey!22210 mapValue!22210))))

(declare-fun b!479678 () Bool)

(declare-fun e!282240 () Bool)

(declare-fun e!282237 () Bool)

(assert (=> b!479678 (= e!282240 (and e!282237 mapRes!22210))))

(declare-fun condMapEmpty!22210 () Bool)

(declare-fun mapDefault!22210 () ValueCell!6476)

