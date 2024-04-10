; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16632 () Bool)

(assert start!16632)

(declare-fun b!166105 () Bool)

(declare-fun b_free!3937 () Bool)

(declare-fun b_next!3937 () Bool)

(assert (=> b!166105 (= b_free!3937 (not b_next!3937))))

(declare-fun tp!14412 () Bool)

(declare-fun b_and!10351 () Bool)

(assert (=> b!166105 (= tp!14412 b_and!10351)))

(declare-fun b!166097 () Bool)

(declare-fun res!78914 () Bool)

(declare-fun e!108942 () Bool)

(assert (=> b!166097 (=> (not res!78914) (not e!108942))))

(declare-datatypes ((V!4633 0))(
  ( (V!4634 (val!1914 Int)) )
))
(declare-datatypes ((ValueCell!1526 0))(
  ( (ValueCellFull!1526 (v!3779 V!4633)) (EmptyCell!1526) )
))
(declare-datatypes ((array!6575 0))(
  ( (array!6576 (arr!3123 (Array (_ BitVec 32) (_ BitVec 64))) (size!3411 (_ BitVec 32))) )
))
(declare-datatypes ((array!6577 0))(
  ( (array!6578 (arr!3124 (Array (_ BitVec 32) ValueCell!1526)) (size!3412 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1960 0))(
  ( (LongMapFixedSize!1961 (defaultEntry!3422 Int) (mask!8147 (_ BitVec 32)) (extraKeys!3163 (_ BitVec 32)) (zeroValue!3265 V!4633) (minValue!3265 V!4633) (_size!1029 (_ BitVec 32)) (_keys!5247 array!6575) (_values!3405 array!6577) (_vacant!1029 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1960)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3094 0))(
  ( (tuple2!3095 (_1!1558 (_ BitVec 64)) (_2!1558 V!4633)) )
))
(declare-datatypes ((List!2079 0))(
  ( (Nil!2076) (Cons!2075 (h!2692 tuple2!3094) (t!6881 List!2079)) )
))
(declare-datatypes ((ListLongMap!2049 0))(
  ( (ListLongMap!2050 (toList!1040 List!2079)) )
))
(declare-fun contains!1082 (ListLongMap!2049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!698 (array!6575 array!6577 (_ BitVec 32) (_ BitVec 32) V!4633 V!4633 (_ BitVec 32) Int) ListLongMap!2049)

(assert (=> b!166097 (= res!78914 (not (contains!1082 (getCurrentListMap!698 (_keys!5247 thiss!1248) (_values!3405 thiss!1248) (mask!8147 thiss!1248) (extraKeys!3163 thiss!1248) (zeroValue!3265 thiss!1248) (minValue!3265 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3422 thiss!1248)) key!828)))))

(declare-fun b!166098 () Bool)

(declare-fun e!108943 () Bool)

(declare-fun tp_is_empty!3739 () Bool)

(assert (=> b!166098 (= e!108943 tp_is_empty!3739)))

(declare-fun b!166099 () Bool)

(declare-fun res!78915 () Bool)

(assert (=> b!166099 (=> (not res!78915) (not e!108942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6575 (_ BitVec 32)) Bool)

(assert (=> b!166099 (= res!78915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5247 thiss!1248) (mask!8147 thiss!1248)))))

(declare-fun b!166100 () Bool)

(declare-fun e!108941 () Bool)

(assert (=> b!166100 (= e!108941 e!108942)))

(declare-fun res!78909 () Bool)

(assert (=> b!166100 (=> (not res!78909) (not e!108942))))

(declare-datatypes ((SeekEntryResult!449 0))(
  ( (MissingZero!449 (index!3964 (_ BitVec 32))) (Found!449 (index!3965 (_ BitVec 32))) (Intermediate!449 (undefined!1261 Bool) (index!3966 (_ BitVec 32)) (x!18405 (_ BitVec 32))) (Undefined!449) (MissingVacant!449 (index!3967 (_ BitVec 32))) )
))
(declare-fun lt!83190 () SeekEntryResult!449)

(assert (=> b!166100 (= res!78909 (and (not (is-Undefined!449 lt!83190)) (not (is-MissingVacant!449 lt!83190)) (not (is-MissingZero!449 lt!83190)) (is-Found!449 lt!83190)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6575 (_ BitVec 32)) SeekEntryResult!449)

(assert (=> b!166100 (= lt!83190 (seekEntryOrOpen!0 key!828 (_keys!5247 thiss!1248) (mask!8147 thiss!1248)))))

(declare-fun mapNonEmpty!6327 () Bool)

(declare-fun mapRes!6327 () Bool)

(declare-fun tp!14411 () Bool)

(assert (=> mapNonEmpty!6327 (= mapRes!6327 (and tp!14411 e!108943))))

(declare-fun mapRest!6327 () (Array (_ BitVec 32) ValueCell!1526))

(declare-fun mapValue!6327 () ValueCell!1526)

(declare-fun mapKey!6327 () (_ BitVec 32))

(assert (=> mapNonEmpty!6327 (= (arr!3124 (_values!3405 thiss!1248)) (store mapRest!6327 mapKey!6327 mapValue!6327))))

(declare-fun mapIsEmpty!6327 () Bool)

(assert (=> mapIsEmpty!6327 mapRes!6327))

(declare-fun b!166101 () Bool)

(declare-fun res!78911 () Bool)

(assert (=> b!166101 (=> (not res!78911) (not e!108942))))

(assert (=> b!166101 (= res!78911 (and (= (size!3412 (_values!3405 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8147 thiss!1248))) (= (size!3411 (_keys!5247 thiss!1248)) (size!3412 (_values!3405 thiss!1248))) (bvsge (mask!8147 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3163 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3163 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166102 () Bool)

(assert (=> b!166102 (= e!108942 false)))

(declare-fun lt!83191 () Bool)

(declare-datatypes ((List!2080 0))(
  ( (Nil!2077) (Cons!2076 (h!2693 (_ BitVec 64)) (t!6882 List!2080)) )
))
(declare-fun arrayNoDuplicates!0 (array!6575 (_ BitVec 32) List!2080) Bool)

(assert (=> b!166102 (= lt!83191 (arrayNoDuplicates!0 (_keys!5247 thiss!1248) #b00000000000000000000000000000000 Nil!2077))))

(declare-fun b!166103 () Bool)

(declare-fun e!108944 () Bool)

(assert (=> b!166103 (= e!108944 tp_is_empty!3739)))

(declare-fun b!166104 () Bool)

(declare-fun e!108945 () Bool)

(assert (=> b!166104 (= e!108945 (and e!108944 mapRes!6327))))

(declare-fun condMapEmpty!6327 () Bool)

(declare-fun mapDefault!6327 () ValueCell!1526)

