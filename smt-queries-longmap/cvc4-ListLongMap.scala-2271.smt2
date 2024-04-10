; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37092 () Bool)

(assert start!37092)

(declare-fun b_free!8219 () Bool)

(declare-fun b_next!8219 () Bool)

(assert (=> start!37092 (= b_free!8219 (not b_next!8219))))

(declare-fun tp!29372 () Bool)

(declare-fun b_and!15461 () Bool)

(assert (=> start!37092 (= tp!29372 b_and!15461)))

(declare-fun b!373362 () Bool)

(declare-fun e!227624 () Bool)

(assert (=> b!373362 (= e!227624 true)))

(declare-datatypes ((V!12927 0))(
  ( (V!12928 (val!4478 Int)) )
))
(declare-datatypes ((tuple2!5944 0))(
  ( (tuple2!5945 (_1!2983 (_ BitVec 64)) (_2!2983 V!12927)) )
))
(declare-datatypes ((List!5790 0))(
  ( (Nil!5787) (Cons!5786 (h!6642 tuple2!5944) (t!10940 List!5790)) )
))
(declare-datatypes ((ListLongMap!4857 0))(
  ( (ListLongMap!4858 (toList!2444 List!5790)) )
))
(declare-fun lt!171394 () ListLongMap!4857)

(declare-fun lt!171391 () tuple2!5944)

(declare-fun lt!171402 () ListLongMap!4857)

(declare-fun lt!171392 () tuple2!5944)

(declare-fun +!790 (ListLongMap!4857 tuple2!5944) ListLongMap!4857)

(assert (=> b!373362 (= (+!790 lt!171394 lt!171391) (+!790 lt!171402 lt!171392))))

(declare-datatypes ((Unit!11486 0))(
  ( (Unit!11487) )
))
(declare-fun lt!171395 () Unit!11486)

(declare-fun v!373 () V!12927)

(declare-fun lt!171405 () ListLongMap!4857)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!12927)

(declare-fun addCommutativeForDiffKeys!216 (ListLongMap!4857 (_ BitVec 64) V!12927 (_ BitVec 64) V!12927) Unit!11486)

(assert (=> b!373362 (= lt!171395 (addCommutativeForDiffKeys!216 lt!171405 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373363 () Bool)

(declare-fun res!210282 () Bool)

(declare-fun e!227623 () Bool)

(assert (=> b!373363 (=> (not res!210282) (not e!227623))))

(declare-datatypes ((array!21675 0))(
  ( (array!21676 (arr!10306 (Array (_ BitVec 32) (_ BitVec 64))) (size!10658 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21675)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373363 (= res!210282 (or (= (select (arr!10306 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10306 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14865 () Bool)

(declare-fun mapRes!14865 () Bool)

(assert (=> mapIsEmpty!14865 mapRes!14865))

(declare-fun b!373364 () Bool)

(declare-fun e!227625 () Bool)

(assert (=> b!373364 (= e!227625 e!227624)))

(declare-fun res!210292 () Bool)

(assert (=> b!373364 (=> res!210292 e!227624)))

(assert (=> b!373364 (= res!210292 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171390 () ListLongMap!4857)

(assert (=> b!373364 (= lt!171390 lt!171394)))

(assert (=> b!373364 (= lt!171394 (+!790 lt!171405 lt!171392))))

(declare-fun zeroValue!472 () V!12927)

(declare-fun lt!171401 () Unit!11486)

(declare-fun lt!171403 () ListLongMap!4857)

(assert (=> b!373364 (= lt!171401 (addCommutativeForDiffKeys!216 lt!171403 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171399 () ListLongMap!4857)

(assert (=> b!373364 (= lt!171399 (+!790 lt!171390 lt!171391))))

(declare-fun lt!171404 () ListLongMap!4857)

(declare-fun lt!171389 () tuple2!5944)

(assert (=> b!373364 (= lt!171390 (+!790 lt!171404 lt!171389))))

(declare-fun lt!171393 () ListLongMap!4857)

(assert (=> b!373364 (= lt!171393 lt!171402)))

(assert (=> b!373364 (= lt!171402 (+!790 lt!171405 lt!171391))))

(assert (=> b!373364 (= lt!171405 (+!790 lt!171403 lt!171389))))

(declare-fun lt!171400 () ListLongMap!4857)

(assert (=> b!373364 (= lt!171399 (+!790 (+!790 lt!171400 lt!171389) lt!171391))))

(assert (=> b!373364 (= lt!171391 (tuple2!5945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373364 (= lt!171389 (tuple2!5945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373366 () Bool)

(declare-fun res!210286 () Bool)

(assert (=> b!373366 (=> (not res!210286) (not e!227623))))

(declare-datatypes ((List!5791 0))(
  ( (Nil!5788) (Cons!5787 (h!6643 (_ BitVec 64)) (t!10941 List!5791)) )
))
(declare-fun arrayNoDuplicates!0 (array!21675 (_ BitVec 32) List!5791) Bool)

(assert (=> b!373366 (= res!210286 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5788))))

(declare-fun b!373367 () Bool)

(declare-fun res!210291 () Bool)

(assert (=> b!373367 (=> (not res!210291) (not e!227623))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21675 (_ BitVec 32)) Bool)

(assert (=> b!373367 (= res!210291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373368 () Bool)

(declare-fun res!210285 () Bool)

(declare-fun e!227628 () Bool)

(assert (=> b!373368 (=> (not res!210285) (not e!227628))))

(declare-fun lt!171396 () array!21675)

(assert (=> b!373368 (= res!210285 (arrayNoDuplicates!0 lt!171396 #b00000000000000000000000000000000 Nil!5788))))

(declare-fun mapNonEmpty!14865 () Bool)

(declare-fun tp!29373 () Bool)

(declare-fun e!227630 () Bool)

(assert (=> mapNonEmpty!14865 (= mapRes!14865 (and tp!29373 e!227630))))

(declare-fun mapKey!14865 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4090 0))(
  ( (ValueCellFull!4090 (v!6675 V!12927)) (EmptyCell!4090) )
))
(declare-fun mapRest!14865 () (Array (_ BitVec 32) ValueCell!4090))

(declare-fun mapValue!14865 () ValueCell!4090)

(declare-datatypes ((array!21677 0))(
  ( (array!21678 (arr!10307 (Array (_ BitVec 32) ValueCell!4090)) (size!10659 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21677)

(assert (=> mapNonEmpty!14865 (= (arr!10307 _values!506) (store mapRest!14865 mapKey!14865 mapValue!14865))))

(declare-fun b!373369 () Bool)

(declare-fun res!210293 () Bool)

(assert (=> b!373369 (=> (not res!210293) (not e!227623))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373369 (= res!210293 (and (= (size!10659 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10658 _keys!658) (size!10659 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373370 () Bool)

(assert (=> b!373370 (= e!227623 e!227628)))

(declare-fun res!210289 () Bool)

(assert (=> b!373370 (=> (not res!210289) (not e!227628))))

(assert (=> b!373370 (= res!210289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171396 mask!970))))

(assert (=> b!373370 (= lt!171396 (array!21676 (store (arr!10306 _keys!658) i!548 k!778) (size!10658 _keys!658)))))

(declare-fun b!373371 () Bool)

(declare-fun e!227627 () Bool)

(declare-fun tp_is_empty!8867 () Bool)

(assert (=> b!373371 (= e!227627 tp_is_empty!8867)))

(declare-fun b!373372 () Bool)

(assert (=> b!373372 (= e!227630 tp_is_empty!8867)))

(declare-fun b!373373 () Bool)

(declare-fun res!210290 () Bool)

(assert (=> b!373373 (=> (not res!210290) (not e!227623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373373 (= res!210290 (validKeyInArray!0 k!778))))

(declare-fun b!373374 () Bool)

(declare-fun res!210284 () Bool)

(assert (=> b!373374 (=> (not res!210284) (not e!227623))))

(declare-fun arrayContainsKey!0 (array!21675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373374 (= res!210284 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373375 () Bool)

(declare-fun res!210287 () Bool)

(assert (=> b!373375 (=> (not res!210287) (not e!227623))))

(assert (=> b!373375 (= res!210287 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10658 _keys!658))))))

(declare-fun b!373376 () Bool)

(declare-fun e!227629 () Bool)

(assert (=> b!373376 (= e!227629 (and e!227627 mapRes!14865))))

(declare-fun condMapEmpty!14865 () Bool)

(declare-fun mapDefault!14865 () ValueCell!4090)

