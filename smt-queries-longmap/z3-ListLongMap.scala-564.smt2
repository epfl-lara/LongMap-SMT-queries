; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15266 () Bool)

(assert start!15266)

(declare-fun b!147366 () Bool)

(declare-fun b_free!3157 () Bool)

(declare-fun b_next!3157 () Bool)

(assert (=> b!147366 (= b_free!3157 (not b_next!3157))))

(declare-fun tp!11978 () Bool)

(declare-fun b_and!9233 () Bool)

(assert (=> b!147366 (= tp!11978 b_and!9233)))

(declare-fun b!147367 () Bool)

(declare-fun b_free!3159 () Bool)

(declare-fun b_next!3159 () Bool)

(assert (=> b!147367 (= b_free!3159 (not b_next!3159))))

(declare-fun tp!11979 () Bool)

(declare-fun b_and!9235 () Bool)

(assert (=> b!147367 (= tp!11979 b_and!9235)))

(declare-fun b!147364 () Bool)

(declare-fun e!96220 () Bool)

(declare-fun e!96221 () Bool)

(declare-fun mapRes!5062 () Bool)

(assert (=> b!147364 (= e!96220 (and e!96221 mapRes!5062))))

(declare-fun condMapEmpty!5061 () Bool)

(declare-datatypes ((V!3641 0))(
  ( (V!3642 (val!1542 Int)) )
))
(declare-datatypes ((array!5017 0))(
  ( (array!5018 (arr!2368 (Array (_ BitVec 32) (_ BitVec 64))) (size!2645 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1154 0))(
  ( (ValueCellFull!1154 (v!3369 V!3641)) (EmptyCell!1154) )
))
(declare-datatypes ((array!5019 0))(
  ( (array!5020 (arr!2369 (Array (_ BitVec 32) ValueCell!1154)) (size!2646 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1216 0))(
  ( (LongMapFixedSize!1217 (defaultEntry!3027 Int) (mask!7410 (_ BitVec 32)) (extraKeys!2772 (_ BitVec 32)) (zeroValue!2872 V!3641) (minValue!2872 V!3641) (_size!657 (_ BitVec 32)) (_keys!4795 array!5017) (_values!3010 array!5019) (_vacant!657 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1216)

(declare-fun mapDefault!5061 () ValueCell!1154)

(assert (=> b!147364 (= condMapEmpty!5061 (= (arr!2369 (_values!3010 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1154)) mapDefault!5061)))))

(declare-fun b!147365 () Bool)

(declare-fun e!96233 () Bool)

(declare-fun e!96230 () Bool)

(assert (=> b!147365 (= e!96233 e!96230)))

(declare-fun res!69973 () Bool)

(assert (=> b!147365 (=> (not res!69973) (not e!96230))))

(declare-datatypes ((tuple2!2756 0))(
  ( (tuple2!2757 (_1!1389 Bool) (_2!1389 LongMapFixedSize!1216)) )
))
(declare-fun lt!77629 () tuple2!2756)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147365 (= res!69973 (and (_1!1389 lt!77629) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4658 0))(
  ( (Unit!4659) )
))
(declare-fun lt!77633 () Unit!4658)

(declare-fun e!96226 () Unit!4658)

(assert (=> b!147365 (= lt!77633 e!96226)))

(declare-datatypes ((Cell!990 0))(
  ( (Cell!991 (v!3370 LongMapFixedSize!1216)) )
))
(declare-datatypes ((LongMap!990 0))(
  ( (LongMap!991 (underlying!506 Cell!990)) )
))
(declare-fun thiss!992 () LongMap!990)

(declare-datatypes ((tuple2!2758 0))(
  ( (tuple2!2759 (_1!1390 (_ BitVec 64)) (_2!1390 V!3641)) )
))
(declare-datatypes ((List!1788 0))(
  ( (Nil!1785) (Cons!1784 (h!2392 tuple2!2758) (t!6520 List!1788)) )
))
(declare-datatypes ((ListLongMap!1763 0))(
  ( (ListLongMap!1764 (toList!897 List!1788)) )
))
(declare-fun lt!77627 () ListLongMap!1763)

(declare-fun c!27820 () Bool)

(declare-fun contains!945 (ListLongMap!1763 (_ BitVec 64)) Bool)

(assert (=> b!147365 (= c!27820 (contains!945 lt!77627 (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355)))))

(declare-fun lt!77637 () V!3641)

(declare-fun update!230 (LongMapFixedSize!1216 (_ BitVec 64) V!3641) tuple2!2756)

(assert (=> b!147365 (= lt!77629 (update!230 newMap!16 (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) lt!77637))))

(declare-fun tp_is_empty!2995 () Bool)

(declare-fun e!96222 () Bool)

(declare-fun e!96231 () Bool)

(declare-fun array_inv!1517 (array!5017) Bool)

(declare-fun array_inv!1518 (array!5019) Bool)

(assert (=> b!147366 (= e!96222 (and tp!11978 tp_is_empty!2995 (array_inv!1517 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) (array_inv!1518 (_values!3010 (v!3370 (underlying!506 thiss!992)))) e!96231))))

(declare-fun e!96229 () Bool)

(assert (=> b!147367 (= e!96229 (and tp!11979 tp_is_empty!2995 (array_inv!1517 (_keys!4795 newMap!16)) (array_inv!1518 (_values!3010 newMap!16)) e!96220))))

(declare-fun b!147369 () Bool)

(declare-fun e!96232 () Bool)

(declare-fun e!96225 () Bool)

(assert (=> b!147369 (= e!96232 e!96225)))

(declare-fun b!147370 () Bool)

(declare-fun res!69974 () Bool)

(declare-fun e!96235 () Bool)

(assert (=> b!147370 (=> (not res!69974) (not e!96235))))

(declare-fun valid!600 (LongMapFixedSize!1216) Bool)

(assert (=> b!147370 (= res!69974 (valid!600 newMap!16))))

(declare-fun mapNonEmpty!5061 () Bool)

(declare-fun tp!11977 () Bool)

(declare-fun e!96219 () Bool)

(assert (=> mapNonEmpty!5061 (= mapRes!5062 (and tp!11977 e!96219))))

(declare-fun mapKey!5062 () (_ BitVec 32))

(declare-fun mapRest!5062 () (Array (_ BitVec 32) ValueCell!1154))

(declare-fun mapValue!5061 () ValueCell!1154)

(assert (=> mapNonEmpty!5061 (= (arr!2369 (_values!3010 newMap!16)) (store mapRest!5062 mapKey!5062 mapValue!5061))))

(declare-fun mapIsEmpty!5061 () Bool)

(assert (=> mapIsEmpty!5061 mapRes!5062))

(declare-fun mapNonEmpty!5062 () Bool)

(declare-fun mapRes!5061 () Bool)

(declare-fun tp!11980 () Bool)

(declare-fun e!96223 () Bool)

(assert (=> mapNonEmpty!5062 (= mapRes!5061 (and tp!11980 e!96223))))

(declare-fun mapValue!5062 () ValueCell!1154)

(declare-fun mapKey!5061 () (_ BitVec 32))

(declare-fun mapRest!5061 () (Array (_ BitVec 32) ValueCell!1154))

(assert (=> mapNonEmpty!5062 (= (arr!2369 (_values!3010 (v!3370 (underlying!506 thiss!992)))) (store mapRest!5061 mapKey!5061 mapValue!5062))))

(declare-fun b!147371 () Bool)

(declare-fun Unit!4660 () Unit!4658)

(assert (=> b!147371 (= e!96226 Unit!4660)))

(declare-fun lt!77634 () Unit!4658)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!165 (array!5017 array!5019 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 64) (_ BitVec 32) Int) Unit!4658)

(assert (=> b!147371 (= lt!77634 (lemmaListMapContainsThenArrayContainsFrom!165 (_keys!4795 (v!3370 (underlying!506 thiss!992))) (_values!3010 (v!3370 (underlying!506 thiss!992))) (mask!7410 (v!3370 (underlying!506 thiss!992))) (extraKeys!2772 (v!3370 (underlying!506 thiss!992))) (zeroValue!2872 (v!3370 (underlying!506 thiss!992))) (minValue!2872 (v!3370 (underlying!506 thiss!992))) (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3370 (underlying!506 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147371 (arrayContainsKey!0 (_keys!4795 (v!3370 (underlying!506 thiss!992))) (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77635 () Unit!4658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5017 (_ BitVec 32) (_ BitVec 32)) Unit!4658)

(assert (=> b!147371 (= lt!77635 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4795 (v!3370 (underlying!506 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1789 0))(
  ( (Nil!1786) (Cons!1785 (h!2393 (_ BitVec 64)) (t!6521 List!1789)) )
))
(declare-fun arrayNoDuplicates!0 (array!5017 (_ BitVec 32) List!1789) Bool)

(assert (=> b!147371 (arrayNoDuplicates!0 (_keys!4795 (v!3370 (underlying!506 thiss!992))) from!355 Nil!1786)))

(declare-fun lt!77626 () Unit!4658)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5017 (_ BitVec 32) (_ BitVec 64) List!1789) Unit!4658)

(assert (=> b!147371 (= lt!77626 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4795 (v!3370 (underlying!506 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) (Cons!1785 (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) Nil!1786)))))

(assert (=> b!147371 false))

(declare-fun b!147372 () Bool)

(declare-fun e!96228 () Bool)

(assert (=> b!147372 (= e!96231 (and e!96228 mapRes!5061))))

(declare-fun condMapEmpty!5062 () Bool)

(declare-fun mapDefault!5062 () ValueCell!1154)

(assert (=> b!147372 (= condMapEmpty!5062 (= (arr!2369 (_values!3010 (v!3370 (underlying!506 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1154)) mapDefault!5062)))))

(declare-fun b!147373 () Bool)

(declare-fun res!69971 () Bool)

(assert (=> b!147373 (=> (not res!69971) (not e!96235))))

(assert (=> b!147373 (= res!69971 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2645 (_keys!4795 (v!3370 (underlying!506 thiss!992)))))))))

(declare-fun b!147374 () Bool)

(assert (=> b!147374 (= e!96230 (not true))))

(declare-fun lt!77628 () ListLongMap!1763)

(declare-fun lt!77630 () tuple2!2758)

(declare-fun lt!77636 () tuple2!2758)

(declare-fun +!177 (ListLongMap!1763 tuple2!2758) ListLongMap!1763)

(assert (=> b!147374 (= (+!177 (+!177 lt!77628 lt!77630) lt!77636) (+!177 (+!177 lt!77628 lt!77636) lt!77630))))

(assert (=> b!147374 (= lt!77636 (tuple2!2759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2872 (v!3370 (underlying!506 thiss!992)))))))

(assert (=> b!147374 (= lt!77630 (tuple2!2759 (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) lt!77637))))

(declare-fun lt!77631 () Unit!4658)

(declare-fun addCommutativeForDiffKeys!70 (ListLongMap!1763 (_ BitVec 64) V!3641 (_ BitVec 64) V!3641) Unit!4658)

(assert (=> b!147374 (= lt!77631 (addCommutativeForDiffKeys!70 lt!77628 (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) lt!77637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2872 (v!3370 (underlying!506 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!145 (array!5017 array!5019 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 32) Int) ListLongMap!1763)

(assert (=> b!147374 (= lt!77628 (getCurrentListMapNoExtraKeys!145 (_keys!4795 (v!3370 (underlying!506 thiss!992))) (_values!3010 (v!3370 (underlying!506 thiss!992))) (mask!7410 (v!3370 (underlying!506 thiss!992))) (extraKeys!2772 (v!3370 (underlying!506 thiss!992))) (zeroValue!2872 (v!3370 (underlying!506 thiss!992))) (minValue!2872 (v!3370 (underlying!506 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3370 (underlying!506 thiss!992)))))))

(declare-fun b!147375 () Bool)

(declare-fun e!96224 () Bool)

(assert (=> b!147375 (= e!96224 e!96233)))

(declare-fun res!69976 () Bool)

(assert (=> b!147375 (=> (not res!69976) (not e!96233))))

(assert (=> b!147375 (= res!69976 (and (not (= (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2368 (_keys!4795 (v!3370 (underlying!506 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1583 (ValueCell!1154 V!3641) V!3641)

(declare-fun dynLambda!456 (Int (_ BitVec 64)) V!3641)

(assert (=> b!147375 (= lt!77637 (get!1583 (select (arr!2369 (_values!3010 (v!3370 (underlying!506 thiss!992)))) from!355) (dynLambda!456 (defaultEntry!3027 (v!3370 (underlying!506 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5062 () Bool)

(assert (=> mapIsEmpty!5062 mapRes!5061))

(declare-fun b!147376 () Bool)

(assert (=> b!147376 (= e!96235 e!96224)))

(declare-fun res!69970 () Bool)

(assert (=> b!147376 (=> (not res!69970) (not e!96224))))

(declare-fun lt!77632 () ListLongMap!1763)

(assert (=> b!147376 (= res!69970 (= lt!77632 lt!77627))))

(declare-fun map!1465 (LongMapFixedSize!1216) ListLongMap!1763)

(assert (=> b!147376 (= lt!77627 (map!1465 newMap!16))))

(declare-fun getCurrentListMap!553 (array!5017 array!5019 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 32) Int) ListLongMap!1763)

(assert (=> b!147376 (= lt!77632 (getCurrentListMap!553 (_keys!4795 (v!3370 (underlying!506 thiss!992))) (_values!3010 (v!3370 (underlying!506 thiss!992))) (mask!7410 (v!3370 (underlying!506 thiss!992))) (extraKeys!2772 (v!3370 (underlying!506 thiss!992))) (zeroValue!2872 (v!3370 (underlying!506 thiss!992))) (minValue!2872 (v!3370 (underlying!506 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3370 (underlying!506 thiss!992)))))))

(declare-fun b!147377 () Bool)

(declare-fun Unit!4661 () Unit!4658)

(assert (=> b!147377 (= e!96226 Unit!4661)))

(declare-fun b!147378 () Bool)

(declare-fun res!69975 () Bool)

(assert (=> b!147378 (=> (not res!69975) (not e!96235))))

(assert (=> b!147378 (= res!69975 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7410 newMap!16)) (_size!657 (v!3370 (underlying!506 thiss!992)))))))

(declare-fun b!147379 () Bool)

(assert (=> b!147379 (= e!96228 tp_is_empty!2995)))

(declare-fun b!147380 () Bool)

(assert (=> b!147380 (= e!96223 tp_is_empty!2995)))

(declare-fun res!69972 () Bool)

(assert (=> start!15266 (=> (not res!69972) (not e!96235))))

(declare-fun valid!601 (LongMap!990) Bool)

(assert (=> start!15266 (= res!69972 (valid!601 thiss!992))))

(assert (=> start!15266 e!96235))

(assert (=> start!15266 e!96232))

(assert (=> start!15266 true))

(assert (=> start!15266 e!96229))

(declare-fun b!147368 () Bool)

(assert (=> b!147368 (= e!96221 tp_is_empty!2995)))

(declare-fun b!147381 () Bool)

(assert (=> b!147381 (= e!96219 tp_is_empty!2995)))

(declare-fun b!147382 () Bool)

(assert (=> b!147382 (= e!96225 e!96222)))

(assert (= (and start!15266 res!69972) b!147373))

(assert (= (and b!147373 res!69971) b!147370))

(assert (= (and b!147370 res!69974) b!147378))

(assert (= (and b!147378 res!69975) b!147376))

(assert (= (and b!147376 res!69970) b!147375))

(assert (= (and b!147375 res!69976) b!147365))

(assert (= (and b!147365 c!27820) b!147371))

(assert (= (and b!147365 (not c!27820)) b!147377))

(assert (= (and b!147365 res!69973) b!147374))

(assert (= (and b!147372 condMapEmpty!5062) mapIsEmpty!5062))

(assert (= (and b!147372 (not condMapEmpty!5062)) mapNonEmpty!5062))

(get-info :version)

(assert (= (and mapNonEmpty!5062 ((_ is ValueCellFull!1154) mapValue!5062)) b!147380))

(assert (= (and b!147372 ((_ is ValueCellFull!1154) mapDefault!5062)) b!147379))

(assert (= b!147366 b!147372))

(assert (= b!147382 b!147366))

(assert (= b!147369 b!147382))

(assert (= start!15266 b!147369))

(assert (= (and b!147364 condMapEmpty!5061) mapIsEmpty!5061))

(assert (= (and b!147364 (not condMapEmpty!5061)) mapNonEmpty!5061))

(assert (= (and mapNonEmpty!5061 ((_ is ValueCellFull!1154) mapValue!5061)) b!147381))

(assert (= (and b!147364 ((_ is ValueCellFull!1154) mapDefault!5061)) b!147368))

(assert (= b!147367 b!147364))

(assert (= start!15266 b!147367))

(declare-fun b_lambda!6583 () Bool)

(assert (=> (not b_lambda!6583) (not b!147375)))

(declare-fun t!6517 () Bool)

(declare-fun tb!2693 () Bool)

(assert (=> (and b!147366 (= (defaultEntry!3027 (v!3370 (underlying!506 thiss!992))) (defaultEntry!3027 (v!3370 (underlying!506 thiss!992)))) t!6517) tb!2693))

(declare-fun result!4401 () Bool)

(assert (=> tb!2693 (= result!4401 tp_is_empty!2995)))

(assert (=> b!147375 t!6517))

(declare-fun b_and!9237 () Bool)

(assert (= b_and!9233 (and (=> t!6517 result!4401) b_and!9237)))

(declare-fun tb!2695 () Bool)

(declare-fun t!6519 () Bool)

(assert (=> (and b!147367 (= (defaultEntry!3027 newMap!16) (defaultEntry!3027 (v!3370 (underlying!506 thiss!992)))) t!6519) tb!2695))

(declare-fun result!4405 () Bool)

(assert (= result!4405 result!4401))

(assert (=> b!147375 t!6519))

(declare-fun b_and!9239 () Bool)

(assert (= b_and!9235 (and (=> t!6519 result!4405) b_and!9239)))

(declare-fun m!176827 () Bool)

(assert (=> b!147370 m!176827))

(declare-fun m!176829 () Bool)

(assert (=> start!15266 m!176829))

(declare-fun m!176831 () Bool)

(assert (=> mapNonEmpty!5061 m!176831))

(declare-fun m!176833 () Bool)

(assert (=> b!147371 m!176833))

(declare-fun m!176835 () Bool)

(assert (=> b!147371 m!176835))

(declare-fun m!176837 () Bool)

(assert (=> b!147371 m!176837))

(declare-fun m!176839 () Bool)

(assert (=> b!147371 m!176839))

(assert (=> b!147371 m!176837))

(assert (=> b!147371 m!176837))

(declare-fun m!176841 () Bool)

(assert (=> b!147371 m!176841))

(assert (=> b!147371 m!176837))

(declare-fun m!176843 () Bool)

(assert (=> b!147371 m!176843))

(declare-fun m!176845 () Bool)

(assert (=> mapNonEmpty!5062 m!176845))

(assert (=> b!147375 m!176837))

(declare-fun m!176847 () Bool)

(assert (=> b!147375 m!176847))

(declare-fun m!176849 () Bool)

(assert (=> b!147375 m!176849))

(assert (=> b!147375 m!176847))

(assert (=> b!147375 m!176849))

(declare-fun m!176851 () Bool)

(assert (=> b!147375 m!176851))

(declare-fun m!176853 () Bool)

(assert (=> b!147376 m!176853))

(declare-fun m!176855 () Bool)

(assert (=> b!147376 m!176855))

(assert (=> b!147365 m!176837))

(assert (=> b!147365 m!176837))

(declare-fun m!176857 () Bool)

(assert (=> b!147365 m!176857))

(assert (=> b!147365 m!176837))

(declare-fun m!176859 () Bool)

(assert (=> b!147365 m!176859))

(declare-fun m!176861 () Bool)

(assert (=> b!147366 m!176861))

(declare-fun m!176863 () Bool)

(assert (=> b!147366 m!176863))

(declare-fun m!176865 () Bool)

(assert (=> b!147367 m!176865))

(declare-fun m!176867 () Bool)

(assert (=> b!147367 m!176867))

(assert (=> b!147374 m!176837))

(declare-fun m!176869 () Bool)

(assert (=> b!147374 m!176869))

(declare-fun m!176871 () Bool)

(assert (=> b!147374 m!176871))

(declare-fun m!176873 () Bool)

(assert (=> b!147374 m!176873))

(assert (=> b!147374 m!176837))

(assert (=> b!147374 m!176871))

(declare-fun m!176875 () Bool)

(assert (=> b!147374 m!176875))

(declare-fun m!176877 () Bool)

(assert (=> b!147374 m!176877))

(declare-fun m!176879 () Bool)

(assert (=> b!147374 m!176879))

(assert (=> b!147374 m!176875))

(check-sat (not b!147375) (not b!147365) (not start!15266) (not b!147367) (not b!147370) (not mapNonEmpty!5062) (not mapNonEmpty!5061) (not b_next!3159) (not b_lambda!6583) (not b!147374) b_and!9239 (not b!147366) b_and!9237 (not b!147371) (not b!147376) tp_is_empty!2995 (not b_next!3157))
(check-sat b_and!9237 b_and!9239 (not b_next!3157) (not b_next!3159))
