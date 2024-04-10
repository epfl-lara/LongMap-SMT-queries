; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37016 () Bool)

(assert start!37016)

(declare-fun b_free!8143 () Bool)

(declare-fun b_next!8143 () Bool)

(assert (=> start!37016 (= b_free!8143 (not b_next!8143))))

(declare-fun tp!29145 () Bool)

(declare-fun b_and!15385 () Bool)

(assert (=> start!37016 (= tp!29145 b_and!15385)))

(declare-fun b!371828 () Bool)

(declare-fun res!209097 () Bool)

(declare-fun e!226901 () Bool)

(assert (=> b!371828 (=> (not res!209097) (not e!226901))))

(declare-datatypes ((array!21523 0))(
  ( (array!21524 (arr!10230 (Array (_ BitVec 32) (_ BitVec 64))) (size!10582 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21523)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371828 (= res!209097 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14751 () Bool)

(declare-fun mapRes!14751 () Bool)

(declare-fun tp!29144 () Bool)

(declare-fun e!226899 () Bool)

(assert (=> mapNonEmpty!14751 (= mapRes!14751 (and tp!29144 e!226899))))

(declare-datatypes ((V!12827 0))(
  ( (V!12828 (val!4440 Int)) )
))
(declare-datatypes ((ValueCell!4052 0))(
  ( (ValueCellFull!4052 (v!6637 V!12827)) (EmptyCell!4052) )
))
(declare-datatypes ((array!21525 0))(
  ( (array!21526 (arr!10231 (Array (_ BitVec 32) ValueCell!4052)) (size!10583 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21525)

(declare-fun mapRest!14751 () (Array (_ BitVec 32) ValueCell!4052))

(declare-fun mapKey!14751 () (_ BitVec 32))

(declare-fun mapValue!14751 () ValueCell!4052)

(assert (=> mapNonEmpty!14751 (= (arr!10231 _values!506) (store mapRest!14751 mapKey!14751 mapValue!14751))))

(declare-fun b!371829 () Bool)

(declare-fun e!226898 () Bool)

(assert (=> b!371829 (= e!226901 e!226898)))

(declare-fun res!209099 () Bool)

(assert (=> b!371829 (=> (not res!209099) (not e!226898))))

(declare-fun lt!170435 () array!21523)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21523 (_ BitVec 32)) Bool)

(assert (=> b!371829 (= res!209099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170435 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371829 (= lt!170435 (array!21524 (store (arr!10230 _keys!658) i!548 k!778) (size!10582 _keys!658)))))

(declare-fun mapIsEmpty!14751 () Bool)

(assert (=> mapIsEmpty!14751 mapRes!14751))

(declare-fun b!371831 () Bool)

(declare-fun e!226896 () Bool)

(declare-fun e!226900 () Bool)

(assert (=> b!371831 (= e!226896 (and e!226900 mapRes!14751))))

(declare-fun condMapEmpty!14751 () Bool)

(declare-fun mapDefault!14751 () ValueCell!4052)

