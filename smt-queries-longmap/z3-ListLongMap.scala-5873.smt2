; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75770 () Bool)

(assert start!75770)

(declare-fun b!891095 () Bool)

(declare-fun b_free!15741 () Bool)

(declare-fun b_next!15741 () Bool)

(assert (=> b!891095 (= b_free!15741 (not b_next!15741))))

(declare-fun tp!55192 () Bool)

(declare-fun b_and!25981 () Bool)

(assert (=> b!891095 (= tp!55192 b_and!25981)))

(declare-fun b!891092 () Bool)

(declare-fun e!497165 () Bool)

(declare-fun e!497167 () Bool)

(declare-fun mapRes!28658 () Bool)

(assert (=> b!891092 (= e!497165 (and e!497167 mapRes!28658))))

(declare-fun condMapEmpty!28658 () Bool)

(declare-datatypes ((array!52118 0))(
  ( (array!52119 (arr!25065 (Array (_ BitVec 32) (_ BitVec 64))) (size!25509 (_ BitVec 32))) )
))
(declare-datatypes ((V!29057 0))(
  ( (V!29058 (val!9085 Int)) )
))
(declare-datatypes ((ValueCell!8553 0))(
  ( (ValueCellFull!8553 (v!11563 V!29057)) (EmptyCell!8553) )
))
(declare-datatypes ((array!52120 0))(
  ( (array!52121 (arr!25066 (Array (_ BitVec 32) ValueCell!8553)) (size!25510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4122 0))(
  ( (LongMapFixedSize!4123 (defaultEntry!5258 Int) (mask!25745 (_ BitVec 32)) (extraKeys!4952 (_ BitVec 32)) (zeroValue!5056 V!29057) (minValue!5056 V!29057) (_size!2116 (_ BitVec 32)) (_keys!9941 array!52118) (_values!5243 array!52120) (_vacant!2116 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4122)

(declare-fun mapDefault!28658 () ValueCell!8553)

(assert (=> b!891092 (= condMapEmpty!28658 (= (arr!25066 (_values!5243 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8553)) mapDefault!28658)))))

(declare-fun b!891093 () Bool)

(declare-fun e!497163 () Bool)

(assert (=> b!891093 (= e!497163 true)))

(declare-fun lt!402535 () Bool)

(declare-datatypes ((List!17733 0))(
  ( (Nil!17730) (Cons!17729 (h!18860 (_ BitVec 64)) (t!25032 List!17733)) )
))
(declare-fun arrayNoDuplicates!0 (array!52118 (_ BitVec 32) List!17733) Bool)

(assert (=> b!891093 (= lt!402535 (arrayNoDuplicates!0 (_keys!9941 thiss!1181) #b00000000000000000000000000000000 Nil!17730))))

(declare-fun b!891094 () Bool)

(declare-fun e!497164 () Bool)

(declare-fun e!497168 () Bool)

(assert (=> b!891094 (= e!497164 (not e!497168))))

(declare-fun res!603743 () Bool)

(assert (=> b!891094 (=> res!603743 e!497168)))

(declare-datatypes ((SeekEntryResult!8816 0))(
  ( (MissingZero!8816 (index!37635 (_ BitVec 32))) (Found!8816 (index!37636 (_ BitVec 32))) (Intermediate!8816 (undefined!9628 Bool) (index!37637 (_ BitVec 32)) (x!75712 (_ BitVec 32))) (Undefined!8816) (MissingVacant!8816 (index!37638 (_ BitVec 32))) )
))
(declare-fun lt!402538 () SeekEntryResult!8816)

(get-info :version)

(assert (=> b!891094 (= res!603743 (not ((_ is Found!8816) lt!402538)))))

(declare-fun e!497169 () Bool)

(assert (=> b!891094 e!497169))

(declare-fun res!603737 () Bool)

(assert (=> b!891094 (=> res!603737 e!497169)))

(assert (=> b!891094 (= res!603737 (not ((_ is Found!8816) lt!402538)))))

(declare-datatypes ((Unit!30328 0))(
  ( (Unit!30329) )
))
(declare-fun lt!402537 () Unit!30328)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!22 (array!52118 array!52120 (_ BitVec 32) (_ BitVec 32) V!29057 V!29057 (_ BitVec 64)) Unit!30328)

(assert (=> b!891094 (= lt!402537 (lemmaSeekEntryGivesInRangeIndex!22 (_keys!9941 thiss!1181) (_values!5243 thiss!1181) (mask!25745 thiss!1181) (extraKeys!4952 thiss!1181) (zeroValue!5056 thiss!1181) (minValue!5056 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52118 (_ BitVec 32)) SeekEntryResult!8816)

(assert (=> b!891094 (= lt!402538 (seekEntry!0 key!785 (_keys!9941 thiss!1181) (mask!25745 thiss!1181)))))

(declare-fun e!497162 () Bool)

(declare-fun tp_is_empty!18069 () Bool)

(declare-fun array_inv!19700 (array!52118) Bool)

(declare-fun array_inv!19701 (array!52120) Bool)

(assert (=> b!891095 (= e!497162 (and tp!55192 tp_is_empty!18069 (array_inv!19700 (_keys!9941 thiss!1181)) (array_inv!19701 (_values!5243 thiss!1181)) e!497165))))

(declare-fun b!891096 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891096 (= e!497169 (inRange!0 (index!37636 lt!402538) (mask!25745 thiss!1181)))))

(declare-fun b!891097 () Bool)

(declare-fun res!603738 () Bool)

(assert (=> b!891097 (=> res!603738 e!497163)))

(assert (=> b!891097 (= res!603738 (or (not (= (size!25510 (_values!5243 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25745 thiss!1181)))) (not (= (size!25509 (_keys!9941 thiss!1181)) (size!25510 (_values!5243 thiss!1181)))) (bvslt (mask!25745 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4952 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4952 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28658 () Bool)

(declare-fun tp!55191 () Bool)

(declare-fun e!497161 () Bool)

(assert (=> mapNonEmpty!28658 (= mapRes!28658 (and tp!55191 e!497161))))

(declare-fun mapKey!28658 () (_ BitVec 32))

(declare-fun mapValue!28658 () ValueCell!8553)

(declare-fun mapRest!28658 () (Array (_ BitVec 32) ValueCell!8553))

(assert (=> mapNonEmpty!28658 (= (arr!25066 (_values!5243 thiss!1181)) (store mapRest!28658 mapKey!28658 mapValue!28658))))

(declare-fun b!891098 () Bool)

(assert (=> b!891098 (= e!497161 tp_is_empty!18069)))

(declare-fun b!891099 () Bool)

(assert (=> b!891099 (= e!497168 e!497163)))

(declare-fun res!603741 () Bool)

(assert (=> b!891099 (=> res!603741 e!497163)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891099 (= res!603741 (not (validMask!0 (mask!25745 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891099 (arrayContainsKey!0 (_keys!9941 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402536 () Unit!30328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52118 (_ BitVec 64) (_ BitVec 32)) Unit!30328)

(assert (=> b!891099 (= lt!402536 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9941 thiss!1181) key!785 (index!37636 lt!402538)))))

(declare-fun b!891100 () Bool)

(declare-fun res!603740 () Bool)

(assert (=> b!891100 (=> res!603740 e!497163)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52118 (_ BitVec 32)) Bool)

(assert (=> b!891100 (= res!603740 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9941 thiss!1181) (mask!25745 thiss!1181))))))

(declare-fun res!603742 () Bool)

(assert (=> start!75770 (=> (not res!603742) (not e!497164))))

(declare-fun valid!1600 (LongMapFixedSize!4122) Bool)

(assert (=> start!75770 (= res!603742 (valid!1600 thiss!1181))))

(assert (=> start!75770 e!497164))

(assert (=> start!75770 e!497162))

(assert (=> start!75770 true))

(declare-fun mapIsEmpty!28658 () Bool)

(assert (=> mapIsEmpty!28658 mapRes!28658))

(declare-fun b!891101 () Bool)

(assert (=> b!891101 (= e!497167 tp_is_empty!18069)))

(declare-fun b!891102 () Bool)

(declare-fun res!603739 () Bool)

(assert (=> b!891102 (=> (not res!603739) (not e!497164))))

(assert (=> b!891102 (= res!603739 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75770 res!603742) b!891102))

(assert (= (and b!891102 res!603739) b!891094))

(assert (= (and b!891094 (not res!603737)) b!891096))

(assert (= (and b!891094 (not res!603743)) b!891099))

(assert (= (and b!891099 (not res!603741)) b!891097))

(assert (= (and b!891097 (not res!603738)) b!891100))

(assert (= (and b!891100 (not res!603740)) b!891093))

(assert (= (and b!891092 condMapEmpty!28658) mapIsEmpty!28658))

(assert (= (and b!891092 (not condMapEmpty!28658)) mapNonEmpty!28658))

(assert (= (and mapNonEmpty!28658 ((_ is ValueCellFull!8553) mapValue!28658)) b!891098))

(assert (= (and b!891092 ((_ is ValueCellFull!8553) mapDefault!28658)) b!891101))

(assert (= b!891095 b!891092))

(assert (= start!75770 b!891095))

(declare-fun m!829461 () Bool)

(assert (=> b!891100 m!829461))

(declare-fun m!829463 () Bool)

(assert (=> start!75770 m!829463))

(declare-fun m!829465 () Bool)

(assert (=> b!891093 m!829465))

(declare-fun m!829467 () Bool)

(assert (=> mapNonEmpty!28658 m!829467))

(declare-fun m!829469 () Bool)

(assert (=> b!891099 m!829469))

(declare-fun m!829471 () Bool)

(assert (=> b!891099 m!829471))

(declare-fun m!829473 () Bool)

(assert (=> b!891099 m!829473))

(declare-fun m!829475 () Bool)

(assert (=> b!891094 m!829475))

(declare-fun m!829477 () Bool)

(assert (=> b!891094 m!829477))

(declare-fun m!829479 () Bool)

(assert (=> b!891095 m!829479))

(declare-fun m!829481 () Bool)

(assert (=> b!891095 m!829481))

(declare-fun m!829483 () Bool)

(assert (=> b!891096 m!829483))

(check-sat (not b!891095) (not start!75770) (not b_next!15741) tp_is_empty!18069 (not b!891099) (not b!891100) (not b!891094) (not b!891096) (not mapNonEmpty!28658) b_and!25981 (not b!891093))
(check-sat b_and!25981 (not b_next!15741))
