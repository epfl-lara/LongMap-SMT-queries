; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10946 () Bool)

(assert start!10946)

(declare-fun b!88750 () Bool)

(declare-fun b_free!2257 () Bool)

(declare-fun b_next!2257 () Bool)

(assert (=> b!88750 (= b_free!2257 (not b_next!2257))))

(declare-fun tp!9011 () Bool)

(declare-fun b_and!5335 () Bool)

(assert (=> b!88750 (= tp!9011 b_and!5335)))

(declare-fun b!88770 () Bool)

(declare-fun b_free!2259 () Bool)

(declare-fun b_next!2259 () Bool)

(assert (=> b!88770 (= b_free!2259 (not b_next!2259))))

(declare-fun tp!9009 () Bool)

(declare-fun b_and!5337 () Bool)

(assert (=> b!88770 (= tp!9009 b_and!5337)))

(declare-fun b!88749 () Bool)

(declare-fun e!57790 () Bool)

(declare-fun e!57786 () Bool)

(assert (=> b!88749 (= e!57790 e!57786)))

(declare-datatypes ((V!3041 0))(
  ( (V!3042 (val!1317 Int)) )
))
(declare-datatypes ((array!4053 0))(
  ( (array!4054 (arr!1929 (Array (_ BitVec 32) (_ BitVec 64))) (size!2175 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!929 0))(
  ( (ValueCellFull!929 (v!2671 V!3041)) (EmptyCell!929) )
))
(declare-datatypes ((array!4055 0))(
  ( (array!4056 (arr!1930 (Array (_ BitVec 32) ValueCell!929)) (size!2176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!766 0))(
  ( (LongMapFixedSize!767 (defaultEntry!2371 Int) (mask!6415 (_ BitVec 32)) (extraKeys!2204 (_ BitVec 32)) (zeroValue!2260 V!3041) (minValue!2260 V!3041) (_size!432 (_ BitVec 32)) (_keys!4049 array!4053) (_values!2354 array!4055) (_vacant!432 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!566 0))(
  ( (Cell!567 (v!2672 LongMapFixedSize!766)) )
))
(declare-datatypes ((LongMap!566 0))(
  ( (LongMap!567 (underlying!294 Cell!566)) )
))
(declare-fun thiss!992 () LongMap!566)

(declare-fun e!57793 () Bool)

(declare-fun tp_is_empty!2545 () Bool)

(declare-fun array_inv!1193 (array!4053) Bool)

(declare-fun array_inv!1194 (array!4055) Bool)

(assert (=> b!88750 (= e!57786 (and tp!9011 tp_is_empty!2545 (array_inv!1193 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) (array_inv!1194 (_values!2354 (v!2672 (underlying!294 thiss!992)))) e!57793))))

(declare-fun b!88751 () Bool)

(declare-fun e!57798 () Bool)

(declare-fun e!57787 () Bool)

(assert (=> b!88751 (= e!57798 e!57787)))

(declare-fun res!45437 () Bool)

(assert (=> b!88751 (=> (not res!45437) (not e!57787))))

(declare-datatypes ((tuple2!2206 0))(
  ( (tuple2!2207 (_1!1114 Bool) (_2!1114 LongMapFixedSize!766)) )
))
(declare-fun lt!42486 () tuple2!2206)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!88751 (= res!45437 (and (_1!1114 lt!42486) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2632 0))(
  ( (Unit!2633) )
))
(declare-fun lt!42477 () Unit!2632)

(declare-fun e!57797 () Unit!2632)

(assert (=> b!88751 (= lt!42477 e!57797)))

(declare-datatypes ((tuple2!2208 0))(
  ( (tuple2!2209 (_1!1115 (_ BitVec 64)) (_2!1115 V!3041)) )
))
(declare-datatypes ((List!1524 0))(
  ( (Nil!1521) (Cons!1520 (h!2112 tuple2!2208) (t!5278 List!1524)) )
))
(declare-datatypes ((ListLongMap!1467 0))(
  ( (ListLongMap!1468 (toList!749 List!1524)) )
))
(declare-fun lt!42484 () ListLongMap!1467)

(declare-fun c!14714 () Bool)

(declare-fun contains!759 (ListLongMap!1467 (_ BitVec 64)) Bool)

(assert (=> b!88751 (= c!14714 (contains!759 lt!42484 (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355)))))

(declare-fun lt!42479 () V!3041)

(declare-fun newMap!16 () LongMapFixedSize!766)

(declare-fun update!114 (LongMapFixedSize!766 (_ BitVec 64) V!3041) tuple2!2206)

(assert (=> b!88751 (= lt!42486 (update!114 newMap!16 (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) lt!42479))))

(declare-fun mapIsEmpty!3443 () Bool)

(declare-fun mapRes!3444 () Bool)

(assert (=> mapIsEmpty!3443 mapRes!3444))

(declare-fun b!88752 () Bool)

(declare-fun e!57799 () Bool)

(declare-fun e!57801 () Bool)

(assert (=> b!88752 (= e!57799 e!57801)))

(declare-fun res!45433 () Bool)

(assert (=> b!88752 (=> (not res!45433) (not e!57801))))

(declare-fun lt!42478 () ListLongMap!1467)

(assert (=> b!88752 (= res!45433 (= lt!42478 lt!42484))))

(declare-fun map!1195 (LongMapFixedSize!766) ListLongMap!1467)

(assert (=> b!88752 (= lt!42484 (map!1195 newMap!16))))

(declare-fun getCurrentListMap!442 (array!4053 array!4055 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) ListLongMap!1467)

(assert (=> b!88752 (= lt!42478 (getCurrentListMap!442 (_keys!4049 (v!2672 (underlying!294 thiss!992))) (_values!2354 (v!2672 (underlying!294 thiss!992))) (mask!6415 (v!2672 (underlying!294 thiss!992))) (extraKeys!2204 (v!2672 (underlying!294 thiss!992))) (zeroValue!2260 (v!2672 (underlying!294 thiss!992))) (minValue!2260 (v!2672 (underlying!294 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2672 (underlying!294 thiss!992)))))))

(declare-fun b!88753 () Bool)

(declare-fun e!57800 () Bool)

(assert (=> b!88753 (= e!57800 tp_is_empty!2545)))

(declare-fun b!88754 () Bool)

(declare-fun res!45436 () Bool)

(assert (=> b!88754 (=> (not res!45436) (not e!57799))))

(assert (=> b!88754 (= res!45436 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6415 newMap!16)) (_size!432 (v!2672 (underlying!294 thiss!992)))))))

(declare-fun b!88755 () Bool)

(declare-fun e!57794 () Bool)

(assert (=> b!88755 (= e!57794 tp_is_empty!2545)))

(declare-fun b!88756 () Bool)

(declare-fun Unit!2634 () Unit!2632)

(assert (=> b!88756 (= e!57797 Unit!2634)))

(declare-fun b!88757 () Bool)

(declare-fun e!57796 () Bool)

(assert (=> b!88757 (= e!57796 e!57790)))

(declare-fun b!88758 () Bool)

(declare-fun e!57802 () Bool)

(assert (=> b!88758 (= e!57802 tp_is_empty!2545)))

(declare-fun b!88759 () Bool)

(declare-fun e!57789 () Bool)

(declare-datatypes ((List!1525 0))(
  ( (Nil!1522) (Cons!1521 (h!2113 (_ BitVec 64)) (t!5279 List!1525)) )
))
(declare-fun arrayNoDuplicates!0 (array!4053 (_ BitVec 32) List!1525) Bool)

(assert (=> b!88759 (= e!57789 (arrayNoDuplicates!0 (_keys!4049 (v!2672 (underlying!294 thiss!992))) #b00000000000000000000000000000000 Nil!1522))))

(declare-fun b!88760 () Bool)

(assert (=> b!88760 (= e!57801 e!57798)))

(declare-fun res!45435 () Bool)

(assert (=> b!88760 (=> (not res!45435) (not e!57798))))

(assert (=> b!88760 (= res!45435 (and (not (= (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1207 (ValueCell!929 V!3041) V!3041)

(declare-fun dynLambda!343 (Int (_ BitVec 64)) V!3041)

(assert (=> b!88760 (= lt!42479 (get!1207 (select (arr!1930 (_values!2354 (v!2672 (underlying!294 thiss!992)))) from!355) (dynLambda!343 (defaultEntry!2371 (v!2672 (underlying!294 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!45431 () Bool)

(assert (=> start!10946 (=> (not res!45431) (not e!57799))))

(declare-fun valid!328 (LongMap!566) Bool)

(assert (=> start!10946 (= res!45431 (valid!328 thiss!992))))

(assert (=> start!10946 e!57799))

(assert (=> start!10946 e!57796))

(assert (=> start!10946 true))

(declare-fun e!57795 () Bool)

(assert (=> start!10946 e!57795))

(declare-fun b!88761 () Bool)

(declare-fun Unit!2635 () Unit!2632)

(assert (=> b!88761 (= e!57797 Unit!2635)))

(declare-fun lt!42492 () Unit!2632)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!69 (array!4053 array!4055 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2632)

(assert (=> b!88761 (= lt!42492 (lemmaListMapContainsThenArrayContainsFrom!69 (_keys!4049 (v!2672 (underlying!294 thiss!992))) (_values!2354 (v!2672 (underlying!294 thiss!992))) (mask!6415 (v!2672 (underlying!294 thiss!992))) (extraKeys!2204 (v!2672 (underlying!294 thiss!992))) (zeroValue!2260 (v!2672 (underlying!294 thiss!992))) (minValue!2260 (v!2672 (underlying!294 thiss!992))) (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2672 (underlying!294 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!88761 (arrayContainsKey!0 (_keys!4049 (v!2672 (underlying!294 thiss!992))) (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!42483 () Unit!2632)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4053 (_ BitVec 32) (_ BitVec 32)) Unit!2632)

(assert (=> b!88761 (= lt!42483 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4049 (v!2672 (underlying!294 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!88761 (arrayNoDuplicates!0 (_keys!4049 (v!2672 (underlying!294 thiss!992))) from!355 Nil!1522)))

(declare-fun lt!42485 () Unit!2632)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4053 (_ BitVec 32) (_ BitVec 64) List!1525) Unit!2632)

(assert (=> b!88761 (= lt!42485 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4049 (v!2672 (underlying!294 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) (Cons!1521 (select (arr!1929 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) from!355) Nil!1522)))))

(assert (=> b!88761 false))

(declare-fun b!88762 () Bool)

(declare-fun res!45429 () Bool)

(assert (=> b!88762 (=> res!45429 e!57789)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4053 (_ BitVec 32)) Bool)

(assert (=> b!88762 (= res!45429 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 (v!2672 (underlying!294 thiss!992))) (mask!6415 (v!2672 (underlying!294 thiss!992))))))))

(declare-fun mapIsEmpty!3444 () Bool)

(declare-fun mapRes!3443 () Bool)

(assert (=> mapIsEmpty!3444 mapRes!3443))

(declare-fun b!88763 () Bool)

(declare-fun e!57791 () Bool)

(assert (=> b!88763 (= e!57791 tp_is_empty!2545)))

(declare-fun mapNonEmpty!3443 () Bool)

(declare-fun tp!9012 () Bool)

(assert (=> mapNonEmpty!3443 (= mapRes!3444 (and tp!9012 e!57802))))

(declare-fun mapRest!3444 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapValue!3444 () ValueCell!929)

(declare-fun mapKey!3444 () (_ BitVec 32))

(assert (=> mapNonEmpty!3443 (= (arr!1930 (_values!2354 (v!2672 (underlying!294 thiss!992)))) (store mapRest!3444 mapKey!3444 mapValue!3444))))

(declare-fun b!88764 () Bool)

(declare-fun res!45434 () Bool)

(assert (=> b!88764 (=> res!45434 e!57789)))

(assert (=> b!88764 (= res!45434 (or (not (= (size!2176 (_values!2354 (v!2672 (underlying!294 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6415 (v!2672 (underlying!294 thiss!992)))))) (not (= (size!2175 (_keys!4049 (v!2672 (underlying!294 thiss!992)))) (size!2176 (_values!2354 (v!2672 (underlying!294 thiss!992)))))) (bvslt (mask!6415 (v!2672 (underlying!294 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2204 (v!2672 (underlying!294 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2204 (v!2672 (underlying!294 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!88765 () Bool)

(declare-fun e!57785 () Bool)

(assert (=> b!88765 (= e!57785 (and e!57800 mapRes!3443))))

(declare-fun condMapEmpty!3443 () Bool)

(declare-fun mapDefault!3443 () ValueCell!929)

