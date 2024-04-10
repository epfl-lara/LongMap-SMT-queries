; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36876 () Bool)

(assert start!36876)

(declare-fun b_free!8003 () Bool)

(declare-fun b_next!8003 () Bool)

(assert (=> start!36876 (= b_free!8003 (not b_next!8003))))

(declare-fun tp!28724 () Bool)

(declare-fun b_and!15245 () Bool)

(assert (=> start!36876 (= tp!28724 b_and!15245)))

(declare-fun b!369098 () Bool)

(declare-fun res!206998 () Bool)

(declare-fun e!225636 () Bool)

(assert (=> b!369098 (=> (not res!206998) (not e!225636))))

(declare-datatypes ((array!21255 0))(
  ( (array!21256 (arr!10096 (Array (_ BitVec 32) (_ BitVec 64))) (size!10448 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21255)

(declare-datatypes ((List!5628 0))(
  ( (Nil!5625) (Cons!5624 (h!6480 (_ BitVec 64)) (t!10778 List!5628)) )
))
(declare-fun arrayNoDuplicates!0 (array!21255 (_ BitVec 32) List!5628) Bool)

(assert (=> b!369098 (= res!206998 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5625))))

(declare-fun mapIsEmpty!14541 () Bool)

(declare-fun mapRes!14541 () Bool)

(assert (=> mapIsEmpty!14541 mapRes!14541))

(declare-fun mapNonEmpty!14541 () Bool)

(declare-fun tp!28725 () Bool)

(declare-fun e!225640 () Bool)

(assert (=> mapNonEmpty!14541 (= mapRes!14541 (and tp!28725 e!225640))))

(declare-datatypes ((V!12639 0))(
  ( (V!12640 (val!4370 Int)) )
))
(declare-datatypes ((ValueCell!3982 0))(
  ( (ValueCellFull!3982 (v!6567 V!12639)) (EmptyCell!3982) )
))
(declare-fun mapValue!14541 () ValueCell!3982)

(declare-datatypes ((array!21257 0))(
  ( (array!21258 (arr!10097 (Array (_ BitVec 32) ValueCell!3982)) (size!10449 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21257)

(declare-fun mapRest!14541 () (Array (_ BitVec 32) ValueCell!3982))

(declare-fun mapKey!14541 () (_ BitVec 32))

(assert (=> mapNonEmpty!14541 (= (arr!10097 _values!506) (store mapRest!14541 mapKey!14541 mapValue!14541))))

(declare-fun res!206999 () Bool)

(assert (=> start!36876 (=> (not res!206999) (not e!225636))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36876 (= res!206999 (validMask!0 mask!970))))

(assert (=> start!36876 e!225636))

(declare-fun e!225639 () Bool)

(declare-fun array_inv!7462 (array!21257) Bool)

(assert (=> start!36876 (and (array_inv!7462 _values!506) e!225639)))

(assert (=> start!36876 tp!28724))

(assert (=> start!36876 true))

(declare-fun tp_is_empty!8651 () Bool)

(assert (=> start!36876 tp_is_empty!8651))

(declare-fun array_inv!7463 (array!21255) Bool)

(assert (=> start!36876 (array_inv!7463 _keys!658)))

(declare-fun b!369099 () Bool)

(assert (=> b!369099 (= e!225640 tp_is_empty!8651)))

(declare-fun b!369100 () Bool)

(declare-fun res!206993 () Bool)

(assert (=> b!369100 (=> (not res!206993) (not e!225636))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369100 (= res!206993 (and (= (size!10449 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10448 _keys!658) (size!10449 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369101 () Bool)

(declare-fun res!206992 () Bool)

(declare-fun e!225641 () Bool)

(assert (=> b!369101 (=> (not res!206992) (not e!225641))))

(declare-fun lt!169657 () array!21255)

(assert (=> b!369101 (= res!206992 (arrayNoDuplicates!0 lt!169657 #b00000000000000000000000000000000 Nil!5625))))

(declare-fun b!369102 () Bool)

(declare-fun res!206994 () Bool)

(assert (=> b!369102 (=> (not res!206994) (not e!225636))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369102 (= res!206994 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10448 _keys!658))))))

(declare-fun b!369103 () Bool)

(declare-fun res!206995 () Bool)

(assert (=> b!369103 (=> (not res!206995) (not e!225636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21255 (_ BitVec 32)) Bool)

(assert (=> b!369103 (= res!206995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369104 () Bool)

(assert (=> b!369104 (= e!225636 e!225641)))

(declare-fun res!206990 () Bool)

(assert (=> b!369104 (=> (not res!206990) (not e!225641))))

(assert (=> b!369104 (= res!206990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169657 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!369104 (= lt!169657 (array!21256 (store (arr!10096 _keys!658) i!548 k!778) (size!10448 _keys!658)))))

(declare-fun b!369105 () Bool)

(declare-fun res!206997 () Bool)

(assert (=> b!369105 (=> (not res!206997) (not e!225636))))

(declare-fun arrayContainsKey!0 (array!21255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369105 (= res!206997 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369106 () Bool)

(assert (=> b!369106 (= e!225641 false)))

(declare-datatypes ((tuple2!5794 0))(
  ( (tuple2!5795 (_1!2908 (_ BitVec 64)) (_2!2908 V!12639)) )
))
(declare-datatypes ((List!5629 0))(
  ( (Nil!5626) (Cons!5625 (h!6481 tuple2!5794) (t!10779 List!5629)) )
))
(declare-datatypes ((ListLongMap!4707 0))(
  ( (ListLongMap!4708 (toList!2369 List!5629)) )
))
(declare-fun lt!169658 () ListLongMap!4707)

(declare-fun zeroValue!472 () V!12639)

(declare-fun v!373 () V!12639)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12639)

(declare-fun getCurrentListMapNoExtraKeys!646 (array!21255 array!21257 (_ BitVec 32) (_ BitVec 32) V!12639 V!12639 (_ BitVec 32) Int) ListLongMap!4707)

(assert (=> b!369106 (= lt!169658 (getCurrentListMapNoExtraKeys!646 lt!169657 (array!21258 (store (arr!10097 _values!506) i!548 (ValueCellFull!3982 v!373)) (size!10449 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169659 () ListLongMap!4707)

(assert (=> b!369106 (= lt!169659 (getCurrentListMapNoExtraKeys!646 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369107 () Bool)

(declare-fun res!206991 () Bool)

(assert (=> b!369107 (=> (not res!206991) (not e!225636))))

(assert (=> b!369107 (= res!206991 (or (= (select (arr!10096 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10096 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369108 () Bool)

(declare-fun res!206996 () Bool)

(assert (=> b!369108 (=> (not res!206996) (not e!225636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369108 (= res!206996 (validKeyInArray!0 k!778))))

(declare-fun b!369109 () Bool)

(declare-fun e!225638 () Bool)

(assert (=> b!369109 (= e!225639 (and e!225638 mapRes!14541))))

(declare-fun condMapEmpty!14541 () Bool)

(declare-fun mapDefault!14541 () ValueCell!3982)

