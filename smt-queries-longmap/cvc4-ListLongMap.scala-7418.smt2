; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94326 () Bool)

(assert start!94326)

(declare-fun b_free!21689 () Bool)

(declare-fun b_next!21689 () Bool)

(assert (=> start!94326 (= b_free!21689 (not b_next!21689))))

(declare-fun tp!76507 () Bool)

(declare-fun b_and!34461 () Bool)

(assert (=> start!94326 (= tp!76507 b_and!34461)))

(declare-fun res!711954 () Bool)

(declare-fun e!608323 () Bool)

(assert (=> start!94326 (=> (not res!711954) (not e!608323))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94326 (= res!711954 (validMask!0 mask!1515))))

(assert (=> start!94326 e!608323))

(assert (=> start!94326 true))

(declare-fun tp_is_empty!25499 () Bool)

(assert (=> start!94326 tp_is_empty!25499))

(declare-datatypes ((V!39133 0))(
  ( (V!39134 (val!12800 Int)) )
))
(declare-datatypes ((ValueCell!12046 0))(
  ( (ValueCellFull!12046 (v!15413 V!39133)) (EmptyCell!12046) )
))
(declare-datatypes ((array!67983 0))(
  ( (array!67984 (arr!32693 (Array (_ BitVec 32) ValueCell!12046)) (size!33229 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67983)

(declare-fun e!608326 () Bool)

(declare-fun array_inv!25312 (array!67983) Bool)

(assert (=> start!94326 (and (array_inv!25312 _values!955) e!608326)))

(assert (=> start!94326 tp!76507))

(declare-datatypes ((array!67985 0))(
  ( (array!67986 (arr!32694 (Array (_ BitVec 32) (_ BitVec 64))) (size!33230 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67985)

(declare-fun array_inv!25313 (array!67985) Bool)

(assert (=> start!94326 (array_inv!25313 _keys!1163)))

(declare-fun mapNonEmpty!39937 () Bool)

(declare-fun mapRes!39937 () Bool)

(declare-fun tp!76508 () Bool)

(declare-fun e!608329 () Bool)

(assert (=> mapNonEmpty!39937 (= mapRes!39937 (and tp!76508 e!608329))))

(declare-fun mapRest!39937 () (Array (_ BitVec 32) ValueCell!12046))

(declare-fun mapKey!39937 () (_ BitVec 32))

(declare-fun mapValue!39937 () ValueCell!12046)

(assert (=> mapNonEmpty!39937 (= (arr!32693 _values!955) (store mapRest!39937 mapKey!39937 mapValue!39937))))

(declare-fun b!1066713 () Bool)

(declare-fun e!608324 () Bool)

(assert (=> b!1066713 (= e!608324 (bvsle #b00000000000000000000000000000000 (size!33230 _keys!1163)))))

(declare-fun b!1066714 () Bool)

(declare-fun e!608327 () Bool)

(assert (=> b!1066714 (= e!608327 e!608324)))

(declare-fun res!711950 () Bool)

(assert (=> b!1066714 (=> res!711950 e!608324)))

(declare-datatypes ((tuple2!16238 0))(
  ( (tuple2!16239 (_1!8130 (_ BitVec 64)) (_2!8130 V!39133)) )
))
(declare-datatypes ((List!22800 0))(
  ( (Nil!22797) (Cons!22796 (h!24005 tuple2!16238) (t!32121 List!22800)) )
))
(declare-datatypes ((ListLongMap!14207 0))(
  ( (ListLongMap!14208 (toList!7119 List!22800)) )
))
(declare-fun lt!471065 () ListLongMap!14207)

(declare-fun lt!471060 () ListLongMap!14207)

(declare-fun -!628 (ListLongMap!14207 (_ BitVec 64)) ListLongMap!14207)

(assert (=> b!1066714 (= res!711950 (not (= (-!628 lt!471065 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471060)))))

(declare-fun lt!471064 () ListLongMap!14207)

(declare-fun lt!471066 () ListLongMap!14207)

(assert (=> b!1066714 (= (-!628 lt!471064 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471066)))

(declare-datatypes ((Unit!35033 0))(
  ( (Unit!35034) )
))
(declare-fun lt!471063 () Unit!35033)

(declare-fun zeroValueBefore!47 () V!39133)

(declare-fun addThenRemoveForNewKeyIsSame!37 (ListLongMap!14207 (_ BitVec 64) V!39133) Unit!35033)

(assert (=> b!1066714 (= lt!471063 (addThenRemoveForNewKeyIsSame!37 lt!471066 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471061 () ListLongMap!14207)

(assert (=> b!1066714 (and (= lt!471065 lt!471064) (= lt!471060 lt!471061))))

(declare-fun +!3159 (ListLongMap!14207 tuple2!16238) ListLongMap!14207)

(assert (=> b!1066714 (= lt!471064 (+!3159 lt!471066 (tuple2!16239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39133)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39133)

(declare-fun getCurrentListMap!4072 (array!67985 array!67983 (_ BitVec 32) (_ BitVec 32) V!39133 V!39133 (_ BitVec 32) Int) ListLongMap!14207)

(assert (=> b!1066714 (= lt!471060 (getCurrentListMap!4072 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066714 (= lt!471065 (getCurrentListMap!4072 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066715 () Bool)

(declare-fun res!711953 () Bool)

(assert (=> b!1066715 (=> (not res!711953) (not e!608323))))

(declare-datatypes ((List!22801 0))(
  ( (Nil!22798) (Cons!22797 (h!24006 (_ BitVec 64)) (t!32122 List!22801)) )
))
(declare-fun arrayNoDuplicates!0 (array!67985 (_ BitVec 32) List!22801) Bool)

(assert (=> b!1066715 (= res!711953 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22798))))

(declare-fun b!1066716 () Bool)

(assert (=> b!1066716 (= e!608329 tp_is_empty!25499)))

(declare-fun b!1066717 () Bool)

(declare-fun res!711955 () Bool)

(assert (=> b!1066717 (=> (not res!711955) (not e!608323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67985 (_ BitVec 32)) Bool)

(assert (=> b!1066717 (= res!711955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066718 () Bool)

(declare-fun e!608325 () Bool)

(assert (=> b!1066718 (= e!608326 (and e!608325 mapRes!39937))))

(declare-fun condMapEmpty!39937 () Bool)

(declare-fun mapDefault!39937 () ValueCell!12046)

