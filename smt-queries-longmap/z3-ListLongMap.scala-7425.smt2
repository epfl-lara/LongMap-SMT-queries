; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94388 () Bool)

(assert start!94388)

(declare-fun b_free!21729 () Bool)

(declare-fun b_next!21729 () Bool)

(assert (=> start!94388 (= b_free!21729 (not b_next!21729))))

(declare-fun tp!76630 () Bool)

(declare-fun b_and!34513 () Bool)

(assert (=> start!94388 (= tp!76630 b_and!34513)))

(declare-fun mapIsEmpty!40000 () Bool)

(declare-fun mapRes!40000 () Bool)

(assert (=> mapIsEmpty!40000 mapRes!40000))

(declare-fun b!1067310 () Bool)

(declare-fun res!712265 () Bool)

(declare-fun e!608738 () Bool)

(assert (=> b!1067310 (=> (not res!712265) (not e!608738))))

(declare-datatypes ((array!68061 0))(
  ( (array!68062 (arr!32731 (Array (_ BitVec 32) (_ BitVec 64))) (size!33267 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68061)

(declare-datatypes ((List!22825 0))(
  ( (Nil!22822) (Cons!22821 (h!24030 (_ BitVec 64)) (t!32148 List!22825)) )
))
(declare-fun arrayNoDuplicates!0 (array!68061 (_ BitVec 32) List!22825) Bool)

(assert (=> b!1067310 (= res!712265 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22822))))

(declare-fun b!1067311 () Bool)

(declare-fun res!712267 () Bool)

(assert (=> b!1067311 (=> (not res!712267) (not e!608738))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68061 (_ BitVec 32)) Bool)

(assert (=> b!1067311 (= res!712267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067312 () Bool)

(declare-fun res!712266 () Bool)

(assert (=> b!1067312 (=> (not res!712266) (not e!608738))))

(declare-datatypes ((V!39187 0))(
  ( (V!39188 (val!12820 Int)) )
))
(declare-datatypes ((ValueCell!12066 0))(
  ( (ValueCellFull!12066 (v!15434 V!39187)) (EmptyCell!12066) )
))
(declare-datatypes ((array!68063 0))(
  ( (array!68064 (arr!32732 (Array (_ BitVec 32) ValueCell!12066)) (size!33268 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68063)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067312 (= res!712266 (and (= (size!33268 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33267 _keys!1163) (size!33268 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712268 () Bool)

(assert (=> start!94388 (=> (not res!712268) (not e!608738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94388 (= res!712268 (validMask!0 mask!1515))))

(assert (=> start!94388 e!608738))

(assert (=> start!94388 true))

(declare-fun tp_is_empty!25539 () Bool)

(assert (=> start!94388 tp_is_empty!25539))

(declare-fun e!608739 () Bool)

(declare-fun array_inv!25338 (array!68063) Bool)

(assert (=> start!94388 (and (array_inv!25338 _values!955) e!608739)))

(assert (=> start!94388 tp!76630))

(declare-fun array_inv!25339 (array!68061) Bool)

(assert (=> start!94388 (array_inv!25339 _keys!1163)))

(declare-fun b!1067313 () Bool)

(assert (=> b!1067313 (= e!608738 (not true))))

(declare-datatypes ((tuple2!16266 0))(
  ( (tuple2!16267 (_1!8144 (_ BitVec 64)) (_2!8144 V!39187)) )
))
(declare-datatypes ((List!22826 0))(
  ( (Nil!22823) (Cons!22822 (h!24031 tuple2!16266) (t!32149 List!22826)) )
))
(declare-datatypes ((ListLongMap!14235 0))(
  ( (ListLongMap!14236 (toList!7133 List!22826)) )
))
(declare-fun lt!471392 () ListLongMap!14235)

(declare-fun lt!471391 () ListLongMap!14235)

(assert (=> b!1067313 (= lt!471392 lt!471391)))

(declare-fun zeroValueBefore!47 () V!39187)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39187)

(declare-datatypes ((Unit!35063 0))(
  ( (Unit!35064) )
))
(declare-fun lt!471393 () Unit!35063)

(declare-fun minValue!907 () V!39187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!754 (array!68061 array!68063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39187 V!39187 V!39187 V!39187 (_ BitVec 32) Int) Unit!35063)

(assert (=> b!1067313 (= lt!471393 (lemmaNoChangeToArrayThenSameMapNoExtras!754 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3717 (array!68061 array!68063 (_ BitVec 32) (_ BitVec 32) V!39187 V!39187 (_ BitVec 32) Int) ListLongMap!14235)

(assert (=> b!1067313 (= lt!471391 (getCurrentListMapNoExtraKeys!3717 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067313 (= lt!471392 (getCurrentListMapNoExtraKeys!3717 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067314 () Bool)

(declare-fun e!608735 () Bool)

(assert (=> b!1067314 (= e!608739 (and e!608735 mapRes!40000))))

(declare-fun condMapEmpty!40000 () Bool)

(declare-fun mapDefault!40000 () ValueCell!12066)

(assert (=> b!1067314 (= condMapEmpty!40000 (= (arr!32732 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12066)) mapDefault!40000)))))

(declare-fun b!1067315 () Bool)

(declare-fun e!608737 () Bool)

(assert (=> b!1067315 (= e!608737 tp_is_empty!25539)))

(declare-fun b!1067316 () Bool)

(assert (=> b!1067316 (= e!608735 tp_is_empty!25539)))

(declare-fun mapNonEmpty!40000 () Bool)

(declare-fun tp!76631 () Bool)

(assert (=> mapNonEmpty!40000 (= mapRes!40000 (and tp!76631 e!608737))))

(declare-fun mapKey!40000 () (_ BitVec 32))

(declare-fun mapValue!40000 () ValueCell!12066)

(declare-fun mapRest!40000 () (Array (_ BitVec 32) ValueCell!12066))

(assert (=> mapNonEmpty!40000 (= (arr!32732 _values!955) (store mapRest!40000 mapKey!40000 mapValue!40000))))

(assert (= (and start!94388 res!712268) b!1067312))

(assert (= (and b!1067312 res!712266) b!1067311))

(assert (= (and b!1067311 res!712267) b!1067310))

(assert (= (and b!1067310 res!712265) b!1067313))

(assert (= (and b!1067314 condMapEmpty!40000) mapIsEmpty!40000))

(assert (= (and b!1067314 (not condMapEmpty!40000)) mapNonEmpty!40000))

(get-info :version)

(assert (= (and mapNonEmpty!40000 ((_ is ValueCellFull!12066) mapValue!40000)) b!1067315))

(assert (= (and b!1067314 ((_ is ValueCellFull!12066) mapDefault!40000)) b!1067316))

(assert (= start!94388 b!1067314))

(declare-fun m!985989 () Bool)

(assert (=> start!94388 m!985989))

(declare-fun m!985991 () Bool)

(assert (=> start!94388 m!985991))

(declare-fun m!985993 () Bool)

(assert (=> start!94388 m!985993))

(declare-fun m!985995 () Bool)

(assert (=> b!1067311 m!985995))

(declare-fun m!985997 () Bool)

(assert (=> b!1067310 m!985997))

(declare-fun m!985999 () Bool)

(assert (=> mapNonEmpty!40000 m!985999))

(declare-fun m!986001 () Bool)

(assert (=> b!1067313 m!986001))

(declare-fun m!986003 () Bool)

(assert (=> b!1067313 m!986003))

(declare-fun m!986005 () Bool)

(assert (=> b!1067313 m!986005))

(check-sat (not b!1067311) tp_is_empty!25539 (not b!1067313) (not mapNonEmpty!40000) (not start!94388) (not b!1067310) (not b_next!21729) b_and!34513)
(check-sat b_and!34513 (not b_next!21729))
