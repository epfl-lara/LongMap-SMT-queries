; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37200 () Bool)

(assert start!37200)

(declare-fun b_free!8341 () Bool)

(declare-fun b_next!8341 () Bool)

(assert (=> start!37200 (= b_free!8341 (not b_next!8341))))

(declare-fun tp!29739 () Bool)

(declare-fun b_and!15557 () Bool)

(assert (=> start!37200 (= tp!29739 b_and!15557)))

(declare-fun b!375845 () Bool)

(declare-fun e!228915 () Bool)

(declare-fun e!228920 () Bool)

(assert (=> b!375845 (= e!228915 e!228920)))

(declare-fun res!212365 () Bool)

(assert (=> b!375845 (=> (not res!212365) (not e!228920))))

(declare-datatypes ((array!21893 0))(
  ( (array!21894 (arr!10415 (Array (_ BitVec 32) (_ BitVec 64))) (size!10768 (_ BitVec 32))) )
))
(declare-fun lt!174121 () array!21893)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21893 (_ BitVec 32)) Bool)

(assert (=> b!375845 (= res!212365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174121 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21893)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375845 (= lt!174121 (array!21894 (store (arr!10415 _keys!658) i!548 k0!778) (size!10768 _keys!658)))))

(declare-fun b!375846 () Bool)

(declare-fun e!228913 () Bool)

(assert (=> b!375846 (= e!228913 true)))

(declare-datatypes ((V!13091 0))(
  ( (V!13092 (val!4539 Int)) )
))
(declare-datatypes ((tuple2!6024 0))(
  ( (tuple2!6025 (_1!3023 (_ BitVec 64)) (_2!3023 V!13091)) )
))
(declare-datatypes ((List!5853 0))(
  ( (Nil!5850) (Cons!5849 (h!6705 tuple2!6024) (t!10994 List!5853)) )
))
(declare-datatypes ((ListLongMap!4927 0))(
  ( (ListLongMap!4928 (toList!2479 List!5853)) )
))
(declare-fun lt!174117 () ListLongMap!4927)

(declare-fun lt!174119 () ListLongMap!4927)

(declare-fun lt!174123 () tuple2!6024)

(declare-fun +!847 (ListLongMap!4927 tuple2!6024) ListLongMap!4927)

(assert (=> b!375846 (= lt!174117 (+!847 lt!174119 lt!174123))))

(declare-fun v!373 () V!13091)

(declare-datatypes ((Unit!11566 0))(
  ( (Unit!11567) )
))
(declare-fun lt!174125 () Unit!11566)

(declare-fun lt!174114 () ListLongMap!4927)

(declare-fun zeroValue!472 () V!13091)

(declare-fun addCommutativeForDiffKeys!258 (ListLongMap!4927 (_ BitVec 64) V!13091 (_ BitVec 64) V!13091) Unit!11566)

(assert (=> b!375846 (= lt!174125 (addCommutativeForDiffKeys!258 lt!174114 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375847 () Bool)

(declare-fun res!212367 () Bool)

(assert (=> b!375847 (=> (not res!212367) (not e!228915))))

(declare-fun arrayContainsKey!0 (array!21893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375847 (= res!212367 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375848 () Bool)

(declare-fun res!212363 () Bool)

(assert (=> b!375848 (=> (not res!212363) (not e!228915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375848 (= res!212363 (validKeyInArray!0 k0!778))))

(declare-fun b!375849 () Bool)

(declare-fun e!228917 () Bool)

(declare-fun tp_is_empty!8989 () Bool)

(assert (=> b!375849 (= e!228917 tp_is_empty!8989)))

(declare-fun b!375850 () Bool)

(declare-fun e!228916 () Bool)

(assert (=> b!375850 (= e!228916 e!228913)))

(declare-fun res!212366 () Bool)

(assert (=> b!375850 (=> res!212366 e!228913)))

(assert (=> b!375850 (= res!212366 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174120 () ListLongMap!4927)

(assert (=> b!375850 (= lt!174120 lt!174117)))

(declare-fun lt!174126 () ListLongMap!4927)

(declare-fun lt!174122 () tuple2!6024)

(assert (=> b!375850 (= lt!174117 (+!847 lt!174126 lt!174122))))

(declare-fun lt!174116 () ListLongMap!4927)

(assert (=> b!375850 (= lt!174116 lt!174119)))

(assert (=> b!375850 (= lt!174119 (+!847 lt!174114 lt!174122))))

(declare-fun lt!174115 () ListLongMap!4927)

(assert (=> b!375850 (= lt!174120 (+!847 lt!174115 lt!174122))))

(assert (=> b!375850 (= lt!174122 (tuple2!6025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375851 () Bool)

(declare-fun res!212369 () Bool)

(assert (=> b!375851 (=> (not res!212369) (not e!228915))))

(assert (=> b!375851 (= res!212369 (or (= (select (arr!10415 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10415 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15048 () Bool)

(declare-fun mapRes!15048 () Bool)

(declare-fun tp!29738 () Bool)

(assert (=> mapNonEmpty!15048 (= mapRes!15048 (and tp!29738 e!228917))))

(declare-fun mapKey!15048 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4151 0))(
  ( (ValueCellFull!4151 (v!6730 V!13091)) (EmptyCell!4151) )
))
(declare-datatypes ((array!21895 0))(
  ( (array!21896 (arr!10416 (Array (_ BitVec 32) ValueCell!4151)) (size!10769 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21895)

(declare-fun mapRest!15048 () (Array (_ BitVec 32) ValueCell!4151))

(declare-fun mapValue!15048 () ValueCell!4151)

(assert (=> mapNonEmpty!15048 (= (arr!10416 _values!506) (store mapRest!15048 mapKey!15048 mapValue!15048))))

(declare-fun b!375852 () Bool)

(declare-fun e!228918 () Bool)

(assert (=> b!375852 (= e!228918 tp_is_empty!8989)))

(declare-fun b!375853 () Bool)

(declare-fun res!212361 () Bool)

(assert (=> b!375853 (=> (not res!212361) (not e!228920))))

(declare-datatypes ((List!5854 0))(
  ( (Nil!5851) (Cons!5850 (h!6706 (_ BitVec 64)) (t!10995 List!5854)) )
))
(declare-fun arrayNoDuplicates!0 (array!21893 (_ BitVec 32) List!5854) Bool)

(assert (=> b!375853 (= res!212361 (arrayNoDuplicates!0 lt!174121 #b00000000000000000000000000000000 Nil!5851))))

(declare-fun res!212359 () Bool)

(assert (=> start!37200 (=> (not res!212359) (not e!228915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37200 (= res!212359 (validMask!0 mask!970))))

(assert (=> start!37200 e!228915))

(declare-fun e!228919 () Bool)

(declare-fun array_inv!7680 (array!21895) Bool)

(assert (=> start!37200 (and (array_inv!7680 _values!506) e!228919)))

(assert (=> start!37200 tp!29739))

(assert (=> start!37200 true))

(assert (=> start!37200 tp_is_empty!8989))

(declare-fun array_inv!7681 (array!21893) Bool)

(assert (=> start!37200 (array_inv!7681 _keys!658)))

(declare-fun b!375854 () Bool)

(declare-fun res!212368 () Bool)

(assert (=> b!375854 (=> (not res!212368) (not e!228915))))

(assert (=> b!375854 (= res!212368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15048 () Bool)

(assert (=> mapIsEmpty!15048 mapRes!15048))

(declare-fun b!375855 () Bool)

(assert (=> b!375855 (= e!228919 (and e!228918 mapRes!15048))))

(declare-fun condMapEmpty!15048 () Bool)

(declare-fun mapDefault!15048 () ValueCell!4151)

(assert (=> b!375855 (= condMapEmpty!15048 (= (arr!10416 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4151)) mapDefault!15048)))))

(declare-fun b!375856 () Bool)

(declare-fun res!212360 () Bool)

(assert (=> b!375856 (=> (not res!212360) (not e!228915))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375856 (= res!212360 (and (= (size!10769 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10768 _keys!658) (size!10769 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375857 () Bool)

(declare-fun res!212362 () Bool)

(assert (=> b!375857 (=> (not res!212362) (not e!228915))))

(assert (=> b!375857 (= res!212362 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10768 _keys!658))))))

(declare-fun b!375858 () Bool)

(assert (=> b!375858 (= e!228920 (not e!228916))))

(declare-fun res!212358 () Bool)

(assert (=> b!375858 (=> res!212358 e!228916)))

(assert (=> b!375858 (= res!212358 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13091)

(declare-fun getCurrentListMap!1891 (array!21893 array!21895 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4927)

(assert (=> b!375858 (= lt!174116 (getCurrentListMap!1891 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174118 () array!21895)

(assert (=> b!375858 (= lt!174120 (getCurrentListMap!1891 lt!174121 lt!174118 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375858 (and (= lt!174115 lt!174126) (= lt!174126 lt!174115))))

(assert (=> b!375858 (= lt!174126 (+!847 lt!174114 lt!174123))))

(assert (=> b!375858 (= lt!174123 (tuple2!6025 k0!778 v!373))))

(declare-fun lt!174124 () Unit!11566)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 (array!21893 array!21895 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) (_ BitVec 64) V!13091 (_ BitVec 32) Int) Unit!11566)

(assert (=> b!375858 (= lt!174124 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!756 (array!21893 array!21895 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4927)

(assert (=> b!375858 (= lt!174115 (getCurrentListMapNoExtraKeys!756 lt!174121 lt!174118 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375858 (= lt!174118 (array!21896 (store (arr!10416 _values!506) i!548 (ValueCellFull!4151 v!373)) (size!10769 _values!506)))))

(assert (=> b!375858 (= lt!174114 (getCurrentListMapNoExtraKeys!756 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375859 () Bool)

(declare-fun res!212364 () Bool)

(assert (=> b!375859 (=> (not res!212364) (not e!228915))))

(assert (=> b!375859 (= res!212364 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5851))))

(assert (= (and start!37200 res!212359) b!375856))

(assert (= (and b!375856 res!212360) b!375854))

(assert (= (and b!375854 res!212368) b!375859))

(assert (= (and b!375859 res!212364) b!375857))

(assert (= (and b!375857 res!212362) b!375848))

(assert (= (and b!375848 res!212363) b!375851))

(assert (= (and b!375851 res!212369) b!375847))

(assert (= (and b!375847 res!212367) b!375845))

(assert (= (and b!375845 res!212365) b!375853))

(assert (= (and b!375853 res!212361) b!375858))

(assert (= (and b!375858 (not res!212358)) b!375850))

(assert (= (and b!375850 (not res!212366)) b!375846))

(assert (= (and b!375855 condMapEmpty!15048) mapIsEmpty!15048))

(assert (= (and b!375855 (not condMapEmpty!15048)) mapNonEmpty!15048))

(get-info :version)

(assert (= (and mapNonEmpty!15048 ((_ is ValueCellFull!4151) mapValue!15048)) b!375849))

(assert (= (and b!375855 ((_ is ValueCellFull!4151) mapDefault!15048)) b!375852))

(assert (= start!37200 b!375855))

(declare-fun m!372071 () Bool)

(assert (=> mapNonEmpty!15048 m!372071))

(declare-fun m!372073 () Bool)

(assert (=> start!37200 m!372073))

(declare-fun m!372075 () Bool)

(assert (=> start!37200 m!372075))

(declare-fun m!372077 () Bool)

(assert (=> start!37200 m!372077))

(declare-fun m!372079 () Bool)

(assert (=> b!375847 m!372079))

(declare-fun m!372081 () Bool)

(assert (=> b!375854 m!372081))

(declare-fun m!372083 () Bool)

(assert (=> b!375848 m!372083))

(declare-fun m!372085 () Bool)

(assert (=> b!375845 m!372085))

(declare-fun m!372087 () Bool)

(assert (=> b!375845 m!372087))

(declare-fun m!372089 () Bool)

(assert (=> b!375846 m!372089))

(declare-fun m!372091 () Bool)

(assert (=> b!375846 m!372091))

(declare-fun m!372093 () Bool)

(assert (=> b!375850 m!372093))

(declare-fun m!372095 () Bool)

(assert (=> b!375850 m!372095))

(declare-fun m!372097 () Bool)

(assert (=> b!375850 m!372097))

(declare-fun m!372099 () Bool)

(assert (=> b!375858 m!372099))

(declare-fun m!372101 () Bool)

(assert (=> b!375858 m!372101))

(declare-fun m!372103 () Bool)

(assert (=> b!375858 m!372103))

(declare-fun m!372105 () Bool)

(assert (=> b!375858 m!372105))

(declare-fun m!372107 () Bool)

(assert (=> b!375858 m!372107))

(declare-fun m!372109 () Bool)

(assert (=> b!375858 m!372109))

(declare-fun m!372111 () Bool)

(assert (=> b!375858 m!372111))

(declare-fun m!372113 () Bool)

(assert (=> b!375851 m!372113))

(declare-fun m!372115 () Bool)

(assert (=> b!375853 m!372115))

(declare-fun m!372117 () Bool)

(assert (=> b!375859 m!372117))

(check-sat (not b!375848) (not mapNonEmpty!15048) (not b!375845) (not b!375853) (not b!375858) b_and!15557 (not b!375850) (not b!375846) (not b!375854) (not b!375847) (not b!375859) tp_is_empty!8989 (not b_next!8341) (not start!37200))
(check-sat b_and!15557 (not b_next!8341))
