; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37114 () Bool)

(assert start!37114)

(declare-fun b_free!8241 () Bool)

(declare-fun b_next!8241 () Bool)

(assert (=> start!37114 (= b_free!8241 (not b_next!8241))))

(declare-fun tp!29438 () Bool)

(declare-fun b_and!15483 () Bool)

(assert (=> start!37114 (= tp!29438 b_and!15483)))

(declare-fun b!373857 () Bool)

(declare-fun e!227894 () Bool)

(declare-fun e!227888 () Bool)

(assert (=> b!373857 (= e!227894 e!227888)))

(declare-fun res!210685 () Bool)

(assert (=> b!373857 (=> res!210685 e!227888)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!373857 (= res!210685 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12957 0))(
  ( (V!12958 (val!4489 Int)) )
))
(declare-datatypes ((tuple2!5964 0))(
  ( (tuple2!5965 (_1!2993 (_ BitVec 64)) (_2!2993 V!12957)) )
))
(declare-datatypes ((List!5809 0))(
  ( (Nil!5806) (Cons!5805 (h!6661 tuple2!5964) (t!10959 List!5809)) )
))
(declare-datatypes ((ListLongMap!4877 0))(
  ( (ListLongMap!4878 (toList!2454 List!5809)) )
))
(declare-fun lt!171951 () ListLongMap!4877)

(declare-fun lt!171960 () ListLongMap!4877)

(assert (=> b!373857 (= lt!171951 lt!171960)))

(declare-fun lt!171958 () ListLongMap!4877)

(declare-fun lt!171957 () tuple2!5964)

(declare-fun +!800 (ListLongMap!4877 tuple2!5964) ListLongMap!4877)

(assert (=> b!373857 (= lt!171960 (+!800 lt!171958 lt!171957))))

(declare-fun v!373 () V!12957)

(declare-fun lt!171953 () ListLongMap!4877)

(declare-datatypes ((Unit!11506 0))(
  ( (Unit!11507) )
))
(declare-fun lt!171964 () Unit!11506)

(declare-fun zeroValue!472 () V!12957)

(declare-fun addCommutativeForDiffKeys!224 (ListLongMap!4877 (_ BitVec 64) V!12957 (_ BitVec 64) V!12957) Unit!11506)

(assert (=> b!373857 (= lt!171964 (addCommutativeForDiffKeys!224 lt!171953 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171950 () ListLongMap!4877)

(declare-fun lt!171956 () tuple2!5964)

(assert (=> b!373857 (= lt!171950 (+!800 lt!171951 lt!171956))))

(declare-fun lt!171962 () ListLongMap!4877)

(declare-fun lt!171952 () tuple2!5964)

(assert (=> b!373857 (= lt!171951 (+!800 lt!171962 lt!171952))))

(declare-fun lt!171965 () ListLongMap!4877)

(declare-fun lt!171961 () ListLongMap!4877)

(assert (=> b!373857 (= lt!171965 lt!171961)))

(assert (=> b!373857 (= lt!171961 (+!800 lt!171958 lt!171956))))

(assert (=> b!373857 (= lt!171958 (+!800 lt!171953 lt!171952))))

(declare-fun lt!171966 () ListLongMap!4877)

(assert (=> b!373857 (= lt!171950 (+!800 (+!800 lt!171966 lt!171952) lt!171956))))

(declare-fun minValue!472 () V!12957)

(assert (=> b!373857 (= lt!171956 (tuple2!5965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373857 (= lt!171952 (tuple2!5965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373858 () Bool)

(declare-fun res!210686 () Bool)

(declare-fun e!227889 () Bool)

(assert (=> b!373858 (=> (not res!210686) (not e!227889))))

(declare-datatypes ((array!21717 0))(
  ( (array!21718 (arr!10327 (Array (_ BitVec 32) (_ BitVec 64))) (size!10679 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21717)

(declare-datatypes ((List!5810 0))(
  ( (Nil!5807) (Cons!5806 (h!6662 (_ BitVec 64)) (t!10960 List!5810)) )
))
(declare-fun arrayNoDuplicates!0 (array!21717 (_ BitVec 32) List!5810) Bool)

(assert (=> b!373858 (= res!210686 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5807))))

(declare-fun b!373859 () Bool)

(declare-fun res!210688 () Bool)

(assert (=> b!373859 (=> (not res!210688) (not e!227889))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373859 (= res!210688 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10679 _keys!658))))))

(declare-fun b!373860 () Bool)

(declare-fun res!210687 () Bool)

(assert (=> b!373860 (=> (not res!210687) (not e!227889))))

(declare-fun arrayContainsKey!0 (array!21717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373860 (= res!210687 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373861 () Bool)

(assert (=> b!373861 (= e!227888 true)))

(assert (=> b!373861 (= (+!800 lt!171960 lt!171956) (+!800 lt!171961 lt!171957))))

(declare-fun lt!171954 () Unit!11506)

(assert (=> b!373861 (= lt!171954 (addCommutativeForDiffKeys!224 lt!171958 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373862 () Bool)

(declare-fun e!227891 () Bool)

(declare-fun tp_is_empty!8889 () Bool)

(assert (=> b!373862 (= e!227891 tp_is_empty!8889)))

(declare-fun b!373863 () Bool)

(declare-fun res!210679 () Bool)

(assert (=> b!373863 (=> (not res!210679) (not e!227889))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4101 0))(
  ( (ValueCellFull!4101 (v!6686 V!12957)) (EmptyCell!4101) )
))
(declare-datatypes ((array!21719 0))(
  ( (array!21720 (arr!10328 (Array (_ BitVec 32) ValueCell!4101)) (size!10680 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21719)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373863 (= res!210679 (and (= (size!10680 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10679 _keys!658) (size!10680 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!210689 () Bool)

(assert (=> start!37114 (=> (not res!210689) (not e!227889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37114 (= res!210689 (validMask!0 mask!970))))

(assert (=> start!37114 e!227889))

(declare-fun e!227892 () Bool)

(declare-fun array_inv!7612 (array!21719) Bool)

(assert (=> start!37114 (and (array_inv!7612 _values!506) e!227892)))

(assert (=> start!37114 tp!29438))

(assert (=> start!37114 true))

(assert (=> start!37114 tp_is_empty!8889))

(declare-fun array_inv!7613 (array!21717) Bool)

(assert (=> start!37114 (array_inv!7613 _keys!658)))

(declare-fun b!373864 () Bool)

(declare-fun e!227890 () Bool)

(assert (=> b!373864 (= e!227889 e!227890)))

(declare-fun res!210684 () Bool)

(assert (=> b!373864 (=> (not res!210684) (not e!227890))))

(declare-fun lt!171955 () array!21717)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21717 (_ BitVec 32)) Bool)

(assert (=> b!373864 (= res!210684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171955 mask!970))))

(assert (=> b!373864 (= lt!171955 (array!21718 (store (arr!10327 _keys!658) i!548 k0!778) (size!10679 _keys!658)))))

(declare-fun b!373865 () Bool)

(declare-fun e!227887 () Bool)

(assert (=> b!373865 (= e!227887 tp_is_empty!8889)))

(declare-fun b!373866 () Bool)

(declare-fun res!210678 () Bool)

(assert (=> b!373866 (=> (not res!210678) (not e!227889))))

(assert (=> b!373866 (= res!210678 (or (= (select (arr!10327 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10327 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373867 () Bool)

(declare-fun res!210682 () Bool)

(assert (=> b!373867 (=> (not res!210682) (not e!227889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373867 (= res!210682 (validKeyInArray!0 k0!778))))

(declare-fun b!373868 () Bool)

(assert (=> b!373868 (= e!227890 (not e!227894))))

(declare-fun res!210683 () Bool)

(assert (=> b!373868 (=> res!210683 e!227894)))

(assert (=> b!373868 (= res!210683 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1893 (array!21717 array!21719 (_ BitVec 32) (_ BitVec 32) V!12957 V!12957 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!373868 (= lt!171965 (getCurrentListMap!1893 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171959 () array!21719)

(assert (=> b!373868 (= lt!171950 (getCurrentListMap!1893 lt!171955 lt!171959 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373868 (and (= lt!171966 lt!171962) (= lt!171962 lt!171966))))

(assert (=> b!373868 (= lt!171962 (+!800 lt!171953 lt!171957))))

(assert (=> b!373868 (= lt!171957 (tuple2!5965 k0!778 v!373))))

(declare-fun lt!171963 () Unit!11506)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!51 (array!21717 array!21719 (_ BitVec 32) (_ BitVec 32) V!12957 V!12957 (_ BitVec 32) (_ BitVec 64) V!12957 (_ BitVec 32) Int) Unit!11506)

(assert (=> b!373868 (= lt!171963 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!51 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!727 (array!21717 array!21719 (_ BitVec 32) (_ BitVec 32) V!12957 V!12957 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!373868 (= lt!171966 (getCurrentListMapNoExtraKeys!727 lt!171955 lt!171959 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373868 (= lt!171959 (array!21720 (store (arr!10328 _values!506) i!548 (ValueCellFull!4101 v!373)) (size!10680 _values!506)))))

(assert (=> b!373868 (= lt!171953 (getCurrentListMapNoExtraKeys!727 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373869 () Bool)

(declare-fun res!210681 () Bool)

(assert (=> b!373869 (=> (not res!210681) (not e!227889))))

(assert (=> b!373869 (= res!210681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373870 () Bool)

(declare-fun res!210680 () Bool)

(assert (=> b!373870 (=> (not res!210680) (not e!227890))))

(assert (=> b!373870 (= res!210680 (arrayNoDuplicates!0 lt!171955 #b00000000000000000000000000000000 Nil!5807))))

(declare-fun mapIsEmpty!14898 () Bool)

(declare-fun mapRes!14898 () Bool)

(assert (=> mapIsEmpty!14898 mapRes!14898))

(declare-fun mapNonEmpty!14898 () Bool)

(declare-fun tp!29439 () Bool)

(assert (=> mapNonEmpty!14898 (= mapRes!14898 (and tp!29439 e!227891))))

(declare-fun mapKey!14898 () (_ BitVec 32))

(declare-fun mapRest!14898 () (Array (_ BitVec 32) ValueCell!4101))

(declare-fun mapValue!14898 () ValueCell!4101)

(assert (=> mapNonEmpty!14898 (= (arr!10328 _values!506) (store mapRest!14898 mapKey!14898 mapValue!14898))))

(declare-fun b!373871 () Bool)

(assert (=> b!373871 (= e!227892 (and e!227887 mapRes!14898))))

(declare-fun condMapEmpty!14898 () Bool)

(declare-fun mapDefault!14898 () ValueCell!4101)

(assert (=> b!373871 (= condMapEmpty!14898 (= (arr!10328 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4101)) mapDefault!14898)))))

(assert (= (and start!37114 res!210689) b!373863))

(assert (= (and b!373863 res!210679) b!373869))

(assert (= (and b!373869 res!210681) b!373858))

(assert (= (and b!373858 res!210686) b!373859))

(assert (= (and b!373859 res!210688) b!373867))

(assert (= (and b!373867 res!210682) b!373866))

(assert (= (and b!373866 res!210678) b!373860))

(assert (= (and b!373860 res!210687) b!373864))

(assert (= (and b!373864 res!210684) b!373870))

(assert (= (and b!373870 res!210680) b!373868))

(assert (= (and b!373868 (not res!210683)) b!373857))

(assert (= (and b!373857 (not res!210685)) b!373861))

(assert (= (and b!373871 condMapEmpty!14898) mapIsEmpty!14898))

(assert (= (and b!373871 (not condMapEmpty!14898)) mapNonEmpty!14898))

(get-info :version)

(assert (= (and mapNonEmpty!14898 ((_ is ValueCellFull!4101) mapValue!14898)) b!373862))

(assert (= (and b!373871 ((_ is ValueCellFull!4101) mapDefault!14898)) b!373865))

(assert (= start!37114 b!373871))

(declare-fun m!369915 () Bool)

(assert (=> b!373858 m!369915))

(declare-fun m!369917 () Bool)

(assert (=> b!373864 m!369917))

(declare-fun m!369919 () Bool)

(assert (=> b!373864 m!369919))

(declare-fun m!369921 () Bool)

(assert (=> b!373867 m!369921))

(declare-fun m!369923 () Bool)

(assert (=> mapNonEmpty!14898 m!369923))

(declare-fun m!369925 () Bool)

(assert (=> b!373857 m!369925))

(declare-fun m!369927 () Bool)

(assert (=> b!373857 m!369927))

(declare-fun m!369929 () Bool)

(assert (=> b!373857 m!369929))

(declare-fun m!369931 () Bool)

(assert (=> b!373857 m!369931))

(declare-fun m!369933 () Bool)

(assert (=> b!373857 m!369933))

(declare-fun m!369935 () Bool)

(assert (=> b!373857 m!369935))

(declare-fun m!369937 () Bool)

(assert (=> b!373857 m!369937))

(declare-fun m!369939 () Bool)

(assert (=> b!373857 m!369939))

(assert (=> b!373857 m!369931))

(declare-fun m!369941 () Bool)

(assert (=> b!373866 m!369941))

(declare-fun m!369943 () Bool)

(assert (=> b!373869 m!369943))

(declare-fun m!369945 () Bool)

(assert (=> b!373860 m!369945))

(declare-fun m!369947 () Bool)

(assert (=> start!37114 m!369947))

(declare-fun m!369949 () Bool)

(assert (=> start!37114 m!369949))

(declare-fun m!369951 () Bool)

(assert (=> start!37114 m!369951))

(declare-fun m!369953 () Bool)

(assert (=> b!373861 m!369953))

(declare-fun m!369955 () Bool)

(assert (=> b!373861 m!369955))

(declare-fun m!369957 () Bool)

(assert (=> b!373861 m!369957))

(declare-fun m!369959 () Bool)

(assert (=> b!373868 m!369959))

(declare-fun m!369961 () Bool)

(assert (=> b!373868 m!369961))

(declare-fun m!369963 () Bool)

(assert (=> b!373868 m!369963))

(declare-fun m!369965 () Bool)

(assert (=> b!373868 m!369965))

(declare-fun m!369967 () Bool)

(assert (=> b!373868 m!369967))

(declare-fun m!369969 () Bool)

(assert (=> b!373868 m!369969))

(declare-fun m!369971 () Bool)

(assert (=> b!373868 m!369971))

(declare-fun m!369973 () Bool)

(assert (=> b!373870 m!369973))

(check-sat tp_is_empty!8889 b_and!15483 (not b!373857) (not mapNonEmpty!14898) (not b_next!8241) (not b!373861) (not start!37114) (not b!373864) (not b!373869) (not b!373868) (not b!373867) (not b!373858) (not b!373860) (not b!373870))
(check-sat b_and!15483 (not b_next!8241))
