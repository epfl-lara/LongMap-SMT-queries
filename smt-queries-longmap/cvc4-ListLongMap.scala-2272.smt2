; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37098 () Bool)

(assert start!37098)

(declare-fun b_free!8225 () Bool)

(declare-fun b_next!8225 () Bool)

(assert (=> start!37098 (= b_free!8225 (not b_next!8225))))

(declare-fun tp!29391 () Bool)

(declare-fun b_and!15467 () Bool)

(assert (=> start!37098 (= tp!29391 b_and!15467)))

(declare-fun b!373497 () Bool)

(declare-fun e!227696 () Bool)

(declare-fun tp_is_empty!8873 () Bool)

(assert (=> b!373497 (= e!227696 tp_is_empty!8873)))

(declare-fun b!373498 () Bool)

(declare-fun e!227701 () Bool)

(assert (=> b!373498 (= e!227701 true)))

(declare-datatypes ((V!12935 0))(
  ( (V!12936 (val!4481 Int)) )
))
(declare-datatypes ((tuple2!5950 0))(
  ( (tuple2!5951 (_1!2986 (_ BitVec 64)) (_2!2986 V!12935)) )
))
(declare-fun lt!171555 () tuple2!5950)

(declare-fun lt!171554 () tuple2!5950)

(declare-datatypes ((List!5795 0))(
  ( (Nil!5792) (Cons!5791 (h!6647 tuple2!5950) (t!10945 List!5795)) )
))
(declare-datatypes ((ListLongMap!4863 0))(
  ( (ListLongMap!4864 (toList!2447 List!5795)) )
))
(declare-fun lt!171553 () ListLongMap!4863)

(declare-fun lt!171549 () ListLongMap!4863)

(declare-fun +!793 (ListLongMap!4863 tuple2!5950) ListLongMap!4863)

(assert (=> b!373498 (= (+!793 lt!171549 lt!171554) (+!793 lt!171553 lt!171555))))

(declare-fun v!373 () V!12935)

(declare-datatypes ((Unit!11492 0))(
  ( (Unit!11493) )
))
(declare-fun lt!171548 () Unit!11492)

(declare-fun lt!171556 () ListLongMap!4863)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12935)

(declare-fun addCommutativeForDiffKeys!218 (ListLongMap!4863 (_ BitVec 64) V!12935 (_ BitVec 64) V!12935) Unit!11492)

(assert (=> b!373498 (= lt!171548 (addCommutativeForDiffKeys!218 lt!171556 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!14874 () Bool)

(declare-fun mapRes!14874 () Bool)

(declare-fun tp!29390 () Bool)

(declare-fun e!227700 () Bool)

(assert (=> mapNonEmpty!14874 (= mapRes!14874 (and tp!29390 e!227700))))

(declare-datatypes ((ValueCell!4093 0))(
  ( (ValueCellFull!4093 (v!6678 V!12935)) (EmptyCell!4093) )
))
(declare-datatypes ((array!21687 0))(
  ( (array!21688 (arr!10312 (Array (_ BitVec 32) ValueCell!4093)) (size!10664 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21687)

(declare-fun mapKey!14874 () (_ BitVec 32))

(declare-fun mapRest!14874 () (Array (_ BitVec 32) ValueCell!4093))

(declare-fun mapValue!14874 () ValueCell!4093)

(assert (=> mapNonEmpty!14874 (= (arr!10312 _values!506) (store mapRest!14874 mapKey!14874 mapValue!14874))))

(declare-fun b!373499 () Bool)

(declare-fun res!210394 () Bool)

(declare-fun e!227698 () Bool)

(assert (=> b!373499 (=> (not res!210394) (not e!227698))))

(declare-datatypes ((array!21689 0))(
  ( (array!21690 (arr!10313 (Array (_ BitVec 32) (_ BitVec 64))) (size!10665 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21689)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373499 (= res!210394 (or (= (select (arr!10313 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10313 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!210390 () Bool)

(assert (=> start!37098 (=> (not res!210390) (not e!227698))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37098 (= res!210390 (validMask!0 mask!970))))

(assert (=> start!37098 e!227698))

(declare-fun e!227695 () Bool)

(declare-fun array_inv!7600 (array!21687) Bool)

(assert (=> start!37098 (and (array_inv!7600 _values!506) e!227695)))

(assert (=> start!37098 tp!29391))

(assert (=> start!37098 true))

(assert (=> start!37098 tp_is_empty!8873))

(declare-fun array_inv!7601 (array!21689) Bool)

(assert (=> start!37098 (array_inv!7601 _keys!658)))

(declare-fun b!373500 () Bool)

(declare-fun res!210395 () Bool)

(assert (=> b!373500 (=> (not res!210395) (not e!227698))))

(declare-fun arrayContainsKey!0 (array!21689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373500 (= res!210395 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373501 () Bool)

(declare-fun res!210399 () Bool)

(assert (=> b!373501 (=> (not res!210399) (not e!227698))))

(declare-datatypes ((List!5796 0))(
  ( (Nil!5793) (Cons!5792 (h!6648 (_ BitVec 64)) (t!10946 List!5796)) )
))
(declare-fun arrayNoDuplicates!0 (array!21689 (_ BitVec 32) List!5796) Bool)

(assert (=> b!373501 (= res!210399 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5793))))

(declare-fun b!373502 () Bool)

(declare-fun res!210393 () Bool)

(assert (=> b!373502 (=> (not res!210393) (not e!227698))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373502 (= res!210393 (and (= (size!10664 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10665 _keys!658) (size!10664 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373503 () Bool)

(declare-fun e!227697 () Bool)

(declare-fun e!227699 () Bool)

(assert (=> b!373503 (= e!227697 (not e!227699))))

(declare-fun res!210391 () Bool)

(assert (=> b!373503 (=> res!210391 e!227699)))

(assert (=> b!373503 (= res!210391 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12935)

(declare-fun lt!171550 () ListLongMap!4863)

(declare-fun getCurrentListMap!1888 (array!21689 array!21687 (_ BitVec 32) (_ BitVec 32) V!12935 V!12935 (_ BitVec 32) Int) ListLongMap!4863)

(assert (=> b!373503 (= lt!171550 (getCurrentListMap!1888 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171552 () ListLongMap!4863)

(declare-fun lt!171544 () array!21687)

(declare-fun lt!171542 () array!21689)

(assert (=> b!373503 (= lt!171552 (getCurrentListMap!1888 lt!171542 lt!171544 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171545 () ListLongMap!4863)

(declare-fun lt!171543 () ListLongMap!4863)

(assert (=> b!373503 (and (= lt!171545 lt!171543) (= lt!171543 lt!171545))))

(declare-fun lt!171558 () ListLongMap!4863)

(assert (=> b!373503 (= lt!171543 (+!793 lt!171558 lt!171555))))

(assert (=> b!373503 (= lt!171555 (tuple2!5951 k!778 v!373))))

(declare-fun lt!171557 () Unit!11492)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!46 (array!21689 array!21687 (_ BitVec 32) (_ BitVec 32) V!12935 V!12935 (_ BitVec 32) (_ BitVec 64) V!12935 (_ BitVec 32) Int) Unit!11492)

(assert (=> b!373503 (= lt!171557 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!46 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!722 (array!21689 array!21687 (_ BitVec 32) (_ BitVec 32) V!12935 V!12935 (_ BitVec 32) Int) ListLongMap!4863)

(assert (=> b!373503 (= lt!171545 (getCurrentListMapNoExtraKeys!722 lt!171542 lt!171544 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373503 (= lt!171544 (array!21688 (store (arr!10312 _values!506) i!548 (ValueCellFull!4093 v!373)) (size!10664 _values!506)))))

(assert (=> b!373503 (= lt!171558 (getCurrentListMapNoExtraKeys!722 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373504 () Bool)

(assert (=> b!373504 (= e!227700 tp_is_empty!8873)))

(declare-fun b!373505 () Bool)

(declare-fun res!210400 () Bool)

(assert (=> b!373505 (=> (not res!210400) (not e!227697))))

(assert (=> b!373505 (= res!210400 (arrayNoDuplicates!0 lt!171542 #b00000000000000000000000000000000 Nil!5793))))

(declare-fun mapIsEmpty!14874 () Bool)

(assert (=> mapIsEmpty!14874 mapRes!14874))

(declare-fun b!373506 () Bool)

(assert (=> b!373506 (= e!227699 e!227701)))

(declare-fun res!210397 () Bool)

(assert (=> b!373506 (=> res!210397 e!227701)))

(assert (=> b!373506 (= res!210397 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171546 () ListLongMap!4863)

(assert (=> b!373506 (= lt!171546 lt!171549)))

(assert (=> b!373506 (= lt!171549 (+!793 lt!171556 lt!171555))))

(declare-fun lt!171551 () Unit!11492)

(assert (=> b!373506 (= lt!171551 (addCommutativeForDiffKeys!218 lt!171558 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373506 (= lt!171552 (+!793 lt!171546 lt!171554))))

(declare-fun lt!171547 () tuple2!5950)

(assert (=> b!373506 (= lt!171546 (+!793 lt!171543 lt!171547))))

(assert (=> b!373506 (= lt!171550 lt!171553)))

(assert (=> b!373506 (= lt!171553 (+!793 lt!171556 lt!171554))))

(assert (=> b!373506 (= lt!171556 (+!793 lt!171558 lt!171547))))

(assert (=> b!373506 (= lt!171552 (+!793 (+!793 lt!171545 lt!171547) lt!171554))))

(assert (=> b!373506 (= lt!171554 (tuple2!5951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373506 (= lt!171547 (tuple2!5951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373507 () Bool)

(declare-fun res!210401 () Bool)

(assert (=> b!373507 (=> (not res!210401) (not e!227698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21689 (_ BitVec 32)) Bool)

(assert (=> b!373507 (= res!210401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373508 () Bool)

(declare-fun res!210392 () Bool)

(assert (=> b!373508 (=> (not res!210392) (not e!227698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373508 (= res!210392 (validKeyInArray!0 k!778))))

(declare-fun b!373509 () Bool)

(declare-fun res!210398 () Bool)

(assert (=> b!373509 (=> (not res!210398) (not e!227698))))

(assert (=> b!373509 (= res!210398 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10665 _keys!658))))))

(declare-fun b!373510 () Bool)

(assert (=> b!373510 (= e!227695 (and e!227696 mapRes!14874))))

(declare-fun condMapEmpty!14874 () Bool)

(declare-fun mapDefault!14874 () ValueCell!4093)

