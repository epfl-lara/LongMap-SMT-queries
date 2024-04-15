; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70798 () Bool)

(assert start!70798)

(declare-fun b_free!13075 () Bool)

(declare-fun b_next!13075 () Bool)

(assert (=> start!70798 (= b_free!13075 (not b_next!13075))))

(declare-fun tp!45970 () Bool)

(declare-fun b_and!21921 () Bool)

(assert (=> start!70798 (= tp!45970 b_and!21921)))

(declare-fun b!822328 () Bool)

(declare-fun res!560929 () Bool)

(declare-fun e!457212 () Bool)

(assert (=> b!822328 (=> (not res!560929) (not e!457212))))

(declare-datatypes ((array!45731 0))(
  ( (array!45732 (arr!21916 (Array (_ BitVec 32) (_ BitVec 64))) (size!22337 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45731)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45731 (_ BitVec 32)) Bool)

(assert (=> b!822328 (= res!560929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23788 () Bool)

(declare-fun mapRes!23788 () Bool)

(assert (=> mapIsEmpty!23788 mapRes!23788))

(declare-fun b!822330 () Bool)

(declare-fun e!457210 () Bool)

(declare-fun tp_is_empty!14785 () Bool)

(assert (=> b!822330 (= e!457210 tp_is_empty!14785)))

(declare-fun b!822331 () Bool)

(declare-fun e!457214 () Bool)

(assert (=> b!822331 (= e!457212 (not e!457214))))

(declare-fun res!560930 () Bool)

(assert (=> b!822331 (=> res!560930 e!457214)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822331 (= res!560930 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24715 0))(
  ( (V!24716 (val!7440 Int)) )
))
(declare-datatypes ((tuple2!9832 0))(
  ( (tuple2!9833 (_1!4927 (_ BitVec 64)) (_2!4927 V!24715)) )
))
(declare-datatypes ((List!15644 0))(
  ( (Nil!15641) (Cons!15640 (h!16769 tuple2!9832) (t!21972 List!15644)) )
))
(declare-datatypes ((ListLongMap!8645 0))(
  ( (ListLongMap!8646 (toList!4338 List!15644)) )
))
(declare-fun lt!370038 () ListLongMap!8645)

(declare-fun lt!370042 () ListLongMap!8645)

(assert (=> b!822331 (= lt!370038 lt!370042)))

(declare-fun zeroValueBefore!34 () V!24715)

(declare-datatypes ((Unit!28096 0))(
  ( (Unit!28097) )
))
(declare-fun lt!370043 () Unit!28096)

(declare-fun zeroValueAfter!34 () V!24715)

(declare-fun minValue!754 () V!24715)

(declare-datatypes ((ValueCell!6977 0))(
  ( (ValueCellFull!6977 (v!9865 V!24715)) (EmptyCell!6977) )
))
(declare-datatypes ((array!45733 0))(
  ( (array!45734 (arr!21917 (Array (_ BitVec 32) ValueCell!6977)) (size!22338 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45733)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!477 (array!45731 array!45733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 V!24715 V!24715 (_ BitVec 32) Int) Unit!28096)

(assert (=> b!822331 (= lt!370043 (lemmaNoChangeToArrayThenSameMapNoExtras!477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2384 (array!45731 array!45733 (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 (_ BitVec 32) Int) ListLongMap!8645)

(assert (=> b!822331 (= lt!370042 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822331 (= lt!370038 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822332 () Bool)

(declare-fun e!457215 () Bool)

(assert (=> b!822332 (= e!457215 (and e!457210 mapRes!23788))))

(declare-fun condMapEmpty!23788 () Bool)

(declare-fun mapDefault!23788 () ValueCell!6977)

(assert (=> b!822332 (= condMapEmpty!23788 (= (arr!21917 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6977)) mapDefault!23788)))))

(declare-fun b!822333 () Bool)

(assert (=> b!822333 (= e!457214 (bvsle #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun lt!370041 () ListLongMap!8645)

(declare-fun lt!370044 () ListLongMap!8645)

(declare-fun lt!370035 () tuple2!9832)

(declare-fun +!1917 (ListLongMap!8645 tuple2!9832) ListLongMap!8645)

(assert (=> b!822333 (= lt!370041 (+!1917 lt!370044 lt!370035))))

(declare-fun lt!370039 () Unit!28096)

(declare-fun addCommutativeForDiffKeys!448 (ListLongMap!8645 (_ BitVec 64) V!24715 (_ BitVec 64) V!24715) Unit!28096)

(assert (=> b!822333 (= lt!370039 (addCommutativeForDiffKeys!448 lt!370038 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370037 () ListLongMap!8645)

(assert (=> b!822333 (= lt!370037 lt!370041)))

(declare-fun lt!370036 () tuple2!9832)

(assert (=> b!822333 (= lt!370041 (+!1917 (+!1917 lt!370038 lt!370035) lt!370036))))

(assert (=> b!822333 (= lt!370035 (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370040 () ListLongMap!8645)

(assert (=> b!822333 (= lt!370040 lt!370044)))

(assert (=> b!822333 (= lt!370044 (+!1917 lt!370038 lt!370036))))

(assert (=> b!822333 (= lt!370036 (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2459 (array!45731 array!45733 (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 (_ BitVec 32) Int) ListLongMap!8645)

(assert (=> b!822333 (= lt!370037 (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822333 (= lt!370040 (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23788 () Bool)

(declare-fun tp!45969 () Bool)

(declare-fun e!457213 () Bool)

(assert (=> mapNonEmpty!23788 (= mapRes!23788 (and tp!45969 e!457213))))

(declare-fun mapRest!23788 () (Array (_ BitVec 32) ValueCell!6977))

(declare-fun mapValue!23788 () ValueCell!6977)

(declare-fun mapKey!23788 () (_ BitVec 32))

(assert (=> mapNonEmpty!23788 (= (arr!21917 _values!788) (store mapRest!23788 mapKey!23788 mapValue!23788))))

(declare-fun b!822334 () Bool)

(declare-fun res!560931 () Bool)

(assert (=> b!822334 (=> (not res!560931) (not e!457212))))

(declare-datatypes ((List!15645 0))(
  ( (Nil!15642) (Cons!15641 (h!16770 (_ BitVec 64)) (t!21973 List!15645)) )
))
(declare-fun arrayNoDuplicates!0 (array!45731 (_ BitVec 32) List!15645) Bool)

(assert (=> b!822334 (= res!560931 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15642))))

(declare-fun b!822335 () Bool)

(declare-fun res!560933 () Bool)

(assert (=> b!822335 (=> (not res!560933) (not e!457212))))

(assert (=> b!822335 (= res!560933 (and (= (size!22338 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22337 _keys!976) (size!22338 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560932 () Bool)

(assert (=> start!70798 (=> (not res!560932) (not e!457212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70798 (= res!560932 (validMask!0 mask!1312))))

(assert (=> start!70798 e!457212))

(assert (=> start!70798 tp_is_empty!14785))

(declare-fun array_inv!17569 (array!45731) Bool)

(assert (=> start!70798 (array_inv!17569 _keys!976)))

(assert (=> start!70798 true))

(declare-fun array_inv!17570 (array!45733) Bool)

(assert (=> start!70798 (and (array_inv!17570 _values!788) e!457215)))

(assert (=> start!70798 tp!45970))

(declare-fun b!822329 () Bool)

(assert (=> b!822329 (= e!457213 tp_is_empty!14785)))

(assert (= (and start!70798 res!560932) b!822335))

(assert (= (and b!822335 res!560933) b!822328))

(assert (= (and b!822328 res!560929) b!822334))

(assert (= (and b!822334 res!560931) b!822331))

(assert (= (and b!822331 (not res!560930)) b!822333))

(assert (= (and b!822332 condMapEmpty!23788) mapIsEmpty!23788))

(assert (= (and b!822332 (not condMapEmpty!23788)) mapNonEmpty!23788))

(get-info :version)

(assert (= (and mapNonEmpty!23788 ((_ is ValueCellFull!6977) mapValue!23788)) b!822329))

(assert (= (and b!822332 ((_ is ValueCellFull!6977) mapDefault!23788)) b!822330))

(assert (= start!70798 b!822332))

(declare-fun m!763721 () Bool)

(assert (=> b!822334 m!763721))

(declare-fun m!763723 () Bool)

(assert (=> b!822333 m!763723))

(declare-fun m!763725 () Bool)

(assert (=> b!822333 m!763725))

(declare-fun m!763727 () Bool)

(assert (=> b!822333 m!763727))

(declare-fun m!763729 () Bool)

(assert (=> b!822333 m!763729))

(assert (=> b!822333 m!763727))

(declare-fun m!763731 () Bool)

(assert (=> b!822333 m!763731))

(declare-fun m!763733 () Bool)

(assert (=> b!822333 m!763733))

(declare-fun m!763735 () Bool)

(assert (=> b!822333 m!763735))

(declare-fun m!763737 () Bool)

(assert (=> mapNonEmpty!23788 m!763737))

(declare-fun m!763739 () Bool)

(assert (=> b!822331 m!763739))

(declare-fun m!763741 () Bool)

(assert (=> b!822331 m!763741))

(declare-fun m!763743 () Bool)

(assert (=> b!822331 m!763743))

(declare-fun m!763745 () Bool)

(assert (=> b!822328 m!763745))

(declare-fun m!763747 () Bool)

(assert (=> start!70798 m!763747))

(declare-fun m!763749 () Bool)

(assert (=> start!70798 m!763749))

(declare-fun m!763751 () Bool)

(assert (=> start!70798 m!763751))

(check-sat (not b!822333) (not b_next!13075) tp_is_empty!14785 b_and!21921 (not b!822334) (not b!822331) (not mapNonEmpty!23788) (not b!822328) (not start!70798))
(check-sat b_and!21921 (not b_next!13075))
(get-model)

(declare-fun d!104633 () Bool)

(declare-fun e!457254 () Bool)

(assert (=> d!104633 e!457254))

(declare-fun res!560969 () Bool)

(assert (=> d!104633 (=> (not res!560969) (not e!457254))))

(declare-fun lt!370114 () ListLongMap!8645)

(declare-fun contains!4148 (ListLongMap!8645 (_ BitVec 64)) Bool)

(assert (=> d!104633 (= res!560969 (contains!4148 lt!370114 (_1!4927 lt!370035)))))

(declare-fun lt!370113 () List!15644)

(assert (=> d!104633 (= lt!370114 (ListLongMap!8646 lt!370113))))

(declare-fun lt!370116 () Unit!28096)

(declare-fun lt!370115 () Unit!28096)

(assert (=> d!104633 (= lt!370116 lt!370115)))

(declare-datatypes ((Option!408 0))(
  ( (Some!407 (v!9868 V!24715)) (None!406) )
))
(declare-fun getValueByKey!402 (List!15644 (_ BitVec 64)) Option!408)

(assert (=> d!104633 (= (getValueByKey!402 lt!370113 (_1!4927 lt!370035)) (Some!407 (_2!4927 lt!370035)))))

(declare-fun lemmaContainsTupThenGetReturnValue!219 (List!15644 (_ BitVec 64) V!24715) Unit!28096)

(assert (=> d!104633 (= lt!370115 (lemmaContainsTupThenGetReturnValue!219 lt!370113 (_1!4927 lt!370035) (_2!4927 lt!370035)))))

(declare-fun insertStrictlySorted!258 (List!15644 (_ BitVec 64) V!24715) List!15644)

(assert (=> d!104633 (= lt!370113 (insertStrictlySorted!258 (toList!4338 lt!370038) (_1!4927 lt!370035) (_2!4927 lt!370035)))))

(assert (=> d!104633 (= (+!1917 lt!370038 lt!370035) lt!370114)))

(declare-fun b!822388 () Bool)

(declare-fun res!560968 () Bool)

(assert (=> b!822388 (=> (not res!560968) (not e!457254))))

(assert (=> b!822388 (= res!560968 (= (getValueByKey!402 (toList!4338 lt!370114) (_1!4927 lt!370035)) (Some!407 (_2!4927 lt!370035))))))

(declare-fun b!822389 () Bool)

(declare-fun contains!4149 (List!15644 tuple2!9832) Bool)

(assert (=> b!822389 (= e!457254 (contains!4149 (toList!4338 lt!370114) lt!370035))))

(assert (= (and d!104633 res!560969) b!822388))

(assert (= (and b!822388 res!560968) b!822389))

(declare-fun m!763817 () Bool)

(assert (=> d!104633 m!763817))

(declare-fun m!763819 () Bool)

(assert (=> d!104633 m!763819))

(declare-fun m!763821 () Bool)

(assert (=> d!104633 m!763821))

(declare-fun m!763823 () Bool)

(assert (=> d!104633 m!763823))

(declare-fun m!763825 () Bool)

(assert (=> b!822388 m!763825))

(declare-fun m!763827 () Bool)

(assert (=> b!822389 m!763827))

(assert (=> b!822333 d!104633))

(declare-fun d!104635 () Bool)

(assert (=> d!104635 (= (+!1917 (+!1917 lt!370038 (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1917 (+!1917 lt!370038 (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!370119 () Unit!28096)

(declare-fun choose!1408 (ListLongMap!8645 (_ BitVec 64) V!24715 (_ BitVec 64) V!24715) Unit!28096)

(assert (=> d!104635 (= lt!370119 (choose!1408 lt!370038 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!104635 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104635 (= (addCommutativeForDiffKeys!448 lt!370038 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!370119)))

(declare-fun bs!22925 () Bool)

(assert (= bs!22925 d!104635))

(declare-fun m!763829 () Bool)

(assert (=> bs!22925 m!763829))

(assert (=> bs!22925 m!763829))

(declare-fun m!763831 () Bool)

(assert (=> bs!22925 m!763831))

(declare-fun m!763833 () Bool)

(assert (=> bs!22925 m!763833))

(declare-fun m!763835 () Bool)

(assert (=> bs!22925 m!763835))

(assert (=> bs!22925 m!763833))

(declare-fun m!763837 () Bool)

(assert (=> bs!22925 m!763837))

(assert (=> b!822333 d!104635))

(declare-fun d!104637 () Bool)

(declare-fun e!457255 () Bool)

(assert (=> d!104637 e!457255))

(declare-fun res!560971 () Bool)

(assert (=> d!104637 (=> (not res!560971) (not e!457255))))

(declare-fun lt!370121 () ListLongMap!8645)

(assert (=> d!104637 (= res!560971 (contains!4148 lt!370121 (_1!4927 lt!370036)))))

(declare-fun lt!370120 () List!15644)

(assert (=> d!104637 (= lt!370121 (ListLongMap!8646 lt!370120))))

(declare-fun lt!370123 () Unit!28096)

(declare-fun lt!370122 () Unit!28096)

(assert (=> d!104637 (= lt!370123 lt!370122)))

(assert (=> d!104637 (= (getValueByKey!402 lt!370120 (_1!4927 lt!370036)) (Some!407 (_2!4927 lt!370036)))))

(assert (=> d!104637 (= lt!370122 (lemmaContainsTupThenGetReturnValue!219 lt!370120 (_1!4927 lt!370036) (_2!4927 lt!370036)))))

(assert (=> d!104637 (= lt!370120 (insertStrictlySorted!258 (toList!4338 (+!1917 lt!370038 lt!370035)) (_1!4927 lt!370036) (_2!4927 lt!370036)))))

(assert (=> d!104637 (= (+!1917 (+!1917 lt!370038 lt!370035) lt!370036) lt!370121)))

(declare-fun b!822390 () Bool)

(declare-fun res!560970 () Bool)

(assert (=> b!822390 (=> (not res!560970) (not e!457255))))

(assert (=> b!822390 (= res!560970 (= (getValueByKey!402 (toList!4338 lt!370121) (_1!4927 lt!370036)) (Some!407 (_2!4927 lt!370036))))))

(declare-fun b!822391 () Bool)

(assert (=> b!822391 (= e!457255 (contains!4149 (toList!4338 lt!370121) lt!370036))))

(assert (= (and d!104637 res!560971) b!822390))

(assert (= (and b!822390 res!560970) b!822391))

(declare-fun m!763839 () Bool)

(assert (=> d!104637 m!763839))

(declare-fun m!763841 () Bool)

(assert (=> d!104637 m!763841))

(declare-fun m!763843 () Bool)

(assert (=> d!104637 m!763843))

(declare-fun m!763845 () Bool)

(assert (=> d!104637 m!763845))

(declare-fun m!763847 () Bool)

(assert (=> b!822390 m!763847))

(declare-fun m!763849 () Bool)

(assert (=> b!822391 m!763849))

(assert (=> b!822333 d!104637))

(declare-fun d!104639 () Bool)

(declare-fun e!457256 () Bool)

(assert (=> d!104639 e!457256))

(declare-fun res!560973 () Bool)

(assert (=> d!104639 (=> (not res!560973) (not e!457256))))

(declare-fun lt!370125 () ListLongMap!8645)

(assert (=> d!104639 (= res!560973 (contains!4148 lt!370125 (_1!4927 lt!370036)))))

(declare-fun lt!370124 () List!15644)

(assert (=> d!104639 (= lt!370125 (ListLongMap!8646 lt!370124))))

(declare-fun lt!370127 () Unit!28096)

(declare-fun lt!370126 () Unit!28096)

(assert (=> d!104639 (= lt!370127 lt!370126)))

(assert (=> d!104639 (= (getValueByKey!402 lt!370124 (_1!4927 lt!370036)) (Some!407 (_2!4927 lt!370036)))))

(assert (=> d!104639 (= lt!370126 (lemmaContainsTupThenGetReturnValue!219 lt!370124 (_1!4927 lt!370036) (_2!4927 lt!370036)))))

(assert (=> d!104639 (= lt!370124 (insertStrictlySorted!258 (toList!4338 lt!370038) (_1!4927 lt!370036) (_2!4927 lt!370036)))))

(assert (=> d!104639 (= (+!1917 lt!370038 lt!370036) lt!370125)))

(declare-fun b!822392 () Bool)

(declare-fun res!560972 () Bool)

(assert (=> b!822392 (=> (not res!560972) (not e!457256))))

(assert (=> b!822392 (= res!560972 (= (getValueByKey!402 (toList!4338 lt!370125) (_1!4927 lt!370036)) (Some!407 (_2!4927 lt!370036))))))

(declare-fun b!822393 () Bool)

(assert (=> b!822393 (= e!457256 (contains!4149 (toList!4338 lt!370125) lt!370036))))

(assert (= (and d!104639 res!560973) b!822392))

(assert (= (and b!822392 res!560972) b!822393))

(declare-fun m!763851 () Bool)

(assert (=> d!104639 m!763851))

(declare-fun m!763853 () Bool)

(assert (=> d!104639 m!763853))

(declare-fun m!763855 () Bool)

(assert (=> d!104639 m!763855))

(declare-fun m!763857 () Bool)

(assert (=> d!104639 m!763857))

(declare-fun m!763859 () Bool)

(assert (=> b!822392 m!763859))

(declare-fun m!763861 () Bool)

(assert (=> b!822393 m!763861))

(assert (=> b!822333 d!104639))

(declare-fun b!822436 () Bool)

(declare-fun e!457287 () Unit!28096)

(declare-fun Unit!28098 () Unit!28096)

(assert (=> b!822436 (= e!457287 Unit!28098)))

(declare-fun bm!35739 () Bool)

(declare-fun call!35747 () Bool)

(declare-fun lt!370192 () ListLongMap!8645)

(assert (=> bm!35739 (= call!35747 (contains!4148 lt!370192 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!822437 () Bool)

(declare-fun res!560992 () Bool)

(declare-fun e!457290 () Bool)

(assert (=> b!822437 (=> (not res!560992) (not e!457290))))

(declare-fun e!457288 () Bool)

(assert (=> b!822437 (= res!560992 e!457288)))

(declare-fun c!89224 () Bool)

(assert (=> b!822437 (= c!89224 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!822438 () Bool)

(declare-fun e!457285 () Bool)

(assert (=> b!822438 (= e!457288 e!457285)))

(declare-fun res!560997 () Bool)

(declare-fun call!35748 () Bool)

(assert (=> b!822438 (= res!560997 call!35748)))

(assert (=> b!822438 (=> (not res!560997) (not e!457285))))

(declare-fun b!822439 () Bool)

(declare-fun e!457283 () ListLongMap!8645)

(declare-fun call!35745 () ListLongMap!8645)

(assert (=> b!822439 (= e!457283 (+!1917 call!35745 (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35740 () Bool)

(declare-fun call!35743 () ListLongMap!8645)

(declare-fun call!35742 () ListLongMap!8645)

(assert (=> bm!35740 (= call!35743 call!35742)))

(declare-fun bm!35741 () Bool)

(assert (=> bm!35741 (= call!35748 (contains!4148 lt!370192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35742 () Bool)

(assert (=> bm!35742 (= call!35742 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822440 () Bool)

(declare-fun apply!358 (ListLongMap!8645 (_ BitVec 64)) V!24715)

(assert (=> b!822440 (= e!457285 (= (apply!358 lt!370192 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun c!89223 () Bool)

(declare-fun call!35746 () ListLongMap!8645)

(declare-fun bm!35743 () Bool)

(declare-fun c!89220 () Bool)

(assert (=> bm!35743 (= call!35745 (+!1917 (ite c!89223 call!35742 (ite c!89220 call!35743 call!35746)) (ite (or c!89223 c!89220) (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!822441 () Bool)

(declare-fun e!457295 () ListLongMap!8645)

(declare-fun call!35744 () ListLongMap!8645)

(assert (=> b!822441 (= e!457295 call!35744)))

(declare-fun b!822442 () Bool)

(declare-fun e!457293 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!822442 (= e!457293 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35744 () Bool)

(assert (=> bm!35744 (= call!35746 call!35743)))

(declare-fun b!822443 () Bool)

(assert (=> b!822443 (= e!457288 (not call!35748))))

(declare-fun b!822444 () Bool)

(declare-fun e!457294 () Bool)

(declare-fun e!457291 () Bool)

(assert (=> b!822444 (= e!457294 e!457291)))

(declare-fun res!560994 () Bool)

(assert (=> b!822444 (= res!560994 call!35747)))

(assert (=> b!822444 (=> (not res!560994) (not e!457291))))

(declare-fun b!822445 () Bool)

(assert (=> b!822445 (= e!457290 e!457294)))

(declare-fun c!89222 () Bool)

(assert (=> b!822445 (= c!89222 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822446 () Bool)

(declare-fun e!457289 () ListLongMap!8645)

(assert (=> b!822446 (= e!457289 call!35746)))

(declare-fun b!822447 () Bool)

(declare-fun lt!370190 () Unit!28096)

(assert (=> b!822447 (= e!457287 lt!370190)))

(declare-fun lt!370182 () ListLongMap!8645)

(assert (=> b!822447 (= lt!370182 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370184 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370181 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370181 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370187 () Unit!28096)

(declare-fun addStillContains!311 (ListLongMap!8645 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28096)

(assert (=> b!822447 (= lt!370187 (addStillContains!311 lt!370182 lt!370184 zeroValueBefore!34 lt!370181))))

(assert (=> b!822447 (contains!4148 (+!1917 lt!370182 (tuple2!9833 lt!370184 zeroValueBefore!34)) lt!370181)))

(declare-fun lt!370180 () Unit!28096)

(assert (=> b!822447 (= lt!370180 lt!370187)))

(declare-fun lt!370175 () ListLongMap!8645)

(assert (=> b!822447 (= lt!370175 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370193 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370193 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370185 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370185 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370176 () Unit!28096)

(declare-fun addApplyDifferent!311 (ListLongMap!8645 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28096)

(assert (=> b!822447 (= lt!370176 (addApplyDifferent!311 lt!370175 lt!370193 minValue!754 lt!370185))))

(assert (=> b!822447 (= (apply!358 (+!1917 lt!370175 (tuple2!9833 lt!370193 minValue!754)) lt!370185) (apply!358 lt!370175 lt!370185))))

(declare-fun lt!370172 () Unit!28096)

(assert (=> b!822447 (= lt!370172 lt!370176)))

(declare-fun lt!370188 () ListLongMap!8645)

(assert (=> b!822447 (= lt!370188 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370191 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370189 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370189 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370173 () Unit!28096)

(assert (=> b!822447 (= lt!370173 (addApplyDifferent!311 lt!370188 lt!370191 zeroValueBefore!34 lt!370189))))

(assert (=> b!822447 (= (apply!358 (+!1917 lt!370188 (tuple2!9833 lt!370191 zeroValueBefore!34)) lt!370189) (apply!358 lt!370188 lt!370189))))

(declare-fun lt!370177 () Unit!28096)

(assert (=> b!822447 (= lt!370177 lt!370173)))

(declare-fun lt!370178 () ListLongMap!8645)

(assert (=> b!822447 (= lt!370178 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370179 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370179 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370174 () (_ BitVec 64))

(assert (=> b!822447 (= lt!370174 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822447 (= lt!370190 (addApplyDifferent!311 lt!370178 lt!370179 minValue!754 lt!370174))))

(assert (=> b!822447 (= (apply!358 (+!1917 lt!370178 (tuple2!9833 lt!370179 minValue!754)) lt!370174) (apply!358 lt!370178 lt!370174))))

(declare-fun b!822448 () Bool)

(declare-fun e!457284 () Bool)

(declare-fun e!457286 () Bool)

(assert (=> b!822448 (= e!457284 e!457286)))

(declare-fun res!561000 () Bool)

(assert (=> b!822448 (=> (not res!561000) (not e!457286))))

(assert (=> b!822448 (= res!561000 (contains!4148 lt!370192 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822449 () Bool)

(assert (=> b!822449 (= e!457294 (not call!35747))))

(declare-fun d!104641 () Bool)

(assert (=> d!104641 e!457290))

(declare-fun res!560996 () Bool)

(assert (=> d!104641 (=> (not res!560996) (not e!457290))))

(assert (=> d!104641 (= res!560996 (or (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))))

(declare-fun lt!370183 () ListLongMap!8645)

(assert (=> d!104641 (= lt!370192 lt!370183)))

(declare-fun lt!370186 () Unit!28096)

(assert (=> d!104641 (= lt!370186 e!457287)))

(declare-fun c!89221 () Bool)

(declare-fun e!457292 () Bool)

(assert (=> d!104641 (= c!89221 e!457292)))

(declare-fun res!560995 () Bool)

(assert (=> d!104641 (=> (not res!560995) (not e!457292))))

(assert (=> d!104641 (= res!560995 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104641 (= lt!370183 e!457283)))

(assert (=> d!104641 (= c!89223 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104641 (validMask!0 mask!1312)))

(assert (=> d!104641 (= (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370192)))

(declare-fun bm!35745 () Bool)

(assert (=> bm!35745 (= call!35744 call!35745)))

(declare-fun b!822450 () Bool)

(assert (=> b!822450 (= e!457292 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822451 () Bool)

(declare-fun c!89219 () Bool)

(assert (=> b!822451 (= c!89219 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!822451 (= e!457295 e!457289)))

(declare-fun b!822452 () Bool)

(assert (=> b!822452 (= e!457291 (= (apply!358 lt!370192 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!822453 () Bool)

(declare-fun get!11669 (ValueCell!6977 V!24715) V!24715)

(declare-fun dynLambda!972 (Int (_ BitVec 64)) V!24715)

(assert (=> b!822453 (= e!457286 (= (apply!358 lt!370192 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!822453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22338 _values!788)))))

(assert (=> b!822453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822454 () Bool)

(assert (=> b!822454 (= e!457289 call!35744)))

(declare-fun b!822455 () Bool)

(assert (=> b!822455 (= e!457283 e!457295)))

(assert (=> b!822455 (= c!89220 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822456 () Bool)

(declare-fun res!560999 () Bool)

(assert (=> b!822456 (=> (not res!560999) (not e!457290))))

(assert (=> b!822456 (= res!560999 e!457284)))

(declare-fun res!560993 () Bool)

(assert (=> b!822456 (=> res!560993 e!457284)))

(assert (=> b!822456 (= res!560993 (not e!457293))))

(declare-fun res!560998 () Bool)

(assert (=> b!822456 (=> (not res!560998) (not e!457293))))

(assert (=> b!822456 (= res!560998 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (= (and d!104641 c!89223) b!822439))

(assert (= (and d!104641 (not c!89223)) b!822455))

(assert (= (and b!822455 c!89220) b!822441))

(assert (= (and b!822455 (not c!89220)) b!822451))

(assert (= (and b!822451 c!89219) b!822454))

(assert (= (and b!822451 (not c!89219)) b!822446))

(assert (= (or b!822454 b!822446) bm!35744))

(assert (= (or b!822441 bm!35744) bm!35740))

(assert (= (or b!822441 b!822454) bm!35745))

(assert (= (or b!822439 bm!35740) bm!35742))

(assert (= (or b!822439 bm!35745) bm!35743))

(assert (= (and d!104641 res!560995) b!822450))

(assert (= (and d!104641 c!89221) b!822447))

(assert (= (and d!104641 (not c!89221)) b!822436))

(assert (= (and d!104641 res!560996) b!822456))

(assert (= (and b!822456 res!560998) b!822442))

(assert (= (and b!822456 (not res!560993)) b!822448))

(assert (= (and b!822448 res!561000) b!822453))

(assert (= (and b!822456 res!560999) b!822437))

(assert (= (and b!822437 c!89224) b!822438))

(assert (= (and b!822437 (not c!89224)) b!822443))

(assert (= (and b!822438 res!560997) b!822440))

(assert (= (or b!822438 b!822443) bm!35741))

(assert (= (and b!822437 res!560992) b!822445))

(assert (= (and b!822445 c!89222) b!822444))

(assert (= (and b!822445 (not c!89222)) b!822449))

(assert (= (and b!822444 res!560994) b!822452))

(assert (= (or b!822444 b!822449) bm!35739))

(declare-fun b_lambda!11013 () Bool)

(assert (=> (not b_lambda!11013) (not b!822453)))

(declare-fun t!21976 () Bool)

(declare-fun tb!4189 () Bool)

(assert (=> (and start!70798 (= defaultEntry!796 defaultEntry!796) t!21976) tb!4189))

(declare-fun result!7923 () Bool)

(assert (=> tb!4189 (= result!7923 tp_is_empty!14785)))

(assert (=> b!822453 t!21976))

(declare-fun b_and!21927 () Bool)

(assert (= b_and!21921 (and (=> t!21976 result!7923) b_and!21927)))

(declare-fun m!763863 () Bool)

(assert (=> bm!35739 m!763863))

(declare-fun m!763865 () Bool)

(assert (=> b!822439 m!763865))

(declare-fun m!763867 () Bool)

(assert (=> b!822452 m!763867))

(declare-fun m!763869 () Bool)

(assert (=> b!822448 m!763869))

(assert (=> b!822448 m!763869))

(declare-fun m!763871 () Bool)

(assert (=> b!822448 m!763871))

(assert (=> d!104641 m!763747))

(assert (=> b!822442 m!763869))

(assert (=> b!822442 m!763869))

(declare-fun m!763873 () Bool)

(assert (=> b!822442 m!763873))

(declare-fun m!763875 () Bool)

(assert (=> bm!35743 m!763875))

(assert (=> b!822450 m!763869))

(assert (=> b!822450 m!763869))

(assert (=> b!822450 m!763873))

(assert (=> bm!35742 m!763743))

(declare-fun m!763877 () Bool)

(assert (=> bm!35741 m!763877))

(declare-fun m!763879 () Bool)

(assert (=> b!822447 m!763879))

(declare-fun m!763881 () Bool)

(assert (=> b!822447 m!763881))

(declare-fun m!763883 () Bool)

(assert (=> b!822447 m!763883))

(declare-fun m!763885 () Bool)

(assert (=> b!822447 m!763885))

(declare-fun m!763887 () Bool)

(assert (=> b!822447 m!763887))

(assert (=> b!822447 m!763885))

(assert (=> b!822447 m!763743))

(assert (=> b!822447 m!763869))

(declare-fun m!763889 () Bool)

(assert (=> b!822447 m!763889))

(declare-fun m!763891 () Bool)

(assert (=> b!822447 m!763891))

(declare-fun m!763893 () Bool)

(assert (=> b!822447 m!763893))

(assert (=> b!822447 m!763879))

(declare-fun m!763895 () Bool)

(assert (=> b!822447 m!763895))

(declare-fun m!763897 () Bool)

(assert (=> b!822447 m!763897))

(declare-fun m!763899 () Bool)

(assert (=> b!822447 m!763899))

(declare-fun m!763901 () Bool)

(assert (=> b!822447 m!763901))

(declare-fun m!763903 () Bool)

(assert (=> b!822447 m!763903))

(assert (=> b!822447 m!763881))

(declare-fun m!763905 () Bool)

(assert (=> b!822447 m!763905))

(assert (=> b!822447 m!763891))

(declare-fun m!763907 () Bool)

(assert (=> b!822447 m!763907))

(declare-fun m!763909 () Bool)

(assert (=> b!822440 m!763909))

(declare-fun m!763911 () Bool)

(assert (=> b!822453 m!763911))

(declare-fun m!763913 () Bool)

(assert (=> b!822453 m!763913))

(assert (=> b!822453 m!763911))

(declare-fun m!763915 () Bool)

(assert (=> b!822453 m!763915))

(assert (=> b!822453 m!763869))

(declare-fun m!763917 () Bool)

(assert (=> b!822453 m!763917))

(assert (=> b!822453 m!763869))

(assert (=> b!822453 m!763913))

(assert (=> b!822333 d!104641))

(declare-fun b!822459 () Bool)

(declare-fun e!457300 () Unit!28096)

(declare-fun Unit!28099 () Unit!28096)

(assert (=> b!822459 (= e!457300 Unit!28099)))

(declare-fun bm!35746 () Bool)

(declare-fun call!35754 () Bool)

(declare-fun lt!370214 () ListLongMap!8645)

(assert (=> bm!35746 (= call!35754 (contains!4148 lt!370214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!822460 () Bool)

(declare-fun res!561001 () Bool)

(declare-fun e!457303 () Bool)

(assert (=> b!822460 (=> (not res!561001) (not e!457303))))

(declare-fun e!457301 () Bool)

(assert (=> b!822460 (= res!561001 e!457301)))

(declare-fun c!89230 () Bool)

(assert (=> b!822460 (= c!89230 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!822461 () Bool)

(declare-fun e!457298 () Bool)

(assert (=> b!822461 (= e!457301 e!457298)))

(declare-fun res!561006 () Bool)

(declare-fun call!35755 () Bool)

(assert (=> b!822461 (= res!561006 call!35755)))

(assert (=> b!822461 (=> (not res!561006) (not e!457298))))

(declare-fun b!822462 () Bool)

(declare-fun e!457296 () ListLongMap!8645)

(declare-fun call!35752 () ListLongMap!8645)

(assert (=> b!822462 (= e!457296 (+!1917 call!35752 (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35747 () Bool)

(declare-fun call!35750 () ListLongMap!8645)

(declare-fun call!35749 () ListLongMap!8645)

(assert (=> bm!35747 (= call!35750 call!35749)))

(declare-fun bm!35748 () Bool)

(assert (=> bm!35748 (= call!35755 (contains!4148 lt!370214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35749 () Bool)

(assert (=> bm!35749 (= call!35749 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822463 () Bool)

(assert (=> b!822463 (= e!457298 (= (apply!358 lt!370214 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun c!89226 () Bool)

(declare-fun call!35753 () ListLongMap!8645)

(declare-fun bm!35750 () Bool)

(declare-fun c!89229 () Bool)

(assert (=> bm!35750 (= call!35752 (+!1917 (ite c!89229 call!35749 (ite c!89226 call!35750 call!35753)) (ite (or c!89229 c!89226) (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!822464 () Bool)

(declare-fun e!457308 () ListLongMap!8645)

(declare-fun call!35751 () ListLongMap!8645)

(assert (=> b!822464 (= e!457308 call!35751)))

(declare-fun b!822465 () Bool)

(declare-fun e!457306 () Bool)

(assert (=> b!822465 (= e!457306 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35751 () Bool)

(assert (=> bm!35751 (= call!35753 call!35750)))

(declare-fun b!822466 () Bool)

(assert (=> b!822466 (= e!457301 (not call!35755))))

(declare-fun b!822467 () Bool)

(declare-fun e!457307 () Bool)

(declare-fun e!457304 () Bool)

(assert (=> b!822467 (= e!457307 e!457304)))

(declare-fun res!561003 () Bool)

(assert (=> b!822467 (= res!561003 call!35754)))

(assert (=> b!822467 (=> (not res!561003) (not e!457304))))

(declare-fun b!822468 () Bool)

(assert (=> b!822468 (= e!457303 e!457307)))

(declare-fun c!89228 () Bool)

(assert (=> b!822468 (= c!89228 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822469 () Bool)

(declare-fun e!457302 () ListLongMap!8645)

(assert (=> b!822469 (= e!457302 call!35753)))

(declare-fun b!822470 () Bool)

(declare-fun lt!370212 () Unit!28096)

(assert (=> b!822470 (= e!457300 lt!370212)))

(declare-fun lt!370204 () ListLongMap!8645)

(assert (=> b!822470 (= lt!370204 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370206 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370203 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370203 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370209 () Unit!28096)

(assert (=> b!822470 (= lt!370209 (addStillContains!311 lt!370204 lt!370206 zeroValueAfter!34 lt!370203))))

(assert (=> b!822470 (contains!4148 (+!1917 lt!370204 (tuple2!9833 lt!370206 zeroValueAfter!34)) lt!370203)))

(declare-fun lt!370202 () Unit!28096)

(assert (=> b!822470 (= lt!370202 lt!370209)))

(declare-fun lt!370197 () ListLongMap!8645)

(assert (=> b!822470 (= lt!370197 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370215 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370215 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370207 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370207 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370198 () Unit!28096)

(assert (=> b!822470 (= lt!370198 (addApplyDifferent!311 lt!370197 lt!370215 minValue!754 lt!370207))))

(assert (=> b!822470 (= (apply!358 (+!1917 lt!370197 (tuple2!9833 lt!370215 minValue!754)) lt!370207) (apply!358 lt!370197 lt!370207))))

(declare-fun lt!370194 () Unit!28096)

(assert (=> b!822470 (= lt!370194 lt!370198)))

(declare-fun lt!370210 () ListLongMap!8645)

(assert (=> b!822470 (= lt!370210 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370213 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370211 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370211 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370195 () Unit!28096)

(assert (=> b!822470 (= lt!370195 (addApplyDifferent!311 lt!370210 lt!370213 zeroValueAfter!34 lt!370211))))

(assert (=> b!822470 (= (apply!358 (+!1917 lt!370210 (tuple2!9833 lt!370213 zeroValueAfter!34)) lt!370211) (apply!358 lt!370210 lt!370211))))

(declare-fun lt!370199 () Unit!28096)

(assert (=> b!822470 (= lt!370199 lt!370195)))

(declare-fun lt!370200 () ListLongMap!8645)

(assert (=> b!822470 (= lt!370200 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370201 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370196 () (_ BitVec 64))

(assert (=> b!822470 (= lt!370196 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822470 (= lt!370212 (addApplyDifferent!311 lt!370200 lt!370201 minValue!754 lt!370196))))

(assert (=> b!822470 (= (apply!358 (+!1917 lt!370200 (tuple2!9833 lt!370201 minValue!754)) lt!370196) (apply!358 lt!370200 lt!370196))))

(declare-fun b!822471 () Bool)

(declare-fun e!457297 () Bool)

(declare-fun e!457299 () Bool)

(assert (=> b!822471 (= e!457297 e!457299)))

(declare-fun res!561009 () Bool)

(assert (=> b!822471 (=> (not res!561009) (not e!457299))))

(assert (=> b!822471 (= res!561009 (contains!4148 lt!370214 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822472 () Bool)

(assert (=> b!822472 (= e!457307 (not call!35754))))

(declare-fun d!104643 () Bool)

(assert (=> d!104643 e!457303))

(declare-fun res!561005 () Bool)

(assert (=> d!104643 (=> (not res!561005) (not e!457303))))

(assert (=> d!104643 (= res!561005 (or (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))))

(declare-fun lt!370205 () ListLongMap!8645)

(assert (=> d!104643 (= lt!370214 lt!370205)))

(declare-fun lt!370208 () Unit!28096)

(assert (=> d!104643 (= lt!370208 e!457300)))

(declare-fun c!89227 () Bool)

(declare-fun e!457305 () Bool)

(assert (=> d!104643 (= c!89227 e!457305)))

(declare-fun res!561004 () Bool)

(assert (=> d!104643 (=> (not res!561004) (not e!457305))))

(assert (=> d!104643 (= res!561004 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104643 (= lt!370205 e!457296)))

(assert (=> d!104643 (= c!89229 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104643 (validMask!0 mask!1312)))

(assert (=> d!104643 (= (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370214)))

(declare-fun bm!35752 () Bool)

(assert (=> bm!35752 (= call!35751 call!35752)))

(declare-fun b!822473 () Bool)

(assert (=> b!822473 (= e!457305 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822474 () Bool)

(declare-fun c!89225 () Bool)

(assert (=> b!822474 (= c!89225 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!822474 (= e!457308 e!457302)))

(declare-fun b!822475 () Bool)

(assert (=> b!822475 (= e!457304 (= (apply!358 lt!370214 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!822476 () Bool)

(assert (=> b!822476 (= e!457299 (= (apply!358 lt!370214 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!822476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22338 _values!788)))))

(assert (=> b!822476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822477 () Bool)

(assert (=> b!822477 (= e!457302 call!35751)))

(declare-fun b!822478 () Bool)

(assert (=> b!822478 (= e!457296 e!457308)))

(assert (=> b!822478 (= c!89226 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822479 () Bool)

(declare-fun res!561008 () Bool)

(assert (=> b!822479 (=> (not res!561008) (not e!457303))))

(assert (=> b!822479 (= res!561008 e!457297)))

(declare-fun res!561002 () Bool)

(assert (=> b!822479 (=> res!561002 e!457297)))

(assert (=> b!822479 (= res!561002 (not e!457306))))

(declare-fun res!561007 () Bool)

(assert (=> b!822479 (=> (not res!561007) (not e!457306))))

(assert (=> b!822479 (= res!561007 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (= (and d!104643 c!89229) b!822462))

(assert (= (and d!104643 (not c!89229)) b!822478))

(assert (= (and b!822478 c!89226) b!822464))

(assert (= (and b!822478 (not c!89226)) b!822474))

(assert (= (and b!822474 c!89225) b!822477))

(assert (= (and b!822474 (not c!89225)) b!822469))

(assert (= (or b!822477 b!822469) bm!35751))

(assert (= (or b!822464 bm!35751) bm!35747))

(assert (= (or b!822464 b!822477) bm!35752))

(assert (= (or b!822462 bm!35747) bm!35749))

(assert (= (or b!822462 bm!35752) bm!35750))

(assert (= (and d!104643 res!561004) b!822473))

(assert (= (and d!104643 c!89227) b!822470))

(assert (= (and d!104643 (not c!89227)) b!822459))

(assert (= (and d!104643 res!561005) b!822479))

(assert (= (and b!822479 res!561007) b!822465))

(assert (= (and b!822479 (not res!561002)) b!822471))

(assert (= (and b!822471 res!561009) b!822476))

(assert (= (and b!822479 res!561008) b!822460))

(assert (= (and b!822460 c!89230) b!822461))

(assert (= (and b!822460 (not c!89230)) b!822466))

(assert (= (and b!822461 res!561006) b!822463))

(assert (= (or b!822461 b!822466) bm!35748))

(assert (= (and b!822460 res!561001) b!822468))

(assert (= (and b!822468 c!89228) b!822467))

(assert (= (and b!822468 (not c!89228)) b!822472))

(assert (= (and b!822467 res!561003) b!822475))

(assert (= (or b!822467 b!822472) bm!35746))

(declare-fun b_lambda!11015 () Bool)

(assert (=> (not b_lambda!11015) (not b!822476)))

(assert (=> b!822476 t!21976))

(declare-fun b_and!21929 () Bool)

(assert (= b_and!21927 (and (=> t!21976 result!7923) b_and!21929)))

(declare-fun m!763919 () Bool)

(assert (=> bm!35746 m!763919))

(declare-fun m!763921 () Bool)

(assert (=> b!822462 m!763921))

(declare-fun m!763923 () Bool)

(assert (=> b!822475 m!763923))

(assert (=> b!822471 m!763869))

(assert (=> b!822471 m!763869))

(declare-fun m!763925 () Bool)

(assert (=> b!822471 m!763925))

(assert (=> d!104643 m!763747))

(assert (=> b!822465 m!763869))

(assert (=> b!822465 m!763869))

(assert (=> b!822465 m!763873))

(declare-fun m!763927 () Bool)

(assert (=> bm!35750 m!763927))

(assert (=> b!822473 m!763869))

(assert (=> b!822473 m!763869))

(assert (=> b!822473 m!763873))

(assert (=> bm!35749 m!763741))

(declare-fun m!763929 () Bool)

(assert (=> bm!35748 m!763929))

(declare-fun m!763931 () Bool)

(assert (=> b!822470 m!763931))

(declare-fun m!763933 () Bool)

(assert (=> b!822470 m!763933))

(declare-fun m!763935 () Bool)

(assert (=> b!822470 m!763935))

(declare-fun m!763937 () Bool)

(assert (=> b!822470 m!763937))

(declare-fun m!763939 () Bool)

(assert (=> b!822470 m!763939))

(assert (=> b!822470 m!763937))

(assert (=> b!822470 m!763741))

(assert (=> b!822470 m!763869))

(declare-fun m!763941 () Bool)

(assert (=> b!822470 m!763941))

(declare-fun m!763943 () Bool)

(assert (=> b!822470 m!763943))

(declare-fun m!763945 () Bool)

(assert (=> b!822470 m!763945))

(assert (=> b!822470 m!763931))

(declare-fun m!763947 () Bool)

(assert (=> b!822470 m!763947))

(declare-fun m!763949 () Bool)

(assert (=> b!822470 m!763949))

(declare-fun m!763951 () Bool)

(assert (=> b!822470 m!763951))

(declare-fun m!763953 () Bool)

(assert (=> b!822470 m!763953))

(declare-fun m!763955 () Bool)

(assert (=> b!822470 m!763955))

(assert (=> b!822470 m!763933))

(declare-fun m!763957 () Bool)

(assert (=> b!822470 m!763957))

(assert (=> b!822470 m!763943))

(declare-fun m!763959 () Bool)

(assert (=> b!822470 m!763959))

(declare-fun m!763961 () Bool)

(assert (=> b!822463 m!763961))

(assert (=> b!822476 m!763911))

(assert (=> b!822476 m!763913))

(assert (=> b!822476 m!763911))

(assert (=> b!822476 m!763915))

(assert (=> b!822476 m!763869))

(declare-fun m!763963 () Bool)

(assert (=> b!822476 m!763963))

(assert (=> b!822476 m!763869))

(assert (=> b!822476 m!763913))

(assert (=> b!822333 d!104643))

(declare-fun d!104645 () Bool)

(declare-fun e!457309 () Bool)

(assert (=> d!104645 e!457309))

(declare-fun res!561011 () Bool)

(assert (=> d!104645 (=> (not res!561011) (not e!457309))))

(declare-fun lt!370217 () ListLongMap!8645)

(assert (=> d!104645 (= res!561011 (contains!4148 lt!370217 (_1!4927 lt!370035)))))

(declare-fun lt!370216 () List!15644)

(assert (=> d!104645 (= lt!370217 (ListLongMap!8646 lt!370216))))

(declare-fun lt!370219 () Unit!28096)

(declare-fun lt!370218 () Unit!28096)

(assert (=> d!104645 (= lt!370219 lt!370218)))

(assert (=> d!104645 (= (getValueByKey!402 lt!370216 (_1!4927 lt!370035)) (Some!407 (_2!4927 lt!370035)))))

(assert (=> d!104645 (= lt!370218 (lemmaContainsTupThenGetReturnValue!219 lt!370216 (_1!4927 lt!370035) (_2!4927 lt!370035)))))

(assert (=> d!104645 (= lt!370216 (insertStrictlySorted!258 (toList!4338 lt!370044) (_1!4927 lt!370035) (_2!4927 lt!370035)))))

(assert (=> d!104645 (= (+!1917 lt!370044 lt!370035) lt!370217)))

(declare-fun b!822480 () Bool)

(declare-fun res!561010 () Bool)

(assert (=> b!822480 (=> (not res!561010) (not e!457309))))

(assert (=> b!822480 (= res!561010 (= (getValueByKey!402 (toList!4338 lt!370217) (_1!4927 lt!370035)) (Some!407 (_2!4927 lt!370035))))))

(declare-fun b!822481 () Bool)

(assert (=> b!822481 (= e!457309 (contains!4149 (toList!4338 lt!370217) lt!370035))))

(assert (= (and d!104645 res!561011) b!822480))

(assert (= (and b!822480 res!561010) b!822481))

(declare-fun m!763965 () Bool)

(assert (=> d!104645 m!763965))

(declare-fun m!763967 () Bool)

(assert (=> d!104645 m!763967))

(declare-fun m!763969 () Bool)

(assert (=> d!104645 m!763969))

(declare-fun m!763971 () Bool)

(assert (=> d!104645 m!763971))

(declare-fun m!763973 () Bool)

(assert (=> b!822480 m!763973))

(declare-fun m!763975 () Bool)

(assert (=> b!822481 m!763975))

(assert (=> b!822333 d!104645))

(declare-fun b!822490 () Bool)

(declare-fun e!457317 () Bool)

(declare-fun call!35758 () Bool)

(assert (=> b!822490 (= e!457317 call!35758)))

(declare-fun d!104647 () Bool)

(declare-fun res!561016 () Bool)

(declare-fun e!457318 () Bool)

(assert (=> d!104647 (=> res!561016 e!457318)))

(assert (=> d!104647 (= res!561016 (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!457318)))

(declare-fun b!822491 () Bool)

(assert (=> b!822491 (= e!457318 e!457317)))

(declare-fun c!89233 () Bool)

(assert (=> b!822491 (= c!89233 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822492 () Bool)

(declare-fun e!457316 () Bool)

(assert (=> b!822492 (= e!457316 call!35758)))

(declare-fun bm!35755 () Bool)

(assert (=> bm!35755 (= call!35758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!822493 () Bool)

(assert (=> b!822493 (= e!457317 e!457316)))

(declare-fun lt!370227 () (_ BitVec 64))

(assert (=> b!822493 (= lt!370227 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370226 () Unit!28096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45731 (_ BitVec 64) (_ BitVec 32)) Unit!28096)

(assert (=> b!822493 (= lt!370226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!370227 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!822493 (arrayContainsKey!0 _keys!976 lt!370227 #b00000000000000000000000000000000)))

(declare-fun lt!370228 () Unit!28096)

(assert (=> b!822493 (= lt!370228 lt!370226)))

(declare-fun res!561017 () Bool)

(declare-datatypes ((SeekEntryResult!8726 0))(
  ( (MissingZero!8726 (index!37275 (_ BitVec 32))) (Found!8726 (index!37276 (_ BitVec 32))) (Intermediate!8726 (undefined!9538 Bool) (index!37277 (_ BitVec 32)) (x!69372 (_ BitVec 32))) (Undefined!8726) (MissingVacant!8726 (index!37278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45731 (_ BitVec 32)) SeekEntryResult!8726)

(assert (=> b!822493 (= res!561017 (= (seekEntryOrOpen!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8726 #b00000000000000000000000000000000)))))

(assert (=> b!822493 (=> (not res!561017) (not e!457316))))

(assert (= (and d!104647 (not res!561016)) b!822491))

(assert (= (and b!822491 c!89233) b!822493))

(assert (= (and b!822491 (not c!89233)) b!822490))

(assert (= (and b!822493 res!561017) b!822492))

(assert (= (or b!822492 b!822490) bm!35755))

(assert (=> b!822491 m!763869))

(assert (=> b!822491 m!763869))

(assert (=> b!822491 m!763873))

(declare-fun m!763977 () Bool)

(assert (=> bm!35755 m!763977))

(assert (=> b!822493 m!763869))

(declare-fun m!763979 () Bool)

(assert (=> b!822493 m!763979))

(declare-fun m!763981 () Bool)

(assert (=> b!822493 m!763981))

(assert (=> b!822493 m!763869))

(declare-fun m!763983 () Bool)

(assert (=> b!822493 m!763983))

(assert (=> b!822328 d!104647))

(declare-fun d!104649 () Bool)

(assert (=> d!104649 (= (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370231 () Unit!28096)

(declare-fun choose!1409 (array!45731 array!45733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 V!24715 V!24715 (_ BitVec 32) Int) Unit!28096)

(assert (=> d!104649 (= lt!370231 (choose!1409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104649 (validMask!0 mask!1312)))

(assert (=> d!104649 (= (lemmaNoChangeToArrayThenSameMapNoExtras!477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370231)))

(declare-fun bs!22926 () Bool)

(assert (= bs!22926 d!104649))

(assert (=> bs!22926 m!763743))

(assert (=> bs!22926 m!763741))

(declare-fun m!763985 () Bool)

(assert (=> bs!22926 m!763985))

(assert (=> bs!22926 m!763747))

(assert (=> b!822331 d!104649))

(declare-fun call!35761 () ListLongMap!8645)

(declare-fun bm!35758 () Bool)

(assert (=> bm!35758 (= call!35761 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822518 () Bool)

(declare-fun e!457339 () ListLongMap!8645)

(assert (=> b!822518 (= e!457339 (ListLongMap!8646 Nil!15641))))

(declare-fun b!822519 () Bool)

(declare-fun e!457333 () Bool)

(declare-fun e!457336 () Bool)

(assert (=> b!822519 (= e!457333 e!457336)))

(assert (=> b!822519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun res!561027 () Bool)

(declare-fun lt!370247 () ListLongMap!8645)

(assert (=> b!822519 (= res!561027 (contains!4148 lt!370247 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822519 (=> (not res!561027) (not e!457336))))

(declare-fun b!822520 () Bool)

(declare-fun lt!370250 () Unit!28096)

(declare-fun lt!370251 () Unit!28096)

(assert (=> b!822520 (= lt!370250 lt!370251)))

(declare-fun lt!370249 () V!24715)

(declare-fun lt!370248 () (_ BitVec 64))

(declare-fun lt!370246 () ListLongMap!8645)

(declare-fun lt!370252 () (_ BitVec 64))

(assert (=> b!822520 (not (contains!4148 (+!1917 lt!370246 (tuple2!9833 lt!370248 lt!370249)) lt!370252))))

(declare-fun addStillNotContains!184 (ListLongMap!8645 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28096)

(assert (=> b!822520 (= lt!370251 (addStillNotContains!184 lt!370246 lt!370248 lt!370249 lt!370252))))

(assert (=> b!822520 (= lt!370252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!822520 (= lt!370249 (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822520 (= lt!370248 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822520 (= lt!370246 call!35761)))

(declare-fun e!457338 () ListLongMap!8645)

(assert (=> b!822520 (= e!457338 (+!1917 call!35761 (tuple2!9833 (select (arr!21916 _keys!976) #b00000000000000000000000000000000) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822521 () Bool)

(declare-fun e!457334 () Bool)

(assert (=> b!822521 (= e!457334 e!457333)))

(declare-fun c!89243 () Bool)

(declare-fun e!457335 () Bool)

(assert (=> b!822521 (= c!89243 e!457335)))

(declare-fun res!561026 () Bool)

(assert (=> b!822521 (=> (not res!561026) (not e!457335))))

(assert (=> b!822521 (= res!561026 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822522 () Bool)

(assert (=> b!822522 (= e!457339 e!457338)))

(declare-fun c!89244 () Bool)

(assert (=> b!822522 (= c!89244 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822523 () Bool)

(declare-fun e!457337 () Bool)

(declare-fun isEmpty!645 (ListLongMap!8645) Bool)

(assert (=> b!822523 (= e!457337 (isEmpty!645 lt!370247))))

(declare-fun d!104651 () Bool)

(assert (=> d!104651 e!457334))

(declare-fun res!561029 () Bool)

(assert (=> d!104651 (=> (not res!561029) (not e!457334))))

(assert (=> d!104651 (= res!561029 (not (contains!4148 lt!370247 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104651 (= lt!370247 e!457339)))

(declare-fun c!89242 () Bool)

(assert (=> d!104651 (= c!89242 (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104651 (validMask!0 mask!1312)))

(assert (=> d!104651 (= (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370247)))

(declare-fun b!822524 () Bool)

(assert (=> b!822524 (= e!457337 (= lt!370247 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!822525 () Bool)

(declare-fun res!561028 () Bool)

(assert (=> b!822525 (=> (not res!561028) (not e!457334))))

(assert (=> b!822525 (= res!561028 (not (contains!4148 lt!370247 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!822526 () Bool)

(assert (=> b!822526 (= e!457335 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822526 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!822527 () Bool)

(assert (=> b!822527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> b!822527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22338 _values!788)))))

(assert (=> b!822527 (= e!457336 (= (apply!358 lt!370247 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822528 () Bool)

(assert (=> b!822528 (= e!457333 e!457337)))

(declare-fun c!89245 () Bool)

(assert (=> b!822528 (= c!89245 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822529 () Bool)

(assert (=> b!822529 (= e!457338 call!35761)))

(assert (= (and d!104651 c!89242) b!822518))

(assert (= (and d!104651 (not c!89242)) b!822522))

(assert (= (and b!822522 c!89244) b!822520))

(assert (= (and b!822522 (not c!89244)) b!822529))

(assert (= (or b!822520 b!822529) bm!35758))

(assert (= (and d!104651 res!561029) b!822525))

(assert (= (and b!822525 res!561028) b!822521))

(assert (= (and b!822521 res!561026) b!822526))

(assert (= (and b!822521 c!89243) b!822519))

(assert (= (and b!822521 (not c!89243)) b!822528))

(assert (= (and b!822519 res!561027) b!822527))

(assert (= (and b!822528 c!89245) b!822524))

(assert (= (and b!822528 (not c!89245)) b!822523))

(declare-fun b_lambda!11017 () Bool)

(assert (=> (not b_lambda!11017) (not b!822520)))

(assert (=> b!822520 t!21976))

(declare-fun b_and!21931 () Bool)

(assert (= b_and!21929 (and (=> t!21976 result!7923) b_and!21931)))

(declare-fun b_lambda!11019 () Bool)

(assert (=> (not b_lambda!11019) (not b!822527)))

(assert (=> b!822527 t!21976))

(declare-fun b_and!21933 () Bool)

(assert (= b_and!21931 (and (=> t!21976 result!7923) b_and!21933)))

(assert (=> b!822526 m!763869))

(assert (=> b!822526 m!763869))

(assert (=> b!822526 m!763873))

(assert (=> b!822527 m!763911))

(assert (=> b!822527 m!763869))

(assert (=> b!822527 m!763869))

(declare-fun m!763987 () Bool)

(assert (=> b!822527 m!763987))

(assert (=> b!822527 m!763913))

(assert (=> b!822527 m!763911))

(assert (=> b!822527 m!763915))

(assert (=> b!822527 m!763913))

(assert (=> b!822522 m!763869))

(assert (=> b!822522 m!763869))

(assert (=> b!822522 m!763873))

(declare-fun m!763989 () Bool)

(assert (=> b!822520 m!763989))

(assert (=> b!822520 m!763869))

(declare-fun m!763991 () Bool)

(assert (=> b!822520 m!763991))

(assert (=> b!822520 m!763991))

(declare-fun m!763993 () Bool)

(assert (=> b!822520 m!763993))

(declare-fun m!763995 () Bool)

(assert (=> b!822520 m!763995))

(assert (=> b!822520 m!763911))

(assert (=> b!822520 m!763913))

(assert (=> b!822520 m!763911))

(assert (=> b!822520 m!763915))

(assert (=> b!822520 m!763913))

(declare-fun m!763997 () Bool)

(assert (=> b!822525 m!763997))

(declare-fun m!763999 () Bool)

(assert (=> bm!35758 m!763999))

(assert (=> b!822519 m!763869))

(assert (=> b!822519 m!763869))

(declare-fun m!764001 () Bool)

(assert (=> b!822519 m!764001))

(declare-fun m!764003 () Bool)

(assert (=> b!822523 m!764003))

(assert (=> b!822524 m!763999))

(declare-fun m!764005 () Bool)

(assert (=> d!104651 m!764005))

(assert (=> d!104651 m!763747))

(assert (=> b!822331 d!104651))

(declare-fun bm!35759 () Bool)

(declare-fun call!35762 () ListLongMap!8645)

(assert (=> bm!35759 (= call!35762 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822530 () Bool)

(declare-fun e!457346 () ListLongMap!8645)

(assert (=> b!822530 (= e!457346 (ListLongMap!8646 Nil!15641))))

(declare-fun b!822531 () Bool)

(declare-fun e!457340 () Bool)

(declare-fun e!457343 () Bool)

(assert (=> b!822531 (= e!457340 e!457343)))

(assert (=> b!822531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun res!561031 () Bool)

(declare-fun lt!370254 () ListLongMap!8645)

(assert (=> b!822531 (= res!561031 (contains!4148 lt!370254 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822531 (=> (not res!561031) (not e!457343))))

(declare-fun b!822532 () Bool)

(declare-fun lt!370257 () Unit!28096)

(declare-fun lt!370258 () Unit!28096)

(assert (=> b!822532 (= lt!370257 lt!370258)))

(declare-fun lt!370253 () ListLongMap!8645)

(declare-fun lt!370255 () (_ BitVec 64))

(declare-fun lt!370259 () (_ BitVec 64))

(declare-fun lt!370256 () V!24715)

(assert (=> b!822532 (not (contains!4148 (+!1917 lt!370253 (tuple2!9833 lt!370255 lt!370256)) lt!370259))))

(assert (=> b!822532 (= lt!370258 (addStillNotContains!184 lt!370253 lt!370255 lt!370256 lt!370259))))

(assert (=> b!822532 (= lt!370259 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!822532 (= lt!370256 (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822532 (= lt!370255 (select (arr!21916 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822532 (= lt!370253 call!35762)))

(declare-fun e!457345 () ListLongMap!8645)

(assert (=> b!822532 (= e!457345 (+!1917 call!35762 (tuple2!9833 (select (arr!21916 _keys!976) #b00000000000000000000000000000000) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822533 () Bool)

(declare-fun e!457341 () Bool)

(assert (=> b!822533 (= e!457341 e!457340)))

(declare-fun c!89247 () Bool)

(declare-fun e!457342 () Bool)

(assert (=> b!822533 (= c!89247 e!457342)))

(declare-fun res!561030 () Bool)

(assert (=> b!822533 (=> (not res!561030) (not e!457342))))

(assert (=> b!822533 (= res!561030 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822534 () Bool)

(assert (=> b!822534 (= e!457346 e!457345)))

(declare-fun c!89248 () Bool)

(assert (=> b!822534 (= c!89248 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822535 () Bool)

(declare-fun e!457344 () Bool)

(assert (=> b!822535 (= e!457344 (isEmpty!645 lt!370254))))

(declare-fun d!104653 () Bool)

(assert (=> d!104653 e!457341))

(declare-fun res!561033 () Bool)

(assert (=> d!104653 (=> (not res!561033) (not e!457341))))

(assert (=> d!104653 (= res!561033 (not (contains!4148 lt!370254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104653 (= lt!370254 e!457346)))

(declare-fun c!89246 () Bool)

(assert (=> d!104653 (= c!89246 (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104653 (validMask!0 mask!1312)))

(assert (=> d!104653 (= (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370254)))

(declare-fun b!822536 () Bool)

(assert (=> b!822536 (= e!457344 (= lt!370254 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!822537 () Bool)

(declare-fun res!561032 () Bool)

(assert (=> b!822537 (=> (not res!561032) (not e!457341))))

(assert (=> b!822537 (= res!561032 (not (contains!4148 lt!370254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!822538 () Bool)

(assert (=> b!822538 (= e!457342 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822538 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!822539 () Bool)

(assert (=> b!822539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> b!822539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22338 _values!788)))))

(assert (=> b!822539 (= e!457343 (= (apply!358 lt!370254 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)) (get!11669 (select (arr!21917 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822540 () Bool)

(assert (=> b!822540 (= e!457340 e!457344)))

(declare-fun c!89249 () Bool)

(assert (=> b!822540 (= c!89249 (bvslt #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(declare-fun b!822541 () Bool)

(assert (=> b!822541 (= e!457345 call!35762)))

(assert (= (and d!104653 c!89246) b!822530))

(assert (= (and d!104653 (not c!89246)) b!822534))

(assert (= (and b!822534 c!89248) b!822532))

(assert (= (and b!822534 (not c!89248)) b!822541))

(assert (= (or b!822532 b!822541) bm!35759))

(assert (= (and d!104653 res!561033) b!822537))

(assert (= (and b!822537 res!561032) b!822533))

(assert (= (and b!822533 res!561030) b!822538))

(assert (= (and b!822533 c!89247) b!822531))

(assert (= (and b!822533 (not c!89247)) b!822540))

(assert (= (and b!822531 res!561031) b!822539))

(assert (= (and b!822540 c!89249) b!822536))

(assert (= (and b!822540 (not c!89249)) b!822535))

(declare-fun b_lambda!11021 () Bool)

(assert (=> (not b_lambda!11021) (not b!822532)))

(assert (=> b!822532 t!21976))

(declare-fun b_and!21935 () Bool)

(assert (= b_and!21933 (and (=> t!21976 result!7923) b_and!21935)))

(declare-fun b_lambda!11023 () Bool)

(assert (=> (not b_lambda!11023) (not b!822539)))

(assert (=> b!822539 t!21976))

(declare-fun b_and!21937 () Bool)

(assert (= b_and!21935 (and (=> t!21976 result!7923) b_and!21937)))

(assert (=> b!822538 m!763869))

(assert (=> b!822538 m!763869))

(assert (=> b!822538 m!763873))

(assert (=> b!822539 m!763911))

(assert (=> b!822539 m!763869))

(assert (=> b!822539 m!763869))

(declare-fun m!764007 () Bool)

(assert (=> b!822539 m!764007))

(assert (=> b!822539 m!763913))

(assert (=> b!822539 m!763911))

(assert (=> b!822539 m!763915))

(assert (=> b!822539 m!763913))

(assert (=> b!822534 m!763869))

(assert (=> b!822534 m!763869))

(assert (=> b!822534 m!763873))

(declare-fun m!764009 () Bool)

(assert (=> b!822532 m!764009))

(assert (=> b!822532 m!763869))

(declare-fun m!764011 () Bool)

(assert (=> b!822532 m!764011))

(assert (=> b!822532 m!764011))

(declare-fun m!764013 () Bool)

(assert (=> b!822532 m!764013))

(declare-fun m!764015 () Bool)

(assert (=> b!822532 m!764015))

(assert (=> b!822532 m!763911))

(assert (=> b!822532 m!763913))

(assert (=> b!822532 m!763911))

(assert (=> b!822532 m!763915))

(assert (=> b!822532 m!763913))

(declare-fun m!764017 () Bool)

(assert (=> b!822537 m!764017))

(declare-fun m!764019 () Bool)

(assert (=> bm!35759 m!764019))

(assert (=> b!822531 m!763869))

(assert (=> b!822531 m!763869))

(declare-fun m!764021 () Bool)

(assert (=> b!822531 m!764021))

(declare-fun m!764023 () Bool)

(assert (=> b!822535 m!764023))

(assert (=> b!822536 m!764019))

(declare-fun m!764025 () Bool)

(assert (=> d!104653 m!764025))

(assert (=> d!104653 m!763747))

(assert (=> b!822331 d!104653))

(declare-fun b!822552 () Bool)

(declare-fun e!457358 () Bool)

(declare-fun contains!4150 (List!15645 (_ BitVec 64)) Bool)

(assert (=> b!822552 (= e!457358 (contains!4150 Nil!15642 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104655 () Bool)

(declare-fun res!561042 () Bool)

(declare-fun e!457357 () Bool)

(assert (=> d!104655 (=> res!561042 e!457357)))

(assert (=> d!104655 (= res!561042 (bvsge #b00000000000000000000000000000000 (size!22337 _keys!976)))))

(assert (=> d!104655 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15642) e!457357)))

(declare-fun b!822553 () Bool)

(declare-fun e!457356 () Bool)

(declare-fun e!457355 () Bool)

(assert (=> b!822553 (= e!457356 e!457355)))

(declare-fun c!89252 () Bool)

(assert (=> b!822553 (= c!89252 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822554 () Bool)

(assert (=> b!822554 (= e!457357 e!457356)))

(declare-fun res!561040 () Bool)

(assert (=> b!822554 (=> (not res!561040) (not e!457356))))

(assert (=> b!822554 (= res!561040 (not e!457358))))

(declare-fun res!561041 () Bool)

(assert (=> b!822554 (=> (not res!561041) (not e!457358))))

(assert (=> b!822554 (= res!561041 (validKeyInArray!0 (select (arr!21916 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822555 () Bool)

(declare-fun call!35765 () Bool)

(assert (=> b!822555 (= e!457355 call!35765)))

(declare-fun b!822556 () Bool)

(assert (=> b!822556 (= e!457355 call!35765)))

(declare-fun bm!35762 () Bool)

(assert (=> bm!35762 (= call!35765 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89252 (Cons!15641 (select (arr!21916 _keys!976) #b00000000000000000000000000000000) Nil!15642) Nil!15642)))))

(assert (= (and d!104655 (not res!561042)) b!822554))

(assert (= (and b!822554 res!561041) b!822552))

(assert (= (and b!822554 res!561040) b!822553))

(assert (= (and b!822553 c!89252) b!822555))

(assert (= (and b!822553 (not c!89252)) b!822556))

(assert (= (or b!822555 b!822556) bm!35762))

(assert (=> b!822552 m!763869))

(assert (=> b!822552 m!763869))

(declare-fun m!764027 () Bool)

(assert (=> b!822552 m!764027))

(assert (=> b!822553 m!763869))

(assert (=> b!822553 m!763869))

(assert (=> b!822553 m!763873))

(assert (=> b!822554 m!763869))

(assert (=> b!822554 m!763869))

(assert (=> b!822554 m!763873))

(assert (=> bm!35762 m!763869))

(declare-fun m!764029 () Bool)

(assert (=> bm!35762 m!764029))

(assert (=> b!822334 d!104655))

(declare-fun d!104657 () Bool)

(assert (=> d!104657 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70798 d!104657))

(declare-fun d!104659 () Bool)

(assert (=> d!104659 (= (array_inv!17569 _keys!976) (bvsge (size!22337 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70798 d!104659))

(declare-fun d!104661 () Bool)

(assert (=> d!104661 (= (array_inv!17570 _values!788) (bvsge (size!22338 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70798 d!104661))

(declare-fun mapIsEmpty!23797 () Bool)

(declare-fun mapRes!23797 () Bool)

(assert (=> mapIsEmpty!23797 mapRes!23797))

(declare-fun mapNonEmpty!23797 () Bool)

(declare-fun tp!45985 () Bool)

(declare-fun e!457364 () Bool)

(assert (=> mapNonEmpty!23797 (= mapRes!23797 (and tp!45985 e!457364))))

(declare-fun mapRest!23797 () (Array (_ BitVec 32) ValueCell!6977))

(declare-fun mapValue!23797 () ValueCell!6977)

(declare-fun mapKey!23797 () (_ BitVec 32))

(assert (=> mapNonEmpty!23797 (= mapRest!23788 (store mapRest!23797 mapKey!23797 mapValue!23797))))

(declare-fun b!822564 () Bool)

(declare-fun e!457363 () Bool)

(assert (=> b!822564 (= e!457363 tp_is_empty!14785)))

(declare-fun condMapEmpty!23797 () Bool)

(declare-fun mapDefault!23797 () ValueCell!6977)

(assert (=> mapNonEmpty!23788 (= condMapEmpty!23797 (= mapRest!23788 ((as const (Array (_ BitVec 32) ValueCell!6977)) mapDefault!23797)))))

(assert (=> mapNonEmpty!23788 (= tp!45969 (and e!457363 mapRes!23797))))

(declare-fun b!822563 () Bool)

(assert (=> b!822563 (= e!457364 tp_is_empty!14785)))

(assert (= (and mapNonEmpty!23788 condMapEmpty!23797) mapIsEmpty!23797))

(assert (= (and mapNonEmpty!23788 (not condMapEmpty!23797)) mapNonEmpty!23797))

(assert (= (and mapNonEmpty!23797 ((_ is ValueCellFull!6977) mapValue!23797)) b!822563))

(assert (= (and mapNonEmpty!23788 ((_ is ValueCellFull!6977) mapDefault!23797)) b!822564))

(declare-fun m!764031 () Bool)

(assert (=> mapNonEmpty!23797 m!764031))

(declare-fun b_lambda!11025 () Bool)

(assert (= b_lambda!11023 (or (and start!70798 b_free!13075) b_lambda!11025)))

(declare-fun b_lambda!11027 () Bool)

(assert (= b_lambda!11015 (or (and start!70798 b_free!13075) b_lambda!11027)))

(declare-fun b_lambda!11029 () Bool)

(assert (= b_lambda!11017 (or (and start!70798 b_free!13075) b_lambda!11029)))

(declare-fun b_lambda!11031 () Bool)

(assert (= b_lambda!11019 (or (and start!70798 b_free!13075) b_lambda!11031)))

(declare-fun b_lambda!11033 () Bool)

(assert (= b_lambda!11013 (or (and start!70798 b_free!13075) b_lambda!11033)))

(declare-fun b_lambda!11035 () Bool)

(assert (= b_lambda!11021 (or (and start!70798 b_free!13075) b_lambda!11035)))

(check-sat (not b!822553) (not b_lambda!11029) (not d!104643) (not b!822463) (not b!822447) (not b!822393) (not b!822390) (not b!822480) (not b_next!13075) (not b!822440) (not b_lambda!11033) (not b!822538) tp_is_empty!14785 (not b!822539) (not d!104649) (not bm!35746) (not b!822520) (not b!822526) (not d!104653) (not b!822552) (not b!822471) (not b!822523) (not bm!35739) b_and!21937 (not b!822536) (not b!822442) (not b_lambda!11031) (not bm!35749) (not bm!35748) (not b!822465) (not bm!35743) (not b!822462) (not b!822388) (not d!104639) (not b!822532) (not b!822491) (not d!104645) (not b!822470) (not b!822475) (not d!104633) (not b!822535) (not b!822493) (not b!822448) (not b!822389) (not b!822439) (not d!104635) (not b!822452) (not b!822453) (not bm!35755) (not b!822531) (not b!822481) (not b!822554) (not bm!35758) (not b_lambda!11027) (not b!822476) (not b!822473) (not bm!35759) (not b!822392) (not b!822534) (not bm!35750) (not b!822522) (not b!822525) (not b!822450) (not b!822524) (not bm!35762) (not mapNonEmpty!23797) (not bm!35742) (not d!104637) (not d!104641) (not b!822391) (not b!822519) (not b!822527) (not bm!35741) (not d!104651) (not b!822537) (not b_lambda!11035) (not b_lambda!11025))
(check-sat b_and!21937 (not b_next!13075))
