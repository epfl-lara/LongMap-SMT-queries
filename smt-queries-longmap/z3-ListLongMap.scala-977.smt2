; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21122 () Bool)

(assert start!21122)

(declare-fun b_free!5613 () Bool)

(declare-fun b_next!5613 () Bool)

(assert (=> start!21122 (= b_free!5613 (not b_next!5613))))

(declare-fun tp!19904 () Bool)

(declare-fun b_and!12455 () Bool)

(assert (=> start!21122 (= tp!19904 b_and!12455)))

(declare-fun b!212619 () Bool)

(declare-fun res!103985 () Bool)

(declare-fun e!138329 () Bool)

(assert (=> b!212619 (=> (not res!103985) (not e!138329))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10153 0))(
  ( (array!10154 (arr!4819 (Array (_ BitVec 32) (_ BitVec 64))) (size!5144 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10153)

(assert (=> b!212619 (= res!103985 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5144 _keys!825))))))

(declare-fun mapIsEmpty!9305 () Bool)

(declare-fun mapRes!9305 () Bool)

(assert (=> mapIsEmpty!9305 mapRes!9305))

(declare-fun b!212620 () Bool)

(declare-fun res!103988 () Bool)

(assert (=> b!212620 (=> (not res!103988) (not e!138329))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212620 (= res!103988 (validKeyInArray!0 k0!843))))

(declare-datatypes ((V!6947 0))(
  ( (V!6948 (val!2782 Int)) )
))
(declare-datatypes ((tuple2!4212 0))(
  ( (tuple2!4213 (_1!2117 (_ BitVec 64)) (_2!2117 V!6947)) )
))
(declare-datatypes ((List!3100 0))(
  ( (Nil!3097) (Cons!3096 (h!3738 tuple2!4212) (t!8047 List!3100)) )
))
(declare-datatypes ((ListLongMap!3125 0))(
  ( (ListLongMap!3126 (toList!1578 List!3100)) )
))
(declare-fun lt!109641 () ListLongMap!3125)

(declare-fun b!212621 () Bool)

(declare-fun e!138331 () Bool)

(declare-fun lt!109636 () tuple2!4212)

(declare-fun lt!109639 () ListLongMap!3125)

(declare-fun +!581 (ListLongMap!3125 tuple2!4212) ListLongMap!3125)

(assert (=> b!212621 (= e!138331 (= lt!109641 (+!581 lt!109639 lt!109636)))))

(declare-fun e!138330 () Bool)

(assert (=> b!212621 e!138330))

(declare-fun res!103991 () Bool)

(assert (=> b!212621 (=> (not res!103991) (not e!138330))))

(declare-fun lt!109638 () ListLongMap!3125)

(declare-fun lt!109637 () ListLongMap!3125)

(assert (=> b!212621 (= res!103991 (= lt!109637 (+!581 lt!109638 lt!109636)))))

(declare-fun minValue!615 () V!6947)

(assert (=> b!212621 (= lt!109636 (tuple2!4213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212622 () Bool)

(declare-fun res!103986 () Bool)

(assert (=> b!212622 (=> (not res!103986) (not e!138329))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10153 (_ BitVec 32)) Bool)

(assert (=> b!212622 (= res!103986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212623 () Bool)

(declare-fun res!103989 () Bool)

(assert (=> b!212623 (=> (not res!103989) (not e!138329))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2394 0))(
  ( (ValueCellFull!2394 (v!4784 V!6947)) (EmptyCell!2394) )
))
(declare-datatypes ((array!10155 0))(
  ( (array!10156 (arr!4820 (Array (_ BitVec 32) ValueCell!2394)) (size!5145 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10155)

(assert (=> b!212623 (= res!103989 (and (= (size!5145 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5144 _keys!825) (size!5145 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212624 () Bool)

(declare-fun e!138328 () Bool)

(declare-fun tp_is_empty!5475 () Bool)

(assert (=> b!212624 (= e!138328 tp_is_empty!5475)))

(declare-fun b!212625 () Bool)

(declare-fun e!138332 () Bool)

(assert (=> b!212625 (= e!138332 (and e!138328 mapRes!9305))))

(declare-fun condMapEmpty!9305 () Bool)

(declare-fun mapDefault!9305 () ValueCell!2394)

(assert (=> b!212625 (= condMapEmpty!9305 (= (arr!4820 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2394)) mapDefault!9305)))))

(declare-fun b!212626 () Bool)

(declare-fun res!103993 () Bool)

(assert (=> b!212626 (=> (not res!103993) (not e!138329))))

(assert (=> b!212626 (= res!103993 (= (select (arr!4819 _keys!825) i!601) k0!843))))

(declare-fun b!212627 () Bool)

(declare-fun lt!109634 () ListLongMap!3125)

(assert (=> b!212627 (= e!138330 (= lt!109637 (+!581 lt!109634 lt!109636)))))

(declare-fun res!103992 () Bool)

(assert (=> start!21122 (=> (not res!103992) (not e!138329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21122 (= res!103992 (validMask!0 mask!1149))))

(assert (=> start!21122 e!138329))

(declare-fun array_inv!3189 (array!10155) Bool)

(assert (=> start!21122 (and (array_inv!3189 _values!649) e!138332)))

(assert (=> start!21122 true))

(assert (=> start!21122 tp_is_empty!5475))

(declare-fun array_inv!3190 (array!10153) Bool)

(assert (=> start!21122 (array_inv!3190 _keys!825)))

(assert (=> start!21122 tp!19904))

(declare-fun b!212628 () Bool)

(assert (=> b!212628 (= e!138329 (not e!138331))))

(declare-fun res!103990 () Bool)

(assert (=> b!212628 (=> res!103990 e!138331)))

(assert (=> b!212628 (= res!103990 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6947)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1109 (array!10153 array!10155 (_ BitVec 32) (_ BitVec 32) V!6947 V!6947 (_ BitVec 32) Int) ListLongMap!3125)

(assert (=> b!212628 (= lt!109641 (getCurrentListMap!1109 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109635 () array!10155)

(assert (=> b!212628 (= lt!109637 (getCurrentListMap!1109 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212628 (and (= lt!109638 lt!109634) (= lt!109634 lt!109638))))

(declare-fun v!520 () V!6947)

(assert (=> b!212628 (= lt!109634 (+!581 lt!109639 (tuple2!4213 k0!843 v!520)))))

(declare-datatypes ((Unit!6454 0))(
  ( (Unit!6455) )
))
(declare-fun lt!109640 () Unit!6454)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 (array!10153 array!10155 (_ BitVec 32) (_ BitVec 32) V!6947 V!6947 (_ BitVec 32) (_ BitVec 64) V!6947 (_ BitVec 32) Int) Unit!6454)

(assert (=> b!212628 (= lt!109640 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!511 (array!10153 array!10155 (_ BitVec 32) (_ BitVec 32) V!6947 V!6947 (_ BitVec 32) Int) ListLongMap!3125)

(assert (=> b!212628 (= lt!109638 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212628 (= lt!109635 (array!10156 (store (arr!4820 _values!649) i!601 (ValueCellFull!2394 v!520)) (size!5145 _values!649)))))

(assert (=> b!212628 (= lt!109639 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212629 () Bool)

(declare-fun e!138327 () Bool)

(assert (=> b!212629 (= e!138327 tp_is_empty!5475)))

(declare-fun b!212630 () Bool)

(declare-fun res!103987 () Bool)

(assert (=> b!212630 (=> (not res!103987) (not e!138329))))

(declare-datatypes ((List!3101 0))(
  ( (Nil!3098) (Cons!3097 (h!3739 (_ BitVec 64)) (t!8048 List!3101)) )
))
(declare-fun arrayNoDuplicates!0 (array!10153 (_ BitVec 32) List!3101) Bool)

(assert (=> b!212630 (= res!103987 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3098))))

(declare-fun mapNonEmpty!9305 () Bool)

(declare-fun tp!19903 () Bool)

(assert (=> mapNonEmpty!9305 (= mapRes!9305 (and tp!19903 e!138327))))

(declare-fun mapRest!9305 () (Array (_ BitVec 32) ValueCell!2394))

(declare-fun mapValue!9305 () ValueCell!2394)

(declare-fun mapKey!9305 () (_ BitVec 32))

(assert (=> mapNonEmpty!9305 (= (arr!4820 _values!649) (store mapRest!9305 mapKey!9305 mapValue!9305))))

(assert (= (and start!21122 res!103992) b!212623))

(assert (= (and b!212623 res!103989) b!212622))

(assert (= (and b!212622 res!103986) b!212630))

(assert (= (and b!212630 res!103987) b!212619))

(assert (= (and b!212619 res!103985) b!212620))

(assert (= (and b!212620 res!103988) b!212626))

(assert (= (and b!212626 res!103993) b!212628))

(assert (= (and b!212628 (not res!103990)) b!212621))

(assert (= (and b!212621 res!103991) b!212627))

(assert (= (and b!212625 condMapEmpty!9305) mapIsEmpty!9305))

(assert (= (and b!212625 (not condMapEmpty!9305)) mapNonEmpty!9305))

(get-info :version)

(assert (= (and mapNonEmpty!9305 ((_ is ValueCellFull!2394) mapValue!9305)) b!212629))

(assert (= (and b!212625 ((_ is ValueCellFull!2394) mapDefault!9305)) b!212624))

(assert (= start!21122 b!212625))

(declare-fun m!240421 () Bool)

(assert (=> b!212621 m!240421))

(declare-fun m!240423 () Bool)

(assert (=> b!212621 m!240423))

(declare-fun m!240425 () Bool)

(assert (=> start!21122 m!240425))

(declare-fun m!240427 () Bool)

(assert (=> start!21122 m!240427))

(declare-fun m!240429 () Bool)

(assert (=> start!21122 m!240429))

(declare-fun m!240431 () Bool)

(assert (=> b!212622 m!240431))

(declare-fun m!240433 () Bool)

(assert (=> b!212627 m!240433))

(declare-fun m!240435 () Bool)

(assert (=> b!212620 m!240435))

(declare-fun m!240437 () Bool)

(assert (=> b!212628 m!240437))

(declare-fun m!240439 () Bool)

(assert (=> b!212628 m!240439))

(declare-fun m!240441 () Bool)

(assert (=> b!212628 m!240441))

(declare-fun m!240443 () Bool)

(assert (=> b!212628 m!240443))

(declare-fun m!240445 () Bool)

(assert (=> b!212628 m!240445))

(declare-fun m!240447 () Bool)

(assert (=> b!212628 m!240447))

(declare-fun m!240449 () Bool)

(assert (=> b!212628 m!240449))

(declare-fun m!240451 () Bool)

(assert (=> b!212626 m!240451))

(declare-fun m!240453 () Bool)

(assert (=> b!212630 m!240453))

(declare-fun m!240455 () Bool)

(assert (=> mapNonEmpty!9305 m!240455))

(check-sat (not mapNonEmpty!9305) tp_is_empty!5475 (not b!212620) (not start!21122) (not b_next!5613) b_and!12455 (not b!212628) (not b!212621) (not b!212622) (not b!212627) (not b!212630))
(check-sat b_and!12455 (not b_next!5613))
(get-model)

(declare-fun d!58137 () Bool)

(assert (=> d!58137 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212620 d!58137))

(declare-fun b!212677 () Bool)

(declare-fun e!138363 () Bool)

(declare-fun e!138365 () Bool)

(assert (=> b!212677 (= e!138363 e!138365)))

(declare-fun c!35830 () Bool)

(assert (=> b!212677 (= c!35830 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20128 () Bool)

(declare-fun call!20131 () Bool)

(assert (=> bm!20128 (= call!20131 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35830 (Cons!3097 (select (arr!4819 _keys!825) #b00000000000000000000000000000000) Nil!3098) Nil!3098)))))

(declare-fun b!212678 () Bool)

(declare-fun e!138364 () Bool)

(declare-fun contains!1413 (List!3101 (_ BitVec 64)) Bool)

(assert (=> b!212678 (= e!138364 (contains!1413 Nil!3098 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212679 () Bool)

(assert (=> b!212679 (= e!138365 call!20131)))

(declare-fun b!212680 () Bool)

(assert (=> b!212680 (= e!138365 call!20131)))

(declare-fun d!58139 () Bool)

(declare-fun res!104028 () Bool)

(declare-fun e!138362 () Bool)

(assert (=> d!58139 (=> res!104028 e!138362)))

(assert (=> d!58139 (= res!104028 (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> d!58139 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3098) e!138362)))

(declare-fun b!212681 () Bool)

(assert (=> b!212681 (= e!138362 e!138363)))

(declare-fun res!104027 () Bool)

(assert (=> b!212681 (=> (not res!104027) (not e!138363))))

(assert (=> b!212681 (= res!104027 (not e!138364))))

(declare-fun res!104029 () Bool)

(assert (=> b!212681 (=> (not res!104029) (not e!138364))))

(assert (=> b!212681 (= res!104029 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58139 (not res!104028)) b!212681))

(assert (= (and b!212681 res!104029) b!212678))

(assert (= (and b!212681 res!104027) b!212677))

(assert (= (and b!212677 c!35830) b!212679))

(assert (= (and b!212677 (not c!35830)) b!212680))

(assert (= (or b!212679 b!212680) bm!20128))

(declare-fun m!240493 () Bool)

(assert (=> b!212677 m!240493))

(assert (=> b!212677 m!240493))

(declare-fun m!240495 () Bool)

(assert (=> b!212677 m!240495))

(assert (=> bm!20128 m!240493))

(declare-fun m!240497 () Bool)

(assert (=> bm!20128 m!240497))

(assert (=> b!212678 m!240493))

(assert (=> b!212678 m!240493))

(declare-fun m!240499 () Bool)

(assert (=> b!212678 m!240499))

(assert (=> b!212681 m!240493))

(assert (=> b!212681 m!240493))

(assert (=> b!212681 m!240495))

(assert (=> b!212630 d!58139))

(declare-fun d!58141 () Bool)

(declare-fun e!138368 () Bool)

(assert (=> d!58141 e!138368))

(declare-fun res!104035 () Bool)

(assert (=> d!58141 (=> (not res!104035) (not e!138368))))

(declare-fun lt!109675 () ListLongMap!3125)

(declare-fun contains!1414 (ListLongMap!3125 (_ BitVec 64)) Bool)

(assert (=> d!58141 (= res!104035 (contains!1414 lt!109675 (_1!2117 lt!109636)))))

(declare-fun lt!109674 () List!3100)

(assert (=> d!58141 (= lt!109675 (ListLongMap!3126 lt!109674))))

(declare-fun lt!109676 () Unit!6454)

(declare-fun lt!109677 () Unit!6454)

(assert (=> d!58141 (= lt!109676 lt!109677)))

(declare-datatypes ((Option!261 0))(
  ( (Some!260 (v!4789 V!6947)) (None!259) )
))
(declare-fun getValueByKey!255 (List!3100 (_ BitVec 64)) Option!261)

(assert (=> d!58141 (= (getValueByKey!255 lt!109674 (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636)))))

(declare-fun lemmaContainsTupThenGetReturnValue!142 (List!3100 (_ BitVec 64) V!6947) Unit!6454)

(assert (=> d!58141 (= lt!109677 (lemmaContainsTupThenGetReturnValue!142 lt!109674 (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(declare-fun insertStrictlySorted!145 (List!3100 (_ BitVec 64) V!6947) List!3100)

(assert (=> d!58141 (= lt!109674 (insertStrictlySorted!145 (toList!1578 lt!109634) (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(assert (=> d!58141 (= (+!581 lt!109634 lt!109636) lt!109675)))

(declare-fun b!212686 () Bool)

(declare-fun res!104034 () Bool)

(assert (=> b!212686 (=> (not res!104034) (not e!138368))))

(assert (=> b!212686 (= res!104034 (= (getValueByKey!255 (toList!1578 lt!109675) (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636))))))

(declare-fun b!212687 () Bool)

(declare-fun contains!1415 (List!3100 tuple2!4212) Bool)

(assert (=> b!212687 (= e!138368 (contains!1415 (toList!1578 lt!109675) lt!109636))))

(assert (= (and d!58141 res!104035) b!212686))

(assert (= (and b!212686 res!104034) b!212687))

(declare-fun m!240501 () Bool)

(assert (=> d!58141 m!240501))

(declare-fun m!240503 () Bool)

(assert (=> d!58141 m!240503))

(declare-fun m!240505 () Bool)

(assert (=> d!58141 m!240505))

(declare-fun m!240507 () Bool)

(assert (=> d!58141 m!240507))

(declare-fun m!240509 () Bool)

(assert (=> b!212686 m!240509))

(declare-fun m!240511 () Bool)

(assert (=> b!212687 m!240511))

(assert (=> b!212627 d!58141))

(declare-fun d!58143 () Bool)

(declare-fun e!138369 () Bool)

(assert (=> d!58143 e!138369))

(declare-fun res!104037 () Bool)

(assert (=> d!58143 (=> (not res!104037) (not e!138369))))

(declare-fun lt!109679 () ListLongMap!3125)

(assert (=> d!58143 (= res!104037 (contains!1414 lt!109679 (_1!2117 lt!109636)))))

(declare-fun lt!109678 () List!3100)

(assert (=> d!58143 (= lt!109679 (ListLongMap!3126 lt!109678))))

(declare-fun lt!109680 () Unit!6454)

(declare-fun lt!109681 () Unit!6454)

(assert (=> d!58143 (= lt!109680 lt!109681)))

(assert (=> d!58143 (= (getValueByKey!255 lt!109678 (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636)))))

(assert (=> d!58143 (= lt!109681 (lemmaContainsTupThenGetReturnValue!142 lt!109678 (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(assert (=> d!58143 (= lt!109678 (insertStrictlySorted!145 (toList!1578 lt!109639) (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(assert (=> d!58143 (= (+!581 lt!109639 lt!109636) lt!109679)))

(declare-fun b!212688 () Bool)

(declare-fun res!104036 () Bool)

(assert (=> b!212688 (=> (not res!104036) (not e!138369))))

(assert (=> b!212688 (= res!104036 (= (getValueByKey!255 (toList!1578 lt!109679) (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636))))))

(declare-fun b!212689 () Bool)

(assert (=> b!212689 (= e!138369 (contains!1415 (toList!1578 lt!109679) lt!109636))))

(assert (= (and d!58143 res!104037) b!212688))

(assert (= (and b!212688 res!104036) b!212689))

(declare-fun m!240513 () Bool)

(assert (=> d!58143 m!240513))

(declare-fun m!240515 () Bool)

(assert (=> d!58143 m!240515))

(declare-fun m!240517 () Bool)

(assert (=> d!58143 m!240517))

(declare-fun m!240519 () Bool)

(assert (=> d!58143 m!240519))

(declare-fun m!240521 () Bool)

(assert (=> b!212688 m!240521))

(declare-fun m!240523 () Bool)

(assert (=> b!212689 m!240523))

(assert (=> b!212621 d!58143))

(declare-fun d!58145 () Bool)

(declare-fun e!138370 () Bool)

(assert (=> d!58145 e!138370))

(declare-fun res!104039 () Bool)

(assert (=> d!58145 (=> (not res!104039) (not e!138370))))

(declare-fun lt!109683 () ListLongMap!3125)

(assert (=> d!58145 (= res!104039 (contains!1414 lt!109683 (_1!2117 lt!109636)))))

(declare-fun lt!109682 () List!3100)

(assert (=> d!58145 (= lt!109683 (ListLongMap!3126 lt!109682))))

(declare-fun lt!109684 () Unit!6454)

(declare-fun lt!109685 () Unit!6454)

(assert (=> d!58145 (= lt!109684 lt!109685)))

(assert (=> d!58145 (= (getValueByKey!255 lt!109682 (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636)))))

(assert (=> d!58145 (= lt!109685 (lemmaContainsTupThenGetReturnValue!142 lt!109682 (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(assert (=> d!58145 (= lt!109682 (insertStrictlySorted!145 (toList!1578 lt!109638) (_1!2117 lt!109636) (_2!2117 lt!109636)))))

(assert (=> d!58145 (= (+!581 lt!109638 lt!109636) lt!109683)))

(declare-fun b!212690 () Bool)

(declare-fun res!104038 () Bool)

(assert (=> b!212690 (=> (not res!104038) (not e!138370))))

(assert (=> b!212690 (= res!104038 (= (getValueByKey!255 (toList!1578 lt!109683) (_1!2117 lt!109636)) (Some!260 (_2!2117 lt!109636))))))

(declare-fun b!212691 () Bool)

(assert (=> b!212691 (= e!138370 (contains!1415 (toList!1578 lt!109683) lt!109636))))

(assert (= (and d!58145 res!104039) b!212690))

(assert (= (and b!212690 res!104038) b!212691))

(declare-fun m!240525 () Bool)

(assert (=> d!58145 m!240525))

(declare-fun m!240527 () Bool)

(assert (=> d!58145 m!240527))

(declare-fun m!240529 () Bool)

(assert (=> d!58145 m!240529))

(declare-fun m!240531 () Bool)

(assert (=> d!58145 m!240531))

(declare-fun m!240533 () Bool)

(assert (=> b!212690 m!240533))

(declare-fun m!240535 () Bool)

(assert (=> b!212691 m!240535))

(assert (=> b!212621 d!58145))

(declare-fun d!58147 () Bool)

(declare-fun e!138371 () Bool)

(assert (=> d!58147 e!138371))

(declare-fun res!104041 () Bool)

(assert (=> d!58147 (=> (not res!104041) (not e!138371))))

(declare-fun lt!109687 () ListLongMap!3125)

(assert (=> d!58147 (= res!104041 (contains!1414 lt!109687 (_1!2117 (tuple2!4213 k0!843 v!520))))))

(declare-fun lt!109686 () List!3100)

(assert (=> d!58147 (= lt!109687 (ListLongMap!3126 lt!109686))))

(declare-fun lt!109688 () Unit!6454)

(declare-fun lt!109689 () Unit!6454)

(assert (=> d!58147 (= lt!109688 lt!109689)))

(assert (=> d!58147 (= (getValueByKey!255 lt!109686 (_1!2117 (tuple2!4213 k0!843 v!520))) (Some!260 (_2!2117 (tuple2!4213 k0!843 v!520))))))

(assert (=> d!58147 (= lt!109689 (lemmaContainsTupThenGetReturnValue!142 lt!109686 (_1!2117 (tuple2!4213 k0!843 v!520)) (_2!2117 (tuple2!4213 k0!843 v!520))))))

(assert (=> d!58147 (= lt!109686 (insertStrictlySorted!145 (toList!1578 lt!109639) (_1!2117 (tuple2!4213 k0!843 v!520)) (_2!2117 (tuple2!4213 k0!843 v!520))))))

(assert (=> d!58147 (= (+!581 lt!109639 (tuple2!4213 k0!843 v!520)) lt!109687)))

(declare-fun b!212692 () Bool)

(declare-fun res!104040 () Bool)

(assert (=> b!212692 (=> (not res!104040) (not e!138371))))

(assert (=> b!212692 (= res!104040 (= (getValueByKey!255 (toList!1578 lt!109687) (_1!2117 (tuple2!4213 k0!843 v!520))) (Some!260 (_2!2117 (tuple2!4213 k0!843 v!520)))))))

(declare-fun b!212693 () Bool)

(assert (=> b!212693 (= e!138371 (contains!1415 (toList!1578 lt!109687) (tuple2!4213 k0!843 v!520)))))

(assert (= (and d!58147 res!104041) b!212692))

(assert (= (and b!212692 res!104040) b!212693))

(declare-fun m!240537 () Bool)

(assert (=> d!58147 m!240537))

(declare-fun m!240539 () Bool)

(assert (=> d!58147 m!240539))

(declare-fun m!240541 () Bool)

(assert (=> d!58147 m!240541))

(declare-fun m!240543 () Bool)

(assert (=> d!58147 m!240543))

(declare-fun m!240545 () Bool)

(assert (=> b!212692 m!240545))

(declare-fun m!240547 () Bool)

(assert (=> b!212693 m!240547))

(assert (=> b!212628 d!58147))

(declare-fun b!212718 () Bool)

(declare-fun e!138386 () Bool)

(declare-fun lt!109704 () ListLongMap!3125)

(declare-fun isEmpty!498 (ListLongMap!3125) Bool)

(assert (=> b!212718 (= e!138386 (isEmpty!498 lt!109704))))

(declare-fun b!212719 () Bool)

(declare-fun e!138389 () ListLongMap!3125)

(declare-fun call!20134 () ListLongMap!3125)

(assert (=> b!212719 (= e!138389 call!20134)))

(declare-fun b!212720 () Bool)

(declare-fun e!138391 () ListLongMap!3125)

(assert (=> b!212720 (= e!138391 e!138389)))

(declare-fun c!35840 () Bool)

(assert (=> b!212720 (= c!35840 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58149 () Bool)

(declare-fun e!138392 () Bool)

(assert (=> d!58149 e!138392))

(declare-fun res!104053 () Bool)

(assert (=> d!58149 (=> (not res!104053) (not e!138392))))

(assert (=> d!58149 (= res!104053 (not (contains!1414 lt!109704 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58149 (= lt!109704 e!138391)))

(declare-fun c!35839 () Bool)

(assert (=> d!58149 (= c!35839 (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> d!58149 (validMask!0 mask!1149)))

(assert (=> d!58149 (= (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109704)))

(declare-fun b!212721 () Bool)

(declare-fun e!138388 () Bool)

(assert (=> b!212721 (= e!138392 e!138388)))

(declare-fun c!35841 () Bool)

(declare-fun e!138390 () Bool)

(assert (=> b!212721 (= c!35841 e!138390)))

(declare-fun res!104050 () Bool)

(assert (=> b!212721 (=> (not res!104050) (not e!138390))))

(assert (=> b!212721 (= res!104050 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212722 () Bool)

(assert (=> b!212722 (= e!138388 e!138386)))

(declare-fun c!35842 () Bool)

(assert (=> b!212722 (= c!35842 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212723 () Bool)

(declare-fun res!104052 () Bool)

(assert (=> b!212723 (=> (not res!104052) (not e!138392))))

(assert (=> b!212723 (= res!104052 (not (contains!1414 lt!109704 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212724 () Bool)

(declare-fun lt!109708 () Unit!6454)

(declare-fun lt!109705 () Unit!6454)

(assert (=> b!212724 (= lt!109708 lt!109705)))

(declare-fun lt!109709 () (_ BitVec 64))

(declare-fun lt!109707 () ListLongMap!3125)

(declare-fun lt!109710 () (_ BitVec 64))

(declare-fun lt!109706 () V!6947)

(assert (=> b!212724 (not (contains!1414 (+!581 lt!109707 (tuple2!4213 lt!109710 lt!109706)) lt!109709))))

(declare-fun addStillNotContains!106 (ListLongMap!3125 (_ BitVec 64) V!6947 (_ BitVec 64)) Unit!6454)

(assert (=> b!212724 (= lt!109705 (addStillNotContains!106 lt!109707 lt!109710 lt!109706 lt!109709))))

(assert (=> b!212724 (= lt!109709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2577 (ValueCell!2394 V!6947) V!6947)

(declare-fun dynLambda!540 (Int (_ BitVec 64)) V!6947)

(assert (=> b!212724 (= lt!109706 (get!2577 (select (arr!4820 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212724 (= lt!109710 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212724 (= lt!109707 call!20134)))

(assert (=> b!212724 (= e!138389 (+!581 call!20134 (tuple2!4213 (select (arr!4819 _keys!825) #b00000000000000000000000000000000) (get!2577 (select (arr!4820 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212725 () Bool)

(assert (=> b!212725 (= e!138386 (= lt!109704 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun bm!20131 () Bool)

(assert (=> bm!20131 (= call!20134 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212726 () Bool)

(assert (=> b!212726 (= e!138391 (ListLongMap!3126 Nil!3097))))

(declare-fun b!212727 () Bool)

(assert (=> b!212727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> b!212727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5145 _values!649)))))

(declare-fun e!138387 () Bool)

(declare-fun apply!197 (ListLongMap!3125 (_ BitVec 64)) V!6947)

(assert (=> b!212727 (= e!138387 (= (apply!197 lt!109704 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)) (get!2577 (select (arr!4820 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212728 () Bool)

(assert (=> b!212728 (= e!138388 e!138387)))

(assert (=> b!212728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun res!104051 () Bool)

(assert (=> b!212728 (= res!104051 (contains!1414 lt!109704 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212728 (=> (not res!104051) (not e!138387))))

(declare-fun b!212729 () Bool)

(assert (=> b!212729 (= e!138390 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212729 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58149 c!35839) b!212726))

(assert (= (and d!58149 (not c!35839)) b!212720))

(assert (= (and b!212720 c!35840) b!212724))

(assert (= (and b!212720 (not c!35840)) b!212719))

(assert (= (or b!212724 b!212719) bm!20131))

(assert (= (and d!58149 res!104053) b!212723))

(assert (= (and b!212723 res!104052) b!212721))

(assert (= (and b!212721 res!104050) b!212729))

(assert (= (and b!212721 c!35841) b!212728))

(assert (= (and b!212721 (not c!35841)) b!212722))

(assert (= (and b!212728 res!104051) b!212727))

(assert (= (and b!212722 c!35842) b!212725))

(assert (= (and b!212722 (not c!35842)) b!212718))

(declare-fun b_lambda!7731 () Bool)

(assert (=> (not b_lambda!7731) (not b!212724)))

(declare-fun t!8051 () Bool)

(declare-fun tb!2907 () Bool)

(assert (=> (and start!21122 (= defaultEntry!657 defaultEntry!657) t!8051) tb!2907))

(declare-fun result!5009 () Bool)

(assert (=> tb!2907 (= result!5009 tp_is_empty!5475)))

(assert (=> b!212724 t!8051))

(declare-fun b_and!12459 () Bool)

(assert (= b_and!12455 (and (=> t!8051 result!5009) b_and!12459)))

(declare-fun b_lambda!7733 () Bool)

(assert (=> (not b_lambda!7733) (not b!212727)))

(assert (=> b!212727 t!8051))

(declare-fun b_and!12461 () Bool)

(assert (= b_and!12459 (and (=> t!8051 result!5009) b_and!12461)))

(assert (=> b!212728 m!240493))

(assert (=> b!212728 m!240493))

(declare-fun m!240549 () Bool)

(assert (=> b!212728 m!240549))

(assert (=> b!212729 m!240493))

(assert (=> b!212729 m!240493))

(assert (=> b!212729 m!240495))

(declare-fun m!240551 () Bool)

(assert (=> b!212727 m!240551))

(declare-fun m!240553 () Bool)

(assert (=> b!212727 m!240553))

(declare-fun m!240555 () Bool)

(assert (=> b!212727 m!240555))

(assert (=> b!212727 m!240553))

(assert (=> b!212727 m!240551))

(assert (=> b!212727 m!240493))

(assert (=> b!212727 m!240493))

(declare-fun m!240557 () Bool)

(assert (=> b!212727 m!240557))

(declare-fun m!240559 () Bool)

(assert (=> b!212723 m!240559))

(declare-fun m!240561 () Bool)

(assert (=> b!212718 m!240561))

(declare-fun m!240563 () Bool)

(assert (=> b!212724 m!240563))

(declare-fun m!240565 () Bool)

(assert (=> b!212724 m!240565))

(assert (=> b!212724 m!240493))

(assert (=> b!212724 m!240551))

(assert (=> b!212724 m!240551))

(assert (=> b!212724 m!240553))

(assert (=> b!212724 m!240555))

(assert (=> b!212724 m!240565))

(declare-fun m!240567 () Bool)

(assert (=> b!212724 m!240567))

(assert (=> b!212724 m!240553))

(declare-fun m!240569 () Bool)

(assert (=> b!212724 m!240569))

(declare-fun m!240571 () Bool)

(assert (=> b!212725 m!240571))

(assert (=> b!212720 m!240493))

(assert (=> b!212720 m!240493))

(assert (=> b!212720 m!240495))

(assert (=> bm!20131 m!240571))

(declare-fun m!240573 () Bool)

(assert (=> d!58149 m!240573))

(assert (=> d!58149 m!240425))

(assert (=> b!212628 d!58149))

(declare-fun e!138398 () Bool)

(declare-fun b!212738 () Bool)

(declare-fun call!20139 () ListLongMap!3125)

(declare-fun call!20140 () ListLongMap!3125)

(assert (=> b!212738 (= e!138398 (= call!20139 (+!581 call!20140 (tuple2!4213 k0!843 v!520))))))

(declare-fun bm!20136 () Bool)

(assert (=> bm!20136 (= call!20139 (getCurrentListMapNoExtraKeys!511 _keys!825 (array!10156 (store (arr!4820 _values!649) i!601 (ValueCellFull!2394 v!520)) (size!5145 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58151 () Bool)

(declare-fun e!138397 () Bool)

(assert (=> d!58151 e!138397))

(declare-fun res!104056 () Bool)

(assert (=> d!58151 (=> (not res!104056) (not e!138397))))

(assert (=> d!58151 (= res!104056 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5145 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5145 _values!649))))))))

(declare-fun lt!109713 () Unit!6454)

(declare-fun choose!1081 (array!10153 array!10155 (_ BitVec 32) (_ BitVec 32) V!6947 V!6947 (_ BitVec 32) (_ BitVec 64) V!6947 (_ BitVec 32) Int) Unit!6454)

(assert (=> d!58151 (= lt!109713 (choose!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> d!58151 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109713)))

(declare-fun b!212739 () Bool)

(assert (=> b!212739 (= e!138397 e!138398)))

(declare-fun c!35845 () Bool)

(assert (=> b!212739 (= c!35845 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!212740 () Bool)

(assert (=> b!212740 (= e!138398 (= call!20139 call!20140))))

(declare-fun bm!20137 () Bool)

(assert (=> bm!20137 (= call!20140 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58151 res!104056) b!212739))

(assert (= (and b!212739 c!35845) b!212738))

(assert (= (and b!212739 (not c!35845)) b!212740))

(assert (= (or b!212738 b!212740) bm!20136))

(assert (= (or b!212738 b!212740) bm!20137))

(declare-fun m!240575 () Bool)

(assert (=> b!212738 m!240575))

(assert (=> bm!20136 m!240443))

(declare-fun m!240577 () Bool)

(assert (=> bm!20136 m!240577))

(declare-fun m!240579 () Bool)

(assert (=> d!58151 m!240579))

(assert (=> bm!20137 m!240441))

(assert (=> b!212628 d!58151))

(declare-fun b!212741 () Bool)

(declare-fun e!138399 () Bool)

(declare-fun lt!109714 () ListLongMap!3125)

(assert (=> b!212741 (= e!138399 (isEmpty!498 lt!109714))))

(declare-fun b!212742 () Bool)

(declare-fun e!138402 () ListLongMap!3125)

(declare-fun call!20141 () ListLongMap!3125)

(assert (=> b!212742 (= e!138402 call!20141)))

(declare-fun b!212743 () Bool)

(declare-fun e!138404 () ListLongMap!3125)

(assert (=> b!212743 (= e!138404 e!138402)))

(declare-fun c!35847 () Bool)

(assert (=> b!212743 (= c!35847 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58153 () Bool)

(declare-fun e!138405 () Bool)

(assert (=> d!58153 e!138405))

(declare-fun res!104060 () Bool)

(assert (=> d!58153 (=> (not res!104060) (not e!138405))))

(assert (=> d!58153 (= res!104060 (not (contains!1414 lt!109714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58153 (= lt!109714 e!138404)))

(declare-fun c!35846 () Bool)

(assert (=> d!58153 (= c!35846 (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> d!58153 (validMask!0 mask!1149)))

(assert (=> d!58153 (= (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109714)))

(declare-fun b!212744 () Bool)

(declare-fun e!138401 () Bool)

(assert (=> b!212744 (= e!138405 e!138401)))

(declare-fun c!35848 () Bool)

(declare-fun e!138403 () Bool)

(assert (=> b!212744 (= c!35848 e!138403)))

(declare-fun res!104057 () Bool)

(assert (=> b!212744 (=> (not res!104057) (not e!138403))))

(assert (=> b!212744 (= res!104057 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212745 () Bool)

(assert (=> b!212745 (= e!138401 e!138399)))

(declare-fun c!35849 () Bool)

(assert (=> b!212745 (= c!35849 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212746 () Bool)

(declare-fun res!104059 () Bool)

(assert (=> b!212746 (=> (not res!104059) (not e!138405))))

(assert (=> b!212746 (= res!104059 (not (contains!1414 lt!109714 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212747 () Bool)

(declare-fun lt!109718 () Unit!6454)

(declare-fun lt!109715 () Unit!6454)

(assert (=> b!212747 (= lt!109718 lt!109715)))

(declare-fun lt!109719 () (_ BitVec 64))

(declare-fun lt!109716 () V!6947)

(declare-fun lt!109720 () (_ BitVec 64))

(declare-fun lt!109717 () ListLongMap!3125)

(assert (=> b!212747 (not (contains!1414 (+!581 lt!109717 (tuple2!4213 lt!109720 lt!109716)) lt!109719))))

(assert (=> b!212747 (= lt!109715 (addStillNotContains!106 lt!109717 lt!109720 lt!109716 lt!109719))))

(assert (=> b!212747 (= lt!109719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212747 (= lt!109716 (get!2577 (select (arr!4820 lt!109635) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212747 (= lt!109720 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212747 (= lt!109717 call!20141)))

(assert (=> b!212747 (= e!138402 (+!581 call!20141 (tuple2!4213 (select (arr!4819 _keys!825) #b00000000000000000000000000000000) (get!2577 (select (arr!4820 lt!109635) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212748 () Bool)

(assert (=> b!212748 (= e!138399 (= lt!109714 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun bm!20138 () Bool)

(assert (=> bm!20138 (= call!20141 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212749 () Bool)

(assert (=> b!212749 (= e!138404 (ListLongMap!3126 Nil!3097))))

(declare-fun b!212750 () Bool)

(assert (=> b!212750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> b!212750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5145 lt!109635)))))

(declare-fun e!138400 () Bool)

(assert (=> b!212750 (= e!138400 (= (apply!197 lt!109714 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)) (get!2577 (select (arr!4820 lt!109635) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212751 () Bool)

(assert (=> b!212751 (= e!138401 e!138400)))

(assert (=> b!212751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun res!104058 () Bool)

(assert (=> b!212751 (= res!104058 (contains!1414 lt!109714 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212751 (=> (not res!104058) (not e!138400))))

(declare-fun b!212752 () Bool)

(assert (=> b!212752 (= e!138403 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212752 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58153 c!35846) b!212749))

(assert (= (and d!58153 (not c!35846)) b!212743))

(assert (= (and b!212743 c!35847) b!212747))

(assert (= (and b!212743 (not c!35847)) b!212742))

(assert (= (or b!212747 b!212742) bm!20138))

(assert (= (and d!58153 res!104060) b!212746))

(assert (= (and b!212746 res!104059) b!212744))

(assert (= (and b!212744 res!104057) b!212752))

(assert (= (and b!212744 c!35848) b!212751))

(assert (= (and b!212744 (not c!35848)) b!212745))

(assert (= (and b!212751 res!104058) b!212750))

(assert (= (and b!212745 c!35849) b!212748))

(assert (= (and b!212745 (not c!35849)) b!212741))

(declare-fun b_lambda!7735 () Bool)

(assert (=> (not b_lambda!7735) (not b!212747)))

(assert (=> b!212747 t!8051))

(declare-fun b_and!12463 () Bool)

(assert (= b_and!12461 (and (=> t!8051 result!5009) b_and!12463)))

(declare-fun b_lambda!7737 () Bool)

(assert (=> (not b_lambda!7737) (not b!212750)))

(assert (=> b!212750 t!8051))

(declare-fun b_and!12465 () Bool)

(assert (= b_and!12463 (and (=> t!8051 result!5009) b_and!12465)))

(assert (=> b!212751 m!240493))

(assert (=> b!212751 m!240493))

(declare-fun m!240581 () Bool)

(assert (=> b!212751 m!240581))

(assert (=> b!212752 m!240493))

(assert (=> b!212752 m!240493))

(assert (=> b!212752 m!240495))

(declare-fun m!240583 () Bool)

(assert (=> b!212750 m!240583))

(assert (=> b!212750 m!240553))

(declare-fun m!240585 () Bool)

(assert (=> b!212750 m!240585))

(assert (=> b!212750 m!240553))

(assert (=> b!212750 m!240583))

(assert (=> b!212750 m!240493))

(assert (=> b!212750 m!240493))

(declare-fun m!240587 () Bool)

(assert (=> b!212750 m!240587))

(declare-fun m!240589 () Bool)

(assert (=> b!212746 m!240589))

(declare-fun m!240591 () Bool)

(assert (=> b!212741 m!240591))

(declare-fun m!240593 () Bool)

(assert (=> b!212747 m!240593))

(declare-fun m!240595 () Bool)

(assert (=> b!212747 m!240595))

(assert (=> b!212747 m!240493))

(assert (=> b!212747 m!240583))

(assert (=> b!212747 m!240583))

(assert (=> b!212747 m!240553))

(assert (=> b!212747 m!240585))

(assert (=> b!212747 m!240595))

(declare-fun m!240597 () Bool)

(assert (=> b!212747 m!240597))

(assert (=> b!212747 m!240553))

(declare-fun m!240599 () Bool)

(assert (=> b!212747 m!240599))

(declare-fun m!240601 () Bool)

(assert (=> b!212748 m!240601))

(assert (=> b!212743 m!240493))

(assert (=> b!212743 m!240493))

(assert (=> b!212743 m!240495))

(assert (=> bm!20138 m!240601))

(declare-fun m!240603 () Bool)

(assert (=> d!58153 m!240603))

(assert (=> d!58153 m!240425))

(assert (=> b!212628 d!58153))

(declare-fun b!212795 () Bool)

(declare-fun e!138440 () Unit!6454)

(declare-fun lt!109767 () Unit!6454)

(assert (=> b!212795 (= e!138440 lt!109767)))

(declare-fun lt!109771 () ListLongMap!3125)

(assert (=> b!212795 (= lt!109771 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109777 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109786 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109786 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109773 () Unit!6454)

(declare-fun addStillContains!173 (ListLongMap!3125 (_ BitVec 64) V!6947 (_ BitVec 64)) Unit!6454)

(assert (=> b!212795 (= lt!109773 (addStillContains!173 lt!109771 lt!109777 zeroValue!615 lt!109786))))

(assert (=> b!212795 (contains!1414 (+!581 lt!109771 (tuple2!4213 lt!109777 zeroValue!615)) lt!109786)))

(declare-fun lt!109772 () Unit!6454)

(assert (=> b!212795 (= lt!109772 lt!109773)))

(declare-fun lt!109770 () ListLongMap!3125)

(assert (=> b!212795 (= lt!109770 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109776 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109784 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109784 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109779 () Unit!6454)

(declare-fun addApplyDifferent!173 (ListLongMap!3125 (_ BitVec 64) V!6947 (_ BitVec 64)) Unit!6454)

(assert (=> b!212795 (= lt!109779 (addApplyDifferent!173 lt!109770 lt!109776 minValue!615 lt!109784))))

(assert (=> b!212795 (= (apply!197 (+!581 lt!109770 (tuple2!4213 lt!109776 minValue!615)) lt!109784) (apply!197 lt!109770 lt!109784))))

(declare-fun lt!109768 () Unit!6454)

(assert (=> b!212795 (= lt!109768 lt!109779)))

(declare-fun lt!109766 () ListLongMap!3125)

(assert (=> b!212795 (= lt!109766 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109765 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109783 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109783 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109778 () Unit!6454)

(assert (=> b!212795 (= lt!109778 (addApplyDifferent!173 lt!109766 lt!109765 zeroValue!615 lt!109783))))

(assert (=> b!212795 (= (apply!197 (+!581 lt!109766 (tuple2!4213 lt!109765 zeroValue!615)) lt!109783) (apply!197 lt!109766 lt!109783))))

(declare-fun lt!109769 () Unit!6454)

(assert (=> b!212795 (= lt!109769 lt!109778)))

(declare-fun lt!109782 () ListLongMap!3125)

(assert (=> b!212795 (= lt!109782 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109785 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109781 () (_ BitVec 64))

(assert (=> b!212795 (= lt!109781 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212795 (= lt!109767 (addApplyDifferent!173 lt!109782 lt!109785 minValue!615 lt!109781))))

(assert (=> b!212795 (= (apply!197 (+!581 lt!109782 (tuple2!4213 lt!109785 minValue!615)) lt!109781) (apply!197 lt!109782 lt!109781))))

(declare-fun b!212796 () Bool)

(declare-fun e!138432 () Bool)

(declare-fun lt!109780 () ListLongMap!3125)

(assert (=> b!212796 (= e!138432 (= (apply!197 lt!109780 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20153 () Bool)

(declare-fun call!20162 () ListLongMap!3125)

(declare-fun call!20160 () ListLongMap!3125)

(assert (=> bm!20153 (= call!20162 call!20160)))

(declare-fun b!212797 () Bool)

(declare-fun e!138433 () Bool)

(declare-fun e!138435 () Bool)

(assert (=> b!212797 (= e!138433 e!138435)))

(declare-fun c!35866 () Bool)

(assert (=> b!212797 (= c!35866 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212798 () Bool)

(declare-fun e!138439 () ListLongMap!3125)

(declare-fun call!20159 () ListLongMap!3125)

(assert (=> b!212798 (= e!138439 call!20159)))

(declare-fun b!212799 () Bool)

(declare-fun res!104083 () Bool)

(assert (=> b!212799 (=> (not res!104083) (not e!138433))))

(declare-fun e!138443 () Bool)

(assert (=> b!212799 (= res!104083 e!138443)))

(declare-fun c!35864 () Bool)

(assert (=> b!212799 (= c!35864 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212800 () Bool)

(declare-fun call!20161 () Bool)

(assert (=> b!212800 (= e!138443 (not call!20161))))

(declare-fun bm!20154 () Bool)

(assert (=> bm!20154 (= call!20160 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212801 () Bool)

(declare-fun e!138441 () Bool)

(assert (=> b!212801 (= e!138441 (= (apply!197 lt!109780 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)) (get!2577 (select (arr!4820 lt!109635) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5145 lt!109635)))))

(assert (=> b!212801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212802 () Bool)

(declare-fun e!138442 () Bool)

(assert (=> b!212802 (= e!138442 (= (apply!197 lt!109780 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20155 () Bool)

(declare-fun call!20156 () ListLongMap!3125)

(declare-fun call!20158 () ListLongMap!3125)

(assert (=> bm!20155 (= call!20156 call!20158)))

(declare-fun b!212803 () Bool)

(declare-fun res!104084 () Bool)

(assert (=> b!212803 (=> (not res!104084) (not e!138433))))

(declare-fun e!138437 () Bool)

(assert (=> b!212803 (= res!104084 e!138437)))

(declare-fun res!104086 () Bool)

(assert (=> b!212803 (=> res!104086 e!138437)))

(declare-fun e!138438 () Bool)

(assert (=> b!212803 (= res!104086 (not e!138438))))

(declare-fun res!104082 () Bool)

(assert (=> b!212803 (=> (not res!104082) (not e!138438))))

(assert (=> b!212803 (= res!104082 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun bm!20156 () Bool)

(declare-fun c!35863 () Bool)

(declare-fun c!35865 () Bool)

(assert (=> bm!20156 (= call!20158 (+!581 (ite c!35865 call!20160 (ite c!35863 call!20162 call!20159)) (ite (or c!35865 c!35863) (tuple2!4213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun d!58155 () Bool)

(assert (=> d!58155 e!138433))

(declare-fun res!104080 () Bool)

(assert (=> d!58155 (=> (not res!104080) (not e!138433))))

(assert (=> d!58155 (= res!104080 (or (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))))

(declare-fun lt!109774 () ListLongMap!3125)

(assert (=> d!58155 (= lt!109780 lt!109774)))

(declare-fun lt!109775 () Unit!6454)

(assert (=> d!58155 (= lt!109775 e!138440)))

(declare-fun c!35867 () Bool)

(declare-fun e!138436 () Bool)

(assert (=> d!58155 (= c!35867 e!138436)))

(declare-fun res!104079 () Bool)

(assert (=> d!58155 (=> (not res!104079) (not e!138436))))

(assert (=> d!58155 (= res!104079 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun e!138444 () ListLongMap!3125)

(assert (=> d!58155 (= lt!109774 e!138444)))

(assert (=> d!58155 (= c!35865 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58155 (validMask!0 mask!1149)))

(assert (=> d!58155 (= (getCurrentListMap!1109 _keys!825 lt!109635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109780)))

(declare-fun bm!20157 () Bool)

(declare-fun call!20157 () Bool)

(assert (=> bm!20157 (= call!20157 (contains!1414 lt!109780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212804 () Bool)

(declare-fun e!138434 () ListLongMap!3125)

(assert (=> b!212804 (= e!138434 call!20156)))

(declare-fun b!212805 () Bool)

(assert (=> b!212805 (= e!138435 (not call!20157))))

(declare-fun bm!20158 () Bool)

(assert (=> bm!20158 (= call!20159 call!20162)))

(declare-fun b!212806 () Bool)

(assert (=> b!212806 (= e!138443 e!138442)))

(declare-fun res!104085 () Bool)

(assert (=> b!212806 (= res!104085 call!20161)))

(assert (=> b!212806 (=> (not res!104085) (not e!138442))))

(declare-fun b!212807 () Bool)

(assert (=> b!212807 (= e!138444 e!138434)))

(assert (=> b!212807 (= c!35863 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212808 () Bool)

(declare-fun c!35862 () Bool)

(assert (=> b!212808 (= c!35862 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212808 (= e!138434 e!138439)))

(declare-fun b!212809 () Bool)

(assert (=> b!212809 (= e!138439 call!20156)))

(declare-fun b!212810 () Bool)

(assert (=> b!212810 (= e!138436 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212811 () Bool)

(assert (=> b!212811 (= e!138438 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212812 () Bool)

(declare-fun Unit!6458 () Unit!6454)

(assert (=> b!212812 (= e!138440 Unit!6458)))

(declare-fun b!212813 () Bool)

(assert (=> b!212813 (= e!138444 (+!581 call!20158 (tuple2!4213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212814 () Bool)

(assert (=> b!212814 (= e!138437 e!138441)))

(declare-fun res!104087 () Bool)

(assert (=> b!212814 (=> (not res!104087) (not e!138441))))

(assert (=> b!212814 (= res!104087 (contains!1414 lt!109780 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun bm!20159 () Bool)

(assert (=> bm!20159 (= call!20161 (contains!1414 lt!109780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212815 () Bool)

(assert (=> b!212815 (= e!138435 e!138432)))

(declare-fun res!104081 () Bool)

(assert (=> b!212815 (= res!104081 call!20157)))

(assert (=> b!212815 (=> (not res!104081) (not e!138432))))

(assert (= (and d!58155 c!35865) b!212813))

(assert (= (and d!58155 (not c!35865)) b!212807))

(assert (= (and b!212807 c!35863) b!212804))

(assert (= (and b!212807 (not c!35863)) b!212808))

(assert (= (and b!212808 c!35862) b!212809))

(assert (= (and b!212808 (not c!35862)) b!212798))

(assert (= (or b!212809 b!212798) bm!20158))

(assert (= (or b!212804 bm!20158) bm!20153))

(assert (= (or b!212804 b!212809) bm!20155))

(assert (= (or b!212813 bm!20153) bm!20154))

(assert (= (or b!212813 bm!20155) bm!20156))

(assert (= (and d!58155 res!104079) b!212810))

(assert (= (and d!58155 c!35867) b!212795))

(assert (= (and d!58155 (not c!35867)) b!212812))

(assert (= (and d!58155 res!104080) b!212803))

(assert (= (and b!212803 res!104082) b!212811))

(assert (= (and b!212803 (not res!104086)) b!212814))

(assert (= (and b!212814 res!104087) b!212801))

(assert (= (and b!212803 res!104084) b!212799))

(assert (= (and b!212799 c!35864) b!212806))

(assert (= (and b!212799 (not c!35864)) b!212800))

(assert (= (and b!212806 res!104085) b!212802))

(assert (= (or b!212806 b!212800) bm!20159))

(assert (= (and b!212799 res!104083) b!212797))

(assert (= (and b!212797 c!35866) b!212815))

(assert (= (and b!212797 (not c!35866)) b!212805))

(assert (= (and b!212815 res!104081) b!212796))

(assert (= (or b!212815 b!212805) bm!20157))

(declare-fun b_lambda!7739 () Bool)

(assert (=> (not b_lambda!7739) (not b!212801)))

(assert (=> b!212801 t!8051))

(declare-fun b_and!12467 () Bool)

(assert (= b_and!12465 (and (=> t!8051 result!5009) b_and!12467)))

(declare-fun m!240605 () Bool)

(assert (=> b!212795 m!240605))

(declare-fun m!240607 () Bool)

(assert (=> b!212795 m!240607))

(assert (=> b!212795 m!240439))

(declare-fun m!240609 () Bool)

(assert (=> b!212795 m!240609))

(declare-fun m!240611 () Bool)

(assert (=> b!212795 m!240611))

(declare-fun m!240613 () Bool)

(assert (=> b!212795 m!240613))

(declare-fun m!240615 () Bool)

(assert (=> b!212795 m!240615))

(declare-fun m!240617 () Bool)

(assert (=> b!212795 m!240617))

(declare-fun m!240619 () Bool)

(assert (=> b!212795 m!240619))

(declare-fun m!240621 () Bool)

(assert (=> b!212795 m!240621))

(declare-fun m!240623 () Bool)

(assert (=> b!212795 m!240623))

(assert (=> b!212795 m!240493))

(declare-fun m!240625 () Bool)

(assert (=> b!212795 m!240625))

(declare-fun m!240627 () Bool)

(assert (=> b!212795 m!240627))

(assert (=> b!212795 m!240605))

(declare-fun m!240629 () Bool)

(assert (=> b!212795 m!240629))

(declare-fun m!240631 () Bool)

(assert (=> b!212795 m!240631))

(assert (=> b!212795 m!240613))

(assert (=> b!212795 m!240611))

(declare-fun m!240633 () Bool)

(assert (=> b!212795 m!240633))

(assert (=> b!212795 m!240629))

(assert (=> b!212810 m!240493))

(assert (=> b!212810 m!240493))

(assert (=> b!212810 m!240495))

(declare-fun m!240635 () Bool)

(assert (=> b!212813 m!240635))

(declare-fun m!240637 () Bool)

(assert (=> b!212802 m!240637))

(assert (=> b!212811 m!240493))

(assert (=> b!212811 m!240493))

(assert (=> b!212811 m!240495))

(assert (=> d!58155 m!240425))

(declare-fun m!240639 () Bool)

(assert (=> b!212796 m!240639))

(declare-fun m!240641 () Bool)

(assert (=> bm!20156 m!240641))

(declare-fun m!240643 () Bool)

(assert (=> bm!20159 m!240643))

(declare-fun m!240645 () Bool)

(assert (=> bm!20157 m!240645))

(assert (=> b!212801 m!240493))

(assert (=> b!212801 m!240583))

(assert (=> b!212801 m!240553))

(assert (=> b!212801 m!240585))

(assert (=> b!212801 m!240493))

(declare-fun m!240647 () Bool)

(assert (=> b!212801 m!240647))

(assert (=> b!212801 m!240553))

(assert (=> b!212801 m!240583))

(assert (=> bm!20154 m!240439))

(assert (=> b!212814 m!240493))

(assert (=> b!212814 m!240493))

(declare-fun m!240649 () Bool)

(assert (=> b!212814 m!240649))

(assert (=> b!212628 d!58155))

(declare-fun b!212816 () Bool)

(declare-fun e!138453 () Unit!6454)

(declare-fun lt!109789 () Unit!6454)

(assert (=> b!212816 (= e!138453 lt!109789)))

(declare-fun lt!109793 () ListLongMap!3125)

(assert (=> b!212816 (= lt!109793 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109799 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109808 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109808 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109795 () Unit!6454)

(assert (=> b!212816 (= lt!109795 (addStillContains!173 lt!109793 lt!109799 zeroValue!615 lt!109808))))

(assert (=> b!212816 (contains!1414 (+!581 lt!109793 (tuple2!4213 lt!109799 zeroValue!615)) lt!109808)))

(declare-fun lt!109794 () Unit!6454)

(assert (=> b!212816 (= lt!109794 lt!109795)))

(declare-fun lt!109792 () ListLongMap!3125)

(assert (=> b!212816 (= lt!109792 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109798 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109806 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109806 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109801 () Unit!6454)

(assert (=> b!212816 (= lt!109801 (addApplyDifferent!173 lt!109792 lt!109798 minValue!615 lt!109806))))

(assert (=> b!212816 (= (apply!197 (+!581 lt!109792 (tuple2!4213 lt!109798 minValue!615)) lt!109806) (apply!197 lt!109792 lt!109806))))

(declare-fun lt!109790 () Unit!6454)

(assert (=> b!212816 (= lt!109790 lt!109801)))

(declare-fun lt!109788 () ListLongMap!3125)

(assert (=> b!212816 (= lt!109788 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109787 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109805 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109805 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109800 () Unit!6454)

(assert (=> b!212816 (= lt!109800 (addApplyDifferent!173 lt!109788 lt!109787 zeroValue!615 lt!109805))))

(assert (=> b!212816 (= (apply!197 (+!581 lt!109788 (tuple2!4213 lt!109787 zeroValue!615)) lt!109805) (apply!197 lt!109788 lt!109805))))

(declare-fun lt!109791 () Unit!6454)

(assert (=> b!212816 (= lt!109791 lt!109800)))

(declare-fun lt!109804 () ListLongMap!3125)

(assert (=> b!212816 (= lt!109804 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109807 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109803 () (_ BitVec 64))

(assert (=> b!212816 (= lt!109803 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212816 (= lt!109789 (addApplyDifferent!173 lt!109804 lt!109807 minValue!615 lt!109803))))

(assert (=> b!212816 (= (apply!197 (+!581 lt!109804 (tuple2!4213 lt!109807 minValue!615)) lt!109803) (apply!197 lt!109804 lt!109803))))

(declare-fun b!212817 () Bool)

(declare-fun e!138445 () Bool)

(declare-fun lt!109802 () ListLongMap!3125)

(assert (=> b!212817 (= e!138445 (= (apply!197 lt!109802 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20160 () Bool)

(declare-fun call!20169 () ListLongMap!3125)

(declare-fun call!20167 () ListLongMap!3125)

(assert (=> bm!20160 (= call!20169 call!20167)))

(declare-fun b!212818 () Bool)

(declare-fun e!138446 () Bool)

(declare-fun e!138448 () Bool)

(assert (=> b!212818 (= e!138446 e!138448)))

(declare-fun c!35872 () Bool)

(assert (=> b!212818 (= c!35872 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212819 () Bool)

(declare-fun e!138452 () ListLongMap!3125)

(declare-fun call!20166 () ListLongMap!3125)

(assert (=> b!212819 (= e!138452 call!20166)))

(declare-fun b!212820 () Bool)

(declare-fun res!104092 () Bool)

(assert (=> b!212820 (=> (not res!104092) (not e!138446))))

(declare-fun e!138456 () Bool)

(assert (=> b!212820 (= res!104092 e!138456)))

(declare-fun c!35870 () Bool)

(assert (=> b!212820 (= c!35870 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212821 () Bool)

(declare-fun call!20168 () Bool)

(assert (=> b!212821 (= e!138456 (not call!20168))))

(declare-fun bm!20161 () Bool)

(assert (=> bm!20161 (= call!20167 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212822 () Bool)

(declare-fun e!138454 () Bool)

(assert (=> b!212822 (= e!138454 (= (apply!197 lt!109802 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)) (get!2577 (select (arr!4820 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5145 _values!649)))))

(assert (=> b!212822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun b!212823 () Bool)

(declare-fun e!138455 () Bool)

(assert (=> b!212823 (= e!138455 (= (apply!197 lt!109802 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20162 () Bool)

(declare-fun call!20163 () ListLongMap!3125)

(declare-fun call!20165 () ListLongMap!3125)

(assert (=> bm!20162 (= call!20163 call!20165)))

(declare-fun b!212824 () Bool)

(declare-fun res!104093 () Bool)

(assert (=> b!212824 (=> (not res!104093) (not e!138446))))

(declare-fun e!138450 () Bool)

(assert (=> b!212824 (= res!104093 e!138450)))

(declare-fun res!104095 () Bool)

(assert (=> b!212824 (=> res!104095 e!138450)))

(declare-fun e!138451 () Bool)

(assert (=> b!212824 (= res!104095 (not e!138451))))

(declare-fun res!104091 () Bool)

(assert (=> b!212824 (=> (not res!104091) (not e!138451))))

(assert (=> b!212824 (= res!104091 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun bm!20163 () Bool)

(declare-fun c!35871 () Bool)

(declare-fun c!35869 () Bool)

(assert (=> bm!20163 (= call!20165 (+!581 (ite c!35871 call!20167 (ite c!35869 call!20169 call!20166)) (ite (or c!35871 c!35869) (tuple2!4213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun d!58157 () Bool)

(assert (=> d!58157 e!138446))

(declare-fun res!104089 () Bool)

(assert (=> d!58157 (=> (not res!104089) (not e!138446))))

(assert (=> d!58157 (= res!104089 (or (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))))

(declare-fun lt!109796 () ListLongMap!3125)

(assert (=> d!58157 (= lt!109802 lt!109796)))

(declare-fun lt!109797 () Unit!6454)

(assert (=> d!58157 (= lt!109797 e!138453)))

(declare-fun c!35873 () Bool)

(declare-fun e!138449 () Bool)

(assert (=> d!58157 (= c!35873 e!138449)))

(declare-fun res!104088 () Bool)

(assert (=> d!58157 (=> (not res!104088) (not e!138449))))

(assert (=> d!58157 (= res!104088 (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun e!138457 () ListLongMap!3125)

(assert (=> d!58157 (= lt!109796 e!138457)))

(assert (=> d!58157 (= c!35871 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58157 (validMask!0 mask!1149)))

(assert (=> d!58157 (= (getCurrentListMap!1109 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109802)))

(declare-fun bm!20164 () Bool)

(declare-fun call!20164 () Bool)

(assert (=> bm!20164 (= call!20164 (contains!1414 lt!109802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212825 () Bool)

(declare-fun e!138447 () ListLongMap!3125)

(assert (=> b!212825 (= e!138447 call!20163)))

(declare-fun b!212826 () Bool)

(assert (=> b!212826 (= e!138448 (not call!20164))))

(declare-fun bm!20165 () Bool)

(assert (=> bm!20165 (= call!20166 call!20169)))

(declare-fun b!212827 () Bool)

(assert (=> b!212827 (= e!138456 e!138455)))

(declare-fun res!104094 () Bool)

(assert (=> b!212827 (= res!104094 call!20168)))

(assert (=> b!212827 (=> (not res!104094) (not e!138455))))

(declare-fun b!212828 () Bool)

(assert (=> b!212828 (= e!138457 e!138447)))

(assert (=> b!212828 (= c!35869 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212829 () Bool)

(declare-fun c!35868 () Bool)

(assert (=> b!212829 (= c!35868 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212829 (= e!138447 e!138452)))

(declare-fun b!212830 () Bool)

(assert (=> b!212830 (= e!138452 call!20163)))

(declare-fun b!212831 () Bool)

(assert (=> b!212831 (= e!138449 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212832 () Bool)

(assert (=> b!212832 (= e!138451 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212833 () Bool)

(declare-fun Unit!6459 () Unit!6454)

(assert (=> b!212833 (= e!138453 Unit!6459)))

(declare-fun b!212834 () Bool)

(assert (=> b!212834 (= e!138457 (+!581 call!20165 (tuple2!4213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212835 () Bool)

(assert (=> b!212835 (= e!138450 e!138454)))

(declare-fun res!104096 () Bool)

(assert (=> b!212835 (=> (not res!104096) (not e!138454))))

(assert (=> b!212835 (= res!104096 (contains!1414 lt!109802 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(declare-fun bm!20166 () Bool)

(assert (=> bm!20166 (= call!20168 (contains!1414 lt!109802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212836 () Bool)

(assert (=> b!212836 (= e!138448 e!138445)))

(declare-fun res!104090 () Bool)

(assert (=> b!212836 (= res!104090 call!20164)))

(assert (=> b!212836 (=> (not res!104090) (not e!138445))))

(assert (= (and d!58157 c!35871) b!212834))

(assert (= (and d!58157 (not c!35871)) b!212828))

(assert (= (and b!212828 c!35869) b!212825))

(assert (= (and b!212828 (not c!35869)) b!212829))

(assert (= (and b!212829 c!35868) b!212830))

(assert (= (and b!212829 (not c!35868)) b!212819))

(assert (= (or b!212830 b!212819) bm!20165))

(assert (= (or b!212825 bm!20165) bm!20160))

(assert (= (or b!212825 b!212830) bm!20162))

(assert (= (or b!212834 bm!20160) bm!20161))

(assert (= (or b!212834 bm!20162) bm!20163))

(assert (= (and d!58157 res!104088) b!212831))

(assert (= (and d!58157 c!35873) b!212816))

(assert (= (and d!58157 (not c!35873)) b!212833))

(assert (= (and d!58157 res!104089) b!212824))

(assert (= (and b!212824 res!104091) b!212832))

(assert (= (and b!212824 (not res!104095)) b!212835))

(assert (= (and b!212835 res!104096) b!212822))

(assert (= (and b!212824 res!104093) b!212820))

(assert (= (and b!212820 c!35870) b!212827))

(assert (= (and b!212820 (not c!35870)) b!212821))

(assert (= (and b!212827 res!104094) b!212823))

(assert (= (or b!212827 b!212821) bm!20166))

(assert (= (and b!212820 res!104092) b!212818))

(assert (= (and b!212818 c!35872) b!212836))

(assert (= (and b!212818 (not c!35872)) b!212826))

(assert (= (and b!212836 res!104090) b!212817))

(assert (= (or b!212836 b!212826) bm!20164))

(declare-fun b_lambda!7741 () Bool)

(assert (=> (not b_lambda!7741) (not b!212822)))

(assert (=> b!212822 t!8051))

(declare-fun b_and!12469 () Bool)

(assert (= b_and!12467 (and (=> t!8051 result!5009) b_and!12469)))

(declare-fun m!240651 () Bool)

(assert (=> b!212816 m!240651))

(declare-fun m!240653 () Bool)

(assert (=> b!212816 m!240653))

(assert (=> b!212816 m!240441))

(declare-fun m!240655 () Bool)

(assert (=> b!212816 m!240655))

(declare-fun m!240657 () Bool)

(assert (=> b!212816 m!240657))

(declare-fun m!240659 () Bool)

(assert (=> b!212816 m!240659))

(declare-fun m!240661 () Bool)

(assert (=> b!212816 m!240661))

(declare-fun m!240663 () Bool)

(assert (=> b!212816 m!240663))

(declare-fun m!240665 () Bool)

(assert (=> b!212816 m!240665))

(declare-fun m!240667 () Bool)

(assert (=> b!212816 m!240667))

(declare-fun m!240669 () Bool)

(assert (=> b!212816 m!240669))

(assert (=> b!212816 m!240493))

(declare-fun m!240671 () Bool)

(assert (=> b!212816 m!240671))

(declare-fun m!240673 () Bool)

(assert (=> b!212816 m!240673))

(assert (=> b!212816 m!240651))

(declare-fun m!240675 () Bool)

(assert (=> b!212816 m!240675))

(declare-fun m!240677 () Bool)

(assert (=> b!212816 m!240677))

(assert (=> b!212816 m!240659))

(assert (=> b!212816 m!240657))

(declare-fun m!240679 () Bool)

(assert (=> b!212816 m!240679))

(assert (=> b!212816 m!240675))

(assert (=> b!212831 m!240493))

(assert (=> b!212831 m!240493))

(assert (=> b!212831 m!240495))

(declare-fun m!240681 () Bool)

(assert (=> b!212834 m!240681))

(declare-fun m!240683 () Bool)

(assert (=> b!212823 m!240683))

(assert (=> b!212832 m!240493))

(assert (=> b!212832 m!240493))

(assert (=> b!212832 m!240495))

(assert (=> d!58157 m!240425))

(declare-fun m!240685 () Bool)

(assert (=> b!212817 m!240685))

(declare-fun m!240687 () Bool)

(assert (=> bm!20163 m!240687))

(declare-fun m!240689 () Bool)

(assert (=> bm!20166 m!240689))

(declare-fun m!240691 () Bool)

(assert (=> bm!20164 m!240691))

(assert (=> b!212822 m!240493))

(assert (=> b!212822 m!240551))

(assert (=> b!212822 m!240553))

(assert (=> b!212822 m!240555))

(assert (=> b!212822 m!240493))

(declare-fun m!240693 () Bool)

(assert (=> b!212822 m!240693))

(assert (=> b!212822 m!240553))

(assert (=> b!212822 m!240551))

(assert (=> bm!20161 m!240441))

(assert (=> b!212835 m!240493))

(assert (=> b!212835 m!240493))

(declare-fun m!240695 () Bool)

(assert (=> b!212835 m!240695))

(assert (=> b!212628 d!58157))

(declare-fun d!58159 () Bool)

(declare-fun res!104101 () Bool)

(declare-fun e!138464 () Bool)

(assert (=> d!58159 (=> res!104101 e!138464)))

(assert (=> d!58159 (= res!104101 (bvsge #b00000000000000000000000000000000 (size!5144 _keys!825)))))

(assert (=> d!58159 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138464)))

(declare-fun b!212845 () Bool)

(declare-fun e!138465 () Bool)

(assert (=> b!212845 (= e!138464 e!138465)))

(declare-fun c!35876 () Bool)

(assert (=> b!212845 (= c!35876 (validKeyInArray!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20169 () Bool)

(declare-fun call!20172 () Bool)

(assert (=> bm!20169 (= call!20172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!212846 () Bool)

(declare-fun e!138466 () Bool)

(assert (=> b!212846 (= e!138465 e!138466)))

(declare-fun lt!109816 () (_ BitVec 64))

(assert (=> b!212846 (= lt!109816 (select (arr!4819 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109815 () Unit!6454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10153 (_ BitVec 64) (_ BitVec 32)) Unit!6454)

(assert (=> b!212846 (= lt!109815 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212846 (arrayContainsKey!0 _keys!825 lt!109816 #b00000000000000000000000000000000)))

(declare-fun lt!109817 () Unit!6454)

(assert (=> b!212846 (= lt!109817 lt!109815)))

(declare-fun res!104102 () Bool)

(declare-datatypes ((SeekEntryResult!712 0))(
  ( (MissingZero!712 (index!5018 (_ BitVec 32))) (Found!712 (index!5019 (_ BitVec 32))) (Intermediate!712 (undefined!1524 Bool) (index!5020 (_ BitVec 32)) (x!22190 (_ BitVec 32))) (Undefined!712) (MissingVacant!712 (index!5021 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10153 (_ BitVec 32)) SeekEntryResult!712)

(assert (=> b!212846 (= res!104102 (= (seekEntryOrOpen!0 (select (arr!4819 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!712 #b00000000000000000000000000000000)))))

(assert (=> b!212846 (=> (not res!104102) (not e!138466))))

(declare-fun b!212847 () Bool)

(assert (=> b!212847 (= e!138465 call!20172)))

(declare-fun b!212848 () Bool)

(assert (=> b!212848 (= e!138466 call!20172)))

(assert (= (and d!58159 (not res!104101)) b!212845))

(assert (= (and b!212845 c!35876) b!212846))

(assert (= (and b!212845 (not c!35876)) b!212847))

(assert (= (and b!212846 res!104102) b!212848))

(assert (= (or b!212848 b!212847) bm!20169))

(assert (=> b!212845 m!240493))

(assert (=> b!212845 m!240493))

(assert (=> b!212845 m!240495))

(declare-fun m!240697 () Bool)

(assert (=> bm!20169 m!240697))

(assert (=> b!212846 m!240493))

(declare-fun m!240699 () Bool)

(assert (=> b!212846 m!240699))

(declare-fun m!240701 () Bool)

(assert (=> b!212846 m!240701))

(assert (=> b!212846 m!240493))

(declare-fun m!240703 () Bool)

(assert (=> b!212846 m!240703))

(assert (=> b!212622 d!58159))

(declare-fun d!58161 () Bool)

(assert (=> d!58161 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21122 d!58161))

(declare-fun d!58163 () Bool)

(assert (=> d!58163 (= (array_inv!3189 _values!649) (bvsge (size!5145 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21122 d!58163))

(declare-fun d!58165 () Bool)

(assert (=> d!58165 (= (array_inv!3190 _keys!825) (bvsge (size!5144 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21122 d!58165))

(declare-fun mapIsEmpty!9311 () Bool)

(declare-fun mapRes!9311 () Bool)

(assert (=> mapIsEmpty!9311 mapRes!9311))

(declare-fun mapNonEmpty!9311 () Bool)

(declare-fun tp!19913 () Bool)

(declare-fun e!138471 () Bool)

(assert (=> mapNonEmpty!9311 (= mapRes!9311 (and tp!19913 e!138471))))

(declare-fun mapKey!9311 () (_ BitVec 32))

(declare-fun mapValue!9311 () ValueCell!2394)

(declare-fun mapRest!9311 () (Array (_ BitVec 32) ValueCell!2394))

(assert (=> mapNonEmpty!9311 (= mapRest!9305 (store mapRest!9311 mapKey!9311 mapValue!9311))))

(declare-fun condMapEmpty!9311 () Bool)

(declare-fun mapDefault!9311 () ValueCell!2394)

(assert (=> mapNonEmpty!9305 (= condMapEmpty!9311 (= mapRest!9305 ((as const (Array (_ BitVec 32) ValueCell!2394)) mapDefault!9311)))))

(declare-fun e!138472 () Bool)

(assert (=> mapNonEmpty!9305 (= tp!19903 (and e!138472 mapRes!9311))))

(declare-fun b!212856 () Bool)

(assert (=> b!212856 (= e!138472 tp_is_empty!5475)))

(declare-fun b!212855 () Bool)

(assert (=> b!212855 (= e!138471 tp_is_empty!5475)))

(assert (= (and mapNonEmpty!9305 condMapEmpty!9311) mapIsEmpty!9311))

(assert (= (and mapNonEmpty!9305 (not condMapEmpty!9311)) mapNonEmpty!9311))

(assert (= (and mapNonEmpty!9311 ((_ is ValueCellFull!2394) mapValue!9311)) b!212855))

(assert (= (and mapNonEmpty!9305 ((_ is ValueCellFull!2394) mapDefault!9311)) b!212856))

(declare-fun m!240705 () Bool)

(assert (=> mapNonEmpty!9311 m!240705))

(declare-fun b_lambda!7743 () Bool)

(assert (= b_lambda!7731 (or (and start!21122 b_free!5613) b_lambda!7743)))

(declare-fun b_lambda!7745 () Bool)

(assert (= b_lambda!7735 (or (and start!21122 b_free!5613) b_lambda!7745)))

(declare-fun b_lambda!7747 () Bool)

(assert (= b_lambda!7739 (or (and start!21122 b_free!5613) b_lambda!7747)))

(declare-fun b_lambda!7749 () Bool)

(assert (= b_lambda!7741 (or (and start!21122 b_free!5613) b_lambda!7749)))

(declare-fun b_lambda!7751 () Bool)

(assert (= b_lambda!7733 (or (and start!21122 b_free!5613) b_lambda!7751)))

(declare-fun b_lambda!7753 () Bool)

(assert (= b_lambda!7737 (or (and start!21122 b_free!5613) b_lambda!7753)))

(check-sat (not bm!20131) (not d!58145) (not b!212729) (not b!212835) (not b!212832) (not b!212750) (not b!212681) (not b!212724) (not b_lambda!7749) (not bm!20164) (not bm!20128) (not b!212728) (not b!212738) (not b!212741) (not mapNonEmpty!9311) (not b!212692) (not bm!20156) (not d!58157) (not b!212813) (not bm!20163) b_and!12469 (not b!212725) (not bm!20169) (not b!212816) (not b!212691) tp_is_empty!5475 (not b_lambda!7745) (not b!212823) (not b!212834) (not d!58143) (not b_lambda!7753) (not b!212718) (not b!212846) (not bm!20138) (not b!212686) (not b!212811) (not b!212796) (not d!58155) (not bm!20157) (not b!212814) (not b!212678) (not b!212727) (not b!212817) (not b_next!5613) (not bm!20137) (not b_lambda!7751) (not bm!20161) (not d!58147) (not b!212822) (not b!212720) (not b_lambda!7743) (not b!212743) (not b!212690) (not b!212693) (not b!212831) (not b!212747) (not bm!20154) (not b!212748) (not b!212810) (not b!212795) (not b!212801) (not b_lambda!7747) (not b!212688) (not d!58141) (not b!212845) (not d!58153) (not b!212751) (not b!212687) (not b!212752) (not b!212723) (not d!58151) (not b!212689) (not bm!20136) (not bm!20166) (not d!58149) (not b!212802) (not b!212746) (not b!212677) (not bm!20159))
(check-sat b_and!12469 (not b_next!5613))
