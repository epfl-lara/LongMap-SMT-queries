; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75650 () Bool)

(assert start!75650)

(declare-fun b!889391 () Bool)

(declare-fun b_free!15621 () Bool)

(declare-fun b_next!15621 () Bool)

(assert (=> b!889391 (= b_free!15621 (not b_next!15621))))

(declare-fun tp!54832 () Bool)

(declare-fun b_and!25861 () Bool)

(assert (=> b!889391 (= tp!54832 b_and!25861)))

(declare-fun res!602756 () Bool)

(declare-fun e!495750 () Bool)

(assert (=> start!75650 (=> (not res!602756) (not e!495750))))

(declare-datatypes ((array!51878 0))(
  ( (array!51879 (arr!24945 (Array (_ BitVec 32) (_ BitVec 64))) (size!25389 (_ BitVec 32))) )
))
(declare-datatypes ((V!28897 0))(
  ( (V!28898 (val!9025 Int)) )
))
(declare-datatypes ((ValueCell!8493 0))(
  ( (ValueCellFull!8493 (v!11503 V!28897)) (EmptyCell!8493) )
))
(declare-datatypes ((array!51880 0))(
  ( (array!51881 (arr!24946 (Array (_ BitVec 32) ValueCell!8493)) (size!25390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4002 0))(
  ( (LongMapFixedSize!4003 (defaultEntry!5198 Int) (mask!25645 (_ BitVec 32)) (extraKeys!4892 (_ BitVec 32)) (zeroValue!4996 V!28897) (minValue!4996 V!28897) (_size!2056 (_ BitVec 32)) (_keys!9881 array!51878) (_values!5183 array!51880) (_vacant!2056 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4002)

(declare-fun valid!1557 (LongMapFixedSize!4002) Bool)

(assert (=> start!75650 (= res!602756 (valid!1557 thiss!1181))))

(assert (=> start!75650 e!495750))

(declare-fun e!495749 () Bool)

(assert (=> start!75650 e!495749))

(assert (=> start!75650 true))

(declare-fun b!889390 () Bool)

(declare-fun res!602757 () Bool)

(declare-fun e!495753 () Bool)

(assert (=> b!889390 (=> (not res!602757) (not e!495753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51878 (_ BitVec 32)) Bool)

(assert (=> b!889390 (= res!602757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9881 thiss!1181) (mask!25645 thiss!1181)))))

(declare-fun mapIsEmpty!28478 () Bool)

(declare-fun mapRes!28478 () Bool)

(assert (=> mapIsEmpty!28478 mapRes!28478))

(declare-fun tp_is_empty!17949 () Bool)

(declare-fun e!495747 () Bool)

(declare-fun array_inv!19622 (array!51878) Bool)

(declare-fun array_inv!19623 (array!51880) Bool)

(assert (=> b!889391 (= e!495749 (and tp!54832 tp_is_empty!17949 (array_inv!19622 (_keys!9881 thiss!1181)) (array_inv!19623 (_values!5183 thiss!1181)) e!495747))))

(declare-fun b!889392 () Bool)

(declare-fun res!602758 () Bool)

(assert (=> b!889392 (=> (not res!602758) (not e!495753))))

(assert (=> b!889392 (= res!602758 (and (= (size!25390 (_values!5183 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25645 thiss!1181))) (= (size!25389 (_keys!9881 thiss!1181)) (size!25390 (_values!5183 thiss!1181))) (bvsge (mask!25645 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4892 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4892 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889393 () Bool)

(declare-fun e!495752 () Bool)

(assert (=> b!889393 (= e!495747 (and e!495752 mapRes!28478))))

(declare-fun condMapEmpty!28478 () Bool)

(declare-fun mapDefault!28478 () ValueCell!8493)

(assert (=> b!889393 (= condMapEmpty!28478 (= (arr!24946 (_values!5183 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8493)) mapDefault!28478)))))

(declare-fun b!889394 () Bool)

(assert (=> b!889394 (= e!495753 false)))

(declare-fun lt!402022 () Bool)

(declare-datatypes ((List!17700 0))(
  ( (Nil!17697) (Cons!17696 (h!18827 (_ BitVec 64)) (t!24999 List!17700)) )
))
(declare-fun arrayNoDuplicates!0 (array!51878 (_ BitVec 32) List!17700) Bool)

(assert (=> b!889394 (= lt!402022 (arrayNoDuplicates!0 (_keys!9881 thiss!1181) #b00000000000000000000000000000000 Nil!17697))))

(declare-fun mapNonEmpty!28478 () Bool)

(declare-fun tp!54831 () Bool)

(declare-fun e!495748 () Bool)

(assert (=> mapNonEmpty!28478 (= mapRes!28478 (and tp!54831 e!495748))))

(declare-fun mapRest!28478 () (Array (_ BitVec 32) ValueCell!8493))

(declare-fun mapKey!28478 () (_ BitVec 32))

(declare-fun mapValue!28478 () ValueCell!8493)

(assert (=> mapNonEmpty!28478 (= (arr!24946 (_values!5183 thiss!1181)) (store mapRest!28478 mapKey!28478 mapValue!28478))))

(declare-fun b!889395 () Bool)

(declare-fun res!602755 () Bool)

(assert (=> b!889395 (=> (not res!602755) (not e!495750))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889395 (= res!602755 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889396 () Bool)

(assert (=> b!889396 (= e!495748 tp_is_empty!17949)))

(declare-fun b!889397 () Bool)

(assert (=> b!889397 (= e!495750 e!495753)))

(declare-fun res!602759 () Bool)

(assert (=> b!889397 (=> (not res!602759) (not e!495753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889397 (= res!602759 (validMask!0 (mask!25645 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8772 0))(
  ( (MissingZero!8772 (index!37459 (_ BitVec 32))) (Found!8772 (index!37460 (_ BitVec 32))) (Intermediate!8772 (undefined!9584 Bool) (index!37461 (_ BitVec 32)) (x!75508 (_ BitVec 32))) (Undefined!8772) (MissingVacant!8772 (index!37462 (_ BitVec 32))) )
))
(declare-fun lt!402021 () SeekEntryResult!8772)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51878 (_ BitVec 32)) SeekEntryResult!8772)

(assert (=> b!889397 (= lt!402021 (seekEntry!0 key!785 (_keys!9881 thiss!1181) (mask!25645 thiss!1181)))))

(declare-fun b!889398 () Bool)

(assert (=> b!889398 (= e!495752 tp_is_empty!17949)))

(assert (= (and start!75650 res!602756) b!889395))

(assert (= (and b!889395 res!602755) b!889397))

(assert (= (and b!889397 res!602759) b!889392))

(assert (= (and b!889392 res!602758) b!889390))

(assert (= (and b!889390 res!602757) b!889394))

(assert (= (and b!889393 condMapEmpty!28478) mapIsEmpty!28478))

(assert (= (and b!889393 (not condMapEmpty!28478)) mapNonEmpty!28478))

(get-info :version)

(assert (= (and mapNonEmpty!28478 ((_ is ValueCellFull!8493) mapValue!28478)) b!889396))

(assert (= (and b!889393 ((_ is ValueCellFull!8493) mapDefault!28478)) b!889398))

(assert (= b!889391 b!889393))

(assert (= start!75650 b!889391))

(declare-fun m!828325 () Bool)

(assert (=> mapNonEmpty!28478 m!828325))

(declare-fun m!828327 () Bool)

(assert (=> b!889391 m!828327))

(declare-fun m!828329 () Bool)

(assert (=> b!889391 m!828329))

(declare-fun m!828331 () Bool)

(assert (=> b!889390 m!828331))

(declare-fun m!828333 () Bool)

(assert (=> b!889394 m!828333))

(declare-fun m!828335 () Bool)

(assert (=> start!75650 m!828335))

(declare-fun m!828337 () Bool)

(assert (=> b!889397 m!828337))

(declare-fun m!828339 () Bool)

(assert (=> b!889397 m!828339))

(check-sat (not mapNonEmpty!28478) (not b!889390) (not b_next!15621) (not b!889397) (not start!75650) b_and!25861 tp_is_empty!17949 (not b!889394) (not b!889391))
(check-sat b_and!25861 (not b_next!15621))
