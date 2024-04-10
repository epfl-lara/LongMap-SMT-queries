; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16534 () Bool)

(assert start!16534)

(declare-fun b!164485 () Bool)

(declare-fun b_free!3839 () Bool)

(declare-fun b_next!3839 () Bool)

(assert (=> b!164485 (= b_free!3839 (not b_next!3839))))

(declare-fun tp!14118 () Bool)

(declare-fun b_and!10253 () Bool)

(assert (=> b!164485 (= tp!14118 b_and!10253)))

(declare-fun res!77884 () Bool)

(declare-fun e!107915 () Bool)

(assert (=> start!16534 (=> (not res!77884) (not e!107915))))

(declare-datatypes ((V!4501 0))(
  ( (V!4502 (val!1865 Int)) )
))
(declare-datatypes ((ValueCell!1477 0))(
  ( (ValueCellFull!1477 (v!3730 V!4501)) (EmptyCell!1477) )
))
(declare-datatypes ((array!6379 0))(
  ( (array!6380 (arr!3025 (Array (_ BitVec 32) (_ BitVec 64))) (size!3313 (_ BitVec 32))) )
))
(declare-datatypes ((array!6381 0))(
  ( (array!6382 (arr!3026 (Array (_ BitVec 32) ValueCell!1477)) (size!3314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1862 0))(
  ( (LongMapFixedSize!1863 (defaultEntry!3373 Int) (mask!8064 (_ BitVec 32)) (extraKeys!3114 (_ BitVec 32)) (zeroValue!3216 V!4501) (minValue!3216 V!4501) (_size!980 (_ BitVec 32)) (_keys!5198 array!6379) (_values!3356 array!6381) (_vacant!980 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1862)

(declare-fun valid!829 (LongMapFixedSize!1862) Bool)

(assert (=> start!16534 (= res!77884 (valid!829 thiss!1248))))

(assert (=> start!16534 e!107915))

(declare-fun e!107917 () Bool)

(assert (=> start!16534 e!107917))

(assert (=> start!16534 true))

(declare-fun b!164480 () Bool)

(declare-fun res!77886 () Bool)

(declare-fun e!107912 () Bool)

(assert (=> b!164480 (=> (not res!77886) (not e!107912))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3028 0))(
  ( (tuple2!3029 (_1!1525 (_ BitVec 64)) (_2!1525 V!4501)) )
))
(declare-datatypes ((List!2010 0))(
  ( (Nil!2007) (Cons!2006 (h!2623 tuple2!3028) (t!6812 List!2010)) )
))
(declare-datatypes ((ListLongMap!1983 0))(
  ( (ListLongMap!1984 (toList!1007 List!2010)) )
))
(declare-fun contains!1049 (ListLongMap!1983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!665 (array!6379 array!6381 (_ BitVec 32) (_ BitVec 32) V!4501 V!4501 (_ BitVec 32) Int) ListLongMap!1983)

(assert (=> b!164480 (= res!77886 (contains!1049 (getCurrentListMap!665 (_keys!5198 thiss!1248) (_values!3356 thiss!1248) (mask!8064 thiss!1248) (extraKeys!3114 thiss!1248) (zeroValue!3216 thiss!1248) (minValue!3216 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3373 thiss!1248)) key!828))))

(declare-fun b!164481 () Bool)

(declare-fun res!77883 () Bool)

(assert (=> b!164481 (=> (not res!77883) (not e!107915))))

(assert (=> b!164481 (= res!77883 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164482 () Bool)

(declare-fun res!77880 () Bool)

(assert (=> b!164482 (=> (not res!77880) (not e!107912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6379 (_ BitVec 32)) Bool)

(assert (=> b!164482 (= res!77880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5198 thiss!1248) (mask!8064 thiss!1248)))))

(declare-fun b!164483 () Bool)

(assert (=> b!164483 (= e!107915 e!107912)))

(declare-fun res!77881 () Bool)

(assert (=> b!164483 (=> (not res!77881) (not e!107912))))

(declare-datatypes ((SeekEntryResult!417 0))(
  ( (MissingZero!417 (index!3836 (_ BitVec 32))) (Found!417 (index!3837 (_ BitVec 32))) (Intermediate!417 (undefined!1229 Bool) (index!3838 (_ BitVec 32)) (x!18237 (_ BitVec 32))) (Undefined!417) (MissingVacant!417 (index!3839 (_ BitVec 32))) )
))
(declare-fun lt!82896 () SeekEntryResult!417)

(assert (=> b!164483 (= res!77881 (and (not (is-Undefined!417 lt!82896)) (not (is-MissingVacant!417 lt!82896)) (not (is-MissingZero!417 lt!82896)) (is-Found!417 lt!82896)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6379 (_ BitVec 32)) SeekEntryResult!417)

(assert (=> b!164483 (= lt!82896 (seekEntryOrOpen!0 key!828 (_keys!5198 thiss!1248) (mask!8064 thiss!1248)))))

(declare-fun b!164484 () Bool)

(declare-fun e!107916 () Bool)

(declare-fun tp_is_empty!3641 () Bool)

(assert (=> b!164484 (= e!107916 tp_is_empty!3641)))

(declare-fun e!107914 () Bool)

(declare-fun array_inv!1939 (array!6379) Bool)

(declare-fun array_inv!1940 (array!6381) Bool)

(assert (=> b!164485 (= e!107917 (and tp!14118 tp_is_empty!3641 (array_inv!1939 (_keys!5198 thiss!1248)) (array_inv!1940 (_values!3356 thiss!1248)) e!107914))))

(declare-fun b!164486 () Bool)

(assert (=> b!164486 (= e!107912 false)))

(declare-fun lt!82897 () Bool)

(declare-datatypes ((List!2011 0))(
  ( (Nil!2008) (Cons!2007 (h!2624 (_ BitVec 64)) (t!6813 List!2011)) )
))
(declare-fun arrayNoDuplicates!0 (array!6379 (_ BitVec 32) List!2011) Bool)

(assert (=> b!164486 (= lt!82897 (arrayNoDuplicates!0 (_keys!5198 thiss!1248) #b00000000000000000000000000000000 Nil!2008))))

(declare-fun mapIsEmpty!6180 () Bool)

(declare-fun mapRes!6180 () Bool)

(assert (=> mapIsEmpty!6180 mapRes!6180))

(declare-fun b!164487 () Bool)

(declare-fun res!77885 () Bool)

(assert (=> b!164487 (=> (not res!77885) (not e!107912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164487 (= res!77885 (validMask!0 (mask!8064 thiss!1248)))))

(declare-fun mapNonEmpty!6180 () Bool)

(declare-fun tp!14117 () Bool)

(declare-fun e!107913 () Bool)

(assert (=> mapNonEmpty!6180 (= mapRes!6180 (and tp!14117 e!107913))))

(declare-fun mapValue!6180 () ValueCell!1477)

(declare-fun mapKey!6180 () (_ BitVec 32))

(declare-fun mapRest!6180 () (Array (_ BitVec 32) ValueCell!1477))

(assert (=> mapNonEmpty!6180 (= (arr!3026 (_values!3356 thiss!1248)) (store mapRest!6180 mapKey!6180 mapValue!6180))))

(declare-fun b!164488 () Bool)

(assert (=> b!164488 (= e!107913 tp_is_empty!3641)))

(declare-fun b!164489 () Bool)

(declare-fun res!77882 () Bool)

(assert (=> b!164489 (=> (not res!77882) (not e!107912))))

(assert (=> b!164489 (= res!77882 (and (= (size!3314 (_values!3356 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8064 thiss!1248))) (= (size!3313 (_keys!5198 thiss!1248)) (size!3314 (_values!3356 thiss!1248))) (bvsge (mask!8064 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3114 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3114 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164490 () Bool)

(assert (=> b!164490 (= e!107914 (and e!107916 mapRes!6180))))

(declare-fun condMapEmpty!6180 () Bool)

(declare-fun mapDefault!6180 () ValueCell!1477)

