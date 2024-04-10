; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37094 () Bool)

(assert start!37094)

(declare-fun b_free!8221 () Bool)

(declare-fun b_next!8221 () Bool)

(assert (=> start!37094 (= b_free!8221 (not b_next!8221))))

(declare-fun tp!29379 () Bool)

(declare-fun b_and!15463 () Bool)

(assert (=> start!37094 (= tp!29379 b_and!15463)))

(declare-fun b!373407 () Bool)

(declare-fun e!227651 () Bool)

(declare-fun e!227654 () Bool)

(assert (=> b!373407 (= e!227651 (not e!227654))))

(declare-fun res!210323 () Bool)

(assert (=> b!373407 (=> res!210323 e!227654)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373407 (= res!210323 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!12931 0))(
  ( (V!12932 (val!4479 Int)) )
))
(declare-fun zeroValue!472 () V!12931)

(declare-datatypes ((array!21679 0))(
  ( (array!21680 (arr!10308 (Array (_ BitVec 32) (_ BitVec 64))) (size!10660 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21679)

(declare-datatypes ((ValueCell!4091 0))(
  ( (ValueCellFull!4091 (v!6676 V!12931)) (EmptyCell!4091) )
))
(declare-datatypes ((array!21681 0))(
  ( (array!21682 (arr!10309 (Array (_ BitVec 32) ValueCell!4091)) (size!10661 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21681)

(declare-datatypes ((tuple2!5946 0))(
  ( (tuple2!5947 (_1!2984 (_ BitVec 64)) (_2!2984 V!12931)) )
))
(declare-datatypes ((List!5792 0))(
  ( (Nil!5789) (Cons!5788 (h!6644 tuple2!5946) (t!10942 List!5792)) )
))
(declare-datatypes ((ListLongMap!4859 0))(
  ( (ListLongMap!4860 (toList!2445 List!5792)) )
))
(declare-fun lt!171452 () ListLongMap!4859)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12931)

(declare-fun getCurrentListMap!1886 (array!21679 array!21681 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!373407 (= lt!171452 (getCurrentListMap!1886 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171456 () array!21679)

(declare-fun lt!171454 () array!21681)

(declare-fun lt!171450 () ListLongMap!4859)

(assert (=> b!373407 (= lt!171450 (getCurrentListMap!1886 lt!171456 lt!171454 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171440 () ListLongMap!4859)

(declare-fun lt!171448 () ListLongMap!4859)

(assert (=> b!373407 (and (= lt!171440 lt!171448) (= lt!171448 lt!171440))))

(declare-fun lt!171455 () ListLongMap!4859)

(declare-fun lt!171451 () tuple2!5946)

(declare-fun +!791 (ListLongMap!4859 tuple2!5946) ListLongMap!4859)

(assert (=> b!373407 (= lt!171448 (+!791 lt!171455 lt!171451))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12931)

(assert (=> b!373407 (= lt!171451 (tuple2!5947 k!778 v!373))))

(declare-datatypes ((Unit!11488 0))(
  ( (Unit!11489) )
))
(declare-fun lt!171445 () Unit!11488)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!44 (array!21679 array!21681 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) (_ BitVec 64) V!12931 (_ BitVec 32) Int) Unit!11488)

(assert (=> b!373407 (= lt!171445 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!44 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!720 (array!21679 array!21681 (_ BitVec 32) (_ BitVec 32) V!12931 V!12931 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!373407 (= lt!171440 (getCurrentListMapNoExtraKeys!720 lt!171456 lt!171454 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373407 (= lt!171454 (array!21682 (store (arr!10309 _values!506) i!548 (ValueCellFull!4091 v!373)) (size!10661 _values!506)))))

(assert (=> b!373407 (= lt!171455 (getCurrentListMapNoExtraKeys!720 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373408 () Bool)

(declare-fun res!210319 () Bool)

(declare-fun e!227647 () Bool)

(assert (=> b!373408 (=> (not res!210319) (not e!227647))))

(assert (=> b!373408 (= res!210319 (or (= (select (arr!10308 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10308 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373409 () Bool)

(declare-fun e!227653 () Bool)

(declare-fun e!227649 () Bool)

(declare-fun mapRes!14868 () Bool)

(assert (=> b!373409 (= e!227653 (and e!227649 mapRes!14868))))

(declare-fun condMapEmpty!14868 () Bool)

(declare-fun mapDefault!14868 () ValueCell!4091)

