; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89214 () Bool)

(assert start!89214)

(declare-fun b!1022774 () Bool)

(declare-fun b_free!20257 () Bool)

(declare-fun b_next!20257 () Bool)

(assert (=> b!1022774 (= b_free!20257 (not b_next!20257))))

(declare-fun tp!71806 () Bool)

(declare-fun b_and!32453 () Bool)

(assert (=> b!1022774 (= tp!71806 b_and!32453)))

(declare-fun b!1022773 () Bool)

(declare-fun e!576259 () Bool)

(assert (=> b!1022773 (= e!576259 false)))

(declare-fun lt!450151 () Bool)

(declare-datatypes ((V!36843 0))(
  ( (V!36844 (val!12039 Int)) )
))
(declare-datatypes ((ValueCell!11285 0))(
  ( (ValueCellFull!11285 (v!14607 V!36843)) (EmptyCell!11285) )
))
(declare-datatypes ((array!63937 0))(
  ( (array!63938 (arr!30780 (Array (_ BitVec 32) (_ BitVec 64))) (size!31293 (_ BitVec 32))) )
))
(declare-datatypes ((array!63939 0))(
  ( (array!63940 (arr!30781 (Array (_ BitVec 32) ValueCell!11285)) (size!31294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5164 0))(
  ( (LongMapFixedSize!5165 (defaultEntry!5934 Int) (mask!29538 (_ BitVec 32)) (extraKeys!5666 (_ BitVec 32)) (zeroValue!5770 V!36843) (minValue!5770 V!36843) (_size!2637 (_ BitVec 32)) (_keys!11075 array!63937) (_values!5957 array!63939) (_vacant!2637 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5164)

(declare-datatypes ((List!21730 0))(
  ( (Nil!21727) (Cons!21726 (h!22924 (_ BitVec 64)) (t!30759 List!21730)) )
))
(declare-fun arrayNoDuplicates!0 (array!63937 (_ BitVec 32) List!21730) Bool)

(assert (=> b!1022773 (= lt!450151 (arrayNoDuplicates!0 (_keys!11075 thiss!1427) #b00000000000000000000000000000000 Nil!21727))))

(declare-fun tp_is_empty!23977 () Bool)

(declare-fun e!576255 () Bool)

(declare-fun e!576257 () Bool)

(declare-fun array_inv!23875 (array!63937) Bool)

(declare-fun array_inv!23876 (array!63939) Bool)

(assert (=> b!1022774 (= e!576255 (and tp!71806 tp_is_empty!23977 (array_inv!23875 (_keys!11075 thiss!1427)) (array_inv!23876 (_values!5957 thiss!1427)) e!576257))))

(declare-fun mapIsEmpty!37383 () Bool)

(declare-fun mapRes!37383 () Bool)

(assert (=> mapIsEmpty!37383 mapRes!37383))

(declare-fun mapNonEmpty!37383 () Bool)

(declare-fun tp!71805 () Bool)

(declare-fun e!576256 () Bool)

(assert (=> mapNonEmpty!37383 (= mapRes!37383 (and tp!71805 e!576256))))

(declare-fun mapKey!37383 () (_ BitVec 32))

(declare-fun mapRest!37383 () (Array (_ BitVec 32) ValueCell!11285))

(declare-fun mapValue!37383 () ValueCell!11285)

(assert (=> mapNonEmpty!37383 (= (arr!30781 (_values!5957 thiss!1427)) (store mapRest!37383 mapKey!37383 mapValue!37383))))

(declare-fun b!1022775 () Bool)

(assert (=> b!1022775 (= e!576256 tp_is_empty!23977)))

(declare-fun b!1022776 () Bool)

(declare-fun res!685077 () Bool)

(assert (=> b!1022776 (=> (not res!685077) (not e!576259))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022776 (= res!685077 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022777 () Bool)

(declare-fun e!576258 () Bool)

(assert (=> b!1022777 (= e!576257 (and e!576258 mapRes!37383))))

(declare-fun condMapEmpty!37383 () Bool)

(declare-fun mapDefault!37383 () ValueCell!11285)

(assert (=> b!1022777 (= condMapEmpty!37383 (= (arr!30781 (_values!5957 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11285)) mapDefault!37383)))))

(declare-fun b!1022778 () Bool)

(declare-fun res!685080 () Bool)

(assert (=> b!1022778 (=> (not res!685080) (not e!576259))))

(assert (=> b!1022778 (= res!685080 (and (= (size!31294 (_values!5957 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29538 thiss!1427))) (= (size!31293 (_keys!11075 thiss!1427)) (size!31294 (_values!5957 thiss!1427))) (bvsge (mask!29538 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5666 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5666 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5666 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022779 () Bool)

(assert (=> b!1022779 (= e!576258 tp_is_empty!23977)))

(declare-fun res!685078 () Bool)

(assert (=> start!89214 (=> (not res!685078) (not e!576259))))

(declare-fun valid!1966 (LongMapFixedSize!5164) Bool)

(assert (=> start!89214 (= res!685078 (valid!1966 thiss!1427))))

(assert (=> start!89214 e!576259))

(assert (=> start!89214 e!576255))

(assert (=> start!89214 true))

(declare-fun b!1022780 () Bool)

(declare-fun res!685079 () Bool)

(assert (=> b!1022780 (=> (not res!685079) (not e!576259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63937 (_ BitVec 32)) Bool)

(assert (=> b!1022780 (= res!685079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11075 thiss!1427) (mask!29538 thiss!1427)))))

(declare-fun b!1022781 () Bool)

(declare-fun res!685081 () Bool)

(assert (=> b!1022781 (=> (not res!685081) (not e!576259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022781 (= res!685081 (validMask!0 (mask!29538 thiss!1427)))))

(assert (= (and start!89214 res!685078) b!1022776))

(assert (= (and b!1022776 res!685077) b!1022781))

(assert (= (and b!1022781 res!685081) b!1022778))

(assert (= (and b!1022778 res!685080) b!1022780))

(assert (= (and b!1022780 res!685079) b!1022773))

(assert (= (and b!1022777 condMapEmpty!37383) mapIsEmpty!37383))

(assert (= (and b!1022777 (not condMapEmpty!37383)) mapNonEmpty!37383))

(get-info :version)

(assert (= (and mapNonEmpty!37383 ((_ is ValueCellFull!11285) mapValue!37383)) b!1022775))

(assert (= (and b!1022777 ((_ is ValueCellFull!11285) mapDefault!37383)) b!1022779))

(assert (= b!1022774 b!1022777))

(assert (= start!89214 b!1022774))

(declare-fun m!941235 () Bool)

(assert (=> start!89214 m!941235))

(declare-fun m!941237 () Bool)

(assert (=> b!1022781 m!941237))

(declare-fun m!941239 () Bool)

(assert (=> b!1022773 m!941239))

(declare-fun m!941241 () Bool)

(assert (=> mapNonEmpty!37383 m!941241))

(declare-fun m!941243 () Bool)

(assert (=> b!1022774 m!941243))

(declare-fun m!941245 () Bool)

(assert (=> b!1022774 m!941245))

(declare-fun m!941247 () Bool)

(assert (=> b!1022780 m!941247))

(check-sat (not mapNonEmpty!37383) (not b_next!20257) (not b!1022780) (not start!89214) tp_is_empty!23977 b_and!32453 (not b!1022781) (not b!1022774) (not b!1022773))
(check-sat b_and!32453 (not b_next!20257))
