; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37188 () Bool)

(assert start!37188)

(declare-fun b_free!8315 () Bool)

(declare-fun b_next!8315 () Bool)

(assert (=> start!37188 (= b_free!8315 (not b_next!8315))))

(declare-fun tp!29661 () Bool)

(declare-fun b_and!15557 () Bool)

(assert (=> start!37188 (= tp!29661 b_and!15557)))

(declare-fun b!375523 () Bool)

(declare-fun res!212021 () Bool)

(declare-fun e!228776 () Bool)

(assert (=> b!375523 (=> (not res!212021) (not e!228776))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375523 (= res!212021 (validKeyInArray!0 k!778))))

(declare-fun b!375524 () Bool)

(declare-fun res!212016 () Bool)

(assert (=> b!375524 (=> (not res!212016) (not e!228776))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13055 0))(
  ( (V!13056 (val!4526 Int)) )
))
(declare-datatypes ((ValueCell!4138 0))(
  ( (ValueCellFull!4138 (v!6723 V!13055)) (EmptyCell!4138) )
))
(declare-datatypes ((array!21861 0))(
  ( (array!21862 (arr!10399 (Array (_ BitVec 32) ValueCell!4138)) (size!10751 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21861)

(declare-datatypes ((array!21863 0))(
  ( (array!21864 (arr!10400 (Array (_ BitVec 32) (_ BitVec 64))) (size!10752 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21863)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375524 (= res!212016 (and (= (size!10751 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10752 _keys!658) (size!10751 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375525 () Bool)

(declare-fun e!228778 () Bool)

(declare-fun e!228775 () Bool)

(assert (=> b!375525 (= e!228778 (not e!228775))))

(declare-fun res!212012 () Bool)

(assert (=> b!375525 (=> res!212012 e!228775)))

(assert (=> b!375525 (= res!212012 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13055)

(declare-datatypes ((tuple2!6024 0))(
  ( (tuple2!6025 (_1!3023 (_ BitVec 64)) (_2!3023 V!13055)) )
))
(declare-datatypes ((List!5866 0))(
  ( (Nil!5863) (Cons!5862 (h!6718 tuple2!6024) (t!11016 List!5866)) )
))
(declare-datatypes ((ListLongMap!4937 0))(
  ( (ListLongMap!4938 (toList!2484 List!5866)) )
))
(declare-fun lt!173850 () ListLongMap!4937)

(declare-fun minValue!472 () V!13055)

(declare-fun getCurrentListMap!1919 (array!21863 array!21861 (_ BitVec 32) (_ BitVec 32) V!13055 V!13055 (_ BitVec 32) Int) ListLongMap!4937)

(assert (=> b!375525 (= lt!173850 (getCurrentListMap!1919 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173847 () array!21861)

(declare-fun lt!173838 () array!21863)

(declare-fun lt!173839 () ListLongMap!4937)

(assert (=> b!375525 (= lt!173839 (getCurrentListMap!1919 lt!173838 lt!173847 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173848 () ListLongMap!4937)

(declare-fun lt!173852 () ListLongMap!4937)

(assert (=> b!375525 (and (= lt!173848 lt!173852) (= lt!173852 lt!173848))))

(declare-fun lt!173840 () ListLongMap!4937)

(declare-fun lt!173846 () tuple2!6024)

(declare-fun +!830 (ListLongMap!4937 tuple2!6024) ListLongMap!4937)

(assert (=> b!375525 (= lt!173852 (+!830 lt!173840 lt!173846))))

(declare-fun v!373 () V!13055)

(assert (=> b!375525 (= lt!173846 (tuple2!6025 k!778 v!373))))

(declare-datatypes ((Unit!11566 0))(
  ( (Unit!11567) )
))
(declare-fun lt!173841 () Unit!11566)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!77 (array!21863 array!21861 (_ BitVec 32) (_ BitVec 32) V!13055 V!13055 (_ BitVec 32) (_ BitVec 64) V!13055 (_ BitVec 32) Int) Unit!11566)

(assert (=> b!375525 (= lt!173841 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!77 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!753 (array!21863 array!21861 (_ BitVec 32) (_ BitVec 32) V!13055 V!13055 (_ BitVec 32) Int) ListLongMap!4937)

(assert (=> b!375525 (= lt!173848 (getCurrentListMapNoExtraKeys!753 lt!173838 lt!173847 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375525 (= lt!173847 (array!21862 (store (arr!10399 _values!506) i!548 (ValueCellFull!4138 v!373)) (size!10751 _values!506)))))

(assert (=> b!375525 (= lt!173840 (getCurrentListMapNoExtraKeys!753 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375526 () Bool)

(declare-fun res!212013 () Bool)

(assert (=> b!375526 (=> (not res!212013) (not e!228776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21863 (_ BitVec 32)) Bool)

(assert (=> b!375526 (= res!212013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375527 () Bool)

(declare-fun res!212017 () Bool)

(assert (=> b!375527 (=> (not res!212017) (not e!228778))))

(declare-datatypes ((List!5867 0))(
  ( (Nil!5864) (Cons!5863 (h!6719 (_ BitVec 64)) (t!11017 List!5867)) )
))
(declare-fun arrayNoDuplicates!0 (array!21863 (_ BitVec 32) List!5867) Bool)

(assert (=> b!375527 (= res!212017 (arrayNoDuplicates!0 lt!173838 #b00000000000000000000000000000000 Nil!5864))))

(declare-fun b!375528 () Bool)

(declare-fun e!228781 () Bool)

(declare-fun tp_is_empty!8963 () Bool)

(assert (=> b!375528 (= e!228781 tp_is_empty!8963)))

(declare-fun b!375529 () Bool)

(assert (=> b!375529 (= e!228776 e!228778)))

(declare-fun res!212014 () Bool)

(assert (=> b!375529 (=> (not res!212014) (not e!228778))))

(assert (=> b!375529 (= res!212014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173838 mask!970))))

(assert (=> b!375529 (= lt!173838 (array!21864 (store (arr!10400 _keys!658) i!548 k!778) (size!10752 _keys!658)))))

(declare-fun b!375530 () Bool)

(declare-fun e!228779 () Bool)

(assert (=> b!375530 (= e!228775 e!228779)))

(declare-fun res!212018 () Bool)

(assert (=> b!375530 (=> res!212018 e!228779)))

(assert (=> b!375530 (= res!212018 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173837 () ListLongMap!4937)

(declare-fun lt!173844 () ListLongMap!4937)

(assert (=> b!375530 (= lt!173837 lt!173844)))

(declare-fun lt!173845 () ListLongMap!4937)

(assert (=> b!375530 (= lt!173844 (+!830 lt!173845 lt!173846))))

(declare-fun lt!173853 () Unit!11566)

(declare-fun addCommutativeForDiffKeys!249 (ListLongMap!4937 (_ BitVec 64) V!13055 (_ BitVec 64) V!13055) Unit!11566)

(assert (=> b!375530 (= lt!173853 (addCommutativeForDiffKeys!249 lt!173840 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173842 () tuple2!6024)

(assert (=> b!375530 (= lt!173839 (+!830 lt!173837 lt!173842))))

(declare-fun lt!173851 () tuple2!6024)

(assert (=> b!375530 (= lt!173837 (+!830 lt!173852 lt!173851))))

(declare-fun lt!173849 () ListLongMap!4937)

(assert (=> b!375530 (= lt!173850 lt!173849)))

(assert (=> b!375530 (= lt!173849 (+!830 lt!173845 lt!173842))))

(assert (=> b!375530 (= lt!173845 (+!830 lt!173840 lt!173851))))

(assert (=> b!375530 (= lt!173839 (+!830 (+!830 lt!173848 lt!173851) lt!173842))))

(assert (=> b!375530 (= lt!173842 (tuple2!6025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375530 (= lt!173851 (tuple2!6025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375531 () Bool)

(declare-fun e!228782 () Bool)

(assert (=> b!375531 (= e!228782 tp_is_empty!8963)))

(declare-fun mapIsEmpty!15009 () Bool)

(declare-fun mapRes!15009 () Bool)

(assert (=> mapIsEmpty!15009 mapRes!15009))

(declare-fun b!375532 () Bool)

(declare-fun res!212020 () Bool)

(assert (=> b!375532 (=> (not res!212020) (not e!228776))))

(assert (=> b!375532 (= res!212020 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5864))))

(declare-fun b!375533 () Bool)

(declare-fun res!212019 () Bool)

(assert (=> b!375533 (=> (not res!212019) (not e!228776))))

(assert (=> b!375533 (= res!212019 (or (= (select (arr!10400 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10400 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375522 () Bool)

(assert (=> b!375522 (= e!228779 true)))

(assert (=> b!375522 (= (+!830 lt!173844 lt!173842) (+!830 lt!173849 lt!173846))))

(declare-fun lt!173843 () Unit!11566)

(assert (=> b!375522 (= lt!173843 (addCommutativeForDiffKeys!249 lt!173845 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!212015 () Bool)

(assert (=> start!37188 (=> (not res!212015) (not e!228776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37188 (= res!212015 (validMask!0 mask!970))))

(assert (=> start!37188 e!228776))

(declare-fun e!228780 () Bool)

(declare-fun array_inv!7668 (array!21861) Bool)

(assert (=> start!37188 (and (array_inv!7668 _values!506) e!228780)))

(assert (=> start!37188 tp!29661))

(assert (=> start!37188 true))

(assert (=> start!37188 tp_is_empty!8963))

(declare-fun array_inv!7669 (array!21863) Bool)

(assert (=> start!37188 (array_inv!7669 _keys!658)))

(declare-fun b!375534 () Bool)

(declare-fun res!212011 () Bool)

(assert (=> b!375534 (=> (not res!212011) (not e!228776))))

(declare-fun arrayContainsKey!0 (array!21863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375534 (= res!212011 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!375535 () Bool)

(declare-fun res!212010 () Bool)

(assert (=> b!375535 (=> (not res!212010) (not e!228776))))

(assert (=> b!375535 (= res!212010 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10752 _keys!658))))))

(declare-fun mapNonEmpty!15009 () Bool)

(declare-fun tp!29660 () Bool)

(assert (=> mapNonEmpty!15009 (= mapRes!15009 (and tp!29660 e!228782))))

(declare-fun mapValue!15009 () ValueCell!4138)

(declare-fun mapKey!15009 () (_ BitVec 32))

(declare-fun mapRest!15009 () (Array (_ BitVec 32) ValueCell!4138))

(assert (=> mapNonEmpty!15009 (= (arr!10399 _values!506) (store mapRest!15009 mapKey!15009 mapValue!15009))))

(declare-fun b!375536 () Bool)

(assert (=> b!375536 (= e!228780 (and e!228781 mapRes!15009))))

(declare-fun condMapEmpty!15009 () Bool)

(declare-fun mapDefault!15009 () ValueCell!4138)

