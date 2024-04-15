; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94204 () Bool)

(assert start!94204)

(declare-fun b_free!21595 () Bool)

(declare-fun b_next!21595 () Bool)

(assert (=> start!94204 (= b_free!21595 (not b_next!21595))))

(declare-fun tp!76223 () Bool)

(declare-fun b_and!34329 () Bool)

(assert (=> start!94204 (= tp!76223 b_and!34329)))

(declare-fun b!1065240 () Bool)

(declare-fun e!607258 () Bool)

(assert (=> b!1065240 (= e!607258 true)))

(declare-datatypes ((V!39009 0))(
  ( (V!39010 (val!12753 Int)) )
))
(declare-datatypes ((tuple2!16220 0))(
  ( (tuple2!16221 (_1!8121 (_ BitVec 64)) (_2!8121 V!39009)) )
))
(declare-datatypes ((List!22769 0))(
  ( (Nil!22766) (Cons!22765 (h!23974 tuple2!16220) (t!32079 List!22769)) )
))
(declare-datatypes ((ListLongMap!14189 0))(
  ( (ListLongMap!14190 (toList!7110 List!22769)) )
))
(declare-fun lt!469603 () ListLongMap!14189)

(declare-fun lt!469608 () ListLongMap!14189)

(declare-fun -!588 (ListLongMap!14189 (_ BitVec 64)) ListLongMap!14189)

(assert (=> b!1065240 (= lt!469603 (-!588 lt!469608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469604 () ListLongMap!14189)

(declare-fun lt!469606 () ListLongMap!14189)

(assert (=> b!1065240 (= (-!588 lt!469604 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469606)))

(declare-datatypes ((Unit!34806 0))(
  ( (Unit!34807) )
))
(declare-fun lt!469602 () Unit!34806)

(declare-fun zeroValueBefore!47 () V!39009)

(declare-fun addThenRemoveForNewKeyIsSame!6 (ListLongMap!14189 (_ BitVec 64) V!39009) Unit!34806)

(assert (=> b!1065240 (= lt!469602 (addThenRemoveForNewKeyIsSame!6 lt!469606 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469609 () ListLongMap!14189)

(declare-fun lt!469605 () ListLongMap!14189)

(assert (=> b!1065240 (and (= lt!469608 lt!469604) (= lt!469605 lt!469609))))

(declare-fun +!3154 (ListLongMap!14189 tuple2!16220) ListLongMap!14189)

(assert (=> b!1065240 (= lt!469604 (+!3154 lt!469606 (tuple2!16221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11999 0))(
  ( (ValueCellFull!11999 (v!15364 V!39009)) (EmptyCell!11999) )
))
(declare-datatypes ((array!67744 0))(
  ( (array!67745 (arr!32575 (Array (_ BitVec 32) ValueCell!11999)) (size!33113 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67744)

(declare-fun minValue!907 () V!39009)

(declare-datatypes ((array!67746 0))(
  ( (array!67747 (arr!32576 (Array (_ BitVec 32) (_ BitVec 64))) (size!33114 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67746)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39009)

(declare-fun getCurrentListMap!3986 (array!67746 array!67744 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1065240 (= lt!469605 (getCurrentListMap!3986 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065240 (= lt!469608 (getCurrentListMap!3986 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065241 () Bool)

(declare-fun e!607259 () Bool)

(declare-fun e!607261 () Bool)

(declare-fun mapRes!39793 () Bool)

(assert (=> b!1065241 (= e!607259 (and e!607261 mapRes!39793))))

(declare-fun condMapEmpty!39793 () Bool)

(declare-fun mapDefault!39793 () ValueCell!11999)

(assert (=> b!1065241 (= condMapEmpty!39793 (= (arr!32575 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11999)) mapDefault!39793)))))

(declare-fun res!711088 () Bool)

(declare-fun e!607257 () Bool)

(assert (=> start!94204 (=> (not res!711088) (not e!607257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94204 (= res!711088 (validMask!0 mask!1515))))

(assert (=> start!94204 e!607257))

(assert (=> start!94204 true))

(declare-fun tp_is_empty!25405 () Bool)

(assert (=> start!94204 tp_is_empty!25405))

(declare-fun array_inv!25224 (array!67744) Bool)

(assert (=> start!94204 (and (array_inv!25224 _values!955) e!607259)))

(assert (=> start!94204 tp!76223))

(declare-fun array_inv!25225 (array!67746) Bool)

(assert (=> start!94204 (array_inv!25225 _keys!1163)))

(declare-fun b!1065242 () Bool)

(assert (=> b!1065242 (= e!607261 tp_is_empty!25405)))

(declare-fun b!1065243 () Bool)

(declare-fun e!607262 () Bool)

(assert (=> b!1065243 (= e!607262 tp_is_empty!25405)))

(declare-fun mapIsEmpty!39793 () Bool)

(assert (=> mapIsEmpty!39793 mapRes!39793))

(declare-fun b!1065244 () Bool)

(assert (=> b!1065244 (= e!607257 (not e!607258))))

(declare-fun res!711087 () Bool)

(assert (=> b!1065244 (=> res!711087 e!607258)))

(assert (=> b!1065244 (= res!711087 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065244 (= lt!469606 lt!469609)))

(declare-fun lt!469607 () Unit!34806)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!706 (array!67746 array!67744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 V!39009 V!39009 (_ BitVec 32) Int) Unit!34806)

(assert (=> b!1065244 (= lt!469607 (lemmaNoChangeToArrayThenSameMapNoExtras!706 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3712 (array!67746 array!67744 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1065244 (= lt!469609 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065244 (= lt!469606 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39793 () Bool)

(declare-fun tp!76222 () Bool)

(assert (=> mapNonEmpty!39793 (= mapRes!39793 (and tp!76222 e!607262))))

(declare-fun mapRest!39793 () (Array (_ BitVec 32) ValueCell!11999))

(declare-fun mapValue!39793 () ValueCell!11999)

(declare-fun mapKey!39793 () (_ BitVec 32))

(assert (=> mapNonEmpty!39793 (= (arr!32575 _values!955) (store mapRest!39793 mapKey!39793 mapValue!39793))))

(declare-fun b!1065245 () Bool)

(declare-fun res!711090 () Bool)

(assert (=> b!1065245 (=> (not res!711090) (not e!607257))))

(declare-datatypes ((List!22770 0))(
  ( (Nil!22767) (Cons!22766 (h!23975 (_ BitVec 64)) (t!32080 List!22770)) )
))
(declare-fun arrayNoDuplicates!0 (array!67746 (_ BitVec 32) List!22770) Bool)

(assert (=> b!1065245 (= res!711090 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22767))))

(declare-fun b!1065246 () Bool)

(declare-fun res!711089 () Bool)

(assert (=> b!1065246 (=> (not res!711089) (not e!607257))))

(assert (=> b!1065246 (= res!711089 (and (= (size!33113 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33114 _keys!1163) (size!33113 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065247 () Bool)

(declare-fun res!711086 () Bool)

(assert (=> b!1065247 (=> (not res!711086) (not e!607257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67746 (_ BitVec 32)) Bool)

(assert (=> b!1065247 (= res!711086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94204 res!711088) b!1065246))

(assert (= (and b!1065246 res!711089) b!1065247))

(assert (= (and b!1065247 res!711086) b!1065245))

(assert (= (and b!1065245 res!711090) b!1065244))

(assert (= (and b!1065244 (not res!711087)) b!1065240))

(assert (= (and b!1065241 condMapEmpty!39793) mapIsEmpty!39793))

(assert (= (and b!1065241 (not condMapEmpty!39793)) mapNonEmpty!39793))

(get-info :version)

(assert (= (and mapNonEmpty!39793 ((_ is ValueCellFull!11999) mapValue!39793)) b!1065243))

(assert (= (and b!1065241 ((_ is ValueCellFull!11999) mapDefault!39793)) b!1065242))

(assert (= start!94204 b!1065241))

(declare-fun m!983213 () Bool)

(assert (=> mapNonEmpty!39793 m!983213))

(declare-fun m!983215 () Bool)

(assert (=> start!94204 m!983215))

(declare-fun m!983217 () Bool)

(assert (=> start!94204 m!983217))

(declare-fun m!983219 () Bool)

(assert (=> start!94204 m!983219))

(declare-fun m!983221 () Bool)

(assert (=> b!1065244 m!983221))

(declare-fun m!983223 () Bool)

(assert (=> b!1065244 m!983223))

(declare-fun m!983225 () Bool)

(assert (=> b!1065244 m!983225))

(declare-fun m!983227 () Bool)

(assert (=> b!1065240 m!983227))

(declare-fun m!983229 () Bool)

(assert (=> b!1065240 m!983229))

(declare-fun m!983231 () Bool)

(assert (=> b!1065240 m!983231))

(declare-fun m!983233 () Bool)

(assert (=> b!1065240 m!983233))

(declare-fun m!983235 () Bool)

(assert (=> b!1065240 m!983235))

(declare-fun m!983237 () Bool)

(assert (=> b!1065240 m!983237))

(declare-fun m!983239 () Bool)

(assert (=> b!1065245 m!983239))

(declare-fun m!983241 () Bool)

(assert (=> b!1065247 m!983241))

(check-sat (not b!1065244) (not b!1065247) (not b!1065240) (not b_next!21595) (not mapNonEmpty!39793) (not b!1065245) b_and!34329 (not start!94204) tp_is_empty!25405)
(check-sat b_and!34329 (not b_next!21595))
