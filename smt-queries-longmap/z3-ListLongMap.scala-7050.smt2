; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89352 () Bool)

(assert start!89352)

(declare-fun b!1024084 () Bool)

(declare-fun b_free!20353 () Bool)

(declare-fun b_next!20353 () Bool)

(assert (=> b!1024084 (= b_free!20353 (not b_next!20353))))

(declare-fun tp!72105 () Bool)

(declare-fun b_and!32573 () Bool)

(assert (=> b!1024084 (= tp!72105 b_and!32573)))

(declare-fun b!1024082 () Bool)

(declare-fun res!685711 () Bool)

(declare-fun e!577215 () Bool)

(assert (=> b!1024082 (=> (not res!685711) (not e!577215))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024082 (= res!685711 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024083 () Bool)

(assert (=> b!1024083 (= e!577215 false)))

(declare-datatypes ((SeekEntryResult!9584 0))(
  ( (MissingZero!9584 (index!40707 (_ BitVec 32))) (Found!9584 (index!40708 (_ BitVec 32))) (Intermediate!9584 (undefined!10396 Bool) (index!40709 (_ BitVec 32)) (x!91051 (_ BitVec 32))) (Undefined!9584) (MissingVacant!9584 (index!40710 (_ BitVec 32))) )
))
(declare-fun lt!450364 () SeekEntryResult!9584)

(declare-datatypes ((V!36971 0))(
  ( (V!36972 (val!12087 Int)) )
))
(declare-datatypes ((ValueCell!11333 0))(
  ( (ValueCellFull!11333 (v!14655 V!36971)) (EmptyCell!11333) )
))
(declare-datatypes ((array!64135 0))(
  ( (array!64136 (arr!30876 (Array (_ BitVec 32) (_ BitVec 64))) (size!31391 (_ BitVec 32))) )
))
(declare-datatypes ((array!64137 0))(
  ( (array!64138 (arr!30877 (Array (_ BitVec 32) ValueCell!11333)) (size!31392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5260 0))(
  ( (LongMapFixedSize!5261 (defaultEntry!5982 Int) (mask!29623 (_ BitVec 32)) (extraKeys!5714 (_ BitVec 32)) (zeroValue!5818 V!36971) (minValue!5818 V!36971) (_size!2685 (_ BitVec 32)) (_keys!11125 array!64135) (_values!6005 array!64137) (_vacant!2685 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5260)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64135 (_ BitVec 32)) SeekEntryResult!9584)

(assert (=> b!1024083 (= lt!450364 (seekEntry!0 key!909 (_keys!11125 thiss!1427) (mask!29623 thiss!1427)))))

(declare-fun e!577212 () Bool)

(declare-fun e!577213 () Bool)

(declare-fun tp_is_empty!24073 () Bool)

(declare-fun array_inv!23935 (array!64135) Bool)

(declare-fun array_inv!23936 (array!64137) Bool)

(assert (=> b!1024084 (= e!577213 (and tp!72105 tp_is_empty!24073 (array_inv!23935 (_keys!11125 thiss!1427)) (array_inv!23936 (_values!6005 thiss!1427)) e!577212))))

(declare-fun mapNonEmpty!37538 () Bool)

(declare-fun mapRes!37538 () Bool)

(declare-fun tp!72104 () Bool)

(declare-fun e!577214 () Bool)

(assert (=> mapNonEmpty!37538 (= mapRes!37538 (and tp!72104 e!577214))))

(declare-fun mapKey!37538 () (_ BitVec 32))

(declare-fun mapValue!37538 () ValueCell!11333)

(declare-fun mapRest!37538 () (Array (_ BitVec 32) ValueCell!11333))

(assert (=> mapNonEmpty!37538 (= (arr!30877 (_values!6005 thiss!1427)) (store mapRest!37538 mapKey!37538 mapValue!37538))))

(declare-fun b!1024085 () Bool)

(declare-fun e!577211 () Bool)

(assert (=> b!1024085 (= e!577212 (and e!577211 mapRes!37538))))

(declare-fun condMapEmpty!37538 () Bool)

(declare-fun mapDefault!37538 () ValueCell!11333)

(assert (=> b!1024085 (= condMapEmpty!37538 (= (arr!30877 (_values!6005 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11333)) mapDefault!37538)))))

(declare-fun b!1024086 () Bool)

(assert (=> b!1024086 (= e!577214 tp_is_empty!24073)))

(declare-fun b!1024087 () Bool)

(assert (=> b!1024087 (= e!577211 tp_is_empty!24073)))

(declare-fun mapIsEmpty!37538 () Bool)

(assert (=> mapIsEmpty!37538 mapRes!37538))

(declare-fun res!685710 () Bool)

(assert (=> start!89352 (=> (not res!685710) (not e!577215))))

(declare-fun valid!1997 (LongMapFixedSize!5260) Bool)

(assert (=> start!89352 (= res!685710 (valid!1997 thiss!1427))))

(assert (=> start!89352 e!577215))

(assert (=> start!89352 e!577213))

(assert (=> start!89352 true))

(assert (= (and start!89352 res!685710) b!1024082))

(assert (= (and b!1024082 res!685711) b!1024083))

(assert (= (and b!1024085 condMapEmpty!37538) mapIsEmpty!37538))

(assert (= (and b!1024085 (not condMapEmpty!37538)) mapNonEmpty!37538))

(get-info :version)

(assert (= (and mapNonEmpty!37538 ((_ is ValueCellFull!11333) mapValue!37538)) b!1024086))

(assert (= (and b!1024085 ((_ is ValueCellFull!11333) mapDefault!37538)) b!1024087))

(assert (= b!1024084 b!1024085))

(assert (= start!89352 b!1024084))

(declare-fun m!942023 () Bool)

(assert (=> b!1024083 m!942023))

(declare-fun m!942025 () Bool)

(assert (=> b!1024084 m!942025))

(declare-fun m!942027 () Bool)

(assert (=> b!1024084 m!942027))

(declare-fun m!942029 () Bool)

(assert (=> mapNonEmpty!37538 m!942029))

(declare-fun m!942031 () Bool)

(assert (=> start!89352 m!942031))

(check-sat b_and!32573 (not b_next!20353) (not b!1024083) tp_is_empty!24073 (not b!1024084) (not start!89352) (not mapNonEmpty!37538))
(check-sat b_and!32573 (not b_next!20353))
