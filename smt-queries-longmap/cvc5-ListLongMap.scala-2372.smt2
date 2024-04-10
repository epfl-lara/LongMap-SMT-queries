; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37694 () Bool)

(assert start!37694)

(declare-fun b_free!8797 () Bool)

(declare-fun b_next!8797 () Bool)

(assert (=> start!37694 (= b_free!8797 (not b_next!8797))))

(declare-fun tp!31143 () Bool)

(declare-fun b_and!16039 () Bool)

(assert (=> start!37694 (= tp!31143 b_and!16039)))

(declare-fun b!386246 () Bool)

(declare-fun res!220463 () Bool)

(declare-fun e!234341 () Bool)

(assert (=> b!386246 (=> (not res!220463) (not e!234341))))

(declare-datatypes ((array!22835 0))(
  ( (array!22836 (arr!10886 (Array (_ BitVec 32) (_ BitVec 64))) (size!11238 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22835)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22835 (_ BitVec 32)) Bool)

(assert (=> b!386246 (= res!220463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386247 () Bool)

(declare-fun res!220458 () Bool)

(declare-fun e!234339 () Bool)

(assert (=> b!386247 (=> (not res!220458) (not e!234339))))

(declare-fun lt!181762 () array!22835)

(declare-datatypes ((List!6270 0))(
  ( (Nil!6267) (Cons!6266 (h!7122 (_ BitVec 64)) (t!11420 List!6270)) )
))
(declare-fun arrayNoDuplicates!0 (array!22835 (_ BitVec 32) List!6270) Bool)

(assert (=> b!386247 (= res!220458 (arrayNoDuplicates!0 lt!181762 #b00000000000000000000000000000000 Nil!6267))))

(declare-fun b!386248 () Bool)

(declare-fun res!220462 () Bool)

(assert (=> b!386248 (=> (not res!220462) (not e!234341))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386248 (= res!220462 (or (= (select (arr!10886 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10886 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386249 () Bool)

(assert (=> b!386249 (= e!234339 false)))

(declare-datatypes ((V!13731 0))(
  ( (V!13732 (val!4779 Int)) )
))
(declare-datatypes ((tuple2!6424 0))(
  ( (tuple2!6425 (_1!3223 (_ BitVec 64)) (_2!3223 V!13731)) )
))
(declare-datatypes ((List!6271 0))(
  ( (Nil!6268) (Cons!6267 (h!7123 tuple2!6424) (t!11421 List!6271)) )
))
(declare-datatypes ((ListLongMap!5337 0))(
  ( (ListLongMap!5338 (toList!2684 List!6271)) )
))
(declare-fun lt!181764 () ListLongMap!5337)

(declare-datatypes ((ValueCell!4391 0))(
  ( (ValueCellFull!4391 (v!6976 V!13731)) (EmptyCell!4391) )
))
(declare-datatypes ((array!22837 0))(
  ( (array!22838 (arr!10887 (Array (_ BitVec 32) ValueCell!4391)) (size!11239 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22837)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13731)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13731)

(declare-fun minValue!472 () V!13731)

(declare-fun getCurrentListMapNoExtraKeys!913 (array!22835 array!22837 (_ BitVec 32) (_ BitVec 32) V!13731 V!13731 (_ BitVec 32) Int) ListLongMap!5337)

(assert (=> b!386249 (= lt!181764 (getCurrentListMapNoExtraKeys!913 lt!181762 (array!22838 (store (arr!10887 _values!506) i!548 (ValueCellFull!4391 v!373)) (size!11239 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181763 () ListLongMap!5337)

(assert (=> b!386249 (= lt!181763 (getCurrentListMapNoExtraKeys!913 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386250 () Bool)

(declare-fun res!220466 () Bool)

(assert (=> b!386250 (=> (not res!220466) (not e!234341))))

(assert (=> b!386250 (= res!220466 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6267))))

(declare-fun b!386251 () Bool)

(declare-fun e!234343 () Bool)

(declare-fun e!234340 () Bool)

(declare-fun mapRes!15768 () Bool)

(assert (=> b!386251 (= e!234343 (and e!234340 mapRes!15768))))

(declare-fun condMapEmpty!15768 () Bool)

(declare-fun mapDefault!15768 () ValueCell!4391)

