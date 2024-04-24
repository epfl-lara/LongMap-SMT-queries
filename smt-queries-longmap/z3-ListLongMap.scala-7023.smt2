; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89384 () Bool)

(assert start!89384)

(declare-fun b!1023434 () Bool)

(declare-fun b_free!20191 () Bool)

(declare-fun b_next!20191 () Bool)

(assert (=> b!1023434 (= b_free!20191 (not b_next!20191))))

(declare-fun tp!71607 () Bool)

(declare-fun b_and!32399 () Bool)

(assert (=> b!1023434 (= tp!71607 b_and!32399)))

(declare-fun b!1023432 () Bool)

(declare-fun res!685270 () Bool)

(declare-fun e!576599 () Bool)

(assert (=> b!1023432 (=> (not res!685270) (not e!576599))))

(declare-datatypes ((V!36755 0))(
  ( (V!36756 (val!12006 Int)) )
))
(declare-datatypes ((ValueCell!11252 0))(
  ( (ValueCellFull!11252 (v!14571 V!36755)) (EmptyCell!11252) )
))
(declare-datatypes ((array!63915 0))(
  ( (array!63916 (arr!30763 (Array (_ BitVec 32) (_ BitVec 64))) (size!31275 (_ BitVec 32))) )
))
(declare-datatypes ((array!63917 0))(
  ( (array!63918 (arr!30764 (Array (_ BitVec 32) ValueCell!11252)) (size!31276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5098 0))(
  ( (LongMapFixedSize!5099 (defaultEntry!5901 Int) (mask!29548 (_ BitVec 32)) (extraKeys!5633 (_ BitVec 32)) (zeroValue!5737 V!36755) (minValue!5737 V!36755) (_size!2604 (_ BitVec 32)) (_keys!11084 array!63915) (_values!5924 array!63917) (_vacant!2604 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5098)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63915 (_ BitVec 32)) Bool)

(assert (=> b!1023432 (= res!685270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11084 thiss!1427) (mask!29548 thiss!1427)))))

(declare-fun b!1023433 () Bool)

(declare-fun res!685267 () Bool)

(assert (=> b!1023433 (=> (not res!685267) (not e!576599))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023433 (= res!685267 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!576597 () Bool)

(declare-fun tp_is_empty!23911 () Bool)

(declare-fun e!576600 () Bool)

(declare-fun array_inv!23865 (array!63915) Bool)

(declare-fun array_inv!23866 (array!63917) Bool)

(assert (=> b!1023434 (= e!576597 (and tp!71607 tp_is_empty!23911 (array_inv!23865 (_keys!11084 thiss!1427)) (array_inv!23866 (_values!5924 thiss!1427)) e!576600))))

(declare-fun b!1023435 () Bool)

(declare-fun e!576595 () Bool)

(declare-fun mapRes!37284 () Bool)

(assert (=> b!1023435 (= e!576600 (and e!576595 mapRes!37284))))

(declare-fun condMapEmpty!37284 () Bool)

(declare-fun mapDefault!37284 () ValueCell!11252)

(assert (=> b!1023435 (= condMapEmpty!37284 (= (arr!30764 (_values!5924 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11252)) mapDefault!37284)))))

(declare-fun mapIsEmpty!37284 () Bool)

(assert (=> mapIsEmpty!37284 mapRes!37284))

(declare-fun b!1023436 () Bool)

(declare-fun res!685269 () Bool)

(assert (=> b!1023436 (=> (not res!685269) (not e!576599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023436 (= res!685269 (validMask!0 (mask!29548 thiss!1427)))))

(declare-fun res!685271 () Bool)

(assert (=> start!89384 (=> (not res!685271) (not e!576599))))

(declare-fun valid!1948 (LongMapFixedSize!5098) Bool)

(assert (=> start!89384 (= res!685271 (valid!1948 thiss!1427))))

(assert (=> start!89384 e!576599))

(assert (=> start!89384 e!576597))

(assert (=> start!89384 true))

(declare-fun mapNonEmpty!37284 () Bool)

(declare-fun tp!71608 () Bool)

(declare-fun e!576598 () Bool)

(assert (=> mapNonEmpty!37284 (= mapRes!37284 (and tp!71608 e!576598))))

(declare-fun mapValue!37284 () ValueCell!11252)

(declare-fun mapRest!37284 () (Array (_ BitVec 32) ValueCell!11252))

(declare-fun mapKey!37284 () (_ BitVec 32))

(assert (=> mapNonEmpty!37284 (= (arr!30764 (_values!5924 thiss!1427)) (store mapRest!37284 mapKey!37284 mapValue!37284))))

(declare-fun b!1023437 () Bool)

(declare-fun res!685268 () Bool)

(assert (=> b!1023437 (=> (not res!685268) (not e!576599))))

(assert (=> b!1023437 (= res!685268 (and (= (size!31276 (_values!5924 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29548 thiss!1427))) (= (size!31275 (_keys!11084 thiss!1427)) (size!31276 (_values!5924 thiss!1427))) (bvsge (mask!29548 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5633 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5633 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023438 () Bool)

(assert (=> b!1023438 (= e!576599 false)))

(declare-fun lt!450695 () Bool)

(declare-datatypes ((List!21660 0))(
  ( (Nil!21657) (Cons!21656 (h!22863 (_ BitVec 64)) (t!30666 List!21660)) )
))
(declare-fun arrayNoDuplicates!0 (array!63915 (_ BitVec 32) List!21660) Bool)

(assert (=> b!1023438 (= lt!450695 (arrayNoDuplicates!0 (_keys!11084 thiss!1427) #b00000000000000000000000000000000 Nil!21657))))

(declare-fun b!1023439 () Bool)

(assert (=> b!1023439 (= e!576595 tp_is_empty!23911)))

(declare-fun b!1023440 () Bool)

(assert (=> b!1023440 (= e!576598 tp_is_empty!23911)))

(assert (= (and start!89384 res!685271) b!1023433))

(assert (= (and b!1023433 res!685267) b!1023436))

(assert (= (and b!1023436 res!685269) b!1023437))

(assert (= (and b!1023437 res!685268) b!1023432))

(assert (= (and b!1023432 res!685270) b!1023438))

(assert (= (and b!1023435 condMapEmpty!37284) mapIsEmpty!37284))

(assert (= (and b!1023435 (not condMapEmpty!37284)) mapNonEmpty!37284))

(get-info :version)

(assert (= (and mapNonEmpty!37284 ((_ is ValueCellFull!11252) mapValue!37284)) b!1023440))

(assert (= (and b!1023435 ((_ is ValueCellFull!11252) mapDefault!37284)) b!1023439))

(assert (= b!1023434 b!1023435))

(assert (= start!89384 b!1023434))

(declare-fun m!942985 () Bool)

(assert (=> b!1023434 m!942985))

(declare-fun m!942987 () Bool)

(assert (=> b!1023434 m!942987))

(declare-fun m!942989 () Bool)

(assert (=> b!1023432 m!942989))

(declare-fun m!942991 () Bool)

(assert (=> b!1023436 m!942991))

(declare-fun m!942993 () Bool)

(assert (=> b!1023438 m!942993))

(declare-fun m!942995 () Bool)

(assert (=> start!89384 m!942995))

(declare-fun m!942997 () Bool)

(assert (=> mapNonEmpty!37284 m!942997))

(check-sat (not mapNonEmpty!37284) (not b!1023432) (not b!1023434) (not b!1023436) tp_is_empty!23911 (not start!89384) (not b_next!20191) b_and!32399 (not b!1023438))
(check-sat b_and!32399 (not b_next!20191))
