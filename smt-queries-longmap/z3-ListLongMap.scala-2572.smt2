; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39236 () Bool)

(assert start!39236)

(declare-fun b_free!9517 () Bool)

(declare-fun b_next!9517 () Bool)

(assert (=> start!39236 (= b_free!9517 (not b_next!9517))))

(declare-fun tp!34079 () Bool)

(declare-fun b_and!16883 () Bool)

(assert (=> start!39236 (= tp!34079 b_and!16883)))

(declare-fun b!414268 () Bool)

(declare-fun res!240921 () Bool)

(declare-fun e!247556 () Bool)

(assert (=> b!414268 (=> (not res!240921) (not e!247556))))

(declare-datatypes ((array!25185 0))(
  ( (array!25186 (arr!12042 (Array (_ BitVec 32) (_ BitVec 64))) (size!12395 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25185)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414268 (= res!240921 (or (= (select (arr!12042 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12042 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15331 0))(
  ( (V!15332 (val!5379 Int)) )
))
(declare-fun zeroValue!515 () V!15331)

(declare-fun lt!189794 () array!25185)

(declare-datatypes ((ValueCell!4991 0))(
  ( (ValueCellFull!4991 (v!7620 V!15331)) (EmptyCell!4991) )
))
(declare-datatypes ((array!25187 0))(
  ( (array!25188 (arr!12043 (Array (_ BitVec 32) ValueCell!4991)) (size!12396 (_ BitVec 32))) )
))
(declare-fun lt!189790 () array!25187)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28701 () Bool)

(declare-fun minValue!515 () V!15331)

(declare-fun c!54918 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun _values!549 () array!25187)

(declare-datatypes ((tuple2!6980 0))(
  ( (tuple2!6981 (_1!3501 (_ BitVec 64)) (_2!3501 V!15331)) )
))
(declare-datatypes ((List!6992 0))(
  ( (Nil!6989) (Cons!6988 (h!7844 tuple2!6980) (t!12165 List!6992)) )
))
(declare-datatypes ((ListLongMap!5883 0))(
  ( (ListLongMap!5884 (toList!2957 List!6992)) )
))
(declare-fun call!28705 () ListLongMap!5883)

(declare-fun getCurrentListMapNoExtraKeys!1170 (array!25185 array!25187 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) Int) ListLongMap!5883)

(assert (=> bm!28701 (= call!28705 (getCurrentListMapNoExtraKeys!1170 (ite c!54918 lt!189794 _keys!709) (ite c!54918 lt!189790 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414269 () Bool)

(declare-fun res!240914 () Bool)

(assert (=> b!414269 (=> (not res!240914) (not e!247556))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414269 (= res!240914 (validKeyInArray!0 k0!794))))

(declare-fun call!28704 () ListLongMap!5883)

(declare-fun bm!28702 () Bool)

(assert (=> bm!28702 (= call!28704 (getCurrentListMapNoExtraKeys!1170 (ite c!54918 _keys!709 lt!189794) (ite c!54918 _values!549 lt!189790) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240916 () Bool)

(assert (=> start!39236 (=> (not res!240916) (not e!247556))))

(assert (=> start!39236 (= res!240916 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12395 _keys!709))))))

(assert (=> start!39236 e!247556))

(declare-fun tp_is_empty!10669 () Bool)

(assert (=> start!39236 tp_is_empty!10669))

(assert (=> start!39236 tp!34079))

(assert (=> start!39236 true))

(declare-fun e!247561 () Bool)

(declare-fun array_inv!8834 (array!25187) Bool)

(assert (=> start!39236 (and (array_inv!8834 _values!549) e!247561)))

(declare-fun array_inv!8835 (array!25185) Bool)

(assert (=> start!39236 (array_inv!8835 _keys!709)))

(declare-fun b!414270 () Bool)

(declare-fun res!240923 () Bool)

(assert (=> b!414270 (=> (not res!240923) (not e!247556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414270 (= res!240923 (validMask!0 mask!1025))))

(declare-fun b!414271 () Bool)

(declare-fun e!247558 () Bool)

(declare-fun e!247559 () Bool)

(assert (=> b!414271 (= e!247558 (not e!247559))))

(declare-fun res!240913 () Bool)

(assert (=> b!414271 (=> res!240913 e!247559)))

(assert (=> b!414271 (= res!240913 (validKeyInArray!0 (select (arr!12042 _keys!709) from!863)))))

(declare-fun e!247557 () Bool)

(assert (=> b!414271 e!247557))

(assert (=> b!414271 (= c!54918 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12230 0))(
  ( (Unit!12231) )
))
(declare-fun lt!189793 () Unit!12230)

(declare-fun v!412 () V!15331)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 (array!25185 array!25187 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) (_ BitVec 64) V!15331 (_ BitVec 32) Int) Unit!12230)

(assert (=> b!414271 (= lt!189793 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414272 () Bool)

(declare-fun e!247560 () Bool)

(assert (=> b!414272 (= e!247560 tp_is_empty!10669)))

(declare-fun b!414273 () Bool)

(declare-fun res!240919 () Bool)

(declare-fun e!247562 () Bool)

(assert (=> b!414273 (=> (not res!240919) (not e!247562))))

(assert (=> b!414273 (= res!240919 (bvsle from!863 i!563))))

(declare-fun b!414274 () Bool)

(declare-fun res!240912 () Bool)

(assert (=> b!414274 (=> (not res!240912) (not e!247562))))

(declare-datatypes ((List!6993 0))(
  ( (Nil!6990) (Cons!6989 (h!7845 (_ BitVec 64)) (t!12166 List!6993)) )
))
(declare-fun arrayNoDuplicates!0 (array!25185 (_ BitVec 32) List!6993) Bool)

(assert (=> b!414274 (= res!240912 (arrayNoDuplicates!0 lt!189794 #b00000000000000000000000000000000 Nil!6990))))

(declare-fun b!414275 () Bool)

(assert (=> b!414275 (= e!247562 e!247558)))

(declare-fun res!240922 () Bool)

(assert (=> b!414275 (=> (not res!240922) (not e!247558))))

(assert (=> b!414275 (= res!240922 (= from!863 i!563))))

(declare-fun lt!189792 () ListLongMap!5883)

(assert (=> b!414275 (= lt!189792 (getCurrentListMapNoExtraKeys!1170 lt!189794 lt!189790 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414275 (= lt!189790 (array!25188 (store (arr!12043 _values!549) i!563 (ValueCellFull!4991 v!412)) (size!12396 _values!549)))))

(declare-fun lt!189791 () ListLongMap!5883)

(assert (=> b!414275 (= lt!189791 (getCurrentListMapNoExtraKeys!1170 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414276 () Bool)

(assert (=> b!414276 (= e!247557 (= call!28704 call!28705))))

(declare-fun b!414277 () Bool)

(assert (=> b!414277 (= e!247559 true)))

(declare-fun +!1193 (ListLongMap!5883 tuple2!6980) ListLongMap!5883)

(declare-fun get!5934 (ValueCell!4991 V!15331) V!15331)

(declare-fun dynLambda!644 (Int (_ BitVec 64)) V!15331)

(assert (=> b!414277 (= lt!189792 (+!1193 (getCurrentListMapNoExtraKeys!1170 lt!189794 lt!189790 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6981 (select (arr!12042 lt!189794) from!863) (get!5934 (select (arr!12043 lt!189790) from!863) (dynLambda!644 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414278 () Bool)

(declare-fun e!247563 () Bool)

(assert (=> b!414278 (= e!247563 tp_is_empty!10669)))

(declare-fun mapNonEmpty!17625 () Bool)

(declare-fun mapRes!17625 () Bool)

(declare-fun tp!34080 () Bool)

(assert (=> mapNonEmpty!17625 (= mapRes!17625 (and tp!34080 e!247563))))

(declare-fun mapKey!17625 () (_ BitVec 32))

(declare-fun mapRest!17625 () (Array (_ BitVec 32) ValueCell!4991))

(declare-fun mapValue!17625 () ValueCell!4991)

(assert (=> mapNonEmpty!17625 (= (arr!12043 _values!549) (store mapRest!17625 mapKey!17625 mapValue!17625))))

(declare-fun mapIsEmpty!17625 () Bool)

(assert (=> mapIsEmpty!17625 mapRes!17625))

(declare-fun b!414279 () Bool)

(declare-fun res!240911 () Bool)

(assert (=> b!414279 (=> (not res!240911) (not e!247556))))

(declare-fun arrayContainsKey!0 (array!25185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414279 (= res!240911 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414280 () Bool)

(declare-fun res!240917 () Bool)

(assert (=> b!414280 (=> (not res!240917) (not e!247556))))

(assert (=> b!414280 (= res!240917 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12395 _keys!709))))))

(declare-fun b!414281 () Bool)

(declare-fun res!240915 () Bool)

(assert (=> b!414281 (=> (not res!240915) (not e!247556))))

(assert (=> b!414281 (= res!240915 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6990))))

(declare-fun b!414282 () Bool)

(declare-fun res!240920 () Bool)

(assert (=> b!414282 (=> (not res!240920) (not e!247556))))

(assert (=> b!414282 (= res!240920 (and (= (size!12396 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12395 _keys!709) (size!12396 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414283 () Bool)

(declare-fun res!240918 () Bool)

(assert (=> b!414283 (=> (not res!240918) (not e!247556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25185 (_ BitVec 32)) Bool)

(assert (=> b!414283 (= res!240918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414284 () Bool)

(assert (=> b!414284 (= e!247557 (= call!28705 (+!1193 call!28704 (tuple2!6981 k0!794 v!412))))))

(declare-fun b!414285 () Bool)

(assert (=> b!414285 (= e!247556 e!247562)))

(declare-fun res!240924 () Bool)

(assert (=> b!414285 (=> (not res!240924) (not e!247562))))

(assert (=> b!414285 (= res!240924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189794 mask!1025))))

(assert (=> b!414285 (= lt!189794 (array!25186 (store (arr!12042 _keys!709) i!563 k0!794) (size!12395 _keys!709)))))

(declare-fun b!414286 () Bool)

(assert (=> b!414286 (= e!247561 (and e!247560 mapRes!17625))))

(declare-fun condMapEmpty!17625 () Bool)

(declare-fun mapDefault!17625 () ValueCell!4991)

(assert (=> b!414286 (= condMapEmpty!17625 (= (arr!12043 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4991)) mapDefault!17625)))))

(assert (= (and start!39236 res!240916) b!414270))

(assert (= (and b!414270 res!240923) b!414282))

(assert (= (and b!414282 res!240920) b!414283))

(assert (= (and b!414283 res!240918) b!414281))

(assert (= (and b!414281 res!240915) b!414280))

(assert (= (and b!414280 res!240917) b!414269))

(assert (= (and b!414269 res!240914) b!414268))

(assert (= (and b!414268 res!240921) b!414279))

(assert (= (and b!414279 res!240911) b!414285))

(assert (= (and b!414285 res!240924) b!414274))

(assert (= (and b!414274 res!240912) b!414273))

(assert (= (and b!414273 res!240919) b!414275))

(assert (= (and b!414275 res!240922) b!414271))

(assert (= (and b!414271 c!54918) b!414284))

(assert (= (and b!414271 (not c!54918)) b!414276))

(assert (= (or b!414284 b!414276) bm!28701))

(assert (= (or b!414284 b!414276) bm!28702))

(assert (= (and b!414271 (not res!240913)) b!414277))

(assert (= (and b!414286 condMapEmpty!17625) mapIsEmpty!17625))

(assert (= (and b!414286 (not condMapEmpty!17625)) mapNonEmpty!17625))

(get-info :version)

(assert (= (and mapNonEmpty!17625 ((_ is ValueCellFull!4991) mapValue!17625)) b!414278))

(assert (= (and b!414286 ((_ is ValueCellFull!4991) mapDefault!17625)) b!414272))

(assert (= start!39236 b!414286))

(declare-fun b_lambda!8803 () Bool)

(assert (=> (not b_lambda!8803) (not b!414277)))

(declare-fun t!12164 () Bool)

(declare-fun tb!3131 () Bool)

(assert (=> (and start!39236 (= defaultEntry!557 defaultEntry!557) t!12164) tb!3131))

(declare-fun result!5797 () Bool)

(assert (=> tb!3131 (= result!5797 tp_is_empty!10669)))

(assert (=> b!414277 t!12164))

(declare-fun b_and!16885 () Bool)

(assert (= b_and!16883 (and (=> t!12164 result!5797) b_and!16885)))

(declare-fun m!403029 () Bool)

(assert (=> b!414284 m!403029))

(declare-fun m!403031 () Bool)

(assert (=> b!414274 m!403031))

(declare-fun m!403033 () Bool)

(assert (=> b!414271 m!403033))

(assert (=> b!414271 m!403033))

(declare-fun m!403035 () Bool)

(assert (=> b!414271 m!403035))

(declare-fun m!403037 () Bool)

(assert (=> b!414271 m!403037))

(declare-fun m!403039 () Bool)

(assert (=> b!414277 m!403039))

(declare-fun m!403041 () Bool)

(assert (=> b!414277 m!403041))

(declare-fun m!403043 () Bool)

(assert (=> b!414277 m!403043))

(assert (=> b!414277 m!403039))

(declare-fun m!403045 () Bool)

(assert (=> b!414277 m!403045))

(declare-fun m!403047 () Bool)

(assert (=> b!414277 m!403047))

(assert (=> b!414277 m!403047))

(assert (=> b!414277 m!403041))

(declare-fun m!403049 () Bool)

(assert (=> b!414277 m!403049))

(declare-fun m!403051 () Bool)

(assert (=> b!414270 m!403051))

(declare-fun m!403053 () Bool)

(assert (=> b!414283 m!403053))

(declare-fun m!403055 () Bool)

(assert (=> b!414268 m!403055))

(declare-fun m!403057 () Bool)

(assert (=> b!414281 m!403057))

(declare-fun m!403059 () Bool)

(assert (=> start!39236 m!403059))

(declare-fun m!403061 () Bool)

(assert (=> start!39236 m!403061))

(declare-fun m!403063 () Bool)

(assert (=> bm!28701 m!403063))

(declare-fun m!403065 () Bool)

(assert (=> b!414269 m!403065))

(declare-fun m!403067 () Bool)

(assert (=> b!414285 m!403067))

(declare-fun m!403069 () Bool)

(assert (=> b!414285 m!403069))

(declare-fun m!403071 () Bool)

(assert (=> b!414279 m!403071))

(declare-fun m!403073 () Bool)

(assert (=> bm!28702 m!403073))

(declare-fun m!403075 () Bool)

(assert (=> mapNonEmpty!17625 m!403075))

(declare-fun m!403077 () Bool)

(assert (=> b!414275 m!403077))

(declare-fun m!403079 () Bool)

(assert (=> b!414275 m!403079))

(declare-fun m!403081 () Bool)

(assert (=> b!414275 m!403081))

(check-sat (not b!414270) (not b_next!9517) tp_is_empty!10669 b_and!16885 (not b!414281) (not b!414275) (not b!414271) (not b!414285) (not bm!28702) (not b!414283) (not b_lambda!8803) (not b!414279) (not mapNonEmpty!17625) (not start!39236) (not b!414274) (not b!414284) (not b!414269) (not bm!28701) (not b!414277))
(check-sat b_and!16885 (not b_next!9517))
