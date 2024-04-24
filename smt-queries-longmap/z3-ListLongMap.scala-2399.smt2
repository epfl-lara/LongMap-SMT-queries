; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37954 () Bool)

(assert start!37954)

(declare-fun b_free!8959 () Bool)

(declare-fun b_next!8959 () Bool)

(assert (=> start!37954 (= b_free!8959 (not b_next!8959))))

(declare-fun tp!31643 () Bool)

(declare-fun b_and!16275 () Bool)

(assert (=> start!37954 (= tp!31643 b_and!16275)))

(declare-fun b!390528 () Bool)

(declare-fun res!223498 () Bool)

(declare-fun e!236560 () Bool)

(assert (=> b!390528 (=> (not res!223498) (not e!236560))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13947 0))(
  ( (V!13948 (val!4860 Int)) )
))
(declare-datatypes ((ValueCell!4472 0))(
  ( (ValueCellFull!4472 (v!7078 V!13947)) (EmptyCell!4472) )
))
(declare-datatypes ((array!23146 0))(
  ( (array!23147 (arr!11036 (Array (_ BitVec 32) ValueCell!4472)) (size!11388 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23146)

(declare-datatypes ((array!23148 0))(
  ( (array!23149 (arr!11037 (Array (_ BitVec 32) (_ BitVec 64))) (size!11389 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23148)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!390528 (= res!223498 (and (= (size!11388 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11389 _keys!658) (size!11388 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390529 () Bool)

(declare-fun res!223501 () Bool)

(assert (=> b!390529 (=> (not res!223501) (not e!236560))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390529 (= res!223501 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!223497 () Bool)

(assert (=> start!37954 (=> (not res!223497) (not e!236560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37954 (= res!223497 (validMask!0 mask!970))))

(assert (=> start!37954 e!236560))

(declare-fun e!236558 () Bool)

(declare-fun array_inv!8160 (array!23146) Bool)

(assert (=> start!37954 (and (array_inv!8160 _values!506) e!236558)))

(assert (=> start!37954 tp!31643))

(assert (=> start!37954 true))

(declare-fun tp_is_empty!9631 () Bool)

(assert (=> start!37954 tp_is_empty!9631))

(declare-fun array_inv!8161 (array!23148) Bool)

(assert (=> start!37954 (array_inv!8161 _keys!658)))

(declare-fun b!390530 () Bool)

(declare-fun e!236564 () Bool)

(declare-fun e!236562 () Bool)

(assert (=> b!390530 (= e!236564 (not e!236562))))

(declare-fun res!223499 () Bool)

(assert (=> b!390530 (=> res!223499 e!236562)))

(assert (=> b!390530 (= res!223499 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6406 0))(
  ( (tuple2!6407 (_1!3214 (_ BitVec 64)) (_2!3214 V!13947)) )
))
(declare-datatypes ((List!6257 0))(
  ( (Nil!6254) (Cons!6253 (h!7109 tuple2!6406) (t!11409 List!6257)) )
))
(declare-datatypes ((ListLongMap!5321 0))(
  ( (ListLongMap!5322 (toList!2676 List!6257)) )
))
(declare-fun lt!184132 () ListLongMap!5321)

(declare-fun zeroValue!472 () V!13947)

(declare-fun minValue!472 () V!13947)

(declare-fun getCurrentListMap!2058 (array!23148 array!23146 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5321)

(assert (=> b!390530 (= lt!184132 (getCurrentListMap!2058 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184134 () ListLongMap!5321)

(declare-fun lt!184133 () array!23146)

(declare-fun lt!184130 () array!23148)

(assert (=> b!390530 (= lt!184134 (getCurrentListMap!2058 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184136 () ListLongMap!5321)

(declare-fun lt!184137 () ListLongMap!5321)

(assert (=> b!390530 (and (= lt!184136 lt!184137) (= lt!184137 lt!184136))))

(declare-fun v!373 () V!13947)

(declare-fun lt!184135 () ListLongMap!5321)

(declare-fun +!1030 (ListLongMap!5321 tuple2!6406) ListLongMap!5321)

(assert (=> b!390530 (= lt!184137 (+!1030 lt!184135 (tuple2!6407 k0!778 v!373)))))

(declare-datatypes ((Unit!11933 0))(
  ( (Unit!11934) )
))
(declare-fun lt!184131 () Unit!11933)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!249 (array!23148 array!23146 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) (_ BitVec 64) V!13947 (_ BitVec 32) Int) Unit!11933)

(assert (=> b!390530 (= lt!184131 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!249 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!947 (array!23148 array!23146 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5321)

(assert (=> b!390530 (= lt!184136 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390530 (= lt!184133 (array!23147 (store (arr!11036 _values!506) i!548 (ValueCellFull!4472 v!373)) (size!11388 _values!506)))))

(assert (=> b!390530 (= lt!184135 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390531 () Bool)

(declare-fun e!236561 () Bool)

(assert (=> b!390531 (= e!236561 tp_is_empty!9631)))

(declare-fun lt!184138 () tuple2!6406)

(declare-fun b!390532 () Bool)

(assert (=> b!390532 (= e!236562 (= lt!184132 (+!1030 lt!184135 lt!184138)))))

(assert (=> b!390532 (= lt!184134 (+!1030 lt!184136 lt!184138))))

(assert (=> b!390532 (= lt!184138 (tuple2!6407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390533 () Bool)

(assert (=> b!390533 (= e!236560 e!236564)))

(declare-fun res!223505 () Bool)

(assert (=> b!390533 (=> (not res!223505) (not e!236564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23148 (_ BitVec 32)) Bool)

(assert (=> b!390533 (= res!223505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184130 mask!970))))

(assert (=> b!390533 (= lt!184130 (array!23149 (store (arr!11037 _keys!658) i!548 k0!778) (size!11389 _keys!658)))))

(declare-fun b!390534 () Bool)

(declare-fun res!223504 () Bool)

(assert (=> b!390534 (=> (not res!223504) (not e!236560))))

(assert (=> b!390534 (= res!223504 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11389 _keys!658))))))

(declare-fun b!390535 () Bool)

(declare-fun e!236559 () Bool)

(declare-fun mapRes!16026 () Bool)

(assert (=> b!390535 (= e!236558 (and e!236559 mapRes!16026))))

(declare-fun condMapEmpty!16026 () Bool)

(declare-fun mapDefault!16026 () ValueCell!4472)

(assert (=> b!390535 (= condMapEmpty!16026 (= (arr!11036 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4472)) mapDefault!16026)))))

(declare-fun b!390536 () Bool)

(declare-fun res!223506 () Bool)

(assert (=> b!390536 (=> (not res!223506) (not e!236560))))

(declare-datatypes ((List!6258 0))(
  ( (Nil!6255) (Cons!6254 (h!7110 (_ BitVec 64)) (t!11410 List!6258)) )
))
(declare-fun arrayNoDuplicates!0 (array!23148 (_ BitVec 32) List!6258) Bool)

(assert (=> b!390536 (= res!223506 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6255))))

(declare-fun b!390537 () Bool)

(declare-fun res!223500 () Bool)

(assert (=> b!390537 (=> (not res!223500) (not e!236560))))

(assert (=> b!390537 (= res!223500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!16026 () Bool)

(declare-fun tp!31644 () Bool)

(assert (=> mapNonEmpty!16026 (= mapRes!16026 (and tp!31644 e!236561))))

(declare-fun mapRest!16026 () (Array (_ BitVec 32) ValueCell!4472))

(declare-fun mapKey!16026 () (_ BitVec 32))

(declare-fun mapValue!16026 () ValueCell!4472)

(assert (=> mapNonEmpty!16026 (= (arr!11036 _values!506) (store mapRest!16026 mapKey!16026 mapValue!16026))))

(declare-fun b!390538 () Bool)

(declare-fun res!223502 () Bool)

(assert (=> b!390538 (=> (not res!223502) (not e!236560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390538 (= res!223502 (validKeyInArray!0 k0!778))))

(declare-fun b!390539 () Bool)

(declare-fun res!223503 () Bool)

(assert (=> b!390539 (=> (not res!223503) (not e!236560))))

(assert (=> b!390539 (= res!223503 (or (= (select (arr!11037 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11037 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16026 () Bool)

(assert (=> mapIsEmpty!16026 mapRes!16026))

(declare-fun b!390540 () Bool)

(declare-fun res!223496 () Bool)

(assert (=> b!390540 (=> (not res!223496) (not e!236564))))

(assert (=> b!390540 (= res!223496 (arrayNoDuplicates!0 lt!184130 #b00000000000000000000000000000000 Nil!6255))))

(declare-fun b!390541 () Bool)

(assert (=> b!390541 (= e!236559 tp_is_empty!9631)))

(assert (= (and start!37954 res!223497) b!390528))

(assert (= (and b!390528 res!223498) b!390537))

(assert (= (and b!390537 res!223500) b!390536))

(assert (= (and b!390536 res!223506) b!390534))

(assert (= (and b!390534 res!223504) b!390538))

(assert (= (and b!390538 res!223502) b!390539))

(assert (= (and b!390539 res!223503) b!390529))

(assert (= (and b!390529 res!223501) b!390533))

(assert (= (and b!390533 res!223505) b!390540))

(assert (= (and b!390540 res!223496) b!390530))

(assert (= (and b!390530 (not res!223499)) b!390532))

(assert (= (and b!390535 condMapEmpty!16026) mapIsEmpty!16026))

(assert (= (and b!390535 (not condMapEmpty!16026)) mapNonEmpty!16026))

(get-info :version)

(assert (= (and mapNonEmpty!16026 ((_ is ValueCellFull!4472) mapValue!16026)) b!390531))

(assert (= (and b!390535 ((_ is ValueCellFull!4472) mapDefault!16026)) b!390541))

(assert (= start!37954 b!390535))

(declare-fun m!387143 () Bool)

(assert (=> b!390532 m!387143))

(declare-fun m!387145 () Bool)

(assert (=> b!390532 m!387145))

(declare-fun m!387147 () Bool)

(assert (=> b!390533 m!387147))

(declare-fun m!387149 () Bool)

(assert (=> b!390533 m!387149))

(declare-fun m!387151 () Bool)

(assert (=> b!390540 m!387151))

(declare-fun m!387153 () Bool)

(assert (=> b!390529 m!387153))

(declare-fun m!387155 () Bool)

(assert (=> b!390530 m!387155))

(declare-fun m!387157 () Bool)

(assert (=> b!390530 m!387157))

(declare-fun m!387159 () Bool)

(assert (=> b!390530 m!387159))

(declare-fun m!387161 () Bool)

(assert (=> b!390530 m!387161))

(declare-fun m!387163 () Bool)

(assert (=> b!390530 m!387163))

(declare-fun m!387165 () Bool)

(assert (=> b!390530 m!387165))

(declare-fun m!387167 () Bool)

(assert (=> b!390530 m!387167))

(declare-fun m!387169 () Bool)

(assert (=> b!390538 m!387169))

(declare-fun m!387171 () Bool)

(assert (=> b!390536 m!387171))

(declare-fun m!387173 () Bool)

(assert (=> b!390537 m!387173))

(declare-fun m!387175 () Bool)

(assert (=> mapNonEmpty!16026 m!387175))

(declare-fun m!387177 () Bool)

(assert (=> b!390539 m!387177))

(declare-fun m!387179 () Bool)

(assert (=> start!37954 m!387179))

(declare-fun m!387181 () Bool)

(assert (=> start!37954 m!387181))

(declare-fun m!387183 () Bool)

(assert (=> start!37954 m!387183))

(check-sat (not b!390532) b_and!16275 (not b!390533) (not b!390530) (not start!37954) (not b!390529) (not b!390537) (not b!390538) (not b!390536) (not mapNonEmpty!16026) tp_is_empty!9631 (not b_next!8959) (not b!390540))
(check-sat b_and!16275 (not b_next!8959))
(get-model)

(declare-fun d!73039 () Bool)

(declare-fun res!223577 () Bool)

(declare-fun e!236611 () Bool)

(assert (=> d!73039 (=> res!223577 e!236611)))

(assert (=> d!73039 (= res!223577 (= (select (arr!11037 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73039 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236611)))

(declare-fun b!390630 () Bool)

(declare-fun e!236612 () Bool)

(assert (=> b!390630 (= e!236611 e!236612)))

(declare-fun res!223578 () Bool)

(assert (=> b!390630 (=> (not res!223578) (not e!236612))))

(assert (=> b!390630 (= res!223578 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11389 _keys!658)))))

(declare-fun b!390631 () Bool)

(assert (=> b!390631 (= e!236612 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73039 (not res!223577)) b!390630))

(assert (= (and b!390630 res!223578) b!390631))

(declare-fun m!387269 () Bool)

(assert (=> d!73039 m!387269))

(declare-fun m!387271 () Bool)

(assert (=> b!390631 m!387271))

(assert (=> b!390529 d!73039))

(declare-fun d!73041 () Bool)

(assert (=> d!73041 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390538 d!73041))

(declare-fun b!390642 () Bool)

(declare-fun e!236624 () Bool)

(declare-fun e!236621 () Bool)

(assert (=> b!390642 (= e!236624 e!236621)))

(declare-fun res!223586 () Bool)

(assert (=> b!390642 (=> (not res!223586) (not e!236621))))

(declare-fun e!236623 () Bool)

(assert (=> b!390642 (= res!223586 (not e!236623))))

(declare-fun res!223585 () Bool)

(assert (=> b!390642 (=> (not res!223585) (not e!236623))))

(assert (=> b!390642 (= res!223585 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27525 () Bool)

(declare-fun call!27528 () Bool)

(declare-fun c!54159 () Bool)

(assert (=> bm!27525 (= call!27528 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54159 (Cons!6254 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) Nil!6255) Nil!6255)))))

(declare-fun b!390643 () Bool)

(declare-fun e!236622 () Bool)

(assert (=> b!390643 (= e!236622 call!27528)))

(declare-fun b!390644 () Bool)

(assert (=> b!390644 (= e!236621 e!236622)))

(assert (=> b!390644 (= c!54159 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390645 () Bool)

(declare-fun contains!2434 (List!6258 (_ BitVec 64)) Bool)

(assert (=> b!390645 (= e!236623 (contains!2434 Nil!6255 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73043 () Bool)

(declare-fun res!223587 () Bool)

(assert (=> d!73043 (=> res!223587 e!236624)))

(assert (=> d!73043 (= res!223587 (bvsge #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> d!73043 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6255) e!236624)))

(declare-fun b!390646 () Bool)

(assert (=> b!390646 (= e!236622 call!27528)))

(assert (= (and d!73043 (not res!223587)) b!390642))

(assert (= (and b!390642 res!223585) b!390645))

(assert (= (and b!390642 res!223586) b!390644))

(assert (= (and b!390644 c!54159) b!390646))

(assert (= (and b!390644 (not c!54159)) b!390643))

(assert (= (or b!390646 b!390643) bm!27525))

(assert (=> b!390642 m!387269))

(assert (=> b!390642 m!387269))

(declare-fun m!387273 () Bool)

(assert (=> b!390642 m!387273))

(assert (=> bm!27525 m!387269))

(declare-fun m!387275 () Bool)

(assert (=> bm!27525 m!387275))

(assert (=> b!390644 m!387269))

(assert (=> b!390644 m!387269))

(assert (=> b!390644 m!387273))

(assert (=> b!390645 m!387269))

(assert (=> b!390645 m!387269))

(declare-fun m!387277 () Bool)

(assert (=> b!390645 m!387277))

(assert (=> b!390536 d!73043))

(declare-fun b!390689 () Bool)

(declare-fun e!236657 () Bool)

(declare-fun call!27544 () Bool)

(assert (=> b!390689 (= e!236657 (not call!27544))))

(declare-fun b!390690 () Bool)

(declare-fun e!236654 () Unit!11933)

(declare-fun Unit!11939 () Unit!11933)

(assert (=> b!390690 (= e!236654 Unit!11939)))

(declare-fun b!390691 () Bool)

(declare-fun e!236651 () Bool)

(declare-fun lt!184247 () ListLongMap!5321)

(declare-fun apply!302 (ListLongMap!5321 (_ BitVec 64)) V!13947)

(assert (=> b!390691 (= e!236651 (= (apply!302 lt!184247 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390692 () Bool)

(declare-fun e!236653 () Bool)

(assert (=> b!390692 (= e!236653 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun b!390693 () Bool)

(declare-fun e!236661 () Bool)

(assert (=> b!390693 (= e!236661 e!236657)))

(declare-fun c!54175 () Bool)

(assert (=> b!390693 (= c!54175 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27541 () Bool)

(declare-fun call!27543 () ListLongMap!5321)

(declare-fun call!27546 () ListLongMap!5321)

(assert (=> bm!27541 (= call!27543 call!27546)))

(declare-fun call!27545 () ListLongMap!5321)

(declare-fun bm!27542 () Bool)

(assert (=> bm!27542 (= call!27545 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27543 () Bool)

(declare-fun call!27549 () ListLongMap!5321)

(declare-fun call!27547 () ListLongMap!5321)

(assert (=> bm!27543 (= call!27549 call!27547)))

(declare-fun e!236662 () Bool)

(declare-fun b!390694 () Bool)

(declare-fun get!5592 (ValueCell!4472 V!13947) V!13947)

(declare-fun dynLambda!645 (Int (_ BitVec 64)) V!13947)

(assert (=> b!390694 (= e!236662 (= (apply!302 lt!184247 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)) (get!5592 (select (arr!11036 lt!184133) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11388 lt!184133)))))

(assert (=> b!390694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun b!390695 () Bool)

(declare-fun lt!184242 () Unit!11933)

(assert (=> b!390695 (= e!236654 lt!184242)))

(declare-fun lt!184243 () ListLongMap!5321)

(assert (=> b!390695 (= lt!184243 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184251 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184258 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184258 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(declare-fun lt!184249 () Unit!11933)

(declare-fun addStillContains!278 (ListLongMap!5321 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11933)

(assert (=> b!390695 (= lt!184249 (addStillContains!278 lt!184243 lt!184251 zeroValue!472 lt!184258))))

(declare-fun contains!2435 (ListLongMap!5321 (_ BitVec 64)) Bool)

(assert (=> b!390695 (contains!2435 (+!1030 lt!184243 (tuple2!6407 lt!184251 zeroValue!472)) lt!184258)))

(declare-fun lt!184241 () Unit!11933)

(assert (=> b!390695 (= lt!184241 lt!184249)))

(declare-fun lt!184250 () ListLongMap!5321)

(assert (=> b!390695 (= lt!184250 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184252 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184252 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184246 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184246 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(declare-fun lt!184245 () Unit!11933)

(declare-fun addApplyDifferent!278 (ListLongMap!5321 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11933)

(assert (=> b!390695 (= lt!184245 (addApplyDifferent!278 lt!184250 lt!184252 minValue!472 lt!184246))))

(assert (=> b!390695 (= (apply!302 (+!1030 lt!184250 (tuple2!6407 lt!184252 minValue!472)) lt!184246) (apply!302 lt!184250 lt!184246))))

(declare-fun lt!184237 () Unit!11933)

(assert (=> b!390695 (= lt!184237 lt!184245)))

(declare-fun lt!184239 () ListLongMap!5321)

(assert (=> b!390695 (= lt!184239 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184254 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184244 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184244 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(declare-fun lt!184253 () Unit!11933)

(assert (=> b!390695 (= lt!184253 (addApplyDifferent!278 lt!184239 lt!184254 zeroValue!472 lt!184244))))

(assert (=> b!390695 (= (apply!302 (+!1030 lt!184239 (tuple2!6407 lt!184254 zeroValue!472)) lt!184244) (apply!302 lt!184239 lt!184244))))

(declare-fun lt!184255 () Unit!11933)

(assert (=> b!390695 (= lt!184255 lt!184253)))

(declare-fun lt!184238 () ListLongMap!5321)

(assert (=> b!390695 (= lt!184238 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184240 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184240 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184248 () (_ BitVec 64))

(assert (=> b!390695 (= lt!184248 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(assert (=> b!390695 (= lt!184242 (addApplyDifferent!278 lt!184238 lt!184240 minValue!472 lt!184248))))

(assert (=> b!390695 (= (apply!302 (+!1030 lt!184238 (tuple2!6407 lt!184240 minValue!472)) lt!184248) (apply!302 lt!184238 lt!184248))))

(declare-fun b!390696 () Bool)

(declare-fun res!223611 () Bool)

(assert (=> b!390696 (=> (not res!223611) (not e!236661))))

(declare-fun e!236652 () Bool)

(assert (=> b!390696 (= res!223611 e!236652)))

(declare-fun res!223614 () Bool)

(assert (=> b!390696 (=> res!223614 e!236652)))

(assert (=> b!390696 (= res!223614 (not e!236653))))

(declare-fun res!223609 () Bool)

(assert (=> b!390696 (=> (not res!223609) (not e!236653))))

(assert (=> b!390696 (= res!223609 (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun b!390697 () Bool)

(declare-fun e!236663 () ListLongMap!5321)

(declare-fun e!236658 () ListLongMap!5321)

(assert (=> b!390697 (= e!236663 e!236658)))

(declare-fun c!54174 () Bool)

(assert (=> b!390697 (= c!54174 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390698 () Bool)

(assert (=> b!390698 (= e!236663 (+!1030 call!27546 (tuple2!6407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390699 () Bool)

(declare-fun res!223613 () Bool)

(assert (=> b!390699 (=> (not res!223613) (not e!236661))))

(declare-fun e!236655 () Bool)

(assert (=> b!390699 (= res!223613 e!236655)))

(declare-fun c!54172 () Bool)

(assert (=> b!390699 (= c!54172 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390700 () Bool)

(declare-fun e!236660 () ListLongMap!5321)

(assert (=> b!390700 (= e!236660 call!27543)))

(declare-fun bm!27544 () Bool)

(assert (=> bm!27544 (= call!27544 (contains!2435 lt!184247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27540 () Bool)

(declare-fun call!27548 () Bool)

(assert (=> bm!27540 (= call!27548 (contains!2435 lt!184247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!73045 () Bool)

(assert (=> d!73045 e!236661))

(declare-fun res!223607 () Bool)

(assert (=> d!73045 (=> (not res!223607) (not e!236661))))

(assert (=> d!73045 (= res!223607 (or (bvsge #b00000000000000000000000000000000 (size!11389 lt!184130)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))))

(declare-fun lt!184257 () ListLongMap!5321)

(assert (=> d!73045 (= lt!184247 lt!184257)))

(declare-fun lt!184256 () Unit!11933)

(assert (=> d!73045 (= lt!184256 e!236654)))

(declare-fun c!54176 () Bool)

(declare-fun e!236656 () Bool)

(assert (=> d!73045 (= c!54176 e!236656)))

(declare-fun res!223610 () Bool)

(assert (=> d!73045 (=> (not res!223610) (not e!236656))))

(assert (=> d!73045 (= res!223610 (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(assert (=> d!73045 (= lt!184257 e!236663)))

(declare-fun c!54173 () Bool)

(assert (=> d!73045 (= c!54173 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73045 (validMask!0 mask!970)))

(assert (=> d!73045 (= (getCurrentListMap!2058 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184247)))

(declare-fun b!390701 () Bool)

(declare-fun e!236659 () Bool)

(assert (=> b!390701 (= e!236657 e!236659)))

(declare-fun res!223606 () Bool)

(assert (=> b!390701 (= res!223606 call!27544)))

(assert (=> b!390701 (=> (not res!223606) (not e!236659))))

(declare-fun bm!27545 () Bool)

(assert (=> bm!27545 (= call!27546 (+!1030 (ite c!54173 call!27545 (ite c!54174 call!27547 call!27549)) (ite (or c!54173 c!54174) (tuple2!6407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390702 () Bool)

(assert (=> b!390702 (= e!236655 e!236651)))

(declare-fun res!223612 () Bool)

(assert (=> b!390702 (= res!223612 call!27548)))

(assert (=> b!390702 (=> (not res!223612) (not e!236651))))

(declare-fun b!390703 () Bool)

(assert (=> b!390703 (= e!236655 (not call!27548))))

(declare-fun b!390704 () Bool)

(assert (=> b!390704 (= e!236656 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun b!390705 () Bool)

(declare-fun c!54177 () Bool)

(assert (=> b!390705 (= c!54177 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390705 (= e!236658 e!236660)))

(declare-fun bm!27546 () Bool)

(assert (=> bm!27546 (= call!27547 call!27545)))

(declare-fun b!390706 () Bool)

(assert (=> b!390706 (= e!236659 (= (apply!302 lt!184247 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390707 () Bool)

(assert (=> b!390707 (= e!236652 e!236662)))

(declare-fun res!223608 () Bool)

(assert (=> b!390707 (=> (not res!223608) (not e!236662))))

(assert (=> b!390707 (= res!223608 (contains!2435 lt!184247 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(assert (=> b!390707 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun b!390708 () Bool)

(assert (=> b!390708 (= e!236660 call!27549)))

(declare-fun b!390709 () Bool)

(assert (=> b!390709 (= e!236658 call!27543)))

(assert (= (and d!73045 c!54173) b!390698))

(assert (= (and d!73045 (not c!54173)) b!390697))

(assert (= (and b!390697 c!54174) b!390709))

(assert (= (and b!390697 (not c!54174)) b!390705))

(assert (= (and b!390705 c!54177) b!390700))

(assert (= (and b!390705 (not c!54177)) b!390708))

(assert (= (or b!390700 b!390708) bm!27543))

(assert (= (or b!390709 bm!27543) bm!27546))

(assert (= (or b!390709 b!390700) bm!27541))

(assert (= (or b!390698 bm!27546) bm!27542))

(assert (= (or b!390698 bm!27541) bm!27545))

(assert (= (and d!73045 res!223610) b!390704))

(assert (= (and d!73045 c!54176) b!390695))

(assert (= (and d!73045 (not c!54176)) b!390690))

(assert (= (and d!73045 res!223607) b!390696))

(assert (= (and b!390696 res!223609) b!390692))

(assert (= (and b!390696 (not res!223614)) b!390707))

(assert (= (and b!390707 res!223608) b!390694))

(assert (= (and b!390696 res!223611) b!390699))

(assert (= (and b!390699 c!54172) b!390702))

(assert (= (and b!390699 (not c!54172)) b!390703))

(assert (= (and b!390702 res!223612) b!390691))

(assert (= (or b!390702 b!390703) bm!27540))

(assert (= (and b!390699 res!223613) b!390693))

(assert (= (and b!390693 c!54175) b!390701))

(assert (= (and b!390693 (not c!54175)) b!390689))

(assert (= (and b!390701 res!223606) b!390706))

(assert (= (or b!390701 b!390689) bm!27544))

(declare-fun b_lambda!8669 () Bool)

(assert (=> (not b_lambda!8669) (not b!390694)))

(declare-fun t!11414 () Bool)

(declare-fun tb!3111 () Bool)

(assert (=> (and start!37954 (= defaultEntry!514 defaultEntry!514) t!11414) tb!3111))

(declare-fun result!5729 () Bool)

(assert (=> tb!3111 (= result!5729 tp_is_empty!9631)))

(assert (=> b!390694 t!11414))

(declare-fun b_and!16281 () Bool)

(assert (= b_and!16275 (and (=> t!11414 result!5729) b_and!16281)))

(declare-fun m!387279 () Bool)

(assert (=> bm!27540 m!387279))

(declare-fun m!387281 () Bool)

(assert (=> b!390698 m!387281))

(declare-fun m!387283 () Bool)

(assert (=> b!390691 m!387283))

(declare-fun m!387285 () Bool)

(assert (=> b!390707 m!387285))

(assert (=> b!390707 m!387285))

(declare-fun m!387287 () Bool)

(assert (=> b!390707 m!387287))

(assert (=> bm!27542 m!387161))

(assert (=> b!390704 m!387285))

(assert (=> b!390704 m!387285))

(declare-fun m!387289 () Bool)

(assert (=> b!390704 m!387289))

(assert (=> b!390692 m!387285))

(assert (=> b!390692 m!387285))

(assert (=> b!390692 m!387289))

(declare-fun m!387291 () Bool)

(assert (=> b!390706 m!387291))

(declare-fun m!387293 () Bool)

(assert (=> bm!27544 m!387293))

(declare-fun m!387295 () Bool)

(assert (=> b!390694 m!387295))

(declare-fun m!387297 () Bool)

(assert (=> b!390694 m!387297))

(assert (=> b!390694 m!387285))

(declare-fun m!387299 () Bool)

(assert (=> b!390694 m!387299))

(assert (=> b!390694 m!387297))

(assert (=> b!390694 m!387295))

(declare-fun m!387301 () Bool)

(assert (=> b!390694 m!387301))

(assert (=> b!390694 m!387285))

(declare-fun m!387303 () Bool)

(assert (=> bm!27545 m!387303))

(declare-fun m!387305 () Bool)

(assert (=> b!390695 m!387305))

(declare-fun m!387307 () Bool)

(assert (=> b!390695 m!387307))

(declare-fun m!387309 () Bool)

(assert (=> b!390695 m!387309))

(declare-fun m!387311 () Bool)

(assert (=> b!390695 m!387311))

(declare-fun m!387313 () Bool)

(assert (=> b!390695 m!387313))

(assert (=> b!390695 m!387309))

(declare-fun m!387315 () Bool)

(assert (=> b!390695 m!387315))

(declare-fun m!387317 () Bool)

(assert (=> b!390695 m!387317))

(assert (=> b!390695 m!387161))

(declare-fun m!387319 () Bool)

(assert (=> b!390695 m!387319))

(declare-fun m!387321 () Bool)

(assert (=> b!390695 m!387321))

(assert (=> b!390695 m!387321))

(declare-fun m!387323 () Bool)

(assert (=> b!390695 m!387323))

(declare-fun m!387325 () Bool)

(assert (=> b!390695 m!387325))

(declare-fun m!387327 () Bool)

(assert (=> b!390695 m!387327))

(assert (=> b!390695 m!387311))

(declare-fun m!387329 () Bool)

(assert (=> b!390695 m!387329))

(declare-fun m!387331 () Bool)

(assert (=> b!390695 m!387331))

(assert (=> b!390695 m!387307))

(declare-fun m!387333 () Bool)

(assert (=> b!390695 m!387333))

(assert (=> b!390695 m!387285))

(assert (=> d!73045 m!387179))

(assert (=> b!390530 d!73045))

(declare-fun b!390736 () Bool)

(declare-fun lt!184276 () Unit!11933)

(declare-fun lt!184273 () Unit!11933)

(assert (=> b!390736 (= lt!184276 lt!184273)))

(declare-fun lt!184274 () V!13947)

(declare-fun lt!184275 () ListLongMap!5321)

(declare-fun lt!184279 () (_ BitVec 64))

(declare-fun lt!184277 () (_ BitVec 64))

(assert (=> b!390736 (not (contains!2435 (+!1030 lt!184275 (tuple2!6407 lt!184279 lt!184274)) lt!184277))))

(declare-fun addStillNotContains!137 (ListLongMap!5321 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11933)

(assert (=> b!390736 (= lt!184273 (addStillNotContains!137 lt!184275 lt!184279 lt!184274 lt!184277))))

(assert (=> b!390736 (= lt!184277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390736 (= lt!184274 (get!5592 (select (arr!11036 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390736 (= lt!184279 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27552 () ListLongMap!5321)

(assert (=> b!390736 (= lt!184275 call!27552)))

(declare-fun e!236680 () ListLongMap!5321)

(assert (=> b!390736 (= e!236680 (+!1030 call!27552 (tuple2!6407 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) (get!5592 (select (arr!11036 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390737 () Bool)

(declare-fun e!236684 () Bool)

(assert (=> b!390737 (= e!236684 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390737 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27549 () Bool)

(assert (=> bm!27549 (= call!27552 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390738 () Bool)

(declare-fun e!236683 () Bool)

(declare-fun e!236678 () Bool)

(assert (=> b!390738 (= e!236683 e!236678)))

(declare-fun c!54187 () Bool)

(assert (=> b!390738 (= c!54187 e!236684)))

(declare-fun res!223626 () Bool)

(assert (=> b!390738 (=> (not res!223626) (not e!236684))))

(assert (=> b!390738 (= res!223626 (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun b!390739 () Bool)

(declare-fun res!223623 () Bool)

(assert (=> b!390739 (=> (not res!223623) (not e!236683))))

(declare-fun lt!184278 () ListLongMap!5321)

(assert (=> b!390739 (= res!223623 (not (contains!2435 lt!184278 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390740 () Bool)

(assert (=> b!390740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> b!390740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11388 _values!506)))))

(declare-fun e!236682 () Bool)

(assert (=> b!390740 (= e!236682 (= (apply!302 lt!184278 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)) (get!5592 (select (arr!11036 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73047 () Bool)

(assert (=> d!73047 e!236683))

(declare-fun res!223625 () Bool)

(assert (=> d!73047 (=> (not res!223625) (not e!236683))))

(assert (=> d!73047 (= res!223625 (not (contains!2435 lt!184278 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236679 () ListLongMap!5321)

(assert (=> d!73047 (= lt!184278 e!236679)))

(declare-fun c!54186 () Bool)

(assert (=> d!73047 (= c!54186 (bvsge #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> d!73047 (validMask!0 mask!970)))

(assert (=> d!73047 (= (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184278)))

(declare-fun b!390741 () Bool)

(assert (=> b!390741 (= e!236680 call!27552)))

(declare-fun e!236681 () Bool)

(declare-fun b!390742 () Bool)

(assert (=> b!390742 (= e!236681 (= lt!184278 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390743 () Bool)

(assert (=> b!390743 (= e!236678 e!236681)))

(declare-fun c!54188 () Bool)

(assert (=> b!390743 (= c!54188 (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun b!390744 () Bool)

(declare-fun isEmpty!554 (ListLongMap!5321) Bool)

(assert (=> b!390744 (= e!236681 (isEmpty!554 lt!184278))))

(declare-fun b!390745 () Bool)

(assert (=> b!390745 (= e!236679 (ListLongMap!5322 Nil!6254))))

(declare-fun b!390746 () Bool)

(assert (=> b!390746 (= e!236679 e!236680)))

(declare-fun c!54189 () Bool)

(assert (=> b!390746 (= c!54189 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390747 () Bool)

(assert (=> b!390747 (= e!236678 e!236682)))

(assert (=> b!390747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun res!223624 () Bool)

(assert (=> b!390747 (= res!223624 (contains!2435 lt!184278 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390747 (=> (not res!223624) (not e!236682))))

(assert (= (and d!73047 c!54186) b!390745))

(assert (= (and d!73047 (not c!54186)) b!390746))

(assert (= (and b!390746 c!54189) b!390736))

(assert (= (and b!390746 (not c!54189)) b!390741))

(assert (= (or b!390736 b!390741) bm!27549))

(assert (= (and d!73047 res!223625) b!390739))

(assert (= (and b!390739 res!223623) b!390738))

(assert (= (and b!390738 res!223626) b!390737))

(assert (= (and b!390738 c!54187) b!390747))

(assert (= (and b!390738 (not c!54187)) b!390743))

(assert (= (and b!390747 res!223624) b!390740))

(assert (= (and b!390743 c!54188) b!390742))

(assert (= (and b!390743 (not c!54188)) b!390744))

(declare-fun b_lambda!8671 () Bool)

(assert (=> (not b_lambda!8671) (not b!390736)))

(assert (=> b!390736 t!11414))

(declare-fun b_and!16283 () Bool)

(assert (= b_and!16281 (and (=> t!11414 result!5729) b_and!16283)))

(declare-fun b_lambda!8673 () Bool)

(assert (=> (not b_lambda!8673) (not b!390740)))

(assert (=> b!390740 t!11414))

(declare-fun b_and!16285 () Bool)

(assert (= b_and!16283 (and (=> t!11414 result!5729) b_and!16285)))

(assert (=> b!390746 m!387269))

(assert (=> b!390746 m!387269))

(assert (=> b!390746 m!387273))

(declare-fun m!387335 () Bool)

(assert (=> b!390736 m!387335))

(declare-fun m!387337 () Bool)

(assert (=> b!390736 m!387337))

(declare-fun m!387339 () Bool)

(assert (=> b!390736 m!387339))

(declare-fun m!387341 () Bool)

(assert (=> b!390736 m!387341))

(assert (=> b!390736 m!387269))

(assert (=> b!390736 m!387337))

(declare-fun m!387343 () Bool)

(assert (=> b!390736 m!387343))

(assert (=> b!390736 m!387295))

(assert (=> b!390736 m!387335))

(assert (=> b!390736 m!387295))

(declare-fun m!387345 () Bool)

(assert (=> b!390736 m!387345))

(assert (=> b!390737 m!387269))

(assert (=> b!390737 m!387269))

(assert (=> b!390737 m!387273))

(declare-fun m!387347 () Bool)

(assert (=> b!390744 m!387347))

(declare-fun m!387349 () Bool)

(assert (=> b!390739 m!387349))

(declare-fun m!387351 () Bool)

(assert (=> b!390742 m!387351))

(assert (=> b!390747 m!387269))

(assert (=> b!390747 m!387269))

(declare-fun m!387353 () Bool)

(assert (=> b!390747 m!387353))

(assert (=> b!390740 m!387335))

(assert (=> b!390740 m!387269))

(declare-fun m!387355 () Bool)

(assert (=> b!390740 m!387355))

(assert (=> b!390740 m!387269))

(assert (=> b!390740 m!387295))

(assert (=> b!390740 m!387335))

(assert (=> b!390740 m!387295))

(assert (=> b!390740 m!387345))

(declare-fun m!387357 () Bool)

(assert (=> d!73047 m!387357))

(assert (=> d!73047 m!387179))

(assert (=> bm!27549 m!387351))

(assert (=> b!390530 d!73047))

(declare-fun b!390748 () Bool)

(declare-fun lt!184283 () Unit!11933)

(declare-fun lt!184280 () Unit!11933)

(assert (=> b!390748 (= lt!184283 lt!184280)))

(declare-fun lt!184282 () ListLongMap!5321)

(declare-fun lt!184286 () (_ BitVec 64))

(declare-fun lt!184284 () (_ BitVec 64))

(declare-fun lt!184281 () V!13947)

(assert (=> b!390748 (not (contains!2435 (+!1030 lt!184282 (tuple2!6407 lt!184286 lt!184281)) lt!184284))))

(assert (=> b!390748 (= lt!184280 (addStillNotContains!137 lt!184282 lt!184286 lt!184281 lt!184284))))

(assert (=> b!390748 (= lt!184284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390748 (= lt!184281 (get!5592 (select (arr!11036 lt!184133) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390748 (= lt!184286 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(declare-fun call!27553 () ListLongMap!5321)

(assert (=> b!390748 (= lt!184282 call!27553)))

(declare-fun e!236687 () ListLongMap!5321)

(assert (=> b!390748 (= e!236687 (+!1030 call!27553 (tuple2!6407 (select (arr!11037 lt!184130) #b00000000000000000000000000000000) (get!5592 (select (arr!11036 lt!184133) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390749 () Bool)

(declare-fun e!236691 () Bool)

(assert (=> b!390749 (= e!236691 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(assert (=> b!390749 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27550 () Bool)

(assert (=> bm!27550 (= call!27553 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390750 () Bool)

(declare-fun e!236690 () Bool)

(declare-fun e!236685 () Bool)

(assert (=> b!390750 (= e!236690 e!236685)))

(declare-fun c!54191 () Bool)

(assert (=> b!390750 (= c!54191 e!236691)))

(declare-fun res!223630 () Bool)

(assert (=> b!390750 (=> (not res!223630) (not e!236691))))

(assert (=> b!390750 (= res!223630 (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun b!390751 () Bool)

(declare-fun res!223627 () Bool)

(assert (=> b!390751 (=> (not res!223627) (not e!236690))))

(declare-fun lt!184285 () ListLongMap!5321)

(assert (=> b!390751 (= res!223627 (not (contains!2435 lt!184285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390752 () Bool)

(assert (=> b!390752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(assert (=> b!390752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11388 lt!184133)))))

(declare-fun e!236689 () Bool)

(assert (=> b!390752 (= e!236689 (= (apply!302 lt!184285 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)) (get!5592 (select (arr!11036 lt!184133) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73049 () Bool)

(assert (=> d!73049 e!236690))

(declare-fun res!223629 () Bool)

(assert (=> d!73049 (=> (not res!223629) (not e!236690))))

(assert (=> d!73049 (= res!223629 (not (contains!2435 lt!184285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236686 () ListLongMap!5321)

(assert (=> d!73049 (= lt!184285 e!236686)))

(declare-fun c!54190 () Bool)

(assert (=> d!73049 (= c!54190 (bvsge #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(assert (=> d!73049 (validMask!0 mask!970)))

(assert (=> d!73049 (= (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184285)))

(declare-fun b!390753 () Bool)

(assert (=> b!390753 (= e!236687 call!27553)))

(declare-fun b!390754 () Bool)

(declare-fun e!236688 () Bool)

(assert (=> b!390754 (= e!236688 (= lt!184285 (getCurrentListMapNoExtraKeys!947 lt!184130 lt!184133 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390755 () Bool)

(assert (=> b!390755 (= e!236685 e!236688)))

(declare-fun c!54192 () Bool)

(assert (=> b!390755 (= c!54192 (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun b!390756 () Bool)

(assert (=> b!390756 (= e!236688 (isEmpty!554 lt!184285))))

(declare-fun b!390757 () Bool)

(assert (=> b!390757 (= e!236686 (ListLongMap!5322 Nil!6254))))

(declare-fun b!390758 () Bool)

(assert (=> b!390758 (= e!236686 e!236687)))

(declare-fun c!54193 () Bool)

(assert (=> b!390758 (= c!54193 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun b!390759 () Bool)

(assert (=> b!390759 (= e!236685 e!236689)))

(assert (=> b!390759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(declare-fun res!223628 () Bool)

(assert (=> b!390759 (= res!223628 (contains!2435 lt!184285 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(assert (=> b!390759 (=> (not res!223628) (not e!236689))))

(assert (= (and d!73049 c!54190) b!390757))

(assert (= (and d!73049 (not c!54190)) b!390758))

(assert (= (and b!390758 c!54193) b!390748))

(assert (= (and b!390758 (not c!54193)) b!390753))

(assert (= (or b!390748 b!390753) bm!27550))

(assert (= (and d!73049 res!223629) b!390751))

(assert (= (and b!390751 res!223627) b!390750))

(assert (= (and b!390750 res!223630) b!390749))

(assert (= (and b!390750 c!54191) b!390759))

(assert (= (and b!390750 (not c!54191)) b!390755))

(assert (= (and b!390759 res!223628) b!390752))

(assert (= (and b!390755 c!54192) b!390754))

(assert (= (and b!390755 (not c!54192)) b!390756))

(declare-fun b_lambda!8675 () Bool)

(assert (=> (not b_lambda!8675) (not b!390748)))

(assert (=> b!390748 t!11414))

(declare-fun b_and!16287 () Bool)

(assert (= b_and!16285 (and (=> t!11414 result!5729) b_and!16287)))

(declare-fun b_lambda!8677 () Bool)

(assert (=> (not b_lambda!8677) (not b!390752)))

(assert (=> b!390752 t!11414))

(declare-fun b_and!16289 () Bool)

(assert (= b_and!16287 (and (=> t!11414 result!5729) b_and!16289)))

(assert (=> b!390758 m!387285))

(assert (=> b!390758 m!387285))

(assert (=> b!390758 m!387289))

(assert (=> b!390748 m!387297))

(declare-fun m!387359 () Bool)

(assert (=> b!390748 m!387359))

(declare-fun m!387361 () Bool)

(assert (=> b!390748 m!387361))

(declare-fun m!387363 () Bool)

(assert (=> b!390748 m!387363))

(assert (=> b!390748 m!387285))

(assert (=> b!390748 m!387359))

(declare-fun m!387365 () Bool)

(assert (=> b!390748 m!387365))

(assert (=> b!390748 m!387295))

(assert (=> b!390748 m!387297))

(assert (=> b!390748 m!387295))

(assert (=> b!390748 m!387301))

(assert (=> b!390749 m!387285))

(assert (=> b!390749 m!387285))

(assert (=> b!390749 m!387289))

(declare-fun m!387367 () Bool)

(assert (=> b!390756 m!387367))

(declare-fun m!387369 () Bool)

(assert (=> b!390751 m!387369))

(declare-fun m!387371 () Bool)

(assert (=> b!390754 m!387371))

(assert (=> b!390759 m!387285))

(assert (=> b!390759 m!387285))

(declare-fun m!387373 () Bool)

(assert (=> b!390759 m!387373))

(assert (=> b!390752 m!387297))

(assert (=> b!390752 m!387285))

(declare-fun m!387375 () Bool)

(assert (=> b!390752 m!387375))

(assert (=> b!390752 m!387285))

(assert (=> b!390752 m!387295))

(assert (=> b!390752 m!387297))

(assert (=> b!390752 m!387295))

(assert (=> b!390752 m!387301))

(declare-fun m!387377 () Bool)

(assert (=> d!73049 m!387377))

(assert (=> d!73049 m!387179))

(assert (=> bm!27550 m!387371))

(assert (=> b!390530 d!73049))

(declare-fun b!390760 () Bool)

(declare-fun e!236698 () Bool)

(declare-fun call!27555 () Bool)

(assert (=> b!390760 (= e!236698 (not call!27555))))

(declare-fun b!390761 () Bool)

(declare-fun e!236695 () Unit!11933)

(declare-fun Unit!11940 () Unit!11933)

(assert (=> b!390761 (= e!236695 Unit!11940)))

(declare-fun b!390762 () Bool)

(declare-fun e!236692 () Bool)

(declare-fun lt!184297 () ListLongMap!5321)

(assert (=> b!390762 (= e!236692 (= (apply!302 lt!184297 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390763 () Bool)

(declare-fun e!236694 () Bool)

(assert (=> b!390763 (= e!236694 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390764 () Bool)

(declare-fun e!236702 () Bool)

(assert (=> b!390764 (= e!236702 e!236698)))

(declare-fun c!54197 () Bool)

(assert (=> b!390764 (= c!54197 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27552 () Bool)

(declare-fun call!27554 () ListLongMap!5321)

(declare-fun call!27557 () ListLongMap!5321)

(assert (=> bm!27552 (= call!27554 call!27557)))

(declare-fun bm!27553 () Bool)

(declare-fun call!27556 () ListLongMap!5321)

(assert (=> bm!27553 (= call!27556 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27554 () Bool)

(declare-fun call!27560 () ListLongMap!5321)

(declare-fun call!27558 () ListLongMap!5321)

(assert (=> bm!27554 (= call!27560 call!27558)))

(declare-fun e!236703 () Bool)

(declare-fun b!390765 () Bool)

(assert (=> b!390765 (= e!236703 (= (apply!302 lt!184297 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)) (get!5592 (select (arr!11036 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11388 _values!506)))))

(assert (=> b!390765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun b!390766 () Bool)

(declare-fun lt!184292 () Unit!11933)

(assert (=> b!390766 (= e!236695 lt!184292)))

(declare-fun lt!184293 () ListLongMap!5321)

(assert (=> b!390766 (= lt!184293 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184301 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184308 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184308 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184299 () Unit!11933)

(assert (=> b!390766 (= lt!184299 (addStillContains!278 lt!184293 lt!184301 zeroValue!472 lt!184308))))

(assert (=> b!390766 (contains!2435 (+!1030 lt!184293 (tuple2!6407 lt!184301 zeroValue!472)) lt!184308)))

(declare-fun lt!184291 () Unit!11933)

(assert (=> b!390766 (= lt!184291 lt!184299)))

(declare-fun lt!184300 () ListLongMap!5321)

(assert (=> b!390766 (= lt!184300 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184302 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184302 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184296 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184296 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184295 () Unit!11933)

(assert (=> b!390766 (= lt!184295 (addApplyDifferent!278 lt!184300 lt!184302 minValue!472 lt!184296))))

(assert (=> b!390766 (= (apply!302 (+!1030 lt!184300 (tuple2!6407 lt!184302 minValue!472)) lt!184296) (apply!302 lt!184300 lt!184296))))

(declare-fun lt!184287 () Unit!11933)

(assert (=> b!390766 (= lt!184287 lt!184295)))

(declare-fun lt!184289 () ListLongMap!5321)

(assert (=> b!390766 (= lt!184289 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184304 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184294 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184294 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184303 () Unit!11933)

(assert (=> b!390766 (= lt!184303 (addApplyDifferent!278 lt!184289 lt!184304 zeroValue!472 lt!184294))))

(assert (=> b!390766 (= (apply!302 (+!1030 lt!184289 (tuple2!6407 lt!184304 zeroValue!472)) lt!184294) (apply!302 lt!184289 lt!184294))))

(declare-fun lt!184305 () Unit!11933)

(assert (=> b!390766 (= lt!184305 lt!184303)))

(declare-fun lt!184288 () ListLongMap!5321)

(assert (=> b!390766 (= lt!184288 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184290 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184290 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184298 () (_ BitVec 64))

(assert (=> b!390766 (= lt!184298 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390766 (= lt!184292 (addApplyDifferent!278 lt!184288 lt!184290 minValue!472 lt!184298))))

(assert (=> b!390766 (= (apply!302 (+!1030 lt!184288 (tuple2!6407 lt!184290 minValue!472)) lt!184298) (apply!302 lt!184288 lt!184298))))

(declare-fun b!390767 () Bool)

(declare-fun res!223636 () Bool)

(assert (=> b!390767 (=> (not res!223636) (not e!236702))))

(declare-fun e!236693 () Bool)

(assert (=> b!390767 (= res!223636 e!236693)))

(declare-fun res!223639 () Bool)

(assert (=> b!390767 (=> res!223639 e!236693)))

(assert (=> b!390767 (= res!223639 (not e!236694))))

(declare-fun res!223634 () Bool)

(assert (=> b!390767 (=> (not res!223634) (not e!236694))))

(assert (=> b!390767 (= res!223634 (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun b!390768 () Bool)

(declare-fun e!236704 () ListLongMap!5321)

(declare-fun e!236699 () ListLongMap!5321)

(assert (=> b!390768 (= e!236704 e!236699)))

(declare-fun c!54196 () Bool)

(assert (=> b!390768 (= c!54196 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390769 () Bool)

(assert (=> b!390769 (= e!236704 (+!1030 call!27557 (tuple2!6407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390770 () Bool)

(declare-fun res!223638 () Bool)

(assert (=> b!390770 (=> (not res!223638) (not e!236702))))

(declare-fun e!236696 () Bool)

(assert (=> b!390770 (= res!223638 e!236696)))

(declare-fun c!54194 () Bool)

(assert (=> b!390770 (= c!54194 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390771 () Bool)

(declare-fun e!236701 () ListLongMap!5321)

(assert (=> b!390771 (= e!236701 call!27554)))

(declare-fun bm!27555 () Bool)

(assert (=> bm!27555 (= call!27555 (contains!2435 lt!184297 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27551 () Bool)

(declare-fun call!27559 () Bool)

(assert (=> bm!27551 (= call!27559 (contains!2435 lt!184297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!73051 () Bool)

(assert (=> d!73051 e!236702))

(declare-fun res!223632 () Bool)

(assert (=> d!73051 (=> (not res!223632) (not e!236702))))

(assert (=> d!73051 (= res!223632 (or (bvsge #b00000000000000000000000000000000 (size!11389 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))))

(declare-fun lt!184307 () ListLongMap!5321)

(assert (=> d!73051 (= lt!184297 lt!184307)))

(declare-fun lt!184306 () Unit!11933)

(assert (=> d!73051 (= lt!184306 e!236695)))

(declare-fun c!54198 () Bool)

(declare-fun e!236697 () Bool)

(assert (=> d!73051 (= c!54198 e!236697)))

(declare-fun res!223635 () Bool)

(assert (=> d!73051 (=> (not res!223635) (not e!236697))))

(assert (=> d!73051 (= res!223635 (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> d!73051 (= lt!184307 e!236704)))

(declare-fun c!54195 () Bool)

(assert (=> d!73051 (= c!54195 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73051 (validMask!0 mask!970)))

(assert (=> d!73051 (= (getCurrentListMap!2058 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184297)))

(declare-fun b!390772 () Bool)

(declare-fun e!236700 () Bool)

(assert (=> b!390772 (= e!236698 e!236700)))

(declare-fun res!223631 () Bool)

(assert (=> b!390772 (= res!223631 call!27555)))

(assert (=> b!390772 (=> (not res!223631) (not e!236700))))

(declare-fun bm!27556 () Bool)

(assert (=> bm!27556 (= call!27557 (+!1030 (ite c!54195 call!27556 (ite c!54196 call!27558 call!27560)) (ite (or c!54195 c!54196) (tuple2!6407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390773 () Bool)

(assert (=> b!390773 (= e!236696 e!236692)))

(declare-fun res!223637 () Bool)

(assert (=> b!390773 (= res!223637 call!27559)))

(assert (=> b!390773 (=> (not res!223637) (not e!236692))))

(declare-fun b!390774 () Bool)

(assert (=> b!390774 (= e!236696 (not call!27559))))

(declare-fun b!390775 () Bool)

(assert (=> b!390775 (= e!236697 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390776 () Bool)

(declare-fun c!54199 () Bool)

(assert (=> b!390776 (= c!54199 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390776 (= e!236699 e!236701)))

(declare-fun bm!27557 () Bool)

(assert (=> bm!27557 (= call!27558 call!27556)))

(declare-fun b!390777 () Bool)

(assert (=> b!390777 (= e!236700 (= (apply!302 lt!184297 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390778 () Bool)

(assert (=> b!390778 (= e!236693 e!236703)))

(declare-fun res!223633 () Bool)

(assert (=> b!390778 (=> (not res!223633) (not e!236703))))

(assert (=> b!390778 (= res!223633 (contains!2435 lt!184297 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(declare-fun b!390779 () Bool)

(assert (=> b!390779 (= e!236701 call!27560)))

(declare-fun b!390780 () Bool)

(assert (=> b!390780 (= e!236699 call!27554)))

(assert (= (and d!73051 c!54195) b!390769))

(assert (= (and d!73051 (not c!54195)) b!390768))

(assert (= (and b!390768 c!54196) b!390780))

(assert (= (and b!390768 (not c!54196)) b!390776))

(assert (= (and b!390776 c!54199) b!390771))

(assert (= (and b!390776 (not c!54199)) b!390779))

(assert (= (or b!390771 b!390779) bm!27554))

(assert (= (or b!390780 bm!27554) bm!27557))

(assert (= (or b!390780 b!390771) bm!27552))

(assert (= (or b!390769 bm!27557) bm!27553))

(assert (= (or b!390769 bm!27552) bm!27556))

(assert (= (and d!73051 res!223635) b!390775))

(assert (= (and d!73051 c!54198) b!390766))

(assert (= (and d!73051 (not c!54198)) b!390761))

(assert (= (and d!73051 res!223632) b!390767))

(assert (= (and b!390767 res!223634) b!390763))

(assert (= (and b!390767 (not res!223639)) b!390778))

(assert (= (and b!390778 res!223633) b!390765))

(assert (= (and b!390767 res!223636) b!390770))

(assert (= (and b!390770 c!54194) b!390773))

(assert (= (and b!390770 (not c!54194)) b!390774))

(assert (= (and b!390773 res!223637) b!390762))

(assert (= (or b!390773 b!390774) bm!27551))

(assert (= (and b!390770 res!223638) b!390764))

(assert (= (and b!390764 c!54197) b!390772))

(assert (= (and b!390764 (not c!54197)) b!390760))

(assert (= (and b!390772 res!223631) b!390777))

(assert (= (or b!390772 b!390760) bm!27555))

(declare-fun b_lambda!8679 () Bool)

(assert (=> (not b_lambda!8679) (not b!390765)))

(assert (=> b!390765 t!11414))

(declare-fun b_and!16291 () Bool)

(assert (= b_and!16289 (and (=> t!11414 result!5729) b_and!16291)))

(declare-fun m!387379 () Bool)

(assert (=> bm!27551 m!387379))

(declare-fun m!387381 () Bool)

(assert (=> b!390769 m!387381))

(declare-fun m!387383 () Bool)

(assert (=> b!390762 m!387383))

(assert (=> b!390778 m!387269))

(assert (=> b!390778 m!387269))

(declare-fun m!387385 () Bool)

(assert (=> b!390778 m!387385))

(assert (=> bm!27553 m!387155))

(assert (=> b!390775 m!387269))

(assert (=> b!390775 m!387269))

(assert (=> b!390775 m!387273))

(assert (=> b!390763 m!387269))

(assert (=> b!390763 m!387269))

(assert (=> b!390763 m!387273))

(declare-fun m!387387 () Bool)

(assert (=> b!390777 m!387387))

(declare-fun m!387389 () Bool)

(assert (=> bm!27555 m!387389))

(assert (=> b!390765 m!387295))

(assert (=> b!390765 m!387335))

(assert (=> b!390765 m!387269))

(declare-fun m!387391 () Bool)

(assert (=> b!390765 m!387391))

(assert (=> b!390765 m!387335))

(assert (=> b!390765 m!387295))

(assert (=> b!390765 m!387345))

(assert (=> b!390765 m!387269))

(declare-fun m!387393 () Bool)

(assert (=> bm!27556 m!387393))

(declare-fun m!387395 () Bool)

(assert (=> b!390766 m!387395))

(declare-fun m!387397 () Bool)

(assert (=> b!390766 m!387397))

(declare-fun m!387399 () Bool)

(assert (=> b!390766 m!387399))

(declare-fun m!387401 () Bool)

(assert (=> b!390766 m!387401))

(declare-fun m!387403 () Bool)

(assert (=> b!390766 m!387403))

(assert (=> b!390766 m!387399))

(declare-fun m!387405 () Bool)

(assert (=> b!390766 m!387405))

(declare-fun m!387407 () Bool)

(assert (=> b!390766 m!387407))

(assert (=> b!390766 m!387155))

(declare-fun m!387409 () Bool)

(assert (=> b!390766 m!387409))

(declare-fun m!387411 () Bool)

(assert (=> b!390766 m!387411))

(assert (=> b!390766 m!387411))

(declare-fun m!387413 () Bool)

(assert (=> b!390766 m!387413))

(declare-fun m!387415 () Bool)

(assert (=> b!390766 m!387415))

(declare-fun m!387417 () Bool)

(assert (=> b!390766 m!387417))

(assert (=> b!390766 m!387401))

(declare-fun m!387419 () Bool)

(assert (=> b!390766 m!387419))

(declare-fun m!387421 () Bool)

(assert (=> b!390766 m!387421))

(assert (=> b!390766 m!387397))

(declare-fun m!387423 () Bool)

(assert (=> b!390766 m!387423))

(assert (=> b!390766 m!387269))

(assert (=> d!73051 m!387179))

(assert (=> b!390530 d!73051))

(declare-fun call!27565 () ListLongMap!5321)

(declare-fun bm!27562 () Bool)

(assert (=> bm!27562 (= call!27565 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27563 () Bool)

(declare-fun call!27566 () ListLongMap!5321)

(assert (=> bm!27563 (= call!27566 (getCurrentListMapNoExtraKeys!947 (array!23149 (store (arr!11037 _keys!658) i!548 k0!778) (size!11389 _keys!658)) (array!23147 (store (arr!11036 _values!506) i!548 (ValueCellFull!4472 v!373)) (size!11388 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390787 () Bool)

(declare-fun e!236710 () Bool)

(assert (=> b!390787 (= e!236710 (= call!27566 call!27565))))

(declare-fun b!390788 () Bool)

(declare-fun e!236709 () Bool)

(assert (=> b!390788 (= e!236709 e!236710)))

(declare-fun c!54202 () Bool)

(assert (=> b!390788 (= c!54202 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!390789 () Bool)

(assert (=> b!390789 (= e!236710 (= call!27566 (+!1030 call!27565 (tuple2!6407 k0!778 v!373))))))

(declare-fun d!73053 () Bool)

(assert (=> d!73053 e!236709))

(declare-fun res!223642 () Bool)

(assert (=> d!73053 (=> (not res!223642) (not e!236709))))

(assert (=> d!73053 (= res!223642 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11389 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11388 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11389 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11388 _values!506))))))))

(declare-fun lt!184311 () Unit!11933)

(declare-fun choose!1324 (array!23148 array!23146 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) (_ BitVec 64) V!13947 (_ BitVec 32) Int) Unit!11933)

(assert (=> d!73053 (= lt!184311 (choose!1324 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> d!73053 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!249 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184311)))

(assert (= (and d!73053 res!223642) b!390788))

(assert (= (and b!390788 c!54202) b!390789))

(assert (= (and b!390788 (not c!54202)) b!390787))

(assert (= (or b!390789 b!390787) bm!27562))

(assert (= (or b!390789 b!390787) bm!27563))

(assert (=> bm!27562 m!387155))

(assert (=> bm!27563 m!387149))

(assert (=> bm!27563 m!387167))

(declare-fun m!387425 () Bool)

(assert (=> bm!27563 m!387425))

(declare-fun m!387427 () Bool)

(assert (=> b!390789 m!387427))

(declare-fun m!387429 () Bool)

(assert (=> d!73053 m!387429))

(assert (=> b!390530 d!73053))

(declare-fun d!73055 () Bool)

(declare-fun e!236713 () Bool)

(assert (=> d!73055 e!236713))

(declare-fun res!223648 () Bool)

(assert (=> d!73055 (=> (not res!223648) (not e!236713))))

(declare-fun lt!184320 () ListLongMap!5321)

(assert (=> d!73055 (= res!223648 (contains!2435 lt!184320 (_1!3214 (tuple2!6407 k0!778 v!373))))))

(declare-fun lt!184321 () List!6257)

(assert (=> d!73055 (= lt!184320 (ListLongMap!5322 lt!184321))))

(declare-fun lt!184323 () Unit!11933)

(declare-fun lt!184322 () Unit!11933)

(assert (=> d!73055 (= lt!184323 lt!184322)))

(declare-datatypes ((Option!367 0))(
  ( (Some!366 (v!7084 V!13947)) (None!365) )
))
(declare-fun getValueByKey!361 (List!6257 (_ BitVec 64)) Option!367)

(assert (=> d!73055 (= (getValueByKey!361 lt!184321 (_1!3214 (tuple2!6407 k0!778 v!373))) (Some!366 (_2!3214 (tuple2!6407 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!183 (List!6257 (_ BitVec 64) V!13947) Unit!11933)

(assert (=> d!73055 (= lt!184322 (lemmaContainsTupThenGetReturnValue!183 lt!184321 (_1!3214 (tuple2!6407 k0!778 v!373)) (_2!3214 (tuple2!6407 k0!778 v!373))))))

(declare-fun insertStrictlySorted!186 (List!6257 (_ BitVec 64) V!13947) List!6257)

(assert (=> d!73055 (= lt!184321 (insertStrictlySorted!186 (toList!2676 lt!184135) (_1!3214 (tuple2!6407 k0!778 v!373)) (_2!3214 (tuple2!6407 k0!778 v!373))))))

(assert (=> d!73055 (= (+!1030 lt!184135 (tuple2!6407 k0!778 v!373)) lt!184320)))

(declare-fun b!390794 () Bool)

(declare-fun res!223647 () Bool)

(assert (=> b!390794 (=> (not res!223647) (not e!236713))))

(assert (=> b!390794 (= res!223647 (= (getValueByKey!361 (toList!2676 lt!184320) (_1!3214 (tuple2!6407 k0!778 v!373))) (Some!366 (_2!3214 (tuple2!6407 k0!778 v!373)))))))

(declare-fun b!390795 () Bool)

(declare-fun contains!2436 (List!6257 tuple2!6406) Bool)

(assert (=> b!390795 (= e!236713 (contains!2436 (toList!2676 lt!184320) (tuple2!6407 k0!778 v!373)))))

(assert (= (and d!73055 res!223648) b!390794))

(assert (= (and b!390794 res!223647) b!390795))

(declare-fun m!387431 () Bool)

(assert (=> d!73055 m!387431))

(declare-fun m!387433 () Bool)

(assert (=> d!73055 m!387433))

(declare-fun m!387435 () Bool)

(assert (=> d!73055 m!387435))

(declare-fun m!387437 () Bool)

(assert (=> d!73055 m!387437))

(declare-fun m!387439 () Bool)

(assert (=> b!390794 m!387439))

(declare-fun m!387441 () Bool)

(assert (=> b!390795 m!387441))

(assert (=> b!390530 d!73055))

(declare-fun d!73057 () Bool)

(declare-fun e!236714 () Bool)

(assert (=> d!73057 e!236714))

(declare-fun res!223650 () Bool)

(assert (=> d!73057 (=> (not res!223650) (not e!236714))))

(declare-fun lt!184324 () ListLongMap!5321)

(assert (=> d!73057 (= res!223650 (contains!2435 lt!184324 (_1!3214 lt!184138)))))

(declare-fun lt!184325 () List!6257)

(assert (=> d!73057 (= lt!184324 (ListLongMap!5322 lt!184325))))

(declare-fun lt!184327 () Unit!11933)

(declare-fun lt!184326 () Unit!11933)

(assert (=> d!73057 (= lt!184327 lt!184326)))

(assert (=> d!73057 (= (getValueByKey!361 lt!184325 (_1!3214 lt!184138)) (Some!366 (_2!3214 lt!184138)))))

(assert (=> d!73057 (= lt!184326 (lemmaContainsTupThenGetReturnValue!183 lt!184325 (_1!3214 lt!184138) (_2!3214 lt!184138)))))

(assert (=> d!73057 (= lt!184325 (insertStrictlySorted!186 (toList!2676 lt!184135) (_1!3214 lt!184138) (_2!3214 lt!184138)))))

(assert (=> d!73057 (= (+!1030 lt!184135 lt!184138) lt!184324)))

(declare-fun b!390796 () Bool)

(declare-fun res!223649 () Bool)

(assert (=> b!390796 (=> (not res!223649) (not e!236714))))

(assert (=> b!390796 (= res!223649 (= (getValueByKey!361 (toList!2676 lt!184324) (_1!3214 lt!184138)) (Some!366 (_2!3214 lt!184138))))))

(declare-fun b!390797 () Bool)

(assert (=> b!390797 (= e!236714 (contains!2436 (toList!2676 lt!184324) lt!184138))))

(assert (= (and d!73057 res!223650) b!390796))

(assert (= (and b!390796 res!223649) b!390797))

(declare-fun m!387443 () Bool)

(assert (=> d!73057 m!387443))

(declare-fun m!387445 () Bool)

(assert (=> d!73057 m!387445))

(declare-fun m!387447 () Bool)

(assert (=> d!73057 m!387447))

(declare-fun m!387449 () Bool)

(assert (=> d!73057 m!387449))

(declare-fun m!387451 () Bool)

(assert (=> b!390796 m!387451))

(declare-fun m!387453 () Bool)

(assert (=> b!390797 m!387453))

(assert (=> b!390532 d!73057))

(declare-fun d!73059 () Bool)

(declare-fun e!236715 () Bool)

(assert (=> d!73059 e!236715))

(declare-fun res!223652 () Bool)

(assert (=> d!73059 (=> (not res!223652) (not e!236715))))

(declare-fun lt!184328 () ListLongMap!5321)

(assert (=> d!73059 (= res!223652 (contains!2435 lt!184328 (_1!3214 lt!184138)))))

(declare-fun lt!184329 () List!6257)

(assert (=> d!73059 (= lt!184328 (ListLongMap!5322 lt!184329))))

(declare-fun lt!184331 () Unit!11933)

(declare-fun lt!184330 () Unit!11933)

(assert (=> d!73059 (= lt!184331 lt!184330)))

(assert (=> d!73059 (= (getValueByKey!361 lt!184329 (_1!3214 lt!184138)) (Some!366 (_2!3214 lt!184138)))))

(assert (=> d!73059 (= lt!184330 (lemmaContainsTupThenGetReturnValue!183 lt!184329 (_1!3214 lt!184138) (_2!3214 lt!184138)))))

(assert (=> d!73059 (= lt!184329 (insertStrictlySorted!186 (toList!2676 lt!184136) (_1!3214 lt!184138) (_2!3214 lt!184138)))))

(assert (=> d!73059 (= (+!1030 lt!184136 lt!184138) lt!184328)))

(declare-fun b!390798 () Bool)

(declare-fun res!223651 () Bool)

(assert (=> b!390798 (=> (not res!223651) (not e!236715))))

(assert (=> b!390798 (= res!223651 (= (getValueByKey!361 (toList!2676 lt!184328) (_1!3214 lt!184138)) (Some!366 (_2!3214 lt!184138))))))

(declare-fun b!390799 () Bool)

(assert (=> b!390799 (= e!236715 (contains!2436 (toList!2676 lt!184328) lt!184138))))

(assert (= (and d!73059 res!223652) b!390798))

(assert (= (and b!390798 res!223651) b!390799))

(declare-fun m!387455 () Bool)

(assert (=> d!73059 m!387455))

(declare-fun m!387457 () Bool)

(assert (=> d!73059 m!387457))

(declare-fun m!387459 () Bool)

(assert (=> d!73059 m!387459))

(declare-fun m!387461 () Bool)

(assert (=> d!73059 m!387461))

(declare-fun m!387463 () Bool)

(assert (=> b!390798 m!387463))

(declare-fun m!387465 () Bool)

(assert (=> b!390799 m!387465))

(assert (=> b!390532 d!73059))

(declare-fun d!73061 () Bool)

(assert (=> d!73061 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37954 d!73061))

(declare-fun d!73063 () Bool)

(assert (=> d!73063 (= (array_inv!8160 _values!506) (bvsge (size!11388 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37954 d!73063))

(declare-fun d!73065 () Bool)

(assert (=> d!73065 (= (array_inv!8161 _keys!658) (bvsge (size!11389 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37954 d!73065))

(declare-fun d!73067 () Bool)

(declare-fun res!223658 () Bool)

(declare-fun e!236722 () Bool)

(assert (=> d!73067 (=> res!223658 e!236722)))

(assert (=> d!73067 (= res!223658 (bvsge #b00000000000000000000000000000000 (size!11389 _keys!658)))))

(assert (=> d!73067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236722)))

(declare-fun b!390808 () Bool)

(declare-fun e!236724 () Bool)

(declare-fun call!27569 () Bool)

(assert (=> b!390808 (= e!236724 call!27569)))

(declare-fun b!390809 () Bool)

(declare-fun e!236723 () Bool)

(assert (=> b!390809 (= e!236723 call!27569)))

(declare-fun b!390810 () Bool)

(assert (=> b!390810 (= e!236724 e!236723)))

(declare-fun lt!184339 () (_ BitVec 64))

(assert (=> b!390810 (= lt!184339 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184340 () Unit!11933)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23148 (_ BitVec 64) (_ BitVec 32)) Unit!11933)

(assert (=> b!390810 (= lt!184340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184339 #b00000000000000000000000000000000))))

(assert (=> b!390810 (arrayContainsKey!0 _keys!658 lt!184339 #b00000000000000000000000000000000)))

(declare-fun lt!184338 () Unit!11933)

(assert (=> b!390810 (= lt!184338 lt!184340)))

(declare-fun res!223657 () Bool)

(declare-datatypes ((SeekEntryResult!3462 0))(
  ( (MissingZero!3462 (index!16027 (_ BitVec 32))) (Found!3462 (index!16028 (_ BitVec 32))) (Intermediate!3462 (undefined!4274 Bool) (index!16029 (_ BitVec 32)) (x!38259 (_ BitVec 32))) (Undefined!3462) (MissingVacant!3462 (index!16030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23148 (_ BitVec 32)) SeekEntryResult!3462)

(assert (=> b!390810 (= res!223657 (= (seekEntryOrOpen!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3462 #b00000000000000000000000000000000)))))

(assert (=> b!390810 (=> (not res!223657) (not e!236723))))

(declare-fun b!390811 () Bool)

(assert (=> b!390811 (= e!236722 e!236724)))

(declare-fun c!54205 () Bool)

(assert (=> b!390811 (= c!54205 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27566 () Bool)

(assert (=> bm!27566 (= call!27569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73067 (not res!223658)) b!390811))

(assert (= (and b!390811 c!54205) b!390810))

(assert (= (and b!390811 (not c!54205)) b!390808))

(assert (= (and b!390810 res!223657) b!390809))

(assert (= (or b!390809 b!390808) bm!27566))

(assert (=> b!390810 m!387269))

(declare-fun m!387467 () Bool)

(assert (=> b!390810 m!387467))

(declare-fun m!387469 () Bool)

(assert (=> b!390810 m!387469))

(assert (=> b!390810 m!387269))

(declare-fun m!387471 () Bool)

(assert (=> b!390810 m!387471))

(assert (=> b!390811 m!387269))

(assert (=> b!390811 m!387269))

(assert (=> b!390811 m!387273))

(declare-fun m!387473 () Bool)

(assert (=> bm!27566 m!387473))

(assert (=> b!390537 d!73067))

(declare-fun b!390812 () Bool)

(declare-fun e!236728 () Bool)

(declare-fun e!236725 () Bool)

(assert (=> b!390812 (= e!236728 e!236725)))

(declare-fun res!223660 () Bool)

(assert (=> b!390812 (=> (not res!223660) (not e!236725))))

(declare-fun e!236727 () Bool)

(assert (=> b!390812 (= res!223660 (not e!236727))))

(declare-fun res!223659 () Bool)

(assert (=> b!390812 (=> (not res!223659) (not e!236727))))

(assert (=> b!390812 (= res!223659 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun bm!27567 () Bool)

(declare-fun call!27570 () Bool)

(declare-fun c!54206 () Bool)

(assert (=> bm!27567 (= call!27570 (arrayNoDuplicates!0 lt!184130 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54206 (Cons!6254 (select (arr!11037 lt!184130) #b00000000000000000000000000000000) Nil!6255) Nil!6255)))))

(declare-fun b!390813 () Bool)

(declare-fun e!236726 () Bool)

(assert (=> b!390813 (= e!236726 call!27570)))

(declare-fun b!390814 () Bool)

(assert (=> b!390814 (= e!236725 e!236726)))

(assert (=> b!390814 (= c!54206 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun b!390815 () Bool)

(assert (=> b!390815 (= e!236727 (contains!2434 Nil!6255 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun d!73069 () Bool)

(declare-fun res!223661 () Bool)

(assert (=> d!73069 (=> res!223661 e!236728)))

(assert (=> d!73069 (= res!223661 (bvsge #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(assert (=> d!73069 (= (arrayNoDuplicates!0 lt!184130 #b00000000000000000000000000000000 Nil!6255) e!236728)))

(declare-fun b!390816 () Bool)

(assert (=> b!390816 (= e!236726 call!27570)))

(assert (= (and d!73069 (not res!223661)) b!390812))

(assert (= (and b!390812 res!223659) b!390815))

(assert (= (and b!390812 res!223660) b!390814))

(assert (= (and b!390814 c!54206) b!390816))

(assert (= (and b!390814 (not c!54206)) b!390813))

(assert (= (or b!390816 b!390813) bm!27567))

(assert (=> b!390812 m!387285))

(assert (=> b!390812 m!387285))

(assert (=> b!390812 m!387289))

(assert (=> bm!27567 m!387285))

(declare-fun m!387475 () Bool)

(assert (=> bm!27567 m!387475))

(assert (=> b!390814 m!387285))

(assert (=> b!390814 m!387285))

(assert (=> b!390814 m!387289))

(assert (=> b!390815 m!387285))

(assert (=> b!390815 m!387285))

(declare-fun m!387477 () Bool)

(assert (=> b!390815 m!387477))

(assert (=> b!390540 d!73069))

(declare-fun d!73071 () Bool)

(declare-fun res!223663 () Bool)

(declare-fun e!236729 () Bool)

(assert (=> d!73071 (=> res!223663 e!236729)))

(assert (=> d!73071 (= res!223663 (bvsge #b00000000000000000000000000000000 (size!11389 lt!184130)))))

(assert (=> d!73071 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184130 mask!970) e!236729)))

(declare-fun b!390817 () Bool)

(declare-fun e!236731 () Bool)

(declare-fun call!27571 () Bool)

(assert (=> b!390817 (= e!236731 call!27571)))

(declare-fun b!390818 () Bool)

(declare-fun e!236730 () Bool)

(assert (=> b!390818 (= e!236730 call!27571)))

(declare-fun b!390819 () Bool)

(assert (=> b!390819 (= e!236731 e!236730)))

(declare-fun lt!184342 () (_ BitVec 64))

(assert (=> b!390819 (= lt!184342 (select (arr!11037 lt!184130) #b00000000000000000000000000000000))))

(declare-fun lt!184343 () Unit!11933)

(assert (=> b!390819 (= lt!184343 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184130 lt!184342 #b00000000000000000000000000000000))))

(assert (=> b!390819 (arrayContainsKey!0 lt!184130 lt!184342 #b00000000000000000000000000000000)))

(declare-fun lt!184341 () Unit!11933)

(assert (=> b!390819 (= lt!184341 lt!184343)))

(declare-fun res!223662 () Bool)

(assert (=> b!390819 (= res!223662 (= (seekEntryOrOpen!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000) lt!184130 mask!970) (Found!3462 #b00000000000000000000000000000000)))))

(assert (=> b!390819 (=> (not res!223662) (not e!236730))))

(declare-fun b!390820 () Bool)

(assert (=> b!390820 (= e!236729 e!236731)))

(declare-fun c!54207 () Bool)

(assert (=> b!390820 (= c!54207 (validKeyInArray!0 (select (arr!11037 lt!184130) #b00000000000000000000000000000000)))))

(declare-fun bm!27568 () Bool)

(assert (=> bm!27568 (= call!27571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184130 mask!970))))

(assert (= (and d!73071 (not res!223663)) b!390820))

(assert (= (and b!390820 c!54207) b!390819))

(assert (= (and b!390820 (not c!54207)) b!390817))

(assert (= (and b!390819 res!223662) b!390818))

(assert (= (or b!390818 b!390817) bm!27568))

(assert (=> b!390819 m!387285))

(declare-fun m!387479 () Bool)

(assert (=> b!390819 m!387479))

(declare-fun m!387481 () Bool)

(assert (=> b!390819 m!387481))

(assert (=> b!390819 m!387285))

(declare-fun m!387483 () Bool)

(assert (=> b!390819 m!387483))

(assert (=> b!390820 m!387285))

(assert (=> b!390820 m!387285))

(assert (=> b!390820 m!387289))

(declare-fun m!387485 () Bool)

(assert (=> bm!27568 m!387485))

(assert (=> b!390533 d!73071))

(declare-fun b!390827 () Bool)

(declare-fun e!236737 () Bool)

(assert (=> b!390827 (= e!236737 tp_is_empty!9631)))

(declare-fun mapNonEmpty!16035 () Bool)

(declare-fun mapRes!16035 () Bool)

(declare-fun tp!31659 () Bool)

(assert (=> mapNonEmpty!16035 (= mapRes!16035 (and tp!31659 e!236737))))

(declare-fun mapKey!16035 () (_ BitVec 32))

(declare-fun mapValue!16035 () ValueCell!4472)

(declare-fun mapRest!16035 () (Array (_ BitVec 32) ValueCell!4472))

(assert (=> mapNonEmpty!16035 (= mapRest!16026 (store mapRest!16035 mapKey!16035 mapValue!16035))))

(declare-fun condMapEmpty!16035 () Bool)

(declare-fun mapDefault!16035 () ValueCell!4472)

(assert (=> mapNonEmpty!16026 (= condMapEmpty!16035 (= mapRest!16026 ((as const (Array (_ BitVec 32) ValueCell!4472)) mapDefault!16035)))))

(declare-fun e!236736 () Bool)

(assert (=> mapNonEmpty!16026 (= tp!31644 (and e!236736 mapRes!16035))))

(declare-fun b!390828 () Bool)

(assert (=> b!390828 (= e!236736 tp_is_empty!9631)))

(declare-fun mapIsEmpty!16035 () Bool)

(assert (=> mapIsEmpty!16035 mapRes!16035))

(assert (= (and mapNonEmpty!16026 condMapEmpty!16035) mapIsEmpty!16035))

(assert (= (and mapNonEmpty!16026 (not condMapEmpty!16035)) mapNonEmpty!16035))

(assert (= (and mapNonEmpty!16035 ((_ is ValueCellFull!4472) mapValue!16035)) b!390827))

(assert (= (and mapNonEmpty!16026 ((_ is ValueCellFull!4472) mapDefault!16035)) b!390828))

(declare-fun m!387487 () Bool)

(assert (=> mapNonEmpty!16035 m!387487))

(declare-fun b_lambda!8681 () Bool)

(assert (= b_lambda!8679 (or (and start!37954 b_free!8959) b_lambda!8681)))

(declare-fun b_lambda!8683 () Bool)

(assert (= b_lambda!8673 (or (and start!37954 b_free!8959) b_lambda!8683)))

(declare-fun b_lambda!8685 () Bool)

(assert (= b_lambda!8675 (or (and start!37954 b_free!8959) b_lambda!8685)))

(declare-fun b_lambda!8687 () Bool)

(assert (= b_lambda!8677 (or (and start!37954 b_free!8959) b_lambda!8687)))

(declare-fun b_lambda!8689 () Bool)

(assert (= b_lambda!8671 (or (and start!37954 b_free!8959) b_lambda!8689)))

(declare-fun b_lambda!8691 () Bool)

(assert (= b_lambda!8669 (or (and start!37954 b_free!8959) b_lambda!8691)))

(check-sat (not d!73053) (not bm!27556) (not b!390799) (not bm!27551) (not b!390706) (not b!390759) (not bm!27563) (not b!390819) (not b!390811) (not b!390789) (not b!390820) (not b!390691) (not b!390815) b_and!16291 (not b!390642) (not bm!27550) (not bm!27566) (not bm!27549) tp_is_empty!9631 (not b!390631) (not b!390744) (not b!390797) (not b!390749) (not b!390739) (not b!390644) (not b!390777) (not b_lambda!8687) (not bm!27540) (not d!73051) (not b!390778) (not b!390798) (not b!390748) (not mapNonEmpty!16035) (not b_lambda!8691) (not b!390740) (not b!390645) (not b!390769) (not b!390695) (not b!390795) (not d!73055) (not d!73059) (not d!73047) (not b!390758) (not b!390814) (not b!390762) (not b_lambda!8681) (not b!390752) (not bm!27545) (not bm!27553) (not bm!27544) (not b!390742) (not bm!27542) (not b!390694) (not b!390775) (not d!73057) (not b!390766) (not b!390751) (not b_lambda!8689) (not bm!27525) (not d!73045) (not b!390756) (not b_lambda!8683) (not b!390704) (not b!390794) (not b!390707) (not b_next!8959) (not bm!27555) (not b_lambda!8685) (not b!390736) (not b!390692) (not bm!27568) (not b!390765) (not bm!27562) (not b!390698) (not d!73049) (not bm!27567) (not b!390746) (not b!390763) (not b!390737) (not b!390796) (not b!390810) (not b!390747) (not b!390754) (not b!390812))
(check-sat b_and!16291 (not b_next!8959))
