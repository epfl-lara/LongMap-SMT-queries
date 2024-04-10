; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18752 () Bool)

(assert start!18752)

(declare-fun b!185332 () Bool)

(declare-fun b_free!4565 () Bool)

(declare-fun b_next!4565 () Bool)

(assert (=> b!185332 (= b_free!4565 (not b_next!4565))))

(declare-fun tp!16488 () Bool)

(declare-fun b_and!11163 () Bool)

(assert (=> b!185332 (= tp!16488 b_and!11163)))

(declare-fun res!87671 () Bool)

(declare-fun e!121957 () Bool)

(assert (=> start!18752 (=> (not res!87671) (not e!121957))))

(declare-datatypes ((V!5429 0))(
  ( (V!5430 (val!2213 Int)) )
))
(declare-datatypes ((ValueCell!1825 0))(
  ( (ValueCellFull!1825 (v!4122 V!5429)) (EmptyCell!1825) )
))
(declare-datatypes ((array!7879 0))(
  ( (array!7880 (arr!3721 (Array (_ BitVec 32) (_ BitVec 64))) (size!4037 (_ BitVec 32))) )
))
(declare-datatypes ((array!7881 0))(
  ( (array!7882 (arr!3722 (Array (_ BitVec 32) ValueCell!1825)) (size!4038 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2558 0))(
  ( (LongMapFixedSize!2559 (defaultEntry!3779 Int) (mask!8882 (_ BitVec 32)) (extraKeys!3516 (_ BitVec 32)) (zeroValue!3620 V!5429) (minValue!3620 V!5429) (_size!1328 (_ BitVec 32)) (_keys!5716 array!7879) (_values!3762 array!7881) (_vacant!1328 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2558)

(declare-fun valid!1055 (LongMapFixedSize!2558) Bool)

(assert (=> start!18752 (= res!87671 (valid!1055 thiss!1248))))

(assert (=> start!18752 e!121957))

(declare-fun e!121960 () Bool)

(assert (=> start!18752 e!121960))

(assert (=> start!18752 true))

(declare-fun b!185325 () Bool)

(declare-fun res!87665 () Bool)

(assert (=> b!185325 (=> (not res!87665) (not e!121957))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185325 (= res!87665 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185326 () Bool)

(declare-fun res!87667 () Bool)

(declare-fun e!121962 () Bool)

(assert (=> b!185326 (=> (not res!87667) (not e!121962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7879 (_ BitVec 32)) Bool)

(assert (=> b!185326 (= res!87667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5716 thiss!1248) (mask!8882 thiss!1248)))))

(declare-fun b!185327 () Bool)

(declare-fun res!87668 () Bool)

(assert (=> b!185327 (=> (not res!87668) (not e!121962))))

(declare-datatypes ((tuple2!3448 0))(
  ( (tuple2!3449 (_1!1735 (_ BitVec 64)) (_2!1735 V!5429)) )
))
(declare-datatypes ((List!2358 0))(
  ( (Nil!2355) (Cons!2354 (h!2987 tuple2!3448) (t!7238 List!2358)) )
))
(declare-datatypes ((ListLongMap!2365 0))(
  ( (ListLongMap!2366 (toList!1198 List!2358)) )
))
(declare-fun contains!1292 (ListLongMap!2365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!846 (array!7879 array!7881 (_ BitVec 32) (_ BitVec 32) V!5429 V!5429 (_ BitVec 32) Int) ListLongMap!2365)

(assert (=> b!185327 (= res!87668 (not (contains!1292 (getCurrentListMap!846 (_keys!5716 thiss!1248) (_values!3762 thiss!1248) (mask!8882 thiss!1248) (extraKeys!3516 thiss!1248) (zeroValue!3620 thiss!1248) (minValue!3620 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3779 thiss!1248)) key!828)))))

(declare-fun b!185328 () Bool)

(assert (=> b!185328 (= e!121957 e!121962)))

(declare-fun res!87666 () Bool)

(assert (=> b!185328 (=> (not res!87666) (not e!121962))))

(declare-datatypes ((SeekEntryResult!632 0))(
  ( (MissingZero!632 (index!4698 (_ BitVec 32))) (Found!632 (index!4699 (_ BitVec 32))) (Intermediate!632 (undefined!1444 Bool) (index!4700 (_ BitVec 32)) (x!20126 (_ BitVec 32))) (Undefined!632) (MissingVacant!632 (index!4701 (_ BitVec 32))) )
))
(declare-fun lt!91650 () SeekEntryResult!632)

(assert (=> b!185328 (= res!87666 (and (not (is-Undefined!632 lt!91650)) (not (is-MissingVacant!632 lt!91650)) (not (is-MissingZero!632 lt!91650)) (is-Found!632 lt!91650)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7879 (_ BitVec 32)) SeekEntryResult!632)

(assert (=> b!185328 (= lt!91650 (seekEntryOrOpen!0 key!828 (_keys!5716 thiss!1248) (mask!8882 thiss!1248)))))

(declare-fun mapIsEmpty!7461 () Bool)

(declare-fun mapRes!7461 () Bool)

(assert (=> mapIsEmpty!7461 mapRes!7461))

(declare-fun b!185329 () Bool)

(declare-datatypes ((List!2359 0))(
  ( (Nil!2356) (Cons!2355 (h!2988 (_ BitVec 64)) (t!7239 List!2359)) )
))
(declare-fun arrayNoDuplicates!0 (array!7879 (_ BitVec 32) List!2359) Bool)

(assert (=> b!185329 (= e!121962 (not (arrayNoDuplicates!0 (_keys!5716 thiss!1248) #b00000000000000000000000000000000 Nil!2356)))))

(declare-fun b!185330 () Bool)

(declare-fun res!87670 () Bool)

(assert (=> b!185330 (=> (not res!87670) (not e!121962))))

(assert (=> b!185330 (= res!87670 (and (= (size!4038 (_values!3762 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8882 thiss!1248))) (= (size!4037 (_keys!5716 thiss!1248)) (size!4038 (_values!3762 thiss!1248))) (bvsge (mask!8882 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3516 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3516 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185331 () Bool)

(declare-fun res!87669 () Bool)

(assert (=> b!185331 (=> (not res!87669) (not e!121962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185331 (= res!87669 (validMask!0 (mask!8882 thiss!1248)))))

(declare-fun mapNonEmpty!7461 () Bool)

(declare-fun tp!16487 () Bool)

(declare-fun e!121963 () Bool)

(assert (=> mapNonEmpty!7461 (= mapRes!7461 (and tp!16487 e!121963))))

(declare-fun mapValue!7461 () ValueCell!1825)

(declare-fun mapRest!7461 () (Array (_ BitVec 32) ValueCell!1825))

(declare-fun mapKey!7461 () (_ BitVec 32))

(assert (=> mapNonEmpty!7461 (= (arr!3722 (_values!3762 thiss!1248)) (store mapRest!7461 mapKey!7461 mapValue!7461))))

(declare-fun tp_is_empty!4337 () Bool)

(declare-fun e!121961 () Bool)

(declare-fun array_inv!2407 (array!7879) Bool)

(declare-fun array_inv!2408 (array!7881) Bool)

(assert (=> b!185332 (= e!121960 (and tp!16488 tp_is_empty!4337 (array_inv!2407 (_keys!5716 thiss!1248)) (array_inv!2408 (_values!3762 thiss!1248)) e!121961))))

(declare-fun b!185333 () Bool)

(declare-fun e!121958 () Bool)

(assert (=> b!185333 (= e!121958 tp_is_empty!4337)))

(declare-fun b!185334 () Bool)

(assert (=> b!185334 (= e!121963 tp_is_empty!4337)))

(declare-fun b!185335 () Bool)

(assert (=> b!185335 (= e!121961 (and e!121958 mapRes!7461))))

(declare-fun condMapEmpty!7461 () Bool)

(declare-fun mapDefault!7461 () ValueCell!1825)

