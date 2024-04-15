; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20898 () Bool)

(assert start!20898)

(declare-fun b_free!5527 () Bool)

(declare-fun b_next!5527 () Bool)

(assert (=> start!20898 (= b_free!5527 (not b_next!5527))))

(declare-fun tp!19625 () Bool)

(declare-fun b_and!12259 () Bool)

(assert (=> start!20898 (= tp!19625 b_and!12259)))

(declare-fun b!209622 () Bool)

(declare-fun res!102188 () Bool)

(declare-fun e!136541 () Bool)

(assert (=> b!209622 (=> (not res!102188) (not e!136541))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9965 0))(
  ( (array!9966 (arr!4731 (Array (_ BitVec 32) (_ BitVec 64))) (size!5057 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9965)

(assert (=> b!209622 (= res!102188 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5057 _keys!825))))))

(declare-fun mapIsEmpty!9155 () Bool)

(declare-fun mapRes!9155 () Bool)

(assert (=> mapIsEmpty!9155 mapRes!9155))

(declare-fun b!209623 () Bool)

(declare-fun e!136543 () Bool)

(declare-fun tp_is_empty!5389 () Bool)

(assert (=> b!209623 (= e!136543 tp_is_empty!5389)))

(declare-datatypes ((V!6833 0))(
  ( (V!6834 (val!2739 Int)) )
))
(declare-datatypes ((tuple2!4116 0))(
  ( (tuple2!4117 (_1!2069 (_ BitVec 64)) (_2!2069 V!6833)) )
))
(declare-datatypes ((List!3026 0))(
  ( (Nil!3023) (Cons!3022 (h!3664 tuple2!4116) (t!7950 List!3026)) )
))
(declare-datatypes ((ListLongMap!3019 0))(
  ( (ListLongMap!3020 (toList!1525 List!3026)) )
))
(declare-fun lt!107075 () ListLongMap!3019)

(declare-fun lt!107078 () ListLongMap!3019)

(declare-fun lt!107074 () tuple2!4116)

(declare-fun lt!107076 () tuple2!4116)

(declare-fun e!136540 () Bool)

(declare-fun b!209624 () Bool)

(declare-fun +!549 (ListLongMap!3019 tuple2!4116) ListLongMap!3019)

(assert (=> b!209624 (= e!136540 (= lt!107075 (+!549 (+!549 lt!107078 lt!107074) lt!107076)))))

(declare-fun lt!107077 () ListLongMap!3019)

(declare-fun lt!107081 () ListLongMap!3019)

(assert (=> b!209624 (= lt!107081 (+!549 (+!549 lt!107077 lt!107074) lt!107076))))

(declare-fun minValue!615 () V!6833)

(assert (=> b!209624 (= lt!107076 (tuple2!4117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6833)

(assert (=> b!209624 (= lt!107074 (tuple2!4117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!209625 () Bool)

(declare-fun res!102186 () Bool)

(assert (=> b!209625 (=> (not res!102186) (not e!136541))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2351 0))(
  ( (ValueCellFull!2351 (v!4707 V!6833)) (EmptyCell!2351) )
))
(declare-datatypes ((array!9967 0))(
  ( (array!9968 (arr!4732 (Array (_ BitVec 32) ValueCell!2351)) (size!5058 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9967)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!209625 (= res!102186 (and (= (size!5058 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5057 _keys!825) (size!5058 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9155 () Bool)

(declare-fun tp!19624 () Bool)

(declare-fun e!136538 () Bool)

(assert (=> mapNonEmpty!9155 (= mapRes!9155 (and tp!19624 e!136538))))

(declare-fun mapRest!9155 () (Array (_ BitVec 32) ValueCell!2351))

(declare-fun mapKey!9155 () (_ BitVec 32))

(declare-fun mapValue!9155 () ValueCell!2351)

(assert (=> mapNonEmpty!9155 (= (arr!4732 _values!649) (store mapRest!9155 mapKey!9155 mapValue!9155))))

(declare-fun b!209626 () Bool)

(declare-fun res!102187 () Bool)

(assert (=> b!209626 (=> (not res!102187) (not e!136541))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!209626 (= res!102187 (= (select (arr!4731 _keys!825) i!601) k0!843))))

(declare-fun b!209627 () Bool)

(assert (=> b!209627 (= e!136538 tp_is_empty!5389)))

(declare-fun b!209628 () Bool)

(declare-fun e!136539 () Bool)

(assert (=> b!209628 (= e!136539 (and e!136543 mapRes!9155))))

(declare-fun condMapEmpty!9155 () Bool)

(declare-fun mapDefault!9155 () ValueCell!2351)

(assert (=> b!209628 (= condMapEmpty!9155 (= (arr!4732 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2351)) mapDefault!9155)))))

(declare-fun b!209629 () Bool)

(declare-fun res!102189 () Bool)

(assert (=> b!209629 (=> (not res!102189) (not e!136541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209629 (= res!102189 (validKeyInArray!0 k0!843))))

(declare-fun res!102183 () Bool)

(assert (=> start!20898 (=> (not res!102183) (not e!136541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20898 (= res!102183 (validMask!0 mask!1149))))

(assert (=> start!20898 e!136541))

(declare-fun array_inv!3107 (array!9967) Bool)

(assert (=> start!20898 (and (array_inv!3107 _values!649) e!136539)))

(assert (=> start!20898 true))

(assert (=> start!20898 tp_is_empty!5389))

(declare-fun array_inv!3108 (array!9965) Bool)

(assert (=> start!20898 (array_inv!3108 _keys!825)))

(assert (=> start!20898 tp!19625))

(declare-fun b!209630 () Bool)

(declare-fun res!102190 () Bool)

(assert (=> b!209630 (=> (not res!102190) (not e!136541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9965 (_ BitVec 32)) Bool)

(assert (=> b!209630 (= res!102190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209631 () Bool)

(declare-fun res!102184 () Bool)

(assert (=> b!209631 (=> (not res!102184) (not e!136541))))

(declare-datatypes ((List!3027 0))(
  ( (Nil!3024) (Cons!3023 (h!3665 (_ BitVec 64)) (t!7951 List!3027)) )
))
(declare-fun arrayNoDuplicates!0 (array!9965 (_ BitVec 32) List!3027) Bool)

(assert (=> b!209631 (= res!102184 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3024))))

(declare-fun b!209632 () Bool)

(assert (=> b!209632 (= e!136541 (not e!136540))))

(declare-fun res!102185 () Bool)

(assert (=> b!209632 (=> res!102185 e!136540)))

(assert (=> b!209632 (= res!102185 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1039 (array!9965 array!9967 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) Int) ListLongMap!3019)

(assert (=> b!209632 (= lt!107075 (getCurrentListMap!1039 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107079 () array!9967)

(assert (=> b!209632 (= lt!107081 (getCurrentListMap!1039 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107082 () ListLongMap!3019)

(assert (=> b!209632 (and (= lt!107077 lt!107082) (= lt!107082 lt!107077))))

(declare-fun v!520 () V!6833)

(assert (=> b!209632 (= lt!107082 (+!549 lt!107078 (tuple2!4117 k0!843 v!520)))))

(declare-datatypes ((Unit!6340 0))(
  ( (Unit!6341) )
))
(declare-fun lt!107080 () Unit!6340)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!200 (array!9965 array!9967 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) (_ BitVec 64) V!6833 (_ BitVec 32) Int) Unit!6340)

(assert (=> b!209632 (= lt!107080 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!200 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!476 (array!9965 array!9967 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) Int) ListLongMap!3019)

(assert (=> b!209632 (= lt!107077 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209632 (= lt!107079 (array!9968 (store (arr!4732 _values!649) i!601 (ValueCellFull!2351 v!520)) (size!5058 _values!649)))))

(assert (=> b!209632 (= lt!107078 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20898 res!102183) b!209625))

(assert (= (and b!209625 res!102186) b!209630))

(assert (= (and b!209630 res!102190) b!209631))

(assert (= (and b!209631 res!102184) b!209622))

(assert (= (and b!209622 res!102188) b!209629))

(assert (= (and b!209629 res!102189) b!209626))

(assert (= (and b!209626 res!102187) b!209632))

(assert (= (and b!209632 (not res!102185)) b!209624))

(assert (= (and b!209628 condMapEmpty!9155) mapIsEmpty!9155))

(assert (= (and b!209628 (not condMapEmpty!9155)) mapNonEmpty!9155))

(get-info :version)

(assert (= (and mapNonEmpty!9155 ((_ is ValueCellFull!2351) mapValue!9155)) b!209627))

(assert (= (and b!209628 ((_ is ValueCellFull!2351) mapDefault!9155)) b!209623))

(assert (= start!20898 b!209628))

(declare-fun m!236545 () Bool)

(assert (=> mapNonEmpty!9155 m!236545))

(declare-fun m!236547 () Bool)

(assert (=> b!209632 m!236547))

(declare-fun m!236549 () Bool)

(assert (=> b!209632 m!236549))

(declare-fun m!236551 () Bool)

(assert (=> b!209632 m!236551))

(declare-fun m!236553 () Bool)

(assert (=> b!209632 m!236553))

(declare-fun m!236555 () Bool)

(assert (=> b!209632 m!236555))

(declare-fun m!236557 () Bool)

(assert (=> b!209632 m!236557))

(declare-fun m!236559 () Bool)

(assert (=> b!209632 m!236559))

(declare-fun m!236561 () Bool)

(assert (=> start!20898 m!236561))

(declare-fun m!236563 () Bool)

(assert (=> start!20898 m!236563))

(declare-fun m!236565 () Bool)

(assert (=> start!20898 m!236565))

(declare-fun m!236567 () Bool)

(assert (=> b!209629 m!236567))

(declare-fun m!236569 () Bool)

(assert (=> b!209631 m!236569))

(declare-fun m!236571 () Bool)

(assert (=> b!209626 m!236571))

(declare-fun m!236573 () Bool)

(assert (=> b!209624 m!236573))

(assert (=> b!209624 m!236573))

(declare-fun m!236575 () Bool)

(assert (=> b!209624 m!236575))

(declare-fun m!236577 () Bool)

(assert (=> b!209624 m!236577))

(assert (=> b!209624 m!236577))

(declare-fun m!236579 () Bool)

(assert (=> b!209624 m!236579))

(declare-fun m!236581 () Bool)

(assert (=> b!209630 m!236581))

(check-sat (not b!209630) (not b!209632) (not start!20898) b_and!12259 (not b_next!5527) (not mapNonEmpty!9155) tp_is_empty!5389 (not b!209631) (not b!209629) (not b!209624))
(check-sat b_and!12259 (not b_next!5527))
(get-model)

(declare-fun d!57743 () Bool)

(declare-fun e!136582 () Bool)

(assert (=> d!57743 e!136582))

(declare-fun res!102244 () Bool)

(assert (=> d!57743 (=> (not res!102244) (not e!136582))))

(declare-fun lt!107147 () ListLongMap!3019)

(declare-fun contains!1370 (ListLongMap!3019 (_ BitVec 64)) Bool)

(assert (=> d!57743 (= res!102244 (contains!1370 lt!107147 (_1!2069 (tuple2!4117 k0!843 v!520))))))

(declare-fun lt!107145 () List!3026)

(assert (=> d!57743 (= lt!107147 (ListLongMap!3020 lt!107145))))

(declare-fun lt!107146 () Unit!6340)

(declare-fun lt!107148 () Unit!6340)

(assert (=> d!57743 (= lt!107146 lt!107148)))

(declare-datatypes ((Option!252 0))(
  ( (Some!251 (v!4713 V!6833)) (None!250) )
))
(declare-fun getValueByKey!246 (List!3026 (_ BitVec 64)) Option!252)

(assert (=> d!57743 (= (getValueByKey!246 lt!107145 (_1!2069 (tuple2!4117 k0!843 v!520))) (Some!251 (_2!2069 (tuple2!4117 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!136 (List!3026 (_ BitVec 64) V!6833) Unit!6340)

(assert (=> d!57743 (= lt!107148 (lemmaContainsTupThenGetReturnValue!136 lt!107145 (_1!2069 (tuple2!4117 k0!843 v!520)) (_2!2069 (tuple2!4117 k0!843 v!520))))))

(declare-fun insertStrictlySorted!139 (List!3026 (_ BitVec 64) V!6833) List!3026)

(assert (=> d!57743 (= lt!107145 (insertStrictlySorted!139 (toList!1525 lt!107078) (_1!2069 (tuple2!4117 k0!843 v!520)) (_2!2069 (tuple2!4117 k0!843 v!520))))))

(assert (=> d!57743 (= (+!549 lt!107078 (tuple2!4117 k0!843 v!520)) lt!107147)))

(declare-fun b!209703 () Bool)

(declare-fun res!102243 () Bool)

(assert (=> b!209703 (=> (not res!102243) (not e!136582))))

(assert (=> b!209703 (= res!102243 (= (getValueByKey!246 (toList!1525 lt!107147) (_1!2069 (tuple2!4117 k0!843 v!520))) (Some!251 (_2!2069 (tuple2!4117 k0!843 v!520)))))))

(declare-fun b!209704 () Bool)

(declare-fun contains!1371 (List!3026 tuple2!4116) Bool)

(assert (=> b!209704 (= e!136582 (contains!1371 (toList!1525 lt!107147) (tuple2!4117 k0!843 v!520)))))

(assert (= (and d!57743 res!102244) b!209703))

(assert (= (and b!209703 res!102243) b!209704))

(declare-fun m!236659 () Bool)

(assert (=> d!57743 m!236659))

(declare-fun m!236661 () Bool)

(assert (=> d!57743 m!236661))

(declare-fun m!236663 () Bool)

(assert (=> d!57743 m!236663))

(declare-fun m!236665 () Bool)

(assert (=> d!57743 m!236665))

(declare-fun m!236667 () Bool)

(assert (=> b!209703 m!236667))

(declare-fun m!236669 () Bool)

(assert (=> b!209704 m!236669))

(assert (=> b!209632 d!57743))

(declare-fun lt!107202 () ListLongMap!3019)

(declare-fun b!209747 () Bool)

(declare-fun e!136614 () Bool)

(declare-fun apply!190 (ListLongMap!3019 (_ BitVec 64)) V!6833)

(declare-fun get!2536 (ValueCell!2351 V!6833) V!6833)

(declare-fun dynLambda!524 (Int (_ BitVec 64)) V!6833)

(assert (=> b!209747 (= e!136614 (= (apply!190 lt!107202 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2536 (select (arr!4732 lt!107079) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5058 lt!107079)))))

(assert (=> b!209747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209748 () Bool)

(declare-fun e!136616 () Unit!6340)

(declare-fun lt!107207 () Unit!6340)

(assert (=> b!209748 (= e!136616 lt!107207)))

(declare-fun lt!107195 () ListLongMap!3019)

(assert (=> b!209748 (= lt!107195 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107209 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107198 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107198 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107193 () Unit!6340)

(declare-fun addStillContains!166 (ListLongMap!3019 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6340)

(assert (=> b!209748 (= lt!107193 (addStillContains!166 lt!107195 lt!107209 zeroValue!615 lt!107198))))

(assert (=> b!209748 (contains!1370 (+!549 lt!107195 (tuple2!4117 lt!107209 zeroValue!615)) lt!107198)))

(declare-fun lt!107208 () Unit!6340)

(assert (=> b!209748 (= lt!107208 lt!107193)))

(declare-fun lt!107205 () ListLongMap!3019)

(assert (=> b!209748 (= lt!107205 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107212 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107197 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107197 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107210 () Unit!6340)

(declare-fun addApplyDifferent!166 (ListLongMap!3019 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6340)

(assert (=> b!209748 (= lt!107210 (addApplyDifferent!166 lt!107205 lt!107212 minValue!615 lt!107197))))

(assert (=> b!209748 (= (apply!190 (+!549 lt!107205 (tuple2!4117 lt!107212 minValue!615)) lt!107197) (apply!190 lt!107205 lt!107197))))

(declare-fun lt!107206 () Unit!6340)

(assert (=> b!209748 (= lt!107206 lt!107210)))

(declare-fun lt!107204 () ListLongMap!3019)

(assert (=> b!209748 (= lt!107204 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107211 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107203 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107203 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107214 () Unit!6340)

(assert (=> b!209748 (= lt!107214 (addApplyDifferent!166 lt!107204 lt!107211 zeroValue!615 lt!107203))))

(assert (=> b!209748 (= (apply!190 (+!549 lt!107204 (tuple2!4117 lt!107211 zeroValue!615)) lt!107203) (apply!190 lt!107204 lt!107203))))

(declare-fun lt!107213 () Unit!6340)

(assert (=> b!209748 (= lt!107213 lt!107214)))

(declare-fun lt!107200 () ListLongMap!3019)

(assert (=> b!209748 (= lt!107200 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107196 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107201 () (_ BitVec 64))

(assert (=> b!209748 (= lt!107201 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209748 (= lt!107207 (addApplyDifferent!166 lt!107200 lt!107196 minValue!615 lt!107201))))

(assert (=> b!209748 (= (apply!190 (+!549 lt!107200 (tuple2!4117 lt!107196 minValue!615)) lt!107201) (apply!190 lt!107200 lt!107201))))

(declare-fun b!209749 () Bool)

(declare-fun e!136609 () Bool)

(declare-fun e!136619 () Bool)

(assert (=> b!209749 (= e!136609 e!136619)))

(declare-fun res!102270 () Bool)

(declare-fun call!19814 () Bool)

(assert (=> b!209749 (= res!102270 call!19814)))

(assert (=> b!209749 (=> (not res!102270) (not e!136619))))

(declare-fun bm!19808 () Bool)

(declare-fun call!19811 () ListLongMap!3019)

(declare-fun call!19815 () ListLongMap!3019)

(assert (=> bm!19808 (= call!19811 call!19815)))

(declare-fun b!209750 () Bool)

(declare-fun e!136611 () ListLongMap!3019)

(declare-fun call!19816 () ListLongMap!3019)

(assert (=> b!209750 (= e!136611 (+!549 call!19816 (tuple2!4117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209751 () Bool)

(declare-fun e!136612 () ListLongMap!3019)

(declare-fun call!19812 () ListLongMap!3019)

(assert (=> b!209751 (= e!136612 call!19812)))

(declare-fun b!209752 () Bool)

(assert (=> b!209752 (= e!136611 e!136612)))

(declare-fun c!35474 () Bool)

(assert (=> b!209752 (= c!35474 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!57745 () Bool)

(declare-fun e!136617 () Bool)

(assert (=> d!57745 e!136617))

(declare-fun res!102267 () Bool)

(assert (=> d!57745 (=> (not res!102267) (not e!136617))))

(assert (=> d!57745 (= res!102267 (or (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))))

(declare-fun lt!107199 () ListLongMap!3019)

(assert (=> d!57745 (= lt!107202 lt!107199)))

(declare-fun lt!107194 () Unit!6340)

(assert (=> d!57745 (= lt!107194 e!136616)))

(declare-fun c!35471 () Bool)

(declare-fun e!136618 () Bool)

(assert (=> d!57745 (= c!35471 e!136618)))

(declare-fun res!102269 () Bool)

(assert (=> d!57745 (=> (not res!102269) (not e!136618))))

(assert (=> d!57745 (= res!102269 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57745 (= lt!107199 e!136611)))

(declare-fun c!35476 () Bool)

(assert (=> d!57745 (= c!35476 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57745 (validMask!0 mask!1149)))

(assert (=> d!57745 (= (getCurrentListMap!1039 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107202)))

(declare-fun bm!19809 () Bool)

(assert (=> bm!19809 (= call!19812 call!19816)))

(declare-fun bm!19810 () Bool)

(declare-fun call!19813 () Bool)

(assert (=> bm!19810 (= call!19813 (contains!1370 lt!107202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19811 () Bool)

(declare-fun call!19817 () ListLongMap!3019)

(assert (=> bm!19811 (= call!19817 call!19811)))

(declare-fun b!209753 () Bool)

(declare-fun e!136615 () ListLongMap!3019)

(assert (=> b!209753 (= e!136615 call!19817)))

(declare-fun b!209754 () Bool)

(assert (=> b!209754 (= e!136609 (not call!19814))))

(declare-fun b!209755 () Bool)

(declare-fun e!136621 () Bool)

(declare-fun e!136613 () Bool)

(assert (=> b!209755 (= e!136621 e!136613)))

(declare-fun res!102265 () Bool)

(assert (=> b!209755 (= res!102265 call!19813)))

(assert (=> b!209755 (=> (not res!102265) (not e!136613))))

(declare-fun b!209756 () Bool)

(assert (=> b!209756 (= e!136613 (= (apply!190 lt!107202 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19812 () Bool)

(assert (=> bm!19812 (= call!19814 (contains!1370 lt!107202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209757 () Bool)

(assert (=> b!209757 (= e!136617 e!136609)))

(declare-fun c!35472 () Bool)

(assert (=> b!209757 (= c!35472 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209758 () Bool)

(declare-fun c!35473 () Bool)

(assert (=> b!209758 (= c!35473 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209758 (= e!136612 e!136615)))

(declare-fun b!209759 () Bool)

(declare-fun res!102268 () Bool)

(assert (=> b!209759 (=> (not res!102268) (not e!136617))))

(declare-fun e!136610 () Bool)

(assert (=> b!209759 (= res!102268 e!136610)))

(declare-fun res!102271 () Bool)

(assert (=> b!209759 (=> res!102271 e!136610)))

(declare-fun e!136620 () Bool)

(assert (=> b!209759 (= res!102271 (not e!136620))))

(declare-fun res!102264 () Bool)

(assert (=> b!209759 (=> (not res!102264) (not e!136620))))

(assert (=> b!209759 (= res!102264 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209760 () Bool)

(assert (=> b!209760 (= e!136610 e!136614)))

(declare-fun res!102263 () Bool)

(assert (=> b!209760 (=> (not res!102263) (not e!136614))))

(assert (=> b!209760 (= res!102263 (contains!1370 lt!107202 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209761 () Bool)

(assert (=> b!209761 (= e!136620 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209762 () Bool)

(assert (=> b!209762 (= e!136618 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209763 () Bool)

(declare-fun Unit!6344 () Unit!6340)

(assert (=> b!209763 (= e!136616 Unit!6344)))

(declare-fun bm!19813 () Bool)

(assert (=> bm!19813 (= call!19816 (+!549 (ite c!35476 call!19815 (ite c!35474 call!19811 call!19817)) (ite (or c!35476 c!35474) (tuple2!4117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209764 () Bool)

(assert (=> b!209764 (= e!136615 call!19812)))

(declare-fun b!209765 () Bool)

(assert (=> b!209765 (= e!136621 (not call!19813))))

(declare-fun b!209766 () Bool)

(declare-fun res!102266 () Bool)

(assert (=> b!209766 (=> (not res!102266) (not e!136617))))

(assert (=> b!209766 (= res!102266 e!136621)))

(declare-fun c!35475 () Bool)

(assert (=> b!209766 (= c!35475 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209767 () Bool)

(assert (=> b!209767 (= e!136619 (= (apply!190 lt!107202 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19814 () Bool)

(assert (=> bm!19814 (= call!19815 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57745 c!35476) b!209750))

(assert (= (and d!57745 (not c!35476)) b!209752))

(assert (= (and b!209752 c!35474) b!209751))

(assert (= (and b!209752 (not c!35474)) b!209758))

(assert (= (and b!209758 c!35473) b!209764))

(assert (= (and b!209758 (not c!35473)) b!209753))

(assert (= (or b!209764 b!209753) bm!19811))

(assert (= (or b!209751 bm!19811) bm!19808))

(assert (= (or b!209751 b!209764) bm!19809))

(assert (= (or b!209750 bm!19808) bm!19814))

(assert (= (or b!209750 bm!19809) bm!19813))

(assert (= (and d!57745 res!102269) b!209762))

(assert (= (and d!57745 c!35471) b!209748))

(assert (= (and d!57745 (not c!35471)) b!209763))

(assert (= (and d!57745 res!102267) b!209759))

(assert (= (and b!209759 res!102264) b!209761))

(assert (= (and b!209759 (not res!102271)) b!209760))

(assert (= (and b!209760 res!102263) b!209747))

(assert (= (and b!209759 res!102268) b!209766))

(assert (= (and b!209766 c!35475) b!209755))

(assert (= (and b!209766 (not c!35475)) b!209765))

(assert (= (and b!209755 res!102265) b!209756))

(assert (= (or b!209755 b!209765) bm!19810))

(assert (= (and b!209766 res!102266) b!209757))

(assert (= (and b!209757 c!35472) b!209749))

(assert (= (and b!209757 (not c!35472)) b!209754))

(assert (= (and b!209749 res!102270) b!209767))

(assert (= (or b!209749 b!209754) bm!19812))

(declare-fun b_lambda!7545 () Bool)

(assert (=> (not b_lambda!7545) (not b!209747)))

(declare-fun t!7955 () Bool)

(declare-fun tb!2885 () Bool)

(assert (=> (and start!20898 (= defaultEntry!657 defaultEntry!657) t!7955) tb!2885))

(declare-fun result!4959 () Bool)

(assert (=> tb!2885 (= result!4959 tp_is_empty!5389)))

(assert (=> b!209747 t!7955))

(declare-fun b_and!12265 () Bool)

(assert (= b_and!12259 (and (=> t!7955 result!4959) b_and!12265)))

(declare-fun m!236671 () Bool)

(assert (=> bm!19810 m!236671))

(declare-fun m!236673 () Bool)

(assert (=> b!209761 m!236673))

(assert (=> b!209761 m!236673))

(declare-fun m!236675 () Bool)

(assert (=> b!209761 m!236675))

(assert (=> bm!19814 m!236547))

(assert (=> b!209747 m!236673))

(declare-fun m!236677 () Bool)

(assert (=> b!209747 m!236677))

(declare-fun m!236679 () Bool)

(assert (=> b!209747 m!236679))

(declare-fun m!236681 () Bool)

(assert (=> b!209747 m!236681))

(assert (=> b!209747 m!236679))

(declare-fun m!236683 () Bool)

(assert (=> b!209747 m!236683))

(assert (=> b!209747 m!236681))

(assert (=> b!209747 m!236673))

(assert (=> b!209762 m!236673))

(assert (=> b!209762 m!236673))

(assert (=> b!209762 m!236675))

(declare-fun m!236685 () Bool)

(assert (=> bm!19813 m!236685))

(declare-fun m!236687 () Bool)

(assert (=> b!209748 m!236687))

(declare-fun m!236689 () Bool)

(assert (=> b!209748 m!236689))

(assert (=> b!209748 m!236547))

(declare-fun m!236691 () Bool)

(assert (=> b!209748 m!236691))

(declare-fun m!236693 () Bool)

(assert (=> b!209748 m!236693))

(assert (=> b!209748 m!236691))

(declare-fun m!236695 () Bool)

(assert (=> b!209748 m!236695))

(declare-fun m!236697 () Bool)

(assert (=> b!209748 m!236697))

(declare-fun m!236699 () Bool)

(assert (=> b!209748 m!236699))

(declare-fun m!236701 () Bool)

(assert (=> b!209748 m!236701))

(declare-fun m!236703 () Bool)

(assert (=> b!209748 m!236703))

(declare-fun m!236705 () Bool)

(assert (=> b!209748 m!236705))

(declare-fun m!236707 () Bool)

(assert (=> b!209748 m!236707))

(assert (=> b!209748 m!236697))

(declare-fun m!236709 () Bool)

(assert (=> b!209748 m!236709))

(declare-fun m!236711 () Bool)

(assert (=> b!209748 m!236711))

(assert (=> b!209748 m!236673))

(assert (=> b!209748 m!236707))

(declare-fun m!236713 () Bool)

(assert (=> b!209748 m!236713))

(assert (=> b!209748 m!236687))

(declare-fun m!236715 () Bool)

(assert (=> b!209748 m!236715))

(declare-fun m!236717 () Bool)

(assert (=> b!209750 m!236717))

(declare-fun m!236719 () Bool)

(assert (=> b!209767 m!236719))

(assert (=> b!209760 m!236673))

(assert (=> b!209760 m!236673))

(declare-fun m!236721 () Bool)

(assert (=> b!209760 m!236721))

(declare-fun m!236723 () Bool)

(assert (=> b!209756 m!236723))

(declare-fun m!236725 () Bool)

(assert (=> bm!19812 m!236725))

(assert (=> d!57745 m!236561))

(assert (=> b!209632 d!57745))

(declare-fun b!209794 () Bool)

(declare-fun e!136640 () Bool)

(declare-fun e!136639 () Bool)

(assert (=> b!209794 (= e!136640 e!136639)))

(assert (=> b!209794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun res!102282 () Bool)

(declare-fun lt!107232 () ListLongMap!3019)

(assert (=> b!209794 (= res!102282 (contains!1370 lt!107232 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209794 (=> (not res!102282) (not e!136639))))

(declare-fun bm!19817 () Bool)

(declare-fun call!19820 () ListLongMap!3019)

(assert (=> bm!19817 (= call!19820 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209795 () Bool)

(declare-fun e!136642 () Bool)

(assert (=> b!209795 (= e!136642 e!136640)))

(declare-fun c!35488 () Bool)

(declare-fun e!136638 () Bool)

(assert (=> b!209795 (= c!35488 e!136638)))

(declare-fun res!102283 () Bool)

(assert (=> b!209795 (=> (not res!102283) (not e!136638))))

(assert (=> b!209795 (= res!102283 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209796 () Bool)

(declare-fun e!136641 () Bool)

(assert (=> b!209796 (= e!136640 e!136641)))

(declare-fun c!35486 () Bool)

(assert (=> b!209796 (= c!35486 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209797 () Bool)

(assert (=> b!209797 (= e!136641 (= lt!107232 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209798 () Bool)

(declare-fun e!136637 () ListLongMap!3019)

(declare-fun e!136636 () ListLongMap!3019)

(assert (=> b!209798 (= e!136637 e!136636)))

(declare-fun c!35487 () Bool)

(assert (=> b!209798 (= c!35487 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209799 () Bool)

(declare-fun isEmpty!495 (ListLongMap!3019) Bool)

(assert (=> b!209799 (= e!136641 (isEmpty!495 lt!107232))))

(declare-fun b!209800 () Bool)

(assert (=> b!209800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> b!209800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5058 _values!649)))))

(assert (=> b!209800 (= e!136639 (= (apply!190 lt!107232 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2536 (select (arr!4732 _values!649) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209801 () Bool)

(declare-fun res!102281 () Bool)

(assert (=> b!209801 (=> (not res!102281) (not e!136642))))

(assert (=> b!209801 (= res!102281 (not (contains!1370 lt!107232 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57747 () Bool)

(assert (=> d!57747 e!136642))

(declare-fun res!102280 () Bool)

(assert (=> d!57747 (=> (not res!102280) (not e!136642))))

(assert (=> d!57747 (= res!102280 (not (contains!1370 lt!107232 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57747 (= lt!107232 e!136637)))

(declare-fun c!35485 () Bool)

(assert (=> d!57747 (= c!35485 (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57747 (validMask!0 mask!1149)))

(assert (=> d!57747 (= (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107232)))

(declare-fun b!209802 () Bool)

(assert (=> b!209802 (= e!136638 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209803 () Bool)

(assert (=> b!209803 (= e!136637 (ListLongMap!3020 Nil!3023))))

(declare-fun b!209804 () Bool)

(declare-fun lt!107234 () Unit!6340)

(declare-fun lt!107233 () Unit!6340)

(assert (=> b!209804 (= lt!107234 lt!107233)))

(declare-fun lt!107235 () (_ BitVec 64))

(declare-fun lt!107229 () (_ BitVec 64))

(declare-fun lt!107230 () ListLongMap!3019)

(declare-fun lt!107231 () V!6833)

(assert (=> b!209804 (not (contains!1370 (+!549 lt!107230 (tuple2!4117 lt!107229 lt!107231)) lt!107235))))

(declare-fun addStillNotContains!100 (ListLongMap!3019 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6340)

(assert (=> b!209804 (= lt!107233 (addStillNotContains!100 lt!107230 lt!107229 lt!107231 lt!107235))))

(assert (=> b!209804 (= lt!107235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209804 (= lt!107231 (get!2536 (select (arr!4732 _values!649) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209804 (= lt!107229 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209804 (= lt!107230 call!19820)))

(assert (=> b!209804 (= e!136636 (+!549 call!19820 (tuple2!4117 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) (get!2536 (select (arr!4732 _values!649) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209805 () Bool)

(assert (=> b!209805 (= e!136636 call!19820)))

(assert (= (and d!57747 c!35485) b!209803))

(assert (= (and d!57747 (not c!35485)) b!209798))

(assert (= (and b!209798 c!35487) b!209804))

(assert (= (and b!209798 (not c!35487)) b!209805))

(assert (= (or b!209804 b!209805) bm!19817))

(assert (= (and d!57747 res!102280) b!209801))

(assert (= (and b!209801 res!102281) b!209795))

(assert (= (and b!209795 res!102283) b!209802))

(assert (= (and b!209795 c!35488) b!209794))

(assert (= (and b!209795 (not c!35488)) b!209796))

(assert (= (and b!209794 res!102282) b!209800))

(assert (= (and b!209796 c!35486) b!209797))

(assert (= (and b!209796 (not c!35486)) b!209799))

(declare-fun b_lambda!7547 () Bool)

(assert (=> (not b_lambda!7547) (not b!209800)))

(assert (=> b!209800 t!7955))

(declare-fun b_and!12267 () Bool)

(assert (= b_and!12265 (and (=> t!7955 result!4959) b_and!12267)))

(declare-fun b_lambda!7549 () Bool)

(assert (=> (not b_lambda!7549) (not b!209804)))

(assert (=> b!209804 t!7955))

(declare-fun b_and!12269 () Bool)

(assert (= b_and!12267 (and (=> t!7955 result!4959) b_and!12269)))

(declare-fun m!236727 () Bool)

(assert (=> b!209797 m!236727))

(assert (=> b!209800 m!236673))

(assert (=> b!209800 m!236679))

(assert (=> b!209800 m!236673))

(declare-fun m!236729 () Bool)

(assert (=> b!209800 m!236729))

(declare-fun m!236731 () Bool)

(assert (=> b!209800 m!236731))

(assert (=> b!209800 m!236731))

(assert (=> b!209800 m!236679))

(declare-fun m!236733 () Bool)

(assert (=> b!209800 m!236733))

(declare-fun m!236735 () Bool)

(assert (=> b!209799 m!236735))

(assert (=> bm!19817 m!236727))

(assert (=> b!209804 m!236673))

(declare-fun m!236737 () Bool)

(assert (=> b!209804 m!236737))

(declare-fun m!236739 () Bool)

(assert (=> b!209804 m!236739))

(declare-fun m!236741 () Bool)

(assert (=> b!209804 m!236741))

(assert (=> b!209804 m!236737))

(assert (=> b!209804 m!236679))

(assert (=> b!209804 m!236731))

(assert (=> b!209804 m!236679))

(assert (=> b!209804 m!236733))

(declare-fun m!236743 () Bool)

(assert (=> b!209804 m!236743))

(assert (=> b!209804 m!236731))

(declare-fun m!236745 () Bool)

(assert (=> b!209801 m!236745))

(assert (=> b!209798 m!236673))

(assert (=> b!209798 m!236673))

(assert (=> b!209798 m!236675))

(assert (=> b!209794 m!236673))

(assert (=> b!209794 m!236673))

(declare-fun m!236747 () Bool)

(assert (=> b!209794 m!236747))

(declare-fun m!236749 () Bool)

(assert (=> d!57747 m!236749))

(assert (=> d!57747 m!236561))

(assert (=> b!209802 m!236673))

(assert (=> b!209802 m!236673))

(assert (=> b!209802 m!236675))

(assert (=> b!209632 d!57747))

(declare-fun b!209806 () Bool)

(declare-fun e!136647 () Bool)

(declare-fun e!136646 () Bool)

(assert (=> b!209806 (= e!136647 e!136646)))

(assert (=> b!209806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun res!102286 () Bool)

(declare-fun lt!107239 () ListLongMap!3019)

(assert (=> b!209806 (= res!102286 (contains!1370 lt!107239 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209806 (=> (not res!102286) (not e!136646))))

(declare-fun bm!19818 () Bool)

(declare-fun call!19821 () ListLongMap!3019)

(assert (=> bm!19818 (= call!19821 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209807 () Bool)

(declare-fun e!136649 () Bool)

(assert (=> b!209807 (= e!136649 e!136647)))

(declare-fun c!35492 () Bool)

(declare-fun e!136645 () Bool)

(assert (=> b!209807 (= c!35492 e!136645)))

(declare-fun res!102287 () Bool)

(assert (=> b!209807 (=> (not res!102287) (not e!136645))))

(assert (=> b!209807 (= res!102287 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209808 () Bool)

(declare-fun e!136648 () Bool)

(assert (=> b!209808 (= e!136647 e!136648)))

(declare-fun c!35490 () Bool)

(assert (=> b!209808 (= c!35490 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209809 () Bool)

(assert (=> b!209809 (= e!136648 (= lt!107239 (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209810 () Bool)

(declare-fun e!136644 () ListLongMap!3019)

(declare-fun e!136643 () ListLongMap!3019)

(assert (=> b!209810 (= e!136644 e!136643)))

(declare-fun c!35491 () Bool)

(assert (=> b!209810 (= c!35491 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209811 () Bool)

(assert (=> b!209811 (= e!136648 (isEmpty!495 lt!107239))))

(declare-fun b!209812 () Bool)

(assert (=> b!209812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> b!209812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5058 lt!107079)))))

(assert (=> b!209812 (= e!136646 (= (apply!190 lt!107239 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2536 (select (arr!4732 lt!107079) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209813 () Bool)

(declare-fun res!102285 () Bool)

(assert (=> b!209813 (=> (not res!102285) (not e!136649))))

(assert (=> b!209813 (= res!102285 (not (contains!1370 lt!107239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57749 () Bool)

(assert (=> d!57749 e!136649))

(declare-fun res!102284 () Bool)

(assert (=> d!57749 (=> (not res!102284) (not e!136649))))

(assert (=> d!57749 (= res!102284 (not (contains!1370 lt!107239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57749 (= lt!107239 e!136644)))

(declare-fun c!35489 () Bool)

(assert (=> d!57749 (= c!35489 (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57749 (validMask!0 mask!1149)))

(assert (=> d!57749 (= (getCurrentListMapNoExtraKeys!476 _keys!825 lt!107079 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107239)))

(declare-fun b!209814 () Bool)

(assert (=> b!209814 (= e!136645 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209814 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209815 () Bool)

(assert (=> b!209815 (= e!136644 (ListLongMap!3020 Nil!3023))))

(declare-fun b!209816 () Bool)

(declare-fun lt!107241 () Unit!6340)

(declare-fun lt!107240 () Unit!6340)

(assert (=> b!209816 (= lt!107241 lt!107240)))

(declare-fun lt!107237 () ListLongMap!3019)

(declare-fun lt!107242 () (_ BitVec 64))

(declare-fun lt!107236 () (_ BitVec 64))

(declare-fun lt!107238 () V!6833)

(assert (=> b!209816 (not (contains!1370 (+!549 lt!107237 (tuple2!4117 lt!107236 lt!107238)) lt!107242))))

(assert (=> b!209816 (= lt!107240 (addStillNotContains!100 lt!107237 lt!107236 lt!107238 lt!107242))))

(assert (=> b!209816 (= lt!107242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209816 (= lt!107238 (get!2536 (select (arr!4732 lt!107079) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209816 (= lt!107236 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209816 (= lt!107237 call!19821)))

(assert (=> b!209816 (= e!136643 (+!549 call!19821 (tuple2!4117 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) (get!2536 (select (arr!4732 lt!107079) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209817 () Bool)

(assert (=> b!209817 (= e!136643 call!19821)))

(assert (= (and d!57749 c!35489) b!209815))

(assert (= (and d!57749 (not c!35489)) b!209810))

(assert (= (and b!209810 c!35491) b!209816))

(assert (= (and b!209810 (not c!35491)) b!209817))

(assert (= (or b!209816 b!209817) bm!19818))

(assert (= (and d!57749 res!102284) b!209813))

(assert (= (and b!209813 res!102285) b!209807))

(assert (= (and b!209807 res!102287) b!209814))

(assert (= (and b!209807 c!35492) b!209806))

(assert (= (and b!209807 (not c!35492)) b!209808))

(assert (= (and b!209806 res!102286) b!209812))

(assert (= (and b!209808 c!35490) b!209809))

(assert (= (and b!209808 (not c!35490)) b!209811))

(declare-fun b_lambda!7551 () Bool)

(assert (=> (not b_lambda!7551) (not b!209812)))

(assert (=> b!209812 t!7955))

(declare-fun b_and!12271 () Bool)

(assert (= b_and!12269 (and (=> t!7955 result!4959) b_and!12271)))

(declare-fun b_lambda!7553 () Bool)

(assert (=> (not b_lambda!7553) (not b!209816)))

(assert (=> b!209816 t!7955))

(declare-fun b_and!12273 () Bool)

(assert (= b_and!12271 (and (=> t!7955 result!4959) b_and!12273)))

(declare-fun m!236751 () Bool)

(assert (=> b!209809 m!236751))

(assert (=> b!209812 m!236673))

(assert (=> b!209812 m!236679))

(assert (=> b!209812 m!236673))

(declare-fun m!236753 () Bool)

(assert (=> b!209812 m!236753))

(assert (=> b!209812 m!236681))

(assert (=> b!209812 m!236681))

(assert (=> b!209812 m!236679))

(assert (=> b!209812 m!236683))

(declare-fun m!236755 () Bool)

(assert (=> b!209811 m!236755))

(assert (=> bm!19818 m!236751))

(assert (=> b!209816 m!236673))

(declare-fun m!236757 () Bool)

(assert (=> b!209816 m!236757))

(declare-fun m!236759 () Bool)

(assert (=> b!209816 m!236759))

(declare-fun m!236761 () Bool)

(assert (=> b!209816 m!236761))

(assert (=> b!209816 m!236757))

(assert (=> b!209816 m!236679))

(assert (=> b!209816 m!236681))

(assert (=> b!209816 m!236679))

(assert (=> b!209816 m!236683))

(declare-fun m!236763 () Bool)

(assert (=> b!209816 m!236763))

(assert (=> b!209816 m!236681))

(declare-fun m!236765 () Bool)

(assert (=> b!209813 m!236765))

(assert (=> b!209810 m!236673))

(assert (=> b!209810 m!236673))

(assert (=> b!209810 m!236675))

(assert (=> b!209806 m!236673))

(assert (=> b!209806 m!236673))

(declare-fun m!236767 () Bool)

(assert (=> b!209806 m!236767))

(declare-fun m!236769 () Bool)

(assert (=> d!57749 m!236769))

(assert (=> d!57749 m!236561))

(assert (=> b!209814 m!236673))

(assert (=> b!209814 m!236673))

(assert (=> b!209814 m!236675))

(assert (=> b!209632 d!57749))

(declare-fun bm!19823 () Bool)

(declare-fun call!19827 () ListLongMap!3019)

(assert (=> bm!19823 (= call!19827 (getCurrentListMapNoExtraKeys!476 _keys!825 (array!9968 (store (arr!4732 _values!649) i!601 (ValueCellFull!2351 v!520)) (size!5058 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209824 () Bool)

(declare-fun e!136655 () Bool)

(declare-fun call!19826 () ListLongMap!3019)

(assert (=> b!209824 (= e!136655 (= call!19827 call!19826))))

(declare-fun b!209825 () Bool)

(declare-fun e!136654 () Bool)

(assert (=> b!209825 (= e!136654 e!136655)))

(declare-fun c!35495 () Bool)

(assert (=> b!209825 (= c!35495 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!57751 () Bool)

(assert (=> d!57751 e!136654))

(declare-fun res!102290 () Bool)

(assert (=> d!57751 (=> (not res!102290) (not e!136654))))

(assert (=> d!57751 (= res!102290 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5058 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5058 _values!649))))))))

(declare-fun lt!107245 () Unit!6340)

(declare-fun choose!1080 (array!9965 array!9967 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) (_ BitVec 64) V!6833 (_ BitVec 32) Int) Unit!6340)

(assert (=> d!57751 (= lt!107245 (choose!1080 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57751 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!200 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107245)))

(declare-fun b!209826 () Bool)

(assert (=> b!209826 (= e!136655 (= call!19827 (+!549 call!19826 (tuple2!4117 k0!843 v!520))))))

(declare-fun bm!19824 () Bool)

(assert (=> bm!19824 (= call!19826 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57751 res!102290) b!209825))

(assert (= (and b!209825 c!35495) b!209826))

(assert (= (and b!209825 (not c!35495)) b!209824))

(assert (= (or b!209826 b!209824) bm!19823))

(assert (= (or b!209826 b!209824) bm!19824))

(assert (=> bm!19823 m!236549))

(declare-fun m!236771 () Bool)

(assert (=> bm!19823 m!236771))

(declare-fun m!236773 () Bool)

(assert (=> d!57751 m!236773))

(declare-fun m!236775 () Bool)

(assert (=> b!209826 m!236775))

(assert (=> bm!19824 m!236557))

(assert (=> b!209632 d!57751))

(declare-fun b!209827 () Bool)

(declare-fun e!136661 () Bool)

(declare-fun lt!107255 () ListLongMap!3019)

(assert (=> b!209827 (= e!136661 (= (apply!190 lt!107255 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)) (get!2536 (select (arr!4732 _values!649) #b00000000000000000000000000000000) (dynLambda!524 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5058 _values!649)))))

(assert (=> b!209827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209828 () Bool)

(declare-fun e!136663 () Unit!6340)

(declare-fun lt!107260 () Unit!6340)

(assert (=> b!209828 (= e!136663 lt!107260)))

(declare-fun lt!107248 () ListLongMap!3019)

(assert (=> b!209828 (= lt!107248 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107262 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107251 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107251 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107246 () Unit!6340)

(assert (=> b!209828 (= lt!107246 (addStillContains!166 lt!107248 lt!107262 zeroValue!615 lt!107251))))

(assert (=> b!209828 (contains!1370 (+!549 lt!107248 (tuple2!4117 lt!107262 zeroValue!615)) lt!107251)))

(declare-fun lt!107261 () Unit!6340)

(assert (=> b!209828 (= lt!107261 lt!107246)))

(declare-fun lt!107258 () ListLongMap!3019)

(assert (=> b!209828 (= lt!107258 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107265 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107250 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107250 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107263 () Unit!6340)

(assert (=> b!209828 (= lt!107263 (addApplyDifferent!166 lt!107258 lt!107265 minValue!615 lt!107250))))

(assert (=> b!209828 (= (apply!190 (+!549 lt!107258 (tuple2!4117 lt!107265 minValue!615)) lt!107250) (apply!190 lt!107258 lt!107250))))

(declare-fun lt!107259 () Unit!6340)

(assert (=> b!209828 (= lt!107259 lt!107263)))

(declare-fun lt!107257 () ListLongMap!3019)

(assert (=> b!209828 (= lt!107257 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107264 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107256 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107256 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107267 () Unit!6340)

(assert (=> b!209828 (= lt!107267 (addApplyDifferent!166 lt!107257 lt!107264 zeroValue!615 lt!107256))))

(assert (=> b!209828 (= (apply!190 (+!549 lt!107257 (tuple2!4117 lt!107264 zeroValue!615)) lt!107256) (apply!190 lt!107257 lt!107256))))

(declare-fun lt!107266 () Unit!6340)

(assert (=> b!209828 (= lt!107266 lt!107267)))

(declare-fun lt!107253 () ListLongMap!3019)

(assert (=> b!209828 (= lt!107253 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107249 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107254 () (_ BitVec 64))

(assert (=> b!209828 (= lt!107254 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209828 (= lt!107260 (addApplyDifferent!166 lt!107253 lt!107249 minValue!615 lt!107254))))

(assert (=> b!209828 (= (apply!190 (+!549 lt!107253 (tuple2!4117 lt!107249 minValue!615)) lt!107254) (apply!190 lt!107253 lt!107254))))

(declare-fun b!209829 () Bool)

(declare-fun e!136656 () Bool)

(declare-fun e!136666 () Bool)

(assert (=> b!209829 (= e!136656 e!136666)))

(declare-fun res!102298 () Bool)

(declare-fun call!19831 () Bool)

(assert (=> b!209829 (= res!102298 call!19831)))

(assert (=> b!209829 (=> (not res!102298) (not e!136666))))

(declare-fun bm!19825 () Bool)

(declare-fun call!19828 () ListLongMap!3019)

(declare-fun call!19832 () ListLongMap!3019)

(assert (=> bm!19825 (= call!19828 call!19832)))

(declare-fun b!209830 () Bool)

(declare-fun e!136658 () ListLongMap!3019)

(declare-fun call!19833 () ListLongMap!3019)

(assert (=> b!209830 (= e!136658 (+!549 call!19833 (tuple2!4117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209831 () Bool)

(declare-fun e!136659 () ListLongMap!3019)

(declare-fun call!19829 () ListLongMap!3019)

(assert (=> b!209831 (= e!136659 call!19829)))

(declare-fun b!209832 () Bool)

(assert (=> b!209832 (= e!136658 e!136659)))

(declare-fun c!35499 () Bool)

(assert (=> b!209832 (= c!35499 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!57753 () Bool)

(declare-fun e!136664 () Bool)

(assert (=> d!57753 e!136664))

(declare-fun res!102295 () Bool)

(assert (=> d!57753 (=> (not res!102295) (not e!136664))))

(assert (=> d!57753 (= res!102295 (or (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))))

(declare-fun lt!107252 () ListLongMap!3019)

(assert (=> d!57753 (= lt!107255 lt!107252)))

(declare-fun lt!107247 () Unit!6340)

(assert (=> d!57753 (= lt!107247 e!136663)))

(declare-fun c!35496 () Bool)

(declare-fun e!136665 () Bool)

(assert (=> d!57753 (= c!35496 e!136665)))

(declare-fun res!102297 () Bool)

(assert (=> d!57753 (=> (not res!102297) (not e!136665))))

(assert (=> d!57753 (= res!102297 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57753 (= lt!107252 e!136658)))

(declare-fun c!35501 () Bool)

(assert (=> d!57753 (= c!35501 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57753 (validMask!0 mask!1149)))

(assert (=> d!57753 (= (getCurrentListMap!1039 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107255)))

(declare-fun bm!19826 () Bool)

(assert (=> bm!19826 (= call!19829 call!19833)))

(declare-fun bm!19827 () Bool)

(declare-fun call!19830 () Bool)

(assert (=> bm!19827 (= call!19830 (contains!1370 lt!107255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19828 () Bool)

(declare-fun call!19834 () ListLongMap!3019)

(assert (=> bm!19828 (= call!19834 call!19828)))

(declare-fun b!209833 () Bool)

(declare-fun e!136662 () ListLongMap!3019)

(assert (=> b!209833 (= e!136662 call!19834)))

(declare-fun b!209834 () Bool)

(assert (=> b!209834 (= e!136656 (not call!19831))))

(declare-fun b!209835 () Bool)

(declare-fun e!136668 () Bool)

(declare-fun e!136660 () Bool)

(assert (=> b!209835 (= e!136668 e!136660)))

(declare-fun res!102293 () Bool)

(assert (=> b!209835 (= res!102293 call!19830)))

(assert (=> b!209835 (=> (not res!102293) (not e!136660))))

(declare-fun b!209836 () Bool)

(assert (=> b!209836 (= e!136660 (= (apply!190 lt!107255 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19829 () Bool)

(assert (=> bm!19829 (= call!19831 (contains!1370 lt!107255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209837 () Bool)

(assert (=> b!209837 (= e!136664 e!136656)))

(declare-fun c!35497 () Bool)

(assert (=> b!209837 (= c!35497 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209838 () Bool)

(declare-fun c!35498 () Bool)

(assert (=> b!209838 (= c!35498 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209838 (= e!136659 e!136662)))

(declare-fun b!209839 () Bool)

(declare-fun res!102296 () Bool)

(assert (=> b!209839 (=> (not res!102296) (not e!136664))))

(declare-fun e!136657 () Bool)

(assert (=> b!209839 (= res!102296 e!136657)))

(declare-fun res!102299 () Bool)

(assert (=> b!209839 (=> res!102299 e!136657)))

(declare-fun e!136667 () Bool)

(assert (=> b!209839 (= res!102299 (not e!136667))))

(declare-fun res!102292 () Bool)

(assert (=> b!209839 (=> (not res!102292) (not e!136667))))

(assert (=> b!209839 (= res!102292 (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209840 () Bool)

(assert (=> b!209840 (= e!136657 e!136661)))

(declare-fun res!102291 () Bool)

(assert (=> b!209840 (=> (not res!102291) (not e!136661))))

(assert (=> b!209840 (= res!102291 (contains!1370 lt!107255 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209840 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(declare-fun b!209841 () Bool)

(assert (=> b!209841 (= e!136667 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209842 () Bool)

(assert (=> b!209842 (= e!136665 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209843 () Bool)

(declare-fun Unit!6345 () Unit!6340)

(assert (=> b!209843 (= e!136663 Unit!6345)))

(declare-fun bm!19830 () Bool)

(assert (=> bm!19830 (= call!19833 (+!549 (ite c!35501 call!19832 (ite c!35499 call!19828 call!19834)) (ite (or c!35501 c!35499) (tuple2!4117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209844 () Bool)

(assert (=> b!209844 (= e!136662 call!19829)))

(declare-fun b!209845 () Bool)

(assert (=> b!209845 (= e!136668 (not call!19830))))

(declare-fun b!209846 () Bool)

(declare-fun res!102294 () Bool)

(assert (=> b!209846 (=> (not res!102294) (not e!136664))))

(assert (=> b!209846 (= res!102294 e!136668)))

(declare-fun c!35500 () Bool)

(assert (=> b!209846 (= c!35500 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209847 () Bool)

(assert (=> b!209847 (= e!136666 (= (apply!190 lt!107255 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19831 () Bool)

(assert (=> bm!19831 (= call!19832 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57753 c!35501) b!209830))

(assert (= (and d!57753 (not c!35501)) b!209832))

(assert (= (and b!209832 c!35499) b!209831))

(assert (= (and b!209832 (not c!35499)) b!209838))

(assert (= (and b!209838 c!35498) b!209844))

(assert (= (and b!209838 (not c!35498)) b!209833))

(assert (= (or b!209844 b!209833) bm!19828))

(assert (= (or b!209831 bm!19828) bm!19825))

(assert (= (or b!209831 b!209844) bm!19826))

(assert (= (or b!209830 bm!19825) bm!19831))

(assert (= (or b!209830 bm!19826) bm!19830))

(assert (= (and d!57753 res!102297) b!209842))

(assert (= (and d!57753 c!35496) b!209828))

(assert (= (and d!57753 (not c!35496)) b!209843))

(assert (= (and d!57753 res!102295) b!209839))

(assert (= (and b!209839 res!102292) b!209841))

(assert (= (and b!209839 (not res!102299)) b!209840))

(assert (= (and b!209840 res!102291) b!209827))

(assert (= (and b!209839 res!102296) b!209846))

(assert (= (and b!209846 c!35500) b!209835))

(assert (= (and b!209846 (not c!35500)) b!209845))

(assert (= (and b!209835 res!102293) b!209836))

(assert (= (or b!209835 b!209845) bm!19827))

(assert (= (and b!209846 res!102294) b!209837))

(assert (= (and b!209837 c!35497) b!209829))

(assert (= (and b!209837 (not c!35497)) b!209834))

(assert (= (and b!209829 res!102298) b!209847))

(assert (= (or b!209829 b!209834) bm!19829))

(declare-fun b_lambda!7555 () Bool)

(assert (=> (not b_lambda!7555) (not b!209827)))

(assert (=> b!209827 t!7955))

(declare-fun b_and!12275 () Bool)

(assert (= b_and!12273 (and (=> t!7955 result!4959) b_and!12275)))

(declare-fun m!236777 () Bool)

(assert (=> bm!19827 m!236777))

(assert (=> b!209841 m!236673))

(assert (=> b!209841 m!236673))

(assert (=> b!209841 m!236675))

(assert (=> bm!19831 m!236557))

(assert (=> b!209827 m!236673))

(declare-fun m!236779 () Bool)

(assert (=> b!209827 m!236779))

(assert (=> b!209827 m!236679))

(assert (=> b!209827 m!236731))

(assert (=> b!209827 m!236679))

(assert (=> b!209827 m!236733))

(assert (=> b!209827 m!236731))

(assert (=> b!209827 m!236673))

(assert (=> b!209842 m!236673))

(assert (=> b!209842 m!236673))

(assert (=> b!209842 m!236675))

(declare-fun m!236781 () Bool)

(assert (=> bm!19830 m!236781))

(declare-fun m!236783 () Bool)

(assert (=> b!209828 m!236783))

(declare-fun m!236785 () Bool)

(assert (=> b!209828 m!236785))

(assert (=> b!209828 m!236557))

(declare-fun m!236787 () Bool)

(assert (=> b!209828 m!236787))

(declare-fun m!236789 () Bool)

(assert (=> b!209828 m!236789))

(assert (=> b!209828 m!236787))

(declare-fun m!236791 () Bool)

(assert (=> b!209828 m!236791))

(declare-fun m!236793 () Bool)

(assert (=> b!209828 m!236793))

(declare-fun m!236795 () Bool)

(assert (=> b!209828 m!236795))

(declare-fun m!236797 () Bool)

(assert (=> b!209828 m!236797))

(declare-fun m!236799 () Bool)

(assert (=> b!209828 m!236799))

(declare-fun m!236801 () Bool)

(assert (=> b!209828 m!236801))

(declare-fun m!236803 () Bool)

(assert (=> b!209828 m!236803))

(assert (=> b!209828 m!236793))

(declare-fun m!236805 () Bool)

(assert (=> b!209828 m!236805))

(declare-fun m!236807 () Bool)

(assert (=> b!209828 m!236807))

(assert (=> b!209828 m!236673))

(assert (=> b!209828 m!236803))

(declare-fun m!236809 () Bool)

(assert (=> b!209828 m!236809))

(assert (=> b!209828 m!236783))

(declare-fun m!236811 () Bool)

(assert (=> b!209828 m!236811))

(declare-fun m!236813 () Bool)

(assert (=> b!209830 m!236813))

(declare-fun m!236815 () Bool)

(assert (=> b!209847 m!236815))

(assert (=> b!209840 m!236673))

(assert (=> b!209840 m!236673))

(declare-fun m!236817 () Bool)

(assert (=> b!209840 m!236817))

(declare-fun m!236819 () Bool)

(assert (=> b!209836 m!236819))

(declare-fun m!236821 () Bool)

(assert (=> bm!19829 m!236821))

(assert (=> d!57753 m!236561))

(assert (=> b!209632 d!57753))

(declare-fun d!57755 () Bool)

(assert (=> d!57755 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20898 d!57755))

(declare-fun d!57757 () Bool)

(assert (=> d!57757 (= (array_inv!3107 _values!649) (bvsge (size!5058 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20898 d!57757))

(declare-fun d!57759 () Bool)

(assert (=> d!57759 (= (array_inv!3108 _keys!825) (bvsge (size!5057 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20898 d!57759))

(declare-fun b!209858 () Bool)

(declare-fun e!136677 () Bool)

(declare-fun e!136680 () Bool)

(assert (=> b!209858 (= e!136677 e!136680)))

(declare-fun res!102307 () Bool)

(assert (=> b!209858 (=> (not res!102307) (not e!136680))))

(declare-fun e!136678 () Bool)

(assert (=> b!209858 (= res!102307 (not e!136678))))

(declare-fun res!102308 () Bool)

(assert (=> b!209858 (=> (not res!102308) (not e!136678))))

(assert (=> b!209858 (= res!102308 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209859 () Bool)

(declare-fun e!136679 () Bool)

(assert (=> b!209859 (= e!136680 e!136679)))

(declare-fun c!35504 () Bool)

(assert (=> b!209859 (= c!35504 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57761 () Bool)

(declare-fun res!102306 () Bool)

(assert (=> d!57761 (=> res!102306 e!136677)))

(assert (=> d!57761 (= res!102306 (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57761 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3024) e!136677)))

(declare-fun b!209860 () Bool)

(declare-fun call!19837 () Bool)

(assert (=> b!209860 (= e!136679 call!19837)))

(declare-fun bm!19834 () Bool)

(assert (=> bm!19834 (= call!19837 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35504 (Cons!3023 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) Nil!3024) Nil!3024)))))

(declare-fun b!209861 () Bool)

(assert (=> b!209861 (= e!136679 call!19837)))

(declare-fun b!209862 () Bool)

(declare-fun contains!1372 (List!3027 (_ BitVec 64)) Bool)

(assert (=> b!209862 (= e!136678 (contains!1372 Nil!3024 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57761 (not res!102306)) b!209858))

(assert (= (and b!209858 res!102308) b!209862))

(assert (= (and b!209858 res!102307) b!209859))

(assert (= (and b!209859 c!35504) b!209861))

(assert (= (and b!209859 (not c!35504)) b!209860))

(assert (= (or b!209861 b!209860) bm!19834))

(assert (=> b!209858 m!236673))

(assert (=> b!209858 m!236673))

(assert (=> b!209858 m!236675))

(assert (=> b!209859 m!236673))

(assert (=> b!209859 m!236673))

(assert (=> b!209859 m!236675))

(assert (=> bm!19834 m!236673))

(declare-fun m!236823 () Bool)

(assert (=> bm!19834 m!236823))

(assert (=> b!209862 m!236673))

(assert (=> b!209862 m!236673))

(declare-fun m!236825 () Bool)

(assert (=> b!209862 m!236825))

(assert (=> b!209631 d!57761))

(declare-fun bm!19837 () Bool)

(declare-fun call!19840 () Bool)

(assert (=> bm!19837 (= call!19840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!209871 () Bool)

(declare-fun e!136688 () Bool)

(assert (=> b!209871 (= e!136688 call!19840)))

(declare-fun b!209872 () Bool)

(declare-fun e!136687 () Bool)

(declare-fun e!136689 () Bool)

(assert (=> b!209872 (= e!136687 e!136689)))

(declare-fun c!35507 () Bool)

(assert (=> b!209872 (= c!35507 (validKeyInArray!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57763 () Bool)

(declare-fun res!102313 () Bool)

(assert (=> d!57763 (=> res!102313 e!136687)))

(assert (=> d!57763 (= res!102313 (bvsge #b00000000000000000000000000000000 (size!5057 _keys!825)))))

(assert (=> d!57763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136687)))

(declare-fun b!209873 () Bool)

(assert (=> b!209873 (= e!136689 e!136688)))

(declare-fun lt!107276 () (_ BitVec 64))

(assert (=> b!209873 (= lt!107276 (select (arr!4731 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107274 () Unit!6340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9965 (_ BitVec 64) (_ BitVec 32)) Unit!6340)

(assert (=> b!209873 (= lt!107274 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107276 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209873 (arrayContainsKey!0 _keys!825 lt!107276 #b00000000000000000000000000000000)))

(declare-fun lt!107275 () Unit!6340)

(assert (=> b!209873 (= lt!107275 lt!107274)))

(declare-fun res!102314 () Bool)

(declare-datatypes ((SeekEntryResult!706 0))(
  ( (MissingZero!706 (index!4994 (_ BitVec 32))) (Found!706 (index!4995 (_ BitVec 32))) (Intermediate!706 (undefined!1518 Bool) (index!4996 (_ BitVec 32)) (x!21994 (_ BitVec 32))) (Undefined!706) (MissingVacant!706 (index!4997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9965 (_ BitVec 32)) SeekEntryResult!706)

(assert (=> b!209873 (= res!102314 (= (seekEntryOrOpen!0 (select (arr!4731 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!706 #b00000000000000000000000000000000)))))

(assert (=> b!209873 (=> (not res!102314) (not e!136688))))

(declare-fun b!209874 () Bool)

(assert (=> b!209874 (= e!136689 call!19840)))

(assert (= (and d!57763 (not res!102313)) b!209872))

(assert (= (and b!209872 c!35507) b!209873))

(assert (= (and b!209872 (not c!35507)) b!209874))

(assert (= (and b!209873 res!102314) b!209871))

(assert (= (or b!209871 b!209874) bm!19837))

(declare-fun m!236827 () Bool)

(assert (=> bm!19837 m!236827))

(assert (=> b!209872 m!236673))

(assert (=> b!209872 m!236673))

(assert (=> b!209872 m!236675))

(assert (=> b!209873 m!236673))

(declare-fun m!236829 () Bool)

(assert (=> b!209873 m!236829))

(declare-fun m!236831 () Bool)

(assert (=> b!209873 m!236831))

(assert (=> b!209873 m!236673))

(declare-fun m!236833 () Bool)

(assert (=> b!209873 m!236833))

(assert (=> b!209630 d!57763))

(declare-fun d!57765 () Bool)

(assert (=> d!57765 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209629 d!57765))

(declare-fun d!57767 () Bool)

(declare-fun e!136690 () Bool)

(assert (=> d!57767 e!136690))

(declare-fun res!102316 () Bool)

(assert (=> d!57767 (=> (not res!102316) (not e!136690))))

(declare-fun lt!107279 () ListLongMap!3019)

(assert (=> d!57767 (= res!102316 (contains!1370 lt!107279 (_1!2069 lt!107076)))))

(declare-fun lt!107277 () List!3026)

(assert (=> d!57767 (= lt!107279 (ListLongMap!3020 lt!107277))))

(declare-fun lt!107278 () Unit!6340)

(declare-fun lt!107280 () Unit!6340)

(assert (=> d!57767 (= lt!107278 lt!107280)))

(assert (=> d!57767 (= (getValueByKey!246 lt!107277 (_1!2069 lt!107076)) (Some!251 (_2!2069 lt!107076)))))

(assert (=> d!57767 (= lt!107280 (lemmaContainsTupThenGetReturnValue!136 lt!107277 (_1!2069 lt!107076) (_2!2069 lt!107076)))))

(assert (=> d!57767 (= lt!107277 (insertStrictlySorted!139 (toList!1525 (+!549 lt!107078 lt!107074)) (_1!2069 lt!107076) (_2!2069 lt!107076)))))

(assert (=> d!57767 (= (+!549 (+!549 lt!107078 lt!107074) lt!107076) lt!107279)))

(declare-fun b!209875 () Bool)

(declare-fun res!102315 () Bool)

(assert (=> b!209875 (=> (not res!102315) (not e!136690))))

(assert (=> b!209875 (= res!102315 (= (getValueByKey!246 (toList!1525 lt!107279) (_1!2069 lt!107076)) (Some!251 (_2!2069 lt!107076))))))

(declare-fun b!209876 () Bool)

(assert (=> b!209876 (= e!136690 (contains!1371 (toList!1525 lt!107279) lt!107076))))

(assert (= (and d!57767 res!102316) b!209875))

(assert (= (and b!209875 res!102315) b!209876))

(declare-fun m!236835 () Bool)

(assert (=> d!57767 m!236835))

(declare-fun m!236837 () Bool)

(assert (=> d!57767 m!236837))

(declare-fun m!236839 () Bool)

(assert (=> d!57767 m!236839))

(declare-fun m!236841 () Bool)

(assert (=> d!57767 m!236841))

(declare-fun m!236843 () Bool)

(assert (=> b!209875 m!236843))

(declare-fun m!236845 () Bool)

(assert (=> b!209876 m!236845))

(assert (=> b!209624 d!57767))

(declare-fun d!57769 () Bool)

(declare-fun e!136691 () Bool)

(assert (=> d!57769 e!136691))

(declare-fun res!102318 () Bool)

(assert (=> d!57769 (=> (not res!102318) (not e!136691))))

(declare-fun lt!107283 () ListLongMap!3019)

(assert (=> d!57769 (= res!102318 (contains!1370 lt!107283 (_1!2069 lt!107074)))))

(declare-fun lt!107281 () List!3026)

(assert (=> d!57769 (= lt!107283 (ListLongMap!3020 lt!107281))))

(declare-fun lt!107282 () Unit!6340)

(declare-fun lt!107284 () Unit!6340)

(assert (=> d!57769 (= lt!107282 lt!107284)))

(assert (=> d!57769 (= (getValueByKey!246 lt!107281 (_1!2069 lt!107074)) (Some!251 (_2!2069 lt!107074)))))

(assert (=> d!57769 (= lt!107284 (lemmaContainsTupThenGetReturnValue!136 lt!107281 (_1!2069 lt!107074) (_2!2069 lt!107074)))))

(assert (=> d!57769 (= lt!107281 (insertStrictlySorted!139 (toList!1525 lt!107078) (_1!2069 lt!107074) (_2!2069 lt!107074)))))

(assert (=> d!57769 (= (+!549 lt!107078 lt!107074) lt!107283)))

(declare-fun b!209877 () Bool)

(declare-fun res!102317 () Bool)

(assert (=> b!209877 (=> (not res!102317) (not e!136691))))

(assert (=> b!209877 (= res!102317 (= (getValueByKey!246 (toList!1525 lt!107283) (_1!2069 lt!107074)) (Some!251 (_2!2069 lt!107074))))))

(declare-fun b!209878 () Bool)

(assert (=> b!209878 (= e!136691 (contains!1371 (toList!1525 lt!107283) lt!107074))))

(assert (= (and d!57769 res!102318) b!209877))

(assert (= (and b!209877 res!102317) b!209878))

(declare-fun m!236847 () Bool)

(assert (=> d!57769 m!236847))

(declare-fun m!236849 () Bool)

(assert (=> d!57769 m!236849))

(declare-fun m!236851 () Bool)

(assert (=> d!57769 m!236851))

(declare-fun m!236853 () Bool)

(assert (=> d!57769 m!236853))

(declare-fun m!236855 () Bool)

(assert (=> b!209877 m!236855))

(declare-fun m!236857 () Bool)

(assert (=> b!209878 m!236857))

(assert (=> b!209624 d!57769))

(declare-fun d!57771 () Bool)

(declare-fun e!136692 () Bool)

(assert (=> d!57771 e!136692))

(declare-fun res!102320 () Bool)

(assert (=> d!57771 (=> (not res!102320) (not e!136692))))

(declare-fun lt!107287 () ListLongMap!3019)

(assert (=> d!57771 (= res!102320 (contains!1370 lt!107287 (_1!2069 lt!107076)))))

(declare-fun lt!107285 () List!3026)

(assert (=> d!57771 (= lt!107287 (ListLongMap!3020 lt!107285))))

(declare-fun lt!107286 () Unit!6340)

(declare-fun lt!107288 () Unit!6340)

(assert (=> d!57771 (= lt!107286 lt!107288)))

(assert (=> d!57771 (= (getValueByKey!246 lt!107285 (_1!2069 lt!107076)) (Some!251 (_2!2069 lt!107076)))))

(assert (=> d!57771 (= lt!107288 (lemmaContainsTupThenGetReturnValue!136 lt!107285 (_1!2069 lt!107076) (_2!2069 lt!107076)))))

(assert (=> d!57771 (= lt!107285 (insertStrictlySorted!139 (toList!1525 (+!549 lt!107077 lt!107074)) (_1!2069 lt!107076) (_2!2069 lt!107076)))))

(assert (=> d!57771 (= (+!549 (+!549 lt!107077 lt!107074) lt!107076) lt!107287)))

(declare-fun b!209879 () Bool)

(declare-fun res!102319 () Bool)

(assert (=> b!209879 (=> (not res!102319) (not e!136692))))

(assert (=> b!209879 (= res!102319 (= (getValueByKey!246 (toList!1525 lt!107287) (_1!2069 lt!107076)) (Some!251 (_2!2069 lt!107076))))))

(declare-fun b!209880 () Bool)

(assert (=> b!209880 (= e!136692 (contains!1371 (toList!1525 lt!107287) lt!107076))))

(assert (= (and d!57771 res!102320) b!209879))

(assert (= (and b!209879 res!102319) b!209880))

(declare-fun m!236859 () Bool)

(assert (=> d!57771 m!236859))

(declare-fun m!236861 () Bool)

(assert (=> d!57771 m!236861))

(declare-fun m!236863 () Bool)

(assert (=> d!57771 m!236863))

(declare-fun m!236865 () Bool)

(assert (=> d!57771 m!236865))

(declare-fun m!236867 () Bool)

(assert (=> b!209879 m!236867))

(declare-fun m!236869 () Bool)

(assert (=> b!209880 m!236869))

(assert (=> b!209624 d!57771))

(declare-fun d!57773 () Bool)

(declare-fun e!136693 () Bool)

(assert (=> d!57773 e!136693))

(declare-fun res!102322 () Bool)

(assert (=> d!57773 (=> (not res!102322) (not e!136693))))

(declare-fun lt!107291 () ListLongMap!3019)

(assert (=> d!57773 (= res!102322 (contains!1370 lt!107291 (_1!2069 lt!107074)))))

(declare-fun lt!107289 () List!3026)

(assert (=> d!57773 (= lt!107291 (ListLongMap!3020 lt!107289))))

(declare-fun lt!107290 () Unit!6340)

(declare-fun lt!107292 () Unit!6340)

(assert (=> d!57773 (= lt!107290 lt!107292)))

(assert (=> d!57773 (= (getValueByKey!246 lt!107289 (_1!2069 lt!107074)) (Some!251 (_2!2069 lt!107074)))))

(assert (=> d!57773 (= lt!107292 (lemmaContainsTupThenGetReturnValue!136 lt!107289 (_1!2069 lt!107074) (_2!2069 lt!107074)))))

(assert (=> d!57773 (= lt!107289 (insertStrictlySorted!139 (toList!1525 lt!107077) (_1!2069 lt!107074) (_2!2069 lt!107074)))))

(assert (=> d!57773 (= (+!549 lt!107077 lt!107074) lt!107291)))

(declare-fun b!209881 () Bool)

(declare-fun res!102321 () Bool)

(assert (=> b!209881 (=> (not res!102321) (not e!136693))))

(assert (=> b!209881 (= res!102321 (= (getValueByKey!246 (toList!1525 lt!107291) (_1!2069 lt!107074)) (Some!251 (_2!2069 lt!107074))))))

(declare-fun b!209882 () Bool)

(assert (=> b!209882 (= e!136693 (contains!1371 (toList!1525 lt!107291) lt!107074))))

(assert (= (and d!57773 res!102322) b!209881))

(assert (= (and b!209881 res!102321) b!209882))

(declare-fun m!236871 () Bool)

(assert (=> d!57773 m!236871))

(declare-fun m!236873 () Bool)

(assert (=> d!57773 m!236873))

(declare-fun m!236875 () Bool)

(assert (=> d!57773 m!236875))

(declare-fun m!236877 () Bool)

(assert (=> d!57773 m!236877))

(declare-fun m!236879 () Bool)

(assert (=> b!209881 m!236879))

(declare-fun m!236881 () Bool)

(assert (=> b!209882 m!236881))

(assert (=> b!209624 d!57773))

(declare-fun condMapEmpty!9164 () Bool)

(declare-fun mapDefault!9164 () ValueCell!2351)

(assert (=> mapNonEmpty!9155 (= condMapEmpty!9164 (= mapRest!9155 ((as const (Array (_ BitVec 32) ValueCell!2351)) mapDefault!9164)))))

(declare-fun e!136699 () Bool)

(declare-fun mapRes!9164 () Bool)

(assert (=> mapNonEmpty!9155 (= tp!19624 (and e!136699 mapRes!9164))))

(declare-fun mapIsEmpty!9164 () Bool)

(assert (=> mapIsEmpty!9164 mapRes!9164))

(declare-fun mapNonEmpty!9164 () Bool)

(declare-fun tp!19640 () Bool)

(declare-fun e!136698 () Bool)

(assert (=> mapNonEmpty!9164 (= mapRes!9164 (and tp!19640 e!136698))))

(declare-fun mapKey!9164 () (_ BitVec 32))

(declare-fun mapValue!9164 () ValueCell!2351)

(declare-fun mapRest!9164 () (Array (_ BitVec 32) ValueCell!2351))

(assert (=> mapNonEmpty!9164 (= mapRest!9155 (store mapRest!9164 mapKey!9164 mapValue!9164))))

(declare-fun b!209889 () Bool)

(assert (=> b!209889 (= e!136698 tp_is_empty!5389)))

(declare-fun b!209890 () Bool)

(assert (=> b!209890 (= e!136699 tp_is_empty!5389)))

(assert (= (and mapNonEmpty!9155 condMapEmpty!9164) mapIsEmpty!9164))

(assert (= (and mapNonEmpty!9155 (not condMapEmpty!9164)) mapNonEmpty!9164))

(assert (= (and mapNonEmpty!9164 ((_ is ValueCellFull!2351) mapValue!9164)) b!209889))

(assert (= (and mapNonEmpty!9155 ((_ is ValueCellFull!2351) mapDefault!9164)) b!209890))

(declare-fun m!236883 () Bool)

(assert (=> mapNonEmpty!9164 m!236883))

(declare-fun b_lambda!7557 () Bool)

(assert (= b_lambda!7555 (or (and start!20898 b_free!5527) b_lambda!7557)))

(declare-fun b_lambda!7559 () Bool)

(assert (= b_lambda!7549 (or (and start!20898 b_free!5527) b_lambda!7559)))

(declare-fun b_lambda!7561 () Bool)

(assert (= b_lambda!7551 (or (and start!20898 b_free!5527) b_lambda!7561)))

(declare-fun b_lambda!7563 () Bool)

(assert (= b_lambda!7545 (or (and start!20898 b_free!5527) b_lambda!7563)))

(declare-fun b_lambda!7565 () Bool)

(assert (= b_lambda!7553 (or (and start!20898 b_free!5527) b_lambda!7565)))

(declare-fun b_lambda!7567 () Bool)

(assert (= b_lambda!7547 (or (and start!20898 b_free!5527) b_lambda!7567)))

(check-sat (not b!209750) (not b!209812) (not b!209882) (not b!209814) (not b!209811) (not b!209762) (not b!209801) (not bm!19814) (not bm!19837) (not b!209875) (not d!57773) (not b!209802) (not b_lambda!7567) (not b!209760) (not d!57751) (not b!209858) (not mapNonEmpty!9164) (not b!209799) (not b!209877) (not b!209704) (not b!209842) (not b!209809) (not bm!19834) (not bm!19810) (not b!209767) (not b!209830) (not b!209859) (not b!209804) (not b_lambda!7559) (not d!57753) (not b!209813) (not d!57747) b_and!12275 (not bm!19823) (not bm!19818) (not bm!19827) (not b!209794) (not b!209798) (not b!209880) (not b!209876) (not b!209828) (not bm!19812) (not b!209797) (not b!209862) (not b!209816) (not b_lambda!7565) (not b_next!5527) (not b!209827) (not d!57743) (not b!209840) (not b!209826) (not bm!19829) (not d!57769) (not b!209841) (not bm!19830) (not b!209878) tp_is_empty!5389 (not b!209806) (not b!209873) (not b!209761) (not b!209879) (not b!209847) (not d!57771) (not b_lambda!7557) (not b!209872) (not bm!19831) (not d!57767) (not b!209747) (not b_lambda!7563) (not b!209810) (not b!209800) (not b!209836) (not b!209748) (not b!209703) (not bm!19824) (not bm!19813) (not d!57745) (not b_lambda!7561) (not bm!19817) (not b!209756) (not d!57749) (not b!209881))
(check-sat b_and!12275 (not b_next!5527))
