; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95154 () Bool)

(assert start!95154)

(declare-fun b_free!22123 () Bool)

(declare-fun b_next!22123 () Bool)

(assert (=> start!95154 (= b_free!22123 (not b_next!22123))))

(declare-fun tp!77834 () Bool)

(declare-fun b_and!34987 () Bool)

(assert (=> start!95154 (= tp!77834 b_and!34987)))

(declare-fun mapIsEmpty!40612 () Bool)

(declare-fun mapRes!40612 () Bool)

(assert (=> mapIsEmpty!40612 mapRes!40612))

(declare-fun b!1074564 () Bool)

(declare-fun res!716349 () Bool)

(declare-fun e!613969 () Bool)

(assert (=> b!1074564 (=> (not res!716349) (not e!613969))))

(declare-datatypes ((array!68877 0))(
  ( (array!68878 (arr!33126 (Array (_ BitVec 32) (_ BitVec 64))) (size!33663 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68877)

(declare-datatypes ((List!23119 0))(
  ( (Nil!23116) (Cons!23115 (h!24333 (_ BitVec 64)) (t!32448 List!23119)) )
))
(declare-fun arrayNoDuplicates!0 (array!68877 (_ BitVec 32) List!23119) Bool)

(assert (=> b!1074564 (= res!716349 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23116))))

(declare-fun b!1074565 () Bool)

(declare-fun e!613973 () Bool)

(declare-fun e!613971 () Bool)

(assert (=> b!1074565 (= e!613973 (and e!613971 mapRes!40612))))

(declare-fun condMapEmpty!40612 () Bool)

(declare-datatypes ((V!39713 0))(
  ( (V!39714 (val!13017 Int)) )
))
(declare-datatypes ((ValueCell!12263 0))(
  ( (ValueCellFull!12263 (v!15631 V!39713)) (EmptyCell!12263) )
))
(declare-datatypes ((array!68879 0))(
  ( (array!68880 (arr!33127 (Array (_ BitVec 32) ValueCell!12263)) (size!33664 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68879)

(declare-fun mapDefault!40612 () ValueCell!12263)

(assert (=> b!1074565 (= condMapEmpty!40612 (= (arr!33127 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12263)) mapDefault!40612)))))

(declare-fun b!1074566 () Bool)

(assert (=> b!1074566 (= e!613969 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((tuple2!16562 0))(
  ( (tuple2!16563 (_1!8292 (_ BitVec 64)) (_2!8292 V!39713)) )
))
(declare-datatypes ((List!23120 0))(
  ( (Nil!23117) (Cons!23116 (h!24334 tuple2!16562) (t!32449 List!23120)) )
))
(declare-datatypes ((ListLongMap!14539 0))(
  ( (ListLongMap!14540 (toList!7285 List!23120)) )
))
(declare-fun lt!476504 () ListLongMap!14539)

(declare-fun minValue!907 () V!39713)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39713)

(declare-fun getCurrentListMapNoExtraKeys!3883 (array!68877 array!68879 (_ BitVec 32) (_ BitVec 32) V!39713 V!39713 (_ BitVec 32) Int) ListLongMap!14539)

(assert (=> b!1074566 (= lt!476504 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39713)

(declare-fun lt!476505 () ListLongMap!14539)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074566 (= lt!476505 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074567 () Bool)

(declare-fun e!613970 () Bool)

(declare-fun tp_is_empty!25933 () Bool)

(assert (=> b!1074567 (= e!613970 tp_is_empty!25933)))

(declare-fun res!716347 () Bool)

(assert (=> start!95154 (=> (not res!716347) (not e!613969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95154 (= res!716347 (validMask!0 mask!1515))))

(assert (=> start!95154 e!613969))

(assert (=> start!95154 true))

(assert (=> start!95154 tp_is_empty!25933))

(declare-fun array_inv!25644 (array!68879) Bool)

(assert (=> start!95154 (and (array_inv!25644 _values!955) e!613973)))

(assert (=> start!95154 tp!77834))

(declare-fun array_inv!25645 (array!68877) Bool)

(assert (=> start!95154 (array_inv!25645 _keys!1163)))

(declare-fun b!1074568 () Bool)

(declare-fun res!716350 () Bool)

(assert (=> b!1074568 (=> (not res!716350) (not e!613969))))

(assert (=> b!1074568 (= res!716350 (and (= (size!33664 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33663 _keys!1163) (size!33664 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074569 () Bool)

(assert (=> b!1074569 (= e!613971 tp_is_empty!25933)))

(declare-fun mapNonEmpty!40612 () Bool)

(declare-fun tp!77833 () Bool)

(assert (=> mapNonEmpty!40612 (= mapRes!40612 (and tp!77833 e!613970))))

(declare-fun mapValue!40612 () ValueCell!12263)

(declare-fun mapRest!40612 () (Array (_ BitVec 32) ValueCell!12263))

(declare-fun mapKey!40612 () (_ BitVec 32))

(assert (=> mapNonEmpty!40612 (= (arr!33127 _values!955) (store mapRest!40612 mapKey!40612 mapValue!40612))))

(declare-fun b!1074570 () Bool)

(declare-fun res!716348 () Bool)

(assert (=> b!1074570 (=> (not res!716348) (not e!613969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68877 (_ BitVec 32)) Bool)

(assert (=> b!1074570 (= res!716348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95154 res!716347) b!1074568))

(assert (= (and b!1074568 res!716350) b!1074570))

(assert (= (and b!1074570 res!716348) b!1074564))

(assert (= (and b!1074564 res!716349) b!1074566))

(assert (= (and b!1074565 condMapEmpty!40612) mapIsEmpty!40612))

(assert (= (and b!1074565 (not condMapEmpty!40612)) mapNonEmpty!40612))

(get-info :version)

(assert (= (and mapNonEmpty!40612 ((_ is ValueCellFull!12263) mapValue!40612)) b!1074567))

(assert (= (and b!1074565 ((_ is ValueCellFull!12263) mapDefault!40612)) b!1074569))

(assert (= start!95154 b!1074565))

(declare-fun m!993943 () Bool)

(assert (=> start!95154 m!993943))

(declare-fun m!993945 () Bool)

(assert (=> start!95154 m!993945))

(declare-fun m!993947 () Bool)

(assert (=> start!95154 m!993947))

(declare-fun m!993949 () Bool)

(assert (=> mapNonEmpty!40612 m!993949))

(declare-fun m!993951 () Bool)

(assert (=> b!1074570 m!993951))

(declare-fun m!993953 () Bool)

(assert (=> b!1074566 m!993953))

(declare-fun m!993955 () Bool)

(assert (=> b!1074566 m!993955))

(declare-fun m!993957 () Bool)

(assert (=> b!1074564 m!993957))

(check-sat tp_is_empty!25933 (not start!95154) (not b!1074566) (not b_next!22123) (not b!1074564) (not b!1074570) (not mapNonEmpty!40612) b_and!34987)
(check-sat b_and!34987 (not b_next!22123))
