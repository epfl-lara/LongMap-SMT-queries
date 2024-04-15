; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94594 () Bool)

(assert start!94594)

(declare-fun b_free!21883 () Bool)

(declare-fun b_next!21883 () Bool)

(assert (=> start!94594 (= b_free!21883 (not b_next!21883))))

(declare-fun tp!77102 () Bool)

(declare-fun b_and!34669 () Bool)

(assert (=> start!94594 (= tp!77102 b_and!34669)))

(declare-fun b!1069506 () Bool)

(declare-fun e!610387 () Bool)

(declare-fun tp_is_empty!25693 () Bool)

(assert (=> b!1069506 (= e!610387 tp_is_empty!25693)))

(declare-fun mapNonEmpty!40240 () Bool)

(declare-fun mapRes!40240 () Bool)

(declare-fun tp!77101 () Bool)

(assert (=> mapNonEmpty!40240 (= mapRes!40240 (and tp!77101 e!610387))))

(declare-datatypes ((V!39393 0))(
  ( (V!39394 (val!12897 Int)) )
))
(declare-datatypes ((ValueCell!12143 0))(
  ( (ValueCellFull!12143 (v!15512 V!39393)) (EmptyCell!12143) )
))
(declare-fun mapRest!40240 () (Array (_ BitVec 32) ValueCell!12143))

(declare-datatypes ((array!68308 0))(
  ( (array!68309 (arr!32852 (Array (_ BitVec 32) ValueCell!12143)) (size!33390 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68308)

(declare-fun mapKey!40240 () (_ BitVec 32))

(declare-fun mapValue!40240 () ValueCell!12143)

(assert (=> mapNonEmpty!40240 (= (arr!32852 _values!955) (store mapRest!40240 mapKey!40240 mapValue!40240))))

(declare-fun b!1069507 () Bool)

(declare-fun res!713607 () Bool)

(declare-fun e!610385 () Bool)

(assert (=> b!1069507 (=> (not res!713607) (not e!610385))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68310 0))(
  ( (array!68311 (arr!32853 (Array (_ BitVec 32) (_ BitVec 64))) (size!33391 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68310)

(assert (=> b!1069507 (= res!713607 (and (= (size!33390 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33391 _keys!1163) (size!33390 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40240 () Bool)

(assert (=> mapIsEmpty!40240 mapRes!40240))

(declare-fun b!1069508 () Bool)

(declare-fun res!713606 () Bool)

(assert (=> b!1069508 (=> (not res!713606) (not e!610385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68310 (_ BitVec 32)) Bool)

(assert (=> b!1069508 (= res!713606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069510 () Bool)

(declare-fun res!713608 () Bool)

(assert (=> b!1069510 (=> (not res!713608) (not e!610385))))

(declare-datatypes ((List!22983 0))(
  ( (Nil!22980) (Cons!22979 (h!24188 (_ BitVec 64)) (t!32303 List!22983)) )
))
(declare-fun arrayNoDuplicates!0 (array!68310 (_ BitVec 32) List!22983) Bool)

(assert (=> b!1069510 (= res!713608 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22980))))

(declare-fun b!1069509 () Bool)

(assert (=> b!1069509 (= e!610385 (not true))))

(declare-datatypes ((tuple2!16454 0))(
  ( (tuple2!16455 (_1!8238 (_ BitVec 64)) (_2!8238 V!39393)) )
))
(declare-datatypes ((List!22984 0))(
  ( (Nil!22981) (Cons!22980 (h!24189 tuple2!16454) (t!32304 List!22984)) )
))
(declare-datatypes ((ListLongMap!14423 0))(
  ( (ListLongMap!14424 (toList!7227 List!22984)) )
))
(declare-fun lt!472505 () ListLongMap!14423)

(declare-fun lt!472507 () ListLongMap!14423)

(assert (=> b!1069509 (= lt!472505 lt!472507)))

(declare-fun zeroValueBefore!47 () V!39393)

(declare-datatypes ((Unit!35042 0))(
  ( (Unit!35043) )
))
(declare-fun lt!472506 () Unit!35042)

(declare-fun minValue!907 () V!39393)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39393)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!810 (array!68310 array!68308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 V!39393 V!39393 (_ BitVec 32) Int) Unit!35042)

(assert (=> b!1069509 (= lt!472506 (lemmaNoChangeToArrayThenSameMapNoExtras!810 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3816 (array!68310 array!68308 (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 (_ BitVec 32) Int) ListLongMap!14423)

(assert (=> b!1069509 (= lt!472507 (getCurrentListMapNoExtraKeys!3816 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069509 (= lt!472505 (getCurrentListMapNoExtraKeys!3816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713609 () Bool)

(assert (=> start!94594 (=> (not res!713609) (not e!610385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94594 (= res!713609 (validMask!0 mask!1515))))

(assert (=> start!94594 e!610385))

(assert (=> start!94594 true))

(assert (=> start!94594 tp_is_empty!25693))

(declare-fun e!610389 () Bool)

(declare-fun array_inv!25426 (array!68308) Bool)

(assert (=> start!94594 (and (array_inv!25426 _values!955) e!610389)))

(assert (=> start!94594 tp!77102))

(declare-fun array_inv!25427 (array!68310) Bool)

(assert (=> start!94594 (array_inv!25427 _keys!1163)))

(declare-fun b!1069511 () Bool)

(declare-fun e!610386 () Bool)

(assert (=> b!1069511 (= e!610389 (and e!610386 mapRes!40240))))

(declare-fun condMapEmpty!40240 () Bool)

(declare-fun mapDefault!40240 () ValueCell!12143)

(assert (=> b!1069511 (= condMapEmpty!40240 (= (arr!32852 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12143)) mapDefault!40240)))))

(declare-fun b!1069512 () Bool)

(assert (=> b!1069512 (= e!610386 tp_is_empty!25693)))

(assert (= (and start!94594 res!713609) b!1069507))

(assert (= (and b!1069507 res!713607) b!1069508))

(assert (= (and b!1069508 res!713606) b!1069510))

(assert (= (and b!1069510 res!713608) b!1069509))

(assert (= (and b!1069511 condMapEmpty!40240) mapIsEmpty!40240))

(assert (= (and b!1069511 (not condMapEmpty!40240)) mapNonEmpty!40240))

(get-info :version)

(assert (= (and mapNonEmpty!40240 ((_ is ValueCellFull!12143) mapValue!40240)) b!1069506))

(assert (= (and b!1069511 ((_ is ValueCellFull!12143) mapDefault!40240)) b!1069512))

(assert (= start!94594 b!1069511))

(declare-fun m!987511 () Bool)

(assert (=> b!1069510 m!987511))

(declare-fun m!987513 () Bool)

(assert (=> b!1069509 m!987513))

(declare-fun m!987515 () Bool)

(assert (=> b!1069509 m!987515))

(declare-fun m!987517 () Bool)

(assert (=> b!1069509 m!987517))

(declare-fun m!987519 () Bool)

(assert (=> b!1069508 m!987519))

(declare-fun m!987521 () Bool)

(assert (=> mapNonEmpty!40240 m!987521))

(declare-fun m!987523 () Bool)

(assert (=> start!94594 m!987523))

(declare-fun m!987525 () Bool)

(assert (=> start!94594 m!987525))

(declare-fun m!987527 () Bool)

(assert (=> start!94594 m!987527))

(check-sat (not b!1069510) (not b_next!21883) tp_is_empty!25693 b_and!34669 (not start!94594) (not b!1069509) (not b!1069508) (not mapNonEmpty!40240))
(check-sat b_and!34669 (not b_next!21883))
