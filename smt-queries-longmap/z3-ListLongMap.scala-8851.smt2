; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107554 () Bool)

(assert start!107554)

(declare-fun b_free!27649 () Bool)

(declare-fun b_next!27649 () Bool)

(assert (=> start!107554 (= b_free!27649 (not b_next!27649))))

(declare-fun tp!97453 () Bool)

(declare-fun b_and!45683 () Bool)

(assert (=> start!107554 (= tp!97453 b_and!45683)))

(declare-fun res!846732 () Bool)

(declare-fun e!726324 () Bool)

(assert (=> start!107554 (=> (not res!846732) (not e!726324))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107554 (= res!846732 (validMask!0 mask!1730))))

(assert (=> start!107554 e!726324))

(declare-datatypes ((V!49219 0))(
  ( (V!49220 (val!16584 Int)) )
))
(declare-datatypes ((ValueCell!15656 0))(
  ( (ValueCellFull!15656 (v!19216 V!49219)) (EmptyCell!15656) )
))
(declare-datatypes ((array!83303 0))(
  ( (array!83304 (arr!40184 (Array (_ BitVec 32) ValueCell!15656)) (size!40721 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83303)

(declare-fun e!726322 () Bool)

(declare-fun array_inv!30725 (array!83303) Bool)

(assert (=> start!107554 (and (array_inv!30725 _values!1134) e!726322)))

(assert (=> start!107554 true))

(declare-datatypes ((array!83305 0))(
  ( (array!83306 (arr!40185 (Array (_ BitVec 32) (_ BitVec 64))) (size!40722 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83305)

(declare-fun array_inv!30726 (array!83305) Bool)

(assert (=> start!107554 (array_inv!30726 _keys!1364)))

(declare-fun tp_is_empty!33019 () Bool)

(assert (=> start!107554 tp_is_empty!33019))

(assert (=> start!107554 tp!97453))

(declare-fun b!1273320 () Bool)

(declare-fun res!846731 () Bool)

(assert (=> b!1273320 (=> (not res!846731) (not e!726324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83305 (_ BitVec 32)) Bool)

(assert (=> b!1273320 (= res!846731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51109 () Bool)

(declare-fun mapRes!51109 () Bool)

(assert (=> mapIsEmpty!51109 mapRes!51109))

(declare-fun b!1273321 () Bool)

(declare-fun res!846734 () Bool)

(assert (=> b!1273321 (=> (not res!846734) (not e!726324))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1273321 (= res!846734 (and (= (size!40721 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40722 _keys!1364) (size!40721 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1273322 () Bool)

(declare-fun e!726323 () Bool)

(assert (=> b!1273322 (= e!726322 (and e!726323 mapRes!51109))))

(declare-fun condMapEmpty!51109 () Bool)

(declare-fun mapDefault!51109 () ValueCell!15656)

(assert (=> b!1273322 (= condMapEmpty!51109 (= (arr!40184 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15656)) mapDefault!51109)))))

(declare-fun b!1273323 () Bool)

(declare-fun res!846733 () Bool)

(assert (=> b!1273323 (=> (not res!846733) (not e!726324))))

(declare-datatypes ((List!28573 0))(
  ( (Nil!28570) (Cons!28569 (h!29787 (_ BitVec 64)) (t!42094 List!28573)) )
))
(declare-fun arrayNoDuplicates!0 (array!83305 (_ BitVec 32) List!28573) Bool)

(assert (=> b!1273323 (= res!846733 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28570))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun b!1273324 () Bool)

(declare-fun minValueAfter!52 () V!49219)

(declare-fun minValueBefore!52 () V!49219)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49219)

(declare-fun zeroValueBefore!52 () V!49219)

(declare-datatypes ((tuple2!21372 0))(
  ( (tuple2!21373 (_1!10697 (_ BitVec 64)) (_2!10697 V!49219)) )
))
(declare-datatypes ((List!28574 0))(
  ( (Nil!28571) (Cons!28570 (h!29788 tuple2!21372) (t!42095 List!28574)) )
))
(declare-datatypes ((ListLongMap!19109 0))(
  ( (ListLongMap!19110 (toList!9570 List!28574)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5942 (array!83305 array!83303 (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 (_ BitVec 32) Int) ListLongMap!19109)

(assert (=> b!1273324 (= e!726324 (not (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(assert (=> b!1273324 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42281 0))(
  ( (Unit!42282) )
))
(declare-fun lt!575431 () Unit!42281)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1232 (array!83305 array!83303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 V!49219 V!49219 (_ BitVec 32) Int) Unit!42281)

(assert (=> b!1273324 (= lt!575431 (lemmaNoChangeToArrayThenSameMapNoExtras!1232 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1273325 () Bool)

(declare-fun res!846735 () Bool)

(assert (=> b!1273325 (=> (not res!846735) (not e!726324))))

(assert (=> b!1273325 (= res!846735 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40722 _keys!1364)) (bvslt from!1698 (size!40722 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!51109 () Bool)

(declare-fun tp!97452 () Bool)

(declare-fun e!726321 () Bool)

(assert (=> mapNonEmpty!51109 (= mapRes!51109 (and tp!97452 e!726321))))

(declare-fun mapRest!51109 () (Array (_ BitVec 32) ValueCell!15656))

(declare-fun mapValue!51109 () ValueCell!15656)

(declare-fun mapKey!51109 () (_ BitVec 32))

(assert (=> mapNonEmpty!51109 (= (arr!40184 _values!1134) (store mapRest!51109 mapKey!51109 mapValue!51109))))

(declare-fun b!1273326 () Bool)

(assert (=> b!1273326 (= e!726323 tp_is_empty!33019)))

(declare-fun b!1273327 () Bool)

(assert (=> b!1273327 (= e!726321 tp_is_empty!33019)))

(assert (= (and start!107554 res!846732) b!1273321))

(assert (= (and b!1273321 res!846734) b!1273320))

(assert (= (and b!1273320 res!846731) b!1273323))

(assert (= (and b!1273323 res!846733) b!1273325))

(assert (= (and b!1273325 res!846735) b!1273324))

(assert (= (and b!1273322 condMapEmpty!51109) mapIsEmpty!51109))

(assert (= (and b!1273322 (not condMapEmpty!51109)) mapNonEmpty!51109))

(get-info :version)

(assert (= (and mapNonEmpty!51109 ((_ is ValueCellFull!15656) mapValue!51109)) b!1273327))

(assert (= (and b!1273322 ((_ is ValueCellFull!15656) mapDefault!51109)) b!1273326))

(assert (= start!107554 b!1273322))

(declare-fun m!1171371 () Bool)

(assert (=> start!107554 m!1171371))

(declare-fun m!1171373 () Bool)

(assert (=> start!107554 m!1171373))

(declare-fun m!1171375 () Bool)

(assert (=> start!107554 m!1171375))

(declare-fun m!1171377 () Bool)

(assert (=> b!1273323 m!1171377))

(declare-fun m!1171379 () Bool)

(assert (=> mapNonEmpty!51109 m!1171379))

(declare-fun m!1171381 () Bool)

(assert (=> b!1273320 m!1171381))

(declare-fun m!1171383 () Bool)

(assert (=> b!1273324 m!1171383))

(declare-fun m!1171385 () Bool)

(assert (=> b!1273324 m!1171385))

(declare-fun m!1171387 () Bool)

(assert (=> b!1273324 m!1171387))

(declare-fun m!1171389 () Bool)

(assert (=> b!1273324 m!1171389))

(declare-fun m!1171391 () Bool)

(assert (=> b!1273324 m!1171391))

(check-sat (not b_next!27649) b_and!45683 tp_is_empty!33019 (not start!107554) (not b!1273323) (not b!1273320) (not b!1273324) (not mapNonEmpty!51109))
(check-sat b_and!45683 (not b_next!27649))
(get-model)

(declare-fun bm!62580 () Bool)

(declare-fun call!62583 () Bool)

(declare-fun c!124035 () Bool)

(assert (=> bm!62580 (= call!62583 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124035 (Cons!28569 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000) Nil!28570) Nil!28570)))))

(declare-fun b!1273386 () Bool)

(declare-fun e!726367 () Bool)

(declare-fun e!726365 () Bool)

(assert (=> b!1273386 (= e!726367 e!726365)))

(declare-fun res!846774 () Bool)

(assert (=> b!1273386 (=> (not res!846774) (not e!726365))))

(declare-fun e!726364 () Bool)

(assert (=> b!1273386 (= res!846774 (not e!726364))))

(declare-fun res!846773 () Bool)

(assert (=> b!1273386 (=> (not res!846773) (not e!726364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273386 (= res!846773 (validKeyInArray!0 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1273387 () Bool)

(declare-fun contains!7688 (List!28573 (_ BitVec 64)) Bool)

(assert (=> b!1273387 (= e!726364 (contains!7688 Nil!28570 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1273388 () Bool)

(declare-fun e!726366 () Bool)

(assert (=> b!1273388 (= e!726366 call!62583)))

(declare-fun d!140255 () Bool)

(declare-fun res!846772 () Bool)

(assert (=> d!140255 (=> res!846772 e!726367)))

(assert (=> d!140255 (= res!846772 (bvsge #b00000000000000000000000000000000 (size!40722 _keys!1364)))))

(assert (=> d!140255 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28570) e!726367)))

(declare-fun b!1273389 () Bool)

(assert (=> b!1273389 (= e!726366 call!62583)))

(declare-fun b!1273390 () Bool)

(assert (=> b!1273390 (= e!726365 e!726366)))

(assert (=> b!1273390 (= c!124035 (validKeyInArray!0 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!140255 (not res!846772)) b!1273386))

(assert (= (and b!1273386 res!846773) b!1273387))

(assert (= (and b!1273386 res!846774) b!1273390))

(assert (= (and b!1273390 c!124035) b!1273388))

(assert (= (and b!1273390 (not c!124035)) b!1273389))

(assert (= (or b!1273388 b!1273389) bm!62580))

(declare-fun m!1171437 () Bool)

(assert (=> bm!62580 m!1171437))

(declare-fun m!1171439 () Bool)

(assert (=> bm!62580 m!1171439))

(assert (=> b!1273386 m!1171437))

(assert (=> b!1273386 m!1171437))

(declare-fun m!1171441 () Bool)

(assert (=> b!1273386 m!1171441))

(assert (=> b!1273387 m!1171437))

(assert (=> b!1273387 m!1171437))

(declare-fun m!1171443 () Bool)

(assert (=> b!1273387 m!1171443))

(assert (=> b!1273390 m!1171437))

(assert (=> b!1273390 m!1171437))

(assert (=> b!1273390 m!1171441))

(assert (=> b!1273323 d!140255))

(declare-fun d!140257 () Bool)

(assert (=> d!140257 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107554 d!140257))

(declare-fun d!140259 () Bool)

(assert (=> d!140259 (= (array_inv!30725 _values!1134) (bvsge (size!40721 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107554 d!140259))

(declare-fun d!140261 () Bool)

(assert (=> d!140261 (= (array_inv!30726 _keys!1364) (bvsge (size!40722 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107554 d!140261))

(declare-fun b!1273415 () Bool)

(declare-fun e!726382 () ListLongMap!19109)

(declare-fun e!726386 () ListLongMap!19109)

(assert (=> b!1273415 (= e!726382 e!726386)))

(declare-fun c!124045 () Bool)

(assert (=> b!1273415 (= c!124045 (validKeyInArray!0 (select (arr!40185 _keys!1364) from!1698)))))

(declare-fun b!1273416 () Bool)

(declare-fun e!726387 () Bool)

(declare-fun e!726385 () Bool)

(assert (=> b!1273416 (= e!726387 e!726385)))

(declare-fun c!124046 () Bool)

(declare-fun e!726388 () Bool)

(assert (=> b!1273416 (= c!124046 e!726388)))

(declare-fun res!846783 () Bool)

(assert (=> b!1273416 (=> (not res!846783) (not e!726388))))

(assert (=> b!1273416 (= res!846783 (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun b!1273417 () Bool)

(declare-fun lt!575456 () Unit!42281)

(declare-fun lt!575458 () Unit!42281)

(assert (=> b!1273417 (= lt!575456 lt!575458)))

(declare-fun lt!575452 () (_ BitVec 64))

(declare-fun lt!575455 () V!49219)

(declare-fun lt!575453 () ListLongMap!19109)

(declare-fun lt!575457 () (_ BitVec 64))

(declare-fun contains!7689 (ListLongMap!19109 (_ BitVec 64)) Bool)

(declare-fun +!4314 (ListLongMap!19109 tuple2!21372) ListLongMap!19109)

(assert (=> b!1273417 (not (contains!7689 (+!4314 lt!575453 (tuple2!21373 lt!575452 lt!575455)) lt!575457))))

(declare-fun addStillNotContains!335 (ListLongMap!19109 (_ BitVec 64) V!49219 (_ BitVec 64)) Unit!42281)

(assert (=> b!1273417 (= lt!575458 (addStillNotContains!335 lt!575453 lt!575452 lt!575455 lt!575457))))

(assert (=> b!1273417 (= lt!575457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20555 (ValueCell!15656 V!49219) V!49219)

(declare-fun dynLambda!3466 (Int (_ BitVec 64)) V!49219)

(assert (=> b!1273417 (= lt!575455 (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273417 (= lt!575452 (select (arr!40185 _keys!1364) from!1698))))

(declare-fun call!62586 () ListLongMap!19109)

(assert (=> b!1273417 (= lt!575453 call!62586)))

(assert (=> b!1273417 (= e!726386 (+!4314 call!62586 (tuple2!21373 (select (arr!40185 _keys!1364) from!1698) (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62583 () Bool)

(assert (=> bm!62583 (= call!62586 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273418 () Bool)

(assert (=> b!1273418 (= e!726388 (validKeyInArray!0 (select (arr!40185 _keys!1364) from!1698)))))

(assert (=> b!1273418 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1273420 () Bool)

(assert (=> b!1273420 (= e!726382 (ListLongMap!19110 Nil!28571))))

(declare-fun b!1273421 () Bool)

(declare-fun e!726384 () Bool)

(assert (=> b!1273421 (= e!726385 e!726384)))

(assert (=> b!1273421 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun res!846784 () Bool)

(declare-fun lt!575454 () ListLongMap!19109)

(assert (=> b!1273421 (= res!846784 (contains!7689 lt!575454 (select (arr!40185 _keys!1364) from!1698)))))

(assert (=> b!1273421 (=> (not res!846784) (not e!726384))))

(declare-fun b!1273422 () Bool)

(declare-fun e!726383 () Bool)

(assert (=> b!1273422 (= e!726385 e!726383)))

(declare-fun c!124044 () Bool)

(assert (=> b!1273422 (= c!124044 (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun b!1273423 () Bool)

(assert (=> b!1273423 (= e!726386 call!62586)))

(declare-fun b!1273424 () Bool)

(declare-fun res!846785 () Bool)

(assert (=> b!1273424 (=> (not res!846785) (not e!726387))))

(assert (=> b!1273424 (= res!846785 (not (contains!7689 lt!575454 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273425 () Bool)

(declare-fun isEmpty!1051 (ListLongMap!19109) Bool)

(assert (=> b!1273425 (= e!726383 (isEmpty!1051 lt!575454))))

(declare-fun b!1273426 () Bool)

(assert (=> b!1273426 (= e!726383 (= lt!575454 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun d!140263 () Bool)

(assert (=> d!140263 e!726387))

(declare-fun res!846786 () Bool)

(assert (=> d!140263 (=> (not res!846786) (not e!726387))))

(assert (=> d!140263 (= res!846786 (not (contains!7689 lt!575454 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140263 (= lt!575454 e!726382)))

(declare-fun c!124047 () Bool)

(assert (=> d!140263 (= c!124047 (bvsge from!1698 (size!40722 _keys!1364)))))

(assert (=> d!140263 (validMask!0 mask!1730)))

(assert (=> d!140263 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!575454)))

(declare-fun b!1273419 () Bool)

(assert (=> b!1273419 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40722 _keys!1364)))))

(assert (=> b!1273419 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40721 _values!1134)))))

(declare-fun apply!1014 (ListLongMap!19109 (_ BitVec 64)) V!49219)

(assert (=> b!1273419 (= e!726384 (= (apply!1014 lt!575454 (select (arr!40185 _keys!1364) from!1698)) (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!140263 c!124047) b!1273420))

(assert (= (and d!140263 (not c!124047)) b!1273415))

(assert (= (and b!1273415 c!124045) b!1273417))

(assert (= (and b!1273415 (not c!124045)) b!1273423))

(assert (= (or b!1273417 b!1273423) bm!62583))

(assert (= (and d!140263 res!846786) b!1273424))

(assert (= (and b!1273424 res!846785) b!1273416))

(assert (= (and b!1273416 res!846783) b!1273418))

(assert (= (and b!1273416 c!124046) b!1273421))

(assert (= (and b!1273416 (not c!124046)) b!1273422))

(assert (= (and b!1273421 res!846784) b!1273419))

(assert (= (and b!1273422 c!124044) b!1273426))

(assert (= (and b!1273422 (not c!124044)) b!1273425))

(declare-fun b_lambda!23033 () Bool)

(assert (=> (not b_lambda!23033) (not b!1273417)))

(declare-fun t!42100 () Bool)

(declare-fun tb!11329 () Bool)

(assert (=> (and start!107554 (= defaultEntry!1142 defaultEntry!1142) t!42100) tb!11329))

(declare-fun result!23541 () Bool)

(assert (=> tb!11329 (= result!23541 tp_is_empty!33019)))

(assert (=> b!1273417 t!42100))

(declare-fun b_and!45689 () Bool)

(assert (= b_and!45683 (and (=> t!42100 result!23541) b_and!45689)))

(declare-fun b_lambda!23035 () Bool)

(assert (=> (not b_lambda!23035) (not b!1273419)))

(assert (=> b!1273419 t!42100))

(declare-fun b_and!45691 () Bool)

(assert (= b_and!45689 (and (=> t!42100 result!23541) b_and!45691)))

(declare-fun m!1171445 () Bool)

(assert (=> b!1273417 m!1171445))

(declare-fun m!1171447 () Bool)

(assert (=> b!1273417 m!1171447))

(declare-fun m!1171449 () Bool)

(assert (=> b!1273417 m!1171449))

(declare-fun m!1171451 () Bool)

(assert (=> b!1273417 m!1171451))

(declare-fun m!1171453 () Bool)

(assert (=> b!1273417 m!1171453))

(declare-fun m!1171455 () Bool)

(assert (=> b!1273417 m!1171455))

(declare-fun m!1171457 () Bool)

(assert (=> b!1273417 m!1171457))

(assert (=> b!1273417 m!1171449))

(assert (=> b!1273417 m!1171445))

(assert (=> b!1273417 m!1171455))

(declare-fun m!1171459 () Bool)

(assert (=> b!1273417 m!1171459))

(assert (=> b!1273421 m!1171447))

(assert (=> b!1273421 m!1171447))

(declare-fun m!1171461 () Bool)

(assert (=> b!1273421 m!1171461))

(assert (=> b!1273419 m!1171445))

(assert (=> b!1273419 m!1171445))

(assert (=> b!1273419 m!1171455))

(assert (=> b!1273419 m!1171459))

(assert (=> b!1273419 m!1171447))

(assert (=> b!1273419 m!1171447))

(declare-fun m!1171463 () Bool)

(assert (=> b!1273419 m!1171463))

(assert (=> b!1273419 m!1171455))

(declare-fun m!1171465 () Bool)

(assert (=> b!1273425 m!1171465))

(declare-fun m!1171467 () Bool)

(assert (=> b!1273426 m!1171467))

(declare-fun m!1171469 () Bool)

(assert (=> d!140263 m!1171469))

(assert (=> d!140263 m!1171371))

(declare-fun m!1171471 () Bool)

(assert (=> b!1273424 m!1171471))

(assert (=> bm!62583 m!1171467))

(assert (=> b!1273418 m!1171447))

(assert (=> b!1273418 m!1171447))

(declare-fun m!1171473 () Bool)

(assert (=> b!1273418 m!1171473))

(assert (=> b!1273415 m!1171447))

(assert (=> b!1273415 m!1171447))

(assert (=> b!1273415 m!1171473))

(assert (=> b!1273324 d!140263))

(declare-fun d!140265 () Bool)

(assert (=> d!140265 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun lt!575461 () Unit!42281)

(declare-fun choose!1898 (array!83305 array!83303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 V!49219 V!49219 (_ BitVec 32) Int) Unit!42281)

(assert (=> d!140265 (= lt!575461 (choose!1898 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (=> d!140265 (validMask!0 mask!1730)))

(assert (=> d!140265 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1232 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!575461)))

(declare-fun bs!36128 () Bool)

(assert (= bs!36128 d!140265))

(assert (=> bs!36128 m!1171391))

(assert (=> bs!36128 m!1171387))

(declare-fun m!1171475 () Bool)

(assert (=> bs!36128 m!1171475))

(assert (=> bs!36128 m!1171371))

(assert (=> b!1273324 d!140265))

(declare-fun b!1273429 () Bool)

(declare-fun e!726389 () ListLongMap!19109)

(declare-fun e!726393 () ListLongMap!19109)

(assert (=> b!1273429 (= e!726389 e!726393)))

(declare-fun c!124049 () Bool)

(assert (=> b!1273429 (= c!124049 (validKeyInArray!0 (select (arr!40185 _keys!1364) from!1698)))))

(declare-fun b!1273430 () Bool)

(declare-fun e!726394 () Bool)

(declare-fun e!726392 () Bool)

(assert (=> b!1273430 (= e!726394 e!726392)))

(declare-fun c!124050 () Bool)

(declare-fun e!726395 () Bool)

(assert (=> b!1273430 (= c!124050 e!726395)))

(declare-fun res!846787 () Bool)

(assert (=> b!1273430 (=> (not res!846787) (not e!726395))))

(assert (=> b!1273430 (= res!846787 (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun b!1273431 () Bool)

(declare-fun lt!575466 () Unit!42281)

(declare-fun lt!575468 () Unit!42281)

(assert (=> b!1273431 (= lt!575466 lt!575468)))

(declare-fun lt!575462 () (_ BitVec 64))

(declare-fun lt!575467 () (_ BitVec 64))

(declare-fun lt!575463 () ListLongMap!19109)

(declare-fun lt!575465 () V!49219)

(assert (=> b!1273431 (not (contains!7689 (+!4314 lt!575463 (tuple2!21373 lt!575462 lt!575465)) lt!575467))))

(assert (=> b!1273431 (= lt!575468 (addStillNotContains!335 lt!575463 lt!575462 lt!575465 lt!575467))))

(assert (=> b!1273431 (= lt!575467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1273431 (= lt!575465 (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273431 (= lt!575462 (select (arr!40185 _keys!1364) from!1698))))

(declare-fun call!62587 () ListLongMap!19109)

(assert (=> b!1273431 (= lt!575463 call!62587)))

(assert (=> b!1273431 (= e!726393 (+!4314 call!62587 (tuple2!21373 (select (arr!40185 _keys!1364) from!1698) (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62584 () Bool)

(assert (=> bm!62584 (= call!62587 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273432 () Bool)

(assert (=> b!1273432 (= e!726395 (validKeyInArray!0 (select (arr!40185 _keys!1364) from!1698)))))

(assert (=> b!1273432 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1273434 () Bool)

(assert (=> b!1273434 (= e!726389 (ListLongMap!19110 Nil!28571))))

(declare-fun b!1273435 () Bool)

(declare-fun e!726391 () Bool)

(assert (=> b!1273435 (= e!726392 e!726391)))

(assert (=> b!1273435 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun res!846788 () Bool)

(declare-fun lt!575464 () ListLongMap!19109)

(assert (=> b!1273435 (= res!846788 (contains!7689 lt!575464 (select (arr!40185 _keys!1364) from!1698)))))

(assert (=> b!1273435 (=> (not res!846788) (not e!726391))))

(declare-fun b!1273436 () Bool)

(declare-fun e!726390 () Bool)

(assert (=> b!1273436 (= e!726392 e!726390)))

(declare-fun c!124048 () Bool)

(assert (=> b!1273436 (= c!124048 (bvslt from!1698 (size!40722 _keys!1364)))))

(declare-fun b!1273437 () Bool)

(assert (=> b!1273437 (= e!726393 call!62587)))

(declare-fun b!1273438 () Bool)

(declare-fun res!846789 () Bool)

(assert (=> b!1273438 (=> (not res!846789) (not e!726394))))

(assert (=> b!1273438 (= res!846789 (not (contains!7689 lt!575464 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273439 () Bool)

(assert (=> b!1273439 (= e!726390 (isEmpty!1051 lt!575464))))

(declare-fun b!1273440 () Bool)

(assert (=> b!1273440 (= e!726390 (= lt!575464 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun d!140267 () Bool)

(assert (=> d!140267 e!726394))

(declare-fun res!846790 () Bool)

(assert (=> d!140267 (=> (not res!846790) (not e!726394))))

(assert (=> d!140267 (= res!846790 (not (contains!7689 lt!575464 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140267 (= lt!575464 e!726389)))

(declare-fun c!124051 () Bool)

(assert (=> d!140267 (= c!124051 (bvsge from!1698 (size!40722 _keys!1364)))))

(assert (=> d!140267 (validMask!0 mask!1730)))

(assert (=> d!140267 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!575464)))

(declare-fun b!1273433 () Bool)

(assert (=> b!1273433 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40722 _keys!1364)))))

(assert (=> b!1273433 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40721 _values!1134)))))

(assert (=> b!1273433 (= e!726391 (= (apply!1014 lt!575464 (select (arr!40185 _keys!1364) from!1698)) (get!20555 (select (arr!40184 _values!1134) from!1698) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!140267 c!124051) b!1273434))

(assert (= (and d!140267 (not c!124051)) b!1273429))

(assert (= (and b!1273429 c!124049) b!1273431))

(assert (= (and b!1273429 (not c!124049)) b!1273437))

(assert (= (or b!1273431 b!1273437) bm!62584))

(assert (= (and d!140267 res!846790) b!1273438))

(assert (= (and b!1273438 res!846789) b!1273430))

(assert (= (and b!1273430 res!846787) b!1273432))

(assert (= (and b!1273430 c!124050) b!1273435))

(assert (= (and b!1273430 (not c!124050)) b!1273436))

(assert (= (and b!1273435 res!846788) b!1273433))

(assert (= (and b!1273436 c!124048) b!1273440))

(assert (= (and b!1273436 (not c!124048)) b!1273439))

(declare-fun b_lambda!23037 () Bool)

(assert (=> (not b_lambda!23037) (not b!1273431)))

(assert (=> b!1273431 t!42100))

(declare-fun b_and!45693 () Bool)

(assert (= b_and!45691 (and (=> t!42100 result!23541) b_and!45693)))

(declare-fun b_lambda!23039 () Bool)

(assert (=> (not b_lambda!23039) (not b!1273433)))

(assert (=> b!1273433 t!42100))

(declare-fun b_and!45695 () Bool)

(assert (= b_and!45693 (and (=> t!42100 result!23541) b_and!45695)))

(assert (=> b!1273431 m!1171445))

(assert (=> b!1273431 m!1171447))

(declare-fun m!1171477 () Bool)

(assert (=> b!1273431 m!1171477))

(declare-fun m!1171479 () Bool)

(assert (=> b!1273431 m!1171479))

(declare-fun m!1171481 () Bool)

(assert (=> b!1273431 m!1171481))

(assert (=> b!1273431 m!1171455))

(declare-fun m!1171483 () Bool)

(assert (=> b!1273431 m!1171483))

(assert (=> b!1273431 m!1171477))

(assert (=> b!1273431 m!1171445))

(assert (=> b!1273431 m!1171455))

(assert (=> b!1273431 m!1171459))

(assert (=> b!1273435 m!1171447))

(assert (=> b!1273435 m!1171447))

(declare-fun m!1171485 () Bool)

(assert (=> b!1273435 m!1171485))

(assert (=> b!1273433 m!1171445))

(assert (=> b!1273433 m!1171445))

(assert (=> b!1273433 m!1171455))

(assert (=> b!1273433 m!1171459))

(assert (=> b!1273433 m!1171447))

(assert (=> b!1273433 m!1171447))

(declare-fun m!1171487 () Bool)

(assert (=> b!1273433 m!1171487))

(assert (=> b!1273433 m!1171455))

(declare-fun m!1171489 () Bool)

(assert (=> b!1273439 m!1171489))

(declare-fun m!1171491 () Bool)

(assert (=> b!1273440 m!1171491))

(declare-fun m!1171493 () Bool)

(assert (=> d!140267 m!1171493))

(assert (=> d!140267 m!1171371))

(declare-fun m!1171495 () Bool)

(assert (=> b!1273438 m!1171495))

(assert (=> bm!62584 m!1171491))

(assert (=> b!1273432 m!1171447))

(assert (=> b!1273432 m!1171447))

(assert (=> b!1273432 m!1171473))

(assert (=> b!1273429 m!1171447))

(assert (=> b!1273429 m!1171447))

(assert (=> b!1273429 m!1171473))

(assert (=> b!1273324 d!140267))

(declare-fun b!1273441 () Bool)

(declare-fun e!726396 () ListLongMap!19109)

(declare-fun e!726400 () ListLongMap!19109)

(assert (=> b!1273441 (= e!726396 e!726400)))

(declare-fun c!124053 () Bool)

(assert (=> b!1273441 (= c!124053 (validKeyInArray!0 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun b!1273442 () Bool)

(declare-fun e!726401 () Bool)

(declare-fun e!726399 () Bool)

(assert (=> b!1273442 (= e!726401 e!726399)))

(declare-fun c!124054 () Bool)

(declare-fun e!726402 () Bool)

(assert (=> b!1273442 (= c!124054 e!726402)))

(declare-fun res!846791 () Bool)

(assert (=> b!1273442 (=> (not res!846791) (not e!726402))))

(assert (=> b!1273442 (= res!846791 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun b!1273443 () Bool)

(declare-fun lt!575473 () Unit!42281)

(declare-fun lt!575475 () Unit!42281)

(assert (=> b!1273443 (= lt!575473 lt!575475)))

(declare-fun lt!575469 () (_ BitVec 64))

(declare-fun lt!575474 () (_ BitVec 64))

(declare-fun lt!575470 () ListLongMap!19109)

(declare-fun lt!575472 () V!49219)

(assert (=> b!1273443 (not (contains!7689 (+!4314 lt!575470 (tuple2!21373 lt!575469 lt!575472)) lt!575474))))

(assert (=> b!1273443 (= lt!575475 (addStillNotContains!335 lt!575470 lt!575469 lt!575472 lt!575474))))

(assert (=> b!1273443 (= lt!575474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1273443 (= lt!575472 (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273443 (= lt!575469 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(declare-fun call!62588 () ListLongMap!19109)

(assert (=> b!1273443 (= lt!575470 call!62588)))

(assert (=> b!1273443 (= e!726400 (+!4314 call!62588 (tuple2!21373 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62585 () Bool)

(assert (=> bm!62585 (= call!62588 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273444 () Bool)

(assert (=> b!1273444 (= e!726402 (validKeyInArray!0 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1273444 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1273446 () Bool)

(assert (=> b!1273446 (= e!726396 (ListLongMap!19110 Nil!28571))))

(declare-fun b!1273447 () Bool)

(declare-fun e!726398 () Bool)

(assert (=> b!1273447 (= e!726399 e!726398)))

(assert (=> b!1273447 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun lt!575471 () ListLongMap!19109)

(declare-fun res!846792 () Bool)

(assert (=> b!1273447 (= res!846792 (contains!7689 lt!575471 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1273447 (=> (not res!846792) (not e!726398))))

(declare-fun b!1273448 () Bool)

(declare-fun e!726397 () Bool)

(assert (=> b!1273448 (= e!726399 e!726397)))

(declare-fun c!124052 () Bool)

(assert (=> b!1273448 (= c!124052 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun b!1273449 () Bool)

(assert (=> b!1273449 (= e!726400 call!62588)))

(declare-fun b!1273450 () Bool)

(declare-fun res!846793 () Bool)

(assert (=> b!1273450 (=> (not res!846793) (not e!726401))))

(assert (=> b!1273450 (= res!846793 (not (contains!7689 lt!575471 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273451 () Bool)

(assert (=> b!1273451 (= e!726397 (isEmpty!1051 lt!575471))))

(declare-fun b!1273452 () Bool)

(assert (=> b!1273452 (= e!726397 (= lt!575471 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun d!140269 () Bool)

(assert (=> d!140269 e!726401))

(declare-fun res!846794 () Bool)

(assert (=> d!140269 (=> (not res!846794) (not e!726401))))

(assert (=> d!140269 (= res!846794 (not (contains!7689 lt!575471 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140269 (= lt!575471 e!726396)))

(declare-fun c!124055 () Bool)

(assert (=> d!140269 (= c!124055 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(assert (=> d!140269 (validMask!0 mask!1730)))

(assert (=> d!140269 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!575471)))

(declare-fun b!1273445 () Bool)

(assert (=> b!1273445 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(assert (=> b!1273445 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40721 _values!1134)))))

(assert (=> b!1273445 (= e!726398 (= (apply!1014 lt!575471 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!140269 c!124055) b!1273446))

(assert (= (and d!140269 (not c!124055)) b!1273441))

(assert (= (and b!1273441 c!124053) b!1273443))

(assert (= (and b!1273441 (not c!124053)) b!1273449))

(assert (= (or b!1273443 b!1273449) bm!62585))

(assert (= (and d!140269 res!846794) b!1273450))

(assert (= (and b!1273450 res!846793) b!1273442))

(assert (= (and b!1273442 res!846791) b!1273444))

(assert (= (and b!1273442 c!124054) b!1273447))

(assert (= (and b!1273442 (not c!124054)) b!1273448))

(assert (= (and b!1273447 res!846792) b!1273445))

(assert (= (and b!1273448 c!124052) b!1273452))

(assert (= (and b!1273448 (not c!124052)) b!1273451))

(declare-fun b_lambda!23041 () Bool)

(assert (=> (not b_lambda!23041) (not b!1273443)))

(assert (=> b!1273443 t!42100))

(declare-fun b_and!45697 () Bool)

(assert (= b_and!45695 (and (=> t!42100 result!23541) b_and!45697)))

(declare-fun b_lambda!23043 () Bool)

(assert (=> (not b_lambda!23043) (not b!1273445)))

(assert (=> b!1273445 t!42100))

(declare-fun b_and!45699 () Bool)

(assert (= b_and!45697 (and (=> t!42100 result!23541) b_and!45699)))

(declare-fun m!1171497 () Bool)

(assert (=> b!1273443 m!1171497))

(declare-fun m!1171499 () Bool)

(assert (=> b!1273443 m!1171499))

(declare-fun m!1171501 () Bool)

(assert (=> b!1273443 m!1171501))

(declare-fun m!1171503 () Bool)

(assert (=> b!1273443 m!1171503))

(declare-fun m!1171505 () Bool)

(assert (=> b!1273443 m!1171505))

(assert (=> b!1273443 m!1171455))

(declare-fun m!1171507 () Bool)

(assert (=> b!1273443 m!1171507))

(assert (=> b!1273443 m!1171501))

(assert (=> b!1273443 m!1171497))

(assert (=> b!1273443 m!1171455))

(declare-fun m!1171509 () Bool)

(assert (=> b!1273443 m!1171509))

(assert (=> b!1273447 m!1171499))

(assert (=> b!1273447 m!1171499))

(declare-fun m!1171511 () Bool)

(assert (=> b!1273447 m!1171511))

(assert (=> b!1273445 m!1171497))

(assert (=> b!1273445 m!1171497))

(assert (=> b!1273445 m!1171455))

(assert (=> b!1273445 m!1171509))

(assert (=> b!1273445 m!1171499))

(assert (=> b!1273445 m!1171499))

(declare-fun m!1171513 () Bool)

(assert (=> b!1273445 m!1171513))

(assert (=> b!1273445 m!1171455))

(declare-fun m!1171515 () Bool)

(assert (=> b!1273451 m!1171515))

(declare-fun m!1171517 () Bool)

(assert (=> b!1273452 m!1171517))

(declare-fun m!1171519 () Bool)

(assert (=> d!140269 m!1171519))

(assert (=> d!140269 m!1171371))

(declare-fun m!1171521 () Bool)

(assert (=> b!1273450 m!1171521))

(assert (=> bm!62585 m!1171517))

(assert (=> b!1273444 m!1171499))

(assert (=> b!1273444 m!1171499))

(declare-fun m!1171523 () Bool)

(assert (=> b!1273444 m!1171523))

(assert (=> b!1273441 m!1171499))

(assert (=> b!1273441 m!1171499))

(assert (=> b!1273441 m!1171523))

(assert (=> b!1273324 d!140269))

(declare-fun b!1273453 () Bool)

(declare-fun e!726403 () ListLongMap!19109)

(declare-fun e!726407 () ListLongMap!19109)

(assert (=> b!1273453 (= e!726403 e!726407)))

(declare-fun c!124057 () Bool)

(assert (=> b!1273453 (= c!124057 (validKeyInArray!0 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun b!1273454 () Bool)

(declare-fun e!726408 () Bool)

(declare-fun e!726406 () Bool)

(assert (=> b!1273454 (= e!726408 e!726406)))

(declare-fun c!124058 () Bool)

(declare-fun e!726409 () Bool)

(assert (=> b!1273454 (= c!124058 e!726409)))

(declare-fun res!846795 () Bool)

(assert (=> b!1273454 (=> (not res!846795) (not e!726409))))

(assert (=> b!1273454 (= res!846795 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun b!1273455 () Bool)

(declare-fun lt!575480 () Unit!42281)

(declare-fun lt!575482 () Unit!42281)

(assert (=> b!1273455 (= lt!575480 lt!575482)))

(declare-fun lt!575476 () (_ BitVec 64))

(declare-fun lt!575481 () (_ BitVec 64))

(declare-fun lt!575479 () V!49219)

(declare-fun lt!575477 () ListLongMap!19109)

(assert (=> b!1273455 (not (contains!7689 (+!4314 lt!575477 (tuple2!21373 lt!575476 lt!575479)) lt!575481))))

(assert (=> b!1273455 (= lt!575482 (addStillNotContains!335 lt!575477 lt!575476 lt!575479 lt!575481))))

(assert (=> b!1273455 (= lt!575481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1273455 (= lt!575479 (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273455 (= lt!575476 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(declare-fun call!62589 () ListLongMap!19109)

(assert (=> b!1273455 (= lt!575477 call!62589)))

(assert (=> b!1273455 (= e!726407 (+!4314 call!62589 (tuple2!21373 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62586 () Bool)

(assert (=> bm!62586 (= call!62589 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273456 () Bool)

(assert (=> b!1273456 (= e!726409 (validKeyInArray!0 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1273456 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1273458 () Bool)

(assert (=> b!1273458 (= e!726403 (ListLongMap!19110 Nil!28571))))

(declare-fun b!1273459 () Bool)

(declare-fun e!726405 () Bool)

(assert (=> b!1273459 (= e!726406 e!726405)))

(assert (=> b!1273459 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun lt!575478 () ListLongMap!19109)

(declare-fun res!846796 () Bool)

(assert (=> b!1273459 (= res!846796 (contains!7689 lt!575478 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1273459 (=> (not res!846796) (not e!726405))))

(declare-fun b!1273460 () Bool)

(declare-fun e!726404 () Bool)

(assert (=> b!1273460 (= e!726406 e!726404)))

(declare-fun c!124056 () Bool)

(assert (=> b!1273460 (= c!124056 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(declare-fun b!1273461 () Bool)

(assert (=> b!1273461 (= e!726407 call!62589)))

(declare-fun b!1273462 () Bool)

(declare-fun res!846797 () Bool)

(assert (=> b!1273462 (=> (not res!846797) (not e!726408))))

(assert (=> b!1273462 (= res!846797 (not (contains!7689 lt!575478 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273463 () Bool)

(assert (=> b!1273463 (= e!726404 (isEmpty!1051 lt!575478))))

(declare-fun b!1273464 () Bool)

(assert (=> b!1273464 (= e!726404 (= lt!575478 (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun d!140271 () Bool)

(assert (=> d!140271 e!726408))

(declare-fun res!846798 () Bool)

(assert (=> d!140271 (=> (not res!846798) (not e!726408))))

(assert (=> d!140271 (= res!846798 (not (contains!7689 lt!575478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140271 (= lt!575478 e!726403)))

(declare-fun c!124059 () Bool)

(assert (=> d!140271 (= c!124059 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(assert (=> d!140271 (validMask!0 mask!1730)))

(assert (=> d!140271 (= (getCurrentListMapNoExtraKeys!5942 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!575478)))

(declare-fun b!1273457 () Bool)

(assert (=> b!1273457 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40722 _keys!1364)))))

(assert (=> b!1273457 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40721 _values!1134)))))

(assert (=> b!1273457 (= e!726405 (= (apply!1014 lt!575478 (select (arr!40185 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20555 (select (arr!40184 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3466 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!140271 c!124059) b!1273458))

(assert (= (and d!140271 (not c!124059)) b!1273453))

(assert (= (and b!1273453 c!124057) b!1273455))

(assert (= (and b!1273453 (not c!124057)) b!1273461))

(assert (= (or b!1273455 b!1273461) bm!62586))

(assert (= (and d!140271 res!846798) b!1273462))

(assert (= (and b!1273462 res!846797) b!1273454))

(assert (= (and b!1273454 res!846795) b!1273456))

(assert (= (and b!1273454 c!124058) b!1273459))

(assert (= (and b!1273454 (not c!124058)) b!1273460))

(assert (= (and b!1273459 res!846796) b!1273457))

(assert (= (and b!1273460 c!124056) b!1273464))

(assert (= (and b!1273460 (not c!124056)) b!1273463))

(declare-fun b_lambda!23045 () Bool)

(assert (=> (not b_lambda!23045) (not b!1273455)))

(assert (=> b!1273455 t!42100))

(declare-fun b_and!45701 () Bool)

(assert (= b_and!45699 (and (=> t!42100 result!23541) b_and!45701)))

(declare-fun b_lambda!23047 () Bool)

(assert (=> (not b_lambda!23047) (not b!1273457)))

(assert (=> b!1273457 t!42100))

(declare-fun b_and!45703 () Bool)

(assert (= b_and!45701 (and (=> t!42100 result!23541) b_and!45703)))

(assert (=> b!1273455 m!1171497))

(assert (=> b!1273455 m!1171499))

(declare-fun m!1171525 () Bool)

(assert (=> b!1273455 m!1171525))

(declare-fun m!1171527 () Bool)

(assert (=> b!1273455 m!1171527))

(declare-fun m!1171529 () Bool)

(assert (=> b!1273455 m!1171529))

(assert (=> b!1273455 m!1171455))

(declare-fun m!1171531 () Bool)

(assert (=> b!1273455 m!1171531))

(assert (=> b!1273455 m!1171525))

(assert (=> b!1273455 m!1171497))

(assert (=> b!1273455 m!1171455))

(assert (=> b!1273455 m!1171509))

(assert (=> b!1273459 m!1171499))

(assert (=> b!1273459 m!1171499))

(declare-fun m!1171533 () Bool)

(assert (=> b!1273459 m!1171533))

(assert (=> b!1273457 m!1171497))

(assert (=> b!1273457 m!1171497))

(assert (=> b!1273457 m!1171455))

(assert (=> b!1273457 m!1171509))

(assert (=> b!1273457 m!1171499))

(assert (=> b!1273457 m!1171499))

(declare-fun m!1171535 () Bool)

(assert (=> b!1273457 m!1171535))

(assert (=> b!1273457 m!1171455))

(declare-fun m!1171537 () Bool)

(assert (=> b!1273463 m!1171537))

(declare-fun m!1171539 () Bool)

(assert (=> b!1273464 m!1171539))

(declare-fun m!1171541 () Bool)

(assert (=> d!140271 m!1171541))

(assert (=> d!140271 m!1171371))

(declare-fun m!1171543 () Bool)

(assert (=> b!1273462 m!1171543))

(assert (=> bm!62586 m!1171539))

(assert (=> b!1273456 m!1171499))

(assert (=> b!1273456 m!1171499))

(assert (=> b!1273456 m!1171523))

(assert (=> b!1273453 m!1171499))

(assert (=> b!1273453 m!1171499))

(assert (=> b!1273453 m!1171523))

(assert (=> b!1273324 d!140271))

(declare-fun b!1273473 () Bool)

(declare-fun e!726417 () Bool)

(declare-fun call!62592 () Bool)

(assert (=> b!1273473 (= e!726417 call!62592)))

(declare-fun b!1273474 () Bool)

(declare-fun e!726416 () Bool)

(assert (=> b!1273474 (= e!726416 e!726417)))

(declare-fun lt!575490 () (_ BitVec 64))

(assert (=> b!1273474 (= lt!575490 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000))))

(declare-fun lt!575489 () Unit!42281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83305 (_ BitVec 64) (_ BitVec 32)) Unit!42281)

(assert (=> b!1273474 (= lt!575489 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!575490 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273474 (arrayContainsKey!0 _keys!1364 lt!575490 #b00000000000000000000000000000000)))

(declare-fun lt!575491 () Unit!42281)

(assert (=> b!1273474 (= lt!575491 lt!575489)))

(declare-fun res!846804 () Bool)

(declare-datatypes ((SeekEntryResult!9943 0))(
  ( (MissingZero!9943 (index!42143 (_ BitVec 32))) (Found!9943 (index!42144 (_ BitVec 32))) (Intermediate!9943 (undefined!10755 Bool) (index!42145 (_ BitVec 32)) (x!112345 (_ BitVec 32))) (Undefined!9943) (MissingVacant!9943 (index!42146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83305 (_ BitVec 32)) SeekEntryResult!9943)

(assert (=> b!1273474 (= res!846804 (= (seekEntryOrOpen!0 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9943 #b00000000000000000000000000000000)))))

(assert (=> b!1273474 (=> (not res!846804) (not e!726417))))

(declare-fun b!1273475 () Bool)

(assert (=> b!1273475 (= e!726416 call!62592)))

(declare-fun d!140273 () Bool)

(declare-fun res!846803 () Bool)

(declare-fun e!726418 () Bool)

(assert (=> d!140273 (=> res!846803 e!726418)))

(assert (=> d!140273 (= res!846803 (bvsge #b00000000000000000000000000000000 (size!40722 _keys!1364)))))

(assert (=> d!140273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!726418)))

(declare-fun bm!62589 () Bool)

(assert (=> bm!62589 (= call!62592 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1273476 () Bool)

(assert (=> b!1273476 (= e!726418 e!726416)))

(declare-fun c!124062 () Bool)

(assert (=> b!1273476 (= c!124062 (validKeyInArray!0 (select (arr!40185 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!140273 (not res!846803)) b!1273476))

(assert (= (and b!1273476 c!124062) b!1273474))

(assert (= (and b!1273476 (not c!124062)) b!1273475))

(assert (= (and b!1273474 res!846804) b!1273473))

(assert (= (or b!1273473 b!1273475) bm!62589))

(assert (=> b!1273474 m!1171437))

(declare-fun m!1171545 () Bool)

(assert (=> b!1273474 m!1171545))

(declare-fun m!1171547 () Bool)

(assert (=> b!1273474 m!1171547))

(assert (=> b!1273474 m!1171437))

(declare-fun m!1171549 () Bool)

(assert (=> b!1273474 m!1171549))

(declare-fun m!1171551 () Bool)

(assert (=> bm!62589 m!1171551))

(assert (=> b!1273476 m!1171437))

(assert (=> b!1273476 m!1171437))

(assert (=> b!1273476 m!1171441))

(assert (=> b!1273320 d!140273))

(declare-fun condMapEmpty!51118 () Bool)

(declare-fun mapDefault!51118 () ValueCell!15656)

(assert (=> mapNonEmpty!51109 (= condMapEmpty!51118 (= mapRest!51109 ((as const (Array (_ BitVec 32) ValueCell!15656)) mapDefault!51118)))))

(declare-fun e!726423 () Bool)

(declare-fun mapRes!51118 () Bool)

(assert (=> mapNonEmpty!51109 (= tp!97452 (and e!726423 mapRes!51118))))

(declare-fun b!1273484 () Bool)

(assert (=> b!1273484 (= e!726423 tp_is_empty!33019)))

(declare-fun mapNonEmpty!51118 () Bool)

(declare-fun tp!97468 () Bool)

(declare-fun e!726424 () Bool)

(assert (=> mapNonEmpty!51118 (= mapRes!51118 (and tp!97468 e!726424))))

(declare-fun mapKey!51118 () (_ BitVec 32))

(declare-fun mapValue!51118 () ValueCell!15656)

(declare-fun mapRest!51118 () (Array (_ BitVec 32) ValueCell!15656))

(assert (=> mapNonEmpty!51118 (= mapRest!51109 (store mapRest!51118 mapKey!51118 mapValue!51118))))

(declare-fun mapIsEmpty!51118 () Bool)

(assert (=> mapIsEmpty!51118 mapRes!51118))

(declare-fun b!1273483 () Bool)

(assert (=> b!1273483 (= e!726424 tp_is_empty!33019)))

(assert (= (and mapNonEmpty!51109 condMapEmpty!51118) mapIsEmpty!51118))

(assert (= (and mapNonEmpty!51109 (not condMapEmpty!51118)) mapNonEmpty!51118))

(assert (= (and mapNonEmpty!51118 ((_ is ValueCellFull!15656) mapValue!51118)) b!1273483))

(assert (= (and mapNonEmpty!51109 ((_ is ValueCellFull!15656) mapDefault!51118)) b!1273484))

(declare-fun m!1171553 () Bool)

(assert (=> mapNonEmpty!51118 m!1171553))

(declare-fun b_lambda!23049 () Bool)

(assert (= b_lambda!23037 (or (and start!107554 b_free!27649) b_lambda!23049)))

(declare-fun b_lambda!23051 () Bool)

(assert (= b_lambda!23033 (or (and start!107554 b_free!27649) b_lambda!23051)))

(declare-fun b_lambda!23053 () Bool)

(assert (= b_lambda!23041 (or (and start!107554 b_free!27649) b_lambda!23053)))

(declare-fun b_lambda!23055 () Bool)

(assert (= b_lambda!23043 (or (and start!107554 b_free!27649) b_lambda!23055)))

(declare-fun b_lambda!23057 () Bool)

(assert (= b_lambda!23047 (or (and start!107554 b_free!27649) b_lambda!23057)))

(declare-fun b_lambda!23059 () Bool)

(assert (= b_lambda!23035 (or (and start!107554 b_free!27649) b_lambda!23059)))

(declare-fun b_lambda!23061 () Bool)

(assert (= b_lambda!23045 (or (and start!107554 b_free!27649) b_lambda!23061)))

(declare-fun b_lambda!23063 () Bool)

(assert (= b_lambda!23039 (or (and start!107554 b_free!27649) b_lambda!23063)))

(check-sat (not b!1273387) (not d!140263) tp_is_empty!33019 (not b!1273447) (not b!1273421) (not b!1273441) (not b!1273462) b_and!45703 (not bm!62586) (not b!1273450) (not b_lambda!23055) (not b!1273474) (not b!1273432) (not b_lambda!23053) (not d!140271) (not b_next!27649) (not b!1273444) (not b!1273424) (not b!1273431) (not b!1273457) (not bm!62589) (not b!1273435) (not b!1273419) (not mapNonEmpty!51118) (not b!1273456) (not b!1273386) (not b!1273415) (not b_lambda!23059) (not b_lambda!23063) (not b!1273440) (not b!1273445) (not b!1273417) (not b!1273438) (not b!1273426) (not b!1273433) (not b!1273425) (not b!1273459) (not b!1273390) (not b!1273451) (not b_lambda!23051) (not b!1273476) (not b!1273439) (not b!1273463) (not b!1273464) (not d!140269) (not b!1273453) (not b!1273452) (not bm!62585) (not bm!62584) (not b!1273418) (not b_lambda!23057) (not d!140267) (not d!140265) (not b_lambda!23049) (not b!1273455) (not b!1273443) (not bm!62580) (not b!1273429) (not b_lambda!23061) (not bm!62583))
(check-sat b_and!45703 (not b_next!27649))
