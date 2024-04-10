; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37382 () Bool)

(assert start!37382)

(declare-fun b_free!8509 () Bool)

(declare-fun b_next!8509 () Bool)

(assert (=> start!37382 (= b_free!8509 (not b_next!8509))))

(declare-fun tp!30243 () Bool)

(declare-fun b_and!15751 () Bool)

(assert (=> start!37382 (= tp!30243 b_and!15751)))

(declare-fun b!379905 () Bool)

(declare-fun e!231110 () Bool)

(declare-fun tp_is_empty!9157 () Bool)

(assert (=> b!379905 (= e!231110 tp_is_empty!9157)))

(declare-fun b!379906 () Bool)

(declare-fun res!215526 () Bool)

(declare-fun e!231106 () Bool)

(assert (=> b!379906 (=> (not res!215526) (not e!231106))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22235 0))(
  ( (array!22236 (arr!10586 (Array (_ BitVec 32) (_ BitVec 64))) (size!10938 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22235)

(assert (=> b!379906 (= res!215526 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10938 _keys!658))))))

(declare-fun b!379907 () Bool)

(declare-fun res!215522 () Bool)

(assert (=> b!379907 (=> (not res!215522) (not e!231106))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22235 (_ BitVec 32)) Bool)

(assert (=> b!379907 (= res!215522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!215521 () Bool)

(assert (=> start!37382 (=> (not res!215521) (not e!231106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37382 (= res!215521 (validMask!0 mask!970))))

(assert (=> start!37382 e!231106))

(declare-datatypes ((V!13315 0))(
  ( (V!13316 (val!4623 Int)) )
))
(declare-datatypes ((ValueCell!4235 0))(
  ( (ValueCellFull!4235 (v!6820 V!13315)) (EmptyCell!4235) )
))
(declare-datatypes ((array!22237 0))(
  ( (array!22238 (arr!10587 (Array (_ BitVec 32) ValueCell!4235)) (size!10939 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22237)

(declare-fun e!231109 () Bool)

(declare-fun array_inv!7794 (array!22237) Bool)

(assert (=> start!37382 (and (array_inv!7794 _values!506) e!231109)))

(assert (=> start!37382 tp!30243))

(assert (=> start!37382 true))

(assert (=> start!37382 tp_is_empty!9157))

(declare-fun array_inv!7795 (array!22235) Bool)

(assert (=> start!37382 (array_inv!7795 _keys!658)))

(declare-fun b!379908 () Bool)

(declare-fun res!215523 () Bool)

(assert (=> b!379908 (=> (not res!215523) (not e!231106))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379908 (= res!215523 (and (= (size!10939 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10938 _keys!658) (size!10939 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379909 () Bool)

(declare-fun res!215525 () Bool)

(assert (=> b!379909 (=> (not res!215525) (not e!231106))))

(declare-datatypes ((List!6027 0))(
  ( (Nil!6024) (Cons!6023 (h!6879 (_ BitVec 64)) (t!11177 List!6027)) )
))
(declare-fun arrayNoDuplicates!0 (array!22235 (_ BitVec 32) List!6027) Bool)

(assert (=> b!379909 (= res!215525 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6024))))

(declare-fun mapNonEmpty!15300 () Bool)

(declare-fun mapRes!15300 () Bool)

(declare-fun tp!30242 () Bool)

(declare-fun e!231105 () Bool)

(assert (=> mapNonEmpty!15300 (= mapRes!15300 (and tp!30242 e!231105))))

(declare-fun mapRest!15300 () (Array (_ BitVec 32) ValueCell!4235))

(declare-fun mapKey!15300 () (_ BitVec 32))

(declare-fun mapValue!15300 () ValueCell!4235)

(assert (=> mapNonEmpty!15300 (= (arr!10587 _values!506) (store mapRest!15300 mapKey!15300 mapValue!15300))))

(declare-fun mapIsEmpty!15300 () Bool)

(assert (=> mapIsEmpty!15300 mapRes!15300))

(declare-fun b!379910 () Bool)

(declare-fun res!215531 () Bool)

(assert (=> b!379910 (=> (not res!215531) (not e!231106))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379910 (= res!215531 (validKeyInArray!0 k!778))))

(declare-fun b!379911 () Bool)

(assert (=> b!379911 (= e!231105 tp_is_empty!9157)))

(declare-fun b!379912 () Bool)

(declare-fun e!231107 () Bool)

(assert (=> b!379912 (= e!231107 true)))

(declare-datatypes ((tuple2!6192 0))(
  ( (tuple2!6193 (_1!3107 (_ BitVec 64)) (_2!3107 V!13315)) )
))
(declare-datatypes ((List!6028 0))(
  ( (Nil!6025) (Cons!6024 (h!6880 tuple2!6192) (t!11178 List!6028)) )
))
(declare-datatypes ((ListLongMap!5105 0))(
  ( (ListLongMap!5106 (toList!2568 List!6028)) )
))
(declare-fun lt!177590 () ListLongMap!5105)

(declare-fun lt!177598 () ListLongMap!5105)

(declare-fun lt!177597 () tuple2!6192)

(declare-fun +!914 (ListLongMap!5105 tuple2!6192) ListLongMap!5105)

(assert (=> b!379912 (= lt!177590 (+!914 lt!177598 lt!177597))))

(declare-fun v!373 () V!13315)

(declare-fun lt!177592 () ListLongMap!5105)

(declare-datatypes ((Unit!11722 0))(
  ( (Unit!11723) )
))
(declare-fun lt!177588 () Unit!11722)

(declare-fun minValue!472 () V!13315)

(declare-fun addCommutativeForDiffKeys!311 (ListLongMap!5105 (_ BitVec 64) V!13315 (_ BitVec 64) V!13315) Unit!11722)

(assert (=> b!379912 (= lt!177588 (addCommutativeForDiffKeys!311 lt!177592 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379913 () Bool)

(declare-fun res!215529 () Bool)

(declare-fun e!231104 () Bool)

(assert (=> b!379913 (=> (not res!215529) (not e!231104))))

(declare-fun lt!177595 () array!22235)

(assert (=> b!379913 (= res!215529 (arrayNoDuplicates!0 lt!177595 #b00000000000000000000000000000000 Nil!6024))))

(declare-fun b!379914 () Bool)

(declare-fun res!215520 () Bool)

(assert (=> b!379914 (=> (not res!215520) (not e!231106))))

(assert (=> b!379914 (= res!215520 (or (= (select (arr!10586 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10586 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379915 () Bool)

(declare-fun res!215530 () Bool)

(assert (=> b!379915 (=> (not res!215530) (not e!231106))))

(declare-fun arrayContainsKey!0 (array!22235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379915 (= res!215530 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379916 () Bool)

(assert (=> b!379916 (= e!231106 e!231104)))

(declare-fun res!215524 () Bool)

(assert (=> b!379916 (=> (not res!215524) (not e!231104))))

(assert (=> b!379916 (= res!215524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177595 mask!970))))

(assert (=> b!379916 (= lt!177595 (array!22236 (store (arr!10586 _keys!658) i!548 k!778) (size!10938 _keys!658)))))

(declare-fun b!379917 () Bool)

(declare-fun e!231108 () Bool)

(assert (=> b!379917 (= e!231104 (not e!231108))))

(declare-fun res!215528 () Bool)

(assert (=> b!379917 (=> res!215528 e!231108)))

(assert (=> b!379917 (= res!215528 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13315)

(declare-fun lt!177589 () ListLongMap!5105)

(declare-fun getCurrentListMap!1985 (array!22235 array!22237 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!5105)

(assert (=> b!379917 (= lt!177589 (getCurrentListMap!1985 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177591 () ListLongMap!5105)

(declare-fun lt!177600 () array!22237)

(assert (=> b!379917 (= lt!177591 (getCurrentListMap!1985 lt!177595 lt!177600 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177594 () ListLongMap!5105)

(declare-fun lt!177596 () ListLongMap!5105)

(assert (=> b!379917 (and (= lt!177594 lt!177596) (= lt!177596 lt!177594))))

(assert (=> b!379917 (= lt!177596 (+!914 lt!177592 lt!177597))))

(assert (=> b!379917 (= lt!177597 (tuple2!6193 k!778 v!373))))

(declare-fun lt!177593 () Unit!11722)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!143 (array!22235 array!22237 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) (_ BitVec 64) V!13315 (_ BitVec 32) Int) Unit!11722)

(assert (=> b!379917 (= lt!177593 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!143 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!819 (array!22235 array!22237 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!5105)

(assert (=> b!379917 (= lt!177594 (getCurrentListMapNoExtraKeys!819 lt!177595 lt!177600 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379917 (= lt!177600 (array!22238 (store (arr!10587 _values!506) i!548 (ValueCellFull!4235 v!373)) (size!10939 _values!506)))))

(assert (=> b!379917 (= lt!177592 (getCurrentListMapNoExtraKeys!819 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379918 () Bool)

(assert (=> b!379918 (= e!231109 (and e!231110 mapRes!15300))))

(declare-fun condMapEmpty!15300 () Bool)

(declare-fun mapDefault!15300 () ValueCell!4235)

