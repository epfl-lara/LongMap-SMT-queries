; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89456 () Bool)

(assert start!89456)

(declare-fun b!1024323 () Bool)

(declare-fun b_free!20263 () Bool)

(declare-fun b_next!20263 () Bool)

(assert (=> b!1024323 (= b_free!20263 (not b_next!20263))))

(declare-fun tp!71824 () Bool)

(declare-fun b_and!32495 () Bool)

(assert (=> b!1024323 (= tp!71824 b_and!32495)))

(declare-fun b!1024320 () Bool)

(declare-fun e!577243 () Bool)

(declare-fun tp_is_empty!23983 () Bool)

(assert (=> b!1024320 (= e!577243 tp_is_empty!23983)))

(declare-fun mapIsEmpty!37392 () Bool)

(declare-fun mapRes!37392 () Bool)

(assert (=> mapIsEmpty!37392 mapRes!37392))

(declare-fun b!1024321 () Bool)

(declare-fun res!685702 () Bool)

(declare-fun e!577244 () Bool)

(assert (=> b!1024321 (=> (not res!685702) (not e!577244))))

(declare-datatypes ((V!36851 0))(
  ( (V!36852 (val!12042 Int)) )
))
(declare-datatypes ((ValueCell!11288 0))(
  ( (ValueCellFull!11288 (v!14607 V!36851)) (EmptyCell!11288) )
))
(declare-datatypes ((array!64059 0))(
  ( (array!64060 (arr!30835 (Array (_ BitVec 32) (_ BitVec 64))) (size!31347 (_ BitVec 32))) )
))
(declare-datatypes ((array!64061 0))(
  ( (array!64062 (arr!30836 (Array (_ BitVec 32) ValueCell!11288)) (size!31348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5170 0))(
  ( (LongMapFixedSize!5171 (defaultEntry!5937 Int) (mask!29608 (_ BitVec 32)) (extraKeys!5669 (_ BitVec 32)) (zeroValue!5773 V!36851) (minValue!5773 V!36851) (_size!2640 (_ BitVec 32)) (_keys!11120 array!64059) (_values!5960 array!64061) (_vacant!2640 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5170)

(assert (=> b!1024321 (= res!685702 (and (= (size!31348 (_values!5960 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29608 thiss!1427))) (= (size!31347 (_keys!11120 thiss!1427)) (size!31348 (_values!5960 thiss!1427))) (bvsge (mask!29608 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5669 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5669 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!577248 () Bool)

(declare-fun e!577245 () Bool)

(declare-fun array_inv!23915 (array!64059) Bool)

(declare-fun array_inv!23916 (array!64061) Bool)

(assert (=> b!1024323 (= e!577248 (and tp!71824 tp_is_empty!23983 (array_inv!23915 (_keys!11120 thiss!1427)) (array_inv!23916 (_values!5960 thiss!1427)) e!577245))))

(declare-fun b!1024324 () Bool)

(assert (=> b!1024324 (= e!577244 false)))

(declare-fun lt!450875 () Bool)

(declare-datatypes ((List!21687 0))(
  ( (Nil!21684) (Cons!21683 (h!22890 (_ BitVec 64)) (t!30717 List!21687)) )
))
(declare-fun arrayNoDuplicates!0 (array!64059 (_ BitVec 32) List!21687) Bool)

(assert (=> b!1024324 (= lt!450875 (arrayNoDuplicates!0 (_keys!11120 thiss!1427) #b00000000000000000000000000000000 Nil!21684))))

(declare-fun b!1024325 () Bool)

(declare-fun res!685703 () Bool)

(assert (=> b!1024325 (=> (not res!685703) (not e!577244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64059 (_ BitVec 32)) Bool)

(assert (=> b!1024325 (= res!685703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11120 thiss!1427) (mask!29608 thiss!1427)))))

(declare-fun res!685701 () Bool)

(assert (=> start!89456 (=> (not res!685701) (not e!577244))))

(declare-fun valid!1977 (LongMapFixedSize!5170) Bool)

(assert (=> start!89456 (= res!685701 (valid!1977 thiss!1427))))

(assert (=> start!89456 e!577244))

(assert (=> start!89456 e!577248))

(assert (=> start!89456 true))

(declare-fun b!1024322 () Bool)

(declare-fun res!685699 () Bool)

(assert (=> b!1024322 (=> (not res!685699) (not e!577244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024322 (= res!685699 (validMask!0 (mask!29608 thiss!1427)))))

(declare-fun b!1024326 () Bool)

(declare-fun e!577247 () Bool)

(assert (=> b!1024326 (= e!577247 tp_is_empty!23983)))

(declare-fun b!1024327 () Bool)

(assert (=> b!1024327 (= e!577245 (and e!577247 mapRes!37392))))

(declare-fun condMapEmpty!37392 () Bool)

(declare-fun mapDefault!37392 () ValueCell!11288)

(assert (=> b!1024327 (= condMapEmpty!37392 (= (arr!30836 (_values!5960 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11288)) mapDefault!37392)))))

(declare-fun mapNonEmpty!37392 () Bool)

(declare-fun tp!71823 () Bool)

(assert (=> mapNonEmpty!37392 (= mapRes!37392 (and tp!71823 e!577243))))

(declare-fun mapRest!37392 () (Array (_ BitVec 32) ValueCell!11288))

(declare-fun mapKey!37392 () (_ BitVec 32))

(declare-fun mapValue!37392 () ValueCell!11288)

(assert (=> mapNonEmpty!37392 (= (arr!30836 (_values!5960 thiss!1427)) (store mapRest!37392 mapKey!37392 mapValue!37392))))

(declare-fun b!1024328 () Bool)

(declare-fun res!685700 () Bool)

(assert (=> b!1024328 (=> (not res!685700) (not e!577244))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024328 (= res!685700 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!89456 res!685701) b!1024328))

(assert (= (and b!1024328 res!685700) b!1024322))

(assert (= (and b!1024322 res!685699) b!1024321))

(assert (= (and b!1024321 res!685702) b!1024325))

(assert (= (and b!1024325 res!685703) b!1024324))

(assert (= (and b!1024327 condMapEmpty!37392) mapIsEmpty!37392))

(assert (= (and b!1024327 (not condMapEmpty!37392)) mapNonEmpty!37392))

(get-info :version)

(assert (= (and mapNonEmpty!37392 ((_ is ValueCellFull!11288) mapValue!37392)) b!1024320))

(assert (= (and b!1024327 ((_ is ValueCellFull!11288) mapDefault!37392)) b!1024326))

(assert (= b!1024323 b!1024327))

(assert (= start!89456 b!1024323))

(declare-fun m!943561 () Bool)

(assert (=> start!89456 m!943561))

(declare-fun m!943563 () Bool)

(assert (=> b!1024324 m!943563))

(declare-fun m!943565 () Bool)

(assert (=> b!1024325 m!943565))

(declare-fun m!943567 () Bool)

(assert (=> mapNonEmpty!37392 m!943567))

(declare-fun m!943569 () Bool)

(assert (=> b!1024322 m!943569))

(declare-fun m!943571 () Bool)

(assert (=> b!1024323 m!943571))

(declare-fun m!943573 () Bool)

(assert (=> b!1024323 m!943573))

(check-sat (not b_next!20263) (not mapNonEmpty!37392) (not b!1024322) (not start!89456) (not b!1024325) b_and!32495 (not b!1024324) (not b!1024323) tp_is_empty!23983)
(check-sat b_and!32495 (not b_next!20263))
