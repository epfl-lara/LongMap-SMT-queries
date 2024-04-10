; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15210 () Bool)

(assert start!15210)

(declare-fun b!146429 () Bool)

(declare-fun b_free!3125 () Bool)

(declare-fun b_next!3125 () Bool)

(assert (=> b!146429 (= b_free!3125 (not b_next!3125))))

(declare-fun tp!11878 () Bool)

(declare-fun b_and!9167 () Bool)

(assert (=> b!146429 (= tp!11878 b_and!9167)))

(declare-fun b!146431 () Bool)

(declare-fun b_free!3127 () Bool)

(declare-fun b_next!3127 () Bool)

(assert (=> b!146431 (= b_free!3127 (not b_next!3127))))

(declare-fun tp!11879 () Bool)

(declare-fun b_and!9169 () Bool)

(assert (=> b!146431 (= tp!11879 b_and!9169)))

(declare-fun mapIsEmpty!5009 () Bool)

(declare-fun mapRes!5009 () Bool)

(assert (=> mapIsEmpty!5009 mapRes!5009))

(declare-fun b!146414 () Bool)

(declare-fun e!95538 () Bool)

(declare-fun tp_is_empty!2979 () Bool)

(assert (=> b!146414 (= e!95538 tp_is_empty!2979)))

(declare-fun res!69660 () Bool)

(declare-fun e!95542 () Bool)

(assert (=> start!15210 (=> (not res!69660) (not e!95542))))

(declare-datatypes ((V!3619 0))(
  ( (V!3620 (val!1534 Int)) )
))
(declare-datatypes ((array!5003 0))(
  ( (array!5004 (arr!2363 (Array (_ BitVec 32) (_ BitVec 64))) (size!2639 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1146 0))(
  ( (ValueCellFull!1146 (v!3357 V!3619)) (EmptyCell!1146) )
))
(declare-datatypes ((array!5005 0))(
  ( (array!5006 (arr!2364 (Array (_ BitVec 32) ValueCell!1146)) (size!2640 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1200 0))(
  ( (LongMapFixedSize!1201 (defaultEntry!3016 Int) (mask!7394 (_ BitVec 32)) (extraKeys!2761 (_ BitVec 32)) (zeroValue!2861 V!3619) (minValue!2861 V!3619) (_size!649 (_ BitVec 32)) (_keys!4785 array!5003) (_values!2999 array!5005) (_vacant!649 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!982 0))(
  ( (Cell!983 (v!3358 LongMapFixedSize!1200)) )
))
(declare-datatypes ((LongMap!982 0))(
  ( (LongMap!983 (underlying!502 Cell!982)) )
))
(declare-fun thiss!992 () LongMap!982)

(declare-fun valid!584 (LongMap!982) Bool)

(assert (=> start!15210 (= res!69660 (valid!584 thiss!992))))

(assert (=> start!15210 e!95542))

(declare-fun e!95553 () Bool)

(assert (=> start!15210 e!95553))

(assert (=> start!15210 true))

(declare-fun e!95546 () Bool)

(assert (=> start!15210 e!95546))

(declare-fun b!146415 () Bool)

(declare-fun res!69657 () Bool)

(assert (=> b!146415 (=> (not res!69657) (not e!95542))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146415 (= res!69657 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2639 (_keys!4785 (v!3358 (underlying!502 thiss!992)))))))))

(declare-fun b!146416 () Bool)

(declare-fun e!95548 () Bool)

(assert (=> b!146416 (= e!95548 tp_is_empty!2979)))

(declare-fun b!146417 () Bool)

(declare-fun e!95551 () Bool)

(declare-fun e!95547 () Bool)

(assert (=> b!146417 (= e!95551 e!95547)))

(declare-fun res!69661 () Bool)

(assert (=> b!146417 (=> (not res!69661) (not e!95547))))

(declare-datatypes ((tuple2!2762 0))(
  ( (tuple2!2763 (_1!1392 Bool) (_2!1392 LongMapFixedSize!1200)) )
))
(declare-fun lt!77036 () tuple2!2762)

(assert (=> b!146417 (= res!69661 (and (_1!1392 lt!77036) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4626 0))(
  ( (Unit!4627) )
))
(declare-fun lt!77026 () Unit!4626)

(declare-fun e!95545 () Unit!4626)

(assert (=> b!146417 (= lt!77026 e!95545)))

(declare-datatypes ((tuple2!2764 0))(
  ( (tuple2!2765 (_1!1393 (_ BitVec 64)) (_2!1393 V!3619)) )
))
(declare-datatypes ((List!1780 0))(
  ( (Nil!1777) (Cons!1776 (h!2384 tuple2!2764) (t!6489 List!1780)) )
))
(declare-datatypes ((ListLongMap!1779 0))(
  ( (ListLongMap!1780 (toList!905 List!1780)) )
))
(declare-fun lt!77035 () ListLongMap!1779)

(declare-fun c!27635 () Bool)

(declare-fun contains!951 (ListLongMap!1779 (_ BitVec 64)) Bool)

(assert (=> b!146417 (= c!27635 (contains!951 lt!77035 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1200)

(declare-fun lt!77025 () V!3619)

(declare-fun update!226 (LongMapFixedSize!1200 (_ BitVec 64) V!3619) tuple2!2762)

(assert (=> b!146417 (= lt!77036 (update!226 newMap!16 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) lt!77025))))

(declare-fun b!146418 () Bool)

(declare-fun res!69662 () Bool)

(assert (=> b!146418 (=> (not res!69662) (not e!95542))))

(declare-fun valid!585 (LongMapFixedSize!1200) Bool)

(assert (=> b!146418 (= res!69662 (valid!585 newMap!16))))

(declare-fun mapIsEmpty!5010 () Bool)

(declare-fun mapRes!5010 () Bool)

(assert (=> mapIsEmpty!5010 mapRes!5010))

(declare-fun b!146419 () Bool)

(declare-fun Unit!4628 () Unit!4626)

(assert (=> b!146419 (= e!95545 Unit!4628)))

(declare-fun lt!77024 () Unit!4626)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!155 (array!5003 array!5005 (_ BitVec 32) (_ BitVec 32) V!3619 V!3619 (_ BitVec 64) (_ BitVec 32) Int) Unit!4626)

(assert (=> b!146419 (= lt!77024 (lemmaListMapContainsThenArrayContainsFrom!155 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (_values!2999 (v!3358 (underlying!502 thiss!992))) (mask!7394 (v!3358 (underlying!502 thiss!992))) (extraKeys!2761 (v!3358 (underlying!502 thiss!992))) (zeroValue!2861 (v!3358 (underlying!502 thiss!992))) (minValue!2861 (v!3358 (underlying!502 thiss!992))) (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146419 (arrayContainsKey!0 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77029 () Unit!4626)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5003 (_ BitVec 32) (_ BitVec 32)) Unit!4626)

(assert (=> b!146419 (= lt!77029 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4785 (v!3358 (underlying!502 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1781 0))(
  ( (Nil!1778) (Cons!1777 (h!2385 (_ BitVec 64)) (t!6490 List!1781)) )
))
(declare-fun arrayNoDuplicates!0 (array!5003 (_ BitVec 32) List!1781) Bool)

(assert (=> b!146419 (arrayNoDuplicates!0 (_keys!4785 (v!3358 (underlying!502 thiss!992))) from!355 Nil!1778)))

(declare-fun lt!77038 () Unit!4626)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5003 (_ BitVec 32) (_ BitVec 64) List!1781) Unit!4626)

(assert (=> b!146419 (= lt!77038 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) (Cons!1777 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) Nil!1778)))))

(assert (=> b!146419 false))

(declare-fun mapNonEmpty!5009 () Bool)

(declare-fun tp!11880 () Bool)

(declare-fun e!95537 () Bool)

(assert (=> mapNonEmpty!5009 (= mapRes!5009 (and tp!11880 e!95537))))

(declare-fun mapKey!5009 () (_ BitVec 32))

(declare-fun mapRest!5009 () (Array (_ BitVec 32) ValueCell!1146))

(declare-fun mapValue!5009 () ValueCell!1146)

(assert (=> mapNonEmpty!5009 (= (arr!2364 (_values!2999 (v!3358 (underlying!502 thiss!992)))) (store mapRest!5009 mapKey!5009 mapValue!5009))))

(declare-fun b!146420 () Bool)

(declare-fun e!95543 () Bool)

(declare-fun e!95549 () Bool)

(assert (=> b!146420 (= e!95543 e!95549)))

(declare-fun b!146421 () Bool)

(declare-fun e!95552 () Bool)

(assert (=> b!146421 (= e!95552 (bvslt (bvsub from!355 #b00000000000000000000000000000001) from!355))))

(declare-fun b!146422 () Bool)

(declare-fun e!95539 () Bool)

(assert (=> b!146422 (= e!95539 e!95551)))

(declare-fun res!69663 () Bool)

(assert (=> b!146422 (=> (not res!69663) (not e!95551))))

(assert (=> b!146422 (= res!69663 (and (not (= (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1574 (ValueCell!1146 V!3619) V!3619)

(declare-fun dynLambda!458 (Int (_ BitVec 64)) V!3619)

(assert (=> b!146422 (= lt!77025 (get!1574 (select (arr!2364 (_values!2999 (v!3358 (underlying!502 thiss!992)))) from!355) (dynLambda!458 (defaultEntry!3016 (v!3358 (underlying!502 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146423 () Bool)

(assert (=> b!146423 (= e!95547 (not e!95552))))

(declare-fun res!69658 () Bool)

(assert (=> b!146423 (=> res!69658 e!95552)))

(declare-fun getCurrentListMap!574 (array!5003 array!5005 (_ BitVec 32) (_ BitVec 32) V!3619 V!3619 (_ BitVec 32) Int) ListLongMap!1779)

(declare-fun map!1471 (LongMapFixedSize!1200) ListLongMap!1779)

(assert (=> b!146423 (= res!69658 (not (= (getCurrentListMap!574 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (_values!2999 (v!3358 (underlying!502 thiss!992))) (mask!7394 (v!3358 (underlying!502 thiss!992))) (extraKeys!2761 (v!3358 (underlying!502 thiss!992))) (zeroValue!2861 (v!3358 (underlying!502 thiss!992))) (minValue!2861 (v!3358 (underlying!502 thiss!992))) from!355 (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))) (map!1471 (_2!1392 lt!77036)))))))

(declare-fun lt!77034 () tuple2!2764)

(declare-fun lt!77039 () ListLongMap!1779)

(declare-fun lt!77023 () ListLongMap!1779)

(declare-fun lt!77031 () tuple2!2764)

(declare-fun +!185 (ListLongMap!1779 tuple2!2764) ListLongMap!1779)

(assert (=> b!146423 (= (+!185 lt!77023 lt!77031) (+!185 (+!185 lt!77039 lt!77031) lt!77034))))

(assert (=> b!146423 (= lt!77031 (tuple2!2765 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2861 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun lt!77027 () Unit!4626)

(declare-fun addCommutativeForDiffKeys!78 (ListLongMap!1779 (_ BitVec 64) V!3619 (_ BitVec 64) V!3619) Unit!4626)

(assert (=> b!146423 (= lt!77027 (addCommutativeForDiffKeys!78 lt!77039 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) lt!77025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2861 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun lt!77033 () ListLongMap!1779)

(assert (=> b!146423 (= lt!77033 lt!77023)))

(assert (=> b!146423 (= lt!77023 (+!185 lt!77039 lt!77034))))

(declare-fun lt!77032 () ListLongMap!1779)

(declare-fun lt!77028 () tuple2!2764)

(assert (=> b!146423 (= lt!77033 (+!185 lt!77032 lt!77028))))

(declare-fun lt!77037 () ListLongMap!1779)

(assert (=> b!146423 (= lt!77039 (+!185 lt!77037 lt!77028))))

(assert (=> b!146423 (= lt!77028 (tuple2!2765 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2861 (v!3358 (underlying!502 thiss!992)))))))

(assert (=> b!146423 (= lt!77032 (+!185 lt!77037 lt!77034))))

(assert (=> b!146423 (= lt!77034 (tuple2!2765 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) lt!77025))))

(declare-fun lt!77030 () Unit!4626)

(assert (=> b!146423 (= lt!77030 (addCommutativeForDiffKeys!78 lt!77037 (select (arr!2363 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) from!355) lt!77025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2861 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!153 (array!5003 array!5005 (_ BitVec 32) (_ BitVec 32) V!3619 V!3619 (_ BitVec 32) Int) ListLongMap!1779)

(assert (=> b!146423 (= lt!77037 (getCurrentListMapNoExtraKeys!153 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (_values!2999 (v!3358 (underlying!502 thiss!992))) (mask!7394 (v!3358 (underlying!502 thiss!992))) (extraKeys!2761 (v!3358 (underlying!502 thiss!992))) (zeroValue!2861 (v!3358 (underlying!502 thiss!992))) (minValue!2861 (v!3358 (underlying!502 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun b!146424 () Bool)

(assert (=> b!146424 (= e!95537 tp_is_empty!2979)))

(declare-fun b!146425 () Bool)

(declare-fun res!69656 () Bool)

(assert (=> b!146425 (=> (not res!69656) (not e!95542))))

(assert (=> b!146425 (= res!69656 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7394 newMap!16)) (_size!649 (v!3358 (underlying!502 thiss!992)))))))

(declare-fun b!146426 () Bool)

(declare-fun e!95541 () Bool)

(assert (=> b!146426 (= e!95541 (and e!95538 mapRes!5010))))

(declare-fun condMapEmpty!5010 () Bool)

(declare-fun mapDefault!5009 () ValueCell!1146)

(assert (=> b!146426 (= condMapEmpty!5010 (= (arr!2364 (_values!2999 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1146)) mapDefault!5009)))))

(declare-fun b!146427 () Bool)

(declare-fun e!95554 () Bool)

(declare-fun e!95544 () Bool)

(assert (=> b!146427 (= e!95554 (and e!95544 mapRes!5009))))

(declare-fun condMapEmpty!5009 () Bool)

(declare-fun mapDefault!5010 () ValueCell!1146)

(assert (=> b!146427 (= condMapEmpty!5009 (= (arr!2364 (_values!2999 (v!3358 (underlying!502 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1146)) mapDefault!5010)))))

(declare-fun b!146428 () Bool)

(declare-fun Unit!4629 () Unit!4626)

(assert (=> b!146428 (= e!95545 Unit!4629)))

(declare-fun array_inv!1485 (array!5003) Bool)

(declare-fun array_inv!1486 (array!5005) Bool)

(assert (=> b!146429 (= e!95549 (and tp!11878 tp_is_empty!2979 (array_inv!1485 (_keys!4785 (v!3358 (underlying!502 thiss!992)))) (array_inv!1486 (_values!2999 (v!3358 (underlying!502 thiss!992)))) e!95554))))

(declare-fun b!146430 () Bool)

(assert (=> b!146430 (= e!95542 e!95539)))

(declare-fun res!69659 () Bool)

(assert (=> b!146430 (=> (not res!69659) (not e!95539))))

(declare-fun lt!77022 () ListLongMap!1779)

(assert (=> b!146430 (= res!69659 (= lt!77022 lt!77035))))

(assert (=> b!146430 (= lt!77035 (map!1471 newMap!16))))

(assert (=> b!146430 (= lt!77022 (getCurrentListMap!574 (_keys!4785 (v!3358 (underlying!502 thiss!992))) (_values!2999 (v!3358 (underlying!502 thiss!992))) (mask!7394 (v!3358 (underlying!502 thiss!992))) (extraKeys!2761 (v!3358 (underlying!502 thiss!992))) (zeroValue!2861 (v!3358 (underlying!502 thiss!992))) (minValue!2861 (v!3358 (underlying!502 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))))))

(assert (=> b!146431 (= e!95546 (and tp!11879 tp_is_empty!2979 (array_inv!1485 (_keys!4785 newMap!16)) (array_inv!1486 (_values!2999 newMap!16)) e!95541))))

(declare-fun b!146432 () Bool)

(assert (=> b!146432 (= e!95553 e!95543)))

(declare-fun mapNonEmpty!5010 () Bool)

(declare-fun tp!11877 () Bool)

(assert (=> mapNonEmpty!5010 (= mapRes!5010 (and tp!11877 e!95548))))

(declare-fun mapKey!5010 () (_ BitVec 32))

(declare-fun mapValue!5010 () ValueCell!1146)

(declare-fun mapRest!5010 () (Array (_ BitVec 32) ValueCell!1146))

(assert (=> mapNonEmpty!5010 (= (arr!2364 (_values!2999 newMap!16)) (store mapRest!5010 mapKey!5010 mapValue!5010))))

(declare-fun b!146433 () Bool)

(assert (=> b!146433 (= e!95544 tp_is_empty!2979)))

(assert (= (and start!15210 res!69660) b!146415))

(assert (= (and b!146415 res!69657) b!146418))

(assert (= (and b!146418 res!69662) b!146425))

(assert (= (and b!146425 res!69656) b!146430))

(assert (= (and b!146430 res!69659) b!146422))

(assert (= (and b!146422 res!69663) b!146417))

(assert (= (and b!146417 c!27635) b!146419))

(assert (= (and b!146417 (not c!27635)) b!146428))

(assert (= (and b!146417 res!69661) b!146423))

(assert (= (and b!146423 (not res!69658)) b!146421))

(assert (= (and b!146427 condMapEmpty!5009) mapIsEmpty!5009))

(assert (= (and b!146427 (not condMapEmpty!5009)) mapNonEmpty!5009))

(get-info :version)

(assert (= (and mapNonEmpty!5009 ((_ is ValueCellFull!1146) mapValue!5009)) b!146424))

(assert (= (and b!146427 ((_ is ValueCellFull!1146) mapDefault!5010)) b!146433))

(assert (= b!146429 b!146427))

(assert (= b!146420 b!146429))

(assert (= b!146432 b!146420))

(assert (= start!15210 b!146432))

(assert (= (and b!146426 condMapEmpty!5010) mapIsEmpty!5010))

(assert (= (and b!146426 (not condMapEmpty!5010)) mapNonEmpty!5010))

(assert (= (and mapNonEmpty!5010 ((_ is ValueCellFull!1146) mapValue!5010)) b!146416))

(assert (= (and b!146426 ((_ is ValueCellFull!1146) mapDefault!5009)) b!146414))

(assert (= b!146431 b!146426))

(assert (= start!15210 b!146431))

(declare-fun b_lambda!6555 () Bool)

(assert (=> (not b_lambda!6555) (not b!146422)))

(declare-fun t!6486 () Bool)

(declare-fun tb!2669 () Bool)

(assert (=> (and b!146429 (= (defaultEntry!3016 (v!3358 (underlying!502 thiss!992))) (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))) t!6486) tb!2669))

(declare-fun result!4359 () Bool)

(assert (=> tb!2669 (= result!4359 tp_is_empty!2979)))

(assert (=> b!146422 t!6486))

(declare-fun b_and!9171 () Bool)

(assert (= b_and!9167 (and (=> t!6486 result!4359) b_and!9171)))

(declare-fun t!6488 () Bool)

(declare-fun tb!2671 () Bool)

(assert (=> (and b!146431 (= (defaultEntry!3016 newMap!16) (defaultEntry!3016 (v!3358 (underlying!502 thiss!992)))) t!6488) tb!2671))

(declare-fun result!4363 () Bool)

(assert (= result!4363 result!4359))

(assert (=> b!146422 t!6488))

(declare-fun b_and!9173 () Bool)

(assert (= b_and!9169 (and (=> t!6488 result!4363) b_and!9173)))

(declare-fun m!176183 () Bool)

(assert (=> b!146418 m!176183))

(declare-fun m!176185 () Bool)

(assert (=> b!146429 m!176185))

(declare-fun m!176187 () Bool)

(assert (=> b!146429 m!176187))

(declare-fun m!176189 () Bool)

(assert (=> b!146422 m!176189))

(declare-fun m!176191 () Bool)

(assert (=> b!146422 m!176191))

(declare-fun m!176193 () Bool)

(assert (=> b!146422 m!176193))

(assert (=> b!146422 m!176191))

(assert (=> b!146422 m!176193))

(declare-fun m!176195 () Bool)

(assert (=> b!146422 m!176195))

(declare-fun m!176197 () Bool)

(assert (=> start!15210 m!176197))

(declare-fun m!176199 () Bool)

(assert (=> b!146419 m!176199))

(declare-fun m!176201 () Bool)

(assert (=> b!146419 m!176201))

(assert (=> b!146419 m!176189))

(declare-fun m!176203 () Bool)

(assert (=> b!146419 m!176203))

(assert (=> b!146419 m!176189))

(assert (=> b!146419 m!176189))

(declare-fun m!176205 () Bool)

(assert (=> b!146419 m!176205))

(assert (=> b!146419 m!176189))

(declare-fun m!176207 () Bool)

(assert (=> b!146419 m!176207))

(declare-fun m!176209 () Bool)

(assert (=> b!146423 m!176209))

(declare-fun m!176211 () Bool)

(assert (=> b!146423 m!176211))

(declare-fun m!176213 () Bool)

(assert (=> b!146423 m!176213))

(declare-fun m!176215 () Bool)

(assert (=> b!146423 m!176215))

(declare-fun m!176217 () Bool)

(assert (=> b!146423 m!176217))

(declare-fun m!176219 () Bool)

(assert (=> b!146423 m!176219))

(assert (=> b!146423 m!176189))

(declare-fun m!176221 () Bool)

(assert (=> b!146423 m!176221))

(assert (=> b!146423 m!176189))

(declare-fun m!176223 () Bool)

(assert (=> b!146423 m!176223))

(declare-fun m!176225 () Bool)

(assert (=> b!146423 m!176225))

(assert (=> b!146423 m!176211))

(declare-fun m!176227 () Bool)

(assert (=> b!146423 m!176227))

(assert (=> b!146423 m!176189))

(declare-fun m!176229 () Bool)

(assert (=> b!146423 m!176229))

(declare-fun m!176231 () Bool)

(assert (=> b!146423 m!176231))

(assert (=> b!146417 m!176189))

(assert (=> b!146417 m!176189))

(declare-fun m!176233 () Bool)

(assert (=> b!146417 m!176233))

(assert (=> b!146417 m!176189))

(declare-fun m!176235 () Bool)

(assert (=> b!146417 m!176235))

(declare-fun m!176237 () Bool)

(assert (=> b!146431 m!176237))

(declare-fun m!176239 () Bool)

(assert (=> b!146431 m!176239))

(declare-fun m!176241 () Bool)

(assert (=> mapNonEmpty!5009 m!176241))

(declare-fun m!176243 () Bool)

(assert (=> b!146430 m!176243))

(declare-fun m!176245 () Bool)

(assert (=> b!146430 m!176245))

(declare-fun m!176247 () Bool)

(assert (=> mapNonEmpty!5010 m!176247))

(check-sat (not b!146431) (not b!146418) (not b!146417) b_and!9173 (not b!146430) (not b!146429) (not mapNonEmpty!5010) (not b_lambda!6555) (not b!146422) (not start!15210) (not b_next!3125) (not b_next!3127) b_and!9171 (not b!146423) (not mapNonEmpty!5009) (not b!146419) tp_is_empty!2979)
(check-sat b_and!9171 b_and!9173 (not b_next!3125) (not b_next!3127))
