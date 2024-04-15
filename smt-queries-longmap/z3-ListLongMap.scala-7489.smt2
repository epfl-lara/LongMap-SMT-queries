; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94900 () Bool)

(assert start!94900)

(declare-fun b_free!22111 () Bool)

(declare-fun b_next!22111 () Bool)

(assert (=> start!94900 (= b_free!22111 (not b_next!22111))))

(declare-fun tp!77798 () Bool)

(declare-fun b_and!34939 () Bool)

(assert (=> start!94900 (= tp!77798 b_and!34939)))

(declare-fun mapIsEmpty!40594 () Bool)

(declare-fun mapRes!40594 () Bool)

(assert (=> mapIsEmpty!40594 mapRes!40594))

(declare-fun b!1072958 () Bool)

(declare-fun res!715684 () Bool)

(declare-fun e!612934 () Bool)

(assert (=> b!1072958 (=> (not res!715684) (not e!612934))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39697 0))(
  ( (V!39698 (val!13011 Int)) )
))
(declare-datatypes ((ValueCell!12257 0))(
  ( (ValueCellFull!12257 (v!15628 V!39697)) (EmptyCell!12257) )
))
(declare-datatypes ((array!68746 0))(
  ( (array!68747 (arr!33067 (Array (_ BitVec 32) ValueCell!12257)) (size!33605 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68746)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68748 0))(
  ( (array!68749 (arr!33068 (Array (_ BitVec 32) (_ BitVec 64))) (size!33606 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68748)

(assert (=> b!1072958 (= res!715684 (and (= (size!33605 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33606 _keys!1163) (size!33605 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072959 () Bool)

(declare-fun e!612933 () Bool)

(declare-fun tp_is_empty!25921 () Bool)

(assert (=> b!1072959 (= e!612933 tp_is_empty!25921)))

(declare-fun b!1072960 () Bool)

(assert (=> b!1072960 (= e!612934 false)))

(declare-datatypes ((tuple2!16632 0))(
  ( (tuple2!16633 (_1!8327 (_ BitVec 64)) (_2!8327 V!39697)) )
))
(declare-datatypes ((List!23156 0))(
  ( (Nil!23153) (Cons!23152 (h!24361 tuple2!16632) (t!32484 List!23156)) )
))
(declare-datatypes ((ListLongMap!14601 0))(
  ( (ListLongMap!14602 (toList!7316 List!23156)) )
))
(declare-fun lt!475754 () ListLongMap!14601)

(declare-fun minValue!907 () V!39697)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39697)

(declare-fun getCurrentListMapNoExtraKeys!3896 (array!68748 array!68746 (_ BitVec 32) (_ BitVec 32) V!39697 V!39697 (_ BitVec 32) Int) ListLongMap!14601)

(assert (=> b!1072960 (= lt!475754 (getCurrentListMapNoExtraKeys!3896 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39697)

(declare-fun lt!475753 () ListLongMap!14601)

(assert (=> b!1072960 (= lt!475753 (getCurrentListMapNoExtraKeys!3896 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072961 () Bool)

(declare-fun e!612931 () Bool)

(assert (=> b!1072961 (= e!612931 tp_is_empty!25921)))

(declare-fun b!1072962 () Bool)

(declare-fun e!612935 () Bool)

(assert (=> b!1072962 (= e!612935 (and e!612931 mapRes!40594))))

(declare-fun condMapEmpty!40594 () Bool)

(declare-fun mapDefault!40594 () ValueCell!12257)

(assert (=> b!1072962 (= condMapEmpty!40594 (= (arr!33067 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12257)) mapDefault!40594)))))

(declare-fun mapNonEmpty!40594 () Bool)

(declare-fun tp!77797 () Bool)

(assert (=> mapNonEmpty!40594 (= mapRes!40594 (and tp!77797 e!612933))))

(declare-fun mapKey!40594 () (_ BitVec 32))

(declare-fun mapRest!40594 () (Array (_ BitVec 32) ValueCell!12257))

(declare-fun mapValue!40594 () ValueCell!12257)

(assert (=> mapNonEmpty!40594 (= (arr!33067 _values!955) (store mapRest!40594 mapKey!40594 mapValue!40594))))

(declare-fun res!715687 () Bool)

(assert (=> start!94900 (=> (not res!715687) (not e!612934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94900 (= res!715687 (validMask!0 mask!1515))))

(assert (=> start!94900 e!612934))

(assert (=> start!94900 true))

(assert (=> start!94900 tp_is_empty!25921))

(declare-fun array_inv!25582 (array!68746) Bool)

(assert (=> start!94900 (and (array_inv!25582 _values!955) e!612935)))

(assert (=> start!94900 tp!77798))

(declare-fun array_inv!25583 (array!68748) Bool)

(assert (=> start!94900 (array_inv!25583 _keys!1163)))

(declare-fun b!1072963 () Bool)

(declare-fun res!715685 () Bool)

(assert (=> b!1072963 (=> (not res!715685) (not e!612934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68748 (_ BitVec 32)) Bool)

(assert (=> b!1072963 (= res!715685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072964 () Bool)

(declare-fun res!715686 () Bool)

(assert (=> b!1072964 (=> (not res!715686) (not e!612934))))

(declare-datatypes ((List!23157 0))(
  ( (Nil!23154) (Cons!23153 (h!24362 (_ BitVec 64)) (t!32485 List!23157)) )
))
(declare-fun arrayNoDuplicates!0 (array!68748 (_ BitVec 32) List!23157) Bool)

(assert (=> b!1072964 (= res!715686 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23154))))

(assert (= (and start!94900 res!715687) b!1072958))

(assert (= (and b!1072958 res!715684) b!1072963))

(assert (= (and b!1072963 res!715685) b!1072964))

(assert (= (and b!1072964 res!715686) b!1072960))

(assert (= (and b!1072962 condMapEmpty!40594) mapIsEmpty!40594))

(assert (= (and b!1072962 (not condMapEmpty!40594)) mapNonEmpty!40594))

(get-info :version)

(assert (= (and mapNonEmpty!40594 ((_ is ValueCellFull!12257) mapValue!40594)) b!1072959))

(assert (= (and b!1072962 ((_ is ValueCellFull!12257) mapDefault!40594)) b!1072961))

(assert (= start!94900 b!1072962))

(declare-fun m!991549 () Bool)

(assert (=> mapNonEmpty!40594 m!991549))

(declare-fun m!991551 () Bool)

(assert (=> b!1072964 m!991551))

(declare-fun m!991553 () Bool)

(assert (=> start!94900 m!991553))

(declare-fun m!991555 () Bool)

(assert (=> start!94900 m!991555))

(declare-fun m!991557 () Bool)

(assert (=> start!94900 m!991557))

(declare-fun m!991559 () Bool)

(assert (=> b!1072960 m!991559))

(declare-fun m!991561 () Bool)

(assert (=> b!1072960 m!991561))

(declare-fun m!991563 () Bool)

(assert (=> b!1072963 m!991563))

(check-sat (not b!1072964) (not mapNonEmpty!40594) (not b!1072960) (not b!1072963) b_and!34939 tp_is_empty!25921 (not b_next!22111) (not start!94900))
(check-sat b_and!34939 (not b_next!22111))
