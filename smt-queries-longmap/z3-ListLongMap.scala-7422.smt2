; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94604 () Bool)

(assert start!94604)

(declare-fun b_free!21709 () Bool)

(declare-fun b_next!21709 () Bool)

(assert (=> start!94604 (= b_free!21709 (not b_next!21709))))

(declare-fun tp!76570 () Bool)

(declare-fun b_and!34503 () Bool)

(assert (=> start!94604 (= tp!76570 b_and!34503)))

(declare-fun mapIsEmpty!39970 () Bool)

(declare-fun mapRes!39970 () Bool)

(assert (=> mapIsEmpty!39970 mapRes!39970))

(declare-fun b!1068427 () Bool)

(declare-fun res!712667 () Bool)

(declare-fun e!609441 () Bool)

(assert (=> b!1068427 (=> (not res!712667) (not e!609441))))

(declare-datatypes ((array!68067 0))(
  ( (array!68068 (arr!32728 (Array (_ BitVec 32) (_ BitVec 64))) (size!33265 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68067)

(declare-datatypes ((List!22799 0))(
  ( (Nil!22796) (Cons!22795 (h!24013 (_ BitVec 64)) (t!32114 List!22799)) )
))
(declare-fun arrayNoDuplicates!0 (array!68067 (_ BitVec 32) List!22799) Bool)

(assert (=> b!1068427 (= res!712667 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22796))))

(declare-fun mapNonEmpty!39970 () Bool)

(declare-fun tp!76571 () Bool)

(declare-fun e!609442 () Bool)

(assert (=> mapNonEmpty!39970 (= mapRes!39970 (and tp!76571 e!609442))))

(declare-fun mapKey!39970 () (_ BitVec 32))

(declare-datatypes ((V!39161 0))(
  ( (V!39162 (val!12810 Int)) )
))
(declare-datatypes ((ValueCell!12056 0))(
  ( (ValueCellFull!12056 (v!15420 V!39161)) (EmptyCell!12056) )
))
(declare-fun mapValue!39970 () ValueCell!12056)

(declare-datatypes ((array!68069 0))(
  ( (array!68070 (arr!32729 (Array (_ BitVec 32) ValueCell!12056)) (size!33266 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68069)

(declare-fun mapRest!39970 () (Array (_ BitVec 32) ValueCell!12056))

(assert (=> mapNonEmpty!39970 (= (arr!32729 _values!955) (store mapRest!39970 mapKey!39970 mapValue!39970))))

(declare-fun b!1068428 () Bool)

(declare-fun tp_is_empty!25519 () Bool)

(assert (=> b!1068428 (= e!609442 tp_is_empty!25519)))

(declare-fun res!712669 () Bool)

(assert (=> start!94604 (=> (not res!712669) (not e!609441))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94604 (= res!712669 (validMask!0 mask!1515))))

(assert (=> start!94604 e!609441))

(assert (=> start!94604 true))

(assert (=> start!94604 tp_is_empty!25519))

(declare-fun e!609440 () Bool)

(declare-fun array_inv!25358 (array!68069) Bool)

(assert (=> start!94604 (and (array_inv!25358 _values!955) e!609440)))

(assert (=> start!94604 tp!76570))

(declare-fun array_inv!25359 (array!68067) Bool)

(assert (=> start!94604 (array_inv!25359 _keys!1163)))

(declare-fun b!1068429 () Bool)

(declare-fun res!712668 () Bool)

(assert (=> b!1068429 (=> (not res!712668) (not e!609441))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068429 (= res!712668 (and (= (size!33266 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33265 _keys!1163) (size!33266 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068430 () Bool)

(declare-fun res!712670 () Bool)

(assert (=> b!1068430 (=> (not res!712670) (not e!609441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68067 (_ BitVec 32)) Bool)

(assert (=> b!1068430 (= res!712670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068431 () Bool)

(declare-fun e!609444 () Bool)

(assert (=> b!1068431 (= e!609440 (and e!609444 mapRes!39970))))

(declare-fun condMapEmpty!39970 () Bool)

(declare-fun mapDefault!39970 () ValueCell!12056)

(assert (=> b!1068431 (= condMapEmpty!39970 (= (arr!32729 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12056)) mapDefault!39970)))))

(declare-fun b!1068432 () Bool)

(assert (=> b!1068432 (= e!609444 tp_is_empty!25519)))

(declare-fun b!1068433 () Bool)

(assert (=> b!1068433 (= e!609441 (not true))))

(declare-datatypes ((tuple2!16230 0))(
  ( (tuple2!16231 (_1!8126 (_ BitVec 64)) (_2!8126 V!39161)) )
))
(declare-datatypes ((List!22800 0))(
  ( (Nil!22797) (Cons!22796 (h!24014 tuple2!16230) (t!32115 List!22800)) )
))
(declare-datatypes ((ListLongMap!14207 0))(
  ( (ListLongMap!14208 (toList!7119 List!22800)) )
))
(declare-fun lt!471816 () ListLongMap!14207)

(declare-fun lt!471818 () ListLongMap!14207)

(assert (=> b!1068433 (= lt!471816 lt!471818)))

(declare-fun zeroValueBefore!47 () V!39161)

(declare-datatypes ((Unit!35036 0))(
  ( (Unit!35037) )
))
(declare-fun lt!471817 () Unit!35036)

(declare-fun minValue!907 () V!39161)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39161)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!741 (array!68067 array!68069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39161 V!39161 V!39161 V!39161 (_ BitVec 32) Int) Unit!35036)

(assert (=> b!1068433 (= lt!471817 (lemmaNoChangeToArrayThenSameMapNoExtras!741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3738 (array!68067 array!68069 (_ BitVec 32) (_ BitVec 32) V!39161 V!39161 (_ BitVec 32) Int) ListLongMap!14207)

(assert (=> b!1068433 (= lt!471818 (getCurrentListMapNoExtraKeys!3738 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068433 (= lt!471816 (getCurrentListMapNoExtraKeys!3738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94604 res!712669) b!1068429))

(assert (= (and b!1068429 res!712668) b!1068430))

(assert (= (and b!1068430 res!712670) b!1068427))

(assert (= (and b!1068427 res!712667) b!1068433))

(assert (= (and b!1068431 condMapEmpty!39970) mapIsEmpty!39970))

(assert (= (and b!1068431 (not condMapEmpty!39970)) mapNonEmpty!39970))

(get-info :version)

(assert (= (and mapNonEmpty!39970 ((_ is ValueCellFull!12056) mapValue!39970)) b!1068428))

(assert (= (and b!1068431 ((_ is ValueCellFull!12056) mapDefault!39970)) b!1068432))

(assert (= start!94604 b!1068431))

(declare-fun m!987481 () Bool)

(assert (=> mapNonEmpty!39970 m!987481))

(declare-fun m!987483 () Bool)

(assert (=> b!1068430 m!987483))

(declare-fun m!987485 () Bool)

(assert (=> start!94604 m!987485))

(declare-fun m!987487 () Bool)

(assert (=> start!94604 m!987487))

(declare-fun m!987489 () Bool)

(assert (=> start!94604 m!987489))

(declare-fun m!987491 () Bool)

(assert (=> b!1068427 m!987491))

(declare-fun m!987493 () Bool)

(assert (=> b!1068433 m!987493))

(declare-fun m!987495 () Bool)

(assert (=> b!1068433 m!987495))

(declare-fun m!987497 () Bool)

(assert (=> b!1068433 m!987497))

(check-sat (not b!1068433) (not b_next!21709) (not start!94604) tp_is_empty!25519 (not b!1068427) (not mapNonEmpty!39970) b_and!34503 (not b!1068430))
(check-sat b_and!34503 (not b_next!21709))
