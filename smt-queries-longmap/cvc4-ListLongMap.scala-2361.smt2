; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37632 () Bool)

(assert start!37632)

(declare-fun b_free!8759 () Bool)

(declare-fun b_next!8759 () Bool)

(assert (=> start!37632 (= b_free!8759 (not b_next!8759))))

(declare-fun tp!30993 () Bool)

(declare-fun b_and!16001 () Bool)

(assert (=> start!37632 (= tp!30993 b_and!16001)))

(declare-fun res!219719 () Bool)

(declare-fun e!233801 () Bool)

(assert (=> start!37632 (=> (not res!219719) (not e!233801))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37632 (= res!219719 (validMask!0 mask!970))))

(assert (=> start!37632 e!233801))

(declare-datatypes ((V!13647 0))(
  ( (V!13648 (val!4748 Int)) )
))
(declare-datatypes ((ValueCell!4360 0))(
  ( (ValueCellFull!4360 (v!6945 V!13647)) (EmptyCell!4360) )
))
(declare-datatypes ((array!22715 0))(
  ( (array!22716 (arr!10826 (Array (_ BitVec 32) ValueCell!4360)) (size!11178 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22715)

(declare-fun e!233799 () Bool)

(declare-fun array_inv!7968 (array!22715) Bool)

(assert (=> start!37632 (and (array_inv!7968 _values!506) e!233799)))

(assert (=> start!37632 tp!30993))

(assert (=> start!37632 true))

(declare-fun tp_is_empty!9407 () Bool)

(assert (=> start!37632 tp_is_empty!9407))

(declare-datatypes ((array!22717 0))(
  ( (array!22718 (arr!10827 (Array (_ BitVec 32) (_ BitVec 64))) (size!11179 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22717)

(declare-fun array_inv!7969 (array!22717) Bool)

(assert (=> start!37632 (array_inv!7969 _keys!658)))

(declare-fun b!385225 () Bool)

(declare-fun res!219718 () Bool)

(assert (=> b!385225 (=> (not res!219718) (not e!233801))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385225 (= res!219718 (and (= (size!11178 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11179 _keys!658) (size!11178 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385226 () Bool)

(declare-fun res!219715 () Bool)

(assert (=> b!385226 (=> (not res!219715) (not e!233801))))

(declare-datatypes ((List!6231 0))(
  ( (Nil!6228) (Cons!6227 (h!7083 (_ BitVec 64)) (t!11381 List!6231)) )
))
(declare-fun arrayNoDuplicates!0 (array!22717 (_ BitVec 32) List!6231) Bool)

(assert (=> b!385226 (= res!219715 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6228))))

(declare-fun b!385227 () Bool)

(declare-fun res!219716 () Bool)

(assert (=> b!385227 (=> (not res!219716) (not e!233801))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385227 (= res!219716 (validKeyInArray!0 k!778))))

(declare-fun b!385228 () Bool)

(declare-fun res!219724 () Bool)

(declare-fun e!233800 () Bool)

(assert (=> b!385228 (=> (not res!219724) (not e!233800))))

(declare-fun lt!181510 () array!22717)

(assert (=> b!385228 (= res!219724 (arrayNoDuplicates!0 lt!181510 #b00000000000000000000000000000000 Nil!6228))))

(declare-fun b!385229 () Bool)

(assert (=> b!385229 (= e!233801 e!233800)))

(declare-fun res!219722 () Bool)

(assert (=> b!385229 (=> (not res!219722) (not e!233800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22717 (_ BitVec 32)) Bool)

(assert (=> b!385229 (= res!219722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181510 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385229 (= lt!181510 (array!22718 (store (arr!10827 _keys!658) i!548 k!778) (size!11179 _keys!658)))))

(declare-fun b!385230 () Bool)

(declare-fun res!219725 () Bool)

(assert (=> b!385230 (=> (not res!219725) (not e!233801))))

(assert (=> b!385230 (= res!219725 (or (= (select (arr!10827 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10827 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15675 () Bool)

(declare-fun mapRes!15675 () Bool)

(declare-fun tp!30992 () Bool)

(declare-fun e!233804 () Bool)

(assert (=> mapNonEmpty!15675 (= mapRes!15675 (and tp!30992 e!233804))))

(declare-fun mapValue!15675 () ValueCell!4360)

(declare-fun mapKey!15675 () (_ BitVec 32))

(declare-fun mapRest!15675 () (Array (_ BitVec 32) ValueCell!4360))

(assert (=> mapNonEmpty!15675 (= (arr!10826 _values!506) (store mapRest!15675 mapKey!15675 mapValue!15675))))

(declare-fun b!385231 () Bool)

(declare-fun res!219717 () Bool)

(assert (=> b!385231 (=> (not res!219717) (not e!233801))))

(assert (=> b!385231 (= res!219717 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11179 _keys!658))))))

(declare-fun b!385232 () Bool)

(declare-fun res!219723 () Bool)

(assert (=> b!385232 (=> (not res!219723) (not e!233801))))

(assert (=> b!385232 (= res!219723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385233 () Bool)

(assert (=> b!385233 (= e!233804 tp_is_empty!9407)))

(declare-fun mapIsEmpty!15675 () Bool)

(assert (=> mapIsEmpty!15675 mapRes!15675))

(declare-fun b!385234 () Bool)

(declare-fun e!233803 () Bool)

(assert (=> b!385234 (= e!233803 tp_is_empty!9407)))

(declare-fun b!385235 () Bool)

(declare-fun res!219720 () Bool)

(assert (=> b!385235 (=> (not res!219720) (not e!233801))))

(declare-fun arrayContainsKey!0 (array!22717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385235 (= res!219720 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385236 () Bool)

(declare-fun e!233798 () Bool)

(assert (=> b!385236 (= e!233798 true)))

(declare-datatypes ((tuple2!6396 0))(
  ( (tuple2!6397 (_1!3209 (_ BitVec 64)) (_2!3209 V!13647)) )
))
(declare-datatypes ((List!6232 0))(
  ( (Nil!6229) (Cons!6228 (h!7084 tuple2!6396) (t!11382 List!6232)) )
))
(declare-datatypes ((ListLongMap!5309 0))(
  ( (ListLongMap!5310 (toList!2670 List!6232)) )
))
(declare-fun lt!181508 () ListLongMap!5309)

(declare-fun lt!181511 () ListLongMap!5309)

(declare-fun lt!181502 () tuple2!6396)

(declare-fun +!1005 (ListLongMap!5309 tuple2!6396) ListLongMap!5309)

(assert (=> b!385236 (= lt!181508 (+!1005 lt!181511 lt!181502))))

(declare-fun lt!181507 () ListLongMap!5309)

(declare-fun lt!181506 () ListLongMap!5309)

(assert (=> b!385236 (= lt!181507 lt!181506)))

(declare-fun b!385237 () Bool)

(assert (=> b!385237 (= e!233800 (not e!233798))))

(declare-fun res!219721 () Bool)

(assert (=> b!385237 (=> res!219721 e!233798)))

(declare-fun lt!181512 () Bool)

(assert (=> b!385237 (= res!219721 (or (and (not lt!181512) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181512) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181512)))))

(assert (=> b!385237 (= lt!181512 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13647)

(declare-fun minValue!472 () V!13647)

(declare-fun getCurrentListMap!2066 (array!22717 array!22715 (_ BitVec 32) (_ BitVec 32) V!13647 V!13647 (_ BitVec 32) Int) ListLongMap!5309)

(assert (=> b!385237 (= lt!181511 (getCurrentListMap!2066 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181503 () array!22715)

(assert (=> b!385237 (= lt!181507 (getCurrentListMap!2066 lt!181510 lt!181503 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181509 () ListLongMap!5309)

(assert (=> b!385237 (and (= lt!181506 lt!181509) (= lt!181509 lt!181506))))

(declare-fun lt!181504 () ListLongMap!5309)

(assert (=> b!385237 (= lt!181509 (+!1005 lt!181504 lt!181502))))

(declare-fun v!373 () V!13647)

(assert (=> b!385237 (= lt!181502 (tuple2!6397 k!778 v!373))))

(declare-datatypes ((Unit!11886 0))(
  ( (Unit!11887) )
))
(declare-fun lt!181505 () Unit!11886)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!224 (array!22717 array!22715 (_ BitVec 32) (_ BitVec 32) V!13647 V!13647 (_ BitVec 32) (_ BitVec 64) V!13647 (_ BitVec 32) Int) Unit!11886)

(assert (=> b!385237 (= lt!181505 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!224 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!900 (array!22717 array!22715 (_ BitVec 32) (_ BitVec 32) V!13647 V!13647 (_ BitVec 32) Int) ListLongMap!5309)

(assert (=> b!385237 (= lt!181506 (getCurrentListMapNoExtraKeys!900 lt!181510 lt!181503 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385237 (= lt!181503 (array!22716 (store (arr!10826 _values!506) i!548 (ValueCellFull!4360 v!373)) (size!11178 _values!506)))))

(assert (=> b!385237 (= lt!181504 (getCurrentListMapNoExtraKeys!900 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385238 () Bool)

(assert (=> b!385238 (= e!233799 (and e!233803 mapRes!15675))))

(declare-fun condMapEmpty!15675 () Bool)

(declare-fun mapDefault!15675 () ValueCell!4360)

