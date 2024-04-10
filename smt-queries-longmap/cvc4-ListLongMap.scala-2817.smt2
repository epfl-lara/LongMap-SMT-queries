; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40816 () Bool)

(assert start!40816)

(declare-fun b_free!10805 () Bool)

(declare-fun b_next!10805 () Bool)

(assert (=> start!40816 (= b_free!10805 (not b_next!10805))))

(declare-fun tp!38238 () Bool)

(declare-fun b_and!18897 () Bool)

(assert (=> start!40816 (= tp!38238 b_and!18897)))

(declare-fun mapNonEmpty!19851 () Bool)

(declare-fun mapRes!19851 () Bool)

(declare-fun tp!38237 () Bool)

(declare-fun e!265225 () Bool)

(assert (=> mapNonEmpty!19851 (= mapRes!19851 (and tp!38237 e!265225))))

(declare-datatypes ((V!17295 0))(
  ( (V!17296 (val!6116 Int)) )
))
(declare-datatypes ((ValueCell!5728 0))(
  ( (ValueCellFull!5728 (v!8375 V!17295)) (EmptyCell!5728) )
))
(declare-datatypes ((array!28093 0))(
  ( (array!28094 (arr!13491 (Array (_ BitVec 32) ValueCell!5728)) (size!13843 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28093)

(declare-fun mapRest!19851 () (Array (_ BitVec 32) ValueCell!5728))

(declare-fun mapValue!19851 () ValueCell!5728)

(declare-fun mapKey!19851 () (_ BitVec 32))

(assert (=> mapNonEmpty!19851 (= (arr!13491 _values!549) (store mapRest!19851 mapKey!19851 mapValue!19851))))

(declare-fun b!453120 () Bool)

(declare-fun e!265229 () Bool)

(declare-fun e!265227 () Bool)

(assert (=> b!453120 (= e!265229 (and e!265227 mapRes!19851))))

(declare-fun condMapEmpty!19851 () Bool)

(declare-fun mapDefault!19851 () ValueCell!5728)

