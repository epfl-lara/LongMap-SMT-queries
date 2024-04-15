; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77204 () Bool)

(assert start!77204)

(declare-fun b!900754 () Bool)

(declare-fun b_free!16063 () Bool)

(declare-fun b_next!16063 () Bool)

(assert (=> b!900754 (= b_free!16063 (not b_next!16063))))

(declare-fun tp!56287 () Bool)

(declare-fun b_and!26363 () Bool)

(assert (=> b!900754 (= tp!56287 b_and!26363)))

(declare-fun b!900744 () Bool)

(declare-fun res!608257 () Bool)

(declare-fun e!504209 () Bool)

(assert (=> b!900744 (=> res!608257 e!504209)))

(declare-datatypes ((array!52819 0))(
  ( (array!52820 (arr!25379 (Array (_ BitVec 32) (_ BitVec 64))) (size!25840 (_ BitVec 32))) )
))
(declare-datatypes ((V!29487 0))(
  ( (V!29488 (val!9246 Int)) )
))
(declare-datatypes ((ValueCell!8714 0))(
  ( (ValueCellFull!8714 (v!11742 V!29487)) (EmptyCell!8714) )
))
(declare-datatypes ((array!52821 0))(
  ( (array!52822 (arr!25380 (Array (_ BitVec 32) ValueCell!8714)) (size!25841 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4444 0))(
  ( (LongMapFixedSize!4445 (defaultEntry!5460 Int) (mask!26254 (_ BitVec 32)) (extraKeys!5188 (_ BitVec 32)) (zeroValue!5292 V!29487) (minValue!5292 V!29487) (_size!2277 (_ BitVec 32)) (_keys!10265 array!52819) (_values!5479 array!52821) (_vacant!2277 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4444)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52819 (_ BitVec 32)) Bool)

(assert (=> b!900744 (= res!608257 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10265 thiss!1181) (mask!26254 thiss!1181))))))

(declare-fun mapIsEmpty!29269 () Bool)

(declare-fun mapRes!29269 () Bool)

(assert (=> mapIsEmpty!29269 mapRes!29269))

(declare-fun b!900746 () Bool)

(declare-fun res!608262 () Bool)

(assert (=> b!900746 (=> res!608262 e!504209)))

(declare-datatypes ((List!17876 0))(
  ( (Nil!17873) (Cons!17872 (h!19018 (_ BitVec 64)) (t!25224 List!17876)) )
))
(declare-fun arrayNoDuplicates!0 (array!52819 (_ BitVec 32) List!17876) Bool)

(assert (=> b!900746 (= res!608262 (not (arrayNoDuplicates!0 (_keys!10265 thiss!1181) #b00000000000000000000000000000000 Nil!17873)))))

(declare-fun b!900747 () Bool)

(declare-fun e!504204 () Bool)

(declare-fun tp_is_empty!18391 () Bool)

(assert (=> b!900747 (= e!504204 tp_is_empty!18391)))

(declare-fun b!900748 () Bool)

(declare-fun e!504208 () Bool)

(assert (=> b!900748 (= e!504208 tp_is_empty!18391)))

(declare-fun b!900749 () Bool)

(declare-fun e!504205 () Bool)

(declare-fun e!504210 () Bool)

(assert (=> b!900749 (= e!504205 (not e!504210))))

(declare-fun res!608259 () Bool)

(assert (=> b!900749 (=> res!608259 e!504210)))

(declare-datatypes ((SeekEntryResult!8945 0))(
  ( (MissingZero!8945 (index!38151 (_ BitVec 32))) (Found!8945 (index!38152 (_ BitVec 32))) (Intermediate!8945 (undefined!9757 Bool) (index!38153 (_ BitVec 32)) (x!76763 (_ BitVec 32))) (Undefined!8945) (MissingVacant!8945 (index!38154 (_ BitVec 32))) )
))
(declare-fun lt!406958 () SeekEntryResult!8945)

(get-info :version)

(assert (=> b!900749 (= res!608259 (not ((_ is Found!8945) lt!406958)))))

(declare-fun e!504211 () Bool)

(assert (=> b!900749 e!504211))

(declare-fun res!608264 () Bool)

(assert (=> b!900749 (=> res!608264 e!504211)))

(assert (=> b!900749 (= res!608264 (not ((_ is Found!8945) lt!406958)))))

(declare-datatypes ((Unit!30545 0))(
  ( (Unit!30546) )
))
(declare-fun lt!406957 () Unit!30545)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!108 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 64)) Unit!30545)

(assert (=> b!900749 (= lt!406957 (lemmaSeekEntryGivesInRangeIndex!108 (_keys!10265 thiss!1181) (_values!5479 thiss!1181) (mask!26254 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52819 (_ BitVec 32)) SeekEntryResult!8945)

(assert (=> b!900749 (= lt!406958 (seekEntry!0 key!785 (_keys!10265 thiss!1181) (mask!26254 thiss!1181)))))

(declare-fun b!900750 () Bool)

(assert (=> b!900750 (= e!504210 e!504209)))

(declare-fun res!608265 () Bool)

(assert (=> b!900750 (=> res!608265 e!504209)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900750 (= res!608265 (not (validMask!0 (mask!26254 thiss!1181))))))

(declare-datatypes ((tuple2!12088 0))(
  ( (tuple2!12089 (_1!6055 (_ BitVec 64)) (_2!6055 V!29487)) )
))
(declare-datatypes ((List!17877 0))(
  ( (Nil!17874) (Cons!17873 (h!19019 tuple2!12088) (t!25225 List!17877)) )
))
(declare-datatypes ((ListLongMap!10775 0))(
  ( (ListLongMap!10776 (toList!5403 List!17877)) )
))
(declare-fun lt!406955 () ListLongMap!10775)

(declare-fun contains!4408 (ListLongMap!10775 (_ BitVec 64)) Bool)

(assert (=> b!900750 (contains!4408 lt!406955 (select (arr!25379 (_keys!10265 thiss!1181)) (index!38152 lt!406958)))))

(declare-fun getCurrentListMap!2621 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) ListLongMap!10775)

(assert (=> b!900750 (= lt!406955 (getCurrentListMap!2621 (_keys!10265 thiss!1181) (_values!5479 thiss!1181) (mask!26254 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5460 thiss!1181)))))

(declare-fun lt!406956 () Unit!30545)

(declare-fun lemmaValidKeyInArrayIsInListMap!257 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) Unit!30545)

(assert (=> b!900750 (= lt!406956 (lemmaValidKeyInArrayIsInListMap!257 (_keys!10265 thiss!1181) (_values!5479 thiss!1181) (mask!26254 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) (index!38152 lt!406958) (defaultEntry!5460 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900750 (arrayContainsKey!0 (_keys!10265 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406954 () Unit!30545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52819 (_ BitVec 64) (_ BitVec 32)) Unit!30545)

(assert (=> b!900750 (= lt!406954 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10265 thiss!1181) key!785 (index!38152 lt!406958)))))

(declare-fun b!900751 () Bool)

(declare-fun e!504207 () Bool)

(assert (=> b!900751 (= e!504207 (and e!504208 mapRes!29269))))

(declare-fun condMapEmpty!29269 () Bool)

(declare-fun mapDefault!29269 () ValueCell!8714)

(assert (=> b!900751 (= condMapEmpty!29269 (= (arr!25380 (_values!5479 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8714)) mapDefault!29269)))))

(declare-fun b!900752 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900752 (= e!504209 (inRange!0 (index!38152 lt!406958) (mask!26254 thiss!1181)))))

(declare-fun b!900753 () Bool)

(declare-fun res!608261 () Bool)

(assert (=> b!900753 (=> res!608261 e!504209)))

(assert (=> b!900753 (= res!608261 (or (not (= (size!25841 (_values!5479 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26254 thiss!1181)))) (not (= (size!25840 (_keys!10265 thiss!1181)) (size!25841 (_values!5479 thiss!1181)))) (bvslt (mask!26254 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5188 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5188 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!504203 () Bool)

(declare-fun array_inv!19962 (array!52819) Bool)

(declare-fun array_inv!19963 (array!52821) Bool)

(assert (=> b!900754 (= e!504203 (and tp!56287 tp_is_empty!18391 (array_inv!19962 (_keys!10265 thiss!1181)) (array_inv!19963 (_values!5479 thiss!1181)) e!504207))))

(declare-fun b!900755 () Bool)

(declare-fun res!608258 () Bool)

(assert (=> b!900755 (=> (not res!608258) (not e!504205))))

(assert (=> b!900755 (= res!608258 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900745 () Bool)

(declare-fun res!608260 () Bool)

(assert (=> b!900745 (=> res!608260 e!504209)))

(assert (=> b!900745 (= res!608260 (not (contains!4408 lt!406955 key!785)))))

(declare-fun res!608263 () Bool)

(assert (=> start!77204 (=> (not res!608263) (not e!504205))))

(declare-fun valid!1715 (LongMapFixedSize!4444) Bool)

(assert (=> start!77204 (= res!608263 (valid!1715 thiss!1181))))

(assert (=> start!77204 e!504205))

(assert (=> start!77204 e!504203))

(assert (=> start!77204 true))

(declare-fun mapNonEmpty!29269 () Bool)

(declare-fun tp!56286 () Bool)

(assert (=> mapNonEmpty!29269 (= mapRes!29269 (and tp!56286 e!504204))))

(declare-fun mapKey!29269 () (_ BitVec 32))

(declare-fun mapValue!29269 () ValueCell!8714)

(declare-fun mapRest!29269 () (Array (_ BitVec 32) ValueCell!8714))

(assert (=> mapNonEmpty!29269 (= (arr!25380 (_values!5479 thiss!1181)) (store mapRest!29269 mapKey!29269 mapValue!29269))))

(declare-fun b!900756 () Bool)

(assert (=> b!900756 (= e!504211 (inRange!0 (index!38152 lt!406958) (mask!26254 thiss!1181)))))

(assert (= (and start!77204 res!608263) b!900755))

(assert (= (and b!900755 res!608258) b!900749))

(assert (= (and b!900749 (not res!608264)) b!900756))

(assert (= (and b!900749 (not res!608259)) b!900750))

(assert (= (and b!900750 (not res!608265)) b!900753))

(assert (= (and b!900753 (not res!608261)) b!900744))

(assert (= (and b!900744 (not res!608257)) b!900746))

(assert (= (and b!900746 (not res!608262)) b!900745))

(assert (= (and b!900745 (not res!608260)) b!900752))

(assert (= (and b!900751 condMapEmpty!29269) mapIsEmpty!29269))

(assert (= (and b!900751 (not condMapEmpty!29269)) mapNonEmpty!29269))

(assert (= (and mapNonEmpty!29269 ((_ is ValueCellFull!8714) mapValue!29269)) b!900747))

(assert (= (and b!900751 ((_ is ValueCellFull!8714) mapDefault!29269)) b!900748))

(assert (= b!900754 b!900751))

(assert (= start!77204 b!900754))

(declare-fun m!836575 () Bool)

(assert (=> b!900749 m!836575))

(declare-fun m!836577 () Bool)

(assert (=> b!900749 m!836577))

(declare-fun m!836579 () Bool)

(assert (=> b!900754 m!836579))

(declare-fun m!836581 () Bool)

(assert (=> b!900754 m!836581))

(declare-fun m!836583 () Bool)

(assert (=> b!900750 m!836583))

(declare-fun m!836585 () Bool)

(assert (=> b!900750 m!836585))

(declare-fun m!836587 () Bool)

(assert (=> b!900750 m!836587))

(declare-fun m!836589 () Bool)

(assert (=> b!900750 m!836589))

(declare-fun m!836591 () Bool)

(assert (=> b!900750 m!836591))

(declare-fun m!836593 () Bool)

(assert (=> b!900750 m!836593))

(declare-fun m!836595 () Bool)

(assert (=> b!900750 m!836595))

(assert (=> b!900750 m!836587))

(declare-fun m!836597 () Bool)

(assert (=> b!900745 m!836597))

(declare-fun m!836599 () Bool)

(assert (=> b!900744 m!836599))

(declare-fun m!836601 () Bool)

(assert (=> b!900752 m!836601))

(declare-fun m!836603 () Bool)

(assert (=> mapNonEmpty!29269 m!836603))

(assert (=> b!900756 m!836601))

(declare-fun m!836605 () Bool)

(assert (=> b!900746 m!836605))

(declare-fun m!836607 () Bool)

(assert (=> start!77204 m!836607))

(check-sat b_and!26363 (not b!900744) (not b!900750) (not b!900749) (not b!900745) (not mapNonEmpty!29269) (not b!900752) (not b!900756) (not b!900746) tp_is_empty!18391 (not start!77204) (not b_next!16063) (not b!900754))
(check-sat b_and!26363 (not b_next!16063))
