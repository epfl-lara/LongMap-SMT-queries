; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94576 () Bool)

(assert start!94576)

(declare-fun b_free!21859 () Bool)

(declare-fun b_next!21859 () Bool)

(assert (=> start!94576 (= b_free!21859 (not b_next!21859))))

(declare-fun tp!77029 () Bool)

(declare-fun b_and!34671 () Bool)

(assert (=> start!94576 (= tp!77029 b_and!34671)))

(declare-fun b!1069407 () Bool)

(declare-fun e!610300 () Bool)

(assert (=> b!1069407 (= e!610300 (not true))))

(declare-datatypes ((V!39361 0))(
  ( (V!39362 (val!12885 Int)) )
))
(declare-datatypes ((tuple2!16378 0))(
  ( (tuple2!16379 (_1!8200 (_ BitVec 64)) (_2!8200 V!39361)) )
))
(declare-datatypes ((List!22923 0))(
  ( (Nil!22920) (Cons!22919 (h!24128 tuple2!16378) (t!32252 List!22923)) )
))
(declare-datatypes ((ListLongMap!14347 0))(
  ( (ListLongMap!14348 (toList!7189 List!22923)) )
))
(declare-fun lt!472597 () ListLongMap!14347)

(declare-fun lt!472598 () ListLongMap!14347)

(assert (=> b!1069407 (= lt!472597 lt!472598)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39361)

(declare-datatypes ((ValueCell!12131 0))(
  ( (ValueCellFull!12131 (v!15501 V!39361)) (EmptyCell!12131) )
))
(declare-datatypes ((array!68317 0))(
  ( (array!68318 (arr!32856 (Array (_ BitVec 32) ValueCell!12131)) (size!33392 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68317)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39361)

(declare-fun minValue!907 () V!39361)

(declare-datatypes ((Unit!35177 0))(
  ( (Unit!35178) )
))
(declare-fun lt!472599 () Unit!35177)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68319 0))(
  ( (array!68320 (arr!32857 (Array (_ BitVec 32) (_ BitVec 64))) (size!33393 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68319)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!802 (array!68319 array!68317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 V!39361 V!39361 (_ BitVec 32) Int) Unit!35177)

(assert (=> b!1069407 (= lt!472599 (lemmaNoChangeToArrayThenSameMapNoExtras!802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3765 (array!68319 array!68317 (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 (_ BitVec 32) Int) ListLongMap!14347)

(assert (=> b!1069407 (= lt!472598 (getCurrentListMapNoExtraKeys!3765 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069407 (= lt!472597 (getCurrentListMapNoExtraKeys!3765 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069408 () Bool)

(declare-fun e!610301 () Bool)

(declare-fun tp_is_empty!25669 () Bool)

(assert (=> b!1069408 (= e!610301 tp_is_empty!25669)))

(declare-fun b!1069409 () Bool)

(declare-fun e!610302 () Bool)

(declare-fun e!610298 () Bool)

(declare-fun mapRes!40204 () Bool)

(assert (=> b!1069409 (= e!610302 (and e!610298 mapRes!40204))))

(declare-fun condMapEmpty!40204 () Bool)

(declare-fun mapDefault!40204 () ValueCell!12131)

