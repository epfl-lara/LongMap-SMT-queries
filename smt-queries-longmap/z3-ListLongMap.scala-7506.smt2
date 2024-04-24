; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95392 () Bool)

(assert start!95392)

(declare-fun b_free!22213 () Bool)

(declare-fun b_next!22213 () Bool)

(assert (=> start!95392 (= b_free!22213 (not b_next!22213))))

(declare-fun tp!78127 () Bool)

(declare-fun b_and!35165 () Bool)

(assert (=> start!95392 (= tp!78127 b_and!35165)))

(declare-fun b!1076926 () Bool)

(declare-fun res!717533 () Bool)

(declare-fun e!615589 () Bool)

(assert (=> b!1076926 (=> (not res!717533) (not e!615589))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39833 0))(
  ( (V!39834 (val!13062 Int)) )
))
(declare-datatypes ((ValueCell!12308 0))(
  ( (ValueCellFull!12308 (v!15683 V!39833)) (EmptyCell!12308) )
))
(declare-datatypes ((array!69059 0))(
  ( (array!69060 (arr!33209 (Array (_ BitVec 32) ValueCell!12308)) (size!33746 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69059)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69061 0))(
  ( (array!69062 (arr!33210 (Array (_ BitVec 32) (_ BitVec 64))) (size!33747 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69061)

(assert (=> b!1076926 (= res!717533 (and (= (size!33746 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33747 _keys!1163) (size!33746 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!717530 () Bool)

(assert (=> start!95392 (=> (not res!717530) (not e!615589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95392 (= res!717530 (validMask!0 mask!1515))))

(assert (=> start!95392 e!615589))

(assert (=> start!95392 true))

(declare-fun tp_is_empty!26023 () Bool)

(assert (=> start!95392 tp_is_empty!26023))

(declare-fun e!615593 () Bool)

(declare-fun array_inv!25700 (array!69059) Bool)

(assert (=> start!95392 (and (array_inv!25700 _values!955) e!615593)))

(assert (=> start!95392 tp!78127))

(declare-fun array_inv!25701 (array!69061) Bool)

(assert (=> start!95392 (array_inv!25701 _keys!1163)))

(declare-fun b!1076927 () Bool)

(declare-fun e!615594 () Bool)

(assert (=> b!1076927 (= e!615594 tp_is_empty!26023)))

(declare-fun zeroValueBefore!47 () V!39833)

(declare-fun b!1076928 () Bool)

(declare-datatypes ((tuple2!16632 0))(
  ( (tuple2!16633 (_1!8327 (_ BitVec 64)) (_2!8327 V!39833)) )
))
(declare-datatypes ((List!23182 0))(
  ( (Nil!23179) (Cons!23178 (h!24396 tuple2!16632) (t!32527 List!23182)) )
))
(declare-datatypes ((ListLongMap!14609 0))(
  ( (ListLongMap!14610 (toList!7320 List!23182)) )
))
(declare-fun lt!478020 () ListLongMap!14609)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39833)

(declare-fun e!615591 () Bool)

(declare-fun getCurrentListMap!4177 (array!69061 array!69059 (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 (_ BitVec 32) Int) ListLongMap!14609)

(declare-fun +!3247 (ListLongMap!14609 tuple2!16632) ListLongMap!14609)

(assert (=> b!1076928 (= e!615591 (= (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3247 (+!3247 lt!478020 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun zeroValueAfter!47 () V!39833)

(declare-fun lt!478019 () ListLongMap!14609)

(assert (=> b!1076928 (= lt!478019 (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076929 () Bool)

(declare-fun res!717534 () Bool)

(assert (=> b!1076929 (=> (not res!717534) (not e!615589))))

(declare-datatypes ((List!23183 0))(
  ( (Nil!23180) (Cons!23179 (h!24397 (_ BitVec 64)) (t!32528 List!23183)) )
))
(declare-fun arrayNoDuplicates!0 (array!69061 (_ BitVec 32) List!23183) Bool)

(assert (=> b!1076929 (= res!717534 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23180))))

(declare-fun b!1076930 () Bool)

(declare-fun e!615590 () Bool)

(assert (=> b!1076930 (= e!615590 tp_is_empty!26023)))

(declare-fun b!1076931 () Bool)

(declare-fun res!717531 () Bool)

(assert (=> b!1076931 (=> (not res!717531) (not e!615589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69061 (_ BitVec 32)) Bool)

(assert (=> b!1076931 (= res!717531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40771 () Bool)

(declare-fun mapRes!40771 () Bool)

(declare-fun tp!78128 () Bool)

(assert (=> mapNonEmpty!40771 (= mapRes!40771 (and tp!78128 e!615594))))

(declare-fun mapKey!40771 () (_ BitVec 32))

(declare-fun mapRest!40771 () (Array (_ BitVec 32) ValueCell!12308))

(declare-fun mapValue!40771 () ValueCell!12308)

(assert (=> mapNonEmpty!40771 (= (arr!33209 _values!955) (store mapRest!40771 mapKey!40771 mapValue!40771))))

(declare-fun mapIsEmpty!40771 () Bool)

(assert (=> mapIsEmpty!40771 mapRes!40771))

(declare-fun b!1076932 () Bool)

(assert (=> b!1076932 (= e!615589 (not e!615591))))

(declare-fun res!717532 () Bool)

(assert (=> b!1076932 (=> res!717532 e!615591)))

(assert (=> b!1076932 (= res!717532 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478018 () ListLongMap!14609)

(assert (=> b!1076932 (= lt!478020 lt!478018)))

(declare-datatypes ((Unit!35386 0))(
  ( (Unit!35387) )
))
(declare-fun lt!478021 () Unit!35386)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!892 (array!69061 array!69059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 V!39833 V!39833 (_ BitVec 32) Int) Unit!35386)

(assert (=> b!1076932 (= lt!478021 (lemmaNoChangeToArrayThenSameMapNoExtras!892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3912 (array!69061 array!69059 (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 (_ BitVec 32) Int) ListLongMap!14609)

(assert (=> b!1076932 (= lt!478018 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076932 (= lt!478020 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076933 () Bool)

(assert (=> b!1076933 (= e!615593 (and e!615590 mapRes!40771))))

(declare-fun condMapEmpty!40771 () Bool)

(declare-fun mapDefault!40771 () ValueCell!12308)

(assert (=> b!1076933 (= condMapEmpty!40771 (= (arr!33209 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12308)) mapDefault!40771)))))

(assert (= (and start!95392 res!717530) b!1076926))

(assert (= (and b!1076926 res!717533) b!1076931))

(assert (= (and b!1076931 res!717531) b!1076929))

(assert (= (and b!1076929 res!717534) b!1076932))

(assert (= (and b!1076932 (not res!717532)) b!1076928))

(assert (= (and b!1076933 condMapEmpty!40771) mapIsEmpty!40771))

(assert (= (and b!1076933 (not condMapEmpty!40771)) mapNonEmpty!40771))

(get-info :version)

(assert (= (and mapNonEmpty!40771 ((_ is ValueCellFull!12308) mapValue!40771)) b!1076927))

(assert (= (and b!1076933 ((_ is ValueCellFull!12308) mapDefault!40771)) b!1076930))

(assert (= start!95392 b!1076933))

(declare-fun m!996099 () Bool)

(assert (=> start!95392 m!996099))

(declare-fun m!996101 () Bool)

(assert (=> start!95392 m!996101))

(declare-fun m!996103 () Bool)

(assert (=> start!95392 m!996103))

(declare-fun m!996105 () Bool)

(assert (=> b!1076928 m!996105))

(declare-fun m!996107 () Bool)

(assert (=> b!1076928 m!996107))

(assert (=> b!1076928 m!996107))

(declare-fun m!996109 () Bool)

(assert (=> b!1076928 m!996109))

(declare-fun m!996111 () Bool)

(assert (=> b!1076928 m!996111))

(declare-fun m!996113 () Bool)

(assert (=> b!1076932 m!996113))

(declare-fun m!996115 () Bool)

(assert (=> b!1076932 m!996115))

(declare-fun m!996117 () Bool)

(assert (=> b!1076932 m!996117))

(declare-fun m!996119 () Bool)

(assert (=> b!1076929 m!996119))

(declare-fun m!996121 () Bool)

(assert (=> b!1076931 m!996121))

(declare-fun m!996123 () Bool)

(assert (=> mapNonEmpty!40771 m!996123))

(check-sat (not mapNonEmpty!40771) (not b!1076929) b_and!35165 (not b!1076931) (not start!95392) (not b!1076928) tp_is_empty!26023 (not b_next!22213) (not b!1076932))
(check-sat b_and!35165 (not b_next!22213))
(get-model)

(declare-fun b!1077024 () Bool)

(declare-fun e!615664 () Bool)

(declare-fun call!45627 () Bool)

(assert (=> b!1077024 (= e!615664 (not call!45627))))

(declare-fun bm!45618 () Bool)

(declare-fun call!45623 () ListLongMap!14609)

(declare-fun call!45625 () ListLongMap!14609)

(assert (=> bm!45618 (= call!45623 call!45625)))

(declare-fun d!130081 () Bool)

(declare-fun e!615666 () Bool)

(assert (=> d!130081 e!615666))

(declare-fun res!717587 () Bool)

(assert (=> d!130081 (=> (not res!717587) (not e!615666))))

(assert (=> d!130081 (= res!717587 (or (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))))

(declare-fun lt!478102 () ListLongMap!14609)

(declare-fun lt!478110 () ListLongMap!14609)

(assert (=> d!130081 (= lt!478102 lt!478110)))

(declare-fun lt!478099 () Unit!35386)

(declare-fun e!615659 () Unit!35386)

(assert (=> d!130081 (= lt!478099 e!615659)))

(declare-fun c!108512 () Bool)

(declare-fun e!615660 () Bool)

(assert (=> d!130081 (= c!108512 e!615660)))

(declare-fun res!717591 () Bool)

(assert (=> d!130081 (=> (not res!717591) (not e!615660))))

(assert (=> d!130081 (= res!717591 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun e!615667 () ListLongMap!14609)

(assert (=> d!130081 (= lt!478110 e!615667)))

(declare-fun c!108513 () Bool)

(assert (=> d!130081 (= c!108513 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130081 (validMask!0 mask!1515)))

(assert (=> d!130081 (= (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478102)))

(declare-fun b!1077025 () Bool)

(declare-fun c!108515 () Bool)

(assert (=> b!1077025 (= c!108515 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615661 () ListLongMap!14609)

(declare-fun e!615665 () ListLongMap!14609)

(assert (=> b!1077025 (= e!615661 e!615665)))

(declare-fun b!1077026 () Bool)

(declare-fun e!615662 () Bool)

(declare-fun call!45624 () Bool)

(assert (=> b!1077026 (= e!615662 (not call!45624))))

(declare-fun bm!45619 () Bool)

(declare-fun call!45621 () ListLongMap!14609)

(declare-fun call!45622 () ListLongMap!14609)

(assert (=> bm!45619 (= call!45621 call!45622)))

(declare-fun b!1077027 () Bool)

(assert (=> b!1077027 (= e!615666 e!615662)))

(declare-fun c!108516 () Bool)

(assert (=> b!1077027 (= c!108516 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077028 () Bool)

(assert (=> b!1077028 (= e!615665 call!45623)))

(declare-fun b!1077029 () Bool)

(assert (=> b!1077029 (= e!615667 e!615661)))

(declare-fun c!108511 () Bool)

(assert (=> b!1077029 (= c!108511 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077030 () Bool)

(declare-fun lt!478093 () Unit!35386)

(assert (=> b!1077030 (= e!615659 lt!478093)))

(declare-fun lt!478107 () ListLongMap!14609)

(assert (=> b!1077030 (= lt!478107 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478097 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478095 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478095 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478104 () Unit!35386)

(declare-fun addStillContains!653 (ListLongMap!14609 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35386)

(assert (=> b!1077030 (= lt!478104 (addStillContains!653 lt!478107 lt!478097 zeroValueBefore!47 lt!478095))))

(declare-fun contains!6375 (ListLongMap!14609 (_ BitVec 64)) Bool)

(assert (=> b!1077030 (contains!6375 (+!3247 lt!478107 (tuple2!16633 lt!478097 zeroValueBefore!47)) lt!478095)))

(declare-fun lt!478094 () Unit!35386)

(assert (=> b!1077030 (= lt!478094 lt!478104)))

(declare-fun lt!478092 () ListLongMap!14609)

(assert (=> b!1077030 (= lt!478092 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478090 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478090 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478100 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478100 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478106 () Unit!35386)

(declare-fun addApplyDifferent!509 (ListLongMap!14609 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35386)

(assert (=> b!1077030 (= lt!478106 (addApplyDifferent!509 lt!478092 lt!478090 minValue!907 lt!478100))))

(declare-fun apply!949 (ListLongMap!14609 (_ BitVec 64)) V!39833)

(assert (=> b!1077030 (= (apply!949 (+!3247 lt!478092 (tuple2!16633 lt!478090 minValue!907)) lt!478100) (apply!949 lt!478092 lt!478100))))

(declare-fun lt!478111 () Unit!35386)

(assert (=> b!1077030 (= lt!478111 lt!478106)))

(declare-fun lt!478098 () ListLongMap!14609)

(assert (=> b!1077030 (= lt!478098 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478109 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478105 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478105 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478096 () Unit!35386)

(assert (=> b!1077030 (= lt!478096 (addApplyDifferent!509 lt!478098 lt!478109 zeroValueBefore!47 lt!478105))))

(assert (=> b!1077030 (= (apply!949 (+!3247 lt!478098 (tuple2!16633 lt!478109 zeroValueBefore!47)) lt!478105) (apply!949 lt!478098 lt!478105))))

(declare-fun lt!478091 () Unit!35386)

(assert (=> b!1077030 (= lt!478091 lt!478096)))

(declare-fun lt!478103 () ListLongMap!14609)

(assert (=> b!1077030 (= lt!478103 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478101 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478101 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478108 () (_ BitVec 64))

(assert (=> b!1077030 (= lt!478108 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077030 (= lt!478093 (addApplyDifferent!509 lt!478103 lt!478101 minValue!907 lt!478108))))

(assert (=> b!1077030 (= (apply!949 (+!3247 lt!478103 (tuple2!16633 lt!478101 minValue!907)) lt!478108) (apply!949 lt!478103 lt!478108))))

(declare-fun b!1077031 () Bool)

(declare-fun e!615663 () Bool)

(declare-fun e!615668 () Bool)

(assert (=> b!1077031 (= e!615663 e!615668)))

(declare-fun res!717586 () Bool)

(assert (=> b!1077031 (=> (not res!717586) (not e!615668))))

(assert (=> b!1077031 (= res!717586 (contains!6375 lt!478102 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun bm!45620 () Bool)

(declare-fun call!45626 () ListLongMap!14609)

(assert (=> bm!45620 (= call!45625 (+!3247 (ite c!108513 call!45622 (ite c!108511 call!45621 call!45626)) (ite (or c!108513 c!108511) (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077032 (= e!615660 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077033 () Bool)

(declare-fun res!717590 () Bool)

(assert (=> b!1077033 (=> (not res!717590) (not e!615666))))

(assert (=> b!1077033 (= res!717590 e!615663)))

(declare-fun res!717585 () Bool)

(assert (=> b!1077033 (=> res!717585 e!615663)))

(declare-fun e!615669 () Bool)

(assert (=> b!1077033 (= res!717585 (not e!615669))))

(declare-fun res!717589 () Bool)

(assert (=> b!1077033 (=> (not res!717589) (not e!615669))))

(assert (=> b!1077033 (= res!717589 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun b!1077034 () Bool)

(assert (=> b!1077034 (= e!615667 (+!3247 call!45625 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45621 () Bool)

(assert (=> bm!45621 (= call!45626 call!45621)))

(declare-fun bm!45622 () Bool)

(assert (=> bm!45622 (= call!45624 (contains!6375 lt!478102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077035 () Bool)

(assert (=> b!1077035 (= e!615665 call!45626)))

(declare-fun bm!45623 () Bool)

(assert (=> bm!45623 (= call!45622 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077036 () Bool)

(declare-fun e!615658 () Bool)

(assert (=> b!1077036 (= e!615658 (= (apply!949 lt!478102 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1077037 () Bool)

(assert (=> b!1077037 (= e!615661 call!45623)))

(declare-fun b!1077038 () Bool)

(assert (=> b!1077038 (= e!615664 e!615658)))

(declare-fun res!717584 () Bool)

(assert (=> b!1077038 (= res!717584 call!45627)))

(assert (=> b!1077038 (=> (not res!717584) (not e!615658))))

(declare-fun b!1077039 () Bool)

(declare-fun e!615657 () Bool)

(assert (=> b!1077039 (= e!615657 (= (apply!949 lt!478102 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077040 () Bool)

(declare-fun get!17269 (ValueCell!12308 V!39833) V!39833)

(declare-fun dynLambda!2064 (Int (_ BitVec 64)) V!39833)

(assert (=> b!1077040 (= e!615668 (= (apply!949 lt!478102 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33746 _values!955)))))

(assert (=> b!1077040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun bm!45624 () Bool)

(assert (=> bm!45624 (= call!45627 (contains!6375 lt!478102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077041 () Bool)

(assert (=> b!1077041 (= e!615662 e!615657)))

(declare-fun res!717588 () Bool)

(assert (=> b!1077041 (= res!717588 call!45624)))

(assert (=> b!1077041 (=> (not res!717588) (not e!615657))))

(declare-fun b!1077042 () Bool)

(assert (=> b!1077042 (= e!615669 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077043 () Bool)

(declare-fun Unit!35392 () Unit!35386)

(assert (=> b!1077043 (= e!615659 Unit!35392)))

(declare-fun b!1077044 () Bool)

(declare-fun res!717583 () Bool)

(assert (=> b!1077044 (=> (not res!717583) (not e!615666))))

(assert (=> b!1077044 (= res!717583 e!615664)))

(declare-fun c!108514 () Bool)

(assert (=> b!1077044 (= c!108514 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130081 c!108513) b!1077034))

(assert (= (and d!130081 (not c!108513)) b!1077029))

(assert (= (and b!1077029 c!108511) b!1077037))

(assert (= (and b!1077029 (not c!108511)) b!1077025))

(assert (= (and b!1077025 c!108515) b!1077028))

(assert (= (and b!1077025 (not c!108515)) b!1077035))

(assert (= (or b!1077028 b!1077035) bm!45621))

(assert (= (or b!1077037 bm!45621) bm!45619))

(assert (= (or b!1077037 b!1077028) bm!45618))

(assert (= (or b!1077034 bm!45619) bm!45623))

(assert (= (or b!1077034 bm!45618) bm!45620))

(assert (= (and d!130081 res!717591) b!1077032))

(assert (= (and d!130081 c!108512) b!1077030))

(assert (= (and d!130081 (not c!108512)) b!1077043))

(assert (= (and d!130081 res!717587) b!1077033))

(assert (= (and b!1077033 res!717589) b!1077042))

(assert (= (and b!1077033 (not res!717585)) b!1077031))

(assert (= (and b!1077031 res!717586) b!1077040))

(assert (= (and b!1077033 res!717590) b!1077044))

(assert (= (and b!1077044 c!108514) b!1077038))

(assert (= (and b!1077044 (not c!108514)) b!1077024))

(assert (= (and b!1077038 res!717584) b!1077036))

(assert (= (or b!1077038 b!1077024) bm!45624))

(assert (= (and b!1077044 res!717583) b!1077027))

(assert (= (and b!1077027 c!108516) b!1077041))

(assert (= (and b!1077027 (not c!108516)) b!1077026))

(assert (= (and b!1077041 res!717588) b!1077039))

(assert (= (or b!1077041 b!1077026) bm!45622))

(declare-fun b_lambda!16911 () Bool)

(assert (=> (not b_lambda!16911) (not b!1077040)))

(declare-fun t!32533 () Bool)

(declare-fun tb!7167 () Bool)

(assert (=> (and start!95392 (= defaultEntry!963 defaultEntry!963) t!32533) tb!7167))

(declare-fun result!14825 () Bool)

(assert (=> tb!7167 (= result!14825 tp_is_empty!26023)))

(assert (=> b!1077040 t!32533))

(declare-fun b_and!35171 () Bool)

(assert (= b_and!35165 (and (=> t!32533 result!14825) b_and!35171)))

(assert (=> bm!45623 m!996117))

(declare-fun m!996177 () Bool)

(assert (=> b!1077039 m!996177))

(declare-fun m!996179 () Bool)

(assert (=> bm!45624 m!996179))

(declare-fun m!996181 () Bool)

(assert (=> b!1077040 m!996181))

(declare-fun m!996183 () Bool)

(assert (=> b!1077040 m!996183))

(declare-fun m!996185 () Bool)

(assert (=> b!1077040 m!996185))

(declare-fun m!996187 () Bool)

(assert (=> b!1077040 m!996187))

(assert (=> b!1077040 m!996187))

(declare-fun m!996189 () Bool)

(assert (=> b!1077040 m!996189))

(assert (=> b!1077040 m!996181))

(assert (=> b!1077040 m!996183))

(declare-fun m!996191 () Bool)

(assert (=> bm!45620 m!996191))

(declare-fun m!996193 () Bool)

(assert (=> b!1077030 m!996193))

(declare-fun m!996195 () Bool)

(assert (=> b!1077030 m!996195))

(declare-fun m!996197 () Bool)

(assert (=> b!1077030 m!996197))

(declare-fun m!996199 () Bool)

(assert (=> b!1077030 m!996199))

(declare-fun m!996201 () Bool)

(assert (=> b!1077030 m!996201))

(assert (=> b!1077030 m!996193))

(declare-fun m!996203 () Bool)

(assert (=> b!1077030 m!996203))

(declare-fun m!996205 () Bool)

(assert (=> b!1077030 m!996205))

(declare-fun m!996207 () Bool)

(assert (=> b!1077030 m!996207))

(declare-fun m!996209 () Bool)

(assert (=> b!1077030 m!996209))

(assert (=> b!1077030 m!996199))

(declare-fun m!996211 () Bool)

(assert (=> b!1077030 m!996211))

(declare-fun m!996213 () Bool)

(assert (=> b!1077030 m!996213))

(declare-fun m!996215 () Bool)

(assert (=> b!1077030 m!996215))

(assert (=> b!1077030 m!996187))

(assert (=> b!1077030 m!996117))

(assert (=> b!1077030 m!996201))

(declare-fun m!996217 () Bool)

(assert (=> b!1077030 m!996217))

(declare-fun m!996219 () Bool)

(assert (=> b!1077030 m!996219))

(assert (=> b!1077030 m!996213))

(declare-fun m!996221 () Bool)

(assert (=> b!1077030 m!996221))

(declare-fun m!996223 () Bool)

(assert (=> b!1077034 m!996223))

(declare-fun m!996225 () Bool)

(assert (=> b!1077036 m!996225))

(assert (=> d!130081 m!996099))

(assert (=> b!1077031 m!996187))

(assert (=> b!1077031 m!996187))

(declare-fun m!996227 () Bool)

(assert (=> b!1077031 m!996227))

(assert (=> b!1077032 m!996187))

(assert (=> b!1077032 m!996187))

(declare-fun m!996229 () Bool)

(assert (=> b!1077032 m!996229))

(assert (=> b!1077042 m!996187))

(assert (=> b!1077042 m!996187))

(assert (=> b!1077042 m!996229))

(declare-fun m!996231 () Bool)

(assert (=> bm!45622 m!996231))

(assert (=> b!1076928 d!130081))

(declare-fun d!130083 () Bool)

(declare-fun e!615672 () Bool)

(assert (=> d!130083 e!615672))

(declare-fun res!717597 () Bool)

(assert (=> d!130083 (=> (not res!717597) (not e!615672))))

(declare-fun lt!478122 () ListLongMap!14609)

(assert (=> d!130083 (= res!717597 (contains!6375 lt!478122 (_1!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!478120 () List!23182)

(assert (=> d!130083 (= lt!478122 (ListLongMap!14610 lt!478120))))

(declare-fun lt!478123 () Unit!35386)

(declare-fun lt!478121 () Unit!35386)

(assert (=> d!130083 (= lt!478123 lt!478121)))

(declare-datatypes ((Option!659 0))(
  ( (Some!658 (v!15686 V!39833)) (None!657) )
))
(declare-fun getValueByKey!608 (List!23182 (_ BitVec 64)) Option!659)

(assert (=> d!130083 (= (getValueByKey!608 lt!478120 (_1!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!658 (_2!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!290 (List!23182 (_ BitVec 64) V!39833) Unit!35386)

(assert (=> d!130083 (= lt!478121 (lemmaContainsTupThenGetReturnValue!290 lt!478120 (_1!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!383 (List!23182 (_ BitVec 64) V!39833) List!23182)

(assert (=> d!130083 (= lt!478120 (insertStrictlySorted!383 (toList!7320 (+!3247 lt!478020 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!130083 (= (+!3247 (+!3247 lt!478020 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!478122)))

(declare-fun b!1077051 () Bool)

(declare-fun res!717596 () Bool)

(assert (=> b!1077051 (=> (not res!717596) (not e!615672))))

(assert (=> b!1077051 (= res!717596 (= (getValueByKey!608 (toList!7320 lt!478122) (_1!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!658 (_2!8327 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1077052 () Bool)

(declare-fun contains!6376 (List!23182 tuple2!16632) Bool)

(assert (=> b!1077052 (= e!615672 (contains!6376 (toList!7320 lt!478122) (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!130083 res!717597) b!1077051))

(assert (= (and b!1077051 res!717596) b!1077052))

(declare-fun m!996233 () Bool)

(assert (=> d!130083 m!996233))

(declare-fun m!996235 () Bool)

(assert (=> d!130083 m!996235))

(declare-fun m!996237 () Bool)

(assert (=> d!130083 m!996237))

(declare-fun m!996239 () Bool)

(assert (=> d!130083 m!996239))

(declare-fun m!996241 () Bool)

(assert (=> b!1077051 m!996241))

(declare-fun m!996243 () Bool)

(assert (=> b!1077052 m!996243))

(assert (=> b!1076928 d!130083))

(declare-fun d!130085 () Bool)

(declare-fun e!615673 () Bool)

(assert (=> d!130085 e!615673))

(declare-fun res!717599 () Bool)

(assert (=> d!130085 (=> (not res!717599) (not e!615673))))

(declare-fun lt!478126 () ListLongMap!14609)

(assert (=> d!130085 (= res!717599 (contains!6375 lt!478126 (_1!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!478124 () List!23182)

(assert (=> d!130085 (= lt!478126 (ListLongMap!14610 lt!478124))))

(declare-fun lt!478127 () Unit!35386)

(declare-fun lt!478125 () Unit!35386)

(assert (=> d!130085 (= lt!478127 lt!478125)))

(assert (=> d!130085 (= (getValueByKey!608 lt!478124 (_1!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!658 (_2!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130085 (= lt!478125 (lemmaContainsTupThenGetReturnValue!290 lt!478124 (_1!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130085 (= lt!478124 (insertStrictlySorted!383 (toList!7320 lt!478020) (_1!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130085 (= (+!3247 lt!478020 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!478126)))

(declare-fun b!1077053 () Bool)

(declare-fun res!717598 () Bool)

(assert (=> b!1077053 (=> (not res!717598) (not e!615673))))

(assert (=> b!1077053 (= res!717598 (= (getValueByKey!608 (toList!7320 lt!478126) (_1!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!658 (_2!8327 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1077054 () Bool)

(assert (=> b!1077054 (= e!615673 (contains!6376 (toList!7320 lt!478126) (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!130085 res!717599) b!1077053))

(assert (= (and b!1077053 res!717598) b!1077054))

(declare-fun m!996245 () Bool)

(assert (=> d!130085 m!996245))

(declare-fun m!996247 () Bool)

(assert (=> d!130085 m!996247))

(declare-fun m!996249 () Bool)

(assert (=> d!130085 m!996249))

(declare-fun m!996251 () Bool)

(assert (=> d!130085 m!996251))

(declare-fun m!996253 () Bool)

(assert (=> b!1077053 m!996253))

(declare-fun m!996255 () Bool)

(assert (=> b!1077054 m!996255))

(assert (=> b!1076928 d!130085))

(declare-fun b!1077055 () Bool)

(declare-fun e!615681 () Bool)

(declare-fun call!45634 () Bool)

(assert (=> b!1077055 (= e!615681 (not call!45634))))

(declare-fun bm!45625 () Bool)

(declare-fun call!45630 () ListLongMap!14609)

(declare-fun call!45632 () ListLongMap!14609)

(assert (=> bm!45625 (= call!45630 call!45632)))

(declare-fun d!130087 () Bool)

(declare-fun e!615683 () Bool)

(assert (=> d!130087 e!615683))

(declare-fun res!717604 () Bool)

(assert (=> d!130087 (=> (not res!717604) (not e!615683))))

(assert (=> d!130087 (= res!717604 (or (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))))

(declare-fun lt!478140 () ListLongMap!14609)

(declare-fun lt!478148 () ListLongMap!14609)

(assert (=> d!130087 (= lt!478140 lt!478148)))

(declare-fun lt!478137 () Unit!35386)

(declare-fun e!615676 () Unit!35386)

(assert (=> d!130087 (= lt!478137 e!615676)))

(declare-fun c!108518 () Bool)

(declare-fun e!615677 () Bool)

(assert (=> d!130087 (= c!108518 e!615677)))

(declare-fun res!717608 () Bool)

(assert (=> d!130087 (=> (not res!717608) (not e!615677))))

(assert (=> d!130087 (= res!717608 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun e!615684 () ListLongMap!14609)

(assert (=> d!130087 (= lt!478148 e!615684)))

(declare-fun c!108519 () Bool)

(assert (=> d!130087 (= c!108519 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130087 (validMask!0 mask!1515)))

(assert (=> d!130087 (= (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478140)))

(declare-fun b!1077056 () Bool)

(declare-fun c!108521 () Bool)

(assert (=> b!1077056 (= c!108521 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615678 () ListLongMap!14609)

(declare-fun e!615682 () ListLongMap!14609)

(assert (=> b!1077056 (= e!615678 e!615682)))

(declare-fun b!1077057 () Bool)

(declare-fun e!615679 () Bool)

(declare-fun call!45631 () Bool)

(assert (=> b!1077057 (= e!615679 (not call!45631))))

(declare-fun bm!45626 () Bool)

(declare-fun call!45628 () ListLongMap!14609)

(declare-fun call!45629 () ListLongMap!14609)

(assert (=> bm!45626 (= call!45628 call!45629)))

(declare-fun b!1077058 () Bool)

(assert (=> b!1077058 (= e!615683 e!615679)))

(declare-fun c!108522 () Bool)

(assert (=> b!1077058 (= c!108522 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077059 () Bool)

(assert (=> b!1077059 (= e!615682 call!45630)))

(declare-fun b!1077060 () Bool)

(assert (=> b!1077060 (= e!615684 e!615678)))

(declare-fun c!108517 () Bool)

(assert (=> b!1077060 (= c!108517 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077061 () Bool)

(declare-fun lt!478131 () Unit!35386)

(assert (=> b!1077061 (= e!615676 lt!478131)))

(declare-fun lt!478145 () ListLongMap!14609)

(assert (=> b!1077061 (= lt!478145 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478135 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478133 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478133 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478142 () Unit!35386)

(assert (=> b!1077061 (= lt!478142 (addStillContains!653 lt!478145 lt!478135 zeroValueAfter!47 lt!478133))))

(assert (=> b!1077061 (contains!6375 (+!3247 lt!478145 (tuple2!16633 lt!478135 zeroValueAfter!47)) lt!478133)))

(declare-fun lt!478132 () Unit!35386)

(assert (=> b!1077061 (= lt!478132 lt!478142)))

(declare-fun lt!478130 () ListLongMap!14609)

(assert (=> b!1077061 (= lt!478130 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478128 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478128 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478138 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478138 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478144 () Unit!35386)

(assert (=> b!1077061 (= lt!478144 (addApplyDifferent!509 lt!478130 lt!478128 minValue!907 lt!478138))))

(assert (=> b!1077061 (= (apply!949 (+!3247 lt!478130 (tuple2!16633 lt!478128 minValue!907)) lt!478138) (apply!949 lt!478130 lt!478138))))

(declare-fun lt!478149 () Unit!35386)

(assert (=> b!1077061 (= lt!478149 lt!478144)))

(declare-fun lt!478136 () ListLongMap!14609)

(assert (=> b!1077061 (= lt!478136 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478147 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478147 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478143 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478143 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478134 () Unit!35386)

(assert (=> b!1077061 (= lt!478134 (addApplyDifferent!509 lt!478136 lt!478147 zeroValueAfter!47 lt!478143))))

(assert (=> b!1077061 (= (apply!949 (+!3247 lt!478136 (tuple2!16633 lt!478147 zeroValueAfter!47)) lt!478143) (apply!949 lt!478136 lt!478143))))

(declare-fun lt!478129 () Unit!35386)

(assert (=> b!1077061 (= lt!478129 lt!478134)))

(declare-fun lt!478141 () ListLongMap!14609)

(assert (=> b!1077061 (= lt!478141 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478139 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478146 () (_ BitVec 64))

(assert (=> b!1077061 (= lt!478146 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077061 (= lt!478131 (addApplyDifferent!509 lt!478141 lt!478139 minValue!907 lt!478146))))

(assert (=> b!1077061 (= (apply!949 (+!3247 lt!478141 (tuple2!16633 lt!478139 minValue!907)) lt!478146) (apply!949 lt!478141 lt!478146))))

(declare-fun b!1077062 () Bool)

(declare-fun e!615680 () Bool)

(declare-fun e!615685 () Bool)

(assert (=> b!1077062 (= e!615680 e!615685)))

(declare-fun res!717603 () Bool)

(assert (=> b!1077062 (=> (not res!717603) (not e!615685))))

(assert (=> b!1077062 (= res!717603 (contains!6375 lt!478140 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun call!45633 () ListLongMap!14609)

(declare-fun bm!45627 () Bool)

(assert (=> bm!45627 (= call!45632 (+!3247 (ite c!108519 call!45629 (ite c!108517 call!45628 call!45633)) (ite (or c!108519 c!108517) (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077063 () Bool)

(assert (=> b!1077063 (= e!615677 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077064 () Bool)

(declare-fun res!717607 () Bool)

(assert (=> b!1077064 (=> (not res!717607) (not e!615683))))

(assert (=> b!1077064 (= res!717607 e!615680)))

(declare-fun res!717602 () Bool)

(assert (=> b!1077064 (=> res!717602 e!615680)))

(declare-fun e!615686 () Bool)

(assert (=> b!1077064 (= res!717602 (not e!615686))))

(declare-fun res!717606 () Bool)

(assert (=> b!1077064 (=> (not res!717606) (not e!615686))))

(assert (=> b!1077064 (= res!717606 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun b!1077065 () Bool)

(assert (=> b!1077065 (= e!615684 (+!3247 call!45632 (tuple2!16633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45628 () Bool)

(assert (=> bm!45628 (= call!45633 call!45628)))

(declare-fun bm!45629 () Bool)

(assert (=> bm!45629 (= call!45631 (contains!6375 lt!478140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077066 () Bool)

(assert (=> b!1077066 (= e!615682 call!45633)))

(declare-fun bm!45630 () Bool)

(assert (=> bm!45630 (= call!45629 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077067 () Bool)

(declare-fun e!615675 () Bool)

(assert (=> b!1077067 (= e!615675 (= (apply!949 lt!478140 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1077068 () Bool)

(assert (=> b!1077068 (= e!615678 call!45630)))

(declare-fun b!1077069 () Bool)

(assert (=> b!1077069 (= e!615681 e!615675)))

(declare-fun res!717601 () Bool)

(assert (=> b!1077069 (= res!717601 call!45634)))

(assert (=> b!1077069 (=> (not res!717601) (not e!615675))))

(declare-fun b!1077070 () Bool)

(declare-fun e!615674 () Bool)

(assert (=> b!1077070 (= e!615674 (= (apply!949 lt!478140 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077071 () Bool)

(assert (=> b!1077071 (= e!615685 (= (apply!949 lt!478140 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33746 _values!955)))))

(assert (=> b!1077071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun bm!45631 () Bool)

(assert (=> bm!45631 (= call!45634 (contains!6375 lt!478140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077072 () Bool)

(assert (=> b!1077072 (= e!615679 e!615674)))

(declare-fun res!717605 () Bool)

(assert (=> b!1077072 (= res!717605 call!45631)))

(assert (=> b!1077072 (=> (not res!717605) (not e!615674))))

(declare-fun b!1077073 () Bool)

(assert (=> b!1077073 (= e!615686 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077074 () Bool)

(declare-fun Unit!35393 () Unit!35386)

(assert (=> b!1077074 (= e!615676 Unit!35393)))

(declare-fun b!1077075 () Bool)

(declare-fun res!717600 () Bool)

(assert (=> b!1077075 (=> (not res!717600) (not e!615683))))

(assert (=> b!1077075 (= res!717600 e!615681)))

(declare-fun c!108520 () Bool)

(assert (=> b!1077075 (= c!108520 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130087 c!108519) b!1077065))

(assert (= (and d!130087 (not c!108519)) b!1077060))

(assert (= (and b!1077060 c!108517) b!1077068))

(assert (= (and b!1077060 (not c!108517)) b!1077056))

(assert (= (and b!1077056 c!108521) b!1077059))

(assert (= (and b!1077056 (not c!108521)) b!1077066))

(assert (= (or b!1077059 b!1077066) bm!45628))

(assert (= (or b!1077068 bm!45628) bm!45626))

(assert (= (or b!1077068 b!1077059) bm!45625))

(assert (= (or b!1077065 bm!45626) bm!45630))

(assert (= (or b!1077065 bm!45625) bm!45627))

(assert (= (and d!130087 res!717608) b!1077063))

(assert (= (and d!130087 c!108518) b!1077061))

(assert (= (and d!130087 (not c!108518)) b!1077074))

(assert (= (and d!130087 res!717604) b!1077064))

(assert (= (and b!1077064 res!717606) b!1077073))

(assert (= (and b!1077064 (not res!717602)) b!1077062))

(assert (= (and b!1077062 res!717603) b!1077071))

(assert (= (and b!1077064 res!717607) b!1077075))

(assert (= (and b!1077075 c!108520) b!1077069))

(assert (= (and b!1077075 (not c!108520)) b!1077055))

(assert (= (and b!1077069 res!717601) b!1077067))

(assert (= (or b!1077069 b!1077055) bm!45631))

(assert (= (and b!1077075 res!717600) b!1077058))

(assert (= (and b!1077058 c!108522) b!1077072))

(assert (= (and b!1077058 (not c!108522)) b!1077057))

(assert (= (and b!1077072 res!717605) b!1077070))

(assert (= (or b!1077072 b!1077057) bm!45629))

(declare-fun b_lambda!16913 () Bool)

(assert (=> (not b_lambda!16913) (not b!1077071)))

(assert (=> b!1077071 t!32533))

(declare-fun b_and!35173 () Bool)

(assert (= b_and!35171 (and (=> t!32533 result!14825) b_and!35173)))

(assert (=> bm!45630 m!996115))

(declare-fun m!996257 () Bool)

(assert (=> b!1077070 m!996257))

(declare-fun m!996259 () Bool)

(assert (=> bm!45631 m!996259))

(assert (=> b!1077071 m!996181))

(assert (=> b!1077071 m!996183))

(assert (=> b!1077071 m!996185))

(assert (=> b!1077071 m!996187))

(assert (=> b!1077071 m!996187))

(declare-fun m!996261 () Bool)

(assert (=> b!1077071 m!996261))

(assert (=> b!1077071 m!996181))

(assert (=> b!1077071 m!996183))

(declare-fun m!996263 () Bool)

(assert (=> bm!45627 m!996263))

(declare-fun m!996265 () Bool)

(assert (=> b!1077061 m!996265))

(declare-fun m!996267 () Bool)

(assert (=> b!1077061 m!996267))

(declare-fun m!996269 () Bool)

(assert (=> b!1077061 m!996269))

(declare-fun m!996271 () Bool)

(assert (=> b!1077061 m!996271))

(declare-fun m!996273 () Bool)

(assert (=> b!1077061 m!996273))

(assert (=> b!1077061 m!996265))

(declare-fun m!996275 () Bool)

(assert (=> b!1077061 m!996275))

(declare-fun m!996277 () Bool)

(assert (=> b!1077061 m!996277))

(declare-fun m!996279 () Bool)

(assert (=> b!1077061 m!996279))

(declare-fun m!996281 () Bool)

(assert (=> b!1077061 m!996281))

(assert (=> b!1077061 m!996271))

(declare-fun m!996283 () Bool)

(assert (=> b!1077061 m!996283))

(declare-fun m!996285 () Bool)

(assert (=> b!1077061 m!996285))

(declare-fun m!996287 () Bool)

(assert (=> b!1077061 m!996287))

(assert (=> b!1077061 m!996187))

(assert (=> b!1077061 m!996115))

(assert (=> b!1077061 m!996273))

(declare-fun m!996289 () Bool)

(assert (=> b!1077061 m!996289))

(declare-fun m!996291 () Bool)

(assert (=> b!1077061 m!996291))

(assert (=> b!1077061 m!996285))

(declare-fun m!996293 () Bool)

(assert (=> b!1077061 m!996293))

(declare-fun m!996295 () Bool)

(assert (=> b!1077065 m!996295))

(declare-fun m!996297 () Bool)

(assert (=> b!1077067 m!996297))

(assert (=> d!130087 m!996099))

(assert (=> b!1077062 m!996187))

(assert (=> b!1077062 m!996187))

(declare-fun m!996299 () Bool)

(assert (=> b!1077062 m!996299))

(assert (=> b!1077063 m!996187))

(assert (=> b!1077063 m!996187))

(assert (=> b!1077063 m!996229))

(assert (=> b!1077073 m!996187))

(assert (=> b!1077073 m!996187))

(assert (=> b!1077073 m!996229))

(declare-fun m!996301 () Bool)

(assert (=> bm!45629 m!996301))

(assert (=> b!1076928 d!130087))

(declare-fun d!130089 () Bool)

(assert (=> d!130089 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95392 d!130089))

(declare-fun d!130091 () Bool)

(assert (=> d!130091 (= (array_inv!25700 _values!955) (bvsge (size!33746 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95392 d!130091))

(declare-fun d!130093 () Bool)

(assert (=> d!130093 (= (array_inv!25701 _keys!1163) (bvsge (size!33747 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95392 d!130093))

(declare-fun bm!45634 () Bool)

(declare-fun call!45637 () Bool)

(assert (=> bm!45634 (= call!45637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1077084 () Bool)

(declare-fun e!615695 () Bool)

(assert (=> b!1077084 (= e!615695 call!45637)))

(declare-fun b!1077085 () Bool)

(declare-fun e!615693 () Bool)

(assert (=> b!1077085 (= e!615693 call!45637)))

(declare-fun d!130095 () Bool)

(declare-fun res!717614 () Bool)

(declare-fun e!615694 () Bool)

(assert (=> d!130095 (=> res!717614 e!615694)))

(assert (=> d!130095 (= res!717614 (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> d!130095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615694)))

(declare-fun b!1077086 () Bool)

(assert (=> b!1077086 (= e!615695 e!615693)))

(declare-fun lt!478156 () (_ BitVec 64))

(assert (=> b!1077086 (= lt!478156 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478158 () Unit!35386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69061 (_ BitVec 64) (_ BitVec 32)) Unit!35386)

(assert (=> b!1077086 (= lt!478158 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!478156 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077086 (arrayContainsKey!0 _keys!1163 lt!478156 #b00000000000000000000000000000000)))

(declare-fun lt!478157 () Unit!35386)

(assert (=> b!1077086 (= lt!478157 lt!478158)))

(declare-fun res!717613 () Bool)

(declare-datatypes ((SeekEntryResult!9849 0))(
  ( (MissingZero!9849 (index!41767 (_ BitVec 32))) (Found!9849 (index!41768 (_ BitVec 32))) (Intermediate!9849 (undefined!10661 Bool) (index!41769 (_ BitVec 32)) (x!96380 (_ BitVec 32))) (Undefined!9849) (MissingVacant!9849 (index!41770 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69061 (_ BitVec 32)) SeekEntryResult!9849)

(assert (=> b!1077086 (= res!717613 (= (seekEntryOrOpen!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9849 #b00000000000000000000000000000000)))))

(assert (=> b!1077086 (=> (not res!717613) (not e!615693))))

(declare-fun b!1077087 () Bool)

(assert (=> b!1077087 (= e!615694 e!615695)))

(declare-fun c!108525 () Bool)

(assert (=> b!1077087 (= c!108525 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!130095 (not res!717614)) b!1077087))

(assert (= (and b!1077087 c!108525) b!1077086))

(assert (= (and b!1077087 (not c!108525)) b!1077084))

(assert (= (and b!1077086 res!717613) b!1077085))

(assert (= (or b!1077085 b!1077084) bm!45634))

(declare-fun m!996303 () Bool)

(assert (=> bm!45634 m!996303))

(assert (=> b!1077086 m!996187))

(declare-fun m!996305 () Bool)

(assert (=> b!1077086 m!996305))

(declare-fun m!996307 () Bool)

(assert (=> b!1077086 m!996307))

(assert (=> b!1077086 m!996187))

(declare-fun m!996309 () Bool)

(assert (=> b!1077086 m!996309))

(assert (=> b!1077087 m!996187))

(assert (=> b!1077087 m!996187))

(assert (=> b!1077087 m!996229))

(assert (=> b!1076931 d!130095))

(declare-fun b!1077098 () Bool)

(declare-fun e!615706 () Bool)

(declare-fun contains!6377 (List!23183 (_ BitVec 64)) Bool)

(assert (=> b!1077098 (= e!615706 (contains!6377 Nil!23180 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45637 () Bool)

(declare-fun call!45640 () Bool)

(declare-fun c!108528 () Bool)

(assert (=> bm!45637 (= call!45640 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108528 (Cons!23179 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000) Nil!23180) Nil!23180)))))

(declare-fun b!1077099 () Bool)

(declare-fun e!615704 () Bool)

(declare-fun e!615705 () Bool)

(assert (=> b!1077099 (= e!615704 e!615705)))

(declare-fun res!717623 () Bool)

(assert (=> b!1077099 (=> (not res!717623) (not e!615705))))

(assert (=> b!1077099 (= res!717623 (not e!615706))))

(declare-fun res!717621 () Bool)

(assert (=> b!1077099 (=> (not res!717621) (not e!615706))))

(assert (=> b!1077099 (= res!717621 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077100 () Bool)

(declare-fun e!615707 () Bool)

(assert (=> b!1077100 (= e!615707 call!45640)))

(declare-fun b!1077101 () Bool)

(assert (=> b!1077101 (= e!615705 e!615707)))

(assert (=> b!1077101 (= c!108528 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077102 () Bool)

(assert (=> b!1077102 (= e!615707 call!45640)))

(declare-fun d!130097 () Bool)

(declare-fun res!717622 () Bool)

(assert (=> d!130097 (=> res!717622 e!615704)))

(assert (=> d!130097 (= res!717622 (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> d!130097 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23180) e!615704)))

(assert (= (and d!130097 (not res!717622)) b!1077099))

(assert (= (and b!1077099 res!717621) b!1077098))

(assert (= (and b!1077099 res!717623) b!1077101))

(assert (= (and b!1077101 c!108528) b!1077102))

(assert (= (and b!1077101 (not c!108528)) b!1077100))

(assert (= (or b!1077102 b!1077100) bm!45637))

(assert (=> b!1077098 m!996187))

(assert (=> b!1077098 m!996187))

(declare-fun m!996311 () Bool)

(assert (=> b!1077098 m!996311))

(assert (=> bm!45637 m!996187))

(declare-fun m!996313 () Bool)

(assert (=> bm!45637 m!996313))

(assert (=> b!1077099 m!996187))

(assert (=> b!1077099 m!996187))

(assert (=> b!1077099 m!996229))

(assert (=> b!1077101 m!996187))

(assert (=> b!1077101 m!996187))

(assert (=> b!1077101 m!996229))

(assert (=> b!1076929 d!130097))

(declare-fun d!130099 () Bool)

(assert (=> d!130099 (= (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478161 () Unit!35386)

(declare-fun choose!1760 (array!69061 array!69059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 V!39833 V!39833 (_ BitVec 32) Int) Unit!35386)

(assert (=> d!130099 (= lt!478161 (choose!1760 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130099 (validMask!0 mask!1515)))

(assert (=> d!130099 (= (lemmaNoChangeToArrayThenSameMapNoExtras!892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478161)))

(declare-fun bs!31709 () Bool)

(assert (= bs!31709 d!130099))

(assert (=> bs!31709 m!996117))

(assert (=> bs!31709 m!996115))

(declare-fun m!996315 () Bool)

(assert (=> bs!31709 m!996315))

(assert (=> bs!31709 m!996099))

(assert (=> b!1076932 d!130099))

(declare-fun b!1077127 () Bool)

(declare-fun e!615724 () ListLongMap!14609)

(declare-fun e!615722 () ListLongMap!14609)

(assert (=> b!1077127 (= e!615724 e!615722)))

(declare-fun c!108540 () Bool)

(assert (=> b!1077127 (= c!108540 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077128 () Bool)

(declare-fun res!717635 () Bool)

(declare-fun e!615726 () Bool)

(assert (=> b!1077128 (=> (not res!717635) (not e!615726))))

(declare-fun lt!478180 () ListLongMap!14609)

(assert (=> b!1077128 (= res!717635 (not (contains!6375 lt!478180 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077129 () Bool)

(declare-fun e!615725 () Bool)

(declare-fun isEmpty!962 (ListLongMap!14609) Bool)

(assert (=> b!1077129 (= e!615725 (isEmpty!962 lt!478180))))

(declare-fun d!130101 () Bool)

(assert (=> d!130101 e!615726))

(declare-fun res!717634 () Bool)

(assert (=> d!130101 (=> (not res!717634) (not e!615726))))

(assert (=> d!130101 (= res!717634 (not (contains!6375 lt!478180 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130101 (= lt!478180 e!615724)))

(declare-fun c!108538 () Bool)

(assert (=> d!130101 (= c!108538 (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> d!130101 (validMask!0 mask!1515)))

(assert (=> d!130101 (= (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478180)))

(declare-fun b!1077130 () Bool)

(assert (=> b!1077130 (= e!615724 (ListLongMap!14610 Nil!23179))))

(declare-fun b!1077131 () Bool)

(declare-fun call!45643 () ListLongMap!14609)

(assert (=> b!1077131 (= e!615722 call!45643)))

(declare-fun b!1077132 () Bool)

(declare-fun lt!478181 () Unit!35386)

(declare-fun lt!478176 () Unit!35386)

(assert (=> b!1077132 (= lt!478181 lt!478176)))

(declare-fun lt!478178 () V!39833)

(declare-fun lt!478182 () (_ BitVec 64))

(declare-fun lt!478179 () (_ BitVec 64))

(declare-fun lt!478177 () ListLongMap!14609)

(assert (=> b!1077132 (not (contains!6375 (+!3247 lt!478177 (tuple2!16633 lt!478182 lt!478178)) lt!478179))))

(declare-fun addStillNotContains!270 (ListLongMap!14609 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35386)

(assert (=> b!1077132 (= lt!478176 (addStillNotContains!270 lt!478177 lt!478182 lt!478178 lt!478179))))

(assert (=> b!1077132 (= lt!478179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1077132 (= lt!478178 (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077132 (= lt!478182 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077132 (= lt!478177 call!45643)))

(assert (=> b!1077132 (= e!615722 (+!3247 call!45643 (tuple2!16633 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1077133 () Bool)

(declare-fun e!615727 () Bool)

(assert (=> b!1077133 (= e!615727 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077133 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45640 () Bool)

(assert (=> bm!45640 (= call!45643 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077134 () Bool)

(declare-fun e!615728 () Bool)

(declare-fun e!615723 () Bool)

(assert (=> b!1077134 (= e!615728 e!615723)))

(assert (=> b!1077134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun res!717633 () Bool)

(assert (=> b!1077134 (= res!717633 (contains!6375 lt!478180 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077134 (=> (not res!717633) (not e!615723))))

(declare-fun b!1077135 () Bool)

(assert (=> b!1077135 (= e!615728 e!615725)))

(declare-fun c!108539 () Bool)

(assert (=> b!1077135 (= c!108539 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun b!1077136 () Bool)

(assert (=> b!1077136 (= e!615725 (= lt!478180 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077137 () Bool)

(assert (=> b!1077137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> b!1077137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33746 _values!955)))))

(assert (=> b!1077137 (= e!615723 (= (apply!949 lt!478180 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1077138 () Bool)

(assert (=> b!1077138 (= e!615726 e!615728)))

(declare-fun c!108537 () Bool)

(assert (=> b!1077138 (= c!108537 e!615727)))

(declare-fun res!717632 () Bool)

(assert (=> b!1077138 (=> (not res!717632) (not e!615727))))

(assert (=> b!1077138 (= res!717632 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (= (and d!130101 c!108538) b!1077130))

(assert (= (and d!130101 (not c!108538)) b!1077127))

(assert (= (and b!1077127 c!108540) b!1077132))

(assert (= (and b!1077127 (not c!108540)) b!1077131))

(assert (= (or b!1077132 b!1077131) bm!45640))

(assert (= (and d!130101 res!717634) b!1077128))

(assert (= (and b!1077128 res!717635) b!1077138))

(assert (= (and b!1077138 res!717632) b!1077133))

(assert (= (and b!1077138 c!108537) b!1077134))

(assert (= (and b!1077138 (not c!108537)) b!1077135))

(assert (= (and b!1077134 res!717633) b!1077137))

(assert (= (and b!1077135 c!108539) b!1077136))

(assert (= (and b!1077135 (not c!108539)) b!1077129))

(declare-fun b_lambda!16915 () Bool)

(assert (=> (not b_lambda!16915) (not b!1077132)))

(assert (=> b!1077132 t!32533))

(declare-fun b_and!35175 () Bool)

(assert (= b_and!35173 (and (=> t!32533 result!14825) b_and!35175)))

(declare-fun b_lambda!16917 () Bool)

(assert (=> (not b_lambda!16917) (not b!1077137)))

(assert (=> b!1077137 t!32533))

(declare-fun b_and!35177 () Bool)

(assert (= b_and!35175 (and (=> t!32533 result!14825) b_and!35177)))

(declare-fun m!996317 () Bool)

(assert (=> d!130101 m!996317))

(assert (=> d!130101 m!996099))

(assert (=> b!1077137 m!996187))

(declare-fun m!996319 () Bool)

(assert (=> b!1077137 m!996319))

(assert (=> b!1077137 m!996181))

(assert (=> b!1077137 m!996183))

(assert (=> b!1077137 m!996181))

(assert (=> b!1077137 m!996183))

(assert (=> b!1077137 m!996185))

(assert (=> b!1077137 m!996187))

(assert (=> b!1077127 m!996187))

(assert (=> b!1077127 m!996187))

(assert (=> b!1077127 m!996229))

(assert (=> b!1077134 m!996187))

(assert (=> b!1077134 m!996187))

(declare-fun m!996321 () Bool)

(assert (=> b!1077134 m!996321))

(declare-fun m!996323 () Bool)

(assert (=> bm!45640 m!996323))

(declare-fun m!996325 () Bool)

(assert (=> b!1077129 m!996325))

(declare-fun m!996327 () Bool)

(assert (=> b!1077132 m!996327))

(declare-fun m!996329 () Bool)

(assert (=> b!1077132 m!996329))

(declare-fun m!996331 () Bool)

(assert (=> b!1077132 m!996331))

(assert (=> b!1077132 m!996181))

(assert (=> b!1077132 m!996183))

(assert (=> b!1077132 m!996181))

(assert (=> b!1077132 m!996183))

(assert (=> b!1077132 m!996185))

(assert (=> b!1077132 m!996187))

(assert (=> b!1077132 m!996327))

(declare-fun m!996333 () Bool)

(assert (=> b!1077132 m!996333))

(assert (=> b!1077136 m!996323))

(assert (=> b!1077133 m!996187))

(assert (=> b!1077133 m!996187))

(assert (=> b!1077133 m!996229))

(declare-fun m!996335 () Bool)

(assert (=> b!1077128 m!996335))

(assert (=> b!1076932 d!130101))

(declare-fun b!1077139 () Bool)

(declare-fun e!615731 () ListLongMap!14609)

(declare-fun e!615729 () ListLongMap!14609)

(assert (=> b!1077139 (= e!615731 e!615729)))

(declare-fun c!108544 () Bool)

(assert (=> b!1077139 (= c!108544 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077140 () Bool)

(declare-fun res!717639 () Bool)

(declare-fun e!615733 () Bool)

(assert (=> b!1077140 (=> (not res!717639) (not e!615733))))

(declare-fun lt!478187 () ListLongMap!14609)

(assert (=> b!1077140 (= res!717639 (not (contains!6375 lt!478187 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077141 () Bool)

(declare-fun e!615732 () Bool)

(assert (=> b!1077141 (= e!615732 (isEmpty!962 lt!478187))))

(declare-fun d!130103 () Bool)

(assert (=> d!130103 e!615733))

(declare-fun res!717638 () Bool)

(assert (=> d!130103 (=> (not res!717638) (not e!615733))))

(assert (=> d!130103 (= res!717638 (not (contains!6375 lt!478187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130103 (= lt!478187 e!615731)))

(declare-fun c!108542 () Bool)

(assert (=> d!130103 (= c!108542 (bvsge #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> d!130103 (validMask!0 mask!1515)))

(assert (=> d!130103 (= (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478187)))

(declare-fun b!1077142 () Bool)

(assert (=> b!1077142 (= e!615731 (ListLongMap!14610 Nil!23179))))

(declare-fun b!1077143 () Bool)

(declare-fun call!45644 () ListLongMap!14609)

(assert (=> b!1077143 (= e!615729 call!45644)))

(declare-fun b!1077144 () Bool)

(declare-fun lt!478188 () Unit!35386)

(declare-fun lt!478183 () Unit!35386)

(assert (=> b!1077144 (= lt!478188 lt!478183)))

(declare-fun lt!478189 () (_ BitVec 64))

(declare-fun lt!478186 () (_ BitVec 64))

(declare-fun lt!478184 () ListLongMap!14609)

(declare-fun lt!478185 () V!39833)

(assert (=> b!1077144 (not (contains!6375 (+!3247 lt!478184 (tuple2!16633 lt!478189 lt!478185)) lt!478186))))

(assert (=> b!1077144 (= lt!478183 (addStillNotContains!270 lt!478184 lt!478189 lt!478185 lt!478186))))

(assert (=> b!1077144 (= lt!478186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1077144 (= lt!478185 (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077144 (= lt!478189 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077144 (= lt!478184 call!45644)))

(assert (=> b!1077144 (= e!615729 (+!3247 call!45644 (tuple2!16633 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1077145 () Bool)

(declare-fun e!615734 () Bool)

(assert (=> b!1077145 (= e!615734 (validKeyInArray!0 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077145 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45641 () Bool)

(assert (=> bm!45641 (= call!45644 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077146 () Bool)

(declare-fun e!615735 () Bool)

(declare-fun e!615730 () Bool)

(assert (=> b!1077146 (= e!615735 e!615730)))

(assert (=> b!1077146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun res!717637 () Bool)

(assert (=> b!1077146 (= res!717637 (contains!6375 lt!478187 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077146 (=> (not res!717637) (not e!615730))))

(declare-fun b!1077147 () Bool)

(assert (=> b!1077147 (= e!615735 e!615732)))

(declare-fun c!108543 () Bool)

(assert (=> b!1077147 (= c!108543 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(declare-fun b!1077148 () Bool)

(assert (=> b!1077148 (= e!615732 (= lt!478187 (getCurrentListMapNoExtraKeys!3912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077149 () Bool)

(assert (=> b!1077149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (=> b!1077149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33746 _values!955)))))

(assert (=> b!1077149 (= e!615730 (= (apply!949 lt!478187 (select (arr!33210 _keys!1163) #b00000000000000000000000000000000)) (get!17269 (select (arr!33209 _values!955) #b00000000000000000000000000000000) (dynLambda!2064 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1077150 () Bool)

(assert (=> b!1077150 (= e!615733 e!615735)))

(declare-fun c!108541 () Bool)

(assert (=> b!1077150 (= c!108541 e!615734)))

(declare-fun res!717636 () Bool)

(assert (=> b!1077150 (=> (not res!717636) (not e!615734))))

(assert (=> b!1077150 (= res!717636 (bvslt #b00000000000000000000000000000000 (size!33747 _keys!1163)))))

(assert (= (and d!130103 c!108542) b!1077142))

(assert (= (and d!130103 (not c!108542)) b!1077139))

(assert (= (and b!1077139 c!108544) b!1077144))

(assert (= (and b!1077139 (not c!108544)) b!1077143))

(assert (= (or b!1077144 b!1077143) bm!45641))

(assert (= (and d!130103 res!717638) b!1077140))

(assert (= (and b!1077140 res!717639) b!1077150))

(assert (= (and b!1077150 res!717636) b!1077145))

(assert (= (and b!1077150 c!108541) b!1077146))

(assert (= (and b!1077150 (not c!108541)) b!1077147))

(assert (= (and b!1077146 res!717637) b!1077149))

(assert (= (and b!1077147 c!108543) b!1077148))

(assert (= (and b!1077147 (not c!108543)) b!1077141))

(declare-fun b_lambda!16919 () Bool)

(assert (=> (not b_lambda!16919) (not b!1077144)))

(assert (=> b!1077144 t!32533))

(declare-fun b_and!35179 () Bool)

(assert (= b_and!35177 (and (=> t!32533 result!14825) b_and!35179)))

(declare-fun b_lambda!16921 () Bool)

(assert (=> (not b_lambda!16921) (not b!1077149)))

(assert (=> b!1077149 t!32533))

(declare-fun b_and!35181 () Bool)

(assert (= b_and!35179 (and (=> t!32533 result!14825) b_and!35181)))

(declare-fun m!996337 () Bool)

(assert (=> d!130103 m!996337))

(assert (=> d!130103 m!996099))

(assert (=> b!1077149 m!996187))

(declare-fun m!996339 () Bool)

(assert (=> b!1077149 m!996339))

(assert (=> b!1077149 m!996181))

(assert (=> b!1077149 m!996183))

(assert (=> b!1077149 m!996181))

(assert (=> b!1077149 m!996183))

(assert (=> b!1077149 m!996185))

(assert (=> b!1077149 m!996187))

(assert (=> b!1077139 m!996187))

(assert (=> b!1077139 m!996187))

(assert (=> b!1077139 m!996229))

(assert (=> b!1077146 m!996187))

(assert (=> b!1077146 m!996187))

(declare-fun m!996341 () Bool)

(assert (=> b!1077146 m!996341))

(declare-fun m!996343 () Bool)

(assert (=> bm!45641 m!996343))

(declare-fun m!996345 () Bool)

(assert (=> b!1077141 m!996345))

(declare-fun m!996347 () Bool)

(assert (=> b!1077144 m!996347))

(declare-fun m!996349 () Bool)

(assert (=> b!1077144 m!996349))

(declare-fun m!996351 () Bool)

(assert (=> b!1077144 m!996351))

(assert (=> b!1077144 m!996181))

(assert (=> b!1077144 m!996183))

(assert (=> b!1077144 m!996181))

(assert (=> b!1077144 m!996183))

(assert (=> b!1077144 m!996185))

(assert (=> b!1077144 m!996187))

(assert (=> b!1077144 m!996347))

(declare-fun m!996353 () Bool)

(assert (=> b!1077144 m!996353))

(assert (=> b!1077148 m!996343))

(assert (=> b!1077145 m!996187))

(assert (=> b!1077145 m!996187))

(assert (=> b!1077145 m!996229))

(declare-fun m!996355 () Bool)

(assert (=> b!1077140 m!996355))

(assert (=> b!1076932 d!130103))

(declare-fun b!1077157 () Bool)

(declare-fun e!615740 () Bool)

(assert (=> b!1077157 (= e!615740 tp_is_empty!26023)))

(declare-fun mapIsEmpty!40780 () Bool)

(declare-fun mapRes!40780 () Bool)

(assert (=> mapIsEmpty!40780 mapRes!40780))

(declare-fun b!1077158 () Bool)

(declare-fun e!615741 () Bool)

(assert (=> b!1077158 (= e!615741 tp_is_empty!26023)))

(declare-fun mapNonEmpty!40780 () Bool)

(declare-fun tp!78143 () Bool)

(assert (=> mapNonEmpty!40780 (= mapRes!40780 (and tp!78143 e!615740))))

(declare-fun mapValue!40780 () ValueCell!12308)

(declare-fun mapRest!40780 () (Array (_ BitVec 32) ValueCell!12308))

(declare-fun mapKey!40780 () (_ BitVec 32))

(assert (=> mapNonEmpty!40780 (= mapRest!40771 (store mapRest!40780 mapKey!40780 mapValue!40780))))

(declare-fun condMapEmpty!40780 () Bool)

(declare-fun mapDefault!40780 () ValueCell!12308)

(assert (=> mapNonEmpty!40771 (= condMapEmpty!40780 (= mapRest!40771 ((as const (Array (_ BitVec 32) ValueCell!12308)) mapDefault!40780)))))

(assert (=> mapNonEmpty!40771 (= tp!78128 (and e!615741 mapRes!40780))))

(assert (= (and mapNonEmpty!40771 condMapEmpty!40780) mapIsEmpty!40780))

(assert (= (and mapNonEmpty!40771 (not condMapEmpty!40780)) mapNonEmpty!40780))

(assert (= (and mapNonEmpty!40780 ((_ is ValueCellFull!12308) mapValue!40780)) b!1077157))

(assert (= (and mapNonEmpty!40771 ((_ is ValueCellFull!12308) mapDefault!40780)) b!1077158))

(declare-fun m!996357 () Bool)

(assert (=> mapNonEmpty!40780 m!996357))

(declare-fun b_lambda!16923 () Bool)

(assert (= b_lambda!16921 (or (and start!95392 b_free!22213) b_lambda!16923)))

(declare-fun b_lambda!16925 () Bool)

(assert (= b_lambda!16919 (or (and start!95392 b_free!22213) b_lambda!16925)))

(declare-fun b_lambda!16927 () Bool)

(assert (= b_lambda!16913 (or (and start!95392 b_free!22213) b_lambda!16927)))

(declare-fun b_lambda!16929 () Bool)

(assert (= b_lambda!16917 (or (and start!95392 b_free!22213) b_lambda!16929)))

(declare-fun b_lambda!16931 () Bool)

(assert (= b_lambda!16915 (or (and start!95392 b_free!22213) b_lambda!16931)))

(declare-fun b_lambda!16933 () Bool)

(assert (= b_lambda!16911 (or (and start!95392 b_free!22213) b_lambda!16933)))

(check-sat (not b!1077129) (not d!130081) tp_is_empty!26023 (not b!1077087) (not b!1077054) (not bm!45630) (not bm!45620) (not b!1077062) (not b!1077101) (not b!1077067) (not bm!45624) (not b!1077065) (not d!130099) (not bm!45634) (not d!130085) (not d!130103) (not d!130083) (not b!1077036) (not bm!45627) (not b!1077145) (not b!1077040) (not b!1077133) (not b!1077128) (not b!1077146) (not b!1077032) (not d!130101) (not bm!45637) (not b!1077061) (not b!1077053) (not b!1077139) (not bm!45629) (not bm!45622) (not b_next!22213) (not b!1077140) (not bm!45623) (not bm!45631) (not b_lambda!16933) (not b!1077134) (not b!1077073) b_and!35181 (not bm!45641) (not b_lambda!16925) (not b!1077149) (not b!1077030) (not b!1077098) (not bm!45640) (not b!1077063) (not b!1077051) (not b!1077086) (not b!1077070) (not b!1077148) (not b!1077132) (not b!1077034) (not b!1077039) (not b!1077071) (not b_lambda!16923) (not b_lambda!16931) (not b!1077141) (not b_lambda!16929) (not b!1077144) (not b!1077031) (not b!1077042) (not mapNonEmpty!40780) (not b!1077052) (not b!1077136) (not b!1077137) (not b!1077099) (not b!1077127) (not d!130087) (not b_lambda!16927))
(check-sat b_and!35181 (not b_next!22213))
