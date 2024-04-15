; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80242 () Bool)

(assert start!80242)

(declare-fun b!942469 () Bool)

(declare-fun b_free!17959 () Bool)

(declare-fun b_next!17959 () Bool)

(assert (=> b!942469 (= b_free!17959 (not b_next!17959))))

(declare-fun tp!62384 () Bool)

(declare-fun b_and!29345 () Bool)

(assert (=> b!942469 (= tp!62384 b_and!29345)))

(declare-fun b!942467 () Bool)

(declare-fun e!529895 () Bool)

(declare-fun tp_is_empty!20467 () Bool)

(assert (=> b!942467 (= e!529895 tp_is_empty!20467)))

(declare-fun b!942468 () Bool)

(declare-fun res!633352 () Bool)

(declare-fun e!529896 () Bool)

(assert (=> b!942468 (=> (not res!633352) (not e!529896))))

(declare-datatypes ((V!32255 0))(
  ( (V!32256 (val!10284 Int)) )
))
(declare-datatypes ((ValueCell!9752 0))(
  ( (ValueCellFull!9752 (v!12814 V!32255)) (EmptyCell!9752) )
))
(declare-datatypes ((array!56865 0))(
  ( (array!56866 (arr!27359 (Array (_ BitVec 32) ValueCell!9752)) (size!27826 (_ BitVec 32))) )
))
(declare-datatypes ((array!56867 0))(
  ( (array!56868 (arr!27360 (Array (_ BitVec 32) (_ BitVec 64))) (size!27827 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4654 0))(
  ( (LongMapFixedSize!4655 (defaultEntry!5618 Int) (mask!27225 (_ BitVec 32)) (extraKeys!5350 (_ BitVec 32)) (zeroValue!5454 V!32255) (minValue!5454 V!32255) (_size!2382 (_ BitVec 32)) (_keys!10487 array!56867) (_values!5641 array!56865) (_vacant!2382 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4654)

(assert (=> b!942468 (= res!633352 (and (= (size!27826 (_values!5641 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27225 thiss!1141))) (= (size!27827 (_keys!10487 thiss!1141)) (size!27826 (_values!5641 thiss!1141))) (bvsge (mask!27225 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5350 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5350 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun e!529893 () Bool)

(declare-fun e!529898 () Bool)

(declare-fun array_inv!21326 (array!56867) Bool)

(declare-fun array_inv!21327 (array!56865) Bool)

(assert (=> b!942469 (= e!529893 (and tp!62384 tp_is_empty!20467 (array_inv!21326 (_keys!10487 thiss!1141)) (array_inv!21327 (_values!5641 thiss!1141)) e!529898))))

(declare-fun b!942470 () Bool)

(declare-fun e!529897 () Bool)

(assert (=> b!942470 (= e!529897 tp_is_empty!20467)))

(declare-fun b!942471 () Bool)

(declare-fun res!633348 () Bool)

(assert (=> b!942471 (=> (not res!633348) (not e!529896))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942471 (= res!633348 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32522 () Bool)

(declare-fun mapRes!32522 () Bool)

(assert (=> mapIsEmpty!32522 mapRes!32522))

(declare-fun mapNonEmpty!32522 () Bool)

(declare-fun tp!62383 () Bool)

(assert (=> mapNonEmpty!32522 (= mapRes!32522 (and tp!62383 e!529895))))

(declare-fun mapRest!32522 () (Array (_ BitVec 32) ValueCell!9752))

(declare-fun mapValue!32522 () ValueCell!9752)

(declare-fun mapKey!32522 () (_ BitVec 32))

(assert (=> mapNonEmpty!32522 (= (arr!27359 (_values!5641 thiss!1141)) (store mapRest!32522 mapKey!32522 mapValue!32522))))

(declare-fun res!633354 () Bool)

(assert (=> start!80242 (=> (not res!633354) (not e!529896))))

(declare-fun valid!1791 (LongMapFixedSize!4654) Bool)

(assert (=> start!80242 (= res!633354 (valid!1791 thiss!1141))))

(assert (=> start!80242 e!529896))

(assert (=> start!80242 e!529893))

(assert (=> start!80242 true))

(declare-fun b!942472 () Bool)

(declare-fun res!633353 () Bool)

(assert (=> b!942472 (=> (not res!633353) (not e!529896))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9037 0))(
  ( (MissingZero!9037 (index!38519 (_ BitVec 32))) (Found!9037 (index!38520 (_ BitVec 32))) (Intermediate!9037 (undefined!9849 Bool) (index!38521 (_ BitVec 32)) (x!80945 (_ BitVec 32))) (Undefined!9037) (MissingVacant!9037 (index!38522 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56867 (_ BitVec 32)) SeekEntryResult!9037)

(assert (=> b!942472 (= res!633353 (not ((_ is Found!9037) (seekEntry!0 key!756 (_keys!10487 thiss!1141) (mask!27225 thiss!1141)))))))

(declare-fun b!942473 () Bool)

(declare-fun res!633349 () Bool)

(assert (=> b!942473 (=> (not res!633349) (not e!529896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56867 (_ BitVec 32)) Bool)

(assert (=> b!942473 (= res!633349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10487 thiss!1141) (mask!27225 thiss!1141)))))

(declare-fun b!942474 () Bool)

(declare-fun res!633351 () Bool)

(assert (=> b!942474 (=> (not res!633351) (not e!529896))))

(declare-datatypes ((tuple2!13462 0))(
  ( (tuple2!13463 (_1!6742 (_ BitVec 64)) (_2!6742 V!32255)) )
))
(declare-datatypes ((List!19232 0))(
  ( (Nil!19229) (Cons!19228 (h!20378 tuple2!13462) (t!27538 List!19232)) )
))
(declare-datatypes ((ListLongMap!12149 0))(
  ( (ListLongMap!12150 (toList!6090 List!19232)) )
))
(declare-fun contains!5103 (ListLongMap!12149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3253 (array!56867 array!56865 (_ BitVec 32) (_ BitVec 32) V!32255 V!32255 (_ BitVec 32) Int) ListLongMap!12149)

(assert (=> b!942474 (= res!633351 (contains!5103 (getCurrentListMap!3253 (_keys!10487 thiss!1141) (_values!5641 thiss!1141) (mask!27225 thiss!1141) (extraKeys!5350 thiss!1141) (zeroValue!5454 thiss!1141) (minValue!5454 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5618 thiss!1141)) key!756))))

(declare-fun b!942475 () Bool)

(assert (=> b!942475 (= e!529896 false)))

(declare-fun lt!424952 () Bool)

(declare-datatypes ((List!19233 0))(
  ( (Nil!19230) (Cons!19229 (h!20379 (_ BitVec 64)) (t!27539 List!19233)) )
))
(declare-fun arrayNoDuplicates!0 (array!56867 (_ BitVec 32) List!19233) Bool)

(assert (=> b!942475 (= lt!424952 (arrayNoDuplicates!0 (_keys!10487 thiss!1141) #b00000000000000000000000000000000 Nil!19230))))

(declare-fun b!942476 () Bool)

(assert (=> b!942476 (= e!529898 (and e!529897 mapRes!32522))))

(declare-fun condMapEmpty!32522 () Bool)

(declare-fun mapDefault!32522 () ValueCell!9752)

(assert (=> b!942476 (= condMapEmpty!32522 (= (arr!27359 (_values!5641 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9752)) mapDefault!32522)))))

(declare-fun b!942477 () Bool)

(declare-fun res!633350 () Bool)

(assert (=> b!942477 (=> (not res!633350) (not e!529896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942477 (= res!633350 (validMask!0 (mask!27225 thiss!1141)))))

(assert (= (and start!80242 res!633354) b!942471))

(assert (= (and b!942471 res!633348) b!942472))

(assert (= (and b!942472 res!633353) b!942474))

(assert (= (and b!942474 res!633351) b!942477))

(assert (= (and b!942477 res!633350) b!942468))

(assert (= (and b!942468 res!633352) b!942473))

(assert (= (and b!942473 res!633349) b!942475))

(assert (= (and b!942476 condMapEmpty!32522) mapIsEmpty!32522))

(assert (= (and b!942476 (not condMapEmpty!32522)) mapNonEmpty!32522))

(assert (= (and mapNonEmpty!32522 ((_ is ValueCellFull!9752) mapValue!32522)) b!942467))

(assert (= (and b!942476 ((_ is ValueCellFull!9752) mapDefault!32522)) b!942470))

(assert (= b!942469 b!942476))

(assert (= start!80242 b!942469))

(declare-fun m!876401 () Bool)

(assert (=> start!80242 m!876401))

(declare-fun m!876403 () Bool)

(assert (=> b!942474 m!876403))

(assert (=> b!942474 m!876403))

(declare-fun m!876405 () Bool)

(assert (=> b!942474 m!876405))

(declare-fun m!876407 () Bool)

(assert (=> b!942477 m!876407))

(declare-fun m!876409 () Bool)

(assert (=> b!942469 m!876409))

(declare-fun m!876411 () Bool)

(assert (=> b!942469 m!876411))

(declare-fun m!876413 () Bool)

(assert (=> b!942475 m!876413))

(declare-fun m!876415 () Bool)

(assert (=> b!942473 m!876415))

(declare-fun m!876417 () Bool)

(assert (=> b!942472 m!876417))

(declare-fun m!876419 () Bool)

(assert (=> mapNonEmpty!32522 m!876419))

(check-sat (not b!942472) (not b!942477) (not b!942473) (not mapNonEmpty!32522) tp_is_empty!20467 b_and!29345 (not start!80242) (not b!942474) (not b!942475) (not b_next!17959) (not b!942469))
(check-sat b_and!29345 (not b_next!17959))
