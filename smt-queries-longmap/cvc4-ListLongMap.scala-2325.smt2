; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37416 () Bool)

(assert start!37416)

(declare-fun b_free!8543 () Bool)

(declare-fun b_next!8543 () Bool)

(assert (=> start!37416 (= b_free!8543 (not b_next!8543))))

(declare-fun tp!30344 () Bool)

(declare-fun b_and!15785 () Bool)

(assert (=> start!37416 (= tp!30344 b_and!15785)))

(declare-fun mapIsEmpty!15351 () Bool)

(declare-fun mapRes!15351 () Bool)

(assert (=> mapIsEmpty!15351 mapRes!15351))

(declare-fun b!380670 () Bool)

(declare-fun e!231515 () Bool)

(assert (=> b!380670 (= e!231515 true)))

(declare-datatypes ((V!13359 0))(
  ( (V!13360 (val!4640 Int)) )
))
(declare-datatypes ((tuple2!6222 0))(
  ( (tuple2!6223 (_1!3122 (_ BitVec 64)) (_2!3122 V!13359)) )
))
(declare-datatypes ((List!6057 0))(
  ( (Nil!6054) (Cons!6053 (h!6909 tuple2!6222) (t!11207 List!6057)) )
))
(declare-datatypes ((ListLongMap!5135 0))(
  ( (ListLongMap!5136 (toList!2583 List!6057)) )
))
(declare-fun lt!178263 () ListLongMap!5135)

(declare-fun lt!178257 () ListLongMap!5135)

(declare-fun lt!178258 () tuple2!6222)

(declare-fun +!929 (ListLongMap!5135 tuple2!6222) ListLongMap!5135)

(assert (=> b!380670 (= lt!178263 (+!929 lt!178257 lt!178258))))

(declare-fun lt!178252 () ListLongMap!5135)

(declare-fun v!373 () V!13359)

(declare-fun k!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11752 0))(
  ( (Unit!11753) )
))
(declare-fun lt!178262 () Unit!11752)

(declare-fun minValue!472 () V!13359)

(declare-fun addCommutativeForDiffKeys!326 (ListLongMap!5135 (_ BitVec 64) V!13359 (_ BitVec 64) V!13359) Unit!11752)

(assert (=> b!380670 (= lt!178262 (addCommutativeForDiffKeys!326 lt!178252 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380671 () Bool)

(declare-fun e!231513 () Bool)

(assert (=> b!380671 (= e!231513 e!231515)))

(declare-fun res!216142 () Bool)

(assert (=> b!380671 (=> res!216142 e!231515)))

(assert (=> b!380671 (= res!216142 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!178251 () ListLongMap!5135)

(assert (=> b!380671 (= lt!178251 lt!178257)))

(declare-fun lt!178259 () tuple2!6222)

(assert (=> b!380671 (= lt!178257 (+!929 lt!178252 lt!178259))))

(declare-fun lt!178254 () ListLongMap!5135)

(assert (=> b!380671 (= lt!178254 lt!178263)))

(declare-fun lt!178260 () ListLongMap!5135)

(assert (=> b!380671 (= lt!178263 (+!929 lt!178260 lt!178259))))

(declare-fun lt!178261 () ListLongMap!5135)

(assert (=> b!380671 (= lt!178254 (+!929 lt!178261 lt!178259))))

(assert (=> b!380671 (= lt!178259 (tuple2!6223 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380672 () Bool)

(declare-fun res!216133 () Bool)

(declare-fun e!231518 () Bool)

(assert (=> b!380672 (=> (not res!216133) (not e!231518))))

(declare-datatypes ((array!22301 0))(
  ( (array!22302 (arr!10619 (Array (_ BitVec 32) (_ BitVec 64))) (size!10971 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22301)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380672 (= res!216133 (or (= (select (arr!10619 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10619 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380673 () Bool)

(declare-fun e!231517 () Bool)

(assert (=> b!380673 (= e!231518 e!231517)))

(declare-fun res!216134 () Bool)

(assert (=> b!380673 (=> (not res!216134) (not e!231517))))

(declare-fun lt!178256 () array!22301)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22301 (_ BitVec 32)) Bool)

(assert (=> b!380673 (= res!216134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178256 mask!970))))

(assert (=> b!380673 (= lt!178256 (array!22302 (store (arr!10619 _keys!658) i!548 k!778) (size!10971 _keys!658)))))

(declare-fun b!380674 () Bool)

(declare-fun res!216141 () Bool)

(assert (=> b!380674 (=> (not res!216141) (not e!231518))))

(assert (=> b!380674 (= res!216141 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10971 _keys!658))))))

(declare-fun b!380675 () Bool)

(assert (=> b!380675 (= e!231517 (not e!231513))))

(declare-fun res!216138 () Bool)

(assert (=> b!380675 (=> res!216138 e!231513)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380675 (= res!216138 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4252 0))(
  ( (ValueCellFull!4252 (v!6837 V!13359)) (EmptyCell!4252) )
))
(declare-datatypes ((array!22303 0))(
  ( (array!22304 (arr!10620 (Array (_ BitVec 32) ValueCell!4252)) (size!10972 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22303)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13359)

(declare-fun getCurrentListMap!1999 (array!22301 array!22303 (_ BitVec 32) (_ BitVec 32) V!13359 V!13359 (_ BitVec 32) Int) ListLongMap!5135)

(assert (=> b!380675 (= lt!178251 (getCurrentListMap!1999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178255 () array!22303)

(assert (=> b!380675 (= lt!178254 (getCurrentListMap!1999 lt!178256 lt!178255 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380675 (and (= lt!178261 lt!178260) (= lt!178260 lt!178261))))

(assert (=> b!380675 (= lt!178260 (+!929 lt!178252 lt!178258))))

(assert (=> b!380675 (= lt!178258 (tuple2!6223 k!778 v!373))))

(declare-fun lt!178253 () Unit!11752)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!157 (array!22301 array!22303 (_ BitVec 32) (_ BitVec 32) V!13359 V!13359 (_ BitVec 32) (_ BitVec 64) V!13359 (_ BitVec 32) Int) Unit!11752)

(assert (=> b!380675 (= lt!178253 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!157 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!833 (array!22301 array!22303 (_ BitVec 32) (_ BitVec 32) V!13359 V!13359 (_ BitVec 32) Int) ListLongMap!5135)

(assert (=> b!380675 (= lt!178261 (getCurrentListMapNoExtraKeys!833 lt!178256 lt!178255 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380675 (= lt!178255 (array!22304 (store (arr!10620 _values!506) i!548 (ValueCellFull!4252 v!373)) (size!10972 _values!506)))))

(assert (=> b!380675 (= lt!178252 (getCurrentListMapNoExtraKeys!833 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380676 () Bool)

(declare-fun e!231514 () Bool)

(declare-fun e!231511 () Bool)

(assert (=> b!380676 (= e!231514 (and e!231511 mapRes!15351))))

(declare-fun condMapEmpty!15351 () Bool)

(declare-fun mapDefault!15351 () ValueCell!4252)

