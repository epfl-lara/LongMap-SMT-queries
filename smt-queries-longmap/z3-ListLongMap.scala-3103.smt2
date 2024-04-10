; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43582 () Bool)

(assert start!43582)

(declare-fun b_free!12339 () Bool)

(declare-fun b_next!12339 () Bool)

(assert (=> start!43582 (= b_free!12339 (not b_next!12339))))

(declare-fun tp!43303 () Bool)

(declare-fun b_and!21101 () Bool)

(assert (=> start!43582 (= tp!43303 b_and!21101)))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun b!482870 () Bool)

(declare-fun e!284166 () Bool)

(declare-fun lt!218872 () (_ BitVec 32))

(declare-datatypes ((array!31361 0))(
  ( (array!31362 (arr!15082 (Array (_ BitVec 32) (_ BitVec 64))) (size!15440 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31361)

(assert (=> b!482870 (= e!284166 (not (or (not (= (size!15440 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsgt #b00000000000000000000000000000000 (size!15440 _keys!1874)) (and (bvsge lt!218872 #b00000000000000000000000000000000) (bvsle lt!218872 (size!15440 _keys!1874))))))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31361 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482870 (= lt!218872 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!284164 () Bool)

(assert (=> b!482870 e!284164))

(declare-fun c!58014 () Bool)

(assert (=> b!482870 (= c!58014 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14158 0))(
  ( (Unit!14159) )
))
(declare-fun lt!218871 () Unit!14158)

(declare-datatypes ((V!19539 0))(
  ( (V!19540 (val!6973 Int)) )
))
(declare-fun minValue!1458 () V!19539)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19539)

(declare-datatypes ((ValueCell!6564 0))(
  ( (ValueCellFull!6564 (v!9267 V!19539)) (EmptyCell!6564) )
))
(declare-datatypes ((array!31363 0))(
  ( (array!31364 (arr!15083 (Array (_ BitVec 32) ValueCell!6564)) (size!15441 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31363)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!149 (array!31361 array!31363 (_ BitVec 32) (_ BitVec 32) V!19539 V!19539 (_ BitVec 64) Int) Unit!14158)

(assert (=> b!482870 (= lt!218871 (lemmaKeyInListMapIsInArray!149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482871 () Bool)

(declare-fun arrayContainsKey!0 (array!31361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482871 (= e!284164 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482872 () Bool)

(declare-fun e!284165 () Bool)

(declare-fun tp_is_empty!13851 () Bool)

(assert (=> b!482872 (= e!284165 tp_is_empty!13851)))

(declare-fun mapIsEmpty!22489 () Bool)

(declare-fun mapRes!22489 () Bool)

(assert (=> mapIsEmpty!22489 mapRes!22489))

(declare-fun b!482873 () Bool)

(assert (=> b!482873 (= e!284164 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482874 () Bool)

(declare-fun res!287806 () Bool)

(assert (=> b!482874 (=> (not res!287806) (not e!284166))))

(declare-datatypes ((tuple2!9152 0))(
  ( (tuple2!9153 (_1!4587 (_ BitVec 64)) (_2!4587 V!19539)) )
))
(declare-datatypes ((List!9233 0))(
  ( (Nil!9230) (Cons!9229 (h!10085 tuple2!9152) (t!15449 List!9233)) )
))
(declare-datatypes ((ListLongMap!8065 0))(
  ( (ListLongMap!8066 (toList!4048 List!9233)) )
))
(declare-fun contains!2663 (ListLongMap!8065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2367 (array!31361 array!31363 (_ BitVec 32) (_ BitVec 32) V!19539 V!19539 (_ BitVec 32) Int) ListLongMap!8065)

(assert (=> b!482874 (= res!287806 (contains!2663 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22489 () Bool)

(declare-fun tp!43302 () Bool)

(assert (=> mapNonEmpty!22489 (= mapRes!22489 (and tp!43302 e!284165))))

(declare-fun mapValue!22489 () ValueCell!6564)

(declare-fun mapRest!22489 () (Array (_ BitVec 32) ValueCell!6564))

(declare-fun mapKey!22489 () (_ BitVec 32))

(assert (=> mapNonEmpty!22489 (= (arr!15083 _values!1516) (store mapRest!22489 mapKey!22489 mapValue!22489))))

(declare-fun res!287803 () Bool)

(assert (=> start!43582 (=> (not res!287803) (not e!284166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43582 (= res!287803 (validMask!0 mask!2352))))

(assert (=> start!43582 e!284166))

(assert (=> start!43582 true))

(assert (=> start!43582 tp_is_empty!13851))

(declare-fun e!284163 () Bool)

(declare-fun array_inv!10880 (array!31363) Bool)

(assert (=> start!43582 (and (array_inv!10880 _values!1516) e!284163)))

(assert (=> start!43582 tp!43303))

(declare-fun array_inv!10881 (array!31361) Bool)

(assert (=> start!43582 (array_inv!10881 _keys!1874)))

(declare-fun b!482875 () Bool)

(declare-fun e!284161 () Bool)

(assert (=> b!482875 (= e!284163 (and e!284161 mapRes!22489))))

(declare-fun condMapEmpty!22489 () Bool)

(declare-fun mapDefault!22489 () ValueCell!6564)

(assert (=> b!482875 (= condMapEmpty!22489 (= (arr!15083 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6564)) mapDefault!22489)))))

(declare-fun b!482876 () Bool)

(declare-fun res!287802 () Bool)

(assert (=> b!482876 (=> (not res!287802) (not e!284166))))

(assert (=> b!482876 (= res!287802 (and (= (size!15441 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15440 _keys!1874) (size!15441 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482877 () Bool)

(assert (=> b!482877 (= e!284161 tp_is_empty!13851)))

(declare-fun b!482878 () Bool)

(declare-fun res!287801 () Bool)

(assert (=> b!482878 (=> (not res!287801) (not e!284166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482878 (= res!287801 (validKeyInArray!0 k0!1332))))

(declare-fun b!482879 () Bool)

(declare-fun res!287804 () Bool)

(assert (=> b!482879 (=> (not res!287804) (not e!284166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31361 (_ BitVec 32)) Bool)

(assert (=> b!482879 (= res!287804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482880 () Bool)

(declare-fun res!287805 () Bool)

(assert (=> b!482880 (=> (not res!287805) (not e!284166))))

(declare-datatypes ((List!9234 0))(
  ( (Nil!9231) (Cons!9230 (h!10086 (_ BitVec 64)) (t!15450 List!9234)) )
))
(declare-fun arrayNoDuplicates!0 (array!31361 (_ BitVec 32) List!9234) Bool)

(assert (=> b!482880 (= res!287805 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9231))))

(assert (= (and start!43582 res!287803) b!482876))

(assert (= (and b!482876 res!287802) b!482879))

(assert (= (and b!482879 res!287804) b!482880))

(assert (= (and b!482880 res!287805) b!482874))

(assert (= (and b!482874 res!287806) b!482878))

(assert (= (and b!482878 res!287801) b!482870))

(assert (= (and b!482870 c!58014) b!482871))

(assert (= (and b!482870 (not c!58014)) b!482873))

(assert (= (and b!482875 condMapEmpty!22489) mapIsEmpty!22489))

(assert (= (and b!482875 (not condMapEmpty!22489)) mapNonEmpty!22489))

(get-info :version)

(assert (= (and mapNonEmpty!22489 ((_ is ValueCellFull!6564) mapValue!22489)) b!482872))

(assert (= (and b!482875 ((_ is ValueCellFull!6564) mapDefault!22489)) b!482877))

(assert (= start!43582 b!482875))

(declare-fun m!463995 () Bool)

(assert (=> b!482871 m!463995))

(declare-fun m!463997 () Bool)

(assert (=> mapNonEmpty!22489 m!463997))

(declare-fun m!463999 () Bool)

(assert (=> start!43582 m!463999))

(declare-fun m!464001 () Bool)

(assert (=> start!43582 m!464001))

(declare-fun m!464003 () Bool)

(assert (=> start!43582 m!464003))

(declare-fun m!464005 () Bool)

(assert (=> b!482880 m!464005))

(declare-fun m!464007 () Bool)

(assert (=> b!482870 m!464007))

(declare-fun m!464009 () Bool)

(assert (=> b!482870 m!464009))

(declare-fun m!464011 () Bool)

(assert (=> b!482879 m!464011))

(declare-fun m!464013 () Bool)

(assert (=> b!482874 m!464013))

(assert (=> b!482874 m!464013))

(declare-fun m!464015 () Bool)

(assert (=> b!482874 m!464015))

(declare-fun m!464017 () Bool)

(assert (=> b!482878 m!464017))

(check-sat (not b_next!12339) (not start!43582) b_and!21101 (not b!482871) tp_is_empty!13851 (not b!482880) (not b!482879) (not mapNonEmpty!22489) (not b!482870) (not b!482874) (not b!482878))
(check-sat b_and!21101 (not b_next!12339))
(get-model)

(declare-fun d!76853 () Bool)

(assert (=> d!76853 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482878 d!76853))

(declare-fun d!76855 () Bool)

(declare-fun lt!218881 () (_ BitVec 32))

(assert (=> d!76855 (and (or (bvslt lt!218881 #b00000000000000000000000000000000) (bvsge lt!218881 (size!15440 _keys!1874)) (and (bvsge lt!218881 #b00000000000000000000000000000000) (bvslt lt!218881 (size!15440 _keys!1874)))) (bvsge lt!218881 #b00000000000000000000000000000000) (bvslt lt!218881 (size!15440 _keys!1874)) (= (select (arr!15082 _keys!1874) lt!218881) k0!1332))))

(declare-fun e!284187 () (_ BitVec 32))

(assert (=> d!76855 (= lt!218881 e!284187)))

(declare-fun c!58020 () Bool)

(assert (=> d!76855 (= c!58020 (= (select (arr!15082 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)) (bvslt (size!15440 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76855 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218881)))

(declare-fun b!482918 () Bool)

(assert (=> b!482918 (= e!284187 #b00000000000000000000000000000000)))

(declare-fun b!482919 () Bool)

(assert (=> b!482919 (= e!284187 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76855 c!58020) b!482918))

(assert (= (and d!76855 (not c!58020)) b!482919))

(declare-fun m!464043 () Bool)

(assert (=> d!76855 m!464043))

(declare-fun m!464045 () Bool)

(assert (=> d!76855 m!464045))

(declare-fun m!464047 () Bool)

(assert (=> b!482919 m!464047))

(assert (=> b!482870 d!76855))

(declare-fun d!76857 () Bool)

(declare-fun e!284190 () Bool)

(assert (=> d!76857 e!284190))

(declare-fun c!58023 () Bool)

(assert (=> d!76857 (= c!58023 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218884 () Unit!14158)

(declare-fun choose!1379 (array!31361 array!31363 (_ BitVec 32) (_ BitVec 32) V!19539 V!19539 (_ BitVec 64) Int) Unit!14158)

(assert (=> d!76857 (= lt!218884 (choose!1379 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76857 (validMask!0 mask!2352)))

(assert (=> d!76857 (= (lemmaKeyInListMapIsInArray!149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218884)))

(declare-fun b!482924 () Bool)

(assert (=> b!482924 (= e!284190 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482925 () Bool)

(assert (=> b!482925 (= e!284190 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76857 c!58023) b!482924))

(assert (= (and d!76857 (not c!58023)) b!482925))

(declare-fun m!464049 () Bool)

(assert (=> d!76857 m!464049))

(assert (=> d!76857 m!463999))

(assert (=> b!482924 m!463995))

(assert (=> b!482870 d!76857))

(declare-fun d!76859 () Bool)

(declare-fun e!284196 () Bool)

(assert (=> d!76859 e!284196))

(declare-fun res!287827 () Bool)

(assert (=> d!76859 (=> res!287827 e!284196)))

(declare-fun lt!218895 () Bool)

(assert (=> d!76859 (= res!287827 (not lt!218895))))

(declare-fun lt!218894 () Bool)

(assert (=> d!76859 (= lt!218895 lt!218894)))

(declare-fun lt!218896 () Unit!14158)

(declare-fun e!284195 () Unit!14158)

(assert (=> d!76859 (= lt!218896 e!284195)))

(declare-fun c!58026 () Bool)

(assert (=> d!76859 (= c!58026 lt!218894)))

(declare-fun containsKey!359 (List!9233 (_ BitVec 64)) Bool)

(assert (=> d!76859 (= lt!218894 (containsKey!359 (toList!4048 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76859 (= (contains!2663 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218895)))

(declare-fun b!482932 () Bool)

(declare-fun lt!218893 () Unit!14158)

(assert (=> b!482932 (= e!284195 lt!218893)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!307 (List!9233 (_ BitVec 64)) Unit!14158)

(assert (=> b!482932 (= lt!218893 (lemmaContainsKeyImpliesGetValueByKeyDefined!307 (toList!4048 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!403 0))(
  ( (Some!402 (v!9269 V!19539)) (None!401) )
))
(declare-fun isDefined!308 (Option!403) Bool)

(declare-fun getValueByKey!397 (List!9233 (_ BitVec 64)) Option!403)

(assert (=> b!482932 (isDefined!308 (getValueByKey!397 (toList!4048 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482933 () Bool)

(declare-fun Unit!14160 () Unit!14158)

(assert (=> b!482933 (= e!284195 Unit!14160)))

(declare-fun b!482934 () Bool)

(assert (=> b!482934 (= e!284196 (isDefined!308 (getValueByKey!397 (toList!4048 (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76859 c!58026) b!482932))

(assert (= (and d!76859 (not c!58026)) b!482933))

(assert (= (and d!76859 (not res!287827)) b!482934))

(declare-fun m!464051 () Bool)

(assert (=> d!76859 m!464051))

(declare-fun m!464053 () Bool)

(assert (=> b!482932 m!464053))

(declare-fun m!464055 () Bool)

(assert (=> b!482932 m!464055))

(assert (=> b!482932 m!464055))

(declare-fun m!464057 () Bool)

(assert (=> b!482932 m!464057))

(assert (=> b!482934 m!464055))

(assert (=> b!482934 m!464055))

(assert (=> b!482934 m!464057))

(assert (=> b!482874 d!76859))

(declare-fun b!482977 () Bool)

(declare-fun e!284229 () Unit!14158)

(declare-fun lt!218956 () Unit!14158)

(assert (=> b!482977 (= e!284229 lt!218956)))

(declare-fun lt!218962 () ListLongMap!8065)

(declare-fun getCurrentListMapNoExtraKeys!2113 (array!31361 array!31363 (_ BitVec 32) (_ BitVec 32) V!19539 V!19539 (_ BitVec 32) Int) ListLongMap!8065)

(assert (=> b!482977 (= lt!218962 (getCurrentListMapNoExtraKeys!2113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218942 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218954 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218954 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218945 () Unit!14158)

(declare-fun addStillContains!302 (ListLongMap!8065 (_ BitVec 64) V!19539 (_ BitVec 64)) Unit!14158)

(assert (=> b!482977 (= lt!218945 (addStillContains!302 lt!218962 lt!218942 zeroValue!1458 lt!218954))))

(declare-fun +!1776 (ListLongMap!8065 tuple2!9152) ListLongMap!8065)

(assert (=> b!482977 (contains!2663 (+!1776 lt!218962 (tuple2!9153 lt!218942 zeroValue!1458)) lt!218954)))

(declare-fun lt!218947 () Unit!14158)

(assert (=> b!482977 (= lt!218947 lt!218945)))

(declare-fun lt!218951 () ListLongMap!8065)

(assert (=> b!482977 (= lt!218951 (getCurrentListMapNoExtraKeys!2113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218953 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218953 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218946 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218946 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218943 () Unit!14158)

(declare-fun addApplyDifferent!302 (ListLongMap!8065 (_ BitVec 64) V!19539 (_ BitVec 64)) Unit!14158)

(assert (=> b!482977 (= lt!218943 (addApplyDifferent!302 lt!218951 lt!218953 minValue!1458 lt!218946))))

(declare-fun apply!344 (ListLongMap!8065 (_ BitVec 64)) V!19539)

(assert (=> b!482977 (= (apply!344 (+!1776 lt!218951 (tuple2!9153 lt!218953 minValue!1458)) lt!218946) (apply!344 lt!218951 lt!218946))))

(declare-fun lt!218958 () Unit!14158)

(assert (=> b!482977 (= lt!218958 lt!218943)))

(declare-fun lt!218960 () ListLongMap!8065)

(assert (=> b!482977 (= lt!218960 (getCurrentListMapNoExtraKeys!2113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218961 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218952 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218952 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218955 () Unit!14158)

(assert (=> b!482977 (= lt!218955 (addApplyDifferent!302 lt!218960 lt!218961 zeroValue!1458 lt!218952))))

(assert (=> b!482977 (= (apply!344 (+!1776 lt!218960 (tuple2!9153 lt!218961 zeroValue!1458)) lt!218952) (apply!344 lt!218960 lt!218952))))

(declare-fun lt!218948 () Unit!14158)

(assert (=> b!482977 (= lt!218948 lt!218955)))

(declare-fun lt!218957 () ListLongMap!8065)

(assert (=> b!482977 (= lt!218957 (getCurrentListMapNoExtraKeys!2113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218941 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218944 () (_ BitVec 64))

(assert (=> b!482977 (= lt!218944 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482977 (= lt!218956 (addApplyDifferent!302 lt!218957 lt!218941 minValue!1458 lt!218944))))

(assert (=> b!482977 (= (apply!344 (+!1776 lt!218957 (tuple2!9153 lt!218941 minValue!1458)) lt!218944) (apply!344 lt!218957 lt!218944))))

(declare-fun call!30999 () ListLongMap!8065)

(declare-fun bm!30996 () Bool)

(assert (=> bm!30996 (= call!30999 (getCurrentListMapNoExtraKeys!2113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482978 () Bool)

(declare-fun e!284231 () Bool)

(declare-fun e!284223 () Bool)

(assert (=> b!482978 (= e!284231 e!284223)))

(declare-fun res!287852 () Bool)

(declare-fun call!31005 () Bool)

(assert (=> b!482978 (= res!287852 call!31005)))

(assert (=> b!482978 (=> (not res!287852) (not e!284223))))

(declare-fun b!482979 () Bool)

(declare-fun c!58044 () Bool)

(assert (=> b!482979 (= c!58044 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284230 () ListLongMap!8065)

(declare-fun e!284227 () ListLongMap!8065)

(assert (=> b!482979 (= e!284230 e!284227)))

(declare-fun b!482980 () Bool)

(declare-fun e!284228 () Bool)

(assert (=> b!482980 (= e!284228 (validKeyInArray!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482981 () Bool)

(declare-fun e!284225 () ListLongMap!8065)

(assert (=> b!482981 (= e!284225 e!284230)))

(declare-fun c!58042 () Bool)

(assert (=> b!482981 (= c!58042 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30997 () Bool)

(declare-fun lt!218959 () ListLongMap!8065)

(assert (=> bm!30997 (= call!31005 (contains!2663 lt!218959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!58043 () Bool)

(declare-fun call!31004 () ListLongMap!8065)

(declare-fun call!31003 () ListLongMap!8065)

(declare-fun call!31000 () ListLongMap!8065)

(declare-fun bm!30998 () Bool)

(assert (=> bm!30998 (= call!31003 (+!1776 (ite c!58043 call!30999 (ite c!58042 call!31000 call!31004)) (ite (or c!58043 c!58042) (tuple2!9153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!482982 () Bool)

(declare-fun res!287853 () Bool)

(declare-fun e!284235 () Bool)

(assert (=> b!482982 (=> (not res!287853) (not e!284235))))

(declare-fun e!284232 () Bool)

(assert (=> b!482982 (= res!287853 e!284232)))

(declare-fun c!58041 () Bool)

(assert (=> b!482982 (= c!58041 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482983 () Bool)

(assert (=> b!482983 (= e!284227 call!31004)))

(declare-fun b!482984 () Bool)

(assert (=> b!482984 (= e!284225 (+!1776 call!31003 (tuple2!9153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!482985 () Bool)

(declare-fun call!31002 () Bool)

(assert (=> b!482985 (= e!284232 (not call!31002))))

(declare-fun bm!31000 () Bool)

(declare-fun call!31001 () ListLongMap!8065)

(assert (=> bm!31000 (= call!31001 call!31003)))

(declare-fun b!482986 () Bool)

(assert (=> b!482986 (= e!284227 call!31001)))

(declare-fun b!482987 () Bool)

(declare-fun Unit!14161 () Unit!14158)

(assert (=> b!482987 (= e!284229 Unit!14161)))

(declare-fun b!482988 () Bool)

(assert (=> b!482988 (= e!284235 e!284231)))

(declare-fun c!58040 () Bool)

(assert (=> b!482988 (= c!58040 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482989 () Bool)

(declare-fun e!284234 () Bool)

(assert (=> b!482989 (= e!284234 (validKeyInArray!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482990 () Bool)

(assert (=> b!482990 (= e!284223 (= (apply!344 lt!218959 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!31001 () Bool)

(assert (=> bm!31001 (= call!31004 call!31000)))

(declare-fun e!284233 () Bool)

(declare-fun b!482991 () Bool)

(declare-fun get!7299 (ValueCell!6564 V!19539) V!19539)

(declare-fun dynLambda!955 (Int (_ BitVec 64)) V!19539)

(assert (=> b!482991 (= e!284233 (= (apply!344 lt!218959 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)) (get!7299 (select (arr!15083 _values!1516) #b00000000000000000000000000000000) (dynLambda!955 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15441 _values!1516)))))

(assert (=> b!482991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(declare-fun b!482992 () Bool)

(declare-fun e!284226 () Bool)

(assert (=> b!482992 (= e!284226 (= (apply!344 lt!218959 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!482993 () Bool)

(assert (=> b!482993 (= e!284232 e!284226)))

(declare-fun res!287846 () Bool)

(assert (=> b!482993 (= res!287846 call!31002)))

(assert (=> b!482993 (=> (not res!287846) (not e!284226))))

(declare-fun b!482994 () Bool)

(declare-fun res!287854 () Bool)

(assert (=> b!482994 (=> (not res!287854) (not e!284235))))

(declare-fun e!284224 () Bool)

(assert (=> b!482994 (= res!287854 e!284224)))

(declare-fun res!287848 () Bool)

(assert (=> b!482994 (=> res!287848 e!284224)))

(assert (=> b!482994 (= res!287848 (not e!284228))))

(declare-fun res!287847 () Bool)

(assert (=> b!482994 (=> (not res!287847) (not e!284228))))

(assert (=> b!482994 (= res!287847 (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(declare-fun b!482995 () Bool)

(assert (=> b!482995 (= e!284230 call!31001)))

(declare-fun bm!30999 () Bool)

(assert (=> bm!30999 (= call!31002 (contains!2663 lt!218959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!76861 () Bool)

(assert (=> d!76861 e!284235))

(declare-fun res!287851 () Bool)

(assert (=> d!76861 (=> (not res!287851) (not e!284235))))

(assert (=> d!76861 (= res!287851 (or (bvsge #b00000000000000000000000000000000 (size!15440 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)))))))

(declare-fun lt!218949 () ListLongMap!8065)

(assert (=> d!76861 (= lt!218959 lt!218949)))

(declare-fun lt!218950 () Unit!14158)

(assert (=> d!76861 (= lt!218950 e!284229)))

(declare-fun c!58039 () Bool)

(assert (=> d!76861 (= c!58039 e!284234)))

(declare-fun res!287849 () Bool)

(assert (=> d!76861 (=> (not res!287849) (not e!284234))))

(assert (=> d!76861 (= res!287849 (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(assert (=> d!76861 (= lt!218949 e!284225)))

(assert (=> d!76861 (= c!58043 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76861 (validMask!0 mask!2352)))

(assert (=> d!76861 (= (getCurrentListMap!2367 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218959)))

(declare-fun b!482996 () Bool)

(assert (=> b!482996 (= e!284231 (not call!31005))))

(declare-fun bm!31002 () Bool)

(assert (=> bm!31002 (= call!31000 call!30999)))

(declare-fun b!482997 () Bool)

(assert (=> b!482997 (= e!284224 e!284233)))

(declare-fun res!287850 () Bool)

(assert (=> b!482997 (=> (not res!287850) (not e!284233))))

(assert (=> b!482997 (= res!287850 (contains!2663 lt!218959 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(assert (= (and d!76861 c!58043) b!482984))

(assert (= (and d!76861 (not c!58043)) b!482981))

(assert (= (and b!482981 c!58042) b!482995))

(assert (= (and b!482981 (not c!58042)) b!482979))

(assert (= (and b!482979 c!58044) b!482986))

(assert (= (and b!482979 (not c!58044)) b!482983))

(assert (= (or b!482986 b!482983) bm!31001))

(assert (= (or b!482995 bm!31001) bm!31002))

(assert (= (or b!482995 b!482986) bm!31000))

(assert (= (or b!482984 bm!31002) bm!30996))

(assert (= (or b!482984 bm!31000) bm!30998))

(assert (= (and d!76861 res!287849) b!482989))

(assert (= (and d!76861 c!58039) b!482977))

(assert (= (and d!76861 (not c!58039)) b!482987))

(assert (= (and d!76861 res!287851) b!482994))

(assert (= (and b!482994 res!287847) b!482980))

(assert (= (and b!482994 (not res!287848)) b!482997))

(assert (= (and b!482997 res!287850) b!482991))

(assert (= (and b!482994 res!287854) b!482982))

(assert (= (and b!482982 c!58041) b!482993))

(assert (= (and b!482982 (not c!58041)) b!482985))

(assert (= (and b!482993 res!287846) b!482992))

(assert (= (or b!482993 b!482985) bm!30999))

(assert (= (and b!482982 res!287853) b!482988))

(assert (= (and b!482988 c!58040) b!482978))

(assert (= (and b!482988 (not c!58040)) b!482996))

(assert (= (and b!482978 res!287852) b!482990))

(assert (= (or b!482978 b!482996) bm!30997))

(declare-fun b_lambda!10811 () Bool)

(assert (=> (not b_lambda!10811) (not b!482991)))

(declare-fun t!15453 () Bool)

(declare-fun tb!4169 () Bool)

(assert (=> (and start!43582 (= defaultEntry!1519 defaultEntry!1519) t!15453) tb!4169))

(declare-fun result!7775 () Bool)

(assert (=> tb!4169 (= result!7775 tp_is_empty!13851)))

(assert (=> b!482991 t!15453))

(declare-fun b_and!21105 () Bool)

(assert (= b_and!21101 (and (=> t!15453 result!7775) b_and!21105)))

(assert (=> b!482980 m!464045))

(assert (=> b!482980 m!464045))

(declare-fun m!464059 () Bool)

(assert (=> b!482980 m!464059))

(declare-fun m!464061 () Bool)

(assert (=> b!482977 m!464061))

(declare-fun m!464063 () Bool)

(assert (=> b!482977 m!464063))

(declare-fun m!464065 () Bool)

(assert (=> b!482977 m!464065))

(declare-fun m!464067 () Bool)

(assert (=> b!482977 m!464067))

(declare-fun m!464069 () Bool)

(assert (=> b!482977 m!464069))

(declare-fun m!464071 () Bool)

(assert (=> b!482977 m!464071))

(declare-fun m!464073 () Bool)

(assert (=> b!482977 m!464073))

(declare-fun m!464075 () Bool)

(assert (=> b!482977 m!464075))

(assert (=> b!482977 m!464045))

(declare-fun m!464077 () Bool)

(assert (=> b!482977 m!464077))

(assert (=> b!482977 m!464063))

(declare-fun m!464079 () Bool)

(assert (=> b!482977 m!464079))

(declare-fun m!464081 () Bool)

(assert (=> b!482977 m!464081))

(assert (=> b!482977 m!464075))

(declare-fun m!464083 () Bool)

(assert (=> b!482977 m!464083))

(declare-fun m!464085 () Bool)

(assert (=> b!482977 m!464085))

(declare-fun m!464087 () Bool)

(assert (=> b!482977 m!464087))

(assert (=> b!482977 m!464085))

(declare-fun m!464089 () Bool)

(assert (=> b!482977 m!464089))

(assert (=> b!482977 m!464081))

(declare-fun m!464091 () Bool)

(assert (=> b!482977 m!464091))

(declare-fun m!464093 () Bool)

(assert (=> b!482984 m!464093))

(assert (=> b!482997 m!464045))

(assert (=> b!482997 m!464045))

(declare-fun m!464095 () Bool)

(assert (=> b!482997 m!464095))

(assert (=> d!76861 m!463999))

(declare-fun m!464097 () Bool)

(assert (=> b!482991 m!464097))

(declare-fun m!464099 () Bool)

(assert (=> b!482991 m!464099))

(assert (=> b!482991 m!464099))

(assert (=> b!482991 m!464097))

(declare-fun m!464101 () Bool)

(assert (=> b!482991 m!464101))

(assert (=> b!482991 m!464045))

(declare-fun m!464103 () Bool)

(assert (=> b!482991 m!464103))

(assert (=> b!482991 m!464045))

(declare-fun m!464105 () Bool)

(assert (=> b!482992 m!464105))

(assert (=> b!482989 m!464045))

(assert (=> b!482989 m!464045))

(assert (=> b!482989 m!464059))

(declare-fun m!464107 () Bool)

(assert (=> bm!30997 m!464107))

(declare-fun m!464109 () Bool)

(assert (=> b!482990 m!464109))

(declare-fun m!464111 () Bool)

(assert (=> bm!30998 m!464111))

(declare-fun m!464113 () Bool)

(assert (=> bm!30999 m!464113))

(assert (=> bm!30996 m!464069))

(assert (=> b!482874 d!76861))

(declare-fun d!76863 () Bool)

(assert (=> d!76863 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43582 d!76863))

(declare-fun d!76865 () Bool)

(assert (=> d!76865 (= (array_inv!10880 _values!1516) (bvsge (size!15441 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43582 d!76865))

(declare-fun d!76867 () Bool)

(assert (=> d!76867 (= (array_inv!10881 _keys!1874) (bvsge (size!15440 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43582 d!76867))

(declare-fun b!483008 () Bool)

(declare-fun e!284243 () Bool)

(declare-fun call!31008 () Bool)

(assert (=> b!483008 (= e!284243 call!31008)))

(declare-fun d!76869 () Bool)

(declare-fun res!287860 () Bool)

(declare-fun e!284244 () Bool)

(assert (=> d!76869 (=> res!287860 e!284244)))

(assert (=> d!76869 (= res!287860 (bvsge #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(assert (=> d!76869 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284244)))

(declare-fun bm!31005 () Bool)

(assert (=> bm!31005 (= call!31008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!483009 () Bool)

(declare-fun e!284242 () Bool)

(assert (=> b!483009 (= e!284242 e!284243)))

(declare-fun lt!218970 () (_ BitVec 64))

(assert (=> b!483009 (= lt!218970 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218971 () Unit!14158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31361 (_ BitVec 64) (_ BitVec 32)) Unit!14158)

(assert (=> b!483009 (= lt!218971 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218970 #b00000000000000000000000000000000))))

(assert (=> b!483009 (arrayContainsKey!0 _keys!1874 lt!218970 #b00000000000000000000000000000000)))

(declare-fun lt!218969 () Unit!14158)

(assert (=> b!483009 (= lt!218969 lt!218971)))

(declare-fun res!287859 () Bool)

(declare-datatypes ((SeekEntryResult!3573 0))(
  ( (MissingZero!3573 (index!16471 (_ BitVec 32))) (Found!3573 (index!16472 (_ BitVec 32))) (Intermediate!3573 (undefined!4385 Bool) (index!16473 (_ BitVec 32)) (x!45361 (_ BitVec 32))) (Undefined!3573) (MissingVacant!3573 (index!16474 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31361 (_ BitVec 32)) SeekEntryResult!3573)

(assert (=> b!483009 (= res!287859 (= (seekEntryOrOpen!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3573 #b00000000000000000000000000000000)))))

(assert (=> b!483009 (=> (not res!287859) (not e!284243))))

(declare-fun b!483010 () Bool)

(assert (=> b!483010 (= e!284242 call!31008)))

(declare-fun b!483011 () Bool)

(assert (=> b!483011 (= e!284244 e!284242)))

(declare-fun c!58047 () Bool)

(assert (=> b!483011 (= c!58047 (validKeyInArray!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76869 (not res!287860)) b!483011))

(assert (= (and b!483011 c!58047) b!483009))

(assert (= (and b!483011 (not c!58047)) b!483010))

(assert (= (and b!483009 res!287859) b!483008))

(assert (= (or b!483008 b!483010) bm!31005))

(declare-fun m!464115 () Bool)

(assert (=> bm!31005 m!464115))

(assert (=> b!483009 m!464045))

(declare-fun m!464117 () Bool)

(assert (=> b!483009 m!464117))

(declare-fun m!464119 () Bool)

(assert (=> b!483009 m!464119))

(assert (=> b!483009 m!464045))

(declare-fun m!464121 () Bool)

(assert (=> b!483009 m!464121))

(assert (=> b!483011 m!464045))

(assert (=> b!483011 m!464045))

(assert (=> b!483011 m!464059))

(assert (=> b!482879 d!76869))

(declare-fun bm!31008 () Bool)

(declare-fun call!31011 () Bool)

(declare-fun c!58050 () Bool)

(assert (=> bm!31008 (= call!31011 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58050 (Cons!9230 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000) Nil!9231) Nil!9231)))))

(declare-fun b!483022 () Bool)

(declare-fun e!284254 () Bool)

(declare-fun e!284256 () Bool)

(assert (=> b!483022 (= e!284254 e!284256)))

(assert (=> b!483022 (= c!58050 (validKeyInArray!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483023 () Bool)

(assert (=> b!483023 (= e!284256 call!31011)))

(declare-fun b!483024 () Bool)

(assert (=> b!483024 (= e!284256 call!31011)))

(declare-fun d!76871 () Bool)

(declare-fun res!287869 () Bool)

(declare-fun e!284255 () Bool)

(assert (=> d!76871 (=> res!287869 e!284255)))

(assert (=> d!76871 (= res!287869 (bvsge #b00000000000000000000000000000000 (size!15440 _keys!1874)))))

(assert (=> d!76871 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9231) e!284255)))

(declare-fun b!483025 () Bool)

(declare-fun e!284253 () Bool)

(declare-fun contains!2665 (List!9234 (_ BitVec 64)) Bool)

(assert (=> b!483025 (= e!284253 (contains!2665 Nil!9231 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483026 () Bool)

(assert (=> b!483026 (= e!284255 e!284254)))

(declare-fun res!287867 () Bool)

(assert (=> b!483026 (=> (not res!287867) (not e!284254))))

(assert (=> b!483026 (= res!287867 (not e!284253))))

(declare-fun res!287868 () Bool)

(assert (=> b!483026 (=> (not res!287868) (not e!284253))))

(assert (=> b!483026 (= res!287868 (validKeyInArray!0 (select (arr!15082 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76871 (not res!287869)) b!483026))

(assert (= (and b!483026 res!287868) b!483025))

(assert (= (and b!483026 res!287867) b!483022))

(assert (= (and b!483022 c!58050) b!483024))

(assert (= (and b!483022 (not c!58050)) b!483023))

(assert (= (or b!483024 b!483023) bm!31008))

(assert (=> bm!31008 m!464045))

(declare-fun m!464123 () Bool)

(assert (=> bm!31008 m!464123))

(assert (=> b!483022 m!464045))

(assert (=> b!483022 m!464045))

(assert (=> b!483022 m!464059))

(assert (=> b!483025 m!464045))

(assert (=> b!483025 m!464045))

(declare-fun m!464125 () Bool)

(assert (=> b!483025 m!464125))

(assert (=> b!483026 m!464045))

(assert (=> b!483026 m!464045))

(assert (=> b!483026 m!464059))

(assert (=> b!482880 d!76871))

(declare-fun d!76873 () Bool)

(declare-fun res!287874 () Bool)

(declare-fun e!284261 () Bool)

(assert (=> d!76873 (=> res!287874 e!284261)))

(assert (=> d!76873 (= res!287874 (= (select (arr!15082 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76873 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284261)))

(declare-fun b!483031 () Bool)

(declare-fun e!284262 () Bool)

(assert (=> b!483031 (= e!284261 e!284262)))

(declare-fun res!287875 () Bool)

(assert (=> b!483031 (=> (not res!287875) (not e!284262))))

(assert (=> b!483031 (= res!287875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15440 _keys!1874)))))

(declare-fun b!483032 () Bool)

(assert (=> b!483032 (= e!284262 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76873 (not res!287874)) b!483031))

(assert (= (and b!483031 res!287875) b!483032))

(assert (=> d!76873 m!464045))

(declare-fun m!464127 () Bool)

(assert (=> b!483032 m!464127))

(assert (=> b!482871 d!76873))

(declare-fun b!483040 () Bool)

(declare-fun e!284268 () Bool)

(assert (=> b!483040 (= e!284268 tp_is_empty!13851)))

(declare-fun condMapEmpty!22495 () Bool)

(declare-fun mapDefault!22495 () ValueCell!6564)

(assert (=> mapNonEmpty!22489 (= condMapEmpty!22495 (= mapRest!22489 ((as const (Array (_ BitVec 32) ValueCell!6564)) mapDefault!22495)))))

(declare-fun mapRes!22495 () Bool)

(assert (=> mapNonEmpty!22489 (= tp!43302 (and e!284268 mapRes!22495))))

(declare-fun mapNonEmpty!22495 () Bool)

(declare-fun tp!43312 () Bool)

(declare-fun e!284267 () Bool)

(assert (=> mapNonEmpty!22495 (= mapRes!22495 (and tp!43312 e!284267))))

(declare-fun mapValue!22495 () ValueCell!6564)

(declare-fun mapKey!22495 () (_ BitVec 32))

(declare-fun mapRest!22495 () (Array (_ BitVec 32) ValueCell!6564))

(assert (=> mapNonEmpty!22495 (= mapRest!22489 (store mapRest!22495 mapKey!22495 mapValue!22495))))

(declare-fun b!483039 () Bool)

(assert (=> b!483039 (= e!284267 tp_is_empty!13851)))

(declare-fun mapIsEmpty!22495 () Bool)

(assert (=> mapIsEmpty!22495 mapRes!22495))

(assert (= (and mapNonEmpty!22489 condMapEmpty!22495) mapIsEmpty!22495))

(assert (= (and mapNonEmpty!22489 (not condMapEmpty!22495)) mapNonEmpty!22495))

(assert (= (and mapNonEmpty!22495 ((_ is ValueCellFull!6564) mapValue!22495)) b!483039))

(assert (= (and mapNonEmpty!22489 ((_ is ValueCellFull!6564) mapDefault!22495)) b!483040))

(declare-fun m!464129 () Bool)

(assert (=> mapNonEmpty!22495 m!464129))

(declare-fun b_lambda!10813 () Bool)

(assert (= b_lambda!10811 (or (and start!43582 b_free!12339) b_lambda!10813)))

(check-sat (not d!76857) (not bm!30999) (not b!482924) (not b_lambda!10813) (not b!483026) (not bm!30996) (not bm!31005) (not b!482990) (not b!482934) (not b!483032) (not b!483022) (not d!76861) (not b_next!12339) (not b!482932) (not b!483011) (not bm!30997) (not b!482919) (not mapNonEmpty!22495) (not d!76859) (not b!482991) (not b!482997) (not bm!31008) b_and!21105 (not b!483025) (not b!482989) (not b!482992) (not bm!30998) (not b!482977) (not b!482980) (not b!482984) (not b!483009) tp_is_empty!13851)
(check-sat b_and!21105 (not b_next!12339))
