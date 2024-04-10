; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37788 () Bool)

(assert start!37788)

(declare-fun b_free!8891 () Bool)

(declare-fun b_next!8891 () Bool)

(assert (=> start!37788 (= b_free!8891 (not b_next!8891))))

(declare-fun tp!31424 () Bool)

(declare-fun b_and!16133 () Bool)

(assert (=> start!37788 (= tp!31424 b_and!16133)))

(declare-fun b!388079 () Bool)

(declare-fun res!221873 () Bool)

(declare-fun e!235188 () Bool)

(assert (=> b!388079 (=> (not res!221873) (not e!235188))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388079 (= res!221873 (validKeyInArray!0 k!778))))

(declare-fun b!388080 () Bool)

(declare-fun res!221869 () Bool)

(assert (=> b!388080 (=> (not res!221869) (not e!235188))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23017 0))(
  ( (array!23018 (arr!10977 (Array (_ BitVec 32) (_ BitVec 64))) (size!11329 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23017)

(assert (=> b!388080 (= res!221869 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11329 _keys!658))))))

(declare-fun b!388081 () Bool)

(declare-fun e!235185 () Bool)

(declare-fun tp_is_empty!9563 () Bool)

(assert (=> b!388081 (= e!235185 tp_is_empty!9563)))

(declare-fun b!388082 () Bool)

(declare-fun e!235186 () Bool)

(declare-datatypes ((V!13855 0))(
  ( (V!13856 (val!4826 Int)) )
))
(declare-datatypes ((tuple2!6488 0))(
  ( (tuple2!6489 (_1!3255 (_ BitVec 64)) (_2!3255 V!13855)) )
))
(declare-datatypes ((List!6340 0))(
  ( (Nil!6337) (Cons!6336 (h!7192 tuple2!6488) (t!11490 List!6340)) )
))
(declare-datatypes ((ListLongMap!5401 0))(
  ( (ListLongMap!5402 (toList!2716 List!6340)) )
))
(declare-fun lt!182201 () ListLongMap!5401)

(declare-fun lt!182204 () ListLongMap!5401)

(assert (=> b!388082 (= e!235186 (not (= lt!182201 lt!182204)))))

(assert (=> b!388082 (= lt!182204 lt!182201)))

(declare-fun v!373 () V!13855)

(declare-fun lt!182203 () ListLongMap!5401)

(declare-fun +!1011 (ListLongMap!5401 tuple2!6488) ListLongMap!5401)

(assert (=> b!388082 (= lt!182201 (+!1011 lt!182203 (tuple2!6489 k!778 v!373)))))

(declare-datatypes ((ValueCell!4438 0))(
  ( (ValueCellFull!4438 (v!7023 V!13855)) (EmptyCell!4438) )
))
(declare-datatypes ((array!23019 0))(
  ( (array!23020 (arr!10978 (Array (_ BitVec 32) ValueCell!4438)) (size!11330 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23019)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13855)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((Unit!11896 0))(
  ( (Unit!11897) )
))
(declare-fun lt!182205 () Unit!11896)

(declare-fun minValue!472 () V!13855)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!229 (array!23017 array!23019 (_ BitVec 32) (_ BitVec 32) V!13855 V!13855 (_ BitVec 32) (_ BitVec 64) V!13855 (_ BitVec 32) Int) Unit!11896)

(assert (=> b!388082 (= lt!182205 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!229 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182202 () array!23017)

(declare-fun getCurrentListMapNoExtraKeys!945 (array!23017 array!23019 (_ BitVec 32) (_ BitVec 32) V!13855 V!13855 (_ BitVec 32) Int) ListLongMap!5401)

(assert (=> b!388082 (= lt!182204 (getCurrentListMapNoExtraKeys!945 lt!182202 (array!23020 (store (arr!10978 _values!506) i!548 (ValueCellFull!4438 v!373)) (size!11330 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388082 (= lt!182203 (getCurrentListMapNoExtraKeys!945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388083 () Bool)

(declare-fun e!235187 () Bool)

(assert (=> b!388083 (= e!235187 tp_is_empty!9563)))

(declare-fun b!388084 () Bool)

(declare-fun res!221874 () Bool)

(assert (=> b!388084 (=> (not res!221874) (not e!235188))))

(assert (=> b!388084 (= res!221874 (or (= (select (arr!10977 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10977 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388085 () Bool)

(declare-fun res!221868 () Bool)

(assert (=> b!388085 (=> (not res!221868) (not e!235188))))

(declare-fun arrayContainsKey!0 (array!23017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388085 (= res!221868 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388086 () Bool)

(declare-fun res!221875 () Bool)

(assert (=> b!388086 (=> (not res!221875) (not e!235188))))

(assert (=> b!388086 (= res!221875 (and (= (size!11330 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11329 _keys!658) (size!11330 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388087 () Bool)

(declare-fun res!221867 () Bool)

(assert (=> b!388087 (=> (not res!221867) (not e!235188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23017 (_ BitVec 32)) Bool)

(assert (=> b!388087 (= res!221867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388088 () Bool)

(assert (=> b!388088 (= e!235188 e!235186)))

(declare-fun res!221876 () Bool)

(assert (=> b!388088 (=> (not res!221876) (not e!235186))))

(assert (=> b!388088 (= res!221876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182202 mask!970))))

(assert (=> b!388088 (= lt!182202 (array!23018 (store (arr!10977 _keys!658) i!548 k!778) (size!11329 _keys!658)))))

(declare-fun b!388089 () Bool)

(declare-fun res!221870 () Bool)

(assert (=> b!388089 (=> (not res!221870) (not e!235186))))

(declare-datatypes ((List!6341 0))(
  ( (Nil!6338) (Cons!6337 (h!7193 (_ BitVec 64)) (t!11491 List!6341)) )
))
(declare-fun arrayNoDuplicates!0 (array!23017 (_ BitVec 32) List!6341) Bool)

(assert (=> b!388089 (= res!221870 (arrayNoDuplicates!0 lt!182202 #b00000000000000000000000000000000 Nil!6338))))

(declare-fun b!388090 () Bool)

(declare-fun res!221871 () Bool)

(assert (=> b!388090 (=> (not res!221871) (not e!235188))))

(assert (=> b!388090 (= res!221871 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6338))))

(declare-fun mapIsEmpty!15909 () Bool)

(declare-fun mapRes!15909 () Bool)

(assert (=> mapIsEmpty!15909 mapRes!15909))

(declare-fun b!388091 () Bool)

(declare-fun e!235189 () Bool)

(assert (=> b!388091 (= e!235189 (and e!235185 mapRes!15909))))

(declare-fun condMapEmpty!15909 () Bool)

(declare-fun mapDefault!15909 () ValueCell!4438)

