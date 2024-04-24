; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21092 () Bool)

(assert start!21092)

(declare-fun b_free!5599 () Bool)

(declare-fun b_next!5599 () Bool)

(assert (=> start!21092 (= b_free!5599 (not b_next!5599))))

(declare-fun tp!19859 () Bool)

(declare-fun b_and!12443 () Bool)

(assert (=> start!21092 (= tp!19859 b_and!12443)))

(declare-fun b!212244 () Bool)

(declare-fun res!103760 () Bool)

(declare-fun e!138105 () Bool)

(assert (=> b!212244 (=> (not res!103760) (not e!138105))))

(declare-datatypes ((array!10123 0))(
  ( (array!10124 (arr!4805 (Array (_ BitVec 32) (_ BitVec 64))) (size!5130 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10123)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10123 (_ BitVec 32)) Bool)

(assert (=> b!212244 (= res!103760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212245 () Bool)

(declare-fun e!138104 () Bool)

(assert (=> b!212245 (= e!138105 (not e!138104))))

(declare-fun res!103755 () Bool)

(assert (=> b!212245 (=> res!103755 e!138104)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212245 (= res!103755 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6929 0))(
  ( (V!6930 (val!2775 Int)) )
))
(declare-datatypes ((tuple2!4144 0))(
  ( (tuple2!4145 (_1!2083 (_ BitVec 64)) (_2!2083 V!6929)) )
))
(declare-datatypes ((List!3026 0))(
  ( (Nil!3023) (Cons!3022 (h!3664 tuple2!4144) (t!7963 List!3026)) )
))
(declare-datatypes ((ListLongMap!3059 0))(
  ( (ListLongMap!3060 (toList!1545 List!3026)) )
))
(declare-fun lt!109392 () ListLongMap!3059)

(declare-datatypes ((ValueCell!2387 0))(
  ( (ValueCellFull!2387 (v!4774 V!6929)) (EmptyCell!2387) )
))
(declare-datatypes ((array!10125 0))(
  ( (array!10126 (arr!4806 (Array (_ BitVec 32) ValueCell!2387)) (size!5131 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10125)

(declare-fun zeroValue!615 () V!6929)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6929)

(declare-fun getCurrentListMap!1081 (array!10123 array!10125 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3059)

(assert (=> b!212245 (= lt!109392 (getCurrentListMap!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109388 () ListLongMap!3059)

(declare-fun lt!109391 () array!10125)

(assert (=> b!212245 (= lt!109388 (getCurrentListMap!1081 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109394 () ListLongMap!3059)

(declare-fun lt!109390 () ListLongMap!3059)

(assert (=> b!212245 (and (= lt!109394 lt!109390) (= lt!109390 lt!109394))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!109393 () ListLongMap!3059)

(declare-fun v!520 () V!6929)

(declare-fun +!574 (ListLongMap!3059 tuple2!4144) ListLongMap!3059)

(assert (=> b!212245 (= lt!109390 (+!574 lt!109393 (tuple2!4145 k0!843 v!520)))))

(declare-datatypes ((Unit!6434 0))(
  ( (Unit!6435) )
))
(declare-fun lt!109389 () Unit!6434)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!222 (array!10123 array!10125 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) (_ BitVec 64) V!6929 (_ BitVec 32) Int) Unit!6434)

(assert (=> b!212245 (= lt!109389 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!222 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!504 (array!10123 array!10125 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3059)

(assert (=> b!212245 (= lt!109394 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212245 (= lt!109391 (array!10126 (store (arr!4806 _values!649) i!601 (ValueCellFull!2387 v!520)) (size!5131 _values!649)))))

(assert (=> b!212245 (= lt!109393 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212246 () Bool)

(declare-fun res!103761 () Bool)

(assert (=> b!212246 (=> (not res!103761) (not e!138105))))

(assert (=> b!212246 (= res!103761 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5130 _keys!825))))))

(declare-fun b!212247 () Bool)

(declare-fun res!103756 () Bool)

(assert (=> b!212247 (=> (not res!103756) (not e!138105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212247 (= res!103756 (validKeyInArray!0 k0!843))))

(declare-fun b!212248 () Bool)

(declare-fun res!103758 () Bool)

(assert (=> b!212248 (=> (not res!103758) (not e!138105))))

(declare-datatypes ((List!3027 0))(
  ( (Nil!3024) (Cons!3023 (h!3665 (_ BitVec 64)) (t!7964 List!3027)) )
))
(declare-fun arrayNoDuplicates!0 (array!10123 (_ BitVec 32) List!3027) Bool)

(assert (=> b!212248 (= res!103758 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3024))))

(declare-fun b!212249 () Bool)

(declare-fun e!138103 () Bool)

(declare-fun e!138102 () Bool)

(declare-fun mapRes!9281 () Bool)

(assert (=> b!212249 (= e!138103 (and e!138102 mapRes!9281))))

(declare-fun condMapEmpty!9281 () Bool)

(declare-fun mapDefault!9281 () ValueCell!2387)

(assert (=> b!212249 (= condMapEmpty!9281 (= (arr!4806 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2387)) mapDefault!9281)))))

(declare-fun b!212250 () Bool)

(assert (=> b!212250 (= e!138104 (= lt!109388 (+!574 lt!109394 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212251 () Bool)

(declare-fun e!138107 () Bool)

(declare-fun tp_is_empty!5461 () Bool)

(assert (=> b!212251 (= e!138107 tp_is_empty!5461)))

(declare-fun b!212252 () Bool)

(declare-fun res!103757 () Bool)

(assert (=> b!212252 (=> (not res!103757) (not e!138105))))

(assert (=> b!212252 (= res!103757 (= (select (arr!4805 _keys!825) i!601) k0!843))))

(declare-fun res!103762 () Bool)

(assert (=> start!21092 (=> (not res!103762) (not e!138105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21092 (= res!103762 (validMask!0 mask!1149))))

(assert (=> start!21092 e!138105))

(declare-fun array_inv!3155 (array!10125) Bool)

(assert (=> start!21092 (and (array_inv!3155 _values!649) e!138103)))

(assert (=> start!21092 true))

(assert (=> start!21092 tp_is_empty!5461))

(declare-fun array_inv!3156 (array!10123) Bool)

(assert (=> start!21092 (array_inv!3156 _keys!825)))

(assert (=> start!21092 tp!19859))

(declare-fun mapIsEmpty!9281 () Bool)

(assert (=> mapIsEmpty!9281 mapRes!9281))

(declare-fun mapNonEmpty!9281 () Bool)

(declare-fun tp!19858 () Bool)

(assert (=> mapNonEmpty!9281 (= mapRes!9281 (and tp!19858 e!138107))))

(declare-fun mapKey!9281 () (_ BitVec 32))

(declare-fun mapValue!9281 () ValueCell!2387)

(declare-fun mapRest!9281 () (Array (_ BitVec 32) ValueCell!2387))

(assert (=> mapNonEmpty!9281 (= (arr!4806 _values!649) (store mapRest!9281 mapKey!9281 mapValue!9281))))

(declare-fun b!212253 () Bool)

(declare-fun res!103759 () Bool)

(assert (=> b!212253 (=> (not res!103759) (not e!138105))))

(assert (=> b!212253 (= res!103759 (and (= (size!5131 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5130 _keys!825) (size!5131 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212254 () Bool)

(assert (=> b!212254 (= e!138102 tp_is_empty!5461)))

(assert (= (and start!21092 res!103762) b!212253))

(assert (= (and b!212253 res!103759) b!212244))

(assert (= (and b!212244 res!103760) b!212248))

(assert (= (and b!212248 res!103758) b!212246))

(assert (= (and b!212246 res!103761) b!212247))

(assert (= (and b!212247 res!103756) b!212252))

(assert (= (and b!212252 res!103757) b!212245))

(assert (= (and b!212245 (not res!103755)) b!212250))

(assert (= (and b!212249 condMapEmpty!9281) mapIsEmpty!9281))

(assert (= (and b!212249 (not condMapEmpty!9281)) mapNonEmpty!9281))

(get-info :version)

(assert (= (and mapNonEmpty!9281 ((_ is ValueCellFull!2387) mapValue!9281)) b!212251))

(assert (= (and b!212249 ((_ is ValueCellFull!2387) mapDefault!9281)) b!212254))

(assert (= start!21092 b!212249))

(declare-fun m!240179 () Bool)

(assert (=> b!212250 m!240179))

(declare-fun m!240181 () Bool)

(assert (=> b!212247 m!240181))

(declare-fun m!240183 () Bool)

(assert (=> b!212244 m!240183))

(declare-fun m!240185 () Bool)

(assert (=> b!212252 m!240185))

(declare-fun m!240187 () Bool)

(assert (=> b!212248 m!240187))

(declare-fun m!240189 () Bool)

(assert (=> start!21092 m!240189))

(declare-fun m!240191 () Bool)

(assert (=> start!21092 m!240191))

(declare-fun m!240193 () Bool)

(assert (=> start!21092 m!240193))

(declare-fun m!240195 () Bool)

(assert (=> b!212245 m!240195))

(declare-fun m!240197 () Bool)

(assert (=> b!212245 m!240197))

(declare-fun m!240199 () Bool)

(assert (=> b!212245 m!240199))

(declare-fun m!240201 () Bool)

(assert (=> b!212245 m!240201))

(declare-fun m!240203 () Bool)

(assert (=> b!212245 m!240203))

(declare-fun m!240205 () Bool)

(assert (=> b!212245 m!240205))

(declare-fun m!240207 () Bool)

(assert (=> b!212245 m!240207))

(declare-fun m!240209 () Bool)

(assert (=> mapNonEmpty!9281 m!240209))

(check-sat tp_is_empty!5461 b_and!12443 (not b!212248) (not start!21092) (not mapNonEmpty!9281) (not b_next!5599) (not b!212250) (not b!212244) (not b!212245) (not b!212247))
(check-sat b_and!12443 (not b_next!5599))
(get-model)

(declare-fun d!58181 () Bool)

(assert (=> d!58181 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212247 d!58181))

(declare-fun b!212363 () Bool)

(declare-fun e!138180 () Bool)

(assert (=> b!212363 (= e!138180 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20084 () Bool)

(declare-fun call!20089 () ListLongMap!3059)

(declare-fun call!20090 () ListLongMap!3059)

(assert (=> bm!20084 (= call!20089 call!20090)))

(declare-fun b!212364 () Bool)

(declare-fun e!138182 () Bool)

(declare-fun call!20092 () Bool)

(assert (=> b!212364 (= e!138182 (not call!20092))))

(declare-fun bm!20085 () Bool)

(declare-fun call!20091 () ListLongMap!3059)

(assert (=> bm!20085 (= call!20091 call!20089)))

(declare-fun b!212365 () Bool)

(declare-fun e!138174 () Unit!6434)

(declare-fun Unit!6438 () Unit!6434)

(assert (=> b!212365 (= e!138174 Unit!6438)))

(declare-fun b!212366 () Bool)

(declare-fun e!138171 () Bool)

(declare-fun call!20088 () Bool)

(assert (=> b!212366 (= e!138171 (not call!20088))))

(declare-fun b!212367 () Bool)

(declare-fun e!138176 () ListLongMap!3059)

(assert (=> b!212367 (= e!138176 call!20091)))

(declare-fun b!212368 () Bool)

(declare-fun e!138177 () ListLongMap!3059)

(declare-fun call!20087 () ListLongMap!3059)

(assert (=> b!212368 (= e!138177 call!20087)))

(declare-fun b!212369 () Bool)

(declare-fun e!138170 () ListLongMap!3059)

(declare-fun call!20093 () ListLongMap!3059)

(assert (=> b!212369 (= e!138170 (+!574 call!20093 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20086 () Bool)

(assert (=> bm!20086 (= call!20087 call!20093)))

(declare-fun b!212370 () Bool)

(declare-fun e!138173 () Bool)

(assert (=> b!212370 (= e!138173 e!138171)))

(declare-fun c!35804 () Bool)

(assert (=> b!212370 (= c!35804 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212371 () Bool)

(assert (=> b!212371 (= e!138170 e!138177)))

(declare-fun c!35806 () Bool)

(assert (=> b!212371 (= c!35806 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212372 () Bool)

(declare-fun e!138172 () Bool)

(declare-fun lt!109491 () ListLongMap!3059)

(declare-fun apply!196 (ListLongMap!3059 (_ BitVec 64)) V!6929)

(assert (=> b!212372 (= e!138172 (= (apply!196 lt!109491 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun e!138179 () Bool)

(declare-fun b!212373 () Bool)

(declare-fun get!2578 (ValueCell!2387 V!6929) V!6929)

(declare-fun dynLambda!539 (Int (_ BitVec 64)) V!6929)

(assert (=> b!212373 (= e!138179 (= (apply!196 lt!109491 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)) (get!2578 (select (arr!4806 lt!109391) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5131 lt!109391)))))

(assert (=> b!212373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun d!58183 () Bool)

(assert (=> d!58183 e!138173))

(declare-fun res!103831 () Bool)

(assert (=> d!58183 (=> (not res!103831) (not e!138173))))

(assert (=> d!58183 (= res!103831 (or (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))))

(declare-fun lt!109497 () ListLongMap!3059)

(assert (=> d!58183 (= lt!109491 lt!109497)))

(declare-fun lt!109495 () Unit!6434)

(assert (=> d!58183 (= lt!109495 e!138174)))

(declare-fun c!35809 () Bool)

(declare-fun e!138181 () Bool)

(assert (=> d!58183 (= c!35809 e!138181)))

(declare-fun res!103833 () Bool)

(assert (=> d!58183 (=> (not res!103833) (not e!138181))))

(assert (=> d!58183 (= res!103833 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58183 (= lt!109497 e!138170)))

(declare-fun c!35807 () Bool)

(assert (=> d!58183 (= c!35807 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58183 (validMask!0 mask!1149)))

(assert (=> d!58183 (= (getCurrentListMap!1081 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109491)))

(declare-fun bm!20087 () Bool)

(declare-fun contains!1393 (ListLongMap!3059 (_ BitVec 64)) Bool)

(assert (=> bm!20087 (= call!20092 (contains!1393 lt!109491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212374 () Bool)

(declare-fun e!138175 () Bool)

(assert (=> b!212374 (= e!138175 e!138179)))

(declare-fun res!103836 () Bool)

(assert (=> b!212374 (=> (not res!103836) (not e!138179))))

(assert (=> b!212374 (= res!103836 (contains!1393 lt!109491 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun b!212375 () Bool)

(declare-fun c!35808 () Bool)

(assert (=> b!212375 (= c!35808 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212375 (= e!138177 e!138176)))

(declare-fun b!212376 () Bool)

(declare-fun lt!109488 () Unit!6434)

(assert (=> b!212376 (= e!138174 lt!109488)))

(declare-fun lt!109492 () ListLongMap!3059)

(assert (=> b!212376 (= lt!109492 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109498 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109501 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109501 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109490 () Unit!6434)

(declare-fun addStillContains!172 (ListLongMap!3059 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6434)

(assert (=> b!212376 (= lt!109490 (addStillContains!172 lt!109492 lt!109498 zeroValue!615 lt!109501))))

(assert (=> b!212376 (contains!1393 (+!574 lt!109492 (tuple2!4145 lt!109498 zeroValue!615)) lt!109501)))

(declare-fun lt!109502 () Unit!6434)

(assert (=> b!212376 (= lt!109502 lt!109490)))

(declare-fun lt!109483 () ListLongMap!3059)

(assert (=> b!212376 (= lt!109483 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109482 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109493 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109493 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109500 () Unit!6434)

(declare-fun addApplyDifferent!172 (ListLongMap!3059 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6434)

(assert (=> b!212376 (= lt!109500 (addApplyDifferent!172 lt!109483 lt!109482 minValue!615 lt!109493))))

(assert (=> b!212376 (= (apply!196 (+!574 lt!109483 (tuple2!4145 lt!109482 minValue!615)) lt!109493) (apply!196 lt!109483 lt!109493))))

(declare-fun lt!109484 () Unit!6434)

(assert (=> b!212376 (= lt!109484 lt!109500)))

(declare-fun lt!109496 () ListLongMap!3059)

(assert (=> b!212376 (= lt!109496 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109485 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109486 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109486 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109481 () Unit!6434)

(assert (=> b!212376 (= lt!109481 (addApplyDifferent!172 lt!109496 lt!109485 zeroValue!615 lt!109486))))

(assert (=> b!212376 (= (apply!196 (+!574 lt!109496 (tuple2!4145 lt!109485 zeroValue!615)) lt!109486) (apply!196 lt!109496 lt!109486))))

(declare-fun lt!109489 () Unit!6434)

(assert (=> b!212376 (= lt!109489 lt!109481)))

(declare-fun lt!109494 () ListLongMap!3059)

(assert (=> b!212376 (= lt!109494 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109487 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109499 () (_ BitVec 64))

(assert (=> b!212376 (= lt!109499 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212376 (= lt!109488 (addApplyDifferent!172 lt!109494 lt!109487 minValue!615 lt!109499))))

(assert (=> b!212376 (= (apply!196 (+!574 lt!109494 (tuple2!4145 lt!109487 minValue!615)) lt!109499) (apply!196 lt!109494 lt!109499))))

(declare-fun bm!20088 () Bool)

(assert (=> bm!20088 (= call!20093 (+!574 (ite c!35807 call!20090 (ite c!35806 call!20089 call!20091)) (ite (or c!35807 c!35806) (tuple2!4145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212377 () Bool)

(declare-fun res!103832 () Bool)

(assert (=> b!212377 (=> (not res!103832) (not e!138173))))

(assert (=> b!212377 (= res!103832 e!138182)))

(declare-fun c!35805 () Bool)

(assert (=> b!212377 (= c!35805 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212378 () Bool)

(assert (=> b!212378 (= e!138176 call!20087)))

(declare-fun bm!20089 () Bool)

(assert (=> bm!20089 (= call!20088 (contains!1393 lt!109491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212379 () Bool)

(assert (=> b!212379 (= e!138182 e!138172)))

(declare-fun res!103835 () Bool)

(assert (=> b!212379 (= res!103835 call!20092)))

(assert (=> b!212379 (=> (not res!103835) (not e!138172))))

(declare-fun b!212380 () Bool)

(declare-fun e!138178 () Bool)

(assert (=> b!212380 (= e!138171 e!138178)))

(declare-fun res!103830 () Bool)

(assert (=> b!212380 (= res!103830 call!20088)))

(assert (=> b!212380 (=> (not res!103830) (not e!138178))))

(declare-fun b!212381 () Bool)

(assert (=> b!212381 (= e!138181 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212382 () Bool)

(assert (=> b!212382 (= e!138178 (= (apply!196 lt!109491 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20090 () Bool)

(assert (=> bm!20090 (= call!20090 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212383 () Bool)

(declare-fun res!103837 () Bool)

(assert (=> b!212383 (=> (not res!103837) (not e!138173))))

(assert (=> b!212383 (= res!103837 e!138175)))

(declare-fun res!103834 () Bool)

(assert (=> b!212383 (=> res!103834 e!138175)))

(assert (=> b!212383 (= res!103834 (not e!138180))))

(declare-fun res!103829 () Bool)

(assert (=> b!212383 (=> (not res!103829) (not e!138180))))

(assert (=> b!212383 (= res!103829 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (= (and d!58183 c!35807) b!212369))

(assert (= (and d!58183 (not c!35807)) b!212371))

(assert (= (and b!212371 c!35806) b!212368))

(assert (= (and b!212371 (not c!35806)) b!212375))

(assert (= (and b!212375 c!35808) b!212378))

(assert (= (and b!212375 (not c!35808)) b!212367))

(assert (= (or b!212378 b!212367) bm!20085))

(assert (= (or b!212368 bm!20085) bm!20084))

(assert (= (or b!212368 b!212378) bm!20086))

(assert (= (or b!212369 bm!20084) bm!20090))

(assert (= (or b!212369 bm!20086) bm!20088))

(assert (= (and d!58183 res!103833) b!212381))

(assert (= (and d!58183 c!35809) b!212376))

(assert (= (and d!58183 (not c!35809)) b!212365))

(assert (= (and d!58183 res!103831) b!212383))

(assert (= (and b!212383 res!103829) b!212363))

(assert (= (and b!212383 (not res!103834)) b!212374))

(assert (= (and b!212374 res!103836) b!212373))

(assert (= (and b!212383 res!103837) b!212377))

(assert (= (and b!212377 c!35805) b!212379))

(assert (= (and b!212377 (not c!35805)) b!212364))

(assert (= (and b!212379 res!103835) b!212372))

(assert (= (or b!212379 b!212364) bm!20087))

(assert (= (and b!212377 res!103832) b!212370))

(assert (= (and b!212370 c!35804) b!212380))

(assert (= (and b!212370 (not c!35804)) b!212366))

(assert (= (and b!212380 res!103830) b!212382))

(assert (= (or b!212380 b!212366) bm!20089))

(declare-fun b_lambda!7729 () Bool)

(assert (=> (not b_lambda!7729) (not b!212373)))

(declare-fun t!7969 () Bool)

(declare-fun tb!2897 () Bool)

(assert (=> (and start!21092 (= defaultEntry!657 defaultEntry!657) t!7969) tb!2897))

(declare-fun result!4995 () Bool)

(assert (=> tb!2897 (= result!4995 tp_is_empty!5461)))

(assert (=> b!212373 t!7969))

(declare-fun b_and!12449 () Bool)

(assert (= b_and!12443 (and (=> t!7969 result!4995) b_and!12449)))

(declare-fun m!240275 () Bool)

(assert (=> bm!20088 m!240275))

(declare-fun m!240277 () Bool)

(assert (=> b!212374 m!240277))

(assert (=> b!212374 m!240277))

(declare-fun m!240279 () Bool)

(assert (=> b!212374 m!240279))

(assert (=> bm!20090 m!240205))

(declare-fun m!240281 () Bool)

(assert (=> b!212382 m!240281))

(declare-fun m!240283 () Bool)

(assert (=> b!212369 m!240283))

(assert (=> d!58183 m!240189))

(declare-fun m!240285 () Bool)

(assert (=> bm!20087 m!240285))

(assert (=> b!212381 m!240277))

(assert (=> b!212381 m!240277))

(declare-fun m!240287 () Bool)

(assert (=> b!212381 m!240287))

(declare-fun m!240289 () Bool)

(assert (=> b!212373 m!240289))

(declare-fun m!240291 () Bool)

(assert (=> b!212373 m!240291))

(assert (=> b!212373 m!240289))

(declare-fun m!240293 () Bool)

(assert (=> b!212373 m!240293))

(assert (=> b!212373 m!240291))

(assert (=> b!212373 m!240277))

(declare-fun m!240295 () Bool)

(assert (=> b!212373 m!240295))

(assert (=> b!212373 m!240277))

(declare-fun m!240297 () Bool)

(assert (=> bm!20089 m!240297))

(assert (=> b!212363 m!240277))

(assert (=> b!212363 m!240277))

(assert (=> b!212363 m!240287))

(declare-fun m!240299 () Bool)

(assert (=> b!212372 m!240299))

(declare-fun m!240301 () Bool)

(assert (=> b!212376 m!240301))

(assert (=> b!212376 m!240205))

(declare-fun m!240303 () Bool)

(assert (=> b!212376 m!240303))

(declare-fun m!240305 () Bool)

(assert (=> b!212376 m!240305))

(declare-fun m!240307 () Bool)

(assert (=> b!212376 m!240307))

(declare-fun m!240309 () Bool)

(assert (=> b!212376 m!240309))

(declare-fun m!240311 () Bool)

(assert (=> b!212376 m!240311))

(assert (=> b!212376 m!240307))

(declare-fun m!240313 () Bool)

(assert (=> b!212376 m!240313))

(assert (=> b!212376 m!240277))

(declare-fun m!240315 () Bool)

(assert (=> b!212376 m!240315))

(assert (=> b!212376 m!240309))

(declare-fun m!240317 () Bool)

(assert (=> b!212376 m!240317))

(declare-fun m!240319 () Bool)

(assert (=> b!212376 m!240319))

(declare-fun m!240321 () Bool)

(assert (=> b!212376 m!240321))

(declare-fun m!240323 () Bool)

(assert (=> b!212376 m!240323))

(declare-fun m!240325 () Bool)

(assert (=> b!212376 m!240325))

(assert (=> b!212376 m!240319))

(declare-fun m!240327 () Bool)

(assert (=> b!212376 m!240327))

(assert (=> b!212376 m!240321))

(declare-fun m!240329 () Bool)

(assert (=> b!212376 m!240329))

(assert (=> b!212245 d!58183))

(declare-fun b!212410 () Bool)

(declare-fun res!103848 () Bool)

(declare-fun e!138198 () Bool)

(assert (=> b!212410 (=> (not res!103848) (not e!138198))))

(declare-fun lt!109521 () ListLongMap!3059)

(assert (=> b!212410 (= res!103848 (not (contains!1393 lt!109521 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212411 () Bool)

(declare-fun e!138199 () Bool)

(declare-fun e!138201 () Bool)

(assert (=> b!212411 (= e!138199 e!138201)))

(declare-fun c!35818 () Bool)

(assert (=> b!212411 (= c!35818 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun bm!20093 () Bool)

(declare-fun call!20096 () ListLongMap!3059)

(assert (=> bm!20093 (= call!20096 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212412 () Bool)

(declare-fun e!138202 () ListLongMap!3059)

(assert (=> b!212412 (= e!138202 call!20096)))

(declare-fun b!212413 () Bool)

(declare-fun e!138200 () ListLongMap!3059)

(assert (=> b!212413 (= e!138200 e!138202)))

(declare-fun c!35819 () Bool)

(assert (=> b!212413 (= c!35819 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58185 () Bool)

(assert (=> d!58185 e!138198))

(declare-fun res!103849 () Bool)

(assert (=> d!58185 (=> (not res!103849) (not e!138198))))

(assert (=> d!58185 (= res!103849 (not (contains!1393 lt!109521 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58185 (= lt!109521 e!138200)))

(declare-fun c!35820 () Bool)

(assert (=> d!58185 (= c!35820 (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58185 (validMask!0 mask!1149)))

(assert (=> d!58185 (= (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109521)))

(declare-fun b!212414 () Bool)

(declare-fun e!138197 () Bool)

(assert (=> b!212414 (= e!138197 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212414 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212415 () Bool)

(assert (=> b!212415 (= e!138201 (= lt!109521 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212416 () Bool)

(assert (=> b!212416 (= e!138198 e!138199)))

(declare-fun c!35821 () Bool)

(assert (=> b!212416 (= c!35821 e!138197)))

(declare-fun res!103847 () Bool)

(assert (=> b!212416 (=> (not res!103847) (not e!138197))))

(assert (=> b!212416 (= res!103847 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun b!212417 () Bool)

(declare-fun isEmpty!503 (ListLongMap!3059) Bool)

(assert (=> b!212417 (= e!138201 (isEmpty!503 lt!109521))))

(declare-fun b!212418 () Bool)

(assert (=> b!212418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> b!212418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5131 _values!649)))))

(declare-fun e!138203 () Bool)

(assert (=> b!212418 (= e!138203 (= (apply!196 lt!109521 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)) (get!2578 (select (arr!4806 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212419 () Bool)

(declare-fun lt!109518 () Unit!6434)

(declare-fun lt!109523 () Unit!6434)

(assert (=> b!212419 (= lt!109518 lt!109523)))

(declare-fun lt!109522 () (_ BitVec 64))

(declare-fun lt!109520 () V!6929)

(declare-fun lt!109517 () (_ BitVec 64))

(declare-fun lt!109519 () ListLongMap!3059)

(assert (=> b!212419 (not (contains!1393 (+!574 lt!109519 (tuple2!4145 lt!109517 lt!109520)) lt!109522))))

(declare-fun addStillNotContains!107 (ListLongMap!3059 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6434)

(assert (=> b!212419 (= lt!109523 (addStillNotContains!107 lt!109519 lt!109517 lt!109520 lt!109522))))

(assert (=> b!212419 (= lt!109522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212419 (= lt!109520 (get!2578 (select (arr!4806 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212419 (= lt!109517 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212419 (= lt!109519 call!20096)))

(assert (=> b!212419 (= e!138202 (+!574 call!20096 (tuple2!4145 (select (arr!4805 _keys!825) #b00000000000000000000000000000000) (get!2578 (select (arr!4806 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212420 () Bool)

(assert (=> b!212420 (= e!138199 e!138203)))

(assert (=> b!212420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun res!103846 () Bool)

(assert (=> b!212420 (= res!103846 (contains!1393 lt!109521 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212420 (=> (not res!103846) (not e!138203))))

(declare-fun b!212421 () Bool)

(assert (=> b!212421 (= e!138200 (ListLongMap!3060 Nil!3023))))

(assert (= (and d!58185 c!35820) b!212421))

(assert (= (and d!58185 (not c!35820)) b!212413))

(assert (= (and b!212413 c!35819) b!212419))

(assert (= (and b!212413 (not c!35819)) b!212412))

(assert (= (or b!212419 b!212412) bm!20093))

(assert (= (and d!58185 res!103849) b!212410))

(assert (= (and b!212410 res!103848) b!212416))

(assert (= (and b!212416 res!103847) b!212414))

(assert (= (and b!212416 c!35821) b!212420))

(assert (= (and b!212416 (not c!35821)) b!212411))

(assert (= (and b!212420 res!103846) b!212418))

(assert (= (and b!212411 c!35818) b!212415))

(assert (= (and b!212411 (not c!35818)) b!212417))

(declare-fun b_lambda!7731 () Bool)

(assert (=> (not b_lambda!7731) (not b!212418)))

(assert (=> b!212418 t!7969))

(declare-fun b_and!12451 () Bool)

(assert (= b_and!12449 (and (=> t!7969 result!4995) b_and!12451)))

(declare-fun b_lambda!7733 () Bool)

(assert (=> (not b_lambda!7733) (not b!212419)))

(assert (=> b!212419 t!7969))

(declare-fun b_and!12453 () Bool)

(assert (= b_and!12451 (and (=> t!7969 result!4995) b_and!12453)))

(declare-fun m!240331 () Bool)

(assert (=> bm!20093 m!240331))

(declare-fun m!240333 () Bool)

(assert (=> b!212410 m!240333))

(declare-fun m!240335 () Bool)

(assert (=> b!212417 m!240335))

(declare-fun m!240337 () Bool)

(assert (=> b!212419 m!240337))

(declare-fun m!240339 () Bool)

(assert (=> b!212419 m!240339))

(declare-fun m!240341 () Bool)

(assert (=> b!212419 m!240341))

(assert (=> b!212419 m!240339))

(assert (=> b!212419 m!240289))

(assert (=> b!212419 m!240277))

(declare-fun m!240343 () Bool)

(assert (=> b!212419 m!240343))

(assert (=> b!212419 m!240289))

(declare-fun m!240345 () Bool)

(assert (=> b!212419 m!240345))

(assert (=> b!212419 m!240343))

(declare-fun m!240347 () Bool)

(assert (=> b!212419 m!240347))

(assert (=> b!212414 m!240277))

(assert (=> b!212414 m!240277))

(assert (=> b!212414 m!240287))

(assert (=> b!212418 m!240289))

(assert (=> b!212418 m!240277))

(assert (=> b!212418 m!240343))

(assert (=> b!212418 m!240289))

(assert (=> b!212418 m!240345))

(assert (=> b!212418 m!240277))

(declare-fun m!240349 () Bool)

(assert (=> b!212418 m!240349))

(assert (=> b!212418 m!240343))

(assert (=> b!212415 m!240331))

(declare-fun m!240351 () Bool)

(assert (=> d!58185 m!240351))

(assert (=> d!58185 m!240189))

(assert (=> b!212420 m!240277))

(assert (=> b!212420 m!240277))

(declare-fun m!240353 () Bool)

(assert (=> b!212420 m!240353))

(assert (=> b!212413 m!240277))

(assert (=> b!212413 m!240277))

(assert (=> b!212413 m!240287))

(assert (=> b!212245 d!58185))

(declare-fun b!212422 () Bool)

(declare-fun res!103852 () Bool)

(declare-fun e!138205 () Bool)

(assert (=> b!212422 (=> (not res!103852) (not e!138205))))

(declare-fun lt!109528 () ListLongMap!3059)

(assert (=> b!212422 (= res!103852 (not (contains!1393 lt!109528 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212423 () Bool)

(declare-fun e!138206 () Bool)

(declare-fun e!138208 () Bool)

(assert (=> b!212423 (= e!138206 e!138208)))

(declare-fun c!35822 () Bool)

(assert (=> b!212423 (= c!35822 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun call!20097 () ListLongMap!3059)

(declare-fun bm!20094 () Bool)

(assert (=> bm!20094 (= call!20097 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212424 () Bool)

(declare-fun e!138209 () ListLongMap!3059)

(assert (=> b!212424 (= e!138209 call!20097)))

(declare-fun b!212425 () Bool)

(declare-fun e!138207 () ListLongMap!3059)

(assert (=> b!212425 (= e!138207 e!138209)))

(declare-fun c!35823 () Bool)

(assert (=> b!212425 (= c!35823 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58187 () Bool)

(assert (=> d!58187 e!138205))

(declare-fun res!103853 () Bool)

(assert (=> d!58187 (=> (not res!103853) (not e!138205))))

(assert (=> d!58187 (= res!103853 (not (contains!1393 lt!109528 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58187 (= lt!109528 e!138207)))

(declare-fun c!35824 () Bool)

(assert (=> d!58187 (= c!35824 (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58187 (validMask!0 mask!1149)))

(assert (=> d!58187 (= (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109528)))

(declare-fun b!212426 () Bool)

(declare-fun e!138204 () Bool)

(assert (=> b!212426 (= e!138204 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212426 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212427 () Bool)

(assert (=> b!212427 (= e!138208 (= lt!109528 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109391 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212428 () Bool)

(assert (=> b!212428 (= e!138205 e!138206)))

(declare-fun c!35825 () Bool)

(assert (=> b!212428 (= c!35825 e!138204)))

(declare-fun res!103851 () Bool)

(assert (=> b!212428 (=> (not res!103851) (not e!138204))))

(assert (=> b!212428 (= res!103851 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun b!212429 () Bool)

(assert (=> b!212429 (= e!138208 (isEmpty!503 lt!109528))))

(declare-fun b!212430 () Bool)

(assert (=> b!212430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> b!212430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5131 lt!109391)))))

(declare-fun e!138210 () Bool)

(assert (=> b!212430 (= e!138210 (= (apply!196 lt!109528 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)) (get!2578 (select (arr!4806 lt!109391) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212431 () Bool)

(declare-fun lt!109525 () Unit!6434)

(declare-fun lt!109530 () Unit!6434)

(assert (=> b!212431 (= lt!109525 lt!109530)))

(declare-fun lt!109524 () (_ BitVec 64))

(declare-fun lt!109529 () (_ BitVec 64))

(declare-fun lt!109526 () ListLongMap!3059)

(declare-fun lt!109527 () V!6929)

(assert (=> b!212431 (not (contains!1393 (+!574 lt!109526 (tuple2!4145 lt!109524 lt!109527)) lt!109529))))

(assert (=> b!212431 (= lt!109530 (addStillNotContains!107 lt!109526 lt!109524 lt!109527 lt!109529))))

(assert (=> b!212431 (= lt!109529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212431 (= lt!109527 (get!2578 (select (arr!4806 lt!109391) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212431 (= lt!109524 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212431 (= lt!109526 call!20097)))

(assert (=> b!212431 (= e!138209 (+!574 call!20097 (tuple2!4145 (select (arr!4805 _keys!825) #b00000000000000000000000000000000) (get!2578 (select (arr!4806 lt!109391) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212432 () Bool)

(assert (=> b!212432 (= e!138206 e!138210)))

(assert (=> b!212432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun res!103850 () Bool)

(assert (=> b!212432 (= res!103850 (contains!1393 lt!109528 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212432 (=> (not res!103850) (not e!138210))))

(declare-fun b!212433 () Bool)

(assert (=> b!212433 (= e!138207 (ListLongMap!3060 Nil!3023))))

(assert (= (and d!58187 c!35824) b!212433))

(assert (= (and d!58187 (not c!35824)) b!212425))

(assert (= (and b!212425 c!35823) b!212431))

(assert (= (and b!212425 (not c!35823)) b!212424))

(assert (= (or b!212431 b!212424) bm!20094))

(assert (= (and d!58187 res!103853) b!212422))

(assert (= (and b!212422 res!103852) b!212428))

(assert (= (and b!212428 res!103851) b!212426))

(assert (= (and b!212428 c!35825) b!212432))

(assert (= (and b!212428 (not c!35825)) b!212423))

(assert (= (and b!212432 res!103850) b!212430))

(assert (= (and b!212423 c!35822) b!212427))

(assert (= (and b!212423 (not c!35822)) b!212429))

(declare-fun b_lambda!7735 () Bool)

(assert (=> (not b_lambda!7735) (not b!212430)))

(assert (=> b!212430 t!7969))

(declare-fun b_and!12455 () Bool)

(assert (= b_and!12453 (and (=> t!7969 result!4995) b_and!12455)))

(declare-fun b_lambda!7737 () Bool)

(assert (=> (not b_lambda!7737) (not b!212431)))

(assert (=> b!212431 t!7969))

(declare-fun b_and!12457 () Bool)

(assert (= b_and!12455 (and (=> t!7969 result!4995) b_and!12457)))

(declare-fun m!240355 () Bool)

(assert (=> bm!20094 m!240355))

(declare-fun m!240357 () Bool)

(assert (=> b!212422 m!240357))

(declare-fun m!240359 () Bool)

(assert (=> b!212429 m!240359))

(declare-fun m!240361 () Bool)

(assert (=> b!212431 m!240361))

(declare-fun m!240363 () Bool)

(assert (=> b!212431 m!240363))

(declare-fun m!240365 () Bool)

(assert (=> b!212431 m!240365))

(assert (=> b!212431 m!240363))

(assert (=> b!212431 m!240289))

(assert (=> b!212431 m!240277))

(assert (=> b!212431 m!240291))

(assert (=> b!212431 m!240289))

(assert (=> b!212431 m!240293))

(assert (=> b!212431 m!240291))

(declare-fun m!240367 () Bool)

(assert (=> b!212431 m!240367))

(assert (=> b!212426 m!240277))

(assert (=> b!212426 m!240277))

(assert (=> b!212426 m!240287))

(assert (=> b!212430 m!240289))

(assert (=> b!212430 m!240277))

(assert (=> b!212430 m!240291))

(assert (=> b!212430 m!240289))

(assert (=> b!212430 m!240293))

(assert (=> b!212430 m!240277))

(declare-fun m!240369 () Bool)

(assert (=> b!212430 m!240369))

(assert (=> b!212430 m!240291))

(assert (=> b!212427 m!240355))

(declare-fun m!240371 () Bool)

(assert (=> d!58187 m!240371))

(assert (=> d!58187 m!240189))

(assert (=> b!212432 m!240277))

(assert (=> b!212432 m!240277))

(declare-fun m!240373 () Bool)

(assert (=> b!212432 m!240373))

(assert (=> b!212425 m!240277))

(assert (=> b!212425 m!240277))

(assert (=> b!212425 m!240287))

(assert (=> b!212245 d!58187))

(declare-fun d!58189 () Bool)

(declare-fun e!138213 () Bool)

(assert (=> d!58189 e!138213))

(declare-fun res!103858 () Bool)

(assert (=> d!58189 (=> (not res!103858) (not e!138213))))

(declare-fun lt!109539 () ListLongMap!3059)

(assert (=> d!58189 (= res!103858 (contains!1393 lt!109539 (_1!2083 (tuple2!4145 k0!843 v!520))))))

(declare-fun lt!109542 () List!3026)

(assert (=> d!58189 (= lt!109539 (ListLongMap!3060 lt!109542))))

(declare-fun lt!109540 () Unit!6434)

(declare-fun lt!109541 () Unit!6434)

(assert (=> d!58189 (= lt!109540 lt!109541)))

(declare-datatypes ((Option!261 0))(
  ( (Some!260 (v!4780 V!6929)) (None!259) )
))
(declare-fun getValueByKey!255 (List!3026 (_ BitVec 64)) Option!261)

(assert (=> d!58189 (= (getValueByKey!255 lt!109542 (_1!2083 (tuple2!4145 k0!843 v!520))) (Some!260 (_2!2083 (tuple2!4145 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!142 (List!3026 (_ BitVec 64) V!6929) Unit!6434)

(assert (=> d!58189 (= lt!109541 (lemmaContainsTupThenGetReturnValue!142 lt!109542 (_1!2083 (tuple2!4145 k0!843 v!520)) (_2!2083 (tuple2!4145 k0!843 v!520))))))

(declare-fun insertStrictlySorted!145 (List!3026 (_ BitVec 64) V!6929) List!3026)

(assert (=> d!58189 (= lt!109542 (insertStrictlySorted!145 (toList!1545 lt!109393) (_1!2083 (tuple2!4145 k0!843 v!520)) (_2!2083 (tuple2!4145 k0!843 v!520))))))

(assert (=> d!58189 (= (+!574 lt!109393 (tuple2!4145 k0!843 v!520)) lt!109539)))

(declare-fun b!212438 () Bool)

(declare-fun res!103859 () Bool)

(assert (=> b!212438 (=> (not res!103859) (not e!138213))))

(assert (=> b!212438 (= res!103859 (= (getValueByKey!255 (toList!1545 lt!109539) (_1!2083 (tuple2!4145 k0!843 v!520))) (Some!260 (_2!2083 (tuple2!4145 k0!843 v!520)))))))

(declare-fun b!212439 () Bool)

(declare-fun contains!1394 (List!3026 tuple2!4144) Bool)

(assert (=> b!212439 (= e!138213 (contains!1394 (toList!1545 lt!109539) (tuple2!4145 k0!843 v!520)))))

(assert (= (and d!58189 res!103858) b!212438))

(assert (= (and b!212438 res!103859) b!212439))

(declare-fun m!240375 () Bool)

(assert (=> d!58189 m!240375))

(declare-fun m!240377 () Bool)

(assert (=> d!58189 m!240377))

(declare-fun m!240379 () Bool)

(assert (=> d!58189 m!240379))

(declare-fun m!240381 () Bool)

(assert (=> d!58189 m!240381))

(declare-fun m!240383 () Bool)

(assert (=> b!212438 m!240383))

(declare-fun m!240385 () Bool)

(assert (=> b!212439 m!240385))

(assert (=> b!212245 d!58189))

(declare-fun bm!20099 () Bool)

(declare-fun call!20103 () ListLongMap!3059)

(assert (=> bm!20099 (= call!20103 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20100 () Bool)

(declare-fun call!20102 () ListLongMap!3059)

(assert (=> bm!20100 (= call!20102 (getCurrentListMapNoExtraKeys!504 _keys!825 (array!10126 (store (arr!4806 _values!649) i!601 (ValueCellFull!2387 v!520)) (size!5131 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212447 () Bool)

(declare-fun e!138218 () Bool)

(declare-fun e!138219 () Bool)

(assert (=> b!212447 (= e!138218 e!138219)))

(declare-fun c!35828 () Bool)

(assert (=> b!212447 (= c!35828 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!212448 () Bool)

(assert (=> b!212448 (= e!138219 (= call!20102 (+!574 call!20103 (tuple2!4145 k0!843 v!520))))))

(declare-fun b!212446 () Bool)

(assert (=> b!212446 (= e!138219 (= call!20102 call!20103))))

(declare-fun d!58191 () Bool)

(assert (=> d!58191 e!138218))

(declare-fun res!103862 () Bool)

(assert (=> d!58191 (=> (not res!103862) (not e!138218))))

(assert (=> d!58191 (= res!103862 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5131 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5131 _values!649))))))))

(declare-fun lt!109545 () Unit!6434)

(declare-fun choose!1087 (array!10123 array!10125 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) (_ BitVec 64) V!6929 (_ BitVec 32) Int) Unit!6434)

(assert (=> d!58191 (= lt!109545 (choose!1087 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58191 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!222 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109545)))

(assert (= (and d!58191 res!103862) b!212447))

(assert (= (and b!212447 c!35828) b!212448))

(assert (= (and b!212447 (not c!35828)) b!212446))

(assert (= (or b!212448 b!212446) bm!20100))

(assert (= (or b!212448 b!212446) bm!20099))

(assert (=> bm!20099 m!240203))

(assert (=> bm!20100 m!240197))

(declare-fun m!240387 () Bool)

(assert (=> bm!20100 m!240387))

(declare-fun m!240389 () Bool)

(assert (=> b!212448 m!240389))

(declare-fun m!240391 () Bool)

(assert (=> d!58191 m!240391))

(assert (=> b!212245 d!58191))

(declare-fun b!212449 () Bool)

(declare-fun e!138230 () Bool)

(assert (=> b!212449 (= e!138230 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20101 () Bool)

(declare-fun call!20106 () ListLongMap!3059)

(declare-fun call!20107 () ListLongMap!3059)

(assert (=> bm!20101 (= call!20106 call!20107)))

(declare-fun b!212450 () Bool)

(declare-fun e!138232 () Bool)

(declare-fun call!20109 () Bool)

(assert (=> b!212450 (= e!138232 (not call!20109))))

(declare-fun bm!20102 () Bool)

(declare-fun call!20108 () ListLongMap!3059)

(assert (=> bm!20102 (= call!20108 call!20106)))

(declare-fun b!212451 () Bool)

(declare-fun e!138224 () Unit!6434)

(declare-fun Unit!6439 () Unit!6434)

(assert (=> b!212451 (= e!138224 Unit!6439)))

(declare-fun b!212452 () Bool)

(declare-fun e!138221 () Bool)

(declare-fun call!20105 () Bool)

(assert (=> b!212452 (= e!138221 (not call!20105))))

(declare-fun b!212453 () Bool)

(declare-fun e!138226 () ListLongMap!3059)

(assert (=> b!212453 (= e!138226 call!20108)))

(declare-fun b!212454 () Bool)

(declare-fun e!138227 () ListLongMap!3059)

(declare-fun call!20104 () ListLongMap!3059)

(assert (=> b!212454 (= e!138227 call!20104)))

(declare-fun b!212455 () Bool)

(declare-fun e!138220 () ListLongMap!3059)

(declare-fun call!20110 () ListLongMap!3059)

(assert (=> b!212455 (= e!138220 (+!574 call!20110 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20103 () Bool)

(assert (=> bm!20103 (= call!20104 call!20110)))

(declare-fun b!212456 () Bool)

(declare-fun e!138223 () Bool)

(assert (=> b!212456 (= e!138223 e!138221)))

(declare-fun c!35829 () Bool)

(assert (=> b!212456 (= c!35829 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212457 () Bool)

(assert (=> b!212457 (= e!138220 e!138227)))

(declare-fun c!35831 () Bool)

(assert (=> b!212457 (= c!35831 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212458 () Bool)

(declare-fun e!138222 () Bool)

(declare-fun lt!109556 () ListLongMap!3059)

(assert (=> b!212458 (= e!138222 (= (apply!196 lt!109556 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!212459 () Bool)

(declare-fun e!138229 () Bool)

(assert (=> b!212459 (= e!138229 (= (apply!196 lt!109556 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)) (get!2578 (select (arr!4806 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5131 _values!649)))))

(assert (=> b!212459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun d!58193 () Bool)

(assert (=> d!58193 e!138223))

(declare-fun res!103865 () Bool)

(assert (=> d!58193 (=> (not res!103865) (not e!138223))))

(assert (=> d!58193 (= res!103865 (or (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))))

(declare-fun lt!109562 () ListLongMap!3059)

(assert (=> d!58193 (= lt!109556 lt!109562)))

(declare-fun lt!109560 () Unit!6434)

(assert (=> d!58193 (= lt!109560 e!138224)))

(declare-fun c!35834 () Bool)

(declare-fun e!138231 () Bool)

(assert (=> d!58193 (= c!35834 e!138231)))

(declare-fun res!103867 () Bool)

(assert (=> d!58193 (=> (not res!103867) (not e!138231))))

(assert (=> d!58193 (= res!103867 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58193 (= lt!109562 e!138220)))

(declare-fun c!35832 () Bool)

(assert (=> d!58193 (= c!35832 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58193 (validMask!0 mask!1149)))

(assert (=> d!58193 (= (getCurrentListMap!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109556)))

(declare-fun bm!20104 () Bool)

(assert (=> bm!20104 (= call!20109 (contains!1393 lt!109556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212460 () Bool)

(declare-fun e!138225 () Bool)

(assert (=> b!212460 (= e!138225 e!138229)))

(declare-fun res!103870 () Bool)

(assert (=> b!212460 (=> (not res!103870) (not e!138229))))

(assert (=> b!212460 (= res!103870 (contains!1393 lt!109556 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(declare-fun b!212461 () Bool)

(declare-fun c!35833 () Bool)

(assert (=> b!212461 (= c!35833 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212461 (= e!138227 e!138226)))

(declare-fun b!212462 () Bool)

(declare-fun lt!109553 () Unit!6434)

(assert (=> b!212462 (= e!138224 lt!109553)))

(declare-fun lt!109557 () ListLongMap!3059)

(assert (=> b!212462 (= lt!109557 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109563 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109566 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109566 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109555 () Unit!6434)

(assert (=> b!212462 (= lt!109555 (addStillContains!172 lt!109557 lt!109563 zeroValue!615 lt!109566))))

(assert (=> b!212462 (contains!1393 (+!574 lt!109557 (tuple2!4145 lt!109563 zeroValue!615)) lt!109566)))

(declare-fun lt!109567 () Unit!6434)

(assert (=> b!212462 (= lt!109567 lt!109555)))

(declare-fun lt!109548 () ListLongMap!3059)

(assert (=> b!212462 (= lt!109548 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109547 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109547 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109558 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109558 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109565 () Unit!6434)

(assert (=> b!212462 (= lt!109565 (addApplyDifferent!172 lt!109548 lt!109547 minValue!615 lt!109558))))

(assert (=> b!212462 (= (apply!196 (+!574 lt!109548 (tuple2!4145 lt!109547 minValue!615)) lt!109558) (apply!196 lt!109548 lt!109558))))

(declare-fun lt!109549 () Unit!6434)

(assert (=> b!212462 (= lt!109549 lt!109565)))

(declare-fun lt!109561 () ListLongMap!3059)

(assert (=> b!212462 (= lt!109561 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109550 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109551 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109551 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109546 () Unit!6434)

(assert (=> b!212462 (= lt!109546 (addApplyDifferent!172 lt!109561 lt!109550 zeroValue!615 lt!109551))))

(assert (=> b!212462 (= (apply!196 (+!574 lt!109561 (tuple2!4145 lt!109550 zeroValue!615)) lt!109551) (apply!196 lt!109561 lt!109551))))

(declare-fun lt!109554 () Unit!6434)

(assert (=> b!212462 (= lt!109554 lt!109546)))

(declare-fun lt!109559 () ListLongMap!3059)

(assert (=> b!212462 (= lt!109559 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109552 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109564 () (_ BitVec 64))

(assert (=> b!212462 (= lt!109564 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212462 (= lt!109553 (addApplyDifferent!172 lt!109559 lt!109552 minValue!615 lt!109564))))

(assert (=> b!212462 (= (apply!196 (+!574 lt!109559 (tuple2!4145 lt!109552 minValue!615)) lt!109564) (apply!196 lt!109559 lt!109564))))

(declare-fun bm!20105 () Bool)

(assert (=> bm!20105 (= call!20110 (+!574 (ite c!35832 call!20107 (ite c!35831 call!20106 call!20108)) (ite (or c!35832 c!35831) (tuple2!4145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212463 () Bool)

(declare-fun res!103866 () Bool)

(assert (=> b!212463 (=> (not res!103866) (not e!138223))))

(assert (=> b!212463 (= res!103866 e!138232)))

(declare-fun c!35830 () Bool)

(assert (=> b!212463 (= c!35830 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212464 () Bool)

(assert (=> b!212464 (= e!138226 call!20104)))

(declare-fun bm!20106 () Bool)

(assert (=> bm!20106 (= call!20105 (contains!1393 lt!109556 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212465 () Bool)

(assert (=> b!212465 (= e!138232 e!138222)))

(declare-fun res!103869 () Bool)

(assert (=> b!212465 (= res!103869 call!20109)))

(assert (=> b!212465 (=> (not res!103869) (not e!138222))))

(declare-fun b!212466 () Bool)

(declare-fun e!138228 () Bool)

(assert (=> b!212466 (= e!138221 e!138228)))

(declare-fun res!103864 () Bool)

(assert (=> b!212466 (= res!103864 call!20105)))

(assert (=> b!212466 (=> (not res!103864) (not e!138228))))

(declare-fun b!212467 () Bool)

(assert (=> b!212467 (= e!138231 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212468 () Bool)

(assert (=> b!212468 (= e!138228 (= (apply!196 lt!109556 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20107 () Bool)

(assert (=> bm!20107 (= call!20107 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212469 () Bool)

(declare-fun res!103871 () Bool)

(assert (=> b!212469 (=> (not res!103871) (not e!138223))))

(assert (=> b!212469 (= res!103871 e!138225)))

(declare-fun res!103868 () Bool)

(assert (=> b!212469 (=> res!103868 e!138225)))

(assert (=> b!212469 (= res!103868 (not e!138230))))

(declare-fun res!103863 () Bool)

(assert (=> b!212469 (=> (not res!103863) (not e!138230))))

(assert (=> b!212469 (= res!103863 (bvslt #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (= (and d!58193 c!35832) b!212455))

(assert (= (and d!58193 (not c!35832)) b!212457))

(assert (= (and b!212457 c!35831) b!212454))

(assert (= (and b!212457 (not c!35831)) b!212461))

(assert (= (and b!212461 c!35833) b!212464))

(assert (= (and b!212461 (not c!35833)) b!212453))

(assert (= (or b!212464 b!212453) bm!20102))

(assert (= (or b!212454 bm!20102) bm!20101))

(assert (= (or b!212454 b!212464) bm!20103))

(assert (= (or b!212455 bm!20101) bm!20107))

(assert (= (or b!212455 bm!20103) bm!20105))

(assert (= (and d!58193 res!103867) b!212467))

(assert (= (and d!58193 c!35834) b!212462))

(assert (= (and d!58193 (not c!35834)) b!212451))

(assert (= (and d!58193 res!103865) b!212469))

(assert (= (and b!212469 res!103863) b!212449))

(assert (= (and b!212469 (not res!103868)) b!212460))

(assert (= (and b!212460 res!103870) b!212459))

(assert (= (and b!212469 res!103871) b!212463))

(assert (= (and b!212463 c!35830) b!212465))

(assert (= (and b!212463 (not c!35830)) b!212450))

(assert (= (and b!212465 res!103869) b!212458))

(assert (= (or b!212465 b!212450) bm!20104))

(assert (= (and b!212463 res!103866) b!212456))

(assert (= (and b!212456 c!35829) b!212466))

(assert (= (and b!212456 (not c!35829)) b!212452))

(assert (= (and b!212466 res!103864) b!212468))

(assert (= (or b!212466 b!212452) bm!20106))

(declare-fun b_lambda!7739 () Bool)

(assert (=> (not b_lambda!7739) (not b!212459)))

(assert (=> b!212459 t!7969))

(declare-fun b_and!12459 () Bool)

(assert (= b_and!12457 (and (=> t!7969 result!4995) b_and!12459)))

(declare-fun m!240393 () Bool)

(assert (=> bm!20105 m!240393))

(assert (=> b!212460 m!240277))

(assert (=> b!212460 m!240277))

(declare-fun m!240395 () Bool)

(assert (=> b!212460 m!240395))

(assert (=> bm!20107 m!240203))

(declare-fun m!240397 () Bool)

(assert (=> b!212468 m!240397))

(declare-fun m!240399 () Bool)

(assert (=> b!212455 m!240399))

(assert (=> d!58193 m!240189))

(declare-fun m!240401 () Bool)

(assert (=> bm!20104 m!240401))

(assert (=> b!212467 m!240277))

(assert (=> b!212467 m!240277))

(assert (=> b!212467 m!240287))

(assert (=> b!212459 m!240289))

(assert (=> b!212459 m!240343))

(assert (=> b!212459 m!240289))

(assert (=> b!212459 m!240345))

(assert (=> b!212459 m!240343))

(assert (=> b!212459 m!240277))

(declare-fun m!240403 () Bool)

(assert (=> b!212459 m!240403))

(assert (=> b!212459 m!240277))

(declare-fun m!240405 () Bool)

(assert (=> bm!20106 m!240405))

(assert (=> b!212449 m!240277))

(assert (=> b!212449 m!240277))

(assert (=> b!212449 m!240287))

(declare-fun m!240407 () Bool)

(assert (=> b!212458 m!240407))

(declare-fun m!240409 () Bool)

(assert (=> b!212462 m!240409))

(assert (=> b!212462 m!240203))

(declare-fun m!240411 () Bool)

(assert (=> b!212462 m!240411))

(declare-fun m!240413 () Bool)

(assert (=> b!212462 m!240413))

(declare-fun m!240415 () Bool)

(assert (=> b!212462 m!240415))

(declare-fun m!240417 () Bool)

(assert (=> b!212462 m!240417))

(declare-fun m!240419 () Bool)

(assert (=> b!212462 m!240419))

(assert (=> b!212462 m!240415))

(declare-fun m!240421 () Bool)

(assert (=> b!212462 m!240421))

(assert (=> b!212462 m!240277))

(declare-fun m!240423 () Bool)

(assert (=> b!212462 m!240423))

(assert (=> b!212462 m!240417))

(declare-fun m!240425 () Bool)

(assert (=> b!212462 m!240425))

(declare-fun m!240427 () Bool)

(assert (=> b!212462 m!240427))

(declare-fun m!240429 () Bool)

(assert (=> b!212462 m!240429))

(declare-fun m!240431 () Bool)

(assert (=> b!212462 m!240431))

(declare-fun m!240433 () Bool)

(assert (=> b!212462 m!240433))

(assert (=> b!212462 m!240427))

(declare-fun m!240435 () Bool)

(assert (=> b!212462 m!240435))

(assert (=> b!212462 m!240429))

(declare-fun m!240437 () Bool)

(assert (=> b!212462 m!240437))

(assert (=> b!212245 d!58193))

(declare-fun d!58195 () Bool)

(assert (=> d!58195 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21092 d!58195))

(declare-fun d!58197 () Bool)

(assert (=> d!58197 (= (array_inv!3155 _values!649) (bvsge (size!5131 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21092 d!58197))

(declare-fun d!58199 () Bool)

(assert (=> d!58199 (= (array_inv!3156 _keys!825) (bvsge (size!5130 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21092 d!58199))

(declare-fun d!58201 () Bool)

(declare-fun e!138233 () Bool)

(assert (=> d!58201 e!138233))

(declare-fun res!103872 () Bool)

(assert (=> d!58201 (=> (not res!103872) (not e!138233))))

(declare-fun lt!109568 () ListLongMap!3059)

(assert (=> d!58201 (= res!103872 (contains!1393 lt!109568 (_1!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!109571 () List!3026)

(assert (=> d!58201 (= lt!109568 (ListLongMap!3060 lt!109571))))

(declare-fun lt!109569 () Unit!6434)

(declare-fun lt!109570 () Unit!6434)

(assert (=> d!58201 (= lt!109569 lt!109570)))

(assert (=> d!58201 (= (getValueByKey!255 lt!109571 (_1!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!260 (_2!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58201 (= lt!109570 (lemmaContainsTupThenGetReturnValue!142 lt!109571 (_1!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58201 (= lt!109571 (insertStrictlySorted!145 (toList!1545 lt!109394) (_1!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58201 (= (+!574 lt!109394 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!109568)))

(declare-fun b!212470 () Bool)

(declare-fun res!103873 () Bool)

(assert (=> b!212470 (=> (not res!103873) (not e!138233))))

(assert (=> b!212470 (= res!103873 (= (getValueByKey!255 (toList!1545 lt!109568) (_1!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!260 (_2!2083 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!212471 () Bool)

(assert (=> b!212471 (= e!138233 (contains!1394 (toList!1545 lt!109568) (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58201 res!103872) b!212470))

(assert (= (and b!212470 res!103873) b!212471))

(declare-fun m!240439 () Bool)

(assert (=> d!58201 m!240439))

(declare-fun m!240441 () Bool)

(assert (=> d!58201 m!240441))

(declare-fun m!240443 () Bool)

(assert (=> d!58201 m!240443))

(declare-fun m!240445 () Bool)

(assert (=> d!58201 m!240445))

(declare-fun m!240447 () Bool)

(assert (=> b!212470 m!240447))

(declare-fun m!240449 () Bool)

(assert (=> b!212471 m!240449))

(assert (=> b!212250 d!58201))

(declare-fun b!212480 () Bool)

(declare-fun e!138242 () Bool)

(declare-fun e!138240 () Bool)

(assert (=> b!212480 (= e!138242 e!138240)))

(declare-fun lt!109579 () (_ BitVec 64))

(assert (=> b!212480 (= lt!109579 (select (arr!4805 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109578 () Unit!6434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10123 (_ BitVec 64) (_ BitVec 32)) Unit!6434)

(assert (=> b!212480 (= lt!109578 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109579 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212480 (arrayContainsKey!0 _keys!825 lt!109579 #b00000000000000000000000000000000)))

(declare-fun lt!109580 () Unit!6434)

(assert (=> b!212480 (= lt!109580 lt!109578)))

(declare-fun res!103878 () Bool)

(declare-datatypes ((SeekEntryResult!700 0))(
  ( (MissingZero!700 (index!4970 (_ BitVec 32))) (Found!700 (index!4971 (_ BitVec 32))) (Intermediate!700 (undefined!1512 Bool) (index!4972 (_ BitVec 32)) (x!22151 (_ BitVec 32))) (Undefined!700) (MissingVacant!700 (index!4973 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10123 (_ BitVec 32)) SeekEntryResult!700)

(assert (=> b!212480 (= res!103878 (= (seekEntryOrOpen!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!700 #b00000000000000000000000000000000)))))

(assert (=> b!212480 (=> (not res!103878) (not e!138240))))

(declare-fun bm!20110 () Bool)

(declare-fun call!20113 () Bool)

(assert (=> bm!20110 (= call!20113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!212481 () Bool)

(declare-fun e!138241 () Bool)

(assert (=> b!212481 (= e!138241 e!138242)))

(declare-fun c!35837 () Bool)

(assert (=> b!212481 (= c!35837 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58203 () Bool)

(declare-fun res!103879 () Bool)

(assert (=> d!58203 (=> res!103879 e!138241)))

(assert (=> d!58203 (= res!103879 (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138241)))

(declare-fun b!212482 () Bool)

(assert (=> b!212482 (= e!138242 call!20113)))

(declare-fun b!212483 () Bool)

(assert (=> b!212483 (= e!138240 call!20113)))

(assert (= (and d!58203 (not res!103879)) b!212481))

(assert (= (and b!212481 c!35837) b!212480))

(assert (= (and b!212481 (not c!35837)) b!212482))

(assert (= (and b!212480 res!103878) b!212483))

(assert (= (or b!212483 b!212482) bm!20110))

(assert (=> b!212480 m!240277))

(declare-fun m!240451 () Bool)

(assert (=> b!212480 m!240451))

(declare-fun m!240453 () Bool)

(assert (=> b!212480 m!240453))

(assert (=> b!212480 m!240277))

(declare-fun m!240455 () Bool)

(assert (=> b!212480 m!240455))

(declare-fun m!240457 () Bool)

(assert (=> bm!20110 m!240457))

(assert (=> b!212481 m!240277))

(assert (=> b!212481 m!240277))

(assert (=> b!212481 m!240287))

(assert (=> b!212244 d!58203))

(declare-fun b!212494 () Bool)

(declare-fun e!138252 () Bool)

(declare-fun contains!1395 (List!3027 (_ BitVec 64)) Bool)

(assert (=> b!212494 (= e!138252 (contains!1395 Nil!3024 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212495 () Bool)

(declare-fun e!138253 () Bool)

(declare-fun e!138254 () Bool)

(assert (=> b!212495 (= e!138253 e!138254)))

(declare-fun res!103888 () Bool)

(assert (=> b!212495 (=> (not res!103888) (not e!138254))))

(assert (=> b!212495 (= res!103888 (not e!138252))))

(declare-fun res!103887 () Bool)

(assert (=> b!212495 (=> (not res!103887) (not e!138252))))

(assert (=> b!212495 (= res!103887 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212496 () Bool)

(declare-fun e!138251 () Bool)

(declare-fun call!20116 () Bool)

(assert (=> b!212496 (= e!138251 call!20116)))

(declare-fun b!212497 () Bool)

(assert (=> b!212497 (= e!138251 call!20116)))

(declare-fun b!212498 () Bool)

(assert (=> b!212498 (= e!138254 e!138251)))

(declare-fun c!35840 () Bool)

(assert (=> b!212498 (= c!35840 (validKeyInArray!0 (select (arr!4805 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58205 () Bool)

(declare-fun res!103886 () Bool)

(assert (=> d!58205 (=> res!103886 e!138253)))

(assert (=> d!58205 (= res!103886 (bvsge #b00000000000000000000000000000000 (size!5130 _keys!825)))))

(assert (=> d!58205 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3024) e!138253)))

(declare-fun bm!20113 () Bool)

(assert (=> bm!20113 (= call!20116 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35840 (Cons!3023 (select (arr!4805 _keys!825) #b00000000000000000000000000000000) Nil!3024) Nil!3024)))))

(assert (= (and d!58205 (not res!103886)) b!212495))

(assert (= (and b!212495 res!103887) b!212494))

(assert (= (and b!212495 res!103888) b!212498))

(assert (= (and b!212498 c!35840) b!212496))

(assert (= (and b!212498 (not c!35840)) b!212497))

(assert (= (or b!212496 b!212497) bm!20113))

(assert (=> b!212494 m!240277))

(assert (=> b!212494 m!240277))

(declare-fun m!240459 () Bool)

(assert (=> b!212494 m!240459))

(assert (=> b!212495 m!240277))

(assert (=> b!212495 m!240277))

(assert (=> b!212495 m!240287))

(assert (=> b!212498 m!240277))

(assert (=> b!212498 m!240277))

(assert (=> b!212498 m!240287))

(assert (=> bm!20113 m!240277))

(declare-fun m!240461 () Bool)

(assert (=> bm!20113 m!240461))

(assert (=> b!212248 d!58205))

(declare-fun condMapEmpty!9290 () Bool)

(declare-fun mapDefault!9290 () ValueCell!2387)

(assert (=> mapNonEmpty!9281 (= condMapEmpty!9290 (= mapRest!9281 ((as const (Array (_ BitVec 32) ValueCell!2387)) mapDefault!9290)))))

(declare-fun e!138259 () Bool)

(declare-fun mapRes!9290 () Bool)

(assert (=> mapNonEmpty!9281 (= tp!19858 (and e!138259 mapRes!9290))))

(declare-fun mapIsEmpty!9290 () Bool)

(assert (=> mapIsEmpty!9290 mapRes!9290))

(declare-fun b!212505 () Bool)

(declare-fun e!138260 () Bool)

(assert (=> b!212505 (= e!138260 tp_is_empty!5461)))

(declare-fun mapNonEmpty!9290 () Bool)

(declare-fun tp!19874 () Bool)

(assert (=> mapNonEmpty!9290 (= mapRes!9290 (and tp!19874 e!138260))))

(declare-fun mapKey!9290 () (_ BitVec 32))

(declare-fun mapValue!9290 () ValueCell!2387)

(declare-fun mapRest!9290 () (Array (_ BitVec 32) ValueCell!2387))

(assert (=> mapNonEmpty!9290 (= mapRest!9281 (store mapRest!9290 mapKey!9290 mapValue!9290))))

(declare-fun b!212506 () Bool)

(assert (=> b!212506 (= e!138259 tp_is_empty!5461)))

(assert (= (and mapNonEmpty!9281 condMapEmpty!9290) mapIsEmpty!9290))

(assert (= (and mapNonEmpty!9281 (not condMapEmpty!9290)) mapNonEmpty!9290))

(assert (= (and mapNonEmpty!9290 ((_ is ValueCellFull!2387) mapValue!9290)) b!212505))

(assert (= (and mapNonEmpty!9281 ((_ is ValueCellFull!2387) mapDefault!9290)) b!212506))

(declare-fun m!240463 () Bool)

(assert (=> mapNonEmpty!9290 m!240463))

(declare-fun b_lambda!7741 () Bool)

(assert (= b_lambda!7735 (or (and start!21092 b_free!5599) b_lambda!7741)))

(declare-fun b_lambda!7743 () Bool)

(assert (= b_lambda!7739 (or (and start!21092 b_free!5599) b_lambda!7743)))

(declare-fun b_lambda!7745 () Bool)

(assert (= b_lambda!7733 (or (and start!21092 b_free!5599) b_lambda!7745)))

(declare-fun b_lambda!7747 () Bool)

(assert (= b_lambda!7731 (or (and start!21092 b_free!5599) b_lambda!7747)))

(declare-fun b_lambda!7749 () Bool)

(assert (= b_lambda!7737 (or (and start!21092 b_free!5599) b_lambda!7749)))

(declare-fun b_lambda!7751 () Bool)

(assert (= b_lambda!7729 (or (and start!21092 b_free!5599) b_lambda!7751)))

(check-sat (not b!212498) (not d!58189) (not b!212460) tp_is_empty!5461 (not b!212410) (not b_lambda!7743) (not bm!20089) (not b!212381) (not b!212455) (not d!58201) (not b!212495) (not bm!20107) (not b!212471) (not b_lambda!7741) (not b!212467) (not b!212459) (not b!212382) (not b!212369) (not b!212415) (not bm!20104) (not b!212470) (not d!58187) (not b!212430) (not b_lambda!7751) (not b!212480) (not bm!20106) (not b_lambda!7745) (not b!212413) (not b_lambda!7749) (not b_lambda!7747) (not b!212425) (not bm!20090) (not b!212449) (not bm!20087) (not b!212426) (not b!212418) (not d!58185) (not b!212448) (not b!212374) (not b!212419) (not b!212422) (not b!212373) (not b!212429) (not d!58193) (not b!212432) b_and!12459 (not b_next!5599) (not b!212494) (not b!212417) (not b!212468) (not b!212363) (not bm!20088) (not bm!20099) (not bm!20105) (not bm!20110) (not b!212376) (not b!212431) (not bm!20093) (not b!212427) (not b!212438) (not b!212420) (not b!212458) (not b!212414) (not bm!20113) (not mapNonEmpty!9290) (not d!58191) (not bm!20100) (not b!212439) (not bm!20094) (not b!212372) (not d!58183) (not b!212462) (not b!212481))
(check-sat b_and!12459 (not b_next!5599))
