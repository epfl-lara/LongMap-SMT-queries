; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16792 () Bool)

(assert start!16792)

(declare-fun b!169094 () Bool)

(declare-fun b_free!4097 () Bool)

(declare-fun b_next!4097 () Bool)

(assert (=> b!169094 (= b_free!4097 (not b_next!4097))))

(declare-fun tp!14891 () Bool)

(declare-fun b_and!10511 () Bool)

(assert (=> b!169094 (= tp!14891 b_and!10511)))

(declare-fun b!169089 () Bool)

(declare-fun e!111302 () Bool)

(declare-fun e!111301 () Bool)

(assert (=> b!169089 (= e!111302 e!111301)))

(declare-fun res!80475 () Bool)

(assert (=> b!169089 (=> (not res!80475) (not e!111301))))

(declare-datatypes ((SeekEntryResult!518 0))(
  ( (MissingZero!518 (index!4240 (_ BitVec 32))) (Found!518 (index!4241 (_ BitVec 32))) (Intermediate!518 (undefined!1330 Bool) (index!4242 (_ BitVec 32)) (x!18682 (_ BitVec 32))) (Undefined!518) (MissingVacant!518 (index!4243 (_ BitVec 32))) )
))
(declare-fun lt!84831 () SeekEntryResult!518)

(assert (=> b!169089 (= res!80475 (and (not (is-Undefined!518 lt!84831)) (not (is-MissingVacant!518 lt!84831)) (not (is-MissingZero!518 lt!84831)) (is-Found!518 lt!84831)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4845 0))(
  ( (V!4846 (val!1994 Int)) )
))
(declare-datatypes ((ValueCell!1606 0))(
  ( (ValueCellFull!1606 (v!3859 V!4845)) (EmptyCell!1606) )
))
(declare-datatypes ((array!6895 0))(
  ( (array!6896 (arr!3283 (Array (_ BitVec 32) (_ BitVec 64))) (size!3571 (_ BitVec 32))) )
))
(declare-datatypes ((array!6897 0))(
  ( (array!6898 (arr!3284 (Array (_ BitVec 32) ValueCell!1606)) (size!3572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2120 0))(
  ( (LongMapFixedSize!2121 (defaultEntry!3502 Int) (mask!8279 (_ BitVec 32)) (extraKeys!3243 (_ BitVec 32)) (zeroValue!3345 V!4845) (minValue!3345 V!4845) (_size!1109 (_ BitVec 32)) (_keys!5327 array!6895) (_values!3485 array!6897) (_vacant!1109 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2120)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6895 (_ BitVec 32)) SeekEntryResult!518)

(assert (=> b!169089 (= lt!84831 (seekEntryOrOpen!0 key!828 (_keys!5327 thiss!1248) (mask!8279 thiss!1248)))))

(declare-fun mapNonEmpty!6567 () Bool)

(declare-fun mapRes!6567 () Bool)

(declare-fun tp!14892 () Bool)

(declare-fun e!111294 () Bool)

(assert (=> mapNonEmpty!6567 (= mapRes!6567 (and tp!14892 e!111294))))

(declare-fun mapKey!6567 () (_ BitVec 32))

(declare-fun mapValue!6567 () ValueCell!1606)

(declare-fun mapRest!6567 () (Array (_ BitVec 32) ValueCell!1606))

(assert (=> mapNonEmpty!6567 (= (arr!3284 (_values!3485 thiss!1248)) (store mapRest!6567 mapKey!6567 mapValue!6567))))

(declare-fun b!169090 () Bool)

(assert (=> b!169090 (= e!111301 (not true))))

(declare-fun lt!84839 () Bool)

(declare-fun lt!84834 () array!6897)

(declare-fun valid!918 (LongMapFixedSize!2120) Bool)

(assert (=> b!169090 (= lt!84839 (valid!918 (LongMapFixedSize!2121 (defaultEntry!3502 thiss!1248) (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) (_size!1109 thiss!1248) (_keys!5327 thiss!1248) lt!84834 (_vacant!1109 thiss!1248))))))

(declare-datatypes ((tuple2!3194 0))(
  ( (tuple2!3195 (_1!1608 (_ BitVec 64)) (_2!1608 V!4845)) )
))
(declare-datatypes ((List!2178 0))(
  ( (Nil!2175) (Cons!2174 (h!2791 tuple2!3194) (t!6980 List!2178)) )
))
(declare-datatypes ((ListLongMap!2149 0))(
  ( (ListLongMap!2150 (toList!1090 List!2178)) )
))
(declare-fun lt!84838 () ListLongMap!2149)

(declare-fun contains!1132 (ListLongMap!2149 (_ BitVec 64)) Bool)

(assert (=> b!169090 (contains!1132 lt!84838 (select (arr!3283 (_keys!5327 thiss!1248)) (index!4241 lt!84831)))))

(declare-datatypes ((Unit!5233 0))(
  ( (Unit!5234) )
))
(declare-fun lt!84835 () Unit!5233)

(declare-fun lemmaValidKeyInArrayIsInListMap!143 (array!6895 array!6897 (_ BitVec 32) (_ BitVec 32) V!4845 V!4845 (_ BitVec 32) Int) Unit!5233)

(assert (=> b!169090 (= lt!84835 (lemmaValidKeyInArrayIsInListMap!143 (_keys!5327 thiss!1248) lt!84834 (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) (index!4241 lt!84831) (defaultEntry!3502 thiss!1248)))))

(declare-fun lt!84840 () ListLongMap!2149)

(assert (=> b!169090 (= lt!84840 lt!84838)))

(declare-fun getCurrentListMap!748 (array!6895 array!6897 (_ BitVec 32) (_ BitVec 32) V!4845 V!4845 (_ BitVec 32) Int) ListLongMap!2149)

(assert (=> b!169090 (= lt!84838 (getCurrentListMap!748 (_keys!5327 thiss!1248) lt!84834 (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3502 thiss!1248)))))

(declare-fun v!309 () V!4845)

(declare-fun lt!84832 () ListLongMap!2149)

(declare-fun +!242 (ListLongMap!2149 tuple2!3194) ListLongMap!2149)

(assert (=> b!169090 (= lt!84840 (+!242 lt!84832 (tuple2!3195 key!828 v!309)))))

(assert (=> b!169090 (= lt!84834 (array!6898 (store (arr!3284 (_values!3485 thiss!1248)) (index!4241 lt!84831) (ValueCellFull!1606 v!309)) (size!3572 (_values!3485 thiss!1248))))))

(declare-fun lt!84833 () Unit!5233)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!97 (array!6895 array!6897 (_ BitVec 32) (_ BitVec 32) V!4845 V!4845 (_ BitVec 32) (_ BitVec 64) V!4845 Int) Unit!5233)

(assert (=> b!169090 (= lt!84833 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!97 (_keys!5327 thiss!1248) (_values!3485 thiss!1248) (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) (index!4241 lt!84831) key!828 v!309 (defaultEntry!3502 thiss!1248)))))

(declare-fun lt!84841 () Unit!5233)

(declare-fun e!111297 () Unit!5233)

(assert (=> b!169090 (= lt!84841 e!111297)))

(declare-fun c!30427 () Bool)

(assert (=> b!169090 (= c!30427 (contains!1132 lt!84832 key!828))))

(assert (=> b!169090 (= lt!84832 (getCurrentListMap!748 (_keys!5327 thiss!1248) (_values!3485 thiss!1248) (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3502 thiss!1248)))))

(declare-fun res!80478 () Bool)

(assert (=> start!16792 (=> (not res!80478) (not e!111302))))

(assert (=> start!16792 (= res!80478 (valid!918 thiss!1248))))

(assert (=> start!16792 e!111302))

(declare-fun e!111296 () Bool)

(assert (=> start!16792 e!111296))

(assert (=> start!16792 true))

(declare-fun tp_is_empty!3899 () Bool)

(assert (=> start!16792 tp_is_empty!3899))

(declare-fun b!169091 () Bool)

(declare-fun Unit!5235 () Unit!5233)

(assert (=> b!169091 (= e!111297 Unit!5235)))

(declare-fun lt!84837 () Unit!5233)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!138 (array!6895 array!6897 (_ BitVec 32) (_ BitVec 32) V!4845 V!4845 (_ BitVec 64) Int) Unit!5233)

(assert (=> b!169091 (= lt!84837 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!138 (_keys!5327 thiss!1248) (_values!3485 thiss!1248) (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) key!828 (defaultEntry!3502 thiss!1248)))))

(assert (=> b!169091 false))

(declare-fun b!169092 () Bool)

(assert (=> b!169092 (= e!111294 tp_is_empty!3899)))

(declare-fun e!111298 () Bool)

(declare-fun b!169093 () Bool)

(assert (=> b!169093 (= e!111298 (= (select (arr!3283 (_keys!5327 thiss!1248)) (index!4241 lt!84831)) key!828))))

(declare-fun e!111300 () Bool)

(declare-fun array_inv!2111 (array!6895) Bool)

(declare-fun array_inv!2112 (array!6897) Bool)

(assert (=> b!169094 (= e!111296 (and tp!14891 tp_is_empty!3899 (array_inv!2111 (_keys!5327 thiss!1248)) (array_inv!2112 (_values!3485 thiss!1248)) e!111300))))

(declare-fun b!169095 () Bool)

(declare-fun res!80476 () Bool)

(assert (=> b!169095 (=> (not res!80476) (not e!111302))))

(assert (=> b!169095 (= res!80476 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169096 () Bool)

(declare-fun lt!84836 () Unit!5233)

(assert (=> b!169096 (= e!111297 lt!84836)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!135 (array!6895 array!6897 (_ BitVec 32) (_ BitVec 32) V!4845 V!4845 (_ BitVec 64) Int) Unit!5233)

(assert (=> b!169096 (= lt!84836 (lemmaInListMapThenSeekEntryOrOpenFindsIt!135 (_keys!5327 thiss!1248) (_values!3485 thiss!1248) (mask!8279 thiss!1248) (extraKeys!3243 thiss!1248) (zeroValue!3345 thiss!1248) (minValue!3345 thiss!1248) key!828 (defaultEntry!3502 thiss!1248)))))

(declare-fun res!80477 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!169096 (= res!80477 (inRange!0 (index!4241 lt!84831) (mask!8279 thiss!1248)))))

(assert (=> b!169096 (=> (not res!80477) (not e!111298))))

(assert (=> b!169096 e!111298))

(declare-fun b!169097 () Bool)

(declare-fun e!111299 () Bool)

(assert (=> b!169097 (= e!111299 tp_is_empty!3899)))

(declare-fun b!169098 () Bool)

(assert (=> b!169098 (= e!111300 (and e!111299 mapRes!6567))))

(declare-fun condMapEmpty!6567 () Bool)

(declare-fun mapDefault!6567 () ValueCell!1606)

