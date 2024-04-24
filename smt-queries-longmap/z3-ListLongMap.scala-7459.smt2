; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94898 () Bool)

(assert start!94898)

(declare-fun b_free!21931 () Bool)

(declare-fun b_next!21931 () Bool)

(assert (=> start!94898 (= b_free!21931 (not b_next!21931))))

(declare-fun tp!77248 () Bool)

(declare-fun b_and!34761 () Bool)

(assert (=> start!94898 (= tp!77248 b_and!34761)))

(declare-fun b!1071604 () Bool)

(declare-fun e!611782 () Bool)

(declare-fun tp_is_empty!25741 () Bool)

(assert (=> b!1071604 (= e!611782 tp_is_empty!25741)))

(declare-fun mapIsEmpty!40315 () Bool)

(declare-fun mapRes!40315 () Bool)

(assert (=> mapIsEmpty!40315 mapRes!40315))

(declare-fun b!1071605 () Bool)

(declare-fun e!611780 () Bool)

(declare-fun e!611778 () Bool)

(assert (=> b!1071605 (= e!611780 (not e!611778))))

(declare-fun res!714548 () Bool)

(assert (=> b!1071605 (=> res!714548 e!611778)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071605 (= res!714548 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39457 0))(
  ( (V!39458 (val!12921 Int)) )
))
(declare-datatypes ((tuple2!16402 0))(
  ( (tuple2!16403 (_1!8212 (_ BitVec 64)) (_2!8212 V!39457)) )
))
(declare-datatypes ((List!22968 0))(
  ( (Nil!22965) (Cons!22964 (h!24182 tuple2!16402) (t!32291 List!22968)) )
))
(declare-datatypes ((ListLongMap!14379 0))(
  ( (ListLongMap!14380 (toList!7205 List!22968)) )
))
(declare-fun lt!473506 () ListLongMap!14379)

(declare-fun lt!473508 () ListLongMap!14379)

(assert (=> b!1071605 (= lt!473506 lt!473508)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39457)

(declare-datatypes ((Unit!35200 0))(
  ( (Unit!35201) )
))
(declare-fun lt!473505 () Unit!35200)

(declare-datatypes ((ValueCell!12167 0))(
  ( (ValueCellFull!12167 (v!15533 V!39457)) (EmptyCell!12167) )
))
(declare-datatypes ((array!68497 0))(
  ( (array!68498 (arr!32939 (Array (_ BitVec 32) ValueCell!12167)) (size!33476 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68497)

(declare-fun minValue!907 () V!39457)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39457)

(declare-datatypes ((array!68499 0))(
  ( (array!68500 (arr!32940 (Array (_ BitVec 32) (_ BitVec 64))) (size!33477 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68499)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!818 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 V!39457 V!39457 (_ BitVec 32) Int) Unit!35200)

(assert (=> b!1071605 (= lt!473505 (lemmaNoChangeToArrayThenSameMapNoExtras!818 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3815 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 (_ BitVec 32) Int) ListLongMap!14379)

(assert (=> b!1071605 (= lt!473508 (getCurrentListMapNoExtraKeys!3815 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071605 (= lt!473506 (getCurrentListMapNoExtraKeys!3815 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071606 () Bool)

(declare-fun res!714546 () Bool)

(assert (=> b!1071606 (=> (not res!714546) (not e!611780))))

(declare-datatypes ((List!22969 0))(
  ( (Nil!22966) (Cons!22965 (h!24183 (_ BitVec 64)) (t!32292 List!22969)) )
))
(declare-fun arrayNoDuplicates!0 (array!68499 (_ BitVec 32) List!22969) Bool)

(assert (=> b!1071606 (= res!714546 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22966))))

(declare-fun res!714545 () Bool)

(assert (=> start!94898 (=> (not res!714545) (not e!611780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94898 (= res!714545 (validMask!0 mask!1515))))

(assert (=> start!94898 e!611780))

(assert (=> start!94898 true))

(assert (=> start!94898 tp_is_empty!25741))

(declare-fun e!611777 () Bool)

(declare-fun array_inv!25506 (array!68497) Bool)

(assert (=> start!94898 (and (array_inv!25506 _values!955) e!611777)))

(assert (=> start!94898 tp!77248))

(declare-fun array_inv!25507 (array!68499) Bool)

(assert (=> start!94898 (array_inv!25507 _keys!1163)))

(declare-fun b!1071607 () Bool)

(declare-fun res!714547 () Bool)

(assert (=> b!1071607 (=> (not res!714547) (not e!611780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68499 (_ BitVec 32)) Bool)

(assert (=> b!1071607 (= res!714547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40315 () Bool)

(declare-fun tp!77249 () Bool)

(assert (=> mapNonEmpty!40315 (= mapRes!40315 (and tp!77249 e!611782))))

(declare-fun mapValue!40315 () ValueCell!12167)

(declare-fun mapRest!40315 () (Array (_ BitVec 32) ValueCell!12167))

(declare-fun mapKey!40315 () (_ BitVec 32))

(assert (=> mapNonEmpty!40315 (= (arr!32939 _values!955) (store mapRest!40315 mapKey!40315 mapValue!40315))))

(declare-fun b!1071608 () Bool)

(declare-fun e!611781 () Bool)

(assert (=> b!1071608 (= e!611777 (and e!611781 mapRes!40315))))

(declare-fun condMapEmpty!40315 () Bool)

(declare-fun mapDefault!40315 () ValueCell!12167)

(assert (=> b!1071608 (= condMapEmpty!40315 (= (arr!32939 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12167)) mapDefault!40315)))))

(declare-fun b!1071609 () Bool)

(declare-fun res!714549 () Bool)

(assert (=> b!1071609 (=> (not res!714549) (not e!611780))))

(assert (=> b!1071609 (= res!714549 (and (= (size!33476 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33477 _keys!1163) (size!33476 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071610 () Bool)

(assert (=> b!1071610 (= e!611778 true)))

(declare-fun lt!473507 () ListLongMap!14379)

(declare-fun getCurrentListMap!4106 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 (_ BitVec 32) Int) ListLongMap!14379)

(assert (=> b!1071610 (= lt!473507 (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071611 () Bool)

(assert (=> b!1071611 (= e!611781 tp_is_empty!25741)))

(assert (= (and start!94898 res!714545) b!1071609))

(assert (= (and b!1071609 res!714549) b!1071607))

(assert (= (and b!1071607 res!714547) b!1071606))

(assert (= (and b!1071606 res!714546) b!1071605))

(assert (= (and b!1071605 (not res!714548)) b!1071610))

(assert (= (and b!1071608 condMapEmpty!40315) mapIsEmpty!40315))

(assert (= (and b!1071608 (not condMapEmpty!40315)) mapNonEmpty!40315))

(get-info :version)

(assert (= (and mapNonEmpty!40315 ((_ is ValueCellFull!12167) mapValue!40315)) b!1071604))

(assert (= (and b!1071608 ((_ is ValueCellFull!12167) mapDefault!40315)) b!1071611))

(assert (= start!94898 b!1071608))

(declare-fun m!990325 () Bool)

(assert (=> start!94898 m!990325))

(declare-fun m!990327 () Bool)

(assert (=> start!94898 m!990327))

(declare-fun m!990329 () Bool)

(assert (=> start!94898 m!990329))

(declare-fun m!990331 () Bool)

(assert (=> mapNonEmpty!40315 m!990331))

(declare-fun m!990333 () Bool)

(assert (=> b!1071606 m!990333))

(declare-fun m!990335 () Bool)

(assert (=> b!1071605 m!990335))

(declare-fun m!990337 () Bool)

(assert (=> b!1071605 m!990337))

(declare-fun m!990339 () Bool)

(assert (=> b!1071605 m!990339))

(declare-fun m!990341 () Bool)

(assert (=> b!1071607 m!990341))

(declare-fun m!990343 () Bool)

(assert (=> b!1071610 m!990343))

(check-sat b_and!34761 (not b!1071610) (not b!1071605) (not b_next!21931) (not b!1071607) tp_is_empty!25741 (not b!1071606) (not mapNonEmpty!40315) (not start!94898))
(check-sat b_and!34761 (not b_next!21931))
