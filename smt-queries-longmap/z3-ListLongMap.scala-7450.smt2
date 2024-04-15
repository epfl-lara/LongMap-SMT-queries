; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94588 () Bool)

(assert start!94588)

(declare-fun b_free!21877 () Bool)

(declare-fun b_next!21877 () Bool)

(assert (=> start!94588 (= b_free!21877 (not b_next!21877))))

(declare-fun tp!77084 () Bool)

(declare-fun b_and!34663 () Bool)

(assert (=> start!94588 (= tp!77084 b_and!34663)))

(declare-fun mapIsEmpty!40231 () Bool)

(declare-fun mapRes!40231 () Bool)

(assert (=> mapIsEmpty!40231 mapRes!40231))

(declare-fun b!1069443 () Bool)

(declare-fun e!610342 () Bool)

(assert (=> b!1069443 (= e!610342 (not true))))

(declare-datatypes ((V!39385 0))(
  ( (V!39386 (val!12894 Int)) )
))
(declare-datatypes ((tuple2!16448 0))(
  ( (tuple2!16449 (_1!8235 (_ BitVec 64)) (_2!8235 V!39385)) )
))
(declare-datatypes ((List!22978 0))(
  ( (Nil!22975) (Cons!22974 (h!24183 tuple2!16448) (t!32298 List!22978)) )
))
(declare-datatypes ((ListLongMap!14417 0))(
  ( (ListLongMap!14418 (toList!7224 List!22978)) )
))
(declare-fun lt!472480 () ListLongMap!14417)

(declare-fun lt!472478 () ListLongMap!14417)

(assert (=> b!1069443 (= lt!472480 lt!472478)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39385)

(declare-datatypes ((Unit!35036 0))(
  ( (Unit!35037) )
))
(declare-fun lt!472479 () Unit!35036)

(declare-datatypes ((ValueCell!12140 0))(
  ( (ValueCellFull!12140 (v!15509 V!39385)) (EmptyCell!12140) )
))
(declare-datatypes ((array!68296 0))(
  ( (array!68297 (arr!32846 (Array (_ BitVec 32) ValueCell!12140)) (size!33384 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68296)

(declare-fun minValue!907 () V!39385)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39385)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68298 0))(
  ( (array!68299 (arr!32847 (Array (_ BitVec 32) (_ BitVec 64))) (size!33385 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68298)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!807 (array!68298 array!68296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39385 V!39385 V!39385 V!39385 (_ BitVec 32) Int) Unit!35036)

(assert (=> b!1069443 (= lt!472479 (lemmaNoChangeToArrayThenSameMapNoExtras!807 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3813 (array!68298 array!68296 (_ BitVec 32) (_ BitVec 32) V!39385 V!39385 (_ BitVec 32) Int) ListLongMap!14417)

(assert (=> b!1069443 (= lt!472478 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069443 (= lt!472480 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069444 () Bool)

(declare-fun res!713572 () Bool)

(assert (=> b!1069444 (=> (not res!713572) (not e!610342))))

(declare-datatypes ((List!22979 0))(
  ( (Nil!22976) (Cons!22975 (h!24184 (_ BitVec 64)) (t!32299 List!22979)) )
))
(declare-fun arrayNoDuplicates!0 (array!68298 (_ BitVec 32) List!22979) Bool)

(assert (=> b!1069444 (= res!713572 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22976))))

(declare-fun b!1069445 () Bool)

(declare-fun e!610344 () Bool)

(declare-fun tp_is_empty!25687 () Bool)

(assert (=> b!1069445 (= e!610344 tp_is_empty!25687)))

(declare-fun b!1069446 () Bool)

(declare-fun e!610340 () Bool)

(declare-fun e!610341 () Bool)

(assert (=> b!1069446 (= e!610340 (and e!610341 mapRes!40231))))

(declare-fun condMapEmpty!40231 () Bool)

(declare-fun mapDefault!40231 () ValueCell!12140)

(assert (=> b!1069446 (= condMapEmpty!40231 (= (arr!32846 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12140)) mapDefault!40231)))))

(declare-fun res!713570 () Bool)

(assert (=> start!94588 (=> (not res!713570) (not e!610342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94588 (= res!713570 (validMask!0 mask!1515))))

(assert (=> start!94588 e!610342))

(assert (=> start!94588 true))

(assert (=> start!94588 tp_is_empty!25687))

(declare-fun array_inv!25422 (array!68296) Bool)

(assert (=> start!94588 (and (array_inv!25422 _values!955) e!610340)))

(assert (=> start!94588 tp!77084))

(declare-fun array_inv!25423 (array!68298) Bool)

(assert (=> start!94588 (array_inv!25423 _keys!1163)))

(declare-fun b!1069447 () Bool)

(declare-fun res!713571 () Bool)

(assert (=> b!1069447 (=> (not res!713571) (not e!610342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68298 (_ BitVec 32)) Bool)

(assert (=> b!1069447 (= res!713571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40231 () Bool)

(declare-fun tp!77083 () Bool)

(assert (=> mapNonEmpty!40231 (= mapRes!40231 (and tp!77083 e!610344))))

(declare-fun mapValue!40231 () ValueCell!12140)

(declare-fun mapRest!40231 () (Array (_ BitVec 32) ValueCell!12140))

(declare-fun mapKey!40231 () (_ BitVec 32))

(assert (=> mapNonEmpty!40231 (= (arr!32846 _values!955) (store mapRest!40231 mapKey!40231 mapValue!40231))))

(declare-fun b!1069448 () Bool)

(declare-fun res!713573 () Bool)

(assert (=> b!1069448 (=> (not res!713573) (not e!610342))))

(assert (=> b!1069448 (= res!713573 (and (= (size!33384 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33385 _keys!1163) (size!33384 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069449 () Bool)

(assert (=> b!1069449 (= e!610341 tp_is_empty!25687)))

(assert (= (and start!94588 res!713570) b!1069448))

(assert (= (and b!1069448 res!713573) b!1069447))

(assert (= (and b!1069447 res!713571) b!1069444))

(assert (= (and b!1069444 res!713572) b!1069443))

(assert (= (and b!1069446 condMapEmpty!40231) mapIsEmpty!40231))

(assert (= (and b!1069446 (not condMapEmpty!40231)) mapNonEmpty!40231))

(get-info :version)

(assert (= (and mapNonEmpty!40231 ((_ is ValueCellFull!12140) mapValue!40231)) b!1069445))

(assert (= (and b!1069446 ((_ is ValueCellFull!12140) mapDefault!40231)) b!1069449))

(assert (= start!94588 b!1069446))

(declare-fun m!987457 () Bool)

(assert (=> mapNonEmpty!40231 m!987457))

(declare-fun m!987459 () Bool)

(assert (=> b!1069444 m!987459))

(declare-fun m!987461 () Bool)

(assert (=> b!1069443 m!987461))

(declare-fun m!987463 () Bool)

(assert (=> b!1069443 m!987463))

(declare-fun m!987465 () Bool)

(assert (=> b!1069443 m!987465))

(declare-fun m!987467 () Bool)

(assert (=> start!94588 m!987467))

(declare-fun m!987469 () Bool)

(assert (=> start!94588 m!987469))

(declare-fun m!987471 () Bool)

(assert (=> start!94588 m!987471))

(declare-fun m!987473 () Bool)

(assert (=> b!1069447 m!987473))

(check-sat (not b!1069447) tp_is_empty!25687 (not b!1069444) b_and!34663 (not start!94588) (not mapNonEmpty!40231) (not b!1069443) (not b_next!21877))
(check-sat b_and!34663 (not b_next!21877))
