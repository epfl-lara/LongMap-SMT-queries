; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90110 () Bool)

(assert start!90110)

(declare-fun b!1032150 () Bool)

(declare-fun b_free!20719 () Bool)

(declare-fun b_next!20719 () Bool)

(assert (=> b!1032150 (= b_free!20719 (not b_next!20719))))

(declare-fun tp!73228 () Bool)

(declare-fun b_and!33161 () Bool)

(assert (=> b!1032150 (= tp!73228 b_and!33161)))

(declare-fun b!1032149 () Bool)

(declare-fun res!689919 () Bool)

(declare-fun e!583163 () Bool)

(assert (=> b!1032149 (=> (not res!689919) (not e!583163))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032149 (= res!689919 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38112 () Bool)

(declare-fun mapRes!38112 () Bool)

(assert (=> mapIsEmpty!38112 mapRes!38112))

(declare-datatypes ((V!37459 0))(
  ( (V!37460 (val!12270 Int)) )
))
(declare-datatypes ((ValueCell!11516 0))(
  ( (ValueCellFull!11516 (v!14846 V!37459)) (EmptyCell!11516) )
))
(declare-datatypes ((array!64881 0))(
  ( (array!64882 (arr!31242 (Array (_ BitVec 32) (_ BitVec 64))) (size!31761 (_ BitVec 32))) )
))
(declare-datatypes ((array!64883 0))(
  ( (array!64884 (arr!31243 (Array (_ BitVec 32) ValueCell!11516)) (size!31762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5626 0))(
  ( (LongMapFixedSize!5627 (defaultEntry!6187 Int) (mask!29998 (_ BitVec 32)) (extraKeys!5919 (_ BitVec 32)) (zeroValue!6023 V!37459) (minValue!6023 V!37459) (_size!2868 (_ BitVec 32)) (_keys!11356 array!64881) (_values!6210 array!64883) (_vacant!2868 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5626)

(declare-fun tp_is_empty!24439 () Bool)

(declare-fun e!583161 () Bool)

(declare-fun e!583164 () Bool)

(declare-fun array_inv!24177 (array!64881) Bool)

(declare-fun array_inv!24178 (array!64883) Bool)

(assert (=> b!1032150 (= e!583164 (and tp!73228 tp_is_empty!24439 (array_inv!24177 (_keys!11356 thiss!1427)) (array_inv!24178 (_values!6210 thiss!1427)) e!583161))))

(declare-fun b!1032151 () Bool)

(declare-fun e!583162 () Bool)

(assert (=> b!1032151 (= e!583162 tp_is_empty!24439)))

(declare-fun b!1032152 () Bool)

(assert (=> b!1032152 (= e!583161 (and e!583162 mapRes!38112))))

(declare-fun condMapEmpty!38112 () Bool)

(declare-fun mapDefault!38112 () ValueCell!11516)

(assert (=> b!1032152 (= condMapEmpty!38112 (= (arr!31243 (_values!6210 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11516)) mapDefault!38112)))))

(declare-fun b!1032153 () Bool)

(declare-fun e!583165 () Bool)

(assert (=> b!1032153 (= e!583165 tp_is_empty!24439)))

(declare-fun mapNonEmpty!38112 () Bool)

(declare-fun tp!73227 () Bool)

(assert (=> mapNonEmpty!38112 (= mapRes!38112 (and tp!73227 e!583165))))

(declare-fun mapKey!38112 () (_ BitVec 32))

(declare-fun mapRest!38112 () (Array (_ BitVec 32) ValueCell!11516))

(declare-fun mapValue!38112 () ValueCell!11516)

(assert (=> mapNonEmpty!38112 (= (arr!31243 (_values!6210 thiss!1427)) (store mapRest!38112 mapKey!38112 mapValue!38112))))

(declare-fun res!689920 () Bool)

(assert (=> start!90110 (=> (not res!689920) (not e!583163))))

(declare-fun valid!2119 (LongMapFixedSize!5626) Bool)

(assert (=> start!90110 (= res!689920 (valid!2119 thiss!1427))))

(assert (=> start!90110 e!583163))

(assert (=> start!90110 e!583164))

(assert (=> start!90110 true))

(declare-fun b!1032154 () Bool)

(assert (=> b!1032154 (= e!583163 false)))

(declare-datatypes ((SeekEntryResult!9720 0))(
  ( (MissingZero!9720 (index!41251 (_ BitVec 32))) (Found!9720 (index!41252 (_ BitVec 32))) (Intermediate!9720 (undefined!10532 Bool) (index!41253 (_ BitVec 32)) (x!91973 (_ BitVec 32))) (Undefined!9720) (MissingVacant!9720 (index!41254 (_ BitVec 32))) )
))
(declare-fun lt!455823 () SeekEntryResult!9720)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64881 (_ BitVec 32)) SeekEntryResult!9720)

(assert (=> b!1032154 (= lt!455823 (seekEntry!0 key!909 (_keys!11356 thiss!1427) (mask!29998 thiss!1427)))))

(assert (= (and start!90110 res!689920) b!1032149))

(assert (= (and b!1032149 res!689919) b!1032154))

(assert (= (and b!1032152 condMapEmpty!38112) mapIsEmpty!38112))

(assert (= (and b!1032152 (not condMapEmpty!38112)) mapNonEmpty!38112))

(get-info :version)

(assert (= (and mapNonEmpty!38112 ((_ is ValueCellFull!11516) mapValue!38112)) b!1032153))

(assert (= (and b!1032152 ((_ is ValueCellFull!11516) mapDefault!38112)) b!1032151))

(assert (= b!1032150 b!1032152))

(assert (= start!90110 b!1032150))

(declare-fun m!952027 () Bool)

(assert (=> b!1032150 m!952027))

(declare-fun m!952029 () Bool)

(assert (=> b!1032150 m!952029))

(declare-fun m!952031 () Bool)

(assert (=> mapNonEmpty!38112 m!952031))

(declare-fun m!952033 () Bool)

(assert (=> start!90110 m!952033))

(declare-fun m!952035 () Bool)

(assert (=> b!1032154 m!952035))

(check-sat (not b_next!20719) (not start!90110) (not b!1032154) (not b!1032150) tp_is_empty!24439 (not mapNonEmpty!38112) b_and!33161)
(check-sat b_and!33161 (not b_next!20719))
