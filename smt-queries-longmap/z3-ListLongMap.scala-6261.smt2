; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80034 () Bool)

(assert start!80034)

(declare-fun b!941018 () Bool)

(declare-fun b_free!17889 () Bool)

(declare-fun b_next!17889 () Bool)

(assert (=> b!941018 (= b_free!17889 (not b_next!17889))))

(declare-fun tp!62141 () Bool)

(declare-fun b_and!29301 () Bool)

(assert (=> b!941018 (= tp!62141 b_and!29301)))

(declare-fun b!941016 () Bool)

(declare-fun res!632696 () Bool)

(declare-fun e!528963 () Bool)

(assert (=> b!941016 (=> res!632696 e!528963)))

(declare-datatypes ((V!32161 0))(
  ( (V!32162 (val!10249 Int)) )
))
(declare-datatypes ((ValueCell!9717 0))(
  ( (ValueCellFull!9717 (v!12780 V!32161)) (EmptyCell!9717) )
))
(declare-datatypes ((array!56742 0))(
  ( (array!56743 (arr!27306 (Array (_ BitVec 32) ValueCell!9717)) (size!27767 (_ BitVec 32))) )
))
(declare-datatypes ((array!56744 0))(
  ( (array!56745 (arr!27307 (Array (_ BitVec 32) (_ BitVec 64))) (size!27768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4584 0))(
  ( (LongMapFixedSize!4585 (defaultEntry!5583 Int) (mask!27136 (_ BitVec 32)) (extraKeys!5315 (_ BitVec 32)) (zeroValue!5419 V!32161) (minValue!5419 V!32161) (_size!2347 (_ BitVec 32)) (_keys!10433 array!56744) (_values!5606 array!56742) (_vacant!2347 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4584)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56744 (_ BitVec 32)) Bool)

(assert (=> b!941016 (= res!632696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10433 thiss!1141) (mask!27136 thiss!1141))))))

(declare-fun b!941017 () Bool)

(declare-fun e!528962 () Bool)

(declare-fun tp_is_empty!20397 () Bool)

(assert (=> b!941017 (= e!528962 tp_is_empty!20397)))

(declare-fun e!528958 () Bool)

(declare-fun e!528964 () Bool)

(declare-fun array_inv!21222 (array!56744) Bool)

(declare-fun array_inv!21223 (array!56742) Bool)

(assert (=> b!941018 (= e!528958 (and tp!62141 tp_is_empty!20397 (array_inv!21222 (_keys!10433 thiss!1141)) (array_inv!21223 (_values!5606 thiss!1141)) e!528964))))

(declare-fun mapNonEmpty!32386 () Bool)

(declare-fun mapRes!32386 () Bool)

(declare-fun tp!62142 () Bool)

(assert (=> mapNonEmpty!32386 (= mapRes!32386 (and tp!62142 e!528962))))

(declare-fun mapValue!32386 () ValueCell!9717)

(declare-fun mapKey!32386 () (_ BitVec 32))

(declare-fun mapRest!32386 () (Array (_ BitVec 32) ValueCell!9717))

(assert (=> mapNonEmpty!32386 (= (arr!27306 (_values!5606 thiss!1141)) (store mapRest!32386 mapKey!32386 mapValue!32386))))

(declare-fun b!941020 () Bool)

(declare-fun res!632701 () Bool)

(declare-fun e!528961 () Bool)

(assert (=> b!941020 (=> (not res!632701) (not e!528961))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941020 (= res!632701 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941021 () Bool)

(declare-fun e!528960 () Bool)

(assert (=> b!941021 (= e!528961 e!528960)))

(declare-fun res!632698 () Bool)

(assert (=> b!941021 (=> (not res!632698) (not e!528960))))

(declare-datatypes ((SeekEntryResult!9013 0))(
  ( (MissingZero!9013 (index!38423 (_ BitVec 32))) (Found!9013 (index!38424 (_ BitVec 32))) (Intermediate!9013 (undefined!9825 Bool) (index!38425 (_ BitVec 32)) (x!80722 (_ BitVec 32))) (Undefined!9013) (MissingVacant!9013 (index!38426 (_ BitVec 32))) )
))
(declare-fun lt!424885 () SeekEntryResult!9013)

(get-info :version)

(assert (=> b!941021 (= res!632698 ((_ is Found!9013) lt!424885))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56744 (_ BitVec 32)) SeekEntryResult!9013)

(assert (=> b!941021 (= lt!424885 (seekEntry!0 key!756 (_keys!10433 thiss!1141) (mask!27136 thiss!1141)))))

(declare-fun b!941022 () Bool)

(declare-fun e!528959 () Bool)

(assert (=> b!941022 (= e!528959 tp_is_empty!20397)))

(declare-fun b!941023 () Bool)

(declare-fun res!632699 () Bool)

(assert (=> b!941023 (=> res!632699 e!528963)))

(assert (=> b!941023 (= res!632699 (or (not (= (size!27767 (_values!5606 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27136 thiss!1141)))) (not (= (size!27768 (_keys!10433 thiss!1141)) (size!27767 (_values!5606 thiss!1141)))) (bvslt (mask!27136 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5315 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5315 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941024 () Bool)

(assert (=> b!941024 (= e!528963 true)))

(declare-fun lt!424883 () Bool)

(declare-datatypes ((List!19200 0))(
  ( (Nil!19197) (Cons!19196 (h!20342 (_ BitVec 64)) (t!27515 List!19200)) )
))
(declare-fun arrayNoDuplicates!0 (array!56744 (_ BitVec 32) List!19200) Bool)

(assert (=> b!941024 (= lt!424883 (arrayNoDuplicates!0 (_keys!10433 thiss!1141) #b00000000000000000000000000000000 Nil!19197))))

(declare-fun b!941025 () Bool)

(assert (=> b!941025 (= e!528960 (not e!528963))))

(declare-fun res!632700 () Bool)

(assert (=> b!941025 (=> res!632700 e!528963)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941025 (= res!632700 (not (validMask!0 (mask!27136 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941025 (arrayContainsKey!0 (_keys!10433 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31792 0))(
  ( (Unit!31793) )
))
(declare-fun lt!424884 () Unit!31792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56744 (_ BitVec 64) (_ BitVec 32)) Unit!31792)

(assert (=> b!941025 (= lt!424884 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10433 thiss!1141) key!756 (index!38424 lt!424885)))))

(declare-fun mapIsEmpty!32386 () Bool)

(assert (=> mapIsEmpty!32386 mapRes!32386))

(declare-fun b!941019 () Bool)

(assert (=> b!941019 (= e!528964 (and e!528959 mapRes!32386))))

(declare-fun condMapEmpty!32386 () Bool)

(declare-fun mapDefault!32386 () ValueCell!9717)

(assert (=> b!941019 (= condMapEmpty!32386 (= (arr!27306 (_values!5606 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9717)) mapDefault!32386)))))

(declare-fun res!632697 () Bool)

(assert (=> start!80034 (=> (not res!632697) (not e!528961))))

(declare-fun valid!1757 (LongMapFixedSize!4584) Bool)

(assert (=> start!80034 (= res!632697 (valid!1757 thiss!1141))))

(assert (=> start!80034 e!528961))

(assert (=> start!80034 e!528958))

(assert (=> start!80034 true))

(assert (= (and start!80034 res!632697) b!941020))

(assert (= (and b!941020 res!632701) b!941021))

(assert (= (and b!941021 res!632698) b!941025))

(assert (= (and b!941025 (not res!632700)) b!941023))

(assert (= (and b!941023 (not res!632699)) b!941016))

(assert (= (and b!941016 (not res!632696)) b!941024))

(assert (= (and b!941019 condMapEmpty!32386) mapIsEmpty!32386))

(assert (= (and b!941019 (not condMapEmpty!32386)) mapNonEmpty!32386))

(assert (= (and mapNonEmpty!32386 ((_ is ValueCellFull!9717) mapValue!32386)) b!941017))

(assert (= (and b!941019 ((_ is ValueCellFull!9717) mapDefault!32386)) b!941022))

(assert (= b!941018 b!941019))

(assert (= start!80034 b!941018))

(declare-fun m!876273 () Bool)

(assert (=> b!941024 m!876273))

(declare-fun m!876275 () Bool)

(assert (=> start!80034 m!876275))

(declare-fun m!876277 () Bool)

(assert (=> b!941018 m!876277))

(declare-fun m!876279 () Bool)

(assert (=> b!941018 m!876279))

(declare-fun m!876281 () Bool)

(assert (=> mapNonEmpty!32386 m!876281))

(declare-fun m!876283 () Bool)

(assert (=> b!941025 m!876283))

(declare-fun m!876285 () Bool)

(assert (=> b!941025 m!876285))

(declare-fun m!876287 () Bool)

(assert (=> b!941025 m!876287))

(declare-fun m!876289 () Bool)

(assert (=> b!941021 m!876289))

(declare-fun m!876291 () Bool)

(assert (=> b!941016 m!876291))

(check-sat (not b!941021) (not b!941024) (not b!941025) (not mapNonEmpty!32386) (not start!80034) tp_is_empty!20397 (not b!941018) (not b_next!17889) (not b!941016) b_and!29301)
(check-sat b_and!29301 (not b_next!17889))
