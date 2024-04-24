; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20930 () Bool)

(assert start!20930)

(declare-fun b_free!5539 () Bool)

(declare-fun b_next!5539 () Bool)

(assert (=> start!20930 (= b_free!5539 (not b_next!5539))))

(declare-fun tp!19664 () Bool)

(declare-fun b_and!12323 () Bool)

(assert (=> start!20930 (= tp!19664 b_and!12323)))

(declare-fun b!210219 () Bool)

(declare-fun e!136907 () Bool)

(declare-fun e!136905 () Bool)

(declare-fun mapRes!9176 () Bool)

(assert (=> b!210219 (= e!136907 (and e!136905 mapRes!9176))))

(declare-fun condMapEmpty!9176 () Bool)

(declare-datatypes ((V!6849 0))(
  ( (V!6850 (val!2745 Int)) )
))
(declare-datatypes ((ValueCell!2357 0))(
  ( (ValueCellFull!2357 (v!4724 V!6849)) (EmptyCell!2357) )
))
(declare-datatypes ((array!9997 0))(
  ( (array!9998 (arr!4747 (Array (_ BitVec 32) ValueCell!2357)) (size!5072 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9997)

(declare-fun mapDefault!9176 () ValueCell!2357)

(assert (=> b!210219 (= condMapEmpty!9176 (= (arr!4747 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2357)) mapDefault!9176)))))

(declare-fun res!102541 () Bool)

(declare-fun e!136906 () Bool)

(assert (=> start!20930 (=> (not res!102541) (not e!136906))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20930 (= res!102541 (validMask!0 mask!1149))))

(assert (=> start!20930 e!136906))

(declare-fun array_inv!3115 (array!9997) Bool)

(assert (=> start!20930 (and (array_inv!3115 _values!649) e!136907)))

(assert (=> start!20930 true))

(declare-fun tp_is_empty!5401 () Bool)

(assert (=> start!20930 tp_is_empty!5401))

(declare-datatypes ((array!9999 0))(
  ( (array!10000 (arr!4748 (Array (_ BitVec 32) (_ BitVec 64))) (size!5073 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9999)

(declare-fun array_inv!3116 (array!9999) Bool)

(assert (=> start!20930 (array_inv!3116 _keys!825)))

(assert (=> start!20930 tp!19664))

(declare-fun b!210220 () Bool)

(declare-fun res!102543 () Bool)

(assert (=> b!210220 (=> (not res!102543) (not e!136906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9999 (_ BitVec 32)) Bool)

(assert (=> b!210220 (= res!102543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210221 () Bool)

(declare-fun e!136902 () Bool)

(assert (=> b!210221 (= e!136906 (not e!136902))))

(declare-fun res!102545 () Bool)

(assert (=> b!210221 (=> res!102545 e!136902)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210221 (= res!102545 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4094 0))(
  ( (tuple2!4095 (_1!2058 (_ BitVec 64)) (_2!2058 V!6849)) )
))
(declare-datatypes ((List!2980 0))(
  ( (Nil!2977) (Cons!2976 (h!3618 tuple2!4094) (t!7907 List!2980)) )
))
(declare-datatypes ((ListLongMap!3009 0))(
  ( (ListLongMap!3010 (toList!1520 List!2980)) )
))
(declare-fun lt!107632 () ListLongMap!3009)

(declare-fun zeroValue!615 () V!6849)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6849)

(declare-fun getCurrentListMap!1060 (array!9999 array!9997 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) Int) ListLongMap!3009)

(assert (=> b!210221 (= lt!107632 (getCurrentListMap!1060 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107633 () array!9997)

(declare-fun lt!107635 () ListLongMap!3009)

(assert (=> b!210221 (= lt!107635 (getCurrentListMap!1060 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107638 () ListLongMap!3009)

(declare-fun lt!107636 () ListLongMap!3009)

(assert (=> b!210221 (and (= lt!107638 lt!107636) (= lt!107636 lt!107638))))

(declare-fun lt!107637 () ListLongMap!3009)

(declare-fun v!520 () V!6849)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!549 (ListLongMap!3009 tuple2!4094) ListLongMap!3009)

(assert (=> b!210221 (= lt!107636 (+!549 lt!107637 (tuple2!4095 k0!843 v!520)))))

(declare-datatypes ((Unit!6378 0))(
  ( (Unit!6379) )
))
(declare-fun lt!107639 () Unit!6378)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 (array!9999 array!9997 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) (_ BitVec 64) V!6849 (_ BitVec 32) Int) Unit!6378)

(assert (=> b!210221 (= lt!107639 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!483 (array!9999 array!9997 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) Int) ListLongMap!3009)

(assert (=> b!210221 (= lt!107638 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210221 (= lt!107633 (array!9998 (store (arr!4747 _values!649) i!601 (ValueCellFull!2357 v!520)) (size!5072 _values!649)))))

(assert (=> b!210221 (= lt!107637 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210222 () Bool)

(declare-fun res!102542 () Bool)

(assert (=> b!210222 (=> (not res!102542) (not e!136906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210222 (= res!102542 (validKeyInArray!0 k0!843))))

(declare-fun lt!107640 () tuple2!4094)

(declare-fun e!136903 () Bool)

(declare-fun lt!107634 () tuple2!4094)

(declare-fun b!210223 () Bool)

(assert (=> b!210223 (= e!136903 (= lt!107635 (+!549 (+!549 lt!107636 lt!107640) lt!107634)))))

(declare-fun b!210224 () Bool)

(declare-fun e!136908 () Bool)

(assert (=> b!210224 (= e!136908 tp_is_empty!5401)))

(declare-fun b!210225 () Bool)

(declare-fun res!102546 () Bool)

(assert (=> b!210225 (=> (not res!102546) (not e!136906))))

(assert (=> b!210225 (= res!102546 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5073 _keys!825))))))

(declare-fun mapIsEmpty!9176 () Bool)

(assert (=> mapIsEmpty!9176 mapRes!9176))

(declare-fun b!210226 () Bool)

(declare-fun res!102549 () Bool)

(assert (=> b!210226 (=> (not res!102549) (not e!136903))))

(assert (=> b!210226 (= res!102549 (= lt!107632 (+!549 (+!549 lt!107637 lt!107640) lt!107634)))))

(declare-fun b!210227 () Bool)

(declare-fun res!102544 () Bool)

(assert (=> b!210227 (=> (not res!102544) (not e!136906))))

(declare-datatypes ((List!2981 0))(
  ( (Nil!2978) (Cons!2977 (h!3619 (_ BitVec 64)) (t!7908 List!2981)) )
))
(declare-fun arrayNoDuplicates!0 (array!9999 (_ BitVec 32) List!2981) Bool)

(assert (=> b!210227 (= res!102544 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2978))))

(declare-fun mapNonEmpty!9176 () Bool)

(declare-fun tp!19663 () Bool)

(assert (=> mapNonEmpty!9176 (= mapRes!9176 (and tp!19663 e!136908))))

(declare-fun mapKey!9176 () (_ BitVec 32))

(declare-fun mapRest!9176 () (Array (_ BitVec 32) ValueCell!2357))

(declare-fun mapValue!9176 () ValueCell!2357)

(assert (=> mapNonEmpty!9176 (= (arr!4747 _values!649) (store mapRest!9176 mapKey!9176 mapValue!9176))))

(declare-fun b!210228 () Bool)

(assert (=> b!210228 (= e!136905 tp_is_empty!5401)))

(declare-fun b!210229 () Bool)

(declare-fun res!102548 () Bool)

(assert (=> b!210229 (=> (not res!102548) (not e!136906))))

(assert (=> b!210229 (= res!102548 (and (= (size!5072 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5073 _keys!825) (size!5072 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210230 () Bool)

(assert (=> b!210230 (= e!136902 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210230 e!136903))

(declare-fun res!102547 () Bool)

(assert (=> b!210230 (=> (not res!102547) (not e!136903))))

(assert (=> b!210230 (= res!102547 (= lt!107635 (+!549 (+!549 lt!107638 lt!107640) lt!107634)))))

(assert (=> b!210230 (= lt!107634 (tuple2!4095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210230 (= lt!107640 (tuple2!4095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210231 () Bool)

(declare-fun res!102540 () Bool)

(assert (=> b!210231 (=> (not res!102540) (not e!136906))))

(assert (=> b!210231 (= res!102540 (= (select (arr!4748 _keys!825) i!601) k0!843))))

(assert (= (and start!20930 res!102541) b!210229))

(assert (= (and b!210229 res!102548) b!210220))

(assert (= (and b!210220 res!102543) b!210227))

(assert (= (and b!210227 res!102544) b!210225))

(assert (= (and b!210225 res!102546) b!210222))

(assert (= (and b!210222 res!102542) b!210231))

(assert (= (and b!210231 res!102540) b!210221))

(assert (= (and b!210221 (not res!102545)) b!210230))

(assert (= (and b!210230 res!102547) b!210226))

(assert (= (and b!210226 res!102549) b!210223))

(assert (= (and b!210219 condMapEmpty!9176) mapIsEmpty!9176))

(assert (= (and b!210219 (not condMapEmpty!9176)) mapNonEmpty!9176))

(get-info :version)

(assert (= (and mapNonEmpty!9176 ((_ is ValueCellFull!2357) mapValue!9176)) b!210224))

(assert (= (and b!210219 ((_ is ValueCellFull!2357) mapDefault!9176)) b!210228))

(assert (= start!20930 b!210219))

(declare-fun m!237809 () Bool)

(assert (=> b!210220 m!237809))

(declare-fun m!237811 () Bool)

(assert (=> mapNonEmpty!9176 m!237811))

(declare-fun m!237813 () Bool)

(assert (=> b!210227 m!237813))

(declare-fun m!237815 () Bool)

(assert (=> start!20930 m!237815))

(declare-fun m!237817 () Bool)

(assert (=> start!20930 m!237817))

(declare-fun m!237819 () Bool)

(assert (=> start!20930 m!237819))

(declare-fun m!237821 () Bool)

(assert (=> b!210221 m!237821))

(declare-fun m!237823 () Bool)

(assert (=> b!210221 m!237823))

(declare-fun m!237825 () Bool)

(assert (=> b!210221 m!237825))

(declare-fun m!237827 () Bool)

(assert (=> b!210221 m!237827))

(declare-fun m!237829 () Bool)

(assert (=> b!210221 m!237829))

(declare-fun m!237831 () Bool)

(assert (=> b!210221 m!237831))

(declare-fun m!237833 () Bool)

(assert (=> b!210221 m!237833))

(declare-fun m!237835 () Bool)

(assert (=> b!210226 m!237835))

(assert (=> b!210226 m!237835))

(declare-fun m!237837 () Bool)

(assert (=> b!210226 m!237837))

(declare-fun m!237839 () Bool)

(assert (=> b!210231 m!237839))

(declare-fun m!237841 () Bool)

(assert (=> b!210230 m!237841))

(assert (=> b!210230 m!237841))

(declare-fun m!237843 () Bool)

(assert (=> b!210230 m!237843))

(declare-fun m!237845 () Bool)

(assert (=> b!210223 m!237845))

(assert (=> b!210223 m!237845))

(declare-fun m!237847 () Bool)

(assert (=> b!210223 m!237847))

(declare-fun m!237849 () Bool)

(assert (=> b!210222 m!237849))

(check-sat (not start!20930) (not b!210222) (not b!210223) (not b!210227) (not b!210221) (not b!210230) b_and!12323 (not b!210226) tp_is_empty!5401 (not b_next!5539) (not mapNonEmpty!9176) (not b!210220))
(check-sat b_and!12323 (not b_next!5539))
(get-model)

(declare-fun b!210320 () Bool)

(declare-fun e!136962 () Bool)

(declare-fun call!19855 () Bool)

(assert (=> b!210320 (= e!136962 call!19855)))

(declare-fun b!210321 () Bool)

(assert (=> b!210321 (= e!136962 call!19855)))

(declare-fun b!210322 () Bool)

(declare-fun e!136961 () Bool)

(assert (=> b!210322 (= e!136961 e!136962)))

(declare-fun c!35549 () Bool)

(assert (=> b!210322 (= c!35549 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210323 () Bool)

(declare-fun e!136959 () Bool)

(assert (=> b!210323 (= e!136959 e!136961)))

(declare-fun res!102617 () Bool)

(assert (=> b!210323 (=> (not res!102617) (not e!136961))))

(declare-fun e!136960 () Bool)

(assert (=> b!210323 (= res!102617 (not e!136960))))

(declare-fun res!102618 () Bool)

(assert (=> b!210323 (=> (not res!102618) (not e!136960))))

(assert (=> b!210323 (= res!102618 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58001 () Bool)

(declare-fun res!102616 () Bool)

(assert (=> d!58001 (=> res!102616 e!136959)))

(assert (=> d!58001 (= res!102616 (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58001 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2978) e!136959)))

(declare-fun bm!19852 () Bool)

(assert (=> bm!19852 (= call!19855 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35549 (Cons!2977 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) Nil!2978) Nil!2978)))))

(declare-fun b!210324 () Bool)

(declare-fun contains!1378 (List!2981 (_ BitVec 64)) Bool)

(assert (=> b!210324 (= e!136960 (contains!1378 Nil!2978 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58001 (not res!102616)) b!210323))

(assert (= (and b!210323 res!102618) b!210324))

(assert (= (and b!210323 res!102617) b!210322))

(assert (= (and b!210322 c!35549) b!210320))

(assert (= (and b!210322 (not c!35549)) b!210321))

(assert (= (or b!210320 b!210321) bm!19852))

(declare-fun m!237935 () Bool)

(assert (=> b!210322 m!237935))

(assert (=> b!210322 m!237935))

(declare-fun m!237937 () Bool)

(assert (=> b!210322 m!237937))

(assert (=> b!210323 m!237935))

(assert (=> b!210323 m!237935))

(assert (=> b!210323 m!237937))

(assert (=> bm!19852 m!237935))

(declare-fun m!237939 () Bool)

(assert (=> bm!19852 m!237939))

(assert (=> b!210324 m!237935))

(assert (=> b!210324 m!237935))

(declare-fun m!237941 () Bool)

(assert (=> b!210324 m!237941))

(assert (=> b!210227 d!58001))

(declare-fun d!58003 () Bool)

(assert (=> d!58003 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20930 d!58003))

(declare-fun d!58005 () Bool)

(assert (=> d!58005 (= (array_inv!3115 _values!649) (bvsge (size!5072 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20930 d!58005))

(declare-fun d!58007 () Bool)

(assert (=> d!58007 (= (array_inv!3116 _keys!825) (bvsge (size!5073 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20930 d!58007))

(declare-fun d!58009 () Bool)

(assert (=> d!58009 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210222 d!58009))

(declare-fun d!58011 () Bool)

(declare-fun e!136965 () Bool)

(assert (=> d!58011 e!136965))

(declare-fun res!102624 () Bool)

(assert (=> d!58011 (=> (not res!102624) (not e!136965))))

(declare-fun lt!107706 () ListLongMap!3009)

(declare-fun contains!1379 (ListLongMap!3009 (_ BitVec 64)) Bool)

(assert (=> d!58011 (= res!102624 (contains!1379 lt!107706 (_1!2058 lt!107634)))))

(declare-fun lt!107704 () List!2980)

(assert (=> d!58011 (= lt!107706 (ListLongMap!3010 lt!107704))))

(declare-fun lt!107703 () Unit!6378)

(declare-fun lt!107705 () Unit!6378)

(assert (=> d!58011 (= lt!107703 lt!107705)))

(declare-datatypes ((Option!256 0))(
  ( (Some!255 (v!4730 V!6849)) (None!254) )
))
(declare-fun getValueByKey!250 (List!2980 (_ BitVec 64)) Option!256)

(assert (=> d!58011 (= (getValueByKey!250 lt!107704 (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634)))))

(declare-fun lemmaContainsTupThenGetReturnValue!137 (List!2980 (_ BitVec 64) V!6849) Unit!6378)

(assert (=> d!58011 (= lt!107705 (lemmaContainsTupThenGetReturnValue!137 lt!107704 (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(declare-fun insertStrictlySorted!140 (List!2980 (_ BitVec 64) V!6849) List!2980)

(assert (=> d!58011 (= lt!107704 (insertStrictlySorted!140 (toList!1520 (+!549 lt!107637 lt!107640)) (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(assert (=> d!58011 (= (+!549 (+!549 lt!107637 lt!107640) lt!107634) lt!107706)))

(declare-fun b!210329 () Bool)

(declare-fun res!102623 () Bool)

(assert (=> b!210329 (=> (not res!102623) (not e!136965))))

(assert (=> b!210329 (= res!102623 (= (getValueByKey!250 (toList!1520 lt!107706) (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634))))))

(declare-fun b!210330 () Bool)

(declare-fun contains!1380 (List!2980 tuple2!4094) Bool)

(assert (=> b!210330 (= e!136965 (contains!1380 (toList!1520 lt!107706) lt!107634))))

(assert (= (and d!58011 res!102624) b!210329))

(assert (= (and b!210329 res!102623) b!210330))

(declare-fun m!237943 () Bool)

(assert (=> d!58011 m!237943))

(declare-fun m!237945 () Bool)

(assert (=> d!58011 m!237945))

(declare-fun m!237947 () Bool)

(assert (=> d!58011 m!237947))

(declare-fun m!237949 () Bool)

(assert (=> d!58011 m!237949))

(declare-fun m!237951 () Bool)

(assert (=> b!210329 m!237951))

(declare-fun m!237953 () Bool)

(assert (=> b!210330 m!237953))

(assert (=> b!210226 d!58011))

(declare-fun d!58013 () Bool)

(declare-fun e!136966 () Bool)

(assert (=> d!58013 e!136966))

(declare-fun res!102626 () Bool)

(assert (=> d!58013 (=> (not res!102626) (not e!136966))))

(declare-fun lt!107710 () ListLongMap!3009)

(assert (=> d!58013 (= res!102626 (contains!1379 lt!107710 (_1!2058 lt!107640)))))

(declare-fun lt!107708 () List!2980)

(assert (=> d!58013 (= lt!107710 (ListLongMap!3010 lt!107708))))

(declare-fun lt!107707 () Unit!6378)

(declare-fun lt!107709 () Unit!6378)

(assert (=> d!58013 (= lt!107707 lt!107709)))

(assert (=> d!58013 (= (getValueByKey!250 lt!107708 (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640)))))

(assert (=> d!58013 (= lt!107709 (lemmaContainsTupThenGetReturnValue!137 lt!107708 (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58013 (= lt!107708 (insertStrictlySorted!140 (toList!1520 lt!107637) (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58013 (= (+!549 lt!107637 lt!107640) lt!107710)))

(declare-fun b!210331 () Bool)

(declare-fun res!102625 () Bool)

(assert (=> b!210331 (=> (not res!102625) (not e!136966))))

(assert (=> b!210331 (= res!102625 (= (getValueByKey!250 (toList!1520 lt!107710) (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640))))))

(declare-fun b!210332 () Bool)

(assert (=> b!210332 (= e!136966 (contains!1380 (toList!1520 lt!107710) lt!107640))))

(assert (= (and d!58013 res!102626) b!210331))

(assert (= (and b!210331 res!102625) b!210332))

(declare-fun m!237955 () Bool)

(assert (=> d!58013 m!237955))

(declare-fun m!237957 () Bool)

(assert (=> d!58013 m!237957))

(declare-fun m!237959 () Bool)

(assert (=> d!58013 m!237959))

(declare-fun m!237961 () Bool)

(assert (=> d!58013 m!237961))

(declare-fun m!237963 () Bool)

(assert (=> b!210331 m!237963))

(declare-fun m!237965 () Bool)

(assert (=> b!210332 m!237965))

(assert (=> b!210226 d!58013))

(declare-fun d!58015 () Bool)

(declare-fun e!136967 () Bool)

(assert (=> d!58015 e!136967))

(declare-fun res!102628 () Bool)

(assert (=> d!58015 (=> (not res!102628) (not e!136967))))

(declare-fun lt!107714 () ListLongMap!3009)

(assert (=> d!58015 (= res!102628 (contains!1379 lt!107714 (_1!2058 lt!107634)))))

(declare-fun lt!107712 () List!2980)

(assert (=> d!58015 (= lt!107714 (ListLongMap!3010 lt!107712))))

(declare-fun lt!107711 () Unit!6378)

(declare-fun lt!107713 () Unit!6378)

(assert (=> d!58015 (= lt!107711 lt!107713)))

(assert (=> d!58015 (= (getValueByKey!250 lt!107712 (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634)))))

(assert (=> d!58015 (= lt!107713 (lemmaContainsTupThenGetReturnValue!137 lt!107712 (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(assert (=> d!58015 (= lt!107712 (insertStrictlySorted!140 (toList!1520 (+!549 lt!107636 lt!107640)) (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(assert (=> d!58015 (= (+!549 (+!549 lt!107636 lt!107640) lt!107634) lt!107714)))

(declare-fun b!210333 () Bool)

(declare-fun res!102627 () Bool)

(assert (=> b!210333 (=> (not res!102627) (not e!136967))))

(assert (=> b!210333 (= res!102627 (= (getValueByKey!250 (toList!1520 lt!107714) (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634))))))

(declare-fun b!210334 () Bool)

(assert (=> b!210334 (= e!136967 (contains!1380 (toList!1520 lt!107714) lt!107634))))

(assert (= (and d!58015 res!102628) b!210333))

(assert (= (and b!210333 res!102627) b!210334))

(declare-fun m!237967 () Bool)

(assert (=> d!58015 m!237967))

(declare-fun m!237969 () Bool)

(assert (=> d!58015 m!237969))

(declare-fun m!237971 () Bool)

(assert (=> d!58015 m!237971))

(declare-fun m!237973 () Bool)

(assert (=> d!58015 m!237973))

(declare-fun m!237975 () Bool)

(assert (=> b!210333 m!237975))

(declare-fun m!237977 () Bool)

(assert (=> b!210334 m!237977))

(assert (=> b!210223 d!58015))

(declare-fun d!58017 () Bool)

(declare-fun e!136968 () Bool)

(assert (=> d!58017 e!136968))

(declare-fun res!102630 () Bool)

(assert (=> d!58017 (=> (not res!102630) (not e!136968))))

(declare-fun lt!107718 () ListLongMap!3009)

(assert (=> d!58017 (= res!102630 (contains!1379 lt!107718 (_1!2058 lt!107640)))))

(declare-fun lt!107716 () List!2980)

(assert (=> d!58017 (= lt!107718 (ListLongMap!3010 lt!107716))))

(declare-fun lt!107715 () Unit!6378)

(declare-fun lt!107717 () Unit!6378)

(assert (=> d!58017 (= lt!107715 lt!107717)))

(assert (=> d!58017 (= (getValueByKey!250 lt!107716 (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640)))))

(assert (=> d!58017 (= lt!107717 (lemmaContainsTupThenGetReturnValue!137 lt!107716 (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58017 (= lt!107716 (insertStrictlySorted!140 (toList!1520 lt!107636) (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58017 (= (+!549 lt!107636 lt!107640) lt!107718)))

(declare-fun b!210335 () Bool)

(declare-fun res!102629 () Bool)

(assert (=> b!210335 (=> (not res!102629) (not e!136968))))

(assert (=> b!210335 (= res!102629 (= (getValueByKey!250 (toList!1520 lt!107718) (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640))))))

(declare-fun b!210336 () Bool)

(assert (=> b!210336 (= e!136968 (contains!1380 (toList!1520 lt!107718) lt!107640))))

(assert (= (and d!58017 res!102630) b!210335))

(assert (= (and b!210335 res!102629) b!210336))

(declare-fun m!237979 () Bool)

(assert (=> d!58017 m!237979))

(declare-fun m!237981 () Bool)

(assert (=> d!58017 m!237981))

(declare-fun m!237983 () Bool)

(assert (=> d!58017 m!237983))

(declare-fun m!237985 () Bool)

(assert (=> d!58017 m!237985))

(declare-fun m!237987 () Bool)

(assert (=> b!210335 m!237987))

(declare-fun m!237989 () Bool)

(assert (=> b!210336 m!237989))

(assert (=> b!210223 d!58017))

(declare-fun d!58019 () Bool)

(declare-fun res!102635 () Bool)

(declare-fun e!136975 () Bool)

(assert (=> d!58019 (=> res!102635 e!136975)))

(assert (=> d!58019 (= res!102635 (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136975)))

(declare-fun bm!19855 () Bool)

(declare-fun call!19858 () Bool)

(assert (=> bm!19855 (= call!19858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210345 () Bool)

(declare-fun e!136976 () Bool)

(assert (=> b!210345 (= e!136975 e!136976)))

(declare-fun c!35552 () Bool)

(assert (=> b!210345 (= c!35552 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210346 () Bool)

(declare-fun e!136977 () Bool)

(assert (=> b!210346 (= e!136977 call!19858)))

(declare-fun b!210347 () Bool)

(assert (=> b!210347 (= e!136976 call!19858)))

(declare-fun b!210348 () Bool)

(assert (=> b!210348 (= e!136976 e!136977)))

(declare-fun lt!107726 () (_ BitVec 64))

(assert (=> b!210348 (= lt!107726 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107727 () Unit!6378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9999 (_ BitVec 64) (_ BitVec 32)) Unit!6378)

(assert (=> b!210348 (= lt!107727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107726 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210348 (arrayContainsKey!0 _keys!825 lt!107726 #b00000000000000000000000000000000)))

(declare-fun lt!107725 () Unit!6378)

(assert (=> b!210348 (= lt!107725 lt!107727)))

(declare-fun res!102636 () Bool)

(declare-datatypes ((SeekEntryResult!695 0))(
  ( (MissingZero!695 (index!4950 (_ BitVec 32))) (Found!695 (index!4951 (_ BitVec 32))) (Intermediate!695 (undefined!1507 Bool) (index!4952 (_ BitVec 32)) (x!22011 (_ BitVec 32))) (Undefined!695) (MissingVacant!695 (index!4953 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9999 (_ BitVec 32)) SeekEntryResult!695)

(assert (=> b!210348 (= res!102636 (= (seekEntryOrOpen!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!695 #b00000000000000000000000000000000)))))

(assert (=> b!210348 (=> (not res!102636) (not e!136977))))

(assert (= (and d!58019 (not res!102635)) b!210345))

(assert (= (and b!210345 c!35552) b!210348))

(assert (= (and b!210345 (not c!35552)) b!210347))

(assert (= (and b!210348 res!102636) b!210346))

(assert (= (or b!210346 b!210347) bm!19855))

(declare-fun m!237991 () Bool)

(assert (=> bm!19855 m!237991))

(assert (=> b!210345 m!237935))

(assert (=> b!210345 m!237935))

(assert (=> b!210345 m!237937))

(assert (=> b!210348 m!237935))

(declare-fun m!237993 () Bool)

(assert (=> b!210348 m!237993))

(declare-fun m!237995 () Bool)

(assert (=> b!210348 m!237995))

(assert (=> b!210348 m!237935))

(declare-fun m!237997 () Bool)

(assert (=> b!210348 m!237997))

(assert (=> b!210220 d!58019))

(declare-fun d!58021 () Bool)

(declare-fun e!136978 () Bool)

(assert (=> d!58021 e!136978))

(declare-fun res!102638 () Bool)

(assert (=> d!58021 (=> (not res!102638) (not e!136978))))

(declare-fun lt!107731 () ListLongMap!3009)

(assert (=> d!58021 (= res!102638 (contains!1379 lt!107731 (_1!2058 lt!107634)))))

(declare-fun lt!107729 () List!2980)

(assert (=> d!58021 (= lt!107731 (ListLongMap!3010 lt!107729))))

(declare-fun lt!107728 () Unit!6378)

(declare-fun lt!107730 () Unit!6378)

(assert (=> d!58021 (= lt!107728 lt!107730)))

(assert (=> d!58021 (= (getValueByKey!250 lt!107729 (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634)))))

(assert (=> d!58021 (= lt!107730 (lemmaContainsTupThenGetReturnValue!137 lt!107729 (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(assert (=> d!58021 (= lt!107729 (insertStrictlySorted!140 (toList!1520 (+!549 lt!107638 lt!107640)) (_1!2058 lt!107634) (_2!2058 lt!107634)))))

(assert (=> d!58021 (= (+!549 (+!549 lt!107638 lt!107640) lt!107634) lt!107731)))

(declare-fun b!210349 () Bool)

(declare-fun res!102637 () Bool)

(assert (=> b!210349 (=> (not res!102637) (not e!136978))))

(assert (=> b!210349 (= res!102637 (= (getValueByKey!250 (toList!1520 lt!107731) (_1!2058 lt!107634)) (Some!255 (_2!2058 lt!107634))))))

(declare-fun b!210350 () Bool)

(assert (=> b!210350 (= e!136978 (contains!1380 (toList!1520 lt!107731) lt!107634))))

(assert (= (and d!58021 res!102638) b!210349))

(assert (= (and b!210349 res!102637) b!210350))

(declare-fun m!237999 () Bool)

(assert (=> d!58021 m!237999))

(declare-fun m!238001 () Bool)

(assert (=> d!58021 m!238001))

(declare-fun m!238003 () Bool)

(assert (=> d!58021 m!238003))

(declare-fun m!238005 () Bool)

(assert (=> d!58021 m!238005))

(declare-fun m!238007 () Bool)

(assert (=> b!210349 m!238007))

(declare-fun m!238009 () Bool)

(assert (=> b!210350 m!238009))

(assert (=> b!210230 d!58021))

(declare-fun d!58023 () Bool)

(declare-fun e!136979 () Bool)

(assert (=> d!58023 e!136979))

(declare-fun res!102640 () Bool)

(assert (=> d!58023 (=> (not res!102640) (not e!136979))))

(declare-fun lt!107735 () ListLongMap!3009)

(assert (=> d!58023 (= res!102640 (contains!1379 lt!107735 (_1!2058 lt!107640)))))

(declare-fun lt!107733 () List!2980)

(assert (=> d!58023 (= lt!107735 (ListLongMap!3010 lt!107733))))

(declare-fun lt!107732 () Unit!6378)

(declare-fun lt!107734 () Unit!6378)

(assert (=> d!58023 (= lt!107732 lt!107734)))

(assert (=> d!58023 (= (getValueByKey!250 lt!107733 (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640)))))

(assert (=> d!58023 (= lt!107734 (lemmaContainsTupThenGetReturnValue!137 lt!107733 (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58023 (= lt!107733 (insertStrictlySorted!140 (toList!1520 lt!107638) (_1!2058 lt!107640) (_2!2058 lt!107640)))))

(assert (=> d!58023 (= (+!549 lt!107638 lt!107640) lt!107735)))

(declare-fun b!210351 () Bool)

(declare-fun res!102639 () Bool)

(assert (=> b!210351 (=> (not res!102639) (not e!136979))))

(assert (=> b!210351 (= res!102639 (= (getValueByKey!250 (toList!1520 lt!107735) (_1!2058 lt!107640)) (Some!255 (_2!2058 lt!107640))))))

(declare-fun b!210352 () Bool)

(assert (=> b!210352 (= e!136979 (contains!1380 (toList!1520 lt!107735) lt!107640))))

(assert (= (and d!58023 res!102640) b!210351))

(assert (= (and b!210351 res!102639) b!210352))

(declare-fun m!238011 () Bool)

(assert (=> d!58023 m!238011))

(declare-fun m!238013 () Bool)

(assert (=> d!58023 m!238013))

(declare-fun m!238015 () Bool)

(assert (=> d!58023 m!238015))

(declare-fun m!238017 () Bool)

(assert (=> d!58023 m!238017))

(declare-fun m!238019 () Bool)

(assert (=> b!210351 m!238019))

(declare-fun m!238021 () Bool)

(assert (=> b!210352 m!238021))

(assert (=> b!210230 d!58023))

(declare-fun d!58025 () Bool)

(declare-fun e!136980 () Bool)

(assert (=> d!58025 e!136980))

(declare-fun res!102642 () Bool)

(assert (=> d!58025 (=> (not res!102642) (not e!136980))))

(declare-fun lt!107739 () ListLongMap!3009)

(assert (=> d!58025 (= res!102642 (contains!1379 lt!107739 (_1!2058 (tuple2!4095 k0!843 v!520))))))

(declare-fun lt!107737 () List!2980)

(assert (=> d!58025 (= lt!107739 (ListLongMap!3010 lt!107737))))

(declare-fun lt!107736 () Unit!6378)

(declare-fun lt!107738 () Unit!6378)

(assert (=> d!58025 (= lt!107736 lt!107738)))

(assert (=> d!58025 (= (getValueByKey!250 lt!107737 (_1!2058 (tuple2!4095 k0!843 v!520))) (Some!255 (_2!2058 (tuple2!4095 k0!843 v!520))))))

(assert (=> d!58025 (= lt!107738 (lemmaContainsTupThenGetReturnValue!137 lt!107737 (_1!2058 (tuple2!4095 k0!843 v!520)) (_2!2058 (tuple2!4095 k0!843 v!520))))))

(assert (=> d!58025 (= lt!107737 (insertStrictlySorted!140 (toList!1520 lt!107637) (_1!2058 (tuple2!4095 k0!843 v!520)) (_2!2058 (tuple2!4095 k0!843 v!520))))))

(assert (=> d!58025 (= (+!549 lt!107637 (tuple2!4095 k0!843 v!520)) lt!107739)))

(declare-fun b!210353 () Bool)

(declare-fun res!102641 () Bool)

(assert (=> b!210353 (=> (not res!102641) (not e!136980))))

(assert (=> b!210353 (= res!102641 (= (getValueByKey!250 (toList!1520 lt!107739) (_1!2058 (tuple2!4095 k0!843 v!520))) (Some!255 (_2!2058 (tuple2!4095 k0!843 v!520)))))))

(declare-fun b!210354 () Bool)

(assert (=> b!210354 (= e!136980 (contains!1380 (toList!1520 lt!107739) (tuple2!4095 k0!843 v!520)))))

(assert (= (and d!58025 res!102642) b!210353))

(assert (= (and b!210353 res!102641) b!210354))

(declare-fun m!238023 () Bool)

(assert (=> d!58025 m!238023))

(declare-fun m!238025 () Bool)

(assert (=> d!58025 m!238025))

(declare-fun m!238027 () Bool)

(assert (=> d!58025 m!238027))

(declare-fun m!238029 () Bool)

(assert (=> d!58025 m!238029))

(declare-fun m!238031 () Bool)

(assert (=> b!210353 m!238031))

(declare-fun m!238033 () Bool)

(assert (=> b!210354 m!238033))

(assert (=> b!210221 d!58025))

(declare-fun b!210397 () Bool)

(declare-fun e!137019 () Bool)

(declare-fun call!19874 () Bool)

(assert (=> b!210397 (= e!137019 (not call!19874))))

(declare-fun b!210398 () Bool)

(declare-fun e!137008 () ListLongMap!3009)

(declare-fun call!19873 () ListLongMap!3009)

(assert (=> b!210398 (= e!137008 call!19873)))

(declare-fun bm!19870 () Bool)

(declare-fun call!19876 () ListLongMap!3009)

(assert (=> bm!19870 (= call!19873 call!19876)))

(declare-fun b!210399 () Bool)

(declare-fun call!19877 () ListLongMap!3009)

(assert (=> b!210399 (= e!137008 call!19877)))

(declare-fun b!210400 () Bool)

(declare-fun e!137011 () Bool)

(declare-fun lt!107791 () ListLongMap!3009)

(declare-fun apply!191 (ListLongMap!3009 (_ BitVec 64)) V!6849)

(assert (=> b!210400 (= e!137011 (= (apply!191 lt!107791 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210401 () Bool)

(declare-fun e!137009 () Bool)

(declare-fun e!137013 () Bool)

(assert (=> b!210401 (= e!137009 e!137013)))

(declare-fun res!102664 () Bool)

(declare-fun call!19879 () Bool)

(assert (=> b!210401 (= res!102664 call!19879)))

(assert (=> b!210401 (=> (not res!102664) (not e!137013))))

(declare-fun b!210402 () Bool)

(declare-fun e!137007 () ListLongMap!3009)

(assert (=> b!210402 (= e!137007 call!19873)))

(declare-fun b!210403 () Bool)

(declare-fun e!137017 () ListLongMap!3009)

(assert (=> b!210403 (= e!137017 e!137007)))

(declare-fun c!35570 () Bool)

(assert (=> b!210403 (= c!35570 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!35565 () Bool)

(declare-fun call!19878 () ListLongMap!3009)

(declare-fun call!19875 () ListLongMap!3009)

(declare-fun bm!19871 () Bool)

(assert (=> bm!19871 (= call!19876 (+!549 (ite c!35565 call!19878 (ite c!35570 call!19875 call!19877)) (ite (or c!35565 c!35570) (tuple2!4095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210404 () Bool)

(declare-fun res!102669 () Bool)

(declare-fun e!137018 () Bool)

(assert (=> b!210404 (=> (not res!102669) (not e!137018))))

(assert (=> b!210404 (= res!102669 e!137009)))

(declare-fun c!35567 () Bool)

(assert (=> b!210404 (= c!35567 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19872 () Bool)

(assert (=> bm!19872 (= call!19874 (contains!1379 lt!107791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210405 () Bool)

(declare-fun c!35568 () Bool)

(assert (=> b!210405 (= c!35568 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210405 (= e!137007 e!137008)))

(declare-fun b!210406 () Bool)

(declare-fun e!137016 () Unit!6378)

(declare-fun lt!107794 () Unit!6378)

(assert (=> b!210406 (= e!137016 lt!107794)))

(declare-fun lt!107803 () ListLongMap!3009)

(assert (=> b!210406 (= lt!107803 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107798 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107800 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107800 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107804 () Unit!6378)

(declare-fun addStillContains!167 (ListLongMap!3009 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6378)

(assert (=> b!210406 (= lt!107804 (addStillContains!167 lt!107803 lt!107798 zeroValue!615 lt!107800))))

(assert (=> b!210406 (contains!1379 (+!549 lt!107803 (tuple2!4095 lt!107798 zeroValue!615)) lt!107800)))

(declare-fun lt!107784 () Unit!6378)

(assert (=> b!210406 (= lt!107784 lt!107804)))

(declare-fun lt!107805 () ListLongMap!3009)

(assert (=> b!210406 (= lt!107805 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107802 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107801 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107801 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107790 () Unit!6378)

(declare-fun addApplyDifferent!167 (ListLongMap!3009 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6378)

(assert (=> b!210406 (= lt!107790 (addApplyDifferent!167 lt!107805 lt!107802 minValue!615 lt!107801))))

(assert (=> b!210406 (= (apply!191 (+!549 lt!107805 (tuple2!4095 lt!107802 minValue!615)) lt!107801) (apply!191 lt!107805 lt!107801))))

(declare-fun lt!107787 () Unit!6378)

(assert (=> b!210406 (= lt!107787 lt!107790)))

(declare-fun lt!107793 () ListLongMap!3009)

(assert (=> b!210406 (= lt!107793 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107797 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107785 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107785 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107788 () Unit!6378)

(assert (=> b!210406 (= lt!107788 (addApplyDifferent!167 lt!107793 lt!107797 zeroValue!615 lt!107785))))

(assert (=> b!210406 (= (apply!191 (+!549 lt!107793 (tuple2!4095 lt!107797 zeroValue!615)) lt!107785) (apply!191 lt!107793 lt!107785))))

(declare-fun lt!107796 () Unit!6378)

(assert (=> b!210406 (= lt!107796 lt!107788)))

(declare-fun lt!107795 () ListLongMap!3009)

(assert (=> b!210406 (= lt!107795 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107799 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107799 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107789 () (_ BitVec 64))

(assert (=> b!210406 (= lt!107789 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210406 (= lt!107794 (addApplyDifferent!167 lt!107795 lt!107799 minValue!615 lt!107789))))

(assert (=> b!210406 (= (apply!191 (+!549 lt!107795 (tuple2!4095 lt!107799 minValue!615)) lt!107789) (apply!191 lt!107795 lt!107789))))

(declare-fun b!210407 () Bool)

(assert (=> b!210407 (= e!137017 (+!549 call!19876 (tuple2!4095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19873 () Bool)

(assert (=> bm!19873 (= call!19875 call!19878)))

(declare-fun b!210408 () Bool)

(declare-fun e!137010 () Bool)

(declare-fun get!2553 (ValueCell!2357 V!6849) V!6849)

(declare-fun dynLambda!534 (Int (_ BitVec 64)) V!6849)

(assert (=> b!210408 (= e!137010 (= (apply!191 lt!107791 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2553 (select (arr!4747 lt!107633) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5072 lt!107633)))))

(assert (=> b!210408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun bm!19874 () Bool)

(assert (=> bm!19874 (= call!19878 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19875 () Bool)

(assert (=> bm!19875 (= call!19877 call!19875)))

(declare-fun b!210409 () Bool)

(declare-fun e!137015 () Bool)

(assert (=> b!210409 (= e!137015 e!137010)))

(declare-fun res!102661 () Bool)

(assert (=> b!210409 (=> (not res!102661) (not e!137010))))

(assert (=> b!210409 (= res!102661 (contains!1379 lt!107791 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210410 () Bool)

(assert (=> b!210410 (= e!137013 (= (apply!191 lt!107791 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210411 () Bool)

(assert (=> b!210411 (= e!137019 e!137011)))

(declare-fun res!102665 () Bool)

(assert (=> b!210411 (= res!102665 call!19874)))

(assert (=> b!210411 (=> (not res!102665) (not e!137011))))

(declare-fun b!210412 () Bool)

(declare-fun res!102668 () Bool)

(assert (=> b!210412 (=> (not res!102668) (not e!137018))))

(assert (=> b!210412 (= res!102668 e!137015)))

(declare-fun res!102663 () Bool)

(assert (=> b!210412 (=> res!102663 e!137015)))

(declare-fun e!137012 () Bool)

(assert (=> b!210412 (= res!102663 (not e!137012))))

(declare-fun res!102666 () Bool)

(assert (=> b!210412 (=> (not res!102666) (not e!137012))))

(assert (=> b!210412 (= res!102666 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun d!58027 () Bool)

(assert (=> d!58027 e!137018))

(declare-fun res!102662 () Bool)

(assert (=> d!58027 (=> (not res!102662) (not e!137018))))

(assert (=> d!58027 (= res!102662 (or (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))))

(declare-fun lt!107786 () ListLongMap!3009)

(assert (=> d!58027 (= lt!107791 lt!107786)))

(declare-fun lt!107792 () Unit!6378)

(assert (=> d!58027 (= lt!107792 e!137016)))

(declare-fun c!35566 () Bool)

(declare-fun e!137014 () Bool)

(assert (=> d!58027 (= c!35566 e!137014)))

(declare-fun res!102667 () Bool)

(assert (=> d!58027 (=> (not res!102667) (not e!137014))))

(assert (=> d!58027 (= res!102667 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58027 (= lt!107786 e!137017)))

(assert (=> d!58027 (= c!35565 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58027 (validMask!0 mask!1149)))

(assert (=> d!58027 (= (getCurrentListMap!1060 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107791)))

(declare-fun b!210413 () Bool)

(assert (=> b!210413 (= e!137009 (not call!19879))))

(declare-fun b!210414 () Bool)

(assert (=> b!210414 (= e!137018 e!137019)))

(declare-fun c!35569 () Bool)

(assert (=> b!210414 (= c!35569 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210415 () Bool)

(assert (=> b!210415 (= e!137012 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19876 () Bool)

(assert (=> bm!19876 (= call!19879 (contains!1379 lt!107791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210416 () Bool)

(declare-fun Unit!6380 () Unit!6378)

(assert (=> b!210416 (= e!137016 Unit!6380)))

(declare-fun b!210417 () Bool)

(assert (=> b!210417 (= e!137014 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58027 c!35565) b!210407))

(assert (= (and d!58027 (not c!35565)) b!210403))

(assert (= (and b!210403 c!35570) b!210402))

(assert (= (and b!210403 (not c!35570)) b!210405))

(assert (= (and b!210405 c!35568) b!210398))

(assert (= (and b!210405 (not c!35568)) b!210399))

(assert (= (or b!210398 b!210399) bm!19875))

(assert (= (or b!210402 bm!19875) bm!19873))

(assert (= (or b!210402 b!210398) bm!19870))

(assert (= (or b!210407 bm!19873) bm!19874))

(assert (= (or b!210407 bm!19870) bm!19871))

(assert (= (and d!58027 res!102667) b!210417))

(assert (= (and d!58027 c!35566) b!210406))

(assert (= (and d!58027 (not c!35566)) b!210416))

(assert (= (and d!58027 res!102662) b!210412))

(assert (= (and b!210412 res!102666) b!210415))

(assert (= (and b!210412 (not res!102663)) b!210409))

(assert (= (and b!210409 res!102661) b!210408))

(assert (= (and b!210412 res!102668) b!210404))

(assert (= (and b!210404 c!35567) b!210401))

(assert (= (and b!210404 (not c!35567)) b!210413))

(assert (= (and b!210401 res!102664) b!210410))

(assert (= (or b!210401 b!210413) bm!19876))

(assert (= (and b!210404 res!102669) b!210414))

(assert (= (and b!210414 c!35569) b!210411))

(assert (= (and b!210414 (not c!35569)) b!210397))

(assert (= (and b!210411 res!102665) b!210400))

(assert (= (or b!210411 b!210397) bm!19872))

(declare-fun b_lambda!7609 () Bool)

(assert (=> (not b_lambda!7609) (not b!210408)))

(declare-fun t!7911 () Bool)

(declare-fun tb!2887 () Bool)

(assert (=> (and start!20930 (= defaultEntry!657 defaultEntry!657) t!7911) tb!2887))

(declare-fun result!4965 () Bool)

(assert (=> tb!2887 (= result!4965 tp_is_empty!5401)))

(assert (=> b!210408 t!7911))

(declare-fun b_and!12329 () Bool)

(assert (= b_and!12323 (and (=> t!7911 result!4965) b_and!12329)))

(assert (=> b!210417 m!237935))

(assert (=> b!210417 m!237935))

(assert (=> b!210417 m!237937))

(declare-fun m!238035 () Bool)

(assert (=> bm!19872 m!238035))

(declare-fun m!238037 () Bool)

(assert (=> bm!19871 m!238037))

(declare-fun m!238039 () Bool)

(assert (=> b!210407 m!238039))

(declare-fun m!238041 () Bool)

(assert (=> b!210408 m!238041))

(declare-fun m!238043 () Bool)

(assert (=> b!210408 m!238043))

(declare-fun m!238045 () Bool)

(assert (=> b!210408 m!238045))

(assert (=> b!210408 m!238041))

(assert (=> b!210408 m!237935))

(assert (=> b!210408 m!238043))

(assert (=> b!210408 m!237935))

(declare-fun m!238047 () Bool)

(assert (=> b!210408 m!238047))

(declare-fun m!238049 () Bool)

(assert (=> bm!19876 m!238049))

(declare-fun m!238051 () Bool)

(assert (=> b!210406 m!238051))

(declare-fun m!238053 () Bool)

(assert (=> b!210406 m!238053))

(assert (=> b!210406 m!237935))

(assert (=> b!210406 m!237821))

(declare-fun m!238055 () Bool)

(assert (=> b!210406 m!238055))

(declare-fun m!238057 () Bool)

(assert (=> b!210406 m!238057))

(declare-fun m!238059 () Bool)

(assert (=> b!210406 m!238059))

(declare-fun m!238061 () Bool)

(assert (=> b!210406 m!238061))

(assert (=> b!210406 m!238053))

(declare-fun m!238063 () Bool)

(assert (=> b!210406 m!238063))

(declare-fun m!238065 () Bool)

(assert (=> b!210406 m!238065))

(declare-fun m!238067 () Bool)

(assert (=> b!210406 m!238067))

(declare-fun m!238069 () Bool)

(assert (=> b!210406 m!238069))

(declare-fun m!238071 () Bool)

(assert (=> b!210406 m!238071))

(declare-fun m!238073 () Bool)

(assert (=> b!210406 m!238073))

(assert (=> b!210406 m!238059))

(declare-fun m!238075 () Bool)

(assert (=> b!210406 m!238075))

(declare-fun m!238077 () Bool)

(assert (=> b!210406 m!238077))

(declare-fun m!238079 () Bool)

(assert (=> b!210406 m!238079))

(assert (=> b!210406 m!238067))

(assert (=> b!210406 m!238077))

(assert (=> b!210409 m!237935))

(assert (=> b!210409 m!237935))

(declare-fun m!238081 () Bool)

(assert (=> b!210409 m!238081))

(assert (=> b!210415 m!237935))

(assert (=> b!210415 m!237935))

(assert (=> b!210415 m!237937))

(assert (=> d!58027 m!237815))

(assert (=> bm!19874 m!237821))

(declare-fun m!238083 () Bool)

(assert (=> b!210410 m!238083))

(declare-fun m!238085 () Bool)

(assert (=> b!210400 m!238085))

(assert (=> b!210221 d!58027))

(declare-fun b!210444 () Bool)

(declare-fun e!137034 () Bool)

(declare-fun e!137036 () Bool)

(assert (=> b!210444 (= e!137034 e!137036)))

(assert (=> b!210444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun res!102679 () Bool)

(declare-fun lt!107820 () ListLongMap!3009)

(assert (=> b!210444 (= res!102679 (contains!1379 lt!107820 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210444 (=> (not res!102679) (not e!137036))))

(declare-fun b!210445 () Bool)

(assert (=> b!210445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> b!210445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5072 _values!649)))))

(assert (=> b!210445 (= e!137036 (= (apply!191 lt!107820 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2553 (select (arr!4747 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210446 () Bool)

(declare-fun e!137039 () ListLongMap!3009)

(declare-fun e!137037 () ListLongMap!3009)

(assert (=> b!210446 (= e!137039 e!137037)))

(declare-fun c!35580 () Bool)

(assert (=> b!210446 (= c!35580 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210447 () Bool)

(declare-fun e!137038 () Bool)

(assert (=> b!210447 (= e!137034 e!137038)))

(declare-fun c!35582 () Bool)

(assert (=> b!210447 (= c!35582 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210448 () Bool)

(assert (=> b!210448 (= e!137038 (= lt!107820 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210449 () Bool)

(declare-fun isEmpty!498 (ListLongMap!3009) Bool)

(assert (=> b!210449 (= e!137038 (isEmpty!498 lt!107820))))

(declare-fun b!210450 () Bool)

(declare-fun e!137040 () Bool)

(assert (=> b!210450 (= e!137040 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210450 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210452 () Bool)

(declare-fun res!102681 () Bool)

(declare-fun e!137035 () Bool)

(assert (=> b!210452 (=> (not res!102681) (not e!137035))))

(assert (=> b!210452 (= res!102681 (not (contains!1379 lt!107820 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!210453 () Bool)

(declare-fun lt!107822 () Unit!6378)

(declare-fun lt!107824 () Unit!6378)

(assert (=> b!210453 (= lt!107822 lt!107824)))

(declare-fun lt!107821 () (_ BitVec 64))

(declare-fun lt!107825 () ListLongMap!3009)

(declare-fun lt!107823 () V!6849)

(declare-fun lt!107826 () (_ BitVec 64))

(assert (=> b!210453 (not (contains!1379 (+!549 lt!107825 (tuple2!4095 lt!107821 lt!107823)) lt!107826))))

(declare-fun addStillNotContains!102 (ListLongMap!3009 (_ BitVec 64) V!6849 (_ BitVec 64)) Unit!6378)

(assert (=> b!210453 (= lt!107824 (addStillNotContains!102 lt!107825 lt!107821 lt!107823 lt!107826))))

(assert (=> b!210453 (= lt!107826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210453 (= lt!107823 (get!2553 (select (arr!4747 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210453 (= lt!107821 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19882 () ListLongMap!3009)

(assert (=> b!210453 (= lt!107825 call!19882)))

(assert (=> b!210453 (= e!137037 (+!549 call!19882 (tuple2!4095 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) (get!2553 (select (arr!4747 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210454 () Bool)

(assert (=> b!210454 (= e!137035 e!137034)))

(declare-fun c!35579 () Bool)

(assert (=> b!210454 (= c!35579 e!137040)))

(declare-fun res!102680 () Bool)

(assert (=> b!210454 (=> (not res!102680) (not e!137040))))

(assert (=> b!210454 (= res!102680 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210455 () Bool)

(assert (=> b!210455 (= e!137037 call!19882)))

(declare-fun bm!19879 () Bool)

(assert (=> bm!19879 (= call!19882 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58029 () Bool)

(assert (=> d!58029 e!137035))

(declare-fun res!102678 () Bool)

(assert (=> d!58029 (=> (not res!102678) (not e!137035))))

(assert (=> d!58029 (= res!102678 (not (contains!1379 lt!107820 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58029 (= lt!107820 e!137039)))

(declare-fun c!35581 () Bool)

(assert (=> d!58029 (= c!35581 (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58029 (validMask!0 mask!1149)))

(assert (=> d!58029 (= (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107820)))

(declare-fun b!210451 () Bool)

(assert (=> b!210451 (= e!137039 (ListLongMap!3010 Nil!2977))))

(assert (= (and d!58029 c!35581) b!210451))

(assert (= (and d!58029 (not c!35581)) b!210446))

(assert (= (and b!210446 c!35580) b!210453))

(assert (= (and b!210446 (not c!35580)) b!210455))

(assert (= (or b!210453 b!210455) bm!19879))

(assert (= (and d!58029 res!102678) b!210452))

(assert (= (and b!210452 res!102681) b!210454))

(assert (= (and b!210454 res!102680) b!210450))

(assert (= (and b!210454 c!35579) b!210444))

(assert (= (and b!210454 (not c!35579)) b!210447))

(assert (= (and b!210444 res!102679) b!210445))

(assert (= (and b!210447 c!35582) b!210448))

(assert (= (and b!210447 (not c!35582)) b!210449))

(declare-fun b_lambda!7611 () Bool)

(assert (=> (not b_lambda!7611) (not b!210445)))

(assert (=> b!210445 t!7911))

(declare-fun b_and!12331 () Bool)

(assert (= b_and!12329 (and (=> t!7911 result!4965) b_and!12331)))

(declare-fun b_lambda!7613 () Bool)

(assert (=> (not b_lambda!7613) (not b!210453)))

(assert (=> b!210453 t!7911))

(declare-fun b_and!12333 () Bool)

(assert (= b_and!12331 (and (=> t!7911 result!4965) b_and!12333)))

(assert (=> b!210446 m!237935))

(assert (=> b!210446 m!237935))

(assert (=> b!210446 m!237937))

(assert (=> b!210450 m!237935))

(assert (=> b!210450 m!237935))

(assert (=> b!210450 m!237937))

(declare-fun m!238087 () Bool)

(assert (=> b!210448 m!238087))

(declare-fun m!238089 () Bool)

(assert (=> b!210449 m!238089))

(declare-fun m!238091 () Bool)

(assert (=> b!210453 m!238091))

(declare-fun m!238093 () Bool)

(assert (=> b!210453 m!238093))

(declare-fun m!238095 () Bool)

(assert (=> b!210453 m!238095))

(assert (=> b!210453 m!238043))

(declare-fun m!238097 () Bool)

(assert (=> b!210453 m!238097))

(declare-fun m!238099 () Bool)

(assert (=> b!210453 m!238099))

(assert (=> b!210453 m!237935))

(assert (=> b!210453 m!238095))

(assert (=> b!210453 m!238043))

(assert (=> b!210453 m!238091))

(declare-fun m!238101 () Bool)

(assert (=> b!210453 m!238101))

(declare-fun m!238103 () Bool)

(assert (=> d!58029 m!238103))

(assert (=> d!58029 m!237815))

(declare-fun m!238105 () Bool)

(assert (=> b!210452 m!238105))

(assert (=> bm!19879 m!238087))

(assert (=> b!210445 m!238043))

(assert (=> b!210445 m!237935))

(declare-fun m!238107 () Bool)

(assert (=> b!210445 m!238107))

(assert (=> b!210445 m!238095))

(assert (=> b!210445 m!238043))

(assert (=> b!210445 m!238097))

(assert (=> b!210445 m!237935))

(assert (=> b!210445 m!238095))

(assert (=> b!210444 m!237935))

(assert (=> b!210444 m!237935))

(declare-fun m!238109 () Bool)

(assert (=> b!210444 m!238109))

(assert (=> b!210221 d!58029))

(declare-fun call!19887 () ListLongMap!3009)

(declare-fun e!137045 () Bool)

(declare-fun call!19888 () ListLongMap!3009)

(declare-fun b!210462 () Bool)

(assert (=> b!210462 (= e!137045 (= call!19887 (+!549 call!19888 (tuple2!4095 k0!843 v!520))))))

(declare-fun d!58031 () Bool)

(declare-fun e!137046 () Bool)

(assert (=> d!58031 e!137046))

(declare-fun res!102684 () Bool)

(assert (=> d!58031 (=> (not res!102684) (not e!137046))))

(assert (=> d!58031 (= res!102684 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5072 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5072 _values!649))))))))

(declare-fun lt!107829 () Unit!6378)

(declare-fun choose!1081 (array!9999 array!9997 (_ BitVec 32) (_ BitVec 32) V!6849 V!6849 (_ BitVec 32) (_ BitVec 64) V!6849 (_ BitVec 32) Int) Unit!6378)

(assert (=> d!58031 (= lt!107829 (choose!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58031 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107829)))

(declare-fun bm!19884 () Bool)

(assert (=> bm!19884 (= call!19888 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210463 () Bool)

(assert (=> b!210463 (= e!137046 e!137045)))

(declare-fun c!35585 () Bool)

(assert (=> b!210463 (= c!35585 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!210464 () Bool)

(assert (=> b!210464 (= e!137045 (= call!19887 call!19888))))

(declare-fun bm!19885 () Bool)

(assert (=> bm!19885 (= call!19887 (getCurrentListMapNoExtraKeys!483 _keys!825 (array!9998 (store (arr!4747 _values!649) i!601 (ValueCellFull!2357 v!520)) (size!5072 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58031 res!102684) b!210463))

(assert (= (and b!210463 c!35585) b!210462))

(assert (= (and b!210463 (not c!35585)) b!210464))

(assert (= (or b!210462 b!210464) bm!19885))

(assert (= (or b!210462 b!210464) bm!19884))

(declare-fun m!238111 () Bool)

(assert (=> b!210462 m!238111))

(declare-fun m!238113 () Bool)

(assert (=> d!58031 m!238113))

(assert (=> bm!19884 m!237833))

(assert (=> bm!19885 m!237825))

(declare-fun m!238115 () Bool)

(assert (=> bm!19885 m!238115))

(assert (=> b!210221 d!58031))

(declare-fun b!210465 () Bool)

(declare-fun e!137047 () Bool)

(declare-fun e!137049 () Bool)

(assert (=> b!210465 (= e!137047 e!137049)))

(assert (=> b!210465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun res!102686 () Bool)

(declare-fun lt!107830 () ListLongMap!3009)

(assert (=> b!210465 (= res!102686 (contains!1379 lt!107830 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210465 (=> (not res!102686) (not e!137049))))

(declare-fun b!210466 () Bool)

(assert (=> b!210466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> b!210466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5072 lt!107633)))))

(assert (=> b!210466 (= e!137049 (= (apply!191 lt!107830 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2553 (select (arr!4747 lt!107633) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210467 () Bool)

(declare-fun e!137052 () ListLongMap!3009)

(declare-fun e!137050 () ListLongMap!3009)

(assert (=> b!210467 (= e!137052 e!137050)))

(declare-fun c!35587 () Bool)

(assert (=> b!210467 (= c!35587 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210468 () Bool)

(declare-fun e!137051 () Bool)

(assert (=> b!210468 (= e!137047 e!137051)))

(declare-fun c!35589 () Bool)

(assert (=> b!210468 (= c!35589 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210469 () Bool)

(assert (=> b!210469 (= e!137051 (= lt!107830 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210470 () Bool)

(assert (=> b!210470 (= e!137051 (isEmpty!498 lt!107830))))

(declare-fun b!210471 () Bool)

(declare-fun e!137053 () Bool)

(assert (=> b!210471 (= e!137053 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210471 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210473 () Bool)

(declare-fun res!102688 () Bool)

(declare-fun e!137048 () Bool)

(assert (=> b!210473 (=> (not res!102688) (not e!137048))))

(assert (=> b!210473 (= res!102688 (not (contains!1379 lt!107830 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!210474 () Bool)

(declare-fun lt!107832 () Unit!6378)

(declare-fun lt!107834 () Unit!6378)

(assert (=> b!210474 (= lt!107832 lt!107834)))

(declare-fun lt!107836 () (_ BitVec 64))

(declare-fun lt!107833 () V!6849)

(declare-fun lt!107835 () ListLongMap!3009)

(declare-fun lt!107831 () (_ BitVec 64))

(assert (=> b!210474 (not (contains!1379 (+!549 lt!107835 (tuple2!4095 lt!107831 lt!107833)) lt!107836))))

(assert (=> b!210474 (= lt!107834 (addStillNotContains!102 lt!107835 lt!107831 lt!107833 lt!107836))))

(assert (=> b!210474 (= lt!107836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210474 (= lt!107833 (get!2553 (select (arr!4747 lt!107633) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210474 (= lt!107831 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19889 () ListLongMap!3009)

(assert (=> b!210474 (= lt!107835 call!19889)))

(assert (=> b!210474 (= e!137050 (+!549 call!19889 (tuple2!4095 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) (get!2553 (select (arr!4747 lt!107633) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210475 () Bool)

(assert (=> b!210475 (= e!137048 e!137047)))

(declare-fun c!35586 () Bool)

(assert (=> b!210475 (= c!35586 e!137053)))

(declare-fun res!102687 () Bool)

(assert (=> b!210475 (=> (not res!102687) (not e!137053))))

(assert (=> b!210475 (= res!102687 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210476 () Bool)

(assert (=> b!210476 (= e!137050 call!19889)))

(declare-fun bm!19886 () Bool)

(assert (=> bm!19886 (= call!19889 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58033 () Bool)

(assert (=> d!58033 e!137048))

(declare-fun res!102685 () Bool)

(assert (=> d!58033 (=> (not res!102685) (not e!137048))))

(assert (=> d!58033 (= res!102685 (not (contains!1379 lt!107830 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58033 (= lt!107830 e!137052)))

(declare-fun c!35588 () Bool)

(assert (=> d!58033 (= c!35588 (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58033 (validMask!0 mask!1149)))

(assert (=> d!58033 (= (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107830)))

(declare-fun b!210472 () Bool)

(assert (=> b!210472 (= e!137052 (ListLongMap!3010 Nil!2977))))

(assert (= (and d!58033 c!35588) b!210472))

(assert (= (and d!58033 (not c!35588)) b!210467))

(assert (= (and b!210467 c!35587) b!210474))

(assert (= (and b!210467 (not c!35587)) b!210476))

(assert (= (or b!210474 b!210476) bm!19886))

(assert (= (and d!58033 res!102685) b!210473))

(assert (= (and b!210473 res!102688) b!210475))

(assert (= (and b!210475 res!102687) b!210471))

(assert (= (and b!210475 c!35586) b!210465))

(assert (= (and b!210475 (not c!35586)) b!210468))

(assert (= (and b!210465 res!102686) b!210466))

(assert (= (and b!210468 c!35589) b!210469))

(assert (= (and b!210468 (not c!35589)) b!210470))

(declare-fun b_lambda!7615 () Bool)

(assert (=> (not b_lambda!7615) (not b!210466)))

(assert (=> b!210466 t!7911))

(declare-fun b_and!12335 () Bool)

(assert (= b_and!12333 (and (=> t!7911 result!4965) b_and!12335)))

(declare-fun b_lambda!7617 () Bool)

(assert (=> (not b_lambda!7617) (not b!210474)))

(assert (=> b!210474 t!7911))

(declare-fun b_and!12337 () Bool)

(assert (= b_and!12335 (and (=> t!7911 result!4965) b_and!12337)))

(assert (=> b!210467 m!237935))

(assert (=> b!210467 m!237935))

(assert (=> b!210467 m!237937))

(assert (=> b!210471 m!237935))

(assert (=> b!210471 m!237935))

(assert (=> b!210471 m!237937))

(declare-fun m!238117 () Bool)

(assert (=> b!210469 m!238117))

(declare-fun m!238119 () Bool)

(assert (=> b!210470 m!238119))

(declare-fun m!238121 () Bool)

(assert (=> b!210474 m!238121))

(declare-fun m!238123 () Bool)

(assert (=> b!210474 m!238123))

(assert (=> b!210474 m!238041))

(assert (=> b!210474 m!238043))

(assert (=> b!210474 m!238045))

(declare-fun m!238125 () Bool)

(assert (=> b!210474 m!238125))

(assert (=> b!210474 m!237935))

(assert (=> b!210474 m!238041))

(assert (=> b!210474 m!238043))

(assert (=> b!210474 m!238121))

(declare-fun m!238127 () Bool)

(assert (=> b!210474 m!238127))

(declare-fun m!238129 () Bool)

(assert (=> d!58033 m!238129))

(assert (=> d!58033 m!237815))

(declare-fun m!238131 () Bool)

(assert (=> b!210473 m!238131))

(assert (=> bm!19886 m!238117))

(assert (=> b!210466 m!238043))

(assert (=> b!210466 m!237935))

(declare-fun m!238133 () Bool)

(assert (=> b!210466 m!238133))

(assert (=> b!210466 m!238041))

(assert (=> b!210466 m!238043))

(assert (=> b!210466 m!238045))

(assert (=> b!210466 m!237935))

(assert (=> b!210466 m!238041))

(assert (=> b!210465 m!237935))

(assert (=> b!210465 m!237935))

(declare-fun m!238135 () Bool)

(assert (=> b!210465 m!238135))

(assert (=> b!210221 d!58033))

(declare-fun b!210477 () Bool)

(declare-fun e!137066 () Bool)

(declare-fun call!19891 () Bool)

(assert (=> b!210477 (= e!137066 (not call!19891))))

(declare-fun b!210478 () Bool)

(declare-fun e!137055 () ListLongMap!3009)

(declare-fun call!19890 () ListLongMap!3009)

(assert (=> b!210478 (= e!137055 call!19890)))

(declare-fun bm!19887 () Bool)

(declare-fun call!19893 () ListLongMap!3009)

(assert (=> bm!19887 (= call!19890 call!19893)))

(declare-fun b!210479 () Bool)

(declare-fun call!19894 () ListLongMap!3009)

(assert (=> b!210479 (= e!137055 call!19894)))

(declare-fun b!210480 () Bool)

(declare-fun e!137058 () Bool)

(declare-fun lt!107844 () ListLongMap!3009)

(assert (=> b!210480 (= e!137058 (= (apply!191 lt!107844 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210481 () Bool)

(declare-fun e!137056 () Bool)

(declare-fun e!137060 () Bool)

(assert (=> b!210481 (= e!137056 e!137060)))

(declare-fun res!102692 () Bool)

(declare-fun call!19896 () Bool)

(assert (=> b!210481 (= res!102692 call!19896)))

(assert (=> b!210481 (=> (not res!102692) (not e!137060))))

(declare-fun b!210482 () Bool)

(declare-fun e!137054 () ListLongMap!3009)

(assert (=> b!210482 (= e!137054 call!19890)))

(declare-fun b!210483 () Bool)

(declare-fun e!137064 () ListLongMap!3009)

(assert (=> b!210483 (= e!137064 e!137054)))

(declare-fun c!35595 () Bool)

(assert (=> b!210483 (= c!35595 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!19892 () ListLongMap!3009)

(declare-fun c!35590 () Bool)

(declare-fun bm!19888 () Bool)

(declare-fun call!19895 () ListLongMap!3009)

(assert (=> bm!19888 (= call!19893 (+!549 (ite c!35590 call!19895 (ite c!35595 call!19892 call!19894)) (ite (or c!35590 c!35595) (tuple2!4095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210484 () Bool)

(declare-fun res!102697 () Bool)

(declare-fun e!137065 () Bool)

(assert (=> b!210484 (=> (not res!102697) (not e!137065))))

(assert (=> b!210484 (= res!102697 e!137056)))

(declare-fun c!35592 () Bool)

(assert (=> b!210484 (= c!35592 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19889 () Bool)

(assert (=> bm!19889 (= call!19891 (contains!1379 lt!107844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210485 () Bool)

(declare-fun c!35593 () Bool)

(assert (=> b!210485 (= c!35593 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210485 (= e!137054 e!137055)))

(declare-fun b!210486 () Bool)

(declare-fun e!137063 () Unit!6378)

(declare-fun lt!107847 () Unit!6378)

(assert (=> b!210486 (= e!137063 lt!107847)))

(declare-fun lt!107856 () ListLongMap!3009)

(assert (=> b!210486 (= lt!107856 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107851 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107853 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107853 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107857 () Unit!6378)

(assert (=> b!210486 (= lt!107857 (addStillContains!167 lt!107856 lt!107851 zeroValue!615 lt!107853))))

(assert (=> b!210486 (contains!1379 (+!549 lt!107856 (tuple2!4095 lt!107851 zeroValue!615)) lt!107853)))

(declare-fun lt!107837 () Unit!6378)

(assert (=> b!210486 (= lt!107837 lt!107857)))

(declare-fun lt!107858 () ListLongMap!3009)

(assert (=> b!210486 (= lt!107858 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107855 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107855 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107854 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107854 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107843 () Unit!6378)

(assert (=> b!210486 (= lt!107843 (addApplyDifferent!167 lt!107858 lt!107855 minValue!615 lt!107854))))

(assert (=> b!210486 (= (apply!191 (+!549 lt!107858 (tuple2!4095 lt!107855 minValue!615)) lt!107854) (apply!191 lt!107858 lt!107854))))

(declare-fun lt!107840 () Unit!6378)

(assert (=> b!210486 (= lt!107840 lt!107843)))

(declare-fun lt!107846 () ListLongMap!3009)

(assert (=> b!210486 (= lt!107846 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107850 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107838 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107838 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107841 () Unit!6378)

(assert (=> b!210486 (= lt!107841 (addApplyDifferent!167 lt!107846 lt!107850 zeroValue!615 lt!107838))))

(assert (=> b!210486 (= (apply!191 (+!549 lt!107846 (tuple2!4095 lt!107850 zeroValue!615)) lt!107838) (apply!191 lt!107846 lt!107838))))

(declare-fun lt!107849 () Unit!6378)

(assert (=> b!210486 (= lt!107849 lt!107841)))

(declare-fun lt!107848 () ListLongMap!3009)

(assert (=> b!210486 (= lt!107848 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107852 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107842 () (_ BitVec 64))

(assert (=> b!210486 (= lt!107842 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210486 (= lt!107847 (addApplyDifferent!167 lt!107848 lt!107852 minValue!615 lt!107842))))

(assert (=> b!210486 (= (apply!191 (+!549 lt!107848 (tuple2!4095 lt!107852 minValue!615)) lt!107842) (apply!191 lt!107848 lt!107842))))

(declare-fun b!210487 () Bool)

(assert (=> b!210487 (= e!137064 (+!549 call!19893 (tuple2!4095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19890 () Bool)

(assert (=> bm!19890 (= call!19892 call!19895)))

(declare-fun e!137057 () Bool)

(declare-fun b!210488 () Bool)

(assert (=> b!210488 (= e!137057 (= (apply!191 lt!107844 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2553 (select (arr!4747 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5072 _values!649)))))

(assert (=> b!210488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun bm!19891 () Bool)

(assert (=> bm!19891 (= call!19895 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19892 () Bool)

(assert (=> bm!19892 (= call!19894 call!19892)))

(declare-fun b!210489 () Bool)

(declare-fun e!137062 () Bool)

(assert (=> b!210489 (= e!137062 e!137057)))

(declare-fun res!102689 () Bool)

(assert (=> b!210489 (=> (not res!102689) (not e!137057))))

(assert (=> b!210489 (= res!102689 (contains!1379 lt!107844 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun b!210490 () Bool)

(assert (=> b!210490 (= e!137060 (= (apply!191 lt!107844 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210491 () Bool)

(assert (=> b!210491 (= e!137066 e!137058)))

(declare-fun res!102693 () Bool)

(assert (=> b!210491 (= res!102693 call!19891)))

(assert (=> b!210491 (=> (not res!102693) (not e!137058))))

(declare-fun b!210492 () Bool)

(declare-fun res!102696 () Bool)

(assert (=> b!210492 (=> (not res!102696) (not e!137065))))

(assert (=> b!210492 (= res!102696 e!137062)))

(declare-fun res!102691 () Bool)

(assert (=> b!210492 (=> res!102691 e!137062)))

(declare-fun e!137059 () Bool)

(assert (=> b!210492 (= res!102691 (not e!137059))))

(declare-fun res!102694 () Bool)

(assert (=> b!210492 (=> (not res!102694) (not e!137059))))

(assert (=> b!210492 (= res!102694 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(declare-fun d!58035 () Bool)

(assert (=> d!58035 e!137065))

(declare-fun res!102690 () Bool)

(assert (=> d!58035 (=> (not res!102690) (not e!137065))))

(assert (=> d!58035 (= res!102690 (or (bvsge #b00000000000000000000000000000000 (size!5073 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))))

(declare-fun lt!107839 () ListLongMap!3009)

(assert (=> d!58035 (= lt!107844 lt!107839)))

(declare-fun lt!107845 () Unit!6378)

(assert (=> d!58035 (= lt!107845 e!137063)))

(declare-fun c!35591 () Bool)

(declare-fun e!137061 () Bool)

(assert (=> d!58035 (= c!35591 e!137061)))

(declare-fun res!102695 () Bool)

(assert (=> d!58035 (=> (not res!102695) (not e!137061))))

(assert (=> d!58035 (= res!102695 (bvslt #b00000000000000000000000000000000 (size!5073 _keys!825)))))

(assert (=> d!58035 (= lt!107839 e!137064)))

(assert (=> d!58035 (= c!35590 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58035 (validMask!0 mask!1149)))

(assert (=> d!58035 (= (getCurrentListMap!1060 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107844)))

(declare-fun b!210493 () Bool)

(assert (=> b!210493 (= e!137056 (not call!19896))))

(declare-fun b!210494 () Bool)

(assert (=> b!210494 (= e!137065 e!137066)))

(declare-fun c!35594 () Bool)

(assert (=> b!210494 (= c!35594 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210495 () Bool)

(assert (=> b!210495 (= e!137059 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19893 () Bool)

(assert (=> bm!19893 (= call!19896 (contains!1379 lt!107844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210496 () Bool)

(declare-fun Unit!6381 () Unit!6378)

(assert (=> b!210496 (= e!137063 Unit!6381)))

(declare-fun b!210497 () Bool)

(assert (=> b!210497 (= e!137061 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58035 c!35590) b!210487))

(assert (= (and d!58035 (not c!35590)) b!210483))

(assert (= (and b!210483 c!35595) b!210482))

(assert (= (and b!210483 (not c!35595)) b!210485))

(assert (= (and b!210485 c!35593) b!210478))

(assert (= (and b!210485 (not c!35593)) b!210479))

(assert (= (or b!210478 b!210479) bm!19892))

(assert (= (or b!210482 bm!19892) bm!19890))

(assert (= (or b!210482 b!210478) bm!19887))

(assert (= (or b!210487 bm!19890) bm!19891))

(assert (= (or b!210487 bm!19887) bm!19888))

(assert (= (and d!58035 res!102695) b!210497))

(assert (= (and d!58035 c!35591) b!210486))

(assert (= (and d!58035 (not c!35591)) b!210496))

(assert (= (and d!58035 res!102690) b!210492))

(assert (= (and b!210492 res!102694) b!210495))

(assert (= (and b!210492 (not res!102691)) b!210489))

(assert (= (and b!210489 res!102689) b!210488))

(assert (= (and b!210492 res!102696) b!210484))

(assert (= (and b!210484 c!35592) b!210481))

(assert (= (and b!210484 (not c!35592)) b!210493))

(assert (= (and b!210481 res!102692) b!210490))

(assert (= (or b!210481 b!210493) bm!19893))

(assert (= (and b!210484 res!102697) b!210494))

(assert (= (and b!210494 c!35594) b!210491))

(assert (= (and b!210494 (not c!35594)) b!210477))

(assert (= (and b!210491 res!102693) b!210480))

(assert (= (or b!210491 b!210477) bm!19889))

(declare-fun b_lambda!7619 () Bool)

(assert (=> (not b_lambda!7619) (not b!210488)))

(assert (=> b!210488 t!7911))

(declare-fun b_and!12339 () Bool)

(assert (= b_and!12337 (and (=> t!7911 result!4965) b_and!12339)))

(assert (=> b!210497 m!237935))

(assert (=> b!210497 m!237935))

(assert (=> b!210497 m!237937))

(declare-fun m!238137 () Bool)

(assert (=> bm!19889 m!238137))

(declare-fun m!238139 () Bool)

(assert (=> bm!19888 m!238139))

(declare-fun m!238141 () Bool)

(assert (=> b!210487 m!238141))

(assert (=> b!210488 m!238095))

(assert (=> b!210488 m!238043))

(assert (=> b!210488 m!238097))

(assert (=> b!210488 m!238095))

(assert (=> b!210488 m!237935))

(assert (=> b!210488 m!238043))

(assert (=> b!210488 m!237935))

(declare-fun m!238143 () Bool)

(assert (=> b!210488 m!238143))

(declare-fun m!238145 () Bool)

(assert (=> bm!19893 m!238145))

(declare-fun m!238147 () Bool)

(assert (=> b!210486 m!238147))

(declare-fun m!238149 () Bool)

(assert (=> b!210486 m!238149))

(assert (=> b!210486 m!237935))

(assert (=> b!210486 m!237833))

(declare-fun m!238151 () Bool)

(assert (=> b!210486 m!238151))

(declare-fun m!238153 () Bool)

(assert (=> b!210486 m!238153))

(declare-fun m!238155 () Bool)

(assert (=> b!210486 m!238155))

(declare-fun m!238157 () Bool)

(assert (=> b!210486 m!238157))

(assert (=> b!210486 m!238149))

(declare-fun m!238159 () Bool)

(assert (=> b!210486 m!238159))

(declare-fun m!238161 () Bool)

(assert (=> b!210486 m!238161))

(declare-fun m!238163 () Bool)

(assert (=> b!210486 m!238163))

(declare-fun m!238165 () Bool)

(assert (=> b!210486 m!238165))

(declare-fun m!238167 () Bool)

(assert (=> b!210486 m!238167))

(declare-fun m!238169 () Bool)

(assert (=> b!210486 m!238169))

(assert (=> b!210486 m!238155))

(declare-fun m!238171 () Bool)

(assert (=> b!210486 m!238171))

(declare-fun m!238173 () Bool)

(assert (=> b!210486 m!238173))

(declare-fun m!238175 () Bool)

(assert (=> b!210486 m!238175))

(assert (=> b!210486 m!238163))

(assert (=> b!210486 m!238173))

(assert (=> b!210489 m!237935))

(assert (=> b!210489 m!237935))

(declare-fun m!238177 () Bool)

(assert (=> b!210489 m!238177))

(assert (=> b!210495 m!237935))

(assert (=> b!210495 m!237935))

(assert (=> b!210495 m!237937))

(assert (=> d!58035 m!237815))

(assert (=> bm!19891 m!237833))

(declare-fun m!238179 () Bool)

(assert (=> b!210490 m!238179))

(declare-fun m!238181 () Bool)

(assert (=> b!210480 m!238181))

(assert (=> b!210221 d!58035))

(declare-fun b!210504 () Bool)

(declare-fun e!137071 () Bool)

(assert (=> b!210504 (= e!137071 tp_is_empty!5401)))

(declare-fun condMapEmpty!9185 () Bool)

(declare-fun mapDefault!9185 () ValueCell!2357)

(assert (=> mapNonEmpty!9176 (= condMapEmpty!9185 (= mapRest!9176 ((as const (Array (_ BitVec 32) ValueCell!2357)) mapDefault!9185)))))

(declare-fun e!137072 () Bool)

(declare-fun mapRes!9185 () Bool)

(assert (=> mapNonEmpty!9176 (= tp!19663 (and e!137072 mapRes!9185))))

(declare-fun b!210505 () Bool)

(assert (=> b!210505 (= e!137072 tp_is_empty!5401)))

(declare-fun mapIsEmpty!9185 () Bool)

(assert (=> mapIsEmpty!9185 mapRes!9185))

(declare-fun mapNonEmpty!9185 () Bool)

(declare-fun tp!19679 () Bool)

(assert (=> mapNonEmpty!9185 (= mapRes!9185 (and tp!19679 e!137071))))

(declare-fun mapKey!9185 () (_ BitVec 32))

(declare-fun mapRest!9185 () (Array (_ BitVec 32) ValueCell!2357))

(declare-fun mapValue!9185 () ValueCell!2357)

(assert (=> mapNonEmpty!9185 (= mapRest!9176 (store mapRest!9185 mapKey!9185 mapValue!9185))))

(assert (= (and mapNonEmpty!9176 condMapEmpty!9185) mapIsEmpty!9185))

(assert (= (and mapNonEmpty!9176 (not condMapEmpty!9185)) mapNonEmpty!9185))

(assert (= (and mapNonEmpty!9185 ((_ is ValueCellFull!2357) mapValue!9185)) b!210504))

(assert (= (and mapNonEmpty!9176 ((_ is ValueCellFull!2357) mapDefault!9185)) b!210505))

(declare-fun m!238183 () Bool)

(assert (=> mapNonEmpty!9185 m!238183))

(declare-fun b_lambda!7621 () Bool)

(assert (= b_lambda!7615 (or (and start!20930 b_free!5539) b_lambda!7621)))

(declare-fun b_lambda!7623 () Bool)

(assert (= b_lambda!7619 (or (and start!20930 b_free!5539) b_lambda!7623)))

(declare-fun b_lambda!7625 () Bool)

(assert (= b_lambda!7613 (or (and start!20930 b_free!5539) b_lambda!7625)))

(declare-fun b_lambda!7627 () Bool)

(assert (= b_lambda!7611 (or (and start!20930 b_free!5539) b_lambda!7627)))

(declare-fun b_lambda!7629 () Bool)

(assert (= b_lambda!7609 (or (and start!20930 b_free!5539) b_lambda!7629)))

(declare-fun b_lambda!7631 () Bool)

(assert (= b_lambda!7617 (or (and start!20930 b_free!5539) b_lambda!7631)))

(check-sat (not bm!19852) (not b!210497) (not b!210495) (not bm!19889) (not b_lambda!7623) (not b!210470) (not d!58025) (not d!58023) (not bm!19888) (not bm!19871) (not d!58029) (not b!210336) (not bm!19886) (not b!210350) (not b!210353) (not d!58021) (not b!210335) (not b!210489) (not b_lambda!7621) (not bm!19874) (not b!210352) (not bm!19855) (not d!58031) (not b!210354) (not b!210473) (not b!210348) (not b!210406) (not b!210467) (not b!210490) (not b!210324) b_and!12339 (not b!210471) (not b!210465) (not b!210450) (not b!210410) (not b!210448) (not b_lambda!7629) (not b!210488) (not b!210480) (not bm!19884) (not b!210462) (not b!210474) (not bm!19876) (not b_lambda!7625) (not d!58015) (not b!210409) (not b!210323) (not d!58011) (not b!210415) (not d!58013) tp_is_empty!5401 (not b!210331) (not b!210444) (not b!210332) (not b!210469) (not b!210400) (not b_next!5539) (not b!210407) (not bm!19885) (not b_lambda!7631) (not b!210333) (not bm!19879) (not b_lambda!7627) (not b!210334) (not bm!19891) (not b!210445) (not b!210486) (not bm!19872) (not b!210408) (not b!210417) (not b!210330) (not b!210453) (not b!210329) (not b!210446) (not b!210349) (not bm!19893) (not b!210351) (not d!58035) (not b!210487) (not mapNonEmpty!9185) (not d!58027) (not b!210345) (not d!58017) (not b!210466) (not b!210322) (not d!58033) (not b!210449) (not b!210452))
(check-sat b_and!12339 (not b_next!5539))
