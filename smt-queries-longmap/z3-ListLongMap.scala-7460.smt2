; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94670 () Bool)

(assert start!94670)

(declare-fun b_free!21939 () Bool)

(declare-fun b_next!21939 () Bool)

(assert (=> start!94670 (= b_free!21939 (not b_next!21939))))

(declare-fun tp!77273 () Bool)

(declare-fun b_and!34759 () Bool)

(assert (=> start!94670 (= tp!77273 b_and!34759)))

(declare-fun res!714084 () Bool)

(declare-fun e!610996 () Bool)

(assert (=> start!94670 (=> (not res!714084) (not e!610996))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94670 (= res!714084 (validMask!0 mask!1515))))

(assert (=> start!94670 e!610996))

(assert (=> start!94670 true))

(declare-fun tp_is_empty!25749 () Bool)

(assert (=> start!94670 tp_is_empty!25749))

(declare-datatypes ((V!39467 0))(
  ( (V!39468 (val!12925 Int)) )
))
(declare-datatypes ((ValueCell!12171 0))(
  ( (ValueCellFull!12171 (v!15541 V!39467)) (EmptyCell!12171) )
))
(declare-datatypes ((array!68473 0))(
  ( (array!68474 (arr!32933 (Array (_ BitVec 32) ValueCell!12171)) (size!33469 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68473)

(declare-fun e!610995 () Bool)

(declare-fun array_inv!25474 (array!68473) Bool)

(assert (=> start!94670 (and (array_inv!25474 _values!955) e!610995)))

(assert (=> start!94670 tp!77273))

(declare-datatypes ((array!68475 0))(
  ( (array!68476 (arr!32934 (Array (_ BitVec 32) (_ BitVec 64))) (size!33470 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68475)

(declare-fun array_inv!25475 (array!68475) Bool)

(assert (=> start!94670 (array_inv!25475 _keys!1163)))

(declare-fun mapNonEmpty!40327 () Bool)

(declare-fun mapRes!40327 () Bool)

(declare-fun tp!77272 () Bool)

(declare-fun e!610994 () Bool)

(assert (=> mapNonEmpty!40327 (= mapRes!40327 (and tp!77272 e!610994))))

(declare-fun mapValue!40327 () ValueCell!12171)

(declare-fun mapKey!40327 () (_ BitVec 32))

(declare-fun mapRest!40327 () (Array (_ BitVec 32) ValueCell!12171))

(assert (=> mapNonEmpty!40327 (= (arr!32933 _values!955) (store mapRest!40327 mapKey!40327 mapValue!40327))))

(declare-fun b!1070373 () Bool)

(declare-fun e!610997 () Bool)

(assert (=> b!1070373 (= e!610997 true)))

(declare-fun zeroValueBefore!47 () V!39467)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39467)

(declare-datatypes ((tuple2!16432 0))(
  ( (tuple2!16433 (_1!8227 (_ BitVec 64)) (_2!8227 V!39467)) )
))
(declare-datatypes ((List!22976 0))(
  ( (Nil!22973) (Cons!22972 (h!24181 tuple2!16432) (t!32307 List!22976)) )
))
(declare-datatypes ((ListLongMap!14401 0))(
  ( (ListLongMap!14402 (toList!7216 List!22976)) )
))
(declare-fun lt!473040 () ListLongMap!14401)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4119 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) V!39467 V!39467 (_ BitVec 32) Int) ListLongMap!14401)

(assert (=> b!1070373 (= lt!473040 (getCurrentListMap!4119 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070374 () Bool)

(assert (=> b!1070374 (= e!610994 tp_is_empty!25749)))

(declare-fun b!1070375 () Bool)

(declare-fun res!714083 () Bool)

(assert (=> b!1070375 (=> (not res!714083) (not e!610996))))

(declare-datatypes ((List!22977 0))(
  ( (Nil!22974) (Cons!22973 (h!24182 (_ BitVec 64)) (t!32308 List!22977)) )
))
(declare-fun arrayNoDuplicates!0 (array!68475 (_ BitVec 32) List!22977) Bool)

(assert (=> b!1070375 (= res!714083 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22974))))

(declare-fun b!1070376 () Bool)

(declare-fun e!610998 () Bool)

(assert (=> b!1070376 (= e!610998 tp_is_empty!25749)))

(declare-fun b!1070377 () Bool)

(assert (=> b!1070377 (= e!610995 (and e!610998 mapRes!40327))))

(declare-fun condMapEmpty!40327 () Bool)

(declare-fun mapDefault!40327 () ValueCell!12171)

(assert (=> b!1070377 (= condMapEmpty!40327 (= (arr!32933 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12171)) mapDefault!40327)))))

(declare-fun mapIsEmpty!40327 () Bool)

(assert (=> mapIsEmpty!40327 mapRes!40327))

(declare-fun b!1070378 () Bool)

(assert (=> b!1070378 (= e!610996 (not e!610997))))

(declare-fun res!714087 () Bool)

(assert (=> b!1070378 (=> res!714087 e!610997)))

(assert (=> b!1070378 (= res!714087 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473041 () ListLongMap!14401)

(declare-fun lt!473039 () ListLongMap!14401)

(assert (=> b!1070378 (= lt!473041 lt!473039)))

(declare-datatypes ((Unit!35231 0))(
  ( (Unit!35232) )
))
(declare-fun lt!473038 () Unit!35231)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39467)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!829 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39467 V!39467 V!39467 V!39467 (_ BitVec 32) Int) Unit!35231)

(assert (=> b!1070378 (= lt!473038 (lemmaNoChangeToArrayThenSameMapNoExtras!829 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3792 (array!68475 array!68473 (_ BitVec 32) (_ BitVec 32) V!39467 V!39467 (_ BitVec 32) Int) ListLongMap!14401)

(assert (=> b!1070378 (= lt!473039 (getCurrentListMapNoExtraKeys!3792 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070378 (= lt!473041 (getCurrentListMapNoExtraKeys!3792 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070379 () Bool)

(declare-fun res!714086 () Bool)

(assert (=> b!1070379 (=> (not res!714086) (not e!610996))))

(assert (=> b!1070379 (= res!714086 (and (= (size!33469 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33470 _keys!1163) (size!33469 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070380 () Bool)

(declare-fun res!714085 () Bool)

(assert (=> b!1070380 (=> (not res!714085) (not e!610996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68475 (_ BitVec 32)) Bool)

(assert (=> b!1070380 (= res!714085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94670 res!714084) b!1070379))

(assert (= (and b!1070379 res!714086) b!1070380))

(assert (= (and b!1070380 res!714085) b!1070375))

(assert (= (and b!1070375 res!714083) b!1070378))

(assert (= (and b!1070378 (not res!714087)) b!1070373))

(assert (= (and b!1070377 condMapEmpty!40327) mapIsEmpty!40327))

(assert (= (and b!1070377 (not condMapEmpty!40327)) mapNonEmpty!40327))

(get-info :version)

(assert (= (and mapNonEmpty!40327 ((_ is ValueCellFull!12171) mapValue!40327)) b!1070374))

(assert (= (and b!1070377 ((_ is ValueCellFull!12171) mapDefault!40327)) b!1070376))

(assert (= start!94670 b!1070377))

(declare-fun m!988733 () Bool)

(assert (=> b!1070373 m!988733))

(declare-fun m!988735 () Bool)

(assert (=> mapNonEmpty!40327 m!988735))

(declare-fun m!988737 () Bool)

(assert (=> b!1070378 m!988737))

(declare-fun m!988739 () Bool)

(assert (=> b!1070378 m!988739))

(declare-fun m!988741 () Bool)

(assert (=> b!1070378 m!988741))

(declare-fun m!988743 () Bool)

(assert (=> start!94670 m!988743))

(declare-fun m!988745 () Bool)

(assert (=> start!94670 m!988745))

(declare-fun m!988747 () Bool)

(assert (=> start!94670 m!988747))

(declare-fun m!988749 () Bool)

(assert (=> b!1070375 m!988749))

(declare-fun m!988751 () Bool)

(assert (=> b!1070380 m!988751))

(check-sat (not b!1070373) (not b!1070375) (not b!1070378) tp_is_empty!25749 b_and!34759 (not b!1070380) (not mapNonEmpty!40327) (not b_next!21939) (not start!94670))
(check-sat b_and!34759 (not b_next!21939))
