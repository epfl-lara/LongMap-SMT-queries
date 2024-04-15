; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40774 () Bool)

(assert start!40774)

(declare-fun b_free!10777 () Bool)

(declare-fun b_next!10777 () Bool)

(assert (=> start!40774 (= b_free!10777 (not b_next!10777))))

(declare-fun tp!38153 () Bool)

(declare-fun b_and!18815 () Bool)

(assert (=> start!40774 (= tp!38153 b_and!18815)))

(declare-fun b!452023 () Bool)

(declare-fun res!269257 () Bool)

(declare-fun e!264669 () Bool)

(assert (=> b!452023 (=> (not res!269257) (not e!264669))))

(declare-datatypes ((array!28027 0))(
  ( (array!28028 (arr!13458 (Array (_ BitVec 32) (_ BitVec 64))) (size!13811 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28027)

(declare-datatypes ((List!8098 0))(
  ( (Nil!8095) (Cons!8094 (h!8950 (_ BitVec 64)) (t!13889 List!8098)) )
))
(declare-fun arrayNoDuplicates!0 (array!28027 (_ BitVec 32) List!8098) Bool)

(assert (=> b!452023 (= res!269257 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8095))))

(declare-fun b!452024 () Bool)

(declare-fun res!269258 () Bool)

(declare-fun e!264676 () Bool)

(assert (=> b!452024 (=> (not res!269258) (not e!264676))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452024 (= res!269258 (bvsle from!863 i!563))))

(declare-datatypes ((V!17259 0))(
  ( (V!17260 (val!6102 Int)) )
))
(declare-datatypes ((tuple2!8038 0))(
  ( (tuple2!8039 (_1!4030 (_ BitVec 64)) (_2!4030 V!17259)) )
))
(declare-datatypes ((List!8099 0))(
  ( (Nil!8096) (Cons!8095 (h!8951 tuple2!8038) (t!13890 List!8099)) )
))
(declare-datatypes ((ListLongMap!6941 0))(
  ( (ListLongMap!6942 (toList!3486 List!8099)) )
))
(declare-fun call!29920 () ListLongMap!6941)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!452025 () Bool)

(declare-fun v!412 () V!17259)

(declare-fun call!29919 () ListLongMap!6941)

(declare-fun e!264672 () Bool)

(declare-fun +!1584 (ListLongMap!6941 tuple2!8038) ListLongMap!6941)

(assert (=> b!452025 (= e!264672 (= call!29919 (+!1584 call!29920 (tuple2!8039 k0!794 v!412))))))

(declare-fun b!452026 () Bool)

(declare-fun res!269259 () Bool)

(assert (=> b!452026 (=> (not res!269259) (not e!264676))))

(declare-fun lt!204932 () array!28027)

(assert (=> b!452026 (= res!269259 (arrayNoDuplicates!0 lt!204932 #b00000000000000000000000000000000 Nil!8095))))

(declare-fun b!452027 () Bool)

(declare-fun e!264677 () Bool)

(declare-fun tp_is_empty!12115 () Bool)

(assert (=> b!452027 (= e!264677 tp_is_empty!12115)))

(declare-fun b!452028 () Bool)

(declare-fun e!264670 () Bool)

(assert (=> b!452028 (= e!264670 true)))

(declare-fun lt!204927 () tuple2!8038)

(declare-fun lt!204925 () ListLongMap!6941)

(declare-fun lt!204931 () V!17259)

(assert (=> b!452028 (= (+!1584 lt!204925 lt!204927) (+!1584 (+!1584 lt!204925 (tuple2!8039 k0!794 lt!204931)) lt!204927))))

(declare-fun lt!204928 () V!17259)

(assert (=> b!452028 (= lt!204927 (tuple2!8039 k0!794 lt!204928))))

(declare-datatypes ((Unit!13189 0))(
  ( (Unit!13190) )
))
(declare-fun lt!204923 () Unit!13189)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!80 (ListLongMap!6941 (_ BitVec 64) V!17259 V!17259) Unit!13189)

(assert (=> b!452028 (= lt!204923 (addSameAsAddTwiceSameKeyDiffValues!80 lt!204925 k0!794 lt!204931 lt!204928))))

(declare-datatypes ((ValueCell!5714 0))(
  ( (ValueCellFull!5714 (v!8355 V!17259)) (EmptyCell!5714) )
))
(declare-datatypes ((array!28029 0))(
  ( (array!28030 (arr!13459 (Array (_ BitVec 32) ValueCell!5714)) (size!13812 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28029)

(declare-fun lt!204929 () V!17259)

(declare-fun get!6633 (ValueCell!5714 V!17259) V!17259)

(assert (=> b!452028 (= lt!204931 (get!6633 (select (arr!13459 _values!549) from!863) lt!204929))))

(declare-fun lt!204930 () ListLongMap!6941)

(assert (=> b!452028 (= lt!204930 (+!1584 lt!204925 (tuple2!8039 (select (arr!13458 lt!204932) from!863) lt!204928)))))

(assert (=> b!452028 (= lt!204928 (get!6633 (select (store (arr!13459 _values!549) i!563 (ValueCellFull!5714 v!412)) from!863) lt!204929))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!859 (Int (_ BitVec 64)) V!17259)

(assert (=> b!452028 (= lt!204929 (dynLambda!859 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!17259)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17259)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!204922 () array!28029)

(declare-fun getCurrentListMapNoExtraKeys!1682 (array!28027 array!28029 (_ BitVec 32) (_ BitVec 32) V!17259 V!17259 (_ BitVec 32) Int) ListLongMap!6941)

(assert (=> b!452028 (= lt!204925 (getCurrentListMapNoExtraKeys!1682 lt!204932 lt!204922 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269255 () Bool)

(assert (=> start!40774 (=> (not res!269255) (not e!264669))))

(assert (=> start!40774 (= res!269255 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13811 _keys!709))))))

(assert (=> start!40774 e!264669))

(assert (=> start!40774 tp_is_empty!12115))

(assert (=> start!40774 tp!38153))

(assert (=> start!40774 true))

(declare-fun e!264673 () Bool)

(declare-fun array_inv!9808 (array!28029) Bool)

(assert (=> start!40774 (and (array_inv!9808 _values!549) e!264673)))

(declare-fun array_inv!9809 (array!28027) Bool)

(assert (=> start!40774 (array_inv!9809 _keys!709)))

(declare-fun mapNonEmpty!19809 () Bool)

(declare-fun mapRes!19809 () Bool)

(declare-fun tp!38154 () Bool)

(declare-fun e!264671 () Bool)

(assert (=> mapNonEmpty!19809 (= mapRes!19809 (and tp!38154 e!264671))))

(declare-fun mapKey!19809 () (_ BitVec 32))

(declare-fun mapValue!19809 () ValueCell!5714)

(declare-fun mapRest!19809 () (Array (_ BitVec 32) ValueCell!5714))

(assert (=> mapNonEmpty!19809 (= (arr!13459 _values!549) (store mapRest!19809 mapKey!19809 mapValue!19809))))

(declare-fun b!452029 () Bool)

(declare-fun res!269253 () Bool)

(assert (=> b!452029 (=> (not res!269253) (not e!264669))))

(assert (=> b!452029 (= res!269253 (or (= (select (arr!13458 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13458 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452030 () Bool)

(declare-fun e!264674 () Bool)

(assert (=> b!452030 (= e!264674 (not e!264670))))

(declare-fun res!269254 () Bool)

(assert (=> b!452030 (=> res!269254 e!264670)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452030 (= res!269254 (validKeyInArray!0 (select (arr!13458 _keys!709) from!863)))))

(assert (=> b!452030 e!264672))

(declare-fun c!56043 () Bool)

(assert (=> b!452030 (= c!56043 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!204926 () Unit!13189)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!722 (array!28027 array!28029 (_ BitVec 32) (_ BitVec 32) V!17259 V!17259 (_ BitVec 32) (_ BitVec 64) V!17259 (_ BitVec 32) Int) Unit!13189)

(assert (=> b!452030 (= lt!204926 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!722 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19809 () Bool)

(assert (=> mapIsEmpty!19809 mapRes!19809))

(declare-fun b!452031 () Bool)

(declare-fun res!269251 () Bool)

(assert (=> b!452031 (=> (not res!269251) (not e!264669))))

(assert (=> b!452031 (= res!269251 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13811 _keys!709))))))

(declare-fun bm!29916 () Bool)

(assert (=> bm!29916 (= call!29920 (getCurrentListMapNoExtraKeys!1682 (ite c!56043 _keys!709 lt!204932) (ite c!56043 _values!549 lt!204922) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452032 () Bool)

(declare-fun res!269264 () Bool)

(assert (=> b!452032 (=> (not res!269264) (not e!264669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28027 (_ BitVec 32)) Bool)

(assert (=> b!452032 (= res!269264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452033 () Bool)

(declare-fun res!269252 () Bool)

(assert (=> b!452033 (=> (not res!269252) (not e!264669))))

(declare-fun arrayContainsKey!0 (array!28027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452033 (= res!269252 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452034 () Bool)

(assert (=> b!452034 (= e!264676 e!264674)))

(declare-fun res!269263 () Bool)

(assert (=> b!452034 (=> (not res!269263) (not e!264674))))

(assert (=> b!452034 (= res!269263 (= from!863 i!563))))

(assert (=> b!452034 (= lt!204930 (getCurrentListMapNoExtraKeys!1682 lt!204932 lt!204922 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452034 (= lt!204922 (array!28030 (store (arr!13459 _values!549) i!563 (ValueCellFull!5714 v!412)) (size!13812 _values!549)))))

(declare-fun lt!204924 () ListLongMap!6941)

(assert (=> b!452034 (= lt!204924 (getCurrentListMapNoExtraKeys!1682 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452035 () Bool)

(assert (=> b!452035 (= e!264673 (and e!264677 mapRes!19809))))

(declare-fun condMapEmpty!19809 () Bool)

(declare-fun mapDefault!19809 () ValueCell!5714)

(assert (=> b!452035 (= condMapEmpty!19809 (= (arr!13459 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5714)) mapDefault!19809)))))

(declare-fun b!452036 () Bool)

(assert (=> b!452036 (= e!264669 e!264676)))

(declare-fun res!269256 () Bool)

(assert (=> b!452036 (=> (not res!269256) (not e!264676))))

(assert (=> b!452036 (= res!269256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204932 mask!1025))))

(assert (=> b!452036 (= lt!204932 (array!28028 (store (arr!13458 _keys!709) i!563 k0!794) (size!13811 _keys!709)))))

(declare-fun b!452037 () Bool)

(declare-fun res!269260 () Bool)

(assert (=> b!452037 (=> (not res!269260) (not e!264669))))

(assert (=> b!452037 (= res!269260 (validKeyInArray!0 k0!794))))

(declare-fun b!452038 () Bool)

(declare-fun res!269262 () Bool)

(assert (=> b!452038 (=> (not res!269262) (not e!264669))))

(assert (=> b!452038 (= res!269262 (and (= (size!13812 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13811 _keys!709) (size!13812 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29917 () Bool)

(assert (=> bm!29917 (= call!29919 (getCurrentListMapNoExtraKeys!1682 (ite c!56043 lt!204932 _keys!709) (ite c!56043 lt!204922 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452039 () Bool)

(assert (=> b!452039 (= e!264671 tp_is_empty!12115)))

(declare-fun b!452040 () Bool)

(declare-fun res!269261 () Bool)

(assert (=> b!452040 (=> (not res!269261) (not e!264669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452040 (= res!269261 (validMask!0 mask!1025))))

(declare-fun b!452041 () Bool)

(assert (=> b!452041 (= e!264672 (= call!29920 call!29919))))

(assert (= (and start!40774 res!269255) b!452040))

(assert (= (and b!452040 res!269261) b!452038))

(assert (= (and b!452038 res!269262) b!452032))

(assert (= (and b!452032 res!269264) b!452023))

(assert (= (and b!452023 res!269257) b!452031))

(assert (= (and b!452031 res!269251) b!452037))

(assert (= (and b!452037 res!269260) b!452029))

(assert (= (and b!452029 res!269253) b!452033))

(assert (= (and b!452033 res!269252) b!452036))

(assert (= (and b!452036 res!269256) b!452026))

(assert (= (and b!452026 res!269259) b!452024))

(assert (= (and b!452024 res!269258) b!452034))

(assert (= (and b!452034 res!269263) b!452030))

(assert (= (and b!452030 c!56043) b!452025))

(assert (= (and b!452030 (not c!56043)) b!452041))

(assert (= (or b!452025 b!452041) bm!29917))

(assert (= (or b!452025 b!452041) bm!29916))

(assert (= (and b!452030 (not res!269254)) b!452028))

(assert (= (and b!452035 condMapEmpty!19809) mapIsEmpty!19809))

(assert (= (and b!452035 (not condMapEmpty!19809)) mapNonEmpty!19809))

(get-info :version)

(assert (= (and mapNonEmpty!19809 ((_ is ValueCellFull!5714) mapValue!19809)) b!452039))

(assert (= (and b!452035 ((_ is ValueCellFull!5714) mapDefault!19809)) b!452027))

(assert (= start!40774 b!452035))

(declare-fun b_lambda!9537 () Bool)

(assert (=> (not b_lambda!9537) (not b!452028)))

(declare-fun t!13888 () Bool)

(declare-fun tb!3749 () Bool)

(assert (=> (and start!40774 (= defaultEntry!557 defaultEntry!557) t!13888) tb!3749))

(declare-fun result!7043 () Bool)

(assert (=> tb!3749 (= result!7043 tp_is_empty!12115)))

(assert (=> b!452028 t!13888))

(declare-fun b_and!18817 () Bool)

(assert (= b_and!18815 (and (=> t!13888 result!7043) b_and!18817)))

(declare-fun m!435263 () Bool)

(assert (=> b!452025 m!435263))

(declare-fun m!435265 () Bool)

(assert (=> b!452023 m!435265))

(declare-fun m!435267 () Bool)

(assert (=> b!452026 m!435267))

(declare-fun m!435269 () Bool)

(assert (=> start!40774 m!435269))

(declare-fun m!435271 () Bool)

(assert (=> start!40774 m!435271))

(declare-fun m!435273 () Bool)

(assert (=> bm!29917 m!435273))

(declare-fun m!435275 () Bool)

(assert (=> b!452034 m!435275))

(declare-fun m!435277 () Bool)

(assert (=> b!452034 m!435277))

(declare-fun m!435279 () Bool)

(assert (=> b!452034 m!435279))

(declare-fun m!435281 () Bool)

(assert (=> b!452028 m!435281))

(declare-fun m!435283 () Bool)

(assert (=> b!452028 m!435283))

(declare-fun m!435285 () Bool)

(assert (=> b!452028 m!435285))

(declare-fun m!435287 () Bool)

(assert (=> b!452028 m!435287))

(declare-fun m!435289 () Bool)

(assert (=> b!452028 m!435289))

(declare-fun m!435291 () Bool)

(assert (=> b!452028 m!435291))

(declare-fun m!435293 () Bool)

(assert (=> b!452028 m!435293))

(declare-fun m!435295 () Bool)

(assert (=> b!452028 m!435295))

(assert (=> b!452028 m!435293))

(declare-fun m!435297 () Bool)

(assert (=> b!452028 m!435297))

(declare-fun m!435299 () Bool)

(assert (=> b!452028 m!435299))

(assert (=> b!452028 m!435277))

(declare-fun m!435301 () Bool)

(assert (=> b!452028 m!435301))

(assert (=> b!452028 m!435291))

(declare-fun m!435303 () Bool)

(assert (=> b!452028 m!435303))

(assert (=> b!452028 m!435287))

(declare-fun m!435305 () Bool)

(assert (=> bm!29916 m!435305))

(declare-fun m!435307 () Bool)

(assert (=> mapNonEmpty!19809 m!435307))

(declare-fun m!435309 () Bool)

(assert (=> b!452030 m!435309))

(assert (=> b!452030 m!435309))

(declare-fun m!435311 () Bool)

(assert (=> b!452030 m!435311))

(declare-fun m!435313 () Bool)

(assert (=> b!452030 m!435313))

(declare-fun m!435315 () Bool)

(assert (=> b!452033 m!435315))

(declare-fun m!435317 () Bool)

(assert (=> b!452040 m!435317))

(declare-fun m!435319 () Bool)

(assert (=> b!452029 m!435319))

(declare-fun m!435321 () Bool)

(assert (=> b!452032 m!435321))

(declare-fun m!435323 () Bool)

(assert (=> b!452036 m!435323))

(declare-fun m!435325 () Bool)

(assert (=> b!452036 m!435325))

(declare-fun m!435327 () Bool)

(assert (=> b!452037 m!435327))

(check-sat (not b!452037) (not b!452023) (not b_next!10777) (not b_lambda!9537) (not b!452028) (not start!40774) (not b!452032) (not b!452034) (not mapNonEmpty!19809) (not b!452033) b_and!18817 (not bm!29916) (not b!452036) tp_is_empty!12115 (not b!452026) (not b!452025) (not bm!29917) (not b!452040) (not b!452030))
(check-sat b_and!18817 (not b_next!10777))
