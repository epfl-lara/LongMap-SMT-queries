; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95148 () Bool)

(assert start!95148)

(declare-fun b_free!22117 () Bool)

(declare-fun b_next!22117 () Bool)

(assert (=> start!95148 (= b_free!22117 (not b_next!22117))))

(declare-fun tp!77815 () Bool)

(declare-fun b_and!34981 () Bool)

(assert (=> start!95148 (= tp!77815 b_and!34981)))

(declare-fun mapNonEmpty!40603 () Bool)

(declare-fun mapRes!40603 () Bool)

(declare-fun tp!77816 () Bool)

(declare-fun e!613927 () Bool)

(assert (=> mapNonEmpty!40603 (= mapRes!40603 (and tp!77816 e!613927))))

(declare-datatypes ((V!39705 0))(
  ( (V!39706 (val!13014 Int)) )
))
(declare-datatypes ((ValueCell!12260 0))(
  ( (ValueCellFull!12260 (v!15628 V!39705)) (EmptyCell!12260) )
))
(declare-fun mapValue!40603 () ValueCell!12260)

(declare-fun mapKey!40603 () (_ BitVec 32))

(declare-datatypes ((array!68865 0))(
  ( (array!68866 (arr!33120 (Array (_ BitVec 32) ValueCell!12260)) (size!33657 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68865)

(declare-fun mapRest!40603 () (Array (_ BitVec 32) ValueCell!12260))

(assert (=> mapNonEmpty!40603 (= (arr!33120 _values!955) (store mapRest!40603 mapKey!40603 mapValue!40603))))

(declare-fun b!1074501 () Bool)

(declare-fun e!613928 () Bool)

(assert (=> b!1074501 (= e!613928 false)))

(declare-datatypes ((tuple2!16558 0))(
  ( (tuple2!16559 (_1!8290 (_ BitVec 64)) (_2!8290 V!39705)) )
))
(declare-datatypes ((List!23115 0))(
  ( (Nil!23112) (Cons!23111 (h!24329 tuple2!16558) (t!32444 List!23115)) )
))
(declare-datatypes ((ListLongMap!14535 0))(
  ( (ListLongMap!14536 (toList!7283 List!23115)) )
))
(declare-fun lt!476487 () ListLongMap!14535)

(declare-fun minValue!907 () V!39705)

(declare-datatypes ((array!68867 0))(
  ( (array!68868 (arr!33121 (Array (_ BitVec 32) (_ BitVec 64))) (size!33658 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68867)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39705)

(declare-fun getCurrentListMapNoExtraKeys!3881 (array!68867 array!68865 (_ BitVec 32) (_ BitVec 32) V!39705 V!39705 (_ BitVec 32) Int) ListLongMap!14535)

(assert (=> b!1074501 (= lt!476487 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39705)

(declare-fun lt!476486 () ListLongMap!14535)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074501 (= lt!476486 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716314 () Bool)

(assert (=> start!95148 (=> (not res!716314) (not e!613928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95148 (= res!716314 (validMask!0 mask!1515))))

(assert (=> start!95148 e!613928))

(assert (=> start!95148 true))

(declare-fun tp_is_empty!25927 () Bool)

(assert (=> start!95148 tp_is_empty!25927))

(declare-fun e!613926 () Bool)

(declare-fun array_inv!25638 (array!68865) Bool)

(assert (=> start!95148 (and (array_inv!25638 _values!955) e!613926)))

(assert (=> start!95148 tp!77815))

(declare-fun array_inv!25639 (array!68867) Bool)

(assert (=> start!95148 (array_inv!25639 _keys!1163)))

(declare-fun b!1074502 () Bool)

(declare-fun e!613924 () Bool)

(assert (=> b!1074502 (= e!613926 (and e!613924 mapRes!40603))))

(declare-fun condMapEmpty!40603 () Bool)

(declare-fun mapDefault!40603 () ValueCell!12260)

(assert (=> b!1074502 (= condMapEmpty!40603 (= (arr!33120 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12260)) mapDefault!40603)))))

(declare-fun b!1074503 () Bool)

(assert (=> b!1074503 (= e!613927 tp_is_empty!25927)))

(declare-fun b!1074504 () Bool)

(declare-fun res!716311 () Bool)

(assert (=> b!1074504 (=> (not res!716311) (not e!613928))))

(assert (=> b!1074504 (= res!716311 (and (= (size!33657 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33658 _keys!1163) (size!33657 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074505 () Bool)

(declare-fun res!716313 () Bool)

(assert (=> b!1074505 (=> (not res!716313) (not e!613928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68867 (_ BitVec 32)) Bool)

(assert (=> b!1074505 (= res!716313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074506 () Bool)

(declare-fun res!716312 () Bool)

(assert (=> b!1074506 (=> (not res!716312) (not e!613928))))

(declare-datatypes ((List!23116 0))(
  ( (Nil!23113) (Cons!23112 (h!24330 (_ BitVec 64)) (t!32445 List!23116)) )
))
(declare-fun arrayNoDuplicates!0 (array!68867 (_ BitVec 32) List!23116) Bool)

(assert (=> b!1074506 (= res!716312 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23113))))

(declare-fun b!1074507 () Bool)

(assert (=> b!1074507 (= e!613924 tp_is_empty!25927)))

(declare-fun mapIsEmpty!40603 () Bool)

(assert (=> mapIsEmpty!40603 mapRes!40603))

(assert (= (and start!95148 res!716314) b!1074504))

(assert (= (and b!1074504 res!716311) b!1074505))

(assert (= (and b!1074505 res!716313) b!1074506))

(assert (= (and b!1074506 res!716312) b!1074501))

(assert (= (and b!1074502 condMapEmpty!40603) mapIsEmpty!40603))

(assert (= (and b!1074502 (not condMapEmpty!40603)) mapNonEmpty!40603))

(get-info :version)

(assert (= (and mapNonEmpty!40603 ((_ is ValueCellFull!12260) mapValue!40603)) b!1074503))

(assert (= (and b!1074502 ((_ is ValueCellFull!12260) mapDefault!40603)) b!1074507))

(assert (= start!95148 b!1074502))

(declare-fun m!993895 () Bool)

(assert (=> b!1074506 m!993895))

(declare-fun m!993897 () Bool)

(assert (=> mapNonEmpty!40603 m!993897))

(declare-fun m!993899 () Bool)

(assert (=> b!1074501 m!993899))

(declare-fun m!993901 () Bool)

(assert (=> b!1074501 m!993901))

(declare-fun m!993903 () Bool)

(assert (=> start!95148 m!993903))

(declare-fun m!993905 () Bool)

(assert (=> start!95148 m!993905))

(declare-fun m!993907 () Bool)

(assert (=> start!95148 m!993907))

(declare-fun m!993909 () Bool)

(assert (=> b!1074505 m!993909))

(check-sat (not b_next!22117) (not b!1074506) (not start!95148) (not b!1074501) tp_is_empty!25927 (not mapNonEmpty!40603) b_and!34981 (not b!1074505))
(check-sat b_and!34981 (not b_next!22117))
