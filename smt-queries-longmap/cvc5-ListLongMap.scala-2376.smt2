; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37718 () Bool)

(assert start!37718)

(declare-fun b_free!8821 () Bool)

(declare-fun b_next!8821 () Bool)

(assert (=> start!37718 (= b_free!8821 (not b_next!8821))))

(declare-fun tp!31214 () Bool)

(declare-fun b_and!16063 () Bool)

(assert (=> start!37718 (= tp!31214 b_and!16063)))

(declare-fun b!386714 () Bool)

(declare-fun res!220826 () Bool)

(declare-fun e!234560 () Bool)

(assert (=> b!386714 (=> (not res!220826) (not e!234560))))

(declare-datatypes ((array!22881 0))(
  ( (array!22882 (arr!10909 (Array (_ BitVec 32) (_ BitVec 64))) (size!11261 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22881)

(declare-datatypes ((List!6290 0))(
  ( (Nil!6287) (Cons!6286 (h!7142 (_ BitVec 64)) (t!11440 List!6290)) )
))
(declare-fun arrayNoDuplicates!0 (array!22881 (_ BitVec 32) List!6290) Bool)

(assert (=> b!386714 (= res!220826 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6287))))

(declare-fun b!386715 () Bool)

(declare-fun e!234558 () Bool)

(declare-fun e!234557 () Bool)

(declare-fun mapRes!15804 () Bool)

(assert (=> b!386715 (= e!234558 (and e!234557 mapRes!15804))))

(declare-fun condMapEmpty!15804 () Bool)

(declare-datatypes ((V!13763 0))(
  ( (V!13764 (val!4791 Int)) )
))
(declare-datatypes ((ValueCell!4403 0))(
  ( (ValueCellFull!4403 (v!6988 V!13763)) (EmptyCell!4403) )
))
(declare-datatypes ((array!22883 0))(
  ( (array!22884 (arr!10910 (Array (_ BitVec 32) ValueCell!4403)) (size!11262 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22883)

(declare-fun mapDefault!15804 () ValueCell!4403)

