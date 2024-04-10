; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70584 () Bool)

(assert start!70584)

(declare-fun b_free!12891 () Bool)

(declare-fun b_next!12891 () Bool)

(assert (=> start!70584 (= b_free!12891 (not b_next!12891))))

(declare-fun tp!45409 () Bool)

(declare-fun b_and!21733 () Bool)

(assert (=> start!70584 (= tp!45409 b_and!21733)))

(declare-fun b!819980 () Bool)

(declare-fun e!455478 () Bool)

(declare-fun e!455472 () Bool)

(assert (=> b!819980 (= e!455478 (not e!455472))))

(declare-fun res!559520 () Bool)

(assert (=> b!819980 (=> res!559520 e!455472)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819980 (= res!559520 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24469 0))(
  ( (V!24470 (val!7348 Int)) )
))
(declare-datatypes ((tuple2!9676 0))(
  ( (tuple2!9677 (_1!4849 (_ BitVec 64)) (_2!4849 V!24469)) )
))
(declare-datatypes ((List!15499 0))(
  ( (Nil!15496) (Cons!15495 (h!16624 tuple2!9676) (t!21830 List!15499)) )
))
(declare-datatypes ((ListLongMap!8499 0))(
  ( (ListLongMap!8500 (toList!4265 List!15499)) )
))
(declare-fun lt!368311 () ListLongMap!8499)

(declare-fun lt!368308 () ListLongMap!8499)

(assert (=> b!819980 (= lt!368311 lt!368308)))

(declare-fun zeroValueBefore!34 () V!24469)

(declare-datatypes ((array!45398 0))(
  ( (array!45399 (arr!21752 (Array (_ BitVec 32) (_ BitVec 64))) (size!22173 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45398)

(declare-fun zeroValueAfter!34 () V!24469)

(declare-fun minValue!754 () V!24469)

(declare-datatypes ((ValueCell!6885 0))(
  ( (ValueCellFull!6885 (v!9778 V!24469)) (EmptyCell!6885) )
))
(declare-datatypes ((array!45400 0))(
  ( (array!45401 (arr!21753 (Array (_ BitVec 32) ValueCell!6885)) (size!22174 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45400)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28009 0))(
  ( (Unit!28010) )
))
(declare-fun lt!368309 () Unit!28009)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!404 (array!45398 array!45400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24469 V!24469 V!24469 V!24469 (_ BitVec 32) Int) Unit!28009)

(assert (=> b!819980 (= lt!368309 (lemmaNoChangeToArrayThenSameMapNoExtras!404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2294 (array!45398 array!45400 (_ BitVec 32) (_ BitVec 32) V!24469 V!24469 (_ BitVec 32) Int) ListLongMap!8499)

(assert (=> b!819980 (= lt!368308 (getCurrentListMapNoExtraKeys!2294 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819980 (= lt!368311 (getCurrentListMapNoExtraKeys!2294 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819981 () Bool)

(declare-fun res!559515 () Bool)

(assert (=> b!819981 (=> (not res!559515) (not e!455478))))

(assert (=> b!819981 (= res!559515 (and (= (size!22174 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22173 _keys!976) (size!22174 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819982 () Bool)

(declare-fun e!455476 () Bool)

(declare-fun tp_is_empty!14601 () Bool)

(assert (=> b!819982 (= e!455476 tp_is_empty!14601)))

(declare-fun b!819983 () Bool)

(declare-fun res!559517 () Bool)

(assert (=> b!819983 (=> (not res!559517) (not e!455478))))

(declare-datatypes ((List!15500 0))(
  ( (Nil!15497) (Cons!15496 (h!16625 (_ BitVec 64)) (t!21831 List!15500)) )
))
(declare-fun arrayNoDuplicates!0 (array!45398 (_ BitVec 32) List!15500) Bool)

(assert (=> b!819983 (= res!559517 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15497))))

(declare-fun b!819984 () Bool)

(declare-fun res!559518 () Bool)

(assert (=> b!819984 (=> (not res!559518) (not e!455478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45398 (_ BitVec 32)) Bool)

(assert (=> b!819984 (= res!559518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun lt!368315 () ListLongMap!8499)

(declare-fun b!819985 () Bool)

(declare-fun e!455474 () Bool)

(declare-fun +!1860 (ListLongMap!8499 tuple2!9676) ListLongMap!8499)

(assert (=> b!819985 (= e!455474 (= lt!368315 (+!1860 lt!368308 (tuple2!9677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819986 () Bool)

(declare-fun e!455473 () Bool)

(declare-fun e!455475 () Bool)

(declare-fun mapRes!23503 () Bool)

(assert (=> b!819986 (= e!455473 (and e!455475 mapRes!23503))))

(declare-fun condMapEmpty!23503 () Bool)

(declare-fun mapDefault!23503 () ValueCell!6885)

(assert (=> b!819986 (= condMapEmpty!23503 (= (arr!21753 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6885)) mapDefault!23503)))))

(declare-fun mapIsEmpty!23503 () Bool)

(assert (=> mapIsEmpty!23503 mapRes!23503))

(declare-fun b!819987 () Bool)

(assert (=> b!819987 (= e!455472 true)))

(declare-fun lt!368312 () ListLongMap!8499)

(declare-fun lt!368310 () tuple2!9676)

(declare-fun lt!368316 () tuple2!9676)

(assert (=> b!819987 (= lt!368312 (+!1860 (+!1860 lt!368308 lt!368316) lt!368310))))

(declare-fun lt!368307 () ListLongMap!8499)

(assert (=> b!819987 (= (+!1860 lt!368311 lt!368310) (+!1860 lt!368307 lt!368310))))

(declare-fun lt!368313 () Unit!28009)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!197 (ListLongMap!8499 (_ BitVec 64) V!24469 V!24469) Unit!28009)

(assert (=> b!819987 (= lt!368313 (addSameAsAddTwiceSameKeyDiffValues!197 lt!368311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819987 (= lt!368310 (tuple2!9677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819987 e!455474))

(declare-fun res!559519 () Bool)

(assert (=> b!819987 (=> (not res!559519) (not e!455474))))

(declare-fun lt!368314 () ListLongMap!8499)

(assert (=> b!819987 (= res!559519 (= lt!368314 lt!368307))))

(assert (=> b!819987 (= lt!368307 (+!1860 lt!368311 lt!368316))))

(assert (=> b!819987 (= lt!368316 (tuple2!9677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2463 (array!45398 array!45400 (_ BitVec 32) (_ BitVec 32) V!24469 V!24469 (_ BitVec 32) Int) ListLongMap!8499)

(assert (=> b!819987 (= lt!368315 (getCurrentListMap!2463 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819987 (= lt!368314 (getCurrentListMap!2463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819988 () Bool)

(assert (=> b!819988 (= e!455475 tp_is_empty!14601)))

(declare-fun res!559516 () Bool)

(assert (=> start!70584 (=> (not res!559516) (not e!455478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70584 (= res!559516 (validMask!0 mask!1312))))

(assert (=> start!70584 e!455478))

(assert (=> start!70584 tp_is_empty!14601))

(declare-fun array_inv!17387 (array!45398) Bool)

(assert (=> start!70584 (array_inv!17387 _keys!976)))

(assert (=> start!70584 true))

(declare-fun array_inv!17388 (array!45400) Bool)

(assert (=> start!70584 (and (array_inv!17388 _values!788) e!455473)))

(assert (=> start!70584 tp!45409))

(declare-fun mapNonEmpty!23503 () Bool)

(declare-fun tp!45408 () Bool)

(assert (=> mapNonEmpty!23503 (= mapRes!23503 (and tp!45408 e!455476))))

(declare-fun mapKey!23503 () (_ BitVec 32))

(declare-fun mapRest!23503 () (Array (_ BitVec 32) ValueCell!6885))

(declare-fun mapValue!23503 () ValueCell!6885)

(assert (=> mapNonEmpty!23503 (= (arr!21753 _values!788) (store mapRest!23503 mapKey!23503 mapValue!23503))))

(assert (= (and start!70584 res!559516) b!819981))

(assert (= (and b!819981 res!559515) b!819984))

(assert (= (and b!819984 res!559518) b!819983))

(assert (= (and b!819983 res!559517) b!819980))

(assert (= (and b!819980 (not res!559520)) b!819987))

(assert (= (and b!819987 res!559519) b!819985))

(assert (= (and b!819986 condMapEmpty!23503) mapIsEmpty!23503))

(assert (= (and b!819986 (not condMapEmpty!23503)) mapNonEmpty!23503))

(get-info :version)

(assert (= (and mapNonEmpty!23503 ((_ is ValueCellFull!6885) mapValue!23503)) b!819982))

(assert (= (and b!819986 ((_ is ValueCellFull!6885) mapDefault!23503)) b!819988))

(assert (= start!70584 b!819986))

(declare-fun m!761783 () Bool)

(assert (=> b!819984 m!761783))

(declare-fun m!761785 () Bool)

(assert (=> mapNonEmpty!23503 m!761785))

(declare-fun m!761787 () Bool)

(assert (=> b!819987 m!761787))

(declare-fun m!761789 () Bool)

(assert (=> b!819987 m!761789))

(declare-fun m!761791 () Bool)

(assert (=> b!819987 m!761791))

(declare-fun m!761793 () Bool)

(assert (=> b!819987 m!761793))

(declare-fun m!761795 () Bool)

(assert (=> b!819987 m!761795))

(assert (=> b!819987 m!761793))

(declare-fun m!761797 () Bool)

(assert (=> b!819987 m!761797))

(declare-fun m!761799 () Bool)

(assert (=> b!819987 m!761799))

(declare-fun m!761801 () Bool)

(assert (=> b!819987 m!761801))

(declare-fun m!761803 () Bool)

(assert (=> b!819983 m!761803))

(declare-fun m!761805 () Bool)

(assert (=> b!819985 m!761805))

(declare-fun m!761807 () Bool)

(assert (=> start!70584 m!761807))

(declare-fun m!761809 () Bool)

(assert (=> start!70584 m!761809))

(declare-fun m!761811 () Bool)

(assert (=> start!70584 m!761811))

(declare-fun m!761813 () Bool)

(assert (=> b!819980 m!761813))

(declare-fun m!761815 () Bool)

(assert (=> b!819980 m!761815))

(declare-fun m!761817 () Bool)

(assert (=> b!819980 m!761817))

(check-sat (not b!819985) (not b!819987) tp_is_empty!14601 (not b!819984) (not mapNonEmpty!23503) (not b!819983) (not start!70584) (not b_next!12891) b_and!21733 (not b!819980))
(check-sat b_and!21733 (not b_next!12891))
