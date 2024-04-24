; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39494 () Bool)

(assert start!39494)

(declare-fun b_free!9775 () Bool)

(declare-fun b_next!9775 () Bool)

(assert (=> start!39494 (= b_free!9775 (not b_next!9775))))

(declare-fun tp!34854 () Bool)

(declare-fun b_and!17439 () Bool)

(assert (=> start!39494 (= tp!34854 b_and!17439)))

(declare-datatypes ((V!15675 0))(
  ( (V!15676 (val!5508 Int)) )
))
(declare-fun minValue!515 () V!15675)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7114 0))(
  ( (tuple2!7115 (_1!3568 (_ BitVec 64)) (_2!3568 V!15675)) )
))
(declare-datatypes ((List!7115 0))(
  ( (Nil!7112) (Cons!7111 (h!7967 tuple2!7114) (t!12547 List!7115)) )
))
(declare-datatypes ((ListLongMap!6029 0))(
  ( (ListLongMap!6030 (toList!3030 List!7115)) )
))
(declare-fun call!29490 () ListLongMap!6029)

(declare-datatypes ((ValueCell!5120 0))(
  ( (ValueCellFull!5120 (v!7756 V!15675)) (EmptyCell!5120) )
))
(declare-datatypes ((array!25708 0))(
  ( (array!25709 (arr!12303 (Array (_ BitVec 32) ValueCell!5120)) (size!12655 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25708)

(declare-fun lt!193884 () array!25708)

(declare-fun bm!29487 () Bool)

(declare-datatypes ((array!25710 0))(
  ( (array!25711 (arr!12304 (Array (_ BitVec 32) (_ BitVec 64))) (size!12656 (_ BitVec 32))) )
))
(declare-fun lt!193888 () array!25710)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25710)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55353 () Bool)

(declare-fun zeroValue!515 () V!15675)

(declare-fun getCurrentListMapNoExtraKeys!1276 (array!25710 array!25708 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) Int) ListLongMap!6029)

(assert (=> bm!29487 (= call!29490 (getCurrentListMapNoExtraKeys!1276 (ite c!55353 lt!193888 _keys!709) (ite c!55353 lt!193884 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18012 () Bool)

(declare-fun mapRes!18012 () Bool)

(assert (=> mapIsEmpty!18012 mapRes!18012))

(declare-fun b!422101 () Bool)

(declare-fun res!246462 () Bool)

(declare-fun e!251183 () Bool)

(assert (=> b!422101 (=> (not res!246462) (not e!251183))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422101 (= res!246462 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12656 _keys!709))))))

(declare-fun b!422103 () Bool)

(declare-fun e!251187 () Bool)

(declare-fun e!251184 () Bool)

(assert (=> b!422103 (= e!251187 e!251184)))

(declare-fun res!246467 () Bool)

(assert (=> b!422103 (=> (not res!246467) (not e!251184))))

(assert (=> b!422103 (= res!246467 (= from!863 i!563))))

(declare-fun lt!193889 () ListLongMap!6029)

(assert (=> b!422103 (= lt!193889 (getCurrentListMapNoExtraKeys!1276 lt!193888 lt!193884 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15675)

(assert (=> b!422103 (= lt!193884 (array!25709 (store (arr!12303 _values!549) i!563 (ValueCellFull!5120 v!412)) (size!12655 _values!549)))))

(declare-fun lt!193883 () ListLongMap!6029)

(assert (=> b!422103 (= lt!193883 (getCurrentListMapNoExtraKeys!1276 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422104 () Bool)

(declare-fun res!246463 () Bool)

(assert (=> b!422104 (=> (not res!246463) (not e!251183))))

(declare-datatypes ((List!7116 0))(
  ( (Nil!7113) (Cons!7112 (h!7968 (_ BitVec 64)) (t!12548 List!7116)) )
))
(declare-fun arrayNoDuplicates!0 (array!25710 (_ BitVec 32) List!7116) Bool)

(assert (=> b!422104 (= res!246463 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7113))))

(declare-fun call!29491 () ListLongMap!6029)

(declare-fun bm!29488 () Bool)

(assert (=> bm!29488 (= call!29491 (getCurrentListMapNoExtraKeys!1276 (ite c!55353 _keys!709 lt!193888) (ite c!55353 _values!549 lt!193884) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422105 () Bool)

(declare-fun res!246459 () Bool)

(assert (=> b!422105 (=> (not res!246459) (not e!251187))))

(assert (=> b!422105 (= res!246459 (bvsle from!863 i!563))))

(declare-fun b!422106 () Bool)

(declare-fun res!246464 () Bool)

(assert (=> b!422106 (=> (not res!246464) (not e!251183))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422106 (= res!246464 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422107 () Bool)

(declare-fun res!246458 () Bool)

(assert (=> b!422107 (=> (not res!246458) (not e!251183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422107 (= res!246458 (validMask!0 mask!1025))))

(declare-fun b!422108 () Bool)

(declare-fun e!251185 () Bool)

(declare-fun tp_is_empty!10927 () Bool)

(assert (=> b!422108 (= e!251185 tp_is_empty!10927)))

(declare-fun b!422109 () Bool)

(declare-fun e!251181 () Bool)

(assert (=> b!422109 (= e!251181 (= call!29491 call!29490))))

(declare-fun b!422110 () Bool)

(declare-fun e!251186 () Bool)

(assert (=> b!422110 (= e!251186 true)))

(declare-fun lt!193881 () ListLongMap!6029)

(declare-fun lt!193880 () tuple2!7114)

(declare-fun lt!193886 () V!15675)

(declare-fun +!1290 (ListLongMap!6029 tuple2!7114) ListLongMap!6029)

(assert (=> b!422110 (= (+!1290 lt!193881 lt!193880) (+!1290 (+!1290 lt!193881 (tuple2!7115 k0!794 lt!193886)) lt!193880))))

(declare-fun lt!193890 () V!15675)

(assert (=> b!422110 (= lt!193880 (tuple2!7115 k0!794 lt!193890))))

(declare-datatypes ((Unit!12453 0))(
  ( (Unit!12454) )
))
(declare-fun lt!193882 () Unit!12453)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!78 (ListLongMap!6029 (_ BitVec 64) V!15675 V!15675) Unit!12453)

(assert (=> b!422110 (= lt!193882 (addSameAsAddTwiceSameKeyDiffValues!78 lt!193881 k0!794 lt!193886 lt!193890))))

(declare-fun lt!193887 () V!15675)

(declare-fun get!6124 (ValueCell!5120 V!15675) V!15675)

(assert (=> b!422110 (= lt!193886 (get!6124 (select (arr!12303 _values!549) from!863) lt!193887))))

(assert (=> b!422110 (= lt!193889 (+!1290 lt!193881 (tuple2!7115 (select (arr!12304 lt!193888) from!863) lt!193890)))))

(assert (=> b!422110 (= lt!193890 (get!6124 (select (store (arr!12303 _values!549) i!563 (ValueCellFull!5120 v!412)) from!863) lt!193887))))

(declare-fun dynLambda!745 (Int (_ BitVec 64)) V!15675)

(assert (=> b!422110 (= lt!193887 (dynLambda!745 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!422110 (= lt!193881 (getCurrentListMapNoExtraKeys!1276 lt!193888 lt!193884 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422111 () Bool)

(assert (=> b!422111 (= e!251183 e!251187)))

(declare-fun res!246465 () Bool)

(assert (=> b!422111 (=> (not res!246465) (not e!251187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25710 (_ BitVec 32)) Bool)

(assert (=> b!422111 (= res!246465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193888 mask!1025))))

(assert (=> b!422111 (= lt!193888 (array!25711 (store (arr!12304 _keys!709) i!563 k0!794) (size!12656 _keys!709)))))

(declare-fun b!422112 () Bool)

(declare-fun res!246461 () Bool)

(assert (=> b!422112 (=> (not res!246461) (not e!251183))))

(assert (=> b!422112 (= res!246461 (and (= (size!12655 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12656 _keys!709) (size!12655 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422113 () Bool)

(declare-fun res!246460 () Bool)

(assert (=> b!422113 (=> (not res!246460) (not e!251183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422113 (= res!246460 (validKeyInArray!0 k0!794))))

(declare-fun b!422102 () Bool)

(assert (=> b!422102 (= e!251184 (not e!251186))))

(declare-fun res!246466 () Bool)

(assert (=> b!422102 (=> res!246466 e!251186)))

(assert (=> b!422102 (= res!246466 (validKeyInArray!0 (select (arr!12304 _keys!709) from!863)))))

(assert (=> b!422102 e!251181))

(assert (=> b!422102 (= c!55353 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193885 () Unit!12453)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!473 (array!25710 array!25708 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) (_ BitVec 64) V!15675 (_ BitVec 32) Int) Unit!12453)

(assert (=> b!422102 (= lt!193885 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!473 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!246468 () Bool)

(assert (=> start!39494 (=> (not res!246468) (not e!251183))))

(assert (=> start!39494 (= res!246468 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12656 _keys!709))))))

(assert (=> start!39494 e!251183))

(assert (=> start!39494 tp_is_empty!10927))

(assert (=> start!39494 tp!34854))

(assert (=> start!39494 true))

(declare-fun e!251180 () Bool)

(declare-fun array_inv!9042 (array!25708) Bool)

(assert (=> start!39494 (and (array_inv!9042 _values!549) e!251180)))

(declare-fun array_inv!9043 (array!25710) Bool)

(assert (=> start!39494 (array_inv!9043 _keys!709)))

(declare-fun b!422114 () Bool)

(declare-fun res!246455 () Bool)

(assert (=> b!422114 (=> (not res!246455) (not e!251187))))

(assert (=> b!422114 (= res!246455 (arrayNoDuplicates!0 lt!193888 #b00000000000000000000000000000000 Nil!7113))))

(declare-fun b!422115 () Bool)

(declare-fun e!251182 () Bool)

(assert (=> b!422115 (= e!251182 tp_is_empty!10927)))

(declare-fun b!422116 () Bool)

(declare-fun res!246456 () Bool)

(assert (=> b!422116 (=> (not res!246456) (not e!251183))))

(assert (=> b!422116 (= res!246456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422117 () Bool)

(assert (=> b!422117 (= e!251181 (= call!29490 (+!1290 call!29491 (tuple2!7115 k0!794 v!412))))))

(declare-fun mapNonEmpty!18012 () Bool)

(declare-fun tp!34853 () Bool)

(assert (=> mapNonEmpty!18012 (= mapRes!18012 (and tp!34853 e!251185))))

(declare-fun mapValue!18012 () ValueCell!5120)

(declare-fun mapRest!18012 () (Array (_ BitVec 32) ValueCell!5120))

(declare-fun mapKey!18012 () (_ BitVec 32))

(assert (=> mapNonEmpty!18012 (= (arr!12303 _values!549) (store mapRest!18012 mapKey!18012 mapValue!18012))))

(declare-fun b!422118 () Bool)

(declare-fun res!246457 () Bool)

(assert (=> b!422118 (=> (not res!246457) (not e!251183))))

(assert (=> b!422118 (= res!246457 (or (= (select (arr!12304 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12304 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422119 () Bool)

(assert (=> b!422119 (= e!251180 (and e!251182 mapRes!18012))))

(declare-fun condMapEmpty!18012 () Bool)

(declare-fun mapDefault!18012 () ValueCell!5120)

(assert (=> b!422119 (= condMapEmpty!18012 (= (arr!12303 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5120)) mapDefault!18012)))))

(assert (= (and start!39494 res!246468) b!422107))

(assert (= (and b!422107 res!246458) b!422112))

(assert (= (and b!422112 res!246461) b!422116))

(assert (= (and b!422116 res!246456) b!422104))

(assert (= (and b!422104 res!246463) b!422101))

(assert (= (and b!422101 res!246462) b!422113))

(assert (= (and b!422113 res!246460) b!422118))

(assert (= (and b!422118 res!246457) b!422106))

(assert (= (and b!422106 res!246464) b!422111))

(assert (= (and b!422111 res!246465) b!422114))

(assert (= (and b!422114 res!246455) b!422105))

(assert (= (and b!422105 res!246459) b!422103))

(assert (= (and b!422103 res!246467) b!422102))

(assert (= (and b!422102 c!55353) b!422117))

(assert (= (and b!422102 (not c!55353)) b!422109))

(assert (= (or b!422117 b!422109) bm!29487))

(assert (= (or b!422117 b!422109) bm!29488))

(assert (= (and b!422102 (not res!246466)) b!422110))

(assert (= (and b!422119 condMapEmpty!18012) mapIsEmpty!18012))

(assert (= (and b!422119 (not condMapEmpty!18012)) mapNonEmpty!18012))

(get-info :version)

(assert (= (and mapNonEmpty!18012 ((_ is ValueCellFull!5120) mapValue!18012)) b!422108))

(assert (= (and b!422119 ((_ is ValueCellFull!5120) mapDefault!18012)) b!422115))

(assert (= start!39494 b!422119))

(declare-fun b_lambda!9101 () Bool)

(assert (=> (not b_lambda!9101) (not b!422110)))

(declare-fun t!12546 () Bool)

(declare-fun tb!3389 () Bool)

(assert (=> (and start!39494 (= defaultEntry!557 defaultEntry!557) t!12546) tb!3389))

(declare-fun result!6313 () Bool)

(assert (=> tb!3389 (= result!6313 tp_is_empty!10927)))

(assert (=> b!422110 t!12546))

(declare-fun b_and!17441 () Bool)

(assert (= b_and!17439 (and (=> t!12546 result!6313) b_and!17441)))

(declare-fun m!412193 () Bool)

(assert (=> b!422107 m!412193))

(declare-fun m!412195 () Bool)

(assert (=> b!422104 m!412195))

(declare-fun m!412197 () Bool)

(assert (=> b!422118 m!412197))

(declare-fun m!412199 () Bool)

(assert (=> b!422111 m!412199))

(declare-fun m!412201 () Bool)

(assert (=> b!422111 m!412201))

(declare-fun m!412203 () Bool)

(assert (=> b!422116 m!412203))

(declare-fun m!412205 () Bool)

(assert (=> b!422110 m!412205))

(declare-fun m!412207 () Bool)

(assert (=> b!422110 m!412207))

(declare-fun m!412209 () Bool)

(assert (=> b!422110 m!412209))

(declare-fun m!412211 () Bool)

(assert (=> b!422110 m!412211))

(declare-fun m!412213 () Bool)

(assert (=> b!422110 m!412213))

(declare-fun m!412215 () Bool)

(assert (=> b!422110 m!412215))

(declare-fun m!412217 () Bool)

(assert (=> b!422110 m!412217))

(declare-fun m!412219 () Bool)

(assert (=> b!422110 m!412219))

(assert (=> b!422110 m!412217))

(declare-fun m!412221 () Bool)

(assert (=> b!422110 m!412221))

(assert (=> b!422110 m!412215))

(declare-fun m!412223 () Bool)

(assert (=> b!422110 m!412223))

(assert (=> b!422110 m!412207))

(declare-fun m!412225 () Bool)

(assert (=> b!422110 m!412225))

(declare-fun m!412227 () Bool)

(assert (=> b!422110 m!412227))

(declare-fun m!412229 () Bool)

(assert (=> b!422110 m!412229))

(declare-fun m!412231 () Bool)

(assert (=> start!39494 m!412231))

(declare-fun m!412233 () Bool)

(assert (=> start!39494 m!412233))

(declare-fun m!412235 () Bool)

(assert (=> b!422106 m!412235))

(declare-fun m!412237 () Bool)

(assert (=> b!422113 m!412237))

(declare-fun m!412239 () Bool)

(assert (=> b!422117 m!412239))

(declare-fun m!412241 () Bool)

(assert (=> bm!29487 m!412241))

(declare-fun m!412243 () Bool)

(assert (=> mapNonEmpty!18012 m!412243))

(declare-fun m!412245 () Bool)

(assert (=> b!422103 m!412245))

(assert (=> b!422103 m!412211))

(declare-fun m!412247 () Bool)

(assert (=> b!422103 m!412247))

(declare-fun m!412249 () Bool)

(assert (=> b!422102 m!412249))

(assert (=> b!422102 m!412249))

(declare-fun m!412251 () Bool)

(assert (=> b!422102 m!412251))

(declare-fun m!412253 () Bool)

(assert (=> b!422102 m!412253))

(declare-fun m!412255 () Bool)

(assert (=> b!422114 m!412255))

(declare-fun m!412257 () Bool)

(assert (=> bm!29488 m!412257))

(check-sat (not b!422106) (not b!422104) tp_is_empty!10927 b_and!17441 (not b!422110) (not b!422111) (not b!422116) (not b!422117) (not b!422113) (not b!422107) (not b!422102) (not b!422103) (not b!422114) (not bm!29487) (not bm!29488) (not b_lambda!9101) (not start!39494) (not b_next!9775) (not mapNonEmpty!18012))
(check-sat b_and!17441 (not b_next!9775))
