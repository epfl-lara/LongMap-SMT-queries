; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70578 () Bool)

(assert start!70578)

(declare-fun b_free!12885 () Bool)

(declare-fun b_next!12885 () Bool)

(assert (=> start!70578 (= b_free!12885 (not b_next!12885))))

(declare-fun tp!45391 () Bool)

(declare-fun b_and!21727 () Bool)

(assert (=> start!70578 (= tp!45391 b_and!21727)))

(declare-fun b!819899 () Bool)

(declare-fun res!559464 () Bool)

(declare-fun e!455410 () Bool)

(assert (=> b!819899 (=> (not res!559464) (not e!455410))))

(declare-datatypes ((array!45386 0))(
  ( (array!45387 (arr!21746 (Array (_ BitVec 32) (_ BitVec 64))) (size!22167 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45386)

(declare-datatypes ((List!15494 0))(
  ( (Nil!15491) (Cons!15490 (h!16619 (_ BitVec 64)) (t!21825 List!15494)) )
))
(declare-fun arrayNoDuplicates!0 (array!45386 (_ BitVec 32) List!15494) Bool)

(assert (=> b!819899 (= res!559464 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15491))))

(declare-fun res!559465 () Bool)

(assert (=> start!70578 (=> (not res!559465) (not e!455410))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70578 (= res!559465 (validMask!0 mask!1312))))

(assert (=> start!70578 e!455410))

(declare-fun tp_is_empty!14595 () Bool)

(assert (=> start!70578 tp_is_empty!14595))

(declare-fun array_inv!17383 (array!45386) Bool)

(assert (=> start!70578 (array_inv!17383 _keys!976)))

(assert (=> start!70578 true))

(declare-datatypes ((V!24461 0))(
  ( (V!24462 (val!7345 Int)) )
))
(declare-datatypes ((ValueCell!6882 0))(
  ( (ValueCellFull!6882 (v!9775 V!24461)) (EmptyCell!6882) )
))
(declare-datatypes ((array!45388 0))(
  ( (array!45389 (arr!21747 (Array (_ BitVec 32) ValueCell!6882)) (size!22168 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45388)

(declare-fun e!455414 () Bool)

(declare-fun array_inv!17384 (array!45388) Bool)

(assert (=> start!70578 (and (array_inv!17384 _values!788) e!455414)))

(assert (=> start!70578 tp!45391))

(declare-fun mapNonEmpty!23494 () Bool)

(declare-fun mapRes!23494 () Bool)

(declare-fun tp!45390 () Bool)

(declare-fun e!455413 () Bool)

(assert (=> mapNonEmpty!23494 (= mapRes!23494 (and tp!45390 e!455413))))

(declare-fun mapRest!23494 () (Array (_ BitVec 32) ValueCell!6882))

(declare-fun mapKey!23494 () (_ BitVec 32))

(declare-fun mapValue!23494 () ValueCell!6882)

(assert (=> mapNonEmpty!23494 (= (arr!21747 _values!788) (store mapRest!23494 mapKey!23494 mapValue!23494))))

(declare-fun b!819900 () Bool)

(declare-fun e!455415 () Bool)

(assert (=> b!819900 (= e!455410 (not e!455415))))

(declare-fun res!559463 () Bool)

(assert (=> b!819900 (=> res!559463 e!455415)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819900 (= res!559463 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9672 0))(
  ( (tuple2!9673 (_1!4847 (_ BitVec 64)) (_2!4847 V!24461)) )
))
(declare-datatypes ((List!15495 0))(
  ( (Nil!15492) (Cons!15491 (h!16620 tuple2!9672) (t!21826 List!15495)) )
))
(declare-datatypes ((ListLongMap!8495 0))(
  ( (ListLongMap!8496 (toList!4263 List!15495)) )
))
(declare-fun lt!368224 () ListLongMap!8495)

(declare-fun lt!368223 () ListLongMap!8495)

(assert (=> b!819900 (= lt!368224 lt!368223)))

(declare-fun zeroValueBefore!34 () V!24461)

(declare-fun zeroValueAfter!34 () V!24461)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24461)

(declare-datatypes ((Unit!28005 0))(
  ( (Unit!28006) )
))
(declare-fun lt!368222 () Unit!28005)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!402 (array!45386 array!45388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24461 V!24461 V!24461 V!24461 (_ BitVec 32) Int) Unit!28005)

(assert (=> b!819900 (= lt!368222 (lemmaNoChangeToArrayThenSameMapNoExtras!402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2292 (array!45386 array!45388 (_ BitVec 32) (_ BitVec 32) V!24461 V!24461 (_ BitVec 32) Int) ListLongMap!8495)

(assert (=> b!819900 (= lt!368223 (getCurrentListMapNoExtraKeys!2292 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819900 (= lt!368224 (getCurrentListMapNoExtraKeys!2292 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819901 () Bool)

(assert (=> b!819901 (= e!455413 tp_is_empty!14595)))

(declare-fun b!819902 () Bool)

(declare-fun res!559462 () Bool)

(assert (=> b!819902 (=> (not res!559462) (not e!455410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45386 (_ BitVec 32)) Bool)

(assert (=> b!819902 (= res!559462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun lt!368217 () ListLongMap!8495)

(declare-fun e!455412 () Bool)

(declare-fun b!819903 () Bool)

(declare-fun +!1858 (ListLongMap!8495 tuple2!9672) ListLongMap!8495)

(assert (=> b!819903 (= e!455412 (= lt!368217 (+!1858 lt!368223 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819904 () Bool)

(declare-fun res!559461 () Bool)

(assert (=> b!819904 (=> (not res!559461) (not e!455410))))

(assert (=> b!819904 (= res!559461 (and (= (size!22168 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22167 _keys!976) (size!22168 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23494 () Bool)

(assert (=> mapIsEmpty!23494 mapRes!23494))

(declare-fun b!819905 () Bool)

(assert (=> b!819905 (= e!455415 true)))

(declare-fun lt!368219 () ListLongMap!8495)

(declare-fun lt!368226 () tuple2!9672)

(declare-fun lt!368218 () tuple2!9672)

(assert (=> b!819905 (= lt!368219 (+!1858 (+!1858 lt!368223 lt!368226) lt!368218))))

(declare-fun lt!368221 () ListLongMap!8495)

(assert (=> b!819905 (= (+!1858 lt!368224 lt!368218) (+!1858 lt!368221 lt!368218))))

(declare-fun lt!368220 () Unit!28005)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!195 (ListLongMap!8495 (_ BitVec 64) V!24461 V!24461) Unit!28005)

(assert (=> b!819905 (= lt!368220 (addSameAsAddTwiceSameKeyDiffValues!195 lt!368224 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819905 (= lt!368218 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819905 e!455412))

(declare-fun res!559466 () Bool)

(assert (=> b!819905 (=> (not res!559466) (not e!455412))))

(declare-fun lt!368225 () ListLongMap!8495)

(assert (=> b!819905 (= res!559466 (= lt!368225 lt!368221))))

(assert (=> b!819905 (= lt!368221 (+!1858 lt!368224 lt!368226))))

(assert (=> b!819905 (= lt!368226 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2461 (array!45386 array!45388 (_ BitVec 32) (_ BitVec 32) V!24461 V!24461 (_ BitVec 32) Int) ListLongMap!8495)

(assert (=> b!819905 (= lt!368217 (getCurrentListMap!2461 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819905 (= lt!368225 (getCurrentListMap!2461 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819906 () Bool)

(declare-fun e!455409 () Bool)

(assert (=> b!819906 (= e!455409 tp_is_empty!14595)))

(declare-fun b!819907 () Bool)

(assert (=> b!819907 (= e!455414 (and e!455409 mapRes!23494))))

(declare-fun condMapEmpty!23494 () Bool)

(declare-fun mapDefault!23494 () ValueCell!6882)

(assert (=> b!819907 (= condMapEmpty!23494 (= (arr!21747 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6882)) mapDefault!23494)))))

(assert (= (and start!70578 res!559465) b!819904))

(assert (= (and b!819904 res!559461) b!819902))

(assert (= (and b!819902 res!559462) b!819899))

(assert (= (and b!819899 res!559464) b!819900))

(assert (= (and b!819900 (not res!559463)) b!819905))

(assert (= (and b!819905 res!559466) b!819903))

(assert (= (and b!819907 condMapEmpty!23494) mapIsEmpty!23494))

(assert (= (and b!819907 (not condMapEmpty!23494)) mapNonEmpty!23494))

(get-info :version)

(assert (= (and mapNonEmpty!23494 ((_ is ValueCellFull!6882) mapValue!23494)) b!819901))

(assert (= (and b!819907 ((_ is ValueCellFull!6882) mapDefault!23494)) b!819906))

(assert (= start!70578 b!819907))

(declare-fun m!761675 () Bool)

(assert (=> b!819899 m!761675))

(declare-fun m!761677 () Bool)

(assert (=> mapNonEmpty!23494 m!761677))

(declare-fun m!761679 () Bool)

(assert (=> b!819902 m!761679))

(declare-fun m!761681 () Bool)

(assert (=> b!819900 m!761681))

(declare-fun m!761683 () Bool)

(assert (=> b!819900 m!761683))

(declare-fun m!761685 () Bool)

(assert (=> b!819900 m!761685))

(declare-fun m!761687 () Bool)

(assert (=> b!819905 m!761687))

(declare-fun m!761689 () Bool)

(assert (=> b!819905 m!761689))

(declare-fun m!761691 () Bool)

(assert (=> b!819905 m!761691))

(declare-fun m!761693 () Bool)

(assert (=> b!819905 m!761693))

(assert (=> b!819905 m!761687))

(declare-fun m!761695 () Bool)

(assert (=> b!819905 m!761695))

(declare-fun m!761697 () Bool)

(assert (=> b!819905 m!761697))

(declare-fun m!761699 () Bool)

(assert (=> b!819905 m!761699))

(declare-fun m!761701 () Bool)

(assert (=> b!819905 m!761701))

(declare-fun m!761703 () Bool)

(assert (=> b!819903 m!761703))

(declare-fun m!761705 () Bool)

(assert (=> start!70578 m!761705))

(declare-fun m!761707 () Bool)

(assert (=> start!70578 m!761707))

(declare-fun m!761709 () Bool)

(assert (=> start!70578 m!761709))

(check-sat (not mapNonEmpty!23494) b_and!21727 (not b!819905) (not b!819903) (not start!70578) (not b_next!12885) (not b!819902) tp_is_empty!14595 (not b!819900) (not b!819899))
(check-sat b_and!21727 (not b_next!12885))
