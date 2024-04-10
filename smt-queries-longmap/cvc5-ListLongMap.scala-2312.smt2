; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37334 () Bool)

(assert start!37334)

(declare-fun b_free!8461 () Bool)

(declare-fun b_next!8461 () Bool)

(assert (=> start!37334 (= b_free!8461 (not b_next!8461))))

(declare-fun tp!30098 () Bool)

(declare-fun b_and!15703 () Bool)

(assert (=> start!37334 (= tp!30098 b_and!15703)))

(declare-fun b!378825 () Bool)

(declare-fun e!230528 () Bool)

(declare-fun tp_is_empty!9109 () Bool)

(assert (=> b!378825 (= e!230528 tp_is_empty!9109)))

(declare-fun b!378826 () Bool)

(declare-fun res!214667 () Bool)

(declare-fun e!230529 () Bool)

(assert (=> b!378826 (=> (not res!214667) (not e!230529))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22143 0))(
  ( (array!22144 (arr!10540 (Array (_ BitVec 32) (_ BitVec 64))) (size!10892 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22143)

(assert (=> b!378826 (= res!214667 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10892 _keys!658))))))

(declare-fun b!378827 () Bool)

(declare-fun res!214660 () Bool)

(assert (=> b!378827 (=> (not res!214660) (not e!230529))))

(assert (=> b!378827 (= res!214660 (or (= (select (arr!10540 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10540 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378828 () Bool)

(declare-fun e!230531 () Bool)

(declare-fun e!230533 () Bool)

(assert (=> b!378828 (= e!230531 (not e!230533))))

(declare-fun res!214661 () Bool)

(assert (=> b!378828 (=> res!214661 e!230533)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378828 (= res!214661 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13251 0))(
  ( (V!13252 (val!4599 Int)) )
))
(declare-datatypes ((ValueCell!4211 0))(
  ( (ValueCellFull!4211 (v!6796 V!13251)) (EmptyCell!4211) )
))
(declare-datatypes ((array!22145 0))(
  ( (array!22146 (arr!10541 (Array (_ BitVec 32) ValueCell!4211)) (size!10893 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22145)

(declare-datatypes ((tuple2!6146 0))(
  ( (tuple2!6147 (_1!3084 (_ BitVec 64)) (_2!3084 V!13251)) )
))
(declare-datatypes ((List!5983 0))(
  ( (Nil!5980) (Cons!5979 (h!6835 tuple2!6146) (t!11133 List!5983)) )
))
(declare-datatypes ((ListLongMap!5059 0))(
  ( (ListLongMap!5060 (toList!2545 List!5983)) )
))
(declare-fun lt!176658 () ListLongMap!5059)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13251)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13251)

(declare-fun getCurrentListMap!1969 (array!22143 array!22145 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!5059)

(assert (=> b!378828 (= lt!176658 (getCurrentListMap!1969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176655 () array!22143)

(declare-fun lt!176662 () ListLongMap!5059)

(declare-fun lt!176657 () array!22145)

(assert (=> b!378828 (= lt!176662 (getCurrentListMap!1969 lt!176655 lt!176657 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176652 () ListLongMap!5059)

(declare-fun lt!176654 () ListLongMap!5059)

(assert (=> b!378828 (and (= lt!176652 lt!176654) (= lt!176654 lt!176652))))

(declare-fun lt!176663 () ListLongMap!5059)

(declare-fun lt!176660 () tuple2!6146)

(declare-fun +!891 (ListLongMap!5059 tuple2!6146) ListLongMap!5059)

(assert (=> b!378828 (= lt!176654 (+!891 lt!176663 lt!176660))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13251)

(assert (=> b!378828 (= lt!176660 (tuple2!6147 k!778 v!373))))

(declare-datatypes ((Unit!11682 0))(
  ( (Unit!11683) )
))
(declare-fun lt!176664 () Unit!11682)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!127 (array!22143 array!22145 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) (_ BitVec 64) V!13251 (_ BitVec 32) Int) Unit!11682)

(assert (=> b!378828 (= lt!176664 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!127 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!803 (array!22143 array!22145 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!5059)

(assert (=> b!378828 (= lt!176652 (getCurrentListMapNoExtraKeys!803 lt!176655 lt!176657 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378828 (= lt!176657 (array!22146 (store (arr!10541 _values!506) i!548 (ValueCellFull!4211 v!373)) (size!10893 _values!506)))))

(assert (=> b!378828 (= lt!176663 (getCurrentListMapNoExtraKeys!803 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378829 () Bool)

(declare-fun e!230527 () Bool)

(assert (=> b!378829 (= e!230533 e!230527)))

(declare-fun res!214662 () Bool)

(assert (=> b!378829 (=> res!214662 e!230527)))

(assert (=> b!378829 (= res!214662 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176661 () ListLongMap!5059)

(assert (=> b!378829 (= lt!176658 lt!176661)))

(declare-fun lt!176653 () tuple2!6146)

(assert (=> b!378829 (= lt!176661 (+!891 lt!176663 lt!176653))))

(declare-fun lt!176659 () ListLongMap!5059)

(assert (=> b!378829 (= lt!176662 lt!176659)))

(assert (=> b!378829 (= lt!176659 (+!891 lt!176654 lt!176653))))

(assert (=> b!378829 (= lt!176662 (+!891 lt!176652 lt!176653))))

(assert (=> b!378829 (= lt!176653 (tuple2!6147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378830 () Bool)

(declare-fun res!214658 () Bool)

(assert (=> b!378830 (=> (not res!214658) (not e!230531))))

(declare-datatypes ((List!5984 0))(
  ( (Nil!5981) (Cons!5980 (h!6836 (_ BitVec 64)) (t!11134 List!5984)) )
))
(declare-fun arrayNoDuplicates!0 (array!22143 (_ BitVec 32) List!5984) Bool)

(assert (=> b!378830 (= res!214658 (arrayNoDuplicates!0 lt!176655 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun b!378832 () Bool)

(declare-fun res!214666 () Bool)

(assert (=> b!378832 (=> (not res!214666) (not e!230529))))

(assert (=> b!378832 (= res!214666 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun mapIsEmpty!15228 () Bool)

(declare-fun mapRes!15228 () Bool)

(assert (=> mapIsEmpty!15228 mapRes!15228))

(declare-fun b!378833 () Bool)

(assert (=> b!378833 (= e!230527 true)))

(assert (=> b!378833 (= lt!176659 (+!891 lt!176661 lt!176660))))

(declare-fun lt!176656 () Unit!11682)

(declare-fun addCommutativeForDiffKeys!293 (ListLongMap!5059 (_ BitVec 64) V!13251 (_ BitVec 64) V!13251) Unit!11682)

(assert (=> b!378833 (= lt!176656 (addCommutativeForDiffKeys!293 lt!176663 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378834 () Bool)

(declare-fun res!214664 () Bool)

(assert (=> b!378834 (=> (not res!214664) (not e!230529))))

(declare-fun arrayContainsKey!0 (array!22143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378834 (= res!214664 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378831 () Bool)

(declare-fun res!214663 () Bool)

(assert (=> b!378831 (=> (not res!214663) (not e!230529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378831 (= res!214663 (validKeyInArray!0 k!778))))

(declare-fun res!214657 () Bool)

(assert (=> start!37334 (=> (not res!214657) (not e!230529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37334 (= res!214657 (validMask!0 mask!970))))

(assert (=> start!37334 e!230529))

(declare-fun e!230532 () Bool)

(declare-fun array_inv!7764 (array!22145) Bool)

(assert (=> start!37334 (and (array_inv!7764 _values!506) e!230532)))

(assert (=> start!37334 tp!30098))

(assert (=> start!37334 true))

(assert (=> start!37334 tp_is_empty!9109))

(declare-fun array_inv!7765 (array!22143) Bool)

(assert (=> start!37334 (array_inv!7765 _keys!658)))

(declare-fun b!378835 () Bool)

(declare-fun e!230534 () Bool)

(assert (=> b!378835 (= e!230532 (and e!230534 mapRes!15228))))

(declare-fun condMapEmpty!15228 () Bool)

(declare-fun mapDefault!15228 () ValueCell!4211)

