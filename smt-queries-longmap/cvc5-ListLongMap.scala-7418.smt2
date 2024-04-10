; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94322 () Bool)

(assert start!94322)

(declare-fun b_free!21685 () Bool)

(declare-fun b_next!21685 () Bool)

(assert (=> start!94322 (= b_free!21685 (not b_next!21685))))

(declare-fun tp!76495 () Bool)

(declare-fun b_and!34457 () Bool)

(assert (=> start!94322 (= tp!76495 b_and!34457)))

(declare-fun b!1066659 () Bool)

(declare-fun e!608286 () Bool)

(declare-fun e!608281 () Bool)

(assert (=> b!1066659 (= e!608286 e!608281)))

(declare-fun res!711916 () Bool)

(assert (=> b!1066659 (=> res!711916 e!608281)))

(declare-datatypes ((V!39129 0))(
  ( (V!39130 (val!12798 Int)) )
))
(declare-datatypes ((tuple2!16234 0))(
  ( (tuple2!16235 (_1!8128 (_ BitVec 64)) (_2!8128 V!39129)) )
))
(declare-datatypes ((List!22797 0))(
  ( (Nil!22794) (Cons!22793 (h!24002 tuple2!16234) (t!32118 List!22797)) )
))
(declare-datatypes ((ListLongMap!14203 0))(
  ( (ListLongMap!14204 (toList!7117 List!22797)) )
))
(declare-fun lt!471023 () ListLongMap!14203)

(declare-fun lt!471019 () ListLongMap!14203)

(declare-fun -!626 (ListLongMap!14203 (_ BitVec 64)) ListLongMap!14203)

(assert (=> b!1066659 (= res!711916 (not (= (-!626 lt!471023 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471019)))))

(declare-fun lt!471021 () ListLongMap!14203)

(declare-fun lt!471024 () ListLongMap!14203)

(assert (=> b!1066659 (= (-!626 lt!471021 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471024)))

(declare-datatypes ((Unit!35029 0))(
  ( (Unit!35030) )
))
(declare-fun lt!471018 () Unit!35029)

(declare-fun zeroValueBefore!47 () V!39129)

(declare-fun addThenRemoveForNewKeyIsSame!35 (ListLongMap!14203 (_ BitVec 64) V!39129) Unit!35029)

(assert (=> b!1066659 (= lt!471018 (addThenRemoveForNewKeyIsSame!35 lt!471024 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471020 () ListLongMap!14203)

(assert (=> b!1066659 (and (= lt!471023 lt!471021) (= lt!471019 lt!471020))))

(declare-fun +!3157 (ListLongMap!14203 tuple2!16234) ListLongMap!14203)

(assert (=> b!1066659 (= lt!471021 (+!3157 lt!471024 (tuple2!16235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12044 0))(
  ( (ValueCellFull!12044 (v!15411 V!39129)) (EmptyCell!12044) )
))
(declare-datatypes ((array!67975 0))(
  ( (array!67976 (arr!32689 (Array (_ BitVec 32) ValueCell!12044)) (size!33225 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67975)

(declare-fun minValue!907 () V!39129)

(declare-datatypes ((array!67977 0))(
  ( (array!67978 (arr!32690 (Array (_ BitVec 32) (_ BitVec 64))) (size!33226 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67977)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39129)

(declare-fun getCurrentListMap!4070 (array!67977 array!67975 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14203)

(assert (=> b!1066659 (= lt!471019 (getCurrentListMap!4070 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066659 (= lt!471023 (getCurrentListMap!4070 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066660 () Bool)

(declare-fun e!608287 () Bool)

(assert (=> b!1066660 (= e!608287 (not e!608286))))

(declare-fun res!711918 () Bool)

(assert (=> b!1066660 (=> res!711918 e!608286)))

(assert (=> b!1066660 (= res!711918 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066660 (= lt!471024 lt!471020)))

(declare-fun lt!471022 () Unit!35029)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!739 (array!67977 array!67975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 V!39129 V!39129 (_ BitVec 32) Int) Unit!35029)

(assert (=> b!1066660 (= lt!471022 (lemmaNoChangeToArrayThenSameMapNoExtras!739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3702 (array!67977 array!67975 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14203)

(assert (=> b!1066660 (= lt!471020 (getCurrentListMapNoExtraKeys!3702 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066660 (= lt!471024 (getCurrentListMapNoExtraKeys!3702 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066661 () Bool)

(declare-fun res!711915 () Bool)

(assert (=> b!1066661 (=> (not res!711915) (not e!608287))))

(assert (=> b!1066661 (= res!711915 (and (= (size!33225 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33226 _keys!1163) (size!33225 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066662 () Bool)

(declare-fun res!711917 () Bool)

(assert (=> b!1066662 (=> (not res!711917) (not e!608287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67977 (_ BitVec 32)) Bool)

(assert (=> b!1066662 (= res!711917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!711919 () Bool)

(assert (=> start!94322 (=> (not res!711919) (not e!608287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94322 (= res!711919 (validMask!0 mask!1515))))

(assert (=> start!94322 e!608287))

(assert (=> start!94322 true))

(declare-fun tp_is_empty!25495 () Bool)

(assert (=> start!94322 tp_is_empty!25495))

(declare-fun e!608284 () Bool)

(declare-fun array_inv!25308 (array!67975) Bool)

(assert (=> start!94322 (and (array_inv!25308 _values!955) e!608284)))

(assert (=> start!94322 tp!76495))

(declare-fun array_inv!25309 (array!67977) Bool)

(assert (=> start!94322 (array_inv!25309 _keys!1163)))

(declare-fun mapIsEmpty!39931 () Bool)

(declare-fun mapRes!39931 () Bool)

(assert (=> mapIsEmpty!39931 mapRes!39931))

(declare-fun b!1066663 () Bool)

(declare-fun e!608283 () Bool)

(assert (=> b!1066663 (= e!608284 (and e!608283 mapRes!39931))))

(declare-fun condMapEmpty!39931 () Bool)

(declare-fun mapDefault!39931 () ValueCell!12044)

