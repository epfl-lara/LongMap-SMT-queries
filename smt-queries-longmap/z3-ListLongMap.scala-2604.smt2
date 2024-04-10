; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39444 () Bool)

(assert start!39444)

(declare-fun b_free!9711 () Bool)

(declare-fun b_next!9711 () Bool)

(assert (=> start!39444 (= b_free!9711 (not b_next!9711))))

(declare-fun tp!34662 () Bool)

(declare-fun b_and!17297 () Bool)

(assert (=> start!39444 (= tp!34662 b_and!17297)))

(declare-fun b!420262 () Bool)

(declare-fun res!245115 () Bool)

(declare-fun e!250351 () Bool)

(assert (=> b!420262 (=> (not res!245115) (not e!250351))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25575 0))(
  ( (array!25576 (arr!12237 (Array (_ BitVec 32) (_ BitVec 64))) (size!12589 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25575)

(assert (=> b!420262 (= res!245115 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12589 _keys!709))))))

(declare-fun b!420263 () Bool)

(declare-fun e!250353 () Bool)

(declare-fun e!250348 () Bool)

(assert (=> b!420263 (= e!250353 e!250348)))

(declare-fun res!245124 () Bool)

(assert (=> b!420263 (=> (not res!245124) (not e!250348))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!420263 (= res!245124 (= from!863 i!563))))

(declare-datatypes ((V!15589 0))(
  ( (V!15590 (val!5476 Int)) )
))
(declare-fun minValue!515 () V!15589)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!192813 () array!25575)

(declare-datatypes ((ValueCell!5088 0))(
  ( (ValueCellFull!5088 (v!7723 V!15589)) (EmptyCell!5088) )
))
(declare-datatypes ((array!25577 0))(
  ( (array!25578 (arr!12238 (Array (_ BitVec 32) ValueCell!5088)) (size!12590 (_ BitVec 32))) )
))
(declare-fun lt!192815 () array!25577)

(declare-fun zeroValue!515 () V!15589)

(declare-datatypes ((tuple2!7174 0))(
  ( (tuple2!7175 (_1!3598 (_ BitVec 64)) (_2!3598 V!15589)) )
))
(declare-datatypes ((List!7181 0))(
  ( (Nil!7178) (Cons!7177 (h!8033 tuple2!7174) (t!12557 List!7181)) )
))
(declare-datatypes ((ListLongMap!6087 0))(
  ( (ListLongMap!6088 (toList!3059 List!7181)) )
))
(declare-fun lt!192808 () ListLongMap!6087)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1264 (array!25575 array!25577 (_ BitVec 32) (_ BitVec 32) V!15589 V!15589 (_ BitVec 32) Int) ListLongMap!6087)

(assert (=> b!420263 (= lt!192808 (getCurrentListMapNoExtraKeys!1264 lt!192813 lt!192815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25577)

(declare-fun v!412 () V!15589)

(assert (=> b!420263 (= lt!192815 (array!25578 (store (arr!12238 _values!549) i!563 (ValueCellFull!5088 v!412)) (size!12590 _values!549)))))

(declare-fun lt!192814 () ListLongMap!6087)

(assert (=> b!420263 (= lt!192814 (getCurrentListMapNoExtraKeys!1264 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!29311 () ListLongMap!6087)

(declare-fun c!55280 () Bool)

(declare-fun bm!29308 () Bool)

(assert (=> bm!29308 (= call!29311 (getCurrentListMapNoExtraKeys!1264 (ite c!55280 lt!192813 _keys!709) (ite c!55280 lt!192815 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420264 () Bool)

(assert (=> b!420264 (= e!250351 e!250353)))

(declare-fun res!245117 () Bool)

(assert (=> b!420264 (=> (not res!245117) (not e!250353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25575 (_ BitVec 32)) Bool)

(assert (=> b!420264 (= res!245117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192813 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!420264 (= lt!192813 (array!25576 (store (arr!12237 _keys!709) i!563 k0!794) (size!12589 _keys!709)))))

(declare-fun b!420265 () Bool)

(declare-fun res!245119 () Bool)

(assert (=> b!420265 (=> (not res!245119) (not e!250351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420265 (= res!245119 (validMask!0 mask!1025))))

(declare-fun b!420266 () Bool)

(declare-fun res!245118 () Bool)

(assert (=> b!420266 (=> (not res!245118) (not e!250351))))

(assert (=> b!420266 (= res!245118 (and (= (size!12590 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12589 _keys!709) (size!12590 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420267 () Bool)

(declare-fun e!250354 () Bool)

(assert (=> b!420267 (= e!250354 true)))

(declare-fun lt!192811 () ListLongMap!6087)

(declare-fun lt!192810 () V!15589)

(declare-fun lt!192805 () tuple2!7174)

(declare-fun +!1256 (ListLongMap!6087 tuple2!7174) ListLongMap!6087)

(assert (=> b!420267 (= (+!1256 lt!192811 lt!192805) (+!1256 (+!1256 lt!192811 (tuple2!7175 k0!794 lt!192810)) lt!192805))))

(declare-fun lt!192809 () V!15589)

(assert (=> b!420267 (= lt!192805 (tuple2!7175 k0!794 lt!192809))))

(declare-datatypes ((Unit!12416 0))(
  ( (Unit!12417) )
))
(declare-fun lt!192807 () Unit!12416)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!53 (ListLongMap!6087 (_ BitVec 64) V!15589 V!15589) Unit!12416)

(assert (=> b!420267 (= lt!192807 (addSameAsAddTwiceSameKeyDiffValues!53 lt!192811 k0!794 lt!192810 lt!192809))))

(declare-fun lt!192806 () V!15589)

(declare-fun get!6075 (ValueCell!5088 V!15589) V!15589)

(assert (=> b!420267 (= lt!192810 (get!6075 (select (arr!12238 _values!549) from!863) lt!192806))))

(assert (=> b!420267 (= lt!192808 (+!1256 lt!192811 (tuple2!7175 (select (arr!12237 lt!192813) from!863) lt!192809)))))

(assert (=> b!420267 (= lt!192809 (get!6075 (select (store (arr!12238 _values!549) i!563 (ValueCellFull!5088 v!412)) from!863) lt!192806))))

(declare-fun dynLambda!724 (Int (_ BitVec 64)) V!15589)

(assert (=> b!420267 (= lt!192806 (dynLambda!724 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420267 (= lt!192811 (getCurrentListMapNoExtraKeys!1264 lt!192813 lt!192815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17916 () Bool)

(declare-fun mapRes!17916 () Bool)

(declare-fun tp!34661 () Bool)

(declare-fun e!250350 () Bool)

(assert (=> mapNonEmpty!17916 (= mapRes!17916 (and tp!34661 e!250350))))

(declare-fun mapValue!17916 () ValueCell!5088)

(declare-fun mapRest!17916 () (Array (_ BitVec 32) ValueCell!5088))

(declare-fun mapKey!17916 () (_ BitVec 32))

(assert (=> mapNonEmpty!17916 (= (arr!12238 _values!549) (store mapRest!17916 mapKey!17916 mapValue!17916))))

(declare-fun b!420268 () Bool)

(declare-fun res!245123 () Bool)

(assert (=> b!420268 (=> (not res!245123) (not e!250351))))

(assert (=> b!420268 (= res!245123 (or (= (select (arr!12237 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12237 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!245126 () Bool)

(assert (=> start!39444 (=> (not res!245126) (not e!250351))))

(assert (=> start!39444 (= res!245126 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12589 _keys!709))))))

(assert (=> start!39444 e!250351))

(declare-fun tp_is_empty!10863 () Bool)

(assert (=> start!39444 tp_is_empty!10863))

(assert (=> start!39444 tp!34662))

(assert (=> start!39444 true))

(declare-fun e!250352 () Bool)

(declare-fun array_inv!8920 (array!25577) Bool)

(assert (=> start!39444 (and (array_inv!8920 _values!549) e!250352)))

(declare-fun array_inv!8921 (array!25575) Bool)

(assert (=> start!39444 (array_inv!8921 _keys!709)))

(declare-fun b!420269 () Bool)

(declare-fun res!245121 () Bool)

(assert (=> b!420269 (=> (not res!245121) (not e!250351))))

(declare-datatypes ((List!7182 0))(
  ( (Nil!7179) (Cons!7178 (h!8034 (_ BitVec 64)) (t!12558 List!7182)) )
))
(declare-fun arrayNoDuplicates!0 (array!25575 (_ BitVec 32) List!7182) Bool)

(assert (=> b!420269 (= res!245121 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7179))))

(declare-fun b!420270 () Bool)

(assert (=> b!420270 (= e!250348 (not e!250354))))

(declare-fun res!245125 () Bool)

(assert (=> b!420270 (=> res!245125 e!250354)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420270 (= res!245125 (validKeyInArray!0 (select (arr!12237 _keys!709) from!863)))))

(declare-fun e!250356 () Bool)

(assert (=> b!420270 e!250356))

(assert (=> b!420270 (= c!55280 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192812 () Unit!12416)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!456 (array!25575 array!25577 (_ BitVec 32) (_ BitVec 32) V!15589 V!15589 (_ BitVec 32) (_ BitVec 64) V!15589 (_ BitVec 32) Int) Unit!12416)

(assert (=> b!420270 (= lt!192812 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!456 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420271 () Bool)

(declare-fun e!250355 () Bool)

(assert (=> b!420271 (= e!250355 tp_is_empty!10863)))

(declare-fun b!420272 () Bool)

(declare-fun call!29312 () ListLongMap!6087)

(assert (=> b!420272 (= e!250356 (= call!29311 (+!1256 call!29312 (tuple2!7175 k0!794 v!412))))))

(declare-fun b!420273 () Bool)

(declare-fun res!245116 () Bool)

(assert (=> b!420273 (=> (not res!245116) (not e!250351))))

(declare-fun arrayContainsKey!0 (array!25575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420273 (= res!245116 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29309 () Bool)

(assert (=> bm!29309 (= call!29312 (getCurrentListMapNoExtraKeys!1264 (ite c!55280 _keys!709 lt!192813) (ite c!55280 _values!549 lt!192815) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420274 () Bool)

(assert (=> b!420274 (= e!250350 tp_is_empty!10863)))

(declare-fun mapIsEmpty!17916 () Bool)

(assert (=> mapIsEmpty!17916 mapRes!17916))

(declare-fun b!420275 () Bool)

(assert (=> b!420275 (= e!250356 (= call!29312 call!29311))))

(declare-fun b!420276 () Bool)

(declare-fun res!245120 () Bool)

(assert (=> b!420276 (=> (not res!245120) (not e!250353))))

(assert (=> b!420276 (= res!245120 (bvsle from!863 i!563))))

(declare-fun b!420277 () Bool)

(declare-fun res!245114 () Bool)

(assert (=> b!420277 (=> (not res!245114) (not e!250353))))

(assert (=> b!420277 (= res!245114 (arrayNoDuplicates!0 lt!192813 #b00000000000000000000000000000000 Nil!7179))))

(declare-fun b!420278 () Bool)

(declare-fun res!245122 () Bool)

(assert (=> b!420278 (=> (not res!245122) (not e!250351))))

(assert (=> b!420278 (= res!245122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420279 () Bool)

(assert (=> b!420279 (= e!250352 (and e!250355 mapRes!17916))))

(declare-fun condMapEmpty!17916 () Bool)

(declare-fun mapDefault!17916 () ValueCell!5088)

(assert (=> b!420279 (= condMapEmpty!17916 (= (arr!12238 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5088)) mapDefault!17916)))))

(declare-fun b!420280 () Bool)

(declare-fun res!245127 () Bool)

(assert (=> b!420280 (=> (not res!245127) (not e!250351))))

(assert (=> b!420280 (= res!245127 (validKeyInArray!0 k0!794))))

(assert (= (and start!39444 res!245126) b!420265))

(assert (= (and b!420265 res!245119) b!420266))

(assert (= (and b!420266 res!245118) b!420278))

(assert (= (and b!420278 res!245122) b!420269))

(assert (= (and b!420269 res!245121) b!420262))

(assert (= (and b!420262 res!245115) b!420280))

(assert (= (and b!420280 res!245127) b!420268))

(assert (= (and b!420268 res!245123) b!420273))

(assert (= (and b!420273 res!245116) b!420264))

(assert (= (and b!420264 res!245117) b!420277))

(assert (= (and b!420277 res!245114) b!420276))

(assert (= (and b!420276 res!245120) b!420263))

(assert (= (and b!420263 res!245124) b!420270))

(assert (= (and b!420270 c!55280) b!420272))

(assert (= (and b!420270 (not c!55280)) b!420275))

(assert (= (or b!420272 b!420275) bm!29308))

(assert (= (or b!420272 b!420275) bm!29309))

(assert (= (and b!420270 (not res!245125)) b!420267))

(assert (= (and b!420279 condMapEmpty!17916) mapIsEmpty!17916))

(assert (= (and b!420279 (not condMapEmpty!17916)) mapNonEmpty!17916))

(get-info :version)

(assert (= (and mapNonEmpty!17916 ((_ is ValueCellFull!5088) mapValue!17916)) b!420274))

(assert (= (and b!420279 ((_ is ValueCellFull!5088) mapDefault!17916)) b!420271))

(assert (= start!39444 b!420279))

(declare-fun b_lambda!9015 () Bool)

(assert (=> (not b_lambda!9015) (not b!420267)))

(declare-fun t!12556 () Bool)

(declare-fun tb!3333 () Bool)

(assert (=> (and start!39444 (= defaultEntry!557 defaultEntry!557) t!12556) tb!3333))

(declare-fun result!6193 () Bool)

(assert (=> tb!3333 (= result!6193 tp_is_empty!10863)))

(assert (=> b!420267 t!12556))

(declare-fun b_and!17299 () Bool)

(assert (= b_and!17297 (and (=> t!12556 result!6193) b_and!17299)))

(declare-fun m!409865 () Bool)

(assert (=> b!420263 m!409865))

(declare-fun m!409867 () Bool)

(assert (=> b!420263 m!409867))

(declare-fun m!409869 () Bool)

(assert (=> b!420263 m!409869))

(declare-fun m!409871 () Bool)

(assert (=> mapNonEmpty!17916 m!409871))

(declare-fun m!409873 () Bool)

(assert (=> b!420268 m!409873))

(declare-fun m!409875 () Bool)

(assert (=> b!420270 m!409875))

(assert (=> b!420270 m!409875))

(declare-fun m!409877 () Bool)

(assert (=> b!420270 m!409877))

(declare-fun m!409879 () Bool)

(assert (=> b!420270 m!409879))

(declare-fun m!409881 () Bool)

(assert (=> b!420267 m!409881))

(declare-fun m!409883 () Bool)

(assert (=> b!420267 m!409883))

(declare-fun m!409885 () Bool)

(assert (=> b!420267 m!409885))

(declare-fun m!409887 () Bool)

(assert (=> b!420267 m!409887))

(assert (=> b!420267 m!409881))

(declare-fun m!409889 () Bool)

(assert (=> b!420267 m!409889))

(assert (=> b!420267 m!409885))

(declare-fun m!409891 () Bool)

(assert (=> b!420267 m!409891))

(assert (=> b!420267 m!409867))

(declare-fun m!409893 () Bool)

(assert (=> b!420267 m!409893))

(declare-fun m!409895 () Bool)

(assert (=> b!420267 m!409895))

(declare-fun m!409897 () Bool)

(assert (=> b!420267 m!409897))

(declare-fun m!409899 () Bool)

(assert (=> b!420267 m!409899))

(assert (=> b!420267 m!409899))

(declare-fun m!409901 () Bool)

(assert (=> b!420267 m!409901))

(declare-fun m!409903 () Bool)

(assert (=> b!420267 m!409903))

(declare-fun m!409905 () Bool)

(assert (=> b!420273 m!409905))

(declare-fun m!409907 () Bool)

(assert (=> b!420269 m!409907))

(declare-fun m!409909 () Bool)

(assert (=> start!39444 m!409909))

(declare-fun m!409911 () Bool)

(assert (=> start!39444 m!409911))

(declare-fun m!409913 () Bool)

(assert (=> bm!29309 m!409913))

(declare-fun m!409915 () Bool)

(assert (=> b!420278 m!409915))

(declare-fun m!409917 () Bool)

(assert (=> b!420272 m!409917))

(declare-fun m!409919 () Bool)

(assert (=> bm!29308 m!409919))

(declare-fun m!409921 () Bool)

(assert (=> b!420277 m!409921))

(declare-fun m!409923 () Bool)

(assert (=> b!420280 m!409923))

(declare-fun m!409925 () Bool)

(assert (=> b!420265 m!409925))

(declare-fun m!409927 () Bool)

(assert (=> b!420264 m!409927))

(declare-fun m!409929 () Bool)

(assert (=> b!420264 m!409929))

(check-sat (not b!420267) (not start!39444) (not b!420272) (not b!420273) (not bm!29308) (not b!420280) (not b!420264) (not mapNonEmpty!17916) tp_is_empty!10863 b_and!17299 (not bm!29309) (not b_next!9711) (not b!420263) (not b!420278) (not b!420270) (not b!420265) (not b_lambda!9015) (not b!420269) (not b!420277))
(check-sat b_and!17299 (not b_next!9711))
