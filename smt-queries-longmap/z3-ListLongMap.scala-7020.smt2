; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89366 () Bool)

(assert start!89366)

(declare-fun b!1023196 () Bool)

(declare-fun b_free!20173 () Bool)

(declare-fun b_next!20173 () Bool)

(assert (=> b!1023196 (= b_free!20173 (not b_next!20173))))

(declare-fun tp!71554 () Bool)

(declare-fun b_and!32381 () Bool)

(assert (=> b!1023196 (= tp!71554 b_and!32381)))

(declare-fun b!1023189 () Bool)

(declare-fun res!685135 () Bool)

(declare-fun e!576435 () Bool)

(assert (=> b!1023189 (=> (not res!685135) (not e!576435))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023189 (= res!685135 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37257 () Bool)

(declare-fun mapRes!37257 () Bool)

(declare-fun tp!71553 () Bool)

(declare-fun e!576436 () Bool)

(assert (=> mapNonEmpty!37257 (= mapRes!37257 (and tp!71553 e!576436))))

(declare-datatypes ((V!36731 0))(
  ( (V!36732 (val!11997 Int)) )
))
(declare-datatypes ((ValueCell!11243 0))(
  ( (ValueCellFull!11243 (v!14562 V!36731)) (EmptyCell!11243) )
))
(declare-fun mapRest!37257 () (Array (_ BitVec 32) ValueCell!11243))

(declare-fun mapKey!37257 () (_ BitVec 32))

(declare-datatypes ((array!63879 0))(
  ( (array!63880 (arr!30745 (Array (_ BitVec 32) (_ BitVec 64))) (size!31257 (_ BitVec 32))) )
))
(declare-datatypes ((array!63881 0))(
  ( (array!63882 (arr!30746 (Array (_ BitVec 32) ValueCell!11243)) (size!31258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5080 0))(
  ( (LongMapFixedSize!5081 (defaultEntry!5892 Int) (mask!29533 (_ BitVec 32)) (extraKeys!5624 (_ BitVec 32)) (zeroValue!5728 V!36731) (minValue!5728 V!36731) (_size!2595 (_ BitVec 32)) (_keys!11075 array!63879) (_values!5915 array!63881) (_vacant!2595 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5080)

(declare-fun mapValue!37257 () ValueCell!11243)

(assert (=> mapNonEmpty!37257 (= (arr!30746 (_values!5915 thiss!1427)) (store mapRest!37257 mapKey!37257 mapValue!37257))))

(declare-fun b!1023191 () Bool)

(declare-fun e!576433 () Bool)

(declare-fun tp_is_empty!23893 () Bool)

(assert (=> b!1023191 (= e!576433 tp_is_empty!23893)))

(declare-fun b!1023192 () Bool)

(assert (=> b!1023192 (= e!576436 tp_is_empty!23893)))

(declare-fun b!1023193 () Bool)

(declare-fun res!685134 () Bool)

(assert (=> b!1023193 (=> (not res!685134) (not e!576435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63879 (_ BitVec 32)) Bool)

(assert (=> b!1023193 (= res!685134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11075 thiss!1427) (mask!29533 thiss!1427)))))

(declare-fun mapIsEmpty!37257 () Bool)

(assert (=> mapIsEmpty!37257 mapRes!37257))

(declare-fun b!1023194 () Bool)

(declare-fun res!685133 () Bool)

(assert (=> b!1023194 (=> (not res!685133) (not e!576435))))

(assert (=> b!1023194 (= res!685133 (and (= (size!31258 (_values!5915 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29533 thiss!1427))) (= (size!31257 (_keys!11075 thiss!1427)) (size!31258 (_values!5915 thiss!1427))) (bvsge (mask!29533 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5624 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5624 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023195 () Bool)

(declare-fun res!685132 () Bool)

(assert (=> b!1023195 (=> (not res!685132) (not e!576435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023195 (= res!685132 (validMask!0 (mask!29533 thiss!1427)))))

(declare-fun e!576434 () Bool)

(declare-fun e!576438 () Bool)

(declare-fun array_inv!23857 (array!63879) Bool)

(declare-fun array_inv!23858 (array!63881) Bool)

(assert (=> b!1023196 (= e!576434 (and tp!71554 tp_is_empty!23893 (array_inv!23857 (_keys!11075 thiss!1427)) (array_inv!23858 (_values!5915 thiss!1427)) e!576438))))

(declare-fun b!1023197 () Bool)

(assert (=> b!1023197 (= e!576438 (and e!576433 mapRes!37257))))

(declare-fun condMapEmpty!37257 () Bool)

(declare-fun mapDefault!37257 () ValueCell!11243)

(assert (=> b!1023197 (= condMapEmpty!37257 (= (arr!30746 (_values!5915 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11243)) mapDefault!37257)))))

(declare-fun res!685136 () Bool)

(assert (=> start!89366 (=> (not res!685136) (not e!576435))))

(declare-fun valid!1942 (LongMapFixedSize!5080) Bool)

(assert (=> start!89366 (= res!685136 (valid!1942 thiss!1427))))

(assert (=> start!89366 e!576435))

(assert (=> start!89366 e!576434))

(assert (=> start!89366 true))

(declare-fun b!1023190 () Bool)

(assert (=> b!1023190 (= e!576435 false)))

(declare-fun lt!450668 () Bool)

(declare-datatypes ((List!21654 0))(
  ( (Nil!21651) (Cons!21650 (h!22857 (_ BitVec 64)) (t!30660 List!21654)) )
))
(declare-fun arrayNoDuplicates!0 (array!63879 (_ BitVec 32) List!21654) Bool)

(assert (=> b!1023190 (= lt!450668 (arrayNoDuplicates!0 (_keys!11075 thiss!1427) #b00000000000000000000000000000000 Nil!21651))))

(assert (= (and start!89366 res!685136) b!1023189))

(assert (= (and b!1023189 res!685135) b!1023195))

(assert (= (and b!1023195 res!685132) b!1023194))

(assert (= (and b!1023194 res!685133) b!1023193))

(assert (= (and b!1023193 res!685134) b!1023190))

(assert (= (and b!1023197 condMapEmpty!37257) mapIsEmpty!37257))

(assert (= (and b!1023197 (not condMapEmpty!37257)) mapNonEmpty!37257))

(get-info :version)

(assert (= (and mapNonEmpty!37257 ((_ is ValueCellFull!11243) mapValue!37257)) b!1023192))

(assert (= (and b!1023197 ((_ is ValueCellFull!11243) mapDefault!37257)) b!1023191))

(assert (= b!1023196 b!1023197))

(assert (= start!89366 b!1023196))

(declare-fun m!942859 () Bool)

(assert (=> mapNonEmpty!37257 m!942859))

(declare-fun m!942861 () Bool)

(assert (=> start!89366 m!942861))

(declare-fun m!942863 () Bool)

(assert (=> b!1023193 m!942863))

(declare-fun m!942865 () Bool)

(assert (=> b!1023195 m!942865))

(declare-fun m!942867 () Bool)

(assert (=> b!1023190 m!942867))

(declare-fun m!942869 () Bool)

(assert (=> b!1023196 m!942869))

(declare-fun m!942871 () Bool)

(assert (=> b!1023196 m!942871))

(check-sat (not b!1023195) (not b_next!20173) (not b!1023190) (not start!89366) (not mapNonEmpty!37257) (not b!1023193) (not b!1023196) tp_is_empty!23893 b_and!32381)
(check-sat b_and!32381 (not b_next!20173))
