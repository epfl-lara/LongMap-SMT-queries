; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37286 () Bool)

(assert start!37286)

(declare-fun b_free!8413 () Bool)

(declare-fun b_next!8413 () Bool)

(assert (=> start!37286 (= b_free!8413 (not b_next!8413))))

(declare-fun tp!29955 () Bool)

(declare-fun b_and!15655 () Bool)

(assert (=> start!37286 (= tp!29955 b_and!15655)))

(declare-fun res!213794 () Bool)

(declare-fun e!229954 () Bool)

(assert (=> start!37286 (=> (not res!213794) (not e!229954))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37286 (= res!213794 (validMask!0 mask!970))))

(assert (=> start!37286 e!229954))

(declare-datatypes ((V!13187 0))(
  ( (V!13188 (val!4575 Int)) )
))
(declare-datatypes ((ValueCell!4187 0))(
  ( (ValueCellFull!4187 (v!6772 V!13187)) (EmptyCell!4187) )
))
(declare-datatypes ((array!22049 0))(
  ( (array!22050 (arr!10493 (Array (_ BitVec 32) ValueCell!4187)) (size!10845 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22049)

(declare-fun e!229957 () Bool)

(declare-fun array_inv!7730 (array!22049) Bool)

(assert (=> start!37286 (and (array_inv!7730 _values!506) e!229957)))

(assert (=> start!37286 tp!29955))

(assert (=> start!37286 true))

(declare-fun tp_is_empty!9061 () Bool)

(assert (=> start!37286 tp_is_empty!9061))

(declare-datatypes ((array!22051 0))(
  ( (array!22052 (arr!10494 (Array (_ BitVec 32) (_ BitVec 64))) (size!10846 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22051)

(declare-fun array_inv!7731 (array!22051) Bool)

(assert (=> start!37286 (array_inv!7731 _keys!658)))

(declare-fun b!377736 () Bool)

(declare-fun res!213788 () Bool)

(assert (=> b!377736 (=> (not res!213788) (not e!229954))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377736 (= res!213788 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377737 () Bool)

(declare-fun e!229956 () Bool)

(assert (=> b!377737 (= e!229956 tp_is_empty!9061)))

(declare-fun b!377738 () Bool)

(declare-fun res!213783 () Bool)

(assert (=> b!377738 (=> (not res!213783) (not e!229954))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377738 (= res!213783 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10846 _keys!658))))))

(declare-fun b!377739 () Bool)

(declare-fun res!213792 () Bool)

(declare-fun e!229952 () Bool)

(assert (=> b!377739 (=> (not res!213792) (not e!229952))))

(declare-fun lt!175760 () array!22051)

(declare-datatypes ((List!5941 0))(
  ( (Nil!5938) (Cons!5937 (h!6793 (_ BitVec 64)) (t!11091 List!5941)) )
))
(declare-fun arrayNoDuplicates!0 (array!22051 (_ BitVec 32) List!5941) Bool)

(assert (=> b!377739 (= res!213792 (arrayNoDuplicates!0 lt!175760 #b00000000000000000000000000000000 Nil!5938))))

(declare-fun b!377740 () Bool)

(declare-fun e!229958 () Bool)

(assert (=> b!377740 (= e!229958 true)))

(declare-datatypes ((tuple2!6102 0))(
  ( (tuple2!6103 (_1!3062 (_ BitVec 64)) (_2!3062 V!13187)) )
))
(declare-datatypes ((List!5942 0))(
  ( (Nil!5939) (Cons!5938 (h!6794 tuple2!6102) (t!11092 List!5942)) )
))
(declare-datatypes ((ListLongMap!5015 0))(
  ( (ListLongMap!5016 (toList!2523 List!5942)) )
))
(declare-fun lt!175761 () ListLongMap!5015)

(declare-fun lt!175752 () ListLongMap!5015)

(declare-fun lt!175762 () tuple2!6102)

(declare-fun +!869 (ListLongMap!5015 tuple2!6102) ListLongMap!5015)

(assert (=> b!377740 (= lt!175761 (+!869 lt!175752 lt!175762))))

(declare-fun v!373 () V!13187)

(declare-fun lt!175758 () ListLongMap!5015)

(declare-datatypes ((Unit!11640 0))(
  ( (Unit!11641) )
))
(declare-fun lt!175763 () Unit!11640)

(declare-fun zeroValue!472 () V!13187)

(declare-fun addCommutativeForDiffKeys!277 (ListLongMap!5015 (_ BitVec 64) V!13187 (_ BitVec 64) V!13187) Unit!11640)

(assert (=> b!377740 (= lt!175763 (addCommutativeForDiffKeys!277 lt!175758 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377741 () Bool)

(declare-fun e!229951 () Bool)

(assert (=> b!377741 (= e!229951 tp_is_empty!9061)))

(declare-fun b!377742 () Bool)

(declare-fun e!229953 () Bool)

(assert (=> b!377742 (= e!229952 (not e!229953))))

(declare-fun res!213790 () Bool)

(assert (=> b!377742 (=> res!213790 e!229953)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377742 (= res!213790 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!175755 () ListLongMap!5015)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13187)

(declare-fun getCurrentListMap!1952 (array!22051 array!22049 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!5015)

(assert (=> b!377742 (= lt!175755 (getCurrentListMap!1952 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175754 () ListLongMap!5015)

(declare-fun lt!175753 () array!22049)

(assert (=> b!377742 (= lt!175754 (getCurrentListMap!1952 lt!175760 lt!175753 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175756 () ListLongMap!5015)

(declare-fun lt!175764 () ListLongMap!5015)

(assert (=> b!377742 (and (= lt!175756 lt!175764) (= lt!175764 lt!175756))))

(assert (=> b!377742 (= lt!175764 (+!869 lt!175758 lt!175762))))

(assert (=> b!377742 (= lt!175762 (tuple2!6103 k!778 v!373))))

(declare-fun lt!175759 () Unit!11640)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!110 (array!22051 array!22049 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) (_ BitVec 64) V!13187 (_ BitVec 32) Int) Unit!11640)

(assert (=> b!377742 (= lt!175759 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!110 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!786 (array!22051 array!22049 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!5015)

(assert (=> b!377742 (= lt!175756 (getCurrentListMapNoExtraKeys!786 lt!175760 lt!175753 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377742 (= lt!175753 (array!22050 (store (arr!10493 _values!506) i!548 (ValueCellFull!4187 v!373)) (size!10845 _values!506)))))

(assert (=> b!377742 (= lt!175758 (getCurrentListMapNoExtraKeys!786 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15156 () Bool)

(declare-fun mapRes!15156 () Bool)

(assert (=> mapIsEmpty!15156 mapRes!15156))

(declare-fun b!377743 () Bool)

(declare-fun res!213793 () Bool)

(assert (=> b!377743 (=> (not res!213793) (not e!229954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22051 (_ BitVec 32)) Bool)

(assert (=> b!377743 (= res!213793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377744 () Bool)

(assert (=> b!377744 (= e!229953 e!229958)))

(declare-fun res!213785 () Bool)

(assert (=> b!377744 (=> res!213785 e!229958)))

(assert (=> b!377744 (= res!213785 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377744 (= lt!175754 lt!175761)))

(declare-fun lt!175757 () tuple2!6102)

(assert (=> b!377744 (= lt!175761 (+!869 lt!175764 lt!175757))))

(assert (=> b!377744 (= lt!175755 lt!175752)))

(assert (=> b!377744 (= lt!175752 (+!869 lt!175758 lt!175757))))

(assert (=> b!377744 (= lt!175754 (+!869 lt!175756 lt!175757))))

(assert (=> b!377744 (= lt!175757 (tuple2!6103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377745 () Bool)

(declare-fun res!213784 () Bool)

(assert (=> b!377745 (=> (not res!213784) (not e!229954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377745 (= res!213784 (validKeyInArray!0 k!778))))

(declare-fun b!377746 () Bool)

(declare-fun res!213787 () Bool)

(assert (=> b!377746 (=> (not res!213787) (not e!229954))))

(assert (=> b!377746 (= res!213787 (or (= (select (arr!10494 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10494 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377747 () Bool)

(assert (=> b!377747 (= e!229954 e!229952)))

(declare-fun res!213786 () Bool)

(assert (=> b!377747 (=> (not res!213786) (not e!229952))))

(assert (=> b!377747 (= res!213786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175760 mask!970))))

(assert (=> b!377747 (= lt!175760 (array!22052 (store (arr!10494 _keys!658) i!548 k!778) (size!10846 _keys!658)))))

(declare-fun b!377748 () Bool)

(declare-fun res!213789 () Bool)

(assert (=> b!377748 (=> (not res!213789) (not e!229954))))

(assert (=> b!377748 (= res!213789 (and (= (size!10845 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10846 _keys!658) (size!10845 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377749 () Bool)

(declare-fun res!213791 () Bool)

(assert (=> b!377749 (=> (not res!213791) (not e!229954))))

(assert (=> b!377749 (= res!213791 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5938))))

(declare-fun mapNonEmpty!15156 () Bool)

(declare-fun tp!29954 () Bool)

(assert (=> mapNonEmpty!15156 (= mapRes!15156 (and tp!29954 e!229956))))

(declare-fun mapRest!15156 () (Array (_ BitVec 32) ValueCell!4187))

(declare-fun mapKey!15156 () (_ BitVec 32))

(declare-fun mapValue!15156 () ValueCell!4187)

(assert (=> mapNonEmpty!15156 (= (arr!10493 _values!506) (store mapRest!15156 mapKey!15156 mapValue!15156))))

(declare-fun b!377750 () Bool)

(assert (=> b!377750 (= e!229957 (and e!229951 mapRes!15156))))

(declare-fun condMapEmpty!15156 () Bool)

(declare-fun mapDefault!15156 () ValueCell!4187)

