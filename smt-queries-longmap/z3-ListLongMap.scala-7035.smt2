; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89224 () Bool)

(assert start!89224)

(declare-fun b!1023033 () Bool)

(declare-fun b_free!20265 () Bool)

(declare-fun b_next!20265 () Bool)

(assert (=> b!1023033 (= b_free!20265 (not b_next!20265))))

(declare-fun tp!71829 () Bool)

(declare-fun b_and!32487 () Bool)

(assert (=> b!1023033 (= tp!71829 b_and!32487)))

(declare-fun mapNonEmpty!37395 () Bool)

(declare-fun mapRes!37395 () Bool)

(declare-fun tp!71830 () Bool)

(declare-fun e!576419 () Bool)

(assert (=> mapNonEmpty!37395 (= mapRes!37395 (and tp!71830 e!576419))))

(declare-fun mapKey!37395 () (_ BitVec 32))

(declare-datatypes ((V!36853 0))(
  ( (V!36854 (val!12043 Int)) )
))
(declare-datatypes ((ValueCell!11289 0))(
  ( (ValueCellFull!11289 (v!14612 V!36853)) (EmptyCell!11289) )
))
(declare-fun mapRest!37395 () (Array (_ BitVec 32) ValueCell!11289))

(declare-fun mapValue!37395 () ValueCell!11289)

(declare-datatypes ((array!64014 0))(
  ( (array!64015 (arr!30819 (Array (_ BitVec 32) (_ BitVec 64))) (size!31330 (_ BitVec 32))) )
))
(declare-datatypes ((array!64016 0))(
  ( (array!64017 (arr!30820 (Array (_ BitVec 32) ValueCell!11289)) (size!31331 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5172 0))(
  ( (LongMapFixedSize!5173 (defaultEntry!5938 Int) (mask!29549 (_ BitVec 32)) (extraKeys!5670 (_ BitVec 32)) (zeroValue!5774 V!36853) (minValue!5774 V!36853) (_size!2641 (_ BitVec 32)) (_keys!11083 array!64014) (_values!5961 array!64016) (_vacant!2641 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5172)

(assert (=> mapNonEmpty!37395 (= (arr!30820 (_values!5961 thiss!1427)) (store mapRest!37395 mapKey!37395 mapValue!37395))))

(declare-fun res!685204 () Bool)

(declare-fun e!576421 () Bool)

(assert (=> start!89224 (=> (not res!685204) (not e!576421))))

(declare-fun valid!1970 (LongMapFixedSize!5172) Bool)

(assert (=> start!89224 (= res!685204 (valid!1970 thiss!1427))))

(assert (=> start!89224 e!576421))

(declare-fun e!576423 () Bool)

(assert (=> start!89224 e!576423))

(assert (=> start!89224 true))

(declare-fun b!1023032 () Bool)

(declare-fun tp_is_empty!23985 () Bool)

(assert (=> b!1023032 (= e!576419 tp_is_empty!23985)))

(declare-fun e!576422 () Bool)

(declare-fun array_inv!23879 (array!64014) Bool)

(declare-fun array_inv!23880 (array!64016) Bool)

(assert (=> b!1023033 (= e!576423 (and tp!71829 tp_is_empty!23985 (array_inv!23879 (_keys!11083 thiss!1427)) (array_inv!23880 (_values!5961 thiss!1427)) e!576422))))

(declare-fun b!1023034 () Bool)

(declare-fun res!685207 () Bool)

(assert (=> b!1023034 (=> (not res!685207) (not e!576421))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023034 (= res!685207 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023035 () Bool)

(declare-fun res!685205 () Bool)

(assert (=> b!1023035 (=> (not res!685205) (not e!576421))))

(assert (=> b!1023035 (= res!685205 (and (= (size!31331 (_values!5961 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29549 thiss!1427))) (= (size!31330 (_keys!11083 thiss!1427)) (size!31331 (_values!5961 thiss!1427))) (bvsge (mask!29549 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5670 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5670 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5670 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5670 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5670 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5670 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5670 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023036 () Bool)

(declare-fun res!685206 () Bool)

(assert (=> b!1023036 (=> (not res!685206) (not e!576421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023036 (= res!685206 (validMask!0 (mask!29549 thiss!1427)))))

(declare-fun mapIsEmpty!37395 () Bool)

(assert (=> mapIsEmpty!37395 mapRes!37395))

(declare-fun b!1023037 () Bool)

(declare-fun res!685208 () Bool)

(assert (=> b!1023037 (=> (not res!685208) (not e!576421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64014 (_ BitVec 32)) Bool)

(assert (=> b!1023037 (= res!685208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11083 thiss!1427) (mask!29549 thiss!1427)))))

(declare-fun b!1023038 () Bool)

(declare-fun e!576420 () Bool)

(assert (=> b!1023038 (= e!576420 tp_is_empty!23985)))

(declare-fun b!1023039 () Bool)

(assert (=> b!1023039 (= e!576422 (and e!576420 mapRes!37395))))

(declare-fun condMapEmpty!37395 () Bool)

(declare-fun mapDefault!37395 () ValueCell!11289)

(assert (=> b!1023039 (= condMapEmpty!37395 (= (arr!30820 (_values!5961 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11289)) mapDefault!37395)))))

(declare-fun b!1023040 () Bool)

(assert (=> b!1023040 (= e!576421 false)))

(declare-fun lt!450363 () Bool)

(declare-datatypes ((List!21702 0))(
  ( (Nil!21699) (Cons!21698 (h!22896 (_ BitVec 64)) (t!30740 List!21702)) )
))
(declare-fun arrayNoDuplicates!0 (array!64014 (_ BitVec 32) List!21702) Bool)

(assert (=> b!1023040 (= lt!450363 (arrayNoDuplicates!0 (_keys!11083 thiss!1427) #b00000000000000000000000000000000 Nil!21699))))

(assert (= (and start!89224 res!685204) b!1023034))

(assert (= (and b!1023034 res!685207) b!1023036))

(assert (= (and b!1023036 res!685206) b!1023035))

(assert (= (and b!1023035 res!685205) b!1023037))

(assert (= (and b!1023037 res!685208) b!1023040))

(assert (= (and b!1023039 condMapEmpty!37395) mapIsEmpty!37395))

(assert (= (and b!1023039 (not condMapEmpty!37395)) mapNonEmpty!37395))

(get-info :version)

(assert (= (and mapNonEmpty!37395 ((_ is ValueCellFull!11289) mapValue!37395)) b!1023032))

(assert (= (and b!1023039 ((_ is ValueCellFull!11289) mapDefault!37395)) b!1023038))

(assert (= b!1023033 b!1023039))

(assert (= start!89224 b!1023033))

(declare-fun m!941911 () Bool)

(assert (=> b!1023036 m!941911))

(declare-fun m!941913 () Bool)

(assert (=> start!89224 m!941913))

(declare-fun m!941915 () Bool)

(assert (=> mapNonEmpty!37395 m!941915))

(declare-fun m!941917 () Bool)

(assert (=> b!1023040 m!941917))

(declare-fun m!941919 () Bool)

(assert (=> b!1023033 m!941919))

(declare-fun m!941921 () Bool)

(assert (=> b!1023033 m!941921))

(declare-fun m!941923 () Bool)

(assert (=> b!1023037 m!941923))

(check-sat (not mapNonEmpty!37395) (not b!1023040) (not start!89224) (not b!1023037) (not b_next!20265) b_and!32487 (not b!1023036) (not b!1023033) tp_is_empty!23985)
(check-sat b_and!32487 (not b_next!20265))
