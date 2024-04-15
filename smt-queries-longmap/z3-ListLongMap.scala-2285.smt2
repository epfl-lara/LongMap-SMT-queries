; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37158 () Bool)

(assert start!37158)

(declare-fun b_free!8299 () Bool)

(declare-fun b_next!8299 () Bool)

(assert (=> start!37158 (= b_free!8299 (not b_next!8299))))

(declare-fun tp!29613 () Bool)

(declare-fun b_and!15515 () Bool)

(assert (=> start!37158 (= tp!29613 b_and!15515)))

(declare-fun mapIsEmpty!14985 () Bool)

(declare-fun mapRes!14985 () Bool)

(assert (=> mapIsEmpty!14985 mapRes!14985))

(declare-fun mapNonEmpty!14985 () Bool)

(declare-fun tp!29612 () Bool)

(declare-fun e!228413 () Bool)

(assert (=> mapNonEmpty!14985 (= mapRes!14985 (and tp!29612 e!228413))))

(declare-datatypes ((V!13035 0))(
  ( (V!13036 (val!4518 Int)) )
))
(declare-datatypes ((ValueCell!4130 0))(
  ( (ValueCellFull!4130 (v!6709 V!13035)) (EmptyCell!4130) )
))
(declare-fun mapValue!14985 () ValueCell!4130)

(declare-fun mapRest!14985 () (Array (_ BitVec 32) ValueCell!4130))

(declare-fun mapKey!14985 () (_ BitVec 32))

(declare-datatypes ((array!21811 0))(
  ( (array!21812 (arr!10374 (Array (_ BitVec 32) ValueCell!4130)) (size!10727 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21811)

(assert (=> mapNonEmpty!14985 (= (arr!10374 _values!506) (store mapRest!14985 mapKey!14985 mapValue!14985))))

(declare-fun b!374891 () Bool)

(declare-fun e!228414 () Bool)

(declare-fun tp_is_empty!8947 () Bool)

(assert (=> b!374891 (= e!228414 tp_is_empty!8947)))

(declare-fun b!374892 () Bool)

(declare-fun res!211600 () Bool)

(declare-fun e!228416 () Bool)

(assert (=> b!374892 (=> (not res!211600) (not e!228416))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374892 (= res!211600 (validKeyInArray!0 k0!778))))

(declare-fun b!374893 () Bool)

(declare-fun res!211596 () Bool)

(declare-fun e!228415 () Bool)

(assert (=> b!374893 (=> (not res!211596) (not e!228415))))

(declare-datatypes ((array!21813 0))(
  ( (array!21814 (arr!10375 (Array (_ BitVec 32) (_ BitVec 64))) (size!10728 (_ BitVec 32))) )
))
(declare-fun lt!173204 () array!21813)

(declare-datatypes ((List!5818 0))(
  ( (Nil!5815) (Cons!5814 (h!6670 (_ BitVec 64)) (t!10959 List!5818)) )
))
(declare-fun arrayNoDuplicates!0 (array!21813 (_ BitVec 32) List!5818) Bool)

(assert (=> b!374893 (= res!211596 (arrayNoDuplicates!0 lt!173204 #b00000000000000000000000000000000 Nil!5815))))

(declare-fun b!374894 () Bool)

(declare-fun res!211595 () Bool)

(assert (=> b!374894 (=> (not res!211595) (not e!228416))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21813)

(assert (=> b!374894 (= res!211595 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10728 _keys!658))))))

(declare-fun b!374895 () Bool)

(declare-fun e!228411 () Bool)

(declare-fun e!228410 () Bool)

(assert (=> b!374895 (= e!228411 e!228410)))

(declare-fun res!211603 () Bool)

(assert (=> b!374895 (=> res!211603 e!228410)))

(assert (=> b!374895 (= res!211603 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5986 0))(
  ( (tuple2!5987 (_1!3004 (_ BitVec 64)) (_2!3004 V!13035)) )
))
(declare-datatypes ((List!5819 0))(
  ( (Nil!5816) (Cons!5815 (h!6671 tuple2!5986) (t!10960 List!5819)) )
))
(declare-datatypes ((ListLongMap!4889 0))(
  ( (ListLongMap!4890 (toList!2460 List!5819)) )
))
(declare-fun lt!173203 () ListLongMap!4889)

(declare-fun lt!173209 () ListLongMap!4889)

(assert (=> b!374895 (= lt!173203 lt!173209)))

(declare-fun lt!173206 () ListLongMap!4889)

(declare-fun lt!173199 () tuple2!5986)

(declare-fun +!828 (ListLongMap!4889 tuple2!5986) ListLongMap!4889)

(assert (=> b!374895 (= lt!173209 (+!828 lt!173206 lt!173199))))

(declare-fun v!373 () V!13035)

(declare-fun zeroValue!472 () V!13035)

(declare-fun lt!173196 () ListLongMap!4889)

(declare-datatypes ((Unit!11528 0))(
  ( (Unit!11529) )
))
(declare-fun lt!173207 () Unit!11528)

(declare-fun addCommutativeForDiffKeys!244 (ListLongMap!4889 (_ BitVec 64) V!13035 (_ BitVec 64) V!13035) Unit!11528)

(assert (=> b!374895 (= lt!173207 (addCommutativeForDiffKeys!244 lt!173196 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173210 () ListLongMap!4889)

(declare-fun lt!173201 () tuple2!5986)

(assert (=> b!374895 (= lt!173210 (+!828 lt!173203 lt!173201))))

(declare-fun lt!173208 () ListLongMap!4889)

(declare-fun lt!173205 () tuple2!5986)

(assert (=> b!374895 (= lt!173203 (+!828 lt!173208 lt!173205))))

(declare-fun lt!173202 () ListLongMap!4889)

(declare-fun lt!173211 () ListLongMap!4889)

(assert (=> b!374895 (= lt!173202 lt!173211)))

(assert (=> b!374895 (= lt!173211 (+!828 lt!173206 lt!173201))))

(assert (=> b!374895 (= lt!173206 (+!828 lt!173196 lt!173205))))

(declare-fun lt!173195 () ListLongMap!4889)

(assert (=> b!374895 (= lt!173210 (+!828 (+!828 lt!173195 lt!173205) lt!173201))))

(declare-fun minValue!472 () V!13035)

(assert (=> b!374895 (= lt!173201 (tuple2!5987 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374895 (= lt!173205 (tuple2!5987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374896 () Bool)

(declare-fun res!211598 () Bool)

(assert (=> b!374896 (=> (not res!211598) (not e!228416))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21813 (_ BitVec 32)) Bool)

(assert (=> b!374896 (= res!211598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374897 () Bool)

(declare-fun res!211593 () Bool)

(assert (=> b!374897 (=> (not res!211593) (not e!228416))))

(assert (=> b!374897 (= res!211593 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5815))))

(declare-fun b!374898 () Bool)

(assert (=> b!374898 (= e!228416 e!228415)))

(declare-fun res!211597 () Bool)

(assert (=> b!374898 (=> (not res!211597) (not e!228415))))

(assert (=> b!374898 (= res!211597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173204 mask!970))))

(assert (=> b!374898 (= lt!173204 (array!21814 (store (arr!10375 _keys!658) i!548 k0!778) (size!10728 _keys!658)))))

(declare-fun b!374899 () Bool)

(declare-fun e!228409 () Bool)

(assert (=> b!374899 (= e!228409 (and e!228414 mapRes!14985))))

(declare-fun condMapEmpty!14985 () Bool)

(declare-fun mapDefault!14985 () ValueCell!4130)

(assert (=> b!374899 (= condMapEmpty!14985 (= (arr!10374 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4130)) mapDefault!14985)))))

(declare-fun b!374900 () Bool)

(declare-fun res!211594 () Bool)

(assert (=> b!374900 (=> (not res!211594) (not e!228416))))

(declare-fun arrayContainsKey!0 (array!21813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374900 (= res!211594 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!211601 () Bool)

(assert (=> start!37158 (=> (not res!211601) (not e!228416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37158 (= res!211601 (validMask!0 mask!970))))

(assert (=> start!37158 e!228416))

(declare-fun array_inv!7656 (array!21811) Bool)

(assert (=> start!37158 (and (array_inv!7656 _values!506) e!228409)))

(assert (=> start!37158 tp!29613))

(assert (=> start!37158 true))

(assert (=> start!37158 tp_is_empty!8947))

(declare-fun array_inv!7657 (array!21813) Bool)

(assert (=> start!37158 (array_inv!7657 _keys!658)))

(declare-fun b!374901 () Bool)

(declare-fun res!211599 () Bool)

(assert (=> b!374901 (=> (not res!211599) (not e!228416))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374901 (= res!211599 (and (= (size!10727 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10728 _keys!658) (size!10727 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374902 () Bool)

(assert (=> b!374902 (= e!228415 (not e!228411))))

(declare-fun res!211602 () Bool)

(assert (=> b!374902 (=> res!211602 e!228411)))

(assert (=> b!374902 (= res!211602 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1876 (array!21813 array!21811 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4889)

(assert (=> b!374902 (= lt!173202 (getCurrentListMap!1876 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173198 () array!21811)

(assert (=> b!374902 (= lt!173210 (getCurrentListMap!1876 lt!173204 lt!173198 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374902 (and (= lt!173195 lt!173208) (= lt!173208 lt!173195))))

(assert (=> b!374902 (= lt!173208 (+!828 lt!173196 lt!173199))))

(assert (=> b!374902 (= lt!173199 (tuple2!5987 k0!778 v!373))))

(declare-fun lt!173200 () Unit!11528)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!69 (array!21813 array!21811 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) (_ BitVec 64) V!13035 (_ BitVec 32) Int) Unit!11528)

(assert (=> b!374902 (= lt!173200 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!69 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!741 (array!21813 array!21811 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4889)

(assert (=> b!374902 (= lt!173195 (getCurrentListMapNoExtraKeys!741 lt!173204 lt!173198 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374902 (= lt!173198 (array!21812 (store (arr!10374 _values!506) i!548 (ValueCellFull!4130 v!373)) (size!10727 _values!506)))))

(assert (=> b!374902 (= lt!173196 (getCurrentListMapNoExtraKeys!741 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374903 () Bool)

(assert (=> b!374903 (= e!228413 tp_is_empty!8947)))

(declare-fun b!374904 () Bool)

(declare-fun res!211604 () Bool)

(assert (=> b!374904 (=> (not res!211604) (not e!228416))))

(assert (=> b!374904 (= res!211604 (or (= (select (arr!10375 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10375 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374905 () Bool)

(assert (=> b!374905 (= e!228410 true)))

(assert (=> b!374905 (= (+!828 lt!173209 lt!173201) (+!828 lt!173211 lt!173199))))

(declare-fun lt!173197 () Unit!11528)

(assert (=> b!374905 (= lt!173197 (addCommutativeForDiffKeys!244 lt!173206 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37158 res!211601) b!374901))

(assert (= (and b!374901 res!211599) b!374896))

(assert (= (and b!374896 res!211598) b!374897))

(assert (= (and b!374897 res!211593) b!374894))

(assert (= (and b!374894 res!211595) b!374892))

(assert (= (and b!374892 res!211600) b!374904))

(assert (= (and b!374904 res!211604) b!374900))

(assert (= (and b!374900 res!211594) b!374898))

(assert (= (and b!374898 res!211597) b!374893))

(assert (= (and b!374893 res!211596) b!374902))

(assert (= (and b!374902 (not res!211602)) b!374895))

(assert (= (and b!374895 (not res!211603)) b!374905))

(assert (= (and b!374899 condMapEmpty!14985) mapIsEmpty!14985))

(assert (= (and b!374899 (not condMapEmpty!14985)) mapNonEmpty!14985))

(get-info :version)

(assert (= (and mapNonEmpty!14985 ((_ is ValueCellFull!4130) mapValue!14985)) b!374903))

(assert (= (and b!374899 ((_ is ValueCellFull!4130) mapDefault!14985)) b!374891))

(assert (= start!37158 b!374899))

(declare-fun m!370931 () Bool)

(assert (=> b!374892 m!370931))

(declare-fun m!370933 () Bool)

(assert (=> b!374900 m!370933))

(declare-fun m!370935 () Bool)

(assert (=> mapNonEmpty!14985 m!370935))

(declare-fun m!370937 () Bool)

(assert (=> b!374905 m!370937))

(declare-fun m!370939 () Bool)

(assert (=> b!374905 m!370939))

(declare-fun m!370941 () Bool)

(assert (=> b!374905 m!370941))

(declare-fun m!370943 () Bool)

(assert (=> b!374895 m!370943))

(declare-fun m!370945 () Bool)

(assert (=> b!374895 m!370945))

(declare-fun m!370947 () Bool)

(assert (=> b!374895 m!370947))

(declare-fun m!370949 () Bool)

(assert (=> b!374895 m!370949))

(assert (=> b!374895 m!370949))

(declare-fun m!370951 () Bool)

(assert (=> b!374895 m!370951))

(declare-fun m!370953 () Bool)

(assert (=> b!374895 m!370953))

(declare-fun m!370955 () Bool)

(assert (=> b!374895 m!370955))

(declare-fun m!370957 () Bool)

(assert (=> b!374895 m!370957))

(declare-fun m!370959 () Bool)

(assert (=> b!374893 m!370959))

(declare-fun m!370961 () Bool)

(assert (=> b!374902 m!370961))

(declare-fun m!370963 () Bool)

(assert (=> b!374902 m!370963))

(declare-fun m!370965 () Bool)

(assert (=> b!374902 m!370965))

(declare-fun m!370967 () Bool)

(assert (=> b!374902 m!370967))

(declare-fun m!370969 () Bool)

(assert (=> b!374902 m!370969))

(declare-fun m!370971 () Bool)

(assert (=> b!374902 m!370971))

(declare-fun m!370973 () Bool)

(assert (=> b!374902 m!370973))

(declare-fun m!370975 () Bool)

(assert (=> b!374904 m!370975))

(declare-fun m!370977 () Bool)

(assert (=> start!37158 m!370977))

(declare-fun m!370979 () Bool)

(assert (=> start!37158 m!370979))

(declare-fun m!370981 () Bool)

(assert (=> start!37158 m!370981))

(declare-fun m!370983 () Bool)

(assert (=> b!374898 m!370983))

(declare-fun m!370985 () Bool)

(assert (=> b!374898 m!370985))

(declare-fun m!370987 () Bool)

(assert (=> b!374897 m!370987))

(declare-fun m!370989 () Bool)

(assert (=> b!374896 m!370989))

(check-sat (not b!374905) (not b!374896) tp_is_empty!8947 b_and!15515 (not start!37158) (not b!374897) (not b!374898) (not b!374893) (not b!374892) (not b_next!8299) (not b!374895) (not b!374900) (not mapNonEmpty!14985) (not b!374902))
(check-sat b_and!15515 (not b_next!8299))
