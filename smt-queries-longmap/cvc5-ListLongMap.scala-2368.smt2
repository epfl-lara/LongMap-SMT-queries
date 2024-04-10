; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37670 () Bool)

(assert start!37670)

(declare-fun b_free!8773 () Bool)

(declare-fun b_next!8773 () Bool)

(assert (=> start!37670 (= b_free!8773 (not b_next!8773))))

(declare-fun tp!31071 () Bool)

(declare-fun b_and!16015 () Bool)

(assert (=> start!37670 (= tp!31071 b_and!16015)))

(declare-fun b!385778 () Bool)

(declare-fun e!234128 () Bool)

(declare-fun tp_is_empty!9445 () Bool)

(assert (=> b!385778 (= e!234128 tp_is_empty!9445)))

(declare-fun b!385779 () Bool)

(declare-fun res!220106 () Bool)

(declare-fun e!234123 () Bool)

(assert (=> b!385779 (=> (not res!220106) (not e!234123))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385779 (= res!220106 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15732 () Bool)

(declare-fun mapRes!15732 () Bool)

(declare-fun tp!31070 () Bool)

(declare-fun e!234124 () Bool)

(assert (=> mapNonEmpty!15732 (= mapRes!15732 (and tp!31070 e!234124))))

(declare-datatypes ((V!13699 0))(
  ( (V!13700 (val!4767 Int)) )
))
(declare-datatypes ((ValueCell!4379 0))(
  ( (ValueCellFull!4379 (v!6964 V!13699)) (EmptyCell!4379) )
))
(declare-fun mapValue!15732 () ValueCell!4379)

(declare-fun mapRest!15732 () (Array (_ BitVec 32) ValueCell!4379))

(declare-datatypes ((array!22789 0))(
  ( (array!22790 (arr!10863 (Array (_ BitVec 32) ValueCell!4379)) (size!11215 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22789)

(declare-fun mapKey!15732 () (_ BitVec 32))

(assert (=> mapNonEmpty!15732 (= (arr!10863 _values!506) (store mapRest!15732 mapKey!15732 mapValue!15732))))

(declare-fun b!385780 () Bool)

(declare-fun res!220103 () Bool)

(assert (=> b!385780 (=> (not res!220103) (not e!234123))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22791 0))(
  ( (array!22792 (arr!10864 (Array (_ BitVec 32) (_ BitVec 64))) (size!11216 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22791)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385780 (= res!220103 (and (= (size!11215 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11216 _keys!658) (size!11215 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385781 () Bool)

(declare-fun res!220101 () Bool)

(declare-fun e!234127 () Bool)

(assert (=> b!385781 (=> (not res!220101) (not e!234127))))

(declare-fun lt!181661 () array!22791)

(declare-datatypes ((List!6254 0))(
  ( (Nil!6251) (Cons!6250 (h!7106 (_ BitVec 64)) (t!11404 List!6254)) )
))
(declare-fun arrayNoDuplicates!0 (array!22791 (_ BitVec 32) List!6254) Bool)

(assert (=> b!385781 (= res!220101 (arrayNoDuplicates!0 lt!181661 #b00000000000000000000000000000000 Nil!6251))))

(declare-fun b!385782 () Bool)

(declare-fun res!220100 () Bool)

(assert (=> b!385782 (=> (not res!220100) (not e!234123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22791 (_ BitVec 32)) Bool)

(assert (=> b!385782 (= res!220100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385783 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385783 (= e!234127 (bvsge i!548 (size!11215 _values!506)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13699)

(declare-datatypes ((tuple2!6408 0))(
  ( (tuple2!6409 (_1!3215 (_ BitVec 64)) (_2!3215 V!13699)) )
))
(declare-datatypes ((List!6255 0))(
  ( (Nil!6252) (Cons!6251 (h!7107 tuple2!6408) (t!11405 List!6255)) )
))
(declare-datatypes ((ListLongMap!5321 0))(
  ( (ListLongMap!5322 (toList!2676 List!6255)) )
))
(declare-fun lt!181662 () ListLongMap!5321)

(declare-fun minValue!472 () V!13699)

(declare-fun getCurrentListMapNoExtraKeys!905 (array!22791 array!22789 (_ BitVec 32) (_ BitVec 32) V!13699 V!13699 (_ BitVec 32) Int) ListLongMap!5321)

(assert (=> b!385783 (= lt!181662 (getCurrentListMapNoExtraKeys!905 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385784 () Bool)

(assert (=> b!385784 (= e!234123 e!234127)))

(declare-fun res!220102 () Bool)

(assert (=> b!385784 (=> (not res!220102) (not e!234127))))

(assert (=> b!385784 (= res!220102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181661 mask!970))))

(assert (=> b!385784 (= lt!181661 (array!22792 (store (arr!10864 _keys!658) i!548 k!778) (size!11216 _keys!658)))))

(declare-fun b!385786 () Bool)

(declare-fun res!220099 () Bool)

(assert (=> b!385786 (=> (not res!220099) (not e!234123))))

(assert (=> b!385786 (= res!220099 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11216 _keys!658))))))

(declare-fun b!385787 () Bool)

(assert (=> b!385787 (= e!234124 tp_is_empty!9445)))

(declare-fun b!385788 () Bool)

(declare-fun res!220097 () Bool)

(assert (=> b!385788 (=> (not res!220097) (not e!234123))))

(declare-fun arrayContainsKey!0 (array!22791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385788 (= res!220097 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385789 () Bool)

(declare-fun res!220098 () Bool)

(assert (=> b!385789 (=> (not res!220098) (not e!234123))))

(assert (=> b!385789 (= res!220098 (or (= (select (arr!10864 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10864 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15732 () Bool)

(assert (=> mapIsEmpty!15732 mapRes!15732))

(declare-fun b!385790 () Bool)

(declare-fun res!220104 () Bool)

(assert (=> b!385790 (=> (not res!220104) (not e!234123))))

(assert (=> b!385790 (= res!220104 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6251))))

(declare-fun b!385785 () Bool)

(declare-fun e!234126 () Bool)

(assert (=> b!385785 (= e!234126 (and e!234128 mapRes!15732))))

(declare-fun condMapEmpty!15732 () Bool)

(declare-fun mapDefault!15732 () ValueCell!4379)

