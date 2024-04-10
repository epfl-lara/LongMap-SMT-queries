; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94138 () Bool)

(assert start!94138)

(declare-fun b_free!21539 () Bool)

(declare-fun b_next!21539 () Bool)

(assert (=> start!94138 (= b_free!21539 (not b_next!21539))))

(declare-fun tp!76052 () Bool)

(declare-fun b_and!34289 () Bool)

(assert (=> start!94138 (= tp!76052 b_and!34289)))

(declare-fun b!1064564 () Bool)

(declare-fun e!606744 () Bool)

(declare-fun tp_is_empty!25349 () Bool)

(assert (=> b!1064564 (= e!606744 tp_is_empty!25349)))

(declare-fun mapNonEmpty!39706 () Bool)

(declare-fun mapRes!39706 () Bool)

(declare-fun tp!76051 () Bool)

(assert (=> mapNonEmpty!39706 (= mapRes!39706 (and tp!76051 e!606744))))

(declare-datatypes ((V!38933 0))(
  ( (V!38934 (val!12725 Int)) )
))
(declare-datatypes ((ValueCell!11971 0))(
  ( (ValueCellFull!11971 (v!15337 V!38933)) (EmptyCell!11971) )
))
(declare-fun mapRest!39706 () (Array (_ BitVec 32) ValueCell!11971))

(declare-fun mapValue!39706 () ValueCell!11971)

(declare-datatypes ((array!67687 0))(
  ( (array!67688 (arr!32547 (Array (_ BitVec 32) ValueCell!11971)) (size!33083 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67687)

(declare-fun mapKey!39706 () (_ BitVec 32))

(assert (=> mapNonEmpty!39706 (= (arr!32547 _values!955) (store mapRest!39706 mapKey!39706 mapValue!39706))))

(declare-fun b!1064565 () Bool)

(declare-fun res!710670 () Bool)

(declare-fun e!606747 () Bool)

(assert (=> b!1064565 (=> (not res!710670) (not e!606747))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67689 0))(
  ( (array!67690 (arr!32548 (Array (_ BitVec 32) (_ BitVec 64))) (size!33084 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67689)

(assert (=> b!1064565 (= res!710670 (and (= (size!33083 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33084 _keys!1163) (size!33083 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064566 () Bool)

(declare-fun e!606748 () Bool)

(assert (=> b!1064566 (= e!606747 (not e!606748))))

(declare-fun res!710672 () Bool)

(assert (=> b!1064566 (=> res!710672 e!606748)))

(assert (=> b!1064566 (= res!710672 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16116 0))(
  ( (tuple2!16117 (_1!8069 (_ BitVec 64)) (_2!8069 V!38933)) )
))
(declare-datatypes ((List!22689 0))(
  ( (Nil!22686) (Cons!22685 (h!23894 tuple2!16116) (t!32006 List!22689)) )
))
(declare-datatypes ((ListLongMap!14085 0))(
  ( (ListLongMap!14086 (toList!7058 List!22689)) )
))
(declare-fun lt!469263 () ListLongMap!14085)

(declare-fun lt!469262 () ListLongMap!14085)

(assert (=> b!1064566 (= lt!469263 lt!469262)))

(declare-fun zeroValueBefore!47 () V!38933)

(declare-fun minValue!907 () V!38933)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38933)

(declare-datatypes ((Unit!34914 0))(
  ( (Unit!34915) )
))
(declare-fun lt!469264 () Unit!34914)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!686 (array!67689 array!67687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38933 V!38933 V!38933 V!38933 (_ BitVec 32) Int) Unit!34914)

(assert (=> b!1064566 (= lt!469264 (lemmaNoChangeToArrayThenSameMapNoExtras!686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3649 (array!67689 array!67687 (_ BitVec 32) (_ BitVec 32) V!38933 V!38933 (_ BitVec 32) Int) ListLongMap!14085)

(assert (=> b!1064566 (= lt!469262 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064566 (= lt!469263 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064567 () Bool)

(declare-fun e!606746 () Bool)

(declare-fun e!606743 () Bool)

(assert (=> b!1064567 (= e!606746 (and e!606743 mapRes!39706))))

(declare-fun condMapEmpty!39706 () Bool)

(declare-fun mapDefault!39706 () ValueCell!11971)

