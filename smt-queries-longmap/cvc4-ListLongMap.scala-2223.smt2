; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36804 () Bool)

(assert start!36804)

(declare-fun b!367694 () Bool)

(declare-fun e!224989 () Bool)

(declare-datatypes ((array!21117 0))(
  ( (array!21118 (arr!10027 (Array (_ BitVec 32) (_ BitVec 64))) (size!10379 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21117)

(assert (=> b!367694 (= e!224989 (bvsgt #b00000000000000000000000000000000 (size!10379 _keys!658)))))

(declare-fun b!367695 () Bool)

(declare-fun e!224990 () Bool)

(assert (=> b!367695 (= e!224990 e!224989)))

(declare-fun res!205913 () Bool)

(assert (=> b!367695 (=> (not res!205913) (not e!224989))))

(declare-fun lt!169416 () array!21117)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21117 (_ BitVec 32)) Bool)

(assert (=> b!367695 (= res!205913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169416 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367695 (= lt!169416 (array!21118 (store (arr!10027 _keys!658) i!548 k!778) (size!10379 _keys!658)))))

(declare-fun b!367696 () Bool)

(declare-fun res!205919 () Bool)

(assert (=> b!367696 (=> (not res!205919) (not e!224990))))

(assert (=> b!367696 (= res!205919 (or (= (select (arr!10027 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10027 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!205912 () Bool)

(assert (=> start!36804 (=> (not res!205912) (not e!224990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36804 (= res!205912 (validMask!0 mask!970))))

(assert (=> start!36804 e!224990))

(assert (=> start!36804 true))

(declare-datatypes ((V!12543 0))(
  ( (V!12544 (val!4334 Int)) )
))
(declare-datatypes ((ValueCell!3946 0))(
  ( (ValueCellFull!3946 (v!6531 V!12543)) (EmptyCell!3946) )
))
(declare-datatypes ((array!21119 0))(
  ( (array!21120 (arr!10028 (Array (_ BitVec 32) ValueCell!3946)) (size!10380 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21119)

(declare-fun e!224988 () Bool)

(declare-fun array_inv!7416 (array!21119) Bool)

(assert (=> start!36804 (and (array_inv!7416 _values!506) e!224988)))

(declare-fun array_inv!7417 (array!21117) Bool)

(assert (=> start!36804 (array_inv!7417 _keys!658)))

(declare-fun b!367697 () Bool)

(declare-fun res!205914 () Bool)

(assert (=> b!367697 (=> (not res!205914) (not e!224990))))

(assert (=> b!367697 (= res!205914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367698 () Bool)

(declare-fun res!205910 () Bool)

(assert (=> b!367698 (=> (not res!205910) (not e!224990))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367698 (= res!205910 (and (= (size!10380 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10379 _keys!658) (size!10380 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367699 () Bool)

(declare-fun res!205915 () Bool)

(assert (=> b!367699 (=> (not res!205915) (not e!224990))))

(assert (=> b!367699 (= res!205915 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10379 _keys!658))))))

(declare-fun b!367700 () Bool)

(declare-fun res!205918 () Bool)

(assert (=> b!367700 (=> (not res!205918) (not e!224990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367700 (= res!205918 (validKeyInArray!0 k!778))))

(declare-fun b!367701 () Bool)

(declare-fun e!224991 () Bool)

(declare-fun mapRes!14433 () Bool)

(assert (=> b!367701 (= e!224988 (and e!224991 mapRes!14433))))

(declare-fun condMapEmpty!14433 () Bool)

(declare-fun mapDefault!14433 () ValueCell!3946)

