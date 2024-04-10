; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38232 () Bool)

(assert start!38232)

(declare-fun b_free!9069 () Bool)

(declare-fun b_next!9069 () Bool)

(assert (=> start!38232 (= b_free!9069 (not b_next!9069))))

(declare-fun tp!31995 () Bool)

(declare-fun b_and!16455 () Bool)

(assert (=> start!38232 (= tp!31995 b_and!16455)))

(declare-fun mapNonEmpty!16212 () Bool)

(declare-fun mapRes!16212 () Bool)

(declare-fun tp!31994 () Bool)

(declare-fun e!238753 () Bool)

(assert (=> mapNonEmpty!16212 (= mapRes!16212 (and tp!31994 e!238753))))

(declare-datatypes ((V!14093 0))(
  ( (V!14094 (val!4915 Int)) )
))
(declare-datatypes ((ValueCell!4527 0))(
  ( (ValueCellFull!4527 (v!7160 V!14093)) (EmptyCell!4527) )
))
(declare-datatypes ((array!23391 0))(
  ( (array!23392 (arr!11152 (Array (_ BitVec 32) ValueCell!4527)) (size!11504 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23391)

(declare-fun mapValue!16212 () ValueCell!4527)

(declare-fun mapRest!16212 () (Array (_ BitVec 32) ValueCell!4527))

(declare-fun mapKey!16212 () (_ BitVec 32))

(assert (=> mapNonEmpty!16212 (= (arr!11152 _values!506) (store mapRest!16212 mapKey!16212 mapValue!16212))))

(declare-fun b!394411 () Bool)

(declare-fun e!238752 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394411 (= e!238752 (bvslt i!548 (size!11504 _values!506)))))

(declare-fun b!394412 () Bool)

(declare-fun e!238749 () Bool)

(declare-fun e!238747 () Bool)

(assert (=> b!394412 (= e!238749 e!238747)))

(declare-fun res!226056 () Bool)

(assert (=> b!394412 (=> (not res!226056) (not e!238747))))

(declare-datatypes ((array!23393 0))(
  ( (array!23394 (arr!11153 (Array (_ BitVec 32) (_ BitVec 64))) (size!11505 (_ BitVec 32))) )
))
(declare-fun lt!186891 () array!23393)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23393 (_ BitVec 32)) Bool)

(assert (=> b!394412 (= res!226056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186891 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23393)

(assert (=> b!394412 (= lt!186891 (array!23394 (store (arr!11153 _keys!658) i!548 k0!778) (size!11505 _keys!658)))))

(declare-fun b!394413 () Bool)

(declare-fun res!226057 () Bool)

(assert (=> b!394413 (=> (not res!226057) (not e!238749))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394413 (= res!226057 (and (= (size!11504 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11505 _keys!658) (size!11504 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394414 () Bool)

(declare-fun res!226064 () Bool)

(assert (=> b!394414 (=> (not res!226064) (not e!238749))))

(declare-datatypes ((List!6489 0))(
  ( (Nil!6486) (Cons!6485 (h!7341 (_ BitVec 64)) (t!11663 List!6489)) )
))
(declare-fun arrayNoDuplicates!0 (array!23393 (_ BitVec 32) List!6489) Bool)

(assert (=> b!394414 (= res!226064 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6486))))

(declare-fun b!394415 () Bool)

(declare-fun res!226055 () Bool)

(assert (=> b!394415 (=> (not res!226055) (not e!238749))))

(assert (=> b!394415 (= res!226055 (or (= (select (arr!11153 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11153 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16212 () Bool)

(assert (=> mapIsEmpty!16212 mapRes!16212))

(declare-fun b!394416 () Bool)

(declare-fun tp_is_empty!9741 () Bool)

(assert (=> b!394416 (= e!238753 tp_is_empty!9741)))

(declare-fun b!394417 () Bool)

(declare-fun res!226059 () Bool)

(assert (=> b!394417 (=> (not res!226059) (not e!238749))))

(assert (=> b!394417 (= res!226059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394418 () Bool)

(declare-fun res!226060 () Bool)

(assert (=> b!394418 (=> (not res!226060) (not e!238749))))

(assert (=> b!394418 (= res!226060 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11505 _keys!658))))))

(declare-fun b!394419 () Bool)

(declare-fun e!238754 () Bool)

(assert (=> b!394419 (= e!238747 (not e!238754))))

(declare-fun res!226063 () Bool)

(assert (=> b!394419 (=> res!226063 e!238754)))

(declare-fun lt!186896 () Bool)

(assert (=> b!394419 (= res!226063 (or (and (not lt!186896) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186896) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186896)))))

(assert (=> b!394419 (= lt!186896 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6636 0))(
  ( (tuple2!6637 (_1!3329 (_ BitVec 64)) (_2!3329 V!14093)) )
))
(declare-datatypes ((List!6490 0))(
  ( (Nil!6487) (Cons!6486 (h!7342 tuple2!6636) (t!11664 List!6490)) )
))
(declare-datatypes ((ListLongMap!5549 0))(
  ( (ListLongMap!5550 (toList!2790 List!6490)) )
))
(declare-fun lt!186892 () ListLongMap!5549)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14093)

(declare-fun minValue!472 () V!14093)

(declare-fun getCurrentListMap!2129 (array!23393 array!23391 (_ BitVec 32) (_ BitVec 32) V!14093 V!14093 (_ BitVec 32) Int) ListLongMap!5549)

(assert (=> b!394419 (= lt!186892 (getCurrentListMap!2129 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186893 () array!23391)

(declare-fun lt!186895 () ListLongMap!5549)

(assert (=> b!394419 (= lt!186895 (getCurrentListMap!2129 lt!186891 lt!186893 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186890 () ListLongMap!5549)

(declare-fun lt!186897 () ListLongMap!5549)

(assert (=> b!394419 (and (= lt!186890 lt!186897) (= lt!186897 lt!186890))))

(declare-fun lt!186889 () ListLongMap!5549)

(declare-fun lt!186894 () tuple2!6636)

(declare-fun +!1083 (ListLongMap!5549 tuple2!6636) ListLongMap!5549)

(assert (=> b!394419 (= lt!186897 (+!1083 lt!186889 lt!186894))))

(declare-fun v!373 () V!14093)

(assert (=> b!394419 (= lt!186894 (tuple2!6637 k0!778 v!373))))

(declare-datatypes ((Unit!12056 0))(
  ( (Unit!12057) )
))
(declare-fun lt!186888 () Unit!12056)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!293 (array!23393 array!23391 (_ BitVec 32) (_ BitVec 32) V!14093 V!14093 (_ BitVec 32) (_ BitVec 64) V!14093 (_ BitVec 32) Int) Unit!12056)

(assert (=> b!394419 (= lt!186888 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!293 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1009 (array!23393 array!23391 (_ BitVec 32) (_ BitVec 32) V!14093 V!14093 (_ BitVec 32) Int) ListLongMap!5549)

(assert (=> b!394419 (= lt!186890 (getCurrentListMapNoExtraKeys!1009 lt!186891 lt!186893 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394419 (= lt!186893 (array!23392 (store (arr!11152 _values!506) i!548 (ValueCellFull!4527 v!373)) (size!11504 _values!506)))))

(assert (=> b!394419 (= lt!186889 (getCurrentListMapNoExtraKeys!1009 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!226061 () Bool)

(assert (=> start!38232 (=> (not res!226061) (not e!238749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38232 (= res!226061 (validMask!0 mask!970))))

(assert (=> start!38232 e!238749))

(declare-fun e!238748 () Bool)

(declare-fun array_inv!8186 (array!23391) Bool)

(assert (=> start!38232 (and (array_inv!8186 _values!506) e!238748)))

(assert (=> start!38232 tp!31995))

(assert (=> start!38232 true))

(assert (=> start!38232 tp_is_empty!9741))

(declare-fun array_inv!8187 (array!23393) Bool)

(assert (=> start!38232 (array_inv!8187 _keys!658)))

(declare-fun b!394410 () Bool)

(assert (=> b!394410 (= e!238754 e!238752)))

(declare-fun res!226053 () Bool)

(assert (=> b!394410 (=> res!226053 e!238752)))

(assert (=> b!394410 (= res!226053 (not (= (+!1083 lt!186892 lt!186894) lt!186895)))))

(assert (=> b!394410 (= lt!186895 lt!186890)))

(declare-fun b!394420 () Bool)

(declare-fun res!226058 () Bool)

(assert (=> b!394420 (=> (not res!226058) (not e!238749))))

(declare-fun arrayContainsKey!0 (array!23393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394420 (= res!226058 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394421 () Bool)

(declare-fun e!238751 () Bool)

(assert (=> b!394421 (= e!238751 tp_is_empty!9741)))

(declare-fun b!394422 () Bool)

(assert (=> b!394422 (= e!238748 (and e!238751 mapRes!16212))))

(declare-fun condMapEmpty!16212 () Bool)

(declare-fun mapDefault!16212 () ValueCell!4527)

(assert (=> b!394422 (= condMapEmpty!16212 (= (arr!11152 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4527)) mapDefault!16212)))))

(declare-fun b!394423 () Bool)

(declare-fun res!226062 () Bool)

(assert (=> b!394423 (=> (not res!226062) (not e!238749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394423 (= res!226062 (validKeyInArray!0 k0!778))))

(declare-fun b!394424 () Bool)

(declare-fun res!226054 () Bool)

(assert (=> b!394424 (=> (not res!226054) (not e!238747))))

(assert (=> b!394424 (= res!226054 (arrayNoDuplicates!0 lt!186891 #b00000000000000000000000000000000 Nil!6486))))

(assert (= (and start!38232 res!226061) b!394413))

(assert (= (and b!394413 res!226057) b!394417))

(assert (= (and b!394417 res!226059) b!394414))

(assert (= (and b!394414 res!226064) b!394418))

(assert (= (and b!394418 res!226060) b!394423))

(assert (= (and b!394423 res!226062) b!394415))

(assert (= (and b!394415 res!226055) b!394420))

(assert (= (and b!394420 res!226058) b!394412))

(assert (= (and b!394412 res!226056) b!394424))

(assert (= (and b!394424 res!226054) b!394419))

(assert (= (and b!394419 (not res!226063)) b!394410))

(assert (= (and b!394410 (not res!226053)) b!394411))

(assert (= (and b!394422 condMapEmpty!16212) mapIsEmpty!16212))

(assert (= (and b!394422 (not condMapEmpty!16212)) mapNonEmpty!16212))

(get-info :version)

(assert (= (and mapNonEmpty!16212 ((_ is ValueCellFull!4527) mapValue!16212)) b!394416))

(assert (= (and b!394422 ((_ is ValueCellFull!4527) mapDefault!16212)) b!394421))

(assert (= start!38232 b!394422))

(declare-fun m!390839 () Bool)

(assert (=> b!394415 m!390839))

(declare-fun m!390841 () Bool)

(assert (=> b!394423 m!390841))

(declare-fun m!390843 () Bool)

(assert (=> b!394420 m!390843))

(declare-fun m!390845 () Bool)

(assert (=> mapNonEmpty!16212 m!390845))

(declare-fun m!390847 () Bool)

(assert (=> start!38232 m!390847))

(declare-fun m!390849 () Bool)

(assert (=> start!38232 m!390849))

(declare-fun m!390851 () Bool)

(assert (=> start!38232 m!390851))

(declare-fun m!390853 () Bool)

(assert (=> b!394410 m!390853))

(declare-fun m!390855 () Bool)

(assert (=> b!394419 m!390855))

(declare-fun m!390857 () Bool)

(assert (=> b!394419 m!390857))

(declare-fun m!390859 () Bool)

(assert (=> b!394419 m!390859))

(declare-fun m!390861 () Bool)

(assert (=> b!394419 m!390861))

(declare-fun m!390863 () Bool)

(assert (=> b!394419 m!390863))

(declare-fun m!390865 () Bool)

(assert (=> b!394419 m!390865))

(declare-fun m!390867 () Bool)

(assert (=> b!394419 m!390867))

(declare-fun m!390869 () Bool)

(assert (=> b!394424 m!390869))

(declare-fun m!390871 () Bool)

(assert (=> b!394414 m!390871))

(declare-fun m!390873 () Bool)

(assert (=> b!394412 m!390873))

(declare-fun m!390875 () Bool)

(assert (=> b!394412 m!390875))

(declare-fun m!390877 () Bool)

(assert (=> b!394417 m!390877))

(check-sat (not start!38232) b_and!16455 (not b!394417) (not b!394412) (not mapNonEmpty!16212) (not b!394410) tp_is_empty!9741 (not b!394419) (not b!394414) (not b!394424) (not b!394420) (not b_next!9069) (not b!394423))
(check-sat b_and!16455 (not b_next!9069))
