; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94246 () Bool)

(assert start!94246)

(declare-fun b_free!21631 () Bool)

(declare-fun b_next!21631 () Bool)

(assert (=> start!94246 (= b_free!21631 (not b_next!21631))))

(declare-fun tp!76330 () Bool)

(declare-fun b_and!34391 () Bool)

(assert (=> start!94246 (= tp!76330 b_and!34391)))

(declare-fun b!1065827 () Bool)

(declare-fun e!607681 () Bool)

(declare-datatypes ((array!67865 0))(
  ( (array!67866 (arr!32635 (Array (_ BitVec 32) (_ BitVec 64))) (size!33171 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67865)

(assert (=> b!1065827 (= e!607681 (bvsle #b00000000000000000000000000000000 (size!33171 _keys!1163)))))

(declare-fun mapIsEmpty!39847 () Bool)

(declare-fun mapRes!39847 () Bool)

(assert (=> mapIsEmpty!39847 mapRes!39847))

(declare-fun b!1065828 () Bool)

(declare-fun e!607679 () Bool)

(declare-fun e!607680 () Bool)

(assert (=> b!1065828 (= e!607679 (not e!607680))))

(declare-fun res!711429 () Bool)

(assert (=> b!1065828 (=> res!711429 e!607680)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065828 (= res!711429 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39057 0))(
  ( (V!39058 (val!12771 Int)) )
))
(declare-datatypes ((tuple2!16192 0))(
  ( (tuple2!16193 (_1!8107 (_ BitVec 64)) (_2!8107 V!39057)) )
))
(declare-datatypes ((List!22757 0))(
  ( (Nil!22754) (Cons!22753 (h!23962 tuple2!16192) (t!32076 List!22757)) )
))
(declare-datatypes ((ListLongMap!14161 0))(
  ( (ListLongMap!14162 (toList!7096 List!22757)) )
))
(declare-fun lt!470238 () ListLongMap!14161)

(declare-fun lt!470232 () ListLongMap!14161)

(assert (=> b!1065828 (= lt!470238 lt!470232)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39057)

(declare-datatypes ((Unit!34985 0))(
  ( (Unit!34986) )
))
(declare-fun lt!470235 () Unit!34985)

(declare-datatypes ((ValueCell!12017 0))(
  ( (ValueCellFull!12017 (v!15383 V!39057)) (EmptyCell!12017) )
))
(declare-datatypes ((array!67867 0))(
  ( (array!67868 (arr!32636 (Array (_ BitVec 32) ValueCell!12017)) (size!33172 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67867)

(declare-fun minValue!907 () V!39057)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39057)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!719 (array!67865 array!67867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 V!39057 V!39057 (_ BitVec 32) Int) Unit!34985)

(assert (=> b!1065828 (= lt!470235 (lemmaNoChangeToArrayThenSameMapNoExtras!719 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3682 (array!67865 array!67867 (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 (_ BitVec 32) Int) ListLongMap!14161)

(assert (=> b!1065828 (= lt!470232 (getCurrentListMapNoExtraKeys!3682 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065828 (= lt!470238 (getCurrentListMapNoExtraKeys!3682 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065829 () Bool)

(declare-fun e!607677 () Bool)

(declare-fun tp_is_empty!25441 () Bool)

(assert (=> b!1065829 (= e!607677 tp_is_empty!25441)))

(declare-fun b!1065830 () Bool)

(declare-fun e!607678 () Bool)

(declare-fun e!607682 () Bool)

(assert (=> b!1065830 (= e!607678 (and e!607682 mapRes!39847))))

(declare-fun condMapEmpty!39847 () Bool)

(declare-fun mapDefault!39847 () ValueCell!12017)

