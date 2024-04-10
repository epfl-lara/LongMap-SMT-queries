; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37268 () Bool)

(assert start!37268)

(declare-fun b_free!8395 () Bool)

(declare-fun b_next!8395 () Bool)

(assert (=> start!37268 (= b_free!8395 (not b_next!8395))))

(declare-fun tp!29900 () Bool)

(declare-fun b_and!15637 () Bool)

(assert (=> start!37268 (= tp!29900 b_and!15637)))

(declare-fun b!377332 () Bool)

(declare-fun res!213470 () Bool)

(declare-fun e!229737 () Bool)

(assert (=> b!377332 (=> (not res!213470) (not e!229737))))

(declare-datatypes ((array!22015 0))(
  ( (array!22016 (arr!10476 (Array (_ BitVec 32) (_ BitVec 64))) (size!10828 (_ BitVec 32))) )
))
(declare-fun lt!175412 () array!22015)

(declare-datatypes ((List!5927 0))(
  ( (Nil!5924) (Cons!5923 (h!6779 (_ BitVec 64)) (t!11077 List!5927)) )
))
(declare-fun arrayNoDuplicates!0 (array!22015 (_ BitVec 32) List!5927) Bool)

(assert (=> b!377332 (= res!213470 (arrayNoDuplicates!0 lt!175412 #b00000000000000000000000000000000 Nil!5924))))

(declare-fun b!377333 () Bool)

(declare-fun e!229736 () Bool)

(assert (=> b!377333 (= e!229736 true)))

(declare-datatypes ((V!13163 0))(
  ( (V!13164 (val!4566 Int)) )
))
(declare-datatypes ((tuple2!6086 0))(
  ( (tuple2!6087 (_1!3054 (_ BitVec 64)) (_2!3054 V!13163)) )
))
(declare-datatypes ((List!5928 0))(
  ( (Nil!5925) (Cons!5924 (h!6780 tuple2!6086) (t!11078 List!5928)) )
))
(declare-datatypes ((ListLongMap!4999 0))(
  ( (ListLongMap!5000 (toList!2515 List!5928)) )
))
(declare-fun lt!175407 () ListLongMap!4999)

(declare-fun lt!175404 () ListLongMap!4999)

(declare-fun lt!175409 () tuple2!6086)

(declare-fun +!861 (ListLongMap!4999 tuple2!6086) ListLongMap!4999)

(assert (=> b!377333 (= lt!175407 (+!861 lt!175404 lt!175409))))

(declare-fun v!373 () V!13163)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13163)

(declare-fun lt!175410 () ListLongMap!4999)

(declare-datatypes ((Unit!11626 0))(
  ( (Unit!11627) )
))
(declare-fun lt!175411 () Unit!11626)

(declare-fun addCommutativeForDiffKeys!271 (ListLongMap!4999 (_ BitVec 64) V!13163 (_ BitVec 64) V!13163) Unit!11626)

(assert (=> b!377333 (= lt!175411 (addCommutativeForDiffKeys!271 lt!175410 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377334 () Bool)

(declare-fun e!229738 () Bool)

(assert (=> b!377334 (= e!229738 e!229736)))

(declare-fun res!213469 () Bool)

(assert (=> b!377334 (=> res!213469 e!229736)))

(assert (=> b!377334 (= res!213469 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175403 () ListLongMap!4999)

(assert (=> b!377334 (= lt!175403 lt!175407)))

(declare-fun lt!175405 () ListLongMap!4999)

(declare-fun lt!175402 () tuple2!6086)

(assert (=> b!377334 (= lt!175407 (+!861 lt!175405 lt!175402))))

(declare-fun lt!175408 () ListLongMap!4999)

(assert (=> b!377334 (= lt!175408 lt!175404)))

(assert (=> b!377334 (= lt!175404 (+!861 lt!175410 lt!175402))))

(declare-fun lt!175413 () ListLongMap!4999)

(assert (=> b!377334 (= lt!175403 (+!861 lt!175413 lt!175402))))

(assert (=> b!377334 (= lt!175402 (tuple2!6087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15129 () Bool)

(declare-fun mapRes!15129 () Bool)

(declare-fun tp!29901 () Bool)

(declare-fun e!229739 () Bool)

(assert (=> mapNonEmpty!15129 (= mapRes!15129 (and tp!29901 e!229739))))

(declare-fun mapKey!15129 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4178 0))(
  ( (ValueCellFull!4178 (v!6763 V!13163)) (EmptyCell!4178) )
))
(declare-datatypes ((array!22017 0))(
  ( (array!22018 (arr!10477 (Array (_ BitVec 32) ValueCell!4178)) (size!10829 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22017)

(declare-fun mapValue!15129 () ValueCell!4178)

(declare-fun mapRest!15129 () (Array (_ BitVec 32) ValueCell!4178))

(assert (=> mapNonEmpty!15129 (= (arr!10477 _values!506) (store mapRest!15129 mapKey!15129 mapValue!15129))))

(declare-fun b!377335 () Bool)

(assert (=> b!377335 (= e!229737 (not e!229738))))

(declare-fun res!213463 () Bool)

(assert (=> b!377335 (=> res!213463 e!229738)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377335 (= res!213463 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun _keys!658 () array!22015)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13163)

(declare-fun getCurrentListMap!1946 (array!22015 array!22017 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4999)

(assert (=> b!377335 (= lt!175408 (getCurrentListMap!1946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175401 () array!22017)

(assert (=> b!377335 (= lt!175403 (getCurrentListMap!1946 lt!175412 lt!175401 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377335 (and (= lt!175413 lt!175405) (= lt!175405 lt!175413))))

(assert (=> b!377335 (= lt!175405 (+!861 lt!175410 lt!175409))))

(assert (=> b!377335 (= lt!175409 (tuple2!6087 k!778 v!373))))

(declare-fun lt!175406 () Unit!11626)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!104 (array!22015 array!22017 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) (_ BitVec 64) V!13163 (_ BitVec 32) Int) Unit!11626)

(assert (=> b!377335 (= lt!175406 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!104 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!780 (array!22015 array!22017 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4999)

(assert (=> b!377335 (= lt!175413 (getCurrentListMapNoExtraKeys!780 lt!175412 lt!175401 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377335 (= lt!175401 (array!22018 (store (arr!10477 _values!506) i!548 (ValueCellFull!4178 v!373)) (size!10829 _values!506)))))

(assert (=> b!377335 (= lt!175410 (getCurrentListMapNoExtraKeys!780 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377336 () Bool)

(declare-fun res!213468 () Bool)

(declare-fun e!229741 () Bool)

(assert (=> b!377336 (=> (not res!213468) (not e!229741))))

(assert (=> b!377336 (= res!213468 (and (= (size!10829 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10828 _keys!658) (size!10829 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377337 () Bool)

(declare-fun res!213467 () Bool)

(assert (=> b!377337 (=> (not res!213467) (not e!229741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377337 (= res!213467 (validKeyInArray!0 k!778))))

(declare-fun b!377338 () Bool)

(declare-fun e!229735 () Bool)

(declare-fun tp_is_empty!9043 () Bool)

(assert (=> b!377338 (= e!229735 tp_is_empty!9043)))

(declare-fun mapIsEmpty!15129 () Bool)

(assert (=> mapIsEmpty!15129 mapRes!15129))

(declare-fun b!377339 () Bool)

(declare-fun e!229742 () Bool)

(assert (=> b!377339 (= e!229742 (and e!229735 mapRes!15129))))

(declare-fun condMapEmpty!15129 () Bool)

(declare-fun mapDefault!15129 () ValueCell!4178)

