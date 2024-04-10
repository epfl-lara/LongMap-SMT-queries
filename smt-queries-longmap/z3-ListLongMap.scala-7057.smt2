; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89398 () Bool)

(assert start!89398)

(declare-fun b!1024929 () Bool)

(declare-fun b_free!20397 () Bool)

(declare-fun b_next!20397 () Bool)

(assert (=> b!1024929 (= b_free!20397 (not b_next!20397))))

(declare-fun tp!72236 () Bool)

(declare-fun b_and!32643 () Bool)

(assert (=> b!1024929 (= tp!72236 b_and!32643)))

(declare-fun b!1024924 () Bool)

(declare-fun e!577815 () Bool)

(assert (=> b!1024924 (= e!577815 true)))

(declare-fun lt!450750 () Bool)

(declare-datatypes ((V!37029 0))(
  ( (V!37030 (val!12109 Int)) )
))
(declare-datatypes ((ValueCell!11355 0))(
  ( (ValueCellFull!11355 (v!14678 V!37029)) (EmptyCell!11355) )
))
(declare-datatypes ((array!64284 0))(
  ( (array!64285 (arr!30951 (Array (_ BitVec 32) (_ BitVec 64))) (size!31464 (_ BitVec 32))) )
))
(declare-datatypes ((array!64286 0))(
  ( (array!64287 (arr!30952 (Array (_ BitVec 32) ValueCell!11355)) (size!31465 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5304 0))(
  ( (LongMapFixedSize!5305 (defaultEntry!6004 Int) (mask!29664 (_ BitVec 32)) (extraKeys!5736 (_ BitVec 32)) (zeroValue!5840 V!37029) (minValue!5840 V!37029) (_size!2707 (_ BitVec 32)) (_keys!11151 array!64284) (_values!6027 array!64286) (_vacant!2707 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5304)

(declare-datatypes ((List!21739 0))(
  ( (Nil!21736) (Cons!21735 (h!22933 (_ BitVec 64)) (t!30801 List!21739)) )
))
(declare-fun arrayNoDuplicates!0 (array!64284 (_ BitVec 32) List!21739) Bool)

(assert (=> b!1024924 (= lt!450750 (arrayNoDuplicates!0 (_keys!11151 thiss!1427) #b00000000000000000000000000000000 Nil!21736))))

(declare-fun b!1024925 () Bool)

(declare-fun e!577820 () Bool)

(declare-fun tp_is_empty!24117 () Bool)

(assert (=> b!1024925 (= e!577820 tp_is_empty!24117)))

(declare-fun b!1024926 () Bool)

(declare-fun res!686206 () Bool)

(assert (=> b!1024926 (=> res!686206 e!577815)))

(declare-fun contains!5955 (List!21739 (_ BitVec 64)) Bool)

(assert (=> b!1024926 (= res!686206 (contains!5955 Nil!21736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024927 () Bool)

(declare-fun e!577816 () Bool)

(assert (=> b!1024927 (= e!577816 tp_is_empty!24117)))

(declare-fun b!1024928 () Bool)

(declare-fun e!577819 () Bool)

(declare-fun e!577817 () Bool)

(assert (=> b!1024928 (= e!577819 e!577817)))

(declare-fun res!686210 () Bool)

(assert (=> b!1024928 (=> (not res!686210) (not e!577817))))

(declare-datatypes ((SeekEntryResult!9604 0))(
  ( (MissingZero!9604 (index!40787 (_ BitVec 32))) (Found!9604 (index!40788 (_ BitVec 32))) (Intermediate!9604 (undefined!10416 Bool) (index!40789 (_ BitVec 32)) (x!91130 (_ BitVec 32))) (Undefined!9604) (MissingVacant!9604 (index!40790 (_ BitVec 32))) )
))
(declare-fun lt!450748 () SeekEntryResult!9604)

(get-info :version)

(assert (=> b!1024928 (= res!686210 ((_ is Found!9604) lt!450748))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64284 (_ BitVec 32)) SeekEntryResult!9604)

(assert (=> b!1024928 (= lt!450748 (seekEntry!0 key!909 (_keys!11151 thiss!1427) (mask!29664 thiss!1427)))))

(declare-fun mapNonEmpty!37604 () Bool)

(declare-fun mapRes!37604 () Bool)

(declare-fun tp!72237 () Bool)

(assert (=> mapNonEmpty!37604 (= mapRes!37604 (and tp!72237 e!577820))))

(declare-fun mapKey!37604 () (_ BitVec 32))

(declare-fun mapRest!37604 () (Array (_ BitVec 32) ValueCell!11355))

(declare-fun mapValue!37604 () ValueCell!11355)

(assert (=> mapNonEmpty!37604 (= (arr!30952 (_values!6027 thiss!1427)) (store mapRest!37604 mapKey!37604 mapValue!37604))))

(declare-fun e!577822 () Bool)

(declare-fun e!577818 () Bool)

(declare-fun array_inv!23971 (array!64284) Bool)

(declare-fun array_inv!23972 (array!64286) Bool)

(assert (=> b!1024929 (= e!577818 (and tp!72236 tp_is_empty!24117 (array_inv!23971 (_keys!11151 thiss!1427)) (array_inv!23972 (_values!6027 thiss!1427)) e!577822))))

(declare-fun b!1024930 () Bool)

(declare-fun res!686208 () Bool)

(assert (=> b!1024930 (=> res!686208 e!577815)))

(declare-fun noDuplicate!1470 (List!21739) Bool)

(assert (=> b!1024930 (= res!686208 (not (noDuplicate!1470 Nil!21736)))))

(declare-fun b!1024931 () Bool)

(assert (=> b!1024931 (= e!577817 (not e!577815))))

(declare-fun res!686204 () Bool)

(assert (=> b!1024931 (=> res!686204 e!577815)))

(assert (=> b!1024931 (= res!686204 (or (bvsge (size!31464 (_keys!11151 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31464 (_keys!11151 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64284 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024931 (= (arrayCountValidKeys!0 (array!64285 (store (arr!30951 (_keys!11151 thiss!1427)) (index!40788 lt!450748) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31464 (_keys!11151 thiss!1427))) #b00000000000000000000000000000000 (size!31464 (_keys!11151 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11151 thiss!1427) #b00000000000000000000000000000000 (size!31464 (_keys!11151 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33365 0))(
  ( (Unit!33366) )
))
(declare-fun lt!450749 () Unit!33365)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64284 (_ BitVec 32) (_ BitVec 64)) Unit!33365)

(assert (=> b!1024931 (= lt!450749 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11151 thiss!1427) (index!40788 lt!450748) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024932 () Bool)

(assert (=> b!1024932 (= e!577822 (and e!577816 mapRes!37604))))

(declare-fun condMapEmpty!37604 () Bool)

(declare-fun mapDefault!37604 () ValueCell!11355)

(assert (=> b!1024932 (= condMapEmpty!37604 (= (arr!30952 (_values!6027 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11355)) mapDefault!37604)))))

(declare-fun b!1024933 () Bool)

(declare-fun res!686209 () Bool)

(assert (=> b!1024933 (=> (not res!686209) (not e!577819))))

(assert (=> b!1024933 (= res!686209 (not (= key!909 (bvneg key!909))))))

(declare-fun res!686207 () Bool)

(assert (=> start!89398 (=> (not res!686207) (not e!577819))))

(declare-fun valid!2017 (LongMapFixedSize!5304) Bool)

(assert (=> start!89398 (= res!686207 (valid!2017 thiss!1427))))

(assert (=> start!89398 e!577819))

(assert (=> start!89398 e!577818))

(assert (=> start!89398 true))

(declare-fun b!1024934 () Bool)

(declare-fun res!686205 () Bool)

(assert (=> b!1024934 (=> res!686205 e!577815)))

(assert (=> b!1024934 (= res!686205 (contains!5955 Nil!21736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37604 () Bool)

(assert (=> mapIsEmpty!37604 mapRes!37604))

(assert (= (and start!89398 res!686207) b!1024933))

(assert (= (and b!1024933 res!686209) b!1024928))

(assert (= (and b!1024928 res!686210) b!1024931))

(assert (= (and b!1024931 (not res!686204)) b!1024930))

(assert (= (and b!1024930 (not res!686208)) b!1024926))

(assert (= (and b!1024926 (not res!686206)) b!1024934))

(assert (= (and b!1024934 (not res!686205)) b!1024924))

(assert (= (and b!1024932 condMapEmpty!37604) mapIsEmpty!37604))

(assert (= (and b!1024932 (not condMapEmpty!37604)) mapNonEmpty!37604))

(assert (= (and mapNonEmpty!37604 ((_ is ValueCellFull!11355) mapValue!37604)) b!1024925))

(assert (= (and b!1024932 ((_ is ValueCellFull!11355) mapDefault!37604)) b!1024927))

(assert (= b!1024929 b!1024932))

(assert (= start!89398 b!1024929))

(declare-fun m!943167 () Bool)

(assert (=> b!1024928 m!943167))

(declare-fun m!943169 () Bool)

(assert (=> b!1024924 m!943169))

(declare-fun m!943171 () Bool)

(assert (=> start!89398 m!943171))

(declare-fun m!943173 () Bool)

(assert (=> b!1024930 m!943173))

(declare-fun m!943175 () Bool)

(assert (=> b!1024929 m!943175))

(declare-fun m!943177 () Bool)

(assert (=> b!1024929 m!943177))

(declare-fun m!943179 () Bool)

(assert (=> mapNonEmpty!37604 m!943179))

(declare-fun m!943181 () Bool)

(assert (=> b!1024926 m!943181))

(declare-fun m!943183 () Bool)

(assert (=> b!1024934 m!943183))

(declare-fun m!943185 () Bool)

(assert (=> b!1024931 m!943185))

(declare-fun m!943187 () Bool)

(assert (=> b!1024931 m!943187))

(declare-fun m!943189 () Bool)

(assert (=> b!1024931 m!943189))

(declare-fun m!943191 () Bool)

(assert (=> b!1024931 m!943191))

(check-sat (not b!1024934) (not mapNonEmpty!37604) (not b!1024924) (not b!1024928) (not b!1024931) (not b_next!20397) tp_is_empty!24117 (not b!1024929) (not b!1024926) (not b!1024930) b_and!32643 (not start!89398))
(check-sat b_and!32643 (not b_next!20397))
