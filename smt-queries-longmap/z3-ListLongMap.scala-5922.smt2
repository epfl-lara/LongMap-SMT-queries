; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76960 () Bool)

(assert start!76960)

(declare-fun b!899207 () Bool)

(declare-fun b_free!16033 () Bool)

(declare-fun b_next!16033 () Bool)

(assert (=> b!899207 (= b_free!16033 (not b_next!16033))))

(declare-fun tp!56179 () Bool)

(declare-fun b_and!26315 () Bool)

(assert (=> b!899207 (= tp!56179 b_and!26315)))

(declare-fun b!899201 () Bool)

(declare-fun e!503132 () Bool)

(declare-fun e!503136 () Bool)

(assert (=> b!899201 (= e!503132 (not e!503136))))

(declare-fun res!607503 () Bool)

(assert (=> b!899201 (=> res!607503 e!503136)))

(declare-datatypes ((SeekEntryResult!8933 0))(
  ( (MissingZero!8933 (index!38103 (_ BitVec 32))) (Found!8933 (index!38104 (_ BitVec 32))) (Intermediate!8933 (undefined!9745 Bool) (index!38105 (_ BitVec 32)) (x!76645 (_ BitVec 32))) (Undefined!8933) (MissingVacant!8933 (index!38106 (_ BitVec 32))) )
))
(declare-fun lt!405998 () SeekEntryResult!8933)

(get-info :version)

(assert (=> b!899201 (= res!607503 (not ((_ is Found!8933) lt!405998)))))

(declare-fun e!503130 () Bool)

(assert (=> b!899201 e!503130))

(declare-fun res!607502 () Bool)

(assert (=> b!899201 (=> res!607502 e!503130)))

(assert (=> b!899201 (= res!607502 (not ((_ is Found!8933) lt!405998)))))

(declare-datatypes ((Unit!30502 0))(
  ( (Unit!30503) )
))
(declare-fun lt!405997 () Unit!30502)

(declare-datatypes ((array!52749 0))(
  ( (array!52750 (arr!25349 (Array (_ BitVec 32) (_ BitVec 64))) (size!25808 (_ BitVec 32))) )
))
(declare-datatypes ((V!29447 0))(
  ( (V!29448 (val!9231 Int)) )
))
(declare-datatypes ((ValueCell!8699 0))(
  ( (ValueCellFull!8699 (v!11722 V!29447)) (EmptyCell!8699) )
))
(declare-datatypes ((array!52751 0))(
  ( (array!52752 (arr!25350 (Array (_ BitVec 32) ValueCell!8699)) (size!25809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4414 0))(
  ( (LongMapFixedSize!4415 (defaultEntry!5431 Int) (mask!26182 (_ BitVec 32)) (extraKeys!5152 (_ BitVec 32)) (zeroValue!5256 V!29447) (minValue!5256 V!29447) (_size!2262 (_ BitVec 32)) (_keys!10215 array!52749) (_values!5443 array!52751) (_vacant!2262 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4414)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!99 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> b!899201 (= lt!405997 (lemmaSeekEntryGivesInRangeIndex!99 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899201 (= lt!405998 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun b!899202 () Bool)

(declare-fun e!503133 () Bool)

(assert (=> b!899202 (= e!503136 e!503133)))

(declare-fun res!607506 () Bool)

(assert (=> b!899202 (=> res!607506 e!503133)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899202 (= res!607506 (not (validMask!0 (mask!26182 thiss!1181))))))

(declare-datatypes ((tuple2!12066 0))(
  ( (tuple2!12067 (_1!6044 (_ BitVec 64)) (_2!6044 V!29447)) )
))
(declare-datatypes ((List!17857 0))(
  ( (Nil!17854) (Cons!17853 (h!18997 tuple2!12066) (t!25195 List!17857)) )
))
(declare-datatypes ((ListLongMap!10753 0))(
  ( (ListLongMap!10754 (toList!5392 List!17857)) )
))
(declare-fun contains!4391 (ListLongMap!10753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2611 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) ListLongMap!10753)

(assert (=> b!899202 (contains!4391 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))

(declare-fun lt!405996 () Unit!30502)

(declare-fun lemmaValidKeyInArrayIsInListMap!247 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) Unit!30502)

(assert (=> b!899202 (= lt!405996 (lemmaValidKeyInArrayIsInListMap!247 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!38104 lt!405998) (defaultEntry!5431 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899202 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405999 () Unit!30502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52749 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> b!899202 (= lt!405999 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) key!785 (index!38104 lt!405998)))))

(declare-fun res!607504 () Bool)

(assert (=> start!76960 (=> (not res!607504) (not e!503132))))

(declare-fun valid!1705 (LongMapFixedSize!4414) Bool)

(assert (=> start!76960 (= res!607504 (valid!1705 thiss!1181))))

(assert (=> start!76960 e!503132))

(declare-fun e!503135 () Bool)

(assert (=> start!76960 e!503135))

(assert (=> start!76960 true))

(declare-fun b!899203 () Bool)

(assert (=> b!899203 (= e!503133 (or (not (= (size!25809 (_values!5443 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26182 thiss!1181)))) (not (= (size!25808 (_keys!10215 thiss!1181)) (size!25809 (_values!5443 thiss!1181)))) (bvslt (mask!26182 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5152 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899204 () Bool)

(declare-fun e!503131 () Bool)

(declare-fun e!503129 () Bool)

(declare-fun mapRes!29207 () Bool)

(assert (=> b!899204 (= e!503131 (and e!503129 mapRes!29207))))

(declare-fun condMapEmpty!29207 () Bool)

(declare-fun mapDefault!29207 () ValueCell!8699)

(assert (=> b!899204 (= condMapEmpty!29207 (= (arr!25350 (_values!5443 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29207)))))

(declare-fun b!899205 () Bool)

(declare-fun e!503134 () Bool)

(declare-fun tp_is_empty!18361 () Bool)

(assert (=> b!899205 (= e!503134 tp_is_empty!18361)))

(declare-fun b!899206 () Bool)

(declare-fun res!607505 () Bool)

(assert (=> b!899206 (=> (not res!607505) (not e!503132))))

(assert (=> b!899206 (= res!607505 (not (= key!785 (bvneg key!785))))))

(declare-fun array_inv!19942 (array!52749) Bool)

(declare-fun array_inv!19943 (array!52751) Bool)

(assert (=> b!899207 (= e!503135 (and tp!56179 tp_is_empty!18361 (array_inv!19942 (_keys!10215 thiss!1181)) (array_inv!19943 (_values!5443 thiss!1181)) e!503131))))

(declare-fun mapNonEmpty!29207 () Bool)

(declare-fun tp!56180 () Bool)

(assert (=> mapNonEmpty!29207 (= mapRes!29207 (and tp!56180 e!503134))))

(declare-fun mapRest!29207 () (Array (_ BitVec 32) ValueCell!8699))

(declare-fun mapValue!29207 () ValueCell!8699)

(declare-fun mapKey!29207 () (_ BitVec 32))

(assert (=> mapNonEmpty!29207 (= (arr!25350 (_values!5443 thiss!1181)) (store mapRest!29207 mapKey!29207 mapValue!29207))))

(declare-fun b!899208 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899208 (= e!503130 (inRange!0 (index!38104 lt!405998) (mask!26182 thiss!1181)))))

(declare-fun b!899209 () Bool)

(assert (=> b!899209 (= e!503129 tp_is_empty!18361)))

(declare-fun mapIsEmpty!29207 () Bool)

(assert (=> mapIsEmpty!29207 mapRes!29207))

(assert (= (and start!76960 res!607504) b!899206))

(assert (= (and b!899206 res!607505) b!899201))

(assert (= (and b!899201 (not res!607502)) b!899208))

(assert (= (and b!899201 (not res!607503)) b!899202))

(assert (= (and b!899202 (not res!607506)) b!899203))

(assert (= (and b!899204 condMapEmpty!29207) mapIsEmpty!29207))

(assert (= (and b!899204 (not condMapEmpty!29207)) mapNonEmpty!29207))

(assert (= (and mapNonEmpty!29207 ((_ is ValueCellFull!8699) mapValue!29207)) b!899205))

(assert (= (and b!899204 ((_ is ValueCellFull!8699) mapDefault!29207)) b!899209))

(assert (= b!899207 b!899204))

(assert (= start!76960 b!899207))

(declare-fun m!835159 () Bool)

(assert (=> b!899201 m!835159))

(declare-fun m!835161 () Bool)

(assert (=> b!899201 m!835161))

(declare-fun m!835163 () Bool)

(assert (=> start!76960 m!835163))

(declare-fun m!835165 () Bool)

(assert (=> b!899202 m!835165))

(declare-fun m!835167 () Bool)

(assert (=> b!899202 m!835167))

(declare-fun m!835169 () Bool)

(assert (=> b!899202 m!835169))

(assert (=> b!899202 m!835165))

(declare-fun m!835171 () Bool)

(assert (=> b!899202 m!835171))

(declare-fun m!835173 () Bool)

(assert (=> b!899202 m!835173))

(declare-fun m!835175 () Bool)

(assert (=> b!899202 m!835175))

(declare-fun m!835177 () Bool)

(assert (=> b!899202 m!835177))

(assert (=> b!899202 m!835169))

(declare-fun m!835179 () Bool)

(assert (=> mapNonEmpty!29207 m!835179))

(declare-fun m!835181 () Bool)

(assert (=> b!899207 m!835181))

(declare-fun m!835183 () Bool)

(assert (=> b!899207 m!835183))

(declare-fun m!835185 () Bool)

(assert (=> b!899208 m!835185))

(check-sat (not b!899207) (not start!76960) (not b!899201) (not b!899208) (not b!899202) tp_is_empty!18361 b_and!26315 (not mapNonEmpty!29207) (not b_next!16033))
(check-sat b_and!26315 (not b_next!16033))
(get-model)

(declare-fun d!111287 () Bool)

(assert (=> d!111287 (= (inRange!0 (index!38104 lt!405998) (mask!26182 thiss!1181)) (and (bvsge (index!38104 lt!405998) #b00000000000000000000000000000000) (bvslt (index!38104 lt!405998) (bvadd (mask!26182 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899208 d!111287))

(declare-fun d!111289 () Bool)

(declare-fun res!607543 () Bool)

(declare-fun e!503193 () Bool)

(assert (=> d!111289 (=> (not res!607543) (not e!503193))))

(declare-fun simpleValid!327 (LongMapFixedSize!4414) Bool)

(assert (=> d!111289 (= res!607543 (simpleValid!327 thiss!1181))))

(assert (=> d!111289 (= (valid!1705 thiss!1181) e!503193)))

(declare-fun b!899270 () Bool)

(declare-fun res!607544 () Bool)

(assert (=> b!899270 (=> (not res!607544) (not e!503193))))

(declare-fun arrayCountValidKeys!0 (array!52749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899270 (= res!607544 (= (arrayCountValidKeys!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))) (_size!2262 thiss!1181)))))

(declare-fun b!899271 () Bool)

(declare-fun res!607545 () Bool)

(assert (=> b!899271 (=> (not res!607545) (not e!503193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52749 (_ BitVec 32)) Bool)

(assert (=> b!899271 (= res!607545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun b!899272 () Bool)

(declare-datatypes ((List!17859 0))(
  ( (Nil!17856) (Cons!17855 (h!18999 (_ BitVec 64)) (t!25199 List!17859)) )
))
(declare-fun arrayNoDuplicates!0 (array!52749 (_ BitVec 32) List!17859) Bool)

(assert (=> b!899272 (= e!503193 (arrayNoDuplicates!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 Nil!17856))))

(assert (= (and d!111289 res!607543) b!899270))

(assert (= (and b!899270 res!607544) b!899271))

(assert (= (and b!899271 res!607545) b!899272))

(declare-fun m!835243 () Bool)

(assert (=> d!111289 m!835243))

(declare-fun m!835245 () Bool)

(assert (=> b!899270 m!835245))

(declare-fun m!835247 () Bool)

(assert (=> b!899271 m!835247))

(declare-fun m!835249 () Bool)

(assert (=> b!899272 m!835249))

(assert (=> start!76960 d!111289))

(declare-fun d!111291 () Bool)

(declare-fun e!503196 () Bool)

(assert (=> d!111291 e!503196))

(declare-fun res!607548 () Bool)

(assert (=> d!111291 (=> res!607548 e!503196)))

(declare-fun lt!406029 () SeekEntryResult!8933)

(assert (=> d!111291 (= res!607548 (not ((_ is Found!8933) lt!406029)))))

(assert (=> d!111291 (= lt!406029 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun lt!406028 () Unit!30502)

(declare-fun choose!1511 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> d!111291 (= lt!406028 (choose!1511 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785))))

(assert (=> d!111291 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111291 (= (lemmaSeekEntryGivesInRangeIndex!99 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785) lt!406028)))

(declare-fun b!899275 () Bool)

(assert (=> b!899275 (= e!503196 (inRange!0 (index!38104 lt!406029) (mask!26182 thiss!1181)))))

(assert (= (and d!111291 (not res!607548)) b!899275))

(assert (=> d!111291 m!835161))

(declare-fun m!835251 () Bool)

(assert (=> d!111291 m!835251))

(assert (=> d!111291 m!835175))

(declare-fun m!835253 () Bool)

(assert (=> b!899275 m!835253))

(assert (=> b!899201 d!111291))

(declare-fun b!899288 () Bool)

(declare-fun e!503203 () SeekEntryResult!8933)

(assert (=> b!899288 (= e!503203 Undefined!8933)))

(declare-fun d!111293 () Bool)

(declare-fun lt!406039 () SeekEntryResult!8933)

(assert (=> d!111293 (and (or ((_ is MissingVacant!8933) lt!406039) (not ((_ is Found!8933) lt!406039)) (and (bvsge (index!38104 lt!406039) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406039) (size!25808 (_keys!10215 thiss!1181))))) (not ((_ is MissingVacant!8933) lt!406039)) (or (not ((_ is Found!8933) lt!406039)) (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!406039)) key!785)))))

(assert (=> d!111293 (= lt!406039 e!503203)))

(declare-fun c!95086 () Bool)

(declare-fun lt!406038 () SeekEntryResult!8933)

(assert (=> d!111293 (= c!95086 (and ((_ is Intermediate!8933) lt!406038) (undefined!9745 lt!406038)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111293 (= lt!406038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26182 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(assert (=> d!111293 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111293 (= (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)) lt!406039)))

(declare-fun b!899289 () Bool)

(declare-fun e!503204 () SeekEntryResult!8933)

(assert (=> b!899289 (= e!503203 e!503204)))

(declare-fun lt!406041 () (_ BitVec 64))

(assert (=> b!899289 (= lt!406041 (select (arr!25349 (_keys!10215 thiss!1181)) (index!38105 lt!406038)))))

(declare-fun c!95087 () Bool)

(assert (=> b!899289 (= c!95087 (= lt!406041 key!785))))

(declare-fun b!899290 () Bool)

(declare-fun e!503205 () SeekEntryResult!8933)

(assert (=> b!899290 (= e!503205 (MissingZero!8933 (index!38105 lt!406038)))))

(declare-fun b!899291 () Bool)

(declare-fun c!95085 () Bool)

(assert (=> b!899291 (= c!95085 (= lt!406041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899291 (= e!503204 e!503205)))

(declare-fun b!899292 () Bool)

(declare-fun lt!406040 () SeekEntryResult!8933)

(assert (=> b!899292 (= e!503205 (ite ((_ is MissingVacant!8933) lt!406040) (MissingZero!8933 (index!38106 lt!406040)) lt!406040))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899292 (= lt!406040 (seekKeyOrZeroReturnVacant!0 (x!76645 lt!406038) (index!38105 lt!406038) (index!38105 lt!406038) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun b!899293 () Bool)

(assert (=> b!899293 (= e!503204 (Found!8933 (index!38105 lt!406038)))))

(assert (= (and d!111293 c!95086) b!899288))

(assert (= (and d!111293 (not c!95086)) b!899289))

(assert (= (and b!899289 c!95087) b!899293))

(assert (= (and b!899289 (not c!95087)) b!899291))

(assert (= (and b!899291 c!95085) b!899290))

(assert (= (and b!899291 (not c!95085)) b!899292))

(declare-fun m!835255 () Bool)

(assert (=> d!111293 m!835255))

(declare-fun m!835257 () Bool)

(assert (=> d!111293 m!835257))

(assert (=> d!111293 m!835257))

(declare-fun m!835259 () Bool)

(assert (=> d!111293 m!835259))

(assert (=> d!111293 m!835175))

(declare-fun m!835261 () Bool)

(assert (=> b!899289 m!835261))

(declare-fun m!835263 () Bool)

(assert (=> b!899292 m!835263))

(assert (=> b!899201 d!111293))

(declare-fun d!111295 () Bool)

(declare-fun e!503208 () Bool)

(assert (=> d!111295 e!503208))

(declare-fun res!607551 () Bool)

(assert (=> d!111295 (=> (not res!607551) (not e!503208))))

(assert (=> d!111295 (= res!607551 (and (bvsge (index!38104 lt!405998) #b00000000000000000000000000000000) (bvslt (index!38104 lt!405998) (size!25808 (_keys!10215 thiss!1181)))))))

(declare-fun lt!406044 () Unit!30502)

(declare-fun choose!1512 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) Unit!30502)

(assert (=> d!111295 (= lt!406044 (choose!1512 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!38104 lt!405998) (defaultEntry!5431 thiss!1181)))))

(assert (=> d!111295 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111295 (= (lemmaValidKeyInArrayIsInListMap!247 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!38104 lt!405998) (defaultEntry!5431 thiss!1181)) lt!406044)))

(declare-fun b!899296 () Bool)

(assert (=> b!899296 (= e!503208 (contains!4391 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(assert (= (and d!111295 res!607551) b!899296))

(declare-fun m!835265 () Bool)

(assert (=> d!111295 m!835265))

(assert (=> d!111295 m!835175))

(assert (=> b!899296 m!835169))

(assert (=> b!899296 m!835165))

(assert (=> b!899296 m!835169))

(assert (=> b!899296 m!835165))

(assert (=> b!899296 m!835171))

(assert (=> b!899202 d!111295))

(declare-fun d!111297 () Bool)

(declare-fun e!503214 () Bool)

(assert (=> d!111297 e!503214))

(declare-fun res!607554 () Bool)

(assert (=> d!111297 (=> res!607554 e!503214)))

(declare-fun lt!406054 () Bool)

(assert (=> d!111297 (= res!607554 (not lt!406054))))

(declare-fun lt!406053 () Bool)

(assert (=> d!111297 (= lt!406054 lt!406053)))

(declare-fun lt!406055 () Unit!30502)

(declare-fun e!503213 () Unit!30502)

(assert (=> d!111297 (= lt!406055 e!503213)))

(declare-fun c!95090 () Bool)

(assert (=> d!111297 (= c!95090 lt!406053)))

(declare-fun containsKey!428 (List!17857 (_ BitVec 64)) Bool)

(assert (=> d!111297 (= lt!406053 (containsKey!428 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(assert (=> d!111297 (= (contains!4391 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))) lt!406054)))

(declare-fun b!899303 () Bool)

(declare-fun lt!406056 () Unit!30502)

(assert (=> b!899303 (= e!503213 lt!406056)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!323 (List!17857 (_ BitVec 64)) Unit!30502)

(assert (=> b!899303 (= lt!406056 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(declare-datatypes ((Option!466 0))(
  ( (Some!465 (v!11725 V!29447)) (None!464) )
))
(declare-fun isDefined!336 (Option!466) Bool)

(declare-fun getValueByKey!460 (List!17857 (_ BitVec 64)) Option!466)

(assert (=> b!899303 (isDefined!336 (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(declare-fun b!899304 () Bool)

(declare-fun Unit!30506 () Unit!30502)

(assert (=> b!899304 (= e!503213 Unit!30506)))

(declare-fun b!899305 () Bool)

(assert (=> b!899305 (= e!503214 (isDefined!336 (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))))

(assert (= (and d!111297 c!95090) b!899303))

(assert (= (and d!111297 (not c!95090)) b!899304))

(assert (= (and d!111297 (not res!607554)) b!899305))

(assert (=> d!111297 m!835165))

(declare-fun m!835267 () Bool)

(assert (=> d!111297 m!835267))

(assert (=> b!899303 m!835165))

(declare-fun m!835269 () Bool)

(assert (=> b!899303 m!835269))

(assert (=> b!899303 m!835165))

(declare-fun m!835271 () Bool)

(assert (=> b!899303 m!835271))

(assert (=> b!899303 m!835271))

(declare-fun m!835273 () Bool)

(assert (=> b!899303 m!835273))

(assert (=> b!899305 m!835165))

(assert (=> b!899305 m!835271))

(assert (=> b!899305 m!835271))

(assert (=> b!899305 m!835273))

(assert (=> b!899202 d!111297))

(declare-fun d!111299 () Bool)

(assert (=> d!111299 (= (validMask!0 (mask!26182 thiss!1181)) (and (or (= (mask!26182 thiss!1181) #b00000000000000000000000000000111) (= (mask!26182 thiss!1181) #b00000000000000000000000000001111) (= (mask!26182 thiss!1181) #b00000000000000000000000000011111) (= (mask!26182 thiss!1181) #b00000000000000000000000000111111) (= (mask!26182 thiss!1181) #b00000000000000000000000001111111) (= (mask!26182 thiss!1181) #b00000000000000000000000011111111) (= (mask!26182 thiss!1181) #b00000000000000000000000111111111) (= (mask!26182 thiss!1181) #b00000000000000000000001111111111) (= (mask!26182 thiss!1181) #b00000000000000000000011111111111) (= (mask!26182 thiss!1181) #b00000000000000000000111111111111) (= (mask!26182 thiss!1181) #b00000000000000000001111111111111) (= (mask!26182 thiss!1181) #b00000000000000000011111111111111) (= (mask!26182 thiss!1181) #b00000000000000000111111111111111) (= (mask!26182 thiss!1181) #b00000000000000001111111111111111) (= (mask!26182 thiss!1181) #b00000000000000011111111111111111) (= (mask!26182 thiss!1181) #b00000000000000111111111111111111) (= (mask!26182 thiss!1181) #b00000000000001111111111111111111) (= (mask!26182 thiss!1181) #b00000000000011111111111111111111) (= (mask!26182 thiss!1181) #b00000000000111111111111111111111) (= (mask!26182 thiss!1181) #b00000000001111111111111111111111) (= (mask!26182 thiss!1181) #b00000000011111111111111111111111) (= (mask!26182 thiss!1181) #b00000000111111111111111111111111) (= (mask!26182 thiss!1181) #b00000001111111111111111111111111) (= (mask!26182 thiss!1181) #b00000011111111111111111111111111) (= (mask!26182 thiss!1181) #b00000111111111111111111111111111) (= (mask!26182 thiss!1181) #b00001111111111111111111111111111) (= (mask!26182 thiss!1181) #b00011111111111111111111111111111) (= (mask!26182 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26182 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899202 d!111299))

(declare-fun d!111301 () Bool)

(assert (=> d!111301 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406059 () Unit!30502)

(declare-fun choose!13 (array!52749 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> d!111301 (= lt!406059 (choose!13 (_keys!10215 thiss!1181) key!785 (index!38104 lt!405998)))))

(assert (=> d!111301 (bvsge (index!38104 lt!405998) #b00000000000000000000000000000000)))

(assert (=> d!111301 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) key!785 (index!38104 lt!405998)) lt!406059)))

(declare-fun bs!25219 () Bool)

(assert (= bs!25219 d!111301))

(assert (=> bs!25219 m!835167))

(declare-fun m!835275 () Bool)

(assert (=> bs!25219 m!835275))

(assert (=> b!899202 d!111301))

(declare-fun d!111303 () Bool)

(declare-fun res!607559 () Bool)

(declare-fun e!503219 () Bool)

(assert (=> d!111303 (=> res!607559 e!503219)))

(assert (=> d!111303 (= res!607559 (= (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111303 (= (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000) e!503219)))

(declare-fun b!899310 () Bool)

(declare-fun e!503220 () Bool)

(assert (=> b!899310 (= e!503219 e!503220)))

(declare-fun res!607560 () Bool)

(assert (=> b!899310 (=> (not res!607560) (not e!503220))))

(assert (=> b!899310 (= res!607560 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899311 () Bool)

(assert (=> b!899311 (= e!503220 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111303 (not res!607559)) b!899310))

(assert (= (and b!899310 res!607560) b!899311))

(declare-fun m!835277 () Bool)

(assert (=> d!111303 m!835277))

(declare-fun m!835279 () Bool)

(assert (=> b!899311 m!835279))

(assert (=> b!899202 d!111303))

(declare-fun b!899354 () Bool)

(declare-fun e!503249 () ListLongMap!10753)

(declare-fun call!39937 () ListLongMap!10753)

(assert (=> b!899354 (= e!503249 call!39937)))

(declare-fun b!899355 () Bool)

(declare-fun e!503250 () Bool)

(declare-fun lt!406113 () ListLongMap!10753)

(declare-fun apply!409 (ListLongMap!10753 (_ BitVec 64)) V!29447)

(assert (=> b!899355 (= e!503250 (= (apply!409 lt!406113 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5256 thiss!1181)))))

(declare-fun b!899356 () Bool)

(declare-fun call!39933 () ListLongMap!10753)

(assert (=> b!899356 (= e!503249 call!39933)))

(declare-fun b!899357 () Bool)

(declare-fun e!503247 () ListLongMap!10753)

(assert (=> b!899357 (= e!503247 call!39937)))

(declare-fun b!899358 () Bool)

(declare-fun e!503259 () Bool)

(declare-fun e!503253 () Bool)

(assert (=> b!899358 (= e!503259 e!503253)))

(declare-fun res!607581 () Bool)

(assert (=> b!899358 (=> (not res!607581) (not e!503253))))

(assert (=> b!899358 (= res!607581 (contains!4391 lt!406113 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899359 () Bool)

(declare-fun e!503257 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899359 (= e!503257 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39929 () Bool)

(declare-fun call!39932 () ListLongMap!10753)

(declare-fun getCurrentListMapNoExtraKeys!3317 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) ListLongMap!10753)

(assert (=> bm!39929 (= call!39932 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun b!899360 () Bool)

(declare-fun e!503258 () Bool)

(assert (=> b!899360 (= e!503258 (= (apply!409 lt!406113 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5256 thiss!1181)))))

(declare-fun bm!39930 () Bool)

(declare-fun call!39938 () Bool)

(assert (=> bm!39930 (= call!39938 (contains!4391 lt!406113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111305 () Bool)

(declare-fun e!503255 () Bool)

(assert (=> d!111305 e!503255))

(declare-fun res!607584 () Bool)

(assert (=> d!111305 (=> (not res!607584) (not e!503255))))

(assert (=> d!111305 (= res!607584 (or (bvsge #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))))

(declare-fun lt!406104 () ListLongMap!10753)

(assert (=> d!111305 (= lt!406113 lt!406104)))

(declare-fun lt!406124 () Unit!30502)

(declare-fun e!503248 () Unit!30502)

(assert (=> d!111305 (= lt!406124 e!503248)))

(declare-fun c!95103 () Bool)

(assert (=> d!111305 (= c!95103 e!503257)))

(declare-fun res!607585 () Bool)

(assert (=> d!111305 (=> (not res!607585) (not e!503257))))

(assert (=> d!111305 (= res!607585 (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun e!503256 () ListLongMap!10753)

(assert (=> d!111305 (= lt!406104 e!503256)))

(declare-fun c!95107 () Bool)

(assert (=> d!111305 (= c!95107 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111305 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111305 (= (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) lt!406113)))

(declare-fun bm!39931 () Bool)

(declare-fun call!39935 () ListLongMap!10753)

(assert (=> bm!39931 (= call!39933 call!39935)))

(declare-fun bm!39932 () Bool)

(assert (=> bm!39932 (= call!39935 call!39932)))

(declare-fun b!899361 () Bool)

(declare-fun res!607579 () Bool)

(assert (=> b!899361 (=> (not res!607579) (not e!503255))))

(declare-fun e!503254 () Bool)

(assert (=> b!899361 (= res!607579 e!503254)))

(declare-fun c!95108 () Bool)

(assert (=> b!899361 (= c!95108 (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!39936 () ListLongMap!10753)

(declare-fun c!95106 () Bool)

(declare-fun bm!39933 () Bool)

(declare-fun +!2620 (ListLongMap!10753 tuple2!12066) ListLongMap!10753)

(assert (=> bm!39933 (= call!39936 (+!2620 (ite c!95107 call!39932 (ite c!95106 call!39935 call!39933)) (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(declare-fun b!899362 () Bool)

(declare-fun get!13336 (ValueCell!8699 V!29447) V!29447)

(declare-fun dynLambda!1303 (Int (_ BitVec 64)) V!29447)

(assert (=> b!899362 (= e!503253 (= (apply!409 lt!406113 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13336 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25809 (_values!5443 thiss!1181))))))

(assert (=> b!899362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899363 () Bool)

(declare-fun e!503252 () Bool)

(assert (=> b!899363 (= e!503255 e!503252)))

(declare-fun c!95104 () Bool)

(assert (=> b!899363 (= c!95104 (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899364 () Bool)

(declare-fun Unit!30507 () Unit!30502)

(assert (=> b!899364 (= e!503248 Unit!30507)))

(declare-fun b!899365 () Bool)

(declare-fun res!607586 () Bool)

(assert (=> b!899365 (=> (not res!607586) (not e!503255))))

(assert (=> b!899365 (= res!607586 e!503259)))

(declare-fun res!607587 () Bool)

(assert (=> b!899365 (=> res!607587 e!503259)))

(declare-fun e!503251 () Bool)

(assert (=> b!899365 (= res!607587 (not e!503251))))

(declare-fun res!607580 () Bool)

(assert (=> b!899365 (=> (not res!607580) (not e!503251))))

(assert (=> b!899365 (= res!607580 (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899366 () Bool)

(assert (=> b!899366 (= e!503252 e!503250)))

(declare-fun res!607583 () Bool)

(assert (=> b!899366 (= res!607583 call!39938)))

(assert (=> b!899366 (=> (not res!607583) (not e!503250))))

(declare-fun b!899367 () Bool)

(assert (=> b!899367 (= e!503256 (+!2620 call!39936 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))

(declare-fun b!899368 () Bool)

(assert (=> b!899368 (= e!503251 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899369 () Bool)

(declare-fun lt!406117 () Unit!30502)

(assert (=> b!899369 (= e!503248 lt!406117)))

(declare-fun lt!406109 () ListLongMap!10753)

(assert (=> b!899369 (= lt!406109 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406105 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406110 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406110 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406123 () Unit!30502)

(declare-fun addStillContains!335 (ListLongMap!10753 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> b!899369 (= lt!406123 (addStillContains!335 lt!406109 lt!406105 (zeroValue!5256 thiss!1181) lt!406110))))

(assert (=> b!899369 (contains!4391 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) lt!406110)))

(declare-fun lt!406107 () Unit!30502)

(assert (=> b!899369 (= lt!406107 lt!406123)))

(declare-fun lt!406112 () ListLongMap!10753)

(assert (=> b!899369 (= lt!406112 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406125 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406116 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406116 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406114 () Unit!30502)

(declare-fun addApplyDifferent!335 (ListLongMap!10753 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> b!899369 (= lt!406114 (addApplyDifferent!335 lt!406112 lt!406125 (minValue!5256 thiss!1181) lt!406116))))

(assert (=> b!899369 (= (apply!409 (+!2620 lt!406112 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) lt!406116) (apply!409 lt!406112 lt!406116))))

(declare-fun lt!406118 () Unit!30502)

(assert (=> b!899369 (= lt!406118 lt!406114)))

(declare-fun lt!406120 () ListLongMap!10753)

(assert (=> b!899369 (= lt!406120 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406108 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406122 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406122 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406115 () Unit!30502)

(assert (=> b!899369 (= lt!406115 (addApplyDifferent!335 lt!406120 lt!406108 (zeroValue!5256 thiss!1181) lt!406122))))

(assert (=> b!899369 (= (apply!409 (+!2620 lt!406120 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) lt!406122) (apply!409 lt!406120 lt!406122))))

(declare-fun lt!406111 () Unit!30502)

(assert (=> b!899369 (= lt!406111 lt!406115)))

(declare-fun lt!406106 () ListLongMap!10753)

(assert (=> b!899369 (= lt!406106 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406119 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406121 () (_ BitVec 64))

(assert (=> b!899369 (= lt!406121 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899369 (= lt!406117 (addApplyDifferent!335 lt!406106 lt!406119 (minValue!5256 thiss!1181) lt!406121))))

(assert (=> b!899369 (= (apply!409 (+!2620 lt!406106 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) lt!406121) (apply!409 lt!406106 lt!406121))))

(declare-fun bm!39934 () Bool)

(assert (=> bm!39934 (= call!39937 call!39936)))

(declare-fun b!899370 () Bool)

(declare-fun c!95105 () Bool)

(assert (=> b!899370 (= c!95105 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!899370 (= e!503247 e!503249)))

(declare-fun bm!39935 () Bool)

(declare-fun call!39934 () Bool)

(assert (=> bm!39935 (= call!39934 (contains!4391 lt!406113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899371 () Bool)

(assert (=> b!899371 (= e!503256 e!503247)))

(assert (=> b!899371 (= c!95106 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899372 () Bool)

(assert (=> b!899372 (= e!503254 (not call!39934))))

(declare-fun b!899373 () Bool)

(assert (=> b!899373 (= e!503254 e!503258)))

(declare-fun res!607582 () Bool)

(assert (=> b!899373 (= res!607582 call!39934)))

(assert (=> b!899373 (=> (not res!607582) (not e!503258))))

(declare-fun b!899374 () Bool)

(assert (=> b!899374 (= e!503252 (not call!39938))))

(assert (= (and d!111305 c!95107) b!899367))

(assert (= (and d!111305 (not c!95107)) b!899371))

(assert (= (and b!899371 c!95106) b!899357))

(assert (= (and b!899371 (not c!95106)) b!899370))

(assert (= (and b!899370 c!95105) b!899354))

(assert (= (and b!899370 (not c!95105)) b!899356))

(assert (= (or b!899354 b!899356) bm!39931))

(assert (= (or b!899357 bm!39931) bm!39932))

(assert (= (or b!899357 b!899354) bm!39934))

(assert (= (or b!899367 bm!39932) bm!39929))

(assert (= (or b!899367 bm!39934) bm!39933))

(assert (= (and d!111305 res!607585) b!899359))

(assert (= (and d!111305 c!95103) b!899369))

(assert (= (and d!111305 (not c!95103)) b!899364))

(assert (= (and d!111305 res!607584) b!899365))

(assert (= (and b!899365 res!607580) b!899368))

(assert (= (and b!899365 (not res!607587)) b!899358))

(assert (= (and b!899358 res!607581) b!899362))

(assert (= (and b!899365 res!607586) b!899361))

(assert (= (and b!899361 c!95108) b!899373))

(assert (= (and b!899361 (not c!95108)) b!899372))

(assert (= (and b!899373 res!607582) b!899360))

(assert (= (or b!899373 b!899372) bm!39935))

(assert (= (and b!899361 res!607579) b!899363))

(assert (= (and b!899363 c!95104) b!899366))

(assert (= (and b!899363 (not c!95104)) b!899374))

(assert (= (and b!899366 res!607583) b!899355))

(assert (= (or b!899366 b!899374) bm!39930))

(declare-fun b_lambda!12973 () Bool)

(assert (=> (not b_lambda!12973) (not b!899362)))

(declare-fun t!25198 () Bool)

(declare-fun tb!5191 () Bool)

(assert (=> (and b!899207 (= (defaultEntry!5431 thiss!1181) (defaultEntry!5431 thiss!1181)) t!25198) tb!5191))

(declare-fun result!10161 () Bool)

(assert (=> tb!5191 (= result!10161 tp_is_empty!18361)))

(assert (=> b!899362 t!25198))

(declare-fun b_and!26321 () Bool)

(assert (= b_and!26315 (and (=> t!25198 result!10161) b_and!26321)))

(declare-fun m!835281 () Bool)

(assert (=> bm!39933 m!835281))

(declare-fun m!835283 () Bool)

(assert (=> b!899369 m!835283))

(declare-fun m!835285 () Bool)

(assert (=> b!899369 m!835285))

(declare-fun m!835287 () Bool)

(assert (=> b!899369 m!835287))

(assert (=> b!899369 m!835285))

(declare-fun m!835289 () Bool)

(assert (=> b!899369 m!835289))

(declare-fun m!835291 () Bool)

(assert (=> b!899369 m!835291))

(declare-fun m!835293 () Bool)

(assert (=> b!899369 m!835293))

(declare-fun m!835295 () Bool)

(assert (=> b!899369 m!835295))

(assert (=> b!899369 m!835277))

(declare-fun m!835297 () Bool)

(assert (=> b!899369 m!835297))

(declare-fun m!835299 () Bool)

(assert (=> b!899369 m!835299))

(declare-fun m!835301 () Bool)

(assert (=> b!899369 m!835301))

(assert (=> b!899369 m!835291))

(assert (=> b!899369 m!835287))

(declare-fun m!835303 () Bool)

(assert (=> b!899369 m!835303))

(declare-fun m!835305 () Bool)

(assert (=> b!899369 m!835305))

(declare-fun m!835307 () Bool)

(assert (=> b!899369 m!835307))

(assert (=> b!899369 m!835297))

(declare-fun m!835309 () Bool)

(assert (=> b!899369 m!835309))

(declare-fun m!835311 () Bool)

(assert (=> b!899369 m!835311))

(declare-fun m!835313 () Bool)

(assert (=> b!899369 m!835313))

(assert (=> bm!39929 m!835313))

(declare-fun m!835315 () Bool)

(assert (=> b!899362 m!835315))

(assert (=> b!899362 m!835277))

(declare-fun m!835317 () Bool)

(assert (=> b!899362 m!835317))

(declare-fun m!835319 () Bool)

(assert (=> b!899362 m!835319))

(assert (=> b!899362 m!835319))

(assert (=> b!899362 m!835315))

(declare-fun m!835321 () Bool)

(assert (=> b!899362 m!835321))

(assert (=> b!899362 m!835277))

(assert (=> b!899358 m!835277))

(assert (=> b!899358 m!835277))

(declare-fun m!835323 () Bool)

(assert (=> b!899358 m!835323))

(declare-fun m!835325 () Bool)

(assert (=> bm!39935 m!835325))

(declare-fun m!835327 () Bool)

(assert (=> b!899360 m!835327))

(assert (=> b!899368 m!835277))

(assert (=> b!899368 m!835277))

(declare-fun m!835329 () Bool)

(assert (=> b!899368 m!835329))

(assert (=> b!899359 m!835277))

(assert (=> b!899359 m!835277))

(assert (=> b!899359 m!835329))

(declare-fun m!835331 () Bool)

(assert (=> bm!39930 m!835331))

(assert (=> d!111305 m!835175))

(declare-fun m!835333 () Bool)

(assert (=> b!899355 m!835333))

(declare-fun m!835335 () Bool)

(assert (=> b!899367 m!835335))

(assert (=> b!899202 d!111305))

(declare-fun d!111307 () Bool)

(assert (=> d!111307 (= (array_inv!19942 (_keys!10215 thiss!1181)) (bvsge (size!25808 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899207 d!111307))

(declare-fun d!111309 () Bool)

(assert (=> d!111309 (= (array_inv!19943 (_values!5443 thiss!1181)) (bvsge (size!25809 (_values!5443 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899207 d!111309))

(declare-fun condMapEmpty!29216 () Bool)

(declare-fun mapDefault!29216 () ValueCell!8699)

(assert (=> mapNonEmpty!29207 (= condMapEmpty!29216 (= mapRest!29207 ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29216)))))

(declare-fun e!503265 () Bool)

(declare-fun mapRes!29216 () Bool)

(assert (=> mapNonEmpty!29207 (= tp!56180 (and e!503265 mapRes!29216))))

(declare-fun b!899383 () Bool)

(declare-fun e!503264 () Bool)

(assert (=> b!899383 (= e!503264 tp_is_empty!18361)))

(declare-fun b!899384 () Bool)

(assert (=> b!899384 (= e!503265 tp_is_empty!18361)))

(declare-fun mapNonEmpty!29216 () Bool)

(declare-fun tp!56195 () Bool)

(assert (=> mapNonEmpty!29216 (= mapRes!29216 (and tp!56195 e!503264))))

(declare-fun mapValue!29216 () ValueCell!8699)

(declare-fun mapKey!29216 () (_ BitVec 32))

(declare-fun mapRest!29216 () (Array (_ BitVec 32) ValueCell!8699))

(assert (=> mapNonEmpty!29216 (= mapRest!29207 (store mapRest!29216 mapKey!29216 mapValue!29216))))

(declare-fun mapIsEmpty!29216 () Bool)

(assert (=> mapIsEmpty!29216 mapRes!29216))

(assert (= (and mapNonEmpty!29207 condMapEmpty!29216) mapIsEmpty!29216))

(assert (= (and mapNonEmpty!29207 (not condMapEmpty!29216)) mapNonEmpty!29216))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8699) mapValue!29216)) b!899383))

(assert (= (and mapNonEmpty!29207 ((_ is ValueCellFull!8699) mapDefault!29216)) b!899384))

(declare-fun m!835337 () Bool)

(assert (=> mapNonEmpty!29216 m!835337))

(declare-fun b_lambda!12975 () Bool)

(assert (= b_lambda!12973 (or (and b!899207 b_free!16033) b_lambda!12975)))

(check-sat (not b!899369) (not b!899368) (not d!111291) (not b!899275) b_and!26321 (not b!899271) (not b!899303) (not b!899296) (not b!899292) (not d!111295) (not b!899360) (not b_lambda!12975) (not d!111297) (not b!899355) (not b!899272) (not mapNonEmpty!29216) (not bm!39930) (not b!899311) tp_is_empty!18361 (not b!899358) (not d!111289) (not bm!39933) (not bm!39935) (not d!111305) (not b!899359) (not b!899270) (not d!111301) (not b!899305) (not d!111293) (not b!899362) (not b!899367) (not bm!39929) (not b_next!16033))
(check-sat b_and!26321 (not b_next!16033))
(get-model)

(declare-fun d!111311 () Bool)

(declare-fun res!607592 () Bool)

(declare-fun e!503270 () Bool)

(assert (=> d!111311 (=> res!607592 e!503270)))

(assert (=> d!111311 (= res!607592 (and ((_ is Cons!17853) (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (= (_1!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))))

(assert (=> d!111311 (= (containsKey!428 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))) e!503270)))

(declare-fun b!899389 () Bool)

(declare-fun e!503271 () Bool)

(assert (=> b!899389 (= e!503270 e!503271)))

(declare-fun res!607593 () Bool)

(assert (=> b!899389 (=> (not res!607593) (not e!503271))))

(assert (=> b!899389 (= res!607593 (and (or (not ((_ is Cons!17853) (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (bvsle (_1!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))) ((_ is Cons!17853) (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (bvslt (_1!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))))

(declare-fun b!899390 () Bool)

(assert (=> b!899390 (= e!503271 (containsKey!428 (t!25195 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(assert (= (and d!111311 (not res!607592)) b!899389))

(assert (= (and b!899389 res!607593) b!899390))

(assert (=> b!899390 m!835165))

(declare-fun m!835339 () Bool)

(assert (=> b!899390 m!835339))

(assert (=> d!111297 d!111311))

(declare-fun d!111313 () Bool)

(declare-fun e!503273 () Bool)

(assert (=> d!111313 e!503273))

(declare-fun res!607594 () Bool)

(assert (=> d!111313 (=> res!607594 e!503273)))

(declare-fun lt!406127 () Bool)

(assert (=> d!111313 (= res!607594 (not lt!406127))))

(declare-fun lt!406126 () Bool)

(assert (=> d!111313 (= lt!406127 lt!406126)))

(declare-fun lt!406128 () Unit!30502)

(declare-fun e!503272 () Unit!30502)

(assert (=> d!111313 (= lt!406128 e!503272)))

(declare-fun c!95109 () Bool)

(assert (=> d!111313 (= c!95109 lt!406126)))

(assert (=> d!111313 (= lt!406126 (containsKey!428 (toList!5392 lt!406113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111313 (= (contains!4391 lt!406113 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406127)))

(declare-fun b!899391 () Bool)

(declare-fun lt!406129 () Unit!30502)

(assert (=> b!899391 (= e!503272 lt!406129)))

(assert (=> b!899391 (= lt!406129 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 lt!406113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899391 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899392 () Bool)

(declare-fun Unit!30508 () Unit!30502)

(assert (=> b!899392 (= e!503272 Unit!30508)))

(declare-fun b!899393 () Bool)

(assert (=> b!899393 (= e!503273 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111313 c!95109) b!899391))

(assert (= (and d!111313 (not c!95109)) b!899392))

(assert (= (and d!111313 (not res!607594)) b!899393))

(declare-fun m!835341 () Bool)

(assert (=> d!111313 m!835341))

(declare-fun m!835343 () Bool)

(assert (=> b!899391 m!835343))

(declare-fun m!835345 () Bool)

(assert (=> b!899391 m!835345))

(assert (=> b!899391 m!835345))

(declare-fun m!835347 () Bool)

(assert (=> b!899391 m!835347))

(assert (=> b!899393 m!835345))

(assert (=> b!899393 m!835345))

(assert (=> b!899393 m!835347))

(assert (=> bm!39930 d!111313))

(declare-fun d!111315 () Bool)

(declare-fun get!13337 (Option!466) V!29447)

(assert (=> d!111315 (= (apply!409 lt!406113 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13337 (getValueByKey!460 (toList!5392 lt!406113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25220 () Bool)

(assert (= bs!25220 d!111315))

(declare-fun m!835349 () Bool)

(assert (=> bs!25220 m!835349))

(assert (=> bs!25220 m!835349))

(declare-fun m!835351 () Bool)

(assert (=> bs!25220 m!835351))

(assert (=> b!899360 d!111315))

(assert (=> b!899296 d!111297))

(assert (=> b!899296 d!111305))

(declare-fun d!111317 () Bool)

(declare-fun res!607603 () Bool)

(declare-fun e!503283 () Bool)

(assert (=> d!111317 (=> res!607603 e!503283)))

(assert (=> d!111317 (= res!607603 (bvsge #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> d!111317 (= (arrayNoDuplicates!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 Nil!17856) e!503283)))

(declare-fun b!899404 () Bool)

(declare-fun e!503285 () Bool)

(assert (=> b!899404 (= e!503283 e!503285)))

(declare-fun res!607601 () Bool)

(assert (=> b!899404 (=> (not res!607601) (not e!503285))))

(declare-fun e!503284 () Bool)

(assert (=> b!899404 (= res!607601 (not e!503284))))

(declare-fun res!607602 () Bool)

(assert (=> b!899404 (=> (not res!607602) (not e!503284))))

(assert (=> b!899404 (= res!607602 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899405 () Bool)

(declare-fun contains!4393 (List!17859 (_ BitVec 64)) Bool)

(assert (=> b!899405 (= e!503284 (contains!4393 Nil!17856 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899406 () Bool)

(declare-fun e!503282 () Bool)

(assert (=> b!899406 (= e!503285 e!503282)))

(declare-fun c!95112 () Bool)

(assert (=> b!899406 (= c!95112 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899407 () Bool)

(declare-fun call!39941 () Bool)

(assert (=> b!899407 (= e!503282 call!39941)))

(declare-fun b!899408 () Bool)

(assert (=> b!899408 (= e!503282 call!39941)))

(declare-fun bm!39938 () Bool)

(assert (=> bm!39938 (= call!39941 (arrayNoDuplicates!0 (_keys!10215 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95112 (Cons!17855 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) Nil!17856) Nil!17856)))))

(assert (= (and d!111317 (not res!607603)) b!899404))

(assert (= (and b!899404 res!607602) b!899405))

(assert (= (and b!899404 res!607601) b!899406))

(assert (= (and b!899406 c!95112) b!899407))

(assert (= (and b!899406 (not c!95112)) b!899408))

(assert (= (or b!899407 b!899408) bm!39938))

(assert (=> b!899404 m!835277))

(assert (=> b!899404 m!835277))

(assert (=> b!899404 m!835329))

(assert (=> b!899405 m!835277))

(assert (=> b!899405 m!835277))

(declare-fun m!835353 () Bool)

(assert (=> b!899405 m!835353))

(assert (=> b!899406 m!835277))

(assert (=> b!899406 m!835277))

(assert (=> b!899406 m!835329))

(assert (=> bm!39938 m!835277))

(declare-fun m!835355 () Bool)

(assert (=> bm!39938 m!835355))

(assert (=> b!899272 d!111317))

(declare-fun d!111319 () Bool)

(assert (=> d!111319 (= (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899359 d!111319))

(declare-fun b!899433 () Bool)

(declare-fun e!503305 () Bool)

(declare-fun e!503300 () Bool)

(assert (=> b!899433 (= e!503305 e!503300)))

(declare-fun c!95122 () Bool)

(assert (=> b!899433 (= c!95122 (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899434 () Bool)

(declare-fun lt!406149 () ListLongMap!10753)

(declare-fun isEmpty!693 (ListLongMap!10753) Bool)

(assert (=> b!899434 (= e!503300 (isEmpty!693 lt!406149))))

(declare-fun b!899435 () Bool)

(assert (=> b!899435 (= e!503300 (= lt!406149 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5431 thiss!1181))))))

(declare-fun b!899436 () Bool)

(declare-fun e!503301 () ListLongMap!10753)

(declare-fun e!503304 () ListLongMap!10753)

(assert (=> b!899436 (= e!503301 e!503304)))

(declare-fun c!95121 () Bool)

(assert (=> b!899436 (= c!95121 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899437 () Bool)

(assert (=> b!899437 (= e!503301 (ListLongMap!10754 Nil!17854))))

(declare-fun bm!39941 () Bool)

(declare-fun call!39944 () ListLongMap!10753)

(assert (=> bm!39941 (= call!39944 (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5431 thiss!1181)))))

(declare-fun d!111321 () Bool)

(declare-fun e!503303 () Bool)

(assert (=> d!111321 e!503303))

(declare-fun res!607613 () Bool)

(assert (=> d!111321 (=> (not res!607613) (not e!503303))))

(assert (=> d!111321 (= res!607613 (not (contains!4391 lt!406149 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111321 (= lt!406149 e!503301)))

(declare-fun c!95124 () Bool)

(assert (=> d!111321 (= c!95124 (bvsge #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> d!111321 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111321 (= (getCurrentListMapNoExtraKeys!3317 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) lt!406149)))

(declare-fun b!899438 () Bool)

(assert (=> b!899438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> b!899438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25809 (_values!5443 thiss!1181))))))

(declare-fun e!503306 () Bool)

(assert (=> b!899438 (= e!503306 (= (apply!409 lt!406149 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13336 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!899439 () Bool)

(assert (=> b!899439 (= e!503303 e!503305)))

(declare-fun c!95123 () Bool)

(declare-fun e!503302 () Bool)

(assert (=> b!899439 (= c!95123 e!503302)))

(declare-fun res!607614 () Bool)

(assert (=> b!899439 (=> (not res!607614) (not e!503302))))

(assert (=> b!899439 (= res!607614 (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899440 () Bool)

(declare-fun lt!406146 () Unit!30502)

(declare-fun lt!406147 () Unit!30502)

(assert (=> b!899440 (= lt!406146 lt!406147)))

(declare-fun lt!406145 () V!29447)

(declare-fun lt!406150 () (_ BitVec 64))

(declare-fun lt!406148 () ListLongMap!10753)

(declare-fun lt!406144 () (_ BitVec 64))

(assert (=> b!899440 (not (contains!4391 (+!2620 lt!406148 (tuple2!12067 lt!406150 lt!406145)) lt!406144))))

(declare-fun addStillNotContains!217 (ListLongMap!10753 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> b!899440 (= lt!406147 (addStillNotContains!217 lt!406148 lt!406150 lt!406145 lt!406144))))

(assert (=> b!899440 (= lt!406144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899440 (= lt!406145 (get!13336 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899440 (= lt!406150 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899440 (= lt!406148 call!39944)))

(assert (=> b!899440 (= e!503304 (+!2620 call!39944 (tuple2!12067 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) (get!13336 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!899441 () Bool)

(assert (=> b!899441 (= e!503302 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899441 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!899442 () Bool)

(assert (=> b!899442 (= e!503305 e!503306)))

(assert (=> b!899442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun res!607615 () Bool)

(assert (=> b!899442 (= res!607615 (contains!4391 lt!406149 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899442 (=> (not res!607615) (not e!503306))))

(declare-fun b!899443 () Bool)

(assert (=> b!899443 (= e!503304 call!39944)))

(declare-fun b!899444 () Bool)

(declare-fun res!607612 () Bool)

(assert (=> b!899444 (=> (not res!607612) (not e!503303))))

(assert (=> b!899444 (= res!607612 (not (contains!4391 lt!406149 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111321 c!95124) b!899437))

(assert (= (and d!111321 (not c!95124)) b!899436))

(assert (= (and b!899436 c!95121) b!899440))

(assert (= (and b!899436 (not c!95121)) b!899443))

(assert (= (or b!899440 b!899443) bm!39941))

(assert (= (and d!111321 res!607613) b!899444))

(assert (= (and b!899444 res!607612) b!899439))

(assert (= (and b!899439 res!607614) b!899441))

(assert (= (and b!899439 c!95123) b!899442))

(assert (= (and b!899439 (not c!95123)) b!899433))

(assert (= (and b!899442 res!607615) b!899438))

(assert (= (and b!899433 c!95122) b!899435))

(assert (= (and b!899433 (not c!95122)) b!899434))

(declare-fun b_lambda!12977 () Bool)

(assert (=> (not b_lambda!12977) (not b!899438)))

(assert (=> b!899438 t!25198))

(declare-fun b_and!26323 () Bool)

(assert (= b_and!26321 (and (=> t!25198 result!10161) b_and!26323)))

(declare-fun b_lambda!12979 () Bool)

(assert (=> (not b_lambda!12979) (not b!899440)))

(assert (=> b!899440 t!25198))

(declare-fun b_and!26325 () Bool)

(assert (= b_and!26323 (and (=> t!25198 result!10161) b_and!26325)))

(declare-fun m!835357 () Bool)

(assert (=> b!899444 m!835357))

(declare-fun m!835359 () Bool)

(assert (=> b!899435 m!835359))

(declare-fun m!835361 () Bool)

(assert (=> b!899440 m!835361))

(assert (=> b!899440 m!835361))

(declare-fun m!835363 () Bool)

(assert (=> b!899440 m!835363))

(assert (=> b!899440 m!835319))

(declare-fun m!835365 () Bool)

(assert (=> b!899440 m!835365))

(assert (=> b!899440 m!835315))

(declare-fun m!835367 () Bool)

(assert (=> b!899440 m!835367))

(assert (=> b!899440 m!835277))

(assert (=> b!899440 m!835319))

(assert (=> b!899440 m!835315))

(assert (=> b!899440 m!835321))

(assert (=> b!899442 m!835277))

(assert (=> b!899442 m!835277))

(declare-fun m!835369 () Bool)

(assert (=> b!899442 m!835369))

(assert (=> b!899436 m!835277))

(assert (=> b!899436 m!835277))

(assert (=> b!899436 m!835329))

(assert (=> bm!39941 m!835359))

(assert (=> b!899438 m!835315))

(assert (=> b!899438 m!835319))

(assert (=> b!899438 m!835277))

(assert (=> b!899438 m!835319))

(assert (=> b!899438 m!835315))

(assert (=> b!899438 m!835321))

(assert (=> b!899438 m!835277))

(declare-fun m!835371 () Bool)

(assert (=> b!899438 m!835371))

(declare-fun m!835373 () Bool)

(assert (=> b!899434 m!835373))

(declare-fun m!835375 () Bool)

(assert (=> d!111321 m!835375))

(assert (=> d!111321 m!835175))

(assert (=> b!899441 m!835277))

(assert (=> b!899441 m!835277))

(assert (=> b!899441 m!835329))

(assert (=> bm!39929 d!111321))

(declare-fun d!111323 () Bool)

(declare-fun isEmpty!694 (Option!466) Bool)

(assert (=> d!111323 (= (isDefined!336 (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))) (not (isEmpty!694 (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))))

(declare-fun bs!25221 () Bool)

(assert (= bs!25221 d!111323))

(assert (=> bs!25221 m!835271))

(declare-fun m!835377 () Bool)

(assert (=> bs!25221 m!835377))

(assert (=> b!899305 d!111323))

(declare-fun d!111325 () Bool)

(declare-fun c!95129 () Bool)

(assert (=> d!111325 (= c!95129 (and ((_ is Cons!17853) (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (= (_1!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))))

(declare-fun e!503311 () Option!466)

(assert (=> d!111325 (= (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))) e!503311)))

(declare-fun b!899454 () Bool)

(declare-fun e!503312 () Option!466)

(assert (=> b!899454 (= e!503311 e!503312)))

(declare-fun c!95130 () Bool)

(assert (=> b!899454 (= c!95130 (and ((_ is Cons!17853) (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (not (= (_1!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))))

(declare-fun b!899455 () Bool)

(assert (=> b!899455 (= e!503312 (getValueByKey!460 (t!25195 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(declare-fun b!899453 () Bool)

(assert (=> b!899453 (= e!503311 (Some!465 (_2!6044 (h!18997 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))))))

(declare-fun b!899456 () Bool)

(assert (=> b!899456 (= e!503312 None!464)))

(assert (= (and d!111325 c!95129) b!899453))

(assert (= (and d!111325 (not c!95129)) b!899454))

(assert (= (and b!899454 c!95130) b!899455))

(assert (= (and b!899454 (not c!95130)) b!899456))

(assert (=> b!899455 m!835165))

(declare-fun m!835379 () Bool)

(assert (=> b!899455 m!835379))

(assert (=> b!899305 d!111325))

(declare-fun d!111327 () Bool)

(declare-fun e!503314 () Bool)

(assert (=> d!111327 e!503314))

(declare-fun res!607616 () Bool)

(assert (=> d!111327 (=> res!607616 e!503314)))

(declare-fun lt!406152 () Bool)

(assert (=> d!111327 (= res!607616 (not lt!406152))))

(declare-fun lt!406151 () Bool)

(assert (=> d!111327 (= lt!406152 lt!406151)))

(declare-fun lt!406153 () Unit!30502)

(declare-fun e!503313 () Unit!30502)

(assert (=> d!111327 (= lt!406153 e!503313)))

(declare-fun c!95131 () Bool)

(assert (=> d!111327 (= c!95131 lt!406151)))

(assert (=> d!111327 (= lt!406151 (containsKey!428 (toList!5392 lt!406113) (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111327 (= (contains!4391 lt!406113 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) lt!406152)))

(declare-fun b!899457 () Bool)

(declare-fun lt!406154 () Unit!30502)

(assert (=> b!899457 (= e!503313 lt!406154)))

(assert (=> b!899457 (= lt!406154 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 lt!406113) (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899457 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899458 () Bool)

(declare-fun Unit!30509 () Unit!30502)

(assert (=> b!899458 (= e!503313 Unit!30509)))

(declare-fun b!899459 () Bool)

(assert (=> b!899459 (= e!503314 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111327 c!95131) b!899457))

(assert (= (and d!111327 (not c!95131)) b!899458))

(assert (= (and d!111327 (not res!607616)) b!899459))

(assert (=> d!111327 m!835277))

(declare-fun m!835381 () Bool)

(assert (=> d!111327 m!835381))

(assert (=> b!899457 m!835277))

(declare-fun m!835383 () Bool)

(assert (=> b!899457 m!835383))

(assert (=> b!899457 m!835277))

(declare-fun m!835385 () Bool)

(assert (=> b!899457 m!835385))

(assert (=> b!899457 m!835385))

(declare-fun m!835387 () Bool)

(assert (=> b!899457 m!835387))

(assert (=> b!899459 m!835277))

(assert (=> b!899459 m!835385))

(assert (=> b!899459 m!835385))

(assert (=> b!899459 m!835387))

(assert (=> b!899358 d!111327))

(declare-fun d!111329 () Bool)

(assert (=> d!111329 (contains!4391 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998)))))

(assert (=> d!111329 true))

(declare-fun _$16!184 () Unit!30502)

(assert (=> d!111329 (= (choose!1512 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!38104 lt!405998) (defaultEntry!5431 thiss!1181)) _$16!184)))

(declare-fun bs!25222 () Bool)

(assert (= bs!25222 d!111329))

(assert (=> bs!25222 m!835169))

(assert (=> bs!25222 m!835165))

(assert (=> bs!25222 m!835169))

(assert (=> bs!25222 m!835165))

(assert (=> bs!25222 m!835171))

(assert (=> d!111295 d!111329))

(assert (=> d!111295 d!111299))

(declare-fun b!899468 () Bool)

(declare-fun e!503321 () Bool)

(declare-fun call!39947 () Bool)

(assert (=> b!899468 (= e!503321 call!39947)))

(declare-fun bm!39944 () Bool)

(assert (=> bm!39944 (= call!39947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun d!111331 () Bool)

(declare-fun res!607621 () Bool)

(declare-fun e!503322 () Bool)

(assert (=> d!111331 (=> res!607621 e!503322)))

(assert (=> d!111331 (= res!607621 (bvsge #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> d!111331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)) e!503322)))

(declare-fun b!899469 () Bool)

(assert (=> b!899469 (= e!503322 e!503321)))

(declare-fun c!95134 () Bool)

(assert (=> b!899469 (= c!95134 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899470 () Bool)

(declare-fun e!503323 () Bool)

(assert (=> b!899470 (= e!503321 e!503323)))

(declare-fun lt!406162 () (_ BitVec 64))

(assert (=> b!899470 (= lt!406162 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406163 () Unit!30502)

(assert (=> b!899470 (= lt!406163 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) lt!406162 #b00000000000000000000000000000000))))

(assert (=> b!899470 (arrayContainsKey!0 (_keys!10215 thiss!1181) lt!406162 #b00000000000000000000000000000000)))

(declare-fun lt!406161 () Unit!30502)

(assert (=> b!899470 (= lt!406161 lt!406163)))

(declare-fun res!607622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899470 (= res!607622 (= (seekEntryOrOpen!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) (_keys!10215 thiss!1181) (mask!26182 thiss!1181)) (Found!8933 #b00000000000000000000000000000000)))))

(assert (=> b!899470 (=> (not res!607622) (not e!503323))))

(declare-fun b!899471 () Bool)

(assert (=> b!899471 (= e!503323 call!39947)))

(assert (= (and d!111331 (not res!607621)) b!899469))

(assert (= (and b!899469 c!95134) b!899470))

(assert (= (and b!899469 (not c!95134)) b!899468))

(assert (= (and b!899470 res!607622) b!899471))

(assert (= (or b!899471 b!899468) bm!39944))

(declare-fun m!835389 () Bool)

(assert (=> bm!39944 m!835389))

(assert (=> b!899469 m!835277))

(assert (=> b!899469 m!835277))

(assert (=> b!899469 m!835329))

(assert (=> b!899470 m!835277))

(declare-fun m!835391 () Bool)

(assert (=> b!899470 m!835391))

(declare-fun m!835393 () Bool)

(assert (=> b!899470 m!835393))

(assert (=> b!899470 m!835277))

(declare-fun m!835395 () Bool)

(assert (=> b!899470 m!835395))

(assert (=> b!899271 d!111331))

(declare-fun b!899490 () Bool)

(declare-fun lt!406169 () SeekEntryResult!8933)

(assert (=> b!899490 (and (bvsge (index!38105 lt!406169) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406169) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun e!503337 () Bool)

(assert (=> b!899490 (= e!503337 (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38105 lt!406169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899491 () Bool)

(declare-fun e!503335 () SeekEntryResult!8933)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899491 (= e!503335 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26182 thiss!1181)) #b00000000000000000000000000000000 (mask!26182 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun b!899492 () Bool)

(declare-fun e!503336 () SeekEntryResult!8933)

(assert (=> b!899492 (= e!503336 (Intermediate!8933 true (toIndex!0 key!785 (mask!26182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899493 () Bool)

(assert (=> b!899493 (and (bvsge (index!38105 lt!406169) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406169) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun res!607630 () Bool)

(assert (=> b!899493 (= res!607630 (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38105 lt!406169)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899493 (=> res!607630 e!503337)))

(declare-fun b!899494 () Bool)

(assert (=> b!899494 (and (bvsge (index!38105 lt!406169) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406169) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun res!607629 () Bool)

(assert (=> b!899494 (= res!607629 (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38105 lt!406169)) key!785))))

(assert (=> b!899494 (=> res!607629 e!503337)))

(declare-fun e!503334 () Bool)

(assert (=> b!899494 (= e!503334 e!503337)))

(declare-fun b!899495 () Bool)

(declare-fun e!503338 () Bool)

(assert (=> b!899495 (= e!503338 e!503334)))

(declare-fun res!607631 () Bool)

(assert (=> b!899495 (= res!607631 (and ((_ is Intermediate!8933) lt!406169) (not (undefined!9745 lt!406169)) (bvslt (x!76645 lt!406169) #b01111111111111111111111111111110) (bvsge (x!76645 lt!406169) #b00000000000000000000000000000000) (bvsge (x!76645 lt!406169) #b00000000000000000000000000000000)))))

(assert (=> b!899495 (=> (not res!607631) (not e!503334))))

(declare-fun b!899496 () Bool)

(assert (=> b!899496 (= e!503338 (bvsge (x!76645 lt!406169) #b01111111111111111111111111111110))))

(declare-fun d!111333 () Bool)

(assert (=> d!111333 e!503338))

(declare-fun c!95143 () Bool)

(assert (=> d!111333 (= c!95143 (and ((_ is Intermediate!8933) lt!406169) (undefined!9745 lt!406169)))))

(assert (=> d!111333 (= lt!406169 e!503336)))

(declare-fun c!95142 () Bool)

(assert (=> d!111333 (= c!95142 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!406168 () (_ BitVec 64))

(assert (=> d!111333 (= lt!406168 (select (arr!25349 (_keys!10215 thiss!1181)) (toIndex!0 key!785 (mask!26182 thiss!1181))))))

(assert (=> d!111333 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26182 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)) lt!406169)))

(declare-fun b!899497 () Bool)

(assert (=> b!899497 (= e!503335 (Intermediate!8933 false (toIndex!0 key!785 (mask!26182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899498 () Bool)

(assert (=> b!899498 (= e!503336 e!503335)))

(declare-fun c!95141 () Bool)

(assert (=> b!899498 (= c!95141 (or (= lt!406168 key!785) (= (bvadd lt!406168 lt!406168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111333 c!95142) b!899492))

(assert (= (and d!111333 (not c!95142)) b!899498))

(assert (= (and b!899498 c!95141) b!899497))

(assert (= (and b!899498 (not c!95141)) b!899491))

(assert (= (and d!111333 c!95143) b!899496))

(assert (= (and d!111333 (not c!95143)) b!899495))

(assert (= (and b!899495 res!607631) b!899494))

(assert (= (and b!899494 (not res!607629)) b!899493))

(assert (= (and b!899493 (not res!607630)) b!899490))

(assert (=> b!899491 m!835257))

(declare-fun m!835397 () Bool)

(assert (=> b!899491 m!835397))

(assert (=> b!899491 m!835397))

(declare-fun m!835399 () Bool)

(assert (=> b!899491 m!835399))

(declare-fun m!835401 () Bool)

(assert (=> b!899490 m!835401))

(assert (=> b!899494 m!835401))

(assert (=> b!899493 m!835401))

(assert (=> d!111333 m!835257))

(declare-fun m!835403 () Bool)

(assert (=> d!111333 m!835403))

(assert (=> d!111333 m!835175))

(assert (=> d!111293 d!111333))

(declare-fun d!111335 () Bool)

(declare-fun lt!406175 () (_ BitVec 32))

(declare-fun lt!406174 () (_ BitVec 32))

(assert (=> d!111335 (= lt!406175 (bvmul (bvxor lt!406174 (bvlshr lt!406174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111335 (= lt!406174 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111335 (and (bvsge (mask!26182 thiss!1181) #b00000000000000000000000000000000) (let ((res!607632 (let ((h!19000 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76663 (bvmul (bvxor h!19000 (bvlshr h!19000 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76663 (bvlshr x!76663 #b00000000000000000000000000001101)) (mask!26182 thiss!1181)))))) (and (bvslt res!607632 (bvadd (mask!26182 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607632 #b00000000000000000000000000000000))))))

(assert (=> d!111335 (= (toIndex!0 key!785 (mask!26182 thiss!1181)) (bvand (bvxor lt!406175 (bvlshr lt!406175 #b00000000000000000000000000001101)) (mask!26182 thiss!1181)))))

(assert (=> d!111293 d!111335))

(assert (=> d!111293 d!111299))

(declare-fun b!899508 () Bool)

(declare-fun res!607643 () Bool)

(declare-fun e!503341 () Bool)

(assert (=> b!899508 (=> (not res!607643) (not e!503341))))

(declare-fun size!25814 (LongMapFixedSize!4414) (_ BitVec 32))

(assert (=> b!899508 (= res!607643 (bvsge (size!25814 thiss!1181) (_size!2262 thiss!1181)))))

(declare-fun b!899509 () Bool)

(declare-fun res!607642 () Bool)

(assert (=> b!899509 (=> (not res!607642) (not e!503341))))

(assert (=> b!899509 (= res!607642 (= (size!25814 thiss!1181) (bvadd (_size!2262 thiss!1181) (bvsdiv (bvadd (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!111337 () Bool)

(declare-fun res!607644 () Bool)

(assert (=> d!111337 (=> (not res!607644) (not e!503341))))

(assert (=> d!111337 (= res!607644 (validMask!0 (mask!26182 thiss!1181)))))

(assert (=> d!111337 (= (simpleValid!327 thiss!1181) e!503341)))

(declare-fun b!899510 () Bool)

(assert (=> b!899510 (= e!503341 (and (bvsge (extraKeys!5152 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5152 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2262 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899507 () Bool)

(declare-fun res!607641 () Bool)

(assert (=> b!899507 (=> (not res!607641) (not e!503341))))

(assert (=> b!899507 (= res!607641 (and (= (size!25809 (_values!5443 thiss!1181)) (bvadd (mask!26182 thiss!1181) #b00000000000000000000000000000001)) (= (size!25808 (_keys!10215 thiss!1181)) (size!25809 (_values!5443 thiss!1181))) (bvsge (_size!2262 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2262 thiss!1181) (bvadd (mask!26182 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!111337 res!607644) b!899507))

(assert (= (and b!899507 res!607641) b!899508))

(assert (= (and b!899508 res!607643) b!899509))

(assert (= (and b!899509 res!607642) b!899510))

(declare-fun m!835405 () Bool)

(assert (=> b!899508 m!835405))

(assert (=> b!899509 m!835405))

(assert (=> d!111337 m!835175))

(assert (=> d!111289 d!111337))

(declare-fun bm!39947 () Bool)

(declare-fun call!39950 () (_ BitVec 32))

(assert (=> bm!39947 (= call!39950 (arrayCountValidKeys!0 (_keys!10215 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun d!111339 () Bool)

(declare-fun lt!406178 () (_ BitVec 32))

(assert (=> d!111339 (and (bvsge lt!406178 #b00000000000000000000000000000000) (bvsle lt!406178 (bvsub (size!25808 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503347 () (_ BitVec 32))

(assert (=> d!111339 (= lt!406178 e!503347)))

(declare-fun c!95148 () Bool)

(assert (=> d!111339 (= c!95148 (bvsge #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> d!111339 (and (bvsle #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25808 (_keys!10215 thiss!1181)) (size!25808 (_keys!10215 thiss!1181))))))

(assert (=> d!111339 (= (arrayCountValidKeys!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 (size!25808 (_keys!10215 thiss!1181))) lt!406178)))

(declare-fun b!899519 () Bool)

(declare-fun e!503346 () (_ BitVec 32))

(assert (=> b!899519 (= e!503346 call!39950)))

(declare-fun b!899520 () Bool)

(assert (=> b!899520 (= e!503346 (bvadd #b00000000000000000000000000000001 call!39950))))

(declare-fun b!899521 () Bool)

(assert (=> b!899521 (= e!503347 #b00000000000000000000000000000000)))

(declare-fun b!899522 () Bool)

(assert (=> b!899522 (= e!503347 e!503346)))

(declare-fun c!95149 () Bool)

(assert (=> b!899522 (= c!95149 (validKeyInArray!0 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111339 c!95148) b!899521))

(assert (= (and d!111339 (not c!95148)) b!899522))

(assert (= (and b!899522 c!95149) b!899520))

(assert (= (and b!899522 (not c!95149)) b!899519))

(assert (= (or b!899520 b!899519) bm!39947))

(declare-fun m!835407 () Bool)

(assert (=> bm!39947 m!835407))

(assert (=> b!899522 m!835277))

(assert (=> b!899522 m!835277))

(assert (=> b!899522 m!835329))

(assert (=> b!899270 d!111339))

(declare-fun d!111341 () Bool)

(assert (=> d!111341 (= (apply!409 lt!406113 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13337 (getValueByKey!460 (toList!5392 lt!406113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25223 () Bool)

(assert (= bs!25223 d!111341))

(assert (=> bs!25223 m!835345))

(assert (=> bs!25223 m!835345))

(declare-fun m!835409 () Bool)

(assert (=> bs!25223 m!835409))

(assert (=> b!899355 d!111341))

(declare-fun d!111343 () Bool)

(declare-fun e!503349 () Bool)

(assert (=> d!111343 e!503349))

(declare-fun res!607645 () Bool)

(assert (=> d!111343 (=> res!607645 e!503349)))

(declare-fun lt!406180 () Bool)

(assert (=> d!111343 (= res!607645 (not lt!406180))))

(declare-fun lt!406179 () Bool)

(assert (=> d!111343 (= lt!406180 lt!406179)))

(declare-fun lt!406181 () Unit!30502)

(declare-fun e!503348 () Unit!30502)

(assert (=> d!111343 (= lt!406181 e!503348)))

(declare-fun c!95150 () Bool)

(assert (=> d!111343 (= c!95150 lt!406179)))

(assert (=> d!111343 (= lt!406179 (containsKey!428 (toList!5392 lt!406113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111343 (= (contains!4391 lt!406113 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406180)))

(declare-fun b!899523 () Bool)

(declare-fun lt!406182 () Unit!30502)

(assert (=> b!899523 (= e!503348 lt!406182)))

(assert (=> b!899523 (= lt!406182 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 lt!406113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899523 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899524 () Bool)

(declare-fun Unit!30510 () Unit!30502)

(assert (=> b!899524 (= e!503348 Unit!30510)))

(declare-fun b!899525 () Bool)

(assert (=> b!899525 (= e!503349 (isDefined!336 (getValueByKey!460 (toList!5392 lt!406113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111343 c!95150) b!899523))

(assert (= (and d!111343 (not c!95150)) b!899524))

(assert (= (and d!111343 (not res!607645)) b!899525))

(declare-fun m!835411 () Bool)

(assert (=> d!111343 m!835411))

(declare-fun m!835413 () Bool)

(assert (=> b!899523 m!835413))

(assert (=> b!899523 m!835349))

(assert (=> b!899523 m!835349))

(declare-fun m!835415 () Bool)

(assert (=> b!899523 m!835415))

(assert (=> b!899525 m!835349))

(assert (=> b!899525 m!835349))

(assert (=> b!899525 m!835415))

(assert (=> bm!39935 d!111343))

(declare-fun d!111345 () Bool)

(assert (=> d!111345 (isDefined!336 (getValueByKey!460 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(declare-fun lt!406185 () Unit!30502)

(declare-fun choose!1513 (List!17857 (_ BitVec 64)) Unit!30502)

(assert (=> d!111345 (= lt!406185 (choose!1513 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(declare-fun e!503352 () Bool)

(assert (=> d!111345 e!503352))

(declare-fun res!607648 () Bool)

(assert (=> d!111345 (=> (not res!607648) (not e!503352))))

(declare-fun isStrictlySorted!495 (List!17857) Bool)

(assert (=> d!111345 (= res!607648 (isStrictlySorted!495 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))))

(assert (=> d!111345 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))) lt!406185)))

(declare-fun b!899528 () Bool)

(assert (=> b!899528 (= e!503352 (containsKey!428 (toList!5392 (getCurrentListMap!2611 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!405998))))))

(assert (= (and d!111345 res!607648) b!899528))

(assert (=> d!111345 m!835165))

(assert (=> d!111345 m!835271))

(assert (=> d!111345 m!835271))

(assert (=> d!111345 m!835273))

(assert (=> d!111345 m!835165))

(declare-fun m!835417 () Bool)

(assert (=> d!111345 m!835417))

(declare-fun m!835419 () Bool)

(assert (=> d!111345 m!835419))

(assert (=> b!899528 m!835165))

(assert (=> b!899528 m!835267))

(assert (=> b!899303 d!111345))

(assert (=> b!899303 d!111323))

(assert (=> b!899303 d!111325))

(declare-fun d!111347 () Bool)

(assert (=> d!111347 (= (apply!409 (+!2620 lt!406106 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) lt!406121) (apply!409 lt!406106 lt!406121))))

(declare-fun lt!406188 () Unit!30502)

(declare-fun choose!1514 (ListLongMap!10753 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> d!111347 (= lt!406188 (choose!1514 lt!406106 lt!406119 (minValue!5256 thiss!1181) lt!406121))))

(declare-fun e!503355 () Bool)

(assert (=> d!111347 e!503355))

(declare-fun res!607651 () Bool)

(assert (=> d!111347 (=> (not res!607651) (not e!503355))))

(assert (=> d!111347 (= res!607651 (contains!4391 lt!406106 lt!406121))))

(assert (=> d!111347 (= (addApplyDifferent!335 lt!406106 lt!406119 (minValue!5256 thiss!1181) lt!406121) lt!406188)))

(declare-fun b!899532 () Bool)

(assert (=> b!899532 (= e!503355 (not (= lt!406121 lt!406119)))))

(assert (= (and d!111347 res!607651) b!899532))

(declare-fun m!835421 () Bool)

(assert (=> d!111347 m!835421))

(assert (=> d!111347 m!835299))

(assert (=> d!111347 m!835297))

(assert (=> d!111347 m!835309))

(declare-fun m!835423 () Bool)

(assert (=> d!111347 m!835423))

(assert (=> d!111347 m!835297))

(assert (=> b!899369 d!111347))

(declare-fun d!111349 () Bool)

(assert (=> d!111349 (= (apply!409 (+!2620 lt!406106 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) lt!406121) (get!13337 (getValueByKey!460 (toList!5392 (+!2620 lt!406106 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))) lt!406121)))))

(declare-fun bs!25224 () Bool)

(assert (= bs!25224 d!111349))

(declare-fun m!835425 () Bool)

(assert (=> bs!25224 m!835425))

(assert (=> bs!25224 m!835425))

(declare-fun m!835427 () Bool)

(assert (=> bs!25224 m!835427))

(assert (=> b!899369 d!111349))

(declare-fun d!111351 () Bool)

(assert (=> d!111351 (contains!4391 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) lt!406110)))

(declare-fun lt!406191 () Unit!30502)

(declare-fun choose!1515 (ListLongMap!10753 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30502)

(assert (=> d!111351 (= lt!406191 (choose!1515 lt!406109 lt!406105 (zeroValue!5256 thiss!1181) lt!406110))))

(assert (=> d!111351 (contains!4391 lt!406109 lt!406110)))

(assert (=> d!111351 (= (addStillContains!335 lt!406109 lt!406105 (zeroValue!5256 thiss!1181) lt!406110) lt!406191)))

(declare-fun bs!25225 () Bool)

(assert (= bs!25225 d!111351))

(assert (=> bs!25225 m!835287))

(assert (=> bs!25225 m!835287))

(assert (=> bs!25225 m!835303))

(declare-fun m!835429 () Bool)

(assert (=> bs!25225 m!835429))

(declare-fun m!835431 () Bool)

(assert (=> bs!25225 m!835431))

(assert (=> b!899369 d!111351))

(declare-fun d!111353 () Bool)

(assert (=> d!111353 (= (apply!409 (+!2620 lt!406120 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) lt!406122) (get!13337 (getValueByKey!460 (toList!5392 (+!2620 lt!406120 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))) lt!406122)))))

(declare-fun bs!25226 () Bool)

(assert (= bs!25226 d!111353))

(declare-fun m!835433 () Bool)

(assert (=> bs!25226 m!835433))

(assert (=> bs!25226 m!835433))

(declare-fun m!835435 () Bool)

(assert (=> bs!25226 m!835435))

(assert (=> b!899369 d!111353))

(declare-fun d!111355 () Bool)

(declare-fun e!503358 () Bool)

(assert (=> d!111355 e!503358))

(declare-fun res!607657 () Bool)

(assert (=> d!111355 (=> (not res!607657) (not e!503358))))

(declare-fun lt!406202 () ListLongMap!10753)

(assert (=> d!111355 (= res!607657 (contains!4391 lt!406202 (_1!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406200 () List!17857)

(assert (=> d!111355 (= lt!406202 (ListLongMap!10754 lt!406200))))

(declare-fun lt!406201 () Unit!30502)

(declare-fun lt!406203 () Unit!30502)

(assert (=> d!111355 (= lt!406201 lt!406203)))

(assert (=> d!111355 (= (getValueByKey!460 lt!406200 (_1!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!251 (List!17857 (_ BitVec 64) V!29447) Unit!30502)

(assert (=> d!111355 (= lt!406203 (lemmaContainsTupThenGetReturnValue!251 lt!406200 (_1!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))))))

(declare-fun insertStrictlySorted!308 (List!17857 (_ BitVec 64) V!29447) List!17857)

(assert (=> d!111355 (= lt!406200 (insertStrictlySorted!308 (toList!5392 lt!406106) (_1!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))))))

(assert (=> d!111355 (= (+!2620 lt!406106 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))) lt!406202)))

(declare-fun b!899538 () Bool)

(declare-fun res!607656 () Bool)

(assert (=> b!899538 (=> (not res!607656) (not e!503358))))

(assert (=> b!899538 (= res!607656 (= (getValueByKey!460 (toList!5392 lt!406202) (_1!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))))))))

(declare-fun b!899539 () Bool)

(declare-fun contains!4394 (List!17857 tuple2!12066) Bool)

(assert (=> b!899539 (= e!503358 (contains!4394 (toList!5392 lt!406202) (tuple2!12067 lt!406119 (minValue!5256 thiss!1181))))))

(assert (= (and d!111355 res!607657) b!899538))

(assert (= (and b!899538 res!607656) b!899539))

(declare-fun m!835437 () Bool)

(assert (=> d!111355 m!835437))

(declare-fun m!835439 () Bool)

(assert (=> d!111355 m!835439))

(declare-fun m!835441 () Bool)

(assert (=> d!111355 m!835441))

(declare-fun m!835443 () Bool)

(assert (=> d!111355 m!835443))

(declare-fun m!835445 () Bool)

(assert (=> b!899538 m!835445))

(declare-fun m!835447 () Bool)

(assert (=> b!899539 m!835447))

(assert (=> b!899369 d!111355))

(declare-fun d!111357 () Bool)

(declare-fun e!503359 () Bool)

(assert (=> d!111357 e!503359))

(declare-fun res!607659 () Bool)

(assert (=> d!111357 (=> (not res!607659) (not e!503359))))

(declare-fun lt!406206 () ListLongMap!10753)

(assert (=> d!111357 (= res!607659 (contains!4391 lt!406206 (_1!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))))))

(declare-fun lt!406204 () List!17857)

(assert (=> d!111357 (= lt!406206 (ListLongMap!10754 lt!406204))))

(declare-fun lt!406205 () Unit!30502)

(declare-fun lt!406207 () Unit!30502)

(assert (=> d!111357 (= lt!406205 lt!406207)))

(assert (=> d!111357 (= (getValueByKey!460 lt!406204 (_1!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111357 (= lt!406207 (lemmaContainsTupThenGetReturnValue!251 lt!406204 (_1!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111357 (= lt!406204 (insertStrictlySorted!308 (toList!5392 lt!406120) (_1!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111357 (= (+!2620 lt!406120 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) lt!406206)))

(declare-fun b!899540 () Bool)

(declare-fun res!607658 () Bool)

(assert (=> b!899540 (=> (not res!607658) (not e!503359))))

(assert (=> b!899540 (= res!607658 (= (getValueByKey!460 (toList!5392 lt!406206) (_1!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))))))))

(declare-fun b!899541 () Bool)

(assert (=> b!899541 (= e!503359 (contains!4394 (toList!5392 lt!406206) (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))))))

(assert (= (and d!111357 res!607659) b!899540))

(assert (= (and b!899540 res!607658) b!899541))

(declare-fun m!835449 () Bool)

(assert (=> d!111357 m!835449))

(declare-fun m!835451 () Bool)

(assert (=> d!111357 m!835451))

(declare-fun m!835453 () Bool)

(assert (=> d!111357 m!835453))

(declare-fun m!835455 () Bool)

(assert (=> d!111357 m!835455))

(declare-fun m!835457 () Bool)

(assert (=> b!899540 m!835457))

(declare-fun m!835459 () Bool)

(assert (=> b!899541 m!835459))

(assert (=> b!899369 d!111357))

(assert (=> b!899369 d!111321))

(declare-fun d!111359 () Bool)

(assert (=> d!111359 (= (apply!409 lt!406112 lt!406116) (get!13337 (getValueByKey!460 (toList!5392 lt!406112) lt!406116)))))

(declare-fun bs!25227 () Bool)

(assert (= bs!25227 d!111359))

(declare-fun m!835461 () Bool)

(assert (=> bs!25227 m!835461))

(assert (=> bs!25227 m!835461))

(declare-fun m!835463 () Bool)

(assert (=> bs!25227 m!835463))

(assert (=> b!899369 d!111359))

(declare-fun d!111361 () Bool)

(declare-fun e!503360 () Bool)

(assert (=> d!111361 e!503360))

(declare-fun res!607661 () Bool)

(assert (=> d!111361 (=> (not res!607661) (not e!503360))))

(declare-fun lt!406210 () ListLongMap!10753)

(assert (=> d!111361 (= res!607661 (contains!4391 lt!406210 (_1!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406208 () List!17857)

(assert (=> d!111361 (= lt!406210 (ListLongMap!10754 lt!406208))))

(declare-fun lt!406209 () Unit!30502)

(declare-fun lt!406211 () Unit!30502)

(assert (=> d!111361 (= lt!406209 lt!406211)))

(assert (=> d!111361 (= (getValueByKey!460 lt!406208 (_1!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))))))

(assert (=> d!111361 (= lt!406211 (lemmaContainsTupThenGetReturnValue!251 lt!406208 (_1!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))))))

(assert (=> d!111361 (= lt!406208 (insertStrictlySorted!308 (toList!5392 lt!406112) (_1!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))))))

(assert (=> d!111361 (= (+!2620 lt!406112 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) lt!406210)))

(declare-fun b!899542 () Bool)

(declare-fun res!607660 () Bool)

(assert (=> b!899542 (=> (not res!607660) (not e!503360))))

(assert (=> b!899542 (= res!607660 (= (getValueByKey!460 (toList!5392 lt!406210) (_1!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))))))))

(declare-fun b!899543 () Bool)

(assert (=> b!899543 (= e!503360 (contains!4394 (toList!5392 lt!406210) (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))))))

(assert (= (and d!111361 res!607661) b!899542))

(assert (= (and b!899542 res!607660) b!899543))

(declare-fun m!835465 () Bool)

(assert (=> d!111361 m!835465))

(declare-fun m!835467 () Bool)

(assert (=> d!111361 m!835467))

(declare-fun m!835469 () Bool)

(assert (=> d!111361 m!835469))

(declare-fun m!835471 () Bool)

(assert (=> d!111361 m!835471))

(declare-fun m!835473 () Bool)

(assert (=> b!899542 m!835473))

(declare-fun m!835475 () Bool)

(assert (=> b!899543 m!835475))

(assert (=> b!899369 d!111361))

(declare-fun d!111363 () Bool)

(assert (=> d!111363 (= (apply!409 lt!406120 lt!406122) (get!13337 (getValueByKey!460 (toList!5392 lt!406120) lt!406122)))))

(declare-fun bs!25228 () Bool)

(assert (= bs!25228 d!111363))

(declare-fun m!835477 () Bool)

(assert (=> bs!25228 m!835477))

(assert (=> bs!25228 m!835477))

(declare-fun m!835479 () Bool)

(assert (=> bs!25228 m!835479))

(assert (=> b!899369 d!111363))

(declare-fun d!111365 () Bool)

(assert (=> d!111365 (= (apply!409 (+!2620 lt!406120 (tuple2!12067 lt!406108 (zeroValue!5256 thiss!1181))) lt!406122) (apply!409 lt!406120 lt!406122))))

(declare-fun lt!406212 () Unit!30502)

(assert (=> d!111365 (= lt!406212 (choose!1514 lt!406120 lt!406108 (zeroValue!5256 thiss!1181) lt!406122))))

(declare-fun e!503361 () Bool)

(assert (=> d!111365 e!503361))

(declare-fun res!607662 () Bool)

(assert (=> d!111365 (=> (not res!607662) (not e!503361))))

(assert (=> d!111365 (= res!607662 (contains!4391 lt!406120 lt!406122))))

(assert (=> d!111365 (= (addApplyDifferent!335 lt!406120 lt!406108 (zeroValue!5256 thiss!1181) lt!406122) lt!406212)))

(declare-fun b!899544 () Bool)

(assert (=> b!899544 (= e!503361 (not (= lt!406122 lt!406108)))))

(assert (= (and d!111365 res!607662) b!899544))

(declare-fun m!835481 () Bool)

(assert (=> d!111365 m!835481))

(assert (=> d!111365 m!835307))

(assert (=> d!111365 m!835285))

(assert (=> d!111365 m!835289))

(declare-fun m!835483 () Bool)

(assert (=> d!111365 m!835483))

(assert (=> d!111365 m!835285))

(assert (=> b!899369 d!111365))

(declare-fun d!111367 () Bool)

(assert (=> d!111367 (= (apply!409 (+!2620 lt!406112 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) lt!406116) (apply!409 lt!406112 lt!406116))))

(declare-fun lt!406213 () Unit!30502)

(assert (=> d!111367 (= lt!406213 (choose!1514 lt!406112 lt!406125 (minValue!5256 thiss!1181) lt!406116))))

(declare-fun e!503362 () Bool)

(assert (=> d!111367 e!503362))

(declare-fun res!607663 () Bool)

(assert (=> d!111367 (=> (not res!607663) (not e!503362))))

(assert (=> d!111367 (= res!607663 (contains!4391 lt!406112 lt!406116))))

(assert (=> d!111367 (= (addApplyDifferent!335 lt!406112 lt!406125 (minValue!5256 thiss!1181) lt!406116) lt!406213)))

(declare-fun b!899545 () Bool)

(assert (=> b!899545 (= e!503362 (not (= lt!406116 lt!406125)))))

(assert (= (and d!111367 res!607663) b!899545))

(declare-fun m!835485 () Bool)

(assert (=> d!111367 m!835485))

(assert (=> d!111367 m!835305))

(assert (=> d!111367 m!835291))

(assert (=> d!111367 m!835293))

(declare-fun m!835487 () Bool)

(assert (=> d!111367 m!835487))

(assert (=> d!111367 m!835291))

(assert (=> b!899369 d!111367))

(declare-fun d!111369 () Bool)

(declare-fun e!503364 () Bool)

(assert (=> d!111369 e!503364))

(declare-fun res!607664 () Bool)

(assert (=> d!111369 (=> res!607664 e!503364)))

(declare-fun lt!406215 () Bool)

(assert (=> d!111369 (= res!607664 (not lt!406215))))

(declare-fun lt!406214 () Bool)

(assert (=> d!111369 (= lt!406215 lt!406214)))

(declare-fun lt!406216 () Unit!30502)

(declare-fun e!503363 () Unit!30502)

(assert (=> d!111369 (= lt!406216 e!503363)))

(declare-fun c!95151 () Bool)

(assert (=> d!111369 (= c!95151 lt!406214)))

(assert (=> d!111369 (= lt!406214 (containsKey!428 (toList!5392 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) lt!406110))))

(assert (=> d!111369 (= (contains!4391 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) lt!406110) lt!406215)))

(declare-fun b!899546 () Bool)

(declare-fun lt!406217 () Unit!30502)

(assert (=> b!899546 (= e!503363 lt!406217)))

(assert (=> b!899546 (= lt!406217 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5392 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) lt!406110))))

(assert (=> b!899546 (isDefined!336 (getValueByKey!460 (toList!5392 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) lt!406110))))

(declare-fun b!899547 () Bool)

(declare-fun Unit!30511 () Unit!30502)

(assert (=> b!899547 (= e!503363 Unit!30511)))

(declare-fun b!899548 () Bool)

(assert (=> b!899548 (= e!503364 (isDefined!336 (getValueByKey!460 (toList!5392 (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) lt!406110)))))

(assert (= (and d!111369 c!95151) b!899546))

(assert (= (and d!111369 (not c!95151)) b!899547))

(assert (= (and d!111369 (not res!607664)) b!899548))

(declare-fun m!835489 () Bool)

(assert (=> d!111369 m!835489))

(declare-fun m!835491 () Bool)

(assert (=> b!899546 m!835491))

(declare-fun m!835493 () Bool)

(assert (=> b!899546 m!835493))

(assert (=> b!899546 m!835493))

(declare-fun m!835495 () Bool)

(assert (=> b!899546 m!835495))

(assert (=> b!899548 m!835493))

(assert (=> b!899548 m!835493))

(assert (=> b!899548 m!835495))

(assert (=> b!899369 d!111369))

(declare-fun d!111371 () Bool)

(assert (=> d!111371 (= (apply!409 lt!406106 lt!406121) (get!13337 (getValueByKey!460 (toList!5392 lt!406106) lt!406121)))))

(declare-fun bs!25229 () Bool)

(assert (= bs!25229 d!111371))

(declare-fun m!835497 () Bool)

(assert (=> bs!25229 m!835497))

(assert (=> bs!25229 m!835497))

(declare-fun m!835499 () Bool)

(assert (=> bs!25229 m!835499))

(assert (=> b!899369 d!111371))

(declare-fun d!111373 () Bool)

(declare-fun e!503365 () Bool)

(assert (=> d!111373 e!503365))

(declare-fun res!607666 () Bool)

(assert (=> d!111373 (=> (not res!607666) (not e!503365))))

(declare-fun lt!406220 () ListLongMap!10753)

(assert (=> d!111373 (= res!607666 (contains!4391 lt!406220 (_1!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))))))

(declare-fun lt!406218 () List!17857)

(assert (=> d!111373 (= lt!406220 (ListLongMap!10754 lt!406218))))

(declare-fun lt!406219 () Unit!30502)

(declare-fun lt!406221 () Unit!30502)

(assert (=> d!111373 (= lt!406219 lt!406221)))

(assert (=> d!111373 (= (getValueByKey!460 lt!406218 (_1!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111373 (= lt!406221 (lemmaContainsTupThenGetReturnValue!251 lt!406218 (_1!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111373 (= lt!406218 (insertStrictlySorted!308 (toList!5392 lt!406109) (_1!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111373 (= (+!2620 lt!406109 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))) lt!406220)))

(declare-fun b!899549 () Bool)

(declare-fun res!607665 () Bool)

(assert (=> b!899549 (=> (not res!607665) (not e!503365))))

(assert (=> b!899549 (= res!607665 (= (getValueByKey!460 (toList!5392 lt!406220) (_1!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))))))))

(declare-fun b!899550 () Bool)

(assert (=> b!899550 (= e!503365 (contains!4394 (toList!5392 lt!406220) (tuple2!12067 lt!406105 (zeroValue!5256 thiss!1181))))))

(assert (= (and d!111373 res!607666) b!899549))

(assert (= (and b!899549 res!607665) b!899550))

(declare-fun m!835501 () Bool)

(assert (=> d!111373 m!835501))

(declare-fun m!835503 () Bool)

(assert (=> d!111373 m!835503))

(declare-fun m!835505 () Bool)

(assert (=> d!111373 m!835505))

(declare-fun m!835507 () Bool)

(assert (=> d!111373 m!835507))

(declare-fun m!835509 () Bool)

(assert (=> b!899549 m!835509))

(declare-fun m!835511 () Bool)

(assert (=> b!899550 m!835511))

(assert (=> b!899369 d!111373))

(declare-fun d!111375 () Bool)

(assert (=> d!111375 (= (apply!409 (+!2620 lt!406112 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181))) lt!406116) (get!13337 (getValueByKey!460 (toList!5392 (+!2620 lt!406112 (tuple2!12067 lt!406125 (minValue!5256 thiss!1181)))) lt!406116)))))

(declare-fun bs!25230 () Bool)

(assert (= bs!25230 d!111375))

(declare-fun m!835513 () Bool)

(assert (=> bs!25230 m!835513))

(assert (=> bs!25230 m!835513))

(declare-fun m!835515 () Bool)

(assert (=> bs!25230 m!835515))

(assert (=> b!899369 d!111375))

(assert (=> d!111301 d!111303))

(declare-fun d!111377 () Bool)

(assert (=> d!111377 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111377 true))

(declare-fun _$60!421 () Unit!30502)

(assert (=> d!111377 (= (choose!13 (_keys!10215 thiss!1181) key!785 (index!38104 lt!405998)) _$60!421)))

(declare-fun bs!25231 () Bool)

(assert (= bs!25231 d!111377))

(assert (=> bs!25231 m!835167))

(assert (=> d!111301 d!111377))

(assert (=> b!899368 d!111319))

(assert (=> d!111305 d!111299))

(declare-fun d!111379 () Bool)

(assert (=> d!111379 (= (inRange!0 (index!38104 lt!406029) (mask!26182 thiss!1181)) (and (bvsge (index!38104 lt!406029) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406029) (bvadd (mask!26182 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899275 d!111379))

(declare-fun d!111381 () Bool)

(declare-fun e!503366 () Bool)

(assert (=> d!111381 e!503366))

(declare-fun res!607668 () Bool)

(assert (=> d!111381 (=> (not res!607668) (not e!503366))))

(declare-fun lt!406224 () ListLongMap!10753)

(assert (=> d!111381 (= res!607668 (contains!4391 lt!406224 (_1!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406222 () List!17857)

(assert (=> d!111381 (= lt!406224 (ListLongMap!10754 lt!406222))))

(declare-fun lt!406223 () Unit!30502)

(declare-fun lt!406225 () Unit!30502)

(assert (=> d!111381 (= lt!406223 lt!406225)))

(assert (=> d!111381 (= (getValueByKey!460 lt!406222 (_1!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111381 (= lt!406225 (lemmaContainsTupThenGetReturnValue!251 lt!406222 (_1!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111381 (= lt!406222 (insertStrictlySorted!308 (toList!5392 call!39936) (_1!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) (_2!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111381 (= (+!2620 call!39936 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) lt!406224)))

(declare-fun b!899551 () Bool)

(declare-fun res!607667 () Bool)

(assert (=> b!899551 (=> (not res!607667) (not e!503366))))

(assert (=> b!899551 (= res!607667 (= (getValueByKey!460 (toList!5392 lt!406224) (_1!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (Some!465 (_2!6044 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun b!899552 () Bool)

(assert (=> b!899552 (= e!503366 (contains!4394 (toList!5392 lt!406224) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))

(assert (= (and d!111381 res!607668) b!899551))

(assert (= (and b!899551 res!607667) b!899552))

(declare-fun m!835517 () Bool)

(assert (=> d!111381 m!835517))

(declare-fun m!835519 () Bool)

(assert (=> d!111381 m!835519))

(declare-fun m!835521 () Bool)

(assert (=> d!111381 m!835521))

(declare-fun m!835523 () Bool)

(assert (=> d!111381 m!835523))

(declare-fun m!835525 () Bool)

(assert (=> b!899551 m!835525))

(declare-fun m!835527 () Bool)

(assert (=> b!899552 m!835527))

(assert (=> b!899367 d!111381))

(assert (=> d!111291 d!111293))

(declare-fun d!111383 () Bool)

(declare-fun e!503369 () Bool)

(assert (=> d!111383 e!503369))

(declare-fun res!607671 () Bool)

(assert (=> d!111383 (=> res!607671 e!503369)))

(declare-fun lt!406228 () SeekEntryResult!8933)

(assert (=> d!111383 (= res!607671 (not ((_ is Found!8933) lt!406228)))))

(assert (=> d!111383 (= lt!406228 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(assert (=> d!111383 true))

(declare-fun _$36!372 () Unit!30502)

(assert (=> d!111383 (= (choose!1511 (_keys!10215 thiss!1181) (_values!5443 thiss!1181) (mask!26182 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785) _$36!372)))

(declare-fun b!899555 () Bool)

(assert (=> b!899555 (= e!503369 (inRange!0 (index!38104 lt!406228) (mask!26182 thiss!1181)))))

(assert (= (and d!111383 (not res!607671)) b!899555))

(assert (=> d!111383 m!835161))

(declare-fun m!835529 () Bool)

(assert (=> b!899555 m!835529))

(assert (=> d!111291 d!111383))

(assert (=> d!111291 d!111299))

(declare-fun d!111385 () Bool)

(assert (=> d!111385 (= (apply!409 lt!406113 (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13337 (getValueByKey!460 (toList!5392 lt!406113) (select (arr!25349 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25232 () Bool)

(assert (= bs!25232 d!111385))

(assert (=> bs!25232 m!835277))

(assert (=> bs!25232 m!835385))

(assert (=> bs!25232 m!835385))

(declare-fun m!835531 () Bool)

(assert (=> bs!25232 m!835531))

(assert (=> b!899362 d!111385))

(declare-fun d!111387 () Bool)

(declare-fun c!95154 () Bool)

(assert (=> d!111387 (= c!95154 ((_ is ValueCellFull!8699) (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503372 () V!29447)

(assert (=> d!111387 (= (get!13336 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503372)))

(declare-fun b!899560 () Bool)

(declare-fun get!13338 (ValueCell!8699 V!29447) V!29447)

(assert (=> b!899560 (= e!503372 (get!13338 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899561 () Bool)

(declare-fun get!13339 (ValueCell!8699 V!29447) V!29447)

(assert (=> b!899561 (= e!503372 (get!13339 (select (arr!25350 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111387 c!95154) b!899560))

(assert (= (and d!111387 (not c!95154)) b!899561))

(assert (=> b!899560 m!835319))

(assert (=> b!899560 m!835315))

(declare-fun m!835533 () Bool)

(assert (=> b!899560 m!835533))

(assert (=> b!899561 m!835319))

(assert (=> b!899561 m!835315))

(declare-fun m!835535 () Bool)

(assert (=> b!899561 m!835535))

(assert (=> b!899362 d!111387))

(declare-fun b!899574 () Bool)

(declare-fun e!503381 () SeekEntryResult!8933)

(assert (=> b!899574 (= e!503381 (Found!8933 (index!38105 lt!406038)))))

(declare-fun lt!406234 () SeekEntryResult!8933)

(declare-fun d!111389 () Bool)

(assert (=> d!111389 (and (or ((_ is Undefined!8933) lt!406234) (not ((_ is Found!8933) lt!406234)) (and (bvsge (index!38104 lt!406234) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406234) (size!25808 (_keys!10215 thiss!1181))))) (or ((_ is Undefined!8933) lt!406234) ((_ is Found!8933) lt!406234) (not ((_ is MissingVacant!8933) lt!406234)) (not (= (index!38106 lt!406234) (index!38105 lt!406038))) (and (bvsge (index!38106 lt!406234) #b00000000000000000000000000000000) (bvslt (index!38106 lt!406234) (size!25808 (_keys!10215 thiss!1181))))) (or ((_ is Undefined!8933) lt!406234) (ite ((_ is Found!8933) lt!406234) (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38104 lt!406234)) key!785) (and ((_ is MissingVacant!8933) lt!406234) (= (index!38106 lt!406234) (index!38105 lt!406038)) (= (select (arr!25349 (_keys!10215 thiss!1181)) (index!38106 lt!406234)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!503379 () SeekEntryResult!8933)

(assert (=> d!111389 (= lt!406234 e!503379)))

(declare-fun c!95163 () Bool)

(assert (=> d!111389 (= c!95163 (bvsge (x!76645 lt!406038) #b01111111111111111111111111111110))))

(declare-fun lt!406233 () (_ BitVec 64))

(assert (=> d!111389 (= lt!406233 (select (arr!25349 (_keys!10215 thiss!1181)) (index!38105 lt!406038)))))

(assert (=> d!111389 (validMask!0 (mask!26182 thiss!1181))))

(assert (=> d!111389 (= (seekKeyOrZeroReturnVacant!0 (x!76645 lt!406038) (index!38105 lt!406038) (index!38105 lt!406038) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)) lt!406234)))

(declare-fun b!899575 () Bool)

(assert (=> b!899575 (= e!503379 e!503381)))

(declare-fun c!95162 () Bool)

(assert (=> b!899575 (= c!95162 (= lt!406233 key!785))))

(declare-fun b!899576 () Bool)

(assert (=> b!899576 (= e!503379 Undefined!8933)))

(declare-fun b!899577 () Bool)

(declare-fun e!503380 () SeekEntryResult!8933)

(assert (=> b!899577 (= e!503380 (MissingVacant!8933 (index!38105 lt!406038)))))

(declare-fun b!899578 () Bool)

(assert (=> b!899578 (= e!503380 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76645 lt!406038) #b00000000000000000000000000000001) (nextIndex!0 (index!38105 lt!406038) (x!76645 lt!406038) (mask!26182 thiss!1181)) (index!38105 lt!406038) key!785 (_keys!10215 thiss!1181) (mask!26182 thiss!1181)))))

(declare-fun b!899579 () Bool)

(declare-fun c!95161 () Bool)

(assert (=> b!899579 (= c!95161 (= lt!406233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899579 (= e!503381 e!503380)))

(assert (= (and d!111389 c!95163) b!899576))

(assert (= (and d!111389 (not c!95163)) b!899575))

(assert (= (and b!899575 c!95162) b!899574))

(assert (= (and b!899575 (not c!95162)) b!899579))

(assert (= (and b!899579 c!95161) b!899577))

(assert (= (and b!899579 (not c!95161)) b!899578))

(declare-fun m!835537 () Bool)

(assert (=> d!111389 m!835537))

(declare-fun m!835539 () Bool)

(assert (=> d!111389 m!835539))

(assert (=> d!111389 m!835261))

(assert (=> d!111389 m!835175))

(declare-fun m!835541 () Bool)

(assert (=> b!899578 m!835541))

(assert (=> b!899578 m!835541))

(declare-fun m!835543 () Bool)

(assert (=> b!899578 m!835543))

(assert (=> b!899292 d!111389))

(declare-fun d!111391 () Bool)

(declare-fun res!607672 () Bool)

(declare-fun e!503382 () Bool)

(assert (=> d!111391 (=> res!607672 e!503382)))

(assert (=> d!111391 (= res!607672 (= (select (arr!25349 (_keys!10215 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111391 (= (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503382)))

(declare-fun b!899580 () Bool)

(declare-fun e!503383 () Bool)

(assert (=> b!899580 (= e!503382 e!503383)))

(declare-fun res!607673 () Bool)

(assert (=> b!899580 (=> (not res!607673) (not e!503383))))

(assert (=> b!899580 (= res!607673 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25808 (_keys!10215 thiss!1181))))))

(declare-fun b!899581 () Bool)

(assert (=> b!899581 (= e!503383 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111391 (not res!607672)) b!899580))

(assert (= (and b!899580 res!607673) b!899581))

(declare-fun m!835545 () Bool)

(assert (=> d!111391 m!835545))

(declare-fun m!835547 () Bool)

(assert (=> b!899581 m!835547))

(assert (=> b!899311 d!111391))

(declare-fun d!111393 () Bool)

(declare-fun e!503384 () Bool)

(assert (=> d!111393 e!503384))

(declare-fun res!607675 () Bool)

(assert (=> d!111393 (=> (not res!607675) (not e!503384))))

(declare-fun lt!406237 () ListLongMap!10753)

(assert (=> d!111393 (= res!607675 (contains!4391 lt!406237 (_1!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun lt!406235 () List!17857)

(assert (=> d!111393 (= lt!406237 (ListLongMap!10754 lt!406235))))

(declare-fun lt!406236 () Unit!30502)

(declare-fun lt!406238 () Unit!30502)

(assert (=> d!111393 (= lt!406236 lt!406238)))

(assert (=> d!111393 (= (getValueByKey!460 lt!406235 (_1!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))) (Some!465 (_2!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(assert (=> d!111393 (= lt!406238 (lemmaContainsTupThenGetReturnValue!251 lt!406235 (_1!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (_2!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(assert (=> d!111393 (= lt!406235 (insertStrictlySorted!308 (toList!5392 (ite c!95107 call!39932 (ite c!95106 call!39935 call!39933))) (_1!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (_2!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(assert (=> d!111393 (= (+!2620 (ite c!95107 call!39932 (ite c!95106 call!39935 call!39933)) (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) lt!406237)))

(declare-fun b!899582 () Bool)

(declare-fun res!607674 () Bool)

(assert (=> b!899582 (=> (not res!607674) (not e!503384))))

(assert (=> b!899582 (= res!607674 (= (getValueByKey!460 (toList!5392 lt!406237) (_1!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))) (Some!465 (_2!6044 (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))))

(declare-fun b!899583 () Bool)

(assert (=> b!899583 (= e!503384 (contains!4394 (toList!5392 lt!406237) (ite (or c!95107 c!95106) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (= (and d!111393 res!607675) b!899582))

(assert (= (and b!899582 res!607674) b!899583))

(declare-fun m!835549 () Bool)

(assert (=> d!111393 m!835549))

(declare-fun m!835551 () Bool)

(assert (=> d!111393 m!835551))

(declare-fun m!835553 () Bool)

(assert (=> d!111393 m!835553))

(declare-fun m!835555 () Bool)

(assert (=> d!111393 m!835555))

(declare-fun m!835557 () Bool)

(assert (=> b!899582 m!835557))

(declare-fun m!835559 () Bool)

(assert (=> b!899583 m!835559))

(assert (=> bm!39933 d!111393))

(declare-fun condMapEmpty!29217 () Bool)

(declare-fun mapDefault!29217 () ValueCell!8699)

(assert (=> mapNonEmpty!29216 (= condMapEmpty!29217 (= mapRest!29216 ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29217)))))

(declare-fun e!503386 () Bool)

(declare-fun mapRes!29217 () Bool)

(assert (=> mapNonEmpty!29216 (= tp!56195 (and e!503386 mapRes!29217))))

(declare-fun b!899584 () Bool)

(declare-fun e!503385 () Bool)

(assert (=> b!899584 (= e!503385 tp_is_empty!18361)))

(declare-fun b!899585 () Bool)

(assert (=> b!899585 (= e!503386 tp_is_empty!18361)))

(declare-fun mapNonEmpty!29217 () Bool)

(declare-fun tp!56196 () Bool)

(assert (=> mapNonEmpty!29217 (= mapRes!29217 (and tp!56196 e!503385))))

(declare-fun mapRest!29217 () (Array (_ BitVec 32) ValueCell!8699))

(declare-fun mapValue!29217 () ValueCell!8699)

(declare-fun mapKey!29217 () (_ BitVec 32))

(assert (=> mapNonEmpty!29217 (= mapRest!29216 (store mapRest!29217 mapKey!29217 mapValue!29217))))

(declare-fun mapIsEmpty!29217 () Bool)

(assert (=> mapIsEmpty!29217 mapRes!29217))

(assert (= (and mapNonEmpty!29216 condMapEmpty!29217) mapIsEmpty!29217))

(assert (= (and mapNonEmpty!29216 (not condMapEmpty!29217)) mapNonEmpty!29217))

(assert (= (and mapNonEmpty!29217 ((_ is ValueCellFull!8699) mapValue!29217)) b!899584))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8699) mapDefault!29217)) b!899585))

(declare-fun m!835561 () Bool)

(assert (=> mapNonEmpty!29217 m!835561))

(declare-fun b_lambda!12981 () Bool)

(assert (= b_lambda!12977 (or (and b!899207 b_free!16033) b_lambda!12981)))

(declare-fun b_lambda!12983 () Bool)

(assert (= b_lambda!12979 (or (and b!899207 b_free!16033) b_lambda!12983)))

(check-sat (not b!899525) (not d!111385) (not b!899404) (not b!899405) (not d!111349) (not d!111375) (not b!899436) (not b!899552) (not b!899538) (not d!111363) (not b!899441) (not b!899546) (not d!111359) (not b!899528) (not b!899390) (not d!111369) (not b!899539) (not b!899583) (not b!899391) (not b!899508) (not b!899522) (not b_lambda!12981) (not d!111365) (not b!899509) (not d!111323) (not b!899523) (not b!899542) (not b!899455) (not b!899442) (not d!111343) (not d!111377) (not d!111337) (not b!899491) (not b!899434) (not b!899438) (not b!899561) (not d!111321) (not b!899459) (not d!111313) (not b!899444) (not d!111389) (not d!111345) b_and!26325 (not b!899578) (not b!899541) (not d!111333) (not d!111315) (not b_lambda!12983) (not d!111357) tp_is_empty!18361 (not b!899560) (not b!899582) (not b!899549) (not d!111353) (not d!111371) (not d!111347) (not bm!39944) (not b!899393) (not d!111341) (not b!899435) (not d!111351) (not bm!39938) (not d!111355) (not b!899555) (not bm!39941) (not b!899581) (not b!899540) (not d!111381) (not b!899440) (not b!899543) (not d!111393) (not b!899457) (not d!111361) (not b_next!16033) (not b!899551) (not b_lambda!12975) (not d!111327) (not b!899470) (not d!111367) (not d!111373) (not b!899550) (not mapNonEmpty!29217) (not d!111383) (not bm!39947) (not d!111329) (not b!899406) (not b!899548) (not b!899469))
(check-sat b_and!26325 (not b_next!16033))
