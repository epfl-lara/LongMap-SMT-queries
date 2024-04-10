; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90808 () Bool)

(assert start!90808)

(declare-fun b!1038049 () Bool)

(declare-fun b_free!20925 () Bool)

(declare-fun b_next!20925 () Bool)

(assert (=> b!1038049 (= b_free!20925 (not b_next!20925))))

(declare-fun tp!73933 () Bool)

(declare-fun b_and!33457 () Bool)

(assert (=> b!1038049 (= tp!73933 b_and!33457)))

(declare-fun res!692500 () Bool)

(declare-fun e!587295 () Bool)

(assert (=> start!90808 (=> (not res!692500) (not e!587295))))

(declare-datatypes ((V!37733 0))(
  ( (V!37734 (val!12373 Int)) )
))
(declare-datatypes ((ValueCell!11619 0))(
  ( (ValueCellFull!11619 (v!14958 V!37733)) (EmptyCell!11619) )
))
(declare-datatypes ((array!65402 0))(
  ( (array!65403 (arr!31479 (Array (_ BitVec 32) (_ BitVec 64))) (size!32009 (_ BitVec 32))) )
))
(declare-datatypes ((array!65404 0))(
  ( (array!65405 (arr!31480 (Array (_ BitVec 32) ValueCell!11619)) (size!32010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5832 0))(
  ( (LongMapFixedSize!5833 (defaultEntry!6298 Int) (mask!30229 (_ BitVec 32)) (extraKeys!6026 (_ BitVec 32)) (zeroValue!6132 V!37733) (minValue!6132 V!37733) (_size!2971 (_ BitVec 32)) (_keys!11498 array!65402) (_values!6321 array!65404) (_vacant!2971 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5832)

(declare-fun valid!2197 (LongMapFixedSize!5832) Bool)

(assert (=> start!90808 (= res!692500 (valid!2197 thiss!1427))))

(assert (=> start!90808 e!587295))

(declare-fun e!587299 () Bool)

(assert (=> start!90808 e!587299))

(assert (=> start!90808 true))

(declare-fun mapIsEmpty!38508 () Bool)

(declare-fun mapRes!38508 () Bool)

(assert (=> mapIsEmpty!38508 mapRes!38508))

(declare-fun b!1038041 () Bool)

(declare-fun res!692496 () Bool)

(declare-fun e!587293 () Bool)

(assert (=> b!1038041 (=> res!692496 e!587293)))

(declare-datatypes ((List!21931 0))(
  ( (Nil!21928) (Cons!21927 (h!23130 (_ BitVec 64)) (t!31145 List!21931)) )
))
(declare-fun contains!6032 (List!21931 (_ BitVec 64)) Bool)

(assert (=> b!1038041 (= res!692496 (contains!6032 Nil!21928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038042 () Bool)

(declare-fun res!692494 () Bool)

(assert (=> b!1038042 (=> res!692494 e!587293)))

(assert (=> b!1038042 (= res!692494 (contains!6032 Nil!21928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038043 () Bool)

(declare-fun res!692497 () Bool)

(assert (=> b!1038043 (=> (not res!692497) (not e!587295))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038043 (= res!692497 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38508 () Bool)

(declare-fun tp!73932 () Bool)

(declare-fun e!587297 () Bool)

(assert (=> mapNonEmpty!38508 (= mapRes!38508 (and tp!73932 e!587297))))

(declare-fun mapValue!38508 () ValueCell!11619)

(declare-fun mapRest!38508 () (Array (_ BitVec 32) ValueCell!11619))

(declare-fun mapKey!38508 () (_ BitVec 32))

(assert (=> mapNonEmpty!38508 (= (arr!31480 (_values!6321 thiss!1427)) (store mapRest!38508 mapKey!38508 mapValue!38508))))

(declare-fun b!1038044 () Bool)

(declare-fun e!587298 () Bool)

(declare-fun tp_is_empty!24645 () Bool)

(assert (=> b!1038044 (= e!587298 tp_is_empty!24645)))

(declare-fun b!1038045 () Bool)

(declare-fun res!692498 () Bool)

(assert (=> b!1038045 (=> res!692498 e!587293)))

(declare-fun noDuplicate!1480 (List!21931) Bool)

(assert (=> b!1038045 (= res!692498 (not (noDuplicate!1480 Nil!21928)))))

(declare-fun b!1038046 () Bool)

(assert (=> b!1038046 (= e!587293 true)))

(declare-fun lt!457642 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65402 (_ BitVec 32) List!21931) Bool)

(assert (=> b!1038046 (= lt!457642 (arrayNoDuplicates!0 (_keys!11498 thiss!1427) #b00000000000000000000000000000000 Nil!21928))))

(declare-fun b!1038047 () Bool)

(declare-fun e!587294 () Bool)

(assert (=> b!1038047 (= e!587294 (not e!587293))))

(declare-fun res!692499 () Bool)

(assert (=> b!1038047 (=> res!692499 e!587293)))

(assert (=> b!1038047 (= res!692499 (or (bvsge (size!32009 (_keys!11498 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32009 (_keys!11498 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9765 0))(
  ( (MissingZero!9765 (index!41431 (_ BitVec 32))) (Found!9765 (index!41432 (_ BitVec 32))) (Intermediate!9765 (undefined!10577 Bool) (index!41433 (_ BitVec 32)) (x!92620 (_ BitVec 32))) (Undefined!9765) (MissingVacant!9765 (index!41434 (_ BitVec 32))) )
))
(declare-fun lt!457641 () SeekEntryResult!9765)

(declare-fun arrayCountValidKeys!0 (array!65402 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038047 (= (arrayCountValidKeys!0 (array!65403 (store (arr!31479 (_keys!11498 thiss!1427)) (index!41432 lt!457641) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32009 (_keys!11498 thiss!1427))) #b00000000000000000000000000000000 (size!32009 (_keys!11498 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11498 thiss!1427) #b00000000000000000000000000000000 (size!32009 (_keys!11498 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33969 0))(
  ( (Unit!33970) )
))
(declare-fun lt!457643 () Unit!33969)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65402 (_ BitVec 32) (_ BitVec 64)) Unit!33969)

(assert (=> b!1038047 (= lt!457643 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11498 thiss!1427) (index!41432 lt!457641) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038048 () Bool)

(assert (=> b!1038048 (= e!587297 tp_is_empty!24645)))

(declare-fun e!587292 () Bool)

(declare-fun array_inv!24343 (array!65402) Bool)

(declare-fun array_inv!24344 (array!65404) Bool)

(assert (=> b!1038049 (= e!587299 (and tp!73933 tp_is_empty!24645 (array_inv!24343 (_keys!11498 thiss!1427)) (array_inv!24344 (_values!6321 thiss!1427)) e!587292))))

(declare-fun b!1038050 () Bool)

(assert (=> b!1038050 (= e!587292 (and e!587298 mapRes!38508))))

(declare-fun condMapEmpty!38508 () Bool)

(declare-fun mapDefault!38508 () ValueCell!11619)

(assert (=> b!1038050 (= condMapEmpty!38508 (= (arr!31480 (_values!6321 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11619)) mapDefault!38508)))))

(declare-fun b!1038051 () Bool)

(assert (=> b!1038051 (= e!587295 e!587294)))

(declare-fun res!692495 () Bool)

(assert (=> b!1038051 (=> (not res!692495) (not e!587294))))

(get-info :version)

(assert (=> b!1038051 (= res!692495 ((_ is Found!9765) lt!457641))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65402 (_ BitVec 32)) SeekEntryResult!9765)

(assert (=> b!1038051 (= lt!457641 (seekEntry!0 key!909 (_keys!11498 thiss!1427) (mask!30229 thiss!1427)))))

(assert (= (and start!90808 res!692500) b!1038043))

(assert (= (and b!1038043 res!692497) b!1038051))

(assert (= (and b!1038051 res!692495) b!1038047))

(assert (= (and b!1038047 (not res!692499)) b!1038045))

(assert (= (and b!1038045 (not res!692498)) b!1038042))

(assert (= (and b!1038042 (not res!692494)) b!1038041))

(assert (= (and b!1038041 (not res!692496)) b!1038046))

(assert (= (and b!1038050 condMapEmpty!38508) mapIsEmpty!38508))

(assert (= (and b!1038050 (not condMapEmpty!38508)) mapNonEmpty!38508))

(assert (= (and mapNonEmpty!38508 ((_ is ValueCellFull!11619) mapValue!38508)) b!1038048))

(assert (= (and b!1038050 ((_ is ValueCellFull!11619) mapDefault!38508)) b!1038044))

(assert (= b!1038049 b!1038050))

(assert (= start!90808 b!1038049))

(declare-fun m!958085 () Bool)

(assert (=> b!1038041 m!958085))

(declare-fun m!958087 () Bool)

(assert (=> mapNonEmpty!38508 m!958087))

(declare-fun m!958089 () Bool)

(assert (=> b!1038047 m!958089))

(declare-fun m!958091 () Bool)

(assert (=> b!1038047 m!958091))

(declare-fun m!958093 () Bool)

(assert (=> b!1038047 m!958093))

(declare-fun m!958095 () Bool)

(assert (=> b!1038047 m!958095))

(declare-fun m!958097 () Bool)

(assert (=> start!90808 m!958097))

(declare-fun m!958099 () Bool)

(assert (=> b!1038049 m!958099))

(declare-fun m!958101 () Bool)

(assert (=> b!1038049 m!958101))

(declare-fun m!958103 () Bool)

(assert (=> b!1038046 m!958103))

(declare-fun m!958105 () Bool)

(assert (=> b!1038051 m!958105))

(declare-fun m!958107 () Bool)

(assert (=> b!1038042 m!958107))

(declare-fun m!958109 () Bool)

(assert (=> b!1038045 m!958109))

(check-sat (not b!1038041) (not b!1038046) (not b!1038049) tp_is_empty!24645 (not b!1038042) (not b!1038045) (not start!90808) (not b_next!20925) (not b!1038047) b_and!33457 (not mapNonEmpty!38508) (not b!1038051))
(check-sat b_and!33457 (not b_next!20925))
