; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37158 () Bool)

(assert start!37158)

(declare-fun b_free!8285 () Bool)

(declare-fun b_next!8285 () Bool)

(assert (=> start!37158 (= b_free!8285 (not b_next!8285))))

(declare-fun tp!29571 () Bool)

(declare-fun b_and!15527 () Bool)

(assert (=> start!37158 (= tp!29571 b_and!15527)))

(declare-fun mapNonEmpty!14964 () Bool)

(declare-fun mapRes!14964 () Bool)

(declare-fun tp!29570 () Bool)

(declare-fun e!228417 () Bool)

(assert (=> mapNonEmpty!14964 (= mapRes!14964 (and tp!29570 e!228417))))

(declare-datatypes ((V!13015 0))(
  ( (V!13016 (val!4511 Int)) )
))
(declare-datatypes ((ValueCell!4123 0))(
  ( (ValueCellFull!4123 (v!6708 V!13015)) (EmptyCell!4123) )
))
(declare-fun mapRest!14964 () (Array (_ BitVec 32) ValueCell!4123))

(declare-fun mapKey!14964 () (_ BitVec 32))

(declare-datatypes ((array!21805 0))(
  ( (array!21806 (arr!10371 (Array (_ BitVec 32) ValueCell!4123)) (size!10723 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21805)

(declare-fun mapValue!14964 () ValueCell!4123)

(assert (=> mapNonEmpty!14964 (= (arr!10371 _values!506) (store mapRest!14964 mapKey!14964 mapValue!14964))))

(declare-fun b!374847 () Bool)

(declare-fun res!211474 () Bool)

(declare-fun e!228418 () Bool)

(assert (=> b!374847 (=> (not res!211474) (not e!228418))))

(declare-datatypes ((array!21807 0))(
  ( (array!21808 (arr!10372 (Array (_ BitVec 32) (_ BitVec 64))) (size!10724 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21807)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21807 (_ BitVec 32)) Bool)

(assert (=> b!374847 (= res!211474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374848 () Bool)

(declare-fun e!228422 () Bool)

(assert (=> b!374848 (= e!228418 e!228422)))

(declare-fun res!211481 () Bool)

(assert (=> b!374848 (=> (not res!211481) (not e!228422))))

(declare-fun lt!173086 () array!21807)

(assert (=> b!374848 (= res!211481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173086 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374848 (= lt!173086 (array!21808 (store (arr!10372 _keys!658) i!548 k!778) (size!10724 _keys!658)))))

(declare-fun b!374849 () Bool)

(declare-fun res!211472 () Bool)

(assert (=> b!374849 (=> (not res!211472) (not e!228418))))

(declare-fun arrayContainsKey!0 (array!21807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374849 (= res!211472 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374850 () Bool)

(declare-fun e!228415 () Bool)

(declare-fun e!228421 () Bool)

(assert (=> b!374850 (= e!228415 (and e!228421 mapRes!14964))))

(declare-fun condMapEmpty!14964 () Bool)

(declare-fun mapDefault!14964 () ValueCell!4123)

