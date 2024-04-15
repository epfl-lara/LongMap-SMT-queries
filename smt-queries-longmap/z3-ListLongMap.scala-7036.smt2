; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89226 () Bool)

(assert start!89226)

(declare-fun b!1022938 () Bool)

(declare-fun b_free!20269 () Bool)

(declare-fun b_next!20269 () Bool)

(assert (=> b!1022938 (= b_free!20269 (not b_next!20269))))

(declare-fun tp!71841 () Bool)

(declare-fun b_and!32465 () Bool)

(assert (=> b!1022938 (= tp!71841 b_and!32465)))

(declare-fun b!1022935 () Bool)

(declare-fun res!685170 () Bool)

(declare-fun e!576367 () Bool)

(assert (=> b!1022935 (=> (not res!685170) (not e!576367))))

(declare-datatypes ((V!36859 0))(
  ( (V!36860 (val!12045 Int)) )
))
(declare-datatypes ((ValueCell!11291 0))(
  ( (ValueCellFull!11291 (v!14613 V!36859)) (EmptyCell!11291) )
))
(declare-datatypes ((array!63961 0))(
  ( (array!63962 (arr!30792 (Array (_ BitVec 32) (_ BitVec 64))) (size!31305 (_ BitVec 32))) )
))
(declare-datatypes ((array!63963 0))(
  ( (array!63964 (arr!30793 (Array (_ BitVec 32) ValueCell!11291)) (size!31306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5176 0))(
  ( (LongMapFixedSize!5177 (defaultEntry!5940 Int) (mask!29548 (_ BitVec 32)) (extraKeys!5672 (_ BitVec 32)) (zeroValue!5776 V!36859) (minValue!5776 V!36859) (_size!2643 (_ BitVec 32)) (_keys!11081 array!63961) (_values!5963 array!63963) (_vacant!2643 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5176)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022935 (= res!685170 (validMask!0 (mask!29548 thiss!1427)))))

(declare-fun b!1022936 () Bool)

(declare-fun res!685167 () Bool)

(assert (=> b!1022936 (=> (not res!685167) (not e!576367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63961 (_ BitVec 32)) Bool)

(assert (=> b!1022936 (= res!685167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11081 thiss!1427) (mask!29548 thiss!1427)))))

(declare-fun b!1022937 () Bool)

(assert (=> b!1022937 (= e!576367 false)))

(declare-fun lt!450169 () Bool)

(declare-datatypes ((List!21733 0))(
  ( (Nil!21730) (Cons!21729 (h!22927 (_ BitVec 64)) (t!30762 List!21733)) )
))
(declare-fun arrayNoDuplicates!0 (array!63961 (_ BitVec 32) List!21733) Bool)

(assert (=> b!1022937 (= lt!450169 (arrayNoDuplicates!0 (_keys!11081 thiss!1427) #b00000000000000000000000000000000 Nil!21730))))

(declare-fun e!576364 () Bool)

(declare-fun e!576368 () Bool)

(declare-fun tp_is_empty!23989 () Bool)

(declare-fun array_inv!23881 (array!63961) Bool)

(declare-fun array_inv!23882 (array!63963) Bool)

(assert (=> b!1022938 (= e!576368 (and tp!71841 tp_is_empty!23989 (array_inv!23881 (_keys!11081 thiss!1427)) (array_inv!23882 (_values!5963 thiss!1427)) e!576364))))

(declare-fun mapNonEmpty!37401 () Bool)

(declare-fun mapRes!37401 () Bool)

(declare-fun tp!71842 () Bool)

(declare-fun e!576365 () Bool)

(assert (=> mapNonEmpty!37401 (= mapRes!37401 (and tp!71842 e!576365))))

(declare-fun mapKey!37401 () (_ BitVec 32))

(declare-fun mapRest!37401 () (Array (_ BitVec 32) ValueCell!11291))

(declare-fun mapValue!37401 () ValueCell!11291)

(assert (=> mapNonEmpty!37401 (= (arr!30793 (_values!5963 thiss!1427)) (store mapRest!37401 mapKey!37401 mapValue!37401))))

(declare-fun res!685168 () Bool)

(assert (=> start!89226 (=> (not res!685168) (not e!576367))))

(declare-fun valid!1970 (LongMapFixedSize!5176) Bool)

(assert (=> start!89226 (= res!685168 (valid!1970 thiss!1427))))

(assert (=> start!89226 e!576367))

(assert (=> start!89226 e!576368))

(assert (=> start!89226 true))

(declare-fun b!1022939 () Bool)

(declare-fun res!685169 () Bool)

(assert (=> b!1022939 (=> (not res!685169) (not e!576367))))

(assert (=> b!1022939 (= res!685169 (and (= (size!31306 (_values!5963 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29548 thiss!1427))) (= (size!31305 (_keys!11081 thiss!1427)) (size!31306 (_values!5963 thiss!1427))) (bvsge (mask!29548 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5672 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5672 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022940 () Bool)

(declare-fun res!685171 () Bool)

(assert (=> b!1022940 (=> (not res!685171) (not e!576367))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022940 (= res!685171 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022941 () Bool)

(declare-fun e!576366 () Bool)

(assert (=> b!1022941 (= e!576364 (and e!576366 mapRes!37401))))

(declare-fun condMapEmpty!37401 () Bool)

(declare-fun mapDefault!37401 () ValueCell!11291)

(assert (=> b!1022941 (= condMapEmpty!37401 (= (arr!30793 (_values!5963 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11291)) mapDefault!37401)))))

(declare-fun b!1022942 () Bool)

(assert (=> b!1022942 (= e!576365 tp_is_empty!23989)))

(declare-fun b!1022943 () Bool)

(assert (=> b!1022943 (= e!576366 tp_is_empty!23989)))

(declare-fun mapIsEmpty!37401 () Bool)

(assert (=> mapIsEmpty!37401 mapRes!37401))

(assert (= (and start!89226 res!685168) b!1022940))

(assert (= (and b!1022940 res!685171) b!1022935))

(assert (= (and b!1022935 res!685170) b!1022939))

(assert (= (and b!1022939 res!685169) b!1022936))

(assert (= (and b!1022936 res!685167) b!1022937))

(assert (= (and b!1022941 condMapEmpty!37401) mapIsEmpty!37401))

(assert (= (and b!1022941 (not condMapEmpty!37401)) mapNonEmpty!37401))

(get-info :version)

(assert (= (and mapNonEmpty!37401 ((_ is ValueCellFull!11291) mapValue!37401)) b!1022942))

(assert (= (and b!1022941 ((_ is ValueCellFull!11291) mapDefault!37401)) b!1022943))

(assert (= b!1022938 b!1022941))

(assert (= start!89226 b!1022938))

(declare-fun m!941319 () Bool)

(assert (=> b!1022936 m!941319))

(declare-fun m!941321 () Bool)

(assert (=> b!1022935 m!941321))

(declare-fun m!941323 () Bool)

(assert (=> mapNonEmpty!37401 m!941323))

(declare-fun m!941325 () Bool)

(assert (=> b!1022937 m!941325))

(declare-fun m!941327 () Bool)

(assert (=> start!89226 m!941327))

(declare-fun m!941329 () Bool)

(assert (=> b!1022938 m!941329))

(declare-fun m!941331 () Bool)

(assert (=> b!1022938 m!941331))

(check-sat (not b!1022938) (not b!1022937) (not start!89226) (not b!1022935) (not mapNonEmpty!37401) (not b!1022936) tp_is_empty!23989 (not b_next!20269) b_and!32465)
(check-sat b_and!32465 (not b_next!20269))
