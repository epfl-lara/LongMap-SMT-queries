; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37568 () Bool)

(assert start!37568)

(declare-fun b_free!8695 () Bool)

(declare-fun b_next!8695 () Bool)

(assert (=> start!37568 (= b_free!8695 (not b_next!8695))))

(declare-fun tp!30800 () Bool)

(declare-fun b_and!15937 () Bool)

(assert (=> start!37568 (= tp!30800 b_and!15937)))

(declare-fun b!383872 () Bool)

(declare-fun e!233117 () Bool)

(declare-fun e!233118 () Bool)

(declare-fun mapRes!15579 () Bool)

(assert (=> b!383872 (= e!233117 (and e!233118 mapRes!15579))))

(declare-fun condMapEmpty!15579 () Bool)

(declare-datatypes ((V!13563 0))(
  ( (V!13564 (val!4716 Int)) )
))
(declare-datatypes ((ValueCell!4328 0))(
  ( (ValueCellFull!4328 (v!6913 V!13563)) (EmptyCell!4328) )
))
(declare-datatypes ((array!22593 0))(
  ( (array!22594 (arr!10765 (Array (_ BitVec 32) ValueCell!4328)) (size!11117 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22593)

(declare-fun mapDefault!15579 () ValueCell!4328)

