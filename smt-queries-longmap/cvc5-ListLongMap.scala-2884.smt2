; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41434 () Bool)

(assert start!41434)

(declare-fun b_free!11113 () Bool)

(declare-fun b_next!11113 () Bool)

(assert (=> start!41434 (= b_free!11113 (not b_next!11113))))

(declare-fun tp!39334 () Bool)

(declare-fun b_and!19449 () Bool)

(assert (=> start!41434 (= tp!39334 b_and!19449)))

(declare-fun mapIsEmpty!20485 () Bool)

(declare-fun mapRes!20485 () Bool)

(assert (=> mapIsEmpty!20485 mapRes!20485))

(declare-fun mapNonEmpty!20485 () Bool)

(declare-fun tp!39333 () Bool)

(declare-fun e!270246 () Bool)

(assert (=> mapNonEmpty!20485 (= mapRes!20485 (and tp!39333 e!270246))))

(declare-datatypes ((V!17827 0))(
  ( (V!17828 (val!6315 Int)) )
))
(declare-datatypes ((ValueCell!5927 0))(
  ( (ValueCellFull!5927 (v!8602 V!17827)) (EmptyCell!5927) )
))
(declare-datatypes ((array!28883 0))(
  ( (array!28884 (arr!13874 (Array (_ BitVec 32) ValueCell!5927)) (size!14226 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28883)

(declare-fun mapKey!20485 () (_ BitVec 32))

(declare-fun mapRest!20485 () (Array (_ BitVec 32) ValueCell!5927))

(declare-fun mapValue!20485 () ValueCell!5927)

(assert (=> mapNonEmpty!20485 (= (arr!13874 _values!833) (store mapRest!20485 mapKey!20485 mapValue!20485))))

(declare-fun b!462960 () Bool)

(declare-fun e!270245 () Bool)

(declare-fun e!270249 () Bool)

(assert (=> b!462960 (= e!270245 (and e!270249 mapRes!20485))))

(declare-fun condMapEmpty!20485 () Bool)

(declare-fun mapDefault!20485 () ValueCell!5927)

