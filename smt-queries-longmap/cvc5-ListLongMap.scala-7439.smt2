; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94506 () Bool)

(assert start!94506)

(declare-fun b_free!21811 () Bool)

(declare-fun b_next!21811 () Bool)

(assert (=> start!94506 (= b_free!21811 (not b_next!21811))))

(declare-fun tp!76882 () Bool)

(declare-fun b_and!34613 () Bool)

(assert (=> start!94506 (= tp!76882 b_and!34613)))

(declare-fun mapNonEmpty!40129 () Bool)

(declare-fun mapRes!40129 () Bool)

(declare-fun tp!76883 () Bool)

(declare-fun e!609699 () Bool)

(assert (=> mapNonEmpty!40129 (= mapRes!40129 (and tp!76883 e!609699))))

(declare-datatypes ((V!39297 0))(
  ( (V!39298 (val!12861 Int)) )
))
(declare-datatypes ((ValueCell!12107 0))(
  ( (ValueCellFull!12107 (v!15476 V!39297)) (EmptyCell!12107) )
))
(declare-fun mapRest!40129 () (Array (_ BitVec 32) ValueCell!12107))

(declare-fun mapValue!40129 () ValueCell!12107)

(declare-fun mapKey!40129 () (_ BitVec 32))

(declare-datatypes ((array!68223 0))(
  ( (array!68224 (arr!32810 (Array (_ BitVec 32) ValueCell!12107)) (size!33346 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68223)

(assert (=> mapNonEmpty!40129 (= (arr!32810 _values!955) (store mapRest!40129 mapKey!40129 mapValue!40129))))

(declare-fun res!713046 () Bool)

(declare-fun e!609703 () Bool)

(assert (=> start!94506 (=> (not res!713046) (not e!609703))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94506 (= res!713046 (validMask!0 mask!1515))))

(assert (=> start!94506 e!609703))

(assert (=> start!94506 true))

(declare-fun tp_is_empty!25621 () Bool)

(assert (=> start!94506 tp_is_empty!25621))

(declare-fun e!609700 () Bool)

(declare-fun array_inv!25400 (array!68223) Bool)

(assert (=> start!94506 (and (array_inv!25400 _values!955) e!609700)))

(assert (=> start!94506 tp!76882))

(declare-datatypes ((array!68225 0))(
  ( (array!68226 (arr!32811 (Array (_ BitVec 32) (_ BitVec 64))) (size!33347 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68225)

(declare-fun array_inv!25401 (array!68225) Bool)

(assert (=> start!94506 (array_inv!25401 _keys!1163)))

(declare-fun b!1068606 () Bool)

(declare-fun e!609698 () Bool)

(declare-fun e!609701 () Bool)

(assert (=> b!1068606 (= e!609698 e!609701)))

(declare-fun res!713043 () Bool)

(assert (=> b!1068606 (=> res!713043 e!609701)))

(declare-datatypes ((tuple2!16338 0))(
  ( (tuple2!16339 (_1!8180 (_ BitVec 64)) (_2!8180 V!39297)) )
))
(declare-datatypes ((List!22887 0))(
  ( (Nil!22884) (Cons!22883 (h!24092 tuple2!16338) (t!32214 List!22887)) )
))
(declare-datatypes ((ListLongMap!14307 0))(
  ( (ListLongMap!14308 (toList!7169 List!22887)) )
))
(declare-fun lt!472119 () ListLongMap!14307)

(declare-fun contains!6300 (ListLongMap!14307 (_ BitVec 64)) Bool)

(assert (=> b!1068606 (= res!713043 (contains!6300 lt!472119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39297)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39297)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4096 (array!68225 array!68223 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14307)

(assert (=> b!1068606 (= lt!472119 (getCurrentListMap!4096 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068607 () Bool)

(assert (=> b!1068607 (= e!609703 (not e!609698))))

(declare-fun res!713045 () Bool)

(assert (=> b!1068607 (=> res!713045 e!609698)))

(assert (=> b!1068607 (= res!713045 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472120 () ListLongMap!14307)

(declare-fun lt!472117 () ListLongMap!14307)

(assert (=> b!1068607 (= lt!472120 lt!472117)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35137 0))(
  ( (Unit!35138) )
))
(declare-fun lt!472121 () Unit!35137)

(declare-fun zeroValueAfter!47 () V!39297)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!786 (array!68225 array!68223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 V!39297 V!39297 (_ BitVec 32) Int) Unit!35137)

(assert (=> b!1068607 (= lt!472121 (lemmaNoChangeToArrayThenSameMapNoExtras!786 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3749 (array!68225 array!68223 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14307)

(assert (=> b!1068607 (= lt!472117 (getCurrentListMapNoExtraKeys!3749 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068607 (= lt!472120 (getCurrentListMapNoExtraKeys!3749 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40129 () Bool)

(assert (=> mapIsEmpty!40129 mapRes!40129))

(declare-fun b!1068608 () Bool)

(declare-fun res!713042 () Bool)

(assert (=> b!1068608 (=> (not res!713042) (not e!609703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68225 (_ BitVec 32)) Bool)

(assert (=> b!1068608 (= res!713042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068609 () Bool)

(declare-fun res!713044 () Bool)

(assert (=> b!1068609 (=> (not res!713044) (not e!609703))))

(declare-datatypes ((List!22888 0))(
  ( (Nil!22885) (Cons!22884 (h!24093 (_ BitVec 64)) (t!32215 List!22888)) )
))
(declare-fun arrayNoDuplicates!0 (array!68225 (_ BitVec 32) List!22888) Bool)

(assert (=> b!1068609 (= res!713044 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22885))))

(declare-fun b!1068610 () Bool)

(declare-fun res!713047 () Bool)

(assert (=> b!1068610 (=> (not res!713047) (not e!609703))))

(assert (=> b!1068610 (= res!713047 (and (= (size!33346 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33347 _keys!1163) (size!33346 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068611 () Bool)

(declare-fun e!609704 () Bool)

(assert (=> b!1068611 (= e!609704 tp_is_empty!25621)))

(declare-fun b!1068612 () Bool)

(assert (=> b!1068612 (= e!609700 (and e!609704 mapRes!40129))))

(declare-fun condMapEmpty!40129 () Bool)

(declare-fun mapDefault!40129 () ValueCell!12107)

