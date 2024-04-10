; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94366 () Bool)

(assert start!94366)

(declare-fun b_free!21707 () Bool)

(declare-fun b_next!21707 () Bool)

(assert (=> start!94366 (= b_free!21707 (not b_next!21707))))

(declare-fun tp!76564 () Bool)

(declare-fun b_and!34491 () Bool)

(assert (=> start!94366 (= tp!76564 b_and!34491)))

(declare-fun b!1067079 () Bool)

(declare-fun res!712136 () Bool)

(declare-fun e!608573 () Bool)

(assert (=> b!1067079 (=> (not res!712136) (not e!608573))))

(declare-datatypes ((array!68019 0))(
  ( (array!68020 (arr!32710 (Array (_ BitVec 32) (_ BitVec 64))) (size!33246 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68019)

(declare-datatypes ((List!22813 0))(
  ( (Nil!22810) (Cons!22809 (h!24018 (_ BitVec 64)) (t!32136 List!22813)) )
))
(declare-fun arrayNoDuplicates!0 (array!68019 (_ BitVec 32) List!22813) Bool)

(assert (=> b!1067079 (= res!712136 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22810))))

(declare-fun b!1067080 () Bool)

(declare-fun res!712133 () Bool)

(assert (=> b!1067080 (=> (not res!712133) (not e!608573))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68019 (_ BitVec 32)) Bool)

(assert (=> b!1067080 (= res!712133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067081 () Bool)

(assert (=> b!1067081 (= e!608573 (not true))))

(declare-datatypes ((V!39157 0))(
  ( (V!39158 (val!12809 Int)) )
))
(declare-datatypes ((tuple2!16254 0))(
  ( (tuple2!16255 (_1!8138 (_ BitVec 64)) (_2!8138 V!39157)) )
))
(declare-datatypes ((List!22814 0))(
  ( (Nil!22811) (Cons!22810 (h!24019 tuple2!16254) (t!32137 List!22814)) )
))
(declare-datatypes ((ListLongMap!14223 0))(
  ( (ListLongMap!14224 (toList!7127 List!22814)) )
))
(declare-fun lt!471293 () ListLongMap!14223)

(declare-fun lt!471294 () ListLongMap!14223)

(assert (=> b!1067081 (= lt!471293 lt!471294)))

(declare-fun zeroValueBefore!47 () V!39157)

(declare-datatypes ((ValueCell!12055 0))(
  ( (ValueCellFull!12055 (v!15423 V!39157)) (EmptyCell!12055) )
))
(declare-datatypes ((array!68021 0))(
  ( (array!68022 (arr!32711 (Array (_ BitVec 32) ValueCell!12055)) (size!33247 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68021)

(declare-fun minValue!907 () V!39157)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35051 0))(
  ( (Unit!35052) )
))
(declare-fun lt!471292 () Unit!35051)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39157)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!748 (array!68019 array!68021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39157 V!39157 V!39157 V!39157 (_ BitVec 32) Int) Unit!35051)

(assert (=> b!1067081 (= lt!471292 (lemmaNoChangeToArrayThenSameMapNoExtras!748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3711 (array!68019 array!68021 (_ BitVec 32) (_ BitVec 32) V!39157 V!39157 (_ BitVec 32) Int) ListLongMap!14223)

(assert (=> b!1067081 (= lt!471294 (getCurrentListMapNoExtraKeys!3711 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067081 (= lt!471293 (getCurrentListMapNoExtraKeys!3711 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067082 () Bool)

(declare-fun e!608570 () Bool)

(declare-fun tp_is_empty!25517 () Bool)

(assert (=> b!1067082 (= e!608570 tp_is_empty!25517)))

(declare-fun b!1067083 () Bool)

(declare-fun e!608574 () Bool)

(assert (=> b!1067083 (= e!608574 tp_is_empty!25517)))

(declare-fun b!1067084 () Bool)

(declare-fun e!608571 () Bool)

(declare-fun mapRes!39967 () Bool)

(assert (=> b!1067084 (= e!608571 (and e!608574 mapRes!39967))))

(declare-fun condMapEmpty!39967 () Bool)

(declare-fun mapDefault!39967 () ValueCell!12055)

