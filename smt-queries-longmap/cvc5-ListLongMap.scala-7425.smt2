; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94386 () Bool)

(assert start!94386)

(declare-fun b_free!21727 () Bool)

(declare-fun b_next!21727 () Bool)

(assert (=> start!94386 (= b_free!21727 (not b_next!21727))))

(declare-fun tp!76625 () Bool)

(declare-fun b_and!34511 () Bool)

(assert (=> start!94386 (= tp!76625 b_and!34511)))

(declare-fun b!1067289 () Bool)

(declare-fun res!712255 () Bool)

(declare-fun e!608723 () Bool)

(assert (=> b!1067289 (=> (not res!712255) (not e!608723))))

(declare-datatypes ((array!68057 0))(
  ( (array!68058 (arr!32729 (Array (_ BitVec 32) (_ BitVec 64))) (size!33265 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68057)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68057 (_ BitVec 32)) Bool)

(assert (=> b!1067289 (= res!712255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067290 () Bool)

(assert (=> b!1067290 (= e!608723 (not true))))

(declare-datatypes ((V!39185 0))(
  ( (V!39186 (val!12819 Int)) )
))
(declare-datatypes ((tuple2!16264 0))(
  ( (tuple2!16265 (_1!8143 (_ BitVec 64)) (_2!8143 V!39185)) )
))
(declare-datatypes ((List!22823 0))(
  ( (Nil!22820) (Cons!22819 (h!24028 tuple2!16264) (t!32146 List!22823)) )
))
(declare-datatypes ((ListLongMap!14233 0))(
  ( (ListLongMap!14234 (toList!7132 List!22823)) )
))
(declare-fun lt!471383 () ListLongMap!14233)

(declare-fun lt!471384 () ListLongMap!14233)

(assert (=> b!1067290 (= lt!471383 lt!471384)))

(declare-fun zeroValueBefore!47 () V!39185)

(declare-datatypes ((ValueCell!12065 0))(
  ( (ValueCellFull!12065 (v!15433 V!39185)) (EmptyCell!12065) )
))
(declare-datatypes ((array!68059 0))(
  ( (array!68060 (arr!32730 (Array (_ BitVec 32) ValueCell!12065)) (size!33266 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68059)

(declare-fun minValue!907 () V!39185)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39185)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((Unit!35061 0))(
  ( (Unit!35062) )
))
(declare-fun lt!471382 () Unit!35061)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!753 (array!68057 array!68059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 V!39185 V!39185 (_ BitVec 32) Int) Unit!35061)

(assert (=> b!1067290 (= lt!471382 (lemmaNoChangeToArrayThenSameMapNoExtras!753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3716 (array!68057 array!68059 (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 (_ BitVec 32) Int) ListLongMap!14233)

(assert (=> b!1067290 (= lt!471384 (getCurrentListMapNoExtraKeys!3716 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067290 (= lt!471383 (getCurrentListMapNoExtraKeys!3716 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39997 () Bool)

(declare-fun mapRes!39997 () Bool)

(declare-fun tp!76624 () Bool)

(declare-fun e!608720 () Bool)

(assert (=> mapNonEmpty!39997 (= mapRes!39997 (and tp!76624 e!608720))))

(declare-fun mapKey!39997 () (_ BitVec 32))

(declare-fun mapValue!39997 () ValueCell!12065)

(declare-fun mapRest!39997 () (Array (_ BitVec 32) ValueCell!12065))

(assert (=> mapNonEmpty!39997 (= (arr!32730 _values!955) (store mapRest!39997 mapKey!39997 mapValue!39997))))

(declare-fun b!1067291 () Bool)

(declare-fun e!608724 () Bool)

(declare-fun tp_is_empty!25537 () Bool)

(assert (=> b!1067291 (= e!608724 tp_is_empty!25537)))

(declare-fun res!712256 () Bool)

(assert (=> start!94386 (=> (not res!712256) (not e!608723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94386 (= res!712256 (validMask!0 mask!1515))))

(assert (=> start!94386 e!608723))

(assert (=> start!94386 true))

(assert (=> start!94386 tp_is_empty!25537))

(declare-fun e!608721 () Bool)

(declare-fun array_inv!25336 (array!68059) Bool)

(assert (=> start!94386 (and (array_inv!25336 _values!955) e!608721)))

(assert (=> start!94386 tp!76625))

(declare-fun array_inv!25337 (array!68057) Bool)

(assert (=> start!94386 (array_inv!25337 _keys!1163)))

(declare-fun b!1067292 () Bool)

(assert (=> b!1067292 (= e!608720 tp_is_empty!25537)))

(declare-fun b!1067293 () Bool)

(declare-fun res!712253 () Bool)

(assert (=> b!1067293 (=> (not res!712253) (not e!608723))))

(declare-datatypes ((List!22824 0))(
  ( (Nil!22821) (Cons!22820 (h!24029 (_ BitVec 64)) (t!32147 List!22824)) )
))
(declare-fun arrayNoDuplicates!0 (array!68057 (_ BitVec 32) List!22824) Bool)

(assert (=> b!1067293 (= res!712253 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22821))))

(declare-fun mapIsEmpty!39997 () Bool)

(assert (=> mapIsEmpty!39997 mapRes!39997))

(declare-fun b!1067294 () Bool)

(assert (=> b!1067294 (= e!608721 (and e!608724 mapRes!39997))))

(declare-fun condMapEmpty!39997 () Bool)

(declare-fun mapDefault!39997 () ValueCell!12065)

