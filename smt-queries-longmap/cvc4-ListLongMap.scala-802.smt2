; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19264 () Bool)

(assert start!19264)

(declare-fun b!189600 () Bool)

(declare-fun b_free!4655 () Bool)

(declare-fun b_next!4655 () Bool)

(assert (=> b!189600 (= b_free!4655 (not b_next!4655))))

(declare-fun tp!16798 () Bool)

(declare-fun b_and!11293 () Bool)

(assert (=> b!189600 (= tp!16798 b_and!11293)))

(declare-fun b!189593 () Bool)

(declare-fun e!124780 () Bool)

(declare-datatypes ((SeekEntryResult!667 0))(
  ( (MissingZero!667 (index!4838 (_ BitVec 32))) (Found!667 (index!4839 (_ BitVec 32))) (Intermediate!667 (undefined!1479 Bool) (index!4840 (_ BitVec 32)) (x!20433 (_ BitVec 32))) (Undefined!667) (MissingVacant!667 (index!4841 (_ BitVec 32))) )
))
(declare-fun lt!93827 () SeekEntryResult!667)

(declare-datatypes ((V!5549 0))(
  ( (V!5550 (val!2258 Int)) )
))
(declare-datatypes ((ValueCell!1870 0))(
  ( (ValueCellFull!1870 (v!4179 V!5549)) (EmptyCell!1870) )
))
(declare-datatypes ((array!8083 0))(
  ( (array!8084 (arr!3811 (Array (_ BitVec 32) (_ BitVec 64))) (size!4131 (_ BitVec 32))) )
))
(declare-datatypes ((array!8085 0))(
  ( (array!8086 (arr!3812 (Array (_ BitVec 32) ValueCell!1870)) (size!4132 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2648 0))(
  ( (LongMapFixedSize!2649 (defaultEntry!3868 Int) (mask!9057 (_ BitVec 32)) (extraKeys!3605 (_ BitVec 32)) (zeroValue!3709 V!5549) (minValue!3709 V!5549) (_size!1373 (_ BitVec 32)) (_keys!5835 array!8083) (_values!3851 array!8085) (_vacant!1373 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2648)

(assert (=> b!189593 (= e!124780 (not (and (bvsge (index!4839 lt!93827) #b00000000000000000000000000000000) (bvslt (index!4839 lt!93827) (size!4132 (_values!3851 thiss!1248))))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5549)

(declare-datatypes ((tuple2!3512 0))(
  ( (tuple2!3513 (_1!1767 (_ BitVec 64)) (_2!1767 V!5549)) )
))
(declare-datatypes ((List!2410 0))(
  ( (Nil!2407) (Cons!2406 (h!3043 tuple2!3512) (t!7314 List!2410)) )
))
(declare-datatypes ((ListLongMap!2429 0))(
  ( (ListLongMap!2430 (toList!1230 List!2410)) )
))
(declare-fun lt!93822 () ListLongMap!2429)

(declare-fun +!298 (ListLongMap!2429 tuple2!3512) ListLongMap!2429)

(declare-fun getCurrentListMap!878 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5549 V!5549 (_ BitVec 32) Int) ListLongMap!2429)

(assert (=> b!189593 (= (+!298 lt!93822 (tuple2!3513 key!828 v!309)) (getCurrentListMap!878 (_keys!5835 thiss!1248) (array!8086 (store (arr!3812 (_values!3851 thiss!1248)) (index!4839 lt!93827) (ValueCellFull!1870 v!309)) (size!4132 (_values!3851 thiss!1248))) (mask!9057 thiss!1248) (extraKeys!3605 thiss!1248) (zeroValue!3709 thiss!1248) (minValue!3709 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3868 thiss!1248)))))

(declare-datatypes ((Unit!5725 0))(
  ( (Unit!5726) )
))
(declare-fun lt!93824 () Unit!5725)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!99 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5549 V!5549 (_ BitVec 32) (_ BitVec 64) V!5549 Int) Unit!5725)

(assert (=> b!189593 (= lt!93824 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!99 (_keys!5835 thiss!1248) (_values!3851 thiss!1248) (mask!9057 thiss!1248) (extraKeys!3605 thiss!1248) (zeroValue!3709 thiss!1248) (minValue!3709 thiss!1248) (index!4839 lt!93827) key!828 v!309 (defaultEntry!3868 thiss!1248)))))

(declare-fun lt!93825 () Unit!5725)

(declare-fun e!124779 () Unit!5725)

(assert (=> b!189593 (= lt!93825 e!124779)))

(declare-fun c!34055 () Bool)

(declare-fun contains!1337 (ListLongMap!2429 (_ BitVec 64)) Bool)

(assert (=> b!189593 (= c!34055 (contains!1337 lt!93822 key!828))))

(assert (=> b!189593 (= lt!93822 (getCurrentListMap!878 (_keys!5835 thiss!1248) (_values!3851 thiss!1248) (mask!9057 thiss!1248) (extraKeys!3605 thiss!1248) (zeroValue!3709 thiss!1248) (minValue!3709 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3868 thiss!1248)))))

(declare-fun b!189595 () Bool)

(declare-fun e!124782 () Bool)

(assert (=> b!189595 (= e!124782 e!124780)))

(declare-fun res!89656 () Bool)

(assert (=> b!189595 (=> (not res!89656) (not e!124780))))

(assert (=> b!189595 (= res!89656 (and (not (is-Undefined!667 lt!93827)) (not (is-MissingVacant!667 lt!93827)) (not (is-MissingZero!667 lt!93827)) (is-Found!667 lt!93827)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8083 (_ BitVec 32)) SeekEntryResult!667)

(assert (=> b!189595 (= lt!93827 (seekEntryOrOpen!0 key!828 (_keys!5835 thiss!1248) (mask!9057 thiss!1248)))))

(declare-fun mapIsEmpty!7636 () Bool)

(declare-fun mapRes!7636 () Bool)

(assert (=> mapIsEmpty!7636 mapRes!7636))

(declare-fun b!189596 () Bool)

(declare-fun e!124774 () Bool)

(assert (=> b!189596 (= e!124774 (= (select (arr!3811 (_keys!5835 thiss!1248)) (index!4839 lt!93827)) key!828))))

(declare-fun mapNonEmpty!7636 () Bool)

(declare-fun tp!16797 () Bool)

(declare-fun e!124776 () Bool)

(assert (=> mapNonEmpty!7636 (= mapRes!7636 (and tp!16797 e!124776))))

(declare-fun mapKey!7636 () (_ BitVec 32))

(declare-fun mapRest!7636 () (Array (_ BitVec 32) ValueCell!1870))

(declare-fun mapValue!7636 () ValueCell!1870)

(assert (=> mapNonEmpty!7636 (= (arr!3812 (_values!3851 thiss!1248)) (store mapRest!7636 mapKey!7636 mapValue!7636))))

(declare-fun b!189597 () Bool)

(declare-fun e!124777 () Bool)

(declare-fun tp_is_empty!4427 () Bool)

(assert (=> b!189597 (= e!124777 tp_is_empty!4427)))

(declare-fun res!89655 () Bool)

(assert (=> start!19264 (=> (not res!89655) (not e!124782))))

(declare-fun valid!1087 (LongMapFixedSize!2648) Bool)

(assert (=> start!19264 (= res!89655 (valid!1087 thiss!1248))))

(assert (=> start!19264 e!124782))

(declare-fun e!124778 () Bool)

(assert (=> start!19264 e!124778))

(assert (=> start!19264 true))

(assert (=> start!19264 tp_is_empty!4427))

(declare-fun b!189594 () Bool)

(declare-fun Unit!5727 () Unit!5725)

(assert (=> b!189594 (= e!124779 Unit!5727)))

(declare-fun lt!93826 () Unit!5725)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5549 V!5549 (_ BitVec 64) Int) Unit!5725)

(assert (=> b!189594 (= lt!93826 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (_keys!5835 thiss!1248) (_values!3851 thiss!1248) (mask!9057 thiss!1248) (extraKeys!3605 thiss!1248) (zeroValue!3709 thiss!1248) (minValue!3709 thiss!1248) key!828 (defaultEntry!3868 thiss!1248)))))

(assert (=> b!189594 false))

(declare-fun b!189598 () Bool)

(declare-fun e!124775 () Bool)

(assert (=> b!189598 (= e!124775 (and e!124777 mapRes!7636))))

(declare-fun condMapEmpty!7636 () Bool)

(declare-fun mapDefault!7636 () ValueCell!1870)

