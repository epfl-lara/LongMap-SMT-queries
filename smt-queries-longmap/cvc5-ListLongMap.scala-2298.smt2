; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37250 () Bool)

(assert start!37250)

(declare-fun b_free!8377 () Bool)

(declare-fun b_next!8377 () Bool)

(assert (=> start!37250 (= b_free!8377 (not b_next!8377))))

(declare-fun tp!29846 () Bool)

(declare-fun b_and!15619 () Bool)

(assert (=> start!37250 (= tp!29846 b_and!15619)))

(declare-fun b!376926 () Bool)

(declare-fun e!229525 () Bool)

(declare-fun e!229522 () Bool)

(assert (=> b!376926 (= e!229525 e!229522)))

(declare-fun res!213146 () Bool)

(assert (=> b!376926 (=> (not res!213146) (not e!229522))))

(declare-datatypes ((array!21979 0))(
  ( (array!21980 (arr!10458 (Array (_ BitVec 32) (_ BitVec 64))) (size!10810 (_ BitVec 32))) )
))
(declare-fun lt!175060 () array!21979)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21979 (_ BitVec 32)) Bool)

(assert (=> b!376926 (= res!213146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175060 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21979)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376926 (= lt!175060 (array!21980 (store (arr!10458 _keys!658) i!548 k!778) (size!10810 _keys!658)))))

(declare-fun b!376927 () Bool)

(declare-fun res!213138 () Bool)

(assert (=> b!376927 (=> (not res!213138) (not e!229525))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13139 0))(
  ( (V!13140 (val!4557 Int)) )
))
(declare-datatypes ((ValueCell!4169 0))(
  ( (ValueCellFull!4169 (v!6754 V!13139)) (EmptyCell!4169) )
))
(declare-datatypes ((array!21981 0))(
  ( (array!21982 (arr!10459 (Array (_ BitVec 32) ValueCell!4169)) (size!10811 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21981)

(assert (=> b!376927 (= res!213138 (and (= (size!10811 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10810 _keys!658) (size!10811 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376928 () Bool)

(declare-fun res!213145 () Bool)

(assert (=> b!376928 (=> (not res!213145) (not e!229525))))

(declare-datatypes ((List!5913 0))(
  ( (Nil!5910) (Cons!5909 (h!6765 (_ BitVec 64)) (t!11063 List!5913)) )
))
(declare-fun arrayNoDuplicates!0 (array!21979 (_ BitVec 32) List!5913) Bool)

(assert (=> b!376928 (= res!213145 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5910))))

(declare-fun b!376929 () Bool)

(declare-fun e!229520 () Bool)

(declare-fun e!229524 () Bool)

(declare-fun mapRes!15102 () Bool)

(assert (=> b!376929 (= e!229520 (and e!229524 mapRes!15102))))

(declare-fun condMapEmpty!15102 () Bool)

(declare-fun mapDefault!15102 () ValueCell!4169)

