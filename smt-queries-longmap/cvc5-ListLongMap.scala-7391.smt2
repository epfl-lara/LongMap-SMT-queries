; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94122 () Bool)

(assert start!94122)

(declare-fun b_free!21523 () Bool)

(declare-fun b_next!21523 () Bool)

(assert (=> start!94122 (= b_free!21523 (not b_next!21523))))

(declare-fun tp!76004 () Bool)

(declare-fun b_and!34273 () Bool)

(assert (=> start!94122 (= tp!76004 b_and!34273)))

(declare-fun b!1064372 () Bool)

(declare-fun e!606600 () Bool)

(declare-fun tp_is_empty!25333 () Bool)

(assert (=> b!1064372 (= e!606600 tp_is_empty!25333)))

(declare-fun res!710548 () Bool)

(declare-fun e!606599 () Bool)

(assert (=> start!94122 (=> (not res!710548) (not e!606599))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94122 (= res!710548 (validMask!0 mask!1515))))

(assert (=> start!94122 e!606599))

(assert (=> start!94122 true))

(assert (=> start!94122 tp_is_empty!25333))

(declare-datatypes ((V!38913 0))(
  ( (V!38914 (val!12717 Int)) )
))
(declare-datatypes ((ValueCell!11963 0))(
  ( (ValueCellFull!11963 (v!15329 V!38913)) (EmptyCell!11963) )
))
(declare-datatypes ((array!67657 0))(
  ( (array!67658 (arr!32532 (Array (_ BitVec 32) ValueCell!11963)) (size!33068 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67657)

(declare-fun e!606603 () Bool)

(declare-fun array_inv!25192 (array!67657) Bool)

(assert (=> start!94122 (and (array_inv!25192 _values!955) e!606603)))

(assert (=> start!94122 tp!76004))

(declare-datatypes ((array!67659 0))(
  ( (array!67660 (arr!32533 (Array (_ BitVec 32) (_ BitVec 64))) (size!33069 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67659)

(declare-fun array_inv!25193 (array!67659) Bool)

(assert (=> start!94122 (array_inv!25193 _keys!1163)))

(declare-fun b!1064373 () Bool)

(declare-fun res!710551 () Bool)

(assert (=> b!1064373 (=> (not res!710551) (not e!606599))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064373 (= res!710551 (and (= (size!33068 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33069 _keys!1163) (size!33068 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064374 () Bool)

(declare-fun e!606602 () Bool)

(assert (=> b!1064374 (= e!606599 (not e!606602))))

(declare-fun res!710552 () Bool)

(assert (=> b!1064374 (=> res!710552 e!606602)))

(assert (=> b!1064374 (= res!710552 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16102 0))(
  ( (tuple2!16103 (_1!8062 (_ BitVec 64)) (_2!8062 V!38913)) )
))
(declare-datatypes ((List!22676 0))(
  ( (Nil!22673) (Cons!22672 (h!23881 tuple2!16102) (t!31993 List!22676)) )
))
(declare-datatypes ((ListLongMap!14071 0))(
  ( (ListLongMap!14072 (toList!7051 List!22676)) )
))
(declare-fun lt!469168 () ListLongMap!14071)

(declare-fun lt!469167 () ListLongMap!14071)

(assert (=> b!1064374 (= lt!469168 lt!469167)))

(declare-fun zeroValueBefore!47 () V!38913)

(declare-datatypes ((Unit!34902 0))(
  ( (Unit!34903) )
))
(declare-fun lt!469166 () Unit!34902)

(declare-fun minValue!907 () V!38913)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!680 (array!67659 array!67657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 V!38913 V!38913 (_ BitVec 32) Int) Unit!34902)

(assert (=> b!1064374 (= lt!469166 (lemmaNoChangeToArrayThenSameMapNoExtras!680 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3643 (array!67659 array!67657 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14071)

(assert (=> b!1064374 (= lt!469167 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064374 (= lt!469168 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39682 () Bool)

(declare-fun mapRes!39682 () Bool)

(declare-fun tp!76003 () Bool)

(assert (=> mapNonEmpty!39682 (= mapRes!39682 (and tp!76003 e!606600))))

(declare-fun mapKey!39682 () (_ BitVec 32))

(declare-fun mapRest!39682 () (Array (_ BitVec 32) ValueCell!11963))

(declare-fun mapValue!39682 () ValueCell!11963)

(assert (=> mapNonEmpty!39682 (= (arr!32532 _values!955) (store mapRest!39682 mapKey!39682 mapValue!39682))))

(declare-fun b!1064375 () Bool)

(assert (=> b!1064375 (= e!606602 true)))

(declare-fun lt!469169 () ListLongMap!14071)

(declare-fun getCurrentListMap!4013 (array!67659 array!67657 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14071)

(assert (=> b!1064375 (= lt!469169 (getCurrentListMap!4013 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064376 () Bool)

(declare-fun e!606601 () Bool)

(assert (=> b!1064376 (= e!606601 tp_is_empty!25333)))

(declare-fun b!1064377 () Bool)

(declare-fun res!710549 () Bool)

(assert (=> b!1064377 (=> (not res!710549) (not e!606599))))

(declare-datatypes ((List!22677 0))(
  ( (Nil!22674) (Cons!22673 (h!23882 (_ BitVec 64)) (t!31994 List!22677)) )
))
(declare-fun arrayNoDuplicates!0 (array!67659 (_ BitVec 32) List!22677) Bool)

(assert (=> b!1064377 (= res!710549 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22674))))

(declare-fun b!1064378 () Bool)

(declare-fun res!710550 () Bool)

(assert (=> b!1064378 (=> (not res!710550) (not e!606599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67659 (_ BitVec 32)) Bool)

(assert (=> b!1064378 (= res!710550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064379 () Bool)

(assert (=> b!1064379 (= e!606603 (and e!606601 mapRes!39682))))

(declare-fun condMapEmpty!39682 () Bool)

(declare-fun mapDefault!39682 () ValueCell!11963)

