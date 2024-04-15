; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21150 () Bool)

(assert start!21150)

(declare-fun b_free!5617 () Bool)

(declare-fun b_next!5617 () Bool)

(assert (=> start!21150 (= b_free!5617 (not b_next!5617))))

(declare-fun tp!19918 () Bool)

(declare-fun b_and!12445 () Bool)

(assert (=> start!21150 (= tp!19918 b_and!12445)))

(declare-fun b!212737 () Bool)

(declare-fun e!138387 () Bool)

(declare-fun e!138388 () Bool)

(declare-fun mapRes!9314 () Bool)

(assert (=> b!212737 (= e!138387 (and e!138388 mapRes!9314))))

(declare-fun condMapEmpty!9314 () Bool)

(declare-datatypes ((V!6953 0))(
  ( (V!6954 (val!2784 Int)) )
))
(declare-datatypes ((ValueCell!2396 0))(
  ( (ValueCellFull!2396 (v!4784 V!6953)) (EmptyCell!2396) )
))
(declare-datatypes ((array!10151 0))(
  ( (array!10152 (arr!4816 (Array (_ BitVec 32) ValueCell!2396)) (size!5142 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10151)

(declare-fun mapDefault!9314 () ValueCell!2396)

(assert (=> b!212737 (= condMapEmpty!9314 (= (arr!4816 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2396)) mapDefault!9314)))))

(declare-fun b!212738 () Bool)

(declare-fun res!104036 () Bool)

(declare-fun e!138392 () Bool)

(assert (=> b!212738 (=> (not res!104036) (not e!138392))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212738 (= res!104036 (validKeyInArray!0 k0!843))))

(declare-fun b!212739 () Bool)

(declare-fun e!138390 () Bool)

(declare-fun tp_is_empty!5479 () Bool)

(assert (=> b!212739 (= e!138390 tp_is_empty!5479)))

(declare-fun b!212740 () Bool)

(declare-fun res!104037 () Bool)

(assert (=> b!212740 (=> (not res!104037) (not e!138392))))

(declare-datatypes ((array!10153 0))(
  ( (array!10154 (arr!4817 (Array (_ BitVec 32) (_ BitVec 64))) (size!5143 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10153)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!212740 (= res!104037 (and (= (size!5142 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5143 _keys!825) (size!5142 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9314 () Bool)

(declare-fun tp!19919 () Bool)

(assert (=> mapNonEmpty!9314 (= mapRes!9314 (and tp!19919 e!138390))))

(declare-fun mapValue!9314 () ValueCell!2396)

(declare-fun mapRest!9314 () (Array (_ BitVec 32) ValueCell!2396))

(declare-fun mapKey!9314 () (_ BitVec 32))

(assert (=> mapNonEmpty!9314 (= (arr!4816 _values!649) (store mapRest!9314 mapKey!9314 mapValue!9314))))

(declare-fun b!212741 () Bool)

(declare-fun res!104029 () Bool)

(assert (=> b!212741 (=> (not res!104029) (not e!138392))))

(declare-datatypes ((List!3089 0))(
  ( (Nil!3086) (Cons!3085 (h!3727 (_ BitVec 64)) (t!8029 List!3089)) )
))
(declare-fun arrayNoDuplicates!0 (array!10153 (_ BitVec 32) List!3089) Bool)

(assert (=> b!212741 (= res!104029 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3086))))

(declare-fun b!212742 () Bool)

(declare-fun res!104028 () Bool)

(assert (=> b!212742 (=> (not res!104028) (not e!138392))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212742 (= res!104028 (= (select (arr!4817 _keys!825) i!601) k0!843))))

(declare-fun e!138386 () Bool)

(declare-datatypes ((tuple2!4182 0))(
  ( (tuple2!4183 (_1!2102 (_ BitVec 64)) (_2!2102 V!6953)) )
))
(declare-datatypes ((List!3090 0))(
  ( (Nil!3087) (Cons!3086 (h!3728 tuple2!4182) (t!8030 List!3090)) )
))
(declare-datatypes ((ListLongMap!3085 0))(
  ( (ListLongMap!3086 (toList!1558 List!3090)) )
))
(declare-fun lt!109657 () ListLongMap!3085)

(declare-fun b!212743 () Bool)

(declare-fun lt!109654 () tuple2!4182)

(declare-fun lt!109656 () ListLongMap!3085)

(declare-fun +!582 (ListLongMap!3085 tuple2!4182) ListLongMap!3085)

(assert (=> b!212743 (= e!138386 (= lt!109657 (+!582 lt!109656 lt!109654)))))

(declare-fun b!212736 () Bool)

(declare-fun res!104030 () Bool)

(assert (=> b!212736 (=> (not res!104030) (not e!138386))))

(declare-fun lt!109659 () ListLongMap!3085)

(declare-fun lt!109660 () ListLongMap!3085)

(assert (=> b!212736 (= res!104030 (= lt!109660 (+!582 lt!109659 lt!109654)))))

(declare-fun res!104033 () Bool)

(assert (=> start!21150 (=> (not res!104033) (not e!138392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21150 (= res!104033 (validMask!0 mask!1149))))

(assert (=> start!21150 e!138392))

(declare-fun array_inv!3161 (array!10151) Bool)

(assert (=> start!21150 (and (array_inv!3161 _values!649) e!138387)))

(assert (=> start!21150 true))

(assert (=> start!21150 tp_is_empty!5479))

(declare-fun array_inv!3162 (array!10153) Bool)

(assert (=> start!21150 (array_inv!3162 _keys!825)))

(assert (=> start!21150 tp!19918))

(declare-fun b!212744 () Bool)

(declare-fun res!104034 () Bool)

(assert (=> b!212744 (=> (not res!104034) (not e!138392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10153 (_ BitVec 32)) Bool)

(assert (=> b!212744 (= res!104034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212745 () Bool)

(declare-fun e!138389 () Bool)

(assert (=> b!212745 (= e!138389 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212745 e!138386))

(declare-fun res!104035 () Bool)

(assert (=> b!212745 (=> (not res!104035) (not e!138386))))

(declare-fun lt!109653 () ListLongMap!3085)

(assert (=> b!212745 (= res!104035 (= lt!109660 (+!582 lt!109653 lt!109654)))))

(declare-fun minValue!615 () V!6953)

(assert (=> b!212745 (= lt!109654 (tuple2!4183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!9314 () Bool)

(assert (=> mapIsEmpty!9314 mapRes!9314))

(declare-fun b!212746 () Bool)

(assert (=> b!212746 (= e!138388 tp_is_empty!5479)))

(declare-fun b!212747 () Bool)

(declare-fun res!104032 () Bool)

(assert (=> b!212747 (=> (not res!104032) (not e!138392))))

(assert (=> b!212747 (= res!104032 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5143 _keys!825))))))

(declare-fun b!212748 () Bool)

(assert (=> b!212748 (= e!138392 (not e!138389))))

(declare-fun res!104031 () Bool)

(assert (=> b!212748 (=> res!104031 e!138389)))

(assert (=> b!212748 (= res!104031 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6953)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1068 (array!10153 array!10151 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) Int) ListLongMap!3085)

(assert (=> b!212748 (= lt!109657 (getCurrentListMap!1068 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109658 () array!10151)

(assert (=> b!212748 (= lt!109660 (getCurrentListMap!1068 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212748 (and (= lt!109653 lt!109659) (= lt!109659 lt!109653))))

(declare-fun v!520 () V!6953)

(assert (=> b!212748 (= lt!109659 (+!582 lt!109656 (tuple2!4183 k0!843 v!520)))))

(declare-datatypes ((Unit!6414 0))(
  ( (Unit!6415) )
))
(declare-fun lt!109655 () Unit!6414)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 (array!10153 array!10151 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) (_ BitVec 64) V!6953 (_ BitVec 32) Int) Unit!6414)

(assert (=> b!212748 (= lt!109655 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!505 (array!10153 array!10151 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) Int) ListLongMap!3085)

(assert (=> b!212748 (= lt!109653 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212748 (= lt!109658 (array!10152 (store (arr!4816 _values!649) i!601 (ValueCellFull!2396 v!520)) (size!5142 _values!649)))))

(assert (=> b!212748 (= lt!109656 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!21150 res!104033) b!212740))

(assert (= (and b!212740 res!104037) b!212744))

(assert (= (and b!212744 res!104034) b!212741))

(assert (= (and b!212741 res!104029) b!212747))

(assert (= (and b!212747 res!104032) b!212738))

(assert (= (and b!212738 res!104036) b!212742))

(assert (= (and b!212742 res!104028) b!212748))

(assert (= (and b!212748 (not res!104031)) b!212745))

(assert (= (and b!212745 res!104035) b!212736))

(assert (= (and b!212736 res!104030) b!212743))

(assert (= (and b!212737 condMapEmpty!9314) mapIsEmpty!9314))

(assert (= (and b!212737 (not condMapEmpty!9314)) mapNonEmpty!9314))

(get-info :version)

(assert (= (and mapNonEmpty!9314 ((_ is ValueCellFull!2396) mapValue!9314)) b!212739))

(assert (= (and b!212737 ((_ is ValueCellFull!2396) mapDefault!9314)) b!212746))

(assert (= start!21150 b!212737))

(declare-fun m!240091 () Bool)

(assert (=> start!21150 m!240091))

(declare-fun m!240093 () Bool)

(assert (=> start!21150 m!240093))

(declare-fun m!240095 () Bool)

(assert (=> start!21150 m!240095))

(declare-fun m!240097 () Bool)

(assert (=> mapNonEmpty!9314 m!240097))

(declare-fun m!240099 () Bool)

(assert (=> b!212745 m!240099))

(declare-fun m!240101 () Bool)

(assert (=> b!212741 m!240101))

(declare-fun m!240103 () Bool)

(assert (=> b!212744 m!240103))

(declare-fun m!240105 () Bool)

(assert (=> b!212742 m!240105))

(declare-fun m!240107 () Bool)

(assert (=> b!212738 m!240107))

(declare-fun m!240109 () Bool)

(assert (=> b!212748 m!240109))

(declare-fun m!240111 () Bool)

(assert (=> b!212748 m!240111))

(declare-fun m!240113 () Bool)

(assert (=> b!212748 m!240113))

(declare-fun m!240115 () Bool)

(assert (=> b!212748 m!240115))

(declare-fun m!240117 () Bool)

(assert (=> b!212748 m!240117))

(declare-fun m!240119 () Bool)

(assert (=> b!212748 m!240119))

(declare-fun m!240121 () Bool)

(assert (=> b!212748 m!240121))

(declare-fun m!240123 () Bool)

(assert (=> b!212743 m!240123))

(declare-fun m!240125 () Bool)

(assert (=> b!212736 m!240125))

(check-sat (not b!212736) (not mapNonEmpty!9314) (not start!21150) b_and!12445 tp_is_empty!5479 (not b!212748) (not b!212743) (not b!212741) (not b!212738) (not b!212745) (not b!212744) (not b_next!5617))
(check-sat b_and!12445 (not b_next!5617))
(get-model)

(declare-fun d!58021 () Bool)

(assert (=> d!58021 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212738 d!58021))

(declare-fun d!58023 () Bool)

(assert (=> d!58023 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21150 d!58023))

(declare-fun d!58025 () Bool)

(assert (=> d!58025 (= (array_inv!3161 _values!649) (bvsge (size!5142 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21150 d!58025))

(declare-fun d!58027 () Bool)

(assert (=> d!58027 (= (array_inv!3162 _keys!825) (bvsge (size!5143 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21150 d!58027))

(declare-fun b!212835 () Bool)

(declare-fun e!138443 () Bool)

(declare-fun e!138441 () Bool)

(assert (=> b!212835 (= e!138443 e!138441)))

(declare-fun c!35853 () Bool)

(assert (=> b!212835 (= c!35853 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58029 () Bool)

(declare-fun res!104103 () Bool)

(assert (=> d!58029 (=> res!104103 e!138443)))

(assert (=> d!58029 (= res!104103 (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58029 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138443)))

(declare-fun b!212836 () Bool)

(declare-fun e!138442 () Bool)

(declare-fun call!20151 () Bool)

(assert (=> b!212836 (= e!138442 call!20151)))

(declare-fun b!212837 () Bool)

(assert (=> b!212837 (= e!138441 call!20151)))

(declare-fun b!212838 () Bool)

(assert (=> b!212838 (= e!138441 e!138442)))

(declare-fun lt!109717 () (_ BitVec 64))

(assert (=> b!212838 (= lt!109717 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109716 () Unit!6414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10153 (_ BitVec 64) (_ BitVec 32)) Unit!6414)

(assert (=> b!212838 (= lt!109716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109717 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212838 (arrayContainsKey!0 _keys!825 lt!109717 #b00000000000000000000000000000000)))

(declare-fun lt!109715 () Unit!6414)

(assert (=> b!212838 (= lt!109715 lt!109716)))

(declare-fun res!104102 () Bool)

(declare-datatypes ((SeekEntryResult!714 0))(
  ( (MissingZero!714 (index!5026 (_ BitVec 32))) (Found!714 (index!5027 (_ BitVec 32))) (Intermediate!714 (undefined!1526 Bool) (index!5028 (_ BitVec 32)) (x!22210 (_ BitVec 32))) (Undefined!714) (MissingVacant!714 (index!5029 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10153 (_ BitVec 32)) SeekEntryResult!714)

(assert (=> b!212838 (= res!104102 (= (seekEntryOrOpen!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!714 #b00000000000000000000000000000000)))))

(assert (=> b!212838 (=> (not res!104102) (not e!138442))))

(declare-fun bm!20148 () Bool)

(assert (=> bm!20148 (= call!20151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(assert (= (and d!58029 (not res!104103)) b!212835))

(assert (= (and b!212835 c!35853) b!212838))

(assert (= (and b!212835 (not c!35853)) b!212837))

(assert (= (and b!212838 res!104102) b!212836))

(assert (= (or b!212836 b!212837) bm!20148))

(declare-fun m!240199 () Bool)

(assert (=> b!212835 m!240199))

(assert (=> b!212835 m!240199))

(declare-fun m!240201 () Bool)

(assert (=> b!212835 m!240201))

(assert (=> b!212838 m!240199))

(declare-fun m!240203 () Bool)

(assert (=> b!212838 m!240203))

(declare-fun m!240205 () Bool)

(assert (=> b!212838 m!240205))

(assert (=> b!212838 m!240199))

(declare-fun m!240207 () Bool)

(assert (=> b!212838 m!240207))

(declare-fun m!240209 () Bool)

(assert (=> bm!20148 m!240209))

(assert (=> b!212744 d!58029))

(declare-fun b!212863 () Bool)

(declare-fun e!138463 () ListLongMap!3085)

(declare-fun e!138462 () ListLongMap!3085)

(assert (=> b!212863 (= e!138463 e!138462)))

(declare-fun c!35863 () Bool)

(assert (=> b!212863 (= c!35863 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212864 () Bool)

(declare-fun res!104115 () Bool)

(declare-fun e!138460 () Bool)

(assert (=> b!212864 (=> (not res!104115) (not e!138460))))

(declare-fun lt!109736 () ListLongMap!3085)

(declare-fun contains!1394 (ListLongMap!3085 (_ BitVec 64)) Bool)

(assert (=> b!212864 (= res!104115 (not (contains!1394 lt!109736 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212865 () Bool)

(declare-fun e!138461 () Bool)

(assert (=> b!212865 (= e!138461 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212865 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212866 () Bool)

(declare-fun e!138464 () Bool)

(declare-fun e!138458 () Bool)

(assert (=> b!212866 (= e!138464 e!138458)))

(assert (=> b!212866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun res!104114 () Bool)

(assert (=> b!212866 (= res!104114 (contains!1394 lt!109736 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212866 (=> (not res!104114) (not e!138458))))

(declare-fun e!138459 () Bool)

(declare-fun b!212867 () Bool)

(assert (=> b!212867 (= e!138459 (= lt!109736 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58031 () Bool)

(assert (=> d!58031 e!138460))

(declare-fun res!104113 () Bool)

(assert (=> d!58031 (=> (not res!104113) (not e!138460))))

(assert (=> d!58031 (= res!104113 (not (contains!1394 lt!109736 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58031 (= lt!109736 e!138463)))

(declare-fun c!35865 () Bool)

(assert (=> d!58031 (= c!35865 (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58031 (validMask!0 mask!1149)))

(assert (=> d!58031 (= (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109736)))

(declare-fun call!20154 () ListLongMap!3085)

(declare-fun bm!20151 () Bool)

(assert (=> bm!20151 (= call!20154 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212868 () Bool)

(assert (=> b!212868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> b!212868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 _values!649)))))

(declare-fun apply!198 (ListLongMap!3085 (_ BitVec 64)) V!6953)

(declare-fun get!2574 (ValueCell!2396 V!6953) V!6953)

(declare-fun dynLambda!532 (Int (_ BitVec 64)) V!6953)

(assert (=> b!212868 (= e!138458 (= (apply!198 lt!109736 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)) (get!2574 (select (arr!4816 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212869 () Bool)

(assert (=> b!212869 (= e!138460 e!138464)))

(declare-fun c!35862 () Bool)

(assert (=> b!212869 (= c!35862 e!138461)))

(declare-fun res!104112 () Bool)

(assert (=> b!212869 (=> (not res!104112) (not e!138461))))

(assert (=> b!212869 (= res!104112 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212870 () Bool)

(assert (=> b!212870 (= e!138463 (ListLongMap!3086 Nil!3087))))

(declare-fun b!212871 () Bool)

(declare-fun isEmpty!503 (ListLongMap!3085) Bool)

(assert (=> b!212871 (= e!138459 (isEmpty!503 lt!109736))))

(declare-fun b!212872 () Bool)

(assert (=> b!212872 (= e!138464 e!138459)))

(declare-fun c!35864 () Bool)

(assert (=> b!212872 (= c!35864 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212873 () Bool)

(assert (=> b!212873 (= e!138462 call!20154)))

(declare-fun b!212874 () Bool)

(declare-fun lt!109732 () Unit!6414)

(declare-fun lt!109737 () Unit!6414)

(assert (=> b!212874 (= lt!109732 lt!109737)))

(declare-fun lt!109734 () ListLongMap!3085)

(declare-fun lt!109738 () (_ BitVec 64))

(declare-fun lt!109735 () V!6953)

(declare-fun lt!109733 () (_ BitVec 64))

(assert (=> b!212874 (not (contains!1394 (+!582 lt!109734 (tuple2!4183 lt!109738 lt!109735)) lt!109733))))

(declare-fun addStillNotContains!108 (ListLongMap!3085 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6414)

(assert (=> b!212874 (= lt!109737 (addStillNotContains!108 lt!109734 lt!109738 lt!109735 lt!109733))))

(assert (=> b!212874 (= lt!109733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212874 (= lt!109735 (get!2574 (select (arr!4816 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212874 (= lt!109738 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212874 (= lt!109734 call!20154)))

(assert (=> b!212874 (= e!138462 (+!582 call!20154 (tuple2!4183 (select (arr!4817 _keys!825) #b00000000000000000000000000000000) (get!2574 (select (arr!4816 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!58031 c!35865) b!212870))

(assert (= (and d!58031 (not c!35865)) b!212863))

(assert (= (and b!212863 c!35863) b!212874))

(assert (= (and b!212863 (not c!35863)) b!212873))

(assert (= (or b!212874 b!212873) bm!20151))

(assert (= (and d!58031 res!104113) b!212864))

(assert (= (and b!212864 res!104115) b!212869))

(assert (= (and b!212869 res!104112) b!212865))

(assert (= (and b!212869 c!35862) b!212866))

(assert (= (and b!212869 (not c!35862)) b!212872))

(assert (= (and b!212866 res!104114) b!212868))

(assert (= (and b!212872 c!35864) b!212867))

(assert (= (and b!212872 (not c!35864)) b!212871))

(declare-fun b_lambda!7737 () Bool)

(assert (=> (not b_lambda!7737) (not b!212868)))

(declare-fun t!8032 () Bool)

(declare-fun tb!2901 () Bool)

(assert (=> (and start!21150 (= defaultEntry!657 defaultEntry!657) t!8032) tb!2901))

(declare-fun result!5007 () Bool)

(assert (=> tb!2901 (= result!5007 tp_is_empty!5479)))

(assert (=> b!212868 t!8032))

(declare-fun b_and!12451 () Bool)

(assert (= b_and!12445 (and (=> t!8032 result!5007) b_and!12451)))

(declare-fun b_lambda!7739 () Bool)

(assert (=> (not b_lambda!7739) (not b!212874)))

(assert (=> b!212874 t!8032))

(declare-fun b_and!12453 () Bool)

(assert (= b_and!12451 (and (=> t!8032 result!5007) b_and!12453)))

(assert (=> b!212863 m!240199))

(assert (=> b!212863 m!240199))

(assert (=> b!212863 m!240201))

(declare-fun m!240211 () Bool)

(assert (=> b!212868 m!240211))

(declare-fun m!240213 () Bool)

(assert (=> b!212868 m!240213))

(declare-fun m!240215 () Bool)

(assert (=> b!212868 m!240215))

(assert (=> b!212868 m!240211))

(assert (=> b!212868 m!240199))

(assert (=> b!212868 m!240199))

(declare-fun m!240217 () Bool)

(assert (=> b!212868 m!240217))

(assert (=> b!212868 m!240213))

(declare-fun m!240219 () Bool)

(assert (=> b!212867 m!240219))

(assert (=> b!212866 m!240199))

(assert (=> b!212866 m!240199))

(declare-fun m!240221 () Bool)

(assert (=> b!212866 m!240221))

(declare-fun m!240223 () Bool)

(assert (=> d!58031 m!240223))

(assert (=> d!58031 m!240091))

(declare-fun m!240225 () Bool)

(assert (=> b!212871 m!240225))

(declare-fun m!240227 () Bool)

(assert (=> b!212874 m!240227))

(assert (=> b!212874 m!240211))

(assert (=> b!212874 m!240213))

(assert (=> b!212874 m!240215))

(assert (=> b!212874 m!240211))

(assert (=> b!212874 m!240199))

(assert (=> b!212874 m!240213))

(declare-fun m!240229 () Bool)

(assert (=> b!212874 m!240229))

(assert (=> b!212874 m!240227))

(declare-fun m!240231 () Bool)

(assert (=> b!212874 m!240231))

(declare-fun m!240233 () Bool)

(assert (=> b!212874 m!240233))

(assert (=> b!212865 m!240199))

(assert (=> b!212865 m!240199))

(assert (=> b!212865 m!240201))

(assert (=> bm!20151 m!240219))

(declare-fun m!240235 () Bool)

(assert (=> b!212864 m!240235))

(assert (=> b!212748 d!58031))

(declare-fun b!212919 () Bool)

(declare-fun e!138496 () Unit!6414)

(declare-fun lt!109783 () Unit!6414)

(assert (=> b!212919 (= e!138496 lt!109783)))

(declare-fun lt!109802 () ListLongMap!3085)

(assert (=> b!212919 (= lt!109802 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109798 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109794 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109794 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109785 () Unit!6414)

(declare-fun addStillContains!174 (ListLongMap!3085 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6414)

(assert (=> b!212919 (= lt!109785 (addStillContains!174 lt!109802 lt!109798 zeroValue!615 lt!109794))))

(assert (=> b!212919 (contains!1394 (+!582 lt!109802 (tuple2!4183 lt!109798 zeroValue!615)) lt!109794)))

(declare-fun lt!109803 () Unit!6414)

(assert (=> b!212919 (= lt!109803 lt!109785)))

(declare-fun lt!109800 () ListLongMap!3085)

(assert (=> b!212919 (= lt!109800 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109801 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109801 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109797 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109797 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109796 () Unit!6414)

(declare-fun addApplyDifferent!174 (ListLongMap!3085 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6414)

(assert (=> b!212919 (= lt!109796 (addApplyDifferent!174 lt!109800 lt!109801 minValue!615 lt!109797))))

(assert (=> b!212919 (= (apply!198 (+!582 lt!109800 (tuple2!4183 lt!109801 minValue!615)) lt!109797) (apply!198 lt!109800 lt!109797))))

(declare-fun lt!109792 () Unit!6414)

(assert (=> b!212919 (= lt!109792 lt!109796)))

(declare-fun lt!109793 () ListLongMap!3085)

(assert (=> b!212919 (= lt!109793 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109799 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109804 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109804 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109786 () Unit!6414)

(assert (=> b!212919 (= lt!109786 (addApplyDifferent!174 lt!109793 lt!109799 zeroValue!615 lt!109804))))

(assert (=> b!212919 (= (apply!198 (+!582 lt!109793 (tuple2!4183 lt!109799 zeroValue!615)) lt!109804) (apply!198 lt!109793 lt!109804))))

(declare-fun lt!109788 () Unit!6414)

(assert (=> b!212919 (= lt!109788 lt!109786)))

(declare-fun lt!109784 () ListLongMap!3085)

(assert (=> b!212919 (= lt!109784 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109791 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109787 () (_ BitVec 64))

(assert (=> b!212919 (= lt!109787 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212919 (= lt!109783 (addApplyDifferent!174 lt!109784 lt!109791 minValue!615 lt!109787))))

(assert (=> b!212919 (= (apply!198 (+!582 lt!109784 (tuple2!4183 lt!109791 minValue!615)) lt!109787) (apply!198 lt!109784 lt!109787))))

(declare-fun b!212920 () Bool)

(declare-fun e!138501 () Bool)

(declare-fun e!138494 () Bool)

(assert (=> b!212920 (= e!138501 e!138494)))

(declare-fun res!104135 () Bool)

(assert (=> b!212920 (=> (not res!104135) (not e!138494))))

(declare-fun lt!109789 () ListLongMap!3085)

(assert (=> b!212920 (= res!104135 (contains!1394 lt!109789 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun c!35882 () Bool)

(declare-fun c!35878 () Bool)

(declare-fun call!20175 () ListLongMap!3085)

(declare-fun call!20171 () ListLongMap!3085)

(declare-fun call!20170 () ListLongMap!3085)

(declare-fun bm!20166 () Bool)

(declare-fun call!20169 () ListLongMap!3085)

(assert (=> bm!20166 (= call!20171 (+!582 (ite c!35878 call!20175 (ite c!35882 call!20170 call!20169)) (ite (or c!35878 c!35882) (tuple2!4183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20167 () Bool)

(declare-fun call!20172 () Bool)

(assert (=> bm!20167 (= call!20172 (contains!1394 lt!109789 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20168 () Bool)

(assert (=> bm!20168 (= call!20169 call!20170)))

(declare-fun b!212921 () Bool)

(declare-fun c!35880 () Bool)

(assert (=> b!212921 (= c!35880 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138497 () ListLongMap!3085)

(declare-fun e!138499 () ListLongMap!3085)

(assert (=> b!212921 (= e!138497 e!138499)))

(declare-fun b!212922 () Bool)

(declare-fun e!138491 () Bool)

(assert (=> b!212922 (= e!138491 (not call!20172))))

(declare-fun b!212923 () Bool)

(declare-fun res!104136 () Bool)

(declare-fun e!138495 () Bool)

(assert (=> b!212923 (=> (not res!104136) (not e!138495))))

(declare-fun e!138498 () Bool)

(assert (=> b!212923 (= res!104136 e!138498)))

(declare-fun c!35879 () Bool)

(assert (=> b!212923 (= c!35879 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212924 () Bool)

(declare-fun e!138502 () Bool)

(assert (=> b!212924 (= e!138502 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212925 () Bool)

(assert (=> b!212925 (= e!138495 e!138491)))

(declare-fun c!35883 () Bool)

(assert (=> b!212925 (= c!35883 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212926 () Bool)

(declare-fun e!138500 () Bool)

(assert (=> b!212926 (= e!138491 e!138500)))

(declare-fun res!104137 () Bool)

(assert (=> b!212926 (= res!104137 call!20172)))

(assert (=> b!212926 (=> (not res!104137) (not e!138500))))

(declare-fun b!212927 () Bool)

(declare-fun call!20173 () Bool)

(assert (=> b!212927 (= e!138498 (not call!20173))))

(declare-fun b!212928 () Bool)

(assert (=> b!212928 (= e!138494 (= (apply!198 lt!109789 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)) (get!2574 (select (arr!4816 lt!109658) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 lt!109658)))))

(assert (=> b!212928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212930 () Bool)

(declare-fun e!138492 () ListLongMap!3085)

(assert (=> b!212930 (= e!138492 e!138497)))

(assert (=> b!212930 (= c!35882 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212931 () Bool)

(declare-fun Unit!6416 () Unit!6414)

(assert (=> b!212931 (= e!138496 Unit!6416)))

(declare-fun b!212932 () Bool)

(declare-fun call!20174 () ListLongMap!3085)

(assert (=> b!212932 (= e!138497 call!20174)))

(declare-fun b!212933 () Bool)

(assert (=> b!212933 (= e!138499 call!20174)))

(declare-fun b!212934 () Bool)

(assert (=> b!212934 (= e!138499 call!20169)))

(declare-fun b!212935 () Bool)

(assert (=> b!212935 (= e!138492 (+!582 call!20171 (tuple2!4183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20169 () Bool)

(assert (=> bm!20169 (= call!20170 call!20175)))

(declare-fun b!212936 () Bool)

(declare-fun res!104142 () Bool)

(assert (=> b!212936 (=> (not res!104142) (not e!138495))))

(assert (=> b!212936 (= res!104142 e!138501)))

(declare-fun res!104134 () Bool)

(assert (=> b!212936 (=> res!104134 e!138501)))

(assert (=> b!212936 (= res!104134 (not e!138502))))

(declare-fun res!104140 () Bool)

(assert (=> b!212936 (=> (not res!104140) (not e!138502))))

(assert (=> b!212936 (= res!104140 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212937 () Bool)

(declare-fun e!138503 () Bool)

(assert (=> b!212937 (= e!138498 e!138503)))

(declare-fun res!104139 () Bool)

(assert (=> b!212937 (= res!104139 call!20173)))

(assert (=> b!212937 (=> (not res!104139) (not e!138503))))

(declare-fun b!212938 () Bool)

(assert (=> b!212938 (= e!138500 (= (apply!198 lt!109789 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20170 () Bool)

(assert (=> bm!20170 (= call!20173 (contains!1394 lt!109789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20171 () Bool)

(assert (=> bm!20171 (= call!20174 call!20171)))

(declare-fun b!212939 () Bool)

(assert (=> b!212939 (= e!138503 (= (apply!198 lt!109789 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20172 () Bool)

(assert (=> bm!20172 (= call!20175 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58033 () Bool)

(assert (=> d!58033 e!138495))

(declare-fun res!104138 () Bool)

(assert (=> d!58033 (=> (not res!104138) (not e!138495))))

(assert (=> d!58033 (= res!104138 (or (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))))

(declare-fun lt!109790 () ListLongMap!3085)

(assert (=> d!58033 (= lt!109789 lt!109790)))

(declare-fun lt!109795 () Unit!6414)

(assert (=> d!58033 (= lt!109795 e!138496)))

(declare-fun c!35881 () Bool)

(declare-fun e!138493 () Bool)

(assert (=> d!58033 (= c!35881 e!138493)))

(declare-fun res!104141 () Bool)

(assert (=> d!58033 (=> (not res!104141) (not e!138493))))

(assert (=> d!58033 (= res!104141 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58033 (= lt!109790 e!138492)))

(assert (=> d!58033 (= c!35878 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58033 (validMask!0 mask!1149)))

(assert (=> d!58033 (= (getCurrentListMap!1068 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109789)))

(declare-fun b!212929 () Bool)

(assert (=> b!212929 (= e!138493 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58033 c!35878) b!212935))

(assert (= (and d!58033 (not c!35878)) b!212930))

(assert (= (and b!212930 c!35882) b!212932))

(assert (= (and b!212930 (not c!35882)) b!212921))

(assert (= (and b!212921 c!35880) b!212933))

(assert (= (and b!212921 (not c!35880)) b!212934))

(assert (= (or b!212933 b!212934) bm!20168))

(assert (= (or b!212932 bm!20168) bm!20169))

(assert (= (or b!212932 b!212933) bm!20171))

(assert (= (or b!212935 bm!20169) bm!20172))

(assert (= (or b!212935 bm!20171) bm!20166))

(assert (= (and d!58033 res!104141) b!212929))

(assert (= (and d!58033 c!35881) b!212919))

(assert (= (and d!58033 (not c!35881)) b!212931))

(assert (= (and d!58033 res!104138) b!212936))

(assert (= (and b!212936 res!104140) b!212924))

(assert (= (and b!212936 (not res!104134)) b!212920))

(assert (= (and b!212920 res!104135) b!212928))

(assert (= (and b!212936 res!104142) b!212923))

(assert (= (and b!212923 c!35879) b!212937))

(assert (= (and b!212923 (not c!35879)) b!212927))

(assert (= (and b!212937 res!104139) b!212939))

(assert (= (or b!212937 b!212927) bm!20170))

(assert (= (and b!212923 res!104136) b!212925))

(assert (= (and b!212925 c!35883) b!212926))

(assert (= (and b!212925 (not c!35883)) b!212922))

(assert (= (and b!212926 res!104137) b!212938))

(assert (= (or b!212926 b!212922) bm!20167))

(declare-fun b_lambda!7741 () Bool)

(assert (=> (not b_lambda!7741) (not b!212928)))

(assert (=> b!212928 t!8032))

(declare-fun b_and!12455 () Bool)

(assert (= b_and!12453 (and (=> t!8032 result!5007) b_and!12455)))

(assert (=> b!212920 m!240199))

(assert (=> b!212920 m!240199))

(declare-fun m!240237 () Bool)

(assert (=> b!212920 m!240237))

(assert (=> bm!20172 m!240113))

(assert (=> b!212929 m!240199))

(assert (=> b!212929 m!240199))

(assert (=> b!212929 m!240201))

(declare-fun m!240239 () Bool)

(assert (=> b!212919 m!240239))

(declare-fun m!240241 () Bool)

(assert (=> b!212919 m!240241))

(declare-fun m!240243 () Bool)

(assert (=> b!212919 m!240243))

(declare-fun m!240245 () Bool)

(assert (=> b!212919 m!240245))

(assert (=> b!212919 m!240241))

(declare-fun m!240247 () Bool)

(assert (=> b!212919 m!240247))

(assert (=> b!212919 m!240199))

(assert (=> b!212919 m!240239))

(declare-fun m!240249 () Bool)

(assert (=> b!212919 m!240249))

(declare-fun m!240251 () Bool)

(assert (=> b!212919 m!240251))

(declare-fun m!240253 () Bool)

(assert (=> b!212919 m!240253))

(declare-fun m!240255 () Bool)

(assert (=> b!212919 m!240255))

(declare-fun m!240257 () Bool)

(assert (=> b!212919 m!240257))

(declare-fun m!240259 () Bool)

(assert (=> b!212919 m!240259))

(declare-fun m!240261 () Bool)

(assert (=> b!212919 m!240261))

(assert (=> b!212919 m!240253))

(assert (=> b!212919 m!240113))

(declare-fun m!240263 () Bool)

(assert (=> b!212919 m!240263))

(declare-fun m!240265 () Bool)

(assert (=> b!212919 m!240265))

(assert (=> b!212919 m!240263))

(declare-fun m!240267 () Bool)

(assert (=> b!212919 m!240267))

(declare-fun m!240269 () Bool)

(assert (=> b!212935 m!240269))

(declare-fun m!240271 () Bool)

(assert (=> bm!20167 m!240271))

(declare-fun m!240273 () Bool)

(assert (=> b!212938 m!240273))

(declare-fun m!240275 () Bool)

(assert (=> bm!20170 m!240275))

(declare-fun m!240277 () Bool)

(assert (=> bm!20166 m!240277))

(assert (=> b!212928 m!240199))

(declare-fun m!240279 () Bool)

(assert (=> b!212928 m!240279))

(declare-fun m!240281 () Bool)

(assert (=> b!212928 m!240281))

(assert (=> b!212928 m!240281))

(assert (=> b!212928 m!240213))

(declare-fun m!240283 () Bool)

(assert (=> b!212928 m!240283))

(assert (=> b!212928 m!240199))

(assert (=> b!212928 m!240213))

(declare-fun m!240285 () Bool)

(assert (=> b!212939 m!240285))

(assert (=> d!58033 m!240091))

(assert (=> b!212924 m!240199))

(assert (=> b!212924 m!240199))

(assert (=> b!212924 m!240201))

(assert (=> b!212748 d!58033))

(declare-fun b!212940 () Bool)

(declare-fun e!138509 () ListLongMap!3085)

(declare-fun e!138508 () ListLongMap!3085)

(assert (=> b!212940 (= e!138509 e!138508)))

(declare-fun c!35885 () Bool)

(assert (=> b!212940 (= c!35885 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212941 () Bool)

(declare-fun res!104146 () Bool)

(declare-fun e!138506 () Bool)

(assert (=> b!212941 (=> (not res!104146) (not e!138506))))

(declare-fun lt!109809 () ListLongMap!3085)

(assert (=> b!212941 (= res!104146 (not (contains!1394 lt!109809 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212942 () Bool)

(declare-fun e!138507 () Bool)

(assert (=> b!212942 (= e!138507 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212942 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212943 () Bool)

(declare-fun e!138510 () Bool)

(declare-fun e!138504 () Bool)

(assert (=> b!212943 (= e!138510 e!138504)))

(assert (=> b!212943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun res!104145 () Bool)

(assert (=> b!212943 (= res!104145 (contains!1394 lt!109809 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212943 (=> (not res!104145) (not e!138504))))

(declare-fun b!212944 () Bool)

(declare-fun e!138505 () Bool)

(assert (=> b!212944 (= e!138505 (= lt!109809 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58035 () Bool)

(assert (=> d!58035 e!138506))

(declare-fun res!104144 () Bool)

(assert (=> d!58035 (=> (not res!104144) (not e!138506))))

(assert (=> d!58035 (= res!104144 (not (contains!1394 lt!109809 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58035 (= lt!109809 e!138509)))

(declare-fun c!35887 () Bool)

(assert (=> d!58035 (= c!35887 (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58035 (validMask!0 mask!1149)))

(assert (=> d!58035 (= (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109809)))

(declare-fun call!20176 () ListLongMap!3085)

(declare-fun bm!20173 () Bool)

(assert (=> bm!20173 (= call!20176 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109658 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212945 () Bool)

(assert (=> b!212945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> b!212945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 lt!109658)))))

(assert (=> b!212945 (= e!138504 (= (apply!198 lt!109809 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)) (get!2574 (select (arr!4816 lt!109658) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212946 () Bool)

(assert (=> b!212946 (= e!138506 e!138510)))

(declare-fun c!35884 () Bool)

(assert (=> b!212946 (= c!35884 e!138507)))

(declare-fun res!104143 () Bool)

(assert (=> b!212946 (=> (not res!104143) (not e!138507))))

(assert (=> b!212946 (= res!104143 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212947 () Bool)

(assert (=> b!212947 (= e!138509 (ListLongMap!3086 Nil!3087))))

(declare-fun b!212948 () Bool)

(assert (=> b!212948 (= e!138505 (isEmpty!503 lt!109809))))

(declare-fun b!212949 () Bool)

(assert (=> b!212949 (= e!138510 e!138505)))

(declare-fun c!35886 () Bool)

(assert (=> b!212949 (= c!35886 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212950 () Bool)

(assert (=> b!212950 (= e!138508 call!20176)))

(declare-fun b!212951 () Bool)

(declare-fun lt!109805 () Unit!6414)

(declare-fun lt!109810 () Unit!6414)

(assert (=> b!212951 (= lt!109805 lt!109810)))

(declare-fun lt!109811 () (_ BitVec 64))

(declare-fun lt!109806 () (_ BitVec 64))

(declare-fun lt!109807 () ListLongMap!3085)

(declare-fun lt!109808 () V!6953)

(assert (=> b!212951 (not (contains!1394 (+!582 lt!109807 (tuple2!4183 lt!109811 lt!109808)) lt!109806))))

(assert (=> b!212951 (= lt!109810 (addStillNotContains!108 lt!109807 lt!109811 lt!109808 lt!109806))))

(assert (=> b!212951 (= lt!109806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212951 (= lt!109808 (get!2574 (select (arr!4816 lt!109658) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212951 (= lt!109811 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212951 (= lt!109807 call!20176)))

(assert (=> b!212951 (= e!138508 (+!582 call!20176 (tuple2!4183 (select (arr!4817 _keys!825) #b00000000000000000000000000000000) (get!2574 (select (arr!4816 lt!109658) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!58035 c!35887) b!212947))

(assert (= (and d!58035 (not c!35887)) b!212940))

(assert (= (and b!212940 c!35885) b!212951))

(assert (= (and b!212940 (not c!35885)) b!212950))

(assert (= (or b!212951 b!212950) bm!20173))

(assert (= (and d!58035 res!104144) b!212941))

(assert (= (and b!212941 res!104146) b!212946))

(assert (= (and b!212946 res!104143) b!212942))

(assert (= (and b!212946 c!35884) b!212943))

(assert (= (and b!212946 (not c!35884)) b!212949))

(assert (= (and b!212943 res!104145) b!212945))

(assert (= (and b!212949 c!35886) b!212944))

(assert (= (and b!212949 (not c!35886)) b!212948))

(declare-fun b_lambda!7743 () Bool)

(assert (=> (not b_lambda!7743) (not b!212945)))

(assert (=> b!212945 t!8032))

(declare-fun b_and!12457 () Bool)

(assert (= b_and!12455 (and (=> t!8032 result!5007) b_and!12457)))

(declare-fun b_lambda!7745 () Bool)

(assert (=> (not b_lambda!7745) (not b!212951)))

(assert (=> b!212951 t!8032))

(declare-fun b_and!12459 () Bool)

(assert (= b_and!12457 (and (=> t!8032 result!5007) b_and!12459)))

(assert (=> b!212940 m!240199))

(assert (=> b!212940 m!240199))

(assert (=> b!212940 m!240201))

(assert (=> b!212945 m!240281))

(assert (=> b!212945 m!240213))

(assert (=> b!212945 m!240283))

(assert (=> b!212945 m!240281))

(assert (=> b!212945 m!240199))

(assert (=> b!212945 m!240199))

(declare-fun m!240287 () Bool)

(assert (=> b!212945 m!240287))

(assert (=> b!212945 m!240213))

(declare-fun m!240289 () Bool)

(assert (=> b!212944 m!240289))

(assert (=> b!212943 m!240199))

(assert (=> b!212943 m!240199))

(declare-fun m!240291 () Bool)

(assert (=> b!212943 m!240291))

(declare-fun m!240293 () Bool)

(assert (=> d!58035 m!240293))

(assert (=> d!58035 m!240091))

(declare-fun m!240295 () Bool)

(assert (=> b!212948 m!240295))

(declare-fun m!240297 () Bool)

(assert (=> b!212951 m!240297))

(assert (=> b!212951 m!240281))

(assert (=> b!212951 m!240213))

(assert (=> b!212951 m!240283))

(assert (=> b!212951 m!240281))

(assert (=> b!212951 m!240199))

(assert (=> b!212951 m!240213))

(declare-fun m!240299 () Bool)

(assert (=> b!212951 m!240299))

(assert (=> b!212951 m!240297))

(declare-fun m!240301 () Bool)

(assert (=> b!212951 m!240301))

(declare-fun m!240303 () Bool)

(assert (=> b!212951 m!240303))

(assert (=> b!212942 m!240199))

(assert (=> b!212942 m!240199))

(assert (=> b!212942 m!240201))

(assert (=> bm!20173 m!240289))

(declare-fun m!240305 () Bool)

(assert (=> b!212941 m!240305))

(assert (=> b!212748 d!58035))

(declare-fun d!58037 () Bool)

(declare-fun e!138515 () Bool)

(assert (=> d!58037 e!138515))

(declare-fun res!104149 () Bool)

(assert (=> d!58037 (=> (not res!104149) (not e!138515))))

(assert (=> d!58037 (= res!104149 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5142 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5142 _values!649))))))))

(declare-fun lt!109814 () Unit!6414)

(declare-fun choose!1089 (array!10153 array!10151 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) (_ BitVec 64) V!6953 (_ BitVec 32) Int) Unit!6414)

(assert (=> d!58037 (= lt!109814 (choose!1089 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58037 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58037 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109814)))

(declare-fun bm!20178 () Bool)

(declare-fun call!20182 () ListLongMap!3085)

(assert (=> bm!20178 (= call!20182 (getCurrentListMapNoExtraKeys!505 _keys!825 (array!10152 (store (arr!4816 _values!649) i!601 (ValueCellFull!2396 v!520)) (size!5142 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20179 () Bool)

(declare-fun call!20181 () ListLongMap!3085)

(assert (=> bm!20179 (= call!20181 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun e!138516 () Bool)

(declare-fun b!212958 () Bool)

(assert (=> b!212958 (= e!138516 (= call!20182 (+!582 call!20181 (tuple2!4183 k0!843 v!520))))))

(declare-fun b!212959 () Bool)

(assert (=> b!212959 (= e!138516 (= call!20182 call!20181))))

(declare-fun b!212960 () Bool)

(assert (=> b!212960 (= e!138515 e!138516)))

(declare-fun c!35890 () Bool)

(assert (=> b!212960 (= c!35890 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58037 res!104149) b!212960))

(assert (= (and b!212960 c!35890) b!212958))

(assert (= (and b!212960 (not c!35890)) b!212959))

(assert (= (or b!212958 b!212959) bm!20178))

(assert (= (or b!212958 b!212959) bm!20179))

(declare-fun m!240307 () Bool)

(assert (=> d!58037 m!240307))

(assert (=> bm!20178 m!240111))

(declare-fun m!240309 () Bool)

(assert (=> bm!20178 m!240309))

(assert (=> bm!20179 m!240121))

(declare-fun m!240311 () Bool)

(assert (=> b!212958 m!240311))

(assert (=> b!212748 d!58037))

(declare-fun d!58039 () Bool)

(declare-fun e!138519 () Bool)

(assert (=> d!58039 e!138519))

(declare-fun res!104154 () Bool)

(assert (=> d!58039 (=> (not res!104154) (not e!138519))))

(declare-fun lt!109825 () ListLongMap!3085)

(assert (=> d!58039 (= res!104154 (contains!1394 lt!109825 (_1!2102 (tuple2!4183 k0!843 v!520))))))

(declare-fun lt!109824 () List!3090)

(assert (=> d!58039 (= lt!109825 (ListLongMap!3086 lt!109824))))

(declare-fun lt!109823 () Unit!6414)

(declare-fun lt!109826 () Unit!6414)

(assert (=> d!58039 (= lt!109823 lt!109826)))

(declare-datatypes ((Option!260 0))(
  ( (Some!259 (v!4790 V!6953)) (None!258) )
))
(declare-fun getValueByKey!254 (List!3090 (_ BitVec 64)) Option!260)

(assert (=> d!58039 (= (getValueByKey!254 lt!109824 (_1!2102 (tuple2!4183 k0!843 v!520))) (Some!259 (_2!2102 (tuple2!4183 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!144 (List!3090 (_ BitVec 64) V!6953) Unit!6414)

(assert (=> d!58039 (= lt!109826 (lemmaContainsTupThenGetReturnValue!144 lt!109824 (_1!2102 (tuple2!4183 k0!843 v!520)) (_2!2102 (tuple2!4183 k0!843 v!520))))))

(declare-fun insertStrictlySorted!147 (List!3090 (_ BitVec 64) V!6953) List!3090)

(assert (=> d!58039 (= lt!109824 (insertStrictlySorted!147 (toList!1558 lt!109656) (_1!2102 (tuple2!4183 k0!843 v!520)) (_2!2102 (tuple2!4183 k0!843 v!520))))))

(assert (=> d!58039 (= (+!582 lt!109656 (tuple2!4183 k0!843 v!520)) lt!109825)))

(declare-fun b!212965 () Bool)

(declare-fun res!104155 () Bool)

(assert (=> b!212965 (=> (not res!104155) (not e!138519))))

(assert (=> b!212965 (= res!104155 (= (getValueByKey!254 (toList!1558 lt!109825) (_1!2102 (tuple2!4183 k0!843 v!520))) (Some!259 (_2!2102 (tuple2!4183 k0!843 v!520)))))))

(declare-fun b!212966 () Bool)

(declare-fun contains!1395 (List!3090 tuple2!4182) Bool)

(assert (=> b!212966 (= e!138519 (contains!1395 (toList!1558 lt!109825) (tuple2!4183 k0!843 v!520)))))

(assert (= (and d!58039 res!104154) b!212965))

(assert (= (and b!212965 res!104155) b!212966))

(declare-fun m!240313 () Bool)

(assert (=> d!58039 m!240313))

(declare-fun m!240315 () Bool)

(assert (=> d!58039 m!240315))

(declare-fun m!240317 () Bool)

(assert (=> d!58039 m!240317))

(declare-fun m!240319 () Bool)

(assert (=> d!58039 m!240319))

(declare-fun m!240321 () Bool)

(assert (=> b!212965 m!240321))

(declare-fun m!240323 () Bool)

(assert (=> b!212966 m!240323))

(assert (=> b!212748 d!58039))

(declare-fun b!212967 () Bool)

(declare-fun e!138525 () Unit!6414)

(declare-fun lt!109827 () Unit!6414)

(assert (=> b!212967 (= e!138525 lt!109827)))

(declare-fun lt!109846 () ListLongMap!3085)

(assert (=> b!212967 (= lt!109846 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109842 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109838 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109838 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109829 () Unit!6414)

(assert (=> b!212967 (= lt!109829 (addStillContains!174 lt!109846 lt!109842 zeroValue!615 lt!109838))))

(assert (=> b!212967 (contains!1394 (+!582 lt!109846 (tuple2!4183 lt!109842 zeroValue!615)) lt!109838)))

(declare-fun lt!109847 () Unit!6414)

(assert (=> b!212967 (= lt!109847 lt!109829)))

(declare-fun lt!109844 () ListLongMap!3085)

(assert (=> b!212967 (= lt!109844 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109845 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109845 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109841 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109841 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109840 () Unit!6414)

(assert (=> b!212967 (= lt!109840 (addApplyDifferent!174 lt!109844 lt!109845 minValue!615 lt!109841))))

(assert (=> b!212967 (= (apply!198 (+!582 lt!109844 (tuple2!4183 lt!109845 minValue!615)) lt!109841) (apply!198 lt!109844 lt!109841))))

(declare-fun lt!109836 () Unit!6414)

(assert (=> b!212967 (= lt!109836 lt!109840)))

(declare-fun lt!109837 () ListLongMap!3085)

(assert (=> b!212967 (= lt!109837 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109843 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109848 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109848 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109830 () Unit!6414)

(assert (=> b!212967 (= lt!109830 (addApplyDifferent!174 lt!109837 lt!109843 zeroValue!615 lt!109848))))

(assert (=> b!212967 (= (apply!198 (+!582 lt!109837 (tuple2!4183 lt!109843 zeroValue!615)) lt!109848) (apply!198 lt!109837 lt!109848))))

(declare-fun lt!109832 () Unit!6414)

(assert (=> b!212967 (= lt!109832 lt!109830)))

(declare-fun lt!109828 () ListLongMap!3085)

(assert (=> b!212967 (= lt!109828 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109835 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109831 () (_ BitVec 64))

(assert (=> b!212967 (= lt!109831 (select (arr!4817 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212967 (= lt!109827 (addApplyDifferent!174 lt!109828 lt!109835 minValue!615 lt!109831))))

(assert (=> b!212967 (= (apply!198 (+!582 lt!109828 (tuple2!4183 lt!109835 minValue!615)) lt!109831) (apply!198 lt!109828 lt!109831))))

(declare-fun b!212968 () Bool)

(declare-fun e!138530 () Bool)

(declare-fun e!138523 () Bool)

(assert (=> b!212968 (= e!138530 e!138523)))

(declare-fun res!104157 () Bool)

(assert (=> b!212968 (=> (not res!104157) (not e!138523))))

(declare-fun lt!109833 () ListLongMap!3085)

(assert (=> b!212968 (= res!104157 (contains!1394 lt!109833 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun c!35891 () Bool)

(declare-fun bm!20180 () Bool)

(declare-fun call!20184 () ListLongMap!3085)

(declare-fun call!20185 () ListLongMap!3085)

(declare-fun call!20183 () ListLongMap!3085)

(declare-fun c!35895 () Bool)

(declare-fun call!20189 () ListLongMap!3085)

(assert (=> bm!20180 (= call!20185 (+!582 (ite c!35891 call!20189 (ite c!35895 call!20184 call!20183)) (ite (or c!35891 c!35895) (tuple2!4183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20181 () Bool)

(declare-fun call!20186 () Bool)

(assert (=> bm!20181 (= call!20186 (contains!1394 lt!109833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20182 () Bool)

(assert (=> bm!20182 (= call!20183 call!20184)))

(declare-fun b!212969 () Bool)

(declare-fun c!35893 () Bool)

(assert (=> b!212969 (= c!35893 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!138526 () ListLongMap!3085)

(declare-fun e!138528 () ListLongMap!3085)

(assert (=> b!212969 (= e!138526 e!138528)))

(declare-fun b!212970 () Bool)

(declare-fun e!138520 () Bool)

(assert (=> b!212970 (= e!138520 (not call!20186))))

(declare-fun b!212971 () Bool)

(declare-fun res!104158 () Bool)

(declare-fun e!138524 () Bool)

(assert (=> b!212971 (=> (not res!104158) (not e!138524))))

(declare-fun e!138527 () Bool)

(assert (=> b!212971 (= res!104158 e!138527)))

(declare-fun c!35892 () Bool)

(assert (=> b!212971 (= c!35892 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212972 () Bool)

(declare-fun e!138531 () Bool)

(assert (=> b!212972 (= e!138531 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212973 () Bool)

(assert (=> b!212973 (= e!138524 e!138520)))

(declare-fun c!35896 () Bool)

(assert (=> b!212973 (= c!35896 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212974 () Bool)

(declare-fun e!138529 () Bool)

(assert (=> b!212974 (= e!138520 e!138529)))

(declare-fun res!104159 () Bool)

(assert (=> b!212974 (= res!104159 call!20186)))

(assert (=> b!212974 (=> (not res!104159) (not e!138529))))

(declare-fun b!212975 () Bool)

(declare-fun call!20187 () Bool)

(assert (=> b!212975 (= e!138527 (not call!20187))))

(declare-fun b!212976 () Bool)

(assert (=> b!212976 (= e!138523 (= (apply!198 lt!109833 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)) (get!2574 (select (arr!4816 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5142 _values!649)))))

(assert (=> b!212976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212978 () Bool)

(declare-fun e!138521 () ListLongMap!3085)

(assert (=> b!212978 (= e!138521 e!138526)))

(assert (=> b!212978 (= c!35895 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212979 () Bool)

(declare-fun Unit!6417 () Unit!6414)

(assert (=> b!212979 (= e!138525 Unit!6417)))

(declare-fun b!212980 () Bool)

(declare-fun call!20188 () ListLongMap!3085)

(assert (=> b!212980 (= e!138526 call!20188)))

(declare-fun b!212981 () Bool)

(assert (=> b!212981 (= e!138528 call!20188)))

(declare-fun b!212982 () Bool)

(assert (=> b!212982 (= e!138528 call!20183)))

(declare-fun b!212983 () Bool)

(assert (=> b!212983 (= e!138521 (+!582 call!20185 (tuple2!4183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20183 () Bool)

(assert (=> bm!20183 (= call!20184 call!20189)))

(declare-fun b!212984 () Bool)

(declare-fun res!104164 () Bool)

(assert (=> b!212984 (=> (not res!104164) (not e!138524))))

(assert (=> b!212984 (= res!104164 e!138530)))

(declare-fun res!104156 () Bool)

(assert (=> b!212984 (=> res!104156 e!138530)))

(assert (=> b!212984 (= res!104156 (not e!138531))))

(declare-fun res!104162 () Bool)

(assert (=> b!212984 (=> (not res!104162) (not e!138531))))

(assert (=> b!212984 (= res!104162 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(declare-fun b!212985 () Bool)

(declare-fun e!138532 () Bool)

(assert (=> b!212985 (= e!138527 e!138532)))

(declare-fun res!104161 () Bool)

(assert (=> b!212985 (= res!104161 call!20187)))

(assert (=> b!212985 (=> (not res!104161) (not e!138532))))

(declare-fun b!212986 () Bool)

(assert (=> b!212986 (= e!138529 (= (apply!198 lt!109833 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20184 () Bool)

(assert (=> bm!20184 (= call!20187 (contains!1394 lt!109833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20185 () Bool)

(assert (=> bm!20185 (= call!20188 call!20185)))

(declare-fun b!212987 () Bool)

(assert (=> b!212987 (= e!138532 (= (apply!198 lt!109833 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20186 () Bool)

(assert (=> bm!20186 (= call!20189 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58041 () Bool)

(assert (=> d!58041 e!138524))

(declare-fun res!104160 () Bool)

(assert (=> d!58041 (=> (not res!104160) (not e!138524))))

(assert (=> d!58041 (= res!104160 (or (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))))

(declare-fun lt!109834 () ListLongMap!3085)

(assert (=> d!58041 (= lt!109833 lt!109834)))

(declare-fun lt!109839 () Unit!6414)

(assert (=> d!58041 (= lt!109839 e!138525)))

(declare-fun c!35894 () Bool)

(declare-fun e!138522 () Bool)

(assert (=> d!58041 (= c!35894 e!138522)))

(declare-fun res!104163 () Bool)

(assert (=> d!58041 (=> (not res!104163) (not e!138522))))

(assert (=> d!58041 (= res!104163 (bvslt #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58041 (= lt!109834 e!138521)))

(assert (=> d!58041 (= c!35891 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58041 (validMask!0 mask!1149)))

(assert (=> d!58041 (= (getCurrentListMap!1068 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109833)))

(declare-fun b!212977 () Bool)

(assert (=> b!212977 (= e!138522 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58041 c!35891) b!212983))

(assert (= (and d!58041 (not c!35891)) b!212978))

(assert (= (and b!212978 c!35895) b!212980))

(assert (= (and b!212978 (not c!35895)) b!212969))

(assert (= (and b!212969 c!35893) b!212981))

(assert (= (and b!212969 (not c!35893)) b!212982))

(assert (= (or b!212981 b!212982) bm!20182))

(assert (= (or b!212980 bm!20182) bm!20183))

(assert (= (or b!212980 b!212981) bm!20185))

(assert (= (or b!212983 bm!20183) bm!20186))

(assert (= (or b!212983 bm!20185) bm!20180))

(assert (= (and d!58041 res!104163) b!212977))

(assert (= (and d!58041 c!35894) b!212967))

(assert (= (and d!58041 (not c!35894)) b!212979))

(assert (= (and d!58041 res!104160) b!212984))

(assert (= (and b!212984 res!104162) b!212972))

(assert (= (and b!212984 (not res!104156)) b!212968))

(assert (= (and b!212968 res!104157) b!212976))

(assert (= (and b!212984 res!104164) b!212971))

(assert (= (and b!212971 c!35892) b!212985))

(assert (= (and b!212971 (not c!35892)) b!212975))

(assert (= (and b!212985 res!104161) b!212987))

(assert (= (or b!212985 b!212975) bm!20184))

(assert (= (and b!212971 res!104158) b!212973))

(assert (= (and b!212973 c!35896) b!212974))

(assert (= (and b!212973 (not c!35896)) b!212970))

(assert (= (and b!212974 res!104159) b!212986))

(assert (= (or b!212974 b!212970) bm!20181))

(declare-fun b_lambda!7747 () Bool)

(assert (=> (not b_lambda!7747) (not b!212976)))

(assert (=> b!212976 t!8032))

(declare-fun b_and!12461 () Bool)

(assert (= b_and!12459 (and (=> t!8032 result!5007) b_and!12461)))

(assert (=> b!212968 m!240199))

(assert (=> b!212968 m!240199))

(declare-fun m!240325 () Bool)

(assert (=> b!212968 m!240325))

(assert (=> bm!20186 m!240121))

(assert (=> b!212977 m!240199))

(assert (=> b!212977 m!240199))

(assert (=> b!212977 m!240201))

(declare-fun m!240327 () Bool)

(assert (=> b!212967 m!240327))

(declare-fun m!240329 () Bool)

(assert (=> b!212967 m!240329))

(declare-fun m!240331 () Bool)

(assert (=> b!212967 m!240331))

(declare-fun m!240333 () Bool)

(assert (=> b!212967 m!240333))

(assert (=> b!212967 m!240329))

(declare-fun m!240335 () Bool)

(assert (=> b!212967 m!240335))

(assert (=> b!212967 m!240199))

(assert (=> b!212967 m!240327))

(declare-fun m!240337 () Bool)

(assert (=> b!212967 m!240337))

(declare-fun m!240339 () Bool)

(assert (=> b!212967 m!240339))

(declare-fun m!240341 () Bool)

(assert (=> b!212967 m!240341))

(declare-fun m!240343 () Bool)

(assert (=> b!212967 m!240343))

(declare-fun m!240345 () Bool)

(assert (=> b!212967 m!240345))

(declare-fun m!240347 () Bool)

(assert (=> b!212967 m!240347))

(declare-fun m!240349 () Bool)

(assert (=> b!212967 m!240349))

(assert (=> b!212967 m!240341))

(assert (=> b!212967 m!240121))

(declare-fun m!240351 () Bool)

(assert (=> b!212967 m!240351))

(declare-fun m!240353 () Bool)

(assert (=> b!212967 m!240353))

(assert (=> b!212967 m!240351))

(declare-fun m!240355 () Bool)

(assert (=> b!212967 m!240355))

(declare-fun m!240357 () Bool)

(assert (=> b!212983 m!240357))

(declare-fun m!240359 () Bool)

(assert (=> bm!20181 m!240359))

(declare-fun m!240361 () Bool)

(assert (=> b!212986 m!240361))

(declare-fun m!240363 () Bool)

(assert (=> bm!20184 m!240363))

(declare-fun m!240365 () Bool)

(assert (=> bm!20180 m!240365))

(assert (=> b!212976 m!240199))

(declare-fun m!240367 () Bool)

(assert (=> b!212976 m!240367))

(assert (=> b!212976 m!240211))

(assert (=> b!212976 m!240211))

(assert (=> b!212976 m!240213))

(assert (=> b!212976 m!240215))

(assert (=> b!212976 m!240199))

(assert (=> b!212976 m!240213))

(declare-fun m!240369 () Bool)

(assert (=> b!212987 m!240369))

(assert (=> d!58041 m!240091))

(assert (=> b!212972 m!240199))

(assert (=> b!212972 m!240199))

(assert (=> b!212972 m!240201))

(assert (=> b!212748 d!58041))

(declare-fun d!58043 () Bool)

(declare-fun e!138533 () Bool)

(assert (=> d!58043 e!138533))

(declare-fun res!104165 () Bool)

(assert (=> d!58043 (=> (not res!104165) (not e!138533))))

(declare-fun lt!109851 () ListLongMap!3085)

(assert (=> d!58043 (= res!104165 (contains!1394 lt!109851 (_1!2102 lt!109654)))))

(declare-fun lt!109850 () List!3090)

(assert (=> d!58043 (= lt!109851 (ListLongMap!3086 lt!109850))))

(declare-fun lt!109849 () Unit!6414)

(declare-fun lt!109852 () Unit!6414)

(assert (=> d!58043 (= lt!109849 lt!109852)))

(assert (=> d!58043 (= (getValueByKey!254 lt!109850 (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654)))))

(assert (=> d!58043 (= lt!109852 (lemmaContainsTupThenGetReturnValue!144 lt!109850 (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58043 (= lt!109850 (insertStrictlySorted!147 (toList!1558 lt!109656) (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58043 (= (+!582 lt!109656 lt!109654) lt!109851)))

(declare-fun b!212988 () Bool)

(declare-fun res!104166 () Bool)

(assert (=> b!212988 (=> (not res!104166) (not e!138533))))

(assert (=> b!212988 (= res!104166 (= (getValueByKey!254 (toList!1558 lt!109851) (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654))))))

(declare-fun b!212989 () Bool)

(assert (=> b!212989 (= e!138533 (contains!1395 (toList!1558 lt!109851) lt!109654))))

(assert (= (and d!58043 res!104165) b!212988))

(assert (= (and b!212988 res!104166) b!212989))

(declare-fun m!240371 () Bool)

(assert (=> d!58043 m!240371))

(declare-fun m!240373 () Bool)

(assert (=> d!58043 m!240373))

(declare-fun m!240375 () Bool)

(assert (=> d!58043 m!240375))

(declare-fun m!240377 () Bool)

(assert (=> d!58043 m!240377))

(declare-fun m!240379 () Bool)

(assert (=> b!212988 m!240379))

(declare-fun m!240381 () Bool)

(assert (=> b!212989 m!240381))

(assert (=> b!212743 d!58043))

(declare-fun d!58045 () Bool)

(declare-fun e!138534 () Bool)

(assert (=> d!58045 e!138534))

(declare-fun res!104167 () Bool)

(assert (=> d!58045 (=> (not res!104167) (not e!138534))))

(declare-fun lt!109855 () ListLongMap!3085)

(assert (=> d!58045 (= res!104167 (contains!1394 lt!109855 (_1!2102 lt!109654)))))

(declare-fun lt!109854 () List!3090)

(assert (=> d!58045 (= lt!109855 (ListLongMap!3086 lt!109854))))

(declare-fun lt!109853 () Unit!6414)

(declare-fun lt!109856 () Unit!6414)

(assert (=> d!58045 (= lt!109853 lt!109856)))

(assert (=> d!58045 (= (getValueByKey!254 lt!109854 (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654)))))

(assert (=> d!58045 (= lt!109856 (lemmaContainsTupThenGetReturnValue!144 lt!109854 (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58045 (= lt!109854 (insertStrictlySorted!147 (toList!1558 lt!109653) (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58045 (= (+!582 lt!109653 lt!109654) lt!109855)))

(declare-fun b!212990 () Bool)

(declare-fun res!104168 () Bool)

(assert (=> b!212990 (=> (not res!104168) (not e!138534))))

(assert (=> b!212990 (= res!104168 (= (getValueByKey!254 (toList!1558 lt!109855) (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654))))))

(declare-fun b!212991 () Bool)

(assert (=> b!212991 (= e!138534 (contains!1395 (toList!1558 lt!109855) lt!109654))))

(assert (= (and d!58045 res!104167) b!212990))

(assert (= (and b!212990 res!104168) b!212991))

(declare-fun m!240383 () Bool)

(assert (=> d!58045 m!240383))

(declare-fun m!240385 () Bool)

(assert (=> d!58045 m!240385))

(declare-fun m!240387 () Bool)

(assert (=> d!58045 m!240387))

(declare-fun m!240389 () Bool)

(assert (=> d!58045 m!240389))

(declare-fun m!240391 () Bool)

(assert (=> b!212990 m!240391))

(declare-fun m!240393 () Bool)

(assert (=> b!212991 m!240393))

(assert (=> b!212745 d!58045))

(declare-fun b!213002 () Bool)

(declare-fun e!138544 () Bool)

(declare-fun contains!1396 (List!3089 (_ BitVec 64)) Bool)

(assert (=> b!213002 (= e!138544 (contains!1396 Nil!3086 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58047 () Bool)

(declare-fun res!104175 () Bool)

(declare-fun e!138545 () Bool)

(assert (=> d!58047 (=> res!104175 e!138545)))

(assert (=> d!58047 (= res!104175 (bvsge #b00000000000000000000000000000000 (size!5143 _keys!825)))))

(assert (=> d!58047 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3086) e!138545)))

(declare-fun bm!20189 () Bool)

(declare-fun call!20192 () Bool)

(declare-fun c!35899 () Bool)

(assert (=> bm!20189 (= call!20192 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35899 (Cons!3085 (select (arr!4817 _keys!825) #b00000000000000000000000000000000) Nil!3086) Nil!3086)))))

(declare-fun b!213003 () Bool)

(declare-fun e!138546 () Bool)

(assert (=> b!213003 (= e!138546 call!20192)))

(declare-fun b!213004 () Bool)

(declare-fun e!138543 () Bool)

(assert (=> b!213004 (= e!138545 e!138543)))

(declare-fun res!104176 () Bool)

(assert (=> b!213004 (=> (not res!104176) (not e!138543))))

(assert (=> b!213004 (= res!104176 (not e!138544))))

(declare-fun res!104177 () Bool)

(assert (=> b!213004 (=> (not res!104177) (not e!138544))))

(assert (=> b!213004 (= res!104177 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213005 () Bool)

(assert (=> b!213005 (= e!138543 e!138546)))

(assert (=> b!213005 (= c!35899 (validKeyInArray!0 (select (arr!4817 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213006 () Bool)

(assert (=> b!213006 (= e!138546 call!20192)))

(assert (= (and d!58047 (not res!104175)) b!213004))

(assert (= (and b!213004 res!104177) b!213002))

(assert (= (and b!213004 res!104176) b!213005))

(assert (= (and b!213005 c!35899) b!213006))

(assert (= (and b!213005 (not c!35899)) b!213003))

(assert (= (or b!213006 b!213003) bm!20189))

(assert (=> b!213002 m!240199))

(assert (=> b!213002 m!240199))

(declare-fun m!240395 () Bool)

(assert (=> b!213002 m!240395))

(assert (=> bm!20189 m!240199))

(declare-fun m!240397 () Bool)

(assert (=> bm!20189 m!240397))

(assert (=> b!213004 m!240199))

(assert (=> b!213004 m!240199))

(assert (=> b!213004 m!240201))

(assert (=> b!213005 m!240199))

(assert (=> b!213005 m!240199))

(assert (=> b!213005 m!240201))

(assert (=> b!212741 d!58047))

(declare-fun d!58049 () Bool)

(declare-fun e!138547 () Bool)

(assert (=> d!58049 e!138547))

(declare-fun res!104178 () Bool)

(assert (=> d!58049 (=> (not res!104178) (not e!138547))))

(declare-fun lt!109859 () ListLongMap!3085)

(assert (=> d!58049 (= res!104178 (contains!1394 lt!109859 (_1!2102 lt!109654)))))

(declare-fun lt!109858 () List!3090)

(assert (=> d!58049 (= lt!109859 (ListLongMap!3086 lt!109858))))

(declare-fun lt!109857 () Unit!6414)

(declare-fun lt!109860 () Unit!6414)

(assert (=> d!58049 (= lt!109857 lt!109860)))

(assert (=> d!58049 (= (getValueByKey!254 lt!109858 (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654)))))

(assert (=> d!58049 (= lt!109860 (lemmaContainsTupThenGetReturnValue!144 lt!109858 (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58049 (= lt!109858 (insertStrictlySorted!147 (toList!1558 lt!109659) (_1!2102 lt!109654) (_2!2102 lt!109654)))))

(assert (=> d!58049 (= (+!582 lt!109659 lt!109654) lt!109859)))

(declare-fun b!213007 () Bool)

(declare-fun res!104179 () Bool)

(assert (=> b!213007 (=> (not res!104179) (not e!138547))))

(assert (=> b!213007 (= res!104179 (= (getValueByKey!254 (toList!1558 lt!109859) (_1!2102 lt!109654)) (Some!259 (_2!2102 lt!109654))))))

(declare-fun b!213008 () Bool)

(assert (=> b!213008 (= e!138547 (contains!1395 (toList!1558 lt!109859) lt!109654))))

(assert (= (and d!58049 res!104178) b!213007))

(assert (= (and b!213007 res!104179) b!213008))

(declare-fun m!240399 () Bool)

(assert (=> d!58049 m!240399))

(declare-fun m!240401 () Bool)

(assert (=> d!58049 m!240401))

(declare-fun m!240403 () Bool)

(assert (=> d!58049 m!240403))

(declare-fun m!240405 () Bool)

(assert (=> d!58049 m!240405))

(declare-fun m!240407 () Bool)

(assert (=> b!213007 m!240407))

(declare-fun m!240409 () Bool)

(assert (=> b!213008 m!240409))

(assert (=> b!212736 d!58049))

(declare-fun b!213015 () Bool)

(declare-fun e!138552 () Bool)

(assert (=> b!213015 (= e!138552 tp_is_empty!5479)))

(declare-fun b!213016 () Bool)

(declare-fun e!138553 () Bool)

(assert (=> b!213016 (= e!138553 tp_is_empty!5479)))

(declare-fun mapIsEmpty!9323 () Bool)

(declare-fun mapRes!9323 () Bool)

(assert (=> mapIsEmpty!9323 mapRes!9323))

(declare-fun mapNonEmpty!9323 () Bool)

(declare-fun tp!19934 () Bool)

(assert (=> mapNonEmpty!9323 (= mapRes!9323 (and tp!19934 e!138552))))

(declare-fun mapValue!9323 () ValueCell!2396)

(declare-fun mapKey!9323 () (_ BitVec 32))

(declare-fun mapRest!9323 () (Array (_ BitVec 32) ValueCell!2396))

(assert (=> mapNonEmpty!9323 (= mapRest!9314 (store mapRest!9323 mapKey!9323 mapValue!9323))))

(declare-fun condMapEmpty!9323 () Bool)

(declare-fun mapDefault!9323 () ValueCell!2396)

(assert (=> mapNonEmpty!9314 (= condMapEmpty!9323 (= mapRest!9314 ((as const (Array (_ BitVec 32) ValueCell!2396)) mapDefault!9323)))))

(assert (=> mapNonEmpty!9314 (= tp!19919 (and e!138553 mapRes!9323))))

(assert (= (and mapNonEmpty!9314 condMapEmpty!9323) mapIsEmpty!9323))

(assert (= (and mapNonEmpty!9314 (not condMapEmpty!9323)) mapNonEmpty!9323))

(assert (= (and mapNonEmpty!9323 ((_ is ValueCellFull!2396) mapValue!9323)) b!213015))

(assert (= (and mapNonEmpty!9314 ((_ is ValueCellFull!2396) mapDefault!9323)) b!213016))

(declare-fun m!240411 () Bool)

(assert (=> mapNonEmpty!9323 m!240411))

(declare-fun b_lambda!7749 () Bool)

(assert (= b_lambda!7747 (or (and start!21150 b_free!5617) b_lambda!7749)))

(declare-fun b_lambda!7751 () Bool)

(assert (= b_lambda!7739 (or (and start!21150 b_free!5617) b_lambda!7751)))

(declare-fun b_lambda!7753 () Bool)

(assert (= b_lambda!7743 (or (and start!21150 b_free!5617) b_lambda!7753)))

(declare-fun b_lambda!7755 () Bool)

(assert (= b_lambda!7737 (or (and start!21150 b_free!5617) b_lambda!7755)))

(declare-fun b_lambda!7757 () Bool)

(assert (= b_lambda!7745 (or (and start!21150 b_free!5617) b_lambda!7757)))

(declare-fun b_lambda!7759 () Bool)

(assert (= b_lambda!7741 (or (and start!21150 b_free!5617) b_lambda!7759)))

(check-sat tp_is_empty!5479 (not b!212865) (not d!58035) (not b!212986) (not b!212866) (not b!212988) (not bm!20186) (not bm!20189) (not bm!20184) (not d!58033) (not b!212940) (not b_lambda!7751) (not b!212924) (not b!212868) (not b!212983) (not b!212958) (not b!212944) (not b!212967) (not b!212977) (not b!212919) (not b!212966) (not b!212991) (not bm!20148) (not b!212965) (not b!212835) (not d!58049) (not bm!20173) (not b!212920) (not d!58041) (not bm!20166) (not mapNonEmpty!9323) (not b_lambda!7749) (not bm!20167) (not b!213002) (not b!212943) (not b!212941) (not b!212939) (not b!212990) (not b!212929) (not bm!20179) (not b!212951) (not b!213004) (not d!58037) (not bm!20181) (not b!212871) (not b!212989) (not b_lambda!7757) (not b!212976) (not b!212935) (not b!212838) (not bm!20151) (not b_lambda!7755) (not b!212867) (not b!212948) (not d!58045) (not b!212987) (not b!212968) (not d!58031) (not b!213007) b_and!12461 (not b!212863) (not d!58039) (not b!212972) (not b!212942) (not b_lambda!7759) (not b!213005) (not bm!20180) (not b_next!5617) (not b!213008) (not bm!20170) (not b!212938) (not b_lambda!7753) (not b!212928) (not b!212945) (not bm!20172) (not bm!20178) (not b!212864) (not d!58043) (not b!212874))
(check-sat b_and!12461 (not b_next!5617))
