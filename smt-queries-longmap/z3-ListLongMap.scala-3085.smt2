; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43412 () Bool)

(assert start!43412)

(declare-fun b_free!12229 () Bool)

(declare-fun b_next!12229 () Bool)

(assert (=> start!43412 (= b_free!12229 (not b_next!12229))))

(declare-fun tp!42967 () Bool)

(declare-fun b_and!20997 () Bool)

(assert (=> start!43412 (= tp!42967 b_and!20997)))

(declare-fun b!481060 () Bool)

(declare-fun e!283045 () Bool)

(declare-fun tp_is_empty!13741 () Bool)

(assert (=> b!481060 (= e!283045 tp_is_empty!13741)))

(declare-fun b!481061 () Bool)

(declare-fun e!283043 () Bool)

(declare-fun e!283046 () Bool)

(declare-fun mapRes!22318 () Bool)

(assert (=> b!481061 (= e!283043 (and e!283046 mapRes!22318))))

(declare-fun condMapEmpty!22318 () Bool)

(declare-datatypes ((V!19393 0))(
  ( (V!19394 (val!6918 Int)) )
))
(declare-datatypes ((ValueCell!6509 0))(
  ( (ValueCellFull!6509 (v!9211 V!19393)) (EmptyCell!6509) )
))
(declare-datatypes ((array!31134 0))(
  ( (array!31135 (arr!14970 (Array (_ BitVec 32) ValueCell!6509)) (size!15328 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31134)

(declare-fun mapDefault!22318 () ValueCell!6509)

(assert (=> b!481061 (= condMapEmpty!22318 (= (arr!14970 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6509)) mapDefault!22318)))))

(declare-fun b!481062 () Bool)

(declare-fun res!286862 () Bool)

(declare-fun e!283047 () Bool)

(assert (=> b!481062 (=> (not res!286862) (not e!283047))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481062 (= res!286862 (validKeyInArray!0 k0!1332))))

(declare-fun b!481063 () Bool)

(declare-fun res!286864 () Bool)

(assert (=> b!481063 (=> (not res!286864) (not e!283047))))

(declare-datatypes ((array!31136 0))(
  ( (array!31137 (arr!14971 (Array (_ BitVec 32) (_ BitVec 64))) (size!15329 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31136)

(declare-datatypes ((List!9063 0))(
  ( (Nil!9060) (Cons!9059 (h!9915 (_ BitVec 64)) (t!15267 List!9063)) )
))
(declare-fun arrayNoDuplicates!0 (array!31136 (_ BitVec 32) List!9063) Bool)

(assert (=> b!481063 (= res!286864 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9060))))

(declare-fun mapNonEmpty!22318 () Bool)

(declare-fun tp!42966 () Bool)

(assert (=> mapNonEmpty!22318 (= mapRes!22318 (and tp!42966 e!283045))))

(declare-fun mapRest!22318 () (Array (_ BitVec 32) ValueCell!6509))

(declare-fun mapValue!22318 () ValueCell!6509)

(declare-fun mapKey!22318 () (_ BitVec 32))

(assert (=> mapNonEmpty!22318 (= (arr!14970 _values!1516) (store mapRest!22318 mapKey!22318 mapValue!22318))))

(declare-fun b!481064 () Bool)

(declare-fun res!286863 () Bool)

(assert (=> b!481064 (=> (not res!286863) (not e!283047))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31136 (_ BitVec 32)) Bool)

(assert (=> b!481064 (= res!286863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481065 () Bool)

(declare-fun lt!218391 () (_ BitVec 32))

(assert (=> b!481065 (= e!283047 (not (or (not (= (size!15329 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvslt lt!218391 #b00000000000000000000000000000000) (bvsle lt!218391 (size!15329 _keys!1874)))))))

(assert (=> b!481065 (arrayForallSeekEntryOrOpenFound!0 lt!218391 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14079 0))(
  ( (Unit!14080) )
))
(declare-fun lt!218392 () Unit!14079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14079)

(assert (=> b!481065 (= lt!218392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218391))))

(declare-fun arrayScanForKey!0 (array!31136 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481065 (= lt!218391 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283044 () Bool)

(assert (=> b!481065 e!283044))

(declare-fun c!57836 () Bool)

(assert (=> b!481065 (= c!57836 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19393)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19393)

(declare-fun lt!218390 () Unit!14079)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!132 (array!31136 array!31134 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 64) Int) Unit!14079)

(assert (=> b!481065 (= lt!218390 (lemmaKeyInListMapIsInArray!132 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481067 () Bool)

(declare-fun res!286867 () Bool)

(assert (=> b!481067 (=> (not res!286867) (not e!283047))))

(assert (=> b!481067 (= res!286867 (and (= (size!15328 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15329 _keys!1874) (size!15328 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481068 () Bool)

(assert (=> b!481068 (= e!283044 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481069 () Bool)

(declare-fun arrayContainsKey!0 (array!31136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481069 (= e!283044 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22318 () Bool)

(assert (=> mapIsEmpty!22318 mapRes!22318))

(declare-fun b!481070 () Bool)

(declare-fun res!286865 () Bool)

(assert (=> b!481070 (=> (not res!286865) (not e!283047))))

(declare-datatypes ((tuple2!8994 0))(
  ( (tuple2!8995 (_1!4508 (_ BitVec 64)) (_2!4508 V!19393)) )
))
(declare-datatypes ((List!9064 0))(
  ( (Nil!9061) (Cons!9060 (h!9916 tuple2!8994) (t!15268 List!9064)) )
))
(declare-datatypes ((ListLongMap!7909 0))(
  ( (ListLongMap!7910 (toList!3970 List!9064)) )
))
(declare-fun contains!2601 (ListLongMap!7909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2284 (array!31136 array!31134 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 32) Int) ListLongMap!7909)

(assert (=> b!481070 (= res!286865 (contains!2601 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!286866 () Bool)

(assert (=> start!43412 (=> (not res!286866) (not e!283047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43412 (= res!286866 (validMask!0 mask!2352))))

(assert (=> start!43412 e!283047))

(assert (=> start!43412 true))

(assert (=> start!43412 tp_is_empty!13741))

(declare-fun array_inv!10870 (array!31134) Bool)

(assert (=> start!43412 (and (array_inv!10870 _values!1516) e!283043)))

(assert (=> start!43412 tp!42967))

(declare-fun array_inv!10871 (array!31136) Bool)

(assert (=> start!43412 (array_inv!10871 _keys!1874)))

(declare-fun b!481066 () Bool)

(assert (=> b!481066 (= e!283046 tp_is_empty!13741)))

(assert (= (and start!43412 res!286866) b!481067))

(assert (= (and b!481067 res!286867) b!481064))

(assert (= (and b!481064 res!286863) b!481063))

(assert (= (and b!481063 res!286864) b!481070))

(assert (= (and b!481070 res!286865) b!481062))

(assert (= (and b!481062 res!286862) b!481065))

(assert (= (and b!481065 c!57836) b!481069))

(assert (= (and b!481065 (not c!57836)) b!481068))

(assert (= (and b!481061 condMapEmpty!22318) mapIsEmpty!22318))

(assert (= (and b!481061 (not condMapEmpty!22318)) mapNonEmpty!22318))

(get-info :version)

(assert (= (and mapNonEmpty!22318 ((_ is ValueCellFull!6509) mapValue!22318)) b!481060))

(assert (= (and b!481061 ((_ is ValueCellFull!6509) mapDefault!22318)) b!481066))

(assert (= start!43412 b!481061))

(declare-fun m!462811 () Bool)

(assert (=> start!43412 m!462811))

(declare-fun m!462813 () Bool)

(assert (=> start!43412 m!462813))

(declare-fun m!462815 () Bool)

(assert (=> start!43412 m!462815))

(declare-fun m!462817 () Bool)

(assert (=> mapNonEmpty!22318 m!462817))

(declare-fun m!462819 () Bool)

(assert (=> b!481064 m!462819))

(declare-fun m!462821 () Bool)

(assert (=> b!481069 m!462821))

(declare-fun m!462823 () Bool)

(assert (=> b!481070 m!462823))

(assert (=> b!481070 m!462823))

(declare-fun m!462825 () Bool)

(assert (=> b!481070 m!462825))

(declare-fun m!462827 () Bool)

(assert (=> b!481065 m!462827))

(declare-fun m!462829 () Bool)

(assert (=> b!481065 m!462829))

(declare-fun m!462831 () Bool)

(assert (=> b!481065 m!462831))

(declare-fun m!462833 () Bool)

(assert (=> b!481065 m!462833))

(declare-fun m!462835 () Bool)

(assert (=> b!481062 m!462835))

(declare-fun m!462837 () Bool)

(assert (=> b!481063 m!462837))

(check-sat tp_is_empty!13741 (not b!481070) (not mapNonEmpty!22318) (not b!481065) (not b!481063) (not start!43412) (not b!481062) (not b!481069) (not b_next!12229) b_and!20997 (not b!481064))
(check-sat b_and!20997 (not b_next!12229))
(get-model)

(declare-fun b!481145 () Bool)

(declare-fun e!283090 () Bool)

(declare-fun e!283092 () Bool)

(assert (=> b!481145 (= e!283090 e!283092)))

(declare-fun c!57845 () Bool)

(assert (=> b!481145 (= c!57845 (validKeyInArray!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481146 () Bool)

(declare-fun e!283091 () Bool)

(assert (=> b!481146 (= e!283092 e!283091)))

(declare-fun lt!218417 () (_ BitVec 64))

(assert (=> b!481146 (= lt!218417 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218418 () Unit!14079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31136 (_ BitVec 64) (_ BitVec 32)) Unit!14079)

(assert (=> b!481146 (= lt!218418 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218417 #b00000000000000000000000000000000))))

(assert (=> b!481146 (arrayContainsKey!0 _keys!1874 lt!218417 #b00000000000000000000000000000000)))

(declare-fun lt!218419 () Unit!14079)

(assert (=> b!481146 (= lt!218419 lt!218418)))

(declare-fun res!286909 () Bool)

(declare-datatypes ((SeekEntryResult!3520 0))(
  ( (MissingZero!3520 (index!16259 (_ BitVec 32))) (Found!3520 (index!16260 (_ BitVec 32))) (Intermediate!3520 (undefined!4332 Bool) (index!16261 (_ BitVec 32)) (x!45141 (_ BitVec 32))) (Undefined!3520) (MissingVacant!3520 (index!16262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31136 (_ BitVec 32)) SeekEntryResult!3520)

(assert (=> b!481146 (= res!286909 (= (seekEntryOrOpen!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3520 #b00000000000000000000000000000000)))))

(assert (=> b!481146 (=> (not res!286909) (not e!283091))))

(declare-fun b!481147 () Bool)

(declare-fun call!30918 () Bool)

(assert (=> b!481147 (= e!283092 call!30918)))

(declare-fun bm!30915 () Bool)

(assert (=> bm!30915 (= call!30918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!481148 () Bool)

(assert (=> b!481148 (= e!283091 call!30918)))

(declare-fun d!76797 () Bool)

(declare-fun res!286908 () Bool)

(assert (=> d!76797 (=> res!286908 e!283090)))

(assert (=> d!76797 (= res!286908 (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!283090)))

(assert (= (and d!76797 (not res!286908)) b!481145))

(assert (= (and b!481145 c!57845) b!481146))

(assert (= (and b!481145 (not c!57845)) b!481147))

(assert (= (and b!481146 res!286909) b!481148))

(assert (= (or b!481148 b!481147) bm!30915))

(declare-fun m!462895 () Bool)

(assert (=> b!481145 m!462895))

(assert (=> b!481145 m!462895))

(declare-fun m!462897 () Bool)

(assert (=> b!481145 m!462897))

(assert (=> b!481146 m!462895))

(declare-fun m!462899 () Bool)

(assert (=> b!481146 m!462899))

(declare-fun m!462901 () Bool)

(assert (=> b!481146 m!462901))

(assert (=> b!481146 m!462895))

(declare-fun m!462903 () Bool)

(assert (=> b!481146 m!462903))

(declare-fun m!462905 () Bool)

(assert (=> bm!30915 m!462905))

(assert (=> b!481064 d!76797))

(declare-fun d!76799 () Bool)

(declare-fun res!286914 () Bool)

(declare-fun e!283097 () Bool)

(assert (=> d!76799 (=> res!286914 e!283097)))

(assert (=> d!76799 (= res!286914 (= (select (arr!14971 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76799 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!283097)))

(declare-fun b!481153 () Bool)

(declare-fun e!283098 () Bool)

(assert (=> b!481153 (= e!283097 e!283098)))

(declare-fun res!286915 () Bool)

(assert (=> b!481153 (=> (not res!286915) (not e!283098))))

(assert (=> b!481153 (= res!286915 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15329 _keys!1874)))))

(declare-fun b!481154 () Bool)

(assert (=> b!481154 (= e!283098 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76799 (not res!286914)) b!481153))

(assert (= (and b!481153 res!286915) b!481154))

(assert (=> d!76799 m!462895))

(declare-fun m!462907 () Bool)

(assert (=> b!481154 m!462907))

(assert (=> b!481069 d!76799))

(declare-fun d!76801 () Bool)

(declare-fun e!283103 () Bool)

(assert (=> d!76801 e!283103))

(declare-fun res!286918 () Bool)

(assert (=> d!76801 (=> res!286918 e!283103)))

(declare-fun lt!218430 () Bool)

(assert (=> d!76801 (= res!286918 (not lt!218430))))

(declare-fun lt!218431 () Bool)

(assert (=> d!76801 (= lt!218430 lt!218431)))

(declare-fun lt!218429 () Unit!14079)

(declare-fun e!283104 () Unit!14079)

(assert (=> d!76801 (= lt!218429 e!283104)))

(declare-fun c!57848 () Bool)

(assert (=> d!76801 (= c!57848 lt!218431)))

(declare-fun containsKey!357 (List!9064 (_ BitVec 64)) Bool)

(assert (=> d!76801 (= lt!218431 (containsKey!357 (toList!3970 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76801 (= (contains!2601 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218430)))

(declare-fun b!481161 () Bool)

(declare-fun lt!218428 () Unit!14079)

(assert (=> b!481161 (= e!283104 lt!218428)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!305 (List!9064 (_ BitVec 64)) Unit!14079)

(assert (=> b!481161 (= lt!218428 (lemmaContainsKeyImpliesGetValueByKeyDefined!305 (toList!3970 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!402 0))(
  ( (Some!401 (v!9214 V!19393)) (None!400) )
))
(declare-fun isDefined!306 (Option!402) Bool)

(declare-fun getValueByKey!396 (List!9064 (_ BitVec 64)) Option!402)

(assert (=> b!481161 (isDefined!306 (getValueByKey!396 (toList!3970 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!481162 () Bool)

(declare-fun Unit!14081 () Unit!14079)

(assert (=> b!481162 (= e!283104 Unit!14081)))

(declare-fun b!481163 () Bool)

(assert (=> b!481163 (= e!283103 (isDefined!306 (getValueByKey!396 (toList!3970 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76801 c!57848) b!481161))

(assert (= (and d!76801 (not c!57848)) b!481162))

(assert (= (and d!76801 (not res!286918)) b!481163))

(declare-fun m!462909 () Bool)

(assert (=> d!76801 m!462909))

(declare-fun m!462911 () Bool)

(assert (=> b!481161 m!462911))

(declare-fun m!462913 () Bool)

(assert (=> b!481161 m!462913))

(assert (=> b!481161 m!462913))

(declare-fun m!462915 () Bool)

(assert (=> b!481161 m!462915))

(assert (=> b!481163 m!462913))

(assert (=> b!481163 m!462913))

(assert (=> b!481163 m!462915))

(assert (=> b!481070 d!76801))

(declare-fun b!481206 () Bool)

(declare-fun e!283141 () Bool)

(assert (=> b!481206 (= e!283141 (validKeyInArray!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30930 () Bool)

(declare-fun call!30933 () ListLongMap!7909)

(declare-fun call!30934 () ListLongMap!7909)

(assert (=> bm!30930 (= call!30933 call!30934)))

(declare-fun b!481207 () Bool)

(declare-fun e!283138 () ListLongMap!7909)

(declare-fun call!30938 () ListLongMap!7909)

(assert (=> b!481207 (= e!283138 call!30938)))

(declare-fun b!481208 () Bool)

(declare-fun e!283143 () ListLongMap!7909)

(declare-fun call!30936 () ListLongMap!7909)

(declare-fun +!1781 (ListLongMap!7909 tuple2!8994) ListLongMap!7909)

(assert (=> b!481208 (= e!283143 (+!1781 call!30936 (tuple2!8995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!481209 () Bool)

(declare-fun e!283139 () Bool)

(declare-fun e!283137 () Bool)

(assert (=> b!481209 (= e!283139 e!283137)))

(declare-fun c!57862 () Bool)

(assert (=> b!481209 (= c!57862 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!481210 () Bool)

(declare-fun e!283140 () Bool)

(assert (=> b!481210 (= e!283137 e!283140)))

(declare-fun res!286945 () Bool)

(declare-fun call!30937 () Bool)

(assert (=> b!481210 (= res!286945 call!30937)))

(assert (=> b!481210 (=> (not res!286945) (not e!283140))))

(declare-fun b!481211 () Bool)

(declare-fun c!57861 () Bool)

(assert (=> b!481211 (= c!57861 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!283142 () ListLongMap!7909)

(assert (=> b!481211 (= e!283138 e!283142)))

(declare-fun b!481212 () Bool)

(declare-fun e!283135 () Bool)

(declare-fun lt!218484 () ListLongMap!7909)

(declare-fun apply!342 (ListLongMap!7909 (_ BitVec 64)) V!19393)

(assert (=> b!481212 (= e!283135 (= (apply!342 lt!218484 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!481213 () Bool)

(assert (=> b!481213 (= e!283140 (= (apply!342 lt!218484 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!481214 () Bool)

(assert (=> b!481214 (= e!283143 e!283138)))

(declare-fun c!57865 () Bool)

(assert (=> b!481214 (= c!57865 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!481215 () Bool)

(declare-fun e!283134 () Bool)

(declare-fun e!283132 () Bool)

(assert (=> b!481215 (= e!283134 e!283132)))

(declare-fun res!286939 () Bool)

(assert (=> b!481215 (=> (not res!286939) (not e!283132))))

(assert (=> b!481215 (= res!286939 (contains!2601 lt!218484 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!481215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun bm!30931 () Bool)

(declare-fun call!30935 () ListLongMap!7909)

(assert (=> bm!30931 (= call!30934 call!30935)))

(declare-fun bm!30932 () Bool)

(declare-fun call!30939 () Bool)

(assert (=> bm!30932 (= call!30939 (contains!2601 lt!218484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!57863 () Bool)

(declare-fun bm!30933 () Bool)

(assert (=> bm!30933 (= call!30936 (+!1781 (ite c!57863 call!30935 (ite c!57865 call!30934 call!30933)) (ite (or c!57863 c!57865) (tuple2!8995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!8995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!481216 () Bool)

(assert (=> b!481216 (= e!283142 call!30938)))

(declare-fun b!481217 () Bool)

(assert (=> b!481217 (= e!283142 call!30933)))

(declare-fun b!481218 () Bool)

(declare-fun res!286938 () Bool)

(assert (=> b!481218 (=> (not res!286938) (not e!283139))))

(assert (=> b!481218 (= res!286938 e!283134)))

(declare-fun res!286942 () Bool)

(assert (=> b!481218 (=> res!286942 e!283134)))

(assert (=> b!481218 (= res!286942 (not e!283141))))

(declare-fun res!286940 () Bool)

(assert (=> b!481218 (=> (not res!286940) (not e!283141))))

(assert (=> b!481218 (= res!286940 (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun b!481219 () Bool)

(declare-fun e!283133 () Bool)

(assert (=> b!481219 (= e!283133 (validKeyInArray!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30934 () Bool)

(assert (=> bm!30934 (= call!30937 (contains!2601 lt!218484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481220 () Bool)

(declare-fun e!283136 () Unit!14079)

(declare-fun Unit!14082 () Unit!14079)

(assert (=> b!481220 (= e!283136 Unit!14082)))

(declare-fun d!76803 () Bool)

(assert (=> d!76803 e!283139))

(declare-fun res!286937 () Bool)

(assert (=> d!76803 (=> (not res!286937) (not e!283139))))

(assert (=> d!76803 (= res!286937 (or (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))))

(declare-fun lt!218482 () ListLongMap!7909)

(assert (=> d!76803 (= lt!218484 lt!218482)))

(declare-fun lt!218490 () Unit!14079)

(assert (=> d!76803 (= lt!218490 e!283136)))

(declare-fun c!57866 () Bool)

(assert (=> d!76803 (= c!57866 e!283133)))

(declare-fun res!286944 () Bool)

(assert (=> d!76803 (=> (not res!286944) (not e!283133))))

(assert (=> d!76803 (= res!286944 (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76803 (= lt!218482 e!283143)))

(assert (=> d!76803 (= c!57863 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76803 (validMask!0 mask!2352)))

(assert (=> d!76803 (= (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218484)))

(declare-fun b!481221 () Bool)

(declare-fun res!286941 () Bool)

(assert (=> b!481221 (=> (not res!286941) (not e!283139))))

(declare-fun e!283131 () Bool)

(assert (=> b!481221 (= res!286941 e!283131)))

(declare-fun c!57864 () Bool)

(assert (=> b!481221 (= c!57864 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30935 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2126 (array!31136 array!31134 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 32) Int) ListLongMap!7909)

(assert (=> bm!30935 (= call!30935 (getCurrentListMapNoExtraKeys!2126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!481222 () Bool)

(assert (=> b!481222 (= e!283137 (not call!30937))))

(declare-fun b!481223 () Bool)

(assert (=> b!481223 (= e!283131 (not call!30939))))

(declare-fun b!481224 () Bool)

(declare-fun get!7264 (ValueCell!6509 V!19393) V!19393)

(declare-fun dynLambda!950 (Int (_ BitVec 64)) V!19393)

(assert (=> b!481224 (= e!283132 (= (apply!342 lt!218484 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)) (get!7264 (select (arr!14970 _values!1516) #b00000000000000000000000000000000) (dynLambda!950 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15328 _values!1516)))))

(assert (=> b!481224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun b!481225 () Bool)

(assert (=> b!481225 (= e!283131 e!283135)))

(declare-fun res!286943 () Bool)

(assert (=> b!481225 (= res!286943 call!30939)))

(assert (=> b!481225 (=> (not res!286943) (not e!283135))))

(declare-fun b!481226 () Bool)

(declare-fun lt!218486 () Unit!14079)

(assert (=> b!481226 (= e!283136 lt!218486)))

(declare-fun lt!218479 () ListLongMap!7909)

(assert (=> b!481226 (= lt!218479 (getCurrentListMapNoExtraKeys!2126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218485 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218489 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218489 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218487 () Unit!14079)

(declare-fun addStillContains!300 (ListLongMap!7909 (_ BitVec 64) V!19393 (_ BitVec 64)) Unit!14079)

(assert (=> b!481226 (= lt!218487 (addStillContains!300 lt!218479 lt!218485 zeroValue!1458 lt!218489))))

(assert (=> b!481226 (contains!2601 (+!1781 lt!218479 (tuple2!8995 lt!218485 zeroValue!1458)) lt!218489)))

(declare-fun lt!218480 () Unit!14079)

(assert (=> b!481226 (= lt!218480 lt!218487)))

(declare-fun lt!218493 () ListLongMap!7909)

(assert (=> b!481226 (= lt!218493 (getCurrentListMapNoExtraKeys!2126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218483 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218494 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218494 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218496 () Unit!14079)

(declare-fun addApplyDifferent!300 (ListLongMap!7909 (_ BitVec 64) V!19393 (_ BitVec 64)) Unit!14079)

(assert (=> b!481226 (= lt!218496 (addApplyDifferent!300 lt!218493 lt!218483 minValue!1458 lt!218494))))

(assert (=> b!481226 (= (apply!342 (+!1781 lt!218493 (tuple2!8995 lt!218483 minValue!1458)) lt!218494) (apply!342 lt!218493 lt!218494))))

(declare-fun lt!218481 () Unit!14079)

(assert (=> b!481226 (= lt!218481 lt!218496)))

(declare-fun lt!218491 () ListLongMap!7909)

(assert (=> b!481226 (= lt!218491 (getCurrentListMapNoExtraKeys!2126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218477 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218476 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218476 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218495 () Unit!14079)

(assert (=> b!481226 (= lt!218495 (addApplyDifferent!300 lt!218491 lt!218477 zeroValue!1458 lt!218476))))

(assert (=> b!481226 (= (apply!342 (+!1781 lt!218491 (tuple2!8995 lt!218477 zeroValue!1458)) lt!218476) (apply!342 lt!218491 lt!218476))))

(declare-fun lt!218488 () Unit!14079)

(assert (=> b!481226 (= lt!218488 lt!218495)))

(declare-fun lt!218492 () ListLongMap!7909)

(assert (=> b!481226 (= lt!218492 (getCurrentListMapNoExtraKeys!2126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218497 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218497 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218478 () (_ BitVec 64))

(assert (=> b!481226 (= lt!218478 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!481226 (= lt!218486 (addApplyDifferent!300 lt!218492 lt!218497 minValue!1458 lt!218478))))

(assert (=> b!481226 (= (apply!342 (+!1781 lt!218492 (tuple2!8995 lt!218497 minValue!1458)) lt!218478) (apply!342 lt!218492 lt!218478))))

(declare-fun bm!30936 () Bool)

(assert (=> bm!30936 (= call!30938 call!30936)))

(assert (= (and d!76803 c!57863) b!481208))

(assert (= (and d!76803 (not c!57863)) b!481214))

(assert (= (and b!481214 c!57865) b!481207))

(assert (= (and b!481214 (not c!57865)) b!481211))

(assert (= (and b!481211 c!57861) b!481216))

(assert (= (and b!481211 (not c!57861)) b!481217))

(assert (= (or b!481216 b!481217) bm!30930))

(assert (= (or b!481207 bm!30930) bm!30931))

(assert (= (or b!481207 b!481216) bm!30936))

(assert (= (or b!481208 bm!30931) bm!30935))

(assert (= (or b!481208 bm!30936) bm!30933))

(assert (= (and d!76803 res!286944) b!481219))

(assert (= (and d!76803 c!57866) b!481226))

(assert (= (and d!76803 (not c!57866)) b!481220))

(assert (= (and d!76803 res!286937) b!481218))

(assert (= (and b!481218 res!286940) b!481206))

(assert (= (and b!481218 (not res!286942)) b!481215))

(assert (= (and b!481215 res!286939) b!481224))

(assert (= (and b!481218 res!286938) b!481221))

(assert (= (and b!481221 c!57864) b!481225))

(assert (= (and b!481221 (not c!57864)) b!481223))

(assert (= (and b!481225 res!286943) b!481212))

(assert (= (or b!481225 b!481223) bm!30932))

(assert (= (and b!481221 res!286941) b!481209))

(assert (= (and b!481209 c!57862) b!481210))

(assert (= (and b!481209 (not c!57862)) b!481222))

(assert (= (and b!481210 res!286945) b!481213))

(assert (= (or b!481210 b!481222) bm!30934))

(declare-fun b_lambda!10817 () Bool)

(assert (=> (not b_lambda!10817) (not b!481224)))

(declare-fun t!15272 () Bool)

(declare-fun tb!4157 () Bool)

(assert (=> (and start!43412 (= defaultEntry!1519 defaultEntry!1519) t!15272) tb!4157))

(declare-fun result!7755 () Bool)

(assert (=> tb!4157 (= result!7755 tp_is_empty!13741)))

(assert (=> b!481224 t!15272))

(declare-fun b_and!21003 () Bool)

(assert (= b_and!20997 (and (=> t!15272 result!7755) b_and!21003)))

(declare-fun m!462917 () Bool)

(assert (=> bm!30932 m!462917))

(assert (=> b!481219 m!462895))

(assert (=> b!481219 m!462895))

(assert (=> b!481219 m!462897))

(assert (=> d!76803 m!462811))

(declare-fun m!462919 () Bool)

(assert (=> b!481226 m!462919))

(declare-fun m!462921 () Bool)

(assert (=> b!481226 m!462921))

(declare-fun m!462923 () Bool)

(assert (=> b!481226 m!462923))

(declare-fun m!462925 () Bool)

(assert (=> b!481226 m!462925))

(declare-fun m!462927 () Bool)

(assert (=> b!481226 m!462927))

(declare-fun m!462929 () Bool)

(assert (=> b!481226 m!462929))

(declare-fun m!462931 () Bool)

(assert (=> b!481226 m!462931))

(declare-fun m!462933 () Bool)

(assert (=> b!481226 m!462933))

(declare-fun m!462935 () Bool)

(assert (=> b!481226 m!462935))

(declare-fun m!462937 () Bool)

(assert (=> b!481226 m!462937))

(assert (=> b!481226 m!462931))

(declare-fun m!462939 () Bool)

(assert (=> b!481226 m!462939))

(assert (=> b!481226 m!462895))

(assert (=> b!481226 m!462923))

(declare-fun m!462941 () Bool)

(assert (=> b!481226 m!462941))

(assert (=> b!481226 m!462935))

(assert (=> b!481226 m!462919))

(declare-fun m!462943 () Bool)

(assert (=> b!481226 m!462943))

(declare-fun m!462945 () Bool)

(assert (=> b!481226 m!462945))

(declare-fun m!462947 () Bool)

(assert (=> b!481226 m!462947))

(declare-fun m!462949 () Bool)

(assert (=> b!481226 m!462949))

(declare-fun m!462951 () Bool)

(assert (=> bm!30933 m!462951))

(declare-fun m!462953 () Bool)

(assert (=> b!481208 m!462953))

(assert (=> b!481206 m!462895))

(assert (=> b!481206 m!462895))

(assert (=> b!481206 m!462897))

(assert (=> bm!30935 m!462933))

(assert (=> b!481215 m!462895))

(assert (=> b!481215 m!462895))

(declare-fun m!462955 () Bool)

(assert (=> b!481215 m!462955))

(declare-fun m!462957 () Bool)

(assert (=> b!481212 m!462957))

(declare-fun m!462959 () Bool)

(assert (=> b!481224 m!462959))

(declare-fun m!462961 () Bool)

(assert (=> b!481224 m!462961))

(declare-fun m!462963 () Bool)

(assert (=> b!481224 m!462963))

(assert (=> b!481224 m!462895))

(assert (=> b!481224 m!462895))

(declare-fun m!462965 () Bool)

(assert (=> b!481224 m!462965))

(assert (=> b!481224 m!462959))

(assert (=> b!481224 m!462961))

(declare-fun m!462967 () Bool)

(assert (=> bm!30934 m!462967))

(declare-fun m!462969 () Bool)

(assert (=> b!481213 m!462969))

(assert (=> b!481070 d!76803))

(declare-fun d!76805 () Bool)

(assert (=> d!76805 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43412 d!76805))

(declare-fun d!76807 () Bool)

(assert (=> d!76807 (= (array_inv!10870 _values!1516) (bvsge (size!15328 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43412 d!76807))

(declare-fun d!76809 () Bool)

(assert (=> d!76809 (= (array_inv!10871 _keys!1874) (bvsge (size!15329 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43412 d!76809))

(declare-fun b!481229 () Bool)

(declare-fun e!283144 () Bool)

(declare-fun e!283146 () Bool)

(assert (=> b!481229 (= e!283144 e!283146)))

(declare-fun c!57867 () Bool)

(assert (=> b!481229 (= c!57867 (validKeyInArray!0 (select (arr!14971 _keys!1874) lt!218391)))))

(declare-fun b!481230 () Bool)

(declare-fun e!283145 () Bool)

(assert (=> b!481230 (= e!283146 e!283145)))

(declare-fun lt!218498 () (_ BitVec 64))

(assert (=> b!481230 (= lt!218498 (select (arr!14971 _keys!1874) lt!218391))))

(declare-fun lt!218499 () Unit!14079)

(assert (=> b!481230 (= lt!218499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218498 lt!218391))))

(assert (=> b!481230 (arrayContainsKey!0 _keys!1874 lt!218498 #b00000000000000000000000000000000)))

(declare-fun lt!218500 () Unit!14079)

(assert (=> b!481230 (= lt!218500 lt!218499)))

(declare-fun res!286947 () Bool)

(assert (=> b!481230 (= res!286947 (= (seekEntryOrOpen!0 (select (arr!14971 _keys!1874) lt!218391) _keys!1874 mask!2352) (Found!3520 lt!218391)))))

(assert (=> b!481230 (=> (not res!286947) (not e!283145))))

(declare-fun b!481231 () Bool)

(declare-fun call!30940 () Bool)

(assert (=> b!481231 (= e!283146 call!30940)))

(declare-fun bm!30937 () Bool)

(assert (=> bm!30937 (= call!30940 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218391 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!481232 () Bool)

(assert (=> b!481232 (= e!283145 call!30940)))

(declare-fun d!76811 () Bool)

(declare-fun res!286946 () Bool)

(assert (=> d!76811 (=> res!286946 e!283144)))

(assert (=> d!76811 (= res!286946 (bvsge lt!218391 (size!15329 _keys!1874)))))

(assert (=> d!76811 (= (arrayForallSeekEntryOrOpenFound!0 lt!218391 _keys!1874 mask!2352) e!283144)))

(assert (= (and d!76811 (not res!286946)) b!481229))

(assert (= (and b!481229 c!57867) b!481230))

(assert (= (and b!481229 (not c!57867)) b!481231))

(assert (= (and b!481230 res!286947) b!481232))

(assert (= (or b!481232 b!481231) bm!30937))

(declare-fun m!462971 () Bool)

(assert (=> b!481229 m!462971))

(assert (=> b!481229 m!462971))

(declare-fun m!462973 () Bool)

(assert (=> b!481229 m!462973))

(assert (=> b!481230 m!462971))

(declare-fun m!462975 () Bool)

(assert (=> b!481230 m!462975))

(declare-fun m!462977 () Bool)

(assert (=> b!481230 m!462977))

(assert (=> b!481230 m!462971))

(declare-fun m!462979 () Bool)

(assert (=> b!481230 m!462979))

(declare-fun m!462981 () Bool)

(assert (=> bm!30937 m!462981))

(assert (=> b!481065 d!76811))

(declare-fun d!76813 () Bool)

(assert (=> d!76813 (arrayForallSeekEntryOrOpenFound!0 lt!218391 _keys!1874 mask!2352)))

(declare-fun lt!218503 () Unit!14079)

(declare-fun choose!38 (array!31136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14079)

(assert (=> d!76813 (= lt!218503 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218391))))

(assert (=> d!76813 (validMask!0 mask!2352)))

(assert (=> d!76813 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218391) lt!218503)))

(declare-fun bs!15320 () Bool)

(assert (= bs!15320 d!76813))

(assert (=> bs!15320 m!462827))

(declare-fun m!462983 () Bool)

(assert (=> bs!15320 m!462983))

(assert (=> bs!15320 m!462811))

(assert (=> b!481065 d!76813))

(declare-fun d!76815 () Bool)

(declare-fun lt!218506 () (_ BitVec 32))

(assert (=> d!76815 (and (or (bvslt lt!218506 #b00000000000000000000000000000000) (bvsge lt!218506 (size!15329 _keys!1874)) (and (bvsge lt!218506 #b00000000000000000000000000000000) (bvslt lt!218506 (size!15329 _keys!1874)))) (bvsge lt!218506 #b00000000000000000000000000000000) (bvslt lt!218506 (size!15329 _keys!1874)) (= (select (arr!14971 _keys!1874) lt!218506) k0!1332))))

(declare-fun e!283149 () (_ BitVec 32))

(assert (=> d!76815 (= lt!218506 e!283149)))

(declare-fun c!57870 () Bool)

(assert (=> d!76815 (= c!57870 (= (select (arr!14971 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)) (bvslt (size!15329 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76815 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218506)))

(declare-fun b!481237 () Bool)

(assert (=> b!481237 (= e!283149 #b00000000000000000000000000000000)))

(declare-fun b!481238 () Bool)

(assert (=> b!481238 (= e!283149 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76815 c!57870) b!481237))

(assert (= (and d!76815 (not c!57870)) b!481238))

(declare-fun m!462985 () Bool)

(assert (=> d!76815 m!462985))

(assert (=> d!76815 m!462895))

(declare-fun m!462987 () Bool)

(assert (=> b!481238 m!462987))

(assert (=> b!481065 d!76815))

(declare-fun d!76817 () Bool)

(declare-fun e!283152 () Bool)

(assert (=> d!76817 e!283152))

(declare-fun c!57873 () Bool)

(assert (=> d!76817 (= c!57873 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218509 () Unit!14079)

(declare-fun choose!1383 (array!31136 array!31134 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 64) Int) Unit!14079)

(assert (=> d!76817 (= lt!218509 (choose!1383 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76817 (validMask!0 mask!2352)))

(assert (=> d!76817 (= (lemmaKeyInListMapIsInArray!132 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218509)))

(declare-fun b!481243 () Bool)

(assert (=> b!481243 (= e!283152 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481244 () Bool)

(assert (=> b!481244 (= e!283152 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76817 c!57873) b!481243))

(assert (= (and d!76817 (not c!57873)) b!481244))

(declare-fun m!462989 () Bool)

(assert (=> d!76817 m!462989))

(assert (=> d!76817 m!462811))

(assert (=> b!481243 m!462821))

(assert (=> b!481065 d!76817))

(declare-fun d!76819 () Bool)

(assert (=> d!76819 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481062 d!76819))

(declare-fun d!76821 () Bool)

(declare-fun res!286955 () Bool)

(declare-fun e!283164 () Bool)

(assert (=> d!76821 (=> res!286955 e!283164)))

(assert (=> d!76821 (= res!286955 (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76821 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9060) e!283164)))

(declare-fun b!481255 () Bool)

(declare-fun e!283163 () Bool)

(declare-fun call!30943 () Bool)

(assert (=> b!481255 (= e!283163 call!30943)))

(declare-fun b!481256 () Bool)

(declare-fun e!283162 () Bool)

(declare-fun contains!2603 (List!9063 (_ BitVec 64)) Bool)

(assert (=> b!481256 (= e!283162 (contains!2603 Nil!9060 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481257 () Bool)

(declare-fun e!283161 () Bool)

(assert (=> b!481257 (= e!283164 e!283161)))

(declare-fun res!286954 () Bool)

(assert (=> b!481257 (=> (not res!286954) (not e!283161))))

(assert (=> b!481257 (= res!286954 (not e!283162))))

(declare-fun res!286956 () Bool)

(assert (=> b!481257 (=> (not res!286956) (not e!283162))))

(assert (=> b!481257 (= res!286956 (validKeyInArray!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30940 () Bool)

(declare-fun c!57876 () Bool)

(assert (=> bm!30940 (= call!30943 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57876 (Cons!9059 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000) Nil!9060) Nil!9060)))))

(declare-fun b!481258 () Bool)

(assert (=> b!481258 (= e!283163 call!30943)))

(declare-fun b!481259 () Bool)

(assert (=> b!481259 (= e!283161 e!283163)))

(assert (=> b!481259 (= c!57876 (validKeyInArray!0 (select (arr!14971 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76821 (not res!286955)) b!481257))

(assert (= (and b!481257 res!286956) b!481256))

(assert (= (and b!481257 res!286954) b!481259))

(assert (= (and b!481259 c!57876) b!481255))

(assert (= (and b!481259 (not c!57876)) b!481258))

(assert (= (or b!481255 b!481258) bm!30940))

(assert (=> b!481256 m!462895))

(assert (=> b!481256 m!462895))

(declare-fun m!462991 () Bool)

(assert (=> b!481256 m!462991))

(assert (=> b!481257 m!462895))

(assert (=> b!481257 m!462895))

(assert (=> b!481257 m!462897))

(assert (=> bm!30940 m!462895))

(declare-fun m!462993 () Bool)

(assert (=> bm!30940 m!462993))

(assert (=> b!481259 m!462895))

(assert (=> b!481259 m!462895))

(assert (=> b!481259 m!462897))

(assert (=> b!481063 d!76821))

(declare-fun b!481267 () Bool)

(declare-fun e!283170 () Bool)

(assert (=> b!481267 (= e!283170 tp_is_empty!13741)))

(declare-fun b!481266 () Bool)

(declare-fun e!283169 () Bool)

(assert (=> b!481266 (= e!283169 tp_is_empty!13741)))

(declare-fun condMapEmpty!22327 () Bool)

(declare-fun mapDefault!22327 () ValueCell!6509)

(assert (=> mapNonEmpty!22318 (= condMapEmpty!22327 (= mapRest!22318 ((as const (Array (_ BitVec 32) ValueCell!6509)) mapDefault!22327)))))

(declare-fun mapRes!22327 () Bool)

(assert (=> mapNonEmpty!22318 (= tp!42966 (and e!283170 mapRes!22327))))

(declare-fun mapIsEmpty!22327 () Bool)

(assert (=> mapIsEmpty!22327 mapRes!22327))

(declare-fun mapNonEmpty!22327 () Bool)

(declare-fun tp!42982 () Bool)

(assert (=> mapNonEmpty!22327 (= mapRes!22327 (and tp!42982 e!283169))))

(declare-fun mapRest!22327 () (Array (_ BitVec 32) ValueCell!6509))

(declare-fun mapValue!22327 () ValueCell!6509)

(declare-fun mapKey!22327 () (_ BitVec 32))

(assert (=> mapNonEmpty!22327 (= mapRest!22318 (store mapRest!22327 mapKey!22327 mapValue!22327))))

(assert (= (and mapNonEmpty!22318 condMapEmpty!22327) mapIsEmpty!22327))

(assert (= (and mapNonEmpty!22318 (not condMapEmpty!22327)) mapNonEmpty!22327))

(assert (= (and mapNonEmpty!22327 ((_ is ValueCellFull!6509) mapValue!22327)) b!481266))

(assert (= (and mapNonEmpty!22318 ((_ is ValueCellFull!6509) mapDefault!22327)) b!481267))

(declare-fun m!462995 () Bool)

(assert (=> mapNonEmpty!22327 m!462995))

(declare-fun b_lambda!10819 () Bool)

(assert (= b_lambda!10817 (or (and start!43412 b_free!12229) b_lambda!10819)))

(check-sat tp_is_empty!13741 (not bm!30937) (not b!481161) (not bm!30934) (not b!481206) (not bm!30915) (not b!481154) (not b!481226) (not d!76813) (not b!481259) (not mapNonEmpty!22327) (not b!481256) (not b!481146) (not b!481215) (not b!481243) (not bm!30933) (not d!76801) (not b!481219) (not b!481257) (not b!481229) (not b_lambda!10819) (not b!481208) (not d!76817) (not b!481230) (not bm!30932) (not b_next!12229) (not bm!30940) (not b!481213) (not bm!30935) (not b!481238) (not d!76803) (not b!481224) (not b!481163) (not b!481145) b_and!21003 (not b!481212))
(check-sat b_and!21003 (not b_next!12229))
