; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94008 () Bool)

(assert start!94008)

(declare-fun b_free!21451 () Bool)

(declare-fun b_next!21451 () Bool)

(assert (=> start!94008 (= b_free!21451 (not b_next!21451))))

(declare-fun tp!75782 () Bool)

(declare-fun b_and!34157 () Bool)

(assert (=> start!94008 (= tp!75782 b_and!34157)))

(declare-fun b!1063169 () Bool)

(declare-fun e!605765 () Bool)

(declare-fun e!605763 () Bool)

(assert (=> b!1063169 (= e!605765 e!605763)))

(declare-fun res!709907 () Bool)

(assert (=> b!1063169 (=> res!709907 e!605763)))

(declare-datatypes ((V!38817 0))(
  ( (V!38818 (val!12681 Int)) )
))
(declare-datatypes ((tuple2!16116 0))(
  ( (tuple2!16117 (_1!8069 (_ BitVec 64)) (_2!8069 V!38817)) )
))
(declare-datatypes ((List!22665 0))(
  ( (Nil!22662) (Cons!22661 (h!23870 tuple2!16116) (t!31969 List!22665)) )
))
(declare-datatypes ((ListLongMap!14085 0))(
  ( (ListLongMap!14086 (toList!7058 List!22665)) )
))
(declare-fun lt!468429 () ListLongMap!14085)

(declare-fun contains!6227 (ListLongMap!14085 (_ BitVec 64)) Bool)

(assert (=> b!1063169 (= res!709907 (contains!6227 lt!468429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38817)

(declare-datatypes ((ValueCell!11927 0))(
  ( (ValueCellFull!11927 (v!15291 V!38817)) (EmptyCell!11927) )
))
(declare-datatypes ((array!67462 0))(
  ( (array!67463 (arr!32437 (Array (_ BitVec 32) ValueCell!11927)) (size!32975 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67462)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38817)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67464 0))(
  ( (array!67465 (arr!32438 (Array (_ BitVec 32) (_ BitVec 64))) (size!32976 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67464)

(declare-fun getCurrentListMap!3958 (array!67464 array!67462 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14085)

(assert (=> b!1063169 (= lt!468429 (getCurrentListMap!3958 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39568 () Bool)

(declare-fun mapRes!39568 () Bool)

(declare-fun tp!75781 () Bool)

(declare-fun e!605759 () Bool)

(assert (=> mapNonEmpty!39568 (= mapRes!39568 (and tp!75781 e!605759))))

(declare-fun mapKey!39568 () (_ BitVec 32))

(declare-fun mapValue!39568 () ValueCell!11927)

(declare-fun mapRest!39568 () (Array (_ BitVec 32) ValueCell!11927))

(assert (=> mapNonEmpty!39568 (= (arr!32437 _values!955) (store mapRest!39568 mapKey!39568 mapValue!39568))))

(declare-fun b!1063170 () Bool)

(declare-fun tp_is_empty!25261 () Bool)

(assert (=> b!1063170 (= e!605759 tp_is_empty!25261)))

(declare-fun b!1063171 () Bool)

(declare-fun res!709905 () Bool)

(declare-fun e!605760 () Bool)

(assert (=> b!1063171 (=> (not res!709905) (not e!605760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67464 (_ BitVec 32)) Bool)

(assert (=> b!1063171 (= res!709905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063172 () Bool)

(declare-fun e!605761 () Bool)

(declare-fun e!605764 () Bool)

(assert (=> b!1063172 (= e!605761 (and e!605764 mapRes!39568))))

(declare-fun condMapEmpty!39568 () Bool)

(declare-fun mapDefault!39568 () ValueCell!11927)

(assert (=> b!1063172 (= condMapEmpty!39568 (= (arr!32437 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11927)) mapDefault!39568)))))

(declare-fun b!1063173 () Bool)

(assert (=> b!1063173 (= e!605763 true)))

(declare-fun -!576 (ListLongMap!14085 (_ BitVec 64)) ListLongMap!14085)

(assert (=> b!1063173 (= (-!576 lt!468429 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468429)))

(declare-datatypes ((Unit!34705 0))(
  ( (Unit!34706) )
))
(declare-fun lt!468430 () Unit!34705)

(declare-fun removeNotPresentStillSame!28 (ListLongMap!14085 (_ BitVec 64)) Unit!34705)

(assert (=> b!1063173 (= lt!468430 (removeNotPresentStillSame!28 lt!468429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063174 () Bool)

(declare-fun res!709908 () Bool)

(assert (=> b!1063174 (=> (not res!709908) (not e!605760))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063174 (= res!709908 (and (= (size!32975 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32976 _keys!1163) (size!32975 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39568 () Bool)

(assert (=> mapIsEmpty!39568 mapRes!39568))

(declare-fun b!1063175 () Bool)

(assert (=> b!1063175 (= e!605760 (not e!605765))))

(declare-fun res!709903 () Bool)

(assert (=> b!1063175 (=> res!709903 e!605765)))

(assert (=> b!1063175 (= res!709903 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468426 () ListLongMap!14085)

(declare-fun lt!468428 () ListLongMap!14085)

(assert (=> b!1063175 (= lt!468426 lt!468428)))

(declare-fun lt!468427 () Unit!34705)

(declare-fun zeroValueAfter!47 () V!38817)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!658 (array!67464 array!67462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 V!38817 V!38817 (_ BitVec 32) Int) Unit!34705)

(assert (=> b!1063175 (= lt!468427 (lemmaNoChangeToArrayThenSameMapNoExtras!658 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3664 (array!67464 array!67462 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14085)

(assert (=> b!1063175 (= lt!468428 (getCurrentListMapNoExtraKeys!3664 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063175 (= lt!468426 (getCurrentListMapNoExtraKeys!3664 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709906 () Bool)

(assert (=> start!94008 (=> (not res!709906) (not e!605760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94008 (= res!709906 (validMask!0 mask!1515))))

(assert (=> start!94008 e!605760))

(assert (=> start!94008 true))

(assert (=> start!94008 tp_is_empty!25261))

(declare-fun array_inv!25130 (array!67462) Bool)

(assert (=> start!94008 (and (array_inv!25130 _values!955) e!605761)))

(assert (=> start!94008 tp!75782))

(declare-fun array_inv!25131 (array!67464) Bool)

(assert (=> start!94008 (array_inv!25131 _keys!1163)))

(declare-fun b!1063176 () Bool)

(assert (=> b!1063176 (= e!605764 tp_is_empty!25261)))

(declare-fun b!1063177 () Bool)

(declare-fun res!709904 () Bool)

(assert (=> b!1063177 (=> (not res!709904) (not e!605760))))

(declare-datatypes ((List!22666 0))(
  ( (Nil!22663) (Cons!22662 (h!23871 (_ BitVec 64)) (t!31970 List!22666)) )
))
(declare-fun arrayNoDuplicates!0 (array!67464 (_ BitVec 32) List!22666) Bool)

(assert (=> b!1063177 (= res!709904 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22663))))

(assert (= (and start!94008 res!709906) b!1063174))

(assert (= (and b!1063174 res!709908) b!1063171))

(assert (= (and b!1063171 res!709905) b!1063177))

(assert (= (and b!1063177 res!709904) b!1063175))

(assert (= (and b!1063175 (not res!709903)) b!1063169))

(assert (= (and b!1063169 (not res!709907)) b!1063173))

(assert (= (and b!1063172 condMapEmpty!39568) mapIsEmpty!39568))

(assert (= (and b!1063172 (not condMapEmpty!39568)) mapNonEmpty!39568))

(get-info :version)

(assert (= (and mapNonEmpty!39568 ((_ is ValueCellFull!11927) mapValue!39568)) b!1063170))

(assert (= (and b!1063172 ((_ is ValueCellFull!11927) mapDefault!39568)) b!1063176))

(assert (= start!94008 b!1063172))

(declare-fun m!981391 () Bool)

(assert (=> start!94008 m!981391))

(declare-fun m!981393 () Bool)

(assert (=> start!94008 m!981393))

(declare-fun m!981395 () Bool)

(assert (=> start!94008 m!981395))

(declare-fun m!981397 () Bool)

(assert (=> b!1063173 m!981397))

(declare-fun m!981399 () Bool)

(assert (=> b!1063173 m!981399))

(declare-fun m!981401 () Bool)

(assert (=> b!1063171 m!981401))

(declare-fun m!981403 () Bool)

(assert (=> b!1063177 m!981403))

(declare-fun m!981405 () Bool)

(assert (=> b!1063175 m!981405))

(declare-fun m!981407 () Bool)

(assert (=> b!1063175 m!981407))

(declare-fun m!981409 () Bool)

(assert (=> b!1063175 m!981409))

(declare-fun m!981411 () Bool)

(assert (=> mapNonEmpty!39568 m!981411))

(declare-fun m!981413 () Bool)

(assert (=> b!1063169 m!981413))

(declare-fun m!981415 () Bool)

(assert (=> b!1063169 m!981415))

(check-sat tp_is_empty!25261 (not mapNonEmpty!39568) (not b_next!21451) (not b!1063169) (not b!1063177) (not start!94008) b_and!34157 (not b!1063175) (not b!1063171) (not b!1063173))
(check-sat b_and!34157 (not b_next!21451))
