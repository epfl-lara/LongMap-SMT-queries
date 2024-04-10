; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37052 () Bool)

(assert start!37052)

(declare-fun b_free!8179 () Bool)

(declare-fun b_next!8179 () Bool)

(assert (=> start!37052 (= b_free!8179 (not b_next!8179))))

(declare-fun tp!29252 () Bool)

(declare-fun b_and!15421 () Bool)

(assert (=> start!37052 (= tp!29252 b_and!15421)))

(declare-fun b!372531 () Bool)

(declare-fun e!227222 () Bool)

(declare-fun tp_is_empty!8827 () Bool)

(assert (=> b!372531 (= e!227222 tp_is_empty!8827)))

(declare-fun b!372532 () Bool)

(declare-fun res!209630 () Bool)

(declare-fun e!227223 () Bool)

(assert (=> b!372532 (=> (not res!209630) (not e!227223))))

(declare-datatypes ((array!21595 0))(
  ( (array!21596 (arr!10266 (Array (_ BitVec 32) (_ BitVec 64))) (size!10618 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21595)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372532 (= res!209630 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!372533 () Bool)

(declare-fun res!209634 () Bool)

(assert (=> b!372533 (=> (not res!209634) (not e!227223))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12875 0))(
  ( (V!12876 (val!4458 Int)) )
))
(declare-datatypes ((ValueCell!4070 0))(
  ( (ValueCellFull!4070 (v!6655 V!12875)) (EmptyCell!4070) )
))
(declare-datatypes ((array!21597 0))(
  ( (array!21598 (arr!10267 (Array (_ BitVec 32) ValueCell!4070)) (size!10619 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21597)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372533 (= res!209634 (and (= (size!10619 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10618 _keys!658) (size!10619 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372534 () Bool)

(declare-fun e!227220 () Bool)

(declare-fun e!227221 () Bool)

(declare-fun mapRes!14805 () Bool)

(assert (=> b!372534 (= e!227220 (and e!227221 mapRes!14805))))

(declare-fun condMapEmpty!14805 () Bool)

(declare-fun mapDefault!14805 () ValueCell!4070)

