; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37200 () Bool)

(assert start!37200)

(declare-fun b_free!8341 () Bool)

(declare-fun b_next!8341 () Bool)

(assert (=> start!37200 (= b_free!8341 (not b_next!8341))))

(declare-fun tp!29738 () Bool)

(declare-fun b_and!15597 () Bool)

(assert (=> start!37200 (= tp!29738 b_and!15597)))

(declare-fun b!376067 () Bool)

(declare-fun res!212489 () Bool)

(declare-fun e!229055 () Bool)

(assert (=> b!376067 (=> (not res!212489) (not e!229055))))

(declare-datatypes ((array!21896 0))(
  ( (array!21897 (arr!10416 (Array (_ BitVec 32) (_ BitVec 64))) (size!10768 (_ BitVec 32))) )
))
(declare-fun lt!174375 () array!21896)

(declare-datatypes ((List!5792 0))(
  ( (Nil!5789) (Cons!5788 (h!6644 (_ BitVec 64)) (t!10934 List!5792)) )
))
(declare-fun arrayNoDuplicates!0 (array!21896 (_ BitVec 32) List!5792) Bool)

(assert (=> b!376067 (= res!212489 (arrayNoDuplicates!0 lt!174375 #b00000000000000000000000000000000 Nil!5789))))

(declare-fun b!376068 () Bool)

(declare-fun e!229058 () Bool)

(declare-fun tp_is_empty!8989 () Bool)

(assert (=> b!376068 (= e!229058 tp_is_empty!8989)))

(declare-fun b!376069 () Bool)

(declare-fun res!212488 () Bool)

(declare-fun e!229060 () Bool)

(assert (=> b!376069 (=> (not res!212488) (not e!229060))))

(declare-fun _keys!658 () array!21896)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21896 (_ BitVec 32)) Bool)

(assert (=> b!376069 (= res!212488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376070 () Bool)

(declare-fun e!229057 () Bool)

(assert (=> b!376070 (= e!229055 (not e!229057))))

(declare-fun res!212484 () Bool)

(assert (=> b!376070 (=> res!212484 e!229057)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376070 (= res!212484 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13091 0))(
  ( (V!13092 (val!4539 Int)) )
))
(declare-datatypes ((ValueCell!4151 0))(
  ( (ValueCellFull!4151 (v!6737 V!13091)) (EmptyCell!4151) )
))
(declare-datatypes ((array!21898 0))(
  ( (array!21899 (arr!10417 (Array (_ BitVec 32) ValueCell!4151)) (size!10769 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21898)

(declare-datatypes ((tuple2!5950 0))(
  ( (tuple2!5951 (_1!2986 (_ BitVec 64)) (_2!2986 V!13091)) )
))
(declare-datatypes ((List!5793 0))(
  ( (Nil!5790) (Cons!5789 (h!6645 tuple2!5950) (t!10935 List!5793)) )
))
(declare-datatypes ((ListLongMap!4865 0))(
  ( (ListLongMap!4866 (toList!2448 List!5793)) )
))
(declare-fun lt!174373 () ListLongMap!4865)

(declare-fun zeroValue!472 () V!13091)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13091)

(declare-fun getCurrentListMap!1900 (array!21896 array!21898 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!376070 (= lt!174373 (getCurrentListMap!1900 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174374 () ListLongMap!4865)

(declare-fun lt!174367 () array!21898)

(assert (=> b!376070 (= lt!174374 (getCurrentListMap!1900 lt!174375 lt!174367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174377 () ListLongMap!4865)

(declare-fun lt!174371 () ListLongMap!4865)

(assert (=> b!376070 (and (= lt!174377 lt!174371) (= lt!174371 lt!174377))))

(declare-fun lt!174370 () ListLongMap!4865)

(declare-fun lt!174379 () tuple2!5950)

(declare-fun +!844 (ListLongMap!4865 tuple2!5950) ListLongMap!4865)

(assert (=> b!376070 (= lt!174371 (+!844 lt!174370 lt!174379))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13091)

(assert (=> b!376070 (= lt!174379 (tuple2!5951 k0!778 v!373))))

(declare-datatypes ((Unit!11575 0))(
  ( (Unit!11576) )
))
(declare-fun lt!174369 () Unit!11575)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!87 (array!21896 array!21898 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) (_ BitVec 64) V!13091 (_ BitVec 32) Int) Unit!11575)

(assert (=> b!376070 (= lt!174369 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!87 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!747 (array!21896 array!21898 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!376070 (= lt!174377 (getCurrentListMapNoExtraKeys!747 lt!174375 lt!174367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376070 (= lt!174367 (array!21899 (store (arr!10417 _values!506) i!548 (ValueCellFull!4151 v!373)) (size!10769 _values!506)))))

(assert (=> b!376070 (= lt!174370 (getCurrentListMapNoExtraKeys!747 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376071 () Bool)

(assert (=> b!376071 (= e!229060 e!229055)))

(declare-fun res!212495 () Bool)

(assert (=> b!376071 (=> (not res!212495) (not e!229055))))

(assert (=> b!376071 (= res!212495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174375 mask!970))))

(assert (=> b!376071 (= lt!174375 (array!21897 (store (arr!10416 _keys!658) i!548 k0!778) (size!10768 _keys!658)))))

(declare-fun b!376072 () Bool)

(declare-fun res!212485 () Bool)

(assert (=> b!376072 (=> (not res!212485) (not e!229060))))

(declare-fun arrayContainsKey!0 (array!21896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376072 (= res!212485 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376073 () Bool)

(declare-fun res!212493 () Bool)

(assert (=> b!376073 (=> (not res!212493) (not e!229060))))

(assert (=> b!376073 (= res!212493 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10768 _keys!658))))))

(declare-fun mapIsEmpty!15048 () Bool)

(declare-fun mapRes!15048 () Bool)

(assert (=> mapIsEmpty!15048 mapRes!15048))

(declare-fun b!376074 () Bool)

(declare-fun res!212492 () Bool)

(assert (=> b!376074 (=> (not res!212492) (not e!229060))))

(assert (=> b!376074 (= res!212492 (or (= (select (arr!10416 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10416 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15048 () Bool)

(declare-fun tp!29739 () Bool)

(assert (=> mapNonEmpty!15048 (= mapRes!15048 (and tp!29739 e!229058))))

(declare-fun mapValue!15048 () ValueCell!4151)

(declare-fun mapRest!15048 () (Array (_ BitVec 32) ValueCell!4151))

(declare-fun mapKey!15048 () (_ BitVec 32))

(assert (=> mapNonEmpty!15048 (= (arr!10417 _values!506) (store mapRest!15048 mapKey!15048 mapValue!15048))))

(declare-fun b!376075 () Bool)

(declare-fun e!229061 () Bool)

(assert (=> b!376075 (= e!229061 true)))

(declare-fun lt!174372 () ListLongMap!4865)

(declare-fun lt!174378 () ListLongMap!4865)

(assert (=> b!376075 (= lt!174372 (+!844 lt!174378 lt!174379))))

(declare-fun lt!174368 () Unit!11575)

(declare-fun addCommutativeForDiffKeys!266 (ListLongMap!4865 (_ BitVec 64) V!13091 (_ BitVec 64) V!13091) Unit!11575)

(assert (=> b!376075 (= lt!174368 (addCommutativeForDiffKeys!266 lt!174370 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376076 () Bool)

(declare-fun res!212486 () Bool)

(assert (=> b!376076 (=> (not res!212486) (not e!229060))))

(assert (=> b!376076 (= res!212486 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5789))))

(declare-fun b!376077 () Bool)

(declare-fun e!229062 () Bool)

(assert (=> b!376077 (= e!229062 tp_is_empty!8989)))

(declare-fun b!376078 () Bool)

(assert (=> b!376078 (= e!229057 e!229061)))

(declare-fun res!212487 () Bool)

(assert (=> b!376078 (=> res!212487 e!229061)))

(assert (=> b!376078 (= res!212487 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376078 (= lt!174374 lt!174372)))

(declare-fun lt!174376 () tuple2!5950)

(assert (=> b!376078 (= lt!174372 (+!844 lt!174371 lt!174376))))

(assert (=> b!376078 (= lt!174373 lt!174378)))

(assert (=> b!376078 (= lt!174378 (+!844 lt!174370 lt!174376))))

(assert (=> b!376078 (= lt!174374 (+!844 lt!174377 lt!174376))))

(assert (=> b!376078 (= lt!174376 (tuple2!5951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376079 () Bool)

(declare-fun res!212494 () Bool)

(assert (=> b!376079 (=> (not res!212494) (not e!229060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376079 (= res!212494 (validKeyInArray!0 k0!778))))

(declare-fun b!376081 () Bool)

(declare-fun e!229056 () Bool)

(assert (=> b!376081 (= e!229056 (and e!229062 mapRes!15048))))

(declare-fun condMapEmpty!15048 () Bool)

(declare-fun mapDefault!15048 () ValueCell!4151)

(assert (=> b!376081 (= condMapEmpty!15048 (= (arr!10417 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4151)) mapDefault!15048)))))

(declare-fun res!212490 () Bool)

(assert (=> start!37200 (=> (not res!212490) (not e!229060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37200 (= res!212490 (validMask!0 mask!970))))

(assert (=> start!37200 e!229060))

(declare-fun array_inv!7730 (array!21898) Bool)

(assert (=> start!37200 (and (array_inv!7730 _values!506) e!229056)))

(assert (=> start!37200 tp!29738))

(assert (=> start!37200 true))

(assert (=> start!37200 tp_is_empty!8989))

(declare-fun array_inv!7731 (array!21896) Bool)

(assert (=> start!37200 (array_inv!7731 _keys!658)))

(declare-fun b!376080 () Bool)

(declare-fun res!212491 () Bool)

(assert (=> b!376080 (=> (not res!212491) (not e!229060))))

(assert (=> b!376080 (= res!212491 (and (= (size!10769 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10768 _keys!658) (size!10769 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37200 res!212490) b!376080))

(assert (= (and b!376080 res!212491) b!376069))

(assert (= (and b!376069 res!212488) b!376076))

(assert (= (and b!376076 res!212486) b!376073))

(assert (= (and b!376073 res!212493) b!376079))

(assert (= (and b!376079 res!212494) b!376074))

(assert (= (and b!376074 res!212492) b!376072))

(assert (= (and b!376072 res!212485) b!376071))

(assert (= (and b!376071 res!212495) b!376067))

(assert (= (and b!376067 res!212489) b!376070))

(assert (= (and b!376070 (not res!212484)) b!376078))

(assert (= (and b!376078 (not res!212487)) b!376075))

(assert (= (and b!376081 condMapEmpty!15048) mapIsEmpty!15048))

(assert (= (and b!376081 (not condMapEmpty!15048)) mapNonEmpty!15048))

(get-info :version)

(assert (= (and mapNonEmpty!15048 ((_ is ValueCellFull!4151) mapValue!15048)) b!376068))

(assert (= (and b!376081 ((_ is ValueCellFull!4151) mapDefault!15048)) b!376077))

(assert (= start!37200 b!376081))

(declare-fun m!373025 () Bool)

(assert (=> b!376076 m!373025))

(declare-fun m!373027 () Bool)

(assert (=> start!37200 m!373027))

(declare-fun m!373029 () Bool)

(assert (=> start!37200 m!373029))

(declare-fun m!373031 () Bool)

(assert (=> start!37200 m!373031))

(declare-fun m!373033 () Bool)

(assert (=> b!376071 m!373033))

(declare-fun m!373035 () Bool)

(assert (=> b!376071 m!373035))

(declare-fun m!373037 () Bool)

(assert (=> b!376069 m!373037))

(declare-fun m!373039 () Bool)

(assert (=> b!376078 m!373039))

(declare-fun m!373041 () Bool)

(assert (=> b!376078 m!373041))

(declare-fun m!373043 () Bool)

(assert (=> b!376078 m!373043))

(declare-fun m!373045 () Bool)

(assert (=> b!376070 m!373045))

(declare-fun m!373047 () Bool)

(assert (=> b!376070 m!373047))

(declare-fun m!373049 () Bool)

(assert (=> b!376070 m!373049))

(declare-fun m!373051 () Bool)

(assert (=> b!376070 m!373051))

(declare-fun m!373053 () Bool)

(assert (=> b!376070 m!373053))

(declare-fun m!373055 () Bool)

(assert (=> b!376070 m!373055))

(declare-fun m!373057 () Bool)

(assert (=> b!376070 m!373057))

(declare-fun m!373059 () Bool)

(assert (=> b!376074 m!373059))

(declare-fun m!373061 () Bool)

(assert (=> b!376067 m!373061))

(declare-fun m!373063 () Bool)

(assert (=> b!376072 m!373063))

(declare-fun m!373065 () Bool)

(assert (=> mapNonEmpty!15048 m!373065))

(declare-fun m!373067 () Bool)

(assert (=> b!376079 m!373067))

(declare-fun m!373069 () Bool)

(assert (=> b!376075 m!373069))

(declare-fun m!373071 () Bool)

(assert (=> b!376075 m!373071))

(check-sat (not b!376070) (not mapNonEmpty!15048) (not b!376067) (not b!376069) (not start!37200) (not b!376075) (not b!376076) (not b!376071) (not b!376078) (not b!376072) (not b!376079) (not b_next!8341) tp_is_empty!8989 b_and!15597)
(check-sat b_and!15597 (not b_next!8341))
