; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21052 () Bool)

(assert start!21052)

(declare-fun b_free!5583 () Bool)

(declare-fun b_next!5583 () Bool)

(assert (=> start!21052 (= b_free!5583 (not b_next!5583))))

(declare-fun tp!19807 () Bool)

(declare-fun b_and!12401 () Bool)

(assert (=> start!21052 (= tp!19807 b_and!12401)))

(declare-fun res!103441 () Bool)

(declare-fun e!137798 () Bool)

(assert (=> start!21052 (=> (not res!103441) (not e!137798))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21052 (= res!103441 (validMask!0 mask!1149))))

(assert (=> start!21052 e!137798))

(declare-datatypes ((V!6907 0))(
  ( (V!6908 (val!2767 Int)) )
))
(declare-datatypes ((ValueCell!2379 0))(
  ( (ValueCellFull!2379 (v!4761 V!6907)) (EmptyCell!2379) )
))
(declare-datatypes ((array!10091 0))(
  ( (array!10092 (arr!4790 (Array (_ BitVec 32) ValueCell!2379)) (size!5115 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10091)

(declare-fun e!137793 () Bool)

(declare-fun array_inv!3171 (array!10091) Bool)

(assert (=> start!21052 (and (array_inv!3171 _values!649) e!137793)))

(assert (=> start!21052 true))

(declare-fun tp_is_empty!5445 () Bool)

(assert (=> start!21052 tp_is_empty!5445))

(declare-datatypes ((array!10093 0))(
  ( (array!10094 (arr!4791 (Array (_ BitVec 32) (_ BitVec 64))) (size!5116 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10093)

(declare-fun array_inv!3172 (array!10093) Bool)

(assert (=> start!21052 (array_inv!3172 _keys!825)))

(assert (=> start!21052 tp!19807))

(declare-fun b!211717 () Bool)

(declare-fun res!103439 () Bool)

(declare-fun e!137795 () Bool)

(assert (=> b!211717 (=> (not res!103439) (not e!137795))))

(declare-datatypes ((tuple2!4186 0))(
  ( (tuple2!4187 (_1!2104 (_ BitVec 64)) (_2!2104 V!6907)) )
))
(declare-fun lt!108921 () tuple2!4186)

(declare-datatypes ((List!3076 0))(
  ( (Nil!3073) (Cons!3072 (h!3714 tuple2!4186) (t!8019 List!3076)) )
))
(declare-datatypes ((ListLongMap!3099 0))(
  ( (ListLongMap!3100 (toList!1565 List!3076)) )
))
(declare-fun lt!108919 () ListLongMap!3099)

(declare-fun lt!108922 () ListLongMap!3099)

(declare-fun +!568 (ListLongMap!3099 tuple2!4186) ListLongMap!3099)

(assert (=> b!211717 (= res!103439 (= lt!108919 (+!568 lt!108922 lt!108921)))))

(declare-fun b!211718 () Bool)

(declare-fun res!103434 () Bool)

(assert (=> b!211718 (=> (not res!103434) (not e!137798))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211718 (= res!103434 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5116 _keys!825))))))

(declare-fun b!211719 () Bool)

(declare-fun e!137799 () Bool)

(declare-fun mapRes!9254 () Bool)

(assert (=> b!211719 (= e!137793 (and e!137799 mapRes!9254))))

(declare-fun condMapEmpty!9254 () Bool)

(declare-fun mapDefault!9254 () ValueCell!2379)

(assert (=> b!211719 (= condMapEmpty!9254 (= (arr!4790 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2379)) mapDefault!9254)))))

(declare-fun b!211720 () Bool)

(declare-fun lt!108915 () ListLongMap!3099)

(declare-fun lt!108920 () ListLongMap!3099)

(assert (=> b!211720 (= e!137795 (= lt!108915 (+!568 lt!108920 lt!108921)))))

(declare-fun b!211721 () Bool)

(declare-fun e!137796 () Bool)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!211721 (= e!137796 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211721 e!137795))

(declare-fun res!103443 () Bool)

(assert (=> b!211721 (=> (not res!103443) (not e!137795))))

(declare-fun lt!108917 () ListLongMap!3099)

(assert (=> b!211721 (= res!103443 (= lt!108915 (+!568 lt!108917 lt!108921)))))

(declare-fun zeroValue!615 () V!6907)

(assert (=> b!211721 (= lt!108921 (tuple2!4187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!9254 () Bool)

(declare-fun tp!19808 () Bool)

(declare-fun e!137797 () Bool)

(assert (=> mapNonEmpty!9254 (= mapRes!9254 (and tp!19808 e!137797))))

(declare-fun mapValue!9254 () ValueCell!2379)

(declare-fun mapKey!9254 () (_ BitVec 32))

(declare-fun mapRest!9254 () (Array (_ BitVec 32) ValueCell!2379))

(assert (=> mapNonEmpty!9254 (= (arr!4790 _values!649) (store mapRest!9254 mapKey!9254 mapValue!9254))))

(declare-fun b!211722 () Bool)

(declare-fun res!103438 () Bool)

(assert (=> b!211722 (=> (not res!103438) (not e!137798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10093 (_ BitVec 32)) Bool)

(assert (=> b!211722 (= res!103438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211723 () Bool)

(assert (=> b!211723 (= e!137797 tp_is_empty!5445)))

(declare-fun b!211724 () Bool)

(declare-fun res!103437 () Bool)

(assert (=> b!211724 (=> (not res!103437) (not e!137798))))

(assert (=> b!211724 (= res!103437 (= (select (arr!4791 _keys!825) i!601) k0!843))))

(declare-fun b!211725 () Bool)

(assert (=> b!211725 (= e!137799 tp_is_empty!5445)))

(declare-fun mapIsEmpty!9254 () Bool)

(assert (=> mapIsEmpty!9254 mapRes!9254))

(declare-fun b!211726 () Bool)

(assert (=> b!211726 (= e!137798 (not e!137796))))

(declare-fun res!103440 () Bool)

(assert (=> b!211726 (=> res!103440 e!137796)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211726 (= res!103440 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6907)

(declare-fun getCurrentListMap!1098 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6907 V!6907 (_ BitVec 32) Int) ListLongMap!3099)

(assert (=> b!211726 (= lt!108919 (getCurrentListMap!1098 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108918 () array!10091)

(assert (=> b!211726 (= lt!108915 (getCurrentListMap!1098 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211726 (and (= lt!108917 lt!108920) (= lt!108920 lt!108917))))

(declare-fun v!520 () V!6907)

(assert (=> b!211726 (= lt!108920 (+!568 lt!108922 (tuple2!4187 k0!843 v!520)))))

(declare-datatypes ((Unit!6428 0))(
  ( (Unit!6429) )
))
(declare-fun lt!108916 () Unit!6428)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6907 V!6907 (_ BitVec 32) (_ BitVec 64) V!6907 (_ BitVec 32) Int) Unit!6428)

(assert (=> b!211726 (= lt!108916 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!500 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6907 V!6907 (_ BitVec 32) Int) ListLongMap!3099)

(assert (=> b!211726 (= lt!108917 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211726 (= lt!108918 (array!10092 (store (arr!4790 _values!649) i!601 (ValueCellFull!2379 v!520)) (size!5115 _values!649)))))

(assert (=> b!211726 (= lt!108922 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211727 () Bool)

(declare-fun res!103436 () Bool)

(assert (=> b!211727 (=> (not res!103436) (not e!137798))))

(assert (=> b!211727 (= res!103436 (and (= (size!5115 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5116 _keys!825) (size!5115 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211728 () Bool)

(declare-fun res!103442 () Bool)

(assert (=> b!211728 (=> (not res!103442) (not e!137798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211728 (= res!103442 (validKeyInArray!0 k0!843))))

(declare-fun b!211729 () Bool)

(declare-fun res!103435 () Bool)

(assert (=> b!211729 (=> (not res!103435) (not e!137798))))

(declare-datatypes ((List!3077 0))(
  ( (Nil!3074) (Cons!3073 (h!3715 (_ BitVec 64)) (t!8020 List!3077)) )
))
(declare-fun arrayNoDuplicates!0 (array!10093 (_ BitVec 32) List!3077) Bool)

(assert (=> b!211729 (= res!103435 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3074))))

(assert (= (and start!21052 res!103441) b!211727))

(assert (= (and b!211727 res!103436) b!211722))

(assert (= (and b!211722 res!103438) b!211729))

(assert (= (and b!211729 res!103435) b!211718))

(assert (= (and b!211718 res!103434) b!211728))

(assert (= (and b!211728 res!103442) b!211724))

(assert (= (and b!211724 res!103437) b!211726))

(assert (= (and b!211726 (not res!103440)) b!211721))

(assert (= (and b!211721 res!103443) b!211717))

(assert (= (and b!211717 res!103439) b!211720))

(assert (= (and b!211719 condMapEmpty!9254) mapIsEmpty!9254))

(assert (= (and b!211719 (not condMapEmpty!9254)) mapNonEmpty!9254))

(get-info :version)

(assert (= (and mapNonEmpty!9254 ((_ is ValueCellFull!2379) mapValue!9254)) b!211723))

(assert (= (and b!211719 ((_ is ValueCellFull!2379) mapDefault!9254)) b!211725))

(assert (= start!21052 b!211719))

(declare-fun m!239465 () Bool)

(assert (=> b!211728 m!239465))

(declare-fun m!239467 () Bool)

(assert (=> b!211721 m!239467))

(declare-fun m!239469 () Bool)

(assert (=> start!21052 m!239469))

(declare-fun m!239471 () Bool)

(assert (=> start!21052 m!239471))

(declare-fun m!239473 () Bool)

(assert (=> start!21052 m!239473))

(declare-fun m!239475 () Bool)

(assert (=> b!211720 m!239475))

(declare-fun m!239477 () Bool)

(assert (=> b!211717 m!239477))

(declare-fun m!239479 () Bool)

(assert (=> b!211724 m!239479))

(declare-fun m!239481 () Bool)

(assert (=> b!211729 m!239481))

(declare-fun m!239483 () Bool)

(assert (=> b!211726 m!239483))

(declare-fun m!239485 () Bool)

(assert (=> b!211726 m!239485))

(declare-fun m!239487 () Bool)

(assert (=> b!211726 m!239487))

(declare-fun m!239489 () Bool)

(assert (=> b!211726 m!239489))

(declare-fun m!239491 () Bool)

(assert (=> b!211726 m!239491))

(declare-fun m!239493 () Bool)

(assert (=> b!211726 m!239493))

(declare-fun m!239495 () Bool)

(assert (=> b!211726 m!239495))

(declare-fun m!239497 () Bool)

(assert (=> mapNonEmpty!9254 m!239497))

(declare-fun m!239499 () Bool)

(assert (=> b!211722 m!239499))

(check-sat (not b!211726) (not start!21052) b_and!12401 (not b!211721) (not b!211729) (not b!211717) (not b!211722) (not b!211728) (not b!211720) (not b_next!5583) (not mapNonEmpty!9254) tp_is_empty!5445)
(check-sat b_and!12401 (not b_next!5583))
(get-model)

(declare-fun d!58071 () Bool)

(declare-fun e!137823 () Bool)

(assert (=> d!58071 e!137823))

(declare-fun res!103479 () Bool)

(assert (=> d!58071 (=> (not res!103479) (not e!137823))))

(declare-fun lt!108956 () ListLongMap!3099)

(declare-fun contains!1407 (ListLongMap!3099 (_ BitVec 64)) Bool)

(assert (=> d!58071 (= res!103479 (contains!1407 lt!108956 (_1!2104 lt!108921)))))

(declare-fun lt!108955 () List!3076)

(assert (=> d!58071 (= lt!108956 (ListLongMap!3100 lt!108955))))

(declare-fun lt!108958 () Unit!6428)

(declare-fun lt!108957 () Unit!6428)

(assert (=> d!58071 (= lt!108958 lt!108957)))

(declare-datatypes ((Option!259 0))(
  ( (Some!258 (v!4766 V!6907)) (None!257) )
))
(declare-fun getValueByKey!253 (List!3076 (_ BitVec 64)) Option!259)

(assert (=> d!58071 (= (getValueByKey!253 lt!108955 (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921)))))

(declare-fun lemmaContainsTupThenGetReturnValue!140 (List!3076 (_ BitVec 64) V!6907) Unit!6428)

(assert (=> d!58071 (= lt!108957 (lemmaContainsTupThenGetReturnValue!140 lt!108955 (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(declare-fun insertStrictlySorted!143 (List!3076 (_ BitVec 64) V!6907) List!3076)

(assert (=> d!58071 (= lt!108955 (insertStrictlySorted!143 (toList!1565 lt!108920) (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(assert (=> d!58071 (= (+!568 lt!108920 lt!108921) lt!108956)))

(declare-fun b!211773 () Bool)

(declare-fun res!103478 () Bool)

(assert (=> b!211773 (=> (not res!103478) (not e!137823))))

(assert (=> b!211773 (= res!103478 (= (getValueByKey!253 (toList!1565 lt!108956) (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921))))))

(declare-fun b!211774 () Bool)

(declare-fun contains!1408 (List!3076 tuple2!4186) Bool)

(assert (=> b!211774 (= e!137823 (contains!1408 (toList!1565 lt!108956) lt!108921))))

(assert (= (and d!58071 res!103479) b!211773))

(assert (= (and b!211773 res!103478) b!211774))

(declare-fun m!239537 () Bool)

(assert (=> d!58071 m!239537))

(declare-fun m!239539 () Bool)

(assert (=> d!58071 m!239539))

(declare-fun m!239541 () Bool)

(assert (=> d!58071 m!239541))

(declare-fun m!239543 () Bool)

(assert (=> d!58071 m!239543))

(declare-fun m!239545 () Bool)

(assert (=> b!211773 m!239545))

(declare-fun m!239547 () Bool)

(assert (=> b!211774 m!239547))

(assert (=> b!211720 d!58071))

(declare-fun d!58073 () Bool)

(declare-fun res!103487 () Bool)

(declare-fun e!137833 () Bool)

(assert (=> d!58073 (=> res!103487 e!137833)))

(assert (=> d!58073 (= res!103487 (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58073 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3074) e!137833)))

(declare-fun b!211785 () Bool)

(declare-fun e!137832 () Bool)

(declare-fun call!20043 () Bool)

(assert (=> b!211785 (= e!137832 call!20043)))

(declare-fun bm!20040 () Bool)

(declare-fun c!35732 () Bool)

(assert (=> bm!20040 (= call!20043 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35732 (Cons!3073 (select (arr!4791 _keys!825) #b00000000000000000000000000000000) Nil!3074) Nil!3074)))))

(declare-fun b!211786 () Bool)

(declare-fun e!137835 () Bool)

(assert (=> b!211786 (= e!137835 e!137832)))

(assert (=> b!211786 (= c!35732 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211787 () Bool)

(declare-fun e!137834 () Bool)

(declare-fun contains!1409 (List!3077 (_ BitVec 64)) Bool)

(assert (=> b!211787 (= e!137834 (contains!1409 Nil!3074 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211788 () Bool)

(assert (=> b!211788 (= e!137833 e!137835)))

(declare-fun res!103486 () Bool)

(assert (=> b!211788 (=> (not res!103486) (not e!137835))))

(assert (=> b!211788 (= res!103486 (not e!137834))))

(declare-fun res!103488 () Bool)

(assert (=> b!211788 (=> (not res!103488) (not e!137834))))

(assert (=> b!211788 (= res!103488 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211789 () Bool)

(assert (=> b!211789 (= e!137832 call!20043)))

(assert (= (and d!58073 (not res!103487)) b!211788))

(assert (= (and b!211788 res!103488) b!211787))

(assert (= (and b!211788 res!103486) b!211786))

(assert (= (and b!211786 c!35732) b!211785))

(assert (= (and b!211786 (not c!35732)) b!211789))

(assert (= (or b!211785 b!211789) bm!20040))

(declare-fun m!239549 () Bool)

(assert (=> bm!20040 m!239549))

(declare-fun m!239551 () Bool)

(assert (=> bm!20040 m!239551))

(assert (=> b!211786 m!239549))

(assert (=> b!211786 m!239549))

(declare-fun m!239553 () Bool)

(assert (=> b!211786 m!239553))

(assert (=> b!211787 m!239549))

(assert (=> b!211787 m!239549))

(declare-fun m!239555 () Bool)

(assert (=> b!211787 m!239555))

(assert (=> b!211788 m!239549))

(assert (=> b!211788 m!239549))

(assert (=> b!211788 m!239553))

(assert (=> b!211729 d!58073))

(declare-fun d!58075 () Bool)

(declare-fun e!137836 () Bool)

(assert (=> d!58075 e!137836))

(declare-fun res!103490 () Bool)

(assert (=> d!58075 (=> (not res!103490) (not e!137836))))

(declare-fun lt!108960 () ListLongMap!3099)

(assert (=> d!58075 (= res!103490 (contains!1407 lt!108960 (_1!2104 lt!108921)))))

(declare-fun lt!108959 () List!3076)

(assert (=> d!58075 (= lt!108960 (ListLongMap!3100 lt!108959))))

(declare-fun lt!108962 () Unit!6428)

(declare-fun lt!108961 () Unit!6428)

(assert (=> d!58075 (= lt!108962 lt!108961)))

(assert (=> d!58075 (= (getValueByKey!253 lt!108959 (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921)))))

(assert (=> d!58075 (= lt!108961 (lemmaContainsTupThenGetReturnValue!140 lt!108959 (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(assert (=> d!58075 (= lt!108959 (insertStrictlySorted!143 (toList!1565 lt!108917) (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(assert (=> d!58075 (= (+!568 lt!108917 lt!108921) lt!108960)))

(declare-fun b!211790 () Bool)

(declare-fun res!103489 () Bool)

(assert (=> b!211790 (=> (not res!103489) (not e!137836))))

(assert (=> b!211790 (= res!103489 (= (getValueByKey!253 (toList!1565 lt!108960) (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921))))))

(declare-fun b!211791 () Bool)

(assert (=> b!211791 (= e!137836 (contains!1408 (toList!1565 lt!108960) lt!108921))))

(assert (= (and d!58075 res!103490) b!211790))

(assert (= (and b!211790 res!103489) b!211791))

(declare-fun m!239557 () Bool)

(assert (=> d!58075 m!239557))

(declare-fun m!239559 () Bool)

(assert (=> d!58075 m!239559))

(declare-fun m!239561 () Bool)

(assert (=> d!58075 m!239561))

(declare-fun m!239563 () Bool)

(assert (=> d!58075 m!239563))

(declare-fun m!239565 () Bool)

(assert (=> b!211790 m!239565))

(declare-fun m!239567 () Bool)

(assert (=> b!211791 m!239567))

(assert (=> b!211721 d!58075))

(declare-fun bm!20043 () Bool)

(declare-fun call!20046 () ListLongMap!3099)

(assert (=> bm!20043 (= call!20046 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211816 () Bool)

(declare-fun e!137852 () Bool)

(declare-fun e!137857 () Bool)

(assert (=> b!211816 (= e!137852 e!137857)))

(assert (=> b!211816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun res!103499 () Bool)

(declare-fun lt!108979 () ListLongMap!3099)

(assert (=> b!211816 (= res!103499 (contains!1407 lt!108979 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211816 (=> (not res!103499) (not e!137857))))

(declare-fun b!211818 () Bool)

(declare-fun e!137856 () Bool)

(assert (=> b!211818 (= e!137852 e!137856)))

(declare-fun c!35742 () Bool)

(assert (=> b!211818 (= c!35742 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211819 () Bool)

(declare-fun res!103500 () Bool)

(declare-fun e!137855 () Bool)

(assert (=> b!211819 (=> (not res!103500) (not e!137855))))

(assert (=> b!211819 (= res!103500 (not (contains!1407 lt!108979 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211820 () Bool)

(declare-fun e!137853 () Bool)

(assert (=> b!211820 (= e!137853 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211820 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211821 () Bool)

(declare-fun e!137854 () ListLongMap!3099)

(assert (=> b!211821 (= e!137854 (ListLongMap!3100 Nil!3073))))

(declare-fun b!211822 () Bool)

(declare-fun e!137851 () ListLongMap!3099)

(assert (=> b!211822 (= e!137851 call!20046)))

(declare-fun b!211823 () Bool)

(assert (=> b!211823 (= e!137855 e!137852)))

(declare-fun c!35743 () Bool)

(assert (=> b!211823 (= c!35743 e!137853)))

(declare-fun res!103502 () Bool)

(assert (=> b!211823 (=> (not res!103502) (not e!137853))))

(assert (=> b!211823 (= res!103502 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211824 () Bool)

(declare-fun lt!108982 () Unit!6428)

(declare-fun lt!108980 () Unit!6428)

(assert (=> b!211824 (= lt!108982 lt!108980)))

(declare-fun lt!108978 () (_ BitVec 64))

(declare-fun lt!108977 () ListLongMap!3099)

(declare-fun lt!108981 () (_ BitVec 64))

(declare-fun lt!108983 () V!6907)

(assert (=> b!211824 (not (contains!1407 (+!568 lt!108977 (tuple2!4187 lt!108981 lt!108983)) lt!108978))))

(declare-fun addStillNotContains!104 (ListLongMap!3099 (_ BitVec 64) V!6907 (_ BitVec 64)) Unit!6428)

(assert (=> b!211824 (= lt!108980 (addStillNotContains!104 lt!108977 lt!108981 lt!108983 lt!108978))))

(assert (=> b!211824 (= lt!108978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2565 (ValueCell!2379 V!6907) V!6907)

(declare-fun dynLambda!538 (Int (_ BitVec 64)) V!6907)

(assert (=> b!211824 (= lt!108983 (get!2565 (select (arr!4790 lt!108918) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211824 (= lt!108981 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211824 (= lt!108977 call!20046)))

(assert (=> b!211824 (= e!137851 (+!568 call!20046 (tuple2!4187 (select (arr!4791 _keys!825) #b00000000000000000000000000000000) (get!2565 (select (arr!4790 lt!108918) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211825 () Bool)

(assert (=> b!211825 (= e!137854 e!137851)))

(declare-fun c!35744 () Bool)

(assert (=> b!211825 (= c!35744 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58077 () Bool)

(assert (=> d!58077 e!137855))

(declare-fun res!103501 () Bool)

(assert (=> d!58077 (=> (not res!103501) (not e!137855))))

(assert (=> d!58077 (= res!103501 (not (contains!1407 lt!108979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58077 (= lt!108979 e!137854)))

(declare-fun c!35741 () Bool)

(assert (=> d!58077 (= c!35741 (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58077 (validMask!0 mask!1149)))

(assert (=> d!58077 (= (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108979)))

(declare-fun b!211817 () Bool)

(assert (=> b!211817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> b!211817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5115 lt!108918)))))

(declare-fun apply!195 (ListLongMap!3099 (_ BitVec 64)) V!6907)

(assert (=> b!211817 (= e!137857 (= (apply!195 lt!108979 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)) (get!2565 (select (arr!4790 lt!108918) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211826 () Bool)

(assert (=> b!211826 (= e!137856 (= lt!108979 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211827 () Bool)

(declare-fun isEmpty!496 (ListLongMap!3099) Bool)

(assert (=> b!211827 (= e!137856 (isEmpty!496 lt!108979))))

(assert (= (and d!58077 c!35741) b!211821))

(assert (= (and d!58077 (not c!35741)) b!211825))

(assert (= (and b!211825 c!35744) b!211824))

(assert (= (and b!211825 (not c!35744)) b!211822))

(assert (= (or b!211824 b!211822) bm!20043))

(assert (= (and d!58077 res!103501) b!211819))

(assert (= (and b!211819 res!103500) b!211823))

(assert (= (and b!211823 res!103502) b!211820))

(assert (= (and b!211823 c!35743) b!211816))

(assert (= (and b!211823 (not c!35743)) b!211818))

(assert (= (and b!211816 res!103499) b!211817))

(assert (= (and b!211818 c!35742) b!211826))

(assert (= (and b!211818 (not c!35742)) b!211827))

(declare-fun b_lambda!7683 () Bool)

(assert (=> (not b_lambda!7683) (not b!211824)))

(declare-fun t!8023 () Bool)

(declare-fun tb!2903 () Bool)

(assert (=> (and start!21052 (= defaultEntry!657 defaultEntry!657) t!8023) tb!2903))

(declare-fun result!4997 () Bool)

(assert (=> tb!2903 (= result!4997 tp_is_empty!5445)))

(assert (=> b!211824 t!8023))

(declare-fun b_and!12405 () Bool)

(assert (= b_and!12401 (and (=> t!8023 result!4997) b_and!12405)))

(declare-fun b_lambda!7685 () Bool)

(assert (=> (not b_lambda!7685) (not b!211817)))

(assert (=> b!211817 t!8023))

(declare-fun b_and!12407 () Bool)

(assert (= b_and!12405 (and (=> t!8023 result!4997) b_and!12407)))

(declare-fun m!239569 () Bool)

(assert (=> bm!20043 m!239569))

(assert (=> b!211825 m!239549))

(assert (=> b!211825 m!239549))

(assert (=> b!211825 m!239553))

(declare-fun m!239571 () Bool)

(assert (=> b!211819 m!239571))

(assert (=> b!211826 m!239569))

(assert (=> b!211817 m!239549))

(declare-fun m!239573 () Bool)

(assert (=> b!211817 m!239573))

(assert (=> b!211817 m!239549))

(declare-fun m!239575 () Bool)

(assert (=> b!211817 m!239575))

(assert (=> b!211817 m!239573))

(declare-fun m!239577 () Bool)

(assert (=> b!211817 m!239577))

(declare-fun m!239579 () Bool)

(assert (=> b!211817 m!239579))

(assert (=> b!211817 m!239577))

(assert (=> b!211816 m!239549))

(assert (=> b!211816 m!239549))

(declare-fun m!239581 () Bool)

(assert (=> b!211816 m!239581))

(assert (=> b!211820 m!239549))

(assert (=> b!211820 m!239549))

(assert (=> b!211820 m!239553))

(declare-fun m!239583 () Bool)

(assert (=> d!58077 m!239583))

(assert (=> d!58077 m!239469))

(declare-fun m!239585 () Bool)

(assert (=> b!211824 m!239585))

(assert (=> b!211824 m!239549))

(declare-fun m!239587 () Bool)

(assert (=> b!211824 m!239587))

(declare-fun m!239589 () Bool)

(assert (=> b!211824 m!239589))

(assert (=> b!211824 m!239573))

(assert (=> b!211824 m!239573))

(assert (=> b!211824 m!239577))

(assert (=> b!211824 m!239579))

(assert (=> b!211824 m!239585))

(declare-fun m!239591 () Bool)

(assert (=> b!211824 m!239591))

(assert (=> b!211824 m!239577))

(declare-fun m!239593 () Bool)

(assert (=> b!211827 m!239593))

(assert (=> b!211726 d!58077))

(declare-fun bm!20044 () Bool)

(declare-fun call!20047 () ListLongMap!3099)

(assert (=> bm!20044 (= call!20047 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211830 () Bool)

(declare-fun e!137859 () Bool)

(declare-fun e!137864 () Bool)

(assert (=> b!211830 (= e!137859 e!137864)))

(assert (=> b!211830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun res!103503 () Bool)

(declare-fun lt!108986 () ListLongMap!3099)

(assert (=> b!211830 (= res!103503 (contains!1407 lt!108986 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211830 (=> (not res!103503) (not e!137864))))

(declare-fun b!211832 () Bool)

(declare-fun e!137863 () Bool)

(assert (=> b!211832 (= e!137859 e!137863)))

(declare-fun c!35746 () Bool)

(assert (=> b!211832 (= c!35746 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211833 () Bool)

(declare-fun res!103504 () Bool)

(declare-fun e!137862 () Bool)

(assert (=> b!211833 (=> (not res!103504) (not e!137862))))

(assert (=> b!211833 (= res!103504 (not (contains!1407 lt!108986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211834 () Bool)

(declare-fun e!137860 () Bool)

(assert (=> b!211834 (= e!137860 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211834 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211835 () Bool)

(declare-fun e!137861 () ListLongMap!3099)

(assert (=> b!211835 (= e!137861 (ListLongMap!3100 Nil!3073))))

(declare-fun b!211836 () Bool)

(declare-fun e!137858 () ListLongMap!3099)

(assert (=> b!211836 (= e!137858 call!20047)))

(declare-fun b!211837 () Bool)

(assert (=> b!211837 (= e!137862 e!137859)))

(declare-fun c!35747 () Bool)

(assert (=> b!211837 (= c!35747 e!137860)))

(declare-fun res!103506 () Bool)

(assert (=> b!211837 (=> (not res!103506) (not e!137860))))

(assert (=> b!211837 (= res!103506 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211838 () Bool)

(declare-fun lt!108989 () Unit!6428)

(declare-fun lt!108987 () Unit!6428)

(assert (=> b!211838 (= lt!108989 lt!108987)))

(declare-fun lt!108985 () (_ BitVec 64))

(declare-fun lt!108988 () (_ BitVec 64))

(declare-fun lt!108990 () V!6907)

(declare-fun lt!108984 () ListLongMap!3099)

(assert (=> b!211838 (not (contains!1407 (+!568 lt!108984 (tuple2!4187 lt!108988 lt!108990)) lt!108985))))

(assert (=> b!211838 (= lt!108987 (addStillNotContains!104 lt!108984 lt!108988 lt!108990 lt!108985))))

(assert (=> b!211838 (= lt!108985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211838 (= lt!108990 (get!2565 (select (arr!4790 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211838 (= lt!108988 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211838 (= lt!108984 call!20047)))

(assert (=> b!211838 (= e!137858 (+!568 call!20047 (tuple2!4187 (select (arr!4791 _keys!825) #b00000000000000000000000000000000) (get!2565 (select (arr!4790 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211839 () Bool)

(assert (=> b!211839 (= e!137861 e!137858)))

(declare-fun c!35748 () Bool)

(assert (=> b!211839 (= c!35748 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58079 () Bool)

(assert (=> d!58079 e!137862))

(declare-fun res!103505 () Bool)

(assert (=> d!58079 (=> (not res!103505) (not e!137862))))

(assert (=> d!58079 (= res!103505 (not (contains!1407 lt!108986 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58079 (= lt!108986 e!137861)))

(declare-fun c!35745 () Bool)

(assert (=> d!58079 (= c!35745 (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58079 (validMask!0 mask!1149)))

(assert (=> d!58079 (= (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108986)))

(declare-fun b!211831 () Bool)

(assert (=> b!211831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> b!211831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5115 _values!649)))))

(assert (=> b!211831 (= e!137864 (= (apply!195 lt!108986 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)) (get!2565 (select (arr!4790 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211840 () Bool)

(assert (=> b!211840 (= e!137863 (= lt!108986 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211841 () Bool)

(assert (=> b!211841 (= e!137863 (isEmpty!496 lt!108986))))

(assert (= (and d!58079 c!35745) b!211835))

(assert (= (and d!58079 (not c!35745)) b!211839))

(assert (= (and b!211839 c!35748) b!211838))

(assert (= (and b!211839 (not c!35748)) b!211836))

(assert (= (or b!211838 b!211836) bm!20044))

(assert (= (and d!58079 res!103505) b!211833))

(assert (= (and b!211833 res!103504) b!211837))

(assert (= (and b!211837 res!103506) b!211834))

(assert (= (and b!211837 c!35747) b!211830))

(assert (= (and b!211837 (not c!35747)) b!211832))

(assert (= (and b!211830 res!103503) b!211831))

(assert (= (and b!211832 c!35746) b!211840))

(assert (= (and b!211832 (not c!35746)) b!211841))

(declare-fun b_lambda!7687 () Bool)

(assert (=> (not b_lambda!7687) (not b!211838)))

(assert (=> b!211838 t!8023))

(declare-fun b_and!12409 () Bool)

(assert (= b_and!12407 (and (=> t!8023 result!4997) b_and!12409)))

(declare-fun b_lambda!7689 () Bool)

(assert (=> (not b_lambda!7689) (not b!211831)))

(assert (=> b!211831 t!8023))

(declare-fun b_and!12411 () Bool)

(assert (= b_and!12409 (and (=> t!8023 result!4997) b_and!12411)))

(declare-fun m!239595 () Bool)

(assert (=> bm!20044 m!239595))

(assert (=> b!211839 m!239549))

(assert (=> b!211839 m!239549))

(assert (=> b!211839 m!239553))

(declare-fun m!239597 () Bool)

(assert (=> b!211833 m!239597))

(assert (=> b!211840 m!239595))

(assert (=> b!211831 m!239549))

(declare-fun m!239599 () Bool)

(assert (=> b!211831 m!239599))

(assert (=> b!211831 m!239549))

(declare-fun m!239601 () Bool)

(assert (=> b!211831 m!239601))

(assert (=> b!211831 m!239599))

(assert (=> b!211831 m!239577))

(declare-fun m!239603 () Bool)

(assert (=> b!211831 m!239603))

(assert (=> b!211831 m!239577))

(assert (=> b!211830 m!239549))

(assert (=> b!211830 m!239549))

(declare-fun m!239605 () Bool)

(assert (=> b!211830 m!239605))

(assert (=> b!211834 m!239549))

(assert (=> b!211834 m!239549))

(assert (=> b!211834 m!239553))

(declare-fun m!239607 () Bool)

(assert (=> d!58079 m!239607))

(assert (=> d!58079 m!239469))

(declare-fun m!239609 () Bool)

(assert (=> b!211838 m!239609))

(assert (=> b!211838 m!239549))

(declare-fun m!239611 () Bool)

(assert (=> b!211838 m!239611))

(declare-fun m!239613 () Bool)

(assert (=> b!211838 m!239613))

(assert (=> b!211838 m!239599))

(assert (=> b!211838 m!239599))

(assert (=> b!211838 m!239577))

(assert (=> b!211838 m!239603))

(assert (=> b!211838 m!239609))

(declare-fun m!239615 () Bool)

(assert (=> b!211838 m!239615))

(assert (=> b!211838 m!239577))

(declare-fun m!239617 () Bool)

(assert (=> b!211841 m!239617))

(assert (=> b!211726 d!58079))

(declare-fun d!58081 () Bool)

(declare-fun e!137870 () Bool)

(assert (=> d!58081 e!137870))

(declare-fun res!103509 () Bool)

(assert (=> d!58081 (=> (not res!103509) (not e!137870))))

(assert (=> d!58081 (= res!103509 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5115 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5115 _values!649))))))))

(declare-fun lt!108993 () Unit!6428)

(declare-fun choose!1079 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6907 V!6907 (_ BitVec 32) (_ BitVec 64) V!6907 (_ BitVec 32) Int) Unit!6428)

(assert (=> d!58081 (= lt!108993 (choose!1079 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58081 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108993)))

(declare-fun call!20053 () ListLongMap!3099)

(declare-fun bm!20049 () Bool)

(assert (=> bm!20049 (= call!20053 (getCurrentListMapNoExtraKeys!500 _keys!825 (array!10092 (store (arr!4790 _values!649) i!601 (ValueCellFull!2379 v!520)) (size!5115 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun call!20052 () ListLongMap!3099)

(declare-fun e!137869 () Bool)

(declare-fun b!211848 () Bool)

(assert (=> b!211848 (= e!137869 (= call!20053 (+!568 call!20052 (tuple2!4187 k0!843 v!520))))))

(declare-fun b!211849 () Bool)

(assert (=> b!211849 (= e!137870 e!137869)))

(declare-fun c!35751 () Bool)

(assert (=> b!211849 (= c!35751 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!211850 () Bool)

(assert (=> b!211850 (= e!137869 (= call!20053 call!20052))))

(declare-fun bm!20050 () Bool)

(assert (=> bm!20050 (= call!20052 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58081 res!103509) b!211849))

(assert (= (and b!211849 c!35751) b!211848))

(assert (= (and b!211849 (not c!35751)) b!211850))

(assert (= (or b!211848 b!211850) bm!20049))

(assert (= (or b!211848 b!211850) bm!20050))

(declare-fun m!239619 () Bool)

(assert (=> d!58081 m!239619))

(assert (=> bm!20049 m!239485))

(declare-fun m!239621 () Bool)

(assert (=> bm!20049 m!239621))

(declare-fun m!239623 () Bool)

(assert (=> b!211848 m!239623))

(assert (=> bm!20050 m!239495))

(assert (=> b!211726 d!58081))

(declare-fun d!58083 () Bool)

(declare-fun e!137871 () Bool)

(assert (=> d!58083 e!137871))

(declare-fun res!103511 () Bool)

(assert (=> d!58083 (=> (not res!103511) (not e!137871))))

(declare-fun lt!108995 () ListLongMap!3099)

(assert (=> d!58083 (= res!103511 (contains!1407 lt!108995 (_1!2104 (tuple2!4187 k0!843 v!520))))))

(declare-fun lt!108994 () List!3076)

(assert (=> d!58083 (= lt!108995 (ListLongMap!3100 lt!108994))))

(declare-fun lt!108997 () Unit!6428)

(declare-fun lt!108996 () Unit!6428)

(assert (=> d!58083 (= lt!108997 lt!108996)))

(assert (=> d!58083 (= (getValueByKey!253 lt!108994 (_1!2104 (tuple2!4187 k0!843 v!520))) (Some!258 (_2!2104 (tuple2!4187 k0!843 v!520))))))

(assert (=> d!58083 (= lt!108996 (lemmaContainsTupThenGetReturnValue!140 lt!108994 (_1!2104 (tuple2!4187 k0!843 v!520)) (_2!2104 (tuple2!4187 k0!843 v!520))))))

(assert (=> d!58083 (= lt!108994 (insertStrictlySorted!143 (toList!1565 lt!108922) (_1!2104 (tuple2!4187 k0!843 v!520)) (_2!2104 (tuple2!4187 k0!843 v!520))))))

(assert (=> d!58083 (= (+!568 lt!108922 (tuple2!4187 k0!843 v!520)) lt!108995)))

(declare-fun b!211851 () Bool)

(declare-fun res!103510 () Bool)

(assert (=> b!211851 (=> (not res!103510) (not e!137871))))

(assert (=> b!211851 (= res!103510 (= (getValueByKey!253 (toList!1565 lt!108995) (_1!2104 (tuple2!4187 k0!843 v!520))) (Some!258 (_2!2104 (tuple2!4187 k0!843 v!520)))))))

(declare-fun b!211852 () Bool)

(assert (=> b!211852 (= e!137871 (contains!1408 (toList!1565 lt!108995) (tuple2!4187 k0!843 v!520)))))

(assert (= (and d!58083 res!103511) b!211851))

(assert (= (and b!211851 res!103510) b!211852))

(declare-fun m!239625 () Bool)

(assert (=> d!58083 m!239625))

(declare-fun m!239627 () Bool)

(assert (=> d!58083 m!239627))

(declare-fun m!239629 () Bool)

(assert (=> d!58083 m!239629))

(declare-fun m!239631 () Bool)

(assert (=> d!58083 m!239631))

(declare-fun m!239633 () Bool)

(assert (=> b!211851 m!239633))

(declare-fun m!239635 () Bool)

(assert (=> b!211852 m!239635))

(assert (=> b!211726 d!58083))

(declare-fun b!211895 () Bool)

(declare-fun e!137902 () Bool)

(declare-fun e!137905 () Bool)

(assert (=> b!211895 (= e!137902 e!137905)))

(declare-fun res!103537 () Bool)

(assert (=> b!211895 (=> (not res!103537) (not e!137905))))

(declare-fun lt!109049 () ListLongMap!3099)

(assert (=> b!211895 (= res!103537 (contains!1407 lt!109049 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211896 () Bool)

(declare-fun e!137906 () ListLongMap!3099)

(declare-fun e!137900 () ListLongMap!3099)

(assert (=> b!211896 (= e!137906 e!137900)))

(declare-fun c!35768 () Bool)

(assert (=> b!211896 (= c!35768 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211897 () Bool)

(declare-fun e!137910 () Bool)

(assert (=> b!211897 (= e!137910 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20065 () Bool)

(declare-fun call!20072 () Bool)

(assert (=> bm!20065 (= call!20072 (contains!1407 lt!109049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211898 () Bool)

(declare-fun e!137904 () Bool)

(declare-fun e!137907 () Bool)

(assert (=> b!211898 (= e!137904 e!137907)))

(declare-fun c!35767 () Bool)

(assert (=> b!211898 (= c!35767 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211899 () Bool)

(declare-fun call!20069 () ListLongMap!3099)

(assert (=> b!211899 (= e!137906 (+!568 call!20069 (tuple2!4187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20066 () Bool)

(declare-fun call!20070 () ListLongMap!3099)

(declare-fun call!20074 () ListLongMap!3099)

(assert (=> bm!20066 (= call!20070 call!20074)))

(declare-fun b!211901 () Bool)

(declare-fun e!137903 () Bool)

(declare-fun e!137898 () Bool)

(assert (=> b!211901 (= e!137903 e!137898)))

(declare-fun res!103531 () Bool)

(assert (=> b!211901 (= res!103531 call!20072)))

(assert (=> b!211901 (=> (not res!103531) (not e!137898))))

(declare-fun bm!20067 () Bool)

(assert (=> bm!20067 (= call!20074 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211902 () Bool)

(assert (=> b!211902 (= e!137903 (not call!20072))))

(declare-fun b!211903 () Bool)

(declare-fun e!137908 () ListLongMap!3099)

(declare-fun call!20068 () ListLongMap!3099)

(assert (=> b!211903 (= e!137908 call!20068)))

(declare-fun b!211904 () Bool)

(declare-fun call!20073 () ListLongMap!3099)

(assert (=> b!211904 (= e!137900 call!20073)))

(declare-fun b!211905 () Bool)

(declare-fun c!35766 () Bool)

(assert (=> b!211905 (= c!35766 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211905 (= e!137900 e!137908)))

(declare-fun bm!20068 () Bool)

(declare-fun c!35764 () Bool)

(assert (=> bm!20068 (= call!20069 (+!568 (ite c!35764 call!20074 (ite c!35768 call!20070 call!20068)) (ite (or c!35764 c!35768) (tuple2!4187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211906 () Bool)

(declare-fun e!137899 () Bool)

(assert (=> b!211906 (= e!137899 (= (apply!195 lt!109049 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211907 () Bool)

(declare-fun res!103535 () Bool)

(assert (=> b!211907 (=> (not res!103535) (not e!137904))))

(assert (=> b!211907 (= res!103535 e!137902)))

(declare-fun res!103538 () Bool)

(assert (=> b!211907 (=> res!103538 e!137902)))

(assert (=> b!211907 (= res!103538 (not e!137910))))

(declare-fun res!103534 () Bool)

(assert (=> b!211907 (=> (not res!103534) (not e!137910))))

(assert (=> b!211907 (= res!103534 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun bm!20069 () Bool)

(declare-fun call!20071 () Bool)

(assert (=> bm!20069 (= call!20071 (contains!1407 lt!109049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58085 () Bool)

(assert (=> d!58085 e!137904))

(declare-fun res!103533 () Bool)

(assert (=> d!58085 (=> (not res!103533) (not e!137904))))

(assert (=> d!58085 (= res!103533 (or (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))))

(declare-fun lt!109043 () ListLongMap!3099)

(assert (=> d!58085 (= lt!109049 lt!109043)))

(declare-fun lt!109042 () Unit!6428)

(declare-fun e!137901 () Unit!6428)

(assert (=> d!58085 (= lt!109042 e!137901)))

(declare-fun c!35769 () Bool)

(declare-fun e!137909 () Bool)

(assert (=> d!58085 (= c!35769 e!137909)))

(declare-fun res!103530 () Bool)

(assert (=> d!58085 (=> (not res!103530) (not e!137909))))

(assert (=> d!58085 (= res!103530 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58085 (= lt!109043 e!137906)))

(assert (=> d!58085 (= c!35764 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58085 (validMask!0 mask!1149)))

(assert (=> d!58085 (= (getCurrentListMap!1098 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109049)))

(declare-fun b!211900 () Bool)

(assert (=> b!211900 (= e!137907 e!137899)))

(declare-fun res!103532 () Bool)

(assert (=> b!211900 (= res!103532 call!20071)))

(assert (=> b!211900 (=> (not res!103532) (not e!137899))))

(declare-fun bm!20070 () Bool)

(assert (=> bm!20070 (= call!20073 call!20069)))

(declare-fun bm!20071 () Bool)

(assert (=> bm!20071 (= call!20068 call!20070)))

(declare-fun b!211908 () Bool)

(assert (=> b!211908 (= e!137909 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211909 () Bool)

(declare-fun lt!109056 () Unit!6428)

(assert (=> b!211909 (= e!137901 lt!109056)))

(declare-fun lt!109054 () ListLongMap!3099)

(assert (=> b!211909 (= lt!109054 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109050 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109062 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109062 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109044 () Unit!6428)

(declare-fun addStillContains!171 (ListLongMap!3099 (_ BitVec 64) V!6907 (_ BitVec 64)) Unit!6428)

(assert (=> b!211909 (= lt!109044 (addStillContains!171 lt!109054 lt!109050 zeroValue!615 lt!109062))))

(assert (=> b!211909 (contains!1407 (+!568 lt!109054 (tuple2!4187 lt!109050 zeroValue!615)) lt!109062)))

(declare-fun lt!109053 () Unit!6428)

(assert (=> b!211909 (= lt!109053 lt!109044)))

(declare-fun lt!109046 () ListLongMap!3099)

(assert (=> b!211909 (= lt!109046 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109055 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109055 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109063 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109063 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109060 () Unit!6428)

(declare-fun addApplyDifferent!171 (ListLongMap!3099 (_ BitVec 64) V!6907 (_ BitVec 64)) Unit!6428)

(assert (=> b!211909 (= lt!109060 (addApplyDifferent!171 lt!109046 lt!109055 minValue!615 lt!109063))))

(assert (=> b!211909 (= (apply!195 (+!568 lt!109046 (tuple2!4187 lt!109055 minValue!615)) lt!109063) (apply!195 lt!109046 lt!109063))))

(declare-fun lt!109045 () Unit!6428)

(assert (=> b!211909 (= lt!109045 lt!109060)))

(declare-fun lt!109061 () ListLongMap!3099)

(assert (=> b!211909 (= lt!109061 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109059 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109057 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109057 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109058 () Unit!6428)

(assert (=> b!211909 (= lt!109058 (addApplyDifferent!171 lt!109061 lt!109059 zeroValue!615 lt!109057))))

(assert (=> b!211909 (= (apply!195 (+!568 lt!109061 (tuple2!4187 lt!109059 zeroValue!615)) lt!109057) (apply!195 lt!109061 lt!109057))))

(declare-fun lt!109047 () Unit!6428)

(assert (=> b!211909 (= lt!109047 lt!109058)))

(declare-fun lt!109051 () ListLongMap!3099)

(assert (=> b!211909 (= lt!109051 (getCurrentListMapNoExtraKeys!500 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109052 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109048 () (_ BitVec 64))

(assert (=> b!211909 (= lt!109048 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211909 (= lt!109056 (addApplyDifferent!171 lt!109051 lt!109052 minValue!615 lt!109048))))

(assert (=> b!211909 (= (apply!195 (+!568 lt!109051 (tuple2!4187 lt!109052 minValue!615)) lt!109048) (apply!195 lt!109051 lt!109048))))

(declare-fun b!211910 () Bool)

(declare-fun Unit!6430 () Unit!6428)

(assert (=> b!211910 (= e!137901 Unit!6430)))

(declare-fun b!211911 () Bool)

(declare-fun res!103536 () Bool)

(assert (=> b!211911 (=> (not res!103536) (not e!137904))))

(assert (=> b!211911 (= res!103536 e!137903)))

(declare-fun c!35765 () Bool)

(assert (=> b!211911 (= c!35765 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211912 () Bool)

(assert (=> b!211912 (= e!137908 call!20073)))

(declare-fun b!211913 () Bool)

(assert (=> b!211913 (= e!137905 (= (apply!195 lt!109049 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)) (get!2565 (select (arr!4790 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5115 _values!649)))))

(assert (=> b!211913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211914 () Bool)

(assert (=> b!211914 (= e!137898 (= (apply!195 lt!109049 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211915 () Bool)

(assert (=> b!211915 (= e!137907 (not call!20071))))

(assert (= (and d!58085 c!35764) b!211899))

(assert (= (and d!58085 (not c!35764)) b!211896))

(assert (= (and b!211896 c!35768) b!211904))

(assert (= (and b!211896 (not c!35768)) b!211905))

(assert (= (and b!211905 c!35766) b!211912))

(assert (= (and b!211905 (not c!35766)) b!211903))

(assert (= (or b!211912 b!211903) bm!20071))

(assert (= (or b!211904 bm!20071) bm!20066))

(assert (= (or b!211904 b!211912) bm!20070))

(assert (= (or b!211899 bm!20066) bm!20067))

(assert (= (or b!211899 bm!20070) bm!20068))

(assert (= (and d!58085 res!103530) b!211908))

(assert (= (and d!58085 c!35769) b!211909))

(assert (= (and d!58085 (not c!35769)) b!211910))

(assert (= (and d!58085 res!103533) b!211907))

(assert (= (and b!211907 res!103534) b!211897))

(assert (= (and b!211907 (not res!103538)) b!211895))

(assert (= (and b!211895 res!103537) b!211913))

(assert (= (and b!211907 res!103535) b!211911))

(assert (= (and b!211911 c!35765) b!211901))

(assert (= (and b!211911 (not c!35765)) b!211902))

(assert (= (and b!211901 res!103531) b!211914))

(assert (= (or b!211901 b!211902) bm!20065))

(assert (= (and b!211911 res!103536) b!211898))

(assert (= (and b!211898 c!35767) b!211900))

(assert (= (and b!211898 (not c!35767)) b!211915))

(assert (= (and b!211900 res!103532) b!211906))

(assert (= (or b!211900 b!211915) bm!20069))

(declare-fun b_lambda!7691 () Bool)

(assert (=> (not b_lambda!7691) (not b!211913)))

(assert (=> b!211913 t!8023))

(declare-fun b_and!12413 () Bool)

(assert (= b_and!12411 (and (=> t!8023 result!4997) b_and!12413)))

(declare-fun m!239637 () Bool)

(assert (=> bm!20068 m!239637))

(assert (=> d!58085 m!239469))

(declare-fun m!239639 () Bool)

(assert (=> b!211899 m!239639))

(declare-fun m!239641 () Bool)

(assert (=> b!211909 m!239641))

(declare-fun m!239643 () Bool)

(assert (=> b!211909 m!239643))

(declare-fun m!239645 () Bool)

(assert (=> b!211909 m!239645))

(declare-fun m!239647 () Bool)

(assert (=> b!211909 m!239647))

(declare-fun m!239649 () Bool)

(assert (=> b!211909 m!239649))

(declare-fun m!239651 () Bool)

(assert (=> b!211909 m!239651))

(declare-fun m!239653 () Bool)

(assert (=> b!211909 m!239653))

(assert (=> b!211909 m!239649))

(declare-fun m!239655 () Bool)

(assert (=> b!211909 m!239655))

(declare-fun m!239657 () Bool)

(assert (=> b!211909 m!239657))

(assert (=> b!211909 m!239549))

(declare-fun m!239659 () Bool)

(assert (=> b!211909 m!239659))

(assert (=> b!211909 m!239495))

(declare-fun m!239661 () Bool)

(assert (=> b!211909 m!239661))

(assert (=> b!211909 m!239653))

(declare-fun m!239663 () Bool)

(assert (=> b!211909 m!239663))

(assert (=> b!211909 m!239645))

(declare-fun m!239665 () Bool)

(assert (=> b!211909 m!239665))

(assert (=> b!211909 m!239647))

(declare-fun m!239667 () Bool)

(assert (=> b!211909 m!239667))

(declare-fun m!239669 () Bool)

(assert (=> b!211909 m!239669))

(assert (=> b!211908 m!239549))

(assert (=> b!211908 m!239549))

(assert (=> b!211908 m!239553))

(declare-fun m!239671 () Bool)

(assert (=> bm!20069 m!239671))

(assert (=> bm!20067 m!239495))

(assert (=> b!211895 m!239549))

(assert (=> b!211895 m!239549))

(declare-fun m!239673 () Bool)

(assert (=> b!211895 m!239673))

(assert (=> b!211913 m!239549))

(declare-fun m!239675 () Bool)

(assert (=> b!211913 m!239675))

(assert (=> b!211913 m!239599))

(assert (=> b!211913 m!239599))

(assert (=> b!211913 m!239577))

(assert (=> b!211913 m!239603))

(assert (=> b!211913 m!239549))

(assert (=> b!211913 m!239577))

(declare-fun m!239677 () Bool)

(assert (=> b!211906 m!239677))

(assert (=> b!211897 m!239549))

(assert (=> b!211897 m!239549))

(assert (=> b!211897 m!239553))

(declare-fun m!239679 () Bool)

(assert (=> bm!20065 m!239679))

(declare-fun m!239681 () Bool)

(assert (=> b!211914 m!239681))

(assert (=> b!211726 d!58085))

(declare-fun b!211916 () Bool)

(declare-fun e!137915 () Bool)

(declare-fun e!137918 () Bool)

(assert (=> b!211916 (= e!137915 e!137918)))

(declare-fun res!103546 () Bool)

(assert (=> b!211916 (=> (not res!103546) (not e!137918))))

(declare-fun lt!109071 () ListLongMap!3099)

(assert (=> b!211916 (= res!103546 (contains!1407 lt!109071 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211917 () Bool)

(declare-fun e!137919 () ListLongMap!3099)

(declare-fun e!137913 () ListLongMap!3099)

(assert (=> b!211917 (= e!137919 e!137913)))

(declare-fun c!35774 () Bool)

(assert (=> b!211917 (= c!35774 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211918 () Bool)

(declare-fun e!137923 () Bool)

(assert (=> b!211918 (= e!137923 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20072 () Bool)

(declare-fun call!20079 () Bool)

(assert (=> bm!20072 (= call!20079 (contains!1407 lt!109071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211919 () Bool)

(declare-fun e!137917 () Bool)

(declare-fun e!137920 () Bool)

(assert (=> b!211919 (= e!137917 e!137920)))

(declare-fun c!35773 () Bool)

(assert (=> b!211919 (= c!35773 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211920 () Bool)

(declare-fun call!20076 () ListLongMap!3099)

(assert (=> b!211920 (= e!137919 (+!568 call!20076 (tuple2!4187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20073 () Bool)

(declare-fun call!20077 () ListLongMap!3099)

(declare-fun call!20081 () ListLongMap!3099)

(assert (=> bm!20073 (= call!20077 call!20081)))

(declare-fun b!211922 () Bool)

(declare-fun e!137916 () Bool)

(declare-fun e!137911 () Bool)

(assert (=> b!211922 (= e!137916 e!137911)))

(declare-fun res!103540 () Bool)

(assert (=> b!211922 (= res!103540 call!20079)))

(assert (=> b!211922 (=> (not res!103540) (not e!137911))))

(declare-fun bm!20074 () Bool)

(assert (=> bm!20074 (= call!20081 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211923 () Bool)

(assert (=> b!211923 (= e!137916 (not call!20079))))

(declare-fun b!211924 () Bool)

(declare-fun e!137921 () ListLongMap!3099)

(declare-fun call!20075 () ListLongMap!3099)

(assert (=> b!211924 (= e!137921 call!20075)))

(declare-fun b!211925 () Bool)

(declare-fun call!20080 () ListLongMap!3099)

(assert (=> b!211925 (= e!137913 call!20080)))

(declare-fun b!211926 () Bool)

(declare-fun c!35772 () Bool)

(assert (=> b!211926 (= c!35772 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211926 (= e!137913 e!137921)))

(declare-fun c!35770 () Bool)

(declare-fun bm!20075 () Bool)

(assert (=> bm!20075 (= call!20076 (+!568 (ite c!35770 call!20081 (ite c!35774 call!20077 call!20075)) (ite (or c!35770 c!35774) (tuple2!4187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211927 () Bool)

(declare-fun e!137912 () Bool)

(assert (=> b!211927 (= e!137912 (= (apply!195 lt!109071 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211928 () Bool)

(declare-fun res!103544 () Bool)

(assert (=> b!211928 (=> (not res!103544) (not e!137917))))

(assert (=> b!211928 (= res!103544 e!137915)))

(declare-fun res!103547 () Bool)

(assert (=> b!211928 (=> res!103547 e!137915)))

(assert (=> b!211928 (= res!103547 (not e!137923))))

(declare-fun res!103543 () Bool)

(assert (=> b!211928 (=> (not res!103543) (not e!137923))))

(assert (=> b!211928 (= res!103543 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun bm!20076 () Bool)

(declare-fun call!20078 () Bool)

(assert (=> bm!20076 (= call!20078 (contains!1407 lt!109071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58087 () Bool)

(assert (=> d!58087 e!137917))

(declare-fun res!103542 () Bool)

(assert (=> d!58087 (=> (not res!103542) (not e!137917))))

(assert (=> d!58087 (= res!103542 (or (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))))

(declare-fun lt!109065 () ListLongMap!3099)

(assert (=> d!58087 (= lt!109071 lt!109065)))

(declare-fun lt!109064 () Unit!6428)

(declare-fun e!137914 () Unit!6428)

(assert (=> d!58087 (= lt!109064 e!137914)))

(declare-fun c!35775 () Bool)

(declare-fun e!137922 () Bool)

(assert (=> d!58087 (= c!35775 e!137922)))

(declare-fun res!103539 () Bool)

(assert (=> d!58087 (=> (not res!103539) (not e!137922))))

(assert (=> d!58087 (= res!103539 (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58087 (= lt!109065 e!137919)))

(assert (=> d!58087 (= c!35770 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58087 (validMask!0 mask!1149)))

(assert (=> d!58087 (= (getCurrentListMap!1098 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109071)))

(declare-fun b!211921 () Bool)

(assert (=> b!211921 (= e!137920 e!137912)))

(declare-fun res!103541 () Bool)

(assert (=> b!211921 (= res!103541 call!20078)))

(assert (=> b!211921 (=> (not res!103541) (not e!137912))))

(declare-fun bm!20077 () Bool)

(assert (=> bm!20077 (= call!20080 call!20076)))

(declare-fun bm!20078 () Bool)

(assert (=> bm!20078 (= call!20075 call!20077)))

(declare-fun b!211929 () Bool)

(assert (=> b!211929 (= e!137922 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211930 () Bool)

(declare-fun lt!109078 () Unit!6428)

(assert (=> b!211930 (= e!137914 lt!109078)))

(declare-fun lt!109076 () ListLongMap!3099)

(assert (=> b!211930 (= lt!109076 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109072 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109084 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109084 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109066 () Unit!6428)

(assert (=> b!211930 (= lt!109066 (addStillContains!171 lt!109076 lt!109072 zeroValue!615 lt!109084))))

(assert (=> b!211930 (contains!1407 (+!568 lt!109076 (tuple2!4187 lt!109072 zeroValue!615)) lt!109084)))

(declare-fun lt!109075 () Unit!6428)

(assert (=> b!211930 (= lt!109075 lt!109066)))

(declare-fun lt!109068 () ListLongMap!3099)

(assert (=> b!211930 (= lt!109068 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109077 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109077 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109085 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109085 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109082 () Unit!6428)

(assert (=> b!211930 (= lt!109082 (addApplyDifferent!171 lt!109068 lt!109077 minValue!615 lt!109085))))

(assert (=> b!211930 (= (apply!195 (+!568 lt!109068 (tuple2!4187 lt!109077 minValue!615)) lt!109085) (apply!195 lt!109068 lt!109085))))

(declare-fun lt!109067 () Unit!6428)

(assert (=> b!211930 (= lt!109067 lt!109082)))

(declare-fun lt!109083 () ListLongMap!3099)

(assert (=> b!211930 (= lt!109083 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109081 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109079 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109079 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109080 () Unit!6428)

(assert (=> b!211930 (= lt!109080 (addApplyDifferent!171 lt!109083 lt!109081 zeroValue!615 lt!109079))))

(assert (=> b!211930 (= (apply!195 (+!568 lt!109083 (tuple2!4187 lt!109081 zeroValue!615)) lt!109079) (apply!195 lt!109083 lt!109079))))

(declare-fun lt!109069 () Unit!6428)

(assert (=> b!211930 (= lt!109069 lt!109080)))

(declare-fun lt!109073 () ListLongMap!3099)

(assert (=> b!211930 (= lt!109073 (getCurrentListMapNoExtraKeys!500 _keys!825 lt!108918 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109074 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109070 () (_ BitVec 64))

(assert (=> b!211930 (= lt!109070 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211930 (= lt!109078 (addApplyDifferent!171 lt!109073 lt!109074 minValue!615 lt!109070))))

(assert (=> b!211930 (= (apply!195 (+!568 lt!109073 (tuple2!4187 lt!109074 minValue!615)) lt!109070) (apply!195 lt!109073 lt!109070))))

(declare-fun b!211931 () Bool)

(declare-fun Unit!6431 () Unit!6428)

(assert (=> b!211931 (= e!137914 Unit!6431)))

(declare-fun b!211932 () Bool)

(declare-fun res!103545 () Bool)

(assert (=> b!211932 (=> (not res!103545) (not e!137917))))

(assert (=> b!211932 (= res!103545 e!137916)))

(declare-fun c!35771 () Bool)

(assert (=> b!211932 (= c!35771 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211933 () Bool)

(assert (=> b!211933 (= e!137921 call!20080)))

(declare-fun b!211934 () Bool)

(assert (=> b!211934 (= e!137918 (= (apply!195 lt!109071 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)) (get!2565 (select (arr!4790 lt!108918) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5115 lt!108918)))))

(assert (=> b!211934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(declare-fun b!211935 () Bool)

(assert (=> b!211935 (= e!137911 (= (apply!195 lt!109071 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211936 () Bool)

(assert (=> b!211936 (= e!137920 (not call!20078))))

(assert (= (and d!58087 c!35770) b!211920))

(assert (= (and d!58087 (not c!35770)) b!211917))

(assert (= (and b!211917 c!35774) b!211925))

(assert (= (and b!211917 (not c!35774)) b!211926))

(assert (= (and b!211926 c!35772) b!211933))

(assert (= (and b!211926 (not c!35772)) b!211924))

(assert (= (or b!211933 b!211924) bm!20078))

(assert (= (or b!211925 bm!20078) bm!20073))

(assert (= (or b!211925 b!211933) bm!20077))

(assert (= (or b!211920 bm!20073) bm!20074))

(assert (= (or b!211920 bm!20077) bm!20075))

(assert (= (and d!58087 res!103539) b!211929))

(assert (= (and d!58087 c!35775) b!211930))

(assert (= (and d!58087 (not c!35775)) b!211931))

(assert (= (and d!58087 res!103542) b!211928))

(assert (= (and b!211928 res!103543) b!211918))

(assert (= (and b!211928 (not res!103547)) b!211916))

(assert (= (and b!211916 res!103546) b!211934))

(assert (= (and b!211928 res!103544) b!211932))

(assert (= (and b!211932 c!35771) b!211922))

(assert (= (and b!211932 (not c!35771)) b!211923))

(assert (= (and b!211922 res!103540) b!211935))

(assert (= (or b!211922 b!211923) bm!20072))

(assert (= (and b!211932 res!103545) b!211919))

(assert (= (and b!211919 c!35773) b!211921))

(assert (= (and b!211919 (not c!35773)) b!211936))

(assert (= (and b!211921 res!103541) b!211927))

(assert (= (or b!211921 b!211936) bm!20076))

(declare-fun b_lambda!7693 () Bool)

(assert (=> (not b_lambda!7693) (not b!211934)))

(assert (=> b!211934 t!8023))

(declare-fun b_and!12415 () Bool)

(assert (= b_and!12413 (and (=> t!8023 result!4997) b_and!12415)))

(declare-fun m!239683 () Bool)

(assert (=> bm!20075 m!239683))

(assert (=> d!58087 m!239469))

(declare-fun m!239685 () Bool)

(assert (=> b!211920 m!239685))

(declare-fun m!239687 () Bool)

(assert (=> b!211930 m!239687))

(declare-fun m!239689 () Bool)

(assert (=> b!211930 m!239689))

(declare-fun m!239691 () Bool)

(assert (=> b!211930 m!239691))

(declare-fun m!239693 () Bool)

(assert (=> b!211930 m!239693))

(declare-fun m!239695 () Bool)

(assert (=> b!211930 m!239695))

(declare-fun m!239697 () Bool)

(assert (=> b!211930 m!239697))

(declare-fun m!239699 () Bool)

(assert (=> b!211930 m!239699))

(assert (=> b!211930 m!239695))

(declare-fun m!239701 () Bool)

(assert (=> b!211930 m!239701))

(declare-fun m!239703 () Bool)

(assert (=> b!211930 m!239703))

(assert (=> b!211930 m!239549))

(declare-fun m!239705 () Bool)

(assert (=> b!211930 m!239705))

(assert (=> b!211930 m!239491))

(declare-fun m!239707 () Bool)

(assert (=> b!211930 m!239707))

(assert (=> b!211930 m!239699))

(declare-fun m!239709 () Bool)

(assert (=> b!211930 m!239709))

(assert (=> b!211930 m!239691))

(declare-fun m!239711 () Bool)

(assert (=> b!211930 m!239711))

(assert (=> b!211930 m!239693))

(declare-fun m!239713 () Bool)

(assert (=> b!211930 m!239713))

(declare-fun m!239715 () Bool)

(assert (=> b!211930 m!239715))

(assert (=> b!211929 m!239549))

(assert (=> b!211929 m!239549))

(assert (=> b!211929 m!239553))

(declare-fun m!239717 () Bool)

(assert (=> bm!20076 m!239717))

(assert (=> bm!20074 m!239491))

(assert (=> b!211916 m!239549))

(assert (=> b!211916 m!239549))

(declare-fun m!239719 () Bool)

(assert (=> b!211916 m!239719))

(assert (=> b!211934 m!239549))

(declare-fun m!239721 () Bool)

(assert (=> b!211934 m!239721))

(assert (=> b!211934 m!239573))

(assert (=> b!211934 m!239573))

(assert (=> b!211934 m!239577))

(assert (=> b!211934 m!239579))

(assert (=> b!211934 m!239549))

(assert (=> b!211934 m!239577))

(declare-fun m!239723 () Bool)

(assert (=> b!211927 m!239723))

(assert (=> b!211918 m!239549))

(assert (=> b!211918 m!239549))

(assert (=> b!211918 m!239553))

(declare-fun m!239725 () Bool)

(assert (=> bm!20072 m!239725))

(declare-fun m!239727 () Bool)

(assert (=> b!211935 m!239727))

(assert (=> b!211726 d!58087))

(declare-fun d!58089 () Bool)

(declare-fun e!137924 () Bool)

(assert (=> d!58089 e!137924))

(declare-fun res!103549 () Bool)

(assert (=> d!58089 (=> (not res!103549) (not e!137924))))

(declare-fun lt!109087 () ListLongMap!3099)

(assert (=> d!58089 (= res!103549 (contains!1407 lt!109087 (_1!2104 lt!108921)))))

(declare-fun lt!109086 () List!3076)

(assert (=> d!58089 (= lt!109087 (ListLongMap!3100 lt!109086))))

(declare-fun lt!109089 () Unit!6428)

(declare-fun lt!109088 () Unit!6428)

(assert (=> d!58089 (= lt!109089 lt!109088)))

(assert (=> d!58089 (= (getValueByKey!253 lt!109086 (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921)))))

(assert (=> d!58089 (= lt!109088 (lemmaContainsTupThenGetReturnValue!140 lt!109086 (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(assert (=> d!58089 (= lt!109086 (insertStrictlySorted!143 (toList!1565 lt!108922) (_1!2104 lt!108921) (_2!2104 lt!108921)))))

(assert (=> d!58089 (= (+!568 lt!108922 lt!108921) lt!109087)))

(declare-fun b!211937 () Bool)

(declare-fun res!103548 () Bool)

(assert (=> b!211937 (=> (not res!103548) (not e!137924))))

(assert (=> b!211937 (= res!103548 (= (getValueByKey!253 (toList!1565 lt!109087) (_1!2104 lt!108921)) (Some!258 (_2!2104 lt!108921))))))

(declare-fun b!211938 () Bool)

(assert (=> b!211938 (= e!137924 (contains!1408 (toList!1565 lt!109087) lt!108921))))

(assert (= (and d!58089 res!103549) b!211937))

(assert (= (and b!211937 res!103548) b!211938))

(declare-fun m!239729 () Bool)

(assert (=> d!58089 m!239729))

(declare-fun m!239731 () Bool)

(assert (=> d!58089 m!239731))

(declare-fun m!239733 () Bool)

(assert (=> d!58089 m!239733))

(declare-fun m!239735 () Bool)

(assert (=> d!58089 m!239735))

(declare-fun m!239737 () Bool)

(assert (=> b!211937 m!239737))

(declare-fun m!239739 () Bool)

(assert (=> b!211938 m!239739))

(assert (=> b!211717 d!58089))

(declare-fun d!58091 () Bool)

(declare-fun res!103554 () Bool)

(declare-fun e!137932 () Bool)

(assert (=> d!58091 (=> res!103554 e!137932)))

(assert (=> d!58091 (= res!103554 (bvsge #b00000000000000000000000000000000 (size!5116 _keys!825)))))

(assert (=> d!58091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137932)))

(declare-fun b!211947 () Bool)

(declare-fun e!137933 () Bool)

(declare-fun e!137931 () Bool)

(assert (=> b!211947 (= e!137933 e!137931)))

(declare-fun lt!109097 () (_ BitVec 64))

(assert (=> b!211947 (= lt!109097 (select (arr!4791 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109098 () Unit!6428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10093 (_ BitVec 64) (_ BitVec 32)) Unit!6428)

(assert (=> b!211947 (= lt!109098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109097 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211947 (arrayContainsKey!0 _keys!825 lt!109097 #b00000000000000000000000000000000)))

(declare-fun lt!109096 () Unit!6428)

(assert (=> b!211947 (= lt!109096 lt!109098)))

(declare-fun res!103555 () Bool)

(declare-datatypes ((SeekEntryResult!710 0))(
  ( (MissingZero!710 (index!5010 (_ BitVec 32))) (Found!710 (index!5011 (_ BitVec 32))) (Intermediate!710 (undefined!1522 Bool) (index!5012 (_ BitVec 32)) (x!22126 (_ BitVec 32))) (Undefined!710) (MissingVacant!710 (index!5013 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10093 (_ BitVec 32)) SeekEntryResult!710)

(assert (=> b!211947 (= res!103555 (= (seekEntryOrOpen!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!710 #b00000000000000000000000000000000)))))

(assert (=> b!211947 (=> (not res!103555) (not e!137931))))

(declare-fun bm!20081 () Bool)

(declare-fun call!20084 () Bool)

(assert (=> bm!20081 (= call!20084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211948 () Bool)

(assert (=> b!211948 (= e!137933 call!20084)))

(declare-fun b!211949 () Bool)

(assert (=> b!211949 (= e!137931 call!20084)))

(declare-fun b!211950 () Bool)

(assert (=> b!211950 (= e!137932 e!137933)))

(declare-fun c!35778 () Bool)

(assert (=> b!211950 (= c!35778 (validKeyInArray!0 (select (arr!4791 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58091 (not res!103554)) b!211950))

(assert (= (and b!211950 c!35778) b!211947))

(assert (= (and b!211950 (not c!35778)) b!211948))

(assert (= (and b!211947 res!103555) b!211949))

(assert (= (or b!211949 b!211948) bm!20081))

(assert (=> b!211947 m!239549))

(declare-fun m!239741 () Bool)

(assert (=> b!211947 m!239741))

(declare-fun m!239743 () Bool)

(assert (=> b!211947 m!239743))

(assert (=> b!211947 m!239549))

(declare-fun m!239745 () Bool)

(assert (=> b!211947 m!239745))

(declare-fun m!239747 () Bool)

(assert (=> bm!20081 m!239747))

(assert (=> b!211950 m!239549))

(assert (=> b!211950 m!239549))

(assert (=> b!211950 m!239553))

(assert (=> b!211722 d!58091))

(declare-fun d!58093 () Bool)

(assert (=> d!58093 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21052 d!58093))

(declare-fun d!58095 () Bool)

(assert (=> d!58095 (= (array_inv!3171 _values!649) (bvsge (size!5115 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21052 d!58095))

(declare-fun d!58097 () Bool)

(assert (=> d!58097 (= (array_inv!3172 _keys!825) (bvsge (size!5116 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21052 d!58097))

(declare-fun d!58099 () Bool)

(assert (=> d!58099 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211728 d!58099))

(declare-fun b!211958 () Bool)

(declare-fun e!137939 () Bool)

(assert (=> b!211958 (= e!137939 tp_is_empty!5445)))

(declare-fun condMapEmpty!9260 () Bool)

(declare-fun mapDefault!9260 () ValueCell!2379)

(assert (=> mapNonEmpty!9254 (= condMapEmpty!9260 (= mapRest!9254 ((as const (Array (_ BitVec 32) ValueCell!2379)) mapDefault!9260)))))

(declare-fun mapRes!9260 () Bool)

(assert (=> mapNonEmpty!9254 (= tp!19808 (and e!137939 mapRes!9260))))

(declare-fun b!211957 () Bool)

(declare-fun e!137938 () Bool)

(assert (=> b!211957 (= e!137938 tp_is_empty!5445)))

(declare-fun mapNonEmpty!9260 () Bool)

(declare-fun tp!19817 () Bool)

(assert (=> mapNonEmpty!9260 (= mapRes!9260 (and tp!19817 e!137938))))

(declare-fun mapRest!9260 () (Array (_ BitVec 32) ValueCell!2379))

(declare-fun mapValue!9260 () ValueCell!2379)

(declare-fun mapKey!9260 () (_ BitVec 32))

(assert (=> mapNonEmpty!9260 (= mapRest!9254 (store mapRest!9260 mapKey!9260 mapValue!9260))))

(declare-fun mapIsEmpty!9260 () Bool)

(assert (=> mapIsEmpty!9260 mapRes!9260))

(assert (= (and mapNonEmpty!9254 condMapEmpty!9260) mapIsEmpty!9260))

(assert (= (and mapNonEmpty!9254 (not condMapEmpty!9260)) mapNonEmpty!9260))

(assert (= (and mapNonEmpty!9260 ((_ is ValueCellFull!2379) mapValue!9260)) b!211957))

(assert (= (and mapNonEmpty!9254 ((_ is ValueCellFull!2379) mapDefault!9260)) b!211958))

(declare-fun m!239749 () Bool)

(assert (=> mapNonEmpty!9260 m!239749))

(declare-fun b_lambda!7695 () Bool)

(assert (= b_lambda!7691 (or (and start!21052 b_free!5583) b_lambda!7695)))

(declare-fun b_lambda!7697 () Bool)

(assert (= b_lambda!7689 (or (and start!21052 b_free!5583) b_lambda!7697)))

(declare-fun b_lambda!7699 () Bool)

(assert (= b_lambda!7685 (or (and start!21052 b_free!5583) b_lambda!7699)))

(declare-fun b_lambda!7701 () Bool)

(assert (= b_lambda!7687 (or (and start!21052 b_free!5583) b_lambda!7701)))

(declare-fun b_lambda!7703 () Bool)

(assert (= b_lambda!7693 (or (and start!21052 b_free!5583) b_lambda!7703)))

(declare-fun b_lambda!7705 () Bool)

(assert (= b_lambda!7683 (or (and start!21052 b_free!5583) b_lambda!7705)))

(check-sat (not d!58077) (not bm!20040) (not bm!20067) (not b!211773) (not b!211787) (not b!211834) (not b!211839) (not bm!20076) (not b!211774) (not b_next!5583) (not mapNonEmpty!9260) (not bm!20068) (not b!211816) (not b!211913) (not b!211920) (not d!58085) (not d!58081) (not d!58079) (not b!211927) (not b!211897) (not b!211916) (not b!211838) b_and!12415 (not b!211848) (not b!211895) (not bm!20044) (not bm!20065) (not b_lambda!7703) (not b!211908) (not b_lambda!7695) (not b!211914) (not b!211950) (not b!211947) (not bm!20081) (not bm!20074) (not b!211930) (not b!211824) (not d!58089) (not b!211937) (not b!211935) (not b!211918) (not b!211831) (not b!211790) (not b!211788) (not b!211817) (not b!211840) (not b_lambda!7705) (not b!211934) (not b_lambda!7697) (not b!211830) (not b!211909) (not bm!20069) (not d!58087) (not b!211852) (not bm!20075) (not b!211786) (not b!211833) (not bm!20072) (not b!211938) (not b!211906) (not b!211899) (not d!58071) (not b!211820) (not b!211819) (not b!211825) (not b!211851) (not bm!20050) (not d!58075) (not bm!20049) (not bm!20043) (not b!211791) (not b!211929) (not b!211841) (not b!211827) (not b_lambda!7701) tp_is_empty!5445 (not b_lambda!7699) (not d!58083) (not b!211826))
(check-sat b_and!12415 (not b_next!5583))
