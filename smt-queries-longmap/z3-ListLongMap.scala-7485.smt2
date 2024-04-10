; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94884 () Bool)

(assert start!94884)

(declare-fun b_free!22089 () Bool)

(declare-fun b_next!22089 () Bool)

(assert (=> start!94884 (= b_free!22089 (not b_next!22089))))

(declare-fun tp!77731 () Bool)

(declare-fun b_and!34943 () Bool)

(assert (=> start!94884 (= tp!77731 b_and!34943)))

(declare-fun b!1072880 () Bool)

(declare-fun res!715622 () Bool)

(declare-fun e!612862 () Bool)

(assert (=> b!1072880 (=> (not res!715622) (not e!612862))))

(declare-datatypes ((array!68765 0))(
  ( (array!68766 (arr!33076 (Array (_ BitVec 32) (_ BitVec 64))) (size!33612 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68765)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68765 (_ BitVec 32)) Bool)

(assert (=> b!1072880 (= res!715622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715624 () Bool)

(assert (=> start!94884 (=> (not res!715624) (not e!612862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94884 (= res!715624 (validMask!0 mask!1515))))

(assert (=> start!94884 e!612862))

(assert (=> start!94884 true))

(declare-fun tp_is_empty!25899 () Bool)

(assert (=> start!94884 tp_is_empty!25899))

(declare-datatypes ((V!39667 0))(
  ( (V!39668 (val!13000 Int)) )
))
(declare-datatypes ((ValueCell!12246 0))(
  ( (ValueCellFull!12246 (v!15618 V!39667)) (EmptyCell!12246) )
))
(declare-datatypes ((array!68767 0))(
  ( (array!68768 (arr!33077 (Array (_ BitVec 32) ValueCell!12246)) (size!33613 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68767)

(declare-fun e!612861 () Bool)

(declare-fun array_inv!25566 (array!68767) Bool)

(assert (=> start!94884 (and (array_inv!25566 _values!955) e!612861)))

(assert (=> start!94884 tp!77731))

(declare-fun array_inv!25567 (array!68765) Bool)

(assert (=> start!94884 (array_inv!25567 _keys!1163)))

(declare-fun b!1072881 () Bool)

(declare-fun res!715621 () Bool)

(assert (=> b!1072881 (=> (not res!715621) (not e!612862))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072881 (= res!715621 (and (= (size!33613 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33612 _keys!1163) (size!33613 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072882 () Bool)

(declare-fun e!612860 () Bool)

(assert (=> b!1072882 (= e!612860 tp_is_empty!25899)))

(declare-fun mapNonEmpty!40561 () Bool)

(declare-fun mapRes!40561 () Bool)

(declare-fun tp!77732 () Bool)

(declare-fun e!612859 () Bool)

(assert (=> mapNonEmpty!40561 (= mapRes!40561 (and tp!77732 e!612859))))

(declare-fun mapRest!40561 () (Array (_ BitVec 32) ValueCell!12246))

(declare-fun mapKey!40561 () (_ BitVec 32))

(declare-fun mapValue!40561 () ValueCell!12246)

(assert (=> mapNonEmpty!40561 (= (arr!33077 _values!955) (store mapRest!40561 mapKey!40561 mapValue!40561))))

(declare-fun mapIsEmpty!40561 () Bool)

(assert (=> mapIsEmpty!40561 mapRes!40561))

(declare-fun b!1072883 () Bool)

(assert (=> b!1072883 (= e!612862 (not true))))

(declare-datatypes ((tuple2!16556 0))(
  ( (tuple2!16557 (_1!8289 (_ BitVec 64)) (_2!8289 V!39667)) )
))
(declare-datatypes ((List!23091 0))(
  ( (Nil!23088) (Cons!23087 (h!24296 tuple2!16556) (t!32428 List!23091)) )
))
(declare-datatypes ((ListLongMap!14525 0))(
  ( (ListLongMap!14526 (toList!7278 List!23091)) )
))
(declare-fun lt!475884 () ListLongMap!14525)

(declare-fun lt!475885 () ListLongMap!14525)

(assert (=> b!1072883 (= lt!475884 lt!475885)))

(declare-fun zeroValueBefore!47 () V!39667)

(declare-datatypes ((Unit!35352 0))(
  ( (Unit!35353) )
))
(declare-fun lt!475883 () Unit!35352)

(declare-fun minValue!907 () V!39667)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39667)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!879 (array!68765 array!68767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39667 V!39667 V!39667 V!39667 (_ BitVec 32) Int) Unit!35352)

(assert (=> b!1072883 (= lt!475883 (lemmaNoChangeToArrayThenSameMapNoExtras!879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3842 (array!68765 array!68767 (_ BitVec 32) (_ BitVec 32) V!39667 V!39667 (_ BitVec 32) Int) ListLongMap!14525)

(assert (=> b!1072883 (= lt!475885 (getCurrentListMapNoExtraKeys!3842 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072883 (= lt!475884 (getCurrentListMapNoExtraKeys!3842 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072884 () Bool)

(assert (=> b!1072884 (= e!612861 (and e!612860 mapRes!40561))))

(declare-fun condMapEmpty!40561 () Bool)

(declare-fun mapDefault!40561 () ValueCell!12246)

(assert (=> b!1072884 (= condMapEmpty!40561 (= (arr!33077 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12246)) mapDefault!40561)))))

(declare-fun b!1072885 () Bool)

(assert (=> b!1072885 (= e!612859 tp_is_empty!25899)))

(declare-fun b!1072886 () Bool)

(declare-fun res!715623 () Bool)

(assert (=> b!1072886 (=> (not res!715623) (not e!612862))))

(declare-datatypes ((List!23092 0))(
  ( (Nil!23089) (Cons!23088 (h!24297 (_ BitVec 64)) (t!32429 List!23092)) )
))
(declare-fun arrayNoDuplicates!0 (array!68765 (_ BitVec 32) List!23092) Bool)

(assert (=> b!1072886 (= res!715623 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23089))))

(assert (= (and start!94884 res!715624) b!1072881))

(assert (= (and b!1072881 res!715621) b!1072880))

(assert (= (and b!1072880 res!715622) b!1072886))

(assert (= (and b!1072886 res!715623) b!1072883))

(assert (= (and b!1072884 condMapEmpty!40561) mapIsEmpty!40561))

(assert (= (and b!1072884 (not condMapEmpty!40561)) mapNonEmpty!40561))

(get-info :version)

(assert (= (and mapNonEmpty!40561 ((_ is ValueCellFull!12246) mapValue!40561)) b!1072885))

(assert (= (and b!1072884 ((_ is ValueCellFull!12246) mapDefault!40561)) b!1072882))

(assert (= start!94884 b!1072884))

(declare-fun m!991995 () Bool)

(assert (=> b!1072883 m!991995))

(declare-fun m!991997 () Bool)

(assert (=> b!1072883 m!991997))

(declare-fun m!991999 () Bool)

(assert (=> b!1072883 m!991999))

(declare-fun m!992001 () Bool)

(assert (=> mapNonEmpty!40561 m!992001))

(declare-fun m!992003 () Bool)

(assert (=> start!94884 m!992003))

(declare-fun m!992005 () Bool)

(assert (=> start!94884 m!992005))

(declare-fun m!992007 () Bool)

(assert (=> start!94884 m!992007))

(declare-fun m!992009 () Bool)

(assert (=> b!1072880 m!992009))

(declare-fun m!992011 () Bool)

(assert (=> b!1072886 m!992011))

(check-sat (not b!1072886) (not mapNonEmpty!40561) tp_is_empty!25899 b_and!34943 (not b_next!22089) (not b!1072883) (not start!94884) (not b!1072880))
(check-sat b_and!34943 (not b_next!22089))
