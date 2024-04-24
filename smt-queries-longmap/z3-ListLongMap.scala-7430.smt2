; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94666 () Bool)

(assert start!94666)

(declare-fun b_free!21757 () Bool)

(declare-fun b_next!21757 () Bool)

(assert (=> start!94666 (= b_free!21757 (not b_next!21757))))

(declare-fun tp!76718 () Bool)

(declare-fun b_and!34559 () Bool)

(assert (=> start!94666 (= tp!76718 b_and!34559)))

(declare-fun mapIsEmpty!40045 () Bool)

(declare-fun mapRes!40045 () Bool)

(assert (=> mapIsEmpty!40045 mapRes!40045))

(declare-fun b!1069047 () Bool)

(declare-fun e!609891 () Bool)

(declare-fun tp_is_empty!25567 () Bool)

(assert (=> b!1069047 (= e!609891 tp_is_empty!25567)))

(declare-fun b!1069048 () Bool)

(declare-fun res!713020 () Bool)

(declare-fun e!609889 () Bool)

(assert (=> b!1069048 (=> (not res!713020) (not e!609889))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39225 0))(
  ( (V!39226 (val!12834 Int)) )
))
(declare-datatypes ((ValueCell!12080 0))(
  ( (ValueCellFull!12080 (v!15444 V!39225)) (EmptyCell!12080) )
))
(declare-datatypes ((array!68161 0))(
  ( (array!68162 (arr!32774 (Array (_ BitVec 32) ValueCell!12080)) (size!33311 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68161)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68163 0))(
  ( (array!68164 (arr!32775 (Array (_ BitVec 32) (_ BitVec 64))) (size!33312 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68163)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069048 (= res!713020 (and (= (size!33311 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33312 _keys!1163) (size!33311 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069049 () Bool)

(declare-fun e!609886 () Bool)

(assert (=> b!1069049 (= e!609886 (and e!609891 mapRes!40045))))

(declare-fun condMapEmpty!40045 () Bool)

(declare-fun mapDefault!40045 () ValueCell!12080)

(assert (=> b!1069049 (= condMapEmpty!40045 (= (arr!32774 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12080)) mapDefault!40045)))))

(declare-fun res!713021 () Bool)

(assert (=> start!94666 (=> (not res!713021) (not e!609889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94666 (= res!713021 (validMask!0 mask!1515))))

(assert (=> start!94666 e!609889))

(assert (=> start!94666 true))

(assert (=> start!94666 tp_is_empty!25567))

(declare-fun array_inv!25394 (array!68161) Bool)

(assert (=> start!94666 (and (array_inv!25394 _values!955) e!609886)))

(assert (=> start!94666 tp!76718))

(declare-fun array_inv!25395 (array!68163) Bool)

(assert (=> start!94666 (array_inv!25395 _keys!1163)))

(declare-fun b!1069050 () Bool)

(declare-fun res!713017 () Bool)

(assert (=> b!1069050 (=> (not res!713017) (not e!609889))))

(declare-datatypes ((List!22835 0))(
  ( (Nil!22832) (Cons!22831 (h!24049 (_ BitVec 64)) (t!32152 List!22835)) )
))
(declare-fun arrayNoDuplicates!0 (array!68163 (_ BitVec 32) List!22835) Bool)

(assert (=> b!1069050 (= res!713017 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22832))))

(declare-fun b!1069051 () Bool)

(declare-fun e!609892 () Bool)

(assert (=> b!1069051 (= e!609892 tp_is_empty!25567)))

(declare-fun b!1069052 () Bool)

(declare-fun e!609888 () Bool)

(declare-fun e!609887 () Bool)

(assert (=> b!1069052 (= e!609888 e!609887)))

(declare-fun res!713019 () Bool)

(assert (=> b!1069052 (=> res!713019 e!609887)))

(declare-datatypes ((tuple2!16264 0))(
  ( (tuple2!16265 (_1!8143 (_ BitVec 64)) (_2!8143 V!39225)) )
))
(declare-datatypes ((List!22836 0))(
  ( (Nil!22833) (Cons!22832 (h!24050 tuple2!16264) (t!32153 List!22836)) )
))
(declare-datatypes ((ListLongMap!14241 0))(
  ( (ListLongMap!14242 (toList!7136 List!22836)) )
))
(declare-fun lt!472103 () ListLongMap!14241)

(declare-fun contains!6300 (ListLongMap!14241 (_ BitVec 64)) Bool)

(assert (=> b!1069052 (= res!713019 (contains!6300 lt!472103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39225)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39225)

(declare-fun getCurrentListMap!4063 (array!68163 array!68161 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14241)

(assert (=> b!1069052 (= lt!472103 (getCurrentListMap!4063 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069053 () Bool)

(assert (=> b!1069053 (= e!609887 true)))

(declare-fun -!627 (ListLongMap!14241 (_ BitVec 64)) ListLongMap!14241)

(assert (=> b!1069053 (= (-!627 lt!472103 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472103)))

(declare-datatypes ((Unit!35068 0))(
  ( (Unit!35069) )
))
(declare-fun lt!472105 () Unit!35068)

(declare-fun removeNotPresentStillSame!44 (ListLongMap!14241 (_ BitVec 64)) Unit!35068)

(assert (=> b!1069053 (= lt!472105 (removeNotPresentStillSame!44 lt!472103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069054 () Bool)

(declare-fun res!713022 () Bool)

(assert (=> b!1069054 (=> (not res!713022) (not e!609889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68163 (_ BitVec 32)) Bool)

(assert (=> b!1069054 (= res!713022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069055 () Bool)

(assert (=> b!1069055 (= e!609889 (not e!609888))))

(declare-fun res!713018 () Bool)

(assert (=> b!1069055 (=> res!713018 e!609888)))

(assert (=> b!1069055 (= res!713018 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472106 () ListLongMap!14241)

(declare-fun lt!472104 () ListLongMap!14241)

(assert (=> b!1069055 (= lt!472106 lt!472104)))

(declare-fun lt!472107 () Unit!35068)

(declare-fun zeroValueAfter!47 () V!39225)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!756 (array!68163 array!68161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 V!39225 V!39225 (_ BitVec 32) Int) Unit!35068)

(assert (=> b!1069055 (= lt!472107 (lemmaNoChangeToArrayThenSameMapNoExtras!756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3753 (array!68163 array!68161 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14241)

(assert (=> b!1069055 (= lt!472104 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069055 (= lt!472106 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40045 () Bool)

(declare-fun tp!76717 () Bool)

(assert (=> mapNonEmpty!40045 (= mapRes!40045 (and tp!76717 e!609892))))

(declare-fun mapValue!40045 () ValueCell!12080)

(declare-fun mapRest!40045 () (Array (_ BitVec 32) ValueCell!12080))

(declare-fun mapKey!40045 () (_ BitVec 32))

(assert (=> mapNonEmpty!40045 (= (arr!32774 _values!955) (store mapRest!40045 mapKey!40045 mapValue!40045))))

(assert (= (and start!94666 res!713021) b!1069048))

(assert (= (and b!1069048 res!713020) b!1069054))

(assert (= (and b!1069054 res!713022) b!1069050))

(assert (= (and b!1069050 res!713017) b!1069055))

(assert (= (and b!1069055 (not res!713018)) b!1069052))

(assert (= (and b!1069052 (not res!713019)) b!1069053))

(assert (= (and b!1069049 condMapEmpty!40045) mapIsEmpty!40045))

(assert (= (and b!1069049 (not condMapEmpty!40045)) mapNonEmpty!40045))

(get-info :version)

(assert (= (and mapNonEmpty!40045 ((_ is ValueCellFull!12080) mapValue!40045)) b!1069051))

(assert (= (and b!1069049 ((_ is ValueCellFull!12080) mapDefault!40045)) b!1069047))

(assert (= start!94666 b!1069049))

(declare-fun m!988015 () Bool)

(assert (=> b!1069054 m!988015))

(declare-fun m!988017 () Bool)

(assert (=> start!94666 m!988017))

(declare-fun m!988019 () Bool)

(assert (=> start!94666 m!988019))

(declare-fun m!988021 () Bool)

(assert (=> start!94666 m!988021))

(declare-fun m!988023 () Bool)

(assert (=> b!1069055 m!988023))

(declare-fun m!988025 () Bool)

(assert (=> b!1069055 m!988025))

(declare-fun m!988027 () Bool)

(assert (=> b!1069055 m!988027))

(declare-fun m!988029 () Bool)

(assert (=> b!1069053 m!988029))

(declare-fun m!988031 () Bool)

(assert (=> b!1069053 m!988031))

(declare-fun m!988033 () Bool)

(assert (=> b!1069052 m!988033))

(declare-fun m!988035 () Bool)

(assert (=> b!1069052 m!988035))

(declare-fun m!988037 () Bool)

(assert (=> b!1069050 m!988037))

(declare-fun m!988039 () Bool)

(assert (=> mapNonEmpty!40045 m!988039))

(check-sat (not b_next!21757) (not mapNonEmpty!40045) (not b!1069052) (not start!94666) (not b!1069055) (not b!1069050) tp_is_empty!25567 (not b!1069053) (not b!1069054) b_and!34559)
(check-sat b_and!34559 (not b_next!21757))
