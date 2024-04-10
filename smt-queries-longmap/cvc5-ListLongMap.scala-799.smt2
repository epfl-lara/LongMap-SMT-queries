; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19192 () Bool)

(assert start!19192)

(declare-fun b!188805 () Bool)

(declare-fun b_free!4633 () Bool)

(declare-fun b_next!4633 () Bool)

(assert (=> b!188805 (= b_free!4633 (not b_next!4633))))

(declare-fun tp!16725 () Bool)

(declare-fun b_and!11267 () Bool)

(assert (=> b!188805 (= tp!16725 b_and!11267)))

(declare-fun b!188804 () Bool)

(declare-fun res!89254 () Bool)

(declare-fun e!124254 () Bool)

(assert (=> b!188804 (=> (not res!89254) (not e!124254))))

(declare-datatypes ((V!5521 0))(
  ( (V!5522 (val!2247 Int)) )
))
(declare-datatypes ((ValueCell!1859 0))(
  ( (ValueCellFull!1859 (v!4166 V!5521)) (EmptyCell!1859) )
))
(declare-datatypes ((array!8035 0))(
  ( (array!8036 (arr!3789 (Array (_ BitVec 32) (_ BitVec 64))) (size!4109 (_ BitVec 32))) )
))
(declare-datatypes ((array!8037 0))(
  ( (array!8038 (arr!3790 (Array (_ BitVec 32) ValueCell!1859)) (size!4110 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2626 0))(
  ( (LongMapFixedSize!2627 (defaultEntry!3851 Int) (mask!9026 (_ BitVec 32)) (extraKeys!3588 (_ BitVec 32)) (zeroValue!3692 V!5521) (minValue!3692 V!5521) (_size!1362 (_ BitVec 32)) (_keys!5814 array!8035) (_values!3834 array!8037) (_vacant!1362 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2626)

(declare-datatypes ((List!2395 0))(
  ( (Nil!2392) (Cons!2391 (h!3028 (_ BitVec 64)) (t!7295 List!2395)) )
))
(declare-fun arrayNoDuplicates!0 (array!8035 (_ BitVec 32) List!2395) Bool)

(assert (=> b!188804 (= res!89254 (arrayNoDuplicates!0 (_keys!5814 thiss!1248) #b00000000000000000000000000000000 Nil!2392))))

(declare-fun tp_is_empty!4405 () Bool)

(declare-fun e!124262 () Bool)

(declare-fun e!124255 () Bool)

(declare-fun array_inv!2453 (array!8035) Bool)

(declare-fun array_inv!2454 (array!8037) Bool)

(assert (=> b!188805 (= e!124262 (and tp!16725 tp_is_empty!4405 (array_inv!2453 (_keys!5814 thiss!1248)) (array_inv!2454 (_values!3834 thiss!1248)) e!124255))))

(declare-fun mapNonEmpty!7597 () Bool)

(declare-fun mapRes!7597 () Bool)

(declare-fun tp!16726 () Bool)

(declare-fun e!124257 () Bool)

(assert (=> mapNonEmpty!7597 (= mapRes!7597 (and tp!16726 e!124257))))

(declare-fun mapRest!7597 () (Array (_ BitVec 32) ValueCell!1859))

(declare-fun mapValue!7597 () ValueCell!1859)

(declare-fun mapKey!7597 () (_ BitVec 32))

(assert (=> mapNonEmpty!7597 (= (arr!3790 (_values!3834 thiss!1248)) (store mapRest!7597 mapKey!7597 mapValue!7597))))

(declare-datatypes ((SeekEntryResult!656 0))(
  ( (MissingZero!656 (index!4794 (_ BitVec 32))) (Found!656 (index!4795 (_ BitVec 32))) (Intermediate!656 (undefined!1468 Bool) (index!4796 (_ BitVec 32)) (x!20378 (_ BitVec 32))) (Undefined!656) (MissingVacant!656 (index!4797 (_ BitVec 32))) )
))
(declare-fun lt!93458 () SeekEntryResult!656)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!188806 () Bool)

(declare-fun e!124260 () Bool)

(assert (=> b!188806 (= e!124260 (= (select (arr!3789 (_keys!5814 thiss!1248)) (index!4795 lt!93458)) key!828))))

(declare-fun b!188807 () Bool)

(declare-fun e!124261 () Bool)

(assert (=> b!188807 (= e!124261 tp_is_empty!4405)))

(declare-fun res!89253 () Bool)

(declare-fun e!124263 () Bool)

(assert (=> start!19192 (=> (not res!89253) (not e!124263))))

(declare-fun valid!1080 (LongMapFixedSize!2626) Bool)

(assert (=> start!19192 (= res!89253 (valid!1080 thiss!1248))))

(assert (=> start!19192 e!124263))

(assert (=> start!19192 e!124262))

(assert (=> start!19192 true))

(declare-fun b!188808 () Bool)

(declare-fun e!124258 () Bool)

(assert (=> b!188808 (= e!124263 e!124258)))

(declare-fun res!89252 () Bool)

(assert (=> b!188808 (=> (not res!89252) (not e!124258))))

(assert (=> b!188808 (= res!89252 (and (not (is-Undefined!656 lt!93458)) (not (is-MissingVacant!656 lt!93458)) (not (is-MissingZero!656 lt!93458)) (is-Found!656 lt!93458)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8035 (_ BitVec 32)) SeekEntryResult!656)

(assert (=> b!188808 (= lt!93458 (seekEntryOrOpen!0 key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun b!188809 () Bool)

(assert (=> b!188809 (= e!124254 (or (bvslt (index!4795 lt!93458) #b00000000000000000000000000000000) (bvsge (index!4795 lt!93458) (size!4109 (_keys!5814 thiss!1248)))))))

(declare-fun b!188810 () Bool)

(declare-fun res!89255 () Bool)

(assert (=> b!188810 (=> (not res!89255) (not e!124254))))

(assert (=> b!188810 (= res!89255 (and (= (size!4110 (_values!3834 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9026 thiss!1248))) (= (size!4109 (_keys!5814 thiss!1248)) (size!4110 (_values!3834 thiss!1248))) (bvsge (mask!9026 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3588 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3588 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188811 () Bool)

(declare-datatypes ((Unit!5691 0))(
  ( (Unit!5692) )
))
(declare-fun e!124259 () Unit!5691)

(declare-fun Unit!5693 () Unit!5691)

(assert (=> b!188811 (= e!124259 Unit!5693)))

(declare-fun lt!93460 () Unit!5691)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!162 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5691)

(assert (=> b!188811 (= lt!93460 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!162 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> b!188811 false))

(declare-fun b!188812 () Bool)

(assert (=> b!188812 (= e!124257 tp_is_empty!4405)))

(declare-fun b!188813 () Bool)

(declare-fun lt!93459 () Unit!5691)

(assert (=> b!188813 (= e!124259 lt!93459)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5691)

(assert (=> b!188813 (= lt!93459 (lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(declare-fun res!89251 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188813 (= res!89251 (inRange!0 (index!4795 lt!93458) (mask!9026 thiss!1248)))))

(assert (=> b!188813 (=> (not res!89251) (not e!124260))))

(assert (=> b!188813 e!124260))

(declare-fun b!188814 () Bool)

(declare-fun res!89250 () Bool)

(assert (=> b!188814 (=> (not res!89250) (not e!124263))))

(assert (=> b!188814 (= res!89250 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188815 () Bool)

(declare-fun res!89257 () Bool)

(assert (=> b!188815 (=> (not res!89257) (not e!124254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8035 (_ BitVec 32)) Bool)

(assert (=> b!188815 (= res!89257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun b!188816 () Bool)

(assert (=> b!188816 (= e!124258 e!124254)))

(declare-fun res!89256 () Bool)

(assert (=> b!188816 (=> (not res!89256) (not e!124254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188816 (= res!89256 (validMask!0 (mask!9026 thiss!1248)))))

(declare-fun lt!93461 () Unit!5691)

(assert (=> b!188816 (= lt!93461 e!124259)))

(declare-fun c!33938 () Bool)

(declare-datatypes ((tuple2!3496 0))(
  ( (tuple2!3497 (_1!1759 (_ BitVec 64)) (_2!1759 V!5521)) )
))
(declare-datatypes ((List!2396 0))(
  ( (Nil!2393) (Cons!2392 (h!3029 tuple2!3496) (t!7296 List!2396)) )
))
(declare-datatypes ((ListLongMap!2413 0))(
  ( (ListLongMap!2414 (toList!1222 List!2396)) )
))
(declare-fun contains!1327 (ListLongMap!2413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!870 (array!8035 array!8037 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 32) Int) ListLongMap!2413)

(assert (=> b!188816 (= c!33938 (contains!1327 (getCurrentListMap!870 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7597 () Bool)

(assert (=> mapIsEmpty!7597 mapRes!7597))

(declare-fun b!188817 () Bool)

(assert (=> b!188817 (= e!124255 (and e!124261 mapRes!7597))))

(declare-fun condMapEmpty!7597 () Bool)

(declare-fun mapDefault!7597 () ValueCell!1859)

