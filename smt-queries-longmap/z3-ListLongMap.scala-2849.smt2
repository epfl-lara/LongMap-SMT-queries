; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41088 () Bool)

(assert start!41088)

(declare-fun b_free!10993 () Bool)

(declare-fun b_next!10993 () Bool)

(assert (=> start!41088 (= b_free!10993 (not b_next!10993))))

(declare-fun tp!38811 () Bool)

(declare-fun b_and!19183 () Bool)

(assert (=> start!41088 (= tp!38811 b_and!19183)))

(declare-fun mapNonEmpty!20143 () Bool)

(declare-fun mapRes!20143 () Bool)

(declare-fun tp!38812 () Bool)

(declare-fun e!267510 () Bool)

(assert (=> mapNonEmpty!20143 (= mapRes!20143 (and tp!38812 e!267510))))

(declare-datatypes ((V!17547 0))(
  ( (V!17548 (val!6210 Int)) )
))
(declare-datatypes ((ValueCell!5822 0))(
  ( (ValueCellFull!5822 (v!8478 V!17547)) (EmptyCell!5822) )
))
(declare-fun mapRest!20143 () (Array (_ BitVec 32) ValueCell!5822))

(declare-fun mapKey!20143 () (_ BitVec 32))

(declare-datatypes ((array!28457 0))(
  ( (array!28458 (arr!13670 (Array (_ BitVec 32) ValueCell!5822)) (size!14023 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28457)

(declare-fun mapValue!20143 () ValueCell!5822)

(assert (=> mapNonEmpty!20143 (= (arr!13670 _values!549) (store mapRest!20143 mapKey!20143 mapValue!20143))))

(declare-fun b!458232 () Bool)

(declare-fun res!273793 () Bool)

(declare-fun e!267518 () Bool)

(assert (=> b!458232 (=> (not res!273793) (not e!267518))))

(declare-datatypes ((array!28459 0))(
  ( (array!28460 (arr!13671 (Array (_ BitVec 32) (_ BitVec 64))) (size!14024 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28459)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458232 (= res!273793 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458233 () Bool)

(declare-fun res!273785 () Bool)

(assert (=> b!458233 (=> (not res!273785) (not e!267518))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!458233 (= res!273785 (and (= (size!14023 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14024 _keys!709) (size!14023 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458234 () Bool)

(declare-fun e!267511 () Bool)

(declare-fun e!267517 () Bool)

(assert (=> b!458234 (= e!267511 (and e!267517 mapRes!20143))))

(declare-fun condMapEmpty!20143 () Bool)

(declare-fun mapDefault!20143 () ValueCell!5822)

(assert (=> b!458234 (= condMapEmpty!20143 (= (arr!13670 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5822)) mapDefault!20143)))))

(declare-fun mapIsEmpty!20143 () Bool)

(assert (=> mapIsEmpty!20143 mapRes!20143))

(declare-fun b!458235 () Bool)

(declare-fun res!273787 () Bool)

(assert (=> b!458235 (=> (not res!273787) (not e!267518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28459 (_ BitVec 32)) Bool)

(assert (=> b!458235 (= res!273787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458236 () Bool)

(declare-fun e!267514 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!458236 (= e!267514 (arrayContainsKey!0 _keys!709 k0!794 from!863))))

(declare-fun b!458237 () Bool)

(declare-fun res!273791 () Bool)

(assert (=> b!458237 (=> (not res!273791) (not e!267518))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458237 (= res!273791 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14024 _keys!709))))))

(declare-fun b!458238 () Bool)

(declare-fun e!267515 () Bool)

(assert (=> b!458238 (= e!267518 e!267515)))

(declare-fun res!273797 () Bool)

(assert (=> b!458238 (=> (not res!273797) (not e!267515))))

(declare-fun lt!207168 () array!28459)

(assert (=> b!458238 (= res!273797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207168 mask!1025))))

(assert (=> b!458238 (= lt!207168 (array!28460 (store (arr!13671 _keys!709) i!563 k0!794) (size!14024 _keys!709)))))

(declare-fun b!458239 () Bool)

(declare-fun res!273786 () Bool)

(assert (=> b!458239 (=> (not res!273786) (not e!267515))))

(assert (=> b!458239 (= res!273786 (bvsle from!863 i!563))))

(declare-fun b!458240 () Bool)

(declare-fun res!273799 () Bool)

(assert (=> b!458240 (=> (not res!273799) (not e!267518))))

(declare-datatypes ((List!8276 0))(
  ( (Nil!8273) (Cons!8272 (h!9128 (_ BitVec 64)) (t!14139 List!8276)) )
))
(declare-fun arrayNoDuplicates!0 (array!28459 (_ BitVec 32) List!8276) Bool)

(assert (=> b!458240 (= res!273799 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8273))))

(declare-fun b!458241 () Bool)

(declare-fun tp_is_empty!12331 () Bool)

(assert (=> b!458241 (= e!267510 tp_is_empty!12331)))

(declare-fun b!458242 () Bool)

(declare-fun e!267512 () Bool)

(declare-fun e!267516 () Bool)

(assert (=> b!458242 (= e!267512 (not e!267516))))

(declare-fun res!273794 () Bool)

(assert (=> b!458242 (=> res!273794 e!267516)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458242 (= res!273794 (not (validKeyInArray!0 (select (arr!13671 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8212 0))(
  ( (tuple2!8213 (_1!4117 (_ BitVec 64)) (_2!4117 V!17547)) )
))
(declare-datatypes ((List!8277 0))(
  ( (Nil!8274) (Cons!8273 (h!9129 tuple2!8212) (t!14140 List!8277)) )
))
(declare-datatypes ((ListLongMap!7115 0))(
  ( (ListLongMap!7116 (toList!3573 List!8277)) )
))
(declare-fun lt!207172 () ListLongMap!7115)

(declare-fun lt!207175 () ListLongMap!7115)

(assert (=> b!458242 (= lt!207172 lt!207175)))

(declare-fun lt!207169 () ListLongMap!7115)

(declare-fun v!412 () V!17547)

(declare-fun +!1626 (ListLongMap!7115 tuple2!8212) ListLongMap!7115)

(assert (=> b!458242 (= lt!207175 (+!1626 lt!207169 (tuple2!8213 k0!794 v!412)))))

(declare-fun minValue!515 () V!17547)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17547)

(declare-fun lt!207174 () array!28457)

(declare-fun getCurrentListMapNoExtraKeys!1767 (array!28459 array!28457 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) Int) ListLongMap!7115)

(assert (=> b!458242 (= lt!207172 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458242 (= lt!207169 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13295 0))(
  ( (Unit!13296) )
))
(declare-fun lt!207170 () Unit!13295)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 (array!28459 array!28457 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) (_ BitVec 64) V!17547 (_ BitVec 32) Int) Unit!13295)

(assert (=> b!458242 (= lt!207170 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458243 () Bool)

(declare-fun res!273788 () Bool)

(assert (=> b!458243 (=> (not res!273788) (not e!267515))))

(assert (=> b!458243 (= res!273788 (arrayNoDuplicates!0 lt!207168 #b00000000000000000000000000000000 Nil!8273))))

(declare-fun res!273792 () Bool)

(assert (=> start!41088 (=> (not res!273792) (not e!267518))))

(assert (=> start!41088 (= res!273792 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14024 _keys!709))))))

(assert (=> start!41088 e!267518))

(assert (=> start!41088 tp_is_empty!12331))

(assert (=> start!41088 tp!38811))

(assert (=> start!41088 true))

(declare-fun array_inv!9956 (array!28457) Bool)

(assert (=> start!41088 (and (array_inv!9956 _values!549) e!267511)))

(declare-fun array_inv!9957 (array!28459) Bool)

(assert (=> start!41088 (array_inv!9957 _keys!709)))

(declare-fun b!458244 () Bool)

(declare-fun res!273795 () Bool)

(assert (=> b!458244 (=> (not res!273795) (not e!267518))))

(assert (=> b!458244 (= res!273795 (or (= (select (arr!13671 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13671 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458245 () Bool)

(assert (=> b!458245 (= e!267517 tp_is_empty!12331)))

(declare-fun b!458246 () Bool)

(assert (=> b!458246 (= e!267515 e!267512)))

(declare-fun res!273789 () Bool)

(assert (=> b!458246 (=> (not res!273789) (not e!267512))))

(assert (=> b!458246 (= res!273789 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207171 () ListLongMap!7115)

(assert (=> b!458246 (= lt!207171 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458246 (= lt!207174 (array!28458 (store (arr!13670 _values!549) i!563 (ValueCellFull!5822 v!412)) (size!14023 _values!549)))))

(declare-fun lt!207173 () ListLongMap!7115)

(assert (=> b!458246 (= lt!207173 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458247 () Bool)

(declare-fun res!273790 () Bool)

(assert (=> b!458247 (=> (not res!273790) (not e!267518))))

(assert (=> b!458247 (= res!273790 (validKeyInArray!0 k0!794))))

(declare-fun b!458248 () Bool)

(declare-fun res!273798 () Bool)

(assert (=> b!458248 (=> (not res!273798) (not e!267518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458248 (= res!273798 (validMask!0 mask!1025))))

(declare-fun b!458249 () Bool)

(assert (=> b!458249 (= e!267516 e!267514)))

(declare-fun res!273796 () Bool)

(assert (=> b!458249 (=> res!273796 e!267514)))

(assert (=> b!458249 (= res!273796 (or (not (= (select (arr!13671 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14024 _keys!709)) (bvsge (size!14024 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun get!6740 (ValueCell!5822 V!17547) V!17547)

(declare-fun dynLambda!887 (Int (_ BitVec 64)) V!17547)

(assert (=> b!458249 (= lt!207171 (+!1626 lt!207175 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!41088 res!273792) b!458248))

(assert (= (and b!458248 res!273798) b!458233))

(assert (= (and b!458233 res!273785) b!458235))

(assert (= (and b!458235 res!273787) b!458240))

(assert (= (and b!458240 res!273799) b!458237))

(assert (= (and b!458237 res!273791) b!458247))

(assert (= (and b!458247 res!273790) b!458244))

(assert (= (and b!458244 res!273795) b!458232))

(assert (= (and b!458232 res!273793) b!458238))

(assert (= (and b!458238 res!273797) b!458243))

(assert (= (and b!458243 res!273788) b!458239))

(assert (= (and b!458239 res!273786) b!458246))

(assert (= (and b!458246 res!273789) b!458242))

(assert (= (and b!458242 (not res!273794)) b!458249))

(assert (= (and b!458249 (not res!273796)) b!458236))

(assert (= (and b!458234 condMapEmpty!20143) mapIsEmpty!20143))

(assert (= (and b!458234 (not condMapEmpty!20143)) mapNonEmpty!20143))

(get-info :version)

(assert (= (and mapNonEmpty!20143 ((_ is ValueCellFull!5822) mapValue!20143)) b!458241))

(assert (= (and b!458234 ((_ is ValueCellFull!5822) mapDefault!20143)) b!458245))

(assert (= start!41088 b!458234))

(declare-fun b_lambda!9775 () Bool)

(assert (=> (not b_lambda!9775) (not b!458249)))

(declare-fun t!14138 () Bool)

(declare-fun tb!3821 () Bool)

(assert (=> (and start!41088 (= defaultEntry!557 defaultEntry!557) t!14138) tb!3821))

(declare-fun result!7193 () Bool)

(assert (=> tb!3821 (= result!7193 tp_is_empty!12331)))

(assert (=> b!458249 t!14138))

(declare-fun b_and!19185 () Bool)

(assert (= b_and!19183 (and (=> t!14138 result!7193) b_and!19185)))

(declare-fun m!441101 () Bool)

(assert (=> b!458236 m!441101))

(declare-fun m!441103 () Bool)

(assert (=> b!458238 m!441103))

(declare-fun m!441105 () Bool)

(assert (=> b!458238 m!441105))

(declare-fun m!441107 () Bool)

(assert (=> b!458246 m!441107))

(declare-fun m!441109 () Bool)

(assert (=> b!458246 m!441109))

(declare-fun m!441111 () Bool)

(assert (=> b!458246 m!441111))

(declare-fun m!441113 () Bool)

(assert (=> mapNonEmpty!20143 m!441113))

(declare-fun m!441115 () Bool)

(assert (=> b!458242 m!441115))

(declare-fun m!441117 () Bool)

(assert (=> b!458242 m!441117))

(declare-fun m!441119 () Bool)

(assert (=> b!458242 m!441119))

(declare-fun m!441121 () Bool)

(assert (=> b!458242 m!441121))

(assert (=> b!458242 m!441115))

(declare-fun m!441123 () Bool)

(assert (=> b!458242 m!441123))

(declare-fun m!441125 () Bool)

(assert (=> b!458242 m!441125))

(declare-fun m!441127 () Bool)

(assert (=> start!41088 m!441127))

(declare-fun m!441129 () Bool)

(assert (=> start!41088 m!441129))

(declare-fun m!441131 () Bool)

(assert (=> b!458235 m!441131))

(declare-fun m!441133 () Bool)

(assert (=> b!458247 m!441133))

(assert (=> b!458249 m!441115))

(declare-fun m!441135 () Bool)

(assert (=> b!458249 m!441135))

(declare-fun m!441137 () Bool)

(assert (=> b!458249 m!441137))

(declare-fun m!441139 () Bool)

(assert (=> b!458249 m!441139))

(assert (=> b!458249 m!441139))

(assert (=> b!458249 m!441137))

(declare-fun m!441141 () Bool)

(assert (=> b!458249 m!441141))

(declare-fun m!441143 () Bool)

(assert (=> b!458248 m!441143))

(declare-fun m!441145 () Bool)

(assert (=> b!458240 m!441145))

(declare-fun m!441147 () Bool)

(assert (=> b!458232 m!441147))

(declare-fun m!441149 () Bool)

(assert (=> b!458244 m!441149))

(declare-fun m!441151 () Bool)

(assert (=> b!458243 m!441151))

(check-sat (not b!458248) (not b_lambda!9775) (not b!458236) b_and!19185 (not b!458242) (not mapNonEmpty!20143) (not b_next!10993) (not b!458246) (not b!458238) (not b!458249) (not b!458240) (not b!458232) (not start!41088) (not b!458235) tp_is_empty!12331 (not b!458243) (not b!458247))
(check-sat b_and!19185 (not b_next!10993))
(get-model)

(declare-fun b_lambda!9781 () Bool)

(assert (= b_lambda!9775 (or (and start!41088 b_free!10993) b_lambda!9781)))

(check-sat (not b_lambda!9781) (not b!458248) (not b!458236) b_and!19185 (not b!458242) (not mapNonEmpty!20143) (not b_next!10993) (not b!458246) (not b!458238) (not b!458249) (not b!458240) (not b!458232) (not start!41088) (not b!458235) tp_is_empty!12331 (not b!458243) (not b!458247))
(check-sat b_and!19185 (not b_next!10993))
(get-model)

(declare-fun d!74545 () Bool)

(assert (=> d!74545 (= (array_inv!9956 _values!549) (bvsge (size!14023 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41088 d!74545))

(declare-fun d!74547 () Bool)

(assert (=> d!74547 (= (array_inv!9957 _keys!709) (bvsge (size!14024 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41088 d!74547))

(declare-fun d!74549 () Bool)

(declare-fun res!273894 () Bool)

(declare-fun e!267579 () Bool)

(assert (=> d!74549 (=> res!273894 e!267579)))

(assert (=> d!74549 (= res!273894 (bvsge #b00000000000000000000000000000000 (size!14024 lt!207168)))))

(assert (=> d!74549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207168 mask!1025) e!267579)))

(declare-fun b!458372 () Bool)

(declare-fun e!267581 () Bool)

(declare-fun call!30109 () Bool)

(assert (=> b!458372 (= e!267581 call!30109)))

(declare-fun b!458373 () Bool)

(declare-fun e!267580 () Bool)

(assert (=> b!458373 (= e!267580 call!30109)))

(declare-fun b!458374 () Bool)

(assert (=> b!458374 (= e!267581 e!267580)))

(declare-fun lt!207231 () (_ BitVec 64))

(assert (=> b!458374 (= lt!207231 (select (arr!13671 lt!207168) #b00000000000000000000000000000000))))

(declare-fun lt!207230 () Unit!13295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28459 (_ BitVec 64) (_ BitVec 32)) Unit!13295)

(assert (=> b!458374 (= lt!207230 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207168 lt!207231 #b00000000000000000000000000000000))))

(assert (=> b!458374 (arrayContainsKey!0 lt!207168 lt!207231 #b00000000000000000000000000000000)))

(declare-fun lt!207232 () Unit!13295)

(assert (=> b!458374 (= lt!207232 lt!207230)))

(declare-fun res!273895 () Bool)

(declare-datatypes ((SeekEntryResult!3530 0))(
  ( (MissingZero!3530 (index!16299 (_ BitVec 32))) (Found!3530 (index!16300 (_ BitVec 32))) (Intermediate!3530 (undefined!4342 Bool) (index!16301 (_ BitVec 32)) (x!42795 (_ BitVec 32))) (Undefined!3530) (MissingVacant!3530 (index!16302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28459 (_ BitVec 32)) SeekEntryResult!3530)

(assert (=> b!458374 (= res!273895 (= (seekEntryOrOpen!0 (select (arr!13671 lt!207168) #b00000000000000000000000000000000) lt!207168 mask!1025) (Found!3530 #b00000000000000000000000000000000)))))

(assert (=> b!458374 (=> (not res!273895) (not e!267580))))

(declare-fun b!458375 () Bool)

(assert (=> b!458375 (= e!267579 e!267581)))

(declare-fun c!56347 () Bool)

(assert (=> b!458375 (= c!56347 (validKeyInArray!0 (select (arr!13671 lt!207168) #b00000000000000000000000000000000)))))

(declare-fun bm!30106 () Bool)

(assert (=> bm!30106 (= call!30109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207168 mask!1025))))

(assert (= (and d!74549 (not res!273894)) b!458375))

(assert (= (and b!458375 c!56347) b!458374))

(assert (= (and b!458375 (not c!56347)) b!458372))

(assert (= (and b!458374 res!273895) b!458373))

(assert (= (or b!458373 b!458372) bm!30106))

(declare-fun m!441257 () Bool)

(assert (=> b!458374 m!441257))

(declare-fun m!441259 () Bool)

(assert (=> b!458374 m!441259))

(declare-fun m!441261 () Bool)

(assert (=> b!458374 m!441261))

(assert (=> b!458374 m!441257))

(declare-fun m!441263 () Bool)

(assert (=> b!458374 m!441263))

(assert (=> b!458375 m!441257))

(assert (=> b!458375 m!441257))

(declare-fun m!441265 () Bool)

(assert (=> b!458375 m!441265))

(declare-fun m!441267 () Bool)

(assert (=> bm!30106 m!441267))

(assert (=> b!458238 d!74549))

(declare-fun d!74551 () Bool)

(assert (=> d!74551 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!458248 d!74551))

(declare-fun d!74553 () Bool)

(assert (=> d!74553 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458247 d!74553))

(declare-fun d!74555 () Bool)

(declare-fun res!273900 () Bool)

(declare-fun e!267586 () Bool)

(assert (=> d!74555 (=> res!273900 e!267586)))

(assert (=> d!74555 (= res!273900 (= (select (arr!13671 _keys!709) from!863) k0!794))))

(assert (=> d!74555 (= (arrayContainsKey!0 _keys!709 k0!794 from!863) e!267586)))

(declare-fun b!458380 () Bool)

(declare-fun e!267587 () Bool)

(assert (=> b!458380 (= e!267586 e!267587)))

(declare-fun res!273901 () Bool)

(assert (=> b!458380 (=> (not res!273901) (not e!267587))))

(assert (=> b!458380 (= res!273901 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!14024 _keys!709)))))

(declare-fun b!458381 () Bool)

(assert (=> b!458381 (= e!267587 (arrayContainsKey!0 _keys!709 k0!794 (bvadd from!863 #b00000000000000000000000000000001)))))

(assert (= (and d!74555 (not res!273900)) b!458380))

(assert (= (and b!458380 res!273901) b!458381))

(assert (=> d!74555 m!441115))

(declare-fun m!441269 () Bool)

(assert (=> b!458381 m!441269))

(assert (=> b!458236 d!74555))

(declare-fun d!74557 () Bool)

(declare-fun res!273902 () Bool)

(declare-fun e!267588 () Bool)

(assert (=> d!74557 (=> res!273902 e!267588)))

(assert (=> d!74557 (= res!273902 (bvsge #b00000000000000000000000000000000 (size!14024 _keys!709)))))

(assert (=> d!74557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267588)))

(declare-fun b!458382 () Bool)

(declare-fun e!267590 () Bool)

(declare-fun call!30110 () Bool)

(assert (=> b!458382 (= e!267590 call!30110)))

(declare-fun b!458383 () Bool)

(declare-fun e!267589 () Bool)

(assert (=> b!458383 (= e!267589 call!30110)))

(declare-fun b!458384 () Bool)

(assert (=> b!458384 (= e!267590 e!267589)))

(declare-fun lt!207234 () (_ BitVec 64))

(assert (=> b!458384 (= lt!207234 (select (arr!13671 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207233 () Unit!13295)

(assert (=> b!458384 (= lt!207233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207234 #b00000000000000000000000000000000))))

(assert (=> b!458384 (arrayContainsKey!0 _keys!709 lt!207234 #b00000000000000000000000000000000)))

(declare-fun lt!207235 () Unit!13295)

(assert (=> b!458384 (= lt!207235 lt!207233)))

(declare-fun res!273903 () Bool)

(assert (=> b!458384 (= res!273903 (= (seekEntryOrOpen!0 (select (arr!13671 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3530 #b00000000000000000000000000000000)))))

(assert (=> b!458384 (=> (not res!273903) (not e!267589))))

(declare-fun b!458385 () Bool)

(assert (=> b!458385 (= e!267588 e!267590)))

(declare-fun c!56348 () Bool)

(assert (=> b!458385 (= c!56348 (validKeyInArray!0 (select (arr!13671 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30107 () Bool)

(assert (=> bm!30107 (= call!30110 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74557 (not res!273902)) b!458385))

(assert (= (and b!458385 c!56348) b!458384))

(assert (= (and b!458385 (not c!56348)) b!458382))

(assert (= (and b!458384 res!273903) b!458383))

(assert (= (or b!458383 b!458382) bm!30107))

(declare-fun m!441271 () Bool)

(assert (=> b!458384 m!441271))

(declare-fun m!441273 () Bool)

(assert (=> b!458384 m!441273))

(declare-fun m!441275 () Bool)

(assert (=> b!458384 m!441275))

(assert (=> b!458384 m!441271))

(declare-fun m!441277 () Bool)

(assert (=> b!458384 m!441277))

(assert (=> b!458385 m!441271))

(assert (=> b!458385 m!441271))

(declare-fun m!441279 () Bool)

(assert (=> b!458385 m!441279))

(declare-fun m!441281 () Bool)

(assert (=> bm!30107 m!441281))

(assert (=> b!458235 d!74557))

(declare-fun b!458410 () Bool)

(declare-fun e!267610 () ListLongMap!7115)

(declare-fun call!30113 () ListLongMap!7115)

(assert (=> b!458410 (= e!267610 call!30113)))

(declare-fun b!458411 () Bool)

(declare-fun res!273912 () Bool)

(declare-fun e!267611 () Bool)

(assert (=> b!458411 (=> (not res!273912) (not e!267611))))

(declare-fun lt!207250 () ListLongMap!7115)

(declare-fun contains!2495 (ListLongMap!7115 (_ BitVec 64)) Bool)

(assert (=> b!458411 (= res!273912 (not (contains!2495 lt!207250 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458412 () Bool)

(declare-fun e!267605 () Bool)

(declare-fun isEmpty!567 (ListLongMap!7115) Bool)

(assert (=> b!458412 (= e!267605 (isEmpty!567 lt!207250))))

(declare-fun b!458413 () Bool)

(declare-fun e!267607 () Bool)

(assert (=> b!458413 (= e!267607 e!267605)))

(declare-fun c!56357 () Bool)

(assert (=> b!458413 (= c!56357 (bvslt from!863 (size!14024 lt!207168)))))

(declare-fun b!458414 () Bool)

(declare-fun lt!207251 () Unit!13295)

(declare-fun lt!207256 () Unit!13295)

(assert (=> b!458414 (= lt!207251 lt!207256)))

(declare-fun lt!207253 () V!17547)

(declare-fun lt!207255 () (_ BitVec 64))

(declare-fun lt!207254 () ListLongMap!7115)

(declare-fun lt!207252 () (_ BitVec 64))

(assert (=> b!458414 (not (contains!2495 (+!1626 lt!207254 (tuple2!8213 lt!207252 lt!207253)) lt!207255))))

(declare-fun addStillNotContains!150 (ListLongMap!7115 (_ BitVec 64) V!17547 (_ BitVec 64)) Unit!13295)

(assert (=> b!458414 (= lt!207256 (addStillNotContains!150 lt!207254 lt!207252 lt!207253 lt!207255))))

(assert (=> b!458414 (= lt!207255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458414 (= lt!207253 (get!6740 (select (arr!13670 lt!207174) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458414 (= lt!207252 (select (arr!13671 lt!207168) from!863))))

(assert (=> b!458414 (= lt!207254 call!30113)))

(assert (=> b!458414 (= e!267610 (+!1626 call!30113 (tuple2!8213 (select (arr!13671 lt!207168) from!863) (get!6740 (select (arr!13670 lt!207174) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74559 () Bool)

(assert (=> d!74559 e!267611))

(declare-fun res!273915 () Bool)

(assert (=> d!74559 (=> (not res!273915) (not e!267611))))

(assert (=> d!74559 (= res!273915 (not (contains!2495 lt!207250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267606 () ListLongMap!7115)

(assert (=> d!74559 (= lt!207250 e!267606)))

(declare-fun c!56360 () Bool)

(assert (=> d!74559 (= c!56360 (bvsge from!863 (size!14024 lt!207168)))))

(assert (=> d!74559 (validMask!0 mask!1025)))

(assert (=> d!74559 (= (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207250)))

(declare-fun b!458415 () Bool)

(assert (=> b!458415 (= e!267605 (= lt!207250 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458416 () Bool)

(assert (=> b!458416 (= e!267611 e!267607)))

(declare-fun c!56359 () Bool)

(declare-fun e!267609 () Bool)

(assert (=> b!458416 (= c!56359 e!267609)))

(declare-fun res!273913 () Bool)

(assert (=> b!458416 (=> (not res!273913) (not e!267609))))

(assert (=> b!458416 (= res!273913 (bvslt from!863 (size!14024 lt!207168)))))

(declare-fun b!458417 () Bool)

(assert (=> b!458417 (= e!267606 e!267610)))

(declare-fun c!56358 () Bool)

(assert (=> b!458417 (= c!56358 (validKeyInArray!0 (select (arr!13671 lt!207168) from!863)))))

(declare-fun b!458418 () Bool)

(declare-fun e!267608 () Bool)

(assert (=> b!458418 (= e!267607 e!267608)))

(assert (=> b!458418 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14024 lt!207168)))))

(declare-fun res!273914 () Bool)

(assert (=> b!458418 (= res!273914 (contains!2495 lt!207250 (select (arr!13671 lt!207168) from!863)))))

(assert (=> b!458418 (=> (not res!273914) (not e!267608))))

(declare-fun b!458419 () Bool)

(assert (=> b!458419 (= e!267609 (validKeyInArray!0 (select (arr!13671 lt!207168) from!863)))))

(assert (=> b!458419 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458420 () Bool)

(assert (=> b!458420 (= e!267606 (ListLongMap!7116 Nil!8274))))

(declare-fun b!458421 () Bool)

(assert (=> b!458421 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14024 lt!207168)))))

(assert (=> b!458421 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14023 lt!207174)))))

(declare-fun apply!316 (ListLongMap!7115 (_ BitVec 64)) V!17547)

(assert (=> b!458421 (= e!267608 (= (apply!316 lt!207250 (select (arr!13671 lt!207168) from!863)) (get!6740 (select (arr!13670 lt!207174) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30110 () Bool)

(assert (=> bm!30110 (= call!30113 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74559 c!56360) b!458420))

(assert (= (and d!74559 (not c!56360)) b!458417))

(assert (= (and b!458417 c!56358) b!458414))

(assert (= (and b!458417 (not c!56358)) b!458410))

(assert (= (or b!458414 b!458410) bm!30110))

(assert (= (and d!74559 res!273915) b!458411))

(assert (= (and b!458411 res!273912) b!458416))

(assert (= (and b!458416 res!273913) b!458419))

(assert (= (and b!458416 c!56359) b!458418))

(assert (= (and b!458416 (not c!56359)) b!458413))

(assert (= (and b!458418 res!273914) b!458421))

(assert (= (and b!458413 c!56357) b!458415))

(assert (= (and b!458413 (not c!56357)) b!458412))

(declare-fun b_lambda!9783 () Bool)

(assert (=> (not b_lambda!9783) (not b!458414)))

(assert (=> b!458414 t!14138))

(declare-fun b_and!19195 () Bool)

(assert (= b_and!19185 (and (=> t!14138 result!7193) b_and!19195)))

(declare-fun b_lambda!9785 () Bool)

(assert (=> (not b_lambda!9785) (not b!458421)))

(assert (=> b!458421 t!14138))

(declare-fun b_and!19197 () Bool)

(assert (= b_and!19195 (and (=> t!14138 result!7193) b_and!19197)))

(declare-fun m!441283 () Bool)

(assert (=> bm!30110 m!441283))

(declare-fun m!441285 () Bool)

(assert (=> b!458411 m!441285))

(declare-fun m!441287 () Bool)

(assert (=> b!458412 m!441287))

(declare-fun m!441289 () Bool)

(assert (=> b!458421 m!441289))

(declare-fun m!441291 () Bool)

(assert (=> b!458421 m!441291))

(declare-fun m!441293 () Bool)

(assert (=> b!458421 m!441293))

(assert (=> b!458421 m!441289))

(assert (=> b!458421 m!441137))

(declare-fun m!441295 () Bool)

(assert (=> b!458421 m!441295))

(assert (=> b!458421 m!441137))

(assert (=> b!458421 m!441291))

(assert (=> b!458419 m!441291))

(assert (=> b!458419 m!441291))

(declare-fun m!441297 () Bool)

(assert (=> b!458419 m!441297))

(assert (=> b!458415 m!441283))

(declare-fun m!441299 () Bool)

(assert (=> b!458414 m!441299))

(declare-fun m!441301 () Bool)

(assert (=> b!458414 m!441301))

(assert (=> b!458414 m!441289))

(assert (=> b!458414 m!441299))

(declare-fun m!441303 () Bool)

(assert (=> b!458414 m!441303))

(assert (=> b!458414 m!441137))

(assert (=> b!458414 m!441291))

(assert (=> b!458414 m!441289))

(assert (=> b!458414 m!441137))

(assert (=> b!458414 m!441295))

(declare-fun m!441305 () Bool)

(assert (=> b!458414 m!441305))

(declare-fun m!441307 () Bool)

(assert (=> d!74559 m!441307))

(assert (=> d!74559 m!441143))

(assert (=> b!458418 m!441291))

(assert (=> b!458418 m!441291))

(declare-fun m!441309 () Bool)

(assert (=> b!458418 m!441309))

(assert (=> b!458417 m!441291))

(assert (=> b!458417 m!441291))

(assert (=> b!458417 m!441297))

(assert (=> b!458246 d!74559))

(declare-fun b!458422 () Bool)

(declare-fun e!267617 () ListLongMap!7115)

(declare-fun call!30114 () ListLongMap!7115)

(assert (=> b!458422 (= e!267617 call!30114)))

(declare-fun b!458423 () Bool)

(declare-fun res!273916 () Bool)

(declare-fun e!267618 () Bool)

(assert (=> b!458423 (=> (not res!273916) (not e!267618))))

(declare-fun lt!207257 () ListLongMap!7115)

(assert (=> b!458423 (= res!273916 (not (contains!2495 lt!207257 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458424 () Bool)

(declare-fun e!267612 () Bool)

(assert (=> b!458424 (= e!267612 (isEmpty!567 lt!207257))))

(declare-fun b!458425 () Bool)

(declare-fun e!267614 () Bool)

(assert (=> b!458425 (= e!267614 e!267612)))

(declare-fun c!56361 () Bool)

(assert (=> b!458425 (= c!56361 (bvslt from!863 (size!14024 _keys!709)))))

(declare-fun b!458426 () Bool)

(declare-fun lt!207258 () Unit!13295)

(declare-fun lt!207263 () Unit!13295)

(assert (=> b!458426 (= lt!207258 lt!207263)))

(declare-fun lt!207259 () (_ BitVec 64))

(declare-fun lt!207261 () ListLongMap!7115)

(declare-fun lt!207260 () V!17547)

(declare-fun lt!207262 () (_ BitVec 64))

(assert (=> b!458426 (not (contains!2495 (+!1626 lt!207261 (tuple2!8213 lt!207259 lt!207260)) lt!207262))))

(assert (=> b!458426 (= lt!207263 (addStillNotContains!150 lt!207261 lt!207259 lt!207260 lt!207262))))

(assert (=> b!458426 (= lt!207262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458426 (= lt!207260 (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458426 (= lt!207259 (select (arr!13671 _keys!709) from!863))))

(assert (=> b!458426 (= lt!207261 call!30114)))

(assert (=> b!458426 (= e!267617 (+!1626 call!30114 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74561 () Bool)

(assert (=> d!74561 e!267618))

(declare-fun res!273919 () Bool)

(assert (=> d!74561 (=> (not res!273919) (not e!267618))))

(assert (=> d!74561 (= res!273919 (not (contains!2495 lt!207257 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267613 () ListLongMap!7115)

(assert (=> d!74561 (= lt!207257 e!267613)))

(declare-fun c!56364 () Bool)

(assert (=> d!74561 (= c!56364 (bvsge from!863 (size!14024 _keys!709)))))

(assert (=> d!74561 (validMask!0 mask!1025)))

(assert (=> d!74561 (= (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207257)))

(declare-fun b!458427 () Bool)

(assert (=> b!458427 (= e!267612 (= lt!207257 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458428 () Bool)

(assert (=> b!458428 (= e!267618 e!267614)))

(declare-fun c!56363 () Bool)

(declare-fun e!267616 () Bool)

(assert (=> b!458428 (= c!56363 e!267616)))

(declare-fun res!273917 () Bool)

(assert (=> b!458428 (=> (not res!273917) (not e!267616))))

(assert (=> b!458428 (= res!273917 (bvslt from!863 (size!14024 _keys!709)))))

(declare-fun b!458429 () Bool)

(assert (=> b!458429 (= e!267613 e!267617)))

(declare-fun c!56362 () Bool)

(assert (=> b!458429 (= c!56362 (validKeyInArray!0 (select (arr!13671 _keys!709) from!863)))))

(declare-fun b!458430 () Bool)

(declare-fun e!267615 () Bool)

(assert (=> b!458430 (= e!267614 e!267615)))

(assert (=> b!458430 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14024 _keys!709)))))

(declare-fun res!273918 () Bool)

(assert (=> b!458430 (= res!273918 (contains!2495 lt!207257 (select (arr!13671 _keys!709) from!863)))))

(assert (=> b!458430 (=> (not res!273918) (not e!267615))))

(declare-fun b!458431 () Bool)

(assert (=> b!458431 (= e!267616 (validKeyInArray!0 (select (arr!13671 _keys!709) from!863)))))

(assert (=> b!458431 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458432 () Bool)

(assert (=> b!458432 (= e!267613 (ListLongMap!7116 Nil!8274))))

(declare-fun b!458433 () Bool)

(assert (=> b!458433 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14024 _keys!709)))))

(assert (=> b!458433 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14023 _values!549)))))

(assert (=> b!458433 (= e!267615 (= (apply!316 lt!207257 (select (arr!13671 _keys!709) from!863)) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30111 () Bool)

(assert (=> bm!30111 (= call!30114 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74561 c!56364) b!458432))

(assert (= (and d!74561 (not c!56364)) b!458429))

(assert (= (and b!458429 c!56362) b!458426))

(assert (= (and b!458429 (not c!56362)) b!458422))

(assert (= (or b!458426 b!458422) bm!30111))

(assert (= (and d!74561 res!273919) b!458423))

(assert (= (and b!458423 res!273916) b!458428))

(assert (= (and b!458428 res!273917) b!458431))

(assert (= (and b!458428 c!56363) b!458430))

(assert (= (and b!458428 (not c!56363)) b!458425))

(assert (= (and b!458430 res!273918) b!458433))

(assert (= (and b!458425 c!56361) b!458427))

(assert (= (and b!458425 (not c!56361)) b!458424))

(declare-fun b_lambda!9787 () Bool)

(assert (=> (not b_lambda!9787) (not b!458426)))

(assert (=> b!458426 t!14138))

(declare-fun b_and!19199 () Bool)

(assert (= b_and!19197 (and (=> t!14138 result!7193) b_and!19199)))

(declare-fun b_lambda!9789 () Bool)

(assert (=> (not b_lambda!9789) (not b!458433)))

(assert (=> b!458433 t!14138))

(declare-fun b_and!19201 () Bool)

(assert (= b_and!19199 (and (=> t!14138 result!7193) b_and!19201)))

(declare-fun m!441311 () Bool)

(assert (=> bm!30111 m!441311))

(declare-fun m!441313 () Bool)

(assert (=> b!458423 m!441313))

(declare-fun m!441315 () Bool)

(assert (=> b!458424 m!441315))

(assert (=> b!458433 m!441139))

(assert (=> b!458433 m!441115))

(declare-fun m!441317 () Bool)

(assert (=> b!458433 m!441317))

(assert (=> b!458433 m!441139))

(assert (=> b!458433 m!441137))

(assert (=> b!458433 m!441141))

(assert (=> b!458433 m!441137))

(assert (=> b!458433 m!441115))

(assert (=> b!458431 m!441115))

(assert (=> b!458431 m!441115))

(assert (=> b!458431 m!441123))

(assert (=> b!458427 m!441311))

(declare-fun m!441319 () Bool)

(assert (=> b!458426 m!441319))

(declare-fun m!441321 () Bool)

(assert (=> b!458426 m!441321))

(assert (=> b!458426 m!441139))

(assert (=> b!458426 m!441319))

(declare-fun m!441323 () Bool)

(assert (=> b!458426 m!441323))

(assert (=> b!458426 m!441137))

(assert (=> b!458426 m!441115))

(assert (=> b!458426 m!441139))

(assert (=> b!458426 m!441137))

(assert (=> b!458426 m!441141))

(declare-fun m!441325 () Bool)

(assert (=> b!458426 m!441325))

(declare-fun m!441327 () Bool)

(assert (=> d!74561 m!441327))

(assert (=> d!74561 m!441143))

(assert (=> b!458430 m!441115))

(assert (=> b!458430 m!441115))

(declare-fun m!441329 () Bool)

(assert (=> b!458430 m!441329))

(assert (=> b!458429 m!441115))

(assert (=> b!458429 m!441115))

(assert (=> b!458429 m!441123))

(assert (=> b!458246 d!74561))

(declare-fun b!458444 () Bool)

(declare-fun e!267627 () Bool)

(declare-fun contains!2496 (List!8276 (_ BitVec 64)) Bool)

(assert (=> b!458444 (= e!267627 (contains!2496 Nil!8273 (select (arr!13671 lt!207168) #b00000000000000000000000000000000)))))

(declare-fun bm!30114 () Bool)

(declare-fun call!30117 () Bool)

(declare-fun c!56367 () Bool)

(assert (=> bm!30114 (= call!30117 (arrayNoDuplicates!0 lt!207168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56367 (Cons!8272 (select (arr!13671 lt!207168) #b00000000000000000000000000000000) Nil!8273) Nil!8273)))))

(declare-fun d!74563 () Bool)

(declare-fun res!273926 () Bool)

(declare-fun e!267628 () Bool)

(assert (=> d!74563 (=> res!273926 e!267628)))

(assert (=> d!74563 (= res!273926 (bvsge #b00000000000000000000000000000000 (size!14024 lt!207168)))))

(assert (=> d!74563 (= (arrayNoDuplicates!0 lt!207168 #b00000000000000000000000000000000 Nil!8273) e!267628)))

(declare-fun b!458445 () Bool)

(declare-fun e!267629 () Bool)

(assert (=> b!458445 (= e!267628 e!267629)))

(declare-fun res!273928 () Bool)

(assert (=> b!458445 (=> (not res!273928) (not e!267629))))

(assert (=> b!458445 (= res!273928 (not e!267627))))

(declare-fun res!273927 () Bool)

(assert (=> b!458445 (=> (not res!273927) (not e!267627))))

(assert (=> b!458445 (= res!273927 (validKeyInArray!0 (select (arr!13671 lt!207168) #b00000000000000000000000000000000)))))

(declare-fun b!458446 () Bool)

(declare-fun e!267630 () Bool)

(assert (=> b!458446 (= e!267630 call!30117)))

(declare-fun b!458447 () Bool)

(assert (=> b!458447 (= e!267629 e!267630)))

(assert (=> b!458447 (= c!56367 (validKeyInArray!0 (select (arr!13671 lt!207168) #b00000000000000000000000000000000)))))

(declare-fun b!458448 () Bool)

(assert (=> b!458448 (= e!267630 call!30117)))

(assert (= (and d!74563 (not res!273926)) b!458445))

(assert (= (and b!458445 res!273927) b!458444))

(assert (= (and b!458445 res!273928) b!458447))

(assert (= (and b!458447 c!56367) b!458446))

(assert (= (and b!458447 (not c!56367)) b!458448))

(assert (= (or b!458446 b!458448) bm!30114))

(assert (=> b!458444 m!441257))

(assert (=> b!458444 m!441257))

(declare-fun m!441331 () Bool)

(assert (=> b!458444 m!441331))

(assert (=> bm!30114 m!441257))

(declare-fun m!441333 () Bool)

(assert (=> bm!30114 m!441333))

(assert (=> b!458445 m!441257))

(assert (=> b!458445 m!441257))

(assert (=> b!458445 m!441265))

(assert (=> b!458447 m!441257))

(assert (=> b!458447 m!441257))

(assert (=> b!458447 m!441265))

(assert (=> b!458243 d!74563))

(declare-fun d!74565 () Bool)

(declare-fun res!273929 () Bool)

(declare-fun e!267631 () Bool)

(assert (=> d!74565 (=> res!273929 e!267631)))

(assert (=> d!74565 (= res!273929 (= (select (arr!13671 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74565 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267631)))

(declare-fun b!458449 () Bool)

(declare-fun e!267632 () Bool)

(assert (=> b!458449 (= e!267631 e!267632)))

(declare-fun res!273930 () Bool)

(assert (=> b!458449 (=> (not res!273930) (not e!267632))))

(assert (=> b!458449 (= res!273930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14024 _keys!709)))))

(declare-fun b!458450 () Bool)

(assert (=> b!458450 (= e!267632 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74565 (not res!273929)) b!458449))

(assert (= (and b!458449 res!273930) b!458450))

(assert (=> d!74565 m!441271))

(declare-fun m!441335 () Bool)

(assert (=> b!458450 m!441335))

(assert (=> b!458232 d!74565))

(declare-fun b!458451 () Bool)

(declare-fun e!267638 () ListLongMap!7115)

(declare-fun call!30118 () ListLongMap!7115)

(assert (=> b!458451 (= e!267638 call!30118)))

(declare-fun b!458452 () Bool)

(declare-fun res!273931 () Bool)

(declare-fun e!267639 () Bool)

(assert (=> b!458452 (=> (not res!273931) (not e!267639))))

(declare-fun lt!207264 () ListLongMap!7115)

(assert (=> b!458452 (= res!273931 (not (contains!2495 lt!207264 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458453 () Bool)

(declare-fun e!267633 () Bool)

(assert (=> b!458453 (= e!267633 (isEmpty!567 lt!207264))))

(declare-fun b!458454 () Bool)

(declare-fun e!267635 () Bool)

(assert (=> b!458454 (= e!267635 e!267633)))

(declare-fun c!56368 () Bool)

(assert (=> b!458454 (= c!56368 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(declare-fun b!458455 () Bool)

(declare-fun lt!207265 () Unit!13295)

(declare-fun lt!207270 () Unit!13295)

(assert (=> b!458455 (= lt!207265 lt!207270)))

(declare-fun lt!207266 () (_ BitVec 64))

(declare-fun lt!207269 () (_ BitVec 64))

(declare-fun lt!207267 () V!17547)

(declare-fun lt!207268 () ListLongMap!7115)

(assert (=> b!458455 (not (contains!2495 (+!1626 lt!207268 (tuple2!8213 lt!207266 lt!207267)) lt!207269))))

(assert (=> b!458455 (= lt!207270 (addStillNotContains!150 lt!207268 lt!207266 lt!207267 lt!207269))))

(assert (=> b!458455 (= lt!207269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458455 (= lt!207267 (get!6740 (select (arr!13670 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458455 (= lt!207266 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458455 (= lt!207268 call!30118)))

(assert (=> b!458455 (= e!267638 (+!1626 call!30118 (tuple2!8213 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6740 (select (arr!13670 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74567 () Bool)

(assert (=> d!74567 e!267639))

(declare-fun res!273934 () Bool)

(assert (=> d!74567 (=> (not res!273934) (not e!267639))))

(assert (=> d!74567 (= res!273934 (not (contains!2495 lt!207264 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267634 () ListLongMap!7115)

(assert (=> d!74567 (= lt!207264 e!267634)))

(declare-fun c!56371 () Bool)

(assert (=> d!74567 (= c!56371 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(assert (=> d!74567 (validMask!0 mask!1025)))

(assert (=> d!74567 (= (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207264)))

(declare-fun b!458456 () Bool)

(assert (=> b!458456 (= e!267633 (= lt!207264 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458457 () Bool)

(assert (=> b!458457 (= e!267639 e!267635)))

(declare-fun c!56370 () Bool)

(declare-fun e!267637 () Bool)

(assert (=> b!458457 (= c!56370 e!267637)))

(declare-fun res!273932 () Bool)

(assert (=> b!458457 (=> (not res!273932) (not e!267637))))

(assert (=> b!458457 (= res!273932 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(declare-fun b!458458 () Bool)

(assert (=> b!458458 (= e!267634 e!267638)))

(declare-fun c!56369 () Bool)

(assert (=> b!458458 (= c!56369 (validKeyInArray!0 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458459 () Bool)

(declare-fun e!267636 () Bool)

(assert (=> b!458459 (= e!267635 e!267636)))

(assert (=> b!458459 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(declare-fun res!273933 () Bool)

(assert (=> b!458459 (= res!273933 (contains!2495 lt!207264 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458459 (=> (not res!273933) (not e!267636))))

(declare-fun b!458460 () Bool)

(assert (=> b!458460 (= e!267637 (validKeyInArray!0 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458460 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458461 () Bool)

(assert (=> b!458461 (= e!267634 (ListLongMap!7116 Nil!8274))))

(declare-fun b!458462 () Bool)

(assert (=> b!458462 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(assert (=> b!458462 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14023 _values!549)))))

(assert (=> b!458462 (= e!267636 (= (apply!316 lt!207264 (select (arr!13671 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6740 (select (arr!13670 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30115 () Bool)

(assert (=> bm!30115 (= call!30118 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74567 c!56371) b!458461))

(assert (= (and d!74567 (not c!56371)) b!458458))

(assert (= (and b!458458 c!56369) b!458455))

(assert (= (and b!458458 (not c!56369)) b!458451))

(assert (= (or b!458455 b!458451) bm!30115))

(assert (= (and d!74567 res!273934) b!458452))

(assert (= (and b!458452 res!273931) b!458457))

(assert (= (and b!458457 res!273932) b!458460))

(assert (= (and b!458457 c!56370) b!458459))

(assert (= (and b!458457 (not c!56370)) b!458454))

(assert (= (and b!458459 res!273933) b!458462))

(assert (= (and b!458454 c!56368) b!458456))

(assert (= (and b!458454 (not c!56368)) b!458453))

(declare-fun b_lambda!9791 () Bool)

(assert (=> (not b_lambda!9791) (not b!458455)))

(assert (=> b!458455 t!14138))

(declare-fun b_and!19203 () Bool)

(assert (= b_and!19201 (and (=> t!14138 result!7193) b_and!19203)))

(declare-fun b_lambda!9793 () Bool)

(assert (=> (not b_lambda!9793) (not b!458462)))

(assert (=> b!458462 t!14138))

(declare-fun b_and!19205 () Bool)

(assert (= b_and!19203 (and (=> t!14138 result!7193) b_and!19205)))

(declare-fun m!441337 () Bool)

(assert (=> bm!30115 m!441337))

(declare-fun m!441339 () Bool)

(assert (=> b!458452 m!441339))

(declare-fun m!441341 () Bool)

(assert (=> b!458453 m!441341))

(declare-fun m!441343 () Bool)

(assert (=> b!458462 m!441343))

(declare-fun m!441345 () Bool)

(assert (=> b!458462 m!441345))

(declare-fun m!441347 () Bool)

(assert (=> b!458462 m!441347))

(assert (=> b!458462 m!441343))

(assert (=> b!458462 m!441137))

(declare-fun m!441349 () Bool)

(assert (=> b!458462 m!441349))

(assert (=> b!458462 m!441137))

(assert (=> b!458462 m!441345))

(assert (=> b!458460 m!441345))

(assert (=> b!458460 m!441345))

(declare-fun m!441351 () Bool)

(assert (=> b!458460 m!441351))

(assert (=> b!458456 m!441337))

(declare-fun m!441353 () Bool)

(assert (=> b!458455 m!441353))

(declare-fun m!441355 () Bool)

(assert (=> b!458455 m!441355))

(assert (=> b!458455 m!441343))

(assert (=> b!458455 m!441353))

(declare-fun m!441357 () Bool)

(assert (=> b!458455 m!441357))

(assert (=> b!458455 m!441137))

(assert (=> b!458455 m!441345))

(assert (=> b!458455 m!441343))

(assert (=> b!458455 m!441137))

(assert (=> b!458455 m!441349))

(declare-fun m!441359 () Bool)

(assert (=> b!458455 m!441359))

(declare-fun m!441361 () Bool)

(assert (=> d!74567 m!441361))

(assert (=> d!74567 m!441143))

(assert (=> b!458459 m!441345))

(assert (=> b!458459 m!441345))

(declare-fun m!441363 () Bool)

(assert (=> b!458459 m!441363))

(assert (=> b!458458 m!441345))

(assert (=> b!458458 m!441345))

(assert (=> b!458458 m!441351))

(assert (=> b!458242 d!74567))

(declare-fun d!74569 () Bool)

(declare-fun e!267642 () Bool)

(assert (=> d!74569 e!267642))

(declare-fun res!273939 () Bool)

(assert (=> d!74569 (=> (not res!273939) (not e!267642))))

(declare-fun lt!207279 () ListLongMap!7115)

(assert (=> d!74569 (= res!273939 (contains!2495 lt!207279 (_1!4117 (tuple2!8213 k0!794 v!412))))))

(declare-fun lt!207281 () List!8277)

(assert (=> d!74569 (= lt!207279 (ListLongMap!7116 lt!207281))))

(declare-fun lt!207282 () Unit!13295)

(declare-fun lt!207280 () Unit!13295)

(assert (=> d!74569 (= lt!207282 lt!207280)))

(declare-datatypes ((Option!377 0))(
  ( (Some!376 (v!8484 V!17547)) (None!375) )
))
(declare-fun getValueByKey!371 (List!8277 (_ BitVec 64)) Option!377)

(assert (=> d!74569 (= (getValueByKey!371 lt!207281 (_1!4117 (tuple2!8213 k0!794 v!412))) (Some!376 (_2!4117 (tuple2!8213 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!196 (List!8277 (_ BitVec 64) V!17547) Unit!13295)

(assert (=> d!74569 (= lt!207280 (lemmaContainsTupThenGetReturnValue!196 lt!207281 (_1!4117 (tuple2!8213 k0!794 v!412)) (_2!4117 (tuple2!8213 k0!794 v!412))))))

(declare-fun insertStrictlySorted!199 (List!8277 (_ BitVec 64) V!17547) List!8277)

(assert (=> d!74569 (= lt!207281 (insertStrictlySorted!199 (toList!3573 lt!207169) (_1!4117 (tuple2!8213 k0!794 v!412)) (_2!4117 (tuple2!8213 k0!794 v!412))))))

(assert (=> d!74569 (= (+!1626 lt!207169 (tuple2!8213 k0!794 v!412)) lt!207279)))

(declare-fun b!458467 () Bool)

(declare-fun res!273940 () Bool)

(assert (=> b!458467 (=> (not res!273940) (not e!267642))))

(assert (=> b!458467 (= res!273940 (= (getValueByKey!371 (toList!3573 lt!207279) (_1!4117 (tuple2!8213 k0!794 v!412))) (Some!376 (_2!4117 (tuple2!8213 k0!794 v!412)))))))

(declare-fun b!458468 () Bool)

(declare-fun contains!2497 (List!8277 tuple2!8212) Bool)

(assert (=> b!458468 (= e!267642 (contains!2497 (toList!3573 lt!207279) (tuple2!8213 k0!794 v!412)))))

(assert (= (and d!74569 res!273939) b!458467))

(assert (= (and b!458467 res!273940) b!458468))

(declare-fun m!441365 () Bool)

(assert (=> d!74569 m!441365))

(declare-fun m!441367 () Bool)

(assert (=> d!74569 m!441367))

(declare-fun m!441369 () Bool)

(assert (=> d!74569 m!441369))

(declare-fun m!441371 () Bool)

(assert (=> d!74569 m!441371))

(declare-fun m!441373 () Bool)

(assert (=> b!458467 m!441373))

(declare-fun m!441375 () Bool)

(assert (=> b!458468 m!441375))

(assert (=> b!458242 d!74569))

(declare-fun d!74571 () Bool)

(assert (=> d!74571 (= (validKeyInArray!0 (select (arr!13671 _keys!709) from!863)) (and (not (= (select (arr!13671 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13671 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458242 d!74571))

(declare-fun b!458469 () Bool)

(declare-fun e!267648 () ListLongMap!7115)

(declare-fun call!30119 () ListLongMap!7115)

(assert (=> b!458469 (= e!267648 call!30119)))

(declare-fun b!458470 () Bool)

(declare-fun res!273941 () Bool)

(declare-fun e!267649 () Bool)

(assert (=> b!458470 (=> (not res!273941) (not e!267649))))

(declare-fun lt!207283 () ListLongMap!7115)

(assert (=> b!458470 (= res!273941 (not (contains!2495 lt!207283 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458471 () Bool)

(declare-fun e!267643 () Bool)

(assert (=> b!458471 (= e!267643 (isEmpty!567 lt!207283))))

(declare-fun b!458472 () Bool)

(declare-fun e!267645 () Bool)

(assert (=> b!458472 (= e!267645 e!267643)))

(declare-fun c!56372 () Bool)

(assert (=> b!458472 (= c!56372 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 lt!207168)))))

(declare-fun b!458473 () Bool)

(declare-fun lt!207284 () Unit!13295)

(declare-fun lt!207289 () Unit!13295)

(assert (=> b!458473 (= lt!207284 lt!207289)))

(declare-fun lt!207285 () (_ BitVec 64))

(declare-fun lt!207286 () V!17547)

(declare-fun lt!207287 () ListLongMap!7115)

(declare-fun lt!207288 () (_ BitVec 64))

(assert (=> b!458473 (not (contains!2495 (+!1626 lt!207287 (tuple2!8213 lt!207285 lt!207286)) lt!207288))))

(assert (=> b!458473 (= lt!207289 (addStillNotContains!150 lt!207287 lt!207285 lt!207286 lt!207288))))

(assert (=> b!458473 (= lt!207288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458473 (= lt!207286 (get!6740 (select (arr!13670 lt!207174) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458473 (= lt!207285 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458473 (= lt!207287 call!30119)))

(assert (=> b!458473 (= e!267648 (+!1626 call!30119 (tuple2!8213 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863)) (get!6740 (select (arr!13670 lt!207174) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74573 () Bool)

(assert (=> d!74573 e!267649))

(declare-fun res!273944 () Bool)

(assert (=> d!74573 (=> (not res!273944) (not e!267649))))

(assert (=> d!74573 (= res!273944 (not (contains!2495 lt!207283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267644 () ListLongMap!7115)

(assert (=> d!74573 (= lt!207283 e!267644)))

(declare-fun c!56375 () Bool)

(assert (=> d!74573 (= c!56375 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14024 lt!207168)))))

(assert (=> d!74573 (validMask!0 mask!1025)))

(assert (=> d!74573 (= (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207283)))

(declare-fun b!458474 () Bool)

(assert (=> b!458474 (= e!267643 (= lt!207283 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458475 () Bool)

(assert (=> b!458475 (= e!267649 e!267645)))

(declare-fun c!56374 () Bool)

(declare-fun e!267647 () Bool)

(assert (=> b!458475 (= c!56374 e!267647)))

(declare-fun res!273942 () Bool)

(assert (=> b!458475 (=> (not res!273942) (not e!267647))))

(assert (=> b!458475 (= res!273942 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 lt!207168)))))

(declare-fun b!458476 () Bool)

(assert (=> b!458476 (= e!267644 e!267648)))

(declare-fun c!56373 () Bool)

(assert (=> b!458476 (= c!56373 (validKeyInArray!0 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458477 () Bool)

(declare-fun e!267646 () Bool)

(assert (=> b!458477 (= e!267645 e!267646)))

(assert (=> b!458477 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 lt!207168)))))

(declare-fun res!273943 () Bool)

(assert (=> b!458477 (= res!273943 (contains!2495 lt!207283 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458477 (=> (not res!273943) (not e!267646))))

(declare-fun b!458478 () Bool)

(assert (=> b!458478 (= e!267647 (validKeyInArray!0 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458478 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458479 () Bool)

(assert (=> b!458479 (= e!267644 (ListLongMap!7116 Nil!8274))))

(declare-fun b!458480 () Bool)

(assert (=> b!458480 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14024 lt!207168)))))

(assert (=> b!458480 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14023 lt!207174)))))

(assert (=> b!458480 (= e!267646 (= (apply!316 lt!207283 (select (arr!13671 lt!207168) (bvadd #b00000000000000000000000000000001 from!863))) (get!6740 (select (arr!13670 lt!207174) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30116 () Bool)

(assert (=> bm!30116 (= call!30119 (getCurrentListMapNoExtraKeys!1767 lt!207168 lt!207174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74573 c!56375) b!458479))

(assert (= (and d!74573 (not c!56375)) b!458476))

(assert (= (and b!458476 c!56373) b!458473))

(assert (= (and b!458476 (not c!56373)) b!458469))

(assert (= (or b!458473 b!458469) bm!30116))

(assert (= (and d!74573 res!273944) b!458470))

(assert (= (and b!458470 res!273941) b!458475))

(assert (= (and b!458475 res!273942) b!458478))

(assert (= (and b!458475 c!56374) b!458477))

(assert (= (and b!458475 (not c!56374)) b!458472))

(assert (= (and b!458477 res!273943) b!458480))

(assert (= (and b!458472 c!56372) b!458474))

(assert (= (and b!458472 (not c!56372)) b!458471))

(declare-fun b_lambda!9795 () Bool)

(assert (=> (not b_lambda!9795) (not b!458473)))

(assert (=> b!458473 t!14138))

(declare-fun b_and!19207 () Bool)

(assert (= b_and!19205 (and (=> t!14138 result!7193) b_and!19207)))

(declare-fun b_lambda!9797 () Bool)

(assert (=> (not b_lambda!9797) (not b!458480)))

(assert (=> b!458480 t!14138))

(declare-fun b_and!19209 () Bool)

(assert (= b_and!19207 (and (=> t!14138 result!7193) b_and!19209)))

(declare-fun m!441377 () Bool)

(assert (=> bm!30116 m!441377))

(declare-fun m!441379 () Bool)

(assert (=> b!458470 m!441379))

(declare-fun m!441381 () Bool)

(assert (=> b!458471 m!441381))

(declare-fun m!441383 () Bool)

(assert (=> b!458480 m!441383))

(declare-fun m!441385 () Bool)

(assert (=> b!458480 m!441385))

(declare-fun m!441387 () Bool)

(assert (=> b!458480 m!441387))

(assert (=> b!458480 m!441383))

(assert (=> b!458480 m!441137))

(declare-fun m!441389 () Bool)

(assert (=> b!458480 m!441389))

(assert (=> b!458480 m!441137))

(assert (=> b!458480 m!441385))

(assert (=> b!458478 m!441385))

(assert (=> b!458478 m!441385))

(declare-fun m!441391 () Bool)

(assert (=> b!458478 m!441391))

(assert (=> b!458474 m!441377))

(declare-fun m!441393 () Bool)

(assert (=> b!458473 m!441393))

(declare-fun m!441395 () Bool)

(assert (=> b!458473 m!441395))

(assert (=> b!458473 m!441383))

(assert (=> b!458473 m!441393))

(declare-fun m!441397 () Bool)

(assert (=> b!458473 m!441397))

(assert (=> b!458473 m!441137))

(assert (=> b!458473 m!441385))

(assert (=> b!458473 m!441383))

(assert (=> b!458473 m!441137))

(assert (=> b!458473 m!441389))

(declare-fun m!441399 () Bool)

(assert (=> b!458473 m!441399))

(declare-fun m!441401 () Bool)

(assert (=> d!74573 m!441401))

(assert (=> d!74573 m!441143))

(assert (=> b!458477 m!441385))

(assert (=> b!458477 m!441385))

(declare-fun m!441403 () Bool)

(assert (=> b!458477 m!441403))

(assert (=> b!458476 m!441385))

(assert (=> b!458476 m!441385))

(assert (=> b!458476 m!441391))

(assert (=> b!458242 d!74573))

(declare-fun e!267654 () Bool)

(declare-fun call!30125 () ListLongMap!7115)

(declare-fun call!30124 () ListLongMap!7115)

(declare-fun b!458487 () Bool)

(assert (=> b!458487 (= e!267654 (= call!30124 (+!1626 call!30125 (tuple2!8213 k0!794 v!412))))))

(declare-fun b!458488 () Bool)

(assert (=> b!458488 (= e!267654 (= call!30124 call!30125))))

(declare-fun bm!30121 () Bool)

(assert (=> bm!30121 (= call!30125 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458489 () Bool)

(declare-fun e!267655 () Bool)

(assert (=> b!458489 (= e!267655 e!267654)))

(declare-fun c!56378 () Bool)

(assert (=> b!458489 (= c!56378 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun d!74575 () Bool)

(assert (=> d!74575 e!267655))

(declare-fun res!273947 () Bool)

(assert (=> d!74575 (=> (not res!273947) (not e!267655))))

(assert (=> d!74575 (= res!273947 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14024 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14023 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14024 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14023 _values!549))))))))

(declare-fun lt!207292 () Unit!13295)

(declare-fun choose!1340 (array!28459 array!28457 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) (_ BitVec 64) V!17547 (_ BitVec 32) Int) Unit!13295)

(assert (=> d!74575 (= lt!207292 (choose!1340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74575 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14024 _keys!709)))))

(assert (=> d!74575 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207292)))

(declare-fun bm!30122 () Bool)

(assert (=> bm!30122 (= call!30124 (getCurrentListMapNoExtraKeys!1767 (array!28460 (store (arr!13671 _keys!709) i!563 k0!794) (size!14024 _keys!709)) (array!28458 (store (arr!13670 _values!549) i!563 (ValueCellFull!5822 v!412)) (size!14023 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74575 res!273947) b!458489))

(assert (= (and b!458489 c!56378) b!458487))

(assert (= (and b!458489 (not c!56378)) b!458488))

(assert (= (or b!458487 b!458488) bm!30121))

(assert (= (or b!458487 b!458488) bm!30122))

(declare-fun m!441405 () Bool)

(assert (=> b!458487 m!441405))

(assert (=> bm!30121 m!441121))

(declare-fun m!441407 () Bool)

(assert (=> d!74575 m!441407))

(assert (=> bm!30122 m!441105))

(assert (=> bm!30122 m!441109))

(declare-fun m!441409 () Bool)

(assert (=> bm!30122 m!441409))

(assert (=> b!458242 d!74575))

(declare-fun b!458490 () Bool)

(declare-fun e!267656 () Bool)

(assert (=> b!458490 (= e!267656 (contains!2496 Nil!8273 (select (arr!13671 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30123 () Bool)

(declare-fun call!30126 () Bool)

(declare-fun c!56379 () Bool)

(assert (=> bm!30123 (= call!30126 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56379 (Cons!8272 (select (arr!13671 _keys!709) #b00000000000000000000000000000000) Nil!8273) Nil!8273)))))

(declare-fun d!74577 () Bool)

(declare-fun res!273948 () Bool)

(declare-fun e!267657 () Bool)

(assert (=> d!74577 (=> res!273948 e!267657)))

(assert (=> d!74577 (= res!273948 (bvsge #b00000000000000000000000000000000 (size!14024 _keys!709)))))

(assert (=> d!74577 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8273) e!267657)))

(declare-fun b!458491 () Bool)

(declare-fun e!267658 () Bool)

(assert (=> b!458491 (= e!267657 e!267658)))

(declare-fun res!273950 () Bool)

(assert (=> b!458491 (=> (not res!273950) (not e!267658))))

(assert (=> b!458491 (= res!273950 (not e!267656))))

(declare-fun res!273949 () Bool)

(assert (=> b!458491 (=> (not res!273949) (not e!267656))))

(assert (=> b!458491 (= res!273949 (validKeyInArray!0 (select (arr!13671 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458492 () Bool)

(declare-fun e!267659 () Bool)

(assert (=> b!458492 (= e!267659 call!30126)))

(declare-fun b!458493 () Bool)

(assert (=> b!458493 (= e!267658 e!267659)))

(assert (=> b!458493 (= c!56379 (validKeyInArray!0 (select (arr!13671 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458494 () Bool)

(assert (=> b!458494 (= e!267659 call!30126)))

(assert (= (and d!74577 (not res!273948)) b!458491))

(assert (= (and b!458491 res!273949) b!458490))

(assert (= (and b!458491 res!273950) b!458493))

(assert (= (and b!458493 c!56379) b!458492))

(assert (= (and b!458493 (not c!56379)) b!458494))

(assert (= (or b!458492 b!458494) bm!30123))

(assert (=> b!458490 m!441271))

(assert (=> b!458490 m!441271))

(declare-fun m!441411 () Bool)

(assert (=> b!458490 m!441411))

(assert (=> bm!30123 m!441271))

(declare-fun m!441413 () Bool)

(assert (=> bm!30123 m!441413))

(assert (=> b!458491 m!441271))

(assert (=> b!458491 m!441271))

(assert (=> b!458491 m!441279))

(assert (=> b!458493 m!441271))

(assert (=> b!458493 m!441271))

(assert (=> b!458493 m!441279))

(assert (=> b!458240 d!74577))

(declare-fun d!74579 () Bool)

(declare-fun e!267660 () Bool)

(assert (=> d!74579 e!267660))

(declare-fun res!273951 () Bool)

(assert (=> d!74579 (=> (not res!273951) (not e!267660))))

(declare-fun lt!207293 () ListLongMap!7115)

(assert (=> d!74579 (= res!273951 (contains!2495 lt!207293 (_1!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207295 () List!8277)

(assert (=> d!74579 (= lt!207293 (ListLongMap!7116 lt!207295))))

(declare-fun lt!207296 () Unit!13295)

(declare-fun lt!207294 () Unit!13295)

(assert (=> d!74579 (= lt!207296 lt!207294)))

(assert (=> d!74579 (= (getValueByKey!371 lt!207295 (_1!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= lt!207294 (lemmaContainsTupThenGetReturnValue!196 lt!207295 (_1!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= lt!207295 (insertStrictlySorted!199 (toList!3573 lt!207175) (_1!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= (+!1626 lt!207175 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207293)))

(declare-fun b!458495 () Bool)

(declare-fun res!273952 () Bool)

(assert (=> b!458495 (=> (not res!273952) (not e!267660))))

(assert (=> b!458495 (= res!273952 (= (getValueByKey!371 (toList!3573 lt!207293) (_1!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!4117 (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458496 () Bool)

(assert (=> b!458496 (= e!267660 (contains!2497 (toList!3573 lt!207293) (tuple2!8213 (select (arr!13671 _keys!709) from!863) (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74579 res!273951) b!458495))

(assert (= (and b!458495 res!273952) b!458496))

(declare-fun m!441415 () Bool)

(assert (=> d!74579 m!441415))

(declare-fun m!441417 () Bool)

(assert (=> d!74579 m!441417))

(declare-fun m!441419 () Bool)

(assert (=> d!74579 m!441419))

(declare-fun m!441421 () Bool)

(assert (=> d!74579 m!441421))

(declare-fun m!441423 () Bool)

(assert (=> b!458495 m!441423))

(declare-fun m!441425 () Bool)

(assert (=> b!458496 m!441425))

(assert (=> b!458249 d!74579))

(declare-fun d!74581 () Bool)

(declare-fun c!56382 () Bool)

(assert (=> d!74581 (= c!56382 ((_ is ValueCellFull!5822) (select (arr!13670 _values!549) from!863)))))

(declare-fun e!267663 () V!17547)

(assert (=> d!74581 (= (get!6740 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267663)))

(declare-fun b!458501 () Bool)

(declare-fun get!6743 (ValueCell!5822 V!17547) V!17547)

(assert (=> b!458501 (= e!267663 (get!6743 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458502 () Bool)

(declare-fun get!6744 (ValueCell!5822 V!17547) V!17547)

(assert (=> b!458502 (= e!267663 (get!6744 (select (arr!13670 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74581 c!56382) b!458501))

(assert (= (and d!74581 (not c!56382)) b!458502))

(assert (=> b!458501 m!441139))

(assert (=> b!458501 m!441137))

(declare-fun m!441427 () Bool)

(assert (=> b!458501 m!441427))

(assert (=> b!458502 m!441139))

(assert (=> b!458502 m!441137))

(declare-fun m!441429 () Bool)

(assert (=> b!458502 m!441429))

(assert (=> b!458249 d!74581))

(declare-fun condMapEmpty!20152 () Bool)

(declare-fun mapDefault!20152 () ValueCell!5822)

(assert (=> mapNonEmpty!20143 (= condMapEmpty!20152 (= mapRest!20143 ((as const (Array (_ BitVec 32) ValueCell!5822)) mapDefault!20152)))))

(declare-fun e!267668 () Bool)

(declare-fun mapRes!20152 () Bool)

(assert (=> mapNonEmpty!20143 (= tp!38812 (and e!267668 mapRes!20152))))

(declare-fun b!458510 () Bool)

(assert (=> b!458510 (= e!267668 tp_is_empty!12331)))

(declare-fun mapNonEmpty!20152 () Bool)

(declare-fun tp!38827 () Bool)

(declare-fun e!267669 () Bool)

(assert (=> mapNonEmpty!20152 (= mapRes!20152 (and tp!38827 e!267669))))

(declare-fun mapValue!20152 () ValueCell!5822)

(declare-fun mapKey!20152 () (_ BitVec 32))

(declare-fun mapRest!20152 () (Array (_ BitVec 32) ValueCell!5822))

(assert (=> mapNonEmpty!20152 (= mapRest!20143 (store mapRest!20152 mapKey!20152 mapValue!20152))))

(declare-fun b!458509 () Bool)

(assert (=> b!458509 (= e!267669 tp_is_empty!12331)))

(declare-fun mapIsEmpty!20152 () Bool)

(assert (=> mapIsEmpty!20152 mapRes!20152))

(assert (= (and mapNonEmpty!20143 condMapEmpty!20152) mapIsEmpty!20152))

(assert (= (and mapNonEmpty!20143 (not condMapEmpty!20152)) mapNonEmpty!20152))

(assert (= (and mapNonEmpty!20152 ((_ is ValueCellFull!5822) mapValue!20152)) b!458509))

(assert (= (and mapNonEmpty!20143 ((_ is ValueCellFull!5822) mapDefault!20152)) b!458510))

(declare-fun m!441431 () Bool)

(assert (=> mapNonEmpty!20152 m!441431))

(declare-fun b_lambda!9799 () Bool)

(assert (= b_lambda!9783 (or (and start!41088 b_free!10993) b_lambda!9799)))

(declare-fun b_lambda!9801 () Bool)

(assert (= b_lambda!9793 (or (and start!41088 b_free!10993) b_lambda!9801)))

(declare-fun b_lambda!9803 () Bool)

(assert (= b_lambda!9789 (or (and start!41088 b_free!10993) b_lambda!9803)))

(declare-fun b_lambda!9805 () Bool)

(assert (= b_lambda!9791 (or (and start!41088 b_free!10993) b_lambda!9805)))

(declare-fun b_lambda!9807 () Bool)

(assert (= b_lambda!9797 (or (and start!41088 b_free!10993) b_lambda!9807)))

(declare-fun b_lambda!9809 () Bool)

(assert (= b_lambda!9785 (or (and start!41088 b_free!10993) b_lambda!9809)))

(declare-fun b_lambda!9811 () Bool)

(assert (= b_lambda!9787 (or (and start!41088 b_free!10993) b_lambda!9811)))

(declare-fun b_lambda!9813 () Bool)

(assert (= b_lambda!9795 (or (and start!41088 b_free!10993) b_lambda!9813)))

(check-sat (not b!458411) (not b!458476) (not d!74561) (not b!458459) (not d!74567) (not b!458470) (not bm!30121) (not mapNonEmpty!20152) (not b!458431) (not b!458427) (not b!458493) (not b_next!10993) b_and!19209 (not b!458385) (not b!458471) (not b!458384) (not bm!30111) (not b!458502) (not b!458381) (not d!74575) (not b!458412) (not d!74579) (not b!458474) (not b!458468) (not b!458490) (not b!458496) (not b!458423) (not b_lambda!9781) (not b_lambda!9809) (not b!458495) (not b!458418) (not b_lambda!9803) (not b_lambda!9799) (not b!458501) (not bm!30116) (not b!458374) (not b!458478) (not b!458491) (not b!458447) (not b!458456) (not b!458480) (not b!458444) (not b!458424) (not b_lambda!9811) (not bm!30107) (not b!458419) (not b_lambda!9813) (not b!458455) (not b_lambda!9801) (not b!458473) (not b!458430) (not b!458450) (not bm!30123) (not d!74573) (not b_lambda!9807) (not b_lambda!9805) (not b!458417) (not b!458462) (not b!458487) (not b!458433) (not b!458453) (not b!458414) (not b!458452) (not b!458467) (not bm!30122) (not bm!30110) (not b!458429) (not bm!30115) (not b!458426) tp_is_empty!12331 (not d!74559) (not b!458421) (not b!458460) (not b!458477) (not bm!30106) (not b!458445) (not d!74569) (not b!458375) (not b!458458) (not b!458415) (not bm!30114))
(check-sat b_and!19209 (not b_next!10993))
