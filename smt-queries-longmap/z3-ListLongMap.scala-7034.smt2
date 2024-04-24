; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89450 () Bool)

(assert start!89450)

(declare-fun b!1024246 () Bool)

(declare-fun b_free!20257 () Bool)

(declare-fun b_next!20257 () Bool)

(assert (=> b!1024246 (= b_free!20257 (not b_next!20257))))

(declare-fun tp!71806 () Bool)

(declare-fun b_and!32489 () Bool)

(assert (=> b!1024246 (= tp!71806 b_and!32489)))

(declare-fun mapIsEmpty!37383 () Bool)

(declare-fun mapRes!37383 () Bool)

(assert (=> mapIsEmpty!37383 mapRes!37383))

(declare-fun b!1024239 () Bool)

(declare-fun e!577190 () Bool)

(declare-fun tp_is_empty!23977 () Bool)

(assert (=> b!1024239 (= e!577190 tp_is_empty!23977)))

(declare-fun b!1024240 () Bool)

(declare-fun res!685657 () Bool)

(declare-fun e!577191 () Bool)

(assert (=> b!1024240 (=> (not res!685657) (not e!577191))))

(declare-datatypes ((V!36843 0))(
  ( (V!36844 (val!12039 Int)) )
))
(declare-datatypes ((ValueCell!11285 0))(
  ( (ValueCellFull!11285 (v!14604 V!36843)) (EmptyCell!11285) )
))
(declare-datatypes ((array!64047 0))(
  ( (array!64048 (arr!30829 (Array (_ BitVec 32) (_ BitVec 64))) (size!31341 (_ BitVec 32))) )
))
(declare-datatypes ((array!64049 0))(
  ( (array!64050 (arr!30830 (Array (_ BitVec 32) ValueCell!11285)) (size!31342 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5164 0))(
  ( (LongMapFixedSize!5165 (defaultEntry!5934 Int) (mask!29603 (_ BitVec 32)) (extraKeys!5666 (_ BitVec 32)) (zeroValue!5770 V!36843) (minValue!5770 V!36843) (_size!2637 (_ BitVec 32)) (_keys!11117 array!64047) (_values!5957 array!64049) (_vacant!2637 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5164)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64047 (_ BitVec 32)) Bool)

(assert (=> b!1024240 (= res!685657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11117 thiss!1427) (mask!29603 thiss!1427)))))

(declare-fun res!685656 () Bool)

(assert (=> start!89450 (=> (not res!685656) (not e!577191))))

(declare-fun valid!1975 (LongMapFixedSize!5164) Bool)

(assert (=> start!89450 (= res!685656 (valid!1975 thiss!1427))))

(assert (=> start!89450 e!577191))

(declare-fun e!577189 () Bool)

(assert (=> start!89450 e!577189))

(assert (=> start!89450 true))

(declare-fun b!1024241 () Bool)

(declare-fun e!577192 () Bool)

(declare-fun e!577194 () Bool)

(assert (=> b!1024241 (= e!577192 (and e!577194 mapRes!37383))))

(declare-fun condMapEmpty!37383 () Bool)

(declare-fun mapDefault!37383 () ValueCell!11285)

(assert (=> b!1024241 (= condMapEmpty!37383 (= (arr!30830 (_values!5957 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11285)) mapDefault!37383)))))

(declare-fun b!1024242 () Bool)

(declare-fun res!685654 () Bool)

(assert (=> b!1024242 (=> (not res!685654) (not e!577191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024242 (= res!685654 (validMask!0 (mask!29603 thiss!1427)))))

(declare-fun b!1024243 () Bool)

(assert (=> b!1024243 (= e!577191 false)))

(declare-fun lt!450866 () Bool)

(declare-datatypes ((List!21685 0))(
  ( (Nil!21682) (Cons!21681 (h!22888 (_ BitVec 64)) (t!30715 List!21685)) )
))
(declare-fun arrayNoDuplicates!0 (array!64047 (_ BitVec 32) List!21685) Bool)

(assert (=> b!1024243 (= lt!450866 (arrayNoDuplicates!0 (_keys!11117 thiss!1427) #b00000000000000000000000000000000 Nil!21682))))

(declare-fun b!1024244 () Bool)

(declare-fun res!685655 () Bool)

(assert (=> b!1024244 (=> (not res!685655) (not e!577191))))

(assert (=> b!1024244 (= res!685655 (and (= (size!31342 (_values!5957 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29603 thiss!1427))) (= (size!31341 (_keys!11117 thiss!1427)) (size!31342 (_values!5957 thiss!1427))) (bvsge (mask!29603 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5666 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5666 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024245 () Bool)

(assert (=> b!1024245 (= e!577194 tp_is_empty!23977)))

(declare-fun array_inv!23911 (array!64047) Bool)

(declare-fun array_inv!23912 (array!64049) Bool)

(assert (=> b!1024246 (= e!577189 (and tp!71806 tp_is_empty!23977 (array_inv!23911 (_keys!11117 thiss!1427)) (array_inv!23912 (_values!5957 thiss!1427)) e!577192))))

(declare-fun b!1024247 () Bool)

(declare-fun res!685658 () Bool)

(assert (=> b!1024247 (=> (not res!685658) (not e!577191))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024247 (= res!685658 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!37383 () Bool)

(declare-fun tp!71805 () Bool)

(assert (=> mapNonEmpty!37383 (= mapRes!37383 (and tp!71805 e!577190))))

(declare-fun mapKey!37383 () (_ BitVec 32))

(declare-fun mapRest!37383 () (Array (_ BitVec 32) ValueCell!11285))

(declare-fun mapValue!37383 () ValueCell!11285)

(assert (=> mapNonEmpty!37383 (= (arr!30830 (_values!5957 thiss!1427)) (store mapRest!37383 mapKey!37383 mapValue!37383))))

(assert (= (and start!89450 res!685656) b!1024247))

(assert (= (and b!1024247 res!685658) b!1024242))

(assert (= (and b!1024242 res!685654) b!1024244))

(assert (= (and b!1024244 res!685655) b!1024240))

(assert (= (and b!1024240 res!685657) b!1024243))

(assert (= (and b!1024241 condMapEmpty!37383) mapIsEmpty!37383))

(assert (= (and b!1024241 (not condMapEmpty!37383)) mapNonEmpty!37383))

(get-info :version)

(assert (= (and mapNonEmpty!37383 ((_ is ValueCellFull!11285) mapValue!37383)) b!1024239))

(assert (= (and b!1024241 ((_ is ValueCellFull!11285) mapDefault!37383)) b!1024245))

(assert (= b!1024246 b!1024241))

(assert (= start!89450 b!1024246))

(declare-fun m!943519 () Bool)

(assert (=> mapNonEmpty!37383 m!943519))

(declare-fun m!943521 () Bool)

(assert (=> b!1024246 m!943521))

(declare-fun m!943523 () Bool)

(assert (=> b!1024246 m!943523))

(declare-fun m!943525 () Bool)

(assert (=> b!1024240 m!943525))

(declare-fun m!943527 () Bool)

(assert (=> b!1024242 m!943527))

(declare-fun m!943529 () Bool)

(assert (=> b!1024243 m!943529))

(declare-fun m!943531 () Bool)

(assert (=> start!89450 m!943531))

(check-sat (not start!89450) (not b!1024240) tp_is_empty!23977 (not b_next!20257) b_and!32489 (not b!1024242) (not b!1024243) (not b!1024246) (not mapNonEmpty!37383))
(check-sat b_and!32489 (not b_next!20257))
