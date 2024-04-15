; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94606 () Bool)

(assert start!94606)

(declare-fun b_free!21895 () Bool)

(declare-fun b_next!21895 () Bool)

(assert (=> start!94606 (= b_free!21895 (not b_next!21895))))

(declare-fun tp!77138 () Bool)

(declare-fun b_and!34681 () Bool)

(assert (=> start!94606 (= tp!77138 b_and!34681)))

(declare-fun b!1069632 () Bool)

(declare-fun e!610476 () Bool)

(declare-fun tp_is_empty!25705 () Bool)

(assert (=> b!1069632 (= e!610476 tp_is_empty!25705)))

(declare-fun b!1069633 () Bool)

(declare-fun e!610475 () Bool)

(assert (=> b!1069633 (= e!610475 tp_is_empty!25705)))

(declare-fun mapIsEmpty!40258 () Bool)

(declare-fun mapRes!40258 () Bool)

(assert (=> mapIsEmpty!40258 mapRes!40258))

(declare-fun b!1069634 () Bool)

(declare-fun e!610479 () Bool)

(assert (=> b!1069634 (= e!610479 (and e!610475 mapRes!40258))))

(declare-fun condMapEmpty!40258 () Bool)

(declare-datatypes ((V!39409 0))(
  ( (V!39410 (val!12903 Int)) )
))
(declare-datatypes ((ValueCell!12149 0))(
  ( (ValueCellFull!12149 (v!15518 V!39409)) (EmptyCell!12149) )
))
(declare-datatypes ((array!68328 0))(
  ( (array!68329 (arr!32862 (Array (_ BitVec 32) ValueCell!12149)) (size!33400 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68328)

(declare-fun mapDefault!40258 () ValueCell!12149)

(assert (=> b!1069634 (= condMapEmpty!40258 (= (arr!32862 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12149)) mapDefault!40258)))))

(declare-fun b!1069635 () Bool)

(declare-fun res!713678 () Bool)

(declare-fun e!610477 () Bool)

(assert (=> b!1069635 (=> (not res!713678) (not e!610477))))

(declare-datatypes ((array!68330 0))(
  ( (array!68331 (arr!32863 (Array (_ BitVec 32) (_ BitVec 64))) (size!33401 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68330)

(declare-datatypes ((List!22988 0))(
  ( (Nil!22985) (Cons!22984 (h!24193 (_ BitVec 64)) (t!32308 List!22988)) )
))
(declare-fun arrayNoDuplicates!0 (array!68330 (_ BitVec 32) List!22988) Bool)

(assert (=> b!1069635 (= res!713678 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22985))))

(declare-fun b!1069636 () Bool)

(declare-fun res!713681 () Bool)

(assert (=> b!1069636 (=> (not res!713681) (not e!610477))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68330 (_ BitVec 32)) Bool)

(assert (=> b!1069636 (= res!713681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069637 () Bool)

(declare-fun res!713679 () Bool)

(assert (=> b!1069637 (=> (not res!713679) (not e!610477))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069637 (= res!713679 (and (= (size!33400 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33401 _keys!1163) (size!33400 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069638 () Bool)

(assert (=> b!1069638 (= e!610477 (not true))))

(declare-datatypes ((tuple2!16460 0))(
  ( (tuple2!16461 (_1!8241 (_ BitVec 64)) (_2!8241 V!39409)) )
))
(declare-datatypes ((List!22989 0))(
  ( (Nil!22986) (Cons!22985 (h!24194 tuple2!16460) (t!32309 List!22989)) )
))
(declare-datatypes ((ListLongMap!14429 0))(
  ( (ListLongMap!14430 (toList!7230 List!22989)) )
))
(declare-fun lt!472559 () ListLongMap!14429)

(declare-fun lt!472560 () ListLongMap!14429)

(assert (=> b!1069638 (= lt!472559 lt!472560)))

(declare-fun zeroValueBefore!47 () V!39409)

(declare-datatypes ((Unit!35048 0))(
  ( (Unit!35049) )
))
(declare-fun lt!472561 () Unit!35048)

(declare-fun minValue!907 () V!39409)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39409)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!813 (array!68330 array!68328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 V!39409 V!39409 (_ BitVec 32) Int) Unit!35048)

(assert (=> b!1069638 (= lt!472561 (lemmaNoChangeToArrayThenSameMapNoExtras!813 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3819 (array!68330 array!68328 (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 (_ BitVec 32) Int) ListLongMap!14429)

(assert (=> b!1069638 (= lt!472560 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069638 (= lt!472559 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713680 () Bool)

(assert (=> start!94606 (=> (not res!713680) (not e!610477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94606 (= res!713680 (validMask!0 mask!1515))))

(assert (=> start!94606 e!610477))

(assert (=> start!94606 true))

(assert (=> start!94606 tp_is_empty!25705))

(declare-fun array_inv!25430 (array!68328) Bool)

(assert (=> start!94606 (and (array_inv!25430 _values!955) e!610479)))

(assert (=> start!94606 tp!77138))

(declare-fun array_inv!25431 (array!68330) Bool)

(assert (=> start!94606 (array_inv!25431 _keys!1163)))

(declare-fun mapNonEmpty!40258 () Bool)

(declare-fun tp!77137 () Bool)

(assert (=> mapNonEmpty!40258 (= mapRes!40258 (and tp!77137 e!610476))))

(declare-fun mapValue!40258 () ValueCell!12149)

(declare-fun mapRest!40258 () (Array (_ BitVec 32) ValueCell!12149))

(declare-fun mapKey!40258 () (_ BitVec 32))

(assert (=> mapNonEmpty!40258 (= (arr!32862 _values!955) (store mapRest!40258 mapKey!40258 mapValue!40258))))

(assert (= (and start!94606 res!713680) b!1069637))

(assert (= (and b!1069637 res!713679) b!1069636))

(assert (= (and b!1069636 res!713681) b!1069635))

(assert (= (and b!1069635 res!713678) b!1069638))

(assert (= (and b!1069634 condMapEmpty!40258) mapIsEmpty!40258))

(assert (= (and b!1069634 (not condMapEmpty!40258)) mapNonEmpty!40258))

(get-info :version)

(assert (= (and mapNonEmpty!40258 ((_ is ValueCellFull!12149) mapValue!40258)) b!1069632))

(assert (= (and b!1069634 ((_ is ValueCellFull!12149) mapDefault!40258)) b!1069633))

(assert (= start!94606 b!1069634))

(declare-fun m!987619 () Bool)

(assert (=> b!1069635 m!987619))

(declare-fun m!987621 () Bool)

(assert (=> mapNonEmpty!40258 m!987621))

(declare-fun m!987623 () Bool)

(assert (=> b!1069636 m!987623))

(declare-fun m!987625 () Bool)

(assert (=> start!94606 m!987625))

(declare-fun m!987627 () Bool)

(assert (=> start!94606 m!987627))

(declare-fun m!987629 () Bool)

(assert (=> start!94606 m!987629))

(declare-fun m!987631 () Bool)

(assert (=> b!1069638 m!987631))

(declare-fun m!987633 () Bool)

(assert (=> b!1069638 m!987633))

(declare-fun m!987635 () Bool)

(assert (=> b!1069638 m!987635))

(check-sat b_and!34681 (not start!94606) tp_is_empty!25705 (not b!1069636) (not b_next!21895) (not mapNonEmpty!40258) (not b!1069638) (not b!1069635))
(check-sat b_and!34681 (not b_next!21895))
