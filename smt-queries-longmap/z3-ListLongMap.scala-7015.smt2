; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89100 () Bool)

(assert start!89100)

(declare-fun b!1021326 () Bool)

(declare-fun b_free!20143 () Bool)

(declare-fun b_next!20143 () Bool)

(assert (=> b!1021326 (= b_free!20143 (not b_next!20143))))

(declare-fun tp!71463 () Bool)

(declare-fun b_and!32315 () Bool)

(assert (=> b!1021326 (= tp!71463 b_and!32315)))

(declare-fun res!684333 () Bool)

(declare-fun e!575232 () Bool)

(assert (=> start!89100 (=> (not res!684333) (not e!575232))))

(declare-datatypes ((V!36691 0))(
  ( (V!36692 (val!11982 Int)) )
))
(declare-datatypes ((ValueCell!11228 0))(
  ( (ValueCellFull!11228 (v!14550 V!36691)) (EmptyCell!11228) )
))
(declare-datatypes ((array!63709 0))(
  ( (array!63710 (arr!30666 (Array (_ BitVec 32) (_ BitVec 64))) (size!31179 (_ BitVec 32))) )
))
(declare-datatypes ((array!63711 0))(
  ( (array!63712 (arr!30667 (Array (_ BitVec 32) ValueCell!11228)) (size!31180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5050 0))(
  ( (LongMapFixedSize!5051 (defaultEntry!5877 Int) (mask!29443 (_ BitVec 32)) (extraKeys!5609 (_ BitVec 32)) (zeroValue!5713 V!36691) (minValue!5713 V!36691) (_size!2580 (_ BitVec 32)) (_keys!11018 array!63709) (_values!5900 array!63711) (_vacant!2580 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5050)

(declare-fun valid!1928 (LongMapFixedSize!5050) Bool)

(assert (=> start!89100 (= res!684333 (valid!1928 thiss!1427))))

(assert (=> start!89100 e!575232))

(declare-fun e!575230 () Bool)

(assert (=> start!89100 e!575230))

(assert (=> start!89100 true))

(declare-fun b!1021318 () Bool)

(declare-fun res!684332 () Bool)

(assert (=> b!1021318 (=> (not res!684332) (not e!575232))))

(assert (=> b!1021318 (= res!684332 (and (= (size!31180 (_values!5900 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29443 thiss!1427))) (= (size!31179 (_keys!11018 thiss!1427)) (size!31180 (_values!5900 thiss!1427))) (bvsge (mask!29443 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5609 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5609 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37212 () Bool)

(declare-fun mapRes!37212 () Bool)

(declare-fun tp!71464 () Bool)

(declare-fun e!575234 () Bool)

(assert (=> mapNonEmpty!37212 (= mapRes!37212 (and tp!71464 e!575234))))

(declare-fun mapValue!37212 () ValueCell!11228)

(declare-fun mapRest!37212 () (Array (_ BitVec 32) ValueCell!11228))

(declare-fun mapKey!37212 () (_ BitVec 32))

(assert (=> mapNonEmpty!37212 (= (arr!30667 (_values!5900 thiss!1427)) (store mapRest!37212 mapKey!37212 mapValue!37212))))

(declare-fun mapIsEmpty!37212 () Bool)

(assert (=> mapIsEmpty!37212 mapRes!37212))

(declare-fun b!1021319 () Bool)

(declare-fun res!684330 () Bool)

(assert (=> b!1021319 (=> (not res!684330) (not e!575232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63709 (_ BitVec 32)) Bool)

(assert (=> b!1021319 (= res!684330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11018 thiss!1427) (mask!29443 thiss!1427)))))

(declare-fun b!1021320 () Bool)

(assert (=> b!1021320 (= e!575232 false)))

(declare-fun lt!449908 () Bool)

(declare-datatypes ((List!21690 0))(
  ( (Nil!21687) (Cons!21686 (h!22884 (_ BitVec 64)) (t!30695 List!21690)) )
))
(declare-fun arrayNoDuplicates!0 (array!63709 (_ BitVec 32) List!21690) Bool)

(assert (=> b!1021320 (= lt!449908 (arrayNoDuplicates!0 (_keys!11018 thiss!1427) #b00000000000000000000000000000000 Nil!21687))))

(declare-fun b!1021321 () Bool)

(declare-fun res!684331 () Bool)

(assert (=> b!1021321 (=> (not res!684331) (not e!575232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021321 (= res!684331 (validMask!0 (mask!29443 thiss!1427)))))

(declare-fun b!1021322 () Bool)

(declare-fun res!684334 () Bool)

(assert (=> b!1021322 (=> (not res!684334) (not e!575232))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021322 (= res!684334 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021323 () Bool)

(declare-fun tp_is_empty!23863 () Bool)

(assert (=> b!1021323 (= e!575234 tp_is_empty!23863)))

(declare-fun b!1021324 () Bool)

(declare-fun e!575233 () Bool)

(declare-fun e!575229 () Bool)

(assert (=> b!1021324 (= e!575233 (and e!575229 mapRes!37212))))

(declare-fun condMapEmpty!37212 () Bool)

(declare-fun mapDefault!37212 () ValueCell!11228)

(assert (=> b!1021324 (= condMapEmpty!37212 (= (arr!30667 (_values!5900 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11228)) mapDefault!37212)))))

(declare-fun b!1021325 () Bool)

(assert (=> b!1021325 (= e!575229 tp_is_empty!23863)))

(declare-fun array_inv!23793 (array!63709) Bool)

(declare-fun array_inv!23794 (array!63711) Bool)

(assert (=> b!1021326 (= e!575230 (and tp!71463 tp_is_empty!23863 (array_inv!23793 (_keys!11018 thiss!1427)) (array_inv!23794 (_values!5900 thiss!1427)) e!575233))))

(assert (= (and start!89100 res!684333) b!1021322))

(assert (= (and b!1021322 res!684334) b!1021321))

(assert (= (and b!1021321 res!684331) b!1021318))

(assert (= (and b!1021318 res!684332) b!1021319))

(assert (= (and b!1021319 res!684330) b!1021320))

(assert (= (and b!1021324 condMapEmpty!37212) mapIsEmpty!37212))

(assert (= (and b!1021324 (not condMapEmpty!37212)) mapNonEmpty!37212))

(get-info :version)

(assert (= (and mapNonEmpty!37212 ((_ is ValueCellFull!11228) mapValue!37212)) b!1021323))

(assert (= (and b!1021324 ((_ is ValueCellFull!11228) mapDefault!37212)) b!1021325))

(assert (= b!1021326 b!1021324))

(assert (= start!89100 b!1021326))

(declare-fun m!940365 () Bool)

(assert (=> b!1021319 m!940365))

(declare-fun m!940367 () Bool)

(assert (=> start!89100 m!940367))

(declare-fun m!940369 () Bool)

(assert (=> b!1021321 m!940369))

(declare-fun m!940371 () Bool)

(assert (=> b!1021326 m!940371))

(declare-fun m!940373 () Bool)

(assert (=> b!1021326 m!940373))

(declare-fun m!940375 () Bool)

(assert (=> mapNonEmpty!37212 m!940375))

(declare-fun m!940377 () Bool)

(assert (=> b!1021320 m!940377))

(check-sat tp_is_empty!23863 (not b_next!20143) b_and!32315 (not b!1021321) (not mapNonEmpty!37212) (not start!89100) (not b!1021320) (not b!1021326) (not b!1021319))
(check-sat b_and!32315 (not b_next!20143))
