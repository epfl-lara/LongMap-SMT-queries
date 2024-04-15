; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70774 () Bool)

(assert start!70774)

(declare-fun b_free!13051 () Bool)

(declare-fun b_next!13051 () Bool)

(assert (=> start!70774 (= b_free!13051 (not b_next!13051))))

(declare-fun tp!45897 () Bool)

(declare-fun b_and!21897 () Bool)

(assert (=> start!70774 (= tp!45897 b_and!21897)))

(declare-fun b!822040 () Bool)

(declare-fun e!456995 () Bool)

(declare-fun tp_is_empty!14761 () Bool)

(assert (=> b!822040 (= e!456995 tp_is_empty!14761)))

(declare-fun b!822041 () Bool)

(declare-fun res!560752 () Bool)

(declare-fun e!456999 () Bool)

(assert (=> b!822041 (=> (not res!560752) (not e!456999))))

(declare-datatypes ((array!45683 0))(
  ( (array!45684 (arr!21892 (Array (_ BitVec 32) (_ BitVec 64))) (size!22313 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45683)

(declare-datatypes ((List!15623 0))(
  ( (Nil!15620) (Cons!15619 (h!16748 (_ BitVec 64)) (t!21951 List!15623)) )
))
(declare-fun arrayNoDuplicates!0 (array!45683 (_ BitVec 32) List!15623) Bool)

(assert (=> b!822041 (= res!560752 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15620))))

(declare-fun b!822042 () Bool)

(declare-fun e!456998 () Bool)

(assert (=> b!822042 (= e!456998 true)))

(declare-datatypes ((V!24683 0))(
  ( (V!24684 (val!7428 Int)) )
))
(declare-datatypes ((tuple2!9810 0))(
  ( (tuple2!9811 (_1!4916 (_ BitVec 64)) (_2!4916 V!24683)) )
))
(declare-datatypes ((List!15624 0))(
  ( (Nil!15621) (Cons!15620 (h!16749 tuple2!9810) (t!21952 List!15624)) )
))
(declare-datatypes ((ListLongMap!8623 0))(
  ( (ListLongMap!8624 (toList!4327 List!15624)) )
))
(declare-fun lt!369683 () ListLongMap!8623)

(declare-fun lt!369675 () ListLongMap!8623)

(declare-fun lt!369677 () tuple2!9810)

(declare-fun +!1908 (ListLongMap!8623 tuple2!9810) ListLongMap!8623)

(assert (=> b!822042 (= lt!369683 (+!1908 lt!369675 lt!369677))))

(declare-fun lt!369682 () ListLongMap!8623)

(declare-fun zeroValueAfter!34 () V!24683)

(declare-fun minValue!754 () V!24683)

(declare-datatypes ((Unit!28074 0))(
  ( (Unit!28075) )
))
(declare-fun lt!369679 () Unit!28074)

(declare-fun addCommutativeForDiffKeys!439 (ListLongMap!8623 (_ BitVec 64) V!24683 (_ BitVec 64) V!24683) Unit!28074)

(assert (=> b!822042 (= lt!369679 (addCommutativeForDiffKeys!439 lt!369682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369684 () ListLongMap!8623)

(assert (=> b!822042 (= lt!369684 lt!369683)))

(declare-fun lt!369681 () tuple2!9810)

(assert (=> b!822042 (= lt!369683 (+!1908 (+!1908 lt!369682 lt!369677) lt!369681))))

(assert (=> b!822042 (= lt!369677 (tuple2!9811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369680 () ListLongMap!8623)

(assert (=> b!822042 (= lt!369680 lt!369675)))

(assert (=> b!822042 (= lt!369675 (+!1908 lt!369682 lt!369681))))

(assert (=> b!822042 (= lt!369681 (tuple2!9811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6965 0))(
  ( (ValueCellFull!6965 (v!9853 V!24683)) (EmptyCell!6965) )
))
(declare-datatypes ((array!45685 0))(
  ( (array!45686 (arr!21893 (Array (_ BitVec 32) ValueCell!6965)) (size!22314 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45685)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2450 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8623)

(assert (=> b!822042 (= lt!369684 (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24683)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822042 (= lt!369680 (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822043 () Bool)

(declare-fun res!560749 () Bool)

(assert (=> b!822043 (=> (not res!560749) (not e!456999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45683 (_ BitVec 32)) Bool)

(assert (=> b!822043 (= res!560749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560753 () Bool)

(assert (=> start!70774 (=> (not res!560753) (not e!456999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70774 (= res!560753 (validMask!0 mask!1312))))

(assert (=> start!70774 e!456999))

(assert (=> start!70774 tp_is_empty!14761))

(declare-fun array_inv!17551 (array!45683) Bool)

(assert (=> start!70774 (array_inv!17551 _keys!976)))

(assert (=> start!70774 true))

(declare-fun e!456996 () Bool)

(declare-fun array_inv!17552 (array!45685) Bool)

(assert (=> start!70774 (and (array_inv!17552 _values!788) e!456996)))

(assert (=> start!70774 tp!45897))

(declare-fun b!822044 () Bool)

(declare-fun res!560751 () Bool)

(assert (=> b!822044 (=> (not res!560751) (not e!456999))))

(assert (=> b!822044 (= res!560751 (and (= (size!22314 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22313 _keys!976) (size!22314 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23752 () Bool)

(declare-fun mapRes!23752 () Bool)

(declare-fun tp!45898 () Bool)

(declare-fun e!456994 () Bool)

(assert (=> mapNonEmpty!23752 (= mapRes!23752 (and tp!45898 e!456994))))

(declare-fun mapRest!23752 () (Array (_ BitVec 32) ValueCell!6965))

(declare-fun mapKey!23752 () (_ BitVec 32))

(declare-fun mapValue!23752 () ValueCell!6965)

(assert (=> mapNonEmpty!23752 (= (arr!21893 _values!788) (store mapRest!23752 mapKey!23752 mapValue!23752))))

(declare-fun b!822045 () Bool)

(assert (=> b!822045 (= e!456994 tp_is_empty!14761)))

(declare-fun b!822046 () Bool)

(assert (=> b!822046 (= e!456996 (and e!456995 mapRes!23752))))

(declare-fun condMapEmpty!23752 () Bool)

(declare-fun mapDefault!23752 () ValueCell!6965)

(assert (=> b!822046 (= condMapEmpty!23752 (= (arr!21893 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6965)) mapDefault!23752)))))

(declare-fun mapIsEmpty!23752 () Bool)

(assert (=> mapIsEmpty!23752 mapRes!23752))

(declare-fun b!822047 () Bool)

(assert (=> b!822047 (= e!456999 (not e!456998))))

(declare-fun res!560750 () Bool)

(assert (=> b!822047 (=> res!560750 e!456998)))

(assert (=> b!822047 (= res!560750 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369678 () ListLongMap!8623)

(assert (=> b!822047 (= lt!369682 lt!369678)))

(declare-fun lt!369676 () Unit!28074)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!467 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 V!24683 V!24683 (_ BitVec 32) Int) Unit!28074)

(assert (=> b!822047 (= lt!369676 (lemmaNoChangeToArrayThenSameMapNoExtras!467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2374 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8623)

(assert (=> b!822047 (= lt!369678 (getCurrentListMapNoExtraKeys!2374 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822047 (= lt!369682 (getCurrentListMapNoExtraKeys!2374 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70774 res!560753) b!822044))

(assert (= (and b!822044 res!560751) b!822043))

(assert (= (and b!822043 res!560749) b!822041))

(assert (= (and b!822041 res!560752) b!822047))

(assert (= (and b!822047 (not res!560750)) b!822042))

(assert (= (and b!822046 condMapEmpty!23752) mapIsEmpty!23752))

(assert (= (and b!822046 (not condMapEmpty!23752)) mapNonEmpty!23752))

(get-info :version)

(assert (= (and mapNonEmpty!23752 ((_ is ValueCellFull!6965) mapValue!23752)) b!822045))

(assert (= (and b!822046 ((_ is ValueCellFull!6965) mapDefault!23752)) b!822040))

(assert (= start!70774 b!822046))

(declare-fun m!763337 () Bool)

(assert (=> b!822041 m!763337))

(declare-fun m!763339 () Bool)

(assert (=> b!822047 m!763339))

(declare-fun m!763341 () Bool)

(assert (=> b!822047 m!763341))

(declare-fun m!763343 () Bool)

(assert (=> b!822047 m!763343))

(declare-fun m!763345 () Bool)

(assert (=> mapNonEmpty!23752 m!763345))

(declare-fun m!763347 () Bool)

(assert (=> b!822043 m!763347))

(declare-fun m!763349 () Bool)

(assert (=> b!822042 m!763349))

(declare-fun m!763351 () Bool)

(assert (=> b!822042 m!763351))

(declare-fun m!763353 () Bool)

(assert (=> b!822042 m!763353))

(declare-fun m!763355 () Bool)

(assert (=> b!822042 m!763355))

(declare-fun m!763357 () Bool)

(assert (=> b!822042 m!763357))

(declare-fun m!763359 () Bool)

(assert (=> b!822042 m!763359))

(assert (=> b!822042 m!763351))

(declare-fun m!763361 () Bool)

(assert (=> b!822042 m!763361))

(declare-fun m!763363 () Bool)

(assert (=> start!70774 m!763363))

(declare-fun m!763365 () Bool)

(assert (=> start!70774 m!763365))

(declare-fun m!763367 () Bool)

(assert (=> start!70774 m!763367))

(check-sat b_and!21897 (not mapNonEmpty!23752) (not b_next!13051) (not start!70774) tp_is_empty!14761 (not b!822047) (not b!822041) (not b!822042) (not b!822043))
(check-sat b_and!21897 (not b_next!13051))
