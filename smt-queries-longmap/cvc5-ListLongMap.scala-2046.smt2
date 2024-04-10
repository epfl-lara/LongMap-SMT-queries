; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35444 () Bool)

(assert start!35444)

(declare-fun b_free!7831 () Bool)

(declare-fun b_next!7831 () Bool)

(assert (=> start!35444 (= b_free!7831 (not b_next!7831))))

(declare-fun tp!27278 () Bool)

(declare-fun b_and!15073 () Bool)

(assert (=> start!35444 (= tp!27278 b_and!15073)))

(declare-fun b!354956 () Bool)

(declare-fun e!217524 () Bool)

(declare-fun e!217525 () Bool)

(declare-fun mapRes!13353 () Bool)

(assert (=> b!354956 (= e!217524 (and e!217525 mapRes!13353))))

(declare-fun condMapEmpty!13353 () Bool)

(declare-datatypes ((V!11507 0))(
  ( (V!11508 (val!3993 Int)) )
))
(declare-datatypes ((ValueCell!3605 0))(
  ( (ValueCellFull!3605 (v!6187 V!11507)) (EmptyCell!3605) )
))
(declare-datatypes ((array!19375 0))(
  ( (array!19376 (arr!9181 (Array (_ BitVec 32) ValueCell!3605)) (size!9533 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19375)

(declare-fun mapDefault!13353 () ValueCell!3605)

