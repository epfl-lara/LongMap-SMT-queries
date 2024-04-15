; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83544 () Bool)

(assert start!83544)

(declare-fun b_free!19549 () Bool)

(declare-fun b_next!19549 () Bool)

(assert (=> start!83544 (= b_free!19549 (not b_next!19549))))

(declare-fun tp!67935 () Bool)

(declare-fun b_and!31161 () Bool)

(assert (=> start!83544 (= tp!67935 b_and!31161)))

(declare-fun b!976258 () Bool)

(declare-fun res!653612 () Bool)

(declare-fun e!550168 () Bool)

(assert (=> b!976258 (=> (not res!653612) (not e!550168))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34921 0))(
  ( (V!34922 (val!11277 Int)) )
))
(declare-datatypes ((ValueCell!10745 0))(
  ( (ValueCellFull!10745 (v!13835 V!34921)) (EmptyCell!10745) )
))
(declare-datatypes ((array!60864 0))(
  ( (array!60865 (arr!29296 (Array (_ BitVec 32) ValueCell!10745)) (size!29777 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60864)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60866 0))(
  ( (array!60867 (arr!29297 (Array (_ BitVec 32) (_ BitVec 64))) (size!29778 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60866)

(assert (=> b!976258 (= res!653612 (and (= (size!29777 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29778 _keys!1717) (size!29777 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!14568 0))(
  ( (tuple2!14569 (_1!7295 (_ BitVec 64)) (_2!7295 V!34921)) )
))
(declare-datatypes ((List!20374 0))(
  ( (Nil!20371) (Cons!20370 (h!21532 tuple2!14568) (t!28878 List!20374)) )
))
(declare-datatypes ((ListLongMap!13255 0))(
  ( (ListLongMap!13256 (toList!6643 List!20374)) )
))
(declare-fun lt!432903 () ListLongMap!13255)

(declare-fun b!976259 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun e!550165 () Bool)

(declare-fun contains!5670 (ListLongMap!13255 (_ BitVec 64)) Bool)

(assert (=> b!976259 (= e!550165 (not (contains!5670 lt!432903 (select (arr!29297 _keys!1717) i!822))))))

(declare-fun b!976260 () Bool)

(assert (=> b!976260 (= e!550168 e!550165)))

(declare-fun res!653611 () Bool)

(assert (=> b!976260 (=> (not res!653611) (not e!550165))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976260 (= res!653611 (not (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun zeroValue!1367 () V!34921)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34921)

(declare-fun getCurrentListMap!3805 (array!60866 array!60864 (_ BitVec 32) (_ BitVec 32) V!34921 V!34921 (_ BitVec 32) Int) ListLongMap!13255)

(assert (=> b!976260 (= lt!432903 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976261 () Bool)

(declare-fun res!653607 () Bool)

(assert (=> b!976261 (=> (not res!653607) (not e!550168))))

(assert (=> b!976261 (= res!653607 (validKeyInArray!0 (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976262 () Bool)

(declare-fun e!550170 () Bool)

(declare-fun tp_is_empty!22453 () Bool)

(assert (=> b!976262 (= e!550170 tp_is_empty!22453)))

(declare-fun b!976263 () Bool)

(declare-fun e!550166 () Bool)

(declare-fun e!550169 () Bool)

(declare-fun mapRes!35689 () Bool)

(assert (=> b!976263 (= e!550166 (and e!550169 mapRes!35689))))

(declare-fun condMapEmpty!35689 () Bool)

(declare-fun mapDefault!35689 () ValueCell!10745)

(assert (=> b!976263 (= condMapEmpty!35689 (= (arr!29296 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35689)))))

(declare-fun mapNonEmpty!35689 () Bool)

(declare-fun tp!67936 () Bool)

(assert (=> mapNonEmpty!35689 (= mapRes!35689 (and tp!67936 e!550170))))

(declare-fun mapValue!35689 () ValueCell!10745)

(declare-fun mapKey!35689 () (_ BitVec 32))

(declare-fun mapRest!35689 () (Array (_ BitVec 32) ValueCell!10745))

(assert (=> mapNonEmpty!35689 (= (arr!29296 _values!1425) (store mapRest!35689 mapKey!35689 mapValue!35689))))

(declare-fun b!976264 () Bool)

(declare-fun res!653609 () Bool)

(assert (=> b!976264 (=> (not res!653609) (not e!550168))))

(assert (=> b!976264 (= res!653609 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29778 _keys!1717))))))

(declare-fun mapIsEmpty!35689 () Bool)

(assert (=> mapIsEmpty!35689 mapRes!35689))

(declare-fun res!653614 () Bool)

(assert (=> start!83544 (=> (not res!653614) (not e!550168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83544 (= res!653614 (validMask!0 mask!2147))))

(assert (=> start!83544 e!550168))

(assert (=> start!83544 true))

(declare-fun array_inv!22693 (array!60864) Bool)

(assert (=> start!83544 (and (array_inv!22693 _values!1425) e!550166)))

(assert (=> start!83544 tp_is_empty!22453))

(assert (=> start!83544 tp!67935))

(declare-fun array_inv!22694 (array!60866) Bool)

(assert (=> start!83544 (array_inv!22694 _keys!1717)))

(declare-fun b!976265 () Bool)

(assert (=> b!976265 (= e!550169 tp_is_empty!22453)))

(declare-fun b!976266 () Bool)

(declare-fun res!653613 () Bool)

(assert (=> b!976266 (=> (not res!653613) (not e!550168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60866 (_ BitVec 32)) Bool)

(assert (=> b!976266 (= res!653613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976267 () Bool)

(declare-fun res!653608 () Bool)

(assert (=> b!976267 (=> (not res!653608) (not e!550168))))

(assert (=> b!976267 (= res!653608 (contains!5670 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976268 () Bool)

(declare-fun res!653610 () Bool)

(assert (=> b!976268 (=> (not res!653610) (not e!550168))))

(declare-datatypes ((List!20375 0))(
  ( (Nil!20372) (Cons!20371 (h!21533 (_ BitVec 64)) (t!28879 List!20375)) )
))
(declare-fun arrayNoDuplicates!0 (array!60866 (_ BitVec 32) List!20375) Bool)

(assert (=> b!976268 (= res!653610 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20372))))

(assert (= (and start!83544 res!653614) b!976258))

(assert (= (and b!976258 res!653612) b!976266))

(assert (= (and b!976266 res!653613) b!976268))

(assert (= (and b!976268 res!653610) b!976264))

(assert (= (and b!976264 res!653609) b!976261))

(assert (= (and b!976261 res!653607) b!976267))

(assert (= (and b!976267 res!653608) b!976260))

(assert (= (and b!976260 res!653611) b!976259))

(assert (= (and b!976263 condMapEmpty!35689) mapIsEmpty!35689))

(assert (= (and b!976263 (not condMapEmpty!35689)) mapNonEmpty!35689))

(get-info :version)

(assert (= (and mapNonEmpty!35689 ((_ is ValueCellFull!10745) mapValue!35689)) b!976262))

(assert (= (and b!976263 ((_ is ValueCellFull!10745) mapDefault!35689)) b!976265))

(assert (= start!83544 b!976263))

(declare-fun m!902975 () Bool)

(assert (=> b!976259 m!902975))

(assert (=> b!976259 m!902975))

(declare-fun m!902977 () Bool)

(assert (=> b!976259 m!902977))

(declare-fun m!902979 () Bool)

(assert (=> mapNonEmpty!35689 m!902979))

(declare-fun m!902981 () Bool)

(assert (=> start!83544 m!902981))

(declare-fun m!902983 () Bool)

(assert (=> start!83544 m!902983))

(declare-fun m!902985 () Bool)

(assert (=> start!83544 m!902985))

(declare-fun m!902987 () Bool)

(assert (=> b!976267 m!902987))

(assert (=> b!976267 m!902975))

(assert (=> b!976267 m!902987))

(assert (=> b!976267 m!902975))

(declare-fun m!902989 () Bool)

(assert (=> b!976267 m!902989))

(declare-fun m!902991 () Bool)

(assert (=> b!976260 m!902991))

(assert (=> b!976260 m!902991))

(declare-fun m!902993 () Bool)

(assert (=> b!976260 m!902993))

(declare-fun m!902995 () Bool)

(assert (=> b!976260 m!902995))

(assert (=> b!976261 m!902975))

(assert (=> b!976261 m!902975))

(declare-fun m!902997 () Bool)

(assert (=> b!976261 m!902997))

(declare-fun m!902999 () Bool)

(assert (=> b!976266 m!902999))

(declare-fun m!903001 () Bool)

(assert (=> b!976268 m!903001))

(check-sat b_and!31161 (not start!83544) (not b!976266) (not mapNonEmpty!35689) (not b!976268) tp_is_empty!22453 (not b_next!19549) (not b!976267) (not b!976261) (not b!976260) (not b!976259))
(check-sat b_and!31161 (not b_next!19549))
(get-model)

(declare-fun d!116261 () Bool)

(declare-fun e!550211 () Bool)

(assert (=> d!116261 e!550211))

(declare-fun res!653665 () Bool)

(assert (=> d!116261 (=> res!653665 e!550211)))

(declare-fun lt!432918 () Bool)

(assert (=> d!116261 (= res!653665 (not lt!432918))))

(declare-fun lt!432921 () Bool)

(assert (=> d!116261 (= lt!432918 lt!432921)))

(declare-datatypes ((Unit!32342 0))(
  ( (Unit!32343) )
))
(declare-fun lt!432919 () Unit!32342)

(declare-fun e!550212 () Unit!32342)

(assert (=> d!116261 (= lt!432919 e!550212)))

(declare-fun c!99867 () Bool)

(assert (=> d!116261 (= c!99867 lt!432921)))

(declare-fun containsKey!476 (List!20374 (_ BitVec 64)) Bool)

(assert (=> d!116261 (= lt!432921 (containsKey!476 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(assert (=> d!116261 (= (contains!5670 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29297 _keys!1717) i!822)) lt!432918)))

(declare-fun b!976341 () Bool)

(declare-fun lt!432920 () Unit!32342)

(assert (=> b!976341 (= e!550212 lt!432920)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!371 (List!20374 (_ BitVec 64)) Unit!32342)

(assert (=> b!976341 (= lt!432920 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(declare-datatypes ((Option!518 0))(
  ( (Some!517 (v!13838 V!34921)) (None!516) )
))
(declare-fun isDefined!384 (Option!518) Bool)

(declare-fun getValueByKey!512 (List!20374 (_ BitVec 64)) Option!518)

(assert (=> b!976341 (isDefined!384 (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976342 () Bool)

(declare-fun Unit!32344 () Unit!32342)

(assert (=> b!976342 (= e!550212 Unit!32344)))

(declare-fun b!976343 () Bool)

(assert (=> b!976343 (= e!550211 (isDefined!384 (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822))))))

(assert (= (and d!116261 c!99867) b!976341))

(assert (= (and d!116261 (not c!99867)) b!976342))

(assert (= (and d!116261 (not res!653665)) b!976343))

(assert (=> d!116261 m!902975))

(declare-fun m!903059 () Bool)

(assert (=> d!116261 m!903059))

(assert (=> b!976341 m!902975))

(declare-fun m!903061 () Bool)

(assert (=> b!976341 m!903061))

(assert (=> b!976341 m!902975))

(declare-fun m!903063 () Bool)

(assert (=> b!976341 m!903063))

(assert (=> b!976341 m!903063))

(declare-fun m!903065 () Bool)

(assert (=> b!976341 m!903065))

(assert (=> b!976343 m!902975))

(assert (=> b!976343 m!903063))

(assert (=> b!976343 m!903063))

(assert (=> b!976343 m!903065))

(assert (=> b!976267 d!116261))

(declare-fun b!976386 () Bool)

(declare-fun e!550247 () ListLongMap!13255)

(declare-fun call!41733 () ListLongMap!13255)

(assert (=> b!976386 (= e!550247 call!41733)))

(declare-fun b!976387 () Bool)

(declare-fun res!653684 () Bool)

(declare-fun e!550241 () Bool)

(assert (=> b!976387 (=> (not res!653684) (not e!550241))))

(declare-fun e!550244 () Bool)

(assert (=> b!976387 (= res!653684 e!550244)))

(declare-fun c!99880 () Bool)

(assert (=> b!976387 (= c!99880 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!976388 () Bool)

(declare-fun e!550249 () Bool)

(assert (=> b!976388 (= e!550244 e!550249)))

(declare-fun res!653686 () Bool)

(declare-fun call!41735 () Bool)

(assert (=> b!976388 (= res!653686 call!41735)))

(assert (=> b!976388 (=> (not res!653686) (not e!550249))))

(declare-fun b!976389 () Bool)

(declare-fun c!99885 () Bool)

(assert (=> b!976389 (= c!99885 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!550251 () ListLongMap!13255)

(assert (=> b!976389 (= e!550251 e!550247)))

(declare-fun call!41736 () ListLongMap!13255)

(declare-fun bm!41727 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3365 (array!60866 array!60864 (_ BitVec 32) (_ BitVec 32) V!34921 V!34921 (_ BitVec 32) Int) ListLongMap!13255)

(assert (=> bm!41727 (= call!41736 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976390 () Bool)

(assert (=> b!976390 (= e!550244 (not call!41735))))

(declare-fun bm!41728 () Bool)

(declare-fun call!41730 () ListLongMap!13255)

(assert (=> bm!41728 (= call!41730 call!41736)))

(declare-fun b!976391 () Bool)

(declare-fun e!550246 () Bool)

(assert (=> b!976391 (= e!550241 e!550246)))

(declare-fun c!99882 () Bool)

(assert (=> b!976391 (= c!99882 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!976392 () Bool)

(declare-fun res!653688 () Bool)

(assert (=> b!976392 (=> (not res!653688) (not e!550241))))

(declare-fun e!550243 () Bool)

(assert (=> b!976392 (= res!653688 e!550243)))

(declare-fun res!653687 () Bool)

(assert (=> b!976392 (=> res!653687 e!550243)))

(declare-fun e!550239 () Bool)

(assert (=> b!976392 (= res!653687 (not e!550239))))

(declare-fun res!653691 () Bool)

(assert (=> b!976392 (=> (not res!653691) (not e!550239))))

(assert (=> b!976392 (= res!653691 (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun b!976393 () Bool)

(declare-fun lt!432975 () ListLongMap!13255)

(declare-fun apply!883 (ListLongMap!13255 (_ BitVec 64)) V!34921)

(assert (=> b!976393 (= e!550249 (= (apply!883 lt!432975 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun d!116263 () Bool)

(assert (=> d!116263 e!550241))

(declare-fun res!653689 () Bool)

(assert (=> d!116263 (=> (not res!653689) (not e!550241))))

(assert (=> d!116263 (= res!653689 (or (bvsge from!2118 (size!29778 _keys!1717)) (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)))))))

(declare-fun lt!432972 () ListLongMap!13255)

(assert (=> d!116263 (= lt!432975 lt!432972)))

(declare-fun lt!432986 () Unit!32342)

(declare-fun e!550242 () Unit!32342)

(assert (=> d!116263 (= lt!432986 e!550242)))

(declare-fun c!99883 () Bool)

(declare-fun e!550250 () Bool)

(assert (=> d!116263 (= c!99883 e!550250)))

(declare-fun res!653690 () Bool)

(assert (=> d!116263 (=> (not res!653690) (not e!550250))))

(assert (=> d!116263 (= res!653690 (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun e!550240 () ListLongMap!13255)

(assert (=> d!116263 (= lt!432972 e!550240)))

(declare-fun c!99884 () Bool)

(assert (=> d!116263 (= c!99884 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116263 (validMask!0 mask!2147)))

(assert (=> d!116263 (= (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!432975)))

(declare-fun b!976394 () Bool)

(declare-fun lt!432985 () Unit!32342)

(assert (=> b!976394 (= e!550242 lt!432985)))

(declare-fun lt!432967 () ListLongMap!13255)

(assert (=> b!976394 (= lt!432967 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!432979 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432969 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432969 (select (arr!29297 _keys!1717) from!2118))))

(declare-fun lt!432982 () Unit!32342)

(declare-fun addStillContains!606 (ListLongMap!13255 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32342)

(assert (=> b!976394 (= lt!432982 (addStillContains!606 lt!432967 lt!432979 zeroValue!1367 lt!432969))))

(declare-fun +!2945 (ListLongMap!13255 tuple2!14568) ListLongMap!13255)

(assert (=> b!976394 (contains!5670 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367)) lt!432969)))

(declare-fun lt!432966 () Unit!32342)

(assert (=> b!976394 (= lt!432966 lt!432982)))

(declare-fun lt!432978 () ListLongMap!13255)

(assert (=> b!976394 (= lt!432978 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!432973 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432970 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432970 (select (arr!29297 _keys!1717) from!2118))))

(declare-fun lt!432976 () Unit!32342)

(declare-fun addApplyDifferent!462 (ListLongMap!13255 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32342)

(assert (=> b!976394 (= lt!432976 (addApplyDifferent!462 lt!432978 lt!432973 minValue!1367 lt!432970))))

(assert (=> b!976394 (= (apply!883 (+!2945 lt!432978 (tuple2!14569 lt!432973 minValue!1367)) lt!432970) (apply!883 lt!432978 lt!432970))))

(declare-fun lt!432983 () Unit!32342)

(assert (=> b!976394 (= lt!432983 lt!432976)))

(declare-fun lt!432987 () ListLongMap!13255)

(assert (=> b!976394 (= lt!432987 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!432977 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432981 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432981 (select (arr!29297 _keys!1717) from!2118))))

(declare-fun lt!432980 () Unit!32342)

(assert (=> b!976394 (= lt!432980 (addApplyDifferent!462 lt!432987 lt!432977 zeroValue!1367 lt!432981))))

(assert (=> b!976394 (= (apply!883 (+!2945 lt!432987 (tuple2!14569 lt!432977 zeroValue!1367)) lt!432981) (apply!883 lt!432987 lt!432981))))

(declare-fun lt!432971 () Unit!32342)

(assert (=> b!976394 (= lt!432971 lt!432980)))

(declare-fun lt!432968 () ListLongMap!13255)

(assert (=> b!976394 (= lt!432968 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!432984 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432984 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432974 () (_ BitVec 64))

(assert (=> b!976394 (= lt!432974 (select (arr!29297 _keys!1717) from!2118))))

(assert (=> b!976394 (= lt!432985 (addApplyDifferent!462 lt!432968 lt!432984 minValue!1367 lt!432974))))

(assert (=> b!976394 (= (apply!883 (+!2945 lt!432968 (tuple2!14569 lt!432984 minValue!1367)) lt!432974) (apply!883 lt!432968 lt!432974))))

(declare-fun bm!41729 () Bool)

(declare-fun call!41731 () ListLongMap!13255)

(assert (=> bm!41729 (= call!41733 call!41731)))

(declare-fun b!976395 () Bool)

(declare-fun call!41734 () ListLongMap!13255)

(assert (=> b!976395 (= e!550247 call!41734)))

(declare-fun b!976396 () Bool)

(declare-fun e!550245 () Bool)

(assert (=> b!976396 (= e!550245 (= (apply!883 lt!432975 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!976397 () Bool)

(assert (=> b!976397 (= e!550250 (validKeyInArray!0 (select (arr!29297 _keys!1717) from!2118)))))

(declare-fun b!976398 () Bool)

(assert (=> b!976398 (= e!550251 call!41733)))

(declare-fun b!976399 () Bool)

(assert (=> b!976399 (= e!550240 e!550251)))

(declare-fun c!99881 () Bool)

(assert (=> b!976399 (= c!99881 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!976400 () Bool)

(declare-fun e!550248 () Bool)

(declare-fun get!15182 (ValueCell!10745 V!34921) V!34921)

(declare-fun dynLambda!1701 (Int (_ BitVec 64)) V!34921)

(assert (=> b!976400 (= e!550248 (= (apply!883 lt!432975 (select (arr!29297 _keys!1717) from!2118)) (get!15182 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976400 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29777 _values!1425)))))

(assert (=> b!976400 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun bm!41730 () Bool)

(assert (=> bm!41730 (= call!41734 call!41730)))

(declare-fun b!976401 () Bool)

(assert (=> b!976401 (= e!550240 (+!2945 call!41731 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun b!976402 () Bool)

(declare-fun Unit!32345 () Unit!32342)

(assert (=> b!976402 (= e!550242 Unit!32345)))

(declare-fun b!976403 () Bool)

(declare-fun call!41732 () Bool)

(assert (=> b!976403 (= e!550246 (not call!41732))))

(declare-fun b!976404 () Bool)

(assert (=> b!976404 (= e!550246 e!550245)))

(declare-fun res!653692 () Bool)

(assert (=> b!976404 (= res!653692 call!41732)))

(assert (=> b!976404 (=> (not res!653692) (not e!550245))))

(declare-fun bm!41731 () Bool)

(assert (=> bm!41731 (= call!41735 (contains!5670 lt!432975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41732 () Bool)

(assert (=> bm!41732 (= call!41731 (+!2945 (ite c!99884 call!41736 (ite c!99881 call!41730 call!41734)) (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun b!976405 () Bool)

(assert (=> b!976405 (= e!550239 (validKeyInArray!0 (select (arr!29297 _keys!1717) from!2118)))))

(declare-fun b!976406 () Bool)

(assert (=> b!976406 (= e!550243 e!550248)))

(declare-fun res!653685 () Bool)

(assert (=> b!976406 (=> (not res!653685) (not e!550248))))

(assert (=> b!976406 (= res!653685 (contains!5670 lt!432975 (select (arr!29297 _keys!1717) from!2118)))))

(assert (=> b!976406 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun bm!41733 () Bool)

(assert (=> bm!41733 (= call!41732 (contains!5670 lt!432975 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116263 c!99884) b!976401))

(assert (= (and d!116263 (not c!99884)) b!976399))

(assert (= (and b!976399 c!99881) b!976398))

(assert (= (and b!976399 (not c!99881)) b!976389))

(assert (= (and b!976389 c!99885) b!976386))

(assert (= (and b!976389 (not c!99885)) b!976395))

(assert (= (or b!976386 b!976395) bm!41730))

(assert (= (or b!976398 bm!41730) bm!41728))

(assert (= (or b!976398 b!976386) bm!41729))

(assert (= (or b!976401 bm!41728) bm!41727))

(assert (= (or b!976401 bm!41729) bm!41732))

(assert (= (and d!116263 res!653690) b!976397))

(assert (= (and d!116263 c!99883) b!976394))

(assert (= (and d!116263 (not c!99883)) b!976402))

(assert (= (and d!116263 res!653689) b!976392))

(assert (= (and b!976392 res!653691) b!976405))

(assert (= (and b!976392 (not res!653687)) b!976406))

(assert (= (and b!976406 res!653685) b!976400))

(assert (= (and b!976392 res!653688) b!976387))

(assert (= (and b!976387 c!99880) b!976388))

(assert (= (and b!976387 (not c!99880)) b!976390))

(assert (= (and b!976388 res!653686) b!976393))

(assert (= (or b!976388 b!976390) bm!41731))

(assert (= (and b!976387 res!653684) b!976391))

(assert (= (and b!976391 c!99882) b!976404))

(assert (= (and b!976391 (not c!99882)) b!976403))

(assert (= (and b!976404 res!653692) b!976396))

(assert (= (or b!976404 b!976403) bm!41733))

(declare-fun b_lambda!14563 () Bool)

(assert (=> (not b_lambda!14563) (not b!976400)))

(declare-fun t!28884 () Bool)

(declare-fun tb!6357 () Bool)

(assert (=> (and start!83544 (= defaultEntry!1428 defaultEntry!1428) t!28884) tb!6357))

(declare-fun result!12699 () Bool)

(assert (=> tb!6357 (= result!12699 tp_is_empty!22453)))

(assert (=> b!976400 t!28884))

(declare-fun b_and!31167 () Bool)

(assert (= b_and!31161 (and (=> t!28884 result!12699) b_and!31167)))

(declare-fun m!903067 () Bool)

(assert (=> bm!41731 m!903067))

(declare-fun m!903069 () Bool)

(assert (=> b!976396 m!903069))

(declare-fun m!903071 () Bool)

(assert (=> bm!41733 m!903071))

(declare-fun m!903073 () Bool)

(assert (=> b!976393 m!903073))

(declare-fun m!903075 () Bool)

(assert (=> b!976394 m!903075))

(declare-fun m!903077 () Bool)

(assert (=> b!976394 m!903077))

(declare-fun m!903079 () Bool)

(assert (=> b!976394 m!903079))

(declare-fun m!903081 () Bool)

(assert (=> b!976394 m!903081))

(declare-fun m!903083 () Bool)

(assert (=> b!976394 m!903083))

(declare-fun m!903085 () Bool)

(assert (=> b!976394 m!903085))

(assert (=> b!976394 m!903079))

(declare-fun m!903087 () Bool)

(assert (=> b!976394 m!903087))

(declare-fun m!903089 () Bool)

(assert (=> b!976394 m!903089))

(declare-fun m!903091 () Bool)

(assert (=> b!976394 m!903091))

(assert (=> b!976394 m!903085))

(declare-fun m!903093 () Bool)

(assert (=> b!976394 m!903093))

(declare-fun m!903095 () Bool)

(assert (=> b!976394 m!903095))

(declare-fun m!903097 () Bool)

(assert (=> b!976394 m!903097))

(declare-fun m!903099 () Bool)

(assert (=> b!976394 m!903099))

(declare-fun m!903101 () Bool)

(assert (=> b!976394 m!903101))

(assert (=> b!976394 m!903089))

(declare-fun m!903103 () Bool)

(assert (=> b!976394 m!903103))

(declare-fun m!903105 () Bool)

(assert (=> b!976394 m!903105))

(assert (=> b!976394 m!903095))

(declare-fun m!903107 () Bool)

(assert (=> b!976394 m!903107))

(assert (=> b!976400 m!903101))

(declare-fun m!903109 () Bool)

(assert (=> b!976400 m!903109))

(assert (=> b!976400 m!903101))

(declare-fun m!903111 () Bool)

(assert (=> b!976400 m!903111))

(assert (=> b!976400 m!903111))

(declare-fun m!903113 () Bool)

(assert (=> b!976400 m!903113))

(declare-fun m!903115 () Bool)

(assert (=> b!976400 m!903115))

(assert (=> b!976400 m!903113))

(assert (=> b!976406 m!903101))

(assert (=> b!976406 m!903101))

(declare-fun m!903117 () Bool)

(assert (=> b!976406 m!903117))

(assert (=> b!976405 m!903101))

(assert (=> b!976405 m!903101))

(declare-fun m!903119 () Bool)

(assert (=> b!976405 m!903119))

(assert (=> d!116263 m!902981))

(assert (=> bm!41727 m!903077))

(declare-fun m!903121 () Bool)

(assert (=> bm!41732 m!903121))

(assert (=> b!976397 m!903101))

(assert (=> b!976397 m!903101))

(assert (=> b!976397 m!903119))

(declare-fun m!903123 () Bool)

(assert (=> b!976401 m!903123))

(assert (=> b!976267 d!116263))

(declare-fun b!976417 () Bool)

(declare-fun e!550259 () Bool)

(declare-fun e!550258 () Bool)

(assert (=> b!976417 (= e!550259 e!550258)))

(declare-fun lt!432995 () (_ BitVec 64))

(assert (=> b!976417 (= lt!432995 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000))))

(declare-fun lt!432996 () Unit!32342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60866 (_ BitVec 64) (_ BitVec 32)) Unit!32342)

(assert (=> b!976417 (= lt!432996 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!432995 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!976417 (arrayContainsKey!0 _keys!1717 lt!432995 #b00000000000000000000000000000000)))

(declare-fun lt!432994 () Unit!32342)

(assert (=> b!976417 (= lt!432994 lt!432996)))

(declare-fun res!653698 () Bool)

(declare-datatypes ((SeekEntryResult!9196 0))(
  ( (MissingZero!9196 (index!39155 (_ BitVec 32))) (Found!9196 (index!39156 (_ BitVec 32))) (Intermediate!9196 (undefined!10008 Bool) (index!39157 (_ BitVec 32)) (x!84489 (_ BitVec 32))) (Undefined!9196) (MissingVacant!9196 (index!39158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60866 (_ BitVec 32)) SeekEntryResult!9196)

(assert (=> b!976417 (= res!653698 (= (seekEntryOrOpen!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9196 #b00000000000000000000000000000000)))))

(assert (=> b!976417 (=> (not res!653698) (not e!550258))))

(declare-fun b!976418 () Bool)

(declare-fun call!41739 () Bool)

(assert (=> b!976418 (= e!550258 call!41739)))

(declare-fun b!976419 () Bool)

(assert (=> b!976419 (= e!550259 call!41739)))

(declare-fun bm!41736 () Bool)

(assert (=> bm!41736 (= call!41739 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116265 () Bool)

(declare-fun res!653697 () Bool)

(declare-fun e!550260 () Bool)

(assert (=> d!116265 (=> res!653697 e!550260)))

(assert (=> d!116265 (= res!653697 (bvsge #b00000000000000000000000000000000 (size!29778 _keys!1717)))))

(assert (=> d!116265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!550260)))

(declare-fun b!976420 () Bool)

(assert (=> b!976420 (= e!550260 e!550259)))

(declare-fun c!99888 () Bool)

(assert (=> b!976420 (= c!99888 (validKeyInArray!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116265 (not res!653697)) b!976420))

(assert (= (and b!976420 c!99888) b!976417))

(assert (= (and b!976420 (not c!99888)) b!976419))

(assert (= (and b!976417 res!653698) b!976418))

(assert (= (or b!976418 b!976419) bm!41736))

(declare-fun m!903125 () Bool)

(assert (=> b!976417 m!903125))

(declare-fun m!903127 () Bool)

(assert (=> b!976417 m!903127))

(declare-fun m!903129 () Bool)

(assert (=> b!976417 m!903129))

(assert (=> b!976417 m!903125))

(declare-fun m!903131 () Bool)

(assert (=> b!976417 m!903131))

(declare-fun m!903133 () Bool)

(assert (=> bm!41736 m!903133))

(assert (=> b!976420 m!903125))

(assert (=> b!976420 m!903125))

(declare-fun m!903135 () Bool)

(assert (=> b!976420 m!903135))

(assert (=> b!976266 d!116265))

(declare-fun d!116267 () Bool)

(assert (=> d!116267 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83544 d!116267))

(declare-fun d!116269 () Bool)

(assert (=> d!116269 (= (array_inv!22693 _values!1425) (bvsge (size!29777 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83544 d!116269))

(declare-fun d!116271 () Bool)

(assert (=> d!116271 (= (array_inv!22694 _keys!1717) (bvsge (size!29778 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83544 d!116271))

(declare-fun d!116273 () Bool)

(assert (=> d!116273 (= (validKeyInArray!0 (select (arr!29297 _keys!1717) i!822)) (and (not (= (select (arr!29297 _keys!1717) i!822) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29297 _keys!1717) i!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976261 d!116273))

(declare-fun b!976431 () Bool)

(declare-fun e!550271 () Bool)

(declare-fun call!41742 () Bool)

(assert (=> b!976431 (= e!550271 call!41742)))

(declare-fun bm!41739 () Bool)

(declare-fun c!99891 () Bool)

(assert (=> bm!41739 (= call!41742 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99891 (Cons!20371 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) Nil!20372) Nil!20372)))))

(declare-fun b!976432 () Bool)

(assert (=> b!976432 (= e!550271 call!41742)))

(declare-fun b!976433 () Bool)

(declare-fun e!550270 () Bool)

(assert (=> b!976433 (= e!550270 e!550271)))

(assert (=> b!976433 (= c!99891 (validKeyInArray!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976435 () Bool)

(declare-fun e!550269 () Bool)

(declare-fun contains!5673 (List!20375 (_ BitVec 64)) Bool)

(assert (=> b!976435 (= e!550269 (contains!5673 Nil!20372 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976434 () Bool)

(declare-fun e!550272 () Bool)

(assert (=> b!976434 (= e!550272 e!550270)))

(declare-fun res!653707 () Bool)

(assert (=> b!976434 (=> (not res!653707) (not e!550270))))

(assert (=> b!976434 (= res!653707 (not e!550269))))

(declare-fun res!653705 () Bool)

(assert (=> b!976434 (=> (not res!653705) (not e!550269))))

(assert (=> b!976434 (= res!653705 (validKeyInArray!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun d!116275 () Bool)

(declare-fun res!653706 () Bool)

(assert (=> d!116275 (=> res!653706 e!550272)))

(assert (=> d!116275 (= res!653706 (bvsge #b00000000000000000000000000000000 (size!29778 _keys!1717)))))

(assert (=> d!116275 (= (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20372) e!550272)))

(assert (= (and d!116275 (not res!653706)) b!976434))

(assert (= (and b!976434 res!653705) b!976435))

(assert (= (and b!976434 res!653707) b!976433))

(assert (= (and b!976433 c!99891) b!976432))

(assert (= (and b!976433 (not c!99891)) b!976431))

(assert (= (or b!976432 b!976431) bm!41739))

(assert (=> bm!41739 m!903125))

(declare-fun m!903137 () Bool)

(assert (=> bm!41739 m!903137))

(assert (=> b!976433 m!903125))

(assert (=> b!976433 m!903125))

(assert (=> b!976433 m!903135))

(assert (=> b!976435 m!903125))

(assert (=> b!976435 m!903125))

(declare-fun m!903139 () Bool)

(assert (=> b!976435 m!903139))

(assert (=> b!976434 m!903125))

(assert (=> b!976434 m!903125))

(assert (=> b!976434 m!903135))

(assert (=> b!976268 d!116275))

(declare-fun d!116277 () Bool)

(declare-fun e!550273 () Bool)

(assert (=> d!116277 e!550273))

(declare-fun res!653708 () Bool)

(assert (=> d!116277 (=> res!653708 e!550273)))

(declare-fun lt!432997 () Bool)

(assert (=> d!116277 (= res!653708 (not lt!432997))))

(declare-fun lt!433000 () Bool)

(assert (=> d!116277 (= lt!432997 lt!433000)))

(declare-fun lt!432998 () Unit!32342)

(declare-fun e!550274 () Unit!32342)

(assert (=> d!116277 (= lt!432998 e!550274)))

(declare-fun c!99892 () Bool)

(assert (=> d!116277 (= c!99892 lt!433000)))

(assert (=> d!116277 (= lt!433000 (containsKey!476 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(assert (=> d!116277 (= (contains!5670 lt!432903 (select (arr!29297 _keys!1717) i!822)) lt!432997)))

(declare-fun b!976436 () Bool)

(declare-fun lt!432999 () Unit!32342)

(assert (=> b!976436 (= e!550274 lt!432999)))

(assert (=> b!976436 (= lt!432999 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(assert (=> b!976436 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976437 () Bool)

(declare-fun Unit!32346 () Unit!32342)

(assert (=> b!976437 (= e!550274 Unit!32346)))

(declare-fun b!976438 () Bool)

(assert (=> b!976438 (= e!550273 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822))))))

(assert (= (and d!116277 c!99892) b!976436))

(assert (= (and d!116277 (not c!99892)) b!976437))

(assert (= (and d!116277 (not res!653708)) b!976438))

(assert (=> d!116277 m!902975))

(declare-fun m!903141 () Bool)

(assert (=> d!116277 m!903141))

(assert (=> b!976436 m!902975))

(declare-fun m!903143 () Bool)

(assert (=> b!976436 m!903143))

(assert (=> b!976436 m!902975))

(declare-fun m!903145 () Bool)

(assert (=> b!976436 m!903145))

(assert (=> b!976436 m!903145))

(declare-fun m!903147 () Bool)

(assert (=> b!976436 m!903147))

(assert (=> b!976438 m!902975))

(assert (=> b!976438 m!903145))

(assert (=> b!976438 m!903145))

(assert (=> b!976438 m!903147))

(assert (=> b!976259 d!116277))

(declare-fun d!116279 () Bool)

(assert (=> d!116279 (= (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (and (not (= (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976260 d!116279))

(declare-fun b!976439 () Bool)

(declare-fun e!550283 () ListLongMap!13255)

(declare-fun call!41746 () ListLongMap!13255)

(assert (=> b!976439 (= e!550283 call!41746)))

(declare-fun b!976440 () Bool)

(declare-fun res!653709 () Bool)

(declare-fun e!550277 () Bool)

(assert (=> b!976440 (=> (not res!653709) (not e!550277))))

(declare-fun e!550280 () Bool)

(assert (=> b!976440 (= res!653709 e!550280)))

(declare-fun c!99893 () Bool)

(assert (=> b!976440 (= c!99893 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!976441 () Bool)

(declare-fun e!550285 () Bool)

(assert (=> b!976441 (= e!550280 e!550285)))

(declare-fun res!653711 () Bool)

(declare-fun call!41748 () Bool)

(assert (=> b!976441 (= res!653711 call!41748)))

(assert (=> b!976441 (=> (not res!653711) (not e!550285))))

(declare-fun b!976442 () Bool)

(declare-fun c!99898 () Bool)

(assert (=> b!976442 (= c!99898 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!550287 () ListLongMap!13255)

(assert (=> b!976442 (= e!550287 e!550283)))

(declare-fun bm!41740 () Bool)

(declare-fun call!41749 () ListLongMap!13255)

(assert (=> bm!41740 (= call!41749 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976443 () Bool)

(assert (=> b!976443 (= e!550280 (not call!41748))))

(declare-fun bm!41741 () Bool)

(declare-fun call!41743 () ListLongMap!13255)

(assert (=> bm!41741 (= call!41743 call!41749)))

(declare-fun b!976444 () Bool)

(declare-fun e!550282 () Bool)

(assert (=> b!976444 (= e!550277 e!550282)))

(declare-fun c!99895 () Bool)

(assert (=> b!976444 (= c!99895 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!976445 () Bool)

(declare-fun res!653713 () Bool)

(assert (=> b!976445 (=> (not res!653713) (not e!550277))))

(declare-fun e!550279 () Bool)

(assert (=> b!976445 (= res!653713 e!550279)))

(declare-fun res!653712 () Bool)

(assert (=> b!976445 (=> res!653712 e!550279)))

(declare-fun e!550275 () Bool)

(assert (=> b!976445 (= res!653712 (not e!550275))))

(declare-fun res!653716 () Bool)

(assert (=> b!976445 (=> (not res!653716) (not e!550275))))

(assert (=> b!976445 (= res!653716 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun b!976446 () Bool)

(declare-fun lt!433010 () ListLongMap!13255)

(assert (=> b!976446 (= e!550285 (= (apply!883 lt!433010 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun d!116281 () Bool)

(assert (=> d!116281 e!550277))

(declare-fun res!653714 () Bool)

(assert (=> d!116281 (=> (not res!653714) (not e!550277))))

(assert (=> d!116281 (= res!653714 (or (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)) (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))))

(declare-fun lt!433007 () ListLongMap!13255)

(assert (=> d!116281 (= lt!433010 lt!433007)))

(declare-fun lt!433021 () Unit!32342)

(declare-fun e!550278 () Unit!32342)

(assert (=> d!116281 (= lt!433021 e!550278)))

(declare-fun c!99896 () Bool)

(declare-fun e!550286 () Bool)

(assert (=> d!116281 (= c!99896 e!550286)))

(declare-fun res!653715 () Bool)

(assert (=> d!116281 (=> (not res!653715) (not e!550286))))

(assert (=> d!116281 (= res!653715 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun e!550276 () ListLongMap!13255)

(assert (=> d!116281 (= lt!433007 e!550276)))

(declare-fun c!99897 () Bool)

(assert (=> d!116281 (= c!99897 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116281 (validMask!0 mask!2147)))

(assert (=> d!116281 (= (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433010)))

(declare-fun b!976447 () Bool)

(declare-fun lt!433020 () Unit!32342)

(assert (=> b!976447 (= e!550278 lt!433020)))

(declare-fun lt!433002 () ListLongMap!13255)

(assert (=> b!976447 (= lt!433002 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433014 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433004 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433004 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433017 () Unit!32342)

(assert (=> b!976447 (= lt!433017 (addStillContains!606 lt!433002 lt!433014 zeroValue!1367 lt!433004))))

(assert (=> b!976447 (contains!5670 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367)) lt!433004)))

(declare-fun lt!433001 () Unit!32342)

(assert (=> b!976447 (= lt!433001 lt!433017)))

(declare-fun lt!433013 () ListLongMap!13255)

(assert (=> b!976447 (= lt!433013 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433008 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433008 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433005 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433005 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433011 () Unit!32342)

(assert (=> b!976447 (= lt!433011 (addApplyDifferent!462 lt!433013 lt!433008 minValue!1367 lt!433005))))

(assert (=> b!976447 (= (apply!883 (+!2945 lt!433013 (tuple2!14569 lt!433008 minValue!1367)) lt!433005) (apply!883 lt!433013 lt!433005))))

(declare-fun lt!433018 () Unit!32342)

(assert (=> b!976447 (= lt!433018 lt!433011)))

(declare-fun lt!433022 () ListLongMap!13255)

(assert (=> b!976447 (= lt!433022 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433012 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433016 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433016 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433015 () Unit!32342)

(assert (=> b!976447 (= lt!433015 (addApplyDifferent!462 lt!433022 lt!433012 zeroValue!1367 lt!433016))))

(assert (=> b!976447 (= (apply!883 (+!2945 lt!433022 (tuple2!14569 lt!433012 zeroValue!1367)) lt!433016) (apply!883 lt!433022 lt!433016))))

(declare-fun lt!433006 () Unit!32342)

(assert (=> b!976447 (= lt!433006 lt!433015)))

(declare-fun lt!433003 () ListLongMap!13255)

(assert (=> b!976447 (= lt!433003 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433019 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433009 () (_ BitVec 64))

(assert (=> b!976447 (= lt!433009 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976447 (= lt!433020 (addApplyDifferent!462 lt!433003 lt!433019 minValue!1367 lt!433009))))

(assert (=> b!976447 (= (apply!883 (+!2945 lt!433003 (tuple2!14569 lt!433019 minValue!1367)) lt!433009) (apply!883 lt!433003 lt!433009))))

(declare-fun bm!41742 () Bool)

(declare-fun call!41744 () ListLongMap!13255)

(assert (=> bm!41742 (= call!41746 call!41744)))

(declare-fun b!976448 () Bool)

(declare-fun call!41747 () ListLongMap!13255)

(assert (=> b!976448 (= e!550283 call!41747)))

(declare-fun b!976449 () Bool)

(declare-fun e!550281 () Bool)

(assert (=> b!976449 (= e!550281 (= (apply!883 lt!433010 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!976450 () Bool)

(assert (=> b!976450 (= e!550286 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976451 () Bool)

(assert (=> b!976451 (= e!550287 call!41746)))

(declare-fun b!976452 () Bool)

(assert (=> b!976452 (= e!550276 e!550287)))

(declare-fun c!99894 () Bool)

(assert (=> b!976452 (= c!99894 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!550284 () Bool)

(declare-fun b!976453 () Bool)

(assert (=> b!976453 (= e!550284 (= (apply!883 lt!433010 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15182 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976453 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29777 _values!1425)))))

(assert (=> b!976453 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun bm!41743 () Bool)

(assert (=> bm!41743 (= call!41747 call!41743)))

(declare-fun b!976454 () Bool)

(assert (=> b!976454 (= e!550276 (+!2945 call!41744 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun b!976455 () Bool)

(declare-fun Unit!32347 () Unit!32342)

(assert (=> b!976455 (= e!550278 Unit!32347)))

(declare-fun b!976456 () Bool)

(declare-fun call!41745 () Bool)

(assert (=> b!976456 (= e!550282 (not call!41745))))

(declare-fun b!976457 () Bool)

(assert (=> b!976457 (= e!550282 e!550281)))

(declare-fun res!653717 () Bool)

(assert (=> b!976457 (= res!653717 call!41745)))

(assert (=> b!976457 (=> (not res!653717) (not e!550281))))

(declare-fun bm!41744 () Bool)

(assert (=> bm!41744 (= call!41748 (contains!5670 lt!433010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41745 () Bool)

(assert (=> bm!41745 (= call!41744 (+!2945 (ite c!99897 call!41749 (ite c!99894 call!41743 call!41747)) (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun b!976458 () Bool)

(assert (=> b!976458 (= e!550275 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976459 () Bool)

(assert (=> b!976459 (= e!550279 e!550284)))

(declare-fun res!653710 () Bool)

(assert (=> b!976459 (=> (not res!653710) (not e!550284))))

(assert (=> b!976459 (= res!653710 (contains!5670 lt!433010 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976459 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun bm!41746 () Bool)

(assert (=> bm!41746 (= call!41745 (contains!5670 lt!433010 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116281 c!99897) b!976454))

(assert (= (and d!116281 (not c!99897)) b!976452))

(assert (= (and b!976452 c!99894) b!976451))

(assert (= (and b!976452 (not c!99894)) b!976442))

(assert (= (and b!976442 c!99898) b!976439))

(assert (= (and b!976442 (not c!99898)) b!976448))

(assert (= (or b!976439 b!976448) bm!41743))

(assert (= (or b!976451 bm!41743) bm!41741))

(assert (= (or b!976451 b!976439) bm!41742))

(assert (= (or b!976454 bm!41741) bm!41740))

(assert (= (or b!976454 bm!41742) bm!41745))

(assert (= (and d!116281 res!653715) b!976450))

(assert (= (and d!116281 c!99896) b!976447))

(assert (= (and d!116281 (not c!99896)) b!976455))

(assert (= (and d!116281 res!653714) b!976445))

(assert (= (and b!976445 res!653716) b!976458))

(assert (= (and b!976445 (not res!653712)) b!976459))

(assert (= (and b!976459 res!653710) b!976453))

(assert (= (and b!976445 res!653713) b!976440))

(assert (= (and b!976440 c!99893) b!976441))

(assert (= (and b!976440 (not c!99893)) b!976443))

(assert (= (and b!976441 res!653711) b!976446))

(assert (= (or b!976441 b!976443) bm!41744))

(assert (= (and b!976440 res!653709) b!976444))

(assert (= (and b!976444 c!99895) b!976457))

(assert (= (and b!976444 (not c!99895)) b!976456))

(assert (= (and b!976457 res!653717) b!976449))

(assert (= (or b!976457 b!976456) bm!41746))

(declare-fun b_lambda!14565 () Bool)

(assert (=> (not b_lambda!14565) (not b!976453)))

(assert (=> b!976453 t!28884))

(declare-fun b_and!31169 () Bool)

(assert (= b_and!31167 (and (=> t!28884 result!12699) b_and!31169)))

(declare-fun m!903149 () Bool)

(assert (=> bm!41744 m!903149))

(declare-fun m!903151 () Bool)

(assert (=> b!976449 m!903151))

(declare-fun m!903153 () Bool)

(assert (=> bm!41746 m!903153))

(declare-fun m!903155 () Bool)

(assert (=> b!976446 m!903155))

(declare-fun m!903157 () Bool)

(assert (=> b!976447 m!903157))

(declare-fun m!903159 () Bool)

(assert (=> b!976447 m!903159))

(declare-fun m!903161 () Bool)

(assert (=> b!976447 m!903161))

(declare-fun m!903163 () Bool)

(assert (=> b!976447 m!903163))

(declare-fun m!903165 () Bool)

(assert (=> b!976447 m!903165))

(declare-fun m!903167 () Bool)

(assert (=> b!976447 m!903167))

(assert (=> b!976447 m!903161))

(declare-fun m!903169 () Bool)

(assert (=> b!976447 m!903169))

(declare-fun m!903171 () Bool)

(assert (=> b!976447 m!903171))

(declare-fun m!903173 () Bool)

(assert (=> b!976447 m!903173))

(assert (=> b!976447 m!903167))

(declare-fun m!903175 () Bool)

(assert (=> b!976447 m!903175))

(declare-fun m!903177 () Bool)

(assert (=> b!976447 m!903177))

(declare-fun m!903179 () Bool)

(assert (=> b!976447 m!903179))

(declare-fun m!903181 () Bool)

(assert (=> b!976447 m!903181))

(assert (=> b!976447 m!902991))

(assert (=> b!976447 m!903171))

(declare-fun m!903183 () Bool)

(assert (=> b!976447 m!903183))

(declare-fun m!903185 () Bool)

(assert (=> b!976447 m!903185))

(assert (=> b!976447 m!903177))

(declare-fun m!903187 () Bool)

(assert (=> b!976447 m!903187))

(assert (=> b!976453 m!902991))

(declare-fun m!903189 () Bool)

(assert (=> b!976453 m!903189))

(assert (=> b!976453 m!902991))

(declare-fun m!903191 () Bool)

(assert (=> b!976453 m!903191))

(assert (=> b!976453 m!903191))

(assert (=> b!976453 m!903113))

(declare-fun m!903193 () Bool)

(assert (=> b!976453 m!903193))

(assert (=> b!976453 m!903113))

(assert (=> b!976459 m!902991))

(assert (=> b!976459 m!902991))

(declare-fun m!903195 () Bool)

(assert (=> b!976459 m!903195))

(assert (=> b!976458 m!902991))

(assert (=> b!976458 m!902991))

(assert (=> b!976458 m!902993))

(assert (=> d!116281 m!902981))

(assert (=> bm!41740 m!903159))

(declare-fun m!903197 () Bool)

(assert (=> bm!41745 m!903197))

(assert (=> b!976450 m!902991))

(assert (=> b!976450 m!902991))

(assert (=> b!976450 m!902993))

(declare-fun m!903199 () Bool)

(assert (=> b!976454 m!903199))

(assert (=> b!976260 d!116281))

(declare-fun condMapEmpty!35698 () Bool)

(declare-fun mapDefault!35698 () ValueCell!10745)

(assert (=> mapNonEmpty!35689 (= condMapEmpty!35698 (= mapRest!35689 ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35698)))))

(declare-fun e!550293 () Bool)

(declare-fun mapRes!35698 () Bool)

(assert (=> mapNonEmpty!35689 (= tp!67936 (and e!550293 mapRes!35698))))

(declare-fun mapNonEmpty!35698 () Bool)

(declare-fun tp!67951 () Bool)

(declare-fun e!550292 () Bool)

(assert (=> mapNonEmpty!35698 (= mapRes!35698 (and tp!67951 e!550292))))

(declare-fun mapRest!35698 () (Array (_ BitVec 32) ValueCell!10745))

(declare-fun mapKey!35698 () (_ BitVec 32))

(declare-fun mapValue!35698 () ValueCell!10745)

(assert (=> mapNonEmpty!35698 (= mapRest!35689 (store mapRest!35698 mapKey!35698 mapValue!35698))))

(declare-fun b!976467 () Bool)

(assert (=> b!976467 (= e!550293 tp_is_empty!22453)))

(declare-fun b!976466 () Bool)

(assert (=> b!976466 (= e!550292 tp_is_empty!22453)))

(declare-fun mapIsEmpty!35698 () Bool)

(assert (=> mapIsEmpty!35698 mapRes!35698))

(assert (= (and mapNonEmpty!35689 condMapEmpty!35698) mapIsEmpty!35698))

(assert (= (and mapNonEmpty!35689 (not condMapEmpty!35698)) mapNonEmpty!35698))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10745) mapValue!35698)) b!976466))

(assert (= (and mapNonEmpty!35689 ((_ is ValueCellFull!10745) mapDefault!35698)) b!976467))

(declare-fun m!903201 () Bool)

(assert (=> mapNonEmpty!35698 m!903201))

(declare-fun b_lambda!14567 () Bool)

(assert (= b_lambda!14565 (or (and start!83544 b_free!19549) b_lambda!14567)))

(declare-fun b_lambda!14569 () Bool)

(assert (= b_lambda!14563 (or (and start!83544 b_free!19549) b_lambda!14569)))

(check-sat (not b!976434) (not d!116261) (not bm!41727) (not b!976394) (not d!116277) (not bm!41736) (not d!116281) (not bm!41733) (not bm!41740) (not b!976417) (not b!976436) (not b!976435) (not b!976453) (not b!976341) (not b!976393) (not bm!41746) (not b!976438) (not b!976450) (not bm!41732) (not b!976406) (not b!976405) b_and!31169 (not bm!41731) (not b_lambda!14567) (not b!976396) (not d!116263) (not b!976454) (not bm!41745) (not b!976401) (not b_lambda!14569) (not b!976343) (not b!976400) (not b!976433) (not b!976420) (not b!976459) (not b!976446) (not bm!41739) (not b!976447) (not mapNonEmpty!35698) (not b!976449) (not b!976397) (not bm!41744) tp_is_empty!22453 (not b!976458) (not b_next!19549))
(check-sat b_and!31169 (not b_next!19549))
(get-model)

(declare-fun d!116283 () Bool)

(declare-fun get!15183 (Option!518) V!34921)

(assert (=> d!116283 (= (apply!883 lt!432975 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15183 (getValueByKey!512 (toList!6643 lt!432975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27590 () Bool)

(assert (= bs!27590 d!116283))

(declare-fun m!903203 () Bool)

(assert (=> bs!27590 m!903203))

(assert (=> bs!27590 m!903203))

(declare-fun m!903205 () Bool)

(assert (=> bs!27590 m!903205))

(assert (=> b!976393 d!116283))

(declare-fun d!116285 () Bool)

(declare-fun e!550294 () Bool)

(assert (=> d!116285 e!550294))

(declare-fun res!653718 () Bool)

(assert (=> d!116285 (=> res!653718 e!550294)))

(declare-fun lt!433023 () Bool)

(assert (=> d!116285 (= res!653718 (not lt!433023))))

(declare-fun lt!433026 () Bool)

(assert (=> d!116285 (= lt!433023 lt!433026)))

(declare-fun lt!433024 () Unit!32342)

(declare-fun e!550295 () Unit!32342)

(assert (=> d!116285 (= lt!433024 e!550295)))

(declare-fun c!99899 () Bool)

(assert (=> d!116285 (= c!99899 lt!433026)))

(assert (=> d!116285 (= lt!433026 (containsKey!476 (toList!6643 lt!433010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116285 (= (contains!5670 lt!433010 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433023)))

(declare-fun b!976468 () Bool)

(declare-fun lt!433025 () Unit!32342)

(assert (=> b!976468 (= e!550295 lt!433025)))

(assert (=> b!976468 (= lt!433025 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!433010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976468 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976469 () Bool)

(declare-fun Unit!32348 () Unit!32342)

(assert (=> b!976469 (= e!550295 Unit!32348)))

(declare-fun b!976470 () Bool)

(assert (=> b!976470 (= e!550294 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116285 c!99899) b!976468))

(assert (= (and d!116285 (not c!99899)) b!976469))

(assert (= (and d!116285 (not res!653718)) b!976470))

(declare-fun m!903207 () Bool)

(assert (=> d!116285 m!903207))

(declare-fun m!903209 () Bool)

(assert (=> b!976468 m!903209))

(declare-fun m!903211 () Bool)

(assert (=> b!976468 m!903211))

(assert (=> b!976468 m!903211))

(declare-fun m!903213 () Bool)

(assert (=> b!976468 m!903213))

(assert (=> b!976470 m!903211))

(assert (=> b!976470 m!903211))

(assert (=> b!976470 m!903213))

(assert (=> bm!41746 d!116285))

(assert (=> d!116281 d!116267))

(declare-fun d!116287 () Bool)

(assert (=> d!116287 (= (apply!883 (+!2945 lt!432978 (tuple2!14569 lt!432973 minValue!1367)) lt!432970) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!432978 (tuple2!14569 lt!432973 minValue!1367))) lt!432970)))))

(declare-fun bs!27591 () Bool)

(assert (= bs!27591 d!116287))

(declare-fun m!903215 () Bool)

(assert (=> bs!27591 m!903215))

(assert (=> bs!27591 m!903215))

(declare-fun m!903217 () Bool)

(assert (=> bs!27591 m!903217))

(assert (=> b!976394 d!116287))

(declare-fun d!116289 () Bool)

(assert (=> d!116289 (= (apply!883 (+!2945 lt!432978 (tuple2!14569 lt!432973 minValue!1367)) lt!432970) (apply!883 lt!432978 lt!432970))))

(declare-fun lt!433029 () Unit!32342)

(declare-fun choose!1610 (ListLongMap!13255 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32342)

(assert (=> d!116289 (= lt!433029 (choose!1610 lt!432978 lt!432973 minValue!1367 lt!432970))))

(declare-fun e!550298 () Bool)

(assert (=> d!116289 e!550298))

(declare-fun res!653721 () Bool)

(assert (=> d!116289 (=> (not res!653721) (not e!550298))))

(assert (=> d!116289 (= res!653721 (contains!5670 lt!432978 lt!432970))))

(assert (=> d!116289 (= (addApplyDifferent!462 lt!432978 lt!432973 minValue!1367 lt!432970) lt!433029)))

(declare-fun b!976474 () Bool)

(assert (=> b!976474 (= e!550298 (not (= lt!432970 lt!432973)))))

(assert (= (and d!116289 res!653721) b!976474))

(assert (=> d!116289 m!903107))

(assert (=> d!116289 m!903079))

(declare-fun m!903219 () Bool)

(assert (=> d!116289 m!903219))

(declare-fun m!903221 () Bool)

(assert (=> d!116289 m!903221))

(assert (=> d!116289 m!903079))

(assert (=> d!116289 m!903081))

(assert (=> b!976394 d!116289))

(declare-fun d!116291 () Bool)

(declare-fun e!550301 () Bool)

(assert (=> d!116291 e!550301))

(declare-fun res!653726 () Bool)

(assert (=> d!116291 (=> (not res!653726) (not e!550301))))

(declare-fun lt!433039 () ListLongMap!13255)

(assert (=> d!116291 (= res!653726 (contains!5670 lt!433039 (_1!7295 (tuple2!14569 lt!432979 zeroValue!1367))))))

(declare-fun lt!433038 () List!20374)

(assert (=> d!116291 (= lt!433039 (ListLongMap!13256 lt!433038))))

(declare-fun lt!433041 () Unit!32342)

(declare-fun lt!433040 () Unit!32342)

(assert (=> d!116291 (= lt!433041 lt!433040)))

(assert (=> d!116291 (= (getValueByKey!512 lt!433038 (_1!7295 (tuple2!14569 lt!432979 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432979 zeroValue!1367))))))

(declare-fun lemmaContainsTupThenGetReturnValue!269 (List!20374 (_ BitVec 64) V!34921) Unit!32342)

(assert (=> d!116291 (= lt!433040 (lemmaContainsTupThenGetReturnValue!269 lt!433038 (_1!7295 (tuple2!14569 lt!432979 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!432979 zeroValue!1367))))))

(declare-fun insertStrictlySorted!326 (List!20374 (_ BitVec 64) V!34921) List!20374)

(assert (=> d!116291 (= lt!433038 (insertStrictlySorted!326 (toList!6643 lt!432967) (_1!7295 (tuple2!14569 lt!432979 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!432979 zeroValue!1367))))))

(assert (=> d!116291 (= (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367)) lt!433039)))

(declare-fun b!976479 () Bool)

(declare-fun res!653727 () Bool)

(assert (=> b!976479 (=> (not res!653727) (not e!550301))))

(assert (=> b!976479 (= res!653727 (= (getValueByKey!512 (toList!6643 lt!433039) (_1!7295 (tuple2!14569 lt!432979 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432979 zeroValue!1367)))))))

(declare-fun b!976480 () Bool)

(declare-fun contains!5674 (List!20374 tuple2!14568) Bool)

(assert (=> b!976480 (= e!550301 (contains!5674 (toList!6643 lt!433039) (tuple2!14569 lt!432979 zeroValue!1367)))))

(assert (= (and d!116291 res!653726) b!976479))

(assert (= (and b!976479 res!653727) b!976480))

(declare-fun m!903223 () Bool)

(assert (=> d!116291 m!903223))

(declare-fun m!903225 () Bool)

(assert (=> d!116291 m!903225))

(declare-fun m!903227 () Bool)

(assert (=> d!116291 m!903227))

(declare-fun m!903229 () Bool)

(assert (=> d!116291 m!903229))

(declare-fun m!903231 () Bool)

(assert (=> b!976479 m!903231))

(declare-fun m!903233 () Bool)

(assert (=> b!976480 m!903233))

(assert (=> b!976394 d!116291))

(declare-fun b!976505 () Bool)

(declare-fun e!550322 () ListLongMap!13255)

(declare-fun call!41752 () ListLongMap!13255)

(assert (=> b!976505 (= e!550322 call!41752)))

(declare-fun b!976506 () Bool)

(declare-fun e!550317 () ListLongMap!13255)

(assert (=> b!976506 (= e!550317 (ListLongMap!13256 Nil!20371))))

(declare-fun b!976507 () Bool)

(declare-fun e!550320 () Bool)

(assert (=> b!976507 (= e!550320 (validKeyInArray!0 (select (arr!29297 _keys!1717) from!2118)))))

(assert (=> b!976507 (bvsge from!2118 #b00000000000000000000000000000000)))

(declare-fun b!976508 () Bool)

(declare-fun e!550318 () Bool)

(declare-fun e!550321 () Bool)

(assert (=> b!976508 (= e!550318 e!550321)))

(assert (=> b!976508 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun res!653739 () Bool)

(declare-fun lt!433059 () ListLongMap!13255)

(assert (=> b!976508 (= res!653739 (contains!5670 lt!433059 (select (arr!29297 _keys!1717) from!2118)))))

(assert (=> b!976508 (=> (not res!653739) (not e!550321))))

(declare-fun b!976509 () Bool)

(declare-fun e!550319 () Bool)

(declare-fun isEmpty!721 (ListLongMap!13255) Bool)

(assert (=> b!976509 (= e!550319 (isEmpty!721 lt!433059))))

(declare-fun b!976510 () Bool)

(declare-fun e!550316 () Bool)

(assert (=> b!976510 (= e!550316 e!550318)))

(declare-fun c!99909 () Bool)

(assert (=> b!976510 (= c!99909 e!550320)))

(declare-fun res!653737 () Bool)

(assert (=> b!976510 (=> (not res!653737) (not e!550320))))

(assert (=> b!976510 (= res!653737 (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun bm!41749 () Bool)

(assert (=> bm!41749 (= call!41752 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun d!116293 () Bool)

(assert (=> d!116293 e!550316))

(declare-fun res!653736 () Bool)

(assert (=> d!116293 (=> (not res!653736) (not e!550316))))

(assert (=> d!116293 (= res!653736 (not (contains!5670 lt!433059 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116293 (= lt!433059 e!550317)))

(declare-fun c!99911 () Bool)

(assert (=> d!116293 (= c!99911 (bvsge from!2118 (size!29778 _keys!1717)))))

(assert (=> d!116293 (validMask!0 mask!2147)))

(assert (=> d!116293 (= (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!433059)))

(declare-fun b!976511 () Bool)

(assert (=> b!976511 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29778 _keys!1717)))))

(assert (=> b!976511 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29777 _values!1425)))))

(assert (=> b!976511 (= e!550321 (= (apply!883 lt!433059 (select (arr!29297 _keys!1717) from!2118)) (get!15182 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!976512 () Bool)

(assert (=> b!976512 (= e!550318 e!550319)))

(declare-fun c!99908 () Bool)

(assert (=> b!976512 (= c!99908 (bvslt from!2118 (size!29778 _keys!1717)))))

(declare-fun b!976513 () Bool)

(assert (=> b!976513 (= e!550319 (= lt!433059 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428)))))

(declare-fun b!976514 () Bool)

(declare-fun res!653738 () Bool)

(assert (=> b!976514 (=> (not res!653738) (not e!550316))))

(assert (=> b!976514 (= res!653738 (not (contains!5670 lt!433059 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976515 () Bool)

(assert (=> b!976515 (= e!550317 e!550322)))

(declare-fun c!99910 () Bool)

(assert (=> b!976515 (= c!99910 (validKeyInArray!0 (select (arr!29297 _keys!1717) from!2118)))))

(declare-fun b!976516 () Bool)

(declare-fun lt!433060 () Unit!32342)

(declare-fun lt!433062 () Unit!32342)

(assert (=> b!976516 (= lt!433060 lt!433062)))

(declare-fun lt!433057 () (_ BitVec 64))

(declare-fun lt!433058 () V!34921)

(declare-fun lt!433056 () (_ BitVec 64))

(declare-fun lt!433061 () ListLongMap!13255)

(assert (=> b!976516 (not (contains!5670 (+!2945 lt!433061 (tuple2!14569 lt!433056 lt!433058)) lt!433057))))

(declare-fun addStillNotContains!230 (ListLongMap!13255 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32342)

(assert (=> b!976516 (= lt!433062 (addStillNotContains!230 lt!433061 lt!433056 lt!433058 lt!433057))))

(assert (=> b!976516 (= lt!433057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!976516 (= lt!433058 (get!15182 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!976516 (= lt!433056 (select (arr!29297 _keys!1717) from!2118))))

(assert (=> b!976516 (= lt!433061 call!41752)))

(assert (=> b!976516 (= e!550322 (+!2945 call!41752 (tuple2!14569 (select (arr!29297 _keys!1717) from!2118) (get!15182 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116293 c!99911) b!976506))

(assert (= (and d!116293 (not c!99911)) b!976515))

(assert (= (and b!976515 c!99910) b!976516))

(assert (= (and b!976515 (not c!99910)) b!976505))

(assert (= (or b!976516 b!976505) bm!41749))

(assert (= (and d!116293 res!653736) b!976514))

(assert (= (and b!976514 res!653738) b!976510))

(assert (= (and b!976510 res!653737) b!976507))

(assert (= (and b!976510 c!99909) b!976508))

(assert (= (and b!976510 (not c!99909)) b!976512))

(assert (= (and b!976508 res!653739) b!976511))

(assert (= (and b!976512 c!99908) b!976513))

(assert (= (and b!976512 (not c!99908)) b!976509))

(declare-fun b_lambda!14571 () Bool)

(assert (=> (not b_lambda!14571) (not b!976511)))

(assert (=> b!976511 t!28884))

(declare-fun b_and!31171 () Bool)

(assert (= b_and!31169 (and (=> t!28884 result!12699) b_and!31171)))

(declare-fun b_lambda!14573 () Bool)

(assert (=> (not b_lambda!14573) (not b!976516)))

(assert (=> b!976516 t!28884))

(declare-fun b_and!31173 () Bool)

(assert (= b_and!31171 (and (=> t!28884 result!12699) b_and!31173)))

(assert (=> b!976507 m!903101))

(assert (=> b!976507 m!903101))

(assert (=> b!976507 m!903119))

(declare-fun m!903235 () Bool)

(assert (=> b!976513 m!903235))

(assert (=> b!976515 m!903101))

(assert (=> b!976515 m!903101))

(assert (=> b!976515 m!903119))

(assert (=> b!976508 m!903101))

(assert (=> b!976508 m!903101))

(declare-fun m!903237 () Bool)

(assert (=> b!976508 m!903237))

(declare-fun m!903239 () Bool)

(assert (=> b!976509 m!903239))

(assert (=> b!976511 m!903111))

(assert (=> b!976511 m!903101))

(declare-fun m!903241 () Bool)

(assert (=> b!976511 m!903241))

(assert (=> b!976511 m!903101))

(assert (=> b!976511 m!903111))

(assert (=> b!976511 m!903113))

(assert (=> b!976511 m!903115))

(assert (=> b!976511 m!903113))

(assert (=> b!976516 m!903111))

(declare-fun m!903243 () Bool)

(assert (=> b!976516 m!903243))

(assert (=> b!976516 m!903101))

(declare-fun m!903245 () Bool)

(assert (=> b!976516 m!903245))

(declare-fun m!903247 () Bool)

(assert (=> b!976516 m!903247))

(assert (=> b!976516 m!903245))

(assert (=> b!976516 m!903111))

(assert (=> b!976516 m!903113))

(assert (=> b!976516 m!903115))

(assert (=> b!976516 m!903113))

(declare-fun m!903249 () Bool)

(assert (=> b!976516 m!903249))

(declare-fun m!903251 () Bool)

(assert (=> b!976514 m!903251))

(assert (=> bm!41749 m!903235))

(declare-fun m!903253 () Bool)

(assert (=> d!116293 m!903253))

(assert (=> d!116293 m!902981))

(assert (=> b!976394 d!116293))

(declare-fun d!116295 () Bool)

(assert (=> d!116295 (= (apply!883 (+!2945 lt!432968 (tuple2!14569 lt!432984 minValue!1367)) lt!432974) (apply!883 lt!432968 lt!432974))))

(declare-fun lt!433063 () Unit!32342)

(assert (=> d!116295 (= lt!433063 (choose!1610 lt!432968 lt!432984 minValue!1367 lt!432974))))

(declare-fun e!550323 () Bool)

(assert (=> d!116295 e!550323))

(declare-fun res!653740 () Bool)

(assert (=> d!116295 (=> (not res!653740) (not e!550323))))

(assert (=> d!116295 (= res!653740 (contains!5670 lt!432968 lt!432974))))

(assert (=> d!116295 (= (addApplyDifferent!462 lt!432968 lt!432984 minValue!1367 lt!432974) lt!433063)))

(declare-fun b!976517 () Bool)

(assert (=> b!976517 (= e!550323 (not (= lt!432974 lt!432984)))))

(assert (= (and d!116295 res!653740) b!976517))

(assert (=> d!116295 m!903087))

(assert (=> d!116295 m!903095))

(declare-fun m!903255 () Bool)

(assert (=> d!116295 m!903255))

(declare-fun m!903257 () Bool)

(assert (=> d!116295 m!903257))

(assert (=> d!116295 m!903095))

(assert (=> d!116295 m!903097))

(assert (=> b!976394 d!116295))

(declare-fun d!116297 () Bool)

(declare-fun e!550324 () Bool)

(assert (=> d!116297 e!550324))

(declare-fun res!653741 () Bool)

(assert (=> d!116297 (=> (not res!653741) (not e!550324))))

(declare-fun lt!433065 () ListLongMap!13255)

(assert (=> d!116297 (= res!653741 (contains!5670 lt!433065 (_1!7295 (tuple2!14569 lt!432973 minValue!1367))))))

(declare-fun lt!433064 () List!20374)

(assert (=> d!116297 (= lt!433065 (ListLongMap!13256 lt!433064))))

(declare-fun lt!433067 () Unit!32342)

(declare-fun lt!433066 () Unit!32342)

(assert (=> d!116297 (= lt!433067 lt!433066)))

(assert (=> d!116297 (= (getValueByKey!512 lt!433064 (_1!7295 (tuple2!14569 lt!432973 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432973 minValue!1367))))))

(assert (=> d!116297 (= lt!433066 (lemmaContainsTupThenGetReturnValue!269 lt!433064 (_1!7295 (tuple2!14569 lt!432973 minValue!1367)) (_2!7295 (tuple2!14569 lt!432973 minValue!1367))))))

(assert (=> d!116297 (= lt!433064 (insertStrictlySorted!326 (toList!6643 lt!432978) (_1!7295 (tuple2!14569 lt!432973 minValue!1367)) (_2!7295 (tuple2!14569 lt!432973 minValue!1367))))))

(assert (=> d!116297 (= (+!2945 lt!432978 (tuple2!14569 lt!432973 minValue!1367)) lt!433065)))

(declare-fun b!976518 () Bool)

(declare-fun res!653742 () Bool)

(assert (=> b!976518 (=> (not res!653742) (not e!550324))))

(assert (=> b!976518 (= res!653742 (= (getValueByKey!512 (toList!6643 lt!433065) (_1!7295 (tuple2!14569 lt!432973 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432973 minValue!1367)))))))

(declare-fun b!976519 () Bool)

(assert (=> b!976519 (= e!550324 (contains!5674 (toList!6643 lt!433065) (tuple2!14569 lt!432973 minValue!1367)))))

(assert (= (and d!116297 res!653741) b!976518))

(assert (= (and b!976518 res!653742) b!976519))

(declare-fun m!903259 () Bool)

(assert (=> d!116297 m!903259))

(declare-fun m!903261 () Bool)

(assert (=> d!116297 m!903261))

(declare-fun m!903263 () Bool)

(assert (=> d!116297 m!903263))

(declare-fun m!903265 () Bool)

(assert (=> d!116297 m!903265))

(declare-fun m!903267 () Bool)

(assert (=> b!976518 m!903267))

(declare-fun m!903269 () Bool)

(assert (=> b!976519 m!903269))

(assert (=> b!976394 d!116297))

(declare-fun d!116299 () Bool)

(assert (=> d!116299 (= (apply!883 lt!432987 lt!432981) (get!15183 (getValueByKey!512 (toList!6643 lt!432987) lt!432981)))))

(declare-fun bs!27592 () Bool)

(assert (= bs!27592 d!116299))

(declare-fun m!903271 () Bool)

(assert (=> bs!27592 m!903271))

(assert (=> bs!27592 m!903271))

(declare-fun m!903273 () Bool)

(assert (=> bs!27592 m!903273))

(assert (=> b!976394 d!116299))

(declare-fun d!116301 () Bool)

(assert (=> d!116301 (= (apply!883 lt!432968 lt!432974) (get!15183 (getValueByKey!512 (toList!6643 lt!432968) lt!432974)))))

(declare-fun bs!27593 () Bool)

(assert (= bs!27593 d!116301))

(declare-fun m!903275 () Bool)

(assert (=> bs!27593 m!903275))

(assert (=> bs!27593 m!903275))

(declare-fun m!903277 () Bool)

(assert (=> bs!27593 m!903277))

(assert (=> b!976394 d!116301))

(declare-fun d!116303 () Bool)

(assert (=> d!116303 (= (apply!883 (+!2945 lt!432987 (tuple2!14569 lt!432977 zeroValue!1367)) lt!432981) (apply!883 lt!432987 lt!432981))))

(declare-fun lt!433068 () Unit!32342)

(assert (=> d!116303 (= lt!433068 (choose!1610 lt!432987 lt!432977 zeroValue!1367 lt!432981))))

(declare-fun e!550325 () Bool)

(assert (=> d!116303 e!550325))

(declare-fun res!653743 () Bool)

(assert (=> d!116303 (=> (not res!653743) (not e!550325))))

(assert (=> d!116303 (= res!653743 (contains!5670 lt!432987 lt!432981))))

(assert (=> d!116303 (= (addApplyDifferent!462 lt!432987 lt!432977 zeroValue!1367 lt!432981) lt!433068)))

(declare-fun b!976520 () Bool)

(assert (=> b!976520 (= e!550325 (not (= lt!432981 lt!432977)))))

(assert (= (and d!116303 res!653743) b!976520))

(assert (=> d!116303 m!903091))

(assert (=> d!116303 m!903089))

(declare-fun m!903279 () Bool)

(assert (=> d!116303 m!903279))

(declare-fun m!903281 () Bool)

(assert (=> d!116303 m!903281))

(assert (=> d!116303 m!903089))

(assert (=> d!116303 m!903103))

(assert (=> b!976394 d!116303))

(declare-fun d!116305 () Bool)

(declare-fun e!550326 () Bool)

(assert (=> d!116305 e!550326))

(declare-fun res!653744 () Bool)

(assert (=> d!116305 (=> (not res!653744) (not e!550326))))

(declare-fun lt!433070 () ListLongMap!13255)

(assert (=> d!116305 (= res!653744 (contains!5670 lt!433070 (_1!7295 (tuple2!14569 lt!432977 zeroValue!1367))))))

(declare-fun lt!433069 () List!20374)

(assert (=> d!116305 (= lt!433070 (ListLongMap!13256 lt!433069))))

(declare-fun lt!433072 () Unit!32342)

(declare-fun lt!433071 () Unit!32342)

(assert (=> d!116305 (= lt!433072 lt!433071)))

(assert (=> d!116305 (= (getValueByKey!512 lt!433069 (_1!7295 (tuple2!14569 lt!432977 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432977 zeroValue!1367))))))

(assert (=> d!116305 (= lt!433071 (lemmaContainsTupThenGetReturnValue!269 lt!433069 (_1!7295 (tuple2!14569 lt!432977 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!432977 zeroValue!1367))))))

(assert (=> d!116305 (= lt!433069 (insertStrictlySorted!326 (toList!6643 lt!432987) (_1!7295 (tuple2!14569 lt!432977 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!432977 zeroValue!1367))))))

(assert (=> d!116305 (= (+!2945 lt!432987 (tuple2!14569 lt!432977 zeroValue!1367)) lt!433070)))

(declare-fun b!976521 () Bool)

(declare-fun res!653745 () Bool)

(assert (=> b!976521 (=> (not res!653745) (not e!550326))))

(assert (=> b!976521 (= res!653745 (= (getValueByKey!512 (toList!6643 lt!433070) (_1!7295 (tuple2!14569 lt!432977 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432977 zeroValue!1367)))))))

(declare-fun b!976522 () Bool)

(assert (=> b!976522 (= e!550326 (contains!5674 (toList!6643 lt!433070) (tuple2!14569 lt!432977 zeroValue!1367)))))

(assert (= (and d!116305 res!653744) b!976521))

(assert (= (and b!976521 res!653745) b!976522))

(declare-fun m!903283 () Bool)

(assert (=> d!116305 m!903283))

(declare-fun m!903285 () Bool)

(assert (=> d!116305 m!903285))

(declare-fun m!903287 () Bool)

(assert (=> d!116305 m!903287))

(declare-fun m!903289 () Bool)

(assert (=> d!116305 m!903289))

(declare-fun m!903291 () Bool)

(assert (=> b!976521 m!903291))

(declare-fun m!903293 () Bool)

(assert (=> b!976522 m!903293))

(assert (=> b!976394 d!116305))

(declare-fun d!116307 () Bool)

(assert (=> d!116307 (= (apply!883 (+!2945 lt!432968 (tuple2!14569 lt!432984 minValue!1367)) lt!432974) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!432968 (tuple2!14569 lt!432984 minValue!1367))) lt!432974)))))

(declare-fun bs!27594 () Bool)

(assert (= bs!27594 d!116307))

(declare-fun m!903295 () Bool)

(assert (=> bs!27594 m!903295))

(assert (=> bs!27594 m!903295))

(declare-fun m!903297 () Bool)

(assert (=> bs!27594 m!903297))

(assert (=> b!976394 d!116307))

(declare-fun d!116309 () Bool)

(assert (=> d!116309 (= (apply!883 lt!432978 lt!432970) (get!15183 (getValueByKey!512 (toList!6643 lt!432978) lt!432970)))))

(declare-fun bs!27595 () Bool)

(assert (= bs!27595 d!116309))

(declare-fun m!903299 () Bool)

(assert (=> bs!27595 m!903299))

(assert (=> bs!27595 m!903299))

(declare-fun m!903301 () Bool)

(assert (=> bs!27595 m!903301))

(assert (=> b!976394 d!116309))

(declare-fun d!116311 () Bool)

(declare-fun e!550327 () Bool)

(assert (=> d!116311 e!550327))

(declare-fun res!653746 () Bool)

(assert (=> d!116311 (=> res!653746 e!550327)))

(declare-fun lt!433073 () Bool)

(assert (=> d!116311 (= res!653746 (not lt!433073))))

(declare-fun lt!433076 () Bool)

(assert (=> d!116311 (= lt!433073 lt!433076)))

(declare-fun lt!433074 () Unit!32342)

(declare-fun e!550328 () Unit!32342)

(assert (=> d!116311 (= lt!433074 e!550328)))

(declare-fun c!99912 () Bool)

(assert (=> d!116311 (= c!99912 lt!433076)))

(assert (=> d!116311 (= lt!433076 (containsKey!476 (toList!6643 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367))) lt!432969))))

(assert (=> d!116311 (= (contains!5670 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367)) lt!432969) lt!433073)))

(declare-fun b!976523 () Bool)

(declare-fun lt!433075 () Unit!32342)

(assert (=> b!976523 (= e!550328 lt!433075)))

(assert (=> b!976523 (= lt!433075 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367))) lt!432969))))

(assert (=> b!976523 (isDefined!384 (getValueByKey!512 (toList!6643 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367))) lt!432969))))

(declare-fun b!976524 () Bool)

(declare-fun Unit!32349 () Unit!32342)

(assert (=> b!976524 (= e!550328 Unit!32349)))

(declare-fun b!976525 () Bool)

(assert (=> b!976525 (= e!550327 (isDefined!384 (getValueByKey!512 (toList!6643 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367))) lt!432969)))))

(assert (= (and d!116311 c!99912) b!976523))

(assert (= (and d!116311 (not c!99912)) b!976524))

(assert (= (and d!116311 (not res!653746)) b!976525))

(declare-fun m!903303 () Bool)

(assert (=> d!116311 m!903303))

(declare-fun m!903305 () Bool)

(assert (=> b!976523 m!903305))

(declare-fun m!903307 () Bool)

(assert (=> b!976523 m!903307))

(assert (=> b!976523 m!903307))

(declare-fun m!903309 () Bool)

(assert (=> b!976523 m!903309))

(assert (=> b!976525 m!903307))

(assert (=> b!976525 m!903307))

(assert (=> b!976525 m!903309))

(assert (=> b!976394 d!116311))

(declare-fun d!116313 () Bool)

(assert (=> d!116313 (contains!5670 (+!2945 lt!432967 (tuple2!14569 lt!432979 zeroValue!1367)) lt!432969)))

(declare-fun lt!433079 () Unit!32342)

(declare-fun choose!1611 (ListLongMap!13255 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32342)

(assert (=> d!116313 (= lt!433079 (choose!1611 lt!432967 lt!432979 zeroValue!1367 lt!432969))))

(assert (=> d!116313 (contains!5670 lt!432967 lt!432969)))

(assert (=> d!116313 (= (addStillContains!606 lt!432967 lt!432979 zeroValue!1367 lt!432969) lt!433079)))

(declare-fun bs!27596 () Bool)

(assert (= bs!27596 d!116313))

(assert (=> bs!27596 m!903085))

(assert (=> bs!27596 m!903085))

(assert (=> bs!27596 m!903093))

(declare-fun m!903311 () Bool)

(assert (=> bs!27596 m!903311))

(declare-fun m!903313 () Bool)

(assert (=> bs!27596 m!903313))

(assert (=> b!976394 d!116313))

(declare-fun d!116315 () Bool)

(assert (=> d!116315 (= (apply!883 (+!2945 lt!432987 (tuple2!14569 lt!432977 zeroValue!1367)) lt!432981) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!432987 (tuple2!14569 lt!432977 zeroValue!1367))) lt!432981)))))

(declare-fun bs!27597 () Bool)

(assert (= bs!27597 d!116315))

(declare-fun m!903315 () Bool)

(assert (=> bs!27597 m!903315))

(assert (=> bs!27597 m!903315))

(declare-fun m!903317 () Bool)

(assert (=> bs!27597 m!903317))

(assert (=> b!976394 d!116315))

(declare-fun d!116317 () Bool)

(declare-fun e!550329 () Bool)

(assert (=> d!116317 e!550329))

(declare-fun res!653747 () Bool)

(assert (=> d!116317 (=> (not res!653747) (not e!550329))))

(declare-fun lt!433081 () ListLongMap!13255)

(assert (=> d!116317 (= res!653747 (contains!5670 lt!433081 (_1!7295 (tuple2!14569 lt!432984 minValue!1367))))))

(declare-fun lt!433080 () List!20374)

(assert (=> d!116317 (= lt!433081 (ListLongMap!13256 lt!433080))))

(declare-fun lt!433083 () Unit!32342)

(declare-fun lt!433082 () Unit!32342)

(assert (=> d!116317 (= lt!433083 lt!433082)))

(assert (=> d!116317 (= (getValueByKey!512 lt!433080 (_1!7295 (tuple2!14569 lt!432984 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432984 minValue!1367))))))

(assert (=> d!116317 (= lt!433082 (lemmaContainsTupThenGetReturnValue!269 lt!433080 (_1!7295 (tuple2!14569 lt!432984 minValue!1367)) (_2!7295 (tuple2!14569 lt!432984 minValue!1367))))))

(assert (=> d!116317 (= lt!433080 (insertStrictlySorted!326 (toList!6643 lt!432968) (_1!7295 (tuple2!14569 lt!432984 minValue!1367)) (_2!7295 (tuple2!14569 lt!432984 minValue!1367))))))

(assert (=> d!116317 (= (+!2945 lt!432968 (tuple2!14569 lt!432984 minValue!1367)) lt!433081)))

(declare-fun b!976527 () Bool)

(declare-fun res!653748 () Bool)

(assert (=> b!976527 (=> (not res!653748) (not e!550329))))

(assert (=> b!976527 (= res!653748 (= (getValueByKey!512 (toList!6643 lt!433081) (_1!7295 (tuple2!14569 lt!432984 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!432984 minValue!1367)))))))

(declare-fun b!976528 () Bool)

(assert (=> b!976528 (= e!550329 (contains!5674 (toList!6643 lt!433081) (tuple2!14569 lt!432984 minValue!1367)))))

(assert (= (and d!116317 res!653747) b!976527))

(assert (= (and b!976527 res!653748) b!976528))

(declare-fun m!903319 () Bool)

(assert (=> d!116317 m!903319))

(declare-fun m!903321 () Bool)

(assert (=> d!116317 m!903321))

(declare-fun m!903323 () Bool)

(assert (=> d!116317 m!903323))

(declare-fun m!903325 () Bool)

(assert (=> d!116317 m!903325))

(declare-fun m!903327 () Bool)

(assert (=> b!976527 m!903327))

(declare-fun m!903329 () Bool)

(assert (=> b!976528 m!903329))

(assert (=> b!976394 d!116317))

(assert (=> b!976458 d!116279))

(declare-fun b!976529 () Bool)

(declare-fun e!550336 () ListLongMap!13255)

(declare-fun call!41753 () ListLongMap!13255)

(assert (=> b!976529 (= e!550336 call!41753)))

(declare-fun b!976530 () Bool)

(declare-fun e!550331 () ListLongMap!13255)

(assert (=> b!976530 (= e!550331 (ListLongMap!13256 Nil!20371))))

(declare-fun b!976531 () Bool)

(declare-fun e!550334 () Bool)

(assert (=> b!976531 (= e!550334 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976531 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!976532 () Bool)

(declare-fun e!550332 () Bool)

(declare-fun e!550335 () Bool)

(assert (=> b!976532 (= e!550332 e!550335)))

(assert (=> b!976532 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun lt!433087 () ListLongMap!13255)

(declare-fun res!653752 () Bool)

(assert (=> b!976532 (= res!653752 (contains!5670 lt!433087 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976532 (=> (not res!653752) (not e!550335))))

(declare-fun b!976533 () Bool)

(declare-fun e!550333 () Bool)

(assert (=> b!976533 (= e!550333 (isEmpty!721 lt!433087))))

(declare-fun b!976534 () Bool)

(declare-fun e!550330 () Bool)

(assert (=> b!976534 (= e!550330 e!550332)))

(declare-fun c!99914 () Bool)

(assert (=> b!976534 (= c!99914 e!550334)))

(declare-fun res!653750 () Bool)

(assert (=> b!976534 (=> (not res!653750) (not e!550334))))

(assert (=> b!976534 (= res!653750 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun bm!41750 () Bool)

(assert (=> bm!41750 (= call!41753 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun d!116319 () Bool)

(assert (=> d!116319 e!550330))

(declare-fun res!653749 () Bool)

(assert (=> d!116319 (=> (not res!653749) (not e!550330))))

(assert (=> d!116319 (= res!653749 (not (contains!5670 lt!433087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116319 (= lt!433087 e!550331)))

(declare-fun c!99916 () Bool)

(assert (=> d!116319 (= c!99916 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(assert (=> d!116319 (validMask!0 mask!2147)))

(assert (=> d!116319 (= (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433087)))

(declare-fun b!976535 () Bool)

(assert (=> b!976535 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(assert (=> b!976535 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29777 _values!1425)))))

(assert (=> b!976535 (= e!550335 (= (apply!883 lt!433087 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15182 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!976536 () Bool)

(assert (=> b!976536 (= e!550332 e!550333)))

(declare-fun c!99913 () Bool)

(assert (=> b!976536 (= c!99913 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun b!976537 () Bool)

(assert (=> b!976537 (= e!550333 (= lt!433087 (getCurrentListMapNoExtraKeys!3365 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428)))))

(declare-fun b!976538 () Bool)

(declare-fun res!653751 () Bool)

(assert (=> b!976538 (=> (not res!653751) (not e!550330))))

(assert (=> b!976538 (= res!653751 (not (contains!5670 lt!433087 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976539 () Bool)

(assert (=> b!976539 (= e!550331 e!550336)))

(declare-fun c!99915 () Bool)

(assert (=> b!976539 (= c!99915 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976540 () Bool)

(declare-fun lt!433088 () Unit!32342)

(declare-fun lt!433090 () Unit!32342)

(assert (=> b!976540 (= lt!433088 lt!433090)))

(declare-fun lt!433085 () (_ BitVec 64))

(declare-fun lt!433089 () ListLongMap!13255)

(declare-fun lt!433084 () (_ BitVec 64))

(declare-fun lt!433086 () V!34921)

(assert (=> b!976540 (not (contains!5670 (+!2945 lt!433089 (tuple2!14569 lt!433084 lt!433086)) lt!433085))))

(assert (=> b!976540 (= lt!433090 (addStillNotContains!230 lt!433089 lt!433084 lt!433086 lt!433085))))

(assert (=> b!976540 (= lt!433085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!976540 (= lt!433086 (get!15182 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!976540 (= lt!433084 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976540 (= lt!433089 call!41753)))

(assert (=> b!976540 (= e!550336 (+!2945 call!41753 (tuple2!14569 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) (get!15182 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116319 c!99916) b!976530))

(assert (= (and d!116319 (not c!99916)) b!976539))

(assert (= (and b!976539 c!99915) b!976540))

(assert (= (and b!976539 (not c!99915)) b!976529))

(assert (= (or b!976540 b!976529) bm!41750))

(assert (= (and d!116319 res!653749) b!976538))

(assert (= (and b!976538 res!653751) b!976534))

(assert (= (and b!976534 res!653750) b!976531))

(assert (= (and b!976534 c!99914) b!976532))

(assert (= (and b!976534 (not c!99914)) b!976536))

(assert (= (and b!976532 res!653752) b!976535))

(assert (= (and b!976536 c!99913) b!976537))

(assert (= (and b!976536 (not c!99913)) b!976533))

(declare-fun b_lambda!14575 () Bool)

(assert (=> (not b_lambda!14575) (not b!976535)))

(assert (=> b!976535 t!28884))

(declare-fun b_and!31175 () Bool)

(assert (= b_and!31173 (and (=> t!28884 result!12699) b_and!31175)))

(declare-fun b_lambda!14577 () Bool)

(assert (=> (not b_lambda!14577) (not b!976540)))

(assert (=> b!976540 t!28884))

(declare-fun b_and!31177 () Bool)

(assert (= b_and!31175 (and (=> t!28884 result!12699) b_and!31177)))

(assert (=> b!976531 m!902991))

(assert (=> b!976531 m!902991))

(assert (=> b!976531 m!902993))

(declare-fun m!903331 () Bool)

(assert (=> b!976537 m!903331))

(assert (=> b!976539 m!902991))

(assert (=> b!976539 m!902991))

(assert (=> b!976539 m!902993))

(assert (=> b!976532 m!902991))

(assert (=> b!976532 m!902991))

(declare-fun m!903333 () Bool)

(assert (=> b!976532 m!903333))

(declare-fun m!903335 () Bool)

(assert (=> b!976533 m!903335))

(assert (=> b!976535 m!903191))

(assert (=> b!976535 m!902991))

(declare-fun m!903337 () Bool)

(assert (=> b!976535 m!903337))

(assert (=> b!976535 m!902991))

(assert (=> b!976535 m!903191))

(assert (=> b!976535 m!903113))

(assert (=> b!976535 m!903193))

(assert (=> b!976535 m!903113))

(assert (=> b!976540 m!903191))

(declare-fun m!903339 () Bool)

(assert (=> b!976540 m!903339))

(assert (=> b!976540 m!902991))

(declare-fun m!903341 () Bool)

(assert (=> b!976540 m!903341))

(declare-fun m!903343 () Bool)

(assert (=> b!976540 m!903343))

(assert (=> b!976540 m!903341))

(assert (=> b!976540 m!903191))

(assert (=> b!976540 m!903113))

(assert (=> b!976540 m!903193))

(assert (=> b!976540 m!903113))

(declare-fun m!903345 () Bool)

(assert (=> b!976540 m!903345))

(declare-fun m!903347 () Bool)

(assert (=> b!976538 m!903347))

(assert (=> bm!41750 m!903331))

(declare-fun m!903349 () Bool)

(assert (=> d!116319 m!903349))

(assert (=> d!116319 m!902981))

(assert (=> bm!41740 d!116319))

(declare-fun d!116321 () Bool)

(declare-fun isEmpty!722 (Option!518) Bool)

(assert (=> d!116321 (= (isDefined!384 (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822))) (not (isEmpty!722 (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))))

(declare-fun bs!27598 () Bool)

(assert (= bs!27598 d!116321))

(assert (=> bs!27598 m!903063))

(declare-fun m!903351 () Bool)

(assert (=> bs!27598 m!903351))

(assert (=> b!976343 d!116321))

(declare-fun c!99921 () Bool)

(declare-fun d!116323 () Bool)

(assert (=> d!116323 (= c!99921 (and ((_ is Cons!20370) (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29297 _keys!1717) i!822))))))

(declare-fun e!550341 () Option!518)

(assert (=> d!116323 (= (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)) e!550341)))

(declare-fun b!976549 () Bool)

(assert (=> b!976549 (= e!550341 (Some!517 (_2!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))))

(declare-fun b!976551 () Bool)

(declare-fun e!550342 () Option!518)

(assert (=> b!976551 (= e!550342 (getValueByKey!512 (t!28878 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976550 () Bool)

(assert (=> b!976550 (= e!550341 e!550342)))

(declare-fun c!99922 () Bool)

(assert (=> b!976550 (= c!99922 (and ((_ is Cons!20370) (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (not (= (_1!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29297 _keys!1717) i!822)))))))

(declare-fun b!976552 () Bool)

(assert (=> b!976552 (= e!550342 None!516)))

(assert (= (and d!116323 c!99921) b!976549))

(assert (= (and d!116323 (not c!99921)) b!976550))

(assert (= (and b!976550 c!99922) b!976551))

(assert (= (and b!976550 (not c!99922)) b!976552))

(assert (=> b!976551 m!902975))

(declare-fun m!903353 () Bool)

(assert (=> b!976551 m!903353))

(assert (=> b!976343 d!116323))

(declare-fun d!116325 () Bool)

(declare-fun res!653757 () Bool)

(declare-fun e!550347 () Bool)

(assert (=> d!116325 (=> res!653757 e!550347)))

(assert (=> d!116325 (= res!653757 (and ((_ is Cons!20370) (toList!6643 lt!432903)) (= (_1!7295 (h!21532 (toList!6643 lt!432903))) (select (arr!29297 _keys!1717) i!822))))))

(assert (=> d!116325 (= (containsKey!476 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)) e!550347)))

(declare-fun b!976557 () Bool)

(declare-fun e!550348 () Bool)

(assert (=> b!976557 (= e!550347 e!550348)))

(declare-fun res!653758 () Bool)

(assert (=> b!976557 (=> (not res!653758) (not e!550348))))

(assert (=> b!976557 (= res!653758 (and (or (not ((_ is Cons!20370) (toList!6643 lt!432903))) (bvsle (_1!7295 (h!21532 (toList!6643 lt!432903))) (select (arr!29297 _keys!1717) i!822))) ((_ is Cons!20370) (toList!6643 lt!432903)) (bvslt (_1!7295 (h!21532 (toList!6643 lt!432903))) (select (arr!29297 _keys!1717) i!822))))))

(declare-fun b!976558 () Bool)

(assert (=> b!976558 (= e!550348 (containsKey!476 (t!28878 (toList!6643 lt!432903)) (select (arr!29297 _keys!1717) i!822)))))

(assert (= (and d!116325 (not res!653757)) b!976557))

(assert (= (and b!976557 res!653758) b!976558))

(assert (=> b!976558 m!902975))

(declare-fun m!903355 () Bool)

(assert (=> b!976558 m!903355))

(assert (=> d!116277 d!116325))

(declare-fun d!116327 () Bool)

(declare-fun e!550349 () Bool)

(assert (=> d!116327 e!550349))

(declare-fun res!653759 () Bool)

(assert (=> d!116327 (=> res!653759 e!550349)))

(declare-fun lt!433091 () Bool)

(assert (=> d!116327 (= res!653759 (not lt!433091))))

(declare-fun lt!433094 () Bool)

(assert (=> d!116327 (= lt!433091 lt!433094)))

(declare-fun lt!433092 () Unit!32342)

(declare-fun e!550350 () Unit!32342)

(assert (=> d!116327 (= lt!433092 e!550350)))

(declare-fun c!99923 () Bool)

(assert (=> d!116327 (= c!99923 lt!433094)))

(assert (=> d!116327 (= lt!433094 (containsKey!476 (toList!6643 lt!433010) (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> d!116327 (= (contains!5670 lt!433010 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) lt!433091)))

(declare-fun b!976559 () Bool)

(declare-fun lt!433093 () Unit!32342)

(assert (=> b!976559 (= e!550350 lt!433093)))

(assert (=> b!976559 (= lt!433093 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!433010) (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976559 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976560 () Bool)

(declare-fun Unit!32350 () Unit!32342)

(assert (=> b!976560 (= e!550350 Unit!32350)))

(declare-fun b!976561 () Bool)

(assert (=> b!976561 (= e!550349 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(assert (= (and d!116327 c!99923) b!976559))

(assert (= (and d!116327 (not c!99923)) b!976560))

(assert (= (and d!116327 (not res!653759)) b!976561))

(assert (=> d!116327 m!902991))

(declare-fun m!903357 () Bool)

(assert (=> d!116327 m!903357))

(assert (=> b!976559 m!902991))

(declare-fun m!903359 () Bool)

(assert (=> b!976559 m!903359))

(assert (=> b!976559 m!902991))

(declare-fun m!903361 () Bool)

(assert (=> b!976559 m!903361))

(assert (=> b!976559 m!903361))

(declare-fun m!903363 () Bool)

(assert (=> b!976559 m!903363))

(assert (=> b!976561 m!902991))

(assert (=> b!976561 m!903361))

(assert (=> b!976561 m!903361))

(assert (=> b!976561 m!903363))

(assert (=> b!976459 d!116327))

(declare-fun d!116329 () Bool)

(assert (=> d!116329 (= (apply!883 lt!433010 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15183 (getValueByKey!512 (toList!6643 lt!433010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27599 () Bool)

(assert (= bs!27599 d!116329))

(declare-fun m!903365 () Bool)

(assert (=> bs!27599 m!903365))

(assert (=> bs!27599 m!903365))

(declare-fun m!903367 () Bool)

(assert (=> bs!27599 m!903367))

(assert (=> b!976446 d!116329))

(declare-fun d!116331 () Bool)

(assert (=> d!116331 (= (apply!883 lt!432975 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15183 (getValueByKey!512 (toList!6643 lt!432975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27600 () Bool)

(assert (= bs!27600 d!116331))

(declare-fun m!903369 () Bool)

(assert (=> bs!27600 m!903369))

(assert (=> bs!27600 m!903369))

(declare-fun m!903371 () Bool)

(assert (=> bs!27600 m!903371))

(assert (=> b!976396 d!116331))

(declare-fun d!116333 () Bool)

(declare-fun res!653760 () Bool)

(declare-fun e!550351 () Bool)

(assert (=> d!116333 (=> res!653760 e!550351)))

(assert (=> d!116333 (= res!653760 (and ((_ is Cons!20370) (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29297 _keys!1717) i!822))))))

(assert (=> d!116333 (= (containsKey!476 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)) e!550351)))

(declare-fun b!976562 () Bool)

(declare-fun e!550352 () Bool)

(assert (=> b!976562 (= e!550351 e!550352)))

(declare-fun res!653761 () Bool)

(assert (=> b!976562 (=> (not res!653761) (not e!550352))))

(assert (=> b!976562 (= res!653761 (and (or (not ((_ is Cons!20370) (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (bvsle (_1!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29297 _keys!1717) i!822))) ((_ is Cons!20370) (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (bvslt (_1!7295 (h!21532 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29297 _keys!1717) i!822))))))

(declare-fun b!976563 () Bool)

(assert (=> b!976563 (= e!550352 (containsKey!476 (t!28878 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29297 _keys!1717) i!822)))))

(assert (= (and d!116333 (not res!653760)) b!976562))

(assert (= (and b!976562 res!653761) b!976563))

(assert (=> b!976563 m!902975))

(declare-fun m!903373 () Bool)

(assert (=> b!976563 m!903373))

(assert (=> d!116261 d!116333))

(declare-fun d!116335 () Bool)

(assert (=> d!116335 (= (apply!883 (+!2945 lt!433003 (tuple2!14569 lt!433019 minValue!1367)) lt!433009) (apply!883 lt!433003 lt!433009))))

(declare-fun lt!433095 () Unit!32342)

(assert (=> d!116335 (= lt!433095 (choose!1610 lt!433003 lt!433019 minValue!1367 lt!433009))))

(declare-fun e!550353 () Bool)

(assert (=> d!116335 e!550353))

(declare-fun res!653762 () Bool)

(assert (=> d!116335 (=> (not res!653762) (not e!550353))))

(assert (=> d!116335 (= res!653762 (contains!5670 lt!433003 lt!433009))))

(assert (=> d!116335 (= (addApplyDifferent!462 lt!433003 lt!433019 minValue!1367 lt!433009) lt!433095)))

(declare-fun b!976564 () Bool)

(assert (=> b!976564 (= e!550353 (not (= lt!433009 lt!433019)))))

(assert (= (and d!116335 res!653762) b!976564))

(assert (=> d!116335 m!903169))

(assert (=> d!116335 m!903177))

(declare-fun m!903375 () Bool)

(assert (=> d!116335 m!903375))

(declare-fun m!903377 () Bool)

(assert (=> d!116335 m!903377))

(assert (=> d!116335 m!903177))

(assert (=> d!116335 m!903179))

(assert (=> b!976447 d!116335))

(assert (=> b!976447 d!116319))

(declare-fun d!116337 () Bool)

(assert (=> d!116337 (= (apply!883 (+!2945 lt!433013 (tuple2!14569 lt!433008 minValue!1367)) lt!433005) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!433013 (tuple2!14569 lt!433008 minValue!1367))) lt!433005)))))

(declare-fun bs!27601 () Bool)

(assert (= bs!27601 d!116337))

(declare-fun m!903379 () Bool)

(assert (=> bs!27601 m!903379))

(assert (=> bs!27601 m!903379))

(declare-fun m!903381 () Bool)

(assert (=> bs!27601 m!903381))

(assert (=> b!976447 d!116337))

(declare-fun d!116339 () Bool)

(declare-fun e!550354 () Bool)

(assert (=> d!116339 e!550354))

(declare-fun res!653763 () Bool)

(assert (=> d!116339 (=> (not res!653763) (not e!550354))))

(declare-fun lt!433097 () ListLongMap!13255)

(assert (=> d!116339 (= res!653763 (contains!5670 lt!433097 (_1!7295 (tuple2!14569 lt!433014 zeroValue!1367))))))

(declare-fun lt!433096 () List!20374)

(assert (=> d!116339 (= lt!433097 (ListLongMap!13256 lt!433096))))

(declare-fun lt!433099 () Unit!32342)

(declare-fun lt!433098 () Unit!32342)

(assert (=> d!116339 (= lt!433099 lt!433098)))

(assert (=> d!116339 (= (getValueByKey!512 lt!433096 (_1!7295 (tuple2!14569 lt!433014 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433014 zeroValue!1367))))))

(assert (=> d!116339 (= lt!433098 (lemmaContainsTupThenGetReturnValue!269 lt!433096 (_1!7295 (tuple2!14569 lt!433014 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!433014 zeroValue!1367))))))

(assert (=> d!116339 (= lt!433096 (insertStrictlySorted!326 (toList!6643 lt!433002) (_1!7295 (tuple2!14569 lt!433014 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!433014 zeroValue!1367))))))

(assert (=> d!116339 (= (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367)) lt!433097)))

(declare-fun b!976565 () Bool)

(declare-fun res!653764 () Bool)

(assert (=> b!976565 (=> (not res!653764) (not e!550354))))

(assert (=> b!976565 (= res!653764 (= (getValueByKey!512 (toList!6643 lt!433097) (_1!7295 (tuple2!14569 lt!433014 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433014 zeroValue!1367)))))))

(declare-fun b!976566 () Bool)

(assert (=> b!976566 (= e!550354 (contains!5674 (toList!6643 lt!433097) (tuple2!14569 lt!433014 zeroValue!1367)))))

(assert (= (and d!116339 res!653763) b!976565))

(assert (= (and b!976565 res!653764) b!976566))

(declare-fun m!903383 () Bool)

(assert (=> d!116339 m!903383))

(declare-fun m!903385 () Bool)

(assert (=> d!116339 m!903385))

(declare-fun m!903387 () Bool)

(assert (=> d!116339 m!903387))

(declare-fun m!903389 () Bool)

(assert (=> d!116339 m!903389))

(declare-fun m!903391 () Bool)

(assert (=> b!976565 m!903391))

(declare-fun m!903393 () Bool)

(assert (=> b!976566 m!903393))

(assert (=> b!976447 d!116339))

(declare-fun d!116341 () Bool)

(assert (=> d!116341 (= (apply!883 lt!433003 lt!433009) (get!15183 (getValueByKey!512 (toList!6643 lt!433003) lt!433009)))))

(declare-fun bs!27602 () Bool)

(assert (= bs!27602 d!116341))

(declare-fun m!903395 () Bool)

(assert (=> bs!27602 m!903395))

(assert (=> bs!27602 m!903395))

(declare-fun m!903397 () Bool)

(assert (=> bs!27602 m!903397))

(assert (=> b!976447 d!116341))

(declare-fun d!116343 () Bool)

(assert (=> d!116343 (= (apply!883 (+!2945 lt!433013 (tuple2!14569 lt!433008 minValue!1367)) lt!433005) (apply!883 lt!433013 lt!433005))))

(declare-fun lt!433100 () Unit!32342)

(assert (=> d!116343 (= lt!433100 (choose!1610 lt!433013 lt!433008 minValue!1367 lt!433005))))

(declare-fun e!550355 () Bool)

(assert (=> d!116343 e!550355))

(declare-fun res!653765 () Bool)

(assert (=> d!116343 (=> (not res!653765) (not e!550355))))

(assert (=> d!116343 (= res!653765 (contains!5670 lt!433013 lt!433005))))

(assert (=> d!116343 (= (addApplyDifferent!462 lt!433013 lt!433008 minValue!1367 lt!433005) lt!433100)))

(declare-fun b!976567 () Bool)

(assert (=> b!976567 (= e!550355 (not (= lt!433005 lt!433008)))))

(assert (= (and d!116343 res!653765) b!976567))

(assert (=> d!116343 m!903187))

(assert (=> d!116343 m!903161))

(declare-fun m!903399 () Bool)

(assert (=> d!116343 m!903399))

(declare-fun m!903401 () Bool)

(assert (=> d!116343 m!903401))

(assert (=> d!116343 m!903161))

(assert (=> d!116343 m!903163))

(assert (=> b!976447 d!116343))

(declare-fun d!116345 () Bool)

(assert (=> d!116345 (= (apply!883 (+!2945 lt!433003 (tuple2!14569 lt!433019 minValue!1367)) lt!433009) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!433003 (tuple2!14569 lt!433019 minValue!1367))) lt!433009)))))

(declare-fun bs!27603 () Bool)

(assert (= bs!27603 d!116345))

(declare-fun m!903403 () Bool)

(assert (=> bs!27603 m!903403))

(assert (=> bs!27603 m!903403))

(declare-fun m!903405 () Bool)

(assert (=> bs!27603 m!903405))

(assert (=> b!976447 d!116345))

(declare-fun d!116347 () Bool)

(assert (=> d!116347 (contains!5670 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367)) lt!433004)))

(declare-fun lt!433101 () Unit!32342)

(assert (=> d!116347 (= lt!433101 (choose!1611 lt!433002 lt!433014 zeroValue!1367 lt!433004))))

(assert (=> d!116347 (contains!5670 lt!433002 lt!433004)))

(assert (=> d!116347 (= (addStillContains!606 lt!433002 lt!433014 zeroValue!1367 lt!433004) lt!433101)))

(declare-fun bs!27604 () Bool)

(assert (= bs!27604 d!116347))

(assert (=> bs!27604 m!903167))

(assert (=> bs!27604 m!903167))

(assert (=> bs!27604 m!903175))

(declare-fun m!903407 () Bool)

(assert (=> bs!27604 m!903407))

(declare-fun m!903409 () Bool)

(assert (=> bs!27604 m!903409))

(assert (=> b!976447 d!116347))

(declare-fun d!116349 () Bool)

(declare-fun e!550356 () Bool)

(assert (=> d!116349 e!550356))

(declare-fun res!653766 () Bool)

(assert (=> d!116349 (=> (not res!653766) (not e!550356))))

(declare-fun lt!433103 () ListLongMap!13255)

(assert (=> d!116349 (= res!653766 (contains!5670 lt!433103 (_1!7295 (tuple2!14569 lt!433008 minValue!1367))))))

(declare-fun lt!433102 () List!20374)

(assert (=> d!116349 (= lt!433103 (ListLongMap!13256 lt!433102))))

(declare-fun lt!433105 () Unit!32342)

(declare-fun lt!433104 () Unit!32342)

(assert (=> d!116349 (= lt!433105 lt!433104)))

(assert (=> d!116349 (= (getValueByKey!512 lt!433102 (_1!7295 (tuple2!14569 lt!433008 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433008 minValue!1367))))))

(assert (=> d!116349 (= lt!433104 (lemmaContainsTupThenGetReturnValue!269 lt!433102 (_1!7295 (tuple2!14569 lt!433008 minValue!1367)) (_2!7295 (tuple2!14569 lt!433008 minValue!1367))))))

(assert (=> d!116349 (= lt!433102 (insertStrictlySorted!326 (toList!6643 lt!433013) (_1!7295 (tuple2!14569 lt!433008 minValue!1367)) (_2!7295 (tuple2!14569 lt!433008 minValue!1367))))))

(assert (=> d!116349 (= (+!2945 lt!433013 (tuple2!14569 lt!433008 minValue!1367)) lt!433103)))

(declare-fun b!976568 () Bool)

(declare-fun res!653767 () Bool)

(assert (=> b!976568 (=> (not res!653767) (not e!550356))))

(assert (=> b!976568 (= res!653767 (= (getValueByKey!512 (toList!6643 lt!433103) (_1!7295 (tuple2!14569 lt!433008 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433008 minValue!1367)))))))

(declare-fun b!976569 () Bool)

(assert (=> b!976569 (= e!550356 (contains!5674 (toList!6643 lt!433103) (tuple2!14569 lt!433008 minValue!1367)))))

(assert (= (and d!116349 res!653766) b!976568))

(assert (= (and b!976568 res!653767) b!976569))

(declare-fun m!903411 () Bool)

(assert (=> d!116349 m!903411))

(declare-fun m!903413 () Bool)

(assert (=> d!116349 m!903413))

(declare-fun m!903415 () Bool)

(assert (=> d!116349 m!903415))

(declare-fun m!903417 () Bool)

(assert (=> d!116349 m!903417))

(declare-fun m!903419 () Bool)

(assert (=> b!976568 m!903419))

(declare-fun m!903421 () Bool)

(assert (=> b!976569 m!903421))

(assert (=> b!976447 d!116349))

(declare-fun d!116351 () Bool)

(assert (=> d!116351 (= (apply!883 (+!2945 lt!433022 (tuple2!14569 lt!433012 zeroValue!1367)) lt!433016) (apply!883 lt!433022 lt!433016))))

(declare-fun lt!433106 () Unit!32342)

(assert (=> d!116351 (= lt!433106 (choose!1610 lt!433022 lt!433012 zeroValue!1367 lt!433016))))

(declare-fun e!550357 () Bool)

(assert (=> d!116351 e!550357))

(declare-fun res!653768 () Bool)

(assert (=> d!116351 (=> (not res!653768) (not e!550357))))

(assert (=> d!116351 (= res!653768 (contains!5670 lt!433022 lt!433016))))

(assert (=> d!116351 (= (addApplyDifferent!462 lt!433022 lt!433012 zeroValue!1367 lt!433016) lt!433106)))

(declare-fun b!976570 () Bool)

(assert (=> b!976570 (= e!550357 (not (= lt!433016 lt!433012)))))

(assert (= (and d!116351 res!653768) b!976570))

(assert (=> d!116351 m!903173))

(assert (=> d!116351 m!903171))

(declare-fun m!903423 () Bool)

(assert (=> d!116351 m!903423))

(declare-fun m!903425 () Bool)

(assert (=> d!116351 m!903425))

(assert (=> d!116351 m!903171))

(assert (=> d!116351 m!903183))

(assert (=> b!976447 d!116351))

(declare-fun d!116353 () Bool)

(assert (=> d!116353 (= (apply!883 lt!433022 lt!433016) (get!15183 (getValueByKey!512 (toList!6643 lt!433022) lt!433016)))))

(declare-fun bs!27605 () Bool)

(assert (= bs!27605 d!116353))

(declare-fun m!903427 () Bool)

(assert (=> bs!27605 m!903427))

(assert (=> bs!27605 m!903427))

(declare-fun m!903429 () Bool)

(assert (=> bs!27605 m!903429))

(assert (=> b!976447 d!116353))

(declare-fun d!116355 () Bool)

(declare-fun e!550358 () Bool)

(assert (=> d!116355 e!550358))

(declare-fun res!653769 () Bool)

(assert (=> d!116355 (=> (not res!653769) (not e!550358))))

(declare-fun lt!433108 () ListLongMap!13255)

(assert (=> d!116355 (= res!653769 (contains!5670 lt!433108 (_1!7295 (tuple2!14569 lt!433012 zeroValue!1367))))))

(declare-fun lt!433107 () List!20374)

(assert (=> d!116355 (= lt!433108 (ListLongMap!13256 lt!433107))))

(declare-fun lt!433110 () Unit!32342)

(declare-fun lt!433109 () Unit!32342)

(assert (=> d!116355 (= lt!433110 lt!433109)))

(assert (=> d!116355 (= (getValueByKey!512 lt!433107 (_1!7295 (tuple2!14569 lt!433012 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433012 zeroValue!1367))))))

(assert (=> d!116355 (= lt!433109 (lemmaContainsTupThenGetReturnValue!269 lt!433107 (_1!7295 (tuple2!14569 lt!433012 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!433012 zeroValue!1367))))))

(assert (=> d!116355 (= lt!433107 (insertStrictlySorted!326 (toList!6643 lt!433022) (_1!7295 (tuple2!14569 lt!433012 zeroValue!1367)) (_2!7295 (tuple2!14569 lt!433012 zeroValue!1367))))))

(assert (=> d!116355 (= (+!2945 lt!433022 (tuple2!14569 lt!433012 zeroValue!1367)) lt!433108)))

(declare-fun b!976571 () Bool)

(declare-fun res!653770 () Bool)

(assert (=> b!976571 (=> (not res!653770) (not e!550358))))

(assert (=> b!976571 (= res!653770 (= (getValueByKey!512 (toList!6643 lt!433108) (_1!7295 (tuple2!14569 lt!433012 zeroValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433012 zeroValue!1367)))))))

(declare-fun b!976572 () Bool)

(assert (=> b!976572 (= e!550358 (contains!5674 (toList!6643 lt!433108) (tuple2!14569 lt!433012 zeroValue!1367)))))

(assert (= (and d!116355 res!653769) b!976571))

(assert (= (and b!976571 res!653770) b!976572))

(declare-fun m!903431 () Bool)

(assert (=> d!116355 m!903431))

(declare-fun m!903433 () Bool)

(assert (=> d!116355 m!903433))

(declare-fun m!903435 () Bool)

(assert (=> d!116355 m!903435))

(declare-fun m!903437 () Bool)

(assert (=> d!116355 m!903437))

(declare-fun m!903439 () Bool)

(assert (=> b!976571 m!903439))

(declare-fun m!903441 () Bool)

(assert (=> b!976572 m!903441))

(assert (=> b!976447 d!116355))

(declare-fun d!116357 () Bool)

(declare-fun e!550359 () Bool)

(assert (=> d!116357 e!550359))

(declare-fun res!653771 () Bool)

(assert (=> d!116357 (=> (not res!653771) (not e!550359))))

(declare-fun lt!433112 () ListLongMap!13255)

(assert (=> d!116357 (= res!653771 (contains!5670 lt!433112 (_1!7295 (tuple2!14569 lt!433019 minValue!1367))))))

(declare-fun lt!433111 () List!20374)

(assert (=> d!116357 (= lt!433112 (ListLongMap!13256 lt!433111))))

(declare-fun lt!433114 () Unit!32342)

(declare-fun lt!433113 () Unit!32342)

(assert (=> d!116357 (= lt!433114 lt!433113)))

(assert (=> d!116357 (= (getValueByKey!512 lt!433111 (_1!7295 (tuple2!14569 lt!433019 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433019 minValue!1367))))))

(assert (=> d!116357 (= lt!433113 (lemmaContainsTupThenGetReturnValue!269 lt!433111 (_1!7295 (tuple2!14569 lt!433019 minValue!1367)) (_2!7295 (tuple2!14569 lt!433019 minValue!1367))))))

(assert (=> d!116357 (= lt!433111 (insertStrictlySorted!326 (toList!6643 lt!433003) (_1!7295 (tuple2!14569 lt!433019 minValue!1367)) (_2!7295 (tuple2!14569 lt!433019 minValue!1367))))))

(assert (=> d!116357 (= (+!2945 lt!433003 (tuple2!14569 lt!433019 minValue!1367)) lt!433112)))

(declare-fun b!976573 () Bool)

(declare-fun res!653772 () Bool)

(assert (=> b!976573 (=> (not res!653772) (not e!550359))))

(assert (=> b!976573 (= res!653772 (= (getValueByKey!512 (toList!6643 lt!433112) (_1!7295 (tuple2!14569 lt!433019 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 lt!433019 minValue!1367)))))))

(declare-fun b!976574 () Bool)

(assert (=> b!976574 (= e!550359 (contains!5674 (toList!6643 lt!433112) (tuple2!14569 lt!433019 minValue!1367)))))

(assert (= (and d!116357 res!653771) b!976573))

(assert (= (and b!976573 res!653772) b!976574))

(declare-fun m!903443 () Bool)

(assert (=> d!116357 m!903443))

(declare-fun m!903445 () Bool)

(assert (=> d!116357 m!903445))

(declare-fun m!903447 () Bool)

(assert (=> d!116357 m!903447))

(declare-fun m!903449 () Bool)

(assert (=> d!116357 m!903449))

(declare-fun m!903451 () Bool)

(assert (=> b!976573 m!903451))

(declare-fun m!903453 () Bool)

(assert (=> b!976574 m!903453))

(assert (=> b!976447 d!116357))

(declare-fun d!116359 () Bool)

(declare-fun e!550360 () Bool)

(assert (=> d!116359 e!550360))

(declare-fun res!653773 () Bool)

(assert (=> d!116359 (=> res!653773 e!550360)))

(declare-fun lt!433115 () Bool)

(assert (=> d!116359 (= res!653773 (not lt!433115))))

(declare-fun lt!433118 () Bool)

(assert (=> d!116359 (= lt!433115 lt!433118)))

(declare-fun lt!433116 () Unit!32342)

(declare-fun e!550361 () Unit!32342)

(assert (=> d!116359 (= lt!433116 e!550361)))

(declare-fun c!99924 () Bool)

(assert (=> d!116359 (= c!99924 lt!433118)))

(assert (=> d!116359 (= lt!433118 (containsKey!476 (toList!6643 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367))) lt!433004))))

(assert (=> d!116359 (= (contains!5670 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367)) lt!433004) lt!433115)))

(declare-fun b!976575 () Bool)

(declare-fun lt!433117 () Unit!32342)

(assert (=> b!976575 (= e!550361 lt!433117)))

(assert (=> b!976575 (= lt!433117 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367))) lt!433004))))

(assert (=> b!976575 (isDefined!384 (getValueByKey!512 (toList!6643 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367))) lt!433004))))

(declare-fun b!976576 () Bool)

(declare-fun Unit!32351 () Unit!32342)

(assert (=> b!976576 (= e!550361 Unit!32351)))

(declare-fun b!976577 () Bool)

(assert (=> b!976577 (= e!550360 (isDefined!384 (getValueByKey!512 (toList!6643 (+!2945 lt!433002 (tuple2!14569 lt!433014 zeroValue!1367))) lt!433004)))))

(assert (= (and d!116359 c!99924) b!976575))

(assert (= (and d!116359 (not c!99924)) b!976576))

(assert (= (and d!116359 (not res!653773)) b!976577))

(declare-fun m!903455 () Bool)

(assert (=> d!116359 m!903455))

(declare-fun m!903457 () Bool)

(assert (=> b!976575 m!903457))

(declare-fun m!903459 () Bool)

(assert (=> b!976575 m!903459))

(assert (=> b!976575 m!903459))

(declare-fun m!903461 () Bool)

(assert (=> b!976575 m!903461))

(assert (=> b!976577 m!903459))

(assert (=> b!976577 m!903459))

(assert (=> b!976577 m!903461))

(assert (=> b!976447 d!116359))

(declare-fun d!116361 () Bool)

(assert (=> d!116361 (= (apply!883 lt!433013 lt!433005) (get!15183 (getValueByKey!512 (toList!6643 lt!433013) lt!433005)))))

(declare-fun bs!27606 () Bool)

(assert (= bs!27606 d!116361))

(declare-fun m!903463 () Bool)

(assert (=> bs!27606 m!903463))

(assert (=> bs!27606 m!903463))

(declare-fun m!903465 () Bool)

(assert (=> bs!27606 m!903465))

(assert (=> b!976447 d!116361))

(declare-fun d!116363 () Bool)

(assert (=> d!116363 (= (apply!883 (+!2945 lt!433022 (tuple2!14569 lt!433012 zeroValue!1367)) lt!433016) (get!15183 (getValueByKey!512 (toList!6643 (+!2945 lt!433022 (tuple2!14569 lt!433012 zeroValue!1367))) lt!433016)))))

(declare-fun bs!27607 () Bool)

(assert (= bs!27607 d!116363))

(declare-fun m!903467 () Bool)

(assert (=> bs!27607 m!903467))

(assert (=> bs!27607 m!903467))

(declare-fun m!903469 () Bool)

(assert (=> bs!27607 m!903469))

(assert (=> b!976447 d!116363))

(declare-fun d!116365 () Bool)

(assert (=> d!116365 (= (validKeyInArray!0 (select (arr!29297 _keys!1717) from!2118)) (and (not (= (select (arr!29297 _keys!1717) from!2118) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29297 _keys!1717) from!2118) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976397 d!116365))

(declare-fun d!116367 () Bool)

(assert (=> d!116367 (= (apply!883 lt!433010 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15183 (getValueByKey!512 (toList!6643 lt!433010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27608 () Bool)

(assert (= bs!27608 d!116367))

(assert (=> bs!27608 m!903211))

(assert (=> bs!27608 m!903211))

(declare-fun m!903471 () Bool)

(assert (=> bs!27608 m!903471))

(assert (=> b!976449 d!116367))

(declare-fun d!116369 () Bool)

(assert (=> d!116369 (= (apply!883 lt!432975 (select (arr!29297 _keys!1717) from!2118)) (get!15183 (getValueByKey!512 (toList!6643 lt!432975) (select (arr!29297 _keys!1717) from!2118))))))

(declare-fun bs!27609 () Bool)

(assert (= bs!27609 d!116369))

(assert (=> bs!27609 m!903101))

(declare-fun m!903473 () Bool)

(assert (=> bs!27609 m!903473))

(assert (=> bs!27609 m!903473))

(declare-fun m!903475 () Bool)

(assert (=> bs!27609 m!903475))

(assert (=> b!976400 d!116369))

(declare-fun d!116371 () Bool)

(declare-fun c!99927 () Bool)

(assert (=> d!116371 (= c!99927 ((_ is ValueCellFull!10745) (select (arr!29296 _values!1425) from!2118)))))

(declare-fun e!550364 () V!34921)

(assert (=> d!116371 (= (get!15182 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!550364)))

(declare-fun b!976582 () Bool)

(declare-fun get!15184 (ValueCell!10745 V!34921) V!34921)

(assert (=> b!976582 (= e!550364 (get!15184 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976583 () Bool)

(declare-fun get!15185 (ValueCell!10745 V!34921) V!34921)

(assert (=> b!976583 (= e!550364 (get!15185 (select (arr!29296 _values!1425) from!2118) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116371 c!99927) b!976582))

(assert (= (and d!116371 (not c!99927)) b!976583))

(assert (=> b!976582 m!903111))

(assert (=> b!976582 m!903113))

(declare-fun m!903477 () Bool)

(assert (=> b!976582 m!903477))

(assert (=> b!976583 m!903111))

(assert (=> b!976583 m!903113))

(declare-fun m!903479 () Bool)

(assert (=> b!976583 m!903479))

(assert (=> b!976400 d!116371))

(declare-fun d!116373 () Bool)

(assert (=> d!116373 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun lt!433121 () Unit!32342)

(declare-fun choose!1612 (List!20374 (_ BitVec 64)) Unit!32342)

(assert (=> d!116373 (= lt!433121 (choose!1612 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun e!550367 () Bool)

(assert (=> d!116373 e!550367))

(declare-fun res!653776 () Bool)

(assert (=> d!116373 (=> (not res!653776) (not e!550367))))

(declare-fun isStrictlySorted!510 (List!20374) Bool)

(assert (=> d!116373 (= res!653776 (isStrictlySorted!510 (toList!6643 lt!432903)))))

(assert (=> d!116373 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)) lt!433121)))

(declare-fun b!976586 () Bool)

(assert (=> b!976586 (= e!550367 (containsKey!476 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))

(assert (= (and d!116373 res!653776) b!976586))

(assert (=> d!116373 m!902975))

(assert (=> d!116373 m!903145))

(assert (=> d!116373 m!903145))

(assert (=> d!116373 m!903147))

(assert (=> d!116373 m!902975))

(declare-fun m!903481 () Bool)

(assert (=> d!116373 m!903481))

(declare-fun m!903483 () Bool)

(assert (=> d!116373 m!903483))

(assert (=> b!976586 m!902975))

(assert (=> b!976586 m!903141))

(assert (=> b!976436 d!116373))

(declare-fun d!116375 () Bool)

(assert (=> d!116375 (= (isDefined!384 (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822))) (not (isEmpty!722 (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)))))))

(declare-fun bs!27610 () Bool)

(assert (= bs!27610 d!116375))

(assert (=> bs!27610 m!903145))

(declare-fun m!903485 () Bool)

(assert (=> bs!27610 m!903485))

(assert (=> b!976436 d!116375))

(declare-fun c!99928 () Bool)

(declare-fun d!116377 () Bool)

(assert (=> d!116377 (= c!99928 (and ((_ is Cons!20370) (toList!6643 lt!432903)) (= (_1!7295 (h!21532 (toList!6643 lt!432903))) (select (arr!29297 _keys!1717) i!822))))))

(declare-fun e!550368 () Option!518)

(assert (=> d!116377 (= (getValueByKey!512 (toList!6643 lt!432903) (select (arr!29297 _keys!1717) i!822)) e!550368)))

(declare-fun b!976587 () Bool)

(assert (=> b!976587 (= e!550368 (Some!517 (_2!7295 (h!21532 (toList!6643 lt!432903)))))))

(declare-fun b!976589 () Bool)

(declare-fun e!550369 () Option!518)

(assert (=> b!976589 (= e!550369 (getValueByKey!512 (t!28878 (toList!6643 lt!432903)) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun b!976588 () Bool)

(assert (=> b!976588 (= e!550368 e!550369)))

(declare-fun c!99929 () Bool)

(assert (=> b!976588 (= c!99929 (and ((_ is Cons!20370) (toList!6643 lt!432903)) (not (= (_1!7295 (h!21532 (toList!6643 lt!432903))) (select (arr!29297 _keys!1717) i!822)))))))

(declare-fun b!976590 () Bool)

(assert (=> b!976590 (= e!550369 None!516)))

(assert (= (and d!116377 c!99928) b!976587))

(assert (= (and d!116377 (not c!99928)) b!976588))

(assert (= (and b!976588 c!99929) b!976589))

(assert (= (and b!976588 (not c!99929)) b!976590))

(assert (=> b!976589 m!902975))

(declare-fun m!903487 () Bool)

(assert (=> b!976589 m!903487))

(assert (=> b!976436 d!116377))

(assert (=> b!976450 d!116279))

(assert (=> d!116263 d!116267))

(declare-fun b!976591 () Bool)

(declare-fun e!550372 () Bool)

(declare-fun call!41754 () Bool)

(assert (=> b!976591 (= e!550372 call!41754)))

(declare-fun c!99930 () Bool)

(declare-fun bm!41751 () Bool)

(assert (=> bm!41751 (= call!41754 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!99930 (Cons!20371 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!99891 (Cons!20371 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) Nil!20372) Nil!20372)) (ite c!99891 (Cons!20371 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) Nil!20372) Nil!20372))))))

(declare-fun b!976592 () Bool)

(assert (=> b!976592 (= e!550372 call!41754)))

(declare-fun b!976593 () Bool)

(declare-fun e!550371 () Bool)

(assert (=> b!976593 (= e!550371 e!550372)))

(assert (=> b!976593 (= c!99930 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!976595 () Bool)

(declare-fun e!550370 () Bool)

(assert (=> b!976595 (= e!550370 (contains!5673 (ite c!99891 (Cons!20371 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) Nil!20372) Nil!20372) (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!976594 () Bool)

(declare-fun e!550373 () Bool)

(assert (=> b!976594 (= e!550373 e!550371)))

(declare-fun res!653779 () Bool)

(assert (=> b!976594 (=> (not res!653779) (not e!550371))))

(assert (=> b!976594 (= res!653779 (not e!550370))))

(declare-fun res!653777 () Bool)

(assert (=> b!976594 (=> (not res!653777) (not e!550370))))

(assert (=> b!976594 (= res!653777 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!116379 () Bool)

(declare-fun res!653778 () Bool)

(assert (=> d!116379 (=> res!653778 e!550373)))

(assert (=> d!116379 (= res!653778 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(assert (=> d!116379 (= (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99891 (Cons!20371 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) Nil!20372) Nil!20372)) e!550373)))

(assert (= (and d!116379 (not res!653778)) b!976594))

(assert (= (and b!976594 res!653777) b!976595))

(assert (= (and b!976594 res!653779) b!976593))

(assert (= (and b!976593 c!99930) b!976592))

(assert (= (and b!976593 (not c!99930)) b!976591))

(assert (= (or b!976592 b!976591) bm!41751))

(declare-fun m!903489 () Bool)

(assert (=> bm!41751 m!903489))

(declare-fun m!903491 () Bool)

(assert (=> bm!41751 m!903491))

(assert (=> b!976593 m!903489))

(assert (=> b!976593 m!903489))

(declare-fun m!903493 () Bool)

(assert (=> b!976593 m!903493))

(assert (=> b!976595 m!903489))

(assert (=> b!976595 m!903489))

(declare-fun m!903495 () Bool)

(assert (=> b!976595 m!903495))

(assert (=> b!976594 m!903489))

(assert (=> b!976594 m!903489))

(assert (=> b!976594 m!903493))

(assert (=> bm!41739 d!116379))

(declare-fun d!116381 () Bool)

(declare-fun e!550374 () Bool)

(assert (=> d!116381 e!550374))

(declare-fun res!653780 () Bool)

(assert (=> d!116381 (=> (not res!653780) (not e!550374))))

(declare-fun lt!433123 () ListLongMap!13255)

(assert (=> d!116381 (= res!653780 (contains!5670 lt!433123 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433122 () List!20374)

(assert (=> d!116381 (= lt!433123 (ListLongMap!13256 lt!433122))))

(declare-fun lt!433125 () Unit!32342)

(declare-fun lt!433124 () Unit!32342)

(assert (=> d!116381 (= lt!433125 lt!433124)))

(assert (=> d!116381 (= (getValueByKey!512 lt!433122 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116381 (= lt!433124 (lemmaContainsTupThenGetReturnValue!269 lt!433122 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116381 (= lt!433122 (insertStrictlySorted!326 (toList!6643 call!41731) (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116381 (= (+!2945 call!41731 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433123)))

(declare-fun b!976596 () Bool)

(declare-fun res!653781 () Bool)

(assert (=> b!976596 (=> (not res!653781) (not e!550374))))

(assert (=> b!976596 (= res!653781 (= (getValueByKey!512 (toList!6643 lt!433123) (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!976597 () Bool)

(assert (=> b!976597 (= e!550374 (contains!5674 (toList!6643 lt!433123) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116381 res!653780) b!976596))

(assert (= (and b!976596 res!653781) b!976597))

(declare-fun m!903497 () Bool)

(assert (=> d!116381 m!903497))

(declare-fun m!903499 () Bool)

(assert (=> d!116381 m!903499))

(declare-fun m!903501 () Bool)

(assert (=> d!116381 m!903501))

(declare-fun m!903503 () Bool)

(assert (=> d!116381 m!903503))

(declare-fun m!903505 () Bool)

(assert (=> b!976596 m!903505))

(declare-fun m!903507 () Bool)

(assert (=> b!976597 m!903507))

(assert (=> b!976401 d!116381))

(assert (=> b!976438 d!116375))

(assert (=> b!976438 d!116377))

(declare-fun d!116383 () Bool)

(assert (=> d!116383 (= (validKeyInArray!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)) (and (not (= (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976434 d!116383))

(declare-fun d!116385 () Bool)

(declare-fun e!550375 () Bool)

(assert (=> d!116385 e!550375))

(declare-fun res!653782 () Bool)

(assert (=> d!116385 (=> (not res!653782) (not e!550375))))

(declare-fun lt!433127 () ListLongMap!13255)

(assert (=> d!116385 (= res!653782 (contains!5670 lt!433127 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433126 () List!20374)

(assert (=> d!116385 (= lt!433127 (ListLongMap!13256 lt!433126))))

(declare-fun lt!433129 () Unit!32342)

(declare-fun lt!433128 () Unit!32342)

(assert (=> d!116385 (= lt!433129 lt!433128)))

(assert (=> d!116385 (= (getValueByKey!512 lt!433126 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116385 (= lt!433128 (lemmaContainsTupThenGetReturnValue!269 lt!433126 (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116385 (= lt!433126 (insertStrictlySorted!326 (toList!6643 call!41744) (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116385 (= (+!2945 call!41744 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433127)))

(declare-fun b!976598 () Bool)

(declare-fun res!653783 () Bool)

(assert (=> b!976598 (=> (not res!653783) (not e!550375))))

(assert (=> b!976598 (= res!653783 (= (getValueByKey!512 (toList!6643 lt!433127) (_1!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!517 (_2!7295 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!976599 () Bool)

(assert (=> b!976599 (= e!550375 (contains!5674 (toList!6643 lt!433127) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116385 res!653782) b!976598))

(assert (= (and b!976598 res!653783) b!976599))

(declare-fun m!903509 () Bool)

(assert (=> d!116385 m!903509))

(declare-fun m!903511 () Bool)

(assert (=> d!116385 m!903511))

(declare-fun m!903513 () Bool)

(assert (=> d!116385 m!903513))

(declare-fun m!903515 () Bool)

(assert (=> d!116385 m!903515))

(declare-fun m!903517 () Bool)

(assert (=> b!976598 m!903517))

(declare-fun m!903519 () Bool)

(assert (=> b!976599 m!903519))

(assert (=> b!976454 d!116385))

(declare-fun d!116387 () Bool)

(declare-fun e!550376 () Bool)

(assert (=> d!116387 e!550376))

(declare-fun res!653784 () Bool)

(assert (=> d!116387 (=> res!653784 e!550376)))

(declare-fun lt!433130 () Bool)

(assert (=> d!116387 (= res!653784 (not lt!433130))))

(declare-fun lt!433133 () Bool)

(assert (=> d!116387 (= lt!433130 lt!433133)))

(declare-fun lt!433131 () Unit!32342)

(declare-fun e!550377 () Unit!32342)

(assert (=> d!116387 (= lt!433131 e!550377)))

(declare-fun c!99931 () Bool)

(assert (=> d!116387 (= c!99931 lt!433133)))

(assert (=> d!116387 (= lt!433133 (containsKey!476 (toList!6643 lt!432975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116387 (= (contains!5670 lt!432975 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433130)))

(declare-fun b!976600 () Bool)

(declare-fun lt!433132 () Unit!32342)

(assert (=> b!976600 (= e!550377 lt!433132)))

(assert (=> b!976600 (= lt!433132 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!432975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976600 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976601 () Bool)

(declare-fun Unit!32352 () Unit!32342)

(assert (=> b!976601 (= e!550377 Unit!32352)))

(declare-fun b!976602 () Bool)

(assert (=> b!976602 (= e!550376 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116387 c!99931) b!976600))

(assert (= (and d!116387 (not c!99931)) b!976601))

(assert (= (and d!116387 (not res!653784)) b!976602))

(declare-fun m!903521 () Bool)

(assert (=> d!116387 m!903521))

(declare-fun m!903523 () Bool)

(assert (=> b!976600 m!903523))

(assert (=> b!976600 m!903203))

(assert (=> b!976600 m!903203))

(declare-fun m!903525 () Bool)

(assert (=> b!976600 m!903525))

(assert (=> b!976602 m!903203))

(assert (=> b!976602 m!903203))

(assert (=> b!976602 m!903525))

(assert (=> bm!41731 d!116387))

(declare-fun d!116389 () Bool)

(assert (=> d!116389 (= (apply!883 lt!433010 (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15183 (getValueByKey!512 (toList!6643 lt!433010) (select (arr!29297 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun bs!27611 () Bool)

(assert (= bs!27611 d!116389))

(assert (=> bs!27611 m!902991))

(assert (=> bs!27611 m!903361))

(assert (=> bs!27611 m!903361))

(declare-fun m!903527 () Bool)

(assert (=> bs!27611 m!903527))

(assert (=> b!976453 d!116389))

(declare-fun d!116391 () Bool)

(declare-fun c!99932 () Bool)

(assert (=> d!116391 (= c!99932 ((_ is ValueCellFull!10745) (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun e!550378 () V!34921)

(assert (=> d!116391 (= (get!15182 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!550378)))

(declare-fun b!976603 () Bool)

(assert (=> b!976603 (= e!550378 (get!15184 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976604 () Bool)

(assert (=> b!976604 (= e!550378 (get!15185 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116391 c!99932) b!976603))

(assert (= (and d!116391 (not c!99932)) b!976604))

(assert (=> b!976603 m!903191))

(assert (=> b!976603 m!903113))

(declare-fun m!903529 () Bool)

(assert (=> b!976603 m!903529))

(assert (=> b!976604 m!903191))

(assert (=> b!976604 m!903113))

(declare-fun m!903531 () Bool)

(assert (=> b!976604 m!903531))

(assert (=> b!976453 d!116391))

(declare-fun d!116393 () Bool)

(assert (=> d!116393 (arrayContainsKey!0 _keys!1717 lt!432995 #b00000000000000000000000000000000)))

(declare-fun lt!433136 () Unit!32342)

(declare-fun choose!13 (array!60866 (_ BitVec 64) (_ BitVec 32)) Unit!32342)

(assert (=> d!116393 (= lt!433136 (choose!13 _keys!1717 lt!432995 #b00000000000000000000000000000000))))

(assert (=> d!116393 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!116393 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!432995 #b00000000000000000000000000000000) lt!433136)))

(declare-fun bs!27612 () Bool)

(assert (= bs!27612 d!116393))

(assert (=> bs!27612 m!903129))

(declare-fun m!903533 () Bool)

(assert (=> bs!27612 m!903533))

(assert (=> b!976417 d!116393))

(declare-fun d!116395 () Bool)

(declare-fun res!653789 () Bool)

(declare-fun e!550383 () Bool)

(assert (=> d!116395 (=> res!653789 e!550383)))

(assert (=> d!116395 (= res!653789 (= (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) lt!432995))))

(assert (=> d!116395 (= (arrayContainsKey!0 _keys!1717 lt!432995 #b00000000000000000000000000000000) e!550383)))

(declare-fun b!976609 () Bool)

(declare-fun e!550384 () Bool)

(assert (=> b!976609 (= e!550383 e!550384)))

(declare-fun res!653790 () Bool)

(assert (=> b!976609 (=> (not res!653790) (not e!550384))))

(assert (=> b!976609 (= res!653790 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(declare-fun b!976610 () Bool)

(assert (=> b!976610 (= e!550384 (arrayContainsKey!0 _keys!1717 lt!432995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!116395 (not res!653789)) b!976609))

(assert (= (and b!976609 res!653790) b!976610))

(assert (=> d!116395 m!903125))

(declare-fun m!903535 () Bool)

(assert (=> b!976610 m!903535))

(assert (=> b!976417 d!116395))

(declare-fun b!976623 () Bool)

(declare-fun e!550393 () SeekEntryResult!9196)

(declare-fun e!550392 () SeekEntryResult!9196)

(assert (=> b!976623 (= e!550393 e!550392)))

(declare-fun lt!433144 () (_ BitVec 64))

(declare-fun lt!433143 () SeekEntryResult!9196)

(assert (=> b!976623 (= lt!433144 (select (arr!29297 _keys!1717) (index!39157 lt!433143)))))

(declare-fun c!99939 () Bool)

(assert (=> b!976623 (= c!99939 (= lt!433144 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun e!550391 () SeekEntryResult!9196)

(declare-fun b!976624 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60866 (_ BitVec 32)) SeekEntryResult!9196)

(assert (=> b!976624 (= e!550391 (seekKeyOrZeroReturnVacant!0 (x!84489 lt!433143) (index!39157 lt!433143) (index!39157 lt!433143) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(declare-fun b!976625 () Bool)

(assert (=> b!976625 (= e!550393 Undefined!9196)))

(declare-fun b!976626 () Bool)

(declare-fun c!99940 () Bool)

(assert (=> b!976626 (= c!99940 (= lt!433144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976626 (= e!550392 e!550391)))

(declare-fun b!976627 () Bool)

(assert (=> b!976627 (= e!550392 (Found!9196 (index!39157 lt!433143)))))

(declare-fun b!976628 () Bool)

(assert (=> b!976628 (= e!550391 (MissingZero!9196 (index!39157 lt!433143)))))

(declare-fun d!116397 () Bool)

(declare-fun lt!433145 () SeekEntryResult!9196)

(assert (=> d!116397 (and (or ((_ is Undefined!9196) lt!433145) (not ((_ is Found!9196) lt!433145)) (and (bvsge (index!39156 lt!433145) #b00000000000000000000000000000000) (bvslt (index!39156 lt!433145) (size!29778 _keys!1717)))) (or ((_ is Undefined!9196) lt!433145) ((_ is Found!9196) lt!433145) (not ((_ is MissingZero!9196) lt!433145)) (and (bvsge (index!39155 lt!433145) #b00000000000000000000000000000000) (bvslt (index!39155 lt!433145) (size!29778 _keys!1717)))) (or ((_ is Undefined!9196) lt!433145) ((_ is Found!9196) lt!433145) ((_ is MissingZero!9196) lt!433145) (not ((_ is MissingVacant!9196) lt!433145)) (and (bvsge (index!39158 lt!433145) #b00000000000000000000000000000000) (bvslt (index!39158 lt!433145) (size!29778 _keys!1717)))) (or ((_ is Undefined!9196) lt!433145) (ite ((_ is Found!9196) lt!433145) (= (select (arr!29297 _keys!1717) (index!39156 lt!433145)) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9196) lt!433145) (= (select (arr!29297 _keys!1717) (index!39155 lt!433145)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9196) lt!433145) (= (select (arr!29297 _keys!1717) (index!39158 lt!433145)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!116397 (= lt!433145 e!550393)))

(declare-fun c!99941 () Bool)

(assert (=> d!116397 (= c!99941 (and ((_ is Intermediate!9196) lt!433143) (undefined!10008 lt!433143)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60866 (_ BitVec 32)) SeekEntryResult!9196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!116397 (= lt!433143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) mask!2147) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(assert (=> d!116397 (validMask!0 mask!2147)))

(assert (=> d!116397 (= (seekEntryOrOpen!0 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) lt!433145)))

(assert (= (and d!116397 c!99941) b!976625))

(assert (= (and d!116397 (not c!99941)) b!976623))

(assert (= (and b!976623 c!99939) b!976627))

(assert (= (and b!976623 (not c!99939)) b!976626))

(assert (= (and b!976626 c!99940) b!976628))

(assert (= (and b!976626 (not c!99940)) b!976624))

(declare-fun m!903537 () Bool)

(assert (=> b!976623 m!903537))

(assert (=> b!976624 m!903125))

(declare-fun m!903539 () Bool)

(assert (=> b!976624 m!903539))

(declare-fun m!903541 () Bool)

(assert (=> d!116397 m!903541))

(assert (=> d!116397 m!903125))

(declare-fun m!903543 () Bool)

(assert (=> d!116397 m!903543))

(declare-fun m!903545 () Bool)

(assert (=> d!116397 m!903545))

(declare-fun m!903547 () Bool)

(assert (=> d!116397 m!903547))

(assert (=> d!116397 m!902981))

(assert (=> d!116397 m!903125))

(assert (=> d!116397 m!903541))

(declare-fun m!903549 () Bool)

(assert (=> d!116397 m!903549))

(assert (=> b!976417 d!116397))

(assert (=> b!976433 d!116383))

(assert (=> b!976420 d!116383))

(assert (=> b!976405 d!116365))

(assert (=> bm!41727 d!116293))

(declare-fun d!116399 () Bool)

(declare-fun e!550394 () Bool)

(assert (=> d!116399 e!550394))

(declare-fun res!653791 () Bool)

(assert (=> d!116399 (=> res!653791 e!550394)))

(declare-fun lt!433146 () Bool)

(assert (=> d!116399 (= res!653791 (not lt!433146))))

(declare-fun lt!433149 () Bool)

(assert (=> d!116399 (= lt!433146 lt!433149)))

(declare-fun lt!433147 () Unit!32342)

(declare-fun e!550395 () Unit!32342)

(assert (=> d!116399 (= lt!433147 e!550395)))

(declare-fun c!99942 () Bool)

(assert (=> d!116399 (= c!99942 lt!433149)))

(assert (=> d!116399 (= lt!433149 (containsKey!476 (toList!6643 lt!432975) (select (arr!29297 _keys!1717) from!2118)))))

(assert (=> d!116399 (= (contains!5670 lt!432975 (select (arr!29297 _keys!1717) from!2118)) lt!433146)))

(declare-fun b!976629 () Bool)

(declare-fun lt!433148 () Unit!32342)

(assert (=> b!976629 (= e!550395 lt!433148)))

(assert (=> b!976629 (= lt!433148 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!432975) (select (arr!29297 _keys!1717) from!2118)))))

(assert (=> b!976629 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) (select (arr!29297 _keys!1717) from!2118)))))

(declare-fun b!976630 () Bool)

(declare-fun Unit!32353 () Unit!32342)

(assert (=> b!976630 (= e!550395 Unit!32353)))

(declare-fun b!976631 () Bool)

(assert (=> b!976631 (= e!550394 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) (select (arr!29297 _keys!1717) from!2118))))))

(assert (= (and d!116399 c!99942) b!976629))

(assert (= (and d!116399 (not c!99942)) b!976630))

(assert (= (and d!116399 (not res!653791)) b!976631))

(assert (=> d!116399 m!903101))

(declare-fun m!903551 () Bool)

(assert (=> d!116399 m!903551))

(assert (=> b!976629 m!903101))

(declare-fun m!903553 () Bool)

(assert (=> b!976629 m!903553))

(assert (=> b!976629 m!903101))

(assert (=> b!976629 m!903473))

(assert (=> b!976629 m!903473))

(declare-fun m!903555 () Bool)

(assert (=> b!976629 m!903555))

(assert (=> b!976631 m!903101))

(assert (=> b!976631 m!903473))

(assert (=> b!976631 m!903473))

(assert (=> b!976631 m!903555))

(assert (=> b!976406 d!116399))

(declare-fun d!116401 () Bool)

(declare-fun lt!433152 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!414 (List!20375) (InoxSet (_ BitVec 64)))

(assert (=> d!116401 (= lt!433152 (select (content!414 Nil!20372) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun e!550401 () Bool)

(assert (=> d!116401 (= lt!433152 e!550401)))

(declare-fun res!653797 () Bool)

(assert (=> d!116401 (=> (not res!653797) (not e!550401))))

(assert (=> d!116401 (= res!653797 ((_ is Cons!20371) Nil!20372))))

(assert (=> d!116401 (= (contains!5673 Nil!20372 (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)) lt!433152)))

(declare-fun b!976636 () Bool)

(declare-fun e!550400 () Bool)

(assert (=> b!976636 (= e!550401 e!550400)))

(declare-fun res!653796 () Bool)

(assert (=> b!976636 (=> res!653796 e!550400)))

(assert (=> b!976636 (= res!653796 (= (h!21533 Nil!20372) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976637 () Bool)

(assert (=> b!976637 (= e!550400 (contains!5673 (t!28879 Nil!20372) (select (arr!29297 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116401 res!653797) b!976636))

(assert (= (and b!976636 (not res!653796)) b!976637))

(declare-fun m!903557 () Bool)

(assert (=> d!116401 m!903557))

(assert (=> d!116401 m!903125))

(declare-fun m!903559 () Bool)

(assert (=> d!116401 m!903559))

(assert (=> b!976637 m!903125))

(declare-fun m!903561 () Bool)

(assert (=> b!976637 m!903561))

(assert (=> b!976435 d!116401))

(declare-fun b!976638 () Bool)

(declare-fun e!550403 () Bool)

(declare-fun e!550402 () Bool)

(assert (=> b!976638 (= e!550403 e!550402)))

(declare-fun lt!433154 () (_ BitVec 64))

(assert (=> b!976638 (= lt!433154 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!433155 () Unit!32342)

(assert (=> b!976638 (= lt!433155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!976638 (arrayContainsKey!0 _keys!1717 lt!433154 #b00000000000000000000000000000000)))

(declare-fun lt!433153 () Unit!32342)

(assert (=> b!976638 (= lt!433153 lt!433155)))

(declare-fun res!653799 () Bool)

(assert (=> b!976638 (= res!653799 (= (seekEntryOrOpen!0 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1717 mask!2147) (Found!9196 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!976638 (=> (not res!653799) (not e!550402))))

(declare-fun b!976639 () Bool)

(declare-fun call!41755 () Bool)

(assert (=> b!976639 (= e!550402 call!41755)))

(declare-fun b!976640 () Bool)

(assert (=> b!976640 (= e!550403 call!41755)))

(declare-fun bm!41752 () Bool)

(assert (=> bm!41752 (= call!41755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116403 () Bool)

(declare-fun res!653798 () Bool)

(declare-fun e!550404 () Bool)

(assert (=> d!116403 (=> res!653798 e!550404)))

(assert (=> d!116403 (= res!653798 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29778 _keys!1717)))))

(assert (=> d!116403 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147) e!550404)))

(declare-fun b!976641 () Bool)

(assert (=> b!976641 (= e!550404 e!550403)))

(declare-fun c!99943 () Bool)

(assert (=> b!976641 (= c!99943 (validKeyInArray!0 (select (arr!29297 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!116403 (not res!653798)) b!976641))

(assert (= (and b!976641 c!99943) b!976638))

(assert (= (and b!976641 (not c!99943)) b!976640))

(assert (= (and b!976638 res!653799) b!976639))

(assert (= (or b!976639 b!976640) bm!41752))

(assert (=> b!976638 m!903489))

(declare-fun m!903563 () Bool)

(assert (=> b!976638 m!903563))

(declare-fun m!903565 () Bool)

(assert (=> b!976638 m!903565))

(assert (=> b!976638 m!903489))

(declare-fun m!903567 () Bool)

(assert (=> b!976638 m!903567))

(declare-fun m!903569 () Bool)

(assert (=> bm!41752 m!903569))

(assert (=> b!976641 m!903489))

(assert (=> b!976641 m!903489))

(assert (=> b!976641 m!903493))

(assert (=> bm!41736 d!116403))

(declare-fun d!116405 () Bool)

(declare-fun e!550405 () Bool)

(assert (=> d!116405 e!550405))

(declare-fun res!653800 () Bool)

(assert (=> d!116405 (=> (not res!653800) (not e!550405))))

(declare-fun lt!433157 () ListLongMap!13255)

(assert (=> d!116405 (= res!653800 (contains!5670 lt!433157 (_1!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433156 () List!20374)

(assert (=> d!116405 (= lt!433157 (ListLongMap!13256 lt!433156))))

(declare-fun lt!433159 () Unit!32342)

(declare-fun lt!433158 () Unit!32342)

(assert (=> d!116405 (= lt!433159 lt!433158)))

(assert (=> d!116405 (= (getValueByKey!512 lt!433156 (_1!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!517 (_2!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116405 (= lt!433158 (lemmaContainsTupThenGetReturnValue!269 lt!433156 (_1!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116405 (= lt!433156 (insertStrictlySorted!326 (toList!6643 (ite c!99884 call!41736 (ite c!99881 call!41730 call!41734))) (_1!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116405 (= (+!2945 (ite c!99884 call!41736 (ite c!99881 call!41730 call!41734)) (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433157)))

(declare-fun b!976642 () Bool)

(declare-fun res!653801 () Bool)

(assert (=> b!976642 (=> (not res!653801) (not e!550405))))

(assert (=> b!976642 (= res!653801 (= (getValueByKey!512 (toList!6643 lt!433157) (_1!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!517 (_2!7295 (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!976643 () Bool)

(assert (=> b!976643 (= e!550405 (contains!5674 (toList!6643 lt!433157) (ite (or c!99884 c!99881) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116405 res!653800) b!976642))

(assert (= (and b!976642 res!653801) b!976643))

(declare-fun m!903571 () Bool)

(assert (=> d!116405 m!903571))

(declare-fun m!903573 () Bool)

(assert (=> d!116405 m!903573))

(declare-fun m!903575 () Bool)

(assert (=> d!116405 m!903575))

(declare-fun m!903577 () Bool)

(assert (=> d!116405 m!903577))

(declare-fun m!903579 () Bool)

(assert (=> b!976642 m!903579))

(declare-fun m!903581 () Bool)

(assert (=> b!976643 m!903581))

(assert (=> bm!41732 d!116405))

(declare-fun d!116407 () Bool)

(declare-fun e!550406 () Bool)

(assert (=> d!116407 e!550406))

(declare-fun res!653802 () Bool)

(assert (=> d!116407 (=> (not res!653802) (not e!550406))))

(declare-fun lt!433161 () ListLongMap!13255)

(assert (=> d!116407 (= res!653802 (contains!5670 lt!433161 (_1!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433160 () List!20374)

(assert (=> d!116407 (= lt!433161 (ListLongMap!13256 lt!433160))))

(declare-fun lt!433163 () Unit!32342)

(declare-fun lt!433162 () Unit!32342)

(assert (=> d!116407 (= lt!433163 lt!433162)))

(assert (=> d!116407 (= (getValueByKey!512 lt!433160 (_1!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!517 (_2!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116407 (= lt!433162 (lemmaContainsTupThenGetReturnValue!269 lt!433160 (_1!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116407 (= lt!433160 (insertStrictlySorted!326 (toList!6643 (ite c!99897 call!41749 (ite c!99894 call!41743 call!41747))) (_1!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116407 (= (+!2945 (ite c!99897 call!41749 (ite c!99894 call!41743 call!41747)) (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433161)))

(declare-fun b!976644 () Bool)

(declare-fun res!653803 () Bool)

(assert (=> b!976644 (=> (not res!653803) (not e!550406))))

(assert (=> b!976644 (= res!653803 (= (getValueByKey!512 (toList!6643 lt!433161) (_1!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!517 (_2!7295 (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!976645 () Bool)

(assert (=> b!976645 (= e!550406 (contains!5674 (toList!6643 lt!433161) (ite (or c!99897 c!99894) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116407 res!653802) b!976644))

(assert (= (and b!976644 res!653803) b!976645))

(declare-fun m!903583 () Bool)

(assert (=> d!116407 m!903583))

(declare-fun m!903585 () Bool)

(assert (=> d!116407 m!903585))

(declare-fun m!903587 () Bool)

(assert (=> d!116407 m!903587))

(declare-fun m!903589 () Bool)

(assert (=> d!116407 m!903589))

(declare-fun m!903591 () Bool)

(assert (=> b!976644 m!903591))

(declare-fun m!903593 () Bool)

(assert (=> b!976645 m!903593))

(assert (=> bm!41745 d!116407))

(declare-fun d!116409 () Bool)

(declare-fun e!550407 () Bool)

(assert (=> d!116409 e!550407))

(declare-fun res!653804 () Bool)

(assert (=> d!116409 (=> res!653804 e!550407)))

(declare-fun lt!433164 () Bool)

(assert (=> d!116409 (= res!653804 (not lt!433164))))

(declare-fun lt!433167 () Bool)

(assert (=> d!116409 (= lt!433164 lt!433167)))

(declare-fun lt!433165 () Unit!32342)

(declare-fun e!550408 () Unit!32342)

(assert (=> d!116409 (= lt!433165 e!550408)))

(declare-fun c!99944 () Bool)

(assert (=> d!116409 (= c!99944 lt!433167)))

(assert (=> d!116409 (= lt!433167 (containsKey!476 (toList!6643 lt!433010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116409 (= (contains!5670 lt!433010 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433164)))

(declare-fun b!976646 () Bool)

(declare-fun lt!433166 () Unit!32342)

(assert (=> b!976646 (= e!550408 lt!433166)))

(assert (=> b!976646 (= lt!433166 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!433010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976646 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976647 () Bool)

(declare-fun Unit!32354 () Unit!32342)

(assert (=> b!976647 (= e!550408 Unit!32354)))

(declare-fun b!976648 () Bool)

(assert (=> b!976648 (= e!550407 (isDefined!384 (getValueByKey!512 (toList!6643 lt!433010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116409 c!99944) b!976646))

(assert (= (and d!116409 (not c!99944)) b!976647))

(assert (= (and d!116409 (not res!653804)) b!976648))

(declare-fun m!903595 () Bool)

(assert (=> d!116409 m!903595))

(declare-fun m!903597 () Bool)

(assert (=> b!976646 m!903597))

(assert (=> b!976646 m!903365))

(assert (=> b!976646 m!903365))

(declare-fun m!903599 () Bool)

(assert (=> b!976646 m!903599))

(assert (=> b!976648 m!903365))

(assert (=> b!976648 m!903365))

(assert (=> b!976648 m!903599))

(assert (=> bm!41744 d!116409))

(declare-fun d!116411 () Bool)

(declare-fun e!550409 () Bool)

(assert (=> d!116411 e!550409))

(declare-fun res!653805 () Bool)

(assert (=> d!116411 (=> res!653805 e!550409)))

(declare-fun lt!433168 () Bool)

(assert (=> d!116411 (= res!653805 (not lt!433168))))

(declare-fun lt!433171 () Bool)

(assert (=> d!116411 (= lt!433168 lt!433171)))

(declare-fun lt!433169 () Unit!32342)

(declare-fun e!550410 () Unit!32342)

(assert (=> d!116411 (= lt!433169 e!550410)))

(declare-fun c!99945 () Bool)

(assert (=> d!116411 (= c!99945 lt!433171)))

(assert (=> d!116411 (= lt!433171 (containsKey!476 (toList!6643 lt!432975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116411 (= (contains!5670 lt!432975 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433168)))

(declare-fun b!976649 () Bool)

(declare-fun lt!433170 () Unit!32342)

(assert (=> b!976649 (= e!550410 lt!433170)))

(assert (=> b!976649 (= lt!433170 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 lt!432975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976649 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976650 () Bool)

(declare-fun Unit!32355 () Unit!32342)

(assert (=> b!976650 (= e!550410 Unit!32355)))

(declare-fun b!976651 () Bool)

(assert (=> b!976651 (= e!550409 (isDefined!384 (getValueByKey!512 (toList!6643 lt!432975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116411 c!99945) b!976649))

(assert (= (and d!116411 (not c!99945)) b!976650))

(assert (= (and d!116411 (not res!653805)) b!976651))

(declare-fun m!903601 () Bool)

(assert (=> d!116411 m!903601))

(declare-fun m!903603 () Bool)

(assert (=> b!976649 m!903603))

(assert (=> b!976649 m!903369))

(assert (=> b!976649 m!903369))

(declare-fun m!903605 () Bool)

(assert (=> b!976649 m!903605))

(assert (=> b!976651 m!903369))

(assert (=> b!976651 m!903369))

(assert (=> b!976651 m!903605))

(assert (=> bm!41733 d!116411))

(declare-fun d!116413 () Bool)

(assert (=> d!116413 (isDefined!384 (getValueByKey!512 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun lt!433172 () Unit!32342)

(assert (=> d!116413 (= lt!433172 (choose!1612 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(declare-fun e!550411 () Bool)

(assert (=> d!116413 e!550411))

(declare-fun res!653806 () Bool)

(assert (=> d!116413 (=> (not res!653806) (not e!550411))))

(assert (=> d!116413 (= res!653806 (isStrictlySorted!510 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))

(assert (=> d!116413 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)) lt!433172)))

(declare-fun b!976652 () Bool)

(assert (=> b!976652 (= e!550411 (containsKey!476 (toList!6643 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29297 _keys!1717) i!822)))))

(assert (= (and d!116413 res!653806) b!976652))

(assert (=> d!116413 m!902975))

(assert (=> d!116413 m!903063))

(assert (=> d!116413 m!903063))

(assert (=> d!116413 m!903065))

(assert (=> d!116413 m!902975))

(declare-fun m!903607 () Bool)

(assert (=> d!116413 m!903607))

(declare-fun m!903609 () Bool)

(assert (=> d!116413 m!903609))

(assert (=> b!976652 m!902975))

(assert (=> b!976652 m!903059))

(assert (=> b!976341 d!116413))

(assert (=> b!976341 d!116321))

(assert (=> b!976341 d!116323))

(declare-fun condMapEmpty!35699 () Bool)

(declare-fun mapDefault!35699 () ValueCell!10745)

(assert (=> mapNonEmpty!35698 (= condMapEmpty!35699 (= mapRest!35698 ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35699)))))

(declare-fun e!550413 () Bool)

(declare-fun mapRes!35699 () Bool)

(assert (=> mapNonEmpty!35698 (= tp!67951 (and e!550413 mapRes!35699))))

(declare-fun mapNonEmpty!35699 () Bool)

(declare-fun tp!67952 () Bool)

(declare-fun e!550412 () Bool)

(assert (=> mapNonEmpty!35699 (= mapRes!35699 (and tp!67952 e!550412))))

(declare-fun mapRest!35699 () (Array (_ BitVec 32) ValueCell!10745))

(declare-fun mapValue!35699 () ValueCell!10745)

(declare-fun mapKey!35699 () (_ BitVec 32))

(assert (=> mapNonEmpty!35699 (= mapRest!35698 (store mapRest!35699 mapKey!35699 mapValue!35699))))

(declare-fun b!976654 () Bool)

(assert (=> b!976654 (= e!550413 tp_is_empty!22453)))

(declare-fun b!976653 () Bool)

(assert (=> b!976653 (= e!550412 tp_is_empty!22453)))

(declare-fun mapIsEmpty!35699 () Bool)

(assert (=> mapIsEmpty!35699 mapRes!35699))

(assert (= (and mapNonEmpty!35698 condMapEmpty!35699) mapIsEmpty!35699))

(assert (= (and mapNonEmpty!35698 (not condMapEmpty!35699)) mapNonEmpty!35699))

(assert (= (and mapNonEmpty!35699 ((_ is ValueCellFull!10745) mapValue!35699)) b!976653))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10745) mapDefault!35699)) b!976654))

(declare-fun m!903611 () Bool)

(assert (=> mapNonEmpty!35699 m!903611))

(declare-fun b_lambda!14579 () Bool)

(assert (= b_lambda!14573 (or (and start!83544 b_free!19549) b_lambda!14579)))

(declare-fun b_lambda!14581 () Bool)

(assert (= b_lambda!14575 (or (and start!83544 b_free!19549) b_lambda!14581)))

(declare-fun b_lambda!14583 () Bool)

(assert (= b_lambda!14571 (or (and start!83544 b_free!19549) b_lambda!14583)))

(declare-fun b_lambda!14585 () Bool)

(assert (= b_lambda!14577 (or (and start!83544 b_free!19549) b_lambda!14585)))

(check-sat (not b!976582) (not b!976509) (not d!116301) (not d!116381) (not b!976604) (not b!976573) (not b!976528) (not d!116335) (not d!116405) (not d!116305) (not b!976468) (not d!116315) (not b!976574) (not d!116289) (not b!976533) (not b!976523) (not b!976641) (not d!116387) (not b!976629) (not d!116339) (not bm!41751) (not b!976518) (not d!116307) b_and!31177 (not d!116299) (not b!976602) (not b!976598) (not d!116341) (not b!976519) (not d!116327) (not d!116349) (not b!976568) (not b!976572) (not d!116311) (not d!116285) (not d!116399) (not b_lambda!14579) (not b!976508) (not d!116317) (not d!116357) (not b!976571) (not b!976586) (not d!116343) (not b!976594) (not d!116359) (not b!976480) (not b!976566) (not b!976652) (not b_lambda!14585) (not b!976563) (not b_lambda!14567) (not d!116355) (not b!976559) (not b!976537) (not b!976531) (not d!116287) (not b!976638) (not d!116369) (not b!976651) (not d!116313) (not b!976603) (not b!976642) (not d!116407) (not b!976577) (not d!116363) (not bm!41749) (not b!976511) (not d!116319) (not d!116409) (not b!976551) (not b!976540) (not mapNonEmpty!35699) (not d!116331) (not b!976646) (not b!976527) (not b!976561) (not b!976507) (not b_lambda!14569) (not b_lambda!14581) (not d!116367) (not d!116373) (not b!976569) (not b!976558) (not b!976583) (not b!976596) (not b!976649) (not d!116389) (not b!976610) (not b!976521) (not bm!41752) (not b!976575) (not b_lambda!14583) (not b!976565) (not b!976514) (not b!976470) (not b!976535) (not d!116411) (not b!976538) (not d!116351) (not d!116397) (not d!116353) (not b!976600) (not d!116295) (not d!116329) (not d!116283) (not d!116293) (not b!976539) (not b!976631) (not b!976525) tp_is_empty!22453 (not d!116345) (not b!976515) (not b!976599) (not d!116347) (not b!976597) (not b_next!19549) (not d!116413) (not d!116297) (not b!976624) (not d!116337) (not d!116401) (not d!116291) (not d!116393) (not b!976522) (not b!976645) (not b!976532) (not b!976589) (not d!116303) (not b!976516) (not b!976513) (not b!976593) (not b!976643) (not b!976595) (not bm!41750) (not d!116321) (not d!116375) (not b!976648) (not d!116361) (not d!116309) (not b!976644) (not b!976479) (not d!116385) (not b!976637))
(check-sat b_and!31177 (not b_next!19549))
