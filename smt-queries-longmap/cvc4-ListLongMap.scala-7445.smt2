; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94546 () Bool)

(assert start!94546)

(declare-fun b_free!21851 () Bool)

(declare-fun b_next!21851 () Bool)

(assert (=> start!94546 (= b_free!21851 (not b_next!21851))))

(declare-fun tp!77003 () Bool)

(declare-fun b_and!34653 () Bool)

(assert (=> start!94546 (= tp!77003 b_and!34653)))

(declare-fun b!1069146 () Bool)

(declare-fun e!610120 () Bool)

(declare-fun e!610119 () Bool)

(assert (=> b!1069146 (= e!610120 e!610119)))

(declare-fun res!713403 () Bool)

(assert (=> b!1069146 (=> res!713403 e!610119)))

(declare-datatypes ((V!39349 0))(
  ( (V!39350 (val!12881 Int)) )
))
(declare-datatypes ((tuple2!16370 0))(
  ( (tuple2!16371 (_1!8196 (_ BitVec 64)) (_2!8196 V!39349)) )
))
(declare-datatypes ((List!22916 0))(
  ( (Nil!22913) (Cons!22912 (h!24121 tuple2!16370) (t!32243 List!22916)) )
))
(declare-datatypes ((ListLongMap!14339 0))(
  ( (ListLongMap!14340 (toList!7185 List!22916)) )
))
(declare-fun lt!472419 () ListLongMap!14339)

(declare-fun contains!6313 (ListLongMap!14339 (_ BitVec 64)) Bool)

(assert (=> b!1069146 (= res!713403 (contains!6313 lt!472419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39349)

(declare-datatypes ((ValueCell!12127 0))(
  ( (ValueCellFull!12127 (v!15496 V!39349)) (EmptyCell!12127) )
))
(declare-datatypes ((array!68299 0))(
  ( (array!68300 (arr!32848 (Array (_ BitVec 32) ValueCell!12127)) (size!33384 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68299)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39349)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68301 0))(
  ( (array!68302 (arr!32849 (Array (_ BitVec 32) (_ BitVec 64))) (size!33385 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68301)

(declare-fun getCurrentListMap!4109 (array!68301 array!68299 (_ BitVec 32) (_ BitVec 32) V!39349 V!39349 (_ BitVec 32) Int) ListLongMap!14339)

(assert (=> b!1069146 (= lt!472419 (getCurrentListMap!4109 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069147 () Bool)

(assert (=> b!1069147 (= e!610119 true)))

(declare-fun -!664 (ListLongMap!14339 (_ BitVec 64)) ListLongMap!14339)

(assert (=> b!1069147 (= (-!664 lt!472419 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472419)))

(declare-datatypes ((Unit!35167 0))(
  ( (Unit!35168) )
))
(declare-fun lt!472420 () Unit!35167)

(declare-fun removeNotPresentStillSame!74 (ListLongMap!14339 (_ BitVec 64)) Unit!35167)

(assert (=> b!1069147 (= lt!472420 (removeNotPresentStillSame!74 lt!472419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069148 () Bool)

(declare-fun e!610118 () Bool)

(declare-fun tp_is_empty!25661 () Bool)

(assert (=> b!1069148 (= e!610118 tp_is_empty!25661)))

(declare-fun b!1069149 () Bool)

(declare-fun res!713405 () Bool)

(declare-fun e!610124 () Bool)

(assert (=> b!1069149 (=> (not res!713405) (not e!610124))))

(declare-datatypes ((List!22917 0))(
  ( (Nil!22914) (Cons!22913 (h!24122 (_ BitVec 64)) (t!32244 List!22917)) )
))
(declare-fun arrayNoDuplicates!0 (array!68301 (_ BitVec 32) List!22917) Bool)

(assert (=> b!1069149 (= res!713405 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22914))))

(declare-fun b!1069150 () Bool)

(declare-fun res!713406 () Bool)

(assert (=> b!1069150 (=> (not res!713406) (not e!610124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68301 (_ BitVec 32)) Bool)

(assert (=> b!1069150 (= res!713406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069151 () Bool)

(declare-fun res!713402 () Bool)

(assert (=> b!1069151 (=> (not res!713402) (not e!610124))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069151 (= res!713402 (and (= (size!33384 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33385 _keys!1163) (size!33384 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!713407 () Bool)

(assert (=> start!94546 (=> (not res!713407) (not e!610124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94546 (= res!713407 (validMask!0 mask!1515))))

(assert (=> start!94546 e!610124))

(assert (=> start!94546 true))

(assert (=> start!94546 tp_is_empty!25661))

(declare-fun e!610122 () Bool)

(declare-fun array_inv!25424 (array!68299) Bool)

(assert (=> start!94546 (and (array_inv!25424 _values!955) e!610122)))

(assert (=> start!94546 tp!77003))

(declare-fun array_inv!25425 (array!68301) Bool)

(assert (=> start!94546 (array_inv!25425 _keys!1163)))

(declare-fun b!1069152 () Bool)

(declare-fun e!610121 () Bool)

(assert (=> b!1069152 (= e!610121 tp_is_empty!25661)))

(declare-fun b!1069153 () Bool)

(assert (=> b!1069153 (= e!610124 (not e!610120))))

(declare-fun res!713404 () Bool)

(assert (=> b!1069153 (=> res!713404 e!610120)))

(assert (=> b!1069153 (= res!713404 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472421 () ListLongMap!14339)

(declare-fun lt!472417 () ListLongMap!14339)

(assert (=> b!1069153 (= lt!472421 lt!472417)))

(declare-fun lt!472418 () Unit!35167)

(declare-fun zeroValueAfter!47 () V!39349)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!798 (array!68301 array!68299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39349 V!39349 V!39349 V!39349 (_ BitVec 32) Int) Unit!35167)

(assert (=> b!1069153 (= lt!472418 (lemmaNoChangeToArrayThenSameMapNoExtras!798 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3761 (array!68301 array!68299 (_ BitVec 32) (_ BitVec 32) V!39349 V!39349 (_ BitVec 32) Int) ListLongMap!14339)

(assert (=> b!1069153 (= lt!472417 (getCurrentListMapNoExtraKeys!3761 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069153 (= lt!472421 (getCurrentListMapNoExtraKeys!3761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40189 () Bool)

(declare-fun mapRes!40189 () Bool)

(assert (=> mapIsEmpty!40189 mapRes!40189))

(declare-fun mapNonEmpty!40189 () Bool)

(declare-fun tp!77002 () Bool)

(assert (=> mapNonEmpty!40189 (= mapRes!40189 (and tp!77002 e!610118))))

(declare-fun mapKey!40189 () (_ BitVec 32))

(declare-fun mapRest!40189 () (Array (_ BitVec 32) ValueCell!12127))

(declare-fun mapValue!40189 () ValueCell!12127)

(assert (=> mapNonEmpty!40189 (= (arr!32848 _values!955) (store mapRest!40189 mapKey!40189 mapValue!40189))))

(declare-fun b!1069154 () Bool)

(assert (=> b!1069154 (= e!610122 (and e!610121 mapRes!40189))))

(declare-fun condMapEmpty!40189 () Bool)

(declare-fun mapDefault!40189 () ValueCell!12127)

