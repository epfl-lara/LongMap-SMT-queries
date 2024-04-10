; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37896 () Bool)

(assert start!37896)

(declare-fun b_free!8933 () Bool)

(declare-fun b_next!8933 () Bool)

(assert (=> start!37896 (= b_free!8933 (not b_next!8933))))

(declare-fun tp!31560 () Bool)

(declare-fun b_and!16211 () Bool)

(assert (=> start!37896 (= tp!31560 b_and!16211)))

(declare-fun b!389590 () Bool)

(declare-fun e!236025 () Bool)

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!389590 (= e!236025 (not (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!13911 0))(
  ( (V!13912 (val!4847 Int)) )
))
(declare-datatypes ((tuple2!6518 0))(
  ( (tuple2!6519 (_1!3270 (_ BitVec 64)) (_2!3270 V!13911)) )
))
(declare-datatypes ((List!6372 0))(
  ( (Nil!6369) (Cons!6368 (h!7224 tuple2!6518) (t!11528 List!6372)) )
))
(declare-datatypes ((ListLongMap!5431 0))(
  ( (ListLongMap!5432 (toList!2731 List!6372)) )
))
(declare-fun lt!183238 () ListLongMap!5431)

(declare-fun lt!183235 () ListLongMap!5431)

(declare-fun lt!183227 () tuple2!6518)

(declare-fun +!1026 (ListLongMap!5431 tuple2!6518) ListLongMap!5431)

(assert (=> b!389590 (= lt!183238 (+!1026 lt!183235 lt!183227))))

(declare-fun v!373 () V!13911)

(declare-datatypes ((Unit!11932 0))(
  ( (Unit!11933) )
))
(declare-fun lt!183231 () Unit!11932)

(declare-fun zeroValue!472 () V!13911)

(declare-fun lt!183240 () ListLongMap!5431)

(declare-fun addCommutativeForDiffKeys!330 (ListLongMap!5431 (_ BitVec 64) V!13911 (_ BitVec 64) V!13911) Unit!11932)

(assert (=> b!389590 (= lt!183231 (addCommutativeForDiffKeys!330 lt!183240 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183230 () ListLongMap!5431)

(declare-fun lt!183234 () tuple2!6518)

(assert (=> b!389590 (= lt!183230 (+!1026 lt!183238 lt!183234))))

(declare-fun lt!183239 () ListLongMap!5431)

(declare-fun lt!183237 () tuple2!6518)

(assert (=> b!389590 (= lt!183238 (+!1026 lt!183239 lt!183237))))

(declare-fun lt!183232 () ListLongMap!5431)

(assert (=> b!389590 (= lt!183232 (+!1026 lt!183235 lt!183234))))

(assert (=> b!389590 (= lt!183235 (+!1026 lt!183240 lt!183237))))

(declare-fun lt!183233 () ListLongMap!5431)

(assert (=> b!389590 (= lt!183230 (+!1026 (+!1026 lt!183233 lt!183237) lt!183234))))

(declare-fun minValue!472 () V!13911)

(assert (=> b!389590 (= lt!183234 (tuple2!6519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389590 (= lt!183237 (tuple2!6519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389591 () Bool)

(declare-fun e!236029 () Bool)

(assert (=> b!389591 (= e!236029 (not e!236025))))

(declare-fun res!222862 () Bool)

(assert (=> b!389591 (=> res!222862 e!236025)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389591 (= res!222862 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4459 0))(
  ( (ValueCellFull!4459 (v!7056 V!13911)) (EmptyCell!4459) )
))
(declare-datatypes ((array!23105 0))(
  ( (array!23106 (arr!11018 (Array (_ BitVec 32) ValueCell!4459)) (size!11370 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23105)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!23107 0))(
  ( (array!23108 (arr!11019 (Array (_ BitVec 32) (_ BitVec 64))) (size!11371 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23107)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!2080 (array!23107 array!23105 (_ BitVec 32) (_ BitVec 32) V!13911 V!13911 (_ BitVec 32) Int) ListLongMap!5431)

(assert (=> b!389591 (= lt!183232 (getCurrentListMap!2080 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183236 () array!23107)

(declare-fun lt!183229 () array!23105)

(assert (=> b!389591 (= lt!183230 (getCurrentListMap!2080 lt!183236 lt!183229 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389591 (and (= lt!183233 lt!183239) (= lt!183239 lt!183233))))

(assert (=> b!389591 (= lt!183239 (+!1026 lt!183240 lt!183227))))

(assert (=> b!389591 (= lt!183227 (tuple2!6519 k!778 v!373))))

(declare-fun lt!183228 () Unit!11932)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!244 (array!23107 array!23105 (_ BitVec 32) (_ BitVec 32) V!13911 V!13911 (_ BitVec 32) (_ BitVec 64) V!13911 (_ BitVec 32) Int) Unit!11932)

(assert (=> b!389591 (= lt!183228 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!244 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!960 (array!23107 array!23105 (_ BitVec 32) (_ BitVec 32) V!13911 V!13911 (_ BitVec 32) Int) ListLongMap!5431)

(assert (=> b!389591 (= lt!183233 (getCurrentListMapNoExtraKeys!960 lt!183236 lt!183229 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389591 (= lt!183229 (array!23106 (store (arr!11018 _values!506) i!548 (ValueCellFull!4459 v!373)) (size!11370 _values!506)))))

(assert (=> b!389591 (= lt!183240 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15981 () Bool)

(declare-fun mapRes!15981 () Bool)

(declare-fun tp!31559 () Bool)

(declare-fun e!236026 () Bool)

(assert (=> mapNonEmpty!15981 (= mapRes!15981 (and tp!31559 e!236026))))

(declare-fun mapValue!15981 () ValueCell!4459)

(declare-fun mapRest!15981 () (Array (_ BitVec 32) ValueCell!4459))

(declare-fun mapKey!15981 () (_ BitVec 32))

(assert (=> mapNonEmpty!15981 (= (arr!11018 _values!506) (store mapRest!15981 mapKey!15981 mapValue!15981))))

(declare-fun b!389592 () Bool)

(declare-fun e!236028 () Bool)

(assert (=> b!389592 (= e!236028 e!236029)))

(declare-fun res!222858 () Bool)

(assert (=> b!389592 (=> (not res!222858) (not e!236029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23107 (_ BitVec 32)) Bool)

(assert (=> b!389592 (= res!222858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183236 mask!970))))

(assert (=> b!389592 (= lt!183236 (array!23108 (store (arr!11019 _keys!658) i!548 k!778) (size!11371 _keys!658)))))

(declare-fun b!389593 () Bool)

(declare-fun res!222857 () Bool)

(assert (=> b!389593 (=> (not res!222857) (not e!236028))))

(declare-datatypes ((List!6373 0))(
  ( (Nil!6370) (Cons!6369 (h!7225 (_ BitVec 64)) (t!11529 List!6373)) )
))
(declare-fun arrayNoDuplicates!0 (array!23107 (_ BitVec 32) List!6373) Bool)

(assert (=> b!389593 (= res!222857 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6370))))

(declare-fun mapIsEmpty!15981 () Bool)

(assert (=> mapIsEmpty!15981 mapRes!15981))

(declare-fun b!389594 () Bool)

(declare-fun res!222860 () Bool)

(assert (=> b!389594 (=> (not res!222860) (not e!236028))))

(assert (=> b!389594 (= res!222860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389595 () Bool)

(declare-fun e!236024 () Bool)

(declare-fun e!236027 () Bool)

(assert (=> b!389595 (= e!236024 (and e!236027 mapRes!15981))))

(declare-fun condMapEmpty!15981 () Bool)

(declare-fun mapDefault!15981 () ValueCell!4459)

