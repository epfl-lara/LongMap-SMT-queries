; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70592 () Bool)

(assert start!70592)

(declare-fun b_free!12769 () Bool)

(declare-fun b_next!12769 () Bool)

(assert (=> start!70592 (= b_free!12769 (not b_next!12769))))

(declare-fun tp!45037 () Bool)

(declare-fun b_and!21599 () Bool)

(assert (=> start!70592 (= tp!45037 b_and!21599)))

(declare-fun mapIsEmpty!23314 () Bool)

(declare-fun mapRes!23314 () Bool)

(assert (=> mapIsEmpty!23314 mapRes!23314))

(declare-fun b!818937 () Bool)

(declare-fun e!454607 () Bool)

(declare-fun e!454608 () Bool)

(assert (=> b!818937 (= e!454607 (not e!454608))))

(declare-fun res!558668 () Bool)

(assert (=> b!818937 (=> res!558668 e!454608)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818937 (= res!558668 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24307 0))(
  ( (V!24308 (val!7287 Int)) )
))
(declare-datatypes ((tuple2!9488 0))(
  ( (tuple2!9489 (_1!4755 (_ BitVec 64)) (_2!4755 V!24307)) )
))
(declare-datatypes ((List!15300 0))(
  ( (Nil!15297) (Cons!15296 (h!16431 tuple2!9488) (t!21619 List!15300)) )
))
(declare-datatypes ((ListLongMap!8313 0))(
  ( (ListLongMap!8314 (toList!4172 List!15300)) )
))
(declare-fun lt!366886 () ListLongMap!8313)

(declare-fun lt!366883 () ListLongMap!8313)

(assert (=> b!818937 (= lt!366886 lt!366883)))

(declare-fun zeroValueBefore!34 () V!24307)

(declare-datatypes ((array!45157 0))(
  ( (array!45158 (arr!21629 (Array (_ BitVec 32) (_ BitVec 64))) (size!22049 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45157)

(declare-fun zeroValueAfter!34 () V!24307)

(declare-datatypes ((ValueCell!6824 0))(
  ( (ValueCellFull!6824 (v!9716 V!24307)) (EmptyCell!6824) )
))
(declare-datatypes ((array!45159 0))(
  ( (array!45160 (arr!21630 (Array (_ BitVec 32) ValueCell!6824)) (size!22050 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45159)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24307)

(declare-datatypes ((Unit!27897 0))(
  ( (Unit!27898) )
))
(declare-fun lt!366885 () Unit!27897)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!358 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 V!24307 V!24307 (_ BitVec 32) Int) Unit!27897)

(assert (=> b!818937 (= lt!366885 (lemmaNoChangeToArrayThenSameMapNoExtras!358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2270 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 (_ BitVec 32) Int) ListLongMap!8313)

(assert (=> b!818937 (= lt!366883 (getCurrentListMapNoExtraKeys!2270 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818937 (= lt!366886 (getCurrentListMapNoExtraKeys!2270 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558669 () Bool)

(assert (=> start!70592 (=> (not res!558669) (not e!454607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70592 (= res!558669 (validMask!0 mask!1312))))

(assert (=> start!70592 e!454607))

(declare-fun tp_is_empty!14479 () Bool)

(assert (=> start!70592 tp_is_empty!14479))

(declare-fun array_inv!17325 (array!45157) Bool)

(assert (=> start!70592 (array_inv!17325 _keys!976)))

(assert (=> start!70592 true))

(declare-fun e!454605 () Bool)

(declare-fun array_inv!17326 (array!45159) Bool)

(assert (=> start!70592 (and (array_inv!17326 _values!788) e!454605)))

(assert (=> start!70592 tp!45037))

(declare-fun b!818938 () Bool)

(declare-fun e!454604 () Bool)

(assert (=> b!818938 (= e!454605 (and e!454604 mapRes!23314))))

(declare-fun condMapEmpty!23314 () Bool)

(declare-fun mapDefault!23314 () ValueCell!6824)

(assert (=> b!818938 (= condMapEmpty!23314 (= (arr!21630 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6824)) mapDefault!23314)))))

(declare-fun b!818939 () Bool)

(declare-fun res!558665 () Bool)

(assert (=> b!818939 (=> (not res!558665) (not e!454607))))

(declare-datatypes ((List!15301 0))(
  ( (Nil!15298) (Cons!15297 (h!16432 (_ BitVec 64)) (t!21620 List!15301)) )
))
(declare-fun arrayNoDuplicates!0 (array!45157 (_ BitVec 32) List!15301) Bool)

(assert (=> b!818939 (= res!558665 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15298))))

(declare-fun b!818940 () Bool)

(declare-fun e!454603 () Bool)

(assert (=> b!818940 (= e!454603 tp_is_empty!14479)))

(declare-fun mapNonEmpty!23314 () Bool)

(declare-fun tp!45036 () Bool)

(assert (=> mapNonEmpty!23314 (= mapRes!23314 (and tp!45036 e!454603))))

(declare-fun mapKey!23314 () (_ BitVec 32))

(declare-fun mapRest!23314 () (Array (_ BitVec 32) ValueCell!6824))

(declare-fun mapValue!23314 () ValueCell!6824)

(assert (=> mapNonEmpty!23314 (= (arr!21630 _values!788) (store mapRest!23314 mapKey!23314 mapValue!23314))))

(declare-fun b!818941 () Bool)

(declare-fun res!558666 () Bool)

(assert (=> b!818941 (=> (not res!558666) (not e!454607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45157 (_ BitVec 32)) Bool)

(assert (=> b!818941 (= res!558666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818942 () Bool)

(declare-fun res!558667 () Bool)

(assert (=> b!818942 (=> (not res!558667) (not e!454607))))

(assert (=> b!818942 (= res!558667 (and (= (size!22050 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22049 _keys!976) (size!22050 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818943 () Bool)

(assert (=> b!818943 (= e!454604 tp_is_empty!14479)))

(declare-fun b!818944 () Bool)

(assert (=> b!818944 (= e!454608 true)))

(declare-fun lt!366884 () ListLongMap!8313)

(declare-fun getCurrentListMap!2370 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 (_ BitVec 32) Int) ListLongMap!8313)

(assert (=> b!818944 (= lt!366884 (getCurrentListMap!2370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70592 res!558669) b!818942))

(assert (= (and b!818942 res!558667) b!818941))

(assert (= (and b!818941 res!558666) b!818939))

(assert (= (and b!818939 res!558665) b!818937))

(assert (= (and b!818937 (not res!558668)) b!818944))

(assert (= (and b!818938 condMapEmpty!23314) mapIsEmpty!23314))

(assert (= (and b!818938 (not condMapEmpty!23314)) mapNonEmpty!23314))

(get-info :version)

(assert (= (and mapNonEmpty!23314 ((_ is ValueCellFull!6824) mapValue!23314)) b!818940))

(assert (= (and b!818938 ((_ is ValueCellFull!6824) mapDefault!23314)) b!818943))

(assert (= start!70592 b!818938))

(declare-fun m!760807 () Bool)

(assert (=> b!818944 m!760807))

(declare-fun m!760809 () Bool)

(assert (=> b!818939 m!760809))

(declare-fun m!760811 () Bool)

(assert (=> mapNonEmpty!23314 m!760811))

(declare-fun m!760813 () Bool)

(assert (=> b!818937 m!760813))

(declare-fun m!760815 () Bool)

(assert (=> b!818937 m!760815))

(declare-fun m!760817 () Bool)

(assert (=> b!818937 m!760817))

(declare-fun m!760819 () Bool)

(assert (=> start!70592 m!760819))

(declare-fun m!760821 () Bool)

(assert (=> start!70592 m!760821))

(declare-fun m!760823 () Bool)

(assert (=> start!70592 m!760823))

(declare-fun m!760825 () Bool)

(assert (=> b!818941 m!760825))

(check-sat (not b!818939) (not start!70592) tp_is_empty!14479 (not b!818941) (not b!818937) (not b!818944) (not mapNonEmpty!23314) b_and!21599 (not b_next!12769))
(check-sat b_and!21599 (not b_next!12769))
