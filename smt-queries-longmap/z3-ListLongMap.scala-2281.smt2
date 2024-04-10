; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37150 () Bool)

(assert start!37150)

(declare-fun b_free!8277 () Bool)

(declare-fun b_next!8277 () Bool)

(assert (=> start!37150 (= b_free!8277 (not b_next!8277))))

(declare-fun tp!29546 () Bool)

(declare-fun b_and!15519 () Bool)

(assert (=> start!37150 (= tp!29546 b_and!15519)))

(declare-fun b!374667 () Bool)

(declare-fun res!211333 () Bool)

(declare-fun e!228319 () Bool)

(assert (=> b!374667 (=> (not res!211333) (not e!228319))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13005 0))(
  ( (V!13006 (val!4507 Int)) )
))
(declare-datatypes ((ValueCell!4119 0))(
  ( (ValueCellFull!4119 (v!6704 V!13005)) (EmptyCell!4119) )
))
(declare-datatypes ((array!21789 0))(
  ( (array!21790 (arr!10363 (Array (_ BitVec 32) ValueCell!4119)) (size!10715 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21789)

(declare-datatypes ((array!21791 0))(
  ( (array!21792 (arr!10364 (Array (_ BitVec 32) (_ BitVec 64))) (size!10716 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21791)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!374667 (= res!211333 (and (= (size!10715 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10716 _keys!658) (size!10715 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374668 () Bool)

(declare-fun e!228321 () Bool)

(declare-fun tp_is_empty!8925 () Bool)

(assert (=> b!374668 (= e!228321 tp_is_empty!8925)))

(declare-fun mapIsEmpty!14952 () Bool)

(declare-fun mapRes!14952 () Bool)

(assert (=> mapIsEmpty!14952 mapRes!14952))

(declare-fun b!374669 () Bool)

(declare-fun e!228324 () Bool)

(assert (=> b!374669 (= e!228319 e!228324)))

(declare-fun res!211337 () Bool)

(assert (=> b!374669 (=> (not res!211337) (not e!228324))))

(declare-fun lt!172883 () array!21791)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21791 (_ BitVec 32)) Bool)

(assert (=> b!374669 (= res!211337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172883 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374669 (= lt!172883 (array!21792 (store (arr!10364 _keys!658) i!548 k0!778) (size!10716 _keys!658)))))

(declare-fun b!374670 () Bool)

(declare-fun e!228326 () Bool)

(assert (=> b!374670 (= e!228324 (not e!228326))))

(declare-fun res!211331 () Bool)

(assert (=> b!374670 (=> res!211331 e!228326)))

(assert (=> b!374670 (= res!211331 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5994 0))(
  ( (tuple2!5995 (_1!3008 (_ BitVec 64)) (_2!3008 V!13005)) )
))
(declare-datatypes ((List!5839 0))(
  ( (Nil!5836) (Cons!5835 (h!6691 tuple2!5994) (t!10989 List!5839)) )
))
(declare-datatypes ((ListLongMap!4907 0))(
  ( (ListLongMap!4908 (toList!2469 List!5839)) )
))
(declare-fun lt!172879 () ListLongMap!4907)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13005)

(declare-fun minValue!472 () V!13005)

(declare-fun getCurrentListMap!1906 (array!21791 array!21789 (_ BitVec 32) (_ BitVec 32) V!13005 V!13005 (_ BitVec 32) Int) ListLongMap!4907)

(assert (=> b!374670 (= lt!172879 (getCurrentListMap!1906 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172869 () array!21789)

(declare-fun lt!172877 () ListLongMap!4907)

(assert (=> b!374670 (= lt!172877 (getCurrentListMap!1906 lt!172883 lt!172869 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172881 () ListLongMap!4907)

(declare-fun lt!172880 () ListLongMap!4907)

(assert (=> b!374670 (and (= lt!172881 lt!172880) (= lt!172880 lt!172881))))

(declare-fun lt!172874 () ListLongMap!4907)

(declare-fun lt!172872 () tuple2!5994)

(declare-fun +!815 (ListLongMap!4907 tuple2!5994) ListLongMap!4907)

(assert (=> b!374670 (= lt!172880 (+!815 lt!172874 lt!172872))))

(declare-fun v!373 () V!13005)

(assert (=> b!374670 (= lt!172872 (tuple2!5995 k0!778 v!373))))

(declare-datatypes ((Unit!11536 0))(
  ( (Unit!11537) )
))
(declare-fun lt!172868 () Unit!11536)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!64 (array!21791 array!21789 (_ BitVec 32) (_ BitVec 32) V!13005 V!13005 (_ BitVec 32) (_ BitVec 64) V!13005 (_ BitVec 32) Int) Unit!11536)

(assert (=> b!374670 (= lt!172868 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!64 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!740 (array!21791 array!21789 (_ BitVec 32) (_ BitVec 32) V!13005 V!13005 (_ BitVec 32) Int) ListLongMap!4907)

(assert (=> b!374670 (= lt!172881 (getCurrentListMapNoExtraKeys!740 lt!172883 lt!172869 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374670 (= lt!172869 (array!21790 (store (arr!10363 _values!506) i!548 (ValueCellFull!4119 v!373)) (size!10715 _values!506)))))

(assert (=> b!374670 (= lt!172874 (getCurrentListMapNoExtraKeys!740 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14952 () Bool)

(declare-fun tp!29547 () Bool)

(assert (=> mapNonEmpty!14952 (= mapRes!14952 (and tp!29547 e!228321))))

(declare-fun mapKey!14952 () (_ BitVec 32))

(declare-fun mapValue!14952 () ValueCell!4119)

(declare-fun mapRest!14952 () (Array (_ BitVec 32) ValueCell!4119))

(assert (=> mapNonEmpty!14952 (= (arr!10363 _values!506) (store mapRest!14952 mapKey!14952 mapValue!14952))))

(declare-fun b!374672 () Bool)

(declare-fun e!228320 () Bool)

(assert (=> b!374672 (= e!228326 e!228320)))

(declare-fun res!211336 () Bool)

(assert (=> b!374672 (=> res!211336 e!228320)))

(assert (=> b!374672 (= res!211336 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172882 () ListLongMap!4907)

(declare-fun lt!172884 () ListLongMap!4907)

(assert (=> b!374672 (= lt!172882 lt!172884)))

(declare-fun lt!172873 () ListLongMap!4907)

(assert (=> b!374672 (= lt!172884 (+!815 lt!172873 lt!172872))))

(declare-fun lt!172871 () Unit!11536)

(declare-fun addCommutativeForDiffKeys!238 (ListLongMap!4907 (_ BitVec 64) V!13005 (_ BitVec 64) V!13005) Unit!11536)

(assert (=> b!374672 (= lt!172871 (addCommutativeForDiffKeys!238 lt!172874 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172876 () tuple2!5994)

(assert (=> b!374672 (= lt!172877 (+!815 lt!172882 lt!172876))))

(declare-fun lt!172870 () tuple2!5994)

(assert (=> b!374672 (= lt!172882 (+!815 lt!172880 lt!172870))))

(declare-fun lt!172878 () ListLongMap!4907)

(assert (=> b!374672 (= lt!172879 lt!172878)))

(assert (=> b!374672 (= lt!172878 (+!815 lt!172873 lt!172876))))

(assert (=> b!374672 (= lt!172873 (+!815 lt!172874 lt!172870))))

(assert (=> b!374672 (= lt!172877 (+!815 (+!815 lt!172881 lt!172870) lt!172876))))

(assert (=> b!374672 (= lt!172876 (tuple2!5995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374672 (= lt!172870 (tuple2!5995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374673 () Bool)

(declare-fun res!211329 () Bool)

(assert (=> b!374673 (=> (not res!211329) (not e!228319))))

(assert (=> b!374673 (= res!211329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374674 () Bool)

(declare-fun res!211334 () Bool)

(assert (=> b!374674 (=> (not res!211334) (not e!228319))))

(declare-fun arrayContainsKey!0 (array!21791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374674 (= res!211334 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374675 () Bool)

(declare-fun res!211330 () Bool)

(assert (=> b!374675 (=> (not res!211330) (not e!228324))))

(declare-datatypes ((List!5840 0))(
  ( (Nil!5837) (Cons!5836 (h!6692 (_ BitVec 64)) (t!10990 List!5840)) )
))
(declare-fun arrayNoDuplicates!0 (array!21791 (_ BitVec 32) List!5840) Bool)

(assert (=> b!374675 (= res!211330 (arrayNoDuplicates!0 lt!172883 #b00000000000000000000000000000000 Nil!5837))))

(declare-fun b!374676 () Bool)

(declare-fun e!228322 () Bool)

(assert (=> b!374676 (= e!228322 tp_is_empty!8925)))

(declare-fun b!374677 () Bool)

(declare-fun res!211327 () Bool)

(assert (=> b!374677 (=> (not res!211327) (not e!228319))))

(assert (=> b!374677 (= res!211327 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10716 _keys!658))))))

(declare-fun b!374678 () Bool)

(declare-fun e!228323 () Bool)

(assert (=> b!374678 (= e!228323 (and e!228322 mapRes!14952))))

(declare-fun condMapEmpty!14952 () Bool)

(declare-fun mapDefault!14952 () ValueCell!4119)

(assert (=> b!374678 (= condMapEmpty!14952 (= (arr!10363 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4119)) mapDefault!14952)))))

(declare-fun b!374679 () Bool)

(declare-fun res!211332 () Bool)

(assert (=> b!374679 (=> (not res!211332) (not e!228319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374679 (= res!211332 (validKeyInArray!0 k0!778))))

(declare-fun b!374680 () Bool)

(assert (=> b!374680 (= e!228320 true)))

(assert (=> b!374680 (= (+!815 lt!172884 lt!172876) (+!815 lt!172878 lt!172872))))

(declare-fun lt!172875 () Unit!11536)

(assert (=> b!374680 (= lt!172875 (addCommutativeForDiffKeys!238 lt!172873 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374681 () Bool)

(declare-fun res!211328 () Bool)

(assert (=> b!374681 (=> (not res!211328) (not e!228319))))

(assert (=> b!374681 (= res!211328 (or (= (select (arr!10364 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10364 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!211335 () Bool)

(assert (=> start!37150 (=> (not res!211335) (not e!228319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37150 (= res!211335 (validMask!0 mask!970))))

(assert (=> start!37150 e!228319))

(declare-fun array_inv!7644 (array!21789) Bool)

(assert (=> start!37150 (and (array_inv!7644 _values!506) e!228323)))

(assert (=> start!37150 tp!29546))

(assert (=> start!37150 true))

(assert (=> start!37150 tp_is_empty!8925))

(declare-fun array_inv!7645 (array!21791) Bool)

(assert (=> start!37150 (array_inv!7645 _keys!658)))

(declare-fun b!374671 () Bool)

(declare-fun res!211326 () Bool)

(assert (=> b!374671 (=> (not res!211326) (not e!228319))))

(assert (=> b!374671 (= res!211326 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5837))))

(assert (= (and start!37150 res!211335) b!374667))

(assert (= (and b!374667 res!211333) b!374673))

(assert (= (and b!374673 res!211329) b!374671))

(assert (= (and b!374671 res!211326) b!374677))

(assert (= (and b!374677 res!211327) b!374679))

(assert (= (and b!374679 res!211332) b!374681))

(assert (= (and b!374681 res!211328) b!374674))

(assert (= (and b!374674 res!211334) b!374669))

(assert (= (and b!374669 res!211337) b!374675))

(assert (= (and b!374675 res!211330) b!374670))

(assert (= (and b!374670 (not res!211331)) b!374672))

(assert (= (and b!374672 (not res!211336)) b!374680))

(assert (= (and b!374678 condMapEmpty!14952) mapIsEmpty!14952))

(assert (= (and b!374678 (not condMapEmpty!14952)) mapNonEmpty!14952))

(get-info :version)

(assert (= (and mapNonEmpty!14952 ((_ is ValueCellFull!4119) mapValue!14952)) b!374668))

(assert (= (and b!374678 ((_ is ValueCellFull!4119) mapDefault!14952)) b!374676))

(assert (= start!37150 b!374678))

(declare-fun m!370995 () Bool)

(assert (=> b!374681 m!370995))

(declare-fun m!370997 () Bool)

(assert (=> b!374674 m!370997))

(declare-fun m!370999 () Bool)

(assert (=> b!374670 m!370999))

(declare-fun m!371001 () Bool)

(assert (=> b!374670 m!371001))

(declare-fun m!371003 () Bool)

(assert (=> b!374670 m!371003))

(declare-fun m!371005 () Bool)

(assert (=> b!374670 m!371005))

(declare-fun m!371007 () Bool)

(assert (=> b!374670 m!371007))

(declare-fun m!371009 () Bool)

(assert (=> b!374670 m!371009))

(declare-fun m!371011 () Bool)

(assert (=> b!374670 m!371011))

(declare-fun m!371013 () Bool)

(assert (=> b!374672 m!371013))

(declare-fun m!371015 () Bool)

(assert (=> b!374672 m!371015))

(declare-fun m!371017 () Bool)

(assert (=> b!374672 m!371017))

(declare-fun m!371019 () Bool)

(assert (=> b!374672 m!371019))

(declare-fun m!371021 () Bool)

(assert (=> b!374672 m!371021))

(declare-fun m!371023 () Bool)

(assert (=> b!374672 m!371023))

(assert (=> b!374672 m!371017))

(declare-fun m!371025 () Bool)

(assert (=> b!374672 m!371025))

(declare-fun m!371027 () Bool)

(assert (=> b!374672 m!371027))

(declare-fun m!371029 () Bool)

(assert (=> b!374671 m!371029))

(declare-fun m!371031 () Bool)

(assert (=> start!37150 m!371031))

(declare-fun m!371033 () Bool)

(assert (=> start!37150 m!371033))

(declare-fun m!371035 () Bool)

(assert (=> start!37150 m!371035))

(declare-fun m!371037 () Bool)

(assert (=> b!374679 m!371037))

(declare-fun m!371039 () Bool)

(assert (=> b!374675 m!371039))

(declare-fun m!371041 () Bool)

(assert (=> mapNonEmpty!14952 m!371041))

(declare-fun m!371043 () Bool)

(assert (=> b!374680 m!371043))

(declare-fun m!371045 () Bool)

(assert (=> b!374680 m!371045))

(declare-fun m!371047 () Bool)

(assert (=> b!374680 m!371047))

(declare-fun m!371049 () Bool)

(assert (=> b!374669 m!371049))

(declare-fun m!371051 () Bool)

(assert (=> b!374669 m!371051))

(declare-fun m!371053 () Bool)

(assert (=> b!374673 m!371053))

(check-sat (not b!374675) (not start!37150) tp_is_empty!8925 (not b!374674) (not b!374672) (not b!374673) b_and!15519 (not b!374679) (not b!374671) (not b!374670) (not mapNonEmpty!14952) (not b_next!8277) (not b!374680) (not b!374669))
(check-sat b_and!15519 (not b_next!8277))
