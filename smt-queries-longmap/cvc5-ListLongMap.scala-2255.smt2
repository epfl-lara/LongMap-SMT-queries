; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36992 () Bool)

(assert start!36992)

(declare-fun b_free!8119 () Bool)

(declare-fun b_next!8119 () Bool)

(assert (=> start!36992 (= b_free!8119 (not b_next!8119))))

(declare-fun tp!29072 () Bool)

(declare-fun b_and!15361 () Bool)

(assert (=> start!36992 (= tp!29072 b_and!15361)))

(declare-fun b!371360 () Bool)

(declare-fun res!208731 () Bool)

(declare-fun e!226680 () Bool)

(assert (=> b!371360 (=> (not res!208731) (not e!226680))))

(declare-datatypes ((array!21475 0))(
  ( (array!21476 (arr!10206 (Array (_ BitVec 32) (_ BitVec 64))) (size!10558 (_ BitVec 32))) )
))
(declare-fun lt!170259 () array!21475)

(declare-datatypes ((List!5715 0))(
  ( (Nil!5712) (Cons!5711 (h!6567 (_ BitVec 64)) (t!10865 List!5715)) )
))
(declare-fun arrayNoDuplicates!0 (array!21475 (_ BitVec 32) List!5715) Bool)

(assert (=> b!371360 (= res!208731 (arrayNoDuplicates!0 lt!170259 #b00000000000000000000000000000000 Nil!5712))))

(declare-fun b!371361 () Bool)

(declare-fun e!226682 () Bool)

(declare-fun tp_is_empty!8767 () Bool)

(assert (=> b!371361 (= e!226682 tp_is_empty!8767)))

(declare-fun b!371362 () Bool)

(assert (=> b!371362 (= e!226680 (not true))))

(declare-datatypes ((V!12795 0))(
  ( (V!12796 (val!4428 Int)) )
))
(declare-datatypes ((tuple2!5876 0))(
  ( (tuple2!5877 (_1!2949 (_ BitVec 64)) (_2!2949 V!12795)) )
))
(declare-datatypes ((List!5716 0))(
  ( (Nil!5713) (Cons!5712 (h!6568 tuple2!5876) (t!10866 List!5716)) )
))
(declare-datatypes ((ListLongMap!4789 0))(
  ( (ListLongMap!4790 (toList!2410 List!5716)) )
))
(declare-fun lt!170255 () ListLongMap!4789)

(declare-fun lt!170257 () ListLongMap!4789)

(assert (=> b!371362 (and (= lt!170255 lt!170257) (= lt!170257 lt!170255))))

(declare-fun v!373 () V!12795)

(declare-fun lt!170258 () ListLongMap!4789)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!756 (ListLongMap!4789 tuple2!5876) ListLongMap!4789)

(assert (=> b!371362 (= lt!170257 (+!756 lt!170258 (tuple2!5877 k!778 v!373)))))

(declare-datatypes ((ValueCell!4040 0))(
  ( (ValueCellFull!4040 (v!6625 V!12795)) (EmptyCell!4040) )
))
(declare-datatypes ((array!21477 0))(
  ( (array!21478 (arr!10207 (Array (_ BitVec 32) ValueCell!4040)) (size!10559 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21477)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11418 0))(
  ( (Unit!11419) )
))
(declare-fun lt!170256 () Unit!11418)

(declare-fun zeroValue!472 () V!12795)

(declare-fun _keys!658 () array!21475)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12795)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!11 (array!21475 array!21477 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) (_ BitVec 64) V!12795 (_ BitVec 32) Int) Unit!11418)

(assert (=> b!371362 (= lt!170256 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!11 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!687 (array!21475 array!21477 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) Int) ListLongMap!4789)

(assert (=> b!371362 (= lt!170255 (getCurrentListMapNoExtraKeys!687 lt!170259 (array!21478 (store (arr!10207 _values!506) i!548 (ValueCellFull!4040 v!373)) (size!10559 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371362 (= lt!170258 (getCurrentListMapNoExtraKeys!687 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371363 () Bool)

(declare-fun e!226683 () Bool)

(declare-fun e!226685 () Bool)

(declare-fun mapRes!14715 () Bool)

(assert (=> b!371363 (= e!226683 (and e!226685 mapRes!14715))))

(declare-fun condMapEmpty!14715 () Bool)

(declare-fun mapDefault!14715 () ValueCell!4040)

