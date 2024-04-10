; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21090 () Bool)

(assert start!21090)

(declare-fun b_free!5601 () Bool)

(declare-fun b_next!5601 () Bool)

(assert (=> start!21090 (= b_free!5601 (not b_next!5601))))

(declare-fun tp!19865 () Bool)

(declare-fun b_and!12431 () Bool)

(assert (=> start!21090 (= tp!19865 b_and!12431)))

(declare-fun b!212230 () Bool)

(declare-fun e!138096 () Bool)

(declare-fun e!138097 () Bool)

(assert (=> b!212230 (= e!138096 (not e!138097))))

(declare-fun res!103765 () Bool)

(assert (=> b!212230 (=> res!103765 e!138097)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212230 (= res!103765 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6931 0))(
  ( (V!6932 (val!2776 Int)) )
))
(declare-datatypes ((ValueCell!2388 0))(
  ( (ValueCellFull!2388 (v!4774 V!6931)) (EmptyCell!2388) )
))
(declare-datatypes ((array!10129 0))(
  ( (array!10130 (arr!4808 (Array (_ BitVec 32) ValueCell!2388)) (size!5133 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10129)

(declare-datatypes ((tuple2!4202 0))(
  ( (tuple2!4203 (_1!2112 (_ BitVec 64)) (_2!2112 V!6931)) )
))
(declare-datatypes ((List!3091 0))(
  ( (Nil!3088) (Cons!3087 (h!3729 tuple2!4202) (t!8036 List!3091)) )
))
(declare-datatypes ((ListLongMap!3115 0))(
  ( (ListLongMap!3116 (toList!1573 List!3091)) )
))
(declare-fun lt!109353 () ListLongMap!3115)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6931)

(declare-datatypes ((array!10131 0))(
  ( (array!10132 (arr!4809 (Array (_ BitVec 32) (_ BitVec 64))) (size!5134 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10131)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6931)

(declare-fun getCurrentListMap!1106 (array!10131 array!10129 (_ BitVec 32) (_ BitVec 32) V!6931 V!6931 (_ BitVec 32) Int) ListLongMap!3115)

(assert (=> b!212230 (= lt!109353 (getCurrentListMap!1106 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109350 () array!10129)

(declare-fun lt!109351 () ListLongMap!3115)

(assert (=> b!212230 (= lt!109351 (getCurrentListMap!1106 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109354 () ListLongMap!3115)

(declare-fun lt!109355 () ListLongMap!3115)

(assert (=> b!212230 (and (= lt!109354 lt!109355) (= lt!109355 lt!109354))))

(declare-fun v!520 () V!6931)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!109356 () ListLongMap!3115)

(declare-fun +!576 (ListLongMap!3115 tuple2!4202) ListLongMap!3115)

(assert (=> b!212230 (= lt!109355 (+!576 lt!109356 (tuple2!4203 k0!843 v!520)))))

(declare-datatypes ((Unit!6446 0))(
  ( (Unit!6447) )
))
(declare-fun lt!109352 () Unit!6446)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!223 (array!10131 array!10129 (_ BitVec 32) (_ BitVec 32) V!6931 V!6931 (_ BitVec 32) (_ BitVec 64) V!6931 (_ BitVec 32) Int) Unit!6446)

(assert (=> b!212230 (= lt!109352 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!223 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!508 (array!10131 array!10129 (_ BitVec 32) (_ BitVec 32) V!6931 V!6931 (_ BitVec 32) Int) ListLongMap!3115)

(assert (=> b!212230 (= lt!109354 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212230 (= lt!109350 (array!10130 (store (arr!4808 _values!649) i!601 (ValueCellFull!2388 v!520)) (size!5133 _values!649)))))

(assert (=> b!212230 (= lt!109356 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212231 () Bool)

(declare-fun res!103759 () Bool)

(assert (=> b!212231 (=> (not res!103759) (not e!138096))))

(assert (=> b!212231 (= res!103759 (= (select (arr!4809 _keys!825) i!601) k0!843))))

(declare-fun b!212232 () Bool)

(declare-fun e!138101 () Bool)

(declare-fun tp_is_empty!5463 () Bool)

(assert (=> b!212232 (= e!138101 tp_is_empty!5463)))

(declare-fun b!212233 () Bool)

(declare-fun res!103758 () Bool)

(assert (=> b!212233 (=> (not res!103758) (not e!138096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212233 (= res!103758 (validKeyInArray!0 k0!843))))

(declare-fun b!212234 () Bool)

(declare-fun res!103763 () Bool)

(assert (=> b!212234 (=> (not res!103763) (not e!138096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10131 (_ BitVec 32)) Bool)

(assert (=> b!212234 (= res!103763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212235 () Bool)

(declare-fun e!138100 () Bool)

(assert (=> b!212235 (= e!138100 tp_is_empty!5463)))

(declare-fun b!212236 () Bool)

(declare-fun res!103762 () Bool)

(assert (=> b!212236 (=> (not res!103762) (not e!138096))))

(declare-datatypes ((List!3092 0))(
  ( (Nil!3089) (Cons!3088 (h!3730 (_ BitVec 64)) (t!8037 List!3092)) )
))
(declare-fun arrayNoDuplicates!0 (array!10131 (_ BitVec 32) List!3092) Bool)

(assert (=> b!212236 (= res!103762 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3089))))

(declare-fun b!212237 () Bool)

(assert (=> b!212237 (= e!138097 (= lt!109351 (+!576 lt!109354 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212238 () Bool)

(declare-fun res!103760 () Bool)

(assert (=> b!212238 (=> (not res!103760) (not e!138096))))

(assert (=> b!212238 (= res!103760 (and (= (size!5133 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5134 _keys!825) (size!5133 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9284 () Bool)

(declare-fun mapRes!9284 () Bool)

(assert (=> mapIsEmpty!9284 mapRes!9284))

(declare-fun mapNonEmpty!9284 () Bool)

(declare-fun tp!19864 () Bool)

(assert (=> mapNonEmpty!9284 (= mapRes!9284 (and tp!19864 e!138101))))

(declare-fun mapRest!9284 () (Array (_ BitVec 32) ValueCell!2388))

(declare-fun mapValue!9284 () ValueCell!2388)

(declare-fun mapKey!9284 () (_ BitVec 32))

(assert (=> mapNonEmpty!9284 (= (arr!4808 _values!649) (store mapRest!9284 mapKey!9284 mapValue!9284))))

(declare-fun res!103764 () Bool)

(assert (=> start!21090 (=> (not res!103764) (not e!138096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21090 (= res!103764 (validMask!0 mask!1149))))

(assert (=> start!21090 e!138096))

(declare-fun e!138099 () Bool)

(declare-fun array_inv!3181 (array!10129) Bool)

(assert (=> start!21090 (and (array_inv!3181 _values!649) e!138099)))

(assert (=> start!21090 true))

(assert (=> start!21090 tp_is_empty!5463))

(declare-fun array_inv!3182 (array!10131) Bool)

(assert (=> start!21090 (array_inv!3182 _keys!825)))

(assert (=> start!21090 tp!19865))

(declare-fun b!212239 () Bool)

(declare-fun res!103761 () Bool)

(assert (=> b!212239 (=> (not res!103761) (not e!138096))))

(assert (=> b!212239 (= res!103761 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5134 _keys!825))))))

(declare-fun b!212240 () Bool)

(assert (=> b!212240 (= e!138099 (and e!138100 mapRes!9284))))

(declare-fun condMapEmpty!9284 () Bool)

(declare-fun mapDefault!9284 () ValueCell!2388)

(assert (=> b!212240 (= condMapEmpty!9284 (= (arr!4808 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2388)) mapDefault!9284)))))

(assert (= (and start!21090 res!103764) b!212238))

(assert (= (and b!212238 res!103760) b!212234))

(assert (= (and b!212234 res!103763) b!212236))

(assert (= (and b!212236 res!103762) b!212239))

(assert (= (and b!212239 res!103761) b!212233))

(assert (= (and b!212233 res!103758) b!212231))

(assert (= (and b!212231 res!103759) b!212230))

(assert (= (and b!212230 (not res!103765)) b!212237))

(assert (= (and b!212240 condMapEmpty!9284) mapIsEmpty!9284))

(assert (= (and b!212240 (not condMapEmpty!9284)) mapNonEmpty!9284))

(get-info :version)

(assert (= (and mapNonEmpty!9284 ((_ is ValueCellFull!2388) mapValue!9284)) b!212232))

(assert (= (and b!212240 ((_ is ValueCellFull!2388) mapDefault!9284)) b!212235))

(assert (= start!21090 b!212240))

(declare-fun m!240029 () Bool)

(assert (=> b!212234 m!240029))

(declare-fun m!240031 () Bool)

(assert (=> b!212233 m!240031))

(declare-fun m!240033 () Bool)

(assert (=> b!212231 m!240033))

(declare-fun m!240035 () Bool)

(assert (=> b!212230 m!240035))

(declare-fun m!240037 () Bool)

(assert (=> b!212230 m!240037))

(declare-fun m!240039 () Bool)

(assert (=> b!212230 m!240039))

(declare-fun m!240041 () Bool)

(assert (=> b!212230 m!240041))

(declare-fun m!240043 () Bool)

(assert (=> b!212230 m!240043))

(declare-fun m!240045 () Bool)

(assert (=> b!212230 m!240045))

(declare-fun m!240047 () Bool)

(assert (=> b!212230 m!240047))

(declare-fun m!240049 () Bool)

(assert (=> b!212237 m!240049))

(declare-fun m!240051 () Bool)

(assert (=> b!212236 m!240051))

(declare-fun m!240053 () Bool)

(assert (=> mapNonEmpty!9284 m!240053))

(declare-fun m!240055 () Bool)

(assert (=> start!21090 m!240055))

(declare-fun m!240057 () Bool)

(assert (=> start!21090 m!240057))

(declare-fun m!240059 () Bool)

(assert (=> start!21090 m!240059))

(check-sat (not mapNonEmpty!9284) (not b_next!5601) (not b!212234) (not b!212236) (not start!21090) (not b!212230) b_and!12431 (not b!212237) tp_is_empty!5463 (not b!212233))
(check-sat b_and!12431 (not b_next!5601))
(get-model)

(declare-fun d!58107 () Bool)

(assert (=> d!58107 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21090 d!58107))

(declare-fun d!58109 () Bool)

(assert (=> d!58109 (= (array_inv!3181 _values!649) (bvsge (size!5133 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21090 d!58109))

(declare-fun d!58111 () Bool)

(assert (=> d!58111 (= (array_inv!3182 _keys!825) (bvsge (size!5134 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21090 d!58111))

(declare-fun bm!20096 () Bool)

(declare-fun call!20100 () Bool)

(declare-fun lt!109436 () ListLongMap!3115)

(declare-fun contains!1410 (ListLongMap!3115 (_ BitVec 64)) Bool)

(assert (=> bm!20096 (= call!20100 (contains!1410 lt!109436 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212316 () Bool)

(declare-fun c!35791 () Bool)

(assert (=> b!212316 (= c!35791 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138155 () ListLongMap!3115)

(declare-fun e!138148 () ListLongMap!3115)

(assert (=> b!212316 (= e!138155 e!138148)))

(declare-fun bm!20097 () Bool)

(declare-fun call!20105 () ListLongMap!3115)

(declare-fun call!20104 () ListLongMap!3115)

(assert (=> bm!20097 (= call!20105 call!20104)))

(declare-fun b!212317 () Bool)

(declare-fun e!138157 () Bool)

(declare-fun apply!196 (ListLongMap!3115 (_ BitVec 64)) V!6931)

(assert (=> b!212317 (= e!138157 (= (apply!196 lt!109436 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212318 () Bool)

(declare-fun call!20099 () ListLongMap!3115)

(assert (=> b!212318 (= e!138155 call!20099)))

(declare-fun b!212319 () Bool)

(declare-fun e!138149 () Bool)

(declare-fun call!20103 () Bool)

(assert (=> b!212319 (= e!138149 (not call!20103))))

(declare-fun d!58113 () Bool)

(declare-fun e!138151 () Bool)

(assert (=> d!58113 e!138151))

(declare-fun res!103808 () Bool)

(assert (=> d!58113 (=> (not res!103808) (not e!138151))))

(assert (=> d!58113 (= res!103808 (or (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))))

(declare-fun lt!109441 () ListLongMap!3115)

(assert (=> d!58113 (= lt!109436 lt!109441)))

(declare-fun lt!109443 () Unit!6446)

(declare-fun e!138147 () Unit!6446)

(assert (=> d!58113 (= lt!109443 e!138147)))

(declare-fun c!35792 () Bool)

(declare-fun e!138154 () Bool)

(assert (=> d!58113 (= c!35792 e!138154)))

(declare-fun res!103816 () Bool)

(assert (=> d!58113 (=> (not res!103816) (not e!138154))))

(assert (=> d!58113 (= res!103816 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun e!138150 () ListLongMap!3115)

(assert (=> d!58113 (= lt!109441 e!138150)))

(declare-fun c!35796 () Bool)

(assert (=> d!58113 (= c!35796 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58113 (validMask!0 mask!1149)))

(assert (=> d!58113 (= (getCurrentListMap!1106 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109436)))

(declare-fun e!138152 () Bool)

(declare-fun b!212320 () Bool)

(declare-fun get!2572 (ValueCell!2388 V!6931) V!6931)

(declare-fun dynLambda!539 (Int (_ BitVec 64)) V!6931)

(assert (=> b!212320 (= e!138152 (= (apply!196 lt!109436 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)) (get!2572 (select (arr!4808 lt!109350) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5133 lt!109350)))))

(assert (=> b!212320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212321 () Bool)

(assert (=> b!212321 (= e!138148 call!20105)))

(declare-fun b!212322 () Bool)

(declare-fun e!138156 () Bool)

(assert (=> b!212322 (= e!138156 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212323 () Bool)

(assert (=> b!212323 (= e!138148 call!20099)))

(declare-fun b!212324 () Bool)

(declare-fun e!138146 () Bool)

(assert (=> b!212324 (= e!138146 e!138152)))

(declare-fun res!103812 () Bool)

(assert (=> b!212324 (=> (not res!103812) (not e!138152))))

(assert (=> b!212324 (= res!103812 (contains!1410 lt!109436 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212325 () Bool)

(declare-fun lt!109430 () Unit!6446)

(assert (=> b!212325 (= e!138147 lt!109430)))

(declare-fun lt!109440 () ListLongMap!3115)

(assert (=> b!212325 (= lt!109440 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109427 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109427 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109423 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109423 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109429 () Unit!6446)

(declare-fun addStillContains!172 (ListLongMap!3115 (_ BitVec 64) V!6931 (_ BitVec 64)) Unit!6446)

(assert (=> b!212325 (= lt!109429 (addStillContains!172 lt!109440 lt!109427 zeroValue!615 lt!109423))))

(assert (=> b!212325 (contains!1410 (+!576 lt!109440 (tuple2!4203 lt!109427 zeroValue!615)) lt!109423)))

(declare-fun lt!109439 () Unit!6446)

(assert (=> b!212325 (= lt!109439 lt!109429)))

(declare-fun lt!109432 () ListLongMap!3115)

(assert (=> b!212325 (= lt!109432 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109437 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109437 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109424 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109424 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109435 () Unit!6446)

(declare-fun addApplyDifferent!172 (ListLongMap!3115 (_ BitVec 64) V!6931 (_ BitVec 64)) Unit!6446)

(assert (=> b!212325 (= lt!109435 (addApplyDifferent!172 lt!109432 lt!109437 minValue!615 lt!109424))))

(assert (=> b!212325 (= (apply!196 (+!576 lt!109432 (tuple2!4203 lt!109437 minValue!615)) lt!109424) (apply!196 lt!109432 lt!109424))))

(declare-fun lt!109434 () Unit!6446)

(assert (=> b!212325 (= lt!109434 lt!109435)))

(declare-fun lt!109442 () ListLongMap!3115)

(assert (=> b!212325 (= lt!109442 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109438 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109438 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109422 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109422 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109428 () Unit!6446)

(assert (=> b!212325 (= lt!109428 (addApplyDifferent!172 lt!109442 lt!109438 zeroValue!615 lt!109422))))

(assert (=> b!212325 (= (apply!196 (+!576 lt!109442 (tuple2!4203 lt!109438 zeroValue!615)) lt!109422) (apply!196 lt!109442 lt!109422))))

(declare-fun lt!109425 () Unit!6446)

(assert (=> b!212325 (= lt!109425 lt!109428)))

(declare-fun lt!109426 () ListLongMap!3115)

(assert (=> b!212325 (= lt!109426 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109431 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109433 () (_ BitVec 64))

(assert (=> b!212325 (= lt!109433 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212325 (= lt!109430 (addApplyDifferent!172 lt!109426 lt!109431 minValue!615 lt!109433))))

(assert (=> b!212325 (= (apply!196 (+!576 lt!109426 (tuple2!4203 lt!109431 minValue!615)) lt!109433) (apply!196 lt!109426 lt!109433))))

(declare-fun b!212326 () Bool)

(declare-fun e!138153 () Bool)

(assert (=> b!212326 (= e!138153 e!138157)))

(declare-fun res!103809 () Bool)

(assert (=> b!212326 (= res!103809 call!20100)))

(assert (=> b!212326 (=> (not res!103809) (not e!138157))))

(declare-fun b!212327 () Bool)

(declare-fun res!103815 () Bool)

(assert (=> b!212327 (=> (not res!103815) (not e!138151))))

(assert (=> b!212327 (= res!103815 e!138146)))

(declare-fun res!103810 () Bool)

(assert (=> b!212327 (=> res!103810 e!138146)))

(assert (=> b!212327 (= res!103810 (not e!138156))))

(declare-fun res!103814 () Bool)

(assert (=> b!212327 (=> (not res!103814) (not e!138156))))

(assert (=> b!212327 (= res!103814 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212328 () Bool)

(declare-fun e!138158 () Bool)

(assert (=> b!212328 (= e!138149 e!138158)))

(declare-fun res!103813 () Bool)

(assert (=> b!212328 (= res!103813 call!20103)))

(assert (=> b!212328 (=> (not res!103813) (not e!138158))))

(declare-fun call!20101 () ListLongMap!3115)

(declare-fun bm!20098 () Bool)

(assert (=> bm!20098 (= call!20101 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212329 () Bool)

(assert (=> b!212329 (= e!138158 (= (apply!196 lt!109436 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!212330 () Bool)

(declare-fun call!20102 () ListLongMap!3115)

(assert (=> b!212330 (= e!138150 (+!576 call!20102 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212331 () Bool)

(declare-fun res!103811 () Bool)

(assert (=> b!212331 (=> (not res!103811) (not e!138151))))

(assert (=> b!212331 (= res!103811 e!138149)))

(declare-fun c!35793 () Bool)

(assert (=> b!212331 (= c!35793 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212332 () Bool)

(assert (=> b!212332 (= e!138150 e!138155)))

(declare-fun c!35794 () Bool)

(assert (=> b!212332 (= c!35794 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20099 () Bool)

(assert (=> bm!20099 (= call!20099 call!20102)))

(declare-fun bm!20100 () Bool)

(assert (=> bm!20100 (= call!20104 call!20101)))

(declare-fun bm!20101 () Bool)

(assert (=> bm!20101 (= call!20103 (contains!1410 lt!109436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212333 () Bool)

(assert (=> b!212333 (= e!138151 e!138153)))

(declare-fun c!35795 () Bool)

(assert (=> b!212333 (= c!35795 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212334 () Bool)

(declare-fun Unit!6450 () Unit!6446)

(assert (=> b!212334 (= e!138147 Unit!6450)))

(declare-fun b!212335 () Bool)

(assert (=> b!212335 (= e!138154 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212336 () Bool)

(assert (=> b!212336 (= e!138153 (not call!20100))))

(declare-fun bm!20102 () Bool)

(assert (=> bm!20102 (= call!20102 (+!576 (ite c!35796 call!20101 (ite c!35794 call!20104 call!20105)) (ite (or c!35796 c!35794) (tuple2!4203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (= (and d!58113 c!35796) b!212330))

(assert (= (and d!58113 (not c!35796)) b!212332))

(assert (= (and b!212332 c!35794) b!212318))

(assert (= (and b!212332 (not c!35794)) b!212316))

(assert (= (and b!212316 c!35791) b!212323))

(assert (= (and b!212316 (not c!35791)) b!212321))

(assert (= (or b!212323 b!212321) bm!20097))

(assert (= (or b!212318 bm!20097) bm!20100))

(assert (= (or b!212318 b!212323) bm!20099))

(assert (= (or b!212330 bm!20100) bm!20098))

(assert (= (or b!212330 bm!20099) bm!20102))

(assert (= (and d!58113 res!103816) b!212335))

(assert (= (and d!58113 c!35792) b!212325))

(assert (= (and d!58113 (not c!35792)) b!212334))

(assert (= (and d!58113 res!103808) b!212327))

(assert (= (and b!212327 res!103814) b!212322))

(assert (= (and b!212327 (not res!103810)) b!212324))

(assert (= (and b!212324 res!103812) b!212320))

(assert (= (and b!212327 res!103815) b!212331))

(assert (= (and b!212331 c!35793) b!212328))

(assert (= (and b!212331 (not c!35793)) b!212319))

(assert (= (and b!212328 res!103813) b!212329))

(assert (= (or b!212328 b!212319) bm!20101))

(assert (= (and b!212331 res!103811) b!212333))

(assert (= (and b!212333 c!35795) b!212326))

(assert (= (and b!212333 (not c!35795)) b!212336))

(assert (= (and b!212326 res!103809) b!212317))

(assert (= (or b!212326 b!212336) bm!20096))

(declare-fun b_lambda!7707 () Bool)

(assert (=> (not b_lambda!7707) (not b!212320)))

(declare-fun t!8041 () Bool)

(declare-fun tb!2905 () Bool)

(assert (=> (and start!21090 (= defaultEntry!657 defaultEntry!657) t!8041) tb!2905))

(declare-fun result!5003 () Bool)

(assert (=> tb!2905 (= result!5003 tp_is_empty!5463)))

(assert (=> b!212320 t!8041))

(declare-fun b_and!12435 () Bool)

(assert (= b_and!12431 (and (=> t!8041 result!5003) b_and!12435)))

(declare-fun m!240093 () Bool)

(assert (=> b!212325 m!240093))

(declare-fun m!240095 () Bool)

(assert (=> b!212325 m!240095))

(assert (=> b!212325 m!240035))

(declare-fun m!240097 () Bool)

(assert (=> b!212325 m!240097))

(declare-fun m!240099 () Bool)

(assert (=> b!212325 m!240099))

(declare-fun m!240101 () Bool)

(assert (=> b!212325 m!240101))

(declare-fun m!240103 () Bool)

(assert (=> b!212325 m!240103))

(declare-fun m!240105 () Bool)

(assert (=> b!212325 m!240105))

(declare-fun m!240107 () Bool)

(assert (=> b!212325 m!240107))

(declare-fun m!240109 () Bool)

(assert (=> b!212325 m!240109))

(assert (=> b!212325 m!240093))

(declare-fun m!240111 () Bool)

(assert (=> b!212325 m!240111))

(declare-fun m!240113 () Bool)

(assert (=> b!212325 m!240113))

(assert (=> b!212325 m!240097))

(declare-fun m!240115 () Bool)

(assert (=> b!212325 m!240115))

(assert (=> b!212325 m!240105))

(declare-fun m!240117 () Bool)

(assert (=> b!212325 m!240117))

(declare-fun m!240119 () Bool)

(assert (=> b!212325 m!240119))

(declare-fun m!240121 () Bool)

(assert (=> b!212325 m!240121))

(declare-fun m!240123 () Bool)

(assert (=> b!212325 m!240123))

(assert (=> b!212325 m!240119))

(assert (=> b!212335 m!240107))

(assert (=> b!212335 m!240107))

(declare-fun m!240125 () Bool)

(assert (=> b!212335 m!240125))

(assert (=> bm!20098 m!240035))

(assert (=> b!212324 m!240107))

(assert (=> b!212324 m!240107))

(declare-fun m!240127 () Bool)

(assert (=> b!212324 m!240127))

(declare-fun m!240129 () Bool)

(assert (=> bm!20101 m!240129))

(declare-fun m!240131 () Bool)

(assert (=> b!212330 m!240131))

(declare-fun m!240133 () Bool)

(assert (=> bm!20102 m!240133))

(declare-fun m!240135 () Bool)

(assert (=> b!212329 m!240135))

(assert (=> d!58113 m!240055))

(declare-fun m!240137 () Bool)

(assert (=> bm!20096 m!240137))

(declare-fun m!240139 () Bool)

(assert (=> b!212320 m!240139))

(declare-fun m!240141 () Bool)

(assert (=> b!212320 m!240141))

(declare-fun m!240143 () Bool)

(assert (=> b!212320 m!240143))

(assert (=> b!212320 m!240107))

(declare-fun m!240145 () Bool)

(assert (=> b!212320 m!240145))

(assert (=> b!212320 m!240139))

(assert (=> b!212320 m!240107))

(assert (=> b!212320 m!240141))

(assert (=> b!212322 m!240107))

(assert (=> b!212322 m!240107))

(assert (=> b!212322 m!240125))

(declare-fun m!240147 () Bool)

(assert (=> b!212317 m!240147))

(assert (=> b!212230 d!58113))

(declare-fun b!212363 () Bool)

(declare-fun res!103827 () Bool)

(declare-fun e!138173 () Bool)

(assert (=> b!212363 (=> (not res!103827) (not e!138173))))

(declare-fun lt!109464 () ListLongMap!3115)

(assert (=> b!212363 (= res!103827 (not (contains!1410 lt!109464 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212364 () Bool)

(declare-fun e!138174 () Bool)

(declare-fun isEmpty!497 (ListLongMap!3115) Bool)

(assert (=> b!212364 (= e!138174 (isEmpty!497 lt!109464))))

(declare-fun b!212365 () Bool)

(assert (=> b!212365 (= e!138174 (= lt!109464 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212367 () Bool)

(declare-fun e!138178 () Bool)

(assert (=> b!212367 (= e!138178 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212367 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212368 () Bool)

(declare-fun e!138179 () ListLongMap!3115)

(declare-fun e!138176 () ListLongMap!3115)

(assert (=> b!212368 (= e!138179 e!138176)))

(declare-fun c!35806 () Bool)

(assert (=> b!212368 (= c!35806 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212369 () Bool)

(assert (=> b!212369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> b!212369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5133 _values!649)))))

(declare-fun e!138177 () Bool)

(assert (=> b!212369 (= e!138177 (= (apply!196 lt!109464 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)) (get!2572 (select (arr!4808 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!20108 () ListLongMap!3115)

(declare-fun bm!20105 () Bool)

(assert (=> bm!20105 (= call!20108 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212370 () Bool)

(declare-fun e!138175 () Bool)

(assert (=> b!212370 (= e!138175 e!138174)))

(declare-fun c!35805 () Bool)

(assert (=> b!212370 (= c!35805 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212371 () Bool)

(assert (=> b!212371 (= e!138173 e!138175)))

(declare-fun c!35808 () Bool)

(assert (=> b!212371 (= c!35808 e!138178)))

(declare-fun res!103826 () Bool)

(assert (=> b!212371 (=> (not res!103826) (not e!138178))))

(assert (=> b!212371 (= res!103826 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212372 () Bool)

(assert (=> b!212372 (= e!138176 call!20108)))

(declare-fun b!212373 () Bool)

(assert (=> b!212373 (= e!138175 e!138177)))

(assert (=> b!212373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun res!103825 () Bool)

(assert (=> b!212373 (= res!103825 (contains!1410 lt!109464 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212373 (=> (not res!103825) (not e!138177))))

(declare-fun b!212374 () Bool)

(declare-fun lt!109463 () Unit!6446)

(declare-fun lt!109459 () Unit!6446)

(assert (=> b!212374 (= lt!109463 lt!109459)))

(declare-fun lt!109461 () V!6931)

(declare-fun lt!109458 () (_ BitVec 64))

(declare-fun lt!109462 () ListLongMap!3115)

(declare-fun lt!109460 () (_ BitVec 64))

(assert (=> b!212374 (not (contains!1410 (+!576 lt!109462 (tuple2!4203 lt!109458 lt!109461)) lt!109460))))

(declare-fun addStillNotContains!105 (ListLongMap!3115 (_ BitVec 64) V!6931 (_ BitVec 64)) Unit!6446)

(assert (=> b!212374 (= lt!109459 (addStillNotContains!105 lt!109462 lt!109458 lt!109461 lt!109460))))

(assert (=> b!212374 (= lt!109460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212374 (= lt!109461 (get!2572 (select (arr!4808 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212374 (= lt!109458 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212374 (= lt!109462 call!20108)))

(assert (=> b!212374 (= e!138176 (+!576 call!20108 (tuple2!4203 (select (arr!4809 _keys!825) #b00000000000000000000000000000000) (get!2572 (select (arr!4808 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212366 () Bool)

(assert (=> b!212366 (= e!138179 (ListLongMap!3116 Nil!3088))))

(declare-fun d!58115 () Bool)

(assert (=> d!58115 e!138173))

(declare-fun res!103828 () Bool)

(assert (=> d!58115 (=> (not res!103828) (not e!138173))))

(assert (=> d!58115 (= res!103828 (not (contains!1410 lt!109464 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58115 (= lt!109464 e!138179)))

(declare-fun c!35807 () Bool)

(assert (=> d!58115 (= c!35807 (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> d!58115 (validMask!0 mask!1149)))

(assert (=> d!58115 (= (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109464)))

(assert (= (and d!58115 c!35807) b!212366))

(assert (= (and d!58115 (not c!35807)) b!212368))

(assert (= (and b!212368 c!35806) b!212374))

(assert (= (and b!212368 (not c!35806)) b!212372))

(assert (= (or b!212374 b!212372) bm!20105))

(assert (= (and d!58115 res!103828) b!212363))

(assert (= (and b!212363 res!103827) b!212371))

(assert (= (and b!212371 res!103826) b!212367))

(assert (= (and b!212371 c!35808) b!212373))

(assert (= (and b!212371 (not c!35808)) b!212370))

(assert (= (and b!212373 res!103825) b!212369))

(assert (= (and b!212370 c!35805) b!212365))

(assert (= (and b!212370 (not c!35805)) b!212364))

(declare-fun b_lambda!7709 () Bool)

(assert (=> (not b_lambda!7709) (not b!212369)))

(assert (=> b!212369 t!8041))

(declare-fun b_and!12437 () Bool)

(assert (= b_and!12435 (and (=> t!8041 result!5003) b_and!12437)))

(declare-fun b_lambda!7711 () Bool)

(assert (=> (not b_lambda!7711) (not b!212374)))

(assert (=> b!212374 t!8041))

(declare-fun b_and!12439 () Bool)

(assert (= b_and!12437 (and (=> t!8041 result!5003) b_and!12439)))

(declare-fun m!240149 () Bool)

(assert (=> bm!20105 m!240149))

(declare-fun m!240151 () Bool)

(assert (=> b!212374 m!240151))

(declare-fun m!240153 () Bool)

(assert (=> b!212374 m!240153))

(assert (=> b!212374 m!240141))

(declare-fun m!240155 () Bool)

(assert (=> b!212374 m!240155))

(assert (=> b!212374 m!240107))

(declare-fun m!240157 () Bool)

(assert (=> b!212374 m!240157))

(declare-fun m!240159 () Bool)

(assert (=> b!212374 m!240159))

(assert (=> b!212374 m!240157))

(assert (=> b!212374 m!240153))

(assert (=> b!212374 m!240141))

(declare-fun m!240161 () Bool)

(assert (=> b!212374 m!240161))

(declare-fun m!240163 () Bool)

(assert (=> b!212364 m!240163))

(declare-fun m!240165 () Bool)

(assert (=> b!212363 m!240165))

(assert (=> b!212367 m!240107))

(assert (=> b!212367 m!240107))

(assert (=> b!212367 m!240125))

(declare-fun m!240167 () Bool)

(assert (=> d!58115 m!240167))

(assert (=> d!58115 m!240055))

(assert (=> b!212373 m!240107))

(assert (=> b!212373 m!240107))

(declare-fun m!240169 () Bool)

(assert (=> b!212373 m!240169))

(assert (=> b!212368 m!240107))

(assert (=> b!212368 m!240107))

(assert (=> b!212368 m!240125))

(assert (=> b!212369 m!240153))

(assert (=> b!212369 m!240141))

(assert (=> b!212369 m!240107))

(assert (=> b!212369 m!240107))

(declare-fun m!240171 () Bool)

(assert (=> b!212369 m!240171))

(assert (=> b!212369 m!240153))

(assert (=> b!212369 m!240141))

(assert (=> b!212369 m!240161))

(assert (=> b!212365 m!240149))

(assert (=> b!212230 d!58115))

(declare-fun b!212375 () Bool)

(declare-fun res!103831 () Bool)

(declare-fun e!138180 () Bool)

(assert (=> b!212375 (=> (not res!103831) (not e!138180))))

(declare-fun lt!109471 () ListLongMap!3115)

(assert (=> b!212375 (= res!103831 (not (contains!1410 lt!109471 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212376 () Bool)

(declare-fun e!138181 () Bool)

(assert (=> b!212376 (= e!138181 (isEmpty!497 lt!109471))))

(declare-fun b!212377 () Bool)

(assert (=> b!212377 (= e!138181 (= lt!109471 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212379 () Bool)

(declare-fun e!138185 () Bool)

(assert (=> b!212379 (= e!138185 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212379 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212380 () Bool)

(declare-fun e!138186 () ListLongMap!3115)

(declare-fun e!138183 () ListLongMap!3115)

(assert (=> b!212380 (= e!138186 e!138183)))

(declare-fun c!35810 () Bool)

(assert (=> b!212380 (= c!35810 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212381 () Bool)

(assert (=> b!212381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> b!212381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5133 lt!109350)))))

(declare-fun e!138184 () Bool)

(assert (=> b!212381 (= e!138184 (= (apply!196 lt!109471 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)) (get!2572 (select (arr!4808 lt!109350) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20106 () Bool)

(declare-fun call!20109 () ListLongMap!3115)

(assert (=> bm!20106 (= call!20109 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212382 () Bool)

(declare-fun e!138182 () Bool)

(assert (=> b!212382 (= e!138182 e!138181)))

(declare-fun c!35809 () Bool)

(assert (=> b!212382 (= c!35809 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212383 () Bool)

(assert (=> b!212383 (= e!138180 e!138182)))

(declare-fun c!35812 () Bool)

(assert (=> b!212383 (= c!35812 e!138185)))

(declare-fun res!103830 () Bool)

(assert (=> b!212383 (=> (not res!103830) (not e!138185))))

(assert (=> b!212383 (= res!103830 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212384 () Bool)

(assert (=> b!212384 (= e!138183 call!20109)))

(declare-fun b!212385 () Bool)

(assert (=> b!212385 (= e!138182 e!138184)))

(assert (=> b!212385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun res!103829 () Bool)

(assert (=> b!212385 (= res!103829 (contains!1410 lt!109471 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212385 (=> (not res!103829) (not e!138184))))

(declare-fun b!212386 () Bool)

(declare-fun lt!109470 () Unit!6446)

(declare-fun lt!109466 () Unit!6446)

(assert (=> b!212386 (= lt!109470 lt!109466)))

(declare-fun lt!109468 () V!6931)

(declare-fun lt!109469 () ListLongMap!3115)

(declare-fun lt!109465 () (_ BitVec 64))

(declare-fun lt!109467 () (_ BitVec 64))

(assert (=> b!212386 (not (contains!1410 (+!576 lt!109469 (tuple2!4203 lt!109465 lt!109468)) lt!109467))))

(assert (=> b!212386 (= lt!109466 (addStillNotContains!105 lt!109469 lt!109465 lt!109468 lt!109467))))

(assert (=> b!212386 (= lt!109467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212386 (= lt!109468 (get!2572 (select (arr!4808 lt!109350) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212386 (= lt!109465 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212386 (= lt!109469 call!20109)))

(assert (=> b!212386 (= e!138183 (+!576 call!20109 (tuple2!4203 (select (arr!4809 _keys!825) #b00000000000000000000000000000000) (get!2572 (select (arr!4808 lt!109350) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212378 () Bool)

(assert (=> b!212378 (= e!138186 (ListLongMap!3116 Nil!3088))))

(declare-fun d!58117 () Bool)

(assert (=> d!58117 e!138180))

(declare-fun res!103832 () Bool)

(assert (=> d!58117 (=> (not res!103832) (not e!138180))))

(assert (=> d!58117 (= res!103832 (not (contains!1410 lt!109471 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58117 (= lt!109471 e!138186)))

(declare-fun c!35811 () Bool)

(assert (=> d!58117 (= c!35811 (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> d!58117 (validMask!0 mask!1149)))

(assert (=> d!58117 (= (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109471)))

(assert (= (and d!58117 c!35811) b!212378))

(assert (= (and d!58117 (not c!35811)) b!212380))

(assert (= (and b!212380 c!35810) b!212386))

(assert (= (and b!212380 (not c!35810)) b!212384))

(assert (= (or b!212386 b!212384) bm!20106))

(assert (= (and d!58117 res!103832) b!212375))

(assert (= (and b!212375 res!103831) b!212383))

(assert (= (and b!212383 res!103830) b!212379))

(assert (= (and b!212383 c!35812) b!212385))

(assert (= (and b!212383 (not c!35812)) b!212382))

(assert (= (and b!212385 res!103829) b!212381))

(assert (= (and b!212382 c!35809) b!212377))

(assert (= (and b!212382 (not c!35809)) b!212376))

(declare-fun b_lambda!7713 () Bool)

(assert (=> (not b_lambda!7713) (not b!212381)))

(assert (=> b!212381 t!8041))

(declare-fun b_and!12441 () Bool)

(assert (= b_and!12439 (and (=> t!8041 result!5003) b_and!12441)))

(declare-fun b_lambda!7715 () Bool)

(assert (=> (not b_lambda!7715) (not b!212386)))

(assert (=> b!212386 t!8041))

(declare-fun b_and!12443 () Bool)

(assert (= b_and!12441 (and (=> t!8041 result!5003) b_and!12443)))

(declare-fun m!240173 () Bool)

(assert (=> bm!20106 m!240173))

(declare-fun m!240175 () Bool)

(assert (=> b!212386 m!240175))

(assert (=> b!212386 m!240139))

(assert (=> b!212386 m!240141))

(declare-fun m!240177 () Bool)

(assert (=> b!212386 m!240177))

(assert (=> b!212386 m!240107))

(declare-fun m!240179 () Bool)

(assert (=> b!212386 m!240179))

(declare-fun m!240181 () Bool)

(assert (=> b!212386 m!240181))

(assert (=> b!212386 m!240179))

(assert (=> b!212386 m!240139))

(assert (=> b!212386 m!240141))

(assert (=> b!212386 m!240143))

(declare-fun m!240183 () Bool)

(assert (=> b!212376 m!240183))

(declare-fun m!240185 () Bool)

(assert (=> b!212375 m!240185))

(assert (=> b!212379 m!240107))

(assert (=> b!212379 m!240107))

(assert (=> b!212379 m!240125))

(declare-fun m!240187 () Bool)

(assert (=> d!58117 m!240187))

(assert (=> d!58117 m!240055))

(assert (=> b!212385 m!240107))

(assert (=> b!212385 m!240107))

(declare-fun m!240189 () Bool)

(assert (=> b!212385 m!240189))

(assert (=> b!212380 m!240107))

(assert (=> b!212380 m!240107))

(assert (=> b!212380 m!240125))

(assert (=> b!212381 m!240139))

(assert (=> b!212381 m!240141))

(assert (=> b!212381 m!240107))

(assert (=> b!212381 m!240107))

(declare-fun m!240191 () Bool)

(assert (=> b!212381 m!240191))

(assert (=> b!212381 m!240139))

(assert (=> b!212381 m!240141))

(assert (=> b!212381 m!240143))

(assert (=> b!212377 m!240173))

(assert (=> b!212230 d!58117))

(declare-fun b!212393 () Bool)

(declare-fun e!138191 () Bool)

(declare-fun call!20114 () ListLongMap!3115)

(declare-fun call!20115 () ListLongMap!3115)

(assert (=> b!212393 (= e!138191 (= call!20114 (+!576 call!20115 (tuple2!4203 k0!843 v!520))))))

(declare-fun bm!20111 () Bool)

(assert (=> bm!20111 (= call!20114 (getCurrentListMapNoExtraKeys!508 _keys!825 (array!10130 (store (arr!4808 _values!649) i!601 (ValueCellFull!2388 v!520)) (size!5133 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20112 () Bool)

(assert (=> bm!20112 (= call!20115 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212394 () Bool)

(declare-fun e!138192 () Bool)

(assert (=> b!212394 (= e!138192 e!138191)))

(declare-fun c!35815 () Bool)

(assert (=> b!212394 (= c!35815 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!212395 () Bool)

(assert (=> b!212395 (= e!138191 (= call!20114 call!20115))))

(declare-fun d!58119 () Bool)

(assert (=> d!58119 e!138192))

(declare-fun res!103835 () Bool)

(assert (=> d!58119 (=> (not res!103835) (not e!138192))))

(assert (=> d!58119 (= res!103835 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5133 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5133 _values!649))))))))

(declare-fun lt!109474 () Unit!6446)

(declare-fun choose!1080 (array!10131 array!10129 (_ BitVec 32) (_ BitVec 32) V!6931 V!6931 (_ BitVec 32) (_ BitVec 64) V!6931 (_ BitVec 32) Int) Unit!6446)

(assert (=> d!58119 (= lt!109474 (choose!1080 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> d!58119 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!223 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109474)))

(assert (= (and d!58119 res!103835) b!212394))

(assert (= (and b!212394 c!35815) b!212393))

(assert (= (and b!212394 (not c!35815)) b!212395))

(assert (= (or b!212393 b!212395) bm!20111))

(assert (= (or b!212393 b!212395) bm!20112))

(declare-fun m!240193 () Bool)

(assert (=> b!212393 m!240193))

(assert (=> bm!20111 m!240039))

(declare-fun m!240195 () Bool)

(assert (=> bm!20111 m!240195))

(assert (=> bm!20112 m!240047))

(declare-fun m!240197 () Bool)

(assert (=> d!58119 m!240197))

(assert (=> b!212230 d!58119))

(declare-fun bm!20113 () Bool)

(declare-fun call!20117 () Bool)

(declare-fun lt!109489 () ListLongMap!3115)

(assert (=> bm!20113 (= call!20117 (contains!1410 lt!109489 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212396 () Bool)

(declare-fun c!35816 () Bool)

(assert (=> b!212396 (= c!35816 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138202 () ListLongMap!3115)

(declare-fun e!138195 () ListLongMap!3115)

(assert (=> b!212396 (= e!138202 e!138195)))

(declare-fun bm!20114 () Bool)

(declare-fun call!20122 () ListLongMap!3115)

(declare-fun call!20121 () ListLongMap!3115)

(assert (=> bm!20114 (= call!20122 call!20121)))

(declare-fun b!212397 () Bool)

(declare-fun e!138204 () Bool)

(assert (=> b!212397 (= e!138204 (= (apply!196 lt!109489 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212398 () Bool)

(declare-fun call!20116 () ListLongMap!3115)

(assert (=> b!212398 (= e!138202 call!20116)))

(declare-fun b!212399 () Bool)

(declare-fun e!138196 () Bool)

(declare-fun call!20120 () Bool)

(assert (=> b!212399 (= e!138196 (not call!20120))))

(declare-fun d!58121 () Bool)

(declare-fun e!138198 () Bool)

(assert (=> d!58121 e!138198))

(declare-fun res!103836 () Bool)

(assert (=> d!58121 (=> (not res!103836) (not e!138198))))

(assert (=> d!58121 (= res!103836 (or (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))))

(declare-fun lt!109494 () ListLongMap!3115)

(assert (=> d!58121 (= lt!109489 lt!109494)))

(declare-fun lt!109496 () Unit!6446)

(declare-fun e!138194 () Unit!6446)

(assert (=> d!58121 (= lt!109496 e!138194)))

(declare-fun c!35817 () Bool)

(declare-fun e!138201 () Bool)

(assert (=> d!58121 (= c!35817 e!138201)))

(declare-fun res!103844 () Bool)

(assert (=> d!58121 (=> (not res!103844) (not e!138201))))

(assert (=> d!58121 (= res!103844 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun e!138197 () ListLongMap!3115)

(assert (=> d!58121 (= lt!109494 e!138197)))

(declare-fun c!35821 () Bool)

(assert (=> d!58121 (= c!35821 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58121 (validMask!0 mask!1149)))

(assert (=> d!58121 (= (getCurrentListMap!1106 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109489)))

(declare-fun b!212400 () Bool)

(declare-fun e!138199 () Bool)

(assert (=> b!212400 (= e!138199 (= (apply!196 lt!109489 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)) (get!2572 (select (arr!4808 _values!649) #b00000000000000000000000000000000) (dynLambda!539 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5133 _values!649)))))

(assert (=> b!212400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212401 () Bool)

(assert (=> b!212401 (= e!138195 call!20122)))

(declare-fun b!212402 () Bool)

(declare-fun e!138203 () Bool)

(assert (=> b!212402 (= e!138203 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212403 () Bool)

(assert (=> b!212403 (= e!138195 call!20116)))

(declare-fun b!212404 () Bool)

(declare-fun e!138193 () Bool)

(assert (=> b!212404 (= e!138193 e!138199)))

(declare-fun res!103840 () Bool)

(assert (=> b!212404 (=> (not res!103840) (not e!138199))))

(assert (=> b!212404 (= res!103840 (contains!1410 lt!109489 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212405 () Bool)

(declare-fun lt!109483 () Unit!6446)

(assert (=> b!212405 (= e!138194 lt!109483)))

(declare-fun lt!109493 () ListLongMap!3115)

(assert (=> b!212405 (= lt!109493 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109480 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109476 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109476 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109482 () Unit!6446)

(assert (=> b!212405 (= lt!109482 (addStillContains!172 lt!109493 lt!109480 zeroValue!615 lt!109476))))

(assert (=> b!212405 (contains!1410 (+!576 lt!109493 (tuple2!4203 lt!109480 zeroValue!615)) lt!109476)))

(declare-fun lt!109492 () Unit!6446)

(assert (=> b!212405 (= lt!109492 lt!109482)))

(declare-fun lt!109485 () ListLongMap!3115)

(assert (=> b!212405 (= lt!109485 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109490 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109490 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109477 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109477 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109488 () Unit!6446)

(assert (=> b!212405 (= lt!109488 (addApplyDifferent!172 lt!109485 lt!109490 minValue!615 lt!109477))))

(assert (=> b!212405 (= (apply!196 (+!576 lt!109485 (tuple2!4203 lt!109490 minValue!615)) lt!109477) (apply!196 lt!109485 lt!109477))))

(declare-fun lt!109487 () Unit!6446)

(assert (=> b!212405 (= lt!109487 lt!109488)))

(declare-fun lt!109495 () ListLongMap!3115)

(assert (=> b!212405 (= lt!109495 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109491 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109475 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109475 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109481 () Unit!6446)

(assert (=> b!212405 (= lt!109481 (addApplyDifferent!172 lt!109495 lt!109491 zeroValue!615 lt!109475))))

(assert (=> b!212405 (= (apply!196 (+!576 lt!109495 (tuple2!4203 lt!109491 zeroValue!615)) lt!109475) (apply!196 lt!109495 lt!109475))))

(declare-fun lt!109478 () Unit!6446)

(assert (=> b!212405 (= lt!109478 lt!109481)))

(declare-fun lt!109479 () ListLongMap!3115)

(assert (=> b!212405 (= lt!109479 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109484 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109484 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109486 () (_ BitVec 64))

(assert (=> b!212405 (= lt!109486 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212405 (= lt!109483 (addApplyDifferent!172 lt!109479 lt!109484 minValue!615 lt!109486))))

(assert (=> b!212405 (= (apply!196 (+!576 lt!109479 (tuple2!4203 lt!109484 minValue!615)) lt!109486) (apply!196 lt!109479 lt!109486))))

(declare-fun b!212406 () Bool)

(declare-fun e!138200 () Bool)

(assert (=> b!212406 (= e!138200 e!138204)))

(declare-fun res!103837 () Bool)

(assert (=> b!212406 (= res!103837 call!20117)))

(assert (=> b!212406 (=> (not res!103837) (not e!138204))))

(declare-fun b!212407 () Bool)

(declare-fun res!103843 () Bool)

(assert (=> b!212407 (=> (not res!103843) (not e!138198))))

(assert (=> b!212407 (= res!103843 e!138193)))

(declare-fun res!103838 () Bool)

(assert (=> b!212407 (=> res!103838 e!138193)))

(assert (=> b!212407 (= res!103838 (not e!138203))))

(declare-fun res!103842 () Bool)

(assert (=> b!212407 (=> (not res!103842) (not e!138203))))

(assert (=> b!212407 (= res!103842 (bvslt #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(declare-fun b!212408 () Bool)

(declare-fun e!138205 () Bool)

(assert (=> b!212408 (= e!138196 e!138205)))

(declare-fun res!103841 () Bool)

(assert (=> b!212408 (= res!103841 call!20120)))

(assert (=> b!212408 (=> (not res!103841) (not e!138205))))

(declare-fun bm!20115 () Bool)

(declare-fun call!20118 () ListLongMap!3115)

(assert (=> bm!20115 (= call!20118 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212409 () Bool)

(assert (=> b!212409 (= e!138205 (= (apply!196 lt!109489 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!212410 () Bool)

(declare-fun call!20119 () ListLongMap!3115)

(assert (=> b!212410 (= e!138197 (+!576 call!20119 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212411 () Bool)

(declare-fun res!103839 () Bool)

(assert (=> b!212411 (=> (not res!103839) (not e!138198))))

(assert (=> b!212411 (= res!103839 e!138196)))

(declare-fun c!35818 () Bool)

(assert (=> b!212411 (= c!35818 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212412 () Bool)

(assert (=> b!212412 (= e!138197 e!138202)))

(declare-fun c!35819 () Bool)

(assert (=> b!212412 (= c!35819 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20116 () Bool)

(assert (=> bm!20116 (= call!20116 call!20119)))

(declare-fun bm!20117 () Bool)

(assert (=> bm!20117 (= call!20121 call!20118)))

(declare-fun bm!20118 () Bool)

(assert (=> bm!20118 (= call!20120 (contains!1410 lt!109489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212413 () Bool)

(assert (=> b!212413 (= e!138198 e!138200)))

(declare-fun c!35820 () Bool)

(assert (=> b!212413 (= c!35820 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212414 () Bool)

(declare-fun Unit!6451 () Unit!6446)

(assert (=> b!212414 (= e!138194 Unit!6451)))

(declare-fun b!212415 () Bool)

(assert (=> b!212415 (= e!138201 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212416 () Bool)

(assert (=> b!212416 (= e!138200 (not call!20117))))

(declare-fun bm!20119 () Bool)

(assert (=> bm!20119 (= call!20119 (+!576 (ite c!35821 call!20118 (ite c!35819 call!20121 call!20122)) (ite (or c!35821 c!35819) (tuple2!4203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (= (and d!58121 c!35821) b!212410))

(assert (= (and d!58121 (not c!35821)) b!212412))

(assert (= (and b!212412 c!35819) b!212398))

(assert (= (and b!212412 (not c!35819)) b!212396))

(assert (= (and b!212396 c!35816) b!212403))

(assert (= (and b!212396 (not c!35816)) b!212401))

(assert (= (or b!212403 b!212401) bm!20114))

(assert (= (or b!212398 bm!20114) bm!20117))

(assert (= (or b!212398 b!212403) bm!20116))

(assert (= (or b!212410 bm!20117) bm!20115))

(assert (= (or b!212410 bm!20116) bm!20119))

(assert (= (and d!58121 res!103844) b!212415))

(assert (= (and d!58121 c!35817) b!212405))

(assert (= (and d!58121 (not c!35817)) b!212414))

(assert (= (and d!58121 res!103836) b!212407))

(assert (= (and b!212407 res!103842) b!212402))

(assert (= (and b!212407 (not res!103838)) b!212404))

(assert (= (and b!212404 res!103840) b!212400))

(assert (= (and b!212407 res!103843) b!212411))

(assert (= (and b!212411 c!35818) b!212408))

(assert (= (and b!212411 (not c!35818)) b!212399))

(assert (= (and b!212408 res!103841) b!212409))

(assert (= (or b!212408 b!212399) bm!20118))

(assert (= (and b!212411 res!103839) b!212413))

(assert (= (and b!212413 c!35820) b!212406))

(assert (= (and b!212413 (not c!35820)) b!212416))

(assert (= (and b!212406 res!103837) b!212397))

(assert (= (or b!212406 b!212416) bm!20113))

(declare-fun b_lambda!7717 () Bool)

(assert (=> (not b_lambda!7717) (not b!212400)))

(assert (=> b!212400 t!8041))

(declare-fun b_and!12445 () Bool)

(assert (= b_and!12443 (and (=> t!8041 result!5003) b_and!12445)))

(declare-fun m!240199 () Bool)

(assert (=> b!212405 m!240199))

(declare-fun m!240201 () Bool)

(assert (=> b!212405 m!240201))

(assert (=> b!212405 m!240047))

(declare-fun m!240203 () Bool)

(assert (=> b!212405 m!240203))

(declare-fun m!240205 () Bool)

(assert (=> b!212405 m!240205))

(declare-fun m!240207 () Bool)

(assert (=> b!212405 m!240207))

(declare-fun m!240209 () Bool)

(assert (=> b!212405 m!240209))

(declare-fun m!240211 () Bool)

(assert (=> b!212405 m!240211))

(assert (=> b!212405 m!240107))

(declare-fun m!240213 () Bool)

(assert (=> b!212405 m!240213))

(assert (=> b!212405 m!240199))

(declare-fun m!240215 () Bool)

(assert (=> b!212405 m!240215))

(declare-fun m!240217 () Bool)

(assert (=> b!212405 m!240217))

(assert (=> b!212405 m!240203))

(declare-fun m!240219 () Bool)

(assert (=> b!212405 m!240219))

(assert (=> b!212405 m!240211))

(declare-fun m!240221 () Bool)

(assert (=> b!212405 m!240221))

(declare-fun m!240223 () Bool)

(assert (=> b!212405 m!240223))

(declare-fun m!240225 () Bool)

(assert (=> b!212405 m!240225))

(declare-fun m!240227 () Bool)

(assert (=> b!212405 m!240227))

(assert (=> b!212405 m!240223))

(assert (=> b!212415 m!240107))

(assert (=> b!212415 m!240107))

(assert (=> b!212415 m!240125))

(assert (=> bm!20115 m!240047))

(assert (=> b!212404 m!240107))

(assert (=> b!212404 m!240107))

(declare-fun m!240229 () Bool)

(assert (=> b!212404 m!240229))

(declare-fun m!240231 () Bool)

(assert (=> bm!20118 m!240231))

(declare-fun m!240233 () Bool)

(assert (=> b!212410 m!240233))

(declare-fun m!240235 () Bool)

(assert (=> bm!20119 m!240235))

(declare-fun m!240237 () Bool)

(assert (=> b!212409 m!240237))

(assert (=> d!58121 m!240055))

(declare-fun m!240239 () Bool)

(assert (=> bm!20113 m!240239))

(assert (=> b!212400 m!240153))

(assert (=> b!212400 m!240141))

(assert (=> b!212400 m!240161))

(assert (=> b!212400 m!240107))

(declare-fun m!240241 () Bool)

(assert (=> b!212400 m!240241))

(assert (=> b!212400 m!240153))

(assert (=> b!212400 m!240107))

(assert (=> b!212400 m!240141))

(assert (=> b!212402 m!240107))

(assert (=> b!212402 m!240107))

(assert (=> b!212402 m!240125))

(declare-fun m!240243 () Bool)

(assert (=> b!212397 m!240243))

(assert (=> b!212230 d!58121))

(declare-fun d!58123 () Bool)

(declare-fun e!138208 () Bool)

(assert (=> d!58123 e!138208))

(declare-fun res!103849 () Bool)

(assert (=> d!58123 (=> (not res!103849) (not e!138208))))

(declare-fun lt!109508 () ListLongMap!3115)

(assert (=> d!58123 (= res!103849 (contains!1410 lt!109508 (_1!2112 (tuple2!4203 k0!843 v!520))))))

(declare-fun lt!109506 () List!3091)

(assert (=> d!58123 (= lt!109508 (ListLongMap!3116 lt!109506))))

(declare-fun lt!109507 () Unit!6446)

(declare-fun lt!109505 () Unit!6446)

(assert (=> d!58123 (= lt!109507 lt!109505)))

(declare-datatypes ((Option!260 0))(
  ( (Some!259 (v!4779 V!6931)) (None!258) )
))
(declare-fun getValueByKey!254 (List!3091 (_ BitVec 64)) Option!260)

(assert (=> d!58123 (= (getValueByKey!254 lt!109506 (_1!2112 (tuple2!4203 k0!843 v!520))) (Some!259 (_2!2112 (tuple2!4203 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!141 (List!3091 (_ BitVec 64) V!6931) Unit!6446)

(assert (=> d!58123 (= lt!109505 (lemmaContainsTupThenGetReturnValue!141 lt!109506 (_1!2112 (tuple2!4203 k0!843 v!520)) (_2!2112 (tuple2!4203 k0!843 v!520))))))

(declare-fun insertStrictlySorted!144 (List!3091 (_ BitVec 64) V!6931) List!3091)

(assert (=> d!58123 (= lt!109506 (insertStrictlySorted!144 (toList!1573 lt!109356) (_1!2112 (tuple2!4203 k0!843 v!520)) (_2!2112 (tuple2!4203 k0!843 v!520))))))

(assert (=> d!58123 (= (+!576 lt!109356 (tuple2!4203 k0!843 v!520)) lt!109508)))

(declare-fun b!212421 () Bool)

(declare-fun res!103850 () Bool)

(assert (=> b!212421 (=> (not res!103850) (not e!138208))))

(assert (=> b!212421 (= res!103850 (= (getValueByKey!254 (toList!1573 lt!109508) (_1!2112 (tuple2!4203 k0!843 v!520))) (Some!259 (_2!2112 (tuple2!4203 k0!843 v!520)))))))

(declare-fun b!212422 () Bool)

(declare-fun contains!1411 (List!3091 tuple2!4202) Bool)

(assert (=> b!212422 (= e!138208 (contains!1411 (toList!1573 lt!109508) (tuple2!4203 k0!843 v!520)))))

(assert (= (and d!58123 res!103849) b!212421))

(assert (= (and b!212421 res!103850) b!212422))

(declare-fun m!240245 () Bool)

(assert (=> d!58123 m!240245))

(declare-fun m!240247 () Bool)

(assert (=> d!58123 m!240247))

(declare-fun m!240249 () Bool)

(assert (=> d!58123 m!240249))

(declare-fun m!240251 () Bool)

(assert (=> d!58123 m!240251))

(declare-fun m!240253 () Bool)

(assert (=> b!212421 m!240253))

(declare-fun m!240255 () Bool)

(assert (=> b!212422 m!240255))

(assert (=> b!212230 d!58123))

(declare-fun b!212431 () Bool)

(declare-fun e!138215 () Bool)

(declare-fun call!20125 () Bool)

(assert (=> b!212431 (= e!138215 call!20125)))

(declare-fun bm!20122 () Bool)

(assert (=> bm!20122 (= call!20125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!212432 () Bool)

(declare-fun e!138216 () Bool)

(assert (=> b!212432 (= e!138216 e!138215)))

(declare-fun c!35824 () Bool)

(assert (=> b!212432 (= c!35824 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212433 () Bool)

(declare-fun e!138217 () Bool)

(assert (=> b!212433 (= e!138215 e!138217)))

(declare-fun lt!109517 () (_ BitVec 64))

(assert (=> b!212433 (= lt!109517 (select (arr!4809 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109516 () Unit!6446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10131 (_ BitVec 64) (_ BitVec 32)) Unit!6446)

(assert (=> b!212433 (= lt!109516 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109517 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212433 (arrayContainsKey!0 _keys!825 lt!109517 #b00000000000000000000000000000000)))

(declare-fun lt!109515 () Unit!6446)

(assert (=> b!212433 (= lt!109515 lt!109516)))

(declare-fun res!103855 () Bool)

(declare-datatypes ((SeekEntryResult!711 0))(
  ( (MissingZero!711 (index!5014 (_ BitVec 32))) (Found!711 (index!5015 (_ BitVec 32))) (Intermediate!711 (undefined!1523 Bool) (index!5016 (_ BitVec 32)) (x!22162 (_ BitVec 32))) (Undefined!711) (MissingVacant!711 (index!5017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10131 (_ BitVec 32)) SeekEntryResult!711)

(assert (=> b!212433 (= res!103855 (= (seekEntryOrOpen!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!711 #b00000000000000000000000000000000)))))

(assert (=> b!212433 (=> (not res!103855) (not e!138217))))

(declare-fun b!212434 () Bool)

(assert (=> b!212434 (= e!138217 call!20125)))

(declare-fun d!58125 () Bool)

(declare-fun res!103856 () Bool)

(assert (=> d!58125 (=> res!103856 e!138216)))

(assert (=> d!58125 (= res!103856 (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> d!58125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138216)))

(assert (= (and d!58125 (not res!103856)) b!212432))

(assert (= (and b!212432 c!35824) b!212433))

(assert (= (and b!212432 (not c!35824)) b!212431))

(assert (= (and b!212433 res!103855) b!212434))

(assert (= (or b!212434 b!212431) bm!20122))

(declare-fun m!240257 () Bool)

(assert (=> bm!20122 m!240257))

(assert (=> b!212432 m!240107))

(assert (=> b!212432 m!240107))

(assert (=> b!212432 m!240125))

(assert (=> b!212433 m!240107))

(declare-fun m!240259 () Bool)

(assert (=> b!212433 m!240259))

(declare-fun m!240261 () Bool)

(assert (=> b!212433 m!240261))

(assert (=> b!212433 m!240107))

(declare-fun m!240263 () Bool)

(assert (=> b!212433 m!240263))

(assert (=> b!212234 d!58125))

(declare-fun d!58127 () Bool)

(assert (=> d!58127 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212233 d!58127))

(declare-fun b!212445 () Bool)

(declare-fun e!138227 () Bool)

(declare-fun e!138226 () Bool)

(assert (=> b!212445 (= e!138227 e!138226)))

(declare-fun c!35827 () Bool)

(assert (=> b!212445 (= c!35827 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212446 () Bool)

(declare-fun call!20128 () Bool)

(assert (=> b!212446 (= e!138226 call!20128)))

(declare-fun b!212447 () Bool)

(declare-fun e!138228 () Bool)

(declare-fun contains!1412 (List!3092 (_ BitVec 64)) Bool)

(assert (=> b!212447 (= e!138228 (contains!1412 Nil!3089 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212448 () Bool)

(declare-fun e!138229 () Bool)

(assert (=> b!212448 (= e!138229 e!138227)))

(declare-fun res!103865 () Bool)

(assert (=> b!212448 (=> (not res!103865) (not e!138227))))

(assert (=> b!212448 (= res!103865 (not e!138228))))

(declare-fun res!103863 () Bool)

(assert (=> b!212448 (=> (not res!103863) (not e!138228))))

(assert (=> b!212448 (= res!103863 (validKeyInArray!0 (select (arr!4809 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20125 () Bool)

(assert (=> bm!20125 (= call!20128 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35827 (Cons!3088 (select (arr!4809 _keys!825) #b00000000000000000000000000000000) Nil!3089) Nil!3089)))))

(declare-fun b!212449 () Bool)

(assert (=> b!212449 (= e!138226 call!20128)))

(declare-fun d!58129 () Bool)

(declare-fun res!103864 () Bool)

(assert (=> d!58129 (=> res!103864 e!138229)))

(assert (=> d!58129 (= res!103864 (bvsge #b00000000000000000000000000000000 (size!5134 _keys!825)))))

(assert (=> d!58129 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3089) e!138229)))

(assert (= (and d!58129 (not res!103864)) b!212448))

(assert (= (and b!212448 res!103863) b!212447))

(assert (= (and b!212448 res!103865) b!212445))

(assert (= (and b!212445 c!35827) b!212446))

(assert (= (and b!212445 (not c!35827)) b!212449))

(assert (= (or b!212446 b!212449) bm!20125))

(assert (=> b!212445 m!240107))

(assert (=> b!212445 m!240107))

(assert (=> b!212445 m!240125))

(assert (=> b!212447 m!240107))

(assert (=> b!212447 m!240107))

(declare-fun m!240265 () Bool)

(assert (=> b!212447 m!240265))

(assert (=> b!212448 m!240107))

(assert (=> b!212448 m!240107))

(assert (=> b!212448 m!240125))

(assert (=> bm!20125 m!240107))

(declare-fun m!240267 () Bool)

(assert (=> bm!20125 m!240267))

(assert (=> b!212236 d!58129))

(declare-fun d!58131 () Bool)

(declare-fun e!138230 () Bool)

(assert (=> d!58131 e!138230))

(declare-fun res!103866 () Bool)

(assert (=> d!58131 (=> (not res!103866) (not e!138230))))

(declare-fun lt!109521 () ListLongMap!3115)

(assert (=> d!58131 (= res!103866 (contains!1410 lt!109521 (_1!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!109519 () List!3091)

(assert (=> d!58131 (= lt!109521 (ListLongMap!3116 lt!109519))))

(declare-fun lt!109520 () Unit!6446)

(declare-fun lt!109518 () Unit!6446)

(assert (=> d!58131 (= lt!109520 lt!109518)))

(assert (=> d!58131 (= (getValueByKey!254 lt!109519 (_1!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!259 (_2!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58131 (= lt!109518 (lemmaContainsTupThenGetReturnValue!141 lt!109519 (_1!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58131 (= lt!109519 (insertStrictlySorted!144 (toList!1573 lt!109354) (_1!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!58131 (= (+!576 lt!109354 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!109521)))

(declare-fun b!212450 () Bool)

(declare-fun res!103867 () Bool)

(assert (=> b!212450 (=> (not res!103867) (not e!138230))))

(assert (=> b!212450 (= res!103867 (= (getValueByKey!254 (toList!1573 lt!109521) (_1!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!259 (_2!2112 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!212451 () Bool)

(assert (=> b!212451 (= e!138230 (contains!1411 (toList!1573 lt!109521) (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58131 res!103866) b!212450))

(assert (= (and b!212450 res!103867) b!212451))

(declare-fun m!240269 () Bool)

(assert (=> d!58131 m!240269))

(declare-fun m!240271 () Bool)

(assert (=> d!58131 m!240271))

(declare-fun m!240273 () Bool)

(assert (=> d!58131 m!240273))

(declare-fun m!240275 () Bool)

(assert (=> d!58131 m!240275))

(declare-fun m!240277 () Bool)

(assert (=> b!212450 m!240277))

(declare-fun m!240279 () Bool)

(assert (=> b!212451 m!240279))

(assert (=> b!212237 d!58131))

(declare-fun condMapEmpty!9290 () Bool)

(declare-fun mapDefault!9290 () ValueCell!2388)

(assert (=> mapNonEmpty!9284 (= condMapEmpty!9290 (= mapRest!9284 ((as const (Array (_ BitVec 32) ValueCell!2388)) mapDefault!9290)))))

(declare-fun e!138236 () Bool)

(declare-fun mapRes!9290 () Bool)

(assert (=> mapNonEmpty!9284 (= tp!19864 (and e!138236 mapRes!9290))))

(declare-fun b!212458 () Bool)

(declare-fun e!138235 () Bool)

(assert (=> b!212458 (= e!138235 tp_is_empty!5463)))

(declare-fun mapIsEmpty!9290 () Bool)

(assert (=> mapIsEmpty!9290 mapRes!9290))

(declare-fun mapNonEmpty!9290 () Bool)

(declare-fun tp!19874 () Bool)

(assert (=> mapNonEmpty!9290 (= mapRes!9290 (and tp!19874 e!138235))))

(declare-fun mapRest!9290 () (Array (_ BitVec 32) ValueCell!2388))

(declare-fun mapKey!9290 () (_ BitVec 32))

(declare-fun mapValue!9290 () ValueCell!2388)

(assert (=> mapNonEmpty!9290 (= mapRest!9284 (store mapRest!9290 mapKey!9290 mapValue!9290))))

(declare-fun b!212459 () Bool)

(assert (=> b!212459 (= e!138236 tp_is_empty!5463)))

(assert (= (and mapNonEmpty!9284 condMapEmpty!9290) mapIsEmpty!9290))

(assert (= (and mapNonEmpty!9284 (not condMapEmpty!9290)) mapNonEmpty!9290))

(assert (= (and mapNonEmpty!9290 ((_ is ValueCellFull!2388) mapValue!9290)) b!212458))

(assert (= (and mapNonEmpty!9284 ((_ is ValueCellFull!2388) mapDefault!9290)) b!212459))

(declare-fun m!240281 () Bool)

(assert (=> mapNonEmpty!9290 m!240281))

(declare-fun b_lambda!7719 () Bool)

(assert (= b_lambda!7711 (or (and start!21090 b_free!5601) b_lambda!7719)))

(declare-fun b_lambda!7721 () Bool)

(assert (= b_lambda!7717 (or (and start!21090 b_free!5601) b_lambda!7721)))

(declare-fun b_lambda!7723 () Bool)

(assert (= b_lambda!7709 (or (and start!21090 b_free!5601) b_lambda!7723)))

(declare-fun b_lambda!7725 () Bool)

(assert (= b_lambda!7707 (or (and start!21090 b_free!5601) b_lambda!7725)))

(declare-fun b_lambda!7727 () Bool)

(assert (= b_lambda!7713 (or (and start!21090 b_free!5601) b_lambda!7727)))

(declare-fun b_lambda!7729 () Bool)

(assert (= b_lambda!7715 (or (and start!21090 b_free!5601) b_lambda!7729)))

(check-sat (not b!212448) (not b!212365) (not b!212322) (not bm!20115) (not b!212421) (not b!212405) (not b_lambda!7727) (not bm!20096) tp_is_empty!5463 (not b!212402) (not b!212335) (not b!212400) (not b_next!5601) (not b!212381) (not bm!20113) (not b!212380) (not b!212386) (not b!212397) (not b_lambda!7723) (not b!212415) (not b!212363) b_and!12445 (not b!212450) (not bm!20105) (not b!212451) (not b!212445) (not d!58119) (not bm!20102) (not b_lambda!7729) (not b!212433) (not b!212379) (not bm!20101) (not b!212374) (not b!212367) (not d!58113) (not b!212375) (not b!212317) (not b!212368) (not bm!20122) (not b!212320) (not bm!20125) (not b!212377) (not bm!20111) (not b!212325) (not d!58123) (not b!212364) (not b!212410) (not b!212369) (not b!212373) (not d!58117) (not b!212447) (not b!212393) (not bm!20119) (not b!212330) (not b!212432) (not b!212422) (not b_lambda!7725) (not d!58115) (not mapNonEmpty!9290) (not d!58131) (not bm!20112) (not b!212409) (not b_lambda!7721) (not b!212404) (not bm!20098) (not b!212385) (not bm!20118) (not b!212329) (not b!212324) (not bm!20106) (not b!212376) (not d!58121) (not b_lambda!7719))
(check-sat b_and!12445 (not b_next!5601))
