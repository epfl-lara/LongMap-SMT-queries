; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93902 () Bool)

(assert start!93902)

(declare-fun b_free!21367 () Bool)

(declare-fun b_next!21367 () Bool)

(assert (=> start!93902 (= b_free!21367 (not b_next!21367))))

(declare-fun tp!75526 () Bool)

(declare-fun b_and!34063 () Bool)

(assert (=> start!93902 (= tp!75526 b_and!34063)))

(declare-fun b!1061878 () Bool)

(declare-fun e!604783 () Bool)

(declare-fun e!604782 () Bool)

(assert (=> b!1061878 (= e!604783 (not e!604782))))

(declare-fun res!709088 () Bool)

(assert (=> b!1061878 (=> res!709088 e!604782)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061878 (= res!709088 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38705 0))(
  ( (V!38706 (val!12639 Int)) )
))
(declare-datatypes ((tuple2!16052 0))(
  ( (tuple2!16053 (_1!8037 (_ BitVec 64)) (_2!8037 V!38705)) )
))
(declare-datatypes ((List!22606 0))(
  ( (Nil!22603) (Cons!22602 (h!23811 tuple2!16052) (t!31908 List!22606)) )
))
(declare-datatypes ((ListLongMap!14021 0))(
  ( (ListLongMap!14022 (toList!7026 List!22606)) )
))
(declare-fun lt!467672 () ListLongMap!14021)

(declare-fun lt!467673 () ListLongMap!14021)

(assert (=> b!1061878 (= lt!467672 lt!467673)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38705)

(declare-datatypes ((Unit!34647 0))(
  ( (Unit!34648) )
))
(declare-fun lt!467674 () Unit!34647)

(declare-datatypes ((ValueCell!11885 0))(
  ( (ValueCellFull!11885 (v!15248 V!38705)) (EmptyCell!11885) )
))
(declare-datatypes ((array!67306 0))(
  ( (array!67307 (arr!32360 (Array (_ BitVec 32) ValueCell!11885)) (size!32898 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67306)

(declare-fun minValue!907 () V!38705)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38705)

(declare-datatypes ((array!67308 0))(
  ( (array!67309 (arr!32361 (Array (_ BitVec 32) (_ BitVec 64))) (size!32899 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67308)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!635 (array!67308 array!67306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 V!38705 V!38705 (_ BitVec 32) Int) Unit!34647)

(assert (=> b!1061878 (= lt!467674 (lemmaNoChangeToArrayThenSameMapNoExtras!635 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3641 (array!67308 array!67306 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!14021)

(assert (=> b!1061878 (= lt!467673 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061878 (= lt!467672 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061879 () Bool)

(declare-fun e!604780 () Bool)

(assert (=> b!1061879 (= e!604782 e!604780)))

(declare-fun res!709090 () Bool)

(assert (=> b!1061879 (=> res!709090 e!604780)))

(declare-fun lt!467676 () ListLongMap!14021)

(declare-fun contains!6196 (ListLongMap!14021 (_ BitVec 64)) Bool)

(assert (=> b!1061879 (= res!709090 (contains!6196 lt!467676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3928 (array!67308 array!67306 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!14021)

(assert (=> b!1061879 (= lt!467676 (getCurrentListMap!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061880 () Bool)

(assert (=> b!1061880 (= e!604780 true)))

(declare-fun -!550 (ListLongMap!14021 (_ BitVec 64)) ListLongMap!14021)

(assert (=> b!1061880 (= (-!550 lt!467676 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467676)))

(declare-fun lt!467675 () Unit!34647)

(declare-fun removeNotPresentStillSame!2 (ListLongMap!14021 (_ BitVec 64)) Unit!34647)

(assert (=> b!1061880 (= lt!467675 (removeNotPresentStillSame!2 lt!467676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39439 () Bool)

(declare-fun mapRes!39439 () Bool)

(assert (=> mapIsEmpty!39439 mapRes!39439))

(declare-fun b!1061881 () Bool)

(declare-fun e!604778 () Bool)

(declare-fun e!604777 () Bool)

(assert (=> b!1061881 (= e!604778 (and e!604777 mapRes!39439))))

(declare-fun condMapEmpty!39439 () Bool)

(declare-fun mapDefault!39439 () ValueCell!11885)

(assert (=> b!1061881 (= condMapEmpty!39439 (= (arr!32360 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11885)) mapDefault!39439)))))

(declare-fun b!1061882 () Bool)

(declare-fun tp_is_empty!25177 () Bool)

(assert (=> b!1061882 (= e!604777 tp_is_empty!25177)))

(declare-fun mapNonEmpty!39439 () Bool)

(declare-fun tp!75527 () Bool)

(declare-fun e!604781 () Bool)

(assert (=> mapNonEmpty!39439 (= mapRes!39439 (and tp!75527 e!604781))))

(declare-fun mapValue!39439 () ValueCell!11885)

(declare-fun mapRest!39439 () (Array (_ BitVec 32) ValueCell!11885))

(declare-fun mapKey!39439 () (_ BitVec 32))

(assert (=> mapNonEmpty!39439 (= (arr!32360 _values!955) (store mapRest!39439 mapKey!39439 mapValue!39439))))

(declare-fun res!709091 () Bool)

(assert (=> start!93902 (=> (not res!709091) (not e!604783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93902 (= res!709091 (validMask!0 mask!1515))))

(assert (=> start!93902 e!604783))

(assert (=> start!93902 true))

(assert (=> start!93902 tp_is_empty!25177))

(declare-fun array_inv!25072 (array!67306) Bool)

(assert (=> start!93902 (and (array_inv!25072 _values!955) e!604778)))

(assert (=> start!93902 tp!75526))

(declare-fun array_inv!25073 (array!67308) Bool)

(assert (=> start!93902 (array_inv!25073 _keys!1163)))

(declare-fun b!1061883 () Bool)

(declare-fun res!709087 () Bool)

(assert (=> b!1061883 (=> (not res!709087) (not e!604783))))

(assert (=> b!1061883 (= res!709087 (and (= (size!32898 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32899 _keys!1163) (size!32898 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061884 () Bool)

(declare-fun res!709086 () Bool)

(assert (=> b!1061884 (=> (not res!709086) (not e!604783))))

(declare-datatypes ((List!22607 0))(
  ( (Nil!22604) (Cons!22603 (h!23812 (_ BitVec 64)) (t!31909 List!22607)) )
))
(declare-fun arrayNoDuplicates!0 (array!67308 (_ BitVec 32) List!22607) Bool)

(assert (=> b!1061884 (= res!709086 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22604))))

(declare-fun b!1061885 () Bool)

(declare-fun res!709089 () Bool)

(assert (=> b!1061885 (=> (not res!709089) (not e!604783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67308 (_ BitVec 32)) Bool)

(assert (=> b!1061885 (= res!709089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061886 () Bool)

(assert (=> b!1061886 (= e!604781 tp_is_empty!25177)))

(assert (= (and start!93902 res!709091) b!1061883))

(assert (= (and b!1061883 res!709087) b!1061885))

(assert (= (and b!1061885 res!709089) b!1061884))

(assert (= (and b!1061884 res!709086) b!1061878))

(assert (= (and b!1061878 (not res!709088)) b!1061879))

(assert (= (and b!1061879 (not res!709090)) b!1061880))

(assert (= (and b!1061881 condMapEmpty!39439) mapIsEmpty!39439))

(assert (= (and b!1061881 (not condMapEmpty!39439)) mapNonEmpty!39439))

(get-info :version)

(assert (= (and mapNonEmpty!39439 ((_ is ValueCellFull!11885) mapValue!39439)) b!1061886))

(assert (= (and b!1061881 ((_ is ValueCellFull!11885) mapDefault!39439)) b!1061882))

(assert (= start!93902 b!1061881))

(declare-fun m!980173 () Bool)

(assert (=> b!1061878 m!980173))

(declare-fun m!980175 () Bool)

(assert (=> b!1061878 m!980175))

(declare-fun m!980177 () Bool)

(assert (=> b!1061878 m!980177))

(declare-fun m!980179 () Bool)

(assert (=> b!1061885 m!980179))

(declare-fun m!980181 () Bool)

(assert (=> b!1061880 m!980181))

(declare-fun m!980183 () Bool)

(assert (=> b!1061880 m!980183))

(declare-fun m!980185 () Bool)

(assert (=> b!1061884 m!980185))

(declare-fun m!980187 () Bool)

(assert (=> b!1061879 m!980187))

(declare-fun m!980189 () Bool)

(assert (=> b!1061879 m!980189))

(declare-fun m!980191 () Bool)

(assert (=> start!93902 m!980191))

(declare-fun m!980193 () Bool)

(assert (=> start!93902 m!980193))

(declare-fun m!980195 () Bool)

(assert (=> start!93902 m!980195))

(declare-fun m!980197 () Bool)

(assert (=> mapNonEmpty!39439 m!980197))

(check-sat (not b_next!21367) (not b!1061880) (not b!1061879) (not mapNonEmpty!39439) (not b!1061884) (not start!93902) b_and!34063 (not b!1061878) (not b!1061885) tp_is_empty!25177)
(check-sat b_and!34063 (not b_next!21367))
