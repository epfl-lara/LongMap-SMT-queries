; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74796 () Bool)

(assert start!74796)

(declare-fun b_free!15373 () Bool)

(declare-fun b_next!15373 () Bool)

(assert (=> start!74796 (= b_free!15373 (not b_next!15373))))

(declare-fun tp!53816 () Bool)

(declare-fun b_and!25413 () Bool)

(assert (=> start!74796 (= tp!53816 b_and!25413)))

(declare-fun b!881644 () Bool)

(declare-fun e!490664 () Bool)

(declare-fun e!490658 () Bool)

(declare-fun mapRes!28056 () Bool)

(assert (=> b!881644 (= e!490664 (and e!490658 mapRes!28056))))

(declare-fun condMapEmpty!28056 () Bool)

(declare-datatypes ((V!28537 0))(
  ( (V!28538 (val!8856 Int)) )
))
(declare-datatypes ((ValueCell!8369 0))(
  ( (ValueCellFull!8369 (v!11316 V!28537)) (EmptyCell!8369) )
))
(declare-datatypes ((array!51364 0))(
  ( (array!51365 (arr!24703 (Array (_ BitVec 32) ValueCell!8369)) (size!25143 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51364)

(declare-fun mapDefault!28056 () ValueCell!8369)

