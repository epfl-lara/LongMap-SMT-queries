; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37616 () Bool)

(assert start!37616)

(declare-fun b_free!8743 () Bool)

(declare-fun b_next!8743 () Bool)

(assert (=> start!37616 (= b_free!8743 (not b_next!8743))))

(declare-fun tp!30945 () Bool)

(declare-fun b_and!15985 () Bool)

(assert (=> start!37616 (= tp!30945 b_and!15985)))

(declare-fun b!384889 () Bool)

(declare-fun res!219453 () Bool)

(declare-fun e!233631 () Bool)

(assert (=> b!384889 (=> (not res!219453) (not e!233631))))

(declare-datatypes ((array!22683 0))(
  ( (array!22684 (arr!10810 (Array (_ BitVec 32) (_ BitVec 64))) (size!11162 (_ BitVec 32))) )
))
(declare-fun lt!181248 () array!22683)

(declare-datatypes ((List!6219 0))(
  ( (Nil!6216) (Cons!6215 (h!7071 (_ BitVec 64)) (t!11369 List!6219)) )
))
(declare-fun arrayNoDuplicates!0 (array!22683 (_ BitVec 32) List!6219) Bool)

(assert (=> b!384889 (= res!219453 (arrayNoDuplicates!0 lt!181248 #b00000000000000000000000000000000 Nil!6216))))

(declare-fun b!384890 () Bool)

(declare-fun e!233635 () Bool)

(declare-fun tp_is_empty!9391 () Bool)

(assert (=> b!384890 (= e!233635 tp_is_empty!9391)))

(declare-fun b!384891 () Bool)

(declare-fun res!219461 () Bool)

(declare-fun e!233636 () Bool)

(assert (=> b!384891 (=> (not res!219461) (not e!233636))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13627 0))(
  ( (V!13628 (val!4740 Int)) )
))
(declare-datatypes ((ValueCell!4352 0))(
  ( (ValueCellFull!4352 (v!6937 V!13627)) (EmptyCell!4352) )
))
(declare-datatypes ((array!22685 0))(
  ( (array!22686 (arr!10811 (Array (_ BitVec 32) ValueCell!4352)) (size!11163 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22685)

(declare-fun _keys!658 () array!22683)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!384891 (= res!219461 (and (= (size!11163 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11162 _keys!658) (size!11163 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15651 () Bool)

(declare-fun mapRes!15651 () Bool)

(declare-fun tp!30944 () Bool)

(declare-fun e!233634 () Bool)

(assert (=> mapNonEmpty!15651 (= mapRes!15651 (and tp!30944 e!233634))))

(declare-fun mapValue!15651 () ValueCell!4352)

(declare-fun mapRest!15651 () (Array (_ BitVec 32) ValueCell!4352))

(declare-fun mapKey!15651 () (_ BitVec 32))

(assert (=> mapNonEmpty!15651 (= (arr!10811 _values!506) (store mapRest!15651 mapKey!15651 mapValue!15651))))

(declare-fun b!384892 () Bool)

(declare-fun res!219456 () Bool)

(assert (=> b!384892 (=> (not res!219456) (not e!233636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22683 (_ BitVec 32)) Bool)

(assert (=> b!384892 (= res!219456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384893 () Bool)

(declare-fun e!233630 () Bool)

(assert (=> b!384893 (= e!233630 true)))

(declare-datatypes ((tuple2!6384 0))(
  ( (tuple2!6385 (_1!3203 (_ BitVec 64)) (_2!3203 V!13627)) )
))
(declare-datatypes ((List!6220 0))(
  ( (Nil!6217) (Cons!6216 (h!7072 tuple2!6384) (t!11370 List!6220)) )
))
(declare-datatypes ((ListLongMap!5297 0))(
  ( (ListLongMap!5298 (toList!2664 List!6220)) )
))
(declare-fun lt!181238 () ListLongMap!5297)

(declare-fun lt!181244 () ListLongMap!5297)

(declare-fun lt!181243 () tuple2!6384)

(declare-fun +!999 (ListLongMap!5297 tuple2!6384) ListLongMap!5297)

(assert (=> b!384893 (= lt!181238 (+!999 lt!181244 lt!181243))))

(declare-fun lt!181241 () ListLongMap!5297)

(declare-fun lt!181240 () ListLongMap!5297)

(assert (=> b!384893 (= lt!181241 lt!181240)))

(declare-fun b!384894 () Bool)

(assert (=> b!384894 (= e!233634 tp_is_empty!9391)))

(declare-fun b!384895 () Bool)

(declare-fun res!219452 () Bool)

(assert (=> b!384895 (=> (not res!219452) (not e!233636))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384895 (= res!219452 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384896 () Bool)

(declare-fun res!219460 () Bool)

(assert (=> b!384896 (=> (not res!219460) (not e!233636))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384896 (= res!219460 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11162 _keys!658))))))

(declare-fun mapIsEmpty!15651 () Bool)

(assert (=> mapIsEmpty!15651 mapRes!15651))

(declare-fun res!219451 () Bool)

(assert (=> start!37616 (=> (not res!219451) (not e!233636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37616 (= res!219451 (validMask!0 mask!970))))

(assert (=> start!37616 e!233636))

(declare-fun e!233632 () Bool)

(declare-fun array_inv!7958 (array!22685) Bool)

(assert (=> start!37616 (and (array_inv!7958 _values!506) e!233632)))

(assert (=> start!37616 tp!30945))

(assert (=> start!37616 true))

(assert (=> start!37616 tp_is_empty!9391))

(declare-fun array_inv!7959 (array!22683) Bool)

(assert (=> start!37616 (array_inv!7959 _keys!658)))

(declare-fun b!384897 () Bool)

(assert (=> b!384897 (= e!233631 (not e!233630))))

(declare-fun res!219458 () Bool)

(assert (=> b!384897 (=> res!219458 e!233630)))

(declare-fun lt!181246 () Bool)

(assert (=> b!384897 (= res!219458 (or (and (not lt!181246) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181246) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181246)))))

(assert (=> b!384897 (= lt!181246 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13627)

(declare-fun minValue!472 () V!13627)

(declare-fun getCurrentListMap!2062 (array!22683 array!22685 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5297)

(assert (=> b!384897 (= lt!181244 (getCurrentListMap!2062 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181242 () array!22685)

(assert (=> b!384897 (= lt!181241 (getCurrentListMap!2062 lt!181248 lt!181242 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181247 () ListLongMap!5297)

(assert (=> b!384897 (and (= lt!181240 lt!181247) (= lt!181247 lt!181240))))

(declare-fun lt!181239 () ListLongMap!5297)

(assert (=> b!384897 (= lt!181247 (+!999 lt!181239 lt!181243))))

(declare-fun v!373 () V!13627)

(assert (=> b!384897 (= lt!181243 (tuple2!6385 k!778 v!373))))

(declare-datatypes ((Unit!11878 0))(
  ( (Unit!11879) )
))
(declare-fun lt!181245 () Unit!11878)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!220 (array!22683 array!22685 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) (_ BitVec 64) V!13627 (_ BitVec 32) Int) Unit!11878)

(assert (=> b!384897 (= lt!181245 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!220 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!896 (array!22683 array!22685 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5297)

(assert (=> b!384897 (= lt!181240 (getCurrentListMapNoExtraKeys!896 lt!181248 lt!181242 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384897 (= lt!181242 (array!22686 (store (arr!10811 _values!506) i!548 (ValueCellFull!4352 v!373)) (size!11163 _values!506)))))

(assert (=> b!384897 (= lt!181239 (getCurrentListMapNoExtraKeys!896 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384898 () Bool)

(declare-fun res!219457 () Bool)

(assert (=> b!384898 (=> (not res!219457) (not e!233636))))

(assert (=> b!384898 (= res!219457 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6216))))

(declare-fun b!384899 () Bool)

(declare-fun res!219459 () Bool)

(assert (=> b!384899 (=> (not res!219459) (not e!233636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384899 (= res!219459 (validKeyInArray!0 k!778))))

(declare-fun b!384900 () Bool)

(assert (=> b!384900 (= e!233636 e!233631)))

(declare-fun res!219454 () Bool)

(assert (=> b!384900 (=> (not res!219454) (not e!233631))))

(assert (=> b!384900 (= res!219454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181248 mask!970))))

(assert (=> b!384900 (= lt!181248 (array!22684 (store (arr!10810 _keys!658) i!548 k!778) (size!11162 _keys!658)))))

(declare-fun b!384901 () Bool)

(declare-fun res!219455 () Bool)

(assert (=> b!384901 (=> (not res!219455) (not e!233636))))

(assert (=> b!384901 (= res!219455 (or (= (select (arr!10810 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10810 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384902 () Bool)

(assert (=> b!384902 (= e!233632 (and e!233635 mapRes!15651))))

(declare-fun condMapEmpty!15651 () Bool)

(declare-fun mapDefault!15651 () ValueCell!4352)

