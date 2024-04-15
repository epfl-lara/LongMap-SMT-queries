; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71560 () Bool)

(assert start!71560)

(declare-fun b_free!13501 () Bool)

(declare-fun b_next!13501 () Bool)

(assert (=> start!71560 (= b_free!13501 (not b_next!13501))))

(declare-fun tp!47295 () Bool)

(declare-fun b_and!22533 () Bool)

(assert (=> start!71560 (= tp!47295 b_and!22533)))

(declare-fun b!831519 () Bool)

(declare-fun res!565953 () Bool)

(declare-fun e!463694 () Bool)

(assert (=> b!831519 (=> (not res!565953) (not e!463694))))

(declare-datatypes ((V!25283 0))(
  ( (V!25284 (val!7653 Int)) )
))
(declare-datatypes ((tuple2!10166 0))(
  ( (tuple2!10167 (_1!5094 (_ BitVec 64)) (_2!5094 V!25283)) )
))
(declare-datatypes ((List!15949 0))(
  ( (Nil!15946) (Cons!15945 (h!17075 tuple2!10166) (t!22308 List!15949)) )
))
(declare-datatypes ((ListLongMap!8979 0))(
  ( (ListLongMap!8980 (toList!4505 List!15949)) )
))
(declare-fun lt!377163 () ListLongMap!8979)

(declare-fun zeroValueAfter!34 () V!25283)

(declare-fun lt!377159 () ListLongMap!8979)

(declare-fun lt!377161 () tuple2!10166)

(declare-fun +!2013 (ListLongMap!8979 tuple2!10166) ListLongMap!8979)

(assert (=> b!831519 (= res!565953 (= lt!377159 (+!2013 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377161)))))

(declare-fun res!565949 () Bool)

(declare-fun e!463689 () Bool)

(assert (=> start!71560 (=> (not res!565949) (not e!463689))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71560 (= res!565949 (validMask!0 mask!1312))))

(assert (=> start!71560 e!463689))

(declare-fun tp_is_empty!15211 () Bool)

(assert (=> start!71560 tp_is_empty!15211))

(declare-datatypes ((array!46567 0))(
  ( (array!46568 (arr!22319 (Array (_ BitVec 32) (_ BitVec 64))) (size!22740 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46567)

(declare-fun array_inv!17839 (array!46567) Bool)

(assert (=> start!71560 (array_inv!17839 _keys!976)))

(assert (=> start!71560 true))

(declare-datatypes ((ValueCell!7190 0))(
  ( (ValueCellFull!7190 (v!10092 V!25283)) (EmptyCell!7190) )
))
(declare-datatypes ((array!46569 0))(
  ( (array!46570 (arr!22320 (Array (_ BitVec 32) ValueCell!7190)) (size!22741 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46569)

(declare-fun e!463693 () Bool)

(declare-fun array_inv!17840 (array!46569) Bool)

(assert (=> start!71560 (and (array_inv!17840 _values!788) e!463693)))

(assert (=> start!71560 tp!47295))

(declare-fun b!831520 () Bool)

(declare-fun res!565950 () Bool)

(assert (=> b!831520 (=> (not res!565950) (not e!463689))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!831520 (= res!565950 (and (= (size!22741 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22740 _keys!976) (size!22741 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!831521 () Bool)

(declare-fun e!463691 () Bool)

(assert (=> b!831521 (= e!463691 tp_is_empty!15211)))

(declare-fun lt!377160 () ListLongMap!8979)

(declare-fun lt!377164 () tuple2!10166)

(declare-fun lt!377158 () ListLongMap!8979)

(declare-fun b!831522 () Bool)

(assert (=> b!831522 (= e!463694 (= lt!377160 (+!2013 (+!2013 lt!377158 lt!377161) lt!377164)))))

(declare-fun b!831523 () Bool)

(declare-fun e!463692 () Bool)

(assert (=> b!831523 (= e!463692 (= lt!377159 (+!2013 (+!2013 lt!377163 lt!377161) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!831523 e!463694))

(declare-fun res!565954 () Bool)

(assert (=> b!831523 (=> (not res!565954) (not e!463694))))

(assert (=> b!831523 (= res!565954 (= lt!377160 (+!2013 (+!2013 lt!377158 lt!377164) lt!377161)))))

(declare-fun minValue!754 () V!25283)

(assert (=> b!831523 (= lt!377161 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25283)

(assert (=> b!831523 (= lt!377164 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2555 (array!46567 array!46569 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8979)

(assert (=> b!831523 (= lt!377159 (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831523 (= lt!377160 (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24474 () Bool)

(declare-fun mapRes!24474 () Bool)

(declare-fun tp!47294 () Bool)

(assert (=> mapNonEmpty!24474 (= mapRes!24474 (and tp!47294 e!463691))))

(declare-fun mapRest!24474 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapValue!24474 () ValueCell!7190)

(declare-fun mapKey!24474 () (_ BitVec 32))

(assert (=> mapNonEmpty!24474 (= (arr!22320 _values!788) (store mapRest!24474 mapKey!24474 mapValue!24474))))

(declare-fun b!831524 () Bool)

(declare-fun res!565952 () Bool)

(assert (=> b!831524 (=> (not res!565952) (not e!463689))))

(declare-datatypes ((List!15950 0))(
  ( (Nil!15947) (Cons!15946 (h!17076 (_ BitVec 64)) (t!22309 List!15950)) )
))
(declare-fun arrayNoDuplicates!0 (array!46567 (_ BitVec 32) List!15950) Bool)

(assert (=> b!831524 (= res!565952 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15947))))

(declare-fun b!831525 () Bool)

(declare-fun e!463690 () Bool)

(assert (=> b!831525 (= e!463690 tp_is_empty!15211)))

(declare-fun b!831526 () Bool)

(declare-fun res!565948 () Bool)

(assert (=> b!831526 (=> (not res!565948) (not e!463689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46567 (_ BitVec 32)) Bool)

(assert (=> b!831526 (= res!565948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!831527 () Bool)

(assert (=> b!831527 (= e!463689 (not e!463692))))

(declare-fun res!565951 () Bool)

(assert (=> b!831527 (=> res!565951 e!463692)))

(assert (=> b!831527 (= res!565951 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831527 (= lt!377158 lt!377163)))

(declare-datatypes ((Unit!28447 0))(
  ( (Unit!28448) )
))
(declare-fun lt!377162 () Unit!28447)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!603 (array!46567 array!46569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 V!25283 V!25283 (_ BitVec 32) Int) Unit!28447)

(assert (=> b!831527 (= lt!377162 (lemmaNoChangeToArrayThenSameMapNoExtras!603 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2533 (array!46567 array!46569 (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 (_ BitVec 32) Int) ListLongMap!8979)

(assert (=> b!831527 (= lt!377163 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831527 (= lt!377158 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24474 () Bool)

(assert (=> mapIsEmpty!24474 mapRes!24474))

(declare-fun b!831528 () Bool)

(assert (=> b!831528 (= e!463693 (and e!463690 mapRes!24474))))

(declare-fun condMapEmpty!24474 () Bool)

(declare-fun mapDefault!24474 () ValueCell!7190)

(assert (=> b!831528 (= condMapEmpty!24474 (= (arr!22320 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24474)))))

(assert (= (and start!71560 res!565949) b!831520))

(assert (= (and b!831520 res!565950) b!831526))

(assert (= (and b!831526 res!565948) b!831524))

(assert (= (and b!831524 res!565952) b!831527))

(assert (= (and b!831527 (not res!565951)) b!831523))

(assert (= (and b!831523 res!565954) b!831519))

(assert (= (and b!831519 res!565953) b!831522))

(assert (= (and b!831528 condMapEmpty!24474) mapIsEmpty!24474))

(assert (= (and b!831528 (not condMapEmpty!24474)) mapNonEmpty!24474))

(get-info :version)

(assert (= (and mapNonEmpty!24474 ((_ is ValueCellFull!7190) mapValue!24474)) b!831521))

(assert (= (and b!831528 ((_ is ValueCellFull!7190) mapDefault!24474)) b!831525))

(assert (= start!71560 b!831528))

(declare-fun m!774897 () Bool)

(assert (=> b!831522 m!774897))

(assert (=> b!831522 m!774897))

(declare-fun m!774899 () Bool)

(assert (=> b!831522 m!774899))

(declare-fun m!774901 () Bool)

(assert (=> b!831523 m!774901))

(declare-fun m!774903 () Bool)

(assert (=> b!831523 m!774903))

(declare-fun m!774905 () Bool)

(assert (=> b!831523 m!774905))

(assert (=> b!831523 m!774903))

(declare-fun m!774907 () Bool)

(assert (=> b!831523 m!774907))

(assert (=> b!831523 m!774901))

(declare-fun m!774909 () Bool)

(assert (=> b!831523 m!774909))

(declare-fun m!774911 () Bool)

(assert (=> b!831523 m!774911))

(declare-fun m!774913 () Bool)

(assert (=> mapNonEmpty!24474 m!774913))

(declare-fun m!774915 () Bool)

(assert (=> start!71560 m!774915))

(declare-fun m!774917 () Bool)

(assert (=> start!71560 m!774917))

(declare-fun m!774919 () Bool)

(assert (=> start!71560 m!774919))

(declare-fun m!774921 () Bool)

(assert (=> b!831526 m!774921))

(declare-fun m!774923 () Bool)

(assert (=> b!831519 m!774923))

(assert (=> b!831519 m!774923))

(declare-fun m!774925 () Bool)

(assert (=> b!831519 m!774925))

(declare-fun m!774927 () Bool)

(assert (=> b!831524 m!774927))

(declare-fun m!774929 () Bool)

(assert (=> b!831527 m!774929))

(declare-fun m!774931 () Bool)

(assert (=> b!831527 m!774931))

(declare-fun m!774933 () Bool)

(assert (=> b!831527 m!774933))

(check-sat (not b!831522) tp_is_empty!15211 (not mapNonEmpty!24474) b_and!22533 (not start!71560) (not b!831527) (not b!831519) (not b!831526) (not b_next!13501) (not b!831523) (not b!831524))
(check-sat b_and!22533 (not b_next!13501))
(get-model)

(declare-fun d!106101 () Bool)

(declare-fun e!463739 () Bool)

(assert (=> d!106101 e!463739))

(declare-fun res!566001 () Bool)

(assert (=> d!106101 (=> (not res!566001) (not e!463739))))

(declare-fun lt!377218 () ListLongMap!8979)

(declare-fun contains!4190 (ListLongMap!8979 (_ BitVec 64)) Bool)

(assert (=> d!106101 (= res!566001 (contains!4190 lt!377218 (_1!5094 lt!377161)))))

(declare-fun lt!377217 () List!15949)

(assert (=> d!106101 (= lt!377218 (ListLongMap!8980 lt!377217))))

(declare-fun lt!377216 () Unit!28447)

(declare-fun lt!377215 () Unit!28447)

(assert (=> d!106101 (= lt!377216 lt!377215)))

(declare-datatypes ((Option!420 0))(
  ( (Some!419 (v!10095 V!25283)) (None!418) )
))
(declare-fun getValueByKey!414 (List!15949 (_ BitVec 64)) Option!420)

(assert (=> d!106101 (= (getValueByKey!414 lt!377217 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(declare-fun lemmaContainsTupThenGetReturnValue!231 (List!15949 (_ BitVec 64) V!25283) Unit!28447)

(assert (=> d!106101 (= lt!377215 (lemmaContainsTupThenGetReturnValue!231 lt!377217 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun insertStrictlySorted!270 (List!15949 (_ BitVec 64) V!25283) List!15949)

(assert (=> d!106101 (= lt!377217 (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106101 (= (+!2013 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377161) lt!377218)))

(declare-fun b!831593 () Bool)

(declare-fun res!566002 () Bool)

(assert (=> b!831593 (=> (not res!566002) (not e!463739))))

(assert (=> b!831593 (= res!566002 (= (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161))))))

(declare-fun b!831594 () Bool)

(declare-fun contains!4191 (List!15949 tuple2!10166) Bool)

(assert (=> b!831594 (= e!463739 (contains!4191 (toList!4505 lt!377218) lt!377161))))

(assert (= (and d!106101 res!566001) b!831593))

(assert (= (and b!831593 res!566002) b!831594))

(declare-fun m!775011 () Bool)

(assert (=> d!106101 m!775011))

(declare-fun m!775013 () Bool)

(assert (=> d!106101 m!775013))

(declare-fun m!775015 () Bool)

(assert (=> d!106101 m!775015))

(declare-fun m!775017 () Bool)

(assert (=> d!106101 m!775017))

(declare-fun m!775019 () Bool)

(assert (=> b!831593 m!775019))

(declare-fun m!775021 () Bool)

(assert (=> b!831594 m!775021))

(assert (=> b!831519 d!106101))

(declare-fun d!106103 () Bool)

(declare-fun e!463740 () Bool)

(assert (=> d!106103 e!463740))

(declare-fun res!566003 () Bool)

(assert (=> d!106103 (=> (not res!566003) (not e!463740))))

(declare-fun lt!377222 () ListLongMap!8979)

(assert (=> d!106103 (= res!566003 (contains!4190 lt!377222 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377221 () List!15949)

(assert (=> d!106103 (= lt!377222 (ListLongMap!8980 lt!377221))))

(declare-fun lt!377220 () Unit!28447)

(declare-fun lt!377219 () Unit!28447)

(assert (=> d!106103 (= lt!377220 lt!377219)))

(assert (=> d!106103 (= (getValueByKey!414 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106103 (= lt!377219 (lemmaContainsTupThenGetReturnValue!231 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106103 (= lt!377221 (insertStrictlySorted!270 (toList!4505 lt!377163) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106103 (= (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377222)))

(declare-fun b!831595 () Bool)

(declare-fun res!566004 () Bool)

(assert (=> b!831595 (=> (not res!566004) (not e!463740))))

(assert (=> b!831595 (= res!566004 (= (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831596 () Bool)

(assert (=> b!831596 (= e!463740 (contains!4191 (toList!4505 lt!377222) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106103 res!566003) b!831595))

(assert (= (and b!831595 res!566004) b!831596))

(declare-fun m!775023 () Bool)

(assert (=> d!106103 m!775023))

(declare-fun m!775025 () Bool)

(assert (=> d!106103 m!775025))

(declare-fun m!775027 () Bool)

(assert (=> d!106103 m!775027))

(declare-fun m!775029 () Bool)

(assert (=> d!106103 m!775029))

(declare-fun m!775031 () Bool)

(assert (=> b!831595 m!775031))

(declare-fun m!775033 () Bool)

(assert (=> b!831596 m!775033))

(assert (=> b!831519 d!106103))

(declare-fun d!106105 () Bool)

(assert (=> d!106105 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377225 () Unit!28447)

(declare-fun choose!1431 (array!46567 array!46569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25283 V!25283 V!25283 V!25283 (_ BitVec 32) Int) Unit!28447)

(assert (=> d!106105 (= lt!377225 (choose!1431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106105 (validMask!0 mask!1312)))

(assert (=> d!106105 (= (lemmaNoChangeToArrayThenSameMapNoExtras!603 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377225)))

(declare-fun bs!23226 () Bool)

(assert (= bs!23226 d!106105))

(assert (=> bs!23226 m!774933))

(assert (=> bs!23226 m!774931))

(declare-fun m!775035 () Bool)

(assert (=> bs!23226 m!775035))

(assert (=> bs!23226 m!774915))

(assert (=> b!831527 d!106105))

(declare-fun b!831622 () Bool)

(declare-fun e!463757 () Bool)

(declare-fun e!463760 () Bool)

(assert (=> b!831622 (= e!463757 e!463760)))

(declare-fun c!90266 () Bool)

(declare-fun e!463759 () Bool)

(assert (=> b!831622 (= c!90266 e!463759)))

(declare-fun res!566015 () Bool)

(assert (=> b!831622 (=> (not res!566015) (not e!463759))))

(assert (=> b!831622 (= res!566015 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831623 () Bool)

(declare-fun e!463761 () ListLongMap!8979)

(declare-fun e!463755 () ListLongMap!8979)

(assert (=> b!831623 (= e!463761 e!463755)))

(declare-fun c!90264 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!831623 (= c!90264 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831624 () Bool)

(declare-fun lt!377243 () ListLongMap!8979)

(declare-fun e!463756 () Bool)

(assert (=> b!831624 (= e!463756 (= lt!377243 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831625 () Bool)

(assert (=> b!831625 (= e!463760 e!463756)))

(declare-fun c!90263 () Bool)

(assert (=> b!831625 (= c!90263 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831626 () Bool)

(declare-fun lt!377241 () Unit!28447)

(declare-fun lt!377242 () Unit!28447)

(assert (=> b!831626 (= lt!377241 lt!377242)))

(declare-fun lt!377245 () V!25283)

(declare-fun lt!377240 () (_ BitVec 64))

(declare-fun lt!377244 () ListLongMap!8979)

(declare-fun lt!377246 () (_ BitVec 64))

(assert (=> b!831626 (not (contains!4190 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)) lt!377246))))

(declare-fun addStillNotContains!199 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> b!831626 (= lt!377242 (addStillNotContains!199 lt!377244 lt!377240 lt!377245 lt!377246))))

(assert (=> b!831626 (= lt!377246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11829 (ValueCell!7190 V!25283) V!25283)

(declare-fun dynLambda!987 (Int (_ BitVec 64)) V!25283)

(assert (=> b!831626 (= lt!377245 (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831626 (= lt!377240 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36335 () ListLongMap!8979)

(assert (=> b!831626 (= lt!377244 call!36335)))

(assert (=> b!831626 (= e!463755 (+!2013 call!36335 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36332 () Bool)

(assert (=> bm!36332 (= call!36335 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831627 () Bool)

(declare-fun res!566016 () Bool)

(assert (=> b!831627 (=> (not res!566016) (not e!463757))))

(assert (=> b!831627 (= res!566016 (not (contains!4190 lt!377243 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831628 () Bool)

(assert (=> b!831628 (= e!463761 (ListLongMap!8980 Nil!15946))))

(declare-fun b!831629 () Bool)

(assert (=> b!831629 (= e!463755 call!36335)))

(declare-fun b!831630 () Bool)

(assert (=> b!831630 (= e!463759 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831630 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!106107 () Bool)

(assert (=> d!106107 e!463757))

(declare-fun res!566014 () Bool)

(assert (=> d!106107 (=> (not res!566014) (not e!463757))))

(assert (=> d!106107 (= res!566014 (not (contains!4190 lt!377243 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106107 (= lt!377243 e!463761)))

(declare-fun c!90265 () Bool)

(assert (=> d!106107 (= c!90265 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!106107 (validMask!0 mask!1312)))

(assert (=> d!106107 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377243)))

(declare-fun b!831621 () Bool)

(declare-fun isEmpty!662 (ListLongMap!8979) Bool)

(assert (=> b!831621 (= e!463756 (isEmpty!662 lt!377243))))

(declare-fun b!831631 () Bool)

(assert (=> b!831631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> b!831631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(declare-fun e!463758 () Bool)

(declare-fun apply!373 (ListLongMap!8979 (_ BitVec 64)) V!25283)

(assert (=> b!831631 (= e!463758 (= (apply!373 lt!377243 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831632 () Bool)

(assert (=> b!831632 (= e!463760 e!463758)))

(assert (=> b!831632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun res!566013 () Bool)

(assert (=> b!831632 (= res!566013 (contains!4190 lt!377243 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831632 (=> (not res!566013) (not e!463758))))

(assert (= (and d!106107 c!90265) b!831628))

(assert (= (and d!106107 (not c!90265)) b!831623))

(assert (= (and b!831623 c!90264) b!831626))

(assert (= (and b!831623 (not c!90264)) b!831629))

(assert (= (or b!831626 b!831629) bm!36332))

(assert (= (and d!106107 res!566014) b!831627))

(assert (= (and b!831627 res!566016) b!831622))

(assert (= (and b!831622 res!566015) b!831630))

(assert (= (and b!831622 c!90266) b!831632))

(assert (= (and b!831622 (not c!90266)) b!831625))

(assert (= (and b!831632 res!566013) b!831631))

(assert (= (and b!831625 c!90263) b!831624))

(assert (= (and b!831625 (not c!90263)) b!831621))

(declare-fun b_lambda!11385 () Bool)

(assert (=> (not b_lambda!11385) (not b!831626)))

(declare-fun t!22315 () Bool)

(declare-fun tb!4219 () Bool)

(assert (=> (and start!71560 (= defaultEntry!796 defaultEntry!796) t!22315) tb!4219))

(declare-fun result!8013 () Bool)

(assert (=> tb!4219 (= result!8013 tp_is_empty!15211)))

(assert (=> b!831626 t!22315))

(declare-fun b_and!22539 () Bool)

(assert (= b_and!22533 (and (=> t!22315 result!8013) b_and!22539)))

(declare-fun b_lambda!11387 () Bool)

(assert (=> (not b_lambda!11387) (not b!831631)))

(assert (=> b!831631 t!22315))

(declare-fun b_and!22541 () Bool)

(assert (= b_and!22539 (and (=> t!22315 result!8013) b_and!22541)))

(declare-fun m!775037 () Bool)

(assert (=> b!831626 m!775037))

(declare-fun m!775039 () Bool)

(assert (=> b!831626 m!775039))

(declare-fun m!775041 () Bool)

(assert (=> b!831626 m!775041))

(declare-fun m!775043 () Bool)

(assert (=> b!831626 m!775043))

(declare-fun m!775045 () Bool)

(assert (=> b!831626 m!775045))

(declare-fun m!775047 () Bool)

(assert (=> b!831626 m!775047))

(declare-fun m!775049 () Bool)

(assert (=> b!831626 m!775049))

(assert (=> b!831626 m!775037))

(assert (=> b!831626 m!775043))

(declare-fun m!775051 () Bool)

(assert (=> b!831626 m!775051))

(assert (=> b!831626 m!775041))

(declare-fun m!775053 () Bool)

(assert (=> bm!36332 m!775053))

(declare-fun m!775055 () Bool)

(assert (=> b!831627 m!775055))

(assert (=> b!831632 m!775051))

(assert (=> b!831632 m!775051))

(declare-fun m!775057 () Bool)

(assert (=> b!831632 m!775057))

(declare-fun m!775059 () Bool)

(assert (=> d!106107 m!775059))

(assert (=> d!106107 m!774915))

(assert (=> b!831623 m!775051))

(assert (=> b!831623 m!775051))

(declare-fun m!775061 () Bool)

(assert (=> b!831623 m!775061))

(declare-fun m!775063 () Bool)

(assert (=> b!831621 m!775063))

(assert (=> b!831624 m!775053))

(assert (=> b!831631 m!775043))

(assert (=> b!831631 m!775041))

(assert (=> b!831631 m!775043))

(assert (=> b!831631 m!775045))

(assert (=> b!831631 m!775051))

(declare-fun m!775065 () Bool)

(assert (=> b!831631 m!775065))

(assert (=> b!831631 m!775051))

(assert (=> b!831631 m!775041))

(assert (=> b!831630 m!775051))

(assert (=> b!831630 m!775051))

(assert (=> b!831630 m!775061))

(assert (=> b!831527 d!106107))

(declare-fun b!831636 () Bool)

(declare-fun e!463764 () Bool)

(declare-fun e!463767 () Bool)

(assert (=> b!831636 (= e!463764 e!463767)))

(declare-fun c!90270 () Bool)

(declare-fun e!463766 () Bool)

(assert (=> b!831636 (= c!90270 e!463766)))

(declare-fun res!566019 () Bool)

(assert (=> b!831636 (=> (not res!566019) (not e!463766))))

(assert (=> b!831636 (= res!566019 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831637 () Bool)

(declare-fun e!463768 () ListLongMap!8979)

(declare-fun e!463762 () ListLongMap!8979)

(assert (=> b!831637 (= e!463768 e!463762)))

(declare-fun c!90268 () Bool)

(assert (=> b!831637 (= c!90268 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377250 () ListLongMap!8979)

(declare-fun e!463763 () Bool)

(declare-fun b!831638 () Bool)

(assert (=> b!831638 (= e!463763 (= lt!377250 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831639 () Bool)

(assert (=> b!831639 (= e!463767 e!463763)))

(declare-fun c!90267 () Bool)

(assert (=> b!831639 (= c!90267 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831640 () Bool)

(declare-fun lt!377248 () Unit!28447)

(declare-fun lt!377249 () Unit!28447)

(assert (=> b!831640 (= lt!377248 lt!377249)))

(declare-fun lt!377251 () ListLongMap!8979)

(declare-fun lt!377252 () V!25283)

(declare-fun lt!377253 () (_ BitVec 64))

(declare-fun lt!377247 () (_ BitVec 64))

(assert (=> b!831640 (not (contains!4190 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)) lt!377253))))

(assert (=> b!831640 (= lt!377249 (addStillNotContains!199 lt!377251 lt!377247 lt!377252 lt!377253))))

(assert (=> b!831640 (= lt!377253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831640 (= lt!377252 (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831640 (= lt!377247 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36336 () ListLongMap!8979)

(assert (=> b!831640 (= lt!377251 call!36336)))

(assert (=> b!831640 (= e!463762 (+!2013 call!36336 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36333 () Bool)

(assert (=> bm!36333 (= call!36336 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831641 () Bool)

(declare-fun res!566020 () Bool)

(assert (=> b!831641 (=> (not res!566020) (not e!463764))))

(assert (=> b!831641 (= res!566020 (not (contains!4190 lt!377250 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831642 () Bool)

(assert (=> b!831642 (= e!463768 (ListLongMap!8980 Nil!15946))))

(declare-fun b!831643 () Bool)

(assert (=> b!831643 (= e!463762 call!36336)))

(declare-fun b!831644 () Bool)

(assert (=> b!831644 (= e!463766 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831644 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!106109 () Bool)

(assert (=> d!106109 e!463764))

(declare-fun res!566018 () Bool)

(assert (=> d!106109 (=> (not res!566018) (not e!463764))))

(assert (=> d!106109 (= res!566018 (not (contains!4190 lt!377250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106109 (= lt!377250 e!463768)))

(declare-fun c!90269 () Bool)

(assert (=> d!106109 (= c!90269 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!106109 (validMask!0 mask!1312)))

(assert (=> d!106109 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377250)))

(declare-fun b!831635 () Bool)

(assert (=> b!831635 (= e!463763 (isEmpty!662 lt!377250))))

(declare-fun b!831645 () Bool)

(assert (=> b!831645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> b!831645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(declare-fun e!463765 () Bool)

(assert (=> b!831645 (= e!463765 (= (apply!373 lt!377250 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831646 () Bool)

(assert (=> b!831646 (= e!463767 e!463765)))

(assert (=> b!831646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun res!566017 () Bool)

(assert (=> b!831646 (= res!566017 (contains!4190 lt!377250 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831646 (=> (not res!566017) (not e!463765))))

(assert (= (and d!106109 c!90269) b!831642))

(assert (= (and d!106109 (not c!90269)) b!831637))

(assert (= (and b!831637 c!90268) b!831640))

(assert (= (and b!831637 (not c!90268)) b!831643))

(assert (= (or b!831640 b!831643) bm!36333))

(assert (= (and d!106109 res!566018) b!831641))

(assert (= (and b!831641 res!566020) b!831636))

(assert (= (and b!831636 res!566019) b!831644))

(assert (= (and b!831636 c!90270) b!831646))

(assert (= (and b!831636 (not c!90270)) b!831639))

(assert (= (and b!831646 res!566017) b!831645))

(assert (= (and b!831639 c!90267) b!831638))

(assert (= (and b!831639 (not c!90267)) b!831635))

(declare-fun b_lambda!11389 () Bool)

(assert (=> (not b_lambda!11389) (not b!831640)))

(assert (=> b!831640 t!22315))

(declare-fun b_and!22543 () Bool)

(assert (= b_and!22541 (and (=> t!22315 result!8013) b_and!22543)))

(declare-fun b_lambda!11391 () Bool)

(assert (=> (not b_lambda!11391) (not b!831645)))

(assert (=> b!831645 t!22315))

(declare-fun b_and!22545 () Bool)

(assert (= b_and!22543 (and (=> t!22315 result!8013) b_and!22545)))

(declare-fun m!775067 () Bool)

(assert (=> b!831640 m!775067))

(declare-fun m!775069 () Bool)

(assert (=> b!831640 m!775069))

(assert (=> b!831640 m!775041))

(assert (=> b!831640 m!775043))

(assert (=> b!831640 m!775045))

(declare-fun m!775071 () Bool)

(assert (=> b!831640 m!775071))

(declare-fun m!775073 () Bool)

(assert (=> b!831640 m!775073))

(assert (=> b!831640 m!775067))

(assert (=> b!831640 m!775043))

(assert (=> b!831640 m!775051))

(assert (=> b!831640 m!775041))

(declare-fun m!775075 () Bool)

(assert (=> bm!36333 m!775075))

(declare-fun m!775077 () Bool)

(assert (=> b!831641 m!775077))

(assert (=> b!831646 m!775051))

(assert (=> b!831646 m!775051))

(declare-fun m!775079 () Bool)

(assert (=> b!831646 m!775079))

(declare-fun m!775081 () Bool)

(assert (=> d!106109 m!775081))

(assert (=> d!106109 m!774915))

(assert (=> b!831637 m!775051))

(assert (=> b!831637 m!775051))

(assert (=> b!831637 m!775061))

(declare-fun m!775083 () Bool)

(assert (=> b!831635 m!775083))

(assert (=> b!831638 m!775075))

(assert (=> b!831645 m!775043))

(assert (=> b!831645 m!775041))

(assert (=> b!831645 m!775043))

(assert (=> b!831645 m!775045))

(assert (=> b!831645 m!775051))

(declare-fun m!775085 () Bool)

(assert (=> b!831645 m!775085))

(assert (=> b!831645 m!775051))

(assert (=> b!831645 m!775041))

(assert (=> b!831644 m!775051))

(assert (=> b!831644 m!775051))

(assert (=> b!831644 m!775061))

(assert (=> b!831527 d!106109))

(declare-fun d!106111 () Bool)

(declare-fun e!463769 () Bool)

(assert (=> d!106111 e!463769))

(declare-fun res!566021 () Bool)

(assert (=> d!106111 (=> (not res!566021) (not e!463769))))

(declare-fun lt!377257 () ListLongMap!8979)

(assert (=> d!106111 (= res!566021 (contains!4190 lt!377257 (_1!5094 lt!377161)))))

(declare-fun lt!377256 () List!15949)

(assert (=> d!106111 (= lt!377257 (ListLongMap!8980 lt!377256))))

(declare-fun lt!377255 () Unit!28447)

(declare-fun lt!377254 () Unit!28447)

(assert (=> d!106111 (= lt!377255 lt!377254)))

(assert (=> d!106111 (= (getValueByKey!414 lt!377256 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!106111 (= lt!377254 (lemmaContainsTupThenGetReturnValue!231 lt!377256 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106111 (= lt!377256 (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377158 lt!377164)) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106111 (= (+!2013 (+!2013 lt!377158 lt!377164) lt!377161) lt!377257)))

(declare-fun b!831647 () Bool)

(declare-fun res!566022 () Bool)

(assert (=> b!831647 (=> (not res!566022) (not e!463769))))

(assert (=> b!831647 (= res!566022 (= (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161))))))

(declare-fun b!831648 () Bool)

(assert (=> b!831648 (= e!463769 (contains!4191 (toList!4505 lt!377257) lt!377161))))

(assert (= (and d!106111 res!566021) b!831647))

(assert (= (and b!831647 res!566022) b!831648))

(declare-fun m!775087 () Bool)

(assert (=> d!106111 m!775087))

(declare-fun m!775089 () Bool)

(assert (=> d!106111 m!775089))

(declare-fun m!775091 () Bool)

(assert (=> d!106111 m!775091))

(declare-fun m!775093 () Bool)

(assert (=> d!106111 m!775093))

(declare-fun m!775095 () Bool)

(assert (=> b!831647 m!775095))

(declare-fun m!775097 () Bool)

(assert (=> b!831648 m!775097))

(assert (=> b!831523 d!106111))

(declare-fun b!831691 () Bool)

(declare-fun e!463805 () ListLongMap!8979)

(declare-fun call!36357 () ListLongMap!8979)

(assert (=> b!831691 (= e!463805 call!36357)))

(declare-fun b!831692 () Bool)

(declare-fun e!463806 () Unit!28447)

(declare-fun Unit!28451 () Unit!28447)

(assert (=> b!831692 (= e!463806 Unit!28451)))

(declare-fun call!36356 () ListLongMap!8979)

(declare-fun bm!36348 () Bool)

(assert (=> bm!36348 (= call!36356 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831693 () Bool)

(declare-fun e!463804 () Bool)

(declare-fun call!36353 () Bool)

(assert (=> b!831693 (= e!463804 (not call!36353))))

(declare-fun d!106113 () Bool)

(declare-fun e!463802 () Bool)

(assert (=> d!106113 e!463802))

(declare-fun res!566045 () Bool)

(assert (=> d!106113 (=> (not res!566045) (not e!463802))))

(assert (=> d!106113 (= res!566045 (or (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))))

(declare-fun lt!377318 () ListLongMap!8979)

(declare-fun lt!377305 () ListLongMap!8979)

(assert (=> d!106113 (= lt!377318 lt!377305)))

(declare-fun lt!377307 () Unit!28447)

(assert (=> d!106113 (= lt!377307 e!463806)))

(declare-fun c!90285 () Bool)

(declare-fun e!463807 () Bool)

(assert (=> d!106113 (= c!90285 e!463807)))

(declare-fun res!566041 () Bool)

(assert (=> d!106113 (=> (not res!566041) (not e!463807))))

(assert (=> d!106113 (= res!566041 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun e!463796 () ListLongMap!8979)

(assert (=> d!106113 (= lt!377305 e!463796)))

(declare-fun c!90286 () Bool)

(assert (=> d!106113 (= c!90286 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106113 (validMask!0 mask!1312)))

(assert (=> d!106113 (= (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377318)))

(declare-fun b!831694 () Bool)

(declare-fun e!463798 () ListLongMap!8979)

(assert (=> b!831694 (= e!463798 call!36357)))

(declare-fun bm!36349 () Bool)

(declare-fun call!36354 () ListLongMap!8979)

(assert (=> bm!36349 (= call!36354 call!36356)))

(declare-fun b!831695 () Bool)

(declare-fun lt!377314 () Unit!28447)

(assert (=> b!831695 (= e!463806 lt!377314)))

(declare-fun lt!377308 () ListLongMap!8979)

(assert (=> b!831695 (= lt!377308 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377313 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377310 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377310 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377320 () Unit!28447)

(declare-fun addStillContains!324 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> b!831695 (= lt!377320 (addStillContains!324 lt!377308 lt!377313 zeroValueBefore!34 lt!377310))))

(assert (=> b!831695 (contains!4190 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377310)))

(declare-fun lt!377316 () Unit!28447)

(assert (=> b!831695 (= lt!377316 lt!377320)))

(declare-fun lt!377306 () ListLongMap!8979)

(assert (=> b!831695 (= lt!377306 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377321 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377321 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377312 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377312 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377304 () Unit!28447)

(declare-fun addApplyDifferent!324 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> b!831695 (= lt!377304 (addApplyDifferent!324 lt!377306 lt!377321 minValue!754 lt!377312))))

(assert (=> b!831695 (= (apply!373 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)) lt!377312) (apply!373 lt!377306 lt!377312))))

(declare-fun lt!377317 () Unit!28447)

(assert (=> b!831695 (= lt!377317 lt!377304)))

(declare-fun lt!377319 () ListLongMap!8979)

(assert (=> b!831695 (= lt!377319 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377315 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377302 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377302 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377309 () Unit!28447)

(assert (=> b!831695 (= lt!377309 (addApplyDifferent!324 lt!377319 lt!377315 zeroValueBefore!34 lt!377302))))

(assert (=> b!831695 (= (apply!373 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377302) (apply!373 lt!377319 lt!377302))))

(declare-fun lt!377322 () Unit!28447)

(assert (=> b!831695 (= lt!377322 lt!377309)))

(declare-fun lt!377311 () ListLongMap!8979)

(assert (=> b!831695 (= lt!377311 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377303 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377323 () (_ BitVec 64))

(assert (=> b!831695 (= lt!377323 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831695 (= lt!377314 (addApplyDifferent!324 lt!377311 lt!377303 minValue!754 lt!377323))))

(assert (=> b!831695 (= (apply!373 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)) lt!377323) (apply!373 lt!377311 lt!377323))))

(declare-fun b!831696 () Bool)

(declare-fun e!463797 () Bool)

(declare-fun e!463801 () Bool)

(assert (=> b!831696 (= e!463797 e!463801)))

(declare-fun res!566048 () Bool)

(declare-fun call!36355 () Bool)

(assert (=> b!831696 (= res!566048 call!36355)))

(assert (=> b!831696 (=> (not res!566048) (not e!463801))))

(declare-fun e!463808 () Bool)

(declare-fun b!831697 () Bool)

(assert (=> b!831697 (= e!463808 (= (apply!373 lt!377318 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!831697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831698 () Bool)

(assert (=> b!831698 (= e!463807 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831699 () Bool)

(declare-fun res!566042 () Bool)

(assert (=> b!831699 (=> (not res!566042) (not e!463802))))

(assert (=> b!831699 (= res!566042 e!463804)))

(declare-fun c!90284 () Bool)

(assert (=> b!831699 (= c!90284 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36350 () Bool)

(assert (=> bm!36350 (= call!36353 (contains!4190 lt!377318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831700 () Bool)

(declare-fun e!463800 () Bool)

(assert (=> b!831700 (= e!463800 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831701 () Bool)

(declare-fun e!463799 () Bool)

(assert (=> b!831701 (= e!463799 (= (apply!373 lt!377318 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!831702 () Bool)

(declare-fun c!90288 () Bool)

(assert (=> b!831702 (= c!90288 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831702 (= e!463798 e!463805)))

(declare-fun bm!36351 () Bool)

(declare-fun call!36351 () ListLongMap!8979)

(assert (=> bm!36351 (= call!36357 call!36351)))

(declare-fun bm!36352 () Bool)

(declare-fun call!36352 () ListLongMap!8979)

(assert (=> bm!36352 (= call!36352 call!36354)))

(declare-fun b!831703 () Bool)

(assert (=> b!831703 (= e!463797 (not call!36355))))

(declare-fun b!831704 () Bool)

(assert (=> b!831704 (= e!463805 call!36352)))

(declare-fun b!831705 () Bool)

(assert (=> b!831705 (= e!463801 (= (apply!373 lt!377318 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!831706 () Bool)

(assert (=> b!831706 (= e!463796 e!463798)))

(declare-fun c!90287 () Bool)

(assert (=> b!831706 (= c!90287 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831707 () Bool)

(assert (=> b!831707 (= e!463796 (+!2013 call!36351 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36353 () Bool)

(assert (=> bm!36353 (= call!36355 (contains!4190 lt!377318 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831708 () Bool)

(assert (=> b!831708 (= e!463802 e!463797)))

(declare-fun c!90283 () Bool)

(assert (=> b!831708 (= c!90283 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831709 () Bool)

(declare-fun res!566046 () Bool)

(assert (=> b!831709 (=> (not res!566046) (not e!463802))))

(declare-fun e!463803 () Bool)

(assert (=> b!831709 (= res!566046 e!463803)))

(declare-fun res!566044 () Bool)

(assert (=> b!831709 (=> res!566044 e!463803)))

(assert (=> b!831709 (= res!566044 (not e!463800))))

(declare-fun res!566047 () Bool)

(assert (=> b!831709 (=> (not res!566047) (not e!463800))))

(assert (=> b!831709 (= res!566047 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun bm!36354 () Bool)

(assert (=> bm!36354 (= call!36351 (+!2013 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831710 () Bool)

(assert (=> b!831710 (= e!463804 e!463799)))

(declare-fun res!566049 () Bool)

(assert (=> b!831710 (= res!566049 call!36353)))

(assert (=> b!831710 (=> (not res!566049) (not e!463799))))

(declare-fun b!831711 () Bool)

(assert (=> b!831711 (= e!463803 e!463808)))

(declare-fun res!566043 () Bool)

(assert (=> b!831711 (=> (not res!566043) (not e!463808))))

(assert (=> b!831711 (= res!566043 (contains!4190 lt!377318 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (= (and d!106113 c!90286) b!831707))

(assert (= (and d!106113 (not c!90286)) b!831706))

(assert (= (and b!831706 c!90287) b!831694))

(assert (= (and b!831706 (not c!90287)) b!831702))

(assert (= (and b!831702 c!90288) b!831691))

(assert (= (and b!831702 (not c!90288)) b!831704))

(assert (= (or b!831691 b!831704) bm!36352))

(assert (= (or b!831694 bm!36352) bm!36349))

(assert (= (or b!831694 b!831691) bm!36351))

(assert (= (or b!831707 bm!36349) bm!36348))

(assert (= (or b!831707 bm!36351) bm!36354))

(assert (= (and d!106113 res!566041) b!831698))

(assert (= (and d!106113 c!90285) b!831695))

(assert (= (and d!106113 (not c!90285)) b!831692))

(assert (= (and d!106113 res!566045) b!831709))

(assert (= (and b!831709 res!566047) b!831700))

(assert (= (and b!831709 (not res!566044)) b!831711))

(assert (= (and b!831711 res!566043) b!831697))

(assert (= (and b!831709 res!566046) b!831699))

(assert (= (and b!831699 c!90284) b!831710))

(assert (= (and b!831699 (not c!90284)) b!831693))

(assert (= (and b!831710 res!566049) b!831701))

(assert (= (or b!831710 b!831693) bm!36350))

(assert (= (and b!831699 res!566042) b!831708))

(assert (= (and b!831708 c!90283) b!831696))

(assert (= (and b!831708 (not c!90283)) b!831703))

(assert (= (and b!831696 res!566048) b!831705))

(assert (= (or b!831696 b!831703) bm!36353))

(declare-fun b_lambda!11393 () Bool)

(assert (=> (not b_lambda!11393) (not b!831697)))

(assert (=> b!831697 t!22315))

(declare-fun b_and!22547 () Bool)

(assert (= b_and!22545 (and (=> t!22315 result!8013) b_and!22547)))

(assert (=> b!831698 m!775051))

(assert (=> b!831698 m!775051))

(assert (=> b!831698 m!775061))

(declare-fun m!775099 () Bool)

(assert (=> bm!36350 m!775099))

(assert (=> d!106113 m!774915))

(declare-fun m!775101 () Bool)

(assert (=> bm!36354 m!775101))

(declare-fun m!775103 () Bool)

(assert (=> b!831695 m!775103))

(declare-fun m!775105 () Bool)

(assert (=> b!831695 m!775105))

(declare-fun m!775107 () Bool)

(assert (=> b!831695 m!775107))

(declare-fun m!775109 () Bool)

(assert (=> b!831695 m!775109))

(assert (=> b!831695 m!775051))

(declare-fun m!775111 () Bool)

(assert (=> b!831695 m!775111))

(declare-fun m!775113 () Bool)

(assert (=> b!831695 m!775113))

(declare-fun m!775115 () Bool)

(assert (=> b!831695 m!775115))

(declare-fun m!775117 () Bool)

(assert (=> b!831695 m!775117))

(declare-fun m!775119 () Bool)

(assert (=> b!831695 m!775119))

(assert (=> b!831695 m!774933))

(declare-fun m!775121 () Bool)

(assert (=> b!831695 m!775121))

(assert (=> b!831695 m!775105))

(declare-fun m!775123 () Bool)

(assert (=> b!831695 m!775123))

(declare-fun m!775125 () Bool)

(assert (=> b!831695 m!775125))

(assert (=> b!831695 m!775125))

(declare-fun m!775127 () Bool)

(assert (=> b!831695 m!775127))

(declare-fun m!775129 () Bool)

(assert (=> b!831695 m!775129))

(assert (=> b!831695 m!775111))

(assert (=> b!831695 m!775107))

(declare-fun m!775131 () Bool)

(assert (=> b!831695 m!775131))

(declare-fun m!775133 () Bool)

(assert (=> b!831707 m!775133))

(assert (=> b!831711 m!775051))

(assert (=> b!831711 m!775051))

(declare-fun m!775135 () Bool)

(assert (=> b!831711 m!775135))

(declare-fun m!775137 () Bool)

(assert (=> b!831705 m!775137))

(declare-fun m!775139 () Bool)

(assert (=> b!831701 m!775139))

(assert (=> bm!36348 m!774933))

(assert (=> b!831700 m!775051))

(assert (=> b!831700 m!775051))

(assert (=> b!831700 m!775061))

(assert (=> b!831697 m!775041))

(assert (=> b!831697 m!775043))

(assert (=> b!831697 m!775045))

(assert (=> b!831697 m!775041))

(assert (=> b!831697 m!775051))

(assert (=> b!831697 m!775051))

(declare-fun m!775141 () Bool)

(assert (=> b!831697 m!775141))

(assert (=> b!831697 m!775043))

(declare-fun m!775143 () Bool)

(assert (=> bm!36353 m!775143))

(assert (=> b!831523 d!106113))

(declare-fun b!831712 () Bool)

(declare-fun e!463818 () ListLongMap!8979)

(declare-fun call!36364 () ListLongMap!8979)

(assert (=> b!831712 (= e!463818 call!36364)))

(declare-fun b!831713 () Bool)

(declare-fun e!463819 () Unit!28447)

(declare-fun Unit!28452 () Unit!28447)

(assert (=> b!831713 (= e!463819 Unit!28452)))

(declare-fun call!36363 () ListLongMap!8979)

(declare-fun bm!36355 () Bool)

(assert (=> bm!36355 (= call!36363 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831714 () Bool)

(declare-fun e!463817 () Bool)

(declare-fun call!36360 () Bool)

(assert (=> b!831714 (= e!463817 (not call!36360))))

(declare-fun d!106115 () Bool)

(declare-fun e!463815 () Bool)

(assert (=> d!106115 e!463815))

(declare-fun res!566054 () Bool)

(assert (=> d!106115 (=> (not res!566054) (not e!463815))))

(assert (=> d!106115 (= res!566054 (or (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))))

(declare-fun lt!377340 () ListLongMap!8979)

(declare-fun lt!377327 () ListLongMap!8979)

(assert (=> d!106115 (= lt!377340 lt!377327)))

(declare-fun lt!377329 () Unit!28447)

(assert (=> d!106115 (= lt!377329 e!463819)))

(declare-fun c!90291 () Bool)

(declare-fun e!463820 () Bool)

(assert (=> d!106115 (= c!90291 e!463820)))

(declare-fun res!566050 () Bool)

(assert (=> d!106115 (=> (not res!566050) (not e!463820))))

(assert (=> d!106115 (= res!566050 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun e!463809 () ListLongMap!8979)

(assert (=> d!106115 (= lt!377327 e!463809)))

(declare-fun c!90292 () Bool)

(assert (=> d!106115 (= c!90292 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106115 (validMask!0 mask!1312)))

(assert (=> d!106115 (= (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377340)))

(declare-fun b!831715 () Bool)

(declare-fun e!463811 () ListLongMap!8979)

(assert (=> b!831715 (= e!463811 call!36364)))

(declare-fun bm!36356 () Bool)

(declare-fun call!36361 () ListLongMap!8979)

(assert (=> bm!36356 (= call!36361 call!36363)))

(declare-fun b!831716 () Bool)

(declare-fun lt!377336 () Unit!28447)

(assert (=> b!831716 (= e!463819 lt!377336)))

(declare-fun lt!377330 () ListLongMap!8979)

(assert (=> b!831716 (= lt!377330 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377335 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377332 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377332 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377342 () Unit!28447)

(assert (=> b!831716 (= lt!377342 (addStillContains!324 lt!377330 lt!377335 zeroValueAfter!34 lt!377332))))

(assert (=> b!831716 (contains!4190 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377332)))

(declare-fun lt!377338 () Unit!28447)

(assert (=> b!831716 (= lt!377338 lt!377342)))

(declare-fun lt!377328 () ListLongMap!8979)

(assert (=> b!831716 (= lt!377328 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377343 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377343 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377334 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377334 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377326 () Unit!28447)

(assert (=> b!831716 (= lt!377326 (addApplyDifferent!324 lt!377328 lt!377343 minValue!754 lt!377334))))

(assert (=> b!831716 (= (apply!373 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)) lt!377334) (apply!373 lt!377328 lt!377334))))

(declare-fun lt!377339 () Unit!28447)

(assert (=> b!831716 (= lt!377339 lt!377326)))

(declare-fun lt!377341 () ListLongMap!8979)

(assert (=> b!831716 (= lt!377341 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377337 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377324 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377324 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377331 () Unit!28447)

(assert (=> b!831716 (= lt!377331 (addApplyDifferent!324 lt!377341 lt!377337 zeroValueAfter!34 lt!377324))))

(assert (=> b!831716 (= (apply!373 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377324) (apply!373 lt!377341 lt!377324))))

(declare-fun lt!377344 () Unit!28447)

(assert (=> b!831716 (= lt!377344 lt!377331)))

(declare-fun lt!377333 () ListLongMap!8979)

(assert (=> b!831716 (= lt!377333 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377325 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377325 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377345 () (_ BitVec 64))

(assert (=> b!831716 (= lt!377345 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831716 (= lt!377336 (addApplyDifferent!324 lt!377333 lt!377325 minValue!754 lt!377345))))

(assert (=> b!831716 (= (apply!373 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)) lt!377345) (apply!373 lt!377333 lt!377345))))

(declare-fun b!831717 () Bool)

(declare-fun e!463810 () Bool)

(declare-fun e!463814 () Bool)

(assert (=> b!831717 (= e!463810 e!463814)))

(declare-fun res!566057 () Bool)

(declare-fun call!36362 () Bool)

(assert (=> b!831717 (= res!566057 call!36362)))

(assert (=> b!831717 (=> (not res!566057) (not e!463814))))

(declare-fun e!463821 () Bool)

(declare-fun b!831718 () Bool)

(assert (=> b!831718 (= e!463821 (= (apply!373 lt!377340 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!831718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831719 () Bool)

(assert (=> b!831719 (= e!463820 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831720 () Bool)

(declare-fun res!566051 () Bool)

(assert (=> b!831720 (=> (not res!566051) (not e!463815))))

(assert (=> b!831720 (= res!566051 e!463817)))

(declare-fun c!90290 () Bool)

(assert (=> b!831720 (= c!90290 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36357 () Bool)

(assert (=> bm!36357 (= call!36360 (contains!4190 lt!377340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831721 () Bool)

(declare-fun e!463813 () Bool)

(assert (=> b!831721 (= e!463813 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831722 () Bool)

(declare-fun e!463812 () Bool)

(assert (=> b!831722 (= e!463812 (= (apply!373 lt!377340 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!831723 () Bool)

(declare-fun c!90294 () Bool)

(assert (=> b!831723 (= c!90294 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831723 (= e!463811 e!463818)))

(declare-fun bm!36358 () Bool)

(declare-fun call!36358 () ListLongMap!8979)

(assert (=> bm!36358 (= call!36364 call!36358)))

(declare-fun bm!36359 () Bool)

(declare-fun call!36359 () ListLongMap!8979)

(assert (=> bm!36359 (= call!36359 call!36361)))

(declare-fun b!831724 () Bool)

(assert (=> b!831724 (= e!463810 (not call!36362))))

(declare-fun b!831725 () Bool)

(assert (=> b!831725 (= e!463818 call!36359)))

(declare-fun b!831726 () Bool)

(assert (=> b!831726 (= e!463814 (= (apply!373 lt!377340 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!831727 () Bool)

(assert (=> b!831727 (= e!463809 e!463811)))

(declare-fun c!90293 () Bool)

(assert (=> b!831727 (= c!90293 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831728 () Bool)

(assert (=> b!831728 (= e!463809 (+!2013 call!36358 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36360 () Bool)

(assert (=> bm!36360 (= call!36362 (contains!4190 lt!377340 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831729 () Bool)

(assert (=> b!831729 (= e!463815 e!463810)))

(declare-fun c!90289 () Bool)

(assert (=> b!831729 (= c!90289 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831730 () Bool)

(declare-fun res!566055 () Bool)

(assert (=> b!831730 (=> (not res!566055) (not e!463815))))

(declare-fun e!463816 () Bool)

(assert (=> b!831730 (= res!566055 e!463816)))

(declare-fun res!566053 () Bool)

(assert (=> b!831730 (=> res!566053 e!463816)))

(assert (=> b!831730 (= res!566053 (not e!463813))))

(declare-fun res!566056 () Bool)

(assert (=> b!831730 (=> (not res!566056) (not e!463813))))

(assert (=> b!831730 (= res!566056 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun bm!36361 () Bool)

(assert (=> bm!36361 (= call!36358 (+!2013 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831731 () Bool)

(assert (=> b!831731 (= e!463817 e!463812)))

(declare-fun res!566058 () Bool)

(assert (=> b!831731 (= res!566058 call!36360)))

(assert (=> b!831731 (=> (not res!566058) (not e!463812))))

(declare-fun b!831732 () Bool)

(assert (=> b!831732 (= e!463816 e!463821)))

(declare-fun res!566052 () Bool)

(assert (=> b!831732 (=> (not res!566052) (not e!463821))))

(assert (=> b!831732 (= res!566052 (contains!4190 lt!377340 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (= (and d!106115 c!90292) b!831728))

(assert (= (and d!106115 (not c!90292)) b!831727))

(assert (= (and b!831727 c!90293) b!831715))

(assert (= (and b!831727 (not c!90293)) b!831723))

(assert (= (and b!831723 c!90294) b!831712))

(assert (= (and b!831723 (not c!90294)) b!831725))

(assert (= (or b!831712 b!831725) bm!36359))

(assert (= (or b!831715 bm!36359) bm!36356))

(assert (= (or b!831715 b!831712) bm!36358))

(assert (= (or b!831728 bm!36356) bm!36355))

(assert (= (or b!831728 bm!36358) bm!36361))

(assert (= (and d!106115 res!566050) b!831719))

(assert (= (and d!106115 c!90291) b!831716))

(assert (= (and d!106115 (not c!90291)) b!831713))

(assert (= (and d!106115 res!566054) b!831730))

(assert (= (and b!831730 res!566056) b!831721))

(assert (= (and b!831730 (not res!566053)) b!831732))

(assert (= (and b!831732 res!566052) b!831718))

(assert (= (and b!831730 res!566055) b!831720))

(assert (= (and b!831720 c!90290) b!831731))

(assert (= (and b!831720 (not c!90290)) b!831714))

(assert (= (and b!831731 res!566058) b!831722))

(assert (= (or b!831731 b!831714) bm!36357))

(assert (= (and b!831720 res!566051) b!831729))

(assert (= (and b!831729 c!90289) b!831717))

(assert (= (and b!831729 (not c!90289)) b!831724))

(assert (= (and b!831717 res!566057) b!831726))

(assert (= (or b!831717 b!831724) bm!36360))

(declare-fun b_lambda!11395 () Bool)

(assert (=> (not b_lambda!11395) (not b!831718)))

(assert (=> b!831718 t!22315))

(declare-fun b_and!22549 () Bool)

(assert (= b_and!22547 (and (=> t!22315 result!8013) b_and!22549)))

(assert (=> b!831719 m!775051))

(assert (=> b!831719 m!775051))

(assert (=> b!831719 m!775061))

(declare-fun m!775145 () Bool)

(assert (=> bm!36357 m!775145))

(assert (=> d!106115 m!774915))

(declare-fun m!775147 () Bool)

(assert (=> bm!36361 m!775147))

(declare-fun m!775149 () Bool)

(assert (=> b!831716 m!775149))

(declare-fun m!775151 () Bool)

(assert (=> b!831716 m!775151))

(declare-fun m!775153 () Bool)

(assert (=> b!831716 m!775153))

(declare-fun m!775155 () Bool)

(assert (=> b!831716 m!775155))

(assert (=> b!831716 m!775051))

(declare-fun m!775157 () Bool)

(assert (=> b!831716 m!775157))

(declare-fun m!775159 () Bool)

(assert (=> b!831716 m!775159))

(declare-fun m!775161 () Bool)

(assert (=> b!831716 m!775161))

(declare-fun m!775163 () Bool)

(assert (=> b!831716 m!775163))

(declare-fun m!775165 () Bool)

(assert (=> b!831716 m!775165))

(assert (=> b!831716 m!774931))

(declare-fun m!775167 () Bool)

(assert (=> b!831716 m!775167))

(assert (=> b!831716 m!775151))

(declare-fun m!775169 () Bool)

(assert (=> b!831716 m!775169))

(declare-fun m!775171 () Bool)

(assert (=> b!831716 m!775171))

(assert (=> b!831716 m!775171))

(declare-fun m!775173 () Bool)

(assert (=> b!831716 m!775173))

(declare-fun m!775175 () Bool)

(assert (=> b!831716 m!775175))

(assert (=> b!831716 m!775157))

(assert (=> b!831716 m!775153))

(declare-fun m!775177 () Bool)

(assert (=> b!831716 m!775177))

(declare-fun m!775179 () Bool)

(assert (=> b!831728 m!775179))

(assert (=> b!831732 m!775051))

(assert (=> b!831732 m!775051))

(declare-fun m!775181 () Bool)

(assert (=> b!831732 m!775181))

(declare-fun m!775183 () Bool)

(assert (=> b!831726 m!775183))

(declare-fun m!775185 () Bool)

(assert (=> b!831722 m!775185))

(assert (=> bm!36355 m!774931))

(assert (=> b!831721 m!775051))

(assert (=> b!831721 m!775051))

(assert (=> b!831721 m!775061))

(assert (=> b!831718 m!775041))

(assert (=> b!831718 m!775043))

(assert (=> b!831718 m!775045))

(assert (=> b!831718 m!775041))

(assert (=> b!831718 m!775051))

(assert (=> b!831718 m!775051))

(declare-fun m!775187 () Bool)

(assert (=> b!831718 m!775187))

(assert (=> b!831718 m!775043))

(declare-fun m!775189 () Bool)

(assert (=> bm!36360 m!775189))

(assert (=> b!831523 d!106115))

(declare-fun d!106117 () Bool)

(declare-fun e!463822 () Bool)

(assert (=> d!106117 e!463822))

(declare-fun res!566059 () Bool)

(assert (=> d!106117 (=> (not res!566059) (not e!463822))))

(declare-fun lt!377349 () ListLongMap!8979)

(assert (=> d!106117 (= res!566059 (contains!4190 lt!377349 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377348 () List!15949)

(assert (=> d!106117 (= lt!377349 (ListLongMap!8980 lt!377348))))

(declare-fun lt!377347 () Unit!28447)

(declare-fun lt!377346 () Unit!28447)

(assert (=> d!106117 (= lt!377347 lt!377346)))

(assert (=> d!106117 (= (getValueByKey!414 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106117 (= lt!377346 (lemmaContainsTupThenGetReturnValue!231 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106117 (= lt!377348 (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377163 lt!377161)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106117 (= (+!2013 (+!2013 lt!377163 lt!377161) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377349)))

(declare-fun b!831733 () Bool)

(declare-fun res!566060 () Bool)

(assert (=> b!831733 (=> (not res!566060) (not e!463822))))

(assert (=> b!831733 (= res!566060 (= (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831734 () Bool)

(assert (=> b!831734 (= e!463822 (contains!4191 (toList!4505 lt!377349) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106117 res!566059) b!831733))

(assert (= (and b!831733 res!566060) b!831734))

(declare-fun m!775191 () Bool)

(assert (=> d!106117 m!775191))

(declare-fun m!775193 () Bool)

(assert (=> d!106117 m!775193))

(declare-fun m!775195 () Bool)

(assert (=> d!106117 m!775195))

(declare-fun m!775197 () Bool)

(assert (=> d!106117 m!775197))

(declare-fun m!775199 () Bool)

(assert (=> b!831733 m!775199))

(declare-fun m!775201 () Bool)

(assert (=> b!831734 m!775201))

(assert (=> b!831523 d!106117))

(declare-fun d!106119 () Bool)

(declare-fun e!463823 () Bool)

(assert (=> d!106119 e!463823))

(declare-fun res!566061 () Bool)

(assert (=> d!106119 (=> (not res!566061) (not e!463823))))

(declare-fun lt!377353 () ListLongMap!8979)

(assert (=> d!106119 (= res!566061 (contains!4190 lt!377353 (_1!5094 lt!377161)))))

(declare-fun lt!377352 () List!15949)

(assert (=> d!106119 (= lt!377353 (ListLongMap!8980 lt!377352))))

(declare-fun lt!377351 () Unit!28447)

(declare-fun lt!377350 () Unit!28447)

(assert (=> d!106119 (= lt!377351 lt!377350)))

(assert (=> d!106119 (= (getValueByKey!414 lt!377352 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!106119 (= lt!377350 (lemmaContainsTupThenGetReturnValue!231 lt!377352 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106119 (= lt!377352 (insertStrictlySorted!270 (toList!4505 lt!377163) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106119 (= (+!2013 lt!377163 lt!377161) lt!377353)))

(declare-fun b!831735 () Bool)

(declare-fun res!566062 () Bool)

(assert (=> b!831735 (=> (not res!566062) (not e!463823))))

(assert (=> b!831735 (= res!566062 (= (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161))))))

(declare-fun b!831736 () Bool)

(assert (=> b!831736 (= e!463823 (contains!4191 (toList!4505 lt!377353) lt!377161))))

(assert (= (and d!106119 res!566061) b!831735))

(assert (= (and b!831735 res!566062) b!831736))

(declare-fun m!775203 () Bool)

(assert (=> d!106119 m!775203))

(declare-fun m!775205 () Bool)

(assert (=> d!106119 m!775205))

(declare-fun m!775207 () Bool)

(assert (=> d!106119 m!775207))

(declare-fun m!775209 () Bool)

(assert (=> d!106119 m!775209))

(declare-fun m!775211 () Bool)

(assert (=> b!831735 m!775211))

(declare-fun m!775213 () Bool)

(assert (=> b!831736 m!775213))

(assert (=> b!831523 d!106119))

(declare-fun d!106121 () Bool)

(declare-fun e!463824 () Bool)

(assert (=> d!106121 e!463824))

(declare-fun res!566063 () Bool)

(assert (=> d!106121 (=> (not res!566063) (not e!463824))))

(declare-fun lt!377357 () ListLongMap!8979)

(assert (=> d!106121 (= res!566063 (contains!4190 lt!377357 (_1!5094 lt!377164)))))

(declare-fun lt!377356 () List!15949)

(assert (=> d!106121 (= lt!377357 (ListLongMap!8980 lt!377356))))

(declare-fun lt!377355 () Unit!28447)

(declare-fun lt!377354 () Unit!28447)

(assert (=> d!106121 (= lt!377355 lt!377354)))

(assert (=> d!106121 (= (getValueByKey!414 lt!377356 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(assert (=> d!106121 (= lt!377354 (lemmaContainsTupThenGetReturnValue!231 lt!377356 (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(assert (=> d!106121 (= lt!377356 (insertStrictlySorted!270 (toList!4505 lt!377158) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(assert (=> d!106121 (= (+!2013 lt!377158 lt!377164) lt!377357)))

(declare-fun b!831737 () Bool)

(declare-fun res!566064 () Bool)

(assert (=> b!831737 (=> (not res!566064) (not e!463824))))

(assert (=> b!831737 (= res!566064 (= (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164))))))

(declare-fun b!831738 () Bool)

(assert (=> b!831738 (= e!463824 (contains!4191 (toList!4505 lt!377357) lt!377164))))

(assert (= (and d!106121 res!566063) b!831737))

(assert (= (and b!831737 res!566064) b!831738))

(declare-fun m!775215 () Bool)

(assert (=> d!106121 m!775215))

(declare-fun m!775217 () Bool)

(assert (=> d!106121 m!775217))

(declare-fun m!775219 () Bool)

(assert (=> d!106121 m!775219))

(declare-fun m!775221 () Bool)

(assert (=> d!106121 m!775221))

(declare-fun m!775223 () Bool)

(assert (=> b!831737 m!775223))

(declare-fun m!775225 () Bool)

(assert (=> b!831738 m!775225))

(assert (=> b!831523 d!106121))

(declare-fun d!106123 () Bool)

(assert (=> d!106123 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71560 d!106123))

(declare-fun d!106125 () Bool)

(assert (=> d!106125 (= (array_inv!17839 _keys!976) (bvsge (size!22740 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71560 d!106125))

(declare-fun d!106127 () Bool)

(assert (=> d!106127 (= (array_inv!17840 _values!788) (bvsge (size!22741 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71560 d!106127))

(declare-fun d!106129 () Bool)

(declare-fun e!463825 () Bool)

(assert (=> d!106129 e!463825))

(declare-fun res!566065 () Bool)

(assert (=> d!106129 (=> (not res!566065) (not e!463825))))

(declare-fun lt!377361 () ListLongMap!8979)

(assert (=> d!106129 (= res!566065 (contains!4190 lt!377361 (_1!5094 lt!377164)))))

(declare-fun lt!377360 () List!15949)

(assert (=> d!106129 (= lt!377361 (ListLongMap!8980 lt!377360))))

(declare-fun lt!377359 () Unit!28447)

(declare-fun lt!377358 () Unit!28447)

(assert (=> d!106129 (= lt!377359 lt!377358)))

(assert (=> d!106129 (= (getValueByKey!414 lt!377360 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(assert (=> d!106129 (= lt!377358 (lemmaContainsTupThenGetReturnValue!231 lt!377360 (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(assert (=> d!106129 (= lt!377360 (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377158 lt!377161)) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(assert (=> d!106129 (= (+!2013 (+!2013 lt!377158 lt!377161) lt!377164) lt!377361)))

(declare-fun b!831739 () Bool)

(declare-fun res!566066 () Bool)

(assert (=> b!831739 (=> (not res!566066) (not e!463825))))

(assert (=> b!831739 (= res!566066 (= (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164))))))

(declare-fun b!831740 () Bool)

(assert (=> b!831740 (= e!463825 (contains!4191 (toList!4505 lt!377361) lt!377164))))

(assert (= (and d!106129 res!566065) b!831739))

(assert (= (and b!831739 res!566066) b!831740))

(declare-fun m!775227 () Bool)

(assert (=> d!106129 m!775227))

(declare-fun m!775229 () Bool)

(assert (=> d!106129 m!775229))

(declare-fun m!775231 () Bool)

(assert (=> d!106129 m!775231))

(declare-fun m!775233 () Bool)

(assert (=> d!106129 m!775233))

(declare-fun m!775235 () Bool)

(assert (=> b!831739 m!775235))

(declare-fun m!775237 () Bool)

(assert (=> b!831740 m!775237))

(assert (=> b!831522 d!106129))

(declare-fun d!106131 () Bool)

(declare-fun e!463826 () Bool)

(assert (=> d!106131 e!463826))

(declare-fun res!566067 () Bool)

(assert (=> d!106131 (=> (not res!566067) (not e!463826))))

(declare-fun lt!377365 () ListLongMap!8979)

(assert (=> d!106131 (= res!566067 (contains!4190 lt!377365 (_1!5094 lt!377161)))))

(declare-fun lt!377364 () List!15949)

(assert (=> d!106131 (= lt!377365 (ListLongMap!8980 lt!377364))))

(declare-fun lt!377363 () Unit!28447)

(declare-fun lt!377362 () Unit!28447)

(assert (=> d!106131 (= lt!377363 lt!377362)))

(assert (=> d!106131 (= (getValueByKey!414 lt!377364 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!106131 (= lt!377362 (lemmaContainsTupThenGetReturnValue!231 lt!377364 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106131 (= lt!377364 (insertStrictlySorted!270 (toList!4505 lt!377158) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(assert (=> d!106131 (= (+!2013 lt!377158 lt!377161) lt!377365)))

(declare-fun b!831741 () Bool)

(declare-fun res!566068 () Bool)

(assert (=> b!831741 (=> (not res!566068) (not e!463826))))

(assert (=> b!831741 (= res!566068 (= (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161))))))

(declare-fun b!831742 () Bool)

(assert (=> b!831742 (= e!463826 (contains!4191 (toList!4505 lt!377365) lt!377161))))

(assert (= (and d!106131 res!566067) b!831741))

(assert (= (and b!831741 res!566068) b!831742))

(declare-fun m!775239 () Bool)

(assert (=> d!106131 m!775239))

(declare-fun m!775241 () Bool)

(assert (=> d!106131 m!775241))

(declare-fun m!775243 () Bool)

(assert (=> d!106131 m!775243))

(declare-fun m!775245 () Bool)

(assert (=> d!106131 m!775245))

(declare-fun m!775247 () Bool)

(assert (=> b!831741 m!775247))

(declare-fun m!775249 () Bool)

(assert (=> b!831742 m!775249))

(assert (=> b!831522 d!106131))

(declare-fun d!106133 () Bool)

(declare-fun res!566074 () Bool)

(declare-fun e!463835 () Bool)

(assert (=> d!106133 (=> res!566074 e!463835)))

(assert (=> d!106133 (= res!566074 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!106133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!463835)))

(declare-fun b!831751 () Bool)

(declare-fun e!463834 () Bool)

(declare-fun e!463833 () Bool)

(assert (=> b!831751 (= e!463834 e!463833)))

(declare-fun lt!377373 () (_ BitVec 64))

(assert (=> b!831751 (= lt!377373 (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377372 () Unit!28447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46567 (_ BitVec 64) (_ BitVec 32)) Unit!28447)

(assert (=> b!831751 (= lt!377372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377373 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!831751 (arrayContainsKey!0 _keys!976 lt!377373 #b00000000000000000000000000000000)))

(declare-fun lt!377374 () Unit!28447)

(assert (=> b!831751 (= lt!377374 lt!377372)))

(declare-fun res!566073 () Bool)

(declare-datatypes ((SeekEntryResult!8741 0))(
  ( (MissingZero!8741 (index!37335 (_ BitVec 32))) (Found!8741 (index!37336 (_ BitVec 32))) (Intermediate!8741 (undefined!9553 Bool) (index!37337 (_ BitVec 32)) (x!70131 (_ BitVec 32))) (Undefined!8741) (MissingVacant!8741 (index!37338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46567 (_ BitVec 32)) SeekEntryResult!8741)

(assert (=> b!831751 (= res!566073 (= (seekEntryOrOpen!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8741 #b00000000000000000000000000000000)))))

(assert (=> b!831751 (=> (not res!566073) (not e!463833))))

(declare-fun bm!36364 () Bool)

(declare-fun call!36367 () Bool)

(assert (=> bm!36364 (= call!36367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831752 () Bool)

(assert (=> b!831752 (= e!463835 e!463834)))

(declare-fun c!90297 () Bool)

(assert (=> b!831752 (= c!90297 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831753 () Bool)

(assert (=> b!831753 (= e!463833 call!36367)))

(declare-fun b!831754 () Bool)

(assert (=> b!831754 (= e!463834 call!36367)))

(assert (= (and d!106133 (not res!566074)) b!831752))

(assert (= (and b!831752 c!90297) b!831751))

(assert (= (and b!831752 (not c!90297)) b!831754))

(assert (= (and b!831751 res!566073) b!831753))

(assert (= (or b!831753 b!831754) bm!36364))

(assert (=> b!831751 m!775051))

(declare-fun m!775251 () Bool)

(assert (=> b!831751 m!775251))

(declare-fun m!775253 () Bool)

(assert (=> b!831751 m!775253))

(assert (=> b!831751 m!775051))

(declare-fun m!775255 () Bool)

(assert (=> b!831751 m!775255))

(declare-fun m!775257 () Bool)

(assert (=> bm!36364 m!775257))

(assert (=> b!831752 m!775051))

(assert (=> b!831752 m!775051))

(assert (=> b!831752 m!775061))

(assert (=> b!831526 d!106133))

(declare-fun b!831765 () Bool)

(declare-fun e!463846 () Bool)

(declare-fun e!463845 () Bool)

(assert (=> b!831765 (= e!463846 e!463845)))

(declare-fun c!90300 () Bool)

(assert (=> b!831765 (= c!90300 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831766 () Bool)

(declare-fun e!463847 () Bool)

(assert (=> b!831766 (= e!463847 e!463846)))

(declare-fun res!566082 () Bool)

(assert (=> b!831766 (=> (not res!566082) (not e!463846))))

(declare-fun e!463844 () Bool)

(assert (=> b!831766 (= res!566082 (not e!463844))))

(declare-fun res!566081 () Bool)

(assert (=> b!831766 (=> (not res!566081) (not e!463844))))

(assert (=> b!831766 (= res!566081 (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106135 () Bool)

(declare-fun res!566083 () Bool)

(assert (=> d!106135 (=> res!566083 e!463847)))

(assert (=> d!106135 (= res!566083 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!106135 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15947) e!463847)))

(declare-fun b!831767 () Bool)

(declare-fun contains!4192 (List!15950 (_ BitVec 64)) Bool)

(assert (=> b!831767 (= e!463844 (contains!4192 Nil!15947 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831768 () Bool)

(declare-fun call!36370 () Bool)

(assert (=> b!831768 (= e!463845 call!36370)))

(declare-fun b!831769 () Bool)

(assert (=> b!831769 (= e!463845 call!36370)))

(declare-fun bm!36367 () Bool)

(assert (=> bm!36367 (= call!36370 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))

(assert (= (and d!106135 (not res!566083)) b!831766))

(assert (= (and b!831766 res!566081) b!831767))

(assert (= (and b!831766 res!566082) b!831765))

(assert (= (and b!831765 c!90300) b!831768))

(assert (= (and b!831765 (not c!90300)) b!831769))

(assert (= (or b!831768 b!831769) bm!36367))

(assert (=> b!831765 m!775051))

(assert (=> b!831765 m!775051))

(assert (=> b!831765 m!775061))

(assert (=> b!831766 m!775051))

(assert (=> b!831766 m!775051))

(assert (=> b!831766 m!775061))

(assert (=> b!831767 m!775051))

(assert (=> b!831767 m!775051))

(declare-fun m!775259 () Bool)

(assert (=> b!831767 m!775259))

(assert (=> bm!36367 m!775051))

(declare-fun m!775261 () Bool)

(assert (=> bm!36367 m!775261))

(assert (=> b!831524 d!106135))

(declare-fun b!831776 () Bool)

(declare-fun e!463852 () Bool)

(assert (=> b!831776 (= e!463852 tp_is_empty!15211)))

(declare-fun mapNonEmpty!24483 () Bool)

(declare-fun mapRes!24483 () Bool)

(declare-fun tp!47310 () Bool)

(assert (=> mapNonEmpty!24483 (= mapRes!24483 (and tp!47310 e!463852))))

(declare-fun mapKey!24483 () (_ BitVec 32))

(declare-fun mapValue!24483 () ValueCell!7190)

(declare-fun mapRest!24483 () (Array (_ BitVec 32) ValueCell!7190))

(assert (=> mapNonEmpty!24483 (= mapRest!24474 (store mapRest!24483 mapKey!24483 mapValue!24483))))

(declare-fun condMapEmpty!24483 () Bool)

(declare-fun mapDefault!24483 () ValueCell!7190)

(assert (=> mapNonEmpty!24474 (= condMapEmpty!24483 (= mapRest!24474 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24483)))))

(declare-fun e!463853 () Bool)

(assert (=> mapNonEmpty!24474 (= tp!47294 (and e!463853 mapRes!24483))))

(declare-fun mapIsEmpty!24483 () Bool)

(assert (=> mapIsEmpty!24483 mapRes!24483))

(declare-fun b!831777 () Bool)

(assert (=> b!831777 (= e!463853 tp_is_empty!15211)))

(assert (= (and mapNonEmpty!24474 condMapEmpty!24483) mapIsEmpty!24483))

(assert (= (and mapNonEmpty!24474 (not condMapEmpty!24483)) mapNonEmpty!24483))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7190) mapValue!24483)) b!831776))

(assert (= (and mapNonEmpty!24474 ((_ is ValueCellFull!7190) mapDefault!24483)) b!831777))

(declare-fun m!775263 () Bool)

(assert (=> mapNonEmpty!24483 m!775263))

(declare-fun b_lambda!11397 () Bool)

(assert (= b_lambda!11387 (or (and start!71560 b_free!13501) b_lambda!11397)))

(declare-fun b_lambda!11399 () Bool)

(assert (= b_lambda!11389 (or (and start!71560 b_free!13501) b_lambda!11399)))

(declare-fun b_lambda!11401 () Bool)

(assert (= b_lambda!11385 (or (and start!71560 b_free!13501) b_lambda!11401)))

(declare-fun b_lambda!11403 () Bool)

(assert (= b_lambda!11395 (or (and start!71560 b_free!13501) b_lambda!11403)))

(declare-fun b_lambda!11405 () Bool)

(assert (= b_lambda!11393 (or (and start!71560 b_free!13501) b_lambda!11405)))

(declare-fun b_lambda!11407 () Bool)

(assert (= b_lambda!11391 (or (and start!71560 b_free!13501) b_lambda!11407)))

(check-sat (not b!831631) (not bm!36355) (not b!831735) (not b!831621) (not b_lambda!11401) (not d!106111) (not b!831726) (not b_lambda!11407) (not b!831736) (not b!831718) (not b!831722) (not b!831632) (not b!831739) (not d!106129) (not b!831742) (not b!831626) (not d!106113) (not b!831752) (not b_lambda!11399) (not d!106101) (not b!831701) (not b!831640) (not b!831593) (not b!831751) (not d!106131) (not b!831719) (not b!831734) (not b!831695) (not bm!36332) (not b_lambda!11405) (not b!831716) (not b!831594) tp_is_empty!15211 (not b!831623) (not b!831740) (not mapNonEmpty!24483) (not b!831638) (not bm!36350) (not bm!36367) (not b!831645) (not b!831641) (not bm!36357) (not b!831707) (not d!106109) (not b!831741) (not d!106105) (not b!831738) (not b_lambda!11403) (not b!831767) (not bm!36361) (not b!831635) (not b!831721) (not b!831737) (not d!106119) (not b!831637) (not bm!36353) (not b!831711) (not bm!36364) (not b!831647) (not b!831700) (not d!106121) b_and!22549 (not b!831732) (not b!831728) (not b!831733) (not b!831766) (not b!831644) (not b!831627) (not b!831646) (not b!831648) (not b!831624) (not b!831630) (not bm!36360) (not b_next!13501) (not b!831595) (not d!106117) (not b!831705) (not d!106115) (not bm!36354) (not d!106103) (not b_lambda!11397) (not b!831765) (not d!106107) (not bm!36348) (not bm!36333) (not b!831698) (not b!831596) (not b!831697))
(check-sat b_and!22549 (not b_next!13501))
(get-model)

(declare-fun d!106137 () Bool)

(declare-fun e!463854 () Bool)

(assert (=> d!106137 e!463854))

(declare-fun res!566084 () Bool)

(assert (=> d!106137 (=> (not res!566084) (not e!463854))))

(declare-fun lt!377378 () ListLongMap!8979)

(assert (=> d!106137 (= res!566084 (contains!4190 lt!377378 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377377 () List!15949)

(assert (=> d!106137 (= lt!377378 (ListLongMap!8980 lt!377377))))

(declare-fun lt!377376 () Unit!28447)

(declare-fun lt!377375 () Unit!28447)

(assert (=> d!106137 (= lt!377376 lt!377375)))

(assert (=> d!106137 (= (getValueByKey!414 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106137 (= lt!377375 (lemmaContainsTupThenGetReturnValue!231 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106137 (= lt!377377 (insertStrictlySorted!270 (toList!4505 call!36336) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106137 (= (+!2013 call!36336 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377378)))

(declare-fun b!831778 () Bool)

(declare-fun res!566085 () Bool)

(assert (=> b!831778 (=> (not res!566085) (not e!463854))))

(assert (=> b!831778 (= res!566085 (= (getValueByKey!414 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831779 () Bool)

(assert (=> b!831779 (= e!463854 (contains!4191 (toList!4505 lt!377378) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106137 res!566084) b!831778))

(assert (= (and b!831778 res!566085) b!831779))

(declare-fun m!775265 () Bool)

(assert (=> d!106137 m!775265))

(declare-fun m!775267 () Bool)

(assert (=> d!106137 m!775267))

(declare-fun m!775269 () Bool)

(assert (=> d!106137 m!775269))

(declare-fun m!775271 () Bool)

(assert (=> d!106137 m!775271))

(declare-fun m!775273 () Bool)

(assert (=> b!831778 m!775273))

(declare-fun m!775275 () Bool)

(assert (=> b!831779 m!775275))

(assert (=> b!831640 d!106137))

(declare-fun d!106139 () Bool)

(declare-fun e!463855 () Bool)

(assert (=> d!106139 e!463855))

(declare-fun res!566086 () Bool)

(assert (=> d!106139 (=> (not res!566086) (not e!463855))))

(declare-fun lt!377382 () ListLongMap!8979)

(assert (=> d!106139 (= res!566086 (contains!4190 lt!377382 (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun lt!377381 () List!15949)

(assert (=> d!106139 (= lt!377382 (ListLongMap!8980 lt!377381))))

(declare-fun lt!377380 () Unit!28447)

(declare-fun lt!377379 () Unit!28447)

(assert (=> d!106139 (= lt!377380 lt!377379)))

(assert (=> d!106139 (= (getValueByKey!414 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252))) (Some!419 (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(assert (=> d!106139 (= lt!377379 (lemmaContainsTupThenGetReturnValue!231 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(assert (=> d!106139 (= lt!377381 (insertStrictlySorted!270 (toList!4505 lt!377251) (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(assert (=> d!106139 (= (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)) lt!377382)))

(declare-fun b!831780 () Bool)

(declare-fun res!566087 () Bool)

(assert (=> b!831780 (=> (not res!566087) (not e!463855))))

(assert (=> b!831780 (= res!566087 (= (getValueByKey!414 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252))) (Some!419 (_2!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(declare-fun b!831781 () Bool)

(assert (=> b!831781 (= e!463855 (contains!4191 (toList!4505 lt!377382) (tuple2!10167 lt!377247 lt!377252)))))

(assert (= (and d!106139 res!566086) b!831780))

(assert (= (and b!831780 res!566087) b!831781))

(declare-fun m!775277 () Bool)

(assert (=> d!106139 m!775277))

(declare-fun m!775279 () Bool)

(assert (=> d!106139 m!775279))

(declare-fun m!775281 () Bool)

(assert (=> d!106139 m!775281))

(declare-fun m!775283 () Bool)

(assert (=> d!106139 m!775283))

(declare-fun m!775285 () Bool)

(assert (=> b!831780 m!775285))

(declare-fun m!775287 () Bool)

(assert (=> b!831781 m!775287))

(assert (=> b!831640 d!106139))

(declare-fun d!106141 () Bool)

(declare-fun c!90303 () Bool)

(assert (=> d!106141 (= c!90303 ((_ is ValueCellFull!7190) (select (arr!22320 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!463858 () V!25283)

(assert (=> d!106141 (= (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463858)))

(declare-fun b!831786 () Bool)

(declare-fun get!11830 (ValueCell!7190 V!25283) V!25283)

(assert (=> b!831786 (= e!463858 (get!11830 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831787 () Bool)

(declare-fun get!11831 (ValueCell!7190 V!25283) V!25283)

(assert (=> b!831787 (= e!463858 (get!11831 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106141 c!90303) b!831786))

(assert (= (and d!106141 (not c!90303)) b!831787))

(assert (=> b!831786 m!775041))

(assert (=> b!831786 m!775043))

(declare-fun m!775289 () Bool)

(assert (=> b!831786 m!775289))

(assert (=> b!831787 m!775041))

(assert (=> b!831787 m!775043))

(declare-fun m!775291 () Bool)

(assert (=> b!831787 m!775291))

(assert (=> b!831640 d!106141))

(declare-fun d!106143 () Bool)

(assert (=> d!106143 (not (contains!4190 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)) lt!377253))))

(declare-fun lt!377385 () Unit!28447)

(declare-fun choose!1432 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> d!106143 (= lt!377385 (choose!1432 lt!377251 lt!377247 lt!377252 lt!377253))))

(declare-fun e!463861 () Bool)

(assert (=> d!106143 e!463861))

(declare-fun res!566090 () Bool)

(assert (=> d!106143 (=> (not res!566090) (not e!463861))))

(assert (=> d!106143 (= res!566090 (not (contains!4190 lt!377251 lt!377253)))))

(assert (=> d!106143 (= (addStillNotContains!199 lt!377251 lt!377247 lt!377252 lt!377253) lt!377385)))

(declare-fun b!831791 () Bool)

(assert (=> b!831791 (= e!463861 (not (= lt!377247 lt!377253)))))

(assert (= (and d!106143 res!566090) b!831791))

(assert (=> d!106143 m!775067))

(assert (=> d!106143 m!775067))

(assert (=> d!106143 m!775069))

(declare-fun m!775293 () Bool)

(assert (=> d!106143 m!775293))

(declare-fun m!775295 () Bool)

(assert (=> d!106143 m!775295))

(assert (=> b!831640 d!106143))

(declare-fun d!106145 () Bool)

(declare-fun e!463867 () Bool)

(assert (=> d!106145 e!463867))

(declare-fun res!566093 () Bool)

(assert (=> d!106145 (=> res!566093 e!463867)))

(declare-fun lt!377396 () Bool)

(assert (=> d!106145 (= res!566093 (not lt!377396))))

(declare-fun lt!377394 () Bool)

(assert (=> d!106145 (= lt!377396 lt!377394)))

(declare-fun lt!377397 () Unit!28447)

(declare-fun e!463866 () Unit!28447)

(assert (=> d!106145 (= lt!377397 e!463866)))

(declare-fun c!90306 () Bool)

(assert (=> d!106145 (= c!90306 lt!377394)))

(declare-fun containsKey!400 (List!15949 (_ BitVec 64)) Bool)

(assert (=> d!106145 (= lt!377394 (containsKey!400 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(assert (=> d!106145 (= (contains!4190 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)) lt!377253) lt!377396)))

(declare-fun b!831798 () Bool)

(declare-fun lt!377395 () Unit!28447)

(assert (=> b!831798 (= e!463866 lt!377395)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!310 (List!15949 (_ BitVec 64)) Unit!28447)

(assert (=> b!831798 (= lt!377395 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(declare-fun isDefined!311 (Option!420) Bool)

(assert (=> b!831798 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(declare-fun b!831799 () Bool)

(declare-fun Unit!28453 () Unit!28447)

(assert (=> b!831799 (= e!463866 Unit!28453)))

(declare-fun b!831800 () Bool)

(assert (=> b!831800 (= e!463867 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253)))))

(assert (= (and d!106145 c!90306) b!831798))

(assert (= (and d!106145 (not c!90306)) b!831799))

(assert (= (and d!106145 (not res!566093)) b!831800))

(declare-fun m!775297 () Bool)

(assert (=> d!106145 m!775297))

(declare-fun m!775299 () Bool)

(assert (=> b!831798 m!775299))

(declare-fun m!775301 () Bool)

(assert (=> b!831798 m!775301))

(assert (=> b!831798 m!775301))

(declare-fun m!775303 () Bool)

(assert (=> b!831798 m!775303))

(assert (=> b!831800 m!775301))

(assert (=> b!831800 m!775301))

(assert (=> b!831800 m!775303))

(assert (=> b!831640 d!106145))

(declare-fun d!106147 () Bool)

(assert (=> d!106147 (= (validKeyInArray!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22319 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22319 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831721 d!106147))

(declare-fun d!106149 () Bool)

(declare-fun e!463868 () Bool)

(assert (=> d!106149 e!463868))

(declare-fun res!566094 () Bool)

(assert (=> d!106149 (=> (not res!566094) (not e!463868))))

(declare-fun lt!377401 () ListLongMap!8979)

(assert (=> d!106149 (= res!566094 (contains!4190 lt!377401 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377400 () List!15949)

(assert (=> d!106149 (= lt!377401 (ListLongMap!8980 lt!377400))))

(declare-fun lt!377399 () Unit!28447)

(declare-fun lt!377398 () Unit!28447)

(assert (=> d!106149 (= lt!377399 lt!377398)))

(assert (=> d!106149 (= (getValueByKey!414 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106149 (= lt!377398 (lemmaContainsTupThenGetReturnValue!231 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106149 (= lt!377400 (insertStrictlySorted!270 (toList!4505 call!36351) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106149 (= (+!2013 call!36351 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377401)))

(declare-fun b!831801 () Bool)

(declare-fun res!566095 () Bool)

(assert (=> b!831801 (=> (not res!566095) (not e!463868))))

(assert (=> b!831801 (= res!566095 (= (getValueByKey!414 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831802 () Bool)

(assert (=> b!831802 (= e!463868 (contains!4191 (toList!4505 lt!377401) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106149 res!566094) b!831801))

(assert (= (and b!831801 res!566095) b!831802))

(declare-fun m!775305 () Bool)

(assert (=> d!106149 m!775305))

(declare-fun m!775307 () Bool)

(assert (=> d!106149 m!775307))

(declare-fun m!775309 () Bool)

(assert (=> d!106149 m!775309))

(declare-fun m!775311 () Bool)

(assert (=> d!106149 m!775311))

(declare-fun m!775313 () Bool)

(assert (=> b!831801 m!775313))

(declare-fun m!775315 () Bool)

(assert (=> b!831802 m!775315))

(assert (=> b!831707 d!106149))

(declare-fun d!106151 () Bool)

(declare-fun e!463870 () Bool)

(assert (=> d!106151 e!463870))

(declare-fun res!566096 () Bool)

(assert (=> d!106151 (=> res!566096 e!463870)))

(declare-fun lt!377404 () Bool)

(assert (=> d!106151 (= res!566096 (not lt!377404))))

(declare-fun lt!377402 () Bool)

(assert (=> d!106151 (= lt!377404 lt!377402)))

(declare-fun lt!377405 () Unit!28447)

(declare-fun e!463869 () Unit!28447)

(assert (=> d!106151 (= lt!377405 e!463869)))

(declare-fun c!90307 () Bool)

(assert (=> d!106151 (= c!90307 lt!377402)))

(assert (=> d!106151 (= lt!377402 (containsKey!400 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(assert (=> d!106151 (= (contains!4190 lt!377361 (_1!5094 lt!377164)) lt!377404)))

(declare-fun b!831803 () Bool)

(declare-fun lt!377403 () Unit!28447)

(assert (=> b!831803 (= e!463869 lt!377403)))

(assert (=> b!831803 (= lt!377403 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(assert (=> b!831803 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(declare-fun b!831804 () Bool)

(declare-fun Unit!28454 () Unit!28447)

(assert (=> b!831804 (= e!463869 Unit!28454)))

(declare-fun b!831805 () Bool)

(assert (=> b!831805 (= e!463870 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164))))))

(assert (= (and d!106151 c!90307) b!831803))

(assert (= (and d!106151 (not c!90307)) b!831804))

(assert (= (and d!106151 (not res!566096)) b!831805))

(declare-fun m!775317 () Bool)

(assert (=> d!106151 m!775317))

(declare-fun m!775319 () Bool)

(assert (=> b!831803 m!775319))

(assert (=> b!831803 m!775235))

(assert (=> b!831803 m!775235))

(declare-fun m!775321 () Bool)

(assert (=> b!831803 m!775321))

(assert (=> b!831805 m!775235))

(assert (=> b!831805 m!775235))

(assert (=> b!831805 m!775321))

(assert (=> d!106129 d!106151))

(declare-fun b!831816 () Bool)

(declare-fun e!463876 () Option!420)

(assert (=> b!831816 (= e!463876 (getValueByKey!414 (t!22308 lt!377360) (_1!5094 lt!377164)))))

(declare-fun b!831817 () Bool)

(assert (=> b!831817 (= e!463876 None!418)))

(declare-fun d!106153 () Bool)

(declare-fun c!90312 () Bool)

(assert (=> d!106153 (= c!90312 (and ((_ is Cons!15945) lt!377360) (= (_1!5094 (h!17075 lt!377360)) (_1!5094 lt!377164))))))

(declare-fun e!463875 () Option!420)

(assert (=> d!106153 (= (getValueByKey!414 lt!377360 (_1!5094 lt!377164)) e!463875)))

(declare-fun b!831815 () Bool)

(assert (=> b!831815 (= e!463875 e!463876)))

(declare-fun c!90313 () Bool)

(assert (=> b!831815 (= c!90313 (and ((_ is Cons!15945) lt!377360) (not (= (_1!5094 (h!17075 lt!377360)) (_1!5094 lt!377164)))))))

(declare-fun b!831814 () Bool)

(assert (=> b!831814 (= e!463875 (Some!419 (_2!5094 (h!17075 lt!377360))))))

(assert (= (and d!106153 c!90312) b!831814))

(assert (= (and d!106153 (not c!90312)) b!831815))

(assert (= (and b!831815 c!90313) b!831816))

(assert (= (and b!831815 (not c!90313)) b!831817))

(declare-fun m!775323 () Bool)

(assert (=> b!831816 m!775323))

(assert (=> d!106129 d!106153))

(declare-fun d!106155 () Bool)

(assert (=> d!106155 (= (getValueByKey!414 lt!377360 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(declare-fun lt!377408 () Unit!28447)

(declare-fun choose!1433 (List!15949 (_ BitVec 64) V!25283) Unit!28447)

(assert (=> d!106155 (= lt!377408 (choose!1433 lt!377360 (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun e!463879 () Bool)

(assert (=> d!106155 e!463879))

(declare-fun res!566101 () Bool)

(assert (=> d!106155 (=> (not res!566101) (not e!463879))))

(declare-fun isStrictlySorted!438 (List!15949) Bool)

(assert (=> d!106155 (= res!566101 (isStrictlySorted!438 lt!377360))))

(assert (=> d!106155 (= (lemmaContainsTupThenGetReturnValue!231 lt!377360 (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377408)))

(declare-fun b!831822 () Bool)

(declare-fun res!566102 () Bool)

(assert (=> b!831822 (=> (not res!566102) (not e!463879))))

(assert (=> b!831822 (= res!566102 (containsKey!400 lt!377360 (_1!5094 lt!377164)))))

(declare-fun b!831823 () Bool)

(assert (=> b!831823 (= e!463879 (contains!4191 lt!377360 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!106155 res!566101) b!831822))

(assert (= (and b!831822 res!566102) b!831823))

(assert (=> d!106155 m!775229))

(declare-fun m!775325 () Bool)

(assert (=> d!106155 m!775325))

(declare-fun m!775327 () Bool)

(assert (=> d!106155 m!775327))

(declare-fun m!775329 () Bool)

(assert (=> b!831822 m!775329))

(declare-fun m!775331 () Bool)

(assert (=> b!831823 m!775331))

(assert (=> d!106129 d!106155))

(declare-fun b!831844 () Bool)

(declare-fun e!463890 () Bool)

(declare-fun lt!377411 () List!15949)

(assert (=> b!831844 (= e!463890 (contains!4191 lt!377411 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!831845 () Bool)

(declare-fun res!566108 () Bool)

(assert (=> b!831845 (=> (not res!566108) (not e!463890))))

(assert (=> b!831845 (= res!566108 (containsKey!400 lt!377411 (_1!5094 lt!377164)))))

(declare-fun b!831846 () Bool)

(declare-fun e!463892 () List!15949)

(declare-fun call!36377 () List!15949)

(assert (=> b!831846 (= e!463892 call!36377)))

(declare-fun bm!36374 () Bool)

(declare-fun call!36379 () List!15949)

(declare-fun c!90322 () Bool)

(declare-fun e!463894 () List!15949)

(declare-fun $colon$colon!536 (List!15949 tuple2!10166) List!15949)

(assert (=> bm!36374 (= call!36379 ($colon$colon!536 e!463894 (ite c!90322 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161))) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))))))

(declare-fun c!90323 () Bool)

(assert (=> bm!36374 (= c!90323 c!90322)))

(declare-fun b!831848 () Bool)

(declare-fun e!463893 () List!15949)

(assert (=> b!831848 (= e!463893 call!36379)))

(declare-fun bm!36375 () Bool)

(declare-fun call!36378 () List!15949)

(assert (=> bm!36375 (= call!36378 call!36379)))

(declare-fun b!831849 () Bool)

(declare-fun e!463891 () List!15949)

(assert (=> b!831849 (= e!463891 call!36378)))

(declare-fun c!90324 () Bool)

(declare-fun c!90325 () Bool)

(declare-fun b!831850 () Bool)

(assert (=> b!831850 (= e!463894 (ite c!90325 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))) (ite c!90324 (Cons!15945 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161))) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) Nil!15946)))))

(declare-fun b!831851 () Bool)

(assert (=> b!831851 (= e!463892 call!36377)))

(declare-fun bm!36376 () Bool)

(assert (=> bm!36376 (= call!36377 call!36378)))

(declare-fun b!831852 () Bool)

(assert (=> b!831852 (= e!463893 e!463891)))

(assert (=> b!831852 (= c!90325 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377161))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161)))) (_1!5094 lt!377164))))))

(declare-fun b!831853 () Bool)

(assert (=> b!831853 (= e!463894 (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun b!831847 () Bool)

(assert (=> b!831847 (= c!90324 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377161))) (bvsgt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161)))) (_1!5094 lt!377164))))))

(assert (=> b!831847 (= e!463891 e!463892)))

(declare-fun d!106157 () Bool)

(assert (=> d!106157 e!463890))

(declare-fun res!566107 () Bool)

(assert (=> d!106157 (=> (not res!566107) (not e!463890))))

(assert (=> d!106157 (= res!566107 (isStrictlySorted!438 lt!377411))))

(assert (=> d!106157 (= lt!377411 e!463893)))

(assert (=> d!106157 (= c!90322 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377161))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161)))) (_1!5094 lt!377164))))))

(assert (=> d!106157 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377158 lt!377161)))))

(assert (=> d!106157 (= (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377158 lt!377161)) (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377411)))

(assert (= (and d!106157 c!90322) b!831848))

(assert (= (and d!106157 (not c!90322)) b!831852))

(assert (= (and b!831852 c!90325) b!831849))

(assert (= (and b!831852 (not c!90325)) b!831847))

(assert (= (and b!831847 c!90324) b!831846))

(assert (= (and b!831847 (not c!90324)) b!831851))

(assert (= (or b!831846 b!831851) bm!36376))

(assert (= (or b!831849 bm!36376) bm!36375))

(assert (= (or b!831848 bm!36375) bm!36374))

(assert (= (and bm!36374 c!90323) b!831853))

(assert (= (and bm!36374 (not c!90323)) b!831850))

(assert (= (and d!106157 res!566107) b!831845))

(assert (= (and b!831845 res!566108) b!831844))

(declare-fun m!775333 () Bool)

(assert (=> b!831844 m!775333))

(declare-fun m!775335 () Bool)

(assert (=> d!106157 m!775335))

(declare-fun m!775337 () Bool)

(assert (=> d!106157 m!775337))

(declare-fun m!775339 () Bool)

(assert (=> b!831845 m!775339))

(declare-fun m!775341 () Bool)

(assert (=> bm!36374 m!775341))

(declare-fun m!775343 () Bool)

(assert (=> b!831853 m!775343))

(assert (=> d!106129 d!106157))

(declare-fun d!106159 () Bool)

(declare-fun e!463896 () Bool)

(assert (=> d!106159 e!463896))

(declare-fun res!566109 () Bool)

(assert (=> d!106159 (=> res!566109 e!463896)))

(declare-fun lt!377414 () Bool)

(assert (=> d!106159 (= res!566109 (not lt!377414))))

(declare-fun lt!377412 () Bool)

(assert (=> d!106159 (= lt!377414 lt!377412)))

(declare-fun lt!377415 () Unit!28447)

(declare-fun e!463895 () Unit!28447)

(assert (=> d!106159 (= lt!377415 e!463895)))

(declare-fun c!90326 () Bool)

(assert (=> d!106159 (= c!90326 lt!377412)))

(assert (=> d!106159 (= lt!377412 (containsKey!400 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106159 (= (contains!4190 lt!377243 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377414)))

(declare-fun b!831854 () Bool)

(declare-fun lt!377413 () Unit!28447)

(assert (=> b!831854 (= e!463895 lt!377413)))

(assert (=> b!831854 (= lt!377413 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831854 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831855 () Bool)

(declare-fun Unit!28455 () Unit!28447)

(assert (=> b!831855 (= e!463895 Unit!28455)))

(declare-fun b!831856 () Bool)

(assert (=> b!831856 (= e!463896 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106159 c!90326) b!831854))

(assert (= (and d!106159 (not c!90326)) b!831855))

(assert (= (and d!106159 (not res!566109)) b!831856))

(declare-fun m!775345 () Bool)

(assert (=> d!106159 m!775345))

(declare-fun m!775347 () Bool)

(assert (=> b!831854 m!775347))

(declare-fun m!775349 () Bool)

(assert (=> b!831854 m!775349))

(assert (=> b!831854 m!775349))

(declare-fun m!775351 () Bool)

(assert (=> b!831854 m!775351))

(assert (=> b!831856 m!775349))

(assert (=> b!831856 m!775349))

(assert (=> b!831856 m!775351))

(assert (=> b!831627 d!106159))

(declare-fun d!106161 () Bool)

(declare-fun lt!377418 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!386 (List!15949) (InoxSet tuple2!10166))

(assert (=> d!106161 (= lt!377418 (select (content!386 (toList!4505 lt!377222)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463902 () Bool)

(assert (=> d!106161 (= lt!377418 e!463902)))

(declare-fun res!566114 () Bool)

(assert (=> d!106161 (=> (not res!566114) (not e!463902))))

(assert (=> d!106161 (= res!566114 ((_ is Cons!15945) (toList!4505 lt!377222)))))

(assert (=> d!106161 (= (contains!4191 (toList!4505 lt!377222) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377418)))

(declare-fun b!831861 () Bool)

(declare-fun e!463901 () Bool)

(assert (=> b!831861 (= e!463902 e!463901)))

(declare-fun res!566115 () Bool)

(assert (=> b!831861 (=> res!566115 e!463901)))

(assert (=> b!831861 (= res!566115 (= (h!17075 (toList!4505 lt!377222)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!831862 () Bool)

(assert (=> b!831862 (= e!463901 (contains!4191 (t!22308 (toList!4505 lt!377222)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106161 res!566114) b!831861))

(assert (= (and b!831861 (not res!566115)) b!831862))

(declare-fun m!775353 () Bool)

(assert (=> d!106161 m!775353))

(declare-fun m!775355 () Bool)

(assert (=> d!106161 m!775355))

(declare-fun m!775357 () Bool)

(assert (=> b!831862 m!775357))

(assert (=> b!831596 d!106161))

(declare-fun d!106163 () Bool)

(declare-fun e!463904 () Bool)

(assert (=> d!106163 e!463904))

(declare-fun res!566116 () Bool)

(assert (=> d!106163 (=> res!566116 e!463904)))

(declare-fun lt!377421 () Bool)

(assert (=> d!106163 (= res!566116 (not lt!377421))))

(declare-fun lt!377419 () Bool)

(assert (=> d!106163 (= lt!377421 lt!377419)))

(declare-fun lt!377422 () Unit!28447)

(declare-fun e!463903 () Unit!28447)

(assert (=> d!106163 (= lt!377422 e!463903)))

(declare-fun c!90327 () Bool)

(assert (=> d!106163 (= c!90327 lt!377419)))

(assert (=> d!106163 (= lt!377419 (containsKey!400 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(assert (=> d!106163 (= (contains!4190 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)) lt!377246) lt!377421)))

(declare-fun b!831863 () Bool)

(declare-fun lt!377420 () Unit!28447)

(assert (=> b!831863 (= e!463903 lt!377420)))

(assert (=> b!831863 (= lt!377420 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(assert (=> b!831863 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(declare-fun b!831864 () Bool)

(declare-fun Unit!28456 () Unit!28447)

(assert (=> b!831864 (= e!463903 Unit!28456)))

(declare-fun b!831865 () Bool)

(assert (=> b!831865 (= e!463904 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246)))))

(assert (= (and d!106163 c!90327) b!831863))

(assert (= (and d!106163 (not c!90327)) b!831864))

(assert (= (and d!106163 (not res!566116)) b!831865))

(declare-fun m!775359 () Bool)

(assert (=> d!106163 m!775359))

(declare-fun m!775361 () Bool)

(assert (=> b!831863 m!775361))

(declare-fun m!775363 () Bool)

(assert (=> b!831863 m!775363))

(assert (=> b!831863 m!775363))

(declare-fun m!775365 () Bool)

(assert (=> b!831863 m!775365))

(assert (=> b!831865 m!775363))

(assert (=> b!831865 m!775363))

(assert (=> b!831865 m!775365))

(assert (=> b!831626 d!106163))

(assert (=> b!831626 d!106141))

(declare-fun d!106165 () Bool)

(declare-fun e!463905 () Bool)

(assert (=> d!106165 e!463905))

(declare-fun res!566117 () Bool)

(assert (=> d!106165 (=> (not res!566117) (not e!463905))))

(declare-fun lt!377426 () ListLongMap!8979)

(assert (=> d!106165 (= res!566117 (contains!4190 lt!377426 (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun lt!377425 () List!15949)

(assert (=> d!106165 (= lt!377426 (ListLongMap!8980 lt!377425))))

(declare-fun lt!377424 () Unit!28447)

(declare-fun lt!377423 () Unit!28447)

(assert (=> d!106165 (= lt!377424 lt!377423)))

(assert (=> d!106165 (= (getValueByKey!414 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245))) (Some!419 (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(assert (=> d!106165 (= lt!377423 (lemmaContainsTupThenGetReturnValue!231 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(assert (=> d!106165 (= lt!377425 (insertStrictlySorted!270 (toList!4505 lt!377244) (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(assert (=> d!106165 (= (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)) lt!377426)))

(declare-fun b!831866 () Bool)

(declare-fun res!566118 () Bool)

(assert (=> b!831866 (=> (not res!566118) (not e!463905))))

(assert (=> b!831866 (= res!566118 (= (getValueByKey!414 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245))) (Some!419 (_2!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(declare-fun b!831867 () Bool)

(assert (=> b!831867 (= e!463905 (contains!4191 (toList!4505 lt!377426) (tuple2!10167 lt!377240 lt!377245)))))

(assert (= (and d!106165 res!566117) b!831866))

(assert (= (and b!831866 res!566118) b!831867))

(declare-fun m!775367 () Bool)

(assert (=> d!106165 m!775367))

(declare-fun m!775369 () Bool)

(assert (=> d!106165 m!775369))

(declare-fun m!775371 () Bool)

(assert (=> d!106165 m!775371))

(declare-fun m!775373 () Bool)

(assert (=> d!106165 m!775373))

(declare-fun m!775375 () Bool)

(assert (=> b!831866 m!775375))

(declare-fun m!775377 () Bool)

(assert (=> b!831867 m!775377))

(assert (=> b!831626 d!106165))

(declare-fun d!106167 () Bool)

(declare-fun e!463906 () Bool)

(assert (=> d!106167 e!463906))

(declare-fun res!566119 () Bool)

(assert (=> d!106167 (=> (not res!566119) (not e!463906))))

(declare-fun lt!377430 () ListLongMap!8979)

(assert (=> d!106167 (= res!566119 (contains!4190 lt!377430 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377429 () List!15949)

(assert (=> d!106167 (= lt!377430 (ListLongMap!8980 lt!377429))))

(declare-fun lt!377428 () Unit!28447)

(declare-fun lt!377427 () Unit!28447)

(assert (=> d!106167 (= lt!377428 lt!377427)))

(assert (=> d!106167 (= (getValueByKey!414 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106167 (= lt!377427 (lemmaContainsTupThenGetReturnValue!231 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106167 (= lt!377429 (insertStrictlySorted!270 (toList!4505 call!36335) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106167 (= (+!2013 call!36335 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377430)))

(declare-fun b!831868 () Bool)

(declare-fun res!566120 () Bool)

(assert (=> b!831868 (=> (not res!566120) (not e!463906))))

(assert (=> b!831868 (= res!566120 (= (getValueByKey!414 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831869 () Bool)

(assert (=> b!831869 (= e!463906 (contains!4191 (toList!4505 lt!377430) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106167 res!566119) b!831868))

(assert (= (and b!831868 res!566120) b!831869))

(declare-fun m!775379 () Bool)

(assert (=> d!106167 m!775379))

(declare-fun m!775381 () Bool)

(assert (=> d!106167 m!775381))

(declare-fun m!775383 () Bool)

(assert (=> d!106167 m!775383))

(declare-fun m!775385 () Bool)

(assert (=> d!106167 m!775385))

(declare-fun m!775387 () Bool)

(assert (=> b!831868 m!775387))

(declare-fun m!775389 () Bool)

(assert (=> b!831869 m!775389))

(assert (=> b!831626 d!106167))

(declare-fun d!106169 () Bool)

(assert (=> d!106169 (not (contains!4190 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)) lt!377246))))

(declare-fun lt!377431 () Unit!28447)

(assert (=> d!106169 (= lt!377431 (choose!1432 lt!377244 lt!377240 lt!377245 lt!377246))))

(declare-fun e!463907 () Bool)

(assert (=> d!106169 e!463907))

(declare-fun res!566121 () Bool)

(assert (=> d!106169 (=> (not res!566121) (not e!463907))))

(assert (=> d!106169 (= res!566121 (not (contains!4190 lt!377244 lt!377246)))))

(assert (=> d!106169 (= (addStillNotContains!199 lt!377244 lt!377240 lt!377245 lt!377246) lt!377431)))

(declare-fun b!831870 () Bool)

(assert (=> b!831870 (= e!463907 (not (= lt!377240 lt!377246)))))

(assert (= (and d!106169 res!566121) b!831870))

(assert (=> d!106169 m!775037))

(assert (=> d!106169 m!775037))

(assert (=> d!106169 m!775039))

(declare-fun m!775391 () Bool)

(assert (=> d!106169 m!775391))

(declare-fun m!775393 () Bool)

(assert (=> d!106169 m!775393))

(assert (=> b!831626 d!106169))

(declare-fun b!831872 () Bool)

(declare-fun e!463910 () Bool)

(declare-fun e!463913 () Bool)

(assert (=> b!831872 (= e!463910 e!463913)))

(declare-fun c!90331 () Bool)

(declare-fun e!463912 () Bool)

(assert (=> b!831872 (= c!90331 e!463912)))

(declare-fun res!566124 () Bool)

(assert (=> b!831872 (=> (not res!566124) (not e!463912))))

(assert (=> b!831872 (= res!566124 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!831873 () Bool)

(declare-fun e!463914 () ListLongMap!8979)

(declare-fun e!463908 () ListLongMap!8979)

(assert (=> b!831873 (= e!463914 e!463908)))

(declare-fun c!90329 () Bool)

(assert (=> b!831873 (= c!90329 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463909 () Bool)

(declare-fun b!831874 () Bool)

(declare-fun lt!377435 () ListLongMap!8979)

(assert (=> b!831874 (= e!463909 (= lt!377435 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831875 () Bool)

(assert (=> b!831875 (= e!463913 e!463909)))

(declare-fun c!90328 () Bool)

(assert (=> b!831875 (= c!90328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!831876 () Bool)

(declare-fun lt!377433 () Unit!28447)

(declare-fun lt!377434 () Unit!28447)

(assert (=> b!831876 (= lt!377433 lt!377434)))

(declare-fun lt!377432 () (_ BitVec 64))

(declare-fun lt!377436 () ListLongMap!8979)

(declare-fun lt!377438 () (_ BitVec 64))

(declare-fun lt!377437 () V!25283)

(assert (=> b!831876 (not (contains!4190 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437)) lt!377438))))

(assert (=> b!831876 (= lt!377434 (addStillNotContains!199 lt!377436 lt!377432 lt!377437 lt!377438))))

(assert (=> b!831876 (= lt!377438 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831876 (= lt!377437 (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831876 (= lt!377432 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36380 () ListLongMap!8979)

(assert (=> b!831876 (= lt!377436 call!36380)))

(assert (=> b!831876 (= e!463908 (+!2013 call!36380 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36377 () Bool)

(assert (=> bm!36377 (= call!36380 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831877 () Bool)

(declare-fun res!566125 () Bool)

(assert (=> b!831877 (=> (not res!566125) (not e!463910))))

(assert (=> b!831877 (= res!566125 (not (contains!4190 lt!377435 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831878 () Bool)

(assert (=> b!831878 (= e!463914 (ListLongMap!8980 Nil!15946))))

(declare-fun b!831879 () Bool)

(assert (=> b!831879 (= e!463908 call!36380)))

(declare-fun b!831880 () Bool)

(assert (=> b!831880 (= e!463912 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831880 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!106171 () Bool)

(assert (=> d!106171 e!463910))

(declare-fun res!566123 () Bool)

(assert (=> d!106171 (=> (not res!566123) (not e!463910))))

(assert (=> d!106171 (= res!566123 (not (contains!4190 lt!377435 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106171 (= lt!377435 e!463914)))

(declare-fun c!90330 () Bool)

(assert (=> d!106171 (= c!90330 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106171 (validMask!0 mask!1312)))

(assert (=> d!106171 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377435)))

(declare-fun b!831871 () Bool)

(assert (=> b!831871 (= e!463909 (isEmpty!662 lt!377435))))

(declare-fun b!831881 () Bool)

(assert (=> b!831881 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> b!831881 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22741 _values!788)))))

(declare-fun e!463911 () Bool)

(assert (=> b!831881 (= e!463911 (= (apply!373 lt!377435 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831882 () Bool)

(assert (=> b!831882 (= e!463913 e!463911)))

(assert (=> b!831882 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun res!566122 () Bool)

(assert (=> b!831882 (= res!566122 (contains!4190 lt!377435 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831882 (=> (not res!566122) (not e!463911))))

(assert (= (and d!106171 c!90330) b!831878))

(assert (= (and d!106171 (not c!90330)) b!831873))

(assert (= (and b!831873 c!90329) b!831876))

(assert (= (and b!831873 (not c!90329)) b!831879))

(assert (= (or b!831876 b!831879) bm!36377))

(assert (= (and d!106171 res!566123) b!831877))

(assert (= (and b!831877 res!566125) b!831872))

(assert (= (and b!831872 res!566124) b!831880))

(assert (= (and b!831872 c!90331) b!831882))

(assert (= (and b!831872 (not c!90331)) b!831875))

(assert (= (and b!831882 res!566122) b!831881))

(assert (= (and b!831875 c!90328) b!831874))

(assert (= (and b!831875 (not c!90328)) b!831871))

(declare-fun b_lambda!11409 () Bool)

(assert (=> (not b_lambda!11409) (not b!831876)))

(assert (=> b!831876 t!22315))

(declare-fun b_and!22551 () Bool)

(assert (= b_and!22549 (and (=> t!22315 result!8013) b_and!22551)))

(declare-fun b_lambda!11411 () Bool)

(assert (=> (not b_lambda!11411) (not b!831881)))

(assert (=> b!831881 t!22315))

(declare-fun b_and!22553 () Bool)

(assert (= b_and!22551 (and (=> t!22315 result!8013) b_and!22553)))

(declare-fun m!775395 () Bool)

(assert (=> b!831876 m!775395))

(declare-fun m!775397 () Bool)

(assert (=> b!831876 m!775397))

(declare-fun m!775399 () Bool)

(assert (=> b!831876 m!775399))

(assert (=> b!831876 m!775043))

(declare-fun m!775401 () Bool)

(assert (=> b!831876 m!775401))

(declare-fun m!775403 () Bool)

(assert (=> b!831876 m!775403))

(declare-fun m!775405 () Bool)

(assert (=> b!831876 m!775405))

(assert (=> b!831876 m!775395))

(assert (=> b!831876 m!775043))

(declare-fun m!775407 () Bool)

(assert (=> b!831876 m!775407))

(assert (=> b!831876 m!775399))

(declare-fun m!775409 () Bool)

(assert (=> bm!36377 m!775409))

(declare-fun m!775411 () Bool)

(assert (=> b!831877 m!775411))

(assert (=> b!831882 m!775407))

(assert (=> b!831882 m!775407))

(declare-fun m!775413 () Bool)

(assert (=> b!831882 m!775413))

(declare-fun m!775415 () Bool)

(assert (=> d!106171 m!775415))

(assert (=> d!106171 m!774915))

(assert (=> b!831873 m!775407))

(assert (=> b!831873 m!775407))

(declare-fun m!775417 () Bool)

(assert (=> b!831873 m!775417))

(declare-fun m!775419 () Bool)

(assert (=> b!831871 m!775419))

(assert (=> b!831874 m!775409))

(assert (=> b!831881 m!775043))

(assert (=> b!831881 m!775399))

(assert (=> b!831881 m!775043))

(assert (=> b!831881 m!775401))

(assert (=> b!831881 m!775407))

(declare-fun m!775421 () Bool)

(assert (=> b!831881 m!775421))

(assert (=> b!831881 m!775407))

(assert (=> b!831881 m!775399))

(assert (=> b!831880 m!775407))

(assert (=> b!831880 m!775407))

(assert (=> b!831880 m!775417))

(assert (=> b!831638 d!106171))

(declare-fun d!106173 () Bool)

(declare-fun lt!377439 () Bool)

(assert (=> d!106173 (= lt!377439 (select (content!386 (toList!4505 lt!377218)) lt!377161))))

(declare-fun e!463916 () Bool)

(assert (=> d!106173 (= lt!377439 e!463916)))

(declare-fun res!566126 () Bool)

(assert (=> d!106173 (=> (not res!566126) (not e!463916))))

(assert (=> d!106173 (= res!566126 ((_ is Cons!15945) (toList!4505 lt!377218)))))

(assert (=> d!106173 (= (contains!4191 (toList!4505 lt!377218) lt!377161) lt!377439)))

(declare-fun b!831883 () Bool)

(declare-fun e!463915 () Bool)

(assert (=> b!831883 (= e!463916 e!463915)))

(declare-fun res!566127 () Bool)

(assert (=> b!831883 (=> res!566127 e!463915)))

(assert (=> b!831883 (= res!566127 (= (h!17075 (toList!4505 lt!377218)) lt!377161))))

(declare-fun b!831884 () Bool)

(assert (=> b!831884 (= e!463915 (contains!4191 (t!22308 (toList!4505 lt!377218)) lt!377161))))

(assert (= (and d!106173 res!566126) b!831883))

(assert (= (and b!831883 (not res!566127)) b!831884))

(declare-fun m!775423 () Bool)

(assert (=> d!106173 m!775423))

(declare-fun m!775425 () Bool)

(assert (=> d!106173 m!775425))

(declare-fun m!775427 () Bool)

(assert (=> b!831884 m!775427))

(assert (=> b!831594 d!106173))

(declare-fun d!106175 () Bool)

(declare-fun get!11832 (Option!420) V!25283)

(assert (=> d!106175 (= (apply!373 lt!377318 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11832 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23227 () Bool)

(assert (= bs!23227 d!106175))

(declare-fun m!775429 () Bool)

(assert (=> bs!23227 m!775429))

(assert (=> bs!23227 m!775429))

(declare-fun m!775431 () Bool)

(assert (=> bs!23227 m!775431))

(assert (=> b!831705 d!106175))

(declare-fun d!106177 () Bool)

(declare-fun e!463917 () Bool)

(assert (=> d!106177 e!463917))

(declare-fun res!566128 () Bool)

(assert (=> d!106177 (=> (not res!566128) (not e!463917))))

(declare-fun lt!377443 () ListLongMap!8979)

(assert (=> d!106177 (= res!566128 (contains!4190 lt!377443 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun lt!377442 () List!15949)

(assert (=> d!106177 (= lt!377443 (ListLongMap!8980 lt!377442))))

(declare-fun lt!377441 () Unit!28447)

(declare-fun lt!377440 () Unit!28447)

(assert (=> d!106177 (= lt!377441 lt!377440)))

(assert (=> d!106177 (= (getValueByKey!414 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(assert (=> d!106177 (= lt!377440 (lemmaContainsTupThenGetReturnValue!231 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(assert (=> d!106177 (= lt!377442 (insertStrictlySorted!270 (toList!4505 lt!377319) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(assert (=> d!106177 (= (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377443)))

(declare-fun b!831885 () Bool)

(declare-fun res!566129 () Bool)

(assert (=> b!831885 (=> (not res!566129) (not e!463917))))

(assert (=> b!831885 (= res!566129 (= (getValueByKey!414 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(declare-fun b!831886 () Bool)

(assert (=> b!831886 (= e!463917 (contains!4191 (toList!4505 lt!377443) (tuple2!10167 lt!377315 zeroValueBefore!34)))))

(assert (= (and d!106177 res!566128) b!831885))

(assert (= (and b!831885 res!566129) b!831886))

(declare-fun m!775433 () Bool)

(assert (=> d!106177 m!775433))

(declare-fun m!775435 () Bool)

(assert (=> d!106177 m!775435))

(declare-fun m!775437 () Bool)

(assert (=> d!106177 m!775437))

(declare-fun m!775439 () Bool)

(assert (=> d!106177 m!775439))

(declare-fun m!775441 () Bool)

(assert (=> b!831885 m!775441))

(declare-fun m!775443 () Bool)

(assert (=> b!831886 m!775443))

(assert (=> b!831695 d!106177))

(declare-fun d!106179 () Bool)

(declare-fun e!463918 () Bool)

(assert (=> d!106179 e!463918))

(declare-fun res!566130 () Bool)

(assert (=> d!106179 (=> (not res!566130) (not e!463918))))

(declare-fun lt!377447 () ListLongMap!8979)

(assert (=> d!106179 (= res!566130 (contains!4190 lt!377447 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun lt!377446 () List!15949)

(assert (=> d!106179 (= lt!377447 (ListLongMap!8980 lt!377446))))

(declare-fun lt!377445 () Unit!28447)

(declare-fun lt!377444 () Unit!28447)

(assert (=> d!106179 (= lt!377445 lt!377444)))

(assert (=> d!106179 (= (getValueByKey!414 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(assert (=> d!106179 (= lt!377444 (lemmaContainsTupThenGetReturnValue!231 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(assert (=> d!106179 (= lt!377446 (insertStrictlySorted!270 (toList!4505 lt!377308) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(assert (=> d!106179 (= (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377447)))

(declare-fun b!831887 () Bool)

(declare-fun res!566131 () Bool)

(assert (=> b!831887 (=> (not res!566131) (not e!463918))))

(assert (=> b!831887 (= res!566131 (= (getValueByKey!414 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(declare-fun b!831888 () Bool)

(assert (=> b!831888 (= e!463918 (contains!4191 (toList!4505 lt!377447) (tuple2!10167 lt!377313 zeroValueBefore!34)))))

(assert (= (and d!106179 res!566130) b!831887))

(assert (= (and b!831887 res!566131) b!831888))

(declare-fun m!775445 () Bool)

(assert (=> d!106179 m!775445))

(declare-fun m!775447 () Bool)

(assert (=> d!106179 m!775447))

(declare-fun m!775449 () Bool)

(assert (=> d!106179 m!775449))

(declare-fun m!775451 () Bool)

(assert (=> d!106179 m!775451))

(declare-fun m!775453 () Bool)

(assert (=> b!831887 m!775453))

(declare-fun m!775455 () Bool)

(assert (=> b!831888 m!775455))

(assert (=> b!831695 d!106179))

(declare-fun d!106181 () Bool)

(assert (=> d!106181 (= (apply!373 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)) lt!377323) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))) lt!377323)))))

(declare-fun bs!23228 () Bool)

(assert (= bs!23228 d!106181))

(declare-fun m!775457 () Bool)

(assert (=> bs!23228 m!775457))

(assert (=> bs!23228 m!775457))

(declare-fun m!775459 () Bool)

(assert (=> bs!23228 m!775459))

(assert (=> b!831695 d!106181))

(declare-fun d!106183 () Bool)

(declare-fun e!463920 () Bool)

(assert (=> d!106183 e!463920))

(declare-fun res!566132 () Bool)

(assert (=> d!106183 (=> res!566132 e!463920)))

(declare-fun lt!377450 () Bool)

(assert (=> d!106183 (= res!566132 (not lt!377450))))

(declare-fun lt!377448 () Bool)

(assert (=> d!106183 (= lt!377450 lt!377448)))

(declare-fun lt!377451 () Unit!28447)

(declare-fun e!463919 () Unit!28447)

(assert (=> d!106183 (= lt!377451 e!463919)))

(declare-fun c!90332 () Bool)

(assert (=> d!106183 (= c!90332 lt!377448)))

(assert (=> d!106183 (= lt!377448 (containsKey!400 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(assert (=> d!106183 (= (contains!4190 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377310) lt!377450)))

(declare-fun b!831889 () Bool)

(declare-fun lt!377449 () Unit!28447)

(assert (=> b!831889 (= e!463919 lt!377449)))

(assert (=> b!831889 (= lt!377449 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(assert (=> b!831889 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(declare-fun b!831890 () Bool)

(declare-fun Unit!28457 () Unit!28447)

(assert (=> b!831890 (= e!463919 Unit!28457)))

(declare-fun b!831891 () Bool)

(assert (=> b!831891 (= e!463920 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310)))))

(assert (= (and d!106183 c!90332) b!831889))

(assert (= (and d!106183 (not c!90332)) b!831890))

(assert (= (and d!106183 (not res!566132)) b!831891))

(declare-fun m!775461 () Bool)

(assert (=> d!106183 m!775461))

(declare-fun m!775463 () Bool)

(assert (=> b!831889 m!775463))

(declare-fun m!775465 () Bool)

(assert (=> b!831889 m!775465))

(assert (=> b!831889 m!775465))

(declare-fun m!775467 () Bool)

(assert (=> b!831889 m!775467))

(assert (=> b!831891 m!775465))

(assert (=> b!831891 m!775465))

(assert (=> b!831891 m!775467))

(assert (=> b!831695 d!106183))

(declare-fun d!106185 () Bool)

(declare-fun e!463921 () Bool)

(assert (=> d!106185 e!463921))

(declare-fun res!566133 () Bool)

(assert (=> d!106185 (=> (not res!566133) (not e!463921))))

(declare-fun lt!377455 () ListLongMap!8979)

(assert (=> d!106185 (= res!566133 (contains!4190 lt!377455 (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun lt!377454 () List!15949)

(assert (=> d!106185 (= lt!377455 (ListLongMap!8980 lt!377454))))

(declare-fun lt!377453 () Unit!28447)

(declare-fun lt!377452 () Unit!28447)

(assert (=> d!106185 (= lt!377453 lt!377452)))

(assert (=> d!106185 (= (getValueByKey!414 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(assert (=> d!106185 (= lt!377452 (lemmaContainsTupThenGetReturnValue!231 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(assert (=> d!106185 (= lt!377454 (insertStrictlySorted!270 (toList!4505 lt!377306) (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(assert (=> d!106185 (= (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)) lt!377455)))

(declare-fun b!831892 () Bool)

(declare-fun res!566134 () Bool)

(assert (=> b!831892 (=> (not res!566134) (not e!463921))))

(assert (=> b!831892 (= res!566134 (= (getValueByKey!414 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(declare-fun b!831893 () Bool)

(assert (=> b!831893 (= e!463921 (contains!4191 (toList!4505 lt!377455) (tuple2!10167 lt!377321 minValue!754)))))

(assert (= (and d!106185 res!566133) b!831892))

(assert (= (and b!831892 res!566134) b!831893))

(declare-fun m!775469 () Bool)

(assert (=> d!106185 m!775469))

(declare-fun m!775471 () Bool)

(assert (=> d!106185 m!775471))

(declare-fun m!775473 () Bool)

(assert (=> d!106185 m!775473))

(declare-fun m!775475 () Bool)

(assert (=> d!106185 m!775475))

(declare-fun m!775477 () Bool)

(assert (=> b!831892 m!775477))

(declare-fun m!775479 () Bool)

(assert (=> b!831893 m!775479))

(assert (=> b!831695 d!106185))

(declare-fun d!106187 () Bool)

(assert (=> d!106187 (= (apply!373 lt!377306 lt!377312) (get!11832 (getValueByKey!414 (toList!4505 lt!377306) lt!377312)))))

(declare-fun bs!23229 () Bool)

(assert (= bs!23229 d!106187))

(declare-fun m!775481 () Bool)

(assert (=> bs!23229 m!775481))

(assert (=> bs!23229 m!775481))

(declare-fun m!775483 () Bool)

(assert (=> bs!23229 m!775483))

(assert (=> b!831695 d!106187))

(declare-fun d!106189 () Bool)

(assert (=> d!106189 (contains!4190 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377310)))

(declare-fun lt!377458 () Unit!28447)

(declare-fun choose!1434 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> d!106189 (= lt!377458 (choose!1434 lt!377308 lt!377313 zeroValueBefore!34 lt!377310))))

(assert (=> d!106189 (contains!4190 lt!377308 lt!377310)))

(assert (=> d!106189 (= (addStillContains!324 lt!377308 lt!377313 zeroValueBefore!34 lt!377310) lt!377458)))

(declare-fun bs!23230 () Bool)

(assert (= bs!23230 d!106189))

(assert (=> bs!23230 m!775111))

(assert (=> bs!23230 m!775111))

(assert (=> bs!23230 m!775113))

(declare-fun m!775485 () Bool)

(assert (=> bs!23230 m!775485))

(declare-fun m!775487 () Bool)

(assert (=> bs!23230 m!775487))

(assert (=> b!831695 d!106189))

(declare-fun d!106191 () Bool)

(assert (=> d!106191 (= (apply!373 lt!377319 lt!377302) (get!11832 (getValueByKey!414 (toList!4505 lt!377319) lt!377302)))))

(declare-fun bs!23231 () Bool)

(assert (= bs!23231 d!106191))

(declare-fun m!775489 () Bool)

(assert (=> bs!23231 m!775489))

(assert (=> bs!23231 m!775489))

(declare-fun m!775491 () Bool)

(assert (=> bs!23231 m!775491))

(assert (=> b!831695 d!106191))

(declare-fun d!106193 () Bool)

(declare-fun e!463922 () Bool)

(assert (=> d!106193 e!463922))

(declare-fun res!566135 () Bool)

(assert (=> d!106193 (=> (not res!566135) (not e!463922))))

(declare-fun lt!377462 () ListLongMap!8979)

(assert (=> d!106193 (= res!566135 (contains!4190 lt!377462 (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun lt!377461 () List!15949)

(assert (=> d!106193 (= lt!377462 (ListLongMap!8980 lt!377461))))

(declare-fun lt!377460 () Unit!28447)

(declare-fun lt!377459 () Unit!28447)

(assert (=> d!106193 (= lt!377460 lt!377459)))

(assert (=> d!106193 (= (getValueByKey!414 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(assert (=> d!106193 (= lt!377459 (lemmaContainsTupThenGetReturnValue!231 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(assert (=> d!106193 (= lt!377461 (insertStrictlySorted!270 (toList!4505 lt!377311) (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(assert (=> d!106193 (= (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)) lt!377462)))

(declare-fun b!831895 () Bool)

(declare-fun res!566136 () Bool)

(assert (=> b!831895 (=> (not res!566136) (not e!463922))))

(assert (=> b!831895 (= res!566136 (= (getValueByKey!414 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(declare-fun b!831896 () Bool)

(assert (=> b!831896 (= e!463922 (contains!4191 (toList!4505 lt!377462) (tuple2!10167 lt!377303 minValue!754)))))

(assert (= (and d!106193 res!566135) b!831895))

(assert (= (and b!831895 res!566136) b!831896))

(declare-fun m!775493 () Bool)

(assert (=> d!106193 m!775493))

(declare-fun m!775495 () Bool)

(assert (=> d!106193 m!775495))

(declare-fun m!775497 () Bool)

(assert (=> d!106193 m!775497))

(declare-fun m!775499 () Bool)

(assert (=> d!106193 m!775499))

(declare-fun m!775501 () Bool)

(assert (=> b!831895 m!775501))

(declare-fun m!775503 () Bool)

(assert (=> b!831896 m!775503))

(assert (=> b!831695 d!106193))

(declare-fun d!106195 () Bool)

(assert (=> d!106195 (= (apply!373 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377302) (apply!373 lt!377319 lt!377302))))

(declare-fun lt!377465 () Unit!28447)

(declare-fun choose!1435 (ListLongMap!8979 (_ BitVec 64) V!25283 (_ BitVec 64)) Unit!28447)

(assert (=> d!106195 (= lt!377465 (choose!1435 lt!377319 lt!377315 zeroValueBefore!34 lt!377302))))

(declare-fun e!463925 () Bool)

(assert (=> d!106195 e!463925))

(declare-fun res!566139 () Bool)

(assert (=> d!106195 (=> (not res!566139) (not e!463925))))

(assert (=> d!106195 (= res!566139 (contains!4190 lt!377319 lt!377302))))

(assert (=> d!106195 (= (addApplyDifferent!324 lt!377319 lt!377315 zeroValueBefore!34 lt!377302) lt!377465)))

(declare-fun b!831900 () Bool)

(assert (=> b!831900 (= e!463925 (not (= lt!377302 lt!377315)))))

(assert (= (and d!106195 res!566139) b!831900))

(declare-fun m!775505 () Bool)

(assert (=> d!106195 m!775505))

(assert (=> d!106195 m!775121))

(assert (=> d!106195 m!775125))

(assert (=> d!106195 m!775125))

(assert (=> d!106195 m!775127))

(declare-fun m!775507 () Bool)

(assert (=> d!106195 m!775507))

(assert (=> b!831695 d!106195))

(declare-fun d!106197 () Bool)

(assert (=> d!106197 (= (apply!373 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)) lt!377312) (apply!373 lt!377306 lt!377312))))

(declare-fun lt!377466 () Unit!28447)

(assert (=> d!106197 (= lt!377466 (choose!1435 lt!377306 lt!377321 minValue!754 lt!377312))))

(declare-fun e!463926 () Bool)

(assert (=> d!106197 e!463926))

(declare-fun res!566140 () Bool)

(assert (=> d!106197 (=> (not res!566140) (not e!463926))))

(assert (=> d!106197 (= res!566140 (contains!4190 lt!377306 lt!377312))))

(assert (=> d!106197 (= (addApplyDifferent!324 lt!377306 lt!377321 minValue!754 lt!377312) lt!377466)))

(declare-fun b!831901 () Bool)

(assert (=> b!831901 (= e!463926 (not (= lt!377312 lt!377321)))))

(assert (= (and d!106197 res!566140) b!831901))

(declare-fun m!775509 () Bool)

(assert (=> d!106197 m!775509))

(assert (=> d!106197 m!775129))

(assert (=> d!106197 m!775105))

(assert (=> d!106197 m!775105))

(assert (=> d!106197 m!775123))

(declare-fun m!775511 () Bool)

(assert (=> d!106197 m!775511))

(assert (=> b!831695 d!106197))

(assert (=> b!831695 d!106109))

(declare-fun d!106199 () Bool)

(assert (=> d!106199 (= (apply!373 lt!377311 lt!377323) (get!11832 (getValueByKey!414 (toList!4505 lt!377311) lt!377323)))))

(declare-fun bs!23232 () Bool)

(assert (= bs!23232 d!106199))

(declare-fun m!775513 () Bool)

(assert (=> bs!23232 m!775513))

(assert (=> bs!23232 m!775513))

(declare-fun m!775515 () Bool)

(assert (=> bs!23232 m!775515))

(assert (=> b!831695 d!106199))

(declare-fun d!106201 () Bool)

(assert (=> d!106201 (= (apply!373 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)) lt!377323) (apply!373 lt!377311 lt!377323))))

(declare-fun lt!377467 () Unit!28447)

(assert (=> d!106201 (= lt!377467 (choose!1435 lt!377311 lt!377303 minValue!754 lt!377323))))

(declare-fun e!463927 () Bool)

(assert (=> d!106201 e!463927))

(declare-fun res!566141 () Bool)

(assert (=> d!106201 (=> (not res!566141) (not e!463927))))

(assert (=> d!106201 (= res!566141 (contains!4190 lt!377311 lt!377323))))

(assert (=> d!106201 (= (addApplyDifferent!324 lt!377311 lt!377303 minValue!754 lt!377323) lt!377467)))

(declare-fun b!831902 () Bool)

(assert (=> b!831902 (= e!463927 (not (= lt!377323 lt!377303)))))

(assert (= (and d!106201 res!566141) b!831902))

(declare-fun m!775517 () Bool)

(assert (=> d!106201 m!775517))

(assert (=> d!106201 m!775117))

(assert (=> d!106201 m!775107))

(assert (=> d!106201 m!775107))

(assert (=> d!106201 m!775109))

(declare-fun m!775519 () Bool)

(assert (=> d!106201 m!775519))

(assert (=> b!831695 d!106201))

(declare-fun d!106203 () Bool)

(assert (=> d!106203 (= (apply!373 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)) lt!377312) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))) lt!377312)))))

(declare-fun bs!23233 () Bool)

(assert (= bs!23233 d!106203))

(declare-fun m!775521 () Bool)

(assert (=> bs!23233 m!775521))

(assert (=> bs!23233 m!775521))

(declare-fun m!775523 () Bool)

(assert (=> bs!23233 m!775523))

(assert (=> b!831695 d!106203))

(declare-fun d!106205 () Bool)

(assert (=> d!106205 (= (apply!373 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377302) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377302)))))

(declare-fun bs!23234 () Bool)

(assert (= bs!23234 d!106205))

(declare-fun m!775525 () Bool)

(assert (=> bs!23234 m!775525))

(assert (=> bs!23234 m!775525))

(declare-fun m!775527 () Bool)

(assert (=> bs!23234 m!775527))

(assert (=> b!831695 d!106205))

(declare-fun d!106207 () Bool)

(assert (=> d!106207 (= (apply!373 lt!377250 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11832 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23235 () Bool)

(assert (= bs!23235 d!106207))

(assert (=> bs!23235 m!775051))

(declare-fun m!775529 () Bool)

(assert (=> bs!23235 m!775529))

(assert (=> bs!23235 m!775529))

(declare-fun m!775531 () Bool)

(assert (=> bs!23235 m!775531))

(assert (=> b!831645 d!106207))

(assert (=> b!831645 d!106141))

(declare-fun d!106209 () Bool)

(declare-fun lt!377470 () Bool)

(declare-fun content!387 (List!15950) (InoxSet (_ BitVec 64)))

(assert (=> d!106209 (= lt!377470 (select (content!387 Nil!15947) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463932 () Bool)

(assert (=> d!106209 (= lt!377470 e!463932)))

(declare-fun res!566147 () Bool)

(assert (=> d!106209 (=> (not res!566147) (not e!463932))))

(assert (=> d!106209 (= res!566147 ((_ is Cons!15946) Nil!15947))))

(assert (=> d!106209 (= (contains!4192 Nil!15947 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377470)))

(declare-fun b!831907 () Bool)

(declare-fun e!463933 () Bool)

(assert (=> b!831907 (= e!463932 e!463933)))

(declare-fun res!566146 () Bool)

(assert (=> b!831907 (=> res!566146 e!463933)))

(assert (=> b!831907 (= res!566146 (= (h!17076 Nil!15947) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831908 () Bool)

(assert (=> b!831908 (= e!463933 (contains!4192 (t!22309 Nil!15947) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106209 res!566147) b!831907))

(assert (= (and b!831907 (not res!566146)) b!831908))

(declare-fun m!775533 () Bool)

(assert (=> d!106209 m!775533))

(assert (=> d!106209 m!775051))

(declare-fun m!775535 () Bool)

(assert (=> d!106209 m!775535))

(assert (=> b!831908 m!775051))

(declare-fun m!775537 () Bool)

(assert (=> b!831908 m!775537))

(assert (=> b!831767 d!106209))

(declare-fun d!106211 () Bool)

(declare-fun e!463935 () Bool)

(assert (=> d!106211 e!463935))

(declare-fun res!566148 () Bool)

(assert (=> d!106211 (=> res!566148 e!463935)))

(declare-fun lt!377473 () Bool)

(assert (=> d!106211 (= res!566148 (not lt!377473))))

(declare-fun lt!377471 () Bool)

(assert (=> d!106211 (= lt!377473 lt!377471)))

(declare-fun lt!377474 () Unit!28447)

(declare-fun e!463934 () Unit!28447)

(assert (=> d!106211 (= lt!377474 e!463934)))

(declare-fun c!90333 () Bool)

(assert (=> d!106211 (= c!90333 lt!377471)))

(assert (=> d!106211 (= lt!377471 (containsKey!400 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106211 (= (contains!4190 lt!377318 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377473)))

(declare-fun b!831909 () Bool)

(declare-fun lt!377472 () Unit!28447)

(assert (=> b!831909 (= e!463934 lt!377472)))

(assert (=> b!831909 (= lt!377472 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831909 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831910 () Bool)

(declare-fun Unit!28458 () Unit!28447)

(assert (=> b!831910 (= e!463934 Unit!28458)))

(declare-fun b!831911 () Bool)

(assert (=> b!831911 (= e!463935 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106211 c!90333) b!831909))

(assert (= (and d!106211 (not c!90333)) b!831910))

(assert (= (and d!106211 (not res!566148)) b!831911))

(assert (=> d!106211 m!775051))

(declare-fun m!775539 () Bool)

(assert (=> d!106211 m!775539))

(assert (=> b!831909 m!775051))

(declare-fun m!775541 () Bool)

(assert (=> b!831909 m!775541))

(assert (=> b!831909 m!775051))

(declare-fun m!775543 () Bool)

(assert (=> b!831909 m!775543))

(assert (=> b!831909 m!775543))

(declare-fun m!775545 () Bool)

(assert (=> b!831909 m!775545))

(assert (=> b!831911 m!775051))

(assert (=> b!831911 m!775543))

(assert (=> b!831911 m!775543))

(assert (=> b!831911 m!775545))

(assert (=> b!831711 d!106211))

(declare-fun d!106213 () Bool)

(declare-fun e!463937 () Bool)

(assert (=> d!106213 e!463937))

(declare-fun res!566149 () Bool)

(assert (=> d!106213 (=> res!566149 e!463937)))

(declare-fun lt!377477 () Bool)

(assert (=> d!106213 (= res!566149 (not lt!377477))))

(declare-fun lt!377475 () Bool)

(assert (=> d!106213 (= lt!377477 lt!377475)))

(declare-fun lt!377478 () Unit!28447)

(declare-fun e!463936 () Unit!28447)

(assert (=> d!106213 (= lt!377478 e!463936)))

(declare-fun c!90334 () Bool)

(assert (=> d!106213 (= c!90334 lt!377475)))

(assert (=> d!106213 (= lt!377475 (containsKey!400 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(assert (=> d!106213 (= (contains!4190 lt!377357 (_1!5094 lt!377164)) lt!377477)))

(declare-fun b!831912 () Bool)

(declare-fun lt!377476 () Unit!28447)

(assert (=> b!831912 (= e!463936 lt!377476)))

(assert (=> b!831912 (= lt!377476 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(assert (=> b!831912 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(declare-fun b!831913 () Bool)

(declare-fun Unit!28459 () Unit!28447)

(assert (=> b!831913 (= e!463936 Unit!28459)))

(declare-fun b!831914 () Bool)

(assert (=> b!831914 (= e!463937 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164))))))

(assert (= (and d!106213 c!90334) b!831912))

(assert (= (and d!106213 (not c!90334)) b!831913))

(assert (= (and d!106213 (not res!566149)) b!831914))

(declare-fun m!775547 () Bool)

(assert (=> d!106213 m!775547))

(declare-fun m!775549 () Bool)

(assert (=> b!831912 m!775549))

(assert (=> b!831912 m!775223))

(assert (=> b!831912 m!775223))

(declare-fun m!775551 () Bool)

(assert (=> b!831912 m!775551))

(assert (=> b!831914 m!775223))

(assert (=> b!831914 m!775223))

(assert (=> b!831914 m!775551))

(assert (=> d!106121 d!106213))

(declare-fun b!831917 () Bool)

(declare-fun e!463939 () Option!420)

(assert (=> b!831917 (= e!463939 (getValueByKey!414 (t!22308 lt!377356) (_1!5094 lt!377164)))))

(declare-fun b!831918 () Bool)

(assert (=> b!831918 (= e!463939 None!418)))

(declare-fun d!106215 () Bool)

(declare-fun c!90335 () Bool)

(assert (=> d!106215 (= c!90335 (and ((_ is Cons!15945) lt!377356) (= (_1!5094 (h!17075 lt!377356)) (_1!5094 lt!377164))))))

(declare-fun e!463938 () Option!420)

(assert (=> d!106215 (= (getValueByKey!414 lt!377356 (_1!5094 lt!377164)) e!463938)))

(declare-fun b!831916 () Bool)

(assert (=> b!831916 (= e!463938 e!463939)))

(declare-fun c!90336 () Bool)

(assert (=> b!831916 (= c!90336 (and ((_ is Cons!15945) lt!377356) (not (= (_1!5094 (h!17075 lt!377356)) (_1!5094 lt!377164)))))))

(declare-fun b!831915 () Bool)

(assert (=> b!831915 (= e!463938 (Some!419 (_2!5094 (h!17075 lt!377356))))))

(assert (= (and d!106215 c!90335) b!831915))

(assert (= (and d!106215 (not c!90335)) b!831916))

(assert (= (and b!831916 c!90336) b!831917))

(assert (= (and b!831916 (not c!90336)) b!831918))

(declare-fun m!775553 () Bool)

(assert (=> b!831917 m!775553))

(assert (=> d!106121 d!106215))

(declare-fun d!106217 () Bool)

(assert (=> d!106217 (= (getValueByKey!414 lt!377356 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(declare-fun lt!377479 () Unit!28447)

(assert (=> d!106217 (= lt!377479 (choose!1433 lt!377356 (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun e!463940 () Bool)

(assert (=> d!106217 e!463940))

(declare-fun res!566150 () Bool)

(assert (=> d!106217 (=> (not res!566150) (not e!463940))))

(assert (=> d!106217 (= res!566150 (isStrictlySorted!438 lt!377356))))

(assert (=> d!106217 (= (lemmaContainsTupThenGetReturnValue!231 lt!377356 (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377479)))

(declare-fun b!831919 () Bool)

(declare-fun res!566151 () Bool)

(assert (=> b!831919 (=> (not res!566151) (not e!463940))))

(assert (=> b!831919 (= res!566151 (containsKey!400 lt!377356 (_1!5094 lt!377164)))))

(declare-fun b!831920 () Bool)

(assert (=> b!831920 (= e!463940 (contains!4191 lt!377356 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!106217 res!566150) b!831919))

(assert (= (and b!831919 res!566151) b!831920))

(assert (=> d!106217 m!775217))

(declare-fun m!775555 () Bool)

(assert (=> d!106217 m!775555))

(declare-fun m!775557 () Bool)

(assert (=> d!106217 m!775557))

(declare-fun m!775559 () Bool)

(assert (=> b!831919 m!775559))

(declare-fun m!775561 () Bool)

(assert (=> b!831920 m!775561))

(assert (=> d!106121 d!106217))

(declare-fun b!831921 () Bool)

(declare-fun e!463941 () Bool)

(declare-fun lt!377480 () List!15949)

(assert (=> b!831921 (= e!463941 (contains!4191 lt!377480 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!831922 () Bool)

(declare-fun res!566153 () Bool)

(assert (=> b!831922 (=> (not res!566153) (not e!463941))))

(assert (=> b!831922 (= res!566153 (containsKey!400 lt!377480 (_1!5094 lt!377164)))))

(declare-fun b!831923 () Bool)

(declare-fun e!463943 () List!15949)

(declare-fun call!36381 () List!15949)

(assert (=> b!831923 (= e!463943 call!36381)))

(declare-fun e!463945 () List!15949)

(declare-fun bm!36378 () Bool)

(declare-fun c!90337 () Bool)

(declare-fun call!36383 () List!15949)

(assert (=> bm!36378 (= call!36383 ($colon$colon!536 e!463945 (ite c!90337 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))))))

(declare-fun c!90338 () Bool)

(assert (=> bm!36378 (= c!90338 c!90337)))

(declare-fun b!831925 () Bool)

(declare-fun e!463944 () List!15949)

(assert (=> b!831925 (= e!463944 call!36383)))

(declare-fun bm!36379 () Bool)

(declare-fun call!36382 () List!15949)

(assert (=> bm!36379 (= call!36382 call!36383)))

(declare-fun b!831926 () Bool)

(declare-fun e!463942 () List!15949)

(assert (=> b!831926 (= e!463942 call!36382)))

(declare-fun c!90339 () Bool)

(declare-fun c!90340 () Bool)

(declare-fun b!831927 () Bool)

(assert (=> b!831927 (= e!463945 (ite c!90340 (t!22308 (toList!4505 lt!377158)) (ite c!90339 (Cons!15945 (h!17075 (toList!4505 lt!377158)) (t!22308 (toList!4505 lt!377158))) Nil!15946)))))

(declare-fun b!831928 () Bool)

(assert (=> b!831928 (= e!463943 call!36381)))

(declare-fun bm!36380 () Bool)

(assert (=> bm!36380 (= call!36381 call!36382)))

(declare-fun b!831929 () Bool)

(assert (=> b!831929 (= e!463944 e!463942)))

(assert (=> b!831929 (= c!90340 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (= (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377164))))))

(declare-fun b!831930 () Bool)

(assert (=> b!831930 (= e!463945 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377158)) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun b!831924 () Bool)

(assert (=> b!831924 (= c!90339 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377164))))))

(assert (=> b!831924 (= e!463942 e!463943)))

(declare-fun d!106219 () Bool)

(assert (=> d!106219 e!463941))

(declare-fun res!566152 () Bool)

(assert (=> d!106219 (=> (not res!566152) (not e!463941))))

(assert (=> d!106219 (= res!566152 (isStrictlySorted!438 lt!377480))))

(assert (=> d!106219 (= lt!377480 e!463944)))

(assert (=> d!106219 (= c!90337 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377164))))))

(assert (=> d!106219 (isStrictlySorted!438 (toList!4505 lt!377158))))

(assert (=> d!106219 (= (insertStrictlySorted!270 (toList!4505 lt!377158) (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377480)))

(assert (= (and d!106219 c!90337) b!831925))

(assert (= (and d!106219 (not c!90337)) b!831929))

(assert (= (and b!831929 c!90340) b!831926))

(assert (= (and b!831929 (not c!90340)) b!831924))

(assert (= (and b!831924 c!90339) b!831923))

(assert (= (and b!831924 (not c!90339)) b!831928))

(assert (= (or b!831923 b!831928) bm!36380))

(assert (= (or b!831926 bm!36380) bm!36379))

(assert (= (or b!831925 bm!36379) bm!36378))

(assert (= (and bm!36378 c!90338) b!831930))

(assert (= (and bm!36378 (not c!90338)) b!831927))

(assert (= (and d!106219 res!566152) b!831922))

(assert (= (and b!831922 res!566153) b!831921))

(declare-fun m!775563 () Bool)

(assert (=> b!831921 m!775563))

(declare-fun m!775565 () Bool)

(assert (=> d!106219 m!775565))

(declare-fun m!775567 () Bool)

(assert (=> d!106219 m!775567))

(declare-fun m!775569 () Bool)

(assert (=> b!831922 m!775569))

(declare-fun m!775571 () Bool)

(assert (=> bm!36378 m!775571))

(declare-fun m!775573 () Bool)

(assert (=> b!831930 m!775573))

(assert (=> d!106121 d!106219))

(assert (=> b!831765 d!106147))

(declare-fun d!106221 () Bool)

(declare-fun e!463947 () Bool)

(assert (=> d!106221 e!463947))

(declare-fun res!566154 () Bool)

(assert (=> d!106221 (=> res!566154 e!463947)))

(declare-fun lt!377483 () Bool)

(assert (=> d!106221 (= res!566154 (not lt!377483))))

(declare-fun lt!377481 () Bool)

(assert (=> d!106221 (= lt!377483 lt!377481)))

(declare-fun lt!377484 () Unit!28447)

(declare-fun e!463946 () Unit!28447)

(assert (=> d!106221 (= lt!377484 e!463946)))

(declare-fun c!90341 () Bool)

(assert (=> d!106221 (= c!90341 lt!377481)))

(assert (=> d!106221 (= lt!377481 (containsKey!400 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(assert (=> d!106221 (= (contains!4190 lt!377365 (_1!5094 lt!377161)) lt!377483)))

(declare-fun b!831931 () Bool)

(declare-fun lt!377482 () Unit!28447)

(assert (=> b!831931 (= e!463946 lt!377482)))

(assert (=> b!831931 (= lt!377482 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(assert (=> b!831931 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(declare-fun b!831932 () Bool)

(declare-fun Unit!28460 () Unit!28447)

(assert (=> b!831932 (= e!463946 Unit!28460)))

(declare-fun b!831933 () Bool)

(assert (=> b!831933 (= e!463947 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161))))))

(assert (= (and d!106221 c!90341) b!831931))

(assert (= (and d!106221 (not c!90341)) b!831932))

(assert (= (and d!106221 (not res!566154)) b!831933))

(declare-fun m!775575 () Bool)

(assert (=> d!106221 m!775575))

(declare-fun m!775577 () Bool)

(assert (=> b!831931 m!775577))

(assert (=> b!831931 m!775247))

(assert (=> b!831931 m!775247))

(declare-fun m!775579 () Bool)

(assert (=> b!831931 m!775579))

(assert (=> b!831933 m!775247))

(assert (=> b!831933 m!775247))

(assert (=> b!831933 m!775579))

(assert (=> d!106131 d!106221))

(declare-fun b!831936 () Bool)

(declare-fun e!463949 () Option!420)

(assert (=> b!831936 (= e!463949 (getValueByKey!414 (t!22308 lt!377364) (_1!5094 lt!377161)))))

(declare-fun b!831937 () Bool)

(assert (=> b!831937 (= e!463949 None!418)))

(declare-fun d!106223 () Bool)

(declare-fun c!90342 () Bool)

(assert (=> d!106223 (= c!90342 (and ((_ is Cons!15945) lt!377364) (= (_1!5094 (h!17075 lt!377364)) (_1!5094 lt!377161))))))

(declare-fun e!463948 () Option!420)

(assert (=> d!106223 (= (getValueByKey!414 lt!377364 (_1!5094 lt!377161)) e!463948)))

(declare-fun b!831935 () Bool)

(assert (=> b!831935 (= e!463948 e!463949)))

(declare-fun c!90343 () Bool)

(assert (=> b!831935 (= c!90343 (and ((_ is Cons!15945) lt!377364) (not (= (_1!5094 (h!17075 lt!377364)) (_1!5094 lt!377161)))))))

(declare-fun b!831934 () Bool)

(assert (=> b!831934 (= e!463948 (Some!419 (_2!5094 (h!17075 lt!377364))))))

(assert (= (and d!106223 c!90342) b!831934))

(assert (= (and d!106223 (not c!90342)) b!831935))

(assert (= (and b!831935 c!90343) b!831936))

(assert (= (and b!831935 (not c!90343)) b!831937))

(declare-fun m!775581 () Bool)

(assert (=> b!831936 m!775581))

(assert (=> d!106131 d!106223))

(declare-fun d!106225 () Bool)

(assert (=> d!106225 (= (getValueByKey!414 lt!377364 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(declare-fun lt!377485 () Unit!28447)

(assert (=> d!106225 (= lt!377485 (choose!1433 lt!377364 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun e!463950 () Bool)

(assert (=> d!106225 e!463950))

(declare-fun res!566155 () Bool)

(assert (=> d!106225 (=> (not res!566155) (not e!463950))))

(assert (=> d!106225 (= res!566155 (isStrictlySorted!438 lt!377364))))

(assert (=> d!106225 (= (lemmaContainsTupThenGetReturnValue!231 lt!377364 (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377485)))

(declare-fun b!831938 () Bool)

(declare-fun res!566156 () Bool)

(assert (=> b!831938 (=> (not res!566156) (not e!463950))))

(assert (=> b!831938 (= res!566156 (containsKey!400 lt!377364 (_1!5094 lt!377161)))))

(declare-fun b!831939 () Bool)

(assert (=> b!831939 (= e!463950 (contains!4191 lt!377364 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106225 res!566155) b!831938))

(assert (= (and b!831938 res!566156) b!831939))

(assert (=> d!106225 m!775241))

(declare-fun m!775583 () Bool)

(assert (=> d!106225 m!775583))

(declare-fun m!775585 () Bool)

(assert (=> d!106225 m!775585))

(declare-fun m!775587 () Bool)

(assert (=> b!831938 m!775587))

(declare-fun m!775589 () Bool)

(assert (=> b!831939 m!775589))

(assert (=> d!106131 d!106225))

(declare-fun b!831940 () Bool)

(declare-fun e!463951 () Bool)

(declare-fun lt!377486 () List!15949)

(assert (=> b!831940 (= e!463951 (contains!4191 lt!377486 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!831941 () Bool)

(declare-fun res!566158 () Bool)

(assert (=> b!831941 (=> (not res!566158) (not e!463951))))

(assert (=> b!831941 (= res!566158 (containsKey!400 lt!377486 (_1!5094 lt!377161)))))

(declare-fun b!831942 () Bool)

(declare-fun e!463953 () List!15949)

(declare-fun call!36384 () List!15949)

(assert (=> b!831942 (= e!463953 call!36384)))

(declare-fun bm!36381 () Bool)

(declare-fun e!463955 () List!15949)

(declare-fun call!36386 () List!15949)

(declare-fun c!90344 () Bool)

(assert (=> bm!36381 (= call!36386 ($colon$colon!536 e!463955 (ite c!90344 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90345 () Bool)

(assert (=> bm!36381 (= c!90345 c!90344)))

(declare-fun b!831944 () Bool)

(declare-fun e!463954 () List!15949)

(assert (=> b!831944 (= e!463954 call!36386)))

(declare-fun bm!36382 () Bool)

(declare-fun call!36385 () List!15949)

(assert (=> bm!36382 (= call!36385 call!36386)))

(declare-fun b!831945 () Bool)

(declare-fun e!463952 () List!15949)

(assert (=> b!831945 (= e!463952 call!36385)))

(declare-fun c!90347 () Bool)

(declare-fun b!831946 () Bool)

(declare-fun c!90346 () Bool)

(assert (=> b!831946 (= e!463955 (ite c!90347 (t!22308 (toList!4505 lt!377158)) (ite c!90346 (Cons!15945 (h!17075 (toList!4505 lt!377158)) (t!22308 (toList!4505 lt!377158))) Nil!15946)))))

(declare-fun b!831947 () Bool)

(assert (=> b!831947 (= e!463953 call!36384)))

(declare-fun bm!36383 () Bool)

(assert (=> bm!36383 (= call!36384 call!36385)))

(declare-fun b!831948 () Bool)

(assert (=> b!831948 (= e!463954 e!463952)))

(assert (=> b!831948 (= c!90347 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (= (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377161))))))

(declare-fun b!831949 () Bool)

(assert (=> b!831949 (= e!463955 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377158)) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!831943 () Bool)

(assert (=> b!831943 (= c!90346 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377161))))))

(assert (=> b!831943 (= e!463952 e!463953)))

(declare-fun d!106227 () Bool)

(assert (=> d!106227 e!463951))

(declare-fun res!566157 () Bool)

(assert (=> d!106227 (=> (not res!566157) (not e!463951))))

(assert (=> d!106227 (= res!566157 (isStrictlySorted!438 lt!377486))))

(assert (=> d!106227 (= lt!377486 e!463954)))

(assert (=> d!106227 (= c!90344 (and ((_ is Cons!15945) (toList!4505 lt!377158)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 lt!377161))))))

(assert (=> d!106227 (isStrictlySorted!438 (toList!4505 lt!377158))))

(assert (=> d!106227 (= (insertStrictlySorted!270 (toList!4505 lt!377158) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377486)))

(assert (= (and d!106227 c!90344) b!831944))

(assert (= (and d!106227 (not c!90344)) b!831948))

(assert (= (and b!831948 c!90347) b!831945))

(assert (= (and b!831948 (not c!90347)) b!831943))

(assert (= (and b!831943 c!90346) b!831942))

(assert (= (and b!831943 (not c!90346)) b!831947))

(assert (= (or b!831942 b!831947) bm!36383))

(assert (= (or b!831945 bm!36383) bm!36382))

(assert (= (or b!831944 bm!36382) bm!36381))

(assert (= (and bm!36381 c!90345) b!831949))

(assert (= (and bm!36381 (not c!90345)) b!831946))

(assert (= (and d!106227 res!566157) b!831941))

(assert (= (and b!831941 res!566158) b!831940))

(declare-fun m!775591 () Bool)

(assert (=> b!831940 m!775591))

(declare-fun m!775593 () Bool)

(assert (=> d!106227 m!775593))

(assert (=> d!106227 m!775567))

(declare-fun m!775595 () Bool)

(assert (=> b!831941 m!775595))

(declare-fun m!775597 () Bool)

(assert (=> bm!36381 m!775597))

(declare-fun m!775599 () Bool)

(assert (=> b!831949 m!775599))

(assert (=> d!106131 d!106227))

(declare-fun d!106229 () Bool)

(declare-fun e!463956 () Bool)

(assert (=> d!106229 e!463956))

(declare-fun res!566159 () Bool)

(assert (=> d!106229 (=> (not res!566159) (not e!463956))))

(declare-fun lt!377490 () ListLongMap!8979)

(assert (=> d!106229 (= res!566159 (contains!4190 lt!377490 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377489 () List!15949)

(assert (=> d!106229 (= lt!377490 (ListLongMap!8980 lt!377489))))

(declare-fun lt!377488 () Unit!28447)

(declare-fun lt!377487 () Unit!28447)

(assert (=> d!106229 (= lt!377488 lt!377487)))

(assert (=> d!106229 (= (getValueByKey!414 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106229 (= lt!377487 (lemmaContainsTupThenGetReturnValue!231 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106229 (= lt!377489 (insertStrictlySorted!270 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106229 (= (+!2013 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377490)))

(declare-fun b!831950 () Bool)

(declare-fun res!566160 () Bool)

(assert (=> b!831950 (=> (not res!566160) (not e!463956))))

(assert (=> b!831950 (= res!566160 (= (getValueByKey!414 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831951 () Bool)

(assert (=> b!831951 (= e!463956 (contains!4191 (toList!4505 lt!377490) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106229 res!566159) b!831950))

(assert (= (and b!831950 res!566160) b!831951))

(declare-fun m!775601 () Bool)

(assert (=> d!106229 m!775601))

(declare-fun m!775603 () Bool)

(assert (=> d!106229 m!775603))

(declare-fun m!775605 () Bool)

(assert (=> d!106229 m!775605))

(declare-fun m!775607 () Bool)

(assert (=> d!106229 m!775607))

(declare-fun m!775609 () Bool)

(assert (=> b!831950 m!775609))

(declare-fun m!775611 () Bool)

(assert (=> b!831951 m!775611))

(assert (=> bm!36354 d!106229))

(declare-fun d!106231 () Bool)

(declare-fun e!463958 () Bool)

(assert (=> d!106231 e!463958))

(declare-fun res!566161 () Bool)

(assert (=> d!106231 (=> res!566161 e!463958)))

(declare-fun lt!377493 () Bool)

(assert (=> d!106231 (= res!566161 (not lt!377493))))

(declare-fun lt!377491 () Bool)

(assert (=> d!106231 (= lt!377493 lt!377491)))

(declare-fun lt!377494 () Unit!28447)

(declare-fun e!463957 () Unit!28447)

(assert (=> d!106231 (= lt!377494 e!463957)))

(declare-fun c!90348 () Bool)

(assert (=> d!106231 (= c!90348 lt!377491)))

(assert (=> d!106231 (= lt!377491 (containsKey!400 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106231 (= (contains!4190 lt!377349 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377493)))

(declare-fun b!831952 () Bool)

(declare-fun lt!377492 () Unit!28447)

(assert (=> b!831952 (= e!463957 lt!377492)))

(assert (=> b!831952 (= lt!377492 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!831952 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831953 () Bool)

(declare-fun Unit!28461 () Unit!28447)

(assert (=> b!831953 (= e!463957 Unit!28461)))

(declare-fun b!831954 () Bool)

(assert (=> b!831954 (= e!463958 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106231 c!90348) b!831952))

(assert (= (and d!106231 (not c!90348)) b!831953))

(assert (= (and d!106231 (not res!566161)) b!831954))

(declare-fun m!775613 () Bool)

(assert (=> d!106231 m!775613))

(declare-fun m!775615 () Bool)

(assert (=> b!831952 m!775615))

(assert (=> b!831952 m!775199))

(assert (=> b!831952 m!775199))

(declare-fun m!775617 () Bool)

(assert (=> b!831952 m!775617))

(assert (=> b!831954 m!775199))

(assert (=> b!831954 m!775199))

(assert (=> b!831954 m!775617))

(assert (=> d!106117 d!106231))

(declare-fun b!831957 () Bool)

(declare-fun e!463960 () Option!420)

(assert (=> b!831957 (= e!463960 (getValueByKey!414 (t!22308 lt!377348) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831958 () Bool)

(assert (=> b!831958 (= e!463960 None!418)))

(declare-fun d!106233 () Bool)

(declare-fun c!90349 () Bool)

(assert (=> d!106233 (= c!90349 (and ((_ is Cons!15945) lt!377348) (= (_1!5094 (h!17075 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463959 () Option!420)

(assert (=> d!106233 (= (getValueByKey!414 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463959)))

(declare-fun b!831956 () Bool)

(assert (=> b!831956 (= e!463959 e!463960)))

(declare-fun c!90350 () Bool)

(assert (=> b!831956 (= c!90350 (and ((_ is Cons!15945) lt!377348) (not (= (_1!5094 (h!17075 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831955 () Bool)

(assert (=> b!831955 (= e!463959 (Some!419 (_2!5094 (h!17075 lt!377348))))))

(assert (= (and d!106233 c!90349) b!831955))

(assert (= (and d!106233 (not c!90349)) b!831956))

(assert (= (and b!831956 c!90350) b!831957))

(assert (= (and b!831956 (not c!90350)) b!831958))

(declare-fun m!775619 () Bool)

(assert (=> b!831957 m!775619))

(assert (=> d!106117 d!106233))

(declare-fun d!106235 () Bool)

(assert (=> d!106235 (= (getValueByKey!414 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377495 () Unit!28447)

(assert (=> d!106235 (= lt!377495 (choose!1433 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463961 () Bool)

(assert (=> d!106235 e!463961))

(declare-fun res!566162 () Bool)

(assert (=> d!106235 (=> (not res!566162) (not e!463961))))

(assert (=> d!106235 (= res!566162 (isStrictlySorted!438 lt!377348))))

(assert (=> d!106235 (= (lemmaContainsTupThenGetReturnValue!231 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377495)))

(declare-fun b!831959 () Bool)

(declare-fun res!566163 () Bool)

(assert (=> b!831959 (=> (not res!566163) (not e!463961))))

(assert (=> b!831959 (= res!566163 (containsKey!400 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831960 () Bool)

(assert (=> b!831960 (= e!463961 (contains!4191 lt!377348 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106235 res!566162) b!831959))

(assert (= (and b!831959 res!566163) b!831960))

(assert (=> d!106235 m!775193))

(declare-fun m!775621 () Bool)

(assert (=> d!106235 m!775621))

(declare-fun m!775623 () Bool)

(assert (=> d!106235 m!775623))

(declare-fun m!775625 () Bool)

(assert (=> b!831959 m!775625))

(declare-fun m!775627 () Bool)

(assert (=> b!831960 m!775627))

(assert (=> d!106117 d!106235))

(declare-fun b!831961 () Bool)

(declare-fun e!463962 () Bool)

(declare-fun lt!377496 () List!15949)

(assert (=> b!831961 (= e!463962 (contains!4191 lt!377496 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831962 () Bool)

(declare-fun res!566165 () Bool)

(assert (=> b!831962 (=> (not res!566165) (not e!463962))))

(assert (=> b!831962 (= res!566165 (containsKey!400 lt!377496 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831963 () Bool)

(declare-fun e!463964 () List!15949)

(declare-fun call!36387 () List!15949)

(assert (=> b!831963 (= e!463964 call!36387)))

(declare-fun bm!36384 () Bool)

(declare-fun call!36389 () List!15949)

(declare-fun c!90351 () Bool)

(declare-fun e!463966 () List!15949)

(assert (=> bm!36384 (= call!36389 ($colon$colon!536 e!463966 (ite c!90351 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161))) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90352 () Bool)

(assert (=> bm!36384 (= c!90352 c!90351)))

(declare-fun b!831965 () Bool)

(declare-fun e!463965 () List!15949)

(assert (=> b!831965 (= e!463965 call!36389)))

(declare-fun bm!36385 () Bool)

(declare-fun call!36388 () List!15949)

(assert (=> bm!36385 (= call!36388 call!36389)))

(declare-fun b!831966 () Bool)

(declare-fun e!463963 () List!15949)

(assert (=> b!831966 (= e!463963 call!36388)))

(declare-fun b!831967 () Bool)

(declare-fun c!90353 () Bool)

(declare-fun c!90354 () Bool)

(assert (=> b!831967 (= e!463966 (ite c!90354 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))) (ite c!90353 (Cons!15945 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161))) (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) Nil!15946)))))

(declare-fun b!831968 () Bool)

(assert (=> b!831968 (= e!463964 call!36387)))

(declare-fun bm!36386 () Bool)

(assert (=> bm!36386 (= call!36387 call!36388)))

(declare-fun b!831969 () Bool)

(assert (=> b!831969 (= e!463965 e!463963)))

(assert (=> b!831969 (= c!90354 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 lt!377161))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831970 () Bool)

(assert (=> b!831970 (= e!463966 (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831964 () Bool)

(assert (=> b!831964 (= c!90353 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 lt!377161))) (bvsgt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!831964 (= e!463963 e!463964)))

(declare-fun d!106237 () Bool)

(assert (=> d!106237 e!463962))

(declare-fun res!566164 () Bool)

(assert (=> d!106237 (=> (not res!566164) (not e!463962))))

(assert (=> d!106237 (= res!566164 (isStrictlySorted!438 lt!377496))))

(assert (=> d!106237 (= lt!377496 e!463965)))

(assert (=> d!106237 (= c!90351 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 lt!377161))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106237 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377163 lt!377161)))))

(assert (=> d!106237 (= (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377163 lt!377161)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377496)))

(assert (= (and d!106237 c!90351) b!831965))

(assert (= (and d!106237 (not c!90351)) b!831969))

(assert (= (and b!831969 c!90354) b!831966))

(assert (= (and b!831969 (not c!90354)) b!831964))

(assert (= (and b!831964 c!90353) b!831963))

(assert (= (and b!831964 (not c!90353)) b!831968))

(assert (= (or b!831963 b!831968) bm!36386))

(assert (= (or b!831966 bm!36386) bm!36385))

(assert (= (or b!831965 bm!36385) bm!36384))

(assert (= (and bm!36384 c!90352) b!831970))

(assert (= (and bm!36384 (not c!90352)) b!831967))

(assert (= (and d!106237 res!566164) b!831962))

(assert (= (and b!831962 res!566165) b!831961))

(declare-fun m!775629 () Bool)

(assert (=> b!831961 m!775629))

(declare-fun m!775631 () Bool)

(assert (=> d!106237 m!775631))

(declare-fun m!775633 () Bool)

(assert (=> d!106237 m!775633))

(declare-fun m!775635 () Bool)

(assert (=> b!831962 m!775635))

(declare-fun m!775637 () Bool)

(assert (=> bm!36384 m!775637))

(declare-fun m!775639 () Bool)

(assert (=> b!831970 m!775639))

(assert (=> d!106117 d!106237))

(declare-fun d!106239 () Bool)

(declare-fun lt!377497 () Bool)

(assert (=> d!106239 (= lt!377497 (select (content!386 (toList!4505 lt!377257)) lt!377161))))

(declare-fun e!463968 () Bool)

(assert (=> d!106239 (= lt!377497 e!463968)))

(declare-fun res!566166 () Bool)

(assert (=> d!106239 (=> (not res!566166) (not e!463968))))

(assert (=> d!106239 (= res!566166 ((_ is Cons!15945) (toList!4505 lt!377257)))))

(assert (=> d!106239 (= (contains!4191 (toList!4505 lt!377257) lt!377161) lt!377497)))

(declare-fun b!831971 () Bool)

(declare-fun e!463967 () Bool)

(assert (=> b!831971 (= e!463968 e!463967)))

(declare-fun res!566167 () Bool)

(assert (=> b!831971 (=> res!566167 e!463967)))

(assert (=> b!831971 (= res!566167 (= (h!17075 (toList!4505 lt!377257)) lt!377161))))

(declare-fun b!831972 () Bool)

(assert (=> b!831972 (= e!463967 (contains!4191 (t!22308 (toList!4505 lt!377257)) lt!377161))))

(assert (= (and d!106239 res!566166) b!831971))

(assert (= (and b!831971 (not res!566167)) b!831972))

(declare-fun m!775641 () Bool)

(assert (=> d!106239 m!775641))

(declare-fun m!775643 () Bool)

(assert (=> d!106239 m!775643))

(declare-fun m!775645 () Bool)

(assert (=> b!831972 m!775645))

(assert (=> b!831648 d!106239))

(declare-fun d!106241 () Bool)

(assert (=> d!106241 (= (apply!373 lt!377243 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11832 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23236 () Bool)

(assert (= bs!23236 d!106241))

(assert (=> bs!23236 m!775051))

(declare-fun m!775647 () Bool)

(assert (=> bs!23236 m!775647))

(assert (=> bs!23236 m!775647))

(declare-fun m!775649 () Bool)

(assert (=> bs!23236 m!775649))

(assert (=> b!831631 d!106241))

(assert (=> b!831631 d!106141))

(assert (=> bm!36348 d!106109))

(declare-fun d!106243 () Bool)

(declare-fun e!463970 () Bool)

(assert (=> d!106243 e!463970))

(declare-fun res!566168 () Bool)

(assert (=> d!106243 (=> res!566168 e!463970)))

(declare-fun lt!377500 () Bool)

(assert (=> d!106243 (= res!566168 (not lt!377500))))

(declare-fun lt!377498 () Bool)

(assert (=> d!106243 (= lt!377500 lt!377498)))

(declare-fun lt!377501 () Unit!28447)

(declare-fun e!463969 () Unit!28447)

(assert (=> d!106243 (= lt!377501 e!463969)))

(declare-fun c!90355 () Bool)

(assert (=> d!106243 (= c!90355 lt!377498)))

(assert (=> d!106243 (= lt!377498 (containsKey!400 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(assert (=> d!106243 (= (contains!4190 lt!377353 (_1!5094 lt!377161)) lt!377500)))

(declare-fun b!831973 () Bool)

(declare-fun lt!377499 () Unit!28447)

(assert (=> b!831973 (= e!463969 lt!377499)))

(assert (=> b!831973 (= lt!377499 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(assert (=> b!831973 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(declare-fun b!831974 () Bool)

(declare-fun Unit!28462 () Unit!28447)

(assert (=> b!831974 (= e!463969 Unit!28462)))

(declare-fun b!831975 () Bool)

(assert (=> b!831975 (= e!463970 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161))))))

(assert (= (and d!106243 c!90355) b!831973))

(assert (= (and d!106243 (not c!90355)) b!831974))

(assert (= (and d!106243 (not res!566168)) b!831975))

(declare-fun m!775651 () Bool)

(assert (=> d!106243 m!775651))

(declare-fun m!775653 () Bool)

(assert (=> b!831973 m!775653))

(assert (=> b!831973 m!775211))

(assert (=> b!831973 m!775211))

(declare-fun m!775655 () Bool)

(assert (=> b!831973 m!775655))

(assert (=> b!831975 m!775211))

(assert (=> b!831975 m!775211))

(assert (=> b!831975 m!775655))

(assert (=> d!106119 d!106243))

(declare-fun b!831978 () Bool)

(declare-fun e!463972 () Option!420)

(assert (=> b!831978 (= e!463972 (getValueByKey!414 (t!22308 lt!377352) (_1!5094 lt!377161)))))

(declare-fun b!831979 () Bool)

(assert (=> b!831979 (= e!463972 None!418)))

(declare-fun d!106245 () Bool)

(declare-fun c!90356 () Bool)

(assert (=> d!106245 (= c!90356 (and ((_ is Cons!15945) lt!377352) (= (_1!5094 (h!17075 lt!377352)) (_1!5094 lt!377161))))))

(declare-fun e!463971 () Option!420)

(assert (=> d!106245 (= (getValueByKey!414 lt!377352 (_1!5094 lt!377161)) e!463971)))

(declare-fun b!831977 () Bool)

(assert (=> b!831977 (= e!463971 e!463972)))

(declare-fun c!90357 () Bool)

(assert (=> b!831977 (= c!90357 (and ((_ is Cons!15945) lt!377352) (not (= (_1!5094 (h!17075 lt!377352)) (_1!5094 lt!377161)))))))

(declare-fun b!831976 () Bool)

(assert (=> b!831976 (= e!463971 (Some!419 (_2!5094 (h!17075 lt!377352))))))

(assert (= (and d!106245 c!90356) b!831976))

(assert (= (and d!106245 (not c!90356)) b!831977))

(assert (= (and b!831977 c!90357) b!831978))

(assert (= (and b!831977 (not c!90357)) b!831979))

(declare-fun m!775657 () Bool)

(assert (=> b!831978 m!775657))

(assert (=> d!106119 d!106245))

(declare-fun d!106247 () Bool)

(assert (=> d!106247 (= (getValueByKey!414 lt!377352 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(declare-fun lt!377502 () Unit!28447)

(assert (=> d!106247 (= lt!377502 (choose!1433 lt!377352 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun e!463973 () Bool)

(assert (=> d!106247 e!463973))

(declare-fun res!566169 () Bool)

(assert (=> d!106247 (=> (not res!566169) (not e!463973))))

(assert (=> d!106247 (= res!566169 (isStrictlySorted!438 lt!377352))))

(assert (=> d!106247 (= (lemmaContainsTupThenGetReturnValue!231 lt!377352 (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377502)))

(declare-fun b!831980 () Bool)

(declare-fun res!566170 () Bool)

(assert (=> b!831980 (=> (not res!566170) (not e!463973))))

(assert (=> b!831980 (= res!566170 (containsKey!400 lt!377352 (_1!5094 lt!377161)))))

(declare-fun b!831981 () Bool)

(assert (=> b!831981 (= e!463973 (contains!4191 lt!377352 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106247 res!566169) b!831980))

(assert (= (and b!831980 res!566170) b!831981))

(assert (=> d!106247 m!775205))

(declare-fun m!775659 () Bool)

(assert (=> d!106247 m!775659))

(declare-fun m!775661 () Bool)

(assert (=> d!106247 m!775661))

(declare-fun m!775663 () Bool)

(assert (=> b!831980 m!775663))

(declare-fun m!775665 () Bool)

(assert (=> b!831981 m!775665))

(assert (=> d!106119 d!106247))

(declare-fun b!831982 () Bool)

(declare-fun e!463974 () Bool)

(declare-fun lt!377503 () List!15949)

(assert (=> b!831982 (= e!463974 (contains!4191 lt!377503 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!831983 () Bool)

(declare-fun res!566172 () Bool)

(assert (=> b!831983 (=> (not res!566172) (not e!463974))))

(assert (=> b!831983 (= res!566172 (containsKey!400 lt!377503 (_1!5094 lt!377161)))))

(declare-fun b!831984 () Bool)

(declare-fun e!463976 () List!15949)

(declare-fun call!36390 () List!15949)

(assert (=> b!831984 (= e!463976 call!36390)))

(declare-fun c!90358 () Bool)

(declare-fun call!36392 () List!15949)

(declare-fun e!463978 () List!15949)

(declare-fun bm!36387 () Bool)

(assert (=> bm!36387 (= call!36392 ($colon$colon!536 e!463978 (ite c!90358 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90359 () Bool)

(assert (=> bm!36387 (= c!90359 c!90358)))

(declare-fun b!831986 () Bool)

(declare-fun e!463977 () List!15949)

(assert (=> b!831986 (= e!463977 call!36392)))

(declare-fun bm!36388 () Bool)

(declare-fun call!36391 () List!15949)

(assert (=> bm!36388 (= call!36391 call!36392)))

(declare-fun b!831987 () Bool)

(declare-fun e!463975 () List!15949)

(assert (=> b!831987 (= e!463975 call!36391)))

(declare-fun c!90361 () Bool)

(declare-fun b!831988 () Bool)

(declare-fun c!90360 () Bool)

(assert (=> b!831988 (= e!463978 (ite c!90361 (t!22308 (toList!4505 lt!377163)) (ite c!90360 (Cons!15945 (h!17075 (toList!4505 lt!377163)) (t!22308 (toList!4505 lt!377163))) Nil!15946)))))

(declare-fun b!831989 () Bool)

(assert (=> b!831989 (= e!463976 call!36390)))

(declare-fun bm!36389 () Bool)

(assert (=> bm!36389 (= call!36390 call!36391)))

(declare-fun b!831990 () Bool)

(assert (=> b!831990 (= e!463977 e!463975)))

(assert (=> b!831990 (= c!90361 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (= (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 lt!377161))))))

(declare-fun b!831991 () Bool)

(assert (=> b!831991 (= e!463978 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377163)) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!831985 () Bool)

(assert (=> b!831985 (= c!90360 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 lt!377161))))))

(assert (=> b!831985 (= e!463975 e!463976)))

(declare-fun d!106249 () Bool)

(assert (=> d!106249 e!463974))

(declare-fun res!566171 () Bool)

(assert (=> d!106249 (=> (not res!566171) (not e!463974))))

(assert (=> d!106249 (= res!566171 (isStrictlySorted!438 lt!377503))))

(assert (=> d!106249 (= lt!377503 e!463977)))

(assert (=> d!106249 (= c!90358 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 lt!377161))))))

(assert (=> d!106249 (isStrictlySorted!438 (toList!4505 lt!377163))))

(assert (=> d!106249 (= (insertStrictlySorted!270 (toList!4505 lt!377163) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377503)))

(assert (= (and d!106249 c!90358) b!831986))

(assert (= (and d!106249 (not c!90358)) b!831990))

(assert (= (and b!831990 c!90361) b!831987))

(assert (= (and b!831990 (not c!90361)) b!831985))

(assert (= (and b!831985 c!90360) b!831984))

(assert (= (and b!831985 (not c!90360)) b!831989))

(assert (= (or b!831984 b!831989) bm!36389))

(assert (= (or b!831987 bm!36389) bm!36388))

(assert (= (or b!831986 bm!36388) bm!36387))

(assert (= (and bm!36387 c!90359) b!831991))

(assert (= (and bm!36387 (not c!90359)) b!831988))

(assert (= (and d!106249 res!566171) b!831983))

(assert (= (and b!831983 res!566172) b!831982))

(declare-fun m!775667 () Bool)

(assert (=> b!831982 m!775667))

(declare-fun m!775669 () Bool)

(assert (=> d!106249 m!775669))

(declare-fun m!775671 () Bool)

(assert (=> d!106249 m!775671))

(declare-fun m!775673 () Bool)

(assert (=> b!831983 m!775673))

(declare-fun m!775675 () Bool)

(assert (=> bm!36387 m!775675))

(declare-fun m!775677 () Bool)

(assert (=> b!831991 m!775677))

(assert (=> d!106119 d!106249))

(declare-fun d!106251 () Bool)

(declare-fun e!463980 () Bool)

(assert (=> d!106251 e!463980))

(declare-fun res!566173 () Bool)

(assert (=> d!106251 (=> res!566173 e!463980)))

(declare-fun lt!377506 () Bool)

(assert (=> d!106251 (= res!566173 (not lt!377506))))

(declare-fun lt!377504 () Bool)

(assert (=> d!106251 (= lt!377506 lt!377504)))

(declare-fun lt!377507 () Unit!28447)

(declare-fun e!463979 () Unit!28447)

(assert (=> d!106251 (= lt!377507 e!463979)))

(declare-fun c!90362 () Bool)

(assert (=> d!106251 (= c!90362 lt!377504)))

(assert (=> d!106251 (= lt!377504 (containsKey!400 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106251 (= (contains!4190 lt!377250 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377506)))

(declare-fun b!831992 () Bool)

(declare-fun lt!377505 () Unit!28447)

(assert (=> b!831992 (= e!463979 lt!377505)))

(assert (=> b!831992 (= lt!377505 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831992 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831993 () Bool)

(declare-fun Unit!28463 () Unit!28447)

(assert (=> b!831993 (= e!463979 Unit!28463)))

(declare-fun b!831994 () Bool)

(assert (=> b!831994 (= e!463980 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106251 c!90362) b!831992))

(assert (= (and d!106251 (not c!90362)) b!831993))

(assert (= (and d!106251 (not res!566173)) b!831994))

(declare-fun m!775679 () Bool)

(assert (=> d!106251 m!775679))

(declare-fun m!775681 () Bool)

(assert (=> b!831992 m!775681))

(declare-fun m!775683 () Bool)

(assert (=> b!831992 m!775683))

(assert (=> b!831992 m!775683))

(declare-fun m!775685 () Bool)

(assert (=> b!831992 m!775685))

(assert (=> b!831994 m!775683))

(assert (=> b!831994 m!775683))

(assert (=> b!831994 m!775685))

(assert (=> b!831641 d!106251))

(declare-fun b!831997 () Bool)

(declare-fun e!463982 () Option!420)

(assert (=> b!831997 (= e!463982 (getValueByKey!414 (t!22308 (toList!4505 lt!377365)) (_1!5094 lt!377161)))))

(declare-fun b!831998 () Bool)

(assert (=> b!831998 (= e!463982 None!418)))

(declare-fun d!106253 () Bool)

(declare-fun c!90363 () Bool)

(assert (=> d!106253 (= c!90363 (and ((_ is Cons!15945) (toList!4505 lt!377365)) (= (_1!5094 (h!17075 (toList!4505 lt!377365))) (_1!5094 lt!377161))))))

(declare-fun e!463981 () Option!420)

(assert (=> d!106253 (= (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161)) e!463981)))

(declare-fun b!831996 () Bool)

(assert (=> b!831996 (= e!463981 e!463982)))

(declare-fun c!90364 () Bool)

(assert (=> b!831996 (= c!90364 (and ((_ is Cons!15945) (toList!4505 lt!377365)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377365))) (_1!5094 lt!377161)))))))

(declare-fun b!831995 () Bool)

(assert (=> b!831995 (= e!463981 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377365)))))))

(assert (= (and d!106253 c!90363) b!831995))

(assert (= (and d!106253 (not c!90363)) b!831996))

(assert (= (and b!831996 c!90364) b!831997))

(assert (= (and b!831996 (not c!90364)) b!831998))

(declare-fun m!775687 () Bool)

(assert (=> b!831997 m!775687))

(assert (=> b!831741 d!106253))

(declare-fun b!832001 () Bool)

(declare-fun e!463984 () Option!420)

(assert (=> b!832001 (= e!463984 (getValueByKey!414 (t!22308 (toList!4505 lt!377349)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832002 () Bool)

(assert (=> b!832002 (= e!463984 None!418)))

(declare-fun d!106255 () Bool)

(declare-fun c!90365 () Bool)

(assert (=> d!106255 (= c!90365 (and ((_ is Cons!15945) (toList!4505 lt!377349)) (= (_1!5094 (h!17075 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463983 () Option!420)

(assert (=> d!106255 (= (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463983)))

(declare-fun b!832000 () Bool)

(assert (=> b!832000 (= e!463983 e!463984)))

(declare-fun c!90366 () Bool)

(assert (=> b!832000 (= c!90366 (and ((_ is Cons!15945) (toList!4505 lt!377349)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831999 () Bool)

(assert (=> b!831999 (= e!463983 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377349)))))))

(assert (= (and d!106255 c!90365) b!831999))

(assert (= (and d!106255 (not c!90365)) b!832000))

(assert (= (and b!832000 c!90366) b!832001))

(assert (= (and b!832000 (not c!90366)) b!832002))

(declare-fun m!775689 () Bool)

(assert (=> b!832001 m!775689))

(assert (=> b!831733 d!106255))

(assert (=> b!831700 d!106147))

(assert (=> b!831752 d!106147))

(declare-fun b!832005 () Bool)

(declare-fun e!463986 () Option!420)

(assert (=> b!832005 (= e!463986 (getValueByKey!414 (t!22308 (toList!4505 lt!377353)) (_1!5094 lt!377161)))))

(declare-fun b!832006 () Bool)

(assert (=> b!832006 (= e!463986 None!418)))

(declare-fun d!106257 () Bool)

(declare-fun c!90367 () Bool)

(assert (=> d!106257 (= c!90367 (and ((_ is Cons!15945) (toList!4505 lt!377353)) (= (_1!5094 (h!17075 (toList!4505 lt!377353))) (_1!5094 lt!377161))))))

(declare-fun e!463985 () Option!420)

(assert (=> d!106257 (= (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161)) e!463985)))

(declare-fun b!832004 () Bool)

(assert (=> b!832004 (= e!463985 e!463986)))

(declare-fun c!90368 () Bool)

(assert (=> b!832004 (= c!90368 (and ((_ is Cons!15945) (toList!4505 lt!377353)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377353))) (_1!5094 lt!377161)))))))

(declare-fun b!832003 () Bool)

(assert (=> b!832003 (= e!463985 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377353)))))))

(assert (= (and d!106257 c!90367) b!832003))

(assert (= (and d!106257 (not c!90367)) b!832004))

(assert (= (and b!832004 c!90368) b!832005))

(assert (= (and b!832004 (not c!90368)) b!832006))

(declare-fun m!775691 () Bool)

(assert (=> b!832005 m!775691))

(assert (=> b!831735 d!106257))

(declare-fun d!106259 () Bool)

(assert (=> d!106259 (arrayContainsKey!0 _keys!976 lt!377373 #b00000000000000000000000000000000)))

(declare-fun lt!377510 () Unit!28447)

(declare-fun choose!13 (array!46567 (_ BitVec 64) (_ BitVec 32)) Unit!28447)

(assert (=> d!106259 (= lt!377510 (choose!13 _keys!976 lt!377373 #b00000000000000000000000000000000))))

(assert (=> d!106259 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!106259 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377373 #b00000000000000000000000000000000) lt!377510)))

(declare-fun bs!23237 () Bool)

(assert (= bs!23237 d!106259))

(assert (=> bs!23237 m!775253))

(declare-fun m!775693 () Bool)

(assert (=> bs!23237 m!775693))

(assert (=> b!831751 d!106259))

(declare-fun d!106261 () Bool)

(declare-fun res!566178 () Bool)

(declare-fun e!463991 () Bool)

(assert (=> d!106261 (=> res!566178 e!463991)))

(assert (=> d!106261 (= res!566178 (= (select (arr!22319 _keys!976) #b00000000000000000000000000000000) lt!377373))))

(assert (=> d!106261 (= (arrayContainsKey!0 _keys!976 lt!377373 #b00000000000000000000000000000000) e!463991)))

(declare-fun b!832011 () Bool)

(declare-fun e!463992 () Bool)

(assert (=> b!832011 (= e!463991 e!463992)))

(declare-fun res!566179 () Bool)

(assert (=> b!832011 (=> (not res!566179) (not e!463992))))

(assert (=> b!832011 (= res!566179 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832012 () Bool)

(assert (=> b!832012 (= e!463992 (arrayContainsKey!0 _keys!976 lt!377373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106261 (not res!566178)) b!832011))

(assert (= (and b!832011 res!566179) b!832012))

(assert (=> d!106261 m!775051))

(declare-fun m!775695 () Bool)

(assert (=> b!832012 m!775695))

(assert (=> b!831751 d!106261))

(declare-fun d!106263 () Bool)

(declare-fun lt!377519 () SeekEntryResult!8741)

(assert (=> d!106263 (and (or ((_ is Undefined!8741) lt!377519) (not ((_ is Found!8741) lt!377519)) (and (bvsge (index!37336 lt!377519) #b00000000000000000000000000000000) (bvslt (index!37336 lt!377519) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377519) ((_ is Found!8741) lt!377519) (not ((_ is MissingZero!8741) lt!377519)) (and (bvsge (index!37335 lt!377519) #b00000000000000000000000000000000) (bvslt (index!37335 lt!377519) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377519) ((_ is Found!8741) lt!377519) ((_ is MissingZero!8741) lt!377519) (not ((_ is MissingVacant!8741) lt!377519)) (and (bvsge (index!37338 lt!377519) #b00000000000000000000000000000000) (bvslt (index!37338 lt!377519) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377519) (ite ((_ is Found!8741) lt!377519) (= (select (arr!22319 _keys!976) (index!37336 lt!377519)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8741) lt!377519) (= (select (arr!22319 _keys!976) (index!37335 lt!377519)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8741) lt!377519) (= (select (arr!22319 _keys!976) (index!37338 lt!377519)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463999 () SeekEntryResult!8741)

(assert (=> d!106263 (= lt!377519 e!463999)))

(declare-fun c!90375 () Bool)

(declare-fun lt!377518 () SeekEntryResult!8741)

(assert (=> d!106263 (= c!90375 (and ((_ is Intermediate!8741) lt!377518) (undefined!9553 lt!377518)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46567 (_ BitVec 32)) SeekEntryResult!8741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!106263 (= lt!377518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!106263 (validMask!0 mask!1312)))

(assert (=> d!106263 (= (seekEntryOrOpen!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377519)))

(declare-fun b!832025 () Bool)

(assert (=> b!832025 (= e!463999 Undefined!8741)))

(declare-fun b!832026 () Bool)

(declare-fun e!464000 () SeekEntryResult!8741)

(assert (=> b!832026 (= e!464000 (MissingZero!8741 (index!37337 lt!377518)))))

(declare-fun b!832027 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46567 (_ BitVec 32)) SeekEntryResult!8741)

(assert (=> b!832027 (= e!464000 (seekKeyOrZeroReturnVacant!0 (x!70131 lt!377518) (index!37337 lt!377518) (index!37337 lt!377518) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!832028 () Bool)

(declare-fun e!464001 () SeekEntryResult!8741)

(assert (=> b!832028 (= e!463999 e!464001)))

(declare-fun lt!377517 () (_ BitVec 64))

(assert (=> b!832028 (= lt!377517 (select (arr!22319 _keys!976) (index!37337 lt!377518)))))

(declare-fun c!90376 () Bool)

(assert (=> b!832028 (= c!90376 (= lt!377517 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832029 () Bool)

(assert (=> b!832029 (= e!464001 (Found!8741 (index!37337 lt!377518)))))

(declare-fun b!832030 () Bool)

(declare-fun c!90377 () Bool)

(assert (=> b!832030 (= c!90377 (= lt!377517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832030 (= e!464001 e!464000)))

(assert (= (and d!106263 c!90375) b!832025))

(assert (= (and d!106263 (not c!90375)) b!832028))

(assert (= (and b!832028 c!90376) b!832029))

(assert (= (and b!832028 (not c!90376)) b!832030))

(assert (= (and b!832030 c!90377) b!832026))

(assert (= (and b!832030 (not c!90377)) b!832027))

(declare-fun m!775697 () Bool)

(assert (=> d!106263 m!775697))

(declare-fun m!775699 () Bool)

(assert (=> d!106263 m!775699))

(assert (=> d!106263 m!775051))

(declare-fun m!775701 () Bool)

(assert (=> d!106263 m!775701))

(assert (=> d!106263 m!774915))

(assert (=> d!106263 m!775701))

(assert (=> d!106263 m!775051))

(declare-fun m!775703 () Bool)

(assert (=> d!106263 m!775703))

(declare-fun m!775705 () Bool)

(assert (=> d!106263 m!775705))

(assert (=> b!832027 m!775051))

(declare-fun m!775707 () Bool)

(assert (=> b!832027 m!775707))

(declare-fun m!775709 () Bool)

(assert (=> b!832028 m!775709))

(assert (=> b!831751 d!106263))

(declare-fun d!106265 () Bool)

(declare-fun e!464003 () Bool)

(assert (=> d!106265 e!464003))

(declare-fun res!566180 () Bool)

(assert (=> d!106265 (=> res!566180 e!464003)))

(declare-fun lt!377522 () Bool)

(assert (=> d!106265 (= res!566180 (not lt!377522))))

(declare-fun lt!377520 () Bool)

(assert (=> d!106265 (= lt!377522 lt!377520)))

(declare-fun lt!377523 () Unit!28447)

(declare-fun e!464002 () Unit!28447)

(assert (=> d!106265 (= lt!377523 e!464002)))

(declare-fun c!90378 () Bool)

(assert (=> d!106265 (= c!90378 lt!377520)))

(assert (=> d!106265 (= lt!377520 (containsKey!400 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106265 (= (contains!4190 lt!377340 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377522)))

(declare-fun b!832031 () Bool)

(declare-fun lt!377521 () Unit!28447)

(assert (=> b!832031 (= e!464002 lt!377521)))

(assert (=> b!832031 (= lt!377521 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832031 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832032 () Bool)

(declare-fun Unit!28464 () Unit!28447)

(assert (=> b!832032 (= e!464002 Unit!28464)))

(declare-fun b!832033 () Bool)

(assert (=> b!832033 (= e!464003 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106265 c!90378) b!832031))

(assert (= (and d!106265 (not c!90378)) b!832032))

(assert (= (and d!106265 (not res!566180)) b!832033))

(declare-fun m!775711 () Bool)

(assert (=> d!106265 m!775711))

(declare-fun m!775713 () Bool)

(assert (=> b!832031 m!775713))

(declare-fun m!775715 () Bool)

(assert (=> b!832031 m!775715))

(assert (=> b!832031 m!775715))

(declare-fun m!775717 () Bool)

(assert (=> b!832031 m!775717))

(assert (=> b!832033 m!775715))

(assert (=> b!832033 m!775715))

(assert (=> b!832033 m!775717))

(assert (=> bm!36360 d!106265))

(declare-fun b!832036 () Bool)

(declare-fun e!464005 () Option!420)

(assert (=> b!832036 (= e!464005 (getValueByKey!414 (t!22308 (toList!4505 lt!377361)) (_1!5094 lt!377164)))))

(declare-fun b!832037 () Bool)

(assert (=> b!832037 (= e!464005 None!418)))

(declare-fun d!106267 () Bool)

(declare-fun c!90379 () Bool)

(assert (=> d!106267 (= c!90379 (and ((_ is Cons!15945) (toList!4505 lt!377361)) (= (_1!5094 (h!17075 (toList!4505 lt!377361))) (_1!5094 lt!377164))))))

(declare-fun e!464004 () Option!420)

(assert (=> d!106267 (= (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164)) e!464004)))

(declare-fun b!832035 () Bool)

(assert (=> b!832035 (= e!464004 e!464005)))

(declare-fun c!90380 () Bool)

(assert (=> b!832035 (= c!90380 (and ((_ is Cons!15945) (toList!4505 lt!377361)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377361))) (_1!5094 lt!377164)))))))

(declare-fun b!832034 () Bool)

(assert (=> b!832034 (= e!464004 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377361)))))))

(assert (= (and d!106267 c!90379) b!832034))

(assert (= (and d!106267 (not c!90379)) b!832035))

(assert (= (and b!832035 c!90380) b!832036))

(assert (= (and b!832035 (not c!90380)) b!832037))

(declare-fun m!775719 () Bool)

(assert (=> b!832036 m!775719))

(assert (=> b!831739 d!106267))

(declare-fun d!106269 () Bool)

(assert (=> d!106269 (= (apply!373 lt!377318 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11832 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23238 () Bool)

(assert (= bs!23238 d!106269))

(assert (=> bs!23238 m!775051))

(assert (=> bs!23238 m!775543))

(assert (=> bs!23238 m!775543))

(declare-fun m!775721 () Bool)

(assert (=> bs!23238 m!775721))

(assert (=> b!831697 d!106269))

(assert (=> b!831697 d!106141))

(declare-fun d!106271 () Bool)

(declare-fun isEmpty!663 (List!15949) Bool)

(assert (=> d!106271 (= (isEmpty!662 lt!377250) (isEmpty!663 (toList!4505 lt!377250)))))

(declare-fun bs!23239 () Bool)

(assert (= bs!23239 d!106271))

(declare-fun m!775723 () Bool)

(assert (=> bs!23239 m!775723))

(assert (=> b!831635 d!106271))

(declare-fun d!106273 () Bool)

(declare-fun e!464007 () Bool)

(assert (=> d!106273 e!464007))

(declare-fun res!566181 () Bool)

(assert (=> d!106273 (=> res!566181 e!464007)))

(declare-fun lt!377526 () Bool)

(assert (=> d!106273 (= res!566181 (not lt!377526))))

(declare-fun lt!377524 () Bool)

(assert (=> d!106273 (= lt!377526 lt!377524)))

(declare-fun lt!377527 () Unit!28447)

(declare-fun e!464006 () Unit!28447)

(assert (=> d!106273 (= lt!377527 e!464006)))

(declare-fun c!90381 () Bool)

(assert (=> d!106273 (= c!90381 lt!377524)))

(assert (=> d!106273 (= lt!377524 (containsKey!400 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(assert (=> d!106273 (= (contains!4190 lt!377257 (_1!5094 lt!377161)) lt!377526)))

(declare-fun b!832038 () Bool)

(declare-fun lt!377525 () Unit!28447)

(assert (=> b!832038 (= e!464006 lt!377525)))

(assert (=> b!832038 (= lt!377525 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(assert (=> b!832038 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(declare-fun b!832039 () Bool)

(declare-fun Unit!28465 () Unit!28447)

(assert (=> b!832039 (= e!464006 Unit!28465)))

(declare-fun b!832040 () Bool)

(assert (=> b!832040 (= e!464007 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161))))))

(assert (= (and d!106273 c!90381) b!832038))

(assert (= (and d!106273 (not c!90381)) b!832039))

(assert (= (and d!106273 (not res!566181)) b!832040))

(declare-fun m!775725 () Bool)

(assert (=> d!106273 m!775725))

(declare-fun m!775727 () Bool)

(assert (=> b!832038 m!775727))

(assert (=> b!832038 m!775095))

(assert (=> b!832038 m!775095))

(declare-fun m!775729 () Bool)

(assert (=> b!832038 m!775729))

(assert (=> b!832040 m!775095))

(assert (=> b!832040 m!775095))

(assert (=> b!832040 m!775729))

(assert (=> d!106111 d!106273))

(declare-fun b!832043 () Bool)

(declare-fun e!464009 () Option!420)

(assert (=> b!832043 (= e!464009 (getValueByKey!414 (t!22308 lt!377256) (_1!5094 lt!377161)))))

(declare-fun b!832044 () Bool)

(assert (=> b!832044 (= e!464009 None!418)))

(declare-fun d!106275 () Bool)

(declare-fun c!90382 () Bool)

(assert (=> d!106275 (= c!90382 (and ((_ is Cons!15945) lt!377256) (= (_1!5094 (h!17075 lt!377256)) (_1!5094 lt!377161))))))

(declare-fun e!464008 () Option!420)

(assert (=> d!106275 (= (getValueByKey!414 lt!377256 (_1!5094 lt!377161)) e!464008)))

(declare-fun b!832042 () Bool)

(assert (=> b!832042 (= e!464008 e!464009)))

(declare-fun c!90383 () Bool)

(assert (=> b!832042 (= c!90383 (and ((_ is Cons!15945) lt!377256) (not (= (_1!5094 (h!17075 lt!377256)) (_1!5094 lt!377161)))))))

(declare-fun b!832041 () Bool)

(assert (=> b!832041 (= e!464008 (Some!419 (_2!5094 (h!17075 lt!377256))))))

(assert (= (and d!106275 c!90382) b!832041))

(assert (= (and d!106275 (not c!90382)) b!832042))

(assert (= (and b!832042 c!90383) b!832043))

(assert (= (and b!832042 (not c!90383)) b!832044))

(declare-fun m!775731 () Bool)

(assert (=> b!832043 m!775731))

(assert (=> d!106111 d!106275))

(declare-fun d!106277 () Bool)

(assert (=> d!106277 (= (getValueByKey!414 lt!377256 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(declare-fun lt!377528 () Unit!28447)

(assert (=> d!106277 (= lt!377528 (choose!1433 lt!377256 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun e!464010 () Bool)

(assert (=> d!106277 e!464010))

(declare-fun res!566182 () Bool)

(assert (=> d!106277 (=> (not res!566182) (not e!464010))))

(assert (=> d!106277 (= res!566182 (isStrictlySorted!438 lt!377256))))

(assert (=> d!106277 (= (lemmaContainsTupThenGetReturnValue!231 lt!377256 (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377528)))

(declare-fun b!832045 () Bool)

(declare-fun res!566183 () Bool)

(assert (=> b!832045 (=> (not res!566183) (not e!464010))))

(assert (=> b!832045 (= res!566183 (containsKey!400 lt!377256 (_1!5094 lt!377161)))))

(declare-fun b!832046 () Bool)

(assert (=> b!832046 (= e!464010 (contains!4191 lt!377256 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106277 res!566182) b!832045))

(assert (= (and b!832045 res!566183) b!832046))

(assert (=> d!106277 m!775089))

(declare-fun m!775733 () Bool)

(assert (=> d!106277 m!775733))

(declare-fun m!775735 () Bool)

(assert (=> d!106277 m!775735))

(declare-fun m!775737 () Bool)

(assert (=> b!832045 m!775737))

(declare-fun m!775739 () Bool)

(assert (=> b!832046 m!775739))

(assert (=> d!106111 d!106277))

(declare-fun b!832047 () Bool)

(declare-fun e!464011 () Bool)

(declare-fun lt!377529 () List!15949)

(assert (=> b!832047 (= e!464011 (contains!4191 lt!377529 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832048 () Bool)

(declare-fun res!566185 () Bool)

(assert (=> b!832048 (=> (not res!566185) (not e!464011))))

(assert (=> b!832048 (= res!566185 (containsKey!400 lt!377529 (_1!5094 lt!377161)))))

(declare-fun b!832049 () Bool)

(declare-fun e!464013 () List!15949)

(declare-fun call!36393 () List!15949)

(assert (=> b!832049 (= e!464013 call!36393)))

(declare-fun c!90384 () Bool)

(declare-fun e!464015 () List!15949)

(declare-fun call!36395 () List!15949)

(declare-fun bm!36390 () Bool)

(assert (=> bm!36390 (= call!36395 ($colon$colon!536 e!464015 (ite c!90384 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90385 () Bool)

(assert (=> bm!36390 (= c!90385 c!90384)))

(declare-fun b!832051 () Bool)

(declare-fun e!464014 () List!15949)

(assert (=> b!832051 (= e!464014 call!36395)))

(declare-fun bm!36391 () Bool)

(declare-fun call!36394 () List!15949)

(assert (=> bm!36391 (= call!36394 call!36395)))

(declare-fun b!832052 () Bool)

(declare-fun e!464012 () List!15949)

(assert (=> b!832052 (= e!464012 call!36394)))

(declare-fun b!832053 () Bool)

(declare-fun c!90387 () Bool)

(declare-fun c!90386 () Bool)

(assert (=> b!832053 (= e!464015 (ite c!90387 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))) (ite c!90386 (Cons!15945 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164))) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) Nil!15946)))))

(declare-fun b!832054 () Bool)

(assert (=> b!832054 (= e!464013 call!36393)))

(declare-fun bm!36392 () Bool)

(assert (=> bm!36392 (= call!36393 call!36394)))

(declare-fun b!832055 () Bool)

(assert (=> b!832055 (= e!464014 e!464012)))

(assert (=> b!832055 (= c!90387 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377164))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164)))) (_1!5094 lt!377161))))))

(declare-fun b!832056 () Bool)

(assert (=> b!832056 (= e!464015 (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!832050 () Bool)

(assert (=> b!832050 (= c!90386 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377164))) (bvsgt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164)))) (_1!5094 lt!377161))))))

(assert (=> b!832050 (= e!464012 e!464013)))

(declare-fun d!106279 () Bool)

(assert (=> d!106279 e!464011))

(declare-fun res!566184 () Bool)

(assert (=> d!106279 (=> (not res!566184) (not e!464011))))

(assert (=> d!106279 (= res!566184 (isStrictlySorted!438 lt!377529))))

(assert (=> d!106279 (= lt!377529 e!464014)))

(assert (=> d!106279 (= c!90384 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377158 lt!377164))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164)))) (_1!5094 lt!377161))))))

(assert (=> d!106279 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377158 lt!377164)))))

(assert (=> d!106279 (= (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377158 lt!377164)) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377529)))

(assert (= (and d!106279 c!90384) b!832051))

(assert (= (and d!106279 (not c!90384)) b!832055))

(assert (= (and b!832055 c!90387) b!832052))

(assert (= (and b!832055 (not c!90387)) b!832050))

(assert (= (and b!832050 c!90386) b!832049))

(assert (= (and b!832050 (not c!90386)) b!832054))

(assert (= (or b!832049 b!832054) bm!36392))

(assert (= (or b!832052 bm!36392) bm!36391))

(assert (= (or b!832051 bm!36391) bm!36390))

(assert (= (and bm!36390 c!90385) b!832056))

(assert (= (and bm!36390 (not c!90385)) b!832053))

(assert (= (and d!106279 res!566184) b!832048))

(assert (= (and b!832048 res!566185) b!832047))

(declare-fun m!775741 () Bool)

(assert (=> b!832047 m!775741))

(declare-fun m!775743 () Bool)

(assert (=> d!106279 m!775743))

(declare-fun m!775745 () Bool)

(assert (=> d!106279 m!775745))

(declare-fun m!775747 () Bool)

(assert (=> b!832048 m!775747))

(declare-fun m!775749 () Bool)

(assert (=> bm!36390 m!775749))

(declare-fun m!775751 () Bool)

(assert (=> b!832056 m!775751))

(assert (=> d!106111 d!106279))

(assert (=> b!831623 d!106147))

(declare-fun d!106281 () Bool)

(declare-fun e!464017 () Bool)

(assert (=> d!106281 e!464017))

(declare-fun res!566186 () Bool)

(assert (=> d!106281 (=> res!566186 e!464017)))

(declare-fun lt!377532 () Bool)

(assert (=> d!106281 (= res!566186 (not lt!377532))))

(declare-fun lt!377530 () Bool)

(assert (=> d!106281 (= lt!377532 lt!377530)))

(declare-fun lt!377533 () Unit!28447)

(declare-fun e!464016 () Unit!28447)

(assert (=> d!106281 (= lt!377533 e!464016)))

(declare-fun c!90388 () Bool)

(assert (=> d!106281 (= c!90388 lt!377530)))

(assert (=> d!106281 (= lt!377530 (containsKey!400 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106281 (= (contains!4190 lt!377243 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377532)))

(declare-fun b!832057 () Bool)

(declare-fun lt!377531 () Unit!28447)

(assert (=> b!832057 (= e!464016 lt!377531)))

(assert (=> b!832057 (= lt!377531 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832057 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832058 () Bool)

(declare-fun Unit!28466 () Unit!28447)

(assert (=> b!832058 (= e!464016 Unit!28466)))

(declare-fun b!832059 () Bool)

(assert (=> b!832059 (= e!464017 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106281 c!90388) b!832057))

(assert (= (and d!106281 (not c!90388)) b!832058))

(assert (= (and d!106281 (not res!566186)) b!832059))

(declare-fun m!775753 () Bool)

(assert (=> d!106281 m!775753))

(declare-fun m!775755 () Bool)

(assert (=> b!832057 m!775755))

(declare-fun m!775757 () Bool)

(assert (=> b!832057 m!775757))

(assert (=> b!832057 m!775757))

(declare-fun m!775759 () Bool)

(assert (=> b!832057 m!775759))

(assert (=> b!832059 m!775757))

(assert (=> b!832059 m!775757))

(assert (=> b!832059 m!775759))

(assert (=> d!106107 d!106281))

(assert (=> d!106107 d!106123))

(declare-fun d!106283 () Bool)

(assert (=> d!106283 (= (isEmpty!662 lt!377243) (isEmpty!663 (toList!4505 lt!377243)))))

(declare-fun bs!23240 () Bool)

(assert (= bs!23240 d!106283))

(declare-fun m!775761 () Bool)

(assert (=> bs!23240 m!775761))

(assert (=> b!831621 d!106283))

(assert (=> d!106105 d!106109))

(assert (=> d!106105 d!106107))

(declare-fun d!106285 () Bool)

(assert (=> d!106285 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106285 true))

(declare-fun _$13!49 () Unit!28447)

(assert (=> d!106285 (= (choose!1431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!49)))

(declare-fun bs!23241 () Bool)

(assert (= bs!23241 d!106285))

(assert (=> bs!23241 m!774933))

(assert (=> bs!23241 m!774931))

(assert (=> d!106105 d!106285))

(assert (=> d!106105 d!106123))

(declare-fun d!106287 () Bool)

(declare-fun e!464019 () Bool)

(assert (=> d!106287 e!464019))

(declare-fun res!566187 () Bool)

(assert (=> d!106287 (=> res!566187 e!464019)))

(declare-fun lt!377536 () Bool)

(assert (=> d!106287 (= res!566187 (not lt!377536))))

(declare-fun lt!377534 () Bool)

(assert (=> d!106287 (= lt!377536 lt!377534)))

(declare-fun lt!377537 () Unit!28447)

(declare-fun e!464018 () Unit!28447)

(assert (=> d!106287 (= lt!377537 e!464018)))

(declare-fun c!90389 () Bool)

(assert (=> d!106287 (= c!90389 lt!377534)))

(assert (=> d!106287 (= lt!377534 (containsKey!400 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106287 (= (contains!4190 lt!377222 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377536)))

(declare-fun b!832060 () Bool)

(declare-fun lt!377535 () Unit!28447)

(assert (=> b!832060 (= e!464018 lt!377535)))

(assert (=> b!832060 (= lt!377535 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!832060 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832061 () Bool)

(declare-fun Unit!28467 () Unit!28447)

(assert (=> b!832061 (= e!464018 Unit!28467)))

(declare-fun b!832062 () Bool)

(assert (=> b!832062 (= e!464019 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106287 c!90389) b!832060))

(assert (= (and d!106287 (not c!90389)) b!832061))

(assert (= (and d!106287 (not res!566187)) b!832062))

(declare-fun m!775763 () Bool)

(assert (=> d!106287 m!775763))

(declare-fun m!775765 () Bool)

(assert (=> b!832060 m!775765))

(assert (=> b!832060 m!775031))

(assert (=> b!832060 m!775031))

(declare-fun m!775767 () Bool)

(assert (=> b!832060 m!775767))

(assert (=> b!832062 m!775031))

(assert (=> b!832062 m!775031))

(assert (=> b!832062 m!775767))

(assert (=> d!106103 d!106287))

(declare-fun b!832065 () Bool)

(declare-fun e!464021 () Option!420)

(assert (=> b!832065 (= e!464021 (getValueByKey!414 (t!22308 lt!377221) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832066 () Bool)

(assert (=> b!832066 (= e!464021 None!418)))

(declare-fun d!106289 () Bool)

(declare-fun c!90390 () Bool)

(assert (=> d!106289 (= c!90390 (and ((_ is Cons!15945) lt!377221) (= (_1!5094 (h!17075 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464020 () Option!420)

(assert (=> d!106289 (= (getValueByKey!414 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464020)))

(declare-fun b!832064 () Bool)

(assert (=> b!832064 (= e!464020 e!464021)))

(declare-fun c!90391 () Bool)

(assert (=> b!832064 (= c!90391 (and ((_ is Cons!15945) lt!377221) (not (= (_1!5094 (h!17075 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832063 () Bool)

(assert (=> b!832063 (= e!464020 (Some!419 (_2!5094 (h!17075 lt!377221))))))

(assert (= (and d!106289 c!90390) b!832063))

(assert (= (and d!106289 (not c!90390)) b!832064))

(assert (= (and b!832064 c!90391) b!832065))

(assert (= (and b!832064 (not c!90391)) b!832066))

(declare-fun m!775769 () Bool)

(assert (=> b!832065 m!775769))

(assert (=> d!106103 d!106289))

(declare-fun d!106291 () Bool)

(assert (=> d!106291 (= (getValueByKey!414 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377538 () Unit!28447)

(assert (=> d!106291 (= lt!377538 (choose!1433 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464022 () Bool)

(assert (=> d!106291 e!464022))

(declare-fun res!566188 () Bool)

(assert (=> d!106291 (=> (not res!566188) (not e!464022))))

(assert (=> d!106291 (= res!566188 (isStrictlySorted!438 lt!377221))))

(assert (=> d!106291 (= (lemmaContainsTupThenGetReturnValue!231 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377538)))

(declare-fun b!832067 () Bool)

(declare-fun res!566189 () Bool)

(assert (=> b!832067 (=> (not res!566189) (not e!464022))))

(assert (=> b!832067 (= res!566189 (containsKey!400 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832068 () Bool)

(assert (=> b!832068 (= e!464022 (contains!4191 lt!377221 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106291 res!566188) b!832067))

(assert (= (and b!832067 res!566189) b!832068))

(assert (=> d!106291 m!775025))

(declare-fun m!775771 () Bool)

(assert (=> d!106291 m!775771))

(declare-fun m!775773 () Bool)

(assert (=> d!106291 m!775773))

(declare-fun m!775775 () Bool)

(assert (=> b!832067 m!775775))

(declare-fun m!775777 () Bool)

(assert (=> b!832068 m!775777))

(assert (=> d!106103 d!106291))

(declare-fun b!832069 () Bool)

(declare-fun e!464023 () Bool)

(declare-fun lt!377539 () List!15949)

(assert (=> b!832069 (= e!464023 (contains!4191 lt!377539 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832070 () Bool)

(declare-fun res!566191 () Bool)

(assert (=> b!832070 (=> (not res!566191) (not e!464023))))

(assert (=> b!832070 (= res!566191 (containsKey!400 lt!377539 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832071 () Bool)

(declare-fun e!464025 () List!15949)

(declare-fun call!36396 () List!15949)

(assert (=> b!832071 (= e!464025 call!36396)))

(declare-fun e!464027 () List!15949)

(declare-fun bm!36393 () Bool)

(declare-fun c!90392 () Bool)

(declare-fun call!36398 () List!15949)

(assert (=> bm!36393 (= call!36398 ($colon$colon!536 e!464027 (ite c!90392 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90393 () Bool)

(assert (=> bm!36393 (= c!90393 c!90392)))

(declare-fun b!832073 () Bool)

(declare-fun e!464026 () List!15949)

(assert (=> b!832073 (= e!464026 call!36398)))

(declare-fun bm!36394 () Bool)

(declare-fun call!36397 () List!15949)

(assert (=> bm!36394 (= call!36397 call!36398)))

(declare-fun b!832074 () Bool)

(declare-fun e!464024 () List!15949)

(assert (=> b!832074 (= e!464024 call!36397)))

(declare-fun c!90395 () Bool)

(declare-fun b!832075 () Bool)

(declare-fun c!90394 () Bool)

(assert (=> b!832075 (= e!464027 (ite c!90395 (t!22308 (toList!4505 lt!377163)) (ite c!90394 (Cons!15945 (h!17075 (toList!4505 lt!377163)) (t!22308 (toList!4505 lt!377163))) Nil!15946)))))

(declare-fun b!832076 () Bool)

(assert (=> b!832076 (= e!464025 call!36396)))

(declare-fun bm!36395 () Bool)

(assert (=> bm!36395 (= call!36396 call!36397)))

(declare-fun b!832077 () Bool)

(assert (=> b!832077 (= e!464026 e!464024)))

(assert (=> b!832077 (= c!90395 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (= (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832078 () Bool)

(assert (=> b!832078 (= e!464027 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377163)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832072 () Bool)

(assert (=> b!832072 (= c!90394 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!832072 (= e!464024 e!464025)))

(declare-fun d!106293 () Bool)

(assert (=> d!106293 e!464023))

(declare-fun res!566190 () Bool)

(assert (=> d!106293 (=> (not res!566190) (not e!464023))))

(assert (=> d!106293 (= res!566190 (isStrictlySorted!438 lt!377539))))

(assert (=> d!106293 (= lt!377539 e!464026)))

(assert (=> d!106293 (= c!90392 (and ((_ is Cons!15945) (toList!4505 lt!377163)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106293 (isStrictlySorted!438 (toList!4505 lt!377163))))

(assert (=> d!106293 (= (insertStrictlySorted!270 (toList!4505 lt!377163) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377539)))

(assert (= (and d!106293 c!90392) b!832073))

(assert (= (and d!106293 (not c!90392)) b!832077))

(assert (= (and b!832077 c!90395) b!832074))

(assert (= (and b!832077 (not c!90395)) b!832072))

(assert (= (and b!832072 c!90394) b!832071))

(assert (= (and b!832072 (not c!90394)) b!832076))

(assert (= (or b!832071 b!832076) bm!36395))

(assert (= (or b!832074 bm!36395) bm!36394))

(assert (= (or b!832073 bm!36394) bm!36393))

(assert (= (and bm!36393 c!90393) b!832078))

(assert (= (and bm!36393 (not c!90393)) b!832075))

(assert (= (and d!106293 res!566190) b!832070))

(assert (= (and b!832070 res!566191) b!832069))

(declare-fun m!775779 () Bool)

(assert (=> b!832069 m!775779))

(declare-fun m!775781 () Bool)

(assert (=> d!106293 m!775781))

(assert (=> d!106293 m!775671))

(declare-fun m!775783 () Bool)

(assert (=> b!832070 m!775783))

(declare-fun m!775785 () Bool)

(assert (=> bm!36393 m!775785))

(declare-fun m!775787 () Bool)

(assert (=> b!832078 m!775787))

(assert (=> d!106103 d!106293))

(assert (=> d!106115 d!106123))

(declare-fun b!832081 () Bool)

(declare-fun e!464029 () Option!420)

(assert (=> b!832081 (= e!464029 (getValueByKey!414 (t!22308 (toList!4505 lt!377357)) (_1!5094 lt!377164)))))

(declare-fun b!832082 () Bool)

(assert (=> b!832082 (= e!464029 None!418)))

(declare-fun d!106295 () Bool)

(declare-fun c!90396 () Bool)

(assert (=> d!106295 (= c!90396 (and ((_ is Cons!15945) (toList!4505 lt!377357)) (= (_1!5094 (h!17075 (toList!4505 lt!377357))) (_1!5094 lt!377164))))))

(declare-fun e!464028 () Option!420)

(assert (=> d!106295 (= (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164)) e!464028)))

(declare-fun b!832080 () Bool)

(assert (=> b!832080 (= e!464028 e!464029)))

(declare-fun c!90397 () Bool)

(assert (=> b!832080 (= c!90397 (and ((_ is Cons!15945) (toList!4505 lt!377357)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377357))) (_1!5094 lt!377164)))))))

(declare-fun b!832079 () Bool)

(assert (=> b!832079 (= e!464028 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377357)))))))

(assert (= (and d!106295 c!90396) b!832079))

(assert (= (and d!106295 (not c!90396)) b!832080))

(assert (= (and b!832080 c!90397) b!832081))

(assert (= (and b!832080 (not c!90397)) b!832082))

(declare-fun m!775789 () Bool)

(assert (=> b!832081 m!775789))

(assert (=> b!831737 d!106295))

(declare-fun d!106297 () Bool)

(declare-fun e!464031 () Bool)

(assert (=> d!106297 e!464031))

(declare-fun res!566192 () Bool)

(assert (=> d!106297 (=> res!566192 e!464031)))

(declare-fun lt!377542 () Bool)

(assert (=> d!106297 (= res!566192 (not lt!377542))))

(declare-fun lt!377540 () Bool)

(assert (=> d!106297 (= lt!377542 lt!377540)))

(declare-fun lt!377543 () Unit!28447)

(declare-fun e!464030 () Unit!28447)

(assert (=> d!106297 (= lt!377543 e!464030)))

(declare-fun c!90398 () Bool)

(assert (=> d!106297 (= c!90398 lt!377540)))

(assert (=> d!106297 (= lt!377540 (containsKey!400 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106297 (= (contains!4190 lt!377318 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377542)))

(declare-fun b!832083 () Bool)

(declare-fun lt!377541 () Unit!28447)

(assert (=> b!832083 (= e!464030 lt!377541)))

(assert (=> b!832083 (= lt!377541 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832083 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832084 () Bool)

(declare-fun Unit!28468 () Unit!28447)

(assert (=> b!832084 (= e!464030 Unit!28468)))

(declare-fun b!832085 () Bool)

(assert (=> b!832085 (= e!464031 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106297 c!90398) b!832083))

(assert (= (and d!106297 (not c!90398)) b!832084))

(assert (= (and d!106297 (not res!566192)) b!832085))

(declare-fun m!775791 () Bool)

(assert (=> d!106297 m!775791))

(declare-fun m!775793 () Bool)

(assert (=> b!832083 m!775793))

(assert (=> b!832083 m!775429))

(assert (=> b!832083 m!775429))

(declare-fun m!775795 () Bool)

(assert (=> b!832083 m!775795))

(assert (=> b!832085 m!775429))

(assert (=> b!832085 m!775429))

(assert (=> b!832085 m!775795))

(assert (=> bm!36353 d!106297))

(assert (=> bm!36333 d!106171))

(declare-fun b!832088 () Bool)

(declare-fun e!464033 () Option!420)

(assert (=> b!832088 (= e!464033 (getValueByKey!414 (t!22308 (toList!4505 lt!377222)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832089 () Bool)

(assert (=> b!832089 (= e!464033 None!418)))

(declare-fun d!106299 () Bool)

(declare-fun c!90399 () Bool)

(assert (=> d!106299 (= c!90399 (and ((_ is Cons!15945) (toList!4505 lt!377222)) (= (_1!5094 (h!17075 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464032 () Option!420)

(assert (=> d!106299 (= (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464032)))

(declare-fun b!832087 () Bool)

(assert (=> b!832087 (= e!464032 e!464033)))

(declare-fun c!90400 () Bool)

(assert (=> b!832087 (= c!90400 (and ((_ is Cons!15945) (toList!4505 lt!377222)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832086 () Bool)

(assert (=> b!832086 (= e!464032 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377222)))))))

(assert (= (and d!106299 c!90399) b!832086))

(assert (= (and d!106299 (not c!90399)) b!832087))

(assert (= (and b!832087 c!90400) b!832088))

(assert (= (and b!832087 (not c!90400)) b!832089))

(declare-fun m!775797 () Bool)

(assert (=> b!832088 m!775797))

(assert (=> b!831595 d!106299))

(declare-fun d!106301 () Bool)

(assert (=> d!106301 (= (apply!373 lt!377340 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11832 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23242 () Bool)

(assert (= bs!23242 d!106301))

(declare-fun m!775799 () Bool)

(assert (=> bs!23242 m!775799))

(assert (=> bs!23242 m!775799))

(declare-fun m!775801 () Bool)

(assert (=> bs!23242 m!775801))

(assert (=> b!831722 d!106301))

(declare-fun b!832091 () Bool)

(declare-fun e!464036 () Bool)

(declare-fun e!464039 () Bool)

(assert (=> b!832091 (= e!464036 e!464039)))

(declare-fun c!90404 () Bool)

(declare-fun e!464038 () Bool)

(assert (=> b!832091 (= c!90404 e!464038)))

(declare-fun res!566195 () Bool)

(assert (=> b!832091 (=> (not res!566195) (not e!464038))))

(assert (=> b!832091 (= res!566195 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832092 () Bool)

(declare-fun e!464040 () ListLongMap!8979)

(declare-fun e!464034 () ListLongMap!8979)

(assert (=> b!832092 (= e!464040 e!464034)))

(declare-fun c!90402 () Bool)

(assert (=> b!832092 (= c!90402 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!377547 () ListLongMap!8979)

(declare-fun e!464035 () Bool)

(declare-fun b!832093 () Bool)

(assert (=> b!832093 (= e!464035 (= lt!377547 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!832094 () Bool)

(assert (=> b!832094 (= e!464039 e!464035)))

(declare-fun c!90401 () Bool)

(assert (=> b!832094 (= c!90401 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832095 () Bool)

(declare-fun lt!377545 () Unit!28447)

(declare-fun lt!377546 () Unit!28447)

(assert (=> b!832095 (= lt!377545 lt!377546)))

(declare-fun lt!377550 () (_ BitVec 64))

(declare-fun lt!377544 () (_ BitVec 64))

(declare-fun lt!377548 () ListLongMap!8979)

(declare-fun lt!377549 () V!25283)

(assert (=> b!832095 (not (contains!4190 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549)) lt!377550))))

(assert (=> b!832095 (= lt!377546 (addStillNotContains!199 lt!377548 lt!377544 lt!377549 lt!377550))))

(assert (=> b!832095 (= lt!377550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832095 (= lt!377549 (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832095 (= lt!377544 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36399 () ListLongMap!8979)

(assert (=> b!832095 (= lt!377548 call!36399)))

(assert (=> b!832095 (= e!464034 (+!2013 call!36399 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36396 () Bool)

(assert (=> bm!36396 (= call!36399 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832096 () Bool)

(declare-fun res!566196 () Bool)

(assert (=> b!832096 (=> (not res!566196) (not e!464036))))

(assert (=> b!832096 (= res!566196 (not (contains!4190 lt!377547 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832097 () Bool)

(assert (=> b!832097 (= e!464040 (ListLongMap!8980 Nil!15946))))

(declare-fun b!832098 () Bool)

(assert (=> b!832098 (= e!464034 call!36399)))

(declare-fun b!832099 () Bool)

(assert (=> b!832099 (= e!464038 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832099 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!106303 () Bool)

(assert (=> d!106303 e!464036))

(declare-fun res!566194 () Bool)

(assert (=> d!106303 (=> (not res!566194) (not e!464036))))

(assert (=> d!106303 (= res!566194 (not (contains!4190 lt!377547 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106303 (= lt!377547 e!464040)))

(declare-fun c!90403 () Bool)

(assert (=> d!106303 (= c!90403 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106303 (validMask!0 mask!1312)))

(assert (=> d!106303 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377547)))

(declare-fun b!832090 () Bool)

(assert (=> b!832090 (= e!464035 (isEmpty!662 lt!377547))))

(declare-fun b!832100 () Bool)

(assert (=> b!832100 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> b!832100 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22741 _values!788)))))

(declare-fun e!464037 () Bool)

(assert (=> b!832100 (= e!464037 (= (apply!373 lt!377547 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832101 () Bool)

(assert (=> b!832101 (= e!464039 e!464037)))

(assert (=> b!832101 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun res!566193 () Bool)

(assert (=> b!832101 (= res!566193 (contains!4190 lt!377547 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832101 (=> (not res!566193) (not e!464037))))

(assert (= (and d!106303 c!90403) b!832097))

(assert (= (and d!106303 (not c!90403)) b!832092))

(assert (= (and b!832092 c!90402) b!832095))

(assert (= (and b!832092 (not c!90402)) b!832098))

(assert (= (or b!832095 b!832098) bm!36396))

(assert (= (and d!106303 res!566194) b!832096))

(assert (= (and b!832096 res!566196) b!832091))

(assert (= (and b!832091 res!566195) b!832099))

(assert (= (and b!832091 c!90404) b!832101))

(assert (= (and b!832091 (not c!90404)) b!832094))

(assert (= (and b!832101 res!566193) b!832100))

(assert (= (and b!832094 c!90401) b!832093))

(assert (= (and b!832094 (not c!90401)) b!832090))

(declare-fun b_lambda!11413 () Bool)

(assert (=> (not b_lambda!11413) (not b!832095)))

(assert (=> b!832095 t!22315))

(declare-fun b_and!22555 () Bool)

(assert (= b_and!22553 (and (=> t!22315 result!8013) b_and!22555)))

(declare-fun b_lambda!11415 () Bool)

(assert (=> (not b_lambda!11415) (not b!832100)))

(assert (=> b!832100 t!22315))

(declare-fun b_and!22557 () Bool)

(assert (= b_and!22555 (and (=> t!22315 result!8013) b_and!22557)))

(declare-fun m!775803 () Bool)

(assert (=> b!832095 m!775803))

(declare-fun m!775805 () Bool)

(assert (=> b!832095 m!775805))

(assert (=> b!832095 m!775399))

(assert (=> b!832095 m!775043))

(assert (=> b!832095 m!775401))

(declare-fun m!775807 () Bool)

(assert (=> b!832095 m!775807))

(declare-fun m!775809 () Bool)

(assert (=> b!832095 m!775809))

(assert (=> b!832095 m!775803))

(assert (=> b!832095 m!775043))

(assert (=> b!832095 m!775407))

(assert (=> b!832095 m!775399))

(declare-fun m!775811 () Bool)

(assert (=> bm!36396 m!775811))

(declare-fun m!775813 () Bool)

(assert (=> b!832096 m!775813))

(assert (=> b!832101 m!775407))

(assert (=> b!832101 m!775407))

(declare-fun m!775815 () Bool)

(assert (=> b!832101 m!775815))

(declare-fun m!775817 () Bool)

(assert (=> d!106303 m!775817))

(assert (=> d!106303 m!774915))

(assert (=> b!832092 m!775407))

(assert (=> b!832092 m!775407))

(assert (=> b!832092 m!775417))

(declare-fun m!775819 () Bool)

(assert (=> b!832090 m!775819))

(assert (=> b!832093 m!775811))

(assert (=> b!832100 m!775043))

(assert (=> b!832100 m!775399))

(assert (=> b!832100 m!775043))

(assert (=> b!832100 m!775401))

(assert (=> b!832100 m!775407))

(declare-fun m!775821 () Bool)

(assert (=> b!832100 m!775821))

(assert (=> b!832100 m!775407))

(assert (=> b!832100 m!775399))

(assert (=> b!832099 m!775407))

(assert (=> b!832099 m!775407))

(assert (=> b!832099 m!775417))

(assert (=> bm!36332 d!106303))

(assert (=> b!831719 d!106147))

(assert (=> d!106113 d!106123))

(declare-fun d!106305 () Bool)

(declare-fun e!464042 () Bool)

(assert (=> d!106305 e!464042))

(declare-fun res!566197 () Bool)

(assert (=> d!106305 (=> res!566197 e!464042)))

(declare-fun lt!377553 () Bool)

(assert (=> d!106305 (= res!566197 (not lt!377553))))

(declare-fun lt!377551 () Bool)

(assert (=> d!106305 (= lt!377553 lt!377551)))

(declare-fun lt!377554 () Unit!28447)

(declare-fun e!464041 () Unit!28447)

(assert (=> d!106305 (= lt!377554 e!464041)))

(declare-fun c!90405 () Bool)

(assert (=> d!106305 (= c!90405 lt!377551)))

(assert (=> d!106305 (= lt!377551 (containsKey!400 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106305 (= (contains!4190 lt!377340 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377553)))

(declare-fun b!832102 () Bool)

(declare-fun lt!377552 () Unit!28447)

(assert (=> b!832102 (= e!464041 lt!377552)))

(assert (=> b!832102 (= lt!377552 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832102 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832103 () Bool)

(declare-fun Unit!28469 () Unit!28447)

(assert (=> b!832103 (= e!464041 Unit!28469)))

(declare-fun b!832104 () Bool)

(assert (=> b!832104 (= e!464042 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106305 c!90405) b!832102))

(assert (= (and d!106305 (not c!90405)) b!832103))

(assert (= (and d!106305 (not res!566197)) b!832104))

(declare-fun m!775823 () Bool)

(assert (=> d!106305 m!775823))

(declare-fun m!775825 () Bool)

(assert (=> b!832102 m!775825))

(assert (=> b!832102 m!775799))

(assert (=> b!832102 m!775799))

(declare-fun m!775827 () Bool)

(assert (=> b!832102 m!775827))

(assert (=> b!832104 m!775799))

(assert (=> b!832104 m!775799))

(assert (=> b!832104 m!775827))

(assert (=> bm!36357 d!106305))

(assert (=> b!831637 d!106147))

(declare-fun b!832107 () Bool)

(declare-fun e!464044 () Option!420)

(assert (=> b!832107 (= e!464044 (getValueByKey!414 (t!22308 (toList!4505 lt!377218)) (_1!5094 lt!377161)))))

(declare-fun b!832108 () Bool)

(assert (=> b!832108 (= e!464044 None!418)))

(declare-fun d!106307 () Bool)

(declare-fun c!90406 () Bool)

(assert (=> d!106307 (= c!90406 (and ((_ is Cons!15945) (toList!4505 lt!377218)) (= (_1!5094 (h!17075 (toList!4505 lt!377218))) (_1!5094 lt!377161))))))

(declare-fun e!464043 () Option!420)

(assert (=> d!106307 (= (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161)) e!464043)))

(declare-fun b!832106 () Bool)

(assert (=> b!832106 (= e!464043 e!464044)))

(declare-fun c!90407 () Bool)

(assert (=> b!832106 (= c!90407 (and ((_ is Cons!15945) (toList!4505 lt!377218)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377218))) (_1!5094 lt!377161)))))))

(declare-fun b!832105 () Bool)

(assert (=> b!832105 (= e!464043 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377218)))))))

(assert (= (and d!106307 c!90406) b!832105))

(assert (= (and d!106307 (not c!90406)) b!832106))

(assert (= (and b!832106 c!90407) b!832107))

(assert (= (and b!832106 (not c!90407)) b!832108))

(declare-fun m!775829 () Bool)

(assert (=> b!832107 m!775829))

(assert (=> b!831593 d!106307))

(declare-fun d!106309 () Bool)

(declare-fun e!464046 () Bool)

(assert (=> d!106309 e!464046))

(declare-fun res!566198 () Bool)

(assert (=> d!106309 (=> res!566198 e!464046)))

(declare-fun lt!377557 () Bool)

(assert (=> d!106309 (= res!566198 (not lt!377557))))

(declare-fun lt!377555 () Bool)

(assert (=> d!106309 (= lt!377557 lt!377555)))

(declare-fun lt!377558 () Unit!28447)

(declare-fun e!464045 () Unit!28447)

(assert (=> d!106309 (= lt!377558 e!464045)))

(declare-fun c!90408 () Bool)

(assert (=> d!106309 (= c!90408 lt!377555)))

(assert (=> d!106309 (= lt!377555 (containsKey!400 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106309 (= (contains!4190 lt!377243 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377557)))

(declare-fun b!832109 () Bool)

(declare-fun lt!377556 () Unit!28447)

(assert (=> b!832109 (= e!464045 lt!377556)))

(assert (=> b!832109 (= lt!377556 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832109 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832110 () Bool)

(declare-fun Unit!28470 () Unit!28447)

(assert (=> b!832110 (= e!464045 Unit!28470)))

(declare-fun b!832111 () Bool)

(assert (=> b!832111 (= e!464046 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106309 c!90408) b!832109))

(assert (= (and d!106309 (not c!90408)) b!832110))

(assert (= (and d!106309 (not res!566198)) b!832111))

(assert (=> d!106309 m!775051))

(declare-fun m!775831 () Bool)

(assert (=> d!106309 m!775831))

(assert (=> b!832109 m!775051))

(declare-fun m!775833 () Bool)

(assert (=> b!832109 m!775833))

(assert (=> b!832109 m!775051))

(assert (=> b!832109 m!775647))

(assert (=> b!832109 m!775647))

(declare-fun m!775835 () Bool)

(assert (=> b!832109 m!775835))

(assert (=> b!832111 m!775051))

(assert (=> b!832111 m!775647))

(assert (=> b!832111 m!775647))

(assert (=> b!832111 m!775835))

(assert (=> b!831632 d!106309))

(declare-fun d!106311 () Bool)

(assert (=> d!106311 (= (apply!373 lt!377340 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11832 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23243 () Bool)

(assert (= bs!23243 d!106311))

(assert (=> bs!23243 m!775715))

(assert (=> bs!23243 m!775715))

(declare-fun m!775837 () Bool)

(assert (=> bs!23243 m!775837))

(assert (=> b!831726 d!106311))

(assert (=> b!831644 d!106147))

(assert (=> b!831766 d!106147))

(declare-fun b!832114 () Bool)

(declare-fun e!464048 () Option!420)

(assert (=> b!832114 (= e!464048 (getValueByKey!414 (t!22308 (toList!4505 lt!377257)) (_1!5094 lt!377161)))))

(declare-fun b!832115 () Bool)

(assert (=> b!832115 (= e!464048 None!418)))

(declare-fun d!106313 () Bool)

(declare-fun c!90409 () Bool)

(assert (=> d!106313 (= c!90409 (and ((_ is Cons!15945) (toList!4505 lt!377257)) (= (_1!5094 (h!17075 (toList!4505 lt!377257))) (_1!5094 lt!377161))))))

(declare-fun e!464047 () Option!420)

(assert (=> d!106313 (= (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161)) e!464047)))

(declare-fun b!832113 () Bool)

(assert (=> b!832113 (= e!464047 e!464048)))

(declare-fun c!90410 () Bool)

(assert (=> b!832113 (= c!90410 (and ((_ is Cons!15945) (toList!4505 lt!377257)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377257))) (_1!5094 lt!377161)))))))

(declare-fun b!832112 () Bool)

(assert (=> b!832112 (= e!464047 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377257)))))))

(assert (= (and d!106313 c!90409) b!832112))

(assert (= (and d!106313 (not c!90409)) b!832113))

(assert (= (and b!832113 c!90410) b!832114))

(assert (= (and b!832113 (not c!90410)) b!832115))

(declare-fun m!775839 () Bool)

(assert (=> b!832114 m!775839))

(assert (=> b!831647 d!106313))

(assert (=> b!831630 d!106147))

(assert (=> bm!36355 d!106107))

(declare-fun d!106315 () Bool)

(declare-fun lt!377559 () Bool)

(assert (=> d!106315 (= lt!377559 (select (content!386 (toList!4505 lt!377361)) lt!377164))))

(declare-fun e!464050 () Bool)

(assert (=> d!106315 (= lt!377559 e!464050)))

(declare-fun res!566199 () Bool)

(assert (=> d!106315 (=> (not res!566199) (not e!464050))))

(assert (=> d!106315 (= res!566199 ((_ is Cons!15945) (toList!4505 lt!377361)))))

(assert (=> d!106315 (= (contains!4191 (toList!4505 lt!377361) lt!377164) lt!377559)))

(declare-fun b!832116 () Bool)

(declare-fun e!464049 () Bool)

(assert (=> b!832116 (= e!464050 e!464049)))

(declare-fun res!566200 () Bool)

(assert (=> b!832116 (=> res!566200 e!464049)))

(assert (=> b!832116 (= res!566200 (= (h!17075 (toList!4505 lt!377361)) lt!377164))))

(declare-fun b!832117 () Bool)

(assert (=> b!832117 (= e!464049 (contains!4191 (t!22308 (toList!4505 lt!377361)) lt!377164))))

(assert (= (and d!106315 res!566199) b!832116))

(assert (= (and b!832116 (not res!566200)) b!832117))

(declare-fun m!775841 () Bool)

(assert (=> d!106315 m!775841))

(declare-fun m!775843 () Bool)

(assert (=> d!106315 m!775843))

(declare-fun m!775845 () Bool)

(assert (=> b!832117 m!775845))

(assert (=> b!831740 d!106315))

(declare-fun d!106317 () Bool)

(declare-fun e!464052 () Bool)

(assert (=> d!106317 e!464052))

(declare-fun res!566201 () Bool)

(assert (=> d!106317 (=> res!566201 e!464052)))

(declare-fun lt!377562 () Bool)

(assert (=> d!106317 (= res!566201 (not lt!377562))))

(declare-fun lt!377560 () Bool)

(assert (=> d!106317 (= lt!377562 lt!377560)))

(declare-fun lt!377563 () Unit!28447)

(declare-fun e!464051 () Unit!28447)

(assert (=> d!106317 (= lt!377563 e!464051)))

(declare-fun c!90411 () Bool)

(assert (=> d!106317 (= c!90411 lt!377560)))

(assert (=> d!106317 (= lt!377560 (containsKey!400 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(assert (=> d!106317 (= (contains!4190 lt!377218 (_1!5094 lt!377161)) lt!377562)))

(declare-fun b!832118 () Bool)

(declare-fun lt!377561 () Unit!28447)

(assert (=> b!832118 (= e!464051 lt!377561)))

(assert (=> b!832118 (= lt!377561 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(assert (=> b!832118 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(declare-fun b!832119 () Bool)

(declare-fun Unit!28471 () Unit!28447)

(assert (=> b!832119 (= e!464051 Unit!28471)))

(declare-fun b!832120 () Bool)

(assert (=> b!832120 (= e!464052 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161))))))

(assert (= (and d!106317 c!90411) b!832118))

(assert (= (and d!106317 (not c!90411)) b!832119))

(assert (= (and d!106317 (not res!566201)) b!832120))

(declare-fun m!775847 () Bool)

(assert (=> d!106317 m!775847))

(declare-fun m!775849 () Bool)

(assert (=> b!832118 m!775849))

(assert (=> b!832118 m!775019))

(assert (=> b!832118 m!775019))

(declare-fun m!775851 () Bool)

(assert (=> b!832118 m!775851))

(assert (=> b!832120 m!775019))

(assert (=> b!832120 m!775019))

(assert (=> b!832120 m!775851))

(assert (=> d!106101 d!106317))

(declare-fun b!832123 () Bool)

(declare-fun e!464054 () Option!420)

(assert (=> b!832123 (= e!464054 (getValueByKey!414 (t!22308 lt!377217) (_1!5094 lt!377161)))))

(declare-fun b!832124 () Bool)

(assert (=> b!832124 (= e!464054 None!418)))

(declare-fun d!106319 () Bool)

(declare-fun c!90412 () Bool)

(assert (=> d!106319 (= c!90412 (and ((_ is Cons!15945) lt!377217) (= (_1!5094 (h!17075 lt!377217)) (_1!5094 lt!377161))))))

(declare-fun e!464053 () Option!420)

(assert (=> d!106319 (= (getValueByKey!414 lt!377217 (_1!5094 lt!377161)) e!464053)))

(declare-fun b!832122 () Bool)

(assert (=> b!832122 (= e!464053 e!464054)))

(declare-fun c!90413 () Bool)

(assert (=> b!832122 (= c!90413 (and ((_ is Cons!15945) lt!377217) (not (= (_1!5094 (h!17075 lt!377217)) (_1!5094 lt!377161)))))))

(declare-fun b!832121 () Bool)

(assert (=> b!832121 (= e!464053 (Some!419 (_2!5094 (h!17075 lt!377217))))))

(assert (= (and d!106319 c!90412) b!832121))

(assert (= (and d!106319 (not c!90412)) b!832122))

(assert (= (and b!832122 c!90413) b!832123))

(assert (= (and b!832122 (not c!90413)) b!832124))

(declare-fun m!775853 () Bool)

(assert (=> b!832123 m!775853))

(assert (=> d!106101 d!106319))

(declare-fun d!106321 () Bool)

(assert (=> d!106321 (= (getValueByKey!414 lt!377217 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(declare-fun lt!377564 () Unit!28447)

(assert (=> d!106321 (= lt!377564 (choose!1433 lt!377217 (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun e!464055 () Bool)

(assert (=> d!106321 e!464055))

(declare-fun res!566202 () Bool)

(assert (=> d!106321 (=> (not res!566202) (not e!464055))))

(assert (=> d!106321 (= res!566202 (isStrictlySorted!438 lt!377217))))

(assert (=> d!106321 (= (lemmaContainsTupThenGetReturnValue!231 lt!377217 (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377564)))

(declare-fun b!832125 () Bool)

(declare-fun res!566203 () Bool)

(assert (=> b!832125 (=> (not res!566203) (not e!464055))))

(assert (=> b!832125 (= res!566203 (containsKey!400 lt!377217 (_1!5094 lt!377161)))))

(declare-fun b!832126 () Bool)

(assert (=> b!832126 (= e!464055 (contains!4191 lt!377217 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106321 res!566202) b!832125))

(assert (= (and b!832125 res!566203) b!832126))

(assert (=> d!106321 m!775013))

(declare-fun m!775855 () Bool)

(assert (=> d!106321 m!775855))

(declare-fun m!775857 () Bool)

(assert (=> d!106321 m!775857))

(declare-fun m!775859 () Bool)

(assert (=> b!832125 m!775859))

(declare-fun m!775861 () Bool)

(assert (=> b!832126 m!775861))

(assert (=> d!106101 d!106321))

(declare-fun b!832127 () Bool)

(declare-fun e!464056 () Bool)

(declare-fun lt!377565 () List!15949)

(assert (=> b!832127 (= e!464056 (contains!4191 lt!377565 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832128 () Bool)

(declare-fun res!566205 () Bool)

(assert (=> b!832128 (=> (not res!566205) (not e!464056))))

(assert (=> b!832128 (= res!566205 (containsKey!400 lt!377565 (_1!5094 lt!377161)))))

(declare-fun b!832129 () Bool)

(declare-fun e!464058 () List!15949)

(declare-fun call!36400 () List!15949)

(assert (=> b!832129 (= e!464058 call!36400)))

(declare-fun e!464060 () List!15949)

(declare-fun call!36402 () List!15949)

(declare-fun c!90414 () Bool)

(declare-fun bm!36397 () Bool)

(assert (=> bm!36397 (= call!36402 ($colon$colon!536 e!464060 (ite c!90414 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90415 () Bool)

(assert (=> bm!36397 (= c!90415 c!90414)))

(declare-fun b!832131 () Bool)

(declare-fun e!464059 () List!15949)

(assert (=> b!832131 (= e!464059 call!36402)))

(declare-fun bm!36398 () Bool)

(declare-fun call!36401 () List!15949)

(assert (=> bm!36398 (= call!36401 call!36402)))

(declare-fun b!832132 () Bool)

(declare-fun e!464057 () List!15949)

(assert (=> b!832132 (= e!464057 call!36401)))

(declare-fun b!832133 () Bool)

(declare-fun c!90416 () Bool)

(declare-fun c!90417 () Bool)

(assert (=> b!832133 (= e!464060 (ite c!90417 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!90416 (Cons!15945 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15946)))))

(declare-fun b!832134 () Bool)

(assert (=> b!832134 (= e!464058 call!36400)))

(declare-fun bm!36399 () Bool)

(assert (=> bm!36399 (= call!36400 call!36401)))

(declare-fun b!832135 () Bool)

(assert (=> b!832135 (= e!464059 e!464057)))

(assert (=> b!832135 (= c!90417 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5094 lt!377161))))))

(declare-fun b!832136 () Bool)

(assert (=> b!832136 (= e!464060 (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!832130 () Bool)

(assert (=> b!832130 (= c!90416 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5094 lt!377161))))))

(assert (=> b!832130 (= e!464057 e!464058)))

(declare-fun d!106323 () Bool)

(assert (=> d!106323 e!464056))

(declare-fun res!566204 () Bool)

(assert (=> d!106323 (=> (not res!566204) (not e!464056))))

(assert (=> d!106323 (= res!566204 (isStrictlySorted!438 lt!377565))))

(assert (=> d!106323 (= lt!377565 e!464059)))

(assert (=> d!106323 (= c!90414 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5094 lt!377161))))))

(assert (=> d!106323 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106323 (= (insertStrictlySorted!270 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377565)))

(assert (= (and d!106323 c!90414) b!832131))

(assert (= (and d!106323 (not c!90414)) b!832135))

(assert (= (and b!832135 c!90417) b!832132))

(assert (= (and b!832135 (not c!90417)) b!832130))

(assert (= (and b!832130 c!90416) b!832129))

(assert (= (and b!832130 (not c!90416)) b!832134))

(assert (= (or b!832129 b!832134) bm!36399))

(assert (= (or b!832132 bm!36399) bm!36398))

(assert (= (or b!832131 bm!36398) bm!36397))

(assert (= (and bm!36397 c!90415) b!832136))

(assert (= (and bm!36397 (not c!90415)) b!832133))

(assert (= (and d!106323 res!566204) b!832128))

(assert (= (and b!832128 res!566205) b!832127))

(declare-fun m!775863 () Bool)

(assert (=> b!832127 m!775863))

(declare-fun m!775865 () Bool)

(assert (=> d!106323 m!775865))

(declare-fun m!775867 () Bool)

(assert (=> d!106323 m!775867))

(declare-fun m!775869 () Bool)

(assert (=> b!832128 m!775869))

(declare-fun m!775871 () Bool)

(assert (=> bm!36397 m!775871))

(declare-fun m!775873 () Bool)

(assert (=> b!832136 m!775873))

(assert (=> d!106101 d!106323))

(declare-fun d!106325 () Bool)

(declare-fun lt!377566 () Bool)

(assert (=> d!106325 (= lt!377566 (select (content!386 (toList!4505 lt!377365)) lt!377161))))

(declare-fun e!464062 () Bool)

(assert (=> d!106325 (= lt!377566 e!464062)))

(declare-fun res!566206 () Bool)

(assert (=> d!106325 (=> (not res!566206) (not e!464062))))

(assert (=> d!106325 (= res!566206 ((_ is Cons!15945) (toList!4505 lt!377365)))))

(assert (=> d!106325 (= (contains!4191 (toList!4505 lt!377365) lt!377161) lt!377566)))

(declare-fun b!832137 () Bool)

(declare-fun e!464061 () Bool)

(assert (=> b!832137 (= e!464062 e!464061)))

(declare-fun res!566207 () Bool)

(assert (=> b!832137 (=> res!566207 e!464061)))

(assert (=> b!832137 (= res!566207 (= (h!17075 (toList!4505 lt!377365)) lt!377161))))

(declare-fun b!832138 () Bool)

(assert (=> b!832138 (= e!464061 (contains!4191 (t!22308 (toList!4505 lt!377365)) lt!377161))))

(assert (= (and d!106325 res!566206) b!832137))

(assert (= (and b!832137 (not res!566207)) b!832138))

(declare-fun m!775875 () Bool)

(assert (=> d!106325 m!775875))

(declare-fun m!775877 () Bool)

(assert (=> d!106325 m!775877))

(declare-fun m!775879 () Bool)

(assert (=> b!832138 m!775879))

(assert (=> b!831742 d!106325))

(declare-fun d!106327 () Bool)

(declare-fun lt!377567 () Bool)

(assert (=> d!106327 (= lt!377567 (select (content!386 (toList!4505 lt!377349)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464064 () Bool)

(assert (=> d!106327 (= lt!377567 e!464064)))

(declare-fun res!566208 () Bool)

(assert (=> d!106327 (=> (not res!566208) (not e!464064))))

(assert (=> d!106327 (= res!566208 ((_ is Cons!15945) (toList!4505 lt!377349)))))

(assert (=> d!106327 (= (contains!4191 (toList!4505 lt!377349) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377567)))

(declare-fun b!832139 () Bool)

(declare-fun e!464063 () Bool)

(assert (=> b!832139 (= e!464064 e!464063)))

(declare-fun res!566209 () Bool)

(assert (=> b!832139 (=> res!566209 e!464063)))

(assert (=> b!832139 (= res!566209 (= (h!17075 (toList!4505 lt!377349)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!832140 () Bool)

(assert (=> b!832140 (= e!464063 (contains!4191 (t!22308 (toList!4505 lt!377349)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106327 res!566208) b!832139))

(assert (= (and b!832139 (not res!566209)) b!832140))

(declare-fun m!775881 () Bool)

(assert (=> d!106327 m!775881))

(declare-fun m!775883 () Bool)

(assert (=> d!106327 m!775883))

(declare-fun m!775885 () Bool)

(assert (=> b!832140 m!775885))

(assert (=> b!831734 d!106327))

(declare-fun d!106329 () Bool)

(declare-fun e!464066 () Bool)

(assert (=> d!106329 e!464066))

(declare-fun res!566210 () Bool)

(assert (=> d!106329 (=> res!566210 e!464066)))

(declare-fun lt!377570 () Bool)

(assert (=> d!106329 (= res!566210 (not lt!377570))))

(declare-fun lt!377568 () Bool)

(assert (=> d!106329 (= lt!377570 lt!377568)))

(declare-fun lt!377571 () Unit!28447)

(declare-fun e!464065 () Unit!28447)

(assert (=> d!106329 (= lt!377571 e!464065)))

(declare-fun c!90418 () Bool)

(assert (=> d!106329 (= c!90418 lt!377568)))

(assert (=> d!106329 (= lt!377568 (containsKey!400 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106329 (= (contains!4190 lt!377318 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377570)))

(declare-fun b!832141 () Bool)

(declare-fun lt!377569 () Unit!28447)

(assert (=> b!832141 (= e!464065 lt!377569)))

(assert (=> b!832141 (= lt!377569 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832141 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832142 () Bool)

(declare-fun Unit!28472 () Unit!28447)

(assert (=> b!832142 (= e!464065 Unit!28472)))

(declare-fun b!832143 () Bool)

(assert (=> b!832143 (= e!464066 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106329 c!90418) b!832141))

(assert (= (and d!106329 (not c!90418)) b!832142))

(assert (= (and d!106329 (not res!566210)) b!832143))

(declare-fun m!775887 () Bool)

(assert (=> d!106329 m!775887))

(declare-fun m!775889 () Bool)

(assert (=> b!832141 m!775889))

(declare-fun m!775891 () Bool)

(assert (=> b!832141 m!775891))

(assert (=> b!832141 m!775891))

(declare-fun m!775893 () Bool)

(assert (=> b!832141 m!775893))

(assert (=> b!832143 m!775891))

(assert (=> b!832143 m!775891))

(assert (=> b!832143 m!775893))

(assert (=> bm!36350 d!106329))

(assert (=> b!831698 d!106147))

(declare-fun b!832144 () Bool)

(declare-fun e!464069 () Bool)

(declare-fun e!464068 () Bool)

(assert (=> b!832144 (= e!464069 e!464068)))

(declare-fun c!90419 () Bool)

(assert (=> b!832144 (= c!90419 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832145 () Bool)

(declare-fun e!464070 () Bool)

(assert (=> b!832145 (= e!464070 e!464069)))

(declare-fun res!566212 () Bool)

(assert (=> b!832145 (=> (not res!566212) (not e!464069))))

(declare-fun e!464067 () Bool)

(assert (=> b!832145 (= res!566212 (not e!464067))))

(declare-fun res!566211 () Bool)

(assert (=> b!832145 (=> (not res!566211) (not e!464067))))

(assert (=> b!832145 (= res!566211 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!106331 () Bool)

(declare-fun res!566213 () Bool)

(assert (=> d!106331 (=> res!566213 e!464070)))

(assert (=> d!106331 (= res!566213 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106331 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) e!464070)))

(declare-fun b!832146 () Bool)

(assert (=> b!832146 (= e!464067 (contains!4192 (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832147 () Bool)

(declare-fun call!36403 () Bool)

(assert (=> b!832147 (= e!464068 call!36403)))

(declare-fun b!832148 () Bool)

(assert (=> b!832148 (= e!464068 call!36403)))

(declare-fun bm!36400 () Bool)

(assert (=> bm!36400 (= call!36403 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90419 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))))))

(assert (= (and d!106331 (not res!566213)) b!832145))

(assert (= (and b!832145 res!566211) b!832146))

(assert (= (and b!832145 res!566212) b!832144))

(assert (= (and b!832144 c!90419) b!832147))

(assert (= (and b!832144 (not c!90419)) b!832148))

(assert (= (or b!832147 b!832148) bm!36400))

(assert (=> b!832144 m!775407))

(assert (=> b!832144 m!775407))

(assert (=> b!832144 m!775417))

(assert (=> b!832145 m!775407))

(assert (=> b!832145 m!775407))

(assert (=> b!832145 m!775417))

(assert (=> b!832146 m!775407))

(assert (=> b!832146 m!775407))

(declare-fun m!775895 () Bool)

(assert (=> b!832146 m!775895))

(assert (=> bm!36400 m!775407))

(declare-fun m!775897 () Bool)

(assert (=> bm!36400 m!775897))

(assert (=> bm!36367 d!106331))

(declare-fun d!106333 () Bool)

(declare-fun e!464072 () Bool)

(assert (=> d!106333 e!464072))

(declare-fun res!566214 () Bool)

(assert (=> d!106333 (=> res!566214 e!464072)))

(declare-fun lt!377574 () Bool)

(assert (=> d!106333 (= res!566214 (not lt!377574))))

(declare-fun lt!377572 () Bool)

(assert (=> d!106333 (= lt!377574 lt!377572)))

(declare-fun lt!377575 () Unit!28447)

(declare-fun e!464071 () Unit!28447)

(assert (=> d!106333 (= lt!377575 e!464071)))

(declare-fun c!90420 () Bool)

(assert (=> d!106333 (= c!90420 lt!377572)))

(assert (=> d!106333 (= lt!377572 (containsKey!400 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106333 (= (contains!4190 lt!377250 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377574)))

(declare-fun b!832149 () Bool)

(declare-fun lt!377573 () Unit!28447)

(assert (=> b!832149 (= e!464071 lt!377573)))

(assert (=> b!832149 (= lt!377573 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832149 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832150 () Bool)

(declare-fun Unit!28473 () Unit!28447)

(assert (=> b!832150 (= e!464071 Unit!28473)))

(declare-fun b!832151 () Bool)

(assert (=> b!832151 (= e!464072 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106333 c!90420) b!832149))

(assert (= (and d!106333 (not c!90420)) b!832150))

(assert (= (and d!106333 (not res!566214)) b!832151))

(assert (=> d!106333 m!775051))

(declare-fun m!775899 () Bool)

(assert (=> d!106333 m!775899))

(assert (=> b!832149 m!775051))

(declare-fun m!775901 () Bool)

(assert (=> b!832149 m!775901))

(assert (=> b!832149 m!775051))

(assert (=> b!832149 m!775529))

(assert (=> b!832149 m!775529))

(declare-fun m!775903 () Bool)

(assert (=> b!832149 m!775903))

(assert (=> b!832151 m!775051))

(assert (=> b!832151 m!775529))

(assert (=> b!832151 m!775529))

(assert (=> b!832151 m!775903))

(assert (=> b!831646 d!106333))

(declare-fun d!106335 () Bool)

(declare-fun res!566216 () Bool)

(declare-fun e!464075 () Bool)

(assert (=> d!106335 (=> res!566216 e!464075)))

(assert (=> d!106335 (= res!566216 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106335 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!464075)))

(declare-fun b!832152 () Bool)

(declare-fun e!464074 () Bool)

(declare-fun e!464073 () Bool)

(assert (=> b!832152 (= e!464074 e!464073)))

(declare-fun lt!377577 () (_ BitVec 64))

(assert (=> b!832152 (= lt!377577 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!377576 () Unit!28447)

(assert (=> b!832152 (= lt!377576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!832152 (arrayContainsKey!0 _keys!976 lt!377577 #b00000000000000000000000000000000)))

(declare-fun lt!377578 () Unit!28447)

(assert (=> b!832152 (= lt!377578 lt!377576)))

(declare-fun res!566215 () Bool)

(assert (=> b!832152 (= res!566215 (= (seekEntryOrOpen!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832152 (=> (not res!566215) (not e!464073))))

(declare-fun bm!36401 () Bool)

(declare-fun call!36404 () Bool)

(assert (=> bm!36401 (= call!36404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!832153 () Bool)

(assert (=> b!832153 (= e!464075 e!464074)))

(declare-fun c!90421 () Bool)

(assert (=> b!832153 (= c!90421 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832154 () Bool)

(assert (=> b!832154 (= e!464073 call!36404)))

(declare-fun b!832155 () Bool)

(assert (=> b!832155 (= e!464074 call!36404)))

(assert (= (and d!106335 (not res!566216)) b!832153))

(assert (= (and b!832153 c!90421) b!832152))

(assert (= (and b!832153 (not c!90421)) b!832155))

(assert (= (and b!832152 res!566215) b!832154))

(assert (= (or b!832154 b!832155) bm!36401))

(assert (=> b!832152 m!775407))

(declare-fun m!775905 () Bool)

(assert (=> b!832152 m!775905))

(declare-fun m!775907 () Bool)

(assert (=> b!832152 m!775907))

(assert (=> b!832152 m!775407))

(declare-fun m!775909 () Bool)

(assert (=> b!832152 m!775909))

(declare-fun m!775911 () Bool)

(assert (=> bm!36401 m!775911))

(assert (=> b!832153 m!775407))

(assert (=> b!832153 m!775407))

(assert (=> b!832153 m!775417))

(assert (=> bm!36364 d!106335))

(declare-fun d!106337 () Bool)

(declare-fun e!464076 () Bool)

(assert (=> d!106337 e!464076))

(declare-fun res!566217 () Bool)

(assert (=> d!106337 (=> (not res!566217) (not e!464076))))

(declare-fun lt!377582 () ListLongMap!8979)

(assert (=> d!106337 (= res!566217 (contains!4190 lt!377582 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377581 () List!15949)

(assert (=> d!106337 (= lt!377582 (ListLongMap!8980 lt!377581))))

(declare-fun lt!377580 () Unit!28447)

(declare-fun lt!377579 () Unit!28447)

(assert (=> d!106337 (= lt!377580 lt!377579)))

(assert (=> d!106337 (= (getValueByKey!414 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106337 (= lt!377579 (lemmaContainsTupThenGetReturnValue!231 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106337 (= lt!377581 (insertStrictlySorted!270 (toList!4505 call!36358) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106337 (= (+!2013 call!36358 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377582)))

(declare-fun b!832156 () Bool)

(declare-fun res!566218 () Bool)

(assert (=> b!832156 (=> (not res!566218) (not e!464076))))

(assert (=> b!832156 (= res!566218 (= (getValueByKey!414 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832157 () Bool)

(assert (=> b!832157 (= e!464076 (contains!4191 (toList!4505 lt!377582) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106337 res!566217) b!832156))

(assert (= (and b!832156 res!566218) b!832157))

(declare-fun m!775913 () Bool)

(assert (=> d!106337 m!775913))

(declare-fun m!775915 () Bool)

(assert (=> d!106337 m!775915))

(declare-fun m!775917 () Bool)

(assert (=> d!106337 m!775917))

(declare-fun m!775919 () Bool)

(assert (=> d!106337 m!775919))

(declare-fun m!775921 () Bool)

(assert (=> b!832156 m!775921))

(declare-fun m!775923 () Bool)

(assert (=> b!832157 m!775923))

(assert (=> b!831728 d!106337))

(assert (=> b!831624 d!106303))

(declare-fun d!106339 () Bool)

(assert (=> d!106339 (= (apply!373 lt!377340 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (get!11832 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23244 () Bool)

(assert (= bs!23244 d!106339))

(assert (=> bs!23244 m!775051))

(declare-fun m!775925 () Bool)

(assert (=> bs!23244 m!775925))

(assert (=> bs!23244 m!775925))

(declare-fun m!775927 () Bool)

(assert (=> bs!23244 m!775927))

(assert (=> b!831718 d!106339))

(assert (=> b!831718 d!106141))

(declare-fun d!106341 () Bool)

(declare-fun e!464078 () Bool)

(assert (=> d!106341 e!464078))

(declare-fun res!566219 () Bool)

(assert (=> d!106341 (=> res!566219 e!464078)))

(declare-fun lt!377585 () Bool)

(assert (=> d!106341 (= res!566219 (not lt!377585))))

(declare-fun lt!377583 () Bool)

(assert (=> d!106341 (= lt!377585 lt!377583)))

(declare-fun lt!377586 () Unit!28447)

(declare-fun e!464077 () Unit!28447)

(assert (=> d!106341 (= lt!377586 e!464077)))

(declare-fun c!90422 () Bool)

(assert (=> d!106341 (= c!90422 lt!377583)))

(assert (=> d!106341 (= lt!377583 (containsKey!400 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106341 (= (contains!4190 lt!377250 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377585)))

(declare-fun b!832158 () Bool)

(declare-fun lt!377584 () Unit!28447)

(assert (=> b!832158 (= e!464077 lt!377584)))

(assert (=> b!832158 (= lt!377584 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832158 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832159 () Bool)

(declare-fun Unit!28474 () Unit!28447)

(assert (=> b!832159 (= e!464077 Unit!28474)))

(declare-fun b!832160 () Bool)

(assert (=> b!832160 (= e!464078 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106341 c!90422) b!832158))

(assert (= (and d!106341 (not c!90422)) b!832159))

(assert (= (and d!106341 (not res!566219)) b!832160))

(declare-fun m!775929 () Bool)

(assert (=> d!106341 m!775929))

(declare-fun m!775931 () Bool)

(assert (=> b!832158 m!775931))

(declare-fun m!775933 () Bool)

(assert (=> b!832158 m!775933))

(assert (=> b!832158 m!775933))

(declare-fun m!775935 () Bool)

(assert (=> b!832158 m!775935))

(assert (=> b!832160 m!775933))

(assert (=> b!832160 m!775933))

(assert (=> b!832160 m!775935))

(assert (=> d!106109 d!106341))

(assert (=> d!106109 d!106123))

(declare-fun d!106343 () Bool)

(declare-fun lt!377587 () Bool)

(assert (=> d!106343 (= lt!377587 (select (content!386 (toList!4505 lt!377353)) lt!377161))))

(declare-fun e!464080 () Bool)

(assert (=> d!106343 (= lt!377587 e!464080)))

(declare-fun res!566220 () Bool)

(assert (=> d!106343 (=> (not res!566220) (not e!464080))))

(assert (=> d!106343 (= res!566220 ((_ is Cons!15945) (toList!4505 lt!377353)))))

(assert (=> d!106343 (= (contains!4191 (toList!4505 lt!377353) lt!377161) lt!377587)))

(declare-fun b!832161 () Bool)

(declare-fun e!464079 () Bool)

(assert (=> b!832161 (= e!464080 e!464079)))

(declare-fun res!566221 () Bool)

(assert (=> b!832161 (=> res!566221 e!464079)))

(assert (=> b!832161 (= res!566221 (= (h!17075 (toList!4505 lt!377353)) lt!377161))))

(declare-fun b!832162 () Bool)

(assert (=> b!832162 (= e!464079 (contains!4191 (t!22308 (toList!4505 lt!377353)) lt!377161))))

(assert (= (and d!106343 res!566220) b!832161))

(assert (= (and b!832161 (not res!566221)) b!832162))

(declare-fun m!775937 () Bool)

(assert (=> d!106343 m!775937))

(declare-fun m!775939 () Bool)

(assert (=> d!106343 m!775939))

(declare-fun m!775941 () Bool)

(assert (=> b!832162 m!775941))

(assert (=> b!831736 d!106343))

(declare-fun d!106345 () Bool)

(declare-fun e!464081 () Bool)

(assert (=> d!106345 e!464081))

(declare-fun res!566222 () Bool)

(assert (=> d!106345 (=> (not res!566222) (not e!464081))))

(declare-fun lt!377591 () ListLongMap!8979)

(assert (=> d!106345 (= res!566222 (contains!4190 lt!377591 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377590 () List!15949)

(assert (=> d!106345 (= lt!377591 (ListLongMap!8980 lt!377590))))

(declare-fun lt!377589 () Unit!28447)

(declare-fun lt!377588 () Unit!28447)

(assert (=> d!106345 (= lt!377589 lt!377588)))

(assert (=> d!106345 (= (getValueByKey!414 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106345 (= lt!377588 (lemmaContainsTupThenGetReturnValue!231 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106345 (= lt!377590 (insertStrictlySorted!270 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106345 (= (+!2013 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377591)))

(declare-fun b!832163 () Bool)

(declare-fun res!566223 () Bool)

(assert (=> b!832163 (=> (not res!566223) (not e!464081))))

(assert (=> b!832163 (= res!566223 (= (getValueByKey!414 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832164 () Bool)

(assert (=> b!832164 (= e!464081 (contains!4191 (toList!4505 lt!377591) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106345 res!566222) b!832163))

(assert (= (and b!832163 res!566223) b!832164))

(declare-fun m!775943 () Bool)

(assert (=> d!106345 m!775943))

(declare-fun m!775945 () Bool)

(assert (=> d!106345 m!775945))

(declare-fun m!775947 () Bool)

(assert (=> d!106345 m!775947))

(declare-fun m!775949 () Bool)

(assert (=> d!106345 m!775949))

(declare-fun m!775951 () Bool)

(assert (=> b!832163 m!775951))

(declare-fun m!775953 () Bool)

(assert (=> b!832164 m!775953))

(assert (=> bm!36361 d!106345))

(declare-fun d!106347 () Bool)

(declare-fun lt!377592 () Bool)

(assert (=> d!106347 (= lt!377592 (select (content!386 (toList!4505 lt!377357)) lt!377164))))

(declare-fun e!464083 () Bool)

(assert (=> d!106347 (= lt!377592 e!464083)))

(declare-fun res!566224 () Bool)

(assert (=> d!106347 (=> (not res!566224) (not e!464083))))

(assert (=> d!106347 (= res!566224 ((_ is Cons!15945) (toList!4505 lt!377357)))))

(assert (=> d!106347 (= (contains!4191 (toList!4505 lt!377357) lt!377164) lt!377592)))

(declare-fun b!832165 () Bool)

(declare-fun e!464082 () Bool)

(assert (=> b!832165 (= e!464083 e!464082)))

(declare-fun res!566225 () Bool)

(assert (=> b!832165 (=> res!566225 e!464082)))

(assert (=> b!832165 (= res!566225 (= (h!17075 (toList!4505 lt!377357)) lt!377164))))

(declare-fun b!832166 () Bool)

(assert (=> b!832166 (= e!464082 (contains!4191 (t!22308 (toList!4505 lt!377357)) lt!377164))))

(assert (= (and d!106347 res!566224) b!832165))

(assert (= (and b!832165 (not res!566225)) b!832166))

(declare-fun m!775955 () Bool)

(assert (=> d!106347 m!775955))

(declare-fun m!775957 () Bool)

(assert (=> d!106347 m!775957))

(declare-fun m!775959 () Bool)

(assert (=> b!832166 m!775959))

(assert (=> b!831738 d!106347))

(declare-fun d!106349 () Bool)

(declare-fun e!464084 () Bool)

(assert (=> d!106349 e!464084))

(declare-fun res!566226 () Bool)

(assert (=> d!106349 (=> (not res!566226) (not e!464084))))

(declare-fun lt!377596 () ListLongMap!8979)

(assert (=> d!106349 (= res!566226 (contains!4190 lt!377596 (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun lt!377595 () List!15949)

(assert (=> d!106349 (= lt!377596 (ListLongMap!8980 lt!377595))))

(declare-fun lt!377594 () Unit!28447)

(declare-fun lt!377593 () Unit!28447)

(assert (=> d!106349 (= lt!377594 lt!377593)))

(assert (=> d!106349 (= (getValueByKey!414 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(assert (=> d!106349 (= lt!377593 (lemmaContainsTupThenGetReturnValue!231 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(assert (=> d!106349 (= lt!377595 (insertStrictlySorted!270 (toList!4505 lt!377333) (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(assert (=> d!106349 (= (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)) lt!377596)))

(declare-fun b!832167 () Bool)

(declare-fun res!566227 () Bool)

(assert (=> b!832167 (=> (not res!566227) (not e!464084))))

(assert (=> b!832167 (= res!566227 (= (getValueByKey!414 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(declare-fun b!832168 () Bool)

(assert (=> b!832168 (= e!464084 (contains!4191 (toList!4505 lt!377596) (tuple2!10167 lt!377325 minValue!754)))))

(assert (= (and d!106349 res!566226) b!832167))

(assert (= (and b!832167 res!566227) b!832168))

(declare-fun m!775961 () Bool)

(assert (=> d!106349 m!775961))

(declare-fun m!775963 () Bool)

(assert (=> d!106349 m!775963))

(declare-fun m!775965 () Bool)

(assert (=> d!106349 m!775965))

(declare-fun m!775967 () Bool)

(assert (=> d!106349 m!775967))

(declare-fun m!775969 () Bool)

(assert (=> b!832167 m!775969))

(declare-fun m!775971 () Bool)

(assert (=> b!832168 m!775971))

(assert (=> b!831716 d!106349))

(declare-fun d!106351 () Bool)

(assert (=> d!106351 (= (apply!373 lt!377328 lt!377334) (get!11832 (getValueByKey!414 (toList!4505 lt!377328) lt!377334)))))

(declare-fun bs!23245 () Bool)

(assert (= bs!23245 d!106351))

(declare-fun m!775973 () Bool)

(assert (=> bs!23245 m!775973))

(assert (=> bs!23245 m!775973))

(declare-fun m!775975 () Bool)

(assert (=> bs!23245 m!775975))

(assert (=> b!831716 d!106351))

(declare-fun d!106353 () Bool)

(assert (=> d!106353 (contains!4190 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377332)))

(declare-fun lt!377597 () Unit!28447)

(assert (=> d!106353 (= lt!377597 (choose!1434 lt!377330 lt!377335 zeroValueAfter!34 lt!377332))))

(assert (=> d!106353 (contains!4190 lt!377330 lt!377332)))

(assert (=> d!106353 (= (addStillContains!324 lt!377330 lt!377335 zeroValueAfter!34 lt!377332) lt!377597)))

(declare-fun bs!23246 () Bool)

(assert (= bs!23246 d!106353))

(assert (=> bs!23246 m!775157))

(assert (=> bs!23246 m!775157))

(assert (=> bs!23246 m!775159))

(declare-fun m!775977 () Bool)

(assert (=> bs!23246 m!775977))

(declare-fun m!775979 () Bool)

(assert (=> bs!23246 m!775979))

(assert (=> b!831716 d!106353))

(declare-fun d!106355 () Bool)

(declare-fun e!464085 () Bool)

(assert (=> d!106355 e!464085))

(declare-fun res!566228 () Bool)

(assert (=> d!106355 (=> (not res!566228) (not e!464085))))

(declare-fun lt!377601 () ListLongMap!8979)

(assert (=> d!106355 (= res!566228 (contains!4190 lt!377601 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun lt!377600 () List!15949)

(assert (=> d!106355 (= lt!377601 (ListLongMap!8980 lt!377600))))

(declare-fun lt!377599 () Unit!28447)

(declare-fun lt!377598 () Unit!28447)

(assert (=> d!106355 (= lt!377599 lt!377598)))

(assert (=> d!106355 (= (getValueByKey!414 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(assert (=> d!106355 (= lt!377598 (lemmaContainsTupThenGetReturnValue!231 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(assert (=> d!106355 (= lt!377600 (insertStrictlySorted!270 (toList!4505 lt!377330) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(assert (=> d!106355 (= (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377601)))

(declare-fun b!832169 () Bool)

(declare-fun res!566229 () Bool)

(assert (=> b!832169 (=> (not res!566229) (not e!464085))))

(assert (=> b!832169 (= res!566229 (= (getValueByKey!414 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(declare-fun b!832170 () Bool)

(assert (=> b!832170 (= e!464085 (contains!4191 (toList!4505 lt!377601) (tuple2!10167 lt!377335 zeroValueAfter!34)))))

(assert (= (and d!106355 res!566228) b!832169))

(assert (= (and b!832169 res!566229) b!832170))

(declare-fun m!775981 () Bool)

(assert (=> d!106355 m!775981))

(declare-fun m!775983 () Bool)

(assert (=> d!106355 m!775983))

(declare-fun m!775985 () Bool)

(assert (=> d!106355 m!775985))

(declare-fun m!775987 () Bool)

(assert (=> d!106355 m!775987))

(declare-fun m!775989 () Bool)

(assert (=> b!832169 m!775989))

(declare-fun m!775991 () Bool)

(assert (=> b!832170 m!775991))

(assert (=> b!831716 d!106355))

(assert (=> b!831716 d!106107))

(declare-fun d!106357 () Bool)

(assert (=> d!106357 (= (apply!373 lt!377341 lt!377324) (get!11832 (getValueByKey!414 (toList!4505 lt!377341) lt!377324)))))

(declare-fun bs!23247 () Bool)

(assert (= bs!23247 d!106357))

(declare-fun m!775993 () Bool)

(assert (=> bs!23247 m!775993))

(assert (=> bs!23247 m!775993))

(declare-fun m!775995 () Bool)

(assert (=> bs!23247 m!775995))

(assert (=> b!831716 d!106357))

(declare-fun d!106359 () Bool)

(assert (=> d!106359 (= (apply!373 lt!377333 lt!377345) (get!11832 (getValueByKey!414 (toList!4505 lt!377333) lt!377345)))))

(declare-fun bs!23248 () Bool)

(assert (= bs!23248 d!106359))

(declare-fun m!775997 () Bool)

(assert (=> bs!23248 m!775997))

(assert (=> bs!23248 m!775997))

(declare-fun m!775999 () Bool)

(assert (=> bs!23248 m!775999))

(assert (=> b!831716 d!106359))

(declare-fun d!106361 () Bool)

(assert (=> d!106361 (= (apply!373 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377324) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377324)))))

(declare-fun bs!23249 () Bool)

(assert (= bs!23249 d!106361))

(declare-fun m!776001 () Bool)

(assert (=> bs!23249 m!776001))

(assert (=> bs!23249 m!776001))

(declare-fun m!776003 () Bool)

(assert (=> bs!23249 m!776003))

(assert (=> b!831716 d!106361))

(declare-fun d!106363 () Bool)

(declare-fun e!464086 () Bool)

(assert (=> d!106363 e!464086))

(declare-fun res!566230 () Bool)

(assert (=> d!106363 (=> (not res!566230) (not e!464086))))

(declare-fun lt!377605 () ListLongMap!8979)

(assert (=> d!106363 (= res!566230 (contains!4190 lt!377605 (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun lt!377604 () List!15949)

(assert (=> d!106363 (= lt!377605 (ListLongMap!8980 lt!377604))))

(declare-fun lt!377603 () Unit!28447)

(declare-fun lt!377602 () Unit!28447)

(assert (=> d!106363 (= lt!377603 lt!377602)))

(assert (=> d!106363 (= (getValueByKey!414 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(assert (=> d!106363 (= lt!377602 (lemmaContainsTupThenGetReturnValue!231 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(assert (=> d!106363 (= lt!377604 (insertStrictlySorted!270 (toList!4505 lt!377328) (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(assert (=> d!106363 (= (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)) lt!377605)))

(declare-fun b!832171 () Bool)

(declare-fun res!566231 () Bool)

(assert (=> b!832171 (=> (not res!566231) (not e!464086))))

(assert (=> b!832171 (= res!566231 (= (getValueByKey!414 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(declare-fun b!832172 () Bool)

(assert (=> b!832172 (= e!464086 (contains!4191 (toList!4505 lt!377605) (tuple2!10167 lt!377343 minValue!754)))))

(assert (= (and d!106363 res!566230) b!832171))

(assert (= (and b!832171 res!566231) b!832172))

(declare-fun m!776005 () Bool)

(assert (=> d!106363 m!776005))

(declare-fun m!776007 () Bool)

(assert (=> d!106363 m!776007))

(declare-fun m!776009 () Bool)

(assert (=> d!106363 m!776009))

(declare-fun m!776011 () Bool)

(assert (=> d!106363 m!776011))

(declare-fun m!776013 () Bool)

(assert (=> b!832171 m!776013))

(declare-fun m!776015 () Bool)

(assert (=> b!832172 m!776015))

(assert (=> b!831716 d!106363))

(declare-fun d!106365 () Bool)

(declare-fun e!464088 () Bool)

(assert (=> d!106365 e!464088))

(declare-fun res!566232 () Bool)

(assert (=> d!106365 (=> res!566232 e!464088)))

(declare-fun lt!377608 () Bool)

(assert (=> d!106365 (= res!566232 (not lt!377608))))

(declare-fun lt!377606 () Bool)

(assert (=> d!106365 (= lt!377608 lt!377606)))

(declare-fun lt!377609 () Unit!28447)

(declare-fun e!464087 () Unit!28447)

(assert (=> d!106365 (= lt!377609 e!464087)))

(declare-fun c!90423 () Bool)

(assert (=> d!106365 (= c!90423 lt!377606)))

(assert (=> d!106365 (= lt!377606 (containsKey!400 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(assert (=> d!106365 (= (contains!4190 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377332) lt!377608)))

(declare-fun b!832173 () Bool)

(declare-fun lt!377607 () Unit!28447)

(assert (=> b!832173 (= e!464087 lt!377607)))

(assert (=> b!832173 (= lt!377607 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(assert (=> b!832173 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(declare-fun b!832174 () Bool)

(declare-fun Unit!28475 () Unit!28447)

(assert (=> b!832174 (= e!464087 Unit!28475)))

(declare-fun b!832175 () Bool)

(assert (=> b!832175 (= e!464088 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332)))))

(assert (= (and d!106365 c!90423) b!832173))

(assert (= (and d!106365 (not c!90423)) b!832174))

(assert (= (and d!106365 (not res!566232)) b!832175))

(declare-fun m!776017 () Bool)

(assert (=> d!106365 m!776017))

(declare-fun m!776019 () Bool)

(assert (=> b!832173 m!776019))

(declare-fun m!776021 () Bool)

(assert (=> b!832173 m!776021))

(assert (=> b!832173 m!776021))

(declare-fun m!776023 () Bool)

(assert (=> b!832173 m!776023))

(assert (=> b!832175 m!776021))

(assert (=> b!832175 m!776021))

(assert (=> b!832175 m!776023))

(assert (=> b!831716 d!106365))

(declare-fun d!106367 () Bool)

(assert (=> d!106367 (= (apply!373 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)) lt!377345) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))) lt!377345)))))

(declare-fun bs!23250 () Bool)

(assert (= bs!23250 d!106367))

(declare-fun m!776025 () Bool)

(assert (=> bs!23250 m!776025))

(assert (=> bs!23250 m!776025))

(declare-fun m!776027 () Bool)

(assert (=> bs!23250 m!776027))

(assert (=> b!831716 d!106367))

(declare-fun d!106369 () Bool)

(assert (=> d!106369 (= (apply!373 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)) lt!377334) (apply!373 lt!377328 lt!377334))))

(declare-fun lt!377610 () Unit!28447)

(assert (=> d!106369 (= lt!377610 (choose!1435 lt!377328 lt!377343 minValue!754 lt!377334))))

(declare-fun e!464089 () Bool)

(assert (=> d!106369 e!464089))

(declare-fun res!566233 () Bool)

(assert (=> d!106369 (=> (not res!566233) (not e!464089))))

(assert (=> d!106369 (= res!566233 (contains!4190 lt!377328 lt!377334))))

(assert (=> d!106369 (= (addApplyDifferent!324 lt!377328 lt!377343 minValue!754 lt!377334) lt!377610)))

(declare-fun b!832176 () Bool)

(assert (=> b!832176 (= e!464089 (not (= lt!377334 lt!377343)))))

(assert (= (and d!106369 res!566233) b!832176))

(declare-fun m!776029 () Bool)

(assert (=> d!106369 m!776029))

(assert (=> d!106369 m!775175))

(assert (=> d!106369 m!775151))

(assert (=> d!106369 m!775151))

(assert (=> d!106369 m!775169))

(declare-fun m!776031 () Bool)

(assert (=> d!106369 m!776031))

(assert (=> b!831716 d!106369))

(declare-fun d!106371 () Bool)

(assert (=> d!106371 (= (apply!373 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377324) (apply!373 lt!377341 lt!377324))))

(declare-fun lt!377611 () Unit!28447)

(assert (=> d!106371 (= lt!377611 (choose!1435 lt!377341 lt!377337 zeroValueAfter!34 lt!377324))))

(declare-fun e!464090 () Bool)

(assert (=> d!106371 e!464090))

(declare-fun res!566234 () Bool)

(assert (=> d!106371 (=> (not res!566234) (not e!464090))))

(assert (=> d!106371 (= res!566234 (contains!4190 lt!377341 lt!377324))))

(assert (=> d!106371 (= (addApplyDifferent!324 lt!377341 lt!377337 zeroValueAfter!34 lt!377324) lt!377611)))

(declare-fun b!832177 () Bool)

(assert (=> b!832177 (= e!464090 (not (= lt!377324 lt!377337)))))

(assert (= (and d!106371 res!566234) b!832177))

(declare-fun m!776033 () Bool)

(assert (=> d!106371 m!776033))

(assert (=> d!106371 m!775167))

(assert (=> d!106371 m!775171))

(assert (=> d!106371 m!775171))

(assert (=> d!106371 m!775173))

(declare-fun m!776035 () Bool)

(assert (=> d!106371 m!776035))

(assert (=> b!831716 d!106371))

(declare-fun d!106373 () Bool)

(declare-fun e!464091 () Bool)

(assert (=> d!106373 e!464091))

(declare-fun res!566235 () Bool)

(assert (=> d!106373 (=> (not res!566235) (not e!464091))))

(declare-fun lt!377615 () ListLongMap!8979)

(assert (=> d!106373 (= res!566235 (contains!4190 lt!377615 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun lt!377614 () List!15949)

(assert (=> d!106373 (= lt!377615 (ListLongMap!8980 lt!377614))))

(declare-fun lt!377613 () Unit!28447)

(declare-fun lt!377612 () Unit!28447)

(assert (=> d!106373 (= lt!377613 lt!377612)))

(assert (=> d!106373 (= (getValueByKey!414 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(assert (=> d!106373 (= lt!377612 (lemmaContainsTupThenGetReturnValue!231 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(assert (=> d!106373 (= lt!377614 (insertStrictlySorted!270 (toList!4505 lt!377341) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(assert (=> d!106373 (= (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377615)))

(declare-fun b!832178 () Bool)

(declare-fun res!566236 () Bool)

(assert (=> b!832178 (=> (not res!566236) (not e!464091))))

(assert (=> b!832178 (= res!566236 (= (getValueByKey!414 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(declare-fun b!832179 () Bool)

(assert (=> b!832179 (= e!464091 (contains!4191 (toList!4505 lt!377615) (tuple2!10167 lt!377337 zeroValueAfter!34)))))

(assert (= (and d!106373 res!566235) b!832178))

(assert (= (and b!832178 res!566236) b!832179))

(declare-fun m!776037 () Bool)

(assert (=> d!106373 m!776037))

(declare-fun m!776039 () Bool)

(assert (=> d!106373 m!776039))

(declare-fun m!776041 () Bool)

(assert (=> d!106373 m!776041))

(declare-fun m!776043 () Bool)

(assert (=> d!106373 m!776043))

(declare-fun m!776045 () Bool)

(assert (=> b!832178 m!776045))

(declare-fun m!776047 () Bool)

(assert (=> b!832179 m!776047))

(assert (=> b!831716 d!106373))

(declare-fun d!106375 () Bool)

(assert (=> d!106375 (= (apply!373 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)) lt!377345) (apply!373 lt!377333 lt!377345))))

(declare-fun lt!377616 () Unit!28447)

(assert (=> d!106375 (= lt!377616 (choose!1435 lt!377333 lt!377325 minValue!754 lt!377345))))

(declare-fun e!464092 () Bool)

(assert (=> d!106375 e!464092))

(declare-fun res!566237 () Bool)

(assert (=> d!106375 (=> (not res!566237) (not e!464092))))

(assert (=> d!106375 (= res!566237 (contains!4190 lt!377333 lt!377345))))

(assert (=> d!106375 (= (addApplyDifferent!324 lt!377333 lt!377325 minValue!754 lt!377345) lt!377616)))

(declare-fun b!832180 () Bool)

(assert (=> b!832180 (= e!464092 (not (= lt!377345 lt!377325)))))

(assert (= (and d!106375 res!566237) b!832180))

(declare-fun m!776049 () Bool)

(assert (=> d!106375 m!776049))

(assert (=> d!106375 m!775163))

(assert (=> d!106375 m!775153))

(assert (=> d!106375 m!775153))

(assert (=> d!106375 m!775155))

(declare-fun m!776051 () Bool)

(assert (=> d!106375 m!776051))

(assert (=> b!831716 d!106375))

(declare-fun d!106377 () Bool)

(assert (=> d!106377 (= (apply!373 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)) lt!377334) (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))) lt!377334)))))

(declare-fun bs!23251 () Bool)

(assert (= bs!23251 d!106377))

(declare-fun m!776053 () Bool)

(assert (=> bs!23251 m!776053))

(assert (=> bs!23251 m!776053))

(declare-fun m!776055 () Bool)

(assert (=> bs!23251 m!776055))

(assert (=> b!831716 d!106377))

(declare-fun d!106379 () Bool)

(assert (=> d!106379 (= (apply!373 lt!377318 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11832 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23252 () Bool)

(assert (= bs!23252 d!106379))

(assert (=> bs!23252 m!775891))

(assert (=> bs!23252 m!775891))

(declare-fun m!776057 () Bool)

(assert (=> bs!23252 m!776057))

(assert (=> b!831701 d!106379))

(declare-fun d!106381 () Bool)

(declare-fun e!464094 () Bool)

(assert (=> d!106381 e!464094))

(declare-fun res!566238 () Bool)

(assert (=> d!106381 (=> res!566238 e!464094)))

(declare-fun lt!377619 () Bool)

(assert (=> d!106381 (= res!566238 (not lt!377619))))

(declare-fun lt!377617 () Bool)

(assert (=> d!106381 (= lt!377619 lt!377617)))

(declare-fun lt!377620 () Unit!28447)

(declare-fun e!464093 () Unit!28447)

(assert (=> d!106381 (= lt!377620 e!464093)))

(declare-fun c!90424 () Bool)

(assert (=> d!106381 (= c!90424 lt!377617)))

(assert (=> d!106381 (= lt!377617 (containsKey!400 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106381 (= (contains!4190 lt!377340 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377619)))

(declare-fun b!832181 () Bool)

(declare-fun lt!377618 () Unit!28447)

(assert (=> b!832181 (= e!464093 lt!377618)))

(assert (=> b!832181 (= lt!377618 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832181 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832182 () Bool)

(declare-fun Unit!28476 () Unit!28447)

(assert (=> b!832182 (= e!464093 Unit!28476)))

(declare-fun b!832183 () Bool)

(assert (=> b!832183 (= e!464094 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106381 c!90424) b!832181))

(assert (= (and d!106381 (not c!90424)) b!832182))

(assert (= (and d!106381 (not res!566238)) b!832183))

(assert (=> d!106381 m!775051))

(declare-fun m!776059 () Bool)

(assert (=> d!106381 m!776059))

(assert (=> b!832181 m!775051))

(declare-fun m!776061 () Bool)

(assert (=> b!832181 m!776061))

(assert (=> b!832181 m!775051))

(assert (=> b!832181 m!775925))

(assert (=> b!832181 m!775925))

(declare-fun m!776063 () Bool)

(assert (=> b!832181 m!776063))

(assert (=> b!832183 m!775051))

(assert (=> b!832183 m!775925))

(assert (=> b!832183 m!775925))

(assert (=> b!832183 m!776063))

(assert (=> b!831732 d!106381))

(declare-fun b!832184 () Bool)

(declare-fun e!464095 () Bool)

(assert (=> b!832184 (= e!464095 tp_is_empty!15211)))

(declare-fun mapNonEmpty!24484 () Bool)

(declare-fun mapRes!24484 () Bool)

(declare-fun tp!47311 () Bool)

(assert (=> mapNonEmpty!24484 (= mapRes!24484 (and tp!47311 e!464095))))

(declare-fun mapRest!24484 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapValue!24484 () ValueCell!7190)

(declare-fun mapKey!24484 () (_ BitVec 32))

(assert (=> mapNonEmpty!24484 (= mapRest!24483 (store mapRest!24484 mapKey!24484 mapValue!24484))))

(declare-fun condMapEmpty!24484 () Bool)

(declare-fun mapDefault!24484 () ValueCell!7190)

(assert (=> mapNonEmpty!24483 (= condMapEmpty!24484 (= mapRest!24483 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24484)))))

(declare-fun e!464096 () Bool)

(assert (=> mapNonEmpty!24483 (= tp!47310 (and e!464096 mapRes!24484))))

(declare-fun mapIsEmpty!24484 () Bool)

(assert (=> mapIsEmpty!24484 mapRes!24484))

(declare-fun b!832185 () Bool)

(assert (=> b!832185 (= e!464096 tp_is_empty!15211)))

(assert (= (and mapNonEmpty!24483 condMapEmpty!24484) mapIsEmpty!24484))

(assert (= (and mapNonEmpty!24483 (not condMapEmpty!24484)) mapNonEmpty!24484))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7190) mapValue!24484)) b!832184))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7190) mapDefault!24484)) b!832185))

(declare-fun m!776065 () Bool)

(assert (=> mapNonEmpty!24484 m!776065))

(declare-fun b_lambda!11417 () Bool)

(assert (= b_lambda!11409 (or (and start!71560 b_free!13501) b_lambda!11417)))

(declare-fun b_lambda!11419 () Bool)

(assert (= b_lambda!11413 (or (and start!71560 b_free!13501) b_lambda!11419)))

(declare-fun b_lambda!11421 () Bool)

(assert (= b_lambda!11411 (or (and start!71560 b_free!13501) b_lambda!11421)))

(declare-fun b_lambda!11423 () Bool)

(assert (= b_lambda!11415 (or (and start!71560 b_free!13501) b_lambda!11423)))

(check-sat (not b!832102) (not b!832140) (not d!106373) (not b_lambda!11407) (not bm!36400) (not bm!36393) (not b!831888) (not d!106367) (not d!106207) (not b!831954) (not bm!36397) (not b!831917) (not b!832038) (not d!106355) (not d!106375) (not d!106361) (not b!832141) (not d!106189) (not d!106333) (not b!832146) (not d!106173) (not b!831856) (not b!832181) (not b!832179) (not b!832166) (not b!832070) (not b!832043) (not d!106171) (not d!106151) (not b!832069) (not b!831994) (not d!106329) (not mapNonEmpty!24484) (not d!106379) (not b!831980) (not d!106339) (not b_lambda!11417) (not d!106283) (not b!831962) (not b!831798) (not b!831959) (not d!106241) (not d!106193) (not b!831800) (not b!832099) (not b!831941) (not b!831880) (not d!106195) (not b!832128) (not d!106303) (not b!832095) (not b!832138) (not b!832153) (not b!831961) (not d!106371) (not b_lambda!11399) (not d!106321) (not b!831909) (not bm!36381) (not b!831983) (not d!106143) (not b!831863) (not b!832085) (not d!106377) (not b!831893) (not b!831780) (not b!832125) (not d!106161) (not b!832048) (not b!832005) (not b!832117) (not b!832067) (not b!832149) (not d!106187) (not b!832109) (not b!831952) (not b!832012) (not bm!36384) (not d!106163) (not b!832126) (not d!106157) (not b!831876) (not b!831892) (not d!106369) (not d!106301) (not b!831854) (not d!106231) (not b!832169) (not b!832151) (not b!831920) (not d!106229) (not b!832162) (not b!832101) (not b!832056) (not b!831949) (not d!106243) (not b!831816) (not d!106259) (not b!832136) (not d!106305) (not b!831881) (not b!832031) (not b!832047) (not d!106137) (not b!831982) (not b!831801) (not b!831886) (not d!106359) (not b!832092) (not bm!36396) (not b!831822) (not b!831931) (not b!831951) (not b!831922) (not d!106357) (not b_lambda!11405) (not bm!36374) (not b!832033) (not d!106323) (not b!832027) (not b_lambda!11419) (not d!106279) (not b!831866) (not b!831895) tp_is_empty!15211 (not b!832152) (not bm!36387) (not b!832127) (not b!831921) (not b!831867) (not d!106265) (not b!831991) (not b!831803) (not d!106249) (not b!832144) (not b!831787) (not b!831891) (not b!832059) (not d!106285) (not b!831844) (not b!832167) (not d!106183) (not d!106271) (not d!106347) (not d!106175) (not b!832083) (not d!106159) (not b!831823) (not b!831862) (not d!106177) (not b!832111) (not bm!36377) (not b!831911) (not b!832171) (not b!832096) (not b!831781) (not d!106179) (not b!831779) (not b!832145) (not b!831882) (not b!832163) (not d!106155) (not b!831889) (not b_lambda!11401) (not d!106341) (not d!106239) (not d!106167) (not b!832090) (not d!106345) (not b!831874) (not b!831970) (not d!106363) (not d!106185) (not b_lambda!11423) (not b!831973) (not b_lambda!11403) (not b!832107) (not b!831896) (not d!106191) (not d!106291) (not b!831869) (not b!832065) (not d!106235) (not b!831960) (not d!106325) (not d!106197) (not b!832100) (not d!106381) (not d!106365) (not b!831981) (not b!832093) (not d!106169) (not b!832001) (not bm!36378) (not b!832118) (not d!106281) (not d!106205) (not d!106199) (not b!831975) (not b!831887) (not b!831919) (not d!106263) (not b!832168) (not b!831940) (not b!832036) (not b!831802) (not d!106343) (not b!831912) (not b!831805) (not b!832143) b_and!22557 (not b!831884) (not d!106217) (not b!832157) (not b!831972) (not d!106293) (not b!832158) (not b!832164) (not b!831939) (not d!106269) (not d!106317) (not d!106203) (not b!831992) (not b!831908) (not b!831938) (not d!106351) (not d!106227) (not b!832040) (not d!106211) (not b!831933) (not b!832170) (not b!831978) (not d!106201) (not d!106213) (not b!832088) (not b!832183) (not d!106209) (not d!106327) (not b!832068) (not b!831930) (not b!831997) (not b!831873) (not b!831778) (not b!831865) (not b!832178) (not b!832120) (not b!831845) (not b!831877) (not b_next!13501) (not d!106181) (not b!832173) (not b!832046) (not d!106221) (not b!831885) (not d!106149) (not b_lambda!11421) (not b!831868) (not b!832078) (not d!106337) (not d!106277) (not b!832081) (not b!832104) (not b!832114) (not d!106247) (not d!106309) (not b_lambda!11397) (not b!832057) (not d!106297) (not d!106165) (not b!832062) (not b!832175) (not b!832156) (not d!106353) (not d!106219) (not d!106225) (not b!832172) (not b!831950) (not d!106251) (not d!106145) (not d!106349) (not bm!36390) (not b!831957) (not d!106273) (not d!106315) (not d!106311) (not bm!36401) (not b!832045) (not b!831871) (not d!106139) (not b!831853) (not b!831914) (not b!832060) (not b!832160) (not b!831936) (not d!106237) (not b!831786) (not d!106287) (not b!832123))
(check-sat b_and!22557 (not b_next!13501))
(get-model)

(declare-fun d!106383 () Bool)

(assert (=> d!106383 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377623 () Unit!28447)

(declare-fun choose!1436 (List!15949 (_ BitVec 64)) Unit!28447)

(assert (=> d!106383 (= lt!377623 (choose!1436 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464099 () Bool)

(assert (=> d!106383 e!464099))

(declare-fun res!566241 () Bool)

(assert (=> d!106383 (=> (not res!566241) (not e!464099))))

(assert (=> d!106383 (= res!566241 (isStrictlySorted!438 (toList!4505 lt!377318)))))

(assert (=> d!106383 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377623)))

(declare-fun b!832188 () Bool)

(assert (=> b!832188 (= e!464099 (containsKey!400 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106383 res!566241) b!832188))

(assert (=> d!106383 m!775891))

(assert (=> d!106383 m!775891))

(assert (=> d!106383 m!775893))

(declare-fun m!776067 () Bool)

(assert (=> d!106383 m!776067))

(declare-fun m!776069 () Bool)

(assert (=> d!106383 m!776069))

(assert (=> b!832188 m!775887))

(assert (=> b!832141 d!106383))

(declare-fun d!106385 () Bool)

(declare-fun isEmpty!664 (Option!420) Bool)

(assert (=> d!106385 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23253 () Bool)

(assert (= bs!23253 d!106385))

(assert (=> bs!23253 m!775891))

(declare-fun m!776071 () Bool)

(assert (=> bs!23253 m!776071))

(assert (=> b!832141 d!106385))

(declare-fun b!832191 () Bool)

(declare-fun e!464101 () Option!420)

(assert (=> b!832191 (= e!464101 (getValueByKey!414 (t!22308 (toList!4505 lt!377318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832192 () Bool)

(assert (=> b!832192 (= e!464101 None!418)))

(declare-fun d!106387 () Bool)

(declare-fun c!90425 () Bool)

(assert (=> d!106387 (= c!90425 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464100 () Option!420)

(assert (=> d!106387 (= (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000) e!464100)))

(declare-fun b!832190 () Bool)

(assert (=> b!832190 (= e!464100 e!464101)))

(declare-fun c!90426 () Bool)

(assert (=> b!832190 (= c!90426 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832189 () Bool)

(assert (=> b!832189 (= e!464100 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377318)))))))

(assert (= (and d!106387 c!90425) b!832189))

(assert (= (and d!106387 (not c!90425)) b!832190))

(assert (= (and b!832190 c!90426) b!832191))

(assert (= (and b!832190 (not c!90426)) b!832192))

(declare-fun m!776073 () Bool)

(assert (=> b!832191 m!776073))

(assert (=> b!832141 d!106387))

(declare-fun b!832195 () Bool)

(declare-fun e!464103 () Option!420)

(assert (=> b!832195 (= e!464103 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377357))) (_1!5094 lt!377164)))))

(declare-fun b!832196 () Bool)

(assert (=> b!832196 (= e!464103 None!418)))

(declare-fun d!106389 () Bool)

(declare-fun c!90427 () Bool)

(assert (=> d!106389 (= c!90427 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377357))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377357)))) (_1!5094 lt!377164))))))

(declare-fun e!464102 () Option!420)

(assert (=> d!106389 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377357)) (_1!5094 lt!377164)) e!464102)))

(declare-fun b!832194 () Bool)

(assert (=> b!832194 (= e!464102 e!464103)))

(declare-fun c!90428 () Bool)

(assert (=> b!832194 (= c!90428 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377357))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377357)))) (_1!5094 lt!377164)))))))

(declare-fun b!832193 () Bool)

(assert (=> b!832193 (= e!464102 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377357))))))))

(assert (= (and d!106389 c!90427) b!832193))

(assert (= (and d!106389 (not c!90427)) b!832194))

(assert (= (and b!832194 c!90428) b!832195))

(assert (= (and b!832194 (not c!90428)) b!832196))

(declare-fun m!776075 () Bool)

(assert (=> b!832195 m!776075))

(assert (=> b!832081 d!106389))

(declare-fun e!464105 () Option!420)

(declare-fun b!832199 () Bool)

(assert (=> b!832199 (= e!464105 (getValueByKey!414 (t!22308 (toList!4505 lt!377591)) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832200 () Bool)

(assert (=> b!832200 (= e!464105 None!418)))

(declare-fun d!106391 () Bool)

(declare-fun c!90429 () Bool)

(assert (=> d!106391 (= c!90429 (and ((_ is Cons!15945) (toList!4505 lt!377591)) (= (_1!5094 (h!17075 (toList!4505 lt!377591))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464104 () Option!420)

(assert (=> d!106391 (= (getValueByKey!414 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464104)))

(declare-fun b!832198 () Bool)

(assert (=> b!832198 (= e!464104 e!464105)))

(declare-fun c!90430 () Bool)

(assert (=> b!832198 (= c!90430 (and ((_ is Cons!15945) (toList!4505 lt!377591)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377591))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832197 () Bool)

(assert (=> b!832197 (= e!464104 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377591)))))))

(assert (= (and d!106391 c!90429) b!832197))

(assert (= (and d!106391 (not c!90429)) b!832198))

(assert (= (and b!832198 c!90430) b!832199))

(assert (= (and b!832198 (not c!90430)) b!832200))

(declare-fun m!776077 () Bool)

(assert (=> b!832199 m!776077))

(assert (=> b!832163 d!106391))

(declare-fun d!106393 () Bool)

(declare-fun e!464107 () Bool)

(assert (=> d!106393 e!464107))

(declare-fun res!566242 () Bool)

(assert (=> d!106393 (=> res!566242 e!464107)))

(declare-fun lt!377626 () Bool)

(assert (=> d!106393 (= res!566242 (not lt!377626))))

(declare-fun lt!377624 () Bool)

(assert (=> d!106393 (= lt!377626 lt!377624)))

(declare-fun lt!377627 () Unit!28447)

(declare-fun e!464106 () Unit!28447)

(assert (=> d!106393 (= lt!377627 e!464106)))

(declare-fun c!90431 () Bool)

(assert (=> d!106393 (= c!90431 lt!377624)))

(assert (=> d!106393 (= lt!377624 (containsKey!400 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106393 (= (contains!4190 lt!377490 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377626)))

(declare-fun b!832201 () Bool)

(declare-fun lt!377625 () Unit!28447)

(assert (=> b!832201 (= e!464106 lt!377625)))

(assert (=> b!832201 (= lt!377625 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832201 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832202 () Bool)

(declare-fun Unit!28477 () Unit!28447)

(assert (=> b!832202 (= e!464106 Unit!28477)))

(declare-fun b!832203 () Bool)

(assert (=> b!832203 (= e!464107 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106393 c!90431) b!832201))

(assert (= (and d!106393 (not c!90431)) b!832202))

(assert (= (and d!106393 (not res!566242)) b!832203))

(declare-fun m!776079 () Bool)

(assert (=> d!106393 m!776079))

(declare-fun m!776081 () Bool)

(assert (=> b!832201 m!776081))

(assert (=> b!832201 m!775609))

(assert (=> b!832201 m!775609))

(declare-fun m!776083 () Bool)

(assert (=> b!832201 m!776083))

(assert (=> b!832203 m!775609))

(assert (=> b!832203 m!775609))

(assert (=> b!832203 m!776083))

(assert (=> d!106229 d!106393))

(declare-fun e!464109 () Option!420)

(declare-fun b!832206 () Bool)

(assert (=> b!832206 (= e!464109 (getValueByKey!414 (t!22308 lt!377489) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832207 () Bool)

(assert (=> b!832207 (= e!464109 None!418)))

(declare-fun d!106395 () Bool)

(declare-fun c!90432 () Bool)

(assert (=> d!106395 (= c!90432 (and ((_ is Cons!15945) lt!377489) (= (_1!5094 (h!17075 lt!377489)) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464108 () Option!420)

(assert (=> d!106395 (= (getValueByKey!414 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464108)))

(declare-fun b!832205 () Bool)

(assert (=> b!832205 (= e!464108 e!464109)))

(declare-fun c!90433 () Bool)

(assert (=> b!832205 (= c!90433 (and ((_ is Cons!15945) lt!377489) (not (= (_1!5094 (h!17075 lt!377489)) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832204 () Bool)

(assert (=> b!832204 (= e!464108 (Some!419 (_2!5094 (h!17075 lt!377489))))))

(assert (= (and d!106395 c!90432) b!832204))

(assert (= (and d!106395 (not c!90432)) b!832205))

(assert (= (and b!832205 c!90433) b!832206))

(assert (= (and b!832205 (not c!90433)) b!832207))

(declare-fun m!776085 () Bool)

(assert (=> b!832206 m!776085))

(assert (=> d!106229 d!106395))

(declare-fun d!106397 () Bool)

(assert (=> d!106397 (= (getValueByKey!414 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377628 () Unit!28447)

(assert (=> d!106397 (= lt!377628 (choose!1433 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464110 () Bool)

(assert (=> d!106397 e!464110))

(declare-fun res!566243 () Bool)

(assert (=> d!106397 (=> (not res!566243) (not e!464110))))

(assert (=> d!106397 (= res!566243 (isStrictlySorted!438 lt!377489))))

(assert (=> d!106397 (= (lemmaContainsTupThenGetReturnValue!231 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377628)))

(declare-fun b!832208 () Bool)

(declare-fun res!566244 () Bool)

(assert (=> b!832208 (=> (not res!566244) (not e!464110))))

(assert (=> b!832208 (= res!566244 (containsKey!400 lt!377489 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832209 () Bool)

(assert (=> b!832209 (= e!464110 (contains!4191 lt!377489 (tuple2!10167 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106397 res!566243) b!832208))

(assert (= (and b!832208 res!566244) b!832209))

(assert (=> d!106397 m!775603))

(declare-fun m!776087 () Bool)

(assert (=> d!106397 m!776087))

(declare-fun m!776089 () Bool)

(assert (=> d!106397 m!776089))

(declare-fun m!776091 () Bool)

(assert (=> b!832208 m!776091))

(declare-fun m!776093 () Bool)

(assert (=> b!832209 m!776093))

(assert (=> d!106229 d!106397))

(declare-fun e!464111 () Bool)

(declare-fun b!832210 () Bool)

(declare-fun lt!377629 () List!15949)

(assert (=> b!832210 (= e!464111 (contains!4191 lt!377629 (tuple2!10167 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832211 () Bool)

(declare-fun res!566246 () Bool)

(assert (=> b!832211 (=> (not res!566246) (not e!464111))))

(assert (=> b!832211 (= res!566246 (containsKey!400 lt!377629 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832212 () Bool)

(declare-fun e!464113 () List!15949)

(declare-fun call!36405 () List!15949)

(assert (=> b!832212 (= e!464113 call!36405)))

(declare-fun bm!36402 () Bool)

(declare-fun e!464115 () List!15949)

(declare-fun c!90434 () Bool)

(declare-fun call!36407 () List!15949)

(assert (=> bm!36402 (= call!36407 ($colon$colon!536 e!464115 (ite c!90434 (h!17075 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (tuple2!10167 (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90435 () Bool)

(assert (=> bm!36402 (= c!90435 c!90434)))

(declare-fun b!832214 () Bool)

(declare-fun e!464114 () List!15949)

(assert (=> b!832214 (= e!464114 call!36407)))

(declare-fun bm!36403 () Bool)

(declare-fun call!36406 () List!15949)

(assert (=> bm!36403 (= call!36406 call!36407)))

(declare-fun b!832215 () Bool)

(declare-fun e!464112 () List!15949)

(assert (=> b!832215 (= e!464112 call!36406)))

(declare-fun b!832216 () Bool)

(declare-fun c!90437 () Bool)

(declare-fun c!90436 () Bool)

(assert (=> b!832216 (= e!464115 (ite c!90437 (t!22308 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (ite c!90436 (Cons!15945 (h!17075 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (t!22308 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))))) Nil!15946)))))

(declare-fun b!832217 () Bool)

(assert (=> b!832217 (= e!464113 call!36405)))

(declare-fun bm!36404 () Bool)

(assert (=> bm!36404 (= call!36405 call!36406)))

(declare-fun b!832218 () Bool)

(assert (=> b!832218 (= e!464114 e!464112)))

(assert (=> b!832218 (= c!90437 (and ((_ is Cons!15945) (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (= (_1!5094 (h!17075 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832219 () Bool)

(assert (=> b!832219 (= e!464115 (insertStrictlySorted!270 (t!22308 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832213 () Bool)

(assert (=> b!832213 (= c!90436 (and ((_ is Cons!15945) (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (bvsgt (_1!5094 (h!17075 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!832213 (= e!464112 e!464113)))

(declare-fun d!106399 () Bool)

(assert (=> d!106399 e!464111))

(declare-fun res!566245 () Bool)

(assert (=> d!106399 (=> (not res!566245) (not e!464111))))

(assert (=> d!106399 (= res!566245 (isStrictlySorted!438 lt!377629))))

(assert (=> d!106399 (= lt!377629 e!464114)))

(assert (=> d!106399 (= c!90434 (and ((_ is Cons!15945) (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352)))) (bvslt (_1!5094 (h!17075 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106399 (isStrictlySorted!438 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))))))

(assert (=> d!106399 (= (insertStrictlySorted!270 (toList!4505 (ite c!90286 call!36356 (ite c!90287 call!36354 call!36352))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377629)))

(assert (= (and d!106399 c!90434) b!832214))

(assert (= (and d!106399 (not c!90434)) b!832218))

(assert (= (and b!832218 c!90437) b!832215))

(assert (= (and b!832218 (not c!90437)) b!832213))

(assert (= (and b!832213 c!90436) b!832212))

(assert (= (and b!832213 (not c!90436)) b!832217))

(assert (= (or b!832212 b!832217) bm!36404))

(assert (= (or b!832215 bm!36404) bm!36403))

(assert (= (or b!832214 bm!36403) bm!36402))

(assert (= (and bm!36402 c!90435) b!832219))

(assert (= (and bm!36402 (not c!90435)) b!832216))

(assert (= (and d!106399 res!566245) b!832211))

(assert (= (and b!832211 res!566246) b!832210))

(declare-fun m!776095 () Bool)

(assert (=> b!832210 m!776095))

(declare-fun m!776097 () Bool)

(assert (=> d!106399 m!776097))

(declare-fun m!776099 () Bool)

(assert (=> d!106399 m!776099))

(declare-fun m!776101 () Bool)

(assert (=> b!832211 m!776101))

(declare-fun m!776103 () Bool)

(assert (=> bm!36402 m!776103))

(declare-fun m!776105 () Bool)

(assert (=> b!832219 m!776105))

(assert (=> d!106229 d!106399))

(declare-fun d!106401 () Bool)

(assert (=> d!106401 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377630 () Unit!28447)

(assert (=> d!106401 (= lt!377630 (choose!1436 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464116 () Bool)

(assert (=> d!106401 e!464116))

(declare-fun res!566247 () Bool)

(assert (=> d!106401 (=> (not res!566247) (not e!464116))))

(assert (=> d!106401 (= res!566247 (isStrictlySorted!438 (toList!4505 lt!377250)))))

(assert (=> d!106401 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377630)))

(declare-fun b!832220 () Bool)

(assert (=> b!832220 (= e!464116 (containsKey!400 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106401 res!566247) b!832220))

(assert (=> d!106401 m!775051))

(assert (=> d!106401 m!775529))

(assert (=> d!106401 m!775529))

(assert (=> d!106401 m!775903))

(assert (=> d!106401 m!775051))

(declare-fun m!776107 () Bool)

(assert (=> d!106401 m!776107))

(declare-fun m!776109 () Bool)

(assert (=> d!106401 m!776109))

(assert (=> b!832220 m!775051))

(assert (=> b!832220 m!775899))

(assert (=> b!832149 d!106401))

(declare-fun d!106403 () Bool)

(assert (=> d!106403 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23254 () Bool)

(assert (= bs!23254 d!106403))

(assert (=> bs!23254 m!775529))

(declare-fun m!776111 () Bool)

(assert (=> bs!23254 m!776111))

(assert (=> b!832149 d!106403))

(declare-fun b!832223 () Bool)

(declare-fun e!464118 () Option!420)

(assert (=> b!832223 (= e!464118 (getValueByKey!414 (t!22308 (toList!4505 lt!377250)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832224 () Bool)

(assert (=> b!832224 (= e!464118 None!418)))

(declare-fun d!106405 () Bool)

(declare-fun c!90438 () Bool)

(assert (=> d!106405 (= c!90438 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464117 () Option!420)

(assert (=> d!106405 (= (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464117)))

(declare-fun b!832222 () Bool)

(assert (=> b!832222 (= e!464117 e!464118)))

(declare-fun c!90439 () Bool)

(assert (=> b!832222 (= c!90439 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377250))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832221 () Bool)

(assert (=> b!832221 (= e!464117 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377250)))))))

(assert (= (and d!106405 c!90438) b!832221))

(assert (= (and d!106405 (not c!90438)) b!832222))

(assert (= (and b!832222 c!90439) b!832223))

(assert (= (and b!832222 (not c!90439)) b!832224))

(assert (=> b!832223 m!775051))

(declare-fun m!776113 () Bool)

(assert (=> b!832223 m!776113))

(assert (=> b!832149 d!106405))

(declare-fun d!106407 () Bool)

(declare-fun lt!377631 () Bool)

(assert (=> d!106407 (= lt!377631 (select (content!386 (toList!4505 lt!377447)) (tuple2!10167 lt!377313 zeroValueBefore!34)))))

(declare-fun e!464120 () Bool)

(assert (=> d!106407 (= lt!377631 e!464120)))

(declare-fun res!566248 () Bool)

(assert (=> d!106407 (=> (not res!566248) (not e!464120))))

(assert (=> d!106407 (= res!566248 ((_ is Cons!15945) (toList!4505 lt!377447)))))

(assert (=> d!106407 (= (contains!4191 (toList!4505 lt!377447) (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377631)))

(declare-fun b!832225 () Bool)

(declare-fun e!464119 () Bool)

(assert (=> b!832225 (= e!464120 e!464119)))

(declare-fun res!566249 () Bool)

(assert (=> b!832225 (=> res!566249 e!464119)))

(assert (=> b!832225 (= res!566249 (= (h!17075 (toList!4505 lt!377447)) (tuple2!10167 lt!377313 zeroValueBefore!34)))))

(declare-fun b!832226 () Bool)

(assert (=> b!832226 (= e!464119 (contains!4191 (t!22308 (toList!4505 lt!377447)) (tuple2!10167 lt!377313 zeroValueBefore!34)))))

(assert (= (and d!106407 res!566248) b!832225))

(assert (= (and b!832225 (not res!566249)) b!832226))

(declare-fun m!776115 () Bool)

(assert (=> d!106407 m!776115))

(declare-fun m!776117 () Bool)

(assert (=> d!106407 m!776117))

(declare-fun m!776119 () Bool)

(assert (=> b!832226 m!776119))

(assert (=> b!831888 d!106407))

(declare-fun b!832227 () Bool)

(declare-fun e!464121 () Bool)

(declare-fun lt!377632 () List!15949)

(assert (=> b!832227 (= e!464121 (contains!4191 lt!377632 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!832228 () Bool)

(declare-fun res!566251 () Bool)

(assert (=> b!832228 (=> (not res!566251) (not e!464121))))

(assert (=> b!832228 (= res!566251 (containsKey!400 lt!377632 (_1!5094 lt!377164)))))

(declare-fun b!832229 () Bool)

(declare-fun e!464123 () List!15949)

(declare-fun call!36408 () List!15949)

(assert (=> b!832229 (= e!464123 call!36408)))

(declare-fun call!36410 () List!15949)

(declare-fun bm!36405 () Bool)

(declare-fun e!464125 () List!15949)

(declare-fun c!90440 () Bool)

(assert (=> bm!36405 (= call!36410 ($colon$colon!536 e!464125 (ite c!90440 (h!17075 (t!22308 (toList!4505 lt!377158))) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))))))

(declare-fun c!90441 () Bool)

(assert (=> bm!36405 (= c!90441 c!90440)))

(declare-fun b!832231 () Bool)

(declare-fun e!464124 () List!15949)

(assert (=> b!832231 (= e!464124 call!36410)))

(declare-fun bm!36406 () Bool)

(declare-fun call!36409 () List!15949)

(assert (=> bm!36406 (= call!36409 call!36410)))

(declare-fun b!832232 () Bool)

(declare-fun e!464122 () List!15949)

(assert (=> b!832232 (= e!464122 call!36409)))

(declare-fun b!832233 () Bool)

(declare-fun c!90443 () Bool)

(declare-fun c!90442 () Bool)

(assert (=> b!832233 (= e!464125 (ite c!90443 (t!22308 (t!22308 (toList!4505 lt!377158))) (ite c!90442 (Cons!15945 (h!17075 (t!22308 (toList!4505 lt!377158))) (t!22308 (t!22308 (toList!4505 lt!377158)))) Nil!15946)))))

(declare-fun b!832234 () Bool)

(assert (=> b!832234 (= e!464123 call!36408)))

(declare-fun bm!36407 () Bool)

(assert (=> bm!36407 (= call!36408 call!36409)))

(declare-fun b!832235 () Bool)

(assert (=> b!832235 (= e!464124 e!464122)))

(assert (=> b!832235 (= c!90443 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377164))))))

(declare-fun b!832236 () Bool)

(assert (=> b!832236 (= e!464125 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 lt!377158))) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun b!832230 () Bool)

(assert (=> b!832230 (= c!90442 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377164))))))

(assert (=> b!832230 (= e!464122 e!464123)))

(declare-fun d!106409 () Bool)

(assert (=> d!106409 e!464121))

(declare-fun res!566250 () Bool)

(assert (=> d!106409 (=> (not res!566250) (not e!464121))))

(assert (=> d!106409 (= res!566250 (isStrictlySorted!438 lt!377632))))

(assert (=> d!106409 (= lt!377632 e!464124)))

(assert (=> d!106409 (= c!90440 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377164))))))

(assert (=> d!106409 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377158)))))

(assert (=> d!106409 (= (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377158)) (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377632)))

(assert (= (and d!106409 c!90440) b!832231))

(assert (= (and d!106409 (not c!90440)) b!832235))

(assert (= (and b!832235 c!90443) b!832232))

(assert (= (and b!832235 (not c!90443)) b!832230))

(assert (= (and b!832230 c!90442) b!832229))

(assert (= (and b!832230 (not c!90442)) b!832234))

(assert (= (or b!832229 b!832234) bm!36407))

(assert (= (or b!832232 bm!36407) bm!36406))

(assert (= (or b!832231 bm!36406) bm!36405))

(assert (= (and bm!36405 c!90441) b!832236))

(assert (= (and bm!36405 (not c!90441)) b!832233))

(assert (= (and d!106409 res!566250) b!832228))

(assert (= (and b!832228 res!566251) b!832227))

(declare-fun m!776121 () Bool)

(assert (=> b!832227 m!776121))

(declare-fun m!776123 () Bool)

(assert (=> d!106409 m!776123))

(declare-fun m!776125 () Bool)

(assert (=> d!106409 m!776125))

(declare-fun m!776127 () Bool)

(assert (=> b!832228 m!776127))

(declare-fun m!776129 () Bool)

(assert (=> bm!36405 m!776129))

(declare-fun m!776131 () Bool)

(assert (=> b!832236 m!776131))

(assert (=> b!831930 d!106409))

(declare-fun d!106411 () Bool)

(declare-fun res!566256 () Bool)

(declare-fun e!464130 () Bool)

(assert (=> d!106411 (=> res!566256 e!464130)))

(assert (=> d!106411 (= res!566256 (and ((_ is Cons!15945) (toList!4505 lt!377353)) (= (_1!5094 (h!17075 (toList!4505 lt!377353))) (_1!5094 lt!377161))))))

(assert (=> d!106411 (= (containsKey!400 (toList!4505 lt!377353) (_1!5094 lt!377161)) e!464130)))

(declare-fun b!832241 () Bool)

(declare-fun e!464131 () Bool)

(assert (=> b!832241 (= e!464130 e!464131)))

(declare-fun res!566257 () Bool)

(assert (=> b!832241 (=> (not res!566257) (not e!464131))))

(assert (=> b!832241 (= res!566257 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377353))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377353))) (_1!5094 lt!377161))) ((_ is Cons!15945) (toList!4505 lt!377353)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377353))) (_1!5094 lt!377161))))))

(declare-fun b!832242 () Bool)

(assert (=> b!832242 (= e!464131 (containsKey!400 (t!22308 (toList!4505 lt!377353)) (_1!5094 lt!377161)))))

(assert (= (and d!106411 (not res!566256)) b!832241))

(assert (= (and b!832241 res!566257) b!832242))

(declare-fun m!776133 () Bool)

(assert (=> b!832242 m!776133))

(assert (=> d!106243 d!106411))

(declare-fun d!106413 () Bool)

(declare-fun e!464133 () Bool)

(assert (=> d!106413 e!464133))

(declare-fun res!566258 () Bool)

(assert (=> d!106413 (=> res!566258 e!464133)))

(declare-fun lt!377635 () Bool)

(assert (=> d!106413 (= res!566258 (not lt!377635))))

(declare-fun lt!377633 () Bool)

(assert (=> d!106413 (= lt!377635 lt!377633)))

(declare-fun lt!377636 () Unit!28447)

(declare-fun e!464132 () Unit!28447)

(assert (=> d!106413 (= lt!377636 e!464132)))

(declare-fun c!90444 () Bool)

(assert (=> d!106413 (= c!90444 lt!377633)))

(assert (=> d!106413 (= lt!377633 (containsKey!400 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(assert (=> d!106413 (= (contains!4190 lt!377455 (_1!5094 (tuple2!10167 lt!377321 minValue!754))) lt!377635)))

(declare-fun b!832243 () Bool)

(declare-fun lt!377634 () Unit!28447)

(assert (=> b!832243 (= e!464132 lt!377634)))

(assert (=> b!832243 (= lt!377634 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(assert (=> b!832243 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832244 () Bool)

(declare-fun Unit!28478 () Unit!28447)

(assert (=> b!832244 (= e!464132 Unit!28478)))

(declare-fun b!832245 () Bool)

(assert (=> b!832245 (= e!464133 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(assert (= (and d!106413 c!90444) b!832243))

(assert (= (and d!106413 (not c!90444)) b!832244))

(assert (= (and d!106413 (not res!566258)) b!832245))

(declare-fun m!776135 () Bool)

(assert (=> d!106413 m!776135))

(declare-fun m!776137 () Bool)

(assert (=> b!832243 m!776137))

(assert (=> b!832243 m!775477))

(assert (=> b!832243 m!775477))

(declare-fun m!776139 () Bool)

(assert (=> b!832243 m!776139))

(assert (=> b!832245 m!775477))

(assert (=> b!832245 m!775477))

(assert (=> b!832245 m!776139))

(assert (=> d!106185 d!106413))

(declare-fun b!832248 () Bool)

(declare-fun e!464135 () Option!420)

(assert (=> b!832248 (= e!464135 (getValueByKey!414 (t!22308 lt!377454) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832249 () Bool)

(assert (=> b!832249 (= e!464135 None!418)))

(declare-fun d!106415 () Bool)

(declare-fun c!90445 () Bool)

(assert (=> d!106415 (= c!90445 (and ((_ is Cons!15945) lt!377454) (= (_1!5094 (h!17075 lt!377454)) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(declare-fun e!464134 () Option!420)

(assert (=> d!106415 (= (getValueByKey!414 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754))) e!464134)))

(declare-fun b!832247 () Bool)

(assert (=> b!832247 (= e!464134 e!464135)))

(declare-fun c!90446 () Bool)

(assert (=> b!832247 (= c!90446 (and ((_ is Cons!15945) lt!377454) (not (= (_1!5094 (h!17075 lt!377454)) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))))

(declare-fun b!832246 () Bool)

(assert (=> b!832246 (= e!464134 (Some!419 (_2!5094 (h!17075 lt!377454))))))

(assert (= (and d!106415 c!90445) b!832246))

(assert (= (and d!106415 (not c!90445)) b!832247))

(assert (= (and b!832247 c!90446) b!832248))

(assert (= (and b!832247 (not c!90446)) b!832249))

(declare-fun m!776141 () Bool)

(assert (=> b!832248 m!776141))

(assert (=> d!106185 d!106415))

(declare-fun d!106417 () Bool)

(assert (=> d!106417 (= (getValueByKey!414 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun lt!377637 () Unit!28447)

(assert (=> d!106417 (= lt!377637 (choose!1433 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun e!464136 () Bool)

(assert (=> d!106417 e!464136))

(declare-fun res!566259 () Bool)

(assert (=> d!106417 (=> (not res!566259) (not e!464136))))

(assert (=> d!106417 (= res!566259 (isStrictlySorted!438 lt!377454))))

(assert (=> d!106417 (= (lemmaContainsTupThenGetReturnValue!231 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))) lt!377637)))

(declare-fun b!832250 () Bool)

(declare-fun res!566260 () Bool)

(assert (=> b!832250 (=> (not res!566260) (not e!464136))))

(assert (=> b!832250 (= res!566260 (containsKey!400 lt!377454 (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832251 () Bool)

(assert (=> b!832251 (= e!464136 (contains!4191 lt!377454 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(assert (= (and d!106417 res!566259) b!832250))

(assert (= (and b!832250 res!566260) b!832251))

(assert (=> d!106417 m!775471))

(declare-fun m!776143 () Bool)

(assert (=> d!106417 m!776143))

(declare-fun m!776145 () Bool)

(assert (=> d!106417 m!776145))

(declare-fun m!776147 () Bool)

(assert (=> b!832250 m!776147))

(declare-fun m!776149 () Bool)

(assert (=> b!832251 m!776149))

(assert (=> d!106185 d!106417))

(declare-fun b!832252 () Bool)

(declare-fun e!464137 () Bool)

(declare-fun lt!377638 () List!15949)

(assert (=> b!832252 (= e!464137 (contains!4191 lt!377638 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(declare-fun b!832253 () Bool)

(declare-fun res!566262 () Bool)

(assert (=> b!832253 (=> (not res!566262) (not e!464137))))

(assert (=> b!832253 (= res!566262 (containsKey!400 lt!377638 (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832254 () Bool)

(declare-fun e!464139 () List!15949)

(declare-fun call!36411 () List!15949)

(assert (=> b!832254 (= e!464139 call!36411)))

(declare-fun c!90447 () Bool)

(declare-fun bm!36408 () Bool)

(declare-fun call!36413 () List!15949)

(declare-fun e!464141 () List!15949)

(assert (=> bm!36408 (= call!36413 ($colon$colon!536 e!464141 (ite c!90447 (h!17075 (toList!4505 lt!377306)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))))

(declare-fun c!90448 () Bool)

(assert (=> bm!36408 (= c!90448 c!90447)))

(declare-fun b!832256 () Bool)

(declare-fun e!464140 () List!15949)

(assert (=> b!832256 (= e!464140 call!36413)))

(declare-fun bm!36409 () Bool)

(declare-fun call!36412 () List!15949)

(assert (=> bm!36409 (= call!36412 call!36413)))

(declare-fun b!832257 () Bool)

(declare-fun e!464138 () List!15949)

(assert (=> b!832257 (= e!464138 call!36412)))

(declare-fun b!832258 () Bool)

(declare-fun c!90449 () Bool)

(declare-fun c!90450 () Bool)

(assert (=> b!832258 (= e!464141 (ite c!90450 (t!22308 (toList!4505 lt!377306)) (ite c!90449 (Cons!15945 (h!17075 (toList!4505 lt!377306)) (t!22308 (toList!4505 lt!377306))) Nil!15946)))))

(declare-fun b!832259 () Bool)

(assert (=> b!832259 (= e!464139 call!36411)))

(declare-fun bm!36410 () Bool)

(assert (=> bm!36410 (= call!36411 call!36412)))

(declare-fun b!832260 () Bool)

(assert (=> b!832260 (= e!464140 e!464138)))

(assert (=> b!832260 (= c!90450 (and ((_ is Cons!15945) (toList!4505 lt!377306)) (= (_1!5094 (h!17075 (toList!4505 lt!377306))) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(declare-fun b!832261 () Bool)

(assert (=> b!832261 (= e!464141 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377306)) (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832255 () Bool)

(assert (=> b!832255 (= c!90449 (and ((_ is Cons!15945) (toList!4505 lt!377306)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377306))) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(assert (=> b!832255 (= e!464138 e!464139)))

(declare-fun d!106419 () Bool)

(assert (=> d!106419 e!464137))

(declare-fun res!566261 () Bool)

(assert (=> d!106419 (=> (not res!566261) (not e!464137))))

(assert (=> d!106419 (= res!566261 (isStrictlySorted!438 lt!377638))))

(assert (=> d!106419 (= lt!377638 e!464140)))

(assert (=> d!106419 (= c!90447 (and ((_ is Cons!15945) (toList!4505 lt!377306)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377306))) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(assert (=> d!106419 (isStrictlySorted!438 (toList!4505 lt!377306))))

(assert (=> d!106419 (= (insertStrictlySorted!270 (toList!4505 lt!377306) (_1!5094 (tuple2!10167 lt!377321 minValue!754)) (_2!5094 (tuple2!10167 lt!377321 minValue!754))) lt!377638)))

(assert (= (and d!106419 c!90447) b!832256))

(assert (= (and d!106419 (not c!90447)) b!832260))

(assert (= (and b!832260 c!90450) b!832257))

(assert (= (and b!832260 (not c!90450)) b!832255))

(assert (= (and b!832255 c!90449) b!832254))

(assert (= (and b!832255 (not c!90449)) b!832259))

(assert (= (or b!832254 b!832259) bm!36410))

(assert (= (or b!832257 bm!36410) bm!36409))

(assert (= (or b!832256 bm!36409) bm!36408))

(assert (= (and bm!36408 c!90448) b!832261))

(assert (= (and bm!36408 (not c!90448)) b!832258))

(assert (= (and d!106419 res!566261) b!832253))

(assert (= (and b!832253 res!566262) b!832252))

(declare-fun m!776151 () Bool)

(assert (=> b!832252 m!776151))

(declare-fun m!776153 () Bool)

(assert (=> d!106419 m!776153))

(declare-fun m!776155 () Bool)

(assert (=> d!106419 m!776155))

(declare-fun m!776157 () Bool)

(assert (=> b!832253 m!776157))

(declare-fun m!776159 () Bool)

(assert (=> bm!36408 m!776159))

(declare-fun m!776161 () Bool)

(assert (=> b!832261 m!776161))

(assert (=> d!106185 d!106419))

(declare-fun b!832264 () Bool)

(declare-fun e!464143 () Option!420)

(assert (=> b!832264 (= e!464143 (getValueByKey!414 (t!22308 (toList!4505 lt!377490)) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832265 () Bool)

(assert (=> b!832265 (= e!464143 None!418)))

(declare-fun d!106421 () Bool)

(declare-fun c!90451 () Bool)

(assert (=> d!106421 (= c!90451 (and ((_ is Cons!15945) (toList!4505 lt!377490)) (= (_1!5094 (h!17075 (toList!4505 lt!377490))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464142 () Option!420)

(assert (=> d!106421 (= (getValueByKey!414 (toList!4505 lt!377490) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464142)))

(declare-fun b!832263 () Bool)

(assert (=> b!832263 (= e!464142 e!464143)))

(declare-fun c!90452 () Bool)

(assert (=> b!832263 (= c!90452 (and ((_ is Cons!15945) (toList!4505 lt!377490)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377490))) (_1!5094 (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832262 () Bool)

(assert (=> b!832262 (= e!464142 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377490)))))))

(assert (= (and d!106421 c!90451) b!832262))

(assert (= (and d!106421 (not c!90451)) b!832263))

(assert (= (and b!832263 c!90452) b!832264))

(assert (= (and b!832263 (not c!90452)) b!832265))

(declare-fun m!776163 () Bool)

(assert (=> b!832264 m!776163))

(assert (=> b!831950 d!106421))

(declare-fun d!106423 () Bool)

(declare-fun c!90455 () Bool)

(assert (=> d!106423 (= c!90455 ((_ is Nil!15946) (toList!4505 lt!377361)))))

(declare-fun e!464146 () (InoxSet tuple2!10166))

(assert (=> d!106423 (= (content!386 (toList!4505 lt!377361)) e!464146)))

(declare-fun b!832270 () Bool)

(assert (=> b!832270 (= e!464146 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832271 () Bool)

(assert (=> b!832271 (= e!464146 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377361)) true) (content!386 (t!22308 (toList!4505 lt!377361)))))))

(assert (= (and d!106423 c!90455) b!832270))

(assert (= (and d!106423 (not c!90455)) b!832271))

(declare-fun m!776165 () Bool)

(assert (=> b!832271 m!776165))

(declare-fun m!776167 () Bool)

(assert (=> b!832271 m!776167))

(assert (=> d!106315 d!106423))

(declare-fun b!832272 () Bool)

(declare-fun e!464147 () Bool)

(declare-fun lt!377639 () List!15949)

(assert (=> b!832272 (= e!464147 (contains!4191 lt!377639 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!832273 () Bool)

(declare-fun res!566264 () Bool)

(assert (=> b!832273 (=> (not res!566264) (not e!464147))))

(assert (=> b!832273 (= res!566264 (containsKey!400 lt!377639 (_1!5094 lt!377164)))))

(declare-fun b!832274 () Bool)

(declare-fun e!464149 () List!15949)

(declare-fun call!36414 () List!15949)

(assert (=> b!832274 (= e!464149 call!36414)))

(declare-fun call!36416 () List!15949)

(declare-fun bm!36411 () Bool)

(declare-fun c!90456 () Bool)

(declare-fun e!464151 () List!15949)

(assert (=> bm!36411 (= call!36416 ($colon$colon!536 e!464151 (ite c!90456 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))))))

(declare-fun c!90457 () Bool)

(assert (=> bm!36411 (= c!90457 c!90456)))

(declare-fun b!832276 () Bool)

(declare-fun e!464150 () List!15949)

(assert (=> b!832276 (= e!464150 call!36416)))

(declare-fun bm!36412 () Bool)

(declare-fun call!36415 () List!15949)

(assert (=> bm!36412 (= call!36415 call!36416)))

(declare-fun b!832277 () Bool)

(declare-fun e!464148 () List!15949)

(assert (=> b!832277 (= e!464148 call!36415)))

(declare-fun c!90458 () Bool)

(declare-fun b!832278 () Bool)

(declare-fun c!90459 () Bool)

(assert (=> b!832278 (= e!464151 (ite c!90459 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (ite c!90458 (Cons!15945 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))) Nil!15946)))))

(declare-fun b!832279 () Bool)

(assert (=> b!832279 (= e!464149 call!36414)))

(declare-fun bm!36413 () Bool)

(assert (=> bm!36413 (= call!36414 call!36415)))

(declare-fun b!832280 () Bool)

(assert (=> b!832280 (= e!464150 e!464148)))

(assert (=> b!832280 (= c!90459 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))) (_1!5094 lt!377164))))))

(declare-fun b!832281 () Bool)

(assert (=> b!832281 (= e!464151 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (_1!5094 lt!377164) (_2!5094 lt!377164)))))

(declare-fun b!832275 () Bool)

(assert (=> b!832275 (= c!90458 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))) (_1!5094 lt!377164))))))

(assert (=> b!832275 (= e!464148 e!464149)))

(declare-fun d!106425 () Bool)

(assert (=> d!106425 e!464147))

(declare-fun res!566263 () Bool)

(assert (=> d!106425 (=> (not res!566263) (not e!464147))))

(assert (=> d!106425 (= res!566263 (isStrictlySorted!438 lt!377639))))

(assert (=> d!106425 (= lt!377639 e!464150)))

(assert (=> d!106425 (= c!90456 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))) (_1!5094 lt!377164))))))

(assert (=> d!106425 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))))

(assert (=> d!106425 (= (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))) (_1!5094 lt!377164) (_2!5094 lt!377164)) lt!377639)))

(assert (= (and d!106425 c!90456) b!832276))

(assert (= (and d!106425 (not c!90456)) b!832280))

(assert (= (and b!832280 c!90459) b!832277))

(assert (= (and b!832280 (not c!90459)) b!832275))

(assert (= (and b!832275 c!90458) b!832274))

(assert (= (and b!832275 (not c!90458)) b!832279))

(assert (= (or b!832274 b!832279) bm!36413))

(assert (= (or b!832277 bm!36413) bm!36412))

(assert (= (or b!832276 bm!36412) bm!36411))

(assert (= (and bm!36411 c!90457) b!832281))

(assert (= (and bm!36411 (not c!90457)) b!832278))

(assert (= (and d!106425 res!566263) b!832273))

(assert (= (and b!832273 res!566264) b!832272))

(declare-fun m!776169 () Bool)

(assert (=> b!832272 m!776169))

(declare-fun m!776171 () Bool)

(assert (=> d!106425 m!776171))

(declare-fun m!776173 () Bool)

(assert (=> d!106425 m!776173))

(declare-fun m!776175 () Bool)

(assert (=> b!832273 m!776175))

(declare-fun m!776177 () Bool)

(assert (=> bm!36411 m!776177))

(declare-fun m!776179 () Bool)

(assert (=> b!832281 m!776179))

(assert (=> b!831853 d!106425))

(declare-fun d!106427 () Bool)

(assert (=> d!106427 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23255 () Bool)

(assert (= bs!23255 d!106427))

(assert (=> bs!23255 m!775647))

(declare-fun m!776181 () Bool)

(assert (=> bs!23255 m!776181))

(assert (=> b!832111 d!106427))

(declare-fun b!832284 () Bool)

(declare-fun e!464153 () Option!420)

(assert (=> b!832284 (= e!464153 (getValueByKey!414 (t!22308 (toList!4505 lt!377243)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832285 () Bool)

(assert (=> b!832285 (= e!464153 None!418)))

(declare-fun d!106429 () Bool)

(declare-fun c!90460 () Bool)

(assert (=> d!106429 (= c!90460 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464152 () Option!420)

(assert (=> d!106429 (= (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464152)))

(declare-fun b!832283 () Bool)

(assert (=> b!832283 (= e!464152 e!464153)))

(declare-fun c!90461 () Bool)

(assert (=> b!832283 (= c!90461 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377243))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832282 () Bool)

(assert (=> b!832282 (= e!464152 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377243)))))))

(assert (= (and d!106429 c!90460) b!832282))

(assert (= (and d!106429 (not c!90460)) b!832283))

(assert (= (and b!832283 c!90461) b!832284))

(assert (= (and b!832283 (not c!90461)) b!832285))

(assert (=> b!832284 m!775051))

(declare-fun m!776183 () Bool)

(assert (=> b!832284 m!776183))

(assert (=> b!832111 d!106429))

(declare-fun d!106431 () Bool)

(declare-fun res!566265 () Bool)

(declare-fun e!464154 () Bool)

(assert (=> d!106431 (=> res!566265 e!464154)))

(assert (=> d!106431 (= res!566265 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106431 (= (containsKey!400 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000) e!464154)))

(declare-fun b!832286 () Bool)

(declare-fun e!464155 () Bool)

(assert (=> b!832286 (= e!464154 e!464155)))

(declare-fun res!566266 () Bool)

(assert (=> b!832286 (=> (not res!566266) (not e!464155))))

(assert (=> b!832286 (= res!566266 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377340))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377340))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377340)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377340))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832287 () Bool)

(assert (=> b!832287 (= e!464155 (containsKey!400 (t!22308 (toList!4505 lt!377340)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106431 (not res!566265)) b!832286))

(assert (= (and b!832286 res!566266) b!832287))

(declare-fun m!776185 () Bool)

(assert (=> b!832287 m!776185))

(assert (=> d!106305 d!106431))

(declare-fun d!106433 () Bool)

(assert (=> d!106433 (= (isEmpty!662 lt!377547) (isEmpty!663 (toList!4505 lt!377547)))))

(declare-fun bs!23256 () Bool)

(assert (= bs!23256 d!106433))

(declare-fun m!776187 () Bool)

(assert (=> bs!23256 m!776187))

(assert (=> b!832090 d!106433))

(declare-fun d!106435 () Bool)

(declare-fun lt!377640 () Bool)

(assert (=> d!106435 (= lt!377640 (select (content!386 (t!22308 (toList!4505 lt!377349))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464157 () Bool)

(assert (=> d!106435 (= lt!377640 e!464157)))

(declare-fun res!566267 () Bool)

(assert (=> d!106435 (=> (not res!566267) (not e!464157))))

(assert (=> d!106435 (= res!566267 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377349))))))

(assert (=> d!106435 (= (contains!4191 (t!22308 (toList!4505 lt!377349)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377640)))

(declare-fun b!832288 () Bool)

(declare-fun e!464156 () Bool)

(assert (=> b!832288 (= e!464157 e!464156)))

(declare-fun res!566268 () Bool)

(assert (=> b!832288 (=> res!566268 e!464156)))

(assert (=> b!832288 (= res!566268 (= (h!17075 (t!22308 (toList!4505 lt!377349))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!832289 () Bool)

(assert (=> b!832289 (= e!464156 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377349))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106435 res!566267) b!832288))

(assert (= (and b!832288 (not res!566268)) b!832289))

(declare-fun m!776189 () Bool)

(assert (=> d!106435 m!776189))

(declare-fun m!776191 () Bool)

(assert (=> d!106435 m!776191))

(declare-fun m!776193 () Bool)

(assert (=> b!832289 m!776193))

(assert (=> b!832140 d!106435))

(declare-fun d!106437 () Bool)

(assert (=> d!106437 (= (isEmpty!663 (toList!4505 lt!377243)) ((_ is Nil!15946) (toList!4505 lt!377243)))))

(assert (=> d!106283 d!106437))

(declare-fun d!106439 () Bool)

(assert (=> d!106439 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106311 d!106439))

(declare-fun b!832292 () Bool)

(declare-fun e!464159 () Option!420)

(assert (=> b!832292 (= e!464159 (getValueByKey!414 (t!22308 (toList!4505 lt!377340)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832293 () Bool)

(assert (=> b!832293 (= e!464159 None!418)))

(declare-fun d!106441 () Bool)

(declare-fun c!90462 () Bool)

(assert (=> d!106441 (= c!90462 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464158 () Option!420)

(assert (=> d!106441 (= (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000) e!464158)))

(declare-fun b!832291 () Bool)

(assert (=> b!832291 (= e!464158 e!464159)))

(declare-fun c!90463 () Bool)

(assert (=> b!832291 (= c!90463 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832290 () Bool)

(assert (=> b!832290 (= e!464158 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377340)))))))

(assert (= (and d!106441 c!90462) b!832290))

(assert (= (and d!106441 (not c!90462)) b!832291))

(assert (= (and b!832291 c!90463) b!832292))

(assert (= (and b!832291 (not c!90463)) b!832293))

(declare-fun m!776195 () Bool)

(assert (=> b!832292 m!776195))

(assert (=> d!106311 d!106441))

(declare-fun d!106443 () Bool)

(assert (=> d!106443 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377302)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377302)))))

(assert (=> d!106205 d!106443))

(declare-fun b!832296 () Bool)

(declare-fun e!464161 () Option!420)

(assert (=> b!832296 (= e!464161 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)))) lt!377302))))

(declare-fun b!832297 () Bool)

(assert (=> b!832297 (= e!464161 None!418)))

(declare-fun c!90464 () Bool)

(declare-fun d!106445 () Bool)

(assert (=> d!106445 (= c!90464 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))))) lt!377302)))))

(declare-fun e!464160 () Option!420)

(assert (=> d!106445 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377302) e!464160)))

(declare-fun b!832295 () Bool)

(assert (=> b!832295 (= e!464160 e!464161)))

(declare-fun c!90465 () Bool)

(assert (=> b!832295 (= c!90465 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34))))) lt!377302))))))

(declare-fun b!832294 () Bool)

(assert (=> b!832294 (= e!464160 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))))

(assert (= (and d!106445 c!90464) b!832294))

(assert (= (and d!106445 (not c!90464)) b!832295))

(assert (= (and b!832295 c!90465) b!832296))

(assert (= (and b!832295 (not c!90465)) b!832297))

(declare-fun m!776197 () Bool)

(assert (=> b!832296 m!776197))

(assert (=> d!106205 d!106445))

(declare-fun b!832300 () Bool)

(declare-fun e!464163 () Option!420)

(assert (=> b!832300 (= e!464163 (getValueByKey!414 (t!22308 (t!22308 lt!377256)) (_1!5094 lt!377161)))))

(declare-fun b!832301 () Bool)

(assert (=> b!832301 (= e!464163 None!418)))

(declare-fun d!106447 () Bool)

(declare-fun c!90466 () Bool)

(assert (=> d!106447 (= c!90466 (and ((_ is Cons!15945) (t!22308 lt!377256)) (= (_1!5094 (h!17075 (t!22308 lt!377256))) (_1!5094 lt!377161))))))

(declare-fun e!464162 () Option!420)

(assert (=> d!106447 (= (getValueByKey!414 (t!22308 lt!377256) (_1!5094 lt!377161)) e!464162)))

(declare-fun b!832299 () Bool)

(assert (=> b!832299 (= e!464162 e!464163)))

(declare-fun c!90467 () Bool)

(assert (=> b!832299 (= c!90467 (and ((_ is Cons!15945) (t!22308 lt!377256)) (not (= (_1!5094 (h!17075 (t!22308 lt!377256))) (_1!5094 lt!377161)))))))

(declare-fun b!832298 () Bool)

(assert (=> b!832298 (= e!464162 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377256)))))))

(assert (= (and d!106447 c!90466) b!832298))

(assert (= (and d!106447 (not c!90466)) b!832299))

(assert (= (and b!832299 c!90467) b!832300))

(assert (= (and b!832299 (not c!90467)) b!832301))

(declare-fun m!776199 () Bool)

(assert (=> b!832300 m!776199))

(assert (=> b!832043 d!106447))

(declare-fun d!106449 () Bool)

(declare-fun res!566269 () Bool)

(declare-fun e!464164 () Bool)

(assert (=> d!106449 (=> res!566269 e!464164)))

(assert (=> d!106449 (= res!566269 (and ((_ is Cons!15945) lt!377364) (= (_1!5094 (h!17075 lt!377364)) (_1!5094 lt!377161))))))

(assert (=> d!106449 (= (containsKey!400 lt!377364 (_1!5094 lt!377161)) e!464164)))

(declare-fun b!832302 () Bool)

(declare-fun e!464165 () Bool)

(assert (=> b!832302 (= e!464164 e!464165)))

(declare-fun res!566270 () Bool)

(assert (=> b!832302 (=> (not res!566270) (not e!464165))))

(assert (=> b!832302 (= res!566270 (and (or (not ((_ is Cons!15945) lt!377364)) (bvsle (_1!5094 (h!17075 lt!377364)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377364) (bvslt (_1!5094 (h!17075 lt!377364)) (_1!5094 lt!377161))))))

(declare-fun b!832303 () Bool)

(assert (=> b!832303 (= e!464165 (containsKey!400 (t!22308 lt!377364) (_1!5094 lt!377161)))))

(assert (= (and d!106449 (not res!566269)) b!832302))

(assert (= (and b!832302 res!566270) b!832303))

(declare-fun m!776201 () Bool)

(assert (=> b!832303 m!776201))

(assert (=> b!831938 d!106449))

(declare-fun d!106451 () Bool)

(declare-fun res!566271 () Bool)

(declare-fun e!464166 () Bool)

(assert (=> d!106451 (=> res!566271 e!464166)))

(assert (=> d!106451 (= res!566271 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106451 (= (containsKey!400 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464166)))

(declare-fun b!832304 () Bool)

(declare-fun e!464167 () Bool)

(assert (=> b!832304 (= e!464166 e!464167)))

(declare-fun res!566272 () Bool)

(assert (=> b!832304 (=> (not res!566272) (not e!464167))))

(assert (=> b!832304 (= res!566272 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377250))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377250))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377250)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377250))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832305 () Bool)

(assert (=> b!832305 (= e!464167 (containsKey!400 (t!22308 (toList!4505 lt!377250)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106451 (not res!566271)) b!832304))

(assert (= (and b!832304 res!566272) b!832305))

(assert (=> b!832305 m!775051))

(declare-fun m!776203 () Bool)

(assert (=> b!832305 m!776203))

(assert (=> d!106333 d!106451))

(declare-fun d!106453 () Bool)

(declare-fun e!464169 () Bool)

(assert (=> d!106453 e!464169))

(declare-fun res!566273 () Bool)

(assert (=> d!106453 (=> res!566273 e!464169)))

(declare-fun lt!377643 () Bool)

(assert (=> d!106453 (= res!566273 (not lt!377643))))

(declare-fun lt!377641 () Bool)

(assert (=> d!106453 (= lt!377643 lt!377641)))

(declare-fun lt!377644 () Unit!28447)

(declare-fun e!464168 () Unit!28447)

(assert (=> d!106453 (= lt!377644 e!464168)))

(declare-fun c!90468 () Bool)

(assert (=> d!106453 (= c!90468 lt!377641)))

(assert (=> d!106453 (= lt!377641 (containsKey!400 (toList!4505 lt!377435) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106453 (= (contains!4190 lt!377435 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377643)))

(declare-fun b!832306 () Bool)

(declare-fun lt!377642 () Unit!28447)

(assert (=> b!832306 (= e!464168 lt!377642)))

(assert (=> b!832306 (= lt!377642 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377435) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832306 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832307 () Bool)

(declare-fun Unit!28479 () Unit!28447)

(assert (=> b!832307 (= e!464168 Unit!28479)))

(declare-fun b!832308 () Bool)

(assert (=> b!832308 (= e!464169 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106453 c!90468) b!832306))

(assert (= (and d!106453 (not c!90468)) b!832307))

(assert (= (and d!106453 (not res!566273)) b!832308))

(declare-fun m!776205 () Bool)

(assert (=> d!106453 m!776205))

(declare-fun m!776207 () Bool)

(assert (=> b!832306 m!776207))

(declare-fun m!776209 () Bool)

(assert (=> b!832306 m!776209))

(assert (=> b!832306 m!776209))

(declare-fun m!776211 () Bool)

(assert (=> b!832306 m!776211))

(assert (=> b!832308 m!776209))

(assert (=> b!832308 m!776209))

(assert (=> b!832308 m!776211))

(assert (=> b!831877 d!106453))

(declare-fun d!106455 () Bool)

(declare-fun res!566274 () Bool)

(declare-fun e!464170 () Bool)

(assert (=> d!106455 (=> res!566274 e!464170)))

(assert (=> d!106455 (= res!566274 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106455 (= (containsKey!400 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000) e!464170)))

(declare-fun b!832309 () Bool)

(declare-fun e!464171 () Bool)

(assert (=> b!832309 (= e!464170 e!464171)))

(declare-fun res!566275 () Bool)

(assert (=> b!832309 (=> (not res!566275) (not e!464171))))

(assert (=> b!832309 (= res!566275 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377318))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377318))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377318)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377318))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832310 () Bool)

(assert (=> b!832310 (= e!464171 (containsKey!400 (t!22308 (toList!4505 lt!377318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106455 (not res!566274)) b!832309))

(assert (= (and b!832309 res!566275) b!832310))

(declare-fun m!776213 () Bool)

(assert (=> b!832310 m!776213))

(assert (=> d!106329 d!106455))

(declare-fun d!106457 () Bool)

(assert (=> d!106457 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161)))))))

(declare-fun bs!23257 () Bool)

(assert (= bs!23257 d!106457))

(assert (=> bs!23257 m!775247))

(declare-fun m!776215 () Bool)

(assert (=> bs!23257 m!776215))

(assert (=> b!831933 d!106457))

(assert (=> b!831933 d!106253))

(declare-fun d!106459 () Bool)

(assert (=> d!106459 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23258 () Bool)

(assert (= bs!23258 d!106459))

(assert (=> bs!23258 m!775349))

(declare-fun m!776217 () Bool)

(assert (=> bs!23258 m!776217))

(assert (=> b!831856 d!106459))

(declare-fun b!832313 () Bool)

(declare-fun e!464173 () Option!420)

(assert (=> b!832313 (= e!464173 (getValueByKey!414 (t!22308 (toList!4505 lt!377243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832314 () Bool)

(assert (=> b!832314 (= e!464173 None!418)))

(declare-fun d!106461 () Bool)

(declare-fun c!90469 () Bool)

(assert (=> d!106461 (= c!90469 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464172 () Option!420)

(assert (=> d!106461 (= (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000) e!464172)))

(declare-fun b!832312 () Bool)

(assert (=> b!832312 (= e!464172 e!464173)))

(declare-fun c!90470 () Bool)

(assert (=> b!832312 (= c!90470 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832311 () Bool)

(assert (=> b!832311 (= e!464172 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377243)))))))

(assert (= (and d!106461 c!90469) b!832311))

(assert (= (and d!106461 (not c!90469)) b!832312))

(assert (= (and b!832312 c!90470) b!832313))

(assert (= (and b!832312 (not c!90470)) b!832314))

(declare-fun m!776219 () Bool)

(assert (=> b!832313 m!776219))

(assert (=> b!831856 d!106461))

(declare-fun b!832315 () Bool)

(declare-fun e!464174 () Bool)

(declare-fun lt!377645 () List!15949)

(assert (=> b!832315 (= e!464174 (contains!4191 lt!377645 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832316 () Bool)

(declare-fun res!566277 () Bool)

(assert (=> b!832316 (=> (not res!566277) (not e!464174))))

(assert (=> b!832316 (= res!566277 (containsKey!400 lt!377645 (_1!5094 lt!377161)))))

(declare-fun b!832317 () Bool)

(declare-fun e!464176 () List!15949)

(declare-fun call!36417 () List!15949)

(assert (=> b!832317 (= e!464176 call!36417)))

(declare-fun e!464178 () List!15949)

(declare-fun bm!36414 () Bool)

(declare-fun call!36419 () List!15949)

(declare-fun c!90471 () Bool)

(assert (=> bm!36414 (= call!36419 ($colon$colon!536 e!464178 (ite c!90471 (h!17075 (t!22308 (toList!4505 lt!377163))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90472 () Bool)

(assert (=> bm!36414 (= c!90472 c!90471)))

(declare-fun b!832319 () Bool)

(declare-fun e!464177 () List!15949)

(assert (=> b!832319 (= e!464177 call!36419)))

(declare-fun bm!36415 () Bool)

(declare-fun call!36418 () List!15949)

(assert (=> bm!36415 (= call!36418 call!36419)))

(declare-fun b!832320 () Bool)

(declare-fun e!464175 () List!15949)

(assert (=> b!832320 (= e!464175 call!36418)))

(declare-fun b!832321 () Bool)

(declare-fun c!90473 () Bool)

(declare-fun c!90474 () Bool)

(assert (=> b!832321 (= e!464178 (ite c!90474 (t!22308 (t!22308 (toList!4505 lt!377163))) (ite c!90473 (Cons!15945 (h!17075 (t!22308 (toList!4505 lt!377163))) (t!22308 (t!22308 (toList!4505 lt!377163)))) Nil!15946)))))

(declare-fun b!832322 () Bool)

(assert (=> b!832322 (= e!464176 call!36417)))

(declare-fun bm!36416 () Bool)

(assert (=> bm!36416 (= call!36417 call!36418)))

(declare-fun b!832323 () Bool)

(assert (=> b!832323 (= e!464177 e!464175)))

(assert (=> b!832323 (= c!90474 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 lt!377161))))))

(declare-fun b!832324 () Bool)

(assert (=> b!832324 (= e!464178 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 lt!377163))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!832318 () Bool)

(assert (=> b!832318 (= c!90473 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 lt!377161))))))

(assert (=> b!832318 (= e!464175 e!464176)))

(declare-fun d!106463 () Bool)

(assert (=> d!106463 e!464174))

(declare-fun res!566276 () Bool)

(assert (=> d!106463 (=> (not res!566276) (not e!464174))))

(assert (=> d!106463 (= res!566276 (isStrictlySorted!438 lt!377645))))

(assert (=> d!106463 (= lt!377645 e!464177)))

(assert (=> d!106463 (= c!90471 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 lt!377161))))))

(assert (=> d!106463 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377163)))))

(assert (=> d!106463 (= (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377163)) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377645)))

(assert (= (and d!106463 c!90471) b!832319))

(assert (= (and d!106463 (not c!90471)) b!832323))

(assert (= (and b!832323 c!90474) b!832320))

(assert (= (and b!832323 (not c!90474)) b!832318))

(assert (= (and b!832318 c!90473) b!832317))

(assert (= (and b!832318 (not c!90473)) b!832322))

(assert (= (or b!832317 b!832322) bm!36416))

(assert (= (or b!832320 bm!36416) bm!36415))

(assert (= (or b!832319 bm!36415) bm!36414))

(assert (= (and bm!36414 c!90472) b!832324))

(assert (= (and bm!36414 (not c!90472)) b!832321))

(assert (= (and d!106463 res!566276) b!832316))

(assert (= (and b!832316 res!566277) b!832315))

(declare-fun m!776221 () Bool)

(assert (=> b!832315 m!776221))

(declare-fun m!776223 () Bool)

(assert (=> d!106463 m!776223))

(declare-fun m!776225 () Bool)

(assert (=> d!106463 m!776225))

(declare-fun m!776227 () Bool)

(assert (=> b!832316 m!776227))

(declare-fun m!776229 () Bool)

(assert (=> bm!36414 m!776229))

(declare-fun m!776231 () Bool)

(assert (=> b!832324 m!776231))

(assert (=> b!831991 d!106463))

(declare-fun d!106465 () Bool)

(assert (=> d!106465 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(declare-fun lt!377646 () Unit!28447)

(assert (=> d!106465 (= lt!377646 (choose!1436 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(declare-fun e!464179 () Bool)

(assert (=> d!106465 e!464179))

(declare-fun res!566278 () Bool)

(assert (=> d!106465 (=> (not res!566278) (not e!464179))))

(assert (=> d!106465 (= res!566278 (isStrictlySorted!438 (toList!4505 lt!377257)))))

(assert (=> d!106465 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377257) (_1!5094 lt!377161)) lt!377646)))

(declare-fun b!832325 () Bool)

(assert (=> b!832325 (= e!464179 (containsKey!400 (toList!4505 lt!377257) (_1!5094 lt!377161)))))

(assert (= (and d!106465 res!566278) b!832325))

(assert (=> d!106465 m!775095))

(assert (=> d!106465 m!775095))

(assert (=> d!106465 m!775729))

(declare-fun m!776233 () Bool)

(assert (=> d!106465 m!776233))

(declare-fun m!776235 () Bool)

(assert (=> d!106465 m!776235))

(assert (=> b!832325 m!775725))

(assert (=> b!832038 d!106465))

(declare-fun d!106467 () Bool)

(assert (=> d!106467 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377257) (_1!5094 lt!377161)))))))

(declare-fun bs!23259 () Bool)

(assert (= bs!23259 d!106467))

(assert (=> bs!23259 m!775095))

(declare-fun m!776237 () Bool)

(assert (=> bs!23259 m!776237))

(assert (=> b!832038 d!106467))

(assert (=> b!832038 d!106313))

(declare-fun b!832328 () Bool)

(declare-fun e!464181 () Option!420)

(assert (=> b!832328 (= e!464181 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377365))) (_1!5094 lt!377161)))))

(declare-fun b!832329 () Bool)

(assert (=> b!832329 (= e!464181 None!418)))

(declare-fun d!106469 () Bool)

(declare-fun c!90475 () Bool)

(assert (=> d!106469 (= c!90475 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377365))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377365)))) (_1!5094 lt!377161))))))

(declare-fun e!464180 () Option!420)

(assert (=> d!106469 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377365)) (_1!5094 lt!377161)) e!464180)))

(declare-fun b!832327 () Bool)

(assert (=> b!832327 (= e!464180 e!464181)))

(declare-fun c!90476 () Bool)

(assert (=> b!832327 (= c!90476 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377365))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377365)))) (_1!5094 lt!377161)))))))

(declare-fun b!832326 () Bool)

(assert (=> b!832326 (= e!464180 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377365))))))))

(assert (= (and d!106469 c!90475) b!832326))

(assert (= (and d!106469 (not c!90475)) b!832327))

(assert (= (and b!832327 c!90476) b!832328))

(assert (= (and b!832327 (not c!90476)) b!832329))

(declare-fun m!776239 () Bool)

(assert (=> b!832328 m!776239))

(assert (=> b!831997 d!106469))

(assert (=> d!106201 d!106199))

(assert (=> d!106201 d!106181))

(declare-fun d!106471 () Bool)

(declare-fun e!464183 () Bool)

(assert (=> d!106471 e!464183))

(declare-fun res!566279 () Bool)

(assert (=> d!106471 (=> res!566279 e!464183)))

(declare-fun lt!377649 () Bool)

(assert (=> d!106471 (= res!566279 (not lt!377649))))

(declare-fun lt!377647 () Bool)

(assert (=> d!106471 (= lt!377649 lt!377647)))

(declare-fun lt!377650 () Unit!28447)

(declare-fun e!464182 () Unit!28447)

(assert (=> d!106471 (= lt!377650 e!464182)))

(declare-fun c!90477 () Bool)

(assert (=> d!106471 (= c!90477 lt!377647)))

(assert (=> d!106471 (= lt!377647 (containsKey!400 (toList!4505 lt!377311) lt!377323))))

(assert (=> d!106471 (= (contains!4190 lt!377311 lt!377323) lt!377649)))

(declare-fun b!832330 () Bool)

(declare-fun lt!377648 () Unit!28447)

(assert (=> b!832330 (= e!464182 lt!377648)))

(assert (=> b!832330 (= lt!377648 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377311) lt!377323))))

(assert (=> b!832330 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377311) lt!377323))))

(declare-fun b!832331 () Bool)

(declare-fun Unit!28480 () Unit!28447)

(assert (=> b!832331 (= e!464182 Unit!28480)))

(declare-fun b!832332 () Bool)

(assert (=> b!832332 (= e!464183 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377311) lt!377323)))))

(assert (= (and d!106471 c!90477) b!832330))

(assert (= (and d!106471 (not c!90477)) b!832331))

(assert (= (and d!106471 (not res!566279)) b!832332))

(declare-fun m!776241 () Bool)

(assert (=> d!106471 m!776241))

(declare-fun m!776243 () Bool)

(assert (=> b!832330 m!776243))

(assert (=> b!832330 m!775513))

(assert (=> b!832330 m!775513))

(declare-fun m!776245 () Bool)

(assert (=> b!832330 m!776245))

(assert (=> b!832332 m!775513))

(assert (=> b!832332 m!775513))

(assert (=> b!832332 m!776245))

(assert (=> d!106201 d!106471))

(declare-fun d!106473 () Bool)

(assert (=> d!106473 (= (apply!373 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)) lt!377323) (apply!373 lt!377311 lt!377323))))

(assert (=> d!106473 true))

(declare-fun _$34!1150 () Unit!28447)

(assert (=> d!106473 (= (choose!1435 lt!377311 lt!377303 minValue!754 lt!377323) _$34!1150)))

(declare-fun bs!23260 () Bool)

(assert (= bs!23260 d!106473))

(assert (=> bs!23260 m!775107))

(assert (=> bs!23260 m!775107))

(assert (=> bs!23260 m!775109))

(assert (=> bs!23260 m!775117))

(assert (=> d!106201 d!106473))

(assert (=> d!106201 d!106193))

(declare-fun d!106475 () Bool)

(assert (=> d!106475 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23261 () Bool)

(assert (= bs!23261 d!106475))

(assert (=> bs!23261 m!775429))

(declare-fun m!776247 () Bool)

(assert (=> bs!23261 m!776247))

(assert (=> b!832085 d!106475))

(declare-fun b!832336 () Bool)

(declare-fun e!464185 () Option!420)

(assert (=> b!832336 (= e!464185 (getValueByKey!414 (t!22308 (toList!4505 lt!377318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832337 () Bool)

(assert (=> b!832337 (= e!464185 None!418)))

(declare-fun d!106477 () Bool)

(declare-fun c!90478 () Bool)

(assert (=> d!106477 (= c!90478 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464184 () Option!420)

(assert (=> d!106477 (= (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000) e!464184)))

(declare-fun b!832335 () Bool)

(assert (=> b!832335 (= e!464184 e!464185)))

(declare-fun c!90479 () Bool)

(assert (=> b!832335 (= c!90479 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832334 () Bool)

(assert (=> b!832334 (= e!464184 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377318)))))))

(assert (= (and d!106477 c!90478) b!832334))

(assert (= (and d!106477 (not c!90478)) b!832335))

(assert (= (and b!832335 c!90479) b!832336))

(assert (= (and b!832335 (not c!90479)) b!832337))

(declare-fun m!776249 () Bool)

(assert (=> b!832336 m!776249))

(assert (=> b!832085 d!106477))

(declare-fun d!106479 () Bool)

(assert (=> d!106479 (= ($colon$colon!536 e!463945 (ite c!90337 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))) (Cons!15945 (ite c!90337 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) e!463945))))

(assert (=> bm!36378 d!106479))

(declare-fun b!832340 () Bool)

(declare-fun e!464187 () Option!420)

(assert (=> b!832340 (= e!464187 (getValueByKey!414 (t!22308 (toList!4505 lt!377455)) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))

(declare-fun b!832341 () Bool)

(assert (=> b!832341 (= e!464187 None!418)))

(declare-fun c!90480 () Bool)

(declare-fun d!106481 () Bool)

(assert (=> d!106481 (= c!90480 (and ((_ is Cons!15945) (toList!4505 lt!377455)) (= (_1!5094 (h!17075 (toList!4505 lt!377455))) (_1!5094 (tuple2!10167 lt!377321 minValue!754)))))))

(declare-fun e!464186 () Option!420)

(assert (=> d!106481 (= (getValueByKey!414 (toList!4505 lt!377455) (_1!5094 (tuple2!10167 lt!377321 minValue!754))) e!464186)))

(declare-fun b!832339 () Bool)

(assert (=> b!832339 (= e!464186 e!464187)))

(declare-fun c!90481 () Bool)

(assert (=> b!832339 (= c!90481 (and ((_ is Cons!15945) (toList!4505 lt!377455)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377455))) (_1!5094 (tuple2!10167 lt!377321 minValue!754))))))))

(declare-fun b!832338 () Bool)

(assert (=> b!832338 (= e!464186 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377455)))))))

(assert (= (and d!106481 c!90480) b!832338))

(assert (= (and d!106481 (not c!90480)) b!832339))

(assert (= (and b!832339 c!90481) b!832340))

(assert (= (and b!832339 (not c!90481)) b!832341))

(declare-fun m!776251 () Bool)

(assert (=> b!832340 m!776251))

(assert (=> b!831892 d!106481))

(declare-fun d!106483 () Bool)

(assert (=> d!106483 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106339 d!106483))

(declare-fun b!832344 () Bool)

(declare-fun e!464189 () Option!420)

(assert (=> b!832344 (= e!464189 (getValueByKey!414 (t!22308 (toList!4505 lt!377340)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832345 () Bool)

(assert (=> b!832345 (= e!464189 None!418)))

(declare-fun d!106485 () Bool)

(declare-fun c!90482 () Bool)

(assert (=> d!106485 (= c!90482 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464188 () Option!420)

(assert (=> d!106485 (= (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464188)))

(declare-fun b!832343 () Bool)

(assert (=> b!832343 (= e!464188 e!464189)))

(declare-fun c!90483 () Bool)

(assert (=> b!832343 (= c!90483 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377340))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832342 () Bool)

(assert (=> b!832342 (= e!464188 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377340)))))))

(assert (= (and d!106485 c!90482) b!832342))

(assert (= (and d!106485 (not c!90482)) b!832343))

(assert (= (and b!832343 c!90483) b!832344))

(assert (= (and b!832343 (not c!90483)) b!832345))

(assert (=> b!832344 m!775051))

(declare-fun m!776253 () Bool)

(assert (=> b!832344 m!776253))

(assert (=> d!106339 d!106485))

(declare-fun d!106487 () Bool)

(assert (=> d!106487 (= (isEmpty!663 (toList!4505 lt!377250)) ((_ is Nil!15946) (toList!4505 lt!377250)))))

(assert (=> d!106271 d!106487))

(declare-fun d!106489 () Bool)

(assert (=> d!106489 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377651 () Unit!28447)

(assert (=> d!106489 (= lt!377651 (choose!1436 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464190 () Bool)

(assert (=> d!106489 e!464190))

(declare-fun res!566280 () Bool)

(assert (=> d!106489 (=> (not res!566280) (not e!464190))))

(assert (=> d!106489 (= res!566280 (isStrictlySorted!438 (toList!4505 lt!377222)))))

(assert (=> d!106489 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377651)))

(declare-fun b!832346 () Bool)

(assert (=> b!832346 (= e!464190 (containsKey!400 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106489 res!566280) b!832346))

(assert (=> d!106489 m!775031))

(assert (=> d!106489 m!775031))

(assert (=> d!106489 m!775767))

(declare-fun m!776255 () Bool)

(assert (=> d!106489 m!776255))

(declare-fun m!776257 () Bool)

(assert (=> d!106489 m!776257))

(assert (=> b!832346 m!775763))

(assert (=> b!832060 d!106489))

(declare-fun d!106491 () Bool)

(assert (=> d!106491 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23262 () Bool)

(assert (= bs!23262 d!106491))

(assert (=> bs!23262 m!775031))

(declare-fun m!776259 () Bool)

(assert (=> bs!23262 m!776259))

(assert (=> b!832060 d!106491))

(assert (=> b!832060 d!106299))

(declare-fun lt!377652 () Bool)

(declare-fun d!106493 () Bool)

(assert (=> d!106493 (= lt!377652 (select (content!386 (toList!4505 lt!377615)) (tuple2!10167 lt!377337 zeroValueAfter!34)))))

(declare-fun e!464192 () Bool)

(assert (=> d!106493 (= lt!377652 e!464192)))

(declare-fun res!566281 () Bool)

(assert (=> d!106493 (=> (not res!566281) (not e!464192))))

(assert (=> d!106493 (= res!566281 ((_ is Cons!15945) (toList!4505 lt!377615)))))

(assert (=> d!106493 (= (contains!4191 (toList!4505 lt!377615) (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377652)))

(declare-fun b!832347 () Bool)

(declare-fun e!464191 () Bool)

(assert (=> b!832347 (= e!464192 e!464191)))

(declare-fun res!566282 () Bool)

(assert (=> b!832347 (=> res!566282 e!464191)))

(assert (=> b!832347 (= res!566282 (= (h!17075 (toList!4505 lt!377615)) (tuple2!10167 lt!377337 zeroValueAfter!34)))))

(declare-fun b!832348 () Bool)

(assert (=> b!832348 (= e!464191 (contains!4191 (t!22308 (toList!4505 lt!377615)) (tuple2!10167 lt!377337 zeroValueAfter!34)))))

(assert (= (and d!106493 res!566281) b!832347))

(assert (= (and b!832347 (not res!566282)) b!832348))

(declare-fun m!776261 () Bool)

(assert (=> d!106493 m!776261))

(declare-fun m!776263 () Bool)

(assert (=> d!106493 m!776263))

(declare-fun m!776265 () Bool)

(assert (=> b!832348 m!776265))

(assert (=> b!832179 d!106493))

(declare-fun d!106495 () Bool)

(declare-fun lt!377653 () Bool)

(assert (=> d!106495 (= lt!377653 (select (content!386 (t!22308 (toList!4505 lt!377218))) lt!377161))))

(declare-fun e!464194 () Bool)

(assert (=> d!106495 (= lt!377653 e!464194)))

(declare-fun res!566283 () Bool)

(assert (=> d!106495 (=> (not res!566283) (not e!464194))))

(assert (=> d!106495 (= res!566283 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377218))))))

(assert (=> d!106495 (= (contains!4191 (t!22308 (toList!4505 lt!377218)) lt!377161) lt!377653)))

(declare-fun b!832349 () Bool)

(declare-fun e!464193 () Bool)

(assert (=> b!832349 (= e!464194 e!464193)))

(declare-fun res!566284 () Bool)

(assert (=> b!832349 (=> res!566284 e!464193)))

(assert (=> b!832349 (= res!566284 (= (h!17075 (t!22308 (toList!4505 lt!377218))) lt!377161))))

(declare-fun b!832350 () Bool)

(assert (=> b!832350 (= e!464193 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377218))) lt!377161))))

(assert (= (and d!106495 res!566283) b!832349))

(assert (= (and b!832349 (not res!566284)) b!832350))

(declare-fun m!776267 () Bool)

(assert (=> d!106495 m!776267))

(declare-fun m!776269 () Bool)

(assert (=> d!106495 m!776269))

(declare-fun m!776271 () Bool)

(assert (=> b!832350 m!776271))

(assert (=> b!831884 d!106495))

(declare-fun d!106497 () Bool)

(assert (=> d!106497 (= ($colon$colon!536 e!463894 (ite c!90322 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161))) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164)))) (Cons!15945 (ite c!90322 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161))) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) e!463894))))

(assert (=> bm!36374 d!106497))

(declare-fun b!832353 () Bool)

(declare-fun e!464196 () Option!420)

(assert (=> b!832353 (= e!464196 (getValueByKey!414 (t!22308 (t!22308 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832354 () Bool)

(assert (=> b!832354 (= e!464196 None!418)))

(declare-fun d!106499 () Bool)

(declare-fun c!90484 () Bool)

(assert (=> d!106499 (= c!90484 (and ((_ is Cons!15945) (t!22308 lt!377221)) (= (_1!5094 (h!17075 (t!22308 lt!377221))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464195 () Option!420)

(assert (=> d!106499 (= (getValueByKey!414 (t!22308 lt!377221) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464195)))

(declare-fun b!832352 () Bool)

(assert (=> b!832352 (= e!464195 e!464196)))

(declare-fun c!90485 () Bool)

(assert (=> b!832352 (= c!90485 (and ((_ is Cons!15945) (t!22308 lt!377221)) (not (= (_1!5094 (h!17075 (t!22308 lt!377221))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832351 () Bool)

(assert (=> b!832351 (= e!464195 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377221)))))))

(assert (= (and d!106499 c!90484) b!832351))

(assert (= (and d!106499 (not c!90484)) b!832352))

(assert (= (and b!832352 c!90485) b!832353))

(assert (= (and b!832352 (not c!90485)) b!832354))

(declare-fun m!776273 () Bool)

(assert (=> b!832353 m!776273))

(assert (=> b!832065 d!106499))

(declare-fun d!106501 () Bool)

(declare-fun e!464198 () Bool)

(assert (=> d!106501 e!464198))

(declare-fun res!566285 () Bool)

(assert (=> d!106501 (=> res!566285 e!464198)))

(declare-fun lt!377656 () Bool)

(assert (=> d!106501 (= res!566285 (not lt!377656))))

(declare-fun lt!377654 () Bool)

(assert (=> d!106501 (= lt!377656 lt!377654)))

(declare-fun lt!377657 () Unit!28447)

(declare-fun e!464197 () Unit!28447)

(assert (=> d!106501 (= lt!377657 e!464197)))

(declare-fun c!90486 () Bool)

(assert (=> d!106501 (= c!90486 lt!377654)))

(assert (=> d!106501 (= lt!377654 (containsKey!400 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(assert (=> d!106501 (= (contains!4190 lt!377447 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377656)))

(declare-fun b!832355 () Bool)

(declare-fun lt!377655 () Unit!28447)

(assert (=> b!832355 (= e!464197 lt!377655)))

(assert (=> b!832355 (= lt!377655 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(assert (=> b!832355 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832356 () Bool)

(declare-fun Unit!28481 () Unit!28447)

(assert (=> b!832356 (= e!464197 Unit!28481)))

(declare-fun b!832357 () Bool)

(assert (=> b!832357 (= e!464198 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(assert (= (and d!106501 c!90486) b!832355))

(assert (= (and d!106501 (not c!90486)) b!832356))

(assert (= (and d!106501 (not res!566285)) b!832357))

(declare-fun m!776275 () Bool)

(assert (=> d!106501 m!776275))

(declare-fun m!776277 () Bool)

(assert (=> b!832355 m!776277))

(assert (=> b!832355 m!775453))

(assert (=> b!832355 m!775453))

(declare-fun m!776279 () Bool)

(assert (=> b!832355 m!776279))

(assert (=> b!832357 m!775453))

(assert (=> b!832357 m!775453))

(assert (=> b!832357 m!776279))

(assert (=> d!106179 d!106501))

(declare-fun e!464200 () Option!420)

(declare-fun b!832360 () Bool)

(assert (=> b!832360 (= e!464200 (getValueByKey!414 (t!22308 lt!377446) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832361 () Bool)

(assert (=> b!832361 (= e!464200 None!418)))

(declare-fun d!106503 () Bool)

(declare-fun c!90487 () Bool)

(assert (=> d!106503 (= c!90487 (and ((_ is Cons!15945) lt!377446) (= (_1!5094 (h!17075 lt!377446)) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(declare-fun e!464199 () Option!420)

(assert (=> d!106503 (= (getValueByKey!414 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) e!464199)))

(declare-fun b!832359 () Bool)

(assert (=> b!832359 (= e!464199 e!464200)))

(declare-fun c!90488 () Bool)

(assert (=> b!832359 (= c!90488 (and ((_ is Cons!15945) lt!377446) (not (= (_1!5094 (h!17075 lt!377446)) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))))

(declare-fun b!832358 () Bool)

(assert (=> b!832358 (= e!464199 (Some!419 (_2!5094 (h!17075 lt!377446))))))

(assert (= (and d!106503 c!90487) b!832358))

(assert (= (and d!106503 (not c!90487)) b!832359))

(assert (= (and b!832359 c!90488) b!832360))

(assert (= (and b!832359 (not c!90488)) b!832361))

(declare-fun m!776281 () Bool)

(assert (=> b!832360 m!776281))

(assert (=> d!106179 d!106503))

(declare-fun d!106505 () Bool)

(assert (=> d!106505 (= (getValueByKey!414 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun lt!377658 () Unit!28447)

(assert (=> d!106505 (= lt!377658 (choose!1433 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun e!464201 () Bool)

(assert (=> d!106505 e!464201))

(declare-fun res!566286 () Bool)

(assert (=> d!106505 (=> (not res!566286) (not e!464201))))

(assert (=> d!106505 (= res!566286 (isStrictlySorted!438 lt!377446))))

(assert (=> d!106505 (= (lemmaContainsTupThenGetReturnValue!231 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377658)))

(declare-fun b!832362 () Bool)

(declare-fun res!566287 () Bool)

(assert (=> b!832362 (=> (not res!566287) (not e!464201))))

(assert (=> b!832362 (= res!566287 (containsKey!400 lt!377446 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832363 () Bool)

(assert (=> b!832363 (= e!464201 (contains!4191 lt!377446 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(assert (= (and d!106505 res!566286) b!832362))

(assert (= (and b!832362 res!566287) b!832363))

(assert (=> d!106505 m!775447))

(declare-fun m!776283 () Bool)

(assert (=> d!106505 m!776283))

(declare-fun m!776285 () Bool)

(assert (=> d!106505 m!776285))

(declare-fun m!776287 () Bool)

(assert (=> b!832362 m!776287))

(declare-fun m!776289 () Bool)

(assert (=> b!832363 m!776289))

(assert (=> d!106179 d!106505))

(declare-fun b!832364 () Bool)

(declare-fun e!464202 () Bool)

(declare-fun lt!377659 () List!15949)

(assert (=> b!832364 (= e!464202 (contains!4191 lt!377659 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(declare-fun b!832365 () Bool)

(declare-fun res!566289 () Bool)

(assert (=> b!832365 (=> (not res!566289) (not e!464202))))

(assert (=> b!832365 (= res!566289 (containsKey!400 lt!377659 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832366 () Bool)

(declare-fun e!464204 () List!15949)

(declare-fun call!36420 () List!15949)

(assert (=> b!832366 (= e!464204 call!36420)))

(declare-fun bm!36417 () Bool)

(declare-fun c!90489 () Bool)

(declare-fun e!464206 () List!15949)

(declare-fun call!36422 () List!15949)

(assert (=> bm!36417 (= call!36422 ($colon$colon!536 e!464206 (ite c!90489 (h!17075 (toList!4505 lt!377308)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))))

(declare-fun c!90490 () Bool)

(assert (=> bm!36417 (= c!90490 c!90489)))

(declare-fun b!832368 () Bool)

(declare-fun e!464205 () List!15949)

(assert (=> b!832368 (= e!464205 call!36422)))

(declare-fun bm!36418 () Bool)

(declare-fun call!36421 () List!15949)

(assert (=> bm!36418 (= call!36421 call!36422)))

(declare-fun b!832369 () Bool)

(declare-fun e!464203 () List!15949)

(assert (=> b!832369 (= e!464203 call!36421)))

(declare-fun c!90492 () Bool)

(declare-fun c!90491 () Bool)

(declare-fun b!832370 () Bool)

(assert (=> b!832370 (= e!464206 (ite c!90492 (t!22308 (toList!4505 lt!377308)) (ite c!90491 (Cons!15945 (h!17075 (toList!4505 lt!377308)) (t!22308 (toList!4505 lt!377308))) Nil!15946)))))

(declare-fun b!832371 () Bool)

(assert (=> b!832371 (= e!464204 call!36420)))

(declare-fun bm!36419 () Bool)

(assert (=> bm!36419 (= call!36420 call!36421)))

(declare-fun b!832372 () Bool)

(assert (=> b!832372 (= e!464205 e!464203)))

(assert (=> b!832372 (= c!90492 (and ((_ is Cons!15945) (toList!4505 lt!377308)) (= (_1!5094 (h!17075 (toList!4505 lt!377308))) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(declare-fun b!832373 () Bool)

(assert (=> b!832373 (= e!464206 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377308)) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832367 () Bool)

(assert (=> b!832367 (= c!90491 (and ((_ is Cons!15945) (toList!4505 lt!377308)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377308))) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(assert (=> b!832367 (= e!464203 e!464204)))

(declare-fun d!106507 () Bool)

(assert (=> d!106507 e!464202))

(declare-fun res!566288 () Bool)

(assert (=> d!106507 (=> (not res!566288) (not e!464202))))

(assert (=> d!106507 (= res!566288 (isStrictlySorted!438 lt!377659))))

(assert (=> d!106507 (= lt!377659 e!464205)))

(assert (=> d!106507 (= c!90489 (and ((_ is Cons!15945) (toList!4505 lt!377308)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377308))) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(assert (=> d!106507 (isStrictlySorted!438 (toList!4505 lt!377308))))

(assert (=> d!106507 (= (insertStrictlySorted!270 (toList!4505 lt!377308) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377659)))

(assert (= (and d!106507 c!90489) b!832368))

(assert (= (and d!106507 (not c!90489)) b!832372))

(assert (= (and b!832372 c!90492) b!832369))

(assert (= (and b!832372 (not c!90492)) b!832367))

(assert (= (and b!832367 c!90491) b!832366))

(assert (= (and b!832367 (not c!90491)) b!832371))

(assert (= (or b!832366 b!832371) bm!36419))

(assert (= (or b!832369 bm!36419) bm!36418))

(assert (= (or b!832368 bm!36418) bm!36417))

(assert (= (and bm!36417 c!90490) b!832373))

(assert (= (and bm!36417 (not c!90490)) b!832370))

(assert (= (and d!106507 res!566288) b!832365))

(assert (= (and b!832365 res!566289) b!832364))

(declare-fun m!776291 () Bool)

(assert (=> b!832364 m!776291))

(declare-fun m!776293 () Bool)

(assert (=> d!106507 m!776293))

(declare-fun m!776295 () Bool)

(assert (=> d!106507 m!776295))

(declare-fun m!776297 () Bool)

(assert (=> b!832365 m!776297))

(declare-fun m!776299 () Bool)

(assert (=> bm!36417 m!776299))

(declare-fun m!776301 () Bool)

(assert (=> b!832373 m!776301))

(assert (=> d!106179 d!106507))

(declare-fun d!106509 () Bool)

(assert (=> d!106509 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23263 () Bool)

(assert (= bs!23263 d!106509))

(assert (=> bs!23263 m!775683))

(declare-fun m!776303 () Bool)

(assert (=> bs!23263 m!776303))

(assert (=> b!831994 d!106509))

(declare-fun b!832376 () Bool)

(declare-fun e!464208 () Option!420)

(assert (=> b!832376 (= e!464208 (getValueByKey!414 (t!22308 (toList!4505 lt!377250)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832377 () Bool)

(assert (=> b!832377 (= e!464208 None!418)))

(declare-fun d!106511 () Bool)

(declare-fun c!90493 () Bool)

(assert (=> d!106511 (= c!90493 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464207 () Option!420)

(assert (=> d!106511 (= (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000) e!464207)))

(declare-fun b!832375 () Bool)

(assert (=> b!832375 (= e!464207 e!464208)))

(declare-fun c!90494 () Bool)

(assert (=> b!832375 (= c!90494 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832374 () Bool)

(assert (=> b!832374 (= e!464207 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377250)))))))

(assert (= (and d!106511 c!90493) b!832374))

(assert (= (and d!106511 (not c!90493)) b!832375))

(assert (= (and b!832375 c!90494) b!832376))

(assert (= (and b!832375 (not c!90494)) b!832377))

(declare-fun m!776305 () Bool)

(assert (=> b!832376 m!776305))

(assert (=> b!831994 d!106511))

(declare-fun d!106513 () Bool)

(declare-fun e!464210 () Bool)

(assert (=> d!106513 e!464210))

(declare-fun res!566290 () Bool)

(assert (=> d!106513 (=> res!566290 e!464210)))

(declare-fun lt!377662 () Bool)

(assert (=> d!106513 (= res!566290 (not lt!377662))))

(declare-fun lt!377660 () Bool)

(assert (=> d!106513 (= lt!377662 lt!377660)))

(declare-fun lt!377663 () Unit!28447)

(declare-fun e!464209 () Unit!28447)

(assert (=> d!106513 (= lt!377663 e!464209)))

(declare-fun c!90495 () Bool)

(assert (=> d!106513 (= c!90495 lt!377660)))

(assert (=> d!106513 (= lt!377660 (containsKey!400 (toList!4505 lt!377306) lt!377312))))

(assert (=> d!106513 (= (contains!4190 lt!377306 lt!377312) lt!377662)))

(declare-fun b!832378 () Bool)

(declare-fun lt!377661 () Unit!28447)

(assert (=> b!832378 (= e!464209 lt!377661)))

(assert (=> b!832378 (= lt!377661 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377306) lt!377312))))

(assert (=> b!832378 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377306) lt!377312))))

(declare-fun b!832379 () Bool)

(declare-fun Unit!28482 () Unit!28447)

(assert (=> b!832379 (= e!464209 Unit!28482)))

(declare-fun b!832380 () Bool)

(assert (=> b!832380 (= e!464210 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377306) lt!377312)))))

(assert (= (and d!106513 c!90495) b!832378))

(assert (= (and d!106513 (not c!90495)) b!832379))

(assert (= (and d!106513 (not res!566290)) b!832380))

(declare-fun m!776307 () Bool)

(assert (=> d!106513 m!776307))

(declare-fun m!776309 () Bool)

(assert (=> b!832378 m!776309))

(assert (=> b!832378 m!775481))

(assert (=> b!832378 m!775481))

(declare-fun m!776311 () Bool)

(assert (=> b!832378 m!776311))

(assert (=> b!832380 m!775481))

(assert (=> b!832380 m!775481))

(assert (=> b!832380 m!776311))

(assert (=> d!106197 d!106513))

(assert (=> d!106197 d!106185))

(assert (=> d!106197 d!106187))

(assert (=> d!106197 d!106203))

(declare-fun d!106515 () Bool)

(assert (=> d!106515 (= (apply!373 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)) lt!377312) (apply!373 lt!377306 lt!377312))))

(assert (=> d!106515 true))

(declare-fun _$34!1151 () Unit!28447)

(assert (=> d!106515 (= (choose!1435 lt!377306 lt!377321 minValue!754 lt!377312) _$34!1151)))

(declare-fun bs!23264 () Bool)

(assert (= bs!23264 d!106515))

(assert (=> bs!23264 m!775105))

(assert (=> bs!23264 m!775105))

(assert (=> bs!23264 m!775123))

(assert (=> bs!23264 m!775129))

(assert (=> d!106197 d!106515))

(declare-fun b!832383 () Bool)

(declare-fun e!464212 () Option!420)

(assert (=> b!832383 (= e!464212 (getValueByKey!414 (t!22308 (t!22308 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832384 () Bool)

(assert (=> b!832384 (= e!464212 None!418)))

(declare-fun d!106517 () Bool)

(declare-fun c!90496 () Bool)

(assert (=> d!106517 (= c!90496 (and ((_ is Cons!15945) (t!22308 lt!377348)) (= (_1!5094 (h!17075 (t!22308 lt!377348))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464211 () Option!420)

(assert (=> d!106517 (= (getValueByKey!414 (t!22308 lt!377348) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464211)))

(declare-fun b!832382 () Bool)

(assert (=> b!832382 (= e!464211 e!464212)))

(declare-fun c!90497 () Bool)

(assert (=> b!832382 (= c!90497 (and ((_ is Cons!15945) (t!22308 lt!377348)) (not (= (_1!5094 (h!17075 (t!22308 lt!377348))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832381 () Bool)

(assert (=> b!832381 (= e!464211 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377348)))))))

(assert (= (and d!106517 c!90496) b!832381))

(assert (= (and d!106517 (not c!90496)) b!832382))

(assert (= (and b!832382 c!90497) b!832383))

(assert (= (and b!832382 (not c!90497)) b!832384))

(declare-fun m!776313 () Bool)

(assert (=> b!832383 m!776313))

(assert (=> b!831957 d!106517))

(declare-fun d!106519 () Bool)

(assert (=> d!106519 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106175 d!106519))

(assert (=> d!106175 d!106477))

(declare-fun d!106521 () Bool)

(assert (=> d!106521 (= (get!11831 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831787 d!106521))

(declare-fun b!832387 () Bool)

(declare-fun e!464214 () Option!420)

(assert (=> b!832387 (= e!464214 (getValueByKey!414 (t!22308 (toList!4505 lt!377447)) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))

(declare-fun b!832388 () Bool)

(assert (=> b!832388 (= e!464214 None!418)))

(declare-fun d!106523 () Bool)

(declare-fun c!90498 () Bool)

(assert (=> d!106523 (= c!90498 (and ((_ is Cons!15945) (toList!4505 lt!377447)) (= (_1!5094 (h!17075 (toList!4505 lt!377447))) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(declare-fun e!464213 () Option!420)

(assert (=> d!106523 (= (getValueByKey!414 (toList!4505 lt!377447) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))) e!464213)))

(declare-fun b!832386 () Bool)

(assert (=> b!832386 (= e!464213 e!464214)))

(declare-fun c!90499 () Bool)

(assert (=> b!832386 (= c!90499 (and ((_ is Cons!15945) (toList!4505 lt!377447)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377447))) (_1!5094 (tuple2!10167 lt!377313 zeroValueBefore!34))))))))

(declare-fun b!832385 () Bool)

(assert (=> b!832385 (= e!464213 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377447)))))))

(assert (= (and d!106523 c!90498) b!832385))

(assert (= (and d!106523 (not c!90498)) b!832386))

(assert (= (and b!832386 c!90499) b!832387))

(assert (= (and b!832386 (not c!90499)) b!832388))

(declare-fun m!776315 () Bool)

(assert (=> b!832387 m!776315))

(assert (=> b!831887 d!106523))

(declare-fun d!106525 () Bool)

(assert (=> d!106525 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23265 () Bool)

(assert (= bs!23265 d!106525))

(assert (=> bs!23265 m!775543))

(declare-fun m!776317 () Bool)

(assert (=> bs!23265 m!776317))

(assert (=> b!831911 d!106525))

(declare-fun b!832391 () Bool)

(declare-fun e!464216 () Option!420)

(assert (=> b!832391 (= e!464216 (getValueByKey!414 (t!22308 (toList!4505 lt!377318)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832392 () Bool)

(assert (=> b!832392 (= e!464216 None!418)))

(declare-fun d!106527 () Bool)

(declare-fun c!90500 () Bool)

(assert (=> d!106527 (= c!90500 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun e!464215 () Option!420)

(assert (=> d!106527 (= (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464215)))

(declare-fun b!832390 () Bool)

(assert (=> b!832390 (= e!464215 e!464216)))

(declare-fun c!90501 () Bool)

(assert (=> b!832390 (= c!90501 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377318))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832389 () Bool)

(assert (=> b!832389 (= e!464215 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377318)))))))

(assert (= (and d!106527 c!90500) b!832389))

(assert (= (and d!106527 (not c!90500)) b!832390))

(assert (= (and b!832390 c!90501) b!832391))

(assert (= (and b!832390 (not c!90501)) b!832392))

(assert (=> b!832391 m!775051))

(declare-fun m!776319 () Bool)

(assert (=> b!832391 m!776319))

(assert (=> b!831911 d!106527))

(declare-fun b!832395 () Bool)

(declare-fun e!464218 () Option!420)

(assert (=> b!832395 (= e!464218 (getValueByKey!414 (t!22308 (t!22308 lt!377360)) (_1!5094 lt!377164)))))

(declare-fun b!832396 () Bool)

(assert (=> b!832396 (= e!464218 None!418)))

(declare-fun d!106529 () Bool)

(declare-fun c!90502 () Bool)

(assert (=> d!106529 (= c!90502 (and ((_ is Cons!15945) (t!22308 lt!377360)) (= (_1!5094 (h!17075 (t!22308 lt!377360))) (_1!5094 lt!377164))))))

(declare-fun e!464217 () Option!420)

(assert (=> d!106529 (= (getValueByKey!414 (t!22308 lt!377360) (_1!5094 lt!377164)) e!464217)))

(declare-fun b!832394 () Bool)

(assert (=> b!832394 (= e!464217 e!464218)))

(declare-fun c!90503 () Bool)

(assert (=> b!832394 (= c!90503 (and ((_ is Cons!15945) (t!22308 lt!377360)) (not (= (_1!5094 (h!17075 (t!22308 lt!377360))) (_1!5094 lt!377164)))))))

(declare-fun b!832393 () Bool)

(assert (=> b!832393 (= e!464217 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377360)))))))

(assert (= (and d!106529 c!90502) b!832393))

(assert (= (and d!106529 (not c!90502)) b!832394))

(assert (= (and b!832394 c!90503) b!832395))

(assert (= (and b!832394 (not c!90503)) b!832396))

(declare-fun m!776321 () Bool)

(assert (=> b!832395 m!776321))

(assert (=> b!831816 d!106529))

(declare-fun d!106531 () Bool)

(assert (=> d!106531 (= ($colon$colon!536 e!463978 (ite c!90358 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))) (Cons!15945 (ite c!90358 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) e!463978))))

(assert (=> bm!36387 d!106531))

(declare-fun d!106533 () Bool)

(assert (=> d!106533 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377341) lt!377324)) (v!10095 (getValueByKey!414 (toList!4505 lt!377341) lt!377324)))))

(assert (=> d!106357 d!106533))

(declare-fun b!832399 () Bool)

(declare-fun e!464220 () Option!420)

(assert (=> b!832399 (= e!464220 (getValueByKey!414 (t!22308 (toList!4505 lt!377341)) lt!377324))))

(declare-fun b!832400 () Bool)

(assert (=> b!832400 (= e!464220 None!418)))

(declare-fun d!106535 () Bool)

(declare-fun c!90504 () Bool)

(assert (=> d!106535 (= c!90504 (and ((_ is Cons!15945) (toList!4505 lt!377341)) (= (_1!5094 (h!17075 (toList!4505 lt!377341))) lt!377324)))))

(declare-fun e!464219 () Option!420)

(assert (=> d!106535 (= (getValueByKey!414 (toList!4505 lt!377341) lt!377324) e!464219)))

(declare-fun b!832398 () Bool)

(assert (=> b!832398 (= e!464219 e!464220)))

(declare-fun c!90505 () Bool)

(assert (=> b!832398 (= c!90505 (and ((_ is Cons!15945) (toList!4505 lt!377341)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377341))) lt!377324))))))

(declare-fun b!832397 () Bool)

(assert (=> b!832397 (= e!464219 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377341)))))))

(assert (= (and d!106535 c!90504) b!832397))

(assert (= (and d!106535 (not c!90504)) b!832398))

(assert (= (and b!832398 c!90505) b!832399))

(assert (= (and b!832398 (not c!90505)) b!832400))

(declare-fun m!776323 () Bool)

(assert (=> b!832399 m!776323))

(assert (=> d!106357 d!106535))

(declare-fun d!106537 () Bool)

(declare-fun lt!377664 () Bool)

(assert (=> d!106537 (= lt!377664 (select (content!387 (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!464221 () Bool)

(assert (=> d!106537 (= lt!377664 e!464221)))

(declare-fun res!566292 () Bool)

(assert (=> d!106537 (=> (not res!566292) (not e!464221))))

(assert (=> d!106537 (= res!566292 ((_ is Cons!15946) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))

(assert (=> d!106537 (= (contains!4192 (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377664)))

(declare-fun b!832401 () Bool)

(declare-fun e!464222 () Bool)

(assert (=> b!832401 (= e!464221 e!464222)))

(declare-fun res!566291 () Bool)

(assert (=> b!832401 (=> res!566291 e!464222)))

(assert (=> b!832401 (= res!566291 (= (h!17076 (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832402 () Bool)

(assert (=> b!832402 (= e!464222 (contains!4192 (t!22309 (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106537 res!566292) b!832401))

(assert (= (and b!832401 (not res!566291)) b!832402))

(declare-fun m!776325 () Bool)

(assert (=> d!106537 m!776325))

(assert (=> d!106537 m!775407))

(declare-fun m!776327 () Bool)

(assert (=> d!106537 m!776327))

(assert (=> b!832402 m!775407))

(declare-fun m!776329 () Bool)

(assert (=> b!832402 m!776329))

(assert (=> b!832146 d!106537))

(declare-fun b!832405 () Bool)

(declare-fun e!464224 () Option!420)

(assert (=> b!832405 (= e!464224 (getValueByKey!414 (t!22308 (t!22308 lt!377217)) (_1!5094 lt!377161)))))

(declare-fun b!832406 () Bool)

(assert (=> b!832406 (= e!464224 None!418)))

(declare-fun d!106539 () Bool)

(declare-fun c!90506 () Bool)

(assert (=> d!106539 (= c!90506 (and ((_ is Cons!15945) (t!22308 lt!377217)) (= (_1!5094 (h!17075 (t!22308 lt!377217))) (_1!5094 lt!377161))))))

(declare-fun e!464223 () Option!420)

(assert (=> d!106539 (= (getValueByKey!414 (t!22308 lt!377217) (_1!5094 lt!377161)) e!464223)))

(declare-fun b!832404 () Bool)

(assert (=> b!832404 (= e!464223 e!464224)))

(declare-fun c!90507 () Bool)

(assert (=> b!832404 (= c!90507 (and ((_ is Cons!15945) (t!22308 lt!377217)) (not (= (_1!5094 (h!17075 (t!22308 lt!377217))) (_1!5094 lt!377161)))))))

(declare-fun b!832403 () Bool)

(assert (=> b!832403 (= e!464223 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377217)))))))

(assert (= (and d!106539 c!90506) b!832403))

(assert (= (and d!106539 (not c!90506)) b!832404))

(assert (= (and b!832404 c!90507) b!832405))

(assert (= (and b!832404 (not c!90507)) b!832406))

(declare-fun m!776331 () Bool)

(assert (=> b!832405 m!776331))

(assert (=> b!832123 d!106539))

(declare-fun b!832408 () Bool)

(declare-fun e!464227 () Bool)

(declare-fun e!464230 () Bool)

(assert (=> b!832408 (= e!464227 e!464230)))

(declare-fun c!90511 () Bool)

(declare-fun e!464229 () Bool)

(assert (=> b!832408 (= c!90511 e!464229)))

(declare-fun res!566295 () Bool)

(assert (=> b!832408 (=> (not res!566295) (not e!464229))))

(assert (=> b!832408 (= res!566295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832409 () Bool)

(declare-fun e!464231 () ListLongMap!8979)

(declare-fun e!464225 () ListLongMap!8979)

(assert (=> b!832409 (= e!464231 e!464225)))

(declare-fun c!90509 () Bool)

(assert (=> b!832409 (= c!90509 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun e!464226 () Bool)

(declare-fun lt!377668 () ListLongMap!8979)

(declare-fun b!832410 () Bool)

(assert (=> b!832410 (= e!464226 (= lt!377668 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!832411 () Bool)

(assert (=> b!832411 (= e!464230 e!464226)))

(declare-fun c!90508 () Bool)

(assert (=> b!832411 (= c!90508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832412 () Bool)

(declare-fun lt!377666 () Unit!28447)

(declare-fun lt!377667 () Unit!28447)

(assert (=> b!832412 (= lt!377666 lt!377667)))

(declare-fun lt!377670 () V!25283)

(declare-fun lt!377665 () (_ BitVec 64))

(declare-fun lt!377671 () (_ BitVec 64))

(declare-fun lt!377669 () ListLongMap!8979)

(assert (=> b!832412 (not (contains!4190 (+!2013 lt!377669 (tuple2!10167 lt!377665 lt!377670)) lt!377671))))

(assert (=> b!832412 (= lt!377667 (addStillNotContains!199 lt!377669 lt!377665 lt!377670 lt!377671))))

(assert (=> b!832412 (= lt!377671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832412 (= lt!377670 (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832412 (= lt!377665 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36423 () ListLongMap!8979)

(assert (=> b!832412 (= lt!377669 call!36423)))

(assert (=> b!832412 (= e!464225 (+!2013 call!36423 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36420 () Bool)

(assert (=> bm!36420 (= call!36423 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832413 () Bool)

(declare-fun res!566296 () Bool)

(assert (=> b!832413 (=> (not res!566296) (not e!464227))))

(assert (=> b!832413 (= res!566296 (not (contains!4190 lt!377668 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832414 () Bool)

(assert (=> b!832414 (= e!464231 (ListLongMap!8980 Nil!15946))))

(declare-fun b!832415 () Bool)

(assert (=> b!832415 (= e!464225 call!36423)))

(declare-fun b!832416 () Bool)

(assert (=> b!832416 (= e!464229 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!832416 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!106541 () Bool)

(assert (=> d!106541 e!464227))

(declare-fun res!566294 () Bool)

(assert (=> d!106541 (=> (not res!566294) (not e!464227))))

(assert (=> d!106541 (= res!566294 (not (contains!4190 lt!377668 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106541 (= lt!377668 e!464231)))

(declare-fun c!90510 () Bool)

(assert (=> d!106541 (= c!90510 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106541 (validMask!0 mask!1312)))

(assert (=> d!106541 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377668)))

(declare-fun b!832407 () Bool)

(assert (=> b!832407 (= e!464226 (isEmpty!662 lt!377668))))

(declare-fun b!832417 () Bool)

(assert (=> b!832417 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> b!832417 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22741 _values!788)))))

(declare-fun e!464228 () Bool)

(assert (=> b!832417 (= e!464228 (= (apply!373 lt!377668 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832418 () Bool)

(assert (=> b!832418 (= e!464230 e!464228)))

(assert (=> b!832418 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun res!566293 () Bool)

(assert (=> b!832418 (= res!566293 (contains!4190 lt!377668 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!832418 (=> (not res!566293) (not e!464228))))

(assert (= (and d!106541 c!90510) b!832414))

(assert (= (and d!106541 (not c!90510)) b!832409))

(assert (= (and b!832409 c!90509) b!832412))

(assert (= (and b!832409 (not c!90509)) b!832415))

(assert (= (or b!832412 b!832415) bm!36420))

(assert (= (and d!106541 res!566294) b!832413))

(assert (= (and b!832413 res!566296) b!832408))

(assert (= (and b!832408 res!566295) b!832416))

(assert (= (and b!832408 c!90511) b!832418))

(assert (= (and b!832408 (not c!90511)) b!832411))

(assert (= (and b!832418 res!566293) b!832417))

(assert (= (and b!832411 c!90508) b!832410))

(assert (= (and b!832411 (not c!90508)) b!832407))

(declare-fun b_lambda!11425 () Bool)

(assert (=> (not b_lambda!11425) (not b!832412)))

(assert (=> b!832412 t!22315))

(declare-fun b_and!22559 () Bool)

(assert (= b_and!22557 (and (=> t!22315 result!8013) b_and!22559)))

(declare-fun b_lambda!11427 () Bool)

(assert (=> (not b_lambda!11427) (not b!832417)))

(assert (=> b!832417 t!22315))

(declare-fun b_and!22561 () Bool)

(assert (= b_and!22559 (and (=> t!22315 result!8013) b_and!22561)))

(declare-fun m!776333 () Bool)

(assert (=> b!832412 m!776333))

(declare-fun m!776335 () Bool)

(assert (=> b!832412 m!776335))

(declare-fun m!776337 () Bool)

(assert (=> b!832412 m!776337))

(assert (=> b!832412 m!775043))

(declare-fun m!776339 () Bool)

(assert (=> b!832412 m!776339))

(declare-fun m!776341 () Bool)

(assert (=> b!832412 m!776341))

(declare-fun m!776343 () Bool)

(assert (=> b!832412 m!776343))

(assert (=> b!832412 m!776333))

(assert (=> b!832412 m!775043))

(declare-fun m!776345 () Bool)

(assert (=> b!832412 m!776345))

(assert (=> b!832412 m!776337))

(declare-fun m!776347 () Bool)

(assert (=> bm!36420 m!776347))

(declare-fun m!776349 () Bool)

(assert (=> b!832413 m!776349))

(assert (=> b!832418 m!776345))

(assert (=> b!832418 m!776345))

(declare-fun m!776351 () Bool)

(assert (=> b!832418 m!776351))

(declare-fun m!776353 () Bool)

(assert (=> d!106541 m!776353))

(assert (=> d!106541 m!774915))

(assert (=> b!832409 m!776345))

(assert (=> b!832409 m!776345))

(declare-fun m!776355 () Bool)

(assert (=> b!832409 m!776355))

(declare-fun m!776357 () Bool)

(assert (=> b!832407 m!776357))

(assert (=> b!832410 m!776347))

(assert (=> b!832417 m!775043))

(assert (=> b!832417 m!776337))

(assert (=> b!832417 m!775043))

(assert (=> b!832417 m!776339))

(assert (=> b!832417 m!776345))

(declare-fun m!776359 () Bool)

(assert (=> b!832417 m!776359))

(assert (=> b!832417 m!776345))

(assert (=> b!832417 m!776337))

(assert (=> b!832416 m!776345))

(assert (=> b!832416 m!776345))

(assert (=> b!832416 m!776355))

(assert (=> bm!36377 d!106541))

(declare-fun d!106543 () Bool)

(declare-fun e!464233 () Bool)

(assert (=> d!106543 e!464233))

(declare-fun res!566297 () Bool)

(assert (=> d!106543 (=> res!566297 e!464233)))

(declare-fun lt!377674 () Bool)

(assert (=> d!106543 (= res!566297 (not lt!377674))))

(declare-fun lt!377672 () Bool)

(assert (=> d!106543 (= lt!377674 lt!377672)))

(declare-fun lt!377675 () Unit!28447)

(declare-fun e!464232 () Unit!28447)

(assert (=> d!106543 (= lt!377675 e!464232)))

(declare-fun c!90512 () Bool)

(assert (=> d!106543 (= c!90512 lt!377672)))

(assert (=> d!106543 (= lt!377672 (containsKey!400 (toList!4505 lt!377547) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106543 (= (contains!4190 lt!377547 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377674)))

(declare-fun b!832419 () Bool)

(declare-fun lt!377673 () Unit!28447)

(assert (=> b!832419 (= e!464232 lt!377673)))

(assert (=> b!832419 (= lt!377673 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377547) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832419 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832420 () Bool)

(declare-fun Unit!28483 () Unit!28447)

(assert (=> b!832420 (= e!464232 Unit!28483)))

(declare-fun b!832421 () Bool)

(assert (=> b!832421 (= e!464233 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106543 c!90512) b!832419))

(assert (= (and d!106543 (not c!90512)) b!832420))

(assert (= (and d!106543 (not res!566297)) b!832421))

(declare-fun m!776361 () Bool)

(assert (=> d!106543 m!776361))

(declare-fun m!776363 () Bool)

(assert (=> b!832419 m!776363))

(declare-fun m!776365 () Bool)

(assert (=> b!832419 m!776365))

(assert (=> b!832419 m!776365))

(declare-fun m!776367 () Bool)

(assert (=> b!832419 m!776367))

(assert (=> b!832421 m!776365))

(assert (=> b!832421 m!776365))

(assert (=> b!832421 m!776367))

(assert (=> b!832096 d!106543))

(declare-fun d!106545 () Bool)

(assert (=> d!106545 (= (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))))

(declare-fun bs!23266 () Bool)

(assert (= bs!23266 d!106545))

(assert (=> bs!23266 m!775301))

(declare-fun m!776369 () Bool)

(assert (=> bs!23266 m!776369))

(assert (=> b!831800 d!106545))

(declare-fun b!832424 () Bool)

(declare-fun e!464235 () Option!420)

(assert (=> b!832424 (= e!464235 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) lt!377253))))

(declare-fun b!832425 () Bool)

(assert (=> b!832425 (= e!464235 None!418)))

(declare-fun d!106547 () Bool)

(declare-fun c!90513 () Bool)

(assert (=> d!106547 (= c!90513 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) lt!377253)))))

(declare-fun e!464234 () Option!420)

(assert (=> d!106547 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253) e!464234)))

(declare-fun b!832423 () Bool)

(assert (=> b!832423 (= e!464234 e!464235)))

(declare-fun c!90514 () Bool)

(assert (=> b!832423 (= c!90514 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) lt!377253))))))

(declare-fun b!832422 () Bool)

(assert (=> b!832422 (= e!464234 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))))))))

(assert (= (and d!106547 c!90513) b!832422))

(assert (= (and d!106547 (not c!90513)) b!832423))

(assert (= (and b!832423 c!90514) b!832424))

(assert (= (and b!832423 (not c!90514)) b!832425))

(declare-fun m!776371 () Bool)

(assert (=> b!832424 m!776371))

(assert (=> b!831800 d!106547))

(declare-fun d!106549 () Bool)

(declare-fun res!566298 () Bool)

(declare-fun e!464236 () Bool)

(assert (=> d!106549 (=> res!566298 e!464236)))

(assert (=> d!106549 (= res!566298 (and ((_ is Cons!15945) (toList!4505 lt!377257)) (= (_1!5094 (h!17075 (toList!4505 lt!377257))) (_1!5094 lt!377161))))))

(assert (=> d!106549 (= (containsKey!400 (toList!4505 lt!377257) (_1!5094 lt!377161)) e!464236)))

(declare-fun b!832426 () Bool)

(declare-fun e!464237 () Bool)

(assert (=> b!832426 (= e!464236 e!464237)))

(declare-fun res!566299 () Bool)

(assert (=> b!832426 (=> (not res!566299) (not e!464237))))

(assert (=> b!832426 (= res!566299 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377257))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377257))) (_1!5094 lt!377161))) ((_ is Cons!15945) (toList!4505 lt!377257)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377257))) (_1!5094 lt!377161))))))

(declare-fun b!832427 () Bool)

(assert (=> b!832427 (= e!464237 (containsKey!400 (t!22308 (toList!4505 lt!377257)) (_1!5094 lt!377161)))))

(assert (= (and d!106549 (not res!566298)) b!832426))

(assert (= (and b!832426 res!566299) b!832427))

(declare-fun m!776373 () Bool)

(assert (=> b!832427 m!776373))

(assert (=> d!106273 d!106549))

(declare-fun d!106551 () Bool)

(assert (=> d!106551 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377676 () Unit!28447)

(assert (=> d!106551 (= lt!377676 (choose!1436 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464238 () Bool)

(assert (=> d!106551 e!464238))

(declare-fun res!566300 () Bool)

(assert (=> d!106551 (=> (not res!566300) (not e!464238))))

(assert (=> d!106551 (= res!566300 (isStrictlySorted!438 (toList!4505 lt!377250)))))

(assert (=> d!106551 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377676)))

(declare-fun b!832428 () Bool)

(assert (=> b!832428 (= e!464238 (containsKey!400 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106551 res!566300) b!832428))

(assert (=> d!106551 m!775933))

(assert (=> d!106551 m!775933))

(assert (=> d!106551 m!775935))

(declare-fun m!776375 () Bool)

(assert (=> d!106551 m!776375))

(assert (=> d!106551 m!776109))

(assert (=> b!832428 m!775929))

(assert (=> b!832158 d!106551))

(declare-fun d!106553 () Bool)

(assert (=> d!106553 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23267 () Bool)

(assert (= bs!23267 d!106553))

(assert (=> bs!23267 m!775933))

(declare-fun m!776377 () Bool)

(assert (=> bs!23267 m!776377))

(assert (=> b!832158 d!106553))

(declare-fun b!832431 () Bool)

(declare-fun e!464240 () Option!420)

(assert (=> b!832431 (= e!464240 (getValueByKey!414 (t!22308 (toList!4505 lt!377250)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832432 () Bool)

(assert (=> b!832432 (= e!464240 None!418)))

(declare-fun d!106555 () Bool)

(declare-fun c!90515 () Bool)

(assert (=> d!106555 (= c!90515 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464239 () Option!420)

(assert (=> d!106555 (= (getValueByKey!414 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000) e!464239)))

(declare-fun b!832430 () Bool)

(assert (=> b!832430 (= e!464239 e!464240)))

(declare-fun c!90516 () Bool)

(assert (=> b!832430 (= c!90516 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832429 () Bool)

(assert (=> b!832429 (= e!464239 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377250)))))))

(assert (= (and d!106555 c!90515) b!832429))

(assert (= (and d!106555 (not c!90515)) b!832430))

(assert (= (and b!832430 c!90516) b!832431))

(assert (= (and b!832430 (not c!90516)) b!832432))

(declare-fun m!776379 () Bool)

(assert (=> b!832431 m!776379))

(assert (=> b!832158 d!106555))

(declare-fun d!106557 () Bool)

(assert (=> d!106557 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377677 () Unit!28447)

(assert (=> d!106557 (= lt!377677 (choose!1436 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464241 () Bool)

(assert (=> d!106557 e!464241))

(declare-fun res!566301 () Bool)

(assert (=> d!106557 (=> (not res!566301) (not e!464241))))

(assert (=> d!106557 (= res!566301 (isStrictlySorted!438 (toList!4505 lt!377349)))))

(assert (=> d!106557 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377677)))

(declare-fun b!832433 () Bool)

(assert (=> b!832433 (= e!464241 (containsKey!400 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106557 res!566301) b!832433))

(assert (=> d!106557 m!775199))

(assert (=> d!106557 m!775199))

(assert (=> d!106557 m!775617))

(declare-fun m!776381 () Bool)

(assert (=> d!106557 m!776381))

(declare-fun m!776383 () Bool)

(assert (=> d!106557 m!776383))

(assert (=> b!832433 m!775613))

(assert (=> b!831952 d!106557))

(declare-fun d!106559 () Bool)

(assert (=> d!106559 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23268 () Bool)

(assert (= bs!23268 d!106559))

(assert (=> bs!23268 m!775199))

(declare-fun m!776385 () Bool)

(assert (=> bs!23268 m!776385))

(assert (=> b!831952 d!106559))

(assert (=> b!831952 d!106255))

(declare-fun d!106561 () Bool)

(assert (=> d!106561 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(declare-fun lt!377678 () Unit!28447)

(assert (=> d!106561 (= lt!377678 (choose!1436 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(declare-fun e!464242 () Bool)

(assert (=> d!106561 e!464242))

(declare-fun res!566302 () Bool)

(assert (=> d!106561 (=> (not res!566302) (not e!464242))))

(assert (=> d!106561 (= res!566302 (isStrictlySorted!438 (toList!4505 lt!377218)))))

(assert (=> d!106561 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377218) (_1!5094 lt!377161)) lt!377678)))

(declare-fun b!832434 () Bool)

(assert (=> b!832434 (= e!464242 (containsKey!400 (toList!4505 lt!377218) (_1!5094 lt!377161)))))

(assert (= (and d!106561 res!566302) b!832434))

(assert (=> d!106561 m!775019))

(assert (=> d!106561 m!775019))

(assert (=> d!106561 m!775851))

(declare-fun m!776387 () Bool)

(assert (=> d!106561 m!776387))

(declare-fun m!776389 () Bool)

(assert (=> d!106561 m!776389))

(assert (=> b!832434 m!775847))

(assert (=> b!832118 d!106561))

(declare-fun d!106563 () Bool)

(assert (=> d!106563 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377218) (_1!5094 lt!377161)))))))

(declare-fun bs!23269 () Bool)

(assert (= bs!23269 d!106563))

(assert (=> bs!23269 m!775019))

(declare-fun m!776391 () Bool)

(assert (=> bs!23269 m!776391))

(assert (=> b!832118 d!106563))

(assert (=> b!832118 d!106307))

(declare-fun d!106565 () Bool)

(assert (=> d!106565 (= (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))))

(declare-fun bs!23270 () Bool)

(assert (= bs!23270 d!106565))

(assert (=> bs!23270 m!775465))

(declare-fun m!776393 () Bool)

(assert (=> bs!23270 m!776393))

(assert (=> b!831891 d!106565))

(declare-fun e!464244 () Option!420)

(declare-fun b!832437 () Bool)

(assert (=> b!832437 (= e!464244 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) lt!377310))))

(declare-fun b!832438 () Bool)

(assert (=> b!832438 (= e!464244 None!418)))

(declare-fun c!90517 () Bool)

(declare-fun d!106567 () Bool)

(assert (=> d!106567 (= c!90517 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) lt!377310)))))

(declare-fun e!464243 () Option!420)

(assert (=> d!106567 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310) e!464243)))

(declare-fun b!832436 () Bool)

(assert (=> b!832436 (= e!464243 e!464244)))

(declare-fun c!90518 () Bool)

(assert (=> b!832436 (= c!90518 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) lt!377310))))))

(declare-fun b!832435 () Bool)

(assert (=> b!832435 (= e!464243 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))))

(assert (= (and d!106567 c!90517) b!832435))

(assert (= (and d!106567 (not c!90517)) b!832436))

(assert (= (and b!832436 c!90518) b!832437))

(assert (= (and b!832436 (not c!90518)) b!832438))

(declare-fun m!776395 () Bool)

(assert (=> b!832437 m!776395))

(assert (=> b!831891 d!106567))

(declare-fun d!106569 () Bool)

(declare-fun c!90519 () Bool)

(assert (=> d!106569 (= c!90519 ((_ is Nil!15946) (toList!4505 lt!377357)))))

(declare-fun e!464245 () (InoxSet tuple2!10166))

(assert (=> d!106569 (= (content!386 (toList!4505 lt!377357)) e!464245)))

(declare-fun b!832439 () Bool)

(assert (=> b!832439 (= e!464245 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832440 () Bool)

(assert (=> b!832440 (= e!464245 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377357)) true) (content!386 (t!22308 (toList!4505 lt!377357)))))))

(assert (= (and d!106569 c!90519) b!832439))

(assert (= (and d!106569 (not c!90519)) b!832440))

(declare-fun m!776397 () Bool)

(assert (=> b!832440 m!776397))

(declare-fun m!776399 () Bool)

(assert (=> b!832440 m!776399))

(assert (=> d!106347 d!106569))

(declare-fun d!106571 () Bool)

(declare-fun res!566303 () Bool)

(declare-fun e!464246 () Bool)

(assert (=> d!106571 (=> res!566303 e!464246)))

(assert (=> d!106571 (= res!566303 (and ((_ is Cons!15945) (toList!4505 lt!377222)) (= (_1!5094 (h!17075 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106571 (= (containsKey!400 (toList!4505 lt!377222) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464246)))

(declare-fun b!832441 () Bool)

(declare-fun e!464247 () Bool)

(assert (=> b!832441 (= e!464246 e!464247)))

(declare-fun res!566304 () Bool)

(assert (=> b!832441 (=> (not res!566304) (not e!464247))))

(assert (=> b!832441 (= res!566304 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377222))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) (toList!4505 lt!377222)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832442 () Bool)

(assert (=> b!832442 (= e!464247 (containsKey!400 (t!22308 (toList!4505 lt!377222)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106571 (not res!566303)) b!832441))

(assert (= (and b!832441 res!566304) b!832442))

(declare-fun m!776401 () Bool)

(assert (=> b!832442 m!776401))

(assert (=> d!106287 d!106571))

(declare-fun d!106573 () Bool)

(declare-fun lt!377679 () Bool)

(assert (=> d!106573 (= lt!377679 (select (content!386 (t!22308 (toList!4505 lt!377361))) lt!377164))))

(declare-fun e!464249 () Bool)

(assert (=> d!106573 (= lt!377679 e!464249)))

(declare-fun res!566305 () Bool)

(assert (=> d!106573 (=> (not res!566305) (not e!464249))))

(assert (=> d!106573 (= res!566305 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377361))))))

(assert (=> d!106573 (= (contains!4191 (t!22308 (toList!4505 lt!377361)) lt!377164) lt!377679)))

(declare-fun b!832443 () Bool)

(declare-fun e!464248 () Bool)

(assert (=> b!832443 (= e!464249 e!464248)))

(declare-fun res!566306 () Bool)

(assert (=> b!832443 (=> res!566306 e!464248)))

(assert (=> b!832443 (= res!566306 (= (h!17075 (t!22308 (toList!4505 lt!377361))) lt!377164))))

(declare-fun b!832444 () Bool)

(assert (=> b!832444 (= e!464248 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377361))) lt!377164))))

(assert (= (and d!106573 res!566305) b!832443))

(assert (= (and b!832443 (not res!566306)) b!832444))

(assert (=> d!106573 m!776167))

(declare-fun m!776403 () Bool)

(assert (=> d!106573 m!776403))

(declare-fun m!776405 () Bool)

(assert (=> b!832444 m!776405))

(assert (=> b!832117 d!106573))

(declare-fun d!106575 () Bool)

(declare-fun e!464251 () Bool)

(assert (=> d!106575 e!464251))

(declare-fun res!566307 () Bool)

(assert (=> d!106575 (=> res!566307 e!464251)))

(declare-fun lt!377682 () Bool)

(assert (=> d!106575 (= res!566307 (not lt!377682))))

(declare-fun lt!377680 () Bool)

(assert (=> d!106575 (= lt!377682 lt!377680)))

(declare-fun lt!377683 () Unit!28447)

(declare-fun e!464250 () Unit!28447)

(assert (=> d!106575 (= lt!377683 e!464250)))

(declare-fun c!90520 () Bool)

(assert (=> d!106575 (= c!90520 lt!377680)))

(assert (=> d!106575 (= lt!377680 (containsKey!400 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(assert (=> d!106575 (= (contains!4190 lt!377615 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377682)))

(declare-fun b!832445 () Bool)

(declare-fun lt!377681 () Unit!28447)

(assert (=> b!832445 (= e!464250 lt!377681)))

(assert (=> b!832445 (= lt!377681 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(assert (=> b!832445 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832446 () Bool)

(declare-fun Unit!28484 () Unit!28447)

(assert (=> b!832446 (= e!464250 Unit!28484)))

(declare-fun b!832447 () Bool)

(assert (=> b!832447 (= e!464251 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(assert (= (and d!106575 c!90520) b!832445))

(assert (= (and d!106575 (not c!90520)) b!832446))

(assert (= (and d!106575 (not res!566307)) b!832447))

(declare-fun m!776407 () Bool)

(assert (=> d!106575 m!776407))

(declare-fun m!776409 () Bool)

(assert (=> b!832445 m!776409))

(assert (=> b!832445 m!776045))

(assert (=> b!832445 m!776045))

(declare-fun m!776411 () Bool)

(assert (=> b!832445 m!776411))

(assert (=> b!832447 m!776045))

(assert (=> b!832447 m!776045))

(assert (=> b!832447 m!776411))

(assert (=> d!106373 d!106575))

(declare-fun b!832450 () Bool)

(declare-fun e!464253 () Option!420)

(assert (=> b!832450 (= e!464253 (getValueByKey!414 (t!22308 lt!377614) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832451 () Bool)

(assert (=> b!832451 (= e!464253 None!418)))

(declare-fun c!90521 () Bool)

(declare-fun d!106577 () Bool)

(assert (=> d!106577 (= c!90521 (and ((_ is Cons!15945) lt!377614) (= (_1!5094 (h!17075 lt!377614)) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(declare-fun e!464252 () Option!420)

(assert (=> d!106577 (= (getValueByKey!414 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) e!464252)))

(declare-fun b!832449 () Bool)

(assert (=> b!832449 (= e!464252 e!464253)))

(declare-fun c!90522 () Bool)

(assert (=> b!832449 (= c!90522 (and ((_ is Cons!15945) lt!377614) (not (= (_1!5094 (h!17075 lt!377614)) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))))

(declare-fun b!832448 () Bool)

(assert (=> b!832448 (= e!464252 (Some!419 (_2!5094 (h!17075 lt!377614))))))

(assert (= (and d!106577 c!90521) b!832448))

(assert (= (and d!106577 (not c!90521)) b!832449))

(assert (= (and b!832449 c!90522) b!832450))

(assert (= (and b!832449 (not c!90522)) b!832451))

(declare-fun m!776413 () Bool)

(assert (=> b!832450 m!776413))

(assert (=> d!106373 d!106577))

(declare-fun d!106579 () Bool)

(assert (=> d!106579 (= (getValueByKey!414 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun lt!377684 () Unit!28447)

(assert (=> d!106579 (= lt!377684 (choose!1433 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun e!464254 () Bool)

(assert (=> d!106579 e!464254))

(declare-fun res!566308 () Bool)

(assert (=> d!106579 (=> (not res!566308) (not e!464254))))

(assert (=> d!106579 (= res!566308 (isStrictlySorted!438 lt!377614))))

(assert (=> d!106579 (= (lemmaContainsTupThenGetReturnValue!231 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377684)))

(declare-fun b!832452 () Bool)

(declare-fun res!566309 () Bool)

(assert (=> b!832452 (=> (not res!566309) (not e!464254))))

(assert (=> b!832452 (= res!566309 (containsKey!400 lt!377614 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832453 () Bool)

(assert (=> b!832453 (= e!464254 (contains!4191 lt!377614 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(assert (= (and d!106579 res!566308) b!832452))

(assert (= (and b!832452 res!566309) b!832453))

(assert (=> d!106579 m!776039))

(declare-fun m!776415 () Bool)

(assert (=> d!106579 m!776415))

(declare-fun m!776417 () Bool)

(assert (=> d!106579 m!776417))

(declare-fun m!776419 () Bool)

(assert (=> b!832452 m!776419))

(declare-fun m!776421 () Bool)

(assert (=> b!832453 m!776421))

(assert (=> d!106373 d!106579))

(declare-fun b!832454 () Bool)

(declare-fun e!464255 () Bool)

(declare-fun lt!377685 () List!15949)

(assert (=> b!832454 (= e!464255 (contains!4191 lt!377685 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(declare-fun b!832455 () Bool)

(declare-fun res!566311 () Bool)

(assert (=> b!832455 (=> (not res!566311) (not e!464255))))

(assert (=> b!832455 (= res!566311 (containsKey!400 lt!377685 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832456 () Bool)

(declare-fun e!464257 () List!15949)

(declare-fun call!36424 () List!15949)

(assert (=> b!832456 (= e!464257 call!36424)))

(declare-fun e!464259 () List!15949)

(declare-fun bm!36421 () Bool)

(declare-fun c!90523 () Bool)

(declare-fun call!36426 () List!15949)

(assert (=> bm!36421 (= call!36426 ($colon$colon!536 e!464259 (ite c!90523 (h!17075 (toList!4505 lt!377341)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))))

(declare-fun c!90524 () Bool)

(assert (=> bm!36421 (= c!90524 c!90523)))

(declare-fun b!832458 () Bool)

(declare-fun e!464258 () List!15949)

(assert (=> b!832458 (= e!464258 call!36426)))

(declare-fun bm!36422 () Bool)

(declare-fun call!36425 () List!15949)

(assert (=> bm!36422 (= call!36425 call!36426)))

(declare-fun b!832459 () Bool)

(declare-fun e!464256 () List!15949)

(assert (=> b!832459 (= e!464256 call!36425)))

(declare-fun c!90526 () Bool)

(declare-fun b!832460 () Bool)

(declare-fun c!90525 () Bool)

(assert (=> b!832460 (= e!464259 (ite c!90526 (t!22308 (toList!4505 lt!377341)) (ite c!90525 (Cons!15945 (h!17075 (toList!4505 lt!377341)) (t!22308 (toList!4505 lt!377341))) Nil!15946)))))

(declare-fun b!832461 () Bool)

(assert (=> b!832461 (= e!464257 call!36424)))

(declare-fun bm!36423 () Bool)

(assert (=> bm!36423 (= call!36424 call!36425)))

(declare-fun b!832462 () Bool)

(assert (=> b!832462 (= e!464258 e!464256)))

(assert (=> b!832462 (= c!90526 (and ((_ is Cons!15945) (toList!4505 lt!377341)) (= (_1!5094 (h!17075 (toList!4505 lt!377341))) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(declare-fun b!832463 () Bool)

(assert (=> b!832463 (= e!464259 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377341)) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832457 () Bool)

(assert (=> b!832457 (= c!90525 (and ((_ is Cons!15945) (toList!4505 lt!377341)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377341))) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(assert (=> b!832457 (= e!464256 e!464257)))

(declare-fun d!106581 () Bool)

(assert (=> d!106581 e!464255))

(declare-fun res!566310 () Bool)

(assert (=> d!106581 (=> (not res!566310) (not e!464255))))

(assert (=> d!106581 (= res!566310 (isStrictlySorted!438 lt!377685))))

(assert (=> d!106581 (= lt!377685 e!464258)))

(assert (=> d!106581 (= c!90523 (and ((_ is Cons!15945) (toList!4505 lt!377341)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377341))) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(assert (=> d!106581 (isStrictlySorted!438 (toList!4505 lt!377341))))

(assert (=> d!106581 (= (insertStrictlySorted!270 (toList!4505 lt!377341) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377685)))

(assert (= (and d!106581 c!90523) b!832458))

(assert (= (and d!106581 (not c!90523)) b!832462))

(assert (= (and b!832462 c!90526) b!832459))

(assert (= (and b!832462 (not c!90526)) b!832457))

(assert (= (and b!832457 c!90525) b!832456))

(assert (= (and b!832457 (not c!90525)) b!832461))

(assert (= (or b!832456 b!832461) bm!36423))

(assert (= (or b!832459 bm!36423) bm!36422))

(assert (= (or b!832458 bm!36422) bm!36421))

(assert (= (and bm!36421 c!90524) b!832463))

(assert (= (and bm!36421 (not c!90524)) b!832460))

(assert (= (and d!106581 res!566310) b!832455))

(assert (= (and b!832455 res!566311) b!832454))

(declare-fun m!776423 () Bool)

(assert (=> b!832454 m!776423))

(declare-fun m!776425 () Bool)

(assert (=> d!106581 m!776425))

(declare-fun m!776427 () Bool)

(assert (=> d!106581 m!776427))

(declare-fun m!776429 () Bool)

(assert (=> b!832455 m!776429))

(declare-fun m!776431 () Bool)

(assert (=> bm!36421 m!776431))

(declare-fun m!776433 () Bool)

(assert (=> b!832463 m!776433))

(assert (=> d!106373 d!106581))

(declare-fun d!106583 () Bool)

(declare-fun c!90527 () Bool)

(assert (=> d!106583 (= c!90527 ((_ is Nil!15946) (toList!4505 lt!377353)))))

(declare-fun e!464260 () (InoxSet tuple2!10166))

(assert (=> d!106583 (= (content!386 (toList!4505 lt!377353)) e!464260)))

(declare-fun b!832464 () Bool)

(assert (=> b!832464 (= e!464260 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832465 () Bool)

(assert (=> b!832465 (= e!464260 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377353)) true) (content!386 (t!22308 (toList!4505 lt!377353)))))))

(assert (= (and d!106583 c!90527) b!832464))

(assert (= (and d!106583 (not c!90527)) b!832465))

(declare-fun m!776435 () Bool)

(assert (=> b!832465 m!776435))

(declare-fun m!776437 () Bool)

(assert (=> b!832465 m!776437))

(assert (=> d!106343 d!106583))

(declare-fun d!106585 () Bool)

(declare-fun lt!377686 () Bool)

(assert (=> d!106585 (= lt!377686 (select (content!386 (toList!4505 lt!377582)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464262 () Bool)

(assert (=> d!106585 (= lt!377686 e!464262)))

(declare-fun res!566312 () Bool)

(assert (=> d!106585 (=> (not res!566312) (not e!464262))))

(assert (=> d!106585 (= res!566312 ((_ is Cons!15945) (toList!4505 lt!377582)))))

(assert (=> d!106585 (= (contains!4191 (toList!4505 lt!377582) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377686)))

(declare-fun b!832466 () Bool)

(declare-fun e!464261 () Bool)

(assert (=> b!832466 (= e!464262 e!464261)))

(declare-fun res!566313 () Bool)

(assert (=> b!832466 (=> res!566313 e!464261)))

(assert (=> b!832466 (= res!566313 (= (h!17075 (toList!4505 lt!377582)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832467 () Bool)

(assert (=> b!832467 (= e!464261 (contains!4191 (t!22308 (toList!4505 lt!377582)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106585 res!566312) b!832466))

(assert (= (and b!832466 (not res!566313)) b!832467))

(declare-fun m!776439 () Bool)

(assert (=> d!106585 m!776439))

(declare-fun m!776441 () Bool)

(assert (=> d!106585 m!776441))

(declare-fun m!776443 () Bool)

(assert (=> b!832467 m!776443))

(assert (=> b!832157 d!106585))

(declare-fun d!106587 () Bool)

(declare-fun lt!377687 () Bool)

(assert (=> d!106587 (= lt!377687 (select (content!386 lt!377496) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464264 () Bool)

(assert (=> d!106587 (= lt!377687 e!464264)))

(declare-fun res!566314 () Bool)

(assert (=> d!106587 (=> (not res!566314) (not e!464264))))

(assert (=> d!106587 (= res!566314 ((_ is Cons!15945) lt!377496))))

(assert (=> d!106587 (= (contains!4191 lt!377496 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377687)))

(declare-fun b!832468 () Bool)

(declare-fun e!464263 () Bool)

(assert (=> b!832468 (= e!464264 e!464263)))

(declare-fun res!566315 () Bool)

(assert (=> b!832468 (=> res!566315 e!464263)))

(assert (=> b!832468 (= res!566315 (= (h!17075 lt!377496) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832469 () Bool)

(assert (=> b!832469 (= e!464263 (contains!4191 (t!22308 lt!377496) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106587 res!566314) b!832468))

(assert (= (and b!832468 (not res!566315)) b!832469))

(declare-fun m!776445 () Bool)

(assert (=> d!106587 m!776445))

(declare-fun m!776447 () Bool)

(assert (=> d!106587 m!776447))

(declare-fun m!776449 () Bool)

(assert (=> b!832469 m!776449))

(assert (=> b!831961 d!106587))

(declare-fun d!106589 () Bool)

(declare-fun e!464266 () Bool)

(assert (=> d!106589 e!464266))

(declare-fun res!566316 () Bool)

(assert (=> d!106589 (=> res!566316 e!464266)))

(declare-fun lt!377690 () Bool)

(assert (=> d!106589 (= res!566316 (not lt!377690))))

(declare-fun lt!377688 () Bool)

(assert (=> d!106589 (= lt!377690 lt!377688)))

(declare-fun lt!377691 () Unit!28447)

(declare-fun e!464265 () Unit!28447)

(assert (=> d!106589 (= lt!377691 e!464265)))

(declare-fun c!90528 () Bool)

(assert (=> d!106589 (= c!90528 lt!377688)))

(assert (=> d!106589 (= lt!377688 (containsKey!400 (toList!4505 lt!377435) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106589 (= (contains!4190 lt!377435 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377690)))

(declare-fun b!832470 () Bool)

(declare-fun lt!377689 () Unit!28447)

(assert (=> b!832470 (= e!464265 lt!377689)))

(assert (=> b!832470 (= lt!377689 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377435) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832470 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832471 () Bool)

(declare-fun Unit!28485 () Unit!28447)

(assert (=> b!832471 (= e!464265 Unit!28485)))

(declare-fun b!832472 () Bool)

(assert (=> b!832472 (= e!464266 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106589 c!90528) b!832470))

(assert (= (and d!106589 (not c!90528)) b!832471))

(assert (= (and d!106589 (not res!566316)) b!832472))

(declare-fun m!776451 () Bool)

(assert (=> d!106589 m!776451))

(declare-fun m!776453 () Bool)

(assert (=> b!832470 m!776453))

(declare-fun m!776455 () Bool)

(assert (=> b!832470 m!776455))

(assert (=> b!832470 m!776455))

(declare-fun m!776457 () Bool)

(assert (=> b!832470 m!776457))

(assert (=> b!832472 m!776455))

(assert (=> b!832472 m!776455))

(assert (=> b!832472 m!776457))

(assert (=> d!106171 d!106589))

(assert (=> d!106171 d!106123))

(assert (=> b!832151 d!106403))

(assert (=> b!832151 d!106405))

(declare-fun d!106591 () Bool)

(declare-fun lt!377692 () Bool)

(assert (=> d!106591 (= lt!377692 (select (content!386 lt!377256) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464268 () Bool)

(assert (=> d!106591 (= lt!377692 e!464268)))

(declare-fun res!566317 () Bool)

(assert (=> d!106591 (=> (not res!566317) (not e!464268))))

(assert (=> d!106591 (= res!566317 ((_ is Cons!15945) lt!377256))))

(assert (=> d!106591 (= (contains!4191 lt!377256 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377692)))

(declare-fun b!832473 () Bool)

(declare-fun e!464267 () Bool)

(assert (=> b!832473 (= e!464268 e!464267)))

(declare-fun res!566318 () Bool)

(assert (=> b!832473 (=> res!566318 e!464267)))

(assert (=> b!832473 (= res!566318 (= (h!17075 lt!377256) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832474 () Bool)

(assert (=> b!832474 (= e!464267 (contains!4191 (t!22308 lt!377256) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106591 res!566317) b!832473))

(assert (= (and b!832473 (not res!566318)) b!832474))

(declare-fun m!776459 () Bool)

(assert (=> d!106591 m!776459))

(declare-fun m!776461 () Bool)

(assert (=> d!106591 m!776461))

(declare-fun m!776463 () Bool)

(assert (=> b!832474 m!776463))

(assert (=> b!832046 d!106591))

(declare-fun d!106593 () Bool)

(declare-fun res!566323 () Bool)

(declare-fun e!464273 () Bool)

(assert (=> d!106593 (=> res!566323 e!464273)))

(assert (=> d!106593 (= res!566323 (or ((_ is Nil!15946) lt!377486) ((_ is Nil!15946) (t!22308 lt!377486))))))

(assert (=> d!106593 (= (isStrictlySorted!438 lt!377486) e!464273)))

(declare-fun b!832479 () Bool)

(declare-fun e!464274 () Bool)

(assert (=> b!832479 (= e!464273 e!464274)))

(declare-fun res!566324 () Bool)

(assert (=> b!832479 (=> (not res!566324) (not e!464274))))

(assert (=> b!832479 (= res!566324 (bvslt (_1!5094 (h!17075 lt!377486)) (_1!5094 (h!17075 (t!22308 lt!377486)))))))

(declare-fun b!832480 () Bool)

(assert (=> b!832480 (= e!464274 (isStrictlySorted!438 (t!22308 lt!377486)))))

(assert (= (and d!106593 (not res!566323)) b!832479))

(assert (= (and b!832479 res!566324) b!832480))

(declare-fun m!776465 () Bool)

(assert (=> b!832480 m!776465))

(assert (=> d!106227 d!106593))

(declare-fun d!106595 () Bool)

(declare-fun res!566325 () Bool)

(declare-fun e!464275 () Bool)

(assert (=> d!106595 (=> res!566325 e!464275)))

(assert (=> d!106595 (= res!566325 (or ((_ is Nil!15946) (toList!4505 lt!377158)) ((_ is Nil!15946) (t!22308 (toList!4505 lt!377158)))))))

(assert (=> d!106595 (= (isStrictlySorted!438 (toList!4505 lt!377158)) e!464275)))

(declare-fun b!832481 () Bool)

(declare-fun e!464276 () Bool)

(assert (=> b!832481 (= e!464275 e!464276)))

(declare-fun res!566326 () Bool)

(assert (=> b!832481 (=> (not res!566326) (not e!464276))))

(assert (=> b!832481 (= res!566326 (bvslt (_1!5094 (h!17075 (toList!4505 lt!377158))) (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158))))))))

(declare-fun b!832482 () Bool)

(assert (=> b!832482 (= e!464276 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377158))))))

(assert (= (and d!106595 (not res!566325)) b!832481))

(assert (= (and b!832481 res!566326) b!832482))

(assert (=> b!832482 m!776125))

(assert (=> d!106227 d!106595))

(assert (=> b!832143 d!106385))

(assert (=> b!832143 d!106387))

(declare-fun d!106597 () Bool)

(declare-fun res!566327 () Bool)

(declare-fun e!464277 () Bool)

(assert (=> d!106597 (=> res!566327 e!464277)))

(assert (=> d!106597 (= res!566327 (and ((_ is Cons!15945) lt!377486) (= (_1!5094 (h!17075 lt!377486)) (_1!5094 lt!377161))))))

(assert (=> d!106597 (= (containsKey!400 lt!377486 (_1!5094 lt!377161)) e!464277)))

(declare-fun b!832483 () Bool)

(declare-fun e!464278 () Bool)

(assert (=> b!832483 (= e!464277 e!464278)))

(declare-fun res!566328 () Bool)

(assert (=> b!832483 (=> (not res!566328) (not e!464278))))

(assert (=> b!832483 (= res!566328 (and (or (not ((_ is Cons!15945) lt!377486)) (bvsle (_1!5094 (h!17075 lt!377486)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377486) (bvslt (_1!5094 (h!17075 lt!377486)) (_1!5094 lt!377161))))))

(declare-fun b!832484 () Bool)

(assert (=> b!832484 (= e!464278 (containsKey!400 (t!22308 lt!377486) (_1!5094 lt!377161)))))

(assert (= (and d!106597 (not res!566327)) b!832483))

(assert (= (and b!832483 res!566328) b!832484))

(declare-fun m!776467 () Bool)

(assert (=> b!832484 m!776467))

(assert (=> b!831941 d!106597))

(declare-fun d!106599 () Bool)

(declare-fun lt!377693 () Bool)

(assert (=> d!106599 (= lt!377693 (select (content!386 (toList!4505 lt!377382)) (tuple2!10167 lt!377247 lt!377252)))))

(declare-fun e!464280 () Bool)

(assert (=> d!106599 (= lt!377693 e!464280)))

(declare-fun res!566329 () Bool)

(assert (=> d!106599 (=> (not res!566329) (not e!464280))))

(assert (=> d!106599 (= res!566329 ((_ is Cons!15945) (toList!4505 lt!377382)))))

(assert (=> d!106599 (= (contains!4191 (toList!4505 lt!377382) (tuple2!10167 lt!377247 lt!377252)) lt!377693)))

(declare-fun b!832485 () Bool)

(declare-fun e!464279 () Bool)

(assert (=> b!832485 (= e!464280 e!464279)))

(declare-fun res!566330 () Bool)

(assert (=> b!832485 (=> res!566330 e!464279)))

(assert (=> b!832485 (= res!566330 (= (h!17075 (toList!4505 lt!377382)) (tuple2!10167 lt!377247 lt!377252)))))

(declare-fun b!832486 () Bool)

(assert (=> b!832486 (= e!464279 (contains!4191 (t!22308 (toList!4505 lt!377382)) (tuple2!10167 lt!377247 lt!377252)))))

(assert (= (and d!106599 res!566329) b!832485))

(assert (= (and b!832485 (not res!566330)) b!832486))

(declare-fun m!776469 () Bool)

(assert (=> d!106599 m!776469))

(declare-fun m!776471 () Bool)

(assert (=> d!106599 m!776471))

(declare-fun m!776473 () Bool)

(assert (=> b!832486 m!776473))

(assert (=> b!831781 d!106599))

(declare-fun b!832489 () Bool)

(declare-fun e!464282 () Option!420)

(assert (=> b!832489 (= e!464282 (getValueByKey!414 (t!22308 (toList!4505 lt!377430)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832490 () Bool)

(assert (=> b!832490 (= e!464282 None!418)))

(declare-fun d!106601 () Bool)

(declare-fun c!90529 () Bool)

(assert (=> d!106601 (= c!90529 (and ((_ is Cons!15945) (toList!4505 lt!377430)) (= (_1!5094 (h!17075 (toList!4505 lt!377430))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464281 () Option!420)

(assert (=> d!106601 (= (getValueByKey!414 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464281)))

(declare-fun b!832488 () Bool)

(assert (=> b!832488 (= e!464281 e!464282)))

(declare-fun c!90530 () Bool)

(assert (=> b!832488 (= c!90530 (and ((_ is Cons!15945) (toList!4505 lt!377430)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377430))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832487 () Bool)

(assert (=> b!832487 (= e!464281 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377430)))))))

(assert (= (and d!106601 c!90529) b!832487))

(assert (= (and d!106601 (not c!90529)) b!832488))

(assert (= (and b!832488 c!90530) b!832489))

(assert (= (and b!832488 (not c!90530)) b!832490))

(declare-fun m!776475 () Bool)

(assert (=> b!832489 m!776475))

(assert (=> b!831868 d!106601))

(declare-fun d!106603 () Bool)

(declare-fun res!566331 () Bool)

(declare-fun e!464283 () Bool)

(assert (=> d!106603 (=> res!566331 e!464283)))

(assert (=> d!106603 (= res!566331 (and ((_ is Cons!15945) lt!377352) (= (_1!5094 (h!17075 lt!377352)) (_1!5094 lt!377161))))))

(assert (=> d!106603 (= (containsKey!400 lt!377352 (_1!5094 lt!377161)) e!464283)))

(declare-fun b!832491 () Bool)

(declare-fun e!464284 () Bool)

(assert (=> b!832491 (= e!464283 e!464284)))

(declare-fun res!566332 () Bool)

(assert (=> b!832491 (=> (not res!566332) (not e!464284))))

(assert (=> b!832491 (= res!566332 (and (or (not ((_ is Cons!15945) lt!377352)) (bvsle (_1!5094 (h!17075 lt!377352)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377352) (bvslt (_1!5094 (h!17075 lt!377352)) (_1!5094 lt!377161))))))

(declare-fun b!832492 () Bool)

(assert (=> b!832492 (= e!464284 (containsKey!400 (t!22308 lt!377352) (_1!5094 lt!377161)))))

(assert (= (and d!106603 (not res!566331)) b!832491))

(assert (= (and b!832491 res!566332) b!832492))

(declare-fun m!776477 () Bool)

(assert (=> b!832492 m!776477))

(assert (=> b!831980 d!106603))

(declare-fun d!106605 () Bool)

(declare-fun lt!377694 () Bool)

(assert (=> d!106605 (= lt!377694 (select (content!386 lt!377565) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464286 () Bool)

(assert (=> d!106605 (= lt!377694 e!464286)))

(declare-fun res!566333 () Bool)

(assert (=> d!106605 (=> (not res!566333) (not e!464286))))

(assert (=> d!106605 (= res!566333 ((_ is Cons!15945) lt!377565))))

(assert (=> d!106605 (= (contains!4191 lt!377565 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377694)))

(declare-fun b!832493 () Bool)

(declare-fun e!464285 () Bool)

(assert (=> b!832493 (= e!464286 e!464285)))

(declare-fun res!566334 () Bool)

(assert (=> b!832493 (=> res!566334 e!464285)))

(assert (=> b!832493 (= res!566334 (= (h!17075 lt!377565) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832494 () Bool)

(assert (=> b!832494 (= e!464285 (contains!4191 (t!22308 lt!377565) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106605 res!566333) b!832493))

(assert (= (and b!832493 (not res!566334)) b!832494))

(declare-fun m!776479 () Bool)

(assert (=> d!106605 m!776479))

(declare-fun m!776481 () Bool)

(assert (=> d!106605 m!776481))

(declare-fun m!776483 () Bool)

(assert (=> b!832494 m!776483))

(assert (=> b!832127 d!106605))

(declare-fun d!106607 () Bool)

(assert (=> d!106607 (= (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!832092 d!106607))

(declare-fun b!832495 () Bool)

(declare-fun e!464289 () Bool)

(declare-fun e!464288 () Bool)

(assert (=> b!832495 (= e!464289 e!464288)))

(declare-fun c!90531 () Bool)

(assert (=> b!832495 (= c!90531 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832496 () Bool)

(declare-fun e!464290 () Bool)

(assert (=> b!832496 (= e!464290 e!464289)))

(declare-fun res!566336 () Bool)

(assert (=> b!832496 (=> (not res!566336) (not e!464289))))

(declare-fun e!464287 () Bool)

(assert (=> b!832496 (= res!566336 (not e!464287))))

(declare-fun res!566335 () Bool)

(assert (=> b!832496 (=> (not res!566335) (not e!464287))))

(assert (=> b!832496 (= res!566335 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!106609 () Bool)

(declare-fun res!566337 () Bool)

(assert (=> d!106609 (=> res!566337 e!464290)))

(assert (=> d!106609 (= res!566337 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106609 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90419 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))) e!464290)))

(declare-fun b!832497 () Bool)

(assert (=> b!832497 (= e!464287 (contains!4192 (ite c!90419 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832498 () Bool)

(declare-fun call!36427 () Bool)

(assert (=> b!832498 (= e!464288 call!36427)))

(declare-fun b!832499 () Bool)

(assert (=> b!832499 (= e!464288 call!36427)))

(declare-fun bm!36424 () Bool)

(assert (=> bm!36424 (= call!36427 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90531 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!90419 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))) (ite c!90419 (Cons!15946 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90300 (Cons!15946 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))))

(assert (= (and d!106609 (not res!566337)) b!832496))

(assert (= (and b!832496 res!566335) b!832497))

(assert (= (and b!832496 res!566336) b!832495))

(assert (= (and b!832495 c!90531) b!832498))

(assert (= (and b!832495 (not c!90531)) b!832499))

(assert (= (or b!832498 b!832499) bm!36424))

(assert (=> b!832495 m!776345))

(assert (=> b!832495 m!776345))

(assert (=> b!832495 m!776355))

(assert (=> b!832496 m!776345))

(assert (=> b!832496 m!776345))

(assert (=> b!832496 m!776355))

(assert (=> b!832497 m!776345))

(assert (=> b!832497 m!776345))

(declare-fun m!776485 () Bool)

(assert (=> b!832497 m!776485))

(assert (=> bm!36424 m!776345))

(declare-fun m!776487 () Bool)

(assert (=> bm!36424 m!776487))

(assert (=> bm!36400 d!106609))

(declare-fun b!832502 () Bool)

(declare-fun e!464292 () Option!420)

(assert (=> b!832502 (= e!464292 (getValueByKey!414 (t!22308 (toList!4505 lt!377462)) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832503 () Bool)

(assert (=> b!832503 (= e!464292 None!418)))

(declare-fun c!90532 () Bool)

(declare-fun d!106611 () Bool)

(assert (=> d!106611 (= c!90532 (and ((_ is Cons!15945) (toList!4505 lt!377462)) (= (_1!5094 (h!17075 (toList!4505 lt!377462))) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(declare-fun e!464291 () Option!420)

(assert (=> d!106611 (= (getValueByKey!414 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754))) e!464291)))

(declare-fun b!832501 () Bool)

(assert (=> b!832501 (= e!464291 e!464292)))

(declare-fun c!90533 () Bool)

(assert (=> b!832501 (= c!90533 (and ((_ is Cons!15945) (toList!4505 lt!377462)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377462))) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))))

(declare-fun b!832500 () Bool)

(assert (=> b!832500 (= e!464291 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377462)))))))

(assert (= (and d!106611 c!90532) b!832500))

(assert (= (and d!106611 (not c!90532)) b!832501))

(assert (= (and b!832501 c!90533) b!832502))

(assert (= (and b!832501 (not c!90533)) b!832503))

(declare-fun m!776489 () Bool)

(assert (=> b!832502 m!776489))

(assert (=> b!831895 d!106611))

(declare-fun d!106613 () Bool)

(declare-fun lt!377695 () Bool)

(assert (=> d!106613 (= lt!377695 (select (content!386 (toList!4505 lt!377443)) (tuple2!10167 lt!377315 zeroValueBefore!34)))))

(declare-fun e!464294 () Bool)

(assert (=> d!106613 (= lt!377695 e!464294)))

(declare-fun res!566338 () Bool)

(assert (=> d!106613 (=> (not res!566338) (not e!464294))))

(assert (=> d!106613 (= res!566338 ((_ is Cons!15945) (toList!4505 lt!377443)))))

(assert (=> d!106613 (= (contains!4191 (toList!4505 lt!377443) (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377695)))

(declare-fun b!832504 () Bool)

(declare-fun e!464293 () Bool)

(assert (=> b!832504 (= e!464294 e!464293)))

(declare-fun res!566339 () Bool)

(assert (=> b!832504 (=> res!566339 e!464293)))

(assert (=> b!832504 (= res!566339 (= (h!17075 (toList!4505 lt!377443)) (tuple2!10167 lt!377315 zeroValueBefore!34)))))

(declare-fun b!832505 () Bool)

(assert (=> b!832505 (= e!464293 (contains!4191 (t!22308 (toList!4505 lt!377443)) (tuple2!10167 lt!377315 zeroValueBefore!34)))))

(assert (= (and d!106613 res!566338) b!832504))

(assert (= (and b!832504 (not res!566339)) b!832505))

(declare-fun m!776491 () Bool)

(assert (=> d!106613 m!776491))

(declare-fun m!776493 () Bool)

(assert (=> d!106613 m!776493))

(declare-fun m!776495 () Bool)

(assert (=> b!832505 m!776495))

(assert (=> b!831886 d!106613))

(declare-fun d!106615 () Bool)

(assert (=> d!106615 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377696 () Unit!28447)

(assert (=> d!106615 (= lt!377696 (choose!1436 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464295 () Bool)

(assert (=> d!106615 e!464295))

(declare-fun res!566340 () Bool)

(assert (=> d!106615 (=> (not res!566340) (not e!464295))))

(assert (=> d!106615 (= res!566340 (isStrictlySorted!438 (toList!4505 lt!377340)))))

(assert (=> d!106615 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377696)))

(declare-fun b!832506 () Bool)

(assert (=> b!832506 (= e!464295 (containsKey!400 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106615 res!566340) b!832506))

(assert (=> d!106615 m!775051))

(assert (=> d!106615 m!775925))

(assert (=> d!106615 m!775925))

(assert (=> d!106615 m!776063))

(assert (=> d!106615 m!775051))

(declare-fun m!776497 () Bool)

(assert (=> d!106615 m!776497))

(declare-fun m!776499 () Bool)

(assert (=> d!106615 m!776499))

(assert (=> b!832506 m!775051))

(assert (=> b!832506 m!776059))

(assert (=> b!832181 d!106615))

(declare-fun d!106617 () Bool)

(assert (=> d!106617 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23271 () Bool)

(assert (= bs!23271 d!106617))

(assert (=> bs!23271 m!775925))

(declare-fun m!776501 () Bool)

(assert (=> bs!23271 m!776501))

(assert (=> b!832181 d!106617))

(assert (=> b!832181 d!106485))

(declare-fun d!106619 () Bool)

(declare-fun lt!377697 () Bool)

(assert (=> d!106619 (= lt!377697 (select (content!386 (t!22308 (toList!4505 lt!377365))) lt!377161))))

(declare-fun e!464297 () Bool)

(assert (=> d!106619 (= lt!377697 e!464297)))

(declare-fun res!566341 () Bool)

(assert (=> d!106619 (=> (not res!566341) (not e!464297))))

(assert (=> d!106619 (= res!566341 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377365))))))

(assert (=> d!106619 (= (contains!4191 (t!22308 (toList!4505 lt!377365)) lt!377161) lt!377697)))

(declare-fun b!832507 () Bool)

(declare-fun e!464296 () Bool)

(assert (=> b!832507 (= e!464297 e!464296)))

(declare-fun res!566342 () Bool)

(assert (=> b!832507 (=> res!566342 e!464296)))

(assert (=> b!832507 (= res!566342 (= (h!17075 (t!22308 (toList!4505 lt!377365))) lt!377161))))

(declare-fun b!832508 () Bool)

(assert (=> b!832508 (= e!464296 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377365))) lt!377161))))

(assert (= (and d!106619 res!566341) b!832507))

(assert (= (and b!832507 (not res!566342)) b!832508))

(declare-fun m!776503 () Bool)

(assert (=> d!106619 m!776503))

(declare-fun m!776505 () Bool)

(assert (=> d!106619 m!776505))

(declare-fun m!776507 () Bool)

(assert (=> b!832508 m!776507))

(assert (=> b!832138 d!106619))

(declare-fun d!106621 () Bool)

(declare-fun lt!377698 () Bool)

(assert (=> d!106621 (= lt!377698 (select (content!386 (t!22308 (toList!4505 lt!377257))) lt!377161))))

(declare-fun e!464299 () Bool)

(assert (=> d!106621 (= lt!377698 e!464299)))

(declare-fun res!566343 () Bool)

(assert (=> d!106621 (=> (not res!566343) (not e!464299))))

(assert (=> d!106621 (= res!566343 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377257))))))

(assert (=> d!106621 (= (contains!4191 (t!22308 (toList!4505 lt!377257)) lt!377161) lt!377698)))

(declare-fun b!832509 () Bool)

(declare-fun e!464298 () Bool)

(assert (=> b!832509 (= e!464299 e!464298)))

(declare-fun res!566344 () Bool)

(assert (=> b!832509 (=> res!566344 e!464298)))

(assert (=> b!832509 (= res!566344 (= (h!17075 (t!22308 (toList!4505 lt!377257))) lt!377161))))

(declare-fun b!832510 () Bool)

(assert (=> b!832510 (= e!464298 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377257))) lt!377161))))

(assert (= (and d!106621 res!566343) b!832509))

(assert (= (and b!832509 (not res!566344)) b!832510))

(declare-fun m!776509 () Bool)

(assert (=> d!106621 m!776509))

(declare-fun m!776511 () Bool)

(assert (=> d!106621 m!776511))

(declare-fun m!776513 () Bool)

(assert (=> b!832510 m!776513))

(assert (=> b!831972 d!106621))

(declare-fun d!106623 () Bool)

(declare-fun lt!377699 () Bool)

(assert (=> d!106623 (= lt!377699 (select (content!386 lt!377221) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464301 () Bool)

(assert (=> d!106623 (= lt!377699 e!464301)))

(declare-fun res!566345 () Bool)

(assert (=> d!106623 (=> (not res!566345) (not e!464301))))

(assert (=> d!106623 (= res!566345 ((_ is Cons!15945) lt!377221))))

(assert (=> d!106623 (= (contains!4191 lt!377221 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377699)))

(declare-fun b!832511 () Bool)

(declare-fun e!464300 () Bool)

(assert (=> b!832511 (= e!464301 e!464300)))

(declare-fun res!566346 () Bool)

(assert (=> b!832511 (=> res!566346 e!464300)))

(assert (=> b!832511 (= res!566346 (= (h!17075 lt!377221) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832512 () Bool)

(assert (=> b!832512 (= e!464300 (contains!4191 (t!22308 lt!377221) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106623 res!566345) b!832511))

(assert (= (and b!832511 (not res!566346)) b!832512))

(declare-fun m!776515 () Bool)

(assert (=> d!106623 m!776515))

(declare-fun m!776517 () Bool)

(assert (=> d!106623 m!776517))

(declare-fun m!776519 () Bool)

(assert (=> b!832512 m!776519))

(assert (=> b!832068 d!106623))

(declare-fun d!106625 () Bool)

(declare-fun e!464303 () Bool)

(assert (=> d!106625 e!464303))

(declare-fun res!566347 () Bool)

(assert (=> d!106625 (=> res!566347 e!464303)))

(declare-fun lt!377702 () Bool)

(assert (=> d!106625 (= res!566347 (not lt!377702))))

(declare-fun lt!377700 () Bool)

(assert (=> d!106625 (= lt!377702 lt!377700)))

(declare-fun lt!377703 () Unit!28447)

(declare-fun e!464302 () Unit!28447)

(assert (=> d!106625 (= lt!377703 e!464302)))

(declare-fun c!90534 () Bool)

(assert (=> d!106625 (= c!90534 lt!377700)))

(assert (=> d!106625 (= lt!377700 (containsKey!400 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(assert (=> d!106625 (= (contains!4190 lt!377382 (_1!5094 (tuple2!10167 lt!377247 lt!377252))) lt!377702)))

(declare-fun b!832513 () Bool)

(declare-fun lt!377701 () Unit!28447)

(assert (=> b!832513 (= e!464302 lt!377701)))

(assert (=> b!832513 (= lt!377701 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(assert (=> b!832513 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832514 () Bool)

(declare-fun Unit!28486 () Unit!28447)

(assert (=> b!832514 (= e!464302 Unit!28486)))

(declare-fun b!832515 () Bool)

(assert (=> b!832515 (= e!464303 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(assert (= (and d!106625 c!90534) b!832513))

(assert (= (and d!106625 (not c!90534)) b!832514))

(assert (= (and d!106625 (not res!566347)) b!832515))

(declare-fun m!776521 () Bool)

(assert (=> d!106625 m!776521))

(declare-fun m!776523 () Bool)

(assert (=> b!832513 m!776523))

(assert (=> b!832513 m!775285))

(assert (=> b!832513 m!775285))

(declare-fun m!776525 () Bool)

(assert (=> b!832513 m!776525))

(assert (=> b!832515 m!775285))

(assert (=> b!832515 m!775285))

(assert (=> b!832515 m!776525))

(assert (=> d!106139 d!106625))

(declare-fun e!464305 () Option!420)

(declare-fun b!832518 () Bool)

(assert (=> b!832518 (= e!464305 (getValueByKey!414 (t!22308 lt!377381) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832519 () Bool)

(assert (=> b!832519 (= e!464305 None!418)))

(declare-fun c!90535 () Bool)

(declare-fun d!106627 () Bool)

(assert (=> d!106627 (= c!90535 (and ((_ is Cons!15945) lt!377381) (= (_1!5094 (h!17075 lt!377381)) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(declare-fun e!464304 () Option!420)

(assert (=> d!106627 (= (getValueByKey!414 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252))) e!464304)))

(declare-fun b!832517 () Bool)

(assert (=> b!832517 (= e!464304 e!464305)))

(declare-fun c!90536 () Bool)

(assert (=> b!832517 (= c!90536 (and ((_ is Cons!15945) lt!377381) (not (= (_1!5094 (h!17075 lt!377381)) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))))

(declare-fun b!832516 () Bool)

(assert (=> b!832516 (= e!464304 (Some!419 (_2!5094 (h!17075 lt!377381))))))

(assert (= (and d!106627 c!90535) b!832516))

(assert (= (and d!106627 (not c!90535)) b!832517))

(assert (= (and b!832517 c!90536) b!832518))

(assert (= (and b!832517 (not c!90536)) b!832519))

(declare-fun m!776527 () Bool)

(assert (=> b!832518 m!776527))

(assert (=> d!106139 d!106627))

(declare-fun d!106629 () Bool)

(assert (=> d!106629 (= (getValueByKey!414 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252))) (Some!419 (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun lt!377704 () Unit!28447)

(assert (=> d!106629 (= lt!377704 (choose!1433 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun e!464306 () Bool)

(assert (=> d!106629 e!464306))

(declare-fun res!566348 () Bool)

(assert (=> d!106629 (=> (not res!566348) (not e!464306))))

(assert (=> d!106629 (= res!566348 (isStrictlySorted!438 lt!377381))))

(assert (=> d!106629 (= (lemmaContainsTupThenGetReturnValue!231 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))) lt!377704)))

(declare-fun b!832520 () Bool)

(declare-fun res!566349 () Bool)

(assert (=> b!832520 (=> (not res!566349) (not e!464306))))

(assert (=> b!832520 (= res!566349 (containsKey!400 lt!377381 (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832521 () Bool)

(assert (=> b!832521 (= e!464306 (contains!4191 lt!377381 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(assert (= (and d!106629 res!566348) b!832520))

(assert (= (and b!832520 res!566349) b!832521))

(assert (=> d!106629 m!775279))

(declare-fun m!776529 () Bool)

(assert (=> d!106629 m!776529))

(declare-fun m!776531 () Bool)

(assert (=> d!106629 m!776531))

(declare-fun m!776533 () Bool)

(assert (=> b!832520 m!776533))

(declare-fun m!776535 () Bool)

(assert (=> b!832521 m!776535))

(assert (=> d!106139 d!106629))

(declare-fun e!464307 () Bool)

(declare-fun lt!377705 () List!15949)

(declare-fun b!832522 () Bool)

(assert (=> b!832522 (= e!464307 (contains!4191 lt!377705 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(declare-fun b!832523 () Bool)

(declare-fun res!566351 () Bool)

(assert (=> b!832523 (=> (not res!566351) (not e!464307))))

(assert (=> b!832523 (= res!566351 (containsKey!400 lt!377705 (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832524 () Bool)

(declare-fun e!464309 () List!15949)

(declare-fun call!36428 () List!15949)

(assert (=> b!832524 (= e!464309 call!36428)))

(declare-fun bm!36425 () Bool)

(declare-fun e!464311 () List!15949)

(declare-fun call!36430 () List!15949)

(declare-fun c!90537 () Bool)

(assert (=> bm!36425 (= call!36430 ($colon$colon!536 e!464311 (ite c!90537 (h!17075 (toList!4505 lt!377251)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))))

(declare-fun c!90538 () Bool)

(assert (=> bm!36425 (= c!90538 c!90537)))

(declare-fun b!832526 () Bool)

(declare-fun e!464310 () List!15949)

(assert (=> b!832526 (= e!464310 call!36430)))

(declare-fun bm!36426 () Bool)

(declare-fun call!36429 () List!15949)

(assert (=> bm!36426 (= call!36429 call!36430)))

(declare-fun b!832527 () Bool)

(declare-fun e!464308 () List!15949)

(assert (=> b!832527 (= e!464308 call!36429)))

(declare-fun c!90539 () Bool)

(declare-fun c!90540 () Bool)

(declare-fun b!832528 () Bool)

(assert (=> b!832528 (= e!464311 (ite c!90540 (t!22308 (toList!4505 lt!377251)) (ite c!90539 (Cons!15945 (h!17075 (toList!4505 lt!377251)) (t!22308 (toList!4505 lt!377251))) Nil!15946)))))

(declare-fun b!832529 () Bool)

(assert (=> b!832529 (= e!464309 call!36428)))

(declare-fun bm!36427 () Bool)

(assert (=> bm!36427 (= call!36428 call!36429)))

(declare-fun b!832530 () Bool)

(assert (=> b!832530 (= e!464310 e!464308)))

(assert (=> b!832530 (= c!90540 (and ((_ is Cons!15945) (toList!4505 lt!377251)) (= (_1!5094 (h!17075 (toList!4505 lt!377251))) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(declare-fun b!832531 () Bool)

(assert (=> b!832531 (= e!464311 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377251)) (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832525 () Bool)

(assert (=> b!832525 (= c!90539 (and ((_ is Cons!15945) (toList!4505 lt!377251)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377251))) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(assert (=> b!832525 (= e!464308 e!464309)))

(declare-fun d!106631 () Bool)

(assert (=> d!106631 e!464307))

(declare-fun res!566350 () Bool)

(assert (=> d!106631 (=> (not res!566350) (not e!464307))))

(assert (=> d!106631 (= res!566350 (isStrictlySorted!438 lt!377705))))

(assert (=> d!106631 (= lt!377705 e!464310)))

(assert (=> d!106631 (= c!90537 (and ((_ is Cons!15945) (toList!4505 lt!377251)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377251))) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(assert (=> d!106631 (isStrictlySorted!438 (toList!4505 lt!377251))))

(assert (=> d!106631 (= (insertStrictlySorted!270 (toList!4505 lt!377251) (_1!5094 (tuple2!10167 lt!377247 lt!377252)) (_2!5094 (tuple2!10167 lt!377247 lt!377252))) lt!377705)))

(assert (= (and d!106631 c!90537) b!832526))

(assert (= (and d!106631 (not c!90537)) b!832530))

(assert (= (and b!832530 c!90540) b!832527))

(assert (= (and b!832530 (not c!90540)) b!832525))

(assert (= (and b!832525 c!90539) b!832524))

(assert (= (and b!832525 (not c!90539)) b!832529))

(assert (= (or b!832524 b!832529) bm!36427))

(assert (= (or b!832527 bm!36427) bm!36426))

(assert (= (or b!832526 bm!36426) bm!36425))

(assert (= (and bm!36425 c!90538) b!832531))

(assert (= (and bm!36425 (not c!90538)) b!832528))

(assert (= (and d!106631 res!566350) b!832523))

(assert (= (and b!832523 res!566351) b!832522))

(declare-fun m!776537 () Bool)

(assert (=> b!832522 m!776537))

(declare-fun m!776539 () Bool)

(assert (=> d!106631 m!776539))

(declare-fun m!776541 () Bool)

(assert (=> d!106631 m!776541))

(declare-fun m!776543 () Bool)

(assert (=> b!832523 m!776543))

(declare-fun m!776545 () Bool)

(assert (=> bm!36425 m!776545))

(declare-fun m!776547 () Bool)

(assert (=> b!832531 m!776547))

(assert (=> d!106139 d!106631))

(declare-fun d!106633 () Bool)

(declare-fun lt!377706 () Bool)

(assert (=> d!106633 (= lt!377706 (select (content!386 lt!377348) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464313 () Bool)

(assert (=> d!106633 (= lt!377706 e!464313)))

(declare-fun res!566352 () Bool)

(assert (=> d!106633 (=> (not res!566352) (not e!464313))))

(assert (=> d!106633 (= res!566352 ((_ is Cons!15945) lt!377348))))

(assert (=> d!106633 (= (contains!4191 lt!377348 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377706)))

(declare-fun b!832532 () Bool)

(declare-fun e!464312 () Bool)

(assert (=> b!832532 (= e!464313 e!464312)))

(declare-fun res!566353 () Bool)

(assert (=> b!832532 (=> res!566353 e!464312)))

(assert (=> b!832532 (= res!566353 (= (h!17075 lt!377348) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832533 () Bool)

(assert (=> b!832533 (= e!464312 (contains!4191 (t!22308 lt!377348) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106633 res!566352) b!832532))

(assert (= (and b!832532 (not res!566353)) b!832533))

(declare-fun m!776549 () Bool)

(assert (=> d!106633 m!776549))

(declare-fun m!776551 () Bool)

(assert (=> d!106633 m!776551))

(declare-fun m!776553 () Bool)

(assert (=> b!832533 m!776553))

(assert (=> b!831960 d!106633))

(declare-fun d!106635 () Bool)

(declare-fun e!464315 () Bool)

(assert (=> d!106635 e!464315))

(declare-fun res!566354 () Bool)

(assert (=> d!106635 (=> res!566354 e!464315)))

(declare-fun lt!377709 () Bool)

(assert (=> d!106635 (= res!566354 (not lt!377709))))

(declare-fun lt!377707 () Bool)

(assert (=> d!106635 (= lt!377709 lt!377707)))

(declare-fun lt!377710 () Unit!28447)

(declare-fun e!464314 () Unit!28447)

(assert (=> d!106635 (= lt!377710 e!464314)))

(declare-fun c!90541 () Bool)

(assert (=> d!106635 (= c!90541 lt!377707)))

(assert (=> d!106635 (= lt!377707 (containsKey!400 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(assert (=> d!106635 (= (contains!4190 lt!377443 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377709)))

(declare-fun b!832534 () Bool)

(declare-fun lt!377708 () Unit!28447)

(assert (=> b!832534 (= e!464314 lt!377708)))

(assert (=> b!832534 (= lt!377708 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(assert (=> b!832534 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832535 () Bool)

(declare-fun Unit!28487 () Unit!28447)

(assert (=> b!832535 (= e!464314 Unit!28487)))

(declare-fun b!832536 () Bool)

(assert (=> b!832536 (= e!464315 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(assert (= (and d!106635 c!90541) b!832534))

(assert (= (and d!106635 (not c!90541)) b!832535))

(assert (= (and d!106635 (not res!566354)) b!832536))

(declare-fun m!776555 () Bool)

(assert (=> d!106635 m!776555))

(declare-fun m!776557 () Bool)

(assert (=> b!832534 m!776557))

(assert (=> b!832534 m!775441))

(assert (=> b!832534 m!775441))

(declare-fun m!776559 () Bool)

(assert (=> b!832534 m!776559))

(assert (=> b!832536 m!775441))

(assert (=> b!832536 m!775441))

(assert (=> b!832536 m!776559))

(assert (=> d!106177 d!106635))

(declare-fun b!832539 () Bool)

(declare-fun e!464317 () Option!420)

(assert (=> b!832539 (= e!464317 (getValueByKey!414 (t!22308 lt!377442) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832540 () Bool)

(assert (=> b!832540 (= e!464317 None!418)))

(declare-fun d!106637 () Bool)

(declare-fun c!90542 () Bool)

(assert (=> d!106637 (= c!90542 (and ((_ is Cons!15945) lt!377442) (= (_1!5094 (h!17075 lt!377442)) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(declare-fun e!464316 () Option!420)

(assert (=> d!106637 (= (getValueByKey!414 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) e!464316)))

(declare-fun b!832538 () Bool)

(assert (=> b!832538 (= e!464316 e!464317)))

(declare-fun c!90543 () Bool)

(assert (=> b!832538 (= c!90543 (and ((_ is Cons!15945) lt!377442) (not (= (_1!5094 (h!17075 lt!377442)) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))))

(declare-fun b!832537 () Bool)

(assert (=> b!832537 (= e!464316 (Some!419 (_2!5094 (h!17075 lt!377442))))))

(assert (= (and d!106637 c!90542) b!832537))

(assert (= (and d!106637 (not c!90542)) b!832538))

(assert (= (and b!832538 c!90543) b!832539))

(assert (= (and b!832538 (not c!90543)) b!832540))

(declare-fun m!776561 () Bool)

(assert (=> b!832539 m!776561))

(assert (=> d!106177 d!106637))

(declare-fun d!106639 () Bool)

(assert (=> d!106639 (= (getValueByKey!414 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun lt!377711 () Unit!28447)

(assert (=> d!106639 (= lt!377711 (choose!1433 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun e!464318 () Bool)

(assert (=> d!106639 e!464318))

(declare-fun res!566355 () Bool)

(assert (=> d!106639 (=> (not res!566355) (not e!464318))))

(assert (=> d!106639 (= res!566355 (isStrictlySorted!438 lt!377442))))

(assert (=> d!106639 (= (lemmaContainsTupThenGetReturnValue!231 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377711)))

(declare-fun b!832541 () Bool)

(declare-fun res!566356 () Bool)

(assert (=> b!832541 (=> (not res!566356) (not e!464318))))

(assert (=> b!832541 (= res!566356 (containsKey!400 lt!377442 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832542 () Bool)

(assert (=> b!832542 (= e!464318 (contains!4191 lt!377442 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(assert (= (and d!106639 res!566355) b!832541))

(assert (= (and b!832541 res!566356) b!832542))

(assert (=> d!106639 m!775435))

(declare-fun m!776563 () Bool)

(assert (=> d!106639 m!776563))

(declare-fun m!776565 () Bool)

(assert (=> d!106639 m!776565))

(declare-fun m!776567 () Bool)

(assert (=> b!832541 m!776567))

(declare-fun m!776569 () Bool)

(assert (=> b!832542 m!776569))

(assert (=> d!106177 d!106639))

(declare-fun b!832543 () Bool)

(declare-fun lt!377712 () List!15949)

(declare-fun e!464319 () Bool)

(assert (=> b!832543 (= e!464319 (contains!4191 lt!377712 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(declare-fun b!832544 () Bool)

(declare-fun res!566358 () Bool)

(assert (=> b!832544 (=> (not res!566358) (not e!464319))))

(assert (=> b!832544 (= res!566358 (containsKey!400 lt!377712 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832545 () Bool)

(declare-fun e!464321 () List!15949)

(declare-fun call!36431 () List!15949)

(assert (=> b!832545 (= e!464321 call!36431)))

(declare-fun c!90544 () Bool)

(declare-fun bm!36428 () Bool)

(declare-fun call!36433 () List!15949)

(declare-fun e!464323 () List!15949)

(assert (=> bm!36428 (= call!36433 ($colon$colon!536 e!464323 (ite c!90544 (h!17075 (toList!4505 lt!377319)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))))

(declare-fun c!90545 () Bool)

(assert (=> bm!36428 (= c!90545 c!90544)))

(declare-fun b!832547 () Bool)

(declare-fun e!464322 () List!15949)

(assert (=> b!832547 (= e!464322 call!36433)))

(declare-fun bm!36429 () Bool)

(declare-fun call!36432 () List!15949)

(assert (=> bm!36429 (= call!36432 call!36433)))

(declare-fun b!832548 () Bool)

(declare-fun e!464320 () List!15949)

(assert (=> b!832548 (= e!464320 call!36432)))

(declare-fun c!90546 () Bool)

(declare-fun b!832549 () Bool)

(declare-fun c!90547 () Bool)

(assert (=> b!832549 (= e!464323 (ite c!90547 (t!22308 (toList!4505 lt!377319)) (ite c!90546 (Cons!15945 (h!17075 (toList!4505 lt!377319)) (t!22308 (toList!4505 lt!377319))) Nil!15946)))))

(declare-fun b!832550 () Bool)

(assert (=> b!832550 (= e!464321 call!36431)))

(declare-fun bm!36430 () Bool)

(assert (=> bm!36430 (= call!36431 call!36432)))

(declare-fun b!832551 () Bool)

(assert (=> b!832551 (= e!464322 e!464320)))

(assert (=> b!832551 (= c!90547 (and ((_ is Cons!15945) (toList!4505 lt!377319)) (= (_1!5094 (h!17075 (toList!4505 lt!377319))) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(declare-fun b!832552 () Bool)

(assert (=> b!832552 (= e!464323 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377319)) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832546 () Bool)

(assert (=> b!832546 (= c!90546 (and ((_ is Cons!15945) (toList!4505 lt!377319)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377319))) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(assert (=> b!832546 (= e!464320 e!464321)))

(declare-fun d!106641 () Bool)

(assert (=> d!106641 e!464319))

(declare-fun res!566357 () Bool)

(assert (=> d!106641 (=> (not res!566357) (not e!464319))))

(assert (=> d!106641 (= res!566357 (isStrictlySorted!438 lt!377712))))

(assert (=> d!106641 (= lt!377712 e!464322)))

(assert (=> d!106641 (= c!90544 (and ((_ is Cons!15945) (toList!4505 lt!377319)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377319))) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(assert (=> d!106641 (isStrictlySorted!438 (toList!4505 lt!377319))))

(assert (=> d!106641 (= (insertStrictlySorted!270 (toList!4505 lt!377319) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)) (_2!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) lt!377712)))

(assert (= (and d!106641 c!90544) b!832547))

(assert (= (and d!106641 (not c!90544)) b!832551))

(assert (= (and b!832551 c!90547) b!832548))

(assert (= (and b!832551 (not c!90547)) b!832546))

(assert (= (and b!832546 c!90546) b!832545))

(assert (= (and b!832546 (not c!90546)) b!832550))

(assert (= (or b!832545 b!832550) bm!36430))

(assert (= (or b!832548 bm!36430) bm!36429))

(assert (= (or b!832547 bm!36429) bm!36428))

(assert (= (and bm!36428 c!90545) b!832552))

(assert (= (and bm!36428 (not c!90545)) b!832549))

(assert (= (and d!106641 res!566357) b!832544))

(assert (= (and b!832544 res!566358) b!832543))

(declare-fun m!776571 () Bool)

(assert (=> b!832543 m!776571))

(declare-fun m!776573 () Bool)

(assert (=> d!106641 m!776573))

(declare-fun m!776575 () Bool)

(assert (=> d!106641 m!776575))

(declare-fun m!776577 () Bool)

(assert (=> b!832544 m!776577))

(declare-fun m!776579 () Bool)

(assert (=> bm!36428 m!776579))

(declare-fun m!776581 () Bool)

(assert (=> b!832552 m!776581))

(assert (=> d!106177 d!106641))

(declare-fun d!106643 () Bool)

(declare-fun lt!377713 () Bool)

(assert (=> d!106643 (= lt!377713 (select (content!386 lt!377217) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464325 () Bool)

(assert (=> d!106643 (= lt!377713 e!464325)))

(declare-fun res!566359 () Bool)

(assert (=> d!106643 (=> (not res!566359) (not e!464325))))

(assert (=> d!106643 (= res!566359 ((_ is Cons!15945) lt!377217))))

(assert (=> d!106643 (= (contains!4191 lt!377217 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377713)))

(declare-fun b!832553 () Bool)

(declare-fun e!464324 () Bool)

(assert (=> b!832553 (= e!464325 e!464324)))

(declare-fun res!566360 () Bool)

(assert (=> b!832553 (=> res!566360 e!464324)))

(assert (=> b!832553 (= res!566360 (= (h!17075 lt!377217) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832554 () Bool)

(assert (=> b!832554 (= e!464324 (contains!4191 (t!22308 lt!377217) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106643 res!566359) b!832553))

(assert (= (and b!832553 (not res!566360)) b!832554))

(declare-fun m!776583 () Bool)

(assert (=> d!106643 m!776583))

(declare-fun m!776585 () Bool)

(assert (=> d!106643 m!776585))

(declare-fun m!776587 () Bool)

(assert (=> b!832554 m!776587))

(assert (=> b!832126 d!106643))

(declare-fun d!106645 () Bool)

(declare-fun res!566361 () Bool)

(declare-fun e!464326 () Bool)

(assert (=> d!106645 (=> res!566361 e!464326)))

(assert (=> d!106645 (= res!566361 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106645 (= (containsKey!400 (toList!4505 lt!377340) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464326)))

(declare-fun b!832555 () Bool)

(declare-fun e!464327 () Bool)

(assert (=> b!832555 (= e!464326 e!464327)))

(declare-fun res!566362 () Bool)

(assert (=> b!832555 (=> (not res!566362) (not e!464327))))

(assert (=> b!832555 (= res!566362 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377340))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377340))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377340)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377340))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832556 () Bool)

(assert (=> b!832556 (= e!464327 (containsKey!400 (t!22308 (toList!4505 lt!377340)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106645 (not res!566361)) b!832555))

(assert (= (and b!832555 res!566362) b!832556))

(assert (=> b!832556 m!775051))

(declare-fun m!776589 () Bool)

(assert (=> b!832556 m!776589))

(assert (=> d!106381 d!106645))

(declare-fun d!106647 () Bool)

(declare-fun lt!377714 () Bool)

(assert (=> d!106647 (= lt!377714 (select (content!386 lt!377486) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464329 () Bool)

(assert (=> d!106647 (= lt!377714 e!464329)))

(declare-fun res!566363 () Bool)

(assert (=> d!106647 (=> (not res!566363) (not e!464329))))

(assert (=> d!106647 (= res!566363 ((_ is Cons!15945) lt!377486))))

(assert (=> d!106647 (= (contains!4191 lt!377486 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377714)))

(declare-fun b!832557 () Bool)

(declare-fun e!464328 () Bool)

(assert (=> b!832557 (= e!464329 e!464328)))

(declare-fun res!566364 () Bool)

(assert (=> b!832557 (=> res!566364 e!464328)))

(assert (=> b!832557 (= res!566364 (= (h!17075 lt!377486) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832558 () Bool)

(assert (=> b!832558 (= e!464328 (contains!4191 (t!22308 lt!377486) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106647 res!566363) b!832557))

(assert (= (and b!832557 (not res!566364)) b!832558))

(declare-fun m!776591 () Bool)

(assert (=> d!106647 m!776591))

(declare-fun m!776593 () Bool)

(assert (=> d!106647 m!776593))

(declare-fun m!776595 () Bool)

(assert (=> b!832558 m!776595))

(assert (=> b!831940 d!106647))

(declare-fun b!832561 () Bool)

(declare-fun e!464331 () Option!420)

(assert (=> b!832561 (= e!464331 (getValueByKey!414 (t!22308 (toList!4505 lt!377382)) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))

(declare-fun b!832562 () Bool)

(assert (=> b!832562 (= e!464331 None!418)))

(declare-fun d!106649 () Bool)

(declare-fun c!90548 () Bool)

(assert (=> d!106649 (= c!90548 (and ((_ is Cons!15945) (toList!4505 lt!377382)) (= (_1!5094 (h!17075 (toList!4505 lt!377382))) (_1!5094 (tuple2!10167 lt!377247 lt!377252)))))))

(declare-fun e!464330 () Option!420)

(assert (=> d!106649 (= (getValueByKey!414 (toList!4505 lt!377382) (_1!5094 (tuple2!10167 lt!377247 lt!377252))) e!464330)))

(declare-fun b!832560 () Bool)

(assert (=> b!832560 (= e!464330 e!464331)))

(declare-fun c!90549 () Bool)

(assert (=> b!832560 (= c!90549 (and ((_ is Cons!15945) (toList!4505 lt!377382)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377382))) (_1!5094 (tuple2!10167 lt!377247 lt!377252))))))))

(declare-fun b!832559 () Bool)

(assert (=> b!832559 (= e!464330 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377382)))))))

(assert (= (and d!106649 c!90548) b!832559))

(assert (= (and d!106649 (not c!90548)) b!832560))

(assert (= (and b!832560 c!90549) b!832561))

(assert (= (and b!832560 (not c!90549)) b!832562))

(declare-fun m!776597 () Bool)

(assert (=> b!832561 m!776597))

(assert (=> b!831780 d!106649))

(declare-fun d!106651 () Bool)

(assert (=> d!106651 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(declare-fun lt!377715 () Unit!28447)

(assert (=> d!106651 (= lt!377715 (choose!1436 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(declare-fun e!464332 () Bool)

(assert (=> d!106651 e!464332))

(declare-fun res!566365 () Bool)

(assert (=> d!106651 (=> (not res!566365) (not e!464332))))

(assert (=> d!106651 (= res!566365 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(assert (=> d!106651 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332) lt!377715)))

(declare-fun b!832563 () Bool)

(assert (=> b!832563 (= e!464332 (containsKey!400 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))

(assert (= (and d!106651 res!566365) b!832563))

(assert (=> d!106651 m!776021))

(assert (=> d!106651 m!776021))

(assert (=> d!106651 m!776023))

(declare-fun m!776599 () Bool)

(assert (=> d!106651 m!776599))

(declare-fun m!776601 () Bool)

(assert (=> d!106651 m!776601))

(assert (=> b!832563 m!776017))

(assert (=> b!832173 d!106651))

(declare-fun d!106653 () Bool)

(assert (=> d!106653 (= (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332))))))

(declare-fun bs!23272 () Bool)

(assert (= bs!23272 d!106653))

(assert (=> bs!23272 m!776021))

(declare-fun m!776603 () Bool)

(assert (=> bs!23272 m!776603))

(assert (=> b!832173 d!106653))

(declare-fun b!832566 () Bool)

(declare-fun e!464334 () Option!420)

(assert (=> b!832566 (= e!464334 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) lt!377332))))

(declare-fun b!832567 () Bool)

(assert (=> b!832567 (= e!464334 None!418)))

(declare-fun c!90550 () Bool)

(declare-fun d!106655 () Bool)

(assert (=> d!106655 (= c!90550 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) lt!377332)))))

(declare-fun e!464333 () Option!420)

(assert (=> d!106655 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332) e!464333)))

(declare-fun b!832565 () Bool)

(assert (=> b!832565 (= e!464333 e!464334)))

(declare-fun c!90551 () Bool)

(assert (=> b!832565 (= c!90551 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) lt!377332))))))

(declare-fun b!832564 () Bool)

(assert (=> b!832564 (= e!464333 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))))

(assert (= (and d!106655 c!90550) b!832564))

(assert (= (and d!106655 (not c!90550)) b!832565))

(assert (= (and b!832565 c!90551) b!832566))

(assert (= (and b!832565 (not c!90551)) b!832567))

(declare-fun m!776605 () Bool)

(assert (=> b!832566 m!776605))

(assert (=> b!832173 d!106655))

(declare-fun d!106657 () Bool)

(declare-fun lt!377716 () Bool)

(assert (=> d!106657 (= lt!377716 (select (content!386 lt!377360) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun e!464336 () Bool)

(assert (=> d!106657 (= lt!377716 e!464336)))

(declare-fun res!566366 () Bool)

(assert (=> d!106657 (=> (not res!566366) (not e!464336))))

(assert (=> d!106657 (= res!566366 ((_ is Cons!15945) lt!377360))))

(assert (=> d!106657 (= (contains!4191 lt!377360 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) lt!377716)))

(declare-fun b!832568 () Bool)

(declare-fun e!464335 () Bool)

(assert (=> b!832568 (= e!464336 e!464335)))

(declare-fun res!566367 () Bool)

(assert (=> b!832568 (=> res!566367 e!464335)))

(assert (=> b!832568 (= res!566367 (= (h!17075 lt!377360) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!832569 () Bool)

(assert (=> b!832569 (= e!464335 (contains!4191 (t!22308 lt!377360) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!106657 res!566366) b!832568))

(assert (= (and b!832568 (not res!566367)) b!832569))

(declare-fun m!776607 () Bool)

(assert (=> d!106657 m!776607))

(declare-fun m!776609 () Bool)

(assert (=> d!106657 m!776609))

(declare-fun m!776611 () Bool)

(assert (=> b!832569 m!776611))

(assert (=> b!831823 d!106657))

(declare-fun d!106659 () Bool)

(declare-fun e!464338 () Bool)

(assert (=> d!106659 e!464338))

(declare-fun res!566368 () Bool)

(assert (=> d!106659 (=> res!566368 e!464338)))

(declare-fun lt!377719 () Bool)

(assert (=> d!106659 (= res!566368 (not lt!377719))))

(declare-fun lt!377717 () Bool)

(assert (=> d!106659 (= lt!377719 lt!377717)))

(declare-fun lt!377720 () Unit!28447)

(declare-fun e!464337 () Unit!28447)

(assert (=> d!106659 (= lt!377720 e!464337)))

(declare-fun c!90552 () Bool)

(assert (=> d!106659 (= c!90552 lt!377717)))

(assert (=> d!106659 (= lt!377717 (containsKey!400 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106659 (= (contains!4190 lt!377582 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377719)))

(declare-fun b!832570 () Bool)

(declare-fun lt!377718 () Unit!28447)

(assert (=> b!832570 (= e!464337 lt!377718)))

(assert (=> b!832570 (= lt!377718 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!832570 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832571 () Bool)

(declare-fun Unit!28488 () Unit!28447)

(assert (=> b!832571 (= e!464337 Unit!28488)))

(declare-fun b!832572 () Bool)

(assert (=> b!832572 (= e!464338 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106659 c!90552) b!832570))

(assert (= (and d!106659 (not c!90552)) b!832571))

(assert (= (and d!106659 (not res!566368)) b!832572))

(declare-fun m!776613 () Bool)

(assert (=> d!106659 m!776613))

(declare-fun m!776615 () Bool)

(assert (=> b!832570 m!776615))

(assert (=> b!832570 m!775921))

(assert (=> b!832570 m!775921))

(declare-fun m!776617 () Bool)

(assert (=> b!832570 m!776617))

(assert (=> b!832572 m!775921))

(assert (=> b!832572 m!775921))

(assert (=> b!832572 m!776617))

(assert (=> d!106337 d!106659))

(declare-fun b!832575 () Bool)

(declare-fun e!464340 () Option!420)

(assert (=> b!832575 (= e!464340 (getValueByKey!414 (t!22308 lt!377581) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832576 () Bool)

(assert (=> b!832576 (= e!464340 None!418)))

(declare-fun d!106661 () Bool)

(declare-fun c!90553 () Bool)

(assert (=> d!106661 (= c!90553 (and ((_ is Cons!15945) lt!377581) (= (_1!5094 (h!17075 lt!377581)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464339 () Option!420)

(assert (=> d!106661 (= (getValueByKey!414 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464339)))

(declare-fun b!832574 () Bool)

(assert (=> b!832574 (= e!464339 e!464340)))

(declare-fun c!90554 () Bool)

(assert (=> b!832574 (= c!90554 (and ((_ is Cons!15945) lt!377581) (not (= (_1!5094 (h!17075 lt!377581)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832573 () Bool)

(assert (=> b!832573 (= e!464339 (Some!419 (_2!5094 (h!17075 lt!377581))))))

(assert (= (and d!106661 c!90553) b!832573))

(assert (= (and d!106661 (not c!90553)) b!832574))

(assert (= (and b!832574 c!90554) b!832575))

(assert (= (and b!832574 (not c!90554)) b!832576))

(declare-fun m!776619 () Bool)

(assert (=> b!832575 m!776619))

(assert (=> d!106337 d!106661))

(declare-fun d!106663 () Bool)

(assert (=> d!106663 (= (getValueByKey!414 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377721 () Unit!28447)

(assert (=> d!106663 (= lt!377721 (choose!1433 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464341 () Bool)

(assert (=> d!106663 e!464341))

(declare-fun res!566369 () Bool)

(assert (=> d!106663 (=> (not res!566369) (not e!464341))))

(assert (=> d!106663 (= res!566369 (isStrictlySorted!438 lt!377581))))

(assert (=> d!106663 (= (lemmaContainsTupThenGetReturnValue!231 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377721)))

(declare-fun b!832577 () Bool)

(declare-fun res!566370 () Bool)

(assert (=> b!832577 (=> (not res!566370) (not e!464341))))

(assert (=> b!832577 (= res!566370 (containsKey!400 lt!377581 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832578 () Bool)

(assert (=> b!832578 (= e!464341 (contains!4191 lt!377581 (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106663 res!566369) b!832577))

(assert (= (and b!832577 res!566370) b!832578))

(assert (=> d!106663 m!775915))

(declare-fun m!776621 () Bool)

(assert (=> d!106663 m!776621))

(declare-fun m!776623 () Bool)

(assert (=> d!106663 m!776623))

(declare-fun m!776625 () Bool)

(assert (=> b!832577 m!776625))

(declare-fun m!776627 () Bool)

(assert (=> b!832578 m!776627))

(assert (=> d!106337 d!106663))

(declare-fun b!832579 () Bool)

(declare-fun e!464342 () Bool)

(declare-fun lt!377722 () List!15949)

(assert (=> b!832579 (= e!464342 (contains!4191 lt!377722 (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832580 () Bool)

(declare-fun res!566372 () Bool)

(assert (=> b!832580 (=> (not res!566372) (not e!464342))))

(assert (=> b!832580 (= res!566372 (containsKey!400 lt!377722 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832581 () Bool)

(declare-fun e!464344 () List!15949)

(declare-fun call!36434 () List!15949)

(assert (=> b!832581 (= e!464344 call!36434)))

(declare-fun c!90555 () Bool)

(declare-fun bm!36431 () Bool)

(declare-fun e!464346 () List!15949)

(declare-fun call!36436 () List!15949)

(assert (=> bm!36431 (= call!36436 ($colon$colon!536 e!464346 (ite c!90555 (h!17075 (toList!4505 call!36358)) (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90556 () Bool)

(assert (=> bm!36431 (= c!90556 c!90555)))

(declare-fun b!832583 () Bool)

(declare-fun e!464345 () List!15949)

(assert (=> b!832583 (= e!464345 call!36436)))

(declare-fun bm!36432 () Bool)

(declare-fun call!36435 () List!15949)

(assert (=> bm!36432 (= call!36435 call!36436)))

(declare-fun b!832584 () Bool)

(declare-fun e!464343 () List!15949)

(assert (=> b!832584 (= e!464343 call!36435)))

(declare-fun b!832585 () Bool)

(declare-fun c!90558 () Bool)

(declare-fun c!90557 () Bool)

(assert (=> b!832585 (= e!464346 (ite c!90558 (t!22308 (toList!4505 call!36358)) (ite c!90557 (Cons!15945 (h!17075 (toList!4505 call!36358)) (t!22308 (toList!4505 call!36358))) Nil!15946)))))

(declare-fun b!832586 () Bool)

(assert (=> b!832586 (= e!464344 call!36434)))

(declare-fun bm!36433 () Bool)

(assert (=> bm!36433 (= call!36434 call!36435)))

(declare-fun b!832587 () Bool)

(assert (=> b!832587 (= e!464345 e!464343)))

(assert (=> b!832587 (= c!90558 (and ((_ is Cons!15945) (toList!4505 call!36358)) (= (_1!5094 (h!17075 (toList!4505 call!36358))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832588 () Bool)

(assert (=> b!832588 (= e!464346 (insertStrictlySorted!270 (t!22308 (toList!4505 call!36358)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832582 () Bool)

(assert (=> b!832582 (= c!90557 (and ((_ is Cons!15945) (toList!4505 call!36358)) (bvsgt (_1!5094 (h!17075 (toList!4505 call!36358))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832582 (= e!464343 e!464344)))

(declare-fun d!106665 () Bool)

(assert (=> d!106665 e!464342))

(declare-fun res!566371 () Bool)

(assert (=> d!106665 (=> (not res!566371) (not e!464342))))

(assert (=> d!106665 (= res!566371 (isStrictlySorted!438 lt!377722))))

(assert (=> d!106665 (= lt!377722 e!464345)))

(assert (=> d!106665 (= c!90555 (and ((_ is Cons!15945) (toList!4505 call!36358)) (bvslt (_1!5094 (h!17075 (toList!4505 call!36358))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106665 (isStrictlySorted!438 (toList!4505 call!36358))))

(assert (=> d!106665 (= (insertStrictlySorted!270 (toList!4505 call!36358) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377722)))

(assert (= (and d!106665 c!90555) b!832583))

(assert (= (and d!106665 (not c!90555)) b!832587))

(assert (= (and b!832587 c!90558) b!832584))

(assert (= (and b!832587 (not c!90558)) b!832582))

(assert (= (and b!832582 c!90557) b!832581))

(assert (= (and b!832582 (not c!90557)) b!832586))

(assert (= (or b!832581 b!832586) bm!36433))

(assert (= (or b!832584 bm!36433) bm!36432))

(assert (= (or b!832583 bm!36432) bm!36431))

(assert (= (and bm!36431 c!90556) b!832588))

(assert (= (and bm!36431 (not c!90556)) b!832585))

(assert (= (and d!106665 res!566371) b!832580))

(assert (= (and b!832580 res!566372) b!832579))

(declare-fun m!776629 () Bool)

(assert (=> b!832579 m!776629))

(declare-fun m!776631 () Bool)

(assert (=> d!106665 m!776631))

(declare-fun m!776633 () Bool)

(assert (=> d!106665 m!776633))

(declare-fun m!776635 () Bool)

(assert (=> b!832580 m!776635))

(declare-fun m!776637 () Bool)

(assert (=> bm!36431 m!776637))

(declare-fun m!776639 () Bool)

(assert (=> b!832588 m!776639))

(assert (=> d!106337 d!106665))

(assert (=> b!832099 d!106607))

(declare-fun lt!377723 () Bool)

(declare-fun d!106667 () Bool)

(assert (=> d!106667 (= lt!377723 (select (content!386 (toList!4505 lt!377601)) (tuple2!10167 lt!377335 zeroValueAfter!34)))))

(declare-fun e!464348 () Bool)

(assert (=> d!106667 (= lt!377723 e!464348)))

(declare-fun res!566373 () Bool)

(assert (=> d!106667 (=> (not res!566373) (not e!464348))))

(assert (=> d!106667 (= res!566373 ((_ is Cons!15945) (toList!4505 lt!377601)))))

(assert (=> d!106667 (= (contains!4191 (toList!4505 lt!377601) (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377723)))

(declare-fun b!832589 () Bool)

(declare-fun e!464347 () Bool)

(assert (=> b!832589 (= e!464348 e!464347)))

(declare-fun res!566374 () Bool)

(assert (=> b!832589 (=> res!566374 e!464347)))

(assert (=> b!832589 (= res!566374 (= (h!17075 (toList!4505 lt!377601)) (tuple2!10167 lt!377335 zeroValueAfter!34)))))

(declare-fun b!832590 () Bool)

(assert (=> b!832590 (= e!464347 (contains!4191 (t!22308 (toList!4505 lt!377601)) (tuple2!10167 lt!377335 zeroValueAfter!34)))))

(assert (= (and d!106667 res!566373) b!832589))

(assert (= (and b!832589 (not res!566374)) b!832590))

(declare-fun m!776641 () Bool)

(assert (=> d!106667 m!776641))

(declare-fun m!776643 () Bool)

(assert (=> d!106667 m!776643))

(declare-fun m!776645 () Bool)

(assert (=> b!832590 m!776645))

(assert (=> b!832170 d!106667))

(declare-fun b!832593 () Bool)

(declare-fun e!464350 () Option!420)

(assert (=> b!832593 (= e!464350 (getValueByKey!414 (t!22308 (toList!4505 lt!377582)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832594 () Bool)

(assert (=> b!832594 (= e!464350 None!418)))

(declare-fun d!106669 () Bool)

(declare-fun c!90559 () Bool)

(assert (=> d!106669 (= c!90559 (and ((_ is Cons!15945) (toList!4505 lt!377582)) (= (_1!5094 (h!17075 (toList!4505 lt!377582))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464349 () Option!420)

(assert (=> d!106669 (= (getValueByKey!414 (toList!4505 lt!377582) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464349)))

(declare-fun b!832592 () Bool)

(assert (=> b!832592 (= e!464349 e!464350)))

(declare-fun c!90560 () Bool)

(assert (=> b!832592 (= c!90560 (and ((_ is Cons!15945) (toList!4505 lt!377582)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377582))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832591 () Bool)

(assert (=> b!832591 (= e!464349 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377582)))))))

(assert (= (and d!106669 c!90559) b!832591))

(assert (= (and d!106669 (not c!90559)) b!832592))

(assert (= (and b!832592 c!90560) b!832593))

(assert (= (and b!832592 (not c!90560)) b!832594))

(declare-fun m!776647 () Bool)

(assert (=> b!832593 m!776647))

(assert (=> b!832156 d!106669))

(declare-fun d!106671 () Bool)

(declare-fun e!464352 () Bool)

(assert (=> d!106671 e!464352))

(declare-fun res!566375 () Bool)

(assert (=> d!106671 (=> res!566375 e!464352)))

(declare-fun lt!377726 () Bool)

(assert (=> d!106671 (= res!566375 (not lt!377726))))

(declare-fun lt!377724 () Bool)

(assert (=> d!106671 (= lt!377726 lt!377724)))

(declare-fun lt!377727 () Unit!28447)

(declare-fun e!464351 () Unit!28447)

(assert (=> d!106671 (= lt!377727 e!464351)))

(declare-fun c!90561 () Bool)

(assert (=> d!106671 (= c!90561 lt!377724)))

(assert (=> d!106671 (= lt!377724 (containsKey!400 (toList!4505 lt!377547) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106671 (= (contains!4190 lt!377547 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377726)))

(declare-fun b!832595 () Bool)

(declare-fun lt!377725 () Unit!28447)

(assert (=> b!832595 (= e!464351 lt!377725)))

(assert (=> b!832595 (= lt!377725 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377547) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832595 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832596 () Bool)

(declare-fun Unit!28489 () Unit!28447)

(assert (=> b!832596 (= e!464351 Unit!28489)))

(declare-fun b!832597 () Bool)

(assert (=> b!832597 (= e!464352 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106671 c!90561) b!832595))

(assert (= (and d!106671 (not c!90561)) b!832596))

(assert (= (and d!106671 (not res!566375)) b!832597))

(declare-fun m!776649 () Bool)

(assert (=> d!106671 m!776649))

(declare-fun m!776651 () Bool)

(assert (=> b!832595 m!776651))

(declare-fun m!776653 () Bool)

(assert (=> b!832595 m!776653))

(assert (=> b!832595 m!776653))

(declare-fun m!776655 () Bool)

(assert (=> b!832595 m!776655))

(assert (=> b!832597 m!776653))

(assert (=> b!832597 m!776653))

(assert (=> b!832597 m!776655))

(assert (=> d!106303 d!106671))

(assert (=> d!106303 d!106123))

(declare-fun d!106673 () Bool)

(declare-fun res!566376 () Bool)

(declare-fun e!464353 () Bool)

(assert (=> d!106673 (=> res!566376 e!464353)))

(assert (=> d!106673 (= res!566376 (and ((_ is Cons!15945) lt!377256) (= (_1!5094 (h!17075 lt!377256)) (_1!5094 lt!377161))))))

(assert (=> d!106673 (= (containsKey!400 lt!377256 (_1!5094 lt!377161)) e!464353)))

(declare-fun b!832598 () Bool)

(declare-fun e!464354 () Bool)

(assert (=> b!832598 (= e!464353 e!464354)))

(declare-fun res!566377 () Bool)

(assert (=> b!832598 (=> (not res!566377) (not e!464354))))

(assert (=> b!832598 (= res!566377 (and (or (not ((_ is Cons!15945) lt!377256)) (bvsle (_1!5094 (h!17075 lt!377256)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377256) (bvslt (_1!5094 (h!17075 lt!377256)) (_1!5094 lt!377161))))))

(declare-fun b!832599 () Bool)

(assert (=> b!832599 (= e!464354 (containsKey!400 (t!22308 lt!377256) (_1!5094 lt!377161)))))

(assert (= (and d!106673 (not res!566376)) b!832598))

(assert (= (and b!832598 res!566377) b!832599))

(declare-fun m!776657 () Bool)

(assert (=> b!832599 m!776657))

(assert (=> b!832045 d!106673))

(declare-fun d!106675 () Bool)

(assert (=> d!106675 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(declare-fun lt!377728 () Unit!28447)

(assert (=> d!106675 (= lt!377728 (choose!1436 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(declare-fun e!464355 () Bool)

(assert (=> d!106675 e!464355))

(declare-fun res!566378 () Bool)

(assert (=> d!106675 (=> (not res!566378) (not e!464355))))

(assert (=> d!106675 (= res!566378 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))))))

(assert (=> d!106675 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246) lt!377728)))

(declare-fun b!832600 () Bool)

(assert (=> b!832600 (= e!464355 (containsKey!400 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))

(assert (= (and d!106675 res!566378) b!832600))

(assert (=> d!106675 m!775363))

(assert (=> d!106675 m!775363))

(assert (=> d!106675 m!775365))

(declare-fun m!776659 () Bool)

(assert (=> d!106675 m!776659))

(declare-fun m!776661 () Bool)

(assert (=> d!106675 m!776661))

(assert (=> b!832600 m!775359))

(assert (=> b!831863 d!106675))

(declare-fun d!106677 () Bool)

(assert (=> d!106677 (= (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246))))))

(declare-fun bs!23273 () Bool)

(assert (= bs!23273 d!106677))

(assert (=> bs!23273 m!775363))

(declare-fun m!776663 () Bool)

(assert (=> bs!23273 m!776663))

(assert (=> b!831863 d!106677))

(declare-fun e!464357 () Option!420)

(declare-fun b!832603 () Bool)

(assert (=> b!832603 (= e!464357 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) lt!377246))))

(declare-fun b!832604 () Bool)

(assert (=> b!832604 (= e!464357 None!418)))

(declare-fun d!106679 () Bool)

(declare-fun c!90562 () Bool)

(assert (=> d!106679 (= c!90562 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) lt!377246)))))

(declare-fun e!464356 () Option!420)

(assert (=> d!106679 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246) e!464356)))

(declare-fun b!832602 () Bool)

(assert (=> b!832602 (= e!464356 e!464357)))

(declare-fun c!90563 () Bool)

(assert (=> b!832602 (= c!90563 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) lt!377246))))))

(declare-fun b!832601 () Bool)

(assert (=> b!832601 (= e!464356 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))))))))

(assert (= (and d!106679 c!90562) b!832601))

(assert (= (and d!106679 (not c!90562)) b!832602))

(assert (= (and b!832602 c!90563) b!832603))

(assert (= (and b!832602 (not c!90563)) b!832604))

(declare-fun m!776665 () Bool)

(assert (=> b!832603 m!776665))

(assert (=> b!831863 d!106679))

(declare-fun d!106681 () Bool)

(declare-fun c!90564 () Bool)

(assert (=> d!106681 (= c!90564 ((_ is Nil!15946) (toList!4505 lt!377349)))))

(declare-fun e!464358 () (InoxSet tuple2!10166))

(assert (=> d!106681 (= (content!386 (toList!4505 lt!377349)) e!464358)))

(declare-fun b!832605 () Bool)

(assert (=> b!832605 (= e!464358 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832606 () Bool)

(assert (=> b!832606 (= e!464358 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377349)) true) (content!386 (t!22308 (toList!4505 lt!377349)))))))

(assert (= (and d!106681 c!90564) b!832605))

(assert (= (and d!106681 (not c!90564)) b!832606))

(declare-fun m!776667 () Bool)

(assert (=> b!832606 m!776667))

(assert (=> b!832606 m!776189))

(assert (=> d!106327 d!106681))

(assert (=> b!832040 d!106467))

(assert (=> b!832040 d!106313))

(assert (=> d!106353 d!106365))

(assert (=> d!106353 d!106355))

(declare-fun d!106683 () Bool)

(assert (=> d!106683 (contains!4190 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)) lt!377332)))

(assert (=> d!106683 true))

(declare-fun _$35!428 () Unit!28447)

(assert (=> d!106683 (= (choose!1434 lt!377330 lt!377335 zeroValueAfter!34 lt!377332) _$35!428)))

(declare-fun bs!23274 () Bool)

(assert (= bs!23274 d!106683))

(assert (=> bs!23274 m!775157))

(assert (=> bs!23274 m!775157))

(assert (=> bs!23274 m!775159))

(assert (=> d!106353 d!106683))

(declare-fun d!106685 () Bool)

(declare-fun e!464360 () Bool)

(assert (=> d!106685 e!464360))

(declare-fun res!566379 () Bool)

(assert (=> d!106685 (=> res!566379 e!464360)))

(declare-fun lt!377731 () Bool)

(assert (=> d!106685 (= res!566379 (not lt!377731))))

(declare-fun lt!377729 () Bool)

(assert (=> d!106685 (= lt!377731 lt!377729)))

(declare-fun lt!377732 () Unit!28447)

(declare-fun e!464359 () Unit!28447)

(assert (=> d!106685 (= lt!377732 e!464359)))

(declare-fun c!90565 () Bool)

(assert (=> d!106685 (= c!90565 lt!377729)))

(assert (=> d!106685 (= lt!377729 (containsKey!400 (toList!4505 lt!377330) lt!377332))))

(assert (=> d!106685 (= (contains!4190 lt!377330 lt!377332) lt!377731)))

(declare-fun b!832608 () Bool)

(declare-fun lt!377730 () Unit!28447)

(assert (=> b!832608 (= e!464359 lt!377730)))

(assert (=> b!832608 (= lt!377730 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377330) lt!377332))))

(assert (=> b!832608 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377330) lt!377332))))

(declare-fun b!832609 () Bool)

(declare-fun Unit!28490 () Unit!28447)

(assert (=> b!832609 (= e!464359 Unit!28490)))

(declare-fun b!832610 () Bool)

(assert (=> b!832610 (= e!464360 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377330) lt!377332)))))

(assert (= (and d!106685 c!90565) b!832608))

(assert (= (and d!106685 (not c!90565)) b!832609))

(assert (= (and d!106685 (not res!566379)) b!832610))

(declare-fun m!776669 () Bool)

(assert (=> d!106685 m!776669))

(declare-fun m!776671 () Bool)

(assert (=> b!832608 m!776671))

(declare-fun m!776673 () Bool)

(assert (=> b!832608 m!776673))

(assert (=> b!832608 m!776673))

(declare-fun m!776675 () Bool)

(assert (=> b!832608 m!776675))

(assert (=> b!832610 m!776673))

(assert (=> b!832610 m!776673))

(assert (=> b!832610 m!776675))

(assert (=> d!106353 d!106685))

(declare-fun b!832629 () Bool)

(declare-fun lt!377738 () SeekEntryResult!8741)

(assert (=> b!832629 (and (bvsge (index!37337 lt!377738) #b00000000000000000000000000000000) (bvslt (index!37337 lt!377738) (size!22740 _keys!976)))))

(declare-fun e!464372 () Bool)

(assert (=> b!832629 (= e!464372 (= (select (arr!22319 _keys!976) (index!37337 lt!377738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106687 () Bool)

(declare-fun e!464375 () Bool)

(assert (=> d!106687 e!464375))

(declare-fun c!90573 () Bool)

(assert (=> d!106687 (= c!90573 (and ((_ is Intermediate!8741) lt!377738) (undefined!9553 lt!377738)))))

(declare-fun e!464371 () SeekEntryResult!8741)

(assert (=> d!106687 (= lt!377738 e!464371)))

(declare-fun c!90572 () Bool)

(assert (=> d!106687 (= c!90572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!377737 () (_ BitVec 64))

(assert (=> d!106687 (= lt!377737 (select (arr!22319 _keys!976) (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!106687 (validMask!0 mask!1312)))

(assert (=> d!106687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377738)))

(declare-fun b!832630 () Bool)

(declare-fun e!464373 () SeekEntryResult!8741)

(assert (=> b!832630 (= e!464371 e!464373)))

(declare-fun c!90574 () Bool)

(assert (=> b!832630 (= c!90574 (or (= lt!377737 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!377737 lt!377737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832631 () Bool)

(assert (=> b!832631 (and (bvsge (index!37337 lt!377738) #b00000000000000000000000000000000) (bvslt (index!37337 lt!377738) (size!22740 _keys!976)))))

(declare-fun res!566388 () Bool)

(assert (=> b!832631 (= res!566388 (= (select (arr!22319 _keys!976) (index!37337 lt!377738)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832631 (=> res!566388 e!464372)))

(declare-fun e!464374 () Bool)

(assert (=> b!832631 (= e!464374 e!464372)))

(declare-fun b!832632 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!832632 (= e!464373 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000 mask!1312) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!832633 () Bool)

(assert (=> b!832633 (= e!464375 e!464374)))

(declare-fun res!566386 () Bool)

(assert (=> b!832633 (= res!566386 (and ((_ is Intermediate!8741) lt!377738) (not (undefined!9553 lt!377738)) (bvslt (x!70131 lt!377738) #b01111111111111111111111111111110) (bvsge (x!70131 lt!377738) #b00000000000000000000000000000000) (bvsge (x!70131 lt!377738) #b00000000000000000000000000000000)))))

(assert (=> b!832633 (=> (not res!566386) (not e!464374))))

(declare-fun b!832634 () Bool)

(assert (=> b!832634 (and (bvsge (index!37337 lt!377738) #b00000000000000000000000000000000) (bvslt (index!37337 lt!377738) (size!22740 _keys!976)))))

(declare-fun res!566387 () Bool)

(assert (=> b!832634 (= res!566387 (= (select (arr!22319 _keys!976) (index!37337 lt!377738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832634 (=> res!566387 e!464372)))

(declare-fun b!832635 () Bool)

(assert (=> b!832635 (= e!464371 (Intermediate!8741 true (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!832636 () Bool)

(assert (=> b!832636 (= e!464375 (bvsge (x!70131 lt!377738) #b01111111111111111111111111111110))))

(declare-fun b!832637 () Bool)

(assert (=> b!832637 (= e!464373 (Intermediate!8741 false (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(assert (= (and d!106687 c!90572) b!832635))

(assert (= (and d!106687 (not c!90572)) b!832630))

(assert (= (and b!832630 c!90574) b!832637))

(assert (= (and b!832630 (not c!90574)) b!832632))

(assert (= (and d!106687 c!90573) b!832636))

(assert (= (and d!106687 (not c!90573)) b!832633))

(assert (= (and b!832633 res!566386) b!832631))

(assert (= (and b!832631 (not res!566388)) b!832634))

(assert (= (and b!832634 (not res!566387)) b!832629))

(declare-fun m!776677 () Bool)

(assert (=> b!832631 m!776677))

(assert (=> d!106687 m!775701))

(declare-fun m!776679 () Bool)

(assert (=> d!106687 m!776679))

(assert (=> d!106687 m!774915))

(assert (=> b!832634 m!776677))

(assert (=> b!832632 m!775701))

(declare-fun m!776681 () Bool)

(assert (=> b!832632 m!776681))

(assert (=> b!832632 m!776681))

(assert (=> b!832632 m!775051))

(declare-fun m!776683 () Bool)

(assert (=> b!832632 m!776683))

(assert (=> b!832629 m!776677))

(assert (=> d!106263 d!106687))

(declare-fun d!106689 () Bool)

(declare-fun lt!377744 () (_ BitVec 32))

(declare-fun lt!377743 () (_ BitVec 32))

(assert (=> d!106689 (= lt!377744 (bvmul (bvxor lt!377743 (bvlshr lt!377743 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!106689 (= lt!377743 ((_ extract 31 0) (bvand (bvxor (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22319 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!106689 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!566389 (let ((h!17081 ((_ extract 31 0) (bvand (bvxor (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22319 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70141 (bvmul (bvxor h!17081 (bvlshr h!17081 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70141 (bvlshr x!70141 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!566389 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!566389 #b00000000000000000000000000000000))))))

(assert (=> d!106689 (= (toIndex!0 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!377744 (bvlshr lt!377744 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!106263 d!106689))

(assert (=> d!106263 d!106123))

(declare-fun d!106691 () Bool)

(declare-fun c!90575 () Bool)

(assert (=> d!106691 (= c!90575 ((_ is Nil!15946) (toList!4505 lt!377222)))))

(declare-fun e!464376 () (InoxSet tuple2!10166))

(assert (=> d!106691 (= (content!386 (toList!4505 lt!377222)) e!464376)))

(declare-fun b!832638 () Bool)

(assert (=> b!832638 (= e!464376 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832639 () Bool)

(assert (=> b!832639 (= e!464376 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377222)) true) (content!386 (t!22308 (toList!4505 lt!377222)))))))

(assert (= (and d!106691 c!90575) b!832638))

(assert (= (and d!106691 (not c!90575)) b!832639))

(declare-fun m!776685 () Bool)

(assert (=> b!832639 m!776685))

(declare-fun m!776687 () Bool)

(assert (=> b!832639 m!776687))

(assert (=> d!106161 d!106691))

(declare-fun d!106693 () Bool)

(assert (=> d!106693 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106241 d!106693))

(assert (=> d!106241 d!106429))

(declare-fun b!832642 () Bool)

(declare-fun e!464378 () Option!420)

(assert (=> b!832642 (= e!464378 (getValueByKey!414 (t!22308 (t!22308 lt!377356)) (_1!5094 lt!377164)))))

(declare-fun b!832643 () Bool)

(assert (=> b!832643 (= e!464378 None!418)))

(declare-fun d!106695 () Bool)

(declare-fun c!90576 () Bool)

(assert (=> d!106695 (= c!90576 (and ((_ is Cons!15945) (t!22308 lt!377356)) (= (_1!5094 (h!17075 (t!22308 lt!377356))) (_1!5094 lt!377164))))))

(declare-fun e!464377 () Option!420)

(assert (=> d!106695 (= (getValueByKey!414 (t!22308 lt!377356) (_1!5094 lt!377164)) e!464377)))

(declare-fun b!832641 () Bool)

(assert (=> b!832641 (= e!464377 e!464378)))

(declare-fun c!90577 () Bool)

(assert (=> b!832641 (= c!90577 (and ((_ is Cons!15945) (t!22308 lt!377356)) (not (= (_1!5094 (h!17075 (t!22308 lt!377356))) (_1!5094 lt!377164)))))))

(declare-fun b!832640 () Bool)

(assert (=> b!832640 (= e!464377 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377356)))))))

(assert (= (and d!106695 c!90576) b!832640))

(assert (= (and d!106695 (not c!90576)) b!832641))

(assert (= (and b!832641 c!90577) b!832642))

(assert (= (and b!832641 (not c!90577)) b!832643))

(declare-fun m!776689 () Bool)

(assert (=> b!832642 m!776689))

(assert (=> b!831917 d!106695))

(declare-fun d!106697 () Bool)

(declare-fun e!464380 () Bool)

(assert (=> d!106697 e!464380))

(declare-fun res!566390 () Bool)

(assert (=> d!106697 (=> res!566390 e!464380)))

(declare-fun lt!377747 () Bool)

(assert (=> d!106697 (= res!566390 (not lt!377747))))

(declare-fun lt!377745 () Bool)

(assert (=> d!106697 (= lt!377747 lt!377745)))

(declare-fun lt!377748 () Unit!28447)

(declare-fun e!464379 () Unit!28447)

(assert (=> d!106697 (= lt!377748 e!464379)))

(declare-fun c!90578 () Bool)

(assert (=> d!106697 (= c!90578 lt!377745)))

(assert (=> d!106697 (= lt!377745 (containsKey!400 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(assert (=> d!106697 (= (contains!4190 lt!377601 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377747)))

(declare-fun b!832644 () Bool)

(declare-fun lt!377746 () Unit!28447)

(assert (=> b!832644 (= e!464379 lt!377746)))

(assert (=> b!832644 (= lt!377746 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(assert (=> b!832644 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832645 () Bool)

(declare-fun Unit!28491 () Unit!28447)

(assert (=> b!832645 (= e!464379 Unit!28491)))

(declare-fun b!832646 () Bool)

(assert (=> b!832646 (= e!464380 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(assert (= (and d!106697 c!90578) b!832644))

(assert (= (and d!106697 (not c!90578)) b!832645))

(assert (= (and d!106697 (not res!566390)) b!832646))

(declare-fun m!776691 () Bool)

(assert (=> d!106697 m!776691))

(declare-fun m!776693 () Bool)

(assert (=> b!832644 m!776693))

(assert (=> b!832644 m!775989))

(assert (=> b!832644 m!775989))

(declare-fun m!776695 () Bool)

(assert (=> b!832644 m!776695))

(assert (=> b!832646 m!775989))

(assert (=> b!832646 m!775989))

(assert (=> b!832646 m!776695))

(assert (=> d!106355 d!106697))

(declare-fun b!832649 () Bool)

(declare-fun e!464382 () Option!420)

(assert (=> b!832649 (= e!464382 (getValueByKey!414 (t!22308 lt!377600) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832650 () Bool)

(assert (=> b!832650 (= e!464382 None!418)))

(declare-fun c!90579 () Bool)

(declare-fun d!106699 () Bool)

(assert (=> d!106699 (= c!90579 (and ((_ is Cons!15945) lt!377600) (= (_1!5094 (h!17075 lt!377600)) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(declare-fun e!464381 () Option!420)

(assert (=> d!106699 (= (getValueByKey!414 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) e!464381)))

(declare-fun b!832648 () Bool)

(assert (=> b!832648 (= e!464381 e!464382)))

(declare-fun c!90580 () Bool)

(assert (=> b!832648 (= c!90580 (and ((_ is Cons!15945) lt!377600) (not (= (_1!5094 (h!17075 lt!377600)) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))))

(declare-fun b!832647 () Bool)

(assert (=> b!832647 (= e!464381 (Some!419 (_2!5094 (h!17075 lt!377600))))))

(assert (= (and d!106699 c!90579) b!832647))

(assert (= (and d!106699 (not c!90579)) b!832648))

(assert (= (and b!832648 c!90580) b!832649))

(assert (= (and b!832648 (not c!90580)) b!832650))

(declare-fun m!776697 () Bool)

(assert (=> b!832649 m!776697))

(assert (=> d!106355 d!106699))

(declare-fun d!106701 () Bool)

(assert (=> d!106701 (= (getValueByKey!414 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun lt!377749 () Unit!28447)

(assert (=> d!106701 (= lt!377749 (choose!1433 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun e!464383 () Bool)

(assert (=> d!106701 e!464383))

(declare-fun res!566391 () Bool)

(assert (=> d!106701 (=> (not res!566391) (not e!464383))))

(assert (=> d!106701 (= res!566391 (isStrictlySorted!438 lt!377600))))

(assert (=> d!106701 (= (lemmaContainsTupThenGetReturnValue!231 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377749)))

(declare-fun b!832651 () Bool)

(declare-fun res!566392 () Bool)

(assert (=> b!832651 (=> (not res!566392) (not e!464383))))

(assert (=> b!832651 (= res!566392 (containsKey!400 lt!377600 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832652 () Bool)

(assert (=> b!832652 (= e!464383 (contains!4191 lt!377600 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(assert (= (and d!106701 res!566391) b!832651))

(assert (= (and b!832651 res!566392) b!832652))

(assert (=> d!106701 m!775983))

(declare-fun m!776699 () Bool)

(assert (=> d!106701 m!776699))

(declare-fun m!776701 () Bool)

(assert (=> d!106701 m!776701))

(declare-fun m!776703 () Bool)

(assert (=> b!832651 m!776703))

(declare-fun m!776705 () Bool)

(assert (=> b!832652 m!776705))

(assert (=> d!106355 d!106701))

(declare-fun b!832653 () Bool)

(declare-fun e!464384 () Bool)

(declare-fun lt!377750 () List!15949)

(assert (=> b!832653 (= e!464384 (contains!4191 lt!377750 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(declare-fun b!832654 () Bool)

(declare-fun res!566394 () Bool)

(assert (=> b!832654 (=> (not res!566394) (not e!464384))))

(assert (=> b!832654 (= res!566394 (containsKey!400 lt!377750 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832655 () Bool)

(declare-fun e!464386 () List!15949)

(declare-fun call!36437 () List!15949)

(assert (=> b!832655 (= e!464386 call!36437)))

(declare-fun call!36439 () List!15949)

(declare-fun bm!36434 () Bool)

(declare-fun c!90581 () Bool)

(declare-fun e!464388 () List!15949)

(assert (=> bm!36434 (= call!36439 ($colon$colon!536 e!464388 (ite c!90581 (h!17075 (toList!4505 lt!377330)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))))

(declare-fun c!90582 () Bool)

(assert (=> bm!36434 (= c!90582 c!90581)))

(declare-fun b!832657 () Bool)

(declare-fun e!464387 () List!15949)

(assert (=> b!832657 (= e!464387 call!36439)))

(declare-fun bm!36435 () Bool)

(declare-fun call!36438 () List!15949)

(assert (=> bm!36435 (= call!36438 call!36439)))

(declare-fun b!832658 () Bool)

(declare-fun e!464385 () List!15949)

(assert (=> b!832658 (= e!464385 call!36438)))

(declare-fun b!832659 () Bool)

(declare-fun c!90583 () Bool)

(declare-fun c!90584 () Bool)

(assert (=> b!832659 (= e!464388 (ite c!90584 (t!22308 (toList!4505 lt!377330)) (ite c!90583 (Cons!15945 (h!17075 (toList!4505 lt!377330)) (t!22308 (toList!4505 lt!377330))) Nil!15946)))))

(declare-fun b!832660 () Bool)

(assert (=> b!832660 (= e!464386 call!36437)))

(declare-fun bm!36436 () Bool)

(assert (=> bm!36436 (= call!36437 call!36438)))

(declare-fun b!832661 () Bool)

(assert (=> b!832661 (= e!464387 e!464385)))

(assert (=> b!832661 (= c!90584 (and ((_ is Cons!15945) (toList!4505 lt!377330)) (= (_1!5094 (h!17075 (toList!4505 lt!377330))) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(declare-fun b!832662 () Bool)

(assert (=> b!832662 (= e!464388 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377330)) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832656 () Bool)

(assert (=> b!832656 (= c!90583 (and ((_ is Cons!15945) (toList!4505 lt!377330)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377330))) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(assert (=> b!832656 (= e!464385 e!464386)))

(declare-fun d!106703 () Bool)

(assert (=> d!106703 e!464384))

(declare-fun res!566393 () Bool)

(assert (=> d!106703 (=> (not res!566393) (not e!464384))))

(assert (=> d!106703 (= res!566393 (isStrictlySorted!438 lt!377750))))

(assert (=> d!106703 (= lt!377750 e!464387)))

(assert (=> d!106703 (= c!90581 (and ((_ is Cons!15945) (toList!4505 lt!377330)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377330))) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(assert (=> d!106703 (isStrictlySorted!438 (toList!4505 lt!377330))))

(assert (=> d!106703 (= (insertStrictlySorted!270 (toList!4505 lt!377330) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)) (_2!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377750)))

(assert (= (and d!106703 c!90581) b!832657))

(assert (= (and d!106703 (not c!90581)) b!832661))

(assert (= (and b!832661 c!90584) b!832658))

(assert (= (and b!832661 (not c!90584)) b!832656))

(assert (= (and b!832656 c!90583) b!832655))

(assert (= (and b!832656 (not c!90583)) b!832660))

(assert (= (or b!832655 b!832660) bm!36436))

(assert (= (or b!832658 bm!36436) bm!36435))

(assert (= (or b!832657 bm!36435) bm!36434))

(assert (= (and bm!36434 c!90582) b!832662))

(assert (= (and bm!36434 (not c!90582)) b!832659))

(assert (= (and d!106703 res!566393) b!832654))

(assert (= (and b!832654 res!566394) b!832653))

(declare-fun m!776707 () Bool)

(assert (=> b!832653 m!776707))

(declare-fun m!776709 () Bool)

(assert (=> d!106703 m!776709))

(declare-fun m!776711 () Bool)

(assert (=> d!106703 m!776711))

(declare-fun m!776713 () Bool)

(assert (=> b!832654 m!776713))

(declare-fun m!776715 () Bool)

(assert (=> bm!36434 m!776715))

(declare-fun m!776717 () Bool)

(assert (=> b!832662 m!776717))

(assert (=> d!106355 d!106703))

(declare-fun d!106705 () Bool)

(declare-fun res!566395 () Bool)

(declare-fun e!464389 () Bool)

(assert (=> d!106705 (=> res!566395 e!464389)))

(assert (=> d!106705 (= res!566395 (and ((_ is Cons!15945) lt!377221) (= (_1!5094 (h!17075 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106705 (= (containsKey!400 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464389)))

(declare-fun b!832663 () Bool)

(declare-fun e!464390 () Bool)

(assert (=> b!832663 (= e!464389 e!464390)))

(declare-fun res!566396 () Bool)

(assert (=> b!832663 (=> (not res!566396) (not e!464390))))

(assert (=> b!832663 (= res!566396 (and (or (not ((_ is Cons!15945) lt!377221)) (bvsle (_1!5094 (h!17075 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377221) (bvslt (_1!5094 (h!17075 lt!377221)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832664 () Bool)

(assert (=> b!832664 (= e!464390 (containsKey!400 (t!22308 lt!377221) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106705 (not res!566395)) b!832663))

(assert (= (and b!832663 res!566396) b!832664))

(declare-fun m!776719 () Bool)

(assert (=> b!832664 m!776719))

(assert (=> b!832067 d!106705))

(declare-fun b!832677 () Bool)

(declare-fun e!464397 () SeekEntryResult!8741)

(declare-fun e!464398 () SeekEntryResult!8741)

(assert (=> b!832677 (= e!464397 e!464398)))

(declare-fun c!90593 () Bool)

(declare-fun lt!377755 () (_ BitVec 64))

(assert (=> b!832677 (= c!90593 (= lt!377755 (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832678 () Bool)

(assert (=> b!832678 (= e!464398 (Found!8741 (index!37337 lt!377518)))))

(declare-fun d!106707 () Bool)

(declare-fun lt!377756 () SeekEntryResult!8741)

(assert (=> d!106707 (and (or ((_ is Undefined!8741) lt!377756) (not ((_ is Found!8741) lt!377756)) (and (bvsge (index!37336 lt!377756) #b00000000000000000000000000000000) (bvslt (index!37336 lt!377756) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377756) ((_ is Found!8741) lt!377756) (not ((_ is MissingVacant!8741) lt!377756)) (not (= (index!37338 lt!377756) (index!37337 lt!377518))) (and (bvsge (index!37338 lt!377756) #b00000000000000000000000000000000) (bvslt (index!37338 lt!377756) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377756) (ite ((_ is Found!8741) lt!377756) (= (select (arr!22319 _keys!976) (index!37336 lt!377756)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8741) lt!377756) (= (index!37338 lt!377756) (index!37337 lt!377518)) (= (select (arr!22319 _keys!976) (index!37338 lt!377756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!106707 (= lt!377756 e!464397)))

(declare-fun c!90592 () Bool)

(assert (=> d!106707 (= c!90592 (bvsge (x!70131 lt!377518) #b01111111111111111111111111111110))))

(assert (=> d!106707 (= lt!377755 (select (arr!22319 _keys!976) (index!37337 lt!377518)))))

(assert (=> d!106707 (validMask!0 mask!1312)))

(assert (=> d!106707 (= (seekKeyOrZeroReturnVacant!0 (x!70131 lt!377518) (index!37337 lt!377518) (index!37337 lt!377518) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377756)))

(declare-fun e!464399 () SeekEntryResult!8741)

(declare-fun b!832679 () Bool)

(assert (=> b!832679 (= e!464399 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70131 lt!377518) #b00000000000000000000000000000001) (nextIndex!0 (index!37337 lt!377518) (x!70131 lt!377518) mask!1312) (index!37337 lt!377518) (select (arr!22319 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!832680 () Bool)

(assert (=> b!832680 (= e!464399 (MissingVacant!8741 (index!37337 lt!377518)))))

(declare-fun b!832681 () Bool)

(declare-fun c!90591 () Bool)

(assert (=> b!832681 (= c!90591 (= lt!377755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832681 (= e!464398 e!464399)))

(declare-fun b!832682 () Bool)

(assert (=> b!832682 (= e!464397 Undefined!8741)))

(assert (= (and d!106707 c!90592) b!832682))

(assert (= (and d!106707 (not c!90592)) b!832677))

(assert (= (and b!832677 c!90593) b!832678))

(assert (= (and b!832677 (not c!90593)) b!832681))

(assert (= (and b!832681 c!90591) b!832680))

(assert (= (and b!832681 (not c!90591)) b!832679))

(declare-fun m!776721 () Bool)

(assert (=> d!106707 m!776721))

(declare-fun m!776723 () Bool)

(assert (=> d!106707 m!776723))

(assert (=> d!106707 m!775709))

(assert (=> d!106707 m!774915))

(declare-fun m!776725 () Bool)

(assert (=> b!832679 m!776725))

(assert (=> b!832679 m!776725))

(assert (=> b!832679 m!775051))

(declare-fun m!776727 () Bool)

(assert (=> b!832679 m!776727))

(assert (=> b!832027 d!106707))

(declare-fun d!106709 () Bool)

(declare-fun lt!377757 () Bool)

(assert (=> d!106709 (= lt!377757 (select (content!386 (t!22308 (toList!4505 lt!377353))) lt!377161))))

(declare-fun e!464401 () Bool)

(assert (=> d!106709 (= lt!377757 e!464401)))

(declare-fun res!566397 () Bool)

(assert (=> d!106709 (=> (not res!566397) (not e!464401))))

(assert (=> d!106709 (= res!566397 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377353))))))

(assert (=> d!106709 (= (contains!4191 (t!22308 (toList!4505 lt!377353)) lt!377161) lt!377757)))

(declare-fun b!832683 () Bool)

(declare-fun e!464400 () Bool)

(assert (=> b!832683 (= e!464401 e!464400)))

(declare-fun res!566398 () Bool)

(assert (=> b!832683 (=> res!566398 e!464400)))

(assert (=> b!832683 (= res!566398 (= (h!17075 (t!22308 (toList!4505 lt!377353))) lt!377161))))

(declare-fun b!832684 () Bool)

(assert (=> b!832684 (= e!464400 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377353))) lt!377161))))

(assert (= (and d!106709 res!566397) b!832683))

(assert (= (and b!832683 (not res!566398)) b!832684))

(assert (=> d!106709 m!776437))

(declare-fun m!776729 () Bool)

(assert (=> d!106709 m!776729))

(declare-fun m!776731 () Bool)

(assert (=> b!832684 m!776731))

(assert (=> b!832162 d!106709))

(declare-fun d!106711 () Bool)

(assert (=> d!106711 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(declare-fun lt!377758 () Unit!28447)

(assert (=> d!106711 (= lt!377758 (choose!1436 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(declare-fun e!464402 () Bool)

(assert (=> d!106711 e!464402))

(declare-fun res!566399 () Bool)

(assert (=> d!106711 (=> (not res!566399) (not e!464402))))

(assert (=> d!106711 (= res!566399 (isStrictlySorted!438 (toList!4505 lt!377357)))))

(assert (=> d!106711 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377357) (_1!5094 lt!377164)) lt!377758)))

(declare-fun b!832685 () Bool)

(assert (=> b!832685 (= e!464402 (containsKey!400 (toList!4505 lt!377357) (_1!5094 lt!377164)))))

(assert (= (and d!106711 res!566399) b!832685))

(assert (=> d!106711 m!775223))

(assert (=> d!106711 m!775223))

(assert (=> d!106711 m!775551))

(declare-fun m!776733 () Bool)

(assert (=> d!106711 m!776733))

(declare-fun m!776735 () Bool)

(assert (=> d!106711 m!776735))

(assert (=> b!832685 m!775547))

(assert (=> b!831912 d!106711))

(declare-fun d!106713 () Bool)

(assert (=> d!106713 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377357) (_1!5094 lt!377164)))))))

(declare-fun bs!23275 () Bool)

(assert (= bs!23275 d!106713))

(assert (=> bs!23275 m!775223))

(declare-fun m!776737 () Bool)

(assert (=> bs!23275 m!776737))

(assert (=> b!831912 d!106713))

(assert (=> b!831912 d!106295))

(declare-fun lt!377759 () Bool)

(declare-fun d!106715 () Bool)

(assert (=> d!106715 (= lt!377759 (select (content!386 (toList!4505 lt!377591)) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464404 () Bool)

(assert (=> d!106715 (= lt!377759 e!464404)))

(declare-fun res!566400 () Bool)

(assert (=> d!106715 (=> (not res!566400) (not e!464404))))

(assert (=> d!106715 (= res!566400 ((_ is Cons!15945) (toList!4505 lt!377591)))))

(assert (=> d!106715 (= (contains!4191 (toList!4505 lt!377591) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377759)))

(declare-fun b!832686 () Bool)

(declare-fun e!464403 () Bool)

(assert (=> b!832686 (= e!464404 e!464403)))

(declare-fun res!566401 () Bool)

(assert (=> b!832686 (=> res!566401 e!464403)))

(assert (=> b!832686 (= res!566401 (= (h!17075 (toList!4505 lt!377591)) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832687 () Bool)

(assert (=> b!832687 (= e!464403 (contains!4191 (t!22308 (toList!4505 lt!377591)) (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106715 res!566400) b!832686))

(assert (= (and b!832686 (not res!566401)) b!832687))

(declare-fun m!776739 () Bool)

(assert (=> d!106715 m!776739))

(declare-fun m!776741 () Bool)

(assert (=> d!106715 m!776741))

(declare-fun m!776743 () Bool)

(assert (=> b!832687 m!776743))

(assert (=> b!832164 d!106715))

(assert (=> b!832062 d!106491))

(assert (=> b!832062 d!106299))

(declare-fun b!832690 () Bool)

(declare-fun e!464406 () Option!420)

(assert (=> b!832690 (= e!464406 (getValueByKey!414 (t!22308 (toList!4505 lt!377443)) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))

(declare-fun b!832691 () Bool)

(assert (=> b!832691 (= e!464406 None!418)))

(declare-fun d!106717 () Bool)

(declare-fun c!90594 () Bool)

(assert (=> d!106717 (= c!90594 (and ((_ is Cons!15945) (toList!4505 lt!377443)) (= (_1!5094 (h!17075 (toList!4505 lt!377443))) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34)))))))

(declare-fun e!464405 () Option!420)

(assert (=> d!106717 (= (getValueByKey!414 (toList!4505 lt!377443) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))) e!464405)))

(declare-fun b!832689 () Bool)

(assert (=> b!832689 (= e!464405 e!464406)))

(declare-fun c!90595 () Bool)

(assert (=> b!832689 (= c!90595 (and ((_ is Cons!15945) (toList!4505 lt!377443)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377443))) (_1!5094 (tuple2!10167 lt!377315 zeroValueBefore!34))))))))

(declare-fun b!832688 () Bool)

(assert (=> b!832688 (= e!464405 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377443)))))))

(assert (= (and d!106717 c!90594) b!832688))

(assert (= (and d!106717 (not c!90594)) b!832689))

(assert (= (and b!832689 c!90595) b!832690))

(assert (= (and b!832689 (not c!90595)) b!832691))

(declare-fun m!776745 () Bool)

(assert (=> b!832690 m!776745))

(assert (=> b!831885 d!106717))

(declare-fun d!106719 () Bool)

(declare-fun lt!377760 () Bool)

(assert (=> d!106719 (= lt!377760 (select (content!386 (t!22308 (toList!4505 lt!377222))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464408 () Bool)

(assert (=> d!106719 (= lt!377760 e!464408)))

(declare-fun res!566402 () Bool)

(assert (=> d!106719 (=> (not res!566402) (not e!464408))))

(assert (=> d!106719 (= res!566402 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377222))))))

(assert (=> d!106719 (= (contains!4191 (t!22308 (toList!4505 lt!377222)) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377760)))

(declare-fun b!832692 () Bool)

(declare-fun e!464407 () Bool)

(assert (=> b!832692 (= e!464408 e!464407)))

(declare-fun res!566403 () Bool)

(assert (=> b!832692 (=> res!566403 e!464407)))

(assert (=> b!832692 (= res!566403 (= (h!17075 (t!22308 (toList!4505 lt!377222))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!832693 () Bool)

(assert (=> b!832693 (= e!464407 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377222))) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106719 res!566402) b!832692))

(assert (= (and b!832692 (not res!566403)) b!832693))

(assert (=> d!106719 m!776687))

(declare-fun m!776747 () Bool)

(assert (=> d!106719 m!776747))

(declare-fun m!776749 () Bool)

(assert (=> b!832693 m!776749))

(assert (=> b!831862 d!106719))

(declare-fun d!106721 () Bool)

(assert (=> d!106721 (= (isEmpty!662 lt!377435) (isEmpty!663 (toList!4505 lt!377435)))))

(declare-fun bs!23276 () Bool)

(assert (= bs!23276 d!106721))

(declare-fun m!776751 () Bool)

(assert (=> bs!23276 m!776751))

(assert (=> b!831871 d!106721))

(declare-fun d!106723 () Bool)

(assert (=> d!106723 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))) lt!377312)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))) lt!377312)))))

(assert (=> d!106203 d!106723))

(declare-fun e!464410 () Option!420)

(declare-fun b!832696 () Bool)

(assert (=> b!832696 (= e!464410 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)))) lt!377312))))

(declare-fun b!832697 () Bool)

(assert (=> b!832697 (= e!464410 None!418)))

(declare-fun c!90596 () Bool)

(declare-fun d!106725 () Bool)

(assert (=> d!106725 (= c!90596 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))))) lt!377312)))))

(declare-fun e!464409 () Option!420)

(assert (=> d!106725 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))) lt!377312) e!464409)))

(declare-fun b!832695 () Bool)

(assert (=> b!832695 (= e!464409 e!464410)))

(declare-fun c!90597 () Bool)

(assert (=> b!832695 (= c!90597 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754))))) lt!377312))))))

(declare-fun b!832694 () Bool)

(assert (=> b!832694 (= e!464409 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377306 (tuple2!10167 lt!377321 minValue!754)))))))))

(assert (= (and d!106725 c!90596) b!832694))

(assert (= (and d!106725 (not c!90596)) b!832695))

(assert (= (and b!832695 c!90597) b!832696))

(assert (= (and b!832695 (not c!90597)) b!832697))

(declare-fun m!776753 () Bool)

(assert (=> b!832696 m!776753))

(assert (=> d!106203 d!106725))

(assert (=> b!832160 d!106553))

(assert (=> b!832160 d!106555))

(declare-fun d!106727 () Bool)

(declare-fun res!566404 () Bool)

(declare-fun e!464411 () Bool)

(assert (=> d!106727 (=> res!566404 e!464411)))

(assert (=> d!106727 (= res!566404 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) lt!377246)))))

(assert (=> d!106727 (= (containsKey!400 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))) lt!377246) e!464411)))

(declare-fun b!832698 () Bool)

(declare-fun e!464412 () Bool)

(assert (=> b!832698 (= e!464411 e!464412)))

(declare-fun res!566405 () Bool)

(assert (=> b!832698 (=> (not res!566405) (not e!464412))))

(assert (=> b!832698 (= res!566405 (and (or (not ((_ is Cons!15945) (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) (bvsle (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) lt!377246)) ((_ is Cons!15945) (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245))))) lt!377246)))))

(declare-fun b!832699 () Bool)

(assert (=> b!832699 (= e!464412 (containsKey!400 (t!22308 (toList!4505 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)))) lt!377246))))

(assert (= (and d!106727 (not res!566404)) b!832698))

(assert (= (and b!832698 res!566405) b!832699))

(declare-fun m!776755 () Bool)

(assert (=> b!832699 m!776755))

(assert (=> d!106163 d!106727))

(assert (=> b!832120 d!106563))

(assert (=> b!832120 d!106307))

(declare-fun d!106729 () Bool)

(declare-fun c!90598 () Bool)

(assert (=> d!106729 (= c!90598 ((_ is Nil!15946) (toList!4505 lt!377218)))))

(declare-fun e!464413 () (InoxSet tuple2!10166))

(assert (=> d!106729 (= (content!386 (toList!4505 lt!377218)) e!464413)))

(declare-fun b!832700 () Bool)

(assert (=> b!832700 (= e!464413 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832701 () Bool)

(assert (=> b!832701 (= e!464413 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377218)) true) (content!386 (t!22308 (toList!4505 lt!377218)))))))

(assert (= (and d!106729 c!90598) b!832700))

(assert (= (and d!106729 (not c!90598)) b!832701))

(declare-fun m!776757 () Bool)

(assert (=> b!832701 m!776757))

(assert (=> b!832701 m!776267))

(assert (=> d!106173 d!106729))

(assert (=> b!831954 d!106559))

(assert (=> b!831954 d!106255))

(declare-fun d!106731 () Bool)

(assert (=> d!106731 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377761 () Unit!28447)

(assert (=> d!106731 (= lt!377761 (choose!1436 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464414 () Bool)

(assert (=> d!106731 e!464414))

(declare-fun res!566406 () Bool)

(assert (=> d!106731 (=> (not res!566406) (not e!464414))))

(assert (=> d!106731 (= res!566406 (isStrictlySorted!438 (toList!4505 lt!377340)))))

(assert (=> d!106731 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377761)))

(declare-fun b!832702 () Bool)

(assert (=> b!832702 (= e!464414 (containsKey!400 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106731 res!566406) b!832702))

(assert (=> d!106731 m!775799))

(assert (=> d!106731 m!775799))

(assert (=> d!106731 m!775827))

(declare-fun m!776759 () Bool)

(assert (=> d!106731 m!776759))

(assert (=> d!106731 m!776499))

(assert (=> b!832702 m!775823))

(assert (=> b!832102 d!106731))

(declare-fun d!106733 () Bool)

(assert (=> d!106733 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23277 () Bool)

(assert (= bs!23277 d!106733))

(assert (=> bs!23277 m!775799))

(declare-fun m!776761 () Bool)

(assert (=> bs!23277 m!776761))

(assert (=> b!832102 d!106733))

(declare-fun b!832705 () Bool)

(declare-fun e!464416 () Option!420)

(assert (=> b!832705 (= e!464416 (getValueByKey!414 (t!22308 (toList!4505 lt!377340)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832706 () Bool)

(assert (=> b!832706 (= e!464416 None!418)))

(declare-fun d!106735 () Bool)

(declare-fun c!90599 () Bool)

(assert (=> d!106735 (= c!90599 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464415 () Option!420)

(assert (=> d!106735 (= (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000) e!464415)))

(declare-fun b!832704 () Bool)

(assert (=> b!832704 (= e!464415 e!464416)))

(declare-fun c!90600 () Bool)

(assert (=> b!832704 (= c!90600 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832703 () Bool)

(assert (=> b!832703 (= e!464415 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377340)))))))

(assert (= (and d!106735 c!90599) b!832703))

(assert (= (and d!106735 (not c!90599)) b!832704))

(assert (= (and b!832704 c!90600) b!832705))

(assert (= (and b!832704 (not c!90600)) b!832706))

(declare-fun m!776763 () Bool)

(assert (=> b!832705 m!776763))

(assert (=> b!832102 d!106735))

(declare-fun d!106737 () Bool)

(declare-fun lt!377762 () Bool)

(assert (=> d!106737 (= lt!377762 (select (content!386 (toList!4505 lt!377490)) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464418 () Bool)

(assert (=> d!106737 (= lt!377762 e!464418)))

(declare-fun res!566407 () Bool)

(assert (=> d!106737 (=> (not res!566407) (not e!464418))))

(assert (=> d!106737 (= res!566407 ((_ is Cons!15945) (toList!4505 lt!377490)))))

(assert (=> d!106737 (= (contains!4191 (toList!4505 lt!377490) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377762)))

(declare-fun b!832707 () Bool)

(declare-fun e!464417 () Bool)

(assert (=> b!832707 (= e!464418 e!464417)))

(declare-fun res!566408 () Bool)

(assert (=> b!832707 (=> res!566408 e!464417)))

(assert (=> b!832707 (= res!566408 (= (h!17075 (toList!4505 lt!377490)) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832708 () Bool)

(assert (=> b!832708 (= e!464417 (contains!4191 (t!22308 (toList!4505 lt!377490)) (ite (or c!90286 c!90287) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106737 res!566407) b!832707))

(assert (= (and b!832707 (not res!566408)) b!832708))

(declare-fun m!776765 () Bool)

(assert (=> d!106737 m!776765))

(declare-fun m!776767 () Bool)

(assert (=> d!106737 m!776767))

(declare-fun m!776769 () Bool)

(assert (=> b!832708 m!776769))

(assert (=> b!831951 d!106737))

(declare-fun b!832711 () Bool)

(declare-fun e!464420 () Option!420)

(assert (=> b!832711 (= e!464420 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377218))) (_1!5094 lt!377161)))))

(declare-fun b!832712 () Bool)

(assert (=> b!832712 (= e!464420 None!418)))

(declare-fun d!106739 () Bool)

(declare-fun c!90601 () Bool)

(assert (=> d!106739 (= c!90601 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377218))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377218)))) (_1!5094 lt!377161))))))

(declare-fun e!464419 () Option!420)

(assert (=> d!106739 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377218)) (_1!5094 lt!377161)) e!464419)))

(declare-fun b!832710 () Bool)

(assert (=> b!832710 (= e!464419 e!464420)))

(declare-fun c!90602 () Bool)

(assert (=> b!832710 (= c!90602 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377218))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377218)))) (_1!5094 lt!377161)))))))

(declare-fun b!832709 () Bool)

(assert (=> b!832709 (= e!464419 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377218))))))))

(assert (= (and d!106739 c!90601) b!832709))

(assert (= (and d!106739 (not c!90601)) b!832710))

(assert (= (and b!832710 c!90602) b!832711))

(assert (= (and b!832710 (not c!90602)) b!832712))

(declare-fun m!776771 () Bool)

(assert (=> b!832711 m!776771))

(assert (=> b!832107 d!106739))

(declare-fun d!106741 () Bool)

(assert (=> d!106741 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377311) lt!377323)) (v!10095 (getValueByKey!414 (toList!4505 lt!377311) lt!377323)))))

(assert (=> d!106199 d!106741))

(declare-fun b!832715 () Bool)

(declare-fun e!464422 () Option!420)

(assert (=> b!832715 (= e!464422 (getValueByKey!414 (t!22308 (toList!4505 lt!377311)) lt!377323))))

(declare-fun b!832716 () Bool)

(assert (=> b!832716 (= e!464422 None!418)))

(declare-fun d!106743 () Bool)

(declare-fun c!90603 () Bool)

(assert (=> d!106743 (= c!90603 (and ((_ is Cons!15945) (toList!4505 lt!377311)) (= (_1!5094 (h!17075 (toList!4505 lt!377311))) lt!377323)))))

(declare-fun e!464421 () Option!420)

(assert (=> d!106743 (= (getValueByKey!414 (toList!4505 lt!377311) lt!377323) e!464421)))

(declare-fun b!832714 () Bool)

(assert (=> b!832714 (= e!464421 e!464422)))

(declare-fun c!90604 () Bool)

(assert (=> b!832714 (= c!90604 (and ((_ is Cons!15945) (toList!4505 lt!377311)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377311))) lt!377323))))))

(declare-fun b!832713 () Bool)

(assert (=> b!832713 (= e!464421 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377311)))))))

(assert (= (and d!106743 c!90603) b!832713))

(assert (= (and d!106743 (not c!90603)) b!832714))

(assert (= (and b!832714 c!90604) b!832715))

(assert (= (and b!832714 (not c!90604)) b!832716))

(declare-fun m!776773 () Bool)

(assert (=> b!832715 m!776773))

(assert (=> d!106199 d!106743))

(declare-fun d!106745 () Bool)

(declare-fun res!566409 () Bool)

(declare-fun e!464423 () Bool)

(assert (=> d!106745 (=> res!566409 e!464423)))

(assert (=> d!106745 (= res!566409 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) lt!377332)))))

(assert (=> d!106745 (= (containsKey!400 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))) lt!377332) e!464423)))

(declare-fun b!832717 () Bool)

(declare-fun e!464424 () Bool)

(assert (=> b!832717 (= e!464423 e!464424)))

(declare-fun res!566410 () Bool)

(assert (=> b!832717 (=> (not res!566410) (not e!464424))))

(assert (=> b!832717 (= res!566410 (and (or (not ((_ is Cons!15945) (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) (bvsle (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) lt!377332)) ((_ is Cons!15945) (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34))))) lt!377332)))))

(declare-fun b!832718 () Bool)

(assert (=> b!832718 (= e!464424 (containsKey!400 (t!22308 (toList!4505 (+!2013 lt!377330 (tuple2!10167 lt!377335 zeroValueAfter!34)))) lt!377332))))

(assert (= (and d!106745 (not res!566409)) b!832717))

(assert (= (and b!832717 res!566410) b!832718))

(declare-fun m!776775 () Bool)

(assert (=> b!832718 m!776775))

(assert (=> d!106365 d!106745))

(declare-fun b!832721 () Bool)

(declare-fun e!464426 () Option!420)

(assert (=> b!832721 (= e!464426 (getValueByKey!414 (t!22308 (t!22308 lt!377352)) (_1!5094 lt!377161)))))

(declare-fun b!832722 () Bool)

(assert (=> b!832722 (= e!464426 None!418)))

(declare-fun d!106747 () Bool)

(declare-fun c!90605 () Bool)

(assert (=> d!106747 (= c!90605 (and ((_ is Cons!15945) (t!22308 lt!377352)) (= (_1!5094 (h!17075 (t!22308 lt!377352))) (_1!5094 lt!377161))))))

(declare-fun e!464425 () Option!420)

(assert (=> d!106747 (= (getValueByKey!414 (t!22308 lt!377352) (_1!5094 lt!377161)) e!464425)))

(declare-fun b!832720 () Bool)

(assert (=> b!832720 (= e!464425 e!464426)))

(declare-fun c!90606 () Bool)

(assert (=> b!832720 (= c!90606 (and ((_ is Cons!15945) (t!22308 lt!377352)) (not (= (_1!5094 (h!17075 (t!22308 lt!377352))) (_1!5094 lt!377161)))))))

(declare-fun b!832719 () Bool)

(assert (=> b!832719 (= e!464425 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377352)))))))

(assert (= (and d!106747 c!90605) b!832719))

(assert (= (and d!106747 (not c!90605)) b!832720))

(assert (= (and b!832720 c!90606) b!832721))

(assert (= (and b!832720 (not c!90606)) b!832722))

(declare-fun m!776777 () Bool)

(assert (=> b!832721 m!776777))

(assert (=> b!831978 d!106747))

(declare-fun d!106749 () Bool)

(declare-fun res!566411 () Bool)

(declare-fun e!464427 () Bool)

(assert (=> d!106749 (=> res!566411 e!464427)))

(assert (=> d!106749 (= res!566411 (and ((_ is Cons!15945) lt!377348) (= (_1!5094 (h!17075 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106749 (= (containsKey!400 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464427)))

(declare-fun b!832723 () Bool)

(declare-fun e!464428 () Bool)

(assert (=> b!832723 (= e!464427 e!464428)))

(declare-fun res!566412 () Bool)

(assert (=> b!832723 (=> (not res!566412) (not e!464428))))

(assert (=> b!832723 (= res!566412 (and (or (not ((_ is Cons!15945) lt!377348)) (bvsle (_1!5094 (h!17075 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377348) (bvslt (_1!5094 (h!17075 lt!377348)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832724 () Bool)

(assert (=> b!832724 (= e!464428 (containsKey!400 (t!22308 lt!377348) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106749 (not res!566411)) b!832723))

(assert (= (and b!832723 res!566412) b!832724))

(declare-fun m!776779 () Bool)

(assert (=> b!832724 m!776779))

(assert (=> b!831959 d!106749))

(assert (=> d!106195 d!106177))

(assert (=> d!106195 d!106205))

(assert (=> d!106195 d!106191))

(declare-fun d!106751 () Bool)

(declare-fun e!464430 () Bool)

(assert (=> d!106751 e!464430))

(declare-fun res!566413 () Bool)

(assert (=> d!106751 (=> res!566413 e!464430)))

(declare-fun lt!377765 () Bool)

(assert (=> d!106751 (= res!566413 (not lt!377765))))

(declare-fun lt!377763 () Bool)

(assert (=> d!106751 (= lt!377765 lt!377763)))

(declare-fun lt!377766 () Unit!28447)

(declare-fun e!464429 () Unit!28447)

(assert (=> d!106751 (= lt!377766 e!464429)))

(declare-fun c!90607 () Bool)

(assert (=> d!106751 (= c!90607 lt!377763)))

(assert (=> d!106751 (= lt!377763 (containsKey!400 (toList!4505 lt!377319) lt!377302))))

(assert (=> d!106751 (= (contains!4190 lt!377319 lt!377302) lt!377765)))

(declare-fun b!832725 () Bool)

(declare-fun lt!377764 () Unit!28447)

(assert (=> b!832725 (= e!464429 lt!377764)))

(assert (=> b!832725 (= lt!377764 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377319) lt!377302))))

(assert (=> b!832725 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377319) lt!377302))))

(declare-fun b!832726 () Bool)

(declare-fun Unit!28492 () Unit!28447)

(assert (=> b!832726 (= e!464429 Unit!28492)))

(declare-fun b!832727 () Bool)

(assert (=> b!832727 (= e!464430 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377319) lt!377302)))))

(assert (= (and d!106751 c!90607) b!832725))

(assert (= (and d!106751 (not c!90607)) b!832726))

(assert (= (and d!106751 (not res!566413)) b!832727))

(declare-fun m!776781 () Bool)

(assert (=> d!106751 m!776781))

(declare-fun m!776783 () Bool)

(assert (=> b!832725 m!776783))

(assert (=> b!832725 m!775489))

(assert (=> b!832725 m!775489))

(declare-fun m!776785 () Bool)

(assert (=> b!832725 m!776785))

(assert (=> b!832727 m!775489))

(assert (=> b!832727 m!775489))

(assert (=> b!832727 m!776785))

(assert (=> d!106195 d!106751))

(declare-fun d!106753 () Bool)

(assert (=> d!106753 (= (apply!373 (+!2013 lt!377319 (tuple2!10167 lt!377315 zeroValueBefore!34)) lt!377302) (apply!373 lt!377319 lt!377302))))

(assert (=> d!106753 true))

(declare-fun _$34!1152 () Unit!28447)

(assert (=> d!106753 (= (choose!1435 lt!377319 lt!377315 zeroValueBefore!34 lt!377302) _$34!1152)))

(declare-fun bs!23278 () Bool)

(assert (= bs!23278 d!106753))

(assert (=> bs!23278 m!775125))

(assert (=> bs!23278 m!775125))

(assert (=> bs!23278 m!775127))

(assert (=> bs!23278 m!775121))

(assert (=> d!106195 d!106753))

(assert (=> d!106169 d!106163))

(assert (=> d!106169 d!106165))

(declare-fun d!106755 () Bool)

(assert (=> d!106755 (not (contains!4190 (+!2013 lt!377244 (tuple2!10167 lt!377240 lt!377245)) lt!377246))))

(assert (=> d!106755 true))

(declare-fun _$36!347 () Unit!28447)

(assert (=> d!106755 (= (choose!1432 lt!377244 lt!377240 lt!377245 lt!377246) _$36!347)))

(declare-fun bs!23279 () Bool)

(assert (= bs!23279 d!106755))

(assert (=> bs!23279 m!775037))

(assert (=> bs!23279 m!775037))

(assert (=> bs!23279 m!775039))

(assert (=> d!106169 d!106755))

(declare-fun d!106757 () Bool)

(declare-fun e!464432 () Bool)

(assert (=> d!106757 e!464432))

(declare-fun res!566414 () Bool)

(assert (=> d!106757 (=> res!566414 e!464432)))

(declare-fun lt!377769 () Bool)

(assert (=> d!106757 (= res!566414 (not lt!377769))))

(declare-fun lt!377767 () Bool)

(assert (=> d!106757 (= lt!377769 lt!377767)))

(declare-fun lt!377770 () Unit!28447)

(declare-fun e!464431 () Unit!28447)

(assert (=> d!106757 (= lt!377770 e!464431)))

(declare-fun c!90608 () Bool)

(assert (=> d!106757 (= c!90608 lt!377767)))

(assert (=> d!106757 (= lt!377767 (containsKey!400 (toList!4505 lt!377244) lt!377246))))

(assert (=> d!106757 (= (contains!4190 lt!377244 lt!377246) lt!377769)))

(declare-fun b!832729 () Bool)

(declare-fun lt!377768 () Unit!28447)

(assert (=> b!832729 (= e!464431 lt!377768)))

(assert (=> b!832729 (= lt!377768 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377244) lt!377246))))

(assert (=> b!832729 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377244) lt!377246))))

(declare-fun b!832730 () Bool)

(declare-fun Unit!28493 () Unit!28447)

(assert (=> b!832730 (= e!464431 Unit!28493)))

(declare-fun b!832731 () Bool)

(assert (=> b!832731 (= e!464432 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377244) lt!377246)))))

(assert (= (and d!106757 c!90608) b!832729))

(assert (= (and d!106757 (not c!90608)) b!832730))

(assert (= (and d!106757 (not res!566414)) b!832731))

(declare-fun m!776787 () Bool)

(assert (=> d!106757 m!776787))

(declare-fun m!776789 () Bool)

(assert (=> b!832729 m!776789))

(declare-fun m!776791 () Bool)

(assert (=> b!832729 m!776791))

(assert (=> b!832729 m!776791))

(declare-fun m!776793 () Bool)

(assert (=> b!832729 m!776793))

(assert (=> b!832731 m!776791))

(assert (=> b!832731 m!776791))

(assert (=> b!832731 m!776793))

(assert (=> d!106169 d!106757))

(declare-fun d!106759 () Bool)

(declare-fun res!566415 () Bool)

(declare-fun e!464433 () Bool)

(assert (=> d!106759 (=> res!566415 e!464433)))

(assert (=> d!106759 (= res!566415 (and ((_ is Cons!15945) lt!377360) (= (_1!5094 (h!17075 lt!377360)) (_1!5094 lt!377164))))))

(assert (=> d!106759 (= (containsKey!400 lt!377360 (_1!5094 lt!377164)) e!464433)))

(declare-fun b!832732 () Bool)

(declare-fun e!464434 () Bool)

(assert (=> b!832732 (= e!464433 e!464434)))

(declare-fun res!566416 () Bool)

(assert (=> b!832732 (=> (not res!566416) (not e!464434))))

(assert (=> b!832732 (= res!566416 (and (or (not ((_ is Cons!15945) lt!377360)) (bvsle (_1!5094 (h!17075 lt!377360)) (_1!5094 lt!377164))) ((_ is Cons!15945) lt!377360) (bvslt (_1!5094 (h!17075 lt!377360)) (_1!5094 lt!377164))))))

(declare-fun b!832733 () Bool)

(assert (=> b!832733 (= e!464434 (containsKey!400 (t!22308 lt!377360) (_1!5094 lt!377164)))))

(assert (= (and d!106759 (not res!566415)) b!832732))

(assert (= (and b!832732 res!566416) b!832733))

(declare-fun m!776795 () Bool)

(assert (=> b!832733 m!776795))

(assert (=> b!831822 d!106759))

(declare-fun d!106761 () Bool)

(declare-fun lt!377771 () Bool)

(assert (=> d!106761 (= lt!377771 (select (content!386 lt!377364) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464436 () Bool)

(assert (=> d!106761 (= lt!377771 e!464436)))

(declare-fun res!566417 () Bool)

(assert (=> d!106761 (=> (not res!566417) (not e!464436))))

(assert (=> d!106761 (= res!566417 ((_ is Cons!15945) lt!377364))))

(assert (=> d!106761 (= (contains!4191 lt!377364 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377771)))

(declare-fun b!832734 () Bool)

(declare-fun e!464435 () Bool)

(assert (=> b!832734 (= e!464436 e!464435)))

(declare-fun res!566418 () Bool)

(assert (=> b!832734 (=> res!566418 e!464435)))

(assert (=> b!832734 (= res!566418 (= (h!17075 lt!377364) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832735 () Bool)

(assert (=> b!832735 (= e!464435 (contains!4191 (t!22308 lt!377364) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106761 res!566417) b!832734))

(assert (= (and b!832734 (not res!566418)) b!832735))

(declare-fun m!776797 () Bool)

(assert (=> d!106761 m!776797))

(declare-fun m!776799 () Bool)

(assert (=> d!106761 m!776799))

(declare-fun m!776801 () Bool)

(assert (=> b!832735 m!776801))

(assert (=> b!831939 d!106761))

(declare-fun b!832738 () Bool)

(declare-fun e!464438 () Option!420)

(assert (=> b!832738 (= e!464438 (getValueByKey!414 (t!22308 (toList!4505 lt!377601)) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))

(declare-fun b!832739 () Bool)

(assert (=> b!832739 (= e!464438 None!418)))

(declare-fun d!106763 () Bool)

(declare-fun c!90609 () Bool)

(assert (=> d!106763 (= c!90609 (and ((_ is Cons!15945) (toList!4505 lt!377601)) (= (_1!5094 (h!17075 (toList!4505 lt!377601))) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34)))))))

(declare-fun e!464437 () Option!420)

(assert (=> d!106763 (= (getValueByKey!414 (toList!4505 lt!377601) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))) e!464437)))

(declare-fun b!832737 () Bool)

(assert (=> b!832737 (= e!464437 e!464438)))

(declare-fun c!90610 () Bool)

(assert (=> b!832737 (= c!90610 (and ((_ is Cons!15945) (toList!4505 lt!377601)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377601))) (_1!5094 (tuple2!10167 lt!377335 zeroValueAfter!34))))))))

(declare-fun b!832736 () Bool)

(assert (=> b!832736 (= e!464437 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377601)))))))

(assert (= (and d!106763 c!90609) b!832736))

(assert (= (and d!106763 (not c!90609)) b!832737))

(assert (= (and b!832737 c!90610) b!832738))

(assert (= (and b!832737 (not c!90610)) b!832739))

(declare-fun m!776803 () Bool)

(assert (=> b!832738 m!776803))

(assert (=> b!832169 d!106763))

(declare-fun d!106765 () Bool)

(declare-fun res!566419 () Bool)

(declare-fun e!464439 () Bool)

(assert (=> d!106765 (=> res!566419 e!464439)))

(assert (=> d!106765 (= res!566419 (and ((_ is Cons!15945) lt!377217) (= (_1!5094 (h!17075 lt!377217)) (_1!5094 lt!377161))))))

(assert (=> d!106765 (= (containsKey!400 lt!377217 (_1!5094 lt!377161)) e!464439)))

(declare-fun b!832740 () Bool)

(declare-fun e!464440 () Bool)

(assert (=> b!832740 (= e!464439 e!464440)))

(declare-fun res!566420 () Bool)

(assert (=> b!832740 (=> (not res!566420) (not e!464440))))

(assert (=> b!832740 (= res!566420 (and (or (not ((_ is Cons!15945) lt!377217)) (bvsle (_1!5094 (h!17075 lt!377217)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377217) (bvslt (_1!5094 (h!17075 lt!377217)) (_1!5094 lt!377161))))))

(declare-fun b!832741 () Bool)

(assert (=> b!832741 (= e!464440 (containsKey!400 (t!22308 lt!377217) (_1!5094 lt!377161)))))

(assert (= (and d!106765 (not res!566419)) b!832740))

(assert (= (and b!832740 res!566420) b!832741))

(declare-fun m!776805 () Bool)

(assert (=> b!832741 m!776805))

(assert (=> b!832125 d!106765))

(declare-fun d!106767 () Bool)

(declare-fun res!566421 () Bool)

(declare-fun e!464441 () Bool)

(assert (=> d!106767 (=> res!566421 e!464441)))

(assert (=> d!106767 (= res!566421 (and ((_ is Cons!15945) (toList!4505 lt!377357)) (= (_1!5094 (h!17075 (toList!4505 lt!377357))) (_1!5094 lt!377164))))))

(assert (=> d!106767 (= (containsKey!400 (toList!4505 lt!377357) (_1!5094 lt!377164)) e!464441)))

(declare-fun b!832742 () Bool)

(declare-fun e!464442 () Bool)

(assert (=> b!832742 (= e!464441 e!464442)))

(declare-fun res!566422 () Bool)

(assert (=> b!832742 (=> (not res!566422) (not e!464442))))

(assert (=> b!832742 (= res!566422 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377357))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377357))) (_1!5094 lt!377164))) ((_ is Cons!15945) (toList!4505 lt!377357)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377357))) (_1!5094 lt!377164))))))

(declare-fun b!832743 () Bool)

(assert (=> b!832743 (= e!464442 (containsKey!400 (t!22308 (toList!4505 lt!377357)) (_1!5094 lt!377164)))))

(assert (= (and d!106767 (not res!566421)) b!832742))

(assert (= (and b!832742 res!566422) b!832743))

(declare-fun m!776807 () Bool)

(assert (=> b!832743 m!776807))

(assert (=> d!106213 d!106767))

(declare-fun d!106769 () Bool)

(assert (=> d!106769 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(declare-fun lt!377772 () Unit!28447)

(assert (=> d!106769 (= lt!377772 (choose!1436 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(declare-fun e!464443 () Bool)

(assert (=> d!106769 e!464443))

(declare-fun res!566423 () Bool)

(assert (=> d!106769 (=> (not res!566423) (not e!464443))))

(assert (=> d!106769 (= res!566423 (isStrictlySorted!438 (toList!4505 lt!377353)))))

(assert (=> d!106769 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377353) (_1!5094 lt!377161)) lt!377772)))

(declare-fun b!832744 () Bool)

(assert (=> b!832744 (= e!464443 (containsKey!400 (toList!4505 lt!377353) (_1!5094 lt!377161)))))

(assert (= (and d!106769 res!566423) b!832744))

(assert (=> d!106769 m!775211))

(assert (=> d!106769 m!775211))

(assert (=> d!106769 m!775655))

(declare-fun m!776809 () Bool)

(assert (=> d!106769 m!776809))

(declare-fun m!776811 () Bool)

(assert (=> d!106769 m!776811))

(assert (=> b!832744 m!775651))

(assert (=> b!831973 d!106769))

(declare-fun d!106771 () Bool)

(assert (=> d!106771 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377353) (_1!5094 lt!377161)))))))

(declare-fun bs!23280 () Bool)

(assert (= bs!23280 d!106771))

(assert (=> bs!23280 m!775211))

(declare-fun m!776813 () Bool)

(assert (=> bs!23280 m!776813))

(assert (=> b!831973 d!106771))

(assert (=> b!831973 d!106257))

(declare-fun d!106773 () Bool)

(declare-fun lt!377773 () Bool)

(assert (=> d!106773 (= lt!377773 (select (content!386 (toList!4505 lt!377455)) (tuple2!10167 lt!377321 minValue!754)))))

(declare-fun e!464445 () Bool)

(assert (=> d!106773 (= lt!377773 e!464445)))

(declare-fun res!566424 () Bool)

(assert (=> d!106773 (=> (not res!566424) (not e!464445))))

(assert (=> d!106773 (= res!566424 ((_ is Cons!15945) (toList!4505 lt!377455)))))

(assert (=> d!106773 (= (contains!4191 (toList!4505 lt!377455) (tuple2!10167 lt!377321 minValue!754)) lt!377773)))

(declare-fun b!832745 () Bool)

(declare-fun e!464444 () Bool)

(assert (=> b!832745 (= e!464445 e!464444)))

(declare-fun res!566425 () Bool)

(assert (=> b!832745 (=> res!566425 e!464444)))

(assert (=> b!832745 (= res!566425 (= (h!17075 (toList!4505 lt!377455)) (tuple2!10167 lt!377321 minValue!754)))))

(declare-fun b!832746 () Bool)

(assert (=> b!832746 (= e!464444 (contains!4191 (t!22308 (toList!4505 lt!377455)) (tuple2!10167 lt!377321 minValue!754)))))

(assert (= (and d!106773 res!566424) b!832745))

(assert (= (and b!832745 (not res!566425)) b!832746))

(declare-fun m!776815 () Bool)

(assert (=> d!106773 m!776815))

(declare-fun m!776817 () Bool)

(assert (=> d!106773 m!776817))

(declare-fun m!776819 () Bool)

(assert (=> b!832746 m!776819))

(assert (=> b!831893 d!106773))

(declare-fun d!106775 () Bool)

(declare-fun e!464447 () Bool)

(assert (=> d!106775 e!464447))

(declare-fun res!566426 () Bool)

(assert (=> d!106775 (=> res!566426 e!464447)))

(declare-fun lt!377776 () Bool)

(assert (=> d!106775 (= res!566426 (not lt!377776))))

(declare-fun lt!377774 () Bool)

(assert (=> d!106775 (= lt!377776 lt!377774)))

(declare-fun lt!377777 () Unit!28447)

(declare-fun e!464446 () Unit!28447)

(assert (=> d!106775 (= lt!377777 e!464446)))

(declare-fun c!90611 () Bool)

(assert (=> d!106775 (= c!90611 lt!377774)))

(assert (=> d!106775 (= lt!377774 (containsKey!400 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106775 (= (contains!4190 lt!377591 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377776)))

(declare-fun b!832747 () Bool)

(declare-fun lt!377775 () Unit!28447)

(assert (=> b!832747 (= e!464446 lt!377775)))

(assert (=> b!832747 (= lt!377775 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832747 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832748 () Bool)

(declare-fun Unit!28494 () Unit!28447)

(assert (=> b!832748 (= e!464446 Unit!28494)))

(declare-fun b!832749 () Bool)

(assert (=> b!832749 (= e!464447 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377591) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106775 c!90611) b!832747))

(assert (= (and d!106775 (not c!90611)) b!832748))

(assert (= (and d!106775 (not res!566426)) b!832749))

(declare-fun m!776821 () Bool)

(assert (=> d!106775 m!776821))

(declare-fun m!776823 () Bool)

(assert (=> b!832747 m!776823))

(assert (=> b!832747 m!775951))

(assert (=> b!832747 m!775951))

(declare-fun m!776825 () Bool)

(assert (=> b!832747 m!776825))

(assert (=> b!832749 m!775951))

(assert (=> b!832749 m!775951))

(assert (=> b!832749 m!776825))

(assert (=> d!106345 d!106775))

(declare-fun e!464449 () Option!420)

(declare-fun b!832752 () Bool)

(assert (=> b!832752 (= e!464449 (getValueByKey!414 (t!22308 lt!377590) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832753 () Bool)

(assert (=> b!832753 (= e!464449 None!418)))

(declare-fun d!106777 () Bool)

(declare-fun c!90612 () Bool)

(assert (=> d!106777 (= c!90612 (and ((_ is Cons!15945) lt!377590) (= (_1!5094 (h!17075 lt!377590)) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464448 () Option!420)

(assert (=> d!106777 (= (getValueByKey!414 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464448)))

(declare-fun b!832751 () Bool)

(assert (=> b!832751 (= e!464448 e!464449)))

(declare-fun c!90613 () Bool)

(assert (=> b!832751 (= c!90613 (and ((_ is Cons!15945) lt!377590) (not (= (_1!5094 (h!17075 lt!377590)) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832750 () Bool)

(assert (=> b!832750 (= e!464448 (Some!419 (_2!5094 (h!17075 lt!377590))))))

(assert (= (and d!106777 c!90612) b!832750))

(assert (= (and d!106777 (not c!90612)) b!832751))

(assert (= (and b!832751 c!90613) b!832752))

(assert (= (and b!832751 (not c!90613)) b!832753))

(declare-fun m!776827 () Bool)

(assert (=> b!832752 m!776827))

(assert (=> d!106345 d!106777))

(declare-fun d!106779 () Bool)

(assert (=> d!106779 (= (getValueByKey!414 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!419 (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377778 () Unit!28447)

(assert (=> d!106779 (= lt!377778 (choose!1433 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464450 () Bool)

(assert (=> d!106779 e!464450))

(declare-fun res!566427 () Bool)

(assert (=> d!106779 (=> (not res!566427) (not e!464450))))

(assert (=> d!106779 (= res!566427 (isStrictlySorted!438 lt!377590))))

(assert (=> d!106779 (= (lemmaContainsTupThenGetReturnValue!231 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377778)))

(declare-fun b!832754 () Bool)

(declare-fun res!566428 () Bool)

(assert (=> b!832754 (=> (not res!566428) (not e!464450))))

(assert (=> b!832754 (= res!566428 (containsKey!400 lt!377590 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832755 () Bool)

(assert (=> b!832755 (= e!464450 (contains!4191 lt!377590 (tuple2!10167 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106779 res!566427) b!832754))

(assert (= (and b!832754 res!566428) b!832755))

(assert (=> d!106779 m!775945))

(declare-fun m!776829 () Bool)

(assert (=> d!106779 m!776829))

(declare-fun m!776831 () Bool)

(assert (=> d!106779 m!776831))

(declare-fun m!776833 () Bool)

(assert (=> b!832754 m!776833))

(declare-fun m!776835 () Bool)

(assert (=> b!832755 m!776835))

(assert (=> d!106345 d!106779))

(declare-fun lt!377779 () List!15949)

(declare-fun b!832756 () Bool)

(declare-fun e!464451 () Bool)

(assert (=> b!832756 (= e!464451 (contains!4191 lt!377779 (tuple2!10167 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832757 () Bool)

(declare-fun res!566430 () Bool)

(assert (=> b!832757 (=> (not res!566430) (not e!464451))))

(assert (=> b!832757 (= res!566430 (containsKey!400 lt!377779 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832758 () Bool)

(declare-fun e!464453 () List!15949)

(declare-fun call!36440 () List!15949)

(assert (=> b!832758 (= e!464453 call!36440)))

(declare-fun bm!36437 () Bool)

(declare-fun call!36442 () List!15949)

(declare-fun e!464455 () List!15949)

(declare-fun c!90614 () Bool)

(assert (=> bm!36437 (= call!36442 ($colon$colon!536 e!464455 (ite c!90614 (h!17075 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (tuple2!10167 (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90615 () Bool)

(assert (=> bm!36437 (= c!90615 c!90614)))

(declare-fun b!832760 () Bool)

(declare-fun e!464454 () List!15949)

(assert (=> b!832760 (= e!464454 call!36442)))

(declare-fun bm!36438 () Bool)

(declare-fun call!36441 () List!15949)

(assert (=> bm!36438 (= call!36441 call!36442)))

(declare-fun b!832761 () Bool)

(declare-fun e!464452 () List!15949)

(assert (=> b!832761 (= e!464452 call!36441)))

(declare-fun c!90616 () Bool)

(declare-fun c!90617 () Bool)

(declare-fun b!832762 () Bool)

(assert (=> b!832762 (= e!464455 (ite c!90617 (t!22308 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (ite c!90616 (Cons!15945 (h!17075 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (t!22308 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))))) Nil!15946)))))

(declare-fun b!832763 () Bool)

(assert (=> b!832763 (= e!464453 call!36440)))

(declare-fun bm!36439 () Bool)

(assert (=> bm!36439 (= call!36440 call!36441)))

(declare-fun b!832764 () Bool)

(assert (=> b!832764 (= e!464454 e!464452)))

(assert (=> b!832764 (= c!90617 (and ((_ is Cons!15945) (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (= (_1!5094 (h!17075 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832765 () Bool)

(assert (=> b!832765 (= e!464455 (insertStrictlySorted!270 (t!22308 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832759 () Bool)

(assert (=> b!832759 (= c!90616 (and ((_ is Cons!15945) (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (bvsgt (_1!5094 (h!17075 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!832759 (= e!464452 e!464453)))

(declare-fun d!106781 () Bool)

(assert (=> d!106781 e!464451))

(declare-fun res!566429 () Bool)

(assert (=> d!106781 (=> (not res!566429) (not e!464451))))

(assert (=> d!106781 (= res!566429 (isStrictlySorted!438 lt!377779))))

(assert (=> d!106781 (= lt!377779 e!464454)))

(assert (=> d!106781 (= c!90614 (and ((_ is Cons!15945) (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359)))) (bvslt (_1!5094 (h!17075 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106781 (isStrictlySorted!438 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))))))

(assert (=> d!106781 (= (insertStrictlySorted!270 (toList!4505 (ite c!90292 call!36363 (ite c!90293 call!36361 call!36359))) (_1!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5094 (ite (or c!90292 c!90293) (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377779)))

(assert (= (and d!106781 c!90614) b!832760))

(assert (= (and d!106781 (not c!90614)) b!832764))

(assert (= (and b!832764 c!90617) b!832761))

(assert (= (and b!832764 (not c!90617)) b!832759))

(assert (= (and b!832759 c!90616) b!832758))

(assert (= (and b!832759 (not c!90616)) b!832763))

(assert (= (or b!832758 b!832763) bm!36439))

(assert (= (or b!832761 bm!36439) bm!36438))

(assert (= (or b!832760 bm!36438) bm!36437))

(assert (= (and bm!36437 c!90615) b!832765))

(assert (= (and bm!36437 (not c!90615)) b!832762))

(assert (= (and d!106781 res!566429) b!832757))

(assert (= (and b!832757 res!566430) b!832756))

(declare-fun m!776837 () Bool)

(assert (=> b!832756 m!776837))

(declare-fun m!776839 () Bool)

(assert (=> d!106781 m!776839))

(declare-fun m!776841 () Bool)

(assert (=> d!106781 m!776841))

(declare-fun m!776843 () Bool)

(assert (=> b!832757 m!776843))

(declare-fun m!776845 () Bool)

(assert (=> bm!36437 m!776845))

(declare-fun m!776847 () Bool)

(assert (=> b!832765 m!776847))

(assert (=> d!106345 d!106781))

(declare-fun d!106783 () Bool)

(assert (=> d!106783 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377324)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377324)))))

(assert (=> d!106361 d!106783))

(declare-fun b!832768 () Bool)

(declare-fun e!464457 () Option!420)

(assert (=> b!832768 (= e!464457 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)))) lt!377324))))

(declare-fun b!832769 () Bool)

(assert (=> b!832769 (= e!464457 None!418)))

(declare-fun d!106785 () Bool)

(declare-fun c!90618 () Bool)

(assert (=> d!106785 (= c!90618 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))))) lt!377324)))))

(declare-fun e!464456 () Option!420)

(assert (=> d!106785 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))) lt!377324) e!464456)))

(declare-fun b!832767 () Bool)

(assert (=> b!832767 (= e!464456 e!464457)))

(declare-fun c!90619 () Bool)

(assert (=> b!832767 (= c!90619 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34))))) lt!377324))))))

(declare-fun b!832766 () Bool)

(assert (=> b!832766 (= e!464456 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))))

(assert (= (and d!106785 c!90618) b!832766))

(assert (= (and d!106785 (not c!90618)) b!832767))

(assert (= (and b!832767 c!90619) b!832768))

(assert (= (and b!832767 (not c!90619)) b!832769))

(declare-fun m!776849 () Bool)

(assert (=> b!832768 m!776849))

(assert (=> d!106361 d!106785))

(declare-fun d!106787 () Bool)

(assert (=> d!106787 (= ($colon$colon!536 e!463955 (ite c!90344 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))) (Cons!15945 (ite c!90344 (h!17075 (toList!4505 lt!377158)) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) e!463955))))

(assert (=> bm!36381 d!106787))

(assert (=> d!106291 d!106289))

(declare-fun d!106789 () Bool)

(assert (=> d!106789 (= (getValueByKey!414 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106789 true))

(declare-fun _$22!576 () Unit!28447)

(assert (=> d!106789 (= (choose!1433 lt!377221 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!576)))

(declare-fun bs!23281 () Bool)

(assert (= bs!23281 d!106789))

(assert (=> bs!23281 m!775025))

(assert (=> d!106291 d!106789))

(declare-fun d!106791 () Bool)

(declare-fun res!566431 () Bool)

(declare-fun e!464458 () Bool)

(assert (=> d!106791 (=> res!566431 e!464458)))

(assert (=> d!106791 (= res!566431 (or ((_ is Nil!15946) lt!377221) ((_ is Nil!15946) (t!22308 lt!377221))))))

(assert (=> d!106791 (= (isStrictlySorted!438 lt!377221) e!464458)))

(declare-fun b!832770 () Bool)

(declare-fun e!464459 () Bool)

(assert (=> b!832770 (= e!464458 e!464459)))

(declare-fun res!566432 () Bool)

(assert (=> b!832770 (=> (not res!566432) (not e!464459))))

(assert (=> b!832770 (= res!566432 (bvslt (_1!5094 (h!17075 lt!377221)) (_1!5094 (h!17075 (t!22308 lt!377221)))))))

(declare-fun b!832771 () Bool)

(assert (=> b!832771 (= e!464459 (isStrictlySorted!438 (t!22308 lt!377221)))))

(assert (= (and d!106791 (not res!566431)) b!832770))

(assert (= (and b!832770 res!566432) b!832771))

(declare-fun m!776851 () Bool)

(assert (=> b!832771 m!776851))

(assert (=> d!106291 d!106791))

(declare-fun e!464461 () Option!420)

(declare-fun b!832774 () Bool)

(assert (=> b!832774 (= e!464461 (getValueByKey!414 (t!22308 (toList!4505 lt!377596)) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!832775 () Bool)

(assert (=> b!832775 (= e!464461 None!418)))

(declare-fun c!90620 () Bool)

(declare-fun d!106793 () Bool)

(assert (=> d!106793 (= c!90620 (and ((_ is Cons!15945) (toList!4505 lt!377596)) (= (_1!5094 (h!17075 (toList!4505 lt!377596))) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(declare-fun e!464460 () Option!420)

(assert (=> d!106793 (= (getValueByKey!414 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754))) e!464460)))

(declare-fun b!832773 () Bool)

(assert (=> b!832773 (= e!464460 e!464461)))

(declare-fun c!90621 () Bool)

(assert (=> b!832773 (= c!90621 (and ((_ is Cons!15945) (toList!4505 lt!377596)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377596))) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))))

(declare-fun b!832772 () Bool)

(assert (=> b!832772 (= e!464460 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377596)))))))

(assert (= (and d!106793 c!90620) b!832772))

(assert (= (and d!106793 (not c!90620)) b!832773))

(assert (= (and b!832773 c!90621) b!832774))

(assert (= (and b!832773 (not c!90621)) b!832775))

(declare-fun m!776853 () Bool)

(assert (=> b!832774 m!776853))

(assert (=> b!832167 d!106793))

(declare-fun d!106795 () Bool)

(assert (=> d!106795 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377780 () Unit!28447)

(assert (=> d!106795 (= lt!377780 (choose!1436 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464462 () Bool)

(assert (=> d!106795 e!464462))

(declare-fun res!566433 () Bool)

(assert (=> d!106795 (=> (not res!566433) (not e!464462))))

(assert (=> d!106795 (= res!566433 (isStrictlySorted!438 (toList!4505 lt!377243)))))

(assert (=> d!106795 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377780)))

(declare-fun b!832776 () Bool)

(assert (=> b!832776 (= e!464462 (containsKey!400 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106795 res!566433) b!832776))

(assert (=> d!106795 m!775757))

(assert (=> d!106795 m!775757))

(assert (=> d!106795 m!775759))

(declare-fun m!776855 () Bool)

(assert (=> d!106795 m!776855))

(declare-fun m!776857 () Bool)

(assert (=> d!106795 m!776857))

(assert (=> b!832776 m!775753))

(assert (=> b!832057 d!106795))

(declare-fun d!106797 () Bool)

(assert (=> d!106797 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23282 () Bool)

(assert (= bs!23282 d!106797))

(assert (=> bs!23282 m!775757))

(declare-fun m!776859 () Bool)

(assert (=> bs!23282 m!776859))

(assert (=> b!832057 d!106797))

(declare-fun b!832779 () Bool)

(declare-fun e!464464 () Option!420)

(assert (=> b!832779 (= e!464464 (getValueByKey!414 (t!22308 (toList!4505 lt!377243)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832780 () Bool)

(assert (=> b!832780 (= e!464464 None!418)))

(declare-fun d!106799 () Bool)

(declare-fun c!90622 () Bool)

(assert (=> d!106799 (= c!90622 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!464463 () Option!420)

(assert (=> d!106799 (= (getValueByKey!414 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000) e!464463)))

(declare-fun b!832778 () Bool)

(assert (=> b!832778 (= e!464463 e!464464)))

(declare-fun c!90623 () Bool)

(assert (=> b!832778 (= c!90623 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832777 () Bool)

(assert (=> b!832777 (= e!464463 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377243)))))))

(assert (= (and d!106799 c!90622) b!832777))

(assert (= (and d!106799 (not c!90622)) b!832778))

(assert (= (and b!832778 c!90623) b!832779))

(assert (= (and b!832778 (not c!90623)) b!832780))

(declare-fun m!776861 () Bool)

(assert (=> b!832779 m!776861))

(assert (=> b!832057 d!106799))

(declare-fun d!106801 () Bool)

(assert (=> d!106801 (arrayContainsKey!0 _keys!976 lt!377577 #b00000000000000000000000000000000)))

(declare-fun lt!377781 () Unit!28447)

(assert (=> d!106801 (= lt!377781 (choose!13 _keys!976 lt!377577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!106801 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!106801 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377781)))

(declare-fun bs!23283 () Bool)

(assert (= bs!23283 d!106801))

(assert (=> bs!23283 m!775907))

(declare-fun m!776863 () Bool)

(assert (=> bs!23283 m!776863))

(assert (=> b!832152 d!106801))

(declare-fun d!106803 () Bool)

(declare-fun res!566434 () Bool)

(declare-fun e!464465 () Bool)

(assert (=> d!106803 (=> res!566434 e!464465)))

(assert (=> d!106803 (= res!566434 (= (select (arr!22319 _keys!976) #b00000000000000000000000000000000) lt!377577))))

(assert (=> d!106803 (= (arrayContainsKey!0 _keys!976 lt!377577 #b00000000000000000000000000000000) e!464465)))

(declare-fun b!832781 () Bool)

(declare-fun e!464466 () Bool)

(assert (=> b!832781 (= e!464465 e!464466)))

(declare-fun res!566435 () Bool)

(assert (=> b!832781 (=> (not res!566435) (not e!464466))))

(assert (=> b!832781 (= res!566435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832782 () Bool)

(assert (=> b!832782 (= e!464466 (arrayContainsKey!0 _keys!976 lt!377577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106803 (not res!566434)) b!832781))

(assert (= (and b!832781 res!566435) b!832782))

(assert (=> d!106803 m!775051))

(declare-fun m!776865 () Bool)

(assert (=> b!832782 m!776865))

(assert (=> b!832152 d!106803))

(declare-fun d!106805 () Bool)

(declare-fun lt!377784 () SeekEntryResult!8741)

(assert (=> d!106805 (and (or ((_ is Undefined!8741) lt!377784) (not ((_ is Found!8741) lt!377784)) (and (bvsge (index!37336 lt!377784) #b00000000000000000000000000000000) (bvslt (index!37336 lt!377784) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377784) ((_ is Found!8741) lt!377784) (not ((_ is MissingZero!8741) lt!377784)) (and (bvsge (index!37335 lt!377784) #b00000000000000000000000000000000) (bvslt (index!37335 lt!377784) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377784) ((_ is Found!8741) lt!377784) ((_ is MissingZero!8741) lt!377784) (not ((_ is MissingVacant!8741) lt!377784)) (and (bvsge (index!37338 lt!377784) #b00000000000000000000000000000000) (bvslt (index!37338 lt!377784) (size!22740 _keys!976)))) (or ((_ is Undefined!8741) lt!377784) (ite ((_ is Found!8741) lt!377784) (= (select (arr!22319 _keys!976) (index!37336 lt!377784)) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8741) lt!377784) (= (select (arr!22319 _keys!976) (index!37335 lt!377784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8741) lt!377784) (= (select (arr!22319 _keys!976) (index!37338 lt!377784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464467 () SeekEntryResult!8741)

(assert (=> d!106805 (= lt!377784 e!464467)))

(declare-fun c!90624 () Bool)

(declare-fun lt!377783 () SeekEntryResult!8741)

(assert (=> d!106805 (= c!90624 (and ((_ is Intermediate!8741) lt!377783) (undefined!9553 lt!377783)))))

(assert (=> d!106805 (= lt!377783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!106805 (validMask!0 mask!1312)))

(assert (=> d!106805 (= (seekEntryOrOpen!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!377784)))

(declare-fun b!832783 () Bool)

(assert (=> b!832783 (= e!464467 Undefined!8741)))

(declare-fun b!832784 () Bool)

(declare-fun e!464468 () SeekEntryResult!8741)

(assert (=> b!832784 (= e!464468 (MissingZero!8741 (index!37337 lt!377783)))))

(declare-fun b!832785 () Bool)

(assert (=> b!832785 (= e!464468 (seekKeyOrZeroReturnVacant!0 (x!70131 lt!377783) (index!37337 lt!377783) (index!37337 lt!377783) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(declare-fun b!832786 () Bool)

(declare-fun e!464469 () SeekEntryResult!8741)

(assert (=> b!832786 (= e!464467 e!464469)))

(declare-fun lt!377782 () (_ BitVec 64))

(assert (=> b!832786 (= lt!377782 (select (arr!22319 _keys!976) (index!37337 lt!377783)))))

(declare-fun c!90625 () Bool)

(assert (=> b!832786 (= c!90625 (= lt!377782 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832787 () Bool)

(assert (=> b!832787 (= e!464469 (Found!8741 (index!37337 lt!377783)))))

(declare-fun b!832788 () Bool)

(declare-fun c!90626 () Bool)

(assert (=> b!832788 (= c!90626 (= lt!377782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832788 (= e!464469 e!464468)))

(assert (= (and d!106805 c!90624) b!832783))

(assert (= (and d!106805 (not c!90624)) b!832786))

(assert (= (and b!832786 c!90625) b!832787))

(assert (= (and b!832786 (not c!90625)) b!832788))

(assert (= (and b!832788 c!90626) b!832784))

(assert (= (and b!832788 (not c!90626)) b!832785))

(declare-fun m!776867 () Bool)

(assert (=> d!106805 m!776867))

(declare-fun m!776869 () Bool)

(assert (=> d!106805 m!776869))

(assert (=> d!106805 m!775407))

(declare-fun m!776871 () Bool)

(assert (=> d!106805 m!776871))

(assert (=> d!106805 m!774915))

(assert (=> d!106805 m!776871))

(assert (=> d!106805 m!775407))

(declare-fun m!776873 () Bool)

(assert (=> d!106805 m!776873))

(declare-fun m!776875 () Bool)

(assert (=> d!106805 m!776875))

(assert (=> b!832785 m!775407))

(declare-fun m!776877 () Bool)

(assert (=> b!832785 m!776877))

(declare-fun m!776879 () Bool)

(assert (=> b!832786 m!776879))

(assert (=> b!832152 d!106805))

(declare-fun d!106807 () Bool)

(declare-fun res!566436 () Bool)

(declare-fun e!464470 () Bool)

(assert (=> d!106807 (=> res!566436 e!464470)))

(assert (=> d!106807 (= res!566436 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) lt!377310)))))

(assert (=> d!106807 (= (containsKey!400 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310) e!464470)))

(declare-fun b!832789 () Bool)

(declare-fun e!464471 () Bool)

(assert (=> b!832789 (= e!464470 e!464471)))

(declare-fun res!566437 () Bool)

(assert (=> b!832789 (=> (not res!566437) (not e!464471))))

(assert (=> b!832789 (= res!566437 (and (or (not ((_ is Cons!15945) (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) (bvsle (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) lt!377310)) ((_ is Cons!15945) (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))))) lt!377310)))))

(declare-fun b!832790 () Bool)

(assert (=> b!832790 (= e!464471 (containsKey!400 (t!22308 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))) lt!377310))))

(assert (= (and d!106807 (not res!566436)) b!832789))

(assert (= (and b!832789 res!566437) b!832790))

(declare-fun m!776881 () Bool)

(assert (=> b!832790 m!776881))

(assert (=> d!106183 d!106807))

(assert (=> b!832183 d!106617))

(assert (=> b!832183 d!106485))

(declare-fun d!106809 () Bool)

(declare-fun lt!377785 () Bool)

(assert (=> d!106809 (= lt!377785 (select (content!386 lt!377503) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464473 () Bool)

(assert (=> d!106809 (= lt!377785 e!464473)))

(declare-fun res!566438 () Bool)

(assert (=> d!106809 (=> (not res!566438) (not e!464473))))

(assert (=> d!106809 (= res!566438 ((_ is Cons!15945) lt!377503))))

(assert (=> d!106809 (= (contains!4191 lt!377503 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377785)))

(declare-fun b!832791 () Bool)

(declare-fun e!464472 () Bool)

(assert (=> b!832791 (= e!464473 e!464472)))

(declare-fun res!566439 () Bool)

(assert (=> b!832791 (=> res!566439 e!464472)))

(assert (=> b!832791 (= res!566439 (= (h!17075 lt!377503) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832792 () Bool)

(assert (=> b!832792 (= e!464472 (contains!4191 (t!22308 lt!377503) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106809 res!566438) b!832791))

(assert (= (and b!832791 (not res!566439)) b!832792))

(declare-fun m!776883 () Bool)

(assert (=> d!106809 m!776883))

(declare-fun m!776885 () Bool)

(assert (=> d!106809 m!776885))

(declare-fun m!776887 () Bool)

(assert (=> b!832792 m!776887))

(assert (=> b!831982 d!106809))

(declare-fun d!106811 () Bool)

(declare-fun res!566440 () Bool)

(declare-fun e!464474 () Bool)

(assert (=> d!106811 (=> res!566440 e!464474)))

(assert (=> d!106811 (= res!566440 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106811 (= (containsKey!400 (toList!4505 lt!377243) #b0000000000000000000000000000000000000000000000000000000000000000) e!464474)))

(declare-fun b!832793 () Bool)

(declare-fun e!464475 () Bool)

(assert (=> b!832793 (= e!464474 e!464475)))

(declare-fun res!566441 () Bool)

(assert (=> b!832793 (=> (not res!566441) (not e!464475))))

(assert (=> b!832793 (= res!566441 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377243))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377243))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377243)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377243))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832794 () Bool)

(assert (=> b!832794 (= e!464475 (containsKey!400 (t!22308 (toList!4505 lt!377243)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106811 (not res!566440)) b!832793))

(assert (= (and b!832793 res!566441) b!832794))

(declare-fun m!776889 () Bool)

(assert (=> b!832794 m!776889))

(assert (=> d!106281 d!106811))

(assert (=> d!106235 d!106233))

(declare-fun d!106813 () Bool)

(assert (=> d!106813 (= (getValueByKey!414 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106813 true))

(declare-fun _$22!577 () Unit!28447)

(assert (=> d!106813 (= (choose!1433 lt!377348 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!577)))

(declare-fun bs!23284 () Bool)

(assert (= bs!23284 d!106813))

(assert (=> bs!23284 m!775193))

(assert (=> d!106235 d!106813))

(declare-fun d!106815 () Bool)

(declare-fun res!566442 () Bool)

(declare-fun e!464476 () Bool)

(assert (=> d!106815 (=> res!566442 e!464476)))

(assert (=> d!106815 (= res!566442 (or ((_ is Nil!15946) lt!377348) ((_ is Nil!15946) (t!22308 lt!377348))))))

(assert (=> d!106815 (= (isStrictlySorted!438 lt!377348) e!464476)))

(declare-fun b!832795 () Bool)

(declare-fun e!464477 () Bool)

(assert (=> b!832795 (= e!464476 e!464477)))

(declare-fun res!566443 () Bool)

(assert (=> b!832795 (=> (not res!566443) (not e!464477))))

(assert (=> b!832795 (= res!566443 (bvslt (_1!5094 (h!17075 lt!377348)) (_1!5094 (h!17075 (t!22308 lt!377348)))))))

(declare-fun b!832796 () Bool)

(assert (=> b!832796 (= e!464477 (isStrictlySorted!438 (t!22308 lt!377348)))))

(assert (= (and d!106815 (not res!566442)) b!832795))

(assert (= (and b!832795 res!566443) b!832796))

(declare-fun m!776891 () Bool)

(assert (=> b!832796 m!776891))

(assert (=> d!106235 d!106815))

(assert (=> d!106155 d!106153))

(declare-fun d!106817 () Bool)

(assert (=> d!106817 (= (getValueByKey!414 lt!377360 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(assert (=> d!106817 true))

(declare-fun _$22!578 () Unit!28447)

(assert (=> d!106817 (= (choose!1433 lt!377360 (_1!5094 lt!377164) (_2!5094 lt!377164)) _$22!578)))

(declare-fun bs!23285 () Bool)

(assert (= bs!23285 d!106817))

(assert (=> bs!23285 m!775229))

(assert (=> d!106155 d!106817))

(declare-fun d!106819 () Bool)

(declare-fun res!566444 () Bool)

(declare-fun e!464478 () Bool)

(assert (=> d!106819 (=> res!566444 e!464478)))

(assert (=> d!106819 (= res!566444 (or ((_ is Nil!15946) lt!377360) ((_ is Nil!15946) (t!22308 lt!377360))))))

(assert (=> d!106819 (= (isStrictlySorted!438 lt!377360) e!464478)))

(declare-fun b!832797 () Bool)

(declare-fun e!464479 () Bool)

(assert (=> b!832797 (= e!464478 e!464479)))

(declare-fun res!566445 () Bool)

(assert (=> b!832797 (=> (not res!566445) (not e!464479))))

(assert (=> b!832797 (= res!566445 (bvslt (_1!5094 (h!17075 lt!377360)) (_1!5094 (h!17075 (t!22308 lt!377360)))))))

(declare-fun b!832798 () Bool)

(assert (=> b!832798 (= e!464479 (isStrictlySorted!438 (t!22308 lt!377360)))))

(assert (= (and d!106819 (not res!566444)) b!832797))

(assert (= (and b!832797 res!566445) b!832798))

(declare-fun m!776893 () Bool)

(assert (=> b!832798 m!776893))

(assert (=> d!106155 d!106819))

(declare-fun d!106821 () Bool)

(declare-fun res!566446 () Bool)

(declare-fun e!464480 () Bool)

(assert (=> d!106821 (=> res!566446 e!464480)))

(assert (=> d!106821 (= res!566446 (or ((_ is Nil!15946) lt!377529) ((_ is Nil!15946) (t!22308 lt!377529))))))

(assert (=> d!106821 (= (isStrictlySorted!438 lt!377529) e!464480)))

(declare-fun b!832799 () Bool)

(declare-fun e!464481 () Bool)

(assert (=> b!832799 (= e!464480 e!464481)))

(declare-fun res!566447 () Bool)

(assert (=> b!832799 (=> (not res!566447) (not e!464481))))

(assert (=> b!832799 (= res!566447 (bvslt (_1!5094 (h!17075 lt!377529)) (_1!5094 (h!17075 (t!22308 lt!377529)))))))

(declare-fun b!832800 () Bool)

(assert (=> b!832800 (= e!464481 (isStrictlySorted!438 (t!22308 lt!377529)))))

(assert (= (and d!106821 (not res!566446)) b!832799))

(assert (= (and b!832799 res!566447) b!832800))

(declare-fun m!776895 () Bool)

(assert (=> b!832800 m!776895))

(assert (=> d!106279 d!106821))

(declare-fun d!106823 () Bool)

(declare-fun res!566448 () Bool)

(declare-fun e!464482 () Bool)

(assert (=> d!106823 (=> res!566448 e!464482)))

(assert (=> d!106823 (= res!566448 (or ((_ is Nil!15946) (toList!4505 (+!2013 lt!377158 lt!377164))) ((_ is Nil!15946) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))))))

(assert (=> d!106823 (= (isStrictlySorted!438 (toList!4505 (+!2013 lt!377158 lt!377164))) e!464482)))

(declare-fun b!832801 () Bool)

(declare-fun e!464483 () Bool)

(assert (=> b!832801 (= e!464482 e!464483)))

(declare-fun res!566449 () Bool)

(assert (=> b!832801 (=> (not res!566449) (not e!464483))))

(assert (=> b!832801 (= res!566449 (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164)))) (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))))))))

(declare-fun b!832802 () Bool)

(assert (=> b!832802 (= e!464483 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))))))

(assert (= (and d!106823 (not res!566448)) b!832801))

(assert (= (and b!832801 res!566449) b!832802))

(declare-fun m!776897 () Bool)

(assert (=> b!832802 m!776897))

(assert (=> d!106279 d!106823))

(declare-fun d!106825 () Bool)

(assert (=> d!106825 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377319) lt!377302)) (v!10095 (getValueByKey!414 (toList!4505 lt!377319) lt!377302)))))

(assert (=> d!106191 d!106825))

(declare-fun b!832805 () Bool)

(declare-fun e!464485 () Option!420)

(assert (=> b!832805 (= e!464485 (getValueByKey!414 (t!22308 (toList!4505 lt!377319)) lt!377302))))

(declare-fun b!832806 () Bool)

(assert (=> b!832806 (= e!464485 None!418)))

(declare-fun d!106827 () Bool)

(declare-fun c!90627 () Bool)

(assert (=> d!106827 (= c!90627 (and ((_ is Cons!15945) (toList!4505 lt!377319)) (= (_1!5094 (h!17075 (toList!4505 lt!377319))) lt!377302)))))

(declare-fun e!464484 () Option!420)

(assert (=> d!106827 (= (getValueByKey!414 (toList!4505 lt!377319) lt!377302) e!464484)))

(declare-fun b!832804 () Bool)

(assert (=> b!832804 (= e!464484 e!464485)))

(declare-fun c!90628 () Bool)

(assert (=> b!832804 (= c!90628 (and ((_ is Cons!15945) (toList!4505 lt!377319)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377319))) lt!377302))))))

(declare-fun b!832803 () Bool)

(assert (=> b!832803 (= e!464484 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377319)))))))

(assert (= (and d!106827 c!90627) b!832803))

(assert (= (and d!106827 (not c!90627)) b!832804))

(assert (= (and b!832804 c!90628) b!832805))

(assert (= (and b!832804 (not c!90628)) b!832806))

(declare-fun m!776899 () Bool)

(assert (=> b!832805 m!776899))

(assert (=> d!106191 d!106827))

(declare-fun d!106829 () Bool)

(declare-fun res!566450 () Bool)

(declare-fun e!464486 () Bool)

(assert (=> d!106829 (=> res!566450 e!464486)))

(assert (=> d!106829 (= res!566450 (and ((_ is Cons!15945) lt!377529) (= (_1!5094 (h!17075 lt!377529)) (_1!5094 lt!377161))))))

(assert (=> d!106829 (= (containsKey!400 lt!377529 (_1!5094 lt!377161)) e!464486)))

(declare-fun b!832807 () Bool)

(declare-fun e!464487 () Bool)

(assert (=> b!832807 (= e!464486 e!464487)))

(declare-fun res!566451 () Bool)

(assert (=> b!832807 (=> (not res!566451) (not e!464487))))

(assert (=> b!832807 (= res!566451 (and (or (not ((_ is Cons!15945) lt!377529)) (bvsle (_1!5094 (h!17075 lt!377529)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377529) (bvslt (_1!5094 (h!17075 lt!377529)) (_1!5094 lt!377161))))))

(declare-fun b!832808 () Bool)

(assert (=> b!832808 (= e!464487 (containsKey!400 (t!22308 lt!377529) (_1!5094 lt!377161)))))

(assert (= (and d!106829 (not res!566450)) b!832807))

(assert (= (and b!832807 res!566451) b!832808))

(declare-fun m!776901 () Bool)

(assert (=> b!832808 m!776901))

(assert (=> b!832048 d!106829))

(assert (=> b!831874 d!106541))

(declare-fun d!106831 () Bool)

(declare-fun e!464489 () Bool)

(assert (=> d!106831 e!464489))

(declare-fun res!566452 () Bool)

(assert (=> d!106831 (=> res!566452 e!464489)))

(declare-fun lt!377788 () Bool)

(assert (=> d!106831 (= res!566452 (not lt!377788))))

(declare-fun lt!377786 () Bool)

(assert (=> d!106831 (= lt!377788 lt!377786)))

(declare-fun lt!377789 () Unit!28447)

(declare-fun e!464488 () Unit!28447)

(assert (=> d!106831 (= lt!377789 e!464488)))

(declare-fun c!90629 () Bool)

(assert (=> d!106831 (= c!90629 lt!377786)))

(assert (=> d!106831 (= lt!377786 (containsKey!400 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106831 (= (contains!4190 lt!377378 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377788)))

(declare-fun b!832809 () Bool)

(declare-fun lt!377787 () Unit!28447)

(assert (=> b!832809 (= e!464488 lt!377787)))

(assert (=> b!832809 (= lt!377787 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!832809 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832810 () Bool)

(declare-fun Unit!28495 () Unit!28447)

(assert (=> b!832810 (= e!464488 Unit!28495)))

(declare-fun b!832811 () Bool)

(assert (=> b!832811 (= e!464489 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106831 c!90629) b!832809))

(assert (= (and d!106831 (not c!90629)) b!832810))

(assert (= (and d!106831 (not res!566452)) b!832811))

(declare-fun m!776903 () Bool)

(assert (=> d!106831 m!776903))

(declare-fun m!776905 () Bool)

(assert (=> b!832809 m!776905))

(assert (=> b!832809 m!775273))

(assert (=> b!832809 m!775273))

(declare-fun m!776907 () Bool)

(assert (=> b!832809 m!776907))

(assert (=> b!832811 m!775273))

(assert (=> b!832811 m!775273))

(assert (=> b!832811 m!776907))

(assert (=> d!106137 d!106831))

(declare-fun e!464491 () Option!420)

(declare-fun b!832814 () Bool)

(assert (=> b!832814 (= e!464491 (getValueByKey!414 (t!22308 lt!377377) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832815 () Bool)

(assert (=> b!832815 (= e!464491 None!418)))

(declare-fun c!90630 () Bool)

(declare-fun d!106833 () Bool)

(assert (=> d!106833 (= c!90630 (and ((_ is Cons!15945) lt!377377) (= (_1!5094 (h!17075 lt!377377)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464490 () Option!420)

(assert (=> d!106833 (= (getValueByKey!414 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464490)))

(declare-fun b!832813 () Bool)

(assert (=> b!832813 (= e!464490 e!464491)))

(declare-fun c!90631 () Bool)

(assert (=> b!832813 (= c!90631 (and ((_ is Cons!15945) lt!377377) (not (= (_1!5094 (h!17075 lt!377377)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832812 () Bool)

(assert (=> b!832812 (= e!464490 (Some!419 (_2!5094 (h!17075 lt!377377))))))

(assert (= (and d!106833 c!90630) b!832812))

(assert (= (and d!106833 (not c!90630)) b!832813))

(assert (= (and b!832813 c!90631) b!832814))

(assert (= (and b!832813 (not c!90631)) b!832815))

(declare-fun m!776909 () Bool)

(assert (=> b!832814 m!776909))

(assert (=> d!106137 d!106833))

(declare-fun d!106835 () Bool)

(assert (=> d!106835 (= (getValueByKey!414 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377790 () Unit!28447)

(assert (=> d!106835 (= lt!377790 (choose!1433 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464492 () Bool)

(assert (=> d!106835 e!464492))

(declare-fun res!566453 () Bool)

(assert (=> d!106835 (=> (not res!566453) (not e!464492))))

(assert (=> d!106835 (= res!566453 (isStrictlySorted!438 lt!377377))))

(assert (=> d!106835 (= (lemmaContainsTupThenGetReturnValue!231 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377790)))

(declare-fun b!832816 () Bool)

(declare-fun res!566454 () Bool)

(assert (=> b!832816 (=> (not res!566454) (not e!464492))))

(assert (=> b!832816 (= res!566454 (containsKey!400 lt!377377 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832817 () Bool)

(assert (=> b!832817 (= e!464492 (contains!4191 lt!377377 (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106835 res!566453) b!832816))

(assert (= (and b!832816 res!566454) b!832817))

(assert (=> d!106835 m!775267))

(declare-fun m!776911 () Bool)

(assert (=> d!106835 m!776911))

(declare-fun m!776913 () Bool)

(assert (=> d!106835 m!776913))

(declare-fun m!776915 () Bool)

(assert (=> b!832816 m!776915))

(declare-fun m!776917 () Bool)

(assert (=> b!832817 m!776917))

(assert (=> d!106137 d!106835))

(declare-fun lt!377791 () List!15949)

(declare-fun e!464493 () Bool)

(declare-fun b!832818 () Bool)

(assert (=> b!832818 (= e!464493 (contains!4191 lt!377791 (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832819 () Bool)

(declare-fun res!566456 () Bool)

(assert (=> b!832819 (=> (not res!566456) (not e!464493))))

(assert (=> b!832819 (= res!566456 (containsKey!400 lt!377791 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832820 () Bool)

(declare-fun e!464495 () List!15949)

(declare-fun call!36443 () List!15949)

(assert (=> b!832820 (= e!464495 call!36443)))

(declare-fun bm!36440 () Bool)

(declare-fun c!90632 () Bool)

(declare-fun call!36445 () List!15949)

(declare-fun e!464497 () List!15949)

(assert (=> bm!36440 (= call!36445 ($colon$colon!536 e!464497 (ite c!90632 (h!17075 (toList!4505 call!36336)) (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90633 () Bool)

(assert (=> bm!36440 (= c!90633 c!90632)))

(declare-fun b!832822 () Bool)

(declare-fun e!464496 () List!15949)

(assert (=> b!832822 (= e!464496 call!36445)))

(declare-fun bm!36441 () Bool)

(declare-fun call!36444 () List!15949)

(assert (=> bm!36441 (= call!36444 call!36445)))

(declare-fun b!832823 () Bool)

(declare-fun e!464494 () List!15949)

(assert (=> b!832823 (= e!464494 call!36444)))

(declare-fun c!90635 () Bool)

(declare-fun c!90634 () Bool)

(declare-fun b!832824 () Bool)

(assert (=> b!832824 (= e!464497 (ite c!90635 (t!22308 (toList!4505 call!36336)) (ite c!90634 (Cons!15945 (h!17075 (toList!4505 call!36336)) (t!22308 (toList!4505 call!36336))) Nil!15946)))))

(declare-fun b!832825 () Bool)

(assert (=> b!832825 (= e!464495 call!36443)))

(declare-fun bm!36442 () Bool)

(assert (=> bm!36442 (= call!36443 call!36444)))

(declare-fun b!832826 () Bool)

(assert (=> b!832826 (= e!464496 e!464494)))

(assert (=> b!832826 (= c!90635 (and ((_ is Cons!15945) (toList!4505 call!36336)) (= (_1!5094 (h!17075 (toList!4505 call!36336))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832827 () Bool)

(assert (=> b!832827 (= e!464497 (insertStrictlySorted!270 (t!22308 (toList!4505 call!36336)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832821 () Bool)

(assert (=> b!832821 (= c!90634 (and ((_ is Cons!15945) (toList!4505 call!36336)) (bvsgt (_1!5094 (h!17075 (toList!4505 call!36336))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!832821 (= e!464494 e!464495)))

(declare-fun d!106837 () Bool)

(assert (=> d!106837 e!464493))

(declare-fun res!566455 () Bool)

(assert (=> d!106837 (=> (not res!566455) (not e!464493))))

(assert (=> d!106837 (= res!566455 (isStrictlySorted!438 lt!377791))))

(assert (=> d!106837 (= lt!377791 e!464496)))

(assert (=> d!106837 (= c!90632 (and ((_ is Cons!15945) (toList!4505 call!36336)) (bvslt (_1!5094 (h!17075 (toList!4505 call!36336))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106837 (isStrictlySorted!438 (toList!4505 call!36336))))

(assert (=> d!106837 (= (insertStrictlySorted!270 (toList!4505 call!36336) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377791)))

(assert (= (and d!106837 c!90632) b!832822))

(assert (= (and d!106837 (not c!90632)) b!832826))

(assert (= (and b!832826 c!90635) b!832823))

(assert (= (and b!832826 (not c!90635)) b!832821))

(assert (= (and b!832821 c!90634) b!832820))

(assert (= (and b!832821 (not c!90634)) b!832825))

(assert (= (or b!832820 b!832825) bm!36442))

(assert (= (or b!832823 bm!36442) bm!36441))

(assert (= (or b!832822 bm!36441) bm!36440))

(assert (= (and bm!36440 c!90633) b!832827))

(assert (= (and bm!36440 (not c!90633)) b!832824))

(assert (= (and d!106837 res!566455) b!832819))

(assert (= (and b!832819 res!566456) b!832818))

(declare-fun m!776919 () Bool)

(assert (=> b!832818 m!776919))

(declare-fun m!776921 () Bool)

(assert (=> d!106837 m!776921))

(declare-fun m!776923 () Bool)

(assert (=> d!106837 m!776923))

(declare-fun m!776925 () Bool)

(assert (=> b!832819 m!776925))

(declare-fun m!776927 () Bool)

(assert (=> bm!36440 m!776927))

(declare-fun m!776929 () Bool)

(assert (=> b!832827 m!776929))

(assert (=> d!106137 d!106837))

(declare-fun d!106839 () Bool)

(declare-fun lt!377792 () Bool)

(assert (=> d!106839 (= lt!377792 (select (content!386 lt!377356) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun e!464499 () Bool)

(assert (=> d!106839 (= lt!377792 e!464499)))

(declare-fun res!566457 () Bool)

(assert (=> d!106839 (=> (not res!566457) (not e!464499))))

(assert (=> d!106839 (= res!566457 ((_ is Cons!15945) lt!377356))))

(assert (=> d!106839 (= (contains!4191 lt!377356 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) lt!377792)))

(declare-fun b!832828 () Bool)

(declare-fun e!464498 () Bool)

(assert (=> b!832828 (= e!464499 e!464498)))

(declare-fun res!566458 () Bool)

(assert (=> b!832828 (=> res!566458 e!464498)))

(assert (=> b!832828 (= res!566458 (= (h!17075 lt!377356) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!832829 () Bool)

(assert (=> b!832829 (= e!464498 (contains!4191 (t!22308 lt!377356) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!106839 res!566457) b!832828))

(assert (= (and b!832828 (not res!566458)) b!832829))

(declare-fun m!776931 () Bool)

(assert (=> d!106839 m!776931))

(declare-fun m!776933 () Bool)

(assert (=> d!106839 m!776933))

(declare-fun m!776935 () Bool)

(assert (=> b!832829 m!776935))

(assert (=> b!831920 d!106839))

(assert (=> d!106321 d!106319))

(declare-fun d!106841 () Bool)

(assert (=> d!106841 (= (getValueByKey!414 lt!377217 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!106841 true))

(declare-fun _$22!579 () Unit!28447)

(assert (=> d!106841 (= (choose!1433 lt!377217 (_1!5094 lt!377161) (_2!5094 lt!377161)) _$22!579)))

(declare-fun bs!23286 () Bool)

(assert (= bs!23286 d!106841))

(assert (=> bs!23286 m!775013))

(assert (=> d!106321 d!106841))

(declare-fun d!106843 () Bool)

(declare-fun res!566459 () Bool)

(declare-fun e!464500 () Bool)

(assert (=> d!106843 (=> res!566459 e!464500)))

(assert (=> d!106843 (= res!566459 (or ((_ is Nil!15946) lt!377217) ((_ is Nil!15946) (t!22308 lt!377217))))))

(assert (=> d!106843 (= (isStrictlySorted!438 lt!377217) e!464500)))

(declare-fun b!832830 () Bool)

(declare-fun e!464501 () Bool)

(assert (=> b!832830 (= e!464500 e!464501)))

(declare-fun res!566460 () Bool)

(assert (=> b!832830 (=> (not res!566460) (not e!464501))))

(assert (=> b!832830 (= res!566460 (bvslt (_1!5094 (h!17075 lt!377217)) (_1!5094 (h!17075 (t!22308 lt!377217)))))))

(declare-fun b!832831 () Bool)

(assert (=> b!832831 (= e!464501 (isStrictlySorted!438 (t!22308 lt!377217)))))

(assert (= (and d!106843 (not res!566459)) b!832830))

(assert (= (and b!832830 res!566460) b!832831))

(declare-fun m!776937 () Bool)

(assert (=> b!832831 m!776937))

(assert (=> d!106321 d!106843))

(declare-fun lt!377793 () Bool)

(declare-fun d!106845 () Bool)

(assert (=> d!106845 (= lt!377793 (select (content!386 (toList!4505 lt!377605)) (tuple2!10167 lt!377343 minValue!754)))))

(declare-fun e!464503 () Bool)

(assert (=> d!106845 (= lt!377793 e!464503)))

(declare-fun res!566461 () Bool)

(assert (=> d!106845 (=> (not res!566461) (not e!464503))))

(assert (=> d!106845 (= res!566461 ((_ is Cons!15945) (toList!4505 lt!377605)))))

(assert (=> d!106845 (= (contains!4191 (toList!4505 lt!377605) (tuple2!10167 lt!377343 minValue!754)) lt!377793)))

(declare-fun b!832832 () Bool)

(declare-fun e!464502 () Bool)

(assert (=> b!832832 (= e!464503 e!464502)))

(declare-fun res!566462 () Bool)

(assert (=> b!832832 (=> res!566462 e!464502)))

(assert (=> b!832832 (= res!566462 (= (h!17075 (toList!4505 lt!377605)) (tuple2!10167 lt!377343 minValue!754)))))

(declare-fun b!832833 () Bool)

(assert (=> b!832833 (= e!464502 (contains!4191 (t!22308 (toList!4505 lt!377605)) (tuple2!10167 lt!377343 minValue!754)))))

(assert (= (and d!106845 res!566461) b!832832))

(assert (= (and b!832832 (not res!566462)) b!832833))

(declare-fun m!776939 () Bool)

(assert (=> d!106845 m!776939))

(declare-fun m!776941 () Bool)

(assert (=> d!106845 m!776941))

(declare-fun m!776943 () Bool)

(assert (=> b!832833 m!776943))

(assert (=> b!832172 d!106845))

(declare-fun d!106847 () Bool)

(declare-fun e!464505 () Bool)

(assert (=> d!106847 e!464505))

(declare-fun res!566463 () Bool)

(assert (=> d!106847 (=> res!566463 e!464505)))

(declare-fun lt!377796 () Bool)

(assert (=> d!106847 (= res!566463 (not lt!377796))))

(declare-fun lt!377794 () Bool)

(assert (=> d!106847 (= lt!377796 lt!377794)))

(declare-fun lt!377797 () Unit!28447)

(declare-fun e!464504 () Unit!28447)

(assert (=> d!106847 (= lt!377797 e!464504)))

(declare-fun c!90636 () Bool)

(assert (=> d!106847 (= c!90636 lt!377794)))

(assert (=> d!106847 (= lt!377794 (containsKey!400 (toList!4505 lt!377547) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!106847 (= (contains!4190 lt!377547 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377796)))

(declare-fun b!832834 () Bool)

(declare-fun lt!377795 () Unit!28447)

(assert (=> b!832834 (= e!464504 lt!377795)))

(assert (=> b!832834 (= lt!377795 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377547) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832834 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832835 () Bool)

(declare-fun Unit!28496 () Unit!28447)

(assert (=> b!832835 (= e!464504 Unit!28496)))

(declare-fun b!832836 () Bool)

(assert (=> b!832836 (= e!464505 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377547) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!106847 c!90636) b!832834))

(assert (= (and d!106847 (not c!90636)) b!832835))

(assert (= (and d!106847 (not res!566463)) b!832836))

(assert (=> d!106847 m!775407))

(declare-fun m!776945 () Bool)

(assert (=> d!106847 m!776945))

(assert (=> b!832834 m!775407))

(declare-fun m!776947 () Bool)

(assert (=> b!832834 m!776947))

(assert (=> b!832834 m!775407))

(declare-fun m!776949 () Bool)

(assert (=> b!832834 m!776949))

(assert (=> b!832834 m!776949))

(declare-fun m!776951 () Bool)

(assert (=> b!832834 m!776951))

(assert (=> b!832836 m!775407))

(assert (=> b!832836 m!776949))

(assert (=> b!832836 m!776949))

(assert (=> b!832836 m!776951))

(assert (=> b!832101 d!106847))

(declare-fun d!106849 () Bool)

(assert (=> d!106849 (= (apply!373 lt!377435 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11832 (getValueByKey!414 (toList!4505 lt!377435) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23287 () Bool)

(assert (= bs!23287 d!106849))

(assert (=> bs!23287 m!775407))

(declare-fun m!776953 () Bool)

(assert (=> bs!23287 m!776953))

(assert (=> bs!23287 m!776953))

(declare-fun m!776955 () Bool)

(assert (=> bs!23287 m!776955))

(assert (=> b!831881 d!106849))

(declare-fun d!106851 () Bool)

(declare-fun c!90637 () Bool)

(assert (=> d!106851 (= c!90637 ((_ is ValueCellFull!7190) (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!464506 () V!25283)

(assert (=> d!106851 (= (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!464506)))

(declare-fun b!832837 () Bool)

(assert (=> b!832837 (= e!464506 (get!11830 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832838 () Bool)

(assert (=> b!832838 (= e!464506 (get!11831 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106851 c!90637) b!832837))

(assert (= (and d!106851 (not c!90637)) b!832838))

(assert (=> b!832837 m!775399))

(assert (=> b!832837 m!775043))

(declare-fun m!776957 () Bool)

(assert (=> b!832837 m!776957))

(assert (=> b!832838 m!775399))

(assert (=> b!832838 m!775043))

(declare-fun m!776959 () Bool)

(assert (=> b!832838 m!776959))

(assert (=> b!831881 d!106851))

(declare-fun e!464508 () Option!420)

(declare-fun b!832841 () Bool)

(assert (=> b!832841 (= e!464508 (getValueByKey!414 (t!22308 (toList!4505 lt!377378)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832842 () Bool)

(assert (=> b!832842 (= e!464508 None!418)))

(declare-fun c!90638 () Bool)

(declare-fun d!106853 () Bool)

(assert (=> d!106853 (= c!90638 (and ((_ is Cons!15945) (toList!4505 lt!377378)) (= (_1!5094 (h!17075 (toList!4505 lt!377378))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464507 () Option!420)

(assert (=> d!106853 (= (getValueByKey!414 (toList!4505 lt!377378) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464507)))

(declare-fun b!832840 () Bool)

(assert (=> b!832840 (= e!464507 e!464508)))

(declare-fun c!90639 () Bool)

(assert (=> b!832840 (= c!90639 (and ((_ is Cons!15945) (toList!4505 lt!377378)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377378))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832839 () Bool)

(assert (=> b!832839 (= e!464507 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377378)))))))

(assert (= (and d!106853 c!90638) b!832839))

(assert (= (and d!106853 (not c!90638)) b!832840))

(assert (= (and b!832840 c!90639) b!832841))

(assert (= (and b!832840 (not c!90639)) b!832842))

(declare-fun m!776961 () Bool)

(assert (=> b!832841 m!776961))

(assert (=> b!831778 d!106853))

(declare-fun d!106855 () Bool)

(declare-fun res!566464 () Bool)

(declare-fun e!464509 () Bool)

(assert (=> d!106855 (=> res!566464 e!464509)))

(assert (=> d!106855 (= res!566464 (or ((_ is Nil!15946) lt!377539) ((_ is Nil!15946) (t!22308 lt!377539))))))

(assert (=> d!106855 (= (isStrictlySorted!438 lt!377539) e!464509)))

(declare-fun b!832843 () Bool)

(declare-fun e!464510 () Bool)

(assert (=> b!832843 (= e!464509 e!464510)))

(declare-fun res!566465 () Bool)

(assert (=> b!832843 (=> (not res!566465) (not e!464510))))

(assert (=> b!832843 (= res!566465 (bvslt (_1!5094 (h!17075 lt!377539)) (_1!5094 (h!17075 (t!22308 lt!377539)))))))

(declare-fun b!832844 () Bool)

(assert (=> b!832844 (= e!464510 (isStrictlySorted!438 (t!22308 lt!377539)))))

(assert (= (and d!106855 (not res!566464)) b!832843))

(assert (= (and b!832843 res!566465) b!832844))

(declare-fun m!776963 () Bool)

(assert (=> b!832844 m!776963))

(assert (=> d!106293 d!106855))

(declare-fun d!106857 () Bool)

(declare-fun res!566466 () Bool)

(declare-fun e!464511 () Bool)

(assert (=> d!106857 (=> res!566466 e!464511)))

(assert (=> d!106857 (= res!566466 (or ((_ is Nil!15946) (toList!4505 lt!377163)) ((_ is Nil!15946) (t!22308 (toList!4505 lt!377163)))))))

(assert (=> d!106857 (= (isStrictlySorted!438 (toList!4505 lt!377163)) e!464511)))

(declare-fun b!832845 () Bool)

(declare-fun e!464512 () Bool)

(assert (=> b!832845 (= e!464511 e!464512)))

(declare-fun res!566467 () Bool)

(assert (=> b!832845 (=> (not res!566467) (not e!464512))))

(assert (=> b!832845 (= res!566467 (bvslt (_1!5094 (h!17075 (toList!4505 lt!377163))) (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163))))))))

(declare-fun b!832846 () Bool)

(assert (=> b!832846 (= e!464512 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377163))))))

(assert (= (and d!106857 (not res!566466)) b!832845))

(assert (= (and b!832845 res!566467) b!832846))

(assert (=> b!832846 m!776225))

(assert (=> d!106293 d!106857))

(declare-fun d!106859 () Bool)

(assert (=> d!106859 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(declare-fun lt!377798 () Unit!28447)

(assert (=> d!106859 (= lt!377798 (choose!1436 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(declare-fun e!464513 () Bool)

(assert (=> d!106859 e!464513))

(declare-fun res!566468 () Bool)

(assert (=> d!106859 (=> (not res!566468) (not e!464513))))

(assert (=> d!106859 (= res!566468 (isStrictlySorted!438 (toList!4505 lt!377361)))))

(assert (=> d!106859 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377361) (_1!5094 lt!377164)) lt!377798)))

(declare-fun b!832847 () Bool)

(assert (=> b!832847 (= e!464513 (containsKey!400 (toList!4505 lt!377361) (_1!5094 lt!377164)))))

(assert (= (and d!106859 res!566468) b!832847))

(assert (=> d!106859 m!775235))

(assert (=> d!106859 m!775235))

(assert (=> d!106859 m!775321))

(declare-fun m!776965 () Bool)

(assert (=> d!106859 m!776965))

(declare-fun m!776967 () Bool)

(assert (=> d!106859 m!776967))

(assert (=> b!832847 m!775317))

(assert (=> b!831803 d!106859))

(declare-fun d!106861 () Bool)

(assert (=> d!106861 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164))) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377361) (_1!5094 lt!377164)))))))

(declare-fun bs!23288 () Bool)

(assert (= bs!23288 d!106861))

(assert (=> bs!23288 m!775235))

(declare-fun m!776969 () Bool)

(assert (=> bs!23288 m!776969))

(assert (=> b!831803 d!106861))

(assert (=> b!831803 d!106267))

(declare-fun d!106863 () Bool)

(assert (=> d!106863 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377799 () Unit!28447)

(assert (=> d!106863 (= lt!377799 (choose!1436 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464514 () Bool)

(assert (=> d!106863 e!464514))

(declare-fun res!566469 () Bool)

(assert (=> d!106863 (=> (not res!566469) (not e!464514))))

(assert (=> d!106863 (= res!566469 (isStrictlySorted!438 (toList!4505 lt!377340)))))

(assert (=> d!106863 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377799)))

(declare-fun b!832848 () Bool)

(assert (=> b!832848 (= e!464514 (containsKey!400 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106863 res!566469) b!832848))

(assert (=> d!106863 m!775715))

(assert (=> d!106863 m!775715))

(assert (=> d!106863 m!775717))

(declare-fun m!776971 () Bool)

(assert (=> d!106863 m!776971))

(assert (=> d!106863 m!776499))

(assert (=> b!832848 m!775711))

(assert (=> b!832031 d!106863))

(declare-fun d!106865 () Bool)

(assert (=> d!106865 (= (isDefined!311 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!664 (getValueByKey!414 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23289 () Bool)

(assert (= bs!23289 d!106865))

(assert (=> bs!23289 m!775715))

(declare-fun m!776973 () Bool)

(assert (=> bs!23289 m!776973))

(assert (=> b!832031 d!106865))

(assert (=> b!832031 d!106441))

(declare-fun d!106867 () Bool)

(declare-fun res!566470 () Bool)

(declare-fun e!464515 () Bool)

(assert (=> d!106867 (=> res!566470 e!464515)))

(assert (=> d!106867 (= res!566470 (and ((_ is Cons!15945) lt!377539) (= (_1!5094 (h!17075 lt!377539)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106867 (= (containsKey!400 lt!377539 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464515)))

(declare-fun b!832849 () Bool)

(declare-fun e!464516 () Bool)

(assert (=> b!832849 (= e!464515 e!464516)))

(declare-fun res!566471 () Bool)

(assert (=> b!832849 (=> (not res!566471) (not e!464516))))

(assert (=> b!832849 (= res!566471 (and (or (not ((_ is Cons!15945) lt!377539)) (bvsle (_1!5094 (h!17075 lt!377539)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377539) (bvslt (_1!5094 (h!17075 lt!377539)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832850 () Bool)

(assert (=> b!832850 (= e!464516 (containsKey!400 (t!22308 lt!377539) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106867 (not res!566470)) b!832849))

(assert (= (and b!832849 res!566471) b!832850))

(declare-fun m!776975 () Bool)

(assert (=> b!832850 m!776975))

(assert (=> b!832070 d!106867))

(assert (=> d!106369 d!106351))

(declare-fun d!106869 () Bool)

(assert (=> d!106869 (= (apply!373 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)) lt!377334) (apply!373 lt!377328 lt!377334))))

(assert (=> d!106869 true))

(declare-fun _$34!1153 () Unit!28447)

(assert (=> d!106869 (= (choose!1435 lt!377328 lt!377343 minValue!754 lt!377334) _$34!1153)))

(declare-fun bs!23290 () Bool)

(assert (= bs!23290 d!106869))

(assert (=> bs!23290 m!775151))

(assert (=> bs!23290 m!775151))

(assert (=> bs!23290 m!775169))

(assert (=> bs!23290 m!775175))

(assert (=> d!106369 d!106869))

(declare-fun d!106871 () Bool)

(declare-fun e!464518 () Bool)

(assert (=> d!106871 e!464518))

(declare-fun res!566472 () Bool)

(assert (=> d!106871 (=> res!566472 e!464518)))

(declare-fun lt!377802 () Bool)

(assert (=> d!106871 (= res!566472 (not lt!377802))))

(declare-fun lt!377800 () Bool)

(assert (=> d!106871 (= lt!377802 lt!377800)))

(declare-fun lt!377803 () Unit!28447)

(declare-fun e!464517 () Unit!28447)

(assert (=> d!106871 (= lt!377803 e!464517)))

(declare-fun c!90640 () Bool)

(assert (=> d!106871 (= c!90640 lt!377800)))

(assert (=> d!106871 (= lt!377800 (containsKey!400 (toList!4505 lt!377328) lt!377334))))

(assert (=> d!106871 (= (contains!4190 lt!377328 lt!377334) lt!377802)))

(declare-fun b!832851 () Bool)

(declare-fun lt!377801 () Unit!28447)

(assert (=> b!832851 (= e!464517 lt!377801)))

(assert (=> b!832851 (= lt!377801 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377328) lt!377334))))

(assert (=> b!832851 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377328) lt!377334))))

(declare-fun b!832852 () Bool)

(declare-fun Unit!28497 () Unit!28447)

(assert (=> b!832852 (= e!464517 Unit!28497)))

(declare-fun b!832853 () Bool)

(assert (=> b!832853 (= e!464518 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377328) lt!377334)))))

(assert (= (and d!106871 c!90640) b!832851))

(assert (= (and d!106871 (not c!90640)) b!832852))

(assert (= (and d!106871 (not res!566472)) b!832853))

(declare-fun m!776977 () Bool)

(assert (=> d!106871 m!776977))

(declare-fun m!776979 () Bool)

(assert (=> b!832851 m!776979))

(assert (=> b!832851 m!775973))

(assert (=> b!832851 m!775973))

(declare-fun m!776981 () Bool)

(assert (=> b!832851 m!776981))

(assert (=> b!832853 m!775973))

(assert (=> b!832853 m!775973))

(assert (=> b!832853 m!776981))

(assert (=> d!106369 d!106871))

(assert (=> d!106369 d!106363))

(assert (=> d!106369 d!106377))

(declare-fun d!106873 () Bool)

(declare-fun res!566473 () Bool)

(declare-fun e!464519 () Bool)

(assert (=> d!106873 (=> res!566473 e!464519)))

(assert (=> d!106873 (= res!566473 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) lt!377253)))))

(assert (=> d!106873 (= (containsKey!400 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253) e!464519)))

(declare-fun b!832854 () Bool)

(declare-fun e!464520 () Bool)

(assert (=> b!832854 (= e!464519 e!464520)))

(declare-fun res!566474 () Bool)

(assert (=> b!832854 (=> (not res!566474) (not e!464520))))

(assert (=> b!832854 (= res!566474 (and (or (not ((_ is Cons!15945) (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) (bvsle (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) lt!377253)) ((_ is Cons!15945) (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))))) lt!377253)))))

(declare-fun b!832855 () Bool)

(assert (=> b!832855 (= e!464520 (containsKey!400 (t!22308 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))) lt!377253))))

(assert (= (and d!106873 (not res!566473)) b!832854))

(assert (= (and b!832854 res!566474) b!832855))

(declare-fun m!776983 () Bool)

(assert (=> b!832855 m!776983))

(assert (=> d!106145 d!106873))

(declare-fun d!106875 () Bool)

(declare-fun res!566475 () Bool)

(declare-fun e!464521 () Bool)

(assert (=> d!106875 (=> res!566475 e!464521)))

(assert (=> d!106875 (= res!566475 (and ((_ is Cons!15945) lt!377565) (= (_1!5094 (h!17075 lt!377565)) (_1!5094 lt!377161))))))

(assert (=> d!106875 (= (containsKey!400 lt!377565 (_1!5094 lt!377161)) e!464521)))

(declare-fun b!832856 () Bool)

(declare-fun e!464522 () Bool)

(assert (=> b!832856 (= e!464521 e!464522)))

(declare-fun res!566476 () Bool)

(assert (=> b!832856 (=> (not res!566476) (not e!464522))))

(assert (=> b!832856 (= res!566476 (and (or (not ((_ is Cons!15945) lt!377565)) (bvsle (_1!5094 (h!17075 lt!377565)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377565) (bvslt (_1!5094 (h!17075 lt!377565)) (_1!5094 lt!377161))))))

(declare-fun b!832857 () Bool)

(assert (=> b!832857 (= e!464522 (containsKey!400 (t!22308 lt!377565) (_1!5094 lt!377161)))))

(assert (= (and d!106875 (not res!566475)) b!832856))

(assert (= (and b!832856 res!566476) b!832857))

(declare-fun m!776985 () Bool)

(assert (=> b!832857 m!776985))

(assert (=> b!832128 d!106875))

(assert (=> b!831865 d!106677))

(assert (=> b!831865 d!106679))

(declare-fun d!106877 () Bool)

(declare-fun lt!377804 () Bool)

(assert (=> d!106877 (= lt!377804 (select (content!386 lt!377352) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464524 () Bool)

(assert (=> d!106877 (= lt!377804 e!464524)))

(declare-fun res!566477 () Bool)

(assert (=> d!106877 (=> (not res!566477) (not e!464524))))

(assert (=> d!106877 (= res!566477 ((_ is Cons!15945) lt!377352))))

(assert (=> d!106877 (= (contains!4191 lt!377352 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377804)))

(declare-fun b!832858 () Bool)

(declare-fun e!464523 () Bool)

(assert (=> b!832858 (= e!464524 e!464523)))

(declare-fun res!566478 () Bool)

(assert (=> b!832858 (=> res!566478 e!464523)))

(assert (=> b!832858 (= res!566478 (= (h!17075 lt!377352) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832859 () Bool)

(assert (=> b!832859 (= e!464523 (contains!4191 (t!22308 lt!377352) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106877 res!566477) b!832858))

(assert (= (and b!832858 (not res!566478)) b!832859))

(declare-fun m!776987 () Bool)

(assert (=> d!106877 m!776987))

(declare-fun m!776989 () Bool)

(assert (=> d!106877 m!776989))

(declare-fun m!776991 () Bool)

(assert (=> b!832859 m!776991))

(assert (=> b!831981 d!106877))

(declare-fun b!832862 () Bool)

(declare-fun e!464526 () Option!420)

(assert (=> b!832862 (= e!464526 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377257))) (_1!5094 lt!377161)))))

(declare-fun b!832863 () Bool)

(assert (=> b!832863 (= e!464526 None!418)))

(declare-fun d!106879 () Bool)

(declare-fun c!90641 () Bool)

(assert (=> d!106879 (= c!90641 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377257))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377257)))) (_1!5094 lt!377161))))))

(declare-fun e!464525 () Option!420)

(assert (=> d!106879 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377257)) (_1!5094 lt!377161)) e!464525)))

(declare-fun b!832861 () Bool)

(assert (=> b!832861 (= e!464525 e!464526)))

(declare-fun c!90642 () Bool)

(assert (=> b!832861 (= c!90642 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377257))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377257)))) (_1!5094 lt!377161)))))))

(declare-fun b!832860 () Bool)

(assert (=> b!832860 (= e!464525 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377257))))))))

(assert (= (and d!106879 c!90641) b!832860))

(assert (= (and d!106879 (not c!90641)) b!832861))

(assert (= (and b!832861 c!90642) b!832862))

(assert (= (and b!832861 (not c!90642)) b!832863))

(declare-fun m!776993 () Bool)

(assert (=> b!832862 m!776993))

(assert (=> b!832114 d!106879))

(assert (=> d!106259 d!106261))

(declare-fun d!106881 () Bool)

(assert (=> d!106881 (arrayContainsKey!0 _keys!976 lt!377373 #b00000000000000000000000000000000)))

(assert (=> d!106881 true))

(declare-fun _$60!394 () Unit!28447)

(assert (=> d!106881 (= (choose!13 _keys!976 lt!377373 #b00000000000000000000000000000000) _$60!394)))

(declare-fun bs!23291 () Bool)

(assert (= bs!23291 d!106881))

(assert (=> bs!23291 m!775253))

(assert (=> d!106259 d!106881))

(declare-fun d!106883 () Bool)

(declare-fun res!566479 () Bool)

(declare-fun e!464527 () Bool)

(assert (=> d!106883 (=> res!566479 e!464527)))

(assert (=> d!106883 (= res!566479 (and ((_ is Cons!15945) lt!377496) (= (_1!5094 (h!17075 lt!377496)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106883 (= (containsKey!400 lt!377496 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464527)))

(declare-fun b!832864 () Bool)

(declare-fun e!464528 () Bool)

(assert (=> b!832864 (= e!464527 e!464528)))

(declare-fun res!566480 () Bool)

(assert (=> b!832864 (=> (not res!566480) (not e!464528))))

(assert (=> b!832864 (= res!566480 (and (or (not ((_ is Cons!15945) lt!377496)) (bvsle (_1!5094 (h!17075 lt!377496)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377496) (bvslt (_1!5094 (h!17075 lt!377496)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832865 () Bool)

(assert (=> b!832865 (= e!464528 (containsKey!400 (t!22308 lt!377496) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106883 (not res!566479)) b!832864))

(assert (= (and b!832864 res!566480) b!832865))

(declare-fun m!776995 () Bool)

(assert (=> b!832865 m!776995))

(assert (=> b!831962 d!106883))

(declare-fun lt!377805 () Bool)

(declare-fun d!106885 () Bool)

(assert (=> d!106885 (= lt!377805 (select (content!386 (toList!4505 lt!377430)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464530 () Bool)

(assert (=> d!106885 (= lt!377805 e!464530)))

(declare-fun res!566481 () Bool)

(assert (=> d!106885 (=> (not res!566481) (not e!464530))))

(assert (=> d!106885 (= res!566481 ((_ is Cons!15945) (toList!4505 lt!377430)))))

(assert (=> d!106885 (= (contains!4191 (toList!4505 lt!377430) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377805)))

(declare-fun b!832866 () Bool)

(declare-fun e!464529 () Bool)

(assert (=> b!832866 (= e!464530 e!464529)))

(declare-fun res!566482 () Bool)

(assert (=> b!832866 (=> res!566482 e!464529)))

(assert (=> b!832866 (= res!566482 (= (h!17075 (toList!4505 lt!377430)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!832867 () Bool)

(assert (=> b!832867 (= e!464529 (contains!4191 (t!22308 (toList!4505 lt!377430)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106885 res!566481) b!832866))

(assert (= (and b!832866 (not res!566482)) b!832867))

(declare-fun m!776997 () Bool)

(assert (=> d!106885 m!776997))

(declare-fun m!776999 () Bool)

(assert (=> d!106885 m!776999))

(declare-fun m!777001 () Bool)

(assert (=> b!832867 m!777001))

(assert (=> b!831869 d!106885))

(assert (=> b!832175 d!106653))

(assert (=> b!832175 d!106655))

(assert (=> b!831914 d!106713))

(assert (=> b!831914 d!106295))

(declare-fun d!106887 () Bool)

(declare-fun res!566483 () Bool)

(declare-fun e!464531 () Bool)

(assert (=> d!106887 (=> res!566483 e!464531)))

(assert (=> d!106887 (= res!566483 (or ((_ is Nil!15946) lt!377496) ((_ is Nil!15946) (t!22308 lt!377496))))))

(assert (=> d!106887 (= (isStrictlySorted!438 lt!377496) e!464531)))

(declare-fun b!832868 () Bool)

(declare-fun e!464532 () Bool)

(assert (=> b!832868 (= e!464531 e!464532)))

(declare-fun res!566484 () Bool)

(assert (=> b!832868 (=> (not res!566484) (not e!464532))))

(assert (=> b!832868 (= res!566484 (bvslt (_1!5094 (h!17075 lt!377496)) (_1!5094 (h!17075 (t!22308 lt!377496)))))))

(declare-fun b!832869 () Bool)

(assert (=> b!832869 (= e!464532 (isStrictlySorted!438 (t!22308 lt!377496)))))

(assert (= (and d!106887 (not res!566483)) b!832868))

(assert (= (and b!832868 res!566484) b!832869))

(declare-fun m!777003 () Bool)

(assert (=> b!832869 m!777003))

(assert (=> d!106237 d!106887))

(declare-fun d!106889 () Bool)

(declare-fun res!566485 () Bool)

(declare-fun e!464533 () Bool)

(assert (=> d!106889 (=> res!566485 e!464533)))

(assert (=> d!106889 (= res!566485 (or ((_ is Nil!15946) (toList!4505 (+!2013 lt!377163 lt!377161))) ((_ is Nil!15946) (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))))))

(assert (=> d!106889 (= (isStrictlySorted!438 (toList!4505 (+!2013 lt!377163 lt!377161))) e!464533)))

(declare-fun b!832870 () Bool)

(declare-fun e!464534 () Bool)

(assert (=> b!832870 (= e!464533 e!464534)))

(declare-fun res!566486 () Bool)

(assert (=> b!832870 (=> (not res!566486) (not e!464534))))

(assert (=> b!832870 (= res!566486 (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161)))) (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))))))))

(declare-fun b!832871 () Bool)

(assert (=> b!832871 (= e!464534 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))))))

(assert (= (and d!106889 (not res!566485)) b!832870))

(assert (= (and b!832870 res!566486) b!832871))

(declare-fun m!777005 () Bool)

(assert (=> b!832871 m!777005))

(assert (=> d!106237 d!106889))

(assert (=> d!106225 d!106223))

(declare-fun d!106891 () Bool)

(assert (=> d!106891 (= (getValueByKey!414 lt!377364 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!106891 true))

(declare-fun _$22!580 () Unit!28447)

(assert (=> d!106891 (= (choose!1433 lt!377364 (_1!5094 lt!377161) (_2!5094 lt!377161)) _$22!580)))

(declare-fun bs!23292 () Bool)

(assert (= bs!23292 d!106891))

(assert (=> bs!23292 m!775241))

(assert (=> d!106225 d!106891))

(declare-fun d!106893 () Bool)

(declare-fun res!566487 () Bool)

(declare-fun e!464535 () Bool)

(assert (=> d!106893 (=> res!566487 e!464535)))

(assert (=> d!106893 (= res!566487 (or ((_ is Nil!15946) lt!377364) ((_ is Nil!15946) (t!22308 lt!377364))))))

(assert (=> d!106893 (= (isStrictlySorted!438 lt!377364) e!464535)))

(declare-fun b!832872 () Bool)

(declare-fun e!464536 () Bool)

(assert (=> b!832872 (= e!464535 e!464536)))

(declare-fun res!566488 () Bool)

(assert (=> b!832872 (=> (not res!566488) (not e!464536))))

(assert (=> b!832872 (= res!566488 (bvslt (_1!5094 (h!17075 lt!377364)) (_1!5094 (h!17075 (t!22308 lt!377364)))))))

(declare-fun b!832873 () Bool)

(assert (=> b!832873 (= e!464536 (isStrictlySorted!438 (t!22308 lt!377364)))))

(assert (= (and d!106893 (not res!566487)) b!832872))

(assert (= (and b!832872 res!566488) b!832873))

(declare-fun m!777007 () Bool)

(assert (=> b!832873 m!777007))

(assert (=> d!106225 d!106893))

(assert (=> b!831873 d!106607))

(declare-fun b!832876 () Bool)

(declare-fun e!464538 () Option!420)

(assert (=> b!832876 (= e!464538 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832877 () Bool)

(assert (=> b!832877 (= e!464538 None!418)))

(declare-fun d!106895 () Bool)

(declare-fun c!90643 () Bool)

(assert (=> d!106895 (= c!90643 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377349))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377349)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464537 () Option!420)

(assert (=> d!106895 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377349)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464537)))

(declare-fun b!832875 () Bool)

(assert (=> b!832875 (= e!464537 e!464538)))

(declare-fun c!90644 () Bool)

(assert (=> b!832875 (= c!90644 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377349))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377349)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832874 () Bool)

(assert (=> b!832874 (= e!464537 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377349))))))))

(assert (= (and d!106895 c!90643) b!832874))

(assert (= (and d!106895 (not c!90643)) b!832875))

(assert (= (and b!832875 c!90644) b!832876))

(assert (= (and b!832875 (not c!90644)) b!832877))

(declare-fun m!777009 () Bool)

(assert (=> b!832876 m!777009))

(assert (=> b!832001 d!106895))

(declare-fun d!106897 () Bool)

(declare-fun lt!377806 () Bool)

(assert (=> d!106897 (= lt!377806 (select (content!386 lt!377529) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun e!464540 () Bool)

(assert (=> d!106897 (= lt!377806 e!464540)))

(declare-fun res!566489 () Bool)

(assert (=> d!106897 (=> (not res!566489) (not e!464540))))

(assert (=> d!106897 (= res!566489 ((_ is Cons!15945) lt!377529))))

(assert (=> d!106897 (= (contains!4191 lt!377529 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) lt!377806)))

(declare-fun b!832878 () Bool)

(declare-fun e!464539 () Bool)

(assert (=> b!832878 (= e!464540 e!464539)))

(declare-fun res!566490 () Bool)

(assert (=> b!832878 (=> res!566490 e!464539)))

(assert (=> b!832878 (= res!566490 (= (h!17075 lt!377529) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832879 () Bool)

(assert (=> b!832879 (= e!464539 (contains!4191 (t!22308 lt!377529) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(assert (= (and d!106897 res!566489) b!832878))

(assert (= (and b!832878 (not res!566490)) b!832879))

(declare-fun m!777011 () Bool)

(assert (=> d!106897 m!777011))

(declare-fun m!777013 () Bool)

(assert (=> d!106897 m!777013))

(declare-fun m!777015 () Bool)

(assert (=> b!832879 m!777015))

(assert (=> b!832047 d!106897))

(declare-fun d!106899 () Bool)

(declare-fun e!464542 () Bool)

(assert (=> d!106899 e!464542))

(declare-fun res!566491 () Bool)

(assert (=> d!106899 (=> res!566491 e!464542)))

(declare-fun lt!377809 () Bool)

(assert (=> d!106899 (= res!566491 (not lt!377809))))

(declare-fun lt!377807 () Bool)

(assert (=> d!106899 (= lt!377809 lt!377807)))

(declare-fun lt!377810 () Unit!28447)

(declare-fun e!464541 () Unit!28447)

(assert (=> d!106899 (= lt!377810 e!464541)))

(declare-fun c!90645 () Bool)

(assert (=> d!106899 (= c!90645 lt!377807)))

(assert (=> d!106899 (= lt!377807 (containsKey!400 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(assert (=> d!106899 (= (contains!4190 lt!377605 (_1!5094 (tuple2!10167 lt!377343 minValue!754))) lt!377809)))

(declare-fun b!832880 () Bool)

(declare-fun lt!377808 () Unit!28447)

(assert (=> b!832880 (= e!464541 lt!377808)))

(assert (=> b!832880 (= lt!377808 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(assert (=> b!832880 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832881 () Bool)

(declare-fun Unit!28498 () Unit!28447)

(assert (=> b!832881 (= e!464541 Unit!28498)))

(declare-fun b!832882 () Bool)

(assert (=> b!832882 (= e!464542 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(assert (= (and d!106899 c!90645) b!832880))

(assert (= (and d!106899 (not c!90645)) b!832881))

(assert (= (and d!106899 (not res!566491)) b!832882))

(declare-fun m!777017 () Bool)

(assert (=> d!106899 m!777017))

(declare-fun m!777019 () Bool)

(assert (=> b!832880 m!777019))

(assert (=> b!832880 m!776013))

(assert (=> b!832880 m!776013))

(declare-fun m!777021 () Bool)

(assert (=> b!832880 m!777021))

(assert (=> b!832882 m!776013))

(assert (=> b!832882 m!776013))

(assert (=> b!832882 m!777021))

(assert (=> d!106363 d!106899))

(declare-fun b!832885 () Bool)

(declare-fun e!464544 () Option!420)

(assert (=> b!832885 (= e!464544 (getValueByKey!414 (t!22308 lt!377604) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832886 () Bool)

(assert (=> b!832886 (= e!464544 None!418)))

(declare-fun c!90646 () Bool)

(declare-fun d!106901 () Bool)

(assert (=> d!106901 (= c!90646 (and ((_ is Cons!15945) lt!377604) (= (_1!5094 (h!17075 lt!377604)) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(declare-fun e!464543 () Option!420)

(assert (=> d!106901 (= (getValueByKey!414 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754))) e!464543)))

(declare-fun b!832884 () Bool)

(assert (=> b!832884 (= e!464543 e!464544)))

(declare-fun c!90647 () Bool)

(assert (=> b!832884 (= c!90647 (and ((_ is Cons!15945) lt!377604) (not (= (_1!5094 (h!17075 lt!377604)) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))))

(declare-fun b!832883 () Bool)

(assert (=> b!832883 (= e!464543 (Some!419 (_2!5094 (h!17075 lt!377604))))))

(assert (= (and d!106901 c!90646) b!832883))

(assert (= (and d!106901 (not c!90646)) b!832884))

(assert (= (and b!832884 c!90647) b!832885))

(assert (= (and b!832884 (not c!90647)) b!832886))

(declare-fun m!777023 () Bool)

(assert (=> b!832885 m!777023))

(assert (=> d!106363 d!106901))

(declare-fun d!106903 () Bool)

(assert (=> d!106903 (= (getValueByKey!414 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun lt!377811 () Unit!28447)

(assert (=> d!106903 (= lt!377811 (choose!1433 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun e!464545 () Bool)

(assert (=> d!106903 e!464545))

(declare-fun res!566492 () Bool)

(assert (=> d!106903 (=> (not res!566492) (not e!464545))))

(assert (=> d!106903 (= res!566492 (isStrictlySorted!438 lt!377604))))

(assert (=> d!106903 (= (lemmaContainsTupThenGetReturnValue!231 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))) lt!377811)))

(declare-fun b!832887 () Bool)

(declare-fun res!566493 () Bool)

(assert (=> b!832887 (=> (not res!566493) (not e!464545))))

(assert (=> b!832887 (= res!566493 (containsKey!400 lt!377604 (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832888 () Bool)

(assert (=> b!832888 (= e!464545 (contains!4191 lt!377604 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(assert (= (and d!106903 res!566492) b!832887))

(assert (= (and b!832887 res!566493) b!832888))

(assert (=> d!106903 m!776007))

(declare-fun m!777025 () Bool)

(assert (=> d!106903 m!777025))

(declare-fun m!777027 () Bool)

(assert (=> d!106903 m!777027))

(declare-fun m!777029 () Bool)

(assert (=> b!832887 m!777029))

(declare-fun m!777031 () Bool)

(assert (=> b!832888 m!777031))

(assert (=> d!106363 d!106903))

(declare-fun e!464546 () Bool)

(declare-fun b!832889 () Bool)

(declare-fun lt!377812 () List!15949)

(assert (=> b!832889 (= e!464546 (contains!4191 lt!377812 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(declare-fun b!832890 () Bool)

(declare-fun res!566495 () Bool)

(assert (=> b!832890 (=> (not res!566495) (not e!464546))))

(assert (=> b!832890 (= res!566495 (containsKey!400 lt!377812 (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832891 () Bool)

(declare-fun e!464548 () List!15949)

(declare-fun call!36446 () List!15949)

(assert (=> b!832891 (= e!464548 call!36446)))

(declare-fun e!464550 () List!15949)

(declare-fun bm!36443 () Bool)

(declare-fun call!36448 () List!15949)

(declare-fun c!90648 () Bool)

(assert (=> bm!36443 (= call!36448 ($colon$colon!536 e!464550 (ite c!90648 (h!17075 (toList!4505 lt!377328)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))))

(declare-fun c!90649 () Bool)

(assert (=> bm!36443 (= c!90649 c!90648)))

(declare-fun b!832893 () Bool)

(declare-fun e!464549 () List!15949)

(assert (=> b!832893 (= e!464549 call!36448)))

(declare-fun bm!36444 () Bool)

(declare-fun call!36447 () List!15949)

(assert (=> bm!36444 (= call!36447 call!36448)))

(declare-fun b!832894 () Bool)

(declare-fun e!464547 () List!15949)

(assert (=> b!832894 (= e!464547 call!36447)))

(declare-fun c!90651 () Bool)

(declare-fun c!90650 () Bool)

(declare-fun b!832895 () Bool)

(assert (=> b!832895 (= e!464550 (ite c!90651 (t!22308 (toList!4505 lt!377328)) (ite c!90650 (Cons!15945 (h!17075 (toList!4505 lt!377328)) (t!22308 (toList!4505 lt!377328))) Nil!15946)))))

(declare-fun b!832896 () Bool)

(assert (=> b!832896 (= e!464548 call!36446)))

(declare-fun bm!36445 () Bool)

(assert (=> bm!36445 (= call!36446 call!36447)))

(declare-fun b!832897 () Bool)

(assert (=> b!832897 (= e!464549 e!464547)))

(assert (=> b!832897 (= c!90651 (and ((_ is Cons!15945) (toList!4505 lt!377328)) (= (_1!5094 (h!17075 (toList!4505 lt!377328))) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(declare-fun b!832898 () Bool)

(assert (=> b!832898 (= e!464550 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377328)) (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832892 () Bool)

(assert (=> b!832892 (= c!90650 (and ((_ is Cons!15945) (toList!4505 lt!377328)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377328))) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(assert (=> b!832892 (= e!464547 e!464548)))

(declare-fun d!106905 () Bool)

(assert (=> d!106905 e!464546))

(declare-fun res!566494 () Bool)

(assert (=> d!106905 (=> (not res!566494) (not e!464546))))

(assert (=> d!106905 (= res!566494 (isStrictlySorted!438 lt!377812))))

(assert (=> d!106905 (= lt!377812 e!464549)))

(assert (=> d!106905 (= c!90648 (and ((_ is Cons!15945) (toList!4505 lt!377328)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377328))) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(assert (=> d!106905 (isStrictlySorted!438 (toList!4505 lt!377328))))

(assert (=> d!106905 (= (insertStrictlySorted!270 (toList!4505 lt!377328) (_1!5094 (tuple2!10167 lt!377343 minValue!754)) (_2!5094 (tuple2!10167 lt!377343 minValue!754))) lt!377812)))

(assert (= (and d!106905 c!90648) b!832893))

(assert (= (and d!106905 (not c!90648)) b!832897))

(assert (= (and b!832897 c!90651) b!832894))

(assert (= (and b!832897 (not c!90651)) b!832892))

(assert (= (and b!832892 c!90650) b!832891))

(assert (= (and b!832892 (not c!90650)) b!832896))

(assert (= (or b!832891 b!832896) bm!36445))

(assert (= (or b!832894 bm!36445) bm!36444))

(assert (= (or b!832893 bm!36444) bm!36443))

(assert (= (and bm!36443 c!90649) b!832898))

(assert (= (and bm!36443 (not c!90649)) b!832895))

(assert (= (and d!106905 res!566494) b!832890))

(assert (= (and b!832890 res!566495) b!832889))

(declare-fun m!777033 () Bool)

(assert (=> b!832889 m!777033))

(declare-fun m!777035 () Bool)

(assert (=> d!106905 m!777035))

(declare-fun m!777037 () Bool)

(assert (=> d!106905 m!777037))

(declare-fun m!777039 () Bool)

(assert (=> b!832890 m!777039))

(declare-fun m!777041 () Bool)

(assert (=> bm!36443 m!777041))

(declare-fun m!777043 () Bool)

(assert (=> b!832898 m!777043))

(assert (=> d!106363 d!106905))

(declare-fun b!832900 () Bool)

(declare-fun e!464553 () Bool)

(declare-fun e!464556 () Bool)

(assert (=> b!832900 (= e!464553 e!464556)))

(declare-fun c!90655 () Bool)

(declare-fun e!464555 () Bool)

(assert (=> b!832900 (= c!90655 e!464555)))

(declare-fun res!566498 () Bool)

(assert (=> b!832900 (=> (not res!566498) (not e!464555))))

(assert (=> b!832900 (= res!566498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832901 () Bool)

(declare-fun e!464557 () ListLongMap!8979)

(declare-fun e!464551 () ListLongMap!8979)

(assert (=> b!832901 (= e!464557 e!464551)))

(declare-fun c!90653 () Bool)

(assert (=> b!832901 (= c!90653 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun e!464552 () Bool)

(declare-fun b!832902 () Bool)

(declare-fun lt!377816 () ListLongMap!8979)

(assert (=> b!832902 (= e!464552 (= lt!377816 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!832903 () Bool)

(assert (=> b!832903 (= e!464556 e!464552)))

(declare-fun c!90652 () Bool)

(assert (=> b!832903 (= c!90652 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!832904 () Bool)

(declare-fun lt!377814 () Unit!28447)

(declare-fun lt!377815 () Unit!28447)

(assert (=> b!832904 (= lt!377814 lt!377815)))

(declare-fun lt!377819 () (_ BitVec 64))

(declare-fun lt!377813 () (_ BitVec 64))

(declare-fun lt!377817 () ListLongMap!8979)

(declare-fun lt!377818 () V!25283)

(assert (=> b!832904 (not (contains!4190 (+!2013 lt!377817 (tuple2!10167 lt!377813 lt!377818)) lt!377819))))

(assert (=> b!832904 (= lt!377815 (addStillNotContains!199 lt!377817 lt!377813 lt!377818 lt!377819))))

(assert (=> b!832904 (= lt!377819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832904 (= lt!377818 (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832904 (= lt!377813 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36449 () ListLongMap!8979)

(assert (=> b!832904 (= lt!377817 call!36449)))

(assert (=> b!832904 (= e!464551 (+!2013 call!36449 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36446 () Bool)

(assert (=> bm!36446 (= call!36449 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832905 () Bool)

(declare-fun res!566499 () Bool)

(assert (=> b!832905 (=> (not res!566499) (not e!464553))))

(assert (=> b!832905 (= res!566499 (not (contains!4190 lt!377816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832906 () Bool)

(assert (=> b!832906 (= e!464557 (ListLongMap!8980 Nil!15946))))

(declare-fun b!832907 () Bool)

(assert (=> b!832907 (= e!464551 call!36449)))

(declare-fun b!832908 () Bool)

(assert (=> b!832908 (= e!464555 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!832908 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!106907 () Bool)

(assert (=> d!106907 e!464553))

(declare-fun res!566497 () Bool)

(assert (=> d!106907 (=> (not res!566497) (not e!464553))))

(assert (=> d!106907 (= res!566497 (not (contains!4190 lt!377816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106907 (= lt!377816 e!464557)))

(declare-fun c!90654 () Bool)

(assert (=> d!106907 (= c!90654 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!106907 (validMask!0 mask!1312)))

(assert (=> d!106907 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377816)))

(declare-fun b!832899 () Bool)

(assert (=> b!832899 (= e!464552 (isEmpty!662 lt!377816))))

(declare-fun b!832909 () Bool)

(assert (=> b!832909 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> b!832909 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22741 _values!788)))))

(declare-fun e!464554 () Bool)

(assert (=> b!832909 (= e!464554 (= (apply!373 lt!377816 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832910 () Bool)

(assert (=> b!832910 (= e!464556 e!464554)))

(assert (=> b!832910 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun res!566496 () Bool)

(assert (=> b!832910 (= res!566496 (contains!4190 lt!377816 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!832910 (=> (not res!566496) (not e!464554))))

(assert (= (and d!106907 c!90654) b!832906))

(assert (= (and d!106907 (not c!90654)) b!832901))

(assert (= (and b!832901 c!90653) b!832904))

(assert (= (and b!832901 (not c!90653)) b!832907))

(assert (= (or b!832904 b!832907) bm!36446))

(assert (= (and d!106907 res!566497) b!832905))

(assert (= (and b!832905 res!566499) b!832900))

(assert (= (and b!832900 res!566498) b!832908))

(assert (= (and b!832900 c!90655) b!832910))

(assert (= (and b!832900 (not c!90655)) b!832903))

(assert (= (and b!832910 res!566496) b!832909))

(assert (= (and b!832903 c!90652) b!832902))

(assert (= (and b!832903 (not c!90652)) b!832899))

(declare-fun b_lambda!11429 () Bool)

(assert (=> (not b_lambda!11429) (not b!832904)))

(assert (=> b!832904 t!22315))

(declare-fun b_and!22563 () Bool)

(assert (= b_and!22561 (and (=> t!22315 result!8013) b_and!22563)))

(declare-fun b_lambda!11431 () Bool)

(assert (=> (not b_lambda!11431) (not b!832909)))

(assert (=> b!832909 t!22315))

(declare-fun b_and!22565 () Bool)

(assert (= b_and!22563 (and (=> t!22315 result!8013) b_and!22565)))

(declare-fun m!777045 () Bool)

(assert (=> b!832904 m!777045))

(declare-fun m!777047 () Bool)

(assert (=> b!832904 m!777047))

(assert (=> b!832904 m!776337))

(assert (=> b!832904 m!775043))

(assert (=> b!832904 m!776339))

(declare-fun m!777049 () Bool)

(assert (=> b!832904 m!777049))

(declare-fun m!777051 () Bool)

(assert (=> b!832904 m!777051))

(assert (=> b!832904 m!777045))

(assert (=> b!832904 m!775043))

(assert (=> b!832904 m!776345))

(assert (=> b!832904 m!776337))

(declare-fun m!777053 () Bool)

(assert (=> bm!36446 m!777053))

(declare-fun m!777055 () Bool)

(assert (=> b!832905 m!777055))

(assert (=> b!832910 m!776345))

(assert (=> b!832910 m!776345))

(declare-fun m!777057 () Bool)

(assert (=> b!832910 m!777057))

(declare-fun m!777059 () Bool)

(assert (=> d!106907 m!777059))

(assert (=> d!106907 m!774915))

(assert (=> b!832901 m!776345))

(assert (=> b!832901 m!776345))

(assert (=> b!832901 m!776355))

(declare-fun m!777061 () Bool)

(assert (=> b!832899 m!777061))

(assert (=> b!832902 m!777053))

(assert (=> b!832909 m!775043))

(assert (=> b!832909 m!776337))

(assert (=> b!832909 m!775043))

(assert (=> b!832909 m!776339))

(assert (=> b!832909 m!776345))

(declare-fun m!777063 () Bool)

(assert (=> b!832909 m!777063))

(assert (=> b!832909 m!776345))

(assert (=> b!832909 m!776337))

(assert (=> b!832908 m!776345))

(assert (=> b!832908 m!776345))

(assert (=> b!832908 m!776355))

(assert (=> b!832093 d!106907))

(declare-fun lt!377820 () Bool)

(declare-fun d!106909 () Bool)

(assert (=> d!106909 (= lt!377820 (select (content!386 (toList!4505 lt!377462)) (tuple2!10167 lt!377303 minValue!754)))))

(declare-fun e!464559 () Bool)

(assert (=> d!106909 (= lt!377820 e!464559)))

(declare-fun res!566500 () Bool)

(assert (=> d!106909 (=> (not res!566500) (not e!464559))))

(assert (=> d!106909 (= res!566500 ((_ is Cons!15945) (toList!4505 lt!377462)))))

(assert (=> d!106909 (= (contains!4191 (toList!4505 lt!377462) (tuple2!10167 lt!377303 minValue!754)) lt!377820)))

(declare-fun b!832911 () Bool)

(declare-fun e!464558 () Bool)

(assert (=> b!832911 (= e!464559 e!464558)))

(declare-fun res!566501 () Bool)

(assert (=> b!832911 (=> res!566501 e!464558)))

(assert (=> b!832911 (= res!566501 (= (h!17075 (toList!4505 lt!377462)) (tuple2!10167 lt!377303 minValue!754)))))

(declare-fun b!832912 () Bool)

(assert (=> b!832912 (= e!464558 (contains!4191 (t!22308 (toList!4505 lt!377462)) (tuple2!10167 lt!377303 minValue!754)))))

(assert (= (and d!106909 res!566500) b!832911))

(assert (= (and b!832911 (not res!566501)) b!832912))

(declare-fun m!777065 () Bool)

(assert (=> d!106909 m!777065))

(declare-fun m!777067 () Bool)

(assert (=> d!106909 m!777067))

(declare-fun m!777069 () Bool)

(assert (=> b!832912 m!777069))

(assert (=> b!831896 d!106909))

(declare-fun d!106911 () Bool)

(declare-fun res!566502 () Bool)

(declare-fun e!464560 () Bool)

(assert (=> d!106911 (=> res!566502 e!464560)))

(assert (=> d!106911 (= res!566502 (or ((_ is Nil!15946) lt!377411) ((_ is Nil!15946) (t!22308 lt!377411))))))

(assert (=> d!106911 (= (isStrictlySorted!438 lt!377411) e!464560)))

(declare-fun b!832913 () Bool)

(declare-fun e!464561 () Bool)

(assert (=> b!832913 (= e!464560 e!464561)))

(declare-fun res!566503 () Bool)

(assert (=> b!832913 (=> (not res!566503) (not e!464561))))

(assert (=> b!832913 (= res!566503 (bvslt (_1!5094 (h!17075 lt!377411)) (_1!5094 (h!17075 (t!22308 lt!377411)))))))

(declare-fun b!832914 () Bool)

(assert (=> b!832914 (= e!464561 (isStrictlySorted!438 (t!22308 lt!377411)))))

(assert (= (and d!106911 (not res!566502)) b!832913))

(assert (= (and b!832913 res!566503) b!832914))

(declare-fun m!777071 () Bool)

(assert (=> b!832914 m!777071))

(assert (=> d!106157 d!106911))

(declare-fun d!106913 () Bool)

(declare-fun res!566504 () Bool)

(declare-fun e!464562 () Bool)

(assert (=> d!106913 (=> res!566504 e!464562)))

(assert (=> d!106913 (= res!566504 (or ((_ is Nil!15946) (toList!4505 (+!2013 lt!377158 lt!377161))) ((_ is Nil!15946) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161))))))))

(assert (=> d!106913 (= (isStrictlySorted!438 (toList!4505 (+!2013 lt!377158 lt!377161))) e!464562)))

(declare-fun b!832915 () Bool)

(declare-fun e!464563 () Bool)

(assert (=> b!832915 (= e!464562 e!464563)))

(declare-fun res!566505 () Bool)

(assert (=> b!832915 (=> (not res!566505) (not e!464563))))

(assert (=> b!832915 (= res!566505 (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377161)))) (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))))))))

(declare-fun b!832916 () Bool)

(assert (=> b!832916 (= e!464563 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377161)))))))

(assert (= (and d!106913 (not res!566504)) b!832915))

(assert (= (and b!832915 res!566505) b!832916))

(assert (=> b!832916 m!776173))

(assert (=> d!106157 d!106913))

(declare-fun d!106915 () Bool)

(declare-fun res!566506 () Bool)

(declare-fun e!464564 () Bool)

(assert (=> d!106915 (=> res!566506 e!464564)))

(assert (=> d!106915 (= res!566506 (and ((_ is Cons!15945) (toList!4505 lt!377340)) (= (_1!5094 (h!17075 (toList!4505 lt!377340))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106915 (= (containsKey!400 (toList!4505 lt!377340) #b1000000000000000000000000000000000000000000000000000000000000000) e!464564)))

(declare-fun b!832917 () Bool)

(declare-fun e!464565 () Bool)

(assert (=> b!832917 (= e!464564 e!464565)))

(declare-fun res!566507 () Bool)

(assert (=> b!832917 (=> (not res!566507) (not e!464565))))

(assert (=> b!832917 (= res!566507 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377340))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377340))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377340)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377340))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832918 () Bool)

(assert (=> b!832918 (= e!464565 (containsKey!400 (t!22308 (toList!4505 lt!377340)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106915 (not res!566506)) b!832917))

(assert (= (and b!832917 res!566507) b!832918))

(declare-fun m!777073 () Bool)

(assert (=> b!832918 m!777073))

(assert (=> d!106265 d!106915))

(declare-fun d!106917 () Bool)

(declare-fun c!90656 () Bool)

(assert (=> d!106917 (= c!90656 ((_ is Nil!15946) (toList!4505 lt!377257)))))

(declare-fun e!464566 () (InoxSet tuple2!10166))

(assert (=> d!106917 (= (content!386 (toList!4505 lt!377257)) e!464566)))

(declare-fun b!832919 () Bool)

(assert (=> b!832919 (= e!464566 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832920 () Bool)

(assert (=> b!832920 (= e!464566 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377257)) true) (content!386 (t!22308 (toList!4505 lt!377257)))))))

(assert (= (and d!106917 c!90656) b!832919))

(assert (= (and d!106917 (not c!90656)) b!832920))

(declare-fun m!777075 () Bool)

(assert (=> b!832920 m!777075))

(assert (=> b!832920 m!776509))

(assert (=> d!106239 d!106917))

(declare-fun d!106919 () Bool)

(declare-fun c!90657 () Bool)

(assert (=> d!106919 (= c!90657 ((_ is Nil!15946) (toList!4505 lt!377365)))))

(declare-fun e!464567 () (InoxSet tuple2!10166))

(assert (=> d!106919 (= (content!386 (toList!4505 lt!377365)) e!464567)))

(declare-fun b!832921 () Bool)

(assert (=> b!832921 (= e!464567 ((as const (Array tuple2!10166 Bool)) false))))

(declare-fun b!832922 () Bool)

(assert (=> b!832922 (= e!464567 ((_ map or) (store ((as const (Array tuple2!10166 Bool)) false) (h!17075 (toList!4505 lt!377365)) true) (content!386 (t!22308 (toList!4505 lt!377365)))))))

(assert (= (and d!106919 c!90657) b!832921))

(assert (= (and d!106919 (not c!90657)) b!832922))

(declare-fun m!777077 () Bool)

(assert (=> b!832922 m!777077))

(assert (=> b!832922 m!776503))

(assert (=> d!106325 d!106919))

(declare-fun d!106921 () Bool)

(declare-fun res!566508 () Bool)

(declare-fun e!464568 () Bool)

(assert (=> d!106921 (=> res!566508 e!464568)))

(assert (=> d!106921 (= res!566508 (and ((_ is Cons!15945) (toList!4505 lt!377361)) (= (_1!5094 (h!17075 (toList!4505 lt!377361))) (_1!5094 lt!377164))))))

(assert (=> d!106921 (= (containsKey!400 (toList!4505 lt!377361) (_1!5094 lt!377164)) e!464568)))

(declare-fun b!832923 () Bool)

(declare-fun e!464569 () Bool)

(assert (=> b!832923 (= e!464568 e!464569)))

(declare-fun res!566509 () Bool)

(assert (=> b!832923 (=> (not res!566509) (not e!464569))))

(assert (=> b!832923 (= res!566509 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377361))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377361))) (_1!5094 lt!377164))) ((_ is Cons!15945) (toList!4505 lt!377361)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377361))) (_1!5094 lt!377164))))))

(declare-fun b!832924 () Bool)

(assert (=> b!832924 (= e!464569 (containsKey!400 (t!22308 (toList!4505 lt!377361)) (_1!5094 lt!377164)))))

(assert (= (and d!106921 (not res!566508)) b!832923))

(assert (= (and b!832923 res!566509) b!832924))

(declare-fun m!777079 () Bool)

(assert (=> b!832924 m!777079))

(assert (=> d!106151 d!106921))

(declare-fun d!106923 () Bool)

(declare-fun res!566510 () Bool)

(declare-fun e!464570 () Bool)

(assert (=> d!106923 (=> res!566510 e!464570)))

(assert (=> d!106923 (= res!566510 (or ((_ is Nil!15946) lt!377565) ((_ is Nil!15946) (t!22308 lt!377565))))))

(assert (=> d!106923 (= (isStrictlySorted!438 lt!377565) e!464570)))

(declare-fun b!832925 () Bool)

(declare-fun e!464571 () Bool)

(assert (=> b!832925 (= e!464570 e!464571)))

(declare-fun res!566511 () Bool)

(assert (=> b!832925 (=> (not res!566511) (not e!464571))))

(assert (=> b!832925 (= res!566511 (bvslt (_1!5094 (h!17075 lt!377565)) (_1!5094 (h!17075 (t!22308 lt!377565)))))))

(declare-fun b!832926 () Bool)

(assert (=> b!832926 (= e!464571 (isStrictlySorted!438 (t!22308 lt!377565)))))

(assert (= (and d!106923 (not res!566510)) b!832925))

(assert (= (and b!832925 res!566511) b!832926))

(declare-fun m!777081 () Bool)

(assert (=> b!832926 m!777081))

(assert (=> d!106323 d!106923))

(declare-fun d!106925 () Bool)

(declare-fun res!566512 () Bool)

(declare-fun e!464572 () Bool)

(assert (=> d!106925 (=> res!566512 e!464572)))

(assert (=> d!106925 (= res!566512 (or ((_ is Nil!15946) (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15946) (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!106925 (= (isStrictlySorted!438 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464572)))

(declare-fun b!832927 () Bool)

(declare-fun e!464573 () Bool)

(assert (=> b!832927 (= e!464572 e!464573)))

(declare-fun res!566513 () Bool)

(assert (=> b!832927 (=> (not res!566513) (not e!464573))))

(assert (=> b!832927 (= res!566513 (bvslt (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!832928 () Bool)

(assert (=> b!832928 (= e!464573 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!106925 (not res!566512)) b!832927))

(assert (= (and b!832927 res!566513) b!832928))

(declare-fun m!777083 () Bool)

(assert (=> b!832928 m!777083))

(assert (=> d!106323 d!106925))

(declare-fun d!106927 () Bool)

(assert (=> d!106927 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377328) lt!377334)) (v!10095 (getValueByKey!414 (toList!4505 lt!377328) lt!377334)))))

(assert (=> d!106351 d!106927))

(declare-fun b!832931 () Bool)

(declare-fun e!464575 () Option!420)

(assert (=> b!832931 (= e!464575 (getValueByKey!414 (t!22308 (toList!4505 lt!377328)) lt!377334))))

(declare-fun b!832932 () Bool)

(assert (=> b!832932 (= e!464575 None!418)))

(declare-fun d!106929 () Bool)

(declare-fun c!90658 () Bool)

(assert (=> d!106929 (= c!90658 (and ((_ is Cons!15945) (toList!4505 lt!377328)) (= (_1!5094 (h!17075 (toList!4505 lt!377328))) lt!377334)))))

(declare-fun e!464574 () Option!420)

(assert (=> d!106929 (= (getValueByKey!414 (toList!4505 lt!377328) lt!377334) e!464574)))

(declare-fun b!832930 () Bool)

(assert (=> b!832930 (= e!464574 e!464575)))

(declare-fun c!90659 () Bool)

(assert (=> b!832930 (= c!90659 (and ((_ is Cons!15945) (toList!4505 lt!377328)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377328))) lt!377334))))))

(declare-fun b!832929 () Bool)

(assert (=> b!832929 (= e!464574 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377328)))))))

(assert (= (and d!106929 c!90658) b!832929))

(assert (= (and d!106929 (not c!90658)) b!832930))

(assert (= (and b!832930 c!90659) b!832931))

(assert (= (and b!832930 (not c!90659)) b!832932))

(declare-fun m!777085 () Bool)

(assert (=> b!832931 m!777085))

(assert (=> d!106351 d!106929))

(declare-fun d!106931 () Bool)

(declare-fun lt!377821 () Bool)

(assert (=> d!106931 (= lt!377821 (select (content!386 lt!377539) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464577 () Bool)

(assert (=> d!106931 (= lt!377821 e!464577)))

(declare-fun res!566514 () Bool)

(assert (=> d!106931 (=> (not res!566514) (not e!464577))))

(assert (=> d!106931 (= res!566514 ((_ is Cons!15945) lt!377539))))

(assert (=> d!106931 (= (contains!4191 lt!377539 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377821)))

(declare-fun b!832933 () Bool)

(declare-fun e!464576 () Bool)

(assert (=> b!832933 (= e!464577 e!464576)))

(declare-fun res!566515 () Bool)

(assert (=> b!832933 (=> res!566515 e!464576)))

(assert (=> b!832933 (= res!566515 (= (h!17075 lt!377539) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832934 () Bool)

(assert (=> b!832934 (= e!464576 (contains!4191 (t!22308 lt!377539) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106931 res!566514) b!832933))

(assert (= (and b!832933 (not res!566515)) b!832934))

(declare-fun m!777087 () Bool)

(assert (=> d!106931 m!777087))

(declare-fun m!777089 () Bool)

(assert (=> d!106931 m!777089))

(declare-fun m!777091 () Bool)

(assert (=> b!832934 m!777091))

(assert (=> b!832069 d!106931))

(declare-fun d!106933 () Bool)

(declare-fun e!464579 () Bool)

(assert (=> d!106933 e!464579))

(declare-fun res!566516 () Bool)

(assert (=> d!106933 (=> res!566516 e!464579)))

(declare-fun lt!377824 () Bool)

(assert (=> d!106933 (= res!566516 (not lt!377824))))

(declare-fun lt!377822 () Bool)

(assert (=> d!106933 (= lt!377824 lt!377822)))

(declare-fun lt!377825 () Unit!28447)

(declare-fun e!464578 () Unit!28447)

(assert (=> d!106933 (= lt!377825 e!464578)))

(declare-fun c!90660 () Bool)

(assert (=> d!106933 (= c!90660 lt!377822)))

(assert (=> d!106933 (= lt!377822 (containsKey!400 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106933 (= (contains!4190 lt!377430 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377824)))

(declare-fun b!832935 () Bool)

(declare-fun lt!377823 () Unit!28447)

(assert (=> b!832935 (= e!464578 lt!377823)))

(assert (=> b!832935 (= lt!377823 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!832935 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832936 () Bool)

(declare-fun Unit!28499 () Unit!28447)

(assert (=> b!832936 (= e!464578 Unit!28499)))

(declare-fun b!832937 () Bool)

(assert (=> b!832937 (= e!464579 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377430) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106933 c!90660) b!832935))

(assert (= (and d!106933 (not c!90660)) b!832936))

(assert (= (and d!106933 (not res!566516)) b!832937))

(declare-fun m!777093 () Bool)

(assert (=> d!106933 m!777093))

(declare-fun m!777095 () Bool)

(assert (=> b!832935 m!777095))

(assert (=> b!832935 m!775387))

(assert (=> b!832935 m!775387))

(declare-fun m!777097 () Bool)

(assert (=> b!832935 m!777097))

(assert (=> b!832937 m!775387))

(assert (=> b!832937 m!775387))

(assert (=> b!832937 m!777097))

(assert (=> d!106167 d!106933))

(declare-fun e!464581 () Option!420)

(declare-fun b!832940 () Bool)

(assert (=> b!832940 (= e!464581 (getValueByKey!414 (t!22308 lt!377429) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832941 () Bool)

(assert (=> b!832941 (= e!464581 None!418)))

(declare-fun c!90661 () Bool)

(declare-fun d!106935 () Bool)

(assert (=> d!106935 (= c!90661 (and ((_ is Cons!15945) lt!377429) (= (_1!5094 (h!17075 lt!377429)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464580 () Option!420)

(assert (=> d!106935 (= (getValueByKey!414 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464580)))

(declare-fun b!832939 () Bool)

(assert (=> b!832939 (= e!464580 e!464581)))

(declare-fun c!90662 () Bool)

(assert (=> b!832939 (= c!90662 (and ((_ is Cons!15945) lt!377429) (not (= (_1!5094 (h!17075 lt!377429)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832938 () Bool)

(assert (=> b!832938 (= e!464580 (Some!419 (_2!5094 (h!17075 lt!377429))))))

(assert (= (and d!106935 c!90661) b!832938))

(assert (= (and d!106935 (not c!90661)) b!832939))

(assert (= (and b!832939 c!90662) b!832940))

(assert (= (and b!832939 (not c!90662)) b!832941))

(declare-fun m!777099 () Bool)

(assert (=> b!832940 m!777099))

(assert (=> d!106167 d!106935))

(declare-fun d!106937 () Bool)

(assert (=> d!106937 (= (getValueByKey!414 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377826 () Unit!28447)

(assert (=> d!106937 (= lt!377826 (choose!1433 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464582 () Bool)

(assert (=> d!106937 e!464582))

(declare-fun res!566517 () Bool)

(assert (=> d!106937 (=> (not res!566517) (not e!464582))))

(assert (=> d!106937 (= res!566517 (isStrictlySorted!438 lt!377429))))

(assert (=> d!106937 (= (lemmaContainsTupThenGetReturnValue!231 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377826)))

(declare-fun b!832942 () Bool)

(declare-fun res!566518 () Bool)

(assert (=> b!832942 (=> (not res!566518) (not e!464582))))

(assert (=> b!832942 (= res!566518 (containsKey!400 lt!377429 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832943 () Bool)

(assert (=> b!832943 (= e!464582 (contains!4191 lt!377429 (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106937 res!566517) b!832942))

(assert (= (and b!832942 res!566518) b!832943))

(assert (=> d!106937 m!775381))

(declare-fun m!777101 () Bool)

(assert (=> d!106937 m!777101))

(declare-fun m!777103 () Bool)

(assert (=> d!106937 m!777103))

(declare-fun m!777105 () Bool)

(assert (=> b!832942 m!777105))

(declare-fun m!777107 () Bool)

(assert (=> b!832943 m!777107))

(assert (=> d!106167 d!106937))

(declare-fun lt!377827 () List!15949)

(declare-fun e!464583 () Bool)

(declare-fun b!832944 () Bool)

(assert (=> b!832944 (= e!464583 (contains!4191 lt!377827 (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832945 () Bool)

(declare-fun res!566520 () Bool)

(assert (=> b!832945 (=> (not res!566520) (not e!464583))))

(assert (=> b!832945 (= res!566520 (containsKey!400 lt!377827 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832946 () Bool)

(declare-fun e!464585 () List!15949)

(declare-fun call!36450 () List!15949)

(assert (=> b!832946 (= e!464585 call!36450)))

(declare-fun c!90663 () Bool)

(declare-fun bm!36447 () Bool)

(declare-fun e!464587 () List!15949)

(declare-fun call!36452 () List!15949)

(assert (=> bm!36447 (= call!36452 ($colon$colon!536 e!464587 (ite c!90663 (h!17075 (toList!4505 call!36335)) (tuple2!10167 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90664 () Bool)

(assert (=> bm!36447 (= c!90664 c!90663)))

(declare-fun b!832948 () Bool)

(declare-fun e!464586 () List!15949)

(assert (=> b!832948 (= e!464586 call!36452)))

(declare-fun bm!36448 () Bool)

(declare-fun call!36451 () List!15949)

(assert (=> bm!36448 (= call!36451 call!36452)))

(declare-fun b!832949 () Bool)

(declare-fun e!464584 () List!15949)

(assert (=> b!832949 (= e!464584 call!36451)))

(declare-fun b!832950 () Bool)

(declare-fun c!90665 () Bool)

(declare-fun c!90666 () Bool)

(assert (=> b!832950 (= e!464587 (ite c!90666 (t!22308 (toList!4505 call!36335)) (ite c!90665 (Cons!15945 (h!17075 (toList!4505 call!36335)) (t!22308 (toList!4505 call!36335))) Nil!15946)))))

(declare-fun b!832951 () Bool)

(assert (=> b!832951 (= e!464585 call!36450)))

(declare-fun bm!36449 () Bool)

(assert (=> bm!36449 (= call!36450 call!36451)))

(declare-fun b!832952 () Bool)

(assert (=> b!832952 (= e!464586 e!464584)))

(assert (=> b!832952 (= c!90666 (and ((_ is Cons!15945) (toList!4505 call!36335)) (= (_1!5094 (h!17075 (toList!4505 call!36335))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832953 () Bool)

(assert (=> b!832953 (= e!464587 (insertStrictlySorted!270 (t!22308 (toList!4505 call!36335)) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832947 () Bool)

(assert (=> b!832947 (= c!90665 (and ((_ is Cons!15945) (toList!4505 call!36335)) (bvsgt (_1!5094 (h!17075 (toList!4505 call!36335))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!832947 (= e!464584 e!464585)))

(declare-fun d!106939 () Bool)

(assert (=> d!106939 e!464583))

(declare-fun res!566519 () Bool)

(assert (=> d!106939 (=> (not res!566519) (not e!464583))))

(assert (=> d!106939 (= res!566519 (isStrictlySorted!438 lt!377827))))

(assert (=> d!106939 (= lt!377827 e!464586)))

(assert (=> d!106939 (= c!90663 (and ((_ is Cons!15945) (toList!4505 call!36335)) (bvslt (_1!5094 (h!17075 (toList!4505 call!36335))) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106939 (isStrictlySorted!438 (toList!4505 call!36335))))

(assert (=> d!106939 (= (insertStrictlySorted!270 (toList!4505 call!36335) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377827)))

(assert (= (and d!106939 c!90663) b!832948))

(assert (= (and d!106939 (not c!90663)) b!832952))

(assert (= (and b!832952 c!90666) b!832949))

(assert (= (and b!832952 (not c!90666)) b!832947))

(assert (= (and b!832947 c!90665) b!832946))

(assert (= (and b!832947 (not c!90665)) b!832951))

(assert (= (or b!832946 b!832951) bm!36449))

(assert (= (or b!832949 bm!36449) bm!36448))

(assert (= (or b!832948 bm!36448) bm!36447))

(assert (= (and bm!36447 c!90664) b!832953))

(assert (= (and bm!36447 (not c!90664)) b!832950))

(assert (= (and d!106939 res!566519) b!832945))

(assert (= (and b!832945 res!566520) b!832944))

(declare-fun m!777109 () Bool)

(assert (=> b!832944 m!777109))

(declare-fun m!777111 () Bool)

(assert (=> d!106939 m!777111))

(declare-fun m!777113 () Bool)

(assert (=> d!106939 m!777113))

(declare-fun m!777115 () Bool)

(assert (=> b!832945 m!777115))

(declare-fun m!777117 () Bool)

(assert (=> bm!36447 m!777117))

(declare-fun m!777119 () Bool)

(assert (=> b!832953 m!777119))

(assert (=> d!106167 d!106939))

(declare-fun d!106941 () Bool)

(declare-fun res!566521 () Bool)

(declare-fun e!464588 () Bool)

(assert (=> d!106941 (=> res!566521 e!464588)))

(assert (=> d!106941 (= res!566521 (and ((_ is Cons!15945) lt!377356) (= (_1!5094 (h!17075 lt!377356)) (_1!5094 lt!377164))))))

(assert (=> d!106941 (= (containsKey!400 lt!377356 (_1!5094 lt!377164)) e!464588)))

(declare-fun b!832954 () Bool)

(declare-fun e!464589 () Bool)

(assert (=> b!832954 (= e!464588 e!464589)))

(declare-fun res!566522 () Bool)

(assert (=> b!832954 (=> (not res!566522) (not e!464589))))

(assert (=> b!832954 (= res!566522 (and (or (not ((_ is Cons!15945) lt!377356)) (bvsle (_1!5094 (h!17075 lt!377356)) (_1!5094 lt!377164))) ((_ is Cons!15945) lt!377356) (bvslt (_1!5094 (h!17075 lt!377356)) (_1!5094 lt!377164))))))

(declare-fun b!832955 () Bool)

(assert (=> b!832955 (= e!464589 (containsKey!400 (t!22308 lt!377356) (_1!5094 lt!377164)))))

(assert (= (and d!106941 (not res!566521)) b!832954))

(assert (= (and b!832954 res!566522) b!832955))

(declare-fun m!777121 () Bool)

(assert (=> b!832955 m!777121))

(assert (=> b!831919 d!106941))

(assert (=> b!831975 d!106771))

(assert (=> b!831975 d!106257))

(declare-fun d!106943 () Bool)

(assert (=> d!106943 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!414 (toList!4505 lt!377340) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106301 d!106943))

(assert (=> d!106301 d!106735))

(declare-fun d!106945 () Bool)

(declare-fun e!464591 () Bool)

(assert (=> d!106945 e!464591))

(declare-fun res!566523 () Bool)

(assert (=> d!106945 (=> res!566523 e!464591)))

(declare-fun lt!377830 () Bool)

(assert (=> d!106945 (= res!566523 (not lt!377830))))

(declare-fun lt!377828 () Bool)

(assert (=> d!106945 (= lt!377830 lt!377828)))

(declare-fun lt!377831 () Unit!28447)

(declare-fun e!464590 () Unit!28447)

(assert (=> d!106945 (= lt!377831 e!464590)))

(declare-fun c!90667 () Bool)

(assert (=> d!106945 (= c!90667 lt!377828)))

(assert (=> d!106945 (= lt!377828 (containsKey!400 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(assert (=> d!106945 (= (contains!4190 lt!377462 (_1!5094 (tuple2!10167 lt!377303 minValue!754))) lt!377830)))

(declare-fun b!832956 () Bool)

(declare-fun lt!377829 () Unit!28447)

(assert (=> b!832956 (= e!464590 lt!377829)))

(assert (=> b!832956 (= lt!377829 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(assert (=> b!832956 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832957 () Bool)

(declare-fun Unit!28500 () Unit!28447)

(assert (=> b!832957 (= e!464590 Unit!28500)))

(declare-fun b!832958 () Bool)

(assert (=> b!832958 (= e!464591 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377462) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(assert (= (and d!106945 c!90667) b!832956))

(assert (= (and d!106945 (not c!90667)) b!832957))

(assert (= (and d!106945 (not res!566523)) b!832958))

(declare-fun m!777123 () Bool)

(assert (=> d!106945 m!777123))

(declare-fun m!777125 () Bool)

(assert (=> b!832956 m!777125))

(assert (=> b!832956 m!775501))

(assert (=> b!832956 m!775501))

(declare-fun m!777127 () Bool)

(assert (=> b!832956 m!777127))

(assert (=> b!832958 m!775501))

(assert (=> b!832958 m!775501))

(assert (=> b!832958 m!777127))

(assert (=> d!106193 d!106945))

(declare-fun b!832961 () Bool)

(declare-fun e!464593 () Option!420)

(assert (=> b!832961 (= e!464593 (getValueByKey!414 (t!22308 lt!377461) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832962 () Bool)

(assert (=> b!832962 (= e!464593 None!418)))

(declare-fun d!106947 () Bool)

(declare-fun c!90668 () Bool)

(assert (=> d!106947 (= c!90668 (and ((_ is Cons!15945) lt!377461) (= (_1!5094 (h!17075 lt!377461)) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(declare-fun e!464592 () Option!420)

(assert (=> d!106947 (= (getValueByKey!414 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754))) e!464592)))

(declare-fun b!832960 () Bool)

(assert (=> b!832960 (= e!464592 e!464593)))

(declare-fun c!90669 () Bool)

(assert (=> b!832960 (= c!90669 (and ((_ is Cons!15945) lt!377461) (not (= (_1!5094 (h!17075 lt!377461)) (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))))

(declare-fun b!832959 () Bool)

(assert (=> b!832959 (= e!464592 (Some!419 (_2!5094 (h!17075 lt!377461))))))

(assert (= (and d!106947 c!90668) b!832959))

(assert (= (and d!106947 (not c!90668)) b!832960))

(assert (= (and b!832960 c!90669) b!832961))

(assert (= (and b!832960 (not c!90669)) b!832962))

(declare-fun m!777129 () Bool)

(assert (=> b!832961 m!777129))

(assert (=> d!106193 d!106947))

(declare-fun d!106949 () Bool)

(assert (=> d!106949 (= (getValueByKey!414 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun lt!377832 () Unit!28447)

(assert (=> d!106949 (= lt!377832 (choose!1433 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun e!464594 () Bool)

(assert (=> d!106949 e!464594))

(declare-fun res!566524 () Bool)

(assert (=> d!106949 (=> (not res!566524) (not e!464594))))

(assert (=> d!106949 (= res!566524 (isStrictlySorted!438 lt!377461))))

(assert (=> d!106949 (= (lemmaContainsTupThenGetReturnValue!231 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))) lt!377832)))

(declare-fun b!832963 () Bool)

(declare-fun res!566525 () Bool)

(assert (=> b!832963 (=> (not res!566525) (not e!464594))))

(assert (=> b!832963 (= res!566525 (containsKey!400 lt!377461 (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832964 () Bool)

(assert (=> b!832964 (= e!464594 (contains!4191 lt!377461 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(assert (= (and d!106949 res!566524) b!832963))

(assert (= (and b!832963 res!566525) b!832964))

(assert (=> d!106949 m!775495))

(declare-fun m!777131 () Bool)

(assert (=> d!106949 m!777131))

(declare-fun m!777133 () Bool)

(assert (=> d!106949 m!777133))

(declare-fun m!777135 () Bool)

(assert (=> b!832963 m!777135))

(declare-fun m!777137 () Bool)

(assert (=> b!832964 m!777137))

(assert (=> d!106193 d!106949))

(declare-fun e!464595 () Bool)

(declare-fun lt!377833 () List!15949)

(declare-fun b!832965 () Bool)

(assert (=> b!832965 (= e!464595 (contains!4191 lt!377833 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(declare-fun b!832966 () Bool)

(declare-fun res!566527 () Bool)

(assert (=> b!832966 (=> (not res!566527) (not e!464595))))

(assert (=> b!832966 (= res!566527 (containsKey!400 lt!377833 (_1!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832967 () Bool)

(declare-fun e!464597 () List!15949)

(declare-fun call!36453 () List!15949)

(assert (=> b!832967 (= e!464597 call!36453)))

(declare-fun e!464599 () List!15949)

(declare-fun call!36455 () List!15949)

(declare-fun bm!36450 () Bool)

(declare-fun c!90670 () Bool)

(assert (=> bm!36450 (= call!36455 ($colon$colon!536 e!464599 (ite c!90670 (h!17075 (toList!4505 lt!377311)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))))

(declare-fun c!90671 () Bool)

(assert (=> bm!36450 (= c!90671 c!90670)))

(declare-fun b!832969 () Bool)

(declare-fun e!464598 () List!15949)

(assert (=> b!832969 (= e!464598 call!36455)))

(declare-fun bm!36451 () Bool)

(declare-fun call!36454 () List!15949)

(assert (=> bm!36451 (= call!36454 call!36455)))

(declare-fun b!832970 () Bool)

(declare-fun e!464596 () List!15949)

(assert (=> b!832970 (= e!464596 call!36454)))

(declare-fun c!90673 () Bool)

(declare-fun c!90672 () Bool)

(declare-fun b!832971 () Bool)

(assert (=> b!832971 (= e!464599 (ite c!90673 (t!22308 (toList!4505 lt!377311)) (ite c!90672 (Cons!15945 (h!17075 (toList!4505 lt!377311)) (t!22308 (toList!4505 lt!377311))) Nil!15946)))))

(declare-fun b!832972 () Bool)

(assert (=> b!832972 (= e!464597 call!36453)))

(declare-fun bm!36452 () Bool)

(assert (=> bm!36452 (= call!36453 call!36454)))

(declare-fun b!832973 () Bool)

(assert (=> b!832973 (= e!464598 e!464596)))

(assert (=> b!832973 (= c!90673 (and ((_ is Cons!15945) (toList!4505 lt!377311)) (= (_1!5094 (h!17075 (toList!4505 lt!377311))) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(declare-fun b!832974 () Bool)

(assert (=> b!832974 (= e!464599 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377311)) (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))))))

(declare-fun b!832968 () Bool)

(assert (=> b!832968 (= c!90672 (and ((_ is Cons!15945) (toList!4505 lt!377311)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377311))) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(assert (=> b!832968 (= e!464596 e!464597)))

(declare-fun d!106951 () Bool)

(assert (=> d!106951 e!464595))

(declare-fun res!566526 () Bool)

(assert (=> d!106951 (=> (not res!566526) (not e!464595))))

(assert (=> d!106951 (= res!566526 (isStrictlySorted!438 lt!377833))))

(assert (=> d!106951 (= lt!377833 e!464598)))

(assert (=> d!106951 (= c!90670 (and ((_ is Cons!15945) (toList!4505 lt!377311)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377311))) (_1!5094 (tuple2!10167 lt!377303 minValue!754)))))))

(assert (=> d!106951 (isStrictlySorted!438 (toList!4505 lt!377311))))

(assert (=> d!106951 (= (insertStrictlySorted!270 (toList!4505 lt!377311) (_1!5094 (tuple2!10167 lt!377303 minValue!754)) (_2!5094 (tuple2!10167 lt!377303 minValue!754))) lt!377833)))

(assert (= (and d!106951 c!90670) b!832969))

(assert (= (and d!106951 (not c!90670)) b!832973))

(assert (= (and b!832973 c!90673) b!832970))

(assert (= (and b!832973 (not c!90673)) b!832968))

(assert (= (and b!832968 c!90672) b!832967))

(assert (= (and b!832968 (not c!90672)) b!832972))

(assert (= (or b!832967 b!832972) bm!36452))

(assert (= (or b!832970 bm!36452) bm!36451))

(assert (= (or b!832969 bm!36451) bm!36450))

(assert (= (and bm!36450 c!90671) b!832974))

(assert (= (and bm!36450 (not c!90671)) b!832971))

(assert (= (and d!106951 res!566526) b!832966))

(assert (= (and b!832966 res!566527) b!832965))

(declare-fun m!777139 () Bool)

(assert (=> b!832965 m!777139))

(declare-fun m!777141 () Bool)

(assert (=> d!106951 m!777141))

(declare-fun m!777143 () Bool)

(assert (=> d!106951 m!777143))

(declare-fun m!777145 () Bool)

(assert (=> b!832966 m!777145))

(declare-fun m!777147 () Bool)

(assert (=> bm!36450 m!777147))

(declare-fun m!777149 () Bool)

(assert (=> b!832974 m!777149))

(assert (=> d!106193 d!106951))

(declare-fun d!106953 () Bool)

(assert (=> d!106953 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106269 d!106953))

(assert (=> d!106269 d!106527))

(assert (=> b!832104 d!106733))

(assert (=> b!832104 d!106735))

(assert (=> b!831880 d!106607))

(declare-fun e!464601 () Option!420)

(declare-fun b!832977 () Bool)

(assert (=> b!832977 (= e!464601 (getValueByKey!414 (t!22308 (toList!4505 lt!377605)) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))

(declare-fun b!832978 () Bool)

(assert (=> b!832978 (= e!464601 None!418)))

(declare-fun c!90674 () Bool)

(declare-fun d!106955 () Bool)

(assert (=> d!106955 (= c!90674 (and ((_ is Cons!15945) (toList!4505 lt!377605)) (= (_1!5094 (h!17075 (toList!4505 lt!377605))) (_1!5094 (tuple2!10167 lt!377343 minValue!754)))))))

(declare-fun e!464600 () Option!420)

(assert (=> d!106955 (= (getValueByKey!414 (toList!4505 lt!377605) (_1!5094 (tuple2!10167 lt!377343 minValue!754))) e!464600)))

(declare-fun b!832976 () Bool)

(assert (=> b!832976 (= e!464600 e!464601)))

(declare-fun c!90675 () Bool)

(assert (=> b!832976 (= c!90675 (and ((_ is Cons!15945) (toList!4505 lt!377605)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377605))) (_1!5094 (tuple2!10167 lt!377343 minValue!754))))))))

(declare-fun b!832975 () Bool)

(assert (=> b!832975 (= e!464600 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377605)))))))

(assert (= (and d!106955 c!90674) b!832975))

(assert (= (and d!106955 (not c!90674)) b!832976))

(assert (= (and b!832976 c!90675) b!832977))

(assert (= (and b!832976 (not c!90675)) b!832978))

(declare-fun m!777151 () Bool)

(assert (=> b!832977 m!777151))

(assert (=> b!832171 d!106955))

(declare-fun d!106957 () Bool)

(assert (=> d!106957 (= (apply!373 lt!377547 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11832 (getValueByKey!414 (toList!4505 lt!377547) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23293 () Bool)

(assert (= bs!23293 d!106957))

(assert (=> bs!23293 m!775407))

(assert (=> bs!23293 m!776949))

(assert (=> bs!23293 m!776949))

(declare-fun m!777153 () Bool)

(assert (=> bs!23293 m!777153))

(assert (=> b!832100 d!106957))

(assert (=> b!832100 d!106851))

(declare-fun d!106959 () Bool)

(declare-fun res!566528 () Bool)

(declare-fun e!464602 () Bool)

(assert (=> d!106959 (=> res!566528 e!464602)))

(assert (=> d!106959 (= res!566528 (and ((_ is Cons!15945) (toList!4505 lt!377218)) (= (_1!5094 (h!17075 (toList!4505 lt!377218))) (_1!5094 lt!377161))))))

(assert (=> d!106959 (= (containsKey!400 (toList!4505 lt!377218) (_1!5094 lt!377161)) e!464602)))

(declare-fun b!832979 () Bool)

(declare-fun e!464603 () Bool)

(assert (=> b!832979 (= e!464602 e!464603)))

(declare-fun res!566529 () Bool)

(assert (=> b!832979 (=> (not res!566529) (not e!464603))))

(assert (=> b!832979 (= res!566529 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377218))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377218))) (_1!5094 lt!377161))) ((_ is Cons!15945) (toList!4505 lt!377218)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377218))) (_1!5094 lt!377161))))))

(declare-fun b!832980 () Bool)

(assert (=> b!832980 (= e!464603 (containsKey!400 (t!22308 (toList!4505 lt!377218)) (_1!5094 lt!377161)))))

(assert (= (and d!106959 (not res!566528)) b!832979))

(assert (= (and b!832979 res!566529) b!832980))

(declare-fun m!777155 () Bool)

(assert (=> b!832980 m!777155))

(assert (=> d!106317 d!106959))

(declare-fun e!464605 () Option!420)

(declare-fun b!832983 () Bool)

(assert (=> b!832983 (= e!464605 (getValueByKey!414 (t!22308 (toList!4505 lt!377615)) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))

(declare-fun b!832984 () Bool)

(assert (=> b!832984 (= e!464605 None!418)))

(declare-fun d!106961 () Bool)

(declare-fun c!90676 () Bool)

(assert (=> d!106961 (= c!90676 (and ((_ is Cons!15945) (toList!4505 lt!377615)) (= (_1!5094 (h!17075 (toList!4505 lt!377615))) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34)))))))

(declare-fun e!464604 () Option!420)

(assert (=> d!106961 (= (getValueByKey!414 (toList!4505 lt!377615) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))) e!464604)))

(declare-fun b!832982 () Bool)

(assert (=> b!832982 (= e!464604 e!464605)))

(declare-fun c!90677 () Bool)

(assert (=> b!832982 (= c!90677 (and ((_ is Cons!15945) (toList!4505 lt!377615)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377615))) (_1!5094 (tuple2!10167 lt!377337 zeroValueAfter!34))))))))

(declare-fun b!832981 () Bool)

(assert (=> b!832981 (= e!464604 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377615)))))))

(assert (= (and d!106961 c!90676) b!832981))

(assert (= (and d!106961 (not c!90676)) b!832982))

(assert (= (and b!832982 c!90677) b!832983))

(assert (= (and b!832982 (not c!90677)) b!832984))

(declare-fun m!777157 () Bool)

(assert (=> b!832983 m!777157))

(assert (=> b!832178 d!106961))

(declare-fun d!106963 () Bool)

(assert (=> d!106963 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377834 () Unit!28447)

(assert (=> d!106963 (= lt!377834 (choose!1436 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464606 () Bool)

(assert (=> d!106963 e!464606))

(declare-fun res!566530 () Bool)

(assert (=> d!106963 (=> (not res!566530) (not e!464606))))

(assert (=> d!106963 (= res!566530 (isStrictlySorted!438 (toList!4505 lt!377243)))))

(assert (=> d!106963 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377834)))

(declare-fun b!832985 () Bool)

(assert (=> b!832985 (= e!464606 (containsKey!400 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106963 res!566530) b!832985))

(assert (=> d!106963 m!775051))

(assert (=> d!106963 m!775647))

(assert (=> d!106963 m!775647))

(assert (=> d!106963 m!775835))

(assert (=> d!106963 m!775051))

(declare-fun m!777159 () Bool)

(assert (=> d!106963 m!777159))

(assert (=> d!106963 m!776857))

(assert (=> b!832985 m!775051))

(assert (=> b!832985 m!775831))

(assert (=> b!832109 d!106963))

(assert (=> b!832109 d!106427))

(assert (=> b!832109 d!106429))

(declare-fun d!106965 () Bool)

(declare-fun res!566531 () Bool)

(declare-fun e!464607 () Bool)

(assert (=> d!106965 (=> res!566531 e!464607)))

(assert (=> d!106965 (= res!566531 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106965 (= (containsKey!400 (toList!4505 lt!377250) #b0000000000000000000000000000000000000000000000000000000000000000) e!464607)))

(declare-fun b!832986 () Bool)

(declare-fun e!464608 () Bool)

(assert (=> b!832986 (= e!464607 e!464608)))

(declare-fun res!566532 () Bool)

(assert (=> b!832986 (=> (not res!566532) (not e!464608))))

(assert (=> b!832986 (= res!566532 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377250))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377250))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377250)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377250))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832987 () Bool)

(assert (=> b!832987 (= e!464608 (containsKey!400 (t!22308 (toList!4505 lt!377250)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106965 (not res!566531)) b!832986))

(assert (= (and b!832986 res!566532) b!832987))

(declare-fun m!777161 () Bool)

(assert (=> b!832987 m!777161))

(assert (=> d!106341 d!106965))

(assert (=> b!832153 d!106607))

(assert (=> b!832059 d!106797))

(assert (=> b!832059 d!106799))

(declare-fun d!106967 () Bool)

(declare-fun res!566533 () Bool)

(declare-fun e!464609 () Bool)

(assert (=> d!106967 (=> res!566533 e!464609)))

(assert (=> d!106967 (= res!566533 (and ((_ is Cons!15945) (toList!4505 lt!377349)) (= (_1!5094 (h!17075 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106967 (= (containsKey!400 (toList!4505 lt!377349) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464609)))

(declare-fun b!832988 () Bool)

(declare-fun e!464610 () Bool)

(assert (=> b!832988 (= e!464609 e!464610)))

(declare-fun res!566534 () Bool)

(assert (=> b!832988 (=> (not res!566534) (not e!464610))))

(assert (=> b!832988 (= res!566534 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377349))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) (toList!4505 lt!377349)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377349))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832989 () Bool)

(assert (=> b!832989 (= e!464610 (containsKey!400 (t!22308 (toList!4505 lt!377349)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106967 (not res!566533)) b!832988))

(assert (= (and b!832988 res!566534) b!832989))

(declare-fun m!777163 () Bool)

(assert (=> b!832989 m!777163))

(assert (=> d!106231 d!106967))

(assert (=> b!832145 d!106607))

(declare-fun b!832992 () Bool)

(declare-fun e!464612 () Option!420)

(assert (=> b!832992 (= e!464612 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377353))) (_1!5094 lt!377161)))))

(declare-fun b!832993 () Bool)

(assert (=> b!832993 (= e!464612 None!418)))

(declare-fun d!106969 () Bool)

(declare-fun c!90678 () Bool)

(assert (=> d!106969 (= c!90678 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377353))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377353)))) (_1!5094 lt!377161))))))

(declare-fun e!464611 () Option!420)

(assert (=> d!106969 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377353)) (_1!5094 lt!377161)) e!464611)))

(declare-fun b!832991 () Bool)

(assert (=> b!832991 (= e!464611 e!464612)))

(declare-fun c!90679 () Bool)

(assert (=> b!832991 (= c!90679 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377353))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377353)))) (_1!5094 lt!377161)))))))

(declare-fun b!832990 () Bool)

(assert (=> b!832990 (= e!464611 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377353))))))))

(assert (= (and d!106969 c!90678) b!832990))

(assert (= (and d!106969 (not c!90678)) b!832991))

(assert (= (and b!832991 c!90679) b!832992))

(assert (= (and b!832991 (not c!90679)) b!832993))

(declare-fun m!777165 () Bool)

(assert (=> b!832992 m!777165))

(assert (=> b!832005 d!106969))

(declare-fun d!106971 () Bool)

(assert (=> d!106971 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!414 (toList!4505 lt!377250) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106207 d!106971))

(assert (=> d!106207 d!106405))

(declare-fun b!832994 () Bool)

(declare-fun e!464613 () Bool)

(declare-fun lt!377835 () List!15949)

(assert (=> b!832994 (= e!464613 (contains!4191 lt!377835 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!832995 () Bool)

(declare-fun res!566536 () Bool)

(assert (=> b!832995 (=> (not res!566536) (not e!464613))))

(assert (=> b!832995 (= res!566536 (containsKey!400 lt!377835 (_1!5094 lt!377161)))))

(declare-fun b!832996 () Bool)

(declare-fun e!464615 () List!15949)

(declare-fun call!36456 () List!15949)

(assert (=> b!832996 (= e!464615 call!36456)))

(declare-fun bm!36453 () Bool)

(declare-fun c!90680 () Bool)

(declare-fun e!464617 () List!15949)

(declare-fun call!36458 () List!15949)

(assert (=> bm!36453 (= call!36458 ($colon$colon!536 e!464617 (ite c!90680 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90681 () Bool)

(assert (=> bm!36453 (= c!90681 c!90680)))

(declare-fun b!832998 () Bool)

(declare-fun e!464616 () List!15949)

(assert (=> b!832998 (= e!464616 call!36458)))

(declare-fun bm!36454 () Bool)

(declare-fun call!36457 () List!15949)

(assert (=> bm!36454 (= call!36457 call!36458)))

(declare-fun b!832999 () Bool)

(declare-fun e!464614 () List!15949)

(assert (=> b!832999 (= e!464614 call!36457)))

(declare-fun c!90682 () Bool)

(declare-fun b!833000 () Bool)

(declare-fun c!90683 () Bool)

(assert (=> b!833000 (= e!464617 (ite c!90683 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (ite c!90682 (Cons!15945 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))) Nil!15946)))))

(declare-fun b!833001 () Bool)

(assert (=> b!833001 (= e!464615 call!36456)))

(declare-fun bm!36455 () Bool)

(assert (=> bm!36455 (= call!36456 call!36457)))

(declare-fun b!833002 () Bool)

(assert (=> b!833002 (= e!464616 e!464614)))

(assert (=> b!833002 (= c!90683 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))) (_1!5094 lt!377161))))))

(declare-fun b!833003 () Bool)

(assert (=> b!833003 (= e!464617 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!832997 () Bool)

(assert (=> b!832997 (= c!90682 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))) (_1!5094 lt!377161))))))

(assert (=> b!832997 (= e!464614 e!464615)))

(declare-fun d!106973 () Bool)

(assert (=> d!106973 e!464613))

(declare-fun res!566535 () Bool)

(assert (=> d!106973 (=> (not res!566535) (not e!464613))))

(assert (=> d!106973 (= res!566535 (isStrictlySorted!438 lt!377835))))

(assert (=> d!106973 (= lt!377835 e!464616)))

(assert (=> d!106973 (= c!90680 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164)))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))) (_1!5094 lt!377161))))))

(assert (=> d!106973 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))))))

(assert (=> d!106973 (= (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377158 lt!377164))) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377835)))

(assert (= (and d!106973 c!90680) b!832998))

(assert (= (and d!106973 (not c!90680)) b!833002))

(assert (= (and b!833002 c!90683) b!832999))

(assert (= (and b!833002 (not c!90683)) b!832997))

(assert (= (and b!832997 c!90682) b!832996))

(assert (= (and b!832997 (not c!90682)) b!833001))

(assert (= (or b!832996 b!833001) bm!36455))

(assert (= (or b!832999 bm!36455) bm!36454))

(assert (= (or b!832998 bm!36454) bm!36453))

(assert (= (and bm!36453 c!90681) b!833003))

(assert (= (and bm!36453 (not c!90681)) b!833000))

(assert (= (and d!106973 res!566535) b!832995))

(assert (= (and b!832995 res!566536) b!832994))

(declare-fun m!777167 () Bool)

(assert (=> b!832994 m!777167))

(declare-fun m!777169 () Bool)

(assert (=> d!106973 m!777169))

(assert (=> d!106973 m!776897))

(declare-fun m!777171 () Bool)

(assert (=> b!832995 m!777171))

(declare-fun m!777173 () Bool)

(assert (=> bm!36453 m!777173))

(declare-fun m!777175 () Bool)

(assert (=> b!833003 m!777175))

(assert (=> b!832056 d!106973))

(declare-fun d!106975 () Bool)

(assert (=> d!106975 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377306) lt!377312)) (v!10095 (getValueByKey!414 (toList!4505 lt!377306) lt!377312)))))

(assert (=> d!106187 d!106975))

(declare-fun b!833006 () Bool)

(declare-fun e!464619 () Option!420)

(assert (=> b!833006 (= e!464619 (getValueByKey!414 (t!22308 (toList!4505 lt!377306)) lt!377312))))

(declare-fun b!833007 () Bool)

(assert (=> b!833007 (= e!464619 None!418)))

(declare-fun d!106977 () Bool)

(declare-fun c!90684 () Bool)

(assert (=> d!106977 (= c!90684 (and ((_ is Cons!15945) (toList!4505 lt!377306)) (= (_1!5094 (h!17075 (toList!4505 lt!377306))) lt!377312)))))

(declare-fun e!464618 () Option!420)

(assert (=> d!106977 (= (getValueByKey!414 (toList!4505 lt!377306) lt!377312) e!464618)))

(declare-fun b!833005 () Bool)

(assert (=> b!833005 (= e!464618 e!464619)))

(declare-fun c!90685 () Bool)

(assert (=> b!833005 (= c!90685 (and ((_ is Cons!15945) (toList!4505 lt!377306)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377306))) lt!377312))))))

(declare-fun b!833004 () Bool)

(assert (=> b!833004 (= e!464618 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377306)))))))

(assert (= (and d!106977 c!90684) b!833004))

(assert (= (and d!106977 (not c!90684)) b!833005))

(assert (= (and b!833005 c!90685) b!833006))

(assert (= (and b!833005 (not c!90685)) b!833007))

(declare-fun m!777177 () Bool)

(assert (=> b!833006 m!777177))

(assert (=> d!106187 d!106977))

(declare-fun d!106979 () Bool)

(assert (=> d!106979 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(declare-fun lt!377836 () Unit!28447)

(assert (=> d!106979 (= lt!377836 (choose!1436 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(declare-fun e!464620 () Bool)

(assert (=> d!106979 e!464620))

(declare-fun res!566537 () Bool)

(assert (=> d!106979 (=> (not res!566537) (not e!464620))))

(assert (=> d!106979 (= res!566537 (isStrictlySorted!438 (toList!4505 lt!377365)))))

(assert (=> d!106979 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377365) (_1!5094 lt!377161)) lt!377836)))

(declare-fun b!833008 () Bool)

(assert (=> b!833008 (= e!464620 (containsKey!400 (toList!4505 lt!377365) (_1!5094 lt!377161)))))

(assert (= (and d!106979 res!566537) b!833008))

(assert (=> d!106979 m!775247))

(assert (=> d!106979 m!775247))

(assert (=> d!106979 m!775579))

(declare-fun m!777179 () Bool)

(assert (=> d!106979 m!777179))

(declare-fun m!777181 () Bool)

(assert (=> d!106979 m!777181))

(assert (=> b!833008 m!775575))

(assert (=> b!831931 d!106979))

(assert (=> b!831931 d!106457))

(assert (=> b!831931 d!106253))

(declare-fun b!833011 () Bool)

(declare-fun e!464622 () Option!420)

(assert (=> b!833011 (= e!464622 (getValueByKey!414 (t!22308 (t!22308 lt!377364)) (_1!5094 lt!377161)))))

(declare-fun b!833012 () Bool)

(assert (=> b!833012 (= e!464622 None!418)))

(declare-fun d!106981 () Bool)

(declare-fun c!90686 () Bool)

(assert (=> d!106981 (= c!90686 (and ((_ is Cons!15945) (t!22308 lt!377364)) (= (_1!5094 (h!17075 (t!22308 lt!377364))) (_1!5094 lt!377161))))))

(declare-fun e!464621 () Option!420)

(assert (=> d!106981 (= (getValueByKey!414 (t!22308 lt!377364) (_1!5094 lt!377161)) e!464621)))

(declare-fun b!833010 () Bool)

(assert (=> b!833010 (= e!464621 e!464622)))

(declare-fun c!90687 () Bool)

(assert (=> b!833010 (= c!90687 (and ((_ is Cons!15945) (t!22308 lt!377364)) (not (= (_1!5094 (h!17075 (t!22308 lt!377364))) (_1!5094 lt!377161)))))))

(declare-fun b!833009 () Bool)

(assert (=> b!833009 (= e!464621 (Some!419 (_2!5094 (h!17075 (t!22308 lt!377364)))))))

(assert (= (and d!106981 c!90686) b!833009))

(assert (= (and d!106981 (not c!90686)) b!833010))

(assert (= (and b!833010 c!90687) b!833011))

(assert (= (and b!833010 (not c!90687)) b!833012))

(declare-fun m!777183 () Bool)

(assert (=> b!833011 m!777183))

(assert (=> b!831936 d!106981))

(declare-fun b!833013 () Bool)

(declare-fun e!464623 () Bool)

(declare-fun lt!377837 () List!15949)

(assert (=> b!833013 (= e!464623 (contains!4191 lt!377837 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833014 () Bool)

(declare-fun res!566539 () Bool)

(assert (=> b!833014 (=> (not res!566539) (not e!464623))))

(assert (=> b!833014 (= res!566539 (containsKey!400 lt!377837 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833015 () Bool)

(declare-fun e!464625 () List!15949)

(declare-fun call!36459 () List!15949)

(assert (=> b!833015 (= e!464625 call!36459)))

(declare-fun c!90688 () Bool)

(declare-fun e!464627 () List!15949)

(declare-fun call!36461 () List!15949)

(declare-fun bm!36456 () Bool)

(assert (=> bm!36456 (= call!36461 ($colon$colon!536 e!464627 (ite c!90688 (h!17075 (t!22308 (toList!4505 lt!377163))) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90689 () Bool)

(assert (=> bm!36456 (= c!90689 c!90688)))

(declare-fun b!833017 () Bool)

(declare-fun e!464626 () List!15949)

(assert (=> b!833017 (= e!464626 call!36461)))

(declare-fun bm!36457 () Bool)

(declare-fun call!36460 () List!15949)

(assert (=> bm!36457 (= call!36460 call!36461)))

(declare-fun b!833018 () Bool)

(declare-fun e!464624 () List!15949)

(assert (=> b!833018 (= e!464624 call!36460)))

(declare-fun c!90691 () Bool)

(declare-fun c!90690 () Bool)

(declare-fun b!833019 () Bool)

(assert (=> b!833019 (= e!464627 (ite c!90691 (t!22308 (t!22308 (toList!4505 lt!377163))) (ite c!90690 (Cons!15945 (h!17075 (t!22308 (toList!4505 lt!377163))) (t!22308 (t!22308 (toList!4505 lt!377163)))) Nil!15946)))))

(declare-fun b!833020 () Bool)

(assert (=> b!833020 (= e!464625 call!36459)))

(declare-fun bm!36458 () Bool)

(assert (=> bm!36458 (= call!36459 call!36460)))

(declare-fun b!833021 () Bool)

(assert (=> b!833021 (= e!464626 e!464624)))

(assert (=> b!833021 (= c!90691 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833022 () Bool)

(assert (=> b!833022 (= e!464627 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 lt!377163))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833016 () Bool)

(assert (=> b!833016 (= c!90690 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!833016 (= e!464624 e!464625)))

(declare-fun d!106983 () Bool)

(assert (=> d!106983 e!464623))

(declare-fun res!566538 () Bool)

(assert (=> d!106983 (=> (not res!566538) (not e!464623))))

(assert (=> d!106983 (= res!566538 (isStrictlySorted!438 lt!377837))))

(assert (=> d!106983 (= lt!377837 e!464626)))

(assert (=> d!106983 (= c!90688 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377163))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377163)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106983 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377163)))))

(assert (=> d!106983 (= (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377163)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377837)))

(assert (= (and d!106983 c!90688) b!833017))

(assert (= (and d!106983 (not c!90688)) b!833021))

(assert (= (and b!833021 c!90691) b!833018))

(assert (= (and b!833021 (not c!90691)) b!833016))

(assert (= (and b!833016 c!90690) b!833015))

(assert (= (and b!833016 (not c!90690)) b!833020))

(assert (= (or b!833015 b!833020) bm!36458))

(assert (= (or b!833018 bm!36458) bm!36457))

(assert (= (or b!833017 bm!36457) bm!36456))

(assert (= (and bm!36456 c!90689) b!833022))

(assert (= (and bm!36456 (not c!90689)) b!833019))

(assert (= (and d!106983 res!566538) b!833014))

(assert (= (and b!833014 res!566539) b!833013))

(declare-fun m!777185 () Bool)

(assert (=> b!833013 m!777185))

(declare-fun m!777187 () Bool)

(assert (=> d!106983 m!777187))

(assert (=> d!106983 m!776225))

(declare-fun m!777189 () Bool)

(assert (=> b!833014 m!777189))

(declare-fun m!777191 () Bool)

(assert (=> bm!36456 m!777191))

(declare-fun m!777193 () Bool)

(assert (=> b!833022 m!777193))

(assert (=> b!832078 d!106983))

(declare-fun d!106985 () Bool)

(assert (=> d!106985 (= (get!11830 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10092 (select (arr!22320 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!831786 d!106985))

(assert (=> d!106217 d!106215))

(declare-fun d!106987 () Bool)

(assert (=> d!106987 (= (getValueByKey!414 lt!377356 (_1!5094 lt!377164)) (Some!419 (_2!5094 lt!377164)))))

(assert (=> d!106987 true))

(declare-fun _$22!581 () Unit!28447)

(assert (=> d!106987 (= (choose!1433 lt!377356 (_1!5094 lt!377164) (_2!5094 lt!377164)) _$22!581)))

(declare-fun bs!23294 () Bool)

(assert (= bs!23294 d!106987))

(assert (=> bs!23294 m!775217))

(assert (=> d!106217 d!106987))

(declare-fun d!106989 () Bool)

(declare-fun res!566540 () Bool)

(declare-fun e!464628 () Bool)

(assert (=> d!106989 (=> res!566540 e!464628)))

(assert (=> d!106989 (= res!566540 (or ((_ is Nil!15946) lt!377356) ((_ is Nil!15946) (t!22308 lt!377356))))))

(assert (=> d!106989 (= (isStrictlySorted!438 lt!377356) e!464628)))

(declare-fun b!833023 () Bool)

(declare-fun e!464629 () Bool)

(assert (=> b!833023 (= e!464628 e!464629)))

(declare-fun res!566541 () Bool)

(assert (=> b!833023 (=> (not res!566541) (not e!464629))))

(assert (=> b!833023 (= res!566541 (bvslt (_1!5094 (h!17075 lt!377356)) (_1!5094 (h!17075 (t!22308 lt!377356)))))))

(declare-fun b!833024 () Bool)

(assert (=> b!833024 (= e!464629 (isStrictlySorted!438 (t!22308 lt!377356)))))

(assert (= (and d!106989 (not res!566540)) b!833023))

(assert (= (and b!833023 res!566541) b!833024))

(declare-fun m!777195 () Bool)

(assert (=> b!833024 m!777195))

(assert (=> d!106217 d!106989))

(declare-fun d!106991 () Bool)

(assert (=> d!106991 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))) lt!377334)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))) lt!377334)))))

(assert (=> d!106377 d!106991))

(declare-fun e!464631 () Option!420)

(declare-fun b!833027 () Bool)

(assert (=> b!833027 (= e!464631 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)))) lt!377334))))

(declare-fun b!833028 () Bool)

(assert (=> b!833028 (= e!464631 None!418)))

(declare-fun d!106993 () Bool)

(declare-fun c!90692 () Bool)

(assert (=> d!106993 (= c!90692 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))))) lt!377334)))))

(declare-fun e!464630 () Option!420)

(assert (=> d!106993 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))) lt!377334) e!464630)))

(declare-fun b!833026 () Bool)

(assert (=> b!833026 (= e!464630 e!464631)))

(declare-fun c!90693 () Bool)

(assert (=> b!833026 (= c!90693 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754))))) lt!377334))))))

(declare-fun b!833025 () Bool)

(assert (=> b!833025 (= e!464630 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377328 (tuple2!10167 lt!377343 minValue!754)))))))))

(assert (= (and d!106993 c!90692) b!833025))

(assert (= (and d!106993 (not c!90692)) b!833026))

(assert (= (and b!833026 c!90693) b!833027))

(assert (= (and b!833026 (not c!90693)) b!833028))

(declare-fun m!777197 () Bool)

(assert (=> b!833027 m!777197))

(assert (=> d!106377 d!106993))

(declare-fun d!106995 () Bool)

(declare-fun lt!377838 () Bool)

(assert (=> d!106995 (= lt!377838 (select (content!386 (toList!4505 lt!377401)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464633 () Bool)

(assert (=> d!106995 (= lt!377838 e!464633)))

(declare-fun res!566542 () Bool)

(assert (=> d!106995 (=> (not res!566542) (not e!464633))))

(assert (=> d!106995 (= res!566542 ((_ is Cons!15945) (toList!4505 lt!377401)))))

(assert (=> d!106995 (= (contains!4191 (toList!4505 lt!377401) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377838)))

(declare-fun b!833029 () Bool)

(declare-fun e!464632 () Bool)

(assert (=> b!833029 (= e!464633 e!464632)))

(declare-fun res!566543 () Bool)

(assert (=> b!833029 (=> res!566543 e!464632)))

(assert (=> b!833029 (= res!566543 (= (h!17075 (toList!4505 lt!377401)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!833030 () Bool)

(assert (=> b!833030 (= e!464632 (contains!4191 (t!22308 (toList!4505 lt!377401)) (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106995 res!566542) b!833029))

(assert (= (and b!833029 (not res!566543)) b!833030))

(declare-fun m!777199 () Bool)

(assert (=> d!106995 m!777199))

(declare-fun m!777201 () Bool)

(assert (=> d!106995 m!777201))

(declare-fun m!777203 () Bool)

(assert (=> b!833030 m!777203))

(assert (=> b!831802 d!106995))

(declare-fun b!833033 () Bool)

(declare-fun e!464635 () Option!420)

(assert (=> b!833033 (= e!464635 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377361))) (_1!5094 lt!377164)))))

(declare-fun b!833034 () Bool)

(assert (=> b!833034 (= e!464635 None!418)))

(declare-fun d!106997 () Bool)

(declare-fun c!90694 () Bool)

(assert (=> d!106997 (= c!90694 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377361))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377361)))) (_1!5094 lt!377164))))))

(declare-fun e!464634 () Option!420)

(assert (=> d!106997 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377361)) (_1!5094 lt!377164)) e!464634)))

(declare-fun b!833032 () Bool)

(assert (=> b!833032 (= e!464634 e!464635)))

(declare-fun c!90695 () Bool)

(assert (=> b!833032 (= c!90695 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377361))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377361)))) (_1!5094 lt!377164)))))))

(declare-fun b!833031 () Bool)

(assert (=> b!833031 (= e!464634 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377361))))))))

(assert (= (and d!106997 c!90694) b!833031))

(assert (= (and d!106997 (not c!90694)) b!833032))

(assert (= (and b!833032 c!90695) b!833033))

(assert (= (and b!833032 (not c!90695)) b!833034))

(declare-fun m!777205 () Bool)

(assert (=> b!833033 m!777205))

(assert (=> b!832036 d!106997))

(declare-fun b!833037 () Bool)

(declare-fun e!464637 () Option!420)

(assert (=> b!833037 (= e!464637 (getValueByKey!414 (t!22308 (t!22308 (toList!4505 lt!377222))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833038 () Bool)

(assert (=> b!833038 (= e!464637 None!418)))

(declare-fun d!106999 () Bool)

(declare-fun c!90696 () Bool)

(assert (=> d!106999 (= c!90696 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377222))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377222)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464636 () Option!420)

(assert (=> d!106999 (= (getValueByKey!414 (t!22308 (toList!4505 lt!377222)) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464636)))

(declare-fun b!833036 () Bool)

(assert (=> b!833036 (= e!464636 e!464637)))

(declare-fun c!90697 () Bool)

(assert (=> b!833036 (= c!90697 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377222))) (not (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377222)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833035 () Bool)

(assert (=> b!833035 (= e!464636 (Some!419 (_2!5094 (h!17075 (t!22308 (toList!4505 lt!377222))))))))

(assert (= (and d!106999 c!90696) b!833035))

(assert (= (and d!106999 (not c!90696)) b!833036))

(assert (= (and b!833036 c!90697) b!833037))

(assert (= (and b!833036 (not c!90697)) b!833038))

(declare-fun m!777207 () Bool)

(assert (=> b!833037 m!777207))

(assert (=> b!832088 d!106999))

(declare-fun b!833039 () Bool)

(declare-fun e!464638 () Bool)

(declare-fun lt!377839 () List!15949)

(assert (=> b!833039 (= e!464638 (contains!4191 lt!377839 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!833040 () Bool)

(declare-fun res!566545 () Bool)

(assert (=> b!833040 (=> (not res!566545) (not e!464638))))

(assert (=> b!833040 (= res!566545 (containsKey!400 lt!377839 (_1!5094 lt!377161)))))

(declare-fun b!833041 () Bool)

(declare-fun e!464640 () List!15949)

(declare-fun call!36462 () List!15949)

(assert (=> b!833041 (= e!464640 call!36462)))

(declare-fun call!36464 () List!15949)

(declare-fun c!90698 () Bool)

(declare-fun bm!36459 () Bool)

(declare-fun e!464642 () List!15949)

(assert (=> bm!36459 (= call!36464 ($colon$colon!536 e!464642 (ite c!90698 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90699 () Bool)

(assert (=> bm!36459 (= c!90699 c!90698)))

(declare-fun b!833043 () Bool)

(declare-fun e!464641 () List!15949)

(assert (=> b!833043 (= e!464641 call!36464)))

(declare-fun bm!36460 () Bool)

(declare-fun call!36463 () List!15949)

(assert (=> bm!36460 (= call!36463 call!36464)))

(declare-fun b!833044 () Bool)

(declare-fun e!464639 () List!15949)

(assert (=> b!833044 (= e!464639 call!36463)))

(declare-fun b!833045 () Bool)

(declare-fun c!90701 () Bool)

(declare-fun c!90700 () Bool)

(assert (=> b!833045 (= e!464642 (ite c!90701 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!90700 (Cons!15945 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15946)))))

(declare-fun b!833046 () Bool)

(assert (=> b!833046 (= e!464640 call!36462)))

(declare-fun bm!36461 () Bool)

(assert (=> bm!36461 (= call!36462 call!36463)))

(declare-fun b!833047 () Bool)

(assert (=> b!833047 (= e!464641 e!464639)))

(assert (=> b!833047 (= c!90701 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5094 lt!377161))))))

(declare-fun b!833048 () Bool)

(assert (=> b!833048 (= e!464642 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!833042 () Bool)

(assert (=> b!833042 (= c!90700 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5094 lt!377161))))))

(assert (=> b!833042 (= e!464639 e!464640)))

(declare-fun d!107001 () Bool)

(assert (=> d!107001 e!464638))

(declare-fun res!566544 () Bool)

(assert (=> d!107001 (=> (not res!566544) (not e!464638))))

(assert (=> d!107001 (= res!566544 (isStrictlySorted!438 lt!377839))))

(assert (=> d!107001 (= lt!377839 e!464641)))

(assert (=> d!107001 (= c!90698 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5094 lt!377161))))))

(assert (=> d!107001 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107001 (= (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377839)))

(assert (= (and d!107001 c!90698) b!833043))

(assert (= (and d!107001 (not c!90698)) b!833047))

(assert (= (and b!833047 c!90701) b!833044))

(assert (= (and b!833047 (not c!90701)) b!833042))

(assert (= (and b!833042 c!90700) b!833041))

(assert (= (and b!833042 (not c!90700)) b!833046))

(assert (= (or b!833041 b!833046) bm!36461))

(assert (= (or b!833044 bm!36461) bm!36460))

(assert (= (or b!833043 bm!36460) bm!36459))

(assert (= (and bm!36459 c!90699) b!833048))

(assert (= (and bm!36459 (not c!90699)) b!833045))

(assert (= (and d!107001 res!566544) b!833040))

(assert (= (and b!833040 res!566545) b!833039))

(declare-fun m!777209 () Bool)

(assert (=> b!833039 m!777209))

(declare-fun m!777211 () Bool)

(assert (=> d!107001 m!777211))

(assert (=> d!107001 m!777083))

(declare-fun m!777213 () Bool)

(assert (=> b!833040 m!777213))

(declare-fun m!777215 () Bool)

(assert (=> bm!36459 m!777215))

(declare-fun m!777217 () Bool)

(assert (=> b!833048 m!777217))

(assert (=> b!832136 d!107001))

(declare-fun b!833049 () Bool)

(declare-fun e!464643 () Bool)

(declare-fun lt!377840 () List!15949)

(assert (=> b!833049 (= e!464643 (contains!4191 lt!377840 (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833050 () Bool)

(declare-fun res!566547 () Bool)

(assert (=> b!833050 (=> (not res!566547) (not e!464643))))

(assert (=> b!833050 (= res!566547 (containsKey!400 lt!377840 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833051 () Bool)

(declare-fun e!464645 () List!15949)

(declare-fun call!36465 () List!15949)

(assert (=> b!833051 (= e!464645 call!36465)))

(declare-fun e!464647 () List!15949)

(declare-fun c!90702 () Bool)

(declare-fun call!36467 () List!15949)

(declare-fun bm!36462 () Bool)

(assert (=> bm!36462 (= call!36467 ($colon$colon!536 e!464647 (ite c!90702 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90703 () Bool)

(assert (=> bm!36462 (= c!90703 c!90702)))

(declare-fun b!833053 () Bool)

(declare-fun e!464646 () List!15949)

(assert (=> b!833053 (= e!464646 call!36467)))

(declare-fun bm!36463 () Bool)

(declare-fun call!36466 () List!15949)

(assert (=> bm!36463 (= call!36466 call!36467)))

(declare-fun b!833054 () Bool)

(declare-fun e!464644 () List!15949)

(assert (=> b!833054 (= e!464644 call!36466)))

(declare-fun c!90705 () Bool)

(declare-fun b!833055 () Bool)

(declare-fun c!90704 () Bool)

(assert (=> b!833055 (= e!464647 (ite c!90705 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (ite c!90704 (Cons!15945 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))) Nil!15946)))))

(declare-fun b!833056 () Bool)

(assert (=> b!833056 (= e!464645 call!36465)))

(declare-fun bm!36464 () Bool)

(assert (=> bm!36464 (= call!36465 call!36466)))

(declare-fun b!833057 () Bool)

(assert (=> b!833057 (= e!464646 e!464644)))

(assert (=> b!833057 (= c!90705 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833058 () Bool)

(assert (=> b!833058 (= e!464647 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833052 () Bool)

(assert (=> b!833052 (= c!90704 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!833052 (= e!464644 e!464645)))

(declare-fun d!107003 () Bool)

(assert (=> d!107003 e!464643))

(declare-fun res!566546 () Bool)

(assert (=> d!107003 (=> (not res!566546) (not e!464643))))

(assert (=> d!107003 (= res!566546 (isStrictlySorted!438 lt!377840))))

(assert (=> d!107003 (= lt!377840 e!464646)))

(assert (=> d!107003 (= c!90702 (and ((_ is Cons!15945) (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161)))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107003 (isStrictlySorted!438 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))))))

(assert (=> d!107003 (= (insertStrictlySorted!270 (t!22308 (toList!4505 (+!2013 lt!377163 lt!377161))) (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377840)))

(assert (= (and d!107003 c!90702) b!833053))

(assert (= (and d!107003 (not c!90702)) b!833057))

(assert (= (and b!833057 c!90705) b!833054))

(assert (= (and b!833057 (not c!90705)) b!833052))

(assert (= (and b!833052 c!90704) b!833051))

(assert (= (and b!833052 (not c!90704)) b!833056))

(assert (= (or b!833051 b!833056) bm!36464))

(assert (= (or b!833054 bm!36464) bm!36463))

(assert (= (or b!833053 bm!36463) bm!36462))

(assert (= (and bm!36462 c!90703) b!833058))

(assert (= (and bm!36462 (not c!90703)) b!833055))

(assert (= (and d!107003 res!566546) b!833050))

(assert (= (and b!833050 res!566547) b!833049))

(declare-fun m!777219 () Bool)

(assert (=> b!833049 m!777219))

(declare-fun m!777221 () Bool)

(assert (=> d!107003 m!777221))

(assert (=> d!107003 m!777005))

(declare-fun m!777223 () Bool)

(assert (=> b!833050 m!777223))

(declare-fun m!777225 () Bool)

(assert (=> bm!36462 m!777225))

(declare-fun m!777227 () Bool)

(assert (=> b!833058 m!777227))

(assert (=> b!831970 d!107003))

(declare-fun d!107005 () Bool)

(assert (=> d!107005 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377841 () Unit!28447)

(assert (=> d!107005 (= lt!377841 (choose!1436 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464648 () Bool)

(assert (=> d!107005 e!464648))

(declare-fun res!566548 () Bool)

(assert (=> d!107005 (=> (not res!566548) (not e!464648))))

(assert (=> d!107005 (= res!566548 (isStrictlySorted!438 (toList!4505 lt!377243)))))

(assert (=> d!107005 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377841)))

(declare-fun b!833059 () Bool)

(assert (=> b!833059 (= e!464648 (containsKey!400 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107005 res!566548) b!833059))

(assert (=> d!107005 m!775349))

(assert (=> d!107005 m!775349))

(assert (=> d!107005 m!775351))

(declare-fun m!777229 () Bool)

(assert (=> d!107005 m!777229))

(assert (=> d!107005 m!776857))

(assert (=> b!833059 m!775345))

(assert (=> b!831854 d!107005))

(assert (=> b!831854 d!106459))

(assert (=> b!831854 d!106461))

(declare-fun d!107007 () Bool)

(assert (=> d!107007 (= ($colon$colon!536 e!464015 (ite c!90384 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))) (Cons!15945 (ite c!90384 (h!17075 (toList!4505 (+!2013 lt!377158 lt!377164))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) e!464015))))

(assert (=> bm!36390 d!107007))

(declare-fun d!107009 () Bool)

(assert (=> d!107009 (not (contains!4190 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437)) lt!377438))))

(declare-fun lt!377842 () Unit!28447)

(assert (=> d!107009 (= lt!377842 (choose!1432 lt!377436 lt!377432 lt!377437 lt!377438))))

(declare-fun e!464649 () Bool)

(assert (=> d!107009 e!464649))

(declare-fun res!566549 () Bool)

(assert (=> d!107009 (=> (not res!566549) (not e!464649))))

(assert (=> d!107009 (= res!566549 (not (contains!4190 lt!377436 lt!377438)))))

(assert (=> d!107009 (= (addStillNotContains!199 lt!377436 lt!377432 lt!377437 lt!377438) lt!377842)))

(declare-fun b!833060 () Bool)

(assert (=> b!833060 (= e!464649 (not (= lt!377432 lt!377438)))))

(assert (= (and d!107009 res!566549) b!833060))

(assert (=> d!107009 m!775395))

(assert (=> d!107009 m!775395))

(assert (=> d!107009 m!775397))

(declare-fun m!777231 () Bool)

(assert (=> d!107009 m!777231))

(declare-fun m!777233 () Bool)

(assert (=> d!107009 m!777233))

(assert (=> b!831876 d!107009))

(declare-fun d!107011 () Bool)

(declare-fun e!464651 () Bool)

(assert (=> d!107011 e!464651))

(declare-fun res!566550 () Bool)

(assert (=> d!107011 (=> res!566550 e!464651)))

(declare-fun lt!377845 () Bool)

(assert (=> d!107011 (= res!566550 (not lt!377845))))

(declare-fun lt!377843 () Bool)

(assert (=> d!107011 (= lt!377845 lt!377843)))

(declare-fun lt!377846 () Unit!28447)

(declare-fun e!464650 () Unit!28447)

(assert (=> d!107011 (= lt!377846 e!464650)))

(declare-fun c!90706 () Bool)

(assert (=> d!107011 (= c!90706 lt!377843)))

(assert (=> d!107011 (= lt!377843 (containsKey!400 (toList!4505 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437))) lt!377438))))

(assert (=> d!107011 (= (contains!4190 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437)) lt!377438) lt!377845)))

(declare-fun b!833061 () Bool)

(declare-fun lt!377844 () Unit!28447)

(assert (=> b!833061 (= e!464650 lt!377844)))

(assert (=> b!833061 (= lt!377844 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437))) lt!377438))))

(assert (=> b!833061 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437))) lt!377438))))

(declare-fun b!833062 () Bool)

(declare-fun Unit!28501 () Unit!28447)

(assert (=> b!833062 (= e!464650 Unit!28501)))

(declare-fun b!833063 () Bool)

(assert (=> b!833063 (= e!464651 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437))) lt!377438)))))

(assert (= (and d!107011 c!90706) b!833061))

(assert (= (and d!107011 (not c!90706)) b!833062))

(assert (= (and d!107011 (not res!566550)) b!833063))

(declare-fun m!777235 () Bool)

(assert (=> d!107011 m!777235))

(declare-fun m!777237 () Bool)

(assert (=> b!833061 m!777237))

(declare-fun m!777239 () Bool)

(assert (=> b!833061 m!777239))

(assert (=> b!833061 m!777239))

(declare-fun m!777241 () Bool)

(assert (=> b!833061 m!777241))

(assert (=> b!833063 m!777239))

(assert (=> b!833063 m!777239))

(assert (=> b!833063 m!777241))

(assert (=> b!831876 d!107011))

(declare-fun d!107013 () Bool)

(declare-fun e!464652 () Bool)

(assert (=> d!107013 e!464652))

(declare-fun res!566551 () Bool)

(assert (=> d!107013 (=> (not res!566551) (not e!464652))))

(declare-fun lt!377850 () ListLongMap!8979)

(assert (=> d!107013 (= res!566551 (contains!4190 lt!377850 (_1!5094 (tuple2!10167 lt!377432 lt!377437))))))

(declare-fun lt!377849 () List!15949)

(assert (=> d!107013 (= lt!377850 (ListLongMap!8980 lt!377849))))

(declare-fun lt!377848 () Unit!28447)

(declare-fun lt!377847 () Unit!28447)

(assert (=> d!107013 (= lt!377848 lt!377847)))

(assert (=> d!107013 (= (getValueByKey!414 lt!377849 (_1!5094 (tuple2!10167 lt!377432 lt!377437))) (Some!419 (_2!5094 (tuple2!10167 lt!377432 lt!377437))))))

(assert (=> d!107013 (= lt!377847 (lemmaContainsTupThenGetReturnValue!231 lt!377849 (_1!5094 (tuple2!10167 lt!377432 lt!377437)) (_2!5094 (tuple2!10167 lt!377432 lt!377437))))))

(assert (=> d!107013 (= lt!377849 (insertStrictlySorted!270 (toList!4505 lt!377436) (_1!5094 (tuple2!10167 lt!377432 lt!377437)) (_2!5094 (tuple2!10167 lt!377432 lt!377437))))))

(assert (=> d!107013 (= (+!2013 lt!377436 (tuple2!10167 lt!377432 lt!377437)) lt!377850)))

(declare-fun b!833064 () Bool)

(declare-fun res!566552 () Bool)

(assert (=> b!833064 (=> (not res!566552) (not e!464652))))

(assert (=> b!833064 (= res!566552 (= (getValueByKey!414 (toList!4505 lt!377850) (_1!5094 (tuple2!10167 lt!377432 lt!377437))) (Some!419 (_2!5094 (tuple2!10167 lt!377432 lt!377437)))))))

(declare-fun b!833065 () Bool)

(assert (=> b!833065 (= e!464652 (contains!4191 (toList!4505 lt!377850) (tuple2!10167 lt!377432 lt!377437)))))

(assert (= (and d!107013 res!566551) b!833064))

(assert (= (and b!833064 res!566552) b!833065))

(declare-fun m!777243 () Bool)

(assert (=> d!107013 m!777243))

(declare-fun m!777245 () Bool)

(assert (=> d!107013 m!777245))

(declare-fun m!777247 () Bool)

(assert (=> d!107013 m!777247))

(declare-fun m!777249 () Bool)

(assert (=> d!107013 m!777249))

(declare-fun m!777251 () Bool)

(assert (=> b!833064 m!777251))

(declare-fun m!777253 () Bool)

(assert (=> b!833065 m!777253))

(assert (=> b!831876 d!107013))

(declare-fun d!107015 () Bool)

(declare-fun e!464653 () Bool)

(assert (=> d!107015 e!464653))

(declare-fun res!566553 () Bool)

(assert (=> d!107015 (=> (not res!566553) (not e!464653))))

(declare-fun lt!377854 () ListLongMap!8979)

(assert (=> d!107015 (= res!566553 (contains!4190 lt!377854 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377853 () List!15949)

(assert (=> d!107015 (= lt!377854 (ListLongMap!8980 lt!377853))))

(declare-fun lt!377852 () Unit!28447)

(declare-fun lt!377851 () Unit!28447)

(assert (=> d!107015 (= lt!377852 lt!377851)))

(assert (=> d!107015 (= (getValueByKey!414 lt!377853 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107015 (= lt!377851 (lemmaContainsTupThenGetReturnValue!231 lt!377853 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107015 (= lt!377853 (insertStrictlySorted!270 (toList!4505 call!36380) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107015 (= (+!2013 call!36380 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377854)))

(declare-fun b!833066 () Bool)

(declare-fun res!566554 () Bool)

(assert (=> b!833066 (=> (not res!566554) (not e!464653))))

(assert (=> b!833066 (= res!566554 (= (getValueByKey!414 (toList!4505 lt!377854) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833067 () Bool)

(assert (=> b!833067 (= e!464653 (contains!4191 (toList!4505 lt!377854) (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107015 res!566553) b!833066))

(assert (= (and b!833066 res!566554) b!833067))

(declare-fun m!777255 () Bool)

(assert (=> d!107015 m!777255))

(declare-fun m!777257 () Bool)

(assert (=> d!107015 m!777257))

(declare-fun m!777259 () Bool)

(assert (=> d!107015 m!777259))

(declare-fun m!777261 () Bool)

(assert (=> d!107015 m!777261))

(declare-fun m!777263 () Bool)

(assert (=> b!833066 m!777263))

(declare-fun m!777265 () Bool)

(assert (=> b!833067 m!777265))

(assert (=> b!831876 d!107015))

(assert (=> b!831876 d!106851))

(assert (=> bm!36396 d!106907))

(declare-fun d!107017 () Bool)

(declare-fun res!566555 () Bool)

(declare-fun e!464654 () Bool)

(assert (=> d!107017 (=> res!566555 e!464654)))

(assert (=> d!107017 (= res!566555 (and ((_ is Cons!15945) lt!377411) (= (_1!5094 (h!17075 lt!377411)) (_1!5094 lt!377164))))))

(assert (=> d!107017 (= (containsKey!400 lt!377411 (_1!5094 lt!377164)) e!464654)))

(declare-fun b!833068 () Bool)

(declare-fun e!464655 () Bool)

(assert (=> b!833068 (= e!464654 e!464655)))

(declare-fun res!566556 () Bool)

(assert (=> b!833068 (=> (not res!566556) (not e!464655))))

(assert (=> b!833068 (= res!566556 (and (or (not ((_ is Cons!15945) lt!377411)) (bvsle (_1!5094 (h!17075 lt!377411)) (_1!5094 lt!377164))) ((_ is Cons!15945) lt!377411) (bvslt (_1!5094 (h!17075 lt!377411)) (_1!5094 lt!377164))))))

(declare-fun b!833069 () Bool)

(assert (=> b!833069 (= e!464655 (containsKey!400 (t!22308 lt!377411) (_1!5094 lt!377164)))))

(assert (= (and d!107017 (not res!566555)) b!833068))

(assert (= (and b!833068 res!566556) b!833069))

(declare-fun m!777267 () Bool)

(assert (=> b!833069 m!777267))

(assert (=> b!831845 d!107017))

(declare-fun d!107019 () Bool)

(declare-fun res!566557 () Bool)

(declare-fun e!464656 () Bool)

(assert (=> d!107019 (=> res!566557 e!464656)))

(assert (=> d!107019 (= res!566557 (= (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377373))))

(assert (=> d!107019 (= (arrayContainsKey!0 _keys!976 lt!377373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!464656)))

(declare-fun b!833070 () Bool)

(declare-fun e!464657 () Bool)

(assert (=> b!833070 (= e!464656 e!464657)))

(declare-fun res!566558 () Bool)

(assert (=> b!833070 (=> (not res!566558) (not e!464657))))

(assert (=> b!833070 (= res!566558 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(declare-fun b!833071 () Bool)

(assert (=> b!833071 (= e!464657 (arrayContainsKey!0 _keys!976 lt!377373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!107019 (not res!566557)) b!833070))

(assert (= (and b!833070 res!566558) b!833071))

(assert (=> d!107019 m!775407))

(declare-fun m!777269 () Bool)

(assert (=> b!833071 m!777269))

(assert (=> b!832012 d!107019))

(declare-fun d!107021 () Bool)

(assert (=> d!107021 (= ($colon$colon!536 e!464027 (ite c!90392 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15945 (ite c!90392 (h!17075 (toList!4505 lt!377163)) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464027))))

(assert (=> bm!36393 d!107021))

(declare-fun d!107023 () Bool)

(assert (=> d!107023 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377855 () Unit!28447)

(assert (=> d!107023 (= lt!377855 (choose!1436 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464658 () Bool)

(assert (=> d!107023 e!464658))

(declare-fun res!566559 () Bool)

(assert (=> d!107023 (=> (not res!566559) (not e!464658))))

(assert (=> d!107023 (= res!566559 (isStrictlySorted!438 (toList!4505 lt!377250)))))

(assert (=> d!107023 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377855)))

(declare-fun b!833072 () Bool)

(assert (=> b!833072 (= e!464658 (containsKey!400 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107023 res!566559) b!833072))

(assert (=> d!107023 m!775683))

(assert (=> d!107023 m!775683))

(assert (=> d!107023 m!775685))

(declare-fun m!777271 () Bool)

(assert (=> d!107023 m!777271))

(assert (=> d!107023 m!776109))

(assert (=> b!833072 m!775679))

(assert (=> b!831992 d!107023))

(assert (=> b!831992 d!106509))

(assert (=> b!831992 d!106511))

(declare-fun d!107025 () Bool)

(declare-fun res!566560 () Bool)

(declare-fun e!464659 () Bool)

(assert (=> d!107025 (=> res!566560 e!464659)))

(assert (=> d!107025 (= res!566560 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107025 (= (containsKey!400 (toList!4505 lt!377243) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464659)))

(declare-fun b!833073 () Bool)

(declare-fun e!464660 () Bool)

(assert (=> b!833073 (= e!464659 e!464660)))

(declare-fun res!566561 () Bool)

(assert (=> b!833073 (=> (not res!566561) (not e!464660))))

(assert (=> b!833073 (= res!566561 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377243))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377243))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377243)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377243))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833074 () Bool)

(assert (=> b!833074 (= e!464660 (containsKey!400 (t!22308 (toList!4505 lt!377243)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107025 (not res!566560)) b!833073))

(assert (= (and b!833073 res!566561) b!833074))

(assert (=> b!833074 m!775051))

(declare-fun m!777273 () Bool)

(assert (=> b!833074 m!777273))

(assert (=> d!106309 d!107025))

(assert (=> d!106247 d!106245))

(declare-fun d!107027 () Bool)

(assert (=> d!107027 (= (getValueByKey!414 lt!377352 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!107027 true))

(declare-fun _$22!582 () Unit!28447)

(assert (=> d!107027 (= (choose!1433 lt!377352 (_1!5094 lt!377161) (_2!5094 lt!377161)) _$22!582)))

(declare-fun bs!23295 () Bool)

(assert (= bs!23295 d!107027))

(assert (=> bs!23295 m!775205))

(assert (=> d!106247 d!107027))

(declare-fun d!107029 () Bool)

(declare-fun res!566562 () Bool)

(declare-fun e!464661 () Bool)

(assert (=> d!107029 (=> res!566562 e!464661)))

(assert (=> d!107029 (= res!566562 (or ((_ is Nil!15946) lt!377352) ((_ is Nil!15946) (t!22308 lt!377352))))))

(assert (=> d!107029 (= (isStrictlySorted!438 lt!377352) e!464661)))

(declare-fun b!833075 () Bool)

(declare-fun e!464662 () Bool)

(assert (=> b!833075 (= e!464661 e!464662)))

(declare-fun res!566563 () Bool)

(assert (=> b!833075 (=> (not res!566563) (not e!464662))))

(assert (=> b!833075 (= res!566563 (bvslt (_1!5094 (h!17075 lt!377352)) (_1!5094 (h!17075 (t!22308 lt!377352)))))))

(declare-fun b!833076 () Bool)

(assert (=> b!833076 (= e!464662 (isStrictlySorted!438 (t!22308 lt!377352)))))

(assert (= (and d!107029 (not res!566562)) b!833075))

(assert (= (and b!833075 res!566563) b!833076))

(declare-fun m!777275 () Bool)

(assert (=> b!833076 m!777275))

(assert (=> d!106247 d!107029))

(assert (=> b!831805 d!106861))

(assert (=> b!831805 d!106267))

(assert (=> b!832033 d!106865))

(assert (=> b!832033 d!106441))

(declare-fun d!107031 () Bool)

(declare-fun res!566564 () Bool)

(declare-fun e!464663 () Bool)

(assert (=> d!107031 (=> res!566564 e!464663)))

(assert (=> d!107031 (= res!566564 (and ((_ is Cons!15945) lt!377480) (= (_1!5094 (h!17075 lt!377480)) (_1!5094 lt!377164))))))

(assert (=> d!107031 (= (containsKey!400 lt!377480 (_1!5094 lt!377164)) e!464663)))

(declare-fun b!833077 () Bool)

(declare-fun e!464664 () Bool)

(assert (=> b!833077 (= e!464663 e!464664)))

(declare-fun res!566565 () Bool)

(assert (=> b!833077 (=> (not res!566565) (not e!464664))))

(assert (=> b!833077 (= res!566565 (and (or (not ((_ is Cons!15945) lt!377480)) (bvsle (_1!5094 (h!17075 lt!377480)) (_1!5094 lt!377164))) ((_ is Cons!15945) lt!377480) (bvslt (_1!5094 (h!17075 lt!377480)) (_1!5094 lt!377164))))))

(declare-fun b!833078 () Bool)

(assert (=> b!833078 (= e!464664 (containsKey!400 (t!22308 lt!377480) (_1!5094 lt!377164)))))

(assert (= (and d!107031 (not res!566564)) b!833077))

(assert (= (and b!833077 res!566565) b!833078))

(declare-fun m!777277 () Bool)

(assert (=> b!833078 m!777277))

(assert (=> b!831922 d!107031))

(declare-fun d!107033 () Bool)

(assert (=> d!107033 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377333) lt!377345)) (v!10095 (getValueByKey!414 (toList!4505 lt!377333) lt!377345)))))

(assert (=> d!106359 d!107033))

(declare-fun b!833081 () Bool)

(declare-fun e!464666 () Option!420)

(assert (=> b!833081 (= e!464666 (getValueByKey!414 (t!22308 (toList!4505 lt!377333)) lt!377345))))

(declare-fun b!833082 () Bool)

(assert (=> b!833082 (= e!464666 None!418)))

(declare-fun d!107035 () Bool)

(declare-fun c!90707 () Bool)

(assert (=> d!107035 (= c!90707 (and ((_ is Cons!15945) (toList!4505 lt!377333)) (= (_1!5094 (h!17075 (toList!4505 lt!377333))) lt!377345)))))

(declare-fun e!464665 () Option!420)

(assert (=> d!107035 (= (getValueByKey!414 (toList!4505 lt!377333) lt!377345) e!464665)))

(declare-fun b!833080 () Bool)

(assert (=> b!833080 (= e!464665 e!464666)))

(declare-fun c!90708 () Bool)

(assert (=> b!833080 (= c!90708 (and ((_ is Cons!15945) (toList!4505 lt!377333)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377333))) lt!377345))))))

(declare-fun b!833079 () Bool)

(assert (=> b!833079 (= e!464665 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377333)))))))

(assert (= (and d!107035 c!90707) b!833079))

(assert (= (and d!107035 (not c!90707)) b!833080))

(assert (= (and b!833080 c!90708) b!833081))

(assert (= (and b!833080 (not c!90708)) b!833082))

(declare-fun m!777279 () Bool)

(assert (=> b!833081 m!777279))

(assert (=> d!106359 d!107035))

(declare-fun d!107037 () Bool)

(assert (=> d!107037 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377856 () Unit!28447)

(assert (=> d!107037 (= lt!377856 (choose!1436 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464667 () Bool)

(assert (=> d!107037 e!464667))

(declare-fun res!566566 () Bool)

(assert (=> d!107037 (=> (not res!566566) (not e!464667))))

(assert (=> d!107037 (= res!566566 (isStrictlySorted!438 (toList!4505 lt!377318)))))

(assert (=> d!107037 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377856)))

(declare-fun b!833083 () Bool)

(assert (=> b!833083 (= e!464667 (containsKey!400 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107037 res!566566) b!833083))

(assert (=> d!107037 m!775429))

(assert (=> d!107037 m!775429))

(assert (=> d!107037 m!775795))

(declare-fun m!777281 () Bool)

(assert (=> d!107037 m!777281))

(assert (=> d!107037 m!776069))

(assert (=> b!833083 m!775791))

(assert (=> b!832083 d!107037))

(assert (=> b!832083 d!106475))

(assert (=> b!832083 d!106477))

(declare-fun d!107039 () Bool)

(declare-fun res!566568 () Bool)

(declare-fun e!464670 () Bool)

(assert (=> d!107039 (=> res!566568 e!464670)))

(assert (=> d!107039 (= res!566568 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22740 _keys!976)))))

(assert (=> d!107039 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!464670)))

(declare-fun b!833084 () Bool)

(declare-fun e!464669 () Bool)

(declare-fun e!464668 () Bool)

(assert (=> b!833084 (= e!464669 e!464668)))

(declare-fun lt!377858 () (_ BitVec 64))

(assert (=> b!833084 (= lt!377858 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!377857 () Unit!28447)

(assert (=> b!833084 (= lt!377857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377858 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!833084 (arrayContainsKey!0 _keys!976 lt!377858 #b00000000000000000000000000000000)))

(declare-fun lt!377859 () Unit!28447)

(assert (=> b!833084 (= lt!377859 lt!377857)))

(declare-fun res!566567 () Bool)

(assert (=> b!833084 (= res!566567 (= (seekEntryOrOpen!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833084 (=> (not res!566567) (not e!464668))))

(declare-fun bm!36465 () Bool)

(declare-fun call!36468 () Bool)

(assert (=> bm!36465 (= call!36468 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!833085 () Bool)

(assert (=> b!833085 (= e!464670 e!464669)))

(declare-fun c!90709 () Bool)

(assert (=> b!833085 (= c!90709 (validKeyInArray!0 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833086 () Bool)

(assert (=> b!833086 (= e!464668 call!36468)))

(declare-fun b!833087 () Bool)

(assert (=> b!833087 (= e!464669 call!36468)))

(assert (= (and d!107039 (not res!566568)) b!833085))

(assert (= (and b!833085 c!90709) b!833084))

(assert (= (and b!833085 (not c!90709)) b!833087))

(assert (= (and b!833084 res!566567) b!833086))

(assert (= (or b!833086 b!833087) bm!36465))

(assert (=> b!833084 m!776345))

(declare-fun m!777283 () Bool)

(assert (=> b!833084 m!777283))

(declare-fun m!777285 () Bool)

(assert (=> b!833084 m!777285))

(assert (=> b!833084 m!776345))

(declare-fun m!777287 () Bool)

(assert (=> b!833084 m!777287))

(declare-fun m!777289 () Bool)

(assert (=> bm!36465 m!777289))

(assert (=> b!833085 m!776345))

(assert (=> b!833085 m!776345))

(assert (=> b!833085 m!776355))

(assert (=> bm!36401 d!107039))

(assert (=> b!832144 d!106607))

(declare-fun d!107041 () Bool)

(assert (=> d!107041 (= ($colon$colon!536 e!464060 (ite c!90414 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))) (Cons!15945 (ite c!90414 (h!17075 (toList!4505 (+!2013 lt!377163 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))) e!464060))))

(assert (=> bm!36397 d!107041))

(declare-fun d!107043 () Bool)

(declare-fun res!566569 () Bool)

(declare-fun e!464671 () Bool)

(assert (=> d!107043 (=> res!566569 e!464671)))

(assert (=> d!107043 (= res!566569 (and ((_ is Cons!15945) (toList!4505 lt!377365)) (= (_1!5094 (h!17075 (toList!4505 lt!377365))) (_1!5094 lt!377161))))))

(assert (=> d!107043 (= (containsKey!400 (toList!4505 lt!377365) (_1!5094 lt!377161)) e!464671)))

(declare-fun b!833088 () Bool)

(declare-fun e!464672 () Bool)

(assert (=> b!833088 (= e!464671 e!464672)))

(declare-fun res!566570 () Bool)

(assert (=> b!833088 (=> (not res!566570) (not e!464672))))

(assert (=> b!833088 (= res!566570 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377365))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377365))) (_1!5094 lt!377161))) ((_ is Cons!15945) (toList!4505 lt!377365)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377365))) (_1!5094 lt!377161))))))

(declare-fun b!833089 () Bool)

(assert (=> b!833089 (= e!464672 (containsKey!400 (t!22308 (toList!4505 lt!377365)) (_1!5094 lt!377161)))))

(assert (= (and d!107043 (not res!566569)) b!833088))

(assert (= (and b!833088 res!566570) b!833089))

(declare-fun m!777291 () Bool)

(assert (=> b!833089 m!777291))

(assert (=> d!106221 d!107043))

(declare-fun lt!377860 () Bool)

(declare-fun d!107045 () Bool)

(assert (=> d!107045 (= lt!377860 (select (content!386 (toList!4505 lt!377426)) (tuple2!10167 lt!377240 lt!377245)))))

(declare-fun e!464674 () Bool)

(assert (=> d!107045 (= lt!377860 e!464674)))

(declare-fun res!566571 () Bool)

(assert (=> d!107045 (=> (not res!566571) (not e!464674))))

(assert (=> d!107045 (= res!566571 ((_ is Cons!15945) (toList!4505 lt!377426)))))

(assert (=> d!107045 (= (contains!4191 (toList!4505 lt!377426) (tuple2!10167 lt!377240 lt!377245)) lt!377860)))

(declare-fun b!833090 () Bool)

(declare-fun e!464673 () Bool)

(assert (=> b!833090 (= e!464674 e!464673)))

(declare-fun res!566572 () Bool)

(assert (=> b!833090 (=> res!566572 e!464673)))

(assert (=> b!833090 (= res!566572 (= (h!17075 (toList!4505 lt!377426)) (tuple2!10167 lt!377240 lt!377245)))))

(declare-fun b!833091 () Bool)

(assert (=> b!833091 (= e!464673 (contains!4191 (t!22308 (toList!4505 lt!377426)) (tuple2!10167 lt!377240 lt!377245)))))

(assert (= (and d!107045 res!566571) b!833090))

(assert (= (and b!833090 (not res!566572)) b!833091))

(declare-fun m!777293 () Bool)

(assert (=> d!107045 m!777293))

(declare-fun m!777295 () Bool)

(assert (=> d!107045 m!777295))

(declare-fun m!777297 () Bool)

(assert (=> b!833091 m!777297))

(assert (=> b!831867 d!107045))

(declare-fun d!107047 () Bool)

(declare-fun lt!377861 () Bool)

(assert (=> d!107047 (= lt!377861 (select (content!386 (toList!4505 lt!377596)) (tuple2!10167 lt!377325 minValue!754)))))

(declare-fun e!464676 () Bool)

(assert (=> d!107047 (= lt!377861 e!464676)))

(declare-fun res!566573 () Bool)

(assert (=> d!107047 (=> (not res!566573) (not e!464676))))

(assert (=> d!107047 (= res!566573 ((_ is Cons!15945) (toList!4505 lt!377596)))))

(assert (=> d!107047 (= (contains!4191 (toList!4505 lt!377596) (tuple2!10167 lt!377325 minValue!754)) lt!377861)))

(declare-fun b!833092 () Bool)

(declare-fun e!464675 () Bool)

(assert (=> b!833092 (= e!464676 e!464675)))

(declare-fun res!566574 () Bool)

(assert (=> b!833092 (=> res!566574 e!464675)))

(assert (=> b!833092 (= res!566574 (= (h!17075 (toList!4505 lt!377596)) (tuple2!10167 lt!377325 minValue!754)))))

(declare-fun b!833093 () Bool)

(assert (=> b!833093 (= e!464675 (contains!4191 (t!22308 (toList!4505 lt!377596)) (tuple2!10167 lt!377325 minValue!754)))))

(assert (= (and d!107047 res!566573) b!833092))

(assert (= (and b!833092 (not res!566574)) b!833093))

(declare-fun m!777299 () Bool)

(assert (=> d!107047 m!777299))

(declare-fun m!777301 () Bool)

(assert (=> d!107047 m!777301))

(declare-fun m!777303 () Bool)

(assert (=> b!833093 m!777303))

(assert (=> b!832168 d!107047))

(declare-fun d!107049 () Bool)

(declare-fun res!566575 () Bool)

(declare-fun e!464677 () Bool)

(assert (=> d!107049 (=> res!566575 e!464677)))

(assert (=> d!107049 (= res!566575 (and ((_ is Cons!15945) (toList!4505 lt!377243)) (= (_1!5094 (h!17075 (toList!4505 lt!377243))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107049 (= (containsKey!400 (toList!4505 lt!377243) #b1000000000000000000000000000000000000000000000000000000000000000) e!464677)))

(declare-fun b!833094 () Bool)

(declare-fun e!464678 () Bool)

(assert (=> b!833094 (= e!464677 e!464678)))

(declare-fun res!566576 () Bool)

(assert (=> b!833094 (=> (not res!566576) (not e!464678))))

(assert (=> b!833094 (= res!566576 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377243))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377243))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377243)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377243))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833095 () Bool)

(assert (=> b!833095 (= e!464678 (containsKey!400 (t!22308 (toList!4505 lt!377243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107049 (not res!566575)) b!833094))

(assert (= (and b!833094 res!566576) b!833095))

(declare-fun m!777305 () Bool)

(assert (=> b!833095 m!777305))

(assert (=> d!106159 d!107049))

(declare-fun d!107051 () Bool)

(declare-fun res!566577 () Bool)

(declare-fun e!464679 () Bool)

(assert (=> d!107051 (=> res!566577 e!464679)))

(assert (=> d!107051 (= res!566577 (or ((_ is Nil!15946) lt!377480) ((_ is Nil!15946) (t!22308 lt!377480))))))

(assert (=> d!107051 (= (isStrictlySorted!438 lt!377480) e!464679)))

(declare-fun b!833096 () Bool)

(declare-fun e!464680 () Bool)

(assert (=> b!833096 (= e!464679 e!464680)))

(declare-fun res!566578 () Bool)

(assert (=> b!833096 (=> (not res!566578) (not e!464680))))

(assert (=> b!833096 (= res!566578 (bvslt (_1!5094 (h!17075 lt!377480)) (_1!5094 (h!17075 (t!22308 lt!377480)))))))

(declare-fun b!833097 () Bool)

(assert (=> b!833097 (= e!464680 (isStrictlySorted!438 (t!22308 lt!377480)))))

(assert (= (and d!107051 (not res!566577)) b!833096))

(assert (= (and b!833096 res!566578) b!833097))

(declare-fun m!777307 () Bool)

(assert (=> b!833097 m!777307))

(assert (=> d!106219 d!107051))

(assert (=> d!106219 d!106595))

(declare-fun d!107053 () Bool)

(assert (=> d!107053 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))) lt!377323)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))) lt!377323)))))

(assert (=> d!106181 d!107053))

(declare-fun b!833100 () Bool)

(declare-fun e!464682 () Option!420)

(assert (=> b!833100 (= e!464682 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)))) lt!377323))))

(declare-fun b!833101 () Bool)

(assert (=> b!833101 (= e!464682 None!418)))

(declare-fun c!90710 () Bool)

(declare-fun d!107055 () Bool)

(assert (=> d!107055 (= c!90710 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))))) lt!377323)))))

(declare-fun e!464681 () Option!420)

(assert (=> d!107055 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))) lt!377323) e!464681)))

(declare-fun b!833099 () Bool)

(assert (=> b!833099 (= e!464681 e!464682)))

(declare-fun c!90711 () Bool)

(assert (=> b!833099 (= c!90711 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754))))) lt!377323))))))

(declare-fun b!833098 () Bool)

(assert (=> b!833098 (= e!464681 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377311 (tuple2!10167 lt!377303 minValue!754)))))))))

(assert (= (and d!107055 c!90710) b!833098))

(assert (= (and d!107055 (not c!90710)) b!833099))

(assert (= (and b!833099 c!90711) b!833100))

(assert (= (and b!833099 (not c!90711)) b!833101))

(declare-fun m!777309 () Bool)

(assert (=> b!833100 m!777309))

(assert (=> d!106181 d!107055))

(declare-fun d!107057 () Bool)

(declare-fun res!566579 () Bool)

(declare-fun e!464683 () Bool)

(assert (=> d!107057 (=> res!566579 e!464683)))

(assert (=> d!107057 (= res!566579 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107057 (= (containsKey!400 (toList!4505 lt!377318) #b1000000000000000000000000000000000000000000000000000000000000000) e!464683)))

(declare-fun b!833102 () Bool)

(declare-fun e!464684 () Bool)

(assert (=> b!833102 (= e!464683 e!464684)))

(declare-fun res!566580 () Bool)

(assert (=> b!833102 (=> (not res!566580) (not e!464684))))

(assert (=> b!833102 (= res!566580 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377318))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377318))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377318)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377318))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833103 () Bool)

(assert (=> b!833103 (= e!464684 (containsKey!400 (t!22308 (toList!4505 lt!377318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107057 (not res!566579)) b!833102))

(assert (= (and b!833102 res!566580) b!833103))

(declare-fun m!777311 () Bool)

(assert (=> b!833103 m!777311))

(assert (=> d!106297 d!107057))

(declare-fun d!107059 () Bool)

(declare-fun res!566581 () Bool)

(declare-fun e!464685 () Bool)

(assert (=> d!107059 (=> res!566581 e!464685)))

(assert (=> d!107059 (= res!566581 (and ((_ is Cons!15945) lt!377503) (= (_1!5094 (h!17075 lt!377503)) (_1!5094 lt!377161))))))

(assert (=> d!107059 (= (containsKey!400 lt!377503 (_1!5094 lt!377161)) e!464685)))

(declare-fun b!833104 () Bool)

(declare-fun e!464686 () Bool)

(assert (=> b!833104 (= e!464685 e!464686)))

(declare-fun res!566582 () Bool)

(assert (=> b!833104 (=> (not res!566582) (not e!464686))))

(assert (=> b!833104 (= res!566582 (and (or (not ((_ is Cons!15945) lt!377503)) (bvsle (_1!5094 (h!17075 lt!377503)) (_1!5094 lt!377161))) ((_ is Cons!15945) lt!377503) (bvslt (_1!5094 (h!17075 lt!377503)) (_1!5094 lt!377161))))))

(declare-fun b!833105 () Bool)

(assert (=> b!833105 (= e!464686 (containsKey!400 (t!22308 lt!377503) (_1!5094 lt!377161)))))

(assert (= (and d!107059 (not res!566581)) b!833104))

(assert (= (and b!833104 res!566582) b!833105))

(declare-fun m!777313 () Bool)

(assert (=> b!833105 m!777313))

(assert (=> b!831983 d!107059))

(declare-fun d!107061 () Bool)

(assert (=> d!107061 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(declare-fun lt!377862 () Unit!28447)

(assert (=> d!107061 (= lt!377862 (choose!1436 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(declare-fun e!464687 () Bool)

(assert (=> d!107061 e!464687))

(declare-fun res!566583 () Bool)

(assert (=> d!107061 (=> (not res!566583) (not e!464687))))

(assert (=> d!107061 (= res!566583 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)))))))

(assert (=> d!107061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253) lt!377862)))

(declare-fun b!833106 () Bool)

(assert (=> b!833106 (= e!464687 (containsKey!400 (toList!4505 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252))) lt!377253))))

(assert (= (and d!107061 res!566583) b!833106))

(assert (=> d!107061 m!775301))

(assert (=> d!107061 m!775301))

(assert (=> d!107061 m!775303))

(declare-fun m!777315 () Bool)

(assert (=> d!107061 m!777315))

(declare-fun m!777317 () Bool)

(assert (=> d!107061 m!777317))

(assert (=> b!833106 m!775297))

(assert (=> b!831798 d!107061))

(assert (=> b!831798 d!106545))

(assert (=> b!831798 d!106547))

(declare-fun d!107063 () Bool)

(assert (=> d!107063 (= ($colon$colon!536 e!463966 (ite c!90351 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161))) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15945 (ite c!90351 (h!17075 (toList!4505 (+!2013 lt!377163 lt!377161))) (tuple2!10167 (_1!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5094 (tuple2!10167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!463966))))

(assert (=> bm!36384 d!107063))

(declare-fun d!107065 () Bool)

(assert (=> d!107065 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377863 () Unit!28447)

(assert (=> d!107065 (= lt!377863 (choose!1436 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464688 () Bool)

(assert (=> d!107065 e!464688))

(declare-fun res!566584 () Bool)

(assert (=> d!107065 (=> (not res!566584) (not e!464688))))

(assert (=> d!107065 (= res!566584 (isStrictlySorted!438 (toList!4505 lt!377318)))))

(assert (=> d!107065 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) lt!377863)))

(declare-fun b!833107 () Bool)

(assert (=> b!833107 (= e!464688 (containsKey!400 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107065 res!566584) b!833107))

(assert (=> d!107065 m!775051))

(assert (=> d!107065 m!775543))

(assert (=> d!107065 m!775543))

(assert (=> d!107065 m!775545))

(assert (=> d!107065 m!775051))

(declare-fun m!777319 () Bool)

(assert (=> d!107065 m!777319))

(assert (=> d!107065 m!776069))

(assert (=> b!833107 m!775051))

(assert (=> b!833107 m!775539))

(assert (=> b!831909 d!107065))

(assert (=> b!831909 d!106525))

(assert (=> b!831909 d!106527))

(declare-fun d!107067 () Bool)

(declare-fun lt!377864 () Bool)

(assert (=> d!107067 (= lt!377864 (select (content!386 (t!22308 (toList!4505 lt!377357))) lt!377164))))

(declare-fun e!464690 () Bool)

(assert (=> d!107067 (= lt!377864 e!464690)))

(declare-fun res!566585 () Bool)

(assert (=> d!107067 (=> (not res!566585) (not e!464690))))

(assert (=> d!107067 (= res!566585 ((_ is Cons!15945) (t!22308 (toList!4505 lt!377357))))))

(assert (=> d!107067 (= (contains!4191 (t!22308 (toList!4505 lt!377357)) lt!377164) lt!377864)))

(declare-fun b!833108 () Bool)

(declare-fun e!464689 () Bool)

(assert (=> b!833108 (= e!464690 e!464689)))

(declare-fun res!566586 () Bool)

(assert (=> b!833108 (=> res!566586 e!464689)))

(assert (=> b!833108 (= res!566586 (= (h!17075 (t!22308 (toList!4505 lt!377357))) lt!377164))))

(declare-fun b!833109 () Bool)

(assert (=> b!833109 (= e!464689 (contains!4191 (t!22308 (t!22308 (toList!4505 lt!377357))) lt!377164))))

(assert (= (and d!107067 res!566585) b!833108))

(assert (= (and b!833108 (not res!566586)) b!833109))

(assert (=> d!107067 m!776399))

(declare-fun m!777321 () Bool)

(assert (=> d!107067 m!777321))

(declare-fun m!777323 () Bool)

(assert (=> b!833109 m!777323))

(assert (=> b!832166 d!107067))

(declare-fun d!107069 () Bool)

(declare-fun e!464692 () Bool)

(assert (=> d!107069 e!464692))

(declare-fun res!566587 () Bool)

(assert (=> d!107069 (=> res!566587 e!464692)))

(declare-fun lt!377867 () Bool)

(assert (=> d!107069 (= res!566587 (not lt!377867))))

(declare-fun lt!377865 () Bool)

(assert (=> d!107069 (= lt!377867 lt!377865)))

(declare-fun lt!377868 () Unit!28447)

(declare-fun e!464691 () Unit!28447)

(assert (=> d!107069 (= lt!377868 e!464691)))

(declare-fun c!90712 () Bool)

(assert (=> d!107069 (= c!90712 lt!377865)))

(assert (=> d!107069 (= lt!377865 (containsKey!400 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!107069 (= (contains!4190 lt!377401 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377867)))

(declare-fun b!833110 () Bool)

(declare-fun lt!377866 () Unit!28447)

(assert (=> b!833110 (= e!464691 lt!377866)))

(assert (=> b!833110 (= lt!377866 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!833110 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833111 () Bool)

(declare-fun Unit!28502 () Unit!28447)

(assert (=> b!833111 (= e!464691 Unit!28502)))

(declare-fun b!833112 () Bool)

(assert (=> b!833112 (= e!464692 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107069 c!90712) b!833110))

(assert (= (and d!107069 (not c!90712)) b!833111))

(assert (= (and d!107069 (not res!566587)) b!833112))

(declare-fun m!777325 () Bool)

(assert (=> d!107069 m!777325))

(declare-fun m!777327 () Bool)

(assert (=> b!833110 m!777327))

(assert (=> b!833110 m!775313))

(assert (=> b!833110 m!775313))

(declare-fun m!777329 () Bool)

(assert (=> b!833110 m!777329))

(assert (=> b!833112 m!775313))

(assert (=> b!833112 m!775313))

(assert (=> b!833112 m!777329))

(assert (=> d!106149 d!107069))

(declare-fun b!833115 () Bool)

(declare-fun e!464694 () Option!420)

(assert (=> b!833115 (= e!464694 (getValueByKey!414 (t!22308 lt!377400) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833116 () Bool)

(assert (=> b!833116 (= e!464694 None!418)))

(declare-fun d!107071 () Bool)

(declare-fun c!90713 () Bool)

(assert (=> d!107071 (= c!90713 (and ((_ is Cons!15945) lt!377400) (= (_1!5094 (h!17075 lt!377400)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464693 () Option!420)

(assert (=> d!107071 (= (getValueByKey!414 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464693)))

(declare-fun b!833114 () Bool)

(assert (=> b!833114 (= e!464693 e!464694)))

(declare-fun c!90714 () Bool)

(assert (=> b!833114 (= c!90714 (and ((_ is Cons!15945) lt!377400) (not (= (_1!5094 (h!17075 lt!377400)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833113 () Bool)

(assert (=> b!833113 (= e!464693 (Some!419 (_2!5094 (h!17075 lt!377400))))))

(assert (= (and d!107071 c!90713) b!833113))

(assert (= (and d!107071 (not c!90713)) b!833114))

(assert (= (and b!833114 c!90714) b!833115))

(assert (= (and b!833114 (not c!90714)) b!833116))

(declare-fun m!777331 () Bool)

(assert (=> b!833115 m!777331))

(assert (=> d!106149 d!107071))

(declare-fun d!107073 () Bool)

(assert (=> d!107073 (= (getValueByKey!414 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377869 () Unit!28447)

(assert (=> d!107073 (= lt!377869 (choose!1433 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464695 () Bool)

(assert (=> d!107073 e!464695))

(declare-fun res!566588 () Bool)

(assert (=> d!107073 (=> (not res!566588) (not e!464695))))

(assert (=> d!107073 (= res!566588 (isStrictlySorted!438 lt!377400))))

(assert (=> d!107073 (= (lemmaContainsTupThenGetReturnValue!231 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377869)))

(declare-fun b!833117 () Bool)

(declare-fun res!566589 () Bool)

(assert (=> b!833117 (=> (not res!566589) (not e!464695))))

(assert (=> b!833117 (= res!566589 (containsKey!400 lt!377400 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833118 () Bool)

(assert (=> b!833118 (= e!464695 (contains!4191 lt!377400 (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107073 res!566588) b!833117))

(assert (= (and b!833117 res!566589) b!833118))

(assert (=> d!107073 m!775307))

(declare-fun m!777333 () Bool)

(assert (=> d!107073 m!777333))

(declare-fun m!777335 () Bool)

(assert (=> d!107073 m!777335))

(declare-fun m!777337 () Bool)

(assert (=> b!833117 m!777337))

(declare-fun m!777339 () Bool)

(assert (=> b!833118 m!777339))

(assert (=> d!106149 d!107073))

(declare-fun b!833119 () Bool)

(declare-fun e!464696 () Bool)

(declare-fun lt!377870 () List!15949)

(assert (=> b!833119 (= e!464696 (contains!4191 lt!377870 (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833120 () Bool)

(declare-fun res!566591 () Bool)

(assert (=> b!833120 (=> (not res!566591) (not e!464696))))

(assert (=> b!833120 (= res!566591 (containsKey!400 lt!377870 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833121 () Bool)

(declare-fun e!464698 () List!15949)

(declare-fun call!36469 () List!15949)

(assert (=> b!833121 (= e!464698 call!36469)))

(declare-fun call!36471 () List!15949)

(declare-fun bm!36466 () Bool)

(declare-fun c!90715 () Bool)

(declare-fun e!464700 () List!15949)

(assert (=> bm!36466 (= call!36471 ($colon$colon!536 e!464700 (ite c!90715 (h!17075 (toList!4505 call!36351)) (tuple2!10167 (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90716 () Bool)

(assert (=> bm!36466 (= c!90716 c!90715)))

(declare-fun b!833123 () Bool)

(declare-fun e!464699 () List!15949)

(assert (=> b!833123 (= e!464699 call!36471)))

(declare-fun bm!36467 () Bool)

(declare-fun call!36470 () List!15949)

(assert (=> bm!36467 (= call!36470 call!36471)))

(declare-fun b!833124 () Bool)

(declare-fun e!464697 () List!15949)

(assert (=> b!833124 (= e!464697 call!36470)))

(declare-fun c!90718 () Bool)

(declare-fun b!833125 () Bool)

(declare-fun c!90717 () Bool)

(assert (=> b!833125 (= e!464700 (ite c!90718 (t!22308 (toList!4505 call!36351)) (ite c!90717 (Cons!15945 (h!17075 (toList!4505 call!36351)) (t!22308 (toList!4505 call!36351))) Nil!15946)))))

(declare-fun b!833126 () Bool)

(assert (=> b!833126 (= e!464698 call!36469)))

(declare-fun bm!36468 () Bool)

(assert (=> bm!36468 (= call!36469 call!36470)))

(declare-fun b!833127 () Bool)

(assert (=> b!833127 (= e!464699 e!464697)))

(assert (=> b!833127 (= c!90718 (and ((_ is Cons!15945) (toList!4505 call!36351)) (= (_1!5094 (h!17075 (toList!4505 call!36351))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833128 () Bool)

(assert (=> b!833128 (= e!464700 (insertStrictlySorted!270 (t!22308 (toList!4505 call!36351)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833122 () Bool)

(assert (=> b!833122 (= c!90717 (and ((_ is Cons!15945) (toList!4505 call!36351)) (bvsgt (_1!5094 (h!17075 (toList!4505 call!36351))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!833122 (= e!464697 e!464698)))

(declare-fun d!107075 () Bool)

(assert (=> d!107075 e!464696))

(declare-fun res!566590 () Bool)

(assert (=> d!107075 (=> (not res!566590) (not e!464696))))

(assert (=> d!107075 (= res!566590 (isStrictlySorted!438 lt!377870))))

(assert (=> d!107075 (= lt!377870 e!464699)))

(assert (=> d!107075 (= c!90715 (and ((_ is Cons!15945) (toList!4505 call!36351)) (bvslt (_1!5094 (h!17075 (toList!4505 call!36351))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107075 (isStrictlySorted!438 (toList!4505 call!36351))))

(assert (=> d!107075 (= (insertStrictlySorted!270 (toList!4505 call!36351) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377870)))

(assert (= (and d!107075 c!90715) b!833123))

(assert (= (and d!107075 (not c!90715)) b!833127))

(assert (= (and b!833127 c!90718) b!833124))

(assert (= (and b!833127 (not c!90718)) b!833122))

(assert (= (and b!833122 c!90717) b!833121))

(assert (= (and b!833122 (not c!90717)) b!833126))

(assert (= (or b!833121 b!833126) bm!36468))

(assert (= (or b!833124 bm!36468) bm!36467))

(assert (= (or b!833123 bm!36467) bm!36466))

(assert (= (and bm!36466 c!90716) b!833128))

(assert (= (and bm!36466 (not c!90716)) b!833125))

(assert (= (and d!107075 res!566590) b!833120))

(assert (= (and b!833120 res!566591) b!833119))

(declare-fun m!777341 () Bool)

(assert (=> b!833119 m!777341))

(declare-fun m!777343 () Bool)

(assert (=> d!107075 m!777343))

(declare-fun m!777345 () Bool)

(assert (=> d!107075 m!777345))

(declare-fun m!777347 () Bool)

(assert (=> b!833120 m!777347))

(declare-fun m!777349 () Bool)

(assert (=> bm!36466 m!777349))

(declare-fun m!777351 () Bool)

(assert (=> b!833128 m!777351))

(assert (=> d!106149 d!107075))

(assert (=> d!106371 d!106357))

(declare-fun d!107077 () Bool)

(declare-fun e!464702 () Bool)

(assert (=> d!107077 e!464702))

(declare-fun res!566592 () Bool)

(assert (=> d!107077 (=> res!566592 e!464702)))

(declare-fun lt!377873 () Bool)

(assert (=> d!107077 (= res!566592 (not lt!377873))))

(declare-fun lt!377871 () Bool)

(assert (=> d!107077 (= lt!377873 lt!377871)))

(declare-fun lt!377874 () Unit!28447)

(declare-fun e!464701 () Unit!28447)

(assert (=> d!107077 (= lt!377874 e!464701)))

(declare-fun c!90719 () Bool)

(assert (=> d!107077 (= c!90719 lt!377871)))

(assert (=> d!107077 (= lt!377871 (containsKey!400 (toList!4505 lt!377341) lt!377324))))

(assert (=> d!107077 (= (contains!4190 lt!377341 lt!377324) lt!377873)))

(declare-fun b!833129 () Bool)

(declare-fun lt!377872 () Unit!28447)

(assert (=> b!833129 (= e!464701 lt!377872)))

(assert (=> b!833129 (= lt!377872 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377341) lt!377324))))

(assert (=> b!833129 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377341) lt!377324))))

(declare-fun b!833130 () Bool)

(declare-fun Unit!28503 () Unit!28447)

(assert (=> b!833130 (= e!464701 Unit!28503)))

(declare-fun b!833131 () Bool)

(assert (=> b!833131 (= e!464702 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377341) lt!377324)))))

(assert (= (and d!107077 c!90719) b!833129))

(assert (= (and d!107077 (not c!90719)) b!833130))

(assert (= (and d!107077 (not res!566592)) b!833131))

(declare-fun m!777353 () Bool)

(assert (=> d!107077 m!777353))

(declare-fun m!777355 () Bool)

(assert (=> b!833129 m!777355))

(assert (=> b!833129 m!775993))

(assert (=> b!833129 m!775993))

(declare-fun m!777357 () Bool)

(assert (=> b!833129 m!777357))

(assert (=> b!833131 m!775993))

(assert (=> b!833131 m!775993))

(assert (=> b!833131 m!777357))

(assert (=> d!106371 d!107077))

(assert (=> d!106371 d!106373))

(declare-fun d!107079 () Bool)

(assert (=> d!107079 (= (apply!373 (+!2013 lt!377341 (tuple2!10167 lt!377337 zeroValueAfter!34)) lt!377324) (apply!373 lt!377341 lt!377324))))

(assert (=> d!107079 true))

(declare-fun _$34!1154 () Unit!28447)

(assert (=> d!107079 (= (choose!1435 lt!377341 lt!377337 zeroValueAfter!34 lt!377324) _$34!1154)))

(declare-fun bs!23296 () Bool)

(assert (= bs!23296 d!107079))

(assert (=> bs!23296 m!775171))

(assert (=> bs!23296 m!775171))

(assert (=> bs!23296 m!775173))

(assert (=> bs!23296 m!775167))

(assert (=> d!106371 d!107079))

(assert (=> d!106371 d!106361))

(declare-fun d!107081 () Bool)

(assert (=> d!107081 (= (content!387 Nil!15947) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!106209 d!107081))

(declare-fun d!107083 () Bool)

(declare-fun e!464704 () Bool)

(assert (=> d!107083 e!464704))

(declare-fun res!566593 () Bool)

(assert (=> d!107083 (=> res!566593 e!464704)))

(declare-fun lt!377877 () Bool)

(assert (=> d!107083 (= res!566593 (not lt!377877))))

(declare-fun lt!377875 () Bool)

(assert (=> d!107083 (= lt!377877 lt!377875)))

(declare-fun lt!377878 () Unit!28447)

(declare-fun e!464703 () Unit!28447)

(assert (=> d!107083 (= lt!377878 e!464703)))

(declare-fun c!90720 () Bool)

(assert (=> d!107083 (= c!90720 lt!377875)))

(assert (=> d!107083 (= lt!377875 (containsKey!400 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(assert (=> d!107083 (= (contains!4190 lt!377596 (_1!5094 (tuple2!10167 lt!377325 minValue!754))) lt!377877)))

(declare-fun b!833132 () Bool)

(declare-fun lt!377876 () Unit!28447)

(assert (=> b!833132 (= e!464703 lt!377876)))

(assert (=> b!833132 (= lt!377876 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(assert (=> b!833132 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!833133 () Bool)

(declare-fun Unit!28504 () Unit!28447)

(assert (=> b!833133 (= e!464703 Unit!28504)))

(declare-fun b!833134 () Bool)

(assert (=> b!833134 (= e!464704 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377596) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(assert (= (and d!107083 c!90720) b!833132))

(assert (= (and d!107083 (not c!90720)) b!833133))

(assert (= (and d!107083 (not res!566593)) b!833134))

(declare-fun m!777359 () Bool)

(assert (=> d!107083 m!777359))

(declare-fun m!777361 () Bool)

(assert (=> b!833132 m!777361))

(assert (=> b!833132 m!775969))

(assert (=> b!833132 m!775969))

(declare-fun m!777363 () Bool)

(assert (=> b!833132 m!777363))

(assert (=> b!833134 m!775969))

(assert (=> b!833134 m!775969))

(assert (=> b!833134 m!777363))

(assert (=> d!106349 d!107083))

(declare-fun b!833137 () Bool)

(declare-fun e!464706 () Option!420)

(assert (=> b!833137 (= e!464706 (getValueByKey!414 (t!22308 lt!377595) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!833138 () Bool)

(assert (=> b!833138 (= e!464706 None!418)))

(declare-fun d!107085 () Bool)

(declare-fun c!90721 () Bool)

(assert (=> d!107085 (= c!90721 (and ((_ is Cons!15945) lt!377595) (= (_1!5094 (h!17075 lt!377595)) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(declare-fun e!464705 () Option!420)

(assert (=> d!107085 (= (getValueByKey!414 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754))) e!464705)))

(declare-fun b!833136 () Bool)

(assert (=> b!833136 (= e!464705 e!464706)))

(declare-fun c!90722 () Bool)

(assert (=> b!833136 (= c!90722 (and ((_ is Cons!15945) lt!377595) (not (= (_1!5094 (h!17075 lt!377595)) (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))))

(declare-fun b!833135 () Bool)

(assert (=> b!833135 (= e!464705 (Some!419 (_2!5094 (h!17075 lt!377595))))))

(assert (= (and d!107085 c!90721) b!833135))

(assert (= (and d!107085 (not c!90721)) b!833136))

(assert (= (and b!833136 c!90722) b!833137))

(assert (= (and b!833136 (not c!90722)) b!833138))

(declare-fun m!777365 () Bool)

(assert (=> b!833137 m!777365))

(assert (=> d!106349 d!107085))

(declare-fun d!107087 () Bool)

(assert (=> d!107087 (= (getValueByKey!414 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754))) (Some!419 (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun lt!377879 () Unit!28447)

(assert (=> d!107087 (= lt!377879 (choose!1433 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun e!464707 () Bool)

(assert (=> d!107087 e!464707))

(declare-fun res!566594 () Bool)

(assert (=> d!107087 (=> (not res!566594) (not e!464707))))

(assert (=> d!107087 (= res!566594 (isStrictlySorted!438 lt!377595))))

(assert (=> d!107087 (= (lemmaContainsTupThenGetReturnValue!231 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))) lt!377879)))

(declare-fun b!833139 () Bool)

(declare-fun res!566595 () Bool)

(assert (=> b!833139 (=> (not res!566595) (not e!464707))))

(assert (=> b!833139 (= res!566595 (containsKey!400 lt!377595 (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!833140 () Bool)

(assert (=> b!833140 (= e!464707 (contains!4191 lt!377595 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(assert (= (and d!107087 res!566594) b!833139))

(assert (= (and b!833139 res!566595) b!833140))

(assert (=> d!107087 m!775963))

(declare-fun m!777367 () Bool)

(assert (=> d!107087 m!777367))

(declare-fun m!777369 () Bool)

(assert (=> d!107087 m!777369))

(declare-fun m!777371 () Bool)

(assert (=> b!833139 m!777371))

(declare-fun m!777373 () Bool)

(assert (=> b!833140 m!777373))

(assert (=> d!106349 d!107087))

(declare-fun e!464708 () Bool)

(declare-fun lt!377880 () List!15949)

(declare-fun b!833141 () Bool)

(assert (=> b!833141 (= e!464708 (contains!4191 lt!377880 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(declare-fun b!833142 () Bool)

(declare-fun res!566597 () Bool)

(assert (=> b!833142 (=> (not res!566597) (not e!464708))))

(assert (=> b!833142 (= res!566597 (containsKey!400 lt!377880 (_1!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!833143 () Bool)

(declare-fun e!464710 () List!15949)

(declare-fun call!36472 () List!15949)

(assert (=> b!833143 (= e!464710 call!36472)))

(declare-fun call!36474 () List!15949)

(declare-fun c!90723 () Bool)

(declare-fun bm!36469 () Bool)

(declare-fun e!464712 () List!15949)

(assert (=> bm!36469 (= call!36474 ($colon$colon!536 e!464712 (ite c!90723 (h!17075 (toList!4505 lt!377333)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))))

(declare-fun c!90724 () Bool)

(assert (=> bm!36469 (= c!90724 c!90723)))

(declare-fun b!833145 () Bool)

(declare-fun e!464711 () List!15949)

(assert (=> b!833145 (= e!464711 call!36474)))

(declare-fun bm!36470 () Bool)

(declare-fun call!36473 () List!15949)

(assert (=> bm!36470 (= call!36473 call!36474)))

(declare-fun b!833146 () Bool)

(declare-fun e!464709 () List!15949)

(assert (=> b!833146 (= e!464709 call!36473)))

(declare-fun c!90725 () Bool)

(declare-fun b!833147 () Bool)

(declare-fun c!90726 () Bool)

(assert (=> b!833147 (= e!464712 (ite c!90726 (t!22308 (toList!4505 lt!377333)) (ite c!90725 (Cons!15945 (h!17075 (toList!4505 lt!377333)) (t!22308 (toList!4505 lt!377333))) Nil!15946)))))

(declare-fun b!833148 () Bool)

(assert (=> b!833148 (= e!464710 call!36472)))

(declare-fun bm!36471 () Bool)

(assert (=> bm!36471 (= call!36472 call!36473)))

(declare-fun b!833149 () Bool)

(assert (=> b!833149 (= e!464711 e!464709)))

(assert (=> b!833149 (= c!90726 (and ((_ is Cons!15945) (toList!4505 lt!377333)) (= (_1!5094 (h!17075 (toList!4505 lt!377333))) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(declare-fun b!833150 () Bool)

(assert (=> b!833150 (= e!464712 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377333)) (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))))))

(declare-fun b!833144 () Bool)

(assert (=> b!833144 (= c!90725 (and ((_ is Cons!15945) (toList!4505 lt!377333)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377333))) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(assert (=> b!833144 (= e!464709 e!464710)))

(declare-fun d!107089 () Bool)

(assert (=> d!107089 e!464708))

(declare-fun res!566596 () Bool)

(assert (=> d!107089 (=> (not res!566596) (not e!464708))))

(assert (=> d!107089 (= res!566596 (isStrictlySorted!438 lt!377880))))

(assert (=> d!107089 (= lt!377880 e!464711)))

(assert (=> d!107089 (= c!90723 (and ((_ is Cons!15945) (toList!4505 lt!377333)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377333))) (_1!5094 (tuple2!10167 lt!377325 minValue!754)))))))

(assert (=> d!107089 (isStrictlySorted!438 (toList!4505 lt!377333))))

(assert (=> d!107089 (= (insertStrictlySorted!270 (toList!4505 lt!377333) (_1!5094 (tuple2!10167 lt!377325 minValue!754)) (_2!5094 (tuple2!10167 lt!377325 minValue!754))) lt!377880)))

(assert (= (and d!107089 c!90723) b!833145))

(assert (= (and d!107089 (not c!90723)) b!833149))

(assert (= (and b!833149 c!90726) b!833146))

(assert (= (and b!833149 (not c!90726)) b!833144))

(assert (= (and b!833144 c!90725) b!833143))

(assert (= (and b!833144 (not c!90725)) b!833148))

(assert (= (or b!833143 b!833148) bm!36471))

(assert (= (or b!833146 bm!36471) bm!36470))

(assert (= (or b!833145 bm!36470) bm!36469))

(assert (= (and bm!36469 c!90724) b!833150))

(assert (= (and bm!36469 (not c!90724)) b!833147))

(assert (= (and d!107089 res!566596) b!833142))

(assert (= (and b!833142 res!566597) b!833141))

(declare-fun m!777375 () Bool)

(assert (=> b!833141 m!777375))

(declare-fun m!777377 () Bool)

(assert (=> d!107089 m!777377))

(declare-fun m!777379 () Bool)

(assert (=> d!107089 m!777379))

(declare-fun m!777381 () Bool)

(assert (=> b!833142 m!777381))

(declare-fun m!777383 () Bool)

(assert (=> bm!36469 m!777383))

(declare-fun m!777385 () Bool)

(assert (=> b!833150 m!777385))

(assert (=> d!106349 d!107089))

(declare-fun d!107091 () Bool)

(assert (=> d!107091 (= (get!11832 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!414 (toList!4505 lt!377318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106379 d!107091))

(assert (=> d!106379 d!106387))

(declare-fun b!833153 () Bool)

(declare-fun e!464714 () Option!420)

(assert (=> b!833153 (= e!464714 (getValueByKey!414 (t!22308 (toList!4505 lt!377401)) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833154 () Bool)

(assert (=> b!833154 (= e!464714 None!418)))

(declare-fun d!107093 () Bool)

(declare-fun c!90727 () Bool)

(assert (=> d!107093 (= c!90727 (and ((_ is Cons!15945) (toList!4505 lt!377401)) (= (_1!5094 (h!17075 (toList!4505 lt!377401))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464713 () Option!420)

(assert (=> d!107093 (= (getValueByKey!414 (toList!4505 lt!377401) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464713)))

(declare-fun b!833152 () Bool)

(assert (=> b!833152 (= e!464713 e!464714)))

(declare-fun c!90728 () Bool)

(assert (=> b!833152 (= c!90728 (and ((_ is Cons!15945) (toList!4505 lt!377401)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377401))) (_1!5094 (tuple2!10167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833151 () Bool)

(assert (=> b!833151 (= e!464713 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377401)))))))

(assert (= (and d!107093 c!90727) b!833151))

(assert (= (and d!107093 (not c!90727)) b!833152))

(assert (= (and b!833152 c!90728) b!833153))

(assert (= (and b!833152 (not c!90728)) b!833154))

(declare-fun m!777387 () Bool)

(assert (=> b!833153 m!777387))

(assert (=> b!831801 d!107093))

(assert (=> d!106143 d!106145))

(assert (=> d!106143 d!106139))

(declare-fun d!107095 () Bool)

(assert (=> d!107095 (not (contains!4190 (+!2013 lt!377251 (tuple2!10167 lt!377247 lt!377252)) lt!377253))))

(assert (=> d!107095 true))

(declare-fun _$36!348 () Unit!28447)

(assert (=> d!107095 (= (choose!1432 lt!377251 lt!377247 lt!377252 lt!377253) _$36!348)))

(declare-fun bs!23297 () Bool)

(assert (= bs!23297 d!107095))

(assert (=> bs!23297 m!775067))

(assert (=> bs!23297 m!775067))

(assert (=> bs!23297 m!775069))

(assert (=> d!106143 d!107095))

(declare-fun d!107097 () Bool)

(declare-fun e!464716 () Bool)

(assert (=> d!107097 e!464716))

(declare-fun res!566598 () Bool)

(assert (=> d!107097 (=> res!566598 e!464716)))

(declare-fun lt!377883 () Bool)

(assert (=> d!107097 (= res!566598 (not lt!377883))))

(declare-fun lt!377881 () Bool)

(assert (=> d!107097 (= lt!377883 lt!377881)))

(declare-fun lt!377884 () Unit!28447)

(declare-fun e!464715 () Unit!28447)

(assert (=> d!107097 (= lt!377884 e!464715)))

(declare-fun c!90729 () Bool)

(assert (=> d!107097 (= c!90729 lt!377881)))

(assert (=> d!107097 (= lt!377881 (containsKey!400 (toList!4505 lt!377251) lt!377253))))

(assert (=> d!107097 (= (contains!4190 lt!377251 lt!377253) lt!377883)))

(declare-fun b!833155 () Bool)

(declare-fun lt!377882 () Unit!28447)

(assert (=> b!833155 (= e!464715 lt!377882)))

(assert (=> b!833155 (= lt!377882 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377251) lt!377253))))

(assert (=> b!833155 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377251) lt!377253))))

(declare-fun b!833156 () Bool)

(declare-fun Unit!28505 () Unit!28447)

(assert (=> b!833156 (= e!464715 Unit!28505)))

(declare-fun b!833157 () Bool)

(assert (=> b!833157 (= e!464716 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377251) lt!377253)))))

(assert (= (and d!107097 c!90729) b!833155))

(assert (= (and d!107097 (not c!90729)) b!833156))

(assert (= (and d!107097 (not res!566598)) b!833157))

(declare-fun m!777389 () Bool)

(assert (=> d!107097 m!777389))

(declare-fun m!777391 () Bool)

(assert (=> b!833155 m!777391))

(declare-fun m!777393 () Bool)

(assert (=> b!833155 m!777393))

(assert (=> b!833155 m!777393))

(declare-fun m!777395 () Bool)

(assert (=> b!833155 m!777395))

(assert (=> b!833157 m!777393))

(assert (=> b!833157 m!777393))

(assert (=> b!833157 m!777395))

(assert (=> d!106143 d!107097))

(declare-fun b!833158 () Bool)

(declare-fun e!464717 () Bool)

(declare-fun lt!377885 () List!15949)

(assert (=> b!833158 (= e!464717 (contains!4191 lt!377885 (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161))))))

(declare-fun b!833159 () Bool)

(declare-fun res!566600 () Bool)

(assert (=> b!833159 (=> (not res!566600) (not e!464717))))

(assert (=> b!833159 (= res!566600 (containsKey!400 lt!377885 (_1!5094 lt!377161)))))

(declare-fun b!833160 () Bool)

(declare-fun e!464719 () List!15949)

(declare-fun call!36475 () List!15949)

(assert (=> b!833160 (= e!464719 call!36475)))

(declare-fun c!90730 () Bool)

(declare-fun call!36477 () List!15949)

(declare-fun e!464721 () List!15949)

(declare-fun bm!36472 () Bool)

(assert (=> bm!36472 (= call!36477 ($colon$colon!536 e!464721 (ite c!90730 (h!17075 (t!22308 (toList!4505 lt!377158))) (tuple2!10167 (_1!5094 lt!377161) (_2!5094 lt!377161)))))))

(declare-fun c!90731 () Bool)

(assert (=> bm!36472 (= c!90731 c!90730)))

(declare-fun b!833162 () Bool)

(declare-fun e!464720 () List!15949)

(assert (=> b!833162 (= e!464720 call!36477)))

(declare-fun bm!36473 () Bool)

(declare-fun call!36476 () List!15949)

(assert (=> bm!36473 (= call!36476 call!36477)))

(declare-fun b!833163 () Bool)

(declare-fun e!464718 () List!15949)

(assert (=> b!833163 (= e!464718 call!36476)))

(declare-fun b!833164 () Bool)

(declare-fun c!90732 () Bool)

(declare-fun c!90733 () Bool)

(assert (=> b!833164 (= e!464721 (ite c!90733 (t!22308 (t!22308 (toList!4505 lt!377158))) (ite c!90732 (Cons!15945 (h!17075 (t!22308 (toList!4505 lt!377158))) (t!22308 (t!22308 (toList!4505 lt!377158)))) Nil!15946)))))

(declare-fun b!833165 () Bool)

(assert (=> b!833165 (= e!464719 call!36475)))

(declare-fun bm!36474 () Bool)

(assert (=> bm!36474 (= call!36475 call!36476)))

(declare-fun b!833166 () Bool)

(assert (=> b!833166 (= e!464720 e!464718)))

(assert (=> b!833166 (= c!90733 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (= (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377161))))))

(declare-fun b!833167 () Bool)

(assert (=> b!833167 (= e!464721 (insertStrictlySorted!270 (t!22308 (t!22308 (toList!4505 lt!377158))) (_1!5094 lt!377161) (_2!5094 lt!377161)))))

(declare-fun b!833161 () Bool)

(assert (=> b!833161 (= c!90732 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (bvsgt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377161))))))

(assert (=> b!833161 (= e!464718 e!464719)))

(declare-fun d!107099 () Bool)

(assert (=> d!107099 e!464717))

(declare-fun res!566599 () Bool)

(assert (=> d!107099 (=> (not res!566599) (not e!464717))))

(assert (=> d!107099 (= res!566599 (isStrictlySorted!438 lt!377885))))

(assert (=> d!107099 (= lt!377885 e!464720)))

(assert (=> d!107099 (= c!90730 (and ((_ is Cons!15945) (t!22308 (toList!4505 lt!377158))) (bvslt (_1!5094 (h!17075 (t!22308 (toList!4505 lt!377158)))) (_1!5094 lt!377161))))))

(assert (=> d!107099 (isStrictlySorted!438 (t!22308 (toList!4505 lt!377158)))))

(assert (=> d!107099 (= (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377158)) (_1!5094 lt!377161) (_2!5094 lt!377161)) lt!377885)))

(assert (= (and d!107099 c!90730) b!833162))

(assert (= (and d!107099 (not c!90730)) b!833166))

(assert (= (and b!833166 c!90733) b!833163))

(assert (= (and b!833166 (not c!90733)) b!833161))

(assert (= (and b!833161 c!90732) b!833160))

(assert (= (and b!833161 (not c!90732)) b!833165))

(assert (= (or b!833160 b!833165) bm!36474))

(assert (= (or b!833163 bm!36474) bm!36473))

(assert (= (or b!833162 bm!36473) bm!36472))

(assert (= (and bm!36472 c!90731) b!833167))

(assert (= (and bm!36472 (not c!90731)) b!833164))

(assert (= (and d!107099 res!566599) b!833159))

(assert (= (and b!833159 res!566600) b!833158))

(declare-fun m!777397 () Bool)

(assert (=> b!833158 m!777397))

(declare-fun m!777399 () Bool)

(assert (=> d!107099 m!777399))

(assert (=> d!107099 m!776125))

(declare-fun m!777401 () Bool)

(assert (=> b!833159 m!777401))

(declare-fun m!777403 () Bool)

(assert (=> bm!36472 m!777403))

(declare-fun m!777405 () Bool)

(assert (=> b!833167 m!777405))

(assert (=> b!831949 d!107099))

(declare-fun d!107101 () Bool)

(assert (not d!107101))

(assert (=> b!831908 d!107101))

(declare-fun d!107103 () Bool)

(assert (=> d!107103 (= (get!11832 (getValueByKey!414 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))) lt!377345)) (v!10095 (getValueByKey!414 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))) lt!377345)))))

(assert (=> d!106367 d!107103))

(declare-fun e!464723 () Option!420)

(declare-fun b!833170 () Bool)

(assert (=> b!833170 (= e!464723 (getValueByKey!414 (t!22308 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)))) lt!377345))))

(declare-fun b!833171 () Bool)

(assert (=> b!833171 (= e!464723 None!418)))

(declare-fun c!90734 () Bool)

(declare-fun d!107105 () Bool)

(assert (=> d!107105 (= c!90734 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)))) (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))))) lt!377345)))))

(declare-fun e!464722 () Option!420)

(assert (=> d!107105 (= (getValueByKey!414 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))) lt!377345) e!464722)))

(declare-fun b!833169 () Bool)

(assert (=> b!833169 (= e!464722 e!464723)))

(declare-fun c!90735 () Bool)

(assert (=> b!833169 (= c!90735 (and ((_ is Cons!15945) (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)))) (not (= (_1!5094 (h!17075 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754))))) lt!377345))))))

(declare-fun b!833168 () Bool)

(assert (=> b!833168 (= e!464722 (Some!419 (_2!5094 (h!17075 (toList!4505 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)))))))))

(assert (= (and d!107105 c!90734) b!833168))

(assert (= (and d!107105 (not c!90734)) b!833169))

(assert (= (and b!833169 c!90735) b!833170))

(assert (= (and b!833169 (not c!90735)) b!833171))

(declare-fun m!777407 () Bool)

(assert (=> b!833170 m!777407))

(assert (=> d!106367 d!107105))

(declare-fun d!107107 () Bool)

(declare-fun e!464725 () Bool)

(assert (=> d!107107 e!464725))

(declare-fun res!566601 () Bool)

(assert (=> d!107107 (=> res!566601 e!464725)))

(declare-fun lt!377888 () Bool)

(assert (=> d!107107 (= res!566601 (not lt!377888))))

(declare-fun lt!377886 () Bool)

(assert (=> d!107107 (= lt!377888 lt!377886)))

(declare-fun lt!377889 () Unit!28447)

(declare-fun e!464724 () Unit!28447)

(assert (=> d!107107 (= lt!377889 e!464724)))

(declare-fun c!90736 () Bool)

(assert (=> d!107107 (= c!90736 lt!377886)))

(assert (=> d!107107 (= lt!377886 (containsKey!400 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(assert (=> d!107107 (= (contains!4190 lt!377426 (_1!5094 (tuple2!10167 lt!377240 lt!377245))) lt!377888)))

(declare-fun b!833172 () Bool)

(declare-fun lt!377887 () Unit!28447)

(assert (=> b!833172 (= e!464724 lt!377887)))

(assert (=> b!833172 (= lt!377887 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(assert (=> b!833172 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833173 () Bool)

(declare-fun Unit!28506 () Unit!28447)

(assert (=> b!833173 (= e!464724 Unit!28506)))

(declare-fun b!833174 () Bool)

(assert (=> b!833174 (= e!464725 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(assert (= (and d!107107 c!90736) b!833172))

(assert (= (and d!107107 (not c!90736)) b!833173))

(assert (= (and d!107107 (not res!566601)) b!833174))

(declare-fun m!777409 () Bool)

(assert (=> d!107107 m!777409))

(declare-fun m!777411 () Bool)

(assert (=> b!833172 m!777411))

(assert (=> b!833172 m!775375))

(assert (=> b!833172 m!775375))

(declare-fun m!777413 () Bool)

(assert (=> b!833172 m!777413))

(assert (=> b!833174 m!775375))

(assert (=> b!833174 m!775375))

(assert (=> b!833174 m!777413))

(assert (=> d!106165 d!107107))

(declare-fun e!464727 () Option!420)

(declare-fun b!833177 () Bool)

(assert (=> b!833177 (= e!464727 (getValueByKey!414 (t!22308 lt!377425) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833178 () Bool)

(assert (=> b!833178 (= e!464727 None!418)))

(declare-fun c!90737 () Bool)

(declare-fun d!107109 () Bool)

(assert (=> d!107109 (= c!90737 (and ((_ is Cons!15945) lt!377425) (= (_1!5094 (h!17075 lt!377425)) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(declare-fun e!464726 () Option!420)

(assert (=> d!107109 (= (getValueByKey!414 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245))) e!464726)))

(declare-fun b!833176 () Bool)

(assert (=> b!833176 (= e!464726 e!464727)))

(declare-fun c!90738 () Bool)

(assert (=> b!833176 (= c!90738 (and ((_ is Cons!15945) lt!377425) (not (= (_1!5094 (h!17075 lt!377425)) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))))

(declare-fun b!833175 () Bool)

(assert (=> b!833175 (= e!464726 (Some!419 (_2!5094 (h!17075 lt!377425))))))

(assert (= (and d!107109 c!90737) b!833175))

(assert (= (and d!107109 (not c!90737)) b!833176))

(assert (= (and b!833176 c!90738) b!833177))

(assert (= (and b!833176 (not c!90738)) b!833178))

(declare-fun m!777415 () Bool)

(assert (=> b!833177 m!777415))

(assert (=> d!106165 d!107109))

(declare-fun d!107111 () Bool)

(assert (=> d!107111 (= (getValueByKey!414 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245))) (Some!419 (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun lt!377890 () Unit!28447)

(assert (=> d!107111 (= lt!377890 (choose!1433 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun e!464728 () Bool)

(assert (=> d!107111 e!464728))

(declare-fun res!566602 () Bool)

(assert (=> d!107111 (=> (not res!566602) (not e!464728))))

(assert (=> d!107111 (= res!566602 (isStrictlySorted!438 lt!377425))))

(assert (=> d!107111 (= (lemmaContainsTupThenGetReturnValue!231 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))) lt!377890)))

(declare-fun b!833179 () Bool)

(declare-fun res!566603 () Bool)

(assert (=> b!833179 (=> (not res!566603) (not e!464728))))

(assert (=> b!833179 (= res!566603 (containsKey!400 lt!377425 (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833180 () Bool)

(assert (=> b!833180 (= e!464728 (contains!4191 lt!377425 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(assert (= (and d!107111 res!566602) b!833179))

(assert (= (and b!833179 res!566603) b!833180))

(assert (=> d!107111 m!775369))

(declare-fun m!777417 () Bool)

(assert (=> d!107111 m!777417))

(declare-fun m!777419 () Bool)

(assert (=> d!107111 m!777419))

(declare-fun m!777421 () Bool)

(assert (=> b!833179 m!777421))

(declare-fun m!777423 () Bool)

(assert (=> b!833180 m!777423))

(assert (=> d!106165 d!107111))

(declare-fun e!464729 () Bool)

(declare-fun b!833181 () Bool)

(declare-fun lt!377891 () List!15949)

(assert (=> b!833181 (= e!464729 (contains!4191 lt!377891 (tuple2!10167 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(declare-fun b!833182 () Bool)

(declare-fun res!566605 () Bool)

(assert (=> b!833182 (=> (not res!566605) (not e!464729))))

(assert (=> b!833182 (= res!566605 (containsKey!400 lt!377891 (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833183 () Bool)

(declare-fun e!464731 () List!15949)

(declare-fun call!36478 () List!15949)

(assert (=> b!833183 (= e!464731 call!36478)))

(declare-fun bm!36475 () Bool)

(declare-fun e!464733 () List!15949)

(declare-fun call!36480 () List!15949)

(declare-fun c!90739 () Bool)

(assert (=> bm!36475 (= call!36480 ($colon$colon!536 e!464733 (ite c!90739 (h!17075 (toList!4505 lt!377244)) (tuple2!10167 (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))))

(declare-fun c!90740 () Bool)

(assert (=> bm!36475 (= c!90740 c!90739)))

(declare-fun b!833185 () Bool)

(declare-fun e!464732 () List!15949)

(assert (=> b!833185 (= e!464732 call!36480)))

(declare-fun bm!36476 () Bool)

(declare-fun call!36479 () List!15949)

(assert (=> bm!36476 (= call!36479 call!36480)))

(declare-fun b!833186 () Bool)

(declare-fun e!464730 () List!15949)

(assert (=> b!833186 (= e!464730 call!36479)))

(declare-fun c!90741 () Bool)

(declare-fun c!90742 () Bool)

(declare-fun b!833187 () Bool)

(assert (=> b!833187 (= e!464733 (ite c!90742 (t!22308 (toList!4505 lt!377244)) (ite c!90741 (Cons!15945 (h!17075 (toList!4505 lt!377244)) (t!22308 (toList!4505 lt!377244))) Nil!15946)))))

(declare-fun b!833188 () Bool)

(assert (=> b!833188 (= e!464731 call!36478)))

(declare-fun bm!36477 () Bool)

(assert (=> bm!36477 (= call!36478 call!36479)))

(declare-fun b!833189 () Bool)

(assert (=> b!833189 (= e!464732 e!464730)))

(assert (=> b!833189 (= c!90742 (and ((_ is Cons!15945) (toList!4505 lt!377244)) (= (_1!5094 (h!17075 (toList!4505 lt!377244))) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(declare-fun b!833190 () Bool)

(assert (=> b!833190 (= e!464733 (insertStrictlySorted!270 (t!22308 (toList!4505 lt!377244)) (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833184 () Bool)

(assert (=> b!833184 (= c!90741 (and ((_ is Cons!15945) (toList!4505 lt!377244)) (bvsgt (_1!5094 (h!17075 (toList!4505 lt!377244))) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(assert (=> b!833184 (= e!464730 e!464731)))

(declare-fun d!107113 () Bool)

(assert (=> d!107113 e!464729))

(declare-fun res!566604 () Bool)

(assert (=> d!107113 (=> (not res!566604) (not e!464729))))

(assert (=> d!107113 (= res!566604 (isStrictlySorted!438 lt!377891))))

(assert (=> d!107113 (= lt!377891 e!464732)))

(assert (=> d!107113 (= c!90739 (and ((_ is Cons!15945) (toList!4505 lt!377244)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377244))) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(assert (=> d!107113 (isStrictlySorted!438 (toList!4505 lt!377244))))

(assert (=> d!107113 (= (insertStrictlySorted!270 (toList!4505 lt!377244) (_1!5094 (tuple2!10167 lt!377240 lt!377245)) (_2!5094 (tuple2!10167 lt!377240 lt!377245))) lt!377891)))

(assert (= (and d!107113 c!90739) b!833185))

(assert (= (and d!107113 (not c!90739)) b!833189))

(assert (= (and b!833189 c!90742) b!833186))

(assert (= (and b!833189 (not c!90742)) b!833184))

(assert (= (and b!833184 c!90741) b!833183))

(assert (= (and b!833184 (not c!90741)) b!833188))

(assert (= (or b!833183 b!833188) bm!36477))

(assert (= (or b!833186 bm!36477) bm!36476))

(assert (= (or b!833185 bm!36476) bm!36475))

(assert (= (and bm!36475 c!90740) b!833190))

(assert (= (and bm!36475 (not c!90740)) b!833187))

(assert (= (and d!107113 res!566604) b!833182))

(assert (= (and b!833182 res!566605) b!833181))

(declare-fun m!777425 () Bool)

(assert (=> b!833181 m!777425))

(declare-fun m!777427 () Bool)

(assert (=> d!107113 m!777427))

(declare-fun m!777429 () Bool)

(assert (=> d!107113 m!777429))

(declare-fun m!777431 () Bool)

(assert (=> b!833182 m!777431))

(declare-fun m!777433 () Bool)

(assert (=> bm!36475 m!777433))

(declare-fun m!777435 () Bool)

(assert (=> b!833190 m!777435))

(assert (=> d!106165 d!107113))

(declare-fun d!107115 () Bool)

(declare-fun res!566606 () Bool)

(declare-fun e!464734 () Bool)

(assert (=> d!107115 (=> res!566606 e!464734)))

(assert (=> d!107115 (= res!566606 (or ((_ is Nil!15946) lt!377503) ((_ is Nil!15946) (t!22308 lt!377503))))))

(assert (=> d!107115 (= (isStrictlySorted!438 lt!377503) e!464734)))

(declare-fun b!833191 () Bool)

(declare-fun e!464735 () Bool)

(assert (=> b!833191 (= e!464734 e!464735)))

(declare-fun res!566607 () Bool)

(assert (=> b!833191 (=> (not res!566607) (not e!464735))))

(assert (=> b!833191 (= res!566607 (bvslt (_1!5094 (h!17075 lt!377503)) (_1!5094 (h!17075 (t!22308 lt!377503)))))))

(declare-fun b!833192 () Bool)

(assert (=> b!833192 (= e!464735 (isStrictlySorted!438 (t!22308 lt!377503)))))

(assert (= (and d!107115 (not res!566606)) b!833191))

(assert (= (and b!833191 res!566607) b!833192))

(declare-fun m!777437 () Bool)

(assert (=> b!833192 m!777437))

(assert (=> d!106249 d!107115))

(assert (=> d!106249 d!106857))

(declare-fun d!107117 () Bool)

(declare-fun e!464737 () Bool)

(assert (=> d!107117 e!464737))

(declare-fun res!566608 () Bool)

(assert (=> d!107117 (=> res!566608 e!464737)))

(declare-fun lt!377894 () Bool)

(assert (=> d!107117 (= res!566608 (not lt!377894))))

(declare-fun lt!377892 () Bool)

(assert (=> d!107117 (= lt!377894 lt!377892)))

(declare-fun lt!377895 () Unit!28447)

(declare-fun e!464736 () Unit!28447)

(assert (=> d!107117 (= lt!377895 e!464736)))

(declare-fun c!90743 () Bool)

(assert (=> d!107117 (= c!90743 lt!377892)))

(assert (=> d!107117 (= lt!377892 (containsKey!400 (toList!4505 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549))) lt!377550))))

(assert (=> d!107117 (= (contains!4190 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549)) lt!377550) lt!377894)))

(declare-fun b!833193 () Bool)

(declare-fun lt!377893 () Unit!28447)

(assert (=> b!833193 (= e!464736 lt!377893)))

(assert (=> b!833193 (= lt!377893 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549))) lt!377550))))

(assert (=> b!833193 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549))) lt!377550))))

(declare-fun b!833194 () Bool)

(declare-fun Unit!28507 () Unit!28447)

(assert (=> b!833194 (= e!464736 Unit!28507)))

(declare-fun b!833195 () Bool)

(assert (=> b!833195 (= e!464737 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549))) lt!377550)))))

(assert (= (and d!107117 c!90743) b!833193))

(assert (= (and d!107117 (not c!90743)) b!833194))

(assert (= (and d!107117 (not res!566608)) b!833195))

(declare-fun m!777439 () Bool)

(assert (=> d!107117 m!777439))

(declare-fun m!777441 () Bool)

(assert (=> b!833193 m!777441))

(declare-fun m!777443 () Bool)

(assert (=> b!833193 m!777443))

(assert (=> b!833193 m!777443))

(declare-fun m!777445 () Bool)

(assert (=> b!833193 m!777445))

(assert (=> b!833195 m!777443))

(assert (=> b!833195 m!777443))

(assert (=> b!833195 m!777445))

(assert (=> b!832095 d!107117))

(declare-fun d!107119 () Bool)

(declare-fun e!464738 () Bool)

(assert (=> d!107119 e!464738))

(declare-fun res!566609 () Bool)

(assert (=> d!107119 (=> (not res!566609) (not e!464738))))

(declare-fun lt!377899 () ListLongMap!8979)

(assert (=> d!107119 (= res!566609 (contains!4190 lt!377899 (_1!5094 (tuple2!10167 lt!377544 lt!377549))))))

(declare-fun lt!377898 () List!15949)

(assert (=> d!107119 (= lt!377899 (ListLongMap!8980 lt!377898))))

(declare-fun lt!377897 () Unit!28447)

(declare-fun lt!377896 () Unit!28447)

(assert (=> d!107119 (= lt!377897 lt!377896)))

(assert (=> d!107119 (= (getValueByKey!414 lt!377898 (_1!5094 (tuple2!10167 lt!377544 lt!377549))) (Some!419 (_2!5094 (tuple2!10167 lt!377544 lt!377549))))))

(assert (=> d!107119 (= lt!377896 (lemmaContainsTupThenGetReturnValue!231 lt!377898 (_1!5094 (tuple2!10167 lt!377544 lt!377549)) (_2!5094 (tuple2!10167 lt!377544 lt!377549))))))

(assert (=> d!107119 (= lt!377898 (insertStrictlySorted!270 (toList!4505 lt!377548) (_1!5094 (tuple2!10167 lt!377544 lt!377549)) (_2!5094 (tuple2!10167 lt!377544 lt!377549))))))

(assert (=> d!107119 (= (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549)) lt!377899)))

(declare-fun b!833196 () Bool)

(declare-fun res!566610 () Bool)

(assert (=> b!833196 (=> (not res!566610) (not e!464738))))

(assert (=> b!833196 (= res!566610 (= (getValueByKey!414 (toList!4505 lt!377899) (_1!5094 (tuple2!10167 lt!377544 lt!377549))) (Some!419 (_2!5094 (tuple2!10167 lt!377544 lt!377549)))))))

(declare-fun b!833197 () Bool)

(assert (=> b!833197 (= e!464738 (contains!4191 (toList!4505 lt!377899) (tuple2!10167 lt!377544 lt!377549)))))

(assert (= (and d!107119 res!566609) b!833196))

(assert (= (and b!833196 res!566610) b!833197))

(declare-fun m!777447 () Bool)

(assert (=> d!107119 m!777447))

(declare-fun m!777449 () Bool)

(assert (=> d!107119 m!777449))

(declare-fun m!777451 () Bool)

(assert (=> d!107119 m!777451))

(declare-fun m!777453 () Bool)

(assert (=> d!107119 m!777453))

(declare-fun m!777455 () Bool)

(assert (=> b!833196 m!777455))

(declare-fun m!777457 () Bool)

(assert (=> b!833197 m!777457))

(assert (=> b!832095 d!107119))

(declare-fun d!107121 () Bool)

(assert (=> d!107121 (not (contains!4190 (+!2013 lt!377548 (tuple2!10167 lt!377544 lt!377549)) lt!377550))))

(declare-fun lt!377900 () Unit!28447)

(assert (=> d!107121 (= lt!377900 (choose!1432 lt!377548 lt!377544 lt!377549 lt!377550))))

(declare-fun e!464739 () Bool)

(assert (=> d!107121 e!464739))

(declare-fun res!566611 () Bool)

(assert (=> d!107121 (=> (not res!566611) (not e!464739))))

(assert (=> d!107121 (= res!566611 (not (contains!4190 lt!377548 lt!377550)))))

(assert (=> d!107121 (= (addStillNotContains!199 lt!377548 lt!377544 lt!377549 lt!377550) lt!377900)))

(declare-fun b!833198 () Bool)

(assert (=> b!833198 (= e!464739 (not (= lt!377544 lt!377550)))))

(assert (= (and d!107121 res!566611) b!833198))

(assert (=> d!107121 m!775803))

(assert (=> d!107121 m!775803))

(assert (=> d!107121 m!775805))

(declare-fun m!777459 () Bool)

(assert (=> d!107121 m!777459))

(declare-fun m!777461 () Bool)

(assert (=> d!107121 m!777461))

(assert (=> b!832095 d!107121))

(declare-fun d!107123 () Bool)

(declare-fun e!464740 () Bool)

(assert (=> d!107123 e!464740))

(declare-fun res!566612 () Bool)

(assert (=> d!107123 (=> (not res!566612) (not e!464740))))

(declare-fun lt!377904 () ListLongMap!8979)

(assert (=> d!107123 (= res!566612 (contains!4190 lt!377904 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377903 () List!15949)

(assert (=> d!107123 (= lt!377904 (ListLongMap!8980 lt!377903))))

(declare-fun lt!377902 () Unit!28447)

(declare-fun lt!377901 () Unit!28447)

(assert (=> d!107123 (= lt!377902 lt!377901)))

(assert (=> d!107123 (= (getValueByKey!414 lt!377903 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107123 (= lt!377901 (lemmaContainsTupThenGetReturnValue!231 lt!377903 (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107123 (= lt!377903 (insertStrictlySorted!270 (toList!4505 call!36399) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107123 (= (+!2013 call!36399 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377904)))

(declare-fun b!833199 () Bool)

(declare-fun res!566613 () Bool)

(assert (=> b!833199 (=> (not res!566613) (not e!464740))))

(assert (=> b!833199 (= res!566613 (= (getValueByKey!414 (toList!4505 lt!377904) (_1!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!419 (_2!5094 (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833200 () Bool)

(assert (=> b!833200 (= e!464740 (contains!4191 (toList!4505 lt!377904) (tuple2!10167 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11829 (select (arr!22320 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107123 res!566612) b!833199))

(assert (= (and b!833199 res!566613) b!833200))

(declare-fun m!777463 () Bool)

(assert (=> d!107123 m!777463))

(declare-fun m!777465 () Bool)

(assert (=> d!107123 m!777465))

(declare-fun m!777467 () Bool)

(assert (=> d!107123 m!777467))

(declare-fun m!777469 () Bool)

(assert (=> d!107123 m!777469))

(declare-fun m!777471 () Bool)

(assert (=> b!833199 m!777471))

(declare-fun m!777473 () Bool)

(assert (=> b!833200 m!777473))

(assert (=> b!832095 d!107123))

(assert (=> b!832095 d!106851))

(declare-fun d!107125 () Bool)

(declare-fun res!566614 () Bool)

(declare-fun e!464741 () Bool)

(assert (=> d!107125 (=> res!566614 e!464741)))

(assert (=> d!107125 (= res!566614 (and ((_ is Cons!15945) (toList!4505 lt!377250)) (= (_1!5094 (h!17075 (toList!4505 lt!377250))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107125 (= (containsKey!400 (toList!4505 lt!377250) #b1000000000000000000000000000000000000000000000000000000000000000) e!464741)))

(declare-fun b!833201 () Bool)

(declare-fun e!464742 () Bool)

(assert (=> b!833201 (= e!464741 e!464742)))

(declare-fun res!566615 () Bool)

(assert (=> b!833201 (=> (not res!566615) (not e!464742))))

(assert (=> b!833201 (= res!566615 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377250))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377250))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377250)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377250))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833202 () Bool)

(assert (=> b!833202 (= e!464742 (containsKey!400 (t!22308 (toList!4505 lt!377250)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107125 (not res!566614)) b!833201))

(assert (= (and b!833201 res!566615) b!833202))

(declare-fun m!777475 () Bool)

(assert (=> b!833202 m!777475))

(assert (=> d!106251 d!107125))

(declare-fun d!107127 () Bool)

(declare-fun e!464744 () Bool)

(assert (=> d!107127 e!464744))

(declare-fun res!566616 () Bool)

(assert (=> d!107127 (=> res!566616 e!464744)))

(declare-fun lt!377907 () Bool)

(assert (=> d!107127 (= res!566616 (not lt!377907))))

(declare-fun lt!377905 () Bool)

(assert (=> d!107127 (= lt!377907 lt!377905)))

(declare-fun lt!377908 () Unit!28447)

(declare-fun e!464743 () Unit!28447)

(assert (=> d!107127 (= lt!377908 e!464743)))

(declare-fun c!90744 () Bool)

(assert (=> d!107127 (= c!90744 lt!377905)))

(assert (=> d!107127 (= lt!377905 (containsKey!400 (toList!4505 lt!377435) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!107127 (= (contains!4190 lt!377435 (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377907)))

(declare-fun b!833203 () Bool)

(declare-fun lt!377906 () Unit!28447)

(assert (=> b!833203 (= e!464743 lt!377906)))

(assert (=> b!833203 (= lt!377906 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377435) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833203 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833204 () Bool)

(declare-fun Unit!28508 () Unit!28447)

(assert (=> b!833204 (= e!464743 Unit!28508)))

(declare-fun b!833205 () Bool)

(assert (=> b!833205 (= e!464744 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377435) (select (arr!22319 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!107127 c!90744) b!833203))

(assert (= (and d!107127 (not c!90744)) b!833204))

(assert (= (and d!107127 (not res!566616)) b!833205))

(assert (=> d!107127 m!775407))

(declare-fun m!777477 () Bool)

(assert (=> d!107127 m!777477))

(assert (=> b!833203 m!775407))

(declare-fun m!777479 () Bool)

(assert (=> b!833203 m!777479))

(assert (=> b!833203 m!775407))

(assert (=> b!833203 m!776953))

(assert (=> b!833203 m!776953))

(declare-fun m!777481 () Bool)

(assert (=> b!833203 m!777481))

(assert (=> b!833205 m!775407))

(assert (=> b!833205 m!776953))

(assert (=> b!833205 m!776953))

(assert (=> b!833205 m!777481))

(assert (=> b!831882 d!107127))

(declare-fun d!107129 () Bool)

(declare-fun lt!377909 () Bool)

(assert (=> d!107129 (= lt!377909 (select (content!386 (toList!4505 lt!377378)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464746 () Bool)

(assert (=> d!107129 (= lt!377909 e!464746)))

(declare-fun res!566617 () Bool)

(assert (=> d!107129 (=> (not res!566617) (not e!464746))))

(assert (=> d!107129 (= res!566617 ((_ is Cons!15945) (toList!4505 lt!377378)))))

(assert (=> d!107129 (= (contains!4191 (toList!4505 lt!377378) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377909)))

(declare-fun b!833206 () Bool)

(declare-fun e!464745 () Bool)

(assert (=> b!833206 (= e!464746 e!464745)))

(declare-fun res!566618 () Bool)

(assert (=> b!833206 (=> res!566618 e!464745)))

(assert (=> b!833206 (= res!566618 (= (h!17075 (toList!4505 lt!377378)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833207 () Bool)

(assert (=> b!833207 (= e!464745 (contains!4191 (t!22308 (toList!4505 lt!377378)) (tuple2!10167 (select (arr!22319 _keys!976) #b00000000000000000000000000000000) (get!11829 (select (arr!22320 _values!788) #b00000000000000000000000000000000) (dynLambda!987 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107129 res!566617) b!833206))

(assert (= (and b!833206 (not res!566618)) b!833207))

(declare-fun m!777483 () Bool)

(assert (=> d!107129 m!777483))

(declare-fun m!777485 () Bool)

(assert (=> d!107129 m!777485))

(declare-fun m!777487 () Bool)

(assert (=> b!833207 m!777487))

(assert (=> b!831779 d!107129))

(assert (=> d!106375 d!106349))

(declare-fun d!107131 () Bool)

(assert (=> d!107131 (= (apply!373 (+!2013 lt!377333 (tuple2!10167 lt!377325 minValue!754)) lt!377345) (apply!373 lt!377333 lt!377345))))

(assert (=> d!107131 true))

(declare-fun _$34!1155 () Unit!28447)

(assert (=> d!107131 (= (choose!1435 lt!377333 lt!377325 minValue!754 lt!377345) _$34!1155)))

(declare-fun bs!23298 () Bool)

(assert (= bs!23298 d!107131))

(assert (=> bs!23298 m!775153))

(assert (=> bs!23298 m!775153))

(assert (=> bs!23298 m!775155))

(assert (=> bs!23298 m!775163))

(assert (=> d!106375 d!107131))

(declare-fun d!107133 () Bool)

(declare-fun e!464748 () Bool)

(assert (=> d!107133 e!464748))

(declare-fun res!566619 () Bool)

(assert (=> d!107133 (=> res!566619 e!464748)))

(declare-fun lt!377912 () Bool)

(assert (=> d!107133 (= res!566619 (not lt!377912))))

(declare-fun lt!377910 () Bool)

(assert (=> d!107133 (= lt!377912 lt!377910)))

(declare-fun lt!377913 () Unit!28447)

(declare-fun e!464747 () Unit!28447)

(assert (=> d!107133 (= lt!377913 e!464747)))

(declare-fun c!90745 () Bool)

(assert (=> d!107133 (= c!90745 lt!377910)))

(assert (=> d!107133 (= lt!377910 (containsKey!400 (toList!4505 lt!377333) lt!377345))))

(assert (=> d!107133 (= (contains!4190 lt!377333 lt!377345) lt!377912)))

(declare-fun b!833208 () Bool)

(declare-fun lt!377911 () Unit!28447)

(assert (=> b!833208 (= e!464747 lt!377911)))

(assert (=> b!833208 (= lt!377911 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377333) lt!377345))))

(assert (=> b!833208 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377333) lt!377345))))

(declare-fun b!833209 () Bool)

(declare-fun Unit!28509 () Unit!28447)

(assert (=> b!833209 (= e!464747 Unit!28509)))

(declare-fun b!833210 () Bool)

(assert (=> b!833210 (= e!464748 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377333) lt!377345)))))

(assert (= (and d!107133 c!90745) b!833208))

(assert (= (and d!107133 (not c!90745)) b!833209))

(assert (= (and d!107133 (not res!566619)) b!833210))

(declare-fun m!777489 () Bool)

(assert (=> d!107133 m!777489))

(declare-fun m!777491 () Bool)

(assert (=> b!833208 m!777491))

(assert (=> b!833208 m!775997))

(assert (=> b!833208 m!775997))

(declare-fun m!777493 () Bool)

(assert (=> b!833208 m!777493))

(assert (=> b!833210 m!775997))

(assert (=> b!833210 m!775997))

(assert (=> b!833210 m!777493))

(assert (=> d!106375 d!107133))

(assert (=> d!106375 d!106359))

(assert (=> d!106375 d!106367))

(declare-fun d!107135 () Bool)

(declare-fun res!566620 () Bool)

(declare-fun e!464749 () Bool)

(assert (=> d!107135 (=> res!566620 e!464749)))

(assert (=> d!107135 (= res!566620 (and ((_ is Cons!15945) (toList!4505 lt!377318)) (= (_1!5094 (h!17075 (toList!4505 lt!377318))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107135 (= (containsKey!400 (toList!4505 lt!377318) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)) e!464749)))

(declare-fun b!833211 () Bool)

(declare-fun e!464750 () Bool)

(assert (=> b!833211 (= e!464749 e!464750)))

(declare-fun res!566621 () Bool)

(assert (=> b!833211 (=> (not res!566621) (not e!464750))))

(assert (=> b!833211 (= res!566621 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377318))) (bvsle (_1!5094 (h!17075 (toList!4505 lt!377318))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377318)) (bvslt (_1!5094 (h!17075 (toList!4505 lt!377318))) (select (arr!22319 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833212 () Bool)

(assert (=> b!833212 (= e!464750 (containsKey!400 (t!22308 (toList!4505 lt!377318)) (select (arr!22319 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107135 (not res!566620)) b!833211))

(assert (= (and b!833211 res!566621) b!833212))

(assert (=> b!833212 m!775051))

(declare-fun m!777495 () Bool)

(assert (=> b!833212 m!777495))

(assert (=> d!106211 d!107135))

(declare-fun d!107137 () Bool)

(declare-fun lt!377914 () Bool)

(assert (=> d!107137 (= lt!377914 (select (content!386 lt!377411) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun e!464752 () Bool)

(assert (=> d!107137 (= lt!377914 e!464752)))

(declare-fun res!566622 () Bool)

(assert (=> d!107137 (=> (not res!566622) (not e!464752))))

(assert (=> d!107137 (= res!566622 ((_ is Cons!15945) lt!377411))))

(assert (=> d!107137 (= (contains!4191 lt!377411 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) lt!377914)))

(declare-fun b!833213 () Bool)

(declare-fun e!464751 () Bool)

(assert (=> b!833213 (= e!464752 e!464751)))

(declare-fun res!566623 () Bool)

(assert (=> b!833213 (=> res!566623 e!464751)))

(assert (=> b!833213 (= res!566623 (= (h!17075 lt!377411) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!833214 () Bool)

(assert (=> b!833214 (= e!464751 (contains!4191 (t!22308 lt!377411) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!107137 res!566622) b!833213))

(assert (= (and b!833213 (not res!566623)) b!833214))

(declare-fun m!777497 () Bool)

(assert (=> d!107137 m!777497))

(declare-fun m!777499 () Bool)

(assert (=> d!107137 m!777499))

(declare-fun m!777501 () Bool)

(assert (=> b!833214 m!777501))

(assert (=> b!831844 d!107137))

(assert (=> d!106285 d!106109))

(assert (=> d!106285 d!106107))

(declare-fun e!464754 () Option!420)

(declare-fun b!833217 () Bool)

(assert (=> b!833217 (= e!464754 (getValueByKey!414 (t!22308 (toList!4505 lt!377426)) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))

(declare-fun b!833218 () Bool)

(assert (=> b!833218 (= e!464754 None!418)))

(declare-fun c!90746 () Bool)

(declare-fun d!107139 () Bool)

(assert (=> d!107139 (= c!90746 (and ((_ is Cons!15945) (toList!4505 lt!377426)) (= (_1!5094 (h!17075 (toList!4505 lt!377426))) (_1!5094 (tuple2!10167 lt!377240 lt!377245)))))))

(declare-fun e!464753 () Option!420)

(assert (=> d!107139 (= (getValueByKey!414 (toList!4505 lt!377426) (_1!5094 (tuple2!10167 lt!377240 lt!377245))) e!464753)))

(declare-fun b!833216 () Bool)

(assert (=> b!833216 (= e!464753 e!464754)))

(declare-fun c!90747 () Bool)

(assert (=> b!833216 (= c!90747 (and ((_ is Cons!15945) (toList!4505 lt!377426)) (not (= (_1!5094 (h!17075 (toList!4505 lt!377426))) (_1!5094 (tuple2!10167 lt!377240 lt!377245))))))))

(declare-fun b!833215 () Bool)

(assert (=> b!833215 (= e!464753 (Some!419 (_2!5094 (h!17075 (toList!4505 lt!377426)))))))

(assert (= (and d!107139 c!90746) b!833215))

(assert (= (and d!107139 (not c!90746)) b!833216))

(assert (= (and b!833216 c!90747) b!833217))

(assert (= (and b!833216 (not c!90747)) b!833218))

(declare-fun m!777503 () Bool)

(assert (=> b!833217 m!777503))

(assert (=> b!831866 d!107139))

(assert (=> d!106277 d!106275))

(declare-fun d!107141 () Bool)

(assert (=> d!107141 (= (getValueByKey!414 lt!377256 (_1!5094 lt!377161)) (Some!419 (_2!5094 lt!377161)))))

(assert (=> d!107141 true))

(declare-fun _$22!583 () Unit!28447)

(assert (=> d!107141 (= (choose!1433 lt!377256 (_1!5094 lt!377161) (_2!5094 lt!377161)) _$22!583)))

(declare-fun bs!23299 () Bool)

(assert (= bs!23299 d!107141))

(assert (=> bs!23299 m!775089))

(assert (=> d!106277 d!107141))

(declare-fun d!107143 () Bool)

(declare-fun res!566624 () Bool)

(declare-fun e!464755 () Bool)

(assert (=> d!107143 (=> res!566624 e!464755)))

(assert (=> d!107143 (= res!566624 (or ((_ is Nil!15946) lt!377256) ((_ is Nil!15946) (t!22308 lt!377256))))))

(assert (=> d!107143 (= (isStrictlySorted!438 lt!377256) e!464755)))

(declare-fun b!833219 () Bool)

(declare-fun e!464756 () Bool)

(assert (=> b!833219 (= e!464755 e!464756)))

(declare-fun res!566625 () Bool)

(assert (=> b!833219 (=> (not res!566625) (not e!464756))))

(assert (=> b!833219 (= res!566625 (bvslt (_1!5094 (h!17075 lt!377256)) (_1!5094 (h!17075 (t!22308 lt!377256)))))))

(declare-fun b!833220 () Bool)

(assert (=> b!833220 (= e!464756 (isStrictlySorted!438 (t!22308 lt!377256)))))

(assert (= (and d!107143 (not res!566624)) b!833219))

(assert (= (and b!833219 res!566625) b!833220))

(declare-fun m!777505 () Bool)

(assert (=> b!833220 m!777505))

(assert (=> d!106277 d!107143))

(assert (=> d!106189 d!106183))

(assert (=> d!106189 d!106179))

(declare-fun d!107145 () Bool)

(assert (=> d!107145 (contains!4190 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)) lt!377310)))

(assert (=> d!107145 true))

(declare-fun _$35!429 () Unit!28447)

(assert (=> d!107145 (= (choose!1434 lt!377308 lt!377313 zeroValueBefore!34 lt!377310) _$35!429)))

(declare-fun bs!23300 () Bool)

(assert (= bs!23300 d!107145))

(assert (=> bs!23300 m!775111))

(assert (=> bs!23300 m!775111))

(assert (=> bs!23300 m!775113))

(assert (=> d!106189 d!107145))

(declare-fun d!107147 () Bool)

(declare-fun e!464758 () Bool)

(assert (=> d!107147 e!464758))

(declare-fun res!566626 () Bool)

(assert (=> d!107147 (=> res!566626 e!464758)))

(declare-fun lt!377917 () Bool)

(assert (=> d!107147 (= res!566626 (not lt!377917))))

(declare-fun lt!377915 () Bool)

(assert (=> d!107147 (= lt!377917 lt!377915)))

(declare-fun lt!377918 () Unit!28447)

(declare-fun e!464757 () Unit!28447)

(assert (=> d!107147 (= lt!377918 e!464757)))

(declare-fun c!90748 () Bool)

(assert (=> d!107147 (= c!90748 lt!377915)))

(assert (=> d!107147 (= lt!377915 (containsKey!400 (toList!4505 lt!377308) lt!377310))))

(assert (=> d!107147 (= (contains!4190 lt!377308 lt!377310) lt!377917)))

(declare-fun b!833221 () Bool)

(declare-fun lt!377916 () Unit!28447)

(assert (=> b!833221 (= e!464757 lt!377916)))

(assert (=> b!833221 (= lt!377916 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 lt!377308) lt!377310))))

(assert (=> b!833221 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377308) lt!377310))))

(declare-fun b!833222 () Bool)

(declare-fun Unit!28510 () Unit!28447)

(assert (=> b!833222 (= e!464757 Unit!28510)))

(declare-fun b!833223 () Bool)

(assert (=> b!833223 (= e!464758 (isDefined!311 (getValueByKey!414 (toList!4505 lt!377308) lt!377310)))))

(assert (= (and d!107147 c!90748) b!833221))

(assert (= (and d!107147 (not c!90748)) b!833222))

(assert (= (and d!107147 (not res!566626)) b!833223))

(declare-fun m!777507 () Bool)

(assert (=> d!107147 m!777507))

(declare-fun m!777509 () Bool)

(assert (=> b!833221 m!777509))

(declare-fun m!777511 () Bool)

(assert (=> b!833221 m!777511))

(assert (=> b!833221 m!777511))

(declare-fun m!777513 () Bool)

(assert (=> b!833221 m!777513))

(assert (=> b!833223 m!777511))

(assert (=> b!833223 m!777511))

(assert (=> b!833223 m!777513))

(assert (=> d!106189 d!107147))

(declare-fun d!107149 () Bool)

(declare-fun lt!377919 () Bool)

(assert (=> d!107149 (= lt!377919 (select (content!386 lt!377480) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun e!464760 () Bool)

(assert (=> d!107149 (= lt!377919 e!464760)))

(declare-fun res!566627 () Bool)

(assert (=> d!107149 (=> (not res!566627) (not e!464760))))

(assert (=> d!107149 (= res!566627 ((_ is Cons!15945) lt!377480))))

(assert (=> d!107149 (= (contains!4191 lt!377480 (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))) lt!377919)))

(declare-fun b!833224 () Bool)

(declare-fun e!464759 () Bool)

(assert (=> b!833224 (= e!464760 e!464759)))

(declare-fun res!566628 () Bool)

(assert (=> b!833224 (=> res!566628 e!464759)))

(assert (=> b!833224 (= res!566628 (= (h!17075 lt!377480) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(declare-fun b!833225 () Bool)

(assert (=> b!833225 (= e!464759 (contains!4191 (t!22308 lt!377480) (tuple2!10167 (_1!5094 lt!377164) (_2!5094 lt!377164))))))

(assert (= (and d!107149 res!566627) b!833224))

(assert (= (and b!833224 (not res!566628)) b!833225))

(declare-fun m!777515 () Bool)

(assert (=> d!107149 m!777515))

(declare-fun m!777517 () Bool)

(assert (=> d!107149 m!777517))

(declare-fun m!777519 () Bool)

(assert (=> b!833225 m!777519))

(assert (=> b!831921 d!107149))

(declare-fun d!107151 () Bool)

(assert (=> d!107151 (isDefined!311 (getValueByKey!414 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(declare-fun lt!377920 () Unit!28447)

(assert (=> d!107151 (= lt!377920 (choose!1436 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(declare-fun e!464761 () Bool)

(assert (=> d!107151 e!464761))

(declare-fun res!566629 () Bool)

(assert (=> d!107151 (=> (not res!566629) (not e!464761))))

(assert (=> d!107151 (= res!566629 (isStrictlySorted!438 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34)))))))

(assert (=> d!107151 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310) lt!377920)))

(declare-fun b!833226 () Bool)

(assert (=> b!833226 (= e!464761 (containsKey!400 (toList!4505 (+!2013 lt!377308 (tuple2!10167 lt!377313 zeroValueBefore!34))) lt!377310))))

(assert (= (and d!107151 res!566629) b!833226))

(assert (=> d!107151 m!775465))

(assert (=> d!107151 m!775465))

(assert (=> d!107151 m!775467))

(declare-fun m!777521 () Bool)

(assert (=> d!107151 m!777521))

(declare-fun m!777523 () Bool)

(assert (=> d!107151 m!777523))

(assert (=> b!833226 m!775461))

(assert (=> b!831889 d!107151))

(assert (=> b!831889 d!106565))

(assert (=> b!831889 d!106567))

(declare-fun b!833227 () Bool)

(declare-fun e!464762 () Bool)

(assert (=> b!833227 (= e!464762 tp_is_empty!15211)))

(declare-fun mapNonEmpty!24485 () Bool)

(declare-fun mapRes!24485 () Bool)

(declare-fun tp!47312 () Bool)

(assert (=> mapNonEmpty!24485 (= mapRes!24485 (and tp!47312 e!464762))))

(declare-fun mapRest!24485 () (Array (_ BitVec 32) ValueCell!7190))

(declare-fun mapKey!24485 () (_ BitVec 32))

(declare-fun mapValue!24485 () ValueCell!7190)

(assert (=> mapNonEmpty!24485 (= mapRest!24484 (store mapRest!24485 mapKey!24485 mapValue!24485))))

(declare-fun condMapEmpty!24485 () Bool)

(declare-fun mapDefault!24485 () ValueCell!7190)

(assert (=> mapNonEmpty!24484 (= condMapEmpty!24485 (= mapRest!24484 ((as const (Array (_ BitVec 32) ValueCell!7190)) mapDefault!24485)))))

(declare-fun e!464763 () Bool)

(assert (=> mapNonEmpty!24484 (= tp!47311 (and e!464763 mapRes!24485))))

(declare-fun mapIsEmpty!24485 () Bool)

(assert (=> mapIsEmpty!24485 mapRes!24485))

(declare-fun b!833228 () Bool)

(assert (=> b!833228 (= e!464763 tp_is_empty!15211)))

(assert (= (and mapNonEmpty!24484 condMapEmpty!24485) mapIsEmpty!24485))

(assert (= (and mapNonEmpty!24484 (not condMapEmpty!24485)) mapNonEmpty!24485))

(assert (= (and mapNonEmpty!24485 ((_ is ValueCellFull!7190) mapValue!24485)) b!833227))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7190) mapDefault!24485)) b!833228))

(declare-fun m!777525 () Bool)

(assert (=> mapNonEmpty!24485 m!777525))

(declare-fun b_lambda!11433 () Bool)

(assert (= b_lambda!11425 (or (and start!71560 b_free!13501) b_lambda!11433)))

(declare-fun b_lambda!11435 () Bool)

(assert (= b_lambda!11429 (or (and start!71560 b_free!13501) b_lambda!11435)))

(declare-fun b_lambda!11437 () Bool)

(assert (= b_lambda!11427 (or (and start!71560 b_free!13501) b_lambda!11437)))

(declare-fun b_lambda!11439 () Bool)

(assert (= b_lambda!11431 (or (and start!71560 b_free!13501) b_lambda!11439)))

(check-sat (not b!832725) (not b!832484) (not b!833003) (not b!833120) (not b!833106) (not b!832965) (not b!832427) (not b!832395) (not b!832885) (not b!832445) (not b!832482) (not b!832928) (not b!832474) (not b!832588) (not d!106781) (not d!106633) (not b!832744) (not b_lambda!11407) (not b!832284) (not b!832779) (not d!107083) (not d!106835) (not d!107095) (not b!832945) (not b!832236) (not b!832580) (not bm!36428) (not b!832495) (not d!106435) (not b!832989) (not bm!36424) (not b!832649) (not d!106471) (not b!832515) (not b!832699) (not b!832463) (not b!832754) (not b!832405) (not d!106697) (not b!833226) (not b!832610) (not b!832701) (not b!832272) (not b!832421) (not b!832513) (not b!832486) (not d!107001) (not d!106891) (not b!833202) (not d!106907) (not d!106905) (not b!832847) (not b!832362) (not b!833100) (not d!106401) (not b!832417) (not b!832433) (not b!833199) (not d!106869) (not b!832882) (not b!832534) (not b!832914) (not d!106831) (not b!833210) (not d!106897) (not b!832727) (not b!832608) (not b!832974) (not b!832195) (not b_lambda!11417) (not d!106641) (not b!833223) (not b!833170) (not b!833203) (not b!833141) (not b!832428) (not b!832523) (not b!832776) (not d!106881) (not b!832376) (not b!833217) (not bm!36405) (not d!106653) (not b!832424) (not d!106797) (not b_lambda!11435) (not b!833105) (not d!106939) (not b!832201) (not bm!36446) (not d!106773) (not d!106839) (not b!832642) (not d!106675) (not b!832755) (not d!106957) (not b!833212) (not b!832977) (not d!106453) (not d!107065) (not b!832496) (not d!106733) (not bm!36453) (not d!106963) (not d!106525) (not b!833071) (not b!833158) (not b!832963) (not b_lambda!11399) (not b!832220) (not d!107005) (not b!833180) (not d!106513) (not b!833115) (not d!106775) (not b!832705) (not d!107121) (not b!832809) (not b!832248) (not b!833039) (not bm!36462) (not b!833225) (not b!832855) (not d!106651) (not d!106463) (not d!107079) (not b!832544) (not d!106667) (not d!106551) (not b!832227) (not b!832533) (not b!832654) (not b!833196) (not b!833085) (not b!833059) (not b!832569) (not b!832908) (not d!106685) (not d!106399) (not b!832743) (not b!833078) (not b!832590) (not d!106407) (not b!832357) (not b!832209) (not b!832702) (not d!106625) (not d!107045) (not d!106665) (not b!832738) (not d!106475) (not d!106639) (not b!833153) (not b!832306) (not b!833040) (not b!832467) (not d!106809) (not b!832199) (not b!833214) (not b!832632) (not b!832597) (not d!106557) (not d!106711) (not d!107061) (not b!832956) (not b!832867) (not d!106635) (not b!832364) (not b!833220) (not b!832472) (not b!832223) (not b!833103) (not b!832440) (not d!106801) (not d!106877) (not b!832851) (not d!107015) (not b!832561) (not d!106933) (not b!832953) (not b!832926) (not b!832831) (not b!832679) (not b!833076) (not b!833091) (not d!106393) (not b!832593) (not b!832558) (not b!832802) (not d!106871) (not b!832579) (not b!833193) (not b!832541) (not d!107037) (not d!107067) (not b!832340) (not b!833142) (not b!833014) (not b!833069) (not b!832413) (not b!832300) (not b_lambda!11437) (not d!106979) (not d!107073) (not d!106623) (not b!833128) (not d!107131) (not b!833095) (not d!106795) (not d!106687) (not b!833074) (not b!832898) (not b!833197) (not d!106845) (not b!833049) (not b!832931) (not b!832992) (not b!832890) (not b!832188) (not b!832994) (not b!832350) (not b!832844) (not b!832252) (not d!106613) (not d!107113) (not d!106615) (not b!832910) (not d!106663) (not b!832853) (not b!832955) (not d!106701) (not b!832566) (not b!832888) (not d!106757) (not d!106575) (not b!832324) (not b!833221) (not b!832905) (not d!106769) (not d!107137) (not d!106951) (not b!832296) (not d!106753) (not b!833159) (not b!832510) (not b!833172) (not b!832245) (not b!832226) (not d!106937) (not b_lambda!11433) (not b!832407) (not b!833067) (not b!832841) (not b!833081) (not b!833109) (not d!106493) (not b!832918) (not b!832880) (not d!106507) (not b!832437) (not b!832251) (not b!833208) (not d!106457) (not b!832818) (not d!106385) (not b!832724) (not b!832360) (not b!832747) (not b_lambda!11405) (not d!107151) (not b!832934) (not b!832940) (not d!106983) (not b!832387) (not b!832912) (not d!106715) (not b_lambda!11419) (not d!106605) (not b!833027) (not b!833083) (not b!832575) tp_is_empty!15211 (not b!832271) (not d!106573) (not b!832505) (not bm!36437) (not b!832261) (not d!106861) (not d!106413) (not d!107023) (not b!832876) (not d!106721) (not d!106903) (not d!106677) (not d!106713) (not d!106489) (not d!106973) (not d!107145) (not b!832943) (not b!833155) (not b!833174) (not bm!36420) (not bm!36456) (not d!106755) (not b!832452) (not d!106579) (not b!832920) (not b!833140) (not d!106599) (not b!832577) (not d!106737) (not b!832814) (not b!832353) (not b!832662) (not b!832556) (not d!106491) (not b!832749) (not b!832497) (not b!832901) (not b!832419) (not d!106617) (not d!107117) (not d!106643) (not b!832348) (not d!106629) (not b!832817) (not b!833157) (not bm!36431) (not b!832412) (not b!833058) (not b!832203) (not d!106587) (not b!833024) (not b!832899) (not b!833112) (not b!833117) (not d!106731) (not b!833072) (not b!832757) (not b!832512) (not bm!36450) (not b!832937) (not b!832536) (not b!832837) (not b!832644) (not d!106813) (not b!832916) (not b!833048) (not b!832315) (not b!832909) (not d!106761) (not b!832816) (not b!832281) (not b!832782) (not b!833066) (not b!832480) (not b!832539) (not d!107107) (not b!832563) (not b!832808) (not d!106501) (not b!832836) (not b!833200) (not b!832310) (not b!833050) (not b!833061) (not d!106995) (not bm!36466) (not b!832980) (not b!832651) (not b!832768) (not b!832798) (not b_lambda!11401) (not d!106619) (not b!832871) (not b!832987) (not d!106495) (not b!833182) (not b!832289) (not d!106427) (not b!832431) (not b!833119) (not b!833065) (not b!832708) (not d!106779) (not b!832506) (not b!833134) (not b!832985) (not d!106543) (not d!106541) (not d!106949) (not b!832292) (not b!832469) (not b!832756) (not b_lambda!11423) (not b!832603) (not d!106409) (not d!107075) (not b!833205) (not d!106719) (not b!832685) (not d!106621) (not d!106589) (not d!107099) (not b!832447) (not b!832741) (not b!832834) (not d!106859) (not b!832904) (not bm!36459) (not d!106707) (not bm!36440) (not bm!36402) (not d!106505) (not b_lambda!11403) (not b!832253) (not b!832450) (not b!832715) (not b!832578) (not b!832211) (not b!832402) (not b!832313) (not d!107027) (not d!106899) (not b!832391) (not b!832746) (not b!833139) (not b!832363) (not d!106909) (not b!832346) (not b!833118) (not b!832752) (not d!106865) (not b!832653) (not b!832862) (not b!832373) (not b!832570) (not b!833033) (not b!832454) (not b!832646) (not d!107149) (not b!832250) (not b!832774) (not d!107147) (not b!832522) (not d!106751) (not b!832848) (not b!832210) (not d!106931) (not bm!36411) (not d!107003) (not b!832735) (not b!832336) (not b!832819) (not b!833008) (not b!832796) (not b!833013) (not bm!36443) (not b!833207) (not bm!36465) (not b!832325) (not b!833190) (not b!833181) (not d!107127) (not bm!36434) (not b!833064) (not d!106671) (not b!833192) (not b!832664) (not d!106805) (not b!832652) (not b!833107) (not d!106703) (not d!106515) (not b!832434) (not b!832838) (not b!833137) (not d!106459) (not b!832961) (not b!832332) (not b!832273) (not b!832690) (not b!832889) (not b!832206) (not b!832865) (not bm!36421) (not b!832383) (not d!106659) (not b!832827) (not d!106425) (not d!106465) (not b!832792) (not b!832520) (not d!106537) (not b!832242) (not b!832410) (not b!832380) (not d!107047) (not b!832455) (not b!832935) (not b!832191) (not b!832409) (not d!106509) (not d!106647) (not d!106581) (not b!832684) (not bm!36447) (not b!833093) (not d!107111) (not bm!36414) (not d!106467) (not d!106683) (not bm!36472) (not b!833167) (not b!832790) (not b!832924) (not d!106657) (not d!106563) (not b!833195) (not b!832966) (not b!832995) (not b!832344) (not b!832208) (not d!106631) (not b!832771) (not b!832800) (not b!832958) b_and!22565 (not d!106841) (not b!833084) (not b!832805) (not d!106591) (not b!832543) (not b!832711) (not b!832785) (not b!832502) (not d!106789) (not d!106565) (not b!832595) (not b!833037) (not b!832869) (not b!832228) (not b!832850) (not d!106817) (not b_next!13501) (not b!833030) (not b!832600) (not b!832718) (not d!106847) (not b!832731) (not d!107009) (not d!106585) (not b!832922) (not b!832944) (not b!832316) (not d!106561) (not b!832219) (not b!833063) (not b!832794) (not b!832465) (not b!833131) (not b!832494) (not d!106885) (not b!832833) (not b!833179) (not d!107123) (not b!832811) (not d!107133) (not b!832887) (not b!833129) (not d!107087) (not b!832416) (not b!832287) (not d!106709) (not d!107119) (not b!832554) (not d!106559) (not b!832829) (not mapNonEmpty!24485) (not d!106553) (not b!832492) (not b!832365) (not d!106987) (not b!833150) (not d!106837) (not b!832733) (not b!832442) (not b!832330) (not d!107089) (not d!107097) (not b!832859) (not b_lambda!11397) (not b!832308) (not b!832489) (not b!832983) (not b_lambda!11421) (not d!107129) (not b!832696) (not b!832303) (not b!833006) (not d!107013) (not b!832857) (not b!832729) (not b!832693) (not b!832264) (not b!832599) (not bm!36408) (not b!833132) (not b!833022) (not b!833177) (not b!832879) (not b!832606) (not b!832355) (not b_lambda!11439) (not b!833089) (not b!832399) (not b!832328) (not d!107141) (not b!832873) (not b!832902) (not bm!36475) (not d!106419) (not b!832453) (not b!832444) (not d!106945) (not d!107077) (not b!832521) (not b!832964) (not d!106433) (not b!832243) (not d!106473) (not d!106403) (not d!106863) (not b!832765) (not b!832542) (not d!107011) (not b!832552) (not b!832418) (not b!833011) (not d!106383) (not b!832942) (not bm!36425) (not b!832531) (not b!832846) (not b!832305) (not b!833097) (not b!833110) (not d!107069) (not b!832572) (not bm!36417) (not d!106397) (not bm!36469) (not b!832378) (not b!832721) (not d!106417) (not b!832518) (not b!832687) (not b!832639) (not d!106849) (not d!106771) (not b!832470) (not d!106545) (not b!832508))
(check-sat b_and!22565 (not b_next!13501))
