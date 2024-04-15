; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94374 () Bool)

(assert start!94374)

(declare-fun b_free!21721 () Bool)

(declare-fun b_next!21721 () Bool)

(assert (=> start!94374 (= b_free!21721 (not b_next!21721))))

(declare-fun tp!76607 () Bool)

(declare-fun b_and!34479 () Bool)

(assert (=> start!94374 (= tp!76607 b_and!34479)))

(declare-fun b!1067073 () Bool)

(declare-fun res!712149 () Bool)

(declare-fun e!608585 () Bool)

(assert (=> b!1067073 (=> (not res!712149) (not e!608585))))

(declare-datatypes ((array!67990 0))(
  ( (array!67991 (arr!32696 (Array (_ BitVec 32) (_ BitVec 64))) (size!33234 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67990)

(declare-datatypes ((List!22858 0))(
  ( (Nil!22855) (Cons!22854 (h!24063 (_ BitVec 64)) (t!32172 List!22858)) )
))
(declare-fun arrayNoDuplicates!0 (array!67990 (_ BitVec 32) List!22858) Bool)

(assert (=> b!1067073 (= res!712149 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22855))))

(declare-fun b!1067074 () Bool)

(declare-fun res!712150 () Bool)

(assert (=> b!1067074 (=> (not res!712150) (not e!608585))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67990 (_ BitVec 32)) Bool)

(assert (=> b!1067074 (= res!712150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067075 () Bool)

(declare-fun e!608582 () Bool)

(declare-fun tp_is_empty!25531 () Bool)

(assert (=> b!1067075 (= e!608582 tp_is_empty!25531)))

(declare-fun b!1067076 () Bool)

(declare-fun res!712148 () Bool)

(assert (=> b!1067076 (=> (not res!712148) (not e!608585))))

(declare-datatypes ((V!39177 0))(
  ( (V!39178 (val!12816 Int)) )
))
(declare-datatypes ((ValueCell!12062 0))(
  ( (ValueCellFull!12062 (v!15429 V!39177)) (EmptyCell!12062) )
))
(declare-datatypes ((array!67992 0))(
  ( (array!67993 (arr!32697 (Array (_ BitVec 32) ValueCell!12062)) (size!33235 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67992)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067076 (= res!712148 (and (= (size!33235 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33234 _keys!1163) (size!33235 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067077 () Bool)

(assert (=> b!1067077 (= e!608585 (not true))))

(declare-datatypes ((tuple2!16314 0))(
  ( (tuple2!16315 (_1!8168 (_ BitVec 64)) (_2!8168 V!39177)) )
))
(declare-datatypes ((List!22859 0))(
  ( (Nil!22856) (Cons!22855 (h!24064 tuple2!16314) (t!32173 List!22859)) )
))
(declare-datatypes ((ListLongMap!14283 0))(
  ( (ListLongMap!14284 (toList!7157 List!22859)) )
))
(declare-fun lt!471157 () ListLongMap!14283)

(declare-fun lt!471156 () ListLongMap!14283)

(assert (=> b!1067077 (= lt!471157 lt!471156)))

(declare-fun zeroValueBefore!47 () V!39177)

(declare-datatypes ((Unit!34904 0))(
  ( (Unit!34905) )
))
(declare-fun lt!471155 () Unit!34904)

(declare-fun minValue!907 () V!39177)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39177)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!747 (array!67990 array!67992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39177 V!39177 V!39177 V!39177 (_ BitVec 32) Int) Unit!34904)

(assert (=> b!1067077 (= lt!471155 (lemmaNoChangeToArrayThenSameMapNoExtras!747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3753 (array!67990 array!67992 (_ BitVec 32) (_ BitVec 32) V!39177 V!39177 (_ BitVec 32) Int) ListLongMap!14283)

(assert (=> b!1067077 (= lt!471156 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067077 (= lt!471157 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067078 () Bool)

(declare-fun e!608583 () Bool)

(assert (=> b!1067078 (= e!608583 tp_is_empty!25531)))

(declare-fun b!1067079 () Bool)

(declare-fun e!608586 () Bool)

(declare-fun mapRes!39988 () Bool)

(assert (=> b!1067079 (= e!608586 (and e!608583 mapRes!39988))))

(declare-fun condMapEmpty!39988 () Bool)

(declare-fun mapDefault!39988 () ValueCell!12062)

(assert (=> b!1067079 (= condMapEmpty!39988 (= (arr!32697 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12062)) mapDefault!39988)))))

(declare-fun mapIsEmpty!39988 () Bool)

(assert (=> mapIsEmpty!39988 mapRes!39988))

(declare-fun res!712151 () Bool)

(assert (=> start!94374 (=> (not res!712151) (not e!608585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94374 (= res!712151 (validMask!0 mask!1515))))

(assert (=> start!94374 e!608585))

(assert (=> start!94374 true))

(assert (=> start!94374 tp_is_empty!25531))

(declare-fun array_inv!25312 (array!67992) Bool)

(assert (=> start!94374 (and (array_inv!25312 _values!955) e!608586)))

(assert (=> start!94374 tp!76607))

(declare-fun array_inv!25313 (array!67990) Bool)

(assert (=> start!94374 (array_inv!25313 _keys!1163)))

(declare-fun mapNonEmpty!39988 () Bool)

(declare-fun tp!76606 () Bool)

(assert (=> mapNonEmpty!39988 (= mapRes!39988 (and tp!76606 e!608582))))

(declare-fun mapKey!39988 () (_ BitVec 32))

(declare-fun mapValue!39988 () ValueCell!12062)

(declare-fun mapRest!39988 () (Array (_ BitVec 32) ValueCell!12062))

(assert (=> mapNonEmpty!39988 (= (arr!32697 _values!955) (store mapRest!39988 mapKey!39988 mapValue!39988))))

(assert (= (and start!94374 res!712151) b!1067076))

(assert (= (and b!1067076 res!712148) b!1067074))

(assert (= (and b!1067074 res!712150) b!1067073))

(assert (= (and b!1067073 res!712149) b!1067077))

(assert (= (and b!1067079 condMapEmpty!39988) mapIsEmpty!39988))

(assert (= (and b!1067079 (not condMapEmpty!39988)) mapNonEmpty!39988))

(get-info :version)

(assert (= (and mapNonEmpty!39988 ((_ is ValueCellFull!12062) mapValue!39988)) b!1067075))

(assert (= (and b!1067079 ((_ is ValueCellFull!12062) mapDefault!39988)) b!1067078))

(assert (= start!94374 b!1067079))

(declare-fun m!985291 () Bool)

(assert (=> b!1067077 m!985291))

(declare-fun m!985293 () Bool)

(assert (=> b!1067077 m!985293))

(declare-fun m!985295 () Bool)

(assert (=> b!1067077 m!985295))

(declare-fun m!985297 () Bool)

(assert (=> start!94374 m!985297))

(declare-fun m!985299 () Bool)

(assert (=> start!94374 m!985299))

(declare-fun m!985301 () Bool)

(assert (=> start!94374 m!985301))

(declare-fun m!985303 () Bool)

(assert (=> b!1067074 m!985303))

(declare-fun m!985305 () Bool)

(assert (=> b!1067073 m!985305))

(declare-fun m!985307 () Bool)

(assert (=> mapNonEmpty!39988 m!985307))

(check-sat (not b_next!21721) (not mapNonEmpty!39988) (not b!1067074) (not b!1067073) b_and!34479 tp_is_empty!25531 (not b!1067077) (not start!94374))
(check-sat b_and!34479 (not b_next!21721))
