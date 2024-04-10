; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1820 () Bool)

(assert start!1820)

(declare-fun b_free!465 () Bool)

(declare-fun b_next!465 () Bool)

(assert (=> start!1820 (= b_free!465 (not b_next!465))))

(declare-fun tp!2117 () Bool)

(declare-fun b_and!863 () Bool)

(assert (=> start!1820 (= tp!2117 b_and!863)))

(declare-fun res!10158 () Bool)

(declare-fun e!7610 () Bool)

(assert (=> start!1820 (=> (not res!10158) (not e!7610))))

(declare-fun initialSize!1 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1820 (= res!10158 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (=> start!1820 e!7610))

(assert (=> start!1820 true))

(assert (=> start!1820 tp!2117))

(declare-fun b!12697 () Bool)

(declare-fun e!7609 () Bool)

(assert (=> b!12697 (= e!7610 e!7609)))

(declare-fun res!10159 () Bool)

(assert (=> b!12697 (=> res!10159 e!7609)))

(declare-datatypes ((array!877 0))(
  ( (array!878 (arr!421 (Array (_ BitVec 32) (_ BitVec 64))) (size!484 (_ BitVec 32))) )
))
(declare-datatypes ((V!863 0))(
  ( (V!864 (val!328 Int)) )
))
(declare-datatypes ((ValueCell!219 0))(
  ( (ValueCellFull!219 (v!1384 V!863)) (EmptyCell!219) )
))
(declare-datatypes ((array!879 0))(
  ( (array!880 (arr!422 (Array (_ BitVec 32) ValueCell!219)) (size!485 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!24 0))(
  ( (LongMapFixedSize!25 (defaultEntry!1616 Int) (mask!4435 (_ BitVec 32)) (extraKeys!1533 (_ BitVec 32)) (zeroValue!1556 V!863) (minValue!1556 V!863) (_size!43 (_ BitVec 32)) (_keys!3038 array!877) (_values!1617 array!879) (_vacant!43 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!24 0))(
  ( (Cell!25 (v!1385 LongMapFixedSize!24)) )
))
(declare-datatypes ((LongMap!24 0))(
  ( (LongMap!25 (underlying!23 Cell!24)) )
))
(declare-fun lt!3189 () LongMap!24)

(declare-fun valid!13 (LongMap!24) Bool)

(assert (=> b!12697 (= res!10159 (not (valid!13 lt!3189)))))

(declare-fun defaultEntry!183 () Int)

(declare-fun getNewLongMapFixedSize!5 ((_ BitVec 32) Int) LongMapFixedSize!24)

(assert (=> b!12697 (= lt!3189 (LongMap!25 (Cell!25 (getNewLongMapFixedSize!5 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183))))))

(declare-fun b!12698 () Bool)

(declare-fun size!486 (LongMap!24) (_ BitVec 32))

(assert (=> b!12698 (= e!7609 (not (= (size!486 lt!3189) #b00000000000000000000000000000000)))))

(assert (= (and start!1820 res!10158) b!12697))

(assert (= (and b!12697 (not res!10159)) b!12698))

(declare-fun m!8605 () Bool)

(assert (=> start!1820 m!8605))

(declare-fun m!8607 () Bool)

(assert (=> b!12697 m!8607))

(declare-fun m!8609 () Bool)

(assert (=> b!12697 m!8609))

(declare-fun m!8611 () Bool)

(assert (=> b!12698 m!8611))

(check-sat b_and!863 (not b!12698) (not start!1820) (not b_next!465) (not b!12697))
(check-sat b_and!863 (not b_next!465))
(get-model)

(declare-fun d!1821 () Bool)

(assert (=> d!1821 (= (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)) (and (or (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000001111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000011111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000001111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000011111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000001111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000011111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000001111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000011111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000001111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000011111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000001111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000011111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000001111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000011111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000001111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000011111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00001111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00011111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (bvsle (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)))))

(assert (=> start!1820 d!1821))

(declare-fun d!1833 () Bool)

(declare-fun size!492 (LongMapFixedSize!24) (_ BitVec 32))

(assert (=> d!1833 (= (size!486 lt!3189) (size!492 (v!1385 (underlying!23 lt!3189))))))

(declare-fun bs!486 () Bool)

(assert (= bs!486 d!1833))

(declare-fun m!8627 () Bool)

(assert (=> bs!486 m!8627))

(assert (=> b!12698 d!1833))

(declare-fun d!1835 () Bool)

(declare-fun valid!16 (LongMapFixedSize!24) Bool)

(assert (=> d!1835 (= (valid!13 lt!3189) (valid!16 (v!1385 (underlying!23 lt!3189))))))

(declare-fun bs!487 () Bool)

(assert (= bs!487 d!1835))

(declare-fun m!8629 () Bool)

(assert (=> bs!487 m!8629))

(assert (=> b!12697 d!1835))

(declare-fun d!1837 () Bool)

(declare-fun e!7643 () Bool)

(assert (=> d!1837 e!7643))

(declare-fun res!10181 () Bool)

(assert (=> d!1837 (=> (not res!10181) (not e!7643))))

(declare-fun lt!3371 () LongMapFixedSize!24)

(assert (=> d!1837 (= res!10181 (valid!16 lt!3371))))

(declare-fun lt!3366 () LongMapFixedSize!24)

(assert (=> d!1837 (= lt!3371 lt!3366)))

(declare-datatypes ((Unit!276 0))(
  ( (Unit!277) )
))
(declare-fun lt!3392 () Unit!276)

(declare-fun e!7640 () Unit!276)

(assert (=> d!1837 (= lt!3392 e!7640)))

(declare-fun c!1158 () Bool)

(declare-datatypes ((tuple2!458 0))(
  ( (tuple2!459 (_1!229 (_ BitVec 64)) (_2!229 V!863)) )
))
(declare-datatypes ((List!381 0))(
  ( (Nil!378) (Cons!377 (h!943 tuple2!458) (t!2774 List!381)) )
))
(declare-datatypes ((ListLongMap!395 0))(
  ( (ListLongMap!396 (toList!213 List!381)) )
))
(declare-fun map!242 (LongMapFixedSize!24) ListLongMap!395)

(assert (=> d!1837 (= c!1158 (not (= (map!242 lt!3366) (ListLongMap!396 Nil!378))))))

(declare-fun lt!3365 () Unit!276)

(declare-fun lt!3397 () Unit!276)

(assert (=> d!1837 (= lt!3365 lt!3397)))

(declare-fun lt!3399 () array!877)

(declare-fun lt!3354 () (_ BitVec 32))

(declare-datatypes ((List!382 0))(
  ( (Nil!379) (Cons!378 (h!944 (_ BitVec 64)) (t!2775 List!382)) )
))
(declare-fun lt!3375 () List!382)

(declare-fun arrayNoDuplicates!0 (array!877 (_ BitVec 32) List!382) Bool)

(assert (=> d!1837 (arrayNoDuplicates!0 lt!3399 lt!3354 lt!3375)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!877 (_ BitVec 32) (_ BitVec 32) List!382) Unit!276)

(assert (=> d!1837 (= lt!3397 (lemmaArrayNoDuplicatesInAll0Array!0 lt!3399 lt!3354 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3375))))

(assert (=> d!1837 (= lt!3375 Nil!379)))

(assert (=> d!1837 (= lt!3354 #b00000000000000000000000000000000)))

(assert (=> d!1837 (= lt!3399 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3367 () Unit!276)

(declare-fun lt!3357 () Unit!276)

(assert (=> d!1837 (= lt!3367 lt!3357)))

(declare-fun lt!3381 () (_ BitVec 32))

(declare-fun lt!3363 () array!877)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!877 (_ BitVec 32)) Bool)

(assert (=> d!1837 (arrayForallSeekEntryOrOpenFound!0 lt!3381 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!877 (_ BitVec 32) (_ BitVec 32)) Unit!276)

(assert (=> d!1837 (= lt!3357 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3381))))

(assert (=> d!1837 (= lt!3381 #b00000000000000000000000000000000)))

(assert (=> d!1837 (= lt!3363 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3396 () Unit!276)

(declare-fun lt!3386 () Unit!276)

(assert (=> d!1837 (= lt!3396 lt!3386)))

(declare-fun lt!3359 () array!877)

(declare-fun lt!3379 () (_ BitVec 32))

(declare-fun lt!3383 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!877 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!1837 (= (arrayCountValidKeys!0 lt!3359 lt!3379 lt!3383) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!877 (_ BitVec 32) (_ BitVec 32)) Unit!276)

(assert (=> d!1837 (= lt!3386 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3359 lt!3379 lt!3383))))

(assert (=> d!1837 (= lt!3383 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1837 (= lt!3379 #b00000000000000000000000000000000)))

(assert (=> d!1837 (= lt!3359 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!81 (Int (_ BitVec 64)) V!863)

(assert (=> d!1837 (= lt!3366 (LongMapFixedSize!25 defaultEntry!183 (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000000 (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (array!880 ((as const (Array (_ BitVec 32) ValueCell!219)) EmptyCell!219) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!1837 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1837 (= (getNewLongMapFixedSize!5 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183) lt!3371)))

(declare-fun b!12750 () Bool)

(declare-fun e!7641 () Bool)

(declare-fun lt!3377 () array!877)

(declare-fun lt!3360 () tuple2!458)

(declare-fun arrayContainsKey!0 (array!877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!12750 (= e!7641 (arrayContainsKey!0 lt!3377 (_1!229 lt!3360) #b00000000000000000000000000000000))))

(declare-fun b!12751 () Bool)

(declare-fun Unit!280 () Unit!276)

(assert (=> b!12751 (= e!7640 Unit!280)))

(declare-fun b!12753 () Bool)

(declare-fun Unit!281 () Unit!276)

(assert (=> b!12753 (= e!7640 Unit!281)))

(declare-fun head!781 (List!381) tuple2!458)

(assert (=> b!12753 (= lt!3360 (head!781 (toList!213 (map!242 lt!3366))))))

(assert (=> b!12753 (= lt!3377 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3394 () (_ BitVec 32))

(assert (=> b!12753 (= lt!3394 #b00000000000000000000000000000000)))

(declare-fun lt!3355 () Unit!276)

(declare-fun lemmaKeyInListMapIsInArray!78 (array!877 array!879 (_ BitVec 32) (_ BitVec 32) V!863 V!863 (_ BitVec 64) Int) Unit!276)

(assert (=> b!12753 (= lt!3355 (lemmaKeyInListMapIsInArray!78 lt!3377 (array!880 ((as const (Array (_ BitVec 32) ValueCell!219)) EmptyCell!219) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3394 (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!229 lt!3360) defaultEntry!183))))

(declare-fun c!1159 () Bool)

(assert (=> b!12753 (= c!1159 (and (not (= (_1!229 lt!3360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!229 lt!3360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12753 e!7641))

(declare-fun lt!3390 () Unit!276)

(assert (=> b!12753 (= lt!3390 lt!3355)))

(declare-fun lt!3388 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!877 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!12753 (= lt!3388 (arrayScanForKey!0 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!229 lt!3360) #b00000000000000000000000000000000))))

(assert (=> b!12753 false))

(declare-fun b!12755 () Bool)

(declare-fun res!10180 () Bool)

(assert (=> b!12755 (=> (not res!10180) (not e!7643))))

(assert (=> b!12755 (= res!10180 (= (mask!4435 lt!3371) (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12757 () Bool)

(assert (=> b!12757 (= e!7641 (ite (= (_1!229 lt!3360) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3394 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3394 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!12759 () Bool)

(assert (=> b!12759 (= e!7643 (= (map!242 lt!3371) (ListLongMap!396 Nil!378)))))

(assert (= (and d!1837 c!1158) b!12753))

(assert (= (and d!1837 (not c!1158)) b!12751))

(assert (= (and b!12753 c!1159) b!12750))

(assert (= (and b!12753 (not c!1159)) b!12757))

(assert (= (and d!1837 res!10181) b!12755))

(assert (= (and b!12755 res!10180) b!12759))

(declare-fun b_lambda!848 () Bool)

(assert (=> (not b_lambda!848) (not d!1837)))

(declare-fun t!2773 () Bool)

(declare-fun tb!391 () Bool)

(assert (=> (and start!1820 (= defaultEntry!183 defaultEntry!183) t!2773) tb!391))

(declare-fun result!615 () Bool)

(declare-fun tp_is_empty!641 () Bool)

(assert (=> tb!391 (= result!615 tp_is_empty!641)))

(assert (=> d!1837 t!2773))

(declare-fun b_and!872 () Bool)

(assert (= b_and!863 (and (=> t!2773 result!615) b_and!872)))

(declare-fun b_lambda!853 () Bool)

(assert (=> (not b_lambda!853) (not b!12753)))

(assert (=> b!12753 t!2773))

(declare-fun b_and!876 () Bool)

(assert (= b_and!872 (and (=> t!2773 result!615) b_and!876)))

(declare-fun m!8662 () Bool)

(assert (=> d!1837 m!8662))

(declare-fun m!8665 () Bool)

(assert (=> d!1837 m!8665))

(declare-fun m!8667 () Bool)

(assert (=> d!1837 m!8667))

(declare-fun m!8669 () Bool)

(assert (=> d!1837 m!8669))

(declare-fun m!8673 () Bool)

(assert (=> d!1837 m!8673))

(declare-fun m!8677 () Bool)

(assert (=> d!1837 m!8677))

(declare-fun m!8679 () Bool)

(assert (=> d!1837 m!8679))

(assert (=> d!1837 m!8605))

(declare-fun m!8687 () Bool)

(assert (=> d!1837 m!8687))

(declare-fun m!8689 () Bool)

(assert (=> d!1837 m!8689))

(declare-fun m!8693 () Bool)

(assert (=> b!12750 m!8693))

(assert (=> b!12753 m!8665))

(declare-fun m!8697 () Bool)

(assert (=> b!12753 m!8697))

(declare-fun m!8701 () Bool)

(assert (=> b!12753 m!8701))

(assert (=> b!12753 m!8679))

(assert (=> b!12753 m!8679))

(declare-fun m!8709 () Bool)

(assert (=> b!12753 m!8709))

(assert (=> b!12753 m!8679))

(declare-fun m!8713 () Bool)

(assert (=> b!12759 m!8713))

(assert (=> b!12697 d!1837))

(declare-fun b_lambda!855 () Bool)

(assert (= b_lambda!853 (or (and start!1820 b_free!465) b_lambda!855)))

(declare-fun b_lambda!857 () Bool)

(assert (= b_lambda!848 (or (and start!1820 b_free!465) b_lambda!857)))

(check-sat (not b!12753) (not b_lambda!857) (not b_lambda!855) (not b!12750) tp_is_empty!641 (not d!1837) (not b!12759) (not b_next!465) b_and!876 (not d!1833) (not d!1835))
(check-sat b_and!876 (not b_next!465))
(get-model)

(declare-fun d!1855 () Bool)

(declare-fun res!10205 () Bool)

(declare-fun e!7661 () Bool)

(assert (=> d!1855 (=> (not res!10205) (not e!7661))))

(declare-fun simpleValid!6 (LongMapFixedSize!24) Bool)

(assert (=> d!1855 (= res!10205 (simpleValid!6 (v!1385 (underlying!23 lt!3189))))))

(assert (=> d!1855 (= (valid!16 (v!1385 (underlying!23 lt!3189))) e!7661)))

(declare-fun b!12798 () Bool)

(declare-fun res!10206 () Bool)

(assert (=> b!12798 (=> (not res!10206) (not e!7661))))

(assert (=> b!12798 (= res!10206 (= (arrayCountValidKeys!0 (_keys!3038 (v!1385 (underlying!23 lt!3189))) #b00000000000000000000000000000000 (size!484 (_keys!3038 (v!1385 (underlying!23 lt!3189))))) (_size!43 (v!1385 (underlying!23 lt!3189)))))))

(declare-fun b!12799 () Bool)

(declare-fun res!10207 () Bool)

(assert (=> b!12799 (=> (not res!10207) (not e!7661))))

(assert (=> b!12799 (= res!10207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3038 (v!1385 (underlying!23 lt!3189))) (mask!4435 (v!1385 (underlying!23 lt!3189)))))))

(declare-fun b!12800 () Bool)

(assert (=> b!12800 (= e!7661 (arrayNoDuplicates!0 (_keys!3038 (v!1385 (underlying!23 lt!3189))) #b00000000000000000000000000000000 Nil!379))))

(assert (= (and d!1855 res!10205) b!12798))

(assert (= (and b!12798 res!10206) b!12799))

(assert (= (and b!12799 res!10207) b!12800))

(declare-fun m!8743 () Bool)

(assert (=> d!1855 m!8743))

(declare-fun m!8745 () Bool)

(assert (=> b!12798 m!8745))

(declare-fun m!8747 () Bool)

(assert (=> b!12799 m!8747))

(declare-fun m!8749 () Bool)

(assert (=> b!12800 m!8749))

(assert (=> d!1835 d!1855))

(declare-fun d!1861 () Bool)

(assert (=> d!1861 (= (head!781 (toList!213 (map!242 lt!3366))) (h!943 (toList!213 (map!242 lt!3366))))))

(assert (=> b!12753 d!1861))

(declare-fun d!1863 () Bool)

(declare-fun getCurrentListMap!118 (array!877 array!879 (_ BitVec 32) (_ BitVec 32) V!863 V!863 (_ BitVec 32) Int) ListLongMap!395)

(assert (=> d!1863 (= (map!242 lt!3366) (getCurrentListMap!118 (_keys!3038 lt!3366) (_values!1617 lt!3366) (mask!4435 lt!3366) (extraKeys!1533 lt!3366) (zeroValue!1556 lt!3366) (minValue!1556 lt!3366) #b00000000000000000000000000000000 (defaultEntry!1616 lt!3366)))))

(declare-fun bs!493 () Bool)

(assert (= bs!493 d!1863))

(declare-fun m!8753 () Bool)

(assert (=> bs!493 m!8753))

(assert (=> b!12753 d!1863))

(declare-fun d!1869 () Bool)

(declare-fun e!7670 () Bool)

(assert (=> d!1869 e!7670))

(declare-fun c!1175 () Bool)

(assert (=> d!1869 (= c!1175 (and (not (= (_1!229 lt!3360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!229 lt!3360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!3417 () Unit!276)

(declare-fun choose!166 (array!877 array!879 (_ BitVec 32) (_ BitVec 32) V!863 V!863 (_ BitVec 64) Int) Unit!276)

(assert (=> d!1869 (= lt!3417 (choose!166 lt!3377 (array!880 ((as const (Array (_ BitVec 32) ValueCell!219)) EmptyCell!219) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3394 (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!229 lt!3360) defaultEntry!183))))

(assert (=> d!1869 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1869 (= (lemmaKeyInListMapIsInArray!78 lt!3377 (array!880 ((as const (Array (_ BitVec 32) ValueCell!219)) EmptyCell!219) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3394 (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!81 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!229 lt!3360) defaultEntry!183) lt!3417)))

(declare-fun b!12817 () Bool)

(assert (=> b!12817 (= e!7670 (arrayContainsKey!0 lt!3377 (_1!229 lt!3360) #b00000000000000000000000000000000))))

(declare-fun b!12818 () Bool)

(assert (=> b!12818 (= e!7670 (ite (= (_1!229 lt!3360) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3394 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3394 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1869 c!1175) b!12817))

(assert (= (and d!1869 (not c!1175)) b!12818))

(assert (=> d!1869 m!8679))

(assert (=> d!1869 m!8679))

(declare-fun m!8763 () Bool)

(assert (=> d!1869 m!8763))

(assert (=> d!1869 m!8605))

(assert (=> b!12817 m!8693))

(assert (=> b!12753 d!1869))

(declare-fun d!1875 () Bool)

(declare-fun lt!3429 () (_ BitVec 32))

(assert (=> d!1875 (and (or (bvslt lt!3429 #b00000000000000000000000000000000) (bvsge lt!3429 (size!484 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (and (bvsge lt!3429 #b00000000000000000000000000000000) (bvslt lt!3429 (size!484 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))) (bvsge lt!3429 #b00000000000000000000000000000000) (bvslt lt!3429 (size!484 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (= (select (arr!421 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) lt!3429) (_1!229 lt!3360)))))

(declare-fun e!7685 () (_ BitVec 32))

(assert (=> d!1875 (= lt!3429 e!7685)))

(declare-fun c!1186 () Bool)

(assert (=> d!1875 (= c!1186 (= (select (arr!421 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!229 lt!3360)))))

(assert (=> d!1875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!484 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (bvslt (size!484 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!1875 (= (arrayScanForKey!0 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!229 lt!3360) #b00000000000000000000000000000000) lt!3429)))

(declare-fun b!12843 () Bool)

(assert (=> b!12843 (= e!7685 #b00000000000000000000000000000000)))

(declare-fun b!12844 () Bool)

(assert (=> b!12844 (= e!7685 (arrayScanForKey!0 (array!878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!229 lt!3360) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1875 c!1186) b!12843))

(assert (= (and d!1875 (not c!1186)) b!12844))

(declare-fun m!8767 () Bool)

(assert (=> d!1875 m!8767))

(declare-fun m!8769 () Bool)

(assert (=> d!1875 m!8769))

(declare-fun m!8773 () Bool)

(assert (=> b!12844 m!8773))

(assert (=> b!12753 d!1875))

(declare-fun d!1877 () Bool)

(assert (=> d!1877 (= (size!492 (v!1385 (underlying!23 lt!3189))) (bvadd (_size!43 (v!1385 (underlying!23 lt!3189))) (bvsdiv (bvadd (extraKeys!1533 (v!1385 (underlying!23 lt!3189))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!1833 d!1877))

(assert (=> d!1837 d!1863))

(declare-fun d!1883 () Bool)

(assert (=> d!1883 (arrayNoDuplicates!0 lt!3399 lt!3354 lt!3375)))

(declare-fun lt!3441 () Unit!276)

(declare-fun choose!111 (array!877 (_ BitVec 32) (_ BitVec 32) List!382) Unit!276)

(assert (=> d!1883 (= lt!3441 (choose!111 lt!3399 lt!3354 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3375))))

(assert (=> d!1883 (= (size!484 lt!3399) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1883 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!3399 lt!3354 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3375) lt!3441)))

(declare-fun bs!497 () Bool)

(assert (= bs!497 d!1883))

(assert (=> bs!497 m!8673))

(declare-fun m!8793 () Bool)

(assert (=> bs!497 m!8793))

(assert (=> d!1837 d!1883))

(assert (=> d!1837 d!1821))

(declare-fun bm!332 () Bool)

(declare-fun call!335 () (_ BitVec 32))

(assert (=> bm!332 (= call!335 (arrayCountValidKeys!0 lt!3359 (bvadd lt!3379 #b00000000000000000000000000000001) lt!3383))))

(declare-fun b!12881 () Bool)

(declare-fun e!7709 () (_ BitVec 32))

(assert (=> b!12881 (= e!7709 #b00000000000000000000000000000000)))

(declare-fun b!12882 () Bool)

(declare-fun e!7708 () (_ BitVec 32))

(assert (=> b!12882 (= e!7708 call!335)))

(declare-fun b!12883 () Bool)

(assert (=> b!12883 (= e!7708 (bvadd #b00000000000000000000000000000001 call!335))))

(declare-fun d!1889 () Bool)

(declare-fun lt!3444 () (_ BitVec 32))

(assert (=> d!1889 (and (bvsge lt!3444 #b00000000000000000000000000000000) (bvsle lt!3444 (bvsub (size!484 lt!3359) lt!3379)))))

(assert (=> d!1889 (= lt!3444 e!7709)))

(declare-fun c!1196 () Bool)

(assert (=> d!1889 (= c!1196 (bvsge lt!3379 lt!3383))))

(assert (=> d!1889 (and (bvsle lt!3379 lt!3383) (bvsge lt!3379 #b00000000000000000000000000000000) (bvsle lt!3383 (size!484 lt!3359)))))

(assert (=> d!1889 (= (arrayCountValidKeys!0 lt!3359 lt!3379 lt!3383) lt!3444)))

(declare-fun b!12884 () Bool)

(assert (=> b!12884 (= e!7709 e!7708)))

(declare-fun c!1195 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!12884 (= c!1195 (validKeyInArray!0 (select (arr!421 lt!3359) lt!3379)))))

(assert (= (and d!1889 c!1196) b!12881))

(assert (= (and d!1889 (not c!1196)) b!12884))

(assert (= (and b!12884 c!1195) b!12883))

(assert (= (and b!12884 (not c!1195)) b!12882))

(assert (= (or b!12883 b!12882) bm!332))

(declare-fun m!8803 () Bool)

(assert (=> bm!332 m!8803))

(declare-fun m!8807 () Bool)

(assert (=> b!12884 m!8807))

(assert (=> b!12884 m!8807))

(declare-fun m!8811 () Bool)

(assert (=> b!12884 m!8811))

(assert (=> d!1837 d!1889))

(declare-fun d!1893 () Bool)

(assert (=> d!1893 (= (arrayCountValidKeys!0 lt!3359 lt!3379 lt!3383) #b00000000000000000000000000000000)))

(declare-fun lt!3447 () Unit!276)

(declare-fun choose!59 (array!877 (_ BitVec 32) (_ BitVec 32)) Unit!276)

(assert (=> d!1893 (= lt!3447 (choose!59 lt!3359 lt!3379 lt!3383))))

(assert (=> d!1893 (bvslt (size!484 lt!3359) #b01111111111111111111111111111111)))

(assert (=> d!1893 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3359 lt!3379 lt!3383) lt!3447)))

(declare-fun bs!498 () Bool)

(assert (= bs!498 d!1893))

(assert (=> bs!498 m!8669))

(declare-fun m!8825 () Bool)

(assert (=> bs!498 m!8825))

(assert (=> d!1837 d!1893))

(declare-fun d!1899 () Bool)

(declare-fun res!10246 () Bool)

(declare-fun e!7728 () Bool)

(assert (=> d!1899 (=> res!10246 e!7728)))

(assert (=> d!1899 (= res!10246 (bvsge lt!3381 (size!484 lt!3363)))))

(assert (=> d!1899 (= (arrayForallSeekEntryOrOpenFound!0 lt!3381 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001)) e!7728)))

(declare-fun b!12908 () Bool)

(declare-fun e!7727 () Bool)

(declare-fun call!341 () Bool)

(assert (=> b!12908 (= e!7727 call!341)))

(declare-fun b!12909 () Bool)

(declare-fun e!7726 () Bool)

(assert (=> b!12909 (= e!7726 call!341)))

(declare-fun b!12910 () Bool)

(assert (=> b!12910 (= e!7726 e!7727)))

(declare-fun lt!3468 () (_ BitVec 64))

(assert (=> b!12910 (= lt!3468 (select (arr!421 lt!3363) lt!3381))))

(declare-fun lt!3466 () Unit!276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!877 (_ BitVec 64) (_ BitVec 32)) Unit!276)

(assert (=> b!12910 (= lt!3466 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!3363 lt!3468 lt!3381))))

(assert (=> b!12910 (arrayContainsKey!0 lt!3363 lt!3468 #b00000000000000000000000000000000)))

(declare-fun lt!3467 () Unit!276)

(assert (=> b!12910 (= lt!3467 lt!3466)))

(declare-fun res!10245 () Bool)

(declare-datatypes ((SeekEntryResult!41 0))(
  ( (MissingZero!41 (index!2283 (_ BitVec 32))) (Found!41 (index!2284 (_ BitVec 32))) (Intermediate!41 (undefined!853 Bool) (index!2285 (_ BitVec 32)) (x!3357 (_ BitVec 32))) (Undefined!41) (MissingVacant!41 (index!2286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!877 (_ BitVec 32)) SeekEntryResult!41)

(assert (=> b!12910 (= res!10245 (= (seekEntryOrOpen!0 (select (arr!421 lt!3363) lt!3381) lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001)) (Found!41 lt!3381)))))

(assert (=> b!12910 (=> (not res!10245) (not e!7727))))

(declare-fun b!12911 () Bool)

(assert (=> b!12911 (= e!7728 e!7726)))

(declare-fun c!1202 () Bool)

(assert (=> b!12911 (= c!1202 (validKeyInArray!0 (select (arr!421 lt!3363) lt!3381)))))

(declare-fun bm!338 () Bool)

(assert (=> bm!338 (= call!341 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!3381 #b00000000000000000000000000000001) lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (= (and d!1899 (not res!10246)) b!12911))

(assert (= (and b!12911 c!1202) b!12910))

(assert (= (and b!12911 (not c!1202)) b!12909))

(assert (= (and b!12910 res!10245) b!12908))

(assert (= (or b!12908 b!12909) bm!338))

(declare-fun m!8841 () Bool)

(assert (=> b!12910 m!8841))

(declare-fun m!8843 () Bool)

(assert (=> b!12910 m!8843))

(declare-fun m!8845 () Bool)

(assert (=> b!12910 m!8845))

(assert (=> b!12910 m!8841))

(declare-fun m!8847 () Bool)

(assert (=> b!12910 m!8847))

(assert (=> b!12911 m!8841))

(assert (=> b!12911 m!8841))

(declare-fun m!8849 () Bool)

(assert (=> b!12911 m!8849))

(declare-fun m!8851 () Bool)

(assert (=> bm!338 m!8851))

(assert (=> d!1837 d!1899))

(declare-fun d!1905 () Bool)

(declare-fun res!10247 () Bool)

(declare-fun e!7729 () Bool)

(assert (=> d!1905 (=> (not res!10247) (not e!7729))))

(assert (=> d!1905 (= res!10247 (simpleValid!6 lt!3371))))

(assert (=> d!1905 (= (valid!16 lt!3371) e!7729)))

(declare-fun b!12912 () Bool)

(declare-fun res!10248 () Bool)

(assert (=> b!12912 (=> (not res!10248) (not e!7729))))

(assert (=> b!12912 (= res!10248 (= (arrayCountValidKeys!0 (_keys!3038 lt!3371) #b00000000000000000000000000000000 (size!484 (_keys!3038 lt!3371))) (_size!43 lt!3371)))))

(declare-fun b!12913 () Bool)

(declare-fun res!10249 () Bool)

(assert (=> b!12913 (=> (not res!10249) (not e!7729))))

(assert (=> b!12913 (= res!10249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3038 lt!3371) (mask!4435 lt!3371)))))

(declare-fun b!12914 () Bool)

(assert (=> b!12914 (= e!7729 (arrayNoDuplicates!0 (_keys!3038 lt!3371) #b00000000000000000000000000000000 Nil!379))))

(assert (= (and d!1905 res!10247) b!12912))

(assert (= (and b!12912 res!10248) b!12913))

(assert (= (and b!12913 res!10249) b!12914))

(declare-fun m!8853 () Bool)

(assert (=> d!1905 m!8853))

(declare-fun m!8855 () Bool)

(assert (=> b!12912 m!8855))

(declare-fun m!8857 () Bool)

(assert (=> b!12913 m!8857))

(declare-fun m!8859 () Bool)

(assert (=> b!12914 m!8859))

(assert (=> d!1837 d!1905))

(declare-fun d!1907 () Bool)

(assert (=> d!1907 (arrayForallSeekEntryOrOpenFound!0 lt!3381 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lt!3471 () Unit!276)

(declare-fun choose!34 (array!877 (_ BitVec 32) (_ BitVec 32)) Unit!276)

(assert (=> d!1907 (= lt!3471 (choose!34 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3381))))

(assert (=> d!1907 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1907 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3363 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3381) lt!3471)))

(declare-fun bs!500 () Bool)

(assert (= bs!500 d!1907))

(assert (=> bs!500 m!8677))

(declare-fun m!8861 () Bool)

(assert (=> bs!500 m!8861))

(assert (=> bs!500 m!8605))

(assert (=> d!1837 d!1907))

(declare-fun b!12940 () Bool)

(declare-fun e!7750 () Bool)

(declare-fun e!7753 () Bool)

(assert (=> b!12940 (= e!7750 e!7753)))

(declare-fun res!10266 () Bool)

(assert (=> b!12940 (=> (not res!10266) (not e!7753))))

(declare-fun e!7752 () Bool)

(assert (=> b!12940 (= res!10266 (not e!7752))))

(declare-fun res!10265 () Bool)

(assert (=> b!12940 (=> (not res!10265) (not e!7752))))

(assert (=> b!12940 (= res!10265 (validKeyInArray!0 (select (arr!421 lt!3399) lt!3354)))))

(declare-fun b!12941 () Bool)

(declare-fun e!7751 () Bool)

(assert (=> b!12941 (= e!7753 e!7751)))

(declare-fun c!1208 () Bool)

(assert (=> b!12941 (= c!1208 (validKeyInArray!0 (select (arr!421 lt!3399) lt!3354)))))

(declare-fun b!12942 () Bool)

(declare-fun call!347 () Bool)

(assert (=> b!12942 (= e!7751 call!347)))

(declare-fun b!12943 () Bool)

(declare-fun contains!191 (List!382 (_ BitVec 64)) Bool)

(assert (=> b!12943 (= e!7752 (contains!191 lt!3375 (select (arr!421 lt!3399) lt!3354)))))

(declare-fun b!12944 () Bool)

(assert (=> b!12944 (= e!7751 call!347)))

(declare-fun d!1909 () Bool)

(declare-fun res!10267 () Bool)

(assert (=> d!1909 (=> res!10267 e!7750)))

(assert (=> d!1909 (= res!10267 (bvsge lt!3354 (size!484 lt!3399)))))

(assert (=> d!1909 (= (arrayNoDuplicates!0 lt!3399 lt!3354 lt!3375) e!7750)))

(declare-fun bm!344 () Bool)

(assert (=> bm!344 (= call!347 (arrayNoDuplicates!0 lt!3399 (bvadd lt!3354 #b00000000000000000000000000000001) (ite c!1208 (Cons!378 (select (arr!421 lt!3399) lt!3354) lt!3375) lt!3375)))))

(assert (= (and d!1909 (not res!10267)) b!12940))

(assert (= (and b!12940 res!10265) b!12943))

(assert (= (and b!12940 res!10266) b!12941))

(assert (= (and b!12941 c!1208) b!12944))

(assert (= (and b!12941 (not c!1208)) b!12942))

(assert (= (or b!12944 b!12942) bm!344))

(declare-fun m!8873 () Bool)

(assert (=> b!12940 m!8873))

(assert (=> b!12940 m!8873))

(declare-fun m!8875 () Bool)

(assert (=> b!12940 m!8875))

(assert (=> b!12941 m!8873))

(assert (=> b!12941 m!8873))

(assert (=> b!12941 m!8875))

(assert (=> b!12943 m!8873))

(assert (=> b!12943 m!8873))

(declare-fun m!8877 () Bool)

(assert (=> b!12943 m!8877))

(assert (=> bm!344 m!8873))

(declare-fun m!8879 () Bool)

(assert (=> bm!344 m!8879))

(assert (=> d!1837 d!1909))

(declare-fun d!1915 () Bool)

(declare-fun res!10278 () Bool)

(declare-fun e!7764 () Bool)

(assert (=> d!1915 (=> res!10278 e!7764)))

(assert (=> d!1915 (= res!10278 (= (select (arr!421 lt!3377) #b00000000000000000000000000000000) (_1!229 lt!3360)))))

(assert (=> d!1915 (= (arrayContainsKey!0 lt!3377 (_1!229 lt!3360) #b00000000000000000000000000000000) e!7764)))

(declare-fun b!12955 () Bool)

(declare-fun e!7765 () Bool)

(assert (=> b!12955 (= e!7764 e!7765)))

(declare-fun res!10279 () Bool)

(assert (=> b!12955 (=> (not res!10279) (not e!7765))))

(assert (=> b!12955 (= res!10279 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!484 lt!3377)))))

(declare-fun b!12956 () Bool)

(assert (=> b!12956 (= e!7765 (arrayContainsKey!0 lt!3377 (_1!229 lt!3360) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1915 (not res!10278)) b!12955))

(assert (= (and b!12955 res!10279) b!12956))

(declare-fun m!8885 () Bool)

(assert (=> d!1915 m!8885))

(declare-fun m!8887 () Bool)

(assert (=> b!12956 m!8887))

(assert (=> b!12750 d!1915))

(declare-fun d!1921 () Bool)

(assert (=> d!1921 (= (map!242 lt!3371) (getCurrentListMap!118 (_keys!3038 lt!3371) (_values!1617 lt!3371) (mask!4435 lt!3371) (extraKeys!1533 lt!3371) (zeroValue!1556 lt!3371) (minValue!1556 lt!3371) #b00000000000000000000000000000000 (defaultEntry!1616 lt!3371)))))

(declare-fun bs!502 () Bool)

(assert (= bs!502 d!1921))

(declare-fun m!8889 () Bool)

(assert (=> bs!502 m!8889))

(assert (=> b!12759 d!1921))

(check-sat (not b!12913) (not d!1855) (not d!1869) (not b!12799) (not b!12884) (not b_next!465) (not d!1905) (not d!1921) (not bm!344) (not d!1893) (not b!12911) (not b!12956) (not b!12943) (not b!12912) (not b!12941) (not d!1883) (not b_lambda!857) (not b_lambda!855) (not bm!332) (not b!12940) (not b!12798) (not bm!338) (not b!12817) (not b!12800) (not b!12914) (not d!1907) tp_is_empty!641 (not b!12844) (not d!1863) b_and!876 (not b!12910))
(check-sat b_and!876 (not b_next!465))
