; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89172 () Bool)

(assert start!89172)

(declare-fun b!1022422 () Bool)

(declare-fun b_free!20213 () Bool)

(declare-fun b_next!20213 () Bool)

(assert (=> b!1022422 (= b_free!20213 (not b_next!20213))))

(declare-fun tp!71673 () Bool)

(declare-fun b_and!32411 () Bool)

(assert (=> b!1022422 (= tp!71673 b_and!32411)))

(declare-fun mapIsEmpty!37317 () Bool)

(declare-fun mapRes!37317 () Bool)

(assert (=> mapIsEmpty!37317 mapRes!37317))

(declare-fun b!1022414 () Bool)

(declare-fun res!684924 () Bool)

(declare-fun e!575955 () Bool)

(assert (=> b!1022414 (=> (not res!684924) (not e!575955))))

(declare-datatypes ((V!36783 0))(
  ( (V!36784 (val!12017 Int)) )
))
(declare-datatypes ((ValueCell!11263 0))(
  ( (ValueCellFull!11263 (v!14586 V!36783)) (EmptyCell!11263) )
))
(declare-datatypes ((array!63910 0))(
  ( (array!63911 (arr!30767 (Array (_ BitVec 32) (_ BitVec 64))) (size!31278 (_ BitVec 32))) )
))
(declare-datatypes ((array!63912 0))(
  ( (array!63913 (arr!30768 (Array (_ BitVec 32) ValueCell!11263)) (size!31279 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5120 0))(
  ( (LongMapFixedSize!5121 (defaultEntry!5912 Int) (mask!29505 (_ BitVec 32)) (extraKeys!5644 (_ BitVec 32)) (zeroValue!5748 V!36783) (minValue!5748 V!36783) (_size!2615 (_ BitVec 32)) (_keys!11057 array!63910) (_values!5935 array!63912) (_vacant!2615 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5120)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022414 (= res!684924 (validMask!0 (mask!29505 thiss!1427)))))

(declare-fun b!1022415 () Bool)

(declare-fun res!684926 () Bool)

(assert (=> b!1022415 (=> (not res!684926) (not e!575955))))

(assert (=> b!1022415 (= res!684926 (and (= (size!31279 (_values!5935 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29505 thiss!1427))) (= (size!31278 (_keys!11057 thiss!1427)) (size!31279 (_values!5935 thiss!1427))) (bvsge (mask!29505 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5644 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5644 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5644 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5644 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5644 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5644 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5644 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022416 () Bool)

(declare-fun e!575951 () Bool)

(declare-fun tp_is_empty!23933 () Bool)

(assert (=> b!1022416 (= e!575951 tp_is_empty!23933)))

(declare-fun b!1022417 () Bool)

(assert (=> b!1022417 (= e!575955 false)))

(declare-fun lt!450213 () Bool)

(declare-datatypes ((List!21681 0))(
  ( (Nil!21678) (Cons!21677 (h!22875 (_ BitVec 64)) (t!30695 List!21681)) )
))
(declare-fun arrayNoDuplicates!0 (array!63910 (_ BitVec 32) List!21681) Bool)

(assert (=> b!1022417 (= lt!450213 (arrayNoDuplicates!0 (_keys!11057 thiss!1427) #b00000000000000000000000000000000 Nil!21678))))

(declare-fun b!1022418 () Bool)

(declare-fun e!575953 () Bool)

(assert (=> b!1022418 (= e!575953 tp_is_empty!23933)))

(declare-fun res!684923 () Bool)

(assert (=> start!89172 (=> (not res!684923) (not e!575955))))

(declare-fun valid!1950 (LongMapFixedSize!5120) Bool)

(assert (=> start!89172 (= res!684923 (valid!1950 thiss!1427))))

(assert (=> start!89172 e!575955))

(declare-fun e!575952 () Bool)

(assert (=> start!89172 e!575952))

(assert (=> start!89172 true))

(declare-fun b!1022419 () Bool)

(declare-fun res!684925 () Bool)

(assert (=> b!1022419 (=> (not res!684925) (not e!575955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63910 (_ BitVec 32)) Bool)

(assert (=> b!1022419 (= res!684925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11057 thiss!1427) (mask!29505 thiss!1427)))))

(declare-fun mapNonEmpty!37317 () Bool)

(declare-fun tp!71674 () Bool)

(assert (=> mapNonEmpty!37317 (= mapRes!37317 (and tp!71674 e!575953))))

(declare-fun mapRest!37317 () (Array (_ BitVec 32) ValueCell!11263))

(declare-fun mapKey!37317 () (_ BitVec 32))

(declare-fun mapValue!37317 () ValueCell!11263)

(assert (=> mapNonEmpty!37317 (= (arr!30768 (_values!5935 thiss!1427)) (store mapRest!37317 mapKey!37317 mapValue!37317))))

(declare-fun b!1022420 () Bool)

(declare-fun e!575954 () Bool)

(assert (=> b!1022420 (= e!575954 (and e!575951 mapRes!37317))))

(declare-fun condMapEmpty!37317 () Bool)

(declare-fun mapDefault!37317 () ValueCell!11263)

