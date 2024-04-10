; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1822 () Bool)

(assert start!1822)

(declare-fun b_free!467 () Bool)

(declare-fun b_next!467 () Bool)

(assert (=> start!1822 (= b_free!467 (not b_next!467))))

(declare-fun tp!2120 () Bool)

(declare-fun b_and!865 () Bool)

(assert (=> start!1822 (= tp!2120 b_and!865)))

(declare-fun res!10164 () Bool)

(declare-fun e!7616 () Bool)

(assert (=> start!1822 (=> (not res!10164) (not e!7616))))

(declare-fun initialSize!1 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1822 (= res!10164 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (=> start!1822 e!7616))

(assert (=> start!1822 true))

(assert (=> start!1822 tp!2120))

(declare-fun b!12703 () Bool)

(declare-fun e!7615 () Bool)

(assert (=> b!12703 (= e!7616 e!7615)))

(declare-fun res!10165 () Bool)

(assert (=> b!12703 (=> res!10165 e!7615)))

(declare-datatypes ((array!881 0))(
  ( (array!882 (arr!423 (Array (_ BitVec 32) (_ BitVec 64))) (size!487 (_ BitVec 32))) )
))
(declare-datatypes ((V!865 0))(
  ( (V!866 (val!329 Int)) )
))
(declare-datatypes ((ValueCell!220 0))(
  ( (ValueCellFull!220 (v!1386 V!865)) (EmptyCell!220) )
))
(declare-datatypes ((array!883 0))(
  ( (array!884 (arr!424 (Array (_ BitVec 32) ValueCell!220)) (size!488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!26 0))(
  ( (LongMapFixedSize!27 (defaultEntry!1617 Int) (mask!4436 (_ BitVec 32)) (extraKeys!1534 (_ BitVec 32)) (zeroValue!1557 V!865) (minValue!1557 V!865) (_size!44 (_ BitVec 32)) (_keys!3039 array!881) (_values!1618 array!883) (_vacant!44 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!26 0))(
  ( (Cell!27 (v!1387 LongMapFixedSize!26)) )
))
(declare-datatypes ((LongMap!26 0))(
  ( (LongMap!27 (underlying!24 Cell!26)) )
))
(declare-fun lt!3192 () LongMap!26)

(declare-fun valid!14 (LongMap!26) Bool)

(assert (=> b!12703 (= res!10165 (not (valid!14 lt!3192)))))

(declare-fun defaultEntry!183 () Int)

(declare-fun getNewLongMapFixedSize!6 ((_ BitVec 32) Int) LongMapFixedSize!26)

(assert (=> b!12703 (= lt!3192 (LongMap!27 (Cell!27 (getNewLongMapFixedSize!6 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183))))))

(declare-fun b!12704 () Bool)

(declare-fun size!489 (LongMap!26) (_ BitVec 32))

(assert (=> b!12704 (= e!7615 (not (= (size!489 lt!3192) #b00000000000000000000000000000000)))))

(assert (= (and start!1822 res!10164) b!12703))

(assert (= (and b!12703 (not res!10165)) b!12704))

(declare-fun m!8613 () Bool)

(assert (=> start!1822 m!8613))

(declare-fun m!8615 () Bool)

(assert (=> b!12703 m!8615))

(declare-fun m!8617 () Bool)

(assert (=> b!12703 m!8617))

(declare-fun m!8619 () Bool)

(assert (=> b!12704 m!8619))

(push 1)

(assert (not b!12704))

(assert (not start!1822))

(assert (not b!12703))

(assert b_and!865)

(assert (not b_next!467))

(check-sat)

(pop 1)

(push 1)

(assert b_and!865)

(assert (not b_next!467))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1817 () Bool)

(assert (=> d!1817 (= (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)) (and (or (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000001111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000011111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000001111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000011111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000001111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000011111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000001111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000011111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000001111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000011111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000001111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000011111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000001111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000011111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000001111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000011111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00001111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00011111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (bvsle (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)))))

(assert (=> start!1822 d!1817))

(declare-fun d!1823 () Bool)

(declare-fun size!490 (LongMapFixedSize!26) (_ BitVec 32))

(assert (=> d!1823 (= (size!489 lt!3192) (size!490 (v!1387 (underlying!24 lt!3192))))))

(declare-fun bs!483 () Bool)

(assert (= bs!483 d!1823))

(declare-fun m!8621 () Bool)

(assert (=> bs!483 m!8621))

(assert (=> b!12704 d!1823))

(declare-fun d!1825 () Bool)

(declare-fun valid!15 (LongMapFixedSize!26) Bool)

(assert (=> d!1825 (= (valid!14 lt!3192) (valid!15 (v!1387 (underlying!24 lt!3192))))))

(declare-fun bs!484 () Bool)

(assert (= bs!484 d!1825))

(declare-fun m!8623 () Bool)

(assert (=> bs!484 m!8623))

(assert (=> b!12703 d!1825))

(declare-fun b!12717 () Bool)

(declare-fun e!7625 () Bool)

(declare-fun lt!3251 () LongMapFixedSize!26)

(declare-datatypes ((tuple2!454 0))(
  ( (tuple2!455 (_1!227 (_ BitVec 64)) (_2!227 V!865)) )
))
(declare-datatypes ((List!379 0))(
  ( (Nil!376) (Cons!375 (h!941 tuple2!454) (t!2768 List!379)) )
))
(declare-datatypes ((ListLongMap!393 0))(
  ( (ListLongMap!394 (toList!212 List!379)) )
))
(declare-fun map!241 (LongMapFixedSize!26) ListLongMap!393)

(assert (=> b!12717 (= e!7625 (= (map!241 lt!3251) (ListLongMap!394 Nil!376)))))

(declare-fun b!12718 () Bool)

(declare-fun e!7623 () Bool)

(declare-fun lt!3257 () tuple2!454)

(declare-fun lt!3249 () (_ BitVec 32))

(assert (=> b!12718 (= e!7623 (ite (= (_1!227 lt!3257) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3249 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3249 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!1829 () Bool)

(assert (=> d!1829 e!7625))

(declare-fun res!10171 () Bool)

(assert (=> d!1829 (=> (not res!10171) (not e!7625))))

(assert (=> d!1829 (= res!10171 (valid!15 lt!3251))))

(declare-fun lt!3244 () LongMapFixedSize!26)

(assert (=> d!1829 (= lt!3251 lt!3244)))

(declare-datatypes ((Unit!270 0))(
  ( (Unit!271) )
))
(declare-fun lt!3243 () Unit!270)

(declare-fun e!7624 () Unit!270)

(assert (=> d!1829 (= lt!3243 e!7624)))

(declare-fun c!1148 () Bool)

(assert (=> d!1829 (= c!1148 (not (= (map!241 lt!3244) (ListLongMap!394 Nil!376))))))

(declare-fun lt!3252 () Unit!270)

(declare-fun lt!3247 () Unit!270)

(assert (=> d!1829 (= lt!3252 lt!3247)))

(declare-fun lt!3260 () array!881)

(declare-fun lt!3246 () (_ BitVec 32))

(declare-datatypes ((List!380 0))(
  ( (Nil!377) (Cons!376 (h!942 (_ BitVec 64)) (t!2769 List!380)) )
))
(declare-fun lt!3242 () List!380)

(declare-fun arrayNoDuplicates!0 (array!881 (_ BitVec 32) List!380) Bool)

(assert (=> d!1829 (arrayNoDuplicates!0 lt!3260 lt!3246 lt!3242)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32) List!380) Unit!270)

(assert (=> d!1829 (= lt!3247 (lemmaArrayNoDuplicatesInAll0Array!0 lt!3260 lt!3246 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3242))))

(assert (=> d!1829 (= lt!3242 Nil!377)))

(assert (=> d!1829 (= lt!3246 #b00000000000000000000000000000000)))

(assert (=> d!1829 (= lt!3260 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3256 () Unit!270)

(declare-fun lt!3248 () Unit!270)

(assert (=> d!1829 (= lt!3256 lt!3248)))

(declare-fun lt!3261 () (_ BitVec 32))

(declare-fun lt!3259 () array!881)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!881 (_ BitVec 32)) Bool)

(assert (=> d!1829 (arrayForallSeekEntryOrOpenFound!0 lt!3261 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!270)

(assert (=> d!1829 (= lt!3248 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3261))))

(assert (=> d!1829 (= lt!3261 #b00000000000000000000000000000000)))

(assert (=> d!1829 (= lt!3259 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3245 () Unit!270)

(declare-fun lt!3255 () Unit!270)

(assert (=> d!1829 (= lt!3245 lt!3255)))

(declare-fun lt!3253 () array!881)

(declare-fun lt!3241 () (_ BitVec 32))

(declare-fun lt!3239 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!881 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!1829 (= (arrayCountValidKeys!0 lt!3253 lt!3241 lt!3239) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!270)

(assert (=> d!1829 (= lt!3255 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3253 lt!3241 lt!3239))))

(assert (=> d!1829 (= lt!3239 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1829 (= lt!3241 #b00000000000000000000000000000000)))

(assert (=> d!1829 (= lt!3253 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!79 (Int (_ BitVec 64)) V!865)

(assert (=> d!1829 (= lt!3244 (LongMapFixedSize!27 defaultEntry!183 (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000000 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (array!884 ((as const (Array (_ BitVec 32) ValueCell!220)) EmptyCell!220) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!1829 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1829 (= (getNewLongMapFixedSize!6 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183) lt!3251)))

(declare-fun b!12719 () Bool)

(declare-fun res!10170 () Bool)

(assert (=> b!12719 (=> (not res!10170) (not e!7625))))

(assert (=> b!12719 (= res!10170 (= (mask!4436 lt!3251) (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12720 () Bool)

(declare-fun lt!3240 () array!881)

(declare-fun arrayContainsKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!12720 (= e!7623 (arrayContainsKey!0 lt!3240 (_1!227 lt!3257) #b00000000000000000000000000000000))))

(declare-fun b!12721 () Bool)

(declare-fun Unit!272 () Unit!270)

(assert (=> b!12721 (= e!7624 Unit!272)))

(declare-fun b!12722 () Bool)

(declare-fun Unit!273 () Unit!270)

(assert (=> b!12722 (= e!7624 Unit!273)))

(declare-fun head!779 (List!379) tuple2!454)

(assert (=> b!12722 (= lt!3257 (head!779 (toList!212 (map!241 lt!3244))))))

(assert (=> b!12722 (= lt!3240 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!12722 (= lt!3249 #b00000000000000000000000000000000)))

(declare-fun lt!3258 () Unit!270)

(declare-fun lemmaKeyInListMapIsInArray!76 (array!881 array!883 (_ BitVec 32) (_ BitVec 32) V!865 V!865 (_ BitVec 64) Int) Unit!270)

(assert (=> b!12722 (= lt!3258 (lemmaKeyInListMapIsInArray!76 lt!3240 (array!884 ((as const (Array (_ BitVec 32) ValueCell!220)) EmptyCell!220) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3249 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!227 lt!3257) defaultEntry!183))))

(declare-fun c!1147 () Bool)

(assert (=> b!12722 (= c!1147 (and (not (= (_1!227 lt!3257) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!227 lt!3257) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12722 e!7623))

(declare-fun lt!3254 () Unit!270)

(assert (=> b!12722 (= lt!3254 lt!3258)))

(declare-fun lt!3250 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!12722 (= lt!3250 (arrayScanForKey!0 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!227 lt!3257) #b00000000000000000000000000000000))))

(assert (=> b!12722 false))

(assert (= (and d!1829 c!1148) b!12722))

(assert (= (and d!1829 (not c!1148)) b!12721))

(assert (= (and b!12722 c!1147) b!12720))

(assert (= (and b!12722 (not c!1147)) b!12718))

(assert (= (and d!1829 res!10171) b!12719))

(assert (= (and b!12719 res!10170) b!12717))

(declare-fun b_lambda!839 () Bool)

(assert (=> (not b_lambda!839) (not d!1829)))

(declare-fun t!2767 () Bool)

(declare-fun tb!387 () Bool)

(assert (=> (and start!1822 (= defaultEntry!183 defaultEntry!183) t!2767) tb!387))

(declare-fun result!609 () Bool)

(declare-fun tp_is_empty!637 () Bool)

(assert (=> tb!387 (= result!609 tp_is_empty!637)))

(assert (=> d!1829 t!2767))

(declare-fun b_and!867 () Bool)

(assert (= b_and!865 (and (=> t!2767 result!609) b_and!867)))

(declare-fun b_lambda!841 () Bool)

(assert (=> (not b_lambda!841) (not b!12722)))

(assert (=> b!12722 t!2767))

(declare-fun b_and!869 () Bool)

(assert (= b_and!867 (and (=> t!2767 result!609) b_and!869)))

(declare-fun m!8633 () Bool)

(assert (=> b!12717 m!8633))

(declare-fun m!8635 () Bool)

(assert (=> d!1829 m!8635))

(declare-fun m!8637 () Bool)

(assert (=> d!1829 m!8637))

(declare-fun m!8639 () Bool)

(assert (=> d!1829 m!8639))

(declare-fun m!8641 () Bool)

(assert (=> d!1829 m!8641))

(assert (=> d!1829 m!8613))

(declare-fun m!8643 () Bool)

(assert (=> d!1829 m!8643))

(declare-fun m!8645 () Bool)

(assert (=> d!1829 m!8645))

(declare-fun m!8647 () Bool)

(assert (=> d!1829 m!8647))

(declare-fun m!8649 () Bool)

(assert (=> d!1829 m!8649))

(declare-fun m!8651 () Bool)

(assert (=> d!1829 m!8651))

(declare-fun m!8653 () Bool)

(assert (=> b!12720 m!8653))

(declare-fun m!8655 () Bool)

(assert (=> b!12722 m!8655))

(declare-fun m!8657 () Bool)

(assert (=> b!12722 m!8657))

(assert (=> b!12722 m!8637))

(assert (=> b!12722 m!8637))

(assert (=> b!12722 m!8637))

(declare-fun m!8659 () Bool)

(assert (=> b!12722 m!8659))

(assert (=> b!12722 m!8649))

(assert (=> b!12703 d!1829))

(declare-fun b_lambda!843 () Bool)

(assert (= b_lambda!839 (or (and start!1822 b_free!467) b_lambda!843)))

(declare-fun b_lambda!845 () Bool)

(assert (= b_lambda!841 (or (and start!1822 b_free!467) b_lambda!845)))

(push 1)

(assert (not b!12722))

(assert (not b_next!467))

(assert tp_is_empty!637)

(assert (not d!1825))

(assert b_and!869)

(assert (not b!12720))

(assert (not d!1823))

(assert (not d!1829))

(assert (not b!12717))

(assert (not b_lambda!843))

(assert (not b_lambda!845))

(check-sat)

(pop 1)

(push 1)

(assert b_and!869)

(assert (not b_next!467))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1841 () Bool)

(declare-fun res!10188 () Bool)

(declare-fun e!7648 () Bool)

(assert (=> d!1841 (=> res!10188 e!7648)))

(assert (=> d!1841 (= res!10188 (= (select (arr!423 lt!3240) #b00000000000000000000000000000000) (_1!227 lt!3257)))))

(assert (=> d!1841 (= (arrayContainsKey!0 lt!3240 (_1!227 lt!3257) #b00000000000000000000000000000000) e!7648)))

(declare-fun b!12769 () Bool)

(declare-fun e!7649 () Bool)

(assert (=> b!12769 (= e!7648 e!7649)))

(declare-fun res!10189 () Bool)

(assert (=> b!12769 (=> (not res!10189) (not e!7649))))

(assert (=> b!12769 (= res!10189 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!487 lt!3240)))))

(declare-fun b!12770 () Bool)

(assert (=> b!12770 (= e!7649 (arrayContainsKey!0 lt!3240 (_1!227 lt!3257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1841 (not res!10188)) b!12769))

(assert (= (and b!12769 res!10189) b!12770))

(declare-fun m!8717 () Bool)

(assert (=> d!1841 m!8717))

(declare-fun m!8719 () Bool)

(assert (=> b!12770 m!8719))

(assert (=> b!12720 d!1841))

(declare-fun d!1843 () Bool)

(declare-fun res!10196 () Bool)

(declare-fun e!7652 () Bool)

(assert (=> d!1843 (=> (not res!10196) (not e!7652))))

(declare-fun simpleValid!5 (LongMapFixedSize!26) Bool)

(assert (=> d!1843 (= res!10196 (simpleValid!5 (v!1387 (underlying!24 lt!3192))))))

(assert (=> d!1843 (= (valid!15 (v!1387 (underlying!24 lt!3192))) e!7652)))

(declare-fun b!12777 () Bool)

(declare-fun res!10197 () Bool)

(assert (=> b!12777 (=> (not res!10197) (not e!7652))))

(assert (=> b!12777 (= res!10197 (= (arrayCountValidKeys!0 (_keys!3039 (v!1387 (underlying!24 lt!3192))) #b00000000000000000000000000000000 (size!487 (_keys!3039 (v!1387 (underlying!24 lt!3192))))) (_size!44 (v!1387 (underlying!24 lt!3192)))))))

(declare-fun b!12778 () Bool)

(declare-fun res!10198 () Bool)

(assert (=> b!12778 (=> (not res!10198) (not e!7652))))

(assert (=> b!12778 (= res!10198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3039 (v!1387 (underlying!24 lt!3192))) (mask!4436 (v!1387 (underlying!24 lt!3192)))))))

(declare-fun b!12779 () Bool)

(assert (=> b!12779 (= e!7652 (arrayNoDuplicates!0 (_keys!3039 (v!1387 (underlying!24 lt!3192))) #b00000000000000000000000000000000 Nil!377))))

(assert (= (and d!1843 res!10196) b!12777))

(assert (= (and b!12777 res!10197) b!12778))

(assert (= (and b!12778 res!10198) b!12779))

(declare-fun m!8721 () Bool)

(assert (=> d!1843 m!8721))

(declare-fun m!8723 () Bool)

(assert (=> b!12777 m!8723))

(declare-fun m!8725 () Bool)

(assert (=> b!12778 m!8725))

(declare-fun m!8727 () Bool)

(assert (=> b!12779 m!8727))

(assert (=> d!1825 d!1843))

(declare-fun d!1845 () Bool)

(declare-fun getCurrentListMap!117 (array!881 array!883 (_ BitVec 32) (_ BitVec 32) V!865 V!865 (_ BitVec 32) Int) ListLongMap!393)

(assert (=> d!1845 (= (map!241 lt!3251) (getCurrentListMap!117 (_keys!3039 lt!3251) (_values!1618 lt!3251) (mask!4436 lt!3251) (extraKeys!1534 lt!3251) (zeroValue!1557 lt!3251) (minValue!1557 lt!3251) #b00000000000000000000000000000000 (defaultEntry!1617 lt!3251)))))

(declare-fun bs!489 () Bool)

(assert (= bs!489 d!1845))

(declare-fun m!8729 () Bool)

(assert (=> bs!489 m!8729))

(assert (=> b!12717 d!1845))

(declare-fun d!1847 () Bool)

(assert (=> d!1847 (= (head!779 (toList!212 (map!241 lt!3244))) (h!941 (toList!212 (map!241 lt!3244))))))

(assert (=> b!12722 d!1847))

(declare-fun d!1849 () Bool)

(assert (=> d!1849 (= (map!241 lt!3244) (getCurrentListMap!117 (_keys!3039 lt!3244) (_values!1618 lt!3244) (mask!4436 lt!3244) (extraKeys!1534 lt!3244) (zeroValue!1557 lt!3244) (minValue!1557 lt!3244) #b00000000000000000000000000000000 (defaultEntry!1617 lt!3244)))))

(declare-fun bs!490 () Bool)

(assert (= bs!490 d!1849))

(declare-fun m!8731 () Bool)

(assert (=> bs!490 m!8731))

(assert (=> b!12722 d!1849))

(declare-fun d!1851 () Bool)

(declare-fun e!7655 () Bool)

(assert (=> d!1851 e!7655))

(declare-fun c!1163 () Bool)

(assert (=> d!1851 (= c!1163 (and (not (= (_1!227 lt!3257) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!227 lt!3257) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!3402 () Unit!270)

(declare-fun choose!165 (array!881 array!883 (_ BitVec 32) (_ BitVec 32) V!865 V!865 (_ BitVec 64) Int) Unit!270)

(assert (=> d!1851 (= lt!3402 (choose!165 lt!3240 (array!884 ((as const (Array (_ BitVec 32) ValueCell!220)) EmptyCell!220) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3249 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!227 lt!3257) defaultEntry!183))))

(assert (=> d!1851 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1851 (= (lemmaKeyInListMapIsInArray!76 lt!3240 (array!884 ((as const (Array (_ BitVec 32) ValueCell!220)) EmptyCell!220) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3249 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!227 lt!3257) defaultEntry!183) lt!3402)))

(declare-fun b!12784 () Bool)

(assert (=> b!12784 (= e!7655 (arrayContainsKey!0 lt!3240 (_1!227 lt!3257) #b00000000000000000000000000000000))))

(declare-fun b!12785 () Bool)

(assert (=> b!12785 (= e!7655 (ite (= (_1!227 lt!3257) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3249 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3249 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1851 c!1163) b!12784))

(assert (= (and d!1851 (not c!1163)) b!12785))

(assert (=> d!1851 m!8637))

(assert (=> d!1851 m!8637))

(declare-fun m!8733 () Bool)

(assert (=> d!1851 m!8733))

(assert (=> d!1851 m!8613))

(assert (=> b!12784 m!8653))

(assert (=> b!12722 d!1851))

(declare-fun d!1853 () Bool)

(declare-fun lt!3405 () (_ BitVec 32))

(assert (=> d!1853 (and (or (bvslt lt!3405 #b00000000000000000000000000000000) (bvsge lt!3405 (size!487 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (and (bvsge lt!3405 #b00000000000000000000000000000000) (bvslt lt!3405 (size!487 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))) (bvsge lt!3405 #b00000000000000000000000000000000) (bvslt lt!3405 (size!487 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (= (select (arr!423 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) lt!3405) (_1!227 lt!3257)))))

(declare-fun e!7658 () (_ BitVec 32))

(assert (=> d!1853 (= lt!3405 e!7658)))

(declare-fun c!1166 () Bool)

(assert (=> d!1853 (= c!1166 (= (select (arr!423 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!227 lt!3257)))))

(assert (=> d!1853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!487 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (bvslt (size!487 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!1853 (= (arrayScanForKey!0 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!227 lt!3257) #b00000000000000000000000000000000) lt!3405)))

(declare-fun b!12790 () Bool)

(assert (=> b!12790 (= e!7658 #b00000000000000000000000000000000)))

(declare-fun b!12791 () Bool)

(assert (=> b!12791 (= e!7658 (arrayScanForKey!0 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!227 lt!3257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1853 c!1166) b!12790))

(assert (= (and d!1853 (not c!1166)) b!12791))

(declare-fun m!8735 () Bool)

(assert (=> d!1853 m!8735))

(declare-fun m!8737 () Bool)

(assert (=> d!1853 m!8737))

(declare-fun m!8739 () Bool)

(assert (=> b!12791 m!8739))

(assert (=> b!12722 d!1853))

(declare-fun d!1857 () Bool)

(assert (=> d!1857 (arrayForallSeekEntryOrOpenFound!0 lt!3261 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lt!3408 () Unit!270)

(declare-fun choose!34 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!270)

(assert (=> d!1857 (= lt!3408 (choose!34 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3261))))

(assert (=> d!1857 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1857 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3261) lt!3408)))

(declare-fun bs!491 () Bool)

(assert (= bs!491 d!1857))

(assert (=> bs!491 m!8643))

(declare-fun m!8741 () Bool)

(assert (=> bs!491 m!8741))

(assert (=> bs!491 m!8613))

(assert (=> d!1829 d!1857))

(declare-fun d!1859 () Bool)

(assert (=> d!1859 (arrayNoDuplicates!0 lt!3260 lt!3246 lt!3242)))

(declare-fun lt!3411 () Unit!270)

(declare-fun choose!111 (array!881 (_ BitVec 32) (_ BitVec 32) List!380) Unit!270)

(assert (=> d!1859 (= lt!3411 (choose!111 lt!3260 lt!3246 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3242))))

(assert (=> d!1859 (= (size!487 lt!3260) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1859 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!3260 lt!3246 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3242) lt!3411)))

(declare-fun bs!492 () Bool)

(assert (= bs!492 d!1859))

(assert (=> bs!492 m!8635))

(declare-fun m!8751 () Bool)

(assert (=> bs!492 m!8751))

(assert (=> d!1829 d!1859))

(assert (=> d!1829 d!1849))

(declare-fun d!1867 () Bool)

(declare-fun lt!3414 () (_ BitVec 32))

(assert (=> d!1867 (and (bvsge lt!3414 #b00000000000000000000000000000000) (bvsle lt!3414 (bvsub (size!487 lt!3253) lt!3241)))))

(declare-fun e!7666 () (_ BitVec 32))

(assert (=> d!1867 (= lt!3414 e!7666)))

(declare-fun c!1172 () Bool)

(assert (=> d!1867 (= c!1172 (bvsge lt!3241 lt!3239))))

(assert (=> d!1867 (and (bvsle lt!3241 lt!3239) (bvsge lt!3241 #b00000000000000000000000000000000) (bvsle lt!3239 (size!487 lt!3253)))))

(assert (=> d!1867 (= (arrayCountValidKeys!0 lt!3253 lt!3241 lt!3239) lt!3414)))

(declare-fun b!12809 () Bool)

(declare-fun e!7667 () (_ BitVec 32))

(declare-fun call!323 () (_ BitVec 32))

(assert (=> b!12809 (= e!7667 call!323)))

(declare-fun b!12810 () Bool)

(assert (=> b!12810 (= e!7666 #b00000000000000000000000000000000)))

(declare-fun b!12811 () Bool)

(assert (=> b!12811 (= e!7667 (bvadd #b00000000000000000000000000000001 call!323))))

(declare-fun b!12812 () Bool)

(assert (=> b!12812 (= e!7666 e!7667)))

(declare-fun c!1171 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!12812 (= c!1171 (validKeyInArray!0 (select (arr!423 lt!3253) lt!3241)))))

(declare-fun bm!320 () Bool)

(assert (=> bm!320 (= call!323 (arrayCountValidKeys!0 lt!3253 (bvadd lt!3241 #b00000000000000000000000000000001) lt!3239))))

(assert (= (and d!1867 c!1172) b!12810))

(assert (= (and d!1867 (not c!1172)) b!12812))

(assert (= (and b!12812 c!1171) b!12811))

(assert (= (and b!12812 (not c!1171)) b!12809))

(assert (= (or b!12811 b!12809) bm!320))

(declare-fun m!8755 () Bool)

(assert (=> b!12812 m!8755))

(assert (=> b!12812 m!8755))

(declare-fun m!8757 () Bool)

(assert (=> b!12812 m!8757))

(declare-fun m!8759 () Bool)

(assert (=> bm!320 m!8759))

(assert (=> d!1829 d!1867))

(assert (=> d!1829 d!1817))

(declare-fun b!12845 () Bool)

(declare-fun e!7687 () Bool)

(declare-fun call!329 () Bool)

(assert (=> b!12845 (= e!7687 call!329)))

(declare-fun b!12846 () Bool)

(declare-fun e!7688 () Bool)

(assert (=> b!12846 (= e!7688 e!7687)))

(declare-fun c!1187 () Bool)

(assert (=> b!12846 (= c!1187 (validKeyInArray!0 (select (arr!423 lt!3259) lt!3261)))))

(declare-fun b!12847 () Bool)

(declare-fun e!7686 () Bool)

(assert (=> b!12847 (= e!7686 call!329)))

(declare-fun b!12848 () Bool)

(assert (=> b!12848 (= e!7687 e!7686)))

(declare-fun lt!3432 () (_ BitVec 64))

(assert (=> b!12848 (= lt!3432 (select (arr!423 lt!3259) lt!3261))))

(declare-fun lt!3430 () Unit!270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Unit!270)

(assert (=> b!12848 (= lt!3430 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!3259 lt!3432 lt!3261))))

(assert (=> b!12848 (arrayContainsKey!0 lt!3259 lt!3432 #b00000000000000000000000000000000)))

(declare-fun lt!3431 () Unit!270)

(assert (=> b!12848 (= lt!3431 lt!3430)))

(declare-fun res!10212 () Bool)

(declare-datatypes ((SeekEntryResult!39 0))(
  ( (MissingZero!39 (index!2275 (_ BitVec 32))) (Found!39 (index!2276 (_ BitVec 32))) (Intermediate!39 (undefined!851 Bool) (index!2277 (_ BitVec 32)) (x!3355 (_ BitVec 32))) (Undefined!39) (MissingVacant!39 (index!2278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!881 (_ BitVec 32)) SeekEntryResult!39)

(assert (=> b!12848 (= res!10212 (= (seekEntryOrOpen!0 (select (arr!423 lt!3259) lt!3261) lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001)) (Found!39 lt!3261)))))

(assert (=> b!12848 (=> (not res!10212) (not e!7686))))

(declare-fun bm!326 () Bool)

(assert (=> bm!326 (= call!329 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!3261 #b00000000000000000000000000000001) lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun d!1871 () Bool)

(declare-fun res!10213 () Bool)

(assert (=> d!1871 (=> res!10213 e!7688)))

(assert (=> d!1871 (= res!10213 (bvsge lt!3261 (size!487 lt!3259)))))

(assert (=> d!1871 (= (arrayForallSeekEntryOrOpenFound!0 lt!3261 lt!3259 (bvsub initialSize!1 #b00000000000000000000000000000001)) e!7688)))

(assert (= (and d!1871 (not res!10213)) b!12846))

(assert (= (and b!12846 c!1187) b!12848))

(assert (= (and b!12846 (not c!1187)) b!12845))

(assert (= (and b!12848 res!10212) b!12847))

(assert (= (or b!12847 b!12845) bm!326))

(declare-fun m!8777 () Bool)

(assert (=> b!12846 m!8777))

(assert (=> b!12846 m!8777))

(declare-fun m!8779 () Bool)

(assert (=> b!12846 m!8779))

(assert (=> b!12848 m!8777))

(declare-fun m!8781 () Bool)

(assert (=> b!12848 m!8781))

(declare-fun m!8783 () Bool)

(assert (=> b!12848 m!8783))

(assert (=> b!12848 m!8777))

(declare-fun m!8785 () Bool)

(assert (=> b!12848 m!8785))

(declare-fun m!8787 () Bool)

(assert (=> bm!326 m!8787))

(assert (=> d!1829 d!1871))

(declare-fun d!1881 () Bool)

(assert (=> d!1881 (= (arrayCountValidKeys!0 lt!3253 lt!3241 lt!3239) #b00000000000000000000000000000000)))

(declare-fun lt!3440 () Unit!270)

(declare-fun choose!59 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!270)

(assert (=> d!1881 (= lt!3440 (choose!59 lt!3253 lt!3241 lt!3239))))

(assert (=> d!1881 (bvslt (size!487 lt!3253) #b01111111111111111111111111111111)))

(assert (=> d!1881 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3253 lt!3241 lt!3239) lt!3440)))

(declare-fun bs!496 () Bool)

(assert (= bs!496 d!1881))

(assert (=> bs!496 m!8639))

(declare-fun m!8791 () Bool)

(assert (=> bs!496 m!8791))

(assert (=> d!1829 d!1881))

(declare-fun bm!331 () Bool)

(declare-fun c!1194 () Bool)

(declare-fun call!334 () Bool)

(assert (=> bm!331 (= call!334 (arrayNoDuplicates!0 lt!3260 (bvadd lt!3246 #b00000000000000000000000000000001) (ite c!1194 (Cons!376 (select (arr!423 lt!3260) lt!3246) lt!3242) lt!3242)))))

(declare-fun b!12876 () Bool)

(declare-fun e!7705 () Bool)

(assert (=> b!12876 (= e!7705 call!334)))

(declare-fun e!7704 () Bool)

(declare-fun b!12878 () Bool)

(declare-fun contains!189 (List!380 (_ BitVec 64)) Bool)

(assert (=> b!12878 (= e!7704 (contains!189 lt!3242 (select (arr!423 lt!3260) lt!3246)))))

(declare-fun b!12879 () Bool)

(declare-fun e!7707 () Bool)

(assert (=> b!12879 (= e!7707 e!7705)))

(assert (=> b!12879 (= c!1194 (validKeyInArray!0 (select (arr!423 lt!3260) lt!3246)))))

(declare-fun b!12880 () Bool)

(declare-fun e!7706 () Bool)

(assert (=> b!12880 (= e!7706 e!7707)))

(declare-fun res!10230 () Bool)

(assert (=> b!12880 (=> (not res!10230) (not e!7707))))

(assert (=> b!12880 (= res!10230 (not e!7704))))

(declare-fun res!10231 () Bool)

(assert (=> b!12880 (=> (not res!10231) (not e!7704))))

(assert (=> b!12880 (= res!10231 (validKeyInArray!0 (select (arr!423 lt!3260) lt!3246)))))

(declare-fun d!1887 () Bool)

(declare-fun res!10229 () Bool)

(assert (=> d!1887 (=> res!10229 e!7706)))

(assert (=> d!1887 (= res!10229 (bvsge lt!3246 (size!487 lt!3260)))))

(assert (=> d!1887 (= (arrayNoDuplicates!0 lt!3260 lt!3246 lt!3242) e!7706)))

(declare-fun b!12877 () Bool)

(assert (=> b!12877 (= e!7705 call!334)))

(assert (= (and d!1887 (not res!10229)) b!12880))

(assert (= (and b!12880 res!10231) b!12878))

(assert (= (and b!12880 res!10230) b!12879))

(assert (= (and b!12879 c!1194) b!12876))

(assert (= (and b!12879 (not c!1194)) b!12877))

(assert (= (or b!12876 b!12877) bm!331))

(declare-fun m!8805 () Bool)

(assert (=> bm!331 m!8805))

(declare-fun m!8809 () Bool)

(assert (=> bm!331 m!8809))

(assert (=> b!12878 m!8805))

(assert (=> b!12878 m!8805))

(declare-fun m!8813 () Bool)

(assert (=> b!12878 m!8813))

(assert (=> b!12879 m!8805))

(assert (=> b!12879 m!8805))

(declare-fun m!8815 () Bool)

(assert (=> b!12879 m!8815))

(assert (=> b!12880 m!8805))

(assert (=> b!12880 m!8805))

(assert (=> b!12880 m!8815))

(assert (=> d!1829 d!1887))

(declare-fun d!1895 () Bool)

(declare-fun res!10232 () Bool)

(declare-fun e!7710 () Bool)

(assert (=> d!1895 (=> (not res!10232) (not e!7710))))

(assert (=> d!1895 (= res!10232 (simpleValid!5 lt!3251))))

(assert (=> d!1895 (= (valid!15 lt!3251) e!7710)))

(declare-fun b!12885 () Bool)

(declare-fun res!10233 () Bool)

(assert (=> b!12885 (=> (not res!10233) (not e!7710))))

(assert (=> b!12885 (= res!10233 (= (arrayCountValidKeys!0 (_keys!3039 lt!3251) #b00000000000000000000000000000000 (size!487 (_keys!3039 lt!3251))) (_size!44 lt!3251)))))

(declare-fun b!12886 () Bool)

(declare-fun res!10234 () Bool)

(assert (=> b!12886 (=> (not res!10234) (not e!7710))))

(assert (=> b!12886 (= res!10234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3039 lt!3251) (mask!4436 lt!3251)))))

(declare-fun b!12887 () Bool)

(assert (=> b!12887 (= e!7710 (arrayNoDuplicates!0 (_keys!3039 lt!3251) #b00000000000000000000000000000000 Nil!377))))

(assert (= (and d!1895 res!10232) b!12885))

(assert (= (and b!12885 res!10233) b!12886))

(assert (= (and b!12886 res!10234) b!12887))

(declare-fun m!8817 () Bool)

(assert (=> d!1895 m!8817))

(declare-fun m!8819 () Bool)

(assert (=> b!12885 m!8819))

(declare-fun m!8821 () Bool)

(assert (=> b!12886 m!8821))

(declare-fun m!8823 () Bool)

(assert (=> b!12887 m!8823))

(assert (=> d!1829 d!1895))

(declare-fun d!1897 () Bool)

(assert (=> d!1897 (= (size!490 (v!1387 (underlying!24 lt!3192))) (bvadd (_size!44 (v!1387 (underlying!24 lt!3192))) (bvsdiv (bvadd (extraKeys!1534 (v!1387 (underlying!24 lt!3192))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!1823 d!1897))

(push 1)

(assert (not b!12846))

(assert (not bm!331))

(assert (not b!12778))

(assert (not b!12886))

(assert (not b_next!467))

(assert tp_is_empty!637)

(assert (not b!12791))

(assert (not d!1851))

(assert (not b!12777))

(assert b_and!869)

(assert (not d!1881))

(assert (not b!12880))

(assert (not b!12812))

(assert (not b!12879))

(assert (not d!1843))

(assert (not b!12770))

(assert (not bm!320))

(assert (not b!12885))

(assert (not b!12887))

(assert (not d!1859))

(assert (not b!12779))

(assert (not d!1857))

(assert (not b!12848))

(assert (not b!12784))

(assert (not b_lambda!843))

(assert (not b!12878))

(assert (not b_lambda!845))

(assert (not bm!326))

(assert (not d!1895))

(assert (not d!1845))

(assert (not d!1849))

(check-sat)

(pop 1)

(push 1)

(assert b_and!869)

(assert (not b_next!467))

(check-sat)

