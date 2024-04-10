; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95208 () Bool)

(assert start!95208)

(declare-fun b_free!22229 () Bool)

(declare-fun b_next!22229 () Bool)

(assert (=> start!95208 (= b_free!22229 (not b_next!22229))))

(declare-fun tp!78181 () Bool)

(declare-fun b_and!35195 () Bool)

(assert (=> start!95208 (= tp!78181 b_and!35195)))

(declare-fun mapIsEmpty!40801 () Bool)

(declare-fun mapRes!40801 () Bool)

(assert (=> mapIsEmpty!40801 mapRes!40801))

(declare-fun b!1076174 () Bool)

(declare-fun e!615132 () Bool)

(declare-fun tp_is_empty!26039 () Bool)

(assert (=> b!1076174 (= e!615132 tp_is_empty!26039)))

(declare-fun b!1076175 () Bool)

(declare-fun res!717310 () Bool)

(declare-fun e!615129 () Bool)

(assert (=> b!1076175 (=> (not res!717310) (not e!615129))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39853 0))(
  ( (V!39854 (val!13070 Int)) )
))
(declare-datatypes ((ValueCell!12316 0))(
  ( (ValueCellFull!12316 (v!15697 V!39853)) (EmptyCell!12316) )
))
(declare-datatypes ((array!69047 0))(
  ( (array!69048 (arr!33207 (Array (_ BitVec 32) ValueCell!12316)) (size!33743 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69047)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69049 0))(
  ( (array!69050 (arr!33208 (Array (_ BitVec 32) (_ BitVec 64))) (size!33744 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69049)

(assert (=> b!1076175 (= res!717310 (and (= (size!33743 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33744 _keys!1163) (size!33743 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076176 () Bool)

(declare-fun e!615128 () Bool)

(assert (=> b!1076176 (= e!615129 (not e!615128))))

(declare-fun res!717306 () Bool)

(assert (=> b!1076176 (=> res!717306 e!615128)))

(assert (=> b!1076176 (= res!717306 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16650 0))(
  ( (tuple2!16651 (_1!8336 (_ BitVec 64)) (_2!8336 V!39853)) )
))
(declare-datatypes ((List!23185 0))(
  ( (Nil!23182) (Cons!23181 (h!24390 tuple2!16650) (t!32542 List!23185)) )
))
(declare-datatypes ((ListLongMap!14619 0))(
  ( (ListLongMap!14620 (toList!7325 List!23185)) )
))
(declare-fun lt!477899 () ListLongMap!14619)

(declare-fun lt!477898 () ListLongMap!14619)

(assert (=> b!1076176 (= lt!477899 lt!477898)))

(declare-fun zeroValueBefore!47 () V!39853)

(declare-datatypes ((Unit!35425 0))(
  ( (Unit!35426) )
))
(declare-fun lt!477901 () Unit!35425)

(declare-fun minValue!907 () V!39853)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39853)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!903 (array!69049 array!69047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39853 V!39853 V!39853 V!39853 (_ BitVec 32) Int) Unit!35425)

(assert (=> b!1076176 (= lt!477901 (lemmaNoChangeToArrayThenSameMapNoExtras!903 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3887 (array!69049 array!69047 (_ BitVec 32) (_ BitVec 32) V!39853 V!39853 (_ BitVec 32) Int) ListLongMap!14619)

(assert (=> b!1076176 (= lt!477898 (getCurrentListMapNoExtraKeys!3887 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076176 (= lt!477899 (getCurrentListMapNoExtraKeys!3887 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076177 () Bool)

(declare-fun res!717307 () Bool)

(assert (=> b!1076177 (=> (not res!717307) (not e!615129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69049 (_ BitVec 32)) Bool)

(assert (=> b!1076177 (= res!717307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076178 () Bool)

(declare-fun e!615127 () Bool)

(assert (=> b!1076178 (= e!615127 tp_is_empty!26039)))

(declare-fun b!1076173 () Bool)

(declare-fun res!717311 () Bool)

(assert (=> b!1076173 (=> (not res!717311) (not e!615129))))

(declare-datatypes ((List!23186 0))(
  ( (Nil!23183) (Cons!23182 (h!24391 (_ BitVec 64)) (t!32543 List!23186)) )
))
(declare-fun arrayNoDuplicates!0 (array!69049 (_ BitVec 32) List!23186) Bool)

(assert (=> b!1076173 (= res!717311 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23183))))

(declare-fun res!717309 () Bool)

(assert (=> start!95208 (=> (not res!717309) (not e!615129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95208 (= res!717309 (validMask!0 mask!1515))))

(assert (=> start!95208 e!615129))

(assert (=> start!95208 true))

(assert (=> start!95208 tp_is_empty!26039))

(declare-fun e!615131 () Bool)

(declare-fun array_inv!25658 (array!69047) Bool)

(assert (=> start!95208 (and (array_inv!25658 _values!955) e!615131)))

(assert (=> start!95208 tp!78181))

(declare-fun array_inv!25659 (array!69049) Bool)

(assert (=> start!95208 (array_inv!25659 _keys!1163)))

(declare-fun b!1076179 () Bool)

(declare-fun lt!477900 () tuple2!16650)

(declare-fun contains!6357 (ListLongMap!14619 (_ BitVec 64)) Bool)

(declare-fun +!3231 (ListLongMap!14619 tuple2!16650) ListLongMap!14619)

(assert (=> b!1076179 (= e!615128 (not (contains!6357 (+!3231 lt!477899 lt!477900) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!615130 () Bool)

(assert (=> b!1076179 e!615130))

(declare-fun res!717308 () Bool)

(assert (=> b!1076179 (=> (not res!717308) (not e!615130))))

(declare-fun lt!477903 () ListLongMap!14619)

(assert (=> b!1076179 (= res!717308 (= lt!477903 (+!3231 (+!3231 lt!477899 (tuple2!16651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477900)))))

(assert (=> b!1076179 (= lt!477900 (tuple2!16651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!477902 () ListLongMap!14619)

(declare-fun getCurrentListMap!4194 (array!69049 array!69047 (_ BitVec 32) (_ BitVec 32) V!39853 V!39853 (_ BitVec 32) Int) ListLongMap!14619)

(assert (=> b!1076179 (= lt!477902 (getCurrentListMap!4194 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076179 (= lt!477903 (getCurrentListMap!4194 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076180 () Bool)

(assert (=> b!1076180 (= e!615131 (and e!615132 mapRes!40801))))

(declare-fun condMapEmpty!40801 () Bool)

(declare-fun mapDefault!40801 () ValueCell!12316)

