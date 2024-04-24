; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95118 () Bool)

(assert start!95118)

(declare-fun b_free!22087 () Bool)

(declare-fun b_next!22087 () Bool)

(assert (=> start!95118 (= b_free!22087 (not b_next!22087))))

(declare-fun tp!77725 () Bool)

(declare-fun b_and!34951 () Bool)

(assert (=> start!95118 (= tp!77725 b_and!34951)))

(declare-fun b!1074186 () Bool)

(declare-fun e!613702 () Bool)

(declare-fun tp_is_empty!25897 () Bool)

(assert (=> b!1074186 (= e!613702 tp_is_empty!25897)))

(declare-fun res!716131 () Bool)

(declare-fun e!613703 () Bool)

(assert (=> start!95118 (=> (not res!716131) (not e!613703))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95118 (= res!716131 (validMask!0 mask!1515))))

(assert (=> start!95118 e!613703))

(assert (=> start!95118 true))

(assert (=> start!95118 tp_is_empty!25897))

(declare-datatypes ((V!39665 0))(
  ( (V!39666 (val!12999 Int)) )
))
(declare-datatypes ((ValueCell!12245 0))(
  ( (ValueCellFull!12245 (v!15613 V!39665)) (EmptyCell!12245) )
))
(declare-datatypes ((array!68805 0))(
  ( (array!68806 (arr!33090 (Array (_ BitVec 32) ValueCell!12245)) (size!33627 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68805)

(declare-fun e!613700 () Bool)

(declare-fun array_inv!25612 (array!68805) Bool)

(assert (=> start!95118 (and (array_inv!25612 _values!955) e!613700)))

(assert (=> start!95118 tp!77725))

(declare-datatypes ((array!68807 0))(
  ( (array!68808 (arr!33091 (Array (_ BitVec 32) (_ BitVec 64))) (size!33628 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68807)

(declare-fun array_inv!25613 (array!68807) Bool)

(assert (=> start!95118 (array_inv!25613 _keys!1163)))

(declare-fun b!1074187 () Bool)

(declare-fun mapRes!40558 () Bool)

(assert (=> b!1074187 (= e!613700 (and e!613702 mapRes!40558))))

(declare-fun condMapEmpty!40558 () Bool)

(declare-fun mapDefault!40558 () ValueCell!12245)

(assert (=> b!1074187 (= condMapEmpty!40558 (= (arr!33090 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12245)) mapDefault!40558)))))

(declare-fun mapIsEmpty!40558 () Bool)

(assert (=> mapIsEmpty!40558 mapRes!40558))

(declare-fun b!1074188 () Bool)

(declare-fun res!716132 () Bool)

(assert (=> b!1074188 (=> (not res!716132) (not e!613703))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074188 (= res!716132 (and (= (size!33627 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33628 _keys!1163) (size!33627 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074189 () Bool)

(assert (=> b!1074189 (= e!613703 (not true))))

(declare-datatypes ((tuple2!16534 0))(
  ( (tuple2!16535 (_1!8278 (_ BitVec 64)) (_2!8278 V!39665)) )
))
(declare-datatypes ((List!23089 0))(
  ( (Nil!23086) (Cons!23085 (h!24303 tuple2!16534) (t!32418 List!23089)) )
))
(declare-datatypes ((ListLongMap!14511 0))(
  ( (ListLongMap!14512 (toList!7271 List!23089)) )
))
(declare-fun lt!476391 () ListLongMap!14511)

(declare-fun lt!476390 () ListLongMap!14511)

(assert (=> b!1074189 (= lt!476391 lt!476390)))

(declare-fun zeroValueBefore!47 () V!39665)

(declare-fun minValue!907 () V!39665)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39665)

(declare-datatypes ((Unit!35323 0))(
  ( (Unit!35324) )
))
(declare-fun lt!476389 () Unit!35323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!872 (array!68807 array!68805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39665 V!39665 V!39665 V!39665 (_ BitVec 32) Int) Unit!35323)

(assert (=> b!1074189 (= lt!476389 (lemmaNoChangeToArrayThenSameMapNoExtras!872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3869 (array!68807 array!68805 (_ BitVec 32) (_ BitVec 32) V!39665 V!39665 (_ BitVec 32) Int) ListLongMap!14511)

(assert (=> b!1074189 (= lt!476390 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074189 (= lt!476391 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074190 () Bool)

(declare-fun res!716133 () Bool)

(assert (=> b!1074190 (=> (not res!716133) (not e!613703))))

(declare-datatypes ((List!23090 0))(
  ( (Nil!23087) (Cons!23086 (h!24304 (_ BitVec 64)) (t!32419 List!23090)) )
))
(declare-fun arrayNoDuplicates!0 (array!68807 (_ BitVec 32) List!23090) Bool)

(assert (=> b!1074190 (= res!716133 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23087))))

(declare-fun b!1074191 () Bool)

(declare-fun e!613701 () Bool)

(assert (=> b!1074191 (= e!613701 tp_is_empty!25897)))

(declare-fun mapNonEmpty!40558 () Bool)

(declare-fun tp!77726 () Bool)

(assert (=> mapNonEmpty!40558 (= mapRes!40558 (and tp!77726 e!613701))))

(declare-fun mapKey!40558 () (_ BitVec 32))

(declare-fun mapRest!40558 () (Array (_ BitVec 32) ValueCell!12245))

(declare-fun mapValue!40558 () ValueCell!12245)

(assert (=> mapNonEmpty!40558 (= (arr!33090 _values!955) (store mapRest!40558 mapKey!40558 mapValue!40558))))

(declare-fun b!1074192 () Bool)

(declare-fun res!716134 () Bool)

(assert (=> b!1074192 (=> (not res!716134) (not e!613703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68807 (_ BitVec 32)) Bool)

(assert (=> b!1074192 (= res!716134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95118 res!716131) b!1074188))

(assert (= (and b!1074188 res!716132) b!1074192))

(assert (= (and b!1074192 res!716134) b!1074190))

(assert (= (and b!1074190 res!716133) b!1074189))

(assert (= (and b!1074187 condMapEmpty!40558) mapIsEmpty!40558))

(assert (= (and b!1074187 (not condMapEmpty!40558)) mapNonEmpty!40558))

(get-info :version)

(assert (= (and mapNonEmpty!40558 ((_ is ValueCellFull!12245) mapValue!40558)) b!1074191))

(assert (= (and b!1074187 ((_ is ValueCellFull!12245) mapDefault!40558)) b!1074186))

(assert (= start!95118 b!1074187))

(declare-fun m!993649 () Bool)

(assert (=> b!1074190 m!993649))

(declare-fun m!993651 () Bool)

(assert (=> b!1074189 m!993651))

(declare-fun m!993653 () Bool)

(assert (=> b!1074189 m!993653))

(declare-fun m!993655 () Bool)

(assert (=> b!1074189 m!993655))

(declare-fun m!993657 () Bool)

(assert (=> mapNonEmpty!40558 m!993657))

(declare-fun m!993659 () Bool)

(assert (=> start!95118 m!993659))

(declare-fun m!993661 () Bool)

(assert (=> start!95118 m!993661))

(declare-fun m!993663 () Bool)

(assert (=> start!95118 m!993663))

(declare-fun m!993665 () Bool)

(assert (=> b!1074192 m!993665))

(check-sat (not b!1074190) (not b!1074189) (not b!1074192) tp_is_empty!25897 (not start!95118) (not mapNonEmpty!40558) b_and!34951 (not b_next!22087))
(check-sat b_and!34951 (not b_next!22087))
