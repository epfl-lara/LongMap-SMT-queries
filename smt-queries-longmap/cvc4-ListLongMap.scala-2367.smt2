; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37668 () Bool)

(assert start!37668)

(declare-fun b_free!8771 () Bool)

(declare-fun b_next!8771 () Bool)

(assert (=> start!37668 (= b_free!8771 (not b_next!8771))))

(declare-fun tp!31065 () Bool)

(declare-fun b_and!16013 () Bool)

(assert (=> start!37668 (= tp!31065 b_and!16013)))

(declare-fun b!385739 () Bool)

(declare-fun res!220073 () Bool)

(declare-fun e!234108 () Bool)

(assert (=> b!385739 (=> (not res!220073) (not e!234108))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22785 0))(
  ( (array!22786 (arr!10861 (Array (_ BitVec 32) (_ BitVec 64))) (size!11213 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22785)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13695 0))(
  ( (V!13696 (val!4766 Int)) )
))
(declare-datatypes ((ValueCell!4378 0))(
  ( (ValueCellFull!4378 (v!6963 V!13695)) (EmptyCell!4378) )
))
(declare-datatypes ((array!22787 0))(
  ( (array!22788 (arr!10862 (Array (_ BitVec 32) ValueCell!4378)) (size!11214 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22787)

(assert (=> b!385739 (= res!220073 (and (= (size!11214 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11213 _keys!658) (size!11214 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!220076 () Bool)

(assert (=> start!37668 (=> (not res!220076) (not e!234108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37668 (= res!220076 (validMask!0 mask!970))))

(assert (=> start!37668 e!234108))

(assert (=> start!37668 true))

(declare-fun e!234107 () Bool)

(declare-fun array_inv!7996 (array!22787) Bool)

(assert (=> start!37668 (and (array_inv!7996 _values!506) e!234107)))

(assert (=> start!37668 tp!31065))

(declare-fun tp_is_empty!9443 () Bool)

(assert (=> start!37668 tp_is_empty!9443))

(declare-fun array_inv!7997 (array!22785) Bool)

(assert (=> start!37668 (array_inv!7997 _keys!658)))

(declare-fun b!385740 () Bool)

(declare-fun e!234110 () Bool)

(assert (=> b!385740 (= e!234110 tp_is_empty!9443)))

(declare-fun b!385741 () Bool)

(declare-fun e!234109 () Bool)

(assert (=> b!385741 (= e!234108 e!234109)))

(declare-fun res!220070 () Bool)

(assert (=> b!385741 (=> (not res!220070) (not e!234109))))

(declare-fun lt!181655 () array!22785)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22785 (_ BitVec 32)) Bool)

(assert (=> b!385741 (= res!220070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181655 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385741 (= lt!181655 (array!22786 (store (arr!10861 _keys!658) i!548 k!778) (size!11213 _keys!658)))))

(declare-fun b!385742 () Bool)

(declare-fun mapRes!15729 () Bool)

(assert (=> b!385742 (= e!234107 (and e!234110 mapRes!15729))))

(declare-fun condMapEmpty!15729 () Bool)

(declare-fun mapDefault!15729 () ValueCell!4378)

