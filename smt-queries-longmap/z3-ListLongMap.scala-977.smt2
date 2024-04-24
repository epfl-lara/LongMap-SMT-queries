; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21124 () Bool)

(assert start!21124)

(declare-fun b_free!5611 () Bool)

(declare-fun b_next!5611 () Bool)

(assert (=> start!21124 (= b_free!5611 (not b_next!5611))))

(declare-fun tp!19897 () Bool)

(declare-fun b_and!12467 () Bool)

(assert (=> start!21124 (= tp!19897 b_and!12467)))

(declare-fun b!212630 () Bool)

(declare-fun res!103980 () Bool)

(declare-fun e!138335 () Bool)

(assert (=> b!212630 (=> (not res!103980) (not e!138335))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10147 0))(
  ( (array!10148 (arr!4816 (Array (_ BitVec 32) (_ BitVec 64))) (size!5141 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10147)

(assert (=> b!212630 (= res!103980 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5141 _keys!825))))))

(declare-fun b!212631 () Bool)

(declare-fun res!103979 () Bool)

(assert (=> b!212631 (=> (not res!103979) (not e!138335))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10147 (_ BitVec 32)) Bool)

(assert (=> b!212631 (= res!103979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212633 () Bool)

(declare-fun res!103986 () Bool)

(assert (=> b!212633 (=> (not res!103986) (not e!138335))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6945 0))(
  ( (V!6946 (val!2781 Int)) )
))
(declare-datatypes ((ValueCell!2393 0))(
  ( (ValueCellFull!2393 (v!4784 V!6945)) (EmptyCell!2393) )
))
(declare-datatypes ((array!10149 0))(
  ( (array!10150 (arr!4817 (Array (_ BitVec 32) ValueCell!2393)) (size!5142 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10149)

(assert (=> b!212633 (= res!103986 (and (= (size!5142 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5141 _keys!825) (size!5142 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9302 () Bool)

(declare-fun mapRes!9302 () Bool)

(assert (=> mapIsEmpty!9302 mapRes!9302))

(declare-fun b!212634 () Bool)

(declare-fun e!138329 () Bool)

(declare-fun tp_is_empty!5473 () Bool)

(assert (=> b!212634 (= e!138329 tp_is_empty!5473)))

(declare-fun b!212635 () Bool)

(declare-fun res!103982 () Bool)

(assert (=> b!212635 (=> (not res!103982) (not e!138335))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!212635 (= res!103982 (= (select (arr!4816 _keys!825) i!601) k0!843))))

(declare-datatypes ((tuple2!4150 0))(
  ( (tuple2!4151 (_1!2086 (_ BitVec 64)) (_2!2086 V!6945)) )
))
(declare-fun lt!109675 () tuple2!4150)

(declare-fun b!212636 () Bool)

(declare-datatypes ((List!3033 0))(
  ( (Nil!3030) (Cons!3029 (h!3671 tuple2!4150) (t!7972 List!3033)) )
))
(declare-datatypes ((ListLongMap!3065 0))(
  ( (ListLongMap!3066 (toList!1548 List!3033)) )
))
(declare-fun lt!109674 () ListLongMap!3065)

(declare-fun e!138330 () Bool)

(declare-fun lt!109671 () ListLongMap!3065)

(declare-fun +!577 (ListLongMap!3065 tuple2!4150) ListLongMap!3065)

(assert (=> b!212636 (= e!138330 (= lt!109671 (+!577 lt!109674 lt!109675)))))

(declare-fun e!138332 () Bool)

(assert (=> b!212636 e!138332))

(declare-fun res!103981 () Bool)

(assert (=> b!212636 (=> (not res!103981) (not e!138332))))

(declare-fun lt!109672 () ListLongMap!3065)

(declare-fun lt!109669 () ListLongMap!3065)

(assert (=> b!212636 (= res!103981 (= lt!109669 (+!577 lt!109672 lt!109675)))))

(declare-fun minValue!615 () V!6945)

(assert (=> b!212636 (= lt!109675 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212637 () Bool)

(declare-fun res!103987 () Bool)

(assert (=> b!212637 (=> (not res!103987) (not e!138335))))

(declare-datatypes ((List!3034 0))(
  ( (Nil!3031) (Cons!3030 (h!3672 (_ BitVec 64)) (t!7973 List!3034)) )
))
(declare-fun arrayNoDuplicates!0 (array!10147 (_ BitVec 32) List!3034) Bool)

(assert (=> b!212637 (= res!103987 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3031))))

(declare-fun lt!109676 () ListLongMap!3065)

(declare-fun b!212638 () Bool)

(assert (=> b!212638 (= e!138332 (= lt!109669 (+!577 lt!109676 lt!109675)))))

(declare-fun res!103983 () Bool)

(assert (=> start!21124 (=> (not res!103983) (not e!138335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21124 (= res!103983 (validMask!0 mask!1149))))

(assert (=> start!21124 e!138335))

(declare-fun e!138334 () Bool)

(declare-fun array_inv!3161 (array!10149) Bool)

(assert (=> start!21124 (and (array_inv!3161 _values!649) e!138334)))

(assert (=> start!21124 true))

(assert (=> start!21124 tp_is_empty!5473))

(declare-fun array_inv!3162 (array!10147) Bool)

(assert (=> start!21124 (array_inv!3162 _keys!825)))

(assert (=> start!21124 tp!19897))

(declare-fun b!212632 () Bool)

(assert (=> b!212632 (= e!138335 (not e!138330))))

(declare-fun res!103985 () Bool)

(assert (=> b!212632 (=> res!103985 e!138330)))

(assert (=> b!212632 (= res!103985 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6945)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1084 (array!10147 array!10149 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) Int) ListLongMap!3065)

(assert (=> b!212632 (= lt!109671 (getCurrentListMap!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109670 () array!10149)

(assert (=> b!212632 (= lt!109669 (getCurrentListMap!1084 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212632 (and (= lt!109672 lt!109676) (= lt!109676 lt!109672))))

(declare-fun v!520 () V!6945)

(assert (=> b!212632 (= lt!109676 (+!577 lt!109674 (tuple2!4151 k0!843 v!520)))))

(declare-datatypes ((Unit!6442 0))(
  ( (Unit!6443) )
))
(declare-fun lt!109673 () Unit!6442)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 (array!10147 array!10149 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) (_ BitVec 64) V!6945 (_ BitVec 32) Int) Unit!6442)

(assert (=> b!212632 (= lt!109673 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!507 (array!10147 array!10149 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) Int) ListLongMap!3065)

(assert (=> b!212632 (= lt!109672 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212632 (= lt!109670 (array!10150 (store (arr!4817 _values!649) i!601 (ValueCellFull!2393 v!520)) (size!5142 _values!649)))))

(assert (=> b!212632 (= lt!109674 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9302 () Bool)

(declare-fun tp!19898 () Bool)

(declare-fun e!138331 () Bool)

(assert (=> mapNonEmpty!9302 (= mapRes!9302 (and tp!19898 e!138331))))

(declare-fun mapKey!9302 () (_ BitVec 32))

(declare-fun mapRest!9302 () (Array (_ BitVec 32) ValueCell!2393))

(declare-fun mapValue!9302 () ValueCell!2393)

(assert (=> mapNonEmpty!9302 (= (arr!4817 _values!649) (store mapRest!9302 mapKey!9302 mapValue!9302))))

(declare-fun b!212639 () Bool)

(assert (=> b!212639 (= e!138334 (and e!138329 mapRes!9302))))

(declare-fun condMapEmpty!9302 () Bool)

(declare-fun mapDefault!9302 () ValueCell!2393)

(assert (=> b!212639 (= condMapEmpty!9302 (= (arr!4817 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2393)) mapDefault!9302)))))

(declare-fun b!212640 () Bool)

(declare-fun res!103984 () Bool)

(assert (=> b!212640 (=> (not res!103984) (not e!138335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212640 (= res!103984 (validKeyInArray!0 k0!843))))

(declare-fun b!212641 () Bool)

(assert (=> b!212641 (= e!138331 tp_is_empty!5473)))

(assert (= (and start!21124 res!103983) b!212633))

(assert (= (and b!212633 res!103986) b!212631))

(assert (= (and b!212631 res!103979) b!212637))

(assert (= (and b!212637 res!103987) b!212630))

(assert (= (and b!212630 res!103980) b!212640))

(assert (= (and b!212640 res!103984) b!212635))

(assert (= (and b!212635 res!103982) b!212632))

(assert (= (and b!212632 (not res!103985)) b!212636))

(assert (= (and b!212636 res!103981) b!212638))

(assert (= (and b!212639 condMapEmpty!9302) mapIsEmpty!9302))

(assert (= (and b!212639 (not condMapEmpty!9302)) mapNonEmpty!9302))

(get-info :version)

(assert (= (and mapNonEmpty!9302 ((_ is ValueCellFull!2393) mapValue!9302)) b!212641))

(assert (= (and b!212639 ((_ is ValueCellFull!2393) mapDefault!9302)) b!212634))

(assert (= start!21124 b!212639))

(declare-fun m!240567 () Bool)

(assert (=> b!212640 m!240567))

(declare-fun m!240569 () Bool)

(assert (=> mapNonEmpty!9302 m!240569))

(declare-fun m!240571 () Bool)

(assert (=> b!212632 m!240571))

(declare-fun m!240573 () Bool)

(assert (=> b!212632 m!240573))

(declare-fun m!240575 () Bool)

(assert (=> b!212632 m!240575))

(declare-fun m!240577 () Bool)

(assert (=> b!212632 m!240577))

(declare-fun m!240579 () Bool)

(assert (=> b!212632 m!240579))

(declare-fun m!240581 () Bool)

(assert (=> b!212632 m!240581))

(declare-fun m!240583 () Bool)

(assert (=> b!212632 m!240583))

(declare-fun m!240585 () Bool)

(assert (=> b!212635 m!240585))

(declare-fun m!240587 () Bool)

(assert (=> b!212637 m!240587))

(declare-fun m!240589 () Bool)

(assert (=> start!21124 m!240589))

(declare-fun m!240591 () Bool)

(assert (=> start!21124 m!240591))

(declare-fun m!240593 () Bool)

(assert (=> start!21124 m!240593))

(declare-fun m!240595 () Bool)

(assert (=> b!212636 m!240595))

(declare-fun m!240597 () Bool)

(assert (=> b!212636 m!240597))

(declare-fun m!240599 () Bool)

(assert (=> b!212638 m!240599))

(declare-fun m!240601 () Bool)

(assert (=> b!212631 m!240601))

(check-sat (not b_next!5611) (not start!21124) tp_is_empty!5473 (not b!212637) (not b!212636) b_and!12467 (not b!212631) (not mapNonEmpty!9302) (not b!212640) (not b!212638) (not b!212632))
(check-sat b_and!12467 (not b_next!5611))
(get-model)

(declare-fun d!58211 () Bool)

(assert (=> d!58211 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21124 d!58211))

(declare-fun d!58213 () Bool)

(assert (=> d!58213 (= (array_inv!3161 _values!649) (bvsge (size!5142 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21124 d!58213))

(declare-fun d!58215 () Bool)

(assert (=> d!58215 (= (array_inv!3162 _keys!825) (bvsge (size!5141 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21124 d!58215))

(declare-fun d!58217 () Bool)

(declare-fun e!138380 () Bool)

(assert (=> d!58217 e!138380))

(declare-fun res!104046 () Bool)

(assert (=> d!58217 (=> (not res!104046) (not e!138380))))

(declare-fun lt!109735 () ListLongMap!3065)

(declare-fun contains!1396 (ListLongMap!3065 (_ BitVec 64)) Bool)

(assert (=> d!58217 (= res!104046 (contains!1396 lt!109735 (_1!2086 lt!109675)))))

(declare-fun lt!109733 () List!3033)

(assert (=> d!58217 (= lt!109735 (ListLongMap!3066 lt!109733))))

(declare-fun lt!109736 () Unit!6442)

(declare-fun lt!109734 () Unit!6442)

(assert (=> d!58217 (= lt!109736 lt!109734)))

(declare-datatypes ((Option!262 0))(
  ( (Some!261 (v!4790 V!6945)) (None!260) )
))
(declare-fun getValueByKey!256 (List!3033 (_ BitVec 64)) Option!262)

(assert (=> d!58217 (= (getValueByKey!256 lt!109733 (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675)))))

(declare-fun lemmaContainsTupThenGetReturnValue!143 (List!3033 (_ BitVec 64) V!6945) Unit!6442)

(assert (=> d!58217 (= lt!109734 (lemmaContainsTupThenGetReturnValue!143 lt!109733 (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(declare-fun insertStrictlySorted!146 (List!3033 (_ BitVec 64) V!6945) List!3033)

(assert (=> d!58217 (= lt!109733 (insertStrictlySorted!146 (toList!1548 lt!109674) (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(assert (=> d!58217 (= (+!577 lt!109674 lt!109675) lt!109735)))

(declare-fun b!212718 () Bool)

(declare-fun res!104047 () Bool)

(assert (=> b!212718 (=> (not res!104047) (not e!138380))))

(assert (=> b!212718 (= res!104047 (= (getValueByKey!256 (toList!1548 lt!109735) (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675))))))

(declare-fun b!212719 () Bool)

(declare-fun contains!1397 (List!3033 tuple2!4150) Bool)

(assert (=> b!212719 (= e!138380 (contains!1397 (toList!1548 lt!109735) lt!109675))))

(assert (= (and d!58217 res!104046) b!212718))

(assert (= (and b!212718 res!104047) b!212719))

(declare-fun m!240675 () Bool)

(assert (=> d!58217 m!240675))

(declare-fun m!240677 () Bool)

(assert (=> d!58217 m!240677))

(declare-fun m!240679 () Bool)

(assert (=> d!58217 m!240679))

(declare-fun m!240681 () Bool)

(assert (=> d!58217 m!240681))

(declare-fun m!240683 () Bool)

(assert (=> b!212718 m!240683))

(declare-fun m!240685 () Bool)

(assert (=> b!212719 m!240685))

(assert (=> b!212636 d!58217))

(declare-fun d!58219 () Bool)

(declare-fun e!138381 () Bool)

(assert (=> d!58219 e!138381))

(declare-fun res!104048 () Bool)

(assert (=> d!58219 (=> (not res!104048) (not e!138381))))

(declare-fun lt!109739 () ListLongMap!3065)

(assert (=> d!58219 (= res!104048 (contains!1396 lt!109739 (_1!2086 lt!109675)))))

(declare-fun lt!109737 () List!3033)

(assert (=> d!58219 (= lt!109739 (ListLongMap!3066 lt!109737))))

(declare-fun lt!109740 () Unit!6442)

(declare-fun lt!109738 () Unit!6442)

(assert (=> d!58219 (= lt!109740 lt!109738)))

(assert (=> d!58219 (= (getValueByKey!256 lt!109737 (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675)))))

(assert (=> d!58219 (= lt!109738 (lemmaContainsTupThenGetReturnValue!143 lt!109737 (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(assert (=> d!58219 (= lt!109737 (insertStrictlySorted!146 (toList!1548 lt!109672) (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(assert (=> d!58219 (= (+!577 lt!109672 lt!109675) lt!109739)))

(declare-fun b!212720 () Bool)

(declare-fun res!104049 () Bool)

(assert (=> b!212720 (=> (not res!104049) (not e!138381))))

(assert (=> b!212720 (= res!104049 (= (getValueByKey!256 (toList!1548 lt!109739) (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675))))))

(declare-fun b!212721 () Bool)

(assert (=> b!212721 (= e!138381 (contains!1397 (toList!1548 lt!109739) lt!109675))))

(assert (= (and d!58219 res!104048) b!212720))

(assert (= (and b!212720 res!104049) b!212721))

(declare-fun m!240687 () Bool)

(assert (=> d!58219 m!240687))

(declare-fun m!240689 () Bool)

(assert (=> d!58219 m!240689))

(declare-fun m!240691 () Bool)

(assert (=> d!58219 m!240691))

(declare-fun m!240693 () Bool)

(assert (=> d!58219 m!240693))

(declare-fun m!240695 () Bool)

(assert (=> b!212720 m!240695))

(declare-fun m!240697 () Bool)

(assert (=> b!212721 m!240697))

(assert (=> b!212636 d!58219))

(declare-fun d!58221 () Bool)

(assert (=> d!58221 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212640 d!58221))

(declare-fun b!212730 () Bool)

(declare-fun e!138389 () Bool)

(declare-fun call!20119 () Bool)

(assert (=> b!212730 (= e!138389 call!20119)))

(declare-fun b!212731 () Bool)

(declare-fun e!138390 () Bool)

(declare-fun e!138388 () Bool)

(assert (=> b!212731 (= e!138390 e!138388)))

(declare-fun c!35843 () Bool)

(assert (=> b!212731 (= c!35843 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20116 () Bool)

(assert (=> bm!20116 (= call!20119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!212732 () Bool)

(assert (=> b!212732 (= e!138388 e!138389)))

(declare-fun lt!109747 () (_ BitVec 64))

(assert (=> b!212732 (= lt!109747 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109749 () Unit!6442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10147 (_ BitVec 64) (_ BitVec 32)) Unit!6442)

(assert (=> b!212732 (= lt!109749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109747 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212732 (arrayContainsKey!0 _keys!825 lt!109747 #b00000000000000000000000000000000)))

(declare-fun lt!109748 () Unit!6442)

(assert (=> b!212732 (= lt!109748 lt!109749)))

(declare-fun res!104054 () Bool)

(declare-datatypes ((SeekEntryResult!701 0))(
  ( (MissingZero!701 (index!4974 (_ BitVec 32))) (Found!701 (index!4975 (_ BitVec 32))) (Intermediate!701 (undefined!1513 Bool) (index!4976 (_ BitVec 32)) (x!22179 (_ BitVec 32))) (Undefined!701) (MissingVacant!701 (index!4977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10147 (_ BitVec 32)) SeekEntryResult!701)

(assert (=> b!212732 (= res!104054 (= (seekEntryOrOpen!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!701 #b00000000000000000000000000000000)))))

(assert (=> b!212732 (=> (not res!104054) (not e!138389))))

(declare-fun d!58223 () Bool)

(declare-fun res!104055 () Bool)

(assert (=> d!58223 (=> res!104055 e!138390)))

(assert (=> d!58223 (= res!104055 (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> d!58223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138390)))

(declare-fun b!212733 () Bool)

(assert (=> b!212733 (= e!138388 call!20119)))

(assert (= (and d!58223 (not res!104055)) b!212731))

(assert (= (and b!212731 c!35843) b!212732))

(assert (= (and b!212731 (not c!35843)) b!212733))

(assert (= (and b!212732 res!104054) b!212730))

(assert (= (or b!212730 b!212733) bm!20116))

(declare-fun m!240699 () Bool)

(assert (=> b!212731 m!240699))

(assert (=> b!212731 m!240699))

(declare-fun m!240701 () Bool)

(assert (=> b!212731 m!240701))

(declare-fun m!240703 () Bool)

(assert (=> bm!20116 m!240703))

(assert (=> b!212732 m!240699))

(declare-fun m!240705 () Bool)

(assert (=> b!212732 m!240705))

(declare-fun m!240707 () Bool)

(assert (=> b!212732 m!240707))

(assert (=> b!212732 m!240699))

(declare-fun m!240709 () Bool)

(assert (=> b!212732 m!240709))

(assert (=> b!212631 d!58223))

(declare-fun b!212744 () Bool)

(declare-fun e!138399 () Bool)

(declare-fun call!20122 () Bool)

(assert (=> b!212744 (= e!138399 call!20122)))

(declare-fun b!212745 () Bool)

(declare-fun e!138401 () Bool)

(declare-fun contains!1398 (List!3034 (_ BitVec 64)) Bool)

(assert (=> b!212745 (= e!138401 (contains!1398 Nil!3031 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58225 () Bool)

(declare-fun res!104064 () Bool)

(declare-fun e!138402 () Bool)

(assert (=> d!58225 (=> res!104064 e!138402)))

(assert (=> d!58225 (= res!104064 (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> d!58225 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3031) e!138402)))

(declare-fun bm!20119 () Bool)

(declare-fun c!35846 () Bool)

(assert (=> bm!20119 (= call!20122 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35846 (Cons!3030 (select (arr!4816 _keys!825) #b00000000000000000000000000000000) Nil!3031) Nil!3031)))))

(declare-fun b!212746 () Bool)

(assert (=> b!212746 (= e!138399 call!20122)))

(declare-fun b!212747 () Bool)

(declare-fun e!138400 () Bool)

(assert (=> b!212747 (= e!138402 e!138400)))

(declare-fun res!104062 () Bool)

(assert (=> b!212747 (=> (not res!104062) (not e!138400))))

(assert (=> b!212747 (= res!104062 (not e!138401))))

(declare-fun res!104063 () Bool)

(assert (=> b!212747 (=> (not res!104063) (not e!138401))))

(assert (=> b!212747 (= res!104063 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212748 () Bool)

(assert (=> b!212748 (= e!138400 e!138399)))

(assert (=> b!212748 (= c!35846 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58225 (not res!104064)) b!212747))

(assert (= (and b!212747 res!104063) b!212745))

(assert (= (and b!212747 res!104062) b!212748))

(assert (= (and b!212748 c!35846) b!212744))

(assert (= (and b!212748 (not c!35846)) b!212746))

(assert (= (or b!212744 b!212746) bm!20119))

(assert (=> b!212745 m!240699))

(assert (=> b!212745 m!240699))

(declare-fun m!240711 () Bool)

(assert (=> b!212745 m!240711))

(assert (=> bm!20119 m!240699))

(declare-fun m!240713 () Bool)

(assert (=> bm!20119 m!240713))

(assert (=> b!212747 m!240699))

(assert (=> b!212747 m!240699))

(assert (=> b!212747 m!240701))

(assert (=> b!212748 m!240699))

(assert (=> b!212748 m!240699))

(assert (=> b!212748 m!240701))

(assert (=> b!212637 d!58225))

(declare-fun call!20140 () ListLongMap!3065)

(declare-fun call!20137 () ListLongMap!3065)

(declare-fun call!20142 () ListLongMap!3065)

(declare-fun c!35860 () Bool)

(declare-fun call!20138 () ListLongMap!3065)

(declare-fun c!35862 () Bool)

(declare-fun bm!20134 () Bool)

(assert (=> bm!20134 (= call!20137 (+!577 (ite c!35860 call!20138 (ite c!35862 call!20142 call!20140)) (ite (or c!35860 c!35862) (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20135 () Bool)

(assert (=> bm!20135 (= call!20142 call!20138)))

(declare-fun b!212791 () Bool)

(declare-fun e!138436 () Bool)

(declare-fun e!138430 () Bool)

(assert (=> b!212791 (= e!138436 e!138430)))

(declare-fun c!35864 () Bool)

(assert (=> b!212791 (= c!35864 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20136 () Bool)

(declare-fun call!20143 () Bool)

(declare-fun lt!109812 () ListLongMap!3065)

(assert (=> bm!20136 (= call!20143 (contains!1396 lt!109812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212792 () Bool)

(declare-fun res!104088 () Bool)

(assert (=> b!212792 (=> (not res!104088) (not e!138436))))

(declare-fun e!138429 () Bool)

(assert (=> b!212792 (= res!104088 e!138429)))

(declare-fun c!35861 () Bool)

(assert (=> b!212792 (= c!35861 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212793 () Bool)

(declare-fun e!138435 () ListLongMap!3065)

(assert (=> b!212793 (= e!138435 call!20140)))

(declare-fun d!58227 () Bool)

(assert (=> d!58227 e!138436))

(declare-fun res!104083 () Bool)

(assert (=> d!58227 (=> (not res!104083) (not e!138436))))

(assert (=> d!58227 (= res!104083 (or (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))))

(declare-fun lt!109811 () ListLongMap!3065)

(assert (=> d!58227 (= lt!109812 lt!109811)))

(declare-fun lt!109810 () Unit!6442)

(declare-fun e!138441 () Unit!6442)

(assert (=> d!58227 (= lt!109810 e!138441)))

(declare-fun c!35863 () Bool)

(declare-fun e!138434 () Bool)

(assert (=> d!58227 (= c!35863 e!138434)))

(declare-fun res!104087 () Bool)

(assert (=> d!58227 (=> (not res!104087) (not e!138434))))

(assert (=> d!58227 (= res!104087 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun e!138432 () ListLongMap!3065)

(assert (=> d!58227 (= lt!109811 e!138432)))

(assert (=> d!58227 (= c!35860 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58227 (validMask!0 mask!1149)))

(assert (=> d!58227 (= (getCurrentListMap!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109812)))

(declare-fun b!212794 () Bool)

(declare-fun c!35859 () Bool)

(assert (=> b!212794 (= c!35859 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138433 () ListLongMap!3065)

(assert (=> b!212794 (= e!138433 e!138435)))

(declare-fun b!212795 () Bool)

(declare-fun call!20141 () ListLongMap!3065)

(assert (=> b!212795 (= e!138433 call!20141)))

(declare-fun b!212796 () Bool)

(assert (=> b!212796 (= e!138435 call!20141)))

(declare-fun b!212797 () Bool)

(assert (=> b!212797 (= e!138434 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212798 () Bool)

(declare-fun call!20139 () Bool)

(assert (=> b!212798 (= e!138429 (not call!20139))))

(declare-fun bm!20137 () Bool)

(assert (=> bm!20137 (= call!20141 call!20137)))

(declare-fun bm!20138 () Bool)

(assert (=> bm!20138 (= call!20140 call!20142)))

(declare-fun b!212799 () Bool)

(declare-fun e!138440 () Bool)

(assert (=> b!212799 (= e!138429 e!138440)))

(declare-fun res!104089 () Bool)

(assert (=> b!212799 (= res!104089 call!20139)))

(assert (=> b!212799 (=> (not res!104089) (not e!138440))))

(declare-fun b!212800 () Bool)

(declare-fun e!138431 () Bool)

(assert (=> b!212800 (= e!138431 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20139 () Bool)

(assert (=> bm!20139 (= call!20138 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212801 () Bool)

(declare-fun e!138438 () Bool)

(assert (=> b!212801 (= e!138430 e!138438)))

(declare-fun res!104090 () Bool)

(assert (=> b!212801 (= res!104090 call!20143)))

(assert (=> b!212801 (=> (not res!104090) (not e!138438))))

(declare-fun b!212802 () Bool)

(assert (=> b!212802 (= e!138430 (not call!20143))))

(declare-fun b!212803 () Bool)

(declare-fun apply!197 (ListLongMap!3065 (_ BitVec 64)) V!6945)

(assert (=> b!212803 (= e!138440 (= (apply!197 lt!109812 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20140 () Bool)

(assert (=> bm!20140 (= call!20139 (contains!1396 lt!109812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212804 () Bool)

(declare-fun e!138437 () Bool)

(declare-fun e!138439 () Bool)

(assert (=> b!212804 (= e!138437 e!138439)))

(declare-fun res!104085 () Bool)

(assert (=> b!212804 (=> (not res!104085) (not e!138439))))

(assert (=> b!212804 (= res!104085 (contains!1396 lt!109812 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212805 () Bool)

(declare-fun Unit!6444 () Unit!6442)

(assert (=> b!212805 (= e!138441 Unit!6444)))

(declare-fun b!212806 () Bool)

(assert (=> b!212806 (= e!138432 e!138433)))

(assert (=> b!212806 (= c!35862 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212807 () Bool)

(assert (=> b!212807 (= e!138432 (+!577 call!20137 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212808 () Bool)

(declare-fun res!104084 () Bool)

(assert (=> b!212808 (=> (not res!104084) (not e!138436))))

(assert (=> b!212808 (= res!104084 e!138437)))

(declare-fun res!104091 () Bool)

(assert (=> b!212808 (=> res!104091 e!138437)))

(assert (=> b!212808 (= res!104091 (not e!138431))))

(declare-fun res!104086 () Bool)

(assert (=> b!212808 (=> (not res!104086) (not e!138431))))

(assert (=> b!212808 (= res!104086 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212809 () Bool)

(assert (=> b!212809 (= e!138438 (= (apply!197 lt!109812 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212810 () Bool)

(declare-fun lt!109804 () Unit!6442)

(assert (=> b!212810 (= e!138441 lt!109804)))

(declare-fun lt!109808 () ListLongMap!3065)

(assert (=> b!212810 (= lt!109808 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109809 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109796 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109796 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109813 () Unit!6442)

(declare-fun addStillContains!173 (ListLongMap!3065 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6442)

(assert (=> b!212810 (= lt!109813 (addStillContains!173 lt!109808 lt!109809 zeroValue!615 lt!109796))))

(assert (=> b!212810 (contains!1396 (+!577 lt!109808 (tuple2!4151 lt!109809 zeroValue!615)) lt!109796)))

(declare-fun lt!109798 () Unit!6442)

(assert (=> b!212810 (= lt!109798 lt!109813)))

(declare-fun lt!109815 () ListLongMap!3065)

(assert (=> b!212810 (= lt!109815 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109806 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109806 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109800 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109800 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109801 () Unit!6442)

(declare-fun addApplyDifferent!173 (ListLongMap!3065 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6442)

(assert (=> b!212810 (= lt!109801 (addApplyDifferent!173 lt!109815 lt!109806 minValue!615 lt!109800))))

(assert (=> b!212810 (= (apply!197 (+!577 lt!109815 (tuple2!4151 lt!109806 minValue!615)) lt!109800) (apply!197 lt!109815 lt!109800))))

(declare-fun lt!109795 () Unit!6442)

(assert (=> b!212810 (= lt!109795 lt!109801)))

(declare-fun lt!109807 () ListLongMap!3065)

(assert (=> b!212810 (= lt!109807 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109797 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109805 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109805 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109814 () Unit!6442)

(assert (=> b!212810 (= lt!109814 (addApplyDifferent!173 lt!109807 lt!109797 zeroValue!615 lt!109805))))

(assert (=> b!212810 (= (apply!197 (+!577 lt!109807 (tuple2!4151 lt!109797 zeroValue!615)) lt!109805) (apply!197 lt!109807 lt!109805))))

(declare-fun lt!109799 () Unit!6442)

(assert (=> b!212810 (= lt!109799 lt!109814)))

(declare-fun lt!109794 () ListLongMap!3065)

(assert (=> b!212810 (= lt!109794 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109802 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109803 () (_ BitVec 64))

(assert (=> b!212810 (= lt!109803 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212810 (= lt!109804 (addApplyDifferent!173 lt!109794 lt!109802 minValue!615 lt!109803))))

(assert (=> b!212810 (= (apply!197 (+!577 lt!109794 (tuple2!4151 lt!109802 minValue!615)) lt!109803) (apply!197 lt!109794 lt!109803))))

(declare-fun b!212811 () Bool)

(declare-fun get!2583 (ValueCell!2393 V!6945) V!6945)

(declare-fun dynLambda!540 (Int (_ BitVec 64)) V!6945)

(assert (=> b!212811 (= e!138439 (= (apply!197 lt!109812 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)) (get!2583 (select (arr!4817 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 _values!649)))))

(assert (=> b!212811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (= (and d!58227 c!35860) b!212807))

(assert (= (and d!58227 (not c!35860)) b!212806))

(assert (= (and b!212806 c!35862) b!212795))

(assert (= (and b!212806 (not c!35862)) b!212794))

(assert (= (and b!212794 c!35859) b!212796))

(assert (= (and b!212794 (not c!35859)) b!212793))

(assert (= (or b!212796 b!212793) bm!20138))

(assert (= (or b!212795 bm!20138) bm!20135))

(assert (= (or b!212795 b!212796) bm!20137))

(assert (= (or b!212807 bm!20135) bm!20139))

(assert (= (or b!212807 bm!20137) bm!20134))

(assert (= (and d!58227 res!104087) b!212797))

(assert (= (and d!58227 c!35863) b!212810))

(assert (= (and d!58227 (not c!35863)) b!212805))

(assert (= (and d!58227 res!104083) b!212808))

(assert (= (and b!212808 res!104086) b!212800))

(assert (= (and b!212808 (not res!104091)) b!212804))

(assert (= (and b!212804 res!104085) b!212811))

(assert (= (and b!212808 res!104084) b!212792))

(assert (= (and b!212792 c!35861) b!212799))

(assert (= (and b!212792 (not c!35861)) b!212798))

(assert (= (and b!212799 res!104089) b!212803))

(assert (= (or b!212799 b!212798) bm!20140))

(assert (= (and b!212792 res!104088) b!212791))

(assert (= (and b!212791 c!35864) b!212801))

(assert (= (and b!212791 (not c!35864)) b!212802))

(assert (= (and b!212801 res!104090) b!212809))

(assert (= (or b!212801 b!212802) bm!20136))

(declare-fun b_lambda!7753 () Bool)

(assert (=> (not b_lambda!7753) (not b!212811)))

(declare-fun t!7975 () Bool)

(declare-fun tb!2899 () Bool)

(assert (=> (and start!21124 (= defaultEntry!657 defaultEntry!657) t!7975) tb!2899))

(declare-fun result!5001 () Bool)

(assert (=> tb!2899 (= result!5001 tp_is_empty!5473)))

(assert (=> b!212811 t!7975))

(declare-fun b_and!12473 () Bool)

(assert (= b_and!12467 (and (=> t!7975 result!5001) b_and!12473)))

(assert (=> b!212804 m!240699))

(assert (=> b!212804 m!240699))

(declare-fun m!240715 () Bool)

(assert (=> b!212804 m!240715))

(declare-fun m!240717 () Bool)

(assert (=> b!212809 m!240717))

(assert (=> b!212800 m!240699))

(assert (=> b!212800 m!240699))

(assert (=> b!212800 m!240701))

(declare-fun m!240719 () Bool)

(assert (=> bm!20140 m!240719))

(declare-fun m!240721 () Bool)

(assert (=> bm!20136 m!240721))

(assert (=> b!212797 m!240699))

(assert (=> b!212797 m!240699))

(assert (=> b!212797 m!240701))

(declare-fun m!240723 () Bool)

(assert (=> b!212810 m!240723))

(declare-fun m!240725 () Bool)

(assert (=> b!212810 m!240725))

(declare-fun m!240727 () Bool)

(assert (=> b!212810 m!240727))

(declare-fun m!240729 () Bool)

(assert (=> b!212810 m!240729))

(declare-fun m!240731 () Bool)

(assert (=> b!212810 m!240731))

(declare-fun m!240733 () Bool)

(assert (=> b!212810 m!240733))

(assert (=> b!212810 m!240579))

(declare-fun m!240735 () Bool)

(assert (=> b!212810 m!240735))

(declare-fun m!240737 () Bool)

(assert (=> b!212810 m!240737))

(declare-fun m!240739 () Bool)

(assert (=> b!212810 m!240739))

(assert (=> b!212810 m!240737))

(assert (=> b!212810 m!240731))

(declare-fun m!240741 () Bool)

(assert (=> b!212810 m!240741))

(declare-fun m!240743 () Bool)

(assert (=> b!212810 m!240743))

(declare-fun m!240745 () Bool)

(assert (=> b!212810 m!240745))

(declare-fun m!240747 () Bool)

(assert (=> b!212810 m!240747))

(declare-fun m!240749 () Bool)

(assert (=> b!212810 m!240749))

(assert (=> b!212810 m!240723))

(assert (=> b!212810 m!240727))

(assert (=> b!212810 m!240699))

(declare-fun m!240751 () Bool)

(assert (=> b!212810 m!240751))

(declare-fun m!240753 () Bool)

(assert (=> b!212807 m!240753))

(assert (=> bm!20139 m!240579))

(declare-fun m!240755 () Bool)

(assert (=> b!212803 m!240755))

(assert (=> b!212811 m!240699))

(declare-fun m!240757 () Bool)

(assert (=> b!212811 m!240757))

(declare-fun m!240759 () Bool)

(assert (=> b!212811 m!240759))

(assert (=> b!212811 m!240759))

(declare-fun m!240761 () Bool)

(assert (=> b!212811 m!240761))

(declare-fun m!240763 () Bool)

(assert (=> b!212811 m!240763))

(assert (=> b!212811 m!240761))

(assert (=> b!212811 m!240699))

(assert (=> d!58227 m!240589))

(declare-fun m!240765 () Bool)

(assert (=> bm!20134 m!240765))

(assert (=> b!212632 d!58227))

(declare-fun call!20149 () ListLongMap!3065)

(declare-fun bm!20141 () Bool)

(declare-fun call!20147 () ListLongMap!3065)

(declare-fun call!20145 () ListLongMap!3065)

(declare-fun c!35868 () Bool)

(declare-fun c!35866 () Bool)

(declare-fun call!20144 () ListLongMap!3065)

(assert (=> bm!20141 (= call!20144 (+!577 (ite c!35866 call!20145 (ite c!35868 call!20149 call!20147)) (ite (or c!35866 c!35868) (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20142 () Bool)

(assert (=> bm!20142 (= call!20149 call!20145)))

(declare-fun b!212814 () Bool)

(declare-fun e!138449 () Bool)

(declare-fun e!138443 () Bool)

(assert (=> b!212814 (= e!138449 e!138443)))

(declare-fun c!35870 () Bool)

(assert (=> b!212814 (= c!35870 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20143 () Bool)

(declare-fun call!20150 () Bool)

(declare-fun lt!109834 () ListLongMap!3065)

(assert (=> bm!20143 (= call!20150 (contains!1396 lt!109834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212815 () Bool)

(declare-fun res!104097 () Bool)

(assert (=> b!212815 (=> (not res!104097) (not e!138449))))

(declare-fun e!138442 () Bool)

(assert (=> b!212815 (= res!104097 e!138442)))

(declare-fun c!35867 () Bool)

(assert (=> b!212815 (= c!35867 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212816 () Bool)

(declare-fun e!138448 () ListLongMap!3065)

(assert (=> b!212816 (= e!138448 call!20147)))

(declare-fun d!58229 () Bool)

(assert (=> d!58229 e!138449))

(declare-fun res!104092 () Bool)

(assert (=> d!58229 (=> (not res!104092) (not e!138449))))

(assert (=> d!58229 (= res!104092 (or (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))))

(declare-fun lt!109833 () ListLongMap!3065)

(assert (=> d!58229 (= lt!109834 lt!109833)))

(declare-fun lt!109832 () Unit!6442)

(declare-fun e!138454 () Unit!6442)

(assert (=> d!58229 (= lt!109832 e!138454)))

(declare-fun c!35869 () Bool)

(declare-fun e!138447 () Bool)

(assert (=> d!58229 (= c!35869 e!138447)))

(declare-fun res!104096 () Bool)

(assert (=> d!58229 (=> (not res!104096) (not e!138447))))

(assert (=> d!58229 (= res!104096 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun e!138445 () ListLongMap!3065)

(assert (=> d!58229 (= lt!109833 e!138445)))

(assert (=> d!58229 (= c!35866 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58229 (validMask!0 mask!1149)))

(assert (=> d!58229 (= (getCurrentListMap!1084 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109834)))

(declare-fun b!212817 () Bool)

(declare-fun c!35865 () Bool)

(assert (=> b!212817 (= c!35865 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138446 () ListLongMap!3065)

(assert (=> b!212817 (= e!138446 e!138448)))

(declare-fun b!212818 () Bool)

(declare-fun call!20148 () ListLongMap!3065)

(assert (=> b!212818 (= e!138446 call!20148)))

(declare-fun b!212819 () Bool)

(assert (=> b!212819 (= e!138448 call!20148)))

(declare-fun b!212820 () Bool)

(assert (=> b!212820 (= e!138447 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212821 () Bool)

(declare-fun call!20146 () Bool)

(assert (=> b!212821 (= e!138442 (not call!20146))))

(declare-fun bm!20144 () Bool)

(assert (=> bm!20144 (= call!20148 call!20144)))

(declare-fun bm!20145 () Bool)

(assert (=> bm!20145 (= call!20147 call!20149)))

(declare-fun b!212822 () Bool)

(declare-fun e!138453 () Bool)

(assert (=> b!212822 (= e!138442 e!138453)))

(declare-fun res!104098 () Bool)

(assert (=> b!212822 (= res!104098 call!20146)))

(assert (=> b!212822 (=> (not res!104098) (not e!138453))))

(declare-fun b!212823 () Bool)

(declare-fun e!138444 () Bool)

(assert (=> b!212823 (= e!138444 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20146 () Bool)

(assert (=> bm!20146 (= call!20145 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212824 () Bool)

(declare-fun e!138451 () Bool)

(assert (=> b!212824 (= e!138443 e!138451)))

(declare-fun res!104099 () Bool)

(assert (=> b!212824 (= res!104099 call!20150)))

(assert (=> b!212824 (=> (not res!104099) (not e!138451))))

(declare-fun b!212825 () Bool)

(assert (=> b!212825 (= e!138443 (not call!20150))))

(declare-fun b!212826 () Bool)

(assert (=> b!212826 (= e!138453 (= (apply!197 lt!109834 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20147 () Bool)

(assert (=> bm!20147 (= call!20146 (contains!1396 lt!109834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212827 () Bool)

(declare-fun e!138450 () Bool)

(declare-fun e!138452 () Bool)

(assert (=> b!212827 (= e!138450 e!138452)))

(declare-fun res!104094 () Bool)

(assert (=> b!212827 (=> (not res!104094) (not e!138452))))

(assert (=> b!212827 (= res!104094 (contains!1396 lt!109834 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212828 () Bool)

(declare-fun Unit!6445 () Unit!6442)

(assert (=> b!212828 (= e!138454 Unit!6445)))

(declare-fun b!212829 () Bool)

(assert (=> b!212829 (= e!138445 e!138446)))

(assert (=> b!212829 (= c!35868 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212830 () Bool)

(assert (=> b!212830 (= e!138445 (+!577 call!20144 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212831 () Bool)

(declare-fun res!104093 () Bool)

(assert (=> b!212831 (=> (not res!104093) (not e!138449))))

(assert (=> b!212831 (= res!104093 e!138450)))

(declare-fun res!104100 () Bool)

(assert (=> b!212831 (=> res!104100 e!138450)))

(assert (=> b!212831 (= res!104100 (not e!138444))))

(declare-fun res!104095 () Bool)

(assert (=> b!212831 (=> (not res!104095) (not e!138444))))

(assert (=> b!212831 (= res!104095 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212832 () Bool)

(assert (=> b!212832 (= e!138451 (= (apply!197 lt!109834 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212833 () Bool)

(declare-fun lt!109826 () Unit!6442)

(assert (=> b!212833 (= e!138454 lt!109826)))

(declare-fun lt!109830 () ListLongMap!3065)

(assert (=> b!212833 (= lt!109830 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109831 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109818 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109818 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109835 () Unit!6442)

(assert (=> b!212833 (= lt!109835 (addStillContains!173 lt!109830 lt!109831 zeroValue!615 lt!109818))))

(assert (=> b!212833 (contains!1396 (+!577 lt!109830 (tuple2!4151 lt!109831 zeroValue!615)) lt!109818)))

(declare-fun lt!109820 () Unit!6442)

(assert (=> b!212833 (= lt!109820 lt!109835)))

(declare-fun lt!109837 () ListLongMap!3065)

(assert (=> b!212833 (= lt!109837 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109828 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109828 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109822 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109822 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109823 () Unit!6442)

(assert (=> b!212833 (= lt!109823 (addApplyDifferent!173 lt!109837 lt!109828 minValue!615 lt!109822))))

(assert (=> b!212833 (= (apply!197 (+!577 lt!109837 (tuple2!4151 lt!109828 minValue!615)) lt!109822) (apply!197 lt!109837 lt!109822))))

(declare-fun lt!109817 () Unit!6442)

(assert (=> b!212833 (= lt!109817 lt!109823)))

(declare-fun lt!109829 () ListLongMap!3065)

(assert (=> b!212833 (= lt!109829 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109819 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109827 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109827 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109836 () Unit!6442)

(assert (=> b!212833 (= lt!109836 (addApplyDifferent!173 lt!109829 lt!109819 zeroValue!615 lt!109827))))

(assert (=> b!212833 (= (apply!197 (+!577 lt!109829 (tuple2!4151 lt!109819 zeroValue!615)) lt!109827) (apply!197 lt!109829 lt!109827))))

(declare-fun lt!109821 () Unit!6442)

(assert (=> b!212833 (= lt!109821 lt!109836)))

(declare-fun lt!109816 () ListLongMap!3065)

(assert (=> b!212833 (= lt!109816 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109824 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109825 () (_ BitVec 64))

(assert (=> b!212833 (= lt!109825 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212833 (= lt!109826 (addApplyDifferent!173 lt!109816 lt!109824 minValue!615 lt!109825))))

(assert (=> b!212833 (= (apply!197 (+!577 lt!109816 (tuple2!4151 lt!109824 minValue!615)) lt!109825) (apply!197 lt!109816 lt!109825))))

(declare-fun b!212834 () Bool)

(assert (=> b!212834 (= e!138452 (= (apply!197 lt!109834 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)) (get!2583 (select (arr!4817 lt!109670) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 lt!109670)))))

(assert (=> b!212834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (= (and d!58229 c!35866) b!212830))

(assert (= (and d!58229 (not c!35866)) b!212829))

(assert (= (and b!212829 c!35868) b!212818))

(assert (= (and b!212829 (not c!35868)) b!212817))

(assert (= (and b!212817 c!35865) b!212819))

(assert (= (and b!212817 (not c!35865)) b!212816))

(assert (= (or b!212819 b!212816) bm!20145))

(assert (= (or b!212818 bm!20145) bm!20142))

(assert (= (or b!212818 b!212819) bm!20144))

(assert (= (or b!212830 bm!20142) bm!20146))

(assert (= (or b!212830 bm!20144) bm!20141))

(assert (= (and d!58229 res!104096) b!212820))

(assert (= (and d!58229 c!35869) b!212833))

(assert (= (and d!58229 (not c!35869)) b!212828))

(assert (= (and d!58229 res!104092) b!212831))

(assert (= (and b!212831 res!104095) b!212823))

(assert (= (and b!212831 (not res!104100)) b!212827))

(assert (= (and b!212827 res!104094) b!212834))

(assert (= (and b!212831 res!104093) b!212815))

(assert (= (and b!212815 c!35867) b!212822))

(assert (= (and b!212815 (not c!35867)) b!212821))

(assert (= (and b!212822 res!104098) b!212826))

(assert (= (or b!212822 b!212821) bm!20147))

(assert (= (and b!212815 res!104097) b!212814))

(assert (= (and b!212814 c!35870) b!212824))

(assert (= (and b!212814 (not c!35870)) b!212825))

(assert (= (and b!212824 res!104099) b!212832))

(assert (= (or b!212824 b!212825) bm!20143))

(declare-fun b_lambda!7755 () Bool)

(assert (=> (not b_lambda!7755) (not b!212834)))

(assert (=> b!212834 t!7975))

(declare-fun b_and!12475 () Bool)

(assert (= b_and!12473 (and (=> t!7975 result!5001) b_and!12475)))

(assert (=> b!212827 m!240699))

(assert (=> b!212827 m!240699))

(declare-fun m!240767 () Bool)

(assert (=> b!212827 m!240767))

(declare-fun m!240769 () Bool)

(assert (=> b!212832 m!240769))

(assert (=> b!212823 m!240699))

(assert (=> b!212823 m!240699))

(assert (=> b!212823 m!240701))

(declare-fun m!240771 () Bool)

(assert (=> bm!20147 m!240771))

(declare-fun m!240773 () Bool)

(assert (=> bm!20143 m!240773))

(assert (=> b!212820 m!240699))

(assert (=> b!212820 m!240699))

(assert (=> b!212820 m!240701))

(declare-fun m!240775 () Bool)

(assert (=> b!212833 m!240775))

(declare-fun m!240777 () Bool)

(assert (=> b!212833 m!240777))

(declare-fun m!240779 () Bool)

(assert (=> b!212833 m!240779))

(declare-fun m!240781 () Bool)

(assert (=> b!212833 m!240781))

(declare-fun m!240783 () Bool)

(assert (=> b!212833 m!240783))

(declare-fun m!240785 () Bool)

(assert (=> b!212833 m!240785))

(assert (=> b!212833 m!240573))

(declare-fun m!240787 () Bool)

(assert (=> b!212833 m!240787))

(declare-fun m!240789 () Bool)

(assert (=> b!212833 m!240789))

(declare-fun m!240791 () Bool)

(assert (=> b!212833 m!240791))

(assert (=> b!212833 m!240789))

(assert (=> b!212833 m!240783))

(declare-fun m!240793 () Bool)

(assert (=> b!212833 m!240793))

(declare-fun m!240795 () Bool)

(assert (=> b!212833 m!240795))

(declare-fun m!240797 () Bool)

(assert (=> b!212833 m!240797))

(declare-fun m!240799 () Bool)

(assert (=> b!212833 m!240799))

(declare-fun m!240801 () Bool)

(assert (=> b!212833 m!240801))

(assert (=> b!212833 m!240775))

(assert (=> b!212833 m!240779))

(assert (=> b!212833 m!240699))

(declare-fun m!240803 () Bool)

(assert (=> b!212833 m!240803))

(declare-fun m!240805 () Bool)

(assert (=> b!212830 m!240805))

(assert (=> bm!20146 m!240573))

(declare-fun m!240807 () Bool)

(assert (=> b!212826 m!240807))

(assert (=> b!212834 m!240699))

(declare-fun m!240809 () Bool)

(assert (=> b!212834 m!240809))

(declare-fun m!240811 () Bool)

(assert (=> b!212834 m!240811))

(assert (=> b!212834 m!240811))

(assert (=> b!212834 m!240761))

(declare-fun m!240813 () Bool)

(assert (=> b!212834 m!240813))

(assert (=> b!212834 m!240761))

(assert (=> b!212834 m!240699))

(assert (=> d!58229 m!240589))

(declare-fun m!240815 () Bool)

(assert (=> bm!20141 m!240815))

(assert (=> b!212632 d!58229))

(declare-fun d!58231 () Bool)

(declare-fun e!138455 () Bool)

(assert (=> d!58231 e!138455))

(declare-fun res!104101 () Bool)

(assert (=> d!58231 (=> (not res!104101) (not e!138455))))

(declare-fun lt!109840 () ListLongMap!3065)

(assert (=> d!58231 (= res!104101 (contains!1396 lt!109840 (_1!2086 (tuple2!4151 k0!843 v!520))))))

(declare-fun lt!109838 () List!3033)

(assert (=> d!58231 (= lt!109840 (ListLongMap!3066 lt!109838))))

(declare-fun lt!109841 () Unit!6442)

(declare-fun lt!109839 () Unit!6442)

(assert (=> d!58231 (= lt!109841 lt!109839)))

(assert (=> d!58231 (= (getValueByKey!256 lt!109838 (_1!2086 (tuple2!4151 k0!843 v!520))) (Some!261 (_2!2086 (tuple2!4151 k0!843 v!520))))))

(assert (=> d!58231 (= lt!109839 (lemmaContainsTupThenGetReturnValue!143 lt!109838 (_1!2086 (tuple2!4151 k0!843 v!520)) (_2!2086 (tuple2!4151 k0!843 v!520))))))

(assert (=> d!58231 (= lt!109838 (insertStrictlySorted!146 (toList!1548 lt!109674) (_1!2086 (tuple2!4151 k0!843 v!520)) (_2!2086 (tuple2!4151 k0!843 v!520))))))

(assert (=> d!58231 (= (+!577 lt!109674 (tuple2!4151 k0!843 v!520)) lt!109840)))

(declare-fun b!212835 () Bool)

(declare-fun res!104102 () Bool)

(assert (=> b!212835 (=> (not res!104102) (not e!138455))))

(assert (=> b!212835 (= res!104102 (= (getValueByKey!256 (toList!1548 lt!109840) (_1!2086 (tuple2!4151 k0!843 v!520))) (Some!261 (_2!2086 (tuple2!4151 k0!843 v!520)))))))

(declare-fun b!212836 () Bool)

(assert (=> b!212836 (= e!138455 (contains!1397 (toList!1548 lt!109840) (tuple2!4151 k0!843 v!520)))))

(assert (= (and d!58231 res!104101) b!212835))

(assert (= (and b!212835 res!104102) b!212836))

(declare-fun m!240817 () Bool)

(assert (=> d!58231 m!240817))

(declare-fun m!240819 () Bool)

(assert (=> d!58231 m!240819))

(declare-fun m!240821 () Bool)

(assert (=> d!58231 m!240821))

(declare-fun m!240823 () Bool)

(assert (=> d!58231 m!240823))

(declare-fun m!240825 () Bool)

(assert (=> b!212835 m!240825))

(declare-fun m!240827 () Bool)

(assert (=> b!212836 m!240827))

(assert (=> b!212632 d!58231))

(declare-fun b!212861 () Bool)

(declare-fun e!138472 () Bool)

(declare-fun lt!109857 () ListLongMap!3065)

(declare-fun isEmpty!504 (ListLongMap!3065) Bool)

(assert (=> b!212861 (= e!138472 (isEmpty!504 lt!109857))))

(declare-fun b!212862 () Bool)

(declare-fun e!138475 () ListLongMap!3065)

(declare-fun e!138471 () ListLongMap!3065)

(assert (=> b!212862 (= e!138475 e!138471)))

(declare-fun c!35880 () Bool)

(assert (=> b!212862 (= c!35880 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212863 () Bool)

(declare-fun e!138470 () Bool)

(assert (=> b!212863 (= e!138470 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212863 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212864 () Bool)

(declare-fun res!104111 () Bool)

(declare-fun e!138473 () Bool)

(assert (=> b!212864 (=> (not res!104111) (not e!138473))))

(assert (=> b!212864 (= res!104111 (not (contains!1396 lt!109857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212865 () Bool)

(declare-fun lt!109862 () Unit!6442)

(declare-fun lt!109859 () Unit!6442)

(assert (=> b!212865 (= lt!109862 lt!109859)))

(declare-fun lt!109856 () ListLongMap!3065)

(declare-fun lt!109861 () (_ BitVec 64))

(declare-fun lt!109858 () (_ BitVec 64))

(declare-fun lt!109860 () V!6945)

(assert (=> b!212865 (not (contains!1396 (+!577 lt!109856 (tuple2!4151 lt!109861 lt!109860)) lt!109858))))

(declare-fun addStillNotContains!108 (ListLongMap!3065 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6442)

(assert (=> b!212865 (= lt!109859 (addStillNotContains!108 lt!109856 lt!109861 lt!109860 lt!109858))))

(assert (=> b!212865 (= lt!109858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212865 (= lt!109860 (get!2583 (select (arr!4817 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212865 (= lt!109861 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20153 () ListLongMap!3065)

(assert (=> b!212865 (= lt!109856 call!20153)))

(assert (=> b!212865 (= e!138471 (+!577 call!20153 (tuple2!4151 (select (arr!4816 _keys!825) #b00000000000000000000000000000000) (get!2583 (select (arr!4817 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212866 () Bool)

(assert (=> b!212866 (= e!138475 (ListLongMap!3066 Nil!3030))))

(declare-fun bm!20150 () Bool)

(assert (=> bm!20150 (= call!20153 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212867 () Bool)

(declare-fun e!138476 () Bool)

(assert (=> b!212867 (= e!138473 e!138476)))

(declare-fun c!35882 () Bool)

(assert (=> b!212867 (= c!35882 e!138470)))

(declare-fun res!104114 () Bool)

(assert (=> b!212867 (=> (not res!104114) (not e!138470))))

(assert (=> b!212867 (= res!104114 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212868 () Bool)

(assert (=> b!212868 (= e!138476 e!138472)))

(declare-fun c!35881 () Bool)

(assert (=> b!212868 (= c!35881 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212869 () Bool)

(assert (=> b!212869 (= e!138472 (= lt!109857 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58233 () Bool)

(assert (=> d!58233 e!138473))

(declare-fun res!104112 () Bool)

(assert (=> d!58233 (=> (not res!104112) (not e!138473))))

(assert (=> d!58233 (= res!104112 (not (contains!1396 lt!109857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58233 (= lt!109857 e!138475)))

(declare-fun c!35879 () Bool)

(assert (=> d!58233 (= c!35879 (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> d!58233 (validMask!0 mask!1149)))

(assert (=> d!58233 (= (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109857)))

(declare-fun b!212870 () Bool)

(assert (=> b!212870 (= e!138471 call!20153)))

(declare-fun b!212871 () Bool)

(assert (=> b!212871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> b!212871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 _values!649)))))

(declare-fun e!138474 () Bool)

(assert (=> b!212871 (= e!138474 (= (apply!197 lt!109857 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)) (get!2583 (select (arr!4817 _values!649) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212872 () Bool)

(assert (=> b!212872 (= e!138476 e!138474)))

(assert (=> b!212872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun res!104113 () Bool)

(assert (=> b!212872 (= res!104113 (contains!1396 lt!109857 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212872 (=> (not res!104113) (not e!138474))))

(assert (= (and d!58233 c!35879) b!212866))

(assert (= (and d!58233 (not c!35879)) b!212862))

(assert (= (and b!212862 c!35880) b!212865))

(assert (= (and b!212862 (not c!35880)) b!212870))

(assert (= (or b!212865 b!212870) bm!20150))

(assert (= (and d!58233 res!104112) b!212864))

(assert (= (and b!212864 res!104111) b!212867))

(assert (= (and b!212867 res!104114) b!212863))

(assert (= (and b!212867 c!35882) b!212872))

(assert (= (and b!212867 (not c!35882)) b!212868))

(assert (= (and b!212872 res!104113) b!212871))

(assert (= (and b!212868 c!35881) b!212869))

(assert (= (and b!212868 (not c!35881)) b!212861))

(declare-fun b_lambda!7757 () Bool)

(assert (=> (not b_lambda!7757) (not b!212865)))

(assert (=> b!212865 t!7975))

(declare-fun b_and!12477 () Bool)

(assert (= b_and!12475 (and (=> t!7975 result!5001) b_and!12477)))

(declare-fun b_lambda!7759 () Bool)

(assert (=> (not b_lambda!7759) (not b!212871)))

(assert (=> b!212871 t!7975))

(declare-fun b_and!12479 () Bool)

(assert (= b_and!12477 (and (=> t!7975 result!5001) b_and!12479)))

(assert (=> b!212862 m!240699))

(assert (=> b!212862 m!240699))

(assert (=> b!212862 m!240701))

(assert (=> b!212871 m!240699))

(declare-fun m!240829 () Bool)

(assert (=> b!212871 m!240829))

(assert (=> b!212871 m!240699))

(assert (=> b!212871 m!240761))

(assert (=> b!212871 m!240759))

(assert (=> b!212871 m!240761))

(assert (=> b!212871 m!240763))

(assert (=> b!212871 m!240759))

(declare-fun m!240831 () Bool)

(assert (=> b!212864 m!240831))

(declare-fun m!240833 () Bool)

(assert (=> b!212865 m!240833))

(declare-fun m!240835 () Bool)

(assert (=> b!212865 m!240835))

(assert (=> b!212865 m!240699))

(assert (=> b!212865 m!240761))

(assert (=> b!212865 m!240759))

(assert (=> b!212865 m!240761))

(assert (=> b!212865 m!240763))

(assert (=> b!212865 m!240759))

(declare-fun m!240837 () Bool)

(assert (=> b!212865 m!240837))

(assert (=> b!212865 m!240833))

(declare-fun m!240839 () Bool)

(assert (=> b!212865 m!240839))

(assert (=> b!212872 m!240699))

(assert (=> b!212872 m!240699))

(declare-fun m!240841 () Bool)

(assert (=> b!212872 m!240841))

(declare-fun m!240843 () Bool)

(assert (=> d!58233 m!240843))

(assert (=> d!58233 m!240589))

(declare-fun m!240845 () Bool)

(assert (=> b!212861 m!240845))

(declare-fun m!240847 () Bool)

(assert (=> bm!20150 m!240847))

(assert (=> b!212863 m!240699))

(assert (=> b!212863 m!240699))

(assert (=> b!212863 m!240701))

(assert (=> b!212869 m!240847))

(assert (=> b!212632 d!58233))

(declare-fun b!212873 () Bool)

(declare-fun e!138479 () Bool)

(declare-fun lt!109864 () ListLongMap!3065)

(assert (=> b!212873 (= e!138479 (isEmpty!504 lt!109864))))

(declare-fun b!212874 () Bool)

(declare-fun e!138482 () ListLongMap!3065)

(declare-fun e!138478 () ListLongMap!3065)

(assert (=> b!212874 (= e!138482 e!138478)))

(declare-fun c!35884 () Bool)

(assert (=> b!212874 (= c!35884 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212875 () Bool)

(declare-fun e!138477 () Bool)

(assert (=> b!212875 (= e!138477 (validKeyInArray!0 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212875 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212876 () Bool)

(declare-fun res!104115 () Bool)

(declare-fun e!138480 () Bool)

(assert (=> b!212876 (=> (not res!104115) (not e!138480))))

(assert (=> b!212876 (= res!104115 (not (contains!1396 lt!109864 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212877 () Bool)

(declare-fun lt!109869 () Unit!6442)

(declare-fun lt!109866 () Unit!6442)

(assert (=> b!212877 (= lt!109869 lt!109866)))

(declare-fun lt!109868 () (_ BitVec 64))

(declare-fun lt!109863 () ListLongMap!3065)

(declare-fun lt!109865 () (_ BitVec 64))

(declare-fun lt!109867 () V!6945)

(assert (=> b!212877 (not (contains!1396 (+!577 lt!109863 (tuple2!4151 lt!109868 lt!109867)) lt!109865))))

(assert (=> b!212877 (= lt!109866 (addStillNotContains!108 lt!109863 lt!109868 lt!109867 lt!109865))))

(assert (=> b!212877 (= lt!109865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212877 (= lt!109867 (get!2583 (select (arr!4817 lt!109670) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212877 (= lt!109868 (select (arr!4816 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20154 () ListLongMap!3065)

(assert (=> b!212877 (= lt!109863 call!20154)))

(assert (=> b!212877 (= e!138478 (+!577 call!20154 (tuple2!4151 (select (arr!4816 _keys!825) #b00000000000000000000000000000000) (get!2583 (select (arr!4817 lt!109670) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212878 () Bool)

(assert (=> b!212878 (= e!138482 (ListLongMap!3066 Nil!3030))))

(declare-fun bm!20151 () Bool)

(assert (=> bm!20151 (= call!20154 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212879 () Bool)

(declare-fun e!138483 () Bool)

(assert (=> b!212879 (= e!138480 e!138483)))

(declare-fun c!35886 () Bool)

(assert (=> b!212879 (= c!35886 e!138477)))

(declare-fun res!104118 () Bool)

(assert (=> b!212879 (=> (not res!104118) (not e!138477))))

(assert (=> b!212879 (= res!104118 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212880 () Bool)

(assert (=> b!212880 (= e!138483 e!138479)))

(declare-fun c!35885 () Bool)

(assert (=> b!212880 (= c!35885 (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun b!212881 () Bool)

(assert (=> b!212881 (= e!138479 (= lt!109864 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58235 () Bool)

(assert (=> d!58235 e!138480))

(declare-fun res!104116 () Bool)

(assert (=> d!58235 (=> (not res!104116) (not e!138480))))

(assert (=> d!58235 (= res!104116 (not (contains!1396 lt!109864 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58235 (= lt!109864 e!138482)))

(declare-fun c!35883 () Bool)

(assert (=> d!58235 (= c!35883 (bvsge #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> d!58235 (validMask!0 mask!1149)))

(assert (=> d!58235 (= (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109864)))

(declare-fun b!212882 () Bool)

(assert (=> b!212882 (= e!138478 call!20154)))

(declare-fun b!212883 () Bool)

(assert (=> b!212883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> b!212883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 lt!109670)))))

(declare-fun e!138481 () Bool)

(assert (=> b!212883 (= e!138481 (= (apply!197 lt!109864 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)) (get!2583 (select (arr!4817 lt!109670) #b00000000000000000000000000000000) (dynLambda!540 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212884 () Bool)

(assert (=> b!212884 (= e!138483 e!138481)))

(assert (=> b!212884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(declare-fun res!104117 () Bool)

(assert (=> b!212884 (= res!104117 (contains!1396 lt!109864 (select (arr!4816 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212884 (=> (not res!104117) (not e!138481))))

(assert (= (and d!58235 c!35883) b!212878))

(assert (= (and d!58235 (not c!35883)) b!212874))

(assert (= (and b!212874 c!35884) b!212877))

(assert (= (and b!212874 (not c!35884)) b!212882))

(assert (= (or b!212877 b!212882) bm!20151))

(assert (= (and d!58235 res!104116) b!212876))

(assert (= (and b!212876 res!104115) b!212879))

(assert (= (and b!212879 res!104118) b!212875))

(assert (= (and b!212879 c!35886) b!212884))

(assert (= (and b!212879 (not c!35886)) b!212880))

(assert (= (and b!212884 res!104117) b!212883))

(assert (= (and b!212880 c!35885) b!212881))

(assert (= (and b!212880 (not c!35885)) b!212873))

(declare-fun b_lambda!7761 () Bool)

(assert (=> (not b_lambda!7761) (not b!212877)))

(assert (=> b!212877 t!7975))

(declare-fun b_and!12481 () Bool)

(assert (= b_and!12479 (and (=> t!7975 result!5001) b_and!12481)))

(declare-fun b_lambda!7763 () Bool)

(assert (=> (not b_lambda!7763) (not b!212883)))

(assert (=> b!212883 t!7975))

(declare-fun b_and!12483 () Bool)

(assert (= b_and!12481 (and (=> t!7975 result!5001) b_and!12483)))

(assert (=> b!212874 m!240699))

(assert (=> b!212874 m!240699))

(assert (=> b!212874 m!240701))

(assert (=> b!212883 m!240699))

(declare-fun m!240849 () Bool)

(assert (=> b!212883 m!240849))

(assert (=> b!212883 m!240699))

(assert (=> b!212883 m!240761))

(assert (=> b!212883 m!240811))

(assert (=> b!212883 m!240761))

(assert (=> b!212883 m!240813))

(assert (=> b!212883 m!240811))

(declare-fun m!240851 () Bool)

(assert (=> b!212876 m!240851))

(declare-fun m!240853 () Bool)

(assert (=> b!212877 m!240853))

(declare-fun m!240855 () Bool)

(assert (=> b!212877 m!240855))

(assert (=> b!212877 m!240699))

(assert (=> b!212877 m!240761))

(assert (=> b!212877 m!240811))

(assert (=> b!212877 m!240761))

(assert (=> b!212877 m!240813))

(assert (=> b!212877 m!240811))

(declare-fun m!240857 () Bool)

(assert (=> b!212877 m!240857))

(assert (=> b!212877 m!240853))

(declare-fun m!240859 () Bool)

(assert (=> b!212877 m!240859))

(assert (=> b!212884 m!240699))

(assert (=> b!212884 m!240699))

(declare-fun m!240861 () Bool)

(assert (=> b!212884 m!240861))

(declare-fun m!240863 () Bool)

(assert (=> d!58235 m!240863))

(assert (=> d!58235 m!240589))

(declare-fun m!240865 () Bool)

(assert (=> b!212873 m!240865))

(declare-fun m!240867 () Bool)

(assert (=> bm!20151 m!240867))

(assert (=> b!212875 m!240699))

(assert (=> b!212875 m!240699))

(assert (=> b!212875 m!240701))

(assert (=> b!212881 m!240867))

(assert (=> b!212632 d!58235))

(declare-fun b!212891 () Bool)

(declare-fun e!138488 () Bool)

(declare-fun e!138489 () Bool)

(assert (=> b!212891 (= e!138488 e!138489)))

(declare-fun c!35889 () Bool)

(assert (=> b!212891 (= c!35889 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!212892 () Bool)

(declare-fun call!20160 () ListLongMap!3065)

(declare-fun call!20159 () ListLongMap!3065)

(assert (=> b!212892 (= e!138489 (= call!20160 (+!577 call!20159 (tuple2!4151 k0!843 v!520))))))

(declare-fun d!58237 () Bool)

(assert (=> d!58237 e!138488))

(declare-fun res!104121 () Bool)

(assert (=> d!58237 (=> (not res!104121) (not e!138488))))

(assert (=> d!58237 (= res!104121 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5142 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5142 _values!649))))))))

(declare-fun lt!109872 () Unit!6442)

(declare-fun choose!1088 (array!10147 array!10149 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) (_ BitVec 64) V!6945 (_ BitVec 32) Int) Unit!6442)

(assert (=> d!58237 (= lt!109872 (choose!1088 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5141 _keys!825)))))

(assert (=> d!58237 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109872)))

(declare-fun b!212893 () Bool)

(assert (=> b!212893 (= e!138489 (= call!20160 call!20159))))

(declare-fun bm!20156 () Bool)

(assert (=> bm!20156 (= call!20160 (getCurrentListMapNoExtraKeys!507 _keys!825 (array!10150 (store (arr!4817 _values!649) i!601 (ValueCellFull!2393 v!520)) (size!5142 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20157 () Bool)

(assert (=> bm!20157 (= call!20159 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58237 res!104121) b!212891))

(assert (= (and b!212891 c!35889) b!212892))

(assert (= (and b!212891 (not c!35889)) b!212893))

(assert (= (or b!212892 b!212893) bm!20156))

(assert (= (or b!212892 b!212893) bm!20157))

(declare-fun m!240869 () Bool)

(assert (=> b!212892 m!240869))

(declare-fun m!240871 () Bool)

(assert (=> d!58237 m!240871))

(assert (=> bm!20156 m!240575))

(declare-fun m!240873 () Bool)

(assert (=> bm!20156 m!240873))

(assert (=> bm!20157 m!240579))

(assert (=> b!212632 d!58237))

(declare-fun d!58239 () Bool)

(declare-fun e!138490 () Bool)

(assert (=> d!58239 e!138490))

(declare-fun res!104122 () Bool)

(assert (=> d!58239 (=> (not res!104122) (not e!138490))))

(declare-fun lt!109875 () ListLongMap!3065)

(assert (=> d!58239 (= res!104122 (contains!1396 lt!109875 (_1!2086 lt!109675)))))

(declare-fun lt!109873 () List!3033)

(assert (=> d!58239 (= lt!109875 (ListLongMap!3066 lt!109873))))

(declare-fun lt!109876 () Unit!6442)

(declare-fun lt!109874 () Unit!6442)

(assert (=> d!58239 (= lt!109876 lt!109874)))

(assert (=> d!58239 (= (getValueByKey!256 lt!109873 (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675)))))

(assert (=> d!58239 (= lt!109874 (lemmaContainsTupThenGetReturnValue!143 lt!109873 (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(assert (=> d!58239 (= lt!109873 (insertStrictlySorted!146 (toList!1548 lt!109676) (_1!2086 lt!109675) (_2!2086 lt!109675)))))

(assert (=> d!58239 (= (+!577 lt!109676 lt!109675) lt!109875)))

(declare-fun b!212894 () Bool)

(declare-fun res!104123 () Bool)

(assert (=> b!212894 (=> (not res!104123) (not e!138490))))

(assert (=> b!212894 (= res!104123 (= (getValueByKey!256 (toList!1548 lt!109875) (_1!2086 lt!109675)) (Some!261 (_2!2086 lt!109675))))))

(declare-fun b!212895 () Bool)

(assert (=> b!212895 (= e!138490 (contains!1397 (toList!1548 lt!109875) lt!109675))))

(assert (= (and d!58239 res!104122) b!212894))

(assert (= (and b!212894 res!104123) b!212895))

(declare-fun m!240875 () Bool)

(assert (=> d!58239 m!240875))

(declare-fun m!240877 () Bool)

(assert (=> d!58239 m!240877))

(declare-fun m!240879 () Bool)

(assert (=> d!58239 m!240879))

(declare-fun m!240881 () Bool)

(assert (=> d!58239 m!240881))

(declare-fun m!240883 () Bool)

(assert (=> b!212894 m!240883))

(declare-fun m!240885 () Bool)

(assert (=> b!212895 m!240885))

(assert (=> b!212638 d!58239))

(declare-fun b!212903 () Bool)

(declare-fun e!138496 () Bool)

(assert (=> b!212903 (= e!138496 tp_is_empty!5473)))

(declare-fun mapNonEmpty!9311 () Bool)

(declare-fun mapRes!9311 () Bool)

(declare-fun tp!19913 () Bool)

(declare-fun e!138495 () Bool)

(assert (=> mapNonEmpty!9311 (= mapRes!9311 (and tp!19913 e!138495))))

(declare-fun mapKey!9311 () (_ BitVec 32))

(declare-fun mapValue!9311 () ValueCell!2393)

(declare-fun mapRest!9311 () (Array (_ BitVec 32) ValueCell!2393))

(assert (=> mapNonEmpty!9311 (= mapRest!9302 (store mapRest!9311 mapKey!9311 mapValue!9311))))

(declare-fun mapIsEmpty!9311 () Bool)

(assert (=> mapIsEmpty!9311 mapRes!9311))

(declare-fun b!212902 () Bool)

(assert (=> b!212902 (= e!138495 tp_is_empty!5473)))

(declare-fun condMapEmpty!9311 () Bool)

(declare-fun mapDefault!9311 () ValueCell!2393)

(assert (=> mapNonEmpty!9302 (= condMapEmpty!9311 (= mapRest!9302 ((as const (Array (_ BitVec 32) ValueCell!2393)) mapDefault!9311)))))

(assert (=> mapNonEmpty!9302 (= tp!19898 (and e!138496 mapRes!9311))))

(assert (= (and mapNonEmpty!9302 condMapEmpty!9311) mapIsEmpty!9311))

(assert (= (and mapNonEmpty!9302 (not condMapEmpty!9311)) mapNonEmpty!9311))

(assert (= (and mapNonEmpty!9311 ((_ is ValueCellFull!2393) mapValue!9311)) b!212902))

(assert (= (and mapNonEmpty!9302 ((_ is ValueCellFull!2393) mapDefault!9311)) b!212903))

(declare-fun m!240887 () Bool)

(assert (=> mapNonEmpty!9311 m!240887))

(declare-fun b_lambda!7765 () Bool)

(assert (= b_lambda!7759 (or (and start!21124 b_free!5611) b_lambda!7765)))

(declare-fun b_lambda!7767 () Bool)

(assert (= b_lambda!7753 (or (and start!21124 b_free!5611) b_lambda!7767)))

(declare-fun b_lambda!7769 () Bool)

(assert (= b_lambda!7763 (or (and start!21124 b_free!5611) b_lambda!7769)))

(declare-fun b_lambda!7771 () Bool)

(assert (= b_lambda!7761 (or (and start!21124 b_free!5611) b_lambda!7771)))

(declare-fun b_lambda!7773 () Bool)

(assert (= b_lambda!7755 (or (and start!21124 b_free!5611) b_lambda!7773)))

(declare-fun b_lambda!7775 () Bool)

(assert (= b_lambda!7757 (or (and start!21124 b_free!5611) b_lambda!7775)))

(check-sat (not b!212820) (not b_lambda!7773) b_and!12483 (not d!58227) (not b!212835) (not b!212748) (not b_lambda!7767) (not b_lambda!7769) (not b!212865) (not b!212720) (not b!212721) (not b!212797) (not bm!20151) (not b!212873) (not b_next!5611) (not b!212875) (not b_lambda!7765) (not d!58235) (not b!212747) (not b!212876) (not bm!20147) (not b!212874) (not b!212804) (not b!212883) (not bm!20134) (not bm!20156) (not bm!20136) (not b!212877) (not mapNonEmpty!9311) (not b!212871) (not b!212863) (not b!212895) (not b!212810) tp_is_empty!5473 (not d!58217) (not b!212881) (not b!212809) (not b!212803) (not bm!20139) (not bm!20116) (not b!212884) (not b!212869) (not d!58231) (not b_lambda!7775) (not d!58219) (not d!58229) (not b_lambda!7771) (not b!212827) (not bm!20146) (not b!212800) (not b!212823) (not bm!20143) (not b!212826) (not bm!20141) (not b!212807) (not b!212834) (not d!58233) (not b!212861) (not b!212718) (not b!212862) (not b!212894) (not b!212745) (not b!212892) (not b!212830) (not bm!20140) (not b!212811) (not bm!20150) (not bm!20157) (not b!212832) (not b!212732) (not b!212836) (not d!58239) (not b!212864) (not bm!20119) (not b!212833) (not b!212719) (not d!58237) (not b!212872) (not b!212731))
(check-sat b_and!12483 (not b_next!5611))
