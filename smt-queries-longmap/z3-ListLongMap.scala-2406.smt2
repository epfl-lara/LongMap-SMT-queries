; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38062 () Bool)

(assert start!38062)

(declare-fun b_free!9001 () Bool)

(declare-fun b_next!9001 () Bool)

(assert (=> start!38062 (= b_free!9001 (not b_next!9001))))

(declare-fun tp!31779 () Bool)

(declare-fun b_and!16313 () Bool)

(assert (=> start!38062 (= tp!31779 b_and!16313)))

(declare-fun res!224400 () Bool)

(declare-fun e!237295 () Bool)

(assert (=> start!38062 (=> (not res!224400) (not e!237295))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38062 (= res!224400 (validMask!0 mask!970))))

(assert (=> start!38062 e!237295))

(declare-datatypes ((V!14003 0))(
  ( (V!14004 (val!4881 Int)) )
))
(declare-datatypes ((ValueCell!4493 0))(
  ( (ValueCellFull!4493 (v!7104 V!14003)) (EmptyCell!4493) )
))
(declare-datatypes ((array!23235 0))(
  ( (array!23236 (arr!11078 (Array (_ BitVec 32) ValueCell!4493)) (size!11431 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23235)

(declare-fun e!237297 () Bool)

(declare-fun array_inv!8136 (array!23235) Bool)

(assert (=> start!38062 (and (array_inv!8136 _values!506) e!237297)))

(assert (=> start!38062 tp!31779))

(assert (=> start!38062 true))

(declare-fun tp_is_empty!9673 () Bool)

(assert (=> start!38062 tp_is_empty!9673))

(declare-datatypes ((array!23237 0))(
  ( (array!23238 (arr!11079 (Array (_ BitVec 32) (_ BitVec 64))) (size!11432 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23237)

(declare-fun array_inv!8137 (array!23237) Bool)

(assert (=> start!38062 (array_inv!8137 _keys!658)))

(declare-fun b!391851 () Bool)

(declare-fun e!237300 () Bool)

(assert (=> b!391851 (= e!237300 tp_is_empty!9673)))

(declare-fun b!391852 () Bool)

(declare-fun res!224391 () Bool)

(assert (=> b!391852 (=> (not res!224391) (not e!237295))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391852 (= res!224391 (or (= (select (arr!11079 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11079 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391853 () Bool)

(declare-fun e!237298 () Bool)

(declare-fun e!237299 () Bool)

(assert (=> b!391853 (= e!237298 (not e!237299))))

(declare-fun res!224393 () Bool)

(assert (=> b!391853 (=> res!224393 e!237299)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391853 (= res!224393 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14003)

(declare-datatypes ((tuple2!6552 0))(
  ( (tuple2!6553 (_1!3287 (_ BitVec 64)) (_2!3287 V!14003)) )
))
(declare-datatypes ((List!6395 0))(
  ( (Nil!6392) (Cons!6391 (h!7247 tuple2!6552) (t!11552 List!6395)) )
))
(declare-datatypes ((ListLongMap!5455 0))(
  ( (ListLongMap!5456 (toList!2743 List!6395)) )
))
(declare-fun lt!185003 () ListLongMap!5455)

(declare-fun minValue!472 () V!14003)

(declare-fun getCurrentListMap!2064 (array!23237 array!23235 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5455)

(assert (=> b!391853 (= lt!185003 (getCurrentListMap!2064 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184997 () array!23235)

(declare-fun lt!184999 () array!23237)

(declare-fun lt!185000 () ListLongMap!5455)

(assert (=> b!391853 (= lt!185000 (getCurrentListMap!2064 lt!184999 lt!184997 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184996 () ListLongMap!5455)

(declare-fun lt!185002 () ListLongMap!5455)

(assert (=> b!391853 (and (= lt!184996 lt!185002) (= lt!185002 lt!184996))))

(declare-fun lt!185004 () ListLongMap!5455)

(declare-fun v!373 () V!14003)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1063 (ListLongMap!5455 tuple2!6552) ListLongMap!5455)

(assert (=> b!391853 (= lt!185002 (+!1063 lt!185004 (tuple2!6553 k0!778 v!373)))))

(declare-datatypes ((Unit!11976 0))(
  ( (Unit!11977) )
))
(declare-fun lt!185001 () Unit!11976)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!265 (array!23237 array!23235 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) (_ BitVec 64) V!14003 (_ BitVec 32) Int) Unit!11976)

(assert (=> b!391853 (= lt!185001 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!265 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!974 (array!23237 array!23235 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5455)

(assert (=> b!391853 (= lt!184996 (getCurrentListMapNoExtraKeys!974 lt!184999 lt!184997 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391853 (= lt!184997 (array!23236 (store (arr!11078 _values!506) i!548 (ValueCellFull!4493 v!373)) (size!11431 _values!506)))))

(assert (=> b!391853 (= lt!185004 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391854 () Bool)

(declare-fun e!237296 () Bool)

(assert (=> b!391854 (= e!237296 tp_is_empty!9673)))

(declare-fun b!391855 () Bool)

(declare-fun res!224394 () Bool)

(assert (=> b!391855 (=> (not res!224394) (not e!237298))))

(declare-datatypes ((List!6396 0))(
  ( (Nil!6393) (Cons!6392 (h!7248 (_ BitVec 64)) (t!11553 List!6396)) )
))
(declare-fun arrayNoDuplicates!0 (array!23237 (_ BitVec 32) List!6396) Bool)

(assert (=> b!391855 (= res!224394 (arrayNoDuplicates!0 lt!184999 #b00000000000000000000000000000000 Nil!6393))))

(declare-fun b!391856 () Bool)

(declare-fun res!224396 () Bool)

(assert (=> b!391856 (=> (not res!224396) (not e!237295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23237 (_ BitVec 32)) Bool)

(assert (=> b!391856 (= res!224396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391857 () Bool)

(declare-fun res!224395 () Bool)

(assert (=> b!391857 (=> (not res!224395) (not e!237295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391857 (= res!224395 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16098 () Bool)

(declare-fun mapRes!16098 () Bool)

(assert (=> mapIsEmpty!16098 mapRes!16098))

(declare-fun b!391858 () Bool)

(declare-fun res!224390 () Bool)

(assert (=> b!391858 (=> (not res!224390) (not e!237295))))

(assert (=> b!391858 (= res!224390 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6393))))

(declare-fun b!391859 () Bool)

(declare-fun res!224398 () Bool)

(assert (=> b!391859 (=> (not res!224398) (not e!237295))))

(assert (=> b!391859 (= res!224398 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11432 _keys!658))))))

(declare-fun mapNonEmpty!16098 () Bool)

(declare-fun tp!31778 () Bool)

(assert (=> mapNonEmpty!16098 (= mapRes!16098 (and tp!31778 e!237296))))

(declare-fun mapRest!16098 () (Array (_ BitVec 32) ValueCell!4493))

(declare-fun mapValue!16098 () ValueCell!4493)

(declare-fun mapKey!16098 () (_ BitVec 32))

(assert (=> mapNonEmpty!16098 (= (arr!11078 _values!506) (store mapRest!16098 mapKey!16098 mapValue!16098))))

(declare-fun b!391860 () Bool)

(assert (=> b!391860 (= e!237297 (and e!237300 mapRes!16098))))

(declare-fun condMapEmpty!16098 () Bool)

(declare-fun mapDefault!16098 () ValueCell!4493)

(assert (=> b!391860 (= condMapEmpty!16098 (= (arr!11078 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4493)) mapDefault!16098)))))

(declare-fun b!391861 () Bool)

(assert (=> b!391861 (= e!237295 e!237298)))

(declare-fun res!224392 () Bool)

(assert (=> b!391861 (=> (not res!224392) (not e!237298))))

(assert (=> b!391861 (= res!224392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184999 mask!970))))

(assert (=> b!391861 (= lt!184999 (array!23238 (store (arr!11079 _keys!658) i!548 k0!778) (size!11432 _keys!658)))))

(declare-fun b!391862 () Bool)

(declare-fun res!224397 () Bool)

(assert (=> b!391862 (=> (not res!224397) (not e!237295))))

(assert (=> b!391862 (= res!224397 (and (= (size!11431 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11432 _keys!658) (size!11431 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391863 () Bool)

(declare-fun res!224399 () Bool)

(assert (=> b!391863 (=> (not res!224399) (not e!237295))))

(declare-fun arrayContainsKey!0 (array!23237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391863 (= res!224399 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun lt!184998 () tuple2!6552)

(declare-fun b!391864 () Bool)

(assert (=> b!391864 (= e!237299 (= lt!185000 (+!1063 lt!185002 lt!184998)))))

(assert (=> b!391864 (= lt!185000 (+!1063 lt!184996 lt!184998))))

(assert (=> b!391864 (= lt!184998 (tuple2!6553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!38062 res!224400) b!391862))

(assert (= (and b!391862 res!224397) b!391856))

(assert (= (and b!391856 res!224396) b!391858))

(assert (= (and b!391858 res!224390) b!391859))

(assert (= (and b!391859 res!224398) b!391857))

(assert (= (and b!391857 res!224395) b!391852))

(assert (= (and b!391852 res!224391) b!391863))

(assert (= (and b!391863 res!224399) b!391861))

(assert (= (and b!391861 res!224392) b!391855))

(assert (= (and b!391855 res!224394) b!391853))

(assert (= (and b!391853 (not res!224393)) b!391864))

(assert (= (and b!391860 condMapEmpty!16098) mapIsEmpty!16098))

(assert (= (and b!391860 (not condMapEmpty!16098)) mapNonEmpty!16098))

(get-info :version)

(assert (= (and mapNonEmpty!16098 ((_ is ValueCellFull!4493) mapValue!16098)) b!391854))

(assert (= (and b!391860 ((_ is ValueCellFull!4493) mapDefault!16098)) b!391851))

(assert (= start!38062 b!391860))

(declare-fun m!387797 () Bool)

(assert (=> b!391855 m!387797))

(declare-fun m!387799 () Bool)

(assert (=> b!391852 m!387799))

(declare-fun m!387801 () Bool)

(assert (=> b!391856 m!387801))

(declare-fun m!387803 () Bool)

(assert (=> b!391857 m!387803))

(declare-fun m!387805 () Bool)

(assert (=> b!391861 m!387805))

(declare-fun m!387807 () Bool)

(assert (=> b!391861 m!387807))

(declare-fun m!387809 () Bool)

(assert (=> start!38062 m!387809))

(declare-fun m!387811 () Bool)

(assert (=> start!38062 m!387811))

(declare-fun m!387813 () Bool)

(assert (=> start!38062 m!387813))

(declare-fun m!387815 () Bool)

(assert (=> b!391863 m!387815))

(declare-fun m!387817 () Bool)

(assert (=> mapNonEmpty!16098 m!387817))

(declare-fun m!387819 () Bool)

(assert (=> b!391864 m!387819))

(declare-fun m!387821 () Bool)

(assert (=> b!391864 m!387821))

(declare-fun m!387823 () Bool)

(assert (=> b!391858 m!387823))

(declare-fun m!387825 () Bool)

(assert (=> b!391853 m!387825))

(declare-fun m!387827 () Bool)

(assert (=> b!391853 m!387827))

(declare-fun m!387829 () Bool)

(assert (=> b!391853 m!387829))

(declare-fun m!387831 () Bool)

(assert (=> b!391853 m!387831))

(declare-fun m!387833 () Bool)

(assert (=> b!391853 m!387833))

(declare-fun m!387835 () Bool)

(assert (=> b!391853 m!387835))

(declare-fun m!387837 () Bool)

(assert (=> b!391853 m!387837))

(check-sat (not mapNonEmpty!16098) (not b!391853) (not b!391861) (not b!391858) (not b!391857) (not b!391856) (not b!391855) (not b_next!9001) b_and!16313 (not b!391863) tp_is_empty!9673 (not b!391864) (not start!38062))
(check-sat b_and!16313 (not b_next!9001))
