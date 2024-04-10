; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38142 () Bool)

(assert start!38142)

(declare-fun b_free!9023 () Bool)

(declare-fun b_next!9023 () Bool)

(assert (=> start!38142 (= b_free!9023 (not b_next!9023))))

(declare-fun tp!31851 () Bool)

(declare-fun b_and!16385 () Bool)

(assert (=> start!38142 (= tp!31851 b_and!16385)))

(declare-fun b!393029 () Bool)

(declare-fun e!237993 () Bool)

(declare-fun e!237991 () Bool)

(assert (=> b!393029 (= e!237993 (not e!237991))))

(declare-fun res!225114 () Bool)

(assert (=> b!393029 (=> res!225114 e!237991)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393029 (= res!225114 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14031 0))(
  ( (V!14032 (val!4892 Int)) )
))
(declare-datatypes ((ValueCell!4504 0))(
  ( (ValueCellFull!4504 (v!7129 V!14031)) (EmptyCell!4504) )
))
(declare-datatypes ((array!23299 0))(
  ( (array!23300 (arr!11108 (Array (_ BitVec 32) ValueCell!4504)) (size!11460 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23299)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14031)

(declare-datatypes ((tuple2!6600 0))(
  ( (tuple2!6601 (_1!3311 (_ BitVec 64)) (_2!3311 V!14031)) )
))
(declare-datatypes ((List!6453 0))(
  ( (Nil!6450) (Cons!6449 (h!7305 tuple2!6600) (t!11623 List!6453)) )
))
(declare-datatypes ((ListLongMap!5513 0))(
  ( (ListLongMap!5514 (toList!2772 List!6453)) )
))
(declare-fun lt!185869 () ListLongMap!5513)

(declare-datatypes ((array!23301 0))(
  ( (array!23302 (arr!11109 (Array (_ BitVec 32) (_ BitVec 64))) (size!11461 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23301)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14031)

(declare-fun getCurrentListMap!2114 (array!23301 array!23299 (_ BitVec 32) (_ BitVec 32) V!14031 V!14031 (_ BitVec 32) Int) ListLongMap!5513)

(assert (=> b!393029 (= lt!185869 (getCurrentListMap!2114 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185870 () ListLongMap!5513)

(declare-fun lt!185874 () array!23301)

(declare-fun lt!185880 () array!23299)

(assert (=> b!393029 (= lt!185870 (getCurrentListMap!2114 lt!185874 lt!185880 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185878 () ListLongMap!5513)

(declare-fun lt!185877 () ListLongMap!5513)

(assert (=> b!393029 (and (= lt!185878 lt!185877) (= lt!185877 lt!185878))))

(declare-fun lt!185875 () ListLongMap!5513)

(declare-fun lt!185871 () tuple2!6600)

(declare-fun +!1067 (ListLongMap!5513 tuple2!6600) ListLongMap!5513)

(assert (=> b!393029 (= lt!185877 (+!1067 lt!185875 lt!185871))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!14031)

(assert (=> b!393029 (= lt!185871 (tuple2!6601 k!778 v!373))))

(declare-datatypes ((Unit!12022 0))(
  ( (Unit!12023) )
))
(declare-fun lt!185879 () Unit!12022)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!278 (array!23301 array!23299 (_ BitVec 32) (_ BitVec 32) V!14031 V!14031 (_ BitVec 32) (_ BitVec 64) V!14031 (_ BitVec 32) Int) Unit!12022)

(assert (=> b!393029 (= lt!185879 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!278 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!994 (array!23301 array!23299 (_ BitVec 32) (_ BitVec 32) V!14031 V!14031 (_ BitVec 32) Int) ListLongMap!5513)

(assert (=> b!393029 (= lt!185878 (getCurrentListMapNoExtraKeys!994 lt!185874 lt!185880 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393029 (= lt!185880 (array!23300 (store (arr!11108 _values!506) i!548 (ValueCellFull!4504 v!373)) (size!11460 _values!506)))))

(assert (=> b!393029 (= lt!185875 (getCurrentListMapNoExtraKeys!994 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393030 () Bool)

(declare-fun res!225110 () Bool)

(declare-fun e!237994 () Bool)

(assert (=> b!393030 (=> (not res!225110) (not e!237994))))

(assert (=> b!393030 (= res!225110 (or (= (select (arr!11109 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11109 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393031 () Bool)

(declare-fun res!225112 () Bool)

(assert (=> b!393031 (=> (not res!225112) (not e!237994))))

(declare-datatypes ((List!6454 0))(
  ( (Nil!6451) (Cons!6450 (h!7306 (_ BitVec 64)) (t!11624 List!6454)) )
))
(declare-fun arrayNoDuplicates!0 (array!23301 (_ BitVec 32) List!6454) Bool)

(assert (=> b!393031 (= res!225112 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6451))))

(declare-fun b!393032 () Bool)

(declare-fun e!237995 () Bool)

(assert (=> b!393032 (= e!237991 e!237995)))

(declare-fun res!225103 () Bool)

(assert (=> b!393032 (=> res!225103 e!237995)))

(assert (=> b!393032 (= res!225103 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!185872 () ListLongMap!5513)

(assert (=> b!393032 (= lt!185869 lt!185872)))

(declare-fun lt!185873 () tuple2!6600)

(assert (=> b!393032 (= lt!185872 (+!1067 lt!185875 lt!185873))))

(declare-fun lt!185881 () ListLongMap!5513)

(assert (=> b!393032 (= lt!185870 lt!185881)))

(assert (=> b!393032 (= lt!185881 (+!1067 lt!185877 lt!185873))))

(assert (=> b!393032 (= lt!185870 (+!1067 lt!185878 lt!185873))))

(assert (=> b!393032 (= lt!185873 (tuple2!6601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393033 () Bool)

(declare-fun res!225105 () Bool)

(assert (=> b!393033 (=> (not res!225105) (not e!237994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393033 (= res!225105 (validKeyInArray!0 k!778))))

(declare-fun res!225113 () Bool)

(assert (=> start!38142 (=> (not res!225113) (not e!237994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38142 (= res!225113 (validMask!0 mask!970))))

(assert (=> start!38142 e!237994))

(declare-fun e!237996 () Bool)

(declare-fun array_inv!8160 (array!23299) Bool)

(assert (=> start!38142 (and (array_inv!8160 _values!506) e!237996)))

(assert (=> start!38142 tp!31851))

(assert (=> start!38142 true))

(declare-fun tp_is_empty!9695 () Bool)

(assert (=> start!38142 tp_is_empty!9695))

(declare-fun array_inv!8161 (array!23301) Bool)

(assert (=> start!38142 (array_inv!8161 _keys!658)))

(declare-fun b!393034 () Bool)

(declare-fun res!225108 () Bool)

(assert (=> b!393034 (=> (not res!225108) (not e!237994))))

(assert (=> b!393034 (= res!225108 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11461 _keys!658))))))

(declare-fun mapIsEmpty!16137 () Bool)

(declare-fun mapRes!16137 () Bool)

(assert (=> mapIsEmpty!16137 mapRes!16137))

(declare-fun b!393035 () Bool)

(assert (=> b!393035 (= e!237995 true)))

(assert (=> b!393035 (= lt!185881 (+!1067 lt!185872 lt!185871))))

(declare-fun lt!185876 () Unit!12022)

(declare-fun addCommutativeForDiffKeys!345 (ListLongMap!5513 (_ BitVec 64) V!14031 (_ BitVec 64) V!14031) Unit!12022)

(assert (=> b!393035 (= lt!185876 (addCommutativeForDiffKeys!345 lt!185875 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393036 () Bool)

(declare-fun res!225109 () Bool)

(assert (=> b!393036 (=> (not res!225109) (not e!237994))))

(assert (=> b!393036 (= res!225109 (and (= (size!11460 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11461 _keys!658) (size!11460 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393037 () Bool)

(declare-fun res!225106 () Bool)

(assert (=> b!393037 (=> (not res!225106) (not e!237994))))

(declare-fun arrayContainsKey!0 (array!23301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393037 (= res!225106 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393038 () Bool)

(declare-fun res!225111 () Bool)

(assert (=> b!393038 (=> (not res!225111) (not e!237993))))

(assert (=> b!393038 (= res!225111 (arrayNoDuplicates!0 lt!185874 #b00000000000000000000000000000000 Nil!6451))))

(declare-fun b!393039 () Bool)

(declare-fun e!237992 () Bool)

(assert (=> b!393039 (= e!237992 tp_is_empty!9695)))

(declare-fun b!393040 () Bool)

(declare-fun e!237990 () Bool)

(assert (=> b!393040 (= e!237990 tp_is_empty!9695)))

(declare-fun mapNonEmpty!16137 () Bool)

(declare-fun tp!31850 () Bool)

(assert (=> mapNonEmpty!16137 (= mapRes!16137 (and tp!31850 e!237990))))

(declare-fun mapRest!16137 () (Array (_ BitVec 32) ValueCell!4504))

(declare-fun mapKey!16137 () (_ BitVec 32))

(declare-fun mapValue!16137 () ValueCell!4504)

(assert (=> mapNonEmpty!16137 (= (arr!11108 _values!506) (store mapRest!16137 mapKey!16137 mapValue!16137))))

(declare-fun b!393041 () Bool)

(assert (=> b!393041 (= e!237994 e!237993)))

(declare-fun res!225104 () Bool)

(assert (=> b!393041 (=> (not res!225104) (not e!237993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23301 (_ BitVec 32)) Bool)

(assert (=> b!393041 (= res!225104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185874 mask!970))))

(assert (=> b!393041 (= lt!185874 (array!23302 (store (arr!11109 _keys!658) i!548 k!778) (size!11461 _keys!658)))))

(declare-fun b!393042 () Bool)

(assert (=> b!393042 (= e!237996 (and e!237992 mapRes!16137))))

(declare-fun condMapEmpty!16137 () Bool)

(declare-fun mapDefault!16137 () ValueCell!4504)

