; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94886 () Bool)

(assert start!94886)

(declare-fun b_free!21919 () Bool)

(declare-fun b_next!21919 () Bool)

(assert (=> start!94886 (= b_free!21919 (not b_next!21919))))

(declare-fun tp!77213 () Bool)

(declare-fun b_and!34749 () Bool)

(assert (=> start!94886 (= tp!77213 b_and!34749)))

(declare-fun b!1071460 () Bool)

(declare-fun e!611669 () Bool)

(declare-fun e!611670 () Bool)

(assert (=> b!1071460 (= e!611669 (not e!611670))))

(declare-fun res!714455 () Bool)

(assert (=> b!1071460 (=> res!714455 e!611670)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071460 (= res!714455 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39441 0))(
  ( (V!39442 (val!12915 Int)) )
))
(declare-datatypes ((tuple2!16390 0))(
  ( (tuple2!16391 (_1!8206 (_ BitVec 64)) (_2!8206 V!39441)) )
))
(declare-datatypes ((List!22957 0))(
  ( (Nil!22954) (Cons!22953 (h!24171 tuple2!16390) (t!32280 List!22957)) )
))
(declare-datatypes ((ListLongMap!14367 0))(
  ( (ListLongMap!14368 (toList!7199 List!22957)) )
))
(declare-fun lt!473434 () ListLongMap!14367)

(declare-fun lt!473433 () ListLongMap!14367)

(assert (=> b!1071460 (= lt!473434 lt!473433)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39441)

(declare-datatypes ((ValueCell!12161 0))(
  ( (ValueCellFull!12161 (v!15527 V!39441)) (EmptyCell!12161) )
))
(declare-datatypes ((array!68473 0))(
  ( (array!68474 (arr!32927 (Array (_ BitVec 32) ValueCell!12161)) (size!33464 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68473)

(declare-fun minValue!907 () V!39441)

(declare-datatypes ((Unit!35192 0))(
  ( (Unit!35193) )
))
(declare-fun lt!473436 () Unit!35192)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39441)

(declare-datatypes ((array!68475 0))(
  ( (array!68476 (arr!32928 (Array (_ BitVec 32) (_ BitVec 64))) (size!33465 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68475)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!814 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 V!39441 V!39441 (_ BitVec 32) Int) Unit!35192)

(assert (=> b!1071460 (= lt!473436 (lemmaNoChangeToArrayThenSameMapNoExtras!814 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3811 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 (_ BitVec 32) Int) ListLongMap!14367)

(assert (=> b!1071460 (= lt!473433 (getCurrentListMapNoExtraKeys!3811 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071460 (= lt!473434 (getCurrentListMapNoExtraKeys!3811 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071461 () Bool)

(declare-fun res!714457 () Bool)

(assert (=> b!1071461 (=> (not res!714457) (not e!611669))))

(assert (=> b!1071461 (= res!714457 (and (= (size!33464 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33465 _keys!1163) (size!33464 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071462 () Bool)

(assert (=> b!1071462 (= e!611670 true)))

(declare-fun lt!473435 () ListLongMap!14367)

(declare-fun getCurrentListMap!4101 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 (_ BitVec 32) Int) ListLongMap!14367)

(assert (=> b!1071462 (= lt!473435 (getCurrentListMap!4101 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40297 () Bool)

(declare-fun mapRes!40297 () Bool)

(assert (=> mapIsEmpty!40297 mapRes!40297))

(declare-fun b!1071463 () Bool)

(declare-fun e!611671 () Bool)

(declare-fun tp_is_empty!25729 () Bool)

(assert (=> b!1071463 (= e!611671 tp_is_empty!25729)))

(declare-fun b!1071464 () Bool)

(declare-fun res!714459 () Bool)

(assert (=> b!1071464 (=> (not res!714459) (not e!611669))))

(declare-datatypes ((List!22958 0))(
  ( (Nil!22955) (Cons!22954 (h!24172 (_ BitVec 64)) (t!32281 List!22958)) )
))
(declare-fun arrayNoDuplicates!0 (array!68475 (_ BitVec 32) List!22958) Bool)

(assert (=> b!1071464 (= res!714459 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22955))))

(declare-fun res!714458 () Bool)

(assert (=> start!94886 (=> (not res!714458) (not e!611669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94886 (= res!714458 (validMask!0 mask!1515))))

(assert (=> start!94886 e!611669))

(assert (=> start!94886 true))

(assert (=> start!94886 tp_is_empty!25729))

(declare-fun e!611674 () Bool)

(declare-fun array_inv!25500 (array!68473) Bool)

(assert (=> start!94886 (and (array_inv!25500 _values!955) e!611674)))

(assert (=> start!94886 tp!77213))

(declare-fun array_inv!25501 (array!68475) Bool)

(assert (=> start!94886 (array_inv!25501 _keys!1163)))

(declare-fun mapNonEmpty!40297 () Bool)

(declare-fun tp!77212 () Bool)

(assert (=> mapNonEmpty!40297 (= mapRes!40297 (and tp!77212 e!611671))))

(declare-fun mapRest!40297 () (Array (_ BitVec 32) ValueCell!12161))

(declare-fun mapValue!40297 () ValueCell!12161)

(declare-fun mapKey!40297 () (_ BitVec 32))

(assert (=> mapNonEmpty!40297 (= (arr!32927 _values!955) (store mapRest!40297 mapKey!40297 mapValue!40297))))

(declare-fun b!1071465 () Bool)

(declare-fun res!714456 () Bool)

(assert (=> b!1071465 (=> (not res!714456) (not e!611669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68475 (_ BitVec 32)) Bool)

(assert (=> b!1071465 (= res!714456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071466 () Bool)

(declare-fun e!611672 () Bool)

(assert (=> b!1071466 (= e!611672 tp_is_empty!25729)))

(declare-fun b!1071467 () Bool)

(assert (=> b!1071467 (= e!611674 (and e!611672 mapRes!40297))))

(declare-fun condMapEmpty!40297 () Bool)

(declare-fun mapDefault!40297 () ValueCell!12161)

(assert (=> b!1071467 (= condMapEmpty!40297 (= (arr!32927 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12161)) mapDefault!40297)))))

(assert (= (and start!94886 res!714458) b!1071461))

(assert (= (and b!1071461 res!714457) b!1071465))

(assert (= (and b!1071465 res!714456) b!1071464))

(assert (= (and b!1071464 res!714459) b!1071460))

(assert (= (and b!1071460 (not res!714455)) b!1071462))

(assert (= (and b!1071467 condMapEmpty!40297) mapIsEmpty!40297))

(assert (= (and b!1071467 (not condMapEmpty!40297)) mapNonEmpty!40297))

(get-info :version)

(assert (= (and mapNonEmpty!40297 ((_ is ValueCellFull!12161) mapValue!40297)) b!1071463))

(assert (= (and b!1071467 ((_ is ValueCellFull!12161) mapDefault!40297)) b!1071466))

(assert (= start!94886 b!1071467))

(declare-fun m!990205 () Bool)

(assert (=> b!1071462 m!990205))

(declare-fun m!990207 () Bool)

(assert (=> b!1071464 m!990207))

(declare-fun m!990209 () Bool)

(assert (=> mapNonEmpty!40297 m!990209))

(declare-fun m!990211 () Bool)

(assert (=> b!1071460 m!990211))

(declare-fun m!990213 () Bool)

(assert (=> b!1071460 m!990213))

(declare-fun m!990215 () Bool)

(assert (=> b!1071460 m!990215))

(declare-fun m!990217 () Bool)

(assert (=> start!94886 m!990217))

(declare-fun m!990219 () Bool)

(assert (=> start!94886 m!990219))

(declare-fun m!990221 () Bool)

(assert (=> start!94886 m!990221))

(declare-fun m!990223 () Bool)

(assert (=> b!1071465 m!990223))

(check-sat tp_is_empty!25729 (not b!1071462) (not b!1071464) (not b!1071465) (not b_next!21919) b_and!34749 (not mapNonEmpty!40297) (not b!1071460) (not start!94886))
(check-sat b_and!34749 (not b_next!21919))
