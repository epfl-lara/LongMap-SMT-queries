; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36896 () Bool)

(assert start!36896)

(declare-fun b_free!8023 () Bool)

(declare-fun b_next!8023 () Bool)

(assert (=> start!36896 (= b_free!8023 (not b_next!8023))))

(declare-fun tp!28784 () Bool)

(declare-fun b_and!15265 () Bool)

(assert (=> start!36896 (= tp!28784 b_and!15265)))

(declare-fun b!369488 () Bool)

(declare-fun e!225818 () Bool)

(declare-fun e!225821 () Bool)

(declare-fun mapRes!14571 () Bool)

(assert (=> b!369488 (= e!225818 (and e!225821 mapRes!14571))))

(declare-fun condMapEmpty!14571 () Bool)

(declare-datatypes ((V!12667 0))(
  ( (V!12668 (val!4380 Int)) )
))
(declare-datatypes ((ValueCell!3992 0))(
  ( (ValueCellFull!3992 (v!6577 V!12667)) (EmptyCell!3992) )
))
(declare-datatypes ((array!21293 0))(
  ( (array!21294 (arr!10115 (Array (_ BitVec 32) ValueCell!3992)) (size!10467 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21293)

(declare-fun mapDefault!14571 () ValueCell!3992)

