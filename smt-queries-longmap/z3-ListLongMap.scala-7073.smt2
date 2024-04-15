; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89490 () Bool)

(assert start!89490)

(declare-fun b!1026161 () Bool)

(declare-fun b_free!20491 () Bool)

(declare-fun b_next!20491 () Bool)

(assert (=> b!1026161 (= b_free!20491 (not b_next!20491))))

(declare-fun tp!72518 () Bool)

(declare-fun b_and!32711 () Bool)

(assert (=> b!1026161 (= tp!72518 b_and!32711)))

(declare-fun res!686961 () Bool)

(declare-fun e!578856 () Bool)

(assert (=> start!89490 (=> (not res!686961) (not e!578856))))

(declare-datatypes ((V!37155 0))(
  ( (V!37156 (val!12156 Int)) )
))
(declare-datatypes ((ValueCell!11402 0))(
  ( (ValueCellFull!11402 (v!14724 V!37155)) (EmptyCell!11402) )
))
(declare-datatypes ((array!64411 0))(
  ( (array!64412 (arr!31014 (Array (_ BitVec 32) (_ BitVec 64))) (size!31529 (_ BitVec 32))) )
))
(declare-datatypes ((array!64413 0))(
  ( (array!64414 (arr!31015 (Array (_ BitVec 32) ValueCell!11402)) (size!31530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5398 0))(
  ( (LongMapFixedSize!5399 (defaultEntry!6051 Int) (mask!29738 (_ BitVec 32)) (extraKeys!5783 (_ BitVec 32)) (zeroValue!5887 V!37155) (minValue!5887 V!37155) (_size!2754 (_ BitVec 32)) (_keys!11194 array!64411) (_values!6074 array!64413) (_vacant!2754 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5398)

(declare-fun valid!2046 (LongMapFixedSize!5398) Bool)

(assert (=> start!89490 (= res!686961 (valid!2046 thiss!1427))))

(assert (=> start!89490 e!578856))

(declare-fun e!578854 () Bool)

(assert (=> start!89490 e!578854))

(assert (=> start!89490 true))

(declare-fun b!1026160 () Bool)

(declare-fun e!578853 () Bool)

(declare-fun e!578855 () Bool)

(declare-fun mapRes!37745 () Bool)

(assert (=> b!1026160 (= e!578853 (and e!578855 mapRes!37745))))

(declare-fun condMapEmpty!37745 () Bool)

(declare-fun mapDefault!37745 () ValueCell!11402)

(assert (=> b!1026160 (= condMapEmpty!37745 (= (arr!31015 (_values!6074 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11402)) mapDefault!37745)))))

(declare-fun tp_is_empty!24211 () Bool)

(declare-fun array_inv!24029 (array!64411) Bool)

(declare-fun array_inv!24030 (array!64413) Bool)

(assert (=> b!1026161 (= e!578854 (and tp!72518 tp_is_empty!24211 (array_inv!24029 (_keys!11194 thiss!1427)) (array_inv!24030 (_values!6074 thiss!1427)) e!578853))))

(declare-fun b!1026162 () Bool)

(declare-fun e!578857 () Bool)

(declare-fun e!578858 () Bool)

(assert (=> b!1026162 (= e!578857 (not e!578858))))

(declare-fun res!686963 () Bool)

(assert (=> b!1026162 (=> res!686963 e!578858)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026162 (= res!686963 (not (validMask!0 (mask!29738 thiss!1427))))))

(declare-fun lt!451273 () array!64411)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026162 (not (arrayContainsKey!0 lt!451273 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33329 0))(
  ( (Unit!33330) )
))
(declare-fun lt!451268 () Unit!33329)

(declare-datatypes ((SeekEntryResult!9639 0))(
  ( (MissingZero!9639 (index!40927 (_ BitVec 32))) (Found!9639 (index!40928 (_ BitVec 32))) (Intermediate!9639 (undefined!10451 Bool) (index!40929 (_ BitVec 32)) (x!91290 (_ BitVec 32))) (Undefined!9639) (MissingVacant!9639 (index!40930 (_ BitVec 32))) )
))
(declare-fun lt!451267 () SeekEntryResult!9639)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64411 (_ BitVec 32) (_ BitVec 64)) Unit!33329)

(assert (=> b!1026162 (= lt!451268 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11194 thiss!1427) (index!40928 lt!451267) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64411 (_ BitVec 32)) Bool)

(assert (=> b!1026162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451273 (mask!29738 thiss!1427))))

(declare-fun lt!451272 () Unit!33329)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64411 (_ BitVec 32) (_ BitVec 32)) Unit!33329)

(assert (=> b!1026162 (= lt!451272 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11194 thiss!1427) (index!40928 lt!451267) (mask!29738 thiss!1427)))))

(declare-datatypes ((List!21811 0))(
  ( (Nil!21808) (Cons!21807 (h!23005 (_ BitVec 64)) (t!30864 List!21811)) )
))
(declare-fun arrayNoDuplicates!0 (array!64411 (_ BitVec 32) List!21811) Bool)

(assert (=> b!1026162 (arrayNoDuplicates!0 lt!451273 #b00000000000000000000000000000000 Nil!21808)))

(declare-fun lt!451269 () Unit!33329)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64411 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21811) Unit!33329)

(assert (=> b!1026162 (= lt!451269 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11194 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40928 lt!451267) #b00000000000000000000000000000000 Nil!21808))))

(declare-fun arrayCountValidKeys!0 (array!64411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026162 (= (arrayCountValidKeys!0 lt!451273 #b00000000000000000000000000000000 (size!31529 (_keys!11194 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11194 thiss!1427) #b00000000000000000000000000000000 (size!31529 (_keys!11194 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026162 (= lt!451273 (array!64412 (store (arr!31014 (_keys!11194 thiss!1427)) (index!40928 lt!451267) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31529 (_keys!11194 thiss!1427))))))

(declare-fun lt!451271 () Unit!33329)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64411 (_ BitVec 32) (_ BitVec 64)) Unit!33329)

(assert (=> b!1026162 (= lt!451271 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11194 thiss!1427) (index!40928 lt!451267) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026163 () Bool)

(declare-fun res!686964 () Bool)

(assert (=> b!1026163 (=> res!686964 e!578858)))

(assert (=> b!1026163 (= res!686964 (or (not (= (size!31530 (_values!6074 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29738 thiss!1427)))) (not (= (size!31529 (_keys!11194 thiss!1427)) (size!31530 (_values!6074 thiss!1427)))) (bvslt (mask!29738 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37745 () Bool)

(assert (=> mapIsEmpty!37745 mapRes!37745))

(declare-fun b!1026164 () Bool)

(assert (=> b!1026164 (= e!578855 tp_is_empty!24211)))

(declare-fun b!1026165 () Bool)

(declare-fun res!686960 () Bool)

(assert (=> b!1026165 (=> res!686960 e!578858)))

(assert (=> b!1026165 (= res!686960 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11194 thiss!1427) (mask!29738 thiss!1427))))))

(declare-fun mapNonEmpty!37745 () Bool)

(declare-fun tp!72519 () Bool)

(declare-fun e!578852 () Bool)

(assert (=> mapNonEmpty!37745 (= mapRes!37745 (and tp!72519 e!578852))))

(declare-fun mapValue!37745 () ValueCell!11402)

(declare-fun mapKey!37745 () (_ BitVec 32))

(declare-fun mapRest!37745 () (Array (_ BitVec 32) ValueCell!11402))

(assert (=> mapNonEmpty!37745 (= (arr!31015 (_values!6074 thiss!1427)) (store mapRest!37745 mapKey!37745 mapValue!37745))))

(declare-fun b!1026166 () Bool)

(assert (=> b!1026166 (= e!578856 e!578857)))

(declare-fun res!686962 () Bool)

(assert (=> b!1026166 (=> (not res!686962) (not e!578857))))

(get-info :version)

(assert (=> b!1026166 (= res!686962 ((_ is Found!9639) lt!451267))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64411 (_ BitVec 32)) SeekEntryResult!9639)

(assert (=> b!1026166 (= lt!451267 (seekEntry!0 key!909 (_keys!11194 thiss!1427) (mask!29738 thiss!1427)))))

(declare-fun b!1026167 () Bool)

(assert (=> b!1026167 (= e!578858 true)))

(declare-fun lt!451270 () Bool)

(assert (=> b!1026167 (= lt!451270 (arrayNoDuplicates!0 (_keys!11194 thiss!1427) #b00000000000000000000000000000000 Nil!21808))))

(declare-fun b!1026168 () Bool)

(declare-fun res!686965 () Bool)

(assert (=> b!1026168 (=> (not res!686965) (not e!578856))))

(assert (=> b!1026168 (= res!686965 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026169 () Bool)

(assert (=> b!1026169 (= e!578852 tp_is_empty!24211)))

(assert (= (and start!89490 res!686961) b!1026168))

(assert (= (and b!1026168 res!686965) b!1026166))

(assert (= (and b!1026166 res!686962) b!1026162))

(assert (= (and b!1026162 (not res!686963)) b!1026163))

(assert (= (and b!1026163 (not res!686964)) b!1026165))

(assert (= (and b!1026165 (not res!686960)) b!1026167))

(assert (= (and b!1026160 condMapEmpty!37745) mapIsEmpty!37745))

(assert (= (and b!1026160 (not condMapEmpty!37745)) mapNonEmpty!37745))

(assert (= (and mapNonEmpty!37745 ((_ is ValueCellFull!11402) mapValue!37745)) b!1026169))

(assert (= (and b!1026160 ((_ is ValueCellFull!11402) mapDefault!37745)) b!1026164))

(assert (= b!1026161 b!1026160))

(assert (= start!89490 b!1026161))

(declare-fun m!943931 () Bool)

(assert (=> b!1026161 m!943931))

(declare-fun m!943933 () Bool)

(assert (=> b!1026161 m!943933))

(declare-fun m!943935 () Bool)

(assert (=> b!1026166 m!943935))

(declare-fun m!943937 () Bool)

(assert (=> b!1026165 m!943937))

(declare-fun m!943939 () Bool)

(assert (=> mapNonEmpty!37745 m!943939))

(declare-fun m!943941 () Bool)

(assert (=> b!1026167 m!943941))

(declare-fun m!943943 () Bool)

(assert (=> b!1026162 m!943943))

(declare-fun m!943945 () Bool)

(assert (=> b!1026162 m!943945))

(declare-fun m!943947 () Bool)

(assert (=> b!1026162 m!943947))

(declare-fun m!943949 () Bool)

(assert (=> b!1026162 m!943949))

(declare-fun m!943951 () Bool)

(assert (=> b!1026162 m!943951))

(declare-fun m!943953 () Bool)

(assert (=> b!1026162 m!943953))

(declare-fun m!943955 () Bool)

(assert (=> b!1026162 m!943955))

(declare-fun m!943957 () Bool)

(assert (=> b!1026162 m!943957))

(declare-fun m!943959 () Bool)

(assert (=> b!1026162 m!943959))

(declare-fun m!943961 () Bool)

(assert (=> b!1026162 m!943961))

(declare-fun m!943963 () Bool)

(assert (=> b!1026162 m!943963))

(declare-fun m!943965 () Bool)

(assert (=> start!89490 m!943965))

(check-sat tp_is_empty!24211 (not b!1026161) (not b_next!20491) b_and!32711 (not mapNonEmpty!37745) (not b!1026165) (not b!1026162) (not b!1026167) (not start!89490) (not b!1026166))
(check-sat b_and!32711 (not b_next!20491))
