; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40774 () Bool)

(assert start!40774)

(declare-fun b_free!10777 () Bool)

(declare-fun b_next!10777 () Bool)

(assert (=> start!40774 (= b_free!10777 (not b_next!10777))))

(declare-fun tp!38153 () Bool)

(declare-fun b_and!18851 () Bool)

(assert (=> start!40774 (= tp!38153 b_and!18851)))

(declare-fun res!269384 () Bool)

(declare-fun e!264810 () Bool)

(assert (=> start!40774 (=> (not res!269384) (not e!264810))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28026 0))(
  ( (array!28027 (arr!13457 (Array (_ BitVec 32) (_ BitVec 64))) (size!13809 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28026)

(assert (=> start!40774 (= res!269384 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13809 _keys!709))))))

(assert (=> start!40774 e!264810))

(declare-fun tp_is_empty!12115 () Bool)

(assert (=> start!40774 tp_is_empty!12115))

(assert (=> start!40774 tp!38153))

(assert (=> start!40774 true))

(declare-datatypes ((V!17259 0))(
  ( (V!17260 (val!6102 Int)) )
))
(declare-datatypes ((ValueCell!5714 0))(
  ( (ValueCellFull!5714 (v!8362 V!17259)) (EmptyCell!5714) )
))
(declare-datatypes ((array!28028 0))(
  ( (array!28029 (arr!13458 (Array (_ BitVec 32) ValueCell!5714)) (size!13810 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28028)

(declare-fun e!264804 () Bool)

(declare-fun array_inv!9824 (array!28028) Bool)

(assert (=> start!40774 (and (array_inv!9824 _values!549) e!264804)))

(declare-fun array_inv!9825 (array!28026) Bool)

(assert (=> start!40774 (array_inv!9825 _keys!709)))

(declare-fun b!452233 () Bool)

(declare-fun res!269386 () Bool)

(assert (=> b!452233 (=> (not res!269386) (not e!264810))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28026 (_ BitVec 32)) Bool)

(assert (=> b!452233 (= res!269386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452234 () Bool)

(declare-fun e!264811 () Bool)

(declare-fun e!264805 () Bool)

(assert (=> b!452234 (= e!264811 (not e!264805))))

(declare-fun res!269373 () Bool)

(assert (=> b!452234 (=> res!269373 e!264805)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452234 (= res!269373 (validKeyInArray!0 (select (arr!13457 _keys!709) from!863)))))

(declare-fun e!264808 () Bool)

(assert (=> b!452234 e!264808))

(declare-fun c!56087 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452234 (= c!56087 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17259)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17259)

(declare-fun v!412 () V!17259)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13207 0))(
  ( (Unit!13208) )
))
(declare-fun lt!205177 () Unit!13207)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 (array!28026 array!28028 (_ BitVec 32) (_ BitVec 32) V!17259 V!17259 (_ BitVec 32) (_ BitVec 64) V!17259 (_ BitVec 32) Int) Unit!13207)

(assert (=> b!452234 (= lt!205177 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!205169 () array!28026)

(declare-fun bm!29927 () Bool)

(declare-fun lt!205173 () array!28028)

(declare-datatypes ((tuple2!7932 0))(
  ( (tuple2!7933 (_1!3977 (_ BitVec 64)) (_2!3977 V!17259)) )
))
(declare-datatypes ((List!8000 0))(
  ( (Nil!7997) (Cons!7996 (h!8852 tuple2!7932) (t!13792 List!8000)) )
))
(declare-datatypes ((ListLongMap!6847 0))(
  ( (ListLongMap!6848 (toList!3439 List!8000)) )
))
(declare-fun call!29930 () ListLongMap!6847)

(declare-fun getCurrentListMapNoExtraKeys!1668 (array!28026 array!28028 (_ BitVec 32) (_ BitVec 32) V!17259 V!17259 (_ BitVec 32) Int) ListLongMap!6847)

(assert (=> bm!29927 (= call!29930 (getCurrentListMapNoExtraKeys!1668 (ite c!56087 lt!205169 _keys!709) (ite c!56087 lt!205173 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452235 () Bool)

(declare-fun call!29931 () ListLongMap!6847)

(assert (=> b!452235 (= e!264808 (= call!29931 call!29930))))

(declare-fun b!452236 () Bool)

(assert (=> b!452236 (= e!264805 true)))

(declare-fun lt!205170 () V!17259)

(declare-fun lt!205174 () ListLongMap!6847)

(declare-fun lt!205178 () tuple2!7932)

(declare-fun +!1564 (ListLongMap!6847 tuple2!7932) ListLongMap!6847)

(assert (=> b!452236 (= (+!1564 lt!205174 lt!205178) (+!1564 (+!1564 lt!205174 (tuple2!7933 k0!794 lt!205170)) lt!205178))))

(declare-fun lt!205168 () V!17259)

(assert (=> b!452236 (= lt!205178 (tuple2!7933 k0!794 lt!205168))))

(declare-fun lt!205172 () Unit!13207)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!80 (ListLongMap!6847 (_ BitVec 64) V!17259 V!17259) Unit!13207)

(assert (=> b!452236 (= lt!205172 (addSameAsAddTwiceSameKeyDiffValues!80 lt!205174 k0!794 lt!205170 lt!205168))))

(declare-fun lt!205171 () V!17259)

(declare-fun get!6639 (ValueCell!5714 V!17259) V!17259)

(assert (=> b!452236 (= lt!205170 (get!6639 (select (arr!13458 _values!549) from!863) lt!205171))))

(declare-fun lt!205175 () ListLongMap!6847)

(assert (=> b!452236 (= lt!205175 (+!1564 lt!205174 (tuple2!7933 (select (arr!13457 lt!205169) from!863) lt!205168)))))

(assert (=> b!452236 (= lt!205168 (get!6639 (select (store (arr!13458 _values!549) i!563 (ValueCellFull!5714 v!412)) from!863) lt!205171))))

(declare-fun dynLambda!862 (Int (_ BitVec 64)) V!17259)

(assert (=> b!452236 (= lt!205171 (dynLambda!862 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452236 (= lt!205174 (getCurrentListMapNoExtraKeys!1668 lt!205169 lt!205173 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452237 () Bool)

(declare-fun e!264807 () Bool)

(assert (=> b!452237 (= e!264807 e!264811)))

(declare-fun res!269380 () Bool)

(assert (=> b!452237 (=> (not res!269380) (not e!264811))))

(assert (=> b!452237 (= res!269380 (= from!863 i!563))))

(assert (=> b!452237 (= lt!205175 (getCurrentListMapNoExtraKeys!1668 lt!205169 lt!205173 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452237 (= lt!205173 (array!28029 (store (arr!13458 _values!549) i!563 (ValueCellFull!5714 v!412)) (size!13810 _values!549)))))

(declare-fun lt!205176 () ListLongMap!6847)

(assert (=> b!452237 (= lt!205176 (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452238 () Bool)

(assert (=> b!452238 (= e!264810 e!264807)))

(declare-fun res!269382 () Bool)

(assert (=> b!452238 (=> (not res!269382) (not e!264807))))

(assert (=> b!452238 (= res!269382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205169 mask!1025))))

(assert (=> b!452238 (= lt!205169 (array!28027 (store (arr!13457 _keys!709) i!563 k0!794) (size!13809 _keys!709)))))

(declare-fun b!452239 () Bool)

(declare-fun res!269377 () Bool)

(assert (=> b!452239 (=> (not res!269377) (not e!264810))))

(assert (=> b!452239 (= res!269377 (and (= (size!13810 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13809 _keys!709) (size!13810 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19809 () Bool)

(declare-fun mapRes!19809 () Bool)

(assert (=> mapIsEmpty!19809 mapRes!19809))

(declare-fun b!452240 () Bool)

(declare-fun res!269381 () Bool)

(assert (=> b!452240 (=> (not res!269381) (not e!264810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452240 (= res!269381 (validMask!0 mask!1025))))

(declare-fun b!452241 () Bool)

(assert (=> b!452241 (= e!264808 (= call!29930 (+!1564 call!29931 (tuple2!7933 k0!794 v!412))))))

(declare-fun b!452242 () Bool)

(declare-fun res!269383 () Bool)

(assert (=> b!452242 (=> (not res!269383) (not e!264807))))

(assert (=> b!452242 (= res!269383 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19809 () Bool)

(declare-fun tp!38154 () Bool)

(declare-fun e!264809 () Bool)

(assert (=> mapNonEmpty!19809 (= mapRes!19809 (and tp!38154 e!264809))))

(declare-fun mapValue!19809 () ValueCell!5714)

(declare-fun mapRest!19809 () (Array (_ BitVec 32) ValueCell!5714))

(declare-fun mapKey!19809 () (_ BitVec 32))

(assert (=> mapNonEmpty!19809 (= (arr!13458 _values!549) (store mapRest!19809 mapKey!19809 mapValue!19809))))

(declare-fun b!452243 () Bool)

(declare-fun res!269375 () Bool)

(assert (=> b!452243 (=> (not res!269375) (not e!264810))))

(declare-fun arrayContainsKey!0 (array!28026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452243 (= res!269375 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452244 () Bool)

(declare-fun e!264812 () Bool)

(assert (=> b!452244 (= e!264804 (and e!264812 mapRes!19809))))

(declare-fun condMapEmpty!19809 () Bool)

(declare-fun mapDefault!19809 () ValueCell!5714)

(assert (=> b!452244 (= condMapEmpty!19809 (= (arr!13458 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5714)) mapDefault!19809)))))

(declare-fun b!452245 () Bool)

(declare-fun res!269379 () Bool)

(assert (=> b!452245 (=> (not res!269379) (not e!264807))))

(declare-datatypes ((List!8001 0))(
  ( (Nil!7998) (Cons!7997 (h!8853 (_ BitVec 64)) (t!13793 List!8001)) )
))
(declare-fun arrayNoDuplicates!0 (array!28026 (_ BitVec 32) List!8001) Bool)

(assert (=> b!452245 (= res!269379 (arrayNoDuplicates!0 lt!205169 #b00000000000000000000000000000000 Nil!7998))))

(declare-fun b!452246 () Bool)

(declare-fun res!269385 () Bool)

(assert (=> b!452246 (=> (not res!269385) (not e!264810))))

(assert (=> b!452246 (= res!269385 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7998))))

(declare-fun b!452247 () Bool)

(assert (=> b!452247 (= e!264812 tp_is_empty!12115)))

(declare-fun b!452248 () Bool)

(declare-fun res!269378 () Bool)

(assert (=> b!452248 (=> (not res!269378) (not e!264810))))

(assert (=> b!452248 (= res!269378 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13809 _keys!709))))))

(declare-fun b!452249 () Bool)

(declare-fun res!269374 () Bool)

(assert (=> b!452249 (=> (not res!269374) (not e!264810))))

(assert (=> b!452249 (= res!269374 (or (= (select (arr!13457 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13457 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452250 () Bool)

(assert (=> b!452250 (= e!264809 tp_is_empty!12115)))

(declare-fun b!452251 () Bool)

(declare-fun res!269376 () Bool)

(assert (=> b!452251 (=> (not res!269376) (not e!264810))))

(assert (=> b!452251 (= res!269376 (validKeyInArray!0 k0!794))))

(declare-fun bm!29928 () Bool)

(assert (=> bm!29928 (= call!29931 (getCurrentListMapNoExtraKeys!1668 (ite c!56087 _keys!709 lt!205169) (ite c!56087 _values!549 lt!205173) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40774 res!269384) b!452240))

(assert (= (and b!452240 res!269381) b!452239))

(assert (= (and b!452239 res!269377) b!452233))

(assert (= (and b!452233 res!269386) b!452246))

(assert (= (and b!452246 res!269385) b!452248))

(assert (= (and b!452248 res!269378) b!452251))

(assert (= (and b!452251 res!269376) b!452249))

(assert (= (and b!452249 res!269374) b!452243))

(assert (= (and b!452243 res!269375) b!452238))

(assert (= (and b!452238 res!269382) b!452245))

(assert (= (and b!452245 res!269379) b!452242))

(assert (= (and b!452242 res!269383) b!452237))

(assert (= (and b!452237 res!269380) b!452234))

(assert (= (and b!452234 c!56087) b!452241))

(assert (= (and b!452234 (not c!56087)) b!452235))

(assert (= (or b!452241 b!452235) bm!29927))

(assert (= (or b!452241 b!452235) bm!29928))

(assert (= (and b!452234 (not res!269373)) b!452236))

(assert (= (and b!452244 condMapEmpty!19809) mapIsEmpty!19809))

(assert (= (and b!452244 (not condMapEmpty!19809)) mapNonEmpty!19809))

(get-info :version)

(assert (= (and mapNonEmpty!19809 ((_ is ValueCellFull!5714) mapValue!19809)) b!452250))

(assert (= (and b!452244 ((_ is ValueCellFull!5714) mapDefault!19809)) b!452247))

(assert (= start!40774 b!452244))

(declare-fun b_lambda!9569 () Bool)

(assert (=> (not b_lambda!9569) (not b!452236)))

(declare-fun t!13791 () Bool)

(declare-fun tb!3749 () Bool)

(assert (=> (and start!40774 (= defaultEntry!557 defaultEntry!557) t!13791) tb!3749))

(declare-fun result!7043 () Bool)

(assert (=> tb!3749 (= result!7043 tp_is_empty!12115)))

(assert (=> b!452236 t!13791))

(declare-fun b_and!18853 () Bool)

(assert (= b_and!18851 (and (=> t!13791 result!7043) b_and!18853)))

(declare-fun m!436179 () Bool)

(assert (=> b!452246 m!436179))

(declare-fun m!436181 () Bool)

(assert (=> b!452233 m!436181))

(declare-fun m!436183 () Bool)

(assert (=> mapNonEmpty!19809 m!436183))

(declare-fun m!436185 () Bool)

(assert (=> b!452251 m!436185))

(declare-fun m!436187 () Bool)

(assert (=> b!452234 m!436187))

(assert (=> b!452234 m!436187))

(declare-fun m!436189 () Bool)

(assert (=> b!452234 m!436189))

(declare-fun m!436191 () Bool)

(assert (=> b!452234 m!436191))

(declare-fun m!436193 () Bool)

(assert (=> b!452245 m!436193))

(declare-fun m!436195 () Bool)

(assert (=> b!452243 m!436195))

(declare-fun m!436197 () Bool)

(assert (=> b!452240 m!436197))

(declare-fun m!436199 () Bool)

(assert (=> b!452249 m!436199))

(declare-fun m!436201 () Bool)

(assert (=> b!452238 m!436201))

(declare-fun m!436203 () Bool)

(assert (=> b!452238 m!436203))

(declare-fun m!436205 () Bool)

(assert (=> bm!29928 m!436205))

(declare-fun m!436207 () Bool)

(assert (=> b!452236 m!436207))

(declare-fun m!436209 () Bool)

(assert (=> b!452236 m!436209))

(declare-fun m!436211 () Bool)

(assert (=> b!452236 m!436211))

(declare-fun m!436213 () Bool)

(assert (=> b!452236 m!436213))

(declare-fun m!436215 () Bool)

(assert (=> b!452236 m!436215))

(declare-fun m!436217 () Bool)

(assert (=> b!452236 m!436217))

(assert (=> b!452236 m!436211))

(declare-fun m!436219 () Bool)

(assert (=> b!452236 m!436219))

(assert (=> b!452236 m!436217))

(declare-fun m!436221 () Bool)

(assert (=> b!452236 m!436221))

(declare-fun m!436223 () Bool)

(assert (=> b!452236 m!436223))

(declare-fun m!436225 () Bool)

(assert (=> b!452236 m!436225))

(declare-fun m!436227 () Bool)

(assert (=> b!452236 m!436227))

(assert (=> b!452236 m!436215))

(declare-fun m!436229 () Bool)

(assert (=> b!452236 m!436229))

(declare-fun m!436231 () Bool)

(assert (=> b!452236 m!436231))

(declare-fun m!436233 () Bool)

(assert (=> b!452241 m!436233))

(declare-fun m!436235 () Bool)

(assert (=> bm!29927 m!436235))

(declare-fun m!436237 () Bool)

(assert (=> b!452237 m!436237))

(assert (=> b!452237 m!436225))

(declare-fun m!436239 () Bool)

(assert (=> b!452237 m!436239))

(declare-fun m!436241 () Bool)

(assert (=> start!40774 m!436241))

(declare-fun m!436243 () Bool)

(assert (=> start!40774 m!436243))

(check-sat (not b!452238) (not b!452245) (not b_next!10777) (not b!452251) (not b!452240) (not bm!29927) tp_is_empty!12115 (not b!452241) (not b!452233) (not b!452243) (not start!40774) (not b_lambda!9569) (not b!452234) (not bm!29928) (not b!452246) (not b!452236) b_and!18853 (not mapNonEmpty!19809) (not b!452237))
(check-sat b_and!18853 (not b_next!10777))
