; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12952 () Bool)

(assert start!12952)

(declare-fun b!112823 () Bool)

(declare-fun b_free!2585 () Bool)

(declare-fun b_next!2585 () Bool)

(assert (=> b!112823 (= b_free!2585 (not b_next!2585))))

(declare-fun tp!10107 () Bool)

(declare-fun b_and!6931 () Bool)

(assert (=> b!112823 (= tp!10107 b_and!6931)))

(declare-fun b!112813 () Bool)

(declare-fun b_free!2587 () Bool)

(declare-fun b_next!2587 () Bool)

(assert (=> b!112813 (= b_free!2587 (not b_next!2587))))

(declare-fun tp!10110 () Bool)

(declare-fun b_and!6933 () Bool)

(assert (=> b!112813 (= tp!10110 b_and!6933)))

(declare-fun mapNonEmpty!4049 () Bool)

(declare-fun mapRes!4049 () Bool)

(declare-fun tp!10108 () Bool)

(declare-fun e!73337 () Bool)

(assert (=> mapNonEmpty!4049 (= mapRes!4049 (and tp!10108 e!73337))))

(declare-fun mapKey!4049 () (_ BitVec 32))

(declare-datatypes ((V!3259 0))(
  ( (V!3260 (val!1399 Int)) )
))
(declare-datatypes ((array!4417 0))(
  ( (array!4418 (arr!2093 (Array (_ BitVec 32) (_ BitVec 64))) (size!2352 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1011 0))(
  ( (ValueCellFull!1011 (v!2958 V!3259)) (EmptyCell!1011) )
))
(declare-datatypes ((array!4419 0))(
  ( (array!4420 (arr!2094 (Array (_ BitVec 32) ValueCell!1011)) (size!2353 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!930 0))(
  ( (LongMapFixedSize!931 (defaultEntry!2661 Int) (mask!6845 (_ BitVec 32)) (extraKeys!2452 (_ BitVec 32)) (zeroValue!2529 V!3259) (minValue!2529 V!3259) (_size!514 (_ BitVec 32)) (_keys!4381 array!4417) (_values!2644 array!4419) (_vacant!514 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!930)

(declare-fun mapRest!4049 () (Array (_ BitVec 32) ValueCell!1011))

(declare-fun mapValue!4049 () ValueCell!1011)

(assert (=> mapNonEmpty!4049 (= (arr!2094 (_values!2644 newMap!16)) (store mapRest!4049 mapKey!4049 mapValue!4049))))

(declare-fun b!112803 () Bool)

(declare-fun e!73328 () Bool)

(declare-fun tp_is_empty!2709 () Bool)

(assert (=> b!112803 (= e!73328 tp_is_empty!2709)))

(declare-fun b!112804 () Bool)

(declare-fun res!55633 () Bool)

(declare-fun e!73340 () Bool)

(assert (=> b!112804 (=> res!55633 e!73340)))

(declare-datatypes ((Cell!730 0))(
  ( (Cell!731 (v!2959 LongMapFixedSize!930)) )
))
(declare-datatypes ((LongMap!730 0))(
  ( (LongMap!731 (underlying!376 Cell!730)) )
))
(declare-fun thiss!992 () LongMap!730)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4417 (_ BitVec 32)) Bool)

(assert (=> b!112804 (= res!55633 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112805 () Bool)

(declare-fun e!73336 () Bool)

(assert (=> b!112805 (= e!73336 (not e!73340))))

(declare-fun res!55632 () Bool)

(assert (=> b!112805 (=> res!55632 e!73340)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!112805 (= res!55632 (not (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))))

(declare-datatypes ((tuple2!2454 0))(
  ( (tuple2!2455 (_1!1238 (_ BitVec 64)) (_2!1238 V!3259)) )
))
(declare-datatypes ((List!1639 0))(
  ( (Nil!1636) (Cons!1635 (h!2235 tuple2!2454) (t!5813 List!1639)) )
))
(declare-datatypes ((ListLongMap!1599 0))(
  ( (ListLongMap!1600 (toList!815 List!1639)) )
))
(declare-fun lt!58429 () ListLongMap!1599)

(declare-fun lt!58423 () tuple2!2454)

(declare-fun lt!58422 () tuple2!2454)

(declare-fun +!154 (ListLongMap!1599 tuple2!2454) ListLongMap!1599)

(assert (=> b!112805 (= (+!154 (+!154 lt!58429 lt!58423) lt!58422) (+!154 (+!154 lt!58429 lt!58422) lt!58423))))

(assert (=> b!112805 (= lt!58422 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!58428 () V!3259)

(assert (=> b!112805 (= lt!58423 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))

(declare-datatypes ((Unit!3521 0))(
  ( (Unit!3522) )
))
(declare-fun lt!58420 () Unit!3521)

(declare-fun addCommutativeForDiffKeys!66 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64) V!3259) Unit!3521)

(assert (=> b!112805 (= lt!58420 (addCommutativeForDiffKeys!66 lt!58429 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!120 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) Int) ListLongMap!1599)

(assert (=> b!112805 (= lt!58429 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun res!55626 () Bool)

(declare-fun e!73335 () Bool)

(assert (=> start!12952 (=> (not res!55626) (not e!73335))))

(declare-fun valid!436 (LongMap!730) Bool)

(assert (=> start!12952 (= res!55626 (valid!436 thiss!992))))

(assert (=> start!12952 e!73335))

(declare-fun e!73334 () Bool)

(assert (=> start!12952 e!73334))

(assert (=> start!12952 true))

(declare-fun e!73331 () Bool)

(assert (=> start!12952 e!73331))

(declare-fun b!112806 () Bool)

(declare-fun e!73327 () Bool)

(declare-fun e!73330 () Bool)

(assert (=> b!112806 (= e!73327 e!73330)))

(declare-fun res!55634 () Bool)

(assert (=> b!112806 (=> (not res!55634) (not e!73330))))

(assert (=> b!112806 (= res!55634 (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1361 (ValueCell!1011 V!3259) V!3259)

(declare-fun dynLambda!394 (Int (_ BitVec 64)) V!3259)

(assert (=> b!112806 (= lt!58428 (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112807 () Bool)

(declare-datatypes ((List!1640 0))(
  ( (Nil!1637) (Cons!1636 (h!2236 (_ BitVec 64)) (t!5814 List!1640)) )
))
(declare-fun arrayNoDuplicates!0 (array!4417 (_ BitVec 32) List!1640) Bool)

(assert (=> b!112807 (= e!73340 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1637))))

(declare-fun mapNonEmpty!4050 () Bool)

(declare-fun mapRes!4050 () Bool)

(declare-fun tp!10109 () Bool)

(declare-fun e!73329 () Bool)

(assert (=> mapNonEmpty!4050 (= mapRes!4050 (and tp!10109 e!73329))))

(declare-fun mapValue!4050 () ValueCell!1011)

(declare-fun mapRest!4050 () (Array (_ BitVec 32) ValueCell!1011))

(declare-fun mapKey!4050 () (_ BitVec 32))

(assert (=> mapNonEmpty!4050 (= (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (store mapRest!4050 mapKey!4050 mapValue!4050))))

(declare-fun mapIsEmpty!4049 () Bool)

(assert (=> mapIsEmpty!4049 mapRes!4050))

(declare-fun b!112808 () Bool)

(assert (=> b!112808 (= e!73330 e!73336)))

(declare-fun res!55635 () Bool)

(assert (=> b!112808 (=> (not res!55635) (not e!73336))))

(declare-datatypes ((tuple2!2456 0))(
  ( (tuple2!2457 (_1!1239 Bool) (_2!1239 LongMapFixedSize!930)) )
))
(declare-fun lt!58425 () tuple2!2456)

(assert (=> b!112808 (= res!55635 (and (_1!1239 lt!58425) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!58430 () Unit!3521)

(declare-fun e!73333 () Unit!3521)

(assert (=> b!112808 (= lt!58430 e!73333)))

(declare-fun c!20174 () Bool)

(declare-fun lt!58424 () ListLongMap!1599)

(declare-fun contains!846 (ListLongMap!1599 (_ BitVec 64)) Bool)

(assert (=> b!112808 (= c!20174 (contains!846 lt!58424 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun update!166 (LongMapFixedSize!930 (_ BitVec 64) V!3259) tuple2!2456)

(assert (=> b!112808 (= lt!58425 (update!166 newMap!16 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))

(declare-fun b!112809 () Bool)

(declare-fun res!55629 () Bool)

(assert (=> b!112809 (=> res!55629 e!73340)))

(assert (=> b!112809 (= res!55629 (or (not (= (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6845 (v!2959 (underlying!376 thiss!992)))))) (not (= (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992)))))) (bvslt (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!112810 () Bool)

(declare-fun e!73339 () Bool)

(assert (=> b!112810 (= e!73339 tp_is_empty!2709)))

(declare-fun b!112811 () Bool)

(assert (=> b!112811 (= e!73329 tp_is_empty!2709)))

(declare-fun b!112812 () Bool)

(declare-fun res!55631 () Bool)

(assert (=> b!112812 (=> (not res!55631) (not e!73335))))

(assert (=> b!112812 (= res!55631 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6845 newMap!16)) (_size!514 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun e!73326 () Bool)

(declare-fun array_inv!1317 (array!4417) Bool)

(declare-fun array_inv!1318 (array!4419) Bool)

(assert (=> b!112813 (= e!73331 (and tp!10110 tp_is_empty!2709 (array_inv!1317 (_keys!4381 newMap!16)) (array_inv!1318 (_values!2644 newMap!16)) e!73326))))

(declare-fun b!112814 () Bool)

(assert (=> b!112814 (= e!73337 tp_is_empty!2709)))

(declare-fun b!112815 () Bool)

(declare-fun res!55630 () Bool)

(assert (=> b!112815 (=> (not res!55630) (not e!73335))))

(assert (=> b!112815 (= res!55630 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun b!112816 () Bool)

(declare-fun e!73332 () Bool)

(assert (=> b!112816 (= e!73332 (and e!73339 mapRes!4050))))

(declare-fun condMapEmpty!4050 () Bool)

(declare-fun mapDefault!4050 () ValueCell!1011)

(assert (=> b!112816 (= condMapEmpty!4050 (= (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4050)))))

(declare-fun b!112817 () Bool)

(assert (=> b!112817 (= e!73335 e!73327)))

(declare-fun res!55627 () Bool)

(assert (=> b!112817 (=> (not res!55627) (not e!73327))))

(declare-fun lt!58421 () ListLongMap!1599)

(assert (=> b!112817 (= res!55627 (= lt!58421 lt!58424))))

(declare-fun map!1306 (LongMapFixedSize!930) ListLongMap!1599)

(assert (=> b!112817 (= lt!58424 (map!1306 newMap!16))))

(declare-fun getCurrentListMap!499 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) Int) ListLongMap!1599)

(assert (=> b!112817 (= lt!58421 (getCurrentListMap!499 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112818 () Bool)

(declare-fun Unit!3523 () Unit!3521)

(assert (=> b!112818 (= e!73333 Unit!3523)))

(declare-fun lt!58427 () Unit!3521)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!115 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) (_ BitVec 32) Int) Unit!3521)

(assert (=> b!112818 (= lt!58427 (lemmaListMapContainsThenArrayContainsFrom!115 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!112818 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!58426 () Unit!3521)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4417 (_ BitVec 32) (_ BitVec 32)) Unit!3521)

(assert (=> b!112818 (= lt!58426 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!112818 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1637)))

(declare-fun lt!58419 () Unit!3521)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4417 (_ BitVec 32) (_ BitVec 64) List!1640) Unit!3521)

(assert (=> b!112818 (= lt!58419 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637)))))

(assert (=> b!112818 false))

(declare-fun b!112819 () Bool)

(declare-fun e!73338 () Bool)

(declare-fun e!73325 () Bool)

(assert (=> b!112819 (= e!73338 e!73325)))

(declare-fun b!112820 () Bool)

(assert (=> b!112820 (= e!73334 e!73338)))

(declare-fun b!112821 () Bool)

(declare-fun res!55628 () Bool)

(assert (=> b!112821 (=> (not res!55628) (not e!73335))))

(declare-fun valid!437 (LongMapFixedSize!930) Bool)

(assert (=> b!112821 (= res!55628 (valid!437 newMap!16))))

(declare-fun b!112822 () Bool)

(declare-fun Unit!3524 () Unit!3521)

(assert (=> b!112822 (= e!73333 Unit!3524)))

(declare-fun mapIsEmpty!4050 () Bool)

(assert (=> mapIsEmpty!4050 mapRes!4049))

(assert (=> b!112823 (= e!73325 (and tp!10107 tp_is_empty!2709 (array_inv!1317 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (array_inv!1318 (_values!2644 (v!2959 (underlying!376 thiss!992)))) e!73332))))

(declare-fun b!112824 () Bool)

(assert (=> b!112824 (= e!73326 (and e!73328 mapRes!4049))))

(declare-fun condMapEmpty!4049 () Bool)

(declare-fun mapDefault!4049 () ValueCell!1011)

(assert (=> b!112824 (= condMapEmpty!4049 (= (arr!2094 (_values!2644 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4049)))))

(assert (= (and start!12952 res!55626) b!112815))

(assert (= (and b!112815 res!55630) b!112821))

(assert (= (and b!112821 res!55628) b!112812))

(assert (= (and b!112812 res!55631) b!112817))

(assert (= (and b!112817 res!55627) b!112806))

(assert (= (and b!112806 res!55634) b!112808))

(assert (= (and b!112808 c!20174) b!112818))

(assert (= (and b!112808 (not c!20174)) b!112822))

(assert (= (and b!112808 res!55635) b!112805))

(assert (= (and b!112805 (not res!55632)) b!112809))

(assert (= (and b!112809 (not res!55629)) b!112804))

(assert (= (and b!112804 (not res!55633)) b!112807))

(assert (= (and b!112816 condMapEmpty!4050) mapIsEmpty!4049))

(assert (= (and b!112816 (not condMapEmpty!4050)) mapNonEmpty!4050))

(get-info :version)

(assert (= (and mapNonEmpty!4050 ((_ is ValueCellFull!1011) mapValue!4050)) b!112811))

(assert (= (and b!112816 ((_ is ValueCellFull!1011) mapDefault!4050)) b!112810))

(assert (= b!112823 b!112816))

(assert (= b!112819 b!112823))

(assert (= b!112820 b!112819))

(assert (= start!12952 b!112820))

(assert (= (and b!112824 condMapEmpty!4049) mapIsEmpty!4050))

(assert (= (and b!112824 (not condMapEmpty!4049)) mapNonEmpty!4049))

(assert (= (and mapNonEmpty!4049 ((_ is ValueCellFull!1011) mapValue!4049)) b!112814))

(assert (= (and b!112824 ((_ is ValueCellFull!1011) mapDefault!4049)) b!112803))

(assert (= b!112813 b!112824))

(assert (= start!12952 b!112813))

(declare-fun b_lambda!5055 () Bool)

(assert (=> (not b_lambda!5055) (not b!112806)))

(declare-fun t!5810 () Bool)

(declare-fun tb!2137 () Bool)

(assert (=> (and b!112823 (= (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) t!5810) tb!2137))

(declare-fun result!3575 () Bool)

(assert (=> tb!2137 (= result!3575 tp_is_empty!2709)))

(assert (=> b!112806 t!5810))

(declare-fun b_and!6935 () Bool)

(assert (= b_and!6931 (and (=> t!5810 result!3575) b_and!6935)))

(declare-fun tb!2139 () Bool)

(declare-fun t!5812 () Bool)

(assert (=> (and b!112813 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) t!5812) tb!2139))

(declare-fun result!3579 () Bool)

(assert (= result!3579 result!3575))

(assert (=> b!112806 t!5812))

(declare-fun b_and!6937 () Bool)

(assert (= b_and!6933 (and (=> t!5812 result!3579) b_and!6937)))

(declare-fun m!128911 () Bool)

(assert (=> mapNonEmpty!4050 m!128911))

(declare-fun m!128913 () Bool)

(assert (=> b!112804 m!128913))

(declare-fun m!128915 () Bool)

(assert (=> b!112808 m!128915))

(assert (=> b!112808 m!128915))

(declare-fun m!128917 () Bool)

(assert (=> b!112808 m!128917))

(assert (=> b!112808 m!128915))

(declare-fun m!128919 () Bool)

(assert (=> b!112808 m!128919))

(declare-fun m!128921 () Bool)

(assert (=> b!112818 m!128921))

(declare-fun m!128923 () Bool)

(assert (=> b!112818 m!128923))

(assert (=> b!112818 m!128915))

(declare-fun m!128925 () Bool)

(assert (=> b!112818 m!128925))

(assert (=> b!112818 m!128915))

(assert (=> b!112818 m!128915))

(declare-fun m!128927 () Bool)

(assert (=> b!112818 m!128927))

(assert (=> b!112818 m!128915))

(declare-fun m!128929 () Bool)

(assert (=> b!112818 m!128929))

(declare-fun m!128931 () Bool)

(assert (=> b!112817 m!128931))

(declare-fun m!128933 () Bool)

(assert (=> b!112817 m!128933))

(declare-fun m!128935 () Bool)

(assert (=> b!112807 m!128935))

(declare-fun m!128937 () Bool)

(assert (=> b!112821 m!128937))

(declare-fun m!128939 () Bool)

(assert (=> mapNonEmpty!4049 m!128939))

(declare-fun m!128941 () Bool)

(assert (=> b!112813 m!128941))

(declare-fun m!128943 () Bool)

(assert (=> b!112813 m!128943))

(declare-fun m!128945 () Bool)

(assert (=> b!112805 m!128945))

(declare-fun m!128947 () Bool)

(assert (=> b!112805 m!128947))

(declare-fun m!128949 () Bool)

(assert (=> b!112805 m!128949))

(declare-fun m!128951 () Bool)

(assert (=> b!112805 m!128951))

(declare-fun m!128953 () Bool)

(assert (=> b!112805 m!128953))

(assert (=> b!112805 m!128915))

(assert (=> b!112805 m!128949))

(declare-fun m!128955 () Bool)

(assert (=> b!112805 m!128955))

(assert (=> b!112805 m!128945))

(assert (=> b!112805 m!128915))

(declare-fun m!128957 () Bool)

(assert (=> b!112805 m!128957))

(declare-fun m!128959 () Bool)

(assert (=> start!12952 m!128959))

(declare-fun m!128961 () Bool)

(assert (=> b!112823 m!128961))

(declare-fun m!128963 () Bool)

(assert (=> b!112823 m!128963))

(assert (=> b!112806 m!128915))

(declare-fun m!128965 () Bool)

(assert (=> b!112806 m!128965))

(declare-fun m!128967 () Bool)

(assert (=> b!112806 m!128967))

(assert (=> b!112806 m!128965))

(assert (=> b!112806 m!128967))

(declare-fun m!128969 () Bool)

(assert (=> b!112806 m!128969))

(check-sat b_and!6935 (not start!12952) tp_is_empty!2709 (not b!112817) (not b!112807) (not b_next!2585) b_and!6937 (not b_lambda!5055) (not b_next!2587) (not mapNonEmpty!4050) (not mapNonEmpty!4049) (not b!112805) (not b!112818) (not b!112813) (not b!112823) (not b!112821) (not b!112808) (not b!112804) (not b!112806))
(check-sat b_and!6935 b_and!6937 (not b_next!2585) (not b_next!2587))
(get-model)

(declare-fun b_lambda!5059 () Bool)

(assert (= b_lambda!5055 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5059)))

(check-sat b_and!6935 (not start!12952) (not b_next!2587) tp_is_empty!2709 (not b!112817) (not b!112807) (not b_next!2585) (not b_lambda!5059) b_and!6937 (not mapNonEmpty!4050) (not mapNonEmpty!4049) (not b!112805) (not b!112818) (not b!112813) (not b!112823) (not b!112821) (not b!112808) (not b!112804) (not b!112806))
(check-sat b_and!6935 b_and!6937 (not b_next!2585) (not b_next!2587))
(get-model)

(declare-fun d!32101 () Bool)

(assert (=> d!32101 (= (valid!436 thiss!992) (valid!437 (v!2959 (underlying!376 thiss!992))))))

(declare-fun bs!4642 () Bool)

(assert (= bs!4642 d!32101))

(declare-fun m!129031 () Bool)

(assert (=> bs!4642 m!129031))

(assert (=> start!12952 d!32101))

(declare-fun b!112919 () Bool)

(declare-fun e!73415 () ListLongMap!1599)

(assert (=> b!112919 (= e!73415 (ListLongMap!1600 Nil!1636))))

(declare-fun d!32103 () Bool)

(declare-fun e!73414 () Bool)

(assert (=> d!32103 e!73414))

(declare-fun res!55675 () Bool)

(assert (=> d!32103 (=> (not res!55675) (not e!73414))))

(declare-fun lt!58487 () ListLongMap!1599)

(assert (=> d!32103 (= res!55675 (not (contains!846 lt!58487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32103 (= lt!58487 e!73415)))

(declare-fun c!20189 () Bool)

(assert (=> d!32103 (= c!20189 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32103 (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32103 (= (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) lt!58487)))

(declare-fun b!112920 () Bool)

(declare-fun e!73410 () Bool)

(declare-fun isEmpty!382 (ListLongMap!1599) Bool)

(assert (=> b!112920 (= e!73410 (isEmpty!382 lt!58487))))

(declare-fun b!112921 () Bool)

(declare-fun e!73411 () ListLongMap!1599)

(assert (=> b!112921 (= e!73415 e!73411)))

(declare-fun c!20186 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!112921 (= c!20186 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112922 () Bool)

(assert (=> b!112922 (= e!73410 (= lt!58487 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112923 () Bool)

(declare-fun e!73413 () Bool)

(assert (=> b!112923 (= e!73413 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112923 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!112924 () Bool)

(declare-fun call!12105 () ListLongMap!1599)

(assert (=> b!112924 (= e!73411 call!12105)))

(declare-fun b!112925 () Bool)

(declare-fun lt!58481 () Unit!3521)

(declare-fun lt!58484 () Unit!3521)

(assert (=> b!112925 (= lt!58481 lt!58484)))

(declare-fun lt!58483 () ListLongMap!1599)

(declare-fun lt!58485 () (_ BitVec 64))

(declare-fun lt!58486 () V!3259)

(declare-fun lt!58482 () (_ BitVec 64))

(assert (=> b!112925 (not (contains!846 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486)) lt!58482))))

(declare-fun addStillNotContains!50 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> b!112925 (= lt!58484 (addStillNotContains!50 lt!58483 lt!58485 lt!58486 lt!58482))))

(assert (=> b!112925 (= lt!58482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112925 (= lt!58486 (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112925 (= lt!58485 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!112925 (= lt!58483 call!12105)))

(assert (=> b!112925 (= e!73411 (+!154 call!12105 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!112926 () Bool)

(assert (=> b!112926 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!112926 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun e!73412 () Bool)

(declare-fun apply!102 (ListLongMap!1599 (_ BitVec 64)) V!3259)

(assert (=> b!112926 (= e!73412 (= (apply!102 lt!58487 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112927 () Bool)

(declare-fun e!73409 () Bool)

(assert (=> b!112927 (= e!73409 e!73410)))

(declare-fun c!20187 () Bool)

(assert (=> b!112927 (= c!20187 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112928 () Bool)

(assert (=> b!112928 (= e!73414 e!73409)))

(declare-fun c!20188 () Bool)

(assert (=> b!112928 (= c!20188 e!73413)))

(declare-fun res!55674 () Bool)

(assert (=> b!112928 (=> (not res!55674) (not e!73413))))

(assert (=> b!112928 (= res!55674 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112929 () Bool)

(assert (=> b!112929 (= e!73409 e!73412)))

(assert (=> b!112929 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun res!55676 () Bool)

(assert (=> b!112929 (= res!55676 (contains!846 lt!58487 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112929 (=> (not res!55676) (not e!73412))))

(declare-fun b!112930 () Bool)

(declare-fun res!55677 () Bool)

(assert (=> b!112930 (=> (not res!55677) (not e!73414))))

(assert (=> b!112930 (= res!55677 (not (contains!846 lt!58487 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!12102 () Bool)

(assert (=> bm!12102 (= call!12105 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32103 c!20189) b!112919))

(assert (= (and d!32103 (not c!20189)) b!112921))

(assert (= (and b!112921 c!20186) b!112925))

(assert (= (and b!112921 (not c!20186)) b!112924))

(assert (= (or b!112925 b!112924) bm!12102))

(assert (= (and d!32103 res!55675) b!112930))

(assert (= (and b!112930 res!55677) b!112928))

(assert (= (and b!112928 res!55674) b!112923))

(assert (= (and b!112928 c!20188) b!112929))

(assert (= (and b!112928 (not c!20188)) b!112927))

(assert (= (and b!112929 res!55676) b!112926))

(assert (= (and b!112927 c!20187) b!112922))

(assert (= (and b!112927 (not c!20187)) b!112920))

(declare-fun b_lambda!5061 () Bool)

(assert (=> (not b_lambda!5061) (not b!112925)))

(assert (=> b!112925 t!5810))

(declare-fun b_and!6947 () Bool)

(assert (= b_and!6935 (and (=> t!5810 result!3575) b_and!6947)))

(assert (=> b!112925 t!5812))

(declare-fun b_and!6949 () Bool)

(assert (= b_and!6937 (and (=> t!5812 result!3579) b_and!6949)))

(declare-fun b_lambda!5063 () Bool)

(assert (=> (not b_lambda!5063) (not b!112926)))

(assert (=> b!112926 t!5810))

(declare-fun b_and!6951 () Bool)

(assert (= b_and!6947 (and (=> t!5810 result!3575) b_and!6951)))

(assert (=> b!112926 t!5812))

(declare-fun b_and!6953 () Bool)

(assert (= b_and!6949 (and (=> t!5812 result!3579) b_and!6953)))

(declare-fun m!129033 () Bool)

(assert (=> b!112930 m!129033))

(declare-fun m!129035 () Bool)

(assert (=> b!112920 m!129035))

(declare-fun m!129037 () Bool)

(assert (=> b!112925 m!129037))

(assert (=> b!112925 m!128967))

(declare-fun m!129039 () Bool)

(assert (=> b!112925 m!129039))

(declare-fun m!129041 () Bool)

(assert (=> b!112925 m!129041))

(declare-fun m!129043 () Bool)

(assert (=> b!112925 m!129043))

(assert (=> b!112925 m!129043))

(declare-fun m!129045 () Bool)

(assert (=> b!112925 m!129045))

(declare-fun m!129047 () Bool)

(assert (=> b!112925 m!129047))

(declare-fun m!129049 () Bool)

(assert (=> b!112925 m!129049))

(assert (=> b!112925 m!129037))

(assert (=> b!112925 m!128967))

(assert (=> b!112929 m!129047))

(assert (=> b!112929 m!129047))

(declare-fun m!129051 () Bool)

(assert (=> b!112929 m!129051))

(assert (=> b!112923 m!129047))

(assert (=> b!112923 m!129047))

(declare-fun m!129053 () Bool)

(assert (=> b!112923 m!129053))

(declare-fun m!129055 () Bool)

(assert (=> bm!12102 m!129055))

(assert (=> b!112926 m!129037))

(assert (=> b!112926 m!128967))

(assert (=> b!112926 m!129039))

(assert (=> b!112926 m!129047))

(declare-fun m!129057 () Bool)

(assert (=> b!112926 m!129057))

(assert (=> b!112926 m!129047))

(assert (=> b!112926 m!129037))

(assert (=> b!112926 m!128967))

(assert (=> b!112922 m!129055))

(assert (=> b!112921 m!129047))

(assert (=> b!112921 m!129047))

(assert (=> b!112921 m!129053))

(declare-fun m!129059 () Bool)

(assert (=> d!32103 m!129059))

(assert (=> d!32103 m!128953))

(assert (=> b!112805 d!32103))

(declare-fun d!32105 () Bool)

(declare-fun e!73418 () Bool)

(assert (=> d!32105 e!73418))

(declare-fun res!55683 () Bool)

(assert (=> d!32105 (=> (not res!55683) (not e!73418))))

(declare-fun lt!58497 () ListLongMap!1599)

(assert (=> d!32105 (= res!55683 (contains!846 lt!58497 (_1!1238 lt!58422)))))

(declare-fun lt!58498 () List!1639)

(assert (=> d!32105 (= lt!58497 (ListLongMap!1600 lt!58498))))

(declare-fun lt!58496 () Unit!3521)

(declare-fun lt!58499 () Unit!3521)

(assert (=> d!32105 (= lt!58496 lt!58499)))

(declare-datatypes ((Option!166 0))(
  ( (Some!165 (v!2963 V!3259)) (None!164) )
))
(declare-fun getValueByKey!160 (List!1639 (_ BitVec 64)) Option!166)

(assert (=> d!32105 (= (getValueByKey!160 lt!58498 (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422)))))

(declare-fun lemmaContainsTupThenGetReturnValue!76 (List!1639 (_ BitVec 64) V!3259) Unit!3521)

(assert (=> d!32105 (= lt!58499 (lemmaContainsTupThenGetReturnValue!76 lt!58498 (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(declare-fun insertStrictlySorted!79 (List!1639 (_ BitVec 64) V!3259) List!1639)

(assert (=> d!32105 (= lt!58498 (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 lt!58423)) (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(assert (=> d!32105 (= (+!154 (+!154 lt!58429 lt!58423) lt!58422) lt!58497)))

(declare-fun b!112935 () Bool)

(declare-fun res!55682 () Bool)

(assert (=> b!112935 (=> (not res!55682) (not e!73418))))

(assert (=> b!112935 (= res!55682 (= (getValueByKey!160 (toList!815 lt!58497) (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422))))))

(declare-fun b!112936 () Bool)

(declare-fun contains!847 (List!1639 tuple2!2454) Bool)

(assert (=> b!112936 (= e!73418 (contains!847 (toList!815 lt!58497) lt!58422))))

(assert (= (and d!32105 res!55683) b!112935))

(assert (= (and b!112935 res!55682) b!112936))

(declare-fun m!129061 () Bool)

(assert (=> d!32105 m!129061))

(declare-fun m!129063 () Bool)

(assert (=> d!32105 m!129063))

(declare-fun m!129065 () Bool)

(assert (=> d!32105 m!129065))

(declare-fun m!129067 () Bool)

(assert (=> d!32105 m!129067))

(declare-fun m!129069 () Bool)

(assert (=> b!112935 m!129069))

(declare-fun m!129071 () Bool)

(assert (=> b!112936 m!129071))

(assert (=> b!112805 d!32105))

(declare-fun d!32107 () Bool)

(assert (=> d!32107 (= (+!154 (+!154 lt!58429 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (+!154 (+!154 lt!58429 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))

(declare-fun lt!58502 () Unit!3521)

(declare-fun choose!710 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64) V!3259) Unit!3521)

(assert (=> d!32107 (= lt!58502 (choose!710 lt!58429 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32107 (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32107 (= (addCommutativeForDiffKeys!66 lt!58429 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) lt!58502)))

(declare-fun bs!4643 () Bool)

(assert (= bs!4643 d!32107))

(assert (=> bs!4643 m!128915))

(declare-fun m!129073 () Bool)

(assert (=> bs!4643 m!129073))

(declare-fun m!129075 () Bool)

(assert (=> bs!4643 m!129075))

(declare-fun m!129077 () Bool)

(assert (=> bs!4643 m!129077))

(declare-fun m!129079 () Bool)

(assert (=> bs!4643 m!129079))

(declare-fun m!129081 () Bool)

(assert (=> bs!4643 m!129081))

(assert (=> bs!4643 m!129075))

(assert (=> bs!4643 m!129079))

(assert (=> b!112805 d!32107))

(declare-fun d!32109 () Bool)

(declare-fun e!73419 () Bool)

(assert (=> d!32109 e!73419))

(declare-fun res!55685 () Bool)

(assert (=> d!32109 (=> (not res!55685) (not e!73419))))

(declare-fun lt!58504 () ListLongMap!1599)

(assert (=> d!32109 (= res!55685 (contains!846 lt!58504 (_1!1238 lt!58423)))))

(declare-fun lt!58505 () List!1639)

(assert (=> d!32109 (= lt!58504 (ListLongMap!1600 lt!58505))))

(declare-fun lt!58503 () Unit!3521)

(declare-fun lt!58506 () Unit!3521)

(assert (=> d!32109 (= lt!58503 lt!58506)))

(assert (=> d!32109 (= (getValueByKey!160 lt!58505 (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423)))))

(assert (=> d!32109 (= lt!58506 (lemmaContainsTupThenGetReturnValue!76 lt!58505 (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(assert (=> d!32109 (= lt!58505 (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(assert (=> d!32109 (= (+!154 lt!58429 lt!58423) lt!58504)))

(declare-fun b!112937 () Bool)

(declare-fun res!55684 () Bool)

(assert (=> b!112937 (=> (not res!55684) (not e!73419))))

(assert (=> b!112937 (= res!55684 (= (getValueByKey!160 (toList!815 lt!58504) (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423))))))

(declare-fun b!112938 () Bool)

(assert (=> b!112938 (= e!73419 (contains!847 (toList!815 lt!58504) lt!58423))))

(assert (= (and d!32109 res!55685) b!112937))

(assert (= (and b!112937 res!55684) b!112938))

(declare-fun m!129083 () Bool)

(assert (=> d!32109 m!129083))

(declare-fun m!129085 () Bool)

(assert (=> d!32109 m!129085))

(declare-fun m!129087 () Bool)

(assert (=> d!32109 m!129087))

(declare-fun m!129089 () Bool)

(assert (=> d!32109 m!129089))

(declare-fun m!129091 () Bool)

(assert (=> b!112937 m!129091))

(declare-fun m!129093 () Bool)

(assert (=> b!112938 m!129093))

(assert (=> b!112805 d!32109))

(declare-fun d!32111 () Bool)

(declare-fun e!73420 () Bool)

(assert (=> d!32111 e!73420))

(declare-fun res!55687 () Bool)

(assert (=> d!32111 (=> (not res!55687) (not e!73420))))

(declare-fun lt!58508 () ListLongMap!1599)

(assert (=> d!32111 (= res!55687 (contains!846 lt!58508 (_1!1238 lt!58422)))))

(declare-fun lt!58509 () List!1639)

(assert (=> d!32111 (= lt!58508 (ListLongMap!1600 lt!58509))))

(declare-fun lt!58507 () Unit!3521)

(declare-fun lt!58510 () Unit!3521)

(assert (=> d!32111 (= lt!58507 lt!58510)))

(assert (=> d!32111 (= (getValueByKey!160 lt!58509 (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422)))))

(assert (=> d!32111 (= lt!58510 (lemmaContainsTupThenGetReturnValue!76 lt!58509 (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(assert (=> d!32111 (= lt!58509 (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(assert (=> d!32111 (= (+!154 lt!58429 lt!58422) lt!58508)))

(declare-fun b!112939 () Bool)

(declare-fun res!55686 () Bool)

(assert (=> b!112939 (=> (not res!55686) (not e!73420))))

(assert (=> b!112939 (= res!55686 (= (getValueByKey!160 (toList!815 lt!58508) (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422))))))

(declare-fun b!112940 () Bool)

(assert (=> b!112940 (= e!73420 (contains!847 (toList!815 lt!58508) lt!58422))))

(assert (= (and d!32111 res!55687) b!112939))

(assert (= (and b!112939 res!55686) b!112940))

(declare-fun m!129095 () Bool)

(assert (=> d!32111 m!129095))

(declare-fun m!129097 () Bool)

(assert (=> d!32111 m!129097))

(declare-fun m!129099 () Bool)

(assert (=> d!32111 m!129099))

(declare-fun m!129101 () Bool)

(assert (=> d!32111 m!129101))

(declare-fun m!129103 () Bool)

(assert (=> b!112939 m!129103))

(declare-fun m!129105 () Bool)

(assert (=> b!112940 m!129105))

(assert (=> b!112805 d!32111))

(declare-fun d!32113 () Bool)

(declare-fun e!73421 () Bool)

(assert (=> d!32113 e!73421))

(declare-fun res!55689 () Bool)

(assert (=> d!32113 (=> (not res!55689) (not e!73421))))

(declare-fun lt!58512 () ListLongMap!1599)

(assert (=> d!32113 (= res!55689 (contains!846 lt!58512 (_1!1238 lt!58423)))))

(declare-fun lt!58513 () List!1639)

(assert (=> d!32113 (= lt!58512 (ListLongMap!1600 lt!58513))))

(declare-fun lt!58511 () Unit!3521)

(declare-fun lt!58514 () Unit!3521)

(assert (=> d!32113 (= lt!58511 lt!58514)))

(assert (=> d!32113 (= (getValueByKey!160 lt!58513 (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423)))))

(assert (=> d!32113 (= lt!58514 (lemmaContainsTupThenGetReturnValue!76 lt!58513 (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(assert (=> d!32113 (= lt!58513 (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 lt!58422)) (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(assert (=> d!32113 (= (+!154 (+!154 lt!58429 lt!58422) lt!58423) lt!58512)))

(declare-fun b!112941 () Bool)

(declare-fun res!55688 () Bool)

(assert (=> b!112941 (=> (not res!55688) (not e!73421))))

(assert (=> b!112941 (= res!55688 (= (getValueByKey!160 (toList!815 lt!58512) (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423))))))

(declare-fun b!112942 () Bool)

(assert (=> b!112942 (= e!73421 (contains!847 (toList!815 lt!58512) lt!58423))))

(assert (= (and d!32113 res!55689) b!112941))

(assert (= (and b!112941 res!55688) b!112942))

(declare-fun m!129107 () Bool)

(assert (=> d!32113 m!129107))

(declare-fun m!129109 () Bool)

(assert (=> d!32113 m!129109))

(declare-fun m!129111 () Bool)

(assert (=> d!32113 m!129111))

(declare-fun m!129113 () Bool)

(assert (=> d!32113 m!129113))

(declare-fun m!129115 () Bool)

(assert (=> b!112941 m!129115))

(declare-fun m!129117 () Bool)

(assert (=> b!112942 m!129117))

(assert (=> b!112805 d!32113))

(declare-fun d!32115 () Bool)

(assert (=> d!32115 (= (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992)))) (and (or (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000001111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000011111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000001111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000011111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000001111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000011111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000001111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000011111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000000111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000001111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000011111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000000111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000001111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000011111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000000111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000001111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000011111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000000111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000001111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000011111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00000111111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00001111111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00011111111111111111111111111111) (= (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6845 (v!2959 (underlying!376 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!112805 d!32115))

(declare-fun d!32117 () Bool)

(declare-fun e!73426 () Bool)

(assert (=> d!32117 e!73426))

(declare-fun res!55692 () Bool)

(assert (=> d!32117 (=> res!55692 e!73426)))

(declare-fun lt!58523 () Bool)

(assert (=> d!32117 (= res!55692 (not lt!58523))))

(declare-fun lt!58526 () Bool)

(assert (=> d!32117 (= lt!58523 lt!58526)))

(declare-fun lt!58525 () Unit!3521)

(declare-fun e!73427 () Unit!3521)

(assert (=> d!32117 (= lt!58525 e!73427)))

(declare-fun c!20192 () Bool)

(assert (=> d!32117 (= c!20192 lt!58526)))

(declare-fun containsKey!164 (List!1639 (_ BitVec 64)) Bool)

(assert (=> d!32117 (= lt!58526 (containsKey!164 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32117 (= (contains!846 lt!58424 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58523)))

(declare-fun b!112949 () Bool)

(declare-fun lt!58524 () Unit!3521)

(assert (=> b!112949 (= e!73427 lt!58524)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!112 (List!1639 (_ BitVec 64)) Unit!3521)

(assert (=> b!112949 (= lt!58524 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun isDefined!113 (Option!166) Bool)

(assert (=> b!112949 (isDefined!113 (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!112950 () Bool)

(declare-fun Unit!3525 () Unit!3521)

(assert (=> b!112950 (= e!73427 Unit!3525)))

(declare-fun b!112951 () Bool)

(assert (=> b!112951 (= e!73426 (isDefined!113 (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32117 c!20192) b!112949))

(assert (= (and d!32117 (not c!20192)) b!112950))

(assert (= (and d!32117 (not res!55692)) b!112951))

(assert (=> d!32117 m!128915))

(declare-fun m!129119 () Bool)

(assert (=> d!32117 m!129119))

(assert (=> b!112949 m!128915))

(declare-fun m!129121 () Bool)

(assert (=> b!112949 m!129121))

(assert (=> b!112949 m!128915))

(declare-fun m!129123 () Bool)

(assert (=> b!112949 m!129123))

(assert (=> b!112949 m!129123))

(declare-fun m!129125 () Bool)

(assert (=> b!112949 m!129125))

(assert (=> b!112951 m!128915))

(assert (=> b!112951 m!129123))

(assert (=> b!112951 m!129123))

(assert (=> b!112951 m!129125))

(assert (=> b!112808 d!32117))

(declare-fun b!113036 () Bool)

(declare-fun e!73492 () Bool)

(declare-datatypes ((SeekEntryResult!263 0))(
  ( (MissingZero!263 (index!3204 (_ BitVec 32))) (Found!263 (index!3205 (_ BitVec 32))) (Intermediate!263 (undefined!1075 Bool) (index!3206 (_ BitVec 32)) (x!14184 (_ BitVec 32))) (Undefined!263) (MissingVacant!263 (index!3207 (_ BitVec 32))) )
))
(declare-fun lt!58598 () SeekEntryResult!263)

(assert (=> b!113036 (= e!73492 ((_ is Undefined!263) lt!58598))))

(declare-fun b!113037 () Bool)

(declare-fun e!73491 () tuple2!2456)

(declare-fun e!73477 () tuple2!2456)

(assert (=> b!113037 (= e!73491 e!73477)))

(declare-fun c!20228 () Bool)

(declare-fun lt!58590 () SeekEntryResult!263)

(assert (=> b!113037 (= c!20228 ((_ is MissingZero!263) lt!58590))))

(declare-fun b!113038 () Bool)

(declare-fun e!73478 () ListLongMap!1599)

(declare-fun call!12160 () ListLongMap!1599)

(assert (=> b!113038 (= e!73478 call!12160)))

(declare-fun b!113039 () Bool)

(declare-fun e!73473 () ListLongMap!1599)

(assert (=> b!113039 (= e!73473 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun bm!12151 () Bool)

(declare-fun call!12168 () ListLongMap!1599)

(declare-fun call!12172 () ListLongMap!1599)

(assert (=> bm!12151 (= call!12168 call!12172)))

(declare-fun c!20221 () Bool)

(declare-fun lt!58588 () array!4419)

(declare-fun call!12159 () ListLongMap!1599)

(declare-fun bm!12152 () Bool)

(assert (=> bm!12152 (= call!12159 (getCurrentListMap!499 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun call!12154 () Bool)

(declare-fun bm!12153 () Bool)

(assert (=> bm!12153 (= call!12154 (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113040 () Bool)

(declare-fun lt!58596 () Unit!3521)

(declare-fun lt!58592 () Unit!3521)

(assert (=> b!113040 (= lt!58596 lt!58592)))

(declare-fun call!12166 () ListLongMap!1599)

(declare-fun call!12169 () ListLongMap!1599)

(assert (=> b!113040 (= call!12166 call!12169)))

(declare-fun lt!58594 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 V!3259 Int) Unit!3521)

(assert (=> b!113040 (= lt!58592 (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58594 (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) lt!58428 (defaultEntry!2661 newMap!16)))))

(assert (=> b!113040 (= lt!58594 (bvor (extraKeys!2452 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!73484 () tuple2!2456)

(assert (=> b!113040 (= e!73484 (tuple2!2457 true (LongMapFixedSize!931 (defaultEntry!2661 newMap!16) (mask!6845 newMap!16) (bvor (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) (zeroValue!2529 newMap!16) lt!58428 (_size!514 newMap!16) (_keys!4381 newMap!16) (_values!2644 newMap!16) (_vacant!514 newMap!16))))))

(declare-fun b!113041 () Bool)

(declare-fun e!73493 () tuple2!2456)

(assert (=> b!113041 (= e!73493 e!73484)))

(declare-fun c!20229 () Bool)

(assert (=> b!113041 (= c!20229 (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113042 () Bool)

(declare-fun lt!58582 () tuple2!2456)

(assert (=> b!113042 (= e!73491 (tuple2!2457 (_1!1239 lt!58582) (_2!1239 lt!58582)))))

(declare-fun call!12158 () tuple2!2456)

(assert (=> b!113042 (= lt!58582 call!12158)))

(declare-fun bm!12154 () Bool)

(declare-fun call!12157 () SeekEntryResult!263)

(declare-fun call!12156 () SeekEntryResult!263)

(assert (=> bm!12154 (= call!12157 call!12156)))

(declare-fun b!113043 () Bool)

(declare-fun e!73479 () Bool)

(assert (=> b!113043 (= e!73492 e!73479)))

(declare-fun res!55728 () Bool)

(declare-fun call!12162 () Bool)

(assert (=> b!113043 (= res!55728 call!12162)))

(assert (=> b!113043 (=> (not res!55728) (not e!73479))))

(declare-fun b!113044 () Bool)

(assert (=> b!113044 (= e!73478 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun b!113045 () Bool)

(declare-fun e!73472 () Unit!3521)

(declare-fun lt!58593 () Unit!3521)

(assert (=> b!113045 (= e!73472 lt!58593)))

(declare-fun call!12173 () Unit!3521)

(assert (=> b!113045 (= lt!58593 call!12173)))

(declare-fun lt!58585 () SeekEntryResult!263)

(declare-fun call!12155 () SeekEntryResult!263)

(assert (=> b!113045 (= lt!58585 call!12155)))

(declare-fun res!55733 () Bool)

(assert (=> b!113045 (= res!55733 ((_ is Found!263) lt!58585))))

(declare-fun e!73475 () Bool)

(assert (=> b!113045 (=> (not res!55733) (not e!73475))))

(assert (=> b!113045 e!73475))

(declare-fun b!113046 () Bool)

(declare-fun e!73489 () Bool)

(declare-fun call!12174 () ListLongMap!1599)

(declare-fun call!12167 () ListLongMap!1599)

(assert (=> b!113046 (= e!73489 (= call!12174 call!12167))))

(declare-fun bm!12155 () Bool)

(declare-fun call!12163 () Bool)

(assert (=> bm!12155 (= call!12163 call!12154)))

(declare-fun b!113047 () Bool)

(declare-fun call!12165 () Bool)

(assert (=> b!113047 (= e!73479 (not call!12165))))

(declare-fun bm!12156 () Bool)

(assert (=> bm!12156 (= call!12169 call!12172)))

(declare-fun b!113048 () Bool)

(declare-fun res!55734 () Bool)

(declare-fun e!73485 () Bool)

(assert (=> b!113048 (=> (not res!55734) (not e!73485))))

(assert (=> b!113048 (= res!55734 call!12162)))

(declare-fun e!73481 () Bool)

(assert (=> b!113048 (= e!73481 e!73485)))

(declare-fun b!113049 () Bool)

(declare-fun c!20223 () Bool)

(assert (=> b!113049 (= c!20223 ((_ is MissingVacant!263) lt!58598))))

(assert (=> b!113049 (= e!73481 e!73492)))

(declare-fun bm!12157 () Bool)

(assert (=> bm!12157 (= call!12160 call!12159)))

(declare-fun bm!12158 () Bool)

(declare-fun call!12171 () Unit!3521)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) Int) Unit!3521)

(assert (=> bm!12158 (= call!12171 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(declare-fun bm!12159 () Bool)

(declare-fun c!20232 () Bool)

(declare-fun c!20227 () Bool)

(assert (=> bm!12159 (= c!20232 c!20227)))

(declare-fun call!12176 () Bool)

(assert (=> bm!12159 (= call!12176 (contains!846 e!73473 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113050 () Bool)

(declare-fun c!20233 () Bool)

(declare-fun lt!58599 () SeekEntryResult!263)

(assert (=> b!113050 (= c!20233 ((_ is MissingVacant!263) lt!58599))))

(declare-fun e!73476 () Bool)

(declare-fun e!73482 () Bool)

(assert (=> b!113050 (= e!73476 e!73482)))

(declare-fun b!113051 () Bool)

(declare-fun e!73483 () Bool)

(assert (=> b!113051 (= e!73483 (not call!12163))))

(declare-fun b!113052 () Bool)

(declare-fun e!73480 () Bool)

(assert (=> b!113052 (= e!73482 e!73480)))

(declare-fun res!55732 () Bool)

(declare-fun call!12161 () Bool)

(assert (=> b!113052 (= res!55732 call!12161)))

(assert (=> b!113052 (=> (not res!55732) (not e!73480))))

(declare-fun b!113053 () Bool)

(declare-fun c!20225 () Bool)

(assert (=> b!113053 (= c!20225 ((_ is MissingVacant!263) lt!58590))))

(declare-fun e!73487 () tuple2!2456)

(assert (=> b!113053 (= e!73487 e!73491)))

(declare-fun bm!12160 () Bool)

(declare-fun call!12170 () ListLongMap!1599)

(assert (=> bm!12160 (= call!12166 call!12170)))

(declare-fun c!20231 () Bool)

(declare-fun call!12177 () Bool)

(declare-fun c!20230 () Bool)

(declare-fun c!20222 () Bool)

(declare-fun c!20226 () Bool)

(declare-fun bm!12161 () Bool)

(declare-fun lt!58597 () SeekEntryResult!263)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12161 (= call!12177 (inRange!0 (ite c!20227 (ite c!20231 (index!3205 lt!58597) (ite c!20230 (index!3204 lt!58598) (index!3207 lt!58598))) (ite c!20226 (index!3205 lt!58585) (ite c!20222 (index!3204 lt!58599) (index!3207 lt!58599)))) (mask!6845 newMap!16)))))

(declare-fun bm!12162 () Bool)

(assert (=> bm!12162 (= call!12170 (+!154 e!73478 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun c!20234 () Bool)

(assert (=> bm!12162 (= c!20234 c!20221)))

(declare-fun b!113054 () Bool)

(declare-fun e!73490 () Unit!3521)

(declare-fun Unit!3526 () Unit!3521)

(assert (=> b!113054 (= e!73490 Unit!3526)))

(declare-fun lt!58589 () Unit!3521)

(assert (=> b!113054 (= lt!58589 call!12173)))

(assert (=> b!113054 (= lt!58597 call!12157)))

(declare-fun res!55727 () Bool)

(assert (=> b!113054 (= res!55727 ((_ is Found!263) lt!58597))))

(declare-fun e!73474 () Bool)

(assert (=> b!113054 (=> (not res!55727) (not e!73474))))

(assert (=> b!113054 e!73474))

(declare-fun lt!58595 () Unit!3521)

(assert (=> b!113054 (= lt!58595 lt!58589)))

(assert (=> b!113054 false))

(declare-fun b!113055 () Bool)

(declare-fun e!73488 () Bool)

(assert (=> b!113055 (= e!73488 e!73489)))

(declare-fun c!20224 () Bool)

(declare-fun lt!58581 () tuple2!2456)

(assert (=> b!113055 (= c!20224 (_1!1239 lt!58581))))

(declare-fun b!113056 () Bool)

(assert (=> b!113056 (= e!73493 e!73487)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4417 (_ BitVec 32)) SeekEntryResult!263)

(assert (=> b!113056 (= lt!58590 (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(assert (=> b!113056 (= c!20227 ((_ is Undefined!263) lt!58590))))

(declare-fun bm!12163 () Bool)

(assert (=> bm!12163 (= call!12156 (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun bm!12164 () Bool)

(declare-fun call!12175 () Bool)

(assert (=> bm!12164 (= call!12175 call!12177)))

(declare-fun b!113057 () Bool)

(declare-fun res!55726 () Bool)

(assert (=> b!113057 (= res!55726 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3207 lt!58598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113057 (=> (not res!55726) (not e!73479))))

(declare-fun b!113058 () Bool)

(assert (=> b!113058 (= e!73474 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58597)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113059 () Bool)

(declare-fun res!55724 () Bool)

(declare-fun call!12164 () Bool)

(assert (=> b!113059 (= res!55724 call!12164)))

(assert (=> b!113059 (=> (not res!55724) (not e!73474))))

(declare-fun bm!12165 () Bool)

(assert (=> bm!12165 (= call!12161 call!12175)))

(declare-fun bm!12166 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) Int) Unit!3521)

(assert (=> bm!12166 (= call!12173 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(declare-fun b!113060 () Bool)

(assert (=> b!113060 (= e!73475 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58585)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113061 () Bool)

(assert (=> b!113061 (= e!73473 call!12168)))

(declare-fun bm!12167 () Bool)

(assert (=> bm!12167 (= call!12164 call!12177)))

(declare-fun b!113062 () Bool)

(declare-fun e!73486 () Bool)

(assert (=> b!113062 (= e!73489 e!73486)))

(declare-fun res!55721 () Bool)

(assert (=> b!113062 (= res!55721 (contains!846 call!12174 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113062 (=> (not res!55721) (not e!73486))))

(declare-fun b!113063 () Bool)

(declare-fun lt!58602 () Unit!3521)

(declare-fun lt!58584 () Unit!3521)

(assert (=> b!113063 (= lt!58602 lt!58584)))

(assert (=> b!113063 (contains!846 call!12159 (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!112 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) Int) Unit!3521)

(assert (=> b!113063 (= lt!58584 (lemmaValidKeyInArrayIsInListMap!112 (_keys!4381 newMap!16) lt!58588 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (defaultEntry!2661 newMap!16)))))

(assert (=> b!113063 (= lt!58588 (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))))))

(declare-fun lt!58604 () Unit!3521)

(declare-fun lt!58591 () Unit!3521)

(assert (=> b!113063 (= lt!58604 lt!58591)))

(assert (=> b!113063 (= call!12170 call!12168)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) (_ BitVec 64) V!3259 Int) Unit!3521)

(assert (=> b!113063 (= lt!58591 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58605 () Unit!3521)

(assert (=> b!113063 (= lt!58605 e!73472)))

(assert (=> b!113063 (= c!20226 call!12176)))

(assert (=> b!113063 (= e!73477 (tuple2!2457 true (LongMapFixedSize!931 (defaultEntry!2661 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (_size!514 newMap!16) (_keys!4381 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))) (_vacant!514 newMap!16))))))

(declare-fun b!113064 () Bool)

(declare-fun res!55731 () Bool)

(assert (=> b!113064 (=> (not res!55731) (not e!73485))))

(assert (=> b!113064 (= res!55731 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3204 lt!58598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12168 () Bool)

(declare-fun updateHelperNewKey!51 (LongMapFixedSize!930 (_ BitVec 64) V!3259 (_ BitVec 32)) tuple2!2456)

(assert (=> bm!12168 (= call!12158 (updateHelperNewKey!51 newMap!16 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590))))))

(declare-fun bm!12169 () Bool)

(assert (=> bm!12169 (= call!12167 (map!1306 newMap!16))))

(declare-fun b!113065 () Bool)

(declare-fun res!55725 () Bool)

(assert (=> b!113065 (= res!55725 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3207 lt!58599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113065 (=> (not res!55725) (not e!73480))))

(declare-fun b!113066 () Bool)

(declare-fun lt!58607 () Unit!3521)

(assert (=> b!113066 (= e!73490 lt!58607)))

(assert (=> b!113066 (= lt!58607 call!12171)))

(assert (=> b!113066 (= lt!58598 call!12157)))

(assert (=> b!113066 (= c!20230 ((_ is MissingZero!263) lt!58598))))

(assert (=> b!113066 e!73481))

(declare-fun d!32119 () Bool)

(assert (=> d!32119 e!73488))

(declare-fun res!55722 () Bool)

(assert (=> d!32119 (=> (not res!55722) (not e!73488))))

(assert (=> d!32119 (= res!55722 (valid!437 (_2!1239 lt!58581)))))

(assert (=> d!32119 (= lt!58581 e!73493)))

(assert (=> d!32119 (= c!20221 (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvneg (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32119 (valid!437 newMap!16)))

(assert (=> d!32119 (= (update!166 newMap!16 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428) lt!58581)))

(declare-fun b!113067 () Bool)

(declare-fun lt!58601 () Unit!3521)

(assert (=> b!113067 (= lt!58601 e!73490)))

(assert (=> b!113067 (= c!20231 call!12176)))

(assert (=> b!113067 (= e!73487 (tuple2!2457 false newMap!16))))

(declare-fun b!113068 () Bool)

(assert (=> b!113068 (= e!73486 (= call!12174 (+!154 call!12167 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun b!113069 () Bool)

(declare-fun Unit!3527 () Unit!3521)

(assert (=> b!113069 (= e!73472 Unit!3527)))

(declare-fun lt!58603 () Unit!3521)

(assert (=> b!113069 (= lt!58603 call!12171)))

(assert (=> b!113069 (= lt!58599 call!12155)))

(assert (=> b!113069 (= c!20222 ((_ is MissingZero!263) lt!58599))))

(assert (=> b!113069 e!73476))

(declare-fun lt!58583 () Unit!3521)

(assert (=> b!113069 (= lt!58583 lt!58603)))

(assert (=> b!113069 false))

(declare-fun b!113070 () Bool)

(declare-fun lt!58606 () Unit!3521)

(declare-fun lt!58587 () Unit!3521)

(assert (=> b!113070 (= lt!58606 lt!58587)))

(assert (=> b!113070 (= call!12166 call!12169)))

(declare-fun lt!58600 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!51 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 V!3259 Int) Unit!3521)

(assert (=> b!113070 (= lt!58587 (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58600 (zeroValue!2529 newMap!16) lt!58428 (minValue!2529 newMap!16) (defaultEntry!2661 newMap!16)))))

(assert (=> b!113070 (= lt!58600 (bvor (extraKeys!2452 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!113070 (= e!73484 (tuple2!2457 true (LongMapFixedSize!931 (defaultEntry!2661 newMap!16) (mask!6845 newMap!16) (bvor (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) lt!58428 (minValue!2529 newMap!16) (_size!514 newMap!16) (_keys!4381 newMap!16) (_values!2644 newMap!16) (_vacant!514 newMap!16))))))

(declare-fun b!113071 () Bool)

(declare-fun lt!58586 () tuple2!2456)

(assert (=> b!113071 (= lt!58586 call!12158)))

(assert (=> b!113071 (= e!73477 (tuple2!2457 (_1!1239 lt!58586) (_2!1239 lt!58586)))))

(declare-fun bm!12170 () Bool)

(assert (=> bm!12170 (= call!12172 (getCurrentListMap!499 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun bm!12171 () Bool)

(assert (=> bm!12171 (= call!12174 (map!1306 (_2!1239 lt!58581)))))

(declare-fun b!113072 () Bool)

(declare-fun res!55730 () Bool)

(assert (=> b!113072 (= res!55730 call!12175)))

(assert (=> b!113072 (=> (not res!55730) (not e!73475))))

(declare-fun b!113073 () Bool)

(assert (=> b!113073 (= e!73482 ((_ is Undefined!263) lt!58599))))

(declare-fun b!113074 () Bool)

(assert (=> b!113074 (= e!73485 (not call!12165))))

(declare-fun bm!12172 () Bool)

(assert (=> bm!12172 (= call!12155 call!12156)))

(declare-fun b!113075 () Bool)

(declare-fun res!55729 () Bool)

(assert (=> b!113075 (=> (not res!55729) (not e!73483))))

(assert (=> b!113075 (= res!55729 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3204 lt!58599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113076 () Bool)

(assert (=> b!113076 (= e!73480 (not call!12163))))

(declare-fun bm!12173 () Bool)

(assert (=> bm!12173 (= call!12165 call!12154)))

(declare-fun bm!12174 () Bool)

(assert (=> bm!12174 (= call!12162 call!12164)))

(declare-fun b!113077 () Bool)

(declare-fun res!55723 () Bool)

(assert (=> b!113077 (=> (not res!55723) (not e!73483))))

(assert (=> b!113077 (= res!55723 call!12161)))

(assert (=> b!113077 (= e!73476 e!73483)))

(assert (= (and d!32119 c!20221) b!113041))

(assert (= (and d!32119 (not c!20221)) b!113056))

(assert (= (and b!113041 c!20229) b!113070))

(assert (= (and b!113041 (not c!20229)) b!113040))

(assert (= (or b!113070 b!113040) bm!12157))

(assert (= (or b!113070 b!113040) bm!12156))

(assert (= (or b!113070 b!113040) bm!12160))

(assert (= (and b!113056 c!20227) b!113067))

(assert (= (and b!113056 (not c!20227)) b!113053))

(assert (= (and b!113067 c!20231) b!113054))

(assert (= (and b!113067 (not c!20231)) b!113066))

(assert (= (and b!113054 res!55727) b!113059))

(assert (= (and b!113059 res!55724) b!113058))

(assert (= (and b!113066 c!20230) b!113048))

(assert (= (and b!113066 (not c!20230)) b!113049))

(assert (= (and b!113048 res!55734) b!113064))

(assert (= (and b!113064 res!55731) b!113074))

(assert (= (and b!113049 c!20223) b!113043))

(assert (= (and b!113049 (not c!20223)) b!113036))

(assert (= (and b!113043 res!55728) b!113057))

(assert (= (and b!113057 res!55726) b!113047))

(assert (= (or b!113048 b!113043) bm!12174))

(assert (= (or b!113074 b!113047) bm!12173))

(assert (= (or b!113059 bm!12174) bm!12167))

(assert (= (or b!113054 b!113066) bm!12154))

(assert (= (and b!113053 c!20225) b!113042))

(assert (= (and b!113053 (not c!20225)) b!113037))

(assert (= (and b!113037 c!20228) b!113071))

(assert (= (and b!113037 (not c!20228)) b!113063))

(assert (= (and b!113063 c!20226) b!113045))

(assert (= (and b!113063 (not c!20226)) b!113069))

(assert (= (and b!113045 res!55733) b!113072))

(assert (= (and b!113072 res!55730) b!113060))

(assert (= (and b!113069 c!20222) b!113077))

(assert (= (and b!113069 (not c!20222)) b!113050))

(assert (= (and b!113077 res!55723) b!113075))

(assert (= (and b!113075 res!55729) b!113051))

(assert (= (and b!113050 c!20233) b!113052))

(assert (= (and b!113050 (not c!20233)) b!113073))

(assert (= (and b!113052 res!55732) b!113065))

(assert (= (and b!113065 res!55725) b!113076))

(assert (= (or b!113077 b!113052) bm!12165))

(assert (= (or b!113051 b!113076) bm!12155))

(assert (= (or b!113072 bm!12165) bm!12164))

(assert (= (or b!113045 b!113069) bm!12172))

(assert (= (or b!113042 b!113071) bm!12168))

(assert (= (or b!113054 b!113045) bm!12166))

(assert (= (or bm!12167 bm!12164) bm!12161))

(assert (= (or b!113067 b!113063) bm!12151))

(assert (= (or bm!12154 bm!12172) bm!12163))

(assert (= (or b!113066 b!113069) bm!12158))

(assert (= (or bm!12173 bm!12155) bm!12153))

(assert (= (or b!113067 b!113063) bm!12159))

(assert (= (and bm!12159 c!20232) b!113061))

(assert (= (and bm!12159 (not c!20232)) b!113039))

(assert (= (or bm!12156 bm!12151) bm!12170))

(assert (= (or bm!12157 b!113063) bm!12152))

(assert (= (or bm!12160 b!113063) bm!12162))

(assert (= (and bm!12162 c!20234) b!113038))

(assert (= (and bm!12162 (not c!20234)) b!113044))

(assert (= (and d!32119 res!55722) b!113055))

(assert (= (and b!113055 c!20224) b!113062))

(assert (= (and b!113055 (not c!20224)) b!113046))

(assert (= (and b!113062 res!55721) b!113068))

(assert (= (or b!113068 b!113046) bm!12169))

(assert (= (or b!113062 b!113068 b!113046) bm!12171))

(declare-fun m!129127 () Bool)

(assert (=> bm!12171 m!129127))

(assert (=> bm!12166 m!128915))

(declare-fun m!129129 () Bool)

(assert (=> bm!12166 m!129129))

(declare-fun m!129131 () Bool)

(assert (=> b!113058 m!129131))

(declare-fun m!129133 () Bool)

(assert (=> b!113044 m!129133))

(assert (=> bm!12153 m!128915))

(declare-fun m!129135 () Bool)

(assert (=> bm!12153 m!129135))

(declare-fun m!129137 () Bool)

(assert (=> bm!12162 m!129137))

(declare-fun m!129139 () Bool)

(assert (=> b!113064 m!129139))

(declare-fun m!129141 () Bool)

(assert (=> bm!12152 m!129141))

(declare-fun m!129143 () Bool)

(assert (=> b!113075 m!129143))

(declare-fun m!129145 () Bool)

(assert (=> b!113057 m!129145))

(assert (=> bm!12169 m!128931))

(declare-fun m!129147 () Bool)

(assert (=> b!113065 m!129147))

(declare-fun m!129149 () Bool)

(assert (=> b!113063 m!129149))

(assert (=> b!113063 m!128915))

(declare-fun m!129151 () Bool)

(assert (=> b!113063 m!129151))

(declare-fun m!129153 () Bool)

(assert (=> b!113063 m!129153))

(assert (=> b!113063 m!129149))

(declare-fun m!129155 () Bool)

(assert (=> b!113063 m!129155))

(declare-fun m!129157 () Bool)

(assert (=> b!113063 m!129157))

(declare-fun m!129159 () Bool)

(assert (=> bm!12161 m!129159))

(declare-fun m!129161 () Bool)

(assert (=> b!113060 m!129161))

(assert (=> b!113062 m!128915))

(declare-fun m!129163 () Bool)

(assert (=> b!113062 m!129163))

(assert (=> bm!12163 m!128915))

(declare-fun m!129165 () Bool)

(assert (=> bm!12163 m!129165))

(assert (=> bm!12170 m!129153))

(declare-fun m!129167 () Bool)

(assert (=> bm!12170 m!129167))

(assert (=> bm!12158 m!128915))

(declare-fun m!129169 () Bool)

(assert (=> bm!12158 m!129169))

(assert (=> b!113039 m!129133))

(declare-fun m!129171 () Bool)

(assert (=> b!113040 m!129171))

(assert (=> bm!12159 m!128915))

(declare-fun m!129173 () Bool)

(assert (=> bm!12159 m!129173))

(assert (=> b!113056 m!128915))

(assert (=> b!113056 m!129165))

(declare-fun m!129175 () Bool)

(assert (=> b!113070 m!129175))

(assert (=> bm!12168 m!128915))

(declare-fun m!129177 () Bool)

(assert (=> bm!12168 m!129177))

(declare-fun m!129179 () Bool)

(assert (=> d!32119 m!129179))

(assert (=> d!32119 m!128937))

(declare-fun m!129181 () Bool)

(assert (=> b!113068 m!129181))

(assert (=> b!112808 d!32119))

(declare-fun d!32121 () Bool)

(assert (=> d!32121 (= (array_inv!1317 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvsge (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112823 d!32121))

(declare-fun d!32123 () Bool)

(assert (=> d!32123 (= (array_inv!1318 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvsge (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112823 d!32123))

(declare-fun d!32125 () Bool)

(assert (=> d!32125 (= (array_inv!1317 (_keys!4381 newMap!16)) (bvsge (size!2352 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112813 d!32125))

(declare-fun d!32127 () Bool)

(assert (=> d!32127 (= (array_inv!1318 (_values!2644 newMap!16)) (bvsge (size!2353 (_values!2644 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112813 d!32127))

(declare-fun d!32129 () Bool)

(assert (=> d!32129 (not (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58610 () Unit!3521)

(declare-fun choose!68 (array!4417 (_ BitVec 32) (_ BitVec 64) List!1640) Unit!3521)

(assert (=> d!32129 (= lt!58610 (choose!68 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637)))))

(assert (=> d!32129 (bvslt (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32129 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637)) lt!58610)))

(declare-fun bs!4644 () Bool)

(assert (= bs!4644 d!32129))

(assert (=> bs!4644 m!128915))

(assert (=> bs!4644 m!128927))

(assert (=> bs!4644 m!128915))

(declare-fun m!129183 () Bool)

(assert (=> bs!4644 m!129183))

(assert (=> b!112818 d!32129))

(declare-fun d!32131 () Bool)

(assert (=> d!32131 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1637)))

(declare-fun lt!58613 () Unit!3521)

(declare-fun choose!39 (array!4417 (_ BitVec 32) (_ BitVec 32)) Unit!3521)

(assert (=> d!32131 (= lt!58613 (choose!39 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32131 (bvslt (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32131 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355) lt!58613)))

(declare-fun bs!4645 () Bool)

(assert (= bs!4645 d!32131))

(assert (=> bs!4645 m!128923))

(declare-fun m!129185 () Bool)

(assert (=> bs!4645 m!129185))

(assert (=> b!112818 d!32131))

(declare-fun d!32133 () Bool)

(declare-fun res!55739 () Bool)

(declare-fun e!73498 () Bool)

(assert (=> d!32133 (=> res!55739 e!73498)))

(assert (=> d!32133 (= res!55739 (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32133 (= (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!73498)))

(declare-fun b!113082 () Bool)

(declare-fun e!73499 () Bool)

(assert (=> b!113082 (= e!73498 e!73499)))

(declare-fun res!55740 () Bool)

(assert (=> b!113082 (=> (not res!55740) (not e!73499))))

(assert (=> b!113082 (= res!55740 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113083 () Bool)

(assert (=> b!113083 (= e!73499 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32133 (not res!55739)) b!113082))

(assert (= (and b!113082 res!55740) b!113083))

(assert (=> d!32133 m!129047))

(assert (=> b!113083 m!128915))

(declare-fun m!129187 () Bool)

(assert (=> b!113083 m!129187))

(assert (=> b!112818 d!32133))

(declare-fun d!32135 () Bool)

(declare-fun e!73502 () Bool)

(assert (=> d!32135 e!73502))

(declare-fun c!20237 () Bool)

(assert (=> d!32135 (= c!20237 (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58616 () Unit!3521)

(declare-fun choose!711 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) (_ BitVec 32) Int) Unit!3521)

(assert (=> d!32135 (= lt!58616 (choose!711 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32135 (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32135 (= (lemmaListMapContainsThenArrayContainsFrom!115 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) lt!58616)))

(declare-fun b!113088 () Bool)

(assert (=> b!113088 (= e!73502 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!113089 () Bool)

(assert (=> b!113089 (= e!73502 (ite (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32135 c!20237) b!113088))

(assert (= (and d!32135 (not c!20237)) b!113089))

(assert (=> d!32135 m!128915))

(declare-fun m!129189 () Bool)

(assert (=> d!32135 m!129189))

(assert (=> d!32135 m!128953))

(assert (=> b!113088 m!128915))

(assert (=> b!113088 m!128927))

(assert (=> b!112818 d!32135))

(declare-fun b!113100 () Bool)

(declare-fun e!73513 () Bool)

(declare-fun e!73514 () Bool)

(assert (=> b!113100 (= e!73513 e!73514)))

(declare-fun res!55749 () Bool)

(assert (=> b!113100 (=> (not res!55749) (not e!73514))))

(declare-fun e!73511 () Bool)

(assert (=> b!113100 (= res!55749 (not e!73511))))

(declare-fun res!55748 () Bool)

(assert (=> b!113100 (=> (not res!55748) (not e!73511))))

(assert (=> b!113100 (= res!55748 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113101 () Bool)

(declare-fun contains!848 (List!1640 (_ BitVec 64)) Bool)

(assert (=> b!113101 (= e!73511 (contains!848 Nil!1637 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113102 () Bool)

(declare-fun e!73512 () Bool)

(declare-fun call!12180 () Bool)

(assert (=> b!113102 (= e!73512 call!12180)))

(declare-fun d!32137 () Bool)

(declare-fun res!55747 () Bool)

(assert (=> d!32137 (=> res!55747 e!73513)))

(assert (=> d!32137 (= res!55747 (bvsge from!355 (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32137 (= (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1637) e!73513)))

(declare-fun b!113103 () Bool)

(assert (=> b!113103 (= e!73512 call!12180)))

(declare-fun b!113104 () Bool)

(assert (=> b!113104 (= e!73514 e!73512)))

(declare-fun c!20240 () Bool)

(assert (=> b!113104 (= c!20240 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun bm!12177 () Bool)

(assert (=> bm!12177 (= call!12180 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20240 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637) Nil!1637)))))

(assert (= (and d!32137 (not res!55747)) b!113100))

(assert (= (and b!113100 res!55748) b!113101))

(assert (= (and b!113100 res!55749) b!113104))

(assert (= (and b!113104 c!20240) b!113102))

(assert (= (and b!113104 (not c!20240)) b!113103))

(assert (= (or b!113102 b!113103) bm!12177))

(assert (=> b!113100 m!128915))

(assert (=> b!113100 m!128915))

(declare-fun m!129191 () Bool)

(assert (=> b!113100 m!129191))

(assert (=> b!113101 m!128915))

(assert (=> b!113101 m!128915))

(declare-fun m!129193 () Bool)

(assert (=> b!113101 m!129193))

(assert (=> b!113104 m!128915))

(assert (=> b!113104 m!128915))

(assert (=> b!113104 m!129191))

(assert (=> bm!12177 m!128915))

(declare-fun m!129195 () Bool)

(assert (=> bm!12177 m!129195))

(assert (=> b!112818 d!32137))

(declare-fun b!113113 () Bool)

(declare-fun e!73522 () Bool)

(declare-fun call!12183 () Bool)

(assert (=> b!113113 (= e!73522 call!12183)))

(declare-fun d!32139 () Bool)

(declare-fun res!55754 () Bool)

(declare-fun e!73521 () Bool)

(assert (=> d!32139 (=> res!55754 e!73521)))

(assert (=> d!32139 (= res!55754 (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))) e!73521)))

(declare-fun b!113114 () Bool)

(assert (=> b!113114 (= e!73521 e!73522)))

(declare-fun c!20243 () Bool)

(assert (=> b!113114 (= c!20243 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!12180 () Bool)

(assert (=> bm!12180 (= call!12183 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113115 () Bool)

(declare-fun e!73523 () Bool)

(assert (=> b!113115 (= e!73523 call!12183)))

(declare-fun b!113116 () Bool)

(assert (=> b!113116 (= e!73522 e!73523)))

(declare-fun lt!58625 () (_ BitVec 64))

(assert (=> b!113116 (= lt!58625 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!58623 () Unit!3521)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4417 (_ BitVec 64) (_ BitVec 32)) Unit!3521)

(assert (=> b!113116 (= lt!58623 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000))))

(assert (=> b!113116 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000)))

(declare-fun lt!58624 () Unit!3521)

(assert (=> b!113116 (= lt!58624 lt!58623)))

(declare-fun res!55755 () Bool)

(assert (=> b!113116 (= res!55755 (= (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!113116 (=> (not res!55755) (not e!73523))))

(assert (= (and d!32139 (not res!55754)) b!113114))

(assert (= (and b!113114 c!20243) b!113116))

(assert (= (and b!113114 (not c!20243)) b!113113))

(assert (= (and b!113116 res!55755) b!113115))

(assert (= (or b!113115 b!113113) bm!12180))

(declare-fun m!129197 () Bool)

(assert (=> b!113114 m!129197))

(assert (=> b!113114 m!129197))

(declare-fun m!129199 () Bool)

(assert (=> b!113114 m!129199))

(declare-fun m!129201 () Bool)

(assert (=> bm!12180 m!129201))

(assert (=> b!113116 m!129197))

(declare-fun m!129203 () Bool)

(assert (=> b!113116 m!129203))

(declare-fun m!129205 () Bool)

(assert (=> b!113116 m!129205))

(assert (=> b!113116 m!129197))

(declare-fun m!129207 () Bool)

(assert (=> b!113116 m!129207))

(assert (=> b!112804 d!32139))

(declare-fun d!32141 () Bool)

(assert (=> d!32141 (= (map!1306 newMap!16) (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun bs!4646 () Bool)

(assert (= bs!4646 d!32141))

(assert (=> bs!4646 m!129133))

(assert (=> b!112817 d!32141))

(declare-fun b!113159 () Bool)

(declare-fun e!73551 () Bool)

(declare-fun e!73554 () Bool)

(assert (=> b!113159 (= e!73551 e!73554)))

(declare-fun c!20259 () Bool)

(assert (=> b!113159 (= c!20259 (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113160 () Bool)

(declare-fun e!73558 () Unit!3521)

(declare-fun Unit!3528 () Unit!3521)

(assert (=> b!113160 (= e!73558 Unit!3528)))

(declare-fun b!113161 () Bool)

(declare-fun c!20257 () Bool)

(assert (=> b!113161 (= c!20257 (and (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73561 () ListLongMap!1599)

(declare-fun e!73559 () ListLongMap!1599)

(assert (=> b!113161 (= e!73561 e!73559)))

(declare-fun bm!12195 () Bool)

(declare-fun call!12200 () Bool)

(declare-fun lt!58687 () ListLongMap!1599)

(assert (=> bm!12195 (= call!12200 (contains!846 lt!58687 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113162 () Bool)

(declare-fun res!55781 () Bool)

(assert (=> b!113162 (=> (not res!55781) (not e!73551))))

(declare-fun e!73552 () Bool)

(assert (=> b!113162 (= res!55781 e!73552)))

(declare-fun res!55776 () Bool)

(assert (=> b!113162 (=> res!55776 e!73552)))

(declare-fun e!73556 () Bool)

(assert (=> b!113162 (= res!55776 (not e!73556))))

(declare-fun res!55780 () Bool)

(assert (=> b!113162 (=> (not res!55780) (not e!73556))))

(assert (=> b!113162 (= res!55780 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun c!20260 () Bool)

(declare-fun bm!12196 () Bool)

(declare-fun call!12203 () ListLongMap!1599)

(declare-fun call!12198 () ListLongMap!1599)

(declare-fun call!12204 () ListLongMap!1599)

(declare-fun call!12202 () ListLongMap!1599)

(declare-fun c!20258 () Bool)

(assert (=> bm!12196 (= call!12198 (+!154 (ite c!20260 call!12203 (ite c!20258 call!12204 call!12202)) (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun b!113163 () Bool)

(declare-fun e!73553 () Bool)

(declare-fun e!73562 () Bool)

(assert (=> b!113163 (= e!73553 e!73562)))

(declare-fun res!55782 () Bool)

(declare-fun call!12199 () Bool)

(assert (=> b!113163 (= res!55782 call!12199)))

(assert (=> b!113163 (=> (not res!55782) (not e!73562))))

(declare-fun b!113164 () Bool)

(declare-fun res!55774 () Bool)

(assert (=> b!113164 (=> (not res!55774) (not e!73551))))

(assert (=> b!113164 (= res!55774 e!73553)))

(declare-fun c!20261 () Bool)

(assert (=> b!113164 (= c!20261 (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!113165 () Bool)

(assert (=> b!113165 (= e!73553 (not call!12199))))

(declare-fun b!113166 () Bool)

(assert (=> b!113166 (= e!73554 (not call!12200))))

(declare-fun bm!12197 () Bool)

(assert (=> bm!12197 (= call!12202 call!12204)))

(declare-fun b!113167 () Bool)

(declare-fun e!73555 () ListLongMap!1599)

(assert (=> b!113167 (= e!73555 (+!154 call!12198 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun bm!12198 () Bool)

(declare-fun call!12201 () ListLongMap!1599)

(assert (=> bm!12198 (= call!12201 call!12198)))

(declare-fun b!113168 () Bool)

(declare-fun e!73550 () Bool)

(assert (=> b!113168 (= e!73550 (= (apply!102 lt!58687 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!113168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113169 () Bool)

(assert (=> b!113169 (= e!73562 (= (apply!102 lt!58687 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113170 () Bool)

(assert (=> b!113170 (= e!73556 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113171 () Bool)

(declare-fun lt!58680 () Unit!3521)

(assert (=> b!113171 (= e!73558 lt!58680)))

(declare-fun lt!58670 () ListLongMap!1599)

(assert (=> b!113171 (= lt!58670 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58682 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58688 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58688 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58673 () Unit!3521)

(declare-fun addStillContains!78 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> b!113171 (= lt!58673 (addStillContains!78 lt!58670 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58688))))

(assert (=> b!113171 (contains!846 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58688)))

(declare-fun lt!58675 () Unit!3521)

(assert (=> b!113171 (= lt!58675 lt!58673)))

(declare-fun lt!58684 () ListLongMap!1599)

(assert (=> b!113171 (= lt!58684 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58686 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58689 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58689 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58690 () Unit!3521)

(declare-fun addApplyDifferent!78 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> b!113171 (= lt!58690 (addApplyDifferent!78 lt!58684 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58689))))

(assert (=> b!113171 (= (apply!102 (+!154 lt!58684 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58689) (apply!102 lt!58684 lt!58689))))

(declare-fun lt!58676 () Unit!3521)

(assert (=> b!113171 (= lt!58676 lt!58690)))

(declare-fun lt!58679 () ListLongMap!1599)

(assert (=> b!113171 (= lt!58679 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58671 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58677 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58677 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58685 () Unit!3521)

(assert (=> b!113171 (= lt!58685 (addApplyDifferent!78 lt!58679 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58677))))

(assert (=> b!113171 (= (apply!102 (+!154 lt!58679 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58677) (apply!102 lt!58679 lt!58677))))

(declare-fun lt!58674 () Unit!3521)

(assert (=> b!113171 (= lt!58674 lt!58685)))

(declare-fun lt!58672 () ListLongMap!1599)

(assert (=> b!113171 (= lt!58672 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58691 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58691 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58681 () (_ BitVec 64))

(assert (=> b!113171 (= lt!58681 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!113171 (= lt!58680 (addApplyDifferent!78 lt!58672 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58681))))

(assert (=> b!113171 (= (apply!102 (+!154 lt!58672 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58681) (apply!102 lt!58672 lt!58681))))

(declare-fun b!113172 () Bool)

(assert (=> b!113172 (= e!73561 call!12201)))

(declare-fun b!113173 () Bool)

(declare-fun e!73557 () Bool)

(assert (=> b!113173 (= e!73554 e!73557)))

(declare-fun res!55778 () Bool)

(assert (=> b!113173 (= res!55778 call!12200)))

(assert (=> b!113173 (=> (not res!55778) (not e!73557))))

(declare-fun d!32143 () Bool)

(assert (=> d!32143 e!73551))

(declare-fun res!55775 () Bool)

(assert (=> d!32143 (=> (not res!55775) (not e!73551))))

(assert (=> d!32143 (= res!55775 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun lt!58678 () ListLongMap!1599)

(assert (=> d!32143 (= lt!58687 lt!58678)))

(declare-fun lt!58683 () Unit!3521)

(assert (=> d!32143 (= lt!58683 e!73558)))

(declare-fun c!20256 () Bool)

(declare-fun e!73560 () Bool)

(assert (=> d!32143 (= c!20256 e!73560)))

(declare-fun res!55777 () Bool)

(assert (=> d!32143 (=> (not res!55777) (not e!73560))))

(assert (=> d!32143 (= res!55777 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32143 (= lt!58678 e!73555)))

(assert (=> d!32143 (= c!20260 (and (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32143 (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32143 (= (getCurrentListMap!499 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) lt!58687)))

(declare-fun bm!12199 () Bool)

(assert (=> bm!12199 (= call!12204 call!12203)))

(declare-fun b!113174 () Bool)

(assert (=> b!113174 (= e!73557 (= (apply!102 lt!58687 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113175 () Bool)

(assert (=> b!113175 (= e!73552 e!73550)))

(declare-fun res!55779 () Bool)

(assert (=> b!113175 (=> (not res!55779) (not e!73550))))

(assert (=> b!113175 (= res!55779 (contains!846 lt!58687 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113175 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113176 () Bool)

(assert (=> b!113176 (= e!73559 call!12202)))

(declare-fun bm!12200 () Bool)

(assert (=> bm!12200 (= call!12199 (contains!846 lt!58687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113177 () Bool)

(assert (=> b!113177 (= e!73559 call!12201)))

(declare-fun b!113178 () Bool)

(assert (=> b!113178 (= e!73560 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113179 () Bool)

(assert (=> b!113179 (= e!73555 e!73561)))

(assert (=> b!113179 (= c!20258 (and (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12201 () Bool)

(assert (=> bm!12201 (= call!12203 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32143 c!20260) b!113167))

(assert (= (and d!32143 (not c!20260)) b!113179))

(assert (= (and b!113179 c!20258) b!113172))

(assert (= (and b!113179 (not c!20258)) b!113161))

(assert (= (and b!113161 c!20257) b!113177))

(assert (= (and b!113161 (not c!20257)) b!113176))

(assert (= (or b!113177 b!113176) bm!12197))

(assert (= (or b!113172 bm!12197) bm!12199))

(assert (= (or b!113172 b!113177) bm!12198))

(assert (= (or b!113167 bm!12199) bm!12201))

(assert (= (or b!113167 bm!12198) bm!12196))

(assert (= (and d!32143 res!55777) b!113178))

(assert (= (and d!32143 c!20256) b!113171))

(assert (= (and d!32143 (not c!20256)) b!113160))

(assert (= (and d!32143 res!55775) b!113162))

(assert (= (and b!113162 res!55780) b!113170))

(assert (= (and b!113162 (not res!55776)) b!113175))

(assert (= (and b!113175 res!55779) b!113168))

(assert (= (and b!113162 res!55781) b!113164))

(assert (= (and b!113164 c!20261) b!113163))

(assert (= (and b!113164 (not c!20261)) b!113165))

(assert (= (and b!113163 res!55782) b!113169))

(assert (= (or b!113163 b!113165) bm!12200))

(assert (= (and b!113164 res!55774) b!113159))

(assert (= (and b!113159 c!20259) b!113173))

(assert (= (and b!113159 (not c!20259)) b!113166))

(assert (= (and b!113173 res!55778) b!113174))

(assert (= (or b!113173 b!113166) bm!12195))

(declare-fun b_lambda!5065 () Bool)

(assert (=> (not b_lambda!5065) (not b!113168)))

(assert (=> b!113168 t!5810))

(declare-fun b_and!6955 () Bool)

(assert (= b_and!6951 (and (=> t!5810 result!3575) b_and!6955)))

(assert (=> b!113168 t!5812))

(declare-fun b_and!6957 () Bool)

(assert (= b_and!6953 (and (=> t!5812 result!3579) b_and!6957)))

(declare-fun m!129209 () Bool)

(assert (=> b!113171 m!129209))

(declare-fun m!129211 () Bool)

(assert (=> b!113171 m!129211))

(declare-fun m!129213 () Bool)

(assert (=> b!113171 m!129213))

(declare-fun m!129215 () Bool)

(assert (=> b!113171 m!129215))

(declare-fun m!129217 () Bool)

(assert (=> b!113171 m!129217))

(declare-fun m!129219 () Bool)

(assert (=> b!113171 m!129219))

(assert (=> b!113171 m!129213))

(declare-fun m!129221 () Bool)

(assert (=> b!113171 m!129221))

(declare-fun m!129223 () Bool)

(assert (=> b!113171 m!129223))

(declare-fun m!129225 () Bool)

(assert (=> b!113171 m!129225))

(declare-fun m!129227 () Bool)

(assert (=> b!113171 m!129227))

(assert (=> b!113171 m!128955))

(assert (=> b!113171 m!129217))

(declare-fun m!129229 () Bool)

(assert (=> b!113171 m!129229))

(declare-fun m!129231 () Bool)

(assert (=> b!113171 m!129231))

(assert (=> b!113171 m!129223))

(assert (=> b!113171 m!129219))

(declare-fun m!129233 () Bool)

(assert (=> b!113171 m!129233))

(declare-fun m!129235 () Bool)

(assert (=> b!113171 m!129235))

(assert (=> b!113171 m!129047))

(declare-fun m!129237 () Bool)

(assert (=> b!113171 m!129237))

(declare-fun m!129239 () Bool)

(assert (=> bm!12195 m!129239))

(assert (=> b!113170 m!129047))

(assert (=> b!113170 m!129047))

(assert (=> b!113170 m!129053))

(declare-fun m!129241 () Bool)

(assert (=> b!113167 m!129241))

(declare-fun m!129243 () Bool)

(assert (=> bm!12196 m!129243))

(assert (=> bm!12201 m!128955))

(declare-fun m!129245 () Bool)

(assert (=> b!113174 m!129245))

(assert (=> b!113178 m!129047))

(assert (=> b!113178 m!129047))

(assert (=> b!113178 m!129053))

(assert (=> d!32143 m!128953))

(assert (=> b!113175 m!129047))

(assert (=> b!113175 m!129047))

(declare-fun m!129247 () Bool)

(assert (=> b!113175 m!129247))

(declare-fun m!129249 () Bool)

(assert (=> bm!12200 m!129249))

(assert (=> b!113168 m!129047))

(declare-fun m!129251 () Bool)

(assert (=> b!113168 m!129251))

(assert (=> b!113168 m!128967))

(assert (=> b!113168 m!129037))

(assert (=> b!113168 m!129037))

(assert (=> b!113168 m!128967))

(assert (=> b!113168 m!129039))

(assert (=> b!113168 m!129047))

(declare-fun m!129253 () Bool)

(assert (=> b!113169 m!129253))

(assert (=> b!112817 d!32143))

(declare-fun b!113180 () Bool)

(declare-fun e!73565 () Bool)

(declare-fun e!73566 () Bool)

(assert (=> b!113180 (= e!73565 e!73566)))

(declare-fun res!55785 () Bool)

(assert (=> b!113180 (=> (not res!55785) (not e!73566))))

(declare-fun e!73563 () Bool)

(assert (=> b!113180 (= res!55785 (not e!73563))))

(declare-fun res!55784 () Bool)

(assert (=> b!113180 (=> (not res!55784) (not e!73563))))

(assert (=> b!113180 (= res!55784 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113181 () Bool)

(assert (=> b!113181 (= e!73563 (contains!848 Nil!1637 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113182 () Bool)

(declare-fun e!73564 () Bool)

(declare-fun call!12205 () Bool)

(assert (=> b!113182 (= e!73564 call!12205)))

(declare-fun d!32145 () Bool)

(declare-fun res!55783 () Bool)

(assert (=> d!32145 (=> res!55783 e!73565)))

(assert (=> d!32145 (= res!55783 (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32145 (= (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1637) e!73565)))

(declare-fun b!113183 () Bool)

(assert (=> b!113183 (= e!73564 call!12205)))

(declare-fun b!113184 () Bool)

(assert (=> b!113184 (= e!73566 e!73564)))

(declare-fun c!20262 () Bool)

(assert (=> b!113184 (= c!20262 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!12202 () Bool)

(assert (=> bm!12202 (= call!12205 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20262 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1637) Nil!1637)))))

(assert (= (and d!32145 (not res!55783)) b!113180))

(assert (= (and b!113180 res!55784) b!113181))

(assert (= (and b!113180 res!55785) b!113184))

(assert (= (and b!113184 c!20262) b!113182))

(assert (= (and b!113184 (not c!20262)) b!113183))

(assert (= (or b!113182 b!113183) bm!12202))

(assert (=> b!113180 m!129197))

(assert (=> b!113180 m!129197))

(assert (=> b!113180 m!129199))

(assert (=> b!113181 m!129197))

(assert (=> b!113181 m!129197))

(declare-fun m!129255 () Bool)

(assert (=> b!113181 m!129255))

(assert (=> b!113184 m!129197))

(assert (=> b!113184 m!129197))

(assert (=> b!113184 m!129199))

(assert (=> bm!12202 m!129197))

(declare-fun m!129257 () Bool)

(assert (=> bm!12202 m!129257))

(assert (=> b!112807 d!32145))

(declare-fun d!32147 () Bool)

(declare-fun res!55792 () Bool)

(declare-fun e!73569 () Bool)

(assert (=> d!32147 (=> (not res!55792) (not e!73569))))

(declare-fun simpleValid!78 (LongMapFixedSize!930) Bool)

(assert (=> d!32147 (= res!55792 (simpleValid!78 newMap!16))))

(assert (=> d!32147 (= (valid!437 newMap!16) e!73569)))

(declare-fun b!113191 () Bool)

(declare-fun res!55793 () Bool)

(assert (=> b!113191 (=> (not res!55793) (not e!73569))))

(declare-fun arrayCountValidKeys!0 (array!4417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!113191 (= res!55793 (= (arrayCountValidKeys!0 (_keys!4381 newMap!16) #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (_size!514 newMap!16)))))

(declare-fun b!113192 () Bool)

(declare-fun res!55794 () Bool)

(assert (=> b!113192 (=> (not res!55794) (not e!73569))))

(assert (=> b!113192 (= res!55794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun b!113193 () Bool)

(assert (=> b!113193 (= e!73569 (arrayNoDuplicates!0 (_keys!4381 newMap!16) #b00000000000000000000000000000000 Nil!1637))))

(assert (= (and d!32147 res!55792) b!113191))

(assert (= (and b!113191 res!55793) b!113192))

(assert (= (and b!113192 res!55794) b!113193))

(declare-fun m!129259 () Bool)

(assert (=> d!32147 m!129259))

(declare-fun m!129261 () Bool)

(assert (=> b!113191 m!129261))

(declare-fun m!129263 () Bool)

(assert (=> b!113192 m!129263))

(declare-fun m!129265 () Bool)

(assert (=> b!113193 m!129265))

(assert (=> b!112821 d!32147))

(declare-fun d!32149 () Bool)

(declare-fun c!20265 () Bool)

(assert (=> d!32149 (= c!20265 ((_ is ValueCellFull!1011) (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73572 () V!3259)

(assert (=> d!32149 (= (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73572)))

(declare-fun b!113198 () Bool)

(declare-fun get!1362 (ValueCell!1011 V!3259) V!3259)

(assert (=> b!113198 (= e!73572 (get!1362 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113199 () Bool)

(declare-fun get!1363 (ValueCell!1011 V!3259) V!3259)

(assert (=> b!113199 (= e!73572 (get!1363 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32149 c!20265) b!113198))

(assert (= (and d!32149 (not c!20265)) b!113199))

(assert (=> b!113198 m!128965))

(assert (=> b!113198 m!128967))

(declare-fun m!129267 () Bool)

(assert (=> b!113198 m!129267))

(assert (=> b!113199 m!128965))

(assert (=> b!113199 m!128967))

(declare-fun m!129269 () Bool)

(assert (=> b!113199 m!129269))

(assert (=> b!112806 d!32149))

(declare-fun b!113206 () Bool)

(declare-fun e!73577 () Bool)

(assert (=> b!113206 (= e!73577 tp_is_empty!2709)))

(declare-fun mapIsEmpty!4059 () Bool)

(declare-fun mapRes!4059 () Bool)

(assert (=> mapIsEmpty!4059 mapRes!4059))

(declare-fun mapNonEmpty!4059 () Bool)

(declare-fun tp!10125 () Bool)

(assert (=> mapNonEmpty!4059 (= mapRes!4059 (and tp!10125 e!73577))))

(declare-fun mapRest!4059 () (Array (_ BitVec 32) ValueCell!1011))

(declare-fun mapKey!4059 () (_ BitVec 32))

(declare-fun mapValue!4059 () ValueCell!1011)

(assert (=> mapNonEmpty!4059 (= mapRest!4050 (store mapRest!4059 mapKey!4059 mapValue!4059))))

(declare-fun b!113207 () Bool)

(declare-fun e!73578 () Bool)

(assert (=> b!113207 (= e!73578 tp_is_empty!2709)))

(declare-fun condMapEmpty!4059 () Bool)

(declare-fun mapDefault!4059 () ValueCell!1011)

(assert (=> mapNonEmpty!4050 (= condMapEmpty!4059 (= mapRest!4050 ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4059)))))

(assert (=> mapNonEmpty!4050 (= tp!10109 (and e!73578 mapRes!4059))))

(assert (= (and mapNonEmpty!4050 condMapEmpty!4059) mapIsEmpty!4059))

(assert (= (and mapNonEmpty!4050 (not condMapEmpty!4059)) mapNonEmpty!4059))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1011) mapValue!4059)) b!113206))

(assert (= (and mapNonEmpty!4050 ((_ is ValueCellFull!1011) mapDefault!4059)) b!113207))

(declare-fun m!129271 () Bool)

(assert (=> mapNonEmpty!4059 m!129271))

(declare-fun b!113208 () Bool)

(declare-fun e!73579 () Bool)

(assert (=> b!113208 (= e!73579 tp_is_empty!2709)))

(declare-fun mapIsEmpty!4060 () Bool)

(declare-fun mapRes!4060 () Bool)

(assert (=> mapIsEmpty!4060 mapRes!4060))

(declare-fun mapNonEmpty!4060 () Bool)

(declare-fun tp!10126 () Bool)

(assert (=> mapNonEmpty!4060 (= mapRes!4060 (and tp!10126 e!73579))))

(declare-fun mapKey!4060 () (_ BitVec 32))

(declare-fun mapValue!4060 () ValueCell!1011)

(declare-fun mapRest!4060 () (Array (_ BitVec 32) ValueCell!1011))

(assert (=> mapNonEmpty!4060 (= mapRest!4049 (store mapRest!4060 mapKey!4060 mapValue!4060))))

(declare-fun b!113209 () Bool)

(declare-fun e!73580 () Bool)

(assert (=> b!113209 (= e!73580 tp_is_empty!2709)))

(declare-fun condMapEmpty!4060 () Bool)

(declare-fun mapDefault!4060 () ValueCell!1011)

(assert (=> mapNonEmpty!4049 (= condMapEmpty!4060 (= mapRest!4049 ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4060)))))

(assert (=> mapNonEmpty!4049 (= tp!10108 (and e!73580 mapRes!4060))))

(assert (= (and mapNonEmpty!4049 condMapEmpty!4060) mapIsEmpty!4060))

(assert (= (and mapNonEmpty!4049 (not condMapEmpty!4060)) mapNonEmpty!4060))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1011) mapValue!4060)) b!113208))

(assert (= (and mapNonEmpty!4049 ((_ is ValueCellFull!1011) mapDefault!4060)) b!113209))

(declare-fun m!129273 () Bool)

(assert (=> mapNonEmpty!4060 m!129273))

(declare-fun b_lambda!5067 () Bool)

(assert (= b_lambda!5061 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5067)))

(declare-fun b_lambda!5069 () Bool)

(assert (= b_lambda!5065 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5069)))

(declare-fun b_lambda!5071 () Bool)

(assert (= b_lambda!5063 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5071)))

(check-sat (not bm!12102) (not d!32131) (not d!32119) (not b!113114) (not b!112922) (not b!113181) (not b!113171) (not b!112941) (not b!113062) (not b!112921) (not b!112929) (not b!112949) (not b!113169) (not d!32103) (not bm!12152) (not b!113168) (not b!113199) (not b!113068) (not d!32109) (not bm!12158) b_and!6957 (not b!113170) (not b!113193) (not bm!12202) (not b!112936) (not b!112926) (not bm!12161) (not d!32107) (not b!113044) (not d!32141) (not d!32105) (not b!113178) (not bm!12171) (not bm!12168) (not bm!12153) (not b_lambda!5067) (not d!32101) (not b!112920) (not d!32111) (not b!113104) (not b!112930) (not bm!12195) (not b_next!2587) (not b!113040) (not b!113083) tp_is_empty!2709 (not b!112935) (not d!32117) (not d!32129) (not bm!12170) (not b_lambda!5069) (not d!32135) (not b!113198) (not mapNonEmpty!4060) (not b!112937) (not b!113039) (not b!112939) (not b!113063) (not b!113101) (not bm!12200) (not b!113184) (not bm!12166) (not b!113191) (not bm!12201) (not b!113174) (not d!32147) (not b!112942) (not mapNonEmpty!4059) (not b!112925) (not b!113088) (not b!113070) (not d!32143) b_and!6955 (not b!113116) (not b_next!2585) (not b!113175) (not bm!12196) (not bm!12163) (not b!113100) (not bm!12177) (not b!112938) (not bm!12169) (not b!112951) (not bm!12159) (not b!113192) (not b_lambda!5059) (not b!113180) (not b!112923) (not b!113167) (not d!32113) (not b_lambda!5071) (not b!112940) (not b!113056) (not bm!12180) (not bm!12162))
(check-sat b_and!6955 b_and!6957 (not b_next!2585) (not b_next!2587))
(get-model)

(declare-fun d!32151 () Bool)

(declare-fun lt!58694 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!117 (List!1640) (InoxSet (_ BitVec 64)))

(assert (=> d!32151 (= lt!58694 (select (content!117 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73586 () Bool)

(assert (=> d!32151 (= lt!58694 e!73586)))

(declare-fun res!55799 () Bool)

(assert (=> d!32151 (=> (not res!55799) (not e!73586))))

(assert (=> d!32151 (= res!55799 ((_ is Cons!1636) Nil!1637))))

(assert (=> d!32151 (= (contains!848 Nil!1637 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58694)))

(declare-fun b!113214 () Bool)

(declare-fun e!73585 () Bool)

(assert (=> b!113214 (= e!73586 e!73585)))

(declare-fun res!55800 () Bool)

(assert (=> b!113214 (=> res!55800 e!73585)))

(assert (=> b!113214 (= res!55800 (= (h!2236 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113215 () Bool)

(assert (=> b!113215 (= e!73585 (contains!848 (t!5814 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32151 res!55799) b!113214))

(assert (= (and b!113214 (not res!55800)) b!113215))

(declare-fun m!129275 () Bool)

(assert (=> d!32151 m!129275))

(assert (=> d!32151 m!128915))

(declare-fun m!129277 () Bool)

(assert (=> d!32151 m!129277))

(assert (=> b!113215 m!128915))

(declare-fun m!129279 () Bool)

(assert (=> b!113215 m!129279))

(assert (=> b!113101 d!32151))

(declare-fun d!32153 () Bool)

(declare-fun res!55801 () Bool)

(declare-fun e!73587 () Bool)

(assert (=> d!32153 (=> (not res!55801) (not e!73587))))

(assert (=> d!32153 (= res!55801 (simpleValid!78 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32153 (= (valid!437 (v!2959 (underlying!376 thiss!992))) e!73587)))

(declare-fun b!113216 () Bool)

(declare-fun res!55802 () Bool)

(assert (=> b!113216 (=> (not res!55802) (not e!73587))))

(assert (=> b!113216 (= res!55802 (= (arrayCountValidKeys!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))) (_size!514 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113217 () Bool)

(declare-fun res!55803 () Bool)

(assert (=> b!113217 (=> (not res!55803) (not e!73587))))

(assert (=> b!113217 (= res!55803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113218 () Bool)

(assert (=> b!113218 (= e!73587 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1637))))

(assert (= (and d!32153 res!55801) b!113216))

(assert (= (and b!113216 res!55802) b!113217))

(assert (= (and b!113217 res!55803) b!113218))

(declare-fun m!129281 () Bool)

(assert (=> d!32153 m!129281))

(declare-fun m!129283 () Bool)

(assert (=> b!113216 m!129283))

(assert (=> b!113217 m!128913))

(assert (=> b!113218 m!128935))

(assert (=> d!32101 d!32153))

(declare-fun b!113232 () Bool)

(declare-fun e!73595 () SeekEntryResult!263)

(declare-fun lt!58701 () SeekEntryResult!263)

(assert (=> b!113232 (= e!73595 (Found!263 (index!3206 lt!58701)))))

(declare-fun b!113233 () Bool)

(declare-fun e!73596 () SeekEntryResult!263)

(assert (=> b!113233 (= e!73596 (MissingZero!263 (index!3206 lt!58701)))))

(declare-fun b!113234 () Bool)

(declare-fun e!73594 () SeekEntryResult!263)

(assert (=> b!113234 (= e!73594 e!73595)))

(declare-fun lt!58702 () (_ BitVec 64))

(assert (=> b!113234 (= lt!58702 (select (arr!2093 (_keys!4381 newMap!16)) (index!3206 lt!58701)))))

(declare-fun c!20273 () Bool)

(assert (=> b!113234 (= c!20273 (= lt!58702 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113235 () Bool)

(declare-fun c!20274 () Bool)

(assert (=> b!113235 (= c!20274 (= lt!58702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113235 (= e!73595 e!73596)))

(declare-fun b!113236 () Bool)

(assert (=> b!113236 (= e!73594 Undefined!263)))

(declare-fun d!32155 () Bool)

(declare-fun lt!58703 () SeekEntryResult!263)

(assert (=> d!32155 (and (or ((_ is Undefined!263) lt!58703) (not ((_ is Found!263) lt!58703)) (and (bvsge (index!3205 lt!58703) #b00000000000000000000000000000000) (bvslt (index!3205 lt!58703) (size!2352 (_keys!4381 newMap!16))))) (or ((_ is Undefined!263) lt!58703) ((_ is Found!263) lt!58703) (not ((_ is MissingZero!263) lt!58703)) (and (bvsge (index!3204 lt!58703) #b00000000000000000000000000000000) (bvslt (index!3204 lt!58703) (size!2352 (_keys!4381 newMap!16))))) (or ((_ is Undefined!263) lt!58703) ((_ is Found!263) lt!58703) ((_ is MissingZero!263) lt!58703) (not ((_ is MissingVacant!263) lt!58703)) (and (bvsge (index!3207 lt!58703) #b00000000000000000000000000000000) (bvslt (index!3207 lt!58703) (size!2352 (_keys!4381 newMap!16))))) (or ((_ is Undefined!263) lt!58703) (ite ((_ is Found!263) lt!58703) (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58703)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (ite ((_ is MissingZero!263) lt!58703) (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3204 lt!58703)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!263) lt!58703) (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3207 lt!58703)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32155 (= lt!58703 e!73594)))

(declare-fun c!20272 () Bool)

(assert (=> d!32155 (= c!20272 (and ((_ is Intermediate!263) lt!58701) (undefined!1075 lt!58701)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4417 (_ BitVec 32)) SeekEntryResult!263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!32155 (= lt!58701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (mask!6845 newMap!16)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(assert (=> d!32155 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32155 (= (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)) lt!58703)))

(declare-fun b!113231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4417 (_ BitVec 32)) SeekEntryResult!263)

(assert (=> b!113231 (= e!73596 (seekKeyOrZeroReturnVacant!0 (x!14184 lt!58701) (index!3206 lt!58701) (index!3206 lt!58701) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(assert (= (and d!32155 c!20272) b!113236))

(assert (= (and d!32155 (not c!20272)) b!113234))

(assert (= (and b!113234 c!20273) b!113232))

(assert (= (and b!113234 (not c!20273)) b!113235))

(assert (= (and b!113235 c!20274) b!113233))

(assert (= (and b!113235 (not c!20274)) b!113231))

(declare-fun m!129285 () Bool)

(assert (=> b!113234 m!129285))

(declare-fun m!129287 () Bool)

(assert (=> d!32155 m!129287))

(assert (=> d!32155 m!128915))

(declare-fun m!129289 () Bool)

(assert (=> d!32155 m!129289))

(assert (=> d!32155 m!128915))

(assert (=> d!32155 m!129287))

(declare-fun m!129291 () Bool)

(assert (=> d!32155 m!129291))

(declare-fun m!129293 () Bool)

(assert (=> d!32155 m!129293))

(declare-fun m!129295 () Bool)

(assert (=> d!32155 m!129295))

(declare-fun m!129297 () Bool)

(assert (=> d!32155 m!129297))

(assert (=> b!113231 m!128915))

(declare-fun m!129299 () Bool)

(assert (=> b!113231 m!129299))

(assert (=> b!113056 d!32155))

(declare-fun d!32157 () Bool)

(declare-fun get!1364 (Option!166) V!3259)

(assert (=> d!32157 (= (apply!102 lt!58687 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1364 (getValueByKey!160 (toList!815 lt!58687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4647 () Bool)

(assert (= bs!4647 d!32157))

(declare-fun m!129301 () Bool)

(assert (=> bs!4647 m!129301))

(assert (=> bs!4647 m!129301))

(declare-fun m!129303 () Bool)

(assert (=> bs!4647 m!129303))

(assert (=> b!113174 d!32157))

(declare-fun d!32159 () Bool)

(assert (=> d!32159 (= (+!154 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) lt!58600 lt!58428 (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58706 () Unit!3521)

(declare-fun choose!712 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 V!3259 Int) Unit!3521)

(assert (=> d!32159 (= lt!58706 (choose!712 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58600 (zeroValue!2529 newMap!16) lt!58428 (minValue!2529 newMap!16) (defaultEntry!2661 newMap!16)))))

(assert (=> d!32159 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32159 (= (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58600 (zeroValue!2529 newMap!16) lt!58428 (minValue!2529 newMap!16) (defaultEntry!2661 newMap!16)) lt!58706)))

(declare-fun bs!4648 () Bool)

(assert (= bs!4648 d!32159))

(assert (=> bs!4648 m!129133))

(declare-fun m!129305 () Bool)

(assert (=> bs!4648 m!129305))

(assert (=> bs!4648 m!129295))

(declare-fun m!129307 () Bool)

(assert (=> bs!4648 m!129307))

(assert (=> bs!4648 m!129133))

(declare-fun m!129309 () Bool)

(assert (=> bs!4648 m!129309))

(assert (=> b!113070 d!32159))

(declare-fun d!32161 () Bool)

(declare-fun e!73597 () Bool)

(assert (=> d!32161 e!73597))

(declare-fun res!55804 () Bool)

(assert (=> d!32161 (=> res!55804 e!73597)))

(declare-fun lt!58707 () Bool)

(assert (=> d!32161 (= res!55804 (not lt!58707))))

(declare-fun lt!58710 () Bool)

(assert (=> d!32161 (= lt!58707 lt!58710)))

(declare-fun lt!58709 () Unit!3521)

(declare-fun e!73598 () Unit!3521)

(assert (=> d!32161 (= lt!58709 e!73598)))

(declare-fun c!20275 () Bool)

(assert (=> d!32161 (= c!20275 lt!58710)))

(assert (=> d!32161 (= lt!58710 (containsKey!164 (toList!815 lt!58487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32161 (= (contains!846 lt!58487 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58707)))

(declare-fun b!113237 () Bool)

(declare-fun lt!58708 () Unit!3521)

(assert (=> b!113237 (= e!73598 lt!58708)))

(assert (=> b!113237 (= lt!58708 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113237 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113238 () Bool)

(declare-fun Unit!3529 () Unit!3521)

(assert (=> b!113238 (= e!73598 Unit!3529)))

(declare-fun b!113239 () Bool)

(assert (=> b!113239 (= e!73597 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32161 c!20275) b!113237))

(assert (= (and d!32161 (not c!20275)) b!113238))

(assert (= (and d!32161 (not res!55804)) b!113239))

(declare-fun m!129311 () Bool)

(assert (=> d!32161 m!129311))

(declare-fun m!129313 () Bool)

(assert (=> b!113237 m!129313))

(declare-fun m!129315 () Bool)

(assert (=> b!113237 m!129315))

(assert (=> b!113237 m!129315))

(declare-fun m!129317 () Bool)

(assert (=> b!113237 m!129317))

(assert (=> b!113239 m!129315))

(assert (=> b!113239 m!129315))

(assert (=> b!113239 m!129317))

(assert (=> b!112930 d!32161))

(declare-fun d!32163 () Bool)

(declare-fun e!73599 () Bool)

(assert (=> d!32163 e!73599))

(declare-fun res!55805 () Bool)

(assert (=> d!32163 (=> res!55805 e!73599)))

(declare-fun lt!58711 () Bool)

(assert (=> d!32163 (= res!55805 (not lt!58711))))

(declare-fun lt!58714 () Bool)

(assert (=> d!32163 (= lt!58711 lt!58714)))

(declare-fun lt!58713 () Unit!3521)

(declare-fun e!73600 () Unit!3521)

(assert (=> d!32163 (= lt!58713 e!73600)))

(declare-fun c!20276 () Bool)

(assert (=> d!32163 (= c!20276 lt!58714)))

(assert (=> d!32163 (= lt!58714 (containsKey!164 (toList!815 lt!58504) (_1!1238 lt!58423)))))

(assert (=> d!32163 (= (contains!846 lt!58504 (_1!1238 lt!58423)) lt!58711)))

(declare-fun b!113240 () Bool)

(declare-fun lt!58712 () Unit!3521)

(assert (=> b!113240 (= e!73600 lt!58712)))

(assert (=> b!113240 (= lt!58712 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58504) (_1!1238 lt!58423)))))

(assert (=> b!113240 (isDefined!113 (getValueByKey!160 (toList!815 lt!58504) (_1!1238 lt!58423)))))

(declare-fun b!113241 () Bool)

(declare-fun Unit!3530 () Unit!3521)

(assert (=> b!113241 (= e!73600 Unit!3530)))

(declare-fun b!113242 () Bool)

(assert (=> b!113242 (= e!73599 (isDefined!113 (getValueByKey!160 (toList!815 lt!58504) (_1!1238 lt!58423))))))

(assert (= (and d!32163 c!20276) b!113240))

(assert (= (and d!32163 (not c!20276)) b!113241))

(assert (= (and d!32163 (not res!55805)) b!113242))

(declare-fun m!129319 () Bool)

(assert (=> d!32163 m!129319))

(declare-fun m!129321 () Bool)

(assert (=> b!113240 m!129321))

(assert (=> b!113240 m!129091))

(assert (=> b!113240 m!129091))

(declare-fun m!129323 () Bool)

(assert (=> b!113240 m!129323))

(assert (=> b!113242 m!129091))

(assert (=> b!113242 m!129091))

(assert (=> b!113242 m!129323))

(assert (=> d!32109 d!32163))

(declare-fun b!113252 () Bool)

(declare-fun e!73605 () Option!166)

(declare-fun e!73606 () Option!166)

(assert (=> b!113252 (= e!73605 e!73606)))

(declare-fun c!20282 () Bool)

(assert (=> b!113252 (= c!20282 (and ((_ is Cons!1635) lt!58505) (not (= (_1!1238 (h!2235 lt!58505)) (_1!1238 lt!58423)))))))

(declare-fun d!32165 () Bool)

(declare-fun c!20281 () Bool)

(assert (=> d!32165 (= c!20281 (and ((_ is Cons!1635) lt!58505) (= (_1!1238 (h!2235 lt!58505)) (_1!1238 lt!58423))))))

(assert (=> d!32165 (= (getValueByKey!160 lt!58505 (_1!1238 lt!58423)) e!73605)))

(declare-fun b!113253 () Bool)

(assert (=> b!113253 (= e!73606 (getValueByKey!160 (t!5813 lt!58505) (_1!1238 lt!58423)))))

(declare-fun b!113254 () Bool)

(assert (=> b!113254 (= e!73606 None!164)))

(declare-fun b!113251 () Bool)

(assert (=> b!113251 (= e!73605 (Some!165 (_2!1238 (h!2235 lt!58505))))))

(assert (= (and d!32165 c!20281) b!113251))

(assert (= (and d!32165 (not c!20281)) b!113252))

(assert (= (and b!113252 c!20282) b!113253))

(assert (= (and b!113252 (not c!20282)) b!113254))

(declare-fun m!129325 () Bool)

(assert (=> b!113253 m!129325))

(assert (=> d!32109 d!32165))

(declare-fun d!32167 () Bool)

(assert (=> d!32167 (= (getValueByKey!160 lt!58505 (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423)))))

(declare-fun lt!58717 () Unit!3521)

(declare-fun choose!713 (List!1639 (_ BitVec 64) V!3259) Unit!3521)

(assert (=> d!32167 (= lt!58717 (choose!713 lt!58505 (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(declare-fun e!73609 () Bool)

(assert (=> d!32167 e!73609))

(declare-fun res!55810 () Bool)

(assert (=> d!32167 (=> (not res!55810) (not e!73609))))

(declare-fun isStrictlySorted!313 (List!1639) Bool)

(assert (=> d!32167 (= res!55810 (isStrictlySorted!313 lt!58505))))

(assert (=> d!32167 (= (lemmaContainsTupThenGetReturnValue!76 lt!58505 (_1!1238 lt!58423) (_2!1238 lt!58423)) lt!58717)))

(declare-fun b!113259 () Bool)

(declare-fun res!55811 () Bool)

(assert (=> b!113259 (=> (not res!55811) (not e!73609))))

(assert (=> b!113259 (= res!55811 (containsKey!164 lt!58505 (_1!1238 lt!58423)))))

(declare-fun b!113260 () Bool)

(assert (=> b!113260 (= e!73609 (contains!847 lt!58505 (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423))))))

(assert (= (and d!32167 res!55810) b!113259))

(assert (= (and b!113259 res!55811) b!113260))

(assert (=> d!32167 m!129085))

(declare-fun m!129327 () Bool)

(assert (=> d!32167 m!129327))

(declare-fun m!129329 () Bool)

(assert (=> d!32167 m!129329))

(declare-fun m!129331 () Bool)

(assert (=> b!113259 m!129331))

(declare-fun m!129333 () Bool)

(assert (=> b!113260 m!129333))

(assert (=> d!32109 d!32167))

(declare-fun bm!12209 () Bool)

(declare-fun call!12212 () List!1639)

(declare-fun call!12214 () List!1639)

(assert (=> bm!12209 (= call!12212 call!12214)))

(declare-fun b!113281 () Bool)

(declare-fun c!20294 () Bool)

(assert (=> b!113281 (= c!20294 (and ((_ is Cons!1635) (toList!815 lt!58429)) (bvsgt (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58423))))))

(declare-fun e!73623 () List!1639)

(declare-fun e!73624 () List!1639)

(assert (=> b!113281 (= e!73623 e!73624)))

(declare-fun b!113282 () Bool)

(assert (=> b!113282 (= e!73623 call!12212)))

(declare-fun b!113283 () Bool)

(declare-fun call!12213 () List!1639)

(assert (=> b!113283 (= e!73624 call!12213)))

(declare-fun b!113284 () Bool)

(declare-fun e!73621 () List!1639)

(assert (=> b!113284 (= e!73621 (insertStrictlySorted!79 (t!5813 (toList!815 lt!58429)) (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(declare-fun d!32169 () Bool)

(declare-fun e!73620 () Bool)

(assert (=> d!32169 e!73620))

(declare-fun res!55817 () Bool)

(assert (=> d!32169 (=> (not res!55817) (not e!73620))))

(declare-fun lt!58720 () List!1639)

(assert (=> d!32169 (= res!55817 (isStrictlySorted!313 lt!58720))))

(declare-fun e!73622 () List!1639)

(assert (=> d!32169 (= lt!58720 e!73622)))

(declare-fun c!20293 () Bool)

(assert (=> d!32169 (= c!20293 (and ((_ is Cons!1635) (toList!815 lt!58429)) (bvslt (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58423))))))

(assert (=> d!32169 (isStrictlySorted!313 (toList!815 lt!58429))))

(assert (=> d!32169 (= (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 lt!58423) (_2!1238 lt!58423)) lt!58720)))

(declare-fun bm!12210 () Bool)

(assert (=> bm!12210 (= call!12213 call!12212)))

(declare-fun b!113285 () Bool)

(declare-fun res!55816 () Bool)

(assert (=> b!113285 (=> (not res!55816) (not e!73620))))

(assert (=> b!113285 (= res!55816 (containsKey!164 lt!58720 (_1!1238 lt!58423)))))

(declare-fun b!113286 () Bool)

(assert (=> b!113286 (= e!73624 call!12213)))

(declare-fun bm!12211 () Bool)

(declare-fun $colon$colon!85 (List!1639 tuple2!2454) List!1639)

(assert (=> bm!12211 (= call!12214 ($colon$colon!85 e!73621 (ite c!20293 (h!2235 (toList!815 lt!58429)) (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423)))))))

(declare-fun c!20291 () Bool)

(assert (=> bm!12211 (= c!20291 c!20293)))

(declare-fun b!113287 () Bool)

(assert (=> b!113287 (= e!73622 call!12214)))

(declare-fun c!20292 () Bool)

(declare-fun b!113288 () Bool)

(assert (=> b!113288 (= e!73621 (ite c!20292 (t!5813 (toList!815 lt!58429)) (ite c!20294 (Cons!1635 (h!2235 (toList!815 lt!58429)) (t!5813 (toList!815 lt!58429))) Nil!1636)))))

(declare-fun b!113289 () Bool)

(assert (=> b!113289 (= e!73622 e!73623)))

(assert (=> b!113289 (= c!20292 (and ((_ is Cons!1635) (toList!815 lt!58429)) (= (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58423))))))

(declare-fun b!113290 () Bool)

(assert (=> b!113290 (= e!73620 (contains!847 lt!58720 (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423))))))

(assert (= (and d!32169 c!20293) b!113287))

(assert (= (and d!32169 (not c!20293)) b!113289))

(assert (= (and b!113289 c!20292) b!113282))

(assert (= (and b!113289 (not c!20292)) b!113281))

(assert (= (and b!113281 c!20294) b!113283))

(assert (= (and b!113281 (not c!20294)) b!113286))

(assert (= (or b!113283 b!113286) bm!12210))

(assert (= (or b!113282 bm!12210) bm!12209))

(assert (= (or b!113287 bm!12209) bm!12211))

(assert (= (and bm!12211 c!20291) b!113284))

(assert (= (and bm!12211 (not c!20291)) b!113288))

(assert (= (and d!32169 res!55817) b!113285))

(assert (= (and b!113285 res!55816) b!113290))

(declare-fun m!129335 () Bool)

(assert (=> b!113290 m!129335))

(declare-fun m!129337 () Bool)

(assert (=> b!113285 m!129337))

(declare-fun m!129339 () Bool)

(assert (=> bm!12211 m!129339))

(declare-fun m!129341 () Bool)

(assert (=> b!113284 m!129341))

(declare-fun m!129343 () Bool)

(assert (=> d!32169 m!129343))

(declare-fun m!129345 () Bool)

(assert (=> d!32169 m!129345))

(assert (=> d!32109 d!32169))

(declare-fun d!32171 () Bool)

(assert (=> d!32171 (= (get!1363 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113199 d!32171))

(declare-fun d!32173 () Bool)

(declare-fun e!73625 () Bool)

(assert (=> d!32173 e!73625))

(declare-fun res!55818 () Bool)

(assert (=> d!32173 (=> res!55818 e!73625)))

(declare-fun lt!58721 () Bool)

(assert (=> d!32173 (= res!55818 (not lt!58721))))

(declare-fun lt!58724 () Bool)

(assert (=> d!32173 (= lt!58721 lt!58724)))

(declare-fun lt!58723 () Unit!3521)

(declare-fun e!73626 () Unit!3521)

(assert (=> d!32173 (= lt!58723 e!73626)))

(declare-fun c!20295 () Bool)

(assert (=> d!32173 (= c!20295 lt!58724)))

(assert (=> d!32173 (= lt!58724 (containsKey!164 (toList!815 lt!58687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32173 (= (contains!846 lt!58687 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58721)))

(declare-fun b!113291 () Bool)

(declare-fun lt!58722 () Unit!3521)

(assert (=> b!113291 (= e!73626 lt!58722)))

(assert (=> b!113291 (= lt!58722 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113291 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113292 () Bool)

(declare-fun Unit!3531 () Unit!3521)

(assert (=> b!113292 (= e!73626 Unit!3531)))

(declare-fun b!113293 () Bool)

(assert (=> b!113293 (= e!73625 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32173 c!20295) b!113291))

(assert (= (and d!32173 (not c!20295)) b!113292))

(assert (= (and d!32173 (not res!55818)) b!113293))

(declare-fun m!129347 () Bool)

(assert (=> d!32173 m!129347))

(declare-fun m!129349 () Bool)

(assert (=> b!113291 m!129349))

(assert (=> b!113291 m!129301))

(assert (=> b!113291 m!129301))

(declare-fun m!129351 () Bool)

(assert (=> b!113291 m!129351))

(assert (=> b!113293 m!129301))

(assert (=> b!113293 m!129301))

(assert (=> b!113293 m!129351))

(assert (=> bm!12195 d!32173))

(declare-fun b!113294 () Bool)

(declare-fun e!73628 () Bool)

(declare-fun e!73631 () Bool)

(assert (=> b!113294 (= e!73628 e!73631)))

(declare-fun c!20299 () Bool)

(assert (=> b!113294 (= c!20299 (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113295 () Bool)

(declare-fun e!73635 () Unit!3521)

(declare-fun Unit!3532 () Unit!3521)

(assert (=> b!113295 (= e!73635 Unit!3532)))

(declare-fun c!20297 () Bool)

(declare-fun b!113296 () Bool)

(assert (=> b!113296 (= c!20297 (and (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73638 () ListLongMap!1599)

(declare-fun e!73636 () ListLongMap!1599)

(assert (=> b!113296 (= e!73638 e!73636)))

(declare-fun bm!12212 () Bool)

(declare-fun call!12217 () Bool)

(declare-fun lt!58742 () ListLongMap!1599)

(assert (=> bm!12212 (= call!12217 (contains!846 lt!58742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113297 () Bool)

(declare-fun res!55826 () Bool)

(assert (=> b!113297 (=> (not res!55826) (not e!73628))))

(declare-fun e!73629 () Bool)

(assert (=> b!113297 (= res!55826 e!73629)))

(declare-fun res!55821 () Bool)

(assert (=> b!113297 (=> res!55821 e!73629)))

(declare-fun e!73633 () Bool)

(assert (=> b!113297 (= res!55821 (not e!73633))))

(declare-fun res!55825 () Bool)

(assert (=> b!113297 (=> (not res!55825) (not e!73633))))

(assert (=> b!113297 (= res!55825 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun c!20300 () Bool)

(declare-fun c!20298 () Bool)

(declare-fun bm!12213 () Bool)

(declare-fun call!12215 () ListLongMap!1599)

(declare-fun call!12221 () ListLongMap!1599)

(declare-fun call!12219 () ListLongMap!1599)

(declare-fun call!12220 () ListLongMap!1599)

(assert (=> bm!12213 (= call!12215 (+!154 (ite c!20300 call!12220 (ite c!20298 call!12221 call!12219)) (ite (or c!20300 c!20298) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16))))))))

(declare-fun b!113298 () Bool)

(declare-fun e!73630 () Bool)

(declare-fun e!73639 () Bool)

(assert (=> b!113298 (= e!73630 e!73639)))

(declare-fun res!55827 () Bool)

(declare-fun call!12216 () Bool)

(assert (=> b!113298 (= res!55827 call!12216)))

(assert (=> b!113298 (=> (not res!55827) (not e!73639))))

(declare-fun b!113299 () Bool)

(declare-fun res!55819 () Bool)

(assert (=> b!113299 (=> (not res!55819) (not e!73628))))

(assert (=> b!113299 (= res!55819 e!73630)))

(declare-fun c!20301 () Bool)

(assert (=> b!113299 (= c!20301 (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!113300 () Bool)

(assert (=> b!113300 (= e!73630 (not call!12216))))

(declare-fun b!113301 () Bool)

(assert (=> b!113301 (= e!73631 (not call!12217))))

(declare-fun bm!12214 () Bool)

(assert (=> bm!12214 (= call!12219 call!12221)))

(declare-fun e!73632 () ListLongMap!1599)

(declare-fun b!113302 () Bool)

(assert (=> b!113302 (= e!73632 (+!154 call!12215 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)))))))

(declare-fun bm!12215 () Bool)

(declare-fun call!12218 () ListLongMap!1599)

(assert (=> bm!12215 (= call!12218 call!12215)))

(declare-fun e!73627 () Bool)

(declare-fun b!113303 () Bool)

(assert (=> b!113303 (= e!73627 (= (apply!102 lt!58742 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)) (get!1361 (select (arr!2094 (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2661 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2353 (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))))))))

(assert (=> b!113303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113304 () Bool)

(assert (=> b!113304 (= e!73639 (= (apply!102 lt!58742 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16))))))

(declare-fun b!113305 () Bool)

(assert (=> b!113305 (= e!73633 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113306 () Bool)

(declare-fun lt!58735 () Unit!3521)

(assert (=> b!113306 (= e!73635 lt!58735)))

(declare-fun lt!58725 () ListLongMap!1599)

(assert (=> b!113306 (= lt!58725 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58737 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58737 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58743 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58743 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58728 () Unit!3521)

(assert (=> b!113306 (= lt!58728 (addStillContains!78 lt!58725 lt!58737 (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) lt!58743))))

(assert (=> b!113306 (contains!846 (+!154 lt!58725 (tuple2!2455 lt!58737 (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)))) lt!58743)))

(declare-fun lt!58730 () Unit!3521)

(assert (=> b!113306 (= lt!58730 lt!58728)))

(declare-fun lt!58739 () ListLongMap!1599)

(assert (=> b!113306 (= lt!58739 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58741 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58744 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58744 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58745 () Unit!3521)

(assert (=> b!113306 (= lt!58745 (addApplyDifferent!78 lt!58739 lt!58741 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) lt!58744))))

(assert (=> b!113306 (= (apply!102 (+!154 lt!58739 (tuple2!2455 lt!58741 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)))) lt!58744) (apply!102 lt!58739 lt!58744))))

(declare-fun lt!58731 () Unit!3521)

(assert (=> b!113306 (= lt!58731 lt!58745)))

(declare-fun lt!58734 () ListLongMap!1599)

(assert (=> b!113306 (= lt!58734 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58726 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58732 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58732 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58740 () Unit!3521)

(assert (=> b!113306 (= lt!58740 (addApplyDifferent!78 lt!58734 lt!58726 (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) lt!58732))))

(assert (=> b!113306 (= (apply!102 (+!154 lt!58734 (tuple2!2455 lt!58726 (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)))) lt!58732) (apply!102 lt!58734 lt!58732))))

(declare-fun lt!58729 () Unit!3521)

(assert (=> b!113306 (= lt!58729 lt!58740)))

(declare-fun lt!58727 () ListLongMap!1599)

(assert (=> b!113306 (= lt!58727 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58746 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58746 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58736 () (_ BitVec 64))

(assert (=> b!113306 (= lt!58736 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113306 (= lt!58735 (addApplyDifferent!78 lt!58727 lt!58746 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) lt!58736))))

(assert (=> b!113306 (= (apply!102 (+!154 lt!58727 (tuple2!2455 lt!58746 (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)))) lt!58736) (apply!102 lt!58727 lt!58736))))

(declare-fun b!113307 () Bool)

(assert (=> b!113307 (= e!73638 call!12218)))

(declare-fun b!113308 () Bool)

(declare-fun e!73634 () Bool)

(assert (=> b!113308 (= e!73631 e!73634)))

(declare-fun res!55823 () Bool)

(assert (=> b!113308 (= res!55823 call!12217)))

(assert (=> b!113308 (=> (not res!55823) (not e!73634))))

(declare-fun d!32175 () Bool)

(assert (=> d!32175 e!73628))

(declare-fun res!55820 () Bool)

(assert (=> d!32175 (=> (not res!55820) (not e!73628))))

(assert (=> d!32175 (= res!55820 (or (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))))

(declare-fun lt!58733 () ListLongMap!1599)

(assert (=> d!32175 (= lt!58742 lt!58733)))

(declare-fun lt!58738 () Unit!3521)

(assert (=> d!32175 (= lt!58738 e!73635)))

(declare-fun c!20296 () Bool)

(declare-fun e!73637 () Bool)

(assert (=> d!32175 (= c!20296 e!73637)))

(declare-fun res!55822 () Bool)

(assert (=> d!32175 (=> (not res!55822) (not e!73637))))

(assert (=> d!32175 (= res!55822 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32175 (= lt!58733 e!73632)))

(assert (=> d!32175 (= c!20300 (and (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32175 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32175 (= (getCurrentListMap!499 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) lt!58742)))

(declare-fun bm!12216 () Bool)

(assert (=> bm!12216 (= call!12221 call!12220)))

(declare-fun b!113309 () Bool)

(assert (=> b!113309 (= e!73634 (= (apply!102 lt!58742 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16))))))

(declare-fun b!113310 () Bool)

(assert (=> b!113310 (= e!73629 e!73627)))

(declare-fun res!55824 () Bool)

(assert (=> b!113310 (=> (not res!55824) (not e!73627))))

(assert (=> b!113310 (= res!55824 (contains!846 lt!58742 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113311 () Bool)

(assert (=> b!113311 (= e!73636 call!12219)))

(declare-fun bm!12217 () Bool)

(assert (=> bm!12217 (= call!12216 (contains!846 lt!58742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113312 () Bool)

(assert (=> b!113312 (= e!73636 call!12218)))

(declare-fun b!113313 () Bool)

(assert (=> b!113313 (= e!73637 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113314 () Bool)

(assert (=> b!113314 (= e!73632 e!73638)))

(assert (=> b!113314 (= c!20298 (and (not (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12218 () Bool)

(assert (=> bm!12218 (= call!12220 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite (or c!20221 c!20227) (_values!2644 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16)))) (mask!6845 newMap!16) (ite c!20221 (ite c!20229 lt!58600 lt!58594) (extraKeys!2452 newMap!16)) (ite (and c!20221 c!20229) lt!58428 (zeroValue!2529 newMap!16)) (ite c!20221 (ite c!20229 (minValue!2529 newMap!16) lt!58428) (minValue!2529 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(assert (= (and d!32175 c!20300) b!113302))

(assert (= (and d!32175 (not c!20300)) b!113314))

(assert (= (and b!113314 c!20298) b!113307))

(assert (= (and b!113314 (not c!20298)) b!113296))

(assert (= (and b!113296 c!20297) b!113312))

(assert (= (and b!113296 (not c!20297)) b!113311))

(assert (= (or b!113312 b!113311) bm!12214))

(assert (= (or b!113307 bm!12214) bm!12216))

(assert (= (or b!113307 b!113312) bm!12215))

(assert (= (or b!113302 bm!12216) bm!12218))

(assert (= (or b!113302 bm!12215) bm!12213))

(assert (= (and d!32175 res!55822) b!113313))

(assert (= (and d!32175 c!20296) b!113306))

(assert (= (and d!32175 (not c!20296)) b!113295))

(assert (= (and d!32175 res!55820) b!113297))

(assert (= (and b!113297 res!55825) b!113305))

(assert (= (and b!113297 (not res!55821)) b!113310))

(assert (= (and b!113310 res!55824) b!113303))

(assert (= (and b!113297 res!55826) b!113299))

(assert (= (and b!113299 c!20301) b!113298))

(assert (= (and b!113299 (not c!20301)) b!113300))

(assert (= (and b!113298 res!55827) b!113304))

(assert (= (or b!113298 b!113300) bm!12217))

(assert (= (and b!113299 res!55819) b!113294))

(assert (= (and b!113294 c!20299) b!113308))

(assert (= (and b!113294 (not c!20299)) b!113301))

(assert (= (and b!113308 res!55823) b!113309))

(assert (= (or b!113308 b!113301) bm!12212))

(declare-fun b_lambda!5073 () Bool)

(assert (=> (not b_lambda!5073) (not b!113303)))

(declare-fun tb!2145 () Bool)

(declare-fun t!5820 () Bool)

(assert (=> (and b!112823 (= (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2661 newMap!16)) t!5820) tb!2145))

(declare-fun result!3589 () Bool)

(assert (=> tb!2145 (= result!3589 tp_is_empty!2709)))

(assert (=> b!113303 t!5820))

(declare-fun b_and!6959 () Bool)

(assert (= b_and!6955 (and (=> t!5820 result!3589) b_and!6959)))

(declare-fun t!5822 () Bool)

(declare-fun tb!2147 () Bool)

(assert (=> (and b!112813 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 newMap!16)) t!5822) tb!2147))

(declare-fun result!3591 () Bool)

(assert (= result!3591 result!3589))

(assert (=> b!113303 t!5822))

(declare-fun b_and!6961 () Bool)

(assert (= b_and!6957 (and (=> t!5822 result!3591) b_and!6961)))

(declare-fun m!129353 () Bool)

(assert (=> b!113306 m!129353))

(declare-fun m!129355 () Bool)

(assert (=> b!113306 m!129355))

(declare-fun m!129357 () Bool)

(assert (=> b!113306 m!129357))

(declare-fun m!129359 () Bool)

(assert (=> b!113306 m!129359))

(declare-fun m!129361 () Bool)

(assert (=> b!113306 m!129361))

(declare-fun m!129363 () Bool)

(assert (=> b!113306 m!129363))

(assert (=> b!113306 m!129357))

(declare-fun m!129365 () Bool)

(assert (=> b!113306 m!129365))

(declare-fun m!129367 () Bool)

(assert (=> b!113306 m!129367))

(declare-fun m!129369 () Bool)

(assert (=> b!113306 m!129369))

(declare-fun m!129371 () Bool)

(assert (=> b!113306 m!129371))

(declare-fun m!129373 () Bool)

(assert (=> b!113306 m!129373))

(assert (=> b!113306 m!129361))

(declare-fun m!129375 () Bool)

(assert (=> b!113306 m!129375))

(declare-fun m!129377 () Bool)

(assert (=> b!113306 m!129377))

(assert (=> b!113306 m!129367))

(assert (=> b!113306 m!129363))

(declare-fun m!129379 () Bool)

(assert (=> b!113306 m!129379))

(declare-fun m!129381 () Bool)

(assert (=> b!113306 m!129381))

(declare-fun m!129383 () Bool)

(assert (=> b!113306 m!129383))

(declare-fun m!129385 () Bool)

(assert (=> b!113306 m!129385))

(declare-fun m!129387 () Bool)

(assert (=> bm!12212 m!129387))

(assert (=> b!113305 m!129383))

(assert (=> b!113305 m!129383))

(declare-fun m!129389 () Bool)

(assert (=> b!113305 m!129389))

(declare-fun m!129391 () Bool)

(assert (=> b!113302 m!129391))

(declare-fun m!129393 () Bool)

(assert (=> bm!12213 m!129393))

(assert (=> bm!12218 m!129373))

(declare-fun m!129395 () Bool)

(assert (=> b!113309 m!129395))

(assert (=> b!113313 m!129383))

(assert (=> b!113313 m!129383))

(assert (=> b!113313 m!129389))

(assert (=> d!32175 m!129295))

(assert (=> b!113310 m!129383))

(assert (=> b!113310 m!129383))

(declare-fun m!129397 () Bool)

(assert (=> b!113310 m!129397))

(declare-fun m!129399 () Bool)

(assert (=> bm!12217 m!129399))

(assert (=> b!113303 m!129383))

(declare-fun m!129401 () Bool)

(assert (=> b!113303 m!129401))

(declare-fun m!129403 () Bool)

(assert (=> b!113303 m!129403))

(declare-fun m!129405 () Bool)

(assert (=> b!113303 m!129405))

(assert (=> b!113303 m!129405))

(assert (=> b!113303 m!129403))

(declare-fun m!129407 () Bool)

(assert (=> b!113303 m!129407))

(assert (=> b!113303 m!129383))

(declare-fun m!129409 () Bool)

(assert (=> b!113304 m!129409))

(assert (=> bm!12170 d!32175))

(declare-fun d!32177 () Bool)

(declare-fun e!73640 () Bool)

(assert (=> d!32177 e!73640))

(declare-fun res!55829 () Bool)

(assert (=> d!32177 (=> (not res!55829) (not e!73640))))

(declare-fun lt!58748 () ListLongMap!1599)

(assert (=> d!32177 (= res!55829 (contains!846 lt!58748 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58749 () List!1639)

(assert (=> d!32177 (= lt!58748 (ListLongMap!1600 lt!58749))))

(declare-fun lt!58747 () Unit!3521)

(declare-fun lt!58750 () Unit!3521)

(assert (=> d!32177 (= lt!58747 lt!58750)))

(assert (=> d!32177 (= (getValueByKey!160 lt!58749 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32177 (= lt!58750 (lemmaContainsTupThenGetReturnValue!76 lt!58749 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32177 (= lt!58749 (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32177 (= (+!154 lt!58429 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58748)))

(declare-fun b!113315 () Bool)

(declare-fun res!55828 () Bool)

(assert (=> b!113315 (=> (not res!55828) (not e!73640))))

(assert (=> b!113315 (= res!55828 (= (getValueByKey!160 (toList!815 lt!58748) (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113316 () Bool)

(assert (=> b!113316 (= e!73640 (contains!847 (toList!815 lt!58748) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32177 res!55829) b!113315))

(assert (= (and b!113315 res!55828) b!113316))

(declare-fun m!129411 () Bool)

(assert (=> d!32177 m!129411))

(declare-fun m!129413 () Bool)

(assert (=> d!32177 m!129413))

(declare-fun m!129415 () Bool)

(assert (=> d!32177 m!129415))

(declare-fun m!129417 () Bool)

(assert (=> d!32177 m!129417))

(declare-fun m!129419 () Bool)

(assert (=> b!113315 m!129419))

(declare-fun m!129421 () Bool)

(assert (=> b!113316 m!129421))

(assert (=> d!32107 d!32177))

(declare-fun d!32179 () Bool)

(declare-fun e!73641 () Bool)

(assert (=> d!32179 e!73641))

(declare-fun res!55831 () Bool)

(assert (=> d!32179 (=> (not res!55831) (not e!73641))))

(declare-fun lt!58752 () ListLongMap!1599)

(assert (=> d!32179 (= res!55831 (contains!846 lt!58752 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun lt!58753 () List!1639)

(assert (=> d!32179 (= lt!58752 (ListLongMap!1600 lt!58753))))

(declare-fun lt!58751 () Unit!3521)

(declare-fun lt!58754 () Unit!3521)

(assert (=> d!32179 (= lt!58751 lt!58754)))

(assert (=> d!32179 (= (getValueByKey!160 lt!58753 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32179 (= lt!58754 (lemmaContainsTupThenGetReturnValue!76 lt!58753 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32179 (= lt!58753 (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32179 (= (+!154 lt!58429 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) lt!58752)))

(declare-fun b!113317 () Bool)

(declare-fun res!55830 () Bool)

(assert (=> b!113317 (=> (not res!55830) (not e!73641))))

(assert (=> b!113317 (= res!55830 (= (getValueByKey!160 (toList!815 lt!58752) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(declare-fun b!113318 () Bool)

(assert (=> b!113318 (= e!73641 (contains!847 (toList!815 lt!58752) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))

(assert (= (and d!32179 res!55831) b!113317))

(assert (= (and b!113317 res!55830) b!113318))

(declare-fun m!129423 () Bool)

(assert (=> d!32179 m!129423))

(declare-fun m!129425 () Bool)

(assert (=> d!32179 m!129425))

(declare-fun m!129427 () Bool)

(assert (=> d!32179 m!129427))

(declare-fun m!129429 () Bool)

(assert (=> d!32179 m!129429))

(declare-fun m!129431 () Bool)

(assert (=> b!113317 m!129431))

(declare-fun m!129433 () Bool)

(assert (=> b!113318 m!129433))

(assert (=> d!32107 d!32179))

(declare-fun d!32181 () Bool)

(declare-fun e!73642 () Bool)

(assert (=> d!32181 e!73642))

(declare-fun res!55833 () Bool)

(assert (=> d!32181 (=> (not res!55833) (not e!73642))))

(declare-fun lt!58756 () ListLongMap!1599)

(assert (=> d!32181 (= res!55833 (contains!846 lt!58756 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun lt!58757 () List!1639)

(assert (=> d!32181 (= lt!58756 (ListLongMap!1600 lt!58757))))

(declare-fun lt!58755 () Unit!3521)

(declare-fun lt!58758 () Unit!3521)

(assert (=> d!32181 (= lt!58755 lt!58758)))

(assert (=> d!32181 (= (getValueByKey!160 lt!58757 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32181 (= lt!58758 (lemmaContainsTupThenGetReturnValue!76 lt!58757 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32181 (= lt!58757 (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32181 (= (+!154 (+!154 lt!58429 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) lt!58756)))

(declare-fun b!113319 () Bool)

(declare-fun res!55832 () Bool)

(assert (=> b!113319 (=> (not res!55832) (not e!73642))))

(assert (=> b!113319 (= res!55832 (= (getValueByKey!160 (toList!815 lt!58756) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(declare-fun b!113320 () Bool)

(assert (=> b!113320 (= e!73642 (contains!847 (toList!815 lt!58756) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))

(assert (= (and d!32181 res!55833) b!113319))

(assert (= (and b!113319 res!55832) b!113320))

(declare-fun m!129435 () Bool)

(assert (=> d!32181 m!129435))

(declare-fun m!129437 () Bool)

(assert (=> d!32181 m!129437))

(declare-fun m!129439 () Bool)

(assert (=> d!32181 m!129439))

(declare-fun m!129441 () Bool)

(assert (=> d!32181 m!129441))

(declare-fun m!129443 () Bool)

(assert (=> b!113319 m!129443))

(declare-fun m!129445 () Bool)

(assert (=> b!113320 m!129445))

(assert (=> d!32107 d!32181))

(declare-fun d!32183 () Bool)

(declare-fun e!73643 () Bool)

(assert (=> d!32183 e!73643))

(declare-fun res!55835 () Bool)

(assert (=> d!32183 (=> (not res!55835) (not e!73643))))

(declare-fun lt!58760 () ListLongMap!1599)

(assert (=> d!32183 (= res!55835 (contains!846 lt!58760 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58761 () List!1639)

(assert (=> d!32183 (= lt!58760 (ListLongMap!1600 lt!58761))))

(declare-fun lt!58759 () Unit!3521)

(declare-fun lt!58762 () Unit!3521)

(assert (=> d!32183 (= lt!58759 lt!58762)))

(assert (=> d!32183 (= (getValueByKey!160 lt!58761 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32183 (= lt!58762 (lemmaContainsTupThenGetReturnValue!76 lt!58761 (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32183 (= lt!58761 (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32183 (= (+!154 (+!154 lt!58429 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58760)))

(declare-fun b!113321 () Bool)

(declare-fun res!55834 () Bool)

(assert (=> b!113321 (=> (not res!55834) (not e!73643))))

(assert (=> b!113321 (= res!55834 (= (getValueByKey!160 (toList!815 lt!58760) (_1!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113322 () Bool)

(assert (=> b!113322 (= e!73643 (contains!847 (toList!815 lt!58760) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32183 res!55835) b!113321))

(assert (= (and b!113321 res!55834) b!113322))

(declare-fun m!129447 () Bool)

(assert (=> d!32183 m!129447))

(declare-fun m!129449 () Bool)

(assert (=> d!32183 m!129449))

(declare-fun m!129451 () Bool)

(assert (=> d!32183 m!129451))

(declare-fun m!129453 () Bool)

(assert (=> d!32183 m!129453))

(declare-fun m!129455 () Bool)

(assert (=> b!113321 m!129455))

(declare-fun m!129457 () Bool)

(assert (=> b!113322 m!129457))

(assert (=> d!32107 d!32183))

(declare-fun d!32185 () Bool)

(assert (=> d!32185 (= (+!154 (+!154 lt!58429 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (+!154 (+!154 lt!58429 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))

(assert (=> d!32185 true))

(declare-fun _$28!173 () Unit!3521)

(assert (=> d!32185 (= (choose!710 lt!58429 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) _$28!173)))

(declare-fun bs!4649 () Bool)

(assert (= bs!4649 d!32185))

(assert (=> bs!4649 m!129079))

(assert (=> bs!4649 m!129079))

(assert (=> bs!4649 m!129081))

(assert (=> bs!4649 m!129075))

(assert (=> bs!4649 m!129075))

(assert (=> bs!4649 m!129077))

(assert (=> d!32107 d!32185))

(declare-fun d!32187 () Bool)

(declare-fun res!55836 () Bool)

(declare-fun e!73644 () Bool)

(assert (=> d!32187 (=> res!55836 e!73644)))

(assert (=> d!32187 (= res!55836 (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32187 (= (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!73644)))

(declare-fun b!113323 () Bool)

(declare-fun e!73645 () Bool)

(assert (=> b!113323 (= e!73644 e!73645)))

(declare-fun res!55837 () Bool)

(assert (=> b!113323 (=> (not res!55837) (not e!73645))))

(assert (=> b!113323 (= res!55837 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113324 () Bool)

(assert (=> b!113324 (= e!73645 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!32187 (not res!55836)) b!113323))

(assert (= (and b!113323 res!55837) b!113324))

(declare-fun m!129459 () Bool)

(assert (=> d!32187 m!129459))

(assert (=> b!113324 m!128915))

(declare-fun m!129461 () Bool)

(assert (=> b!113324 m!129461))

(assert (=> b!113083 d!32187))

(declare-fun d!32189 () Bool)

(declare-fun e!73646 () Bool)

(assert (=> d!32189 e!73646))

(declare-fun res!55839 () Bool)

(assert (=> d!32189 (=> (not res!55839) (not e!73646))))

(declare-fun lt!58764 () ListLongMap!1599)

(assert (=> d!32189 (= res!55839 (contains!846 lt!58764 (_1!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun lt!58765 () List!1639)

(assert (=> d!32189 (= lt!58764 (ListLongMap!1600 lt!58765))))

(declare-fun lt!58763 () Unit!3521)

(declare-fun lt!58766 () Unit!3521)

(assert (=> d!32189 (= lt!58763 lt!58766)))

(assert (=> d!32189 (= (getValueByKey!160 lt!58765 (_1!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))) (Some!165 (_2!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32189 (= lt!58766 (lemmaContainsTupThenGetReturnValue!76 lt!58765 (_1!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (_2!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32189 (= lt!58765 (insertStrictlySorted!79 (toList!815 (ite c!20260 call!12203 (ite c!20258 call!12204 call!12202))) (_1!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (_2!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32189 (= (+!154 (ite c!20260 call!12203 (ite c!20258 call!12204 call!12202)) (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58764)))

(declare-fun b!113325 () Bool)

(declare-fun res!55838 () Bool)

(assert (=> b!113325 (=> (not res!55838) (not e!73646))))

(assert (=> b!113325 (= res!55838 (= (getValueByKey!160 (toList!815 lt!58764) (_1!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))) (Some!165 (_2!1238 (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))))

(declare-fun b!113326 () Bool)

(assert (=> b!113326 (= e!73646 (contains!847 (toList!815 lt!58764) (ite (or c!20260 c!20258) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (= (and d!32189 res!55839) b!113325))

(assert (= (and b!113325 res!55838) b!113326))

(declare-fun m!129463 () Bool)

(assert (=> d!32189 m!129463))

(declare-fun m!129465 () Bool)

(assert (=> d!32189 m!129465))

(declare-fun m!129467 () Bool)

(assert (=> d!32189 m!129467))

(declare-fun m!129469 () Bool)

(assert (=> d!32189 m!129469))

(declare-fun m!129471 () Bool)

(assert (=> b!113325 m!129471))

(declare-fun m!129473 () Bool)

(assert (=> b!113326 m!129473))

(assert (=> bm!12196 d!32189))

(declare-fun d!32191 () Bool)

(assert (=> d!32191 (isDefined!113 (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun lt!58769 () Unit!3521)

(declare-fun choose!714 (List!1639 (_ BitVec 64)) Unit!3521)

(assert (=> d!32191 (= lt!58769 (choose!714 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73649 () Bool)

(assert (=> d!32191 e!73649))

(declare-fun res!55842 () Bool)

(assert (=> d!32191 (=> (not res!55842) (not e!73649))))

(assert (=> d!32191 (= res!55842 (isStrictlySorted!313 (toList!815 lt!58424)))))

(assert (=> d!32191 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58769)))

(declare-fun b!113329 () Bool)

(assert (=> b!113329 (= e!73649 (containsKey!164 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32191 res!55842) b!113329))

(assert (=> d!32191 m!128915))

(assert (=> d!32191 m!129123))

(assert (=> d!32191 m!129123))

(assert (=> d!32191 m!129125))

(assert (=> d!32191 m!128915))

(declare-fun m!129475 () Bool)

(assert (=> d!32191 m!129475))

(declare-fun m!129477 () Bool)

(assert (=> d!32191 m!129477))

(assert (=> b!113329 m!128915))

(assert (=> b!113329 m!129119))

(assert (=> b!112949 d!32191))

(declare-fun d!32193 () Bool)

(declare-fun isEmpty!383 (Option!166) Bool)

(assert (=> d!32193 (= (isDefined!113 (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))) (not (isEmpty!383 (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))))

(declare-fun bs!4650 () Bool)

(assert (= bs!4650 d!32193))

(assert (=> bs!4650 m!129123))

(declare-fun m!129479 () Bool)

(assert (=> bs!4650 m!129479))

(assert (=> b!112949 d!32193))

(declare-fun b!113331 () Bool)

(declare-fun e!73650 () Option!166)

(declare-fun e!73651 () Option!166)

(assert (=> b!113331 (= e!73650 e!73651)))

(declare-fun c!20303 () Bool)

(assert (=> b!113331 (= c!20303 (and ((_ is Cons!1635) (toList!815 lt!58424)) (not (= (_1!1238 (h!2235 (toList!815 lt!58424))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))))

(declare-fun d!32195 () Bool)

(declare-fun c!20302 () Bool)

(assert (=> d!32195 (= c!20302 (and ((_ is Cons!1635) (toList!815 lt!58424)) (= (_1!1238 (h!2235 (toList!815 lt!58424))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32195 (= (getValueByKey!160 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) e!73650)))

(declare-fun b!113332 () Bool)

(assert (=> b!113332 (= e!73651 (getValueByKey!160 (t!5813 (toList!815 lt!58424)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113333 () Bool)

(assert (=> b!113333 (= e!73651 None!164)))

(declare-fun b!113330 () Bool)

(assert (=> b!113330 (= e!73650 (Some!165 (_2!1238 (h!2235 (toList!815 lt!58424)))))))

(assert (= (and d!32195 c!20302) b!113330))

(assert (= (and d!32195 (not c!20302)) b!113331))

(assert (= (and b!113331 c!20303) b!113332))

(assert (= (and b!113331 (not c!20303)) b!113333))

(assert (=> b!113332 m!128915))

(declare-fun m!129481 () Bool)

(assert (=> b!113332 m!129481))

(assert (=> b!112949 d!32195))

(declare-fun d!32197 () Bool)

(assert (=> d!32197 (= (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113180 d!32197))

(declare-fun b!113334 () Bool)

(declare-fun e!73654 () Bool)

(declare-fun e!73655 () Bool)

(assert (=> b!113334 (= e!73654 e!73655)))

(declare-fun res!55845 () Bool)

(assert (=> b!113334 (=> (not res!55845) (not e!73655))))

(declare-fun e!73652 () Bool)

(assert (=> b!113334 (= res!55845 (not e!73652))))

(declare-fun res!55844 () Bool)

(assert (=> b!113334 (=> (not res!55844) (not e!73652))))

(assert (=> b!113334 (= res!55844 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113335 () Bool)

(assert (=> b!113335 (= e!73652 (contains!848 (ite c!20240 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637) Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113336 () Bool)

(declare-fun e!73653 () Bool)

(declare-fun call!12222 () Bool)

(assert (=> b!113336 (= e!73653 call!12222)))

(declare-fun d!32199 () Bool)

(declare-fun res!55843 () Bool)

(assert (=> d!32199 (=> res!55843 e!73654)))

(assert (=> d!32199 (= res!55843 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32199 (= (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20240 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637) Nil!1637)) e!73654)))

(declare-fun b!113337 () Bool)

(assert (=> b!113337 (= e!73653 call!12222)))

(declare-fun b!113338 () Bool)

(assert (=> b!113338 (= e!73655 e!73653)))

(declare-fun c!20304 () Bool)

(assert (=> b!113338 (= c!20304 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!12219 () Bool)

(assert (=> bm!12219 (= call!12222 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20304 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!20240 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637) Nil!1637)) (ite c!20240 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637) Nil!1637))))))

(assert (= (and d!32199 (not res!55843)) b!113334))

(assert (= (and b!113334 res!55844) b!113335))

(assert (= (and b!113334 res!55845) b!113338))

(assert (= (and b!113338 c!20304) b!113336))

(assert (= (and b!113338 (not c!20304)) b!113337))

(assert (= (or b!113336 b!113337) bm!12219))

(declare-fun m!129483 () Bool)

(assert (=> b!113334 m!129483))

(assert (=> b!113334 m!129483))

(declare-fun m!129485 () Bool)

(assert (=> b!113334 m!129485))

(assert (=> b!113335 m!129483))

(assert (=> b!113335 m!129483))

(declare-fun m!129487 () Bool)

(assert (=> b!113335 m!129487))

(assert (=> b!113338 m!129483))

(assert (=> b!113338 m!129483))

(assert (=> b!113338 m!129485))

(assert (=> bm!12219 m!129483))

(declare-fun m!129489 () Bool)

(assert (=> bm!12219 m!129489))

(assert (=> bm!12177 d!32199))

(declare-fun d!32201 () Bool)

(declare-fun e!73656 () Bool)

(assert (=> d!32201 e!73656))

(declare-fun res!55846 () Bool)

(assert (=> d!32201 (=> res!55846 e!73656)))

(declare-fun lt!58770 () Bool)

(assert (=> d!32201 (= res!55846 (not lt!58770))))

(declare-fun lt!58773 () Bool)

(assert (=> d!32201 (= lt!58770 lt!58773)))

(declare-fun lt!58772 () Unit!3521)

(declare-fun e!73657 () Unit!3521)

(assert (=> d!32201 (= lt!58772 e!73657)))

(declare-fun c!20305 () Bool)

(assert (=> d!32201 (= c!20305 lt!58773)))

(assert (=> d!32201 (= lt!58773 (containsKey!164 (toList!815 lt!58508) (_1!1238 lt!58422)))))

(assert (=> d!32201 (= (contains!846 lt!58508 (_1!1238 lt!58422)) lt!58770)))

(declare-fun b!113339 () Bool)

(declare-fun lt!58771 () Unit!3521)

(assert (=> b!113339 (= e!73657 lt!58771)))

(assert (=> b!113339 (= lt!58771 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58508) (_1!1238 lt!58422)))))

(assert (=> b!113339 (isDefined!113 (getValueByKey!160 (toList!815 lt!58508) (_1!1238 lt!58422)))))

(declare-fun b!113340 () Bool)

(declare-fun Unit!3533 () Unit!3521)

(assert (=> b!113340 (= e!73657 Unit!3533)))

(declare-fun b!113341 () Bool)

(assert (=> b!113341 (= e!73656 (isDefined!113 (getValueByKey!160 (toList!815 lt!58508) (_1!1238 lt!58422))))))

(assert (= (and d!32201 c!20305) b!113339))

(assert (= (and d!32201 (not c!20305)) b!113340))

(assert (= (and d!32201 (not res!55846)) b!113341))

(declare-fun m!129491 () Bool)

(assert (=> d!32201 m!129491))

(declare-fun m!129493 () Bool)

(assert (=> b!113339 m!129493))

(assert (=> b!113339 m!129103))

(assert (=> b!113339 m!129103))

(declare-fun m!129495 () Bool)

(assert (=> b!113339 m!129495))

(assert (=> b!113341 m!129103))

(assert (=> b!113341 m!129103))

(assert (=> b!113341 m!129495))

(assert (=> d!32111 d!32201))

(declare-fun b!113343 () Bool)

(declare-fun e!73658 () Option!166)

(declare-fun e!73659 () Option!166)

(assert (=> b!113343 (= e!73658 e!73659)))

(declare-fun c!20307 () Bool)

(assert (=> b!113343 (= c!20307 (and ((_ is Cons!1635) lt!58509) (not (= (_1!1238 (h!2235 lt!58509)) (_1!1238 lt!58422)))))))

(declare-fun d!32203 () Bool)

(declare-fun c!20306 () Bool)

(assert (=> d!32203 (= c!20306 (and ((_ is Cons!1635) lt!58509) (= (_1!1238 (h!2235 lt!58509)) (_1!1238 lt!58422))))))

(assert (=> d!32203 (= (getValueByKey!160 lt!58509 (_1!1238 lt!58422)) e!73658)))

(declare-fun b!113344 () Bool)

(assert (=> b!113344 (= e!73659 (getValueByKey!160 (t!5813 lt!58509) (_1!1238 lt!58422)))))

(declare-fun b!113345 () Bool)

(assert (=> b!113345 (= e!73659 None!164)))

(declare-fun b!113342 () Bool)

(assert (=> b!113342 (= e!73658 (Some!165 (_2!1238 (h!2235 lt!58509))))))

(assert (= (and d!32203 c!20306) b!113342))

(assert (= (and d!32203 (not c!20306)) b!113343))

(assert (= (and b!113343 c!20307) b!113344))

(assert (= (and b!113343 (not c!20307)) b!113345))

(declare-fun m!129497 () Bool)

(assert (=> b!113344 m!129497))

(assert (=> d!32111 d!32203))

(declare-fun d!32205 () Bool)

(assert (=> d!32205 (= (getValueByKey!160 lt!58509 (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422)))))

(declare-fun lt!58774 () Unit!3521)

(assert (=> d!32205 (= lt!58774 (choose!713 lt!58509 (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(declare-fun e!73660 () Bool)

(assert (=> d!32205 e!73660))

(declare-fun res!55847 () Bool)

(assert (=> d!32205 (=> (not res!55847) (not e!73660))))

(assert (=> d!32205 (= res!55847 (isStrictlySorted!313 lt!58509))))

(assert (=> d!32205 (= (lemmaContainsTupThenGetReturnValue!76 lt!58509 (_1!1238 lt!58422) (_2!1238 lt!58422)) lt!58774)))

(declare-fun b!113346 () Bool)

(declare-fun res!55848 () Bool)

(assert (=> b!113346 (=> (not res!55848) (not e!73660))))

(assert (=> b!113346 (= res!55848 (containsKey!164 lt!58509 (_1!1238 lt!58422)))))

(declare-fun b!113347 () Bool)

(assert (=> b!113347 (= e!73660 (contains!847 lt!58509 (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422))))))

(assert (= (and d!32205 res!55847) b!113346))

(assert (= (and b!113346 res!55848) b!113347))

(assert (=> d!32205 m!129097))

(declare-fun m!129499 () Bool)

(assert (=> d!32205 m!129499))

(declare-fun m!129501 () Bool)

(assert (=> d!32205 m!129501))

(declare-fun m!129503 () Bool)

(assert (=> b!113346 m!129503))

(declare-fun m!129505 () Bool)

(assert (=> b!113347 m!129505))

(assert (=> d!32111 d!32205))

(declare-fun bm!12220 () Bool)

(declare-fun call!12223 () List!1639)

(declare-fun call!12225 () List!1639)

(assert (=> bm!12220 (= call!12223 call!12225)))

(declare-fun b!113348 () Bool)

(declare-fun c!20311 () Bool)

(assert (=> b!113348 (= c!20311 (and ((_ is Cons!1635) (toList!815 lt!58429)) (bvsgt (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58422))))))

(declare-fun e!73664 () List!1639)

(declare-fun e!73665 () List!1639)

(assert (=> b!113348 (= e!73664 e!73665)))

(declare-fun b!113349 () Bool)

(assert (=> b!113349 (= e!73664 call!12223)))

(declare-fun b!113350 () Bool)

(declare-fun call!12224 () List!1639)

(assert (=> b!113350 (= e!73665 call!12224)))

(declare-fun b!113351 () Bool)

(declare-fun e!73662 () List!1639)

(assert (=> b!113351 (= e!73662 (insertStrictlySorted!79 (t!5813 (toList!815 lt!58429)) (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(declare-fun d!32207 () Bool)

(declare-fun e!73661 () Bool)

(assert (=> d!32207 e!73661))

(declare-fun res!55850 () Bool)

(assert (=> d!32207 (=> (not res!55850) (not e!73661))))

(declare-fun lt!58775 () List!1639)

(assert (=> d!32207 (= res!55850 (isStrictlySorted!313 lt!58775))))

(declare-fun e!73663 () List!1639)

(assert (=> d!32207 (= lt!58775 e!73663)))

(declare-fun c!20310 () Bool)

(assert (=> d!32207 (= c!20310 (and ((_ is Cons!1635) (toList!815 lt!58429)) (bvslt (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58422))))))

(assert (=> d!32207 (isStrictlySorted!313 (toList!815 lt!58429))))

(assert (=> d!32207 (= (insertStrictlySorted!79 (toList!815 lt!58429) (_1!1238 lt!58422) (_2!1238 lt!58422)) lt!58775)))

(declare-fun bm!12221 () Bool)

(assert (=> bm!12221 (= call!12224 call!12223)))

(declare-fun b!113352 () Bool)

(declare-fun res!55849 () Bool)

(assert (=> b!113352 (=> (not res!55849) (not e!73661))))

(assert (=> b!113352 (= res!55849 (containsKey!164 lt!58775 (_1!1238 lt!58422)))))

(declare-fun b!113353 () Bool)

(assert (=> b!113353 (= e!73665 call!12224)))

(declare-fun bm!12222 () Bool)

(assert (=> bm!12222 (= call!12225 ($colon$colon!85 e!73662 (ite c!20310 (h!2235 (toList!815 lt!58429)) (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422)))))))

(declare-fun c!20308 () Bool)

(assert (=> bm!12222 (= c!20308 c!20310)))

(declare-fun b!113354 () Bool)

(assert (=> b!113354 (= e!73663 call!12225)))

(declare-fun c!20309 () Bool)

(declare-fun b!113355 () Bool)

(assert (=> b!113355 (= e!73662 (ite c!20309 (t!5813 (toList!815 lt!58429)) (ite c!20311 (Cons!1635 (h!2235 (toList!815 lt!58429)) (t!5813 (toList!815 lt!58429))) Nil!1636)))))

(declare-fun b!113356 () Bool)

(assert (=> b!113356 (= e!73663 e!73664)))

(assert (=> b!113356 (= c!20309 (and ((_ is Cons!1635) (toList!815 lt!58429)) (= (_1!1238 (h!2235 (toList!815 lt!58429))) (_1!1238 lt!58422))))))

(declare-fun b!113357 () Bool)

(assert (=> b!113357 (= e!73661 (contains!847 lt!58775 (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422))))))

(assert (= (and d!32207 c!20310) b!113354))

(assert (= (and d!32207 (not c!20310)) b!113356))

(assert (= (and b!113356 c!20309) b!113349))

(assert (= (and b!113356 (not c!20309)) b!113348))

(assert (= (and b!113348 c!20311) b!113350))

(assert (= (and b!113348 (not c!20311)) b!113353))

(assert (= (or b!113350 b!113353) bm!12221))

(assert (= (or b!113349 bm!12221) bm!12220))

(assert (= (or b!113354 bm!12220) bm!12222))

(assert (= (and bm!12222 c!20308) b!113351))

(assert (= (and bm!12222 (not c!20308)) b!113355))

(assert (= (and d!32207 res!55850) b!113352))

(assert (= (and b!113352 res!55849) b!113357))

(declare-fun m!129507 () Bool)

(assert (=> b!113357 m!129507))

(declare-fun m!129509 () Bool)

(assert (=> b!113352 m!129509))

(declare-fun m!129511 () Bool)

(assert (=> bm!12222 m!129511))

(declare-fun m!129513 () Bool)

(assert (=> b!113351 m!129513))

(declare-fun m!129515 () Bool)

(assert (=> d!32207 m!129515))

(assert (=> d!32207 m!129345))

(assert (=> d!32111 d!32207))

(declare-fun d!32209 () Bool)

(declare-fun e!73666 () Bool)

(assert (=> d!32209 e!73666))

(declare-fun res!55851 () Bool)

(assert (=> d!32209 (=> res!55851 e!73666)))

(declare-fun lt!58776 () Bool)

(assert (=> d!32209 (= res!55851 (not lt!58776))))

(declare-fun lt!58779 () Bool)

(assert (=> d!32209 (= lt!58776 lt!58779)))

(declare-fun lt!58778 () Unit!3521)

(declare-fun e!73667 () Unit!3521)

(assert (=> d!32209 (= lt!58778 e!73667)))

(declare-fun c!20312 () Bool)

(assert (=> d!32209 (= c!20312 lt!58779)))

(assert (=> d!32209 (= lt!58779 (containsKey!164 (toList!815 lt!58487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32209 (= (contains!846 lt!58487 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58776)))

(declare-fun b!113358 () Bool)

(declare-fun lt!58777 () Unit!3521)

(assert (=> b!113358 (= e!73667 lt!58777)))

(assert (=> b!113358 (= lt!58777 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113358 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113359 () Bool)

(declare-fun Unit!3534 () Unit!3521)

(assert (=> b!113359 (= e!73667 Unit!3534)))

(declare-fun b!113360 () Bool)

(assert (=> b!113360 (= e!73666 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32209 c!20312) b!113358))

(assert (= (and d!32209 (not c!20312)) b!113359))

(assert (= (and d!32209 (not res!55851)) b!113360))

(declare-fun m!129517 () Bool)

(assert (=> d!32209 m!129517))

(declare-fun m!129519 () Bool)

(assert (=> b!113358 m!129519))

(declare-fun m!129521 () Bool)

(assert (=> b!113358 m!129521))

(assert (=> b!113358 m!129521))

(declare-fun m!129523 () Bool)

(assert (=> b!113358 m!129523))

(assert (=> b!113360 m!129521))

(assert (=> b!113360 m!129521))

(assert (=> b!113360 m!129523))

(assert (=> d!32103 d!32209))

(assert (=> d!32103 d!32115))

(declare-fun b!113362 () Bool)

(declare-fun e!73668 () Option!166)

(declare-fun e!73669 () Option!166)

(assert (=> b!113362 (= e!73668 e!73669)))

(declare-fun c!20314 () Bool)

(assert (=> b!113362 (= c!20314 (and ((_ is Cons!1635) (toList!815 lt!58497)) (not (= (_1!1238 (h!2235 (toList!815 lt!58497))) (_1!1238 lt!58422)))))))

(declare-fun d!32211 () Bool)

(declare-fun c!20313 () Bool)

(assert (=> d!32211 (= c!20313 (and ((_ is Cons!1635) (toList!815 lt!58497)) (= (_1!1238 (h!2235 (toList!815 lt!58497))) (_1!1238 lt!58422))))))

(assert (=> d!32211 (= (getValueByKey!160 (toList!815 lt!58497) (_1!1238 lt!58422)) e!73668)))

(declare-fun b!113363 () Bool)

(assert (=> b!113363 (= e!73669 (getValueByKey!160 (t!5813 (toList!815 lt!58497)) (_1!1238 lt!58422)))))

(declare-fun b!113364 () Bool)

(assert (=> b!113364 (= e!73669 None!164)))

(declare-fun b!113361 () Bool)

(assert (=> b!113361 (= e!73668 (Some!165 (_2!1238 (h!2235 (toList!815 lt!58497)))))))

(assert (= (and d!32211 c!20313) b!113361))

(assert (= (and d!32211 (not c!20313)) b!113362))

(assert (= (and b!113362 c!20314) b!113363))

(assert (= (and b!113362 (not c!20314)) b!113364))

(declare-fun m!129525 () Bool)

(assert (=> b!113363 m!129525))

(assert (=> b!112935 d!32211))

(assert (=> b!112951 d!32193))

(assert (=> b!112951 d!32195))

(declare-fun d!32213 () Bool)

(declare-fun e!73670 () Bool)

(assert (=> d!32213 e!73670))

(declare-fun res!55852 () Bool)

(assert (=> d!32213 (=> res!55852 e!73670)))

(declare-fun lt!58780 () Bool)

(assert (=> d!32213 (= res!55852 (not lt!58780))))

(declare-fun lt!58783 () Bool)

(assert (=> d!32213 (= lt!58780 lt!58783)))

(declare-fun lt!58782 () Unit!3521)

(declare-fun e!73671 () Unit!3521)

(assert (=> d!32213 (= lt!58782 e!73671)))

(declare-fun c!20315 () Bool)

(assert (=> d!32213 (= c!20315 lt!58783)))

(assert (=> d!32213 (= lt!58783 (containsKey!164 (toList!815 lt!58512) (_1!1238 lt!58423)))))

(assert (=> d!32213 (= (contains!846 lt!58512 (_1!1238 lt!58423)) lt!58780)))

(declare-fun b!113365 () Bool)

(declare-fun lt!58781 () Unit!3521)

(assert (=> b!113365 (= e!73671 lt!58781)))

(assert (=> b!113365 (= lt!58781 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58512) (_1!1238 lt!58423)))))

(assert (=> b!113365 (isDefined!113 (getValueByKey!160 (toList!815 lt!58512) (_1!1238 lt!58423)))))

(declare-fun b!113366 () Bool)

(declare-fun Unit!3535 () Unit!3521)

(assert (=> b!113366 (= e!73671 Unit!3535)))

(declare-fun b!113367 () Bool)

(assert (=> b!113367 (= e!73670 (isDefined!113 (getValueByKey!160 (toList!815 lt!58512) (_1!1238 lt!58423))))))

(assert (= (and d!32213 c!20315) b!113365))

(assert (= (and d!32213 (not c!20315)) b!113366))

(assert (= (and d!32213 (not res!55852)) b!113367))

(declare-fun m!129527 () Bool)

(assert (=> d!32213 m!129527))

(declare-fun m!129529 () Bool)

(assert (=> b!113365 m!129529))

(assert (=> b!113365 m!129115))

(assert (=> b!113365 m!129115))

(declare-fun m!129531 () Bool)

(assert (=> b!113365 m!129531))

(assert (=> b!113367 m!129115))

(assert (=> b!113367 m!129115))

(assert (=> b!113367 m!129531))

(assert (=> d!32113 d!32213))

(declare-fun b!113369 () Bool)

(declare-fun e!73672 () Option!166)

(declare-fun e!73673 () Option!166)

(assert (=> b!113369 (= e!73672 e!73673)))

(declare-fun c!20317 () Bool)

(assert (=> b!113369 (= c!20317 (and ((_ is Cons!1635) lt!58513) (not (= (_1!1238 (h!2235 lt!58513)) (_1!1238 lt!58423)))))))

(declare-fun d!32215 () Bool)

(declare-fun c!20316 () Bool)

(assert (=> d!32215 (= c!20316 (and ((_ is Cons!1635) lt!58513) (= (_1!1238 (h!2235 lt!58513)) (_1!1238 lt!58423))))))

(assert (=> d!32215 (= (getValueByKey!160 lt!58513 (_1!1238 lt!58423)) e!73672)))

(declare-fun b!113370 () Bool)

(assert (=> b!113370 (= e!73673 (getValueByKey!160 (t!5813 lt!58513) (_1!1238 lt!58423)))))

(declare-fun b!113371 () Bool)

(assert (=> b!113371 (= e!73673 None!164)))

(declare-fun b!113368 () Bool)

(assert (=> b!113368 (= e!73672 (Some!165 (_2!1238 (h!2235 lt!58513))))))

(assert (= (and d!32215 c!20316) b!113368))

(assert (= (and d!32215 (not c!20316)) b!113369))

(assert (= (and b!113369 c!20317) b!113370))

(assert (= (and b!113369 (not c!20317)) b!113371))

(declare-fun m!129533 () Bool)

(assert (=> b!113370 m!129533))

(assert (=> d!32113 d!32215))

(declare-fun d!32217 () Bool)

(assert (=> d!32217 (= (getValueByKey!160 lt!58513 (_1!1238 lt!58423)) (Some!165 (_2!1238 lt!58423)))))

(declare-fun lt!58784 () Unit!3521)

(assert (=> d!32217 (= lt!58784 (choose!713 lt!58513 (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(declare-fun e!73674 () Bool)

(assert (=> d!32217 e!73674))

(declare-fun res!55853 () Bool)

(assert (=> d!32217 (=> (not res!55853) (not e!73674))))

(assert (=> d!32217 (= res!55853 (isStrictlySorted!313 lt!58513))))

(assert (=> d!32217 (= (lemmaContainsTupThenGetReturnValue!76 lt!58513 (_1!1238 lt!58423) (_2!1238 lt!58423)) lt!58784)))

(declare-fun b!113372 () Bool)

(declare-fun res!55854 () Bool)

(assert (=> b!113372 (=> (not res!55854) (not e!73674))))

(assert (=> b!113372 (= res!55854 (containsKey!164 lt!58513 (_1!1238 lt!58423)))))

(declare-fun b!113373 () Bool)

(assert (=> b!113373 (= e!73674 (contains!847 lt!58513 (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423))))))

(assert (= (and d!32217 res!55853) b!113372))

(assert (= (and b!113372 res!55854) b!113373))

(assert (=> d!32217 m!129109))

(declare-fun m!129535 () Bool)

(assert (=> d!32217 m!129535))

(declare-fun m!129537 () Bool)

(assert (=> d!32217 m!129537))

(declare-fun m!129539 () Bool)

(assert (=> b!113372 m!129539))

(declare-fun m!129541 () Bool)

(assert (=> b!113373 m!129541))

(assert (=> d!32113 d!32217))

(declare-fun bm!12223 () Bool)

(declare-fun call!12226 () List!1639)

(declare-fun call!12228 () List!1639)

(assert (=> bm!12223 (= call!12226 call!12228)))

(declare-fun c!20321 () Bool)

(declare-fun b!113374 () Bool)

(assert (=> b!113374 (= c!20321 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58422))) (bvsgt (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58422)))) (_1!1238 lt!58423))))))

(declare-fun e!73678 () List!1639)

(declare-fun e!73679 () List!1639)

(assert (=> b!113374 (= e!73678 e!73679)))

(declare-fun b!113375 () Bool)

(assert (=> b!113375 (= e!73678 call!12226)))

(declare-fun b!113376 () Bool)

(declare-fun call!12227 () List!1639)

(assert (=> b!113376 (= e!73679 call!12227)))

(declare-fun b!113377 () Bool)

(declare-fun e!73676 () List!1639)

(assert (=> b!113377 (= e!73676 (insertStrictlySorted!79 (t!5813 (toList!815 (+!154 lt!58429 lt!58422))) (_1!1238 lt!58423) (_2!1238 lt!58423)))))

(declare-fun d!32219 () Bool)

(declare-fun e!73675 () Bool)

(assert (=> d!32219 e!73675))

(declare-fun res!55856 () Bool)

(assert (=> d!32219 (=> (not res!55856) (not e!73675))))

(declare-fun lt!58785 () List!1639)

(assert (=> d!32219 (= res!55856 (isStrictlySorted!313 lt!58785))))

(declare-fun e!73677 () List!1639)

(assert (=> d!32219 (= lt!58785 e!73677)))

(declare-fun c!20320 () Bool)

(assert (=> d!32219 (= c!20320 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58422))) (bvslt (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58422)))) (_1!1238 lt!58423))))))

(assert (=> d!32219 (isStrictlySorted!313 (toList!815 (+!154 lt!58429 lt!58422)))))

(assert (=> d!32219 (= (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 lt!58422)) (_1!1238 lt!58423) (_2!1238 lt!58423)) lt!58785)))

(declare-fun bm!12224 () Bool)

(assert (=> bm!12224 (= call!12227 call!12226)))

(declare-fun b!113378 () Bool)

(declare-fun res!55855 () Bool)

(assert (=> b!113378 (=> (not res!55855) (not e!73675))))

(assert (=> b!113378 (= res!55855 (containsKey!164 lt!58785 (_1!1238 lt!58423)))))

(declare-fun b!113379 () Bool)

(assert (=> b!113379 (= e!73679 call!12227)))

(declare-fun bm!12225 () Bool)

(assert (=> bm!12225 (= call!12228 ($colon$colon!85 e!73676 (ite c!20320 (h!2235 (toList!815 (+!154 lt!58429 lt!58422))) (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423)))))))

(declare-fun c!20318 () Bool)

(assert (=> bm!12225 (= c!20318 c!20320)))

(declare-fun b!113380 () Bool)

(assert (=> b!113380 (= e!73677 call!12228)))

(declare-fun c!20319 () Bool)

(declare-fun b!113381 () Bool)

(assert (=> b!113381 (= e!73676 (ite c!20319 (t!5813 (toList!815 (+!154 lt!58429 lt!58422))) (ite c!20321 (Cons!1635 (h!2235 (toList!815 (+!154 lt!58429 lt!58422))) (t!5813 (toList!815 (+!154 lt!58429 lt!58422)))) Nil!1636)))))

(declare-fun b!113382 () Bool)

(assert (=> b!113382 (= e!73677 e!73678)))

(assert (=> b!113382 (= c!20319 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58422))) (= (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58422)))) (_1!1238 lt!58423))))))

(declare-fun b!113383 () Bool)

(assert (=> b!113383 (= e!73675 (contains!847 lt!58785 (tuple2!2455 (_1!1238 lt!58423) (_2!1238 lt!58423))))))

(assert (= (and d!32219 c!20320) b!113380))

(assert (= (and d!32219 (not c!20320)) b!113382))

(assert (= (and b!113382 c!20319) b!113375))

(assert (= (and b!113382 (not c!20319)) b!113374))

(assert (= (and b!113374 c!20321) b!113376))

(assert (= (and b!113374 (not c!20321)) b!113379))

(assert (= (or b!113376 b!113379) bm!12224))

(assert (= (or b!113375 bm!12224) bm!12223))

(assert (= (or b!113380 bm!12223) bm!12225))

(assert (= (and bm!12225 c!20318) b!113377))

(assert (= (and bm!12225 (not c!20318)) b!113381))

(assert (= (and d!32219 res!55856) b!113378))

(assert (= (and b!113378 res!55855) b!113383))

(declare-fun m!129543 () Bool)

(assert (=> b!113383 m!129543))

(declare-fun m!129545 () Bool)

(assert (=> b!113378 m!129545))

(declare-fun m!129547 () Bool)

(assert (=> bm!12225 m!129547))

(declare-fun m!129549 () Bool)

(assert (=> b!113377 m!129549))

(declare-fun m!129551 () Bool)

(assert (=> d!32219 m!129551))

(declare-fun m!129553 () Bool)

(assert (=> d!32219 m!129553))

(assert (=> d!32113 d!32219))

(declare-fun b!113385 () Bool)

(declare-fun e!73680 () Option!166)

(declare-fun e!73681 () Option!166)

(assert (=> b!113385 (= e!73680 e!73681)))

(declare-fun c!20323 () Bool)

(assert (=> b!113385 (= c!20323 (and ((_ is Cons!1635) (toList!815 lt!58504)) (not (= (_1!1238 (h!2235 (toList!815 lt!58504))) (_1!1238 lt!58423)))))))

(declare-fun d!32221 () Bool)

(declare-fun c!20322 () Bool)

(assert (=> d!32221 (= c!20322 (and ((_ is Cons!1635) (toList!815 lt!58504)) (= (_1!1238 (h!2235 (toList!815 lt!58504))) (_1!1238 lt!58423))))))

(assert (=> d!32221 (= (getValueByKey!160 (toList!815 lt!58504) (_1!1238 lt!58423)) e!73680)))

(declare-fun b!113386 () Bool)

(assert (=> b!113386 (= e!73681 (getValueByKey!160 (t!5813 (toList!815 lt!58504)) (_1!1238 lt!58423)))))

(declare-fun b!113387 () Bool)

(assert (=> b!113387 (= e!73681 None!164)))

(declare-fun b!113384 () Bool)

(assert (=> b!113384 (= e!73680 (Some!165 (_2!1238 (h!2235 (toList!815 lt!58504)))))))

(assert (= (and d!32221 c!20322) b!113384))

(assert (= (and d!32221 (not c!20322)) b!113385))

(assert (= (and b!113385 c!20323) b!113386))

(assert (= (and b!113385 (not c!20323)) b!113387))

(declare-fun m!129555 () Bool)

(assert (=> b!113386 m!129555))

(assert (=> b!112937 d!32221))

(declare-fun d!32223 () Bool)

(assert (=> d!32223 (= (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112921 d!32223))

(declare-fun d!32225 () Bool)

(declare-fun e!73682 () Bool)

(assert (=> d!32225 e!73682))

(declare-fun res!55858 () Bool)

(assert (=> d!32225 (=> (not res!55858) (not e!73682))))

(declare-fun lt!58787 () ListLongMap!1599)

(assert (=> d!32225 (= res!55858 (contains!846 lt!58787 (_1!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58788 () List!1639)

(assert (=> d!32225 (= lt!58787 (ListLongMap!1600 lt!58788))))

(declare-fun lt!58786 () Unit!3521)

(declare-fun lt!58789 () Unit!3521)

(assert (=> d!32225 (= lt!58786 lt!58789)))

(assert (=> d!32225 (= (getValueByKey!160 lt!58788 (_1!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32225 (= lt!58789 (lemmaContainsTupThenGetReturnValue!76 lt!58788 (_1!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32225 (= lt!58788 (insertStrictlySorted!79 (toList!815 call!12198) (_1!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32225 (= (+!154 call!12198 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58787)))

(declare-fun b!113388 () Bool)

(declare-fun res!55857 () Bool)

(assert (=> b!113388 (=> (not res!55857) (not e!73682))))

(assert (=> b!113388 (= res!55857 (= (getValueByKey!160 (toList!815 lt!58787) (_1!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113389 () Bool)

(assert (=> b!113389 (= e!73682 (contains!847 (toList!815 lt!58787) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32225 res!55858) b!113388))

(assert (= (and b!113388 res!55857) b!113389))

(declare-fun m!129557 () Bool)

(assert (=> d!32225 m!129557))

(declare-fun m!129559 () Bool)

(assert (=> d!32225 m!129559))

(declare-fun m!129561 () Bool)

(assert (=> d!32225 m!129561))

(declare-fun m!129563 () Bool)

(assert (=> d!32225 m!129563))

(declare-fun m!129565 () Bool)

(assert (=> b!113388 m!129565))

(declare-fun m!129567 () Bool)

(assert (=> b!113389 m!129567))

(assert (=> b!113167 d!32225))

(declare-fun d!32227 () Bool)

(declare-fun e!73685 () Bool)

(assert (=> d!32227 e!73685))

(declare-fun c!20326 () Bool)

(assert (=> d!32227 (= c!20326 (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32227 true))

(declare-fun _$29!153 () Unit!3521)

(assert (=> d!32227 (= (choose!711 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) _$29!153)))

(declare-fun b!113394 () Bool)

(assert (=> b!113394 (= e!73685 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!113395 () Bool)

(assert (=> b!113395 (= e!73685 (ite (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32227 c!20326) b!113394))

(assert (= (and d!32227 (not c!20326)) b!113395))

(assert (=> b!113394 m!128915))

(assert (=> b!113394 m!128927))

(assert (=> d!32135 d!32227))

(assert (=> d!32135 d!32115))

(declare-fun call!12233 () Bool)

(declare-fun bm!12230 () Bool)

(declare-fun c!20332 () Bool)

(declare-fun lt!58795 () SeekEntryResult!263)

(assert (=> bm!12230 (= call!12233 (inRange!0 (ite c!20332 (index!3204 lt!58795) (index!3207 lt!58795)) (mask!6845 newMap!16)))))

(declare-fun b!113412 () Bool)

(declare-fun e!73697 () Bool)

(assert (=> b!113412 (= e!73697 ((_ is Undefined!263) lt!58795))))

(declare-fun b!113413 () Bool)

(declare-fun res!55869 () Bool)

(declare-fun e!73696 () Bool)

(assert (=> b!113413 (=> (not res!55869) (not e!73696))))

(assert (=> b!113413 (= res!55869 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3207 lt!58795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113413 (and (bvsge (index!3207 lt!58795) #b00000000000000000000000000000000) (bvslt (index!3207 lt!58795) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113414 () Bool)

(declare-fun e!73695 () Bool)

(declare-fun e!73694 () Bool)

(assert (=> b!113414 (= e!73695 e!73694)))

(declare-fun res!55870 () Bool)

(assert (=> b!113414 (= res!55870 call!12233)))

(assert (=> b!113414 (=> (not res!55870) (not e!73694))))

(declare-fun b!113415 () Bool)

(declare-fun res!55868 () Bool)

(assert (=> b!113415 (=> (not res!55868) (not e!73696))))

(assert (=> b!113415 (= res!55868 call!12233)))

(assert (=> b!113415 (= e!73697 e!73696)))

(declare-fun d!32229 () Bool)

(assert (=> d!32229 e!73695))

(assert (=> d!32229 (= c!20332 ((_ is MissingZero!263) lt!58795))))

(assert (=> d!32229 (= lt!58795 (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun lt!58794 () Unit!3521)

(declare-fun choose!715 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) Int) Unit!3521)

(assert (=> d!32229 (= lt!58794 (choose!715 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(assert (=> d!32229 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32229 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)) lt!58794)))

(declare-fun b!113416 () Bool)

(declare-fun call!12234 () Bool)

(assert (=> b!113416 (= e!73696 (not call!12234))))

(declare-fun bm!12231 () Bool)

(assert (=> bm!12231 (= call!12234 (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113417 () Bool)

(assert (=> b!113417 (= e!73695 e!73697)))

(declare-fun c!20331 () Bool)

(assert (=> b!113417 (= c!20331 ((_ is MissingVacant!263) lt!58795))))

(declare-fun b!113418 () Bool)

(assert (=> b!113418 (and (bvsge (index!3204 lt!58795) #b00000000000000000000000000000000) (bvslt (index!3204 lt!58795) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun res!55867 () Bool)

(assert (=> b!113418 (= res!55867 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3204 lt!58795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113418 (=> (not res!55867) (not e!73694))))

(declare-fun b!113419 () Bool)

(assert (=> b!113419 (= e!73694 (not call!12234))))

(assert (= (and d!32229 c!20332) b!113414))

(assert (= (and d!32229 (not c!20332)) b!113417))

(assert (= (and b!113414 res!55870) b!113418))

(assert (= (and b!113418 res!55867) b!113419))

(assert (= (and b!113417 c!20331) b!113415))

(assert (= (and b!113417 (not c!20331)) b!113412))

(assert (= (and b!113415 res!55868) b!113413))

(assert (= (and b!113413 res!55869) b!113416))

(assert (= (or b!113414 b!113415) bm!12230))

(assert (= (or b!113419 b!113416) bm!12231))

(declare-fun m!129569 () Bool)

(assert (=> bm!12230 m!129569))

(assert (=> bm!12231 m!128915))

(assert (=> bm!12231 m!129135))

(declare-fun m!129571 () Bool)

(assert (=> b!113413 m!129571))

(assert (=> d!32229 m!128915))

(assert (=> d!32229 m!129165))

(assert (=> d!32229 m!128915))

(declare-fun m!129573 () Bool)

(assert (=> d!32229 m!129573))

(assert (=> d!32229 m!129295))

(declare-fun m!129575 () Bool)

(assert (=> b!113418 m!129575))

(assert (=> bm!12158 d!32229))

(assert (=> b!113184 d!32197))

(declare-fun d!32231 () Bool)

(assert (=> d!32231 (= (apply!102 lt!58687 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1364 (getValueByKey!160 (toList!815 lt!58687) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4651 () Bool)

(assert (= bs!4651 d!32231))

(assert (=> bs!4651 m!129047))

(declare-fun m!129577 () Bool)

(assert (=> bs!4651 m!129577))

(assert (=> bs!4651 m!129577))

(declare-fun m!129579 () Bool)

(assert (=> bs!4651 m!129579))

(assert (=> b!113168 d!32231))

(declare-fun d!32233 () Bool)

(declare-fun c!20333 () Bool)

(assert (=> d!32233 (= c!20333 ((_ is ValueCellFull!1011) (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!73698 () V!3259)

(assert (=> d!32233 (= (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73698)))

(declare-fun b!113420 () Bool)

(assert (=> b!113420 (= e!73698 (get!1362 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113421 () Bool)

(assert (=> b!113421 (= e!73698 (get!1363 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32233 c!20333) b!113420))

(assert (= (and d!32233 (not c!20333)) b!113421))

(assert (=> b!113420 m!129037))

(assert (=> b!113420 m!128967))

(declare-fun m!129581 () Bool)

(assert (=> b!113420 m!129581))

(assert (=> b!113421 m!129037))

(assert (=> b!113421 m!128967))

(declare-fun m!129583 () Bool)

(assert (=> b!113421 m!129583))

(assert (=> b!113168 d!32233))

(assert (=> b!113088 d!32133))

(assert (=> b!112923 d!32223))

(declare-fun call!12246 () Bool)

(declare-fun bm!12240 () Bool)

(assert (=> bm!12240 (= call!12246 (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun call!12243 () SeekEntryResult!263)

(declare-fun bm!12241 () Bool)

(assert (=> bm!12241 (= call!12243 (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun bm!12242 () Bool)

(declare-fun call!12245 () Bool)

(declare-fun call!12244 () Bool)

(assert (=> bm!12242 (= call!12245 call!12244)))

(declare-fun b!113457 () Bool)

(declare-fun e!73722 () Bool)

(assert (=> b!113457 (= e!73722 (not call!12246))))

(declare-fun b!113458 () Bool)

(declare-fun c!20345 () Bool)

(declare-fun lt!58861 () SeekEntryResult!263)

(assert (=> b!113458 (= c!20345 ((_ is MissingVacant!263) lt!58861))))

(declare-fun e!73717 () Bool)

(declare-fun e!73721 () Bool)

(assert (=> b!113458 (= e!73717 e!73721)))

(declare-fun b!113459 () Bool)

(declare-fun e!73718 () Unit!3521)

(declare-fun Unit!3536 () Unit!3521)

(assert (=> b!113459 (= e!73718 Unit!3536)))

(declare-fun lt!58880 () Unit!3521)

(declare-fun lemmaArrayContainsKeyThenInListMap!34 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) (_ BitVec 32) Int) Unit!3521)

(assert (=> b!113459 (= lt!58880 (lemmaArrayContainsKeyThenInListMap!34 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(assert (=> b!113459 (contains!846 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))

(declare-fun lt!58858 () Unit!3521)

(assert (=> b!113459 (= lt!58858 lt!58880)))

(assert (=> b!113459 false))

(declare-fun b!113460 () Bool)

(declare-fun Unit!3537 () Unit!3521)

(assert (=> b!113460 (= e!73718 Unit!3537)))

(declare-fun b!113461 () Bool)

(declare-fun res!55897 () Bool)

(declare-fun e!73716 () Bool)

(assert (=> b!113461 (=> (not res!55897) (not e!73716))))

(declare-fun lt!58881 () tuple2!2456)

(assert (=> b!113461 (= res!55897 (valid!437 (_2!1239 lt!58881)))))

(declare-fun b!113462 () Bool)

(assert (=> b!113462 (= e!73721 e!73722)))

(declare-fun res!55893 () Bool)

(assert (=> b!113462 (= res!55893 call!12245)))

(assert (=> b!113462 (=> (not res!55893) (not e!73722))))

(declare-fun b!113463 () Bool)

(assert (=> b!113463 (= e!73721 ((_ is Undefined!263) lt!58861))))

(declare-fun b!113464 () Bool)

(declare-fun e!73715 () Unit!3521)

(declare-fun lt!58867 () Unit!3521)

(assert (=> b!113464 (= e!73715 lt!58867)))

(assert (=> b!113464 (= lt!58867 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(assert (=> b!113464 (= lt!58861 call!12243)))

(declare-fun c!20342 () Bool)

(assert (=> b!113464 (= c!20342 ((_ is MissingZero!263) lt!58861))))

(assert (=> b!113464 e!73717))

(declare-fun d!32235 () Bool)

(assert (=> d!32235 e!73716))

(declare-fun res!55895 () Bool)

(assert (=> d!32235 (=> (not res!55895) (not e!73716))))

(assert (=> d!32235 (= res!55895 (_1!1239 lt!58881))))

(assert (=> d!32235 (= lt!58881 (tuple2!2457 true (LongMapFixedSize!931 (defaultEntry!2661 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (bvadd (_size!514 newMap!16) #b00000000000000000000000000000001) (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))) (_vacant!514 newMap!16))))))

(declare-fun lt!58863 () Unit!3521)

(declare-fun lt!58860 () Unit!3521)

(assert (=> d!32235 (= lt!58863 lt!58860)))

(declare-fun lt!58877 () array!4417)

(declare-fun lt!58871 () array!4419)

(assert (=> d!32235 (contains!846 (getCurrentListMap!499 lt!58877 lt!58871 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (select (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590))))))

(assert (=> d!32235 (= lt!58860 (lemmaValidKeyInArrayIsInListMap!112 lt!58877 lt!58871 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (defaultEntry!2661 newMap!16)))))

(assert (=> d!32235 (= lt!58871 (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))))))

(assert (=> d!32235 (= lt!58877 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun lt!58882 () Unit!3521)

(declare-fun lt!58859 () Unit!3521)

(assert (=> d!32235 (= lt!58882 lt!58859)))

(declare-fun lt!58872 () array!4417)

(assert (=> d!32235 (= (arrayCountValidKeys!0 lt!58872 (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (bvadd (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4417 (_ BitVec 32)) Unit!3521)

(assert (=> d!32235 (= lt!58859 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58872 (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590))))))

(assert (=> d!32235 (= lt!58872 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun lt!58869 () Unit!3521)

(declare-fun lt!58876 () Unit!3521)

(assert (=> d!32235 (= lt!58869 lt!58876)))

(declare-fun lt!58875 () array!4417)

(assert (=> d!32235 (arrayContainsKey!0 lt!58875 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!32235 (= lt!58876 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58875 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590))))))

(assert (=> d!32235 (= lt!58875 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun lt!58873 () Unit!3521)

(declare-fun lt!58862 () Unit!3521)

(assert (=> d!32235 (= lt!58873 lt!58862)))

(assert (=> d!32235 (= (+!154 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (getCurrentListMap!499 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!34 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) (_ BitVec 64) V!3259 Int) Unit!3521)

(assert (=> d!32235 (= lt!58862 (lemmaAddValidKeyToArrayThenAddPairToListMap!34 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58868 () Unit!3521)

(declare-fun lt!58885 () Unit!3521)

(assert (=> d!32235 (= lt!58868 lt!58885)))

(assert (=> d!32235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))) (mask!6845 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4417 (_ BitVec 32) (_ BitVec 32)) Unit!3521)

(assert (=> d!32235 (= lt!58885 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (mask!6845 newMap!16)))))

(declare-fun lt!58884 () Unit!3521)

(declare-fun lt!58878 () Unit!3521)

(assert (=> d!32235 (= lt!58884 lt!58878)))

(assert (=> d!32235 (= (arrayCountValidKeys!0 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))) #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4381 newMap!16) #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4417 (_ BitVec 32) (_ BitVec 64)) Unit!3521)

(assert (=> d!32235 (= lt!58878 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4381 newMap!16) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun lt!58864 () Unit!3521)

(declare-fun lt!58870 () Unit!3521)

(assert (=> d!32235 (= lt!58864 lt!58870)))

(declare-fun lt!58874 () (_ BitVec 32))

(declare-fun lt!58865 () List!1640)

(assert (=> d!32235 (arrayNoDuplicates!0 (array!4418 (store (arr!2093 (_keys!4381 newMap!16)) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2352 (_keys!4381 newMap!16))) lt!58874 lt!58865)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1640) Unit!3521)

(assert (=> d!32235 (= lt!58870 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590)) lt!58874 lt!58865))))

(assert (=> d!32235 (= lt!58865 Nil!1637)))

(assert (=> d!32235 (= lt!58874 #b00000000000000000000000000000000)))

(declare-fun lt!58856 () Unit!3521)

(assert (=> d!32235 (= lt!58856 e!73718)))

(declare-fun c!20344 () Bool)

(assert (=> d!32235 (= c!20344 (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58883 () Unit!3521)

(assert (=> d!32235 (= lt!58883 e!73715)))

(declare-fun c!20343 () Bool)

(assert (=> d!32235 (= c!20343 (contains!846 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32235 (valid!437 newMap!16)))

(assert (=> d!32235 (= (updateHelperNewKey!51 newMap!16 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (ite c!20225 (index!3207 lt!58590) (index!3204 lt!58590))) lt!58881)))

(declare-fun b!113456 () Bool)

(declare-fun res!55894 () Bool)

(assert (=> b!113456 (= res!55894 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3207 lt!58861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113456 (=> (not res!55894) (not e!73722))))

(declare-fun b!113465 () Bool)

(declare-fun res!55890 () Bool)

(assert (=> b!113465 (= res!55890 call!12244)))

(declare-fun e!73720 () Bool)

(assert (=> b!113465 (=> (not res!55890) (not e!73720))))

(declare-fun b!113466 () Bool)

(assert (=> b!113466 (= e!73716 (= (map!1306 (_2!1239 lt!58881)) (+!154 (map!1306 newMap!16) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun bm!12243 () Bool)

(declare-fun lt!58857 () SeekEntryResult!263)

(assert (=> bm!12243 (= call!12244 (inRange!0 (ite c!20343 (index!3205 lt!58857) (ite c!20342 (index!3204 lt!58861) (index!3207 lt!58861))) (mask!6845 newMap!16)))))

(declare-fun b!113467 () Bool)

(assert (=> b!113467 (= e!73720 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58857)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113468 () Bool)

(declare-fun res!55891 () Bool)

(declare-fun e!73719 () Bool)

(assert (=> b!113468 (=> (not res!55891) (not e!73719))))

(assert (=> b!113468 (= res!55891 call!12245)))

(assert (=> b!113468 (= e!73717 e!73719)))

(declare-fun b!113469 () Bool)

(declare-fun Unit!3538 () Unit!3521)

(assert (=> b!113469 (= e!73715 Unit!3538)))

(declare-fun lt!58866 () Unit!3521)

(assert (=> b!113469 (= lt!58866 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(assert (=> b!113469 (= lt!58857 call!12243)))

(declare-fun res!55892 () Bool)

(assert (=> b!113469 (= res!55892 ((_ is Found!263) lt!58857))))

(assert (=> b!113469 (=> (not res!55892) (not e!73720))))

(assert (=> b!113469 e!73720))

(declare-fun lt!58879 () Unit!3521)

(assert (=> b!113469 (= lt!58879 lt!58866)))

(assert (=> b!113469 false))

(declare-fun b!113470 () Bool)

(assert (=> b!113470 (= e!73719 (not call!12246))))

(declare-fun b!113471 () Bool)

(declare-fun res!55896 () Bool)

(assert (=> b!113471 (=> (not res!55896) (not e!73716))))

(assert (=> b!113471 (= res!55896 (contains!846 (map!1306 (_2!1239 lt!58881)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113472 () Bool)

(declare-fun res!55889 () Bool)

(assert (=> b!113472 (=> (not res!55889) (not e!73719))))

(assert (=> b!113472 (= res!55889 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3204 lt!58861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32235 c!20343) b!113469))

(assert (= (and d!32235 (not c!20343)) b!113464))

(assert (= (and b!113469 res!55892) b!113465))

(assert (= (and b!113465 res!55890) b!113467))

(assert (= (and b!113464 c!20342) b!113468))

(assert (= (and b!113464 (not c!20342)) b!113458))

(assert (= (and b!113468 res!55891) b!113472))

(assert (= (and b!113472 res!55889) b!113470))

(assert (= (and b!113458 c!20345) b!113462))

(assert (= (and b!113458 (not c!20345)) b!113463))

(assert (= (and b!113462 res!55893) b!113456))

(assert (= (and b!113456 res!55894) b!113457))

(assert (= (or b!113468 b!113462) bm!12242))

(assert (= (or b!113470 b!113457) bm!12240))

(assert (= (or b!113465 bm!12242) bm!12243))

(assert (= (or b!113469 b!113464) bm!12241))

(assert (= (and d!32235 c!20344) b!113459))

(assert (= (and d!32235 (not c!20344)) b!113460))

(assert (= (and d!32235 res!55895) b!113461))

(assert (= (and b!113461 res!55897) b!113471))

(assert (= (and b!113471 res!55896) b!113466))

(declare-fun m!129585 () Bool)

(assert (=> b!113461 m!129585))

(assert (=> bm!12240 m!128915))

(assert (=> bm!12240 m!129135))

(declare-fun m!129587 () Bool)

(assert (=> b!113471 m!129587))

(assert (=> b!113471 m!129587))

(assert (=> b!113471 m!128915))

(declare-fun m!129589 () Bool)

(assert (=> b!113471 m!129589))

(declare-fun m!129591 () Bool)

(assert (=> b!113456 m!129591))

(declare-fun m!129593 () Bool)

(assert (=> b!113472 m!129593))

(assert (=> b!113459 m!128915))

(declare-fun m!129595 () Bool)

(assert (=> b!113459 m!129595))

(assert (=> b!113459 m!129133))

(assert (=> b!113459 m!129133))

(assert (=> b!113459 m!128915))

(declare-fun m!129597 () Bool)

(assert (=> b!113459 m!129597))

(declare-fun m!129599 () Bool)

(assert (=> b!113467 m!129599))

(assert (=> bm!12241 m!128915))

(assert (=> bm!12241 m!129165))

(declare-fun m!129601 () Bool)

(assert (=> bm!12243 m!129601))

(assert (=> b!113464 m!128915))

(assert (=> b!113464 m!129169))

(assert (=> b!113466 m!129587))

(assert (=> b!113466 m!128931))

(assert (=> b!113466 m!128931))

(declare-fun m!129603 () Bool)

(assert (=> b!113466 m!129603))

(assert (=> b!113469 m!128915))

(assert (=> b!113469 m!129129))

(assert (=> d!32235 m!128937))

(declare-fun m!129605 () Bool)

(assert (=> d!32235 m!129605))

(assert (=> d!32235 m!128915))

(declare-fun m!129607 () Bool)

(assert (=> d!32235 m!129607))

(declare-fun m!129609 () Bool)

(assert (=> d!32235 m!129609))

(declare-fun m!129611 () Bool)

(assert (=> d!32235 m!129611))

(assert (=> d!32235 m!129133))

(assert (=> d!32235 m!128915))

(assert (=> d!32235 m!129597))

(declare-fun m!129613 () Bool)

(assert (=> d!32235 m!129613))

(assert (=> d!32235 m!128915))

(declare-fun m!129615 () Bool)

(assert (=> d!32235 m!129615))

(declare-fun m!129617 () Bool)

(assert (=> d!32235 m!129617))

(assert (=> d!32235 m!128915))

(assert (=> d!32235 m!129135))

(assert (=> d!32235 m!129133))

(declare-fun m!129619 () Bool)

(assert (=> d!32235 m!129619))

(assert (=> d!32235 m!128915))

(declare-fun m!129621 () Bool)

(assert (=> d!32235 m!129621))

(declare-fun m!129623 () Bool)

(assert (=> d!32235 m!129623))

(declare-fun m!129625 () Bool)

(assert (=> d!32235 m!129625))

(declare-fun m!129627 () Bool)

(assert (=> d!32235 m!129627))

(assert (=> d!32235 m!129261))

(declare-fun m!129629 () Bool)

(assert (=> d!32235 m!129629))

(assert (=> d!32235 m!129617))

(assert (=> d!32235 m!129629))

(declare-fun m!129631 () Bool)

(assert (=> d!32235 m!129631))

(assert (=> d!32235 m!128915))

(declare-fun m!129633 () Bool)

(assert (=> d!32235 m!129633))

(declare-fun m!129635 () Bool)

(assert (=> d!32235 m!129635))

(assert (=> d!32235 m!128915))

(declare-fun m!129637 () Bool)

(assert (=> d!32235 m!129637))

(declare-fun m!129639 () Bool)

(assert (=> d!32235 m!129639))

(assert (=> d!32235 m!129133))

(assert (=> d!32235 m!128915))

(declare-fun m!129641 () Bool)

(assert (=> d!32235 m!129641))

(assert (=> bm!12168 d!32235))

(assert (=> d!32131 d!32137))

(declare-fun d!32237 () Bool)

(assert (=> d!32237 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1637)))

(assert (=> d!32237 true))

(declare-fun _$71!159 () Unit!3521)

(assert (=> d!32237 (= (choose!39 (_keys!4381 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!159)))

(declare-fun bs!4652 () Bool)

(assert (= bs!4652 d!32237))

(assert (=> bs!4652 m!128923))

(assert (=> d!32131 d!32237))

(declare-fun b!113474 () Bool)

(declare-fun e!73723 () Option!166)

(declare-fun e!73724 () Option!166)

(assert (=> b!113474 (= e!73723 e!73724)))

(declare-fun c!20347 () Bool)

(assert (=> b!113474 (= c!20347 (and ((_ is Cons!1635) (toList!815 lt!58508)) (not (= (_1!1238 (h!2235 (toList!815 lt!58508))) (_1!1238 lt!58422)))))))

(declare-fun d!32239 () Bool)

(declare-fun c!20346 () Bool)

(assert (=> d!32239 (= c!20346 (and ((_ is Cons!1635) (toList!815 lt!58508)) (= (_1!1238 (h!2235 (toList!815 lt!58508))) (_1!1238 lt!58422))))))

(assert (=> d!32239 (= (getValueByKey!160 (toList!815 lt!58508) (_1!1238 lt!58422)) e!73723)))

(declare-fun b!113475 () Bool)

(assert (=> b!113475 (= e!73724 (getValueByKey!160 (t!5813 (toList!815 lt!58508)) (_1!1238 lt!58422)))))

(declare-fun b!113476 () Bool)

(assert (=> b!113476 (= e!73724 None!164)))

(declare-fun b!113473 () Bool)

(assert (=> b!113473 (= e!73723 (Some!165 (_2!1238 (h!2235 (toList!815 lt!58508)))))))

(assert (= (and d!32239 c!20346) b!113473))

(assert (= (and d!32239 (not c!20346)) b!113474))

(assert (= (and b!113474 c!20347) b!113475))

(assert (= (and b!113474 (not c!20347)) b!113476))

(declare-fun m!129643 () Bool)

(assert (=> b!113475 m!129643))

(assert (=> b!112939 d!32239))

(declare-fun d!32241 () Bool)

(declare-fun e!73725 () Bool)

(assert (=> d!32241 e!73725))

(declare-fun res!55898 () Bool)

(assert (=> d!32241 (=> res!55898 e!73725)))

(declare-fun lt!58886 () Bool)

(assert (=> d!32241 (= res!55898 (not lt!58886))))

(declare-fun lt!58889 () Bool)

(assert (=> d!32241 (= lt!58886 lt!58889)))

(declare-fun lt!58888 () Unit!3521)

(declare-fun e!73726 () Unit!3521)

(assert (=> d!32241 (= lt!58888 e!73726)))

(declare-fun c!20348 () Bool)

(assert (=> d!32241 (= c!20348 lt!58889)))

(assert (=> d!32241 (= lt!58889 (containsKey!164 (toList!815 call!12159) (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590))))))

(assert (=> d!32241 (= (contains!846 call!12159 (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590))) lt!58886)))

(declare-fun b!113477 () Bool)

(declare-fun lt!58887 () Unit!3521)

(assert (=> b!113477 (= e!73726 lt!58887)))

(assert (=> b!113477 (= lt!58887 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 call!12159) (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590))))))

(assert (=> b!113477 (isDefined!113 (getValueByKey!160 (toList!815 call!12159) (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590))))))

(declare-fun b!113478 () Bool)

(declare-fun Unit!3539 () Unit!3521)

(assert (=> b!113478 (= e!73726 Unit!3539)))

(declare-fun b!113479 () Bool)

(assert (=> b!113479 (= e!73725 (isDefined!113 (getValueByKey!160 (toList!815 call!12159) (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590)))))))

(assert (= (and d!32241 c!20348) b!113477))

(assert (= (and d!32241 (not c!20348)) b!113478))

(assert (= (and d!32241 (not res!55898)) b!113479))

(assert (=> d!32241 m!129149))

(declare-fun m!129645 () Bool)

(assert (=> d!32241 m!129645))

(assert (=> b!113477 m!129149))

(declare-fun m!129647 () Bool)

(assert (=> b!113477 m!129647))

(assert (=> b!113477 m!129149))

(declare-fun m!129649 () Bool)

(assert (=> b!113477 m!129649))

(assert (=> b!113477 m!129649))

(declare-fun m!129651 () Bool)

(assert (=> b!113477 m!129651))

(assert (=> b!113479 m!129149))

(assert (=> b!113479 m!129649))

(assert (=> b!113479 m!129649))

(assert (=> b!113479 m!129651))

(assert (=> b!113063 d!32241))

(declare-fun d!32243 () Bool)

(declare-fun e!73729 () Bool)

(assert (=> d!32243 e!73729))

(declare-fun res!55901 () Bool)

(assert (=> d!32243 (=> (not res!55901) (not e!73729))))

(assert (=> d!32243 (= res!55901 (and (bvsge (index!3205 lt!58590) #b00000000000000000000000000000000) (bvslt (index!3205 lt!58590) (size!2352 (_keys!4381 newMap!16)))))))

(declare-fun lt!58892 () Unit!3521)

(declare-fun choose!716 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) Int) Unit!3521)

(assert (=> d!32243 (= lt!58892 (choose!716 (_keys!4381 newMap!16) lt!58588 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (defaultEntry!2661 newMap!16)))))

(assert (=> d!32243 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32243 (= (lemmaValidKeyInArrayIsInListMap!112 (_keys!4381 newMap!16) lt!58588 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (defaultEntry!2661 newMap!16)) lt!58892)))

(declare-fun b!113482 () Bool)

(assert (=> b!113482 (= e!73729 (contains!846 (getCurrentListMap!499 (_keys!4381 newMap!16) lt!58588 (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58590))))))

(assert (= (and d!32243 res!55901) b!113482))

(declare-fun m!129653 () Bool)

(assert (=> d!32243 m!129653))

(assert (=> d!32243 m!129295))

(declare-fun m!129655 () Bool)

(assert (=> b!113482 m!129655))

(assert (=> b!113482 m!129149))

(assert (=> b!113482 m!129655))

(assert (=> b!113482 m!129149))

(declare-fun m!129657 () Bool)

(assert (=> b!113482 m!129657))

(assert (=> b!113063 d!32243))

(declare-fun d!32245 () Bool)

(declare-fun e!73732 () Bool)

(assert (=> d!32245 e!73732))

(declare-fun res!55904 () Bool)

(assert (=> d!32245 (=> (not res!55904) (not e!73732))))

(assert (=> d!32245 (= res!55904 (and (bvsge (index!3205 lt!58590) #b00000000000000000000000000000000) (bvslt (index!3205 lt!58590) (size!2353 (_values!2644 newMap!16)))))))

(declare-fun lt!58895 () Unit!3521)

(declare-fun choose!717 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 32) (_ BitVec 64) V!3259 Int) Unit!3521)

(assert (=> d!32245 (= lt!58895 (choose!717 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (defaultEntry!2661 newMap!16)))))

(assert (=> d!32245 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32245 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (index!3205 lt!58590) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428 (defaultEntry!2661 newMap!16)) lt!58895)))

(declare-fun b!113485 () Bool)

(assert (=> b!113485 (= e!73732 (= (+!154 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (getCurrentListMap!499 (_keys!4381 newMap!16) (array!4420 (store (arr!2094 (_values!2644 newMap!16)) (index!3205 lt!58590) (ValueCellFull!1011 lt!58428)) (size!2353 (_values!2644 newMap!16))) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16))))))

(assert (= (and d!32245 res!55904) b!113485))

(assert (=> d!32245 m!128915))

(declare-fun m!129659 () Bool)

(assert (=> d!32245 m!129659))

(assert (=> d!32245 m!129295))

(assert (=> b!113485 m!129133))

(assert (=> b!113485 m!129133))

(assert (=> b!113485 m!129619))

(assert (=> b!113485 m!129153))

(declare-fun m!129661 () Bool)

(assert (=> b!113485 m!129661))

(assert (=> b!113063 d!32245))

(declare-fun d!32247 () Bool)

(declare-fun res!55905 () Bool)

(declare-fun e!73733 () Bool)

(assert (=> d!32247 (=> res!55905 e!73733)))

(assert (=> d!32247 (= res!55905 (= (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32247 (= (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000) e!73733)))

(declare-fun b!113486 () Bool)

(declare-fun e!73734 () Bool)

(assert (=> b!113486 (= e!73733 e!73734)))

(declare-fun res!55906 () Bool)

(assert (=> b!113486 (=> (not res!55906) (not e!73734))))

(assert (=> b!113486 (= res!55906 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113487 () Bool)

(assert (=> b!113487 (= e!73734 (arrayContainsKey!0 (_keys!4381 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32247 (not res!55905)) b!113486))

(assert (= (and b!113486 res!55906) b!113487))

(assert (=> d!32247 m!129383))

(assert (=> b!113487 m!128915))

(declare-fun m!129663 () Bool)

(assert (=> b!113487 m!129663))

(assert (=> bm!12153 d!32247))

(declare-fun d!32249 () Bool)

(assert (=> d!32249 (not (contains!846 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486)) lt!58482))))

(declare-fun lt!58898 () Unit!3521)

(declare-fun choose!718 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> d!32249 (= lt!58898 (choose!718 lt!58483 lt!58485 lt!58486 lt!58482))))

(declare-fun e!73737 () Bool)

(assert (=> d!32249 e!73737))

(declare-fun res!55909 () Bool)

(assert (=> d!32249 (=> (not res!55909) (not e!73737))))

(assert (=> d!32249 (= res!55909 (not (contains!846 lt!58483 lt!58482)))))

(assert (=> d!32249 (= (addStillNotContains!50 lt!58483 lt!58485 lt!58486 lt!58482) lt!58898)))

(declare-fun b!113491 () Bool)

(assert (=> b!113491 (= e!73737 (not (= lt!58485 lt!58482)))))

(assert (= (and d!32249 res!55909) b!113491))

(assert (=> d!32249 m!129043))

(assert (=> d!32249 m!129043))

(assert (=> d!32249 m!129045))

(declare-fun m!129665 () Bool)

(assert (=> d!32249 m!129665))

(declare-fun m!129667 () Bool)

(assert (=> d!32249 m!129667))

(assert (=> b!112925 d!32249))

(declare-fun d!32251 () Bool)

(declare-fun e!73738 () Bool)

(assert (=> d!32251 e!73738))

(declare-fun res!55910 () Bool)

(assert (=> d!32251 (=> res!55910 e!73738)))

(declare-fun lt!58899 () Bool)

(assert (=> d!32251 (= res!55910 (not lt!58899))))

(declare-fun lt!58902 () Bool)

(assert (=> d!32251 (= lt!58899 lt!58902)))

(declare-fun lt!58901 () Unit!3521)

(declare-fun e!73739 () Unit!3521)

(assert (=> d!32251 (= lt!58901 e!73739)))

(declare-fun c!20349 () Bool)

(assert (=> d!32251 (= c!20349 lt!58902)))

(assert (=> d!32251 (= lt!58902 (containsKey!164 (toList!815 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486))) lt!58482))))

(assert (=> d!32251 (= (contains!846 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486)) lt!58482) lt!58899)))

(declare-fun b!113492 () Bool)

(declare-fun lt!58900 () Unit!3521)

(assert (=> b!113492 (= e!73739 lt!58900)))

(assert (=> b!113492 (= lt!58900 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486))) lt!58482))))

(assert (=> b!113492 (isDefined!113 (getValueByKey!160 (toList!815 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486))) lt!58482))))

(declare-fun b!113493 () Bool)

(declare-fun Unit!3540 () Unit!3521)

(assert (=> b!113493 (= e!73739 Unit!3540)))

(declare-fun b!113494 () Bool)

(assert (=> b!113494 (= e!73738 (isDefined!113 (getValueByKey!160 (toList!815 (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486))) lt!58482)))))

(assert (= (and d!32251 c!20349) b!113492))

(assert (= (and d!32251 (not c!20349)) b!113493))

(assert (= (and d!32251 (not res!55910)) b!113494))

(declare-fun m!129669 () Bool)

(assert (=> d!32251 m!129669))

(declare-fun m!129671 () Bool)

(assert (=> b!113492 m!129671))

(declare-fun m!129673 () Bool)

(assert (=> b!113492 m!129673))

(assert (=> b!113492 m!129673))

(declare-fun m!129675 () Bool)

(assert (=> b!113492 m!129675))

(assert (=> b!113494 m!129673))

(assert (=> b!113494 m!129673))

(assert (=> b!113494 m!129675))

(assert (=> b!112925 d!32251))

(declare-fun d!32253 () Bool)

(declare-fun e!73740 () Bool)

(assert (=> d!32253 e!73740))

(declare-fun res!55912 () Bool)

(assert (=> d!32253 (=> (not res!55912) (not e!73740))))

(declare-fun lt!58904 () ListLongMap!1599)

(assert (=> d!32253 (= res!55912 (contains!846 lt!58904 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!58905 () List!1639)

(assert (=> d!32253 (= lt!58904 (ListLongMap!1600 lt!58905))))

(declare-fun lt!58903 () Unit!3521)

(declare-fun lt!58906 () Unit!3521)

(assert (=> d!32253 (= lt!58903 lt!58906)))

(assert (=> d!32253 (= (getValueByKey!160 lt!58905 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32253 (= lt!58906 (lemmaContainsTupThenGetReturnValue!76 lt!58905 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32253 (= lt!58905 (insertStrictlySorted!79 (toList!815 call!12105) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32253 (= (+!154 call!12105 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!58904)))

(declare-fun b!113495 () Bool)

(declare-fun res!55911 () Bool)

(assert (=> b!113495 (=> (not res!55911) (not e!73740))))

(assert (=> b!113495 (= res!55911 (= (getValueByKey!160 (toList!815 lt!58904) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!113496 () Bool)

(assert (=> b!113496 (= e!73740 (contains!847 (toList!815 lt!58904) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!32253 res!55912) b!113495))

(assert (= (and b!113495 res!55911) b!113496))

(declare-fun m!129677 () Bool)

(assert (=> d!32253 m!129677))

(declare-fun m!129679 () Bool)

(assert (=> d!32253 m!129679))

(declare-fun m!129681 () Bool)

(assert (=> d!32253 m!129681))

(declare-fun m!129683 () Bool)

(assert (=> d!32253 m!129683))

(declare-fun m!129685 () Bool)

(assert (=> b!113495 m!129685))

(declare-fun m!129687 () Bool)

(assert (=> b!113496 m!129687))

(assert (=> b!112925 d!32253))

(assert (=> b!112925 d!32233))

(declare-fun d!32255 () Bool)

(declare-fun e!73741 () Bool)

(assert (=> d!32255 e!73741))

(declare-fun res!55914 () Bool)

(assert (=> d!32255 (=> (not res!55914) (not e!73741))))

(declare-fun lt!58908 () ListLongMap!1599)

(assert (=> d!32255 (= res!55914 (contains!846 lt!58908 (_1!1238 (tuple2!2455 lt!58485 lt!58486))))))

(declare-fun lt!58909 () List!1639)

(assert (=> d!32255 (= lt!58908 (ListLongMap!1600 lt!58909))))

(declare-fun lt!58907 () Unit!3521)

(declare-fun lt!58910 () Unit!3521)

(assert (=> d!32255 (= lt!58907 lt!58910)))

(assert (=> d!32255 (= (getValueByKey!160 lt!58909 (_1!1238 (tuple2!2455 lt!58485 lt!58486))) (Some!165 (_2!1238 (tuple2!2455 lt!58485 lt!58486))))))

(assert (=> d!32255 (= lt!58910 (lemmaContainsTupThenGetReturnValue!76 lt!58909 (_1!1238 (tuple2!2455 lt!58485 lt!58486)) (_2!1238 (tuple2!2455 lt!58485 lt!58486))))))

(assert (=> d!32255 (= lt!58909 (insertStrictlySorted!79 (toList!815 lt!58483) (_1!1238 (tuple2!2455 lt!58485 lt!58486)) (_2!1238 (tuple2!2455 lt!58485 lt!58486))))))

(assert (=> d!32255 (= (+!154 lt!58483 (tuple2!2455 lt!58485 lt!58486)) lt!58908)))

(declare-fun b!113497 () Bool)

(declare-fun res!55913 () Bool)

(assert (=> b!113497 (=> (not res!55913) (not e!73741))))

(assert (=> b!113497 (= res!55913 (= (getValueByKey!160 (toList!815 lt!58908) (_1!1238 (tuple2!2455 lt!58485 lt!58486))) (Some!165 (_2!1238 (tuple2!2455 lt!58485 lt!58486)))))))

(declare-fun b!113498 () Bool)

(assert (=> b!113498 (= e!73741 (contains!847 (toList!815 lt!58908) (tuple2!2455 lt!58485 lt!58486)))))

(assert (= (and d!32255 res!55914) b!113497))

(assert (= (and b!113497 res!55913) b!113498))

(declare-fun m!129689 () Bool)

(assert (=> d!32255 m!129689))

(declare-fun m!129691 () Bool)

(assert (=> d!32255 m!129691))

(declare-fun m!129693 () Bool)

(assert (=> d!32255 m!129693))

(declare-fun m!129695 () Bool)

(assert (=> d!32255 m!129695))

(declare-fun m!129697 () Bool)

(assert (=> b!113497 m!129697))

(declare-fun m!129699 () Bool)

(assert (=> b!113498 m!129699))

(assert (=> b!112925 d!32255))

(declare-fun b!113500 () Bool)

(declare-fun e!73742 () Option!166)

(declare-fun e!73743 () Option!166)

(assert (=> b!113500 (= e!73742 e!73743)))

(declare-fun c!20351 () Bool)

(assert (=> b!113500 (= c!20351 (and ((_ is Cons!1635) (toList!815 lt!58512)) (not (= (_1!1238 (h!2235 (toList!815 lt!58512))) (_1!1238 lt!58423)))))))

(declare-fun d!32257 () Bool)

(declare-fun c!20350 () Bool)

(assert (=> d!32257 (= c!20350 (and ((_ is Cons!1635) (toList!815 lt!58512)) (= (_1!1238 (h!2235 (toList!815 lt!58512))) (_1!1238 lt!58423))))))

(assert (=> d!32257 (= (getValueByKey!160 (toList!815 lt!58512) (_1!1238 lt!58423)) e!73742)))

(declare-fun b!113501 () Bool)

(assert (=> b!113501 (= e!73743 (getValueByKey!160 (t!5813 (toList!815 lt!58512)) (_1!1238 lt!58423)))))

(declare-fun b!113502 () Bool)

(assert (=> b!113502 (= e!73743 None!164)))

(declare-fun b!113499 () Bool)

(assert (=> b!113499 (= e!73742 (Some!165 (_2!1238 (h!2235 (toList!815 lt!58512)))))))

(assert (= (and d!32257 c!20350) b!113499))

(assert (= (and d!32257 (not c!20350)) b!113500))

(assert (= (and b!113500 c!20351) b!113501))

(assert (= (and b!113500 (not c!20351)) b!113502))

(declare-fun m!129701 () Bool)

(assert (=> b!113501 m!129701))

(assert (=> b!112941 d!32257))

(assert (=> b!113170 d!32223))

(declare-fun d!32259 () Bool)

(declare-fun e!73744 () Bool)

(assert (=> d!32259 e!73744))

(declare-fun res!55915 () Bool)

(assert (=> d!32259 (=> res!55915 e!73744)))

(declare-fun lt!58911 () Bool)

(assert (=> d!32259 (= res!55915 (not lt!58911))))

(declare-fun lt!58914 () Bool)

(assert (=> d!32259 (= lt!58911 lt!58914)))

(declare-fun lt!58913 () Unit!3521)

(declare-fun e!73745 () Unit!3521)

(assert (=> d!32259 (= lt!58913 e!73745)))

(declare-fun c!20352 () Bool)

(assert (=> d!32259 (= c!20352 lt!58914)))

(assert (=> d!32259 (= lt!58914 (containsKey!164 (toList!815 lt!58487) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32259 (= (contains!846 lt!58487 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58911)))

(declare-fun b!113503 () Bool)

(declare-fun lt!58912 () Unit!3521)

(assert (=> b!113503 (= e!73745 lt!58912)))

(assert (=> b!113503 (= lt!58912 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58487) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113503 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113504 () Bool)

(declare-fun Unit!3541 () Unit!3521)

(assert (=> b!113504 (= e!73745 Unit!3541)))

(declare-fun b!113505 () Bool)

(assert (=> b!113505 (= e!73744 (isDefined!113 (getValueByKey!160 (toList!815 lt!58487) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32259 c!20352) b!113503))

(assert (= (and d!32259 (not c!20352)) b!113504))

(assert (= (and d!32259 (not res!55915)) b!113505))

(assert (=> d!32259 m!129047))

(declare-fun m!129703 () Bool)

(assert (=> d!32259 m!129703))

(assert (=> b!113503 m!129047))

(declare-fun m!129705 () Bool)

(assert (=> b!113503 m!129705))

(assert (=> b!113503 m!129047))

(declare-fun m!129707 () Bool)

(assert (=> b!113503 m!129707))

(assert (=> b!113503 m!129707))

(declare-fun m!129709 () Bool)

(assert (=> b!113503 m!129709))

(assert (=> b!113505 m!129047))

(assert (=> b!113505 m!129707))

(assert (=> b!113505 m!129707))

(assert (=> b!113505 m!129709))

(assert (=> b!112929 d!32259))

(declare-fun b!113506 () Bool)

(declare-fun e!73748 () Bool)

(declare-fun e!73749 () Bool)

(assert (=> b!113506 (= e!73748 e!73749)))

(declare-fun res!55918 () Bool)

(assert (=> b!113506 (=> (not res!55918) (not e!73749))))

(declare-fun e!73746 () Bool)

(assert (=> b!113506 (= res!55918 (not e!73746))))

(declare-fun res!55917 () Bool)

(assert (=> b!113506 (=> (not res!55917) (not e!73746))))

(assert (=> b!113506 (= res!55917 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113507 () Bool)

(assert (=> b!113507 (= e!73746 (contains!848 Nil!1637 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113508 () Bool)

(declare-fun e!73747 () Bool)

(declare-fun call!12247 () Bool)

(assert (=> b!113508 (= e!73747 call!12247)))

(declare-fun d!32261 () Bool)

(declare-fun res!55916 () Bool)

(assert (=> d!32261 (=> res!55916 e!73748)))

(assert (=> d!32261 (= res!55916 (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32261 (= (arrayNoDuplicates!0 (_keys!4381 newMap!16) #b00000000000000000000000000000000 Nil!1637) e!73748)))

(declare-fun b!113509 () Bool)

(assert (=> b!113509 (= e!73747 call!12247)))

(declare-fun b!113510 () Bool)

(assert (=> b!113510 (= e!73749 e!73747)))

(declare-fun c!20353 () Bool)

(assert (=> b!113510 (= c!20353 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12244 () Bool)

(assert (=> bm!12244 (= call!12247 (arrayNoDuplicates!0 (_keys!4381 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20353 (Cons!1636 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000) Nil!1637) Nil!1637)))))

(assert (= (and d!32261 (not res!55916)) b!113506))

(assert (= (and b!113506 res!55917) b!113507))

(assert (= (and b!113506 res!55918) b!113510))

(assert (= (and b!113510 c!20353) b!113508))

(assert (= (and b!113510 (not c!20353)) b!113509))

(assert (= (or b!113508 b!113509) bm!12244))

(assert (=> b!113506 m!129383))

(assert (=> b!113506 m!129383))

(assert (=> b!113506 m!129389))

(assert (=> b!113507 m!129383))

(assert (=> b!113507 m!129383))

(declare-fun m!129711 () Bool)

(assert (=> b!113507 m!129711))

(assert (=> b!113510 m!129383))

(assert (=> b!113510 m!129383))

(assert (=> b!113510 m!129389))

(assert (=> bm!12244 m!129383))

(declare-fun m!129713 () Bool)

(assert (=> bm!12244 m!129713))

(assert (=> b!113193 d!32261))

(declare-fun d!32263 () Bool)

(assert (=> d!32263 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000)))

(declare-fun lt!58917 () Unit!3521)

(declare-fun choose!13 (array!4417 (_ BitVec 64) (_ BitVec 32)) Unit!3521)

(assert (=> d!32263 (= lt!58917 (choose!13 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000))))

(assert (=> d!32263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!32263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000) lt!58917)))

(declare-fun bs!4653 () Bool)

(assert (= bs!4653 d!32263))

(assert (=> bs!4653 m!129205))

(declare-fun m!129715 () Bool)

(assert (=> bs!4653 m!129715))

(assert (=> b!113116 d!32263))

(declare-fun d!32265 () Bool)

(declare-fun res!55919 () Bool)

(declare-fun e!73750 () Bool)

(assert (=> d!32265 (=> res!55919 e!73750)))

(assert (=> d!32265 (= res!55919 (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) lt!58625))))

(assert (=> d!32265 (= (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 #b00000000000000000000000000000000) e!73750)))

(declare-fun b!113511 () Bool)

(declare-fun e!73751 () Bool)

(assert (=> b!113511 (= e!73750 e!73751)))

(declare-fun res!55920 () Bool)

(assert (=> b!113511 (=> (not res!55920) (not e!73751))))

(assert (=> b!113511 (= res!55920 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113512 () Bool)

(assert (=> b!113512 (= e!73751 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58625 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32265 (not res!55919)) b!113511))

(assert (= (and b!113511 res!55920) b!113512))

(assert (=> d!32265 m!129197))

(declare-fun m!129717 () Bool)

(assert (=> b!113512 m!129717))

(assert (=> b!113116 d!32265))

(declare-fun b!113514 () Bool)

(declare-fun e!73753 () SeekEntryResult!263)

(declare-fun lt!58918 () SeekEntryResult!263)

(assert (=> b!113514 (= e!73753 (Found!263 (index!3206 lt!58918)))))

(declare-fun b!113515 () Bool)

(declare-fun e!73754 () SeekEntryResult!263)

(assert (=> b!113515 (= e!73754 (MissingZero!263 (index!3206 lt!58918)))))

(declare-fun b!113516 () Bool)

(declare-fun e!73752 () SeekEntryResult!263)

(assert (=> b!113516 (= e!73752 e!73753)))

(declare-fun lt!58919 () (_ BitVec 64))

(assert (=> b!113516 (= lt!58919 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (index!3206 lt!58918)))))

(declare-fun c!20355 () Bool)

(assert (=> b!113516 (= c!20355 (= lt!58919 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113517 () Bool)

(declare-fun c!20356 () Bool)

(assert (=> b!113517 (= c!20356 (= lt!58919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113517 (= e!73753 e!73754)))

(declare-fun b!113518 () Bool)

(assert (=> b!113518 (= e!73752 Undefined!263)))

(declare-fun d!32267 () Bool)

(declare-fun lt!58920 () SeekEntryResult!263)

(assert (=> d!32267 (and (or ((_ is Undefined!263) lt!58920) (not ((_ is Found!263) lt!58920)) (and (bvsge (index!3205 lt!58920) #b00000000000000000000000000000000) (bvslt (index!3205 lt!58920) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!263) lt!58920) ((_ is Found!263) lt!58920) (not ((_ is MissingZero!263) lt!58920)) (and (bvsge (index!3204 lt!58920) #b00000000000000000000000000000000) (bvslt (index!3204 lt!58920) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!263) lt!58920) ((_ is Found!263) lt!58920) ((_ is MissingZero!263) lt!58920) (not ((_ is MissingVacant!263) lt!58920)) (and (bvsge (index!3207 lt!58920) #b00000000000000000000000000000000) (bvslt (index!3207 lt!58920) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!263) lt!58920) (ite ((_ is Found!263) lt!58920) (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (index!3205 lt!58920)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!263) lt!58920) (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (index!3204 lt!58920)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!263) lt!58920) (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (index!3207 lt!58920)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32267 (= lt!58920 e!73752)))

(declare-fun c!20354 () Bool)

(assert (=> d!32267 (= c!20354 (and ((_ is Intermediate!263) lt!58918) (undefined!1075 lt!58918)))))

(assert (=> d!32267 (= lt!58918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (mask!6845 (v!2959 (underlying!376 thiss!992)))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32267 (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32267 (= (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))) lt!58920)))

(declare-fun b!113513 () Bool)

(assert (=> b!113513 (= e!73754 (seekKeyOrZeroReturnVacant!0 (x!14184 lt!58918) (index!3206 lt!58918) (index!3206 lt!58918) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32267 c!20354) b!113518))

(assert (= (and d!32267 (not c!20354)) b!113516))

(assert (= (and b!113516 c!20355) b!113514))

(assert (= (and b!113516 (not c!20355)) b!113517))

(assert (= (and b!113517 c!20356) b!113515))

(assert (= (and b!113517 (not c!20356)) b!113513))

(declare-fun m!129719 () Bool)

(assert (=> b!113516 m!129719))

(declare-fun m!129721 () Bool)

(assert (=> d!32267 m!129721))

(assert (=> d!32267 m!129197))

(declare-fun m!129723 () Bool)

(assert (=> d!32267 m!129723))

(assert (=> d!32267 m!129197))

(assert (=> d!32267 m!129721))

(declare-fun m!129725 () Bool)

(assert (=> d!32267 m!129725))

(declare-fun m!129727 () Bool)

(assert (=> d!32267 m!129727))

(assert (=> d!32267 m!128953))

(declare-fun m!129729 () Bool)

(assert (=> d!32267 m!129729))

(assert (=> b!113513 m!129197))

(declare-fun m!129731 () Bool)

(assert (=> b!113513 m!129731))

(assert (=> b!113116 d!32267))

(declare-fun d!32269 () Bool)

(declare-fun lt!58923 () (_ BitVec 32))

(assert (=> d!32269 (and (bvsge lt!58923 #b00000000000000000000000000000000) (bvsle lt!58923 (bvsub (size!2352 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!73759 () (_ BitVec 32))

(assert (=> d!32269 (= lt!58923 e!73759)))

(declare-fun c!20361 () Bool)

(assert (=> d!32269 (= c!20361 (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32269 (and (bvsle #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2352 (_keys!4381 newMap!16)) (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32269 (= (arrayCountValidKeys!0 (_keys!4381 newMap!16) #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) lt!58923)))

(declare-fun bm!12247 () Bool)

(declare-fun call!12250 () (_ BitVec 32))

(assert (=> bm!12247 (= call!12250 (arrayCountValidKeys!0 (_keys!4381 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113527 () Bool)

(declare-fun e!73760 () (_ BitVec 32))

(assert (=> b!113527 (= e!73760 (bvadd #b00000000000000000000000000000001 call!12250))))

(declare-fun b!113528 () Bool)

(assert (=> b!113528 (= e!73760 call!12250)))

(declare-fun b!113529 () Bool)

(assert (=> b!113529 (= e!73759 e!73760)))

(declare-fun c!20362 () Bool)

(assert (=> b!113529 (= c!20362 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113530 () Bool)

(assert (=> b!113530 (= e!73759 #b00000000000000000000000000000000)))

(assert (= (and d!32269 c!20361) b!113530))

(assert (= (and d!32269 (not c!20361)) b!113529))

(assert (= (and b!113529 c!20362) b!113527))

(assert (= (and b!113529 (not c!20362)) b!113528))

(assert (= (or b!113527 b!113528) bm!12247))

(declare-fun m!129733 () Bool)

(assert (=> bm!12247 m!129733))

(assert (=> b!113529 m!129383))

(assert (=> b!113529 m!129383))

(assert (=> b!113529 m!129389))

(assert (=> b!113191 d!32269))

(declare-fun b!113531 () Bool)

(declare-fun e!73762 () Bool)

(declare-fun call!12251 () Bool)

(assert (=> b!113531 (= e!73762 call!12251)))

(declare-fun d!32271 () Bool)

(declare-fun res!55921 () Bool)

(declare-fun e!73761 () Bool)

(assert (=> d!32271 (=> res!55921 e!73761)))

(assert (=> d!32271 (= res!55921 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32271 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))) e!73761)))

(declare-fun b!113532 () Bool)

(assert (=> b!113532 (= e!73761 e!73762)))

(declare-fun c!20363 () Bool)

(assert (=> b!113532 (= c!20363 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!12248 () Bool)

(assert (=> bm!12248 (= call!12251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113533 () Bool)

(declare-fun e!73763 () Bool)

(assert (=> b!113533 (= e!73763 call!12251)))

(declare-fun b!113534 () Bool)

(assert (=> b!113534 (= e!73762 e!73763)))

(declare-fun lt!58926 () (_ BitVec 64))

(assert (=> b!113534 (= lt!58926 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!58924 () Unit!3521)

(assert (=> b!113534 (= lt!58924 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58926 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!113534 (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) lt!58926 #b00000000000000000000000000000000)))

(declare-fun lt!58925 () Unit!3521)

(assert (=> b!113534 (= lt!58925 lt!58924)))

(declare-fun res!55922 () Bool)

(assert (=> b!113534 (= res!55922 (= (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4381 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992)))) (Found!263 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!113534 (=> (not res!55922) (not e!73763))))

(assert (= (and d!32271 (not res!55921)) b!113532))

(assert (= (and b!113532 c!20363) b!113534))

(assert (= (and b!113532 (not c!20363)) b!113531))

(assert (= (and b!113534 res!55922) b!113533))

(assert (= (or b!113533 b!113531) bm!12248))

(declare-fun m!129735 () Bool)

(assert (=> b!113532 m!129735))

(assert (=> b!113532 m!129735))

(declare-fun m!129737 () Bool)

(assert (=> b!113532 m!129737))

(declare-fun m!129739 () Bool)

(assert (=> bm!12248 m!129739))

(assert (=> b!113534 m!129735))

(declare-fun m!129741 () Bool)

(assert (=> b!113534 m!129741))

(declare-fun m!129743 () Bool)

(assert (=> b!113534 m!129743))

(assert (=> b!113534 m!129735))

(declare-fun m!129745 () Bool)

(assert (=> b!113534 m!129745))

(assert (=> bm!12180 d!32271))

(declare-fun d!32273 () Bool)

(declare-fun e!73764 () Bool)

(assert (=> d!32273 e!73764))

(declare-fun res!55924 () Bool)

(assert (=> d!32273 (=> (not res!55924) (not e!73764))))

(declare-fun lt!58928 () ListLongMap!1599)

(assert (=> d!32273 (= res!55924 (contains!846 lt!58928 (_1!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(declare-fun lt!58929 () List!1639)

(assert (=> d!32273 (= lt!58928 (ListLongMap!1600 lt!58929))))

(declare-fun lt!58927 () Unit!3521)

(declare-fun lt!58930 () Unit!3521)

(assert (=> d!32273 (= lt!58927 lt!58930)))

(assert (=> d!32273 (= (getValueByKey!160 lt!58929 (_1!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))) (Some!165 (_2!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(assert (=> d!32273 (= lt!58930 (lemmaContainsTupThenGetReturnValue!76 lt!58929 (_1!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (_2!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(assert (=> d!32273 (= lt!58929 (insertStrictlySorted!79 (toList!815 e!73478) (_1!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (_2!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(assert (=> d!32273 (= (+!154 e!73478 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) lt!58928)))

(declare-fun b!113535 () Bool)

(declare-fun res!55923 () Bool)

(assert (=> b!113535 (=> (not res!55923) (not e!73764))))

(assert (=> b!113535 (= res!55923 (= (getValueByKey!160 (toList!815 lt!58928) (_1!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))) (Some!165 (_2!1238 (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))))

(declare-fun b!113536 () Bool)

(assert (=> b!113536 (= e!73764 (contains!847 (toList!815 lt!58928) (ite c!20221 (ite c!20229 (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58428) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (= (and d!32273 res!55924) b!113535))

(assert (= (and b!113535 res!55923) b!113536))

(declare-fun m!129747 () Bool)

(assert (=> d!32273 m!129747))

(declare-fun m!129749 () Bool)

(assert (=> d!32273 m!129749))

(declare-fun m!129751 () Bool)

(assert (=> d!32273 m!129751))

(declare-fun m!129753 () Bool)

(assert (=> d!32273 m!129753))

(declare-fun m!129755 () Bool)

(assert (=> b!113535 m!129755))

(declare-fun m!129757 () Bool)

(assert (=> b!113536 m!129757))

(assert (=> bm!12162 d!32273))

(declare-fun d!32275 () Bool)

(declare-fun res!55925 () Bool)

(declare-fun e!73765 () Bool)

(assert (=> d!32275 (=> (not res!55925) (not e!73765))))

(assert (=> d!32275 (= res!55925 (simpleValid!78 (_2!1239 lt!58581)))))

(assert (=> d!32275 (= (valid!437 (_2!1239 lt!58581)) e!73765)))

(declare-fun b!113537 () Bool)

(declare-fun res!55926 () Bool)

(assert (=> b!113537 (=> (not res!55926) (not e!73765))))

(assert (=> b!113537 (= res!55926 (= (arrayCountValidKeys!0 (_keys!4381 (_2!1239 lt!58581)) #b00000000000000000000000000000000 (size!2352 (_keys!4381 (_2!1239 lt!58581)))) (_size!514 (_2!1239 lt!58581))))))

(declare-fun b!113538 () Bool)

(declare-fun res!55927 () Bool)

(assert (=> b!113538 (=> (not res!55927) (not e!73765))))

(assert (=> b!113538 (= res!55927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 (_2!1239 lt!58581)) (mask!6845 (_2!1239 lt!58581))))))

(declare-fun b!113539 () Bool)

(assert (=> b!113539 (= e!73765 (arrayNoDuplicates!0 (_keys!4381 (_2!1239 lt!58581)) #b00000000000000000000000000000000 Nil!1637))))

(assert (= (and d!32275 res!55925) b!113537))

(assert (= (and b!113537 res!55926) b!113538))

(assert (= (and b!113538 res!55927) b!113539))

(declare-fun m!129759 () Bool)

(assert (=> d!32275 m!129759))

(declare-fun m!129761 () Bool)

(assert (=> b!113537 m!129761))

(declare-fun m!129763 () Bool)

(assert (=> b!113538 m!129763))

(declare-fun m!129765 () Bool)

(assert (=> b!113539 m!129765))

(assert (=> d!32119 d!32275))

(assert (=> d!32119 d!32147))

(declare-fun d!32277 () Bool)

(declare-fun e!73766 () Bool)

(assert (=> d!32277 e!73766))

(declare-fun res!55928 () Bool)

(assert (=> d!32277 (=> res!55928 e!73766)))

(declare-fun lt!58931 () Bool)

(assert (=> d!32277 (= res!55928 (not lt!58931))))

(declare-fun lt!58934 () Bool)

(assert (=> d!32277 (= lt!58931 lt!58934)))

(declare-fun lt!58933 () Unit!3521)

(declare-fun e!73767 () Unit!3521)

(assert (=> d!32277 (= lt!58933 e!73767)))

(declare-fun c!20364 () Bool)

(assert (=> d!32277 (= c!20364 lt!58934)))

(assert (=> d!32277 (= lt!58934 (containsKey!164 (toList!815 lt!58687) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32277 (= (contains!846 lt!58687 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58931)))

(declare-fun b!113540 () Bool)

(declare-fun lt!58932 () Unit!3521)

(assert (=> b!113540 (= e!73767 lt!58932)))

(assert (=> b!113540 (= lt!58932 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58687) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113540 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113541 () Bool)

(declare-fun Unit!3542 () Unit!3521)

(assert (=> b!113541 (= e!73767 Unit!3542)))

(declare-fun b!113542 () Bool)

(assert (=> b!113542 (= e!73766 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32277 c!20364) b!113540))

(assert (= (and d!32277 (not c!20364)) b!113541))

(assert (= (and d!32277 (not res!55928)) b!113542))

(assert (=> d!32277 m!129047))

(declare-fun m!129767 () Bool)

(assert (=> d!32277 m!129767))

(assert (=> b!113540 m!129047))

(declare-fun m!129769 () Bool)

(assert (=> b!113540 m!129769))

(assert (=> b!113540 m!129047))

(assert (=> b!113540 m!129577))

(assert (=> b!113540 m!129577))

(declare-fun m!129771 () Bool)

(assert (=> b!113540 m!129771))

(assert (=> b!113542 m!129047))

(assert (=> b!113542 m!129577))

(assert (=> b!113542 m!129577))

(assert (=> b!113542 m!129771))

(assert (=> b!113175 d!32277))

(declare-fun b!113543 () Bool)

(declare-fun e!73774 () ListLongMap!1599)

(assert (=> b!113543 (= e!73774 (ListLongMap!1600 Nil!1636))))

(declare-fun d!32279 () Bool)

(declare-fun e!73773 () Bool)

(assert (=> d!32279 e!73773))

(declare-fun res!55930 () Bool)

(assert (=> d!32279 (=> (not res!55930) (not e!73773))))

(declare-fun lt!58941 () ListLongMap!1599)

(assert (=> d!32279 (= res!55930 (not (contains!846 lt!58941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32279 (= lt!58941 e!73774)))

(declare-fun c!20368 () Bool)

(assert (=> d!32279 (= c!20368 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32279 (validMask!0 (mask!6845 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32279 (= (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))) lt!58941)))

(declare-fun b!113544 () Bool)

(declare-fun e!73769 () Bool)

(assert (=> b!113544 (= e!73769 (isEmpty!382 lt!58941))))

(declare-fun b!113545 () Bool)

(declare-fun e!73770 () ListLongMap!1599)

(assert (=> b!113545 (= e!73774 e!73770)))

(declare-fun c!20365 () Bool)

(assert (=> b!113545 (= c!20365 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113546 () Bool)

(assert (=> b!113546 (= e!73769 (= lt!58941 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113547 () Bool)

(declare-fun e!73772 () Bool)

(assert (=> b!113547 (= e!73772 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113547 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!113548 () Bool)

(declare-fun call!12252 () ListLongMap!1599)

(assert (=> b!113548 (= e!73770 call!12252)))

(declare-fun b!113549 () Bool)

(declare-fun lt!58935 () Unit!3521)

(declare-fun lt!58938 () Unit!3521)

(assert (=> b!113549 (= lt!58935 lt!58938)))

(declare-fun lt!58937 () ListLongMap!1599)

(declare-fun lt!58940 () V!3259)

(declare-fun lt!58939 () (_ BitVec 64))

(declare-fun lt!58936 () (_ BitVec 64))

(assert (=> b!113549 (not (contains!846 (+!154 lt!58937 (tuple2!2455 lt!58939 lt!58940)) lt!58936))))

(assert (=> b!113549 (= lt!58938 (addStillNotContains!50 lt!58937 lt!58939 lt!58940 lt!58936))))

(assert (=> b!113549 (= lt!58936 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!113549 (= lt!58940 (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113549 (= lt!58939 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!113549 (= lt!58937 call!12252)))

(assert (=> b!113549 (= e!73770 (+!154 call!12252 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!113550 () Bool)

(assert (=> b!113550 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!113550 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2353 (_values!2644 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun e!73771 () Bool)

(assert (=> b!113550 (= e!73771 (= (apply!102 lt!58941 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1361 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!113551 () Bool)

(declare-fun e!73768 () Bool)

(assert (=> b!113551 (= e!73768 e!73769)))

(declare-fun c!20366 () Bool)

(assert (=> b!113551 (= c!20366 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113552 () Bool)

(assert (=> b!113552 (= e!73773 e!73768)))

(declare-fun c!20367 () Bool)

(assert (=> b!113552 (= c!20367 e!73772)))

(declare-fun res!55929 () Bool)

(assert (=> b!113552 (=> (not res!55929) (not e!73772))))

(assert (=> b!113552 (= res!55929 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113553 () Bool)

(assert (=> b!113553 (= e!73768 e!73771)))

(assert (=> b!113553 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun res!55931 () Bool)

(assert (=> b!113553 (= res!55931 (contains!846 lt!58941 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113553 (=> (not res!55931) (not e!73771))))

(declare-fun b!113554 () Bool)

(declare-fun res!55932 () Bool)

(assert (=> b!113554 (=> (not res!55932) (not e!73773))))

(assert (=> b!113554 (= res!55932 (not (contains!846 lt!58941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!12249 () Bool)

(assert (=> bm!12249 (= call!12252 (getCurrentListMapNoExtraKeys!120 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (_values!2644 (v!2959 (underlying!376 thiss!992))) (mask!6845 (v!2959 (underlying!376 thiss!992))) (extraKeys!2452 (v!2959 (underlying!376 thiss!992))) (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) (minValue!2529 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32279 c!20368) b!113543))

(assert (= (and d!32279 (not c!20368)) b!113545))

(assert (= (and b!113545 c!20365) b!113549))

(assert (= (and b!113545 (not c!20365)) b!113548))

(assert (= (or b!113549 b!113548) bm!12249))

(assert (= (and d!32279 res!55930) b!113554))

(assert (= (and b!113554 res!55932) b!113552))

(assert (= (and b!113552 res!55929) b!113547))

(assert (= (and b!113552 c!20367) b!113553))

(assert (= (and b!113552 (not c!20367)) b!113551))

(assert (= (and b!113553 res!55931) b!113550))

(assert (= (and b!113551 c!20366) b!113546))

(assert (= (and b!113551 (not c!20366)) b!113544))

(declare-fun b_lambda!5075 () Bool)

(assert (=> (not b_lambda!5075) (not b!113549)))

(assert (=> b!113549 t!5810))

(declare-fun b_and!6963 () Bool)

(assert (= b_and!6959 (and (=> t!5810 result!3575) b_and!6963)))

(assert (=> b!113549 t!5812))

(declare-fun b_and!6965 () Bool)

(assert (= b_and!6961 (and (=> t!5812 result!3579) b_and!6965)))

(declare-fun b_lambda!5077 () Bool)

(assert (=> (not b_lambda!5077) (not b!113550)))

(assert (=> b!113550 t!5810))

(declare-fun b_and!6967 () Bool)

(assert (= b_and!6963 (and (=> t!5810 result!3575) b_and!6967)))

(assert (=> b!113550 t!5812))

(declare-fun b_and!6969 () Bool)

(assert (= b_and!6965 (and (=> t!5812 result!3579) b_and!6969)))

(declare-fun m!129773 () Bool)

(assert (=> b!113554 m!129773))

(declare-fun m!129775 () Bool)

(assert (=> b!113544 m!129775))

(declare-fun m!129777 () Bool)

(assert (=> b!113549 m!129777))

(assert (=> b!113549 m!128967))

(declare-fun m!129779 () Bool)

(assert (=> b!113549 m!129779))

(declare-fun m!129781 () Bool)

(assert (=> b!113549 m!129781))

(declare-fun m!129783 () Bool)

(assert (=> b!113549 m!129783))

(assert (=> b!113549 m!129783))

(declare-fun m!129785 () Bool)

(assert (=> b!113549 m!129785))

(assert (=> b!113549 m!129459))

(declare-fun m!129787 () Bool)

(assert (=> b!113549 m!129787))

(assert (=> b!113549 m!129777))

(assert (=> b!113549 m!128967))

(assert (=> b!113553 m!129459))

(assert (=> b!113553 m!129459))

(declare-fun m!129789 () Bool)

(assert (=> b!113553 m!129789))

(assert (=> b!113547 m!129459))

(assert (=> b!113547 m!129459))

(declare-fun m!129791 () Bool)

(assert (=> b!113547 m!129791))

(declare-fun m!129793 () Bool)

(assert (=> bm!12249 m!129793))

(assert (=> b!113550 m!129777))

(assert (=> b!113550 m!128967))

(assert (=> b!113550 m!129779))

(assert (=> b!113550 m!129459))

(declare-fun m!129795 () Bool)

(assert (=> b!113550 m!129795))

(assert (=> b!113550 m!129459))

(assert (=> b!113550 m!129777))

(assert (=> b!113550 m!128967))

(assert (=> b!113546 m!129793))

(assert (=> b!113545 m!129459))

(assert (=> b!113545 m!129459))

(assert (=> b!113545 m!129791))

(declare-fun m!129797 () Bool)

(assert (=> d!32279 m!129797))

(assert (=> d!32279 m!128953))

(assert (=> bm!12102 d!32279))

(assert (=> bm!12163 d!32155))

(declare-fun d!32281 () Bool)

(declare-fun e!73775 () Bool)

(assert (=> d!32281 e!73775))

(declare-fun res!55933 () Bool)

(assert (=> d!32281 (=> res!55933 e!73775)))

(declare-fun lt!58942 () Bool)

(assert (=> d!32281 (= res!55933 (not lt!58942))))

(declare-fun lt!58945 () Bool)

(assert (=> d!32281 (= lt!58942 lt!58945)))

(declare-fun lt!58944 () Unit!3521)

(declare-fun e!73776 () Unit!3521)

(assert (=> d!32281 (= lt!58944 e!73776)))

(declare-fun c!20369 () Bool)

(assert (=> d!32281 (= c!20369 lt!58945)))

(assert (=> d!32281 (= lt!58945 (containsKey!164 (toList!815 lt!58497) (_1!1238 lt!58422)))))

(assert (=> d!32281 (= (contains!846 lt!58497 (_1!1238 lt!58422)) lt!58942)))

(declare-fun b!113555 () Bool)

(declare-fun lt!58943 () Unit!3521)

(assert (=> b!113555 (= e!73776 lt!58943)))

(assert (=> b!113555 (= lt!58943 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58497) (_1!1238 lt!58422)))))

(assert (=> b!113555 (isDefined!113 (getValueByKey!160 (toList!815 lt!58497) (_1!1238 lt!58422)))))

(declare-fun b!113556 () Bool)

(declare-fun Unit!3543 () Unit!3521)

(assert (=> b!113556 (= e!73776 Unit!3543)))

(declare-fun b!113557 () Bool)

(assert (=> b!113557 (= e!73775 (isDefined!113 (getValueByKey!160 (toList!815 lt!58497) (_1!1238 lt!58422))))))

(assert (= (and d!32281 c!20369) b!113555))

(assert (= (and d!32281 (not c!20369)) b!113556))

(assert (= (and d!32281 (not res!55933)) b!113557))

(declare-fun m!129799 () Bool)

(assert (=> d!32281 m!129799))

(declare-fun m!129801 () Bool)

(assert (=> b!113555 m!129801))

(assert (=> b!113555 m!129069))

(assert (=> b!113555 m!129069))

(declare-fun m!129803 () Bool)

(assert (=> b!113555 m!129803))

(assert (=> b!113557 m!129069))

(assert (=> b!113557 m!129069))

(assert (=> b!113557 m!129803))

(assert (=> d!32105 d!32281))

(declare-fun b!113559 () Bool)

(declare-fun e!73777 () Option!166)

(declare-fun e!73778 () Option!166)

(assert (=> b!113559 (= e!73777 e!73778)))

(declare-fun c!20371 () Bool)

(assert (=> b!113559 (= c!20371 (and ((_ is Cons!1635) lt!58498) (not (= (_1!1238 (h!2235 lt!58498)) (_1!1238 lt!58422)))))))

(declare-fun d!32283 () Bool)

(declare-fun c!20370 () Bool)

(assert (=> d!32283 (= c!20370 (and ((_ is Cons!1635) lt!58498) (= (_1!1238 (h!2235 lt!58498)) (_1!1238 lt!58422))))))

(assert (=> d!32283 (= (getValueByKey!160 lt!58498 (_1!1238 lt!58422)) e!73777)))

(declare-fun b!113560 () Bool)

(assert (=> b!113560 (= e!73778 (getValueByKey!160 (t!5813 lt!58498) (_1!1238 lt!58422)))))

(declare-fun b!113561 () Bool)

(assert (=> b!113561 (= e!73778 None!164)))

(declare-fun b!113558 () Bool)

(assert (=> b!113558 (= e!73777 (Some!165 (_2!1238 (h!2235 lt!58498))))))

(assert (= (and d!32283 c!20370) b!113558))

(assert (= (and d!32283 (not c!20370)) b!113559))

(assert (= (and b!113559 c!20371) b!113560))

(assert (= (and b!113559 (not c!20371)) b!113561))

(declare-fun m!129805 () Bool)

(assert (=> b!113560 m!129805))

(assert (=> d!32105 d!32283))

(declare-fun d!32285 () Bool)

(assert (=> d!32285 (= (getValueByKey!160 lt!58498 (_1!1238 lt!58422)) (Some!165 (_2!1238 lt!58422)))))

(declare-fun lt!58946 () Unit!3521)

(assert (=> d!32285 (= lt!58946 (choose!713 lt!58498 (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(declare-fun e!73779 () Bool)

(assert (=> d!32285 e!73779))

(declare-fun res!55934 () Bool)

(assert (=> d!32285 (=> (not res!55934) (not e!73779))))

(assert (=> d!32285 (= res!55934 (isStrictlySorted!313 lt!58498))))

(assert (=> d!32285 (= (lemmaContainsTupThenGetReturnValue!76 lt!58498 (_1!1238 lt!58422) (_2!1238 lt!58422)) lt!58946)))

(declare-fun b!113562 () Bool)

(declare-fun res!55935 () Bool)

(assert (=> b!113562 (=> (not res!55935) (not e!73779))))

(assert (=> b!113562 (= res!55935 (containsKey!164 lt!58498 (_1!1238 lt!58422)))))

(declare-fun b!113563 () Bool)

(assert (=> b!113563 (= e!73779 (contains!847 lt!58498 (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422))))))

(assert (= (and d!32285 res!55934) b!113562))

(assert (= (and b!113562 res!55935) b!113563))

(assert (=> d!32285 m!129063))

(declare-fun m!129807 () Bool)

(assert (=> d!32285 m!129807))

(declare-fun m!129809 () Bool)

(assert (=> d!32285 m!129809))

(declare-fun m!129811 () Bool)

(assert (=> b!113562 m!129811))

(declare-fun m!129813 () Bool)

(assert (=> b!113563 m!129813))

(assert (=> d!32105 d!32285))

(declare-fun bm!12250 () Bool)

(declare-fun call!12253 () List!1639)

(declare-fun call!12255 () List!1639)

(assert (=> bm!12250 (= call!12253 call!12255)))

(declare-fun c!20375 () Bool)

(declare-fun b!113564 () Bool)

(assert (=> b!113564 (= c!20375 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58423))) (bvsgt (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58423)))) (_1!1238 lt!58422))))))

(declare-fun e!73783 () List!1639)

(declare-fun e!73784 () List!1639)

(assert (=> b!113564 (= e!73783 e!73784)))

(declare-fun b!113565 () Bool)

(assert (=> b!113565 (= e!73783 call!12253)))

(declare-fun b!113566 () Bool)

(declare-fun call!12254 () List!1639)

(assert (=> b!113566 (= e!73784 call!12254)))

(declare-fun b!113567 () Bool)

(declare-fun e!73781 () List!1639)

(assert (=> b!113567 (= e!73781 (insertStrictlySorted!79 (t!5813 (toList!815 (+!154 lt!58429 lt!58423))) (_1!1238 lt!58422) (_2!1238 lt!58422)))))

(declare-fun d!32287 () Bool)

(declare-fun e!73780 () Bool)

(assert (=> d!32287 e!73780))

(declare-fun res!55937 () Bool)

(assert (=> d!32287 (=> (not res!55937) (not e!73780))))

(declare-fun lt!58947 () List!1639)

(assert (=> d!32287 (= res!55937 (isStrictlySorted!313 lt!58947))))

(declare-fun e!73782 () List!1639)

(assert (=> d!32287 (= lt!58947 e!73782)))

(declare-fun c!20374 () Bool)

(assert (=> d!32287 (= c!20374 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58423))) (bvslt (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58423)))) (_1!1238 lt!58422))))))

(assert (=> d!32287 (isStrictlySorted!313 (toList!815 (+!154 lt!58429 lt!58423)))))

(assert (=> d!32287 (= (insertStrictlySorted!79 (toList!815 (+!154 lt!58429 lt!58423)) (_1!1238 lt!58422) (_2!1238 lt!58422)) lt!58947)))

(declare-fun bm!12251 () Bool)

(assert (=> bm!12251 (= call!12254 call!12253)))

(declare-fun b!113568 () Bool)

(declare-fun res!55936 () Bool)

(assert (=> b!113568 (=> (not res!55936) (not e!73780))))

(assert (=> b!113568 (= res!55936 (containsKey!164 lt!58947 (_1!1238 lt!58422)))))

(declare-fun b!113569 () Bool)

(assert (=> b!113569 (= e!73784 call!12254)))

(declare-fun bm!12252 () Bool)

(assert (=> bm!12252 (= call!12255 ($colon$colon!85 e!73781 (ite c!20374 (h!2235 (toList!815 (+!154 lt!58429 lt!58423))) (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422)))))))

(declare-fun c!20372 () Bool)

(assert (=> bm!12252 (= c!20372 c!20374)))

(declare-fun b!113570 () Bool)

(assert (=> b!113570 (= e!73782 call!12255)))

(declare-fun c!20373 () Bool)

(declare-fun b!113571 () Bool)

(assert (=> b!113571 (= e!73781 (ite c!20373 (t!5813 (toList!815 (+!154 lt!58429 lt!58423))) (ite c!20375 (Cons!1635 (h!2235 (toList!815 (+!154 lt!58429 lt!58423))) (t!5813 (toList!815 (+!154 lt!58429 lt!58423)))) Nil!1636)))))

(declare-fun b!113572 () Bool)

(assert (=> b!113572 (= e!73782 e!73783)))

(assert (=> b!113572 (= c!20373 (and ((_ is Cons!1635) (toList!815 (+!154 lt!58429 lt!58423))) (= (_1!1238 (h!2235 (toList!815 (+!154 lt!58429 lt!58423)))) (_1!1238 lt!58422))))))

(declare-fun b!113573 () Bool)

(assert (=> b!113573 (= e!73780 (contains!847 lt!58947 (tuple2!2455 (_1!1238 lt!58422) (_2!1238 lt!58422))))))

(assert (= (and d!32287 c!20374) b!113570))

(assert (= (and d!32287 (not c!20374)) b!113572))

(assert (= (and b!113572 c!20373) b!113565))

(assert (= (and b!113572 (not c!20373)) b!113564))

(assert (= (and b!113564 c!20375) b!113566))

(assert (= (and b!113564 (not c!20375)) b!113569))

(assert (= (or b!113566 b!113569) bm!12251))

(assert (= (or b!113565 bm!12251) bm!12250))

(assert (= (or b!113570 bm!12250) bm!12252))

(assert (= (and bm!12252 c!20372) b!113567))

(assert (= (and bm!12252 (not c!20372)) b!113571))

(assert (= (and d!32287 res!55937) b!113568))

(assert (= (and b!113568 res!55936) b!113573))

(declare-fun m!129815 () Bool)

(assert (=> b!113573 m!129815))

(declare-fun m!129817 () Bool)

(assert (=> b!113568 m!129817))

(declare-fun m!129819 () Bool)

(assert (=> bm!12252 m!129819))

(declare-fun m!129821 () Bool)

(assert (=> b!113567 m!129821))

(declare-fun m!129823 () Bool)

(assert (=> d!32287 m!129823))

(declare-fun m!129825 () Bool)

(assert (=> d!32287 m!129825))

(assert (=> d!32105 d!32287))

(declare-fun d!32289 () Bool)

(assert (=> d!32289 (= (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) (and (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113100 d!32289))

(declare-fun d!32291 () Bool)

(assert (=> d!32291 (= (map!1306 (_2!1239 lt!58581)) (getCurrentListMap!499 (_keys!4381 (_2!1239 lt!58581)) (_values!2644 (_2!1239 lt!58581)) (mask!6845 (_2!1239 lt!58581)) (extraKeys!2452 (_2!1239 lt!58581)) (zeroValue!2529 (_2!1239 lt!58581)) (minValue!2529 (_2!1239 lt!58581)) #b00000000000000000000000000000000 (defaultEntry!2661 (_2!1239 lt!58581))))))

(declare-fun bs!4654 () Bool)

(assert (= bs!4654 d!32291))

(declare-fun m!129827 () Bool)

(assert (=> bs!4654 m!129827))

(assert (=> bm!12171 d!32291))

(assert (=> b!113104 d!32289))

(declare-fun b!113574 () Bool)

(declare-fun e!73786 () Bool)

(declare-fun e!73789 () Bool)

(assert (=> b!113574 (= e!73786 e!73789)))

(declare-fun c!20379 () Bool)

(assert (=> b!113574 (= c!20379 (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113575 () Bool)

(declare-fun e!73793 () Unit!3521)

(declare-fun Unit!3544 () Unit!3521)

(assert (=> b!113575 (= e!73793 Unit!3544)))

(declare-fun b!113576 () Bool)

(declare-fun c!20377 () Bool)

(assert (=> b!113576 (= c!20377 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73796 () ListLongMap!1599)

(declare-fun e!73794 () ListLongMap!1599)

(assert (=> b!113576 (= e!73796 e!73794)))

(declare-fun bm!12253 () Bool)

(declare-fun call!12258 () Bool)

(declare-fun lt!58965 () ListLongMap!1599)

(assert (=> bm!12253 (= call!12258 (contains!846 lt!58965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113577 () Bool)

(declare-fun res!55945 () Bool)

(assert (=> b!113577 (=> (not res!55945) (not e!73786))))

(declare-fun e!73787 () Bool)

(assert (=> b!113577 (= res!55945 e!73787)))

(declare-fun res!55940 () Bool)

(assert (=> b!113577 (=> res!55940 e!73787)))

(declare-fun e!73791 () Bool)

(assert (=> b!113577 (= res!55940 (not e!73791))))

(declare-fun res!55944 () Bool)

(assert (=> b!113577 (=> (not res!55944) (not e!73791))))

(assert (=> b!113577 (= res!55944 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun c!20378 () Bool)

(declare-fun call!12262 () ListLongMap!1599)

(declare-fun c!20380 () Bool)

(declare-fun call!12261 () ListLongMap!1599)

(declare-fun bm!12254 () Bool)

(declare-fun call!12256 () ListLongMap!1599)

(declare-fun call!12260 () ListLongMap!1599)

(assert (=> bm!12254 (= call!12256 (+!154 (ite c!20380 call!12261 (ite c!20378 call!12262 call!12260)) (ite (or c!20380 c!20378) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 newMap!16)) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 newMap!16)))))))

(declare-fun b!113578 () Bool)

(declare-fun e!73788 () Bool)

(declare-fun e!73797 () Bool)

(assert (=> b!113578 (= e!73788 e!73797)))

(declare-fun res!55946 () Bool)

(declare-fun call!12257 () Bool)

(assert (=> b!113578 (= res!55946 call!12257)))

(assert (=> b!113578 (=> (not res!55946) (not e!73797))))

(declare-fun b!113579 () Bool)

(declare-fun res!55938 () Bool)

(assert (=> b!113579 (=> (not res!55938) (not e!73786))))

(assert (=> b!113579 (= res!55938 e!73788)))

(declare-fun c!20381 () Bool)

(assert (=> b!113579 (= c!20381 (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!113580 () Bool)

(assert (=> b!113580 (= e!73788 (not call!12257))))

(declare-fun b!113581 () Bool)

(assert (=> b!113581 (= e!73789 (not call!12258))))

(declare-fun bm!12255 () Bool)

(assert (=> bm!12255 (= call!12260 call!12262)))

(declare-fun b!113582 () Bool)

(declare-fun e!73790 () ListLongMap!1599)

(assert (=> b!113582 (= e!73790 (+!154 call!12256 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 newMap!16))))))

(declare-fun bm!12256 () Bool)

(declare-fun call!12259 () ListLongMap!1599)

(assert (=> bm!12256 (= call!12259 call!12256)))

(declare-fun b!113583 () Bool)

(declare-fun e!73785 () Bool)

(assert (=> b!113583 (= e!73785 (= (apply!102 lt!58965 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)) (get!1361 (select (arr!2094 (_values!2644 newMap!16)) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2661 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2353 (_values!2644 newMap!16))))))

(assert (=> b!113583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113584 () Bool)

(assert (=> b!113584 (= e!73797 (= (apply!102 lt!58965 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2529 newMap!16)))))

(declare-fun b!113585 () Bool)

(assert (=> b!113585 (= e!73791 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113586 () Bool)

(declare-fun lt!58958 () Unit!3521)

(assert (=> b!113586 (= e!73793 lt!58958)))

(declare-fun lt!58948 () ListLongMap!1599)

(assert (=> b!113586 (= lt!58948 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58960 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58966 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58966 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58951 () Unit!3521)

(assert (=> b!113586 (= lt!58951 (addStillContains!78 lt!58948 lt!58960 (zeroValue!2529 newMap!16) lt!58966))))

(assert (=> b!113586 (contains!846 (+!154 lt!58948 (tuple2!2455 lt!58960 (zeroValue!2529 newMap!16))) lt!58966)))

(declare-fun lt!58953 () Unit!3521)

(assert (=> b!113586 (= lt!58953 lt!58951)))

(declare-fun lt!58962 () ListLongMap!1599)

(assert (=> b!113586 (= lt!58962 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58964 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58967 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58967 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58968 () Unit!3521)

(assert (=> b!113586 (= lt!58968 (addApplyDifferent!78 lt!58962 lt!58964 (minValue!2529 newMap!16) lt!58967))))

(assert (=> b!113586 (= (apply!102 (+!154 lt!58962 (tuple2!2455 lt!58964 (minValue!2529 newMap!16))) lt!58967) (apply!102 lt!58962 lt!58967))))

(declare-fun lt!58954 () Unit!3521)

(assert (=> b!113586 (= lt!58954 lt!58968)))

(declare-fun lt!58957 () ListLongMap!1599)

(assert (=> b!113586 (= lt!58957 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58949 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58955 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58955 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58963 () Unit!3521)

(assert (=> b!113586 (= lt!58963 (addApplyDifferent!78 lt!58957 lt!58949 (zeroValue!2529 newMap!16) lt!58955))))

(assert (=> b!113586 (= (apply!102 (+!154 lt!58957 (tuple2!2455 lt!58949 (zeroValue!2529 newMap!16))) lt!58955) (apply!102 lt!58957 lt!58955))))

(declare-fun lt!58952 () Unit!3521)

(assert (=> b!113586 (= lt!58952 lt!58963)))

(declare-fun lt!58950 () ListLongMap!1599)

(assert (=> b!113586 (= lt!58950 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!58969 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58959 () (_ BitVec 64))

(assert (=> b!113586 (= lt!58959 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113586 (= lt!58958 (addApplyDifferent!78 lt!58950 lt!58969 (minValue!2529 newMap!16) lt!58959))))

(assert (=> b!113586 (= (apply!102 (+!154 lt!58950 (tuple2!2455 lt!58969 (minValue!2529 newMap!16))) lt!58959) (apply!102 lt!58950 lt!58959))))

(declare-fun b!113587 () Bool)

(assert (=> b!113587 (= e!73796 call!12259)))

(declare-fun b!113588 () Bool)

(declare-fun e!73792 () Bool)

(assert (=> b!113588 (= e!73789 e!73792)))

(declare-fun res!55942 () Bool)

(assert (=> b!113588 (= res!55942 call!12258)))

(assert (=> b!113588 (=> (not res!55942) (not e!73792))))

(declare-fun d!32293 () Bool)

(assert (=> d!32293 e!73786))

(declare-fun res!55939 () Bool)

(assert (=> d!32293 (=> (not res!55939) (not e!73786))))

(assert (=> d!32293 (= res!55939 (or (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))))

(declare-fun lt!58956 () ListLongMap!1599)

(assert (=> d!32293 (= lt!58965 lt!58956)))

(declare-fun lt!58961 () Unit!3521)

(assert (=> d!32293 (= lt!58961 e!73793)))

(declare-fun c!20376 () Bool)

(declare-fun e!73795 () Bool)

(assert (=> d!32293 (= c!20376 e!73795)))

(declare-fun res!55941 () Bool)

(assert (=> d!32293 (=> (not res!55941) (not e!73795))))

(assert (=> d!32293 (= res!55941 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32293 (= lt!58956 e!73790)))

(assert (=> d!32293 (= c!20380 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32293 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32293 (= (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) lt!58965)))

(declare-fun bm!12257 () Bool)

(assert (=> bm!12257 (= call!12262 call!12261)))

(declare-fun b!113589 () Bool)

(assert (=> b!113589 (= e!73792 (= (apply!102 lt!58965 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2529 newMap!16)))))

(declare-fun b!113590 () Bool)

(assert (=> b!113590 (= e!73787 e!73785)))

(declare-fun res!55943 () Bool)

(assert (=> b!113590 (=> (not res!55943) (not e!73785))))

(assert (=> b!113590 (= res!55943 (contains!846 lt!58965 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113590 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113591 () Bool)

(assert (=> b!113591 (= e!73794 call!12260)))

(declare-fun bm!12258 () Bool)

(assert (=> bm!12258 (= call!12257 (contains!846 lt!58965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113592 () Bool)

(assert (=> b!113592 (= e!73794 call!12259)))

(declare-fun b!113593 () Bool)

(assert (=> b!113593 (= e!73795 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113594 () Bool)

(assert (=> b!113594 (= e!73790 e!73796)))

(assert (=> b!113594 (= c!20378 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12259 () Bool)

(assert (=> bm!12259 (= call!12261 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(assert (= (and d!32293 c!20380) b!113582))

(assert (= (and d!32293 (not c!20380)) b!113594))

(assert (= (and b!113594 c!20378) b!113587))

(assert (= (and b!113594 (not c!20378)) b!113576))

(assert (= (and b!113576 c!20377) b!113592))

(assert (= (and b!113576 (not c!20377)) b!113591))

(assert (= (or b!113592 b!113591) bm!12255))

(assert (= (or b!113587 bm!12255) bm!12257))

(assert (= (or b!113587 b!113592) bm!12256))

(assert (= (or b!113582 bm!12257) bm!12259))

(assert (= (or b!113582 bm!12256) bm!12254))

(assert (= (and d!32293 res!55941) b!113593))

(assert (= (and d!32293 c!20376) b!113586))

(assert (= (and d!32293 (not c!20376)) b!113575))

(assert (= (and d!32293 res!55939) b!113577))

(assert (= (and b!113577 res!55944) b!113585))

(assert (= (and b!113577 (not res!55940)) b!113590))

(assert (= (and b!113590 res!55943) b!113583))

(assert (= (and b!113577 res!55945) b!113579))

(assert (= (and b!113579 c!20381) b!113578))

(assert (= (and b!113579 (not c!20381)) b!113580))

(assert (= (and b!113578 res!55946) b!113584))

(assert (= (or b!113578 b!113580) bm!12258))

(assert (= (and b!113579 res!55938) b!113574))

(assert (= (and b!113574 c!20379) b!113588))

(assert (= (and b!113574 (not c!20379)) b!113581))

(assert (= (and b!113588 res!55942) b!113589))

(assert (= (or b!113588 b!113581) bm!12253))

(declare-fun b_lambda!5079 () Bool)

(assert (=> (not b_lambda!5079) (not b!113583)))

(assert (=> b!113583 t!5820))

(declare-fun b_and!6971 () Bool)

(assert (= b_and!6967 (and (=> t!5820 result!3589) b_and!6971)))

(assert (=> b!113583 t!5822))

(declare-fun b_and!6973 () Bool)

(assert (= b_and!6969 (and (=> t!5822 result!3591) b_and!6973)))

(declare-fun m!129829 () Bool)

(assert (=> b!113586 m!129829))

(declare-fun m!129831 () Bool)

(assert (=> b!113586 m!129831))

(declare-fun m!129833 () Bool)

(assert (=> b!113586 m!129833))

(declare-fun m!129835 () Bool)

(assert (=> b!113586 m!129835))

(declare-fun m!129837 () Bool)

(assert (=> b!113586 m!129837))

(declare-fun m!129839 () Bool)

(assert (=> b!113586 m!129839))

(assert (=> b!113586 m!129833))

(declare-fun m!129841 () Bool)

(assert (=> b!113586 m!129841))

(declare-fun m!129843 () Bool)

(assert (=> b!113586 m!129843))

(declare-fun m!129845 () Bool)

(assert (=> b!113586 m!129845))

(declare-fun m!129847 () Bool)

(assert (=> b!113586 m!129847))

(declare-fun m!129849 () Bool)

(assert (=> b!113586 m!129849))

(assert (=> b!113586 m!129837))

(declare-fun m!129851 () Bool)

(assert (=> b!113586 m!129851))

(declare-fun m!129853 () Bool)

(assert (=> b!113586 m!129853))

(assert (=> b!113586 m!129843))

(assert (=> b!113586 m!129839))

(declare-fun m!129855 () Bool)

(assert (=> b!113586 m!129855))

(declare-fun m!129857 () Bool)

(assert (=> b!113586 m!129857))

(assert (=> b!113586 m!129383))

(declare-fun m!129859 () Bool)

(assert (=> b!113586 m!129859))

(declare-fun m!129861 () Bool)

(assert (=> bm!12253 m!129861))

(assert (=> b!113585 m!129383))

(assert (=> b!113585 m!129383))

(assert (=> b!113585 m!129389))

(declare-fun m!129863 () Bool)

(assert (=> b!113582 m!129863))

(declare-fun m!129865 () Bool)

(assert (=> bm!12254 m!129865))

(assert (=> bm!12259 m!129849))

(declare-fun m!129867 () Bool)

(assert (=> b!113589 m!129867))

(assert (=> b!113593 m!129383))

(assert (=> b!113593 m!129383))

(assert (=> b!113593 m!129389))

(assert (=> d!32293 m!129295))

(assert (=> b!113590 m!129383))

(assert (=> b!113590 m!129383))

(declare-fun m!129869 () Bool)

(assert (=> b!113590 m!129869))

(declare-fun m!129871 () Bool)

(assert (=> bm!12258 m!129871))

(assert (=> b!113583 m!129383))

(declare-fun m!129873 () Bool)

(assert (=> b!113583 m!129873))

(assert (=> b!113583 m!129403))

(declare-fun m!129875 () Bool)

(assert (=> b!113583 m!129875))

(assert (=> b!113583 m!129875))

(assert (=> b!113583 m!129403))

(declare-fun m!129877 () Bool)

(assert (=> b!113583 m!129877))

(assert (=> b!113583 m!129383))

(declare-fun m!129879 () Bool)

(assert (=> b!113584 m!129879))

(assert (=> b!113044 d!32293))

(declare-fun d!32295 () Bool)

(assert (=> d!32295 (= (get!1362 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2958 (select (arr!2094 (_values!2644 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113198 d!32295))

(declare-fun d!32297 () Bool)

(declare-fun e!73798 () Bool)

(assert (=> d!32297 e!73798))

(declare-fun res!55947 () Bool)

(assert (=> d!32297 (=> res!55947 e!73798)))

(declare-fun lt!58970 () Bool)

(assert (=> d!32297 (= res!55947 (not lt!58970))))

(declare-fun lt!58973 () Bool)

(assert (=> d!32297 (= lt!58970 lt!58973)))

(declare-fun lt!58972 () Unit!3521)

(declare-fun e!73799 () Unit!3521)

(assert (=> d!32297 (= lt!58972 e!73799)))

(declare-fun c!20382 () Bool)

(assert (=> d!32297 (= c!20382 lt!58973)))

(assert (=> d!32297 (= lt!58973 (containsKey!164 (toList!815 lt!58687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32297 (= (contains!846 lt!58687 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58970)))

(declare-fun b!113595 () Bool)

(declare-fun lt!58971 () Unit!3521)

(assert (=> b!113595 (= e!73799 lt!58971)))

(assert (=> b!113595 (= lt!58971 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 lt!58687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113595 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113596 () Bool)

(declare-fun Unit!3545 () Unit!3521)

(assert (=> b!113596 (= e!73799 Unit!3545)))

(declare-fun b!113597 () Bool)

(assert (=> b!113597 (= e!73798 (isDefined!113 (getValueByKey!160 (toList!815 lt!58687) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32297 c!20382) b!113595))

(assert (= (and d!32297 (not c!20382)) b!113596))

(assert (= (and d!32297 (not res!55947)) b!113597))

(declare-fun m!129881 () Bool)

(assert (=> d!32297 m!129881))

(declare-fun m!129883 () Bool)

(assert (=> b!113595 m!129883))

(declare-fun m!129885 () Bool)

(assert (=> b!113595 m!129885))

(assert (=> b!113595 m!129885))

(declare-fun m!129887 () Bool)

(assert (=> b!113595 m!129887))

(assert (=> b!113597 m!129885))

(assert (=> b!113597 m!129885))

(assert (=> b!113597 m!129887))

(assert (=> bm!12200 d!32297))

(assert (=> bm!12201 d!32103))

(assert (=> b!113178 d!32223))

(declare-fun d!32299 () Bool)

(declare-fun lt!58976 () Bool)

(declare-fun content!118 (List!1639) (InoxSet tuple2!2454))

(assert (=> d!32299 (= lt!58976 (select (content!118 (toList!815 lt!58497)) lt!58422))))

(declare-fun e!73804 () Bool)

(assert (=> d!32299 (= lt!58976 e!73804)))

(declare-fun res!55952 () Bool)

(assert (=> d!32299 (=> (not res!55952) (not e!73804))))

(assert (=> d!32299 (= res!55952 ((_ is Cons!1635) (toList!815 lt!58497)))))

(assert (=> d!32299 (= (contains!847 (toList!815 lt!58497) lt!58422) lt!58976)))

(declare-fun b!113602 () Bool)

(declare-fun e!73805 () Bool)

(assert (=> b!113602 (= e!73804 e!73805)))

(declare-fun res!55953 () Bool)

(assert (=> b!113602 (=> res!55953 e!73805)))

(assert (=> b!113602 (= res!55953 (= (h!2235 (toList!815 lt!58497)) lt!58422))))

(declare-fun b!113603 () Bool)

(assert (=> b!113603 (= e!73805 (contains!847 (t!5813 (toList!815 lt!58497)) lt!58422))))

(assert (= (and d!32299 res!55952) b!113602))

(assert (= (and b!113602 (not res!55953)) b!113603))

(declare-fun m!129889 () Bool)

(assert (=> d!32299 m!129889))

(declare-fun m!129891 () Bool)

(assert (=> d!32299 m!129891))

(declare-fun m!129893 () Bool)

(assert (=> b!113603 m!129893))

(assert (=> b!112936 d!32299))

(declare-fun d!32301 () Bool)

(declare-fun lt!58977 () Bool)

(assert (=> d!32301 (= lt!58977 (select (content!117 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!73807 () Bool)

(assert (=> d!32301 (= lt!58977 e!73807)))

(declare-fun res!55954 () Bool)

(assert (=> d!32301 (=> (not res!55954) (not e!73807))))

(assert (=> d!32301 (= res!55954 ((_ is Cons!1636) Nil!1637))))

(assert (=> d!32301 (= (contains!848 Nil!1637 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) lt!58977)))

(declare-fun b!113604 () Bool)

(declare-fun e!73806 () Bool)

(assert (=> b!113604 (= e!73807 e!73806)))

(declare-fun res!55955 () Bool)

(assert (=> b!113604 (=> res!55955 e!73806)))

(assert (=> b!113604 (= res!55955 (= (h!2236 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113605 () Bool)

(assert (=> b!113605 (= e!73806 (contains!848 (t!5814 Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32301 res!55954) b!113604))

(assert (= (and b!113604 (not res!55955)) b!113605))

(assert (=> d!32301 m!129275))

(assert (=> d!32301 m!129197))

(declare-fun m!129895 () Bool)

(assert (=> d!32301 m!129895))

(assert (=> b!113605 m!129197))

(declare-fun m!129897 () Bool)

(assert (=> b!113605 m!129897))

(assert (=> b!113181 d!32301))

(declare-fun d!32303 () Bool)

(declare-fun e!73810 () Bool)

(assert (=> d!32303 e!73810))

(declare-fun res!55960 () Bool)

(assert (=> d!32303 (=> (not res!55960) (not e!73810))))

(declare-fun lt!58983 () SeekEntryResult!263)

(assert (=> d!32303 (= res!55960 ((_ is Found!263) lt!58983))))

(assert (=> d!32303 (= lt!58983 (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun lt!58982 () Unit!3521)

(declare-fun choose!719 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 (_ BitVec 64) Int) Unit!3521)

(assert (=> d!32303 (= lt!58982 (choose!719 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)))))

(assert (=> d!32303 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32303 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2661 newMap!16)) lt!58982)))

(declare-fun b!113610 () Bool)

(declare-fun res!55961 () Bool)

(assert (=> b!113610 (=> (not res!55961) (not e!73810))))

(assert (=> b!113610 (= res!55961 (inRange!0 (index!3205 lt!58983) (mask!6845 newMap!16)))))

(declare-fun b!113611 () Bool)

(assert (=> b!113611 (= e!73810 (= (select (arr!2093 (_keys!4381 newMap!16)) (index!3205 lt!58983)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113611 (and (bvsge (index!3205 lt!58983) #b00000000000000000000000000000000) (bvslt (index!3205 lt!58983) (size!2352 (_keys!4381 newMap!16))))))

(assert (= (and d!32303 res!55960) b!113610))

(assert (= (and b!113610 res!55961) b!113611))

(assert (=> d!32303 m!128915))

(assert (=> d!32303 m!129165))

(assert (=> d!32303 m!128915))

(declare-fun m!129899 () Bool)

(assert (=> d!32303 m!129899))

(assert (=> d!32303 m!129295))

(declare-fun m!129901 () Bool)

(assert (=> b!113610 m!129901))

(declare-fun m!129903 () Bool)

(assert (=> b!113611 m!129903))

(assert (=> bm!12166 d!32303))

(declare-fun b!113612 () Bool)

(declare-fun e!73813 () Bool)

(declare-fun e!73814 () Bool)

(assert (=> b!113612 (= e!73813 e!73814)))

(declare-fun res!55964 () Bool)

(assert (=> b!113612 (=> (not res!55964) (not e!73814))))

(declare-fun e!73811 () Bool)

(assert (=> b!113612 (= res!55964 (not e!73811))))

(declare-fun res!55963 () Bool)

(assert (=> b!113612 (=> (not res!55963) (not e!73811))))

(assert (=> b!113612 (= res!55963 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113613 () Bool)

(assert (=> b!113613 (= e!73811 (contains!848 (ite c!20262 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1637) Nil!1637) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113614 () Bool)

(declare-fun e!73812 () Bool)

(declare-fun call!12263 () Bool)

(assert (=> b!113614 (= e!73812 call!12263)))

(declare-fun d!32305 () Bool)

(declare-fun res!55962 () Bool)

(assert (=> d!32305 (=> res!55962 e!73813)))

(assert (=> d!32305 (= res!55962 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2352 (_keys!4381 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32305 (= (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20262 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1637) Nil!1637)) e!73813)))

(declare-fun b!113615 () Bool)

(assert (=> b!113615 (= e!73812 call!12263)))

(declare-fun b!113616 () Bool)

(assert (=> b!113616 (= e!73814 e!73812)))

(declare-fun c!20383 () Bool)

(assert (=> b!113616 (= c!20383 (validKeyInArray!0 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!12260 () Bool)

(assert (=> bm!12260 (= call!12263 (arrayNoDuplicates!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20383 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!20262 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1637) Nil!1637)) (ite c!20262 (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1637) Nil!1637))))))

(assert (= (and d!32305 (not res!55962)) b!113612))

(assert (= (and b!113612 res!55963) b!113613))

(assert (= (and b!113612 res!55964) b!113616))

(assert (= (and b!113616 c!20383) b!113614))

(assert (= (and b!113616 (not c!20383)) b!113615))

(assert (= (or b!113614 b!113615) bm!12260))

(assert (=> b!113612 m!129735))

(assert (=> b!113612 m!129735))

(assert (=> b!113612 m!129737))

(assert (=> b!113613 m!129735))

(assert (=> b!113613 m!129735))

(declare-fun m!129905 () Bool)

(assert (=> b!113613 m!129905))

(assert (=> b!113616 m!129735))

(assert (=> b!113616 m!129735))

(assert (=> b!113616 m!129737))

(assert (=> bm!12260 m!129735))

(declare-fun m!129907 () Bool)

(assert (=> bm!12260 m!129907))

(assert (=> bm!12202 d!32305))

(declare-fun d!32307 () Bool)

(declare-fun e!73815 () Bool)

(assert (=> d!32307 e!73815))

(declare-fun res!55965 () Bool)

(assert (=> d!32307 (=> res!55965 e!73815)))

(declare-fun lt!58984 () Bool)

(assert (=> d!32307 (= res!55965 (not lt!58984))))

(declare-fun lt!58987 () Bool)

(assert (=> d!32307 (= lt!58984 lt!58987)))

(declare-fun lt!58986 () Unit!3521)

(declare-fun e!73816 () Unit!3521)

(assert (=> d!32307 (= lt!58986 e!73816)))

(declare-fun c!20384 () Bool)

(assert (=> d!32307 (= c!20384 lt!58987)))

(assert (=> d!32307 (= lt!58987 (containsKey!164 (toList!815 call!12174) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32307 (= (contains!846 call!12174 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58984)))

(declare-fun b!113617 () Bool)

(declare-fun lt!58985 () Unit!3521)

(assert (=> b!113617 (= e!73816 lt!58985)))

(assert (=> b!113617 (= lt!58985 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 call!12174) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113617 (isDefined!113 (getValueByKey!160 (toList!815 call!12174) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113618 () Bool)

(declare-fun Unit!3546 () Unit!3521)

(assert (=> b!113618 (= e!73816 Unit!3546)))

(declare-fun b!113619 () Bool)

(assert (=> b!113619 (= e!73815 (isDefined!113 (getValueByKey!160 (toList!815 call!12174) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32307 c!20384) b!113617))

(assert (= (and d!32307 (not c!20384)) b!113618))

(assert (= (and d!32307 (not res!55965)) b!113619))

(assert (=> d!32307 m!128915))

(declare-fun m!129909 () Bool)

(assert (=> d!32307 m!129909))

(assert (=> b!113617 m!128915))

(declare-fun m!129911 () Bool)

(assert (=> b!113617 m!129911))

(assert (=> b!113617 m!128915))

(declare-fun m!129913 () Bool)

(assert (=> b!113617 m!129913))

(assert (=> b!113617 m!129913))

(declare-fun m!129915 () Bool)

(assert (=> b!113617 m!129915))

(assert (=> b!113619 m!128915))

(assert (=> b!113619 m!129913))

(assert (=> b!113619 m!129913))

(assert (=> b!113619 m!129915))

(assert (=> b!113062 d!32307))

(declare-fun d!32309 () Bool)

(declare-fun e!73817 () Bool)

(assert (=> d!32309 e!73817))

(declare-fun res!55966 () Bool)

(assert (=> d!32309 (=> res!55966 e!73817)))

(declare-fun lt!58988 () Bool)

(assert (=> d!32309 (= res!55966 (not lt!58988))))

(declare-fun lt!58991 () Bool)

(assert (=> d!32309 (= lt!58988 lt!58991)))

(declare-fun lt!58990 () Unit!3521)

(declare-fun e!73818 () Unit!3521)

(assert (=> d!32309 (= lt!58990 e!73818)))

(declare-fun c!20385 () Bool)

(assert (=> d!32309 (= c!20385 lt!58991)))

(assert (=> d!32309 (= lt!58991 (containsKey!164 (toList!815 e!73473) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32309 (= (contains!846 e!73473 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58988)))

(declare-fun b!113620 () Bool)

(declare-fun lt!58989 () Unit!3521)

(assert (=> b!113620 (= e!73818 lt!58989)))

(assert (=> b!113620 (= lt!58989 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 e!73473) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113620 (isDefined!113 (getValueByKey!160 (toList!815 e!73473) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113621 () Bool)

(declare-fun Unit!3547 () Unit!3521)

(assert (=> b!113621 (= e!73818 Unit!3547)))

(declare-fun b!113622 () Bool)

(assert (=> b!113622 (= e!73817 (isDefined!113 (getValueByKey!160 (toList!815 e!73473) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32309 c!20385) b!113620))

(assert (= (and d!32309 (not c!20385)) b!113621))

(assert (= (and d!32309 (not res!55966)) b!113622))

(assert (=> d!32309 m!128915))

(declare-fun m!129917 () Bool)

(assert (=> d!32309 m!129917))

(assert (=> b!113620 m!128915))

(declare-fun m!129919 () Bool)

(assert (=> b!113620 m!129919))

(assert (=> b!113620 m!128915))

(declare-fun m!129921 () Bool)

(assert (=> b!113620 m!129921))

(assert (=> b!113620 m!129921))

(declare-fun m!129923 () Bool)

(assert (=> b!113620 m!129923))

(assert (=> b!113622 m!128915))

(assert (=> b!113622 m!129921))

(assert (=> b!113622 m!129921))

(assert (=> b!113622 m!129923))

(assert (=> bm!12159 d!32309))

(declare-fun d!32311 () Bool)

(declare-fun isEmpty!384 (List!1639) Bool)

(assert (=> d!32311 (= (isEmpty!382 lt!58487) (isEmpty!384 (toList!815 lt!58487)))))

(declare-fun bs!4655 () Bool)

(assert (= bs!4655 d!32311))

(declare-fun m!129925 () Bool)

(assert (=> bs!4655 m!129925))

(assert (=> b!112920 d!32311))

(declare-fun d!32313 () Bool)

(declare-fun lt!58992 () Bool)

(assert (=> d!32313 (= lt!58992 (select (content!118 (toList!815 lt!58508)) lt!58422))))

(declare-fun e!73819 () Bool)

(assert (=> d!32313 (= lt!58992 e!73819)))

(declare-fun res!55967 () Bool)

(assert (=> d!32313 (=> (not res!55967) (not e!73819))))

(assert (=> d!32313 (= res!55967 ((_ is Cons!1635) (toList!815 lt!58508)))))

(assert (=> d!32313 (= (contains!847 (toList!815 lt!58508) lt!58422) lt!58992)))

(declare-fun b!113623 () Bool)

(declare-fun e!73820 () Bool)

(assert (=> b!113623 (= e!73819 e!73820)))

(declare-fun res!55968 () Bool)

(assert (=> b!113623 (=> res!55968 e!73820)))

(assert (=> b!113623 (= res!55968 (= (h!2235 (toList!815 lt!58508)) lt!58422))))

(declare-fun b!113624 () Bool)

(assert (=> b!113624 (= e!73820 (contains!847 (t!5813 (toList!815 lt!58508)) lt!58422))))

(assert (= (and d!32313 res!55967) b!113623))

(assert (= (and b!113623 (not res!55968)) b!113624))

(declare-fun m!129927 () Bool)

(assert (=> d!32313 m!129927))

(declare-fun m!129929 () Bool)

(assert (=> d!32313 m!129929))

(declare-fun m!129931 () Bool)

(assert (=> b!113624 m!129931))

(assert (=> b!112940 d!32313))

(assert (=> b!113039 d!32293))

(declare-fun d!32315 () Bool)

(declare-fun res!55973 () Bool)

(declare-fun e!73825 () Bool)

(assert (=> d!32315 (=> res!55973 e!73825)))

(assert (=> d!32315 (= res!55973 (and ((_ is Cons!1635) (toList!815 lt!58424)) (= (_1!1238 (h!2235 (toList!815 lt!58424))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32315 (= (containsKey!164 (toList!815 lt!58424) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)) e!73825)))

(declare-fun b!113629 () Bool)

(declare-fun e!73826 () Bool)

(assert (=> b!113629 (= e!73825 e!73826)))

(declare-fun res!55974 () Bool)

(assert (=> b!113629 (=> (not res!55974) (not e!73826))))

(assert (=> b!113629 (= res!55974 (and (or (not ((_ is Cons!1635) (toList!815 lt!58424))) (bvsle (_1!1238 (h!2235 (toList!815 lt!58424))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))) ((_ is Cons!1635) (toList!815 lt!58424)) (bvslt (_1!1238 (h!2235 (toList!815 lt!58424))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(declare-fun b!113630 () Bool)

(assert (=> b!113630 (= e!73826 (containsKey!164 (t!5813 (toList!815 lt!58424)) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32315 (not res!55973)) b!113629))

(assert (= (and b!113629 res!55974) b!113630))

(assert (=> b!113630 m!128915))

(declare-fun m!129933 () Bool)

(assert (=> b!113630 m!129933))

(assert (=> d!32117 d!32315))

(declare-fun d!32317 () Bool)

(assert (=> d!32317 (= (apply!102 lt!58687 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1364 (getValueByKey!160 (toList!815 lt!58687) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4656 () Bool)

(assert (= bs!4656 d!32317))

(assert (=> bs!4656 m!129885))

(assert (=> bs!4656 m!129885))

(declare-fun m!129935 () Bool)

(assert (=> bs!4656 m!129935))

(assert (=> b!113169 d!32317))

(assert (=> d!32141 d!32293))

(declare-fun d!32319 () Bool)

(declare-fun lt!58993 () Bool)

(assert (=> d!32319 (= lt!58993 (select (content!118 (toList!815 lt!58504)) lt!58423))))

(declare-fun e!73827 () Bool)

(assert (=> d!32319 (= lt!58993 e!73827)))

(declare-fun res!55975 () Bool)

(assert (=> d!32319 (=> (not res!55975) (not e!73827))))

(assert (=> d!32319 (= res!55975 ((_ is Cons!1635) (toList!815 lt!58504)))))

(assert (=> d!32319 (= (contains!847 (toList!815 lt!58504) lt!58423) lt!58993)))

(declare-fun b!113631 () Bool)

(declare-fun e!73828 () Bool)

(assert (=> b!113631 (= e!73827 e!73828)))

(declare-fun res!55976 () Bool)

(assert (=> b!113631 (=> res!55976 e!73828)))

(assert (=> b!113631 (= res!55976 (= (h!2235 (toList!815 lt!58504)) lt!58423))))

(declare-fun b!113632 () Bool)

(assert (=> b!113632 (= e!73828 (contains!847 (t!5813 (toList!815 lt!58504)) lt!58423))))

(assert (= (and d!32319 res!55975) b!113631))

(assert (= (and b!113631 (not res!55976)) b!113632))

(declare-fun m!129937 () Bool)

(assert (=> d!32319 m!129937))

(declare-fun m!129939 () Bool)

(assert (=> d!32319 m!129939))

(declare-fun m!129941 () Bool)

(assert (=> b!113632 m!129941))

(assert (=> b!112938 d!32319))

(assert (=> b!112922 d!32279))

(declare-fun d!32321 () Bool)

(assert (=> d!32321 (contains!846 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58688)))

(declare-fun lt!58996 () Unit!3521)

(declare-fun choose!720 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> d!32321 (= lt!58996 (choose!720 lt!58670 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58688))))

(assert (=> d!32321 (contains!846 lt!58670 lt!58688)))

(assert (=> d!32321 (= (addStillContains!78 lt!58670 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58688) lt!58996)))

(declare-fun bs!4657 () Bool)

(assert (= bs!4657 d!32321))

(assert (=> bs!4657 m!129223))

(assert (=> bs!4657 m!129223))

(assert (=> bs!4657 m!129225))

(declare-fun m!129943 () Bool)

(assert (=> bs!4657 m!129943))

(declare-fun m!129945 () Bool)

(assert (=> bs!4657 m!129945))

(assert (=> b!113171 d!32321))

(declare-fun d!32323 () Bool)

(assert (=> d!32323 (= (apply!102 (+!154 lt!58679 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58677) (get!1364 (getValueByKey!160 (toList!815 (+!154 lt!58679 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58677)))))

(declare-fun bs!4658 () Bool)

(assert (= bs!4658 d!32323))

(declare-fun m!129947 () Bool)

(assert (=> bs!4658 m!129947))

(assert (=> bs!4658 m!129947))

(declare-fun m!129949 () Bool)

(assert (=> bs!4658 m!129949))

(assert (=> b!113171 d!32323))

(declare-fun d!32325 () Bool)

(declare-fun e!73829 () Bool)

(assert (=> d!32325 e!73829))

(declare-fun res!55978 () Bool)

(assert (=> d!32325 (=> (not res!55978) (not e!73829))))

(declare-fun lt!58998 () ListLongMap!1599)

(assert (=> d!32325 (= res!55978 (contains!846 lt!58998 (_1!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58999 () List!1639)

(assert (=> d!32325 (= lt!58998 (ListLongMap!1600 lt!58999))))

(declare-fun lt!58997 () Unit!3521)

(declare-fun lt!59000 () Unit!3521)

(assert (=> d!32325 (= lt!58997 lt!59000)))

(assert (=> d!32325 (= (getValueByKey!160 lt!58999 (_1!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32325 (= lt!59000 (lemmaContainsTupThenGetReturnValue!76 lt!58999 (_1!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32325 (= lt!58999 (insertStrictlySorted!79 (toList!815 lt!58672) (_1!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32325 (= (+!154 lt!58672 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58998)))

(declare-fun b!113634 () Bool)

(declare-fun res!55977 () Bool)

(assert (=> b!113634 (=> (not res!55977) (not e!73829))))

(assert (=> b!113634 (= res!55977 (= (getValueByKey!160 (toList!815 lt!58998) (_1!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113635 () Bool)

(assert (=> b!113635 (= e!73829 (contains!847 (toList!815 lt!58998) (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32325 res!55978) b!113634))

(assert (= (and b!113634 res!55977) b!113635))

(declare-fun m!129951 () Bool)

(assert (=> d!32325 m!129951))

(declare-fun m!129953 () Bool)

(assert (=> d!32325 m!129953))

(declare-fun m!129955 () Bool)

(assert (=> d!32325 m!129955))

(declare-fun m!129957 () Bool)

(assert (=> d!32325 m!129957))

(declare-fun m!129959 () Bool)

(assert (=> b!113634 m!129959))

(declare-fun m!129961 () Bool)

(assert (=> b!113635 m!129961))

(assert (=> b!113171 d!32325))

(assert (=> b!113171 d!32103))

(declare-fun d!32327 () Bool)

(assert (=> d!32327 (= (apply!102 (+!154 lt!58684 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58689) (get!1364 (getValueByKey!160 (toList!815 (+!154 lt!58684 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58689)))))

(declare-fun bs!4659 () Bool)

(assert (= bs!4659 d!32327))

(declare-fun m!129963 () Bool)

(assert (=> bs!4659 m!129963))

(assert (=> bs!4659 m!129963))

(declare-fun m!129965 () Bool)

(assert (=> bs!4659 m!129965))

(assert (=> b!113171 d!32327))

(declare-fun d!32329 () Bool)

(declare-fun e!73830 () Bool)

(assert (=> d!32329 e!73830))

(declare-fun res!55980 () Bool)

(assert (=> d!32329 (=> (not res!55980) (not e!73830))))

(declare-fun lt!59002 () ListLongMap!1599)

(assert (=> d!32329 (= res!55980 (contains!846 lt!59002 (_1!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!59003 () List!1639)

(assert (=> d!32329 (= lt!59002 (ListLongMap!1600 lt!59003))))

(declare-fun lt!59001 () Unit!3521)

(declare-fun lt!59004 () Unit!3521)

(assert (=> d!32329 (= lt!59001 lt!59004)))

(assert (=> d!32329 (= (getValueByKey!160 lt!59003 (_1!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= lt!59004 (lemmaContainsTupThenGetReturnValue!76 lt!59003 (_1!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= lt!59003 (insertStrictlySorted!79 (toList!815 lt!58679) (_1!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= (+!154 lt!58679 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!59002)))

(declare-fun b!113636 () Bool)

(declare-fun res!55979 () Bool)

(assert (=> b!113636 (=> (not res!55979) (not e!73830))))

(assert (=> b!113636 (= res!55979 (= (getValueByKey!160 (toList!815 lt!59002) (_1!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113637 () Bool)

(assert (=> b!113637 (= e!73830 (contains!847 (toList!815 lt!59002) (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32329 res!55980) b!113636))

(assert (= (and b!113636 res!55979) b!113637))

(declare-fun m!129967 () Bool)

(assert (=> d!32329 m!129967))

(declare-fun m!129969 () Bool)

(assert (=> d!32329 m!129969))

(declare-fun m!129971 () Bool)

(assert (=> d!32329 m!129971))

(declare-fun m!129973 () Bool)

(assert (=> d!32329 m!129973))

(declare-fun m!129975 () Bool)

(assert (=> b!113636 m!129975))

(declare-fun m!129977 () Bool)

(assert (=> b!113637 m!129977))

(assert (=> b!113171 d!32329))

(declare-fun d!32331 () Bool)

(assert (=> d!32331 (= (apply!102 (+!154 lt!58672 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58681) (get!1364 (getValueByKey!160 (toList!815 (+!154 lt!58672 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58681)))))

(declare-fun bs!4660 () Bool)

(assert (= bs!4660 d!32331))

(declare-fun m!129979 () Bool)

(assert (=> bs!4660 m!129979))

(assert (=> bs!4660 m!129979))

(declare-fun m!129981 () Bool)

(assert (=> bs!4660 m!129981))

(assert (=> b!113171 d!32331))

(declare-fun d!32333 () Bool)

(declare-fun e!73831 () Bool)

(assert (=> d!32333 e!73831))

(declare-fun res!55981 () Bool)

(assert (=> d!32333 (=> res!55981 e!73831)))

(declare-fun lt!59005 () Bool)

(assert (=> d!32333 (= res!55981 (not lt!59005))))

(declare-fun lt!59008 () Bool)

(assert (=> d!32333 (= lt!59005 lt!59008)))

(declare-fun lt!59007 () Unit!3521)

(declare-fun e!73832 () Unit!3521)

(assert (=> d!32333 (= lt!59007 e!73832)))

(declare-fun c!20386 () Bool)

(assert (=> d!32333 (= c!20386 lt!59008)))

(assert (=> d!32333 (= lt!59008 (containsKey!164 (toList!815 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58688))))

(assert (=> d!32333 (= (contains!846 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58688) lt!59005)))

(declare-fun b!113638 () Bool)

(declare-fun lt!59006 () Unit!3521)

(assert (=> b!113638 (= e!73832 lt!59006)))

(assert (=> b!113638 (= lt!59006 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!815 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58688))))

(assert (=> b!113638 (isDefined!113 (getValueByKey!160 (toList!815 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58688))))

(declare-fun b!113639 () Bool)

(declare-fun Unit!3548 () Unit!3521)

(assert (=> b!113639 (= e!73832 Unit!3548)))

(declare-fun b!113640 () Bool)

(assert (=> b!113640 (= e!73831 (isDefined!113 (getValueByKey!160 (toList!815 (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) lt!58688)))))

(assert (= (and d!32333 c!20386) b!113638))

(assert (= (and d!32333 (not c!20386)) b!113639))

(assert (= (and d!32333 (not res!55981)) b!113640))

(declare-fun m!129983 () Bool)

(assert (=> d!32333 m!129983))

(declare-fun m!129985 () Bool)

(assert (=> b!113638 m!129985))

(declare-fun m!129987 () Bool)

(assert (=> b!113638 m!129987))

(assert (=> b!113638 m!129987))

(declare-fun m!129989 () Bool)

(assert (=> b!113638 m!129989))

(assert (=> b!113640 m!129987))

(assert (=> b!113640 m!129987))

(assert (=> b!113640 m!129989))

(assert (=> b!113171 d!32333))

(declare-fun d!32335 () Bool)

(assert (=> d!32335 (= (apply!102 (+!154 lt!58679 (tuple2!2455 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58677) (apply!102 lt!58679 lt!58677))))

(declare-fun lt!59011 () Unit!3521)

(declare-fun choose!721 (ListLongMap!1599 (_ BitVec 64) V!3259 (_ BitVec 64)) Unit!3521)

(assert (=> d!32335 (= lt!59011 (choose!721 lt!58679 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58677))))

(declare-fun e!73835 () Bool)

(assert (=> d!32335 e!73835))

(declare-fun res!55984 () Bool)

(assert (=> d!32335 (=> (not res!55984) (not e!73835))))

(assert (=> d!32335 (= res!55984 (contains!846 lt!58679 lt!58677))))

(assert (=> d!32335 (= (addApplyDifferent!78 lt!58679 lt!58671 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58677) lt!59011)))

(declare-fun b!113644 () Bool)

(assert (=> b!113644 (= e!73835 (not (= lt!58677 lt!58671)))))

(assert (= (and d!32335 res!55984) b!113644))

(assert (=> d!32335 m!129211))

(assert (=> d!32335 m!129213))

(assert (=> d!32335 m!129215))

(declare-fun m!129991 () Bool)

(assert (=> d!32335 m!129991))

(declare-fun m!129993 () Bool)

(assert (=> d!32335 m!129993))

(assert (=> d!32335 m!129213))

(assert (=> b!113171 d!32335))

(declare-fun d!32337 () Bool)

(assert (=> d!32337 (= (apply!102 lt!58672 lt!58681) (get!1364 (getValueByKey!160 (toList!815 lt!58672) lt!58681)))))

(declare-fun bs!4661 () Bool)

(assert (= bs!4661 d!32337))

(declare-fun m!129995 () Bool)

(assert (=> bs!4661 m!129995))

(assert (=> bs!4661 m!129995))

(declare-fun m!129997 () Bool)

(assert (=> bs!4661 m!129997))

(assert (=> b!113171 d!32337))

(declare-fun d!32339 () Bool)

(assert (=> d!32339 (= (apply!102 lt!58684 lt!58689) (get!1364 (getValueByKey!160 (toList!815 lt!58684) lt!58689)))))

(declare-fun bs!4662 () Bool)

(assert (= bs!4662 d!32339))

(declare-fun m!129999 () Bool)

(assert (=> bs!4662 m!129999))

(assert (=> bs!4662 m!129999))

(declare-fun m!130001 () Bool)

(assert (=> bs!4662 m!130001))

(assert (=> b!113171 d!32339))

(declare-fun d!32341 () Bool)

(assert (=> d!32341 (= (apply!102 (+!154 lt!58684 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58689) (apply!102 lt!58684 lt!58689))))

(declare-fun lt!59012 () Unit!3521)

(assert (=> d!32341 (= lt!59012 (choose!721 lt!58684 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58689))))

(declare-fun e!73836 () Bool)

(assert (=> d!32341 e!73836))

(declare-fun res!55985 () Bool)

(assert (=> d!32341 (=> (not res!55985) (not e!73836))))

(assert (=> d!32341 (= res!55985 (contains!846 lt!58684 lt!58689))))

(assert (=> d!32341 (= (addApplyDifferent!78 lt!58684 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58689) lt!59012)))

(declare-fun b!113645 () Bool)

(assert (=> b!113645 (= e!73836 (not (= lt!58689 lt!58686)))))

(assert (= (and d!32341 res!55985) b!113645))

(assert (=> d!32341 m!129209))

(assert (=> d!32341 m!129217))

(assert (=> d!32341 m!129229))

(declare-fun m!130003 () Bool)

(assert (=> d!32341 m!130003))

(declare-fun m!130005 () Bool)

(assert (=> d!32341 m!130005))

(assert (=> d!32341 m!129217))

(assert (=> b!113171 d!32341))

(declare-fun d!32343 () Bool)

(declare-fun e!73837 () Bool)

(assert (=> d!32343 e!73837))

(declare-fun res!55987 () Bool)

(assert (=> d!32343 (=> (not res!55987) (not e!73837))))

(declare-fun lt!59014 () ListLongMap!1599)

(assert (=> d!32343 (= res!55987 (contains!846 lt!59014 (_1!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!59015 () List!1639)

(assert (=> d!32343 (= lt!59014 (ListLongMap!1600 lt!59015))))

(declare-fun lt!59013 () Unit!3521)

(declare-fun lt!59016 () Unit!3521)

(assert (=> d!32343 (= lt!59013 lt!59016)))

(assert (=> d!32343 (= (getValueByKey!160 lt!59015 (_1!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= lt!59016 (lemmaContainsTupThenGetReturnValue!76 lt!59015 (_1!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= lt!59015 (insertStrictlySorted!79 (toList!815 lt!58684) (_1!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= (+!154 lt!58684 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!59014)))

(declare-fun b!113646 () Bool)

(declare-fun res!55986 () Bool)

(assert (=> b!113646 (=> (not res!55986) (not e!73837))))

(assert (=> b!113646 (= res!55986 (= (getValueByKey!160 (toList!815 lt!59014) (_1!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113647 () Bool)

(assert (=> b!113647 (= e!73837 (contains!847 (toList!815 lt!59014) (tuple2!2455 lt!58686 (minValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32343 res!55987) b!113646))

(assert (= (and b!113646 res!55986) b!113647))

(declare-fun m!130007 () Bool)

(assert (=> d!32343 m!130007))

(declare-fun m!130009 () Bool)

(assert (=> d!32343 m!130009))

(declare-fun m!130011 () Bool)

(assert (=> d!32343 m!130011))

(declare-fun m!130013 () Bool)

(assert (=> d!32343 m!130013))

(declare-fun m!130015 () Bool)

(assert (=> b!113646 m!130015))

(declare-fun m!130017 () Bool)

(assert (=> b!113647 m!130017))

(assert (=> b!113171 d!32343))

(declare-fun d!32345 () Bool)

(assert (=> d!32345 (= (apply!102 lt!58679 lt!58677) (get!1364 (getValueByKey!160 (toList!815 lt!58679) lt!58677)))))

(declare-fun bs!4663 () Bool)

(assert (= bs!4663 d!32345))

(declare-fun m!130019 () Bool)

(assert (=> bs!4663 m!130019))

(assert (=> bs!4663 m!130019))

(declare-fun m!130021 () Bool)

(assert (=> bs!4663 m!130021))

(assert (=> b!113171 d!32345))

(declare-fun d!32347 () Bool)

(assert (=> d!32347 (= (apply!102 (+!154 lt!58672 (tuple2!2455 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!58681) (apply!102 lt!58672 lt!58681))))

(declare-fun lt!59017 () Unit!3521)

(assert (=> d!32347 (= lt!59017 (choose!721 lt!58672 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58681))))

(declare-fun e!73838 () Bool)

(assert (=> d!32347 e!73838))

(declare-fun res!55988 () Bool)

(assert (=> d!32347 (=> (not res!55988) (not e!73838))))

(assert (=> d!32347 (= res!55988 (contains!846 lt!58672 lt!58681))))

(assert (=> d!32347 (= (addApplyDifferent!78 lt!58672 lt!58691 (minValue!2529 (v!2959 (underlying!376 thiss!992))) lt!58681) lt!59017)))

(declare-fun b!113648 () Bool)

(assert (=> b!113648 (= e!73838 (not (= lt!58681 lt!58691)))))

(assert (= (and d!32347 res!55988) b!113648))

(assert (=> d!32347 m!129231))

(assert (=> d!32347 m!129219))

(assert (=> d!32347 m!129233))

(declare-fun m!130023 () Bool)

(assert (=> d!32347 m!130023))

(declare-fun m!130025 () Bool)

(assert (=> d!32347 m!130025))

(assert (=> d!32347 m!129219))

(assert (=> b!113171 d!32347))

(declare-fun d!32349 () Bool)

(declare-fun e!73839 () Bool)

(assert (=> d!32349 e!73839))

(declare-fun res!55990 () Bool)

(assert (=> d!32349 (=> (not res!55990) (not e!73839))))

(declare-fun lt!59019 () ListLongMap!1599)

(assert (=> d!32349 (= res!55990 (contains!846 lt!59019 (_1!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!59020 () List!1639)

(assert (=> d!32349 (= lt!59019 (ListLongMap!1600 lt!59020))))

(declare-fun lt!59018 () Unit!3521)

(declare-fun lt!59021 () Unit!3521)

(assert (=> d!32349 (= lt!59018 lt!59021)))

(assert (=> d!32349 (= (getValueByKey!160 lt!59020 (_1!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32349 (= lt!59021 (lemmaContainsTupThenGetReturnValue!76 lt!59020 (_1!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32349 (= lt!59020 (insertStrictlySorted!79 (toList!815 lt!58670) (_1!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) (_2!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32349 (= (+!154 lt!58670 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))) lt!59019)))

(declare-fun b!113649 () Bool)

(declare-fun res!55989 () Bool)

(assert (=> b!113649 (=> (not res!55989) (not e!73839))))

(assert (=> b!113649 (= res!55989 (= (getValueByKey!160 (toList!815 lt!59019) (_1!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992)))))) (Some!165 (_2!1238 (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113650 () Bool)

(assert (=> b!113650 (= e!73839 (contains!847 (toList!815 lt!59019) (tuple2!2455 lt!58682 (zeroValue!2529 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32349 res!55990) b!113649))

(assert (= (and b!113649 res!55989) b!113650))

(declare-fun m!130027 () Bool)

(assert (=> d!32349 m!130027))

(declare-fun m!130029 () Bool)

(assert (=> d!32349 m!130029))

(declare-fun m!130031 () Bool)

(assert (=> d!32349 m!130031))

(declare-fun m!130033 () Bool)

(assert (=> d!32349 m!130033))

(declare-fun m!130035 () Bool)

(assert (=> b!113649 m!130035))

(declare-fun m!130037 () Bool)

(assert (=> b!113650 m!130037))

(assert (=> b!113171 d!32349))

(declare-fun b!113662 () Bool)

(declare-fun e!73842 () Bool)

(assert (=> b!113662 (= e!73842 (and (bvsge (extraKeys!2452 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2452 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!514 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!113659 () Bool)

(declare-fun res!56002 () Bool)

(assert (=> b!113659 (=> (not res!56002) (not e!73842))))

(assert (=> b!113659 (= res!56002 (and (= (size!2353 (_values!2644 newMap!16)) (bvadd (mask!6845 newMap!16) #b00000000000000000000000000000001)) (= (size!2352 (_keys!4381 newMap!16)) (size!2353 (_values!2644 newMap!16))) (bvsge (_size!514 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!514 newMap!16) (bvadd (mask!6845 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!32351 () Bool)

(declare-fun res!55999 () Bool)

(assert (=> d!32351 (=> (not res!55999) (not e!73842))))

(assert (=> d!32351 (= res!55999 (validMask!0 (mask!6845 newMap!16)))))

(assert (=> d!32351 (= (simpleValid!78 newMap!16) e!73842)))

(declare-fun b!113660 () Bool)

(declare-fun res!56000 () Bool)

(assert (=> b!113660 (=> (not res!56000) (not e!73842))))

(declare-fun size!2356 (LongMapFixedSize!930) (_ BitVec 32))

(assert (=> b!113660 (= res!56000 (bvsge (size!2356 newMap!16) (_size!514 newMap!16)))))

(declare-fun b!113661 () Bool)

(declare-fun res!56001 () Bool)

(assert (=> b!113661 (=> (not res!56001) (not e!73842))))

(assert (=> b!113661 (= res!56001 (= (size!2356 newMap!16) (bvadd (_size!514 newMap!16) (bvsdiv (bvadd (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!32351 res!55999) b!113659))

(assert (= (and b!113659 res!56002) b!113660))

(assert (= (and b!113660 res!56000) b!113661))

(assert (= (and b!113661 res!56001) b!113662))

(assert (=> d!32351 m!129295))

(declare-fun m!130039 () Bool)

(assert (=> b!113660 m!130039))

(assert (=> b!113661 m!130039))

(assert (=> d!32147 d!32351))

(declare-fun d!32353 () Bool)

(assert (=> d!32353 (= (apply!102 lt!58487 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1364 (getValueByKey!160 (toList!815 lt!58487) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4664 () Bool)

(assert (= bs!4664 d!32353))

(assert (=> bs!4664 m!129047))

(assert (=> bs!4664 m!129707))

(assert (=> bs!4664 m!129707))

(declare-fun m!130041 () Bool)

(assert (=> bs!4664 m!130041))

(assert (=> b!112926 d!32353))

(assert (=> b!112926 d!32233))

(assert (=> b!113114 d!32197))

(assert (=> bm!12169 d!32141))

(declare-fun d!32355 () Bool)

(declare-fun lt!59022 () Bool)

(assert (=> d!32355 (= lt!59022 (select (content!118 (toList!815 lt!58512)) lt!58423))))

(declare-fun e!73843 () Bool)

(assert (=> d!32355 (= lt!59022 e!73843)))

(declare-fun res!56003 () Bool)

(assert (=> d!32355 (=> (not res!56003) (not e!73843))))

(assert (=> d!32355 (= res!56003 ((_ is Cons!1635) (toList!815 lt!58512)))))

(assert (=> d!32355 (= (contains!847 (toList!815 lt!58512) lt!58423) lt!59022)))

(declare-fun b!113663 () Bool)

(declare-fun e!73844 () Bool)

(assert (=> b!113663 (= e!73843 e!73844)))

(declare-fun res!56004 () Bool)

(assert (=> b!113663 (=> res!56004 e!73844)))

(assert (=> b!113663 (= res!56004 (= (h!2235 (toList!815 lt!58512)) lt!58423))))

(declare-fun b!113664 () Bool)

(assert (=> b!113664 (= e!73844 (contains!847 (t!5813 (toList!815 lt!58512)) lt!58423))))

(assert (= (and d!32355 res!56003) b!113663))

(assert (= (and b!113663 (not res!56004)) b!113664))

(declare-fun m!130043 () Bool)

(assert (=> d!32355 m!130043))

(declare-fun m!130045 () Bool)

(assert (=> d!32355 m!130045))

(declare-fun m!130047 () Bool)

(assert (=> b!113664 m!130047))

(assert (=> b!112942 d!32355))

(declare-fun b!113665 () Bool)

(declare-fun e!73846 () Bool)

(declare-fun e!73849 () Bool)

(assert (=> b!113665 (= e!73846 e!73849)))

(declare-fun c!20390 () Bool)

(assert (=> b!113665 (= c!20390 (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113666 () Bool)

(declare-fun e!73853 () Unit!3521)

(declare-fun Unit!3549 () Unit!3521)

(assert (=> b!113666 (= e!73853 Unit!3549)))

(declare-fun b!113667 () Bool)

(declare-fun c!20388 () Bool)

(assert (=> b!113667 (= c!20388 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73856 () ListLongMap!1599)

(declare-fun e!73854 () ListLongMap!1599)

(assert (=> b!113667 (= e!73856 e!73854)))

(declare-fun bm!12261 () Bool)

(declare-fun call!12266 () Bool)

(declare-fun lt!59040 () ListLongMap!1599)

(assert (=> bm!12261 (= call!12266 (contains!846 lt!59040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113668 () Bool)

(declare-fun res!56012 () Bool)

(assert (=> b!113668 (=> (not res!56012) (not e!73846))))

(declare-fun e!73847 () Bool)

(assert (=> b!113668 (= res!56012 e!73847)))

(declare-fun res!56007 () Bool)

(assert (=> b!113668 (=> res!56007 e!73847)))

(declare-fun e!73851 () Bool)

(assert (=> b!113668 (= res!56007 (not e!73851))))

(declare-fun res!56011 () Bool)

(assert (=> b!113668 (=> (not res!56011) (not e!73851))))

(assert (=> b!113668 (= res!56011 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun bm!12262 () Bool)

(declare-fun call!12270 () ListLongMap!1599)

(declare-fun c!20391 () Bool)

(declare-fun c!20389 () Bool)

(declare-fun call!12268 () ListLongMap!1599)

(declare-fun call!12269 () ListLongMap!1599)

(declare-fun call!12264 () ListLongMap!1599)

(assert (=> bm!12262 (= call!12264 (+!154 (ite c!20391 call!12269 (ite c!20389 call!12270 call!12268)) (ite (or c!20391 c!20389) (tuple2!2455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2529 newMap!16)) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 newMap!16)))))))

(declare-fun b!113669 () Bool)

(declare-fun e!73848 () Bool)

(declare-fun e!73857 () Bool)

(assert (=> b!113669 (= e!73848 e!73857)))

(declare-fun res!56013 () Bool)

(declare-fun call!12265 () Bool)

(assert (=> b!113669 (= res!56013 call!12265)))

(assert (=> b!113669 (=> (not res!56013) (not e!73857))))

(declare-fun b!113670 () Bool)

(declare-fun res!56005 () Bool)

(assert (=> b!113670 (=> (not res!56005) (not e!73846))))

(assert (=> b!113670 (= res!56005 e!73848)))

(declare-fun c!20392 () Bool)

(assert (=> b!113670 (= c!20392 (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!113671 () Bool)

(assert (=> b!113671 (= e!73848 (not call!12265))))

(declare-fun b!113672 () Bool)

(assert (=> b!113672 (= e!73849 (not call!12266))))

(declare-fun bm!12263 () Bool)

(assert (=> bm!12263 (= call!12268 call!12270)))

(declare-fun b!113673 () Bool)

(declare-fun e!73850 () ListLongMap!1599)

(assert (=> b!113673 (= e!73850 (+!154 call!12264 (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2529 newMap!16))))))

(declare-fun bm!12264 () Bool)

(declare-fun call!12267 () ListLongMap!1599)

(assert (=> bm!12264 (= call!12267 call!12264)))

(declare-fun e!73845 () Bool)

(declare-fun b!113674 () Bool)

(assert (=> b!113674 (= e!73845 (= (apply!102 lt!59040 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)) (get!1361 (select (arr!2094 (ite c!20221 (_values!2644 newMap!16) lt!58588)) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2661 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2353 (ite c!20221 (_values!2644 newMap!16) lt!58588))))))

(assert (=> b!113674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113675 () Bool)

(assert (=> b!113675 (= e!73857 (= (apply!102 lt!59040 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2529 newMap!16)))))

(declare-fun b!113676 () Bool)

(assert (=> b!113676 (= e!73851 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113677 () Bool)

(declare-fun lt!59033 () Unit!3521)

(assert (=> b!113677 (= e!73853 lt!59033)))

(declare-fun lt!59023 () ListLongMap!1599)

(assert (=> b!113677 (= lt!59023 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!59035 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59041 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59041 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!59026 () Unit!3521)

(assert (=> b!113677 (= lt!59026 (addStillContains!78 lt!59023 lt!59035 (zeroValue!2529 newMap!16) lt!59041))))

(assert (=> b!113677 (contains!846 (+!154 lt!59023 (tuple2!2455 lt!59035 (zeroValue!2529 newMap!16))) lt!59041)))

(declare-fun lt!59028 () Unit!3521)

(assert (=> b!113677 (= lt!59028 lt!59026)))

(declare-fun lt!59037 () ListLongMap!1599)

(assert (=> b!113677 (= lt!59037 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!59039 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59042 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59042 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!59043 () Unit!3521)

(assert (=> b!113677 (= lt!59043 (addApplyDifferent!78 lt!59037 lt!59039 (minValue!2529 newMap!16) lt!59042))))

(assert (=> b!113677 (= (apply!102 (+!154 lt!59037 (tuple2!2455 lt!59039 (minValue!2529 newMap!16))) lt!59042) (apply!102 lt!59037 lt!59042))))

(declare-fun lt!59029 () Unit!3521)

(assert (=> b!113677 (= lt!59029 lt!59043)))

(declare-fun lt!59032 () ListLongMap!1599)

(assert (=> b!113677 (= lt!59032 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!59024 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59030 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59030 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!59038 () Unit!3521)

(assert (=> b!113677 (= lt!59038 (addApplyDifferent!78 lt!59032 lt!59024 (zeroValue!2529 newMap!16) lt!59030))))

(assert (=> b!113677 (= (apply!102 (+!154 lt!59032 (tuple2!2455 lt!59024 (zeroValue!2529 newMap!16))) lt!59030) (apply!102 lt!59032 lt!59030))))

(declare-fun lt!59027 () Unit!3521)

(assert (=> b!113677 (= lt!59027 lt!59038)))

(declare-fun lt!59025 () ListLongMap!1599)

(assert (=> b!113677 (= lt!59025 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!59044 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59034 () (_ BitVec 64))

(assert (=> b!113677 (= lt!59034 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113677 (= lt!59033 (addApplyDifferent!78 lt!59025 lt!59044 (minValue!2529 newMap!16) lt!59034))))

(assert (=> b!113677 (= (apply!102 (+!154 lt!59025 (tuple2!2455 lt!59044 (minValue!2529 newMap!16))) lt!59034) (apply!102 lt!59025 lt!59034))))

(declare-fun b!113678 () Bool)

(assert (=> b!113678 (= e!73856 call!12267)))

(declare-fun b!113679 () Bool)

(declare-fun e!73852 () Bool)

(assert (=> b!113679 (= e!73849 e!73852)))

(declare-fun res!56009 () Bool)

(assert (=> b!113679 (= res!56009 call!12266)))

(assert (=> b!113679 (=> (not res!56009) (not e!73852))))

(declare-fun d!32357 () Bool)

(assert (=> d!32357 e!73846))

(declare-fun res!56006 () Bool)

(assert (=> d!32357 (=> (not res!56006) (not e!73846))))

(assert (=> d!32357 (= res!56006 (or (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))))

(declare-fun lt!59031 () ListLongMap!1599)

(assert (=> d!32357 (= lt!59040 lt!59031)))

(declare-fun lt!59036 () Unit!3521)

(assert (=> d!32357 (= lt!59036 e!73853)))

(declare-fun c!20387 () Bool)

(declare-fun e!73855 () Bool)

(assert (=> d!32357 (= c!20387 e!73855)))

(declare-fun res!56008 () Bool)

(assert (=> d!32357 (=> (not res!56008) (not e!73855))))

(assert (=> d!32357 (= res!56008 (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32357 (= lt!59031 e!73850)))

(assert (=> d!32357 (= c!20391 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32357 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32357 (= (getCurrentListMap!499 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) lt!59040)))

(declare-fun bm!12265 () Bool)

(assert (=> bm!12265 (= call!12270 call!12269)))

(declare-fun b!113680 () Bool)

(assert (=> b!113680 (= e!73852 (= (apply!102 lt!59040 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2529 newMap!16)))))

(declare-fun b!113681 () Bool)

(assert (=> b!113681 (= e!73847 e!73845)))

(declare-fun res!56010 () Bool)

(assert (=> b!113681 (=> (not res!56010) (not e!73845))))

(assert (=> b!113681 (= res!56010 (contains!846 lt!59040 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(declare-fun b!113682 () Bool)

(assert (=> b!113682 (= e!73854 call!12268)))

(declare-fun bm!12266 () Bool)

(assert (=> bm!12266 (= call!12265 (contains!846 lt!59040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113683 () Bool)

(assert (=> b!113683 (= e!73854 call!12267)))

(declare-fun b!113684 () Bool)

(assert (=> b!113684 (= e!73855 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113685 () Bool)

(assert (=> b!113685 (= e!73850 e!73856)))

(assert (=> b!113685 (= c!20389 (and (not (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2452 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12267 () Bool)

(assert (=> bm!12267 (= call!12269 (getCurrentListMapNoExtraKeys!120 (_keys!4381 newMap!16) (ite c!20221 (_values!2644 newMap!16) lt!58588) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(assert (= (and d!32357 c!20391) b!113673))

(assert (= (and d!32357 (not c!20391)) b!113685))

(assert (= (and b!113685 c!20389) b!113678))

(assert (= (and b!113685 (not c!20389)) b!113667))

(assert (= (and b!113667 c!20388) b!113683))

(assert (= (and b!113667 (not c!20388)) b!113682))

(assert (= (or b!113683 b!113682) bm!12263))

(assert (= (or b!113678 bm!12263) bm!12265))

(assert (= (or b!113678 b!113683) bm!12264))

(assert (= (or b!113673 bm!12265) bm!12267))

(assert (= (or b!113673 bm!12264) bm!12262))

(assert (= (and d!32357 res!56008) b!113684))

(assert (= (and d!32357 c!20387) b!113677))

(assert (= (and d!32357 (not c!20387)) b!113666))

(assert (= (and d!32357 res!56006) b!113668))

(assert (= (and b!113668 res!56011) b!113676))

(assert (= (and b!113668 (not res!56007)) b!113681))

(assert (= (and b!113681 res!56010) b!113674))

(assert (= (and b!113668 res!56012) b!113670))

(assert (= (and b!113670 c!20392) b!113669))

(assert (= (and b!113670 (not c!20392)) b!113671))

(assert (= (and b!113669 res!56013) b!113675))

(assert (= (or b!113669 b!113671) bm!12266))

(assert (= (and b!113670 res!56005) b!113665))

(assert (= (and b!113665 c!20390) b!113679))

(assert (= (and b!113665 (not c!20390)) b!113672))

(assert (= (and b!113679 res!56009) b!113680))

(assert (= (or b!113679 b!113672) bm!12261))

(declare-fun b_lambda!5081 () Bool)

(assert (=> (not b_lambda!5081) (not b!113674)))

(assert (=> b!113674 t!5820))

(declare-fun b_and!6975 () Bool)

(assert (= b_and!6971 (and (=> t!5820 result!3589) b_and!6975)))

(assert (=> b!113674 t!5822))

(declare-fun b_and!6977 () Bool)

(assert (= b_and!6973 (and (=> t!5822 result!3591) b_and!6977)))

(declare-fun m!130049 () Bool)

(assert (=> b!113677 m!130049))

(declare-fun m!130051 () Bool)

(assert (=> b!113677 m!130051))

(declare-fun m!130053 () Bool)

(assert (=> b!113677 m!130053))

(declare-fun m!130055 () Bool)

(assert (=> b!113677 m!130055))

(declare-fun m!130057 () Bool)

(assert (=> b!113677 m!130057))

(declare-fun m!130059 () Bool)

(assert (=> b!113677 m!130059))

(assert (=> b!113677 m!130053))

(declare-fun m!130061 () Bool)

(assert (=> b!113677 m!130061))

(declare-fun m!130063 () Bool)

(assert (=> b!113677 m!130063))

(declare-fun m!130065 () Bool)

(assert (=> b!113677 m!130065))

(declare-fun m!130067 () Bool)

(assert (=> b!113677 m!130067))

(declare-fun m!130069 () Bool)

(assert (=> b!113677 m!130069))

(assert (=> b!113677 m!130057))

(declare-fun m!130071 () Bool)

(assert (=> b!113677 m!130071))

(declare-fun m!130073 () Bool)

(assert (=> b!113677 m!130073))

(assert (=> b!113677 m!130063))

(assert (=> b!113677 m!130059))

(declare-fun m!130075 () Bool)

(assert (=> b!113677 m!130075))

(declare-fun m!130077 () Bool)

(assert (=> b!113677 m!130077))

(assert (=> b!113677 m!129383))

(declare-fun m!130079 () Bool)

(assert (=> b!113677 m!130079))

(declare-fun m!130081 () Bool)

(assert (=> bm!12261 m!130081))

(assert (=> b!113676 m!129383))

(assert (=> b!113676 m!129383))

(assert (=> b!113676 m!129389))

(declare-fun m!130083 () Bool)

(assert (=> b!113673 m!130083))

(declare-fun m!130085 () Bool)

(assert (=> bm!12262 m!130085))

(assert (=> bm!12267 m!130069))

(declare-fun m!130087 () Bool)

(assert (=> b!113680 m!130087))

(assert (=> b!113684 m!129383))

(assert (=> b!113684 m!129383))

(assert (=> b!113684 m!129389))

(assert (=> d!32357 m!129295))

(assert (=> b!113681 m!129383))

(assert (=> b!113681 m!129383))

(declare-fun m!130089 () Bool)

(assert (=> b!113681 m!130089))

(declare-fun m!130091 () Bool)

(assert (=> bm!12266 m!130091))

(assert (=> b!113674 m!129383))

(declare-fun m!130093 () Bool)

(assert (=> b!113674 m!130093))

(assert (=> b!113674 m!129403))

(declare-fun m!130095 () Bool)

(assert (=> b!113674 m!130095))

(assert (=> b!113674 m!130095))

(assert (=> b!113674 m!129403))

(declare-fun m!130097 () Bool)

(assert (=> b!113674 m!130097))

(assert (=> b!113674 m!129383))

(declare-fun m!130099 () Bool)

(assert (=> b!113675 m!130099))

(assert (=> bm!12152 d!32357))

(declare-fun d!32359 () Bool)

(declare-fun e!73858 () Bool)

(assert (=> d!32359 e!73858))

(declare-fun res!56015 () Bool)

(assert (=> d!32359 (=> (not res!56015) (not e!73858))))

(declare-fun lt!59046 () ListLongMap!1599)

(assert (=> d!32359 (= res!56015 (contains!846 lt!59046 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(declare-fun lt!59047 () List!1639)

(assert (=> d!32359 (= lt!59046 (ListLongMap!1600 lt!59047))))

(declare-fun lt!59045 () Unit!3521)

(declare-fun lt!59048 () Unit!3521)

(assert (=> d!32359 (= lt!59045 lt!59048)))

(assert (=> d!32359 (= (getValueByKey!160 lt!59047 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32359 (= lt!59048 (lemmaContainsTupThenGetReturnValue!76 lt!59047 (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32359 (= lt!59047 (insertStrictlySorted!79 (toList!815 call!12167) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))))))

(assert (=> d!32359 (= (+!154 call!12167 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)) lt!59046)))

(declare-fun b!113686 () Bool)

(declare-fun res!56014 () Bool)

(assert (=> b!113686 (=> (not res!56014) (not e!73858))))

(assert (=> b!113686 (= res!56014 (= (getValueByKey!160 (toList!815 lt!59046) (_1!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428))) (Some!165 (_2!1238 (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))))

(declare-fun b!113687 () Bool)

(assert (=> b!113687 (= e!73858 (contains!847 (toList!815 lt!59046) (tuple2!2455 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58428)))))

(assert (= (and d!32359 res!56015) b!113686))

(assert (= (and b!113686 res!56014) b!113687))

(declare-fun m!130101 () Bool)

(assert (=> d!32359 m!130101))

(declare-fun m!130103 () Bool)

(assert (=> d!32359 m!130103))

(declare-fun m!130105 () Bool)

(assert (=> d!32359 m!130105))

(declare-fun m!130107 () Bool)

(assert (=> d!32359 m!130107))

(declare-fun m!130109 () Bool)

(assert (=> b!113686 m!130109))

(declare-fun m!130111 () Bool)

(assert (=> b!113687 m!130111))

(assert (=> b!113068 d!32359))

(declare-fun b!113688 () Bool)

(declare-fun e!73860 () Bool)

(declare-fun call!12271 () Bool)

(assert (=> b!113688 (= e!73860 call!12271)))

(declare-fun d!32361 () Bool)

(declare-fun res!56016 () Bool)

(declare-fun e!73859 () Bool)

(assert (=> d!32361 (=> res!56016 e!73859)))

(assert (=> d!32361 (= res!56016 (bvsge #b00000000000000000000000000000000 (size!2352 (_keys!4381 newMap!16))))))

(assert (=> d!32361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4381 newMap!16) (mask!6845 newMap!16)) e!73859)))

(declare-fun b!113689 () Bool)

(assert (=> b!113689 (= e!73859 e!73860)))

(declare-fun c!20393 () Bool)

(assert (=> b!113689 (= c!20393 (validKeyInArray!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12268 () Bool)

(assert (=> bm!12268 (= call!12271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4381 newMap!16) (mask!6845 newMap!16)))))

(declare-fun b!113690 () Bool)

(declare-fun e!73861 () Bool)

(assert (=> b!113690 (= e!73861 call!12271)))

(declare-fun b!113691 () Bool)

(assert (=> b!113691 (= e!73860 e!73861)))

(declare-fun lt!59051 () (_ BitVec 64))

(assert (=> b!113691 (= lt!59051 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!59049 () Unit!3521)

(assert (=> b!113691 (= lt!59049 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4381 newMap!16) lt!59051 #b00000000000000000000000000000000))))

(assert (=> b!113691 (arrayContainsKey!0 (_keys!4381 newMap!16) lt!59051 #b00000000000000000000000000000000)))

(declare-fun lt!59050 () Unit!3521)

(assert (=> b!113691 (= lt!59050 lt!59049)))

(declare-fun res!56017 () Bool)

(assert (=> b!113691 (= res!56017 (= (seekEntryOrOpen!0 (select (arr!2093 (_keys!4381 newMap!16)) #b00000000000000000000000000000000) (_keys!4381 newMap!16) (mask!6845 newMap!16)) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!113691 (=> (not res!56017) (not e!73861))))

(assert (= (and d!32361 (not res!56016)) b!113689))

(assert (= (and b!113689 c!20393) b!113691))

(assert (= (and b!113689 (not c!20393)) b!113688))

(assert (= (and b!113691 res!56017) b!113690))

(assert (= (or b!113690 b!113688) bm!12268))

(assert (=> b!113689 m!129383))

(assert (=> b!113689 m!129383))

(assert (=> b!113689 m!129389))

(declare-fun m!130113 () Bool)

(assert (=> bm!12268 m!130113))

(assert (=> b!113691 m!129383))

(declare-fun m!130115 () Bool)

(assert (=> b!113691 m!130115))

(declare-fun m!130117 () Bool)

(assert (=> b!113691 m!130117))

(assert (=> b!113691 m!129383))

(declare-fun m!130119 () Bool)

(assert (=> b!113691 m!130119))

(assert (=> b!113192 d!32361))

(assert (=> d!32129 d!32133))

(declare-fun d!32363 () Bool)

(assert (=> d!32363 (not (arrayContainsKey!0 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!32363 true))

(declare-fun _$68!118 () Unit!3521)

(assert (=> d!32363 (= (choose!68 (_keys!4381 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1636 (select (arr!2093 (_keys!4381 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1637)) _$68!118)))

(declare-fun bs!4665 () Bool)

(assert (= bs!4665 d!32363))

(assert (=> bs!4665 m!128915))

(assert (=> bs!4665 m!128927))

(assert (=> d!32129 d!32363))

(declare-fun d!32365 () Bool)

(assert (=> d!32365 (= (+!154 (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)) (tuple2!2455 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58428)) (getCurrentListMap!499 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) lt!58594 (zeroValue!2529 newMap!16) lt!58428 #b00000000000000000000000000000000 (defaultEntry!2661 newMap!16)))))

(declare-fun lt!59054 () Unit!3521)

(declare-fun choose!722 (array!4417 array!4419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3259 V!3259 V!3259 Int) Unit!3521)

(assert (=> d!32365 (= lt!59054 (choose!722 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58594 (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) lt!58428 (defaultEntry!2661 newMap!16)))))

(assert (=> d!32365 (validMask!0 (mask!6845 newMap!16))))

(assert (=> d!32365 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4381 newMap!16) (_values!2644 newMap!16) (mask!6845 newMap!16) (extraKeys!2452 newMap!16) lt!58594 (zeroValue!2529 newMap!16) (minValue!2529 newMap!16) lt!58428 (defaultEntry!2661 newMap!16)) lt!59054)))

(declare-fun bs!4666 () Bool)

(assert (= bs!4666 d!32365))

(assert (=> bs!4666 m!129133))

(declare-fun m!130121 () Bool)

(assert (=> bs!4666 m!130121))

(assert (=> bs!4666 m!129295))

(assert (=> bs!4666 m!129133))

(declare-fun m!130123 () Bool)

(assert (=> bs!4666 m!130123))

(declare-fun m!130125 () Bool)

(assert (=> bs!4666 m!130125))

(assert (=> b!113040 d!32365))

(declare-fun d!32367 () Bool)

(assert (=> d!32367 (= (inRange!0 (ite c!20227 (ite c!20231 (index!3205 lt!58597) (ite c!20230 (index!3204 lt!58598) (index!3207 lt!58598))) (ite c!20226 (index!3205 lt!58585) (ite c!20222 (index!3204 lt!58599) (index!3207 lt!58599)))) (mask!6845 newMap!16)) (and (bvsge (ite c!20227 (ite c!20231 (index!3205 lt!58597) (ite c!20230 (index!3204 lt!58598) (index!3207 lt!58598))) (ite c!20226 (index!3205 lt!58585) (ite c!20222 (index!3204 lt!58599) (index!3207 lt!58599)))) #b00000000000000000000000000000000) (bvslt (ite c!20227 (ite c!20231 (index!3205 lt!58597) (ite c!20230 (index!3204 lt!58598) (index!3207 lt!58598))) (ite c!20226 (index!3205 lt!58585) (ite c!20222 (index!3204 lt!58599) (index!3207 lt!58599)))) (bvadd (mask!6845 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!12161 d!32367))

(assert (=> d!32143 d!32115))

(declare-fun b!113692 () Bool)

(declare-fun e!73862 () Bool)

(assert (=> b!113692 (= e!73862 tp_is_empty!2709)))

(declare-fun mapIsEmpty!4061 () Bool)

(declare-fun mapRes!4061 () Bool)

(assert (=> mapIsEmpty!4061 mapRes!4061))

(declare-fun mapNonEmpty!4061 () Bool)

(declare-fun tp!10127 () Bool)

(assert (=> mapNonEmpty!4061 (= mapRes!4061 (and tp!10127 e!73862))))

(declare-fun mapRest!4061 () (Array (_ BitVec 32) ValueCell!1011))

(declare-fun mapKey!4061 () (_ BitVec 32))

(declare-fun mapValue!4061 () ValueCell!1011)

(assert (=> mapNonEmpty!4061 (= mapRest!4060 (store mapRest!4061 mapKey!4061 mapValue!4061))))

(declare-fun b!113693 () Bool)

(declare-fun e!73863 () Bool)

(assert (=> b!113693 (= e!73863 tp_is_empty!2709)))

(declare-fun condMapEmpty!4061 () Bool)

(declare-fun mapDefault!4061 () ValueCell!1011)

(assert (=> mapNonEmpty!4060 (= condMapEmpty!4061 (= mapRest!4060 ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4061)))))

(assert (=> mapNonEmpty!4060 (= tp!10126 (and e!73863 mapRes!4061))))

(assert (= (and mapNonEmpty!4060 condMapEmpty!4061) mapIsEmpty!4061))

(assert (= (and mapNonEmpty!4060 (not condMapEmpty!4061)) mapNonEmpty!4061))

(assert (= (and mapNonEmpty!4061 ((_ is ValueCellFull!1011) mapValue!4061)) b!113692))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1011) mapDefault!4061)) b!113693))

(declare-fun m!130127 () Bool)

(assert (=> mapNonEmpty!4061 m!130127))

(declare-fun b!113694 () Bool)

(declare-fun e!73864 () Bool)

(assert (=> b!113694 (= e!73864 tp_is_empty!2709)))

(declare-fun mapIsEmpty!4062 () Bool)

(declare-fun mapRes!4062 () Bool)

(assert (=> mapIsEmpty!4062 mapRes!4062))

(declare-fun mapNonEmpty!4062 () Bool)

(declare-fun tp!10128 () Bool)

(assert (=> mapNonEmpty!4062 (= mapRes!4062 (and tp!10128 e!73864))))

(declare-fun mapKey!4062 () (_ BitVec 32))

(declare-fun mapValue!4062 () ValueCell!1011)

(declare-fun mapRest!4062 () (Array (_ BitVec 32) ValueCell!1011))

(assert (=> mapNonEmpty!4062 (= mapRest!4059 (store mapRest!4062 mapKey!4062 mapValue!4062))))

(declare-fun b!113695 () Bool)

(declare-fun e!73865 () Bool)

(assert (=> b!113695 (= e!73865 tp_is_empty!2709)))

(declare-fun condMapEmpty!4062 () Bool)

(declare-fun mapDefault!4062 () ValueCell!1011)

(assert (=> mapNonEmpty!4059 (= condMapEmpty!4062 (= mapRest!4059 ((as const (Array (_ BitVec 32) ValueCell!1011)) mapDefault!4062)))))

(assert (=> mapNonEmpty!4059 (= tp!10125 (and e!73865 mapRes!4062))))

(assert (= (and mapNonEmpty!4059 condMapEmpty!4062) mapIsEmpty!4062))

(assert (= (and mapNonEmpty!4059 (not condMapEmpty!4062)) mapNonEmpty!4062))

(assert (= (and mapNonEmpty!4062 ((_ is ValueCellFull!1011) mapValue!4062)) b!113694))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1011) mapDefault!4062)) b!113695))

(declare-fun m!130129 () Bool)

(assert (=> mapNonEmpty!4062 m!130129))

(declare-fun b_lambda!5083 () Bool)

(assert (= b_lambda!5077 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5083)))

(declare-fun b_lambda!5085 () Bool)

(assert (= b_lambda!5081 (or (and b!112823 b_free!2585 (= (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2661 newMap!16))) (and b!112813 b_free!2587) b_lambda!5085)))

(declare-fun b_lambda!5087 () Bool)

(assert (= b_lambda!5073 (or (and b!112823 b_free!2585 (= (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2661 newMap!16))) (and b!112813 b_free!2587) b_lambda!5087)))

(declare-fun b_lambda!5089 () Bool)

(assert (= b_lambda!5075 (or (and b!112823 b_free!2585) (and b!112813 b_free!2587 (= (defaultEntry!2661 newMap!16) (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))))) b_lambda!5089)))

(declare-fun b_lambda!5091 () Bool)

(assert (= b_lambda!5079 (or (and b!112823 b_free!2585 (= (defaultEntry!2661 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2661 newMap!16))) (and b!112813 b_free!2587) b_lambda!5091)))

(check-sat (not b!113313) (not b!113555) (not bm!12217) (not d!32327) (not b!113612) (not b!113605) (not d!32219) (not bm!12254) (not b!113215) (not b!113346) (not b!113217) (not b!113547) (not d!32259) (not d!32279) (not b!113421) (not b!113386) (not b!113691) (not b!113583) (not b!113363) (not b!113681) (not d!32339) (not b!113487) (not d!32205) (not b!113597) (not b!113372) (not b!113505) (not d!32173) (not b!113613) (not d!32351) (not b!113689) (not b_lambda!5083) (not bm!12240) (not b!113686) b_and!6975 (not b!113568) (not b!113512) (not b!113339) (not b!113316) (not b!113674) (not b!113507) (not d!32161) (not d!32229) (not b!113610) (not b!113321) (not b!113306) (not b!113303) (not b!113620) (not b!113593) (not bm!12262) (not b!113389) (not b!113240) (not b!113320) (not bm!12248) (not bm!12261) (not d!32325) (not b!113550) (not b!113532) (not b!113479) (not b!113675) (not d!32365) (not b!113567) (not b!113586) (not b!113649) (not d!32201) (not d!32303) (not d!32299) (not b!113636) (not b!113370) (not b!113324) (not b!113545) (not b!113319) (not b!113329) (not b!113646) (not bm!12218) (not d!32267) (not b!113622) (not d!32309) (not b!113495) (not d!32225) (not b!113464) (not b!113496) (not b_lambda!5087) (not d!32329) (not d!32207) (not b!113335) (not bm!12225) (not bm!12252) (not d!32181) (not b!113546) (not b!113373) (not b!113360) (not b!113638) (not d!32273) (not b!113357) (not bm!12230) (not b!113326) (not d!32153) (not b!113260) (not b!113309) (not b!113634) (not b!113540) (not b!113420) (not mapNonEmpty!4062) (not b!113253) (not b!113367) (not b_lambda!5091) (not b!113494) (not b_lambda!5067) (not d!32175) (not bm!12266) (not d!32277) (not b!113637) (not b!113492) (not b!113630) (not b!113677) (not bm!12268) (not b!113459) (not b!113383) (not b!113661) (not b!113239) (not b!113562) (not b!113624) (not d!32209) (not b_next!2587) (not d!32331) (not b!113471) (not b!113293) (not b!113647) (not b!113332) (not b!113501) (not b!113573) (not b!113291) (not b!113231) (not bm!12267) (not b!113584) (not d!32363) (not b_lambda!5085) (not b!113554) tp_is_empty!2709 b_and!6977 (not b!113536) (not b!113664) (not bm!12260) (not b!113498) (not d!32217) (not b!113310) (not b!113687) (not b!113284) (not b_lambda!5069) (not bm!12241) (not d!32243) (not d!32189) (not b!113482) (not b!113378) (not b!113341) (not bm!12243) (not b!113317) (not d!32353) (not d!32249) (not d!32359) (not b!113619) (not d!32343) (not b!113377) (not b!113290) (not d!32177) (not b!113461) (not d!32255) (not b!113539) (not b!113589) (not b!113475) (not b_lambda!5089) (not b!113485) (not b!113477) (not d!32333) (not d!32337) (not b!113338) (not d!32185) (not b!113394) (not b!113549) (not bm!12212) (not b!113365) (not b!113616) (not d!32323) (not b!113497) (not b!113660) (not d!32287) (not b!113304) (not d!32317) (not d!32237) (not b!113302) (not b!113534) (not d!32285) (not b!113242) (not b!113595) (not d!32345) (not d!32313) (not d!32159) (not bm!12211) (not d!32321) (not d!32245) (not b!113680) (not bm!12244) (not b!113347) (not d!32193) (not d!32155) (not b!113537) (not d!32163) (not bm!12259) (not b!113503) (not b!113553) (not b!113358) (not d!32251) (not b!113585) (not d!32263) (not b!113632) (not bm!12219) (not b!113676) (not b!113673) (not bm!12213) (not b!113466) (not d!32167) (not d!32319) (not d!32191) (not d!32231) (not b!113542) (not b!113315) (not b!113684) (not d!32335) (not b!113635) (not b!113259) (not bm!12249) (not b!113617) (not b!113650) (not b!113640) (not b!113560) (not b!113510) (not d!32357) (not d!32253) (not b!113322) (not b!113237) (not b_next!2585) (not d!32169) (not d!32341) (not b!113351) (not d!32275) (not d!32297) (not b!113334) (not b!113216) (not b!113318) (not b!113603) (not d!32213) (not b!113469) (not b!113325) (not b!113513) (not d!32355) (not b!113563) (not bm!12247) (not d!32293) (not d!32349) (not bm!12231) (not b!113305) (not b!113285) (not b!113544) (not d!32235) (not b!113538) (not b!113535) (not b_lambda!5059) (not d!32151) (not d!32301) (not b!113352) (not bm!12253) (not d!32311) (not d!32281) (not d!32241) (not b!113344) (not mapNonEmpty!4061) (not b_lambda!5071) (not b!113388) (not b!113557) (not b!113218) (not b!113529) (not d!32179) (not d!32183) (not d!32157) (not b!113506) (not bm!12258) (not d!32347) (not b!113590) (not d!32307) (not d!32291) (not b!113582) (not bm!12222))
(check-sat b_and!6975 b_and!6977 (not b_next!2585) (not b_next!2587))
