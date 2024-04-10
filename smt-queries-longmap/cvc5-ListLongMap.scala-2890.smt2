; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41482 () Bool)

(assert start!41482)

(declare-fun b_free!11149 () Bool)

(declare-fun b_next!11149 () Bool)

(assert (=> start!41482 (= b_free!11149 (not b_next!11149))))

(declare-fun tp!39444 () Bool)

(declare-fun b_and!19489 () Bool)

(assert (=> start!41482 (= tp!39444 b_and!19489)))

(declare-fun b!463411 () Bool)

(declare-fun e!270563 () Bool)

(declare-fun tp_is_empty!12577 () Bool)

(assert (=> b!463411 (= e!270563 tp_is_empty!12577)))

(declare-fun b!463412 () Bool)

(declare-fun e!270564 () Bool)

(declare-fun e!270565 () Bool)

(declare-fun mapRes!20542 () Bool)

(assert (=> b!463412 (= e!270564 (and e!270565 mapRes!20542))))

(declare-fun condMapEmpty!20542 () Bool)

(declare-datatypes ((V!17875 0))(
  ( (V!17876 (val!6333 Int)) )
))
(declare-datatypes ((ValueCell!5945 0))(
  ( (ValueCellFull!5945 (v!8620 V!17875)) (EmptyCell!5945) )
))
(declare-datatypes ((array!28951 0))(
  ( (array!28952 (arr!13907 (Array (_ BitVec 32) ValueCell!5945)) (size!14259 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28951)

(declare-fun mapDefault!20542 () ValueCell!5945)

