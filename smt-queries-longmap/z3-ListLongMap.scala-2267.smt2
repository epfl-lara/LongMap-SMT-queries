; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37050 () Bool)

(assert start!37050)

(declare-fun b_free!8191 () Bool)

(declare-fun b_next!8191 () Bool)

(assert (=> start!37050 (= b_free!8191 (not b_next!8191))))

(declare-fun tp!29288 () Bool)

(declare-fun b_and!15447 () Bool)

(assert (=> start!37050 (= tp!29288 b_and!15447)))

(declare-fun b!372715 () Bool)

(declare-fun res!209808 () Bool)

(declare-fun e!227297 () Bool)

(assert (=> b!372715 (=> (not res!209808) (not e!227297))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12891 0))(
  ( (V!12892 (val!4464 Int)) )
))
(declare-datatypes ((ValueCell!4076 0))(
  ( (ValueCellFull!4076 (v!6662 V!12891)) (EmptyCell!4076) )
))
(declare-datatypes ((array!21600 0))(
  ( (array!21601 (arr!10268 (Array (_ BitVec 32) ValueCell!4076)) (size!10620 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21600)

(declare-datatypes ((array!21602 0))(
  ( (array!21603 (arr!10269 (Array (_ BitVec 32) (_ BitVec 64))) (size!10621 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21602)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372715 (= res!209808 (and (= (size!10620 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10621 _keys!658) (size!10620 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372717 () Bool)

(declare-fun res!209809 () Bool)

(assert (=> b!372717 (=> (not res!209809) (not e!227297))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372717 (= res!209809 (or (= (select (arr!10269 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10269 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372718 () Bool)

(declare-fun res!209812 () Bool)

(declare-fun e!227301 () Bool)

(assert (=> b!372718 (=> (not res!209812) (not e!227301))))

(declare-fun lt!170948 () array!21602)

(declare-datatypes ((List!5666 0))(
  ( (Nil!5663) (Cons!5662 (h!6518 (_ BitVec 64)) (t!10808 List!5666)) )
))
(declare-fun arrayNoDuplicates!0 (array!21602 (_ BitVec 32) List!5666) Bool)

(assert (=> b!372718 (= res!209812 (arrayNoDuplicates!0 lt!170948 #b00000000000000000000000000000000 Nil!5663))))

(declare-fun b!372719 () Bool)

(assert (=> b!372719 (= e!227301 (not true))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170946 () array!21600)

(declare-fun zeroValue!472 () V!12891)

(declare-datatypes ((tuple2!5822 0))(
  ( (tuple2!5823 (_1!2922 (_ BitVec 64)) (_2!2922 V!12891)) )
))
(declare-datatypes ((List!5667 0))(
  ( (Nil!5664) (Cons!5663 (h!6519 tuple2!5822) (t!10809 List!5667)) )
))
(declare-datatypes ((ListLongMap!4737 0))(
  ( (ListLongMap!4738 (toList!2384 List!5667)) )
))
(declare-fun lt!170945 () ListLongMap!4737)

(declare-fun minValue!472 () V!12891)

(declare-fun getCurrentListMap!1846 (array!21602 array!21600 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) Int) ListLongMap!4737)

(assert (=> b!372719 (= lt!170945 (getCurrentListMap!1846 lt!170948 lt!170946 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170944 () ListLongMap!4737)

(declare-fun lt!170949 () ListLongMap!4737)

(assert (=> b!372719 (and (= lt!170944 lt!170949) (= lt!170949 lt!170944))))

(declare-fun v!373 () V!12891)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!170950 () ListLongMap!4737)

(declare-fun +!780 (ListLongMap!4737 tuple2!5822) ListLongMap!4737)

(assert (=> b!372719 (= lt!170949 (+!780 lt!170950 (tuple2!5823 k0!778 v!373)))))

(declare-datatypes ((Unit!11451 0))(
  ( (Unit!11452) )
))
(declare-fun lt!170947 () Unit!11451)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!33 (array!21602 array!21600 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) (_ BitVec 64) V!12891 (_ BitVec 32) Int) Unit!11451)

(assert (=> b!372719 (= lt!170947 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!33 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!693 (array!21602 array!21600 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) Int) ListLongMap!4737)

(assert (=> b!372719 (= lt!170944 (getCurrentListMapNoExtraKeys!693 lt!170948 lt!170946 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372719 (= lt!170946 (array!21601 (store (arr!10268 _values!506) i!548 (ValueCellFull!4076 v!373)) (size!10620 _values!506)))))

(assert (=> b!372719 (= lt!170950 (getCurrentListMapNoExtraKeys!693 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372720 () Bool)

(declare-fun res!209811 () Bool)

(assert (=> b!372720 (=> (not res!209811) (not e!227297))))

(declare-fun arrayContainsKey!0 (array!21602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372720 (= res!209811 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372721 () Bool)

(declare-fun res!209810 () Bool)

(assert (=> b!372721 (=> (not res!209810) (not e!227297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21602 (_ BitVec 32)) Bool)

(assert (=> b!372721 (= res!209810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14823 () Bool)

(declare-fun mapRes!14823 () Bool)

(declare-fun tp!29289 () Bool)

(declare-fun e!227298 () Bool)

(assert (=> mapNonEmpty!14823 (= mapRes!14823 (and tp!29289 e!227298))))

(declare-fun mapKey!14823 () (_ BitVec 32))

(declare-fun mapRest!14823 () (Array (_ BitVec 32) ValueCell!4076))

(declare-fun mapValue!14823 () ValueCell!4076)

(assert (=> mapNonEmpty!14823 (= (arr!10268 _values!506) (store mapRest!14823 mapKey!14823 mapValue!14823))))

(declare-fun b!372722 () Bool)

(declare-fun res!209807 () Bool)

(assert (=> b!372722 (=> (not res!209807) (not e!227297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372722 (= res!209807 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14823 () Bool)

(assert (=> mapIsEmpty!14823 mapRes!14823))

(declare-fun b!372723 () Bool)

(declare-fun tp_is_empty!8839 () Bool)

(assert (=> b!372723 (= e!227298 tp_is_empty!8839)))

(declare-fun b!372724 () Bool)

(declare-fun e!227300 () Bool)

(declare-fun e!227299 () Bool)

(assert (=> b!372724 (= e!227300 (and e!227299 mapRes!14823))))

(declare-fun condMapEmpty!14823 () Bool)

(declare-fun mapDefault!14823 () ValueCell!4076)

(assert (=> b!372724 (= condMapEmpty!14823 (= (arr!10268 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4076)) mapDefault!14823)))))

(declare-fun b!372725 () Bool)

(declare-fun res!209813 () Bool)

(assert (=> b!372725 (=> (not res!209813) (not e!227297))))

(assert (=> b!372725 (= res!209813 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5663))))

(declare-fun res!209815 () Bool)

(assert (=> start!37050 (=> (not res!209815) (not e!227297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37050 (= res!209815 (validMask!0 mask!970))))

(assert (=> start!37050 e!227297))

(declare-fun array_inv!7616 (array!21600) Bool)

(assert (=> start!37050 (and (array_inv!7616 _values!506) e!227300)))

(assert (=> start!37050 tp!29288))

(assert (=> start!37050 true))

(assert (=> start!37050 tp_is_empty!8839))

(declare-fun array_inv!7617 (array!21602) Bool)

(assert (=> start!37050 (array_inv!7617 _keys!658)))

(declare-fun b!372716 () Bool)

(declare-fun res!209814 () Bool)

(assert (=> b!372716 (=> (not res!209814) (not e!227297))))

(assert (=> b!372716 (= res!209814 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10621 _keys!658))))))

(declare-fun b!372726 () Bool)

(assert (=> b!372726 (= e!227297 e!227301)))

(declare-fun res!209816 () Bool)

(assert (=> b!372726 (=> (not res!209816) (not e!227301))))

(assert (=> b!372726 (= res!209816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170948 mask!970))))

(assert (=> b!372726 (= lt!170948 (array!21603 (store (arr!10269 _keys!658) i!548 k0!778) (size!10621 _keys!658)))))

(declare-fun b!372727 () Bool)

(assert (=> b!372727 (= e!227299 tp_is_empty!8839)))

(assert (= (and start!37050 res!209815) b!372715))

(assert (= (and b!372715 res!209808) b!372721))

(assert (= (and b!372721 res!209810) b!372725))

(assert (= (and b!372725 res!209813) b!372716))

(assert (= (and b!372716 res!209814) b!372722))

(assert (= (and b!372722 res!209807) b!372717))

(assert (= (and b!372717 res!209809) b!372720))

(assert (= (and b!372720 res!209811) b!372726))

(assert (= (and b!372726 res!209816) b!372718))

(assert (= (and b!372718 res!209812) b!372719))

(assert (= (and b!372724 condMapEmpty!14823) mapIsEmpty!14823))

(assert (= (and b!372724 (not condMapEmpty!14823)) mapNonEmpty!14823))

(get-info :version)

(assert (= (and mapNonEmpty!14823 ((_ is ValueCellFull!4076) mapValue!14823)) b!372723))

(assert (= (and b!372724 ((_ is ValueCellFull!4076) mapDefault!14823)) b!372727))

(assert (= start!37050 b!372724))

(declare-fun m!368837 () Bool)

(assert (=> mapNonEmpty!14823 m!368837))

(declare-fun m!368839 () Bool)

(assert (=> b!372719 m!368839))

(declare-fun m!368841 () Bool)

(assert (=> b!372719 m!368841))

(declare-fun m!368843 () Bool)

(assert (=> b!372719 m!368843))

(declare-fun m!368845 () Bool)

(assert (=> b!372719 m!368845))

(declare-fun m!368847 () Bool)

(assert (=> b!372719 m!368847))

(declare-fun m!368849 () Bool)

(assert (=> b!372719 m!368849))

(declare-fun m!368851 () Bool)

(assert (=> b!372722 m!368851))

(declare-fun m!368853 () Bool)

(assert (=> b!372721 m!368853))

(declare-fun m!368855 () Bool)

(assert (=> b!372725 m!368855))

(declare-fun m!368857 () Bool)

(assert (=> b!372720 m!368857))

(declare-fun m!368859 () Bool)

(assert (=> b!372718 m!368859))

(declare-fun m!368861 () Bool)

(assert (=> b!372717 m!368861))

(declare-fun m!368863 () Bool)

(assert (=> b!372726 m!368863))

(declare-fun m!368865 () Bool)

(assert (=> b!372726 m!368865))

(declare-fun m!368867 () Bool)

(assert (=> start!37050 m!368867))

(declare-fun m!368869 () Bool)

(assert (=> start!37050 m!368869))

(declare-fun m!368871 () Bool)

(assert (=> start!37050 m!368871))

(check-sat (not b!372725) (not b!372721) (not b_next!8191) (not b!372726) (not b!372718) b_and!15447 tp_is_empty!8839 (not b!372722) (not start!37050) (not b!372719) (not mapNonEmpty!14823) (not b!372720))
(check-sat b_and!15447 (not b_next!8191))
