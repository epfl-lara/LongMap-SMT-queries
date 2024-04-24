; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80200 () Bool)

(assert start!80200)

(declare-fun b!941893 () Bool)

(declare-fun b_free!17887 () Bool)

(declare-fun b_next!17887 () Bool)

(assert (=> b!941893 (= b_free!17887 (not b_next!17887))))

(declare-fun tp!62136 () Bool)

(declare-fun b_and!29309 () Bool)

(assert (=> b!941893 (= tp!62136 b_and!29309)))

(declare-fun b!941889 () Bool)

(declare-fun res!633022 () Bool)

(declare-fun e!529519 () Bool)

(assert (=> b!941889 (=> res!633022 e!529519)))

(declare-datatypes ((V!32159 0))(
  ( (V!32160 (val!10248 Int)) )
))
(declare-datatypes ((ValueCell!9716 0))(
  ( (ValueCellFull!9716 (v!12776 V!32159)) (EmptyCell!9716) )
))
(declare-datatypes ((array!56789 0))(
  ( (array!56790 (arr!27325 (Array (_ BitVec 32) ValueCell!9716)) (size!27787 (_ BitVec 32))) )
))
(declare-datatypes ((array!56791 0))(
  ( (array!56792 (arr!27326 (Array (_ BitVec 32) (_ BitVec 64))) (size!27788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4582 0))(
  ( (LongMapFixedSize!4583 (defaultEntry!5582 Int) (mask!27178 (_ BitVec 32)) (extraKeys!5314 (_ BitVec 32)) (zeroValue!5418 V!32159) (minValue!5418 V!32159) (_size!2346 (_ BitVec 32)) (_keys!10460 array!56791) (_values!5605 array!56789) (_vacant!2346 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4582)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56791 (_ BitVec 32)) Bool)

(assert (=> b!941889 (= res!633022 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10460 thiss!1141) (mask!27178 thiss!1141))))))

(declare-fun b!941890 () Bool)

(declare-fun res!633023 () Bool)

(declare-fun e!529517 () Bool)

(assert (=> b!941890 (=> (not res!633023) (not e!529517))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941890 (= res!633023 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941891 () Bool)

(declare-fun e!529518 () Bool)

(declare-fun tp_is_empty!20395 () Bool)

(assert (=> b!941891 (= e!529518 tp_is_empty!20395)))

(declare-fun mapIsEmpty!32383 () Bool)

(declare-fun mapRes!32383 () Bool)

(assert (=> mapIsEmpty!32383 mapRes!32383))

(declare-fun b!941892 () Bool)

(declare-fun res!633024 () Bool)

(assert (=> b!941892 (=> res!633024 e!529519)))

(assert (=> b!941892 (= res!633024 (or (not (= (size!27787 (_values!5605 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27178 thiss!1141)))) (not (= (size!27788 (_keys!10460 thiss!1141)) (size!27787 (_values!5605 thiss!1141)))) (bvslt (mask!27178 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5314 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5314 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun e!529515 () Bool)

(declare-fun e!529521 () Bool)

(declare-fun array_inv!21330 (array!56791) Bool)

(declare-fun array_inv!21331 (array!56789) Bool)

(assert (=> b!941893 (= e!529521 (and tp!62136 tp_is_empty!20395 (array_inv!21330 (_keys!10460 thiss!1141)) (array_inv!21331 (_values!5605 thiss!1141)) e!529515))))

(declare-fun mapNonEmpty!32383 () Bool)

(declare-fun tp!62137 () Bool)

(assert (=> mapNonEmpty!32383 (= mapRes!32383 (and tp!62137 e!529518))))

(declare-fun mapRest!32383 () (Array (_ BitVec 32) ValueCell!9716))

(declare-fun mapKey!32383 () (_ BitVec 32))

(declare-fun mapValue!32383 () ValueCell!9716)

(assert (=> mapNonEmpty!32383 (= (arr!27325 (_values!5605 thiss!1141)) (store mapRest!32383 mapKey!32383 mapValue!32383))))

(declare-fun b!941894 () Bool)

(assert (=> b!941894 (= e!529519 true)))

(declare-fun lt!425236 () Bool)

(declare-datatypes ((List!19187 0))(
  ( (Nil!19184) (Cons!19183 (h!20335 (_ BitVec 64)) (t!27494 List!19187)) )
))
(declare-fun arrayNoDuplicates!0 (array!56791 (_ BitVec 32) List!19187) Bool)

(assert (=> b!941894 (= lt!425236 (arrayNoDuplicates!0 (_keys!10460 thiss!1141) #b00000000000000000000000000000000 Nil!19184))))

(declare-fun res!633027 () Bool)

(assert (=> start!80200 (=> (not res!633027) (not e!529517))))

(declare-fun valid!1761 (LongMapFixedSize!4582) Bool)

(assert (=> start!80200 (= res!633027 (valid!1761 thiss!1141))))

(assert (=> start!80200 e!529517))

(assert (=> start!80200 e!529521))

(assert (=> start!80200 true))

(declare-fun b!941895 () Bool)

(declare-fun e!529522 () Bool)

(assert (=> b!941895 (= e!529517 e!529522)))

(declare-fun res!633025 () Bool)

(assert (=> b!941895 (=> (not res!633025) (not e!529522))))

(declare-datatypes ((SeekEntryResult!8968 0))(
  ( (MissingZero!8968 (index!38243 (_ BitVec 32))) (Found!8968 (index!38244 (_ BitVec 32))) (Intermediate!8968 (undefined!9780 Bool) (index!38245 (_ BitVec 32)) (x!80691 (_ BitVec 32))) (Undefined!8968) (MissingVacant!8968 (index!38246 (_ BitVec 32))) )
))
(declare-fun lt!425237 () SeekEntryResult!8968)

(get-info :version)

(assert (=> b!941895 (= res!633025 ((_ is Found!8968) lt!425237))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56791 (_ BitVec 32)) SeekEntryResult!8968)

(assert (=> b!941895 (= lt!425237 (seekEntry!0 key!756 (_keys!10460 thiss!1141) (mask!27178 thiss!1141)))))

(declare-fun b!941896 () Bool)

(declare-fun e!529516 () Bool)

(assert (=> b!941896 (= e!529516 tp_is_empty!20395)))

(declare-fun b!941897 () Bool)

(assert (=> b!941897 (= e!529522 (not e!529519))))

(declare-fun res!633026 () Bool)

(assert (=> b!941897 (=> res!633026 e!529519)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941897 (= res!633026 (not (validMask!0 (mask!27178 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941897 (arrayContainsKey!0 (_keys!10460 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31770 0))(
  ( (Unit!31771) )
))
(declare-fun lt!425235 () Unit!31770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56791 (_ BitVec 64) (_ BitVec 32)) Unit!31770)

(assert (=> b!941897 (= lt!425235 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10460 thiss!1141) key!756 (index!38244 lt!425237)))))

(declare-fun b!941898 () Bool)

(assert (=> b!941898 (= e!529515 (and e!529516 mapRes!32383))))

(declare-fun condMapEmpty!32383 () Bool)

(declare-fun mapDefault!32383 () ValueCell!9716)

(assert (=> b!941898 (= condMapEmpty!32383 (= (arr!27325 (_values!5605 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9716)) mapDefault!32383)))))

(assert (= (and start!80200 res!633027) b!941890))

(assert (= (and b!941890 res!633023) b!941895))

(assert (= (and b!941895 res!633025) b!941897))

(assert (= (and b!941897 (not res!633026)) b!941892))

(assert (= (and b!941892 (not res!633024)) b!941889))

(assert (= (and b!941889 (not res!633022)) b!941894))

(assert (= (and b!941898 condMapEmpty!32383) mapIsEmpty!32383))

(assert (= (and b!941898 (not condMapEmpty!32383)) mapNonEmpty!32383))

(assert (= (and mapNonEmpty!32383 ((_ is ValueCellFull!9716) mapValue!32383)) b!941891))

(assert (= (and b!941898 ((_ is ValueCellFull!9716) mapDefault!32383)) b!941896))

(assert (= b!941893 b!941898))

(assert (= start!80200 b!941893))

(declare-fun m!877547 () Bool)

(assert (=> b!941893 m!877547))

(declare-fun m!877549 () Bool)

(assert (=> b!941893 m!877549))

(declare-fun m!877551 () Bool)

(assert (=> b!941889 m!877551))

(declare-fun m!877553 () Bool)

(assert (=> mapNonEmpty!32383 m!877553))

(declare-fun m!877555 () Bool)

(assert (=> b!941895 m!877555))

(declare-fun m!877557 () Bool)

(assert (=> start!80200 m!877557))

(declare-fun m!877559 () Bool)

(assert (=> b!941894 m!877559))

(declare-fun m!877561 () Bool)

(assert (=> b!941897 m!877561))

(declare-fun m!877563 () Bool)

(assert (=> b!941897 m!877563))

(declare-fun m!877565 () Bool)

(assert (=> b!941897 m!877565))

(check-sat tp_is_empty!20395 (not b!941889) (not b!941895) (not b!941894) (not b!941897) (not b_next!17887) (not b!941893) b_and!29309 (not mapNonEmpty!32383) (not start!80200))
(check-sat b_and!29309 (not b_next!17887))
