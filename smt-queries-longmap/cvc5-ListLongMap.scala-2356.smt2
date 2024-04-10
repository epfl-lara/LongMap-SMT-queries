; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37598 () Bool)

(assert start!37598)

(declare-fun b_free!8725 () Bool)

(declare-fun b_next!8725 () Bool)

(assert (=> start!37598 (= b_free!8725 (not b_next!8725))))

(declare-fun tp!30890 () Bool)

(declare-fun b_and!15967 () Bool)

(assert (=> start!37598 (= tp!30890 b_and!15967)))

(declare-fun b!384511 () Bool)

(declare-fun e!233447 () Bool)

(declare-fun e!233445 () Bool)

(assert (=> b!384511 (= e!233447 (not e!233445))))

(declare-fun res!219164 () Bool)

(assert (=> b!384511 (=> res!219164 e!233445)))

(declare-fun lt!180944 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384511 (= res!219164 (or (and (not lt!180944) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180944) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180944)))))

(assert (=> b!384511 (= lt!180944 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13603 0))(
  ( (V!13604 (val!4731 Int)) )
))
(declare-datatypes ((ValueCell!4343 0))(
  ( (ValueCellFull!4343 (v!6928 V!13603)) (EmptyCell!4343) )
))
(declare-datatypes ((array!22649 0))(
  ( (array!22650 (arr!10793 (Array (_ BitVec 32) ValueCell!4343)) (size!11145 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22649)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13603)

(declare-datatypes ((tuple2!6370 0))(
  ( (tuple2!6371 (_1!3196 (_ BitVec 64)) (_2!3196 V!13603)) )
))
(declare-datatypes ((List!6205 0))(
  ( (Nil!6202) (Cons!6201 (h!7057 tuple2!6370) (t!11355 List!6205)) )
))
(declare-datatypes ((ListLongMap!5283 0))(
  ( (ListLongMap!5284 (toList!2657 List!6205)) )
))
(declare-fun lt!180950 () ListLongMap!5283)

(declare-datatypes ((array!22651 0))(
  ( (array!22652 (arr!10794 (Array (_ BitVec 32) (_ BitVec 64))) (size!11146 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22651)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13603)

(declare-fun getCurrentListMap!2056 (array!22651 array!22649 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!384511 (= lt!180950 (getCurrentListMap!2056 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180951 () array!22651)

(declare-fun lt!180948 () array!22649)

(declare-fun lt!180942 () ListLongMap!5283)

(assert (=> b!384511 (= lt!180942 (getCurrentListMap!2056 lt!180951 lt!180948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180949 () ListLongMap!5283)

(declare-fun lt!180941 () ListLongMap!5283)

(assert (=> b!384511 (and (= lt!180949 lt!180941) (= lt!180941 lt!180949))))

(declare-fun lt!180947 () ListLongMap!5283)

(declare-fun lt!180946 () tuple2!6370)

(declare-fun +!992 (ListLongMap!5283 tuple2!6370) ListLongMap!5283)

(assert (=> b!384511 (= lt!180941 (+!992 lt!180947 lt!180946))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13603)

(assert (=> b!384511 (= lt!180946 (tuple2!6371 k!778 v!373))))

(declare-datatypes ((Unit!11866 0))(
  ( (Unit!11867) )
))
(declare-fun lt!180945 () Unit!11866)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!214 (array!22651 array!22649 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) (_ BitVec 64) V!13603 (_ BitVec 32) Int) Unit!11866)

(assert (=> b!384511 (= lt!180945 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!214 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!890 (array!22651 array!22649 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!384511 (= lt!180949 (getCurrentListMapNoExtraKeys!890 lt!180951 lt!180948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384511 (= lt!180948 (array!22650 (store (arr!10793 _values!506) i!548 (ValueCellFull!4343 v!373)) (size!11145 _values!506)))))

(assert (=> b!384511 (= lt!180947 (getCurrentListMapNoExtraKeys!890 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384512 () Bool)

(declare-fun res!219156 () Bool)

(declare-fun e!233442 () Bool)

(assert (=> b!384512 (=> (not res!219156) (not e!233442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384512 (= res!219156 (validKeyInArray!0 k!778))))

(declare-fun b!384513 () Bool)

(assert (=> b!384513 (= e!233442 e!233447)))

(declare-fun res!219157 () Bool)

(assert (=> b!384513 (=> (not res!219157) (not e!233447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22651 (_ BitVec 32)) Bool)

(assert (=> b!384513 (= res!219157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180951 mask!970))))

(assert (=> b!384513 (= lt!180951 (array!22652 (store (arr!10794 _keys!658) i!548 k!778) (size!11146 _keys!658)))))

(declare-fun b!384514 () Bool)

(declare-fun res!219161 () Bool)

(assert (=> b!384514 (=> (not res!219161) (not e!233442))))

(declare-fun arrayContainsKey!0 (array!22651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384514 (= res!219161 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384515 () Bool)

(declare-fun res!219158 () Bool)

(assert (=> b!384515 (=> (not res!219158) (not e!233442))))

(assert (=> b!384515 (= res!219158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384516 () Bool)

(declare-fun res!219159 () Bool)

(assert (=> b!384516 (=> (not res!219159) (not e!233447))))

(declare-datatypes ((List!6206 0))(
  ( (Nil!6203) (Cons!6202 (h!7058 (_ BitVec 64)) (t!11356 List!6206)) )
))
(declare-fun arrayNoDuplicates!0 (array!22651 (_ BitVec 32) List!6206) Bool)

(assert (=> b!384516 (= res!219159 (arrayNoDuplicates!0 lt!180951 #b00000000000000000000000000000000 Nil!6203))))

(declare-fun b!384517 () Bool)

(declare-fun res!219163 () Bool)

(assert (=> b!384517 (=> (not res!219163) (not e!233442))))

(assert (=> b!384517 (= res!219163 (and (= (size!11145 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11146 _keys!658) (size!11145 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384519 () Bool)

(assert (=> b!384519 (= e!233445 true)))

(declare-fun lt!180943 () ListLongMap!5283)

(assert (=> b!384519 (= lt!180943 (+!992 lt!180950 lt!180946))))

(assert (=> b!384519 (= lt!180942 lt!180949)))

(declare-fun b!384520 () Bool)

(declare-fun e!233443 () Bool)

(declare-fun tp_is_empty!9373 () Bool)

(assert (=> b!384520 (= e!233443 tp_is_empty!9373)))

(declare-fun b!384521 () Bool)

(declare-fun res!219162 () Bool)

(assert (=> b!384521 (=> (not res!219162) (not e!233442))))

(assert (=> b!384521 (= res!219162 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6203))))

(declare-fun b!384522 () Bool)

(declare-fun e!233441 () Bool)

(declare-fun mapRes!15624 () Bool)

(assert (=> b!384522 (= e!233441 (and e!233443 mapRes!15624))))

(declare-fun condMapEmpty!15624 () Bool)

(declare-fun mapDefault!15624 () ValueCell!4343)

