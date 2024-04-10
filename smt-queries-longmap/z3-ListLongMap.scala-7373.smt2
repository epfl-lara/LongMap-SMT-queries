; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93980 () Bool)

(assert start!93980)

(declare-fun b_free!21417 () Bool)

(declare-fun b_next!21417 () Bool)

(assert (=> start!93980 (= b_free!21417 (not b_next!21417))))

(declare-fun tp!75679 () Bool)

(declare-fun b_and!34149 () Bool)

(assert (=> start!93980 (= tp!75679 b_and!34149)))

(declare-fun b!1062863 () Bool)

(declare-fun res!709670 () Bool)

(declare-fun e!605501 () Bool)

(assert (=> b!1062863 (=> (not res!709670) (not e!605501))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38771 0))(
  ( (V!38772 (val!12664 Int)) )
))
(declare-datatypes ((ValueCell!11910 0))(
  ( (ValueCellFull!11910 (v!15275 V!38771)) (EmptyCell!11910) )
))
(declare-datatypes ((array!67459 0))(
  ( (array!67460 (arr!32435 (Array (_ BitVec 32) ValueCell!11910)) (size!32971 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67459)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67461 0))(
  ( (array!67462 (arr!32436 (Array (_ BitVec 32) (_ BitVec 64))) (size!32972 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67461)

(assert (=> b!1062863 (= res!709670 (and (= (size!32971 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32972 _keys!1163) (size!32971 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062864 () Bool)

(declare-fun e!605498 () Bool)

(assert (=> b!1062864 (= e!605498 true)))

(declare-datatypes ((tuple2!16028 0))(
  ( (tuple2!16029 (_1!8025 (_ BitVec 64)) (_2!8025 V!38771)) )
))
(declare-datatypes ((List!22608 0))(
  ( (Nil!22605) (Cons!22604 (h!23813 tuple2!16028) (t!31921 List!22608)) )
))
(declare-datatypes ((ListLongMap!13997 0))(
  ( (ListLongMap!13998 (toList!7014 List!22608)) )
))
(declare-fun lt!468373 () ListLongMap!13997)

(declare-fun -!577 (ListLongMap!13997 (_ BitVec 64)) ListLongMap!13997)

(assert (=> b!1062864 (= (-!577 lt!468373 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468373)))

(declare-datatypes ((Unit!34828 0))(
  ( (Unit!34829) )
))
(declare-fun lt!468372 () Unit!34828)

(declare-fun removeNotPresentStillSame!24 (ListLongMap!13997 (_ BitVec 64)) Unit!34828)

(assert (=> b!1062864 (= lt!468372 (removeNotPresentStillSame!24 lt!468373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062865 () Bool)

(declare-fun e!605500 () Bool)

(declare-fun tp_is_empty!25227 () Bool)

(assert (=> b!1062865 (= e!605500 tp_is_empty!25227)))

(declare-fun res!709667 () Bool)

(assert (=> start!93980 (=> (not res!709667) (not e!605501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93980 (= res!709667 (validMask!0 mask!1515))))

(assert (=> start!93980 e!605501))

(assert (=> start!93980 true))

(assert (=> start!93980 tp_is_empty!25227))

(declare-fun e!605496 () Bool)

(declare-fun array_inv!25126 (array!67459) Bool)

(assert (=> start!93980 (and (array_inv!25126 _values!955) e!605496)))

(assert (=> start!93980 tp!75679))

(declare-fun array_inv!25127 (array!67461) Bool)

(assert (=> start!93980 (array_inv!25127 _keys!1163)))

(declare-fun b!1062866 () Bool)

(declare-fun res!709666 () Bool)

(assert (=> b!1062866 (=> (not res!709666) (not e!605501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67461 (_ BitVec 32)) Bool)

(assert (=> b!1062866 (= res!709666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062867 () Bool)

(declare-fun e!605497 () Bool)

(assert (=> b!1062867 (= e!605497 tp_is_empty!25227)))

(declare-fun b!1062868 () Bool)

(declare-fun e!605499 () Bool)

(assert (=> b!1062868 (= e!605499 e!605498)))

(declare-fun res!709668 () Bool)

(assert (=> b!1062868 (=> res!709668 e!605498)))

(declare-fun contains!6246 (ListLongMap!13997 (_ BitVec 64)) Bool)

(assert (=> b!1062868 (= res!709668 (contains!6246 lt!468373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38771)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38771)

(declare-fun getCurrentListMap!3998 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) V!38771 V!38771 (_ BitVec 32) Int) ListLongMap!13997)

(assert (=> b!1062868 (= lt!468373 (getCurrentListMap!3998 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062869 () Bool)

(declare-fun mapRes!39517 () Bool)

(assert (=> b!1062869 (= e!605496 (and e!605500 mapRes!39517))))

(declare-fun condMapEmpty!39517 () Bool)

(declare-fun mapDefault!39517 () ValueCell!11910)

(assert (=> b!1062869 (= condMapEmpty!39517 (= (arr!32435 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11910)) mapDefault!39517)))))

(declare-fun b!1062870 () Bool)

(declare-fun res!709671 () Bool)

(assert (=> b!1062870 (=> (not res!709671) (not e!605501))))

(declare-datatypes ((List!22609 0))(
  ( (Nil!22606) (Cons!22605 (h!23814 (_ BitVec 64)) (t!31922 List!22609)) )
))
(declare-fun arrayNoDuplicates!0 (array!67461 (_ BitVec 32) List!22609) Bool)

(assert (=> b!1062870 (= res!709671 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22606))))

(declare-fun mapNonEmpty!39517 () Bool)

(declare-fun tp!75680 () Bool)

(assert (=> mapNonEmpty!39517 (= mapRes!39517 (and tp!75680 e!605497))))

(declare-fun mapValue!39517 () ValueCell!11910)

(declare-fun mapKey!39517 () (_ BitVec 32))

(declare-fun mapRest!39517 () (Array (_ BitVec 32) ValueCell!11910))

(assert (=> mapNonEmpty!39517 (= (arr!32435 _values!955) (store mapRest!39517 mapKey!39517 mapValue!39517))))

(declare-fun b!1062871 () Bool)

(assert (=> b!1062871 (= e!605501 (not e!605499))))

(declare-fun res!709669 () Bool)

(assert (=> b!1062871 (=> res!709669 e!605499)))

(assert (=> b!1062871 (= res!709669 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468374 () ListLongMap!13997)

(declare-fun lt!468375 () ListLongMap!13997)

(assert (=> b!1062871 (= lt!468374 lt!468375)))

(declare-fun lt!468371 () Unit!34828)

(declare-fun zeroValueAfter!47 () V!38771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!644 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38771 V!38771 V!38771 V!38771 (_ BitVec 32) Int) Unit!34828)

(assert (=> b!1062871 (= lt!468371 (lemmaNoChangeToArrayThenSameMapNoExtras!644 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3607 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) V!38771 V!38771 (_ BitVec 32) Int) ListLongMap!13997)

(assert (=> b!1062871 (= lt!468375 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062871 (= lt!468374 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39517 () Bool)

(assert (=> mapIsEmpty!39517 mapRes!39517))

(assert (= (and start!93980 res!709667) b!1062863))

(assert (= (and b!1062863 res!709670) b!1062866))

(assert (= (and b!1062866 res!709666) b!1062870))

(assert (= (and b!1062870 res!709671) b!1062871))

(assert (= (and b!1062871 (not res!709669)) b!1062868))

(assert (= (and b!1062868 (not res!709668)) b!1062864))

(assert (= (and b!1062869 condMapEmpty!39517) mapIsEmpty!39517))

(assert (= (and b!1062869 (not condMapEmpty!39517)) mapNonEmpty!39517))

(get-info :version)

(assert (= (and mapNonEmpty!39517 ((_ is ValueCellFull!11910) mapValue!39517)) b!1062867))

(assert (= (and b!1062869 ((_ is ValueCellFull!11910) mapDefault!39517)) b!1062865))

(assert (= start!93980 b!1062869))

(declare-fun m!981575 () Bool)

(assert (=> start!93980 m!981575))

(declare-fun m!981577 () Bool)

(assert (=> start!93980 m!981577))

(declare-fun m!981579 () Bool)

(assert (=> start!93980 m!981579))

(declare-fun m!981581 () Bool)

(assert (=> b!1062870 m!981581))

(declare-fun m!981583 () Bool)

(assert (=> b!1062864 m!981583))

(declare-fun m!981585 () Bool)

(assert (=> b!1062864 m!981585))

(declare-fun m!981587 () Bool)

(assert (=> b!1062868 m!981587))

(declare-fun m!981589 () Bool)

(assert (=> b!1062868 m!981589))

(declare-fun m!981591 () Bool)

(assert (=> b!1062871 m!981591))

(declare-fun m!981593 () Bool)

(assert (=> b!1062871 m!981593))

(declare-fun m!981595 () Bool)

(assert (=> b!1062871 m!981595))

(declare-fun m!981597 () Bool)

(assert (=> mapNonEmpty!39517 m!981597))

(declare-fun m!981599 () Bool)

(assert (=> b!1062866 m!981599))

(check-sat (not b!1062864) (not start!93980) (not b!1062868) (not b!1062866) (not b_next!21417) (not mapNonEmpty!39517) tp_is_empty!25227 (not b!1062870) (not b!1062871) b_and!34149)
(check-sat b_and!34149 (not b_next!21417))
