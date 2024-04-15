; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38034 () Bool)

(assert start!38034)

(declare-fun b_free!8995 () Bool)

(declare-fun b_next!8995 () Bool)

(assert (=> start!38034 (= b_free!8995 (not b_next!8995))))

(declare-fun tp!31758 () Bool)

(declare-fun b_and!16295 () Bool)

(assert (=> start!38034 (= tp!31758 b_and!16295)))

(declare-fun b!391524 () Bool)

(declare-fun res!224209 () Bool)

(declare-fun e!237102 () Bool)

(assert (=> b!391524 (=> (not res!224209) (not e!237102))))

(declare-datatypes ((array!23221 0))(
  ( (array!23222 (arr!11072 (Array (_ BitVec 32) (_ BitVec 64))) (size!11425 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23221)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391524 (= res!224209 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16086 () Bool)

(declare-fun mapRes!16086 () Bool)

(assert (=> mapIsEmpty!16086 mapRes!16086))

(declare-fun b!391526 () Bool)

(declare-fun res!224205 () Bool)

(assert (=> b!391526 (=> (not res!224205) (not e!237102))))

(declare-datatypes ((List!6389 0))(
  ( (Nil!6386) (Cons!6385 (h!7241 (_ BitVec 64)) (t!11544 List!6389)) )
))
(declare-fun arrayNoDuplicates!0 (array!23221 (_ BitVec 32) List!6389) Bool)

(assert (=> b!391526 (= res!224205 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6386))))

(declare-fun mapNonEmpty!16086 () Bool)

(declare-fun tp!31757 () Bool)

(declare-fun e!237108 () Bool)

(assert (=> mapNonEmpty!16086 (= mapRes!16086 (and tp!31757 e!237108))))

(declare-datatypes ((V!13995 0))(
  ( (V!13996 (val!4878 Int)) )
))
(declare-datatypes ((ValueCell!4490 0))(
  ( (ValueCellFull!4490 (v!7097 V!13995)) (EmptyCell!4490) )
))
(declare-fun mapValue!16086 () ValueCell!4490)

(declare-datatypes ((array!23223 0))(
  ( (array!23224 (arr!11073 (Array (_ BitVec 32) ValueCell!4490)) (size!11426 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23223)

(declare-fun mapRest!16086 () (Array (_ BitVec 32) ValueCell!4490))

(declare-fun mapKey!16086 () (_ BitVec 32))

(assert (=> mapNonEmpty!16086 (= (arr!11073 _values!506) (store mapRest!16086 mapKey!16086 mapValue!16086))))

(declare-fun b!391527 () Bool)

(declare-fun res!224208 () Bool)

(assert (=> b!391527 (=> (not res!224208) (not e!237102))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!391527 (= res!224208 (and (= (size!11426 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11425 _keys!658) (size!11426 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391528 () Bool)

(declare-fun e!237103 () Bool)

(declare-fun tp_is_empty!9667 () Bool)

(assert (=> b!391528 (= e!237103 tp_is_empty!9667)))

(declare-fun b!391529 () Bool)

(assert (=> b!391529 (= e!237108 tp_is_empty!9667)))

(declare-fun b!391525 () Bool)

(declare-fun res!224206 () Bool)

(assert (=> b!391525 (=> (not res!224206) (not e!237102))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391525 (= res!224206 (or (= (select (arr!11072 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11072 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!224204 () Bool)

(assert (=> start!38034 (=> (not res!224204) (not e!237102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38034 (= res!224204 (validMask!0 mask!970))))

(assert (=> start!38034 e!237102))

(declare-fun e!237106 () Bool)

(declare-fun array_inv!8130 (array!23223) Bool)

(assert (=> start!38034 (and (array_inv!8130 _values!506) e!237106)))

(assert (=> start!38034 tp!31758))

(assert (=> start!38034 true))

(assert (=> start!38034 tp_is_empty!9667))

(declare-fun array_inv!8131 (array!23221) Bool)

(assert (=> start!38034 (array_inv!8131 _keys!658)))

(declare-fun b!391530 () Bool)

(declare-fun e!237104 () Bool)

(declare-fun e!237105 () Bool)

(assert (=> b!391530 (= e!237104 (not e!237105))))

(declare-fun res!224207 () Bool)

(assert (=> b!391530 (=> res!224207 e!237105)))

(assert (=> b!391530 (= res!224207 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6546 0))(
  ( (tuple2!6547 (_1!3284 (_ BitVec 64)) (_2!3284 V!13995)) )
))
(declare-datatypes ((List!6390 0))(
  ( (Nil!6387) (Cons!6386 (h!7242 tuple2!6546) (t!11545 List!6390)) )
))
(declare-datatypes ((ListLongMap!5449 0))(
  ( (ListLongMap!5450 (toList!2740 List!6390)) )
))
(declare-fun lt!184782 () ListLongMap!5449)

(declare-fun zeroValue!472 () V!13995)

(declare-fun minValue!472 () V!13995)

(declare-fun getCurrentListMap!2061 (array!23221 array!23223 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5449)

(assert (=> b!391530 (= lt!184782 (getCurrentListMap!2061 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184776 () array!23221)

(declare-fun lt!184780 () array!23223)

(declare-fun lt!184775 () ListLongMap!5449)

(assert (=> b!391530 (= lt!184775 (getCurrentListMap!2061 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184778 () ListLongMap!5449)

(declare-fun lt!184781 () ListLongMap!5449)

(assert (=> b!391530 (and (= lt!184778 lt!184781) (= lt!184781 lt!184778))))

(declare-fun v!373 () V!13995)

(declare-fun lt!184777 () ListLongMap!5449)

(declare-fun +!1060 (ListLongMap!5449 tuple2!6546) ListLongMap!5449)

(assert (=> b!391530 (= lt!184781 (+!1060 lt!184777 (tuple2!6547 k0!778 v!373)))))

(declare-datatypes ((Unit!11968 0))(
  ( (Unit!11969) )
))
(declare-fun lt!184779 () Unit!11968)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!262 (array!23221 array!23223 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) (_ BitVec 64) V!13995 (_ BitVec 32) Int) Unit!11968)

(assert (=> b!391530 (= lt!184779 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!262 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!971 (array!23221 array!23223 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5449)

(assert (=> b!391530 (= lt!184778 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391530 (= lt!184780 (array!23224 (store (arr!11073 _values!506) i!548 (ValueCellFull!4490 v!373)) (size!11426 _values!506)))))

(assert (=> b!391530 (= lt!184777 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391531 () Bool)

(declare-fun res!224211 () Bool)

(assert (=> b!391531 (=> (not res!224211) (not e!237102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391531 (= res!224211 (validKeyInArray!0 k0!778))))

(declare-fun b!391532 () Bool)

(assert (=> b!391532 (= e!237106 (and e!237103 mapRes!16086))))

(declare-fun condMapEmpty!16086 () Bool)

(declare-fun mapDefault!16086 () ValueCell!4490)

(assert (=> b!391532 (= condMapEmpty!16086 (= (arr!11073 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4490)) mapDefault!16086)))))

(declare-fun b!391533 () Bool)

(declare-fun res!224210 () Bool)

(assert (=> b!391533 (=> (not res!224210) (not e!237102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23221 (_ BitVec 32)) Bool)

(assert (=> b!391533 (= res!224210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391534 () Bool)

(assert (=> b!391534 (= e!237102 e!237104)))

(declare-fun res!224212 () Bool)

(assert (=> b!391534 (=> (not res!224212) (not e!237104))))

(assert (=> b!391534 (= res!224212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184776 mask!970))))

(assert (=> b!391534 (= lt!184776 (array!23222 (store (arr!11072 _keys!658) i!548 k0!778) (size!11425 _keys!658)))))

(declare-fun b!391535 () Bool)

(declare-fun res!224202 () Bool)

(assert (=> b!391535 (=> (not res!224202) (not e!237104))))

(assert (=> b!391535 (= res!224202 (arrayNoDuplicates!0 lt!184776 #b00000000000000000000000000000000 Nil!6386))))

(declare-fun b!391536 () Bool)

(assert (=> b!391536 (= e!237105 (= lt!184775 (+!1060 lt!184778 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391537 () Bool)

(declare-fun res!224203 () Bool)

(assert (=> b!391537 (=> (not res!224203) (not e!237102))))

(assert (=> b!391537 (= res!224203 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _keys!658))))))

(assert (= (and start!38034 res!224204) b!391527))

(assert (= (and b!391527 res!224208) b!391533))

(assert (= (and b!391533 res!224210) b!391526))

(assert (= (and b!391526 res!224205) b!391537))

(assert (= (and b!391537 res!224203) b!391531))

(assert (= (and b!391531 res!224211) b!391525))

(assert (= (and b!391525 res!224206) b!391524))

(assert (= (and b!391524 res!224209) b!391534))

(assert (= (and b!391534 res!224212) b!391535))

(assert (= (and b!391535 res!224202) b!391530))

(assert (= (and b!391530 (not res!224207)) b!391536))

(assert (= (and b!391532 condMapEmpty!16086) mapIsEmpty!16086))

(assert (= (and b!391532 (not condMapEmpty!16086)) mapNonEmpty!16086))

(get-info :version)

(assert (= (and mapNonEmpty!16086 ((_ is ValueCellFull!4490) mapValue!16086)) b!391529))

(assert (= (and b!391532 ((_ is ValueCellFull!4490) mapDefault!16086)) b!391528))

(assert (= start!38034 b!391532))

(declare-fun m!387469 () Bool)

(assert (=> start!38034 m!387469))

(declare-fun m!387471 () Bool)

(assert (=> start!38034 m!387471))

(declare-fun m!387473 () Bool)

(assert (=> start!38034 m!387473))

(declare-fun m!387475 () Bool)

(assert (=> b!391525 m!387475))

(declare-fun m!387477 () Bool)

(assert (=> b!391535 m!387477))

(declare-fun m!387479 () Bool)

(assert (=> b!391530 m!387479))

(declare-fun m!387481 () Bool)

(assert (=> b!391530 m!387481))

(declare-fun m!387483 () Bool)

(assert (=> b!391530 m!387483))

(declare-fun m!387485 () Bool)

(assert (=> b!391530 m!387485))

(declare-fun m!387487 () Bool)

(assert (=> b!391530 m!387487))

(declare-fun m!387489 () Bool)

(assert (=> b!391530 m!387489))

(declare-fun m!387491 () Bool)

(assert (=> b!391530 m!387491))

(declare-fun m!387493 () Bool)

(assert (=> mapNonEmpty!16086 m!387493))

(declare-fun m!387495 () Bool)

(assert (=> b!391534 m!387495))

(declare-fun m!387497 () Bool)

(assert (=> b!391534 m!387497))

(declare-fun m!387499 () Bool)

(assert (=> b!391533 m!387499))

(declare-fun m!387501 () Bool)

(assert (=> b!391536 m!387501))

(declare-fun m!387503 () Bool)

(assert (=> b!391531 m!387503))

(declare-fun m!387505 () Bool)

(assert (=> b!391526 m!387505))

(declare-fun m!387507 () Bool)

(assert (=> b!391524 m!387507))

(check-sat (not start!38034) (not b!391536) b_and!16295 (not b_next!8995) (not b!391530) (not b!391533) (not b!391534) (not b!391531) (not b!391535) tp_is_empty!9667 (not mapNonEmpty!16086) (not b!391524) (not b!391526))
(check-sat b_and!16295 (not b_next!8995))
(get-model)

(declare-fun b!391646 () Bool)

(declare-fun e!237170 () ListLongMap!5449)

(declare-fun call!27608 () ListLongMap!5449)

(assert (=> b!391646 (= e!237170 call!27608)))

(declare-fun b!391647 () Bool)

(declare-fun e!237169 () Bool)

(assert (=> b!391647 (= e!237169 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391647 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391648 () Bool)

(declare-fun e!237168 () ListLongMap!5449)

(assert (=> b!391648 (= e!237168 (ListLongMap!5450 Nil!6387))))

(declare-fun d!72887 () Bool)

(declare-fun e!237166 () Bool)

(assert (=> d!72887 e!237166))

(declare-fun res!224287 () Bool)

(assert (=> d!72887 (=> (not res!224287) (not e!237166))))

(declare-fun lt!184849 () ListLongMap!5449)

(declare-fun contains!2451 (ListLongMap!5449 (_ BitVec 64)) Bool)

(assert (=> d!72887 (= res!224287 (not (contains!2451 lt!184849 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72887 (= lt!184849 e!237168)))

(declare-fun c!54219 () Bool)

(assert (=> d!72887 (= c!54219 (bvsge #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (=> d!72887 (validMask!0 mask!970)))

(assert (=> d!72887 (= (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184849)))

(declare-fun b!391649 () Bool)

(declare-fun res!224288 () Bool)

(assert (=> b!391649 (=> (not res!224288) (not e!237166))))

(assert (=> b!391649 (= res!224288 (not (contains!2451 lt!184849 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391650 () Bool)

(declare-fun e!237171 () Bool)

(declare-fun e!237167 () Bool)

(assert (=> b!391650 (= e!237171 e!237167)))

(assert (=> b!391650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun res!224289 () Bool)

(assert (=> b!391650 (= res!224289 (contains!2451 lt!184849 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391650 (=> (not res!224289) (not e!237167))))

(declare-fun b!391651 () Bool)

(declare-fun e!237165 () Bool)

(declare-fun isEmpty!554 (ListLongMap!5449) Bool)

(assert (=> b!391651 (= e!237165 (isEmpty!554 lt!184849))))

(declare-fun b!391652 () Bool)

(assert (=> b!391652 (= e!237171 e!237165)))

(declare-fun c!54220 () Bool)

(assert (=> b!391652 (= c!54220 (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun b!391653 () Bool)

(assert (=> b!391653 (= e!237168 e!237170)))

(declare-fun c!54222 () Bool)

(assert (=> b!391653 (= c!54222 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391654 () Bool)

(assert (=> b!391654 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (=> b!391654 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11426 _values!506)))))

(declare-fun apply!304 (ListLongMap!5449 (_ BitVec 64)) V!13995)

(declare-fun get!5594 (ValueCell!4490 V!13995) V!13995)

(declare-fun dynLambda!638 (Int (_ BitVec 64)) V!13995)

(assert (=> b!391654 (= e!237167 (= (apply!304 lt!184849 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)) (get!5594 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!391655 () Bool)

(assert (=> b!391655 (= e!237165 (= lt!184849 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391656 () Bool)

(declare-fun lt!184851 () Unit!11968)

(declare-fun lt!184846 () Unit!11968)

(assert (=> b!391656 (= lt!184851 lt!184846)))

(declare-fun lt!184850 () (_ BitVec 64))

(declare-fun lt!184845 () V!13995)

(declare-fun lt!184847 () (_ BitVec 64))

(declare-fun lt!184848 () ListLongMap!5449)

(assert (=> b!391656 (not (contains!2451 (+!1060 lt!184848 (tuple2!6547 lt!184850 lt!184845)) lt!184847))))

(declare-fun addStillNotContains!138 (ListLongMap!5449 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11968)

(assert (=> b!391656 (= lt!184846 (addStillNotContains!138 lt!184848 lt!184850 lt!184845 lt!184847))))

(assert (=> b!391656 (= lt!184847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391656 (= lt!184845 (get!5594 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391656 (= lt!184850 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391656 (= lt!184848 call!27608)))

(assert (=> b!391656 (= e!237170 (+!1060 call!27608 (tuple2!6547 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) (get!5594 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27605 () Bool)

(assert (=> bm!27605 (= call!27608 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391657 () Bool)

(assert (=> b!391657 (= e!237166 e!237171)))

(declare-fun c!54221 () Bool)

(assert (=> b!391657 (= c!54221 e!237169)))

(declare-fun res!224290 () Bool)

(assert (=> b!391657 (=> (not res!224290) (not e!237169))))

(assert (=> b!391657 (= res!224290 (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (= (and d!72887 c!54219) b!391648))

(assert (= (and d!72887 (not c!54219)) b!391653))

(assert (= (and b!391653 c!54222) b!391656))

(assert (= (and b!391653 (not c!54222)) b!391646))

(assert (= (or b!391656 b!391646) bm!27605))

(assert (= (and d!72887 res!224287) b!391649))

(assert (= (and b!391649 res!224288) b!391657))

(assert (= (and b!391657 res!224290) b!391647))

(assert (= (and b!391657 c!54221) b!391650))

(assert (= (and b!391657 (not c!54221)) b!391652))

(assert (= (and b!391650 res!224289) b!391654))

(assert (= (and b!391652 c!54220) b!391655))

(assert (= (and b!391652 (not c!54220)) b!391651))

(declare-fun b_lambda!8677 () Bool)

(assert (=> (not b_lambda!8677) (not b!391654)))

(declare-fun t!11551 () Bool)

(declare-fun tb!3115 () Bool)

(assert (=> (and start!38034 (= defaultEntry!514 defaultEntry!514) t!11551) tb!3115))

(declare-fun result!5741 () Bool)

(assert (=> tb!3115 (= result!5741 tp_is_empty!9667)))

(assert (=> b!391654 t!11551))

(declare-fun b_and!16301 () Bool)

(assert (= b_and!16295 (and (=> t!11551 result!5741) b_and!16301)))

(declare-fun b_lambda!8679 () Bool)

(assert (=> (not b_lambda!8679) (not b!391656)))

(assert (=> b!391656 t!11551))

(declare-fun b_and!16303 () Bool)

(assert (= b_and!16301 (and (=> t!11551 result!5741) b_and!16303)))

(declare-fun m!387589 () Bool)

(assert (=> b!391654 m!387589))

(declare-fun m!387591 () Bool)

(assert (=> b!391654 m!387591))

(assert (=> b!391654 m!387589))

(declare-fun m!387593 () Bool)

(assert (=> b!391654 m!387593))

(declare-fun m!387595 () Bool)

(assert (=> b!391654 m!387595))

(assert (=> b!391654 m!387595))

(assert (=> b!391654 m!387591))

(declare-fun m!387597 () Bool)

(assert (=> b!391654 m!387597))

(declare-fun m!387599 () Bool)

(assert (=> b!391656 m!387599))

(declare-fun m!387601 () Bool)

(assert (=> b!391656 m!387601))

(assert (=> b!391656 m!387599))

(declare-fun m!387603 () Bool)

(assert (=> b!391656 m!387603))

(assert (=> b!391656 m!387589))

(assert (=> b!391656 m!387591))

(declare-fun m!387605 () Bool)

(assert (=> b!391656 m!387605))

(assert (=> b!391656 m!387595))

(assert (=> b!391656 m!387595))

(assert (=> b!391656 m!387591))

(assert (=> b!391656 m!387597))

(assert (=> b!391650 m!387589))

(assert (=> b!391650 m!387589))

(declare-fun m!387607 () Bool)

(assert (=> b!391650 m!387607))

(assert (=> b!391647 m!387589))

(assert (=> b!391647 m!387589))

(declare-fun m!387609 () Bool)

(assert (=> b!391647 m!387609))

(declare-fun m!387611 () Bool)

(assert (=> b!391655 m!387611))

(declare-fun m!387613 () Bool)

(assert (=> b!391651 m!387613))

(declare-fun m!387615 () Bool)

(assert (=> b!391649 m!387615))

(assert (=> bm!27605 m!387611))

(assert (=> b!391653 m!387589))

(assert (=> b!391653 m!387589))

(assert (=> b!391653 m!387609))

(declare-fun m!387617 () Bool)

(assert (=> d!72887 m!387617))

(assert (=> d!72887 m!387469))

(assert (=> b!391530 d!72887))

(declare-fun b!391702 () Bool)

(declare-fun e!237207 () ListLongMap!5449)

(declare-fun call!27626 () ListLongMap!5449)

(assert (=> b!391702 (= e!237207 call!27626)))

(declare-fun b!391703 () Bool)

(declare-fun e!237206 () Bool)

(declare-fun e!237199 () Bool)

(assert (=> b!391703 (= e!237206 e!237199)))

(declare-fun c!54237 () Bool)

(assert (=> b!391703 (= c!54237 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391704 () Bool)

(declare-fun e!237205 () ListLongMap!5449)

(assert (=> b!391704 (= e!237205 call!27626)))

(declare-fun d!72889 () Bool)

(assert (=> d!72889 e!237206))

(declare-fun res!224309 () Bool)

(assert (=> d!72889 (=> (not res!224309) (not e!237206))))

(assert (=> d!72889 (= res!224309 (or (bvsge #b00000000000000000000000000000000 (size!11425 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))))

(declare-fun lt!184916 () ListLongMap!5449)

(declare-fun lt!184909 () ListLongMap!5449)

(assert (=> d!72889 (= lt!184916 lt!184909)))

(declare-fun lt!184902 () Unit!11968)

(declare-fun e!237210 () Unit!11968)

(assert (=> d!72889 (= lt!184902 e!237210)))

(declare-fun c!54239 () Bool)

(declare-fun e!237202 () Bool)

(assert (=> d!72889 (= c!54239 e!237202)))

(declare-fun res!224310 () Bool)

(assert (=> d!72889 (=> (not res!224310) (not e!237202))))

(assert (=> d!72889 (= res!224310 (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun e!237203 () ListLongMap!5449)

(assert (=> d!72889 (= lt!184909 e!237203)))

(declare-fun c!54235 () Bool)

(assert (=> d!72889 (= c!54235 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72889 (validMask!0 mask!970)))

(assert (=> d!72889 (= (getCurrentListMap!2061 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184916)))

(declare-fun b!391705 () Bool)

(declare-fun lt!184899 () Unit!11968)

(assert (=> b!391705 (= e!237210 lt!184899)))

(declare-fun lt!184898 () ListLongMap!5449)

(assert (=> b!391705 (= lt!184898 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184907 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184914 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184914 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184917 () Unit!11968)

(declare-fun addStillContains!280 (ListLongMap!5449 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11968)

(assert (=> b!391705 (= lt!184917 (addStillContains!280 lt!184898 lt!184907 zeroValue!472 lt!184914))))

(assert (=> b!391705 (contains!2451 (+!1060 lt!184898 (tuple2!6547 lt!184907 zeroValue!472)) lt!184914)))

(declare-fun lt!184905 () Unit!11968)

(assert (=> b!391705 (= lt!184905 lt!184917)))

(declare-fun lt!184913 () ListLongMap!5449)

(assert (=> b!391705 (= lt!184913 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184900 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184900 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184908 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184908 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184911 () Unit!11968)

(declare-fun addApplyDifferent!280 (ListLongMap!5449 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11968)

(assert (=> b!391705 (= lt!184911 (addApplyDifferent!280 lt!184913 lt!184900 minValue!472 lt!184908))))

(assert (=> b!391705 (= (apply!304 (+!1060 lt!184913 (tuple2!6547 lt!184900 minValue!472)) lt!184908) (apply!304 lt!184913 lt!184908))))

(declare-fun lt!184903 () Unit!11968)

(assert (=> b!391705 (= lt!184903 lt!184911)))

(declare-fun lt!184901 () ListLongMap!5449)

(assert (=> b!391705 (= lt!184901 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184904 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184906 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184906 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184897 () Unit!11968)

(assert (=> b!391705 (= lt!184897 (addApplyDifferent!280 lt!184901 lt!184904 zeroValue!472 lt!184906))))

(assert (=> b!391705 (= (apply!304 (+!1060 lt!184901 (tuple2!6547 lt!184904 zeroValue!472)) lt!184906) (apply!304 lt!184901 lt!184906))))

(declare-fun lt!184912 () Unit!11968)

(assert (=> b!391705 (= lt!184912 lt!184897)))

(declare-fun lt!184896 () ListLongMap!5449)

(assert (=> b!391705 (= lt!184896 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184915 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184910 () (_ BitVec 64))

(assert (=> b!391705 (= lt!184910 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391705 (= lt!184899 (addApplyDifferent!280 lt!184896 lt!184915 minValue!472 lt!184910))))

(assert (=> b!391705 (= (apply!304 (+!1060 lt!184896 (tuple2!6547 lt!184915 minValue!472)) lt!184910) (apply!304 lt!184896 lt!184910))))

(declare-fun b!391706 () Bool)

(declare-fun call!27629 () Bool)

(assert (=> b!391706 (= e!237199 (not call!27629))))

(declare-fun bm!27620 () Bool)

(assert (=> bm!27620 (= call!27629 (contains!2451 lt!184916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!27627 () ListLongMap!5449)

(declare-fun bm!27621 () Bool)

(assert (=> bm!27621 (= call!27627 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391707 () Bool)

(declare-fun c!54240 () Bool)

(assert (=> b!391707 (= c!54240 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391707 (= e!237205 e!237207)))

(declare-fun b!391708 () Bool)

(declare-fun e!237198 () Bool)

(assert (=> b!391708 (= e!237198 (= (apply!304 lt!184916 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391709 () Bool)

(declare-fun e!237204 () Bool)

(assert (=> b!391709 (= e!237204 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391710 () Bool)

(declare-fun e!237208 () Bool)

(assert (=> b!391710 (= e!237208 e!237198)))

(declare-fun res!224315 () Bool)

(declare-fun call!27624 () Bool)

(assert (=> b!391710 (= res!224315 call!27624)))

(assert (=> b!391710 (=> (not res!224315) (not e!237198))))

(declare-fun b!391711 () Bool)

(declare-fun res!224312 () Bool)

(assert (=> b!391711 (=> (not res!224312) (not e!237206))))

(assert (=> b!391711 (= res!224312 e!237208)))

(declare-fun c!54238 () Bool)

(assert (=> b!391711 (= c!54238 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391712 () Bool)

(declare-fun call!27623 () ListLongMap!5449)

(assert (=> b!391712 (= e!237207 call!27623)))

(declare-fun bm!27622 () Bool)

(declare-fun call!27628 () ListLongMap!5449)

(assert (=> bm!27622 (= call!27626 call!27628)))

(declare-fun bm!27623 () Bool)

(declare-fun call!27625 () ListLongMap!5449)

(assert (=> bm!27623 (= call!27623 call!27625)))

(declare-fun b!391713 () Bool)

(declare-fun Unit!11974 () Unit!11968)

(assert (=> b!391713 (= e!237210 Unit!11974)))

(declare-fun bm!27624 () Bool)

(assert (=> bm!27624 (= call!27625 call!27627)))

(declare-fun bm!27625 () Bool)

(declare-fun c!54236 () Bool)

(assert (=> bm!27625 (= call!27628 (+!1060 (ite c!54235 call!27627 (ite c!54236 call!27625 call!27623)) (ite (or c!54235 c!54236) (tuple2!6547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391714 () Bool)

(declare-fun res!224313 () Bool)

(assert (=> b!391714 (=> (not res!224313) (not e!237206))))

(declare-fun e!237201 () Bool)

(assert (=> b!391714 (= res!224313 e!237201)))

(declare-fun res!224311 () Bool)

(assert (=> b!391714 (=> res!224311 e!237201)))

(assert (=> b!391714 (= res!224311 (not e!237204))))

(declare-fun res!224317 () Bool)

(assert (=> b!391714 (=> (not res!224317) (not e!237204))))

(assert (=> b!391714 (= res!224317 (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun b!391715 () Bool)

(assert (=> b!391715 (= e!237203 (+!1060 call!27628 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391716 () Bool)

(assert (=> b!391716 (= e!237208 (not call!27624))))

(declare-fun b!391717 () Bool)

(declare-fun e!237200 () Bool)

(assert (=> b!391717 (= e!237200 (= (apply!304 lt!184916 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)) (get!5594 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11426 _values!506)))))

(assert (=> b!391717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun b!391718 () Bool)

(declare-fun e!237209 () Bool)

(assert (=> b!391718 (= e!237209 (= (apply!304 lt!184916 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!391719 () Bool)

(assert (=> b!391719 (= e!237202 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391720 () Bool)

(assert (=> b!391720 (= e!237203 e!237205)))

(assert (=> b!391720 (= c!54236 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391721 () Bool)

(assert (=> b!391721 (= e!237201 e!237200)))

(declare-fun res!224314 () Bool)

(assert (=> b!391721 (=> (not res!224314) (not e!237200))))

(assert (=> b!391721 (= res!224314 (contains!2451 lt!184916 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(declare-fun b!391722 () Bool)

(assert (=> b!391722 (= e!237199 e!237209)))

(declare-fun res!224316 () Bool)

(assert (=> b!391722 (= res!224316 call!27629)))

(assert (=> b!391722 (=> (not res!224316) (not e!237209))))

(declare-fun bm!27626 () Bool)

(assert (=> bm!27626 (= call!27624 (contains!2451 lt!184916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72889 c!54235) b!391715))

(assert (= (and d!72889 (not c!54235)) b!391720))

(assert (= (and b!391720 c!54236) b!391704))

(assert (= (and b!391720 (not c!54236)) b!391707))

(assert (= (and b!391707 c!54240) b!391702))

(assert (= (and b!391707 (not c!54240)) b!391712))

(assert (= (or b!391702 b!391712) bm!27623))

(assert (= (or b!391704 bm!27623) bm!27624))

(assert (= (or b!391704 b!391702) bm!27622))

(assert (= (or b!391715 bm!27624) bm!27621))

(assert (= (or b!391715 bm!27622) bm!27625))

(assert (= (and d!72889 res!224310) b!391719))

(assert (= (and d!72889 c!54239) b!391705))

(assert (= (and d!72889 (not c!54239)) b!391713))

(assert (= (and d!72889 res!224309) b!391714))

(assert (= (and b!391714 res!224317) b!391709))

(assert (= (and b!391714 (not res!224311)) b!391721))

(assert (= (and b!391721 res!224314) b!391717))

(assert (= (and b!391714 res!224313) b!391711))

(assert (= (and b!391711 c!54238) b!391710))

(assert (= (and b!391711 (not c!54238)) b!391716))

(assert (= (and b!391710 res!224315) b!391708))

(assert (= (or b!391710 b!391716) bm!27626))

(assert (= (and b!391711 res!224312) b!391703))

(assert (= (and b!391703 c!54237) b!391722))

(assert (= (and b!391703 (not c!54237)) b!391706))

(assert (= (and b!391722 res!224316) b!391718))

(assert (= (or b!391722 b!391706) bm!27620))

(declare-fun b_lambda!8681 () Bool)

(assert (=> (not b_lambda!8681) (not b!391717)))

(assert (=> b!391717 t!11551))

(declare-fun b_and!16305 () Bool)

(assert (= b_and!16303 (and (=> t!11551 result!5741) b_and!16305)))

(declare-fun m!387619 () Bool)

(assert (=> bm!27626 m!387619))

(declare-fun m!387621 () Bool)

(assert (=> b!391708 m!387621))

(declare-fun m!387623 () Bool)

(assert (=> bm!27620 m!387623))

(declare-fun m!387625 () Bool)

(assert (=> b!391718 m!387625))

(assert (=> b!391709 m!387589))

(assert (=> b!391709 m!387589))

(assert (=> b!391709 m!387609))

(assert (=> b!391717 m!387589))

(declare-fun m!387627 () Bool)

(assert (=> b!391717 m!387627))

(assert (=> b!391717 m!387595))

(assert (=> b!391717 m!387591))

(assert (=> b!391717 m!387597))

(assert (=> b!391717 m!387595))

(assert (=> b!391717 m!387589))

(assert (=> b!391717 m!387591))

(declare-fun m!387629 () Bool)

(assert (=> b!391705 m!387629))

(declare-fun m!387631 () Bool)

(assert (=> b!391705 m!387631))

(declare-fun m!387633 () Bool)

(assert (=> b!391705 m!387633))

(declare-fun m!387635 () Bool)

(assert (=> b!391705 m!387635))

(assert (=> b!391705 m!387633))

(declare-fun m!387637 () Bool)

(assert (=> b!391705 m!387637))

(declare-fun m!387639 () Bool)

(assert (=> b!391705 m!387639))

(declare-fun m!387641 () Bool)

(assert (=> b!391705 m!387641))

(declare-fun m!387643 () Bool)

(assert (=> b!391705 m!387643))

(declare-fun m!387645 () Bool)

(assert (=> b!391705 m!387645))

(declare-fun m!387647 () Bool)

(assert (=> b!391705 m!387647))

(declare-fun m!387649 () Bool)

(assert (=> b!391705 m!387649))

(declare-fun m!387651 () Bool)

(assert (=> b!391705 m!387651))

(assert (=> b!391705 m!387641))

(assert (=> b!391705 m!387481))

(declare-fun m!387653 () Bool)

(assert (=> b!391705 m!387653))

(assert (=> b!391705 m!387647))

(declare-fun m!387655 () Bool)

(assert (=> b!391705 m!387655))

(assert (=> b!391705 m!387589))

(assert (=> b!391705 m!387637))

(declare-fun m!387657 () Bool)

(assert (=> b!391705 m!387657))

(assert (=> b!391721 m!387589))

(assert (=> b!391721 m!387589))

(declare-fun m!387659 () Bool)

(assert (=> b!391721 m!387659))

(declare-fun m!387661 () Bool)

(assert (=> b!391715 m!387661))

(declare-fun m!387663 () Bool)

(assert (=> bm!27625 m!387663))

(assert (=> bm!27621 m!387481))

(assert (=> b!391719 m!387589))

(assert (=> b!391719 m!387589))

(assert (=> b!391719 m!387609))

(assert (=> d!72889 m!387469))

(assert (=> b!391530 d!72889))

(declare-fun d!72891 () Bool)

(declare-fun e!237213 () Bool)

(assert (=> d!72891 e!237213))

(declare-fun res!224323 () Bool)

(assert (=> d!72891 (=> (not res!224323) (not e!237213))))

(declare-fun lt!184927 () ListLongMap!5449)

(assert (=> d!72891 (= res!224323 (contains!2451 lt!184927 (_1!3284 (tuple2!6547 k0!778 v!373))))))

(declare-fun lt!184928 () List!6390)

(assert (=> d!72891 (= lt!184927 (ListLongMap!5450 lt!184928))))

(declare-fun lt!184926 () Unit!11968)

(declare-fun lt!184929 () Unit!11968)

(assert (=> d!72891 (= lt!184926 lt!184929)))

(declare-datatypes ((Option!366 0))(
  ( (Some!365 (v!7103 V!13995)) (None!364) )
))
(declare-fun getValueByKey!360 (List!6390 (_ BitVec 64)) Option!366)

(assert (=> d!72891 (= (getValueByKey!360 lt!184928 (_1!3284 (tuple2!6547 k0!778 v!373))) (Some!365 (_2!3284 (tuple2!6547 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!185 (List!6390 (_ BitVec 64) V!13995) Unit!11968)

(assert (=> d!72891 (= lt!184929 (lemmaContainsTupThenGetReturnValue!185 lt!184928 (_1!3284 (tuple2!6547 k0!778 v!373)) (_2!3284 (tuple2!6547 k0!778 v!373))))))

(declare-fun insertStrictlySorted!188 (List!6390 (_ BitVec 64) V!13995) List!6390)

(assert (=> d!72891 (= lt!184928 (insertStrictlySorted!188 (toList!2740 lt!184777) (_1!3284 (tuple2!6547 k0!778 v!373)) (_2!3284 (tuple2!6547 k0!778 v!373))))))

(assert (=> d!72891 (= (+!1060 lt!184777 (tuple2!6547 k0!778 v!373)) lt!184927)))

(declare-fun b!391727 () Bool)

(declare-fun res!224322 () Bool)

(assert (=> b!391727 (=> (not res!224322) (not e!237213))))

(assert (=> b!391727 (= res!224322 (= (getValueByKey!360 (toList!2740 lt!184927) (_1!3284 (tuple2!6547 k0!778 v!373))) (Some!365 (_2!3284 (tuple2!6547 k0!778 v!373)))))))

(declare-fun b!391728 () Bool)

(declare-fun contains!2452 (List!6390 tuple2!6546) Bool)

(assert (=> b!391728 (= e!237213 (contains!2452 (toList!2740 lt!184927) (tuple2!6547 k0!778 v!373)))))

(assert (= (and d!72891 res!224323) b!391727))

(assert (= (and b!391727 res!224322) b!391728))

(declare-fun m!387665 () Bool)

(assert (=> d!72891 m!387665))

(declare-fun m!387667 () Bool)

(assert (=> d!72891 m!387667))

(declare-fun m!387669 () Bool)

(assert (=> d!72891 m!387669))

(declare-fun m!387671 () Bool)

(assert (=> d!72891 m!387671))

(declare-fun m!387673 () Bool)

(assert (=> b!391727 m!387673))

(declare-fun m!387675 () Bool)

(assert (=> b!391728 m!387675))

(assert (=> b!391530 d!72891))

(declare-fun b!391729 () Bool)

(declare-fun e!237223 () ListLongMap!5449)

(declare-fun call!27633 () ListLongMap!5449)

(assert (=> b!391729 (= e!237223 call!27633)))

(declare-fun b!391730 () Bool)

(declare-fun e!237222 () Bool)

(declare-fun e!237215 () Bool)

(assert (=> b!391730 (= e!237222 e!237215)))

(declare-fun c!54243 () Bool)

(assert (=> b!391730 (= c!54243 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391731 () Bool)

(declare-fun e!237221 () ListLongMap!5449)

(assert (=> b!391731 (= e!237221 call!27633)))

(declare-fun d!72893 () Bool)

(assert (=> d!72893 e!237222))

(declare-fun res!224324 () Bool)

(assert (=> d!72893 (=> (not res!224324) (not e!237222))))

(assert (=> d!72893 (= res!224324 (or (bvsge #b00000000000000000000000000000000 (size!11425 lt!184776)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))))

(declare-fun lt!184950 () ListLongMap!5449)

(declare-fun lt!184943 () ListLongMap!5449)

(assert (=> d!72893 (= lt!184950 lt!184943)))

(declare-fun lt!184936 () Unit!11968)

(declare-fun e!237226 () Unit!11968)

(assert (=> d!72893 (= lt!184936 e!237226)))

(declare-fun c!54245 () Bool)

(declare-fun e!237218 () Bool)

(assert (=> d!72893 (= c!54245 e!237218)))

(declare-fun res!224325 () Bool)

(assert (=> d!72893 (=> (not res!224325) (not e!237218))))

(assert (=> d!72893 (= res!224325 (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun e!237219 () ListLongMap!5449)

(assert (=> d!72893 (= lt!184943 e!237219)))

(declare-fun c!54241 () Bool)

(assert (=> d!72893 (= c!54241 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72893 (validMask!0 mask!970)))

(assert (=> d!72893 (= (getCurrentListMap!2061 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184950)))

(declare-fun b!391732 () Bool)

(declare-fun lt!184933 () Unit!11968)

(assert (=> b!391732 (= e!237226 lt!184933)))

(declare-fun lt!184932 () ListLongMap!5449)

(assert (=> b!391732 (= lt!184932 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184941 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184948 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184948 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(declare-fun lt!184951 () Unit!11968)

(assert (=> b!391732 (= lt!184951 (addStillContains!280 lt!184932 lt!184941 zeroValue!472 lt!184948))))

(assert (=> b!391732 (contains!2451 (+!1060 lt!184932 (tuple2!6547 lt!184941 zeroValue!472)) lt!184948)))

(declare-fun lt!184939 () Unit!11968)

(assert (=> b!391732 (= lt!184939 lt!184951)))

(declare-fun lt!184947 () ListLongMap!5449)

(assert (=> b!391732 (= lt!184947 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184934 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184934 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184942 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184942 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(declare-fun lt!184945 () Unit!11968)

(assert (=> b!391732 (= lt!184945 (addApplyDifferent!280 lt!184947 lt!184934 minValue!472 lt!184942))))

(assert (=> b!391732 (= (apply!304 (+!1060 lt!184947 (tuple2!6547 lt!184934 minValue!472)) lt!184942) (apply!304 lt!184947 lt!184942))))

(declare-fun lt!184937 () Unit!11968)

(assert (=> b!391732 (= lt!184937 lt!184945)))

(declare-fun lt!184935 () ListLongMap!5449)

(assert (=> b!391732 (= lt!184935 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184938 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184940 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184940 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(declare-fun lt!184931 () Unit!11968)

(assert (=> b!391732 (= lt!184931 (addApplyDifferent!280 lt!184935 lt!184938 zeroValue!472 lt!184940))))

(assert (=> b!391732 (= (apply!304 (+!1060 lt!184935 (tuple2!6547 lt!184938 zeroValue!472)) lt!184940) (apply!304 lt!184935 lt!184940))))

(declare-fun lt!184946 () Unit!11968)

(assert (=> b!391732 (= lt!184946 lt!184931)))

(declare-fun lt!184930 () ListLongMap!5449)

(assert (=> b!391732 (= lt!184930 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184949 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184949 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184944 () (_ BitVec 64))

(assert (=> b!391732 (= lt!184944 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(assert (=> b!391732 (= lt!184933 (addApplyDifferent!280 lt!184930 lt!184949 minValue!472 lt!184944))))

(assert (=> b!391732 (= (apply!304 (+!1060 lt!184930 (tuple2!6547 lt!184949 minValue!472)) lt!184944) (apply!304 lt!184930 lt!184944))))

(declare-fun b!391733 () Bool)

(declare-fun call!27636 () Bool)

(assert (=> b!391733 (= e!237215 (not call!27636))))

(declare-fun bm!27627 () Bool)

(assert (=> bm!27627 (= call!27636 (contains!2451 lt!184950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!27634 () ListLongMap!5449)

(declare-fun bm!27628 () Bool)

(assert (=> bm!27628 (= call!27634 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391734 () Bool)

(declare-fun c!54246 () Bool)

(assert (=> b!391734 (= c!54246 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391734 (= e!237221 e!237223)))

(declare-fun b!391735 () Bool)

(declare-fun e!237214 () Bool)

(assert (=> b!391735 (= e!237214 (= (apply!304 lt!184950 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391736 () Bool)

(declare-fun e!237220 () Bool)

(assert (=> b!391736 (= e!237220 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun b!391737 () Bool)

(declare-fun e!237224 () Bool)

(assert (=> b!391737 (= e!237224 e!237214)))

(declare-fun res!224330 () Bool)

(declare-fun call!27631 () Bool)

(assert (=> b!391737 (= res!224330 call!27631)))

(assert (=> b!391737 (=> (not res!224330) (not e!237214))))

(declare-fun b!391738 () Bool)

(declare-fun res!224327 () Bool)

(assert (=> b!391738 (=> (not res!224327) (not e!237222))))

(assert (=> b!391738 (= res!224327 e!237224)))

(declare-fun c!54244 () Bool)

(assert (=> b!391738 (= c!54244 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391739 () Bool)

(declare-fun call!27630 () ListLongMap!5449)

(assert (=> b!391739 (= e!237223 call!27630)))

(declare-fun bm!27629 () Bool)

(declare-fun call!27635 () ListLongMap!5449)

(assert (=> bm!27629 (= call!27633 call!27635)))

(declare-fun bm!27630 () Bool)

(declare-fun call!27632 () ListLongMap!5449)

(assert (=> bm!27630 (= call!27630 call!27632)))

(declare-fun b!391740 () Bool)

(declare-fun Unit!11975 () Unit!11968)

(assert (=> b!391740 (= e!237226 Unit!11975)))

(declare-fun bm!27631 () Bool)

(assert (=> bm!27631 (= call!27632 call!27634)))

(declare-fun c!54242 () Bool)

(declare-fun bm!27632 () Bool)

(assert (=> bm!27632 (= call!27635 (+!1060 (ite c!54241 call!27634 (ite c!54242 call!27632 call!27630)) (ite (or c!54241 c!54242) (tuple2!6547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391741 () Bool)

(declare-fun res!224328 () Bool)

(assert (=> b!391741 (=> (not res!224328) (not e!237222))))

(declare-fun e!237217 () Bool)

(assert (=> b!391741 (= res!224328 e!237217)))

(declare-fun res!224326 () Bool)

(assert (=> b!391741 (=> res!224326 e!237217)))

(assert (=> b!391741 (= res!224326 (not e!237220))))

(declare-fun res!224332 () Bool)

(assert (=> b!391741 (=> (not res!224332) (not e!237220))))

(assert (=> b!391741 (= res!224332 (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun b!391742 () Bool)

(assert (=> b!391742 (= e!237219 (+!1060 call!27635 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391743 () Bool)

(assert (=> b!391743 (= e!237224 (not call!27631))))

(declare-fun b!391744 () Bool)

(declare-fun e!237216 () Bool)

(assert (=> b!391744 (= e!237216 (= (apply!304 lt!184950 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)) (get!5594 (select (arr!11073 lt!184780) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11426 lt!184780)))))

(assert (=> b!391744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun b!391745 () Bool)

(declare-fun e!237225 () Bool)

(assert (=> b!391745 (= e!237225 (= (apply!304 lt!184950 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!391746 () Bool)

(assert (=> b!391746 (= e!237218 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun b!391747 () Bool)

(assert (=> b!391747 (= e!237219 e!237221)))

(assert (=> b!391747 (= c!54242 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391748 () Bool)

(assert (=> b!391748 (= e!237217 e!237216)))

(declare-fun res!224329 () Bool)

(assert (=> b!391748 (=> (not res!224329) (not e!237216))))

(assert (=> b!391748 (= res!224329 (contains!2451 lt!184950 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(assert (=> b!391748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun b!391749 () Bool)

(assert (=> b!391749 (= e!237215 e!237225)))

(declare-fun res!224331 () Bool)

(assert (=> b!391749 (= res!224331 call!27636)))

(assert (=> b!391749 (=> (not res!224331) (not e!237225))))

(declare-fun bm!27633 () Bool)

(assert (=> bm!27633 (= call!27631 (contains!2451 lt!184950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72893 c!54241) b!391742))

(assert (= (and d!72893 (not c!54241)) b!391747))

(assert (= (and b!391747 c!54242) b!391731))

(assert (= (and b!391747 (not c!54242)) b!391734))

(assert (= (and b!391734 c!54246) b!391729))

(assert (= (and b!391734 (not c!54246)) b!391739))

(assert (= (or b!391729 b!391739) bm!27630))

(assert (= (or b!391731 bm!27630) bm!27631))

(assert (= (or b!391731 b!391729) bm!27629))

(assert (= (or b!391742 bm!27631) bm!27628))

(assert (= (or b!391742 bm!27629) bm!27632))

(assert (= (and d!72893 res!224325) b!391746))

(assert (= (and d!72893 c!54245) b!391732))

(assert (= (and d!72893 (not c!54245)) b!391740))

(assert (= (and d!72893 res!224324) b!391741))

(assert (= (and b!391741 res!224332) b!391736))

(assert (= (and b!391741 (not res!224326)) b!391748))

(assert (= (and b!391748 res!224329) b!391744))

(assert (= (and b!391741 res!224328) b!391738))

(assert (= (and b!391738 c!54244) b!391737))

(assert (= (and b!391738 (not c!54244)) b!391743))

(assert (= (and b!391737 res!224330) b!391735))

(assert (= (or b!391737 b!391743) bm!27633))

(assert (= (and b!391738 res!224327) b!391730))

(assert (= (and b!391730 c!54243) b!391749))

(assert (= (and b!391730 (not c!54243)) b!391733))

(assert (= (and b!391749 res!224331) b!391745))

(assert (= (or b!391749 b!391733) bm!27627))

(declare-fun b_lambda!8683 () Bool)

(assert (=> (not b_lambda!8683) (not b!391744)))

(assert (=> b!391744 t!11551))

(declare-fun b_and!16307 () Bool)

(assert (= b_and!16305 (and (=> t!11551 result!5741) b_and!16307)))

(declare-fun m!387677 () Bool)

(assert (=> bm!27633 m!387677))

(declare-fun m!387679 () Bool)

(assert (=> b!391735 m!387679))

(declare-fun m!387681 () Bool)

(assert (=> bm!27627 m!387681))

(declare-fun m!387683 () Bool)

(assert (=> b!391745 m!387683))

(declare-fun m!387685 () Bool)

(assert (=> b!391736 m!387685))

(assert (=> b!391736 m!387685))

(declare-fun m!387687 () Bool)

(assert (=> b!391736 m!387687))

(assert (=> b!391744 m!387685))

(declare-fun m!387689 () Bool)

(assert (=> b!391744 m!387689))

(declare-fun m!387691 () Bool)

(assert (=> b!391744 m!387691))

(assert (=> b!391744 m!387591))

(declare-fun m!387693 () Bool)

(assert (=> b!391744 m!387693))

(assert (=> b!391744 m!387691))

(assert (=> b!391744 m!387685))

(assert (=> b!391744 m!387591))

(declare-fun m!387695 () Bool)

(assert (=> b!391732 m!387695))

(declare-fun m!387697 () Bool)

(assert (=> b!391732 m!387697))

(declare-fun m!387699 () Bool)

(assert (=> b!391732 m!387699))

(declare-fun m!387701 () Bool)

(assert (=> b!391732 m!387701))

(assert (=> b!391732 m!387699))

(declare-fun m!387703 () Bool)

(assert (=> b!391732 m!387703))

(declare-fun m!387705 () Bool)

(assert (=> b!391732 m!387705))

(declare-fun m!387707 () Bool)

(assert (=> b!391732 m!387707))

(declare-fun m!387709 () Bool)

(assert (=> b!391732 m!387709))

(declare-fun m!387711 () Bool)

(assert (=> b!391732 m!387711))

(declare-fun m!387713 () Bool)

(assert (=> b!391732 m!387713))

(declare-fun m!387715 () Bool)

(assert (=> b!391732 m!387715))

(declare-fun m!387717 () Bool)

(assert (=> b!391732 m!387717))

(assert (=> b!391732 m!387707))

(assert (=> b!391732 m!387491))

(declare-fun m!387719 () Bool)

(assert (=> b!391732 m!387719))

(assert (=> b!391732 m!387713))

(declare-fun m!387721 () Bool)

(assert (=> b!391732 m!387721))

(assert (=> b!391732 m!387685))

(assert (=> b!391732 m!387703))

(declare-fun m!387723 () Bool)

(assert (=> b!391732 m!387723))

(assert (=> b!391748 m!387685))

(assert (=> b!391748 m!387685))

(declare-fun m!387725 () Bool)

(assert (=> b!391748 m!387725))

(declare-fun m!387727 () Bool)

(assert (=> b!391742 m!387727))

(declare-fun m!387729 () Bool)

(assert (=> bm!27632 m!387729))

(assert (=> bm!27628 m!387491))

(assert (=> b!391746 m!387685))

(assert (=> b!391746 m!387685))

(assert (=> b!391746 m!387687))

(assert (=> d!72893 m!387469))

(assert (=> b!391530 d!72893))

(declare-fun bm!27638 () Bool)

(declare-fun call!27642 () ListLongMap!5449)

(assert (=> bm!27638 (= call!27642 (getCurrentListMapNoExtraKeys!971 (array!23222 (store (arr!11072 _keys!658) i!548 k0!778) (size!11425 _keys!658)) (array!23224 (store (arr!11073 _values!506) i!548 (ValueCellFull!4490 v!373)) (size!11426 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391756 () Bool)

(declare-fun e!237232 () Bool)

(declare-fun e!237231 () Bool)

(assert (=> b!391756 (= e!237232 e!237231)))

(declare-fun c!54249 () Bool)

(assert (=> b!391756 (= c!54249 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun call!27641 () ListLongMap!5449)

(declare-fun b!391757 () Bool)

(assert (=> b!391757 (= e!237231 (= call!27642 (+!1060 call!27641 (tuple2!6547 k0!778 v!373))))))

(declare-fun d!72895 () Bool)

(assert (=> d!72895 e!237232))

(declare-fun res!224335 () Bool)

(assert (=> d!72895 (=> (not res!224335) (not e!237232))))

(assert (=> d!72895 (= res!224335 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11426 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11426 _values!506))))))))

(declare-fun lt!184954 () Unit!11968)

(declare-fun choose!1326 (array!23221 array!23223 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) (_ BitVec 64) V!13995 (_ BitVec 32) Int) Unit!11968)

(assert (=> d!72895 (= lt!184954 (choose!1326 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (=> d!72895 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!262 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184954)))

(declare-fun b!391758 () Bool)

(assert (=> b!391758 (= e!237231 (= call!27642 call!27641))))

(declare-fun bm!27639 () Bool)

(assert (=> bm!27639 (= call!27641 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72895 res!224335) b!391756))

(assert (= (and b!391756 c!54249) b!391757))

(assert (= (and b!391756 (not c!54249)) b!391758))

(assert (= (or b!391757 b!391758) bm!27639))

(assert (= (or b!391757 b!391758) bm!27638))

(assert (=> bm!27638 m!387497))

(assert (=> bm!27638 m!387487))

(declare-fun m!387731 () Bool)

(assert (=> bm!27638 m!387731))

(declare-fun m!387733 () Bool)

(assert (=> b!391757 m!387733))

(declare-fun m!387735 () Bool)

(assert (=> d!72895 m!387735))

(assert (=> bm!27639 m!387481))

(assert (=> b!391530 d!72895))

(declare-fun b!391759 () Bool)

(declare-fun e!237238 () ListLongMap!5449)

(declare-fun call!27643 () ListLongMap!5449)

(assert (=> b!391759 (= e!237238 call!27643)))

(declare-fun b!391760 () Bool)

(declare-fun e!237237 () Bool)

(assert (=> b!391760 (= e!237237 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(assert (=> b!391760 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391761 () Bool)

(declare-fun e!237236 () ListLongMap!5449)

(assert (=> b!391761 (= e!237236 (ListLongMap!5450 Nil!6387))))

(declare-fun d!72897 () Bool)

(declare-fun e!237234 () Bool)

(assert (=> d!72897 e!237234))

(declare-fun res!224336 () Bool)

(assert (=> d!72897 (=> (not res!224336) (not e!237234))))

(declare-fun lt!184959 () ListLongMap!5449)

(assert (=> d!72897 (= res!224336 (not (contains!2451 lt!184959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72897 (= lt!184959 e!237236)))

(declare-fun c!54250 () Bool)

(assert (=> d!72897 (= c!54250 (bvsge #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(assert (=> d!72897 (validMask!0 mask!970)))

(assert (=> d!72897 (= (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184959)))

(declare-fun b!391762 () Bool)

(declare-fun res!224337 () Bool)

(assert (=> b!391762 (=> (not res!224337) (not e!237234))))

(assert (=> b!391762 (= res!224337 (not (contains!2451 lt!184959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391763 () Bool)

(declare-fun e!237239 () Bool)

(declare-fun e!237235 () Bool)

(assert (=> b!391763 (= e!237239 e!237235)))

(assert (=> b!391763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun res!224338 () Bool)

(assert (=> b!391763 (= res!224338 (contains!2451 lt!184959 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(assert (=> b!391763 (=> (not res!224338) (not e!237235))))

(declare-fun b!391764 () Bool)

(declare-fun e!237233 () Bool)

(assert (=> b!391764 (= e!237233 (isEmpty!554 lt!184959))))

(declare-fun b!391765 () Bool)

(assert (=> b!391765 (= e!237239 e!237233)))

(declare-fun c!54251 () Bool)

(assert (=> b!391765 (= c!54251 (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(declare-fun b!391766 () Bool)

(assert (=> b!391766 (= e!237236 e!237238)))

(declare-fun c!54253 () Bool)

(assert (=> b!391766 (= c!54253 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun b!391767 () Bool)

(assert (=> b!391767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(assert (=> b!391767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11426 lt!184780)))))

(assert (=> b!391767 (= e!237235 (= (apply!304 lt!184959 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)) (get!5594 (select (arr!11073 lt!184780) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!391768 () Bool)

(assert (=> b!391768 (= e!237233 (= lt!184959 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391769 () Bool)

(declare-fun lt!184961 () Unit!11968)

(declare-fun lt!184956 () Unit!11968)

(assert (=> b!391769 (= lt!184961 lt!184956)))

(declare-fun lt!184960 () (_ BitVec 64))

(declare-fun lt!184955 () V!13995)

(declare-fun lt!184957 () (_ BitVec 64))

(declare-fun lt!184958 () ListLongMap!5449)

(assert (=> b!391769 (not (contains!2451 (+!1060 lt!184958 (tuple2!6547 lt!184960 lt!184955)) lt!184957))))

(assert (=> b!391769 (= lt!184956 (addStillNotContains!138 lt!184958 lt!184960 lt!184955 lt!184957))))

(assert (=> b!391769 (= lt!184957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391769 (= lt!184955 (get!5594 (select (arr!11073 lt!184780) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391769 (= lt!184960 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(assert (=> b!391769 (= lt!184958 call!27643)))

(assert (=> b!391769 (= e!237238 (+!1060 call!27643 (tuple2!6547 (select (arr!11072 lt!184776) #b00000000000000000000000000000000) (get!5594 (select (arr!11073 lt!184780) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27640 () Bool)

(assert (=> bm!27640 (= call!27643 (getCurrentListMapNoExtraKeys!971 lt!184776 lt!184780 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391770 () Bool)

(assert (=> b!391770 (= e!237234 e!237239)))

(declare-fun c!54252 () Bool)

(assert (=> b!391770 (= c!54252 e!237237)))

(declare-fun res!224339 () Bool)

(assert (=> b!391770 (=> (not res!224339) (not e!237237))))

(assert (=> b!391770 (= res!224339 (bvslt #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(assert (= (and d!72897 c!54250) b!391761))

(assert (= (and d!72897 (not c!54250)) b!391766))

(assert (= (and b!391766 c!54253) b!391769))

(assert (= (and b!391766 (not c!54253)) b!391759))

(assert (= (or b!391769 b!391759) bm!27640))

(assert (= (and d!72897 res!224336) b!391762))

(assert (= (and b!391762 res!224337) b!391770))

(assert (= (and b!391770 res!224339) b!391760))

(assert (= (and b!391770 c!54252) b!391763))

(assert (= (and b!391770 (not c!54252)) b!391765))

(assert (= (and b!391763 res!224338) b!391767))

(assert (= (and b!391765 c!54251) b!391768))

(assert (= (and b!391765 (not c!54251)) b!391764))

(declare-fun b_lambda!8685 () Bool)

(assert (=> (not b_lambda!8685) (not b!391767)))

(assert (=> b!391767 t!11551))

(declare-fun b_and!16309 () Bool)

(assert (= b_and!16307 (and (=> t!11551 result!5741) b_and!16309)))

(declare-fun b_lambda!8687 () Bool)

(assert (=> (not b_lambda!8687) (not b!391769)))

(assert (=> b!391769 t!11551))

(declare-fun b_and!16311 () Bool)

(assert (= b_and!16309 (and (=> t!11551 result!5741) b_and!16311)))

(assert (=> b!391767 m!387685))

(assert (=> b!391767 m!387591))

(assert (=> b!391767 m!387685))

(declare-fun m!387737 () Bool)

(assert (=> b!391767 m!387737))

(assert (=> b!391767 m!387691))

(assert (=> b!391767 m!387691))

(assert (=> b!391767 m!387591))

(assert (=> b!391767 m!387693))

(declare-fun m!387739 () Bool)

(assert (=> b!391769 m!387739))

(declare-fun m!387741 () Bool)

(assert (=> b!391769 m!387741))

(assert (=> b!391769 m!387739))

(declare-fun m!387743 () Bool)

(assert (=> b!391769 m!387743))

(assert (=> b!391769 m!387685))

(assert (=> b!391769 m!387591))

(declare-fun m!387745 () Bool)

(assert (=> b!391769 m!387745))

(assert (=> b!391769 m!387691))

(assert (=> b!391769 m!387691))

(assert (=> b!391769 m!387591))

(assert (=> b!391769 m!387693))

(assert (=> b!391763 m!387685))

(assert (=> b!391763 m!387685))

(declare-fun m!387747 () Bool)

(assert (=> b!391763 m!387747))

(assert (=> b!391760 m!387685))

(assert (=> b!391760 m!387685))

(assert (=> b!391760 m!387687))

(declare-fun m!387749 () Bool)

(assert (=> b!391768 m!387749))

(declare-fun m!387751 () Bool)

(assert (=> b!391764 m!387751))

(declare-fun m!387753 () Bool)

(assert (=> b!391762 m!387753))

(assert (=> bm!27640 m!387749))

(assert (=> b!391766 m!387685))

(assert (=> b!391766 m!387685))

(assert (=> b!391766 m!387687))

(declare-fun m!387755 () Bool)

(assert (=> d!72897 m!387755))

(assert (=> d!72897 m!387469))

(assert (=> b!391530 d!72897))

(declare-fun b!391781 () Bool)

(declare-fun e!237250 () Bool)

(declare-fun e!237249 () Bool)

(assert (=> b!391781 (= e!237250 e!237249)))

(declare-fun c!54256 () Bool)

(assert (=> b!391781 (= c!54256 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391782 () Bool)

(declare-fun call!27646 () Bool)

(assert (=> b!391782 (= e!237249 call!27646)))

(declare-fun b!391784 () Bool)

(declare-fun e!237251 () Bool)

(assert (=> b!391784 (= e!237251 e!237250)))

(declare-fun res!224347 () Bool)

(assert (=> b!391784 (=> (not res!224347) (not e!237250))))

(declare-fun e!237248 () Bool)

(assert (=> b!391784 (= res!224347 (not e!237248))))

(declare-fun res!224348 () Bool)

(assert (=> b!391784 (=> (not res!224348) (not e!237248))))

(assert (=> b!391784 (= res!224348 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391785 () Bool)

(assert (=> b!391785 (= e!237249 call!27646)))

(declare-fun bm!27643 () Bool)

(assert (=> bm!27643 (= call!27646 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54256 (Cons!6385 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) Nil!6386) Nil!6386)))))

(declare-fun d!72899 () Bool)

(declare-fun res!224346 () Bool)

(assert (=> d!72899 (=> res!224346 e!237251)))

(assert (=> d!72899 (= res!224346 (bvsge #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (=> d!72899 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6386) e!237251)))

(declare-fun b!391783 () Bool)

(declare-fun contains!2453 (List!6389 (_ BitVec 64)) Bool)

(assert (=> b!391783 (= e!237248 (contains!2453 Nil!6386 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72899 (not res!224346)) b!391784))

(assert (= (and b!391784 res!224348) b!391783))

(assert (= (and b!391784 res!224347) b!391781))

(assert (= (and b!391781 c!54256) b!391782))

(assert (= (and b!391781 (not c!54256)) b!391785))

(assert (= (or b!391782 b!391785) bm!27643))

(assert (=> b!391781 m!387589))

(assert (=> b!391781 m!387589))

(assert (=> b!391781 m!387609))

(assert (=> b!391784 m!387589))

(assert (=> b!391784 m!387589))

(assert (=> b!391784 m!387609))

(assert (=> bm!27643 m!387589))

(declare-fun m!387757 () Bool)

(assert (=> bm!27643 m!387757))

(assert (=> b!391783 m!387589))

(assert (=> b!391783 m!387589))

(declare-fun m!387759 () Bool)

(assert (=> b!391783 m!387759))

(assert (=> b!391526 d!72899))

(declare-fun d!72901 () Bool)

(declare-fun e!237252 () Bool)

(assert (=> d!72901 e!237252))

(declare-fun res!224350 () Bool)

(assert (=> d!72901 (=> (not res!224350) (not e!237252))))

(declare-fun lt!184963 () ListLongMap!5449)

(assert (=> d!72901 (= res!224350 (contains!2451 lt!184963 (_1!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!184964 () List!6390)

(assert (=> d!72901 (= lt!184963 (ListLongMap!5450 lt!184964))))

(declare-fun lt!184962 () Unit!11968)

(declare-fun lt!184965 () Unit!11968)

(assert (=> d!72901 (= lt!184962 lt!184965)))

(assert (=> d!72901 (= (getValueByKey!360 lt!184964 (_1!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!365 (_2!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72901 (= lt!184965 (lemmaContainsTupThenGetReturnValue!185 lt!184964 (_1!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72901 (= lt!184964 (insertStrictlySorted!188 (toList!2740 lt!184778) (_1!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72901 (= (+!1060 lt!184778 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!184963)))

(declare-fun b!391786 () Bool)

(declare-fun res!224349 () Bool)

(assert (=> b!391786 (=> (not res!224349) (not e!237252))))

(assert (=> b!391786 (= res!224349 (= (getValueByKey!360 (toList!2740 lt!184963) (_1!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!365 (_2!3284 (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!391787 () Bool)

(assert (=> b!391787 (= e!237252 (contains!2452 (toList!2740 lt!184963) (tuple2!6547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72901 res!224350) b!391786))

(assert (= (and b!391786 res!224349) b!391787))

(declare-fun m!387761 () Bool)

(assert (=> d!72901 m!387761))

(declare-fun m!387763 () Bool)

(assert (=> d!72901 m!387763))

(declare-fun m!387765 () Bool)

(assert (=> d!72901 m!387765))

(declare-fun m!387767 () Bool)

(assert (=> d!72901 m!387767))

(declare-fun m!387769 () Bool)

(assert (=> b!391786 m!387769))

(declare-fun m!387771 () Bool)

(assert (=> b!391787 m!387771))

(assert (=> b!391536 d!72901))

(declare-fun d!72903 () Bool)

(assert (=> d!72903 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391531 d!72903))

(declare-fun b!391796 () Bool)

(declare-fun e!237261 () Bool)

(declare-fun e!237260 () Bool)

(assert (=> b!391796 (= e!237261 e!237260)))

(declare-fun c!54259 () Bool)

(assert (=> b!391796 (= c!54259 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun bm!27646 () Bool)

(declare-fun call!27649 () Bool)

(assert (=> bm!27646 (= call!27649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184776 mask!970))))

(declare-fun b!391797 () Bool)

(assert (=> b!391797 (= e!237260 call!27649)))

(declare-fun d!72905 () Bool)

(declare-fun res!224356 () Bool)

(assert (=> d!72905 (=> res!224356 e!237261)))

(assert (=> d!72905 (= res!224356 (bvsge #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(assert (=> d!72905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184776 mask!970) e!237261)))

(declare-fun b!391798 () Bool)

(declare-fun e!237259 () Bool)

(assert (=> b!391798 (= e!237260 e!237259)))

(declare-fun lt!184972 () (_ BitVec 64))

(assert (=> b!391798 (= lt!184972 (select (arr!11072 lt!184776) #b00000000000000000000000000000000))))

(declare-fun lt!184974 () Unit!11968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23221 (_ BitVec 64) (_ BitVec 32)) Unit!11968)

(assert (=> b!391798 (= lt!184974 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184776 lt!184972 #b00000000000000000000000000000000))))

(assert (=> b!391798 (arrayContainsKey!0 lt!184776 lt!184972 #b00000000000000000000000000000000)))

(declare-fun lt!184973 () Unit!11968)

(assert (=> b!391798 (= lt!184973 lt!184974)))

(declare-fun res!224355 () Bool)

(declare-datatypes ((SeekEntryResult!3510 0))(
  ( (MissingZero!3510 (index!16219 (_ BitVec 32))) (Found!3510 (index!16220 (_ BitVec 32))) (Intermediate!3510 (undefined!4322 Bool) (index!16221 (_ BitVec 32)) (x!38375 (_ BitVec 32))) (Undefined!3510) (MissingVacant!3510 (index!16222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23221 (_ BitVec 32)) SeekEntryResult!3510)

(assert (=> b!391798 (= res!224355 (= (seekEntryOrOpen!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000) lt!184776 mask!970) (Found!3510 #b00000000000000000000000000000000)))))

(assert (=> b!391798 (=> (not res!224355) (not e!237259))))

(declare-fun b!391799 () Bool)

(assert (=> b!391799 (= e!237259 call!27649)))

(assert (= (and d!72905 (not res!224356)) b!391796))

(assert (= (and b!391796 c!54259) b!391798))

(assert (= (and b!391796 (not c!54259)) b!391797))

(assert (= (and b!391798 res!224355) b!391799))

(assert (= (or b!391799 b!391797) bm!27646))

(assert (=> b!391796 m!387685))

(assert (=> b!391796 m!387685))

(assert (=> b!391796 m!387687))

(declare-fun m!387773 () Bool)

(assert (=> bm!27646 m!387773))

(assert (=> b!391798 m!387685))

(declare-fun m!387775 () Bool)

(assert (=> b!391798 m!387775))

(declare-fun m!387777 () Bool)

(assert (=> b!391798 m!387777))

(assert (=> b!391798 m!387685))

(declare-fun m!387779 () Bool)

(assert (=> b!391798 m!387779))

(assert (=> b!391534 d!72905))

(declare-fun d!72907 () Bool)

(assert (=> d!72907 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38034 d!72907))

(declare-fun d!72909 () Bool)

(assert (=> d!72909 (= (array_inv!8130 _values!506) (bvsge (size!11426 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38034 d!72909))

(declare-fun d!72911 () Bool)

(assert (=> d!72911 (= (array_inv!8131 _keys!658) (bvsge (size!11425 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38034 d!72911))

(declare-fun b!391800 () Bool)

(declare-fun e!237264 () Bool)

(declare-fun e!237263 () Bool)

(assert (=> b!391800 (= e!237264 e!237263)))

(declare-fun c!54260 () Bool)

(assert (=> b!391800 (= c!54260 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun b!391801 () Bool)

(declare-fun call!27650 () Bool)

(assert (=> b!391801 (= e!237263 call!27650)))

(declare-fun b!391803 () Bool)

(declare-fun e!237265 () Bool)

(assert (=> b!391803 (= e!237265 e!237264)))

(declare-fun res!224358 () Bool)

(assert (=> b!391803 (=> (not res!224358) (not e!237264))))

(declare-fun e!237262 () Bool)

(assert (=> b!391803 (= res!224358 (not e!237262))))

(declare-fun res!224359 () Bool)

(assert (=> b!391803 (=> (not res!224359) (not e!237262))))

(assert (=> b!391803 (= res!224359 (validKeyInArray!0 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(declare-fun b!391804 () Bool)

(assert (=> b!391804 (= e!237263 call!27650)))

(declare-fun bm!27647 () Bool)

(assert (=> bm!27647 (= call!27650 (arrayNoDuplicates!0 lt!184776 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54260 (Cons!6385 (select (arr!11072 lt!184776) #b00000000000000000000000000000000) Nil!6386) Nil!6386)))))

(declare-fun d!72913 () Bool)

(declare-fun res!224357 () Bool)

(assert (=> d!72913 (=> res!224357 e!237265)))

(assert (=> d!72913 (= res!224357 (bvsge #b00000000000000000000000000000000 (size!11425 lt!184776)))))

(assert (=> d!72913 (= (arrayNoDuplicates!0 lt!184776 #b00000000000000000000000000000000 Nil!6386) e!237265)))

(declare-fun b!391802 () Bool)

(assert (=> b!391802 (= e!237262 (contains!2453 Nil!6386 (select (arr!11072 lt!184776) #b00000000000000000000000000000000)))))

(assert (= (and d!72913 (not res!224357)) b!391803))

(assert (= (and b!391803 res!224359) b!391802))

(assert (= (and b!391803 res!224358) b!391800))

(assert (= (and b!391800 c!54260) b!391801))

(assert (= (and b!391800 (not c!54260)) b!391804))

(assert (= (or b!391801 b!391804) bm!27647))

(assert (=> b!391800 m!387685))

(assert (=> b!391800 m!387685))

(assert (=> b!391800 m!387687))

(assert (=> b!391803 m!387685))

(assert (=> b!391803 m!387685))

(assert (=> b!391803 m!387687))

(assert (=> bm!27647 m!387685))

(declare-fun m!387781 () Bool)

(assert (=> bm!27647 m!387781))

(assert (=> b!391802 m!387685))

(assert (=> b!391802 m!387685))

(declare-fun m!387783 () Bool)

(assert (=> b!391802 m!387783))

(assert (=> b!391535 d!72913))

(declare-fun d!72915 () Bool)

(declare-fun res!224364 () Bool)

(declare-fun e!237270 () Bool)

(assert (=> d!72915 (=> res!224364 e!237270)))

(assert (=> d!72915 (= res!224364 (= (select (arr!11072 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72915 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237270)))

(declare-fun b!391809 () Bool)

(declare-fun e!237271 () Bool)

(assert (=> b!391809 (= e!237270 e!237271)))

(declare-fun res!224365 () Bool)

(assert (=> b!391809 (=> (not res!224365) (not e!237271))))

(assert (=> b!391809 (= res!224365 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11425 _keys!658)))))

(declare-fun b!391810 () Bool)

(assert (=> b!391810 (= e!237271 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72915 (not res!224364)) b!391809))

(assert (= (and b!391809 res!224365) b!391810))

(assert (=> d!72915 m!387589))

(declare-fun m!387785 () Bool)

(assert (=> b!391810 m!387785))

(assert (=> b!391524 d!72915))

(declare-fun b!391811 () Bool)

(declare-fun e!237274 () Bool)

(declare-fun e!237273 () Bool)

(assert (=> b!391811 (= e!237274 e!237273)))

(declare-fun c!54261 () Bool)

(assert (=> b!391811 (= c!54261 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27648 () Bool)

(declare-fun call!27651 () Bool)

(assert (=> bm!27648 (= call!27651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!391812 () Bool)

(assert (=> b!391812 (= e!237273 call!27651)))

(declare-fun d!72917 () Bool)

(declare-fun res!224367 () Bool)

(assert (=> d!72917 (=> res!224367 e!237274)))

(assert (=> d!72917 (= res!224367 (bvsge #b00000000000000000000000000000000 (size!11425 _keys!658)))))

(assert (=> d!72917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237274)))

(declare-fun b!391813 () Bool)

(declare-fun e!237272 () Bool)

(assert (=> b!391813 (= e!237273 e!237272)))

(declare-fun lt!184975 () (_ BitVec 64))

(assert (=> b!391813 (= lt!184975 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184977 () Unit!11968)

(assert (=> b!391813 (= lt!184977 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184975 #b00000000000000000000000000000000))))

(assert (=> b!391813 (arrayContainsKey!0 _keys!658 lt!184975 #b00000000000000000000000000000000)))

(declare-fun lt!184976 () Unit!11968)

(assert (=> b!391813 (= lt!184976 lt!184977)))

(declare-fun res!224366 () Bool)

(assert (=> b!391813 (= res!224366 (= (seekEntryOrOpen!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3510 #b00000000000000000000000000000000)))))

(assert (=> b!391813 (=> (not res!224366) (not e!237272))))

(declare-fun b!391814 () Bool)

(assert (=> b!391814 (= e!237272 call!27651)))

(assert (= (and d!72917 (not res!224367)) b!391811))

(assert (= (and b!391811 c!54261) b!391813))

(assert (= (and b!391811 (not c!54261)) b!391812))

(assert (= (and b!391813 res!224366) b!391814))

(assert (= (or b!391814 b!391812) bm!27648))

(assert (=> b!391811 m!387589))

(assert (=> b!391811 m!387589))

(assert (=> b!391811 m!387609))

(declare-fun m!387787 () Bool)

(assert (=> bm!27648 m!387787))

(assert (=> b!391813 m!387589))

(declare-fun m!387789 () Bool)

(assert (=> b!391813 m!387789))

(declare-fun m!387791 () Bool)

(assert (=> b!391813 m!387791))

(assert (=> b!391813 m!387589))

(declare-fun m!387793 () Bool)

(assert (=> b!391813 m!387793))

(assert (=> b!391533 d!72917))

(declare-fun condMapEmpty!16095 () Bool)

(declare-fun mapDefault!16095 () ValueCell!4490)

(assert (=> mapNonEmpty!16086 (= condMapEmpty!16095 (= mapRest!16086 ((as const (Array (_ BitVec 32) ValueCell!4490)) mapDefault!16095)))))

(declare-fun e!237280 () Bool)

(declare-fun mapRes!16095 () Bool)

(assert (=> mapNonEmpty!16086 (= tp!31757 (and e!237280 mapRes!16095))))

(declare-fun b!391821 () Bool)

(declare-fun e!237279 () Bool)

(assert (=> b!391821 (= e!237279 tp_is_empty!9667)))

(declare-fun mapNonEmpty!16095 () Bool)

(declare-fun tp!31773 () Bool)

(assert (=> mapNonEmpty!16095 (= mapRes!16095 (and tp!31773 e!237279))))

(declare-fun mapValue!16095 () ValueCell!4490)

(declare-fun mapKey!16095 () (_ BitVec 32))

(declare-fun mapRest!16095 () (Array (_ BitVec 32) ValueCell!4490))

(assert (=> mapNonEmpty!16095 (= mapRest!16086 (store mapRest!16095 mapKey!16095 mapValue!16095))))

(declare-fun mapIsEmpty!16095 () Bool)

(assert (=> mapIsEmpty!16095 mapRes!16095))

(declare-fun b!391822 () Bool)

(assert (=> b!391822 (= e!237280 tp_is_empty!9667)))

(assert (= (and mapNonEmpty!16086 condMapEmpty!16095) mapIsEmpty!16095))

(assert (= (and mapNonEmpty!16086 (not condMapEmpty!16095)) mapNonEmpty!16095))

(assert (= (and mapNonEmpty!16095 ((_ is ValueCellFull!4490) mapValue!16095)) b!391821))

(assert (= (and mapNonEmpty!16086 ((_ is ValueCellFull!4490) mapDefault!16095)) b!391822))

(declare-fun m!387795 () Bool)

(assert (=> mapNonEmpty!16095 m!387795))

(declare-fun b_lambda!8689 () Bool)

(assert (= b_lambda!8677 (or (and start!38034 b_free!8995) b_lambda!8689)))

(declare-fun b_lambda!8691 () Bool)

(assert (= b_lambda!8685 (or (and start!38034 b_free!8995) b_lambda!8691)))

(declare-fun b_lambda!8693 () Bool)

(assert (= b_lambda!8687 (or (and start!38034 b_free!8995) b_lambda!8693)))

(declare-fun b_lambda!8695 () Bool)

(assert (= b_lambda!8679 (or (and start!38034 b_free!8995) b_lambda!8695)))

(declare-fun b_lambda!8697 () Bool)

(assert (= b_lambda!8683 (or (and start!38034 b_free!8995) b_lambda!8697)))

(declare-fun b_lambda!8699 () Bool)

(assert (= b_lambda!8681 (or (and start!38034 b_free!8995) b_lambda!8699)))

(check-sat (not d!72897) (not b!391718) (not b!391650) (not b!391796) (not b!391655) (not bm!27640) (not b!391717) (not b!391708) (not b!391766) (not b!391721) (not b!391709) (not b!391732) (not b!391760) (not bm!27633) (not b!391767) (not bm!27632) (not b_lambda!8693) (not b!391762) (not b_lambda!8695) (not d!72901) (not bm!27646) (not b!391746) (not b!391783) (not b!391813) (not b!391798) (not d!72895) (not b!391654) tp_is_empty!9667 (not b!391656) (not b!391727) (not b!391735) (not b!391757) (not b!391803) (not bm!27626) (not bm!27627) (not b!391800) (not b!391745) (not b_next!8995) (not b_lambda!8689) b_and!16311 (not bm!27648) (not d!72893) (not mapNonEmpty!16095) (not b!391787) (not b!391715) (not b!391653) (not b!391811) (not b!391769) (not b!391802) (not b!391748) (not b!391781) (not bm!27643) (not b_lambda!8699) (not bm!27647) (not b!391649) (not bm!27621) (not d!72889) (not b!391810) (not bm!27639) (not b!391719) (not b!391728) (not d!72891) (not bm!27625) (not bm!27638) (not b!391647) (not b!391768) (not d!72887) (not b!391742) (not bm!27628) (not b!391763) (not bm!27605) (not bm!27620) (not b_lambda!8691) (not b!391764) (not b!391651) (not b!391786) (not b!391784) (not b_lambda!8697) (not b!391736) (not b!391705) (not b!391744))
(check-sat b_and!16311 (not b_next!8995))
