; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131892 () Bool)

(assert start!131892)

(declare-fun b_free!31605 () Bool)

(declare-fun b_next!31605 () Bool)

(assert (=> start!131892 (= b_free!31605 (not b_next!31605))))

(declare-fun tp!111066 () Bool)

(declare-fun b_and!51015 () Bool)

(assert (=> start!131892 (= tp!111066 b_and!51015)))

(declare-fun b!1544095 () Bool)

(declare-fun res!1059294 () Bool)

(declare-fun e!859461 () Bool)

(assert (=> b!1544095 (=> (not res!1059294) (not e!859461))))

(declare-datatypes ((array!102976 0))(
  ( (array!102977 (arr!49690 (Array (_ BitVec 32) (_ BitVec 64))) (size!50240 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102976)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102976 (_ BitVec 32)) Bool)

(assert (=> b!1544095 (= res!1059294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544096 () Bool)

(declare-datatypes ((V!58951 0))(
  ( (V!58952 (val!19018 Int)) )
))
(declare-datatypes ((tuple2!24426 0))(
  ( (tuple2!24427 (_1!12224 (_ BitVec 64)) (_2!12224 V!58951)) )
))
(declare-datatypes ((List!35943 0))(
  ( (Nil!35940) (Cons!35939 (h!37384 tuple2!24426) (t!50637 List!35943)) )
))
(declare-datatypes ((ListLongMap!22035 0))(
  ( (ListLongMap!22036 (toList!11033 List!35943)) )
))
(declare-fun e!859459 () ListLongMap!22035)

(declare-fun call!68766 () ListLongMap!22035)

(declare-fun minValue!436 () V!58951)

(declare-fun +!4872 (ListLongMap!22035 tuple2!24426) ListLongMap!22035)

(assert (=> b!1544096 (= e!859459 (+!4872 call!68766 (tuple2!24427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544097 () Bool)

(declare-fun e!859460 () ListLongMap!22035)

(declare-fun call!68765 () ListLongMap!22035)

(assert (=> b!1544097 (= e!859460 call!68765)))

(declare-fun mapIsEmpty!58525 () Bool)

(declare-fun mapRes!58525 () Bool)

(assert (=> mapIsEmpty!58525 mapRes!58525))

(declare-fun b!1544098 () Bool)

(assert (=> b!1544098 (= e!859461 false)))

(declare-fun lt!666088 () ListLongMap!22035)

(assert (=> b!1544098 (= lt!666088 e!859459)))

(declare-fun c!141352 () Bool)

(declare-fun lt!666089 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544098 (= c!141352 (and (not lt!666089) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544098 (= lt!666089 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544099 () Bool)

(declare-fun res!1059295 () Bool)

(assert (=> b!1544099 (=> (not res!1059295) (not e!859461))))

(declare-datatypes ((ValueCell!18030 0))(
  ( (ValueCellFull!18030 (v!21819 V!58951)) (EmptyCell!18030) )
))
(declare-datatypes ((array!102978 0))(
  ( (array!102979 (arr!49691 (Array (_ BitVec 32) ValueCell!18030)) (size!50241 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102978)

(assert (=> b!1544099 (= res!1059295 (and (= (size!50241 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50240 _keys!618) (size!50241 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544100 () Bool)

(declare-fun e!859464 () Bool)

(declare-fun tp_is_empty!37881 () Bool)

(assert (=> b!1544100 (= e!859464 tp_is_empty!37881)))

(declare-fun zeroValue!436 () V!58951)

(declare-fun call!68769 () ListLongMap!22035)

(declare-fun c!141351 () Bool)

(declare-fun call!68767 () ListLongMap!22035)

(declare-fun call!68768 () ListLongMap!22035)

(declare-fun bm!68762 () Bool)

(assert (=> bm!68762 (= call!68766 (+!4872 (ite c!141352 call!68768 (ite c!141351 call!68767 call!68769)) (ite (or c!141352 c!141351) (tuple2!24427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68763 () Bool)

(assert (=> bm!68763 (= call!68769 call!68767)))

(declare-fun bm!68764 () Bool)

(assert (=> bm!68764 (= call!68767 call!68768)))

(declare-fun b!1544102 () Bool)

(declare-fun e!859457 () Bool)

(assert (=> b!1544102 (= e!859457 tp_is_empty!37881)))

(declare-fun bm!68765 () Bool)

(assert (=> bm!68765 (= call!68765 call!68766)))

(declare-fun b!1544103 () Bool)

(declare-fun res!1059293 () Bool)

(assert (=> b!1544103 (=> (not res!1059293) (not e!859461))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544103 (= res!1059293 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50240 _keys!618))))))

(declare-fun mapNonEmpty!58525 () Bool)

(declare-fun tp!111067 () Bool)

(assert (=> mapNonEmpty!58525 (= mapRes!58525 (and tp!111067 e!859457))))

(declare-fun mapRest!58525 () (Array (_ BitVec 32) ValueCell!18030))

(declare-fun mapValue!58525 () ValueCell!18030)

(declare-fun mapKey!58525 () (_ BitVec 32))

(assert (=> mapNonEmpty!58525 (= (arr!49691 _values!470) (store mapRest!58525 mapKey!58525 mapValue!58525))))

(declare-fun b!1544104 () Bool)

(declare-fun e!859458 () ListLongMap!22035)

(assert (=> b!1544104 (= e!859458 call!68765)))

(declare-fun b!1544105 () Bool)

(declare-fun e!859462 () Bool)

(assert (=> b!1544105 (= e!859462 (and e!859464 mapRes!58525))))

(declare-fun condMapEmpty!58525 () Bool)

(declare-fun mapDefault!58525 () ValueCell!18030)

(assert (=> b!1544105 (= condMapEmpty!58525 (= (arr!49691 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18030)) mapDefault!58525)))))

(declare-fun b!1544106 () Bool)

(declare-fun c!141353 () Bool)

(assert (=> b!1544106 (= c!141353 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666089))))

(assert (=> b!1544106 (= e!859458 e!859460)))

(declare-fun b!1544107 () Bool)

(declare-fun res!1059297 () Bool)

(assert (=> b!1544107 (=> (not res!1059297) (not e!859461))))

(declare-datatypes ((List!35944 0))(
  ( (Nil!35941) (Cons!35940 (h!37385 (_ BitVec 64)) (t!50638 List!35944)) )
))
(declare-fun arrayNoDuplicates!0 (array!102976 (_ BitVec 32) List!35944) Bool)

(assert (=> b!1544107 (= res!1059297 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35941))))

(declare-fun res!1059296 () Bool)

(assert (=> start!131892 (=> (not res!1059296) (not e!859461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131892 (= res!1059296 (validMask!0 mask!926))))

(assert (=> start!131892 e!859461))

(declare-fun array_inv!38655 (array!102976) Bool)

(assert (=> start!131892 (array_inv!38655 _keys!618)))

(assert (=> start!131892 tp_is_empty!37881))

(assert (=> start!131892 true))

(assert (=> start!131892 tp!111066))

(declare-fun array_inv!38656 (array!102978) Bool)

(assert (=> start!131892 (and (array_inv!38656 _values!470) e!859462)))

(declare-fun b!1544101 () Bool)

(assert (=> b!1544101 (= e!859459 e!859458)))

(assert (=> b!1544101 (= c!141351 (and (not lt!666089) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544108 () Bool)

(assert (=> b!1544108 (= e!859460 call!68769)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68766 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6505 (array!102976 array!102978 (_ BitVec 32) (_ BitVec 32) V!58951 V!58951 (_ BitVec 32) Int) ListLongMap!22035)

(assert (=> bm!68766 (= call!68768 (getCurrentListMapNoExtraKeys!6505 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131892 res!1059296) b!1544099))

(assert (= (and b!1544099 res!1059295) b!1544095))

(assert (= (and b!1544095 res!1059294) b!1544107))

(assert (= (and b!1544107 res!1059297) b!1544103))

(assert (= (and b!1544103 res!1059293) b!1544098))

(assert (= (and b!1544098 c!141352) b!1544096))

(assert (= (and b!1544098 (not c!141352)) b!1544101))

(assert (= (and b!1544101 c!141351) b!1544104))

(assert (= (and b!1544101 (not c!141351)) b!1544106))

(assert (= (and b!1544106 c!141353) b!1544097))

(assert (= (and b!1544106 (not c!141353)) b!1544108))

(assert (= (or b!1544097 b!1544108) bm!68763))

(assert (= (or b!1544104 bm!68763) bm!68764))

(assert (= (or b!1544104 b!1544097) bm!68765))

(assert (= (or b!1544096 bm!68764) bm!68766))

(assert (= (or b!1544096 bm!68765) bm!68762))

(assert (= (and b!1544105 condMapEmpty!58525) mapIsEmpty!58525))

(assert (= (and b!1544105 (not condMapEmpty!58525)) mapNonEmpty!58525))

(get-info :version)

(assert (= (and mapNonEmpty!58525 ((_ is ValueCellFull!18030) mapValue!58525)) b!1544102))

(assert (= (and b!1544105 ((_ is ValueCellFull!18030) mapDefault!58525)) b!1544100))

(assert (= start!131892 b!1544105))

(declare-fun m!1425133 () Bool)

(assert (=> bm!68766 m!1425133))

(declare-fun m!1425135 () Bool)

(assert (=> b!1544095 m!1425135))

(declare-fun m!1425137 () Bool)

(assert (=> mapNonEmpty!58525 m!1425137))

(declare-fun m!1425139 () Bool)

(assert (=> start!131892 m!1425139))

(declare-fun m!1425141 () Bool)

(assert (=> start!131892 m!1425141))

(declare-fun m!1425143 () Bool)

(assert (=> start!131892 m!1425143))

(declare-fun m!1425145 () Bool)

(assert (=> b!1544107 m!1425145))

(declare-fun m!1425147 () Bool)

(assert (=> b!1544096 m!1425147))

(declare-fun m!1425149 () Bool)

(assert (=> bm!68762 m!1425149))

(check-sat tp_is_empty!37881 (not b!1544096) (not b_next!31605) b_and!51015 (not bm!68766) (not bm!68762) (not start!131892) (not b!1544107) (not b!1544095) (not mapNonEmpty!58525))
(check-sat b_and!51015 (not b_next!31605))
