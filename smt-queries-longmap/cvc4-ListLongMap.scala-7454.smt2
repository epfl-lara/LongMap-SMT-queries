; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94622 () Bool)

(assert start!94622)

(declare-fun b_free!21905 () Bool)

(declare-fun b_next!21905 () Bool)

(assert (=> start!94622 (= b_free!21905 (not b_next!21905))))

(declare-fun tp!77168 () Bool)

(declare-fun b_and!34717 () Bool)

(assert (=> start!94622 (= tp!77168 b_and!34717)))

(declare-fun b!1069890 () Bool)

(declare-fun res!713807 () Bool)

(declare-fun e!610644 () Bool)

(assert (=> b!1069890 (=> (not res!713807) (not e!610644))))

(declare-datatypes ((array!68407 0))(
  ( (array!68408 (arr!32901 (Array (_ BitVec 32) (_ BitVec 64))) (size!33437 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68407)

(declare-datatypes ((List!22952 0))(
  ( (Nil!22949) (Cons!22948 (h!24157 (_ BitVec 64)) (t!32281 List!22952)) )
))
(declare-fun arrayNoDuplicates!0 (array!68407 (_ BitVec 32) List!22952) Bool)

(assert (=> b!1069890 (= res!713807 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22949))))

(declare-fun b!1069891 () Bool)

(declare-fun res!713809 () Bool)

(assert (=> b!1069891 (=> (not res!713809) (not e!610644))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39421 0))(
  ( (V!39422 (val!12908 Int)) )
))
(declare-datatypes ((ValueCell!12154 0))(
  ( (ValueCellFull!12154 (v!15524 V!39421)) (EmptyCell!12154) )
))
(declare-datatypes ((array!68409 0))(
  ( (array!68410 (arr!32902 (Array (_ BitVec 32) ValueCell!12154)) (size!33438 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68409)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069891 (= res!713809 (and (= (size!33438 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33437 _keys!1163) (size!33438 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069892 () Bool)

(declare-fun res!713810 () Bool)

(assert (=> b!1069892 (=> (not res!713810) (not e!610644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68407 (_ BitVec 32)) Bool)

(assert (=> b!1069892 (= res!713810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069893 () Bool)

(assert (=> b!1069893 (= e!610644 (not true))))

(declare-datatypes ((tuple2!16408 0))(
  ( (tuple2!16409 (_1!8215 (_ BitVec 64)) (_2!8215 V!39421)) )
))
(declare-datatypes ((List!22953 0))(
  ( (Nil!22950) (Cons!22949 (h!24158 tuple2!16408) (t!32282 List!22953)) )
))
(declare-datatypes ((ListLongMap!14377 0))(
  ( (ListLongMap!14378 (toList!7204 List!22953)) )
))
(declare-fun lt!472806 () ListLongMap!14377)

(declare-fun lt!472805 () ListLongMap!14377)

(assert (=> b!1069893 (= lt!472806 lt!472805)))

(declare-fun zeroValueBefore!47 () V!39421)

(declare-datatypes ((Unit!35207 0))(
  ( (Unit!35208) )
))
(declare-fun lt!472804 () Unit!35207)

(declare-fun minValue!907 () V!39421)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39421)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!817 (array!68407 array!68409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39421 V!39421 V!39421 V!39421 (_ BitVec 32) Int) Unit!35207)

(assert (=> b!1069893 (= lt!472804 (lemmaNoChangeToArrayThenSameMapNoExtras!817 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3780 (array!68407 array!68409 (_ BitVec 32) (_ BitVec 32) V!39421 V!39421 (_ BitVec 32) Int) ListLongMap!14377)

(assert (=> b!1069893 (= lt!472805 (getCurrentListMapNoExtraKeys!3780 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069893 (= lt!472806 (getCurrentListMapNoExtraKeys!3780 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40273 () Bool)

(declare-fun mapRes!40273 () Bool)

(assert (=> mapIsEmpty!40273 mapRes!40273))

(declare-fun b!1069894 () Bool)

(declare-fun e!610643 () Bool)

(declare-fun e!610646 () Bool)

(assert (=> b!1069894 (= e!610643 (and e!610646 mapRes!40273))))

(declare-fun condMapEmpty!40273 () Bool)

(declare-fun mapDefault!40273 () ValueCell!12154)

