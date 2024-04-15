; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20996 () Bool)

(assert start!20996)

(declare-fun b_free!5563 () Bool)

(declare-fun b_next!5563 () Bool)

(assert (=> start!20996 (= b_free!5563 (not b_next!5563))))

(declare-fun tp!19741 () Bool)

(declare-fun b_and!12331 () Bool)

(assert (=> start!20996 (= tp!19741 b_and!12331)))

(declare-fun mapIsEmpty!9218 () Bool)

(declare-fun mapRes!9218 () Bool)

(assert (=> mapIsEmpty!9218 mapRes!9218))

(declare-fun b!210847 () Bool)

(declare-fun e!137264 () Bool)

(declare-fun tp_is_empty!5425 () Bool)

(assert (=> b!210847 (= e!137264 tp_is_empty!5425)))

(declare-fun b!210848 () Bool)

(declare-fun res!102928 () Bool)

(declare-fun e!137267 () Bool)

(assert (=> b!210848 (=> (not res!102928) (not e!137267))))

(declare-datatypes ((array!10039 0))(
  ( (array!10040 (arr!4765 (Array (_ BitVec 32) (_ BitVec 64))) (size!5091 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10039)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210848 (= res!102928 (= (select (arr!4765 _keys!825) i!601) k0!843))))

(declare-fun b!210849 () Bool)

(declare-fun res!102927 () Bool)

(assert (=> b!210849 (=> (not res!102927) (not e!137267))))

(declare-datatypes ((List!3053 0))(
  ( (Nil!3050) (Cons!3049 (h!3691 (_ BitVec 64)) (t!7983 List!3053)) )
))
(declare-fun arrayNoDuplicates!0 (array!10039 (_ BitVec 32) List!3053) Bool)

(assert (=> b!210849 (= res!102927 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3050))))

(declare-fun b!210850 () Bool)

(declare-fun e!137268 () Bool)

(assert (=> b!210850 (= e!137268 (and e!137264 mapRes!9218))))

(declare-fun condMapEmpty!9218 () Bool)

(declare-datatypes ((V!6881 0))(
  ( (V!6882 (val!2757 Int)) )
))
(declare-datatypes ((ValueCell!2369 0))(
  ( (ValueCellFull!2369 (v!4737 V!6881)) (EmptyCell!2369) )
))
(declare-datatypes ((array!10041 0))(
  ( (array!10042 (arr!4766 (Array (_ BitVec 32) ValueCell!2369)) (size!5092 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10041)

(declare-fun mapDefault!9218 () ValueCell!2369)

(assert (=> b!210850 (= condMapEmpty!9218 (= (arr!4766 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2369)) mapDefault!9218)))))

(declare-fun b!210851 () Bool)

(declare-fun res!102929 () Bool)

(assert (=> b!210851 (=> (not res!102929) (not e!137267))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210851 (= res!102929 (and (= (size!5092 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5091 _keys!825) (size!5092 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210852 () Bool)

(declare-fun e!137266 () Bool)

(assert (=> b!210852 (= e!137266 tp_is_empty!5425)))

(declare-fun res!102923 () Bool)

(assert (=> start!20996 (=> (not res!102923) (not e!137267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20996 (= res!102923 (validMask!0 mask!1149))))

(assert (=> start!20996 e!137267))

(declare-fun array_inv!3129 (array!10041) Bool)

(assert (=> start!20996 (and (array_inv!3129 _values!649) e!137268)))

(assert (=> start!20996 true))

(assert (=> start!20996 tp_is_empty!5425))

(declare-fun array_inv!3130 (array!10039) Bool)

(assert (=> start!20996 (array_inv!3130 _keys!825)))

(assert (=> start!20996 tp!19741))

(declare-fun b!210853 () Bool)

(declare-fun e!137263 () Bool)

(assert (=> b!210853 (= e!137267 (not e!137263))))

(declare-fun res!102922 () Bool)

(assert (=> b!210853 (=> res!102922 e!137263)))

(assert (=> b!210853 (= res!102922 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6881)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!4146 0))(
  ( (tuple2!4147 (_1!2084 (_ BitVec 64)) (_2!2084 V!6881)) )
))
(declare-datatypes ((List!3054 0))(
  ( (Nil!3051) (Cons!3050 (h!3692 tuple2!4146) (t!7984 List!3054)) )
))
(declare-datatypes ((ListLongMap!3049 0))(
  ( (ListLongMap!3050 (toList!1540 List!3054)) )
))
(declare-fun lt!108212 () ListLongMap!3049)

(declare-fun minValue!615 () V!6881)

(declare-fun getCurrentListMap!1052 (array!10039 array!10041 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!210853 (= lt!108212 (getCurrentListMap!1052 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108209 () array!10041)

(declare-fun lt!108211 () ListLongMap!3049)

(assert (=> b!210853 (= lt!108211 (getCurrentListMap!1052 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108210 () ListLongMap!3049)

(declare-fun lt!108213 () ListLongMap!3049)

(assert (=> b!210853 (and (= lt!108210 lt!108213) (= lt!108213 lt!108210))))

(declare-fun v!520 () V!6881)

(declare-fun lt!108215 () ListLongMap!3049)

(declare-fun +!564 (ListLongMap!3049 tuple2!4146) ListLongMap!3049)

(assert (=> b!210853 (= lt!108213 (+!564 lt!108215 (tuple2!4147 k0!843 v!520)))))

(declare-datatypes ((Unit!6372 0))(
  ( (Unit!6373) )
))
(declare-fun lt!108214 () Unit!6372)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 (array!10039 array!10041 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) (_ BitVec 64) V!6881 (_ BitVec 32) Int) Unit!6372)

(assert (=> b!210853 (= lt!108214 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!489 (array!10039 array!10041 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!210853 (= lt!108210 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210853 (= lt!108209 (array!10042 (store (arr!4766 _values!649) i!601 (ValueCellFull!2369 v!520)) (size!5092 _values!649)))))

(assert (=> b!210853 (= lt!108215 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210854 () Bool)

(declare-fun res!102926 () Bool)

(assert (=> b!210854 (=> (not res!102926) (not e!137267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10039 (_ BitVec 32)) Bool)

(assert (=> b!210854 (= res!102926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210855 () Bool)

(declare-fun res!102924 () Bool)

(assert (=> b!210855 (=> (not res!102924) (not e!137267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210855 (= res!102924 (validKeyInArray!0 k0!843))))

(declare-fun b!210856 () Bool)

(declare-fun res!102925 () Bool)

(assert (=> b!210856 (=> (not res!102925) (not e!137267))))

(assert (=> b!210856 (= res!102925 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5091 _keys!825))))))

(declare-fun b!210857 () Bool)

(assert (=> b!210857 (= e!137263 (= lt!108211 (+!564 lt!108210 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun mapNonEmpty!9218 () Bool)

(declare-fun tp!19742 () Bool)

(assert (=> mapNonEmpty!9218 (= mapRes!9218 (and tp!19742 e!137266))))

(declare-fun mapRest!9218 () (Array (_ BitVec 32) ValueCell!2369))

(declare-fun mapValue!9218 () ValueCell!2369)

(declare-fun mapKey!9218 () (_ BitVec 32))

(assert (=> mapNonEmpty!9218 (= (arr!4766 _values!649) (store mapRest!9218 mapKey!9218 mapValue!9218))))

(assert (= (and start!20996 res!102923) b!210851))

(assert (= (and b!210851 res!102929) b!210854))

(assert (= (and b!210854 res!102926) b!210849))

(assert (= (and b!210849 res!102927) b!210856))

(assert (= (and b!210856 res!102925) b!210855))

(assert (= (and b!210855 res!102924) b!210848))

(assert (= (and b!210848 res!102928) b!210853))

(assert (= (and b!210853 (not res!102922)) b!210857))

(assert (= (and b!210850 condMapEmpty!9218) mapIsEmpty!9218))

(assert (= (and b!210850 (not condMapEmpty!9218)) mapNonEmpty!9218))

(get-info :version)

(assert (= (and mapNonEmpty!9218 ((_ is ValueCellFull!2369) mapValue!9218)) b!210852))

(assert (= (and b!210850 ((_ is ValueCellFull!2369) mapDefault!9218)) b!210847))

(assert (= start!20996 b!210850))

(declare-fun m!238115 () Bool)

(assert (=> b!210849 m!238115))

(declare-fun m!238117 () Bool)

(assert (=> mapNonEmpty!9218 m!238117))

(declare-fun m!238119 () Bool)

(assert (=> b!210853 m!238119))

(declare-fun m!238121 () Bool)

(assert (=> b!210853 m!238121))

(declare-fun m!238123 () Bool)

(assert (=> b!210853 m!238123))

(declare-fun m!238125 () Bool)

(assert (=> b!210853 m!238125))

(declare-fun m!238127 () Bool)

(assert (=> b!210853 m!238127))

(declare-fun m!238129 () Bool)

(assert (=> b!210853 m!238129))

(declare-fun m!238131 () Bool)

(assert (=> b!210853 m!238131))

(declare-fun m!238133 () Bool)

(assert (=> b!210855 m!238133))

(declare-fun m!238135 () Bool)

(assert (=> b!210857 m!238135))

(declare-fun m!238137 () Bool)

(assert (=> start!20996 m!238137))

(declare-fun m!238139 () Bool)

(assert (=> start!20996 m!238139))

(declare-fun m!238141 () Bool)

(assert (=> start!20996 m!238141))

(declare-fun m!238143 () Bool)

(assert (=> b!210848 m!238143))

(declare-fun m!238145 () Bool)

(assert (=> b!210854 m!238145))

(check-sat (not b!210849) (not b!210854) (not b!210853) (not mapNonEmpty!9218) (not b!210857) (not b_next!5563) (not start!20996) b_and!12331 (not b!210855) tp_is_empty!5425)
(check-sat b_and!12331 (not b_next!5563))
(get-model)

(declare-fun d!57863 () Bool)

(assert (=> d!57863 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20996 d!57863))

(declare-fun d!57865 () Bool)

(assert (=> d!57865 (= (array_inv!3129 _values!649) (bvsge (size!5092 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20996 d!57865))

(declare-fun d!57867 () Bool)

(assert (=> d!57867 (= (array_inv!3130 _keys!825) (bvsge (size!5091 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20996 d!57867))

(declare-fun d!57869 () Bool)

(declare-fun e!137307 () Bool)

(assert (=> d!57869 e!137307))

(declare-fun res!102983 () Bool)

(assert (=> d!57869 (=> (not res!102983) (not e!137307))))

(declare-fun lt!108269 () ListLongMap!3049)

(declare-fun contains!1379 (ListLongMap!3049 (_ BitVec 64)) Bool)

(assert (=> d!57869 (= res!102983 (contains!1379 lt!108269 (_1!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!108267 () List!3054)

(assert (=> d!57869 (= lt!108269 (ListLongMap!3050 lt!108267))))

(declare-fun lt!108268 () Unit!6372)

(declare-fun lt!108266 () Unit!6372)

(assert (=> d!57869 (= lt!108268 lt!108266)))

(declare-datatypes ((Option!255 0))(
  ( (Some!254 (v!4743 V!6881)) (None!253) )
))
(declare-fun getValueByKey!249 (List!3054 (_ BitVec 64)) Option!255)

(assert (=> d!57869 (= (getValueByKey!249 lt!108267 (_1!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!254 (_2!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!139 (List!3054 (_ BitVec 64) V!6881) Unit!6372)

(assert (=> d!57869 (= lt!108266 (lemmaContainsTupThenGetReturnValue!139 lt!108267 (_1!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun insertStrictlySorted!142 (List!3054 (_ BitVec 64) V!6881) List!3054)

(assert (=> d!57869 (= lt!108267 (insertStrictlySorted!142 (toList!1540 lt!108210) (_1!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57869 (= (+!564 lt!108210 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!108269)))

(declare-fun b!210928 () Bool)

(declare-fun res!102982 () Bool)

(assert (=> b!210928 (=> (not res!102982) (not e!137307))))

(assert (=> b!210928 (= res!102982 (= (getValueByKey!249 (toList!1540 lt!108269) (_1!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!254 (_2!2084 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!210929 () Bool)

(declare-fun contains!1380 (List!3054 tuple2!4146) Bool)

(assert (=> b!210929 (= e!137307 (contains!1380 (toList!1540 lt!108269) (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!57869 res!102983) b!210928))

(assert (= (and b!210928 res!102982) b!210929))

(declare-fun m!238211 () Bool)

(assert (=> d!57869 m!238211))

(declare-fun m!238213 () Bool)

(assert (=> d!57869 m!238213))

(declare-fun m!238215 () Bool)

(assert (=> d!57869 m!238215))

(declare-fun m!238217 () Bool)

(assert (=> d!57869 m!238217))

(declare-fun m!238219 () Bool)

(assert (=> b!210928 m!238219))

(declare-fun m!238221 () Bool)

(assert (=> b!210929 m!238221))

(assert (=> b!210857 d!57869))

(declare-fun d!57871 () Bool)

(assert (=> d!57871 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210855 d!57871))

(declare-fun b!210940 () Bool)

(declare-fun e!137319 () Bool)

(declare-fun call!19931 () Bool)

(assert (=> b!210940 (= e!137319 call!19931)))

(declare-fun b!210941 () Bool)

(declare-fun e!137318 () Bool)

(assert (=> b!210941 (= e!137318 e!137319)))

(declare-fun c!35608 () Bool)

(assert (=> b!210941 (= c!35608 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210942 () Bool)

(declare-fun e!137316 () Bool)

(declare-fun contains!1381 (List!3053 (_ BitVec 64)) Bool)

(assert (=> b!210942 (= e!137316 (contains!1381 Nil!3050 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57873 () Bool)

(declare-fun res!102991 () Bool)

(declare-fun e!137317 () Bool)

(assert (=> d!57873 (=> res!102991 e!137317)))

(assert (=> d!57873 (= res!102991 (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57873 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3050) e!137317)))

(declare-fun bm!19928 () Bool)

(assert (=> bm!19928 (= call!19931 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35608 (Cons!3049 (select (arr!4765 _keys!825) #b00000000000000000000000000000000) Nil!3050) Nil!3050)))))

(declare-fun b!210943 () Bool)

(assert (=> b!210943 (= e!137317 e!137318)))

(declare-fun res!102990 () Bool)

(assert (=> b!210943 (=> (not res!102990) (not e!137318))))

(assert (=> b!210943 (= res!102990 (not e!137316))))

(declare-fun res!102992 () Bool)

(assert (=> b!210943 (=> (not res!102992) (not e!137316))))

(assert (=> b!210943 (= res!102992 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210944 () Bool)

(assert (=> b!210944 (= e!137319 call!19931)))

(assert (= (and d!57873 (not res!102991)) b!210943))

(assert (= (and b!210943 res!102992) b!210942))

(assert (= (and b!210943 res!102990) b!210941))

(assert (= (and b!210941 c!35608) b!210940))

(assert (= (and b!210941 (not c!35608)) b!210944))

(assert (= (or b!210940 b!210944) bm!19928))

(declare-fun m!238223 () Bool)

(assert (=> b!210941 m!238223))

(assert (=> b!210941 m!238223))

(declare-fun m!238225 () Bool)

(assert (=> b!210941 m!238225))

(assert (=> b!210942 m!238223))

(assert (=> b!210942 m!238223))

(declare-fun m!238227 () Bool)

(assert (=> b!210942 m!238227))

(assert (=> bm!19928 m!238223))

(declare-fun m!238229 () Bool)

(assert (=> bm!19928 m!238229))

(assert (=> b!210943 m!238223))

(assert (=> b!210943 m!238223))

(assert (=> b!210943 m!238225))

(assert (=> b!210849 d!57873))

(declare-fun b!210953 () Bool)

(declare-fun e!137327 () Bool)

(declare-fun e!137328 () Bool)

(assert (=> b!210953 (= e!137327 e!137328)))

(declare-fun lt!108277 () (_ BitVec 64))

(assert (=> b!210953 (= lt!108277 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108276 () Unit!6372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10039 (_ BitVec 64) (_ BitVec 32)) Unit!6372)

(assert (=> b!210953 (= lt!108276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108277 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210953 (arrayContainsKey!0 _keys!825 lt!108277 #b00000000000000000000000000000000)))

(declare-fun lt!108278 () Unit!6372)

(assert (=> b!210953 (= lt!108278 lt!108276)))

(declare-fun res!102997 () Bool)

(declare-datatypes ((SeekEntryResult!709 0))(
  ( (MissingZero!709 (index!5006 (_ BitVec 32))) (Found!709 (index!5007 (_ BitVec 32))) (Intermediate!709 (undefined!1521 Bool) (index!5008 (_ BitVec 32)) (x!22078 (_ BitVec 32))) (Undefined!709) (MissingVacant!709 (index!5009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10039 (_ BitVec 32)) SeekEntryResult!709)

(assert (=> b!210953 (= res!102997 (= (seekEntryOrOpen!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!709 #b00000000000000000000000000000000)))))

(assert (=> b!210953 (=> (not res!102997) (not e!137328))))

(declare-fun d!57875 () Bool)

(declare-fun res!102998 () Bool)

(declare-fun e!137326 () Bool)

(assert (=> d!57875 (=> res!102998 e!137326)))

(assert (=> d!57875 (= res!102998 (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137326)))

(declare-fun b!210954 () Bool)

(declare-fun call!19934 () Bool)

(assert (=> b!210954 (= e!137328 call!19934)))

(declare-fun b!210955 () Bool)

(assert (=> b!210955 (= e!137326 e!137327)))

(declare-fun c!35611 () Bool)

(assert (=> b!210955 (= c!35611 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19931 () Bool)

(assert (=> bm!19931 (= call!19934 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210956 () Bool)

(assert (=> b!210956 (= e!137327 call!19934)))

(assert (= (and d!57875 (not res!102998)) b!210955))

(assert (= (and b!210955 c!35611) b!210953))

(assert (= (and b!210955 (not c!35611)) b!210956))

(assert (= (and b!210953 res!102997) b!210954))

(assert (= (or b!210954 b!210956) bm!19931))

(assert (=> b!210953 m!238223))

(declare-fun m!238231 () Bool)

(assert (=> b!210953 m!238231))

(declare-fun m!238233 () Bool)

(assert (=> b!210953 m!238233))

(assert (=> b!210953 m!238223))

(declare-fun m!238235 () Bool)

(assert (=> b!210953 m!238235))

(assert (=> b!210955 m!238223))

(assert (=> b!210955 m!238223))

(assert (=> b!210955 m!238225))

(declare-fun m!238237 () Bool)

(assert (=> bm!19931 m!238237))

(assert (=> b!210854 d!57875))

(declare-fun b!210999 () Bool)

(declare-fun e!137364 () Bool)

(declare-fun call!19953 () Bool)

(assert (=> b!210999 (= e!137364 (not call!19953))))

(declare-fun call!19955 () ListLongMap!3049)

(declare-fun call!19954 () ListLongMap!3049)

(declare-fun c!35624 () Bool)

(declare-fun call!19949 () ListLongMap!3049)

(declare-fun call!19951 () ListLongMap!3049)

(declare-fun bm!19946 () Bool)

(declare-fun c!35628 () Bool)

(assert (=> bm!19946 (= call!19951 (+!564 (ite c!35624 call!19949 (ite c!35628 call!19955 call!19954)) (ite (or c!35624 c!35628) (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19947 () Bool)

(declare-fun lt!108343 () ListLongMap!3049)

(assert (=> bm!19947 (= call!19953 (contains!1379 lt!108343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19948 () Bool)

(declare-fun call!19950 () Bool)

(assert (=> bm!19948 (= call!19950 (contains!1379 lt!108343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211000 () Bool)

(declare-fun e!137361 () ListLongMap!3049)

(declare-fun e!137357 () ListLongMap!3049)

(assert (=> b!211000 (= e!137361 e!137357)))

(assert (=> b!211000 (= c!35628 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211001 () Bool)

(declare-fun res!103018 () Bool)

(declare-fun e!137356 () Bool)

(assert (=> b!211001 (=> (not res!103018) (not e!137356))))

(assert (=> b!211001 (= res!103018 e!137364)))

(declare-fun c!35629 () Bool)

(assert (=> b!211001 (= c!35629 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211002 () Bool)

(declare-fun e!137360 () Bool)

(assert (=> b!211002 (= e!137356 e!137360)))

(declare-fun c!35627 () Bool)

(assert (=> b!211002 (= c!35627 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211003 () Bool)

(assert (=> b!211003 (= e!137360 (not call!19950))))

(declare-fun b!211004 () Bool)

(declare-fun call!19952 () ListLongMap!3049)

(assert (=> b!211004 (= e!137357 call!19952)))

(declare-fun b!211005 () Bool)

(declare-fun e!137366 () Unit!6372)

(declare-fun Unit!6376 () Unit!6372)

(assert (=> b!211005 (= e!137366 Unit!6376)))

(declare-fun b!211006 () Bool)

(declare-fun lt!108327 () Unit!6372)

(assert (=> b!211006 (= e!137366 lt!108327)))

(declare-fun lt!108334 () ListLongMap!3049)

(assert (=> b!211006 (= lt!108334 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108328 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108339 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108339 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108332 () Unit!6372)

(declare-fun addStillContains!169 (ListLongMap!3049 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6372)

(assert (=> b!211006 (= lt!108332 (addStillContains!169 lt!108334 lt!108328 zeroValue!615 lt!108339))))

(assert (=> b!211006 (contains!1379 (+!564 lt!108334 (tuple2!4147 lt!108328 zeroValue!615)) lt!108339)))

(declare-fun lt!108342 () Unit!6372)

(assert (=> b!211006 (= lt!108342 lt!108332)))

(declare-fun lt!108323 () ListLongMap!3049)

(assert (=> b!211006 (= lt!108323 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108344 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108336 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108336 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108330 () Unit!6372)

(declare-fun addApplyDifferent!169 (ListLongMap!3049 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6372)

(assert (=> b!211006 (= lt!108330 (addApplyDifferent!169 lt!108323 lt!108344 minValue!615 lt!108336))))

(declare-fun apply!193 (ListLongMap!3049 (_ BitVec 64)) V!6881)

(assert (=> b!211006 (= (apply!193 (+!564 lt!108323 (tuple2!4147 lt!108344 minValue!615)) lt!108336) (apply!193 lt!108323 lt!108336))))

(declare-fun lt!108325 () Unit!6372)

(assert (=> b!211006 (= lt!108325 lt!108330)))

(declare-fun lt!108340 () ListLongMap!3049)

(assert (=> b!211006 (= lt!108340 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108326 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108341 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108341 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108338 () Unit!6372)

(assert (=> b!211006 (= lt!108338 (addApplyDifferent!169 lt!108340 lt!108326 zeroValue!615 lt!108341))))

(assert (=> b!211006 (= (apply!193 (+!564 lt!108340 (tuple2!4147 lt!108326 zeroValue!615)) lt!108341) (apply!193 lt!108340 lt!108341))))

(declare-fun lt!108329 () Unit!6372)

(assert (=> b!211006 (= lt!108329 lt!108338)))

(declare-fun lt!108331 () ListLongMap!3049)

(assert (=> b!211006 (= lt!108331 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108333 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108333 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108335 () (_ BitVec 64))

(assert (=> b!211006 (= lt!108335 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211006 (= lt!108327 (addApplyDifferent!169 lt!108331 lt!108333 minValue!615 lt!108335))))

(assert (=> b!211006 (= (apply!193 (+!564 lt!108331 (tuple2!4147 lt!108333 minValue!615)) lt!108335) (apply!193 lt!108331 lt!108335))))

(declare-fun bm!19950 () Bool)

(assert (=> bm!19950 (= call!19949 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211007 () Bool)

(assert (=> b!211007 (= e!137361 (+!564 call!19951 (tuple2!4147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211008 () Bool)

(declare-fun c!35625 () Bool)

(assert (=> b!211008 (= c!35625 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137359 () ListLongMap!3049)

(assert (=> b!211008 (= e!137357 e!137359)))

(declare-fun b!211009 () Bool)

(declare-fun e!137358 () Bool)

(assert (=> b!211009 (= e!137358 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211010 () Bool)

(declare-fun e!137365 () Bool)

(declare-fun e!137355 () Bool)

(assert (=> b!211010 (= e!137365 e!137355)))

(declare-fun res!103019 () Bool)

(assert (=> b!211010 (=> (not res!103019) (not e!137355))))

(assert (=> b!211010 (= res!103019 (contains!1379 lt!108343 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun bm!19951 () Bool)

(assert (=> bm!19951 (= call!19952 call!19951)))

(declare-fun b!211011 () Bool)

(declare-fun e!137367 () Bool)

(assert (=> b!211011 (= e!137360 e!137367)))

(declare-fun res!103017 () Bool)

(assert (=> b!211011 (= res!103017 call!19950)))

(assert (=> b!211011 (=> (not res!103017) (not e!137367))))

(declare-fun b!211012 () Bool)

(declare-fun e!137362 () Bool)

(assert (=> b!211012 (= e!137362 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57877 () Bool)

(assert (=> d!57877 e!137356))

(declare-fun res!103023 () Bool)

(assert (=> d!57877 (=> (not res!103023) (not e!137356))))

(assert (=> d!57877 (= res!103023 (or (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))))

(declare-fun lt!108324 () ListLongMap!3049)

(assert (=> d!57877 (= lt!108343 lt!108324)))

(declare-fun lt!108337 () Unit!6372)

(assert (=> d!57877 (= lt!108337 e!137366)))

(declare-fun c!35626 () Bool)

(assert (=> d!57877 (= c!35626 e!137358)))

(declare-fun res!103021 () Bool)

(assert (=> d!57877 (=> (not res!103021) (not e!137358))))

(assert (=> d!57877 (= res!103021 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57877 (= lt!108324 e!137361)))

(assert (=> d!57877 (= c!35624 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57877 (validMask!0 mask!1149)))

(assert (=> d!57877 (= (getCurrentListMap!1052 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108343)))

(declare-fun bm!19949 () Bool)

(assert (=> bm!19949 (= call!19955 call!19949)))

(declare-fun b!211013 () Bool)

(declare-fun e!137363 () Bool)

(assert (=> b!211013 (= e!137363 (= (apply!193 lt!108343 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211014 () Bool)

(assert (=> b!211014 (= e!137359 call!19952)))

(declare-fun b!211015 () Bool)

(declare-fun res!103022 () Bool)

(assert (=> b!211015 (=> (not res!103022) (not e!137356))))

(assert (=> b!211015 (= res!103022 e!137365)))

(declare-fun res!103024 () Bool)

(assert (=> b!211015 (=> res!103024 e!137365)))

(assert (=> b!211015 (= res!103024 (not e!137362))))

(declare-fun res!103025 () Bool)

(assert (=> b!211015 (=> (not res!103025) (not e!137362))))

(assert (=> b!211015 (= res!103025 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211016 () Bool)

(assert (=> b!211016 (= e!137367 (= (apply!193 lt!108343 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211017 () Bool)

(assert (=> b!211017 (= e!137364 e!137363)))

(declare-fun res!103020 () Bool)

(assert (=> b!211017 (= res!103020 call!19953)))

(assert (=> b!211017 (=> (not res!103020) (not e!137363))))

(declare-fun bm!19952 () Bool)

(assert (=> bm!19952 (= call!19954 call!19955)))

(declare-fun b!211018 () Bool)

(declare-fun get!2551 (ValueCell!2369 V!6881) V!6881)

(declare-fun dynLambda!527 (Int (_ BitVec 64)) V!6881)

(assert (=> b!211018 (= e!137355 (= (apply!193 lt!108343 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)) (get!2551 (select (arr!4766 lt!108209) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5092 lt!108209)))))

(assert (=> b!211018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211019 () Bool)

(assert (=> b!211019 (= e!137359 call!19954)))

(assert (= (and d!57877 c!35624) b!211007))

(assert (= (and d!57877 (not c!35624)) b!211000))

(assert (= (and b!211000 c!35628) b!211004))

(assert (= (and b!211000 (not c!35628)) b!211008))

(assert (= (and b!211008 c!35625) b!211014))

(assert (= (and b!211008 (not c!35625)) b!211019))

(assert (= (or b!211014 b!211019) bm!19952))

(assert (= (or b!211004 bm!19952) bm!19949))

(assert (= (or b!211004 b!211014) bm!19951))

(assert (= (or b!211007 bm!19949) bm!19950))

(assert (= (or b!211007 bm!19951) bm!19946))

(assert (= (and d!57877 res!103021) b!211009))

(assert (= (and d!57877 c!35626) b!211006))

(assert (= (and d!57877 (not c!35626)) b!211005))

(assert (= (and d!57877 res!103023) b!211015))

(assert (= (and b!211015 res!103025) b!211012))

(assert (= (and b!211015 (not res!103024)) b!211010))

(assert (= (and b!211010 res!103019) b!211018))

(assert (= (and b!211015 res!103022) b!211001))

(assert (= (and b!211001 c!35629) b!211017))

(assert (= (and b!211001 (not c!35629)) b!210999))

(assert (= (and b!211017 res!103020) b!211013))

(assert (= (or b!211017 b!210999) bm!19947))

(assert (= (and b!211001 res!103018) b!211002))

(assert (= (and b!211002 c!35627) b!211011))

(assert (= (and b!211002 (not c!35627)) b!211003))

(assert (= (and b!211011 res!103017) b!211016))

(assert (= (or b!211011 b!211003) bm!19948))

(declare-fun b_lambda!7617 () Bool)

(assert (=> (not b_lambda!7617) (not b!211018)))

(declare-fun t!7988 () Bool)

(declare-fun tb!2891 () Bool)

(assert (=> (and start!20996 (= defaultEntry!657 defaultEntry!657) t!7988) tb!2891))

(declare-fun result!4977 () Bool)

(assert (=> tb!2891 (= result!4977 tp_is_empty!5425)))

(assert (=> b!211018 t!7988))

(declare-fun b_and!12337 () Bool)

(assert (= b_and!12331 (and (=> t!7988 result!4977) b_and!12337)))

(declare-fun m!238239 () Bool)

(assert (=> b!211006 m!238239))

(declare-fun m!238241 () Bool)

(assert (=> b!211006 m!238241))

(declare-fun m!238243 () Bool)

(assert (=> b!211006 m!238243))

(declare-fun m!238245 () Bool)

(assert (=> b!211006 m!238245))

(declare-fun m!238247 () Bool)

(assert (=> b!211006 m!238247))

(declare-fun m!238249 () Bool)

(assert (=> b!211006 m!238249))

(declare-fun m!238251 () Bool)

(assert (=> b!211006 m!238251))

(assert (=> b!211006 m!238245))

(assert (=> b!211006 m!238243))

(declare-fun m!238253 () Bool)

(assert (=> b!211006 m!238253))

(declare-fun m!238255 () Bool)

(assert (=> b!211006 m!238255))

(declare-fun m!238257 () Bool)

(assert (=> b!211006 m!238257))

(assert (=> b!211006 m!238125))

(declare-fun m!238259 () Bool)

(assert (=> b!211006 m!238259))

(declare-fun m!238261 () Bool)

(assert (=> b!211006 m!238261))

(assert (=> b!211006 m!238223))

(assert (=> b!211006 m!238261))

(declare-fun m!238263 () Bool)

(assert (=> b!211006 m!238263))

(declare-fun m!238265 () Bool)

(assert (=> b!211006 m!238265))

(declare-fun m!238267 () Bool)

(assert (=> b!211006 m!238267))

(assert (=> b!211006 m!238249))

(declare-fun m!238269 () Bool)

(assert (=> b!211016 m!238269))

(declare-fun m!238271 () Bool)

(assert (=> bm!19946 m!238271))

(declare-fun m!238273 () Bool)

(assert (=> b!211007 m!238273))

(assert (=> b!211009 m!238223))

(assert (=> b!211009 m!238223))

(assert (=> b!211009 m!238225))

(assert (=> b!211012 m!238223))

(assert (=> b!211012 m!238223))

(assert (=> b!211012 m!238225))

(assert (=> b!211010 m!238223))

(assert (=> b!211010 m!238223))

(declare-fun m!238275 () Bool)

(assert (=> b!211010 m!238275))

(assert (=> bm!19950 m!238125))

(assert (=> d!57877 m!238137))

(declare-fun m!238277 () Bool)

(assert (=> bm!19947 m!238277))

(declare-fun m!238279 () Bool)

(assert (=> b!211013 m!238279))

(declare-fun m!238281 () Bool)

(assert (=> bm!19948 m!238281))

(declare-fun m!238283 () Bool)

(assert (=> b!211018 m!238283))

(assert (=> b!211018 m!238223))

(assert (=> b!211018 m!238283))

(declare-fun m!238285 () Bool)

(assert (=> b!211018 m!238285))

(declare-fun m!238287 () Bool)

(assert (=> b!211018 m!238287))

(assert (=> b!211018 m!238223))

(declare-fun m!238289 () Bool)

(assert (=> b!211018 m!238289))

(assert (=> b!211018 m!238285))

(assert (=> b!210853 d!57877))

(declare-fun d!57879 () Bool)

(declare-fun e!137368 () Bool)

(assert (=> d!57879 e!137368))

(declare-fun res!103027 () Bool)

(assert (=> d!57879 (=> (not res!103027) (not e!137368))))

(declare-fun lt!108348 () ListLongMap!3049)

(assert (=> d!57879 (= res!103027 (contains!1379 lt!108348 (_1!2084 (tuple2!4147 k0!843 v!520))))))

(declare-fun lt!108346 () List!3054)

(assert (=> d!57879 (= lt!108348 (ListLongMap!3050 lt!108346))))

(declare-fun lt!108347 () Unit!6372)

(declare-fun lt!108345 () Unit!6372)

(assert (=> d!57879 (= lt!108347 lt!108345)))

(assert (=> d!57879 (= (getValueByKey!249 lt!108346 (_1!2084 (tuple2!4147 k0!843 v!520))) (Some!254 (_2!2084 (tuple2!4147 k0!843 v!520))))))

(assert (=> d!57879 (= lt!108345 (lemmaContainsTupThenGetReturnValue!139 lt!108346 (_1!2084 (tuple2!4147 k0!843 v!520)) (_2!2084 (tuple2!4147 k0!843 v!520))))))

(assert (=> d!57879 (= lt!108346 (insertStrictlySorted!142 (toList!1540 lt!108215) (_1!2084 (tuple2!4147 k0!843 v!520)) (_2!2084 (tuple2!4147 k0!843 v!520))))))

(assert (=> d!57879 (= (+!564 lt!108215 (tuple2!4147 k0!843 v!520)) lt!108348)))

(declare-fun b!211022 () Bool)

(declare-fun res!103026 () Bool)

(assert (=> b!211022 (=> (not res!103026) (not e!137368))))

(assert (=> b!211022 (= res!103026 (= (getValueByKey!249 (toList!1540 lt!108348) (_1!2084 (tuple2!4147 k0!843 v!520))) (Some!254 (_2!2084 (tuple2!4147 k0!843 v!520)))))))

(declare-fun b!211023 () Bool)

(assert (=> b!211023 (= e!137368 (contains!1380 (toList!1540 lt!108348) (tuple2!4147 k0!843 v!520)))))

(assert (= (and d!57879 res!103027) b!211022))

(assert (= (and b!211022 res!103026) b!211023))

(declare-fun m!238291 () Bool)

(assert (=> d!57879 m!238291))

(declare-fun m!238293 () Bool)

(assert (=> d!57879 m!238293))

(declare-fun m!238295 () Bool)

(assert (=> d!57879 m!238295))

(declare-fun m!238297 () Bool)

(assert (=> d!57879 m!238297))

(declare-fun m!238299 () Bool)

(assert (=> b!211022 m!238299))

(declare-fun m!238301 () Bool)

(assert (=> b!211023 m!238301))

(assert (=> b!210853 d!57879))

(declare-fun b!211048 () Bool)

(declare-fun e!137389 () Bool)

(declare-fun e!137385 () Bool)

(assert (=> b!211048 (= e!137389 e!137385)))

(assert (=> b!211048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun res!103037 () Bool)

(declare-fun lt!108365 () ListLongMap!3049)

(assert (=> b!211048 (= res!103037 (contains!1379 lt!108365 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211048 (=> (not res!103037) (not e!137385))))

(declare-fun b!211049 () Bool)

(declare-fun e!137386 () Bool)

(assert (=> b!211049 (= e!137386 e!137389)))

(declare-fun c!35640 () Bool)

(declare-fun e!137387 () Bool)

(assert (=> b!211049 (= c!35640 e!137387)))

(declare-fun res!103039 () Bool)

(assert (=> b!211049 (=> (not res!103039) (not e!137387))))

(assert (=> b!211049 (= res!103039 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211051 () Bool)

(assert (=> b!211051 (= e!137387 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211051 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211052 () Bool)

(declare-fun e!137384 () Bool)

(declare-fun isEmpty!498 (ListLongMap!3049) Bool)

(assert (=> b!211052 (= e!137384 (isEmpty!498 lt!108365))))

(declare-fun b!211053 () Bool)

(assert (=> b!211053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> b!211053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5092 _values!649)))))

(assert (=> b!211053 (= e!137385 (= (apply!193 lt!108365 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)) (get!2551 (select (arr!4766 _values!649) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!19958 () ListLongMap!3049)

(declare-fun bm!19955 () Bool)

(assert (=> bm!19955 (= call!19958 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211054 () Bool)

(assert (=> b!211054 (= e!137384 (= lt!108365 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211055 () Bool)

(declare-fun e!137388 () ListLongMap!3049)

(assert (=> b!211055 (= e!137388 (ListLongMap!3050 Nil!3051))))

(declare-fun b!211056 () Bool)

(assert (=> b!211056 (= e!137389 e!137384)))

(declare-fun c!35638 () Bool)

(assert (=> b!211056 (= c!35638 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211057 () Bool)

(declare-fun e!137383 () ListLongMap!3049)

(assert (=> b!211057 (= e!137383 call!19958)))

(declare-fun b!211058 () Bool)

(declare-fun lt!108364 () Unit!6372)

(declare-fun lt!108366 () Unit!6372)

(assert (=> b!211058 (= lt!108364 lt!108366)))

(declare-fun lt!108369 () V!6881)

(declare-fun lt!108368 () ListLongMap!3049)

(declare-fun lt!108367 () (_ BitVec 64))

(declare-fun lt!108363 () (_ BitVec 64))

(assert (=> b!211058 (not (contains!1379 (+!564 lt!108368 (tuple2!4147 lt!108367 lt!108369)) lt!108363))))

(declare-fun addStillNotContains!103 (ListLongMap!3049 (_ BitVec 64) V!6881 (_ BitVec 64)) Unit!6372)

(assert (=> b!211058 (= lt!108366 (addStillNotContains!103 lt!108368 lt!108367 lt!108369 lt!108363))))

(assert (=> b!211058 (= lt!108363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211058 (= lt!108369 (get!2551 (select (arr!4766 _values!649) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211058 (= lt!108367 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211058 (= lt!108368 call!19958)))

(assert (=> b!211058 (= e!137383 (+!564 call!19958 (tuple2!4147 (select (arr!4765 _keys!825) #b00000000000000000000000000000000) (get!2551 (select (arr!4766 _values!649) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211059 () Bool)

(assert (=> b!211059 (= e!137388 e!137383)))

(declare-fun c!35639 () Bool)

(assert (=> b!211059 (= c!35639 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57881 () Bool)

(assert (=> d!57881 e!137386))

(declare-fun res!103038 () Bool)

(assert (=> d!57881 (=> (not res!103038) (not e!137386))))

(assert (=> d!57881 (= res!103038 (not (contains!1379 lt!108365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57881 (= lt!108365 e!137388)))

(declare-fun c!35641 () Bool)

(assert (=> d!57881 (= c!35641 (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57881 (validMask!0 mask!1149)))

(assert (=> d!57881 (= (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108365)))

(declare-fun b!211050 () Bool)

(declare-fun res!103036 () Bool)

(assert (=> b!211050 (=> (not res!103036) (not e!137386))))

(assert (=> b!211050 (= res!103036 (not (contains!1379 lt!108365 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57881 c!35641) b!211055))

(assert (= (and d!57881 (not c!35641)) b!211059))

(assert (= (and b!211059 c!35639) b!211058))

(assert (= (and b!211059 (not c!35639)) b!211057))

(assert (= (or b!211058 b!211057) bm!19955))

(assert (= (and d!57881 res!103038) b!211050))

(assert (= (and b!211050 res!103036) b!211049))

(assert (= (and b!211049 res!103039) b!211051))

(assert (= (and b!211049 c!35640) b!211048))

(assert (= (and b!211049 (not c!35640)) b!211056))

(assert (= (and b!211048 res!103037) b!211053))

(assert (= (and b!211056 c!35638) b!211054))

(assert (= (and b!211056 (not c!35638)) b!211052))

(declare-fun b_lambda!7619 () Bool)

(assert (=> (not b_lambda!7619) (not b!211053)))

(assert (=> b!211053 t!7988))

(declare-fun b_and!12339 () Bool)

(assert (= b_and!12337 (and (=> t!7988 result!4977) b_and!12339)))

(declare-fun b_lambda!7621 () Bool)

(assert (=> (not b_lambda!7621) (not b!211058)))

(assert (=> b!211058 t!7988))

(declare-fun b_and!12341 () Bool)

(assert (= b_and!12339 (and (=> t!7988 result!4977) b_and!12341)))

(assert (=> b!211048 m!238223))

(assert (=> b!211048 m!238223))

(declare-fun m!238303 () Bool)

(assert (=> b!211048 m!238303))

(declare-fun m!238305 () Bool)

(assert (=> b!211050 m!238305))

(declare-fun m!238307 () Bool)

(assert (=> b!211052 m!238307))

(declare-fun m!238309 () Bool)

(assert (=> b!211054 m!238309))

(assert (=> bm!19955 m!238309))

(assert (=> b!211051 m!238223))

(assert (=> b!211051 m!238223))

(assert (=> b!211051 m!238225))

(declare-fun m!238311 () Bool)

(assert (=> b!211058 m!238311))

(assert (=> b!211058 m!238285))

(declare-fun m!238313 () Bool)

(assert (=> b!211058 m!238313))

(declare-fun m!238315 () Bool)

(assert (=> b!211058 m!238315))

(assert (=> b!211058 m!238311))

(assert (=> b!211058 m!238285))

(assert (=> b!211058 m!238223))

(declare-fun m!238317 () Bool)

(assert (=> b!211058 m!238317))

(declare-fun m!238319 () Bool)

(assert (=> b!211058 m!238319))

(assert (=> b!211058 m!238317))

(declare-fun m!238321 () Bool)

(assert (=> b!211058 m!238321))

(assert (=> b!211059 m!238223))

(assert (=> b!211059 m!238223))

(assert (=> b!211059 m!238225))

(declare-fun m!238323 () Bool)

(assert (=> d!57881 m!238323))

(assert (=> d!57881 m!238137))

(assert (=> b!211053 m!238311))

(assert (=> b!211053 m!238285))

(assert (=> b!211053 m!238313))

(assert (=> b!211053 m!238311))

(assert (=> b!211053 m!238285))

(assert (=> b!211053 m!238223))

(assert (=> b!211053 m!238223))

(declare-fun m!238325 () Bool)

(assert (=> b!211053 m!238325))

(assert (=> b!210853 d!57881))

(declare-fun b!211066 () Bool)

(declare-fun e!137394 () Bool)

(declare-fun e!137395 () Bool)

(assert (=> b!211066 (= e!137394 e!137395)))

(declare-fun c!35644 () Bool)

(assert (=> b!211066 (= c!35644 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!211067 () Bool)

(declare-fun call!19964 () ListLongMap!3049)

(declare-fun call!19963 () ListLongMap!3049)

(assert (=> b!211067 (= e!137395 (= call!19964 (+!564 call!19963 (tuple2!4147 k0!843 v!520))))))

(declare-fun bm!19960 () Bool)

(assert (=> bm!19960 (= call!19964 (getCurrentListMapNoExtraKeys!489 _keys!825 (array!10042 (store (arr!4766 _values!649) i!601 (ValueCellFull!2369 v!520)) (size!5092 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211068 () Bool)

(assert (=> b!211068 (= e!137395 (= call!19964 call!19963))))

(declare-fun bm!19961 () Bool)

(assert (=> bm!19961 (= call!19963 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!57883 () Bool)

(assert (=> d!57883 e!137394))

(declare-fun res!103042 () Bool)

(assert (=> d!57883 (=> (not res!103042) (not e!137394))))

(assert (=> d!57883 (= res!103042 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5092 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5092 _values!649))))))))

(declare-fun lt!108372 () Unit!6372)

(declare-fun choose!1084 (array!10039 array!10041 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) (_ BitVec 64) V!6881 (_ BitVec 32) Int) Unit!6372)

(assert (=> d!57883 (= lt!108372 (choose!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57883 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!213 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108372)))

(assert (= (and d!57883 res!103042) b!211066))

(assert (= (and b!211066 c!35644) b!211067))

(assert (= (and b!211066 (not c!35644)) b!211068))

(assert (= (or b!211067 b!211068) bm!19960))

(assert (= (or b!211067 b!211068) bm!19961))

(declare-fun m!238327 () Bool)

(assert (=> b!211067 m!238327))

(assert (=> bm!19960 m!238123))

(declare-fun m!238329 () Bool)

(assert (=> bm!19960 m!238329))

(assert (=> bm!19961 m!238131))

(declare-fun m!238331 () Bool)

(assert (=> d!57883 m!238331))

(assert (=> b!210853 d!57883))

(declare-fun b!211069 () Bool)

(declare-fun e!137402 () Bool)

(declare-fun e!137398 () Bool)

(assert (=> b!211069 (= e!137402 e!137398)))

(assert (=> b!211069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun res!103044 () Bool)

(declare-fun lt!108375 () ListLongMap!3049)

(assert (=> b!211069 (= res!103044 (contains!1379 lt!108375 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211069 (=> (not res!103044) (not e!137398))))

(declare-fun b!211070 () Bool)

(declare-fun e!137399 () Bool)

(assert (=> b!211070 (= e!137399 e!137402)))

(declare-fun c!35647 () Bool)

(declare-fun e!137400 () Bool)

(assert (=> b!211070 (= c!35647 e!137400)))

(declare-fun res!103046 () Bool)

(assert (=> b!211070 (=> (not res!103046) (not e!137400))))

(assert (=> b!211070 (= res!103046 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211072 () Bool)

(assert (=> b!211072 (= e!137400 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211072 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211073 () Bool)

(declare-fun e!137397 () Bool)

(assert (=> b!211073 (= e!137397 (isEmpty!498 lt!108375))))

(declare-fun b!211074 () Bool)

(assert (=> b!211074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> b!211074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5092 lt!108209)))))

(assert (=> b!211074 (= e!137398 (= (apply!193 lt!108375 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)) (get!2551 (select (arr!4766 lt!108209) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19962 () Bool)

(declare-fun call!19965 () ListLongMap!3049)

(assert (=> bm!19962 (= call!19965 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211075 () Bool)

(assert (=> b!211075 (= e!137397 (= lt!108375 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211076 () Bool)

(declare-fun e!137401 () ListLongMap!3049)

(assert (=> b!211076 (= e!137401 (ListLongMap!3050 Nil!3051))))

(declare-fun b!211077 () Bool)

(assert (=> b!211077 (= e!137402 e!137397)))

(declare-fun c!35645 () Bool)

(assert (=> b!211077 (= c!35645 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211078 () Bool)

(declare-fun e!137396 () ListLongMap!3049)

(assert (=> b!211078 (= e!137396 call!19965)))

(declare-fun b!211079 () Bool)

(declare-fun lt!108374 () Unit!6372)

(declare-fun lt!108376 () Unit!6372)

(assert (=> b!211079 (= lt!108374 lt!108376)))

(declare-fun lt!108379 () V!6881)

(declare-fun lt!108377 () (_ BitVec 64))

(declare-fun lt!108378 () ListLongMap!3049)

(declare-fun lt!108373 () (_ BitVec 64))

(assert (=> b!211079 (not (contains!1379 (+!564 lt!108378 (tuple2!4147 lt!108377 lt!108379)) lt!108373))))

(assert (=> b!211079 (= lt!108376 (addStillNotContains!103 lt!108378 lt!108377 lt!108379 lt!108373))))

(assert (=> b!211079 (= lt!108373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211079 (= lt!108379 (get!2551 (select (arr!4766 lt!108209) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211079 (= lt!108377 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211079 (= lt!108378 call!19965)))

(assert (=> b!211079 (= e!137396 (+!564 call!19965 (tuple2!4147 (select (arr!4765 _keys!825) #b00000000000000000000000000000000) (get!2551 (select (arr!4766 lt!108209) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211080 () Bool)

(assert (=> b!211080 (= e!137401 e!137396)))

(declare-fun c!35646 () Bool)

(assert (=> b!211080 (= c!35646 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57885 () Bool)

(assert (=> d!57885 e!137399))

(declare-fun res!103045 () Bool)

(assert (=> d!57885 (=> (not res!103045) (not e!137399))))

(assert (=> d!57885 (= res!103045 (not (contains!1379 lt!108375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57885 (= lt!108375 e!137401)))

(declare-fun c!35648 () Bool)

(assert (=> d!57885 (= c!35648 (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57885 (validMask!0 mask!1149)))

(assert (=> d!57885 (= (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108209 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108375)))

(declare-fun b!211071 () Bool)

(declare-fun res!103043 () Bool)

(assert (=> b!211071 (=> (not res!103043) (not e!137399))))

(assert (=> b!211071 (= res!103043 (not (contains!1379 lt!108375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57885 c!35648) b!211076))

(assert (= (and d!57885 (not c!35648)) b!211080))

(assert (= (and b!211080 c!35646) b!211079))

(assert (= (and b!211080 (not c!35646)) b!211078))

(assert (= (or b!211079 b!211078) bm!19962))

(assert (= (and d!57885 res!103045) b!211071))

(assert (= (and b!211071 res!103043) b!211070))

(assert (= (and b!211070 res!103046) b!211072))

(assert (= (and b!211070 c!35647) b!211069))

(assert (= (and b!211070 (not c!35647)) b!211077))

(assert (= (and b!211069 res!103044) b!211074))

(assert (= (and b!211077 c!35645) b!211075))

(assert (= (and b!211077 (not c!35645)) b!211073))

(declare-fun b_lambda!7623 () Bool)

(assert (=> (not b_lambda!7623) (not b!211074)))

(assert (=> b!211074 t!7988))

(declare-fun b_and!12343 () Bool)

(assert (= b_and!12341 (and (=> t!7988 result!4977) b_and!12343)))

(declare-fun b_lambda!7625 () Bool)

(assert (=> (not b_lambda!7625) (not b!211079)))

(assert (=> b!211079 t!7988))

(declare-fun b_and!12345 () Bool)

(assert (= b_and!12343 (and (=> t!7988 result!4977) b_and!12345)))

(assert (=> b!211069 m!238223))

(assert (=> b!211069 m!238223))

(declare-fun m!238333 () Bool)

(assert (=> b!211069 m!238333))

(declare-fun m!238335 () Bool)

(assert (=> b!211071 m!238335))

(declare-fun m!238337 () Bool)

(assert (=> b!211073 m!238337))

(declare-fun m!238339 () Bool)

(assert (=> b!211075 m!238339))

(assert (=> bm!19962 m!238339))

(assert (=> b!211072 m!238223))

(assert (=> b!211072 m!238223))

(assert (=> b!211072 m!238225))

(assert (=> b!211079 m!238283))

(assert (=> b!211079 m!238285))

(assert (=> b!211079 m!238287))

(declare-fun m!238341 () Bool)

(assert (=> b!211079 m!238341))

(assert (=> b!211079 m!238283))

(assert (=> b!211079 m!238285))

(assert (=> b!211079 m!238223))

(declare-fun m!238343 () Bool)

(assert (=> b!211079 m!238343))

(declare-fun m!238345 () Bool)

(assert (=> b!211079 m!238345))

(assert (=> b!211079 m!238343))

(declare-fun m!238347 () Bool)

(assert (=> b!211079 m!238347))

(assert (=> b!211080 m!238223))

(assert (=> b!211080 m!238223))

(assert (=> b!211080 m!238225))

(declare-fun m!238349 () Bool)

(assert (=> d!57885 m!238349))

(assert (=> d!57885 m!238137))

(assert (=> b!211074 m!238283))

(assert (=> b!211074 m!238285))

(assert (=> b!211074 m!238287))

(assert (=> b!211074 m!238283))

(assert (=> b!211074 m!238285))

(assert (=> b!211074 m!238223))

(assert (=> b!211074 m!238223))

(declare-fun m!238351 () Bool)

(assert (=> b!211074 m!238351))

(assert (=> b!210853 d!57885))

(declare-fun b!211081 () Bool)

(declare-fun e!137412 () Bool)

(declare-fun call!19970 () Bool)

(assert (=> b!211081 (= e!137412 (not call!19970))))

(declare-fun c!35649 () Bool)

(declare-fun call!19972 () ListLongMap!3049)

(declare-fun c!35653 () Bool)

(declare-fun call!19971 () ListLongMap!3049)

(declare-fun bm!19963 () Bool)

(declare-fun call!19968 () ListLongMap!3049)

(declare-fun call!19966 () ListLongMap!3049)

(assert (=> bm!19963 (= call!19968 (+!564 (ite c!35649 call!19966 (ite c!35653 call!19972 call!19971)) (ite (or c!35649 c!35653) (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19964 () Bool)

(declare-fun lt!108400 () ListLongMap!3049)

(assert (=> bm!19964 (= call!19970 (contains!1379 lt!108400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19965 () Bool)

(declare-fun call!19967 () Bool)

(assert (=> bm!19965 (= call!19967 (contains!1379 lt!108400 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211082 () Bool)

(declare-fun e!137409 () ListLongMap!3049)

(declare-fun e!137405 () ListLongMap!3049)

(assert (=> b!211082 (= e!137409 e!137405)))

(assert (=> b!211082 (= c!35653 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211083 () Bool)

(declare-fun res!103048 () Bool)

(declare-fun e!137404 () Bool)

(assert (=> b!211083 (=> (not res!103048) (not e!137404))))

(assert (=> b!211083 (= res!103048 e!137412)))

(declare-fun c!35654 () Bool)

(assert (=> b!211083 (= c!35654 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211084 () Bool)

(declare-fun e!137408 () Bool)

(assert (=> b!211084 (= e!137404 e!137408)))

(declare-fun c!35652 () Bool)

(assert (=> b!211084 (= c!35652 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211085 () Bool)

(assert (=> b!211085 (= e!137408 (not call!19967))))

(declare-fun b!211086 () Bool)

(declare-fun call!19969 () ListLongMap!3049)

(assert (=> b!211086 (= e!137405 call!19969)))

(declare-fun b!211087 () Bool)

(declare-fun e!137414 () Unit!6372)

(declare-fun Unit!6377 () Unit!6372)

(assert (=> b!211087 (= e!137414 Unit!6377)))

(declare-fun b!211088 () Bool)

(declare-fun lt!108384 () Unit!6372)

(assert (=> b!211088 (= e!137414 lt!108384)))

(declare-fun lt!108391 () ListLongMap!3049)

(assert (=> b!211088 (= lt!108391 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108385 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108396 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108396 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108389 () Unit!6372)

(assert (=> b!211088 (= lt!108389 (addStillContains!169 lt!108391 lt!108385 zeroValue!615 lt!108396))))

(assert (=> b!211088 (contains!1379 (+!564 lt!108391 (tuple2!4147 lt!108385 zeroValue!615)) lt!108396)))

(declare-fun lt!108399 () Unit!6372)

(assert (=> b!211088 (= lt!108399 lt!108389)))

(declare-fun lt!108380 () ListLongMap!3049)

(assert (=> b!211088 (= lt!108380 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108401 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108401 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108393 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108393 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108387 () Unit!6372)

(assert (=> b!211088 (= lt!108387 (addApplyDifferent!169 lt!108380 lt!108401 minValue!615 lt!108393))))

(assert (=> b!211088 (= (apply!193 (+!564 lt!108380 (tuple2!4147 lt!108401 minValue!615)) lt!108393) (apply!193 lt!108380 lt!108393))))

(declare-fun lt!108382 () Unit!6372)

(assert (=> b!211088 (= lt!108382 lt!108387)))

(declare-fun lt!108397 () ListLongMap!3049)

(assert (=> b!211088 (= lt!108397 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108383 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108398 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108398 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108395 () Unit!6372)

(assert (=> b!211088 (= lt!108395 (addApplyDifferent!169 lt!108397 lt!108383 zeroValue!615 lt!108398))))

(assert (=> b!211088 (= (apply!193 (+!564 lt!108397 (tuple2!4147 lt!108383 zeroValue!615)) lt!108398) (apply!193 lt!108397 lt!108398))))

(declare-fun lt!108386 () Unit!6372)

(assert (=> b!211088 (= lt!108386 lt!108395)))

(declare-fun lt!108388 () ListLongMap!3049)

(assert (=> b!211088 (= lt!108388 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108390 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108390 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108392 () (_ BitVec 64))

(assert (=> b!211088 (= lt!108392 (select (arr!4765 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211088 (= lt!108384 (addApplyDifferent!169 lt!108388 lt!108390 minValue!615 lt!108392))))

(assert (=> b!211088 (= (apply!193 (+!564 lt!108388 (tuple2!4147 lt!108390 minValue!615)) lt!108392) (apply!193 lt!108388 lt!108392))))

(declare-fun bm!19967 () Bool)

(assert (=> bm!19967 (= call!19966 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211089 () Bool)

(assert (=> b!211089 (= e!137409 (+!564 call!19968 (tuple2!4147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211090 () Bool)

(declare-fun c!35650 () Bool)

(assert (=> b!211090 (= c!35650 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137407 () ListLongMap!3049)

(assert (=> b!211090 (= e!137405 e!137407)))

(declare-fun b!211091 () Bool)

(declare-fun e!137406 () Bool)

(assert (=> b!211091 (= e!137406 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211092 () Bool)

(declare-fun e!137413 () Bool)

(declare-fun e!137403 () Bool)

(assert (=> b!211092 (= e!137413 e!137403)))

(declare-fun res!103049 () Bool)

(assert (=> b!211092 (=> (not res!103049) (not e!137403))))

(assert (=> b!211092 (= res!103049 (contains!1379 lt!108400 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211092 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun bm!19968 () Bool)

(assert (=> bm!19968 (= call!19969 call!19968)))

(declare-fun b!211093 () Bool)

(declare-fun e!137415 () Bool)

(assert (=> b!211093 (= e!137408 e!137415)))

(declare-fun res!103047 () Bool)

(assert (=> b!211093 (= res!103047 call!19967)))

(assert (=> b!211093 (=> (not res!103047) (not e!137415))))

(declare-fun b!211094 () Bool)

(declare-fun e!137410 () Bool)

(assert (=> b!211094 (= e!137410 (validKeyInArray!0 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57887 () Bool)

(assert (=> d!57887 e!137404))

(declare-fun res!103053 () Bool)

(assert (=> d!57887 (=> (not res!103053) (not e!137404))))

(assert (=> d!57887 (= res!103053 (or (bvsge #b00000000000000000000000000000000 (size!5091 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))))

(declare-fun lt!108381 () ListLongMap!3049)

(assert (=> d!57887 (= lt!108400 lt!108381)))

(declare-fun lt!108394 () Unit!6372)

(assert (=> d!57887 (= lt!108394 e!137414)))

(declare-fun c!35651 () Bool)

(assert (=> d!57887 (= c!35651 e!137406)))

(declare-fun res!103051 () Bool)

(assert (=> d!57887 (=> (not res!103051) (not e!137406))))

(assert (=> d!57887 (= res!103051 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(assert (=> d!57887 (= lt!108381 e!137409)))

(assert (=> d!57887 (= c!35649 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57887 (validMask!0 mask!1149)))

(assert (=> d!57887 (= (getCurrentListMap!1052 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108400)))

(declare-fun bm!19966 () Bool)

(assert (=> bm!19966 (= call!19972 call!19966)))

(declare-fun b!211095 () Bool)

(declare-fun e!137411 () Bool)

(assert (=> b!211095 (= e!137411 (= (apply!193 lt!108400 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211096 () Bool)

(assert (=> b!211096 (= e!137407 call!19969)))

(declare-fun b!211097 () Bool)

(declare-fun res!103052 () Bool)

(assert (=> b!211097 (=> (not res!103052) (not e!137404))))

(assert (=> b!211097 (= res!103052 e!137413)))

(declare-fun res!103054 () Bool)

(assert (=> b!211097 (=> res!103054 e!137413)))

(assert (=> b!211097 (= res!103054 (not e!137410))))

(declare-fun res!103055 () Bool)

(assert (=> b!211097 (=> (not res!103055) (not e!137410))))

(assert (=> b!211097 (= res!103055 (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211098 () Bool)

(assert (=> b!211098 (= e!137415 (= (apply!193 lt!108400 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211099 () Bool)

(assert (=> b!211099 (= e!137412 e!137411)))

(declare-fun res!103050 () Bool)

(assert (=> b!211099 (= res!103050 call!19970)))

(assert (=> b!211099 (=> (not res!103050) (not e!137411))))

(declare-fun bm!19969 () Bool)

(assert (=> bm!19969 (= call!19971 call!19972)))

(declare-fun b!211100 () Bool)

(assert (=> b!211100 (= e!137403 (= (apply!193 lt!108400 (select (arr!4765 _keys!825) #b00000000000000000000000000000000)) (get!2551 (select (arr!4766 _values!649) #b00000000000000000000000000000000) (dynLambda!527 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5092 _values!649)))))

(assert (=> b!211100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5091 _keys!825)))))

(declare-fun b!211101 () Bool)

(assert (=> b!211101 (= e!137407 call!19971)))

(assert (= (and d!57887 c!35649) b!211089))

(assert (= (and d!57887 (not c!35649)) b!211082))

(assert (= (and b!211082 c!35653) b!211086))

(assert (= (and b!211082 (not c!35653)) b!211090))

(assert (= (and b!211090 c!35650) b!211096))

(assert (= (and b!211090 (not c!35650)) b!211101))

(assert (= (or b!211096 b!211101) bm!19969))

(assert (= (or b!211086 bm!19969) bm!19966))

(assert (= (or b!211086 b!211096) bm!19968))

(assert (= (or b!211089 bm!19966) bm!19967))

(assert (= (or b!211089 bm!19968) bm!19963))

(assert (= (and d!57887 res!103051) b!211091))

(assert (= (and d!57887 c!35651) b!211088))

(assert (= (and d!57887 (not c!35651)) b!211087))

(assert (= (and d!57887 res!103053) b!211097))

(assert (= (and b!211097 res!103055) b!211094))

(assert (= (and b!211097 (not res!103054)) b!211092))

(assert (= (and b!211092 res!103049) b!211100))

(assert (= (and b!211097 res!103052) b!211083))

(assert (= (and b!211083 c!35654) b!211099))

(assert (= (and b!211083 (not c!35654)) b!211081))

(assert (= (and b!211099 res!103050) b!211095))

(assert (= (or b!211099 b!211081) bm!19964))

(assert (= (and b!211083 res!103048) b!211084))

(assert (= (and b!211084 c!35652) b!211093))

(assert (= (and b!211084 (not c!35652)) b!211085))

(assert (= (and b!211093 res!103047) b!211098))

(assert (= (or b!211093 b!211085) bm!19965))

(declare-fun b_lambda!7627 () Bool)

(assert (=> (not b_lambda!7627) (not b!211100)))

(assert (=> b!211100 t!7988))

(declare-fun b_and!12347 () Bool)

(assert (= b_and!12345 (and (=> t!7988 result!4977) b_and!12347)))

(declare-fun m!238353 () Bool)

(assert (=> b!211088 m!238353))

(declare-fun m!238355 () Bool)

(assert (=> b!211088 m!238355))

(declare-fun m!238357 () Bool)

(assert (=> b!211088 m!238357))

(declare-fun m!238359 () Bool)

(assert (=> b!211088 m!238359))

(declare-fun m!238361 () Bool)

(assert (=> b!211088 m!238361))

(declare-fun m!238363 () Bool)

(assert (=> b!211088 m!238363))

(declare-fun m!238365 () Bool)

(assert (=> b!211088 m!238365))

(assert (=> b!211088 m!238359))

(assert (=> b!211088 m!238357))

(declare-fun m!238367 () Bool)

(assert (=> b!211088 m!238367))

(declare-fun m!238369 () Bool)

(assert (=> b!211088 m!238369))

(declare-fun m!238371 () Bool)

(assert (=> b!211088 m!238371))

(assert (=> b!211088 m!238131))

(declare-fun m!238373 () Bool)

(assert (=> b!211088 m!238373))

(declare-fun m!238375 () Bool)

(assert (=> b!211088 m!238375))

(assert (=> b!211088 m!238223))

(assert (=> b!211088 m!238375))

(declare-fun m!238377 () Bool)

(assert (=> b!211088 m!238377))

(declare-fun m!238379 () Bool)

(assert (=> b!211088 m!238379))

(declare-fun m!238381 () Bool)

(assert (=> b!211088 m!238381))

(assert (=> b!211088 m!238363))

(declare-fun m!238383 () Bool)

(assert (=> b!211098 m!238383))

(declare-fun m!238385 () Bool)

(assert (=> bm!19963 m!238385))

(declare-fun m!238387 () Bool)

(assert (=> b!211089 m!238387))

(assert (=> b!211091 m!238223))

(assert (=> b!211091 m!238223))

(assert (=> b!211091 m!238225))

(assert (=> b!211094 m!238223))

(assert (=> b!211094 m!238223))

(assert (=> b!211094 m!238225))

(assert (=> b!211092 m!238223))

(assert (=> b!211092 m!238223))

(declare-fun m!238389 () Bool)

(assert (=> b!211092 m!238389))

(assert (=> bm!19967 m!238131))

(assert (=> d!57887 m!238137))

(declare-fun m!238391 () Bool)

(assert (=> bm!19964 m!238391))

(declare-fun m!238393 () Bool)

(assert (=> b!211095 m!238393))

(declare-fun m!238395 () Bool)

(assert (=> bm!19965 m!238395))

(assert (=> b!211100 m!238311))

(assert (=> b!211100 m!238223))

(assert (=> b!211100 m!238311))

(assert (=> b!211100 m!238285))

(assert (=> b!211100 m!238313))

(assert (=> b!211100 m!238223))

(declare-fun m!238397 () Bool)

(assert (=> b!211100 m!238397))

(assert (=> b!211100 m!238285))

(assert (=> b!210853 d!57887))

(declare-fun b!211109 () Bool)

(declare-fun e!137420 () Bool)

(assert (=> b!211109 (= e!137420 tp_is_empty!5425)))

(declare-fun b!211108 () Bool)

(declare-fun e!137421 () Bool)

(assert (=> b!211108 (= e!137421 tp_is_empty!5425)))

(declare-fun mapIsEmpty!9227 () Bool)

(declare-fun mapRes!9227 () Bool)

(assert (=> mapIsEmpty!9227 mapRes!9227))

(declare-fun condMapEmpty!9227 () Bool)

(declare-fun mapDefault!9227 () ValueCell!2369)

(assert (=> mapNonEmpty!9218 (= condMapEmpty!9227 (= mapRest!9218 ((as const (Array (_ BitVec 32) ValueCell!2369)) mapDefault!9227)))))

(assert (=> mapNonEmpty!9218 (= tp!19742 (and e!137420 mapRes!9227))))

(declare-fun mapNonEmpty!9227 () Bool)

(declare-fun tp!19757 () Bool)

(assert (=> mapNonEmpty!9227 (= mapRes!9227 (and tp!19757 e!137421))))

(declare-fun mapKey!9227 () (_ BitVec 32))

(declare-fun mapValue!9227 () ValueCell!2369)

(declare-fun mapRest!9227 () (Array (_ BitVec 32) ValueCell!2369))

(assert (=> mapNonEmpty!9227 (= mapRest!9218 (store mapRest!9227 mapKey!9227 mapValue!9227))))

(assert (= (and mapNonEmpty!9218 condMapEmpty!9227) mapIsEmpty!9227))

(assert (= (and mapNonEmpty!9218 (not condMapEmpty!9227)) mapNonEmpty!9227))

(assert (= (and mapNonEmpty!9227 ((_ is ValueCellFull!2369) mapValue!9227)) b!211108))

(assert (= (and mapNonEmpty!9218 ((_ is ValueCellFull!2369) mapDefault!9227)) b!211109))

(declare-fun m!238399 () Bool)

(assert (=> mapNonEmpty!9227 m!238399))

(declare-fun b_lambda!7629 () Bool)

(assert (= b_lambda!7625 (or (and start!20996 b_free!5563) b_lambda!7629)))

(declare-fun b_lambda!7631 () Bool)

(assert (= b_lambda!7623 (or (and start!20996 b_free!5563) b_lambda!7631)))

(declare-fun b_lambda!7633 () Bool)

(assert (= b_lambda!7617 (or (and start!20996 b_free!5563) b_lambda!7633)))

(declare-fun b_lambda!7635 () Bool)

(assert (= b_lambda!7627 (or (and start!20996 b_free!5563) b_lambda!7635)))

(declare-fun b_lambda!7637 () Bool)

(assert (= b_lambda!7619 (or (and start!20996 b_free!5563) b_lambda!7637)))

(declare-fun b_lambda!7639 () Bool)

(assert (= b_lambda!7621 (or (and start!20996 b_free!5563) b_lambda!7639)))

(check-sat (not b!211048) (not b_lambda!7639) (not d!57869) (not b!211092) (not bm!19931) (not b!211059) (not b!211023) (not b!210928) (not b!211094) (not b!211098) (not b!211088) (not b!211013) (not bm!19961) (not bm!19950) (not b!211075) (not b!211069) (not b!211010) (not bm!19948) (not b!211091) (not bm!19964) (not b!211050) (not bm!19947) (not b!211073) (not bm!19955) (not d!57885) (not b!210941) (not b!211079) (not bm!19963) (not b_lambda!7629) (not b!211089) (not d!57877) (not bm!19946) (not b!211072) (not b!210942) (not b!211071) (not b_lambda!7637) (not b!210953) (not b!211058) (not b_lambda!7631) (not bm!19965) (not bm!19962) (not b!210929) (not b!211100) (not b!211074) (not b_lambda!7635) (not b!211052) (not b!211009) (not b!211053) (not mapNonEmpty!9227) (not b!210955) (not d!57883) (not b_lambda!7633) (not b!211051) (not b!211067) (not b!211095) (not b!210943) (not b!211007) (not d!57879) (not b!211054) (not bm!19928) (not bm!19967) (not b_next!5563) (not b!211018) (not b!211006) (not d!57887) (not b!211022) b_and!12347 (not b!211016) tp_is_empty!5425 (not bm!19960) (not d!57881) (not b!211080) (not b!211012))
(check-sat b_and!12347 (not b_next!5563))
