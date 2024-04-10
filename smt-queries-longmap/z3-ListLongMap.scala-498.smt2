; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11272 () Bool)

(assert start!11272)

(declare-fun b!93069 () Bool)

(declare-fun b_free!2369 () Bool)

(declare-fun b_next!2369 () Bool)

(assert (=> b!93069 (= b_free!2369 (not b_next!2369))))

(declare-fun tp!9366 () Bool)

(declare-fun b_and!5667 () Bool)

(assert (=> b!93069 (= tp!9366 b_and!5667)))

(declare-fun b!93055 () Bool)

(declare-fun b_free!2371 () Bool)

(declare-fun b_next!2371 () Bool)

(assert (=> b!93055 (= b_free!2371 (not b_next!2371))))

(declare-fun tp!9365 () Bool)

(declare-fun b_and!5669 () Bool)

(assert (=> b!93055 (= tp!9365 b_and!5669)))

(declare-fun mapNonEmpty!3631 () Bool)

(declare-fun mapRes!3631 () Bool)

(declare-fun tp!9367 () Bool)

(declare-fun e!60739 () Bool)

(assert (=> mapNonEmpty!3631 (= mapRes!3631 (and tp!9367 e!60739))))

(declare-datatypes ((V!3115 0))(
  ( (V!3116 (val!1345 Int)) )
))
(declare-datatypes ((array!4173 0))(
  ( (array!4174 (arr!1985 (Array (_ BitVec 32) (_ BitVec 64))) (size!2233 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!957 0))(
  ( (ValueCellFull!957 (v!2745 V!3115)) (EmptyCell!957) )
))
(declare-datatypes ((array!4175 0))(
  ( (array!4176 (arr!1986 (Array (_ BitVec 32) ValueCell!957)) (size!2234 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!822 0))(
  ( (LongMapFixedSize!823 (defaultEntry!2425 Int) (mask!6495 (_ BitVec 32)) (extraKeys!2254 (_ BitVec 32)) (zeroValue!2312 V!3115) (minValue!2312 V!3115) (_size!460 (_ BitVec 32)) (_keys!4107 array!4173) (_values!2408 array!4175) (_vacant!460 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!622 0))(
  ( (Cell!623 (v!2746 LongMapFixedSize!822)) )
))
(declare-datatypes ((LongMap!622 0))(
  ( (LongMap!623 (underlying!322 Cell!622)) )
))
(declare-fun thiss!992 () LongMap!622)

(declare-fun mapValue!3632 () ValueCell!957)

(declare-fun mapRest!3631 () (Array (_ BitVec 32) ValueCell!957))

(declare-fun mapKey!3631 () (_ BitVec 32))

(assert (=> mapNonEmpty!3631 (= (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (store mapRest!3631 mapKey!3631 mapValue!3632))))

(declare-fun b!93048 () Bool)

(declare-fun e!60747 () Bool)

(declare-fun e!60743 () Bool)

(assert (=> b!93048 (= e!60747 e!60743)))

(declare-fun res!47272 () Bool)

(assert (=> b!93048 (=> (not res!47272) (not e!60743))))

(declare-datatypes ((tuple2!2294 0))(
  ( (tuple2!2295 (_1!1158 (_ BitVec 64)) (_2!1158 V!3115)) )
))
(declare-datatypes ((List!1561 0))(
  ( (Nil!1558) (Cons!1557 (h!2149 tuple2!2294) (t!5439 List!1561)) )
))
(declare-datatypes ((ListLongMap!1511 0))(
  ( (ListLongMap!1512 (toList!771 List!1561)) )
))
(declare-fun lt!45901 () ListLongMap!1511)

(declare-fun lt!45906 () ListLongMap!1511)

(assert (=> b!93048 (= res!47272 (= lt!45901 lt!45906))))

(declare-fun newMap!16 () LongMapFixedSize!822)

(declare-fun map!1234 (LongMapFixedSize!822) ListLongMap!1511)

(assert (=> b!93048 (= lt!45906 (map!1234 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!463 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 32) Int) ListLongMap!1511)

(assert (=> b!93048 (= lt!45901 (getCurrentListMap!463 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93049 () Bool)

(declare-fun res!47268 () Bool)

(assert (=> b!93049 (=> (not res!47268) (not e!60747))))

(declare-fun valid!365 (LongMapFixedSize!822) Bool)

(assert (=> b!93049 (= res!47268 (valid!365 newMap!16))))

(declare-fun mapNonEmpty!3632 () Bool)

(declare-fun mapRes!3632 () Bool)

(declare-fun tp!9368 () Bool)

(declare-fun e!60748 () Bool)

(assert (=> mapNonEmpty!3632 (= mapRes!3632 (and tp!9368 e!60748))))

(declare-fun mapRest!3632 () (Array (_ BitVec 32) ValueCell!957))

(declare-fun mapValue!3631 () ValueCell!957)

(declare-fun mapKey!3632 () (_ BitVec 32))

(assert (=> mapNonEmpty!3632 (= (arr!1986 (_values!2408 newMap!16)) (store mapRest!3632 mapKey!3632 mapValue!3631))))

(declare-fun b!93050 () Bool)

(declare-fun e!60734 () Bool)

(declare-fun e!60741 () Bool)

(assert (=> b!93050 (= e!60734 e!60741)))

(declare-fun res!47269 () Bool)

(assert (=> b!93050 (=> (not res!47269) (not e!60741))))

(declare-datatypes ((tuple2!2296 0))(
  ( (tuple2!2297 (_1!1159 Bool) (_2!1159 LongMapFixedSize!822)) )
))
(declare-fun lt!45899 () tuple2!2296)

(assert (=> b!93050 (= res!47269 (and (_1!1159 lt!45899) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2773 0))(
  ( (Unit!2774) )
))
(declare-fun lt!45905 () Unit!2773)

(declare-fun e!60735 () Unit!2773)

(assert (=> b!93050 (= lt!45905 e!60735)))

(declare-fun c!15469 () Bool)

(declare-fun contains!784 (ListLongMap!1511 (_ BitVec 64)) Bool)

(assert (=> b!93050 (= c!15469 (contains!784 lt!45906 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun lt!45892 () V!3115)

(declare-fun update!131 (LongMapFixedSize!822 (_ BitVec 64) V!3115) tuple2!2296)

(assert (=> b!93050 (= lt!45899 (update!131 newMap!16 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892))))

(declare-fun b!93051 () Bool)

(declare-fun e!60737 () Bool)

(assert (=> b!93051 (= e!60741 (not e!60737))))

(declare-fun res!47270 () Bool)

(assert (=> b!93051 (=> res!47270 e!60737)))

(assert (=> b!93051 (= res!47270 (not (= (getCurrentListMap!463 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) (map!1234 (_2!1159 lt!45899)))))))

(declare-fun lt!45900 () tuple2!2294)

(declare-fun lt!45893 () ListLongMap!1511)

(declare-fun lt!45888 () tuple2!2294)

(declare-fun lt!45894 () ListLongMap!1511)

(declare-fun +!131 (ListLongMap!1511 tuple2!2294) ListLongMap!1511)

(assert (=> b!93051 (= (+!131 lt!45894 lt!45900) (+!131 (+!131 lt!45893 lt!45900) lt!45888))))

(assert (=> b!93051 (= lt!45900 (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!45902 () Unit!2773)

(declare-fun addCommutativeForDiffKeys!50 (ListLongMap!1511 (_ BitVec 64) V!3115 (_ BitVec 64) V!3115) Unit!2773)

(assert (=> b!93051 (= lt!45902 (addCommutativeForDiffKeys!50 lt!45893 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!45891 () ListLongMap!1511)

(assert (=> b!93051 (= lt!45891 lt!45894)))

(assert (=> b!93051 (= lt!45894 (+!131 lt!45893 lt!45888))))

(declare-fun lt!45903 () ListLongMap!1511)

(declare-fun lt!45896 () tuple2!2294)

(assert (=> b!93051 (= lt!45891 (+!131 lt!45903 lt!45896))))

(declare-fun lt!45890 () ListLongMap!1511)

(assert (=> b!93051 (= lt!45893 (+!131 lt!45890 lt!45896))))

(assert (=> b!93051 (= lt!45896 (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(assert (=> b!93051 (= lt!45903 (+!131 lt!45890 lt!45888))))

(assert (=> b!93051 (= lt!45888 (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892))))

(declare-fun lt!45904 () Unit!2773)

(assert (=> b!93051 (= lt!45904 (addCommutativeForDiffKeys!50 lt!45890 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!96 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 32) Int) ListLongMap!1511)

(assert (=> b!93051 (= lt!45890 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun mapIsEmpty!3631 () Bool)

(assert (=> mapIsEmpty!3631 mapRes!3632))

(declare-fun b!93052 () Bool)

(declare-fun e!60736 () Bool)

(declare-fun e!60744 () Bool)

(assert (=> b!93052 (= e!60736 e!60744)))

(declare-fun b!93053 () Bool)

(declare-fun res!47273 () Bool)

(declare-fun e!60738 () Bool)

(assert (=> b!93053 (=> res!47273 e!60738)))

(declare-fun lt!45898 () tuple2!2296)

(assert (=> b!93053 (= res!47273 (not (valid!365 (_2!1159 lt!45898))))))

(declare-fun b!93054 () Bool)

(assert (=> b!93054 (= e!60738 (valid!365 (v!2746 (underlying!322 thiss!992))))))

(declare-fun res!47274 () Bool)

(assert (=> start!11272 (=> (not res!47274) (not e!60747))))

(declare-fun valid!366 (LongMap!622) Bool)

(assert (=> start!11272 (= res!47274 (valid!366 thiss!992))))

(assert (=> start!11272 e!60747))

(declare-fun e!60750 () Bool)

(assert (=> start!11272 e!60750))

(assert (=> start!11272 true))

(declare-fun e!60749 () Bool)

(assert (=> start!11272 e!60749))

(declare-fun tp_is_empty!2601 () Bool)

(declare-fun e!60745 () Bool)

(declare-fun array_inv!1231 (array!4173) Bool)

(declare-fun array_inv!1232 (array!4175) Bool)

(assert (=> b!93055 (= e!60749 (and tp!9365 tp_is_empty!2601 (array_inv!1231 (_keys!4107 newMap!16)) (array_inv!1232 (_values!2408 newMap!16)) e!60745))))

(declare-fun b!93056 () Bool)

(assert (=> b!93056 (= e!60743 e!60734)))

(declare-fun res!47277 () Bool)

(assert (=> b!93056 (=> (not res!47277) (not e!60734))))

(assert (=> b!93056 (= res!47277 (and (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1251 (ValueCell!957 V!3115) V!3115)

(declare-fun dynLambda!359 (Int (_ BitVec 64)) V!3115)

(assert (=> b!93056 (= lt!45892 (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93057 () Bool)

(declare-fun e!60746 () Bool)

(assert (=> b!93057 (= e!60746 tp_is_empty!2601)))

(declare-fun mapIsEmpty!3632 () Bool)

(assert (=> mapIsEmpty!3632 mapRes!3631))

(declare-fun b!93058 () Bool)

(assert (=> b!93058 (= e!60739 tp_is_empty!2601)))

(declare-fun b!93059 () Bool)

(declare-fun Unit!2775 () Unit!2773)

(assert (=> b!93059 (= e!60735 Unit!2775)))

(declare-fun b!93060 () Bool)

(assert (=> b!93060 (= e!60750 e!60736)))

(declare-fun b!93061 () Bool)

(declare-fun res!47276 () Bool)

(assert (=> b!93061 (=> (not res!47276) (not e!60747))))

(assert (=> b!93061 (= res!47276 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun b!93062 () Bool)

(declare-fun res!47275 () Bool)

(assert (=> b!93062 (=> (not res!47275) (not e!60747))))

(assert (=> b!93062 (= res!47275 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6495 newMap!16)) (_size!460 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93063 () Bool)

(declare-fun Unit!2776 () Unit!2773)

(assert (=> b!93063 (= e!60735 Unit!2776)))

(declare-fun lt!45897 () Unit!2773)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!82 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 64) (_ BitVec 32) Int) Unit!2773)

(assert (=> b!93063 (= lt!45897 (lemmaListMapContainsThenArrayContainsFrom!82 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!93063 (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45895 () Unit!2773)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4173 (_ BitVec 32) (_ BitVec 32)) Unit!2773)

(assert (=> b!93063 (= lt!45895 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1562 0))(
  ( (Nil!1559) (Cons!1558 (h!2150 (_ BitVec 64)) (t!5440 List!1562)) )
))
(declare-fun arrayNoDuplicates!0 (array!4173 (_ BitVec 32) List!1562) Bool)

(assert (=> b!93063 (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) from!355 Nil!1559)))

(declare-fun lt!45889 () Unit!2773)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4173 (_ BitVec 32) (_ BitVec 64) List!1562) Unit!2773)

(assert (=> b!93063 (= lt!45889 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (Cons!1558 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) Nil!1559)))))

(assert (=> b!93063 false))

(declare-fun b!93064 () Bool)

(declare-fun e!60751 () Bool)

(assert (=> b!93064 (= e!60751 tp_is_empty!2601)))

(declare-fun b!93065 () Bool)

(assert (=> b!93065 (= e!60737 e!60738)))

(declare-fun res!47271 () Bool)

(assert (=> b!93065 (=> res!47271 e!60738)))

(assert (=> b!93065 (= res!47271 (not (_1!1159 lt!45898)))))

(declare-fun repackFrom!12 (LongMap!622 LongMapFixedSize!822 (_ BitVec 32)) tuple2!2296)

(assert (=> b!93065 (= lt!45898 (repackFrom!12 thiss!992 (_2!1159 lt!45899) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!93066 () Bool)

(assert (=> b!93066 (= e!60745 (and e!60746 mapRes!3632))))

(declare-fun condMapEmpty!3632 () Bool)

(declare-fun mapDefault!3631 () ValueCell!957)

(assert (=> b!93066 (= condMapEmpty!3632 (= (arr!1986 (_values!2408 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!957)) mapDefault!3631)))))

(declare-fun b!93067 () Bool)

(assert (=> b!93067 (= e!60748 tp_is_empty!2601)))

(declare-fun b!93068 () Bool)

(declare-fun e!60742 () Bool)

(assert (=> b!93068 (= e!60742 (and e!60751 mapRes!3631))))

(declare-fun condMapEmpty!3631 () Bool)

(declare-fun mapDefault!3632 () ValueCell!957)

(assert (=> b!93068 (= condMapEmpty!3631 (= (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!957)) mapDefault!3632)))))

(assert (=> b!93069 (= e!60744 (and tp!9366 tp_is_empty!2601 (array_inv!1231 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (array_inv!1232 (_values!2408 (v!2746 (underlying!322 thiss!992)))) e!60742))))

(assert (= (and start!11272 res!47274) b!93061))

(assert (= (and b!93061 res!47276) b!93049))

(assert (= (and b!93049 res!47268) b!93062))

(assert (= (and b!93062 res!47275) b!93048))

(assert (= (and b!93048 res!47272) b!93056))

(assert (= (and b!93056 res!47277) b!93050))

(assert (= (and b!93050 c!15469) b!93063))

(assert (= (and b!93050 (not c!15469)) b!93059))

(assert (= (and b!93050 res!47269) b!93051))

(assert (= (and b!93051 (not res!47270)) b!93065))

(assert (= (and b!93065 (not res!47271)) b!93053))

(assert (= (and b!93053 (not res!47273)) b!93054))

(assert (= (and b!93068 condMapEmpty!3631) mapIsEmpty!3632))

(assert (= (and b!93068 (not condMapEmpty!3631)) mapNonEmpty!3631))

(get-info :version)

(assert (= (and mapNonEmpty!3631 ((_ is ValueCellFull!957) mapValue!3632)) b!93058))

(assert (= (and b!93068 ((_ is ValueCellFull!957) mapDefault!3632)) b!93064))

(assert (= b!93069 b!93068))

(assert (= b!93052 b!93069))

(assert (= b!93060 b!93052))

(assert (= start!11272 b!93060))

(assert (= (and b!93066 condMapEmpty!3632) mapIsEmpty!3631))

(assert (= (and b!93066 (not condMapEmpty!3632)) mapNonEmpty!3632))

(assert (= (and mapNonEmpty!3632 ((_ is ValueCellFull!957) mapValue!3631)) b!93067))

(assert (= (and b!93066 ((_ is ValueCellFull!957) mapDefault!3631)) b!93057))

(assert (= b!93055 b!93066))

(assert (= start!11272 b!93055))

(declare-fun b_lambda!4103 () Bool)

(assert (=> (not b_lambda!4103) (not b!93056)))

(declare-fun t!5436 () Bool)

(declare-fun tb!1845 () Bool)

(assert (=> (and b!93069 (= (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) t!5436) tb!1845))

(declare-fun result!3147 () Bool)

(assert (=> tb!1845 (= result!3147 tp_is_empty!2601)))

(assert (=> b!93056 t!5436))

(declare-fun b_and!5671 () Bool)

(assert (= b_and!5667 (and (=> t!5436 result!3147) b_and!5671)))

(declare-fun tb!1847 () Bool)

(declare-fun t!5438 () Bool)

(assert (=> (and b!93055 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) t!5438) tb!1847))

(declare-fun result!3151 () Bool)

(assert (= result!3151 result!3147))

(assert (=> b!93056 t!5438))

(declare-fun b_and!5673 () Bool)

(assert (= b_and!5669 (and (=> t!5438 result!3151) b_and!5673)))

(declare-fun m!100489 () Bool)

(assert (=> b!93069 m!100489))

(declare-fun m!100491 () Bool)

(assert (=> b!93069 m!100491))

(declare-fun m!100493 () Bool)

(assert (=> mapNonEmpty!3632 m!100493))

(declare-fun m!100495 () Bool)

(assert (=> b!93053 m!100495))

(declare-fun m!100497 () Bool)

(assert (=> b!93050 m!100497))

(assert (=> b!93050 m!100497))

(declare-fun m!100499 () Bool)

(assert (=> b!93050 m!100499))

(assert (=> b!93050 m!100497))

(declare-fun m!100501 () Bool)

(assert (=> b!93050 m!100501))

(declare-fun m!100503 () Bool)

(assert (=> b!93063 m!100503))

(declare-fun m!100505 () Bool)

(assert (=> b!93063 m!100505))

(assert (=> b!93063 m!100497))

(declare-fun m!100507 () Bool)

(assert (=> b!93063 m!100507))

(assert (=> b!93063 m!100497))

(assert (=> b!93063 m!100497))

(declare-fun m!100509 () Bool)

(assert (=> b!93063 m!100509))

(assert (=> b!93063 m!100497))

(declare-fun m!100511 () Bool)

(assert (=> b!93063 m!100511))

(declare-fun m!100513 () Bool)

(assert (=> mapNonEmpty!3631 m!100513))

(declare-fun m!100515 () Bool)

(assert (=> b!93055 m!100515))

(declare-fun m!100517 () Bool)

(assert (=> b!93055 m!100517))

(declare-fun m!100519 () Bool)

(assert (=> b!93054 m!100519))

(declare-fun m!100521 () Bool)

(assert (=> b!93048 m!100521))

(declare-fun m!100523 () Bool)

(assert (=> b!93048 m!100523))

(declare-fun m!100525 () Bool)

(assert (=> start!11272 m!100525))

(assert (=> b!93056 m!100497))

(declare-fun m!100527 () Bool)

(assert (=> b!93056 m!100527))

(declare-fun m!100529 () Bool)

(assert (=> b!93056 m!100529))

(assert (=> b!93056 m!100527))

(assert (=> b!93056 m!100529))

(declare-fun m!100531 () Bool)

(assert (=> b!93056 m!100531))

(declare-fun m!100533 () Bool)

(assert (=> b!93049 m!100533))

(declare-fun m!100535 () Bool)

(assert (=> b!93065 m!100535))

(declare-fun m!100537 () Bool)

(assert (=> b!93051 m!100537))

(declare-fun m!100539 () Bool)

(assert (=> b!93051 m!100539))

(declare-fun m!100541 () Bool)

(assert (=> b!93051 m!100541))

(declare-fun m!100543 () Bool)

(assert (=> b!93051 m!100543))

(assert (=> b!93051 m!100497))

(declare-fun m!100545 () Bool)

(assert (=> b!93051 m!100545))

(declare-fun m!100547 () Bool)

(assert (=> b!93051 m!100547))

(assert (=> b!93051 m!100497))

(declare-fun m!100549 () Bool)

(assert (=> b!93051 m!100549))

(declare-fun m!100551 () Bool)

(assert (=> b!93051 m!100551))

(assert (=> b!93051 m!100539))

(declare-fun m!100553 () Bool)

(assert (=> b!93051 m!100553))

(assert (=> b!93051 m!100497))

(declare-fun m!100555 () Bool)

(assert (=> b!93051 m!100555))

(declare-fun m!100557 () Bool)

(assert (=> b!93051 m!100557))

(declare-fun m!100559 () Bool)

(assert (=> b!93051 m!100559))

(check-sat (not mapNonEmpty!3631) (not b!93050) (not b!93054) (not b_next!2371) (not start!11272) (not b!93069) (not b_lambda!4103) (not b!93049) (not b!93063) (not b!93055) (not mapNonEmpty!3632) (not b!93053) (not b_next!2369) (not b!93065) b_and!5671 (not b!93048) (not b!93056) (not b!93051) b_and!5673 tp_is_empty!2601)
(check-sat b_and!5671 b_and!5673 (not b_next!2369) (not b_next!2371))
(get-model)

(declare-fun b_lambda!4107 () Bool)

(assert (= b_lambda!4103 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4107)))

(check-sat (not mapNonEmpty!3631) (not b_lambda!4107) (not b!93050) (not b!93054) (not b_next!2371) (not start!11272) (not b!93069) (not b!93049) (not b!93063) (not b!93055) (not mapNonEmpty!3632) (not b!93053) (not b_next!2369) (not b!93065) b_and!5671 (not b!93048) (not b!93056) (not b!93051) b_and!5673 tp_is_empty!2601)
(check-sat b_and!5671 b_and!5673 (not b_next!2369) (not b_next!2371))
(get-model)

(declare-fun d!24487 () Bool)

(declare-fun res!47314 () Bool)

(declare-fun e!60812 () Bool)

(assert (=> d!24487 (=> (not res!47314) (not e!60812))))

(declare-fun simpleValid!64 (LongMapFixedSize!822) Bool)

(assert (=> d!24487 (= res!47314 (simpleValid!64 (v!2746 (underlying!322 thiss!992))))))

(assert (=> d!24487 (= (valid!365 (v!2746 (underlying!322 thiss!992))) e!60812)))

(declare-fun b!93146 () Bool)

(declare-fun res!47315 () Bool)

(assert (=> b!93146 (=> (not res!47315) (not e!60812))))

(declare-fun arrayCountValidKeys!0 (array!4173 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93146 (= res!47315 (= (arrayCountValidKeys!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))) (_size!460 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93147 () Bool)

(declare-fun res!47316 () Bool)

(assert (=> b!93147 (=> (not res!47316) (not e!60812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4173 (_ BitVec 32)) Bool)

(assert (=> b!93147 (= res!47316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93148 () Bool)

(assert (=> b!93148 (= e!60812 (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 Nil!1559))))

(assert (= (and d!24487 res!47314) b!93146))

(assert (= (and b!93146 res!47315) b!93147))

(assert (= (and b!93147 res!47316) b!93148))

(declare-fun m!100633 () Bool)

(assert (=> d!24487 m!100633))

(declare-fun m!100635 () Bool)

(assert (=> b!93146 m!100635))

(declare-fun m!100637 () Bool)

(assert (=> b!93147 m!100637))

(declare-fun m!100639 () Bool)

(assert (=> b!93148 m!100639))

(assert (=> b!93054 d!24487))

(declare-fun d!24489 () Bool)

(assert (=> d!24489 (= (array_inv!1231 (_keys!4107 newMap!16)) (bvsge (size!2233 (_keys!4107 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93055 d!24489))

(declare-fun d!24491 () Bool)

(assert (=> d!24491 (= (array_inv!1232 (_values!2408 newMap!16)) (bvsge (size!2234 (_values!2408 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93055 d!24491))

(declare-fun b!93177 () Bool)

(declare-fun e!60832 () tuple2!2296)

(assert (=> b!93177 (= e!60832 (tuple2!2297 true (_2!1159 lt!45899)))))

(declare-fun b!93178 () Bool)

(declare-fun e!60831 () Bool)

(declare-fun lt!46029 () (_ BitVec 64))

(assert (=> b!93178 (= e!60831 (ite (= lt!46029 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!93179 () Bool)

(declare-fun e!60834 () tuple2!2296)

(declare-fun lt!46039 () tuple2!2296)

(assert (=> b!93179 (= e!60834 (tuple2!2297 (_1!1159 lt!46039) (_2!1159 lt!46039)))))

(declare-fun lt!46038 () ListLongMap!1511)

(declare-fun call!9160 () ListLongMap!1511)

(assert (=> b!93179 (= lt!46038 call!9160)))

(declare-fun lt!46050 () (_ BitVec 64))

(assert (=> b!93179 (= lt!46050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46032 () Unit!2773)

(declare-fun call!9153 () Unit!2773)

(assert (=> b!93179 (= lt!46032 call!9153)))

(declare-fun call!9161 () ListLongMap!1511)

(declare-fun call!9164 () ListLongMap!1511)

(assert (=> b!93179 (= call!9161 call!9164)))

(declare-fun lt!46037 () Unit!2773)

(assert (=> b!93179 (= lt!46037 lt!46032)))

(declare-fun lt!46055 () ListLongMap!1511)

(declare-fun call!9163 () ListLongMap!1511)

(assert (=> b!93179 (= lt!46055 call!9163)))

(declare-fun lt!46031 () (_ BitVec 64))

(assert (=> b!93179 (= lt!46031 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46040 () Unit!2773)

(declare-fun call!9162 () Unit!2773)

(assert (=> b!93179 (= lt!46040 call!9162)))

(declare-fun call!9157 () ListLongMap!1511)

(declare-fun call!9154 () ListLongMap!1511)

(assert (=> b!93179 (= call!9157 call!9154)))

(declare-fun lt!46056 () Unit!2773)

(assert (=> b!93179 (= lt!46056 lt!46040)))

(declare-fun call!9158 () tuple2!2296)

(assert (=> b!93179 (= lt!46039 call!9158)))

(declare-fun bm!9149 () Bool)

(assert (=> bm!9149 (= call!9160 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun c!15485 () Bool)

(declare-fun bm!9150 () Bool)

(declare-fun call!9159 () ListLongMap!1511)

(assert (=> bm!9150 (= call!9161 (+!131 (ite c!15485 call!9159 call!9160) (ite c!15485 (tuple2!2295 lt!46050 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun lt!46044 () V!3115)

(declare-fun bm!9151 () Bool)

(declare-fun lt!46046 () ListLongMap!1511)

(declare-fun call!9156 () ListLongMap!1511)

(assert (=> bm!9151 (= call!9156 (+!131 (ite c!15485 lt!46055 lt!46046) (tuple2!2295 lt!46029 lt!46044)))))

(declare-fun bm!9152 () Bool)

(declare-fun lt!46034 () ListLongMap!1511)

(declare-fun lt!46043 () (_ BitVec 64))

(assert (=> bm!9152 (= call!9159 (+!131 (ite c!15485 lt!46038 lt!46034) (ite c!15485 (tuple2!2295 lt!46029 lt!46044) (tuple2!2295 lt!46043 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun bm!9153 () Bool)

(declare-fun call!9152 () ListLongMap!1511)

(assert (=> bm!9153 (= call!9157 (+!131 (ite c!15485 call!9156 call!9152) (ite c!15485 (tuple2!2295 lt!46031 (minValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 lt!46029 lt!46044))))))

(declare-fun bm!9154 () Bool)

(assert (=> bm!9154 (= call!9164 (+!131 (ite c!15485 call!9152 call!9159) (tuple2!2295 lt!46029 lt!46044)))))

(declare-fun lt!46051 () tuple2!2296)

(declare-fun bm!9155 () Bool)

(declare-fun c!15489 () Bool)

(assert (=> bm!9155 (= call!9158 (repackFrom!12 thiss!992 (ite c!15489 (_2!1159 lt!46051) (_2!1159 lt!45899)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!46047 () (_ BitVec 32))

(declare-fun b!93180 () Bool)

(assert (=> b!93180 (= e!60831 (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) lt!46029 lt!46047))))

(declare-fun lt!46058 () (_ BitVec 64))

(declare-fun call!9155 () ListLongMap!1511)

(declare-fun bm!9156 () Bool)

(assert (=> bm!9156 (= call!9154 (+!131 (ite c!15485 call!9155 call!9156) (ite c!15485 (tuple2!2295 lt!46029 lt!46044) (tuple2!2295 lt!46058 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun d!24493 () Bool)

(declare-fun e!60836 () Bool)

(assert (=> d!24493 e!60836))

(declare-fun res!47322 () Bool)

(assert (=> d!24493 (=> res!47322 e!60836)))

(declare-fun lt!46057 () tuple2!2296)

(assert (=> d!24493 (= res!47322 (not (_1!1159 lt!46057)))))

(declare-fun e!60833 () tuple2!2296)

(assert (=> d!24493 (= lt!46057 e!60833)))

(assert (=> d!24493 (= c!15489 (and (not (= lt!46029 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46029 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46053 () ListLongMap!1511)

(assert (=> d!24493 (= lt!46053 (map!1234 (_2!1159 lt!45899)))))

(assert (=> d!24493 (= lt!46044 (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24493 (= lt!46029 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!24493 (valid!366 thiss!992)))

(assert (=> d!24493 (= (repackFrom!12 thiss!992 (_2!1159 lt!45899) (bvsub from!355 #b00000000000000000000000000000001)) lt!46057)))

(declare-fun b!93181 () Bool)

(declare-fun e!60830 () tuple2!2296)

(assert (=> b!93181 (= e!60830 (tuple2!2297 false (_2!1159 lt!46051)))))

(declare-fun b!93182 () Bool)

(assert (=> b!93182 false))

(declare-fun lt!46042 () Unit!2773)

(declare-fun lt!46059 () Unit!2773)

(assert (=> b!93182 (= lt!46042 lt!46059)))

(declare-fun lt!46028 () (_ BitVec 32))

(assert (=> b!93182 (not (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) lt!46029 lt!46028))))

(assert (=> b!93182 (= lt!46059 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) lt!46028 lt!46029 (Cons!1558 lt!46029 Nil!1559)))))

(assert (=> b!93182 (= lt!46028 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!46036 () Unit!2773)

(declare-fun lt!46033 () Unit!2773)

(assert (=> b!93182 (= lt!46036 lt!46033)))

(assert (=> b!93182 (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1559)))

(assert (=> b!93182 (= lt!46033 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!46052 () Unit!2773)

(declare-fun lt!46048 () Unit!2773)

(assert (=> b!93182 (= lt!46052 lt!46048)))

(assert (=> b!93182 e!60831))

(declare-fun c!15490 () Bool)

(assert (=> b!93182 (= c!15490 (and (not (= lt!46029 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46029 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93182 (= lt!46048 (lemmaListMapContainsThenArrayContainsFrom!82 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46029 lt!46047 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(assert (=> b!93182 (= lt!46047 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!60829 () Unit!2773)

(declare-fun Unit!2780 () Unit!2773)

(assert (=> b!93182 (= e!60829 Unit!2780)))

(declare-fun b!93183 () Bool)

(assert (=> b!93183 (= c!15485 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!93183 (= e!60830 e!60834)))

(declare-fun b!93184 () Bool)

(assert (=> b!93184 (= e!60833 e!60830)))

(assert (=> b!93184 (= lt!46051 (update!131 (_2!1159 lt!45899) lt!46029 lt!46044))))

(declare-fun c!15487 () Bool)

(assert (=> b!93184 (= c!15487 (contains!784 lt!46053 lt!46029))))

(declare-fun lt!46035 () Unit!2773)

(assert (=> b!93184 (= lt!46035 e!60829)))

(declare-fun c!15486 () Bool)

(assert (=> b!93184 (= c!15486 (_1!1159 lt!46051))))

(declare-fun bm!9157 () Bool)

(assert (=> bm!9157 (= call!9162 (addCommutativeForDiffKeys!50 (ite c!15485 lt!46055 lt!46034) lt!46029 lt!46044 (ite c!15485 lt!46031 lt!46043) (ite c!15485 (minValue!2312 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93185 () Bool)

(declare-fun lt!46030 () tuple2!2296)

(assert (=> b!93185 (= lt!46030 call!9158)))

(assert (=> b!93185 (= e!60832 (tuple2!2297 (_1!1159 lt!46030) (_2!1159 lt!46030)))))

(declare-fun bm!9158 () Bool)

(assert (=> bm!9158 (= call!9163 (+!131 (ite c!15485 call!9160 call!9155) (ite c!15485 (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 lt!46043 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun b!93186 () Bool)

(assert (=> b!93186 (= e!60834 (tuple2!2297 true (_2!1159 lt!46051)))))

(assert (=> b!93186 (= lt!46034 call!9160)))

(assert (=> b!93186 (= lt!46043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46049 () Unit!2773)

(assert (=> b!93186 (= lt!46049 call!9162)))

(assert (=> b!93186 (= call!9163 call!9164)))

(declare-fun lt!46045 () Unit!2773)

(assert (=> b!93186 (= lt!46045 lt!46049)))

(assert (=> b!93186 (= lt!46046 call!9161)))

(assert (=> b!93186 (= lt!46058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46041 () Unit!2773)

(assert (=> b!93186 (= lt!46041 call!9153)))

(assert (=> b!93186 (= call!9154 call!9157)))

(declare-fun lt!46054 () Unit!2773)

(assert (=> b!93186 (= lt!46054 lt!46041)))

(declare-fun b!93187 () Bool)

(declare-fun e!60835 () Bool)

(assert (=> b!93187 (= e!60836 e!60835)))

(declare-fun res!47321 () Bool)

(assert (=> b!93187 (=> (not res!47321) (not e!60835))))

(assert (=> b!93187 (= res!47321 (valid!365 (_2!1159 lt!46057)))))

(declare-fun b!93188 () Bool)

(assert (=> b!93188 (= e!60835 (= (map!1234 (_2!1159 lt!46057)) (map!1234 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93189 () Bool)

(assert (=> b!93189 (= e!60833 e!60832)))

(declare-fun c!15488 () Bool)

(assert (=> b!93189 (= c!15488 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!9159 () Bool)

(assert (=> bm!9159 (= call!9153 (addCommutativeForDiffKeys!50 (ite c!15485 lt!46038 lt!46046) lt!46029 lt!46044 (ite c!15485 lt!46050 lt!46058) (ite c!15485 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun bm!9160 () Bool)

(assert (=> bm!9160 (= call!9155 (+!131 (ite c!15485 lt!46055 lt!46034) (ite c!15485 (tuple2!2295 lt!46031 (minValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 lt!46029 lt!46044))))))

(declare-fun bm!9161 () Bool)

(assert (=> bm!9161 (= call!9152 (+!131 (ite c!15485 lt!46038 lt!46046) (ite c!15485 (tuple2!2295 lt!46050 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 lt!46058 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun b!93190 () Bool)

(declare-fun Unit!2781 () Unit!2773)

(assert (=> b!93190 (= e!60829 Unit!2781)))

(assert (= (and d!24493 c!15489) b!93184))

(assert (= (and d!24493 (not c!15489)) b!93189))

(assert (= (and b!93184 c!15487) b!93182))

(assert (= (and b!93184 (not c!15487)) b!93190))

(assert (= (and b!93182 c!15490) b!93180))

(assert (= (and b!93182 (not c!15490)) b!93178))

(assert (= (and b!93184 c!15486) b!93183))

(assert (= (and b!93184 (not c!15486)) b!93181))

(assert (= (and b!93183 c!15485) b!93179))

(assert (= (and b!93183 (not c!15485)) b!93186))

(assert (= (or b!93179 b!93186) bm!9149))

(assert (= (or b!93179 b!93186) bm!9151))

(assert (= (or b!93179 b!93186) bm!9152))

(assert (= (or b!93179 b!93186) bm!9161))

(assert (= (or b!93179 b!93186) bm!9159))

(assert (= (or b!93179 b!93186) bm!9157))

(assert (= (or b!93179 b!93186) bm!9160))

(assert (= (or b!93179 b!93186) bm!9150))

(assert (= (or b!93179 b!93186) bm!9154))

(assert (= (or b!93179 b!93186) bm!9158))

(assert (= (or b!93179 b!93186) bm!9153))

(assert (= (or b!93179 b!93186) bm!9156))

(assert (= (and b!93189 c!15488) b!93185))

(assert (= (and b!93189 (not c!15488)) b!93177))

(assert (= (or b!93179 b!93185) bm!9155))

(assert (= (and d!24493 (not res!47322)) b!93187))

(assert (= (and b!93187 res!47321) b!93188))

(declare-fun b_lambda!4109 () Bool)

(assert (=> (not b_lambda!4109) (not d!24493)))

(assert (=> d!24493 t!5436))

(declare-fun b_and!5683 () Bool)

(assert (= b_and!5671 (and (=> t!5436 result!3147) b_and!5683)))

(assert (=> d!24493 t!5438))

(declare-fun b_and!5685 () Bool)

(assert (= b_and!5673 (and (=> t!5438 result!3151) b_and!5685)))

(declare-fun m!100641 () Bool)

(assert (=> bm!9149 m!100641))

(declare-fun m!100643 () Bool)

(assert (=> b!93180 m!100643))

(declare-fun m!100645 () Bool)

(assert (=> b!93187 m!100645))

(declare-fun m!100647 () Bool)

(assert (=> bm!9150 m!100647))

(declare-fun m!100649 () Bool)

(assert (=> d!24493 m!100649))

(assert (=> d!24493 m!100525))

(assert (=> d!24493 m!100557))

(assert (=> d!24493 m!100649))

(assert (=> d!24493 m!100529))

(declare-fun m!100651 () Bool)

(assert (=> d!24493 m!100651))

(declare-fun m!100653 () Bool)

(assert (=> d!24493 m!100653))

(assert (=> d!24493 m!100529))

(declare-fun m!100655 () Bool)

(assert (=> bm!9151 m!100655))

(declare-fun m!100657 () Bool)

(assert (=> bm!9161 m!100657))

(declare-fun m!100659 () Bool)

(assert (=> bm!9160 m!100659))

(declare-fun m!100661 () Bool)

(assert (=> bm!9152 m!100661))

(declare-fun m!100663 () Bool)

(assert (=> b!93188 m!100663))

(declare-fun m!100665 () Bool)

(assert (=> b!93188 m!100665))

(declare-fun m!100667 () Bool)

(assert (=> bm!9158 m!100667))

(declare-fun m!100669 () Bool)

(assert (=> bm!9156 m!100669))

(declare-fun m!100671 () Bool)

(assert (=> bm!9159 m!100671))

(declare-fun m!100673 () Bool)

(assert (=> b!93182 m!100673))

(declare-fun m!100675 () Bool)

(assert (=> b!93182 m!100675))

(declare-fun m!100677 () Bool)

(assert (=> b!93182 m!100677))

(declare-fun m!100679 () Bool)

(assert (=> b!93182 m!100679))

(declare-fun m!100681 () Bool)

(assert (=> b!93182 m!100681))

(declare-fun m!100683 () Bool)

(assert (=> bm!9154 m!100683))

(declare-fun m!100685 () Bool)

(assert (=> bm!9155 m!100685))

(declare-fun m!100687 () Bool)

(assert (=> b!93184 m!100687))

(declare-fun m!100689 () Bool)

(assert (=> b!93184 m!100689))

(declare-fun m!100691 () Bool)

(assert (=> bm!9153 m!100691))

(declare-fun m!100693 () Bool)

(assert (=> bm!9157 m!100693))

(assert (=> b!93065 d!24493))

(declare-fun d!24495 () Bool)

(declare-fun c!15493 () Bool)

(assert (=> d!24495 (= c!15493 ((_ is ValueCellFull!957) (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun e!60839 () V!3115)

(assert (=> d!24495 (= (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!60839)))

(declare-fun b!93195 () Bool)

(declare-fun get!1252 (ValueCell!957 V!3115) V!3115)

(assert (=> b!93195 (= e!60839 (get!1252 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93196 () Bool)

(declare-fun get!1253 (ValueCell!957 V!3115) V!3115)

(assert (=> b!93196 (= e!60839 (get!1253 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24495 c!15493) b!93195))

(assert (= (and d!24495 (not c!15493)) b!93196))

(assert (=> b!93195 m!100527))

(assert (=> b!93195 m!100529))

(declare-fun m!100695 () Bool)

(assert (=> b!93195 m!100695))

(assert (=> b!93196 m!100527))

(assert (=> b!93196 m!100529))

(declare-fun m!100697 () Bool)

(assert (=> b!93196 m!100697))

(assert (=> b!93056 d!24495))

(declare-fun d!24497 () Bool)

(declare-fun res!47323 () Bool)

(declare-fun e!60840 () Bool)

(assert (=> d!24497 (=> (not res!47323) (not e!60840))))

(assert (=> d!24497 (= res!47323 (simpleValid!64 (_2!1159 lt!45898)))))

(assert (=> d!24497 (= (valid!365 (_2!1159 lt!45898)) e!60840)))

(declare-fun b!93197 () Bool)

(declare-fun res!47324 () Bool)

(assert (=> b!93197 (=> (not res!47324) (not e!60840))))

(assert (=> b!93197 (= res!47324 (= (arrayCountValidKeys!0 (_keys!4107 (_2!1159 lt!45898)) #b00000000000000000000000000000000 (size!2233 (_keys!4107 (_2!1159 lt!45898)))) (_size!460 (_2!1159 lt!45898))))))

(declare-fun b!93198 () Bool)

(declare-fun res!47325 () Bool)

(assert (=> b!93198 (=> (not res!47325) (not e!60840))))

(assert (=> b!93198 (= res!47325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4107 (_2!1159 lt!45898)) (mask!6495 (_2!1159 lt!45898))))))

(declare-fun b!93199 () Bool)

(assert (=> b!93199 (= e!60840 (arrayNoDuplicates!0 (_keys!4107 (_2!1159 lt!45898)) #b00000000000000000000000000000000 Nil!1559))))

(assert (= (and d!24497 res!47323) b!93197))

(assert (= (and b!93197 res!47324) b!93198))

(assert (= (and b!93198 res!47325) b!93199))

(declare-fun m!100699 () Bool)

(assert (=> d!24497 m!100699))

(declare-fun m!100701 () Bool)

(assert (=> b!93197 m!100701))

(declare-fun m!100703 () Bool)

(assert (=> b!93198 m!100703))

(declare-fun m!100705 () Bool)

(assert (=> b!93199 m!100705))

(assert (=> b!93053 d!24497))

(declare-fun d!24499 () Bool)

(assert (=> d!24499 (not (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46062 () Unit!2773)

(declare-fun choose!68 (array!4173 (_ BitVec 32) (_ BitVec 64) List!1562) Unit!2773)

(assert (=> d!24499 (= lt!46062 (choose!68 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (Cons!1558 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) Nil!1559)))))

(assert (=> d!24499 (bvslt (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24499 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (Cons!1558 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) Nil!1559)) lt!46062)))

(declare-fun bs!3851 () Bool)

(assert (= bs!3851 d!24499))

(assert (=> bs!3851 m!100497))

(assert (=> bs!3851 m!100509))

(assert (=> bs!3851 m!100497))

(declare-fun m!100707 () Bool)

(assert (=> bs!3851 m!100707))

(assert (=> b!93063 d!24499))

(declare-fun d!24501 () Bool)

(assert (=> d!24501 (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) from!355 Nil!1559)))

(declare-fun lt!46065 () Unit!2773)

(declare-fun choose!39 (array!4173 (_ BitVec 32) (_ BitVec 32)) Unit!2773)

(assert (=> d!24501 (= lt!46065 (choose!39 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24501 (bvslt (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24501 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000000 from!355) lt!46065)))

(declare-fun bs!3852 () Bool)

(assert (= bs!3852 d!24501))

(assert (=> bs!3852 m!100505))

(declare-fun m!100709 () Bool)

(assert (=> bs!3852 m!100709))

(assert (=> b!93063 d!24501))

(declare-fun d!24503 () Bool)

(declare-fun res!47330 () Bool)

(declare-fun e!60845 () Bool)

(assert (=> d!24503 (=> res!47330 e!60845)))

(assert (=> d!24503 (= res!47330 (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (=> d!24503 (= (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!60845)))

(declare-fun b!93204 () Bool)

(declare-fun e!60846 () Bool)

(assert (=> b!93204 (= e!60845 e!60846)))

(declare-fun res!47331 () Bool)

(assert (=> b!93204 (=> (not res!47331) (not e!60846))))

(assert (=> b!93204 (= res!47331 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93205 () Bool)

(assert (=> b!93205 (= e!60846 (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24503 (not res!47330)) b!93204))

(assert (= (and b!93204 res!47331) b!93205))

(declare-fun m!100711 () Bool)

(assert (=> d!24503 m!100711))

(assert (=> b!93205 m!100497))

(declare-fun m!100713 () Bool)

(assert (=> b!93205 m!100713))

(assert (=> b!93063 d!24503))

(declare-fun d!24505 () Bool)

(declare-fun e!60849 () Bool)

(assert (=> d!24505 e!60849))

(declare-fun c!15496 () Bool)

(assert (=> d!24505 (= c!15496 (and (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46068 () Unit!2773)

(declare-fun choose!556 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 64) (_ BitVec 32) Int) Unit!2773)

(assert (=> d!24505 (= lt!46068 (choose!556 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24505 (validMask!0 (mask!6495 (v!2746 (underlying!322 thiss!992))))))

(assert (=> d!24505 (= (lemmaListMapContainsThenArrayContainsFrom!82 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) lt!46068)))

(declare-fun b!93210 () Bool)

(assert (=> b!93210 (= e!60849 (arrayContainsKey!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93211 () Bool)

(assert (=> b!93211 (= e!60849 (ite (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24505 c!15496) b!93210))

(assert (= (and d!24505 (not c!15496)) b!93211))

(assert (=> d!24505 m!100497))

(declare-fun m!100715 () Bool)

(assert (=> d!24505 m!100715))

(declare-fun m!100717 () Bool)

(assert (=> d!24505 m!100717))

(assert (=> b!93210 m!100497))

(assert (=> b!93210 m!100509))

(assert (=> b!93063 d!24505))

(declare-fun b!93222 () Bool)

(declare-fun e!60858 () Bool)

(declare-fun e!60861 () Bool)

(assert (=> b!93222 (= e!60858 e!60861)))

(declare-fun res!47340 () Bool)

(assert (=> b!93222 (=> (not res!47340) (not e!60861))))

(declare-fun e!60859 () Bool)

(assert (=> b!93222 (= res!47340 (not e!60859))))

(declare-fun res!47338 () Bool)

(assert (=> b!93222 (=> (not res!47338) (not e!60859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93222 (= res!47338 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun bm!9164 () Bool)

(declare-fun call!9167 () Bool)

(declare-fun c!15499 () Bool)

(assert (=> bm!9164 (= call!9167 (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15499 (Cons!1558 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) Nil!1559) Nil!1559)))))

(declare-fun d!24507 () Bool)

(declare-fun res!47339 () Bool)

(assert (=> d!24507 (=> res!47339 e!60858)))

(assert (=> d!24507 (= res!47339 (bvsge from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> d!24507 (= (arrayNoDuplicates!0 (_keys!4107 (v!2746 (underlying!322 thiss!992))) from!355 Nil!1559) e!60858)))

(declare-fun b!93223 () Bool)

(declare-fun e!60860 () Bool)

(assert (=> b!93223 (= e!60860 call!9167)))

(declare-fun b!93224 () Bool)

(assert (=> b!93224 (= e!60860 call!9167)))

(declare-fun b!93225 () Bool)

(declare-fun contains!785 (List!1562 (_ BitVec 64)) Bool)

(assert (=> b!93225 (= e!60859 (contains!785 Nil!1559 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun b!93226 () Bool)

(assert (=> b!93226 (= e!60861 e!60860)))

(assert (=> b!93226 (= c!15499 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (= (and d!24507 (not res!47339)) b!93222))

(assert (= (and b!93222 res!47338) b!93225))

(assert (= (and b!93222 res!47340) b!93226))

(assert (= (and b!93226 c!15499) b!93223))

(assert (= (and b!93226 (not c!15499)) b!93224))

(assert (= (or b!93223 b!93224) bm!9164))

(assert (=> b!93222 m!100497))

(assert (=> b!93222 m!100497))

(declare-fun m!100719 () Bool)

(assert (=> b!93222 m!100719))

(assert (=> bm!9164 m!100497))

(declare-fun m!100721 () Bool)

(assert (=> bm!9164 m!100721))

(assert (=> b!93225 m!100497))

(assert (=> b!93225 m!100497))

(declare-fun m!100723 () Bool)

(assert (=> b!93225 m!100723))

(assert (=> b!93226 m!100497))

(assert (=> b!93226 m!100497))

(assert (=> b!93226 m!100719))

(assert (=> b!93063 d!24507))

(declare-fun d!24509 () Bool)

(declare-fun e!60866 () Bool)

(assert (=> d!24509 e!60866))

(declare-fun res!47343 () Bool)

(assert (=> d!24509 (=> res!47343 e!60866)))

(declare-fun lt!46079 () Bool)

(assert (=> d!24509 (= res!47343 (not lt!46079))))

(declare-fun lt!46078 () Bool)

(assert (=> d!24509 (= lt!46079 lt!46078)))

(declare-fun lt!46077 () Unit!2773)

(declare-fun e!60867 () Unit!2773)

(assert (=> d!24509 (= lt!46077 e!60867)))

(declare-fun c!15502 () Bool)

(assert (=> d!24509 (= c!15502 lt!46078)))

(declare-fun containsKey!150 (List!1561 (_ BitVec 64)) Bool)

(assert (=> d!24509 (= lt!46078 (containsKey!150 (toList!771 lt!45906) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (=> d!24509 (= (contains!784 lt!45906 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)) lt!46079)))

(declare-fun b!93233 () Bool)

(declare-fun lt!46080 () Unit!2773)

(assert (=> b!93233 (= e!60867 lt!46080)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!98 (List!1561 (_ BitVec 64)) Unit!2773)

(assert (=> b!93233 (= lt!46080 (lemmaContainsKeyImpliesGetValueByKeyDefined!98 (toList!771 lt!45906) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-datatypes ((Option!152 0))(
  ( (Some!151 (v!2750 V!3115)) (None!150) )
))
(declare-fun isDefined!99 (Option!152) Bool)

(declare-fun getValueByKey!146 (List!1561 (_ BitVec 64)) Option!152)

(assert (=> b!93233 (isDefined!99 (getValueByKey!146 (toList!771 lt!45906) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun b!93234 () Bool)

(declare-fun Unit!2782 () Unit!2773)

(assert (=> b!93234 (= e!60867 Unit!2782)))

(declare-fun b!93235 () Bool)

(assert (=> b!93235 (= e!60866 (isDefined!99 (getValueByKey!146 (toList!771 lt!45906) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))))

(assert (= (and d!24509 c!15502) b!93233))

(assert (= (and d!24509 (not c!15502)) b!93234))

(assert (= (and d!24509 (not res!47343)) b!93235))

(assert (=> d!24509 m!100497))

(declare-fun m!100725 () Bool)

(assert (=> d!24509 m!100725))

(assert (=> b!93233 m!100497))

(declare-fun m!100727 () Bool)

(assert (=> b!93233 m!100727))

(assert (=> b!93233 m!100497))

(declare-fun m!100729 () Bool)

(assert (=> b!93233 m!100729))

(assert (=> b!93233 m!100729))

(declare-fun m!100731 () Bool)

(assert (=> b!93233 m!100731))

(assert (=> b!93235 m!100497))

(assert (=> b!93235 m!100729))

(assert (=> b!93235 m!100729))

(assert (=> b!93235 m!100731))

(assert (=> b!93050 d!24509))

(declare-fun bm!9213 () Bool)

(declare-fun call!9227 () Bool)

(declare-fun call!9228 () Bool)

(assert (=> bm!9213 (= call!9227 call!9228)))

(declare-fun b!93316 () Bool)

(declare-fun lt!46154 () Unit!2773)

(declare-fun lt!46161 () Unit!2773)

(assert (=> b!93316 (= lt!46154 lt!46161)))

(declare-fun call!9216 () ListLongMap!1511)

(declare-fun call!9222 () ListLongMap!1511)

(assert (=> b!93316 (= call!9216 call!9222)))

(declare-fun lt!46147 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!37 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 V!3115 Int) Unit!2773)

(assert (=> b!93316 (= lt!46161 (lemmaChangeZeroKeyThenAddPairToListMap!37 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) lt!46147 (zeroValue!2312 newMap!16) lt!45892 (minValue!2312 newMap!16) (defaultEntry!2425 newMap!16)))))

(assert (=> b!93316 (= lt!46147 (bvor (extraKeys!2254 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!60927 () tuple2!2296)

(assert (=> b!93316 (= e!60927 (tuple2!2297 true (LongMapFixedSize!823 (defaultEntry!2425 newMap!16) (mask!6495 newMap!16) (bvor (extraKeys!2254 newMap!16) #b00000000000000000000000000000001) lt!45892 (minValue!2312 newMap!16) (_size!460 newMap!16) (_keys!4107 newMap!16) (_values!2408 newMap!16) (_vacant!460 newMap!16))))))

(declare-fun call!9217 () ListLongMap!1511)

(declare-fun e!60926 () Bool)

(declare-fun call!9231 () ListLongMap!1511)

(declare-fun b!93317 () Bool)

(assert (=> b!93317 (= e!60926 (= call!9231 (+!131 call!9217 (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892))))))

(declare-fun b!93318 () Bool)

(declare-fun e!60912 () Unit!2773)

(declare-fun lt!46153 () Unit!2773)

(assert (=> b!93318 (= e!60912 lt!46153)))

(declare-fun call!9233 () Unit!2773)

(assert (=> b!93318 (= lt!46153 call!9233)))

(declare-datatypes ((SeekEntryResult!249 0))(
  ( (MissingZero!249 (index!3137 (_ BitVec 32))) (Found!249 (index!3138 (_ BitVec 32))) (Intermediate!249 (undefined!1061 Bool) (index!3139 (_ BitVec 32)) (x!12573 (_ BitVec 32))) (Undefined!249) (MissingVacant!249 (index!3140 (_ BitVec 32))) )
))
(declare-fun lt!46140 () SeekEntryResult!249)

(declare-fun call!9237 () SeekEntryResult!249)

(assert (=> b!93318 (= lt!46140 call!9237)))

(declare-fun c!15533 () Bool)

(assert (=> b!93318 (= c!15533 ((_ is MissingZero!249) lt!46140))))

(declare-fun e!60922 () Bool)

(assert (=> b!93318 e!60922))

(declare-fun b!93319 () Bool)

(declare-fun e!60929 () Bool)

(declare-fun e!60930 () Bool)

(assert (=> b!93319 (= e!60929 e!60930)))

(declare-fun c!15529 () Bool)

(declare-fun lt!46136 () tuple2!2296)

(assert (=> b!93319 (= c!15529 (_1!1159 lt!46136))))

(declare-fun b!93320 () Bool)

(declare-fun res!47383 () Bool)

(assert (=> b!93320 (= res!47383 call!9227)))

(declare-fun e!60928 () Bool)

(assert (=> b!93320 (=> (not res!47383) (not e!60928))))

(declare-fun bm!9215 () Bool)

(declare-fun lt!46141 () SeekEntryResult!249)

(declare-fun c!15541 () Bool)

(declare-fun call!9239 () tuple2!2296)

(declare-fun updateHelperNewKey!37 (LongMapFixedSize!822 (_ BitVec 64) V!3115 (_ BitVec 32)) tuple2!2296)

(assert (=> bm!9215 (= call!9239 (updateHelperNewKey!37 newMap!16 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 (ite c!15541 (index!3140 lt!46141) (index!3137 lt!46141))))))

(declare-fun call!9230 () Unit!2773)

(declare-fun bm!9216 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 64) Int) Unit!2773)

(assert (=> bm!9216 (= call!9230 (lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (defaultEntry!2425 newMap!16)))))

(declare-fun b!93321 () Bool)

(declare-fun Unit!2783 () Unit!2773)

(assert (=> b!93321 (= e!60912 Unit!2783)))

(declare-fun lt!46137 () Unit!2773)

(assert (=> b!93321 (= lt!46137 call!9230)))

(declare-fun lt!46149 () SeekEntryResult!249)

(assert (=> b!93321 (= lt!46149 call!9237)))

(declare-fun res!47374 () Bool)

(assert (=> b!93321 (= res!47374 ((_ is Found!249) lt!46149))))

(declare-fun e!60925 () Bool)

(assert (=> b!93321 (=> (not res!47374) (not e!60925))))

(assert (=> b!93321 e!60925))

(declare-fun lt!46146 () Unit!2773)

(assert (=> b!93321 (= lt!46146 lt!46137)))

(assert (=> b!93321 false))

(declare-fun b!93322 () Bool)

(declare-fun e!60911 () tuple2!2296)

(declare-fun e!60919 () tuple2!2296)

(assert (=> b!93322 (= e!60911 e!60919)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4173 (_ BitVec 32)) SeekEntryResult!249)

(assert (=> b!93322 (= lt!46141 (seekEntryOrOpen!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (_keys!4107 newMap!16) (mask!6495 newMap!16)))))

(declare-fun c!15531 () Bool)

(assert (=> b!93322 (= c!15531 ((_ is Undefined!249) lt!46141))))

(declare-fun bm!9217 () Bool)

(declare-fun call!9219 () Bool)

(declare-fun call!9226 () Bool)

(assert (=> bm!9217 (= call!9219 call!9226)))

(declare-fun b!93323 () Bool)

(declare-fun e!60923 () Bool)

(declare-fun call!9232 () Bool)

(assert (=> b!93323 (= e!60923 (not call!9232))))

(declare-fun b!93324 () Bool)

(declare-fun res!47377 () Bool)

(declare-fun e!60924 () Bool)

(assert (=> b!93324 (=> (not res!47377) (not e!60924))))

(assert (=> b!93324 (= res!47377 call!9219)))

(assert (=> b!93324 (= e!60922 e!60924)))

(declare-fun bm!9218 () Bool)

(declare-fun call!9221 () Bool)

(assert (=> bm!9218 (= call!9221 call!9227)))

(declare-fun b!93325 () Bool)

(declare-fun e!60914 () ListLongMap!1511)

(assert (=> b!93325 (= e!60914 (getCurrentListMap!463 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2425 newMap!16)))))

(declare-fun b!93326 () Bool)

(declare-fun lt!46135 () tuple2!2296)

(assert (=> b!93326 (= lt!46135 call!9239)))

(declare-fun e!60915 () tuple2!2296)

(assert (=> b!93326 (= e!60915 (tuple2!2297 (_1!1159 lt!46135) (_2!1159 lt!46135)))))

(declare-fun b!93327 () Bool)

(declare-fun c!15532 () Bool)

(declare-fun lt!46156 () SeekEntryResult!249)

(assert (=> b!93327 (= c!15532 ((_ is MissingVacant!249) lt!46156))))

(declare-fun e!60916 () Bool)

(declare-fun e!60913 () Bool)

(assert (=> b!93327 (= e!60916 e!60913)))

(declare-fun b!93328 () Bool)

(declare-fun e!60917 () Bool)

(declare-fun call!9218 () Bool)

(assert (=> b!93328 (= e!60917 (not call!9218))))

(declare-fun bm!9219 () Bool)

(declare-fun call!9235 () Bool)

(assert (=> bm!9219 (= call!9232 call!9235)))

(declare-fun bm!9220 () Bool)

(assert (=> bm!9220 (= call!9218 call!9235)))

(declare-fun bm!9221 () Bool)

(declare-fun call!9234 () ListLongMap!1511)

(assert (=> bm!9221 (= call!9216 call!9234)))

(declare-fun b!93329 () Bool)

(assert (=> b!93329 (= e!60930 e!60926)))

(declare-fun res!47379 () Bool)

(assert (=> b!93329 (= res!47379 (contains!784 call!9231 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (=> b!93329 (=> (not res!47379) (not e!60926))))

(declare-fun c!15539 () Bool)

(declare-fun bm!9222 () Bool)

(declare-fun c!15534 () Bool)

(declare-fun c!15530 () Bool)

(declare-fun lt!46142 () SeekEntryResult!249)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9222 (= call!9228 (inRange!0 (ite c!15531 (ite c!15539 (index!3138 lt!46149) (ite c!15533 (index!3137 lt!46140) (index!3140 lt!46140))) (ite c!15530 (index!3138 lt!46142) (ite c!15534 (index!3137 lt!46156) (index!3140 lt!46156)))) (mask!6495 newMap!16)))))

(declare-fun b!93330 () Bool)

(assert (=> b!93330 (= e!60928 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3138 lt!46142)) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun bm!9223 () Bool)

(declare-fun call!9238 () ListLongMap!1511)

(assert (=> bm!9223 (= call!9222 call!9238)))

(declare-fun bm!9224 () Bool)

(declare-fun c!15536 () Bool)

(declare-fun c!15538 () Bool)

(assert (=> bm!9224 (= call!9234 (+!131 e!60914 (ite c!15538 (ite c!15536 (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 lt!45892) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 lt!45892)) (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892))))))

(declare-fun c!15540 () Bool)

(assert (=> bm!9224 (= c!15540 c!15538)))

(declare-fun b!93331 () Bool)

(assert (=> b!93331 (= e!60913 e!60917)))

(declare-fun res!47380 () Bool)

(assert (=> b!93331 (= res!47380 call!9221)))

(assert (=> b!93331 (=> (not res!47380) (not e!60917))))

(declare-fun b!93332 () Bool)

(declare-fun e!60918 () Unit!2773)

(declare-fun Unit!2784 () Unit!2773)

(assert (=> b!93332 (= e!60918 Unit!2784)))

(declare-fun lt!46155 () Unit!2773)

(assert (=> b!93332 (= lt!46155 call!9233)))

(declare-fun call!9224 () SeekEntryResult!249)

(assert (=> b!93332 (= lt!46156 call!9224)))

(assert (=> b!93332 (= c!15534 ((_ is MissingZero!249) lt!46156))))

(assert (=> b!93332 e!60916))

(declare-fun lt!46143 () Unit!2773)

(assert (=> b!93332 (= lt!46143 lt!46155)))

(assert (=> b!93332 false))

(declare-fun bm!9214 () Bool)

(assert (=> bm!9214 (= call!9217 (map!1234 newMap!16))))

(declare-fun d!24511 () Bool)

(assert (=> d!24511 e!60929))

(declare-fun res!47372 () Bool)

(assert (=> d!24511 (=> (not res!47372) (not e!60929))))

(assert (=> d!24511 (= res!47372 (valid!365 (_2!1159 lt!46136)))))

(assert (=> d!24511 (= lt!46136 e!60911)))

(assert (=> d!24511 (= c!15538 (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (bvneg (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))))

(assert (=> d!24511 (valid!365 newMap!16)))

(assert (=> d!24511 (= (update!131 newMap!16 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892) lt!46136)))

(declare-fun b!93333 () Bool)

(declare-fun e!60920 () tuple2!2296)

(declare-fun lt!46157 () tuple2!2296)

(assert (=> b!93333 (= e!60920 (tuple2!2297 (_1!1159 lt!46157) (_2!1159 lt!46157)))))

(assert (=> b!93333 (= lt!46157 call!9239)))

(declare-fun b!93334 () Bool)

(declare-fun res!47381 () Bool)

(declare-fun e!60910 () Bool)

(assert (=> b!93334 (=> (not res!47381) (not e!60910))))

(assert (=> b!93334 (= res!47381 call!9221)))

(assert (=> b!93334 (= e!60916 e!60910)))

(declare-fun b!93335 () Bool)

(declare-fun e!60921 () Bool)

(assert (=> b!93335 (= e!60921 ((_ is Undefined!249) lt!46140))))

(declare-fun b!93336 () Bool)

(assert (=> b!93336 (= e!60911 e!60927)))

(assert (=> b!93336 (= c!15536 (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93337 () Bool)

(declare-fun lt!46151 () Unit!2773)

(assert (=> b!93337 (= e!60918 lt!46151)))

(assert (=> b!93337 (= lt!46151 call!9230)))

(assert (=> b!93337 (= lt!46142 call!9224)))

(declare-fun res!47373 () Bool)

(assert (=> b!93337 (= res!47373 ((_ is Found!249) lt!46142))))

(assert (=> b!93337 (=> (not res!47373) (not e!60928))))

(assert (=> b!93337 e!60928))

(declare-fun b!93338 () Bool)

(declare-fun res!47382 () Bool)

(assert (=> b!93338 (=> (not res!47382) (not e!60910))))

(assert (=> b!93338 (= res!47382 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3137 lt!46156)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!9225 () SeekEntryResult!249)

(declare-fun bm!9225 () Bool)

(assert (=> bm!9225 (= call!9225 (seekEntryOrOpen!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (_keys!4107 newMap!16) (mask!6495 newMap!16)))))

(declare-fun b!93339 () Bool)

(declare-fun res!47375 () Bool)

(assert (=> b!93339 (= res!47375 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3140 lt!46156)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93339 (=> (not res!47375) (not e!60917))))

(declare-fun bm!9226 () Bool)

(declare-fun call!9229 () ListLongMap!1511)

(declare-fun call!9236 () ListLongMap!1511)

(assert (=> bm!9226 (= call!9229 call!9236)))

(declare-fun bm!9227 () Bool)

(declare-fun call!9220 () ListLongMap!1511)

(assert (=> bm!9227 (= call!9220 call!9238)))

(declare-fun b!93340 () Bool)

(declare-fun c!15537 () Bool)

(assert (=> b!93340 (= c!15537 ((_ is MissingVacant!249) lt!46140))))

(assert (=> b!93340 (= e!60922 e!60921)))

(declare-fun b!93341 () Bool)

(assert (=> b!93341 (= e!60913 ((_ is Undefined!249) lt!46156))))

(declare-fun bm!9228 () Bool)

(assert (=> bm!9228 (= call!9236 (getCurrentListMap!463 (_keys!4107 newMap!16) (ite c!15538 (_values!2408 newMap!16) (array!4176 (store (arr!1986 (_values!2408 newMap!16)) (index!3138 lt!46141) (ValueCellFull!957 lt!45892)) (size!2234 (_values!2408 newMap!16)))) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2425 newMap!16)))))

(declare-fun b!93342 () Bool)

(declare-fun lt!46145 () Unit!2773)

(declare-fun lt!46158 () Unit!2773)

(assert (=> b!93342 (= lt!46145 lt!46158)))

(assert (=> b!93342 (= call!9216 call!9222)))

(declare-fun lt!46148 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 V!3115 Int) Unit!2773)

(assert (=> b!93342 (= lt!46158 (lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) lt!46148 (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) lt!45892 (defaultEntry!2425 newMap!16)))))

(assert (=> b!93342 (= lt!46148 (bvor (extraKeys!2254 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!93342 (= e!60927 (tuple2!2297 true (LongMapFixedSize!823 (defaultEntry!2425 newMap!16) (mask!6495 newMap!16) (bvor (extraKeys!2254 newMap!16) #b00000000000000000000000000000010) (zeroValue!2312 newMap!16) lt!45892 (_size!460 newMap!16) (_keys!4107 newMap!16) (_values!2408 newMap!16) (_vacant!460 newMap!16))))))

(declare-fun b!93343 () Bool)

(assert (=> b!93343 (= e!60921 e!60923)))

(declare-fun res!47384 () Bool)

(assert (=> b!93343 (= res!47384 call!9219)))

(assert (=> b!93343 (=> (not res!47384) (not e!60923))))

(declare-fun bm!9229 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 64) Int) Unit!2773)

(assert (=> bm!9229 (= call!9233 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (defaultEntry!2425 newMap!16)))))

(declare-fun b!93344 () Bool)

(declare-fun lt!46160 () Unit!2773)

(assert (=> b!93344 (= lt!46160 e!60912)))

(declare-fun call!9223 () Bool)

(assert (=> b!93344 (= c!15539 call!9223)))

(assert (=> b!93344 (= e!60919 (tuple2!2297 false newMap!16))))

(declare-fun bm!9230 () Bool)

(declare-fun lt!46139 () array!4175)

(assert (=> bm!9230 (= call!9238 (getCurrentListMap!463 (_keys!4107 newMap!16) (ite (or c!15538 c!15531) (_values!2408 newMap!16) lt!46139) (mask!6495 newMap!16) (ite c!15538 (ite c!15536 lt!46147 lt!46148) (extraKeys!2254 newMap!16)) (ite (and c!15538 c!15536) lt!45892 (zeroValue!2312 newMap!16)) (ite c!15538 (ite c!15536 (minValue!2312 newMap!16) lt!45892) (minValue!2312 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2425 newMap!16)))))

(declare-fun b!93345 () Bool)

(declare-fun res!47385 () Bool)

(assert (=> b!93345 (= res!47385 call!9226)))

(assert (=> b!93345 (=> (not res!47385) (not e!60925))))

(declare-fun bm!9231 () Bool)

(assert (=> bm!9231 (= call!9223 (contains!784 call!9220 (ite c!15531 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) (select (arr!1985 (_keys!4107 newMap!16)) (index!3138 lt!46141)))))))

(declare-fun b!93346 () Bool)

(assert (=> b!93346 (= e!60924 (not call!9232))))

(declare-fun b!93347 () Bool)

(assert (=> b!93347 (= e!60910 (not call!9218))))

(declare-fun b!93348 () Bool)

(assert (=> b!93348 (= e!60930 (= call!9231 call!9217))))

(declare-fun b!93349 () Bool)

(declare-fun lt!46150 () Unit!2773)

(declare-fun lt!46138 () Unit!2773)

(assert (=> b!93349 (= lt!46150 lt!46138)))

(assert (=> b!93349 call!9223))

(declare-fun lemmaValidKeyInArrayIsInListMap!98 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 32) Int) Unit!2773)

(assert (=> b!93349 (= lt!46138 (lemmaValidKeyInArrayIsInListMap!98 (_keys!4107 newMap!16) lt!46139 (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) (index!3138 lt!46141) (defaultEntry!2425 newMap!16)))))

(assert (=> b!93349 (= lt!46139 (array!4176 (store (arr!1986 (_values!2408 newMap!16)) (index!3138 lt!46141) (ValueCellFull!957 lt!45892)) (size!2234 (_values!2408 newMap!16))))))

(declare-fun lt!46144 () Unit!2773)

(declare-fun lt!46159 () Unit!2773)

(assert (=> b!93349 (= lt!46144 lt!46159)))

(assert (=> b!93349 (= call!9234 call!9236)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (array!4173 array!4175 (_ BitVec 32) (_ BitVec 32) V!3115 V!3115 (_ BitVec 32) (_ BitVec 64) V!3115 Int) Unit!2773)

(assert (=> b!93349 (= lt!46159 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) (index!3138 lt!46141) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 (defaultEntry!2425 newMap!16)))))

(declare-fun lt!46152 () Unit!2773)

(assert (=> b!93349 (= lt!46152 e!60918)))

(assert (=> b!93349 (= c!15530 (contains!784 (getCurrentListMap!463 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2425 newMap!16)) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (=> b!93349 (= e!60915 (tuple2!2297 true (LongMapFixedSize!823 (defaultEntry!2425 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) (_size!460 newMap!16) (_keys!4107 newMap!16) (array!4176 (store (arr!1986 (_values!2408 newMap!16)) (index!3138 lt!46141) (ValueCellFull!957 lt!45892)) (size!2234 (_values!2408 newMap!16))) (_vacant!460 newMap!16))))))

(declare-fun b!93350 () Bool)

(assert (=> b!93350 (= e!60920 e!60915)))

(declare-fun c!15535 () Bool)

(assert (=> b!93350 (= c!15535 ((_ is MissingZero!249) lt!46141))))

(declare-fun bm!9232 () Bool)

(assert (=> bm!9232 (= call!9231 (map!1234 (_2!1159 lt!46136)))))

(declare-fun bm!9233 () Bool)

(assert (=> bm!9233 (= call!9237 call!9225)))

(declare-fun bm!9234 () Bool)

(assert (=> bm!9234 (= call!9226 call!9228)))

(declare-fun bm!9235 () Bool)

(assert (=> bm!9235 (= call!9235 (arrayContainsKey!0 (_keys!4107 newMap!16) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!93351 () Bool)

(assert (=> b!93351 (= e!60925 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3138 lt!46149)) (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun b!93352 () Bool)

(declare-fun res!47376 () Bool)

(assert (=> b!93352 (= res!47376 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3140 lt!46140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93352 (=> (not res!47376) (not e!60923))))

(declare-fun bm!9236 () Bool)

(assert (=> bm!9236 (= call!9224 call!9225)))

(declare-fun b!93353 () Bool)

(assert (=> b!93353 (= c!15541 ((_ is MissingVacant!249) lt!46141))))

(assert (=> b!93353 (= e!60919 e!60920)))

(declare-fun b!93354 () Bool)

(assert (=> b!93354 (= e!60914 call!9229)))

(declare-fun b!93355 () Bool)

(declare-fun res!47378 () Bool)

(assert (=> b!93355 (=> (not res!47378) (not e!60924))))

(assert (=> b!93355 (= res!47378 (= (select (arr!1985 (_keys!4107 newMap!16)) (index!3137 lt!46140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!24511 c!15538) b!93336))

(assert (= (and d!24511 (not c!15538)) b!93322))

(assert (= (and b!93336 c!15536) b!93316))

(assert (= (and b!93336 (not c!15536)) b!93342))

(assert (= (or b!93316 b!93342) bm!9223))

(assert (= (or b!93316 b!93342) bm!9226))

(assert (= (or b!93316 b!93342) bm!9221))

(assert (= (and b!93322 c!15531) b!93344))

(assert (= (and b!93322 (not c!15531)) b!93353))

(assert (= (and b!93344 c!15539) b!93321))

(assert (= (and b!93344 (not c!15539)) b!93318))

(assert (= (and b!93321 res!47374) b!93345))

(assert (= (and b!93345 res!47385) b!93351))

(assert (= (and b!93318 c!15533) b!93324))

(assert (= (and b!93318 (not c!15533)) b!93340))

(assert (= (and b!93324 res!47377) b!93355))

(assert (= (and b!93355 res!47378) b!93346))

(assert (= (and b!93340 c!15537) b!93343))

(assert (= (and b!93340 (not c!15537)) b!93335))

(assert (= (and b!93343 res!47384) b!93352))

(assert (= (and b!93352 res!47376) b!93323))

(assert (= (or b!93324 b!93343) bm!9217))

(assert (= (or b!93346 b!93323) bm!9219))

(assert (= (or b!93345 bm!9217) bm!9234))

(assert (= (or b!93321 b!93318) bm!9233))

(assert (= (and b!93353 c!15541) b!93333))

(assert (= (and b!93353 (not c!15541)) b!93350))

(assert (= (and b!93350 c!15535) b!93326))

(assert (= (and b!93350 (not c!15535)) b!93349))

(assert (= (and b!93349 c!15530) b!93337))

(assert (= (and b!93349 (not c!15530)) b!93332))

(assert (= (and b!93337 res!47373) b!93320))

(assert (= (and b!93320 res!47383) b!93330))

(assert (= (and b!93332 c!15534) b!93334))

(assert (= (and b!93332 (not c!15534)) b!93327))

(assert (= (and b!93334 res!47381) b!93338))

(assert (= (and b!93338 res!47382) b!93347))

(assert (= (and b!93327 c!15532) b!93331))

(assert (= (and b!93327 (not c!15532)) b!93341))

(assert (= (and b!93331 res!47380) b!93339))

(assert (= (and b!93339 res!47375) b!93328))

(assert (= (or b!93334 b!93331) bm!9218))

(assert (= (or b!93347 b!93328) bm!9220))

(assert (= (or b!93320 bm!9218) bm!9213))

(assert (= (or b!93337 b!93332) bm!9236))

(assert (= (or b!93333 b!93326) bm!9215))

(assert (= (or bm!9234 bm!9213) bm!9222))

(assert (= (or b!93321 b!93337) bm!9216))

(assert (= (or bm!9233 bm!9236) bm!9225))

(assert (= (or b!93344 b!93349) bm!9227))

(assert (= (or bm!9219 bm!9220) bm!9235))

(assert (= (or b!93318 b!93332) bm!9229))

(assert (= (or b!93344 b!93349) bm!9231))

(assert (= (or bm!9223 bm!9227) bm!9230))

(assert (= (or bm!9226 b!93349) bm!9228))

(assert (= (or bm!9221 b!93349) bm!9224))

(assert (= (and bm!9224 c!15540) b!93354))

(assert (= (and bm!9224 (not c!15540)) b!93325))

(assert (= (and d!24511 res!47372) b!93319))

(assert (= (and b!93319 c!15529) b!93329))

(assert (= (and b!93319 (not c!15529)) b!93348))

(assert (= (and b!93329 res!47379) b!93317))

(assert (= (or b!93317 b!93348) bm!9214))

(assert (= (or b!93329 b!93317 b!93348) bm!9232))

(declare-fun m!100733 () Bool)

(assert (=> b!93342 m!100733))

(assert (=> bm!9216 m!100497))

(declare-fun m!100735 () Bool)

(assert (=> bm!9216 m!100735))

(declare-fun m!100737 () Bool)

(assert (=> bm!9224 m!100737))

(declare-fun m!100739 () Bool)

(assert (=> bm!9232 m!100739))

(assert (=> b!93349 m!100497))

(declare-fun m!100741 () Bool)

(assert (=> b!93349 m!100741))

(declare-fun m!100743 () Bool)

(assert (=> b!93349 m!100743))

(declare-fun m!100745 () Bool)

(assert (=> b!93349 m!100745))

(assert (=> b!93349 m!100497))

(declare-fun m!100747 () Bool)

(assert (=> b!93349 m!100747))

(assert (=> b!93349 m!100745))

(declare-fun m!100749 () Bool)

(assert (=> b!93349 m!100749))

(declare-fun m!100751 () Bool)

(assert (=> b!93317 m!100751))

(assert (=> bm!9228 m!100743))

(declare-fun m!100753 () Bool)

(assert (=> bm!9228 m!100753))

(declare-fun m!100755 () Bool)

(assert (=> b!93339 m!100755))

(assert (=> b!93329 m!100497))

(declare-fun m!100757 () Bool)

(assert (=> b!93329 m!100757))

(declare-fun m!100759 () Bool)

(assert (=> b!93352 m!100759))

(declare-fun m!100761 () Bool)

(assert (=> d!24511 m!100761))

(assert (=> d!24511 m!100533))

(assert (=> bm!9214 m!100521))

(declare-fun m!100763 () Bool)

(assert (=> bm!9230 m!100763))

(declare-fun m!100765 () Bool)

(assert (=> b!93351 m!100765))

(assert (=> b!93325 m!100745))

(declare-fun m!100767 () Bool)

(assert (=> b!93316 m!100767))

(assert (=> bm!9215 m!100497))

(declare-fun m!100769 () Bool)

(assert (=> bm!9215 m!100769))

(declare-fun m!100771 () Bool)

(assert (=> bm!9222 m!100771))

(declare-fun m!100773 () Bool)

(assert (=> b!93355 m!100773))

(declare-fun m!100775 () Bool)

(assert (=> b!93330 m!100775))

(declare-fun m!100777 () Bool)

(assert (=> b!93338 m!100777))

(assert (=> bm!9229 m!100497))

(declare-fun m!100779 () Bool)

(assert (=> bm!9229 m!100779))

(declare-fun m!100781 () Bool)

(assert (=> bm!9231 m!100781))

(declare-fun m!100783 () Bool)

(assert (=> bm!9231 m!100783))

(assert (=> b!93322 m!100497))

(declare-fun m!100785 () Bool)

(assert (=> b!93322 m!100785))

(assert (=> bm!9235 m!100497))

(declare-fun m!100787 () Bool)

(assert (=> bm!9235 m!100787))

(assert (=> bm!9225 m!100497))

(assert (=> bm!9225 m!100785))

(assert (=> b!93050 d!24511))

(declare-fun d!24513 () Bool)

(assert (=> d!24513 (= (array_inv!1231 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvsge (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93069 d!24513))

(declare-fun d!24515 () Bool)

(assert (=> d!24515 (= (array_inv!1232 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvsge (size!2234 (_values!2408 (v!2746 (underlying!322 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93069 d!24515))

(declare-fun d!24517 () Bool)

(assert (=> d!24517 (= (valid!366 thiss!992) (valid!365 (v!2746 (underlying!322 thiss!992))))))

(declare-fun bs!3853 () Bool)

(assert (= bs!3853 d!24517))

(assert (=> bs!3853 m!100519))

(assert (=> start!11272 d!24517))

(declare-fun d!24519 () Bool)

(assert (=> d!24519 (= (+!131 (+!131 lt!45890 (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892)) (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) (+!131 (+!131 lt!45890 (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892)))))

(declare-fun lt!46164 () Unit!2773)

(declare-fun choose!557 (ListLongMap!1511 (_ BitVec 64) V!3115 (_ BitVec 64) V!3115) Unit!2773)

(assert (=> d!24519 (= lt!46164 (choose!557 lt!45890 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(assert (=> d!24519 (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24519 (= (addCommutativeForDiffKeys!50 lt!45890 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) lt!46164)))

(declare-fun bs!3854 () Bool)

(assert (= bs!3854 d!24519))

(declare-fun m!100789 () Bool)

(assert (=> bs!3854 m!100789))

(declare-fun m!100791 () Bool)

(assert (=> bs!3854 m!100791))

(declare-fun m!100793 () Bool)

(assert (=> bs!3854 m!100793))

(assert (=> bs!3854 m!100497))

(declare-fun m!100795 () Bool)

(assert (=> bs!3854 m!100795))

(assert (=> bs!3854 m!100789))

(assert (=> bs!3854 m!100793))

(declare-fun m!100797 () Bool)

(assert (=> bs!3854 m!100797))

(assert (=> b!93051 d!24519))

(declare-fun d!24521 () Bool)

(assert (=> d!24521 (= (map!1234 (_2!1159 lt!45899)) (getCurrentListMap!463 (_keys!4107 (_2!1159 lt!45899)) (_values!2408 (_2!1159 lt!45899)) (mask!6495 (_2!1159 lt!45899)) (extraKeys!2254 (_2!1159 lt!45899)) (zeroValue!2312 (_2!1159 lt!45899)) (minValue!2312 (_2!1159 lt!45899)) #b00000000000000000000000000000000 (defaultEntry!2425 (_2!1159 lt!45899))))))

(declare-fun bs!3855 () Bool)

(assert (= bs!3855 d!24521))

(declare-fun m!100799 () Bool)

(assert (=> bs!3855 m!100799))

(assert (=> b!93051 d!24521))

(declare-fun b!93380 () Bool)

(declare-fun e!60945 () Bool)

(declare-fun e!60947 () Bool)

(assert (=> b!93380 (= e!60945 e!60947)))

(declare-fun c!15553 () Bool)

(assert (=> b!93380 (= c!15553 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93381 () Bool)

(declare-fun lt!46181 () Unit!2773)

(declare-fun lt!46182 () Unit!2773)

(assert (=> b!93381 (= lt!46181 lt!46182)))

(declare-fun lt!46180 () (_ BitVec 64))

(declare-fun lt!46183 () ListLongMap!1511)

(declare-fun lt!46184 () V!3115)

(declare-fun lt!46185 () (_ BitVec 64))

(assert (=> b!93381 (not (contains!784 (+!131 lt!46183 (tuple2!2295 lt!46185 lt!46184)) lt!46180))))

(declare-fun addStillNotContains!37 (ListLongMap!1511 (_ BitVec 64) V!3115 (_ BitVec 64)) Unit!2773)

(assert (=> b!93381 (= lt!46182 (addStillNotContains!37 lt!46183 lt!46185 lt!46184 lt!46180))))

(assert (=> b!93381 (= lt!46180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!93381 (= lt!46184 (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!93381 (= lt!46185 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!9242 () ListLongMap!1511)

(assert (=> b!93381 (= lt!46183 call!9242)))

(declare-fun e!60949 () ListLongMap!1511)

(assert (=> b!93381 (= e!60949 (+!131 call!9242 (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!46179 () ListLongMap!1511)

(declare-fun b!93382 () Bool)

(assert (=> b!93382 (= e!60947 (= lt!46179 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93383 () Bool)

(declare-fun res!47396 () Bool)

(declare-fun e!60946 () Bool)

(assert (=> b!93383 (=> (not res!47396) (not e!60946))))

(assert (=> b!93383 (= res!47396 (not (contains!784 lt!46179 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93384 () Bool)

(assert (=> b!93384 (= e!60946 e!60945)))

(declare-fun c!15551 () Bool)

(declare-fun e!60948 () Bool)

(assert (=> b!93384 (= c!15551 e!60948)))

(declare-fun res!47395 () Bool)

(assert (=> b!93384 (=> (not res!47395) (not e!60948))))

(assert (=> b!93384 (= res!47395 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93385 () Bool)

(assert (=> b!93385 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> b!93385 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2234 (_values!2408 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun e!60950 () Bool)

(declare-fun apply!88 (ListLongMap!1511 (_ BitVec 64)) V!3115)

(assert (=> b!93385 (= e!60950 (= (apply!88 lt!46179 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!24523 () Bool)

(assert (=> d!24523 e!60946))

(declare-fun res!47394 () Bool)

(assert (=> d!24523 (=> (not res!47394) (not e!60946))))

(assert (=> d!24523 (= res!47394 (not (contains!784 lt!46179 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!60951 () ListLongMap!1511)

(assert (=> d!24523 (= lt!46179 e!60951)))

(declare-fun c!15552 () Bool)

(assert (=> d!24523 (= c!15552 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> d!24523 (validMask!0 (mask!6495 (v!2746 (underlying!322 thiss!992))))))

(assert (=> d!24523 (= (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) lt!46179)))

(declare-fun b!93386 () Bool)

(assert (=> b!93386 (= e!60951 (ListLongMap!1512 Nil!1558))))

(declare-fun b!93387 () Bool)

(assert (=> b!93387 (= e!60945 e!60950)))

(assert (=> b!93387 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun res!47397 () Bool)

(assert (=> b!93387 (= res!47397 (contains!784 lt!46179 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93387 (=> (not res!47397) (not e!60950))))

(declare-fun b!93388 () Bool)

(assert (=> b!93388 (= e!60949 call!9242)))

(declare-fun b!93389 () Bool)

(declare-fun isEmpty!349 (ListLongMap!1511) Bool)

(assert (=> b!93389 (= e!60947 (isEmpty!349 lt!46179))))

(declare-fun bm!9239 () Bool)

(assert (=> bm!9239 (= call!9242 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93390 () Bool)

(assert (=> b!93390 (= e!60948 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93390 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!93391 () Bool)

(assert (=> b!93391 (= e!60951 e!60949)))

(declare-fun c!15550 () Bool)

(assert (=> b!93391 (= c!15550 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!24523 c!15552) b!93386))

(assert (= (and d!24523 (not c!15552)) b!93391))

(assert (= (and b!93391 c!15550) b!93381))

(assert (= (and b!93391 (not c!15550)) b!93388))

(assert (= (or b!93381 b!93388) bm!9239))

(assert (= (and d!24523 res!47394) b!93383))

(assert (= (and b!93383 res!47396) b!93384))

(assert (= (and b!93384 res!47395) b!93390))

(assert (= (and b!93384 c!15551) b!93387))

(assert (= (and b!93384 (not c!15551)) b!93380))

(assert (= (and b!93387 res!47397) b!93385))

(assert (= (and b!93380 c!15553) b!93382))

(assert (= (and b!93380 (not c!15553)) b!93389))

(declare-fun b_lambda!4111 () Bool)

(assert (=> (not b_lambda!4111) (not b!93381)))

(assert (=> b!93381 t!5436))

(declare-fun b_and!5687 () Bool)

(assert (= b_and!5683 (and (=> t!5436 result!3147) b_and!5687)))

(assert (=> b!93381 t!5438))

(declare-fun b_and!5689 () Bool)

(assert (= b_and!5685 (and (=> t!5438 result!3151) b_and!5689)))

(declare-fun b_lambda!4113 () Bool)

(assert (=> (not b_lambda!4113) (not b!93385)))

(assert (=> b!93385 t!5436))

(declare-fun b_and!5691 () Bool)

(assert (= b_and!5687 (and (=> t!5436 result!3147) b_and!5691)))

(assert (=> b!93385 t!5438))

(declare-fun b_and!5693 () Bool)

(assert (= b_and!5689 (and (=> t!5438 result!3151) b_and!5693)))

(assert (=> b!93381 m!100529))

(assert (=> b!93381 m!100711))

(declare-fun m!100801 () Bool)

(assert (=> b!93381 m!100801))

(declare-fun m!100803 () Bool)

(assert (=> b!93381 m!100803))

(declare-fun m!100805 () Bool)

(assert (=> b!93381 m!100805))

(declare-fun m!100807 () Bool)

(assert (=> b!93381 m!100807))

(assert (=> b!93381 m!100529))

(declare-fun m!100809 () Bool)

(assert (=> b!93381 m!100809))

(assert (=> b!93381 m!100805))

(declare-fun m!100811 () Bool)

(assert (=> b!93381 m!100811))

(assert (=> b!93381 m!100807))

(declare-fun m!100813 () Bool)

(assert (=> bm!9239 m!100813))

(assert (=> b!93382 m!100813))

(assert (=> b!93391 m!100711))

(assert (=> b!93391 m!100711))

(declare-fun m!100815 () Bool)

(assert (=> b!93391 m!100815))

(declare-fun m!100817 () Bool)

(assert (=> b!93383 m!100817))

(assert (=> b!93390 m!100711))

(assert (=> b!93390 m!100711))

(assert (=> b!93390 m!100815))

(declare-fun m!100819 () Bool)

(assert (=> d!24523 m!100819))

(assert (=> d!24523 m!100717))

(assert (=> b!93387 m!100711))

(assert (=> b!93387 m!100711))

(declare-fun m!100821 () Bool)

(assert (=> b!93387 m!100821))

(assert (=> b!93385 m!100529))

(assert (=> b!93385 m!100711))

(assert (=> b!93385 m!100807))

(assert (=> b!93385 m!100807))

(assert (=> b!93385 m!100529))

(assert (=> b!93385 m!100809))

(assert (=> b!93385 m!100711))

(declare-fun m!100823 () Bool)

(assert (=> b!93385 m!100823))

(declare-fun m!100825 () Bool)

(assert (=> b!93389 m!100825))

(assert (=> b!93051 d!24523))

(declare-fun b!93434 () Bool)

(declare-fun e!60987 () Unit!2773)

(declare-fun Unit!2785 () Unit!2773)

(assert (=> b!93434 (= e!60987 Unit!2785)))

(declare-fun b!93435 () Bool)

(declare-fun e!60979 () Bool)

(assert (=> b!93435 (= e!60979 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun b!93436 () Bool)

(declare-fun e!60985 () Bool)

(declare-fun e!60980 () Bool)

(assert (=> b!93436 (= e!60985 e!60980)))

(declare-fun res!47421 () Bool)

(assert (=> b!93436 (=> (not res!47421) (not e!60980))))

(declare-fun lt!46248 () ListLongMap!1511)

(assert (=> b!93436 (= res!47421 (contains!784 lt!46248 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(assert (=> b!93436 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93437 () Bool)

(declare-fun e!60990 () Bool)

(declare-fun e!60978 () Bool)

(assert (=> b!93437 (= e!60990 e!60978)))

(declare-fun res!47416 () Bool)

(declare-fun call!9257 () Bool)

(assert (=> b!93437 (= res!47416 call!9257)))

(assert (=> b!93437 (=> (not res!47416) (not e!60978))))

(declare-fun bm!9254 () Bool)

(declare-fun call!9259 () ListLongMap!1511)

(declare-fun call!9260 () ListLongMap!1511)

(assert (=> bm!9254 (= call!9259 call!9260)))

(declare-fun b!93439 () Bool)

(declare-fun lt!46234 () Unit!2773)

(assert (=> b!93439 (= e!60987 lt!46234)))

(declare-fun lt!46247 () ListLongMap!1511)

(assert (=> b!93439 (= lt!46247 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46235 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46246 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46246 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))

(declare-fun lt!46245 () Unit!2773)

(declare-fun addStillContains!64 (ListLongMap!1511 (_ BitVec 64) V!3115 (_ BitVec 64)) Unit!2773)

(assert (=> b!93439 (= lt!46245 (addStillContains!64 lt!46247 lt!46235 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46246))))

(assert (=> b!93439 (contains!784 (+!131 lt!46247 (tuple2!2295 lt!46235 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46246)))

(declare-fun lt!46232 () Unit!2773)

(assert (=> b!93439 (= lt!46232 lt!46245)))

(declare-fun lt!46231 () ListLongMap!1511)

(assert (=> b!93439 (= lt!46231 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46249 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46237 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46237 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))

(declare-fun lt!46243 () Unit!2773)

(declare-fun addApplyDifferent!64 (ListLongMap!1511 (_ BitVec 64) V!3115 (_ BitVec 64)) Unit!2773)

(assert (=> b!93439 (= lt!46243 (addApplyDifferent!64 lt!46231 lt!46249 (minValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46237))))

(assert (=> b!93439 (= (apply!88 (+!131 lt!46231 (tuple2!2295 lt!46249 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46237) (apply!88 lt!46231 lt!46237))))

(declare-fun lt!46236 () Unit!2773)

(assert (=> b!93439 (= lt!46236 lt!46243)))

(declare-fun lt!46239 () ListLongMap!1511)

(assert (=> b!93439 (= lt!46239 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46241 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46242 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46242 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))

(declare-fun lt!46250 () Unit!2773)

(assert (=> b!93439 (= lt!46250 (addApplyDifferent!64 lt!46239 lt!46241 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46242))))

(assert (=> b!93439 (= (apply!88 (+!131 lt!46239 (tuple2!2295 lt!46241 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46242) (apply!88 lt!46239 lt!46242))))

(declare-fun lt!46251 () Unit!2773)

(assert (=> b!93439 (= lt!46251 lt!46250)))

(declare-fun lt!46230 () ListLongMap!1511)

(assert (=> b!93439 (= lt!46230 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46238 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46238 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46233 () (_ BitVec 64))

(assert (=> b!93439 (= lt!46233 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355))))

(assert (=> b!93439 (= lt!46234 (addApplyDifferent!64 lt!46230 lt!46238 (minValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46233))))

(assert (=> b!93439 (= (apply!88 (+!131 lt!46230 (tuple2!2295 lt!46238 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46233) (apply!88 lt!46230 lt!46233))))

(declare-fun b!93440 () Bool)

(declare-fun e!60983 () ListLongMap!1511)

(assert (=> b!93440 (= e!60983 call!9259)))

(declare-fun call!9263 () ListLongMap!1511)

(declare-fun bm!9255 () Bool)

(declare-fun c!15569 () Bool)

(declare-fun call!9262 () ListLongMap!1511)

(declare-fun call!9261 () ListLongMap!1511)

(declare-fun c!15567 () Bool)

(assert (=> bm!9255 (= call!9260 (+!131 (ite c!15569 call!9262 (ite c!15567 call!9263 call!9261)) (ite (or c!15569 c!15567) (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun b!93441 () Bool)

(declare-fun e!60986 () ListLongMap!1511)

(assert (=> b!93441 (= e!60986 call!9259)))

(declare-fun b!93442 () Bool)

(declare-fun e!60988 () ListLongMap!1511)

(assert (=> b!93442 (= e!60988 e!60983)))

(assert (=> b!93442 (= c!15567 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93443 () Bool)

(declare-fun res!47424 () Bool)

(declare-fun e!60982 () Bool)

(assert (=> b!93443 (=> (not res!47424) (not e!60982))))

(assert (=> b!93443 (= res!47424 e!60985)))

(declare-fun res!47420 () Bool)

(assert (=> b!93443 (=> res!47420 e!60985)))

(assert (=> b!93443 (= res!47420 (not e!60979))))

(declare-fun res!47423 () Bool)

(assert (=> b!93443 (=> (not res!47423) (not e!60979))))

(assert (=> b!93443 (= res!47423 (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun bm!9256 () Bool)

(assert (=> bm!9256 (= call!9257 (contains!784 lt!46248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9257 () Bool)

(assert (=> bm!9257 (= call!9262 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93444 () Bool)

(declare-fun e!60989 () Bool)

(assert (=> b!93444 (= e!60989 (= (apply!88 lt!46248 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93445 () Bool)

(declare-fun e!60984 () Bool)

(declare-fun call!9258 () Bool)

(assert (=> b!93445 (= e!60984 (not call!9258))))

(declare-fun b!93446 () Bool)

(assert (=> b!93446 (= e!60980 (= (apply!88 lt!46248 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)) (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) from!355) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93446 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2234 (_values!2408 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> b!93446 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93447 () Bool)

(assert (=> b!93447 (= e!60988 (+!131 call!9260 (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun bm!9258 () Bool)

(assert (=> bm!9258 (= call!9258 (contains!784 lt!46248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93448 () Bool)

(declare-fun res!47419 () Bool)

(assert (=> b!93448 (=> (not res!47419) (not e!60982))))

(assert (=> b!93448 (= res!47419 e!60984)))

(declare-fun c!15568 () Bool)

(assert (=> b!93448 (= c!15568 (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9259 () Bool)

(assert (=> bm!9259 (= call!9263 call!9262)))

(declare-fun b!93449 () Bool)

(assert (=> b!93449 (= e!60984 e!60989)))

(declare-fun res!47417 () Bool)

(assert (=> b!93449 (= res!47417 call!9258)))

(assert (=> b!93449 (=> (not res!47417) (not e!60989))))

(declare-fun d!24525 () Bool)

(assert (=> d!24525 e!60982))

(declare-fun res!47418 () Bool)

(assert (=> d!24525 (=> (not res!47418) (not e!60982))))

(assert (=> d!24525 (= res!47418 (or (bvsge from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))))

(declare-fun lt!46240 () ListLongMap!1511)

(assert (=> d!24525 (= lt!46248 lt!46240)))

(declare-fun lt!46244 () Unit!2773)

(assert (=> d!24525 (= lt!46244 e!60987)))

(declare-fun c!15566 () Bool)

(declare-fun e!60981 () Bool)

(assert (=> d!24525 (= c!15566 e!60981)))

(declare-fun res!47422 () Bool)

(assert (=> d!24525 (=> (not res!47422) (not e!60981))))

(assert (=> d!24525 (= res!47422 (bvslt from!355 (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> d!24525 (= lt!46240 e!60988)))

(assert (=> d!24525 (= c!15569 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24525 (validMask!0 (mask!6495 (v!2746 (underlying!322 thiss!992))))))

(assert (=> d!24525 (= (getCurrentListMap!463 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) from!355 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) lt!46248)))

(declare-fun b!93438 () Bool)

(assert (=> b!93438 (= e!60981 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355)))))

(declare-fun b!93450 () Bool)

(assert (=> b!93450 (= e!60978 (= (apply!88 lt!46248 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93451 () Bool)

(declare-fun c!15570 () Bool)

(assert (=> b!93451 (= c!15570 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!93451 (= e!60983 e!60986)))

(declare-fun b!93452 () Bool)

(assert (=> b!93452 (= e!60982 e!60990)))

(declare-fun c!15571 () Bool)

(assert (=> b!93452 (= c!15571 (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93453 () Bool)

(assert (=> b!93453 (= e!60990 (not call!9257))))

(declare-fun b!93454 () Bool)

(assert (=> b!93454 (= e!60986 call!9261)))

(declare-fun bm!9260 () Bool)

(assert (=> bm!9260 (= call!9261 call!9263)))

(assert (= (and d!24525 c!15569) b!93447))

(assert (= (and d!24525 (not c!15569)) b!93442))

(assert (= (and b!93442 c!15567) b!93440))

(assert (= (and b!93442 (not c!15567)) b!93451))

(assert (= (and b!93451 c!15570) b!93441))

(assert (= (and b!93451 (not c!15570)) b!93454))

(assert (= (or b!93441 b!93454) bm!9260))

(assert (= (or b!93440 bm!9260) bm!9259))

(assert (= (or b!93440 b!93441) bm!9254))

(assert (= (or b!93447 bm!9259) bm!9257))

(assert (= (or b!93447 bm!9254) bm!9255))

(assert (= (and d!24525 res!47422) b!93438))

(assert (= (and d!24525 c!15566) b!93439))

(assert (= (and d!24525 (not c!15566)) b!93434))

(assert (= (and d!24525 res!47418) b!93443))

(assert (= (and b!93443 res!47423) b!93435))

(assert (= (and b!93443 (not res!47420)) b!93436))

(assert (= (and b!93436 res!47421) b!93446))

(assert (= (and b!93443 res!47424) b!93448))

(assert (= (and b!93448 c!15568) b!93449))

(assert (= (and b!93448 (not c!15568)) b!93445))

(assert (= (and b!93449 res!47417) b!93444))

(assert (= (or b!93449 b!93445) bm!9258))

(assert (= (and b!93448 res!47419) b!93452))

(assert (= (and b!93452 c!15571) b!93437))

(assert (= (and b!93452 (not c!15571)) b!93453))

(assert (= (and b!93437 res!47416) b!93450))

(assert (= (or b!93437 b!93453) bm!9256))

(declare-fun b_lambda!4115 () Bool)

(assert (=> (not b_lambda!4115) (not b!93446)))

(assert (=> b!93446 t!5436))

(declare-fun b_and!5695 () Bool)

(assert (= b_and!5691 (and (=> t!5436 result!3147) b_and!5695)))

(assert (=> b!93446 t!5438))

(declare-fun b_and!5697 () Bool)

(assert (= b_and!5693 (and (=> t!5438 result!3151) b_and!5697)))

(declare-fun m!100827 () Bool)

(assert (=> b!93444 m!100827))

(declare-fun m!100829 () Bool)

(assert (=> b!93439 m!100829))

(declare-fun m!100831 () Bool)

(assert (=> b!93439 m!100831))

(declare-fun m!100833 () Bool)

(assert (=> b!93439 m!100833))

(declare-fun m!100835 () Bool)

(assert (=> b!93439 m!100835))

(declare-fun m!100837 () Bool)

(assert (=> b!93439 m!100837))

(assert (=> b!93439 m!100829))

(declare-fun m!100839 () Bool)

(assert (=> b!93439 m!100839))

(declare-fun m!100841 () Bool)

(assert (=> b!93439 m!100841))

(declare-fun m!100843 () Bool)

(assert (=> b!93439 m!100843))

(declare-fun m!100845 () Bool)

(assert (=> b!93439 m!100845))

(declare-fun m!100847 () Bool)

(assert (=> b!93439 m!100847))

(declare-fun m!100849 () Bool)

(assert (=> b!93439 m!100849))

(declare-fun m!100851 () Bool)

(assert (=> b!93439 m!100851))

(declare-fun m!100853 () Bool)

(assert (=> b!93439 m!100853))

(assert (=> b!93439 m!100497))

(assert (=> b!93439 m!100843))

(declare-fun m!100855 () Bool)

(assert (=> b!93439 m!100855))

(assert (=> b!93439 m!100851))

(assert (=> b!93439 m!100835))

(declare-fun m!100857 () Bool)

(assert (=> b!93439 m!100857))

(declare-fun m!100859 () Bool)

(assert (=> b!93439 m!100859))

(assert (=> b!93435 m!100497))

(assert (=> b!93435 m!100497))

(assert (=> b!93435 m!100719))

(assert (=> b!93446 m!100527))

(assert (=> b!93446 m!100529))

(assert (=> b!93446 m!100531))

(assert (=> b!93446 m!100527))

(assert (=> b!93446 m!100529))

(assert (=> b!93446 m!100497))

(declare-fun m!100861 () Bool)

(assert (=> b!93446 m!100861))

(assert (=> b!93446 m!100497))

(assert (=> bm!9257 m!100859))

(declare-fun m!100863 () Bool)

(assert (=> bm!9256 m!100863))

(assert (=> d!24525 m!100717))

(declare-fun m!100865 () Bool)

(assert (=> b!93450 m!100865))

(declare-fun m!100867 () Bool)

(assert (=> bm!9255 m!100867))

(declare-fun m!100869 () Bool)

(assert (=> bm!9258 m!100869))

(assert (=> b!93438 m!100497))

(assert (=> b!93438 m!100497))

(assert (=> b!93438 m!100719))

(declare-fun m!100871 () Bool)

(assert (=> b!93447 m!100871))

(assert (=> b!93436 m!100497))

(assert (=> b!93436 m!100497))

(declare-fun m!100873 () Bool)

(assert (=> b!93436 m!100873))

(assert (=> b!93051 d!24525))

(declare-fun d!24527 () Bool)

(declare-fun e!60993 () Bool)

(assert (=> d!24527 e!60993))

(declare-fun res!47429 () Bool)

(assert (=> d!24527 (=> (not res!47429) (not e!60993))))

(declare-fun lt!46261 () ListLongMap!1511)

(assert (=> d!24527 (= res!47429 (contains!784 lt!46261 (_1!1158 lt!45900)))))

(declare-fun lt!46262 () List!1561)

(assert (=> d!24527 (= lt!46261 (ListLongMap!1512 lt!46262))))

(declare-fun lt!46260 () Unit!2773)

(declare-fun lt!46263 () Unit!2773)

(assert (=> d!24527 (= lt!46260 lt!46263)))

(assert (=> d!24527 (= (getValueByKey!146 lt!46262 (_1!1158 lt!45900)) (Some!151 (_2!1158 lt!45900)))))

(declare-fun lemmaContainsTupThenGetReturnValue!63 (List!1561 (_ BitVec 64) V!3115) Unit!2773)

(assert (=> d!24527 (= lt!46263 (lemmaContainsTupThenGetReturnValue!63 lt!46262 (_1!1158 lt!45900) (_2!1158 lt!45900)))))

(declare-fun insertStrictlySorted!66 (List!1561 (_ BitVec 64) V!3115) List!1561)

(assert (=> d!24527 (= lt!46262 (insertStrictlySorted!66 (toList!771 lt!45894) (_1!1158 lt!45900) (_2!1158 lt!45900)))))

(assert (=> d!24527 (= (+!131 lt!45894 lt!45900) lt!46261)))

(declare-fun b!93459 () Bool)

(declare-fun res!47430 () Bool)

(assert (=> b!93459 (=> (not res!47430) (not e!60993))))

(assert (=> b!93459 (= res!47430 (= (getValueByKey!146 (toList!771 lt!46261) (_1!1158 lt!45900)) (Some!151 (_2!1158 lt!45900))))))

(declare-fun b!93460 () Bool)

(declare-fun contains!786 (List!1561 tuple2!2294) Bool)

(assert (=> b!93460 (= e!60993 (contains!786 (toList!771 lt!46261) lt!45900))))

(assert (= (and d!24527 res!47429) b!93459))

(assert (= (and b!93459 res!47430) b!93460))

(declare-fun m!100875 () Bool)

(assert (=> d!24527 m!100875))

(declare-fun m!100877 () Bool)

(assert (=> d!24527 m!100877))

(declare-fun m!100879 () Bool)

(assert (=> d!24527 m!100879))

(declare-fun m!100881 () Bool)

(assert (=> d!24527 m!100881))

(declare-fun m!100883 () Bool)

(assert (=> b!93459 m!100883))

(declare-fun m!100885 () Bool)

(assert (=> b!93460 m!100885))

(assert (=> b!93051 d!24527))

(declare-fun d!24529 () Bool)

(declare-fun e!60994 () Bool)

(assert (=> d!24529 e!60994))

(declare-fun res!47431 () Bool)

(assert (=> d!24529 (=> (not res!47431) (not e!60994))))

(declare-fun lt!46265 () ListLongMap!1511)

(assert (=> d!24529 (= res!47431 (contains!784 lt!46265 (_1!1158 lt!45888)))))

(declare-fun lt!46266 () List!1561)

(assert (=> d!24529 (= lt!46265 (ListLongMap!1512 lt!46266))))

(declare-fun lt!46264 () Unit!2773)

(declare-fun lt!46267 () Unit!2773)

(assert (=> d!24529 (= lt!46264 lt!46267)))

(assert (=> d!24529 (= (getValueByKey!146 lt!46266 (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888)))))

(assert (=> d!24529 (= lt!46267 (lemmaContainsTupThenGetReturnValue!63 lt!46266 (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24529 (= lt!46266 (insertStrictlySorted!66 (toList!771 (+!131 lt!45893 lt!45900)) (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24529 (= (+!131 (+!131 lt!45893 lt!45900) lt!45888) lt!46265)))

(declare-fun b!93461 () Bool)

(declare-fun res!47432 () Bool)

(assert (=> b!93461 (=> (not res!47432) (not e!60994))))

(assert (=> b!93461 (= res!47432 (= (getValueByKey!146 (toList!771 lt!46265) (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888))))))

(declare-fun b!93462 () Bool)

(assert (=> b!93462 (= e!60994 (contains!786 (toList!771 lt!46265) lt!45888))))

(assert (= (and d!24529 res!47431) b!93461))

(assert (= (and b!93461 res!47432) b!93462))

(declare-fun m!100887 () Bool)

(assert (=> d!24529 m!100887))

(declare-fun m!100889 () Bool)

(assert (=> d!24529 m!100889))

(declare-fun m!100891 () Bool)

(assert (=> d!24529 m!100891))

(declare-fun m!100893 () Bool)

(assert (=> d!24529 m!100893))

(declare-fun m!100895 () Bool)

(assert (=> b!93461 m!100895))

(declare-fun m!100897 () Bool)

(assert (=> b!93462 m!100897))

(assert (=> b!93051 d!24529))

(declare-fun d!24531 () Bool)

(assert (=> d!24531 (= (+!131 (+!131 lt!45893 (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892)) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) (+!131 (+!131 lt!45893 (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) (tuple2!2295 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892)))))

(declare-fun lt!46268 () Unit!2773)

(assert (=> d!24531 (= lt!46268 (choose!557 lt!45893 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(assert (=> d!24531 (not (= (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24531 (= (addCommutativeForDiffKeys!50 lt!45893 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) from!355) lt!45892 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))) lt!46268)))

(declare-fun bs!3856 () Bool)

(assert (= bs!3856 d!24531))

(declare-fun m!100899 () Bool)

(assert (=> bs!3856 m!100899))

(declare-fun m!100901 () Bool)

(assert (=> bs!3856 m!100901))

(declare-fun m!100903 () Bool)

(assert (=> bs!3856 m!100903))

(assert (=> bs!3856 m!100497))

(declare-fun m!100905 () Bool)

(assert (=> bs!3856 m!100905))

(assert (=> bs!3856 m!100899))

(assert (=> bs!3856 m!100903))

(declare-fun m!100907 () Bool)

(assert (=> bs!3856 m!100907))

(assert (=> b!93051 d!24531))

(declare-fun d!24533 () Bool)

(declare-fun e!60995 () Bool)

(assert (=> d!24533 e!60995))

(declare-fun res!47433 () Bool)

(assert (=> d!24533 (=> (not res!47433) (not e!60995))))

(declare-fun lt!46270 () ListLongMap!1511)

(assert (=> d!24533 (= res!47433 (contains!784 lt!46270 (_1!1158 lt!45888)))))

(declare-fun lt!46271 () List!1561)

(assert (=> d!24533 (= lt!46270 (ListLongMap!1512 lt!46271))))

(declare-fun lt!46269 () Unit!2773)

(declare-fun lt!46272 () Unit!2773)

(assert (=> d!24533 (= lt!46269 lt!46272)))

(assert (=> d!24533 (= (getValueByKey!146 lt!46271 (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888)))))

(assert (=> d!24533 (= lt!46272 (lemmaContainsTupThenGetReturnValue!63 lt!46271 (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24533 (= lt!46271 (insertStrictlySorted!66 (toList!771 lt!45890) (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24533 (= (+!131 lt!45890 lt!45888) lt!46270)))

(declare-fun b!93463 () Bool)

(declare-fun res!47434 () Bool)

(assert (=> b!93463 (=> (not res!47434) (not e!60995))))

(assert (=> b!93463 (= res!47434 (= (getValueByKey!146 (toList!771 lt!46270) (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888))))))

(declare-fun b!93464 () Bool)

(assert (=> b!93464 (= e!60995 (contains!786 (toList!771 lt!46270) lt!45888))))

(assert (= (and d!24533 res!47433) b!93463))

(assert (= (and b!93463 res!47434) b!93464))

(declare-fun m!100909 () Bool)

(assert (=> d!24533 m!100909))

(declare-fun m!100911 () Bool)

(assert (=> d!24533 m!100911))

(declare-fun m!100913 () Bool)

(assert (=> d!24533 m!100913))

(declare-fun m!100915 () Bool)

(assert (=> d!24533 m!100915))

(declare-fun m!100917 () Bool)

(assert (=> b!93463 m!100917))

(declare-fun m!100919 () Bool)

(assert (=> b!93464 m!100919))

(assert (=> b!93051 d!24533))

(declare-fun d!24535 () Bool)

(declare-fun e!60996 () Bool)

(assert (=> d!24535 e!60996))

(declare-fun res!47435 () Bool)

(assert (=> d!24535 (=> (not res!47435) (not e!60996))))

(declare-fun lt!46274 () ListLongMap!1511)

(assert (=> d!24535 (= res!47435 (contains!784 lt!46274 (_1!1158 lt!45896)))))

(declare-fun lt!46275 () List!1561)

(assert (=> d!24535 (= lt!46274 (ListLongMap!1512 lt!46275))))

(declare-fun lt!46273 () Unit!2773)

(declare-fun lt!46276 () Unit!2773)

(assert (=> d!24535 (= lt!46273 lt!46276)))

(assert (=> d!24535 (= (getValueByKey!146 lt!46275 (_1!1158 lt!45896)) (Some!151 (_2!1158 lt!45896)))))

(assert (=> d!24535 (= lt!46276 (lemmaContainsTupThenGetReturnValue!63 lt!46275 (_1!1158 lt!45896) (_2!1158 lt!45896)))))

(assert (=> d!24535 (= lt!46275 (insertStrictlySorted!66 (toList!771 lt!45903) (_1!1158 lt!45896) (_2!1158 lt!45896)))))

(assert (=> d!24535 (= (+!131 lt!45903 lt!45896) lt!46274)))

(declare-fun b!93465 () Bool)

(declare-fun res!47436 () Bool)

(assert (=> b!93465 (=> (not res!47436) (not e!60996))))

(assert (=> b!93465 (= res!47436 (= (getValueByKey!146 (toList!771 lt!46274) (_1!1158 lt!45896)) (Some!151 (_2!1158 lt!45896))))))

(declare-fun b!93466 () Bool)

(assert (=> b!93466 (= e!60996 (contains!786 (toList!771 lt!46274) lt!45896))))

(assert (= (and d!24535 res!47435) b!93465))

(assert (= (and b!93465 res!47436) b!93466))

(declare-fun m!100921 () Bool)

(assert (=> d!24535 m!100921))

(declare-fun m!100923 () Bool)

(assert (=> d!24535 m!100923))

(declare-fun m!100925 () Bool)

(assert (=> d!24535 m!100925))

(declare-fun m!100927 () Bool)

(assert (=> d!24535 m!100927))

(declare-fun m!100929 () Bool)

(assert (=> b!93465 m!100929))

(declare-fun m!100931 () Bool)

(assert (=> b!93466 m!100931))

(assert (=> b!93051 d!24535))

(declare-fun d!24537 () Bool)

(declare-fun e!60997 () Bool)

(assert (=> d!24537 e!60997))

(declare-fun res!47437 () Bool)

(assert (=> d!24537 (=> (not res!47437) (not e!60997))))

(declare-fun lt!46278 () ListLongMap!1511)

(assert (=> d!24537 (= res!47437 (contains!784 lt!46278 (_1!1158 lt!45900)))))

(declare-fun lt!46279 () List!1561)

(assert (=> d!24537 (= lt!46278 (ListLongMap!1512 lt!46279))))

(declare-fun lt!46277 () Unit!2773)

(declare-fun lt!46280 () Unit!2773)

(assert (=> d!24537 (= lt!46277 lt!46280)))

(assert (=> d!24537 (= (getValueByKey!146 lt!46279 (_1!1158 lt!45900)) (Some!151 (_2!1158 lt!45900)))))

(assert (=> d!24537 (= lt!46280 (lemmaContainsTupThenGetReturnValue!63 lt!46279 (_1!1158 lt!45900) (_2!1158 lt!45900)))))

(assert (=> d!24537 (= lt!46279 (insertStrictlySorted!66 (toList!771 lt!45893) (_1!1158 lt!45900) (_2!1158 lt!45900)))))

(assert (=> d!24537 (= (+!131 lt!45893 lt!45900) lt!46278)))

(declare-fun b!93467 () Bool)

(declare-fun res!47438 () Bool)

(assert (=> b!93467 (=> (not res!47438) (not e!60997))))

(assert (=> b!93467 (= res!47438 (= (getValueByKey!146 (toList!771 lt!46278) (_1!1158 lt!45900)) (Some!151 (_2!1158 lt!45900))))))

(declare-fun b!93468 () Bool)

(assert (=> b!93468 (= e!60997 (contains!786 (toList!771 lt!46278) lt!45900))))

(assert (= (and d!24537 res!47437) b!93467))

(assert (= (and b!93467 res!47438) b!93468))

(declare-fun m!100933 () Bool)

(assert (=> d!24537 m!100933))

(declare-fun m!100935 () Bool)

(assert (=> d!24537 m!100935))

(declare-fun m!100937 () Bool)

(assert (=> d!24537 m!100937))

(declare-fun m!100939 () Bool)

(assert (=> d!24537 m!100939))

(declare-fun m!100941 () Bool)

(assert (=> b!93467 m!100941))

(declare-fun m!100943 () Bool)

(assert (=> b!93468 m!100943))

(assert (=> b!93051 d!24537))

(declare-fun d!24539 () Bool)

(declare-fun e!60998 () Bool)

(assert (=> d!24539 e!60998))

(declare-fun res!47439 () Bool)

(assert (=> d!24539 (=> (not res!47439) (not e!60998))))

(declare-fun lt!46282 () ListLongMap!1511)

(assert (=> d!24539 (= res!47439 (contains!784 lt!46282 (_1!1158 lt!45896)))))

(declare-fun lt!46283 () List!1561)

(assert (=> d!24539 (= lt!46282 (ListLongMap!1512 lt!46283))))

(declare-fun lt!46281 () Unit!2773)

(declare-fun lt!46284 () Unit!2773)

(assert (=> d!24539 (= lt!46281 lt!46284)))

(assert (=> d!24539 (= (getValueByKey!146 lt!46283 (_1!1158 lt!45896)) (Some!151 (_2!1158 lt!45896)))))

(assert (=> d!24539 (= lt!46284 (lemmaContainsTupThenGetReturnValue!63 lt!46283 (_1!1158 lt!45896) (_2!1158 lt!45896)))))

(assert (=> d!24539 (= lt!46283 (insertStrictlySorted!66 (toList!771 lt!45890) (_1!1158 lt!45896) (_2!1158 lt!45896)))))

(assert (=> d!24539 (= (+!131 lt!45890 lt!45896) lt!46282)))

(declare-fun b!93469 () Bool)

(declare-fun res!47440 () Bool)

(assert (=> b!93469 (=> (not res!47440) (not e!60998))))

(assert (=> b!93469 (= res!47440 (= (getValueByKey!146 (toList!771 lt!46282) (_1!1158 lt!45896)) (Some!151 (_2!1158 lt!45896))))))

(declare-fun b!93470 () Bool)

(assert (=> b!93470 (= e!60998 (contains!786 (toList!771 lt!46282) lt!45896))))

(assert (= (and d!24539 res!47439) b!93469))

(assert (= (and b!93469 res!47440) b!93470))

(declare-fun m!100945 () Bool)

(assert (=> d!24539 m!100945))

(declare-fun m!100947 () Bool)

(assert (=> d!24539 m!100947))

(declare-fun m!100949 () Bool)

(assert (=> d!24539 m!100949))

(declare-fun m!100951 () Bool)

(assert (=> d!24539 m!100951))

(declare-fun m!100953 () Bool)

(assert (=> b!93469 m!100953))

(declare-fun m!100955 () Bool)

(assert (=> b!93470 m!100955))

(assert (=> b!93051 d!24539))

(declare-fun d!24541 () Bool)

(declare-fun e!60999 () Bool)

(assert (=> d!24541 e!60999))

(declare-fun res!47441 () Bool)

(assert (=> d!24541 (=> (not res!47441) (not e!60999))))

(declare-fun lt!46286 () ListLongMap!1511)

(assert (=> d!24541 (= res!47441 (contains!784 lt!46286 (_1!1158 lt!45888)))))

(declare-fun lt!46287 () List!1561)

(assert (=> d!24541 (= lt!46286 (ListLongMap!1512 lt!46287))))

(declare-fun lt!46285 () Unit!2773)

(declare-fun lt!46288 () Unit!2773)

(assert (=> d!24541 (= lt!46285 lt!46288)))

(assert (=> d!24541 (= (getValueByKey!146 lt!46287 (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888)))))

(assert (=> d!24541 (= lt!46288 (lemmaContainsTupThenGetReturnValue!63 lt!46287 (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24541 (= lt!46287 (insertStrictlySorted!66 (toList!771 lt!45893) (_1!1158 lt!45888) (_2!1158 lt!45888)))))

(assert (=> d!24541 (= (+!131 lt!45893 lt!45888) lt!46286)))

(declare-fun b!93471 () Bool)

(declare-fun res!47442 () Bool)

(assert (=> b!93471 (=> (not res!47442) (not e!60999))))

(assert (=> b!93471 (= res!47442 (= (getValueByKey!146 (toList!771 lt!46286) (_1!1158 lt!45888)) (Some!151 (_2!1158 lt!45888))))))

(declare-fun b!93472 () Bool)

(assert (=> b!93472 (= e!60999 (contains!786 (toList!771 lt!46286) lt!45888))))

(assert (= (and d!24541 res!47441) b!93471))

(assert (= (and b!93471 res!47442) b!93472))

(declare-fun m!100957 () Bool)

(assert (=> d!24541 m!100957))

(declare-fun m!100959 () Bool)

(assert (=> d!24541 m!100959))

(declare-fun m!100961 () Bool)

(assert (=> d!24541 m!100961))

(declare-fun m!100963 () Bool)

(assert (=> d!24541 m!100963))

(declare-fun m!100965 () Bool)

(assert (=> b!93471 m!100965))

(declare-fun m!100967 () Bool)

(assert (=> b!93472 m!100967))

(assert (=> b!93051 d!24541))

(declare-fun d!24543 () Bool)

(assert (=> d!24543 (= (map!1234 newMap!16) (getCurrentListMap!463 (_keys!4107 newMap!16) (_values!2408 newMap!16) (mask!6495 newMap!16) (extraKeys!2254 newMap!16) (zeroValue!2312 newMap!16) (minValue!2312 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2425 newMap!16)))))

(declare-fun bs!3857 () Bool)

(assert (= bs!3857 d!24543))

(assert (=> bs!3857 m!100745))

(assert (=> b!93048 d!24543))

(declare-fun b!93473 () Bool)

(declare-fun e!61009 () Unit!2773)

(declare-fun Unit!2786 () Unit!2773)

(assert (=> b!93473 (= e!61009 Unit!2786)))

(declare-fun b!93474 () Bool)

(declare-fun e!61001 () Bool)

(assert (=> b!93474 (= e!61001 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93475 () Bool)

(declare-fun e!61007 () Bool)

(declare-fun e!61002 () Bool)

(assert (=> b!93475 (= e!61007 e!61002)))

(declare-fun res!47448 () Bool)

(assert (=> b!93475 (=> (not res!47448) (not e!61002))))

(declare-fun lt!46307 () ListLongMap!1511)

(assert (=> b!93475 (= res!47448 (contains!784 lt!46307 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93475 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93476 () Bool)

(declare-fun e!61012 () Bool)

(declare-fun e!61000 () Bool)

(assert (=> b!93476 (= e!61012 e!61000)))

(declare-fun res!47443 () Bool)

(declare-fun call!9264 () Bool)

(assert (=> b!93476 (= res!47443 call!9264)))

(assert (=> b!93476 (=> (not res!47443) (not e!61000))))

(declare-fun bm!9261 () Bool)

(declare-fun call!9266 () ListLongMap!1511)

(declare-fun call!9267 () ListLongMap!1511)

(assert (=> bm!9261 (= call!9266 call!9267)))

(declare-fun b!93478 () Bool)

(declare-fun lt!46293 () Unit!2773)

(assert (=> b!93478 (= e!61009 lt!46293)))

(declare-fun lt!46306 () ListLongMap!1511)

(assert (=> b!93478 (= lt!46306 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46294 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46305 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46305 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46304 () Unit!2773)

(assert (=> b!93478 (= lt!46304 (addStillContains!64 lt!46306 lt!46294 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46305))))

(assert (=> b!93478 (contains!784 (+!131 lt!46306 (tuple2!2295 lt!46294 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46305)))

(declare-fun lt!46291 () Unit!2773)

(assert (=> b!93478 (= lt!46291 lt!46304)))

(declare-fun lt!46290 () ListLongMap!1511)

(assert (=> b!93478 (= lt!46290 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46308 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46308 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46296 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46296 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46302 () Unit!2773)

(assert (=> b!93478 (= lt!46302 (addApplyDifferent!64 lt!46290 lt!46308 (minValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46296))))

(assert (=> b!93478 (= (apply!88 (+!131 lt!46290 (tuple2!2295 lt!46308 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46296) (apply!88 lt!46290 lt!46296))))

(declare-fun lt!46295 () Unit!2773)

(assert (=> b!93478 (= lt!46295 lt!46302)))

(declare-fun lt!46298 () ListLongMap!1511)

(assert (=> b!93478 (= lt!46298 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46300 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46301 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46301 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46309 () Unit!2773)

(assert (=> b!93478 (= lt!46309 (addApplyDifferent!64 lt!46298 lt!46300 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46301))))

(assert (=> b!93478 (= (apply!88 (+!131 lt!46298 (tuple2!2295 lt!46300 (zeroValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46301) (apply!88 lt!46298 lt!46301))))

(declare-fun lt!46310 () Unit!2773)

(assert (=> b!93478 (= lt!46310 lt!46309)))

(declare-fun lt!46289 () ListLongMap!1511)

(assert (=> b!93478 (= lt!46289 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun lt!46297 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46297 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46292 () (_ BitVec 64))

(assert (=> b!93478 (= lt!46292 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93478 (= lt!46293 (addApplyDifferent!64 lt!46289 lt!46297 (minValue!2312 (v!2746 (underlying!322 thiss!992))) lt!46292))))

(assert (=> b!93478 (= (apply!88 (+!131 lt!46289 (tuple2!2295 lt!46297 (minValue!2312 (v!2746 (underlying!322 thiss!992))))) lt!46292) (apply!88 lt!46289 lt!46292))))

(declare-fun b!93479 () Bool)

(declare-fun e!61005 () ListLongMap!1511)

(assert (=> b!93479 (= e!61005 call!9266)))

(declare-fun call!9270 () ListLongMap!1511)

(declare-fun call!9269 () ListLongMap!1511)

(declare-fun c!15575 () Bool)

(declare-fun call!9268 () ListLongMap!1511)

(declare-fun c!15573 () Bool)

(declare-fun bm!9262 () Bool)

(assert (=> bm!9262 (= call!9267 (+!131 (ite c!15575 call!9269 (ite c!15573 call!9270 call!9268)) (ite (or c!15575 c!15573) (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))))

(declare-fun b!93480 () Bool)

(declare-fun e!61008 () ListLongMap!1511)

(assert (=> b!93480 (= e!61008 call!9266)))

(declare-fun b!93481 () Bool)

(declare-fun e!61010 () ListLongMap!1511)

(assert (=> b!93481 (= e!61010 e!61005)))

(assert (=> b!93481 (= c!15573 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93482 () Bool)

(declare-fun res!47451 () Bool)

(declare-fun e!61004 () Bool)

(assert (=> b!93482 (=> (not res!47451) (not e!61004))))

(assert (=> b!93482 (= res!47451 e!61007)))

(declare-fun res!47447 () Bool)

(assert (=> b!93482 (=> res!47447 e!61007)))

(assert (=> b!93482 (= res!47447 (not e!61001))))

(declare-fun res!47450 () Bool)

(assert (=> b!93482 (=> (not res!47450) (not e!61001))))

(assert (=> b!93482 (= res!47450 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun bm!9263 () Bool)

(assert (=> bm!9263 (= call!9264 (contains!784 lt!46307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9264 () Bool)

(assert (=> bm!9264 (= call!9269 (getCurrentListMapNoExtraKeys!96 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93483 () Bool)

(declare-fun e!61011 () Bool)

(assert (=> b!93483 (= e!61011 (= (apply!88 lt!46307 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93484 () Bool)

(declare-fun e!61006 () Bool)

(declare-fun call!9265 () Bool)

(assert (=> b!93484 (= e!61006 (not call!9265))))

(declare-fun b!93485 () Bool)

(assert (=> b!93485 (= e!61002 (= (apply!88 lt!46307 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1251 (select (arr!1986 (_values!2408 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!359 (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93485 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2234 (_values!2408 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> b!93485 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun b!93486 () Bool)

(assert (=> b!93486 (= e!61010 (+!131 call!9267 (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2312 (v!2746 (underlying!322 thiss!992))))))))

(declare-fun bm!9265 () Bool)

(assert (=> bm!9265 (= call!9265 (contains!784 lt!46307 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93487 () Bool)

(declare-fun res!47446 () Bool)

(assert (=> b!93487 (=> (not res!47446) (not e!61004))))

(assert (=> b!93487 (= res!47446 e!61006)))

(declare-fun c!15574 () Bool)

(assert (=> b!93487 (= c!15574 (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9266 () Bool)

(assert (=> bm!9266 (= call!9270 call!9269)))

(declare-fun b!93488 () Bool)

(assert (=> b!93488 (= e!61006 e!61011)))

(declare-fun res!47444 () Bool)

(assert (=> b!93488 (= res!47444 call!9265)))

(assert (=> b!93488 (=> (not res!47444) (not e!61011))))

(declare-fun d!24545 () Bool)

(assert (=> d!24545 e!61004))

(declare-fun res!47445 () Bool)

(assert (=> d!24545 (=> (not res!47445) (not e!61004))))

(assert (=> d!24545 (= res!47445 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))))

(declare-fun lt!46299 () ListLongMap!1511)

(assert (=> d!24545 (= lt!46307 lt!46299)))

(declare-fun lt!46303 () Unit!2773)

(assert (=> d!24545 (= lt!46303 e!61009)))

(declare-fun c!15572 () Bool)

(declare-fun e!61003 () Bool)

(assert (=> d!24545 (= c!15572 e!61003)))

(declare-fun res!47449 () Bool)

(assert (=> d!24545 (=> (not res!47449) (not e!61003))))

(assert (=> d!24545 (= res!47449 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2233 (_keys!4107 (v!2746 (underlying!322 thiss!992))))))))

(assert (=> d!24545 (= lt!46299 e!61010)))

(assert (=> d!24545 (= c!15575 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24545 (validMask!0 (mask!6495 (v!2746 (underlying!322 thiss!992))))))

(assert (=> d!24545 (= (getCurrentListMap!463 (_keys!4107 (v!2746 (underlying!322 thiss!992))) (_values!2408 (v!2746 (underlying!322 thiss!992))) (mask!6495 (v!2746 (underlying!322 thiss!992))) (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) (zeroValue!2312 (v!2746 (underlying!322 thiss!992))) (minValue!2312 (v!2746 (underlying!322 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992)))) lt!46307)))

(declare-fun b!93477 () Bool)

(assert (=> b!93477 (= e!61003 (validKeyInArray!0 (select (arr!1985 (_keys!4107 (v!2746 (underlying!322 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93489 () Bool)

(assert (=> b!93489 (= e!61000 (= (apply!88 lt!46307 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2312 (v!2746 (underlying!322 thiss!992)))))))

(declare-fun b!93490 () Bool)

(declare-fun c!15576 () Bool)

(assert (=> b!93490 (= c!15576 (and (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!93490 (= e!61005 e!61008)))

(declare-fun b!93491 () Bool)

(assert (=> b!93491 (= e!61004 e!61012)))

(declare-fun c!15577 () Bool)

(assert (=> b!93491 (= c!15577 (not (= (bvand (extraKeys!2254 (v!2746 (underlying!322 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93492 () Bool)

(assert (=> b!93492 (= e!61012 (not call!9264))))

(declare-fun b!93493 () Bool)

(assert (=> b!93493 (= e!61008 call!9268)))

(declare-fun bm!9267 () Bool)

(assert (=> bm!9267 (= call!9268 call!9270)))

(assert (= (and d!24545 c!15575) b!93486))

(assert (= (and d!24545 (not c!15575)) b!93481))

(assert (= (and b!93481 c!15573) b!93479))

(assert (= (and b!93481 (not c!15573)) b!93490))

(assert (= (and b!93490 c!15576) b!93480))

(assert (= (and b!93490 (not c!15576)) b!93493))

(assert (= (or b!93480 b!93493) bm!9267))

(assert (= (or b!93479 bm!9267) bm!9266))

(assert (= (or b!93479 b!93480) bm!9261))

(assert (= (or b!93486 bm!9266) bm!9264))

(assert (= (or b!93486 bm!9261) bm!9262))

(assert (= (and d!24545 res!47449) b!93477))

(assert (= (and d!24545 c!15572) b!93478))

(assert (= (and d!24545 (not c!15572)) b!93473))

(assert (= (and d!24545 res!47445) b!93482))

(assert (= (and b!93482 res!47450) b!93474))

(assert (= (and b!93482 (not res!47447)) b!93475))

(assert (= (and b!93475 res!47448) b!93485))

(assert (= (and b!93482 res!47451) b!93487))

(assert (= (and b!93487 c!15574) b!93488))

(assert (= (and b!93487 (not c!15574)) b!93484))

(assert (= (and b!93488 res!47444) b!93483))

(assert (= (or b!93488 b!93484) bm!9265))

(assert (= (and b!93487 res!47446) b!93491))

(assert (= (and b!93491 c!15577) b!93476))

(assert (= (and b!93491 (not c!15577)) b!93492))

(assert (= (and b!93476 res!47443) b!93489))

(assert (= (or b!93476 b!93492) bm!9263))

(declare-fun b_lambda!4117 () Bool)

(assert (=> (not b_lambda!4117) (not b!93485)))

(assert (=> b!93485 t!5436))

(declare-fun b_and!5699 () Bool)

(assert (= b_and!5695 (and (=> t!5436 result!3147) b_and!5699)))

(assert (=> b!93485 t!5438))

(declare-fun b_and!5701 () Bool)

(assert (= b_and!5697 (and (=> t!5438 result!3151) b_and!5701)))

(declare-fun m!100969 () Bool)

(assert (=> b!93483 m!100969))

(declare-fun m!100971 () Bool)

(assert (=> b!93478 m!100971))

(declare-fun m!100973 () Bool)

(assert (=> b!93478 m!100973))

(declare-fun m!100975 () Bool)

(assert (=> b!93478 m!100975))

(declare-fun m!100977 () Bool)

(assert (=> b!93478 m!100977))

(declare-fun m!100979 () Bool)

(assert (=> b!93478 m!100979))

(assert (=> b!93478 m!100971))

(declare-fun m!100981 () Bool)

(assert (=> b!93478 m!100981))

(declare-fun m!100983 () Bool)

(assert (=> b!93478 m!100983))

(declare-fun m!100985 () Bool)

(assert (=> b!93478 m!100985))

(declare-fun m!100987 () Bool)

(assert (=> b!93478 m!100987))

(declare-fun m!100989 () Bool)

(assert (=> b!93478 m!100989))

(declare-fun m!100991 () Bool)

(assert (=> b!93478 m!100991))

(declare-fun m!100993 () Bool)

(assert (=> b!93478 m!100993))

(declare-fun m!100995 () Bool)

(assert (=> b!93478 m!100995))

(assert (=> b!93478 m!100711))

(assert (=> b!93478 m!100985))

(declare-fun m!100997 () Bool)

(assert (=> b!93478 m!100997))

(assert (=> b!93478 m!100993))

(assert (=> b!93478 m!100977))

(declare-fun m!100999 () Bool)

(assert (=> b!93478 m!100999))

(assert (=> b!93478 m!100559))

(assert (=> b!93474 m!100711))

(assert (=> b!93474 m!100711))

(assert (=> b!93474 m!100815))

(assert (=> b!93485 m!100807))

(assert (=> b!93485 m!100529))

(assert (=> b!93485 m!100809))

(assert (=> b!93485 m!100807))

(assert (=> b!93485 m!100529))

(assert (=> b!93485 m!100711))

(declare-fun m!101001 () Bool)

(assert (=> b!93485 m!101001))

(assert (=> b!93485 m!100711))

(assert (=> bm!9264 m!100559))

(declare-fun m!101003 () Bool)

(assert (=> bm!9263 m!101003))

(assert (=> d!24545 m!100717))

(declare-fun m!101005 () Bool)

(assert (=> b!93489 m!101005))

(declare-fun m!101007 () Bool)

(assert (=> bm!9262 m!101007))

(declare-fun m!101009 () Bool)

(assert (=> bm!9265 m!101009))

(assert (=> b!93477 m!100711))

(assert (=> b!93477 m!100711))

(assert (=> b!93477 m!100815))

(declare-fun m!101011 () Bool)

(assert (=> b!93486 m!101011))

(assert (=> b!93475 m!100711))

(assert (=> b!93475 m!100711))

(declare-fun m!101013 () Bool)

(assert (=> b!93475 m!101013))

(assert (=> b!93048 d!24545))

(declare-fun d!24547 () Bool)

(declare-fun res!47452 () Bool)

(declare-fun e!61013 () Bool)

(assert (=> d!24547 (=> (not res!47452) (not e!61013))))

(assert (=> d!24547 (= res!47452 (simpleValid!64 newMap!16))))

(assert (=> d!24547 (= (valid!365 newMap!16) e!61013)))

(declare-fun b!93494 () Bool)

(declare-fun res!47453 () Bool)

(assert (=> b!93494 (=> (not res!47453) (not e!61013))))

(assert (=> b!93494 (= res!47453 (= (arrayCountValidKeys!0 (_keys!4107 newMap!16) #b00000000000000000000000000000000 (size!2233 (_keys!4107 newMap!16))) (_size!460 newMap!16)))))

(declare-fun b!93495 () Bool)

(declare-fun res!47454 () Bool)

(assert (=> b!93495 (=> (not res!47454) (not e!61013))))

(assert (=> b!93495 (= res!47454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4107 newMap!16) (mask!6495 newMap!16)))))

(declare-fun b!93496 () Bool)

(assert (=> b!93496 (= e!61013 (arrayNoDuplicates!0 (_keys!4107 newMap!16) #b00000000000000000000000000000000 Nil!1559))))

(assert (= (and d!24547 res!47452) b!93494))

(assert (= (and b!93494 res!47453) b!93495))

(assert (= (and b!93495 res!47454) b!93496))

(declare-fun m!101015 () Bool)

(assert (=> d!24547 m!101015))

(declare-fun m!101017 () Bool)

(assert (=> b!93494 m!101017))

(declare-fun m!101019 () Bool)

(assert (=> b!93495 m!101019))

(declare-fun m!101021 () Bool)

(assert (=> b!93496 m!101021))

(assert (=> b!93049 d!24547))

(declare-fun condMapEmpty!3641 () Bool)

(declare-fun mapDefault!3641 () ValueCell!957)

(assert (=> mapNonEmpty!3631 (= condMapEmpty!3641 (= mapRest!3631 ((as const (Array (_ BitVec 32) ValueCell!957)) mapDefault!3641)))))

(declare-fun e!61019 () Bool)

(declare-fun mapRes!3641 () Bool)

(assert (=> mapNonEmpty!3631 (= tp!9367 (and e!61019 mapRes!3641))))

(declare-fun b!93503 () Bool)

(declare-fun e!61018 () Bool)

(assert (=> b!93503 (= e!61018 tp_is_empty!2601)))

(declare-fun mapIsEmpty!3641 () Bool)

(assert (=> mapIsEmpty!3641 mapRes!3641))

(declare-fun mapNonEmpty!3641 () Bool)

(declare-fun tp!9383 () Bool)

(assert (=> mapNonEmpty!3641 (= mapRes!3641 (and tp!9383 e!61018))))

(declare-fun mapRest!3641 () (Array (_ BitVec 32) ValueCell!957))

(declare-fun mapValue!3641 () ValueCell!957)

(declare-fun mapKey!3641 () (_ BitVec 32))

(assert (=> mapNonEmpty!3641 (= mapRest!3631 (store mapRest!3641 mapKey!3641 mapValue!3641))))

(declare-fun b!93504 () Bool)

(assert (=> b!93504 (= e!61019 tp_is_empty!2601)))

(assert (= (and mapNonEmpty!3631 condMapEmpty!3641) mapIsEmpty!3641))

(assert (= (and mapNonEmpty!3631 (not condMapEmpty!3641)) mapNonEmpty!3641))

(assert (= (and mapNonEmpty!3641 ((_ is ValueCellFull!957) mapValue!3641)) b!93503))

(assert (= (and mapNonEmpty!3631 ((_ is ValueCellFull!957) mapDefault!3641)) b!93504))

(declare-fun m!101023 () Bool)

(assert (=> mapNonEmpty!3641 m!101023))

(declare-fun condMapEmpty!3642 () Bool)

(declare-fun mapDefault!3642 () ValueCell!957)

(assert (=> mapNonEmpty!3632 (= condMapEmpty!3642 (= mapRest!3632 ((as const (Array (_ BitVec 32) ValueCell!957)) mapDefault!3642)))))

(declare-fun e!61021 () Bool)

(declare-fun mapRes!3642 () Bool)

(assert (=> mapNonEmpty!3632 (= tp!9368 (and e!61021 mapRes!3642))))

(declare-fun b!93505 () Bool)

(declare-fun e!61020 () Bool)

(assert (=> b!93505 (= e!61020 tp_is_empty!2601)))

(declare-fun mapIsEmpty!3642 () Bool)

(assert (=> mapIsEmpty!3642 mapRes!3642))

(declare-fun mapNonEmpty!3642 () Bool)

(declare-fun tp!9384 () Bool)

(assert (=> mapNonEmpty!3642 (= mapRes!3642 (and tp!9384 e!61020))))

(declare-fun mapValue!3642 () ValueCell!957)

(declare-fun mapRest!3642 () (Array (_ BitVec 32) ValueCell!957))

(declare-fun mapKey!3642 () (_ BitVec 32))

(assert (=> mapNonEmpty!3642 (= mapRest!3632 (store mapRest!3642 mapKey!3642 mapValue!3642))))

(declare-fun b!93506 () Bool)

(assert (=> b!93506 (= e!61021 tp_is_empty!2601)))

(assert (= (and mapNonEmpty!3632 condMapEmpty!3642) mapIsEmpty!3642))

(assert (= (and mapNonEmpty!3632 (not condMapEmpty!3642)) mapNonEmpty!3642))

(assert (= (and mapNonEmpty!3642 ((_ is ValueCellFull!957) mapValue!3642)) b!93505))

(assert (= (and mapNonEmpty!3632 ((_ is ValueCellFull!957) mapDefault!3642)) b!93506))

(declare-fun m!101025 () Bool)

(assert (=> mapNonEmpty!3642 m!101025))

(declare-fun b_lambda!4119 () Bool)

(assert (= b_lambda!4113 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4119)))

(declare-fun b_lambda!4121 () Bool)

(assert (= b_lambda!4115 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4121)))

(declare-fun b_lambda!4123 () Bool)

(assert (= b_lambda!4117 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4123)))

(declare-fun b_lambda!4125 () Bool)

(assert (= b_lambda!4111 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4125)))

(declare-fun b_lambda!4127 () Bool)

(assert (= b_lambda!4109 (or (and b!93069 b_free!2369) (and b!93055 b_free!2371 (= (defaultEntry!2425 newMap!16) (defaultEntry!2425 (v!2746 (underlying!322 thiss!992))))) b_lambda!4127)))

(check-sat (not b_lambda!4127) (not b!93391) (not b!93210) (not d!24501) (not b!93146) (not b!93325) (not b!93387) (not d!24531) (not bm!9158) (not bm!9258) (not bm!9214) (not b_lambda!4107) (not b!93467) (not b!93470) (not bm!9156) (not bm!9152) (not b!93187) (not b!93329) (not b!93197) (not b!93205) (not d!24543) (not b!93389) (not d!24499) (not b!93342) (not d!24525) (not b!93316) (not bm!9264) (not bm!9157) (not b!93460) (not b_lambda!4119) (not b!93477) (not b!93198) (not d!24527) (not b!93466) (not b!93383) (not b!93472) (not b!93225) (not b_lambda!4125) (not d!24535) (not b!93461) b_and!5699 (not b!93233) (not b!93494) (not b!93471) (not bm!9159) (not bm!9228) (not d!24505) (not b!93180) (not b!93485) (not bm!9239) (not bm!9150) (not b!93222) (not b!93495) (not b!93486) (not b!93474) (not bm!9263) (not b!93463) (not bm!9154) (not b!93446) b_and!5701 (not b!93436) (not bm!9215) (not mapNonEmpty!3642) (not b!93147) (not b_next!2371) (not b!93459) (not bm!9231) (not mapNonEmpty!3641) (not b!93381) (not b_lambda!4121) (not b!93475) (not b!93349) (not b!93468) (not b!93465) (not b!93182) (not d!24547) (not b!93235) (not bm!9153) (not b!93438) (not bm!9225) (not d!24539) (not b!93195) (not b!93188) (not b_next!2369) (not b!93317) (not bm!9149) (not b!93496) (not b!93184) (not bm!9164) (not b!93447) (not bm!9229) (not bm!9256) (not d!24521) (not b!93464) (not b!93382) (not d!24529) (not bm!9161) (not b!93435) (not b_lambda!4123) (not d!24487) (not bm!9222) (not d!24533) (not b!93462) (not b!93226) (not bm!9265) (not bm!9155) (not b!93322) (not d!24511) (not b!93469) (not d!24493) (not bm!9160) (not d!24541) (not b!93196) (not bm!9224) (not bm!9257) (not b!93444) (not d!24523) (not bm!9235) (not d!24545) (not b!93148) (not b!93390) (not b!93489) (not b!93199) (not bm!9262) (not d!24537) (not d!24519) (not bm!9255) (not bm!9216) (not b!93483) (not d!24517) (not b!93450) (not d!24497) (not b!93439) (not b!93478) (not bm!9232) (not d!24509) tp_is_empty!2601 (not bm!9230) (not b!93385) (not bm!9151))
(check-sat b_and!5699 b_and!5701 (not b_next!2369) (not b_next!2371))
