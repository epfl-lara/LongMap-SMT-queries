; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94132 () Bool)

(assert start!94132)

(declare-fun b_free!21533 () Bool)

(declare-fun b_next!21533 () Bool)

(assert (=> start!94132 (= b_free!21533 (not b_next!21533))))

(declare-fun tp!76034 () Bool)

(declare-fun b_and!34283 () Bool)

(assert (=> start!94132 (= tp!76034 b_and!34283)))

(declare-fun b!1064492 () Bool)

(declare-fun e!606691 () Bool)

(declare-fun e!606693 () Bool)

(assert (=> b!1064492 (= e!606691 (not e!606693))))

(declare-fun res!710627 () Bool)

(assert (=> b!1064492 (=> res!710627 e!606693)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064492 (= res!710627 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38925 0))(
  ( (V!38926 (val!12722 Int)) )
))
(declare-datatypes ((tuple2!16110 0))(
  ( (tuple2!16111 (_1!8066 (_ BitVec 64)) (_2!8066 V!38925)) )
))
(declare-datatypes ((List!22684 0))(
  ( (Nil!22681) (Cons!22680 (h!23889 tuple2!16110) (t!32001 List!22684)) )
))
(declare-datatypes ((ListLongMap!14079 0))(
  ( (ListLongMap!14080 (toList!7055 List!22684)) )
))
(declare-fun lt!469227 () ListLongMap!14079)

(declare-fun lt!469226 () ListLongMap!14079)

(assert (=> b!1064492 (= lt!469227 lt!469226)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38925)

(declare-datatypes ((Unit!34910 0))(
  ( (Unit!34911) )
))
(declare-fun lt!469229 () Unit!34910)

(declare-datatypes ((ValueCell!11968 0))(
  ( (ValueCellFull!11968 (v!15334 V!38925)) (EmptyCell!11968) )
))
(declare-datatypes ((array!67675 0))(
  ( (array!67676 (arr!32541 (Array (_ BitVec 32) ValueCell!11968)) (size!33077 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67675)

(declare-fun minValue!907 () V!38925)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38925)

(declare-datatypes ((array!67677 0))(
  ( (array!67678 (arr!32542 (Array (_ BitVec 32) (_ BitVec 64))) (size!33078 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67677)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!684 (array!67677 array!67675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38925 V!38925 V!38925 V!38925 (_ BitVec 32) Int) Unit!34910)

(assert (=> b!1064492 (= lt!469229 (lemmaNoChangeToArrayThenSameMapNoExtras!684 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3647 (array!67677 array!67675 (_ BitVec 32) (_ BitVec 32) V!38925 V!38925 (_ BitVec 32) Int) ListLongMap!14079)

(assert (=> b!1064492 (= lt!469226 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064492 (= lt!469227 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710625 () Bool)

(assert (=> start!94132 (=> (not res!710625) (not e!606691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94132 (= res!710625 (validMask!0 mask!1515))))

(assert (=> start!94132 e!606691))

(assert (=> start!94132 true))

(declare-fun tp_is_empty!25343 () Bool)

(assert (=> start!94132 tp_is_empty!25343))

(declare-fun e!606690 () Bool)

(declare-fun array_inv!25200 (array!67675) Bool)

(assert (=> start!94132 (and (array_inv!25200 _values!955) e!606690)))

(assert (=> start!94132 tp!76034))

(declare-fun array_inv!25201 (array!67677) Bool)

(assert (=> start!94132 (array_inv!25201 _keys!1163)))

(declare-fun b!1064493 () Bool)

(declare-fun res!710623 () Bool)

(assert (=> b!1064493 (=> (not res!710623) (not e!606691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67677 (_ BitVec 32)) Bool)

(assert (=> b!1064493 (= res!710623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064494 () Bool)

(declare-fun e!606692 () Bool)

(assert (=> b!1064494 (= e!606692 tp_is_empty!25343)))

(declare-fun b!1064495 () Bool)

(declare-fun res!710624 () Bool)

(assert (=> b!1064495 (=> (not res!710624) (not e!606691))))

(declare-datatypes ((List!22685 0))(
  ( (Nil!22682) (Cons!22681 (h!23890 (_ BitVec 64)) (t!32002 List!22685)) )
))
(declare-fun arrayNoDuplicates!0 (array!67677 (_ BitVec 32) List!22685) Bool)

(assert (=> b!1064495 (= res!710624 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22682))))

(declare-fun b!1064496 () Bool)

(declare-fun res!710626 () Bool)

(assert (=> b!1064496 (=> (not res!710626) (not e!606691))))

(assert (=> b!1064496 (= res!710626 (and (= (size!33077 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33078 _keys!1163) (size!33077 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39697 () Bool)

(declare-fun mapRes!39697 () Bool)

(declare-fun tp!76033 () Bool)

(assert (=> mapNonEmpty!39697 (= mapRes!39697 (and tp!76033 e!606692))))

(declare-fun mapValue!39697 () ValueCell!11968)

(declare-fun mapRest!39697 () (Array (_ BitVec 32) ValueCell!11968))

(declare-fun mapKey!39697 () (_ BitVec 32))

(assert (=> mapNonEmpty!39697 (= (arr!32541 _values!955) (store mapRest!39697 mapKey!39697 mapValue!39697))))

(declare-fun b!1064497 () Bool)

(declare-fun e!606694 () Bool)

(assert (=> b!1064497 (= e!606694 tp_is_empty!25343)))

(declare-fun b!1064498 () Bool)

(assert (=> b!1064498 (= e!606690 (and e!606694 mapRes!39697))))

(declare-fun condMapEmpty!39697 () Bool)

(declare-fun mapDefault!39697 () ValueCell!11968)

