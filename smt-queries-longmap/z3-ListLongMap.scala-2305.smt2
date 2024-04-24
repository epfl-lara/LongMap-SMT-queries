; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37278 () Bool)

(assert start!37278)

(declare-fun b_free!8419 () Bool)

(declare-fun b_next!8419 () Bool)

(assert (=> start!37278 (= b_free!8419 (not b_next!8419))))

(declare-fun tp!29972 () Bool)

(declare-fun b_and!15675 () Bool)

(assert (=> start!37278 (= tp!29972 b_and!15675)))

(declare-fun b!377822 () Bool)

(declare-fun res!213892 () Bool)

(declare-fun e!229998 () Bool)

(assert (=> b!377822 (=> (not res!213892) (not e!229998))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377822 (= res!213892 (validKeyInArray!0 k0!778))))

(declare-fun b!377823 () Bool)

(declare-fun res!213898 () Bool)

(assert (=> b!377823 (=> (not res!213898) (not e!229998))))

(declare-datatypes ((array!22050 0))(
  ( (array!22051 (arr!10493 (Array (_ BitVec 32) (_ BitVec 64))) (size!10845 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22050)

(declare-fun arrayContainsKey!0 (array!22050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377823 (= res!213898 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377824 () Bool)

(declare-fun res!213888 () Bool)

(assert (=> b!377824 (=> (not res!213888) (not e!229998))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13195 0))(
  ( (V!13196 (val!4578 Int)) )
))
(declare-datatypes ((ValueCell!4190 0))(
  ( (ValueCellFull!4190 (v!6776 V!13195)) (EmptyCell!4190) )
))
(declare-datatypes ((array!22052 0))(
  ( (array!22053 (arr!10494 (Array (_ BitVec 32) ValueCell!4190)) (size!10846 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22052)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!377824 (= res!213888 (and (= (size!10846 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10845 _keys!658) (size!10846 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377825 () Bool)

(declare-fun res!213894 () Bool)

(assert (=> b!377825 (=> (not res!213894) (not e!229998))))

(declare-datatypes ((List!5855 0))(
  ( (Nil!5852) (Cons!5851 (h!6707 (_ BitVec 64)) (t!10997 List!5855)) )
))
(declare-fun arrayNoDuplicates!0 (array!22050 (_ BitVec 32) List!5855) Bool)

(assert (=> b!377825 (= res!213894 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5852))))

(declare-fun b!377826 () Bool)

(declare-fun e!229991 () Bool)

(assert (=> b!377826 (= e!229998 e!229991)))

(declare-fun res!213893 () Bool)

(assert (=> b!377826 (=> (not res!213893) (not e!229991))))

(declare-fun lt!175894 () array!22050)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22050 (_ BitVec 32)) Bool)

(assert (=> b!377826 (= res!213893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175894 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377826 (= lt!175894 (array!22051 (store (arr!10493 _keys!658) i!548 k0!778) (size!10845 _keys!658)))))

(declare-fun b!377827 () Bool)

(declare-fun e!229997 () Bool)

(declare-fun e!229996 () Bool)

(assert (=> b!377827 (= e!229997 e!229996)))

(declare-fun res!213899 () Bool)

(assert (=> b!377827 (=> res!213899 e!229996)))

(assert (=> b!377827 (= res!213899 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6016 0))(
  ( (tuple2!6017 (_1!3019 (_ BitVec 64)) (_2!3019 V!13195)) )
))
(declare-datatypes ((List!5856 0))(
  ( (Nil!5853) (Cons!5852 (h!6708 tuple2!6016) (t!10998 List!5856)) )
))
(declare-datatypes ((ListLongMap!4931 0))(
  ( (ListLongMap!4932 (toList!2481 List!5856)) )
))
(declare-fun lt!175898 () ListLongMap!4931)

(declare-fun lt!175888 () ListLongMap!4931)

(assert (=> b!377827 (= lt!175898 lt!175888)))

(declare-fun lt!175891 () ListLongMap!4931)

(declare-fun lt!175896 () tuple2!6016)

(declare-fun +!877 (ListLongMap!4931 tuple2!6016) ListLongMap!4931)

(assert (=> b!377827 (= lt!175888 (+!877 lt!175891 lt!175896))))

(declare-fun lt!175900 () ListLongMap!4931)

(declare-fun lt!175890 () ListLongMap!4931)

(assert (=> b!377827 (= lt!175900 lt!175890)))

(declare-fun lt!175893 () ListLongMap!4931)

(assert (=> b!377827 (= lt!175890 (+!877 lt!175893 lt!175896))))

(declare-fun lt!175892 () ListLongMap!4931)

(assert (=> b!377827 (= lt!175898 (+!877 lt!175892 lt!175896))))

(declare-fun zeroValue!472 () V!13195)

(assert (=> b!377827 (= lt!175896 (tuple2!6017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377828 () Bool)

(declare-fun res!213890 () Bool)

(assert (=> b!377828 (=> (not res!213890) (not e!229998))))

(assert (=> b!377828 (= res!213890 (or (= (select (arr!10493 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10493 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377829 () Bool)

(declare-fun res!213896 () Bool)

(assert (=> b!377829 (=> (not res!213896) (not e!229998))))

(assert (=> b!377829 (= res!213896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377830 () Bool)

(declare-fun res!213895 () Bool)

(assert (=> b!377830 (=> (not res!213895) (not e!229998))))

(assert (=> b!377830 (= res!213895 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10845 _keys!658))))))

(declare-fun b!377831 () Bool)

(assert (=> b!377831 (= e!229996 true)))

(declare-fun lt!175889 () tuple2!6016)

(assert (=> b!377831 (= lt!175888 (+!877 lt!175890 lt!175889))))

(declare-fun v!373 () V!13195)

(declare-datatypes ((Unit!11637 0))(
  ( (Unit!11638) )
))
(declare-fun lt!175899 () Unit!11637)

(declare-fun addCommutativeForDiffKeys!293 (ListLongMap!4931 (_ BitVec 64) V!13195 (_ BitVec 64) V!13195) Unit!11637)

(assert (=> b!377831 (= lt!175899 (addCommutativeForDiffKeys!293 lt!175893 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377832 () Bool)

(declare-fun e!229993 () Bool)

(declare-fun tp_is_empty!9067 () Bool)

(assert (=> b!377832 (= e!229993 tp_is_empty!9067)))

(declare-fun mapIsEmpty!15165 () Bool)

(declare-fun mapRes!15165 () Bool)

(assert (=> mapIsEmpty!15165 mapRes!15165))

(declare-fun b!377833 () Bool)

(declare-fun res!213891 () Bool)

(assert (=> b!377833 (=> (not res!213891) (not e!229991))))

(assert (=> b!377833 (= res!213891 (arrayNoDuplicates!0 lt!175894 #b00000000000000000000000000000000 Nil!5852))))

(declare-fun b!377834 () Bool)

(assert (=> b!377834 (= e!229991 (not e!229997))))

(declare-fun res!213897 () Bool)

(assert (=> b!377834 (=> res!213897 e!229997)))

(assert (=> b!377834 (= res!213897 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13195)

(declare-fun getCurrentListMap!1925 (array!22050 array!22052 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!377834 (= lt!175900 (getCurrentListMap!1925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175895 () array!22052)

(assert (=> b!377834 (= lt!175898 (getCurrentListMap!1925 lt!175894 lt!175895 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377834 (and (= lt!175892 lt!175891) (= lt!175891 lt!175892))))

(assert (=> b!377834 (= lt!175891 (+!877 lt!175893 lt!175889))))

(assert (=> b!377834 (= lt!175889 (tuple2!6017 k0!778 v!373))))

(declare-fun lt!175897 () Unit!11637)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 (array!22050 array!22052 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) (_ BitVec 64) V!13195 (_ BitVec 32) Int) Unit!11637)

(assert (=> b!377834 (= lt!175897 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!772 (array!22050 array!22052 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!377834 (= lt!175892 (getCurrentListMapNoExtraKeys!772 lt!175894 lt!175895 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377834 (= lt!175895 (array!22053 (store (arr!10494 _values!506) i!548 (ValueCellFull!4190 v!373)) (size!10846 _values!506)))))

(assert (=> b!377834 (= lt!175893 (getCurrentListMapNoExtraKeys!772 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!213889 () Bool)

(assert (=> start!37278 (=> (not res!213889) (not e!229998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37278 (= res!213889 (validMask!0 mask!970))))

(assert (=> start!37278 e!229998))

(declare-fun e!229994 () Bool)

(declare-fun array_inv!7782 (array!22052) Bool)

(assert (=> start!37278 (and (array_inv!7782 _values!506) e!229994)))

(assert (=> start!37278 tp!29972))

(assert (=> start!37278 true))

(assert (=> start!37278 tp_is_empty!9067))

(declare-fun array_inv!7783 (array!22050) Bool)

(assert (=> start!37278 (array_inv!7783 _keys!658)))

(declare-fun b!377835 () Bool)

(declare-fun e!229992 () Bool)

(assert (=> b!377835 (= e!229994 (and e!229992 mapRes!15165))))

(declare-fun condMapEmpty!15165 () Bool)

(declare-fun mapDefault!15165 () ValueCell!4190)

(assert (=> b!377835 (= condMapEmpty!15165 (= (arr!10494 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4190)) mapDefault!15165)))))

(declare-fun b!377836 () Bool)

(assert (=> b!377836 (= e!229992 tp_is_empty!9067)))

(declare-fun mapNonEmpty!15165 () Bool)

(declare-fun tp!29973 () Bool)

(assert (=> mapNonEmpty!15165 (= mapRes!15165 (and tp!29973 e!229993))))

(declare-fun mapRest!15165 () (Array (_ BitVec 32) ValueCell!4190))

(declare-fun mapKey!15165 () (_ BitVec 32))

(declare-fun mapValue!15165 () ValueCell!4190)

(assert (=> mapNonEmpty!15165 (= (arr!10494 _values!506) (store mapRest!15165 mapKey!15165 mapValue!15165))))

(assert (= (and start!37278 res!213889) b!377824))

(assert (= (and b!377824 res!213888) b!377829))

(assert (= (and b!377829 res!213896) b!377825))

(assert (= (and b!377825 res!213894) b!377830))

(assert (= (and b!377830 res!213895) b!377822))

(assert (= (and b!377822 res!213892) b!377828))

(assert (= (and b!377828 res!213890) b!377823))

(assert (= (and b!377823 res!213898) b!377826))

(assert (= (and b!377826 res!213893) b!377833))

(assert (= (and b!377833 res!213891) b!377834))

(assert (= (and b!377834 (not res!213897)) b!377827))

(assert (= (and b!377827 (not res!213899)) b!377831))

(assert (= (and b!377835 condMapEmpty!15165) mapIsEmpty!15165))

(assert (= (and b!377835 (not condMapEmpty!15165)) mapNonEmpty!15165))

(get-info :version)

(assert (= (and mapNonEmpty!15165 ((_ is ValueCellFull!4190) mapValue!15165)) b!377832))

(assert (= (and b!377835 ((_ is ValueCellFull!4190) mapDefault!15165)) b!377836))

(assert (= start!37278 b!377835))

(declare-fun m!374897 () Bool)

(assert (=> start!37278 m!374897))

(declare-fun m!374899 () Bool)

(assert (=> start!37278 m!374899))

(declare-fun m!374901 () Bool)

(assert (=> start!37278 m!374901))

(declare-fun m!374903 () Bool)

(assert (=> b!377823 m!374903))

(declare-fun m!374905 () Bool)

(assert (=> b!377833 m!374905))

(declare-fun m!374907 () Bool)

(assert (=> mapNonEmpty!15165 m!374907))

(declare-fun m!374909 () Bool)

(assert (=> b!377822 m!374909))

(declare-fun m!374911 () Bool)

(assert (=> b!377826 m!374911))

(declare-fun m!374913 () Bool)

(assert (=> b!377826 m!374913))

(declare-fun m!374915 () Bool)

(assert (=> b!377827 m!374915))

(declare-fun m!374917 () Bool)

(assert (=> b!377827 m!374917))

(declare-fun m!374919 () Bool)

(assert (=> b!377827 m!374919))

(declare-fun m!374921 () Bool)

(assert (=> b!377825 m!374921))

(declare-fun m!374923 () Bool)

(assert (=> b!377829 m!374923))

(declare-fun m!374925 () Bool)

(assert (=> b!377828 m!374925))

(declare-fun m!374927 () Bool)

(assert (=> b!377834 m!374927))

(declare-fun m!374929 () Bool)

(assert (=> b!377834 m!374929))

(declare-fun m!374931 () Bool)

(assert (=> b!377834 m!374931))

(declare-fun m!374933 () Bool)

(assert (=> b!377834 m!374933))

(declare-fun m!374935 () Bool)

(assert (=> b!377834 m!374935))

(declare-fun m!374937 () Bool)

(assert (=> b!377834 m!374937))

(declare-fun m!374939 () Bool)

(assert (=> b!377834 m!374939))

(declare-fun m!374941 () Bool)

(assert (=> b!377831 m!374941))

(declare-fun m!374943 () Bool)

(assert (=> b!377831 m!374943))

(check-sat (not b!377825) (not b!377826) tp_is_empty!9067 (not mapNonEmpty!15165) (not b!377834) (not b!377827) (not b!377833) (not b!377822) b_and!15675 (not b_next!8419) (not b!377831) (not b!377823) (not b!377829) (not start!37278))
(check-sat b_and!15675 (not b_next!8419))
