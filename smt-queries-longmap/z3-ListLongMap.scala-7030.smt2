; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89194 () Bool)

(assert start!89194)

(declare-fun b!1022639 () Bool)

(declare-fun b_free!20235 () Bool)

(declare-fun b_next!20235 () Bool)

(assert (=> b!1022639 (= b_free!20235 (not b_next!20235))))

(declare-fun tp!71739 () Bool)

(declare-fun b_and!32453 () Bool)

(assert (=> b!1022639 (= tp!71739 b_and!32453)))

(declare-fun mapNonEmpty!37350 () Bool)

(declare-fun mapRes!37350 () Bool)

(declare-fun tp!71740 () Bool)

(declare-fun e!576148 () Bool)

(assert (=> mapNonEmpty!37350 (= mapRes!37350 (and tp!71740 e!576148))))

(declare-datatypes ((V!36813 0))(
  ( (V!36814 (val!12028 Int)) )
))
(declare-datatypes ((ValueCell!11274 0))(
  ( (ValueCellFull!11274 (v!14597 V!36813)) (EmptyCell!11274) )
))
(declare-fun mapRest!37350 () (Array (_ BitVec 32) ValueCell!11274))

(declare-datatypes ((array!63954 0))(
  ( (array!63955 (arr!30789 (Array (_ BitVec 32) (_ BitVec 64))) (size!31300 (_ BitVec 32))) )
))
(declare-datatypes ((array!63956 0))(
  ( (array!63957 (arr!30790 (Array (_ BitVec 32) ValueCell!11274)) (size!31301 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5142 0))(
  ( (LongMapFixedSize!5143 (defaultEntry!5923 Int) (mask!29524 (_ BitVec 32)) (extraKeys!5655 (_ BitVec 32)) (zeroValue!5759 V!36813) (minValue!5759 V!36813) (_size!2626 (_ BitVec 32)) (_keys!11068 array!63954) (_values!5946 array!63956) (_vacant!2626 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5142)

(declare-fun mapValue!37350 () ValueCell!11274)

(declare-fun mapKey!37350 () (_ BitVec 32))

(assert (=> mapNonEmpty!37350 (= (arr!30790 (_values!5946 thiss!1427)) (store mapRest!37350 mapKey!37350 mapValue!37350))))

(declare-fun b!1022635 () Bool)

(declare-fun res!684991 () Bool)

(declare-fun e!576153 () Bool)

(assert (=> b!1022635 (=> (not res!684991) (not e!576153))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022635 (= res!684991 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37350 () Bool)

(assert (=> mapIsEmpty!37350 mapRes!37350))

(declare-fun res!684992 () Bool)

(assert (=> start!89194 (=> (not res!684992) (not e!576153))))

(declare-fun valid!1959 (LongMapFixedSize!5142) Bool)

(assert (=> start!89194 (= res!684992 (valid!1959 thiss!1427))))

(assert (=> start!89194 e!576153))

(declare-fun e!576149 () Bool)

(assert (=> start!89194 e!576149))

(assert (=> start!89194 true))

(declare-fun b!1022636 () Bool)

(declare-fun e!576152 () Bool)

(declare-fun tp_is_empty!23955 () Bool)

(assert (=> b!1022636 (= e!576152 tp_is_empty!23955)))

(declare-fun b!1022637 () Bool)

(declare-fun e!576151 () Bool)

(assert (=> b!1022637 (= e!576151 (and e!576152 mapRes!37350))))

(declare-fun condMapEmpty!37350 () Bool)

(declare-fun mapDefault!37350 () ValueCell!11274)

(assert (=> b!1022637 (= condMapEmpty!37350 (= (arr!30790 (_values!5946 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11274)) mapDefault!37350)))))

(declare-fun b!1022638 () Bool)

(assert (=> b!1022638 (= e!576148 tp_is_empty!23955)))

(declare-fun array_inv!23863 (array!63954) Bool)

(declare-fun array_inv!23864 (array!63956) Bool)

(assert (=> b!1022639 (= e!576149 (and tp!71739 tp_is_empty!23955 (array_inv!23863 (_keys!11068 thiss!1427)) (array_inv!23864 (_values!5946 thiss!1427)) e!576151))))

(declare-fun b!1022640 () Bool)

(assert (=> b!1022640 (= e!576153 (not true))))

(declare-fun lt!450311 () Bool)

(declare-fun lt!450312 () V!36813)

(assert (=> b!1022640 (= lt!450311 (valid!1959 (LongMapFixedSize!5143 (defaultEntry!5923 thiss!1427) (mask!29524 thiss!1427) (bvand (extraKeys!5655 thiss!1427) #b00000000000000000000000000000010) lt!450312 (minValue!5759 thiss!1427) (_size!2626 thiss!1427) (_keys!11068 thiss!1427) (_values!5946 thiss!1427) (_vacant!2626 thiss!1427))))))

(declare-datatypes ((tuple2!15510 0))(
  ( (tuple2!15511 (_1!7766 (_ BitVec 64)) (_2!7766 V!36813)) )
))
(declare-datatypes ((List!21689 0))(
  ( (Nil!21686) (Cons!21685 (h!22883 tuple2!15510) (t!30725 List!21689)) )
))
(declare-datatypes ((ListLongMap!13651 0))(
  ( (ListLongMap!13652 (toList!6841 List!21689)) )
))
(declare-fun -!468 (ListLongMap!13651 (_ BitVec 64)) ListLongMap!13651)

(declare-fun getCurrentListMap!3889 (array!63954 array!63956 (_ BitVec 32) (_ BitVec 32) V!36813 V!36813 (_ BitVec 32) Int) ListLongMap!13651)

(assert (=> b!1022640 (= (-!468 (getCurrentListMap!3889 (_keys!11068 thiss!1427) (_values!5946 thiss!1427) (mask!29524 thiss!1427) (extraKeys!5655 thiss!1427) (zeroValue!5759 thiss!1427) (minValue!5759 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5923 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3889 (_keys!11068 thiss!1427) (_values!5946 thiss!1427) (mask!29524 thiss!1427) (bvand (extraKeys!5655 thiss!1427) #b00000000000000000000000000000010) lt!450312 (minValue!5759 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5923 thiss!1427)))))

(declare-datatypes ((Unit!33325 0))(
  ( (Unit!33326) )
))
(declare-fun lt!450310 () Unit!33325)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (array!63954 array!63956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36813 V!36813 V!36813 Int) Unit!33325)

(assert (=> b!1022640 (= lt!450310 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (_keys!11068 thiss!1427) (_values!5946 thiss!1427) (mask!29524 thiss!1427) (extraKeys!5655 thiss!1427) (bvand (extraKeys!5655 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5759 thiss!1427) lt!450312 (minValue!5759 thiss!1427) (defaultEntry!5923 thiss!1427)))))

(declare-fun dynLambda!1938 (Int (_ BitVec 64)) V!36813)

(assert (=> b!1022640 (= lt!450312 (dynLambda!1938 (defaultEntry!5923 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89194 res!684992) b!1022635))

(assert (= (and b!1022635 res!684991) b!1022640))

(assert (= (and b!1022637 condMapEmpty!37350) mapIsEmpty!37350))

(assert (= (and b!1022637 (not condMapEmpty!37350)) mapNonEmpty!37350))

(get-info :version)

(assert (= (and mapNonEmpty!37350 ((_ is ValueCellFull!11274) mapValue!37350)) b!1022638))

(assert (= (and b!1022637 ((_ is ValueCellFull!11274) mapDefault!37350)) b!1022636))

(assert (= b!1022639 b!1022637))

(assert (= start!89194 b!1022639))

(declare-fun b_lambda!15691 () Bool)

(assert (=> (not b_lambda!15691) (not b!1022640)))

(declare-fun t!30724 () Bool)

(declare-fun tb!6859 () Bool)

(assert (=> (and b!1022639 (= (defaultEntry!5923 thiss!1427) (defaultEntry!5923 thiss!1427)) t!30724) tb!6859))

(declare-fun result!14027 () Bool)

(assert (=> tb!6859 (= result!14027 tp_is_empty!23955)))

(assert (=> b!1022640 t!30724))

(declare-fun b_and!32455 () Bool)

(assert (= b_and!32453 (and (=> t!30724 result!14027) b_and!32455)))

(declare-fun m!941689 () Bool)

(assert (=> mapNonEmpty!37350 m!941689))

(declare-fun m!941691 () Bool)

(assert (=> start!89194 m!941691))

(declare-fun m!941693 () Bool)

(assert (=> b!1022639 m!941693))

(declare-fun m!941695 () Bool)

(assert (=> b!1022639 m!941695))

(declare-fun m!941697 () Bool)

(assert (=> b!1022640 m!941697))

(declare-fun m!941699 () Bool)

(assert (=> b!1022640 m!941699))

(declare-fun m!941701 () Bool)

(assert (=> b!1022640 m!941701))

(declare-fun m!941703 () Bool)

(assert (=> b!1022640 m!941703))

(declare-fun m!941705 () Bool)

(assert (=> b!1022640 m!941705))

(assert (=> b!1022640 m!941703))

(declare-fun m!941707 () Bool)

(assert (=> b!1022640 m!941707))

(check-sat (not b!1022639) (not b_next!20235) tp_is_empty!23955 (not b_lambda!15691) (not start!89194) b_and!32455 (not mapNonEmpty!37350) (not b!1022640))
(check-sat b_and!32455 (not b_next!20235))
