; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19696 () Bool)

(assert start!19696)

(declare-fun b!193064 () Bool)

(declare-fun b_free!4703 () Bool)

(declare-fun b_next!4703 () Bool)

(assert (=> b!193064 (= b_free!4703 (not b_next!4703))))

(declare-fun tp!16970 () Bool)

(declare-fun b_and!11405 () Bool)

(assert (=> b!193064 (= tp!16970 b_and!11405)))

(declare-fun res!91228 () Bool)

(declare-fun e!127039 () Bool)

(assert (=> start!19696 (=> (not res!91228) (not e!127039))))

(declare-datatypes ((V!5613 0))(
  ( (V!5614 (val!2282 Int)) )
))
(declare-datatypes ((ValueCell!1894 0))(
  ( (ValueCellFull!1894 (v!4235 V!5613)) (EmptyCell!1894) )
))
(declare-datatypes ((array!8195 0))(
  ( (array!8196 (arr!3859 (Array (_ BitVec 32) (_ BitVec 64))) (size!4183 (_ BitVec 32))) )
))
(declare-datatypes ((array!8197 0))(
  ( (array!8198 (arr!3860 (Array (_ BitVec 32) ValueCell!1894)) (size!4184 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2696 0))(
  ( (LongMapFixedSize!2697 (defaultEntry!3940 Int) (mask!9185 (_ BitVec 32)) (extraKeys!3677 (_ BitVec 32)) (zeroValue!3781 V!5613) (minValue!3781 V!5613) (_size!1397 (_ BitVec 32)) (_keys!5928 array!8195) (_values!3923 array!8197) (_vacant!1397 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2696)

(declare-fun valid!1106 (LongMapFixedSize!2696) Bool)

(assert (=> start!19696 (= res!91228 (valid!1106 thiss!1248))))

(assert (=> start!19696 e!127039))

(declare-fun e!127033 () Bool)

(assert (=> start!19696 e!127033))

(assert (=> start!19696 true))

(declare-fun tp_is_empty!4475 () Bool)

(assert (=> start!19696 tp_is_empty!4475))

(declare-fun mapNonEmpty!7736 () Bool)

(declare-fun mapRes!7736 () Bool)

(declare-fun tp!16969 () Bool)

(declare-fun e!127041 () Bool)

(assert (=> mapNonEmpty!7736 (= mapRes!7736 (and tp!16969 e!127041))))

(declare-fun mapValue!7736 () ValueCell!1894)

(declare-fun mapRest!7736 () (Array (_ BitVec 32) ValueCell!1894))

(declare-fun mapKey!7736 () (_ BitVec 32))

(assert (=> mapNonEmpty!7736 (= (arr!3860 (_values!3923 thiss!1248)) (store mapRest!7736 mapKey!7736 mapValue!7736))))

(declare-fun b!193060 () Bool)

(assert (=> b!193060 (= e!127041 tp_is_empty!4475)))

(declare-fun b!193061 () Bool)

(declare-fun e!127035 () Bool)

(assert (=> b!193061 (= e!127035 tp_is_empty!4475)))

(declare-fun b!193062 () Bool)

(declare-fun e!127040 () Bool)

(assert (=> b!193062 (= e!127039 e!127040)))

(declare-fun res!91222 () Bool)

(assert (=> b!193062 (=> (not res!91222) (not e!127040))))

(declare-datatypes ((SeekEntryResult!686 0))(
  ( (MissingZero!686 (index!4914 (_ BitVec 32))) (Found!686 (index!4915 (_ BitVec 32))) (Intermediate!686 (undefined!1498 Bool) (index!4916 (_ BitVec 32)) (x!20628 (_ BitVec 32))) (Undefined!686) (MissingVacant!686 (index!4917 (_ BitVec 32))) )
))
(declare-fun lt!96057 () SeekEntryResult!686)

(assert (=> b!193062 (= res!91222 (and (not (is-Undefined!686 lt!96057)) (not (is-MissingVacant!686 lt!96057)) (not (is-MissingZero!686 lt!96057)) (is-Found!686 lt!96057)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8195 (_ BitVec 32)) SeekEntryResult!686)

(assert (=> b!193062 (= lt!96057 (seekEntryOrOpen!0 key!828 (_keys!5928 thiss!1248) (mask!9185 thiss!1248)))))

(declare-fun b!193063 () Bool)

(declare-fun e!127042 () Bool)

(declare-datatypes ((List!2435 0))(
  ( (Nil!2432) (Cons!2431 (h!3072 (_ BitVec 64)) (t!7355 List!2435)) )
))
(declare-fun arrayNoDuplicates!0 (array!8195 (_ BitVec 32) List!2435) Bool)

(assert (=> b!193063 (= e!127042 (arrayNoDuplicates!0 (_keys!5928 thiss!1248) #b00000000000000000000000000000000 Nil!2432))))

(declare-fun e!127034 () Bool)

(declare-fun array_inv!2503 (array!8195) Bool)

(declare-fun array_inv!2504 (array!8197) Bool)

(assert (=> b!193064 (= e!127033 (and tp!16970 tp_is_empty!4475 (array_inv!2503 (_keys!5928 thiss!1248)) (array_inv!2504 (_values!3923 thiss!1248)) e!127034))))

(declare-fun b!193065 () Bool)

(declare-fun res!91227 () Bool)

(assert (=> b!193065 (=> res!91227 e!127042)))

(assert (=> b!193065 (= res!91227 (or (not (= (size!4184 (_values!3923 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9185 thiss!1248)))) (not (= (size!4183 (_keys!5928 thiss!1248)) (size!4184 (_values!3923 thiss!1248)))) (bvslt (mask!9185 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3677 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3677 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7736 () Bool)

(assert (=> mapIsEmpty!7736 mapRes!7736))

(declare-fun b!193066 () Bool)

(declare-datatypes ((Unit!5847 0))(
  ( (Unit!5848) )
))
(declare-fun e!127037 () Unit!5847)

(declare-fun lt!96060 () Unit!5847)

(assert (=> b!193066 (= e!127037 lt!96060)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!180 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5613 V!5613 (_ BitVec 64) Int) Unit!5847)

(assert (=> b!193066 (= lt!96060 (lemmaInListMapThenSeekEntryOrOpenFindsIt!180 (_keys!5928 thiss!1248) (_values!3923 thiss!1248) (mask!9185 thiss!1248) (extraKeys!3677 thiss!1248) (zeroValue!3781 thiss!1248) (minValue!3781 thiss!1248) key!828 (defaultEntry!3940 thiss!1248)))))

(declare-fun res!91223 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193066 (= res!91223 (inRange!0 (index!4915 lt!96057) (mask!9185 thiss!1248)))))

(declare-fun e!127036 () Bool)

(assert (=> b!193066 (=> (not res!91223) (not e!127036))))

(assert (=> b!193066 e!127036))

(declare-fun b!193067 () Bool)

(assert (=> b!193067 (= e!127040 (not e!127042))))

(declare-fun res!91224 () Bool)

(assert (=> b!193067 (=> res!91224 e!127042)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193067 (= res!91224 (not (validMask!0 (mask!9185 thiss!1248))))))

(declare-datatypes ((tuple2!3544 0))(
  ( (tuple2!3545 (_1!1783 (_ BitVec 64)) (_2!1783 V!5613)) )
))
(declare-datatypes ((List!2436 0))(
  ( (Nil!2433) (Cons!2432 (h!3073 tuple2!3544) (t!7356 List!2436)) )
))
(declare-datatypes ((ListLongMap!2461 0))(
  ( (ListLongMap!2462 (toList!1246 List!2436)) )
))
(declare-fun lt!96055 () ListLongMap!2461)

(declare-fun v!309 () V!5613)

(declare-fun +!314 (ListLongMap!2461 tuple2!3544) ListLongMap!2461)

(declare-fun getCurrentListMap!894 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5613 V!5613 (_ BitVec 32) Int) ListLongMap!2461)

(assert (=> b!193067 (= (+!314 lt!96055 (tuple2!3545 key!828 v!309)) (getCurrentListMap!894 (_keys!5928 thiss!1248) (array!8198 (store (arr!3860 (_values!3923 thiss!1248)) (index!4915 lt!96057) (ValueCellFull!1894 v!309)) (size!4184 (_values!3923 thiss!1248))) (mask!9185 thiss!1248) (extraKeys!3677 thiss!1248) (zeroValue!3781 thiss!1248) (minValue!3781 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3940 thiss!1248)))))

(declare-fun lt!96056 () Unit!5847)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5613 V!5613 (_ BitVec 32) (_ BitVec 64) V!5613 Int) Unit!5847)

(assert (=> b!193067 (= lt!96056 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (_keys!5928 thiss!1248) (_values!3923 thiss!1248) (mask!9185 thiss!1248) (extraKeys!3677 thiss!1248) (zeroValue!3781 thiss!1248) (minValue!3781 thiss!1248) (index!4915 lt!96057) key!828 v!309 (defaultEntry!3940 thiss!1248)))))

(declare-fun lt!96058 () Unit!5847)

(assert (=> b!193067 (= lt!96058 e!127037)))

(declare-fun c!34814 () Bool)

(declare-fun contains!1365 (ListLongMap!2461 (_ BitVec 64)) Bool)

(assert (=> b!193067 (= c!34814 (contains!1365 lt!96055 key!828))))

(assert (=> b!193067 (= lt!96055 (getCurrentListMap!894 (_keys!5928 thiss!1248) (_values!3923 thiss!1248) (mask!9185 thiss!1248) (extraKeys!3677 thiss!1248) (zeroValue!3781 thiss!1248) (minValue!3781 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3940 thiss!1248)))))

(declare-fun b!193068 () Bool)

(declare-fun res!91225 () Bool)

(assert (=> b!193068 (=> res!91225 e!127042)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8195 (_ BitVec 32)) Bool)

(assert (=> b!193068 (= res!91225 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5928 thiss!1248) (mask!9185 thiss!1248))))))

(declare-fun b!193069 () Bool)

(declare-fun Unit!5849 () Unit!5847)

(assert (=> b!193069 (= e!127037 Unit!5849)))

(declare-fun lt!96059 () Unit!5847)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5613 V!5613 (_ BitVec 64) Int) Unit!5847)

(assert (=> b!193069 (= lt!96059 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (_keys!5928 thiss!1248) (_values!3923 thiss!1248) (mask!9185 thiss!1248) (extraKeys!3677 thiss!1248) (zeroValue!3781 thiss!1248) (minValue!3781 thiss!1248) key!828 (defaultEntry!3940 thiss!1248)))))

(assert (=> b!193069 false))

(declare-fun b!193070 () Bool)

(declare-fun res!91226 () Bool)

(assert (=> b!193070 (=> (not res!91226) (not e!127039))))

(assert (=> b!193070 (= res!91226 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193071 () Bool)

(assert (=> b!193071 (= e!127034 (and e!127035 mapRes!7736))))

(declare-fun condMapEmpty!7736 () Bool)

(declare-fun mapDefault!7736 () ValueCell!1894)

