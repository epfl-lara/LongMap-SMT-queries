; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37760 () Bool)

(assert start!37760)

(declare-fun b_free!8863 () Bool)

(declare-fun b_next!8863 () Bool)

(assert (=> start!37760 (= b_free!8863 (not b_next!8863))))

(declare-fun tp!31341 () Bool)

(declare-fun b_and!16105 () Bool)

(assert (=> start!37760 (= tp!31341 b_and!16105)))

(declare-fun b!387534 () Bool)

(declare-fun e!234933 () Bool)

(declare-fun e!234938 () Bool)

(assert (=> b!387534 (= e!234933 e!234938)))

(declare-fun res!221451 () Bool)

(assert (=> b!387534 (=> (not res!221451) (not e!234938))))

(declare-datatypes ((array!22961 0))(
  ( (array!22962 (arr!10949 (Array (_ BitVec 32) (_ BitVec 64))) (size!11301 (_ BitVec 32))) )
))
(declare-fun lt!182060 () array!22961)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22961 (_ BitVec 32)) Bool)

(assert (=> b!387534 (= res!221451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182060 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22961)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387534 (= lt!182060 (array!22962 (store (arr!10949 _keys!658) i!548 k!778) (size!11301 _keys!658)))))

(declare-fun b!387535 () Bool)

(declare-fun res!221448 () Bool)

(assert (=> b!387535 (=> (not res!221448) (not e!234933))))

(assert (=> b!387535 (= res!221448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387536 () Bool)

(declare-fun res!221449 () Bool)

(assert (=> b!387536 (=> (not res!221449) (not e!234933))))

(declare-datatypes ((List!6319 0))(
  ( (Nil!6316) (Cons!6315 (h!7171 (_ BitVec 64)) (t!11469 List!6319)) )
))
(declare-fun arrayNoDuplicates!0 (array!22961 (_ BitVec 32) List!6319) Bool)

(assert (=> b!387536 (= res!221449 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6316))))

(declare-fun b!387537 () Bool)

(declare-fun res!221452 () Bool)

(assert (=> b!387537 (=> (not res!221452) (not e!234933))))

(assert (=> b!387537 (= res!221452 (or (= (select (arr!10949 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10949 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387538 () Bool)

(assert (=> b!387538 (= e!234938 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13819 0))(
  ( (V!13820 (val!4812 Int)) )
))
(declare-datatypes ((tuple2!6468 0))(
  ( (tuple2!6469 (_1!3245 (_ BitVec 64)) (_2!3245 V!13819)) )
))
(declare-datatypes ((List!6320 0))(
  ( (Nil!6317) (Cons!6316 (h!7172 tuple2!6468) (t!11470 List!6320)) )
))
(declare-datatypes ((ListLongMap!5381 0))(
  ( (ListLongMap!5382 (toList!2706 List!6320)) )
))
(declare-fun lt!182059 () ListLongMap!5381)

(declare-fun zeroValue!472 () V!13819)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13819)

(declare-datatypes ((ValueCell!4424 0))(
  ( (ValueCellFull!4424 (v!7009 V!13819)) (EmptyCell!4424) )
))
(declare-datatypes ((array!22963 0))(
  ( (array!22964 (arr!10950 (Array (_ BitVec 32) ValueCell!4424)) (size!11302 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22963)

(declare-fun minValue!472 () V!13819)

(declare-fun getCurrentListMapNoExtraKeys!935 (array!22961 array!22963 (_ BitVec 32) (_ BitVec 32) V!13819 V!13819 (_ BitVec 32) Int) ListLongMap!5381)

(assert (=> b!387538 (= lt!182059 (getCurrentListMapNoExtraKeys!935 lt!182060 (array!22964 (store (arr!10950 _values!506) i!548 (ValueCellFull!4424 v!373)) (size!11302 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182061 () ListLongMap!5381)

(assert (=> b!387538 (= lt!182061 (getCurrentListMapNoExtraKeys!935 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387539 () Bool)

(declare-fun res!221455 () Bool)

(assert (=> b!387539 (=> (not res!221455) (not e!234933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387539 (= res!221455 (validKeyInArray!0 k!778))))

(declare-fun b!387540 () Bool)

(declare-fun res!221450 () Bool)

(assert (=> b!387540 (=> (not res!221450) (not e!234933))))

(declare-fun arrayContainsKey!0 (array!22961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387540 (= res!221450 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387541 () Bool)

(declare-fun res!221456 () Bool)

(assert (=> b!387541 (=> (not res!221456) (not e!234933))))

(assert (=> b!387541 (= res!221456 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11301 _keys!658))))))

(declare-fun b!387542 () Bool)

(declare-fun e!234934 () Bool)

(declare-fun e!234937 () Bool)

(declare-fun mapRes!15867 () Bool)

(assert (=> b!387542 (= e!234934 (and e!234937 mapRes!15867))))

(declare-fun condMapEmpty!15867 () Bool)

(declare-fun mapDefault!15867 () ValueCell!4424)

