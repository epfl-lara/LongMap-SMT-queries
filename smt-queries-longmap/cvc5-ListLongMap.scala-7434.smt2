; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94454 () Bool)

(assert start!94454)

(declare-fun b_free!21781 () Bool)

(declare-fun b_next!21781 () Bool)

(assert (=> start!94454 (= b_free!21781 (not b_next!21781))))

(declare-fun tp!76789 () Bool)

(declare-fun b_and!34573 () Bool)

(assert (=> start!94454 (= tp!76789 b_and!34573)))

(declare-fun b!1068044 () Bool)

(declare-fun e!609287 () Bool)

(declare-fun e!609284 () Bool)

(assert (=> b!1068044 (= e!609287 (not e!609284))))

(declare-fun res!712716 () Bool)

(assert (=> b!1068044 (=> res!712716 e!609284)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068044 (= res!712716 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39257 0))(
  ( (V!39258 (val!12846 Int)) )
))
(declare-datatypes ((tuple2!16312 0))(
  ( (tuple2!16313 (_1!8167 (_ BitVec 64)) (_2!8167 V!39257)) )
))
(declare-datatypes ((List!22866 0))(
  ( (Nil!22863) (Cons!22862 (h!24071 tuple2!16312) (t!32191 List!22866)) )
))
(declare-datatypes ((ListLongMap!14281 0))(
  ( (ListLongMap!14282 (toList!7156 List!22866)) )
))
(declare-fun lt!471768 () ListLongMap!14281)

(declare-fun lt!471771 () ListLongMap!14281)

(assert (=> b!1068044 (= lt!471768 lt!471771)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39257)

(declare-datatypes ((Unit!35109 0))(
  ( (Unit!35110) )
))
(declare-fun lt!471772 () Unit!35109)

(declare-datatypes ((ValueCell!12092 0))(
  ( (ValueCellFull!12092 (v!15460 V!39257)) (EmptyCell!12092) )
))
(declare-datatypes ((array!68165 0))(
  ( (array!68166 (arr!32782 (Array (_ BitVec 32) ValueCell!12092)) (size!33318 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68165)

(declare-fun minValue!907 () V!39257)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39257)

(declare-datatypes ((array!68167 0))(
  ( (array!68168 (arr!32783 (Array (_ BitVec 32) (_ BitVec 64))) (size!33319 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68167)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!773 (array!68167 array!68165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 V!39257 V!39257 (_ BitVec 32) Int) Unit!35109)

(assert (=> b!1068044 (= lt!471772 (lemmaNoChangeToArrayThenSameMapNoExtras!773 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3736 (array!68167 array!68165 (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 (_ BitVec 32) Int) ListLongMap!14281)

(assert (=> b!1068044 (= lt!471771 (getCurrentListMapNoExtraKeys!3736 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068044 (= lt!471768 (getCurrentListMapNoExtraKeys!3736 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068045 () Bool)

(declare-fun e!609283 () Bool)

(declare-fun e!609289 () Bool)

(declare-fun mapRes!40081 () Bool)

(assert (=> b!1068045 (= e!609283 (and e!609289 mapRes!40081))))

(declare-fun condMapEmpty!40081 () Bool)

(declare-fun mapDefault!40081 () ValueCell!12092)

