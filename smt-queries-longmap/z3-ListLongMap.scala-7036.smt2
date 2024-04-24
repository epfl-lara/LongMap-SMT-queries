; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89462 () Bool)

(assert start!89462)

(declare-fun b!1024407 () Bool)

(declare-fun b_free!20269 () Bool)

(declare-fun b_next!20269 () Bool)

(assert (=> b!1024407 (= b_free!20269 (not b_next!20269))))

(declare-fun tp!71842 () Bool)

(declare-fun b_and!32501 () Bool)

(assert (=> b!1024407 (= tp!71842 b_and!32501)))

(declare-fun b!1024401 () Bool)

(declare-fun e!577300 () Bool)

(declare-fun tp_is_empty!23989 () Bool)

(assert (=> b!1024401 (= e!577300 tp_is_empty!23989)))

(declare-fun mapIsEmpty!37401 () Bool)

(declare-fun mapRes!37401 () Bool)

(assert (=> mapIsEmpty!37401 mapRes!37401))

(declare-fun b!1024402 () Bool)

(declare-fun res!685746 () Bool)

(declare-fun e!577301 () Bool)

(assert (=> b!1024402 (=> (not res!685746) (not e!577301))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024402 (= res!685746 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024403 () Bool)

(declare-fun res!685745 () Bool)

(assert (=> b!1024403 (=> (not res!685745) (not e!577301))))

(declare-datatypes ((V!36859 0))(
  ( (V!36860 (val!12045 Int)) )
))
(declare-datatypes ((ValueCell!11291 0))(
  ( (ValueCellFull!11291 (v!14610 V!36859)) (EmptyCell!11291) )
))
(declare-datatypes ((array!64071 0))(
  ( (array!64072 (arr!30841 (Array (_ BitVec 32) (_ BitVec 64))) (size!31353 (_ BitVec 32))) )
))
(declare-datatypes ((array!64073 0))(
  ( (array!64074 (arr!30842 (Array (_ BitVec 32) ValueCell!11291)) (size!31354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5176 0))(
  ( (LongMapFixedSize!5177 (defaultEntry!5940 Int) (mask!29613 (_ BitVec 32)) (extraKeys!5672 (_ BitVec 32)) (zeroValue!5776 V!36859) (minValue!5776 V!36859) (_size!2643 (_ BitVec 32)) (_keys!11123 array!64071) (_values!5963 array!64073) (_vacant!2643 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5176)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024403 (= res!685745 (validMask!0 (mask!29613 thiss!1427)))))

(declare-fun b!1024404 () Bool)

(declare-fun res!685744 () Bool)

(assert (=> b!1024404 (=> (not res!685744) (not e!577301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64071 (_ BitVec 32)) Bool)

(assert (=> b!1024404 (= res!685744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11123 thiss!1427) (mask!29613 thiss!1427)))))

(declare-fun b!1024405 () Bool)

(declare-fun res!685748 () Bool)

(assert (=> b!1024405 (=> (not res!685748) (not e!577301))))

(assert (=> b!1024405 (= res!685748 (and (= (size!31354 (_values!5963 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29613 thiss!1427))) (= (size!31353 (_keys!11123 thiss!1427)) (size!31354 (_values!5963 thiss!1427))) (bvsge (mask!29613 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5672 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5672 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5672 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024406 () Bool)

(declare-fun e!577299 () Bool)

(declare-fun e!577298 () Bool)

(assert (=> b!1024406 (= e!577299 (and e!577298 mapRes!37401))))

(declare-fun condMapEmpty!37401 () Bool)

(declare-fun mapDefault!37401 () ValueCell!11291)

(assert (=> b!1024406 (= condMapEmpty!37401 (= (arr!30842 (_values!5963 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11291)) mapDefault!37401)))))

(declare-fun e!577297 () Bool)

(declare-fun array_inv!23917 (array!64071) Bool)

(declare-fun array_inv!23918 (array!64073) Bool)

(assert (=> b!1024407 (= e!577297 (and tp!71842 tp_is_empty!23989 (array_inv!23917 (_keys!11123 thiss!1427)) (array_inv!23918 (_values!5963 thiss!1427)) e!577299))))

(declare-fun b!1024408 () Bool)

(assert (=> b!1024408 (= e!577301 false)))

(declare-fun lt!450884 () Bool)

(declare-datatypes ((List!21688 0))(
  ( (Nil!21685) (Cons!21684 (h!22891 (_ BitVec 64)) (t!30718 List!21688)) )
))
(declare-fun arrayNoDuplicates!0 (array!64071 (_ BitVec 32) List!21688) Bool)

(assert (=> b!1024408 (= lt!450884 (arrayNoDuplicates!0 (_keys!11123 thiss!1427) #b00000000000000000000000000000000 Nil!21685))))

(declare-fun res!685747 () Bool)

(assert (=> start!89462 (=> (not res!685747) (not e!577301))))

(declare-fun valid!1979 (LongMapFixedSize!5176) Bool)

(assert (=> start!89462 (= res!685747 (valid!1979 thiss!1427))))

(assert (=> start!89462 e!577301))

(assert (=> start!89462 e!577297))

(assert (=> start!89462 true))

(declare-fun b!1024409 () Bool)

(assert (=> b!1024409 (= e!577298 tp_is_empty!23989)))

(declare-fun mapNonEmpty!37401 () Bool)

(declare-fun tp!71841 () Bool)

(assert (=> mapNonEmpty!37401 (= mapRes!37401 (and tp!71841 e!577300))))

(declare-fun mapKey!37401 () (_ BitVec 32))

(declare-fun mapValue!37401 () ValueCell!11291)

(declare-fun mapRest!37401 () (Array (_ BitVec 32) ValueCell!11291))

(assert (=> mapNonEmpty!37401 (= (arr!30842 (_values!5963 thiss!1427)) (store mapRest!37401 mapKey!37401 mapValue!37401))))

(assert (= (and start!89462 res!685747) b!1024402))

(assert (= (and b!1024402 res!685746) b!1024403))

(assert (= (and b!1024403 res!685745) b!1024405))

(assert (= (and b!1024405 res!685748) b!1024404))

(assert (= (and b!1024404 res!685744) b!1024408))

(assert (= (and b!1024406 condMapEmpty!37401) mapIsEmpty!37401))

(assert (= (and b!1024406 (not condMapEmpty!37401)) mapNonEmpty!37401))

(get-info :version)

(assert (= (and mapNonEmpty!37401 ((_ is ValueCellFull!11291) mapValue!37401)) b!1024401))

(assert (= (and b!1024406 ((_ is ValueCellFull!11291) mapDefault!37401)) b!1024409))

(assert (= b!1024407 b!1024406))

(assert (= start!89462 b!1024407))

(declare-fun m!943603 () Bool)

(assert (=> b!1024403 m!943603))

(declare-fun m!943605 () Bool)

(assert (=> mapNonEmpty!37401 m!943605))

(declare-fun m!943607 () Bool)

(assert (=> b!1024407 m!943607))

(declare-fun m!943609 () Bool)

(assert (=> b!1024407 m!943609))

(declare-fun m!943611 () Bool)

(assert (=> b!1024404 m!943611))

(declare-fun m!943613 () Bool)

(assert (=> b!1024408 m!943613))

(declare-fun m!943615 () Bool)

(assert (=> start!89462 m!943615))

(check-sat (not b!1024404) b_and!32501 (not b!1024407) tp_is_empty!23989 (not b!1024403) (not b!1024408) (not b_next!20269) (not mapNonEmpty!37401) (not start!89462))
(check-sat b_and!32501 (not b_next!20269))
